/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	 : jpeg_drv_proc.h
Version		   : Initial Draft
Author		  :
Created		   : 2015/02/02
Description	   : the proc information define in this file
		  CNcomment: proc ��ص���Ϣ�������� CNend\n
Function List	  :


History		  :
Date		    Author		  Modification
2015/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __JPEG_DRV_PROC_H__
#define __JPEG_DRV_PROC_H__


/*********************************add include here******************************/
#include "hi_jpeg_config.h"


#ifdef CONFIG_JPEG_PROC_ENABLE

#include <linux/seq_file.h>
#include "hi_drv_jpeg.h"


/*****************************************************************************/

   /***************************** Macro Definition ******************************/

   #define PROC_JPEG_ENTRY_NAME		   "jpeg"

    /*************************** Structure Definition ****************************/


    /********************** Global Variable declaration **************************/


    /******************************* API declaration *****************************/

    /*****************************************************************************
    * Function	   : JPEG_Proc_init
    * Description  :
    * param[in]	   : NA
    * retval	   : NA
    *****************************************************************************/
    HI_VOID JPEG_Proc_init(HI_VOID);


    /*****************************************************************************
    * Function	   : JPEG_Proc_Cleanup
    * Description  :
    * param[in]	   : NA
    * retval	   : NA
    *****************************************************************************/
   HI_VOID JPEG_Proc_Cleanup(HI_VOID);


    /*****************************************************************************
    * Function	   : JPEG_Get_Proc_Status
    * Description  :
    * param[in]	   : pbProcStatus
    * retval	   : NA
    *****************************************************************************/
    HI_VOID JPEG_Get_Proc_Status(HI_BOOL* pbProcStatus);


    /****************************************************************************/

#endif/**CONFIG_JPEG_PROC_ENABLE**/

#endif /** use the proc information -DCONFIG_JPEG_PROC_ENABLE **/
