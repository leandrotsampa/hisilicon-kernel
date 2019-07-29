/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __AOE_CAST_PRIV__H__
#define	 __AOE_CAST_PRIV__H__

#include "hi_type.h"
#include "hi_audsp_aoe.h"
#include "aoe_cast.h"

typedef struct
{
    HI_BOOL bLinearMode; /*< gain tpye of volume*/
    HI_U16  u16LGain; /*<Linear gain(bDecibelMode is HI_FALSE) , ranging from 0 to 100*/
    HI_U16  u16RGain; /*<Linear gain(bDecibelMode is HI_FALSE) , ranging from 0 to 100*/
    /*<Decibel gain(bDecibelMode is HI_TRUE) , ranging from 0 to 0x7f�� 0x78 is -1dB, 0x79 is 0dB, 0x7f is 6dB*/
} HI_CAST_GAIN_ATTR_S;

typedef struct
{
    HI_CAST_GAIN_ATTR_S stGain;
    HI_BOOL		bMute;
    CAST_CHN_ATTR_S	stAttr;
    HI_VOID*		hRingFifo;
    HI_VOID*		hRingOut_Cast;
    Cast_PROC_STATUS_S	stProc;
} CAST_STATE_S;

typedef struct
{
    HI_U32	      uCastNum;
    HI_U32	      AopId[AOE_MAX_CAST_NUM];
    S_CAST_REGS_TYPE* hwCastReg[AOE_MAX_CAST_NUM];
    HI_VOID*	      hCast[AOE_MAX_CAST_NUM];

    CAST_ATTR_S	      stCastAttr;
} CAST_SOURCE_S;

#endif
