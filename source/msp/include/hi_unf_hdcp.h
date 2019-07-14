/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_UNF_HDCP_H__
#define __HI_UNF_HDCP_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     HDCP */
/** @{ */  /** <!-- [HDCP] */

typedef struct hiUNF_DECRYPT_HDCP_S
{
	HI_U8 u8KSV[5];				/**< HDCP KSV:40bits, Orignal data */
	HI_U8 u8PrivateKey[280];		/**< HDCP Device Private key:40*56bits, Orignal data */
}HI_UNF_HDCP_DECRYPT_S;

/** Encrypted HDCP key */
/** CNcomment:���ܵ�HDCP key */
typedef struct hiUNF_ENCRYPT_HDCP_S
{
	HI_U8 u8EncryptKey[384];
}HI_UNF_HDCP_ENCRYPT_S;


typedef struct hiUNF_HDCPKEY_HDCP_S
{
    HI_BOOL EncryptionFlag;		    /**< HI_TRUE:Encryption, HI_FALSE: Unencryption */
    union
    {
	HI_UNF_HDCP_DECRYPT_S DecryptData;
	HI_UNF_HDCP_ENCRYPT_S EncryptData;
    }key;									/**< Key = DecryptData,if EncryptionFlag == HI_FALSE.if EncryptionFlag == HI_TRUE,key = Encrpytiondata */
    HI_U32 Reserved;			    /**< Reserved for future use */
}HI_UNF_HDCP_HDCPKEY_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     HDCP */
/** @{ */  /** <!-- [HDCP] */


/**
\brief Encrypt HDCP key. HDCP key is encrypted using hdcp root key in otp when bIsUseOTPRootKey equals 'HI_TRUE' or using key defined by hisilicon when bIsUseOTPRootKey equals 'HI_FALSE'.
\n Additional descryption:Only the 'HDMIIP_HDCPKey' is encrypted. The HDCP key format shows belows:
\n	  head		      HDMIIP_HDCPKey		   CRC32_0 CRC32_1
\n		|-------|-----------------------------------------|------|------|
\n
\brief CNcomment: ���ܿͻ����õ�HDCP key��ͨ�� bIsUseOTPRootKey ѡ���Ƿ�ʹ��OTP�ڲ���RootKey�������ݻ���ʹ�ú�˼�̶���key�������ݡ� CNend
\attention \n The encrypted data(u8OutEncryptKey) include two CRC32 values.CRC32_1 is used to verify the integration of the whole data, and CRC32_0 is used to debug.  CNcomment: ���ܵ�����u8OutEncryptKey����2��CRCУ��ֵ��CRC32_1 ���������������жϣ�CRC32_0���ڵ���ʹ�á� CNend
\param[in]:stHdcpKey.This parameter is used to define hdcp key in encrypted mode or clear mode.	 CNcomment: �ò���ΪHDCP key�Ĳ�������,��������/�Ǽ��ܵķ�ʽ. CNend
\param[in]:IsUseOTPRootKey. This parameter is used to select the key(key in otp or a fixed key by hisilicon).  CNcomment: �Ƿ�ʹ��OTP/EFUSE����д��HdcpRootKey����HDCP key. CNend
\param[out]:u8OutEncryptKey. Output the encrypted hdcp key.   CNcomment: ����ļ��ܺ��HDCP KEY������ CNend
\retval HI_SUCCESS  Call this API succussful.	CNcomment:APIϵͳ���óɹ��� CNend
\retval HI_FAILURE  Call this API fails.		CNcomment:APIϵͳ����ʧ�ܡ� CNend
*/
HI_S32	HI_UNF_HDCP_EncryptHDCPKey(HI_UNF_HDCP_HDCPKEY_S stHdcpKey, HI_BOOL bIsUseHdcpRootKey, HI_U8 u8OutEncryptKey[332]);

/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_HDCP_H__ */
