/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name			    :	adec_intf.c
  Version			    :	Initial Draft
  Author			    :	Hisilicon multimedia software group
  Created			    :	2006/01/23
  Last Modified			:
  Description			:
  Function List			:	So Much ....
  History			:
  1.Date			:	2006/01/23
    Author			:	f47391
    Modification	    :	Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/version.h>
#include <linux/proc_fs.h>
#include <linux/ioport.h>
#include <linux/string.h>
#include <linux/ioctl.h>
#include <linux/fs.h>
#include <linux/delay.h>

#include <asm/uaccess.h>
#include <asm/io.h>
#include <linux/seq_file.h>

#include "hi_drv_mmz.h"
#include "hi_drv_stat.h"
#include "hi_drv_sys.h"
#include "hi_drv_proc.h"
#include "hi_drv_module.h"
#include "hi_drv_mem.h"
#include "hi_error_mpi.h"

#include "hi_drv_adec.h"
#include "drv_adec_ext.h"

#define ADEC_NAME "HI_ADEC"

HI_S32 HI_DRV_ADEC_Init(HI_VOID)
{
    HI_S32 ret;

    ret = HI_DRV_MODULE_Register(HI_ID_ADEC, ADEC_NAME, (HI_VOID*)HI_NULL);
    if (HI_SUCCESS != ret)
    {
	HI_FATAL_ADEC("HI_DRV_MODULE_Register Adec failed\n");
	return ret;
    }

    ret = HI_DRV_MODULE_Register(HI_ID_KARAOKE, "HI_KARAOKE", (HI_VOID*)HI_NULL);
    if (HI_SUCCESS != ret)
    {
	HI_FATAL_ADEC("HI_DRV_MODULE_Register Adec failed\n");
	return ret;
    }

    return HI_SUCCESS;
}

HI_VOID	 HI_DRV_ADEC_DeInit(HI_VOID)
{
    HI_DRV_MODULE_UnRegister(HI_ID_ADEC);
    return;
}
