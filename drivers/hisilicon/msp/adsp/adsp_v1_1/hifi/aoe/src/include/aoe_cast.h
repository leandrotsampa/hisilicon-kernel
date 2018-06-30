/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __AOE_CAST_H__
#define __AOE_CAST_H__

#include "hi_type.h"
#include "hi_dsp_ringbuf.h"

typedef struct
{
    HI_U32 uBufWriteOkCnt;
    HI_U32 uBufWriteMuteCnt;
    HI_U32 uBufOverWriteCnt;
    HI_U32 uBufWriteTotalCnt;
    HI_U32 uFIFOForceReadCnt;
    HI_U32 uFIFOReadTryCnt;
    HI_U32 uFIFOReadOkCnt;
} Cast_PROC_STATUS_S;

typedef struct
{
    HI_U32 u32BitPerSample;
    HI_U32 u32Channels;
    HI_U32 u32SampleRate;
    HI_U32 uBufWptr;
    HI_U32 uBufRptr;
    HI_U32 uWorkBufUseSize;
} CAST_CHN_ATTR_S;

typedef struct
{
    HI_U32 u32BitPerSample;
    HI_U32 u32Channels;
    HI_U32 u32SampleRate;
} CAST_ATTR_S;

HI_VOID	  CAST_SetAopBuf(HI_U32 Id, HI_VOID* hRing);
HI_VOID	  CAST_Destroy(HI_U32 Id);
HI_VOID*  CAST_Create(HI_U32 Aop, RBUF_ATTR_S* pstAttr, HI_U32 u32BitPerSample, HI_U32 Channels, HI_U32 u32SampleRate);

HI_VOID	  CAST_Init(HI_VOID* pAopRegBase);
HI_VOID	  CAST_DeInit(HI_U32 Id);
HI_VOID	  CAST_FiFoFreeCnt(HI_U32 uAopId);
HI_VOID	  CAST_FiFoTryCnt(HI_U32 uAopId);

#endif
