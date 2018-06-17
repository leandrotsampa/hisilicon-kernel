/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_type.h"
#include "hi_dsp_ringbuf.h"
#include "hi_dsp_mem.h"
#include "dsp_circ_buf.h"
#include "hi_dsp_debug.h"

#include "adsp_osal_ext.h"

typedef struct
{
    // read
    HI_U32 uTotalByteRead;
    HI_U32 uTryReadCnt;
    HI_U32 uBufEmptyCnt;
    HI_U32 uBufEmptyWarningCnt;

    // write
    HI_U32 uTotalByteWrite;
    HI_U32 uTryWriteCnt;
    HI_U32 uBufFullCnt;
    HI_U32 uBufFullWarningCnt;
} RBUF_PROC_STATUS_S;

typedef struct
{
    RBUF_ATTR_S stAttr;

    CIRC_BUF_S	       stCB;
    RBUF_PROC_STATUS_S stProc;
} RBUF_STATE_S;

HI_VOID RBUF_Create(HI_VOID** phRBUF, RBUF_ATTR_S *pstAttr)
{
    RBUF_STATE_S* state = HI_NULL;
    HI_VOID* rbfbase = HI_NULL;

    state = (RBUF_STATE_S*) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(RBUF_STATE_S));
    if (!state)
    {
	*phRBUF = HI_NULL;
	return;
    }

    // initialize
    adsp_memset(state, 0, sizeof(RBUF_STATE_S));
    adsp_memcpy(&state->stAttr, pstAttr, sizeof(RBUF_ATTR_S));

    /* RBF provided by internal */
    if (!pstAttr->bExtMem)
    {
	rbfbase = HI_ADSP_VMALLOC_Aligned(ADSP_ID_AOE, pstAttr->uBufSize, pstAttr->uFrameSize);
	if (!rbfbase)
	{
	    HI_ADSP_FREE(ADSP_ID_AOE, state);
	    *phRBUF = HI_NULL;
	    return;
	}

	state->stAttr.pBufAddr = rbfbase;
	state->stAttr.uBufSize = pstAttr->uBufSize;
    }

    CIRC_BUF_Init(&state->stCB,
		  state->stAttr.pBufWptr,
		  state->stAttr.pBufRptr,
		  state->stAttr.pBufAddr,
		  state->stAttr.uBufSize);
    *phRBUF = (HI_VOID*) state;
}

HI_VOID RBUF_Create_EXT(HI_VOID** phRBUF, RBUF_ATTR_S* pstAttr)
{
    RBUF_STATE_S* state = HI_NULL;
    HI_VOID* rbfbase = HI_NULL;

    state = (RBUF_STATE_S*)HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(RBUF_STATE_S));
    if (!state)
    {
	*phRBUF = HI_NULL;
	return;
    }

    // initialize
    adsp_memset(state, 0, sizeof(RBUF_STATE_S));

    adsp_memcpy(&state->stAttr, pstAttr, sizeof(RBUF_ATTR_S));

    /* RBF provided by internal */
    if (!pstAttr->bExtMem)
    {
	rbfbase = HI_ADSP_VMALLOC_Aligned(ADSP_ID_AOE, pstAttr->uBufSize, pstAttr->uFrameSize);
	if (!rbfbase)
	{
	    HI_ADSP_FREE(ADSP_ID_AOE, state);
	    *phRBUF = HI_NULL;
	    return;
	}

	state->stAttr.pBufAddr = rbfbase;
	state->stAttr.uBufSize = pstAttr->uBufSize;
    }

    CIRC_BUF_Init_EXT(&state->stCB,
		      state->stAttr.pBufWptr,
		      state->stAttr.pBufRptr,
		      state->stAttr.pBufAddr,
		      state->stAttr.uBufSize);
    *phRBUF = (HI_VOID*)state;
}

HI_VOID RBUF_Destroy(HI_VOID* hRBUF)
{
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return;
    }

    state = (RBUF_STATE_S *)hRBUF;
    CIRC_BUF_DeInit(&state->stCB);
    if (!state->stAttr.bExtMem)
    {
	HI_ADSP_VFREE_Aligned(ADSP_ID_AOE, (HI_VOID*)state->stAttr.pBufAddr);
    }

    HI_ADSP_FREE(ADSP_ID_AOE, (HI_VOID*)state);
}

HI_U32	RBUF_ReadData(HI_VOID* hRBUF, HI_U8 * pu32Dest, HI_U32 u32DestSize)
{
    HI_U32 Bytes = 0;
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return 0;
    }

    state = (RBUF_STATE_S *)hRBUF;

    state->stProc.uTryReadCnt++;
    Bytes = CIRC_BUF_Read(&state->stCB, pu32Dest, u32DestSize);
    if (!Bytes)
    {
	state->stProc.uBufEmptyCnt++;
    }

    state->stProc.uTotalByteRead += Bytes;

    return Bytes;
}

HI_U32	RBUF_WriteData(HI_VOID* hRBUF, HI_U8 * pu32Src, HI_U32 u3SrcLen)
{
    HI_U32 Bytes = 0;
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return u3SrcLen; /* discard data */
    }

    state = (RBUF_STATE_S *)hRBUF;

    state->stProc.uTryWriteCnt++;
    Bytes = CIRC_BUF_Write(&state->stCB, pu32Src, u3SrcLen);
    if (!Bytes)
    {
	state->stProc.uBufFullCnt++;
    }

    state->stProc.uTotalByteWrite += Bytes;

    return Bytes;
}

HI_VOID RBUF_ReadDataComplete(HI_VOID* hRBUF, HI_U32 amountRead)
{
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return;
    }

    state = (RBUF_STATE_S *)hRBUF;
    CIRC_BUF_UpdateRptr(&state->stCB, amountRead);

    state->stProc.uTotalByteRead += amountRead;
    return;
}

HI_VOID RBUF_WriteDataComplete(HI_VOID* hRBUF, HI_U32 amountWritten)
{
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return;
    }

    state = (RBUF_STATE_S *)hRBUF;
    CIRC_BUF_UpdateWptr(&state->stCB, amountWritten);

    state->stProc.uTotalByteWrite += amountWritten;
    return;
}

HI_VOID RBUF_QueryInfo(HI_VOID* hRBUF, RBUF_INFO_S * pstBufInfo)
{
    RBUF_STATE_S *state;
    HI_U32 u32Gap;

    if (HI_NULL == hRBUF)
    {
	adsp_memset(pstBufInfo, 0, sizeof(RBUF_INFO_S));
	return;
    }

    state  = (RBUF_STATE_S *)hRBUF;
    u32Gap = state->stAttr.uFrameSize;
    pstBufInfo->u32LatencySize = state->stAttr.uLatencySize;
    pstBufInfo->pBasePtr  = (HI_VOID *)state->stCB.pu8Data;
    pstBufInfo->u32BufSize  = state->stCB.u32Lenght;
    pstBufInfo->u32WritePtr = *state->stCB.pu32Write;
    pstBufInfo->u32ReadPtr = *state->stCB.pu32Read;
    CIRC_BUF_QueryBusy_Ext(&state->stCB, &pstBufInfo->u32ContiguousDataSize, &pstBufInfo->u32TotalDataSize);
    CIRC_BUF_QueryFree_Ext(&state->stCB, u32Gap, &pstBufInfo->u32ContiguousFreeSize, &pstBufInfo->u32TotalFreeSize);

    return;
}

HI_U32 RBUF_QueryBusy_ProvideRptr(HI_VOID* hRBUF, HI_U32 *pu32ReadPtr)
{
    RBUF_STATE_S *state = (RBUF_STATE_S *)hRBUF;

    if (state == HI_NULL)
    {
	return 0;
    }

    return CIRC_BUF_QueryBusy_ProvideRptr(&state->stCB, pu32ReadPtr);
}

HI_U32 RBUF_QueryBusy(HI_VOID* hRBUF)
{
    RBUF_STATE_S *state;

    if (hRBUF == HI_NULL)
    {
	return 0;
    }
    state  = (RBUF_STATE_S *)hRBUF;

    return CIRC_BUF_QueryBusy(&state->stCB);
}

HI_U32 RBUF_QueryFree(HI_VOID* hRBUF)
{
    RBUF_STATE_S *state;

    if (hRBUF == HI_NULL)
    {
	return 0;
    }
    state  = (RBUF_STATE_S *)hRBUF;

    return CIRC_BUF_QueryFree(&state->stCB, state->stAttr.uFrameSize);
}

HI_BOOL RBUF_CheckFree(HI_VOID* hRBUF, HI_U32 blocksize)
{
    RBUF_STATE_S *state;

    HI_U32 u32TotalDataSize = 0, u32TotalFreeSize = 0;
    if (HI_NULL == hRBUF)
    {
	return HI_FALSE;
    }

    state  = (RBUF_STATE_S *)hRBUF;

    CIRC_BUF_QueryInfo_Ext(&state->stCB, state->stAttr.uFrameSize, &u32TotalDataSize, &u32TotalFreeSize);

    if ((u32TotalDataSize + blocksize) > state->stAttr.uLatencySize)
    {
	return HI_FALSE;
    }

    if (u32TotalFreeSize <= blocksize)
    {
	return HI_FALSE;
    }
    return HI_TRUE;
}

HI_VOID RBUF_Flush(HI_VOID* hRBUF)
{
    RBUF_STATE_S *state;
    if (HI_NULL == hRBUF)
    {
	return;
    }

    state  = (RBUF_STATE_S *)hRBUF;
    CIRC_BUF_Flush(&state->stCB);
}

HI_U32	RBUF_ReadDataDma(HI_VOID* hRBUF, HI_U8 * pu32Dest, HI_U32 u32DestSize, HI_U32 *pu32Rptr)
{
    HI_U32 Bytes = 0;
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return 0;
    }

    state = (RBUF_STATE_S *)hRBUF;

    if (!pu32Rptr)
    {
	state->stProc.uTryReadCnt++;
    }
    Bytes = CIRC_BUF_ReadDma(&state->stCB, pu32Dest, u32DestSize, pu32Rptr);

    if (!pu32Rptr)
    {
	if (!Bytes)
	{
	    state->stProc.uBufEmptyCnt++;
	}

	state->stProc.uTotalByteRead += Bytes;
    }
    return Bytes;
}

HI_U32	RBUF_WriteDataDma(HI_VOID* hRBUF, HI_U8 * pu32Src, HI_U32 u3SrcLen)
{
    HI_U32 Bytes = 0;
    RBUF_STATE_S *state;

    if (HI_NULL == hRBUF)
    {
	return u3SrcLen; /* discard data */
    }

    state = (RBUF_STATE_S *)hRBUF;

    state->stProc.uTryWriteCnt++;
    Bytes = CIRC_BUF_WriteDma(&state->stCB, pu32Src, u3SrcLen);
    if (!Bytes)
    {
	state->stProc.uBufFullCnt++;
    }

    state->stProc.uTotalByteWrite += Bytes;

    return Bytes;
}

HI_U32	RBUF_CopyData(HI_VOID* hSrc, HI_VOID* hDes, HI_U32 u32Size, ADSP_MEMCPY_DIR_E enDir)
{
    RBUF_STATE_S *pstSrc = (RBUF_STATE_S *)hSrc;
    RBUF_STATE_S *pstDes = (RBUF_STATE_S *)hDes;

    if (HI_NULL == hSrc || HI_NULL == hDes)
    {
	return 0;
    }

    return CIRC_BUF_Copy(&pstSrc->stCB, &pstDes->stCB, u32Size, enDir);
}

HI_VOID RBUF_GetCompressInfo(HI_VOID* hRBUF, HI_U32* pu32ValidBytes, HI_U32* pu32ZeroBytes)
{
    RBUF_STATE_S *state;
    if (HI_NULL == hRBUF)
    {
	*pu32ValidBytes = 0;
	*pu32ZeroBytes	= 0;
	return;
    }

    state = (RBUF_STATE_S *)hRBUF;

    CIRC_BUF_GetCompressInfo(&state->stCB, pu32ValidBytes, pu32ZeroBytes);
}

HI_VOID RBUF_UpdateAttr(HI_VOID* hRBUF, RBUF_ATTR_S* pstAttr)
{
    RBUF_STATE_S *state;

    if (hRBUF == HI_NULL)
    {
	return;
    }
    state  = (RBUF_STATE_S *)hRBUF;

    state->stAttr.uLatencyMs   = pstAttr->uLatencyMs;
    state->stAttr.uLatencySize = pstAttr->uLatencySize;
}
