/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_mce.h
  Version	: Initial Draft
  Author	: HiSilicon multimedia software group
  Created	: 2011-xx-xx
  Description	: hi_unf_mce.h header file
  History	:
  1.Date	: 2011/xx/xx
    Author	:
    Modification: This file is created.

******************************************************************************/
/**
 * \file
 * \brief Describes the logo and play contents and related configuration information.
 */

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_MCE_H__
#define __HI_UNF_MCE_H__

#include "hi_unf_common.h"
#include "hi_unf_disp.h"
#include "hi_unf_vo.h"
#include "hi_unf_avplay.h"
#include "hi_unf_frontend.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif	/* End of #ifdef __cplusplus */

/********************************Struct Definition********************************/
/** \addtogroup	     MCE */
/** @{ */  /** <!-- [MCE] */


/** Defines the logo parameter*/
/** CNcomment:����Logo����*/
typedef struct hiUNF_MCE_LOGO_PARAM_S
{
    HI_BOOL	bLogoEnable;	/**<Whether logo is enable*//**<CNcomment: Logo�Ƿ�ʹ��*/
    HI_U32	u32LogoLen;	/**<Length of logo data*//**<CNcomment: Logo���ݵĳ���*/
}HI_UNF_MCE_LOGO_PARAM_S;


/*fastplay supports the decoding mode of ADEC*//**<CNcomment:fastplay ֧�ֵ�ADEC�����ʽ */
typedef enum hiUNF_MCE_ADEC_TYPE_E
{
    HI_UNF_MCE_ADEC_TYPE_MP2 = 0,	/**<MP2 format*//**<CNcomment:MP2 ��ʽ */
    HI_UNF_MCE_ADEC_TYPE_MP3 = 1,	/**<MP3 format*//**<CNcomment:MP3 ��ʽ */
    HI_UNF_MCE_ADEC_TYPE_BUTT		/**<Invalid format*//**<CNcomment:��Ч ��ʽ */
}HI_UNF_MCE_ADEC_TYPE_E;

/**fastplay supports the decoding mode of VDEC*//**<CNcomment:fastplay ֧�ֵ�VDEC�����ʽ */
typedef enum hiUNF_MCE_VDEC_TYPE_E
{
    HI_UNF_MCE_VDEC_TYPE_MPEG2 = 0,	/**<MPEG2 format*//**<CNcomment:MPEG2  ��ʽ */
    HI_UNF_MCE_VDEC_TYPE_MPEG4 = 1,	/**<MPEG4 format*//**<CNcomment:MPEG4  ��ʽ */
    HI_UNF_MCE_VDEC_TYPE_H264  = 2,	/**<H264 format*//**<CNcomment:H264  ��ʽ */
    HI_UNF_MCE_VDEC_TYPE_AVS   = 3,	/**<AVS format*//**<CNcomment:AVS   ��ʽ */
    HI_UNF_MCE_VDEC_TYPE_HEVC  = 4,	/**<HEVC format*//**<CNcomment:H265  ��ʽ */
    HI_UNF_MCE_VDEC_TYPE_BUTT		/**<Invalid format*//**<CNcomment:��Ч ��ʽ */
}HI_UNF_MCE_VDEC_TYPE_E;


/**Parameters for digital video broadcasting (DVB) play configuration*//**<CNcomment:DVB������Ϣ  */
typedef struct hiUNF_MCE_DVB_PARAM_S
{
    HI_U32			u32PcrPid;	/**<Program clock reference (PCR) packet ID (PID)*//**<CNcomment:pcr pid*/
    HI_U32			u32VideoPid;	/**<Video PID*//**<CNcomment:��Ƶ pid*/
    HI_U32			u32AudioPid;	/**<Audio PID*//**<CNcomment:��Ƶ pid*/
    HI_UNF_MCE_VDEC_TYPE_E	enVideoType;	/**<Video type*//**<CNcomment:��Ƶ ����*/
    HI_UNF_MCE_ADEC_TYPE_E	enAudioType;	/**<Audio type*//**<CNcomment:��Ƶ ����*/
    HI_U32			u32Volume;	/**<volume of output*//**<CNcomment:���� */
    HI_UNF_TRACK_MODE_E		enTrackMode;	/**<Track mode. Only HI_UNF_TRACK_MODE_STEREO is supported.*//**<CNcomment:��֧�������� */
    HI_UNF_VO_DEV_MODE_E	enDevMode;	/**<Working mode of the VO device*//**<CNcomment:dev �� vo ģʽ	 */
    HI_UNF_TUNER_CONNECT_PARA_S stConnectPara;	/**<Tuner connect parameter*//**<CNcomment:Tuner��Ƶ����.*/
    HI_UNF_TUNER_FE_LNB_CONFIG_S    stLnbCfg;	/**<LNB config*//**<CNcomment:LNB ���� */
    HI_UNF_TUNER_FE_LNB_POWER_E		   enLNBPower;/**<LNB Power*//**<CNcomment:LNB������� */
    HI_UNF_TUNER_DISEQC_SWITCH16PORT_S	   st16Port;/**<Switch16 parameter*//**<CNcomment:Switch16���ز��� */
    HI_UNF_TUNER_DISEQC_SWITCH4PORT_S	   st4Port;/**<Switch4 parameter*//**<CNcomment:Switch4���ز��� */
    HI_UNF_TUNER_SWITCH_22K_E		   enSwitch22K; /**<22K switch parameter*//**<CNcomment:22K���ز��� */
}HI_UNF_MCE_DVB_PARAM_S;

/**Play parameter configuration of transport stream (TS) files*//**<CNcomment:TS�ļ�������Ϣ */
typedef struct hiUNF_MCE_TSFILE_PARAM_S
{
    HI_U32			u32ContentLen;	/**File length*//**<CNcomment:�ļ�����	*/
    HI_U32			u32PcrPid;	/**<pcr pid*//**<CNcomment:pcr pid  */
    HI_U32			u32VideoPid;	/**<Video PID*//**<CNcomment:��Ƶ pid. */
    HI_U32			u32AudioPid;	/**<Audio PID*//**<CNcomment:��Ƶ pid. */
    HI_UNF_MCE_VDEC_TYPE_E	enVideoType;	/**<Video type*//**<CNcomment:��Ƶ ���� */
    HI_UNF_MCE_ADEC_TYPE_E	enAudioType;	/**<Audio type*//**<CNcomment:��Ƶ ���� */
    HI_U32			u32Volume;	/**<volume of output *//**<CNcomment:���� */
    HI_UNF_TRACK_MODE_E		enTrackMode;	/**<Track mode. Only HI_UNF_TRACK_MODE_STEREO is supported.*//**<CNcomment:��֧�������� */
    HI_UNF_VO_DEV_MODE_E	enDevMode;	/**<mode of vo device  *//**<CNcomment:vo�豸��ģʽ  */
}HI_UNF_MCE_TSFILE_PARAM_S;

#define ANI_MAX_PIC_SUPPORT (30)
typedef struct hiUNF_MCE_ANI_PARAM_S
{
    HI_U32  u32ContentLen;  /**File length*//**<CNcomment:�ļ�����  */
    HI_U32  u32PicCount;
    HI_U32  au32PicTime[ANI_MAX_PIC_SUPPORT];
}HI_UNF_MCE_ANI_PARAM_S;

/**Play type*//**<CNcomment:��������*/
typedef enum hiUNF_MCE_PLAY_TYPE_E
{
    HI_UNF_MCE_TYPE_PLAY_DVB	 = 0,	/**<DVB type*/ /**<CNcomment:DVB ���� */
    HI_UNF_MCE_TYPE_PLAY_TSFILE	 = 1,	/**<TS file type*/ /**<CNcomment:ts �ļ����� */
    HI_UNF_MCE_TYPE_PLAY_ANI	 = 2,	/**<ES file type*/ /**<CNcomment:es �ļ����� */
    HI_UNF_MCE_TYPE_PLAY_BUTT
}HI_UNF_MCE_PLAY_TYPE_E;


/**Play configuration*//**<CNcomment:����������Ϣ */
typedef struct hiUNF_MCE_PLAY_PARAM_S
{
    HI_UNF_MCE_PLAY_TYPE_E	    enPlayType;	    /**<Play type*//**<CNcomment:��������*/
    HI_BOOL			    bPlayEnable;    /**<Whether play is enable*//**<CNcomment: ˲���Ƿ�ʹ��*/

    union
    {
	HI_UNF_MCE_DVB_PARAM_S	   stDvbParam;	    /**<dvb parameter*//**<CNcomment:dvb����*/
	HI_UNF_MCE_TSFILE_PARAM_S  stTsParam;	    /**<ts parameter*//**<CNcomment:ts����*/
	HI_UNF_MCE_ANI_PARAM_S	   stAniParam;	    /**<es parameter*//**<CNcomment:es����*/
    }unParam;

    HI_BOOL			    bContentValid;  /**<whether mce content is valid *//**<CNcomment:mce �����Ƿ���Ч*/
}HI_UNF_MCE_PLAY_PARAM_S;

/**Mode of Play Control*//**CNcomment:���ſ���ģʽ */
typedef enum hiUNF_MCE_PLAYCTRL_MODE_E
{
    HI_UNF_MCE_PLAYCTRL_BY_TIME,    /**<play control by time*//**<CNcomment:ͨ��ʱ�����*/
    HI_UNF_MCE_PLAYCTRL_BY_COUNT,   /**<play control by count*//**<CNcomment:ͨ�����Ŵ�������*/
    HI_UNF_MCE_PLAYCTRL_BUTT
}HI_UNF_MCE_PLAYCTRL_MODE_E;

/**Defines the parameter of fastplay stop*//**CNcomment:˲��ֹͣ���� */
typedef struct hiUNF_MCE_STOPPARM_S
{
    HI_UNF_AVPLAY_STOP_MODE_E	enStopMode;	/**<Mode of Stop,see ::HI_UNF_AVPLAY_STOP_MODE_E*//**<CNcomment:ֹͣģʽ���μ�::HI_UNF_AVPLAY_STOP_MODE_E*/
    HI_UNF_MCE_PLAYCTRL_MODE_E	enCtrlMode;	/**<Mode of Play Control*//**<CNcomment:���ſ���ģʽ */
    HI_U32			u32PlayTimeMs;	  /**<Play time*//**<CNcomment:����ʱ�� */
    HI_U32			u32PlayCount;	/**<Play count*//**<CNcomment:���Ŵ��� */
} HI_UNF_MCE_STOPPARM_S;

/**Defines the parameter of fastplay exit*//**CNcomment:˲���˳����� */
typedef struct hiUNF_MCE_EXITPARAM_S
{
    HI_HANDLE	hNewWin;	  /**<Handle of new window*//**<CNcomment:�´��ھ�� */
}HI_UNF_MCE_EXITPARAM_S;

/**Defines the parameter of fastplay init*//**CNcomment:˲����ʼ������ */
typedef struct hiUNF_MCE_INIT_PARAM_S
{
    HI_U32	u32Reserved;
}HI_UNF_MCE_INIT_PARAM_S;


/** @} */  /** <!-- ==== Struct Definition end ==== */

/********************************API declaration********************************/
/** \addtogroup	     MCE */
/** @{ */  /** <!-- [MCE]*/

/**
\brief init mce	 CNcomment:MCE���ó�ʼ���ӿ� CNend
\attention \n
Initializes the media control engine (MCE) before call other MCE API.
CNcomment:ʹ��MCE�ӿ�ǰ���ȵ��øýӿ� CNend
\param[in]  pstInitParam  Pointer to MCE init parameter, reserved. CNcomment:ָ�����ͣ�ָ��˲����ʼ������������ CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_MCE_DEV_NOT_EXIST	 Device is not exist. CNcomment:�豸������ CNend
\retval :: HI_ERR_MCE_NOT_DEVICE      Not a device. CNcomment:���豸 CNend
\retval :: HI_ERR_MCE_DEV_OPEN_ERR	Parameter is invalid. CNcomment:�豸��ʧ�� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_MCE_Init(HI_UNF_MCE_INIT_PARAM_S *pstInitParam);

/**
\brief deinit mce  CNcomment:MCE����ȥ��ʼ���ӿ� CNend
\attention \n
Destroys all MCE resources.  CNcomment:���MCE���ù������յ��øýӿ� CNend
\see \n
N/A
*/
HI_VOID HI_UNF_MCE_DeInit(HI_VOID);

/**
\brief deinit mce  CNcomment:��տ�������ӿ� CNend
\attention \n
Destroys the logo.  CNcomment:��տ������� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_MCE_DEV_NOT_INIT	Device is not init. CNcomment:�豸δ��ʼ�� CNend
\retval :: HI_ERR_MCE_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_MCE_ClearLogo(HI_VOID);

/**
\brief	stop fastplay. CNcomment:ֹͣfastplay CNend
\attention \n
If enCtrlMode is HI_UNF_MCE_PLAYCTRL_BY_TIME, u32PlayTime is valid; if enCtrlMode is HI_UNF_MCE_PLAYCTRL_BY_COUNT, u32PlayCount is valid
CNcomment: enCtrlModeѡΪHI_UNF_MCE_PLAYCTRL_BY_TIMEʱ��u32PlayTime��Ч, ѡΪHI_UNF_MCE_PLAYCTRL_BY_COUNTʱ��u32PlayCount��Ч CNend
\param[in]  pstStopParam  Pointer to fastplay  stop parameter. CNcomment:ָ�����ͣ�ָ��˲��ֹͣ���� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_MCE_DEV_NOT_INIT	Device is not init. CNcomment:�豸δ��ʼ�� CNend
\retval :: HI_ERR_MCE_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_MCE_PARAM_INVALID	 Parameter is invalid. CNcomment��Ч���� CNend
\retval :: HI_ERR_MCE_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_MCE_Stop(HI_UNF_MCE_STOPPARM_S *pstStopParam);


/**
\brief	Exit fastplay and destrory fastplay source CNcomment:�˳�fastplay,����fastplay��Դ CNend
\attention \n
N/A
\param[in]  pstExitParam  Pointer to fastplay  exit parameter. CNcomment:ָ�����ͣ�ָ��˲���˳����� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_MCE_DEV_NOT_INIT	Device is not init. CNcomment:�豸δ��ʼ�� CNend
\retval :: HI_ERR_MCE_PARAM_INVALID	 Parameter is invalid. CNcomment��Ч���� CNend
\retval :: HI_ERR_MCE_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_MCE_Exit(HI_UNF_MCE_EXITPARAM_S *pstExitParam);


/** @} */  /** <!-- ==== API declaration end ==== */


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
