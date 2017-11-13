/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	    : tde_proc.h
Version		    : Initial Draft
Author		    :
Created		    : 2014/06/20
Description	    :
Function List	    :
History		    :
Date			    Author		    Modification
2014/06/20		    y00181162		    Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __TDE_PROC_H__
#define	 __TDE_PROC_H__

#include "tde_hal.h"

#define TDE_MAX_PROC_NUM 8
/*****************************************************************************
* Function:	 TDEProcRecordNode
* Description:	 Record TDE Node configure information
* Input:	 null
* Output:	 none
* Return:	 none
* Others:	 none
*****************************************************************************/
HI_VOID TDEProcRecordNode(TDE_HWNode_S* pHWNode);

int tde_read_proc(struct seq_file *p, HI_VOID *v);

int tde_write_proc(struct file * file,
    const char __user * buf, size_t count, loff_t *ppos);

#endif /*__TDE_PROC_H__ */
