/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	 : jpeg_drv_dec.c
Version		 : Initial Draft
Author		 : y00181162
Created		 : 2016/05/09
Description	 :
Function List	 :


History		 :
Date		    Author		  Modification
2016/05/09	    y00181162		 Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/***************************** add include here*********************************/

#include "hi_jpeg_config.h"
#include "jpeg_drv_parse.h"
#include "hi_drv_jpeg.h"
#include "hi_jpeg_reg.h"
#include "jpeg_drv_hal.h"
#include "jpeg_drv_dec.h"
#include "hi_gfx_sys_k.h"

#ifdef HI_BUILD_IN_MINI_BOOT
#include "delay.h"
#endif



#ifdef CONFIG_JPEG_OMX_FUNCTION
/***************************** Macro Definition ********************************/

#define CONFIG_JPEG_DEC_HANDLE_MAX	      5

/***************************** Structure Definition ****************************/
typedef struct tagDRV_DEC_JPEG_INFO
{
   HI_U32 DecHandle;
   IMAG_INFO_S *pstImgInfo;
}DRV_DEC_JPEG_INFO;

/***************************** Global Variable declaration *********************/

DRV_DEC_JPEG_INFO  gs_DrvDecJpegInfo;

/***************************** API forward declarations ************************/
extern HI_S32 JPEG_DRV_SoftDec(HI_JPEG_DECINFO_S *stDecInfo);
extern HI_S32 JPEG_DRV_HardDec(HI_JPEG_DECINFO_S *stDecInfo,IMAG_INFO_S *pstImgInfo);
extern HI_S32 JPEG_DRV_GetDevice(HI_VOID);

/***************************** API realization *********************************/
HI_S32 HI_DRV_JPEG_CreateDec(HI_U32 *pDecHandle)
{
    if (NULL == pDecHandle)
    {
	return HI_FAILURE;
    }

    gs_DrvDecJpegInfo.DecHandle++;
    if (gs_DrvDecJpegInfo.DecHandle >= CONFIG_JPEG_DEC_HANDLE_MAX)
    {
	*pDecHandle = 0;
	return HI_FAILURE;
    }
    *pDecHandle = gs_DrvDecJpegInfo.DecHandle;

    if (gs_DrvDecJpegInfo.DecHandle > 1)
    {
	return HI_SUCCESS;
    }

    gs_DrvDecJpegInfo.pstImgInfo = (IMAG_INFO_S*)HI_GFX_KMALLOC(HIGFX_JPGDEC_ID,sizeof(IMAG_INFO_S),GFP_KERNEL);

    if (NULL == gs_DrvDecJpegInfo.pstImgInfo )
    {
       gs_DrvDecJpegInfo.DecHandle--;
       return HI_FAILURE;
    }

    HI_GFX_Memset((HI_VOID*)(gs_DrvDecJpegInfo.pstImgInfo),0,sizeof(IMAG_INFO_S));

    return HI_SUCCESS;
}


HI_S32 HI_DRV_JPEG_DecInfo(HI_U32 DecHandle,HI_DRV_JPEG_INMSG_S *stInMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if ((NULL == stInMsg) || (NULL == gs_DrvDecJpegInfo.pstImgInfo))
    {
       return HI_FAILURE;
    }

    stInMsg->DecHandle = DecHandle;
    s32Ret = DRV_JPEG_Parse(stInMsg, gs_DrvDecJpegInfo.pstImgInfo);
    if (HI_SUCCESS != s32Ret)
    {
	return HI_FAILURE;
    }

    DRV_JPEG_GetImgInfo(stInMsg,gs_DrvDecJpegInfo.pstImgInfo);

    return HI_SUCCESS;
}


HI_S32 HI_DRV_JPEG_DecOutInfo(HI_U32 DecHandle,HI_DRV_JPEG_OUTMSG_S *stOutMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if ((NULL == stOutMsg) || (NULL == gs_DrvDecJpegInfo.pstImgInfo))
    {
	return HI_FAILURE;
    }

    stOutMsg->DecHandle = DecHandle;
    s32Ret = DRV_JPEG_GetSofn(stOutMsg,gs_DrvDecJpegInfo.pstImgInfo);
    if (HI_SUCCESS != s32Ret)
    {
	return HI_FAILURE;
    }

    return HI_SUCCESS;
}


HI_S32 HI_DRV_JPEG_DecFrame(HI_U32 DecHandle,HI_JPEG_DECINFO_S *pstDecInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if ((0 == DecHandle) || (NULL == pstDecInfo) || (NULL == gs_DrvDecJpegInfo.pstImgInfo))
    {
	 JPEG_TRACE("the dec handle has been destoryed\n");
	 return HI_FAILURE;
    }

    pstDecInfo->stInMsg.DecHandle  = DecHandle;
    pstDecInfo->stOutMsg.DecHandle = DecHandle;

    s32Ret = JPEG_DRV_GetDevice();
    if (HI_SUCCESS != s32Ret)
    {
	JPEG_TRACE("JPEG_DRV_GetDevice failure\n");
	return HI_FAILURE;
    }

    s32Ret = JPEG_DRV_HardDec(pstDecInfo,gs_DrvDecJpegInfo.pstImgInfo);

    JPEG_DRV_SetDecState(HI_FALSE);
    JPEG_DRV_UnLock(JPG_INTTYPE_FINISH);

    //if (HI_SUCCESS != s32Ret){
       //s32Ret = JPEG_DRV_SoftDec(pstDecInfo);
    //}

    return s32Ret;
}


HI_VOID HI_DRV_JPEG_DestoryDec(HI_U32 DecHandle)
{

    UNUSED(DecHandle);

    if (0 == gs_DrvDecJpegInfo.DecHandle)
    {
	return;
    }

    if (1 != gs_DrvDecJpegInfo.DecHandle)
    {
	gs_DrvDecJpegInfo.DecHandle--;
	return;
    }

    gs_DrvDecJpegInfo.DecHandle--;

    if (NULL == gs_DrvDecJpegInfo.pstImgInfo)
    {
	return;
    }

    HI_GFX_KFREE(HIGFX_JPGDEC_ID, (HI_VOID *)gs_DrvDecJpegInfo.pstImgInfo);
    gs_DrvDecJpegInfo.pstImgInfo = NULL;

    return;
}

HI_VOID HI_DRV_JPEG_GetLuPixSum(HI_U32 DecHandle,HI_U64* pu64LuPixValue)
{
    UNUSED(DecHandle);
    *pu64LuPixValue = gs_DrvDecJpegInfo.pstImgInfo->u64LuPixValue;
    return;
}


HI_VOID HI_DRV_JPEG_Init(HI_VOID)
{
    HI_GFX_Memset(&gs_DrvDecJpegInfo,0,sizeof(DRV_DEC_JPEG_INFO));
    return;
}



 /*****************************************************************************************/
 /*****************************************************************************************/

   EXPORT_SYMBOL(HI_DRV_JPEG_CreateDec);
   EXPORT_SYMBOL(HI_DRV_JPEG_DecOutInfo);
   EXPORT_SYMBOL(HI_DRV_JPEG_DecFrame);
   EXPORT_SYMBOL(HI_DRV_JPEG_DestoryDec);
   EXPORT_SYMBOL(HI_DRV_JPEG_GetLuPixSum);
#endif
