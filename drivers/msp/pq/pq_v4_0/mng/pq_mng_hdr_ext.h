/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name    : pq_mng_hdr_ext.h
  Version	: Initial Draft
  Author	: p00203646
  Created      : 2016/06/13
  Description  :

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __PQ_MNG_HDR_EXT_H__
#define __PQ_MNG_HDR_EXT_H__

#include "hi_drv_video.h"

#define PQ_DEGMM_SEG_SIZE		8
#define PQ_TMAP_SEG_SIZE		8
#define PQ_SMAP_SEG_SIZE		8
#define PQ_GMM_SEG_SIZE		    8
#define PQ_DEGMM_LUT_SIZE	   64
#define PQ_TMAP_LUT_SIZE	   64
#define PQ_SMAP_LUT_SIZE	   64
#define PQ_GMM_LUT_SIZE		   64


typedef enum hiPQ_DISP_OUT_TYPE_E
{
    HI_PQ_DISP_TYPE_NORMAL = 0,	   /* ��ͨ�ź���ʾ BT601 BT709*/
    HI_PQ_DISP_TYPE_HDR10,	   /* ��׼HDR�ź���ʾ */

    HI_PQ_DISP_TYPE_BUTT
} HI_PQ_DISP_OUT_TYPE_E;


typedef struct hiPQ_WIN_HDR_INFO_S
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType;
    HI_DRV_VIDEO_STD_E enCodecType;
    union
    {
	HI_DRV_VIDEO_DOLBY_INFO_S	stDolbyInfo;	   /*Dolby frame info.*/
	HI_DRV_VIDEO_HDR10_INFO_S	stHDR10Info;	   /*HDR10 frame info.*/
	HI_DRV_VIDEO_HLG_INFO_S		stHLGInfo;	   /*HLG frame info.*/
	HI_DRV_VIDEO_SLF_INFO_S		stSLFInfo;	   /*SLF frame info.*/
	HI_DRV_VIDEO_TECHNICOLOR_INFO_S stTechnicolorInfo; /*Technicolor frame info.*/
    } unHDRInfo;
    HI_PQ_DISP_OUT_TYPE_E enDispType; /* SDR/HDR10/... */
} HI_PQ_WIN_HDR_INFO;

typedef enum hiPQ_HDR_COLOR_PRIMARIES_E
{
    HI_PQ_HDR_COLOR_PRIMARIES_BT709_L = 0x0,
    HI_PQ_HDR_COLOR_PRIMARIES_BT709_F,
    HI_PQ_HDR_COLOR_PRIMARIES_BT2020_L,
    HI_PQ_HDR_COLOR_PRIMARIES_BT2020_F,
    HI_PQ_HDR_COLOR_PRIMARIES_UNKNOW,

    HI_PQ_HDR_COLOR_PRIMARIES_BUTT
} HI_PQ_HDR_COLOR_PRIMARIES_E;

typedef enum hiPQ_HDR_EOTF_E
{
    HI_PQ_HDR_EOTF_1886 = 0x0,
    HI_PQ_HDR_EOTF_2084 ,
    HI_PQ_HDR_EOTF_HLG ,
    HI_PQ_HDR_EOTF_SLF ,

    HI_PQ_HDR_EOTF_BUTT
} HI_PQ_HDR_EOTF_E;

typedef enum hiPQ_HDR_MATRIX_COEFF_E
{
    HI_PQ_HDR_MATRIX_COEFF_BT709 = 0x0,
    HI_PQ_HDR_MATRIX_COEFF_BT2020_NCL,
    HI_PQ_HDR_MATRIX_COEFF_BT2020_CL,
    HI_PQ_HDR_MATRIX_COEFF_UNKNOW,

    HI_PQ_HDR_MATRIX_COEFF_BT2020_BUTT

} HI_PQ_HDR_MATRIX_COEFF_E;

typedef struct hiPQ_HDR_UNIFIED_METADATA_IN_S
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType;
    HI_DRV_COLOUR_DESCRIPTION_INFO_S stColorDescriptionInfo;
    HI_U8 u8TransferCharacteristics;

    HI_BOOL  bMasteringAvailable;
    HI_BOOL  bContentAvailable;
    HI_DRV_MASTERING_DISPLAY_COLOUR_VOLUME_S stMasteringInfo;
    HI_DRV_CONTENT_LIGHT_LEVEL_INFO_S stContentInfo;
} HI_PQ_HDR_UNIFIED_METADATA_IN_S;

typedef struct hiPQ_HDR_UNIFIED_METADATA_OUT_S
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType;
    HI_PQ_HDR_COLOR_PRIMARIES_E enColorSpace;
    HI_PQ_HDR_EOTF_E enEotfType;
    HI_PQ_HDR_MATRIX_COEFF_E enMatrixType;

    HI_BOOL  bMasteringAvailable;
    HI_BOOL  bContentAvailable;
    HI_DRV_MASTERING_DISPLAY_COLOUR_VOLUME_S stMasteringInfo;
    HI_DRV_CONTENT_LIGHT_LEVEL_INFO_S stContentInfo;
} HI_PQ_HDR_UNIFIED_METADATA_OUT_S;

#define HI_PQ_HDR_TM_LUT_SIZE 512

typedef struct HiPQ_HDR_TM
{
    /*ToneMapping*/
    HI_S16 s16aTMLutI[HI_PQ_HDR_TM_LUT_SIZE];
    HI_S16 s16aTMLutS[HI_PQ_HDR_TM_LUT_SIZE];
    HI_S16 s16aSMLutI[HI_PQ_HDR_TM_LUT_SIZE];
    HI_S16 s16aSMLutS[HI_PQ_HDR_TM_LUT_SIZE];
} HI_PQ_HDR_TM;

typedef struct HiPQ_HDR_CFG
{
    HI_PQ_HDR_TM stPQHdrTm;
} HI_PQ_HDR_CFG;

#endif
