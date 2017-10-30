/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DRV_AO_EXT_H__
#define __HI_DRV_AO_EXT_H__

#include "hi_drv_dev.h"
#include "hi_drv_ao.h"

typedef HI_S32 (*FN_AO_DrvResume)(PM_BASEDEV_S*);
typedef HI_S32 (*FN_AO_DrvSuspend)(PM_BASEDEV_S*, pm_message_t);
//for voip
typedef HI_S32	(*FN_AO_TrackGetDefAttr)(HI_UNF_AUDIOTRACK_ATTR_S * );
typedef HI_S32	(*FN_AO_TrackAllocHandle)(HI_UNF_SND_E, HI_UNF_SND_TRACK_TYPE_E, struct file*, HI_HANDLE*);
typedef HI_VOID (*FN_AO_TrackFreeHandle)(HI_HANDLE);
typedef HI_S32	(*FN_AO_TrackCreate)(HI_UNF_SND_E, HI_UNF_AUDIOTRACK_ATTR_S*, HI_BOOL, AO_BUF_ATTR_S*, HI_HANDLE);
typedef HI_S32	(*FN_AO_TrackStart)(HI_U32);
typedef HI_S32	(*FN_AO_TrackStop)(HI_U32);
typedef HI_S32	(*FN_AO_TrackDestory)(HI_U32);
typedef HI_S32	(*FN_AO_TrackSendData)(HI_U32, AO_FRAMEINFO_S*);

typedef struct
{
    FN_AO_DrvResume  pfnAO_DrvResume;
    FN_AO_DrvSuspend pfnAO_DrvSuspend;

    FN_AO_TrackGetDefAttr  pfnAO_TrackGetDefAttr;
    FN_AO_TrackAllocHandle pfnAO_TrackAllocHandle;
    FN_AO_TrackFreeHandle  pfnAO_TrackFreeHandle;
    FN_AO_TrackCreate	   pfnAO_TrackCreate;
    FN_AO_TrackDestory	   pfnAO_TrackDestory;
    FN_AO_TrackStart	   pfnAO_TrackStart;
    FN_AO_TrackStop	   pfnAO_TrackStop;
    FN_AO_TrackSendData	   pfnAO_TrackSendData;
} AIAO_EXPORT_FUNC_S;

HI_S32 AIAO_DRV_ModInit(HI_VOID);
HI_VOID AIAO_DRV_ModExit(HI_VOID);

#endif//__HI_DRV_AO_EXT_H__
