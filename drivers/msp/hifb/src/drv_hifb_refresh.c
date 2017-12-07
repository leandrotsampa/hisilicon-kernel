/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	: drv_hifb_refresh.c
Version		: Initial Draft
Author		:
Created		: 2016/06/16
Description	:
Function List	:


History		:
Date		    Author		  Modification
2016/06/16	   y00181162		  Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/*********************************add include here******************************/
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/file.h>
#include <linux/fb.h>

#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_config.h"
#include "drv_hifb_paracheck.h"

#ifdef CONFIG_HIFB_TRANSIT_LOGO_BY_MASK
#include "drv_hifb_logo.h"
#endif

#ifdef CFG_HIFB_FENCE_SUPPORT
#include "drv_hifb_fence.h"
#endif


/***************************** Macro Definition ******************************/


/*************************** Structure Definition ****************************/
#ifdef CFG_HIFB_FENCE_SUPPORT
typedef struct tagHifbRefreshWorkQueue_S
{
    HIFB_PAR_S *pstPar;
    HIFB_HWC_LAYERINFO_S stLayerInfo;
    struct hi_sync_fence *pSyncfence;
    struct work_struct HwcRefreshWork;
}HIFB_REFRESH_WORKQUEUE_S;
#endif


/********************** Global Variable declaration **************************/


/******************************* API declaration *****************************/

static HI_S32  HIFB_PanDisplayForStero(struct fb_var_screeninfo *var, struct fb_info *info);
static HI_VOID HIFB_PanDisplayForNoStero(struct fb_var_screeninfo *var, struct fb_info *info);
static HI_VOID HIFB_UpNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info);
static HI_U32  HIFB_GetNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info);

extern HI_VOID HI_UNF_HIFB_CaptureImgFromLayer(HI_U32 u32LayerID, HI_BOOL bAlphaEnable);

#ifdef CFG_HIFB_FENCE_SUPPORT
static HI_VOID DRV_HIFB_HwcRefreshWork(struct work_struct *work);
static HI_VOID HIFB_HwcRefresh(HIFB_REFRESH_WORKQUEUE_S *pstWork);
#endif

/******************************* API realization *****************************/

HI_S32 DRV_HIFB_PanDisplay(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar = NULL;

    HIFB_CHECK_NULLPOINTER_RETURN(var, HI_FAILURE);
    HIFB_CHECK_NULLPOINTER_RETURN(info, HI_FAILURE);

    pstPar = (HIFB_PAR_S *)info->par;
    HIFB_CHECK_NULLPOINTER_RETURN(pstPar, HI_FAILURE);

    HIFB_CHECK_UNEQUAL_RETURN(HIFB_REFRESH_MODE_WITH_PANDISPLAY, pstPar->stExtendInfo.enBufMode, HI_SUCCESS);

    HI_UNF_HIFB_CaptureImgFromLayer(pstPar->stBaseInfo.u32LayerID, HI_FALSE);

    (HI_TRUE == pstPar->st3DInfo.IsStereo) ? (HIFB_PanDisplayForStero(var,info)) : (HIFB_PanDisplayForNoStero(var,info));

    pstPar->bHwcRefresh = HI_FALSE;

#ifdef CONFIG_HIFB_TRANSIT_LOGO_BY_MASK
    if (HI_FALSE == pstPar->bSetPar)
    {
       DRV_HIFB_CloseLogoByMask(pstPar->stBaseInfo.u32LayerID);
    }
    pstPar->bSetPar = HI_FALSE;
#endif

    return HI_SUCCESS;
}


static HI_S32 HIFB_PanDisplayForStero(struct fb_var_screeninfo *var, struct fb_info *info)
{
#ifdef CFG_HIFB_STEREO3D_HW_SUPPORT
     HI_S32 Ret = HI_SUCCESS;
     HIFB_PAR_S *pstPar = (HIFB_PAR_S *)info->par;
     HIFB_BUFFER_S stInputDataBuf;
     HIFB_BLIT_OPT_S stBlitOpt;

     if ((HIFB_STEREO_FRMPACKING == pstPar->st3DInfo.StereoMode) || (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart))
     {
	HIFB_UpNonStereoADDR(var,info);
	return HI_SUCCESS;
     }

     HI_GFX_Memset(&stInputDataBuf, 0x0, sizeof(HIFB_BUFFER_S));
     stInputDataBuf.stCanvas.enFmt	= pstPar->stExtendInfo.enColFmt;
     stInputDataBuf.stCanvas.u32Pitch	= info->fix.line_length;
     stInputDataBuf.stCanvas.u32PhyAddr = HIFB_GetNonStereoADDR(var,info);
     stInputDataBuf.stCanvas.u32Width	= info->var.xres;
     stInputDataBuf.stCanvas.u32Height	= info->var.yres;

     stInputDataBuf.UpdateRect.x = 0;
     stInputDataBuf.UpdateRect.y = 0;
     stInputDataBuf.UpdateRect.w = stInputDataBuf.stCanvas.u32Width;
     stInputDataBuf.UpdateRect.h = stInputDataBuf.stCanvas.u32Height;

     pstPar->st3DInfo.st3DSurface.enFmt	     = stInputDataBuf.stCanvas.enFmt;
     pstPar->st3DInfo.st3DSurface.u32Width   = stInputDataBuf.stCanvas.u32Width;
     pstPar->st3DInfo.st3DSurface.u32Height  = stInputDataBuf.stCanvas.u32Height;
     pstPar->st3DInfo.st3DSurface.u32PhyAddr = pstPar->st3DInfo.u32DisplayAddr[pstPar->stRunInfo.u32IndexForInt];

     HI_GFX_Memset(&stBlitOpt, 0, sizeof(HIFB_BLIT_OPT_S));
     stBlitOpt.bScale = HI_TRUE;
     stBlitOpt.bBlock = HI_TRUE;
     stBlitOpt.bRegionDeflicker = HI_TRUE;
     if (HIFB_ANTIFLICKER_TDE == pstPar->stBaseInfo.enAntiflickerMode)
     {
	 stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
     }


     stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);
     stBlitOpt.bCallBack = HI_TRUE;
     stBlitOpt.pfnCallBack = (IntCallBack)DRV_HIFB_BlitFinishCallBack;

     Ret = DRV_HIFB_UpStereoData(pstPar->stBaseInfo.u32LayerID, &stInputDataBuf, &stBlitOpt);
     if (HI_SUCCESS != Ret)
     {
	 HIFB_ERROR("pandisplay config stereo data failure!");
	 return HI_FAILURE;
     }
#endif

#ifndef CFG_HIFB_STEREO3D_HW_SUPPORT
     UNUSED(info);
#endif

     return HI_SUCCESS;
}



static HI_VOID HIFB_PanDisplayForNoStero(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar = (HIFB_PAR_S *)info->par;

    HIFB_UpNonStereoADDR(var,info);

    if ( (var->activate & FB_ACTIVATE_VBL) && (HI_TRUE == pstPar->bVblank))
    {
	DRV_HIFB_WaitVBlank(pstPar->stBaseInfo.u32LayerID);
    }

    return;
}


static HI_VOID HIFB_UpNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar = (HIFB_PAR_S *)info->par;

    HIFB_CHECK_NULLPOINTER_UNRETURN(pstPar);

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.CurScreenAddr	  = HIFB_GetNonStereoADDR(var,info);
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    return;
}


static HI_U32 HIFB_GetNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info)
{
     HI_U32 u32Align = 0xf;
     HI_U32 PerPixDepth = 0;
     HI_U32 PixXOffset = 0;
     HI_U32 PixYOffset = 0;
     HI_U32 StartDisplayAddr = 0;
     HIFB_PAR_S *pstPar = (HIFB_PAR_S *)info->par;

     PerPixDepth = DRV_HIFB_GetPixDepth(var->bits_per_pixel);
     PixXOffset	 = var->xoffset * PerPixDepth;
     PixYOffset	 = info->fix.line_length * var->yoffset;

     if (0 !=  pstPar->stRunInfo.LastScreenAddr)
     {
	 return pstPar->stRunInfo.LastScreenAddr;
     }

     if ( (info->var.bits_per_pixel == 24) && ( (info->var.xoffset != 0) || (info->var.yoffset != 0) ) )
     {
	StartDisplayAddr = (info->fix.smem_start + PixYOffset + PixXOffset)/16/3;
	StartDisplayAddr = StartDisplayAddr * 16 * 3;
     }
     else
     {
	StartDisplayAddr = (info->fix.smem_start + PixYOffset + PixXOffset) & (~u32Align);
     }

     return StartDisplayAddr;
}



#ifdef CFG_HIFB_FENCE_SUPPORT
HI_S32 DRV_HIFB_FenceRefresh(HIFB_PAR_S* pstPar, HI_VOID *pArgs)
{
    HI_S32 Ret = 1;
    HI_S32 s32FenceFd = -1;
    HIFB_REFRESH_WORKQUEUE_S *pstWork = NULL;

    if ((NULL == pstPar) || (NULL == pArgs))
    {
	HIFB_ERROR("hwc refresh input par is null\n");
	return -EFAULT;
    }

    pstWork = (HIFB_REFRESH_WORKQUEUE_S*)HI_GFX_KMALLOC(HIGFX_FB_ID,sizeof(HIFB_REFRESH_WORKQUEUE_S), GFP_KERNEL);
    if (NULL == pstWork)
    {
	HIFB_ERROR("HI_GFX_KMALLOC pstWork size %d is failed!\n", sizeof(HIFB_REFRESH_WORKQUEUE_S));
	return -EFAULT;
    }

    s32FenceFd = DRV_HIFB_FENCE_Create();
    if (s32FenceFd < 0)
    {
	HIFB_ERROR("DRV_HIFB_FENCE_Create failed! s32Ret = 0x%x\n", s32FenceFd);
	HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
	return -EFAULT;
    }

    if (copy_from_user(&(pstWork->stLayerInfo), pArgs, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HIFB_ERROR("copy hwc layerinfo from user failure\n");
       HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
       return -EFAULT;
    }

    pstPar->stProcInfo.HwcRefreshUnSyncCnt++;
    pstPar->stProcInfo.b3DStatus = pstPar->st3DInfo.IsStereo;
    pstPar->stProcInfo.bHwcRefreshInDeCmpStatus = pstWork->stLayerInfo.bDeCompress;
    pstPar->stProcInfo.HwcRefreshInDispFmt	= (HI_U32)pstWork->stLayerInfo.eFmt;
    pstPar->stProcInfo.HwcRefreshInDispStride	= pstWork->stLayerInfo.u32Stride;
    pstPar->stProcInfo.HwcRefreshInDispAdress	= pstWork->stLayerInfo.u32LayerAddr;

    pstWork->pstPar = pstPar;
    pstWork->stLayerInfo.s32ReleaseFenceFd = s32FenceFd;

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
#else
    if (pstWork->stLayerInfo.s32AcquireFenceFd >= 0)
    {
        pstWork->pSyncfence = hi_sync_fence_fdget(pstWork->stLayerInfo.s32AcquireFenceFd);
    }
    else
    {
	pstWork->pSyncfence = NULL;
    }
#endif

    if (NULL == pstPar->pstHwcRefreshWorkqueue)
    {
	HIFB_ERROR("the hwc work queue has not been create for layer%d\n", pstPar->stBaseInfo.u32LayerID);
	put_unused_fd(pstWork->stLayerInfo.s32ReleaseFenceFd);
	HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
	return -EFAULT;
    }

    pstWork->stLayerInfo.bStereo = pstPar->st3DInfo.IsStereo;
    if (copy_to_user(pArgs,&(pstWork->stLayerInfo),sizeof(HIFB_HWC_LAYERINFO_S)))
    {
	HIFB_ERROR("copy layerinfo to user failure\n");
	put_unused_fd(pstWork->stLayerInfo.s32ReleaseFenceFd);
	HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
	return -EFAULT;
    }

    pstPar->bEndHwcRefresh = HI_FALSE;
    INIT_WORK(&(pstWork->HwcRefreshWork), DRV_HIFB_HwcRefreshWork);
    queue_work(pstPar->pstHwcRefreshWorkqueue, &(pstWork->HwcRefreshWork));
    if (HI_FALSE == pstPar->bHwcRefreshWithWorkQueue)
    {
       Ret = wait_event_interruptible_timeout(pstPar->WaiteEndHwcRefresh, HI_TRUE == pstPar->bEndHwcRefresh,50 * HZ/1000);
    }
    if (Ret <= 0)
    {
	HIFB_INFO("+++++++warnint:refresh time out\n");
    }

    pstPar->bEndHwcRefresh = HI_FALSE;

    return HI_SUCCESS;
}


static HI_VOID DRV_HIFB_HwcRefreshWork(struct work_struct *work)
{
    HIFB_PAR_S *pstPar	= NULL;
    HI_BOOL NoDiscardFrame = HI_FALSE;
    HIFB_REFRESH_WORKQUEUE_S *pstWork = NULL;

    pstWork = (HIFB_REFRESH_WORKQUEUE_S*)container_of(work, HIFB_REFRESH_WORKQUEUE_S, HwcRefreshWork);

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
	if (pstWork->stLayerInfo.s32AcquireFenceFd >= 0)
	{
		struct fence *fence = sync_file_get_fence(pstWork->stLayerInfo.s32AcquireFenceFd);
		fence_wait_timeout(fence, true, 4000);
		fence_put(fence);
	}
#else
    if (NULL != pstWork->pSyncfence)
    {
	DRV_HIFB_FENCE_Waite(pstWork->pSyncfence, -1);
	hi_sync_fence_put(pstWork->pSyncfence);
	pstWork->pSyncfence = NULL;
    }
#endif
    pstPar = pstWork->pstPar;

    if (pstPar->u8RefreshCount > 0)
    {
       g_stDrvAdpCallBackFunction.HIFB_DRV_WhetherDiscardFrame(pstPar->stBaseInfo.u32LayerID, &NoDiscardFrame);
       DRV_HIFB_WaiteRefreshEnd(NoDiscardFrame);
    }

    HIFB_HwcRefresh(pstWork);

    pstPar->stFrameInfo.u32RefreshFrame++;
    pstPar->bHwcRefresh = HI_TRUE;

    HI_GFX_KFREE(HIGFX_FB_ID,pstWork);

    pstPar->bEndHwcRefresh = HI_TRUE;
    wake_up_interruptible(&pstPar->WaiteEndHwcRefresh);

    pstPar->stProcInfo.HwcRefreshUnSyncCnt--;

    return;
}


static HI_VOID HIFB_HwcRefresh(HIFB_REFRESH_WORKQUEUE_S *pstWork)
{
    HI_BOOL bDispEnable = HI_FALSE;
    HI_ULONG LockParFlag = 0;
    HI_BOOL bShouldClosePreMult = HI_FALSE;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;

    HIFB_CHECK_NULLPOINTER_UNRETURN(pstWork);

    pstPar  = pstWork->pstPar;
    HIFB_CHECK_NULLPOINTER_UNRETURN(pstPar);

    info = s_stLayer[pstPar->stBaseInfo.u32LayerID].pstInfo;
    HIFB_CHECK_NULLPOINTER_UNRETURN(info);

    if ((HI_TRUE == pstWork->stLayerInfo.bDeCompress) && (HI_TRUE == pstPar->st3DInfo.IsStereo))
    {
	HIFB_ERROR("3d and decompress state is wrong\n");
	return;
    }

    g_stDrvAdpCallBackFunction.HIFB_DRV_GetClosePreMultState(pstPar->stBaseInfo.u32LayerID, &bShouldClosePreMult);
    if (HI_TRUE == bShouldClosePreMult)
    {
	pstPar->stBaseInfo.bPreMul = HI_FALSE;
    }
    else
    {
	pstPar->stBaseInfo.bPreMul = pstWork->stLayerInfo.bPreMul;
    }

    pstPar->stRunInfo.LastScreenAddr = pstWork->stLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt    = pstWork->stLayerInfo.eFmt;
    g_stDrvAdpCallBackFunction.HIFB_DRV_SetLayerDataFmt(pstPar->stBaseInfo.u32LayerID, pstWork->stLayerInfo.eFmt);

    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
	pstPar->bDeCompress = HI_FALSE;
	g_stDrvAdpCallBackFunction.HIFB_DRV_SetDeCmpSwitch(pstPar->stBaseInfo.u32LayerID, HI_FALSE);

	info->var.yoffset = (pstWork->stLayerInfo.u32LayerAddr - info->fix.smem_start)/pstWork->stLayerInfo.u32Stride;
	DRV_HIFB_PanDisplay(&info->var, info);

	g_stDrvAdpCallBackFunction.HIFB_DRV_GetHaltDispStatus(pstPar->stBaseInfo.u32LayerID, &bDispEnable);

	DRV_HIFB_IncRefreshTime(bDispEnable);

	return;
    }

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockParFlag);
    pstPar->stRunInfo.bModifying	  = HI_TRUE;
    pstPar->bDeCompress			  = pstWork->stLayerInfo.bDeCompress;
    pstPar->stRunInfo.CurScreenAddr	  = pstWork->stLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.stPos.s32XPos	  = pstWork->stLayerInfo.stInRect.x;
    pstPar->stExtendInfo.stPos.s32YPos	  = pstWork->stLayerInfo.stInRect.y;
    pstPar->stExtendInfo.u32DisplayWidth  = pstWork->stLayerInfo.stInRect.w;
    pstPar->stExtendInfo.u32DisplayHeight = pstWork->stLayerInfo.stInRect.h;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FENCE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_BMUL;
    pstPar->stRunInfo.bModifying	  = HI_FALSE;
    pstPar->u8RefreshCount++;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);

    return;
}

#else
HI_S32 DRV_HIFB_NoFenceRefresh(HIFB_PAR_S* pstPar, HI_VOID *pArgs)
{
    HI_BOOL bShouldClosePreMult = HI_FALSE;
    HI_ULONG LockParFlag = 0;
    struct fb_info *info = NULL;
    HIFB_HWC_LAYERINFO_S stHwcLayerInfo;

    HIFB_CHECK_NULLPOINTER_RETURN(pstPar,-EFAULT);
    HIFB_CHECK_NULLPOINTER_RETURN(pArgs,-EFAULT);

    info = s_stLayer[pstPar->stBaseInfo.u32LayerID].pstInfo;
    HIFB_CHECK_NULLPOINTER_RETURN(info,-EFAULT);

    HI_GFX_Memset(&stHwcLayerInfo, 0x0, sizeof(HIFB_HWC_LAYERINFO_S));

    if (copy_from_user(&stHwcLayerInfo, pArgs, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HIFB_ERROR("copy no fence hwc layerinfo from user failure\n");
       return -EFAULT;
    }

    pstPar->stProcInfo.HwcRefreshUnSyncCnt++;
    pstPar->stProcInfo.b3DStatus = pstPar->st3DInfo.IsStereo;
    pstPar->stProcInfo.bHwcRefreshInDeCmpStatus = stHwcLayerInfo.bDeCompress;
    pstPar->stProcInfo.HwcRefreshInDispFmt	= (HI_U32)stHwcLayerInfo.eFmt;
    pstPar->stProcInfo.HwcRefreshInDispStride	= stHwcLayerInfo.u32Stride;
    pstPar->stProcInfo.HwcRefreshInDispAdress	= stHwcLayerInfo.u32LayerAddr;

    stHwcLayerInfo.bStereo = pstPar->st3DInfo.IsStereo;
    if (copy_to_user(pArgs,&stHwcLayerInfo,sizeof(HIFB_HWC_LAYERINFO_S)))
    {
	HIFB_ERROR("copy layerinfo to user failure\n");
	return -EFAULT;
    }

    if ((HI_TRUE == stHwcLayerInfo.bDeCompress) && (HI_TRUE == pstPar->st3DInfo.IsStereo))
    {
	HIFB_ERROR("3d and decompress state is wrong\n");
	return -EFAULT;
    }

    g_stDrvAdpCallBackFunction.HIFB_DRV_GetClosePreMultState(pstPar->stBaseInfo.u32LayerID, &bShouldClosePreMult);
    if (HI_TRUE == bShouldClosePreMult)
    {
	pstPar->stBaseInfo.bPreMul = HI_FALSE;
    }
    else
    {
	pstPar->stBaseInfo.bPreMul = stHwcLayerInfo.bPreMul;
    }

    pstPar->stRunInfo.LastScreenAddr = stHwcLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt = stHwcLayerInfo.eFmt;
    g_stDrvAdpCallBackFunction.HIFB_DRV_SetLayerDataFmt(pstPar->stBaseInfo.u32LayerID, stHwcLayerInfo.eFmt);

    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
	pstPar->bDeCompress = HI_FALSE;
	g_stDrvAdpCallBackFunction.HIFB_DRV_SetDeCmpSwitch(pstPar->stBaseInfo.u32LayerID, HI_FALSE);

	info->var.yoffset = (stHwcLayerInfo.u32LayerAddr - info->fix.smem_start)/stHwcLayerInfo.u32Stride;
	DRV_HIFB_PanDisplay(&info->var, info);

	return HI_SUCCESS;
    }

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockParFlag);
    pstPar->stRunInfo.bModifying	  = HI_TRUE;
    pstPar->bDeCompress			  = stHwcLayerInfo.bDeCompress;
    pstPar->stRunInfo.CurScreenAddr	  = stHwcLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.stPos.s32XPos	  = stHwcLayerInfo.stInRect.x;
    pstPar->stExtendInfo.stPos.s32YPos	  = stHwcLayerInfo.stInRect.y;
    pstPar->stExtendInfo.u32DisplayWidth  = stHwcLayerInfo.stInRect.w;
    pstPar->stExtendInfo.u32DisplayHeight = stHwcLayerInfo.stInRect.h;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FENCE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_BMUL;
    pstPar->stRunInfo.bModifying	  = HI_FALSE;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);

    pstPar->stFrameInfo.u32RefreshFrame++;
    pstPar->bHwcRefresh = HI_TRUE;

    pstPar->stProcInfo.HwcRefreshUnSyncCnt--;

    return HI_SUCCESS;
}
#endif
