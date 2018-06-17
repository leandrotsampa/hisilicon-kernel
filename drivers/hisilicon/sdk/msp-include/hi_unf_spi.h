/******************************************************************************
Copyright (C), 2004-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hi_unf_spi.h
Version	      : Initial Draft
Author	      : Hisilicon STB SDK group
Created	      : 2013/4/22
Last Modified :
Description   : output control	Function
Modification  : Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __HI_UNF_SPI_H__
#define	 __HI_UNF_SPI_H__

#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */


/*************************** Structure Definition ****************************/

/** \addtogroup	     SPI */
/** @{*/  /** <!-[SPI]*/

/** SPI device select */
/** CNcomment: SPI �豸 */
typedef enum hiUNF_SPI_DEV_E
{
    HI_UNF_SPI_DEV_0 =0 ,
    HI_UNF_SPI_DEV_1 = 1,
    HI_UNF_SPI_DEV_BUTT
}HI_UNF_SPI_DEV_E;

/** SPI CS Config */
/** CNcomment: SPI CS������*/
typedef enum hiUNF_SPI_CFGCS_E
{
    HI_UNF_SPI_LOGIC_CS =0 ,
    HI_UNF_SPI_GPIO_CS = 1,
}HI_UNF_SPI_CFGCS_E;


/** SPICLOCKOUT polarity */
/** CNcomment: SPICLOCKOUT ����ֵö�� */
typedef enum hiUNF_SPI_SPO_E
{
    HI_UNF_SPI_SPO_0 = 0,
    HI_UNF_SPI_SPO_1 = 1
}HI_UNF_SPI_SPO_E;

/** SPICLOCKOUT	 phase */
/** CNcomment: SPICLOCKOUT ��λֵö�� */
typedef enum hiUNF_SPI_SPH_E
{
    HI_UNF_SPI_SPH_0 = 0,
    HI_UNF_SPI_SPH_1 = 1
}HI_UNF_SPI_SPH_E;

/** SPI Frame format */
/** CNcomment: ֡��ʽ */
typedef enum hiUNF_SPI_FRF_E
{
    HI_UNF_SPI_FRF_MOTO = 0,	/**< Motorola SPI */ /** CNcomment: Motorola SPI*/
    HI_UNF_SPI_FRF_TI	= 1,		/**< TI SPI */ /** CNcomment: TI SPI */
    HI_UNF_SPI_FRF_NM	= 2,		/**< National Microwire */ /** CNcomment: National Microwire */
    HI_UNF_SPI_FRF_BUTT = 3
}HI_UNF_SPI_FRF_E;

/** SPI Data byte order */
/** CNcomment: ���ݴ�С�˶��� */
typedef enum hiUNF_SPI_BIGEND_E
{
	HI_UNF_SPI_BIGEND_LITTLE,	/**< little endian */ /** CNcomment: С��*/
	HI_UNF_SPI_BIGEND_BIG			/**< big endian */ /** CNcomment: ���*/
}HI_UNF_SPI_BIGEND_E;

/** SPI addition attribute about Motorola SPI */
/** CNcomment: Motorola SPI Э��ר������ */

typedef struct hiUNF_SPI_ATTR_MOTO_S
{
	HI_UNF_SPI_SPO_E enSpo;	/**< only effactive when enCs is HI_UNF_SPI_FRF_MOTO */ /** CNcomment: ����motorolaЭ����Ч*/
	HI_UNF_SPI_SPH_E enSph; /**< only effactive when enCs is HI_UNF_SPI_FRF_MOTO */ /** CNcomment: ����motorolaЭ����Ч*/
}HI_UNF_SPI_ATTR_MOTO_S;

/** SPI additional attribute about National Microwire SPI */
/** CNcomment: National Microwire SPI Э��ר������ */
typedef struct hiUNF_SPI_ATTR_NM_S
{
	HI_BOOL	bWaitEn;		/**< wait enable. */  /** CNcomment: �ȴ�ʹ��*/
	HI_U32 u32Waitval;	/**< wait time value. */	/** CNcomment: �ȴ�ʱ��*/
}HI_UNF_SPI_ATTR_NM_S;

/** SPI additional attribute union */
/** CNcomment: Motorola SPI/NM Э��ר������ */
typedef union
{
	HI_UNF_SPI_ATTR_MOTO_S stMoto;
	HI_UNF_SPI_ATTR_NM_S stNm;
}HI_UNF_SPI_ATTR_EXT_U;

/** The SPI attribute*/
/** CNcomment: SPI����ģʽ����*/
typedef struct hiUNF_SPI_ATTR_S
{
	HI_UNF_SPI_DEV_E enDev;	/**< chip select */  /** CNcomment: ָ���豸*/
	HI_UNF_SPI_CFGCS_E csCfg; /**< cs select */  /** CNcomment: ѡ��Ƭѡ����*/
	HI_U32	u32Baud;  /**< baud rate */  /** CNcomment: ������*/
	HI_UNF_SPI_FRF_E enFrf;	/**< frame format */  /** CNcomment: ֡ģʽ*/
	HI_U32 u32Dss;	/**< number of bits per transfer, 4-15bit, value of u32Dss : [4, 15]. */  /** CNcomment: ���÷�Χ4-15*/
	HI_UNF_SPI_BIGEND_E enBigend;	/**< byte order */  /** CNcomment: ��С��*/
	HI_UNF_SPI_ATTR_EXT_U unExtAttr; /**< addition attr when frf is moto or nm. */	/** CNcomment: ģʽΪMOTO����NMʱʹ��*/

}HI_UNF_SPI_ATTR_S;


/** @}*/  /** <!-- ==== Structure Definition End ====*/


/******************************* API Declaration *****************************/
/** \addtogroup	     SPI*/
/** @{*/  /** <!-- -SPI=*/

/**
 \brief Init the SPI device.
CNcomment:\brief ��ʼ��SPI��the Inter-Integrated Circuit���豸��CNend

 \param N/A								  CNcomment:�ޡ�CNend
 \retval 0 Success							  CNcomment:�ɹ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SPI_Init(HI_VOID);

/**
 \brief	 DeInit the SPI device.
CNcomment:\brief ȥ��ʼ��SPI�豸��CNend

 \param N/A							   CNcomment:�ޡ�CNend
 \retval 0 Success						   CNcomment: �ɹ���CNend
 \see \n
N/A
 */
HI_S32 HI_UNF_SPI_DeInit(HI_VOID);



/**
 \brief Open the SPI device.
CNcomment:\brief ��ָ��SPI�豸��CNend

  \attention \n
 Hi3719MV100/ Hi3718MV100 has SPI0 only.\n
 CNcomment: Hi3719MV100/ Hi3718MV100 ֻ��SPI0\n CNend

 \param[in] enDev  select device		  CNcomment:ָ���豸��CNend

 \retval 0 Success							  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SPI_OPEN_ERR	Opne Spi Error.		   CNcomment:SPI�豸��ʧ�ܡ�CNend
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_Open(HI_UNF_SPI_DEV_E enDev);


/**
 \brief Close the SPI device.
CNcomment:\brief �ر�ָ��SPI�豸��CNend

 \param[in] enDev  select device		  CNcomment:ָ���豸��CNend

 \retval 0 Success							  CNcomment:�ɹ���CNend
 \retval ::HI_ERR_SPI_CLOSE_ERR	 Close Spi Error.		   CNcomment:SPI�豸�ر�ʧ�ܡ�CNend
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_Close(HI_UNF_SPI_DEV_E enDev);

/**
 \brief	 Set the SPI working mode.
CNcomment:\����SPI������ʽ��CNend

 \param[in] enDev  select device		  CNcomment:ָ���豸��CNend
 \param[in] stAttr  The attribute of the SPI . CNcomment:SPI�����ԡ�CNend

 \retval 0 Success						   CNcomment: �ɹ���CNend
 \retval ::
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_SetAttr(HI_UNF_SPI_DEV_E enDev, HI_UNF_SPI_ATTR_S *stAttr);

/**
 \brief	 Get the SPI working mode.
CNcomment:\��ȡSPI������ʽ������ԡ�CNend

 \param[in] enDev  select device	  CNcomment:ָ���豸��CNend
 \param[out] stAttr  The attribute of the SPI . CNcomment:SPI�����ԡ�CNend

 \retval 0 Success						   CNcomment: �ɹ���CNend
 \retval ::
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_GetAttr(HI_UNF_SPI_DEV_E enDev, HI_UNF_SPI_ATTR_S *stAttr);

/**
 \brief Trans data by using the SPI.
CNcomment:\brief SPI���ݴ��䡣CNend

 \attention \n
N/A
 \param[in] enDev  select device	  CNcomment:ָ���豸��CNend
 \param[in] pu8Send  Buffer for storing the data to be written	     CNcomment:��Ŵ�д�����ݡ�CNend
 \param[in] u32SendCnt	Length of the data to be written	CNcomment:��д���ݵĳ��ȡ�CNend
 \param[in] pu8Read  Buffer for storing the data to be read . CNcomment:��Ž������ݡ�CNend
 \param[in] u32ReadCnt	Length of the data to be read					 CNcomment:Ҫ��ȡ�����ݳ��ȡ�CNend
 \retval 0 Success									CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Read data failed						CNcomment:ʧ�ܡ�CNend
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_ReadExt(HI_UNF_SPI_DEV_E enDev, HI_U8 *pu8Send, HI_U32 u32SendCnt, HI_U8 *pu8Read, HI_U32 u32ReadCnt);

/**
 \brief Reads data by using the SPI.
CNcomment:\brief SPI���ݽ��ա�CNend

 \attention \n
N/A
 \param[in] enDev  select device	  CNcomment:ָ���豸��CNend
 \param[out] pu8Read  Buffer for storing the data to be read . CNcomment:��Ž������ݡ�CNend
 \param[in] u32ReadCnt	Length of the data to be read					 CNcomment:Ҫ��ȡ�����ݳ��ȡ�CNend

 \retval 0 Success									CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Read data failed						CNcomment:ʧ�ܡ�CNend
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_Read(HI_UNF_SPI_DEV_E enDev, HI_U8 *pu8Read, HI_U32 u32ReadCnt);

/**
 \brief Reads data by using the SPI.
CNcomment:\brief SPI���ݷ��͡�CNend

 \attention \n
N/A
 \param[in] enDev  select device	  CNcomment:ָ���豸��CNend
 \param[in] pu8Send  Buffer for storing the data to be written	     CNcomment:��Ŵ�д�����ݡ�CNend
 \param[in] u32SendCnt	Length of the data to be written	CNcomment:��д���ݵĳ��ȡ�CNend

 \retval 0 Success									CNcomment:�ɹ���CNend
 \retval ::HI_FAILURE	Read data failed						CNcomment:ʧ�ܡ�CNend
 \see \n
N/A
 */

HI_S32 HI_UNF_SPI_Write(HI_UNF_SPI_DEV_E enDev, HI_U8 *pu8Send, HI_U32 u32SendCnt);

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */


#endif
