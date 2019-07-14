/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_type.h"
#include "vdp_hal_vid.h"
#ifdef VDP_DOLBY_HDR_SUPPORT
#include "vdp_drv_coef.h"
#endif
#include "drv_pq_ext.h"
#include "vdp_drv_pq_csc.h"
#include "vdp_func_pq_csc.h"
#include "vdp_hal_comm.h"
#include "vdp_drv_comm.h"


extern VDP_COEF_ADDR_S gstVdpCoefBufAddr;

HI_S32 VDP_PQ_SetCSCCoef(HI_PQ_CSC_CRTL_S* pstCscCtrl,VDP_CSC_MODE_E enCbbCscMode, HI_PQ_CSC_MODE_E enCscMode, HI_PQ_CSC_COEF_S* pstCscCoef, HI_PQ_CSC_DCCOEF_S* pstCscDcCoef)
{
#ifdef VDP_PQ_STRATEGY
	DRV_PQ_GetCSCCoef(pstCscCtrl, enCscMode,pstCscCoef, pstCscDcCoef);
#else
	VDP_FUNC_GetCSCCoef(pstCscCtrl, enCbbCscMode,pstCscCoef, pstCscDcCoef);
#endif

    return HI_SUCCESS;

}
