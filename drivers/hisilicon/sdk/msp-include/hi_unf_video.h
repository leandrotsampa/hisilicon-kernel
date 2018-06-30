/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_video.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2009/12/17
  Description	:
  History	:
  1.Date	: 2009/12/17
    Author	: w58735
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_VIDEO_H__
#define __HI_UNF_VIDEO_H__


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#include "hi_common.h"

/*************************** Structure Definition ****************************/
/** \addtogroup	     VIDEO */
/** @{ */  /** <!-- [VIDEO] */

/**Defines the oversample mode.*/
/**CNcomment: ���������ģʽ*/
typedef enum hiUNF_OVERSAMPLE_MODE_E
{
    HI_UNF_OVERSAMPLE_1X = 0,
    HI_UNF_OVERSAMPLE_2X,
    HI_UNF_OVERSAMPLE_4X,
    HI_UNF_OVERSAMPLE_BUTT,
} HI_UNF_OVERSAMPLE_MODE_E;

/**Defines the pixel width.*/
/**CNcomment: ��������λ��*/
typedef enum hiUNF_PIXEL_BITWIDTH_E
{
    HI_UNF_PIXEL_BITWIDTH_8BIT = 0,
    HI_UNF_PIXEL_BITWIDTH_10BIT,
    HI_UNF_PIXEL_BITWIDTH_12BIT,
    HI_UNF_PIXEL_BITWIDTH_BUTT,
} HI_UNF_PIXEL_BITWIDTH_E;

/**Defines color space enum*/
/**CNcomment: ������ɫ�ռ�ö��*/
typedef enum hiUNF_COLOR_SPACE_E
{
    HI_UNF_COLOR_SPACE_UNKNOWN = 0,

    HI_UNF_COLOR_SPACE_BT601_YUV_LIMITED = 0x10,/* ::::Current Used:::: BT.601	*/
    HI_UNF_COLOR_SPACE_BT601_YUV_FULL,
    HI_UNF_COLOR_SPACE_BT601_RGB_LIMITED,
    HI_UNF_COLOR_SPACE_BT601_RGB_FULL,

    HI_UNF_COLOR_SPACE_NTSC1953 = 0x20,

    /* These should be useful.	Assume 601 extents. */
    HI_UNF_COLOR_SPACE_BT470_SYSTEM_M = 0x30,
    HI_UNF_COLOR_SPACE_BT470_SYSTEM_BG,

    HI_UNF_COLOR_SPACE_BT709_YUV_LIMITED = 0x40,/* ::::Current Used:::: BT.709 */
    HI_UNF_COLOR_SPACE_BT709_YUV_FULL,
    HI_UNF_COLOR_SPACE_BT709_RGB_LIMITED,
    HI_UNF_COLOR_SPACE_BT709_RGB_FULL,	 /* ::::Current Used:::: */

    HI_UNF_COLOR_SPACE_REC709 = 0x50,	   /* HD and modern captures. */

    HI_UNF_COLOR_SPACE_SMPT170M= 0x60, /* ITU-R 601 -- broadcast NTSC/PAL */
    HI_UNF_COLOR_SPACE_SMPT240M, /* 1125-Line (US) HDTV */

    HI_UNF_COLOR_SPACE_BT878 = 0x70,	/* broken BT878 extents
			   (601, luma range 16-253 instead of 16-235) */

    HI_UNF_COLOR_SPACE_XVYCC = 0x80,

    /* I know there will be cameras that send this.  So, this is
     * unspecified chromaticities and full 0-255 on each of the
     * Y'CbCr components
     */
    HI_UNF_COLOR_SPACE_JPEG = 0x90,
    HI_UNF_COLOR_SPACE_RGB = 0xa0,

    HI_UNF_COLOR_SPACE_BUTT
} HI_UNF_COLOR_SPACE_E;

/**Defines the RGB range.*/
/**CNcomment: ����RGB ��Χ*/
typedef enum hiUNF_RGB_RANGE_E
{
    HI_UNF_RGB_DEFAULT,
    HI_UNF_RGB_LIMIT_RANGE,
    HI_UNF_RGB_FULL_RANGE,
    HI_UNF_RGB_RANGE_BUTT
} HI_UNF_RGB_RANGE_E;
/**Defines the video norm.*/
/**CNcomment: ������Ƶ��ʽö��*/
typedef enum hiUNF_ENC_FMT_E
{
    HI_UNF_ENC_FMT_1080P_60 = 0,     /**<1080p 60 Hz*/
    HI_UNF_ENC_FMT_1080P_50,	     /**<1080p 50 Hz*/
    HI_UNF_ENC_FMT_1080P_30,	     /**<1080p 30 Hz*/
    HI_UNF_ENC_FMT_1080P_25,	     /**<1080p 25 Hz*/
    HI_UNF_ENC_FMT_1080P_24,	     /**<1080p 24 Hz*/

    HI_UNF_ENC_FMT_1080i_60,	     /**<1080i 60 Hz*/
    HI_UNF_ENC_FMT_1080i_50,	     /**<1080i 50 Hz*/

    HI_UNF_ENC_FMT_720P_60,	     /**<720p 60 Hz*/
    HI_UNF_ENC_FMT_720P_50,	     /**<720p 50 Hz */

    HI_UNF_ENC_FMT_576P_50,	     /**<576p 50 Hz*/
    HI_UNF_ENC_FMT_480P_60,	     /**<480p 60 Hz*/

    HI_UNF_ENC_FMT_PAL,		     /* B D G H I PAL */
    HI_UNF_ENC_FMT_PAL_N,	     /* (N)PAL	      */
    HI_UNF_ENC_FMT_PAL_Nc,	     /* (Nc)PAL	      */

    HI_UNF_ENC_FMT_NTSC,	     /* (M)NTSC	      */
    HI_UNF_ENC_FMT_NTSC_J,	     /* NTSC-J	      */
    HI_UNF_ENC_FMT_NTSC_PAL_M,	     /* (M)PAL	      */

    HI_UNF_ENC_FMT_SECAM_SIN,	     /**< SECAM_SIN*/
    HI_UNF_ENC_FMT_SECAM_COS,	     /**< SECAM_COS*/

    HI_UNF_ENC_FMT_1080P_24_FRAME_PACKING,
    HI_UNF_ENC_FMT_720P_60_FRAME_PACKING,
    HI_UNF_ENC_FMT_720P_50_FRAME_PACKING,

    HI_UNF_ENC_FMT_861D_640X480_60,
    HI_UNF_ENC_FMT_VESA_800X600_60,
    HI_UNF_ENC_FMT_VESA_1024X768_60,
    HI_UNF_ENC_FMT_VESA_1280X720_60,
    HI_UNF_ENC_FMT_VESA_1280X800_60,
    HI_UNF_ENC_FMT_VESA_1280X1024_60,
    HI_UNF_ENC_FMT_VESA_1360X768_60,
    HI_UNF_ENC_FMT_VESA_1366X768_60,
    HI_UNF_ENC_FMT_VESA_1400X1050_60,
    HI_UNF_ENC_FMT_VESA_1440X900_60,
    HI_UNF_ENC_FMT_VESA_1440X900_60_RB,
    HI_UNF_ENC_FMT_VESA_1600X900_60_RB,
    HI_UNF_ENC_FMT_VESA_1600X1200_60,
    HI_UNF_ENC_FMT_VESA_1680X1050_60,
    HI_UNF_ENC_FMT_VESA_1680X1050_60_RB,
    HI_UNF_ENC_FMT_VESA_1920X1080_60,
    HI_UNF_ENC_FMT_VESA_1920X1200_60,
    HI_UNF_ENC_FMT_VESA_1920X1440_60,
    HI_UNF_ENC_FMT_VESA_2048X1152_60,
    HI_UNF_ENC_FMT_VESA_2560X1440_60_RB,
    HI_UNF_ENC_FMT_VESA_2560X1600_60_RB,

    HI_UNF_ENC_FMT_3840X2160_24 = 0x40,
    HI_UNF_ENC_FMT_3840X2160_25,
    HI_UNF_ENC_FMT_3840X2160_30,
    HI_UNF_ENC_FMT_3840X2160_50,
    HI_UNF_ENC_FMT_3840X2160_60,

    HI_UNF_ENC_FMT_4096X2160_24,
    HI_UNF_ENC_FMT_4096X2160_25,
    HI_UNF_ENC_FMT_4096X2160_30,
    HI_UNF_ENC_FMT_4096X2160_50,
    HI_UNF_ENC_FMT_4096X2160_60,

    HI_UNF_ENC_FMT_3840X2160_23_976,
    HI_UNF_ENC_FMT_3840X2160_29_97,
    HI_UNF_ENC_FMT_720P_59_94,
    HI_UNF_ENC_FMT_1080P_59_94,
    HI_UNF_ENC_FMT_1080P_29_97,
    HI_UNF_ENC_FMT_1080P_23_976,
    HI_UNF_ENC_FMT_1080i_59_94,
    HI_UNF_ENC_FMT_BUTT
}HI_UNF_ENC_FMT_E;

/**Defines the mode of the video decoder.*/
/**CNcomment: ������Ƶ������ģʽö��*/
typedef enum hiUNF_VCODEC_MODE_E
{
    HI_UNF_VCODEC_MODE_NORMAL = 0,   /**<Decode all frames.*/ /**<CNcomment: ������֡*/
    HI_UNF_VCODEC_MODE_IP,	     /**<Decode only I frames and P frames.*/ /**<CNcomment: ֻ��IP֡*/
    HI_UNF_VCODEC_MODE_I,	     /**<Decode only I frames.*/ /**<CNcomment: ֻ��I֡*/
    HI_UNF_VCODEC_MODE_DROP_INVALID_B,	/**<Decode all frames except the first B frame sequence behind I frames */ /**<CNcomment: ������֡�����˽�����I֡�����B֡*/
    HI_UNF_VCODEC_MODE_BUTT
} HI_UNF_VCODEC_MODE_E;

/**Defines special control operation of decoder*/
/**CNcomment: ���������������������ѡ�� */
typedef enum hiHI_UNF_VCODEC_CTRL_OPTION_E
{
    HI_UNF_VCODEC_CTRL_OPTION_NORMAL_DPB = 0x0,
    HI_UNF_VCODEC_CTRL_OPTION_SIMPLE_DPB = 0x1
} HI_UNF_VCODEC_CTRL_OPTION_E;

/**Defines the decoding capability (resolution) of the decoder.*/
/**CNcomment: �����������������(�ֱ���) */
typedef enum hiUNF_VCODEC_CAP_LEVEL_E
{
    HI_UNF_VCODEC_CAP_LEVEL_NULL = 0, /**<Do not decode.*/ /**<CNcomment: ����Ҫ���� */
    HI_UNF_VCODEC_CAP_LEVEL_QCIF = 0, /**<The resolution of the picture to be decoded is less than or equal to 176x144.*/ /**<CNcomment: �����ͼ���С������176*144 */
    HI_UNF_VCODEC_CAP_LEVEL_CIF,      /**<The resolution of the picture to be decoded less than or equal to 352x288.*/ /**<CNcomment: �����ͼ���С������352*288 */
    HI_UNF_VCODEC_CAP_LEVEL_D1,	      /**<The resolution of the picture to be decoded less than or equal to 720x576.*/ /**<CNcomment: �����ͼ���С������720*576 */
    HI_UNF_VCODEC_CAP_LEVEL_720P,     /**<The resolution of the picture to be decoded is less than or equal to 1280x720.*/ /**<CNcomment: �����ͼ���С������1280*720 */
    HI_UNF_VCODEC_CAP_LEVEL_FULLHD,   /**<The resolution of the picture to be decoded is less than or equal to 1920x1080.*/ /**<CNcomment: �����ͼ���С������1920*1080 */

    HI_UNF_VCODEC_CAP_LEVEL_1280x800, /**<The resolution of the picture to be decoded is less than or equal to 1280x800.*/ /**<CNcomment: �����ͼ���С������1280x800*/
    HI_UNF_VCODEC_CAP_LEVEL_800x1280, /**<The resolution of the picture to be decoded is less than or equal to 800x1280.*/ /**<CNcomment: �����ͼ���С������800x1280*/
    HI_UNF_VCODEC_CAP_LEVEL_1488x1280, /**<The resolution of the picture to be decoded is less than or equal to 1488x1280.*/ /**<CNcomment: �����ͼ���С������1488x1280 */
    HI_UNF_VCODEC_CAP_LEVEL_1280x1488, /**<The resolution of the picture to be decoded is less than or equal to 1280x1488.*/ /**<CNcomment: �����ͼ���С������1280x1488 */
    HI_UNF_VCODEC_CAP_LEVEL_2160x1280, /**<The resolution of the picture to be decoded is less than or equal to 2160x1280.*/ /**<CNcomment: �����ͼ���С������2160x1280 */
    HI_UNF_VCODEC_CAP_LEVEL_1280x2160, /**<The resolution of the picture to be decoded is less than or equal to 1280x2160.*/ /**<CNcomment: �����ͼ���С������1280x2160 */
    HI_UNF_VCODEC_CAP_LEVEL_2160x2160, /**<The resolution of the picture to be decoded is less than or equal to 2160x2160.*/ /**<CNcomment: �����ͼ���С������2160x2160 */
    HI_UNF_VCODEC_CAP_LEVEL_4096x2160, /**<The resolution of the picture to be decoded is less than or equal to 4096x2160.*/ /**<CNcomment: �����ͼ���С������4096x2160 */
    HI_UNF_VCODEC_CAP_LEVEL_2160x4096, /**<The resolution of the picture to be decoded is less than or equal to 2160x4096.*/ /**<CNcomment: �����ͼ���С������2160x4096 */
    HI_UNF_VCODEC_CAP_LEVEL_4096x4096, /**<The resolution of the picture to be decoded is less than or equal to 4096x4096.*/ /**<CNcomment: �����ͼ���С������4096x4096 */
    HI_UNF_VCODEC_CAP_LEVEL_8192x4096, /**<The resolution of the picture to be decoded is less than or equal to 8192x4096.*/ /**<CNcomment: �����ͼ���С������8192x4096 */
    HI_UNF_VCODEC_CAP_LEVEL_4096x8192, /**<The resolution of the picture to be decoded is less than or equal to 4096x8192.*/ /**<CNcomment: �����ͼ���С������4096x8192 */
    HI_UNF_VCODEC_CAP_LEVEL_8192x8192, /**<The resolution of the picture to be decoded is less than or equal to 8192x8192.*/ /**<CNcomment: �����ͼ���С������8192x8192 */

    HI_UNF_VCODEC_CAP_LEVEL_BUTT
} HI_UNF_VCODEC_CAP_LEVEL_E;

/**Defines the stream type supported by the decoder.*/
/**CNcomment: ���������֧�ֵ��������� */
typedef enum hiUNF_VCODEC_TYPE_E
{
    HI_UNF_VCODEC_TYPE_MPEG2,
    HI_UNF_VCODEC_TYPE_MPEG4,	    /**<MPEG4 DIVX4 DIVX5 */
    HI_UNF_VCODEC_TYPE_AVS,
    HI_UNF_VCODEC_TYPE_H263,
    HI_UNF_VCODEC_TYPE_H264,
    HI_UNF_VCODEC_TYPE_REAL8,
    HI_UNF_VCODEC_TYPE_REAL9,
    HI_UNF_VCODEC_TYPE_VC1,
    HI_UNF_VCODEC_TYPE_VP6,
    HI_UNF_VCODEC_TYPE_VP6F,
    HI_UNF_VCODEC_TYPE_VP6A,
    HI_UNF_VCODEC_TYPE_MJPEG,
    HI_UNF_VCODEC_TYPE_SORENSON,    /**<SORENSON SPARK */
    HI_UNF_VCODEC_TYPE_DIVX3,
    HI_UNF_VCODEC_TYPE_RAW,
    HI_UNF_VCODEC_TYPE_JPEG,	    /**<Used only for VENC */
    HI_UNF_VCODEC_TYPE_VP8,
    HI_UNF_VCODEC_TYPE_MSMPEG4V1,   /**<MS private MPEG4 */
    HI_UNF_VCODEC_TYPE_MSMPEG4V2,
    HI_UNF_VCODEC_TYPE_MSVIDEO1,    /**<MS video */
    HI_UNF_VCODEC_TYPE_WMV1,
    HI_UNF_VCODEC_TYPE_WMV2,
    HI_UNF_VCODEC_TYPE_RV10,
    HI_UNF_VCODEC_TYPE_RV20,
    HI_UNF_VCODEC_TYPE_SVQ1,	    /**<Apple video */
    HI_UNF_VCODEC_TYPE_SVQ3,	    /**<Apple video */
    HI_UNF_VCODEC_TYPE_H261,
    HI_UNF_VCODEC_TYPE_VP3,
    HI_UNF_VCODEC_TYPE_VP5,
    HI_UNF_VCODEC_TYPE_CINEPAK,
    HI_UNF_VCODEC_TYPE_INDEO2,
    HI_UNF_VCODEC_TYPE_INDEO3,
    HI_UNF_VCODEC_TYPE_INDEO4,
    HI_UNF_VCODEC_TYPE_INDEO5,
    HI_UNF_VCODEC_TYPE_MJPEGB,
    HI_UNF_VCODEC_TYPE_MVC,
    HI_UNF_VCODEC_TYPE_HEVC,
    HI_UNF_VCODEC_TYPE_DV,
    HI_UNF_VCODEC_TYPE_VP9,
    HI_UNF_VCODEC_TYPE_AVS2,
    HI_UNF_VCODEC_TYPE_BUTT
}HI_UNF_VCODEC_TYPE_E;

/**Defines the H264 profile of the video encoder.*/
/**CNcomment: ������Ƶ������ H264Э�鵵��*/
typedef enum hiUNF_H264_PROFILE_E
{
    HI_UNF_H264_PROFILE_BASELINE = 0,	/**<Encode H264 stream by baseline profile.*/ /**<CNcomment: ���û��ߵ��α���H264����*/
    HI_UNF_H264_PROFILE_MAIN,		/**<Encode H264 stream by main profile.*/     /**<CNcomment:������Ҫ���α���H264����*/
    HI_UNF_H264_PROFILE_EXTENDED,	/**<Encode H264 stream by extended profile.*/ /**<CNcomment:������չ���α���H264����*/
    HI_UNF_H264_PROFILE_HIGH,		/**<Encode H264 stream by high profile.*/     /**<CNcomment: ���ø߼����α���H264����*/
    HI_UNF_H264_PROFILE_BUTT
}HI_UNF_H264_PROFILE_E;

typedef enum hiUNF_VIDEO_HDR_TYPE_E
{
    HI_UNF_VIDEO_HDR_TYPE_HDR10 = 0,
    HI_UNF_VIDEO_HDR_TYPE_HLG,
    HI_UNF_VIDEO_HDR_TYPE_BUTT
}HI_UNF_VIDEO_HDR_TYPE_E;

typedef struct hiUNF_VCODEC_VC1_ATTR_S
{
    HI_BOOL  bAdvancedProfile;	 /**<Whether the profile is an advanced profile*/ /**<CNcomment: �Ƿ�Advanced Profile*/
    HI_U32   u32CodecVersion;	 /**<Version number*/ /**<CNcomment: �汾��*/
}HI_UNF_VCODEC_VC1_ATTR_S;

typedef struct hiUNF_VCODEC_VP6_ATTR_S
{
    HI_BOOL  bReversed;	    /**<To reverse a picture, set this parameter to 1. In this cases, set it to 0.*/ /**<CNcomment: ͼ����Ҫ��תʱ��1��������0*/
    HI_U16   u16DispWidth;  /**<Display Width.*/ /**<CNcomment: ͼ�����ʾ����*/
    HI_U16   u16DispHeight; /**<Display Height.*/ /**<CNcomment: ͼ�����ʾ�߶�*/
}HI_UNF_VCODEC_VP6_ATTR_S;

typedef union hiUNF_VCODEC_EXTATTR_U
{
    HI_UNF_VCODEC_VC1_ATTR_S stVC1Attr;
    HI_UNF_VCODEC_VP6_ATTR_S stVP6Attr;
}HI_UNF_VCODEC_EXTATTR_U;

/**Defines the attributes of a video decoder.*/
/**CNcomment: ������Ƶ���������Խṹ*/
typedef struct hiUNF_VCODEC_ATTR_S
{
    HI_UNF_VCODEC_TYPE_E	enType;		 /**<Video encoding type*/ /**<CNcomment: ��Ƶ��������*/
    HI_UNF_VCODEC_EXTATTR_U	unExtAttr;	 /**<Extra attributes related to the video encoding type*/ /**<CNcomment: ��Ƶ����������صĶ�������*/
    HI_UNF_VCODEC_MODE_E	enMode;		 /**<Mode of a video decoder*/ /**<CNcomment: ��Ƶ������ģʽģʽ*/
    HI_U32			u32ErrCover;	 /**<Error concealment threshold of the output frames of a video decoder. The value 0 indicates that no frames are output if an error occurs; the value 100 indicates that all frames are output no matter whether errors occur.*/
						 /**<CNcomment: ��Ƶ�����������֡�����������ޣ�0:���ִ��󼴲������100:���ܴ������ȫ�����*/
    HI_U32			u32Priority;	 /**<Priority of a video decoder. The value range is [1, HI_UNF_VCODEC_MAX_PRIORITY]. The value 0 is a reserved value. If you set the value to 0, no error message is displayed, but the value 1 is used automatically. The smaller the value, the lower the priority.*/
						 /**<CNcomment: ��Ƶ���������ȼ�, ȡֵ��Χ: ���ڵ���1��С�ڵ���HI_UNF_VCODEC_MAX_PRIORITY, 0�Ǳ���ֵ������Ϊ0���ᱨ�������ǻ��Զ�ȡֵΪ1,��ֵԽС���ȼ�Խ�� */
    HI_BOOL			bOrderOutput;	 /**<Whether the videos are output by the decoding sequence. You are advised to set this parameter to HI_TRUE in VP mode, and HI_FALSE in other modes.*/
						 /**<CNcomment: �Ƿ񰴽����������VPģʽ���Ƽ�����ΪHI_TRUE, һ��ģʽ������ΪHI_FALSE */
    HI_S32			s32CtrlOptions;	 /**<The value is HI_UNF_VCODEC_CTRL_OPTION_E, or the 'or' value of several enum type*/
						 /**<CNcomment: ȡֵΪHI_UNF_VCODEC_CTRL_OPTION_E�����߼���ö�ٵ�'��'  */
    HI_VOID*			pCodecContext;	 /**<Private codec context */
}HI_UNF_VCODEC_ATTR_S;

/**Defines the hdr attributes of a video decoder.*/
/**CNcomment: ������ƵHDR���Խṹ*/
typedef struct hiUNF_VIDEO_MASTERING_DISPLAY_COLOUR_VOLUME_S
{
    HI_U16 u16DisplayPrimaries_x[3];
    HI_U16 u16DisplayPrimaries_y[3];
    HI_U16 u16WhitePoint_x;
    HI_U16 u16WhitePoint_y;
    HI_U32 u32MaxDisplayMasteringLuminance;
    HI_U32 u32MinDisplayMasteringLuminance;
} HI_UNF_VIDEO_MASTERING_DISPLAY_COLOUR_VOLUME_S;

typedef struct hiUNF_VIDEO_CONTENT_LIGHT_LEVEL_S
{
    HI_U32 u32MaxContentLightLevel;
    HI_U32 u32MaxPicAverageLightLevel;
} HI_UNF_VIDEO_CONTENT_LIGHT_LEVEL_S;

typedef struct hiUNF_VIDEO_HDR10__S
{
    HI_U8  u8FullRangeFlag;
    HI_U8  u8ColourPrimaries;
    HI_U8  u8TransferCharacteristics;
    HI_U8  u8MatrixCoeffs;
    HI_U8  u8MasteringAvailable;      /**<Whether the Mastering available,The value 0 indicates available, The value 1 indicates unavailable.*/
				      /**<CNcomment: Mastering�����Ƿ����,0:�����ã�1:����*/
    HI_U8  u8ContentAvailable;	      /**<Whether the Content available,,The value 0 indicates available, The value 1 indicates unavailable.*/
				      /**<CNcomment: Content�����Ƿ����,0:�����ã�1:����*/
    HI_UNF_VIDEO_MASTERING_DISPLAY_COLOUR_VOLUME_S  stMasteringInfo;
    HI_UNF_VIDEO_CONTENT_LIGHT_LEVEL_S		    stContentInfo;
} HI_UNF_VIDEO_HDR10_INFO_S;

typedef struct hiUNF_VIDEO_HLG_INFO_S
{
    HI_U8  u8FullRangeFlag;
    HI_U8  u8ColourPrimaries;
    HI_U8  u8TransferCharacteristics;
    HI_U8  u8MatrixCoeffs;
    HI_U8  u8BackWardsCompatible;
} HI_UNF_VIDEO_HLG_INFO_S;

typedef union hiUNF_VIDEO_HDR_METADATA_U
{
    HI_UNF_VIDEO_HDR10_INFO_S stHdr10Info;
    HI_UNF_VIDEO_HLG_INFO_S   stHlgInfo;
}HI_UNF_VIDEO_HDR_METADATA_U;

typedef struct hiUNF_VIDEO_HDR_INFO_S
{
    HI_UNF_VIDEO_HDR_TYPE_E	     enHdrType;
    HI_UNF_VIDEO_HDR_METADATA_U	     unHdrMetadata;
} HI_UNF_VIDEO_HDR_INFO_S;

/**Defines the sub stream protocol.*/
/**CNcomment: ����������Э���֧ö��*/
typedef enum hiUNF_VIDEO_SUB_STANDARD_E
{
    HI_UNF_VIDEO_SUB_STANDARD_UNKNOWN,	     /**<Unknown*/ /**<CNcomment: δ֪Э���֧*/
    HI_UNF_VIDEO_SUB_STANDARD_MPEG2_MPEG1,   /**<The MPEG2 protocol family is compatible with MPEG1.*/ /**<CNcomment: MPEG2Э������Լ���MPEG1 */
    HI_UNF_VIDEO_SUB_STANDARD_MPEG4_SHV,     /**<The MPEG4 protocol family is compatible with SHV.*/ /**<CNcomment: MPEG4Э������Լ���SHV*/
    HI_UNF_VIDEO_SUB_STANDARD_MPEG4_XVID,    /**<The MPEG4 protocol family includes the sub protocol XVID.*/ /**<CNcomment: MPEG4Э�����XVID��֧*/
    HI_UNF_VIDEO_SUB_STANDARD_MPEG4_DIVX,    /**<The MPEG4 protocol family includes the sub protocol DIVX.*/ /**<CNcomment: MPEG4Э�����DIVX��֧*/

    HI_UNF_VIDEO_SUB_STANDARD_BUTT
}HI_UNF_VIDEO_SUB_STANDARD_E;

/**Defines the frame rate of the video stream.*/
/**CNcomment: ������Ƶ����֡�ʽṹ*/
typedef struct hiUNF_VCODEC_FRMRATE_S
{
    HI_U32 u32fpsInteger;     /**<Integral part of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ���������, fps */
    HI_U32 u32fpsDecimal;     /**<Fractional part (calculated to three decimal places) of the frame rate (in frame/s)*/
			      /**<CNcomment: ������֡�ʵ�С�����֣�����3λ��, fps */
}HI_UNF_VCODEC_FRMRATE_S;

/**Defines the information about video streams.*/
/**CNcomment: ������Ƶ������Ϣ�ṹ*/
typedef struct hiUNF_VCODEC_STREAMINFO_S
{
    HI_UNF_VCODEC_TYPE_E	enVCodecType;	/**<Stream type*/ /**<CNcomment: �������� */
    HI_UNF_VIDEO_SUB_STANDARD_E enSubStandard;	/**<Sub stream protocol*/ /**<CNcomment: ������Э���֧ */
    HI_U32			u32SubVersion;	/**<Version of the sub stream protocol*/ /**<CNcomment: ������Э��汾�� */
    HI_U32			u32Profile;	/**<Stream profile*/ /**<CNcomment: ������profile */
    HI_U32			u32Level;	/**<Stream level*/ /**<CNcomment: ������level */
    HI_UNF_ENC_FMT_E		enDisplayNorm;	/**<Display norm (PAL or NTSC)*/ /**<CNcomment: ��ʾ��׼(P/N) */
    HI_BOOL			bProgressive;	/**<Sampling type (progressive or interlaced)*/ /**<CNcomment: ������ʽ(����/����) */
    HI_U32			u32AspectWidth; /**<Output aspect ratio: width*/ /**<CNcomment: ������߱�֮��ֵ */
    HI_U32			u32AspectHeight;/**<Output aspect ratio: height*/ /**<CNcomment: ������߱�֮��ֵ */

    HI_U32 u32bps;	      /**<Bit rate, in kbit/s*/ /**<CNcomment: ����������, Kbps */
    HI_U32 u32fpsInteger;     /**<Integral part of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ���������, fps */
    HI_U32 u32fpsDecimal;     /**<Fractional part (calculated to three decimal places) of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ�С�����֣�����3λ��, fps */
    HI_U32 u32Width;	      /**<Width of the decoded picture*/ /**<CNcomment: ����ͼ��� */
    HI_U32 u32Height;	      /**<Height of the decoded picture*/ /**<CNcomment: ����ͼ��� */
    HI_U32 u32DisplayWidth;   /**<Width of the displayed picture*/ /**<CNcomment: ��ʾͼ��� */
    HI_U32 u32DisplayHeight;  /**<Height of the displayed picture*/ /**<CNcomment: ��ʾͼ��� */
    HI_U32 u32DisplayCenterX; /**<Horizontal coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/
			      /**<CNcomment: ��ʾͼ�����ĺ����꣬��ԭʼͼ������Ͻ�Ϊ����ԭ�� */
    HI_U32 u32DisplayCenterY; /**<Vertical coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/
			      /**<CNcomment: ��ʾͼ�����������꣬��ԭʼͼ������Ͻ�Ϊ����ԭ�� */
}HI_UNF_VCODEC_STREAMINFO_S;


/**Defines the types of the user data in the video information.*/
/**CNcomment: ������Ƶ��Ϣ�е��û��������� */
typedef enum hiHI_UNF_VIDEO_USERDATA_TYPE_E
{
    HI_UNF_VIDEO_USERDATA_UNKNOWN = 0,	    /**<Unknown type*/ /**<CNcomment: δ֪����*/
    HI_UNF_VIDEO_USERDATA_DVB1_CC = 0x1,    /**<Closed Caption Data*/ /**<CNcomment: ��Ļ����*/
    HI_UNF_VIDEO_USERDATA_DVB1_BAR = 0x2,   /**<Bar Data*/ /**<CNcomment: Bar����*/
    HI_UNF_VIDEO_USERDATA_AFD = 0x10000,    /**<Active Format Description*/ /**<CNcomment: ģʽ��������*/
    HI_UNF_VIDEO_USERDATA_BUTT
}HI_UNF_VIDEO_USERDATA_TYPE_E;

/**Defines the profile of video broadcasting.*/
/**CNcomment: ������Ƶ�㲥��profileö��*/
typedef enum hiUNF_VIDEO_BROADCAST_PROFILE_E
{
    HI_UNF_VIDEO_BROADCAST_DVB,	       /**<Digital video broadcasting (DVB)*/ /**<CNcomment: ������Ƶ�㲥DVB*/
    HI_UNF_VIDEO_BROADCAST_DIRECTV,    /**<American live broadcast operator DirecTV*/ /**<CNcomment: ����ֱ����Ӫ��DirecTV*/
    HI_UNF_VIDEO_BROADCAST_ATSC,       /**<Advanced Television Systems Committee (ATSC)*/ /**<CNcomment: �Ƚ�������ʽίԱ��ATSC��Advanced Television Systems Committee��*/
    HI_UNF_VIDEO_BROADCAST_DVD,	       /**<Digital video disc (DVD)*/ /**<CNcomment: ������Ƶ����*/
    HI_UNF_VIDEO_BROADCAST_ARIB,       /**<Association of Radio Industries and Businesses (ARIB)*/ /**<CNcomment: ���ߵ繤ҵ����ҵЭ����*/
    HI_UNF_VIDEO_BROADCAST_BUTT
}HI_UNF_VIDEO_BROADCAST_PROFILE_E;

/**Defines the position of the user data in the video information.*/
/**CNcomment: ������Ƶ��Ϣ���û����ݵ�λ��ö��*/
typedef enum hiUNF_VIDEO_USER_DATA_POSITION_E
{
    HI_UNF_VIDEO_USER_DATA_POSITION_UNKNOWN,	   /**<Unknown*/ /**<CNcomment: δ֪λ��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_SEQ,	   /**<The data is parsed from sequences under the MPEG2 protocol.*/ /**<CNcomment: MPEG2Э���£��������н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_GOP,	   /**<The data is parsed from the group of pictures (GOP) under the MPEG2 protocol.*/ /**<CNcomment: MPEG2Э���£���GOP��Group Of Pictures���н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_FRAME,   /**<The data is parsed from picture frames under the MPEG2 protocol.*/ /**<CNcomment: MPEG2Э���£���ͼ��֡�н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VSOS,	   /**<The data is parsed from the sequences of visible objects under the MPEG4 protocol.*/ /**<CNcomment: MPEG4Э���£��ӿ��Ӷ��������н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VSO,	   /**<The data is parsed from visible objects under the MPEG4 protocol.*/ /**<CNcomment: MPEG4Э���£��ӿ��Ӷ����н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VOL,	   /**<The data is parsed from the video object layer under the MPEG4 protocol.*/ /**<CNcomment: MPEG4Э���£�����Ƶ������н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_GOP,	   /**<The data is parsed from the GOP under the MPEG4 protocol.*/ /**<CNcomment: MPEG4Э���£���GOP�н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_H264_REG,	   /**<The data is parsed from the user_data_regestered_itu_t_t35() syntax under the H.264 protocol.*/ /**<CNcomment: ��H.264Э���user_data_regestered_itu_t_t35()�﷨�н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_H264_UNREG,	   /**<The data is parsed from the user_data_unregestered() syntax under the H.264 protocol.*/ /**<CNcomment: ��H.264Э���user_data_unregestered()�﷨�н��*/
    HI_UNF_VIDEO_USER_DATA_POSITION_BUTT
}HI_UNF_VIDEO_USER_DATA_POSITION_E;

/**Defines the structure of the user data in the video information.*/
/**CNcomment: ������Ƶ��Ϣ�е��û����ݽṹ*/
typedef struct hiUNF_VIDEO_USERDATA_S
{
    HI_UNF_VIDEO_BROADCAST_PROFILE_E   enBroadcastProfile;   /**<Broadcasting profile of the user data*/ /**<CNcomment: �û����ݵĹ㲥profile*/
    HI_UNF_VIDEO_USER_DATA_POSITION_E  enPositionInStream;   /**<Position of the user data in video streams*/ /**<CNcomment: �û���������Ƶ���е�λ��*/
    HI_U32			       u32Pts;		     /**<PTS corresponding to the user data*/ /**<CNcomment: �û����ݶ�Ӧ��ʱ���*/
    HI_U32			       u32SeqCnt;	     /**<Sequence ID of the user data*/ /**<CNcomment: �û����ݵ�ǰһ������*/
    HI_U32			       u32SeqFrameCnt;	     /**<Frame number of the user data*/ /**<CNcomment: �û����ݵ�ǰһ֡��*/
    HI_U8			       *pu8Buffer;	     /**<Initial address of the user data memory, output parameter*/ /**<CNcomment: �û������ڴ����ĳ�ʼ��ַ,�������*/
    HI_U32			       u32Length;	     /**<User data size (a multiple of 1 byte)*/ /**<CNcomment: �û����ݵĴ�С����1byteΪ��λ*/
    HI_BOOL			       bBufferOverflow;	     /**<Indicate that whether the user data size exceeds the maximum size defined by MAX_USER_DATA_LEN.*/ /**<CNcomment: ��־�û����ݵĳ����Ƿ񳬹���MAX_USER_DATA_LEN��������ֵ*/
    HI_BOOL			       bTopFieldFirst;	     /**<Top field first flag*/ /**<CNcomment: �������ȱ�־*/
}HI_UNF_VIDEO_USERDATA_S;

/**Defines the parameters of format changing */
/**CNcomment: ������ʽ�л�ʱ����ز���*/
typedef struct hiUNF_NORMCHANGE_PARAM_S
{
    HI_UNF_ENC_FMT_E		enNewFormat;		/**<New format*/ /**<CNcomment: �µ���ʽ*/
    HI_U32			u32ImageWidth;		/**<Width of image*/ /**<CNcomment: ͼ�����*/
    HI_U32			u32ImageHeight;		/**<Height of image*/ /**<CNcomment: ͼ��߶�*/
    HI_BOOL			bProgressive;		/**<Sampling type (progressive or interlaced)*/ /**<CNcomment: ������ʽ(����/����) */
    HI_U32			u32FrameRate;		/**<Frame rate*//**<CNcomment:֡��*/
}HI_UNF_NORMCHANGE_PARAM_S;

/**Defines the video format.*/
/**CNcomment: ������Ƶ��ʽö��*/
typedef enum hiUNF_VIDEO_FORMAT_E
{
    /* Semi-Planner */
    HI_UNF_FORMAT_YUV_SEMIPLANAR_422,	    /**<The YUV spatial sampling format is 4:2:2.*/ /**<CNcomment: YUV�ռ������ʽΪ4:2:2*/
    HI_UNF_FORMAT_YUV_SEMIPLANAR_420,	    /**<The YUV spatial sampling format is 4:2:0, V first.*/ /**<CNcomment: YUV�ռ������ʽΪ4:2:0��V�ڵ�λ*/
    HI_UNF_FORMAT_YUV_SEMIPLANAR_400,
    HI_UNF_FORMAT_YUV_SEMIPLANAR_411,
    HI_UNF_FORMAT_YUV_SEMIPLANAR_422_1X2,
    HI_UNF_FORMAT_YUV_SEMIPLANAR_444,
    HI_UNF_FORMAT_YUV_SEMIPLANAR_420_UV,   /**<The YUV spatial sampling format is 4:2:0,U first.*/ /**<CNcomment: YUV�ռ������ʽΪ4:2:0, U�ڵ�λ*/


    /* Package */
    HI_UNF_FORMAT_YUV_PACKAGE_UYVY,	    /**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is UYVY.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪUYVY*/
    HI_UNF_FORMAT_YUV_PACKAGE_YUYV,	    /**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is YUYV.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪYUYV*/
    HI_UNF_FORMAT_YUV_PACKAGE_YVYU,	    /**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is YVYU.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪYVYU*/

    /* Planner */
    HI_UNF_FORMAT_YUV_PLANAR_400,
    HI_UNF_FORMAT_YUV_PLANAR_411,
    HI_UNF_FORMAT_YUV_PLANAR_420,
    HI_UNF_FORMAT_YUV_PLANAR_422_1X2,
    HI_UNF_FORMAT_YUV_PLANAR_422_2X1,
    HI_UNF_FORMAT_YUV_PLANAR_444,
    HI_UNF_FORMAT_YUV_PLANAR_410,
    HI_UNF_FORMAT_YUV_TILE_420,		    /**<The YUV spatial sampling format is TILE 4:2:0, V first.*/
    HI_UNF_FORMAT_YUV_TILE_420_UV,	    /**<The YUV spatial sampling format is TILE 4:2:0, U first.*/
    HI_UNF_FORMAT_YUV_BUTT,

    HI_UNF_FORMAT_RGB_SEMIPLANAR_444,
    HI_UNF_FORMAT_RGB_BUTT
}HI_UNF_VIDEO_FORMAT_E;

/**Defines the type of the video frame.*/
/**CNcomment: ������Ƶ֡������ö��*/
typedef enum hiUNF_VIDEO_FRAME_TYPE_E
{
    HI_UNF_FRAME_TYPE_UNKNOWN,	 /**<Unknown*/ /**<CNcomment: δ֪��֡����*/
    HI_UNF_FRAME_TYPE_I,	 /**<I frame*/ /**<CNcomment: I֡*/
    HI_UNF_FRAME_TYPE_P,	 /**<P frame*/ /**<CNcomment: P֡*/
    HI_UNF_FRAME_TYPE_B,	 /**<B frame*/ /**<CNcomment: B֡*/
	HI_UNF_FRAME_TYPE_IDR,	     /**<IDR frame*/ /**<CNcomment: IDR֡*/
    HI_UNF_FRAME_TYPE_BUTT
}HI_UNF_VIDEO_FRAME_TYPE_E;

/**Defines the video frame/field mode.*/
/**CNcomment: ������Ƶ֡��ģʽö��*/
typedef enum hiUNF_VIDEO_FIELD_MODE_E
{
    HI_UNF_VIDEO_FIELD_ALL,	   /**<Frame mode*/ /**<CNcomment: ֡ģʽ*/
    HI_UNF_VIDEO_FIELD_TOP,	   /**<Top field mode*/ /**<CNcomment: ����ģʽ*/
    HI_UNF_VIDEO_FIELD_BOTTOM,	   /**<Bottom field mode*/ /**<CNcomment: �׳�ģʽ*/
    HI_UNF_VIDEO_FIELD_BUTT
}HI_UNF_VIDEO_FIELD_MODE_E;


/**Defines 3D frame packing type*/
typedef enum hiUNF_VIDEO_FRAME_PACKING_TYPE_E
{
    HI_UNF_FRAME_PACKING_TYPE_NONE,		/**< Normal frame, not a 3D frame */
    HI_UNF_FRAME_PACKING_TYPE_SIDE_BY_SIDE,	/**< Side by side */
    HI_UNF_FRAME_PACKING_TYPE_TOP_AND_BOTTOM,	/**< Top and bottom */
    HI_UNF_FRAME_PACKING_TYPE_TIME_INTERLACED,	/**< Time interlaced: one frame for left eye, the next frame for right eye */
    HI_UNF_FRAME_PACKING_TYPE_FRAME_PACKING,	/**< frame packing */
    HI_UNF_FRAME_PACKING_TYPE_3D_TILE,		/**< Tile 3D */
    HI_UNF_FRAME_PACKING_TYPE_BUTT
}HI_UNF_VIDEO_FRAME_PACKING_TYPE_E;

typedef struct hiUNF_VIDEO_FRAME_ADDR_S
{
    HI_U32	       u32YAddr;    /**<Address of the Y component in the current frame*/ /**<CNcomment: ��ǰ֡Y�������ݵĵ�ַ*/
    HI_U32	       u32CAddr;    /**<Address of the C component in the current frame*/ /**<CNcomment: ��ǰ֡C�������ݵĵ�ַ*/
    HI_U32	       u32CrAddr;   /**<Address of the Cr component in the current frame*/ /**<CNcomment: ��ǰ֡Cr�������ݵĵ�ַ*/

    HI_U32	       u32YStride;  /**<Stride of the Y component*/ /**<CNcomment: Y�������ݵĿ��*/
    HI_U32	       u32CStride;  /**<Stride of the C component*/ /**<CNcomment: C�������ݵĿ��*/
    HI_U32	       u32CrStride; /**<Stride of the Cr component*/ /**<CNcomment: Cr�������ݵĿ��*/
}HI_UNF_VIDEO_FRAME_ADDR_S;

typedef struct hiUNF_VIDEO_FRAME_INFO_S
{
    HI_U32				u32FrameIndex;	    /**<Frame index ID of a video sequence*/ /**<CNcomment: ��Ƶ�����е�֡������*/
    HI_UNF_VIDEO_FRAME_ADDR_S		stVideoFrameAddr[2];
    HI_U32				u32Width;	    /**<Width of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32Height;	    /**<Height of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32SrcPts;	    /**<Original PTS of a video frame*/ /**<CNcomment: ��Ƶ֡��ԭʼʱ���*/
    HI_U32				u32Pts;		    /**<PTS of a video frame*/ /**<CNcomment: ��Ƶ֡��ʱ���*/
    HI_U32				u32AspectWidth;
    HI_U32				u32AspectHeight;
    HI_UNF_VCODEC_FRMRATE_S		stFrameRate;

    HI_UNF_VIDEO_FORMAT_E		enVideoFormat;	    /**<Video YUV format*/ /**<CNcomment: ��ƵYUV��ʽ*/
    HI_BOOL				bProgressive;	    /**<Sampling type (progressive or interlaced)*/ /**<CNcomment: ������ʽ(����/����) */
    HI_UNF_VIDEO_FIELD_MODE_E		enFieldMode;	    /**<Frame or field encoding mode*/ /**<CNcomment: ֡�򳡱���ģʽ*/
    HI_BOOL				bTopFieldFirst;	    /**<Top field first flag*/ /**<CNcomment: �������ȱ�־*/
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E	enFramePackingType; /**<3D frame packing type*/
    HI_U32				u32Circumrotate;    /**<Need circumrotate, 1 need */
    HI_BOOL				bVerticalMirror;
    HI_BOOL				bHorizontalMirror;
    HI_U32				u32DisplayWidth;    /**<Width of the displayed picture*/ /**<CNcomment: ��ʾͼ���*/
    HI_U32				u32DisplayHeight;   /**<Height of the displayed picture*/ /**<CNcomment: ��ʾͼ���*/
    HI_U32				u32DisplayCenterX;  /**<Horizontal coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/ /**<CNcomment: ��ʾ����x���꣬ԭʼͼ�����Ͻ�Ϊ����ԭ��*/
    HI_U32				u32DisplayCenterY;  /**<Vertical coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/ /**<CNcomment: ��ʾ����y���꣬ԭʼͼ�����Ͻ�Ϊ����ԭ��*/
    HI_U32				u32ErrorLevel;	    /**<Error percentage of a decoded picture, ranging from 0% to 100%*/ /**<CNcomment: һ������ͼ���еĴ��������ȡֵΪ0��100*/
    HI_U32				u32Private[64];	    /**<Private data for every frame:
								u32Private[0]: securty flag, if u32Private[0] == 1, this is a secure frame;
								*/


}HI_UNF_VIDEO_FRAME_INFO_S;

typedef struct hiUNF_VIDEO_FRM_STATUS_INFO_S
{
    HI_UNF_VIDEO_FRAME_TYPE_E enVidFrmType; /**<Type of video frame*/ /**<CNcomment: ��Ƶ֡����*/
    HI_U32 u32VidFrmStreamSize;		    /**<Size of video frame*/ /**<CNcomment: ��Ƶ֡��С*/
    HI_U32 u32VidFrmQP;			    /**<QP of video frame*/ /**<CNcomment: ��Ƶ֡QP*/
    HI_U32 u32VidFrmPTS;		    /**<PTS of video frame*/ /**<CNcomment: ��Ƶ֡pts*/
    HI_U32 u32MaxMV;			    /**<MAX MV*/ /**<CNcomment: ��Ƶ֡���MV*/
    HI_U32 u32MinMV;			    /**<MIN MV*/ /**<CNcomment: ��Ƶ֡��СMV*/
    HI_U32 u32AvgMV;			    /**<AVG MV*/ /**<CNcomment: ��Ƶ֡MVƽ��ֵ*/
    HI_U32 u32SkipRatio;		    /**<MB ratio */ /**<CNcomment: ��Ƶ֡MB����0~100*/
}HI_UNF_VIDEO_FRM_STATUS_INFO_S;


/** @} */  /** <!-- ==== Structure Definition End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* __HI_UNF_VIDEO_ H*/
