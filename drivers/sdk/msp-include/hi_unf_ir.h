/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
 ******************************************************************************
File Name     : hi_unf_ecs_type.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date  : 2012-08-24
Last Modified by:
Description   : Application programming interfaces (APIs) of IR
Function List :
Change History:
 ******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_IR_H__
#define __HI_UNF_IR_H__

#include "hi_common.h"
#include "hi_error_mpi.h"
//#include "hi_unf_keyled.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     IR */
/** @{ */  /** <!-- [IR] */

/**status of key*/
/**CNcomment:����״̬*/
typedef enum  hiUNF_KEY_STATUS_E
{
    HI_UNF_KEY_STATUS_DOWN = 0 ,   /**<Pressed*/   /**<CNcomment:���°��� */
    HI_UNF_KEY_STATUS_HOLD ,	   /**<Hold*/	   /**<CNcomment:��ס���� */
    HI_UNF_KEY_STATUS_UP ,	   /**<Released*/  /**<CNcomment:̧�𰴼� */

    HI_UNF_KEY_STATUS_BUTT
}HI_UNF_KEY_STATUS_E ;

/**Code type supported by the infrared (IR) module*/
/**CNcomment:IR֧�ֵ�����*/
typedef enum hiUNF_IR_CODE_E
{
    HI_UNF_IR_CODE_NEC_SIMPLE = 0,  /**<NEC with simple repeat code*/	/**<CNcomment:NEC with simple repeat code����*/
    HI_UNF_IR_CODE_TC9012,	    /**<TC9012 code*/			/**<CNcomment:TC9012����*/
    HI_UNF_IR_CODE_NEC_FULL,	    /**<NEC with full repeat code*/	/**<CNcomment:NEC with full repeat code����*/
    HI_UNF_IR_CODE_SONY_12BIT,	    /**<SONY 12-bit code */		/**<CNcomment:SONY 12BIT����*/
    HI_UNF_IR_CODE_RAW,		      /**<Raw code*/			    /**<CNcomment:raw ����*/
    HI_UNF_IR_CODE_BUTT
}HI_UNF_IR_CODE_E;

/**List of IR code type. For details about HI_UNF_IR_STD, see HI_UNF_IR_CODE_E.*/
/**CNcomment:IR�����б�,HI_UNF_IR_STD���������HI_UNF_IR_CODE_E */
typedef enum hiUNF_IR_PROTOCOL_E
{
    HI_UNF_IR_NEC,		 /**<For NEC protocol*/				 /**<CNcomment:NEC����*/
    HI_UNF_IR_RC6A = 10,	 /**<For RC6A protocol*/			 /**<CNcomment:RC6A����*/
    HI_UNF_IR_RC5,		 /**<For RC5 protocol*/				 /**<CNcomment:RC5����*/
    HI_UNF_IR_LOW_LATENCY_PROTOCOL,
    HI_UNF_IR_RC6_MODE0,	 /**<For RC6 mode 0*/				 /**<CNcomment:RC6 mode0����*/
    HI_UNF_IR_RCMM,		 /**<For RCMM 24/32 protocol*/			 /**<CNcomment:RCMM 24/32����*/
    HI_UNF_IR_RUWIDO,		 /**<For Ruwido protocol*/			 /**<CNcomment:Ruwido����*/
    HI_UNF_IR_RCRF8,		 /**<For RCRF8 protocol*/			 /**<CNcomment:RCRF8����*/
    HI_UNF_IR_MULTIPLE,		 /**<For multiple protocol support*/		 /**<CNcomment:Multiple����*/
    HI_UNF_IR_RMAP,		 /**<For RMAP protocol with Mancester coding*/	 /**<CNcomment:RMAP ����˹������*/
    HI_UNF_IR_RSTEP,		 /**<For RSTEP protocol*/			 /**<CNcomment:RSTEP����*/
    HI_UNF_IR_RMAP_DOUBLEBIT,	 /**<For RMAP protocol with Double bit coding*/	 /**<CNcomment:RMAP ˫bit����*/
    HI_UNF_IR_LOW_LATENCY_PRO_PROTOCOL,
    HI_UNF_IR_XMP,		 /**<For XMP protocol*/				 /**<CNcomment:XMP����*/
    HI_UNF_IR_USER_DEFINED,	 /**<For user protocol*/			 /**<CNcomment:�û��Զ�������*/
    HI_UNF_IR_PROTOCOL_BUTT
} HI_UNF_IR_PROTOCOL_E;

/** @} */  /** <!-- ==== Structure Definition End ==== */

/******************************* API Declaration *****************************/
/** \addtogroup	     IR */
/** @{ */  /** <!-- [IR] */
/*---IR---*/

/**
\brief Starts the IR device.
CNcomment:\brief ��IR�豸��CNend

\attention \n
This API can be called repeatedly. Key IDs can be received only after you can start the IR device, and then call HI_UNF_IR_Enable. \n
CNcomment:�ظ����û᷵�سɹ������豸������ٵ���HI_UNF_IR_Enable�����������ռ�ֵ��CNend

\param N/A								     CNcomment:�� CNend
\retval HI_SUCCESS Success						     CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_OPEN_ERR   The IR device fails to open		     CNcomment:IR�豸��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_Init(HI_VOID);

#define HI_UNF_IR_Open() HI_UNF_IR_Init()

/**
\brief Stops the IR device.
CNcomment:\brief �ر�IR�豸��CNend

\attention \n
This API can be called repeatedly. \n
CNcomment:�ظ����ùرջ᷵�سɹ���CNend

\param	N/A								     CNcomment:�� CNend
\retval HI_SUCCESS Success						     CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_CLOSE_ERR  The IR device fails to close.		     CNcomment:IR�豸�ر�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_DeInit(HI_VOID);

#define HI_UNF_IR_Close() HI_UNF_IR_DeInit()

/**
\brief Enables the IR device.
CNcomment:\brief ʹ��IR�豸��CNend
\attention \n
N/A
\param[in] bEnable  IR enable. HI_TRUE: enabled; HI_FALSE: disabled	      CNcomment:IR ʹ�ܿ���, HI_TRUE ʹ��, HI_FALSE ���á�CNend
\retval HI_SUCCESS Success						      CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.		      CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA  The parameter is invalid.		      CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_ENABLE_FAILED It fails to enable IR device.		      CNcomment:ʹ���豸ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_Enable ( HI_BOOL bEnable);

/**
\brief Obtains the protocol type of a remote control.
CNcomment:\brief ��ȡң������Э������ ��CNend

\attention \n
This interface is only supported in IR_STD mode. And it must be used after function "HI_UNF_IR_GetValueWithProtocol".\n
CNcomment:�˽ӿ�ֻ��IR_STDģʽ��֧�֡���Ҫ��HI_UNF_IR_GetValueWithProtocol��������á� CNend

\param[out]  penProtocol  protocol type pointer,reference HI_UNF_IR_PROTOCOL_E for detail   CNcomment:Э������ָ��  ���庬����ο�::HI_UNF_IR_PROTOCOL_E CNend
\retval HI_SUCCESS Success							      CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			      CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.				      CNcomment: ָ��Ϊ�� CNend
\see \n
N/A
*/

HI_S32 HI_UNF_IR_GetProtocol(HI_UNF_IR_PROTOCOL_E *penProtocol);

/**
\brief obtain name of remote control protocol
CNcomment:\brief ��ȡң������Э������ ��CNend

\attention \n
when IR_TYPE=IR_LIRC is effective, this interface is not supported now.
CNcomment:��IR_TYPE=IR_LIRCʱ��Ч���˽ӿ��ݲ�֧�� CNend

\param[out]  pProtocolName  used to save first address of the protocol name buffer    CNcomment:���ڴ洢Э�����ƵĻ������׵�ַ CNend
\param[in]   s32BufLen	    used to save length of the protocol name buffer	      CNcomment:���ڴ洢Э�����ƵĻ��������� CNend
\retval ::HI_ERR_IR_UNSUPPORT	It is not supported.				      CNcomment:������֧�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_GetProtocolName(HI_CHAR *pProtocolName, HI_S32 s32BufLen);

/**
\brief Obtains the key values and key status of the remote control.
CNcomment:\brief ��ȡң�����İ���ֵ�Ͱ���״̬ ��CNend

\attention \n

\param[out]  penPressStatus  Key status. For details about the definition, see the description of ::HI_UNF_KEY_STATUS_E.  CNcomment:����״̬�����庬����ο�::HI_UNF_KEY_STATUS_E CNend
\param[out]  pu64KeyId	Key value						      CNcomment:����ֵ CNend
\param[out]  pszProtocolName  used to save first address of the protocol name buffer	CNcomment:���ڴ洢Э�����ƵĻ������׵�ַ CNend
\param[in]   s32NameSize      used to save length of the protocol name buffer		CNcomment:���ڴ洢Э�����ƵĻ��������� CNend
\param[in] u32TimeoutMs	 Timeout (in ms). 0: not blocked; 0xFFFFFFFF: infinite block  CNcomment:��ʱֵ, ��λ�Ǻ���, 0 - ������, 0xFFFFFFFF-�������� CNend
\retval HI_SUCCESS Success							      CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			      CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.				      CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA  The parameter is invalid.			      CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_SET_BLOCKTIME_FAILED  The IR device fails to set block time.      CNcomment:��������ʱ��ʧ�� CNend
\retval ::HI_ERR_IR_READ_FAILED	 The IR device fails to read key.		      CNcomment:��ȡ��ֵ��״̬ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_GetValueWithProtocol(HI_UNF_KEY_STATUS_E *penPressStatus, HI_U64 *pu64KeyId,
				      HI_CHAR *pszProtocolName, HI_S32 s32NameSize, HI_U32 u32TimeoutMs);

#define HI_UNF_IR_GetValue(penPressStatus, pu64KeyId, u32TimeoutMs) HI_UNF_IR_GetValueWithProtocol(penPressStatus, \
												   pu64KeyId, NULL, 0, \
												   u32TimeoutMs)


/**
\brief Set key fetch or symbol fetch from ir driver.
CNcomment:\brief �趨�Ӻ���������ȡ���Ǽ�ֵ�������ƽ ��CNend

\attention \n
when IR_TYPE=IR_S2 is effective.
CNcomment:��IR_TYPE=IR_S2ʱ��Ч��CNend

\param[in] mode 0 means key mode. 1 means symbol mode				      CNcomment:0��ȡ��ֵ��1��ȡ���ƽ CNend
\retval HI_SUCCESS Success							      CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			      CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA  The parameter is invalid.			      CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_SET_FETCHMETHOD_FAILED  The IR device fails to set fetch method.  CNcomment:���û�ȡ��ʽʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_SetFetchMode(HI_S32 s32Mode);

/**
\brief Obtains the raw symbols from ir driver.
CNcomment:\brief ��ȡң���������ƽ ��CNend

\attention \n
when IR_TYPE=IR_S2 is effective.
CNcomment:��IR_TYPE=IR_S2ʱ��Ч��CNend

\param[out]  pu64lower	lower pluse value					      CNcomment:���ƽ�Եĵ�λ CNend
\param[out]  pu64upper	upper space value					      CNcomment:���ƽ�Եĸ�λ CNend
\param[in] s32TimeoutMs read timeout .						      CNcomment:����ʱʱ�䡣CNend

\retval HI_SUCCESS Success							      CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.						  CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.								  CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_IR_SET_BLOCKTIME_FAILED  The IR device fails to set block time.      CNcomment:��������ʱ��ʧ�� CNend
\retval ::HI_ERR_IR_READ_FAILED	 The IR device fails to read key.					  CNcomment:��ȡ��ֵ��״̬ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_GetSymbol(HI_U64 *pu64First, HI_U64* pu64Second, HI_U32 u32TimeoutMs);

/**
\brief Enables or disables the function of reporting the released status of a key.
CNcomment:\brief �����Ƿ��ϱ���������״̬��CNend

\attention \n
The function is enabled by default.
CNcomment:�粻���ã�Ĭ��Ϊ�򿪡�CNend

\param[in] bEnable	Key released enable.  CNcomment:����������Ч��CNend
			0: disabled	      CNcomment:0���رգ�CNend
			1: enabled	      CNcomment: 1��ʹ�ܡ�CNend
\retval HI_SUCCESS  Success						CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.		CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA  The parameter is invalid.		CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_SET_KEYUP_FAILED  It fails to enable released key.	CNcomment:�����ϱ���������״̬ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_EnableKeyUp(HI_BOOL bEnable);

/**
\brief Enables or disables the function of reporting the same key value. If keys are pressed and held down, data is continuously transmitted to the receive buffer. Therefore, you can enable or disable this function for applications as required.
CNcomment:\brief �����Ƿ��ϱ��ظ�������һֱ����ʱ�����ݻ�ԴԴ���ϵ����뵽���ջ����������Ӧ�ó�����Ը�����Ҫ�������Ƿ��ϱ��ظ�������CNend

\attention \n
The function is enabled by default.\n
This API must work with HI_UNF_IR_RepKeyTimeoutVal. The API HI_UNF_IR_RepKeyTimeoutVal is used to set the interval of reporting the same key value.\n
If the function of reporting the same key value is enabled, the keys are pressed and held down, and the interval is set to 300 ms, data is reported once every 300 ms.
If the function is disabled, data is reported only once regardless of how long the keys are held down.
CNcomment:�粻���ã�Ĭ��Ϊ��\n
�˽ӿ���Ҫ��HI_UNF_IR_RepKeyTimeoutVal�������ʹ�ã���HI_UNF_IR_RepKeyTimeoutVal�����ϱ��ظ������ļ��\n
���ʹ�����ظ������ϱ���������һֱ���ڰ���״̬�������Ϊ300���룬��ÿ300������ϱ�һ������\n
�����ֹ���ظ������ϱ������۰��¶೤ʱ�䣬ֻ�ϱ�һ�����ݡ�CNend
\param[in] bEnable     Repeat key report enable.    CNcomment:���������ظ��������ܡ�CNend
		       0: disabled		    CNcomment:0���رգ�CNend
		       1: enabled		    CNcomment:1��ʹ�ܡ�CNend
\retval HI_SUCCESS Success						       CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT   The IR device is not initialized.	       CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA   The parameter is invalid.		       CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_SET_REPEAT_FAILED	It fails to enable repeat key.	       CNcomment:�����ϱ��ظ���ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_EnableRepKey(HI_BOOL bEnable);

/**
\brief Sets the interval (in ms) of reporting the same key value.
CNcomment:\brief �����ϱ��ظ�������ʱ��������λΪms ��CNend

\attention \n
This API is unavailable if the function of reporting the same key value is disabled by calling HI_UNF_IR_IsRepKey.
CNcomment:��HI_UNF_IR_IsRepKey����Ϊ���ϱ��ظ�����ʱ���˽ӿ�������Ч��CNend

\param[in] u32TimeoutMs	  Interval of reporting the same key value. The interval ranges from 0 ms to 65,536 ms.\n
						  The value 0 will be set to 108, and the value bigger than 65536 will be set to 65536 \n
			  CNcomment:�ϱ��ظ�������ʱ���������÷�Χ��0ms��65536ms ��\n
						  ����0�Ĳ����ᱻǿ�����ó�108������65536�Ĳ����ᱻǿ�����ó�65536��CNend
\retval HI_SUCCESS Success CNcomment:					       CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.		       CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_SET_REPKEYTIMEOUT_FAILED  It fails to set repeat key timeout.  CNcomment:�����ϱ��ظ��������ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_SetRepKeyTimeoutAttr(HI_U32 u32TimeoutMs);

/**
\brief Sets the code type of the remote control.
CNcomment:\brief ����ң�������͡�CNend

\attention \n
when IR_TYPE=IR_STD is effective.
CNcomment:��IR_TYPE=IR_STDʱ��Ч��CNend


\param[in] enIRCode Four standard code types of the remote control are supported by default.  CNcomment:Ĭ��֧��4�ֱ�׼ң�������ͣ�CNend
		     HI_UNF_IR_CODE_NEC_SIMPLE:Nec With Simple code type. CNcomment:Nec Simple ���͡� CNend
		     HI_UNF_IR_CODE_TC9012:TC9012 code type.		  CNcomment:TC9012 ���͡�     CNend
		     HI_UNF_IR_CODE_NEC_FULL:Nec With Full code type.	  CNcomment:Nec Full ���͡�   CNend
		     HI_UNF_IR_CODE_SONY_12BIT:Sony 12 Bit code type.	  CNcomment:Sony 12 bit ���͡�CNend
\retval HI_SUCCESS Success						   CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.		   CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA   The parameter is invalid.		   CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_SETFORMAT_FAILED It fails to set IR code type.	   CNcomment:����IR����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_SetCodeType(HI_UNF_IR_CODE_E enIRCode);

/**
\brief	Resets the IR device.
CNcomment:\brief  ��λIR�豸��CNend

\attention \n
This API is used to delete the key values in the buffer.
CNcomment:ֻ�ǰ�buffer�еļ�ֵ�����CNend

\param N/A	   CNcomment:�� CNend
\retval HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_RESET_FAILED  The IR device fails to reset.			CNcomment:IR�豸��λʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_Reset(HI_VOID);

/**
\brief enable an infrared code.
CNcomment:\brief  ����ĳ�����ң����Э�顣CNend

\attention \n
when IR_TYPE=IR_S2 is effective.
CNcomment:��IR_TYPE=IR_S2ʱ��Ч��CNend

\param N/A	   CNcomment:�� CNend
\retval HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.							CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA   The parameter is invalid.			CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_ENABLE_PROT_FAILED	It fails to enable an infrared code.	CNcomment:����ң��Э��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_EnableProtocol(HI_CHAR* pszProtocolName);

/**
\brief disable an infrared code.
CNcomment:\brief  ����ĳ�����ң����Э�顣CNend

\attention \n
when IR_TYPE=IR_S2 is effective.
CNcomment:��IR_TYPE=IR_S2ʱ��Ч��CNend

\param N/A	   CNcomment:�� CNend
\retval HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.							CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA   The parameter is invalid.			CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_DISABLE_PROT_FAILED	  It fails to disalbe an infrared code. CNcomment:����ң��Э��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_DisableProtocol(HI_CHAR* pszProtocolName);

/**
\brief get the enable or disable status of  an infrared code.
CNcomment:\brief  ��ȡĳ�����ң����Э�鼤��״̬��CNend

\attention \n
when IR_TYPE=IR_S2 is effective.
CNcomment:��IR_TYPE=IR_S2ʱ��Ч��CNend

\param N/A	   CNcomment:�� CNend
\retval HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval HI_FAILURE Failure							CNcomment:ʧ�� CNend
\retval ::HI_ERR_IR_NOT_INIT  The IR device is not initialized.			CNcomment:IR�豸δ��ʼ�� CNend
\retval ::HI_ERR_IR_NULL_PTR  The pointer is invalid.							CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_IR_INVALID_PARA   The parameter is invalid.			CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_IR_GET_PROTENABLE_FAILED It fails to get status of an infrared code.  CNcomment:��ȡң��Э��״̬ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_IR_GetProtocolEnabled(HI_CHAR* pszProtocolName, HI_BOOL *pbEnabled);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* End of #ifndef __HI_UNF_IR_H__ */
