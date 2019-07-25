/******************************************************************************
 Copyright (C), 2009-2014, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
 File Name     : hi_unf_descrambler.h
 Version       : Initial Draft
 Author	       : Hisilicon multimedia software group
 Created       : 2013/04/16
 Description   :
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_DESCRAMBLER_H__
#define __HI_UNF_DESCRAMBLER_H__

#include "hi_error_mpi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*************************** Structure Definition ****************************/
/** \addtogroup	     Descrambler */
/** @{ */  /** <!-- [Descrambler] */

/**Conditional access (CA) type, indicating whether advanced CA is used.*/
/**CNcomment:CA���ͣ��Ƿ�ʹ�ø߰�ȫCA*/
typedef enum hiUNF_DMX_CA_TYPE_E
{
    HI_UNF_DMX_CA_NORMAL = 0,	 /**<Common CA*/ /**< CNcomment:��ͨCA*/
    HI_UNF_DMX_CA_ADVANCE,	 /**<Advanced CA*/ /**< CNcomment:�߰�ȫCA*/

    HI_UNF_DMX_CA_BUTT
} HI_UNF_DMX_CA_TYPE_E;

/**CA Entropy reduction mode*/
/**CNcomment:�ؼ���ģʽ*/
typedef enum hiUNF_DMX_CA_ENTROPY_REDUCTION_E
{
    HI_UNF_DMX_CA_ENTROPY_REDUCTION_CLOSE = 0,	/**<64bit*/
    HI_UNF_DMX_CA_ENTROPY_REDUCTION_OPEN,	/**<48bit*/

    HI_UNF_DMX_CA_ENTROPY_REDUCTION_BUTT
} HI_UNF_DMX_CA_ENTROPY_E;


/**Type of the descrambler protocol.*/
/**CNcomment:������Э������*/
typedef enum hiUNF_DMX_DESCRAMBLER_TYPE_E
{
    HI_UNF_DMX_DESCRAMBLER_TYPE_CSA2	  = 0,	     /**<CSA2.0*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_CSA3	  ,	     /**<CSA3.0*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_IPTV  ,	     /**<AES IPTV of SPE*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_ECB	  ,	     /**<SPE AES ECB*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_CI	  ,	     /**<SPE AES CIPLUS*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_DES_CI	  ,	     /**<DES CIPLUS*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_DES_CBC	  ,	     /**<DES CBC*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_NS	  ,	     /**<AES NS-Mode, AES NOVEL*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_SMS4_NS	  ,	     /**<SMS4 NS-Mode, SMS4 NOVEL*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_SMS4_IPTV ,	     /**<SMS4 IPTV*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_SMS4_ECB  ,	     /**<SMS4 ECB*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_SMS4_CBC  ,	     /**<SMS4 CBC*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_CBC	  ,	     /**<AES CBC*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_DES_IPTV,	     /**<DES IPTV*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_TDES_IPTV,	     /**<TDES IPTV*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_TDES_ECB,	     /**<TDES ECB */
    HI_UNF_DMX_DESCRAMBLER_TYPE_TDES_CBC,	     /**<TDES CBC */
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_ECB_L,	     /**<AES_ECB_L the clear stream left in the leading */
    HI_UNF_DMX_DESCRAMBLER_TYPE_AES_CBC_L,	     /**<AES_CBC_L the clear stream left in the leading */
    HI_UNF_DMX_DESCRAMBLER_TYPE_ASA,		     /**<ASA 64/128 Algorithm only for NOC3.X */
    HI_UNF_DMX_DESCRAMBLER_TYPE_BUTT
} HI_UNF_DMX_DESCRAMBLER_TYPE_E;

/**Attribute of the key area.*/
/**CNcomment:��Կ������*/
typedef struct hiUNF_DMX_DESCRAMBLER_ATTR_S
{
    HI_UNF_DMX_CA_TYPE_E enCaType;		      /**<Whether the descrambler adopts advanced CA.*/ /**< CNcomment:�������Ƿ�ʹ�ø߰�ȫCA*/
    HI_UNF_DMX_DESCRAMBLER_TYPE_E enDescramblerType;  /**<Descrambling protocol type of the descrambler*/ /**< CNcomment:����������Э������*/
    HI_UNF_DMX_CA_ENTROPY_E enEntropyReduction;	      /**<CA Entropy reduction mode,for CSA2.0*/ /**< CNcomment:�ؼ���ģʽ��CSA2.0��Ч*/
} HI_UNF_DMX_DESCRAMBLER_ATTR_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */


/******************************* API Declaration *****************************/
/** \addtogroup	     Descrambler */
/** @{ */  /** <!--[Descrambler]*/

/**
\brief Creates a key area.CNcomment:����һ����Կ����CNend
\attention \n
When creating a key area, you can ignore the DUMUX to which the key area belongs, because all DEMUXs share all key areas.
CNcomment:������Կ�������ù���������·DEMUX������DEMUX����������Կ����CNend
\param[in] u32DmxId   DEMUX ID. CNcomment: DEMUX�š�CNend
\param[out] phKey     Pointer to the handle of a created key area.CNcomment:ָ�����ͣ�������뵽����Կ��Handle��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_KEY There is no available key area. CNcomment:û�п��е���Կ����CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateDescrambler(HI_U32 u32DmxId, HI_HANDLE *phKey);


/**
\brief Creates a key area. The key area type and descrambling protocol type can be selected.CNcomment:����һ����Կ��,֧��ѡ��߰�ȫCA�ͽ���Э�����͡�CNend
\attention \n
When an advanced CA key area is created, the descrambling protocol depends on the hardware and interface settings are ignored.\n
CNcomment:����Ǹ߰�ȫCA������Э���Ѿ���Ӳ���������ӿڵ����ñ����ԡ�CNend
\param[in] u32DmxId   DEMUX ID. CNcomment: DEMUX�š�CNend
\param[in] pstDesramblerAttr  Pointer to the attributes of a key area.CNcomment:��Կ������ָ�롣CNend
\param[out] phKey      Pointer to the handle of a created key area.CNcomment:ָ�����ͣ�������뵽����Կ��Handle��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_KEY	 There is no available key area.CNcomment:û�п��е���Կ����CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  Not support HI_UNF_DMX_DESCRAMBLER_ATTR_S type.CNcomment:��֧�ֵ�HI_UNF_DMX_DESCRAMBLER_ATTR_S���͡�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateDescramblerExt(HI_U32 u32DmxId, const HI_UNF_DMX_DESCRAMBLER_ATTR_S *pstDesramblerAttr, HI_HANDLE *phKey);

/**
\brief Destroys an existing key area.CNcomment:���ٴ�������Կ����CNend
\attention \n
If a key area is attached to a channel, the key area needs to be detached from the channel first, but the channel is not disabled.\n
If a key area is detached or destroyed before the attached channel is disabled, an error may occur during data receiving.
CNcomment:�����Կ������ͨ���ϣ����ȴ�ͨ���Ͻ����Կ��������ע�ⲻ��ر�ͨ��\n
���û�йر�ͨ���������Կ���Ľ�󶨻����ٲ��������ܵ������ݽ��յĴ���CNend
\param[in] hKey	 Handle of the key area to be destroyed.CNcomment:��ɾ������Կ��Handle��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DestroyDescrambler(HI_HANDLE hKey);

/**
\brief Gets the attributes of a Descrambler.CNcomment:��ȡ��Կ�������ԡ�CNend
\attention \n
NA.\n
CNcomment:�ޡ�CNend
\param[in] hKey	  key handle. CNcomment: key�����CNend
\param[out] pstAttr  Pointer to the attributes of a key area.CNcomment:��Կ������ָ�롣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_KEY	 There is no available key area.CNcomment:û�п��е���Կ����CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  Not support HI_UNF_DMX_DESCRAMBLER_ATTR_S type.CNcomment:��֧�ֵ�HI_UNF_DMX_DESCRAMBLER_ATTR_S���͡�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetDescramblerAttr(HI_HANDLE hKey, HI_UNF_DMX_DESCRAMBLER_ATTR_S *pstAttr);

/**
\brief Sets the attributes of a Descrambler.CNcomment:������Կ�������ԡ�CNend
\attention \n
NA.\n
CNcomment:�ޡ�CNend
\param[in] hKey	  key handle. CNcomment: key�����CNend
\param[out] pstAttr  Pointer to the attributes of a key area.CNcomment:��Կ������ָ�롣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_KEY	 There is no available key area.CNcomment:û�п��е���Կ����CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  Not support HI_UNF_DMX_DESCRAMBLER_ATTR_S type.CNcomment:��֧�ֵ�HI_UNF_DMX_DESCRAMBLER_ATTR_S���͡�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetDescramblerAttr(HI_HANDLE hKey, HI_UNF_DMX_DESCRAMBLER_ATTR_S *pstAttr);

/**
\brief Sets the even keys of a key area. This API is used to configure the DEMUX descrambler based on even keys after the CA system obtains control words.CNcomment:������Կ����ż��Կ��CAϵͳ�õ������ֺ󣬿ɵ��ñ��ӿڽ�ż��Կ���õ�DEMUX����ģ�顣CNend
\attention \n
pEvenKey points to the even key data to be set. The data consists of 16 bytes: CW1, CW2, ..., and CW16.\n
The key value can be set dynamically, that is, the key value can be set at any time after a key area is created.\n
The initial value of each key is 0, which indicates that data is not descrambled.
CNcomment:pEvenKeyָ��Ҫ���õ�ż��Կ���ݡ����ݹ�16byte��byte������CW1��CW2��������CW16\n
֧����Կ���Ķ�̬���ã���������Կ������������ʱ��������Կֵ\n
��������Կ֮ǰ����Կ�ĳ�ʱֵ����0����ʾ�������š�CNend
\param[in] hKey	 Handle of the key area to be set.CNcomment:�����õ���Կ�������CNend
\param[in] pu8EvenKey  Pointer to the 16-byte even key data to be set.CNcomment:ָ�����ͣ�ָ��Ҫ���õ�ż��Կ���ݣ�������16���ֽڵ����顣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetDescramblerEvenKey(HI_HANDLE hKey, const HI_U8 *pu8EvenKey);


/**
\brief Sets the odd keys of a key area. This API is used to configure the DEMUX descrambler based on odd keys after the CA system obtains control words.CNcomment:������Կ��������Կ��CAϵͳ�õ������ֺ󣬿ɵ��ñ��ӿڽ�����Կ���õ�DEMUX����ģ�顣CNend
\attention \n
pOddKey points to the odd key data to be set. The data consists of 16 bytes: CW1, CW2, ..., and CW16.\n
The key value can be set dynamically, that is, the key value can be set at any time after a key area is created.\n
The initial value of each key is 0, which indicates that data is not descrambled.
CNcomment:pOddKeyָ��Ҫ���õ�����Կ���ݡ�����Կ���ݹ�16byte��byte������CW1��CW2��������CW16\n
֧����Կ���Ķ�̬���ã���������Կ������������ʱ��������Կֵ\n
��������Կ֮ǰ����Կ�ĳ�ʱֵ����0����ʾ�������š�CNend
\param[in] hKey	 Handle of the key area to be set.CNcomment:�����õ���Կ�������CNend
\param[in] pu8OddKey   Pointer to the 16-byte odd key data to be set.CNcomment:ָ�����ͣ�ָ��Ҫ���õ�����Կ���ݣ�������16���ֽڵ����顣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetDescramblerOddKey(HI_HANDLE hKey, const HI_U8 *pu8OddKey);


/**
\brief Set Even IV.For algs do not use IV,do not care.CNcomment:����ż��Կ���ĳ�ʼ�����������ڲ��漰��ʼ�������Ľ����㷨���Բ���ע��CNend
\attention \n
pu8IVKey points to the iv key data to be set.The data consists of 16 bytes: CW1, CW2, ..., and CW16.\n
The key value can be set dynamically, that is, the key value can be set at any time after a key area is created.
CNcomment:pu8IVKeyָ��Ҫ���õĳ�ʼ���������ݡ�����Կ���ݹ�16byte��byte������CW1��CW2��������CW16\n
֧����Կ���Ķ�̬���ã���������Կ������������ʱ�����á�CNend
\param[in] hKey	 Handle of the key area to be set.CNcomment:�����õ���Կ�������CNend
\param[in] pu8IVKey   Pointer to the 16-byte IV key data to be set.CNcomment:ָ�����ͣ�ָ��Ҫ���õ�����Կ���ݣ�������16���ֽڵ����顣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetDescramblerEvenIVKey(HI_HANDLE hKey, const HI_U8 *pu8IVKey);

/**
\brief Set Odd IV.For algs do not use IV,do not care.CNcomment:��������Կ���ĳ�ʼ�����������ڲ��漰��ʼ�������Ľ����㷨���Բ���ע��CNend
\attention \n
pu8IVKey points to the iv key data to be set.The data consists of 16 bytes: CW1, CW2, ..., and CW16.\n
The key value can be set dynamically, that is, the key value can be set at any time after a key area is created.
CNcomment:pu8IVKeyָ��Ҫ���õĳ�ʼ���������ݡ�����Կ���ݹ�16byte��byte������CW1��CW2��������CW16\n
֧����Կ���Ķ�̬���ã���������Կ������������ʱ�����á�CNend
\param[in] hKey	 Handle of the key area to be set.CNcomment:�����õ���Կ�������CNend
\param[in] pu8IVKey    Pointer to the 16-byte IV key data to be set.CNcomment:ָ�����ͣ�ָ��Ҫ���õ�����Կ���ݣ�������16���ֽڵ����顣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetDescramblerOddIVKey(HI_HANDLE hKey, const HI_U8 *pu8IVKey);

/**
\brief Attaches a key area to a specific channel.CNcomment:����Կ����ָ��ͨ����CNend
\attention \n
A key area can be attached to multiple channels that belong to different DEMUXs.\n
The static loading data in the key areas that are attached to all types of channels can be descrambled.\n
The same key area or different key areas cannot be attached to the same channel.
CNcomment:һ����Կ�����԰󶨵����ͨ���ϣ�ͨ���������ڲ�ͬ��DEMUX\n
���Զ��������͵�ͨ������Կ���������ݵĽ���\n
�������ظ�����ͬ��ͬ����Կ����ͬһ��ͨ���ϡ�CNend
\param[in] hKey	   Handle of the key area to be attached.CNcomment:���󶨵���Կ�������CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_ATTACHED_KEY  A key area is attached to the channel.CNcomment:ͨ�����Ѿ���һ����Կ���������档CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_AttachDescrambler(HI_HANDLE hKey, HI_HANDLE hChannel);


/**
\brief Detaches a key area from a channel.CNcomment:����Կ����ͨ���Ͻ�󶨡�CNend
\attention \n
The key area used by a channel can be detached dynamically. That is, you can call this API to detach a key area at any time after it is attached.\n
The scrambled data, however, may not be descrambled after the key area is detached, which causes data error.\n
The value of a key area retains even after it is detached. If the key area is attached again, its value is still the previously configured value.\n
If you do not want to descramble data, you can detach the corresponding key area or set all key values to 0.
CNcomment:���Զ�̬�Ľ��ͨ��ʹ�õ���Կ���������ڰ󶨺������ʱ��ʹ�ô˽ӿڽ����Կ��\n
���ǽ�󶨺���ܵ��¼�������û�б����ţ��������ݴ���\n
�����Կ�������ܸı���Կ����ֵ��������°���Կ������Կֵ��Ȼ���ϴ����õ�ֵ\n
���������н��ţ����˽����Կ��֮�⣬Ҳ����ֱ�ӽ���Կֵȫ������Ϊ0��ʵ�֡�CNend
\param[in] hKey	   Handle of the key area to be detached.CNcomment:����󶨵���Կ�������CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NOATTACH_KEY  No key areas are attached to the channel.CNcomment:ͨ����û�а��κ���Կ����CNend
\retval ::HI_ERR_DMX_UNMATCH_KEY  The specified key area is not attached to the specified channel.CNcomment:ָ������Կ��û�а���ָ����ͨ���ϡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DetachDescrambler(HI_HANDLE hKey, HI_HANDLE hChannel);


/**
\brief Obtains the handle of the key area that is attached to a channel.CNcomment:��ȡͨ���󶨵���Կ�������CNend
\attention \n
If no key area is attached to the channel, the error code HI_ERR_DMX_NOATTACH_KEY is returned when you call this API.
CNcomment:��ͨ��û�а���Կ��ʱ�����ñ��ӿڷ���HI_ERR_DMX_NOATTACH_KEY�����롣CNend
\param[in] hChannel  Handle of the channel to be queried.CNcomment:Ҫ��ѯ��ͨ�������CNend
\param[out] phKey     Pointer to the handle of the key area that is attached to a channel (output).CNcomment:ָ�����ͣ����ͨ���󶨵���Կ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOATTACH_KEY  No key areas are attached to the channel.CNcomment:ͨ����û�а��κ���Կ����CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetDescramblerKeyHandle(HI_HANDLE hChannel, HI_HANDLE *phKey);


/**
\brief Obtains the number of available key areas.CNcomment:��ȡ������Կ��������CNend
\attention \n
Because key areas are shared by multiple DEMUXs, the first parameter is meaningless. Therefore, you only need to enter a valid value.CNcomment:��Կ���ڼ�·DEMUX֮�乲�ã����Ե�һ������û�����壬ֻҪ����һ���Ϸ�ֵ�Ϳ����ˡ�CNend
\param[in] u32DmxId   DEMUX ID. CNcomment: DEMUX�š�CNend
\param[out]  pu32FreeCount   Pointer to the number of available key areas (output).CNcomment:ָ�����ͣ����������Կ����Ŀ��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetFreeDescramblerKeyCount(HI_U32 u32DmxId , HI_U32 * pu32FreeCount);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif	/* __HI_UNF_DESCRAMBLER_H__ */
