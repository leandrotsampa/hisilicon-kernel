/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	: drv_hifb_fence.h
Version		: Initial Draft
Author		:
Created		: 2016/02/02
Description	:
Function List	:


History		:
Date		    Author		  Modification
2016/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_HIFB_FENCE_H__
#define __DRV_HIFB_FENCE_H__

/*********************************add include here******************************/
#include <sw_sync.h>

#include "drv_hifb_osr.h"

/***************************** Macro Definition ******************************/

#define HIFB_FENCE_NAME		   "hifb_fence"

/*************************** Structure Definition ****************************/
typedef struct
{
    atomic_t UpdateCnt;
    HI_U32   u32FenceValue;
    HI_U32   u32Timeline;
    HI_U32  FrameEndFlag;
    wait_queue_head_t	 FrameEndEvent;
    struct sw_sync_timeline *pstTimeline;
    HI_BOOL bFrameHit;
    spinlock_t	       lock;
}HIFB_SYNC_INFO_S;

/********************** Global Variable declaration **************************/


#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
#define hi_sync_fence                           sync_file
#define hi_sync_fence_create(sync_pt)           sync_file_create(&sync_pt->base)
#define hi_sync_fence_install(fence,fence_fd)   fd_install(fence_fd, fence->file)
#define hi_sync_fence_wait(fence,timeout)       fence_wait_timeout(fence->fence, true, timeout)
#define hi_sync_fence_fdget                     sync_file_fdget
#define hi_sync_fence_put(fence)                fput(fence->file)
#else
#define hi_sync_fence                           sync_fence
#define hi_sw_sync_timeline_create              sw_sync_timeline_create
#define hi_sync_fence_create(sync_pt)           sync_fence_create(HIFB_SYNC_NAME, sync_pt)
#define hi_sync_timeline_destroy                sync_timeline_destroy
#define hi_sync_fence_install(fence,fence_fd)   sync_fence_install(fence, fence_fd)
#define hi_sync_fence_wait(fence,timeout)       sync_fence_wait(fence, timeout)
#define hi_sw_sync_timeline_inc                 sw_sync_timeline_inc
#define hi_sw_sync_pt_create                    sw_sync_pt_create
#define hi_sync_pt_free                         sync_pt_free
#define hi_sync_fence_fdget                     sync_fence_fdget
#define hi_sync_fence_put(fence)                sync_fence_put(fence)
#endif

/******************************* API declaration *****************************/

HI_S32	DRV_HIFB_FenceInit(HIFB_PAR_S *par);
HI_VOID DRV_HIFB_FenceDInit(HIFB_PAR_S *par);
HI_VOID DRV_HIFB_FENCE_FrameEndCallBack(HI_VOID);
HI_BOOL DRV_HIFB_FENCE_IsRefresh(HI_VOID);
HI_S32	DRV_HIFB_FENCE_Create(HI_VOID);
HI_VOID DRV_HIFB_IncRefreshTime(HI_BOOL bLayerEnable);
HI_VOID DRV_HIFB_WaiteRefreshEnd(HI_BOOL ShouldWaite);
HI_S32  DRV_HIFB_FENCE_Waite(struct hi_sync_fence *fence, long timeout);

#endif
