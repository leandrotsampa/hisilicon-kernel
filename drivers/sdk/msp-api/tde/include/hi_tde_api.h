/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : hi_tde_api.h
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

#ifndef	 __HI_TDE_API_H__
#define	 __HI_TDE_API_H__

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif /* __cplusplus */
#endif	/* __cplusplus */

#include "hi_type.h"
#include "hi_tde_type.h"

#define HI_TDE_Open HI_TDE2_Open
#define HI_TDE_Close HI_TDE2_Close
#define HI_TDE_BeginJob HI_TDE2_BeginJob

/****************************************************************************/
/*			       TDE2 API define				     */
/****************************************************************************/

/******************************* API Declaration *****************************/
/** \addtogroup	     TDE */
/** @{ */  /** <!��[TDE] */

/**
\brief Starts a two-dimensional engine 2 (TDE2) device. CNcomment:��TDE2�豸CNend
\attention \n
Before using the TDE, you must call this API to ensure that a TDE device is started.\n
A TDE device can be started repeatedly by using multiple processes.\n.
CNcomment:�ڽ���TDE��ز���ǰӦ�����ȵ��ô˽ӿڣ���֤TDE�豸���ڴ�״̬\n
TDE�豸����������ظ���\n  CNend

\param	N/A
\retval ::HI_SUCCESS Success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_OPEN_FAILED Starting a TDE device fails. CNcomment:TDE�豸��ʧ��CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_Open(HI_VOID);


/**
\brief Stops a TDE2 device. CNcomment:�ر�TDE2�豸CNend
\attention \n
HI_TDE2_Open must work with HI_TDE2_Close.\n
CNcomment:����HI_TDE2_Open��HI_TDE2_Close�Ĵ�����Ҫ��Ӧ\n  CNend
\param	N/A
\retval N/A
\see \n
N/A
*/
HI_VOID	    HI_TDE2_Close(HI_VOID);


/**
\brief Creates a TDE task.
\attention N/A
\param	N/A
\retval If the return value is greater than 0, it indicates that the TDE task handle is valid. CNcomment:����0���Ϸ���TDE������CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE The handle of a TDE task is invalid. CNcomment:�Ƿ���TDE������CNend
\see \n
N/A
*/
TDE_HANDLE  HI_TDE2_BeginJob(HI_VOID);


/**
\brief Submits an existing TDE task. CNcomment:�ύ�Ѵ�����TDE����CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
If the calling mode is set to block mode, and the API is returned due to timeout or interruption, the operation continues till it is complete even though the API called by the TDE is returned in advance.\n
The synchronization mode is not supported currently.\n
After a task is submitted, its handle becomes invalid. If the task is submitted again, the error code HI_ERR_TDE_INVALID_HANDLE is returned. \n.
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
������Ϊ����������������ʱ���ػ��жϷ���ʱӦ��ע�⣺��ʱTDE������API������ǰ���أ���ִ�еĲ����Ի����\n
�ݲ�֧��ͬ��ģʽ\n
�ύ����󣬴������Ӧ��handle���Ϊ��Ч���ٴ��ύ����ִ�����HI_ERR_TDE_INVALID_HANDLE \n  CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] bSync  Whether to submit a TDE task in synchronization mode. CNcomment:�Ƿ�ʹ��ͬ����ʽ�ύCNend
\param[in] bBlock  Block flag. CNcomment:������־CNend
\param[in] u32TimeOut  Timeout period 10 ms. CNcomment:��ʱʱ�䣬��λjiffies��10ms��CNend
\retval ::HI_SUCCESS  A task is submitted successfully in non-block mode. CNcomment:�����������ύ�ɹ�CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The input task handle is invalid. CNcomment:�����Job handler��ЧCNend
\retval ::HI_ERR_TDE_JOB_TIMEOUT  A task is not completed due to timeout. CNcomment:����ʱδ���CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_EndJob(TDE_HANDLE s32Handle, HI_BOOL bSync, HI_BOOL bBlock, HI_U32 u32TimeOut);


/**
\brief Cancels an operation added in a TDE task. CNcomment:ȡ���Ѿ����뵽TDE�����еĲ���CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
A submitted task cannot be cancelled.\n
No operations can be added to cancelled tasks, because the cancelled tasks are invalid.\n
This API is called when an error occurs during TDE operation configuration.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
�Ѿ��ύ�������ܹ���ȡ��\n
ȡ�������������Ч���������Ӳ���\n
�˽ӿڵ�Ӧ�ó�����������TDE��������ʱʹ��\n  CNend

\param[in] s32Handle Handle of a TDE task. CNcomment:������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_FAILURE  The specified task cannot be cancelled because it has been submitted. CNcomment:ָ���������Ѿ��ύ�޷�ȡ��CNend

\see \n
N/A
*/
HI_S32	    HI_TDE2_CancelJob(TDE_HANDLE s32Handle);



/**
\brief Waits for the completion of a specified TDE task. CNcomment:�ȴ�ָ�����������CNend
\attention \n
 As a block interface, this API is blocked until the specified task is complete.\n
 CNcomment:�˽ӿ�Ϊ�����ӿڣ��������ȴ�ָ�����������\n	 CNend

\param[in] s32Handle Handle of a TDE task. CNcomment:������CNend
\retval 0  The specified TDE task is not completed. CNcomment:ָ����TDE����δ���CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_QUERY_TIMEOUT  The specified task is not completed due to timeout. CNcomment:ָ��������ʱδ���CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The operation is not supported. CNcomment:��֧�ֵĲ���CNend
\retval ::HI_ERR_TDE_INTERRUPT Blocked job was interrupted.CNcomment:������TDE���񱻴��CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_WaitForDone(TDE_HANDLE s32Handle);


/**
\brief Waits for the completion of all TDE tasks. CNcomment:�ȴ�TDE�������������CNend
\attention \n
As a block interface, this API is blocked until all TDE tasks are complete.\n
CNcomment:�˽ӿ�Ϊ�����ӿڣ��������ȴ����е�TDE�������\n  CNend
\param	N/A
\retval 0  The specified TDE task is not completed. CNcomment:ָ����TDE����δ���CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The operation is not supported. CNcomment:��֧�ֵĲ���CNend
\retval ::HI_ERR_TDE_INTERRUPT Blocked job was interrupted.CNcomment:������TDE���񱻴��CNend
\see \n
N/A
*/
HI_S32 HI_TDE2_WaitAllDone(HI_VOID);


/**
\brief Resets all statuses of the TDE. CNcomment:��λTDE����״̬CNend
\attention \n
This API is used to reset software and hardware if a timeout error occurs due to the inconsistency of the software and hardware for standby wakeup.\n
CNcomment:�˽ӿ�һ�����ڴ���������Ӳ����ƥ��ʱ���ֳ�ʱ����ʱ���ã����ڸ�λ��Ӳ��\n  CNend
\param	N/A
\retval 0  TDE reset successfully. CNcomment:TDE��λ�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\see \n
N/A
*/
HI_S32 HI_TDE2_Reset(HI_VOID);


/**
\brief Adds the fast copy operation to a TDE task. CNcomment:�����������ӿ��ٿ�������CNend
\attention \n
HI_TDE2_QuickCopy adopts the direct memory access (DMA) transfer technology; therefore, HI_TDE2_QuickCopy is superior to HI_TDE2_Bitblit in transfer.
Because the format conversion is not supported during fast copying, the formats of the source bitmap and the target bitmap must be the same.\n
In addition, scaling is not supported during fast copying. If the operating area size of the source bitmap is different from that of the target bitmap, the copy and transfer operations are performed based on the minimum width and height.\n
The specified operating area and the specified bitmap must have a public area; otherwise, an error is returned. This requirement is applicable to other operations.\n
If the pixel format of a bitmap is greater than or equal to a byte, the base address and stride of the bitmap format must be aligned based on the pixel format. If the pixel format of a bitmap is smaller than a byte, the base address and stride of the bitmap must be aligned based on byte. This requirement is applicable to other operations.\n
If the pixel format of a bitmap is smaller than a byte, the horizontal start point and width of the bitmap must be aligned based on pixel.\n
The horizontal start point and width of the YCbCr422 bitmap must be even numbers. This requirement is applicable to other operations.\n
CNcomment:�˽ӿ�ʹ�õ���ֱ��DMA���ƣ������������HI_TDE2_Bitblit����\n
���ٿ���������֧�ָ�ʽת����Դλͼ��Ŀ��λͼ��ʽ����һ��\n
���ٿ�����֧�����Ź��ܣ�������Դ��Ŀ�ĵĲ�������ߴ粻һ�£�����������С�Ŀ��߽��п�������\n
ָ���Ĳ�������Ҫ��ָ����λͼ�й������򣬷���᷵�ش��������������д�Ҫ��\n
���ظ�ʽ���ڵ���Byte��λͼ��ʽ�Ļ���ַ��λͼ��Stride���밴�����ظ�ʽ���룬���ظ�ʽ����Byte��λͼ��ʽ�Ļ���ַ��Stride��Ҫ����Byte���룻�����������д�Ҫ��\n
���ظ�ʽ����Byte��λͼ��ʽ��ˮƽ��ʼλ�úͿ��ȱ��밴�����ض���\n
YCbCr422��ʽ��λͼ��ˮƽ��ʼλ�úͿ��ȱ���Ϊż���������������д�Ҫ��\n	CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstSrc  Source bitmap. CNcomment:ԴλͼCNend
\param[in] pstSrcRect  Operating area of the source bitmap. CNcomment:Դλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs.CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_QuickCopy(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstSrc, TDE2_RECT_S	 *pstSrcRect,
			      TDE2_SURFACE_S* pstDst, TDE2_RECT_S *pstDstRect);


/**
\brief Rapidly fills in the target bitmap with a fixed value. CNcomment:���ٽ��̶�ֵ��䵽Ŀ��λͼCNend
\attention \n
The data to be filled in must be specified based on the format of the target bitmap.\n
CNcomment:��������ֵ��Ҫ����Ŀ��λͼ�ĸ�ʽָ��\n  CNend
\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\param[in] u32FillData	Data to be filled in. CNcomment:���ֵCNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_QuickFill(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstDst, TDE2_RECT_S *pstDstRect,
			      HI_U32 u32FillData);


/**
\brief Scales the source bitmap based on a specified size of the target bitmap. The source bitmap and target bitmap can be the same.
CNcomment:��Դλͼ����ΪĿ��λͼָ����С��Դ��Ŀ���ΪͬһλͼCNend
\attention \n
The maximum minification is smaller than 256, there is no limit on magnification,but the max size of the bitmap is 4095*4095\n
You can scale a bitmap that serves as both source bitmap and target bitmap. If the memories for storing the source bitmap and target bitmap overlap, the bitmaps cannot be scaled.\n
CNcomment:��С����С��256�����Ŵ�����û�����ƣ������ߴ粻�ܳ���4095*4095 \n
����ʱԴλͼ��Ŀ��λͼ����Ϊͬһλͼ��������Ϊ�ڴ����ص��Ĳ�ͬλͼ\n  CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstSrc  Source bitmap. CNcomment:ԴλͼCNend
\param[in] pstSrcRect  Operating area of the source bitmap. CNcomment:Դλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_ERR_TDE_NOT_ALIGNED  The start address or stride of the bitmap is not aligned based on pixel. CNcomment:λͼ��ʼ��ַ��Strideû�а������ض���CNend
\retval ::HI_ERR_TDE_MINIFICATION  The start address or stride of the bitmap is not aligned based on pixel. CNcomment:��С��������CNend
\retval ::HI_ERR_TDE_NOT_ALIGNED  The start address of the color look-up table (CLUT) is not 4-byte aligned. CNcomment:Clut������ʼ��ַû�а���4byte����CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The operation is not supported. CNcomment:��֧�ֵĲ�������CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_QuickResize(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstSrc, TDE2_RECT_S  *pstSrcRect,
				TDE2_SURFACE_S* pstDst, TDE2_RECT_S  *pstDstRect);


/**
\brief Adds the anti-flicker operation to a TDE task. CNcomment:�����������ӿ���˸���� CNend
\attention \n
The anti-flicker operation supports vertical filtering only.\n
The anti-flicker operation can be performed on the source bitmap and target bitmap that are stored in the same memory.\n
If the sizes of the specified input area and output area are different, scaling is performed.\n
CNcomment:����˸ֻ����ֱ��������˲�\n
����˸��Դ��Ŀ��λͼ������ͬһ���ڴ�\n
���ָ�������������������һ�£����������Ŵ���\n  CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstSrc  Source bitmap. CNcomment:ԴλͼCNend
\param[in] pstSrcRect  Operating area of the source bitmap. CNcomment:Դλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_ERR_TDE_NOT_ALIGNED  The start address or stride of the bitmap is not aligned based on pixel. CNcomment:λͼ��ʼ��ַ��Strideû�а������ض���CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The operation is not supported. CNcomment:��֧�ֵĲ�������CNend
\retval ::HI_ERR_TDE_MINIFICATION  The minification is too large. CNcomment:��С��������CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_QuickDeflicker(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstSrc, TDE2_RECT_S  *pstSrcRect,
				   TDE2_SURFACE_S* pstDst, TDE2_RECT_S	*pstDstRect);



/**
\brief Adds the transfer operation (with additional functions available for the raster or macroblock bitmap) to a TDE task.
CNcomment:�����������ӶԹ�դ/���λͼ�����и��ӹ��ܵİ��Ʋ���CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
If the sizes of the foreground bitmap and target bitmap are different, scaling is performed based on the preset scaling area. If no scaling area is set, the clip and transfer operations are performed based on the minimum value of the public area.\n
The value of the global alpha, Alpha0, or Alpha1 ranges from 0 to 255.\n
The background bitmap and the target bitmap can be the same.\n
If only the single-source transfer operation with additional functions,you can set the structure information and the pointer of the operating area of the background or the background bitmap to null,but the pointer to the operation option type can't be null,and it doesn't support ColorKey and Blend.\n
Scaling is not supported if the mirror function is enabled.\n
If only the single-source transfer operation (for example, performing the ROP and reverse operations on the source bitmap only) is required, you can set the structure information and the pointer of the operating area of the background or the background bitmap to null.\n
Scaling is not supported if the mirror function is enabled.\n
The clip operation can be performed only when the clipping area overlaps the operating area; otherwise, an error occurs.\n
When the color extension (from CLUT to ARGB/AYCbCr) is performed for the first time, the CLUT Reload flag function must be enabled.\n
During a simple transfer operation (the operation does not contain additional functions and the pixel format of source and target bitmaps are the same), you can set the pointer to the operation option type to null. Then fast transfer is implemented.\n
The pixel format of the target bitmap cannot be the macroblock format.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
��ǰ��Դλͼ��Ŀ��λͼ�ߴ粻һ��ʱ��������������������趨������������ţ����������ù����������Сֵ���вü�����\n
Global Alpha��Alplh0��Alpha1������ֵͳһ����[0,255]�ķ�Χ��������\n
����λͼ������Ŀ��λͼΪͬһλͼ\n
��ֻ��Ҫʹ�õ�Դ���Ʋ����Ҵ����ӹ���ʱ�����Խ������򱳾�λͼ�Ľṹ��Ϣ�Ͳ�������ṹָ������Ϊ�գ�����ѡ��ṹ��ָ�벻��Ϊ�ա���֧�ֵ�ԴBlend��ColorKey����\n
���ܹ������þ����ͬʱ��������\n
��Clip����ʱ���ü������������������й�������������᷵�ش���\n
�ڵ�һ������ɫ��չ������ԴΪClut��ʽ��Ŀ��ΪARGB/AYCbCr��ʽ��ʱ����Ҫ��Clut Reload���\n
���򵥵İ��Ʋ���(�������ӹ��ܣ���Դ��Ŀ������ظ�ʽһ��)ʱ�����Խ�����ѡ��ṹ��ָ������Ϊ��,��ʱ����п��ٰ���\n
��֧��Ŀ�����ظ�ʽΪ����ʽ\n	CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstBackGround  Background bitmap. CNcomment:����λͼCNend
\param[in] pstBackGroundRect  Operating area of the background bitmap. CNcomment:����λͼ��������CNend
\param[in] pstForeGround  Foreground bitmap. CNcomment:ǰ��λͼCNend
\param[in] pstForeGroundRect  Operating area of the foreground bitmap. CNcomment:ǰ��λͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\param[in] pstOpt  Structure for setting operation parameters. CNcomment:����������ýṹCNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_ERR_TDE_NOT_ALIGNED  The start address of the CLUT is not 4-byte aligned. CNcomment:Clut������ʼ��ַû�а���4byte����CNend
\retval ::HI_ERR_TDE_MINIFICATION  The minification is too large. CNcomment:��С��������CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The bitmap does not support this operation. CNcomment:λͼ�ĸ�ʽ������֧�ִ˲���CNend
\retval ::HI_ERR_TDE_CLIP_AREA	The operating area does not overlap the clipping area, and the displayed information is not updated. CNcomment:����������Clip����û�н�������ʾ�����и���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����
\see \n
N/A
*/
HI_S32	    HI_TDE2_Bitblit(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstBackGround, TDE2_RECT_S  *pstBackGroundRect,
			    TDE2_SURFACE_S* pstForeGround, TDE2_RECT_S	*pstForeGroundRect, TDE2_SURFACE_S* pstDst,
			    TDE2_RECT_S	 *pstDstRect, TDE2_OPT_S* pstOpt);


/**
\brief Adds the fill and transfer operations (with additional functions available for the raster bitmap) to a TDE task. After addition, the functions of drawing a point, drawing a line, filling in a color block on the surface, and filling in a memory can be implemented.
CNcomment:�����������ӶԹ�դλͼ�����и��Ӳ����������Ʋ�����ʵ����surface�ϻ��㡢���ߡ�ɫ�������ڴ����ȹ���CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
When the foreground bitmap is null, the functions of this API are the same as those of HI_TDE2_QuickFil.\n
During solid drawing, the foreground bitmap supports the colorkey operation only.\n
To draw a rectangle, a vertical line, or a horizontal line by calling HI_TDE2_SolidDraw, you need to set the width and height of the filled rectangle. For example, drawing a vertical line is to draw a rectangle with the width of one pixel.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
��ǰ��λͼΪNULLʱ���ýӿں�HI_TDE2_QuickFillʵ�ֵĹ���һ��\n
��Solid Drawʱ��ֻ�ܶ�ǰ����Color Key\n
Solid Draw���ƾ��λ���ˮƽ/��ֱֱ�ߵķ�����ͨ�����������εĿ�/������ɡ����磺��ֱֱ�߾��ǻ��ƿ���Ϊ1���صľ���\n  CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstForeGround  Foreground bitmap. CNcomment:ǰ��λͼCNend
\param[in] pstForeGroundRect  Operating area of the foreground bitmap. CNcomment:ǰ��λͼ�Ĳ�������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ�Ĳ�������CNend
\param[in] pstFillColor	 Structure of fill colors. CNcomment:���ɫ�ṹ��CNend
\param[in] pstOpt  Structure of operation attributes. CNcomment:�������Խṹ��CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_ERR_TDE_NOT_ALIGNED  The start address of the CLUT is not 4-byte aligned. CNcomment:Clut������ʼ��ַû�а���4byte����CNend
\retval ::HI_ERR_TDE_MINIFICATION  The minification is too large. CNcomment:��С��������CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The bitmap does not support this operation. CNcomment:λͼ�ĸ�ʽ������֧�ִ˲���CNend
\retval ::HI_ERR_TDE_CLIP_AREA	The operating area does not overlap the clipping area, and the displayed information is not updated. CNcomment:����������Clip����û�н�������ʾ�����и���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_SolidDraw(TDE_HANDLE s32Handle, TDE2_SURFACE_S* pstForeGround, TDE2_RECT_S	*pstForeGroundRect,
			      TDE2_SURFACE_S *pstDst,
			      TDE2_RECT_S  *pstDstRect, TDE2_FILLCOLOR_S *pstFillColor,
			      TDE2_OPT_S *pstOpt);


/**
\brief Adds the transfer operation (with additional functions available for the macroblock bitmap) to a TDE task. That is, the luminance macroblock data and the chrominance macroblock data are combined into raster data. During the combination, the scaling, anti-flicker, and clip operations can be performed concurrently.
CNcomment:�����������ӶԺ��λͼ�����и��ӹ��ܵİ��Ʋ����������Ⱥ�ɫ�Ⱥ�����ݺϲ��ɹ�դ��ʽ�����԰������š�����˸��Clip����CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
For the YCbCr422 macroblock, the horizontal coordination of the start point and the width of the operating area must be an even number.\n
The pixel format of the target bitmap cannot be the macroblock format.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
����YCbCr422��ʽ�ĺ�飬����������ʼ��ˮƽ�����Լ����ȱ�����ż��\n
��֧��Ŀ�����ظ�ʽΪ����ʽ\n	CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstMB  Surface of a macroblock. CNcomment:���surface  CNend
\param[in] pstMbRect  Operating area of a macroblock. CNcomment:����������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ���������CNend
\param[in] pstMbOpt  Operation attributes of a macroblock. CNcomment:����������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_ERR_TDE_MINIFICATION  The minification is too large because its maximum value is 255. CNcomment:��С�����������ƣ����Ϊ��С255����CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The bitmap does not support this operation. CNcomment:λͼ�ĸ�ʽ������֧�ִ˲���CNend
\retval ::HI_ERR_TDE_CLIP_AREA	The operating area does not overlap the clipping area, and the displayed information is not updated. CNcomment:����������Clip����û�н�������ʾ�����и���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_MbBlit(TDE_HANDLE s32Handle, TDE2_MB_S* pstMB, TDE2_RECT_S	*pstMbRect, TDE2_SURFACE_S* pstDst, TDE2_RECT_S	 *pstDstRect,
			   TDE2_MBOPT_S* pstMbOpt);


/**
\brief Adds the mask raster of operation (ROP) (available for the raster bitmap) to a TDE task. That is, the ROP operation is performed on the foreground bitmap and the background bitmap based on the mask bitmap.
CNcomment:�����������ӶԹ�դλͼ����Mask Rop���Ʋ���������Maskλͼʵ��ǰ��λͼ�ͱ���λͼROP��Ч��CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
The sizes of the operating areas of the mask bitmap, foreground bitmap, and background bitmap must be the same.\n
The mask bitmap must be in A1 format.\n
The target bitmap and foreground bitmap must be in the same color space.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n  CNend
����λͼ�Ĳ��������С����һ��\n
Maskλͼ������A1��ʽ��λͼ\n
Ŀ��λͼ��ǰ��λͼ����λ��ͬһ��ɫ�ռ�\n  CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstBackGround  Background bitmap. CNcomment:����λͼCNend
\param[in] pstBackGroundRect  Operating area of the background bitmap. CNcomment:����λͼ��������CNend
\param[in] pstForeGround  Foreground bitmap. CNcomment:ǰ��λͼCNend
\param[in] pstForeGroundRect  Operating area of the foreground bitmap. CNcomment:ǰ��λͼ��������CNend
\param[in] pstMask  Mask bitmap. CNcomment:MaskλͼCNend
\param[in] pstMaskRect	Operating area of the mask bitmap. CNcomment:Maskλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\param[in] enRopCode_Color  ROP code of a color component. CNcomment:��ɫ������ROP������CNend
\param[in] enRopCode_Alpha  ROP code of the alpha component. CNcomment:Alpha������ROP������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_BitmapMaskRop(TDE_HANDLE s32Handle,
				  TDE2_SURFACE_S* pstBackGround, TDE2_RECT_S  *pstBackGroundRect,
				  TDE2_SURFACE_S* pstForeGround, TDE2_RECT_S  *pstForeGroundRect,
				  TDE2_SURFACE_S* pstMask, TDE2_RECT_S	*pstMaskRect,
				  TDE2_SURFACE_S* pstDst, TDE2_RECT_S  *pstDstRect,
				  TDE2_ROP_CODE_E enRopCode_Color, TDE2_ROP_CODE_E enRopCode_Alpha);


/**
\brief Adds the mask blend operation (available for the raster bitmap) to a TDE task. That is, the foreground bitmap and the background bitmap are blending with the mask bitmap based on the mask bitmap.
CNcomment:�����������ӶԹ�դλͼ����Mask Blend���Ʋ���������Maskλͼʵ��ǰ��λͼ�ͱ���λͼ��Maskλͼ�ĵ���Ч��CNend
\attention \n
Before calling this API, you must call HI_TDE2_Open to start a TDE device and call HI_TDE2_BeginJob to obtain a valid task handle.\n
The target bitmap and background bitmap must be in the same color space.\n
If the foreground bitmap contains the premultiplied data, the premultiplied mode must be selected during alpha blending; otherwise, the non-premultiplied mode is selected.
The parameter enBlendMode cannot be set to TDE2_ALUCMD_ROP.\n
CNcomment:�ڵ��ô˽ӿ�ǰӦ��֤����HI_TDE2_Open��TDE�豸�����ҵ���HI_TDE2_BeginJob�������Ч��������\n
Ŀ��λͼ�ͱ���λͼ����λ��ͬһ��ɫ�ռ�\n
���ǰ����λͼ��Ԥ���˵����ݣ�Alpha����ģʽӦ��ѡ��Ԥ��ģʽ������ѡ���Ԥ��ģʽ\n
enBlendMode����ѡ��TDE2_ALUCMD_ROPģʽ\n  CNend

\param[in] s32Handle   Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstBackGround  Background bitmap. CNcomment:����λͼCNend
\param[in] pstBackGroundRect  Operating area of the background bitmap. CNcomment:����λͼ��������CNend
\param[in] pstForeGround  Foreground bitmap. CNcomment:ǰ��λͼ
\param[in] pstForeGroundRect  Operating area of the foreground bitmap.CNcomment: ǰ��λͼ��������CNend
\param[in] pstMask  Mask bitmap. CNcomment:MaskλͼCNend
\param[in] pstMaskRect	Operating area of the mask bitmap. CNcomment:Maskλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼ
\param[in] pstDstRect  Operating area of the target bitmap. CNcomment:Ŀ��λͼ��������CNend
\param[in] u8Alpha  Global alpha value during alpha blending. CNcomment:Alpha����ʱ��ȫ��AlphaֵCNend
\param[in] enBlendMode	Alpha blending mode. CNcomment:Alpha����ģʽѡ��CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������
\retval ::HI_ERR_TDE_NO_MEM  Adding an operation fails due to insufficient memory. CNcomment:�ڴ治�㣬�޷����Ӳ���CNend
\retval ::HI_FAILURE  A system error or an unknown error occurs. CNcomment:ϵͳ�����δ֪����CNend
\see \n
N/A
*/
HI_S32	    HI_TDE2_BitmapMaskBlend(TDE_HANDLE s32Handle,
				    TDE2_SURFACE_S* pstBackGround, TDE2_RECT_S	*pstBackGroundRect,
				    TDE2_SURFACE_S* pstForeGround, TDE2_RECT_S	*pstForeGroundRect,
				    TDE2_SURFACE_S* pstMask, TDE2_RECT_S  *pstMaskRect,
				    TDE2_SURFACE_S* pstDst, TDE2_RECT_S	 *pstDstRect,
				    HI_U8 u8Alpha, TDE2_ALUCMD_E enBlendMode);


/**
\brief	Adds the rotation operation to a TDE task. CNcomment:��������������ת����CNend
\attention \n
The pixel formats of the source bitmap and target bitmap must be the same, and the format cannot be YUV, CLUT1, or CLUT4.\n
The parameters s32DstPointX and s32DstPointY are set to 0 by default. Because the two parameters are not used at present, they can be set to any values.\n
CNcomment:Դ��Ŀ������ظ�ʽ������ͬ�����Ҳ�����YUV��CLUT1��CLUT4��ʽ\n
����s32DstPointX��s32DstPointYĬ��Ϊ0��Ŀǰ����������û���õ������������κ�ֵ\n	 CNend

\param[in] s32Handle  Handle of a TDE task. CNcomment:TDE������CNend
\param[in] pstSrc  Source bitmap.CNcomment: ԴλͼCNend
\param[in] pstSrcRect  Operating area of the source bitmap. CNcomment:Դλͼ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼCNend
\param[in] s32DstPointX	 Horizontal coordinate of the start point of the operating area in the target bitmap. CNcomment:Ŀ��λͼ�����������ʼ�������CNend
\param[in] s32DstPointY	 Vertical coordinate of the start point of the operating area in the target bitmap. CNcomment:Ŀ��λͼ�����������ʼ��������CNend
\param[in] enRotateAngle  Rotate angle. CNcomment:��ת�ĽǶ�CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::HI_ERR_TDE_DEV_NOT_OPEN  Calling this API fails because no TDE device is started. CNcomment:TDE�豸δ�򿪣�API����ʧ��CNend
\retval ::HI_ERR_TDE_INVALID_HANDLE  The handle of a TDE task is invalid. CNcomment:�Ƿ���������CNend
\retval ::HI_ERR_TDE_NULL_PTR  The parameter contains a null pointer. CNcomment:�������п�ָ�����CNend
\retval ::HI_ERR_TDE_UNSUPPORTED_OPERATION  The operation is not supported. CNcomment:��֧�ֵĲ���CNend
\retval ::HI_ERR_TDE_INVALID_PARA  The parameter is invalid. CNcomment:��Ч�Ĳ�������CNend
\see \n
N/A
*/
HI_S32 HI_TDE2_Rotate(TDE_HANDLE s32Handle,
		    TDE2_SURFACE_S *pstSrc, TDE2_RECT_S *pstSrcRect,
		    TDE2_SURFACE_S *pstDst, HI_S32 s32DstPointX,  HI_S32 s32DstPointY,
		    TDE_ROTATE_ANGLE_E enRotateAngle);



/**
\brief Sets the anti-flicker level. CNcomment:���ÿ���˸����CNend
\attention \n
N/A
\param[in] enDeflickerLevel  Anti-flicker level. CNcomment:����˸ϵ������CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see none
*/
HI_S32 HI_TDE2_SetDeflickerLevel(TDE_DEFLICKER_LEVEL_E enDeflickerLevel);


/**
\brief Obtains the anti-flicker level.CNcomment: ��ȡ����˸����CNend
\attention \n
N/A
\param[in] pDeflickerLevel  Anti-flicker level. CNcomment:����˸����CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_GetDeflickerLevel(TDE_DEFLICKER_LEVEL_E *pDeflickerLevel);


/**
\brief Sets the alpha judgment threshold. CNcomment:����alpha�о���ֵCNend
\attention \n
N/A
\param[in] u8ThresholdValue  Judgment threshold. CNcomment:�о���ֵCNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_SetAlphaThresholdValue(HI_U8 u8ThresholdValue);


/**
\brief Obtains the alpha judgment threshold. CNcomment:��ȡalpha�о���ֵCNend
\attention \n
N/A
\param[in] pu8ThresholdValue  Judgment threshold. CNcomment:�о���ֵCNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_GetAlphaThresholdValue(HI_U8 *pu8ThresholdValue);


/**
\brief Enables or disables the alpha judgment. CNcomment:����alpha�о�����CNend
\attention  N/A
\param[in] bEnAlphaThreshold  Whether to enable the alpha judgment. CNcomment:alpha�о�����CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::
\see \n
N/A
*/
HI_S32 HI_TDE2_SetAlphaThresholdState(HI_BOOL bEnAlphaThreshold);


/**
\brief Obtains the enable status of the alpha judgment. CNcomment:��ȡalpha�о�����CNend
\attention N/A
\param[in]  p_bEnAlphaThreshold	 Whether to enable the alpha judgment. CNcomment:alpha�о�����CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_GetAlphaThresholdState(HI_BOOL * p_bEnAlphaThreshold);


/**
\brief Fills in the pattern. CNcomment:ģʽ���CNend
\attention N/A
\param[in] s32Handle  Handle of a TDE task. CNcomment:������CNend
\param[in] pstBackGround  Background bitmap. CNcomment:����λͼ��ϢCNend
\param[in] pstBackGroundRect  Operating rectangle of the background bitmap. CNcomment:������������CNend
\param[in] pstForeGround  Foreground bitmap. CNcomment:ǰ��λͼ��ϢCNend
\param[in] pstForeGroundRect  Operating rectangle of the foreground bitmap. CNcomment:ǰ��λ��������CNend
\param[in] pstDst  Target bitmap. CNcomment:Ŀ��λͼ��ϢCNend
\param[in] pstDstRect  Operating rectangle of the target bitmap. CNcomment:Ŀ���������CNend
\param[in] pstOpt  Options for pattern filling. CNcomment:ģʽ������ѡ��CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_PatternFill(TDE_HANDLE s32Handle, TDE2_SURFACE_S *pstBackGround,
			   TDE2_RECT_S *pstBackGroundRect, TDE2_SURFACE_S *pstForeGround,
			   TDE2_RECT_S *pstForeGroundRect, TDE2_SURFACE_S *pstDst,
			   TDE2_RECT_S *pstDstRect, TDE2_PATTERN_FILL_OPT_S *pstOpt);

/**
\brief Enables or disables the regional anti-flicker function. CNcomment:ʹ��/ȥʹ�ֲܾ�����˸CNend
\attention N/A
\param[in] bRegionDeflicker  Enable/disable flag. CNcomment:ʹ��/ȥʹ�ܱ�־CNend
\retval 0 success. CNcomment:�ɹ�CNend
\retval ::

\see \n
N/A
*/
HI_S32 HI_TDE2_EnableRegionDeflicker(HI_BOOL bRegionDeflicker);

/**
\brief: multi blend surface by surface list
\param[in]: composed surface list
\retval: 0 success
**/
HI_S32 HI_TDE2_MultiBlending(TDE_HANDLE s32Handle, TDE_SURFACE_LIST_S *pstSurfaceList);

/** @} */  /** <!-- ==== API declaration end ==== */
#ifdef __cplusplus
 #if __cplusplus
}
 #endif /* __cplusplus */
#endif	/* __cplusplus */

#endif	/* _HI_API_TDE2_H_ */
