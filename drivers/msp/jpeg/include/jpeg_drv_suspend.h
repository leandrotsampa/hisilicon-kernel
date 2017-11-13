/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	 : jpeg_drv_suspend.h
Version		   : Initial Draft
Author		   :
Created		  : 2015/02/02
Description	 : the suspend dispose
			  CNcomment: �������� CNend\n
Function List	 :


History		   :
Date			       Author			 Modification
2015/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __JPEG_DRV_SUSPEND_H__
#define __JPEG_DRV_SUSPEND_H__


/*********************************add include here******************************/

#include "hi_jpeg_config.h"
#include "hi_type.h"
#include "hi_drv_jpeg.h"

/*****************************************************************************/

    /***************************************************************************************
       * func		: JPGE_DRV_Suspend
       * description : get the suspend signale.
				 CNcomment: �յ������ź� CNend\n
      * param[in]     : *pdev
      * param[in]     : state
      * retval		 : HI_SUCCESS �ɹ�
      * retval		: HI_FAILURE ʧ��
      * others:	       : NA
      ***************************************************************************************/
    HI_S32 JPGE_DRV_Suspend(PM_BASEDEV_S *pdev, pm_message_t state);

    /***************************************************************************************
	 * func		 : JPGE_DRV_Resume
	 * description: get the resume signale.
				  CNcomment: �յ����������ź� CNend\n
	 * param[in]   : *pdev
	 * retval	  : HI_SUCCESS �ɹ�
	 * retval	  : HI_FAILURE ʧ��
	 * others:	: NA
	***************************************************************************************/
    HI_S32 JPGE_DRV_Resume(PM_BASEDEV_S *pdev);

    #ifdef CONFIG_JPEG_SUSPEND
    /*****************************************************************************
    * func	      : JPG_WaitDecTaskDone
    * description    : waite the jpeg decode task done
		      CNcomment: �ȴ������������  CNend\n
    * param[in]	    : NULL
    * retval	    : NA
    * others:	     : NA
    *****************************************************************************/
    HI_VOID JPG_WaitDecTaskDone(HI_VOID);


    /*****************************************************************************
    * func	      : JPG_GetResumeValue
    * description    : get the value that resume need
		      CNcomment: ��ȡ����������Ҫ��ֵ  CNend\n
    * param[in]	    : *pSaveInfo
    * retval	    : NA
    * others:	     : NA
    *****************************************************************************/
    HI_VOID JPG_GetResumeValue(HI_JPG_SAVEINFO_S *pSaveInfo);

    #endif/** CONFIG_JPEG_SUSPEND **/

    /****************************************************************************/

#endif
