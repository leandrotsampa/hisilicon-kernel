/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HAL_DSP_H__
#define __HAL_DSP_H__

#include "hi_type.h"

/******************************************************************************/
#ifdef __aarch64__
#define adsp_ioremap ioremap_wc
#else
#define adsp_ioremap ioremap_nocache
#endif
#define adsp_iounmap iounmap
/******************************************************************************/

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

extern HI_VOID* g_pDspShareSRam;

HI_VOID HAL_ADSP_DeInit(HI_VOID);
HI_S32	HAL_ADSP_Init(HI_VOID);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
