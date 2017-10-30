/******************************************************************************
  Copyright (C), 2004-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
  File Name	: hi_unf_aenc.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	:
  Last Modified :
  Description	: header file for audio and video output control
  Function List :
  History	:
  1.Date	:
  Author	:
  Modification	: Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief describle the information about AENC. CNcomment:�ṩAENC�������Ϣ CNend
 */

#ifndef	 __HI_UNF_AENC_H__
#define	 __HI_UNF_AENC_H__

#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/******************************* API Declaration *****************************/
/** \addtogroup	     AENC */
/** @{ */  /** <!-- [AENC] */

/**
\brief Initializes audio encoder. CNcomment:��ʼ����Ƶ������ CNend
\attention \n
Call the interface before calling HI_UNF_AENC_Open. CNcomment:HI_UNF_AENC_Open�ӿ�ǰ���� CNend
\param N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_Init(HI_VOID);

/**
\brief Deinitializes audio encoder. CNcomment:ȥ��ʼ����Ƶ������ CNend
\attention \n
N/A
\param N/A
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT  Invalid operation CNcomment:HI_ERR_AENC_CH_NOT_SUPPORT ��Ч�Ĳ��� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_DeInit(HI_VOID);

/**
\brief Create audio encoder. CNcomment:������Ƶ������ CNend
\attention \n
Before calling the interface, you must configure the encoder. Now AENC only supports 16-bit and 2 channels, and support 16K, 22K, 24K, 32K, 44K, or 48Ksample rate.
CNcomment:���øýӿ�ǰ���������ñ�������ĿǰAENCֻ֧��16λ2�������Ҳ�����Ϊ��16K 22K 24K 32K 44K��48K CNend
\param[in] pstAencAttr		     Attribute structure of the audio encoder. CNcomment:��Ƶ���������Խṹ CNend
\param[out] phAenc		     Obtain the handle of the audio encoder. CNcomment:�õ���Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\retval ::HI_ERR_AENC_NULL_PTR	      The pointer is null. CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AENC_CREATECH_FAIL   The encoder fails to be created. CNcomment:����������ʧ�� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_Create(const HI_UNF_AENC_ATTR_S *pstAencAttr, HI_HANDLE *phAenc);

/**
\brief Destroy the audio encoder. CNcomment:������Ƶ������ CNend
\attention \n
\param[in] phAenc the handle of the audio encoder CNcomment:��Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT  The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_INVALID_PARA    The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_CH_NOT_OPEN     The audio encoder is not opened. CNcomment:��Ƶ������û�д� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_Destroy(HI_HANDLE hAenc);

/**
\brief Copy data to the encoder for encoding. CNcomment:����������������Թ����� CNend
\attention \n
\param[in] phAenc     The audio encoder handle CNcomment:��Ƶ��������� CNend
\param[in] pstAOFrame Send a frame of data to the encoder. CNcomment:����Ƶ��������һ֡���� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_IN_BUF_FULL      The input buffer of the encoder is full. CNcomment:���������뻺���� CNend
\retval ::HI_ERR_AENC_INVALID_PARA     The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT   The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_SendFrame(HI_HANDLE hAenc, const HI_UNF_AO_FRAMEINFO_S *pstAOFrame);

/**
\brief Obtain data from a output buffer of the encoder and write the data into the file. CNcomment:�ӱ�������һ�����������ȡ�������Թ�д���ļ� CNend
\attention \n
\param[in] phAenc     The audio encoder handle CNcomment:��Ƶ��������� CNend
\param[in] pstStream  The data in a output buffer of the audio encoder CNcomment:��Ƶ������һ����������е����� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA    The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_OUT_BUF_EMPTY   The output buffer of the encoder is empty. CNcomment:�������������Ϊ�� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT  The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_AcquireStream(HI_HANDLE hAenc, HI_UNF_ES_BUF_S *pstStream, HI_U32 u32TimeoutMs);

/**
\brief Destroy the data in a output buffer of the encoder. CNcomment:���ٱ�����һ����������е����� CNend
\attention \n
Call the interface after calling HI_UNF_AENC_ReceiveStream. CNcomment:��HI_UNF_AENC_ReceiveStream֮����� CNend
\param[in] phAenc     The handle of audio encoder CNcomment:��Ƶ��������� CNend
\param[in] u32TimeoutMs	  allowable timeout  CNcomment:��ȡ�������������ĳ�ʱ CNend
\param[out] pstStream  The data in a output buffer of the audio encoder CNcomment:��Ƶ������һ����������е����� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA   The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_OUT_BUF_BAD    The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_IN_BUF_UNEMPTY The input buffer is empty. CNcomment:���뻺��ǿ� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\see \n
N/A
*/
HI_S32	 HI_UNF_AENC_ReleaseStream(HI_HANDLE hAenc, const HI_UNF_ES_BUF_S *pstStream);


/**
\brief Register dynamic audio encoding libraries. CNcomment:ע����Ƶ��̬����� CNend
\attention \n
\param[in] pEncoderDllName The file name of audio encoding  libraries CNcomment:pEncoderDllName ��Ƶ������ļ��� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE Failure CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_RegisterEncoder(const HI_CHAR *pEncoderDllName);

/**
\brief Attach audio encoder with audio track. CNcomment:����Ƶ����������ƵTrack ͨ· CNend
\attention \n
Before obtaining the streams and encoding, you must call the interface. CNcomment:��ʼ����ͻ�ȡ����֮ǰ��Ҫ���ȵ��øýӿ� CNend
\param[in] hSrc	  The handle of audio track CNcomment:��Դ��� CNend
\param[in] hAenc     The handle of audio encoder CNcomment:��Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA		The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT	    The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		    The pointer is null. CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT		The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_AttachInput(HI_HANDLE hAenc, HI_HANDLE hSrc);

/**
\brief Detach audio encoder with audio track. CNcomment:�����Ƶ����������ƵTrack ͨ·�İ� CNend
\attention \n
Before calling the interface, stop the encoding. CNcomment:���øýӿ���Ҫ����ֹͣ���� CNend
\param[in] hAenc     The handle of audio encoder CNcomment:��Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA		The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_CH_NOT_SUPPORT	    The operation is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		    The pointer is null. CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT		The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_DetachInput(HI_HANDLE hAenc);

/**
\brief Start to encode. CNcomment:��ʼ���� CNend
\attention \n
Before calling the interface, you need to initialize the encoder, create an encoding channel and attach the player.
CNcomment:���øýӿ���Ҫ���ȳ�ʼ������������������ͨ�����󶨲����� CNend
\param[in] hAenc The handle of audio encoder CNcomment:��Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA		The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		    The pointer is null. CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT		The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_Start(HI_HANDLE hAenc);


/**
\brief Stop to encode. CNcomment:ֹͣ���� CNend
\attention \n
Before calling the interface, you need to initialize the encoder, create an encoding channel, attach the player, and start the encoding.
CNcomment:���øýӿ���Ҫ���ȳ�ʼ������������������ͨ�����󶨲��������Ѿ���ʼ���� CNend
\param[in] hAenc   The handle of audio encoder CNcomment:��Ƶ��������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA		The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		    The pointer is null. CNcomment:ָ��Ϊ�� CNend
\retval ::HI_ERR_AVPLAY_INVALID_OPT		The operation is invalid. CNcomment:�����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_Stop(HI_HANDLE hAenc);

/**
\brief Set the attribution of encode. CNcomment:���ñ������� CNend
\attention \n
Before calling the interface, you need to stop the encoder.
CNcomment:���øýӿ���Ҫ����ֹͣ����CNend
\param[in] hAenc   The handle of audio encoder CNcomment:��Ƶ��������� CNend
\param[in] pstAencAttr	 The attribution of audio encoder CNcomment:��Ƶ�������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA	  The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		  The pointer is null. CNcomment:ָ��Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_SetAttr(HI_HANDLE hAenc, const HI_UNF_AENC_ATTR_S *pstAencAttr);

/**
\brief Set the attribution of encode. CNcomment:��ȡ�������� CNend
\attention \n
\param[in] hAenc   The handle of audio encoder CNcomment:��Ƶ��������� CNend
\param[out] pstAencAttr	  The attribution of audio encoder CNcomment:��Ƶ�������� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_AENC_INVALID_PARA	  The parameter is invalid. CNcomment:��Ч�Ĳ��� CNend
\retval ::HI_ERR_AENC_NULL_PTR		  The pointer is null. CNcomment:ָ��Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_AENC_GetAttr(HI_HANDLE hAenc, HI_UNF_AENC_ATTR_S *pstAencAttr);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif	/*__HI_UNF_AENC_H__*/
