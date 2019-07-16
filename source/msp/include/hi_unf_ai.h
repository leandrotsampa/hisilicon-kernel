/******************************************************************************
  Copyright (C), 2004-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
  File Name	: hi_unf_ai.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2013/4/22
  Last Modified :
  Description	: header file for audio and video output control
  Function List :
  History	:
  1.Date	:
  Author	: zgjie
  Modification	: Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about the audio input (AI) module. CNcomment:�ṩAI�������Ϣ CNend
 */

#ifndef	 __HI_UNF_AI_H__
#define	 __HI_UNF_AI_H__

#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/********************************Macro Definition********************************/
/** \addtogroup	     AI */
/** @{ */  /** <!-- AI */


/** @} */  /** <!-- ==== Macro Definition end ==== */


/*************************** Structure Definition ****************************/
/** \addtogroup	     AI */
/** @{ */  /** <!--  ��AI�� */




/**Audio inputport defination */
/**CNcomment:��Ƶ����˿ڶ���*/
typedef enum hiUNF_AI_E
{
    HI_UNF_AI_I2S0 = 0,

    HI_UNF_AI_I2S1,

    HI_UNF_AI_ADC0 = 0x10,

    HI_UNF_AI_ADC1,

    HI_UNF_AI_ADC2,

    HI_UNF_AI_ADC3,

    HI_UNF_AI_ADC4,

    HI_UNF_AI_SIF0 = 0x20,

    HI_UNF_AI_HDMI0 = 0x30,

    HI_UNF_AI_HDMI1,

    HI_UNF_AI_HDMI2,

    HI_UNF_AI_HDMI3,

    HI_UNF_AI_BUTT = 0xff,
} HI_UNF_AI_E;

/**Defines internal Audio ADC inputport attribute */
/**CNcomment:����������ƵADC����˿�����*/
typedef struct hiUNF_AI_ADC_ATTR_S
{
    HI_BOOL   bByPass;
} HI_UNF_AI_ADC_ATTR_S;


/**Defines  Audio I2S inputport attribute */
/**CNcomment:������ƵI2S����˿�����*/
typedef struct hiUNF_AI_I2S_ATTR_S
{
    HI_UNF_I2S_ATTR_S  stAttr;	/**<I2S Attribute*/ /**<CNcomment:I2S����*/
}  HI_UNF_AI_I2S_ATTR_S;

/**Defines the HDMI RX Audio data format .*/
typedef enum hiHI_UNF_AI_HDMI_FORMAT_E
{
    HI_UNF_AI_HDMI_FORMAT_LPCM = 0,	     /* LPCM 2/8 channels,  Audio Sample Packet layout0 or layout1 */
    HI_UNF_AI_HDMI_FORMAT_LBR = 1,	     /* IEC-61937 DD/DDP/DTS, Audio Sample Packet layout0 */
    HI_UNF_AI_HDMI_FORMAT_HBR = 8,	     /* IEC-61937 DTSHD/TrueHD, High-Bitrate (HBR) Audio Stream Packet*/
    HI_UNF_AI_HDMI_FORMAT_BUTT
} HI_UNF_AI_HDMI_FORMAT_E;


/**Defines  HDMI Audio inputport attribute */
/**CNcomment:����HDMI��Ƶ����˿�����*/
typedef struct hiUNF_AI_HDMI_ATTR_S
{
    HI_UNF_I2S_CHNUM_E	  enChannel;	/**<Channel number*/ /**<CNcomment:ͨ����*/
    HI_UNF_I2S_BITDEPTH_E enBitDepth;	/**<Bit Depth*/ /**<CNcomment:λ��*/
    HI_UNF_SAMPLE_RATE_E  enSampleRate; /**<Sample Rate*/ /**<CNcomment:������*/
    HI_UNF_AI_HDMI_FORMAT_E enHdmiAudioDataFormat;  /**<HDMI audio data format*/ /**<CNcomment:HDMI��Ƶ���ݸ�ʽ*/
} HI_UNF_AI_HDMI_ATTR_S;

/**Defines internal SIF(Audio Demodulator) inputport attribute */
/**CNcomment:����SIF����˿�����*/
typedef struct hiUNF_AI_SIF_ATTR_S
{
    HI_VOID* pPara;
} HI_UNF_AI_SIF_ATTR_S;

/**Defines  Audio inputport attribute */
/**CNcomment:������Ƶ����˿�����*/
typedef struct hiHI_UNF_AI_ATTR_S
{
    HI_UNF_SAMPLE_RATE_E    enSampleRate;	   /**<samplerate, default 48000Hz*/ /**<CNcomment:�豸����Ƶ�ʣ�Ĭ�� 48000Hz*/
    HI_U32		    u32PcmFrameMaxNum;	   /**<Max frame of the PCM data at cast buffer, default 16*/ /**<CNcomment: ���ɻ���֡����Ĭ�� 16*/
    HI_U32		    u32PcmSamplesPerFrame; /**<Number of sample of the PCM data, default 960*/ /**<CNcomment: PCM���ݲ�����������Ĭ�� 960*/
    union
    {
	HI_UNF_AI_ADC_ATTR_S  stAdcAttr;    /**<ADC Attribute*/ /**<CNcomment:ADC����*/
	HI_UNF_AI_I2S_ATTR_S  stI2sAttr;    /**<I2S Attribute*/ /**<CNcomment:I2S����*/
	HI_UNF_AI_HDMI_ATTR_S stHDMIAttr;   /**<HDMI Attribute*/ /**<CNcomment:HDMI����*/
    } unAttr;
} HI_UNF_AI_ATTR_S;

/**Defines AI Delay attribute */
/**CNcomment:����AI�ӳ�����*/
typedef struct hiHI_UNF_AI_DELAY_S
{
    HI_U32		    u32DelayMs;	   /**<buffer delay compensation(ms), Min Value is 20, Max Value depends on u32PcmFrameMaxNum, u32PcmSamplesPerFrame and enSampleRate in HI_UNF_AI_ATTR_S.
						    MaxValue = u32PcmSamplesPerFrame * u32PcmFrameMaxNum * 1000 / enSampleRate.
						    MaxValue is equal to 320ms according to default HI_UNF_AI_ATTR_S*/
						   /**<CNcomment:�������������ӳٲ�������(ms), ��СֵΪ20ms�����ֵ����HI_UNF_AI_ATTR_S�е�u32PcmFrameMaxNum��u32PcmSamplesPerFrame�Լ�enSampleRate
						    ���㹫ʽ:MaxValue = u32PcmSamplesPerFrame * u32PcmFrameMaxNum * 1000 / enSampleRate��
						    ������Ĭ��HI_UNF_AI_ATTR_S�������ֵΪ320ms */
    HI_BOOL		    bDelayMsAutoHold;  /**<if hold buffer delay compensation time automatically*/ /**<CNcomment:�Ƿ���AI_AOͨ·�Զ����ֻ����������ȶ���u32CompensationMs*/
} HI_UNF_AI_DELAY_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */


/******************************* API declaration *****************************/
/** \addtogroup	     AI */
/** @{ */  /** <!--  ��AI�� */

/**
\brief Initializes an AI device. CNcomment:��ʼ����Ƶ�����豸 CNend
\attention \n
Before calling the AI module, you must call this application programming interface (API). CNcomment:����AIģ��Ҫ�����ȵ��øýӿ� CNend
\param N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AI_Init(HI_VOID);

/**
\brief Deinitializes an AI device. CNcomment:ȥ��ʼ����Ƶ�����豸 CNend
\attention \n
\param N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ�  CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AI_DeInit(HI_VOID);

/**
 \brief Obtains the default attributes of a AI port. CNcomment: ��ȡAI�˿�Ĭ������ CNend
 \attention \n
 \param[in] pstAttr Pointer to AI attributes CNcomment: AI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_AI_NULL_PTR	The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_AI_GetDefaultAttr(HI_UNF_AI_E enAiPort, HI_UNF_AI_ATTR_S *pstAttr);

/**
 \brief Enables a AI port to create a AI handle. CNcomment: ��AI Port������AI��� CNend
 \attention \n
Before calling the AI, you must call this API.\n
CNcomment: ����AI ģ����Ҫ���ȵ��øýӿ� CNend
 \param[in] pstAttr CNcomment: Pointer to AI attributes AI����ָ�� CNend
 \param[in] phandle CNcomment: hAi Pointer to the AI handle AI���ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_AI_NULL_PTR	The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_AI_INVALID_PARA   The attribute parameters are incorrect. CNcomment: ���Բ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_AI_Create(HI_UNF_AI_E enAiPort, HI_UNF_AI_ATTR_S *pstAttr, HI_HANDLE *phAI);

/**
 \brief Disable a AI port to destroy the handle. CNcomment: �ر�AI Port�����پ�� CNend
 \attention \n
 \param[in] hAi AI handle CNcomment: AI��� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_AI_INVALID_PARA  The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_AI_Destroy(HI_HANDLE hAI);

/**
 \brief Set the attributes of a AI port. CNcomment: ����AI Port���� CNend
 \attention \n
 \param[in] hAi AI handle CNcomment: AI��� CNend
 \param[in] pstAttr  Pointer to AI attributes CNcomment: AI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_AI_NULL_PTR	The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_AI_INVALID_ID	  The handle is invalid. CNcomment: �Ƿ���� CNend
 \retval ::HI_ERR_AI_INVALID_PARA   The attribute parameters are incorrect. CNcomment: ���Բ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
 HI_S32 HI_UNF_AI_SetAttr(HI_HANDLE hAI, HI_UNF_AI_ATTR_S *pstAttr);


/**
 \brief Obtains the attributes of a AI port. CNcomment: ��ȡAI Port���� CNend
 \attention \n
 \param[in] hAi AI handle CNcomment: AI��� CNend
 \param[out] pstAttr Pointer to AI attributes CNcomment: AI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_AI_NULL_PTR	The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_AI_INVALID_ID	  The handle is invalid. CNcomment: �Ƿ���� CNend
 \retval ::HI_ERR_AI_INVALID_PARA   The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_AI_GetAttr(HI_HANDLE hAI, HI_UNF_AI_ATTR_S *pstAttr);


/**
\brief enable AI port. CNcomment: ʹ��AIͨ�� CNend
\attention \n
\param[in] AI handle CNcomment: AI��� CNend
\param[in] bEnable	enable	.CNcomment:ʹ�ܿ��� CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_SetEnable(HI_HANDLE hAI, HI_BOOL bEnable);

/**
\brief Obtains enable/disable status of AI port. CNcomment: ��ȡAIͨ��ʱ��״̬ CNend
\attention \n
\param[in] AI handle CNcomment: AI��� CNend
\param[out] pbEnable enable/disable status AI port. CNcomment:AIͨ��ʱ��״̬ CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_GetEnable(HI_HANDLE hAI, HI_BOOL *pbEnable);

/**
\brief set AI delay compensation. CNcomment: ����AI�����ӳٲ��� CNend
\attention \n
\param[in] AI handle CNcomment: AI��� CNend
\param[in] pstDelay  delay compensation .CNcomment:�ӳٲ������� CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_SetDelay(HI_HANDLE hAI, const HI_UNF_AI_DELAY_S *pstDelay);

/**
\brief Obtains AI delay compensation. CNcomment: ��ȡAI�����ӳٲ��� CNend
\attention \n
\param[in] AI handle CNcomment: AI��� CNend
\param[out] pstDelay delay compensation. CNcomment:�ӳٲ������� CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_GetDelay(HI_HANDLE hAI, HI_UNF_AI_DELAY_S *pstDelay);

/**
\brief get frame buffer from AI. CNcomment: ��ȡ����֡�� CNend
\attention \n
Cast pcm data format  s32BitPerSample(16), u32Channels(2),bInterleaved(HI_TRUE), u32SampleRate(same as AI).
\param[in] AI handle CNcomment: AI��� CNend
\param[in] u32TimeoutMs	    acquire timeout.CNcomment:��ȡ��ʱ CNend
\param[out] pstFrame	    frame info.CNcomment:֡��Ϣ CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_AcquireFrame(HI_HANDLE hAI, HI_UNF_AO_FRAMEINFO_S *pstFrame, HI_U32 u32TimeoutMs);

/**
\brief Releases the frame buffer for AI . CNcomment: �ͷ�����֡�� CNend
\attention \n
\param[in] AI handle CNcomment: AI��� CNend
\param[in] u32TimeoutMs	    acquire timeout.CNcomment:�ͷų�ʱ CNend
\param[out] pstFrame	    frame info.CNcomment:֡��Ϣ CNend
\retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
\retval ::HI_ERR_AI_NULL_PTR	      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
\retval ::HI_ERR_AI_INVALID_ID	   The handle is invalid. CNcomment: �Ƿ���� CNend
\retval ::HI_ERR_AI_INVALID_PARA   invalid input parameter.CNcomment:��������Ƿ� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_AI_ReleaseFrame(HI_HANDLE hAI, HI_UNF_AO_FRAMEINFO_S *pstFrame);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif	/*__HI_UNF_AI_H__*/
