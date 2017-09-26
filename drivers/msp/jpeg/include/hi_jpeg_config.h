/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	 : hi_jpeg_config.h
Version		   : Initial Draft
Author		  :
Created		   : 2016/02/02
Description	   : this file is through set macro to select different funciton,
		  and select different platform
Function List	  :


History		  :
Date		    Author		  Modification
2016/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_JPEG_CONFIG_H__
#define __HI_JPEG_CONFIG_H__

/*********************************add include here******************************/
#ifdef __KERNEL__
    #include "hi_gfx_comm_k.h"
#else
    #ifdef CONFIG_HI_FPGA_JPEG_VERSION
	#include "hi_gfx_test_comm.h"
    #else
	#include "hi_gfx_comm.h"
    #endif
#endif
/*****************************************************************************/

    /***************************** Macro Definition ******************************/

    /** \addtogroup	 JPEG CFG */
    /** @{ */  /** <!-- ��JPEG CFG�� */


    /****************************************************************************
     **�꿪�ض�����Makefile�ж���
     ****************************************************************************/
    /** this macro is add google function and use in android version,define in Makefile */
    /** CNcomment:��android��google�汾����jpeg-6b�У���Makefile�п��Ƹú꿪�� CNend */
    #if 0
    #define CONFIG_JPEG_ADD_GOOGLEFUNCTION
    #endif

     /****************************************************************************
      ** function marco definition no depend chip platform
      ** CNcomment:��оƬƽ̨�޹صĺ궨��
     ****************************************************************************/
     /** fpga and eda and advca not use this file **/
     /** if need proc message */
     /** CNcomment:�Ƿ���Ҫproc��Ϣ */
     #define CONFIG_JPEG_PROC_ENABLE

    /** if need use soft csc to debug whether the hard csc has problem */
    /** CNcomment:ʹ������ת������λӲ��ת���Ƿ������� */
    //#define CONFIG_JPEG_SOFTCSC_ENABLE

    /** use hard idct method */
    /** CNcomment:ʹ��Ӳ����IDCT�㷨 */
    #define CONFIG_JPEG_USEHWIDCT

    #define CONFIG_JPEG_MPG_DEC_ENABLE

/****************************************************************************
 ** function marco definition depend chip platform
 ** CNcomment:��оƬƽ̨��صĺ궨��
 ****************************************************************************/
    /** if support crop */
    /** CNcomment:�Ƿ�֧�ֲü����� */
    #define CONFIG_JPEG_OUTPUT_CROP
    /** if support suspend */
    /** CNcomment:�Ƿ�֧�ִ�������,�ڽ�������д�����ʱ����ʱ�ӵ��е����⣬�ȹرոù��� */
    //#define CONFIG_JPEG_SUSPEND
    /** get jpeg dec time */
    /** CNcomment:��ȡjpeg�����ʱ�� */
    #define CONFIG_JPEG_GETDECTIME
    /** all jpeg dec output yuv420sp */
    /** CNcomment:ͳһ�������yuv420sp,Ӳ������������֧��yuv400 -> yuv420
		��Ҫ����Ҫ֧�����0x80 */
    #define CONFIG_JPEG_OUTPUT_YUV420SP
    /** dec jpeg file output lu pixel value sum */
    /** CNcomment:ͳ������ֵ */
    #define CONFIG_JPEG_OUTPUT_LUPIXSUM
    /** CNcomment:��������DDR�޷�������4K�ڴ�����⣬����JPGD�߼�
     ** Ҫ�Կ�4K�ڴ���д������������һ�ζ�С����
     ** 0x0 - 0x1000 - 0x2000 - 0x3000 �ڴ���ʼ��ַ+��СҪ�������ڵ����� */

    /** HSCP201405300013 HSCP201405290010 DTS2014061006717**/
    /** CNcomment:hifone֮���޸ĵİ��ղ������������� **/
    #define CONFIG_JPEG_SET_SAMPLEFACTOR

    /** support omx dec		    */
    /** CNcomment:ʵ��OMX�ķ������ */
    #define CONFIG_JPEG_OMX_FUNCTION

    /** HSCP201502100030 **/
    /** CNcomment:��dri�����ϱ�׼Э�������½��뻨�� **/
    #define CONFIG_JPEG_DRI_SUPPORT

    #define CONFIG_JPEG_TEST_SUPPORT

    /** support exif parase */
    /** CNcomment:֧��exif ��Ϣ����*/
    //#define CONFIG_JPEG_EXIF_SUPPORT

    /** CNcomment:֧��exif ��Ϣ����*/
    //#define CONFIG_JPEG_PERFORMANCE_SUPPORT

    /****************************************************************************
     ** ���¸��ݲ�ͬоƬƽ̨����֧�ֵĹ��ܺ꿪�ش�
     ****************************************************************************/

    /**CV200 EC֮���Ѿ��޸ģ�����Ҫ�ٴ� **/
    #ifdef CONFIG_JPEG_OUTPUT_CROP
	#undef CONFIG_JPEG_OUTPUT_CROP
    #endif

     #define CONFIG_JPEG_HARDDEC2ARGB
    /** should read register, but may be **/

    /****************************************************************************
     ** function marco definition use to fpga test and deal with bug by eda
     ** CNcomment:����Ӳ���߼����Լ���λbugʹ�õĺ꿪��
     ****************************************************************************/
    /** output the need output os memory size */
    /** CNcomment:���OS��Ҫ���ڴ��С */
    //#define CONFIG_JPEG_OUTPUT_NEED_OS_MEMSIZE

    /** test press */
    /** CNcomment:���Է�ѹ */
    //#define CONFIG_JPEG_TEST_CHIP_PRESS

    /**
     ** Ĭ��֧�ֿ�4K��FPGA����Ҫ���Ե���֧�ֿ�4K�����(�����쳣)
     ** ����Ŀ�4Kֻ����ȡ��ַ��ʱ����п�4K���������CBB��֧��
     ** ��4K
     **/
    //#define CONFIG_JPEG_4KDDR_DISABLE
    //#define CONFIG_JPEG_4KDDR_DISABLE_SHOWMSG /** ��ʾ��Ϣ **/

    /** save the scen information,use it to eda simulation */
    /** CNcomment:���ֳ�ʹ�ܣ����������õģ��ֳ����߼���EDA���� */
    //#define CONFIG_JPEG_FPGA_TEST_SAVE_SCEN_ENABLE
    /** save the data to bmp picture */
    /** CNcomment:����bmpͼƬ */
    //#define CONFIG_JPEG_TEST_SAVE_BMP_PIC
    /** test hard decode capa */
    /** CNcomment:����Ӳ���������� */
    //#define CONFIG_JPEG_TEST_HARD_DEC_CAPA
    /** test set the different outstanding value */
    /** CNcomment:�������ò�ͬ��outstandingֵ,�Զ��ȽϺ꿪�ش� */
    //#define CONFIG_JPEG_FPGA_TEST_SET_DIFFERENT_OUTSTANDING_VALUE
    //#define CONFIG_JPEG_SAVE_INPUTSTREAM_DATA

    #ifdef CONFIG_HI_FPGA_JPEG_VERSION
	#define CONFIG_JPEG_CSC_DISABLE
    #endif

	    #ifdef __KERNEL__
	    #define JPEG_TRACE		     GFX_Printk
	    #else
	     #define JPEG_TRACE		      GFX_Printf
	    #endif

    /** @} */  /*! <!-- Macro Definition end */

#endif /* __HI_JPEG_CONFIG_H__*/
