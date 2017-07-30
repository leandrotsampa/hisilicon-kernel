/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
******************************************************************************
 File Name     : hi_unf_gpio.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date   : 2008-06-05
Last Modified by:
Description   : Application programming interfaces (APIs) of the external chip software (ECS)
Function List :
Change History:
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_GPIO_H__
#define __HI_UNF_GPIO_H__

#include "hi_common.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     GPIO */
/** @{*/  /** <!-- [GPIO] */

#define HI_UNF_GPIO_Open  HI_UNF_GPIO_Init
#define HI_UNF_GPIO_Close HI_UNF_GPIO_DeInit

/**type of GPIO interrupt*/
/** CNcomment:GPIO �ж�����*/
typedef enum hiUNF_GPIO_INTTYPE_E
{
    HI_UNF_GPIO_INTTYPE_UP, /**<spring by the up edge*/			/**< CNcomment:�����ش���*/
    HI_UNF_GPIO_INTTYPE_DOWN, /**<spring by the down edge*/		  /**< CNcomment:�½��ش���*/
    HI_UNF_GPIO_INTTYPE_UPDOWN, /**<spring by both the up and down edge*/   /**< CNcomment:˫�ش���*/
    HI_UNF_GPIO_INTTYPE_HIGH, /**<spring by the high level*/		  /**< CNcomment:�ߵ�ƽ����*/
    HI_UNF_GPIO_INTTYPE_LOW, /**<spring by the low level*/		 /**< CNcomment:�͵�ƽ����*/
    HI_UNF_GPIO_INTTYPE_BUTT, /**<Invalid value*/			 /**< CNcomment:�Ƿ��߽�ֵ*/
} HI_UNF_GPIO_INTTYPE_E;

/**GPIO output type*/
/** CNcomment:GPIO �������*/
typedef enum hiUNF_GPIO_OUTPUTTYPE_E
{
	HI_UNF_GPIO_OUTPUTTYPE_CMOS,
	HI_UNF_GPIO_OUTPUTTYPE_OD,
	HI_UNF_GPIO_OUTPUTTYPE_BUTT,
}HI_UNF_GPIO_OUTPUTTYPE_E;

/** @}*/  /** <!-- ==== Structure Definition End ====*/




/******************************* API Declaration *****************************/
/** \addtogroup	     GPIO*/
/** @{*/  /** <!-- [GPIO] */

/**
 \brief Starts the general-purpose input/output (GPIO) device.
CNcomment:\brief ��GPIO��General Purpose Input/Output���豸��CNend

 \attention \n
This API can be called repeatedly.
CNcomment:�ظ��򿪻�ɹ���CNend

 \param	 N/A	   CNcomment:�ޡ�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE			Initialize GPIO failed.				CNcomment:��GPIOʧ�ܡ�CNend
 \retval ::HI_ERR_GPIO_OPEN_ERR	 Initialize GPIO failed.			CNcomment:��GPIOʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_Init(HI_VOID);

/**
 \brief Stops the GPIO device.
CNcomment:\brief �ر�GPIO�豸��CNend

 \attention \n
This API can be called repeatedly.
CNcomment:�ظ��رջ�ɹ���CNend
 \param	 N/A  CNcomment:�ޡ�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_CLOSE_ERR  Deinitialize GPIO failed.			CNcomment:��GPIOʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_DeInit(HI_VOID);

/**
 \brief Reads data from a GPIO pin.
CNcomment:\brief ��GPIO�������Ŷ�ȡ���ݡ�CNend

 \attention The pin number is defined as follows: Pin number = GPIO group ID x 8 + GPIO pin ID in the group\n
For example, GPIO1_2 indicates pin 2 in group 1, and the pin number is 10 (1 x 8 + 2).\n
Both pin group ID and pin number are numbered from 0. Each HD chip provides GPIO pins number reference to HD chip hardware manual.\n
CNcomment:\attention �ܽźż������: �ܽź� = GPIO���*8 + GPIO�ܽ������ڵı�š�\n
����GPIO1_2,������1���2�ţ���ô�ܽź�=1*8+2=10��\n
GPIO����ź͹ܽźŵı�Ŷ���0��ʼ������оƬ�ṩ��gpio�ܽ�����ο���ص�оƬӲ���ֲ�\n CNend

 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type	  CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[out] pbHighVolt	  Pointer to the input level of a pin.	CNcomment:ָ�����ͣ����عܽ������ƽ��CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NULL_PTR	 Pointer Parameters is NULL.			CNcomment:ָ�����Ϊ��ָ�롣CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_INVALID_OPT  Invalid Operation.					CNcomment:�Ƿ�������CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_ReadBit(HI_U32 u32GpioNo, HI_BOOL  *pbHighVolt);

/**
 \brief Writes data to a GPIO pin.
CNcomment:\brief ��GPIO��������������ݡ�CNend
 \attention \n
N/A
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type	  CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] bHighVolt  Output level of a pin		  CNcomment:�ܽ������ƽ��CNend
		      0: low level			 CNcomment:0: �͵�ƽ CNend
		      1: high level			 CNcomment:1���ߵ�ƽ CNend
		     Others: high level			 CNcomment:�������ߵ�ƽ��CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_INVALID_OPT  Invalid Operation.					CNcomment:�Ƿ�������CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_WriteBit(HI_U32 u32GpioNo, HI_BOOL bHighVolt );

/**
 \brief Sets the direction (input or output) of a GPIO pin.
CNcomment:\brief ����GPIO�������������������CNend

 \attention \n
When setting the operating mode of a GPIO pin, ensure that it works in GPIO mode only.\n
This is because the GPIO pin may be multiplexed.\n
CNcomment:���ö�Ӧ�ܽŵĹ�����ʽʱ�����뱣֤�ùܽŽ�������GPIOģʽ�£�GPIO�ܽ��п��ܱ����á�CNend

 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type	  CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] bInput  Boolean variable that indicates the direction of a pin  CNcomment:������������ʶ�ܽŷ���CNend
		   HI_TRUE: input pin  HI_TRUE.				  CNcomment:�ùܽ��������롣CNend
		   HI_FALSE: output pin HI_FALSE.			  CNcomment:�ùܽ����������CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_SetDirBit(HI_U32 u32GpioNo, HI_BOOL bInput);

/**
 \brief Obtains the direction (input or output) of a GPIO pin.
CNcomment:\brief ��ȡGPIO�������������������CNend

 \attention \n
N/A
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type.	   CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[out] pbInput   Pointer to the boolean variable that indicates the direction of a pin.  CNcomment:ָ�����ͣ�ָ�򲼶��ͱ������������عܽŷ���CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NULL_PTR	 Pointer Parameters is NULL.			CNcomment:ָ�����Ϊ��ָ�롣CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_GetDirBit(HI_U32 u32GpioNo, HI_BOOL	  *pbInput);

/**
 \brief Starts the cipher device.
CNcomment:\brief ����GPIO�������ŵ��ж����͡�CNend

 \attention \n
N/A
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type	  CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] enIntType	 interrupt type				       CNcomment:�ж����͡�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_INTTYPE_NOT_SUPPORT  interupt type is not support.	CNcomment:��֧�ֵ��ж����͡�CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_FAILED_SETINT  set interupt type failed.			CNcomment:�����ж�����ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_SetIntType(HI_U32 u32GpioNo, HI_UNF_GPIO_INTTYPE_E enIntType);

/**
 \brief set GPIO single pin interrupt enable
CNcomment:\brief ����GPIO�������ŵ��ж�ʹ�ܡ�CNend
 \attention \n
interrupte type HI_UNF_GPIO_INTTYPE_LOW and HI_UNF_GPIO_INTTYPE_HIGH is not support
CNcomment:��֧��HI_UNF_GPIO_INTTYPE_LOW �� HI_UNF_GPIO_INTTYPE_HIGH�ж����͡�CNend
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type	  CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] bEnable  HI_TRUE: interrupt enable, HI_FALSE: interrupt disable CNcomment:HI_TRUE: �ж�ʹ�� ,HI_FALSE: �жϽ�ֹ��CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_FAILED_SETENABLE	 enable interupt failed.		CNcomment:ʹ���ж�ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_SetIntEnable(HI_U32 u32GpioNo, HI_BOOL bEnable);

/**
 \brief query GPIO interrupt, report it if there is interrupter happen.\n
CNcomment:\brief ��ѯGPIO�жϣ�ֻҪ��GPIO�жϾͻ��ϱ�������CNend
 \attention \n
N/A
 \param[out] p32GpioNo	  get interrupt pin number.	   CNcomment:��ȡ�жϵĹܽźš�CNend
 \param[in] u32TimeoutMs  get interrupt timeout.	   CNcomment:��ȡ�жϳ�ʱʱ�䡣CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_NULL_PTR	 Pointer Parameters is NULL.			CNcomment:ָ�����Ϊ��ָ�롣CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_FAILED_GETINT  Query interupt failed.			CNcomment:��ѯ�ж�ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_QueryInt(HI_U32 *p32GpioNo, HI_U32 u32TimeoutMs);

/**
 \brief Obtains the output type (od or cmos) of a GPIO pin.
CNcomment:\brief ����GPIO�������ŵ�������͡�CNend

 \attention \n
N/A
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type.	   CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[in] enOutputType   Pointer to the enumerate variable that indicates the direction of a pin.  CNcomment:ָ�����ͣ�ָ��ö���ͱ������������عܽ�������͡�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_FAILED_SETOUTPUTTYPE Get output type failed.				CNcomment:�����������ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_SetOutputType(HI_U32 u32GpioNo, HI_UNF_GPIO_OUTPUTTYPE_E  enOutputType);

/**
 \brief Obtains the output type (od or cmos) of a GPIO pin.
CNcomment:\brief ��ȡGPIO�������ŵ�������͡�CNend

 \attention \n
N/A
 \param[in] u32GpioNo  Pin number, ranging from 0 to 103, ranging is different in otherness chip type.	   CNcomment:�ܽźţ�ȡֵ��ΧΪ0��103����ͬ��оƬ���ͷ�Χ��һ����CNend
 \param[out] penOutputType   Pointer to the enumerate variable that indicates the output type of a pin.	 CNcomment:ָ�����ͣ�ָ��ö���ͱ������������عܽ�������͡�CNend
 \retval 0 Success. CNcomment:�ɹ���CNend
 \retval ::HI_ERR_GPIO_INVALID_PARA	 Parameters Invalid.				CNcomment:�Ƿ�������CNend
 \retval ::HI_ERR_GPIO_NOT_INIT	 GPIO module is not initialiazed.		CNcomment:GPIOģ��û�г�ʼ����CNend
 \retval ::HI_ERR_GPIO_FAILED_GETOUTPUTTYPE Get output type failed.				CNcomment:��ȡ�������ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_GPIO_GetOutputType(HI_U32 u32GpioNo, HI_UNF_GPIO_OUTPUTTYPE_E  *penOutputType);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* __HI_UNF_GPIO_H__ */
