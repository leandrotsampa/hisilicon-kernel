/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name   : png_hal.h
Version	    : Initial Draft
Author	    : z00141204
Created	    : 2010/10/11
Description : PNG hal interface
Function List	: PngHalInit
	      PngHalDeinit
	      PngHalReset

History		:
Date		    Author		Modification
2010/10/11	z00141204	Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __PNG_HAL_H__
#define __PNG_HAL_H__

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif	/* __cplusplus */
#endif	/* __cplusplus */

#include "hi_png_type.h"
#include "hi_png_config.h"


/*Base address of PNG register*/
/*CNcomment:PNG�Ĵ�������ַ*/
#define PNG_REG_BASEADDR   0xf8c70000

/*Size of PNG register*/
/*CNcomment:PNG�Ĵ�����С*/
#define PNG_REG_SIZE	    0x120


/*Address of PNG reset regioster*/
/*CNcomment:PNG��λ�Ĵ�������ַ */
#define PNG_REG_RESET	    0xf8a22084
/*PNG interrupt num*/
/*CNcomment:PNG�жϺ�*/
#define PNG_INTNUM	    (96 + 32)

/*Interrupt mask*/
/*CNcomment:�ж�����*/
#define PNG_INT_FINISH_MASK  0x1    /*Finish interrupt mask*//*CNcomment:����ж�*/
#define PNG_INT_RESUME_MASK  0x2    /*Resume stream interrupt mask*//*CNcomment:�������ж�*/
#define PNG_INT_ERR_MASK     0x4    /*Decode err interrupt mask*//*CNcomment:�����ж�*/

typedef union tag_PNG_SIZE_U
{
    struct
    {
	HI_U32 u32Height:   13;
	HI_U32 u32Reserved1 :	3;
	HI_U32 u32Width :   13;
	HI_U32 u32Reserved2 :	3;
    } stBits;
    HI_U32 u32All;
} PNG_SIZE_U;

typedef union tag_PNG_TYPE_U
{
    struct
    {
	HI_U32 u32BitDepth  :	5;
	HI_U32 u32Reserved1 :	3;
	HI_U32 u32ColorFmt :   3;
	HI_U32 u32Reserved2 :	5;
	HI_U32 u32InterlaceType :   1;
	HI_U32 u32FunSel    :	1;
	HI_U32 u32StreamType	:   1;
	HI_U32 u32Reserved3  :	 13;
    } stBits;
    HI_U32 u32All;
} PNG_TYPE_U;

typedef union tag_PNG_TRANSFORM_U
{
    struct
    {
	/*Adjut pixel ordir when bpp(bit per pixel) = 1,2,4*/
	/*CNcomment:����1��2��4bit������˳��*/
	HI_U32 u32PixelOrderEn	:   1;

	/*Transform 1,2,4 bit to 8 bit if image type is gray*/
	/*CNcomment:��1��2��4bit�ĻҶ�ͼת����8bit */
	HI_U32 u32PackByteEn	:   1;

	/*Transform gray image to true color*/
	/*CNcomment:���Ҷ�ͼת��λ���ɫͼ */
	HI_U32 u32Gray2BGREn	:   1;

	/*Add alpha channel*/
	/*CNcomment:����alphaͨ�� */
	HI_U32 u32AddAlphaEn	:   1;

	/*Strip alpha channel*/
	/*CNcomment:ȥ��alphaͨ��*/
	HI_U32 u32StripAlphaEn	:   1;

	/*Transform BGR to RGB*/
	/*CNcomment:BGRת��ΪRGB */
	HI_U32 u32BGR2RGBEn	:   1;

	/*Swap alpha channel and data channel*/
	/*CNcomment:����alpha��ͼ�����ݵ�λ��*/
	HI_U32 u32SwapAlphaEn	:   1;

	/*Reserved*/
	/*CNcomment:����*/
	HI_U32 u32Reserved1	:   1;

	/*Trasnform image form 16 bit depth to 8 bit depth*/
	/*CNcomment:16λת��λ8λ*/
	HI_U32 u32Strip16En	:   1;

	/*Transform image from 8 bit depth to 4 bit depth*/
	/*CNcomment:8λת��λ4λ*/
	HI_U32 u32Strip4En	:   1;

	/*Reserved*/
	/*CNcomment:����*/
	HI_U32 u32Reserved2	:   6;

	/*The mode used when trasfomr 1,2,4 bit to 8 bit*/
	/*CNcomment:1,2,4bitת��Ϊ8bitʱ�ĵ�λ��䷽ʽ*/
	HI_U32 u32PackBypeMode	:   1;

	/*The mode used when strip 16 bit to 8 bit*/
	/*CNcomment:16λת8λ����ģʽ*/
	HI_U32 u32Streip16Mode	:   1;

	/*Enable transparent value*/
	/*CNcomment:�Ƿ�ʹ��͸��ɫ��Ϣ*/
	HI_U32 u32TransInfoEn	:   1;

	/*Dst color format when trasform to 4 bit*/
	/*CNcomment:ת��Ϊ4bitʱ�����ظ�ʽ*/
	HI_U32 u32Strip4Fmt	:   3;

	HI_U32 u32PreMultiAlphaEn     :	  1;
	HI_U32 u32PreMultiRoundMode	:   2;
	/*Reserved*/
	/*CNcomment:����*/
	HI_U32 u32Reserved3	:   7;
    } stBits;
    HI_U32 u32All;
} PNG_TRANSFORM_U;

typedef union tag_PNG_TRANS_COLOR0_U
{
    struct
    {
	HI_U16 u32TransColorR;
	HI_U16 u32TransColorG;
    } stBits;
    HI_U32 u32All;
} PNG_TRANS_COLOR0_U;

typedef union tag_PNG_TRANS_COLOR1_U
{
    struct
    {
	HI_U32 u32TransColorB	 :    16;
	HI_U32 u32AlphaFiller	 :    16;
    } stBits;
    HI_U32 u32All;
} PNG_TRANS_COLOR1_U;

typedef union tag_PNG_INT_U
{
    struct
    {
	HI_U32 u32DecFinish :	1;
	HI_U32 u32DecResume :	1;
	HI_U32 u32DecError  :	1;
	HI_U32 u32Reserved  :	13;

	/*Write out of bound when transforming image*/
	/*CNcomment:��ʽת��ʱbufдԽ��*/
	HI_U32 u32FmtBufErr  :	 1;

	/*Filter module write out of bound*/
	/*CNcomment:filterģ��дԽ��*/
	HI_U32 u32FltBufErr :	1;

	/*RDC module write out of bound*/
	/*CNcomment:rdcģ��дbufԽ��*/
	HI_U32 u32RdcBufErr :	1;

	/*Filter type invalid*/
	/*CNcomment:�˲����ʹ��� */
	HI_U32 u32FltTypeErr	:   1;

	/*Copy counte is not equal to 0 when ending*/
	/*CNcomment:cpy������ʱ��Ϊ0 */
	HI_U32 u32DecCpyErr :	1;

	/*Unkonwn Huffman code*/
	/*CNcomment:δ֪Huffman��*/
	HI_U32 u32HuffDecErr	:   1;

	/*Length of distance table is larger than 31*/
	/*CNcomment:distance��������31*/
	HI_U32 u32ZlibHdisErr	:   1;

	/*Length of literal table is larger than 29*/
	/*CNcomment:literal��������29 */
	HI_U32 u32ZlibHlitErr	:   1;

	/*Length of no inflate data invalid*/
	/*CNcomment:��ѹ������lenУ�����*/
	HI_U32 u32ZlibLenErr	:   1;

	/*Block type err*/
	/*CNcomment:�����ʹ���*/
	HI_U32 u32ZlibBtypeErr	:   1;

	/*CMF check err*/
	/*CNcomment:CMFУ���*/
	HI_U32 u32ZlibFcheckErr :   1;

	/*Dictionary ID err*/
	/*CNcomment:�ֵ��ʶ����*/
	HI_U32 u32ZlibFdictErr	:   1;

	/*Size of window is larger than 32K byte*/
	/*CNcomment:���ڴ�С����32k*/
	HI_U32 u32ZlibCinfoErr	:   1;

	/*Inflate method of Zlib stream err*/
	/*CNcomment:Zlib��ѹ����������*/
	HI_U32 u32ZlibCmErr	:   1;

	/*Adler check err*/
	/*CNcomment:AdlerУ�����*/
	HI_U32 u32AdlerErr	:   1;

	/*CRC check err*/
	/*CNcomment:CRC����*/
	HI_U32 u32CrcErr	:   1;
    } stBits;
    HI_U32 u32All;
} PNG_INT_U;

typedef union tag_PNG_INT_MASK_U
{
    struct
    {
	HI_U32 u32DecFinishMask :   1;
	HI_U32 u32DecResumeMask	 :   1;
	HI_U32 u32Reserved	:   14;
	HI_U32 u32FmtBufMask	:   1;
	HI_U32 u32FltButMask	:   1;
	HI_U32 u32RdcBufMask	:   1;
	HI_U32 u32FltTypeMask	:   1;
	HI_U32 u32DecCpyMask	:   1;
	HI_U32 u32HuffDecMask	:   1;
	HI_U32 u32ZlibHdistMask :   1;
	HI_U32 u32ZlibHlitMask	:   1;
	HI_U32 u32ZlibLenMask	:   1;
	HI_U32 u32ZlibBtypeMask :   1;
	HI_U32 u32ZlibFcheckMask    :	1;
	HI_U32 u32ZlibFdictMask :   1;
	HI_U32 u32ZlibCinfoMask :   1;
	HI_U32 u32ZlibCmMask	:   1;
	HI_U32 u32AdlerMask	:   1;
	HI_U32 u32CrcMask	:   1;
    } stBits;
    HI_U32 u32All;
} PNG_INT_MASK_U;

typedef union tag_PNG_ERR_MODE_U
{
    struct
    {
	HI_U32 u32Reserved  :	16; /*Reserved*//*CNcomment:����*/
	HI_U32 u32FmtBufStop	:   1;
	HI_U32 u32FltBufStop	:   1;
	HI_U32 u32RdcBufStop	:   1;
	HI_U32 u32FltTypeStop	:   1;
	HI_U32 u32DecCpyStop	:   1;
	HI_U32 u32HuffDecStop	:   1;
	HI_U32 u32ZlibHdistStop :   1;
	HI_U32 u32ZlibHlitStop	:   1;
	HI_U32 u32ZlibLenStop	:   1;
	HI_U32 u32ZlibBtypeStop :   1;
	HI_U32 u32ZlibFcheckStop    :	1;
	HI_U32 u32ZlibFdictStop :   1;
	HI_U32 u32ZlibCinfoStop :   1;
	HI_U32 u32ZlibCmStop	:   1;
	HI_U32 u32AdlerStop	:   1;
	HI_U32 u32CrcStop	:   1;
    } stBits;
    HI_U32 u32All;
} PNG_ERR_MODE_U;

typedef union tag_PNG_ERR_STATICS_U
{
    struct
    {
	HI_U32 u32TotalIdatNums :   8;
	HI_U32 u32ErrIdatNums	:   8;
	HI_U32 u32Reserved	:   16;
    } stBits;
    HI_U32 u32All;
} PNG_ERR_STATICS_U;

typedef union tag_PNG_MMU_BYPASS_U
{
    struct
    {
	HI_U32 u32StreamMmuBypass    :	  1;
	HI_U32 u32RdcRdMmuBypass    :	 1;
	HI_U32 u32FilterRdMmuBypass    :    1;
	HI_U32 u32RdcWtMmuBypass    :	 1;
	HI_U32 u32FilterWtMmuBypass    :    1;
	HI_U32 u32OutMmuBypass	      :	   1;
	HI_U32 u32Reserved	      :	   26;
    } stBits;
    HI_U32 u32All;
} PNG_MMU_BYPASS_U;

/*Define PNG register structure*/
/*CNcomment:png�Ĵ����ṹ�� */
typedef struct tag_PNG_HAL_REGISTER_S
{
    volatile HI_U32 u32DecStart;
    volatile HI_U32 u32ResumeStart;
    volatile HI_U32 u32Stride;	/*4 byte aligned*//*CNcomment:4�ֽڶ���*/
    volatile PNG_SIZE_U uSize;
    volatile PNG_TYPE_U uType;
    volatile PNG_TRANSFORM_U uTransform;
    volatile HI_U32 u32Reserved1;
    volatile HI_U32 u32Reserved2;
    volatile HI_U32 u32BitBufStAddr;
    volatile HI_U32 u32BitBufEndAddr;
    volatile HI_U32 u32BitStreamStAddr;
    volatile HI_U32 u32BitStreamEndAddr;
    volatile HI_U32 u32Pass0StAddr;
    volatile HI_U32 u32Pass1StAddr;
    volatile HI_U32 u32Pass2StAddr;
    volatile HI_U32 u32Pass3StAddr;
    volatile HI_U32 u32Pass4StAddr;
    volatile HI_U32 u32Pass5StAddr;
    volatile HI_U32 u32Pass6StAddr;
    volatile HI_U32 u32FinalStAddr;
    volatile HI_U32 u32FinalEndAddr;
    volatile HI_U32 u32Reserved3;
    volatile HI_U32 u32Reserved4;
    volatile HI_U32 u32Pass0Stride;
    volatile HI_U32 u32Pass1Stride;
    volatile HI_U32 u32Pass2Stride;
    volatile HI_U32 u32Pass3Stride;
    volatile HI_U32 u32Pass4Stride;
    volatile HI_U32 u32Pass5Stride;
    volatile HI_U32 u32Pass6Stride;
    volatile PNG_TRANS_COLOR0_U uTransColor0;
    volatile PNG_TRANS_COLOR0_U uTransColor1;
    volatile HI_U32 u32RdcStAddr;
    volatile HI_U32 u32Reserved5;
    volatile HI_U32 u32FltStAddr;
    volatile HI_U32 u32FltEndAddr;

    /*Suggest value is 0x20441*/
    /*CNcomment:0x90 �������ó�0x20441*/
    volatile HI_U32 u32AXIConfig;

    /*Suggest value is 0x80008*/
    /*CNcomment:0x94 �������ó�0x80008*/
    volatile HI_U32 u32TimeOut;

    volatile PNG_MMU_BYPASS_U uMmuBypass;    /* 0x98 */
    volatile HI_U32 u32Reserved7;	/* 0x9c*/
    volatile HI_U32 u32Reserved8;   /* 0xa0 */
    volatile HI_U32 u32Reserved9;   /* 0xa4 */
    volatile HI_U32 u32Reserved10;   /* 0xa8 */
    volatile HI_U32 u32Reserved11;   /* 0xac*/
    volatile HI_U32 u32Reserved12;   /* 0xb0 */
    volatile HI_U32 u32Reserved13;   /* 0xb4 */
    volatile HI_U32 u32Reserved14;   /* 0xb8 */
    volatile HI_U32 u32Reserved15;   /* 0xbc*/
    volatile HI_U32 u32Reserved16;   /* 0xc0 */
    volatile HI_U32 u32Reserved17;   /* 0xc4 */
    volatile HI_U32 u32Reserved18;   /* 0xc8 */
    volatile HI_U32 u32Reserved19;   /* 0xcc*/
    volatile HI_U32 u32Reserved20;   /* 0xd0 */
    volatile HI_U32 u32Reserved21;   /* 0xd4 */
    volatile HI_U32 u32Reserved22;   /* 0xd8 */
    volatile HI_U32 u32Reserved23;   /* 0xdc*/
    volatile HI_U32 u32Reserved24;   /* 0xe0 */
    volatile HI_U32 u32Reserved25;   /* 0xe4 */
    volatile HI_U32 u32Reserved26;   /* 0xe8 */
    volatile HI_U32 u32Reserved27;   /* 0xec*/
    volatile HI_U32 u32Reserved28;   /* 0xf0 */
    volatile HI_U32 u32Reserved29;   /* 0xf4 */
    volatile HI_U32 u32Reserved30;   /* 0xf8 */
    volatile HI_U32 u32Reserved31;   /* 0xfc*/
    volatile PNG_INT_U uInt;	    /* 0x100 */
    volatile PNG_INT_MASK_U uIntMask;
    volatile PNG_ERR_MODE_U uErrMode;
    volatile PNG_ERR_STATICS_U uErrStatics;
    volatile HI_U32 u32RstBusy;
} PNG_HAL_REGISTER_S;

/********************************************************************************************
* func:	   Initialize Hal layerHal     CNcomment:���ʼ��
* in:	 none
* out:	  none
* ret:	  HI_SUCCESS	Open dev success  CNcomment:�ɹ����豸
* ret	 HI_ERR_PNG_SYS	   System err, such as map register failed
				 CNcomment:ϵͳ����,����Ĵ���ӳ��ʧ��
* others:
*********************************************************************************************/
HI_S32 PngHalInit(HI_VOID);

/********************************************************************************************
* func:	   Delete initialize Hal layer	   CNcomment:Hal��ȥ��ʼ��
* in:	 none
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalDeinit(HI_VOID);

/********************************************************************************************
* func:	   Reset register      CNcomment:�Ĵ�����λ
* in:	 none
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalReset(HI_VOID);

/********************************************************************************************
* func:	   Set base info of image      CNcomment:����ͼƬ������Ϣ
* in:	 stImgInfo Structrue of image info   CNcomment:ͼƬ��Ϣ�ṹ��
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetImgInfo(HI_PNG_INFO_S stImgInfo);

/********************************************************************************************
* func:	   Set data trasnformation     CNcomment:��������ת��
* in:	 stTransform Structure for data trasnformation	 CNcomment:����ת���ṹ��
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetTransform(HI_PNG_TRANSFORM_S stTransform);


/********************************************************************************************
* func:	   Set start physical address of RDC window    CNcomment:�����γ̴�����ʼ������ַ
* in:	 u32Phyaddr Physical address	 CNcomment:������ַ
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetRdcAddr(HI_U32 u32Phyaddr);

/********************************************************************************************
* func: Set start address and size of filter buf     CNcomment:�����˲�buf��ʼ������������ַ
* in:	u32Phyaddr Physical address	CNcomment:������ַ
* in:	u32Size Size of buf	CNcomment:buf��С
* out:	none
* ret:	none
* others:
*********************************************************************************************/
HI_VOID PngHalSetFltAddr(HI_U32 u32Phyaddr, HI_U32 u32Size);

/********************************************************************************************
* func:	   Set target physical address and line length	   CNcomment:����Ŀ��buf
* in:	 u32Phyaddr Physical address	 CNcomment:������ַ
* in:	 u32Stride Line length of buf	 CNcomment:Ŀ��buf�п�
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetTgt(HI_U32 u32Phyaddr, HI_U32 u32Stride);

/********************************************************************************************
* func:	   Set start physical address and size of stream buf   CNcomment:��������buf��ַ
* in:	 u32Phyaddr Start physical address   CNcomment:������ַ
* in:	 u32Size Size of buf	 CNcomment:buf��С
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetStreamBuf(HI_U32 u32Phyaddr, HI_U32 u32Size);

/********************************************************************************************
* func:	   Set start physical address and size of stream data	   CNcomment:����������ַ
* in:	 u32Phyaddr Start physical address of stream	 CNcomment:������ַ
* in:	 u32Size Size of stream	     CNcomment:������С
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetStreamAddr(HI_U32 u32Phyaddr, HI_U32 u32Size);

/********************************************************************************************
* func:	   Start decoding      CNcomment:��������
* in:	 none
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalStartDecode(HI_VOID);

/********************************************************************************************
* func:	   Reusme decoding     CNcomment:�������ָ�����
* in:	 none
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalResumeDecode(HI_VOID);

/********************************************************************************************
* func:	   Get interrupt value	   CNcomment:��ȡ�ж�״̬�����ж�
* in:	 none
* out:	  Interrupt value	  CNcomment:�ж�״ֵ̬
* ret:	  none
* others:
*********************************************************************************************/
HI_U32 PngHalGetIntStatus(HI_VOID);

/********************************************************************************************
* func:	   Set port AXI and timeout	   CNcomment:���ö˿�AXI�ͳ�ʱ
* in:	 none
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetAxiAndTimeout(HI_VOID);

/********************************************************************************************
* func:	   Set interrupt mask value	   CNcomment:�����ж�����
* in:	 u32Value Interrupt mask value	     CNcomment:����ֵ
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetIntmask(HI_U32 u32Value);

/********************************************************************************************
* func:	   Set mode of handling err	   CNcomment:���ô�����ģʽ
* in:	 u32Value Mode of handling err	     CNcomment:������ģʽ
* out:	  none
* ret:	  none
* others:
*********************************************************************************************/
HI_VOID PngHalSetErrmode(HI_U32 u32Value);

HI_VOID PngHalSetClock(HI_BOOL bEnable);

HI_S32 PngHalOpen(HI_VOID);

HI_U32 PngHalGetIrqNum(HI_VOID);

#ifdef __cplusplus
#if __cplusplus
}
#endif	/* __cplusplus */
#endif	/* __cpulsplus */

#endif	/* __PNG_HAL_H__ */
