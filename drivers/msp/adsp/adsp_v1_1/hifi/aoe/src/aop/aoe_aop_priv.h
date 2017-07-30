/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __AOE_AOP_PRIV__H__
#define	 __AOE_AOP_PRIV__H__

#include "hi_type.h"
#include "hi_audsp_aoe.h"
#include "aoe_aop.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
    UTIL_GAIN_ATTR_S   stCurrentGain;  //the current gain, inner gain
    UTIL_GAIN_ATTR_S   stTargetGain;  //the target gain, user gain
    HI_S32	       s32Balance;
    HI_BOOL	       bMute;
    AOP_CHN_ATTR_S     stAttr;
    HI_BOOL	       bBypass;
    HI_BOOL	       bAdEnable;
    HI_BOOL	       bCast;
    HI_VOID*	       hRingOut;

    AOP_STATUS_E       CurnStatus;

    HI_U32	       u32RealDelayms;
    HI_U32	       u32LastDelayMs;
    HI_BOOL	       bAudioDelaySetted;
} AOP_STATE_S;

typedef struct
{
    S_AOP_REGS_TYPE* hwAopReg[AOE_MAX_AOP_NUM];
    HI_VOID*	     hAop[AOE_MAX_AOP_NUM];
} AOP_GLOBAL_SOURCE_S;

#ifdef __cplusplus
}
#endif

#endif
