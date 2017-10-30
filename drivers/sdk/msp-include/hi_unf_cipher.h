/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_UNF_CIPHER_H__
#define __HI_UNF_CIPHER_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */
/*************************** Structure Definition ****************************/
/** \addtogroup	     CIPHER */
/** @{ */  /** <!-- [CIPHER] */

/** max length of SM2, unit: word */
/** CNcomment: SM2���ݳ��ȣ���λword */
#define SM2_LEN_IN_WROD			  (8)

/** max length of SM2, unit: byte */
/** CNcomment: SM2���ݳ��ȣ���λbyte */
#define SM2_LEN_IN_BYTE			  (SM2_LEN_IN_WROD * 4)

/** CIPHER set IV for first package */
/** CNcomment: CIPHER ֻ����һ�����ݰ���IV */
#define CIPHER_IV_CHANGE_ONE_PKG	(1)

/** CIPHER set IV for first package */
/** CNcomment: CIPHER �����������ݰ���IV */
#define CIPHER_IV_CHANGE_ALL_PKG	(2)

/** Cipher work mode */
/** CNcomment:CIPHER����ģʽ */
typedef enum hiHI_UNF_CIPHER_WORK_MODE_E
{
    HI_UNF_CIPHER_WORK_MODE_ECB,	/**<Electronic codebook (ECB) mode*/	/**< CNcomment:ECBģʽ */
    HI_UNF_CIPHER_WORK_MODE_CBC,	/**<Cipher block chaining (CBC) mode*/	/**< CNcomment:CBCģʽ */
    HI_UNF_CIPHER_WORK_MODE_CFB,	/**<Cipher feedback (CFB) mode*/	/**< CNcomment:CFBģʽ */
    HI_UNF_CIPHER_WORK_MODE_OFB,	/**<Output feedback (OFB) mode*/	/**< CNcomment:OFBģʽ */
    HI_UNF_CIPHER_WORK_MODE_CTR,	/**<Counter (CTR) mode*/		/**< CNcomment:CTRģʽ */
    HI_UNF_CIPHER_WORK_MODE_CCM,	/**<Counter (CCM) mode*/		/**< CNcomment:CCMģʽ */
    HI_UNF_CIPHER_WORK_MODE_GCM,	/**<Counter (GCM) mode*/		/**< CNcomment:GCMģʽ */
    HI_UNF_CIPHER_WORK_MODE_BUTT
}HI_UNF_CIPHER_WORK_MODE_E;

/** Cipher algorithm */
/** CNcomment:CIPHER�����㷨 */
typedef enum hiHI_UNF_CIPHER_ALG_E
{
    HI_UNF_CIPHER_ALG_DES	    = 0x0,  /**< Data encryption standard (DES) algorithm */	 /**< CNcomment: DES�㷨 */
    HI_UNF_CIPHER_ALG_3DES	    = 0x1,  /**< 3DES algorithm */				 /**< CNcomment: 3DES�㷨 */
    HI_UNF_CIPHER_ALG_AES	    = 0x2,  /**< Advanced encryption standard (AES) algorithm */ /**< CNcomment: AES�㷨 */
    HI_UNF_CIPHER_ALG_SM1	    = 0x3,  /**<SM1 algorithm*/	 /**< CNcomment: SM1�㷨 */
    HI_UNF_CIPHER_ALG_SM4	    = 0x4,  /**<SM4 algorithm*/	 /**< CNcomment: SM4�㷨 */
    HI_UNF_CIPHER_ALG_DMA	    = 0x5,  /**<DMA copy*/  /**< CNcomment: DMA���� */
    HI_UNF_CIPHER_ALG_BUTT	    = 0x6
}HI_UNF_CIPHER_ALG_E;

/** Key length */
/** CNcomment: ��Կ���� */
typedef enum hiHI_UNF_CIPHER_KEY_LENGTH_E
{
    HI_UNF_CIPHER_KEY_AES_128BIT    = 0x0,  /**< 128-bit key for the AES algorithm */ /**< CNcomment:AES���㷽ʽ�²���128bit��Կ���� */
    HI_UNF_CIPHER_KEY_AES_192BIT    = 0x1,  /**< 192-bit key for the AES algorithm */ /**< CNcomment:AES���㷽ʽ�²���192bit��Կ���� */
    HI_UNF_CIPHER_KEY_AES_256BIT    = 0x2,  /**< 256-bit key for the AES algorithm */ /**< CNcomment:AES���㷽ʽ�²���256bit��Կ���� */
    HI_UNF_CIPHER_KEY_DES_3KEY	    = 0x2,  /**< Three keys for the DES algorithm */  /**< CNcomment:DES���㷽ʽ�²���3��key */
    HI_UNF_CIPHER_KEY_DES_2KEY	    = 0x3,  /**< Two keys for the DES algorithm */    /**< CNcomment: DES���㷽ʽ�²���2��key  */
    HI_UNF_CIPHER_KEY_DEFAULT	    = 0x0,  /**< default key length, DES-8, SM1-48, SM4-16 */	 /**< CNcomment: Ĭ��Key���ȣ�DES-8, SM1-48, SM4-16*/
}HI_UNF_CIPHER_KEY_LENGTH_E;

/** Cipher bit width */
/** CNcomment: ����λ�� */
typedef enum hiHI_UNF_CIPHER_BIT_WIDTH_E
{
    HI_UNF_CIPHER_BIT_WIDTH_64BIT   = 0x0,  /**< 64-bit width */   /**< CNcomment:64bitλ�� */
    HI_UNF_CIPHER_BIT_WIDTH_8BIT    = 0x1,  /**< 8-bit width */	   /**< CNcomment:8bitλ�� */
    HI_UNF_CIPHER_BIT_WIDTH_1BIT    = 0x2,  /**< 1-bit width */	   /**< CNcomment:1bitλ�� */
    HI_UNF_CIPHER_BIT_WIDTH_128BIT  = 0x3,  /**< 128-bit width */  /**< CNcomment:128bitλ�� */
}HI_UNF_CIPHER_BIT_WIDTH_E;

/** Cipher control parameters */
/** CNcomment:���ܿ��Ʋ��������־ */
typedef struct hiUNF_CIPHER_CTRL_CHANGE_FLAG_S
{
    HI_U32   bit1IV:4;		    /**< Initial Vector change flag, 0-don't set, 1-set IV for first package, 2-set IV for each package	 */ /**< CNcomment:�������, 0-�����ã�1-ֻ���õ�һ������2-ÿ���������� */
    HI_U32   bitsResv:28;	    /**< Reserved */			 /**< CNcomment:���� */
}HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S;

/** Key ladder selecting parameters */
/** CNcomment:ʹ���ĸ�key ladder��־ */
typedef enum hiUNF_CIPHER_CA_TYPE_E
{
    HI_UNF_CIPHER_CA_TYPE_R2R	= 0x0,	    /**< Using R2R key ladder */						 /**< CNcomment:ʹ��R2R key ladder */
    HI_UNF_CIPHER_CA_TYPE_SP,		    /**< Using SP key ladder */							 /**< CNcomment:ʹ��SP key ladder */
    HI_UNF_CIPHER_CA_TYPE_CSA2,		    /**< Using CSA2 key ladder */						 /**< CNcomment:ʹ��CSA2 key ladder */
    HI_UNF_CIPHER_CA_TYPE_CSA3,		    /**< Using CSA3 key ladder */						 /**< CNcomment:ʹ��CSA3 key ladder */
    HI_UNF_CIPHER_CA_TYPE_MISC,		    /**< Using MISC ladder */							 /**< CNcomment:ʹ��SP key ladder */
    HI_UNF_CIPHER_CA_TYPE_GDRM,		    /**< Using GDRM ladder */							 /**< CNcomment:ʹ��GDRM key ladder */
    HI_UNF_CIPHER_CA_TYPE_BLPK,		    /**< Using BLPK ladder */							 /**< CNcomment:ʹ��BLPK key ladder */
    HI_UNF_CIPHER_CA_TYPE_LPK,		    /**< Using LPK ladder */							 /**< CNcomment:ʹ��LPK key ladder */
    HI_UNF_CIPHER_CA_TYPE_IRDETO_HCA,	    /**< Using Irdeto high level code authentication key ladder, only used for Irdeto MSR2.2 */ /**< CNcomment:Irdeto�ϲ�Ӧ��У��keyladder��������Irdeto MSR2.2 */
    HI_UNF_CIPHER_CA_TYPE_STBROOTKEY,	    /**< Useing for AntiCopy With STB_Root_Key	*/						    /**< CNcomment:ʹ��STB_Root_Key�ӽ���,���ڷ����� */
    HI_UNF_CIPHER_CA_TYPE_BUTT
}HI_UNF_CIPHER_CA_TYPE_E;

/** Encryption/Decryption type selecting */
/** CNcomment:CIPHE�ӽ�������ѡ�� */
typedef enum
{
    HI_UNF_CIPHER_TYPE_NORMAL	    = 0x0,
    HI_UNF_CIPHER_TYPE_COPY_AVOID,
    HI_UNF_CIPHER_TYPE_BUTT,
}HI_UNF_CIPHER_TYPE_E;

/** Structure of the cipher type */
/** CNcomment:�������ͽṹ */
typedef struct
{
    HI_UNF_CIPHER_TYPE_E enCipherType;
}HI_UNF_CIPHER_ATTS_S;

/** sm1 round config */
/** CNcomment: sm1��������� */
typedef enum hiHI_UNF_CIPHER_SM1_ROUND_E
{
    HI_UNF_CIPHER_SM1_ROUND_08 = 0x00,		/**< sm1 round 08 */ /**< CNcomment:SM1���������Ϊ08 */
    HI_UNF_CIPHER_SM1_ROUND_10 = 0x01,		/**< sm1 round 10 */ /**< CNcomment:SM1���������Ϊ10 */
    HI_UNF_CIPHER_SM1_ROUND_12 = 0x02,		/**< sm1 round 12 */ /**< CNcomment:SM1���������Ϊ12 */
    HI_UNF_CIPHER_SM1_ROUND_14 = 0x03,		/**< sm1 round 14 */ /**< CNcomment:SM1���������Ϊ14 */
    HI_UNF_CIPHER_SM1_ROUND_BUTT,
}HI_UNF_CIPHER_SM1_ROUND_E;

/** Structure of the cipher control information */
/** CNcomment:���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_S
{
    HI_U32 u32Key[8];				    /**< Key input */													  /**< CNcomment:������Կ */
    HI_U32 u32IV[4];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_BOOL bKeyByCA;				    /**< Encryption using advanced conditional access (CA) or decryption using keys */					  /**< CNcomment:�Ƿ�ʹ�ø߰�ȫCA���ܻ����Key */
    HI_UNF_CIPHER_CA_TYPE_E enCaType;			/**< Select keyladder type when using advanced CA */								      /**< CNcomment:ʹ�ø߰�ȫCAʱ,ѡ��������͵�keyladder */
    HI_UNF_CIPHER_ALG_E enAlg;			    /**< Cipher algorithm */												  /**< CNcomment:�����㷨 */
    HI_UNF_CIPHER_BIT_WIDTH_E enBitWidth;	    /**< Bit width for encryption or decryption */									  /**< CNcomment:���ܻ���ܵ�λ�� */
    HI_UNF_CIPHER_WORK_MODE_E enWorkMode;	    /**< Operating mode */												  /**< CNcomment:����ģʽ */
    HI_UNF_CIPHER_KEY_LENGTH_E enKeyLen;	    /**< Key length */													  /**< CNcomment:��Կ���� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_S;

/** Structure of the cipher AES control information */
/** CNcomment:AES���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_AES_S
{
    HI_U32 u32EvenKey[8];			    /**< Key input, default use this key*/										  /**< CNcomment:����ż��Կ, Ĭ��ʹ��ż��Կ */
    HI_U32 u32OddKey[8];			    /**< Key input, only valid for Multi encrypt/decrypt*/								  /**< CNcomment:��������Կ, ֻ�Զ���ӽ�����Ч */
    HI_U32 u32IV[4];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_BIT_WIDTH_E enBitWidth;	    /**< Bit width for encryption or decryption */									  /**< CNcomment:���ܻ���ܵ�λ�� */
    HI_UNF_CIPHER_KEY_LENGTH_E enKeyLen;	    /**< Key length */													  /**< CNcomment:��Կ���� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_AES_S;

/** Structure of the cipher AES CCM/GCM control information */
/** CNcomment:AES CCM/GCM ���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_AES_CCM_GCM_S
{
    HI_U32 u32Key[8];				    /**< Key input */													  /**< CNcomment:������Կ */
    HI_U32 u32IV[4];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_KEY_LENGTH_E enKeyLen;	    /**< Key length */													  /**< CNcomment:��Կ���� */
    HI_U32 u32IVLen;				    /**< IV lenght for CCM/GCM, which is an element of {4,6,8,10,12,14,16} for CCM, and is an element of [1-16] for GCM*/  /**< CNcomment: CCM/GCM��IV���ȣ�CCM��ȡֵ��Χ{7, 8, 9, 10, 11, 12, 13}�� GCM��ȡֵ��Χ[1-16]*/
    HI_U32 u32TagLen;				    /**< Tag lenght for CCM which is an element of {4,6,8,10,12,14,16}*/	  /**< CNcomment: CCM��TAG���ȣ�ȡֵ��Χ{4,6,8,10,12,14,16}*/
    HI_U32 u32ALen;				    /**< Associated data for CCM and GCM*/					  /**< CNcomment: CCM/GCM�Ĺ������ݳ���*/
    HI_U32 u32APhyAddr;				    /**< Physical address of Associated data for CCM and GCM*/					      /**< CNcomment: CCM/GCM�Ĺ������ݳ���*/
} HI_UNF_CIPHER_CTRL_AES_CCM_GCM_S;

/** Structure of the cipher DES control information */
/** CNcomment:DES���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_DES_S
{
    HI_U32 u32Key[2];				    /**< Key input */													  /**< CNcomment:����ż��Կ */
    HI_U32 u32IV[2];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_BIT_WIDTH_E enBitWidth;	    /**< Bit width for encryption or decryption */									  /**< CNcomment:���ܻ���ܵ�λ�� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_DES_S;

/** Structure of the cipher 3DES control information */
/** CNcomment:3DES���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_3DES_S
{
    HI_U32 u32Key[6];				    /**< Key input */													  /**< CNcomment:����ż��Կ */
    HI_U32 u32IV[2];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_BIT_WIDTH_E enBitWidth;	    /**< Bit width for encryption or decryption */									  /**< CNcomment:���ܻ���ܵ�λ�� */
    HI_UNF_CIPHER_KEY_LENGTH_E enKeyLen;	    /**< Key length */													  /**< CNcomment:��Կ���� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_3DES_S;

/** Structure of the cipher SM1 control information */
/** CNcomment:SM1���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_SM1_S
{
    HI_U32 u32EK[4];				   /**< Key of EK input */												  /**< CNcomment:������ԿEK */
    HI_U32 u32AK[4];				   /**< Key of AK input */												  /**< CNcomment:������ԿAK */
    HI_U32 u32SK[4];				   /**< Key of SK input */												  /**< CNcomment:������ԿSK */
    HI_U32 u32IV[4];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_SM1_ROUND_E enSm1Round;	    /**< SM1 round number, should be 8, 10, 12 or 14*/													  /**< CNcomment:sm1������������� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_SM1_S;

/** Structure of the cipher SM4 control information */
/** CNcomment:SM4���ܿ�����Ϣ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_SM4_S
{
    HI_U32 u32Key[4];				    /**< Key  input */													  /**< CNcomment:������Կ */
    HI_U32 u32IV[4];				    /**< Initialization vector (IV) */											  /**< CNcomment:��ʼ���� */
    HI_UNF_CIPHER_CTRL_CHANGE_FLAG_S stChangeFlags; /**< control information exchange choices, we default all woulde be change except they have been in the choices */	  /**< CNcomment:������Ϣ���ѡ�ѡ����û�б�ʶ����Ĭ��ȫ����� */
} HI_UNF_CIPHER_CTRL_SM4_S;

/** Expand Structure of the cipher control information */
/** CNcomment:���ܿ�����Ϣ��չ�ṹ */
typedef struct hiHI_UNF_CIPHER_CTRL_EX_S
{
    HI_UNF_CIPHER_ALG_E enAlg;			    /**< Cipher algorithm */												  /**< CNcomment:�����㷨 */
    HI_UNF_CIPHER_WORK_MODE_E enWorkMode;	    /**< Operating mode */												  /**< CNcomment:����ģʽ */
    HI_BOOL bKeyByCA;				    /**< Encryption using advanced conditional access (CA) or decryption using keys */					  /**< CNcomment:�Ƿ�ʹ�ø߰�ȫCA���ܻ����Key */
    /**< Parameter for special algorithm
	for AES, the pointer should point to HI_UNF_CIPHER_CTRL_AES_S;
	for AES_CCM or AES_GCM, the pointer should point to HI_UNF_CIPHER_CTRL_AES_CCM_GCM_S;
	for DES, the pointer should point to HI_UNF_CIPHER_CTRL_DES_S;
	for 3DES, the pointer should point to HI_UNF_CIPHER_CTRL_3DES_S;
	for SM1, the pointer should point to HI_UNF_CIPHER_CTRL_SM1_S;
	for SM4, the pointer should point to HI_UNF_CIPHER_CTRL_SM4_S;
    */
    /**< CNcomment: �㷨��ר�ò���
	���� AES, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_AES_S;
	���� AES_CCM �� AES_GCM, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_AES_CCM_GCM_S;
	���� DES, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_DES_S;
	���� 3DES, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_3DES_S;
	���� SM1, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_SM1_S;
	���� SM4, ָ��Ӧָ�� HI_UNF_CIPHER_CTRL_SM4_S;
    */
    HI_VOID *pParam;
} HI_UNF_CIPHER_CTRL_EX_S;

/** Cipher data */
/** CNcomment:�ӽ������� */
typedef struct hiHI_UNF_CIPHER_DATA_S
{
    HI_U32 u32SrcPhyAddr;     /**< phy address of the original data */	 /**< CNcomment:Դ����������ַ */
    HI_U32 u32DestPhyAddr;    /**< phy address of the purpose data */	 /**< CNcomment:Ŀ������������ַ */
    HI_U32 u32ByteLength;     /**< cigher data length*/			/**< CNcomment:�ӽ������ݳ��� */
    HI_BOOL bOddKey;	/**< Use odd key or even key*/			/**< CNcomment:�Ƿ�ʹ������Կ */
} HI_UNF_CIPHER_DATA_S;

/** Hash algrithm type */
/** CNcomment:��ϣ�㷨���� */
typedef enum hiHI_UNF_CIPHER_HASH_TYPE_E
{
    HI_UNF_CIPHER_HASH_TYPE_SHA1,
    HI_UNF_CIPHER_HASH_TYPE_SHA224,
    HI_UNF_CIPHER_HASH_TYPE_SHA256,
    HI_UNF_CIPHER_HASH_TYPE_SHA384,
    HI_UNF_CIPHER_HASH_TYPE_SHA512,
    HI_UNF_CIPHER_HASH_TYPE_HMAC_SHA1,
    HI_UNF_CIPHER_HASH_TYPE_HMAC_SHA224,
    HI_UNF_CIPHER_HASH_TYPE_HMAC_SHA256,
    HI_UNF_CIPHER_HASH_TYPE_HMAC_SHA384,
    HI_UNF_CIPHER_HASH_TYPE_HMAC_SHA512,
    HI_UNF_CIPHER_HASH_TYPE_SM3,
    HI_UNF_CIPHER_HASH_TYPE_IRDETO_CBCMAC, /**< Irdeto MSR2.2 CBC-MAC*/ /**< CNcomment: Irdeto MSR2.2 CBC-MAC*/
    HI_UNF_CIPHER_HASH_TYPE_BUTT,
}HI_UNF_CIPHER_HASH_TYPE_E;

/** Hash init struct input */
/** CNcomment:��ϣ�㷨��ʼ������ṹ�� */
typedef struct
{
    HI_U8 *pu8HMACKey;
    HI_U32 u32HMACKeyLen;
    HI_UNF_CIPHER_HASH_TYPE_E eShaType;
}HI_UNF_CIPHER_HASH_ATTS_S;

typedef enum hiHI_UNF_CIPHER_RSA_ENC_SCHEME_E
{
    HI_UNF_CIPHER_RSA_ENC_SCHEME_NO_PADDING,		/**< without padding */		    /**< CNcomment: ����� */
    HI_UNF_CIPHER_RSA_ENC_SCHEME_BLOCK_TYPE_0,		/**< PKCS#1 block type 0 padding*/  /**< CNcomment: PKCS#1��block type 0��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_BLOCK_TYPE_1,		/**< PKCS#1 block type 1 padding*/  /**< CNcomment: PKCS#1��block type 1��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_BLOCK_TYPE_2,		/**< PKCS#1 block type 2 padding*/  /**< CNcomment: PKCS#1��block type 2��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_OAEP_SHA1,	/**< PKCS#1 RSAES-OAEP-SHA1 padding*/	 /**< CNcomment: PKCS#1��RSAES-OAEP-SHA1��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_OAEP_SHA224,	/**< PKCS#1 RSAES-OAEP-SHA224 padding*/	 /**< CNcomment: PKCS#1��RSAES-OAEP-SHA224��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_OAEP_SHA256,	/**< PKCS#1 RSAES-OAEP-SHA256 padding*/	 /**< CNcomment: PKCS#1��RSAES-OAEP-SHA256��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_OAEP_SHA384,	/**< PKCS#1 RSAES-OAEP-SHA384 padding*/	   /**< CNcomment: PKCS#1��RSAES-OAEP-SHA384��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_OAEP_SHA512,	/**< PKCS#1 RSAES-OAEP-SHA512 padding*/	 /**< CNcomment: PKCS#1��RSAES-OAEP-SHA512��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_RSAES_PKCS1_V1_5,	/**< PKCS#1 RSAES-PKCS1_V1_5 padding*/	 /**< CNcomment: PKCS#1��PKCS1_V1_5��䷽ʽ*/
    HI_UNF_CIPHER_RSA_ENC_SCHEME_BUTT,
}HI_UNF_CIPHER_RSA_ENC_SCHEME_E;

typedef enum hiHI_UNF_CIPHER_RSA_SIGN_SCHEME_E
{
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA1 = 0x100, /**< PKCS#1 RSASSA_PKCS1_V15_SHA1 signature*/	 /**< CNcomment: PKCS#1 RSASSA_PKCS1_V15_SHA1ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA224,	 /**< PKCS#1 RSASSA_PKCS1_V15_SHA224 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_V15_SHA224ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA256,	 /**< PKCS#1 RSASSA_PKCS1_V15_SHA256 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_V15_SHA256ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA384,	 /**< PKCS#1 RSASSA_PKCS1_V15_SHA384 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_V15_SHA384ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_V15_SHA512,	 /**< PKCS#1 RSASSA_PKCS1_V15_SHA512 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_V15_SHA512ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA1,	 /**< PKCS#1 RSASSA_PKCS1_PSS_SHA1 signature*/	 /**< CNcomment: PKCS#1 RSASSA_PKCS1_PSS_SHA1ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA224,	 /**< PKCS#1 RSASSA_PKCS1_PSS_SHA224 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_PSS_SHA224ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA256,	 /**< PKCS#1 RSASSA_PKCS1_PSS_SHA256 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_PSS_SHA256ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA384,	 /**< PKCS#1 RSASSA_PKCS1_PSS_SHA1 signature*/	 /**< CNcomment: PKCS#1 RSASSA_PKCS1_PSS_SHA384ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_RSASSA_PKCS1_PSS_SHA512,	 /**< PKCS#1 RSASSA_PKCS1_PSS_SHA256 signature*/   /**< CNcomment: PKCS#1 RSASSA_PKCS1_PSS_SHA512ǩ���㷨*/
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_BUTT,
}HI_UNF_CIPHER_RSA_SIGN_SCHEME_E;

typedef struct
{
    HI_U8  *pu8N;	       /**< point to public modulus  */	  /**< CNcomment: ָ��RSA��ԿN��ָ��*/
    HI_U8  *pu8E;	       /**< point to public exponent */	  /**< CNcomment: ָ��RSA��ԿE��ָ��*/
    HI_U16 u16NLen;	       /**< length of public modulus, max value is 512Byte*/  /**< CNcomment: RSA��ԿN�ĳ���, ���Ϊ512Byte*/
    HI_U16 u16ELen;	       /**< length of public exponent, max value is 512Byte*/  /**< CNcomment: RSA��ԿE�ĳ���, ���Ϊ512Byte*/
}HI_UNF_CIPHER_RSA_PUB_KEY_S;

/** RSA private key struct */
/** CNcomment:RSA˽Կ�ṹ�� */
typedef struct
{
    HI_U8 *pu8N;		      /*!<  public modulus    */ /**< CNcomment: ָ��RSA��ԿN��ָ��*/
    HI_U8 *pu8E;		      /*!<  public exponent   */ /**< CNcomment: ָ��RSA��ԿE��ָ��*/
    HI_U8 *pu8D;		      /*!<  private exponent  */ /**< CNcomment: ָ��RSA˽ԿD��ָ��*/
    HI_U8 *pu8P;		      /*!<  1st prime factor  */ /**< CNcomment: ָ��RSA˽ԿP��ָ��*/
    HI_U8 *pu8Q;		      /*!<  2nd prime factor  */ /**< CNcomment: ָ��RSA˽ԿQ��ָ��*/
    HI_U8 *pu8DP;		      /*!<  D % (P - 1)	      */ /**< CNcomment: ָ��RSA˽ԿDP��ָ��*/
    HI_U8 *pu8DQ;		      /*!<  D % (Q - 1)	      */ /**< CNcomment: ָ��RSA˽ԿDQ��ָ��*/
    HI_U8 *pu8QP;		      /*!<  1 / (Q % P)	      */ /**< CNcomment: ָ��RSA˽ԿQP��ָ��*/
    HI_U16 u16NLen;		      /**< length of public modulus */	 /**< CNcomment: RSA��ԿN�ĳ���*/
    HI_U16 u16ELen;		      /**< length of public exponent */	 /**< CNcomment: RSA��ԿE�ĳ���*/
    HI_U16 u16DLen;		      /**< length of private exponent */ /**< CNcomment: RSA˽ԿD�ĳ���*/
    HI_U16 u16PLen;		      /**< length of 1st prime factor */ /**< CNcomment: RSA˽ԿP�ĳ���*/
    HI_U16 u16QLen;		      /**< length of 2nd prime factor */ /**< CNcomment: RSA˽ԿQ�ĳ���*/
    HI_U16 u16DPLen;		      /**< length of D % (P - 1) */	 /**< CNcomment: RSA˽ԿDP�ĳ���*/
    HI_U16 u16DQLen;		      /**< length of D % (Q - 1) */	 /**< CNcomment: RSA˽ԿDQ�ĳ���*/
    HI_U16 u16QPLen;		      /**< length of 1 / (Q % P) */	 /**< CNcomment: RSA˽ԿQP�ĳ���*/
}HI_UNF_CIPHER_RSA_PRI_KEY_S;

/** RSA public key encryption struct input */
/** CNcomment:RSA ��Կ�ӽ����㷨�����ṹ�� */
typedef struct
{
    HI_UNF_CIPHER_RSA_ENC_SCHEME_E enScheme;   /** RSA encryption scheme*/ /** CNcomment:RSA���ݼӽ����㷨����*/
    HI_UNF_CIPHER_RSA_PUB_KEY_S stPubKey;      /** RSA private key struct */ /** CNcomment:RSA˽Կ�ṹ�� */
}HI_UNF_CIPHER_RSA_PUB_ENC_S;

/** RSA private key decryption struct input */
/** CNcomment:RSA ˽Կ�����㷨�����ṹ�� */
typedef struct
{
    HI_UNF_CIPHER_RSA_ENC_SCHEME_E enScheme; /** RSA encryption scheme */ /** CNcomment:RSA���ݼӽ����㷨*/
    HI_UNF_CIPHER_RSA_PRI_KEY_S stPriKey;    /** RSA private key struct */ /** CNcomment:RSA˽Կ�ṹ�� */
}HI_UNF_CIPHER_RSA_PRI_ENC_S;

/** RSA signature struct input */
/** CNcomment:RSAǩ���㷨�����ṹ�� */
typedef struct
{
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_E enScheme;  /** RSA signature scheme*/ /** CNcomment:RSA����ǩ������*/
    HI_UNF_CIPHER_RSA_PRI_KEY_S stPriKey;      /** RSA private key struct */ /** CNcomment:RSA˽Կ�ṹ�� */
 }HI_UNF_CIPHER_RSA_SIGN_S;

/** RSA signature verify struct input */
/** CNcomment:RSAǩ����֤�㷨��������ṹ�� */
typedef struct
{
    HI_UNF_CIPHER_RSA_SIGN_SCHEME_E enScheme; /** RSA signature scheme*/ /** CNcomment:RSA����ǩ������*/
    HI_UNF_CIPHER_RSA_PUB_KEY_S stPubKey;     /** RSA public key struct */ /** CNcomment:RSA��Կ�ṹ�� */
 }HI_UNF_CIPHER_RSA_VERIFY_S;

 /** SM2 signature struct input */
/** CNcomment: SM2ǩ���㷨�����ṹ�� */
 typedef struct hiHI_UNF_CIPHER_SM2_SIGN_S
{
    HI_U32 u32d[SM2_LEN_IN_WROD];
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
    HI_U8 *pu8Id;
    HI_U16 u16IdLen;
}HI_UNF_CIPHER_SM2_SIGN_S;

/** SM2 signature verify struct input */
/** CNcomment: SM2ǩ����֤�㷨��������ṹ�� */
typedef struct hiHI_UNF_CIPHER_SM2_VERIFY_S
{
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
    HI_U8 *pu8Id;
    HI_U16 u16IdLen;
}HI_UNF_CIPHER_SM2_VERIFY_S;

/** SM2 publuc key encryption struct input */
/** CNcomment: SM2��Կ�����㷨�����ṹ�� */
typedef struct hiHI_UNF_CIPHER_SM2_ENC_S
{
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
}HI_UNF_CIPHER_SM2_ENC_S;

/** SM2 private key decryption struct input */
/** CNcomment: SM2˽Կ�����㷨�����ṹ�� */
typedef struct hiHI_UNF_CIPHER_SM2_DEC_S
{
    HI_U32 u32d[SM2_LEN_IN_WROD];
}HI_UNF_CIPHER_SM2_DEC_S;

/** SM2 key generate struct input */
/** CNcomment: SM2��Կ�����㷨�����ṹ�� */
typedef struct hiHI_UNF_CIPHER_SM2_KEY_S
{
    HI_U32 u32d[SM2_LEN_IN_WROD];
    HI_U32 u32Px[SM2_LEN_IN_WROD];
    HI_U32 u32Py[SM2_LEN_IN_WROD];
}HI_UNF_CIPHER_SM2_KEY_S;

/** Elliptic curve domain parameters. */
/** CNcomment: ECC��Բ���߲��� */
typedef struct
{
  HI_U8 *pu8p; /** Finite field: equal to p in case of prime field curves or equal to 2^n in case of binary field curves.*/
  HI_U8 *pu8a; /** Curve parameter a (q-3 in Suite B).*/
  HI_U8 *pu8b; /** Curve parameter b*/
  HI_U8 *pu8GX;/** X coordinates of G which is a base point on the curve.*/
  HI_U8 *pu8GY;/** Y coordinates of G which is a base point on the curve.*/
  HI_U8 *pu8n; /** Prime which is the order of G point.*/
  HI_U32 u32h; /**<  Cofactor, which is the order of the elliptic curve divided by the order of the point G. For the Suite B curves, h = 1.*/
  HI_U32 u32keySize; /**<  Key size in bytes. It corresponds to the size in bytes of the prime pu8n*/
} HI_UNF_CIPHER_ECC_PARAM_S;


/** @} */  /** <!-- ==== Structure Definition End ==== */


#define HI_UNF_CIPHER_Open(HI_VOID) HI_UNF_CIPHER_Init(HI_VOID);
#define HI_UNF_CIPHER_Close(HI_VOID) HI_UNF_CIPHER_DeInit(HI_VOID);

/******************************* API Declaration *****************************/
/** \addtogroup	     CIPHER */
/** @{ */  /** <!-- [CIPHER] */
/* ---CIPHER---*/
/**
\brief	Init the cipher device.	 CNcomment:��ʼ��CIPHER�豸�� CNend
\attention \n
This API is used to start the cipher device.
CNcomment:���ô˽ӿڳ�ʼ��CIPHER�豸�� CNend
\param N/A									CNcomment:�� CNend
\retval ::HI_SUCCESS  Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_FAILED_INIT  The cipher device fails to be initialized. CNcomment:CIPHER�豸��ʼ��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Init(HI_VOID);


/**
\brief	Deinit the cipher device.
CNcomment:\brief  ȥ��ʼ��CIPHER�豸�� CNend
\attention \n
This API is used to stop the cipher device. If this API is called repeatedly, HI_SUCCESS is returned, but only the first operation takes effect.
CNcomment:���ô˽ӿڹر�CIPHER�豸���ظ��رշ��سɹ�����һ�������á� CNend

\param N/A									CNcomment:�� CNend
\retval ::HI_SUCCESS  Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_DeInit(HI_VOID);


/**
\brief Obtain a cipher handle for encryption and decryption.
CNcomment������һ·Cipher����� CNend

\param[in] cipher attributes							CNcomment:cipher ���ԡ� CNend
\param[out] phCipher Cipher handle						CNcomment:CIPHER����� CNend
\retval ::HI_SUCCESS Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Call this API fails.					CNcomment: APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_POINT  The pointer is null.			CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_CIPHER_FAILED_GETHANDLE  The cipher handle fails to be obtained, because there are no available cipher handles. CNcomment: ��ȡCIPHER���ʧ�ܣ�û�п��е�CIPHER��� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_CreateHandle(HI_HANDLE* phCipher, const HI_UNF_CIPHER_ATTS_S *pstCipherAttr);


/**
\brief Destroy the existing cipher handle. CNcomment:�����Ѵ��ڵ�CIPHER����� CNend
\attention \n
This API is used to destroy existing cipher handles.
CNcomment:���ô˽ӿ������Ѿ�������CIPHER����� CNend

\param[in] hCipher Cipher handle						CNcomment:CIPHER����� CNend
\retval ::HI_SUCCESS  Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_DestroyHandle(HI_HANDLE hCipher);


/**
\brief Configures the cipher control information.
CNcomment:\brief ����CIPHER������Ϣ�� CNend
\attention \n
Before encryption or decryption, you must call this API or HI_UNF_CIPHER_ConfigHandleEx to configure the cipher control information.
The first 64-bit data and the last 64-bit data should not be the same when using TDES algorithm.
Support AES/DES/3DES/SM4 algorithm, support ECB/CBC/CTR/OFB/CFB mode.
CNcomment:���м��ܽ���ǰ������ʹ�ô˽ӿڻ�HI_UNF_CIPHER_ConfigHandleEx����CIPHER�Ŀ�����Ϣ��
ʹ��TDES�㷨ʱ��������Կ��ǰ��64 bit���ݲ�����ͬ��
֧�� AES/DES/3DES/SM4 �㷨, ECB/CBC/CTR/OFB/CFB ģʽ.CNend

\param[in] hCipher Cipher handle.						CNcomment:CIPHER��� CNend
\param[in] pstCtrl Cipher control information.					CNcomment:CIPHER������Ϣ CNend
\retval ::HI_SUCCESS Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_POINT  The pointer is null.			CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  The parameter is invalid.			CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	The handle is invalid.			CNcomment:����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_ConfigHandle(HI_HANDLE hCipher, HI_UNF_CIPHER_CTRL_S* pstCtrl);


/**
\brief Configures the cipher control information.
CNcomment:\brief ����CIPHER������Ϣ�� CNend
\attention \n
Before encryption or decryption, you must call this API or HI_UNF_CIPHER_ConfigHandle to configure the cipher control information.
The first 64-bit data and the last 64-bit data should not be the same when using TDES algorithm.
Support AES/DES/3DES/SM1/SM4 algorithm, support ECB/CBC/CTR/OFB/CFB/CCM/GCM mode.
CNcomment:���м��ܽ���ǰ������ʹ�ô˽ӿڻ�HI_UNF_CIPHER_ConfigHandle����CIPHER�Ŀ�����Ϣ��
ʹ��TDES�㷨ʱ��������Կ��ǰ��64 bit���ݲ�����ͬ��
֧�� AES/DES/3DES/SM1/SM4 �㷨, ECB/CBC/CTR/OFB/CFB/CCM/GCM ģʽ.CNend

\param[in] hCipher Cipher handle.						CNcomment:CIPHER��� CNend
\param[in] pstExCtrl Cipher control information.				CNcomment:CIPHER��չ������Ϣ CNend
\retval ::HI_SUCCESS Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_POINT  The pointer is null.			CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  The parameter is invalid.			CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	The handle is invalid.			CNcomment:����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_ConfigHandleEx(HI_HANDLE hCipher, HI_UNF_CIPHER_CTRL_EX_S* pstExCtrl);


/**
\brief Performs encryption.
CNcomment:\brief ���м��ܡ� CNend

\attention \n
This API is used to perform encryption by using the cipher module.
The length of the encrypted data should be a multiple of 8 in TDES mode and 16 in AES mode. Besides, the length can not be bigger than 0xFFFFF.After this operation, the result will affect next operation.If you want to remove vector, you need to config IV(config pstCtrl->stChangeFlags.bit1IV with 1) by transfering HI_UNF_CIPHER_ConfigHandle.
CNcomment:ʹ��CIPHER���м��ܲ�����TDESģʽ�¼��ܵ����ݳ���Ӧ����8�ı�����AES��Ӧ����16�ı��������⣬�������ݳ��Ȳ��ܳ���0xFFFFF�����β�����ɺ󣬴˴β�������������������������һ�β��������Ҫ�����������Ҫ���´μ��ܲ���֮ǰ����HI_UNF_CIPHER_ConfigHandle��������IV(��Ҫ����pstCtrl->stChangeFlags.bit1IVΪ1)�� CNend
\param[in] hCipher Cipher handle						CNcomment:CIPHER��� CNend
\param[in] u32SrcPhyAddr Physical address of the source data			CNcomment:Դ����������ַ CNend
\param[in] u32DestPhyAddr Physical address of the target data			CNcomment:Ŀ������������ַ CNend
\param[in] u32ByteLength   Length of the encrypted data				CNcomment:�������ݳ��� CNend
\retval ::HI_SUCCESS  Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  The parameter is invalid.			CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	The handle is invalid.			CNcomment:����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Encrypt(HI_HANDLE hCipher, HI_U32 u32SrcPhyAddr, HI_U32 u32DestPhyAddr, HI_U32 u32ByteLength);


/**
\brief Performs decryption.
CNcomment:\brief ���н��� CNend

\attention \n
This API is used to perform decryption by using the cipher module.
The length of the decrypted data should be a multiple of 8 in TDES mode and 16 in AES mode. Besides, the length can not be bigger than 0xFFFFF.After this operation, the result will affect next operation.If you want to remove vector, you need to config IV(config pstCtrl->stChangeFlags.bit1IV with 1) by transfering HI_UNF_CIPHER_ConfigHandle.
CNcomment:ʹ��CIPHER���н��ܲ�����TDESģʽ�½��ܵ����ݳ���Ӧ����8�ı�����AES��Ӧ����16�ı��������⣬�������ݳ��Ȳ��ܳ���0xFFFFF�����β�����ɺ󣬴˴β�������������������������һ�β��������Ҫ�����������Ҫ���´ν��ܲ���֮ǰ����HI_UNF_CIPHER_ConfigHandle��������IV(��Ҫ����pstCtrl->stChangeFlags.bit1IVΪ1)�� CNend
\param[in] hCipher Cipher handle.						CNcomment:CIPHER��� CNend
\param[in] u32SrcPhyAddr Physical address of the source data.			CNcomment:Դ����������ַ CNend
\param[in] u32DestPhyAddr Physical address of the target data.			CNcomment:Ŀ������������ַ CNend
\param[in] u32ByteLength Length of the decrypted data				CNcomment:�������ݳ��� CNend
\retval ::HI_SUCCESS Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  The parameter is invalid.			CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	The handle is invalid.			CNcomment:����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Decrypt(HI_HANDLE hCipher, HI_U32 u32SrcPhyAddr, HI_U32 u32DestPhyAddr, HI_U32 u32ByteLength);


/**
\brief Encrypt multiple packaged data.
CNcomment:\brief ���ж�������ݵļ��ܡ� CNend
\attention \n
You can not encrypt more than 128 data package one time. When HI_ERR_CIPHER_BUSY return, the data package you send will not be deal, the custmer should decrease the number of data package or run cipher again.Note:When encrypting more than one packaged data, every one package will be calculated using initial vector configured by HI_UNF_CIPHER_ConfigHandle.Previous result will not affect the later result.
CNcomment:ÿ�μ��ܵ����ݰ�������಻�ܳ���128��������HI_ERR_CIPHER_BUSY��ʱ���������ݰ�һ��Ҳ���ᱻ�������û���Ҫ������������ݰ������������ٴγ��Լ��ܡ�ע��: ���ڶ�����Ĳ�����ÿ������ʹ��HI_UNF_CIPHER_ConfigHandle���õ������������㣬ǰһ����������������������������һ���������㣬ÿ�������Ƕ�������ġ�ǰһ�κ������õĽ��Ҳ����Ӱ���һ�κ������õ��������� CNend
\param[in] hCipher cipher handle								  CNcomment:CIPHER����� CNend
\param[in] pstDataPkg data package ready for cipher						  CNcomment:�����ܵ����ݰ��� CNend
\param[in] u32DataPkgNum  number of package ready for cipher					  CNcomment:�����ܵ����ݰ������� CNend
\retval ::HI_SUCCESS  Call this API succussful.							  CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.							  CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  cipher device have not been initialized			  CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  parameter error						  CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	handle invalid						  CNcomment:����Ƿ� CNend
\retval ::HI_ERR_CIPHER_BUSY  hardware is busy, it can not deal with all data package once time	  CNcomment:Ӳ����æ���޷�һ���Դ���ȫ�������ݰ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_EncryptMulti(HI_HANDLE hCipher, HI_UNF_CIPHER_DATA_S *pstDataPkg, HI_U32 u32DataPkgNum);


/**
\brief Decrypt multiple packaged data.
CNcomment:\brief ���ж�������ݵĽ��ܡ� CNend
\attention \n
You can not decrypt more than 128 data package one time.When HI_ERR_CIPHER_BUSY return, the data package you send will not be deal, the custmer should decrease the number of data package or run cipher again.Note:When decrypting more than one packaged data, every one package will be calculated using initial vector configured by HI_UNF_CIPHER_ConfigHandle.Previous result will not affect the later result.
CNcomment:ÿ�ν��ܵ����ݰ�������಻�ܳ���128��������HI_ERR_CIPHER_BUSY��ʱ���������ݰ�һ��Ҳ���ᱻ�������û���Ҫ������������ݰ������������ٴγ��Խ��ܡ�ע��: ���ڶ�����Ĳ�����ÿ������ʹ��HI_UNF_CIPHER_ConfigHandle���õ������������㣬ǰһ����������������������������һ���������㣬ÿ�������Ƕ�������ģ�ǰһ�κ������õĽ��Ҳ����Ӱ���һ�κ������õ��������� CNend
\param[in] hCipher cipher handle								 CNcomment:CIPHER����� CNend
\param[in] pstDataPkg data package ready for cipher						 CNcomment:�����ܵ����ݰ��� CNend
\param[in] u32DataPkgNum  number of package ready for cipher					 CNcomment:�����ܵ����ݰ������� CNend
\retval ::HI_SUCCESS  Call this API succussful.							 CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.							 CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  cipher device have not been initialized			 CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  parameter error						 CNcomment:�������� CNend
\retval ::HI_ERR_CIPHER_INVALID_HANDLE	handle invalid						 CNcomment:����Ƿ� CNend
\retval ::HI_ERR_CIPHER_BUSY  hardware is busy, it can not deal with all data package once time	 CNcomment:Ӳ����æ���޷�һ���Դ���ȫ�������ݰ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_DecryptMulti(HI_HANDLE hCipher, HI_UNF_CIPHER_DATA_S *pstDataPkg, HI_U32 u32DataPkgNum);


/**
\brief Get the tag data of CCM/GCM.
CNcomment:\brief ��ȡCCM/GCM��TAG���ݡ� CNend

\attention \n
This API is used to get the tag data of CCM/GCM.
\param[in] hCipher cipher handle						CNcomment:CIPHER����� CNend
\param[out] pu8Tag tag data of CCM/GCM						CNcomment:TAGָ�� CNend
\param[in/out] pu32TagLen tag data length of CCM/GCM, the input should be 16 now. CNcomment:TAG���ݳ��ȣ�����������Ϊ16 CNend
\retval ::HI_SUCCESS  Call this API succussful.					CNcomment:APIϵͳ���óɹ� CNend
\retval ::HI_FAILURE  Call this API fails.					CNcomment:APIϵͳ����ʧ�� CNend
\retval ::HI_ERR_CIPHER_NOT_INIT  The cipher device is not initialized.		CNcomment:CIPHER�豸δ��ʼ�� CNend
\retval ::HI_ERR_CIPHER_INVALID_PARA  The parameter is invalid.			CNcomment:�������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_GetTag(HI_HANDLE hCipher, HI_U8 *pu8Tag, HI_U32 *pu32TagLen);


/**
\brief Get the random number.
CNcomment:\brief ��ȡ������� CNend

\attention \n
This API is used to obtain the random number from the hardware.
CNcomment:���ô˽ӿ����ڻ�ȡ������� CNend

\param[out] pu32RandomNumber Point to the random number.					CNcomment:�������ֵ�� CNend
\retval ::HI_SUCCESS  Call this API succussful.							CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.							CNcomment: APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_GetRandomNumber(HI_U32 *pu32RandomNumber);


/**
\brief Get the AES CBC-MAC value.
CNcomment:\brief ��ȡ���ݵ�AES CBC-MACֵ�� CNend

\attention \n
This API is used to obtain the AES CBC-MAC value.
CNcomment:���ô˽ӿ����ڻ�ȡAES CBC-MACֵ�� CNend
\param[in] hCipherHandle:  The cipher handle.							CNcomment:Cipher����� CNend
\param[in] pInputData: input data.								CNcomment:�������ݡ� CNend
\param[in] u32InputDataLen: input data length,the length should be multiple of 16 bytes if it is not the last block. CNcomment:�������ݵĳ��ȣ�����������һ��block�������Ϊ16��byte�ı����� CNend
\param[in] bIsLastBlock: Whether this block is last block or not.				CNcomment:�Ƿ����һ��block�� CNend
\param[out] pOutputMAC: output CBC-MAC value.							CNcomment:�����CBC-MAC��   CNend
\retval ::HI_SUCCESS  Call this API succussful.							CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.							CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_CalcMAC(HI_HANDLE hCipherHandle, HI_U8 *pInputData, HI_U32 u32InputDataLen,
					HI_U8 *pOutputMAC, HI_BOOL bIsLastBlock);


/**
\brief Init the hash module, if other program is using the hash module, the API will return failure.
CNcomment:\brief ��ʼ��HASHģ�飬�����������������ʹ��HASHģ�飬����ʧ��״̬�� CNend

\attention \n
N/A

\param[in] pstHashAttr: The hash calculating structure input.					   CNcomment:���ڼ���hash�Ľṹ����� CNend
\param[out] pHashHandle: The output hash handle.						CNcomment:�����hash��� CNend
\retval ::HI_SUCCESS  Call this API succussful.							CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.							CNcomment: APIϵͳ����ʧ�� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_HashInit(HI_UNF_CIPHER_HASH_ATTS_S *pstHashAttr, HI_HANDLE *pHashHandle);


/**
\brief Calculate the hash, if the size of the data to be calculated is very big and the DDR ram is not enough, this API can calculate the data one block by one block. Attention: The input block length must be 64bytes alingned except for the last block.
CNcomment:\brief ����hashֵ�������Ҫ������������Ƚϴ󣬸ýӿڿ���ʵ��һ��blockһ��block�ļ��㣬�����������Ƚϴ������£��ڴ治������⡣ �ر�ע�⣬�������һ��block��ǰ���ÿһ������ĳ��ȶ�������64�ֽڶ��롣CNend

\attention \n
N/A

\param[in] hHashHandl:	Hash handle.					    CNcomment:Hash����� CNend
\param[in] pu8InputData:  The input data buffer.			    CNcomment:�������ݻ��� CNend
\param[in] u32InputDataLen:  The input data length, attention: the block length input must be 64bytes aligned except the last block!		CNcomment:�������ݵĳ��ȡ���Ҫ�� �������ݿ�ĳ��ȱ�����64�ֽڶ��룬���һ��block�޴����ơ� CNend
\retval ::HI_SUCCESS  Call this API succussful.				    CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				    CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_HashUpdate(HI_HANDLE hHashHandle, HI_U8 *pu8InputData, HI_U32 u32InputDataLen);


/**
\brief Get the final hash value, after calculate all of the data, call this API to get the final hash value and close the handle.If there is some reason need to interupt the calculation, this API should also be call to close the handle.
CNcomment:��ȡhashֵ���ڼ��������е����ݺ󣬵�������ӿڻ�ȡ���յ�hashֵ���ýӿ�ͬʱ��ر�hash���������ڼ�������У���Ҫ�жϼ��㣬Ҳ������øýӿڹر�hash����� CNend

\attention \n
N/A

\param[in] hHashHandle:	 Hash handle.					    CNcomment:Hash����� CNend
\param[out] pu8OutputHash:  The final output hash value.		    CNcomment:�����hashֵ�� CNend

\retval ::HI_SUCCESS  Call this API succussful.				    CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_HashFinal(HI_HANDLE hHashHandle, HI_U8 *pu8OutputHash);


/**
\brief RSA encryption a plaintext with a RSA public key.
CNcomment:ʹ��RSA��Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstRsaEnc:	encryption struct.				     CNcomment:�������Խṹ�塣 CNend
\param[in] pu8Input��	input data to be encryption			     CNcomment: �����ܵ����ݡ� CNend
\param[out] u32InLen:	length of input data to be encryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8Output�� output data to be encryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32OutLen: length of output data to be encryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaPublicEncrypt(HI_UNF_CIPHER_RSA_PUB_ENC_S *pstRsaEnc,
				  HI_U8 *pu8Input, HI_U32 u32InLen,
				  HI_U8 *pu8Output, HI_U32 *pu32OutLen);


/**
\brief RSA decryption a ciphertext with a RSA private key.
CNcomment:ʹ��RSA˽Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstRsaDec:	decryption struct.				     CNcomment: ��Կ�������Խṹ�塣 CNend
\param[in] pu8Input��	input data to be decryption			     CNcomment: �����ܵ����ݡ� CNend
\param[out] u32InLen:	length of input data to be decryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8Output�� output data to be decryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32OutLen: length of output data to be decryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaPrivateDecrypt(HI_UNF_CIPHER_RSA_PRI_ENC_S *pstRsaDec,
				   HI_U8 *pu8Input, HI_U32 u32InLen,
				   HI_U8 *pu8Output, HI_U32 *pu32OutLen);


/**
\brief RSA encryption a plaintext with a RSA private key.
CNcomment:ʹ��RSA˽Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstRsaSign:	 encryption struct.				     CNcomment:�������Խṹ�塣 CNend
\param[in] pu8Input��	input data to be encryption			     CNcomment: �����ܵ����ݡ� CNend
\param[out] u32InLen:	length of input data to be encryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8Output�� output data to be encryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32OutLen: length of output data to be encryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaPrivateEncrypt(HI_UNF_CIPHER_RSA_PRI_ENC_S *pstRsaEnc,
				   HI_U8 *pu8Input, HI_U32 u32InLen,
				   HI_U8 *pu8Output, HI_U32 *pu32OutLen);


/**
\brief RSA decryption a ciphertext with a RSA public key.
CNcomment:ʹ��RSA��Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstRsaVerify:   decryption struct.				     CNcomment: �������Խṹ�塣 CNend
\param[in] pu8Input��	input data to be decryption			     CNcomment: �����ܵ����ݡ� CNend
\param[out] u32InLen:	length of input data to be decryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8Output�� output data to be decryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32OutLen: length of output data to be decryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaPublicDecrypt(HI_UNF_CIPHER_RSA_PUB_ENC_S *pstRsaDec,
			       HI_U8 *pu8Input, HI_U32 u32InLen,
			       HI_U8 *pu8Output, HI_U32 *pu32OutLen);


/**
\brief RSA signature a context with appendix, where a signer��s RSA private key is used.
CNcomment:ʹ��RSA˽Կǩ��һ���ı��� CNend

\attention \n
N/A

\param[in] pstRsaSign:	    signature struct.					 CNcomment: ǩ�����Խṹ�塣 CNend
\param[in] pu8Input��	    input context to be signature��maybe null		 CNcomment: ��ǩ��������, ���pu8HashData��Ϊ�գ����ָ�տ���Ϊ�ա� CNend
\param[in] u32InLen:	    length of input context to be signature		 CNcomment: ��ǩ�������ݳ��ȡ� CNend
\param[in] pu8HashData��    hash value of context,if NULL, let pu8HashData = Hash(context) automatically   Ncomment: ��ǩ���ı���HASHժҪ�����Ϊ�գ����Զ������ı���HASHժҪ�� CNend
\param[out] pu8OutSign��    output message of signature				 CNcomment: ǩ����Ϣ�� CNend
\param[out] pu32OutSignLen: length of message of signature			 CNcomment: ǩ����Ϣ�����ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaSign(HI_UNF_CIPHER_RSA_SIGN_S *pstRsaSign,
			     HI_U8 *pu8InData, HI_U32 u32InDataLen,
			     HI_U8 *pu8HashData,
			     HI_U8 *pu8OutSign, HI_U32 *pu32OutSignLen);


/**
\brief RSA signature verification a context with appendix, where a signer��s RSA public key is used.
CNcomment:ʹ��RSA��Կǩ����֤һ���ı��� CNend

\attention \n
N/A

\param[in] pstRsaVerify:    signature verification struct.			   CNcomment: ǩ����֤���Խṹ�塣 CNend
\param[in] pu8Input��	    input context to be signature verification��maybe null CNcomment: ��ǩ����֤������, ���pu8HashData��Ϊ�գ����ָ�տ���Ϊ�ա� CNend
\param[in] u32InLen:	    length of input context to be signature		   CNcomment: ��ǩ����֤�����ݳ��ȡ� CNend
\param[in] pu8HashData��    hash value of context,if NULL, let pu8HashData = Hash(context) automatically   Ncomment: ��ǩ���ı���HASHժҪ�����Ϊ�գ����Զ������ı���HASHժҪ�� CNend
\param[in] pu8InSign��	    message of signature				 CNcomment: ǩ����Ϣ�� CNend
\param[in] pu32InSignLen:   length of message of signature			 CNcomment: ǩ����Ϣ�����ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaVerify(HI_UNF_CIPHER_RSA_VERIFY_S *pstRsaVerify,
			       HI_U8 *pu8InData, HI_U32 u32InDataLen,
			       HI_U8 *pu8HashData,
			       HI_U8 *pu8InSign, HI_U32 u32InSignLen);

/**
\brief Generate a RSA private key.
CNcomment:����һ��RSA˽Կ�� CNend

\attention \n
N/A

\param[in] u32NumBits: bit numbers of the integer public modulus. CNcomment: RSA��ԿN��λ���� CNend
\param[in] u32Exponent: value of public exponent. CNcomment: RSA��ԿEֵ�� CNend
\param[out] ptRsaPriKey: private key struct. CNcomment: RSA˽Կ�� CNend

\retval ::HI_SUCCESS Call this API succussful. CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE Call this API fails. CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaGenKey(HI_U32 u32NumBits, HI_U32 u32Exponent, HI_UNF_CIPHER_RSA_PRI_KEY_S *pstRsaPriKey);

/**
\brief Computes CRT parameters dP, dQ and qInv from the two primes p and q and the public exponent e.
CNcomment: ����p��q����������CRT����dP, dQ �� qInv �� CNend

\attention \n
N/A

\param[in] u32NumBits:	   bit numbers of the integer public modulus.  CNcomment: RSA��ԿN��λ���� CNend
\param[in] u32Exponent:	   value of public exponent.		       CNcomment: RSA��ԿEֵ�� CNend
\param[in] pu8P Buffer containing the prime number p used as input parameter for the computation of CRT parameters. The buffer is allocated by the caller and is u32NumBits/2 bytes long. CNcomment: CRT��p����������Ϊu32NumBits/2. CNend
\param[in] pu8Q Buffer containing the prime number q used as input parameter for the computation of CRT parameters. The buffer is allocated by the caller and is u32NumBits/2 bytes long. CNcomment: CRT��q����������Ϊu32NumBits/2. CNend
\param[out] pu8DP Buffer where to store the CRT exponent dP computed. The buffer is allocated by the caller and is u32NumBits/2 bytes long. CNcomment: CRT��dP����������Ϊu32NumBits/2. CNend
\param[out] pu8DQ Buffer where to store the CRT exponent dQ computed. The buffer is allocated by the caller and is u32NumBits/2 bytes long. CNcomment: CRT��dQ����������Ϊu32NumBits/2. CNend
\param[out] pu8QP Buffer where to store the CRT exponent qInv computed. The buffer is allocated by the caller and is u32NumBits/2 bytes long. CNcomment: CRT��qInv����������Ϊu32NumBits/2. CNend

\param[out] ptRsaPriKey:   private key struct.			       CNcomment: RSA˽Կ�� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_RsaComputeCrtParams(HI_U32 u32NumBits, HI_U32 u32Exponent, HI_U8 *pu8P,
			       HI_U8 *pu8Q, HI_U8 *pu8DP, HI_U8 *pu8DQ, HI_U8 *pu8QP);


/**
\brief SM2 signature a context with appendix, where a signer��s SM2 private key is used.
CNcomment:ʹ��SM2˽Կǩ��һ���ı��� CNend

\attention \n
N/A

\param[in] pstSm2Sign:	    signature struct.					 CNcomment: ǩ�����Խṹ�塣 CNend
\param[in] pu8Msg:	    input context to be signature��maybe null		 CNcomment: ��ǩ��������, ���pu8HashData��Ϊ�գ����ָ�տ���Ϊ�ա� CNend
\param[in] u32MsgLen:	    length of input context to be signature		 CNcomment: ��ǩ�������ݳ��ȡ� CNend
\param[out] pu8R��	    output message of signature				 CNcomment: ǩ�������Rֵ�� CNend
\param[out] pu8S:	    length of message of signature			 CNcomment: ǩ�������Sֵ�� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Sm2Sign(HI_UNF_CIPHER_SM2_SIGN_S *pstSm2Sign, HI_U8 *pu8Msg, HI_U32 u32MsgLen, HI_U8 *pu8R, HI_U8 *pu8S);


/**
\brief SM2 signature verification a context with appendix, where a signer��s SM2 public key is used.
CNcomment:ʹ��SM2��Կǩ����֤һ���ı��� CNend

\attention \n
N/A

\param[in] pstSm2Verify:    signature verification struct.			   CNcomment: ǩ����֤���Խṹ�塣 CNend
\param[in] pu8Msg��	    input context to be signature verification��maybe null CNcomment: ��ǩ����֤������, ���pu8HashData��Ϊ�գ����ָ�տ���Ϊ�ա� CNend
\param[in] u32MsgLen:	    length of input context to be signature		   CNcomment: ��ǩ����֤�����ݳ��ȡ� CNend
\param[in] pu8R��	    output message of signature				   CNcomment: ǩ�������Rֵ�� CNend
\param[in] pu8S:	    length of message of signature			   CNcomment: ǩ�������Sֵ�� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Sm2Verify(HI_UNF_CIPHER_SM2_VERIFY_S *pstSm2Verify, HI_U8 *pu8Msg, HI_U32 u32MsgLen, HI_U8 *pu8R, HI_U8 *pu8S);


/**
\brief SM2 encryption a plaintext with a RSA public key.
CNcomment:ʹ��SM2��Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstSm2Enc:	encryption struct.				     CNcomment: �������Խṹ�塣 CNend
\param[in] pu8Msg��	input data to be encryption			     CNcomment: �����ܵ����ݡ� CNend
\param[in] u32MsgLen:	length of input data to be encryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8C��	output data to be encryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32Clen:	length of output data to be encryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Sm2Encrypt(HI_UNF_CIPHER_SM2_ENC_S *pstSm2Enc,  HI_U8 *pu8Msg, HI_U32 u32MsgLen, HI_U8 *pu8C, HI_U32 *pu32Clen);


/**
\brief RSA decryption a ciphertext with a SM2 private key.
CNcomment:ʹ��SM2˽Կ����һ�����ġ� CNend

\attention \n
N/A

\param[in] pstSm2Dec:	decryption struct.				     CNcomment: ��Կ�������Խṹ�塣 CNend
\param[in] pu8C��	input data to be decryption			     CNcomment: �����ܵ����ݡ� CNend
\param[out] u32Clen:	length of input data to be decryption		     CNcomment: �����ܵ����ݳ��ȡ� CNend
\param[out] pu8Msg��	output data to be decryption			     CNcomment: ���ܽ�����ݡ� CNend
\param[out] pu32MsgLen: length of output data to be decryption		     CNcomment: ���ܽ�������ݳ��ȡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Sm2Decrypt(HI_UNF_CIPHER_SM2_DEC_S *pstSm2Dec, HI_U8 *pu8C, HI_U32 u32Clen, HI_U8 *pu8Msg, HI_U32 *pu32MsgLen);


/**
\brief Generate a SM2 key pair.
CNcomment:����һ��SM2��Կ�ԡ� CNend

\attention \n
N/A

\param[out] pstSm2Key:	 key pair struct.				CNcomment: SM2��Կ�ԡ� CNend

\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_Sm2GenKey(HI_UNF_CIPHER_SM2_KEY_S *pstSm2Key);


/**
\brief Compute Diffie-Hellman shared secret as otherPubKey^privKey mod p.
CNcomment: ����DH������Կ�� CNend

\attention \n
N/A

\param[in] pu8P:  Buffer containing the DH prime modulus p used for the operation.  CNcomment: DH����p. CNend
\param[in] pu8PrivKey: Buffer containing the DH private key. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.			CNcomment: DH˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] pu8OtherPubKey: Buffer containing the DH public key of the other peer. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.	CNcomment: �Է���DH��Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[out] pu8SharedSecret:  Buffer where to write the computed shared secret. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.	CNcomment: DH������Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] u32KeySize: DH key size. CNcomment: DH��Կ����. CNend
\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_DhComputeKey(HI_U8 * pu8P, HI_U8 *pu8PrivKey, HI_U8 *pu8OtherPubKey,
				  HI_U8 *pu8SharedSecret, HI_U32 u32KeySize);


/**
\brief Generate Diffie-Hellman public/private key pair from g and p parameters. The public key is equal to g^x mod p, where x is random number considered as the private key.
CNcomment: ����DH��˽��Կ�ԡ� CNend

\attention \n
N/A

\param[in] pu8G: Buffer containing the DH generator g used for the operation. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.  CNcomment: DH��g���������Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] pu8P: Buffer containing the DH generator p used for the operation. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.  CNcomment: DH��p���������Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] pu8InputPrivKey: Buffer containing an optional input private key from which the public has to be generated.	The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.  If no private key is provided as input (\c pu8InputPrivKey=NULL), function generates a random private key and stores it in pu8OutputPrivKey this buffer. CNcomment: DH��˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0, ���Ϊ��ָ�룬�ú���������һ��˽Կ�ŵ�pu8OutputPrivKey�С� CNend
\param[out] pu8OutputPrivKey: Buffer where to write the generated private key, in case no private key is provided as input (pu8InputPrivKey==NULL). It must be padded with leading zeros if the effective size of the private key is smaller than the buffer size. CNcomment: DH��˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0, ���pu8InputPrivKeyΪ��ָ�룬�ú���������һ��˽Կ�ŵ����buffer�С� CNend
\param[in] u32KeySize: DH key size.			  CNcomment: DH��Կ����. CNend
\retval ::HI_SUCCESS  Call this API succussful.		  CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.		  CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_DhGenKey(HI_U8 *pu8G, HI_U8 *pu8P, HI_U8 *pu8InputPrivKey,
				   HI_U8 *pu8OutputPrivKey, HI_U8 *pu8PubKey,
				   HI_U32 u32KeySize);


/**
\brief Compute ECDH shared secret key. This key corresponds to the X coordinates of the computed P point.
CNcomment: ����ECC DH������Կ�� CNend

\attention \n
N/A

\param[in] pstParams:  Elliptic curve domain parameters. The caller is in charge padding each buffer with leading zeros if the effective size of the domain parameter conveyed is smaller than pstParams->keySize.  CNcomment: ECC��Բ���߲��������Ȳ���Key�Ĵ�С��ǰ�油0. CNend
\param[in] pu8PrivKey: Buffer containing the ECDH private key. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.			  CNcomment: ECDH˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] pu8OtherPubKeyX: Buffer containing the X coordinates of other peer's ECDH public key. It is padded by the caller with leading zeros if the effective size of the public key X coordinates is smaller than the buffer size.  CNcomment: �Է���ECDH��Կ��X���꣬���Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] pu8OtherPubKeyY: Buffer containing the Y coordinates of other peer's ECDH public key. It is padded by the caller with leading zeros if the effective size of the public key Y coordinates is smaller than the buffer size.  CNcomment: �Է���ECDH��Կ��Y���꣬���Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[out] pu8SharedSecret:  Buffer where to write the computed shared secret. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.	CNcomment: ECDH������Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_EcdhComputeKey(HI_UNF_CIPHER_ECC_PARAM_S *pstParams, HI_U8 *pu8PrivKey,
				    HI_U8 *pu8OtherPubKeyX, HI_U8 *pu8OtherPubKeyY,
				    HI_U8 *pu8SharedSecret);


/**
\brief Generate ECC public/private key pair.
CNcomment: ����ECDH��˽��Կ�ԡ� CNend

\attention \n
N/A

\param[in] pstParams:  Elliptic curve domain parameters. The caller is in charge padding each buffer with leading zeros if the effective size of the domain parameter conveyed is smaller than pstParams->keySize.  CNcomment: ECC��Բ���߲��������Ȳ���Key�Ĵ�С��ǰ�油0. CNend
\param[in] pu8InputPrivKey: Buffer containing an optional input private key from which the public has to be generated.	The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.  If no private key is provided as input (\c pu8InputPrivKey=NULL), function generates a random private key and stores it in pu8OutputPrivKey this buffer. CNcomment: ECC��˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0, ���Ϊ��ָ�룬�ú���������һ��˽Կ�ŵ�pu8OutputPrivKey�С� CNend
\param[out] pu8OutputPrivKey: Buffer where to write the generated private key, in case no private key is provided as input (pu8InputPrivKey==NULL). It must be padded with leading zeros if the effective size of the private key is smaller than the buffer size. CNcomment: ECC��˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0, ���pu8InputPrivKeyΪ��ָ�룬�ú���������һ��˽Կ�ŵ����buffer�С� CNend
\pu8PubKeyX[out] Buffer where to write the X coordinates of the generated public key. It must be padded with leading zeros if the effective size of the public key X coordinates is smaller than the buffer size. CNcomment: ECC��ԿX����. CNend
\pu8PubKeyX[out] Buffer where to write the Y coordinates of the generated public key. It must be padded with leading zeros if the effective size of the public key X coordinates is smaller than the buffer size. CNcomment: ECC��ԿY����. CNend
\retval ::HI_SUCCESS  Call this API succussful.		  CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.		  CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_EccGenKey(HI_UNF_CIPHER_ECC_PARAM_S *pstParams, HI_U8 *pu8InputPrivKey,
				    HI_U8 *pu8OutputPrivKey, HI_U8 *pu8PubKeyX, HI_U8 *pu8PubKeyY);


/**
\brief Sign a message with ECDSA algorithm and returns an uncompressed signature made of the pair (r, s).
CNcomment: ECDSAǩ���� CNend

\attention \n
N/A

\param[in] pstParams:  Elliptic curve domain parameters. The caller is in charge padding each buffer with leading zeros if the effective size of the domain parameter conveyed is smaller than pstParams->keySize.  CNcomment: ECC��Բ���߲��������Ȳ���Key�Ĵ�С��ǰ�油0. CNend
\param[in] pu8PrivKey: Buffer containing the ECDH private key. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.			  CNcomment: ECDH˽Կ�����Ȳ���Key�Ĵ�С��ǰ�油0�� CNend
\param[in] enShaType: One of the hash algorithm.						CNcomment: HASH �㷨���͡� CNend
\param[in] pu8Message: Message to be signed.							CNcomment: ��ǩ����Ϣ�� CNend
\param[in] Size in bytes of message to be signed.						CNcomment: ��ǩ����Ϣ�ĳ��ȡ� CNend
\param[out] pu8SigR:  Buffer where to write the uncompressed r component of the resulting signature. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.    CNcomment: ǩ�������Rֵ�� CNend
\param[out] pu8SigS:  Buffer where to write the uncompressed s component of the resulting signature. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.    CNcomment: ǩ�������Sֵ�� CNend
\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_EcdsaSign(HI_UNF_CIPHER_ECC_PARAM_S *pstParams, HI_U8 *pu8PrivKey,
			       HI_UNF_CIPHER_HASH_TYPE_E enShaType,
			       HI_U8 *pu8Message, HI_U32 u32MessageSize,
			       HI_U8 *pu8SigR, HI_U8 *pu8SigS);


/**
\brief Verify an ECDSA signature made of an uncompressed pair (r, s).
CNcomment: ECDSAǩ����֤�� CNend

\attention \n
N/A

\param[in] pstParams:  Elliptic curve domain parameters. The caller is in charge padding each buffer with leading zeros if the effective size of the domain parameter conveyed is smaller than pstParams->keySize.  CNcomment: ECC��Բ���߲��������Ȳ���Key�Ĵ�С��ǰ�油0. CNend
\pu8PubKeyX[out] Buffer where to write the X coordinates of the generated public key. It must be padded with leading zeros if the effective size of the public key X coordinates is smaller than the buffer size. CNcomment: ECC��ԿX����. CNend
\pu8PubKeyX[out] Buffer where to write the Y coordinates of the generated public key. It must be padded with leading zeros if the effective size of the public key X coordinates is smaller than the buffer size. CNcomment: ECC��ԿY����. CNend
\param[in] enShaType: One of the hash algorithm.						CNcomment: HASH �㷨���͡� CNend
\param[in] pu8Message: Message to be signed.							CNcomment: ��ǩ����Ϣ�� CNend
\param[in] Size in bytes of message to be signed.						CNcomment: ��ǩ����Ϣ�ĳ��ȡ� CNend
\param[in] pu8SigR:  Buffer where to write the uncompressed r component of the resulting signature. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.    CNcomment: ǩ�������Rֵ�� CNend
\param[in] pu8SigS:  Buffer where to write the uncompressed s component of the resulting signature. The caller ensures it is padded with leading zeros if the effective size of this key is smaller than the u32KeySize.    CNcomment: ǩ�������Sֵ�� CNend
\retval ::HI_SUCCESS  Call this API succussful.				CNcomment:APIϵͳ���óɹ��� CNend
\retval ::HI_FAILURE  Call this API fails.				CNcomment:APIϵͳ����ʧ�ܡ� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_CIPHER_EcdsaVerify(HI_UNF_CIPHER_ECC_PARAM_S *pstParams,
				 HI_U8 *pu8PubKeyX, HI_U8 *pu8PubKeyY,
				 HI_UNF_CIPHER_HASH_TYPE_E enShaType,
				 HI_U8 *pu8Message, HI_U32 u32MessageSize,
				 HI_U8 *pu8SigR, HI_U8 *pu8SigS);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_CIPHER_H__ */
