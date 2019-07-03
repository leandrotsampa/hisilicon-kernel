/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_UNF_CI_TYPE_H__
#define __HI_UNF_CI_TYPE_H__

#include "hi_error_mpi.h"
#include "hi_common.h"
#include <linux/string.h>


#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     CI*/
/** @{ */  /** <!-- [CI] */

/** support CI Port*/
/** CNcomment:֧�ֵ�CI Port */
typedef enum hiUNF_CI_PORT_E
{
    HI_UNF_CI_PORT_0,
    HI_UNF_CI_PORT_1,
    HI_UNF_CI_PORT_BUTT
} HI_UNF_CI_PORT_E;

/** support CI PCMCIA Cards(Module) */
/** CNcomment:֧�ֵ�CI PCMCIA Cards(Module) */
typedef enum hiUNF_CI_PCCD_E
{
    HI_UNF_CI_PCCD_A,
    HI_UNF_CI_PCCD_B,
    HI_UNF_CI_PCCD_BUTT
} HI_UNF_CI_PCCD_E;

/** Module on-off power control */
/** CNcomment:Module���ص�Դ���� */
typedef enum hiUNF_CI_PCCD_CTRLPOWER_E
{
    HI_UNF_CI_PCCD_CTRLPOWER_ON,
    HI_UNF_CI_PCCD_CTRLPOWER_OFF,
    HI_UNF_CI_PCCD_CTRLPOWER_BUFF
} HI_UNF_CI_PCCD_CTRLPOWER_E;

/** Module ready state:ready/busy */
/** CNcomment:Module����״̬:ready/busy */
typedef enum hiUNF_CI_PCCD_READY_E
{
    HI_UNF_CI_PCCD_BUSY,
    HI_UNF_CI_PCCD_READY
} HI_UNF_CI_PCCD_READY_E, *HI_UNF_CI_PCCD_READY_E_PTR;

/** Module online state:present/absent */
/** CNcomment:Module����״̬:present/absent */
typedef enum hiUNF_CI_PCCD_STATUS_E
{
    HI_UNF_CI_PCCD_STATUS_ABSENT,
    HI_UNF_CI_PCCD_STATUS_PRESENT,
    HI_UNF_CI_PCCD_STATUS_BUTT
} HI_UNF_CI_PCCD_STATUS_E, *HI_UNF_CI_PCCD_STATUS_E_PTR;

/** card call mode */
/** CNcomment:������ģʽ */
typedef enum hiUNF_CI_PCCD_ACCESSMODE_E
{
    HI_UNF_CI_PCCD_ACCESS_ATTR,
    HI_UNF_CI_PCCD_ACCESS_IO,
    HI_UNF_CI_PCCD_ACCESS_COMMON,
    HI_UNF_CI_PCCD_ACCESS_BUTT
} HI_UNF_CI_PCCD_ACCESSMODE_E;

/** get state register mask code */
/** CNcomment:��ȡ״̬�Ĵ������� */
typedef enum hiUNF_CI_PCCD_STATUS_BIT_E
{
    HI_UNF_CI_PCCD_STATUS_BIT_ALL,  /**< get all bits */	       /**< CNcomment:��ȡ����λ */
    HI_UNF_CI_PCCD_STATUS_BIT_DA,   /**< get Data Available bit */     /**< CNcomment:��ȡData Availableλ */
    HI_UNF_CI_PCCD_STATUS_BIT_FR,   /**< get Free bit */	       /**< CNcomment:��ȡFreeλ */
    HI_UNF_CI_PCCD_STATUS_BIT_RE,   /**< get Read Error bit */	       /**< CNcomment:��ȡRead Errorλ */
    HI_UNF_CI_PCCD_STATUS_BIT_WE,   /**< get Write Error bit */	       /**< CNcomment:��ȡWrite Errorλ */
    HI_UNF_CI_PCCD_STATUS_BIT_BUTT
} HI_UNF_CI_PCCD_STATUS_BIT_E;

/** The mode of CI Transport Stream Interface connection */
/** CNcomment:CI TSI���ӷ�ʽ */
typedef enum hiUNF_CI_TSI_MODE_E
{
    HI_UNF_CI_TSI_DAISY_CHAINED,      /**< Daisy-chained */
    HI_UNF_CI_TSI_INDEPENDENT,	      /**< Independent, non-daisy-chained */
    HI_UNF_CI_TSI_BUTT
}HI_UNF_CI_TSI_MODE_E;

/** The mode of TS pass to the CI device*/
/** CNcomment:��CI�豸��TS��ģʽ */
typedef enum hiUNF_CI_TS_MODE_E
{
    HI_UNF_CI_TS_SERIAL,	 /**< serial 1*/
    HI_UNF_CI_TS_PARALLEL,	 /**< Parallel TS, default */
    HI_UNF_CI_TS_USB2SERIAL,	 /**< USB input, serial output */
    HI_UNF_CI_TS_USB2PARALLEL,	 /**< USB input, parallel output */
    HI_UNF_CI_TS_BUTT
}HI_UNF_CI_TS_MODE_E;

/** The TSI serial number of the CI device*/
/** CNcomment:CI�豸�Ĵ���TS����˿� */
typedef enum hiUNF_CI_TSI_SERIAL_PORT_E
{
    HI_UNF_CI_TSI_SERIAL1 = 0x04,  /**< TSI serial 1*/
    HI_UNF_CI_TSI_SERIAL2,	   /**< TSI serial 2*/
    HI_UNF_CI_TSI_SERIAL3,	   /**< TSI serial 3*/
    HI_UNF_CI_TSI_SERIAL4,	   /**< TSI serial 4*/
    HI_UNF_CI_TSI_SERIAL_BUTT
}HI_UNF_CI_TSI_SERIAL_PORT_E;

/** The command exchange channel between the host and device*/
/** CNcomment:CI�豸*/
typedef enum hiUNF_CI_CMD_EXCHANGE_CHAN_E
{
    HI_UNF_CI_CMD_EXCHANGE_CHAN_USB,
    HI_UNF_CI_CMD_EXCHANGE_CHAN_SPI,
    HI_UNF_CI_EXCHANGE_CHAN_BUTT,
}HI_UNF_CI_CMD_EXCHANGE_CHAN_E;

/** CI device*/
/** CNcomment:֧�ֵ�CI�豸 */
typedef enum hiUNF_CI_DEV_E
{
    HI_UNF_CI_DEV_CIMAX,	/**< CIMaX, default */
    HI_UNF_CI_DEV_CIMAXPLUS,	/**< CIMaX+ */
    HI_UNF_CI_DEV_HICI,		/**< HICI */
    HI_UNF_CI_DEV_STARCI2WIN,	/**< StarCI2Win */
    HI_UNF_CI_DEV_BUTT
}HI_UNF_CI_DEV_E;

/** CIMaX device configuration */
/** CNcomment:CIMaX�豸���� */
typedef struct hiUNF_CI_CIMAX_ATTR_S
{
    HI_U32  u32SMIBitWidth;	    /**< SMI Bit Width */
    HI_U32  u32SMIBaseAddr;	    /**< SMI Base Address */
    HI_U32  u32I2cNum;		    /**< I2C Group */
    HI_U8   u8DevAddress;	    /**< I2C device address */
}HI_UNF_CI_CIMAX_ATTR_S, *HI_UNF_CI_CIMAX_ATTR_S_PTR;

/** CIMaX+ device configuration */
/** CNcomment:CIMaX+�豸���� */
typedef struct hiUNF_CI_CIMAXPLUS_ATTR_S
{
    HI_U32  u32ResetGpioNo; /**< The GPIO to reset the device */
    HI_U32  u32IntGpioNo;   /**< The GPIO to receive the device's Interrupt signal */
    HI_UNF_CI_TSI_SERIAL_PORT_E enTsiSerialPort[HI_UNF_CI_PCCD_BUTT]; /**< The TSI serial port of device*/
    HI_UNF_CI_CMD_EXCHANGE_CHAN_E  enCmdExchangeChan;	  /**< The command exchange channel between the host and device*/
    HI_U32  u32SPIDevNo;	   /**< The SPI device number*/
}HI_UNF_CI_CIMAXPLUS_ATTR_S, *HI_UNF_CI_CIMAXPLUS_ATTR_S_PTR;

/** HICI device configuration */
/** CNcomment:HICI�豸���� */
typedef struct hiUNF_CI_HICI_ATTR_S
{
    HI_BOOL bIsPowerCtrlGpioUsed;
    HI_U32 u32PowerCtrlGpioNo[HI_UNF_CI_PCCD_BUTT];/**< The GPIO to power on/off the device */
}HI_UNF_CI_HICI_ATTR_S, *HI_UNF_CI_HICI_ATTR_S_PTR;

/** CI device configuration */
/** CNcomment:CI�豸���� */
typedef struct hiUNF_CI_ATTR_S
{
    HI_UNF_CI_DEV_E enDevType;						/**< CI device type */
    HI_UNF_CI_TSI_MODE_E enTSIMode;					/**< The mode of CI Transport Stream Interface connection */
    HI_UNF_CI_TS_MODE_E enTSMode[HI_UNF_CI_PCCD_BUTT];	/**< The mode of TS pass to the CI device */
    union
    {
	HI_UNF_CI_CIMAX_ATTR_S stCIMaX;
	HI_UNF_CI_CIMAXPLUS_ATTR_S stCIMaXPlus;
	HI_UNF_CI_HICI_ATTR_S stCIHICI;
    }unDevAttr;
}HI_UNF_CI_ATTR_S, *HI_UNF_CI_ATTR_S_PTR;

/** TS control command */
/** CNcomment:TS�������� */
typedef enum hiUNF_CI_PCCD_TSCTRL_E
{
    HI_UNF_CI_PCCD_TSCTRL_BYPASS,
    HI_UNF_CI_PCCD_TSCTRL_SETMODE,
    HI_UNF_CI_PCCD_TSCTRL_WRITETS,
    HI_UNF_CI_PCCD_TSCTRL_BUTT
}HI_UNF_CI_PCCD_TSCTRL_E;
/** USB TS Write parameter */
/** CNcomment:USB�������� */
typedef struct hiUNF_CI_PCCD_TSWRITE_S
{
    HI_U8* pu8Data;	/**< Write data [in]*/
    HI_U32 u32Size;	/**< Write data size [in]*/
}HI_UNF_CI_PCCD_TSWRITE_S;

/** TS control parameter */
/** CNcomment:TS���Ʋ��� */
typedef union
{
    struct
    {
	HI_BOOL bByPass;    /**< TURE means bypass, FALSE means pass-through */	 /**< CNcomment:TRUE��ʾbypass, FALSE��ʾpass-through */
    }stByPass;

    struct
    {
	HI_UNF_CI_TS_MODE_E enTSMode;	     /**< TS mode: parallel/serial/USB */
    }stMode;

    HI_UNF_CI_PCCD_TSWRITE_S stWrite;

    /* For extend */
}HI_UNF_CI_PCCD_TSCTRL_PARAM_U;


/** @} */  /** <!-- ==== Structure Definition end ==== */

/** @} */  /** <!-- ==== API declaration end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     CI */
/** @{ */  /** <!-- [CI]*/

/**
\brief CI init
\brief CNcomment:CI��ʼ��  CNend
\attention \n
N/A
\param	  N/A					      CNcomment:�� CNend
\retval ::HI_SUCCESS		  success	      CNcomment: �ɹ� CNend
\retval ::HI_FAILURE		  fail		      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_OPEN_ERR	  opening file fail   CNcomment:���ļ�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_Init(HI_VOID);

/**
\brief CI deinit
\brief CNcomment:CIȥ��ʼ��  CNend
\attention \n
N/A
\param	N/A						 CNcomment:�� CNend
\retval ::HI_SUCCESS		 success		 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE		 fail			 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_CLOSE_ERR	 closing file fail	 CNcomment:�ر��ļ�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_DeInit(HI_VOID);

/**
\brief Sets CI device configration.
\brief CNcomment:CI�豸��������	 CNend
\attention \n
N/A
\param[in] enCIPort  CI Port number.			 CNcomment:������CI port CNend
\param[in] pstCIAttr The pointer to a structure of CI device.
							 CNcomment:ָ��CI�豸���Ե�ָ�롣 CNend
\retval ::HI_SUCCESS		success			 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE		fail			 CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_SetAttr(HI_UNF_CI_PORT_E enCIPort, const HI_UNF_CI_ATTR_S *pstCIAttr);

/**
\brief Gets CI device configration.
\brief CNcomment:CI�豸���Ի�ȡ	 CNend
\attention \n
N/A
\param[in] enCIPort  CI Port number.			 CNcomment:������CI port CNend
\param[in] pstCIAttr The pointer to a structure of CI device.
							 CNcomment:ָ��CI�豸���Ե�ָ�롣 CNend
\retval ::HI_SUCCESS		success			 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE		fail			 CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_GetAttr(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_ATTR_S *pstCIAttr);

/**
\brief open CI Port
\brief CNcomment:��CI Port CNend
\attention \n
N/A
\param[in] enCIPort	CI Port number			  CNcomment:������CI port CNend
\retval ::HI_SUCCESS	success				  CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	 fail				  CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter	  CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port	  CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error	  CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error  CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_Open(HI_UNF_CI_PORT_E enCIPort);

/**
\brief close CI Port
\brief CNcomment:�ر�CI Port CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number	CNcomment:������CI port CNend
\retval ::HI_SUCCESS	   success	CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	   fail		CNcomment:ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_Close(HI_UNF_CI_PORT_E enCIPort);

/**
\brief open CAM
\brief CNcomment:��CAM�� CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number					    CNcomment:������CI port CNend
\param[in] enCardId	Card ID						    CNcomment:������ CNend
\retval ::HI_SUCCESS	success						    CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	 fail						    CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA   invalid parameter			    CNcomment: ��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open   CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			    CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error			    CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error		    CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_Open(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
 \brief close CAM
 \brief CNcomment:�ر�CAM�� CNend

 \attention \n
N/A
 \param[in] enCIPort   CI Port number	CNcomment:������CI port CNend
 \param[in] enCardId   Card Id		CNcomment:������ CNend
 \retval ::HI_SUCCESS	success		CNcomment:�ɹ� CNend
 \retval ::HI_FAILURE	 fail		CNcomment:ʧ�� CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_CI_PCCD_Close(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
 \brief CAM power switch
 \brief CNcomment:CAM����Դ���� CNend
 \attention \n
	Some solutions don't support power down for a single card, the calling of this interface
	automatically detects a power outage card plug, if it is on ,it will keep power on
    CNcomment:�еķ�����֧����Ե����ϵ磬���ñ��ӿڶϵ�ʱ���Զ�����Ƿ��п����ϣ�����У�������ϵ� CNend
 \param[in] enCIPort	CI Port number					     CNcomment:������CI port CNend
 \param[in] enCardId	Card Id						     CNcomment:������ CNend
 \param[in] enCtrlPower power on\power off				     CNcomment:���硢�ص� CNend
 \retval ::HI_SUCCESS	   success					     CNcomment:�ɹ� CNend
 \retval ::HI_FAILURE	   fail						     CNcomment:ʧ�� CNend
 \retval ::HI_ERR_CI_INVALID_PARA     invalid parameter			     CNcomment:��Ч���� CNend
 \retval ::HI_ERR_CI_NOT_INIT	      have not been initialized or not open  CNcomment:δ��ʼ����δ�� CNend
 \retval ::HI_ERR_CI_UNSUPPORT	      unsupported CI Port		     CNcomment:��֧�ֵ�CI Port CNend
 \retval ::HI_ERR_CI_REG_READ_ERR     read register error		     CNcomment:���Ĵ������� CNend
 \retval ::HI_ERR_CI_REG_WRITE_ERR    write register error		     CNcomment:д�Ĵ������� CNend
 \retval ::HI_ERR_CI_CANNOT_POWEROFF  can not power off			     CNcomment:���ܶϵ� CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_CI_PCCD_CtrlPower(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					    HI_UNF_CI_PCCD_CTRLPOWER_E enCtrlPower);

/**
\brief CI reset
\brief CNcomment:CAM����λ CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number					      CNcomment:������CI port CNend
\param[in] enCardId    Card Id						      CNcomment:������ CNend
\retval ::HI_SUCCESS   success						      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE   fail						      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter		      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open  CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port		      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR       read register error		      CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error		      CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_Reset(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
\brief CAM ready state checking
\brief CNcomment:CAM������״̬��� CNend
\attention \n
N/A
\param[in] enCIPort	  CI Port number				     CNcomment:������CI port CNend
\param[in] enCardId	  Card Id					     CNcomment:������ CNend
\param[out] penCardReady  state value					     CNcomment:״ֵ̬ CNend
\retval ::HI_SUCCESS	  success					     CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	  fail						     CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA   invalid parameter			     CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	   have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	   unsupported CI Port			     CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR   read register error			     CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR  write register error			     CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_IsReady(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					    HI_UNF_CI_PCCD_READY_E_PTR penCardReady);

/**
\brief check CAM if it is on
\brief CNcomment:CAM���Ƿ���ϼ�� CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number					      CNcomment:������CI port CNend
\param[in] enCardId    Card Id						      CNcomment:������ CNend
\param[out] penCardStatus  card up or card down				      CNcomment:�����ϻ�δ��״̬ CNend
\retval ::HI_SUCCESS	    success					      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail					      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter			      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error			      CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error		      CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_Detect(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					    HI_UNF_CI_PCCD_STATUS_E_PTR penCardStatus);

/**
\brief CAM set access module
\brief CNcomment:CAM�����÷���ģ�� CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number					      CNcomment:������CI port CNend
\param[in] enCardId    Card Id						      CNcomment:������ CNend
\param[in] enAccessMode mode you want to set				      CNcomment:Ҫ���õ�ģʽ CNend
\retval ::HI_SUCCESS	    success					      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail					      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter			      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error			      CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error		      CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_SetAccessMode(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
						    HI_UNF_CI_PCCD_ACCESSMODE_E enAccessMode);

/**
\brief CAM write or read state checking
\brief CNcomment:CAM����д״̬��� CNend
\attention \n
N/A
\param[in] enCIPort    CI Port number					      CNcomment:������CI port CNend
\param[in] enCardId    Card Id						      CNcomment:������ CNend
\param[in] enStatus    status of the bit will check			      CNcomment:Ҫ����״̬λ CNend
\param[out] pu8Value   status code returned				      CNcomment:���ص�״̬�� CNend
\retval ::HI_SUCCESS	    success					      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail					      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter			      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_IO_READ_ERR	      read IO error			      CNcomment:IO������ CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_GetStatus (HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
						HI_UNF_CI_PCCD_STATUS_BIT_E enStatus, HI_U8 *pu8Value);

/**
\brief CAM IO read data
\brief CNcomment:CAM��IO������ CNend
\attention \n
N/A
\param[in] enCIPort	  CI Port number				      CNcomment:������CI port CNend
\param[in] enCardId	  Card Id					      CNcomment:������ CNend
\param[out] pu8Buffer	  data buffer					      CNcomment: ���ݻ����� CNend
\param[out] pu32ReadLen	  data length that read successful		      CNcomment:�ɹ���ȡ�ĳ��� CNend
\retval ::HI_SUCCESS	  success					      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail					      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter			      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error			      CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error		      CNcomment:д�Ĵ������� CNend
\retval ::HI_ERR_CI_IO_READ_ERR	    read IO error			      CNcomment:IO������ CNend
\see \n
    HI_UNF_CI_PCCD_IOWrite()
*/
HI_S32 HI_UNF_CI_PCCD_IORead(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					    HI_U8 *pu8Buffer, HI_U32 *pu32ReadLen);

/**
\brief CAM IO write data
\brief CNcomment:CAM��IOд���� CNend
\attention \n
N/A
\param[in] enCIPort	  CI Port number				      CNcomment:������CI port CNend
\param[in] enCardId	  Card Id					      CNcomment:������ CNend
\param[in] pu8Buffer	  data buffer					      CNcomment:���ݻ����� CNend
\param[in] u32WriteLen	   byte number that have been  writen		      CNcomment:д���ֽ��� CNend
\param[out] pu32WriteOKLen  data length that write successful		      CNcomment:�ɹ�д���ֽ��� CNend
\param[in] enCIPort	  operate CI port				      CNcomment:������CI port CNend
\param[in] enCardId	  Card Id					      CNcomment:������ CNend
\param[out] pu8Buffer	  data buffer					      CNcomment: ���ݻ����� CNend
\param[out] pu32ReadLen	  data length that read successful		      CNcomment:�ɹ���ȡ�ĳ��� CNend
\retval ::HI_SUCCESS	  success					      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail					      CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA    invalid parameter			      CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	    have not been initialized or not open     CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	    unsupported CI Port			      CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error			      CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error		      CNcomment:д�Ĵ������� CNend
\retval ::HI_ERR_CI_IO_WRITE_ERR    write IO error			      CNcomment:IOд���� CNend
\see \n
    HI_UNF_CI_PCCD_IORead()
*/
HI_S32 HI_UNF_CI_PCCD_IOWrite(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					    HI_U8 *pu8Buffer, HI_U32 u32WriteLen, HI_U32 *pu32WriteOKLen);

/**
\brief check CAM CIS information
\brief CNcomment:����CAM��CIS��Ϣ CNend
\attention \n
    reference EN50221.
    CNcomment:��ο��淶 EN50221. CNend
\param[in] enCIPort	  CI Port number					 CNcomment:������CI port CNend
\param[in] enCardId	  Card Id						 CNcomment:������ CNend
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_PCCD_DEVICE_BUSY   device busy				 CNcomment:�豸æ CNend
\retval ::HI_ERR_CI_PCCD_CIS_READ      read CIS information fail		 CNcomment:��CIS��Ϣʧ�� CNend
\retval ::HI_ERR_CI_REG_READ_ERR    read register error				 CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR   write register error			 CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_CheckCIS(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
\brief config CAM COR information
\brief CNcomment:����CAM��COR��Ϣ CNend
\attention \n
    N/A
\param[in] enCIPort	  CI Port number					 CNcomment:������CI port CNend
\param[in] enCardId	  Card Id						 CNcomment:������ CNend
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_PCCD_DEVICE_BUSY   device busy				 CNcomment:�豸æ CNend
\retval ::HI_ERR_CI_ATTR_WRITE_ERR     config COR fail				 CNcomment:����CORʧ�� CNend
\retval ::HI_ERR_CI_REG_READ_ERR       read register error			 CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error			 CNcomment:д�Ĵ������� CNend
\see \n
    N/A
*/
HI_S32 HI_UNF_CI_PCCD_WriteCOR(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
\brief CAM IO reset
\brief CNcomment:CAM��IO�ڸ�λ CNend
\attention \n
    N/A
\param[in] enCIPort	  CI Port number					 CNcomment:������CI port CNend
\param[in] enCardId	  Card Id						 CNcomment:������ CNend
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       not supported CI Port			 CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_PCCD_TIMEOUT       timeout					 CNcomment:��ʱ CNend
\retval ::HI_ERR_CI_REG_READ_ERR       read register error			 CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error			 CNcomment:д�Ĵ������� CNend
\see \n
    HI_UNF_CI_PCCD_CheckCIS()
*/
HI_S32 HI_UNF_CI_PCCD_IOReset(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId);

/**
\brief CAM negotiate buffer size
\brief CNcomment:CAM��Э��buffer size CNend
\attention \n
    N/A
\param[in] enCIPort	 CI Port number						 CNcomment:������CI port CNend
\param[in] enCardId	  Card Id						 CNcomment:������ CNend
\param[in] pu16BufferSize   input  buffer size that master support		 CNcomment:����������֧��buffer size CNend
\param[out] pu16BufferSize  output buffer size after consultation		 CNcomment:���Э�̺��buffer size CNend
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_PCCD_TIMEOUT       timeout					 CNcomment:��ʱ CNend
\retval ::HI_ERR_CI_REG_READ_ERR       read register error			 CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error			 CNcomment:д�Ĵ������� CNend
\retval ::HI_ERR_CI_IO_READ_ERR	       read IO error				 CNcomment:IO������ CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_NegBufferSize(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
						    HI_U16 *pu16BufferSize);

/**
\brief CAM TS control
CNcomment: \brief CAM��TS���� CNend
\attention \n
    N/A
\param[in] enCIPort	  CI Port number					 CNcomment:������CI port CNend
\param[in] enCardId	  Card Id						 CNcomment:������ CNend
\param[in] enCMD	  control command					 CNcomment:�������� CNend
\param[in] pParam	  parameter that matching command			 CNcomment:������ƥ��Ĳ��� CNend
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ�� CNend
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч���� CNend
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ�� CNend
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port CNend
\retval ::HI_ERR_CI_REG_READ_ERR       read register error			 CNcomment:���Ĵ������� CNend
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error			 CNcomment:д�Ĵ������� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_TSCtrl(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
					HI_UNF_CI_PCCD_TSCTRL_E enCMD, HI_UNF_CI_PCCD_TSCTRL_PARAM_U *pParam);

/**
\brief Get CAM CIS
CNcomment:\brief ��ȡCAM��CIS����
\attention \n
    N/A
\param[in] enCIPort			CI Port number					     CNcomment:������CI port
\param[in] enCardId		Card Id						     CNcomment:������
\param[out] pu8CisBuffer	output CIS data					     CNcomment:���CAM��CIS����
\param[out] pu32CisLen		output CIS data length						 CNcomment:���CAM��CIS���ݳ���
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ�
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ��
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч����
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ��
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port
\retval ::HI_ERR_CI_PCCD_DEVICE_BUSY   device busy				 CNcomment:�豸æ
\retval ::HI_ERR_CI_PCCD_CIS_READ      read cis error				 CNcomment:��CIS����
\see \n
N/A
*/
HI_S32 HI_UNF_CI_PCCD_GetCIS(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
			     HI_U8 *pu8CisBuffer, HI_U32 *pu32CisLen);

/**
\brief config CAM COR information
CNcomment:\brief ����CAM��COR��Ϣ
\attention \n
    N/A
\param[in] enCIPort	  CI Port number					 CNcomment:������CI port
\param[in] enCardId	  Card Id						 CNcomment:������
\param[in] u16Addr	  COR register address					 CNcomment:COR�Ĵ�����ַ
\param[in] u8Data	  COR register data					 CNcomment:Ҫд��COR�Ĵ���������
\retval ::HI_SUCCESS	  success						 CNcomment:�ɹ�
\retval ::HI_FAILURE	    fail						 CNcomment:ʧ��
\retval ::HI_ERR_CI_INVALID_PARA       invalid parameter			 CNcomment:��Ч����
\retval ::HI_ERR_CI_NOT_INIT	       have not been initialized or not open	 CNcomment:δ��ʼ����δ��
\retval ::HI_ERR_CI_UNSUPPORT	       unsupported CI Port			 CNcomment:��֧�ֵ�CI Port
\retval ::HI_ERR_CI_PCCD_DEVICE_BUSY   device busy				 CNcomment:�豸æ
\retval ::HI_ERR_CI_ATTR_WRITE_ERR     config COR fail				 CNcomment:����CORʧ��
\retval ::HI_ERR_CI_REG_READ_ERR       read register error			 CNcomment:���Ĵ�������
\retval ::HI_ERR_CI_REG_WRITE_ERR      write register error			 CNcomment:д�Ĵ�������
\see \n
    N/A
*/
HI_S32 HI_UNF_CI_PCCD_WriteCOREx(HI_UNF_CI_PORT_E enCIPort, HI_UNF_CI_PCCD_E enCardId,
				  HI_U16 u16Addr, HI_U8 u8Data);

/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_ECS_TYPE_H__ */
