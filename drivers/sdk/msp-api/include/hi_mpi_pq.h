/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name	: hi_mpi_pq.h
  Version	: Initial Draft
  Author	: p00203646
  Created	: 2014/04/01
  Description	:

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_MPI_PQ_H__
#define __HI_MPI_PQ_H__

#include "hi_type.h"
#include "hi_unf_pq.h"
#include "hi_drv_pq.h"
#include "hi_mpi_disp.h"



#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define MPI_PQ_CHECK_NULL_PTR(ptr) \
    do{\
	if (HI_NULL == ptr){\
	    HI_ERR_PQ("ptr is NULL!\n");\
	    return HI_ERR_PQ_NULL_PTR;\
	}\
    }while(0)


/*ACM table�ṹ*/
typedef struct hiMPI_COLOR_PARAM_S
{
    HI_U16 u16Stretch;
    HI_U16 u16ClipRange;
    HI_U16 u16HueGain;	       /*��ʾ��Hue�����棬��Χ0-1023*/
    HI_U16 u16SatGain;	       /*��ʾ��Saturation������*/
    HI_U16 u16LumaGain;	       /*��ʾ��Luma������*/
    HI_U16 u16CbCrThre;	       /*CbCr������ֵ������������ֵ�Ͳ���Color����*/
    HI_S16 as16Luma[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM]; /*Luma���ұ�*/
    HI_S16 as16Hue[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];  /*Hue���ұ�*/
    HI_S16 as16Sat[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];  /*Saturation���ұ�*/

} MPI_COLOR_PARAM_S;

/*ACM ���ߴ洢�ṹ*/
typedef struct hiMPI_ACM_PARAM_S
{
    HI_S16 as16Luma[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM]; /*Luma���ұ�*/
    HI_S16 as16Hue[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];  /*Hue���ұ�*/
    HI_S16 as16Sat[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];  /*Saturation���ұ�*/
} MPI_ACM_PARAM_S;


typedef enum hiMPI_PQ_IMAGE_TYPE_E
{
    HI_MPI_PQ_IMAGE_GRAPH = 0,		/**<graph image */
    HI_MPI_PQ_IMAGE_VIDEO,		/**<video image */
    HI_MPI_PQ_IMAGE_BUTT
} HI_MPI_PQ_IMAGE_TYPE_E;

/**
 \PQ��ʼ��
 \attention \n

 \param[in] pszPath:PQ�����ļ�·��
 \param[out]

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_Init(HI_CHAR* pszPath);

/**
 \PQȥ��ʼ��
 \attention \n

 \param[in]
 \param[out]

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_DeInit(HI_VOID);

/**
 \brief ��ȡ����
 \attention \n
��

 \param[in] pu32Brightness������ֵ,��Ч��Χ: 0~255;
 \param[out]

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetBrightness(HI_DRV_DISPLAY_E enChan, HI_U32* pu32Brightness);

/**
 \brief ��������
 \attention \n
��

 \param[in] u32Brightness������ֵ,��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetBrightness(HI_DRV_DISPLAY_E enChan, HI_U32 u32Brightness);

/**
 \brief ��ȡ�Աȶ�
 \attention \n
��

 \param[in]
 \param[out] pu32Contrast���Աȶ�, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetContrast(HI_DRV_DISPLAY_E enChan, HI_U32* pu32Contrast);

/**
 \brief ���öԱȶ�
 \attention \n
��

 \param[in] u32Contrast���Աȶ�, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetContrast(HI_DRV_DISPLAY_E enChan, HI_U32 u32Contrast);

/**
 \brief ��ȡɫ��
 \attention \n
��

 \param[in]
 \param[out] pu32Hue��ɫ��, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetHue(HI_DRV_DISPLAY_E enChan, HI_U32* pu32Hue);

/**
 \brief ����ɫ��
 \attention \n
��

 \param[in] u32Hue��ɫ��, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetHue(HI_DRV_DISPLAY_E enChan, HI_U32 u32Hue);

/**
 \brief ��ȡ���Ͷ�
 \attention \n
��

 \param[out] pu32Saturation�����Ͷ�, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetSaturation(HI_DRV_DISPLAY_E enChan, HI_U32* pu32Saturation);

/**
 \brief ���ñ��Ͷ�
 \attention \n
��

 \param[in] u32Saturation�����Ͷ�,��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSaturation(HI_DRV_DISPLAY_E enChan, HI_U32 u32Saturation);

/**
 \brief ��ȡ����ǿ��
 \attention \n
��

 \param[out] pu32TNRLevel: ����ȼ�, ��Ч��Χ: 0~255


 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetTNR(HI_U32* pu32TNRLevel);
HI_S32 HI_MPI_PQ_GetSNR(HI_U32* pu32SNRLevel);

/**
 \brief ���ý���ǿ��
 \attention \n
��

 \param[in] u32TNRLevel: ����ȼ�, ��Ч��Χ: 0~255

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNR(HI_U32 u32TNRLevel);
HI_S32 HI_MPI_PQ_SetSNR(HI_U32 u32SNRLevel);


/**
 \brief ��ȡSR��ʾ����
 \attention \n
��

 \param[out] *penType


 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetSRMode(HI_PQ_SR_DEMO_E* penType);

/**
 \brief ����SR��ʾ����
 \attention \n
��

 \param[in] enType

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSRMode(HI_PQ_SR_DEMO_E enType);

/**
 \brief ��ȡ������
 \attention \n
��

 \param[out] pu32Sharpness��������, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetSharpness(HI_U32* pu32Sharpness);

/**
 \brief ����������
 \attention \n
��

 \param[in] u32Sharpness��������, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSharpness(HI_U32 u32Sharpness);

/**
 \brief ��ȡ�齵��De-blockingǿ��
 \attention \n
��

 \param[out] pu32DBlevel������ȼ�, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetDeBlocking(HI_U32* pu32DBlevel);

/**
 \brief ���ÿ齵��De-blockingǿ��
 \attention \n
��

 \param[in] u32DBlevel:����ȼ�, ��Ч��Χ: 0~255;

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetDeBlocking(HI_U32 u32DBlevel);

HI_S32 HI_MPI_PQ_SetDeMosquito(HI_U32 u32DMlevel);

HI_S32 HI_MPI_PQ_GetDeMosquito(HI_U32* pu32DMlevel);


/**
 \brief ��ȡ��ɫ��ǿ
 \attention \n
��

 \param[out] pu32ColorGainLevel

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetColorGain(HI_U32* pu32ColorGainLevel);

/**
 \brief ������ɫ��ǿ
 \attention \n
��

 \param[in] enColorGainLevel

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetColorGain(HI_U32 u32ColorGainLevel);

/**
 \brief ��ȡ��ɫ��ǿ
 \attention \n
  ��

 \param[out] penFleshToneLevel

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetFleshTone(HI_UNF_PQ_FLESHTONE_E* penFleshToneLevel);

/**
 \brief ������ɫ��ǿ����
 \attention \n
  ��

 \param[in] enSixBaseColor

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E enColorMode);

/**
 \brief ��ȡ��ɫ��ǿ����
 \attention \n
  ��

 \param[in] enSixBaseColor

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetColorEnhanceMode(HI_UNF_PQ_COLOR_SPEC_MODE_E* penColorMode);


/**
 \brief ���÷�ɫ��ǿ
 \attention \n
  ��

 \param[in] enFleshToneLevel���ο�HI_COLOR_GAIN_E

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetFleshTone( HI_UNF_PQ_FLESHTONE_E enFleshToneLevel);

/**
 \brief ��ȡ����ɫ����
 \attention \n
  ��

 \param[out] pstSixBaseColor

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetSixBaseColor(HI_UNF_PQ_SIX_BASE_S* pstSixBaseColor);

/**
 \brief ��������ɫ����
 \attention \n
  ��

 \param[in] stSixBaseColor

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSixBaseColor(HI_PQ_SIX_BASE_COLOR_S* pstSixBaseColor);

/**
 \brief ����PQģ�鿪��
 \attention \n
  ��

 \param[in] enFlags
 \param[in] u32OnOff

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetPQModule( HI_UNF_PQ_MODULE_E enFlags, HI_U32 u32OnOff);

/**
 \brief ��ȡPQģ�鿪��
 \attention \n
  ��

 \param[in] enFlags
 \param[in] pu32OnOff

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetPQModule( HI_UNF_PQ_MODULE_E enFlags, HI_U32* pu32OnOff);

/**
 \brief ��������ģʽ����
 \attention \n
��

 \param[in] enFlags
 \param[in] u32OnOff

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetDemo( HI_UNF_PQ_DEMO_E enFlags, HI_U32 u32OnOff);

/**
 \brief ��������ģʽ��ʾ��ʽ
 \attention \n
��

 \param[in] enChan
 \param[in] enMode

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetDemoMode( HI_DRV_DISPLAY_E enChan, HI_PQ_DEMO_MODE_E enMode);

/**
 \brief ��ȡ����ģʽ��ʾ��ʽ
 \attention \n
��

 \param[in] enChan
 \param[in] penMode

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetDemoMode( HI_DRV_DISPLAY_E enChan, HI_PQ_DEMO_MODE_E* penMode);



/**
 \brief ����PQ�Ĵ���
 \attention \n
��

 \param[in] u32RegAddr
 \param[in] u32Data

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_WritePQRegister(HI_U32 u32RegAddr, HI_U32 u32Data);

/**
 \brief ��ȡPQ�Ĵ���
 \attention \n
��

 \param[in] u32RegAddr
 \param[in] *pu32Value

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_ReadPQRegister(HI_U32 u32RegAddr, HI_U32* pu32Value);

/**
 \brief ��ȡACM����
 \attention \n
  ��

 \param[in] *pstGammaTable

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetAcmTable( MPI_ACM_PARAM_S* pstColorTable);

/**
 \brief ����ACM����
 \attention \n
  ��

 \param[in] *pstGammaTable

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetAcmTable(HI_U32 u32RegAddr, MPI_ACM_PARAM_S* pstColorTable);

/**
 \brief ��ȡDCI����
 \attention \n
  ��

 \param[in] *pstDCITable

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetDciTable( HI_PQ_DCI_WGT_S* pstDCITable);

/**
 \brief ����DCI����
 \attention \n
  ��

 \param[in] *pstDCITable

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetDciTable( HI_PQ_DCI_WGT_S* pstDCITable);

/**
 \brief ��ȡDCIֱ��ͼ
 \attention \n
  ��

 \param[in] *pstDCIHistgram

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_GetHistgram( HI_PQ_DCI_HISTGRAM_S* pstDCIHistgram);

/**
 \brief ��ȡTNR������PixMean-to-Ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRLumaPixMean2Ratio( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR������PixMean-to-Ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRLumaPixMean2Ratio( HI_PQ_TNR_S* pstTnrData);


/**
 \brief ��ȡTNR��ɫ��PixMean-to-Ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRChromPixMean2Ratio( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR��ɫ��PixMean-to-Ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRChromPixMean2Ratio( HI_PQ_TNR_S* pstTnrData);


/**
 \brief ��ȡTNR������MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRLumaMotionMapping( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR������MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRLumaMotionMapping( HI_PQ_TNR_S* pstTnrData);


/**
 \brief ��ȡTNR��ɫ��MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRChromMotionMapping( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR��ɫ��MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRChromMotionMapping( HI_PQ_TNR_S* pstTnrData);


/**
 \brief ��ȡTNR������FINAL MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRLumaFinalMotionMapping( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR������FINAL MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRLumaFinalMotionMapping( HI_PQ_TNR_S* pstTnrData);


/**
 \brief ��ȡTNR��ɫ��FINAL MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetTNRChromFinalMotionMapping( HI_PQ_TNR_S* pstTnrData);

/**
 \brief ����TNR��ɫ��FINAL MotionMapping����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetTNRChromFinalMotionMapping( HI_PQ_TNR_S* pstTnrData);

HI_S32 HI_MPI_PQ_GetTNRFMotionMapping(HI_PQ_TNR_FMOTION_S* pstTnrFMotion);

HI_S32 HI_MPI_PQ_SetTNRFMotionMapping(HI_PQ_TNR_FMOTION_S* pstTnrFMotion);


/**
 \brief ��ȡSNR��pixmean-ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetSNRPixmean2Ratio( HI_PQ_SNR_PIXMEAN_2_RATIO_S* pstSnrData);

/**
 \brief ����SNR��pixmean-ratio����
 \attention \n
  ��

 \param[in] *pstTnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSNRPixmean2Ratio( HI_PQ_SNR_PIXMEAN_2_RATIO_S* pstSnrData);

/**
 \brief ��ȡSNR��pixdiff-edgestr����
 \attention \n
  ��

 \param[in] *pstSnrData

 \retval ::HI_SUCCESS

 */
HI_S32 HI_MPI_PQ_GetSNRPixdiff2Edgestr( HI_PQ_SNR_PIXDIFF_2_EDGESTR_S* pstSnrData);

/**
 \brief ����SNR��pixdiff-edgestr����
 \attention \n
  ��

 \param[in] *pstSnrData

 \retval ::HI_SUCCESS

 */

HI_S32 HI_MPI_PQ_SetSNRPixdiff2Edgestr( HI_PQ_SNR_PIXDIFF_2_EDGESTR_S* pstSnrData);
HI_S32 HI_MPI_PQ_GetDciLevel(HI_U32* pu32DCIlevel);
HI_S32 HI_MPI_PQ_SetDciLevel( HI_U32 u32DCIlevel);
HI_S32 HI_MPI_PQ_SetBasicImageParam(HI_MPI_PQ_IMAGE_TYPE_E enType, HI_DRV_DISPLAY_E enChan, HI_PQ_IMAGE_PARAM_S stParam);
HI_S32 HI_MPI_PQ_GetBasicImageParam(HI_MPI_PQ_IMAGE_TYPE_E enType, HI_DRV_DISPLAY_E enChan, HI_PQ_IMAGE_PARAM_S* pstParam);
HI_S32 HI_MPI_PQ_SetDefaultParam(HI_BOOL bDefault);
HI_S32 HI_MPI_PQ_GetDemoCoordinate(HI_U32* pu32X);
HI_S32 HI_MPI_PQ_SetDemoCoordinate(HI_U32 u32X);
HI_S32 HI_MPI_PQ_GetHdrSaturation(HI_U32* pu32Saturation);
HI_S32 HI_MPI_PQ_SetHdrSaturation(HI_U32 u32Saturation);
HI_S32 HI_MPI_PQ_SetImageMode(HI_UNF_PQ_IMAGE_MODE_E enImageMode);
HI_S32 HI_MPI_PQ_GetImageMode(HI_UNF_PQ_IMAGE_MODE_E *penImageMode);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* End of #ifndef __HI_MPI_PQ_H__ */
