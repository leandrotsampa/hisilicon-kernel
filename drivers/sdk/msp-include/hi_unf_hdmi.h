
/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_hdmi.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2009-12-10
  Description	:
  History	:
  1.Date	: 2009-12-10
    Author	: QuYaxin 46153
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_HDMI_H__
#define __HI_UNF_HDMI_H__

/* add include here */
#include "hi_unf_common.h"
#include "hi_unf_sound.h"
#include "hi_unf_edid.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */


/*************************** Structure Definition ****************************/
/** \addtogroup	     HDMI */
/** @{ */  /** <!-- [HDMI] */

/**the max infoframe length*//**CNcomment:�����Ϣ֡���� */
#define HI_UNF_HDMI_MAX_INFOFRAME_LEN	0X20

/**HDMI default value*//**CNcomment:HDMI ȱʡֵ */
#define HI_UNF_HDMI_DEFAULT_SETTING	0x00

/**HDMI interface ID *//**CNcomment:HDMI�ӿ�ID	*/
typedef enum hiUNF_HDMI_ID_E
{
    HI_UNF_HDMI_ID_0	     = 0,	   /**<HDMI interface 0*/ /**<CNcomment:HDMI�ӿ�0 */
    HI_UNF_HDMI_ID_BUTT
} HI_UNF_HDMI_ID_E;

/**HDMI event type*//**CNcomment: HDMI�¼����� */
typedef enum hiUNF_HDMI_EVENT_TYPE_E
{
    HI_UNF_HDMI_EVENT_HOTPLUG = 0x10,	    /**<HDMI HotPlug event type*//**<CNcomment:<HDMI�Ȳ���¼� */
    HI_UNF_HDMI_EVENT_NO_PLUG,		    /**<HDMI unplug event type*//**<CNcomment:HDMI Cableû������ �¼� */
    HI_UNF_HDMI_EVENT_EDID_FAIL,	    /**<HDMI read edid fail event type*//**<CNcomment:HDMI EDID��ȡʧ���¼� */
    HI_UNF_HDMI_EVENT_HDCP_FAIL,	    /**<HDCP authentication fail event type *//**<CNcomment:HDCP��֤ʧ���¼� */
    HI_UNF_HDMI_EVENT_HDCP_SUCCESS,	    /**<HDCP authentication succeed event type*//**<CNcomment:HDCP��֤�ɹ� */
    HI_UNF_HDMI_EVENT_RSEN_CONNECT,	    /**<TMDS link is connected*//**<CNcomment:TMDS���ӳɹ� */
    HI_UNF_HDMI_EVENT_RSEN_DISCONNECT,	    /**<TMDS link is disconnected*//**<CNcomment:TMDSδ���� */
    HI_UNF_HDMI_EVENT_HDCP_USERSETTING,	    /**<HDMI Reset *//**<CNcomment:HDCP ��λ*/
    HI_UNF_HDMI_EVENT_BUTT
}HI_UNF_HDMI_EVENT_TYPE_E;

/*Video color space mode*//**CNcomment:��Ƶ��ɫ�ռ�����*/
typedef enum hiUNF_HDMI_VIDEO_MODE
{
    HI_UNF_HDMI_VIDEO_MODE_RGB444,	    /**<RGB444 output mode*//**<CNcomment:RGB444���ģʽ */
    HI_UNF_HDMI_VIDEO_MODE_YCBCR422,	    /**<YCBCR422 output mode*//**<CNcomment:YCBCR422���ģʽ */
    HI_UNF_HDMI_VIDEO_MODE_YCBCR444,	    /**<YCBCR444 output mode*//**<CNcomment:YCBCR444���ģʽ */
    HI_UNF_HDMI_VIDEO_MODE_YCBCR420,	    /**<YCBCR420 output mode*//**<CNcomment:YCBCR420���ģʽ */
    HI_UNF_HDMI_VIDEO_MODE_BUTT
}HI_UNF_HDMI_VIDEO_MODE_E;

/*HDMI Output Aspect Ratio*//**CNcomment:HDMI������߱�*/
typedef enum hiUNF_HDMI_ASPECT_RATIO_E
{
    HI_UNF_HDMI_ASPECT_RATIO_NO_DATA,	     /**<Aspect Ratio unknown *//**<CNcomment:δ֪���߱� */
    HI_UNF_HDMI_ASPECT_RATIO_4TO3,	     /**<Aspect Ratio 4:3  *//**<CNcomment:���߱�4:3*/
    HI_UNF_HDMI_ASPECT_RATIO_16TO9,	     /**<Aspect Ratio 16:9 *//**<CNcomment:���߱�16:9 */
    HI_UNF_HDMI_ASPECT_RATIO_64TO27,
	HI_UNF_HDMI_ASPECT_RATIO_256TO135,
    HI_UNF_HDMI_ASPECT_RATIO_FUTURE,
    HI_UNF_HDMI_ASPECT_RATIO_BUTT
}HI_UNF_HDMI_ASPECT_RATIO_E;


/**HDMI Deep color mode*//**CNcomment: HDMI ��ɫģʽ */
typedef enum hiUNF_HDMI_DEEP_COLOR_E
{
    HI_UNF_HDMI_DEEP_COLOR_24BIT = 0x00,    /**<HDMI Deep color 24bit mode*//**<CNcomment:HDMI 24bit ��ɫģʽ  */
    HI_UNF_HDMI_DEEP_COLOR_30BIT,	    /**<HDMI Deep color 30bit mode*//**<CNcomment:HDMI 30bit ��ɫģʽ  */
    HI_UNF_HDMI_DEEP_COLOR_36BIT,	    /**<HDMI Deep color 36bit mode*//**<CNcomment:HDMI 36bit ��ɫģʽ  */
    HI_UNF_HDMI_DEEP_COLOR_OFF	 = 0xff,
    HI_UNF_HDMI_DEEP_COLOR_BUTT
}HI_UNF_HDMI_DEEP_COLOR_E;

/**HDMI AVI infoframe BarInfo enum*//**CNcomment: HDMI AVI��Ϣ֡ BarInfo ö�� */
typedef enum hiUNF_HDMI_BARINFO_E
{
   HDMI_BAR_INFO_NOT_VALID,		    /**<Bar Data not valid *//**<CNcomment:��ЧBar����	*/
   HDMI_BAR_INFO_V,			    /**<Vertical bar data valid *//**<CNcomment:��ֱBar������Ч	 */
   HDMI_BAR_INFO_H,			    /**<Horizental bar data valid *//**<CNcomment:ˮƽbar������Ч  */
   HDMI_BAR_INFO_VH			    /**<Horizental and Vertical bar data valid *//**<CNcomment:ˮƽ��ֱBar����ͬʱ��Ч */
}HI_UNF_HDMI_BARINFO_E;

/**HDMI AVI infofram ScanInfo enum*//**CNcomment: HDMI AVI��Ϣ֡ ScanInfo ö�� */
typedef enum hiUNF_HDMI_SCANINFO_E
{
    HDMI_SCAN_INFO_NO_DATA	= 0,	    /**< No Scan information*//**<CNcomment:��ɨ����Ϣ	*/
    HDMI_SCAN_INFO_OVERSCANNED	= 1,	    /**< Scan information, Overscanned (for television) *//**<CNcomment:ɨ����Ϣ:ȫ����ɨ��  */
    HDMI_SCAN_INFO_UNDERSCANNED = 2,	    /**< Scan information, Underscanned (for computer) *//**<CNcomment:ɨ����Ϣ: ��ȫ����ɨ��  */
    HDMI_SCAN_INFO_FUTURE
}HI_UNF_HDMI_SCANINFO_E;

/**HDMI AVI InfoFrame picture scale enum*//**CNcomment: HDMI AVI��Ϣ֡ Picture scale ö�� */
typedef enum hiUNF_HDMI_PICTURE_SCALING_E
{
    HDMI_PICTURE_NON_UNIFORM_SCALING,	    /**< No Known, non-uniform picture scaling	*//**<CNcomment:ͳһͼ������  */
    HDMI_PICTURE_SCALING_H,		    /**< Picture has been scaled horizentally *//**<CNcomment:ͼ��ˮƽ���껯  */
    HDMI_PICTURE_SCALING_V,		    /**< Picture has been scaled Vertically *//**<CNcomment:ͼ��ֱ���껯  */
    HDMI_PICTURE_SCALING_HV		    /**< Picture has been scaled Horizentally and Vertically   *//**<CNcomment:ͼ��ˮƽ��ֱ���껯  */
} HI_UNF_HDMI_PICTURE_SCALING_E;

/**HDMI AVI InfoFrame colorimetry enum*//**CNcomment: HDMI AVI��Ϣ֡ ɫ�ȿռ� ö�� */
typedef enum hiUNF_HDMI_COLORSPACE_E
{
    HDMI_COLORIMETRY_NO_DATA,		    /**<Colorimetry No Data option*//**<CNcomment:Colorimetry No Dataѡ�� */
    HDMI_COLORIMETRY_ITU601,		    /**<Colorimetry ITU601 option*//**<CNcomment:Colorimetry ITU601ɫ�ȿռ�ѡ�� */
    HDMI_COLORIMETRY_ITU709,		    /**<Colorimetry ITU709 option*//**<CNcomment:Colorimetry ITU709ɫ�ȿռ�ѡ�� */
    HDMI_COLORIMETRY_EXTENDED,		    /**<Colorimetry extended option*//**<CNcomment:Colorimetry ��չѡ�� */
    HDMI_COLORIMETRY_XVYCC_601,		    /**<Colorimetry xvYCC601 extened option*//**<CNcomment:Colorimetry xvYCC601��չѡ�� */
    HDMI_COLORIMETRY_XVYCC_709,		    /**<Colorimetry xvYCC709 extened option*//**<CNcomment:Colorimetry xvYCC709��չѡ�� */
	HDMI_COLORIMETRY_S_YCC_601,		/**<Colorimetry S YCC 601 extened option*//**<CNcomment:Colorimetry S YCC 601��չѡ�� */
	HDMI_COLORIMETRY_ADOBE_YCC_601,		/**<Colorimetry ADOBE YCC 601 extened option*//**<CNcomment:Colorimetry ADOBE YCC 601��չѡ�� */
	HDMI_COLORIMETRY_ADOBE_RGB,		/**<Colorimetry ADOBE RGB extened option*//**<CNcomment:Colorimetry ADOBE RGB��չѡ�� */
	HDMI_COLORIMETRY_2020_CONST_LUMINOUS,	 /**<Colorimetry ITU2020 extened option*//**<CNcomment:Colorimetry ITU2020��չѡ��:BT2020cYCC */
    HDMI_COLORIMETRY_2020_NON_CONST_LUMINOUS,/**<Colorimetry ITU2020 extened option*//**<CNcomment:Colorimetry ITU2020��չѡ��:BT2020RGB��BT2020YCC*/
} HI_UNF_HDMI_COLORSPACE_E;

/**HDMI AVI InfoFrame RGB range enum*//**CNcomment: HDMI AVI��Ϣ֡ RGBɫ�ȷ�Χ ö�� */
typedef enum hiUNF_HDMI_RGB_QUAN_RAGE_E
{
    HDMI_RGB_QUANTIZATION_DEFAULT_RANGE,    /**< Defaulr range, it depends on the video format *//**<CNcomment:Ĭ��ɫ�ȷ�Χ����������Ƶ��ʽ */
    HDMI_RGB_QUANTIZATION_LIMITED_RANGE,    /**< Limited quantization range of 220 levels when receiving a CE video format*//**<CNcomment:����ɫ�ȷ�Χ16-234 */
    HDMI_RGB_QUANTIZATION_FULL_RANGE	    /**< Full quantization range of 256 levels when receiving an IT video format*//**<CNcomment:ȫɫ�ȷ�Χ 0-255 */
} HI_UNF_HDMI_RGB_QUAN_RAGE_E;

/**HDMI AVI InfoFrame YCC quantization range enum *//**CNcomment:HDMI AVI��Ϣ֡ YCCɫ�ȷ�Χ ö�� */
typedef enum hiUNF_HDMI_YCC_QUAN_RAGE_E
{
    HDMI_YCC_QUANTIZATION_LIMITED_RANGE,    /**< Limited quantization range of 220 levels when receiving a CE video format*//**<CNcomment:����ɫ�ȷ�Χ16-234 */
    HDMI_YCC_QUANTIZATION_FULL_RANGE	    /**< Full quantization range of 256 levels when receiving an IT video format*//**<CNcomment:ȫɫ�ȷ�Χ 0-255 */
}HI_UNF_HDMI_YCC_QUAN_RAGE_E;

/**HDMI AVI InfoFrame AVI video content type enum*//**CNcomment:HDMI AVI��Ϣ֡ AVI��Ƶ���ݵ����� ö�� */
typedef enum hiUNF_HDMI_CONTENT_TYPE_E
{
    HDMI_CONTNET_GRAPHIC,		    /**< Graphics type*//**<CNcomment:ͼ�� */
    HDMI_CONTNET_PHOTO,			    /**< Photo type*//**<CNcomment:��Ƭ */
    HDMI_CONTNET_CINEMA,		    /**< Cinema type*//**<CNcomment:��ӰԺ */
    HDMI_CONTNET_GAME			    /**< Game type*//**<CNcomment:��Ϸ */
}HI_UNF_HDMI_CONTENT_TYPE_E;

/**HDMI Priority judgments strategy enum*//**CNcomment:HDMI �����жϲ��� ö��*/
typedef enum hiUNF_HDMI_DEFAULT_ACTION_E
{
    HI_UNF_HDMI_DEFAULT_ACTION_NULL,   /**<Default action null*//**<CNcomment:��Ĭ�����Ȳ��� */
    HI_UNF_HDMI_DEFAULT_ACTION_HDMI,   /**<Default action HDMI*//**<CNcomment:�����ж�HDMI */
    HI_UNF_HDMI_DEFAULT_ACTION_DVI,    /**<Default action DVI*//**<CNcomment:�����ж�DVI */
    HI_UNF_HDMI_DEFAULT_ACTION_BUTT
}HI_UNF_HDMI_DEFAULT_ACTION_E;


/**The hotplug callback function interface */
/**CNcomment: �ӿ��Ȳ�λص����� */
typedef void (*HI_UNF_HDMI_CALLBACK)(HI_UNF_HDMI_EVENT_TYPE_E event, HI_VOID *pPrivateData);

/**HDMI Callback Struct*/
/**CNcomment: HDMI�ص��ṹ */
typedef struct hiUNF_HDMI_CALLBACK_FUNC_S
{
    HI_UNF_HDMI_CALLBACK pfnHdmiEventCallback;	/**<callback function pointer*//**<CNcomment:�ص�����ָ��*/
    HI_VOID		*pPrivateData;	       /**<callback funtion param*//**<CNcomment:�ص���������*/
 }HI_UNF_HDMI_CALLBACK_FUNC_S;

/**HDMI Open Param*/
/**CNcomment: HDMI�򿪲��� */
typedef struct hiUNF_HDMI_OPEN_PARA_S
{
    HI_UNF_HDMI_DEFAULT_ACTION_E enDefaultMode;/**<HDMI Priority judgments strategy enum*//**<CNcomment:HDMI �����жϲ��� ö��*/
}HI_UNF_HDMI_OPEN_PARA_S;

/**Current HDCP version enum*/
/**CNcomment:��ǰHDCP�汾 ö��*/
typedef enum hiUNF_HDMI_HDCP_VERSION_E
{
    HI_UNF_HDMI_HDCP_VERSION_NONE,	/**<HDCP version, none HDCP*//**<CNcomment:��HDCP */
    HI_UNF_HDMI_HDCP_VERSION_HDCP14,	/**<HDCP version, HDCP1.4*//**<CNcomment:HDCP1.4 */
    HI_UNF_HDMI_HDCP_VERSION_HDCP22,	/**<HDCP version, HDCP2.2*//**<CNcomment:HDCP2.2 */
    HI_UNF_HDMI_HDCP_VERSION_BUTT
}HI_UNF_HDMI_HDCP_VERSION_E;

/**HDMI status*/
/**CNcomment: HDMI״̬ */
typedef struct hiUNF_HDMI_STATUS_S
{
    HI_BOOL		    bConnected;		    /**<The Device is connected or disconnected *//**<CNcomment:�豸�Ƿ����� */
    HI_BOOL		    bSinkPowerOn;	    /**<The sink is PowerOn or not*//**<CNcomment:Sink�豸�Ƿ��ϵ� */
    HI_BOOL		    bAuthed;		    /**<HDCP Authentication *//**<CNcomment:HDCP �Ƿ�������� */
    HI_U8		    u8Bksv[5];		    /**<Bksv of sink 40bits*//**<CNcomment:���ն˵�Bksv */
    HI_UNF_HDMI_HDCP_VERSION_E enHDCPVersion;	    /**<Current HDCP version*//**<CNcomment:��ǰHDCP�汾 */
}HI_UNF_HDMI_STATUS_S;

/**Current HDCP mode enum*/
/**CNcomment:HDCPģʽ ö��*/
typedef enum hiUNF_HDMI_HDCP_MODE_E
{
    HI_UNF_HDMI_HDCP_MODE_AUTO,			/**<HDCP mode, HDCP auto*//**<CNcomment:HDCP�Զ�ģʽ��HDMI��������Sink�������Զ�ѡ����֤�汾 */
    HI_UNF_HDMI_HDCP_MODE_1_4,			/**<HDCP mode, HDCP1.4*//**<CNcomment:HDCP1.4 */
    HI_UNF_HDMI_HDCP_MODE_2_2,			/**<HDCP mode, HDCP2.2*//**<CNcomment:HDCP2.2 */
    HI_UNF_HDMI_HDCP_BUTT
}HI_UNF_HDMI_HDCP_MODE_E;

/**the config parameter of HDMI interface*/
/**CNcomment:HDMI �ӿڲ������� */
typedef struct hiUNF_HDMI_ATTR_S
{
    HI_BOOL		    bEnableHdmi;	 /**<force to HDMI or DVI,the value must set before HI_UNF_HDMI_Start or behind HI_UNF_HDMI_Stop*//**<CNcomment:�Ƿ�ǿ��HDMI,����ΪDVI.��ֵ������ HI_UNF_HDMI_Start֮ǰ����HI_UNF_HDMI_Stop֮������  */

    HI_BOOL		    bEnableVideo;	 /**<parameter must set HI_TRUE,or the HDMI diver will force to set HI_TRUE*//**<CNcomment:������HI_TRUE, �����HI_FALSE:HDMI������ǿ������ΪHI_TRUE */

    HI_UNF_HDMI_VIDEO_MODE_E enVidOutMode;	 /**<HDMI output vedio mode VIDEO_MODE_YCBCR,VIDEO_MODE_YCBCR444,VIDEO_MODE_YCBCR422,VIDEO_MODE_RGB444 *//**<CNcomment:HDMI�����Ƶģʽ��VIDEO_MODE_YCBCR444��VIDEO_MODE_YCBCR422��VIDEO_MODE_RGB444 */
    HI_UNF_HDMI_DEEP_COLOR_E enDeepColorMode;	 /**<Deep Color output mode,defualt: HI_UNF_HDMI_DEEP_COLOR_24BIT *//**<CNcomment:DeepColor���ģʽ, Ĭ��ΪHI_UNF_HDMI_DEEP_COLOR_24BIT */
    HI_BOOL		    bxvYCCMode;		 /**<the xvYCC output mode,default:HI_FALSE*//**<CNcomment:< xvYCC���ģʽ��Ĭ��ΪHI_FALSE */

    HI_BOOL		    bEnableAudio;	 /**<Enable flag of Audio*//**CNcomment:�Ƿ�Enable��Ƶ */

    HI_BOOL		    bEnableAviInfoFrame; /**<Enable flag of AVI InfoFrame,suggestion:enable *//**<CNcomment:�Ƿ�ʹ�� AVI InfoFrame������ʹ�� */
    HI_BOOL		    bEnableAudInfoFrame; /**<Enable flag of Audio InfoFrame,suggestion:enable*//**<CNcomment:�Ƿ�ʹ�� AUDIO InfoFrame������ʹ�� */
    HI_BOOL		    bEnableSpdInfoFrame; /**<Enable flag of SPD info frame,suggestion:disable*//**<CNcomment:�Ƿ�ʹ�� SPD InfoFrame�� ����ر� */
    HI_BOOL		    bEnableMpegInfoFrame;/**<Enable flag of MPEG info frame,suggestion:disable*//**<CNcomment:�Ƿ�ʹ�� MPEG InfoFrame�� ����ر� */

    HI_BOOL		    bHDCPEnable;	 /**<0:HDCP disable mode,1:eable HDCP mode*//**<CNcomment:< 0:HDCP�����1:HDCPģʽ�� */

    HI_BOOL		    bEnableVidModeAdapt; /**<Enable flag of vedio mode & DVI adapting case of user setting incorrect,default:HI_TRUE.When user have no any adapting strategy,suggestion HI_TRUE*//**<CNcomment:���û����õ������ɫ�ռ���DVI ����ʱ�Ƿ�ʹ�� �Զ�У������ʹ�����û����ô���ʱֱ�ӷ���ʧ�ܣ�Ĭ��ʹ�� �����鵱�û�������Ӧ����ʱ�رգ�����ʹ��*/
    HI_BOOL		    bEnableDeepClrAdapt; /**<Enable flag of deep color mode adapting case of user setting incorrect,default: HI_FALSE.When user have no any adapting strategy,suggestion HI_TRUE*//**<CNcomment:���û����õ����ɫ��(λ��)����ʱ�Ƿ�ʹ�� �Զ�У������ʹ�����û����ô���ʱֱ�ӷ���ʧ�ܣ�Ĭ��ʹ�ܡ����鵱�û�������Ӧ����ʱ�رգ�����ʹ��*/
    HI_BOOL		    bAuthMode;		 /**<Enable flag of authentication, suggestion:disable *//**<CNcomment:�Ƿ�ʹ����֤ģʽ������Ĭ�ϲ����� */
	HI_UNF_HDMI_HDCP_MODE_E enHDCPMode;	     /**<HDCP mode:HI_UNF_HDMI_HDCP_MODE_AUTO, HI_UNF_HDMI_HDCP_MODE_1_4,HI_UNF_HDMI_HDCP_MODE_2_2*//**<CNcomment:< HDCP�ȼ���HI_UNF_HDMI_HDCP_MODE_AUTO(���������Զ�ѡ��)��HI_UNF_HDMI_HDCP_MODE_1_4,HI_UNF_HDMI_HDCP_MODE_2_2 */
}HI_UNF_HDMI_ATTR_S;

/**HDMI infoFrame type definition*/
/**CNcomment: HDMI ��Ϣ֡���Ͷ��� */
typedef enum tagHI_UNF_HDMI_INFOFRAME_TYPE_E
{
    HI_INFOFRAME_TYPE_AVI,	    /**<HDMI AVI InfoFrame type defintion*//**<CNcomment:HDMI AVI InfoFrame ���Ͷ��� */
    HI_INFOFRAME_TYPE_SPD,	    /**<HDMI SPD InfoFrame type defintion*//**<CNcomment:HDMI SPD InfoFrame ���Ͷ��� */
    HI_INFOFRAME_TYPE_AUDIO,	    /**<HDMI AUDIO InfoFrame type defintion*//**<CNcomment:HDMI AUDIO InfoFrame ���Ͷ��� */
    HI_INFOFRAME_TYPE_MPEG,	    /**<HDMI MPEG InfoFrame type defintion*//**<CNcomment:HDMI MPEG InfoFrame ���Ͷ��� */
    HI_INFOFRAME_TYPE_VENDORSPEC,   /**<HDMI Specific InfoFrame type defintion*//**<CNcomment:HDMI Vendor Specific InfoFrame ���Ͷ��� */
    HI_INFOFRAME_TYPE_BUTT
}HI_UNF_HDMI_INFOFRAME_TYPE_E;

/**HDMI AVI InfoFrame parameter struct,please reference EIA-CEA-861-D*/
/**CNcomment: HDMI AVI ��Ϣ֡�����ṹ, ��ο�EIA-CEA-861-D */
typedef struct hiUNF_HDMI_AVI_INFOFRAME_VER2_S
{
    HI_UNF_ENC_FMT_E		   enTimingMode;	    /**<AVI video timing format*//**<CNcomment:AVI��Ƶtiming��ʽ */
    HI_UNF_HDMI_VIDEO_MODE_E	   enOutputType;	    /**<AVI video output color space*//**<CNcomment:AVI��Ƶ�����ɫ��ʽ */
    HI_BOOL			   bActive_Infor_Present;   /**<AVI video Active_Infor_Present flag*//**<CNcomment:AVI��ƵActive_Infor_Present��־λ */
    HI_UNF_HDMI_BARINFO_E	   enBarInfo;		    /**<AVI video BarInfo type*//**<CNcomment:AVI��ƵBarInfo���� */
    HI_UNF_HDMI_SCANINFO_E	   enScanInfo;		    /**<AVI video ScanInfo type*//**<CNcomment:AVI��ƵScanInfo���� */
    HI_UNF_HDMI_COLORSPACE_E	   enColorimetry;	    /**<AVI video Colorimetry type*//**<CNcomment:AVI��ƵColorimetry���� */
    HI_UNF_HDMI_ASPECT_RATIO_E	   enAspectRatio;	    /**<AVI video AspectRatio type*//**<CNcomment:AVI��Ƶ���߱ȸ�ʽ */
    HI_UNF_HDMI_ASPECT_RATIO_E	   enActiveAspectRatio;	    /**<AVI video Active AspectRatio type*//**<CNcomment:AVI��Ƶ��Ч���߱ȸ�ʽ */
    HI_UNF_HDMI_PICTURE_SCALING_E  enPictureScaling;	    /**<AVI video picture scaling type*//**<CNcomment:AVI��Ƶscaling��ʽ */
    HI_UNF_HDMI_RGB_QUAN_RAGE_E	   enRGBQuantization;	    /**<AVI video RGB Quantization*//**<CNcomment:AVI��ƵRGBɫ�ȷ�Χ */
    HI_BOOL			   bIsITContent;	    /**<AVI video ITContent flag*//**<CNcomment:AVI��ƵITcontent */
    HI_U32			   u32PixelRepetition;	    /**<AVI video Pixel Repetition flag*//**<CNcomment:AVI��Ƶ�����ش���־λ */

    HI_UNF_HDMI_CONTENT_TYPE_E	   enContentType;	    /**<AVI video content type*//**<CNcomment:AVI��Ƶ���ݵ����� */
    HI_UNF_HDMI_YCC_QUAN_RAGE_E	   enYCCQuantization;	    /**<AVI video YCC Quantization*//**CNcomment:*< AVI��ƵYCCɫ�ȷ�Χ */

    HI_U32			   u32LineNEndofTopBar;	    /**<AVI video EndofTopBar coordinate,defualt:0 *//**<CNcomment:AVI��ƵEndofTopBar���꣬ȱʡΪ0 */
    HI_U32			   u32LineNStartofBotBar;   /**<AVI video StartofBotBar coordinate,defualt:0*//**<CNcomment:AVI��ƵStartofBotBar���꣬ȱʡΪ0 */
    HI_U32			   u32PixelNEndofLeftBar;   /**<AVI video EndofLeft coordinate,defualt:0*//**<CNcomment:AVI��ƵEndofLeft���꣬ȱʡΪ0 */
    HI_U32			   u32PixelNStartofRightBar;/**<AVI video StartofRightBar coordinate,defualt:0*//**<CNcomment:AVI��ƵStartofRightBar���꣬ȱʡΪ0 */
}HI_UNF_HDMI_AVI_INFOFRAME_VER2_S;

/**HDMI AUDIO InfoFrame parameter struct ,please reference EIA-CEA-861-D*/
/**CNcomment: HDMI ��Ƶ��Ϣ֡�����ṹ, ��ο�EIA-CEA-861-D */
typedef struct hiUNF_HDMI_AUD_INFOFRAME_VER1_S
{
    HI_U32			      u32ChannelCount;		/**<audio frequency channel count*//**<CNcomment:��Ƶ ������ */
    HI_UNF_EDID_AUDIO_FORMAT_CODE_E   enCodingType;		/**<audio frequency coding type,default 0;Refer to Stream Header*//**<CNcomment:��Ƶ �������ͣ�ȱʡΪ0��Refer to Stream Header */
    HI_U32			      u32SampleSize;		/**<audio frequency sample size,default 0,Refer to Stream Header*//**<CNcomment:��Ƶ ������С��ȱʡΪ0��Refer to Stream Header */
    HI_U32			      u32SamplingFrequency;	/**<audio frequency sampling frequency ,default 0,Refer to Stream Header*//**<CNcomment:��Ƶ ����Ƶ�ʣ�ȱʡΪ0��Refer to Stream Header */
    HI_U32			      u32ChannelAlloc;		/**<audio frequency channel allocable ,default 0,Refer to Stream Header*//**<CNcomment:��Ƶ �������䣬ȱʡΪ0��Refer to Stream Header */
    HI_U32			      u32LevelShift;		/**<audio frequency Levelshift ,default 0,Refer to Stream Header*//**<CNcomment:��Ƶ Levelshift��ȱʡΪ0��Refer to Stream Header */
    HI_BOOL			      u32DownmixInhibit;	/**<audio frequency DownmixInhibit ,default 0,Refer to Stream Header*//**<CNcomment:��Ƶ DownmixInhibit��ȱʡΪ0��Refer to Stream Header */
}HI_UNF_HDMI_AUD_INFOFRAME_VER1_S;

/**HDMI SPD InfoFrame parameter struct,please reference EIA-CEA-861-D*/
/**CNcomment: HDMI SPD��Ϣ֡�����ṹ , ��ο�EIA-CEA-861-D */
typedef struct hiUNF_HDMI_SPD_INFOFRAME_S
{
    HI_U8			   u8VendorName[8];	     /**<vendor name*//**<CNcomment:�������� */
    HI_U8			   u8ProductDescription[16]; /**<product Description*//**<CNcomment:��Ʒ������ */
}HI_UNF_HDMI_SPD_INFOFRAME_S;

/**HDMI Source HDMI MPEG InfoFrame parameter struct,please reference EIA-CEA-861-D*/
/**CNcomment: HDMI MPEG��Ϣ֡�����ṹ , ��ο�EIA-CEA-861-D */
typedef struct hiUNF_HDMI_MPEGSOURCE_INFOFRAME_S
{
    HI_U32			   u32MPEGBitRate;	     /**<MPEG bit Rate*//**<CNcomment:MPEGλ�� */
    HI_BOOL			   bIsFieldRepeated;	     /**<FieldRepeater flag*//**<CNcomment:FieldRepeater��־λ */
}HI_UNF_HDMI_MPEGSOURCE_INFOFRAME_S;

/**HDMI Vendor Specific InfoFrame parameter struct,please reference EIA-CEA-861-D*/
/**CNcomment: HDMI VSIF��Ϣ֡ �����ṹ , ��ο�EIA-CEA-861-D */
typedef struct hiUNF_HDMI_VENDORSPEC_INFOFRAME_S
{
    HI_U32			   u32RegistrationId;	    /**<Registration Id*//**<CNcomment:ע��ID�� */
}HI_UNF_HDMI_VENDORSPEC_INFOFRAME_S;

/**HDMI InfoFrame unit struct*/
/**CNcomment: HDMI ��Ϣ֡���϶����� */
typedef union hiUNF_HDMI_INFOFRAME_UNIT_U
{
    HI_UNF_HDMI_AVI_INFOFRAME_VER2_S   stAVIInfoFrame;	    /**<AVI FrameInfo*//**<CNcomment:AVI��Ϣ֡ */
    HI_UNF_HDMI_AUD_INFOFRAME_VER1_S   stAUDInfoFrame;	    /**<Audio FrameInfo*//**<CNcomment:AUD��Ϣ֡ */
    HI_UNF_HDMI_SPD_INFOFRAME_S	       stSPDInfoFrame;	    /**<SPD FrameInfo*//**<CNcomment:SPD��Ϣ֡ */
    HI_UNF_HDMI_MPEGSOURCE_INFOFRAME_S stMPEGSourceInfoFrame;/**<MPEGSource FrameInfo*//**<CNcomment:MPEGSource��Ϣ֡ */
    HI_UNF_HDMI_VENDORSPEC_INFOFRAME_S stVendorSpecInfoFrame;/**<VS FrameInfo*//**<CNcomment:VS��Ϣ֡ */
}HI_UNF_HMDI_INFORFRAME_UNIT_U;

/**HDMI InfoFrame struct */
/**CNcomment: HDMI ��Ϣ֡���ݽṹ */
typedef struct hiUNF_HDMI_INFOFRAME_S
{
    HI_UNF_HDMI_INFOFRAME_TYPE_E    enInfoFrameType;  /**<InfoFrame type*//**CNcomment:<InfoFrame���� */
    HI_UNF_HMDI_INFORFRAME_UNIT_U   unInforUnit;      /**<InfoFrame unit data*//**CNcomment:<InfoFrame���� */
}HI_UNF_HDMI_INFOFRAME_S;


/* CEC */
/** CEC interrelated Opcode:Please refer to CEC 15 Message Descriptions */
/** CNcomment: CEC ��صĲ����� */

/* General Protocol messages */

/**"Feature Abort" Used as a response to indicate that the device does not support the requested message type, or that it cannot execute it at the present time. */
/**CNcomment:"Feature Abort"��Ϣ�����豸��֧�ָ���Ϣ�Ļظ�����ǰû������*/
#define CEC_OPCODE_FEATURE_ABORT		  0X00
/**"Abort" Message This message is reserved for testing purposes.*/
/**CNcomment:"Abort"��Ϣ��רΪ���Ա�����*/
#define CEC_OPCODE_ABORT_MESSAGE		  0XFF

/* One Touch Play Feature*/

/**"Active Source" Used by a new source to indicate that it has started to transmit a stream OR used in response to a "Request Active Source"*/
/**CNcomment:"Active Source"��Ϣ˵��Դ���豸���ڷ���һ���������߻ظ�"Request Active Source"��Ϣ*/
#define CEC_OPCODE_ACTIVE_SOURCE		  0X82
/**"Image View On" Sent by a source device to the TV whenever it enters the active state (alternatively it may send "Text View On").*/
/**CNcomment:��Դ���豸���뼤��״̬ʱ�����TV����һ��"Image View On"��Ϣ*/
#define CEC_OPCODE_IMAGE_VIEW_ON		  0X04
/**"Text View On" As "Image View On", but should also remove any text, menus and PIP windows from the TV's display.*/
/**CNcomment:"Text View On" ��"Image View On"ָ�����ƣ���ͬʱ���TV�����Ϲر����֣��˵��ͻ��л�����*/
#define CEC_OPCODE_TEXT_VIEW_ON			  0X0D

/* Routing Control Feature*/

/**"Inactive Source" Used by the currently active source to inform the TV that it has no video to be presented to the user, or is going into standby as the result of a local user command on the device. */
/**CNcomment: "Inactive Source"��Ϣ������ǰ���������Ż������û��������豸Ҫ�������״̬*/
#define CEC_OPCODE_INACTIVE_SOURCE		  0X9D
/**"Request Active Source" Used by a new device to discover the status of the system.*/
/**CNcomment: "Request Active Source"��Ϣ����֪ͨϵͳ������һ�����豸*/
#define CEC_OPCODE_REQUEST_ACTIVE_SOURCE	  0X85
/**"Routing Change" Sent by a CEC Switch when it is manually switched to inform all other devices on the network that the active route below the switch has changed. */
/**CNcomment: ��CECת������⵽���豸�б������仯ʱ����֪ͨ���л���豸 "Routing Change"��Ϣ*/
#define CEC_OPCODE_ROUTING_CHANGE		  0X80
/**"Routing Information" Sent by a CEC Switch to indicate the active route below the switch.*/
/**CNcomment: CECת��������"Routing Information"��Ϣ������������»���豸*/
#define CEC_OPCODE_ROUTING_INFORMATION		  0X81
/**"Set Stream Path" Used by the TV to request a streaming path from the specified physical address.*/
/**CNcomment: TV��һ���ض����豸�ϻ�ȡ����·�� */
#define CEC_OPCODE_SET_STREAM_PATH		  0X86

/* Standby Feature*/

/**"Standby" Switches one or all devices into standby mode. Can be used as a broadcast message or be addressed to a specific device.See section CEC 13.3 for important notes on the use of this message */
/**CNcomment: "Standby"��Ϣ��ʹһ�������豸�������״̬�����ù㲥���߸��ض����豸��������*/
#define CEC_OPCODE_STANDBY			  0X36

/* One Touch Record Feature*/

/**"Record Off" Requests a device to stop a recording. */
/**CNcomment: "Record Off"��ʹһ���豸ֹͣ¼��*/
#define CEC_OPCODE_RECORD_OFF			  0X0B
/**"Record On" Attempt to record the specified source. */
/**CNcomment: "Record On"��Ϣ���ڳ�����һ���ض���Դ¼��*/
#define CEC_OPCODE_RECORD_ON			  0X09
/**"Record Status" Used by a Recording Device to inform the initiator of the message "Record On" about its status. */
/**CNcomment: ��¼���豸����"Record Status"��Ϣ��״̬������"Record On"��Ϣ�ĵ��豸*/
#define CEC_OPCODE_RECORD_STATUS		  0X0A
/**"Record TV Screen" Request by the Recording Device to record the presently displayed source. */
/**CNcomment: "Record TV Screen"��Ϣ��������¼���豸��¼��ǰ��ʾ����Դ*/
#define CEC_OPCODE_RECORD_TV_SCREEN		  0X0F

/* Timer Programming Feature*/

/**"Clear Analogue Timer" Used to clear an Analogue timer block of a device. */
/**CNcomment: ���ģ�ⶨʱ���豸*/
#define CEC_OPCODE_CLEAR_ANALOGUE_TIMER		  0X33
/**"Clear Digital Timer" Used to clear a Digital timer block of a device. */
/**CNcomment: ������ֶ�ʱ���豸*/
#define CEC_OPCODE_CLEAR_DIGITAL_TIMER		  0X99
/**"Clear External Timer" Used to clear an External timer block of a device. */
/**CNcomment: ����ⲿ��ʱ���豸*/
#define CEC_OPCODE_CLEAR_EXTERNAL_TIMER		  0XA1
/**"Set Analogue Timer" Used to set a single timer block on an Analogue Recording Device. */
/**CNcomment: ��ģ�ⶨʱ���豸�����ö�ʱ��*/
#define CEC_OPCODE_SET_ANALOGUE_TIMER		  0X34
/**"Set Digital Timer" Used to set a single timer block on a Digital Recording Device. */
/**CNcomment: �����ֶ�ʱ���豸�����ö�ʱ��*/
#define CEC_OPCODE_SET_DIGITAL_TIMER		  0X97
/**"Set External Timer" Used to set a single timer block to record from an external device. */
/**CNcomment: ���ⲿ��ʱ���豸�����ö�ʱ��*/
#define CEC_OPCODE_SET_EXTERNAL_TIMER		  0XA2
/**"Set Timer Program Title" Used to set the name of a program associated with a timer block. Sent directly after sending a "Set Analogue Timer" or "Set Digital Timer" message. The name is then associated with that timer block. */
/**CNcomment: ��������"Set Analogue Timer" ��"Set Digital Timer"��Ϣ����һ���������ڳ���Ͷ�ʱ��ģ����� */
#define CEC_OPCODE_SET_TIMER_PROGRAM_TITLE	  0X67
/**"Timer Cleared Status" Used to give the status of a "Clear Analogue Timer", "Clear Digital Timer" or "Clear External Timer" message. */
/**CNcomment: "Timer Cleared Status"��Ϣ���ڷ���"Clear Analogue Timer"��"Clear Digital Timer"��"Clear External Timer"֮���״̬*/
#define CEC_OPCODE_TIMER_CLEARED_STATUS		  0X43
/**"Timer Status" Used to send timer status to the initiator of a "Set Timer" message. */
/**CNcomment: "Timer Status"��Ϣ���ڸ�Set Timer"��Ϣ�ķ����߷��Ͷ�ʱ��״̬*/
#define CEC_OPCODE_TIMER_STATUS			  0X35

/* System Information Feature*/

/**"CEC Version" Used to indicate the supported CEC version, in response to a "Get CEC Version" */
/**CNcomment: "CEC Version"��Ϣ���ڷ����豸�ϵ�CEC�汾��Ϣ���ظ�"Get CEC Version"��Ϣ*/
#define CEC_OPCODE_CEC_VERSION			  0X9E
/**"Get CEC Version" Used by a device to enquire which version of CEC the target supports */
/**CNcomment: "Get CEC Version"����һ���豸��ȡ���豸��CEC�汾��Ϣ*/
#define CEC_OPCODE_GET_CEC_VERSION		  0X9F
/**"Give Physical Address" A request to a device to return its physical address. */
/**CNcomment: ��һ���豸�����ȡ���豸��������ַ*/
#define CEC_OPCODE_GIVE_PHYSICAL_ADDRESS	  0X83
/**"Report Physical Address" Used to inform all other devices of the mapping between physical and logical address of the initiator.*/
/**CNcomment: ��ͬһ���������������豸����������ַ���߼���ַ*/
#define CEC_OPCODE_REPORT_PHYSICAL_ADDRESS	  0X84
/**"Get Menu Language" Sent by a device capable of character generation (for OSD and Menus) to a TV in order to discover the currently selected Menu language.Also used by a TV during installation to discover the currently set menu language of other devices.*/
/**CNcomment: "Get Menu Language"���ڻ�ȡTv���������������滻��ǰ�Ĳ˵��������ͣ�Ҳ������TV�豸����ʱ�����������豸�Ĳ˵�����*/
#define CEC_OPCODE_GET_MENU_LANGUAGE		  0X91
/**"Set Menu Language" Used by a TV or another device to indicate the menu language. */
/**CNcomment: "Set Menu Language"����Tv�������豸�����ò˵�����*/
#define CEC_OPCODE_SET_MENU_LANGUAGE		  0X32

/*  Deck Control Feature*/

/**"Deck Control" Used to control a device's media functions. */
/**CNcomment: "Deck control"��Ϣ���ڿ���һ���豸�Ķ�ý�幦��*/
#define CEC_OPCODE_DECK_CONTROL			  0X42
/**"Deck Status" Used to provide a deck's status to the initiator of the "Give Deck Status" message. */
/**CNcomment: "Deck Status "��Ϣ���ڻظ�"Give Deck Status"��Ϣ�ķ�����Deck��״̬*/
#define CEC_OPCODE_DECK_STATUS			  0X1B
/**"Give Deck Status" Used to request the status of a device, regardless of whether or not it is the current active source. */
/**CNcomment: "Give Deck Status"��Ϣ�����ȡĿ���豸��״̬��������Ŀ���豸Ŀǰ�ǲ��Ǽ����*/
#define CEC_OPCODE_GIVE_DECK_STATUS		  0X1A
/**"Play" Used to control the playback behaviour of a source device. */
/**CNcomment: "Play"��Ϣ���ڿ���Դ�豸����*/
#define CEC_OPCODE_PLAY				  0X41

/* Tuner Control Feature*/

/**"Give Tuner Device Status" Used to request the status of a tuner device. */
/**CNcomment: "Give Tuner Device Status"���ڻ�ȡ���ӵ�г����״̬*/
#define CEC_OPCODE_GIVE_TUNER_DEVICE_STATUS	  0X08
/**"Select Analogue Service" Directly selects an Analogue TV service */
/**CNcomment: "Select Analogue Service"��Ϣ����ֱ��ѡ��һ��ģ����ӵķ�����*/
#define CEC_OPCODE_SELECT_ANALOGUE_SERVICE	  0X92
/**"Select Digital Service" Directly selects a Digital TV, Radio or Data Broadcast Service */
/**CNcomment: "Select Digital Service"��Ϣ����ֱ��ѡ��һ�����ֵ��ӵķ�����*/
#define CEC_OPCODE_SELECT_DIGITAL_SERVICE	  0X93
/**"Tuner Device Status" Use by a tuner device to provide its status to the initiator of the "Give Tuner Device Status" message. */
/**CNcomment: "Tuner Device Status"��Ϣ���ڵ��ӵ�г����" Give Tuner Device Status"��Ϣ�ķ���˻ظ�*/
#define CEC_OPCODE_TUNER_DEVICE_STATUS		  0X07
/**"Tuner Step Decrement" Used to tune to next lowest service in a tuner's service list. Can be used for PIP. */
/**CNcomment: "Tuner Step Decrement"��Ϣ���ڰѴε͵ķ���������г���ķ����б��������ڻ��л�*/
#define CEC_OPCODE_TUNER_STEP_DECREMENT		  0X06
/**"Tuner Step Increment" Used to tune to next highest service in a tuner's service list. Can be used for PIP. */
/**CNcomment: "Tuner Step Decrement"��Ϣ���ڰѴθߵķ���������г���ķ����б��������ڻ��л�*/
#define CEC_OPCODE_TUNER_STEP_INCREMENT		  0X05

/* Vendor Specific Command*/

/**"Device Vendor ID" Reports the vendor ID of this device. */
/**CNcomment: "Device Vendor ID"��Ϣ���ڱ�����豸�Ĺ�Ӧ��ID*/
#define CEC_OPCODE_DEVICE_VENDOR_ID		  0X87
/**"Give Device Vendor ID" Requests the Vendor ID from a device. */
/**CNcomment: "Give Device Vendor ID"��Ϣ����������豸�Ĺ�Ӧ��ID*/
#define CEC_OPCODE_GIVE_DEVICE_VENDOR_ID	  0X8C
/**"Vendor Command" Allows vendor specific commands to be sent between two devices. */
/**CNcomment: "Vendor Command"���������豸֮�以�෢�͹�Ӧ�̶�����Ϣ*/
#define CEC_OPCODE_VENDOR_COMMAND		  0X89
/**"Vendor Command With ID" Allows vendor specific commands to be sent between two devices or broadcast. */
/**CNcomment: "Vendor Command With ID"���������豸֮���㲥��ʽ���͹�Ӧ�̶�����Ϣ*/
#define CEC_OPCODE_VENDOR_COMMAND_WITH_ID	  0XA0
/**"Vendor Remote Button Down" Indicates that a remote control button has been depressed. */
/**CNcomment: "Vendor Remote Button Down"��Ϣ��ʾ��ң�����а���������*/
#define CEC_OPCODE_VENDOR_REMOTE_BUTTON_DOWN	  0X8A
/**"Vendor Remote Button Up" Indicates that a remote control button (the last button pressed indicated by the Vendor Remote Button Down message) has been released. */
/**CNcomment: "Vendor Remote Button Up"��Ϣ��ʾ "Vendor Remote Button Down"��Ϣ���һ�α�ʾ���İ������ͷ���*/
#define CEC_OPCODE_VENDOR_REMOTE_BUTTON_UP	  0X8B

/* OSD Display Feature*/

/**"Set OSD String" Used to send a text message to output on a TV. */
/**CNcomment: "Set OSD String"��Ϣ���Է���һ��������Ϣ������ʾ�ڵ��ӻ���*/
#define CEC_OPCODE_SET_OSD_STRING		  0X64
/**"Give OSD Name" Used to request the preferred OSD name of a device for use in menus associated with that device. */
/**CNcomment:������ѡ�Ĺ����豸�˵���ʾ������ */
#define CEC_OPCODE_GIVE_OSD_NAME		  0X46
/**"Set OSD Name" Used to set the preferred OSD name of a device for use in menus associated with that device. */
/**CNcomment:������ѡ�����豸�˵���ʾ������ */
#define CEC_OPCODE_SET_OSD_NAME			  0X47

/* Device Menu Control Feature*/

/**"Menu Request" A request from the TV for a device to show/remove a menu or to query if a device is currently showing a menu. */
/**CNcomment: "Menu Request"��Ϣ���ڵ�������һ���豸��ʾ/�رղ˵���ѯ�ʸ��豸��ǰ��û�в˵���ʾ*/
#define CEC_OPCODE_MENU_REQUEST			  0X8D
/**"Menu Status" Used to indicate to the TV that the device is showing/has removed a menu and requests the remote control keys to be passed though. */
/**CNcomment: "Menu Status"��Ϣ���ڻظ����Ӷ˵�ǰ����ʾ/�Ƴ��˲˵�����͸��ң����ָ��*/
#define CEC_OPCODE_MENU_STATUS			  0X8E
/**"User Control Pressed" Used to indicate that the user pressed a remote control button or switched from one remote control button to another. */
/**CNcomment: "User Control Pressed"��ʾ�û�����һ��ң�����������ĳһ������������һ������.Ҳ���������û���ӷ����ָ��*/
#define CEC_OPCODE_USER_CONTROL_PRESSED		  0X44
/**"User Control Released" Indicates that user released a remote control button (the last one indicated by the "User Control Pressed" message) */
/**CNcomment: "User Control Released"��ʾ�û��ͷ���"User Control Released"��Ϣָ����ң��������.Ҳ���������û���ӷ����ָ��*/
#define CEC_OPCODE_USER_CONTROL_RELEASED	  0X45

/* Power Status Feature*/

/**"Give Device Power Status" Used to determine the current power status of a target device */
/**CNcomment: "Give Device Power Status"��Ϣ���ڻ�ȡĿ���豸��ǰ�ĵ�Դ״̬*/
#define CEC_OPCODE_GIVE_DEVICE_POWER_STATUS	  0X8F
/**"Report Power Status" Used to inform a requesting device of the current power status */
/**CNcomment: "Report Power Status"��Ϣ���ڷ��͵�ǰ�ĵ�Դ״̬�ظ������豸*/
#define CEC_OPCODE_REPORT_POWER_STATUS		  0X90

/* System Audio Control Feature*/

/**"Give Audio Status" Requests an amplifier to send its volume and mute status */
/**CNcomment: "Give Audio Status"��Ϣ�����ȡ�������������;���״̬*/
#define CEC_OPCODE_GIVE_AUDIO_STATUS		  0X71
/**"Give System Audio Mode Status" Requests the status of the System Audio Mode */
/**CNcomment: "Give System Audio Mode Status"��Ϣ����ϵͳ��Ƶ��״̬*/
#define CEC_OPCODE_GIVE_SYSTEM_AUDIO_MODE_STATUS  0x7D
/**"Report Audio Status" Reports an amplifier's volume and mute status */
/**CNcomment: "Report Audio Status"��Ϣ���ڷ����������������;���״̬*/
#define CEC_OPCODE_REPORT_AUDIO_STATUS		  0X7A
/**"Set System Audio Mode" Turns the System Audio Mode On or Off. */
/**CNcomment: "Set System Audio Mode"��Ϣ���ڴ�/�ر�ϵͳ��Ƶ����*/
#define CEC_OPCODE_SET_SYSTEM_AUDIO_MODE	  0X72
/**"System Audio Mode Request" A device implementing System Audio Control and which has volume control RC buttons (eg TV or STB) requests to use System Audio Mode to the amplifier */
/**CNcomment: ʹ���������ư�ť(stb����tv)��Ҫ���������� System Audio Mode*/
#define CEC_OPCODE_SYSTEM_AUDIO_MODE_REQUEST	  0X70
/**"System Audio Mode Status" Reports the current status of the System Audio Mode */
/**CNcomment: "System Audio Mode Status"��Ϣ���ڷ���ϵͳ��Ƶ��ǰ��״̬*/
#define CEC_OPCODE_SYSTEM_AUDIO_MODE_STATUS	  0X7E

/* Audio Rate Control Feature*/

/**"Set Audio Rate" Used to control audio rate from Source Device. */
/**CNcomment: "Set Audio Rate"��Ϣ���ڿ���Դ���豸����Ƶ������*/
#define CEC_OPCODE_SET_AUDIO_RATE		  0X9A

/**POLL message have no opcode, So, we just use this value */
/**CNcomment: "POLL"��Ϣû�в����룬���ǽ���ֻ��ʹ�ø�ֵ*/
#define CEC_OPCODE_POLLING_MESSAGE		  0XFE

/**HDMI CEC logical address,please reference  HDMI specification 1.4a*/
/**CNcomment: HDMI CEC�߼���ַ����ο�HDMI 1.4aЭ�� */
typedef enum hiUNF_CEC_LOGICALADD_S
{
    HI_UNF_CEC_LOGICALADD_TV		   = 0X00, /**<TV*//**CNcomment:<���� */
    HI_UNF_CEC_LOGICALADD_RECORDDEV_1	   = 0X01, /**<Record device 1*//**CNcomment:<¼��� 1 */
    HI_UNF_CEC_LOGICALADD_RECORDDEV_2	   = 0X02, /**<Record device 2*//**CNcomment:<¼��� 2 */
    HI_UNF_CEC_LOGICALADD_TUNER_1	   = 0X03, /**<Tuner 1*//**CNcomment:<��Ƶͷ 1*/
    HI_UNF_CEC_LOGICALADD_PLAYDEV_1	   = 0X04, /**<play device 1*//**CNcomment:<�����豸 1 */
    HI_UNF_CEC_LOGICALADD_AUDIOSYSTEM	   = 0X05, /**<audio system*//**CNcomment:<��Ƶϵͳ */
    HI_UNF_CEC_LOGICALADD_TUNER_2	   = 0X06, /**<tuner 2*//**CNcomment:<��Ƶͷ 2 */
    HI_UNF_CEC_LOGICALADD_TUNER_3	   = 0X07, /**<tuner 3*//**CNcomment:<��Ƶͷ 3 */
    HI_UNF_CEC_LOGICALADD_PLAYDEV_2	   = 0X08, /**<play device 2*//**CNcomment:<�����豸 2 */
    HI_UNF_CEC_LOGICALADD_RECORDDEV_3	   = 0X09, /**<Record device 3*//**CNcomment:<¼��� 3 */
    HI_UNF_CEC_LOGICALADD_TUNER_4	   = 0X0A, /**<tuner 4*//**CNcomment:<��Ƶͷ 4 */
    HI_UNF_CEC_LOGICALADD_PLAYDEV_3	   = 0X0B, /**<play device 3*//**CNcomment:<�����豸 3 */
    HI_UNF_CEC_LOGICALADD_RESERVED_1	   = 0X0C, /**<reserved 1*//**CNcomment:<������ 1 */
    HI_UNF_CEC_LOGICALADD_RESERVED_2	   = 0X0D, /**<reserved 2*//**CNcomment:<������ 2 */
    HI_UNF_CEC_LOGICALADD_SPECIALUSE	   = 0X0E, /**<special use*//**CNcomment:<������; */
    HI_UNF_CEC_LOGICALADD_BROADCAST	   = 0X0F, /**<broadcast*//**CNcomment:<�㲥 */
    HI_UNF_CEC_LOGICALADD_BUTT
}HI_UNF_CEC_LOGICALADD_S;

/**HDMI CEC command type,please reference  HDMI specification 1.4a*/
/**CNcomment: HDMI CEC�������ͣ���ο�HDMI 1.4aЭ�� */
typedef enum hiUNF_CEC_CMDTYPE_E
{
    HI_UNF_CEC_STRUCTCOMMAND,			 /**<CEC struct command*//**<CNcomment:CEC �ṹ���� */
    HI_UNF_CEC_RAWCOMMAND,			 /**<CEC raw command*//**<CNcomment:CEC ԭʼ���� */
    HI_UNF_CEC_BUTT
}HI_UNF_CEC_CMDTYPE_E;

/**HDMI CEC Raw Data struct,please reference  HDMI specification 1.4a*/
/**CNcomment: HDMI CECԭʼ���ݽṹ�壬��ο�HDMI 1.4aЭ�� */
typedef struct hiUNF_CEC_RAWDATA_S
{
    HI_U8			       u8Length;  /**<CEC raw data lengh*//**<CNcomment:cec ��Ч�������� */
    HI_U8			       u8Data[15];     /**<CEC raw data*//**<CNcomment:CEC �����ṹ�� */
}HI_UNF_CEC_RAWDATA_S;

/**HDMI CEC user Interface Command Opcode,please reference  HDMI specification 1.4a*/
/**CNcomment: HDMI CEC �û��ӿڲ���ָ���ο�HDMI 1.4aЭ�� */
typedef enum hiUNF_CEC_UICMD_E
{
    HI_UNF_CEC_UICMD_SELECT			 = 0x00,
    HI_UNF_CEC_UICMD_UP				 = 0x01,
    HI_UNF_CEC_UICMD_DOWN			 = 0x02,
    HI_UNF_CEC_UICMD_LEFT			 = 0x03,
    HI_UNF_CEC_UICMD_RIGHT			 = 0x04,
    HI_UNF_CEC_UICMD_RIGHT_UP			 = 0x05,
    HI_UNF_CEC_UICMD_RIGHT_DOWN			 = 0x06,
    HI_UNF_CEC_UICMD_LEFT_UP			 = 0x07,
    HI_UNF_CEC_UICMD_LEFT_DOWN			 = 0x08,
    HI_UNF_CEC_UICMD_ROOT_MENU			 = 0x09,
    HI_UNF_CEC_UICMD_SETUP_MENU			 = 0x0A,
    HI_UNF_CEC_UICMD_CONTENTS_MENU		 = 0x0B,
    HI_UNF_CEC_UICMD_FAVORITE_MENU		 = 0x0C,
    HI_UNF_CEC_UICMD_EXIT			 = 0x0D,
    HI_UNF_CEC_UICMD_NUM_0			 = 0x20,
    HI_UNF_CEC_UICMD_NUM_1			 = 0x21,
    HI_UNF_CEC_UICMD_NUM_2			 = 0x22,
    HI_UNF_CEC_UICMD_NUM_3			 = 0x23,
    HI_UNF_CEC_UICMD_NUM_4			 = 0x24,
    HI_UNF_CEC_UICMD_NUM_5			 = 0x25,
    HI_UNF_CEC_UICMD_NUM_6			 = 0x26,
    HI_UNF_CEC_UICMD_NUM_7			 = 0x27,
    HI_UNF_CEC_UICMD_NUM_8			 = 0x28,
    HI_UNF_CEC_UICMD_NUM_9			 = 0x29,
    HI_UNF_CEC_UICMD_DOT			 = 0x2A,
    HI_UNF_CEC_UICMD_ENTER			 = 0x2B,
    HI_UNF_CEC_UICMD_CLEAR			 = 0x2C,
    HI_UNF_CEC_UICMD_NEXT_FAVORITE		 = 0x2F,
    HI_UNF_CEC_UICMD_CHANNEL_UP			 = 0x30,
    HI_UNF_CEC_UICMD_CHANNEL_DOWN		 = 0x31,
    HI_UNF_CEC_UICMD_PREVIOUS_CHANNEL		 = 0x32,
    HI_UNF_CEC_UICMD_SOUND_SELECT		 = 0x33,
    HI_UNF_CEC_UICMD_INPUT_SELECT		 = 0x34,
    HI_UNF_CEC_UICMD_DISPLAY_INFORMATION	 = 0x35,
    HI_UNF_CEC_UICMD_HELP			 = 0x36,
    HI_UNF_CEC_UICMD_PAGE_UP			 = 0x37,
    HI_UNF_CEC_UICMD_PAGE_DOWN			 = 0x38,
    HI_UNF_CEC_UICMD_POWER			 = 0x40,
    HI_UNF_CEC_UICMD_VOLUME_UP			 = 0x41,
    HI_UNF_CEC_UICMD_VOLUME_DOWN		 = 0x42,
    HI_UNF_CEC_UICMD_MUTE			 = 0x43,
    HI_UNF_CEC_UICMD_PLAY			 = 0x44,
    HI_UNF_CEC_UICMD_STOP			 = 0x45,
    HI_UNF_CEC_UICMD_PAUSE			 = 0x46,
    HI_UNF_CEC_UICMD_RECORD			 = 0x47,
    HI_UNF_CEC_UICMD_REWIND			 = 0x48,
    HI_UNF_CEC_UICMD_FAST_FORWARD		 = 0x49,
    HI_UNF_CEC_UICMD_EJECT			 = 0x4A,
    HI_UNF_CEC_UICMD_FORWARD			 = 0x4B,
    HI_UNF_CEC_UICMD_BACKWARD			 = 0x4C,
    HI_UNF_CEC_UICMD_STOP_RECORD		 = 0x4D,
    HI_UNF_CEC_UICMD_PAUSE_RECORD		 = 0x4E,
    HI_UNF_CEC_UICMD_ANGLE			 = 0x50,
    HI_UNF_CEC_UICMD_SUBPICTURE			 = 0x51,
    HI_UNF_CEC_UICMD_VIDEO_ON_DEMAND		 = 0x52,
    HI_UNF_CEC_UICMD_ELECTRONIC_PROGRAM_GUIDE	 = 0x53,
    HI_UNF_CEC_UICMD_TIMER_PROGRAMMING		 = 0x54,
    HI_UNF_CEC_UICMD_INITIAL_CONFIGURATION	 = 0x55,
    HI_UNF_CEC_UICMD_PLAY_FUNCTION		 = 0x60,
    HI_UNF_CEC_UICMD_PAUSE_PLAY_FUNCTION	 = 0x61,
    HI_UNF_CEC_UICMD_RECORD_FUNCTION		 = 0x62,
    HI_UNF_CEC_UICMD_PAUSE_RECORD_FUNCTION	 = 0x63,
    HI_UNF_CEC_UICMD_STOP_FUNCTION		 = 0x64,
    HI_UNF_CEC_UICMD_MUTE_FUNCTION		 = 0x65,
    HI_UNF_CEC_UICMD_RESTORE_VOLUME_FUNCTION	 = 0x66,
    HI_UNF_CEC_UICMD_TUNE_FUNCTION		 = 0x67,
    HI_UNF_CEC_UICMD_SELECT_MEDIA_FUNCTION	 = 0x68,
    HI_UNF_CEC_UICMD_SELECT_AV_INPUT_FUNCTION	 = 0x69,
    HI_UNF_CEC_UICMD_SELECT_AUDIO_INPUT_FUNCTION = 0x6A,
    HI_UNF_CEC_UICMD_POWER_TOGGLE_FUNCTION	 = 0x6B,
    HI_UNF_CEC_UICMD_POWER_OFF_FUNCTION		 = 0x6C,
    HI_UNF_CEC_UICMD_POWER_ON_FUNCTION		 = 0x6D,
    HI_UNF_CEC_UICMD_F1_BLUE			 = 0x71,
    HI_UNF_CEC_UICMD_F2_RED			 = 0x72,
    HI_UNF_CEC_UICMD_F3_GREEN			 = 0x73,
    HI_UNF_CEC_UICMD_F4_YELLOW			 = 0x74,
    HI_UNF_CEC_UICMD_F5				 = 0x75,
    HI_UNF_CEC_UICMD_DATA			 = 0x76
}HI_UNF_CEC_UICMD_E;

/**HDMI CEC operand command,please reference  HDMI specification 1.4a*/
/**CNcomment: HDMI CEC ����ָ���ο�HDMI 1.4aЭ�� */
typedef union hiUNF_CEC_Operand_t
{
    HI_UNF_CEC_RAWDATA_S	       stRawData;   /**<CEC raw date*//**<CNcomment:CEC ԭʼ���� */
    HI_UNF_CEC_UICMD_E		       stUIOpcode;  /**<CEC user interface command*//**<CNcomment:CEC�û��Զ������ */
}HI_UNF_CEC_Operand_t;

/**HDMI CEC struct command*/
/**CNcomment: HDMI CEC ����ṹ */
typedef struct hiUNF_HDMI_CEC_CMD_S
{
    HI_UNF_CEC_LOGICALADD_S  enSrcAdd;	   /**<logical address of source *//**<CNcomment:Դ���豸��ַ */
    HI_UNF_CEC_LOGICALADD_S  enDstAdd;	   /**<logical address of destination*//**<CNcomment:Ŀ���豸��ַ */
    HI_U8		     u8Opcode;	   /**<opration code*//**<CNcomment:������*/
    HI_UNF_CEC_Operand_t     unOperand;	   /**<operand*//**<CNcomment:������*/
}HI_UNF_HDMI_CEC_CMD_S;

/**HDMI CEC status struct*/
/**CNcomment: HDMI CEC ״̬�ṹ */
typedef struct hiUNF_HDMI_CEC_STATUS_S
{
    HI_BOOL bEnable;				     /**<the flag of CEC work,HI_TRUE:CEC work enable,HI_FALSE:CEC no work ,other parameter no effect*/ /**<CNcomment:CEC �����������λ�����ΪHI_TRUE,CEC�����������������ΪHI_FASLE,CEC������������Ч�����Ҳ��ܹ��� */
    HI_U8   u8PhysicalAddr[4];			     /**<CEC physics address*/ /**<CNcomment:CEC ������ַ */
    HI_U8   u8LogicalAddr;			     /**<CEC logic address,defualt 0x03*//**<CNcomment:CEC �߼���ַ��Ĭ��Ϊ��0x03. */
    HI_U8   u8Network[HI_UNF_CEC_LOGICALADD_BUTT];   /**<CEC network struct ,1:the device can response CEC command*/ /**<CNcomment:CEC ��������·�ṹ��Ϊ1��ʾ���豸�ܹ���ӦCEC���� */
}HI_UNF_HDMI_CEC_STATUS_S;

/**HDMI CEC Regcallback param struct */
/**CNcomment: HDMI CEC �ص����������ṹ */
typedef HI_VOID (*HI_UNF_HDMI_CECCALLBACK)(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CEC_CMD_S *pstCECCmd, HI_VOID *pData);


/**HDMI HDCP key struct*/
/**CNcomment: HDMI HDCP ��Կ�ṹ */
typedef struct hiUNF_HDMI_LOAD_KEY_S
{
    HI_U8 *pu8InputEncryptedKey;	    /**<Encrypted key pointer *//**<CNcomment:���ܵ���Կ����ͷ��ַ */
    HI_U32 u32KeyLength;		    /**<Encrypted key length*//**<CNcomment:���ܵ���Կ���� */
}HI_UNF_HDMI_LOAD_KEY_S;

/**HDMI HDCP SRM(system renewability messages) struct*/
/**CNcomment: HDMI HDCP SRM(ʧЧ�б�)�ṹ */
typedef struct hiUNF_HDMI_SRM_S
{
    HI_U8 *pu8SrmData;		    /**<SRM raw data *//**<CNcomment:SRM ԭʼ��������ͷ��ַ */
    HI_U32 u32SrmLen;		    /**<Length of SRM *//**<CNcomment:ԭʼ���ݳ��ȣ���λΪ�ֽ� */
} HI_UNF_HDMI_SRM_S;
/**HDMI Delay struct*/
/**CNcomment: HDMI ��ʱ�ṹ */
typedef struct hiUNF_HDMI_DELAY_S
{
    HI_U32  u32MuteDelay;	    /**<delay for avmute *//**<CNcomment:avmute����ʱ */
    HI_U32  u32FmtDelay;	    /**<delay for setformat *//**<CNcomment:������ʽ����ʱ */
    HI_BOOL bForceFmtDelay;	    /**<force setformat delay mode *//**<CNcomment:�л���ʽǿ����ʱģʽ */
    HI_BOOL bForceMuteDelay;	    /**<force avmute delay mode *//**<CNcomment:muteǿ����ʱģʽ */
}HI_UNF_HDMI_DELAY_S;


/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     HDMI */
/** @{ */  /** <!-- [HDMI] */

/**
\brief the whole initialization of the hdmi. CNcomment:HDMI�ӿ�����������ʼ�� CNend
\attention  this func should be called before vo_init and after disp_init. CNcomment:������DISP����Setup֮���VO����Setup֮ǰ�� CNend
\param CNcomment:�� CNend
\retval HI_SUCCESS  success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Init(HI_VOID);


/**
\brief deinit the hdmi. CNcomment:HDMI�ӿ�ȥ��ʼ�� CNend
\attention  this must be called after vo exited and before disp	 exited . CNcomment:������VO����Exit֮���DISP����Exit֮ǰ�� CNend
\param CNcomment:�� CNend
\retval HI_SUCCESS	success.CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_DeInit(HI_VOID);


/**
\brief create hdmi device. CNcomment:����HDMI�豸 CNend
\attention \n
\param[in] enHdmi  hdmi device id. CNcomment:Ҫ�򿪵�HDMI�豸 CNend
\param[in] pstOpenPara	When get GetSinkCapability failed,defalut set sink device to DVI/HDMI mode.CNcomment:δ��ȡ���Զ�������ʱ��Ĭ�ϰѶԶ˵���(DVI/HDMI)�豸 CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_OPEN_PARA_S *pstOpenPara);

/**
\brief close the handler created by  HI_UNF_HDMI_Open. CNcomment:������HI_UNF_HDMI_Open�����ľ�� CNend
\attention \n
\param[in] enHdmi  hdmi device id. CNcomment:HDMI�豸ID CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Close(HI_UNF_HDMI_ID_E enHdmi);

/**
\brief get current hdmi status. CNcomment:��ȡhdmi��ǰ��״̬ CNend
\attention \n
\param[in] enHdmi  hdmi device id. CNcomment:HDMI�豸ID CNend
\param[out] pHdmiStatus hdmi cuttent status. CNcomment:HDMI��ǰ״̬ CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetStatus(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_STATUS_S *pHdmiStatus);

/**
\brief to get the capability of sink connect to stbbox. CNcomment:��ѯ��ȡHDMI Sink�豸�������� CNend
\attention \n
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[out] pCapability	 the capability of the sink .CNcomment:SINK������ CNend
\retval HI_SUCCESS	 success.  CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi. CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_EDID_BASE_INFO_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetSinkCapability(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_EDID_BASE_INFO_S *pCapability);

/**
\brief set the attr of given hdmi interface. CNcomment:����HDMI�ӿ����ԡ� CNend
\attention \n
\param[in] enHdmi      hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] pstAttr     the attr of given hdmi interface.CNcomment:HDMI�ӿ����� CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_ATTR_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetAttr(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_ATTR_S *pstAttr);


/**
\brief get the current attr of the give hdmi interface. CNcomment:��ѯHDMI�ӿڵ�ǰ���� CNend
\attention \n
\param[in] enHdmi hdmi device id.CNcomment: HDMI�豸ID CNend
\param[out] pstAttr	the attr of given hdmi interface. CNcomment:HDMI�ӿ����� CNend
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see HI_UNF_HDMI_ATTR_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetAttr(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_ATTR_S *pstAttr);


/**
\brief get the cec working status. CNcomment:��ȡCEC״̬ CNend
\attention  user can get the cec working status through this func. CNcomment:�ͻ�����ͨ���ýӿڻ�ȡCEC����״̬\n CNend
\param[in] enHdmi	hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] pStatus     get cec working status. CNcomment:CEC ״̬ CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_CEC_CMD_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_CECStatus(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CEC_STATUS_S	*pStatus);


/**
\brief send the cec data. CNcomment:����CEC ���� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] pCECCmd	the cec cmd data.CNcomment:Cec Command ���� CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_CEC_CMD_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetCECCommand(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CEC_CMD_S	 *pCECCmd);


/**
\brief get the cec data received. CNcomment:���յ�CEC ���� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] pCECCmd    the cec cmd data. CNcomment:Cec Command ���� CNend
\param[in] timeout    timeout for getting cec cmd, unit: 10ms;
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_CEC_CMD_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetCECCommand(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CEC_CMD_S	 *pCECCmd, HI_U32 timeout);

/**
\brief register CEC callback function. CNcomment:ע���ȡCEC�ص����� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] pCECCallback	   the cec callback handle. CNcomment:�ص�������� CNend
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_CEC_CMD_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_RegCECCallBackFunc(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CECCALLBACK pCECCallback);

/**
\brief unregister CEC callback function. CNcomment:��ע���ȡCEC�ص����� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] pCECCallback	 the cec callback handle. CNcomment:�ص�������� CNend
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see ::HI_UNF_HDMI_CEC_CMD_S\n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_UnRegCECCallBackFunc(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CECCALLBACK pCECCallback);

/**
\brief enable the cec func. CNcomment:CEC ʹ�ܴ� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_CEC_Enable(HI_UNF_HDMI_ID_E enHdmi);

/**
\brief disable the cec func. CNcomment:CEC ʹ�ܹر� CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_CEC_Disable(HI_UNF_HDMI_ID_E enHdmi);

/**
\brief	set and send infoframe. CNcomment:���ò�����InfoFrame CNend
\attention \n
\param[in] enHdmi	hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] pstInfoFrame the inforframe content.CNcomment:InfoFrame���� CNend
\retval HI_SUCCESS	success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetInfoFrame(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_INFOFRAME_S *pstInfoFrame);

/**
\brief get the infoframe infor. CNcomment:��ȡ���ڷ��͵�InfoFrame����Ϣ CNend
\attention \n
\param[in] enHdmi	hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] enInfoFrameType the info frame type such as avi or audio or gcp etc. CNcomment:InfoFrame���� CNend
\param[out] pstInfoFrame   the inforframe content.CNcomment:InfoFrame���� CNend
\retval HI_SUCCESS	success.CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetInfoFrame(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_INFOFRAME_TYPE_E enInfoFrameType, HI_UNF_HDMI_INFOFRAME_S *pstInfoFrame);



/**
\brief	start the hdmi works. CNcomment:HDMI��ʼ CNend
\attention \n
this should be called after HI_UNF_HDMI_SetAttr.
CNcomment:����HDMI�ӿڡ�һ����HI_UNF_HDMI_SetAttr֮����� CNend
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Start(HI_UNF_HDMI_ID_E enHdmi);

/**
\brief stop  the hdmi. CNcomment:hdmiֹͣ CNend
\attention \n
this func should be called  when hdmi plug out.
CNcomment:��HDMI�߱��γ���HDMI�ص�����Ӧ�õ��øú����� CNend
\param[in] enHdmi  hdmi device id. CNcomment:HDMI�豸ID CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Stop(HI_UNF_HDMI_ID_E enHdmi);

/**
\brief set the deep color mode. CNcomment:����HDMI DeepColorģʽ CNend
\attention \n
\param[in] enHdmi   hdmi device id. CNcomment:HDMI�豸ID CNend
\param[in] enDeepColor deep color mode,please refer to the HI_UNF_HDMI_DEEP_COLOR_E definiton.CNcomment:DeepColorģʽ����ο�::HI_UNF_HDMI_DEEP_COLOR_E	 CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetDeepColor(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_DEEP_COLOR_E enDeepColor);

/**
\brief switch the xvycc on or off. CNcomment:����HDMI xvYCC ģʽ CNend
\attention \n
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] bEnalbe   whether to enable xvycc mode or not .CNcomment:�Ƿ�ʹ��xvYCCģʽ CNend
\retval HI_SUCCESS    success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetxvYCCMode(HI_UNF_HDMI_ID_E enHdmi, HI_BOOL bEnalbe);

/**
\brief switch the mute of av  on or off. CNcomment:����HDMI AV mute ģʽ CNend
\attention \n
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] bAvMute   whether to mute the av.CNcomment:�Ƿ�mute AV CNend
\retval HI_SUCCESS     success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetAVMute(HI_UNF_HDMI_ID_E enHdmi, HI_BOOL bAvMute);

/**
\brief get the edid information forcelly. CNcomment:ǿ�ƻ�ȡEDIDԭʼ����,�ýӿ�Ϊ�ض�ƽ̨��Ҫ��ȡԭʼEDID�Ľӿ� CNend
\attention \n
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] *u8Edid  the buffer allocated externally, buffer size must be 512. CNcomment:��ȡԭʼEDID����buffer��EDID�汾��ͬ�������������ݲ�ͬ��ȡ����buffer ��СΪ512,�û����Լ������; CNend
\param[in] *u32EdidLength  the data lenth of  original edid. CNcomment:��ȡԭʼEDID���ݳ��� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_Force_GetEDID(HI_UNF_HDMI_ID_E enHdmi, HI_U8 *u8Edid, HI_U32 *u32EdidLength);


/**
\brief register callback function. CNcomment:ע��ص����� CNend
\attention \n
this func should be called before HI_UNF_HDMI_Open and after HI_UNF_HDMI_Init
because HI_UNF_HDMI_Open will trigger hotplug event.
And this function can only register one function
If call this func two times,then the 2nd callback function will cover 1st one.
CNcomment:������HI_UNF_HDMI_Init֮���HI_UNF_HDMI_Open֮ǰ���� \n
��ΪOpenʱ������Ž��ն��豸�ϻᴥ��һ��hotplug��Ϣ \n
�ú���ֻ��ע��һ���ص��������ڶ���ע��Ļص������Ḳ��ǰ��Ļص����� CNend
\param CNcomment:�� CNend
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] *HI_UNF_HDMI_CALLBACK_FUNC_S	 callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_RegCallbackFunc(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CALLBACK_FUNC_S *pstCallbackFunc);


/**
\brief unregister CallbackFunc. CNcomment:ע���ص����� CNend
\attention \n
this func should be called before HI_UNF_HDMI_DeInit and after HI_UNF_HDMI_Close
CNcomment:������HI_UNF_HDMI_Close֮���HI_UNF_HDMI_DeInit֮ǰ���� CNend
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] *HI_UNF_HDMI_CALLBACK_FUNC_S	 callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_UnRegCallbackFunc(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_CALLBACK_FUNC_S *pstCallbackFunc);

/**
\brief Load HDCP key. CNcomment:����hdcpkey CNend
\attention \n
\param[in] enHdmi   hdmi device id.CNcomment:HDMI�豸ID CNend
\param[in] *pstLoadKey	key struct length and point CNcomment:key �Ľṹ ���Ⱥ�ָ�� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_LoadHDCPKey(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_LOAD_KEY_S *pstLoadKey);

/**
\brief Set SRM, it is called by user, it can be call more time,only remain the last one when set success.Ncomment:����SRM���� CNend
\param[in]  enHdmi  hdmi channel id. CNcomment:HDMI�豸ID CNend
\param[in]  pstSrm SRM raw dataCNcomment:SRM�ṹ ָ�� CNend
\retval HI_SUCCESS   success/HI_FAILURE fail.  CNcomment:�ɹ�/ʧ�� CNend
*/
HI_S32 HI_UNF_HDMI_SetSrm(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_SRM_S *pstSrm);

/**
\brief get the edid information forcelly. CNcomment:��EEPROM��ȡEDID���� CNend
\attention \n
Difference with two interface for get EDID
HI_UNF_HDMI_Force_GetEDID : Reread EDID from Sink,and write it to EEPROM
HI_UNF_HDMI_ReadEDID : read edid from EEPROM,not Real-time read from Sink
CNcomment:������ȡEDID�Ľӿڲ��
HI_UNF_HDMI_Force_GetEDID �����´ӽ��ն˶�ȡEdid����д��EEPROM
HI_UNF_HDMI_ReadEDID �Ǵ�EEPROM��ȡEdid��������ʵʱ�Ľ��ն�EDID CNend
\param[in] *pstLoadKey	key struct length and point CNcomment:key �Ľṹ ���Ⱥ�ָ�� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_ReadEDID(HI_U8 *u8Edid, HI_U32 *u32EdidLength);

/**
\brief Get HDMI runtime delay. CNcomment:��ȡhdmi����ʱ��ʱ CNend
\attention \n
CNend
\param[in] *pstDelay  delay struct delay time and mode CNcomment:��ʱ�ṹ�� ��ʱ��ʱ����ģʽ CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_GetDelay(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_DELAY_S *pstDelay);

/**
\brief Set HDMI runtime delay. CNcomment:����hdmi����ʱ��ʱ CNend
\attention \n
if not use this interface, then use hdmi inner delay
CNcomment:Ĭ������µ��øýӿ�ǰ��ʹ���ڲ���ʱ,���ú����delayģʽʹ����ʱ CNend
\param[in] *pstDelay  delay struct delay time and mode CNcomment:��ʱ�ṹ�� ��ʱ��ʱ����ģʽ CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMI_SetDelay(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_HDMI_DELAY_S *pstDelay);

/** @} */  /** <!-- ==== API declaration end ==== */
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */


#endif /* __HI_UNF_HDMI_H__ */
