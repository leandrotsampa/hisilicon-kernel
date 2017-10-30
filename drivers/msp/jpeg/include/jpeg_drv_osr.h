/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	 : jpeg_drv_osr.h
Version		   : Initial Draft
Author		  :
Created		   : 2015/02/02
Description	   : The user will use this api to realize some function
Function List	  :


History		  :
Date		    Author		  Modification
2015/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __JPEG_DRV_OSR_H__
#define __JPEG_DRV_OSR_H__


/*********************************add include here******************************/
#include <linux/syscalls.h>
#include <linux/ipc.h>

#include "hi_jpeg_config.h"
#include "hi_drv_jpeg.h"
#include "hi_type.h"

/*****************************************************************************/

     /***************************** Macro Definition ******************************/

     #define CONFIG_JPEG_FIND_SYSTEM_ABNORMAL_TIMES   50

     /*************************** Enum Definition *********************************/

    /*************************** Structure Definition *****************************/
    /** jpeg device imformation */
    /** CNcomment:jpeg�豸��Ϣ */
    typedef struct hiJPG_OSRDEV_S
    {
	HI_BOOL bSuspendSignal;	       /**< whether get suspend signal	*//**<CNcomment:��ȡ�����ź�	     */
	HI_BOOL bResumeSignal;	       /**< whether get resume signal	*//**<CNcomment:��ȡ���������ź�  */
	HI_BOOL bDecTask;	       /**< whether have jpeg dec task	*//**<CNcomment:�Ƿ���jpeg��������    */
	HI_BOOL bLock;		       /**< �Ѿ�������״̬		**/
#ifdef CONFIG_JPEG_PERFORMANCE_SUPPORT
	HI_BOOL bIsDecBufUsed ;
#endif
	HI_U32	LockCnt;
	HI_U32	SystemAbnormalTimes;
	wait_queue_head_t  QWaitInt;   /**< waite halt queue		**/
	wait_queue_head_t  QWaitMutex; /**< �ͷ��ź���			**/
	JPG_INTTYPE_E	    IntType;	/**< lately happened halt type	**/
     #ifdef CONFIG_JPEG_LOW_DELAY_SUPPORT
	HI_JPEG_OUTPUTINFO_S stOutputInfo;
     #endif
    }JPG_OSRDEV_S;

    /** \addtogroup	 JPEG */
    /** @{ */	 /** <!--[JPEG]*/


    /** @} */  /** <!-- ==== Structure Definition End ==== */

    /********************** Global Variable declaration **************************/

    /******************************* API declaration *****************************/

    /** \addtogroup	 JPEG */
    /** @{ */	 /** <!--[JPEG]*/

    /***************************************************************************************
    * func	    : DRV_JPEG_OffClock
    * description   : close the jpeg clock
		      CNcomment: �ر�jpegʱ�� CNend\n
    * param[in]	    : HI_VOID
    * retval	    : NA
    * others:	    : NA
    ***************************************************************************************/
    HI_VOID DRV_JPEG_OffClock(HI_VOID);


    /***************************************************************************************
    * func	    : DRV_JPEG_OnClock
    * description   : open the jpeg clock
		      CNcomment: ��jpegʱ�� CNend\n
    * param[in]	    : HI_VOID
    * retval	    : NA
    * others:	    : NA
    ***************************************************************************************/
    HI_VOID DRV_JPEG_OnClock(HI_VOID);

    /** @} */  /** <!-- ==== API Declaration End ==== */

    /****************************************************************************/

#endif /* __JPEG_DRV_OSR_H__*/
