/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_debug.h"
#include "hi_dsp_util.h"
#include "hi_dsp_common.h"
#include "hi_dsp_aoe.h"
#include "hi_dsp_ringbuf.h"
#include "hi_dsp_mem.h"
#include "aoe_cast.h"
#include "aoe_cast_priv.h"
#include "system_timer.h"

#include "adsp_osal_ext.h"

static CAST_SOURCE_S g_stCastRm;

static HI_U32  CASTCalcSize(HI_U32 u32Len, CAST_CHN_ATTR_S* pstAttr)
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

static HI_VOID CASTSetWorkBuffUseSize(CAST_CHN_ATTR_S* pstAttr)
{
    //work Buffer use size only 5ms
    pstAttr->uWorkBufUseSize = CASTCalcSize(AOE_CAST_PROCESS_PERIONDMS, pstAttr);
}

static HI_U32 CASTGetCastId(HI_U32 Aop)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_CAST_NUM; Id++)
    {
	if (Aop == g_stCastRm.AopId[Id])
	{
	    return Id;
	}
    }

    return AOE_MAX_CAST_NUM;
}

static HI_VOID	CASTSetFifoAttr(CAST_STATE_S* state, HI_U32 Aop, HI_U32 u32CastId, RBUF_ATTR_S* pstAttr)
{
    S_CAST_REGS_TYPE* pCastReg = (S_CAST_REGS_TYPE*)(g_stCastRm.hwCastReg[u32CastId]);

    pstAttr->bExtMem  = HI_FALSE; /* Cast Fifo Use internal Buffer */
    pstAttr->uBufSize = CASTCalcSize(AOE_CAST_FIFO_PERIONDMS, &state->stAttr); /* Cast Fifo length 65 ms */

    pstAttr->pBufWptr = (HI_VOID*)(&pCastReg->CAST_FIFO_WPTR);
    pstAttr->pBufRptr = (HI_VOID*)(&pCastReg->CAST_FIFO_RPTR);
    pstAttr->uFrameSize = UTIL_CalcFrameSize(state->stAttr.u32Channels, state->stAttr.u32BitPerSample);

    pCastReg->CAST_FIFO_SIZE = pstAttr->uBufSize;
    pCastReg->CAST_AOP_ID    = Aop;
}

static HI_U32  CASTGetFreeCastId(HI_VOID)
{
    HI_U32 Id;

    for (Id = 0; Id < AOE_MAX_CAST_NUM; Id++)
    {
	if (HI_NULL == g_stCastRm.hCast[Id])
	{
	    return Id;
	}
    }

    return AOE_MAX_CAST_NUM;
}

HI_VOID CAST_SetAopBuf(HI_U32 Aop, HI_VOID* hRing)
{
    CAST_STATE_S* state = HI_NULL;
    HI_U32 CastId;

    if (HI_NULL == hRing)
    {
	return;
    }

    CastId = CASTGetCastId(Aop);
    if (AOE_MAX_CAST_NUM == CastId)
    {
	return;
    }

    state = (CAST_STATE_S*)g_stCastRm.hCast[CastId];

    state->hRingOut_Cast = hRing;
}

HI_VOID CAST_Destroy(HI_U32 Aop)
{
    CAST_STATE_S* state = HI_NULL;
    HI_VOID* hRingOut_cast = HI_NULL;
    HI_U32 CastId = HI_FAILURE;

    CastId = CASTGetCastId(Aop);
    if (AOE_MAX_CAST_NUM == CastId)
    {
	return;
    }

    state = (CAST_STATE_S*)g_stCastRm.hCast[CastId];
    if (HI_NULL == state)
    {
	return;
    }

    hRingOut_cast = state->hRingOut_Cast;
    adsp_spin_lock(CastId);
    HI_ADSP_FREE(ADSP_ID_AOE, (HI_VOID*)state);
    g_stCastRm.hCast[CastId] = HI_NULL;
    adsp_spin_unlock(CastId);
    RBUF_Destroy(hRingOut_cast);
    g_stCastRm.uCastNum--;
}

HI_VOID* CAST_Create(HI_U32 Aop, RBUF_ATTR_S* pstBufAttr, HI_U32 u32BitPerSample, HI_U32 Channels, HI_U32 u32SampleRate)
{
    CAST_STATE_S* state = HI_NULL;
    HI_VOID* hRingOut = HI_NULL;

    HI_U32 CastId = CASTGetFreeCastId();

    if (AOE_MAX_CAST_NUM == CastId)
    {
	return HI_NULL;
    }

    state = (CAST_STATE_S*)HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(CAST_STATE_S));
    if (!state)
    {
	return HI_NULL;
    }

    adsp_memset(state, 0, sizeof(CAST_STATE_S));

    state->stAttr.u32Channels = Channels;
    state->stAttr.u32BitPerSample = u32BitPerSample;
    state->stAttr.u32SampleRate = u32SampleRate;
    CASTSetFifoAttr(state, Aop, CastId, pstBufAttr);

    RBUF_Create(&hRingOut, pstBufAttr);//Cast FIFO
    if (HI_NULL == hRingOut)
    {
	goto ERR_EXIT;
    }

    state->hRingFifo = hRingOut;

    g_stCastRm.AopId[CastId] = Aop;
    g_stCastRm.uCastNum++;

    //work Buffer use size 5ms
    CASTSetWorkBuffUseSize(&state->stAttr);

    adsp_memset(&state->stProc, 0, sizeof(Cast_PROC_STATUS_S));
    g_stCastRm.hCast[CastId] = (HI_VOID*)state;

    return hRingOut;

ERR_EXIT:
    if (HI_NULL != state)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, state);
    }
    return HI_NULL;
}

static HI_VOID CASTFlushProcInfoToReg(Cast_PROC_STATUS_S* pstProc, HI_U32 uCastId)
{
    S_CAST_REGS_TYPE* pCastReg = (S_CAST_REGS_TYPE*)(g_stCastRm.hwCastReg[uCastId]);

    pCastReg->CAST_BUF_WRITEOK_CNT     = pstProc->uBufWriteOkCnt;
    pCastReg->CAST_BUF_WRITEMUTE_CNT   = pstProc->uBufWriteMuteCnt;
    pCastReg->CAST_BUF_OVERWRITE_CNT   = pstProc->uBufOverWriteCnt;
    pCastReg->CAST_BUF_WRITETOTAL_CNT  = pstProc->uBufWriteTotalCnt;
    pCastReg->CAST_FIFO_FORCE_READ_CNT = pstProc->uFIFOForceReadCnt;
    pCastReg->CAST_FIFO_TRY_CNT	       = pstProc->uFIFOReadTryCnt;
    pCastReg->CAST_FIFO_OK_CNT	       = pstProc->uFIFOReadOkCnt;
}

//Engine try to write data to fifo cnt
HI_VOID CAST_FiFoTryCnt(HI_U32 Aop)
{
    HI_U32 CastId;
    CAST_STATE_S* state = HI_NULL;

    CastId = CASTGetCastId(Aop);
    if (CastId == AOE_MAX_CAST_NUM)
    {
	return;
    }

    state = (CAST_STATE_S*)g_stCastRm.hCast[CastId];
    if (state)
    {
	state->stProc.uFIFOReadTryCnt++;
    }
}

//Engine can write data to fifo cnt
HI_VOID CAST_FiFoFreeCnt(HI_U32 Aop)
{
    HI_U32 CastId;
    CAST_STATE_S* state = HI_NULL;

    CastId = CASTGetCastId(Aop);
    if (CastId == AOE_MAX_CAST_NUM)
    {
	return;
    }

    state = (CAST_STATE_S*)g_stCastRm.hCast[CastId];
    if (state)
    {
	state->stProc.uFIFOReadOkCnt++;
    }
}

/**
 * Timer Intervla defined at func AOE_TimerInit,default is 5ms
 * FIFO size define at CASTSetFifoAttr,default 25ms size.
 * and the size of Time handle acquire from FIFO every time defined at CASTSetWorkBuffUseSize,default is 5ms size
 */
static HI_VOID CASTTimerDataHandle(CAST_STATE_S* state, HI_U32 uCastId)
{
    HI_U32 u32Len = state->stAttr.uWorkBufUseSize;
    HI_U32 u32DataLen = RBUF_QueryBusy(state->hRingFifo);
    HI_U32 u32FreeLen = RBUF_QueryFree(state->hRingOut_Cast);

    if (u32DataLen >= u32Len)
    {
	if (u32FreeLen >= u32Len)
	{
	    RBUF_CopyData(state->hRingFifo, state->hRingOut_Cast, u32Len, ADSP_MEMCPY_DSP2ARM);
	    state->stProc.uBufWriteOkCnt++;
	}
	else
	{
	    RBUF_ReadData(state->hRingFifo, HI_NULL, u32Len);
	    state->stProc.uBufOverWriteCnt++;
	    return;
	}
    }
    else if (0 == u32DataLen)
    {
	if (u32FreeLen >= u32Len)
	{
	    RBUF_WriteDataDma(state->hRingOut_Cast, HI_NULL, u32Len);
	    state->stProc.uBufWriteMuteCnt++;
	}
	else
	{
	    state->stProc.uBufOverWriteCnt++;
	    return;
	}
    }
    else
    {
	if (u32FreeLen >= u32DataLen)
	{
	    RBUF_CopyData(state->hRingFifo, state->hRingOut_Cast, u32DataLen, ADSP_MEMCPY_DSP2ARM);
	    state->stProc.uBufWriteOkCnt++;
	}
	else
	{
	    RBUF_ReadData(state->hRingFifo, HI_NULL, u32DataLen);
	    state->stProc.uBufOverWriteCnt++;
	    return;
	}
    }

    state->stProc.uBufWriteTotalCnt++;

    CASTFlushProcInfoToReg(&state->stProc, uCastId);
}

static HI_VOID CAST_TimerHandle(HI_VOID)
{
    HI_U32 Id;
    CAST_STATE_S* state = HI_NULL;

    for (Id = 0; Id < AOE_MAX_CAST_NUM; Id++)
    {
	state = (CAST_STATE_S*)g_stCastRm.hCast[Id];
	if (HI_NULL == state)
	{
	    continue;
	}
	CASTTimerDataHandle(state, Id);
    }
}

static HI_VOID	CASTSwResetReg(S_CAST_REGS_TYPE* pCastReg)
{
    adsp_memset(pCastReg, 0, sizeof(S_CAST_REGS_TYPE));
}

HI_VOID CAST_Init(HI_VOID* pAopRegBase)
{
    HI_U32 Id;

    adsp_memset(&g_stCastRm, 0, sizeof(CAST_SOURCE_S));

    for (Id = 0; Id < AOE_MAX_CAST_NUM; Id++)
    {
	g_stCastRm.hwCastReg[Id] = (S_CAST_REGS_TYPE *)(pAopRegBase-AOE_AOP_REG_OFFSET+AOE_CAST_REG_OFFSET + Id * sizeof(S_CAST_REGS_TYPE));
	CASTSwResetReg(g_stCastRm.hwCastReg[Id]);
	g_stCastRm.hCast[Id] = HI_NULL;
	g_stCastRm.AopId[Id] = AOE_MAX_AOP_NUM;
    }

    TIMER_RegIsrFunc((HI_VOID*)CAST_TimerHandle);
}

HI_VOID CAST_DeInit(HI_U32 Id)
{
    TIMER_DelIsrFunc();

    for (Id = 0; Id < AOE_MAX_CAST_NUM; Id++)
    {
	g_stCastRm.hCast[Id] = HI_NULL;
    }
}
