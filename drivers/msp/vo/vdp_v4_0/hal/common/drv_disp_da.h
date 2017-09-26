
/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_x.h
Version	      : Initial Draft
Author	      : Hisilicon multimedia software group
Created	      : 2012/12/30
Last Modified :
Description   :
Function List :
History	      :
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_DISP_DA_H__
#define __DRV_DISP_DA_H__

#include "hi_type.h"
#include "drv_disp_osal.h"
#include "drv_disp_version.h"
#include "drv_disp_alg_struct.h"
#include "drv_disp_alg_rgb2yuv.h"
#ifndef __DISP_PLATFORM_BOOT__
#include "drv_disp_alg_gamma.h"
#include "hi_drv_mmz.h"
#endif

typedef struct tagDISP_DA_FUNCTION_S
{
    HI_VOID (* PFCscRgb2Yuv)(ALG_COLOR_S *pstRgbColor, ALG_COLOR_S *pYuvColor);

#ifndef __DISP_PLATFORM_BOOT__
    HI_S32 (*PFUpdateGammaCoef)(const HI_S16 *ps16GmmCoef,  ALG_GMM_CS_MODE_E enCSMode);
    HI_S32 (*PFSetGammaCtrl)(ALG_GMM_DRV_PARA_S *pstGmmDrvPara, ALG_GMM_RTL_PARA_S* pstGmmRtlPara);
#endif

}DISP_DA_FUNCTION_S;

HI_S32 DISP_DA_Init(HI_DRV_DISP_VERSION_S *pstVersion);
HI_S32 DISP_DA_DeInit(HI_VOID);

DISP_DA_FUNCTION_S *DISP_DA_GetFunction(HI_VOID);

#endif /*  __DRV_DISP_X_H__  */
