/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
*****************************************************************************

  File Name	: drv_pq.h
  Version	: Initial Draft
  Author	: p00203646
  Created	: 2014/04/01
  Description	:

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_PQ_H__
#define __DRV_PQ_H__

#include "hi_osal.h"
#include "hi_debug.h"
#include "hi_type.h"

#include "hi_drv_pq.h"
#include "hi_drv_proc.h"
#include "hi_drv_mem.h"
#include "hi_drv_mmz.h"
#include "hi_drv_module.h"

#include "drv_pq_table.h"
#include "pq_hal_comm.h"

#ifdef PQ_ALG_ZME
#include "pq_mng_zme.h"
#endif
#ifdef PQ_ALG_CSC
#include "pq_mng_csc.h"
#endif
#ifdef PQ_ALG_DEI
#include "pq_mng_dei.h"
#endif
#ifdef PQ_ALG_GFXCSC
#include "pq_mng_gfxcsc.h"
#endif
#ifdef PQ_ALG_GFXZME
#include "pq_mng_gfxzme.h"
#endif
#ifdef PQ_ALG_FMD
#include "pq_mng_ifmd.h"
#endif

#define PQ_NAME		   "HI_PQ"

/*�û�PQ ���ݽṹ*/
typedef struct	hiDRV_PQ_PARAM_S
{
    PICTURE_SETTING_S stSDPictureSetting;  /*graph SD setting*/
    PICTURE_SETTING_S stHDPictureSetting;  /*graph HD setting*/
    PICTURE_SETTING_S stSDVideoSetting;	   /*video SD setting*/
    PICTURE_SETTING_S stHDVideoSetting;	   /*video HD setting*/
    HI_U32  u32Strength[HI_PQ_MODULE_BUTT];
    HI_BOOL bDemoOnOff[HI_PQ_MODULE_BUTT];
    HI_BOOL bModuleOnOff[HI_PQ_MODULE_BUTT];
    HI_PQ_COLOR_ENHANCE_S stColorEnhance;
    HI_PQ_DEMO_MODE_E enDemoMode;
} HI_DRV_PQ_PARAM_S;


HI_S32 DRV_PQ_ProcRead(struct seq_file *s, HI_VOID *data);

HI_S32 DRV_PQ_ProcWrite(struct file *file, const char __user *buf, size_t count, loff_t *ppos);

HI_S32 DRV_PQ_GetSDBrightness(HI_U32 *pu32Brightness);

HI_S32 DRV_PQ_SetSDBrightness(HI_U32 u32Brightness);

HI_S32 DRV_PQ_GetSDContrast(HI_U32 *pu32Contrast);

HI_S32 DRV_PQ_SetSDContrast(HI_U32 u32Contrast);

HI_S32 DRV_PQ_GetSDHue(HI_U32 *pu32Hue);

HI_S32 DRV_PQ_SetSDHue(HI_U32 u32Hue);

HI_S32 DRV_PQ_GetSDSaturation(HI_U32 *pu32Saturation);

HI_S32 DRV_PQ_SetSDSaturation(HI_U32 u32Saturation);

HI_S32 DRV_PQ_GetHDBrightness(HI_U32 *pu32Brightness);

HI_S32 DRV_PQ_SetHDBrightness(HI_U32 u32Brightness);

HI_S32 DRV_PQ_GetHDContrast(HI_U32 *pu32Contrast);

HI_S32 DRV_PQ_SetHDContrast(HI_U32 u32Contrast);

HI_S32 DRV_PQ_GetHDHue(HI_U32 *pu32Hue);

HI_S32 DRV_PQ_SetHDHue(HI_U32 u32Hue);

HI_S32 DRV_PQ_GetHDSaturation(HI_U32 *pu32Saturation);

HI_S32 DRV_PQ_SetHDSaturation(HI_U32 u32Saturation);

HI_S32 DRV_PQ_GetSharpness(HI_U32 *pu32Sharpness);

HI_S32 DRV_PQ_SetSharpness(HI_U32 u32Sharpness);

HI_S32 DRV_PQ_GetTnrLevel(HI_U32 *pu32NRLevel);

HI_S32 DRV_PQ_GetSnrLevel(HI_U32 *pu32NRLevel);

HI_S32 DRV_PQ_SetTnrLevel(HI_U32 u32TnrLevel);

HI_S32 DRV_PQ_SetSnrLevel(HI_U32 u32TnrLevel);

HI_S32 DRV_PQ_GetColorEhance(HI_U32 *pu32ColorGainLevel);

HI_S32 DRV_PQ_SetColorEhance(HI_U32 u32ColorGainLevel);

HI_S32 DRV_PQ_GetFleshToneLevel(HI_U32 *pu32FleshToneLevel);

HI_S32 DRV_PQ_SetFleshToneLevel(HI_PQ_FLESHTONE_E enFleshToneLevel);

HI_S32 DRV_PQ_SetDCILevel(HI_U32 u32DCILevel);

HI_S32 DRV_PQ_GetDCILevel(HI_U32 *pu32DCILevel);

HI_S32 DRV_PQ_SetDemoMode(HI_PQ_MODULE_E enModule, HI_BOOL bOnOff);

HI_S32 DRV_PQ_GetPQModule(HI_PQ_MODULE_E enModule, HI_U32 *pu32OnOff);

HI_S32 DRV_PQ_SetPQModule(HI_PQ_MODULE_E enModule, HI_U32 u32OnOff);

HI_S32 DRV_PQ_GetBinPhyAddr(HI_U32 *pu32Addr);

HI_S32 DRV_PQ_SetSixBaseColorLevel(HI_PQ_SIX_BASE_S *pstSixBaseColorOffset);

HI_S32 DRV_PQ_GetSixBaseColorLevel(HI_PQ_SIX_BASE_S *pstSixBaseColorOffset);

HI_S32 DRV_PQ_SetColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E enColorSpecMode);

HI_S32 DRV_PQ_GetColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E *penColorSpecMode);

HI_S32 DRV_PQ_SetDemoDispMode(PQ_REG_TYPE_E enFlag, HI_PQ_DEMO_MODE_E enDemoMode);

HI_S32 DRV_PQ_GetDemoDispMode(HI_PQ_DEMO_MODE_E *penDemoMode);

HI_S32 DRV_PQ_GetDefaultParam(HI_BOOL *pbDefault);

HI_S32 DRV_PQ_SetDemoCoordinate(PQ_REG_TYPE_E enType, HI_U32 u32X);

HI_S32 DRV_PQ_GetDemoCoordinate(HI_U32 *pu32X);

HI_S32 DRV_PQ_GetDbLevel(HI_U32 *pu32DbLevel);

HI_S32 DRV_PQ_SetDbLevel(HI_U32 u32DbLevel);

HI_S32 DRV_PQ_GetDmLevel(HI_U32 *pu32DmLevel);

HI_S32 DRV_PQ_SetDmLevel(HI_U32 u32DmLevel);

HI_S32 DRV_PQ_GetHdrSaturation(HI_U32 *pu32Saturation);

HI_S32 DRV_PQ_SetHdrSaturation(HI_U32 u32Saturation);

HI_S32 DRV_PQ_SetImageMode(HI_PQ_IMAGE_MODE_E enImageMode);

HI_S32 DRV_PQ_GetImageMode(HI_PQ_IMAGE_MODE_E *penImageMode);

HI_S32 DRV_PQ_Suspend(PM_BASEDEV_S *pdev, pm_message_t state);

HI_S32 DRV_PQ_Resume(PM_BASEDEV_S *pdev);

#endif /* End of #ifndef __DRV_PQ_H__ */
