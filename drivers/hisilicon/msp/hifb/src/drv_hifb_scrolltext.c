/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	: drv_hifb_scrolltext.c
Version		: Initial Draft
Author		:
Created		: 2016/02/02
Description	:
Function List	:


History		:
Date		    Author		  Modification
2016/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/*********************************add include here******************************/

#include <linux/ctype.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/delay.h>

#include <linux/slab.h>
#include <linux/mm.h>
#include <linux/spinlock.h>

#include <linux/fb.h>
#include <linux/interrupt.h>

#include "hifb_drv.h"
#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_scrolltext.h"
#include "hi_gfx_sys_k.h"
