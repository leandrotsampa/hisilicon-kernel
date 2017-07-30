/******************************************************************************

  Copyright (C), 2013-2014, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name	: hi_drv_userproc.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2013/07/12
  Description	: Support user proc function.
  History	:
  1.Date	: 2013/07/12
    Author	: l00185424
    Modification: Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_DRV_USERPROC_H__
#define __HI_DRV_USERPROC_H__

/******************************* Include Files *******************************/

/* add include here */
#include "hi_type.h"
#include "hi_module.h"
#include "hi_debug.h"
#include "hi_drv_struct.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/***************************** Macro Definition ******************************/

#define MAX_PROC_NAME_LEN	127
#define MAX_PROC_CMD_LEN	255
#define HI_PROC_BUFFER_SIZE    4096

#define HI_USERPROC_DEVNAME	UMAP_NAME"userproc"

#define HI_FATAL_UPROC(fmt...)	 HI_FATAL_PRINT(HI_ID_PROC, fmt)
#define HI_ERR_UPROC(fmt...)	 HI_ERR_PRINT(HI_ID_PROC, fmt)
#define HI_WARN_UPROC(fmt...)	 HI_WARN_PRINT(HI_ID_PROC, fmt)
#define HI_INFO_UPROC(fmt...)	 HI_INFO_PRINT(HI_ID_PROC, fmt)

/*************************** Structure Definition ****************************/

/********************** Global Variable declaration **************************/

/******************************* API declaration *****************************/
HI_S32 USRPROC_DRV_ModInit(HI_VOID);
HI_VOID USRPROC_DRV_ModExit(HI_VOID);

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* __HI_DRV_USERPROC_H__ */
