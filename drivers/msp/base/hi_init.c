/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include <linux/module.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/semaphore.h>

#include "hi_type.h"

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
#include "drv_hifb_ext.h"
#include "drv_tde_ext.h"
#include "drv_tuner_ext.h"
#include "drv_png_ext.h"
#include "drv_disp_ext.h"
#include "drv_hdmi_ext.h"
#include "drv_cipher_ext.h"
#include "drv_vfmw_ext.h"
#include "drv_mce_ext.h"
#include "drv_vpss_ext.h"
#include "drv_venc_ext.h"
#include "drv_pdm_ext.h"
#include "drv_aenc_ext.h"
#include "drv_ao_ext.h"
#include "drv_adsp_ext.h"

#include "drv_vi_ext.h"
#include "drv_hdmirx_ext.h"
#include "drv_pq_ext.h"

#ifdef HI_SND_AMP_SUPPORT
#include "drv_amp_ext.h"
#endif

#ifdef HI_SND_SIF_SUPPORT
#include "drv_sif_ext.h"
#endif

#ifdef HI_ADAC_SLIC_SUPPORT
#include "drv_slic_ext.h"
#endif

#include "drv_gfx2d_ext.h"
#include "drv_ci_ext.h"
#include "drv_cimaxplus_ext.h"
#include "drv_hdmirx_ext.h"

#ifndef MODULE
HI_S32 __init HI_DRV_LoadModules(HI_VOID)
{
    GPIO_DRV_ModInit();
    GPIOI2C_DRV_ModInit();
    PDM_DRV_ModInit();
    PQ_DRV_ModInit();
    HDMI_DRV_ModInit();
    VDP_DRV_ModInit();
    TDE_DRV_ModInit();
    HIFB_DRV_ModInit();
    JPEG_DRV_ModInit();
    PNG_DRV_ModInit();
    GFX2D_OS_ModInit();
    I2C_DRV_ModInit();
    DMX_DRV_ModInit();
    PVR_DRV_ModInit();
    SYNC_DRV_ModInit();
    ADSP_DRV_ModInit();
    AIAO_DRV_ModInit();

#ifdef HI_SND_SIF_SUPPORT
    SIF_DRV_ModInit();
#endif

#ifdef HI_SND_AMP_SUPPORT
    AMP_DRV_ModInit();
#endif

    ADEC_DRV_ModInit();
    VPSS_DRV_ModInit();
    MCE_DRV_ModInit();
    KEYLED_DRV_ModInit();
    SCI_DRV_ModInit();
    AENC_DRV_ModInit();

#ifdef HI_VENC_SUPPORT
    VENC_DRV_ModInit();
#endif

#ifdef HI_VI_SUPPORT
    VI_DRV_ModInit();

#ifdef HI_VI_REAL_SUPPORT
#ifdef HI_HDMI_RX_SUPPORT
    HDMIRX_DRV_ModuleInit();
#else
    SIL9293_DRV_ModInit();
#endif
#endif
#endif

#ifdef HI_ADAC_SLIC_SUPPORT
    slac_init();
#endif

#ifdef HI_CIPLUS_SUPPORT
    CI_DRV_ModInit();
#endif

#ifdef HI_CI_DEV_CIMAXPLUS
    CIMAXPLUS_DRV_ModInit();
#endif

    return HI_SUCCESS;
}

late_initcall(HI_DRV_LoadModules);
#endif
