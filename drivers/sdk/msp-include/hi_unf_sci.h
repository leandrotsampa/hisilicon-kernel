/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
******************************************************************************
 File Name     : hi_unf_sci.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date   : 2008-06-05
Last Modified by:
Description   : Application programming interfaces (APIs) of the external chip software (ECS)
Function List :
Change History:
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_SCI_H__
#define __HI_UNF_SCI_H__

#include "hi_common.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     SCI */
/** @{*/  /** <!-- [SCI] */

/**Output configuration of the smart card interface clock (SCICLK) pin*/
/** CNcomment:SCICLK�����������*/
typedef enum  hiUNF_SCI_MODE_E
{
    HI_UNF_SCI_MODE_CMOS = 0, /**<Complementary metal-oxide semiconductor (CMOS) output*/   /**<CNcomment:CMOS���*/
    HI_UNF_SCI_MODE_OD, /**<Open drain (OD) output*/				      /**<CNcomment:OD���*/
    HI_UNF_SCI_MODE_BUTT
} HI_UNF_SCI_MODE_E;

/**SCI port*/
/** CNcomment:SCI �˿� */
typedef enum hiUNF_SCI_PORT_E
{
    HI_UNF_SCI_PORT0, /**< SCI port 0*/	 /**<CNcomment:SCI�˿�0*/
    HI_UNF_SCI_PORT1, /**< SCI port 1*/	 /**<CNcomment:SCI�˿�1*/
    HI_UNF_SCI_PORT_BUTT
} HI_UNF_SCI_PORT_E;

/**Status of the SCI card*/
/** CNcomment:���ܿ�״̬ */
typedef enum hiUNF_SCI_STATUS_E
{
    HI_UNF_SCI_STATUS_UNINIT = 0, /**<The SCI card is not initialized.(Reserved status) */		 /**<CNcomment: SCIδ��ʼ����(Ԥ��״̬) */
    HI_UNF_SCI_STATUS_FIRSTINIT, /**<The SCI card is being initialized.(Reserved status)*/	       /**<CNcomment:SCI��ʼ�������С�(Ԥ��״̬)*/
    HI_UNF_SCI_STATUS_NOCARD, /**<There is no SCI card.*/			   /**<CNcomment:�޿� */
    HI_UNF_SCI_STATUS_INACTIVECARD, /**<The SCI card is not activated (unavailable).*/	 /**<CNcomment:��δ��ɼ������Ч�� */

    //	 HI_UNF_SCI_STATUS_CARDFAULT,		  /**<The SCI card is faulty.*/			       /**<CNcomment:������*/
    HI_UNF_SCI_STATUS_WAITATR, /**<The SCI card is waiting for the ATR data.*/	    /**<CNcomment:�ȴ�ATR*/
    HI_UNF_SCI_STATUS_READATR, /**<The SCI card is receiving the ATR data.*/	    /**<CNcomment:���ڽ���ATR*/
    HI_UNF_SCI_STATUS_READY, /**<The SCI card is available (activated).*/	  /**<CNcomment:������ʹ�ã������ */
    HI_UNF_SCI_STATUS_RX, /**<The SCI card is busy receiving data.*/	       /**<CNcomment:��æ�����������У� */
    HI_UNF_SCI_STATUS_TX /**<The SCI card is busy transmitting data.*/	      /**<CNcomment:��æ�����������У� */
} HI_UNF_SCI_STATUS_E;

/**SCI protocol*/
/** CNcomment:SCI Э�� */
typedef enum hiUNF_SCI_PROTOCOL_E
{
    HI_UNF_SCI_PROTOCOL_T0, /**<7816 T0 protocol*/   /**<CNcomment:7816 T0 Э�� */
    HI_UNF_SCI_PROTOCOL_T1, /**<7816 T1 protocol*/   /**<CNcomment:7816 T1 Э�� */
    HI_UNF_SCI_PROTOCOL_T14, /**<7816 T14 protocol*/  /**<CNcomment:7816 T14 Э�� */
    HI_UNF_SCI_PROTOCOL_BUTT
} HI_UNF_SCI_PROTOCOL_E;

/**SCI active level*/
/** CNcomment:SCI��Ч��ƽ*/
typedef enum hiUNF_SCI_LEVEL_E
{
    HI_UNF_SCI_LEVEL_LOW, /**<Active low*/   /**<CNcomment:�͵�ƽ��Ч */
    HI_UNF_SCI_LEVEL_HIGH, /**<Active high*/  /**<CNcomment:�ߵ�ƽ��Ч */
    HI_UNF_SCI_LEVEL_BUTT
} HI_UNF_SCI_LEVEL_E;

/**SCI system parameters*/
/**CNcomment:SCI ϵͳ���� */
typedef struct hiUNF_SCI_PARAMS_S
{
    HI_UNF_SCI_PORT_E	  enSciPort; /**<SCI port ID*/							    /**<CNcomment:SCI �˿ں� */
    HI_UNF_SCI_PROTOCOL_E enProtocolType; /**<Used protocol type*/				      /**<CNcomment:ʹ�õ�Э������ */
    HI_U32		  ActalClkRate; /**<Actual clock rate conversion factor F*/			/**<CNcomment:ʵ�ʵ�F ֵʱ��ת������ */
    HI_U32		  ActalBitRate; /**<Actual bit rate conversion factor D*/			  /**<CNcomment:ʵ�ʵ�D ֵ������ת������ */
    HI_U32		  Fi; /**<Clock factor returned by the answer to reset (ATR)*/			    /**<CNcomment:ATR ���ص�ʱ������ */
    HI_U32		  Di; /**<Bit rate factor returned by the ATR*/					    /**<CNcomment:ATR ���صı��������� */
    HI_U32		  GuardDelay; /**<Extra guard time N*/					      /**<CNcomment:N ֵ�������ӵı���ʱ��*/
    HI_U32		  CharTimeouts; /**<Character timeout of T0 or T1*/				/**<CNcomment:T0 ��T1���ַ���ʱʱ��*/
    HI_U32		  BlockTimeouts; /**<Block timeout of T1 */					/**<CNcomment:T1�Ŀ鳬ʱʱ��*/
    HI_U32		  TxRetries; /**<Number of transmission retries*/				    /**<CNcomment:�������Դ���*/
} HI_UNF_SCI_PARAMS_S, *HI_UNF_SCI_PARAMS_S_PTR;

/** @}*/  /** <!-- ==== Structure Definition End ====*/




/******************************* API Declaration *****************************/
/** \addtogroup	     SCI*/
/** @{*/  /** <!-- [SCI] */

/**
 \brief Initializes the SCI.   CNcomment:SCI��ʼ����CNend
 \attention \n
 \param	 N/A		       CNcomment:�ޡ�CNend
 \retval 0 Success	       CNcomment:�ɹ���CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_Init(HI_VOID);

/**
 \brief Deinitializes the SCI. CNcomment:SCIȥ��ʼ����CNend
 \attention \n
 \param	 N/A		       CNcomment:�ޡ�CNend
 \retval 0 Success	       CNcomment:0 �ɹ���CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_DeInit(HI_VOID);

/**
 \brief Starts an SCI device to initialize it based on the input port and protocol. If there is an SCI card, the card is also initialized.\n
CNcomment:��SCI��Smart Card Interface���豸���������Ķ˿ں�Э�飬����SCI�ӿ��豸�ĳ�ʼ������������ڣ���ͬʱ�Կ����г�ʼ����CNend
\attention \n
After an SCI device is started, it is initialized based on the default configuration.\n
If you modify the configuration, you need to call HI_UNF_SCI_ResetCard for the modifications to take effect.\n
If you remove and then insert the SCI card, you need to call HI_UNF_SCI_ResetCard to reset the card.\n
You need to set frequency parameters when enabling an SCI device. The actual SCI clock provided by the chip is obtained by using the clock divider.\n
The clock divider is calculated based on the externally transferred clock frequency parameters. The fractional part of the clock divider is discarded during calculation. \n
Therefore, an enhanced error occurs when the SCI clock is obtained by dividing the system clock by the clock divider. You need to set the actual output frequency of \n
the SCI card based on the close output frequency. The SCI clock is calculated as follows: Fsci_clk = Frefclk/[(Clkicc + 1) x 2]. Where, Frefclk is the 96 MHz system clock, \n
Fsci_clk is the SCI clock required by peripherals, and clkicc is the required clock divider of registers. clkicc is calculated as follows: Clkicc = Frefclk/(2 x Fsci_clk) - 1. \n
The clkicc may be a floating point value, but only the integral part is used. Therefore, the configured frequency is different from the actual frequency.\n

CNcomment: �򿪺�SCI�豸����Ĭ�����ö��豸���г�ʼ����\n
֮��������������ã���Ҫ����HI_UNF_SCI_ResetCard��ʹ������Ч��\n
֮������Կ����аβ壬��Ҫ����HI_UNF_SCI_ResetCard�����и�λ��\n
���豸��ʱ����Ҫ����Ƶ�ʲ�������оƬʵ�ʸ�SCI ��ʱ�������ⲿ����� \n
ʱ��Ƶ�ʲ�������ķ�Ƶ���ӷ�Ƶ��������Ϊ���㹫ʽ����������ķ�Ƶ���ӵ�С�����֣�\n
����ͨ��ϵͳʱ�ӷ�Ƶ֮�������ʱ�ӻ����������ʵ�����ÿ�����������ӽ���ֵ�� \n
���ú�Ȩ�⣬�����㷨 Fsci_clk = Frefclk/[(Clkicc + 1) x 2];����Frefclk��ϵͳ96Mʱ�ӣ�Fsci_clk���ⲿ��Ҫ���õ� \n
sciʱ��,ʵ��Ҫ����Ĵ�����Ƶ����Clkicc = Frefclk/(2 x Fsci_clk) - 1;clkicc ��ʱ���������Ǹ���������ֻȡ����\n
�������õ�Ƶ����ʵ��Ƶ����ƫ�CNend

 \param[in] enSciPort	  ID of an SCI port. The port ID can be 0 or 1.	 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enSciProtocol Protocol type.				  CNcomment:Э�����͡�CNend
 \param[in] u32Frequency    Frequency of the SCI card to be set, in kHz. For the T0 and T1 cards, the frequency ranges from 1 MHz to 5 MHz; for the T14 card, the frequency must be set to 6 MHz.  CNcomment:Ҫ���õ�SCI��Ƶ�ʡ�����T0��T1����֧��Ƶ��1MHz��5MHz������T14����ֻ֧��6MHz����λΪkhz��CNend
 \retval 0 Success.							  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	SCI  No SCI device is started.		 CNcomment:�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.		 CNcomment:�����Ƿ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_Open(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_PROTOCOL_E enSciProtocol, HI_U32 u32Frequency);

/**
 \brief Stops an SCI device.
CNcomment:�ر�SCI�豸��CNend

 \attention \n
This API cannot be called repeatedly.
CNcomment:�ظ��رջ�ʧ�ܡ�CNend

 \param[in] enSciPort	  ID of an SCI port. The port ID can be 0 or 1.	 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \retval 0 Success.							  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.		 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.		 CNcomment:�����Ƿ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_Close(HI_UNF_SCI_PORT_E enSciPort);

/**
 \brief Performs a warm reset on an SCI card.
CNcomment:��λSCI����CNend

 \attention \n
If no SCI card is inserted, the reset fails.\n
If you modify the configuration of an SCI device, you need to call HI_S32 HI_UNF_SCI_ResetCard for the modifications to take effect.\n
In addition, if you remove and insert an SCI card after calling HI_UNF_SCI_Open, you also need to call HI_S32 HI_UNF_SCI_ResetCard to reset the card.
CNcomment:û�в��뿨����λ��ʧ�ܡ�\n
��������SCI�豸�����ú���Ҫ���øýӿ�ʹ������Ч��\n
�ڵ��ô�SCI�豸�ӿں󣬶Կ����аβ壬Ҳ��Ҫ���øýӿڽ��и�λ��CNend

 \param[in] enSciPort	ID of an SCI port. The port ID can be 0 or 1						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] bWarmResetValid   Reset mode.  HI_TRUE: warm reset; HI_FALSE: cold reset (recommended)			 CNcomment:��λ��ʽ��HI_TRUE: �ȸ�λ; HI_FALSE: �临λ���Ƽ������ַ�ʽ����CNend
 \retval 0 Success.												 CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ResetCard(HI_UNF_SCI_PORT_E enSciPort, HI_BOOL bWarmResetValid);

/**
 \brief Deactivates an SCI card.
CNcomment:ȥ����SCI����CNend

 \attention \n
After an SCI card is deactivated, the card cannot be read or written until it is reset.
CNcomment:ȥ������޷���д���ݡ�ֻ�����¸�λ���󣬲��ܼ�����д��CNend

 \param[in] enSciPort ID of an SCI port. The port ID can be 0 or 1.	    CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \retval 0   Success.							     CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT No SCI device is started.		    CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.		    CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.		       CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_DeactiveCard(HI_UNF_SCI_PORT_E enSciPort);

/**
 \brief Obtains the ATR data of an SCI card.
CNcomment:��ȡSCI��ATR���ݡ�CNend

 \attention \n
N/A
 \param[in]  enSciPort	ID of an SCI port. The port ID can be 0 or 1.						  CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[out]  pu8AtrBuf	  Address for storing the obtained ATR data.						   CNcomment:��ȡ��ATR���ݵĴ洢��ַ��CNend
 \param[in]  u32AtrBufSize  Length of the ATR data read from the buffer.					  CNcomment:ATR ���ݶ�ȡ buffer ���ȡ�CNend
 \param[out]  pu8AtrRcvCount Actual number of ATR data segments.						   CNcomment:ʵ�ʻ�ȡ��ATR���ݸ�����CNend
 \retval 0   Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.							  CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_NULL_PTR The pointer is invalid.								  CNcomment: �Ƿ�ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							  CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_NO_ATR  There is no ATR data.								  CNcomment:��ATR���ݡ�CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.											  CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_GetATR(HI_UNF_SCI_PORT_E enSciPort, HI_U8 *pu8AtrBuf, HI_U32 u32AtrBufSize, HI_U8 *pu8AtrRcvCount);

/**
 \brief Obtains the status of an SCI card.
CNcomment:��ȡSCI��״̬��CNend

 \attention \n
This API is a non-block API. You can transfer data to an SCI card by calling HI_UNF_SCI_Send or HI_UNF_SCI_Receive only when the card status is HI_UNF_SCI_STATUS_READY.\n
CNcomment:�˽ӿ����������������ڿ���״̬ΪHI_UNF_SCI_STATUS_READYʱ���ſɵ���HI_UNF_SCI_Send��HI_UNF_SCI_Receive�ӿ��뿨�������ݽ�����CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[out] penSCIStatus  Status of an SCI card.								 CNcomment: SCI��״̬��CNend
 \retval 0 Success.												 CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_NULL_PTR The pointer is invalid.								 CNcomment:�Ƿ�ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_GetCardStatus(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_STATUS_E *penSciStatus);

/**
 \brief Transmits data to an SCI card.
CNcomment:��SCI���������ݡ�CNend

 \attention \n
Data must be transmitted based on application protocols.\n
Data cannot be transmitted consecutively.\n
In addition, data is transmitted and received in block mode. Therefore, when a large number of data is being transmitted, the transmission may fail if the timeout is too small.\n
CNcomment:����������Ҫ����Ӧ��Э�������� \n
�����������η��Ͷ��м䲻�������� \n
���Ͷ�ȡ���������ģ���˷��ʹ���������ʱ���ܵ���ʱʱ������ƣ������ʱֵ�Ƚ϶̣��п��ܷ���ʧ�ܡ�CNend

 \param[in] enSciPort	ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in]  pSciSendBuf Address for storing the data to be transmitted.					  CNcomment:�������ݵĴ洢��ַ��CNend
 \param[in] u32SendLen	Number of data segments (in byte) to be transmitted.					  CNcomment:�������ݵĸ���,��λΪ BYTE��CNend
 \param[in]  pu32ActLen Number of transmitted data segments (in byte).						  CNcomment:ʵ�ʷ������ݸ���,��λΪ BYTE��CNend
 \param[in] u32TimeoutMs Wait timeout (in ms). 0: not blocked; 0xFFFFFFFF: infinite block.			  CNcomment:�ȴ���ʱֵ, ��λ�Ǻ���, 0 - ������, 0xFFFFFFFF-����������CNend
 \retval 0 Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	SCI  No SCI device is started.							 CNcomment:�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_NULL_PTR	The pointer is invalid.								 CNcomment:�Ƿ�ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_PARA The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_SEND_ERR	The transmission operation fails.						CNcomment: ���Ͳ���ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_Send(HI_UNF_SCI_PORT_E enSciPort, HI_U8 *pSciSendBuf, HI_U32 u32SendLen, HI_U32 *pu32ActLen,
		       HI_U32 u32TimeoutMs);

/**
 \brief Receives data from an SCI card.
CNcomment:��SCI���������ݡ�CNend

 \attention \n
You must set the data length obtained by each upper-layer application based on the protocol. If the length of the obtained data is greater than that of the returned data, this API is returned after timeout occurs.\n
CNcomment:�ϲ�Ӧ�ó���������Э������������ȡ�ĳ��ȣ����ϣ����ȡ�ĳ��ȳ���ʵ���ܹ����صĳ��ȣ���ֻ�ܵȵ���ʱ���ڲ��ܷ��ء�CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[out]  pSciReceiveBuf   Address for storing the received data.						   CNcomment:�������ݵĴ洢��ַ��CNend
 \param[in] u32ReceiveLen  Number of data segments (in byte) to be received.					  CNcomment:�����������ݵĸ���,��λΪ BYTE��CNend
 \param[out]  pu32ActLen   Number of received data segments (in byte).						   CNcomment:ʵ�ʽ������ݸ���,��λΪ BYTE��CNend
 \param[in] u32TimeOutMs  Wait timeout (in ms). 0: not blocked; 0xFFFFFFFF: infinite block.			  CNcomment:�ȴ���ʱֵ, ��λ�Ǻ���, 0 - ������, 0xFFFFFFFF-����������CNend
 \retval 0 Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_NULL_PTR	The pointer is invalid.								 CNcomment: �Ƿ�ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_RECEIVE_ERR  The reception operation fails.						CNcomment:���ղ���ʧ�ܡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_Receive(HI_UNF_SCI_PORT_E enSciPort, HI_U8 *pSciReceiveBuf, HI_U32 u32ReceiveLen, HI_U32 *pu32ActLen,
			  HI_U32 u32TimeOutMs);

/**
 \brief Sets the active level of the VCCEN signal.
CNcomment:����VCCEN�ź��ߵ���Ч��ƽ��CNend
 \attention \n
The active level needs to be set based on the circuits of hardware, and the low level is active by default.\n
After changing the active level, you need to call HI_UNF_SCI_ResetCard for the modification take effect.\n
CNcomment:��Ҫ����Ӳ����·�������ã�Ĭ��Ϊ�͵�ƽ��Ч�����Ĵ������ú���Ҫ����HI_UNF_SCI_ResetCard����ʹ�µ�������Ч��CNend

 \param[in] enSciPort ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enSciVcc  Active level of a signal. HI_FALSE: active low; HI_TRUE: active high  Active level of a signal. HI_FALSE: active low; HI_TRUE: active high.  CNcomment:�ź��ߵ���Ч��ƽ��HI_FALSE���͵�ƽ��Ч��HI_TRUE���ߵ�ƽ��Ч��CNend
 \retval 0   Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ConfigVccEn(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_LEVEL_E enSciVcc);

/**
 \brief Sets the active level of the DETECT signal.
CNcomment:����DETECT�ź��ߵ���Ч��ƽ��CNend

 \attention \n
The active level needs to be set based on the circuits of hardware, and the high level is active by default.\n
After changing the active level, you need to call HI_UNF_SCI_ResetCard for the modification take effect.\n
CNcomment:��Ҫ����Ӳ����·�������ã�Ĭ��Ϊ�ߵ�ƽ��Ч�����Ĵ������ú���Ҫ����HI_UNF_SCI_ResetCard����ʹ�µ�������Ч��CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enSciDetect Active level of a signal. HI_FALSE: active low; HI_TRUE: active high.			  CNcomment:�ź��ߵ���Ч��ƽ��HI_FALSE���͵�ƽ��Ч��HI_TRUE���ߵ�ƽ��Ч��CNend
 \retval 0  Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ConfigDetect(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_LEVEL_E enSciDetect);

/**
 \brief Sets the mode of a clock signal.
CNcomment:����ʱ���ߵ�ģʽ��CNend
 \attention \n
The mode needs to be set based on the circuits of hardware, and the OD mode is selected by default.\n
After changing the mode, you need to call HI_UNF_SCI_ResetCard for the modification take effect.\n
CNcomment:��Ҫ����Ӳ����·�������ã�Ĭ��ΪODģʽ�����Ĵ������ú���Ҫ����HI_UNF_SCI_ResetCard����ʹ�µ�������Ч��CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enClkMode  Mode of a clock signal.									  CNcomment:ʱ���ߵ�ģʽ��CNend
 \retval 0 Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ConfigClkMode(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_MODE_E enClkMode);

/**
 \brief Sets the mode of a clock signal.
CNcomment:����RESET�ߵ�ģʽ��CNend
 \attention \n
The mode needs to be set based on the circuits of hardware, and the OD mode is selected by default.\n
After changing the mode, you need to call HI_UNF_SCI_ResetCard for the modification take effect.\n
CNcomment:��Ҫ����Ӳ����·�������ã�Ĭ��ΪODģʽ�����Ĵ������ú���Ҫ����HI_UNF_SCI_ResetCard����ʹ�µ�������Ч��CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enClkMode  Mode of a reset signal.									  CNcomment:ʱ���ߵ�ģʽ��CNend
 \retval 0 Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.									 CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NOTSUPPORT	Current chipset not support config RESET output type.			     CNcomment:��ǰоƬ��֧������RESET������͡�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ConfigResetMode(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_MODE_E enResetMode);

/**
 \brief Sets the mode of a clock signal.
CNcomment:����POWEREN�ߵ�ģʽ��CNend
 \attention \n
The mode needs to be set based on the circuits of hardware, and the OD mode is selected by default.\n
After changing the mode, you need to call HI_UNF_SCI_ResetCard for the modification take effect.\n
CNcomment:��Ҫ����Ӳ����·�������ã�Ĭ��ΪODģʽ�����Ĵ������ú���Ҫ����HI_UNF_SCI_ResetCard����ʹ�µ�������Ч��CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enClkMode  Mode of a poweren signal.								    CNcomment:ʱ���ߵ�ģʽ��CNend
 \retval 0 Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.									 CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NOTSUPPORT	Current chipset not support config POWEREN output type.			     CNcomment:��ǰоƬ��֧������POWEREN������͡�CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_ConfigVccEnMode(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_MODE_E enVccEnMode);


/**
 \brief Changes the card slot.
CNcomment:�л����ۡ�CNend

 \attention \n
When you call HI_UNF_SCI_Open, the primary card is used by default, that is, port 0 is used.\n
After you switch to a new SCI device, all the preceding SCI APIs are called to operate the new SCI device.\n
In addition, after a new SCI device is switched, the device is initialized based on the default configuration.\n
If any modifications are made, you need to call HI_UNF_SCI_ResetCard for the modifications to take effect.\n
If the SCI port to be switched to is the same as the current active port, an error code is returned.\n
CNcomment:����HI_UNF_SCI_Openʱ��Ĭ�ϴ򿪵�Ϊ���������˿�0��\n
�л����µ�SCI�豸����������SCI�ӿڼ����µ�SCI�豸���в�����\n
�л����µ�SCI�豸����Ĭ�����ö��豸���г�ʼ����\n
֮��������������ã���Ҫ����HI_UNF_SCI_ResetCard��ʹ������Ч��\n
ϣ���л�����SCI�˿��뵱ǰ��Ч�˿���ͬʱ���᷵��ʧ�ܡ�CNend

 \param[in] enSciPort  ID of an SCI port. The port ID can be 0 or 1.						 CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param[in] enSciProtocol  Protocol type.									  CNcomment:Э�����͡�CNend
 \param[in] u32Frequency Frequency of the SCI card to be set, in kHz. For the T0 and T1 cards, the frequency ranges from 1 MHz to 5 MHz; for the T14 card, the frequency must be set to 6 MHz. CNcomment:Ҫ���õ�SCI��Ƶ�ʡ�����T0��T1����֧��Ƶ��1MHz~5MHz������T14����ֻ֧��6MHz����λΪkHz��CNend
 \retval 0  Success.												  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							 CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_NULL_PTR The pointer is invalid.								 CNcomment:�Ƿ�ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							 CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							 CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SwitchCard(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_PROTOCOL_E enSciProtocol, HI_U32 u32Frequency);

/**
 \brief Sets the clock rate factor (in ETU) and baud rate regulator factor for special cards.
CNcomment:�����⿨��Ҫ����ָ��etu ʱ�������ӣ������ʵ������ӡ�CNend

 \attention \n
This API needs to be called only for special cards.
The configured values must match the clock rate conversion factor F and bit rate regulator factor D defined in the protocol.
You can also set the factors to the values defined in the card specifications. Note that the values must be set correctly.
CNcomment:ֻ������Ҫ��Ŀ���Ҫ���ã���ͨ������Ҫ���ô˽ӿ����ã�
���õ�ֵҪ��Э���й涨��Fʱ��ת��ת�����ӡ�D�����ʵ������Ӽ��ݣ�
��������Ϊ���淶�й涨��ֵ�������������á�CNend

 \param [in]	enSciPort	ID of an SCI port. The port ID can be 0 or 1.						  CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	u32ClkFactor  Clock rate conversion factor, ranging from 372 to 2048. For details, see the factor F and card features in the protocol.	CNcomment:ʱ��ת������372��2048 ���������òο�Э���F���ӺͿ����ԡ�CNend
 \param [in]	u32BaudFactor	Baud rate regulator factor 1, 2 x n (n = 1-16). For details, see the factor D and card features in the protocol. CNcomment:������У������1��2*n (n=1��16) ���������òο�Э��D���ӺͿ����ԡ�CNend
 \retval  0	Success.											       CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	No SCI device is started.							   CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA The parameter is invalid.							   CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							   CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SetEtuFactor(HI_UNF_SCI_PORT_E enSciPort, HI_U32 u32ClkFactor, HI_U32 u32BaudFactor);

/**
 \brief \brief Sets the extra guard time for transmitting two consecutive bytes from the terminal to an IC card. The guard time is the interval between the start edges of two consecutive bytes.
CNcomment:�����ն���IC�����������������ֽ���ʼ�ض������ӵļ��ʱ�䡣CNend

 \attention \n
This setting is performed based on related features only for the cards that require extra character guard time.
In general, the default value is used or the interval guard time is automatically set based on the ART analysis result.
CNcomment:ֻ������Ҫ��Ŀ�����Ҫ���������ַ�����ʱ��Ĳ��ܸ��ݿ�������������ã�
�����������á�һ��ʹ��ϵͳĬ��ֵ������ϵͳ����ATR�����Զ����á�CNend
 \param [in]	enSciPort	ID of an SCI port. The port ID can be 0 or 1.		CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	u32GuardTime  Extra guard time, ranging from 0 to 254 ETU.		CNcomment:�����������ķ�Χ0��254  etu��CNend
 \retval 0  Success.									CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.				CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.				CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.				CNcomment:�����õ�ѡ�CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SetGuardTime(HI_UNF_SCI_PORT_E enSciPort, HI_U32 u32GuardTime);

/**
 \brief Sets the baud rate supported by the SCI card through protocol and parameters selection (PPS) negotiation or performs negotiation by using the F and D factors returned by the ATR to switch the protocol of a card.
CNcomment:ͨ��PPS Э�̿������ÿ���֧�ֵĲ����ʻ�����ATR ���ص�F��D���ӽ���Э�̣�֧�ֶ�Э�鿨��Э���л���CNend
\attention \n
PPS negotiation is available only when the SCI card supports this function.
The negotiated baud rate must be supported by the SCI card.
The command words for negotiation must comply with the specifications defined in section 9.2 "PPS request and response" in the 7816-3 protocol.
CNcomment:Ҫ����PPS Э�����ȿ�����֧�ָù��ܣ�
ҪЭ�̵Ĳ��������ݱ����ǿ����涨��֧�ֵĲ����ʷ�Χ��
����Э�̵������������7816-3 ��9.2 PPS request and response��CNend

 \param [in]	enSciPort	ID of an SCI port. The port ID is 0 or 1.				  CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	pSciSendBuf  PPS negotiation command combined based on card specifications. If the default negotiation mode is used, the command word can be left empty.   CNcomment:���ݿ��淶��ϵ�PPSЭ�������ʹ��ϵͳĬ�ϵ�Э�̷�ʽ�������ֵ����ݿ�Ϊ�ա�CNend
 \param [in]	Sendlen	   Length of the command word to be transmitted, ranging from 0 bytes to 5 bytes. The value 0 indicates that the default negotiation mode is used.   CNcomment: ���������ֵĳ���(0��5),����Ϊ0��ʾʹ��ϵͳĬ�ϵ�Э�����ʽ��CNend
 \param [in]	RecTimeouts  PPS response timeout after commands are transmitted. The value ranges from 1 ms to 10000 ms.  CNcomment: ����������֮�󣬽���PPS ��Ӧ�ĳ�ʱʱ��(1-10000),��λ�Ǻ��롣CNend
 \retval 0	Success.											CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_NOT_INIT	 No SCI device is started.							CNcomment:SCI�豸δ�򿪡�CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.							CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_NULL_PTR		The pointer is null.							CNcomment:��ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.							CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_RECEIVE_ERR  A reception error occurs.							CNcomment:���մ���CNend
 \retval ::HI_ERR_SCI_PPS_PTYPE_ERR	The protocol type for PPS negotiation is incorrect.			CNcomment:PPSЭ�̵�Э�����ʹ���CNend
 \retval ::HI_ERR_SCI_PPS_FACTOR_ERR	The F factor and D factor for PPS negotiation are incorrect.		CNcomment:PPSЭ�̵�F��D���Ӵ���CNend
 \retval ::HI_ERR_SCI_PPS_NOTSUPPORT_ERR  The PPS negotiation type is not supported.				CNcomment:��֧�ֵ�PPSЭ�����͡�CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_NegotiatePPS(HI_UNF_SCI_PORT_E enSciPort, HI_U8 *pSciSendBuf, HI_U32 Sendlen, HI_U32 RecTimeouts);

/**
 \brief	 Obtains the PPS data for the card response after PPS negotiation is successful.
CNcomment:PPS Э�̳ɹ�֮��,ͨ���ýӿڿɻ�ÿ���Ӧ��PPS ���ݡ�CNend
 \attention \n
This API takes effect only after PPS negotiation is successful.
CNcomment:Ҫ��PPS Э�̳ɹ�֮��,ʹ�øýӿڲ���ʵ�����塣CNend

 \param [in]	enSciPort	ID of an SCI port. The port ID is 0 or 1.		    CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [out]	pRecBuf	  Address of the buffer for storing the data to be received.	CNcomment:�����յ�����buffer ��ַ��CNend
 \param [out]	pDataLen	  Required length of the received data.			     CNcomment:�����������ݵĳ��ȡ�CNend
 \retval 0  Success.										CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.				CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_NULL_PTR	The pointer is null.					CNcomment:��ָ�롣CNend
 \retval ::HI_ERR_SCI_PPS_NOTSUPPORT_ERR  The PPS negotiation type is not supported.	CNcomment:��֧�ֵ�PPSЭ�����͡�CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_GetPPSResponData(HI_UNF_SCI_PORT_E enSciPort, HI_U8* pRecBuf, HI_U32* pDataLen);

/**
brief  Obtains the SCI parameter values including the protocol, ATR clock factor, ATR bit rate factor, actual clock factor, actual bit rate factor, number of retries, guard delay, character wait timeout, and block wait timeout.
CNcomment:��ȡsci ��������Э�顢ATR ʱ�Ӻͱ��������ӡ�ʵ�����õ�ʱ�����Ӻͱ��������ӣ�
�������Դ�����GuardDelay ���ַ��ȴ���ʱ����ȴ���ʱ��CNend
 \attention \n
This API is available only after HI_UNF_SCI_Init and HI_UNF_SCI_ResetCard are called.
CNcomment:Ҫ�� ����ʼ����λ֮��,����ʹ�øýӿڡ�CNend

 \param [in]	enSciPort	 ID of an SCI port. The port ID is 0 or 1.			CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [out]	pParams	  Pointer to the data type of the data structure to be received.	CNcomment:�����յĽṹ����������ָ�롣CNend
 \retval 0	Success.									CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_INVALID_PARA The parameter is invalid.					CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_NULL_PTR		The pointer is null.					CNcomment:��ָ�롣CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.					CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NOT_INIT		The SCI device is not initialized.			CNcomment:û��ɳ�ʼ����CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_GetParams(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_PARAMS_S_PTR pParams);

/**
 \brief	 Sets the character timeout of T0 and T1 separately based on the current protocol type.
CNcomment:���ݵ�ǰЭ�����ͷֱ������T0��T1���ַ���ʱʱ�䡣CNend

 \attention \n
The timeout can be set only after the SCI card is reset successfully. The protocol type must be consistent with the current card type. In general, the timeout is obtained by parsing the ATR. That is, the timeout needs to be set only when card communication fails.
CNcomment:Ҫ�ȿ���λ�ɹ�֮��,���ܽ������ã�Э�����Ͳ��������뵱ǰ������һ�£�һ��������Ǹ���ATR������ֻ�����⿨�������Ҫ���á�CNend

 \param [in]	enSciPort	ID of an SCI port. The port ID is 0 or 1.   CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	enSciProtocol  Protocol type.					CNcomment:Э�����͡�CNend
 \param [in]	MaxCharTime  Maximum character timeout. The value of MaxCharTime for T0 ranges from 960 to 244800, and the value of MaxCharTime for T1 ranges from 12 to 32779.	  CNcomment:���������ַ���ʱʱ�䣬���÷�ΧT0(960��244800),T1(12��32779)��CNend
 \retval 0	Success.							CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.		CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.			CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NO_ATR	The SCI card fails to be reset.		CNcomment:û��λ�ɹ���CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SetCharTimeout(HI_UNF_SCI_PORT_E enSciPort, HI_UNF_SCI_PROTOCOL_E enSciProtocol, HI_U32 MaxCharTime);

/**
 \brief	 Sets the block timeout of T1.
CNcomment:����T1�Ŀ鳬ʱʱ�䡣CNend
\attention \n
The timeout can be set only after the SCI card is reset successfully. In general, the timeout is obtained by parsing the ATR. That is, the timeout needs to be set only in special cases
CNcomment:Ҫ�ȿ���λ�ɹ�֮��,���ܽ������ã�һ��������Ǹ���ATR������ֻ�����⿨�������Ҫ���á�CNend

 \param [in]	enSciPort	 ID of an SCI port. The port ID is 0 or 1.				CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	MaxBlockTime   Maximum block timeout. The value ranges from 971 to 491531.	CNcomment:���ÿ鳬ʱ�����ֵ����Χ(971��491531)��CNend
 \retval 0	Success.											CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_INVALID_PARA The parameter is invalid.						CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.						CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NO_ATR		The SCI card fails to be reset.					CNcomment:û��λ�ɹ���CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SetBlockTimeout(HI_UNF_SCI_PORT_E enSciPort, HI_U32 MaxBlockTime);

/**
 \brief	 Sets the maximum number of transmission retries after a check error occurs.
CNcomment:����У�������ط�����������CNend
\attention \n
The number can be set only after the SCI card is reset successfully.
CNcomment:Ҫ�ȿ���λ�ɹ�֮��,���ܽ������á�CNend

 \param [in]	enSciPort	ID of an SCI port. The port ID is 0 or 1.		    CNcomment:SCI�˿ںţ�ȡֵ��ΧΪ0��1��CNend
 \param [in]	TxRetryTimes   Number of transmission retries, ranging from 0 to 7.	CNcomment:������Χ(0��7)��CNend
 \retval 0	Success.									CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SCI_INVALID_PARA  The parameter is invalid.				CNcomment:�����Ƿ���CNend
 \retval ::HI_ERR_SCI_INVALID_OPT	The option is invalid.					CNcomment:�����õ�ѡ�CNend
 \retval ::HI_ERR_SCI_NO_ATR	The SCI card fails to be reset.				CNcomment:û��λ�ɹ���CNend

 \see \n
N/A
 */
HI_S32 HI_UNF_SCI_SetTxRetries(HI_UNF_SCI_PORT_E enSciPort, HI_U32 TxRetryTimes);

/** @}*/  /** <!-- ==== API Declaration End ====*/

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* __HI_UNF_SCI_H__ */
