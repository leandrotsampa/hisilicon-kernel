/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __AOE_ENGINE_PRIV__H__
#define	 __AOE_ENGINE_PRIV__H__

#include "hi_type.h"
#include "hi_audsp_aoe.h"
#include "hi_dsp_common.h"
#include "aoe_engine.h"

#define MIX_MC_CHN_NUM	    8	 /* 8chn for mc out frame */

typedef enum
{
    ENGINE_EFFECT_NO_FLUSH = 0,
    ENGINE_EFFECT_FLUSH_IMMEDIATELY,
    ENGINE_EFFECT_FLUSH_LATER,

    ENGINE_EFFECT_FLUSH_BUTT
} ENGINE_EFFECT_FLUSH_E;

/**Defines the	status of an ENGINE.*/
typedef enum
{
    ENGINE_STATUS_STOP = 0,
    ENGINE_STATUS_START,

    ENGINE_STATUS_BUTT
} ENGINE_STATUS_E;

typedef struct
{
    HI_U32 u32BitPerSample;
    HI_U32 u32Channels;
    HI_U32 u32SampleRate;
    HI_U32 u32DataFormat;
    HI_U32 u32SamplePerFrame;

    HI_U32 u32ValidBytes;
    HI_U32 u32ZeroBytes;

    HI_VOID*		pAefInBufAddr;
    HI_U32		u32AefInBufPeriodSize;
    HI_U32		u32AefInBufPeriondNum;
    HI_VOID*		pAefOutBufAddr;
    HI_U32		u32AefOutBufPeriodSize;
    HI_U32		u32AefOutBufPeriondNum;
} ENGINE_CHAN_ATTR_S;

typedef struct
{
    S_MIXER_REGS_TYPE* hwEneReg[AOE_MAX_ENGINE_NUM];
    HI_VOID*	 hEne[AOE_MAX_ENGINE_NUM];
} ENGINE_GLOBAL_SOURCE_S;

typedef struct
{
    HI_U32    read_idx;
    HI_U32    write_idx;
    HI_U32    delay_num;
} ENGINE_DELAYFIFO_STATUS_S;

typedef struct
{
    ENGINE_CHAN_ATTR_S stAttr;

    HI_U32  AipMask;
    HI_U32  AipHiPriorityMask;
    HI_U32  AipLoPriorityMask;
    HI_U32  AipBufDataFlag;
    HI_U32  AopMask;
    HI_U32  AopHiPriorityMask;
    HI_U32  AopLoPriorityMask;
    HI_U32  AopNoneUnifyMask;
    HI_U32  AopNeedUnifyMask;
    HI_U32  AopBufFreeFlag;
    HI_U32  AefMask;
    HI_BOOL bAefInBufFree;
    HI_BOOL bAefOutBufData;

    HI_U32	    EngineId;
    HI_U32	    BlockSize;
    HI_U32	    FrameSize;
    ENGINE_STATUS_E CurStatus;

    HI_U32		    CntForFlush;
    HI_U32		    u32AipStopMask;
    ENGINE_EFFECT_FLUSH_E   enFlush;

    HI_U32	    AefFrmDelay;
    HI_U32	    u32OutBufReadIdx;
    HI_U32	    u32OutBufReadWrap;
    HI_U32	    u32InbufWriteIdx;
    HI_U32	    u32InbufWriteWrap;

    HI_BOOL	    bMixAssocFrm;
    HI_BOOL	    bMixMcFrm;
    HI_BOOL	    bSupportMc;
    //pcm mix frame
    //mix out frame
    HI_DSP_AUDFRAME_S stMixDmxFrm;
    HI_DSP_AUDFRAME_S stMixAssocFrm;
    HI_DSP_AUDFRAME_S stMixMcFrm;
    HI_DSP_AUDFRAME_S stBakMixDmxFrm;

    //engine out frame
    HI_DSP_AUDFRAME_S stMixDmxDelayFrm;
    HI_DSP_AUDFRAME_S stMixAssocDelayFrm;
    HI_DSP_AUDFRAME_S stMixAefFrm;
} ENGINE_STATE_S;

#endif
