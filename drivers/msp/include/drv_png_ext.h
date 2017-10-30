/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __DRV_PNG_EXT_H__
#define __DRV_PNG_EXT_H__

#include "hi_drv_dev.h"

typedef HI_S32	(*FN_PNG_ModInit)(HI_VOID);
typedef HI_VOID (*FN_PNG_ModeExit)(HI_VOID);
typedef HI_S32	(*FN_PNG_Suspend)(PM_BASEDEV_S *, pm_message_t);
typedef HI_S32	(*FN_PNG_Resume)(PM_BASEDEV_S *);

typedef struct
{
    FN_PNG_ModInit	   pfnPngModInit;
    FN_PNG_ModeExit	   pfnPngModExit;
	FN_PNG_Suspend		   pfnPngSuspend;
	FN_PNG_Resume		   pfnPngResume;
} PNG_EXPORT_FUNC_S;

void PNG_DRV_ModExit(void);
int PNG_DRV_ModInit(void);

#endif /*__DRV_PNG_EXT_H__*/
