/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	 : hi_drv_jpeg.h
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

#ifndef __HI_DRV_JPEG_H__
#define __HI_DRV_JPEG_H__


/***************************** add include here*********************************/
#include "hi_type.h"


/*****************************************************************************/

    /***************************** Macro Definition ********************************/
    #define VID_CMD_MAGIC     'j'



    #define CMD_JPG_GETDEVICE		     _IO(VID_CMD_MAGIC,	  0)
    #define CMD_JPG_GETSUSPEND		     _IO(VID_CMD_MAGIC,	  3)
    #define CMD_JPG_GETRESUME		     _IO(VID_CMD_MAGIC,	  4)

    #define CMD_JPG_RESET		     _IO(VID_CMD_MAGIC,	  5)
    #define CMD_JPG_CANCEL_RESET	     _IO(VID_CMD_MAGIC,	  6)
    #define CMD_JPG_OPEN_RESET_CLOCK	     _IO(VID_CMD_MAGIC,	  7)

#ifdef CHIP_TYPE_X5HD_hi3716m
    #define CMD_JPG_GETINTSTATUS	     _IOWR(VID_CMD_MAGIC, 8,  JPG_GETINTTYPE_S*)
#else
    #define CMD_JPG_GETINTSTATUS	     _IOWR(VID_CMD_MAGIC, 8,  JPG_GETINTTYPE_S)
#endif
    #define CMD_JPG_GETRESUMEVALUE	     _IOWR(VID_CMD_MAGIC, 9, unsigned int)

    #define CMD_JPG_READPROC		     _IOWR(VID_CMD_MAGIC, 10,  HI_JPEG_PROC_INFO_S)

    #define CMD_JPG_CREATEDEC		     _IOWR(VID_CMD_MAGIC, 11,  HI_U32)
    #define CMD_JPG_DECINFO		     _IOWR(VID_CMD_MAGIC, 12,  HI_DRV_JPEG_INMSG_S)
    #define CMD_JPG_DECOUTINFO		     _IOWR(VID_CMD_MAGIC, 13,  HI_DRV_JPEG_OUTMSG_S)
    #define CMD_JPG_DECODE		     _IOWR(VID_CMD_MAGIC, 14,  HI_JPEG_DECINFO_S)
    #define CMD_JPG_DESTORYDEC		     _IOWR(VID_CMD_MAGIC, 15,  HI_U32)
    #define CMD_JPG_GETLUPIXSUM		     _IOWR(VID_CMD_MAGIC, 16,  HI_DRV_JPEG_OUTMSG_S)

    #define CMD_JPG_LOWDELAY_LINEINFO	       _IOWR(VID_CMD_MAGIC, 17, HI_JPEG_OUTPUTINFO_S)
    #define CMD_JPG_COMPAT_LOWDELAY_LINEINFO   _IOWR(VID_CMD_MAGIC, 17, HI_JPEG_COMPAT_OUTPUTINFO_S)
    #define CMD_JPG_SET_LOWDELAY_LINE	       _IOWR(VID_CMD_MAGIC, 18, HI_JPEG_OUTPUTINFO_S)
    #define CMD_JPG_COMPAT_SET_LOWDELAY_LINE   _IOWR(VID_CMD_MAGIC, 18, HI_JPEG_COMPAT_OUTPUTINFO_S)

    #define CMD_JPG_SET_DECBUF_STATE	     _IOWR(VID_CMD_MAGIC, 19, HI_BOOL)
    #define CMD_JPG_GET_DECBUF_STATE	     _IOWR(VID_CMD_MAGIC, 20, HI_BOOL)

    #define MAX_COMPONENT_NUM		      3
    #define JPEG_INTTYPE_DELAY_TIME	      10000 /** 10s **/

    /***************************** Structure Definition ****************************/
    typedef enum hiJPG_INTTYPE_E{
	JPG_INTTYPE_NONE       = 0,
	JPG_INTTYPE_CONTINUE,
	JPG_INTTYPE_LOWDEALY,
	JPG_INTTYPE_FINISH,
	JPG_INTTYPE_ERROR,
	JPG_INTTYPE_STREAM_ERROR,
	JPG_INTTYPE_BUTT
    }JPG_INTTYPE_E;

    typedef enum hiJPG_FMT_E{
	JPG_FMT_YUV400	       = 0,
	JPG_FMT_YUV420	       = 1,
	JPG_FMT_YUV422_21      = 2,
	JPG_FMT_YUV422_12      = 3,
	JPG_FMT_YUV444	       = 4,
	JPG_FMT_YCCK	       = 5,
	JPG_FMT_CMYK	       = 6,
	JPG_FMT_BUTT
    }JPG_FMT_E;

    typedef struct hiJPG_GETINTTYPE_S{
	JPG_INTTYPE_E IntType;
	unsigned int TimeOut;
    }JPG_GETINTTYPE_S;

    typedef enum hiJPEG_DEC_STATE_E{
	JPEG_DEC_FINISH_CREATE_DECOMPRESS  = 0, /**< create decompress finish	*//**<CNcomment:��������������	*/
	JPEG_DEC_FINISH_STDIC		   = 1, /**< stdio the stream  finish	*//**<CNcomment:������������	*/
	JPEG_DEC_FINISH_READ_HEADER	   = 2, /**< read header file finish	*//**<CNcomment:�����ļ�����	*/
	JPEG_DEC_FINISH_START_DECOMPRESS   = 3, /**< start decompress finish	*//**<CNcomment:�������	*/
	JPEG_DEC_FINISH_READ_SCANLINES	   = 4, /**< read scanlines   finish	*//**<CNcomment:�������	*/
	JPEG_DEC_FINISH_FINISH_DECOMPRESS  = 5, /**< finish decompress finish	*//**<CNcomment:��ɽ���	*/
	JPEG_DEC_FINISH_DESTORY_DECOMPRESS = 6, /**< destory decompress finish	*//**<CNcomment:���ٽ���������	*/
	JPEG_DEC_SUCCESS		   = 7, /**< decode success		*//**<CNcomment:����ɹ�	*/
	JPEG_DEC_STATE_BUTT
    }HI_JPEG_DEC_STATE_E;

    typedef enum hiJPEG_DEC_TYPE_E{
	JPEG_DEC_HW = 0,
	JPEG_DEC_SW = 1,
	JPEG_DEC_BUTT
    }HI_JPEG_DEC_TYPE_E;

    typedef struct hiJPG_SAVEINFO_S{
	HI_U32	   u32ResumeData0;
	HI_U32	   u32ResumeData1;
	HI_U32	   u32ResBitRemain;
	HI_U32	   u32ResByteConsu;
	HI_U32	   u32ResMcuy;
	HI_U32	   u32Pdy;
	HI_U32	   u32Pdcbcr;
	HI_U32	 u32DriCnt;
    }HI_JPG_SAVEINFO_S;

    typedef struct hiJPEG_PROC_INFO_S{
	 HI_U32	 u32YWidth;	    /**< the lu width	    *//**<CNcomment:���ȿ����� */
	 HI_U32	 u32YHeight;	    /**< the lu height	    *//**<CNcomment:���ȸ߶�   */
	 HI_U32	 u32YSize;	    /**< the lu size	    *//**<CNcomment:���ȴ�С   */
	 HI_U32	 u32CWidth;	    /**< the ch width	    *//**<CNcomment:ɫ�ȿ���   */
	 HI_U32	 u32CHeight;	    /**< the ch height	    *//**<CNcomment:ɫ�ȸ߶�   */
	 HI_U32	 u32CSize;	    /**< the ch size	    *//**<CNcomment:ɫ�ȴ�С   */
	 HI_U32	 u32YStride;	    /**< the lu stride	    *//**<CNcomment:�����м�� */
	 HI_U32	 u32CbCrStride;	    /**< the ch stride	    *//**<CNcomment:ɫ���м�� */
	 HI_U32	 u32DisplayW;	    /**< the display width  *//**<CNcomment:��ʾ����   */
	 HI_U32	 u32DisplayH;	    /**< the display height *//**<CNcomment:��ʾ�߶�   */
	 HI_U32	 u32DisplayStride;  /**< the display stride *//**<CNcomment:��ʾ�м��	*/
	 HI_U32	 u32DecW;	    /**< the dec width	    *//**<CNcomment:�������	*/
	 HI_U32	 u32DecH;	    /**< the dec height	    *//**<CNcomment:����߶�	*/
	 HI_U32	 u32DecStride;	    /**< the dec stride	    *//**<CNcomment:�����м��	*/
	 HI_U32	 u32DataStartAddr;  /**< the stream start address     *//**<CNcomment:����buffer��ʼ��ַ��Ҫ64�ֽڶ���	    */
	 HI_U32	 u32DataEndAddr;    /**< the stream end address	      *//**<CNcomment:����buffer������ַ��Ҫ64�ֽڶ���	    */
	 HI_U32	 u32SaveStartAddr;  /**< the save data start address  *//**<CNcomment:�洢��������ʼ��ַ(��������ַ������)  */
	 HI_U32	 u32SaveEndAddr;    /**< the save data end address    *//**<CNcomment:�洢�����Ľ�����ַ(��������ַ������)  */
	 /** user need proc information */
	 /** CNcomment:�û��뿴������Ϣ */
	 HI_U32 u32InWidth;		/**< the input widht		 *//**<CNcomment:�������      */
	 HI_U32 u32InHeight;		/**< the input height		 *//**<CNcomment:����߶�      */
	 HI_U32 u32OutWidth;		/**< the output width		 *//**<CNcomment:�������      */
	 HI_U32 u32OutHeight;		/**< the output height		 *//**<CNcomment:����߶�      */
	 HI_U32 u32OutStride;		/**< the output stride		 *//**<CNcomment:����м��    */
	 HI_U32 u32InFmt;		/**< the input format		 *//**<CNcomment:�������ظ�ʽ  */
	 HI_U32 u32OutFmt;		/**< the output format		 *//**<CNcomment:������ظ�ʽ  */
	 HI_U32 u32OutPhyBuf;		/**< the output physics address	 *//**<CNcomment:���������ַ  */
	 HI_U32 u32Scale;		/**< the decode scale		 *//**<CNcomment:�������ű���  */
	 HI_JPEG_DEC_STATE_E eDecState; /**< the decode state		 *//**<CNcomment:����״̬      */
	 HI_JPEG_DEC_TYPE_E eDecodeType;/**< the decode type		 *//**<CNcomment:��������      */
    }HI_JPEG_PROC_INFO_S;


    typedef struct tagJPEG_INMSG_S{
	 HI_U32	    u32AllPhy;	       /** ��������buffer����ʼ������ַ **/
	 HI_U32	    u32SavePhy;	       /** ��һ���������������ַ	**/
	 HI_U64	    u64SaveVir[2];     /** �������������ַ���ڶ��������ַ����������buffer��������ַ��Ӧ **/
	 HI_U32	    u32AllLen;	       /** ��������buffer�ĳ���		**/
	 HI_U32	    u32SaveLen[2];     /** ������������buffer�Ĵ�С	**/
	 HI_U32	    s32InWidth;	       /** ����ͼ���			**/
	 HI_U32	    s32InHeight;       /** ����ͼ���			**/
	 HI_U32	    DecHandle;	       /** ������			**/
	 HI_BOOL    bUserPhyMem;       /** �Ƿ����Ϊ������ַ		**/
	 JPG_FMT_E  enInFmt;	       /** ����ͼ�����ظ�ʽ		**/
    }HI_DRV_JPEG_INMSG_S;

    typedef struct tagJPEG_OUTMSG_S{
	 HI_U32	     u32OutPhy[MAX_COMPONENT_NUM];
	 HI_U32	     u32OutVir[MAX_COMPONENT_NUM];
	 HI_U32	     u32OutWidth[MAX_COMPONENT_NUM];
	 HI_U32	     u32OutHeight[MAX_COMPONENT_NUM];
	 HI_U32	     u32OutStride[MAX_COMPONENT_NUM];
	 HI_U32	     u32OutSize[MAX_COMPONENT_NUM];
	 HI_S32	     s32Scale;
	 HI_U32	     DecHandle;
	 HI_U64	     u64LuPixValue;
	 HI_BOOL     bOutYuvSp420;
	 HI_BOOL     bLuPixSum;
	 JPG_FMT_E   enOutFmt;
    }HI_DRV_JPEG_OUTMSG_S;

    typedef struct hiJPEG_DECINFO_S{
	 HI_DRV_JPEG_INMSG_S  stInMsg;
	 HI_DRV_JPEG_OUTMSG_S stOutMsg;
    }HI_JPEG_DECINFO_S;


    typedef struct hiJPEG_OUTPUTINFO_S{
	 HI_CHAR* pVirLineBuf;
	 HI_U32 u32OutHeight[MAX_COMPONENT_NUM];
    }HI_JPEG_OUTPUTINFO_S;

    typedef struct hiJPEG_COMPAT_OUTPUTINFO_S{
	 HI_U32 u32VirLineBuf;
	 HI_U32 u32OutHeight[MAX_COMPONENT_NUM];
    }HI_JPEG_COMPAT_OUTPUTINFO_S;

    /***************************** Global Variable declaration *********************/

    /***************************** API forward declarations ************************/

    /***************************** API realization *********************************/

    /***************************************************************************
    * func	    : HI_DRV_JPEG_CreateDec
    * description   : ctreate jpeg decoder.
		      CNcomment: ���������� CNend\n
    * param[in]	    : *pDecHandle
    * retval	    : HI_SUCCESS �ɹ�
    * retval	    : HI_FAILURE ʧ��
    * others:	    : NA
    ****************************************************************************/
    HI_S32 HI_DRV_JPEG_CreateDec(HI_U32 *pDecHandle);


    /***************************************************************************
    * func	    : HI_DRV_JPEG_DecInfo
    * description   : get jpeg input infomation.
		      CNcomment: ��ȡͼƬ������Ϣ CNend\n
    * param[in]	    : DecHandle
    * param[in]	    : *stInMsg
    * retval	    : HI_SUCCESS �ɹ�
    * retval	    : HI_FAILURE ʧ��
    * others:	    : NA
    ****************************************************************************/
    HI_S32 HI_DRV_JPEG_DecInfo(HI_U32 DecHandle,HI_DRV_JPEG_INMSG_S *stInMsg);

    /***************************************************************************
    * func	    : HI_DRV_JPEG_DecOutInfo
    * description   : get jpeg output infomation.
		      CNcomment: ��ȡͼƬ�����Ϣ CNend\n
    * param[in]	    : DecHandle
    * param[in]	    : *stOutMsg
    * retval	    : HI_SUCCESS �ɹ�
    * retval	    : HI_FAILURE ʧ��
    * others:	    : NA
    ****************************************************************************/
    HI_S32 HI_DRV_JPEG_DecOutInfo(HI_U32 DecHandle,HI_DRV_JPEG_OUTMSG_S *stOutMsg);

    /***************************************************************************
    * func	    : HI_DRV_JPEG_DecFrame
    * description   : dec one frame.
		     CNcomment: ����һ֡ͼƬ CNend\n
    * param[in]	    : DecHandle
    * param[in]	    : *pstDecInfo
    * retval	    : HI_SUCCESS �ɹ�
    * retval	    : HI_FAILURE ʧ��
    * others:	    : NA
    ****************************************************************************/
    HI_S32 HI_DRV_JPEG_DecFrame(HI_U32 DecHandle,HI_JPEG_DECINFO_S *pstDecInfo);

    /***************************************************************************
    * func	    : HI_DRV_JPEG_DestoryDec
    * description   : destory decode.
		      CNcomment: ���ٽ����� CNend\n
    * param[in]	    : DecHandle
    * retval	    : HI_SUCCESS �ɹ�
    * retval	    : HI_FAILURE ʧ��
    * others:	    : NA
    ****************************************************************************/
    HI_VOID HI_DRV_JPEG_DestoryDec(HI_U32 DecHandle);

    /***************************************************************************************
    * func	    : HI_DRV_JPEG_GetLuPixSum
    * description   : get lu pix sum
		      CNcomment: ��ȡ����ֵ�� CNend\n
    * param[in]	    : DecHandle
    * retval	    :
    * retval	    :
    * others:	    : NA
    ***************************************************************************************/
    HI_VOID HI_DRV_JPEG_GetLuPixSum(HI_U32 DecHandle,HI_U64* pu64LuPixValue);

    /****************************************************************************/

#endif /* __HI_DRV_JPEG_H__*/
