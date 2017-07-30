/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __AOE_AOP_H__
#define __AOE_AOP_H__

#include "hi_type.h"
#include "hi_dsp_common.h"
#include "hi_dsp_util.h"
#include "hi_dsp_ringbuf.h"
#include "hi_dsp_aoe.h"

#ifdef __cplusplus
extern "C" {
#endif

#define AOP_PROCESS_PERIONDMS_DEFAULT 5
#define AOP_PROCESS_PERIONDMS_MAX 10
#define AOP_PROCESS_PERIONDMS_MIN 2

/** Define the status of an AOP */
typedef enum
{
    AOP_STATUS_STOP = 0,
    AOP_STATUS_START,

    AOP_STATUS_BUTT
} AOP_STATUS_E;

typedef struct
{
    HI_U32 u32BitPerSample;
    HI_U32 u32Channels;
    HI_U32 u32SampleRate;
    HI_U32 u32DataFormat;
    HI_S32 Priority;
    RBUF_ATTR_S stRbfAttr;
} AOP_CHN_ATTR_S;

typedef struct
{
    AOP_STATUS_E CurnStatus;
    HI_S32 Priority;
    HI_U32 u32BitPerSample;
    HI_U32 u32Channels;
    HI_U32 uFrameSize;
    HI_BOOL bBypass;
    HI_BOOL bAdEnable;
    HI_BOOL bCast;
    HI_U32  u32RealDelayms;
} AOP_CHN_STAUTS_S;

/******************************* API Declaration *****************************/
HI_VOID AOP_Init(HI_VOID* pAopRegBase);
HI_VOID AOP_DeInit(HI_VOID);
HI_VOID AOP_Process(HI_VOID);

HI_VOID AOP_GetChnStatus(HI_U32 Id, AOP_CHN_STAUTS_S* pstStatus);
HI_U32	AOP_WriteRbfData(HI_U32 Id, HI_DSP_AUDFRAME_S* pstFrame);
HI_BOOL AOP_QueryRbfFree(HI_U32 Id, HI_U32 blocksize);
//HI_VOID AOP_Flush(HI_U32 Id);

HI_VOID AOP_WriteBuffProcTryCnt(HI_U32 Aop);
HI_VOID AOP_WriteBuffProcOKCnt(HI_U32 Aop);

HI_VOID* AOP_GetRingOut(HI_U32 Id);
HI_VOID AOP_ProcDelayCompensation(HI_U32 Aop);

/** @}*/  /** <!-- ==== API Declaration End ====*/

#ifdef __cplusplus
}
#endif

#endif
