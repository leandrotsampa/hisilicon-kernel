/******************************************************************************
*	       Copyright 2004 - 2014, Hisilicon Tech. Co., Ltd.
*			    ALL RIGHTS RESERVED
* FileName: gfx2d_hal_hwc_adp.c
* Description: hwc adp code
*
* History:
* Version   Date	 Author	    DefectNum	 Description
* main\1    2013-10-23		    NULL	 Create this file.
*******************************************************************************/
/* SPDX-License-Identifier: GPL-2.0 */

#include "gfx2d_hal_hwc_adp.h"
#include "hi_gfx_sys_k.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

static HWC_CAPABILITY_S gs_stCapability =
{
    HWC_MAX_LAYERS,
    6,
    1,
    {0x00c043d0, 0xfe7efc},
    {0x0c040c0, 0x200},
    1,
    0xffff,
    16,
    1,
    2560,
    1,
    1600,
    32,
    32,
    16,
    16,
    2,
    {0x400000, 0x0},
    HI_TRUE,
    HI_TRUE,
    2,
    1,
};

HI_S32 HWC_ADP_GetCapability(HWC_CAPABILITY_S *pstCapability)
{
    HI_GFX_Memcpy(pstCapability, &gs_stCapability, sizeof(HWC_CAPABILITY_S));

    return HI_SUCCESS;
}
#ifdef __cplusplus
#if __cplusplus
}
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/
