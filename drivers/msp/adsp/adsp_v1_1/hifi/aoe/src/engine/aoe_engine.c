/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_debug.h"
#include "hi_dsp_linear.h"
#include "hi_dsp_resampler.h"
#include "hi_dsp_util.h"
#include "hi_dsp_common.h"
#include "hi_dsp_mem.h"
#include "hi_dsp_aoe.h"
#include "hi_dsp_ringbuf.h"

#include "aoe_aip.h"
#include "aoe_aop.h"
#include "aoe_reg.h"
#include "aoe_engine_priv.h"
#include "aoe_cast.h"

#include "adsp_osal_ext.h"

#define ENGINE_FLUSH_PROC_COUNT	   6
#define MIXCNT_FOR_EFFECT_FLUSH	   2
#define HIGH_PRIORITY		   1

static ENGINE_GLOBAL_SOURCE_S g_stEneRm;

static AOE_ENGINE_CMD_E ENGINE_GetChnCmd(HI_U32 Id, AOE_ENGINE_CMD_E* newcmd)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);
    AOE_ENGINE_CMD_E eNewCmd = AOE_ENGINE_CMD_BUTT;

    if (!pEneReg->ENGINE_CTRL.bits.cmd_done)
    {
	switch (pEneReg->ENGINE_CTRL.bits.cmd)
	{
	    case 0x00:
		eNewCmd = AOE_ENGINE_CMD_START;
		break;
	    case 0x01:
		eNewCmd = AOE_ENGINE_CMD_STOP;
		break;
	    default:
		eNewCmd = AOE_ENGINE_CMD_BUTT;
		pEneReg->ENGINE_CTRL.bits.cmd_return_value = (HI_U32)AOE_ENGINE_CMD_ERR_UNKNOWCMD;
		pEneReg->ENGINE_CTRL.bits.cmd_done = 1;
		HI_DSP_PRINT("invalid cmd(%d)\n", pEneReg->ENGINE_CTRL.bits.cmd);
		break;
	}
    }
    *newcmd = eNewCmd;

    return eNewCmd;
}

static HI_VOID	ENGINEAckCmd(HI_U32 Id, AOE_ENGINE_CMD_RET_E Ack)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);

    if (!pEneReg->ENGINE_CTRL.bits.cmd_done)
    {
	/* ack cmd */
	pEneReg->ENGINE_CTRL.bits.cmd_return_value = (HI_U32)Ack;
	pEneReg->ENGINE_CTRL.bits.cmd_done = 1;
    }

    return;
}

static HI_S32  ENGINEGetAefInBufAttr(HI_U32 Id, ENGINE_CHAN_ATTR_S* pstAttr)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);

    ADSP_ReadAddr(pEneReg->ENGINE_AEF_INBUF_ADDR, pstAttr->pAefInBufAddr);
    pstAttr->u32AefInBufPeriodSize = (HI_U32)pEneReg->ENGINE_AEF_INBUF_SIZE.bits.periond_size;
    pstAttr->u32AefInBufPeriondNum = (HI_U32)pEneReg->ENGINE_AEF_INBUF_SIZE.bits.periond_num;

    return HI_SUCCESS;
}

static HI_S32  ENGINEGetAefOutBufAttr(HI_U32 Id, ENGINE_CHAN_ATTR_S* pstAttr)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);

    ADSP_ReadAddr(pEneReg->ENGINE_AEF_OUTBUF_ADDR, pstAttr->pAefOutBufAddr);
    pstAttr->u32AefOutBufPeriodSize = (HI_U32)pEneReg->ENGINE_AEF_OUTBUF_SIZE.bits.periond_size;
    pstAttr->u32AefOutBufPeriondNum = (HI_U32)pEneReg->ENGINE_AEF_OUTBUF_SIZE.bits.periond_num;

    return HI_SUCCESS;
}

static HI_S32 ENGINEGetChnAttr(HI_U32 Id, ENGINE_CHAN_ATTR_S* pstAttr)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);

    adsp_memset(pstAttr, 0, sizeof(ENGINE_CHAN_ATTR_S));
    if (HI_SUCCESS != AOE_REG_ReadBitDepth(&pstAttr->u32BitPerSample, pEneReg->ENGINE_ATTR.bits.precision))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadChannel(&pstAttr->u32Channels, pEneReg->ENGINE_ATTR.bits.ch))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadSampelRate(&pstAttr->u32SampleRate, pEneReg->ENGINE_ATTR.bits.fs))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadDataFormat(&pstAttr->u32DataFormat, pEneReg->ENGINE_ATTR.bits.format))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != ENGINEGetAefInBufAttr(Id, pstAttr))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != ENGINEGetAefOutBufAttr(Id, pstAttr))
    {
	return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_U32  ENGINECalcProcBlockSize(ENGINE_STATE_S* state)
{
    HI_U32 blocksize = 0;
    HI_U32 samples;
    HI_U32 framesize = UTIL_CalcFrameSize(state->stAttr.u32Channels, state->stAttr.u32BitPerSample);

    samples = (state->stAttr.u32SampleRate * AOE_PROCESS_PERIONDMS_DEFAULT) / 1000;

    if (48000 == state->stAttr.u32SampleRate)
    {
	if (samples & (AOE_ENGINE_PROC_SAMPLES - 1))
	{
	    samples = samples + AOE_ENGINE_PROC_SAMPLES - (samples & (AOE_ENGINE_PROC_SAMPLES - 1));
	}
    }
    else
    {
	UTIL_ALIGN4(samples);
    }

    blocksize = samples * framesize;

    return blocksize;
}

static ENGINE_EFFECT_FLUSH_E  ENGINECheckEffectFlush(ENGINE_STATE_S* state)
{
    HI_U32 Aip;
    AIP_CHN_STAUTS_S status;
    HI_U32 u32StartAipMask = 0, u32StopAipMask = 0, u32StopAipNewMask = 0, u32CutoffMask = 0;

    if ((ENGINE_EFFECT_FLUSH_IMMEDIATELY == state->enFlush) || (ENGINE_EFFECT_FLUSH_LATER == state->enFlush))
    {
	return ENGINE_EFFECT_NO_FLUSH;
    }

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if ((state->AipMask) & (0x1L << Aip))
	{
	    AIP_GetChnStatus(Aip, &status);
	    if (AIP_STATUS_STOP == status.CurnStatus)
	    {
		u32StopAipMask |= (0x1L << Aip);
		if (HI_TRUE == status.bCutoff)
		{
		    u32CutoffMask |= (0x1L << Aip);
		}
	    }
	    else
	    {
		u32StartAipMask |= (0x1L << Aip);
	    }
	}
    }

    u32StopAipNewMask = u32StopAipMask - state->u32AipStopMask;
    state->u32AipStopMask = u32StopAipMask;

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if (u32CutoffMask & (0x1L << Aip))
	{
	    AIP_FlushCutoffFlag(Aip);
	}
    }

    if (u32StartAipMask)
    {
	return ENGINE_EFFECT_NO_FLUSH;
    }
    else
    {
	if (u32StopAipNewMask > u32CutoffMask)
	{
	    return ENGINE_EFFECT_FLUSH_LATER;
	}
	else
	{
	    return ENGINE_EFFECT_FLUSH_IMMEDIATELY;
	}
    }
}

static HI_S32 ENGINEInitFrameState(ENGINE_STATE_S* state)
{
    HI_VOID* pFrmBuf = HI_NULL;
    HI_U32 u32EngFrmBufSize = 0;

    if (state->stAttr.u32DataFormat)
    {
	return HI_SUCCESS;
    }

    //pcm engine
    state->stMixDmxFrm.pDataBuf		  = HI_NULL;
    state->stMixDmxFrm.u32DataBytes	  = state->BlockSize;
    state->stMixDmxFrm.u32SamplesPerFrame = state->stAttr.u32SamplePerFrame;
    state->stMixDmxFrm.u32Channels	  = state->stAttr.u32Channels;
    state->stMixDmxFrm.u32BitPerSample	  = state->stAttr.u32BitPerSample;
    state->stMixDmxFrm.u32SampleRate	  = state->stAttr.u32SampleRate;
    state->stMixDmxFrm.u32DataFormat	  = state->stAttr.u32DataFormat;

    adsp_memcpy(&state->stMixAssocFrm, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));
    adsp_memcpy(&state->stMixMcFrm, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));
    adsp_memcpy(&state->stBakMixDmxFrm, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));
    state->stMixMcFrm.u32Channels  = MIX_MC_CHN_NUM;
    state->stMixMcFrm.u32DataBytes = state->stMixMcFrm.u32SamplesPerFrame
				     * UTIL_CalcFrameSize(MIX_MC_CHN_NUM, state->stMixMcFrm.u32BitPerSample);
    adsp_memcpy(&state->stMixDmxDelayFrm, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));
    adsp_memcpy(&state->stMixAssocDelayFrm, &state->stMixAssocFrm, sizeof(HI_DSP_AUDFRAME_S));
    adsp_memcpy(&state->stMixAefFrm, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));

    /*5: dmx, assoc, aefdmx, aefassoc, aefmc + 1 : mc + 2 fifo + 1:lbr + 1+hbr*/
    u32EngFrmBufSize = state->stMixDmxFrm.u32DataBytes + state->stMixAssocFrm.u32DataBytes + state->stMixMcFrm.u32DataBytes + state->stMixDmxFrm.u32DataBytes
		       + state->stMixDmxDelayFrm.u32DataBytes + state->stMixAssocDelayFrm.u32DataBytes + state->stMixAefFrm.u32DataBytes;

    pFrmBuf = (HI_VOID*) HI_ADSP_MALLOC(ADSP_ID_AOE, u32EngFrmBufSize);
    if (pFrmBuf)
    {
	adsp_memset(pFrmBuf, 0, u32EngFrmBufSize);
	state->stMixDmxFrm.pDataBuf	   = pFrmBuf;
	state->stMixAssocFrm.pDataBuf	   = state->stMixDmxFrm.pDataBuf   + state->stMixDmxFrm.u32DataBytes;
	state->stMixMcFrm.pDataBuf	   = state->stMixAssocFrm.pDataBuf + state->stMixAssocFrm.u32DataBytes;
	state->stBakMixDmxFrm.pDataBuf	   = state->stMixMcFrm.pDataBuf + state->stMixMcFrm.u32DataBytes;

	state->stMixDmxDelayFrm.pDataBuf   = state->stBakMixDmxFrm.pDataBuf	 + state->stBakMixDmxFrm.u32DataBytes;
	state->stMixAssocDelayFrm.pDataBuf = state->stMixDmxDelayFrm.pDataBuf	+ state->stMixDmxDelayFrm.u32DataBytes;
	state->stMixAefFrm.pDataBuf	   = state->stMixAssocDelayFrm.pDataBuf + state->stMixAssocDelayFrm.u32DataBytes;
    }
    else
    {
	HI_DSP_PRINT("create engine malloc frmbuf failed!\n");
	return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_VOID EngineDeinitFrameState(ENGINE_STATE_S* state)
{
    if (state->stAttr.u32DataFormat)
    {
	return;
    }

    if (state->stMixDmxFrm.pDataBuf)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, state->stMixDmxFrm.pDataBuf);
	state->stMixDmxFrm.pDataBuf = HI_NULL;
    }

    return;
}

static HI_VOID ENGINEDestroyChn(HI_VOID* inst)
{
    ENGINE_STATE_S* state;

    if (inst == HI_NULL)
    {
	return;
    }

    state = (ENGINE_STATE_S*)inst;

    EngineDeinitFrameState(state);

    HI_ADSP_FREE(ADSP_ID_AOE, state);
}

static HI_VOID* ENGINECreateChn(HI_U32 Id)
{
    ENGINE_STATE_S* state;
    ENGINE_CHAN_ATTR_S stAttr;

    if (HI_SUCCESS != ENGINEGetChnAttr(Id, &stAttr))
    {
	return HI_NULL;
    }

    state = (ENGINE_STATE_S*) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(ENGINE_STATE_S));
    if (!state)
    {
	return HI_NULL;
    }

    // init
    adsp_memset(state, 0, sizeof(ENGINE_STATE_S));
    adsp_memcpy(&state->stAttr, &stAttr, sizeof(ENGINE_CHAN_ATTR_S));

    state->BlockSize = ENGINECalcProcBlockSize(state);
    state->FrameSize = UTIL_CalcFrameSize(state->stAttr.u32Channels, state->stAttr.u32BitPerSample);
    state->stAttr.u32SamplePerFrame = state->BlockSize / state->FrameSize;

    if (ENGINEInitFrameState(state))
    {
	HI_DSP_PRINT("malloc engine buffer failed!\n");
	goto ENGINE_CREATE_ERR;
    }

    state->CurStatus = ENGINE_STATUS_START;
    state->EngineId  = Id;

    return (HI_VOID*)state;

ENGINE_CREATE_ERR:
    ENGINEDestroyChn(state);

    return HI_NULL;
}

static HI_U32  ENGINECheckRbfInData(HI_U32 Aip, ENGINE_STATE_S* state)
{
    AOE_AIP_TYPE_PCM_E enAipType;
    HI_U32 u32BlockSize = state->BlockSize;

    if (state->stAttr.u32DataFormat)
    {
	if (AIP_QueryBusy(Aip) < u32BlockSize)
	{
	    return 0;
	}
	else
	{
	    return u32BlockSize;
	}
    }
    else
    {
	AIP_GetPcmType(Aip, &enAipType);

	if (AOE_AIP_TYPE_PCM_MC == enAipType)
	{
	    u32BlockSize = state->stMixMcFrm.u32DataBytes;
	}
	else if (AOE_AIP_TYPE_PCM_ASSOC == enAipType)
	{
	    u32BlockSize = state->stMixAssocFrm.u32DataBytes;
	}
	else
	{
	    u32BlockSize = state->stMixDmxFrm.u32DataBytes;
	}

	if (AIP_QueryFiFoBusy(Aip) < u32BlockSize)
	{
	    return 0;
	}
	else
	{
	    return u32BlockSize;
	}
    }

    return u32BlockSize;
}

static HI_BOOL	ENGINECheckRbfOutFree(HI_U32 Aop, HI_U32 blocksize)
{
    return AOP_QueryRbfFree(Aop, blocksize);
}

static HI_VOID	 ENGINEProcPopForAipStop(ENGINE_STATE_S* state)
{
    HI_U32 Aop = 0;
    ENGINE_EFFECT_FLUSH_E enFlush = ENGINE_EFFECT_FLUSH_BUTT;

    enFlush = ENGINECheckEffectFlush(state);

    if (ENGINE_EFFECT_FLUSH_IMMEDIATELY == enFlush)
    {
	state->enFlush = ENGINE_EFFECT_FLUSH_IMMEDIATELY;
    }
    else if (ENGINE_EFFECT_FLUSH_LATER == enFlush)
    {
	state->enFlush = ENGINE_EFFECT_FLUSH_LATER;
	state->CntForFlush = 0;
    }

    if ((ENGINE_EFFECT_FLUSH_IMMEDIATELY == state->enFlush) || ((ENGINE_EFFECT_FLUSH_LATER == state->enFlush) && (MIXCNT_FOR_EFFECT_FLUSH == state->CntForFlush)))
    {

	for (Aop = 0; Aop < AOE_MAX_AOP_NUM; Aop++)
	{
	    if (((state->AopHiPriorityMask) & (0x1L << Aop)) || ((state->AopLoPriorityMask) & (0x1L << Aop)))
	    {
		//AOP_Flush(Aop);
	    }
	}
	state->enFlush = ENGINE_EFFECT_NO_FLUSH;
	state->CntForFlush = 0;
    }

    return;
}

static HI_VOID	ENGINEMixData(ENGINE_STATE_S* state, HI_U32 Aip, HI_U8* pDataBuf)
{
    RBUF_INFO_S stRbfIn = {0};
    HI_U32 Ch	    = state->stAttr.u32Channels;
    HI_U32 BitDepth = state->stAttr.u32BitPerSample;
    HI_U32 TailBytes;
    HI_U32 samples;

    AIP_QueryFiFoInfo(Aip, &stRbfIn);
    TailBytes = stRbfIn.u32ContiguousDataSize;

    if (stRbfIn.u32TotalDataSize >= state->BlockSize)
    {
	if (TailBytes < state->BlockSize)
	{
	    samples = (TailBytes / state->FrameSize) * Ch;
	    UTIL_MixerPro ((HI_VOID*)pDataBuf, (HI_VOID*)(stRbfIn.u32ReadPtr + stRbfIn.pBasePtr), samples, BitDepth);
	    samples = ((state->BlockSize - TailBytes) / state->FrameSize) * Ch;
	    UTIL_MixerPro ((HI_VOID*)(pDataBuf + TailBytes), (HI_VOID*)stRbfIn.pBasePtr, samples, BitDepth);
	}
	else
	{
	    samples = (state->BlockSize / state->FrameSize) * Ch;
	    UTIL_MixerPro ((HI_VOID*)pDataBuf, (HI_VOID*)(stRbfIn.u32ReadPtr + stRbfIn.pBasePtr), samples, BitDepth);
	}
	AIP_ReadDataComplete(Aip, state->BlockSize);
    }
#ifdef ENA_ENGINE_PROC
    else
    {
	AIP_CHN_STAUTS_S stChnStatus;
	AIP_GetChnStatus(Aip, &stChnStatus);
	if (AIP_STATUS_START == stChnStatus.CurnStatus)
	{
	    AIP_UnderFlowCalc(Aip);
	}
    }
#endif
}

HI_VOID UTIL_MixerMcPro (HI_VOID* pMixBuf, HI_VOID* pInBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;

    // optimize, �����Ż�
    if (!samples)
    {
	return;
    }

    if (16 == uBitDepth)
    {
	HI_S16 data;
	HI_S16* ps16In, *ps16Out;
	ps16In	= (HI_S16*)pInBuf;
	ps16Out = (HI_S16*)pMixBuf;
	for (i = 0; i < samples; i++)
	{
	    data = *ps16In;
	    *ps16Out = data;
	    ps16Out++;
	    ps16In++;
	}

	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 data;
	HI_S32* ps32In, *ps32Out;
	ps32In	= (HI_S32*)pInBuf;
	ps32Out = (HI_S32*)pMixBuf;
	for (i = 0; i < samples; i++)
	{
	    data = *ps32In;
	    *ps32Out = data;
	    ps32Out++;
	    ps32In++;
	}

	return;
    }
}

static HI_S32	ENGINEMcMixData(ENGINE_STATE_S* state, HI_U32 Aip, HI_U8* pDataBuf, HI_BOOL bMcSupport)
{
    RBUF_INFO_S stRbfIn = {0};
    HI_U32 Ch	    = state->stMixMcFrm.u32Channels;
    HI_U32 BitDepth = state->stAttr.u32BitPerSample;
    HI_U32 TailBytes;
    HI_U32 samples;
    HI_U32 FrameSize;

    FrameSize = UTIL_CalcFrameSize(MIX_MC_CHN_NUM, state->stMixMcFrm.u32BitPerSample);

    AIP_QueryFiFoInfo(Aip, &stRbfIn);
    TailBytes = stRbfIn.u32ContiguousDataSize;
    if (stRbfIn.u32TotalDataSize >= state->stMixMcFrm.u32DataBytes)
    {
	if (bMcSupport)
	{
	    if (TailBytes < state->stMixMcFrm.u32DataBytes)
	    {
		samples = (TailBytes / FrameSize) * Ch;
		UTIL_MixerMcPro ((HI_VOID*)pDataBuf, (HI_VOID*)(stRbfIn.u32ReadPtr + stRbfIn.pBasePtr), samples, BitDepth);
		samples = ((state->stMixMcFrm.u32DataBytes - TailBytes) / FrameSize) * Ch;
		UTIL_MixerMcPro ((HI_VOID*)(pDataBuf + TailBytes), (HI_VOID*)stRbfIn.pBasePtr, samples, BitDepth);
	    }
	    else
	    {
		samples = (state->stMixMcFrm.u32DataBytes / FrameSize) * Ch;
		UTIL_MixerMcPro ((HI_VOID*)pDataBuf, (HI_VOID*)(stRbfIn.u32ReadPtr + stRbfIn.pBasePtr), samples, BitDepth);
	    }
	}

	AIP_ReadDataComplete(Aip, state->stMixMcFrm.u32DataBytes);
    }
    else
    {
	AIP_CHN_STAUTS_S stChnStatus;
	AIP_GetChnStatus(Aip, &stChnStatus);
	if (AIP_STATUS_START == stChnStatus.CurnStatus)
	{
	    AIP_UnderFlowCalc(Aip);
	}
    }

    return HI_SUCCESS;
}

static HI_VOID	 ENGINEFirstMixFrame(ENGINE_STATE_S* state)
{
    HI_U32 Aip = 0;
    AOE_AIP_TYPE_PCM_E enAipType = AOE_AIP_TYPE_PCM_BUTT;
    if (state->stAttr.u32DataFormat)
    {
	return;
    }
    else
    {
	adsp_memset(state->stMixDmxFrm.pDataBuf, 0, state->stMixDmxFrm.u32DataBytes);
    }

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if ((state->AipMask) & (0x1L << Aip))
	{
	    if (state->stAttr.u32DataFormat)
	    {
		break;
	    }
	    else
	    {
		AIP_GetPcmType(Aip, &enAipType);
		//first mixer only for alsa aip and slave aip
		if ((enAipType == AOE_AIP_TYPE_PCM_ALSA) || (enAipType == AOE_AIP_TYPE_PCM_SLAVE))
		{
		    ENGINEMixData(state, Aip, state->stMixDmxFrm.pDataBuf);
		}
	    }
	}
    }
}

static HI_VOID ENGINESecondMixFrame(ENGINE_STATE_S* state)
{
    HI_U32 Aip = 0;
    AOE_AIP_TYPE_PCM_E enAipType = AOE_AIP_TYPE_PCM_BUTT;

    if (state->stAttr.u32DataFormat)
    {
	return;
    }

    state->bMixMcFrm = HI_FALSE;

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if ((state->AipMask) & (0x1L << Aip))
	{
	    AIP_GetPcmType(Aip, &enAipType);
	    if (AOE_AIP_TYPE_PCM_MC == enAipType)
	    {
		adsp_memcpy(state->stMixMcFrm.pDataBuf, state->stMixDmxFrm.pDataBuf, state->stMixDmxFrm.u32DataBytes);
		ENGINEMcMixData(state, Aip, state->stMixMcFrm.pDataBuf, state->bSupportMc);
		state->bMixMcFrm = HI_TRUE;
		break;
	    }
	}
    }

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if ((state->AipMask) & (0x1L << Aip))
	{
	    AIP_GetPcmType(Aip, &enAipType);

	    if (AOE_AIP_TYPE_PCM_DMX == enAipType)
	    {
		ENGINEMixData(state, Aip, state->stMixDmxFrm.pDataBuf);
		break;
	    }
	}
    }

    /*wait for dmx finish*/
    state->bMixAssocFrm = HI_FALSE;
    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if ((state->AipMask) & (0x1L << Aip))
	{
	    AIP_GetPcmType(Aip, &enAipType);

	    if (AOE_AIP_TYPE_PCM_ASSOC == enAipType)
	    {
		adsp_memcpy(state->stMixAssocFrm.pDataBuf, state->stMixDmxFrm.pDataBuf, state->stMixDmxFrm.u32DataBytes);
		ENGINEMixData(state, Aip, state->stMixAssocFrm.pDataBuf);
		state->bMixAssocFrm = HI_TRUE;
		break;
	    }
	}
    }

    return;
}

static HI_VOID ENGINEMixFrame(ENGINE_STATE_S* state)
{
    //first mixer only for alsa aip and slave aip
    ENGINEFirstMixFrame(state);
    ENGINESecondMixFrame(state);

    if (ENGINE_EFFECT_FLUSH_LATER == state->enFlush)
    {
	state->CntForFlush++;
    }
}

static HI_VOID	 ENGINEOutFrame(ENGINE_STATE_S* state)
{
    HI_U32 Aop;
    AOP_CHN_STAUTS_S AopStatus;
    HI_U32 PriorityMaskTab[2];
    HI_U32 Priority, PriorityMask;
    HI_DSP_AUDFRAME_S stEngOutFrame;

    PriorityMaskTab[0] = state->AopHiPriorityMask;
    PriorityMaskTab[1] = state->AopLoPriorityMask;

    if (state->stAttr.u32DataFormat)
    {
	return;
    }

    for (Priority = 0; Priority < 2; Priority++)
    {
	PriorityMask = PriorityMaskTab[Priority];
	if (!PriorityMask)
	{
	    continue;
	}

	for (Aop = 0; Aop < AOE_MAX_AOP_NUM; Aop++)
	{
	    if (!((PriorityMask) & (0x1L << Aop)))
	    {
		continue;
	    }

	    AOP_WriteBuffProcTryCnt(Aop);
	    AOP_GetChnStatus(Aop, &AopStatus);
	    if (!((state->AopBufFreeFlag) & (0x1L << Aop)))
	    {
		continue;
	    }

	    AOP_WriteBuffProcOKCnt(Aop);

	    if (state->AefMask && (HI_FALSE == AopStatus.bBypass))
	    {
		adsp_memcpy(&stEngOutFrame, &state->stMixAefFrm, sizeof(HI_DSP_AUDFRAME_S));
	    }
	    else if (AopStatus.bAdEnable && state->bMixAssocFrm)
	    {
		adsp_memcpy(&stEngOutFrame, &state->stMixAssocFrm, sizeof(HI_DSP_AUDFRAME_S));
	    }
	    else
	    {
		adsp_memcpy(&stEngOutFrame, &state->stMixDmxFrm, sizeof(HI_DSP_AUDFRAME_S));
	    }

	    (HI_VOID)AOP_WriteRbfData(Aop, &stEngOutFrame);
	    AOP_ProcDelayCompensation(Aop);
	}
    }
}

static HI_S32  ENGINECheckAipData(ENGINE_STATE_S* state)
{
    HI_U32 PriorityMaskTab[2];
    HI_U32 Priority, PriorityMask, BufFreeFlag;
    HI_U32 Flag = 0;
    HI_U32 Aip;

    PriorityMaskTab[0] = state->AipHiPriorityMask;
    PriorityMaskTab[1] = state->AipLoPriorityMask;
    BufFreeFlag = state->AipBufDataFlag;

    if ((PriorityMaskTab[0]) && (PriorityMaskTab[1]))
    {
	for (Priority = 0; Priority < 2; Priority++)
	{
	    PriorityMask = PriorityMaskTab[Priority];
	    if (!PriorityMask)
	    {
		continue;
	    }

	    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
	    {
		if (!((PriorityMask) & (0x1L << Aip)))
		{
		    continue;
		}

		if ((BufFreeFlag & (0x1L << Aip)))
		{
		    Flag |= ((HI_U32)1L) << Priority;
		}
		else
		{
		    Flag &= ~(((HI_U32)1L) << Priority);
		    break;
		}
	    }

	}

	return (Flag & 1);
    }
    else
    {

#ifdef AOE_UT_BASEON_CAST
	if (!BufFreeFlag)
	{
	    return 0;
	}

	for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
	{
	    if ((state->AipMask) & (0x1L << Aip))
	    {
		if ( !(BufFreeFlag & (0x1L << Aip)) )
		{
		    return 0;
		}
	    }
	}

	return 1;
#else
	return (BufFreeFlag ? 1 : 0);
#endif
    }
}

// check output space Mechanism
static HI_S32  ENGINECheckAopSpace(ENGINE_STATE_S* state)
{
    HI_U32 PriorityMaskTab[2];
    HI_U32 Priority, PriorityMask, BufFreeFlag;
    HI_U32 Flag = 0;
    HI_U32 Aop;

    PriorityMaskTab[0] = state->AopHiPriorityMask;
    PriorityMaskTab[1] = state->AopLoPriorityMask;
    BufFreeFlag = state->AopBufFreeFlag;

    if (!BufFreeFlag)
    {
	return 0;
    }

    for (Priority = 0; Priority < 2; Priority++)
    {
	PriorityMask = PriorityMaskTab[Priority];
	if (!PriorityMask)
	{
	    continue;
	}

	for (Aop = 0; Aop < AOE_MAX_AOP_NUM; Aop++)
	{
	    if (!((PriorityMask) & (0x1L << Aop)))
	    {
		continue;
	    }

	    if (BufFreeFlag & (0x1L << Aop))
	    {
		Flag |= ((HI_U32)1L) << Priority;
	    }
	    else
	    {
		Flag &= ~(((HI_U32)1L) << Priority);
		break;
	    }
	}
    }

    if (state->AopHiPriorityMask)
    {
	return (Flag & 1);
    }
    else if (state->AopLoPriorityMask)
    {
	return (Flag & 2);
    }

    return 0;
}

static HI_VOID	 ENGINEOutRawFrame(HI_U32 Aip, HI_U32 Aop, HI_U32 BlockSize)
{
    HI_VOID* hRingIn;
    HI_VOID* hRingOut;

    hRingIn = AIP_GetRingIn(Aip);
    hRingOut = AOP_GetRingOut(Aop);

    if (hRingIn && hRingOut)
    {
	RBUF_CopyData(hRingIn, hRingOut, BlockSize, ADSP_MEMCPY_ARM2ARM);
    }
}

static HI_VOID	 ENGINEOutZeroFrame(HI_U32 Aop, HI_U32 BlockSize)
{
    HI_VOID* hRingOut;

    hRingOut = AOP_GetRingOut(Aop);

    if (hRingOut)
    {
	RBUF_WriteDataDma(hRingOut, HI_NULL, BlockSize);
    }
}

static HI_VOID ENGINEProcRawData(ENGINE_STATE_S* state)
{
    HI_U32 u32ValidBytes = 0;
    HI_U32 u32ZeroBytes = 0;
    HI_U32 u32Len = 0;
    HI_U32 Aip;
    HI_U32 Aop;
    AIP_CHN_STAUTS_S status;

    for (Aop = 0; Aop < AOE_MAX_AOP_NUM; Aop++)
    {
	if (state->AopMask & (0x1L << Aop))
	{
	    break;
	}
    }

    for (Aip = 0; Aip < AOE_MAX_AIP_NUM; Aip++)
    {
	if (state->AipMask & (0x1L << Aip))
	{
	    break;
	}
    }

    if (Aip == AOE_MAX_AOP_NUM || Aop == AOE_MAX_AIP_NUM)
    {
	return;
    }

    AIP_GetChnStatus(Aip, &status);
    if (status.CurnStatus == AIP_STATUS_STOP)
    {
	state->stAttr.u32ValidBytes = 0;
	state->stAttr.u32ZeroBytes = 0;
    }

    if (AOE_FORMAT_IEC61937_COMP == state->stAttr.u32DataFormat)
    {
	if (!(ENGINECheckAopSpace(state) && AIP_STATUS_START == status.CurnStatus))
	{
	    return;
	}

	u32ValidBytes = state->stAttr.u32ValidBytes;
	u32ZeroBytes = state->stAttr.u32ZeroBytes;
	if (0 == u32ValidBytes && 0 == u32ZeroBytes)
	{
	    if (AIP_QueryBusy(Aip) < 4)//(ENGINECheckAipData(state))
	    {
		return;
	    }
	    AIP_GetCompressInfo(Aip, &u32ValidBytes, &u32ZeroBytes);
	    if (0 == u32ValidBytes && 0 == u32ZeroBytes)
	    {
		RBUF_Flush(AIP_GetRingIn(Aip));
	    }
	    state->stAttr.u32ValidBytes = u32ValidBytes;
	    state->stAttr.u32ZeroBytes = u32ZeroBytes;
	}

	if (u32ValidBytes != 0)
	{
	    if (u32ValidBytes >= state->BlockSize)
	    {
		u32Len = state->BlockSize;
		if (0 == ENGINECheckAipData(state))
		{
		    return;
		}
	    }
	    else
	    {
		u32Len = u32ValidBytes;
		if (AIP_QueryBusy(Aip) < u32Len)
		{
		    return;
		}
	    }

	    ENGINEOutRawFrame(Aip, Aop, u32Len);
	    u32ValidBytes -= u32Len;

	    if (0 == u32ValidBytes && u32Len < state->BlockSize)
	    {
		u32Len = state->BlockSize - u32Len;
		if (u32ZeroBytes >= u32Len)
		{
		    ENGINEOutZeroFrame(Aop, u32Len);
		    u32ZeroBytes -= u32Len;
		}
	    }

	    AOP_ProcDelayCompensation(Aop);

	}
	else if (0 != u32ZeroBytes)
	{
	    u32Len = (u32ZeroBytes >= state->BlockSize) ? state->BlockSize : u32ZeroBytes;
	    ENGINEOutZeroFrame(Aop, u32Len);
	    u32ZeroBytes -= u32Len;
	}
	state->stAttr.u32ValidBytes = u32ValidBytes;
	state->stAttr.u32ZeroBytes = u32ZeroBytes;

    }
    else
    {
	if (ENGINECheckAopSpace(state) && ENGINECheckAipData(state))
	{
	    ENGINEOutRawFrame(Aip, Aop, state->BlockSize);
	    AOP_ProcDelayCompensation(Aop);
	}
    }
}

static HI_VOID ENGINEProcPcmData(ENGINE_STATE_S* state)
{
    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_CHECK_AOP);

    ENGINEProcPopForAipStop(state);

    /*aefmask = 0;  adfmask low bit[3:0] != 0*/
    if (!(state->AefMask) || (state->AefMask & 0xf))
    {
	if (ENGINECheckAopSpace(state) && ENGINECheckAipData(state))
	{
	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_PROC_DATA);

	    ENGINEMixFrame(state);

	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_DMA_OUT);
	    ENGINEOutFrame(state);

	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_IDLE);
	}
    }

    else/*adfmask high bit[7:4] != 0*/
    {
	if (state->bAefInBufFree && ENGINECheckAipData(state))
	{
	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_PROC_DATA);

	    ENGINEMixFrame(state);
	}

	if (state->bAefOutBufData && ENGINECheckAopSpace(state))
	{
	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_DMA_OUT);
	    ENGINEOutFrame(state);
	    TRACE_AOE_FSM(AOE_MOD_ID_EGE, state->EngineId, AOE_FSM_EGE_IDLE);
	}
    }

    return;
}

static HI_VOID ENGINEProcChnData(HI_U32 Id)
{
    ENGINE_STATE_S* state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];

    if (state->stAttr.u32DataFormat)
    {
	ENGINEProcRawData(state);
    }
    else
    {
	ENGINEProcPcmData(state);
    }
}

static HI_VOID ENGINEProcChnStopCmd(HI_U32 Id)
{
    ENGINE_STATE_S* state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];

    if (!state)
    {
	return;
    }

    if (ENGINE_STATUS_START == state->CurStatus)
    {
	/*  stop */
	state->CurStatus = ENGINE_STATUS_STOP;
    }
    ENGINEAckCmd(Id, AOE_ENGINE_CMD_DONE);

    return;
}

static HI_VOID ENGINEProcChnStartCmd(HI_U32 Id)
{
    ENGINE_STATE_S* state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];

    if (HI_NULL == state)
    {
	/* first start */
	g_stEneRm.hEne[Id] = ENGINECreateChn(Id);
	if (HI_NULL == g_stEneRm.hEne[Id])
	{
	    ENGINEAckCmd(Id, AOE_ENGINE_CMD_ERR_CREATE_FAIL);
	    return;
	}
	state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];
	state->CurStatus = ENGINE_STATUS_START;
    }
    else
    {
	if (ENGINE_STATUS_STOP == state->CurStatus)
	{
	    /*	start again */
	    // recreate
	    ENGINEDestroyChn(g_stEneRm.hEne[Id]);
	    g_stEneRm.hEne[Id] = ENGINECreateChn(Id);
	    if (HI_NULL == g_stEneRm.hEne[Id])
	    {
		ENGINEAckCmd(Id, AOE_ENGINE_CMD_ERR_CREATE_FAIL);
		return;
	    }
	    state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];
	}
	state->CurStatus = ENGINE_STATUS_START;
    }

    ENGINEAckCmd(Id, AOE_ENGINE_CMD_DONE);
    return;
}

static HI_VOID ENGINEProcChnCmd(HI_U32 Id)
{
    AOE_ENGINE_CMD_E newcmd;

    if (AOE_ENGINE_CMD_BUTT == ENGINE_GetChnCmd(Id, &newcmd))
    {
	return;
    }

    switch (newcmd)
    {
	case AOE_ENGINE_CMD_START:
	    ENGINEProcChnStartCmd(Id);
	    break;

	case AOE_ENGINE_CMD_STOP:
	    ENGINEProcChnStopCmd(Id);
	    break;
	default:
	    break;
    }
}

static inline HI_U32 ENGINEIsAipAttached(HI_U32 AipMask, HI_U32 u32AipChn)
{
    return AipMask & (0x1L << u32AipChn);
}

static inline HI_VOID ENGINESetAipDataFlag(HI_U32 u32AipChn, ENGINE_STATE_S* state)
{
    state->AipBufDataFlag |= (0x1L << u32AipChn);
}

static inline HI_VOID ENGINESetAipPriority(HI_U32 u32AipChn, HI_S32 priority, ENGINE_STATE_S* state)
{
    if (HIGH_PRIORITY == priority)
    {
	state->AipHiPriorityMask |= (0x1L << u32AipChn);
    }
    else
    {
	state->AipLoPriorityMask |= (0x1L << u32AipChn);
    }
}

static HI_VOID ENGINEGetAipState(HI_U32 u32AipChn, ENGINE_STATE_S* state)
{
    AIP_CHN_STAUTS_S status;

    AIP_GetChnStatus(u32AipChn, &status);

    if (AIP_STATUS_START == status.CurnStatus)
    {
	ENGINESetAipPriority(u32AipChn, status.Priority, state);

	if (ENGINECheckRbfInData(u32AipChn, state))
	{
	    ENGINESetAipDataFlag(u32AipChn, state);
	}
    }
    else
    {
	if (AOE_FORMAT_LPCM != state->stAttr.u32DataFormat)
	{
	    return;
	}

	if (ENGINECheckRbfInData(u32AipChn, state))
	{
	    ENGINESetAipDataFlag(u32AipChn, state);
	    ENGINESetAipPriority(u32AipChn, status.Priority, state);
	}
    }
}

static HI_VOID ENGINEUpdateChnAipState(ENGINE_STATE_S* state, S_MIXER_REGS_TYPE* pEneReg)
{
    HI_U32 u32AipChn;
    state->AipHiPriorityMask = 0;
    state->AipLoPriorityMask = 0;
    state->AipBufDataFlag = 0;
    state->AipMask = pEneReg->ENGINE_MIX_SRC.bits.aip_fifo_ena;

    for (u32AipChn = 0; u32AipChn < AOE_MAX_AIP_NUM; u32AipChn++)
    {
	if (ENGINEIsAipAttached(state->AipMask, u32AipChn))
	{
	    ENGINEGetAipState(u32AipChn, state);
	}
    }
}

static HI_VOID ENGINEUpdateChnAopState(ENGINE_STATE_S* state, S_MIXER_REGS_TYPE* pEneReg)
{
    HI_U32 AopFlag = pEneReg->ENGINE_ROU_DST.bits.aop_buf_ena;
    AOP_CHN_STAUTS_S status;
    HI_U32 SourceBitPerSample	= state->stAttr.u32BitPerSample;
    HI_U32 SourceChannels = state->stAttr.u32Channels;
    HI_U32 SourceSamplePerFrame = state->stAttr.u32SamplePerFrame;

    HI_U32 Aop;
    HI_U32 AopLoPriorityFlag = 0;
    HI_U32 AopHiPriorityFlag = 0;
    HI_U32 AopNoneUnifyMask = 0;
    HI_U32 AopNeedUnifyMask = 0;
    HI_U32 AopBufFreeFlag = 0;

    // AOP
    for (Aop = 0; Aop < AOE_MAX_AOP_NUM; Aop++)
    {
	if (!(AopFlag & (0x1L << Aop)))
	{
	    continue;
	}

	AOP_GetChnStatus(Aop, &status);
	if (AOP_STATUS_START != status.CurnStatus)
	{
	    continue;
	}

	if (1 == status.Priority)
	{
	    AopHiPriorityFlag |= (0x1L << Aop);
	}
	else
	{
	    AopLoPriorityFlag |= (0x1L << Aop);
	}

	if (SourceBitPerSample == status.u32BitPerSample && SourceChannels == status.u32Channels)
	{
	    AopNoneUnifyMask |= (0x1L << Aop);
	}
	else
	{
	    AopNeedUnifyMask |= (0x1L << Aop);
	}

	if (ENGINECheckRbfOutFree(Aop, SourceSamplePerFrame * status.uFrameSize))
	{
	    AopBufFreeFlag |= (0x1L << Aop);
	}
    }

    state->AopMask = AopFlag;
    state->AopHiPriorityMask = AopHiPriorityFlag;
    state->AopLoPriorityMask = AopLoPriorityFlag;
    state->AopNoneUnifyMask = AopNoneUnifyMask;
    state->AopNeedUnifyMask = AopNeedUnifyMask;
    state->AopBufFreeFlag = AopBufFreeFlag;
}

static ENGINE_STATUS_E ENGINEGetCunrStatus(HI_U32 Id)
{
    ENGINE_STATE_S* state;
    state = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];
    if (state)
    {
	return state->CurStatus;
    }
    else
    {
	return ENGINE_STATUS_BUTT;
    }
}

static HI_VOID ENGINEUpdateState(HI_U32 Id)
{
    S_MIXER_REGS_TYPE* pEneReg = (S_MIXER_REGS_TYPE*)(g_stEneRm.hwEneReg[Id]);
    ENGINE_STATE_S*    state   = (ENGINE_STATE_S*)g_stEneRm.hEne[Id];

    ENGINEUpdateChnAopState(state, pEneReg);
    ENGINEUpdateChnAipState(state, pEneReg);
}


static HI_S32 ENGINEProcChn(HI_U32 Id)
{
    TRACE_AOE_FSM(AOE_MOD_ID_EGE, Id, AOE_FSM_EGE_PROC_CMD);

    /*ProcChnCmd*/
    ENGINEProcChnCmd(Id);

    if (ENGINE_STATUS_START == ENGINEGetCunrStatus(Id))
    {
	/*UpdateChnState*/
	ENGINEUpdateState(Id);

	/*ProcChnData*/
	ENGINEProcChnData(Id);
    }

    return HI_SUCCESS;
}

static HI_VOID ENGINESwResetReg(S_MIXER_REGS_TYPE* pEneReg)
{
    adsp_memset(pEneReg, 0, sizeof(S_MIXER_REGS_TYPE));
    pEneReg->ENGINE_CTRL.bits.cmd_done = 1;
    pEneReg->ENGINE_CTRL.bits.cmd = 1;	//init stop
}

HI_VOID ENGINE_Process(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_ENGINE_NUM; Id++)
    {
	ENGINEProcChn(Id);
    }
}

HI_VOID ENGINE_Init(HI_VOID* pEngineRegBase)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_ENGINE_NUM; Id++)
    {
	g_stEneRm.hwEneReg[Id] = (S_MIXER_REGS_TYPE*)(pEngineRegBase + Id * sizeof(S_MIXER_REGS_TYPE));
	ENGINESwResetReg(g_stEneRm.hwEneReg[Id]);
	g_stEneRm.hEne[Id] = HI_NULL;
    }
}

HI_VOID	    ENGINE_DeInit(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_ENGINE_NUM; Id++)
    {
	ENGINEDestroyChn(g_stEneRm.hEne[Id]);
	g_stEneRm.hEne[Id] = HI_NULL;
    }
}
