/******************************************************************************

  Copyright (C), 2014-2016, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: drv_hdmi_proc.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2015/02/01
  Description	:
  History	:
  Date		: 2015/02/01
  Author	: t00273561
  Modification	:
*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_HDMI_PROC_H__
#define __DRV_HDMI_PROC_H__

#include "hi_type.h"
#include "drv_hdmi_platform.h"

HI_S32 DRV_HDMI_ReadProc(struct seq_file *pFile, HI_VOID *pArg);

HI_S32 DRV_HDMI_VOReadProc(struct seq_file *pFile, HI_VOID *pArg);

HI_S32 DRV_HDMI_AOReadProc(struct seq_file *pFile, HI_VOID *pArg);

HI_S32 DRV_HDMI_SinkReadProc(struct seq_file *pFile, HI_VOID *pArg);

#endif	/* __DRV_HDMI_PROC_H__ */
