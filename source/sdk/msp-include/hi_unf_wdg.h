/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
******************************************************************************
File Name	: hi_unf_wdg.h
Version		: Initial draft
Author		: HiSilicon multimedia software group
Created Date	: 2008-06-05
Last Modified by:
Description	: Application programming interfaces (APIs) of the external chip software (ECS)
Function List	:
Change History	:
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_WDG_H__
#define __HI_UNF_WDG_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define HI_UNF_WDG_Open	    HI_UNF_WDG_Init
#define HI_UNF_WDG_Close    HI_UNF_WDG_DeInit

/******************************* API Declaration *****************************/
/** \addtogroup	     WDG*/
/** @{*/  /** <!-- [WDG] */

/**
 \brief Starts the WDG device.
CNcomment:\brief ��ʼ��WDG��Watch Dog���豸��CNend

 \attention \n
By default, the WDG device is disabled after it is started. In this case, you need to call HI_UNF_WDG_Enable to enable it.\n
CNcomment:��֮��WDGĬ���ǽ�ֹ�ģ���Ҫ��ʽ����HI_UNF_WDG_Enableʹ��WDG�豸��CNend\N

 \param N/A		CNcomment:�ޡ�CNend
 \retval 0 Success.	CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_FAILED_INIT	open failed
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_Init(HI_VOID);

/**
 \brief Stops the WDG device.
CNcomment:\brief ȥ��ʼ��WDG�豸��CNend

 \attention \n
N/A
 \param N/A		CNcomment:�ޡ�CNend
 \retval 0 Success.	CNcomment:�ɹ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_DeInit(HI_VOID);

/**
 \brief Get the number of WDG device.
CNcomment:\brief ��ȡWDG�豸������CNend

 \attention \n
You can call this API to get thenumber of WDG chipset supports after the WDG device is started.
CNcomment:��WDG�豸�󣬵��ô˽ӿڻ�ȡоƬ֧�ֵ�WDG��������CNend

 \param[out] pu32WdgNum	 The number of WDG chipset supports		CNcomment:оƬ֧�ֵ�WDG��������CNend
 \retval 0 Success  CNcomment:�ɹ� CNend
 \retval ::HI_FAILURE The Parameter pu32WdgNum is NULL.	      CNcomment:����ָ��pu32WdgNumΪ�ա�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_GetCapability(HI_U32 *pu32WdgNum);

/**
 \brief Enables the WDG device.
CNcomment:\brief ʹ��WDG�豸��CNend

 \attention \n
You must call HI_UNF_WDG_Enable after the WDG device is started.
CNcomment:��WDG�豸�󣬱�����ʽ����ʹ�ܽӿڡ�CNend

 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \retval 0 Success.	CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT The WDG device is not initialized.	CNcomment:WDG�豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_INVALID_PARA The Paramteter is invalid.			CNcomment:������Ч��CNend
 \retval ::HI_ERR_WDG_FAILED_ENABLE enable watchdog failed.				CNcomment:ʹ�ܿ��Ź�ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_Enable(HI_U32 u32WdgNum);

/**
 \brief Disables the WDG device.
CNcomment:\brief ��ֹWDG�豸��CNend

 \attention \n
After calling this API, you cannot feed and reset the WDG.
CNcomment:���ô˺�����ι���͸�λ�����������á�CNend

 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT	The WDG device is not initialized.	CNcomment:WDG�豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_INVALID_PARA The Paramteter is invalid.			CNcomment:������Ч��CNend
 \retval ::HI_ERR_WDG_FAILED_DISABLE  disable watchdog failed.			CNcomment:��ֹ���Ź�ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_Disable(HI_U32 u32WdgNum);

/**
 \brief Obtains the interval of feeding the WDG.
CNcomment:\brief ��ȡι��ʱ������CNend

 \attention \n
The interval precision is as high as 1000 ms.
CNcomment:ʱ������ȷ��1000ms��CNend

 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \param[in] pu32Value  Interval of feeding the WDG, in ms.		CNcomment:ι��ʱ��������λΪms��CNend
 \retval 0 Success.							CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT	The WDG device is not initialized.	CNcomment:WDG �豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_INVALID_PARA  The WDG input pointer is invalid.	CNcomment:WDG����ָ����Ч��CNend
 \retval ::HI_ERR_WDG_FAILED_SETTIMEOUT get timeout failed.				CNcomment:WDG��ȡ��ʱʱ��ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_GetTimeout(HI_U32 u32WdgNum, HI_U32 *pu32Value);

/**
 \brief Sets the interval of feeding the WDG.
CNcomment:\brief ����ι��ʱ������CNend

 \attention \n
N/A
 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \param[out] u32Value  Interval of feeding the WDG, in ms.				CNcomment:ι��ʱ��������λΪms��CNend
 \retval 0 Success.									CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT The WDG device is not initialized.			CNcomment:WDG�豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_FAILED_SETTIMEOUT The WDG set timeout failed.			CNcomment:WDG���ó�ʱʱ��ʧ�ܡ�CNend
 \retval ::HI_ERR_WDG_INVALID_PARA  The WDG input parameter is invalid.			CNcomment:WDG���������Ч��CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_SetTimeout(HI_U32 u32WdgNum, HI_U32 u32Value);

/**
 \brief Feeds the WDG.
CNcomment:\brief ִ��ι��������CNend

 \attention \n
N/A
 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \retval 0 Success.							CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT	The WDG device is not initialized.	CNcomment:WDG�豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_FAILED_CLEARWDG  The WDG clear watchdog failed.	CNcomment:WDG ι��ʧ�ܡ�CNend
 \retval ::HI_ERR_WDG_INVALID_PARA The Paramteter is invalid.			CNcomment:������Ч��CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_Clear(HI_U32 u32WdgNum);

/**
 \brief Resets the entire system.
CNcomment:\brief ���ڸ�λ����ϵͳ��CNend

 \attention \n
N/A
 \param[in] u32WdgNum WDG No. to operate.		CNcomment:ִ�в�����WDG�š�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_WDG_NOT_INIT	The WDG device is not initialized.  CNcomment:WDG�豸δ��ʼ����CNend
 \retval ::HI_ERR_WDG_FAILED_RESET The WDG reset failed.			CNcomment:WDG��λʧ�ܡ�CNend
 \retval ::HI_ERR_WDG_INVALID_PARA The Paramteter is invalid.		CNcomment:������Ч��CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_WDG_Reset(HI_U32 u32WdgNum);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* __HI_UNF_WDG_H__ */
