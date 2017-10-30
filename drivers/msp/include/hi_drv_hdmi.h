/******************************************************************************

  Copyright (C), 2016-2016, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: mpi_priv_hdmi.h
  Version	: Initial Draft
  Author	: q46153 l00168554
  Created	: 2010/6/15
  Last Modified :
  Description	: hdmi ioctl and HDMI API common data structs

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __HI_DRV_HDMI_H__
#define	 __HI_DRV_HDMI_H__

//#include "hi_common_id.h"
#include "hi_module.h"
//#include "hi_common_log.h"
#include "hi_debug.h"

#include "hi_unf_hdmi.h"
#include "hi_error_mpi.h"
#include "hi_drv_video.h"
#include "hi_drv_edid.h"

/*
**HDMI Debug
*/
#define HI_FATAL_HDMI(fmt...)	    HI_FATAL_PRINT  (HI_ID_HDMI, fmt)
#define HI_ERR_HDMI(fmt...)	    HI_ERR_PRINT    (HI_ID_HDMI, fmt)
#define HI_WARN_HDMI(fmt...)	    HI_WARN_PRINT   (HI_ID_HDMI, fmt)
#define HI_INFO_HDMI(fmt...)	    HI_INFO_PRINT   (HI_ID_HDMI, fmt)

#define debug_printk(fmt,args...) // printk(fmt,##args)

typedef enum hiDRV_HDMI_ID_E
{
    HI_DRV_HDMI_ID_0	     = 0,	   /**<HDMI interface 0*/ /**<CNcomment:HDMI�ӿ�0 */
    HI_DRV_HDMI_ID_BUTT
} HI_DRV_HDMI_ID_E;

/*hdmi audio interface */
typedef enum  hiHDMI_AUDIOINTERFACE_E
{
    HDMI_AUDIO_INTERFACE_I2S,
    HDMI_AUDIO_INTERFACE_SPDIF,
    HDMI_AUDIO_INTERFACE_HBR,
    HDMI_AUDIO_INTERFACE_BUTT
}HDMI_AUDIOINTERFACE_E;


typedef struct hiHDMI_AUDIO_ATTR_S
{
    HDMI_AUDIOINTERFACE_E   enSoundIntf;	 /**<the origin of Sound,suggestion set HI_UNF_SND_INTERFACE_I2S,the parameter need consistent with Ao input *//**<CNcomment:HDMI��Ƶ��Դ, ����HI_UNF_SND_INTERFACE_I2S,�˲�����Ҫ��AO���뱣��һ�� */
    HI_BOOL		    bIsMultiChannel;	 /**<set mutiChannel or stereo ;0:stereo,1:mutichannel fixup 8 channel *//**<CNcomment:������������������0:��������1:�������̶�Ϊ8���� */
	HI_U32					u32Channels;	     //��channel��multy channel���������������ں�̬�ɵ�multy channel
    HI_UNF_SAMPLE_RATE_E    enSampleRate;	 /**<the samplerate of audio,this parameter consistent with AO config *//**<CNcomment:PCM��Ƶ������,�˲�����Ҫ��AO�����ñ���һ�� */
    HI_U8		    u8DownSampleParm;	 /**<PCM parameter of dowmsample,default 0*//**CNcomment:PCM��Ƶ����downsample�����ʵĲ�����Ĭ��Ϊ0 */

    HI_UNF_BIT_DEPTH_E	    enBitDepth;		 //ĿǰĬ����16bit    /**<the audio bit depth,defualt 16,this parameter consistent with AO config*//**<CNcomment:��Ƶλ����Ĭ��Ϊ16,�˲�����Ҫ��AO�����ñ���һ�� */
    HI_U8		    u8I2SCtlVbit;	 /**<reserve:config 0,I2S control(0x7A:0x1D)*//**CNcomment:������������Ϊ0, I2S control (0x7A:0x1D) */

    HI_UNF_EDID_AUDIO_FORMAT_CODE_E enAudioCode;
}HDMI_AUDIO_ATTR_S;

typedef enum
{
	DRV_HDMI_HV_SYNC_POL_HPVP,
	DRV_HDMI_HV_SYNC_POL_HPVN,
	DRV_HDMI_HV_SYNC_POL_HNVP,
	DRV_HDMI_HV_SYNC_POL_HNVN
} HI_DRV_HDMI_HVSYNC_POLARITY_E;

typedef enum {
	DRV_HDMI_ACTIVE_ASPECT_16_9_TOP = 2,
	DRV_HDMI_ACTIVE_ASPECT_14_9_TOP = 3,
	DRV_HDMI_ACTIVE_ASPECT_16_9_CENTER = 4,
	DRV_HDMI_ACTIVE_ASPECT_PICTURE = 8,
	DRV_HDMI_ACTIVE_ASPECT_4_3 = 9,
	DRV_HDMI_ACTIVE_ASPECT_16_9 = 10,
	DRV_HDMI_ACTIVE_ASPECT_14_9 = 11,
	DRV_HDMI_ACTIVE_ASPECT_4_3_SP_14_9 = 13,
	DRV_HDMI_ACTIVE_ASPECT_16_9_SP_14_9 = 14,
	DRV_HDMI_ACTIVE_ASPECT_16_9_SP_4_3 = 15,
}HI_DRV_HDMI_ACTIVE_ASPECT_E;

/*In order to extern ,so we define struct*/
typedef struct hiHDMI_VIDEO_ATTR_S
{

    HI_DRV_DISP_FMT_E		  enVideoFmt;	       /**<video fromat ,the format must consistent with display  config*//**<CNcomment:��Ƶ��ʽ,�˲�����Ҫ��Display���õ���ʽ����һ�� */
    HI_U32			  u32ClkFs;
    HI_U32			  u32PixelRepeat;
    HI_BOOL			  bVSyncPol;	       /**<Vsync config,default 0*//**CNcomment: �����ֱ���Է������ */
    HI_BOOL			  bHSyncPol;	       /**<Hsync config,default 0*//**CNcomment: ���ˮƽ���Է������ */
    HI_BOOL			  bDEPol;	       /**<DE	 config,default 0*//**CNcomment: ������ݼ��Է������ */
    HI_UNF_EDID_3D_TYPE_E	  enStereoMode;
    HI_UNF_HDMI_DEEP_COLOR_E	  enInBitDepth;
    HI_U32			  u32ColorSpace;
    HI_DRV_BT2020_LUMINACE_SYS_TYPE_E  enBt2020Lum;
    HI_U32			  u32DispRatioWidth;
    HI_U32			  u32DispRatioHeight;
/*
    HI_UNF_HDMI_VIDEO_MODE_E	  enInColorSpace;
    HI_UNF_HDMI_COLORSPACE_E	  enColorimetry;
    HI_UNF_HDMI_RGB_QUAN_RAGE_E	  enRGBQuantization;
    HI_UNF_HDMI_YCC_QUAN_RAGE_E	  enYCCQuantization;

    HI_UNF_HDMI_ASPECT_RATIO_E	  enPictureAspect;
    HI_DRV_HDMI_ACTIVE_ASPECT_E	  enActiveAspect;
    HI_UNF_HDMI_PICTURE_SCALING_E enPictureScaling;
*/

}HDMI_VIDEO_ATTR_S;

typedef struct hiHDMI_AUDIO_CAPABILITY_S
{
    HI_BOOL		bAudioFmtSupported[HI_UNF_EDID_AUDIO_FORMAT_CODE_BUTT]; /**<Audio capability,reference EIA-CEA-861-D,table 37,HI_TRUE:support this Audio type;HI_FALSE,nonsupport this Audio type*//**<CNcomment:��Ƶ������, ��ο�EIA-CEA-861-D ��37;HI_TRUE��ʾ֧��������ʾ��ʽ��HI_FALSE��ʾ��֧�� */
    HI_U32		u32AudioSampleRateSupported[MAX_SAMPE_RATE_NUM]; /**<PCM smprate capability,0: illegal value,other is support PCM smprate *//**<CNcomment:PCM��Ƶ��������������0Ϊ�Ƿ�ֵ������Ϊ֧�ֵ���Ƶ������ */
    HI_U32		u32MaxPcmChannels;	  /**<Audio max PCM Channels number*//**CNcomment:��Ƶ����PCMͨ���� */
}HI_DRV_HDMI_AUDIO_CAPABILITY_S;

typedef enum hiDRV_HDMI_COLORSPACE_E
{
    HI_DRV_HDMI_COLORIMETRY_NO_DATA,		   /**<Colorimetry No Data option*//**<CNcomment:Colorimetry No Data?? */
    HI_DRV_HDMI_COLORIMETRY_ITU601,		   /**<Colorimetry ITU601 option*//**<CNcomment:Colorimetry ITU601?????? */
    HI_DRV_HDMI_COLORIMETRY_ITU709,		   /**<Colorimetry ITU709 option*//**<CNcomment:Colorimetry ITU709?????? */
    HI_DRV_HDMI_COLORIMETRY_EXTENDED,		   /**<Colorimetry extended option*//**<CNcomment:Colorimetry ???? */
    HI_DRV_HDMI_COLORIMETRY_XVYCC_601,		   /**<Colorimetry xvYCC601 extened option*//**<CNcomment:Colorimetry xvYCC601???? */
    HI_DRV_HDMI_COLORIMETRY_XVYCC_709,		   /**<Colorimetry xvYCC709 extened option*//**<CNcomment:Colorimetry xvYCC709???? */
	HI_DRV_HDMI_COLORIMETRY_S_YCC_601,	       /**<Colorimetry S YCC 601 extened option*//**<CNcomment:Colorimetry S YCC 601???? */
	HI_DRV_HDMI_COLORIMETRY_ADOBE_YCC_601,	       /**<Colorimetry ADOBE YCC 601 extened option*//**<CNcomment:Colorimetry ADOBE YCC 601???? */
	HI_DRV_HDMI_COLORIMETRY_ADOBE_RGB,	       /**<Colorimetry ADOBE RGB extened option*//**<CNcomment:Colorimetry ADOBE RGB???? */
	HI_DRV_HDMI_COLORIMETRY_2020_CONST_LUMINOUS,	/**<Colorimetry ITU2020 extened option*//**<CNcomment:Colorimetry ITU2020????:BT2020cYCC */
    HI_DRV_HDMI_COLORIMETRY_2020_NON_CONST_LUMINOUS,/**<Colorimetry ITU2020 extened option*//**<CNcomment:Colorimetry ITU2020????:BT2020RGB?BT2020YCC*/
}HI_DRV_HDMI_COLORSPACE_E;


/* EOTF type */
typedef enum hiDRV_HDMI_EOTF_TYPE_E
{
    HI_DRV_HDMI_EOTF_SDR_LUMIN,		/* Traditional gamma - SDR Luminance Range  */
    HI_DRV_HDMI_EOTF_HDR_LUMIN,		/* Traditional gamma - HDR Luminance Range  */
    HI_DRV_HDMI_EOTF_SMPTE_ST_2048,	/* SMPTE ST 2084  */
    HI_DRV_HDMI_EOTF_FUTURE_USE,	/* Future EOTF	*/
    HI_DRV_HDMI_EOTF_BUTT,
}HI_DRV_HDMI_EOTF_TYPE_E;


/* Metadata Descriptor type(ID) */
typedef enum hiDRV_HDMI_METADATA_ID_E
{
    HI_DRV_HDMI_HDR_METADATA_ID_0,	/* Static Metadata Type 1  */
    HI_DRV_HDMI_HDR_METADATA_ID_BUTT,
}HI_DRV_HDMI_HDR_METADATA_ID_E;

/* Static Metadata Descriptor Type 1  */
typedef struct hiDRV_HDMI_META_DESCIRPER_1ST
{
    HI_U16  u16Primaries0_X;	    /* display_primaries_x[0],range[0,50000],in units of 0.00002 */
    HI_U16  u16Primaries0_Y;	    /* display_primaries_y[0],range[0,50000],in units of 0.00002 */
    HI_U16  u16Primaries1_X;	    /* display_primaries_x[1],range[0,50000],in units of 0.00002 */
    HI_U16  u16Primaries1_Y;	    /* display_primaries_y[1],range[0,50000],in units of 0.00002 */
    HI_U16  u16Primaries2_X;	    /* display_primaries_x[2],range[0,50000],in units of 0.00002 */
    HI_U16  u16Primaries2_Y;	    /* display_primaries_y[2],range[0,50000],in units of 0.00002 */
    HI_U16  u16WhitePoint_X;	    /* white_point_x,range[0,50000],in units of 0.00002 */
    HI_U16  u16WhitePoint_Y;	    /* white_point_y,range[0,50000],in units of 0.00002 */
    HI_U16  u16MaxLuminance;	    /* max_display_mastering_luminance,in units of 1 cd/m^2 */
    HI_U16  u16MinLuminance;	    /* min_display_mastering_luminance,in units of 0.0001 cd/m^2 */
    HI_U16  u16MaxLightLevel;	    /* Maximum Content Light Level,in units of 1 cd/m^2 */
    HI_U16  u16AverageLightLevel;   /* Maximum Frame-average Light Level,in units of 1 cd/m^2 */
}HI_DRV_HDMI_META_DESCIRPER_1ST;

/* Static Metadata Descriptor Type  */
typedef union hiDRV_HDMI_META_DESCIRPER_UN
{
    HI_DRV_HDMI_META_DESCIRPER_1ST    stType1;		    /* Static Metadata Descriptor Type1 */
}HI_DRV_HDMI_META_DESCIRPER_UN;

/* HDR mode */
typedef enum hiDRV_HDMI_HDR_MODE_E
{

    HI_DRV_HDMI_HDR_MODE_DISABLE,	    /* Default.HDR & Dolby mode disable */
    HI_DRV_HDMI_HDR_MODE_DOLBY_NORMAL,	    /* Dolby normal(YCbCr422-12bit) mode enable */
    HI_DRV_HDMI_HDR_MODE_DOLBY_TUNNELING,   /* Dolby tunneling(RGB-8bit) mode enable*/
    HI_DRV_HDMI_HDR_MODE_CEA_861_3,	    /* HDR standar mode enable(according to <CEA-861-3.2015>) */
    HI_DRV_HDMI_HDR_MODE_CEA_861_3_AUTHEN,  /* HDR authen mode */
    HI_DRV_HDMI_HDR_MODE_BUTT,
}HI_DRV_HDMI_HDR_MODE_E;

/* User HDR mode */
typedef enum hiDRV_HDMI_HDR_USERMODE_E
{
    HI_DRV_HDMI_HDR_USERMODE_SDR,
    HI_DRV_HDMI_HDR_USERMODE_HDR10,
    HI_DRV_HDMI_HDR_USERMODE_DOLBY,
    HI_DRV_HDMI_HDR_USERMODE_BUTT,

}HI_DRV_HDMI_HDR_USERMODE_E;

/* HDR attribute */
typedef struct hiDRV_HDMI_HDR_ATTR_S
{
    HI_DRV_HDMI_HDR_MODE_E		enHdrMode;	    /* HDR mode */
    HI_DRV_HDMI_EOTF_TYPE_E		enEotfType;	    /* EOTF type.  When enHdrMode==HI_UNF_HDMI_HDR_MODE_CEA_861_3 valid */
    HI_DRV_HDMI_HDR_METADATA_ID_E	enMetadataId;	    /* Metadata Descriptor type(ID).  When enHdrMode==HI_UNF_HDMI_HDR_MODE_CEA_861_3 valid*/
    HI_DRV_HDMI_META_DESCIRPER_UN	unDescriptor;	    /* Static Metadata Descriptor Type.	 When enHdrMode==HI_UNF_HDMI_HDR_MODE_CEA_861_3 valid */
    HI_DRV_HDMI_COLORSPACE_E		enColorimetry;	    /* Colorimetry.  When enHdrMode==HI_UNF_HDMI_HDR_MODE_CEA_861_3 valid  */
}HI_DRV_HDMI_HDR_ATTR_S;

HI_S32	HI_DRV_HDMI_Init(HI_VOID);
HI_VOID	 HI_DRV_HDMI_Deinit(HI_VOID);
HI_S32 HI_DRV_HDMI_Open(HI_UNF_HDMI_ID_E enHdmi);
HI_S32 HI_DRV_HDMI_Close(HI_UNF_HDMI_ID_E enHdmi);

HI_S32 HI_DRV_HDMI_GetPlayStatus(HI_UNF_HDMI_ID_E enHdmi, HI_U32 *pu32Status);
HI_S32 HI_DRV_HDMI_GetAOAttr(HI_UNF_HDMI_ID_E enHdmi, HDMI_AUDIO_ATTR_S *pstHDMIAOAttr);
HI_S32 HI_DRV_HDMI_SetAOAttr(HI_UNF_HDMI_ID_E enHdmi, HDMI_AUDIO_ATTR_S *pstHDMIAOAttr);
HI_S32 HI_DRV_HDMI_GetSinkCapability(HI_DRV_HDMI_ID_E enHdmi, HI_DRV_HDMI_SINK_CAPABILITY_S *pstSinkCap);
HI_S32 HI_DRV_HDMI_GetAudioCapability(HI_UNF_HDMI_ID_E enHdmi, HI_DRV_HDMI_AUDIO_CAPABILITY_S *pstAudCap);
HI_S32 HI_DRV_HDMI_SetAudioMute(HI_UNF_HDMI_ID_E enHdmi);
HI_S32 HI_DRV_HDMI_SetAudioUnMute(HI_UNF_HDMI_ID_E enHdmi);
HI_S32 HI_DRV_HDMI_Detach(HI_UNF_HDMI_ID_E enHdmi);

HI_S32 HI_DRV_HDMI_SetHdrAttr(HI_UNF_HDMI_ID_E enHdmi, HI_DRV_HDMI_HDR_ATTR_S *pstHdrAttr);
HI_S32 HI_DRV_HDMI_SetHdrMode(HI_UNF_HDMI_ID_E enHdmi, HI_DRV_HDMI_HDR_USERMODE_E enUserHdrMode);
HI_S32 HI_DRV_HDMI_GetVideoCapability(HI_UNF_HDMI_ID_E enHdmi, HI_DRV_HDMI_VIDEO_CAPABILITY_S *pstVideoCap);

HI_S32 HI_DRV_HDMI_PreFormat(HI_UNF_HDMI_ID_E enHdmi);
HI_S32 HI_DRV_HDMI_SetFormat(HI_UNF_HDMI_ID_E enHdmi, HDMI_VIDEO_ATTR_S *pstVideoAttr);
HI_S32 HI_DRV_HDMI_Attach(HI_UNF_HDMI_ID_E enHdmi, HDMI_VIDEO_ATTR_S *pstVideoAttr);

#endif
