/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_avplay.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2009/12/21
  Description	:
  History	:
  1.Date	: 2009/12/21
    Author	: w58735
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about the audio/video player (AVPLAY) module.
	  CNcomment:�ṩAVPLAY�������Ϣ CNend
 */
#ifndef __HI_UNF_AVPLAY_H__
#define __HI_UNF_AVPLAY_H__

#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif

/*********************************error	 macro******************************************/
/*************************** Structure Definition ****************************/
/** \addtogroup	     AVPLAY */
/** @{ */  /** <!-- [AVPLAY] */

/**Highest priority of the video decoder*/
/**CNcomment:��Ƶ��������������ȼ� */
#define HI_UNF_VCODEC_MAX_PRIORITY  16


/**Defines the buffer ID required in an AVPLAY.*/
/**CNcomment:����AV����������Ҫ��BufferIDö������ */
typedef enum hiUNF_AVPLAY_BUFID_E
{
    HI_UNF_AVPLAY_BUF_ID_ES_VID	 = 0,	    /**<ID of the buffer for storing the video elementary streams (ESs) played by an AVPLAY*//**<CNcomment: AV������ES��ƵBuffer ID. */
    HI_UNF_AVPLAY_BUF_ID_ES_AUD,	    /**<ID of the buffer for storing the audio ESs played by an AVPLAY*//**<CNcommentAV������ES��ƵBuffer ID.*/
    HI_UNF_AVPLAY_BUF_ID_ES_AUD_AD,	    /**<ID of the buffer for storing the AD audio ESs played by an AVPLAY*//**<CNcommentAV������AD ES��ƵBuffer ID.*/
    HI_UNF_AVPLAY_BUF_ID_ES_VID_HDR_BL,	    /**<ID of the buffer for storing the HDR BL video elementary streams (ESs) played by an AVPLAY*//**<CNcomment: AV������HDR BL֡Buffer ID. */
    HI_UNF_AVPLAY_BUF_ID_ES_VID_HDR_EL,	    /**<ID of the buffer for storing the HDR EL video elementary streams (ESs) played by an AVPLAY*//**<CNcomment: AV������HDR EL֡Buffer ID. */
    HI_UNF_AVPLAY_BUF_ID_ES_VID_HDR_DL,	    /**<ID of the buffer for storing the HDR BL+EL video elementary streams (ESs) played by an AVPLAY*//**<CNcomment: AV������HDR BL+EL֡Buffer ID. */
    HI_UNF_AVPLAY_BUF_ID_BUTT
} HI_UNF_AVPLAY_BUFID_E;

/**Defines the type of a media channel.*/
/**CNcomment:����ý��ͨ������. */
typedef enum hiUNF_AVPLAY_MEDIA_CHAN
{
    HI_UNF_AVPLAY_MEDIA_CHAN_AUD  = 0x01,  /**<Audio channel*//**<CNcomment: ��Ƶͨ�� */
    HI_UNF_AVPLAY_MEDIA_CHAN_VID  = 0x02,  /**<Video channel*//**<CNcomment: ��Ƶͨ�� */

    HI_UNF_AVPLAY_MEDIA_CHAN_BUTT = 0x8
} HI_UNF_AVPLAY_MEDIA_CHAN_E;

/**Defines the type of an input stream interface.*/
/**CNcomment:���������������ӿ����� */
typedef enum hiUNF_AVPLAY_STREAM_TYPE_E
{
    HI_UNF_AVPLAY_STREAM_TYPE_TS = 0,	/**<Transport stream (TS)*//**<CNcomment:TS���� */
    HI_UNF_AVPLAY_STREAM_TYPE_ES,	/**<ES stream*//**<CNcomment:ES���� */

    HI_UNF_AVPLAY_STREAM_TYPE_BUTT
} HI_UNF_AVPLAY_STREAM_TYPE_E;

/**Defines the stream attributes.*/
/**CNcomment:�����������ԵĽṹ�� */
typedef struct hiUNF_AVPLAY_STREAM_ATTR_S
{
    HI_UNF_AVPLAY_STREAM_TYPE_E enStreamType;	/**<Stream type*//**<CNcomment:�������� */

    HI_U32			u32VidBufSize;	/**<Video buffer size*//**<CNcomment: ��Ƶ�����С */
    HI_U32			u32AudBufSize;	/**<Audio buffer size*//**<CNcomment: ��Ƶ�����С */

} HI_UNF_AVPLAY_STREAM_ATTR_S;

/**Supported synchronization control mode*/
/**CNcomment:֧�ֵ�ͬ������ģʽ */
typedef enum hiUNF_SYNC_REF_E
{
    HI_UNF_SYNC_REF_NONE = 0, /**<Free playing without synchronization*//**<CNcomment: ���ɲ��� */
    HI_UNF_SYNC_REF_AUDIO,    /**<Audio-based synchronization*//**<CNcomment: ����ƵΪ׼ */
    HI_UNF_SYNC_REF_VIDEO,    /**<Video-based synchronization*//**<CNcomment: ����ƵΪ׼ */
    HI_UNF_SYNC_REF_PCR,      /**<Program Clock Reference (PCR)-based synchronization*//**<CNcomment: ��PCR��Program Clock Reference��Ϊ׼ */
    HI_UNF_SYNC_REF_SCR,      /**<System Clock Reference (SCR)-based synchronization*//**<CNcomment: ��SCR (System Clock Reference) Ϊ׼ */

    HI_UNF_AVPLAY_SYNC_REF_BUTT
} HI_UNF_SYNC_REF_E;

/**Defines the status of a buffer.*/
/**CNcomment:����ʹ�õĻ�����״̬ö������ */
typedef enum hiUNF_AVPLAY_BUF_STATE_E
{
    HI_UNF_AVPLAY_BUF_STATE_EMPTY = 0,	 /**<The buffer is idle.*//**<CNcomment: ���������� */
    HI_UNF_AVPLAY_BUF_STATE_LOW,	 /**<The buffer usage is too low.*//**<CNcomment: ������ռ���ʹ��� */
    HI_UNF_AVPLAY_BUF_STATE_NORMAL,	 /**<The buffer works normally.*//**<CNcomment: ������ʹ������ */
    HI_UNF_AVPLAY_BUF_STATE_HIGH,	 /**<The buffer usage is too high.*//**<CNcomment: ������ռ���ʹ��� */
    HI_UNF_AVPLAY_BUF_STATE_FULL,	 /**<The buffer is full.*//**<CNcomment: ���������� */

    HI_UNF_AVPLAY_BUF_STATE_BUTT
}HI_UNF_AVPLAY_BUF_STATE_E;

/**Defines the type of pts channel.*/
/** CNcomment:����PTSͨ������ */
typedef enum hiUNF_SYNC_PTS_CHAN_E
{
    HI_UNF_SYNC_PTS_CHAN_VID,	/**<Video pts channel.*//**<CNcomment:��ƵPTSͨ�� */
    HI_UNF_SYNC_PTS_CHAN_AUD,	/**<Audio pts channel.*//**<CNcomment:��ƵPTSͨ�� */
    HI_UNF_SYNC_PTS_CHAN_PCR,	/**<Pcr channel.*//**<CNcomment:PCRͨ�� */

    HI_UNF_SYNC_PTS_CHAN_BUTT
}HI_UNF_SYNC_PTS_CHAN_E;

/**Defines the parameters of pts jump.*/
/** CNcomment:����PTS��������Ľṹ�� */
typedef struct hiUNF_SYNC_PTSJUMP_PARAM_S
{
    HI_UNF_SYNC_PTS_CHAN_E  enPtsChan;	/**<Pts channel.*//**<CNcomment:PTSͨ�� */
    HI_BOOL		    bLoopback;	/**<Loopback or not.*//**<CNcomment:�Ƿ񻷻� */
    HI_U32		    u32FirstPts;/**<The first pts.*//**<CNcomment:��һ��PTS */
    HI_U32		    u32FirstValidPts;/**<The first valid pts.*//**<CNcomment:��һ����ЧPTS */
    HI_U32		    u32CurSrcPts;   /**<The current src pts.*//**<CNcomment:��ǰԭʼPTS */
    HI_U32		    u32CurPts;	    /**<The current pts.*//**<CNcomment:��ǰPTS */
    HI_U32		    u32LastSrcPts;  /**<The last src pts.*//**<CNcomment:��һ��ԭʼPTS */
    HI_U32		    u32LastPts;	    /**<The last pts.*//**<CNcomment:��һ��PTS */
}HI_UNF_SYNC_PTSJUMP_PARAM_S;

/**Defines the parameters of synchronization status change*/
/** CNcomment:����ͬ��״̬��������Ľṹ�� */
typedef struct hiUNF_SYNC_STAT_PARAM_S
{
     HI_S32	     s32VidAudDiff;	/**<The diffrence between video and audio frames*//**<CNcomment: ����Ƶ��ֵ */
     HI_S32	     s32VidPcrDiff;	/**<The diffrence between video frame and pcr*//**<CNcomment: ��ƵPCR��ֵ */
     HI_S32	     s32AudPcrDiff;	/**<The diffrence between audio frame and pcr*//**<CNcomment: ��ƵPCR��ֵ */
     HI_U32	     u32VidLocalTime;	/**<Local video synchronization reference time*//**<CNcomment: ��Ƶ����ʱ�� */
     HI_U32	     u32AudLocalTime;	/**<Local audio synchronization reference time*//**<CNcomment: ��Ƶ����ʱ�� */
     HI_U32	     u32PcrLocalTime;	/**<Local pcr synchronization reference time*//**<CNcomment: PCR����ʱ�� */
}HI_UNF_SYNC_STAT_PARAM_S;

/*Type of the event callback function*/
/**CNcomment: �¼��ص��������� */
typedef enum hiUNF_AVPLAY_EVENT_E
{
    HI_UNF_AVPLAY_EVENT_EOS,		       /**<The end of stream (EOS) operation is performed, NULL*//**<CNcomment: EOSִ�н���, NULL.*/
    HI_UNF_AVPLAY_EVENT_STOP,		       /**<The stop operation is performed, NULL*//**<CNcomment: STOPִ�н���, NULL.*/
    HI_UNF_AVPLAY_EVENT_RNG_BUF_STATE,	       /**<Status change of the media buffer queue, HI_UNF_AVPLAY_BUF_STATE_E*//**<CNcomment: ý�建�����״̬�仯, HI_UNF_AVPLAY_BUF_STATE_E.*/
    HI_UNF_AVPLAY_EVENT_NORM_SWITCH,	       /**<Standard switch, HI_UNF_NORMCHANGE_PARAM_S*//**<CNcomment: ��ʽ�л�, HI_UNF_NORMCHANGE_PARAM_S .*/
    HI_UNF_AVPLAY_EVENT_FRAMEPACKING_CHANGE,   /**<3D Frame packing change, HI_UNF_VIDEO_FRAME_PACKING_TYPE_E*//**<CNcomment: 3D֡���ͱ仯, HI_UNF_VIDEO_FRAME_PACKING_TYPE_E .*/
    HI_UNF_AVPLAY_EVENT_NEW_VID_FRAME,	       /**<New video frame, HI_UNF_VO_FRAMEINFO_S*//**<CNcomment: ����Ƶ֡, HI_UNF_VO_FRAMEINFO_S .*/
    HI_UNF_AVPLAY_EVENT_NEW_AUD_FRAME,	       /**<New audio frame, HI_UNF_AO_FRAMEINFO_S*//**<CNcomment: ����Ƶ֡, HI_UNF_AO_FRAMEINFO_S .*/
    HI_UNF_AVPLAY_EVENT_NEW_USER_DATA,	       /**<New video user data, HI_UNF_VIDEO_USERDATA_S*//**<CNcomment: ����Ƶ�û�����, HI_UNF_VIDEO_USERDATA_S .*/
    HI_UNF_AVPLAY_EVENT_GET_AUD_ES,	       /**<New audio ES data, HI_UNF_ES_BUF_S*//**<CNcomment: ����ƵES����, HI_UNF_ES_BUF_S .*/
    HI_UNF_AVPLAY_EVENT_IFRAME_ERR,	       /**<I frame decode error*//**<CNcomment: ����I֡���� .*/
    HI_UNF_AVPLAY_EVENT_SYNC_PTS_JUMP,	       /**<Pts Jump, HI_UNF_SYNC_PTSJUMP_PARAM_S * *//**<CNcomment: PTS����, HI_UNF_SYNC_PTSJUMP_PARAM_S * .*/
    HI_UNF_AVPLAY_EVENT_SYNC_STAT_CHANGE,      /**<Synchronization status change, HI_UNF_SYNC_STAT_PARAM_S * *//**<CNcomment: ͬ��״̬���, HI_UNF_SYNC_STAT_PARAM_S * .*/
    HI_UNF_AVPLAY_EVENT_VID_BUF_STATE,	       /**<Status change of the media buffer queue, HI_UNF_AVPLAY_EVENT_VID_BUF_STATE*//**<CNcomment: ��Ƶ�������״̬�仯, HI_UNF_AVPLAY_EVENT_VID_BUF_STATE */
    HI_UNF_AVPLAY_EVENT_AUD_BUF_STATE,	       /**<Status change of the media buffer queue, HI_UNF_AVPLAY_EVENT_AUD_BUF_STATE*//**<CNcomment: ��Ƶ�������״̬�仯, HI_UNF_AVPLAY_EVENT_AUD_BUF_STATE */
    HI_UNF_AVPLAY_EVENT_VID_UNSUPPORT,	       /**<The video stream is unsupport*//**<CNcomment: ��Ƶ������֧��*/
    HI_UNF_AVPLAY_EVENT_VID_ERR_RATIO,	       /**<frame error ratio *//**<CNcomment: ͼ��֡��������*/
    HI_UNF_AVPLAY_EVENT_AUD_INFO_CHANGE,       /**<audio info change, HI_UNF_ACODEC_STREAMINFO_S *//**<CNcomment: ��Ƶ��Ϣ�仯��HI_UNF_ACODEC_STREAMINFO_S*/
    HI_UNF_AVPLAY_EVENT_AUD_UNSUPPORT,	       /**<unsupported audio *//**<CNcomment: ��֧�ֵ���Ƶ*/
    HI_UNF_AVPLAY_EVENT_AUD_FRAME_ERR,	       /**<audio frame error *//**<CNcomment: ��Ƶ֡����*/
    HI_UNF_AVPLAY_EVENT_VID_ERR_TYPE,	       /**<the setting vid codec type is error, HI_UNF_VCODEC_TYPE_E*//**<CNcomment: ���õ���ƵЭ�����ʹ���, HI_UNF_VCODEC_TYPE_E*/
    HI_UNF_AVPLAY_EVENT_FIRST_FRAME_DISPLAYED, /**<the first deocded frame have been displayed out by the tv.*//**<CNcomment: ��һ֡�ѱ���ʾ*/
    HI_UNF_AVPLAY_EVENT_VID_ERR_FRAME,	       /**<vid frame decode error.*/ /**<CNcomment: ������Ƶ֡����*/
    HI_UNF_AVPLAY_EVENT_STATUS_REPORT,	       /**<avplay status info, HI_UNF_AVPLAY_STATUS_INFO_S*/ /**<CNcomment: ������״̬��Ϣ*/
    HI_UNF_AVPLAY_EVENT_VID_FRAME_INFO,	       /**<Video frame status info, HI_UNF_VIDEO_FRM_STATUS_INFO_S*/ /**<CNcomment: ��Ƶ֡״̬��Ϣ*/
    HI_UNF_AVPLAY_EVENT_BUTT
} HI_UNF_AVPLAY_EVENT_E;

/**Mode of processing the buffer overflow*/
/**CNcomment: ���������������	*/
typedef enum hiUNF_AVPLAY_OVERFLOW_E
{
    HI_UNF_AVPLAY_OVERFLOW_RESET,	       /**<Reset during overflow*//**<CNcomment: ���ʱ���и�λ	 */
    HI_UNF_AVPLAY_OVERFLOW_DISCARD,	       /**<Discard during overflow*//**<CNcomment: ���ʱ���ж���  */
    HI_UNF_AVPLAY_OVERFLOW_BUTT
} HI_UNF_AVPLAY_OVERFLOW_E;

/**Defines the type of the event callback function.*/
/**CNcomment: �����¼��ص�����ö������ */
typedef HI_S32 (*HI_UNF_AVPLAY_EVENT_CB_FN)(HI_HANDLE hAvplay, HI_UNF_AVPLAY_EVENT_E enEvent, HI_U32 u32Para);

/**Defines the type of the event callback function.*/
/**CNcomment: �����¼��ص�����ö������ */
typedef HI_S32 (*HI_UNF_AVPLAY_EVENT_CB_FN64)(HI_HANDLE hAvplay, HI_UNF_AVPLAY_EVENT_E enEvent, HI_VOID *pPara);

/**Defines the attribute of audio security.*/
/**CNcomment: ������Ƶ��ȫ���Խṹ��*/
typedef struct hiUNF_AVPLAY_AUD_SECURITY_ATTR_S
{
    HI_BOOL    bEnable; /**<Audio dmx channel is security mode or not*//**<CNcomment: ��ƵDMXͨ���Ƿ�Ϊ��ȫģʽ*/
}HI_UNF_AVPLAY_AUD_SECURITY_ATTR_S;

/**Defines the attribute ID of an AVPLAY.*/
/**CNcomment: ����AV����������IDö������ */
typedef enum hiUNF_AVPLAY_ATTR_ID_E
{
    HI_UNF_AVPLAY_ATTR_ID_STREAM_MODE = 0,  /**<Playing mode, HI_UNF_AVPLAY_ATTR_S*//**<CNcomment: ����ģʽ, HI_UNF_AVPLAY_ATTR_S.*/

    HI_UNF_AVPLAY_ATTR_ID_ADEC,		    /**<Audio attribute, HI_UNF_ACODEC_ATTR_S*//**<CNcomment: ��Ƶ����, HI_UNF_ACODEC_ATTR_S.*/
    HI_UNF_AVPLAY_ATTR_ID_VDEC,		    /**<Video attribute, HI_UNF_VCODEC_ATTR_S*//**<CNcomment: ��Ƶ����, HI_UNF_VCODEC_ATTR_S.*/

    HI_UNF_AVPLAY_ATTR_ID_AUD_PID,	    /**<Audio packet identifier (PID), HI_U32*//**<CNcomment: ��ƵPID, HI_U32.*/
    HI_UNF_AVPLAY_ATTR_ID_VID_PID,	    /**<Video PID, HI_U32*//**<CNcomment: ��ƵPID, HI_U32.*/
    HI_UNF_AVPLAY_ATTR_ID_PCR_PID,	    /**<PCR PID, HI_U32*//**<CNcomment: PCR PID, HI_U32.*/

    HI_UNF_AVPLAY_ATTR_ID_SYNC,		    /**<Synchronization attribute, HI_UNF_SYNC_ATTR_S*//**<CNcomment: ͬ������, HI_UNF_SYNC_ATTR_S.*/
    HI_UNF_AVPLAY_ATTR_ID_AFD,		    /**<Whether to enable the active format descriptor (AFD), HI_BOOL* *//**<CNcomment: AFD �Ƿ����� HI_BOOL * .*/
    HI_UNF_AVPLAY_ATTR_ID_OVERFLOW,	    /**<Overflow processing type, HI_UNF_AVPLAY_OVERFLOW_E* *//**<CNcomment: ����������� , HI_UNF_AVPLAY_OVERFLOW_E * .*/

    HI_UNF_AVPLAY_ATTR_ID_MULTIAUD,	    /**<Multiple audio attribute,  HI_UNF_AVPLAY_MULTIAUD_ATTR_S **//**<CNcomment: ����������, HI_UNF_AVPLAY_MULTIAUD_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_FRMRATE_PARAM,    /**<Frame Rate Parameter, HI_UNF_AVPLAY_FRMRATE_PARAM_S * *//**<CNcomment:֡�ʲ���,HI_UNF_AVPLAY_FRMRATE_PARAM_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_FRMPACK_TYPE,	    /**<3D Frame Packing Type, HI_UNF_VIDEO_FRAME_PACKING_TYPE_E * *//**<CNcomment:3D֡�Ĵ������,HI_UNF_VIDEO_FRAME_PACKING_TYPE_E * .*/
    HI_UNF_AVPLAY_ATTR_ID_LOW_DELAY,	    /**<Low Delay Attr, HI_UNF_AVPLAY_LOW_DELAY_ATTR_S * *//**<CNcomment: ����ʱ���� , HI_UNF_AVPLAY_LOW_DELAY_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_TVP,		    /**<Trusted Video Path Attr, HI_UNF_AVPLAY_TVP_ATTR_S * *//**<CNcomment: ��ȫ��Ƶͨ·���� , HI_UNF_AVPLAY_TVP_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_AD,		    /**<MS12 Attr, HI_UNF_AVPLAY_AD_ATTR_S * *//**<CNcomment: MS12ͨ·���� , HI_UNF_AVPLAY_AD_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_HDR,		    /**<HDR Attr, HI_UNF_AVPLAY_HDR_ATTR_S * *//**<CNcomment: HDRͨ·���� , HI_UNF_AVPLAY_HDR_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_AUD_SECURITY,	    /**<Dmx audio channel security mode, HI_UNF_AVPLAY_AUD_SECURITY_ATTR_S * *//**<CNcomment: ��Ƶ��ȫ���� , HI_UNF_AVPLAY_AUD_SECURITY_ATTR_S * .*/
    HI_UNF_AVPLAY_ATTR_ID_AD_PID,	    /**<AD program id*/ /**<CNcomment: AD��PID,HI_S32*/
    HI_UNF_AVPLAY_ATTR_ID_BUTT
} HI_UNF_AVPLAY_ATTR_ID_E;

/**Defines the stream type of HDR.*/
/**CNcomment: ����DOLBY HDR�������� */
typedef enum hiUNF_AVPLAY_HDR_STREAM_TYPE_E
{
    HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_SINGLE_VES = 0,	/**<Dolby Vision Dual layer Single VES Format*/ /**<CNcomment: ����˫���ʽ.*/
    HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_DUAL_VES,		/**<Dolby Vision Dual Layer Dual VES Format*/ /**<CNcomment: ˫��˫���ʽ.*/
    HI_UNF_AVPLAY_HDR_STREAM_TYPE_SL_VES,		/**<Dolby Vision Single Layer VES Format*/ /**<CNcomment: ���������ʽ.*/
    HI_UNF_AVPLAY_HDR_STREAM_TYPE_BUTT
} HI_UNF_AVPLAY_HDR_STREAM_TYPE_E;

/**Defines the attribute of low delay.*/
/**CNcomment: �������ʱ���Խṹ��*/
typedef struct hiUNF_AVPLAY_LOW_DELAY_ATTR_S
{
    HI_BOOL		  bEnable;  /**<Is low delay enable or not*//**<CNcomment: ����ʱ�Ƿ�ʹ��*/
}HI_UNF_AVPLAY_LOW_DELAY_ATTR_S;

/**Defines the attribute of trust video path.*/
/**CNcomment: ���尲ȫ��Ƶͨ·���Խṹ��*/
typedef struct hiUNF_AVPLAY_TVP_ATTR_S
{
    HI_BOOL		  bEnable;  /**<Is trusted video path enable or not*//**<CNcomment: ��ȫ��Ƶͨ·�Ƿ�ʹ��*/
}HI_UNF_AVPLAY_TVP_ATTR_S;

/**Defines the audio/video synchronization .*/
/**CNcomment: ��������Ƶͬ���������� */
typedef struct hiUNF_SYNC_REGION_S
{
    HI_S32		  s32VidPlusTime;	 /**<Plus time range during video synchronization*//**<CNcomment: ��Ƶͬ����ǰ��ʱ�䷶Χ */
    HI_S32		  s32VidNegativeTime;	 /**<Negative time range during video synchronization*//**<CNcomment: ��Ƶͬ������ʱ�䷶Χ */
    HI_BOOL		  bSmoothPlay;		 /**<Slow playing enable*//**<CNcomment: ����ʹ�� */
} HI_UNF_SYNC_REGION_S;

/**Defines the audio/video synchronization attributes.*/
/**CNcomment: ��������Ƶͬ������ */
typedef struct hiUNF_SYNC_ATTR_S
{
    HI_UNF_SYNC_REF_E	  enSyncRef;		 /**<Audio-based synchronization, PCR-based synchronization, and free playing without synchronization*//**<CNcomment: ��ƵΪ׼��PCRΪ׼�����ɲ��ŵ� */
    HI_UNF_SYNC_REGION_S  stSyncStartRegion;	 /**<Synchronization start region*//**<CNcomment: ͬ��������� */
    HI_UNF_SYNC_REGION_S  stSyncNovelRegion;	 /**<Synchronization exception region*//**<CNcomment: ͬ���쳣���� */
    HI_S32		  s32VidPtsAdjust;	 /**<Video presentation time stamp (PTS) adjustment*//**<CNcomment: ��ƵPTS���� */
    HI_S32		  s32AudPtsAdjust;	 /**<Audio PTS adjustment*//**<CNcomment: ��ƵPTS���� */

    HI_U32		  u32PreSyncTimeoutMs;	 /**<Pre-synchronization timeout, in ms*//**<CNcomment: Ԥͬ���ĳ�ʱʱ�䣬��λΪ���� */
    HI_BOOL		  bQuickOutput;		 /**<Fast output enable*//**<CNcomment: �������ʹ�� */
} HI_UNF_SYNC_ATTR_S;

/**Defines the playing attributes of an AVPLAY.*/
/**CNcomment: ����AV�������� */
typedef struct hiUNF_AVPLAY_ATTR_S
{
    HI_U32			 u32DemuxId;   /**<ID of the DEMUX used by an AVPLAY*//**<CNcomment: AVPLAY��ʹ�õ�DEMUX ID ������������ΪTSʱ��Ч */
    HI_UNF_AVPLAY_STREAM_ATTR_S	 stStreamAttr; /**<Stream attributes*//**<CNcomment: �������� */
} HI_UNF_AVPLAY_ATTR_S;

/**Defines the synchronization status when an AVPLAY is running.*/
/**CNcomment: ���岥��������״̬��Ϣ��ͬ��״̬��Ϣ���� */
typedef struct hiUNF_SYNC_STATUS_S
{
    HI_U32 u32FirstAudPts;    /**<PTS of the first audio frame*//**<CNcomment: ��һ����Ƶ֡ PTS .*/
    HI_U32 u32FirstVidPts;    /**<PTS of the first video frame*//**<CNcomment: ��һ����Ƶ֡ PTS .*/
    HI_U32 u32LastAudPts;     /**<PTS of the last audio frame*//**<CNcomment: ������ŵ�һ����Ƶ֡ PTS .*/
    HI_U32 u32LastVidPts;     /**<PTS of the last video frame*//**<CNcomment: ������ŵ�һ����Ƶ֡ PTS .*/
    HI_S32 s32DiffAvPlayTime; /**<Playing time difference between audio and video frames*//**<CNcomment: ����Ƶ ����ʱ�� .*/
    HI_U32 u32PlayTime;	      /**<Playing time*//**<CNcomment: ��ǰ�Ѳ���ʱ�� .*/
    HI_U32 u32LocalTime;      /**<Local synchronization reference time*//**<CNcomment: ����ͬ���ο�ʱ�� .*/
} HI_UNF_SYNC_STATUS_S;

/**Defines the status of a media buffer.*/
/**CNcomment:����ý�建������״̬��Ϣ */
typedef struct hiUNF_AVPLAY_BUF_STATUS_S
{
    HI_U32 u32BufId;		    /**<Media buffer ID*//**<CNcomment: ý�建�� ��ʶ */
    HI_U32 u32BufSize;		    /**<Media buffer size*//**<CNcomment: ý�建���С */
    HI_U32 u32BufRptr;		    /*Read pointer of the media buffer. This pointer is valid when TSs are being played.*//**<CNcomment: ý�建���ָ��,Ts����ʱ��Ч */
    HI_U32 u32BufWptr;		    /*Write pointer of the media buffer. This pointer is valid when TSs are being played.*//**<CNcomment: ý�建��дָ��,Ts����ʱ��Ч */
    HI_U32 u32UsedSize;		    /**<Used size of the media buffer*//**<CNcomment: ý�建����ʹ�ô�С */
    HI_U32 u32CurrentAvailableSize; /**<Current available size of the media buffer for HI_UNF_AVPLAY_GetBuf()*//**<CNcomment: ý�建���ʹ�ô�С */
    HI_U32 u32FrameBufTime;	    /**<Frame buffer time*//**<CNcomment: ֡����ʱ�� */
    HI_U32 u32FrameBufNum;	    /**<The number of frames in frame buffer*//**<CNcomment: ֡������Ŀ ��VIDEO��Ч */
    HI_BOOL bEndOfStream;	    /**<Flag to indicate end of stream*//**<CNcomment: ����������������ϱ�ʶ ��VIDEO��Ч */
} HI_UNF_AVPLAY_BUF_STATUS_S;

/**Defines the playing status of an AVPLAY.*/
/**CNcomment:����AV�Ĳ���״̬ */
typedef enum hiUNF_AVPLAY_STATUS_E
{
    HI_UNF_AVPLAY_STATUS_STOP = 0,  /**<Stop*/	    /**<CNcomment: ֹͣ */
    HI_UNF_AVPLAY_STATUS_PREPLAY,   /**<Buffer*/    /**<CNcomment: ���� */
    HI_UNF_AVPLAY_STATUS_PLAY,	    /**<Play*/	    /**<CNcomment: ���� */
    HI_UNF_AVPLAY_STATUS_TPLAY,	    /**<Trick play, such as fast forward and rewind*/	/**<CNcomment: TPlay, ������� */
    HI_UNF_AVPLAY_STATUS_PAUSE,	    /**<Pause*/	    /**<CNcomment: ��ͣ */
    HI_UNF_AVPLAY_STATUS_EOS,	    /**<EOS*/	    /**<CNcomment: �������Ž��� */
    HI_UNF_AVPLAY_STATUS_SEEK ,	    /**<Seek play*/ /**<CNcomment: ��λ���� */

    HI_UNF_AVPLAY_STATUS_BUTT
} HI_UNF_AVPLAY_STATUS_E;

/**Defines the output value after the playing status of an AVPLAY is queried.*/
/**CNcomment:����AV����״̬��ѯ���ֵ���� */
typedef struct hiUNF_AVPLAY_STATUS_INFO_S
{
    HI_UNF_SYNC_STATUS_S       stSyncStatus;	  /**<Synchronization status*//**<CNcomment: ͬ��״̬ */
    HI_UNF_AVPLAY_STATUS_E     enRunStatus;	  /**<Running status*//**< CNcomment:����״̬ */
    HI_U32		       u32VidFrameCount;  /**<Count of played video frames*//**<CNcomment: ��Ƶ�Ѳ���֡�� */
    HI_U32		       u32AuddFrameCount; /**<Count of played audio frames*//**<CNcomment: ��Ƶ�Ѳ���֡�� */
    HI_UNF_AVPLAY_BUF_STATUS_S stBufStatus[HI_UNF_AVPLAY_BUF_ID_BUTT]; /**<Status of the media buffer*//**<CNcomment:ý�建��״̬ */
    HI_U32		       u32VidErrorFrameCount; /**<Number of error frames during video decoding*/ /**<CNcomment: ��Ƶ�������֡�� */
} HI_UNF_AVPLAY_STATUS_INFO_S;

/**Defines the information about the playing program streams to be queried.*/
/**CNcomment: ���岥�Ž�Ŀ����ѯ��Ϣ���� */
typedef struct hiUNF_AVPLAY_STREAM_INFO_S
{
    HI_UNF_VCODEC_STREAMINFO_S stVidStreamInfo; /**<Video stream information*//**<CNcomment:��Ƶ����Ϣ */
    HI_UNF_ACODEC_STREAMINFO_S stAudStreamInfo; /**<Audio stream information*//**<CNcomment:��Ƶ����Ϣ */
} HI_UNF_AVPLAY_STREAM_INFO_S;

/**Defines the information about an I frame.*//**CNcomment:����I֡������Ϣ���� */
typedef struct hiUNF_AVPLAY_I_FRAME_S
{
    HI_U8		 *pu8Addr;    /**<User-state virtual address of a frame*//**<CNcomment:֡�����û�̬�����ַ */
    HI_U32		 u32BufSize; /**<Frame size, in byte*//**<CNcomment:֡���ݴ�С����λ�ֽ� */
    HI_UNF_VCODEC_TYPE_E enType;     /*Protocol type of a data segment*//**<CNcomment:��Ƭ���ݵ�Э������ */
} HI_UNF_AVPLAY_I_FRAME_S;

/**Defines the decoder type. The occupied memory varies according to decoders.*/
/**CNcomment:������������� ��ͬ���͵Ľ�����ռ���ڴ治ͬ */
typedef enum hiHI_UNF_VCODEC_DEC_TYPE_E
{
    HI_UNF_VCODEC_DEC_TYPE_NORMAL,	      /**<Normal type.*//**<CNcomment:��ͨ���� */

    /**<I frame decoding type. If an AVPLAY is used to decode I frames only (HI_UNF_AVPLAY_DecodeIFrame), you can select this type to reduce the memory usage.*/
    /**<CNcomment:I֡�������� ���avplay������I֡����(HI_UNF_AVPLAY_DecodeIFrame) ����Ϊ�����Ϳ��Խ�ʡ�ڴ� */
    HI_UNF_VCODEC_DEC_TYPE_ISINGLE,

    HI_UNF_VCODEC_DEC_TYPE_BUTT
}HI_UNF_VCODEC_DEC_TYPE_E;

/**Defines the level of the protocol supported by the decoder. This value affects the number of frame buffers allocated by the normal decoder.
The greater the value, the more the required frame buffers.*/
/**CNcomment:���������֧�ֵ�Э�鼶�� Ӱ��NORMAL���ͽ����������֡����� ֵԽ����Ҫ��֡����ĿԽ�� */
typedef enum hiHI_UNF_VCODEC_PRTCL_LEVEL_E
{
    HI_UNF_VCODEC_PRTCL_LEVEL_MPEG = 0,	    /**<Protocols excluding the H.264 protocol*//**<CNcomment:��h264�������Э�� */
    HI_UNF_VCODEC_PRTCL_LEVEL_H264 = 1,	    /**<H.264 protocol and other protocols*//**<CNcomment:h264Э�� */
    HI_UNF_VCODEC_PRTCL_LEVEL_MVC,
    HI_UNF_VCODEC_PRTCL_LEVEL_BUTT
}HI_UNF_VCODEC_PRTCL_LEVEL_E;

/**Defines the attributes when an AVPLAY enables the video decoder. The settings affect the memory occupied by the video decoder and decoding performance.*/
/**CNcomment:����AV����������Ƶ������ʱ�������ýṹ�� Ӱ����Ƶ������ռ���ڴ��С���������� */
typedef struct hiHI_UNF_AVPLAY_OPEN_OPT_S
{
    HI_UNF_VCODEC_DEC_TYPE_E	enDecType;	 /**<Decoder type.*//**<CNcomment:����������*/
    HI_UNF_VCODEC_CAP_LEVEL_E	enCapLevel;	 /**<Maximum resolution supported by the decoder. This value affects the size of each frame buffer.*//**<CNcomment:������֧�ֵ����ֱ��� Ӱ��ÿ��֡��Ĵ�С */
    HI_UNF_VCODEC_PRTCL_LEVEL_E enProtocolLevel; /**<Supported protocol level. This value affects the number of frame buffers.*//**<CNcomment:֧�ֵ�Э�鼶�� Ӱ��֡����Ŀ */
}HI_UNF_AVPLAY_OPEN_OPT_S;

/**Defines the attribute of MS12.*/
/**CNcomment: ������ƵMS12���Խṹ��*/
typedef struct hiUNF_AVPLAY_AD_ATTR_S
{
    HI_BOOL		bAdEnble;	/**<whether enable ad service (on/off)*/ /**<CNcomment: �Ƿ�ʹ��AD.*/
    HI_BOOL		bAdToSomePort;	/**<whether enable ad only to some port,such as speaker/headphone etc*/ /**<CNcomment: �Ƿ�ʹ�����������������Ĭ��Ϊfalse.*/
    HI_U32		u32AdPid;	/**<AD program id*/ /**<CNcomment: AD��PID.*/
    HI_S16		s16AdBalance;	/**<AD Balance*/ /**<CNcomment: AD����.*/
} HI_UNF_AVPLAY_AD_ATTR_S;

/**Defines the attribute of HDR.*/
/**CNcomment: ����HDR���Խṹ��*/
typedef struct hiUNF_AVPLAY_HDR_ATTR_S
{
    HI_BOOL			      bEnable;		/**<Is Dolby HDR enable or not*/ /**<CNcomment: Dolby HDR�Ƿ�ʹ��.*/
    HI_UNF_AVPLAY_HDR_STREAM_TYPE_E   enHDRStreamType;	/**<Dolby Vision VES Format*/ /**<CNcomment: Dolby HDR������.*/
    HI_UNF_VCODEC_TYPE_E	      enElType;		/**<Video encoding type*/ /**<CNcomment: EL��Ƶ��������*/
    HI_UNF_AVPLAY_OPEN_OPT_S	      stElCodecOpt;	/**<Video decoding option*/ /**<CNcomment: ��Ƶ��������������*/
    HI_BOOL			      bCompatible;	/**<Dolby frame is compatible or not.*/ /**<CNcomment: Dolby֡�Ƿ����.*/
} HI_UNF_AVPLAY_HDR_ATTR_S;

/**Defines the video display mode after an AVPLAY is stopped.*/
/**CNcomment:����AV������ֹͣʱ��Ƶ��ʾģʽ */
typedef enum hiUNF_AVPLAY_STOP_MODE_E
{
    HI_UNF_AVPLAY_STOP_MODE_STILL = 0,	/**<The last frame is still after an AVPLAY is stopped.*//**<CNcomment:stop�������һ֡ */
    HI_UNF_AVPLAY_STOP_MODE_BLACK = 1,	/**<The blank screen is displayed after an AVPLAY is stopped.*//**<CNcomment:stop����� */
    HI_UNF_AVPLAY_STOP_MODE_BUTT
} HI_UNF_AVPLAY_STOP_MODE_E;


/**Defines the attributes when an AVPLAY is prestarted.*/
/**CNcomment:����AV������Ԥ����ʱ�������ýṹ�� */
typedef struct hiAVPLAY_PRESTART_OPT_S
{
    HI_U32	 u32Reserved;
} HI_UNF_AVPLAY_PRESTART_OPT_S;

/**Defines the attributes when an AVPLAY is started.*/
/**CNcomment:����AV����������ʱ�������ýṹ�� */
typedef struct hiAVPLAY_START_OPT_S
{
    HI_U32	 u32Reserved;
} HI_UNF_AVPLAY_START_OPT_S;

/**Defines the attributes when an AVPLAY is prestoped.*/
/**CNcomment:����AV������Ԥֹͣʱ�������ýṹ�� */
typedef struct hiAVPLAY_PRESTOP_OPT_S
{
    HI_U32	 u32Reserved;
} HI_UNF_AVPLAY_PRESTOP_OPT_S;


/**Defines the attributes when an AVPLAY is stopped.*/
/**CNcomment:����AV������ֹͣʱ�������ýṹ�� */
typedef struct hiAVPLAY_STOP_OPT_S
{
    /*
	 s32Timeout: end of stream timeout
	 s32Timeout = 0	  Wait until streams are played in non-block mode, that is, the interface is returned immediately. CNcomment:�������ȴ��������Ž������������� CNend
	 s32Timeout > 0	  Block timeout, in ms, CNcomment:������ʱʱ�䣬��λΪ���� CNend
	 s32Timeout = -1  Infinite wait,CNcomment:���޵ȴ� CNend
     */
    HI_U32		      u32TimeoutMs;    /**<Timeout*//**<CNcomment:��ʱֵ */
    HI_UNF_AVPLAY_STOP_MODE_E enMode;	       /**<Video display mode*//**<CNcomment:��Ƶ��ʾģʽ */
} HI_UNF_AVPLAY_STOP_OPT_S;

/*Defines the attributes when an AVPLAY is paused.*/
/**CNcomment:����AV��������ͣʱ�������ýṹ�� */
typedef struct hiAVPLAY_PAUSE_OPT_S
{
    HI_U32	 u32Reserved;
} HI_UNF_AVPLAY_PAUSE_OPT_S;

/**Defines the direction of tplay*/
/**CNcomment:����AV������TPLAY�ķ��� */
typedef enum hiUNF_AVPLAY_TPLAY_DIRECT_E
{
    HI_UNF_AVPLAY_TPLAY_DIRECT_FORWARD,	    /**<Tplay forward*//**<CNcomment: ��ǰTPLAY. */
    HI_UNF_AVPLAY_TPLAY_DIRECT_BACKWARD,    /**<Tplay backward*//**<CNcomment: ���TPLAY. */
    HI_UNF_AVPLAY_TPLAY_DIRECT_BUTT

} HI_UNF_AVPLAY_TPLAY_DIRECT_E;

/**Defines the attributes when the playing mode of an AVPLAY is tplay.*/
/**CNcomment:����AV������TPALYʱ�������ýṹ�� */
typedef struct hiAVPLAY_TPLAY_OPT_S
{
    HI_UNF_AVPLAY_TPLAY_DIRECT_E    enTplayDirect;	/**<Tplay direction*//**<CNcomment: TPLAY���� */
    HI_U32			    u32SpeedInteger;	/**<Integral part of tplay speed*//**<CNcomment: TPLAY�������������� */
    HI_U32			    u32SpeedDecimal;	/**<Fractional part (calculated to three decimal places) of tplay speed*//**<CNcomment: TPLAY������С�����֣�����3λС�� */
} HI_UNF_AVPLAY_TPLAY_OPT_S;

/**Defines the attributes when an AVPLAY is resumed.*/
/**CNcomment:����AV�������ָ�ʱ�������ýṹ�� */
typedef struct hiAVPLAY_RESUME_OPT_S
{
    HI_U32	 u32Reserved;
} HI_UNF_AVPLAY_RESUME_OPT_S;

/**Defines the attributes when an AVPLAY is reset.*/
/**CNcomment:����AV��������λʱ�������ýṹ�� */
typedef struct hiAVPLAY_RESET_OPT_S
{
    HI_U32	  u32SeekPtsMs;	  /**<clear these datas which pts is smaller than u32SeekPtsMs in buffer *//**<CNcomment:���buffer��u32SeekPtsMs֮ǰ������ */
} HI_UNF_AVPLAY_RESET_OPT_S;

/**Defines the attributes when an AVPLAY is step.*/
/**CNcomment:����AV����������ʱ�������ýṹ�� */
typedef struct hiUNF_AVPLAY_STEP_OPT_S
{
    HI_U32	 u32Reserved;
}HI_UNF_AVPLAY_STEP_OPT_S;

/**Defines the attributes when an AVPLAY is in Flushing Stream Status.*/
/**CNcomment:����AV������Flush Streamʱ�������ýṹ�� */
typedef struct hiUNF_AVPLAY_FLUSH_STREAM_OPT_S
{
    HI_U32	    u32Reserved;
}HI_UNF_AVPLAY_FLUSH_STREAM_OPT_S;

/**Defines the attributes of multiple audio.*/
/**CNcomment:������������Խṹ�� */
typedef struct hiUNF_AVPLAY_MULTIAUD_ATTR_S
{
    HI_U32		    u32PidNum;	    /**<the number of Audio PID *//**< CNcomment:��ƵPID���� */
    HI_U32		    *pu32AudPid;    /**<Pointer to the array of audio PID*//**< CNcomment:ָ��PID�����ָ�� */
    HI_UNF_ACODEC_ATTR_S    *pstAcodecAttr; /**<Pointer to the array of audio attribute*//**< CNcomment:ָ����Ƶ���������ָ�� */
}HI_UNF_AVPLAY_MULTIAUD_ATTR_S;

/**Defines the source of frame rate.*/
/**CNcomment: ����֡����Դ���͵�ö�� */
typedef enum hiUNF_AVPLAY_FRMRATE_TYPE_E
{
    HI_UNF_AVPLAY_FRMRATE_TYPE_PTS,	    /**<Use the frame rate calculates from PTS*//**<CNcomment: ����PTS����֡�� */
    HI_UNF_AVPLAY_FRMRATE_TYPE_STREAM,	    /**<Use the frame rate comes from stream*//**<CNcomment: ����������Ϣ�е�֡�� */
    HI_UNF_AVPLAY_FRMRATE_TYPE_USER,	    /**<Use the frame rate set by user*//**<CNcomment: �����û����õ�֡�� */
    HI_UNF_AVPLAY_FRMRATE_TYPE_USER_PTS,    /**<Use the frame rate set by user until the 2nd I frame comes, then use the frame rate calculates from PTS*//**<CNcomment: �ڶ���I֡��֮ǰ�����û����õ�֡�ʣ�֮�����PTS����֡�� */
    HI_UNF_AVPLAY_FRMRATE_TYPE_BUTT
}HI_UNF_AVPLAY_FRMRATE_TYPE_E;

/**Defines the parameter of frame rate.*/
/**CNcomment: ����֡�����Բ����Ľṹ�� */
typedef struct hiUNF_AVPLAY_FRMRATE_PARAM_S
{
    HI_UNF_AVPLAY_FRMRATE_TYPE_E    enFrmRateType;  /**<The source of frame rate*//**<CNcomment: ֡����Դ���� */
    HI_UNF_VCODEC_FRMRATE_S	    stSetFrmRate;   /**<Setting frame rate*//**<CNcomment: ���õ�֡�� */
}HI_UNF_AVPLAY_FRMRATE_PARAM_S;

/**Defines commond to get vdec information, the parameter is HI_UNF_AVPLAY_VDEC_INFO_S.*/
/**CNcomment: ��ȡ��������Ϣ���������Ӧ����ΪHI_UNF_AVPLAY_VDEC_INFO_S */
#define HI_UNF_AVPLAY_GET_VDEC_INFO_CMD		0x20
/**Defines commond to set TPLAY parameter, the parameter is HI_UNF_AVPLAY_TPLAY_OPT_S.*/
/**CNcomment: ����TPLAY�������������Ӧ����ΪHI_UNF_AVPLAY_TPLAY_OPT_S*/
#define HI_UNF_AVPLAY_SET_TPLAY_PARA_CMD	0x21
/**Defines commond to set special control information of stream, the parameter is HI_UNF_AVPLAY_CONTROL_INFO_S*/
/**CNcomment: ��������һЩ���������������Ϣ��������Ӧ����ΪHI_UNF_AVPLAY_CONTROL_INFO_S*/
#define HI_UNF_AVPLAY_SET_CTRL_INFO_CMD		0x22

/**Defines commond to set video sample type, HI_BOOL *, HI_TRUE: force Progressive, HI_FALSE: auto recognise Progressive or Interlance */
/**CNcomment: ������Ƶ������Ϣ, HI_TRUE: ǿ������, HI_FALSE: �Զ�ʶ�������*/
#define HI_UNF_AVPLAY_SET_PROGRESSIVE_CMD	0x23

/**Defines commond to set video color space, the parameter is HI_UNF_COLOR_SPACE_E*/
/**CNcomment: ������Ƶɫ�ʿռ�, ������Ӧ����ΪHI_UNF_COLOR_SPACE_E*/
#define HI_UNF_AVPLAY_SET_COLORSPACE_CMD	0x24

/**Defines commond to set dpb full control, HI_BOOL* ,HI_TRUE:force delete min poc frame when dpb is full,HI_FALSE:return error when dpb is full*/
/**CNcomment:����dpb����ʱ��Ĵ�������, ������Ӧ����ΪHI_BOOL*/
#define HI_UNF_AVPLAY_SET_DPBFULL_CTRL_CMD	0x25

/***fix	 videophone scene by AVPLAY ,  format MJPEG**/
#define HI_UNF_AVPLAY_SET_SCENE_MODE_CMD	0x26

/**Defines the mode of videophone.*/
/**CNcomment: ����Videophone �������͵�ö�� */
typedef enum hiUNF_AVPLAY_SCENE_MODE_E
{
   HI_UNF_AVPLAY_SCENE_MODE_NORMAL,	/**<Normal scene of non-voip*//**<CNcomment: �ǿ��ӵ��ӳ��� */
   HI_UNF_AVPLAY_SCENE_MODE_VIDEOPHONE_PREVIEW,	  /**<Voip scene of the local end*//**<CNcomment: ���ӵ绰���˳��� */
   HI_UNF_AVPLAY_SCENE_MODE_VIDEOPHONE_REMOTE,	 /**<Voip scene of the remote end*//**<CNcomment: ���ӵ绰Զ�˳��� */
   HI_UNF_AVPLAY_SCENE_MODE_BUTT,
} HI_UNF_AVPLAY_SCENE_MODE_E;


/**Defines the type of AVPLAY invoke.*/
/**CNcomment: ����AVPLAY Invoke�������͵�ö�� */
typedef enum hiUNF_AVPLAY_INVOKE_E
{
    HI_UNF_AVPLAY_INVOKE_ACODEC	 = 0,	/**<Invoke commond to control audio codec*//**<CNcomment: ������Ƶ��������Invoke���� */
    HI_UNF_AVPLAY_INVOKE_VCODEC,	/**<Invoke commond to control video codec, HI_CODEC_VIDEO_CMD_S*//**<CNcomment: ������Ƶ��������Invoke���� */
    HI_UNF_AVPLAY_INVOKE_GET_PRIV_PLAYINFO, /**<Invoke commond to get private play infomation,the parameter is HI_UNF_AVPLAY_PRIVATE_STATUS_INFO_S*//**<CNcomment: ��ȡ˽�в�����Ϣ��Invoke���ã� ����ΪHI_UNF_AVPLAY_PRIVATE_STATUS_INFO_S * */
    HI_UNF_AVPLAY_INVOKE_SET_DISP_OPTIMIZE_FLAG, /**Defines commond to set Display Optimize Flag, The Parameter is HI_U32, 1: Enable, 0: Disable */
    HI_UNF_AVPLAY_INVOKE_GET_GLOBAL_PLAYINFO,	/**<Get global play information of avplay*//**<CNcomment: ��ȡAVPLAYȫ�ֲ�����Ϣ */
    HI_UNF_AVPLAY_INVOKE_SET_SYNC_MODE,	 /**<Invoke commond to set sync mode, HI_U32, 0 normal sync, 1 use sync replace frc*//**<CNcomment: ����ͬ��ģʽ��HI_U32��0: ����ģʽ, 1: ʹ��ͬ�����֡��ת��*/
    HI_UNF_AVPLAY_INVOKE_BUTT
} HI_UNF_AVPLAY_INVOKE_E;

/**Defines the decoding information of video codec.*/
/**CNcomment: ����VDEC������Ϣ�Ľṹ�� */
typedef struct hiUNF_AVPLAY_VDEC_INFO_S
{
    HI_U32		    u32DispFrmBufNum;	/**<the number of display frame*//**<CNcomment: ��ʾ֡����� */
    HI_U32		    u32FieldFlag;	/**<The encoding mode of image, 0 frame mode, 1 filed mode*//**<CNcomment: ͼ����뷽ʽ, 0 ֡ģʽ��1 ��ģʽ */
    HI_UNF_VCODEC_FRMRATE_S stDecFrmRate;      /**<decoding frame rate*//**<CNcomment: ����֡�� */
    HI_U32		    u32UndecFrmNum;	/**<the number of undecoded frame*//**<CNcomment: δ����֡���� */
}HI_UNF_AVPLAY_VDEC_INFO_S;

/**Defines the private status information.*/
/**CNcomment: ����AVPLAY˽��״̬��Ϣ */
typedef struct hiUNF_AVPLAY_PRIVATE_STATUS_INFO_S
{
    HI_U32 u32LastPts;	 /**<PTS of the last audio or video frame*/ /**<CNcomment: ������ŵ�һ����Ƶ֡ PTS����ƵPTS*/
    HI_U32 u32LastPlayTime; /**< PlayTime of the last audio or video frame */ /**<CNcomment: ������ŵ�һ����Ƶ֡ PlayTime����PlayTime	*/
    HI_U32 u32DispOptimizeFlag; /**<Display Optimize Flag,1: Enable, 0: Disable*//**<CNcomment: ��ʾ�Ż���־*/
} HI_UNF_AVPLAY_PRIVATE_STATUS_INFO_S;

/**Defines the special control information of stream.*/
/**CNcomment: �������������Ϣ */
typedef struct hiUNF_AVPLAY_CONTROL_INFO_S
{
    HI_U32 u32IDRFlag;		     /**<IDR frame Flag, 1 means IDR(instantaneous decoding refresh) frame.*/ /**<CNcomment: �Ƿ���IDR(��֡ǰ���޲ο���ϵ)֡��1��ʾ��*/
    HI_U32 u32BFrmRefFlag;	     /**<Whether B frame is refer frame, 1 means B frame is refer frame.*/ /**<CNcomment: B֡�Ƿ��ǲο�֡��1��ʾ��*/
    HI_U32 u32ContinuousFlag;	     /**<Whether send frame is continusous. 1 means continusous*/ /**<CNcomment: ֡�Ƿ�������1��ʾ����*/
    HI_U32 u32BackwardOptimizeFlag;  /**<The Backward Optimize Flag*//**<CNcomment: �����Ż�ʹ�ܱ�־.*/
    HI_U32 u32DispOptimizeFlag;	     /**<Display Optimize Flag,1: Enable, 0: Disable*//**<CNcomment: ��ʾ�Ż���־*/
}HI_UNF_AVPLAY_CONTROL_INFO_S;

/**Defines the parameter when the stream is send by HI_UNF_AVPLAY_PutBufEx.*/
/**CNcomment: ���尴PutBufExģʽ�������Ĳ����ṹ�� */
typedef struct hiUNF_AVPLAY_PUTBUFEX_OPT_S
{
    HI_BOOL bEndOfFrm;	    /**<whether this package of stream is the end of one frame*//**<CNcomment: �ð������Ƿ�Ϊһ֡�����һ�� */
    HI_BOOL bContinue;	    /**<whether this package of stream is contnued with the last package*//**<CNcomment: �ð������Ƿ���֮ǰ���� */
}HI_UNF_AVPLAY_PUTBUFEX_OPT_S;

typedef struct hiUNF_AVPLAY_GLOBAL_PLAY_INFO_S
{
    HI_U32 u32ContentCount;
} HI_UNF_AVPLAY_GLOBAL_PLAY_INFO_S;

typedef struct hiUNF_AVPLAY_VIDEO_FRAME_INFO_S
{
    HI_U32				u32Width;	    /**<Width of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32Height;	    /**<Height of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32AspectWidth;	    /**<aspect ratio: width*/ /**<CNcomment:���߱�֮��ֵ */
    HI_U32				u32AspectHeight;    /**<aspect ratio: height*/ /**<CNcomment:���߱�֮��ֵ */
    HI_U32				u32fpsInteger;	   /**<Integral part of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ���������, fps */
    HI_U32				u32fpsDecimal;	   /**<Fractional part (calculated to three decimal places) of the frame rate (in frame/s)*/
    HI_BOOL				bProgressive;	    /**<Sampling type (progressive or interlaced)*/ /**<CNcomment: ������ʽ(����/����) */
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E	enFramePackingType; /**<3D frame packing type*/
} HI_UNF_AVPLAY_VIDEO_FRAME_INFO_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     AVPLAY */
/** @{ */  /** <!-- [AVPLAY] */

/**
\brief Initializes the AVPLAY module.CNcomment:��ʼ��AVPLAYģ�� CNend
\attention \n
Before calling ::HI_UNF_AVPLAY_Create to create an AVPLAY, you must call this application programming interface (API).
CNcomment �ڵ���AVPLAYģ�������ӿ�ǰ��Ҫ�����ȵ��ñ��ӿ� CNend
\param	N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NOT_EXIST There is no AVPLAY. CNcomment:AVPLAY�豸������ CNend
\retval ::HI_ERR_AVPLAY_NOT_DEV_FILE  The file is not an AVPLAY file. CNcomment:AVPLAY���豸 CNend
\retval ::HI_ERR_AVPLAY_DEV_OPEN_ERR  An AVPLAY fails to be started. CNcomment:AVPLAY��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Init(HI_VOID);

/**
\brief Deinitializes the AVPLAY module. CNcomment:ȥ��ʼ��AVPLAYģ�� CNend
\attention \n
Please call this API function, before call anyother API of AVPLAY module.
CNcomment: �ڵ���::HI_UNF_AVPLAY_Destroy�ӿ��������еĲ������󣬵��ñ��ӿ� CNend
\param N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT  The operation is invalid.	CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_AVPLAY_DEV_CLOSE_ERR  An AVPLAY fails to be stopped. CNcomment:AVPLAY�ر�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_DeInit(HI_VOID);

/**
\brief Get video frame info. CNcomment:��ȡ��Ƶ֡��Ϣ CNend
\attention \n
\param[out] pstVideoFrameInfo  Pointer to video frame info. For details, see the description of ::HI_UNF_AVPLAY_VIDEO_FRAME_INFO_S. CNcomment:ָ�����ͣ���Ƶ֡��Ϣ����μ�::HI_UNF_AVPLAY_VIDEO_FRAME_INFO_S. CNend
\param[in] hAvplay    AVPLAY handle . CNcomment:AVPLAY��� . CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR  The pointer is null.	CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_FAILURE  Failure. CNcomment:ʧ��. CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetVideoFrameInfo(HI_HANDLE hAvplay, HI_UNF_AVPLAY_VIDEO_FRAME_INFO_S *pstVideoFrameInfo);

/**
\brief Obtains the default configuration of an AVPLAY. CNcomment:��ȡȱʡ��AV�������� CNend
\attention \n
When calling this API to set the enCfg parameter, you must enter correct mode of the player to be created.\n
It is recommended that you call this API to obtain the default AVPLAY attributes before creating an AVPLAY. This avoids creation failures due to incomplete or incorrect parameters.
CNcomment:���ñ��ӿ�����enCfg����ʱ������ȷ������Ҫ����������ģʽ\n
����AV������ǰ������ñ��ӿڣ���ȡ��AV������Ĭ�����ԣ����ⴴ��AV������ʱ���ڲ�����ȫ����������²������������ɹ����� CNend
\param[out] pstAvAttr  Pointer to AVPLAY attributes. For details, see the description of ::HI_UNF_AVPLAY_ATTR_S. CNcomment: ָ�����ͣ�AV�������ԣ���μ�::HI_UNF_AVPLAY_ATTR_S. CNend
\param[in] enCfg       AVPLAY type. For details, see the description of ::HI_UNF_AVPLAY_STREAM_TYPE_E. CNcomment: AV���ŵ����ͣ���μ�::HI_UNF_AVPLAY_STREAM_TYPE_E. CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetDefaultConfig(HI_UNF_AVPLAY_ATTR_S *pstAvAttr, HI_UNF_AVPLAY_STREAM_TYPE_E enCfg);

/**
\brief Registers a dynamic audio decoding library. CNcomment:ע����Ƶ��̬����� CNend
\attention \n
\param[in] pFileName Name of the file in the audio decoding library CNcomment:��Ƶ������ļ��� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR  The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RegisterAcodecLib(const HI_CHAR *pFileName);

/**
\brief Registers a dynamic video decoding library. CNcomment:ע����Ƶ��̬����� CNend
\attention \n
\param[in] pFileName Name of the file in the video decoding library CNcomment:��Ƶ������ļ��� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR  The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RegisterVcodecLib(const HI_CHAR *pFileName);

/**
\brief Searches for registered dynamic audio decoding libraries based on the audio format.
CNcomment:������Ƶ��ʽ, ����ע����Ƶ��̬����� CNend
\attention \n
\param[in] enFormat Audio format CNcomment:��Ƶ��ʽ CNend
\param[out] penDstCodecID If an audio decoding library is found, its codec ID is returned.
CNcomment:�ɹ��򷵻���Ƶ�����CodecID CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_FoundSupportDeoder(const HA_FORMAT_E enFormat,HI_U32 * penDstCodecID);


/**
\brief Sets private commands for a dynamic audio decoding library. These commands are used to call ha_codec.
CNcomment:����˽���������Ƶ��̬�����, ����ha_codec ����  CNend
HI_HA_ERRORTYPE_E (*DecSetConfig)(HI_VOID * hDecoder, HI_VOID * pstConfigStructure);
\attention \n
\param[in] enDstCodecID	 The audio Codec ID  CNcomment:��Ƶ�����ID CNend
\param[in] pPara  Attribute structure CNcomment:���Խṹ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR  The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_ConfigAcodec(const HI_U32 enDstCodecID, HI_VOID *pPara);

/**
\brief Creates an AVPLAY. CNcomment:����AV������ CNend
\attention \n
Note the following point when setting the input parameter pstAttr: The stream source can be HI_UNF_AVPLAY_STREAM_TYPE_ES (ESs input from the memory) or HI_UNF_AVPLAY_STREAM_TYPE_TS (ESs input from the memory and TSs input from the Tuner).
CNcomment:�������Բ���pstAttr���м�����Ҫע�⣺����Դ֧��HI_UNF_AVPLAY_STREAM_TYPE_ES���ڴ�����ES������HI_UNF_AVPLAY_STREAM_TYPE_TS���ڴ�����TS����TUNER����TS ����CNend
\param[in]  pstAvAttr	Pointer to AVPLAY attributes. For details, see the description of ::HI_UNF_AVPLAY_ATTR_S. CNcomment:ָ�����ͣ�AV�������ԣ���μ�::HI_UNF_AVPLAY_ATTR_S. CNend
\param[out] phAvplay	Pointer to the handle of a created AVPLAY.CNcomment:ָ�����ͣ�������AV���ž�� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_CREATE_ERR	 The AVPLAY fails to be created. CNcomment:AVPLAY����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Create(const HI_UNF_AVPLAY_ATTR_S *pstAvAttr, HI_HANDLE *phAvplay);

/**
\brief Destroys an AVPLAY. CNcomment:����AV������ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Destroy(HI_HANDLE hAvplay);

/**
\brief Sets the attributes of an AVPLAY. CNcomment:����AV�������� CNend
\attention \n
You can set the audio/video PID, audio/video decoding type, and synchronization mode by calling this API.\n
Different attribute IDs correspond to different data types. For details, see the Note part of HI_UNF_AVPLAY_ATTR_ID_E. The attribute types of the pPara and enAttrID parameters must be the same.\n
Before setting HI_UNF_AVPLAY_ATTR_ID_ADEC (audio decoding attribute) and HI_UNF_AVPLAY_ATTR_ID_VDEC (video decoding attribute),\n
you must disable the audio channel or video channel. The new attributes take effect when you enable the audio channel or video channel again.
CNcomment:���ñ��ӿڿ�ʵ����������ƵPID����������Ƶ�������͡�����ͬ����ʽ�ȹ���\n
��ͬ������ID��Ӧ�Ľṹ����μ��ṹ��HI_UNF_AVPLAY_ATTR_ID_E��[ע��], pPara����Ҫ��enAttrID��Ӧ�����Խṹ�����ͱ���һ��\n
����Ҫ����HI_UNF_AVPLAY_ATTR_ID_ADEC(��Ƶ��������),HI_UNF_AVPLAY_ATTR_ID_VDEC(��Ƶ��������)ʱ\n
��Ҫ�ȹر���Ƶ����Ƶͨ���������������ԣ�Ȼ�������´���Ƶ����Ƶͨ�������Բſ�����Ч�� CNend
\param[in] hAvplay	   AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enAttrID	   Attribute ID CNcomment:����ID CNend
\param[in] pPara  Data type corresponding to an attribute ID CNcomment:����ID��Ӧ�ṹ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_SetAttr(HI_HANDLE hAvplay, HI_UNF_AVPLAY_ATTR_ID_E enAttrID, HI_VOID *pPara);

/**
\brief Obtains the attributes of an AVPLAY. CNcomment:��ȡAV�������� CNend
\attention \n
N/A
\param[in] hAvplay	    AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enAttrID	    Attribute ID CNcomment:����ID CNend
\param[in] pPara   Data type corresponding to an attribute ID, CNcomment:����ID��Ӧ�ṹ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetAttr(HI_HANDLE hAvplay, HI_UNF_AVPLAY_ATTR_ID_E enAttrID, HI_VOID *pPara);

/**
\brief Decodes I frames. CNcomment:����I֡���� CNend
\attention \n
If pstCapPicture is null, the decoded I frames are displayed in the window,and do not need release memory; \n
if pstCapPicture is not null, the information about I frames is reported, and need invoke ::HI_UNF_AVPLAY_ReleaseIFrame to release memory.
You must stop the video decoder before calling this API. If I frames are being processed, do not enable the video decoder.
CNcomment:��pstCapPictureΪ��ָ��ʱ�������I֡����window����ʾ�������ͷ��ڴ棬����ǿգ��򲻻���ʾ���ǽ�I֡��Ϣ�ϱ�,ͬʱI֡������Ϻ���Ҫ����HI_UNF_AVPLAY_ReleaseIFrame���ͷ�I֡
���øýӿ�ǰ����ֹͣ��Ƶ��������I֡����û�����ʱ��Ҳ����������Ƶ������ CNend
\param[in] hAvplay	   AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] pstFrame	   Pointer to frame attributes CNcomment:ָ�����ͣ�֡�������� CNend
\param[in] pstCapPicture   Pointer to the frame information CNcomment:ָ�����ͣ�֡��Ϣ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_DecodeIFrame(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_I_FRAME_S *pstFrame, HI_UNF_VIDEO_FRAME_INFO_S *pstCapPicture);


/**
\brief Release memory of I frame. CNcomment:�ͷ�I֡֡�� CNend
\attention \n
If you call HI_UNF_AVPLAY_DecodeIFrame with non-null pstCapPicture, you need call this API to release the memory.
CNcomment:�������HI_UNF_AVPLAY_DecodeIFrameʱpstCapPicture��Ϊ�գ���Ҫ���ô˽ӿ����ͷ��ڴ� CNend
\param[in] hAvplay	   AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] pstCapPicture   Pointer to the frame information CNcomment:ָ�����ͣ��ͷŵ�֡��Ϣ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_ReleaseIFrame(HI_HANDLE hAvplay, HI_UNF_VIDEO_FRAME_INFO_S *pstCapPicture);


/**
\brief Sets the mode of a video decoder. CNcomment:������Ƶ��������ģʽ CNend
\attention \n
This API is used in trick play mode. Before switching the mode to the trick play mode, you must enable a decoder to decode only I frames by calling this API.\n
Before switching the mode to the normal mode, you also need to set the mode of a decoder to normal by calling this API.
CNcomment:���ӿ���ҪӦ���ڿ�����ŵĳ��������л����������ǰ�������ȵ��ñ��ӿڽ�����������Ϊֻ��I֡��\n
���л�����������ǰ���ȵ��ñ��ӿڽ�����������ΪNORMAL�� CNend
\param[in] hAvplay	      AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enDecodeMode	      Decoding mode CNcomment:����ģʽ CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_SetDecodeMode(HI_HANDLE hAvplay, HI_UNF_VCODEC_MODE_E enDecodeMode);

/**
\brief Registers an event on 32bit system. CNcomment:ע���¼� CNend
\attention \n
N/A
\param[in] hAvplay     AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enEvent     Event type enumeration CNcomment:ö�����ͣ���ʾ�¼����� CNend
\param[in] pfnEventCB  Pointer to the callback function corresponding to the registered event. CNcomment:�ص�����ָ�룬ָ����ע���¼���Ӧ�Ļص����� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	The AVPLAY is not initialized.	CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RegisterEvent(HI_HANDLE	  hAvplay,
				   HI_UNF_AVPLAY_EVENT_E     enEvent,
				   HI_UNF_AVPLAY_EVENT_CB_FN pfnEventCB);
/**
\brief Registers an event on 64bit system. CNcomment:64λϵͳע���¼� CNend
\attention \n
N/A
\param[in] hAvplay     AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enEvent     Event type enumeration CNcomment:ö�����ͣ���ʾ�¼����� CNend
\param[in] pfnEventCB  Pointer to the callback function corresponding to the registered event. CNcomment:�ص�����ָ�룬ָ����ע���¼���Ӧ�Ļص����� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	The AVPLAY is not initialized.	CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RegisterEvent64(HI_HANDLE	    hAvplay,
				   HI_UNF_AVPLAY_EVENT_E     enEvent,
				   HI_UNF_AVPLAY_EVENT_CB_FN64 pfnEventCB);

/**
\brief Deregisters an event. CNcomment:ȡ��ע���¼� CNend
\attention \n
N/A
\param[in] hAvplay   AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enEvent   Event type enumeration CNcomment:ö�����ͣ���ʾ�¼����� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_UnRegisterEvent(HI_HANDLE hAvplay, HI_UNF_AVPLAY_EVENT_E enEvent);

/**
\brief Enables an AVPLAY channel. CNcomment:��AV������ͨ�� CNend
\attention \n
You can enable an audio channel and a video channel for each AVPLAY. If you only need to play videos or audios, you can enable the corresponding channel to save resources.
CNcomment:ÿ��AV��������֧�ִ�����Ƶͨ����1�������ֻ������Ƶ����Ƶ��ֻ��Ҫ����Ӧͨ�����Խ�ʡ��Դ�� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enChn    Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\param[in] pPara    Pointer type. For details, see the description of ::HI_UNF_AVPLAY_OPEN_OPT_S. CNcomment:ָ�����ͣ���μ�::HI_UNF_AVPLAY_OPEN_OPT_S. CNend
    If enChn is set to HI_UNF_AVPLAY_MEDIA_CHAN_VID, this API is used to specify the maximum decoding performance of the video decoder.
    If enChn is set to NULL, the maximum performance H264+HI_UNF_VCODEC_CAP_LEVEL_FULLHD is used by default.
    The higher the configured decoding performance, the larger the required MMZ. It is recommended that you configure the performance as required.
    CNcomment:enChnΪHI_UNF_AVPLAY_MEDIA_CHAN_VIDʱ����ָ����Ƶ��������������������
    �����ΪNULL����Ĭ��Ϊ�������: H264+HI_UNF_VCODEC_CAP_LEVEL_FULLHD��
    ����֧�ֵ�����Խ����Ҫ��MMZ�����ڴ�Ҳ��Խ�󣬽��鰴�����ü��ɡ� CNend
\retval ::HI_SUCCESS Success		 CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_ChnOpen(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn, const HI_VOID *pPara);

/**
\brief Disables an AVPLAY channel. CNcomment:�ر�AV������ͨ�� CNend
\attention \n
N/A
\param[in] hAvplay   AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enChn     Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_ChnClose(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn);

/**
\brief Start an AVPLAY to prepare play mode, which just demux ts stream. CNcomment:��������������������⸴��TS��PREPLAY״̬ CNend
\attention \n
After enabling channels and setting their attributes, you can call this API to start an AVPLAY to enable it to work in prepare play mode. The audios and videos can be prepared play separately or simultaneously.
CNcomment:�����ͨ���򿪺��������ú󣬵��ñ��ӿ�����Ԥ���ţ�����PREPLAY״̬��֧�ֱַ��ͬʱ��������ƵԤ���š� CNend
\param[in] hAvplay	   AVPLAY handle  CNcomment:AV���ž�� CNend
\param[in] enChn	   Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\param[in] pstPreStartOpt     Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã���ΪNULL����. CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_PreStart(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn, const HI_UNF_AVPLAY_PRESTART_OPT_S *pstPreStartOpt);

/**
\brief Starts an AVPLAY. The AVPLAY is in play mode. CNcomment:����������������PLAY״̬ CNend
\attention \n
After enabling channels and setting their attributes, you can call this API to start an AVPLAY to enable it to work in play mode. The audios and videos can be played separately or simultaneously.
CNcomment:�����ͨ���򿪺��������ú󣬵��ñ��ӿ��������ţ�����PLAY״̬��֧�ֱַ��ͬʱ��������Ƶ���š� CNend
\param[in] hAvplay	   AVPLAY handle  CNcomment:AV���ž�� CNend
\param[in] enChn	   Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\param[in] pstStartOpt	   Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã���ΪNULL����. CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Start(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn, const HI_UNF_AVPLAY_START_OPT_S *pstStartOpt);

/**
\brief Stop an AVPLAY to prepare stop mode,the interface is reserved for future use. CNcomment:ֹͣAV����ʹ�����PRESTOP״̬,�ýӿڱ������� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enChn    Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\param[in] pstPreStopOpt   Pointer to stop mode. For details, see the description of ::HI_UNF_AVPLAY_PRESTOP_OPT_S. CNcomment:ָ�����ͣ�����ģʽ����μ�::HI_UNF_AVPLAY_STOP_OPT_S. CNend
\retval ::HI_ERR_AVPLAY_NOT_SUPPORT not support for the moment	CNcomment:�ݲ�֧�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_PreStop(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn, const HI_UNF_AVPLAY_PRESTOP_OPT_S *pstPreStopOpt);

/**
\brief Stops an AVPLAY. Then the AVPLAY is in stop mode. CNcomment:ֹͣAV���ţ�����STOP״̬ CNend
\attention \n
If you call this API, all selected channels stop playing. The playing audios and videos can be stopped separately or simultaneously.\n
The parameter pstStopOpt->enMode takes effect only when a video channel is selected.\n
If pstStopOpt->enMode is set to NULL or HI_UNF_AVPLAY_STOP_MODE_STILL, the last frame is kept still.\n
If pstStopOpt->enMode is set to HI_UNF_AVPLAY_STOP_MODE_BLACK, the last frame is cleared, and the blank screen appears.\n
When pstStopOpt->u32TimeoutMs is 0, the AVPLAY stops and this API is returned.\n
When pstStopOpt->u32TimeoutMs is greater than 0, this API is blocked until the data in the buffer is used up.\n
When pstStopOpt->u32TimeoutMs is greater than -1, this API is blocked until the data in the buffer is used up.\n
To stop the audio or video separately when both the audio and video are enabled, you must set pstStopOpt->u32TimeoutMs to 0.
CNcomment:���ñ��ӿڽ�ֹͣ��ѡͨ���Ĳ��ţ�֧�ֱַ��ͬʱֹͣ����Ƶ���š�\n
����ѡͨ���а�����Ƶͨ��ʱ������pstStopOpt->enMode�������塣\n
��pstStopOpt->enModeΪ�ջ���ΪHI_UNF_AVPLAY_STOP_MODE_STILLʱ���������һ֡��Ƶͼ��\n
��pstStopOpt->enModeΪHI_UNF_AVPLAY_STOP_MODE_BLACKʱ�������Ƶ���һ֡����Ƶ���Ϊ������\n
��pstStopOpt->u32TimeoutMsΪ0ʱ���뿪ֹͣ���Ų����ء�\n
��pstStopOpt->u32TimeoutMs>0ʱ��������Ӧʱ�䣬ֱ�������е����ݲ��ꡣ\n
��pstStopOpt->u32TimeoutMs=-1ʱ��һֱ�����������е����ݲ��ꡣ\n
������Ƶ�����ڿ���״̬ʱ,Ҫ����ֹͣ��Ƶ����Ƶ����������pstStopOpt->u32TimeoutMsΪ0. CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enChn    Separate audio channel or video channel. For details, see the description of ::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNcomment:����������Ƶͨ������μ�::HI_UNF_AVPLAY_MEDIA_CHAN_E. CNend
\param[in] pstStopOpt	Pointer to the clear screen mode. For details, see the description of ::HI_UNF_AVPLAY_STOP_OPT_S. CNcomment:ָ�����ͣ�����ģʽ����μ�::HI_UNF_AVPLAY_STOP_OPT_S. CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Stop(HI_HANDLE hAvplay, HI_UNF_AVPLAY_MEDIA_CHAN_E enChn, const HI_UNF_AVPLAY_STOP_OPT_S *pstStopOpt);

/**
\brief Pauses an AVPLAY. Then the AVPLAY is in pause mode. CNcomment:��ͣAV���ţ�����PAUSE״̬ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pstPauseOpt	Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã���ΪΪNULL���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Pause(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_PAUSE_OPT_S *pstPauseOpt);

/**
\brief Plays videos or audios in trick play mode. Then the AVPLAY is in TPLAY mode. CNcomment:���ٲ��ţ�����TPLAY״̬ CNend
\attention \n
pstTplayOpt->u32SpeedInteger is the integer part of speed, the range is 0-64.
pstTplayOpt->u32SpeedDecimal is the decimal part of speed, the range is 0-999.
CNcomment: pstTplayOpt->u32SpeedIntegerΪ�ٶȵ��������֣�ȡֵ��ΧΪ0-64. CNend
CNcomment: pstTplayOpt->u32SpeedDecimalΪ�ٶȵ�С�����֣�����3λС����ȡֵ��ΧΪ0-999. CNend
\param[in] hAvplay  AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pstTplayOpt	 The pointer of Tplay parameter,For details, see the description of ::HI_UNF_AVPLAY_TPLAY_OPT_S . CNcomment:ָ�����ͣ�TPLAY����ָ��,��μ�HI_UNF_AVPLAY_TPLAY_OPT_S�ṹ�嶨�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Tplay(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_TPLAY_OPT_S *pstTplayOpt);

/**
\brief Resumes an AVPLAY. Then the AVPLAY is in play mode. CNcomment:�ָ�AV���ţ�����PLAY״̬ CNend
\attention \n
By calling this API, you can resume an AVPLAY from the trick play mode or pause mode rather than the stop mode.
CNcomment:���ӿ����������ٻ���ͣ״̬�ָ�Ϊ����״̬�����޷���ֹͣ״̬�ָ�Ϊ����״̬�� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] pstResumeOpt	 Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã�����Ϊ�ռ��� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Resume(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_RESUME_OPT_S *pstResumeOpt);

/**
\brief Resets an AVPLAY. In this case, the play mode is not changed. CNcomment:��λAV���ţ����ı�״̬ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] pstResetOpt	 Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã���ΪΪNULL���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Reset(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_RESET_OPT_S *pstResetOpt);

/**
\brief Step play. CNcomment:�������� CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] pstStepOpt	Pointer used for expansion. You can set it to NULL. CNcomment:ָ�����ͣ�����չʹ�ã���ΪΪNULL���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Step(HI_HANDLE hAvplay, const HI_UNF_AVPLAY_STEP_OPT_S *pstStepOpt);

/**
\brief Applies for a buffer for storing the streams played by an AVPLAY. CNcomment:����AV���ŵ��������� CNend
\attention \n
This API is used only when you want to play the ESs obtained from Internet or local ESs.\n
The pstData parameter is used to return the start address and size of the buffer applied for.\n
If u32TimeOutMs is set to 0, it indicates that the waiting time is 0; if u32TimeOutMs is set to 0XFFFFFFFF, it indicates that the API waits for an infinite time; if u32TimeOutMs is set to other values, it indicates that the waiting time is u32TimeOutMs ms.\n
If no buffer can be applied for during the block period, an error code indicating full buffer is returned.\n
If u32TimeOutMs is set to 0, and no buffer can be applied for, it indicates that the audio and video buffers are full. In this case, you need to call the usleep(N*1000) function to release the CPU.
Therefore, other threads can be scheduled.
CNcomment:����������򱾵�ES��ʱ����Ҫʹ�ñ��ӿڡ�\n
����pstData�������سɹ����뵽��Buffer���׵�ַ�Լ���С��\n
u32TimeOutMs����Ϊ0��ʾ���ȴ�������Ϊ0xffffffff��ʾһֱ�ȴ�������Ϊ����ֵ��ʾ�ȴ�u32TimeOutMs���롣\n
����������ʱ�䣬���޷����뵽Buffer���򷵻�buffer��������\n
u32TimeOutMs����Ϊ0ʱ��������벻��Buffer��˵����ʱ����Ƶ��Buffer��������Ҫͨ��usleep(N*1000)�ͷ�cpu
��ʹ�����߳��ܹ��õ����ȡ� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enBufId     Buffer queue ID CNcomment:�������ID CNend
\param[in] u32ReqLen   Size of the buffer applied for CNcomment:���뻺��Ĵ�С CNend
\param[out] pstData    Pointer to the returned buffer CNcomment:���ػ���ָ�� CNend
\param[in] u32TimeOutMs	     Wait timeout, in ms CNcomment:�ȴ���ʱʱ�䣬��λms. CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetBuf(HI_HANDLE  hAvplay,
			    HI_UNF_AVPLAY_BUFID_E enBufId,
			    HI_U32		  u32ReqLen,
			    HI_UNF_STREAM_BUF_S	 *pstData,
			    HI_U32		  u32TimeOutMs);

/**
\brief Updates the write pointer after data is successfully copied. CNcomment:�������ݳɹ��󣬸���дָ�� CNend
\attention \n
After transmitting streams to the buffer applied for, you can call this API to update the write pointer of the audio and video buffers.\n
If the transmitted streams do not contain PTS, u32ptsMs must be set to -1.
CNcomment:�������뵽�Ļ���������������Ϻ󣬵��ñ��ӿڸ�������Ƶ��������дָ�롣\n
����������������û�ж�Ӧ��PTS��u32ptsMs����Ϊ-1�� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enBufId     Buffer queue ID CNcomment:�������ID. CNend
\param[in] u32ValidDataLen     Number of bytes that are written to the buffer CNcomment:ʵ��д�뻺�������ֽ��� CNend
\param[in] u32PtsMs	       PTS, in ms  CNcomment:ʱ���,�Ժ���Ϊ��λ CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_PutBuf(HI_HANDLE hAvplay, HI_UNF_AVPLAY_BUFID_E enBufId,
			 HI_U32 u32ValidDataLen, HI_U32 u32PtsMs);


/**
\brief Updates the write pointer after data is successfully copied. CNcomment:�������ݳɹ��󣬸���дָ�� CNend
\attention \n
After transmitting streams to the buffer applied for, you can call this API to update the write pointer of the audio and video buffers.\n
If the transmitted streams do not contain PTS, u32ptsMs must be set to -1.
CNcomment:�������뵽�Ļ���������������Ϻ󣬵��ñ��ӿڸ�������Ƶ��������дָ��, ���ӿڿ�����һ֡�����ֶ�����롣\n
����������������û�ж�Ӧ��PTS��u32ptsMs����Ϊ-1�� CNend
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] enBufId     Buffer queue ID CNcomment:�������ID CNend
\param[in] u32ValidDataLen     Number of bytes that are written to the buffer CNcomment:ʵ��д�뻺�������ֽ��� CNend
\param[in] u32PtsMs	       PTS, in ms  CNcomment:ʱ���,�Ժ���Ϊ��λ CNend
\param[in] pPutOpt   the extern parameter of PutBufEx, see the description of ::HI_UNF_AVPLAY_PUTBUFEX_OPT_S.CNcomment:PutBufEx�Ķ����������μ�::HI_UNF_AVPLAY_PUTBUFEX_OPT_S. CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT	 The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_PutBufEx(HI_HANDLE hAvplay, HI_UNF_AVPLAY_BUFID_E enBufId,
				       HI_U32 u32ValidDataLen, HI_U32 u32Pts, HI_UNF_AVPLAY_PUTBUFEX_OPT_S *pPutOpt);

/**
\brief Obtains the handle of the DMX audio channel used by an AVPLAY in TS mode. CNcomment:TSģʽʱ��ȡAV������ʹ�õ�DMX��Ƶͨ����Handle CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] phDmxAudChn	  Pointer to the handle of a DMX audio channel CNcomment:DMX��Ƶͨ��Handleָ�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetDmxAudChnHandle(HI_HANDLE hAvplay, HI_HANDLE *phDmxAudChn);

/**
\brief Obtains the handle of the DMX video channel used by an AVPLAY in TS mode. CNcomment:TSģʽʱ��ȡAV������ʹ�õ�DMX��Ƶͨ����Handle. CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle CNcomment:AV���ž�� CNend
\param[in] phDmxVidChn	  Pointer to the handle of a DMX video channel CNcomment:DMX��Ƶͨ��Handleָ�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetDmxVidChnHandle(HI_HANDLE hAvplay, HI_HANDLE *phDmxVidChn);


/**
\brief Obtains the status information about an AVPLAY. CNcomment:��ȡAV����״̬��Ϣ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle  CNcomment:AV���ž�� CNend
\param[out] pstStatusInfo  Pointer to the status of an AVPLAY. For details, see the description of HI_UNF_AVPLAY_STATUS_INFO_S. CNcomment:ָ�����ͣ�AV����״̬��Ϣ����μ�HI_UNF_AVPLAY_STATUS_INFO_S. CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetStatusInfo(HI_HANDLE	      hAvplay,
				 HI_UNF_AVPLAY_STATUS_INFO_S *pstStatusInfo);


/**
\brief Obtains the information about audio and video streams. CNcomment:��ȡ����Ƶ������Ϣ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle  CNcomment:AV���ž�� CNend
\param[in] pstStreamInfo     Pointer to the information about audio and video streams. For details, see the description of HI_UNF_AVPLAY_STREAM_INFO_S. CNcomment:ָ�����ͣ�����Ƶ������Ϣ����μ�HI_UNF_AVPLAY_STREAM_INFO_S CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetStreamInfo(HI_HANDLE	      hAvplay,
				   HI_UNF_AVPLAY_STREAM_INFO_S *pstStreamInfo);

/**
\brief Obtains the information audio spectrums. CNcomment:��ȡ��Ƶ������Ϣ CNend
\attention \n
N/A
\param[in] hAvplay  AVPLAY handle  CNcomment:AV���ž�� CNend
\param[in] pSpectrum	  Pointer to the array of audio spectrums. CNcomment:ָ�����ͣ���Ƶ������Ϣ����ָ�� CNend
\param[in] u32BandNum	  Length of an audio spectrum array CNcomment:��Ƶ������Ϣ���鳤�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT    The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetAudioSpectrum(HI_HANDLE hAvplay, HI_U16 *pSpectrum, HI_U32 u32BandNum);

/**
\brief Queries whether the AVPLAY buffer is empty. CNcomment:��ѯAVPLAY buffer�Ƿ��Ѿ�Ϊ�� CNend
\attention \n
N/A
\param[in] hAvplay	  AVPLAY handle CNcomment:AV���ž�� CNend
\param[out] pbIsEmpty	   Pointer type. This pointer indicates whether the AVPLAY buffer is empty (the playing ends). CNcomment:ָ�����ͣ�ָʾbuffer�Ƿ��Ѿ�Ϊ��(�������) CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_IsBuffEmpty(HI_HANDLE hAvplay, HI_BOOL * pbIsEmpty);

/**
\brief Switch the demux audio channel CNcomment:�л���ƵDEMUX��� CNend
\attention \n
N/A
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] hNewDmxAud	  New demux audio handle CNcomment:��DMX��� CNend
\param[out] phOldDmxAud	    Old	 demux audio handle CNcomment:��DMX���ָ�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_SwitchDmxAudChn(HI_HANDLE hAvplay, HI_HANDLE hNewDmxAud, HI_HANDLE *phOldDmxAud);

/**
\brief Notify an AVPLAY the stream is end CNcomment:֪ͨAVPLAY�����Ѿ����� CNend
\attention \n
Call this interface to notice AVPLAY when the last package of stream has been sent,
then check whether the last frame has been output by eos event or by invoking ::HI_UNF_AVPLAY_IsBuffEmpty,
this interface is only apply to ES mode.
CNcomment: ���û��������һ������ʱ�����øýӿ�֪ͨAVPLAY��֮�����ͨ�����EOS�¼����ߵ���::HI_UNF_AVPLAY_IsBuffEmpty�ж����һ֡�Ƿ����
Ŀǰ�ýӿڽ�������ESģʽ CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pstFlushOpt	 Pointer used for expansion. You can set it to NULL.CNcomment:ָ�����ͣ�����չʹ�ã���ΪΪNULL���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_FlushStream(HI_HANDLE hAvplay, HI_UNF_AVPLAY_FLUSH_STREAM_OPT_S *pstFlushOpt);

/**
\brief AVPLAY private command invoking. CNcomment: AVPLAY˽��������� CNend
\attention \n
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] enInvokeType	 Type of private command invoking.CNcomment:˽������������� CNend
\param[in] pPara	 Pointer to the parameter of invoking. CNcomment:ָ�����ͣ�ָ��Invoke���õĲ��� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_Invoke(HI_HANDLE hAvplay, HI_UNF_AVPLAY_INVOKE_E enInvokeType, HI_VOID *pPara);

/**
\brief Accquire user dada. CNcomment: ��ȡ�û����� CNend
\attention \n
Only support Closed Caption Data.
CNcomment: ��֧��CC���� CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[out] pstUserData	 user data.CNcomment:�û����� CNend
\param[out] penType	 user data type. CNcomment:�û��������� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_AcqUserData(HI_HANDLE hAvplay, HI_UNF_VIDEO_USERDATA_S *pstUserData, HI_UNF_VIDEO_USERDATA_TYPE_E *penType);

/**
\brief Accquire user dada. CNcomment: �ͷ��û����� CNend
\attention \n
Only support Closed Caption Data.
CNcomment: ��֧��CC���� CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pstUserData	user data.CNcomment:�û����� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RlsUserData(HI_HANDLE hAvplay, HI_UNF_VIDEO_USERDATA_S* pstUserData);

/**
\brief Extended interface for Accquire user data. CNcomment: ��ȡ�û����ݵ���չ�ӿ� CNend
\attention \n
support Closed Caption Data,Active Format Description.
CNcomment: ֧��CC��AFD���� CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] enType      user data type. CNcomment:�û��������� CNend
\param[out] pstUserData	 user data.CNcomment:�û����� CNend

\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_AcqUserDataEx(HI_HANDLE hAvplay, HI_UNF_VIDEO_USERDATA_TYPE_E enType, HI_UNF_VIDEO_USERDATA_S *pstUserData);

/**
\brief Extended interface for Release user dada. CNcomment: �ͷ��û����ݵ���չ�ӿ� CNend
\attention \n
Only support Closed Caption Data,Active Format Description..
CNcomment: ��֧��CC��AFD���� CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] enType      user data type. CNcomment:�û��������� CNend
\param[in] pstUserData	user data.CNcomment:�û����� CNend

\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_RlsUserDataEx(HI_HANDLE hAvplay, HI_UNF_VIDEO_USERDATA_TYPE_E enType, HI_UNF_VIDEO_USERDATA_S *pstUserData);

/**
\brief Obtains the left video frame tahr are not decoded CNcomment: ��ȡ��Ƶ����������δ�������֡��Ŀ CNend
\attention \n
Only support AVPLAY buffer by frame mode.
CNcomment: ��֧�ְ�֡����������ʽ CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pLeftStreamFrm  This pointer indicates the AVPLAY buffer left video frame that are not decoded.CNcomment:��Ƶ����������û�б������֡��Ŀ CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_GetLeftStreamFrm(HI_HANDLE hAvplay, HI_U32 *pLeftStreamFrm);

/**
\brief set stream HDR information. CNcomment: ����HDR��Ϣ�ӿ� CNend
\attention \n
Only support VP9 HDR.
CNcomment: ��֧��VP9 HDR ��Ϣ CNend
\param[in] hAvplay	 AVPLAY handle CNcomment: AV���ž�� CNend
\param[in] pstHdrInfo	 HDR information. CNcomment:HDR��Ϣ CNend
\param[in] bPaddingHdrInfo    if need padding HDR information to frame information. CNcomment:�Ƿ���Ҫ���HDR��Ϣ��֡��Ϣ�� CNend
\param[in] u32PtsMs  current pts of HDR information.it must be set invaild(-1),when that can not available.CNcomment:��ǰHDR��Ϣ��Ӧ��pts CNend

\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_AVPLAY_DEV_NO_INIT	 The AVPLAY is not initialized. CNcomment:AVPLAYδ��ʼ�� CNend
\retval ::HI_ERR_AVPLAY_NULL_PTR	 The input pointer is null. CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_PARA	 The input parameter is invalid. CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AVPLAY_SetHDRInfo(HI_HANDLE hAvplay, HI_UNF_VIDEO_HDR_INFO_S* pstHdrInfo, HI_BOOL bPaddingHdrInfo, HI_U32 u32PtsMs);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif

#endif
