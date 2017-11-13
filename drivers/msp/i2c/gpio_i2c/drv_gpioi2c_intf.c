/*********************************************************************************
*
*  Copyright (C) 2014 Hisilicon Technologies Co., Ltd.	All rights reserved.
*
***********************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/module.h>

#include "hi_common.h"
#include "hi_drv_gpioi2c.h"

extern int i2cmode;
module_param(i2cmode, int, S_IRUGO);

/*************************************************************************/

HI_S32 GPIOI2C_DRV_ModInit(HI_VOID)
{
    if (HI_SUCCESS != HI_DRV_GPIOI2C_Init())
    {
	return HI_FAILURE;
    }

#ifdef MODULE
    HI_PRINT("Load hi_gpioi2c.ko success.\t(%s)\n", VERSION_STRING);
#endif

    return HI_SUCCESS;
}

HI_VOID GPIOI2C_DRV_ModExit(HI_VOID)
{
    HI_DRV_GPIOI2C_DeInit();

    return;
}

#ifdef MODULE
module_init(GPIOI2C_DRV_ModInit);
module_exit(GPIOI2C_DRV_ModExit);
#endif

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("HISILICON");
