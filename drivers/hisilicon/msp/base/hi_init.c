/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include <linux/module.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/semaphore.h>

#include "hi_type.h"

#if 0
#include "drv_vdec_ext.h"
#include "drv_omxvdec_ext.h"
#include "drv_gpio_ext.h"
#include "drv_gpioi2c_ext.h"
#include "drv_i2c_ext.h"
#include "drv_spi_ext.h"
#include "drv_sci_ext.h"
#include "drv_sci_ext.h"
#include "drv_demux_ext.h"
#include "drv_pvr_ext.h"
#include "drv_sync_ext.h"
#include "drv_adec_ext.h"
#include "hi_drv_sci.h"
#include "drv_keyled_ext.h"
#include "drv_ir_ext.h"
#include "drv_jpeg_ext.h"
#include "drv_jpge_ext.h"
#endif
#include "drv_hifb_ext.h"
#if 0
#include "drv_tde_ext.h"
#include "drv_tuner_ext.h"
#include "drv_png_ext.h"
#endif
#include "drv_disp_ext.h"
#include "drv_hdmi_ext.h"
#if 0
#include "drv_cipher_ext.h"
#include "drv_vfmw_ext.h"
#include "drv_mce_ext.h"
#include "drv_vpss_ext.h"
#include "drv_venc_ext.h"
#endif
#include "drv_pdm_ext.h"
#if 0
#include "drv_aenc_ext.h"
#include "drv_ao_ext.h"
#include "drv_adsp_ext.h"

#include "drv_vi_ext.h"
#include "drv_hdmirx_ext.h"
#endif
#include "drv_pq_ext.h"

#if 0
#include "drv_gfx2d_ext.h"
#include "drv_ci_ext.h"
#include "drv_hdmirx_ext.h"
#endif

#ifndef MODULE
HI_S32 __init HI_DRV_LoadModules(HI_VOID)
{
#if 0
    GPIO_DRV_ModInit();
    // GPIOI2C_DRV_ModInit();
#endif
    PDM_DRV_ModInit();
    PQ_DRV_ModInit();
    HDMI_DRV_ModInit();
    VDP_DRV_ModInit();
#if 0
    TDE_DRV_ModInit();
#endif
    HIFB_DRV_ModInit();
#if 0
    // JPEG_DRV_ModInit();
    // PNG_DRV_ModInit();
    GFX2D_OS_ModInit();
    // I2C_DRV_ModInit();
    // DMX_DRV_ModInit();
    PVR_DRV_ModInit();
    SYNC_DRV_ModInit();
    ADSP_DRV_ModInit();
    AIAO_DRV_ModInit();
    ADEC_DRV_ModInit();
    VPSS_DRV_ModInit();
    MCE_DRV_ModInit();
    // KEYLED_DRV_ModInit();
    // SCI_DRV_ModInit();
    // AENC_DRV_ModInit();
#endif

    return HI_SUCCESS;
}

late_initcall(HI_DRV_LoadModules);
#endif
