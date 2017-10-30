/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_reg_common.h"

#include "hi_audsp_common.h"
#include "drv_adsp_private.h"
#include "drv_adsp_hal.h"

HI_VOID* g_pDspShareSRam = HI_NULL;

static HI_S32 DSPMapShareSRam(HI_VOID)
{
    g_pDspShareSRam = (HI_VOID*)adsp_ioremap(DSP0_SHARESRAM_BASEADDR, DSP0_SHARESRAM_MAXSIZE);
    if (HI_NULL == g_pDspShareSRam)
    {
	HI_ERR_ADSP("Map DSP share Sram failed\n");
	return HI_FAILURE;
    }

    HI_INFO_ADSP("g_pDspShareSRam = %p\n", g_pDspShareSRam);

    memset(g_pDspShareSRam, 0, DSP0_SHARESRAM_MAXSIZE);

    return HI_SUCCESS;
}

static HI_VOID DSPUnMapShareSRam(HI_VOID)
{
    if (HI_NULL != g_pDspShareSRam)
    {
	adsp_iounmap(g_pDspShareSRam);
	g_pDspShareSRam = HI_NULL;
    }
}

HI_VOID HAL_ADSP_DeInit(HI_VOID)
{
    DSPUnMapShareSRam();
}

HI_S32 HAL_ADSP_Init(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = DSPMapShareSRam();
    if (HI_SUCCESS != s32Ret)
    {
	HI_FATAL_ADSP("call DSPMapShareSRam failed(0x%x)\n", s32Ret);
    }

    return s32Ret;
}
