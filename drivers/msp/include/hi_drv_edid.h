/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DRV_EDID_H__
#define __HI_DRV_EDID_H__

#include "hi_type.h"

typedef struct hiHDMI_DOLBY_CAPS_VER_0_S
{
    HI_U8	u8DMmajorVersion;	/* the major version of display management implemented. only support when u8VSVDBVersion = 0.*/
    HI_U8	u8DMminorVersion;	/* the minor version of display management implemented. only support when u8VSVDBVersion = 0.*/
    HI_U16	u16White_X;		/* white point chromaticity coordinate x   ,bit[11:0]valid.Real value =SUM OF bit[N]*2^-(12-N), only support when u8VSVDBVersion = 0. */
    HI_U16	u16White_Y;		/* white point	chromaticity coordinate y  ,bit[11:0]valid.Real value =SUM OF bit[N]*2^-(12-N), only support when u8VSVDBVersion = 0.*/
}HI_HDMI_DOLBY_CAPS_VER_0_S;

typedef struct hiHDMI_DOLBY_CAPS_VER_1_S
{
    HI_U8	u8DMVersion;		/* 0:based on display management v2.x; 1:based on the video and blending pipeline v3.x; 2-7: reserved. only support when u8VSVDBVersion = 1. */
    HI_BOOL	bColorimetry;		/* this bit is valid only u8VSVDBVersion = 1. 0: Dolby Vision HDMI sink's colorimetry is close to Rec.709, 1: EDR HDMI sink's colorimetry is close to P3, if Byte[9] to Byte[14] are present, ignores this bit. *//**<CNcomment:��Ϊ0��Dolby Vision Sink�豸ɫ��ӽ�Rec.709����Ϊ1��Dolby Vision Sink�豸ɫ��ӽ�P3�������Byte[9]��Byte[14]������������Դ˱�־��*/
}HI_HDMI_DOLBY_CAPS_VER_1_S;

typedef union hiHDMI_DOLBY_CAPS_U
{
    HI_HDMI_DOLBY_CAPS_VER_0_S stDolbyCapsVer0;
    HI_HDMI_DOLBY_CAPS_VER_1_S stDolbyCapsVer1;
}HI_HDMI_DOLBY_CAPS_U;

/* Sink capability of HDR and Dolby */
typedef struct hiHDMI_DOLBY_SINK_CAPS_S
{
    HI_BOOL	bYccQrangeSelectable;	/* SinkҪ��YCC������Χ�Ƿ���/���� ��Χ��ѡ��HI_TRUE��ʾsinkҪ��Χ��ѡ��HI_FALSE��ʾsinkҪ��Ĭ�Ϸ�Χ�� */
    HI_BOOL	bRgbQrangeSelectable;	/* SinkҪ��RGB������Χ�Ƿ���/���� ��Χ��ѡ��HI_TRUE��ʾsinkҪ��Χ��ѡ��HI_FALSE��ʾsinkҪ��Ĭ�Ϸ�Χ�� */
    HI_U8	u8VSVDBVersion;
    HI_BOOL	bYUV420_12Bit;
    HI_BOOL	b2160P60;
    HI_U16	u16Red_X;
    HI_U16	u16Red_Y;
    HI_U16	u16Green_X;
    HI_U16	u16Green_Y;
    HI_U16	u16Blue_X;
    HI_U16	u16Blue_Y;
    HI_U16	u16MinLuminance;
    HI_U16	u16MaxLuminance;
    HI_HDMI_DOLBY_CAPS_U unOtherCaps;
}HI_HDMI_DOLBY_SINK_CAPS_S;

typedef struct hiHDMI_HDR_EOTF_CAPS_S
{
    HI_BOOL bEotfSdr;
    HI_BOOL bEotfHdr;
    HI_BOOL bEotfSmpteSt2084;
    HI_BOOL bEotfFuture;
}HI_HDMI_HDR_EOTF_CAPS_S;

typedef struct hiHDMI_HDR_METADATA_CAPS_S
{
    HI_BOOL	bDescriptorType1;
}HI_HDMI_HDR_METADATA_CAPS_S;

typedef struct hiHDMI_HDR_SINK_CAPS_S
{
    HI_HDMI_HDR_EOTF_CAPS_S	    stEotf;
    HI_HDMI_HDR_METADATA_CAPS_S	    stMetadata;
    HI_U8			    u8MaxLuminance_CV;
    HI_U8			    u8AverageLumin_CV;
    HI_U8			    u8MinLuminance_CV;
}HI_HDMI_HDR_SINK_CAPS_S;

typedef struct
{
    HI_BOOL    bxvYCC601;
    HI_BOOL    bxvYCC709;
    HI_BOOL    bsYCC601;
    HI_BOOL    bAdobleYCC601;
    HI_BOOL    bAdobleRGB;
    HI_BOOL    bBT2020cYCC;
	HI_BOOL	   bBT2020YCC;
	HI_BOOL	   bBT2020RGB;
}HI_HDMI_COLORIMETRY_CAPS_S;
typedef struct hiHDMI_VIDEO_CAPABILITY_S
{
    HI_BOOL			    bDolbySupport;
    HI_BOOL			    bHdrSupport;
    HI_HDMI_DOLBY_SINK_CAPS_S	    stDolbyCaps;
    HI_HDMI_HDR_SINK_CAPS_S	    stHdrCaps;
    HI_HDMI_COLORIMETRY_CAPS_S	    stColorimetry;
}HI_DRV_HDMI_VIDEO_CAPABILITY_S;

/**EDID Display Base Parameters struct*//**CNcomment:EDID ��ʾ���������� */
typedef struct
{
    HI_U8      u8MaxImageWidth;		      /**<The disp image max width  (0~255)cm*//**<CNcomment: ����ʾͼ������ */
    HI_U8      u8MaxImageHeight;	      /**<The disp image max height (0~255)cm*//**<CNcomment: ����ʾͼ������ */
}HI_DRV_HDMI_BASE_DISP_PARA_S;

typedef struct
{
    HI_DRV_HDMI_BASE_DISP_PARA_S  stBasicDispPara;
}HI_DRV_HDMI_SINK_CAPABILITY_S;

#endif
