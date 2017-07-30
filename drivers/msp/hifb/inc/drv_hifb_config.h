/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : hifb_config.h
Version		    : Initial Draft
Author		    :
Created		    : 2015/09/09
Description	    : ������Ϣ�ı仯������һ���ļ������֣������ı��ֲ���
Function List	    :
History		    :
Date			   Author		    Modification
2014/09/09		   y00181162		    Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HIFB_CONFIG_H__
#define __HIFB_CONFIG_H__


/*********************************add include here******************************/

#include "hi_type.h"

/*****************************************************************************/


#ifdef __cplusplus
#if __cplusplus
   extern "C"
{
#endif
#endif /* __cplusplus */



/***************************** Macro Definition ******************************/
#define CONFIG_HIFB_LAYER_0BUFFER    0
#define CONFIG_HIFB_LAYER_1BUFFER    1
#define CONFIG_HIFB_LAYER_2BUFFER    2
#define CONFIG_HIFB_LAYER_3BUFFER    3

#define CONFIG_HIFB_STEREO_BUFFER_MAX_NUM	2
#ifdef CFG_HIFB_ANDROID_SUPPORT
    #define CONFIG_HIFB_LAYER_BUFFER_MAX_NUM	3
#else
    #define CONFIG_HIFB_LAYER_BUFFER_MAX_NUM	2
#endif


/**
 ** ÿ���Ĵ�����ƫ�Ƶ�ַ
 **/
#define CONFIG_HIFB_CHN_OFFSET		0x400
#define CONFIG_HIFB_WBC_OFFSET		0x400

#define CONFIG_HIFB_GFX_OFFSET     0x200
#define CONFIG_HIFB_GP_OFFSET      0x800

#define CONFIG_VDP_SIZE		       0xfff0


/**
 ** VDP�Ĵ�������ַ
 **/
/** 0XB208ͼ�κ��������ӼĴ��� **/
#define CONFIG_VDP_REG_BASEADDR			    (0xf8cc0000)
#define CONFIG_HIFB_HD0_REG_BASEADDR		(0xf8cc7000)
/** sd0 -> fb4 **/
#define CONFIG_HIFB_SD_LOGO_REG_BASEADDR		(0xf8cc7800)
#define CONFIG_HIFB_WBC_SLAYER_REG_BASEADDR		(0xf8cc7800)
/** WBC_GP0ͬԴ��д 0xf8cc9400**/
#define CONFIG_HIFB_WBC_GP0_REG_BASEADDR		(0xf8cc9400)

/** logo use hd0 **/
#define CONFIG_HIFB_HD_LOGO_REG_BASEADDR		CONFIG_HIFB_HD0_REG_BASEADDR

#define CONFIG_HIFB_MDDRC_REG_BASEADDR	(0xF8A35000)
#define CONFIG_HIFB_MDDRC_OFFSET	 0x8
#define CONFIG_HIFB_MDDRC_MAX_ZONE	 32


/**
 ** ZME COEF
 ** ����ˮƽ���Ȳ�ѯ
 ** 98MV100/HIFONE-STB: ˮƽ���Ȳ�ѯ�ǰ���20bit
 ** ����: ˮƽ���Ȳ�ѯ�ǰ���12bit
 ** �����ǰ���12bit����ģ���������ٽ���ƫ��
 **/
#define CONFIG_HIFB_PRECISION_ZMERATIONH_12BITOFFSET	  8
/**
 ** ˮƽ����ͬʱ�����к�������
 **/
#define CONFIG_GP0_ZME_HLC_OFFSET_ENABLE
/**
 **
 **/
#define CONFIG_HIFB_ALG_G_HZME_PRECISION	  1048576
#define CONFIG_HIFB_ALG_G_VZME_PRECISION	  4096


/**
 ** GP֧�ֵ�ͼ�β����
 **/
#define CONFIG_HIFB_GP0_SUPPORT_GFX_COUNT	       3 /** (G0 G1 G3) **//** G2��֧�� **/
#define CONFIG_HIFB_GP1_SUPPORT_GFX_COUNT	       1 /** (G4) **/

/** ��ˮƽ��ֱ **/
#define CONFIG_HIFB_ZME_ORDER_HV

/**
 ** �����ʹ�õ�LOGOͼ�㣬����Ҫ��"\"����Ȼ�ᶨ�����
 **/
/**
 ** �Ƿ���Ҫ���д�����ֻ�������йأ��͹���û�й�ϵ���߼����Ŷ�֧��
 ** ���ܲ������ó���
 **/
#define CONFIG_HIFB_EXTRACE_DISABLE

/**
 ** ʹ�ù����Ĵ���ͷ�ļ�
 **/
#define CONFIG_HIFB_USE_COMM_REGH

/**
 **support input color format
 **/
#define CONFIG_HIFB_HD1_LAYER_16BIT_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_24BIT_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_32BIT_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_CLUT1_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_CLUT2_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_CLUT4_FMT	       1
#define CONFIG_HIFB_HD1_LAYER_CLUT8_FMT	       1

/**
 **�ж�ͼ���Ƿ�֧��
 **/
#define CONFIG_HIFB_HD0_LAYER_SUPPORT		   HI_TRUE/** G0 **/
#define CONFIG_HIFB_HD1_LAYER_SUPPORT		   HI_TRUE/** G1 **/
#define CONFIG_HIFB_HD2_LAYER_SUPPORT		   HI_TRUE/** G3 **/
#define CONFIG_HIFB_HD3_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD0_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD1_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD2_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD3_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD0_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD1_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD2_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD3_LAYER_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_CURSOR_LAYER_SUPPORT		   HI_FALSE

/**
 **�ж�ѹ����ѹ�Ƿ�֧��
 **/
#define CONFIG_HIFB_HD0_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_HD1_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_HD2_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_HD3_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD0_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD1_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD2_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_SD3_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD0_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD1_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD2_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_AD3_COMPRESSION_SUPPORT		   HI_FALSE
#define CONFIG_HIFB_CURSOR_COMPRESSION_SUPPORT	   HI_FALSE

#define CONFIG_HIFB_HD_LAYER_MAXWIDTH	  1920
#define CONFIG_HIFB_HD_LAYER_MAXHEIGHT	  1920/** support vr fmt defined by customer self **/
#define CONFIG_HIFB_SD_LAYER_MAXWIDTH	  720
#define CONFIG_HIFB_SD_LAYER_MAXHEIGHT	  576
#define CONFIG_HIFB_AD_LAYER_MAXWIDTH	  1920
#define CONFIG_HIFB_AD_LAYER_MAXHEIGHT	  1920/** support vr fmt defined by customer self **/
#define CONFIG_HIFB_CURSOR_LAYER_MAXWIDTH	  1920
#define CONFIG_HIFB_CURSOR_LAYER_MAXHEIGHT	  1080

/** ѹ���������Ѿ�ɾ�� **/
#ifdef CFG_HIFB_COMPRESSION_SUPPORT
	#undef CFG_HIFB_COMPRESSION_SUPPORT
#endif
#define GFX_CONFIG_GP0_MZE_VSP_2TAB_EN

#define CONFIG_HIFB_STRIDE_16ALIGN	    16


#define CONFIG_HIFB_MMU_SUPPORT
#define CONFIG_HIFB_GP0_GALPHA_SUM_SUPPORT


#define CONFIG_HIFB_GP0CSC_USE_HDRMOD	/** GP0 CSC��HDR�� **/
#define CONFIG_HIFB_BI2020_SUPPORT

#define	 CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE

//#define CONFIG_HIFB_TRANSIT_LOGO_BY_MASK

/*************************** Structure Definition ****************************/

/********************** Global Variable declaration **************************/



/******************************* API declaration *****************************/

#ifdef __cplusplus

#if __cplusplus

}
#endif
#endif /* __cplusplus */

#endif /* __HIFB_CONFIG_H__ */
