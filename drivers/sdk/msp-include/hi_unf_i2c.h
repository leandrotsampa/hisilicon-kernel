/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
******************************************************************************
 File Name     : hi_unf_i2c.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date   : 2008-06-05
Last Modified by:
Description   : Application programming interfaces (APIs) of the external chip software (ECS)
Function List :
Change History:
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_I2C_H__
#define __HI_UNF_I2C_H__

#include "hi_common.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     I2C */
/** @{*/  /** <!-[I2C]*/

#define HI_UNF_I2C_Open	 HI_UNF_I2C_Init
#define HI_UNF_I2C_Close HI_UNF_I2C_DeInit

/**Maximum I2C channel ID*/ /**CNcomment:���I2Cͨ����*/
#define HI_I2C_MAX_NUM_USER (15)

/**Rate type of the I2C module*/
/**CNcomment:I2C���������� */
typedef enum hiUNF_I2C_RATE_E
{
    HI_UNF_I2C_RATE_10K = 0, /**<Standard rate: 10 kbit/s*/	    /**<CNcomment:��׼���ʣ�10kbit/s*/
    HI_UNF_I2C_RATE_50K, /**<Standard rate: 50 kbit/s*/	  /**<CNcomment:��׼���ʣ�50kbit/s*/
    HI_UNF_I2C_RATE_100K, /**<Standard rate: 100 kbit/s*/  /**<CNcomment:��׼���ʣ�100kbit/s*/
    HI_UNF_I2C_RATE_200K, /**<Standard rate: 200 kbit/s*/  /**<CNcomment:��׼���ʣ�200kbit/s*/
    HI_UNF_I2C_RATE_300K, /**<Standard rate: 300 kbit/s*/  /**<CNcomment:��׼���ʣ�300kbit/s*/
    HI_UNF_I2C_RATE_400K, /**<Fast rate: 400 kbit/s*/	   /**<CNcomment:�������ʣ�400kbit/s*/

    HI_UNF_I2C_RATE_BUTT
} HI_UNF_I2C_RATE_E;

/** @}*/  /** <!-- ==== Structure Definition End ====*/




/******************************* API Declaration *****************************/
/** \addtogroup	     I2C*/
/** @{*/  /** <!-- -I2C=*/

/**
 \brief Init the I2C device.
CNcomment:\brief ��ʼ��I2C��the Inter-Integrated Circuit���豸��CNend

 \param N/A								  CNcomment:�ޡ�CNend
 \retval 0 Success							  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_I2C_OPEN_ERR	Open I2c Error				  CNcomment:I2C��Ч������CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_Init (HI_VOID);

/**
 \brief	 DeInit the I2C device.
CNcomment:\brief ȥ��ʼ��I2C�豸��CNend

 \attention \n
This API is called after I2C operations are completed.\n
CNcomment:��I2C������������ô˽ӿ�\n CNend

 \param N/A							   CNcomment:�ޡ�CNend
 \retval 0 Success						   CNcomment: �ɹ���CNend
 \retval ::HI_ERR_I2C_CLOSE_ERR	 Close I2c Error.		   CNcomment:I2C�豸δ��ʼ����CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_DeInit(HI_VOID);

/**
 \brief	 Get the number of I2C module.
CNcomment:\brief ȥ��ʼ��I2C�豸��CNend

 \attention \n
Call this API to get the number of I2C module befor read/write data.\n
CNcomment:��ʹ��I2C��д����֮ǰ���ô˽ӿڻ�ȡоƬ��I2Cģ����Ŀ\n CNend

 \param N/A							   CNcomment:�ޡ�CNend
 \retval 0 Success						   CNcomment: �ɹ���CNend
 \retval ::
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_GetCapability(HI_U32 *pu32I2cNum);

/**
The I2C device is not initialized.
CNcomment:\brief ����һ·GpioI2c��CNend

 \attention \n
If the specified GPIO pins are used, this API fails to be called.\n
CNcomment:���Gpio�ѱ�ռ�û�ʧ��\n CNend

 \param[out] u32I2cNum	ID of the obtained I2C bus			      CNcomment:�õ�I2C���ߺš�CNend
 \param[in] u32SCLGpioNo  SCL Pin number, ranging from 0 to 103, ranging is different in otherness chip type	 CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] u32SDAGpioNo  SDA Pin number, ranging from 0 to 103, ranging is different in otherness chip type	 CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \retval 0 Success							     CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Create gpioi2c failed								CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_I2C_NULL_PTR		The pointer parameter is NULL			CNcomment:ָ�����Ϊ�ա�CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA  The parameter is invalid.		     CNcomment:�����Ƿ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_CreateGpioI2c(HI_U32 *pu32I2cNum, HI_U32 u32SCLGpioNo, HI_U32 u32SDAGpioNo);

/**
 \brief Destroys a inter-integrated circuit (I2C) channel that simulates the general-purpose input/output (GPIO) function.
CNcomment:\brief ����һ·GpioI2c��CNend

 \attention \n
If the I2C channel is not used, a code indicating success is returned.\n
CNcomment:�����GpioI2cδʹ�ã�ֱ�ӷ��سɹ�\n CNend

 \param[in] u32I2cNum ID of the I2C bus to be destroyed	       CNcomment:Ҫ���ٵ�I2C���ߺš�CNend
 \retval 0  Success					       CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Destroy gpioi2c failed				  CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA  The parameter is invalid. CNcomment:�����Ƿ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_DestroyGpioI2c(HI_U32 u32I2cNum);

/**
 \brief Reads data by using the I2C bus.
CNcomment:\brief ͨ��I2C�����ݡ�CNend

 \attention \n
N/A
 \param[in] u32I2cNum  I2C bus of the device to be read		  CNcomment:����ȡ�豸ʹ�õ�I2C���ߡ�CNend
 \param[in] u8DevAddress  Address of a device on the I2C bus	  CNcomment:�豸��I2C�����ϵĵ�ַ��CNend
 \param[in] u32RegAddr	On-chip offset address of a device	  CNcomment:�豸��Ƭ��ƫ�Ƶ�ַ��CNend
 \param[in] u32RegAddrCount  Length of an on-chip offset address. CNcomment:Ƭ��ƫ�Ƶ�ַ�ĳ��ȵ�λ��CNend
		      1: 8-bit sub address			 CNcomment:1����ʾ8bit�ӵ�ַ��CNend
		      2: 16-bit sub address			 CNcomment:2����ʾ16bit�ӵ�ַ��CNend
		      3: 24-bit sub address			 CNcomment:3����ʾ24bit�ӵ�ַ��CNend
		      4: 32-bit sub address			 CNcomment:4����ʾ32bit�ӵ�ַ��CNend

 \param[out] pu8Buf   Buffer for storing the data to be read				CNcomment:��Buffer����Ŷ�ȡ���ݡ�CNend
 \param[in] u32Length  Length of the data to be read					CNcomment:Ҫ��ȡ�����ݳ��ȡ�CNend
 \retval 0 Success									CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Read data failed						CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_I2C_NOT_INIT	The I2C device is not initialized.			CNcomment:I2C�豸δ��ʼ����CNend
 \retval ::HI_ERR_I2C_NULL_PTR	The I2C pointer is invalid.				   CNcomment:I2C��Чָ�롣CNend
 \retval ::HI_ERR_I2C_INVALID_PARA  The I2C parameter is invalid.			CNcomment:I2C��Ч������CNend
 \retval ::HI_ERR_I2C_FAILED_READ  Data fails to be read by using the I2C bus.		CNcomment:I2C������ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_Read(HI_U32 u32I2cNum, HI_U8 u8DevAddress, HI_U32 u32RegAddr,
		       HI_U32 u32RegAddrCount, HI_U8 *pu8Buf, HI_U32 u32Length);

/**
 \brief Writes data by using the I2C bus. That is, you can call this API to write data to the device mounted on the I2C bus through the I2C channel.
CNcomment:\brief ͨ��I2Cд���ݡ�ͨ��I2Cͨ������I2C�����Ϲҽӵ��豸����д������CNend

 \attention \n
N/A
 \param[in] u32I2cNum  I2C bus of the device to be written	   CNcomment:��д�豸ʹ�õ�I2C���ߡ�CNend
 \param[in] u8DevAddress  Address of a device on the I2C bus	   CNcomment:�豸��I2C�����ϵĵ�ַ��CNend
 \param[in] u32RegAddr	On-chip offset address of a device	   CNcomment:�豸��Ƭ��ƫ�Ƶ�ַ��CNend
 \param[in] u32RegAddrCount Length of an on-chip offset address.   CNcomment:Ƭ��ƫ�Ƶ�ַ�ĳ��ȵ�λ��CNend
		    1: 8-bit sub address			  CNcomment:1����ʾ8bit�ӵ�ַ��CNend
		    2: 16-bit sub address			  CNcomment:2����ʾ16bit�ӵ�ַ��CNend
		    3: 24-bit sub address			  CNcomment:3����ʾ24bit�ӵ�ַ��CNend
		    4: 32-bit sub address			  CNcomment:4����ʾ32bit�ӵ�ַ��CNend

 \param[in]  pu8Buf   Buffer for storing the data to be written				CNcomment:дBuffer����Ŵ�д�����ݡ�CNend
 \param[in] u32Length  Length of the data to be written					CNcomment:Ҫд������ݵĳ��ȡ�CNend
 \retval 0  Success									CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Write data failed						CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_I2C_NOT_INIT	The I2C device is not initialized.			CNcomment:I2C�豸δ��ʼ����CNend
 \retval ::HI_ERR_I2C_NULL_PTR	The I2C pointer is invalid.				   CNcomment:I2C��Чָ�롣CNend
 \retval ::HI_ERR_I2C_INVALID_PARA  The I2C parameter is invalid.			CNcomment:I2C��Ч������CNend
 \retval ::HI_ERR_I2C_FAILED_WRITE  Data fails to be written by using the I2C bus.	CNcomment:I2Cд����ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_Write(HI_U32 u32I2cNum, HI_U8 u8DevAddress, HI_U32 u32RegAddr,
			HI_U32 u32RegAddrCount, HI_U8 * pu8Buf, HI_U32 u32Length);

/**
 \brief Sets the transfer rate of the I2C bus.
CNcomment:\brief ����I2C�Ĵ������ʡ�CNend

 \attention \n
Call this API Only be effect in standard i2c, gpio simulate i2c is noneffective.\n
If you do not call this API to set the transfer rate, the rate 100 kbit/s is used by default.\n
CNcomment:�˽ӿڽ��Ա�׼��i2cͨ����Ч����gpio ģ�� i2c ��Ч��\nCNend
CNcomment:��������ô˽ӿڣ�ϵͳ����400Kbit/s��Ϊȱʡ���ʡ�\n CNend

 \param[in] u32I2cNum  D of channel corresponding to the device to be written on the I2C bus			     CNcomment:��д�豸��I2C�����ϵ�ͨ���š�CNend
 \param[in] enI2cRate  I2C clock rate. For details about the definition, see the description of ::HI_UNF_I2C_RATE_E. CNcomment:I2Cʱ�����ʡ�������ο�::HI_UNF_I2C_RATE_E��CNend
 \retval 0  Success												     CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Set rate failed										     CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_I2C_NOT_INIT	The I2C device is not initialized.						     CNcomment:I2C�豸δ��ʼ����CNend
 \retval ::HI_ERR_I2C_INVALID_PARA  The I2C parameter is invalid.						     CNcomment:I2C��Ч������CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_SetRate(HI_U32 u32I2cNum, HI_UNF_I2C_RATE_E enI2cRate);

/**
 \brief Sets the transfer rate of the I2C bus.
CNcomment:\brief ����I2C�Ĵ������ʡ�CNend

 \attention \n
Call this API Only be effect in standard i2c, gpio simulate i2c is noneffective.\n
If you do not call this API to set the transfer rate, the rate 100 kbit/s is used by default.\n
CNcomment:�˽ӿڽ��Ա�׼��i2cͨ����Ч����gpio ģ�� i2c ��Ч��\n
��������ô˽ӿڣ�ϵͳ����400Kbit/s��Ϊȱʡ���ʡ�\n CNend

 \param[in] u32I2cNum  D of channel corresponding to the device to be written on the I2C bus			     CNcomment:��д�豸��I2C�����ϵ�ͨ���š�CNend
 \param[in] u32I2cRate	I2C clock rate.	 CNcomment:I2Cʱ�����ʡ�CNend
 \retval 0  Success												     CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Set rate failed										     CNcomment:ʧ�ܡ�CNend
 \retval ::HI_ERR_I2C_NOT_INIT	The I2C device is not initialized.						     CNcomment:I2C�豸δ��ʼ����CNend
 \retval ::HI_ERR_I2C_INVALID_PARA  The I2C parameter is invalid.						     CNcomment:I2C��Ч������CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_I2C_SetRateEx(HI_U32 u32I2cNum, HI_U32 u32I2cRate);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* __HI_UNF_ECS_TYPE_H__ */
