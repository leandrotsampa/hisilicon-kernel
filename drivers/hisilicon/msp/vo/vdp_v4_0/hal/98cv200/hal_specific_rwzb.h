/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __VDP_RWZB_H_
#define __VDP_RWZB_H_

#include "drv_disp_com.h"

#define	    VDAC_DEFAULT_VALUE	 0x80000090
#define		SCH_PHASE 0xba
#define		C_GAIN 0

HI_U32 * VDP_Get_HDateSrc13Coef( HI_U32 u32Fmt);
HI_U32 * VDP_Get_SDateSrcCoef( HI_U32 Index);

#endif
