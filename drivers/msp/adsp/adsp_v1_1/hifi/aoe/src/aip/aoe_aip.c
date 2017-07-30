/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_common.h"
#include "hi_dsp_mem.h"
#include "hi_dsp_debug.h"
#include "hi_dsp_linear.h"
#include "hi_dsp_util.h"
#include "hi_dsp_aoe.h"
#include "hi_dsp_ringbuf.h"

#include "hi_dsp_resampler.h"

#include "aoe_aip.h"
#include "aoe_reg.h"
#include "aoe_aip_priv.h"
#include "aoe_aop.h"

#include "adsp_osal_ext.h"

#define ENA_FADE_IN
#define ENA_FADE_OUT

#define AIAOFIFO_RESIDUE_BUGFIX

static AIP_GLOBAL_SOURCE_S g_stAipRm;
static HI_VOID	  AIPResamplePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);
static HI_VOID	  AIPSpeedAdjProc(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);
static HI_VOID	  AIPGainPcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);
static HI_VOID	  AIPChannelModePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);
static HI_U32	  AIPCalcRbfInNeedBytes(AIP_STATE_S* state, HI_U32 blocksize, HI_U32* pNeedInBytes);
static HI_VOID	  AIPDestroyChn(HI_VOID* inst);
static HI_VOID	  AIPFadePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);
static HI_VOID	  AIPMutePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame);

static AIP_STATUS_E AIPGetCunrStatus(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state)
    {
	return state->CurStatus;
    }
    else
    {
	return AIP_STATUS_BUTT;
    }
}

HI_VOID AIP_GetPcmType(HI_U32 Id, AOE_AIP_TYPE_PCM_E* penPcmType)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    if (state == HI_NULL)
    {
	*penPcmType = AOE_AIP_TYPE_PCM_BUTT;
	return;
    }
    *penPcmType = state->stAttr.enPcmType;
}

static HI_S32 AIPRouteResampler(HI_U32 u32InSampleRate, HI_U32* pu32Resampler)
{
    switch (u32InSampleRate)
    {
	case 8000:
	case 11025:
	case 12000:
	case 16000:
	case 22050:
	case 24000:
	case 32000:
	case 48000:
	case 88200:
	case 96000:
	case 176400:
	case 192000:
	    *pu32Resampler = AIP_SW_RESAMPLER;
	    break;

	case 44100:
	    *pu32Resampler = AIP_SW_RESAMPLER;
	    break;

	default:  //nonstandard
	    *pu32Resampler = AIP_SW_RESAMPLER;
	    break;
    }

    return HI_SUCCESS;
}

static HI_VOID AIPUnifyPcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_U32 dstCh;
    HI_U32 dstBitDepth;
    HI_VOID* pWkbuf = HI_NULL;

    dstCh = state->stAttr.u32OutChannels;
    dstBitDepth = state->stAttr.u32OutBitPerSample;
    if (dstCh != pstFrame->u32Channels)
    {
	if (dstCh > pstFrame->u32Channels)
	{
	    pWkbuf = (HI_VOID*)AOE_GetWKBuf();
	    UTIL_UpmixPcmData(dstCh, pWkbuf, pstFrame);
	}
	else
	{
	    pWkbuf = (HI_VOID*)AOE_GetWKBuf();
	    UTIL_DownmixPcmData(dstCh, pWkbuf, pstFrame);
	}
    }

    if (dstBitDepth != pstFrame->u32BitPerSample)
    {
	pWkbuf = (HI_VOID*)AOE_GetWKBuf();
	UTIL_UnifyBitDepthPcmData(dstBitDepth, pWkbuf, pstFrame);
    }
}

static HI_VOID AIPGainPrescaleStack(UTIL_GAIN_ATTR_S* pstGain, UTIL_PRESCALE_ATTR_S* pstPrescale, UTIL_GAIN_ATTR_S* pstPrescaleGain)
{
    adsp_memcpy(pstPrescaleGain, pstGain, sizeof(UTIL_GAIN_ATTR_S));

    pstPrescaleGain->u32LGain += pstPrescale->u32PrescaleInt;
    if (pstPrescaleGain->u32LGain < AOE_VOL_BASE_VALUE)
    {
	pstPrescaleGain->u32LGain = 0;
    }
    else
    {
	pstPrescaleGain->u32LGain -= AOE_VOL_BASE_VALUE;
    }

    pstPrescaleGain->u32RGain += pstPrescale->u32PrescaleInt;
    if (pstPrescaleGain->u32RGain < AOE_VOL_BASE_VALUE)
    {
	pstPrescaleGain->u32RGain = 0;
    }
    else
    {
	pstPrescaleGain->u32RGain -= AOE_VOL_BASE_VALUE;
    }

    pstPrescaleGain->s32LDecGain += pstPrescale->s32PrescaleDec;
    pstPrescaleGain->s32RDecGain += pstPrescale->s32PrescaleDec;
}

/* After AIPUnifyPcmData, channel -> stereo */
static HI_VOID AIPGainPcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    UTIL_GAIN_ATTR_S stPrescaleGain = {0};

    AIPGainPrescaleStack(&state->stGain, &state->stPrescale, &stPrescaleGain);

    if (AOE_VOL_BASE_VALUE != stPrescaleGain.u32LGain
	|| AOE_VOL_BASE_VALUE != stPrescaleGain.u32RGain
	|| 0 != stPrescaleGain.s32LDecGain
	|| 0 != stPrescaleGain.s32RDecGain)
    {
	UTIL_LRGainProcess(pstFrame, 0, &stPrescaleGain);
    }

    return;
}

static HI_VOID AIPChannelModePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_U32 dstBitDepth;
    dstBitDepth = state->stAttr.u32OutBitPerSample;

    if (AIP_CHANNEL_MODE_STEREO == state->u32ChannelMode)  //default stereo
    {
	return;
    }
    else if (AIP_CHANNEL_MODE_BUTT > state->u32ChannelMode)
    {
	UTIL_ChannelModeProcess(pstFrame, state->u32ChannelMode, dstBitDepth);
    }
    else  //invalid  channelmode parameter
    {
	return;
    }

    return;
}

static HI_VOID AIPDrePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    if(HI_DSP_DRE_NORMAL == state->u32DreMode)
    {
	UTIL_DRE_16BIT_Process(pstFrame, &state->stDreState);
    }
}

static HI_U32  AIPCalcProcBlockSize(AIP_STATE_S* state)
{
    HI_U32 blocksize = 0;
    HI_U32 samples;
    HI_U32 framesize = UTIL_CalcFrameSize(state->stAttr.u32OutChannels, state->stAttr.u32OutBitPerSample);

    samples = (state->stAttr.u32OutSampleRate * AOE_PROCESS_PERIONDMS_DEFAULT) / 1000;

    if (48000 == state->stAttr.u32OutSampleRate)
    {
	HI_U32 u32Remainder = samples & (AOE_ENGINE_PROC_SAMPLES - 1);
	if (u32Remainder)
	{
	    samples = samples + (AOE_ENGINE_PROC_SAMPLES - u32Remainder);
	}
    }
    else
    {
	UTIL_ALIGN4(samples);
    }

    blocksize = samples * framesize;

    return blocksize;
}

static HI_U32  AIPCalcOutLatencyThdSize(AIP_STATE_S* state)
{
    HI_U32 blocksize = 0;
    HI_U32 samples;
    HI_U32 framesize = UTIL_CalcFrameSize(state->stAttr.u32OutChannels, state->stAttr.u32OutBitPerSample);

    samples = (state->stAttr.u32OutSampleRate * state->stAttr.u32OutLatencyThdMs) / 1000;

    blocksize = samples * framesize;

    return blocksize;
}

static HI_U32  AIPCheckRbfOutFree(AIP_STATE_S* state, HI_U32 blocksize)
{
    if (HI_NULL == state->hRingOut)
    {
	return 0;
    }

    if (RBUF_CheckFree(state->hRingOut, blocksize))
    {
	return blocksize;
    }
    else
    {
	return 0;
    }
}

static HI_U32	  AIPCalcRbfInNeedBytes(AIP_STATE_S* state, HI_U32 blocksize, HI_U32* pNeedInBytes)
{
    HI_U32 NeedInBytes = 0;
    HI_U32 NeedSampels = 0;
    HI_U32 SampleRate = state->stAttr.u32OutSampleRate;
    HI_U32 Channel = state->stAttr.u32OutChannels;
    HI_U32 BitWidth = state->stAttr.u32OutBitPerSample;

    if (state->stAttr.u32InDataFormat)
    {
	NeedInBytes = blocksize;
    }
    else
    {
	NeedSampels = blocksize / state->OutFrameSize;
	NeedSampels -= state->OutputLeftSamples;
	LSRC_UpdateChange(state->hADJ, (HI_S32)SampleRate, (HI_S32)SampleRate, (HI_S32)BitWidth, (HI_S32)Channel);
	LSRC_SetSpeedAdjust(state->hADJ, state->s32UserSpeedAdjust);
	NeedSampels = LSRC_GetMinInputNum(state->hADJ, NeedSampels);

	if (state->hSRC)
	{
	    NeedSampels = ResamplerGetMinInputNum(state->hSRC, NeedSampels);
	}

	UTIL_ALIGN4(NeedSampels);
	NeedInBytes = state->InFrameSize * NeedSampels;
    }

    if (RBUF_QueryBusy(state->hRingIn) < NeedInBytes)
    {
	return 0;
    }

    *pNeedInBytes = NeedInBytes;

    return NeedInBytes;
}

static HI_VOID AIPAcquireFrameFromDma(AIP_STATE_S* state, HI_U32 u32NeedSize, HI_DSP_AUDFRAME_S* pstFrame, HI_U32 *pu32Rptr)
{
    HI_VOID* u32WkAddr = AOE_GetWKBuf();

    // format frame info
    pstFrame->pDataBuf = (HI_VOID*)u32WkAddr;
    pstFrame->u32DataBytes = u32NeedSize;
    pstFrame->u32SamplesPerFrame = u32NeedSize / state->InFrameSize;
    pstFrame->u32Channels = state->stAttr.u32InChannels;
    pstFrame->u32BitPerSample = state->stAttr.u32InBitPerSample;
    pstFrame->u32SampleRate = state->stAttr.u32InSampleRate;
    pstFrame->u32DataFormat = state->stAttr.u32InDataFormat;

    // dma data, optimize DMA HW Accelerate
    (HI_VOID)RBUF_ReadDataDma(state->hRingIn, (HI_U8*)pstFrame->pDataBuf, u32NeedSize, pu32Rptr);
}

static HI_U32	AIPDmaFrame(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstInFrame)
{
    HI_U32 blocksize = state->OutBlockSize;
    HI_U32 needsize = 0;

    // check input data size
    if (!AIPCalcRbfInNeedBytes(state, blocksize, &needsize))
    {
	return 0;
    }

    // check output space
    if (!AIPCheckRbfOutFree(state, blocksize))
    {
	return 0;
    }

    AIPAcquireFrameFromDma(state, needsize, pstInFrame, HI_NULL);

    return needsize;
}

static HI_VOID AIPDmaFrame2FiFo(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_U32 left_size  = state->OutputLeftSamples * state->OutFrameSize;
    HI_U32 block_size = state->OutBlockSize;

    HI_DSP_ASSERT((pstFrame->u32DataBytes + left_size - block_size) <= AIP_MAX_BYTES_LEFT);

    // dma data to fifo
    if (left_size)
    {
	RBUF_WriteData(state->hRingOut, state->pOutputLeftBuf, left_size);
	block_size -= left_size;
    }

    if (block_size && (pstFrame->u32DataBytes < block_size))
    {
	block_size = pstFrame->u32DataBytes;
    }

    if (block_size)
    {
	RBUF_WriteData(state->hRingOut, (HI_U8*)pstFrame->pDataBuf, block_size);
    }

    // deal left data
    left_size = pstFrame->u32DataBytes - block_size;
    HI_DSP_ASSERT(left_size <= AIP_MAX_BYTES_LEFT);
    if (left_size)
    {
	adsp_memcpy(state->pOutputLeftBuf, (HI_U8*)pstFrame->pDataBuf + block_size, left_size);
    }

    state->OutputLeftSamples = left_size / state->OutFrameSize;
}

static HI_VOID	 AIPProcFrame(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    if (!state->stAttr.u32InDataFormat)
    {
	AIPUnifyPcmData(state, pstFrame);

	AIPResamplePcmData(state, pstFrame);  //AOEIMP -> multichannel resample (XA/IMEDIA/Own)

	AIPSpeedAdjProc(state, pstFrame);

	AIPDrePcmData(state, pstFrame);
	AIPGainPcmData(state, pstFrame);
	AIPChannelModePcmData(state, pstFrame);
#ifdef ENA_FADE_IN
	AIPFadePcmData(state, pstFrame);
#endif
    }

    AIPMutePcmData(state, pstFrame);
}

static HI_VOID AIPDmaLeftFrame (AIP_STATE_S* state)
{
    if (AIPCheckRbfOutFree(state, state->OutBlockSize))
    {
	TRACE_AOE_FSM(AOE_MOD_ID_AIP, state->Id, AOE_FSM_AIP_DMA_OUT);

	RBUF_WriteData(state->hRingOut, state->pOutputLeftBuf, state->OutBlockSize);

	state->OutputLeftSamples -= (state->OutBlockSize / state->OutFrameSize);
    }
}

static HI_VOID AipDupCalReadRptr(RBUF_INFO_S *pstBufInfo, HI_U32 u32SkipBytes, HI_U32 *pu32ReadRptr)
{
    if (u32SkipBytes > pstBufInfo->u32TotalFreeSize)
    {
	u32SkipBytes = pstBufInfo->u32TotalFreeSize;
    }

    if (pstBufInfo->u32ReadPtr + u32SkipBytes < pstBufInfo->u32BufSize)
    {
	*pu32ReadRptr = pstBufInfo->u32ReadPtr + u32SkipBytes;
    }
    else
    {
	*pu32ReadRptr = u32SkipBytes - (pstBufInfo->u32BufSize - pstBufInfo->u32ReadPtr);
    }

    return;
}

static HI_VOID AIPDuplicate2Aop (AIP_STATE_S* state,  HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_U32 u32ReadPtr, u32SkipBytes, framesize, NeedBytes;
    RBUF_INFO_S stBufInfo;

    if (HI_FALSE == state->bDuplicate)
    {
	if (HI_TRUE == state->bDupStart)
	{
	    state->bDupStart = HI_FALSE;
	    return;
	}
	return;
    }

    if (HI_FALSE == state->bDupStart)
    {
	framesize = UTIL_CalcFrameSize(state->stAttr.u32OutChannels, state->stAttr.u32OutBitPerSample);
	u32SkipBytes = state->u32SkipMs * state->stAttr.u32InSampleRate * framesize /1000;
	RBUF_QueryInfo(state->hRingIn, &stBufInfo);
	AipDupCalReadRptr(&stBufInfo, u32SkipBytes, &state->ReadRptr);
	state->bDupStart = HI_TRUE;
    }

    u32ReadPtr = state->ReadRptr;
    NeedBytes = state->OutBlockSize;

    if(!AOP_QueryRbfFree(state->DestAop, NeedBytes))
    {
	return;
    }

    if(NeedBytes > RBUF_QueryBusy_ProvideRptr(state->hRingIn, &u32ReadPtr))
    {
	return;
    }

    AIPAcquireFrameFromDma(state, NeedBytes, pstFrame, &u32ReadPtr);

    AIPDrePcmData(state, pstFrame);
    AIPGainPcmData(state, pstFrame);
    AIPChannelModePcmData(state, pstFrame);

    AIPMutePcmData(state, pstFrame);

    AOP_WriteRbfData(state->DestAop, pstFrame);
    state->ReadRptr = u32ReadPtr;

    return;
}

static HI_VOID AIPProcChnData(AIP_STATE_S* state)
{
    HI_U32 u32LeftSize = 0;
    HI_DSP_AUDFRAME_S stFrame;

    TRACE_AOE_FSM(AOE_MOD_ID_AIP, state->Id, AOE_FSM_AIP_DMA_IN);

    if (HI_TRUE == state->bFifoBypass)
    {
	return;
    }

    AIPDuplicate2Aop(state, &stFrame);

    u32LeftSize = state->OutputLeftSamples * state->OutFrameSize;
    if (state->OutBlockSize <= u32LeftSize)
    {
	AIPDmaLeftFrame(state);
	return;
    }

    if (AIPDmaFrame(state, &stFrame))
    {
	TRACE_AOE_FSM(AOE_MOD_ID_AIP, state->Id, AOE_FSM_AIP_PROC_DATA);
	AIPProcFrame(state, &stFrame);
	// write  data	into fifo
	TRACE_AOE_FSM(AOE_MOD_ID_AIP, state->Id, AOE_FSM_AIP_DMA_OUT);
	AIPDmaFrame2FiFo(state, &stFrame);
    }

    return;
}

HI_VOID AIPFadeoutChnData(AIP_STATE_S* state)
{
    RBUF_INFO_S stRbfFifoInfo = {0};

    RBUF_QueryInfo(state->hRingOut, &stRbfFifoInfo);
    if (HI_NULL == stRbfFifoInfo.pBasePtr)
    {
	return;
    }

    // fade out fifo data
    {
	HI_U32 u32ContiguousSamples = stRbfFifoInfo.u32ContiguousDataSize / state->stAttr.stRbfOutAttr.uFrameSize;
	HI_U32 u32TotalSamples = stRbfFifoInfo.u32TotalDataSize / state->stAttr.stRbfOutAttr.uFrameSize;

	FADE_Active(state->hFADE, FADE_STATUS_OUT, FADE_OUTRATE_DF_MS);
	FADE_Flush(state->hFADE, state->stAttr.u32OutSampleRate, state->stAttr.u32OutBitPerSample,
		   state->stAttr.u32OutChannels);
	FADE_OutProcess(state->hFADE, (HI_VOID*)(stRbfFifoInfo.pBasePtr + stRbfFifoInfo.u32ReadPtr),
		     u32ContiguousSamples);
	FADE_OutProcess(state->hFADE, (HI_VOID*)stRbfFifoInfo.pBasePtr, u32TotalSamples - u32ContiguousSamples);
    }

    return;
}

HI_S32	AIPGetRbfFiFoAttr(HI_U32 Id, AIP_CHN_ATTR_S* pstChnAttr)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    HI_U32 u32FrameSize, uLatencyMs, uLatencySize;
    RBUF_ATTR_S* pstAttr = &pstChnAttr->stRbfOutAttr;

    // check attr
    if (HI_SUCCESS != AOE_REG_ReadBitDepth(&pstChnAttr->u32OutBitPerSample, pAipReg->AIP_FIFO_ATTR.bits.fifo_precision))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadChannel(&pstChnAttr->u32OutChannels, pAipReg->AIP_FIFO_ATTR.bits.fifo_ch))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadSampelRate(&pstChnAttr->u32OutSampleRate, pAipReg->AIP_FIFO_ATTR.bits.fifo_fs))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadDataFormat(&pstChnAttr->u32OutDataFormat, pAipReg->AIP_FIFO_ATTR.bits.fifo_format))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadBufLatencyMs(&uLatencyMs, pAipReg->AIP_FIFO_ATTR.bits.fifo_latency))
    {
	return HI_FAILURE;
    }

    u32FrameSize = UTIL_CalcFrameSize(pstChnAttr->u32OutChannels, pstChnAttr->u32OutBitPerSample);
    uLatencySize = UTIL_LatencyMs2ByteSize(uLatencyMs, u32FrameSize, pstChnAttr->u32OutSampleRate);

    // Rbf(AIP Fifo)
    pstAttr->bExtMem  = HI_FALSE;     /* AIP FIFO use internal RBF instance */
    pstAttr->uBufFlag = 0;     /* allways 0 */
    pstAttr->uBufSize = uLatencySize;
    pstAttr->pBufWptr = (HI_VOID*)(&pAipReg->AIP_FIFO_WPTR);
    pstAttr->pBufRptr = (HI_VOID*)(&pAipReg->AIP_FIFO_RPTR);

    pstAttr->uFrameSize	  = u32FrameSize;
    pstAttr->uLatencyMs	  = uLatencyMs;
    pstAttr->uLatencySize = uLatencySize;
    pstChnAttr->u32OutLatencyThdMs = uLatencyMs;

    return HI_SUCCESS;
}

HI_S32	AIPGetRbfInAttr(HI_U32 Id, AIP_CHN_ATTR_S* pstChnAttr)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    HI_U32 u32FrameSize;
    RBUF_ATTR_S* pstAttr = &pstChnAttr->stRbfInAttr;

    if (HI_SUCCESS != AOE_REG_ReadBitDepth(&pstChnAttr->u32InBitPerSample, pAipReg->AIP_BUFF_ATTR.bits.aip_precision))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadChannel(&pstChnAttr->u32InChannels, pAipReg->AIP_BUFF_ATTR.bits.aip_ch))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadSampelRate(&pstChnAttr->u32InSampleRate, pAipReg->AIP_BUFF_ATTR.bits.aip_fs))
    {
	if (0x000f == pAipReg->AIP_BUFF_ATTR.bits.aip_fs)
	{
	    pstChnAttr->u32InSampleRate = pAipReg->AIP_SRC_ATTR_EXT.bits.fs_ext;
	    if ((pstChnAttr->u32InSampleRate > 192000) || (pstChnAttr->u32InSampleRate < 4000))
	    {
		HI_DSP_PRINT("invalid fs_ext(%d)\n", pstChnAttr->u32InSampleRate);
		return HI_FAILURE;
	    }

	    if ((pstChnAttr->u32InChannels > 2) || (pstChnAttr->u32InBitPerSample != 16))
	    {
		HI_DSP_PRINT("fs_ext invalid ch(%d) or bitdepth(%d)\n", pstChnAttr->u32InChannels,
			     pstChnAttr->u32InBitPerSample);
		return HI_FAILURE;
	    }
	}

    }

    if (HI_SUCCESS != AOE_REG_ReadDataFormat(&pstChnAttr->u32InDataFormat, pAipReg->AIP_BUFF_ATTR.bits.aip_format))
    {
	return HI_FAILURE;
    }

    if (!pstChnAttr->u32InDataFormat)
    {
	if (HI_SUCCESS != AOE_REG_ReadPcmType(&pstChnAttr->enPcmType, pAipReg->AIP_BUFF_ATTR.bits.aip_pcm_type))
	{
	    return HI_FAILURE;
	}
    }

    pstChnAttr->Priority = pAipReg->AIP_BUFF_ATTR.bits.aip_priority;
    // Rbf
    u32FrameSize = UTIL_CalcFrameSize(pstChnAttr->u32InChannels, pstChnAttr->u32InBitPerSample);
    pstAttr->bExtMem  = HI_TRUE; /* AIP use external RBF instance */

    ADSP_ReadAddr(pAipReg->AIP_BUF_ADDR, pstAttr->pBufAddr);

    pstAttr->uBufSize = pAipReg->AIP_BUF_SIZE.bits.buff_size;
    if (pAipReg->AIP_BUF_SIZE.bits.buff_flag)
    {
	ADSP_ReadAddr(pAipReg->AIP_BUF_WPTR, pstAttr->pBufWptr);
	ADSP_ReadAddr(pAipReg->AIP_BUF_RPTR, pstAttr->pBufRptr);
    }
    else
    {
	pstAttr->pBufWptr = (HI_VOID *)(&(pAipReg->AIP_BUF_WPTR.ADDR_LOW));
	pstAttr->pBufRptr = (HI_VOID *)(&(pAipReg->AIP_BUF_RPTR.ADDR_LOW));
    }

    pstAttr->uBufFlag = pAipReg->AIP_BUF_SIZE.bits.buff_flag;

    pstAttr->uFrameSize = u32FrameSize;
    pstAttr->uLatencyMs = 0;
    pstAttr->uLatencySize = pstAttr->uBufSize;

    //optimize, get params from reg
    pstChnAttr->u32FadeinMs  = AIP_FADE_IN_MS_DEFAULT;
    pstChnAttr->u32FadeoutMs = AIP_FADE_OUT_MS_DEFAULT;

    return HI_SUCCESS;
}

HI_S32	AIPGetChnCreateAttr(HI_U32 Id, AIP_CHN_ATTR_S* pstChnAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = AIPGetRbfInAttr(Id, pstChnAttr);
    if (HI_SUCCESS != s32Ret)
    {
	return s32Ret;
    }

    return AIPGetRbfFiFoAttr(Id, pstChnAttr);
}

HI_S32 AIPIsChnAttrChange(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    HI_S32 isChange = 0;
    AIP_CHN_ATTR_S stChnAttr;

    AIPGetChnCreateAttr(Id, &stChnAttr);
    // AIP_BUFF_ATTR + AIP_SRC_ATTR_EXT
    isChange += (HI_S32)(state->stAttr.u32InBitPerSample != stChnAttr.u32InBitPerSample);
    isChange += (HI_S32)(state->stAttr.u32InChannels != stChnAttr.u32InChannels);
    isChange += (HI_S32)(state->stAttr.u32InSampleRate != stChnAttr.u32InSampleRate);
    isChange += (HI_S32)(state->stAttr.u32InDataFormat != stChnAttr.u32InDataFormat);
    isChange += (HI_S32)(state->stAttr.enPcmType != stChnAttr.enPcmType);
    isChange += (HI_S32)(state->stAttr.Priority != stChnAttr.Priority);

    // AIP_BUF_ADDR
    isChange += (HI_S32)(state->stAttr.stRbfInAttr.pBufAddr != stChnAttr.stRbfInAttr.pBufAddr);
    // AIP_BUF_SIZE
    isChange += (HI_S32)(state->stAttr.stRbfInAttr.uBufSize != stChnAttr.stRbfInAttr.uBufSize);
    isChange += (HI_S32)(state->stAttr.stRbfInAttr.uBufFlag != stChnAttr.stRbfInAttr.uBufFlag);

    // AIP_FIFO_ATTR
    isChange += (HI_S32)(state->stAttr.u32OutBitPerSample != stChnAttr.u32OutBitPerSample);
    isChange += (HI_S32)(state->stAttr.u32OutChannels != stChnAttr.u32OutChannels);
    isChange += (HI_S32)(state->stAttr.u32OutSampleRate != stChnAttr.u32OutSampleRate);
    isChange += (HI_S32)(state->stAttr.u32OutDataFormat != stChnAttr.u32OutDataFormat);
    isChange += (HI_S32)(state->stAttr.u32OutLatencyThdMs != stChnAttr.u32OutLatencyThdMs);

    return isChange;
}

HI_VOID* AIPCreateChn(HI_U32 Id)
{
    AIP_STATE_S *state = HI_NULL;
    HI_VOID* hSRC     = HI_NULL;
    HI_VOID* hADJ     = HI_NULL;
    HI_VOID* hFade    = HI_NULL;
    HI_VOID* hRingIn  = HI_NULL;
    HI_VOID* hRingOut = HI_NULL;
    AIP_CHN_ATTR_S stAttr;
    AIP_CHN_ATTR_S* pstAttr  = &stAttr;
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    RBUF_INFO_S stRbfOut;

    if (HI_SUCCESS != AIPGetChnCreateAttr(Id, pstAttr))
    {
	return HI_NULL;
    }

    state = (AIP_STATE_S*)HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(AIP_STATE_S));
    if (!state)
    {
	goto AIP_CREATE_ERR_EXIT;
    }

    // init
    adsp_memset(state, 0, sizeof(AIP_STATE_S));
    adsp_memcpy(&state->stAttr, pstAttr, sizeof(AIP_CHN_ATTR_S));
    state->Id = Id;

    RBUF_Create_EXT(&hRingIn, &pstAttr->stRbfInAttr);
    if (HI_NULL == hRingIn)
    {
	goto AIP_CREATE_ERR_EXIT;
    }

    state->hRingIn = hRingIn;

    if (0 == pstAttr->u32InDataFormat)
    {
	RBUF_Create(&hRingOut, &pstAttr->stRbfOutAttr);
	if (HI_NULL == hRingOut)
	{
	    goto AIP_CREATE_ERR_EXIT;
	}

	state->hRingOut = hRingOut;

	// update AIP FiFo read only Reg
	RBUF_QueryInfo(hRingOut, &stRbfOut);
	pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_size = stRbfOut.u32BufSize;
    }
    else
    {
	pAipReg->AIP_FIFO_ADDR = 0;
	pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_size = 0;
    }

    state->pOutputLeftBuf = (HI_U8*)HI_ADSP_MALLOC(ADSP_ID_AOE, AIP_MAX_BYTES_LEFT);

    if (HI_NULL == state->pOutputLeftBuf)
    {
	goto AIP_CREATE_ERR_EXIT;
    }

    if (!pstAttr->u32InDataFormat)
    {
	if ((pstAttr->u32InSampleRate != pstAttr->u32OutSampleRate))
	{
	    if (HI_SUCCESS != AIPRouteResampler(pstAttr->u32InSampleRate, &state->u32ResampleId))
	    {
		goto AIP_CREATE_ERR_EXIT;
	    }

	    hSRC = ResamplerCreate((HI_S32)pstAttr->u32InSampleRate, (HI_S32)pstAttr->u32OutSampleRate,
				   (HI_S32)pstAttr->u32OutChannels, pstAttr->u32OutBitPerSample,
				   0);
	    if (HI_NULL == hSRC)
	    {
		goto AIP_CREATE_ERR_EXIT;
	    }

	    state->hSRC	 = hSRC;
	}

	LSRC_Create(&hADJ, (HI_S32)pstAttr->u32OutSampleRate, (HI_S32)pstAttr->u32OutSampleRate,
		    pstAttr->u32OutBitPerSample, pstAttr->u32OutChannels);
	if (HI_NULL == hADJ)
	{
	    goto AIP_CREATE_ERR_EXIT;
	}

	state->hADJ  = hADJ;
	pAipReg->AIP_FSADJ_CNT = 0;

	if (AOE_AIP_TYPE_PCM_ALSA != state->stAttr.enPcmType)
	{
	    FADE_Create(&hFade, (HI_S32)pstAttr->u32InSampleRate, (HI_S32)pstAttr->u32InBitPerSample,
			pstAttr->u32InChannels);
	    if (HI_NULL == hFade)
	    {
		goto AIP_CREATE_ERR_EXIT;
	    }

	    state->hFADE = hFade;
	    state->s32FadeState = 0;
	}
    }

    // volume
    state->stGain.bLinearMode = HI_FALSE;
    state->stGain.u32LGain = 0;
    state->stGain.u32RGain = 0;
    state->stDreState.s32DreThrhd = 0x100;
    state->stDreState.u32Decbps = 3;
    state->u32ChannelMode = AIP_CHANNEL_MODE_STEREO;
    state->OutBlockSize	  = AIPCalcProcBlockSize(state);
    state->OutLatencySize = AIPCalcOutLatencyThdSize(state);
    state->OutFrameSize = UTIL_CalcFrameSize(state->stAttr.u32OutChannels, state->stAttr.u32OutBitPerSample);
    state->InFrameSize = UTIL_CalcFrameSize(state->stAttr.u32InChannels, state->stAttr.u32InBitPerSample);
    state->CurStatus = AIP_STATUS_START;
    FADE_Active(state->hFADE, FADE_STATUS_IN, FADE_INRATE_DF_MS);

    return (HI_VOID*)state;

AIP_CREATE_ERR_EXIT:
    AIPDestroyChn((HI_VOID *)state);
    return HI_NULL;
}

static HI_VOID AIPDestroyChn(HI_VOID* inst)
{
    AIP_STATE_S* state;

    if (inst == HI_NULL)
    {
	return;
    }

    state = (AIP_STATE_S*)inst;
    state->CurStatus = AIP_STATUS_STOP;

    if (state->hRingIn)
    {
	RBUF_Destroy(state->hRingIn);
    }

    if (state->hRingOut)
    {
	RBUF_Destroy(state->hRingOut);
    }

    if (state->hFADE)
    {
	FADE_Destroy(state->hFADE);
    }

    if (state->hADJ)
    {
	LSRC_Destroy(state->hADJ);
    }

    if (state->hSRC)
    {
	ResamplerFree(state->hSRC);
    }

    if (state->pOutputLeftBuf)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, state->pOutputLeftBuf);
    }

    HI_ADSP_FREE(ADSP_ID_AOE, state);
}

HI_VOID AIPFlushChnCtx(AIP_STATE_S* state)
{
    // flush Resampler
    if (state->hSRC)
    {
	ResampleFlush(state->hSRC);
    }

    // flush SpeedAdj
    if (state->hADJ)
    {
	LSRC_Flush(state->hADJ);
    }

    // flush data left
    state->OutputLeftSamples = 0;

    if (state->hFADE)
    {
	FADE_Active(state->hFADE, FADE_STATUS_IN, FADE_INRATE_DF_MS);
    }
}

HI_VOID AIPFlushChnRufIn(AIP_STATE_S* state)
{
    if (state->hRingIn)
    {
	RBUF_Flush(state->hRingIn);
    }
}

HI_VOID AIPFlushChnFifo(AIP_STATE_S* state)
{
    if (state->hRingOut)
    {
	RBUF_Flush(state->hRingOut);
    }
}

HI_VOID AIPFlushChn(AIP_STATE_S* state, HI_U32 type)
{
    if (type & AIP_FLUSH_TYPE_STATE)
    {
	AIPFlushChnCtx(state);
    }

    if (type & AIP_FLUSH_TYPE_RBFIN)
    {
	AIPFlushChnRufIn(state);
    }

    if (type & AIP_FLUSH_TYPE_FIFO)
    {
	AIPFlushChnFifo(state);
    }
}

#ifdef AIAOFIFO_RESIDUE_BUGFIX
HI_VOID AIPWriteMuteFrame(AIP_STATE_S* state)
{
    HI_U32 u32Size = state->OutBlockSize;

    if (HI_NULL == state->hRingOut)
    {
	return;
    }

    if (RBUF_QueryFree(state->hRingOut) > u32Size)
    {
	RBUF_WriteData(state->hRingOut, HI_NULL, u32Size);
    }
}
#endif

static HI_VOID AIPFadePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    if (state->hFADE)
    {
	FADE_Flush(state->hFADE, pstFrame->u32SampleRate, pstFrame->u32BitPerSample, pstFrame->u32Channels);
	FADE_InProcess(state->hFADE, pstFrame->pDataBuf, pstFrame->u32SamplesPerFrame);
    }
}

static HI_VOID AIPMutePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    if (HI_TRUE == state->bMute)
    {
	adsp_memset(pstFrame->pDataBuf, 0, pstFrame->u32DataBytes);
    }
}

static HI_VOID AIPResamplePcmData(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_S32 outsamps = 0;
    HI_S32* pu32ResampeOutBuf;
    HI_U32 outRate = (HI_S32)state->stAttr.u32OutSampleRate;

    if (HI_NULL == state->hSRC)
    {
	return;
    }

    pu32ResampeOutBuf = (HI_S32*)AOE_GetWKBuf();

	{
	    outsamps = ResamplerProcessFrame(state->hSRC,
					     pstFrame->pDataBuf,
					     (HI_S32*)pu32ResampeOutBuf,
					     (HI_S32)pstFrame->u32SamplesPerFrame,
					     (HI_S32)pstFrame->u32SampleRate,
					     (HI_S32)outRate, 1);
	}

    /* after reaampler, update information */
    pstFrame->pDataBuf = (HI_VOID*)(pu32ResampeOutBuf);
    pstFrame->u32SamplesPerFrame = (HI_U32)outsamps;
    pstFrame->u32SampleRate = outRate;
    pstFrame->u32DataBytes = UTIL_CalcFrameSize(pstFrame->u32Channels,
			     pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;

}

static HI_VOID AIPSpeedAdjProc(AIP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_S32 doSRC;
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[state->Id]);

    /* LinearSRC place after resampler, inrate == outrate, just do slowly samplerate adjust */
    if (HI_NULL == state->hADJ)
    {
	return;
    }

    doSRC = LSRC_CheckDoSRC(state->hADJ);

    if (doSRC)
    {
	HI_S32 uPcmSamplesPerFrame = (HI_S32)pstFrame->u32SamplesPerFrame;
	HI_S32* pu32LinearSRC_Out = (HI_S32*)AOE_GetWKBuf();
	HI_S32 outsamps;
	outsamps = LSRC_ProcessFrame(state->hADJ, (HI_S32*)(pstFrame->pDataBuf), pu32LinearSRC_Out,
				     (HI_S32)uPcmSamplesPerFrame);

	/* after LinearSRC, update information */
	pstFrame->pDataBuf = (HI_S32*)(pu32LinearSRC_Out);
	pstFrame->u32SamplesPerFrame = (HI_U32)outsamps;
	pstFrame->u32DataBytes = UTIL_CalcFrameSize(pstFrame->u32Channels,
				 pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;
	pAipReg->AIP_FSADJ_CNT++;
    }
}

AOE_AIP_CMD_E AIPGetChnCmd(HI_U32 Id, AOE_AIP_CMD_E* newcmd)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    AOE_AIP_CMD_E eNewCmd = AOE_AIP_CMD_BUTT;

    if (!pAipReg->AIP_CTRL.bits.cmd_done)
    {
	switch (pAipReg->AIP_CTRL.bits.cmd)
	{
	    case 0x00:
		eNewCmd = AOE_AIP_CMD_START;
		break;

	    case 0x01:
		eNewCmd = AOE_AIP_CMD_STOP;
		break;

	    case 0x02:
		eNewCmd = AOE_AIP_CMD_PAUSE;
		break;

	    case 0x03:
		eNewCmd = AOE_AIP_CMD_FLUSH;
		break;

	    default:
		eNewCmd = AOE_AIP_CMD_BUTT;
		pAipReg->AIP_CTRL.bits.cmd_return_value = (HI_U32)AOE_AIP_CMD_ERR_UNKNOWCMD;
		pAipReg->AIP_CTRL.bits.cmd_done = 1;
		HI_DSP_PRINT("invalid cmd(%d)\n", pAipReg->AIP_CTRL.bits.cmd);
		break;
	}
    }

    *newcmd = eNewCmd;

    return eNewCmd;
}

HI_VOID	 AIPAckChnCmd(HI_U32 Id, AOE_AIP_CMD_RET_E Ack)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);

    if (!pAipReg->AIP_CTRL.bits.cmd_done)
    {
	/* ack cmd */
	pAipReg->AIP_CTRL.bits.cmd_return_value = (HI_U32)Ack;
	pAipReg->AIP_CTRL.bits.cmd_done = 1;
    }

    return;
}

HI_S32 IsDataEnoughForFadeout(AIP_STATE_S* state)
{
    HI_U32 FrameSize = 0;
    HI_U32 BufDelayMs = 0;
    HI_U32 FifoDelayMs = 0;
    HI_U32 u32TotalDataSize = 0;

    u32TotalDataSize = RBUF_QueryBusy(state->hRingIn);
    FrameSize = UTIL_CalcFrameSize(state->stAttr.u32InChannels , state->stAttr.u32InBitPerSample);
    BufDelayMs = UTIL_LatencyMs(u32TotalDataSize, FrameSize, state->stAttr.u32InSampleRate);

    u32TotalDataSize = RBUF_QueryBusy(state->hRingOut);
    FrameSize = UTIL_CalcFrameSize(state->stAttr.u32OutChannels , state->stAttr.u32OutBitPerSample);
    FifoDelayMs = UTIL_LatencyMs(u32TotalDataSize, FrameSize, state->stAttr.u32OutSampleRate)
		  + state->OutputLeftSamples / state->stAttr.u32OutSampleRate * 1000;

    if (AOE_PROCESS_PERIONDMS_DEFAULT > BufDelayMs
	&& AOE_PROCESS_PERIONDMS_DEFAULT > FifoDelayMs)
    {
	return 0;
    }
    else
    {
	return 1;
    }
}

HI_VOID AIPStopChnCmdProc(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);

    if (!state || !pAipReg)
    {
	return;
    }

    if (AIP_STATUS_START == state->CurStatus || AIP_STATUS_PAUSE == state->CurStatus)
    {
#ifdef ENA_FADE_OUT
	if (IsDataEnoughForFadeout(state))
	{
	    AIPFadeoutChnData(state);
	    state->bCutoff = HI_FALSE;
	}
	else
#endif
	{
	    AIPFlushChn(state, AIP_FLUSH_TYPE_FIFO);
	    state->bCutoff = HI_TRUE;
	}

	AIPFlushChn(state, AIP_FLUSH_TYPE_STATE | AIP_FLUSH_TYPE_RBFIN);

#ifdef AIAOFIFO_RESIDUE_BUGFIX
	AIPWriteMuteFrame(state);
#endif
	state->CurStatus = AIP_STATUS_STOP;
	pAipReg->AIP_FSADJ_CNT = 0;
    }

    AIPAckChnCmd(Id, AOE_AIP_CMD_DONE);

    return;
}

HI_VOID AIFlushChnCmdProc(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (!state)
    {
	return;
    }

    if (AIP_STATUS_START == state->CurStatus)
    {
#ifdef ENA_FADE_OUT
	AIPFadeoutChnData(state);
	AIPFlushChn(state, AIP_FLUSH_TYPE_STATE | AIP_FLUSH_TYPE_RBFIN);
#else
	AIPFlushChn(state, AIP_FLUSH_TYPE_STATE | AIP_FLUSH_TYPE_RBFIN | AIP_FLUSH_TYPE_FIFO);
#endif

#ifdef AIAOFIFO_RESIDUE_BUGFIX
	AIPWriteMuteFrame(state);
#endif
	FADE_Active(state->hFADE, FADE_STATUS_IN, FADE_INRATE_DF_MS);
    }

    else if (AIP_STATUS_PAUSE == state->CurStatus)
    {
	AIPFlushChn(state, AIP_FLUSH_TYPE_STATE | AIP_FLUSH_TYPE_RBFIN | AIP_FLUSH_TYPE_FIFO);
    }

    AIPAckChnCmd(Id, AOE_AIP_CMD_DONE);

    return;
}

HI_VOID AIPPauseChnCmdProc(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (!state)
    {
	return;
    }

    if (AIP_STATUS_START == state->CurStatus)
    {
	/* pause */
#ifdef ENA_FADE_OUT
	AIPFadeoutChnData(state);
#endif
	AIPFlushChn(state, AIP_FLUSH_TYPE_STATE);
	state->CurStatus = AIP_STATUS_PAUSE;
    }

    AIPAckChnCmd(Id, AOE_AIP_CMD_DONE);

    return;
}

HI_VOID AIPStartChnCmdProc(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (HI_NULL == state)
    {
	/* first start */
	g_stAipRm.hAip[Id] = AIPCreateChn(Id);
    }
    else
    {
	if (AIP_STATUS_STOP == state->CurStatus)
	{
	    /*	start again */
	    if (AIPIsChnAttrChange(Id))
	    {
		// recreate
		AIPDestroyChn(g_stAipRm.hAip[Id]);
		g_stAipRm.hAip[Id] = AIPCreateChn(Id);
	    }
	    else
	    {
		state->CurStatus = AIP_STATUS_START;
		FADE_Active(state->hFADE, FADE_STATUS_IN, FADE_INRATE_DF_MS);
	    }
	}
	else if (AIP_STATUS_PAUSE == state->CurStatus)
	{
	    state->CurStatus = AIP_STATUS_START;
	    FADE_Active(state->hFADE, FADE_STATUS_IN, FADE_INRATE_DF_MS);
	}
    }

    if (HI_NULL == g_stAipRm.hAip[Id])
    {
	AIPAckChnCmd(Id, AOE_AIP_CMD_ERR_START_FAIL);
    }
    else
    {
	AIPAckChnCmd(Id, AOE_AIP_CMD_DONE);
    }

    return;
}

static HI_VOID AIPProcChnCmd(HI_U32 Id)
{
    AOE_AIP_CMD_E newcmd;

    if (AOE_AIP_CMD_BUTT == AIPGetChnCmd(Id, &newcmd))
    {
	return;
    }

    switch (newcmd)
    {
	case AOE_AIP_CMD_START:
	    AIPStartChnCmdProc(Id);
	    break;

	case AOE_AIP_CMD_PAUSE:
	    AIPPauseChnCmdProc(Id);
	    break;

	case AOE_AIP_CMD_FLUSH:
	    AIFlushChnCmdProc(Id);
	    break;

	case AOE_AIP_CMD_STOP:
	    AIPStopChnCmdProc(Id);
	    break;

	default:
	    break;
    }

    return;
}

static HI_VOID	 AIPUpdateChnState(HI_U32 Id)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state)
    {
	//volume
	state->stGain.bLinearMode = HI_FALSE; // just support
	state->stGain.u32LGain = pAipReg->AIP_EXT_CTRL.bits.volume_l;
	state->stGain.u32RGain = pAipReg->AIP_EXT_CTRL.bits.volume_r;

	//prescale
	state->stPrescale.u32PrescaleInt = pAipReg->AIP_EXT2_CTRL.bits.prescale_int;
	if (0 == pAipReg->AIP_EXT2_CTRL.bits.prescale_dec_dir)
	{
	    state->stPrescale.s32PrescaleDec = (HI_S32)pAipReg->AIP_EXT2_CTRL.bits.prescale_dec;
	}
	else if (1 == pAipReg->AIP_EXT2_CTRL.bits.prescale_dec_dir)
	{
	    state->stPrescale.s32PrescaleDec = -((HI_S32)pAipReg->AIP_EXT2_CTRL.bits.prescale_dec);
	}

	//mute
	state->bMute = (HI_BOOL)pAipReg->AIP_EXT_CTRL.bits.mute;

	//channelMode
	state->u32ChannelMode = pAipReg->AIP_EXT_CTRL.bits.channel_mode;

	//dre
	state->u32DreMode = (HI_BOOL)pAipReg->AIP_EXT_CTRL.bits.dre;
	if(state->u32DreMode == HI_DSP_DRE_NORMAL)
	    state->stDreState.s32DreThrhd = 0x100;
	else
	    state->stDreState.s32DreThrhd = -(HI_S32)pAipReg->AIP_EXT_CTRL.bits.dre_thrhd;
	state->stDreState.u32Decbps = pAipReg->AIP_EXT_CTRL.bits.dre_dither_decbps;

	//speed adj
	if (0 == pAipReg->AIP_CTRL.bits.dst_fs_adj_dir)
	{
	    // fast
	    state->s32UserSpeedAdjust = ((HI_S32)pAipReg->AIP_CTRL.bits.dst_fs_adj_step);
	}
	else if (1 == pAipReg->AIP_CTRL.bits.dst_fs_adj_dir)
	{
	    // slow
	    state->s32UserSpeedAdjust = -((HI_S32)pAipReg->AIP_CTRL.bits.dst_fs_adj_step);
	}

	state->stAttr.Priority = (HI_BOOL)pAipReg->AIP_BUFF_ATTR.bits.aip_priority;
	state->bFifoBypass = (HI_BOOL)pAipReg->AIP_FIFO_ATTR.bits.fifo_bypass;
	state->bDuplicate = (HI_BOOL)pAipReg->AIP_EXT2_CTRL.bits.is_duplicate;
	state->DestAop = pAipReg->AIP_EXT2_CTRL.bits.dest_aop;
	state->u32SkipMs = pAipReg->AIP_EXT2_CTRL.bits.skip_ms;

    }
}

static HI_VOID AIPUpdateFifoLatency(AIP_STATE_S* state, S_AIP_REGS_TYPE* pAipReg)
{
    HI_U32 u32LatencyMs = 0, u32TotalDataSize = 0;
    u32TotalDataSize = RBUF_QueryBusy(state->hRingOut);
    u32LatencyMs = UTIL_LatencyMs(u32TotalDataSize, state->OutFrameSize,
				  state->stAttr.u32OutSampleRate);
    pAipReg->AIP_FIFO_ATTR.bits.fifo_latency_real = u32LatencyMs;
}

static HI_VOID AIPUpdateChnReg(HI_U32 Id)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    AIPUpdateFifoLatency(state, pAipReg);
}

static HI_VOID AIPProcChn(HI_U32 Id)
{
    AIP_STATE_S* state = HI_NULL;
    TRACE_AOE_FSM(AOE_MOD_ID_AIP, Id, AOE_FSM_AIP_PROC_CMD);
    AIPProcChnCmd(Id);

    state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    if (state == HI_NULL)
    {
	return;
    }

    if (AIP_STATUS_START == state->CurStatus &&
	0 == state->stAttr.u32InDataFormat)
    {
	AIPUpdateChnState(Id);
	AIPProcChnData(state);
	TRACE_AOE_FSM(AOE_MOD_ID_AIP, state->Id, AOE_FSM_AIP_IDLE);
	AIPUpdateChnReg(Id);
    }
}

static HI_VOID AIPSwResetReg(S_AIP_REGS_TYPE* pAipReg)
{
    adsp_memset(pAipReg, 0, sizeof(S_AIP_REGS_TYPE));
    pAipReg->AIP_CTRL.bits.cmd_done = 1;
    pAipReg->AIP_CTRL.bits.volume = AOE_AIP_VOL_0dB;
    pAipReg->AIP_BUFF_ATTR.bits.aip_pcm_type = AOE_AIP_TYPE_PCM_BUTT;
}

HI_VOID AIP_Init(HI_VOID * pAipRegBase)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AIP_NUM; Id++)
    {
	g_stAipRm.hwAipReg[Id] =
	    (S_AIP_REGS_TYPE*)(pAipRegBase + Id * sizeof(S_AIP_REGS_TYPE));

	AIPSwResetReg(g_stAipRm.hwAipReg[Id]);

	g_stAipRm.hAip[Id] = HI_NULL;
    }
}

HI_VOID AIP_DeInit(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AIP_NUM; Id++)
    {
	AIPDestroyChn(g_stAipRm.hAip[Id]);
	g_stAipRm.hAip[Id] = HI_NULL;
    }
}

HI_VOID AIP_Process(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AIP_NUM; Id++)
    {
	AIPProcChn(Id);
    }
}

HI_VOID AIP_GetChnStatus(HI_U32 Id, AIP_CHN_STAUTS_S* pstStatus)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	pstStatus->CurnStatus = AIP_STATUS_STOP;
	return;
    }

    pstStatus->CurnStatus = state->CurStatus;
    pstStatus->Priority = state->stAttr.Priority;
    pstStatus->bCutoff = state->bCutoff;
}

HI_VOID AIP_FlushCutoffFlag(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	return;
    }

    state->bCutoff = HI_FALSE;
}

HI_VOID AIP_QueryFiFoInfo(HI_U32 Id, RBUF_INFO_S* pstBufInfo)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	adsp_memset(pstBufInfo, 0, sizeof(RBUF_INFO_S));
	return;
    }

    if (HI_FALSE == state->bFifoBypass) // query fifo info
    {
	RBUF_QueryInfo(state->hRingOut, pstBufInfo);
    }
    else
    {
	if (AIP_STATUS_START == AIPGetCunrStatus(Id))  // query aip info when fifo bypass
	{
	    RBUF_QueryInfo(state->hRingIn, pstBufInfo);
	}
	else
	{
	    adsp_memset(pstBufInfo, 0, sizeof(RBUF_INFO_S));
	}
    }
}

HI_U32 AIP_QueryFiFoBusy(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    if (state == HI_NULL)
    {
	return 0;
    }

    if (HI_FALSE == state->bFifoBypass)
    {
	return RBUF_QueryBusy(state->hRingOut);
    }
    else
    {
	return RBUF_QueryBusy(state->hRingIn);
    }
}

HI_U32 AIP_QueryBusy(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state && state->hRingIn)
    {
	return RBUF_QueryBusy(state->hRingIn);
    }

    return 0;
}

HI_VOID AIP_ReadDataComplete(HI_U32 Id, HI_U32 amountRead)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);

    if (state == HI_NULL)
    {
	return;
    }

    if (HI_FALSE == state->bFifoBypass) // read from fifo
    {
	RBUF_ReadDataComplete(state->hRingOut, amountRead);

	AIPUpdateFifoLatency(state, pAipReg);
    }
    else // read from aip
    {
	RBUF_ReadDataComplete(state->hRingIn, amountRead);
    }
}

HI_VOID AIP_UnderFlowCalc(HI_U32 Id)
{
    S_AIP_REGS_TYPE* pAipReg = (S_AIP_REGS_TYPE*)(g_stAipRm.hwAipReg[Id]);
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	return;
    }

    pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_underflow_cnt++;
}

HI_VOID* AIP_GetRingIn(HI_U32 Id)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	return HI_NULL;
    }

    return state->hRingIn;
}

HI_VOID AIP_GetCompressInfo(HI_U32 Id, HI_U32* pu32ValidBytes, HI_U32* pu32ZeroBytes)
{
    AIP_STATE_S* state = (AIP_STATE_S*)g_stAipRm.hAip[Id];

    if (state == HI_NULL)
    {
	*pu32ValidBytes = 0;
	*pu32ZeroBytes = 0;
	return;
    }

    RBUF_GetCompressInfo(state->hRingIn, pu32ValidBytes, pu32ZeroBytes);
}
