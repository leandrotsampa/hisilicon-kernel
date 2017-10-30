/****************************************************************************
 *	       Copyright 2004 - 2014, Hisilicon Tech. Co., Ltd.
 *			     ALL RIGHTS RESERVED
 * FileName: common_log.h
 * Description:
 *    Implement all function for outputting debug information.
 *
 * History:
 * Version   Date	  Author     DefectNum	  Description
 * 1.1	     2006-03-24	  l48554     NULL	  Create
 ****************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_LOG_EXT_H__
#define __DRV_LOG_EXT_H__
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/major.h>
#include <asm/types.h>
#include <linux/fs.h>
#include <asm/atomic.h>

#include "hi_debug.h"
#include "drv_log_ioctl.h"

#define DRV_LOG_DEVICE_NAME "sys/log"

#define MSG_FROM_USER	0
#define MSG_FROM_KERNEL 1


typedef struct hiLOG_BUFFER_INFO_S
{
    HI_U32 u32StartAddrPhy; /*start physic address*/	/*CNcomment:��������ʼ������ַ*/
    HI_U8 *pu8StartAddrVir; /*start virtual address*/	/*CNcomment:��������ʼ�����ַ*/
    HI_U32 u32BufSize;	    /*buffer size*/				/*CNcomment:��������С*/
    HI_U32 u32WriteAddr;    /*write offset*/			/*CNcomment:д��ַƫ��*/
    HI_U32 u32ReadAddr;	    /*read offset*/				/*CNcomment:����ַƫ��*/
    HI_U32 u32ResetFlag;    /*reset count*/				/*CNcomment:��λ����*/
    HI_U32 u32WriteCount;   /*write count*/				/*CNcomment:д�����*/
    wait_queue_head_t wqNoData;	   /*no wait queque*/	/*CNcomment:û�����ݵȴ�����*/
}LOG_BUFFER_INFO_S;

#endif /*__CMPI_LOG_H__*/
