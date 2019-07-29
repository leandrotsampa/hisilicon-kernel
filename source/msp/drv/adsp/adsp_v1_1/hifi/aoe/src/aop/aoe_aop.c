/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_debug.h"
#include "hi_dsp_linear.h"
#include "hi_dsp_resampler.h"
#include "hi_dsp_util.h"
#include "hi_dsp_common.h"
#include "hi_dsp_aoe.h"
#include "hi_dsp_ringbuf.h"
#include "hi_dsp_mem.h"

#include "aoe_aop.h"
#include "aoe_aop_priv.h"
#include "aoe_reg.h"
#include "hi_dsp_debug.h"

#include "aoe_cast.h"

#include "adsp_osal_ext.h"

#define AOP_BUFFER_MS_THRESHOLD 10

static AOP_GLOBAL_SOURCE_S g_stAopRm;

HI_VOID AOPFlushChnBuf(AOP_STATE_S* state)
{
    if (state->hRingOut)
    {
	RBUF_Flush(state->hRingOut);
    }
}

static HI_S32  AOPGetChnCreateAttr(HI_U32 Id, AOP_CHN_ATTR_S* pstAttr)
{
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Id]);
    HI_U32 u32FrameSize, uLatencyMs;

    if (HI_SUCCESS != AOE_REG_ReadBitDepth(&pstAttr->u32BitPerSample, pAopReg->AOP_BUFF_ATTR.bits.buf_precision))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadChannel(&pstAttr->u32Channels, pAopReg->AOP_BUFF_ATTR.bits.buf_ch))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadSampelRate(&pstAttr->u32SampleRate, pAopReg->AOP_BUFF_ATTR.bits.buf_fs))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadDataFormat(&pstAttr->u32DataFormat, pAopReg->AOP_BUFF_ATTR.bits.buf_format))
    {
	return HI_FAILURE;
    }

    if (HI_SUCCESS != AOE_REG_ReadBufLatencyMs(&uLatencyMs, pAopReg->AOP_BUFF_ATTR.bits.buf_latency))
    {
	return HI_FAILURE;
    }
    pstAttr->Priority = pAopReg->AOP_BUFF_ATTR.bits.buf_priority;

    u32FrameSize = UTIL_CalcFrameSize(pstAttr->u32Channels, pstAttr->u32BitPerSample);
    pstAttr->stRbfAttr.bExtMem	= HI_TRUE; /* AOP use external RBF instance */
    pstAttr->stRbfAttr.uBufFlag = pAopReg->AOP_BUF_SIZE.bits.buff_flag;

    ADSP_ReadAddr(pAopReg->AOP_BUF_ADDR, pstAttr->stRbfAttr.pBufAddr);

    pstAttr->stRbfAttr.uBufSize = pAopReg->AOP_BUF_SIZE.bits.buff_size;
    if (pstAttr->stRbfAttr.uBufFlag)
    {
	ADSP_ReadAddr(pAopReg->AOP_BUF_WPTR, pstAttr->stRbfAttr.pBufWptr);
	ADSP_ReadAddr(pAopReg->AOP_BUF_RPTR, pstAttr->stRbfAttr.pBufRptr);
    }
    else
    {
	pstAttr->stRbfAttr.pBufWptr = (HI_VOID*)(&pAopReg->AOP_BUF_WPTR.ADDR_LOW);
	pstAttr->stRbfAttr.pBufRptr = (HI_VOID*)(&pAopReg->AOP_BUF_RPTR.ADDR_LOW);
    }

    pstAttr->stRbfAttr.uFrameSize   = u32FrameSize;
    pstAttr->stRbfAttr.uLatencyMs   = uLatencyMs;
    pstAttr->stRbfAttr.uLatencySize = UTIL_LatencyMs2ByteSize(uLatencyMs, u32FrameSize, pstAttr->u32SampleRate);

    return HI_SUCCESS;
}

static AOE_AOP_CMD_E AOPGetChnCmd(HI_U32 Id, AOE_AOP_CMD_E* newcmd)
{
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Id]);
    AOE_AOP_CMD_E eNewCmd = AOE_AOP_CMD_BUTT;

    if (!pAopReg->AOP_CTRL.bits.cmd_done)
    {
	switch (pAopReg->AOP_CTRL.bits.cmd)
	{
	    case 0x00:
		eNewCmd = AOE_AOP_CMD_START;
		break;
	    case 0x01:
		eNewCmd = AOE_AOP_CMD_STOP;
		break;
	    default:
		eNewCmd = AOE_AOP_CMD_BUTT;
		pAopReg->AOP_CTRL.bits.cmd_return_value = (HI_U32)AOE_AOP_CMD_ERR_UNKNOWCMD;
		pAopReg->AOP_CTRL.bits.cmd_done = 1;
		HI_DSP_PRINT("invalid cmd(%d)\n", pAopReg->AOP_CTRL.bits.cmd);
		break;
	}
    }
    *newcmd = eNewCmd;

    return eNewCmd;
}

static HI_VOID	AOPAckChnCmd(HI_U32 Id, AOE_AOP_CMD_RET_E Ack)
{
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Id]);

    if (!pAopReg->AOP_CTRL.bits.cmd_done)
    {
	/* ack cmd */
	pAopReg->AOP_CTRL.bits.cmd_return_value = (HI_U32)Ack;
	pAopReg->AOP_CTRL.bits.cmd_done = 1;
    }
}

static HI_U32  AOPCalcSize(HI_U32 u32Len, AOP_CHN_ATTR_S* pstAttr)
{
    HI_U32 blocksize = 0;
    HI_U32 samples;
    HI_U32 framesize = UTIL_CalcFrameSize(pstAttr->u32Channels, pstAttr->u32BitPerSample);

    samples = (pstAttr->u32SampleRate * u32Len) / 1000;
    /* optimzie for hifi3 vector dsp */
    UTIL_ALIGN4(samples);
    blocksize = samples * framesize;

    return blocksize;
}

static HI_VOID AOPProcDelayMS(HI_U32 Aop)
{
    HI_U32 u32DelaySize;
    HI_U32 u32BuffThreshSize;
    RBUF_INFO_S stBufInfo;
    HI_U32 u32RealDelayms;
    HI_BOOL bAddData = HI_FALSE;
    HI_U32 u32AddDataSize = 0;

    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Aop];
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Aop]);

    u32RealDelayms = state->u32RealDelayms;
    if (u32RealDelayms < AOP_BUFFER_MS_THRESHOLD)
    {
	return;
    }

    RBUF_QueryInfo(state->hRingOut, &stBufInfo);

    u32DelaySize = AOPCalcSize(u32RealDelayms, &state->stAttr);
    u32BuffThreshSize = AOPCalcSize(AOP_BUFFER_MS_THRESHOLD, &state->stAttr);

    if (stBufInfo.u32TotalDataSize > u32DelaySize)
    {
	return;
    }
    else
    {
	u32AddDataSize = u32DelaySize + u32BuffThreshSize - stBufInfo.u32TotalDataSize;
	if (u32AddDataSize > 0)
	{
	    bAddData = HI_TRUE;
	}
    }

    if (bAddData == HI_TRUE)
    {
	if (stBufInfo.u32TotalFreeSize <= u32AddDataSize)
	{
	    u32AddDataSize = stBufInfo.u32TotalFreeSize;
	}

	(HI_VOID)RBUF_WriteData(state->hRingOut, HI_NULL, u32AddDataSize);

	pAopReg->AOP_ADDMUTE_CNT++;
    }
}

static HI_VOID AOPProcDelayChange(HI_U32 Aop)
{
    HI_U32 u32DelaySize = 0;
    HI_U32 u32LastDelayDataSize = 0;
    HI_U32 u32RealDelayDataSize = 0;
    RBUF_INFO_S stBufInfo = {0};

    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Aop];
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Aop]);

    pAopReg->AOP_CTRL.bits.audiodelay = 1;

    RBUF_QueryInfo(state->hRingOut, &stBufInfo);
    AOPFlushChnBuf(state);

    u32LastDelayDataSize = AOPCalcSize(state->u32LastDelayMs, &state->stAttr);
    u32RealDelayDataSize = AOPCalcSize(state->u32RealDelayms, &state->stAttr);

    if (u32LastDelayDataSize > stBufInfo.u32TotalDataSize)
    {
	u32DelaySize = u32RealDelayDataSize;
    }
    else
    {
	u32DelaySize = stBufInfo.u32TotalDataSize + u32RealDelayDataSize - u32LastDelayDataSize;
    }

    if (stBufInfo.u32TotalFreeSize < u32DelaySize)
    {
	u32DelaySize = stBufInfo.u32TotalFreeSize;
    }

    (HI_VOID)RBUF_WriteData(state->hRingOut, HI_NULL, u32DelaySize);
    pAopReg->AOP_ADDMUTE_CNT++;

    state->u32LastDelayMs = state->u32RealDelayms;
    state->bAudioDelaySetted = HI_FALSE;
}

HI_VOID AOP_ProcDelayCompensation(HI_U32 Aop)
{
    AOP_STATE_S* state;

    state = (AOP_STATE_S*)g_stAopRm.hAop[Aop];
    if (HI_NULL == state)
    {
	return;
    }

    if (AOP_STATUS_STOP == state->CurnStatus)
    {
	return;
    }

    // the DelayMs changed
    if (HI_TRUE == state->bAudioDelaySetted)
    {
	AOPProcDelayChange(Aop);
    }
    else //pause/resume handle
    {
	AOPProcDelayMS(Aop);
    }
}

static HI_BOOL AOPCheckIsCast(HI_U32 Id)
{
    if ((g_stAopRm.hwAopReg[Id]->AOP_CTRL.bits.cast_flag == HI_TRUE)
	&& (g_stAopRm.hwAopReg[Id]->AOP_CTRL.bits.ena_add_mute == HI_TRUE))
    {
	return HI_TRUE;
    }
    return HI_FALSE;
}

static HI_S32	 AOPCreateCast(AOP_STATE_S* state, HI_U32 Id)
{
    AOP_CHN_ATTR_S* pAttr = &state->stAttr;
    HI_VOID* hCastFifo = HI_NULL;

    hCastFifo = CAST_Create(Id, &pAttr->stRbfAttr, pAttr->u32BitPerSample, pAttr->u32Channels, pAttr->u32SampleRate);//create cast rm,return cast fifo
    if (hCastFifo == HI_NULL)
    {
	return HI_FAILURE;
    }

    ///mixer-fifo-aop
    CAST_SetAopBuf(Id, state->hRingOut);
    state->hRingOut = hCastFifo;

    return HI_SUCCESS;
}

static HI_VOID*	    AOPCreateChn(HI_U32 Id)
{
    HI_VOID* hRingOut = HI_NULL;
    AOP_STATE_S* state = HI_NULL;
    AOP_CHN_ATTR_S stAttr;

    if (HI_SUCCESS != AOPGetChnCreateAttr(Id, &stAttr))
    {
	return HI_NULL;
    }

    RBUF_Create(&hRingOut, &stAttr.stRbfAttr);
    if (HI_NULL == hRingOut)
    {
	return HI_NULL;
    }

    state = (AOP_STATE_S*)HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(AOP_STATE_S));
    if (!state)
    {
	goto AOP_Create_ERR_EXIT;
    }

    // initialize
    adsp_memset(state, 0, sizeof(AOP_STATE_S));

    adsp_memcpy(&state->stAttr, &stAttr, sizeof(AOP_CHN_ATTR_S));
    state->hRingOut = hRingOut;

    state->bCast = AOPCheckIsCast(Id);
    if (state->bCast == HI_TRUE)
    {
	if (HI_SUCCESS != AOPCreateCast(state, Id))
	{
	    goto AOP_Create_ERR_EXIT;
	}
    }

    state->stTargetGain.bLinearMode = HI_FALSE;
    state->stTargetGain.u32LGain    = AOE_VOL_BASE_VALUE;
    state->stTargetGain.u32RGain    = AOE_VOL_BASE_VALUE;
    state->stTargetGain.s32LDecGain = 0;
    state->stTargetGain.s32RDecGain = 0;

    state->stCurrentGain.bLinearMode = HI_FALSE;
    state->stCurrentGain.u32LGain    = AOE_VOL_BASE_VALUE;
    state->stCurrentGain.u32RGain    = AOE_VOL_BASE_VALUE;
    state->stCurrentGain.s32LDecGain = 0;
    state->stCurrentGain.s32RDecGain = 0;
    state->u32LastDelayMs = 0;
    state->u32RealDelayms = 0;

    state->CurnStatus = AOP_STATUS_START;
    return (HI_VOID*)state;

AOP_Create_ERR_EXIT:
    if (state)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, state);
    }

    RBUF_Destroy(hRingOut);
    return HI_NULL;
}

HI_VOID	   AOP_DestroyChn(HI_U32 Id)
{
    AOP_STATE_S* state;
    HI_VOID* inst = g_stAopRm.hAop[Id];
    if (inst == HI_NULL)
    {
	return;
    }

    state = (AOP_STATE_S*)inst;

    if (state->bCast == HI_TRUE)
    {
	CAST_Destroy(Id);
    }

    RBUF_Destroy(state->hRingOut);

    HI_ADSP_FREE(ADSP_ID_AOE, state);
}

static HI_VOID	 AOPUpdateChnLatency(AOP_STATE_S* state, S_AOP_REGS_TYPE* pAopReg)
{
    AOP_CHN_ATTR_S* pstAttr = &state->stAttr;
    HI_U32 u32LatencyMs, u32FrameSize;

    u32LatencyMs = pAopReg->AOP_BUFF_ATTR.bits.buf_latency;
    pstAttr->stRbfAttr.uLatencyMs = u32LatencyMs;
    u32FrameSize = UTIL_CalcFrameSize(pstAttr->u32Channels, pstAttr->u32BitPerSample);
    pstAttr->stRbfAttr.uLatencySize = UTIL_LatencyMs2ByteSize(u32LatencyMs, u32FrameSize, pstAttr->u32SampleRate);

    RBUF_UpdateAttr(state->hRingOut, &pstAttr->stRbfAttr);
}

static HI_VOID AOPUpdateChnDelay(AOP_STATE_S* state, S_AOP_REGS_TYPE* pAopReg)
{
    state->u32RealDelayms = pAopReg->AOP_CTRL.bits.realdelayms;

    if (state->u32RealDelayms != state->u32LastDelayMs)
    {
	state->bAudioDelaySetted = HI_TRUE;
    }
}

static HI_VOID	 AOPUpdateChnGeneralState(AOP_STATE_S* state, S_AOP_REGS_TYPE* pAopReg)
{
    state->stTargetGain.bLinearMode = HI_FALSE;
    state->stTargetGain.u32LGain = pAopReg->AOP_EXT_CTRL.bits.volume_l;
    state->stTargetGain.u32RGain = pAopReg->AOP_EXT_CTRL.bits.volume_r;

    if (0 == pAopReg->AOP_EXT_CTRL.bits.volumedec_dir_l)
    {
	state->stTargetGain.s32LDecGain = (HI_S32)pAopReg->AOP_EXT_CTRL.bits.volumedec_l;
    }
    else
    {
	state->stTargetGain.s32LDecGain = -((HI_S32)pAopReg->AOP_EXT_CTRL.bits.volumedec_l);
    }

    state->stTargetGain.s32RDecGain = state->stTargetGain.s32LDecGain;

    if (0 == pAopReg->AOP_EXT_CTRL.bits.balance_dir)
    {
	state->s32Balance = (HI_S32)pAopReg->AOP_EXT_CTRL.bits.balance_val;
    }
    else
    {
	state->s32Balance = -((HI_S32)pAopReg->AOP_EXT_CTRL.bits.balance_val);
    }

    state->bMute = (HI_BOOL)pAopReg->AOP_EXT_CTRL.bits.mute;
    state->bBypass = (HI_BOOL)pAopReg->AOP_CTRL.bits.ena_aef_bypass;
    state->bAdEnable = (HI_BOOL)pAopReg->AOP_CTRL.bits.ena_ad;
}

static HI_VOID	 AOPProcChnCmd(HI_U32 Id)
{
    AOE_AOP_CMD_E newcmd;

    if (AOE_AOP_CMD_BUTT == AOPGetChnCmd(Id, &newcmd))
    {
	return;
    }

    switch (newcmd)
    {
	case AOE_AOP_CMD_START:
	    g_stAopRm.hAop[Id] = AOPCreateChn(Id);
	    if (HI_NULL == g_stAopRm.hAop[Id])
	    {
		AOPAckChnCmd(Id, AOE_AOP_CMD_ERR_START_FAIL);
	    }
	    break;
	case AOE_AOP_CMD_STOP:
	    AOP_DestroyChn(Id);
	    g_stAopRm.hAop[Id] = HI_NULL;
	    break;
	default:
	    break;
    }

    AOPAckChnCmd(Id, AOE_AOP_CMD_DONE);

    return;
}

static HI_VOID	 AOPUpdateChnState(HI_U32 Id)
{
    S_AOP_REGS_TYPE* pAopReg = (S_AOP_REGS_TYPE*)(g_stAopRm.hwAopReg[Id]);
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Id];

    if (HI_NULL == state)
    {
	return;
    }

    AOPUpdateChnGeneralState(state, pAopReg);
    AOPUpdateChnLatency(state, pAopReg);
    AOPUpdateChnDelay(state, pAopReg);
}

static HI_VOID	  AOPProcChn(HI_U32 Id)
{
    AOP_STATE_S* state = HI_NULL;

    TRACE_AOE_FSM(AOE_MOD_ID_AOP, Id, AOE_FSM_AOP_PROC_CMD);

    AOPProcChnCmd(Id);

    state = (AOP_STATE_S*)g_stAopRm.hAop[Id];
    if (HI_NULL == state)
    {
	return;
    }

    if (AOP_STATUS_START == state->CurnStatus)
    {
	AOPUpdateChnState(Id);
    }

    TRACE_AOE_FSM(AOE_MOD_ID_AOP, Id, AOE_FSM_AOP_IDLE);
}

static HI_VOID	 AOPSwResetReg(S_AOP_REGS_TYPE* pAopReg)
{
    adsp_memset(pAopReg, 0, sizeof(S_AOP_REGS_TYPE));
    pAopReg->AOP_CTRL.bits.cmd_done = 1;
}

HI_VOID AOP_Init(HI_VOID* pAopRegBase)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AOP_NUM; Id++)
    {
	g_stAopRm.hwAopReg[Id] = (S_AOP_REGS_TYPE*)(pAopRegBase + Id * sizeof(S_AOP_REGS_TYPE));
	AOPSwResetReg(g_stAopRm.hwAopReg[Id]);
	g_stAopRm.hAop[Id] = HI_NULL;
    }

    CAST_Init(pAopRegBase);
}

HI_VOID	  AOP_DeInit(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AOP_NUM; Id++)
    {
	AOP_DestroyChn(Id);
	g_stAopRm.hAop[Id] = HI_NULL;
    }

    CAST_DeInit(Id);
}

HI_VOID	  AOP_Process(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_AOP_NUM; Id++)
    {
	AOPProcChn(Id);
    }
}

HI_VOID	  AOP_GetChnStatus(HI_U32 Id, AOP_CHN_STAUTS_S* pstStatus)
{
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Id];
    if (HI_NULL == state)
    {
	pstStatus->CurnStatus = AOP_STATUS_STOP;
	return;
    }

    pstStatus->CurnStatus      = state->CurnStatus;
    pstStatus->Priority	       = state->stAttr.Priority;
    pstStatus->uFrameSize      = state->stAttr.stRbfAttr.uFrameSize;
    pstStatus->u32BitPerSample = state->stAttr.u32BitPerSample;
    pstStatus->u32Channels     = state->stAttr.u32Channels;
    pstStatus->bBypass	       = state->bBypass;
    pstStatus->bCast	       = state->bCast;
    pstStatus->bAdEnable       = state->bAdEnable;
    pstStatus->u32RealDelayms  = state->u32RealDelayms;
}

HI_BOOL	   AOP_QueryRbfFree(HI_U32 Id, HI_U32 blocksize)
{
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Id];
    if (HI_NULL == state)
    {
	return HI_FALSE;
    }

    if (AOP_STATUS_STOP == state->CurnStatus)
    {
	return HI_FALSE;
    }

    if (state->hRingOut)
    {
	return RBUF_CheckFree(state->hRingOut, blocksize);
    }

    return HI_FALSE;
}

HI_VOID	  AOP_WriteBuffProcTryCnt(HI_U32 Aop)
{
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Aop];
    if (state && HI_TRUE == state->bCast)
    {
	CAST_FiFoTryCnt(Aop);
    }
}

HI_VOID	  AOP_WriteBuffProcOKCnt(HI_U32 Aop)
{
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Aop];
    if (state && HI_TRUE == state->bCast)
    {
	CAST_FiFoFreeCnt(Aop);
    }
}

static HI_VOID	 AOPUnifyPcmData(AOP_STATE_S* state, HI_DSP_AUDFRAME_S* pstDstFrame)
{
    HI_VOID* pWKBuf = HI_NULL;

    if (pstDstFrame->u32BitPerSample == state->stAttr.u32BitPerSample &&
	pstDstFrame->u32Channels == state->stAttr.u32Channels)
    {
	return;
    }

    if (pstDstFrame->u32BitPerSample != state->stAttr.u32BitPerSample)
    {
	pWKBuf = (HI_VOID*)AOE_GetWKBuf();
	UTIL_UnifyBitDepthPcmData(state->stAttr.u32BitPerSample, pWKBuf, pstDstFrame);
    }

    if (pstDstFrame->u32Channels != state->stAttr.u32Channels)
    {
	pWKBuf = (HI_VOID*)AOE_GetWKBuf();
	UTIL_UpmixPcmData(state->stAttr.u32Channels, pWKBuf, pstDstFrame);
    }
}

static HI_VOID	 AOPMutePcmData(AOP_STATE_S* state, HI_DSP_AUDFRAME_S* pstDstFrame)
{
    HI_VOID* pWKBuf;
    if (HI_FALSE == state->bMute)
    {
	return;
    }

    pWKBuf = (HI_VOID*)AOE_GetWKBuf();

    adsp_memset(pWKBuf, 0, pstDstFrame->u32DataBytes);
    pstDstFrame->pDataBuf = pWKBuf;
}

static HI_VOID	 AOPGainPcmData(AOP_STATE_S* state, HI_DSP_AUDFRAME_S* pstDstFrame)//cast gain handle
{
    HI_VOID* pWKBuf;

    if (((state->stTargetGain.u32LGain == state->stCurrentGain.u32LGain)
	 && (state->stTargetGain.s32LDecGain == state->stCurrentGain.s32LDecGain))
	|| (state->bCast == HI_TRUE))
    {
	if ((state->stTargetGain.u32LGain == AOE_VOL_BASE_VALUE && state->stTargetGain.u32RGain == AOE_VOL_BASE_VALUE)
	    && (state->stTargetGain.s32LDecGain == 0 && state->stTargetGain.s32RDecGain == 0)
	    && state->s32Balance == 0)
	{
	    return;
	}
	pWKBuf = (HI_VOID*)AOE_GetWKBuf();
	adsp_memcpy(pWKBuf, pstDstFrame->pDataBuf, pstDstFrame->u32DataBytes);
	pstDstFrame->pDataBuf = pWKBuf;
	UTIL_LRGainProcess(pstDstFrame, state->s32Balance, &state->stTargetGain);
    }
    else
    {
	pWKBuf = (HI_VOID*)AOE_GetWKBuf();
	adsp_memcpy(pWKBuf, pstDstFrame->pDataBuf, pstDstFrame->u32DataBytes);
	pstDstFrame->pDataBuf = pWKBuf;
	UTIL_LRFadeGainProcess(pstDstFrame, state->s32Balance, &state->stCurrentGain, &state->stTargetGain);
	adsp_memcpy(&state->stCurrentGain, &state->stTargetGain, sizeof(UTIL_GAIN_ATTR_S));
    }
    return;
}

static HI_VOID	 AOPDataPcmGeneralProc(AOP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    AOPUnifyPcmData(state, pstFrame);
    AOPMutePcmData(state, pstFrame);
    AOPGainPcmData(state, pstFrame);
}

static HI_VOID	 AOPDataPcmProc(AOP_STATE_S* state, HI_DSP_AUDFRAME_S* pstFrame)
{
    if (pstFrame->u32DataFormat) //non-pcm data don't process
    {
	return;
    }

    AOPDataPcmGeneralProc(state, pstFrame);
}

HI_U32 AOP_WriteRbfData(HI_U32 Id, HI_DSP_AUDFRAME_S* pstFrame)
{
    HI_U32 uWriteSize = 0;
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Id];

    if (HI_NULL == state)
    {
	return 0;
    }

    if (AOP_STATUS_STOP == state->CurnStatus)
    {
	return 0;
    }

    AOPDataPcmProc(state, pstFrame);

    if (HI_TRUE == state->bCast)
    {
	uWriteSize = RBUF_WriteData(state->hRingOut, (HI_U8*)pstFrame->pDataBuf, pstFrame->u32DataBytes);
    }
    else
    {
	uWriteSize = RBUF_WriteDataDma(state->hRingOut, (HI_U8*)pstFrame->pDataBuf, pstFrame->u32DataBytes);
    }

    return uWriteSize;
}

HI_VOID* AOP_GetRingOut(HI_U32 Id)
{
    AOP_STATE_S* state = (AOP_STATE_S*)g_stAopRm.hAop[Id];

    if (state == HI_NULL)
    {
	return HI_NULL;
    }

    return state->hRingOut;
}
