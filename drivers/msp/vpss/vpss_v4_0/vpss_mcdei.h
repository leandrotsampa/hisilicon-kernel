/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __VPSS_MCDEI_H__
#define __VPSS_MCDEI_H__

#include "vpss_stt_mcdei.h"
#include "vpss_wbc_mcdei.h"
#include "vpss_hal_3798cv200.h"



#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

typedef struct hiVPSS_MCDEI_INFO_S
{
    VPSS_RGME_S		 stRgmeWbcInfo;//rgme��д����
    VPSS_BLEND_S	 stBlendWbcInfo;//blend��д����
    VPSS_ST_RGME_S	 stRgmeInfo;   //rgme�˶�����
    VPSS_ST_BLKMV_S	 stBlkmvInfo;  //blkmv�˶�����
#ifdef VPSS_SUPPORT_BLKMT
    VPSS_ST_BLKMT_S	 stBlkmtInfo;  //blkmt�˶�����
#endif
#ifdef VPSS_SUPPORT_DICNT
    VPSS_ST_DICNT_S	 stDiCntInfo;
#endif

    VPSS_ST_PRJH_S	 stPrjhInfo;  //prjh�˶�����
    VPSS_ST_PRJV_S	 stPrjvInfo;  //prjv�˶�����
    HI_BOOL		 bMcEnable;   //MCDI�Ƿ�ʹ��
#ifdef VPSS_SUPPORT_ALG_MCNR
    HI_BOOL		 bMcNrEnable;
#endif
} VPSS_MCDEI_INFO_S;

HI_BOOL VPSS_INST_McDeiGetMedsEn(HI_DRV_VIDEO_FRAME_S *pstSrcImage);
HI_S32 VPSS_INST_McDeiInit(VPSS_MCDEI_INFO_S *pstMcdeiInfo, HI_DRV_VIDEO_FRAME_S *pstSrcImage);
HI_S32 VPSS_INST_McDeiDeInit(VPSS_MCDEI_INFO_S *pstMcdeiInfo);
HI_S32 VPSS_INST_McDeiComplete(VPSS_MCDEI_INFO_S *pstMcdeiInfo);
HI_S32 VPSS_INST_McDeiReset(VPSS_MCDEI_INFO_S *pstMcdeiInfo);
HI_S32 VPSS_INST_SetHalMcdeiInfo(VPSS_MCDEI_INFO_S *pstMcdeiInfo, VPSS_HAL_INFO_S *pstHalInfo,
				 HI_DRV_BUF_ADDR_E enLR, HI_DRV_VIDEO_FRAME_S *pstSrcImage);
#ifdef VPSS_SUPPORT_ALG_MCNR
HI_S32 VPSS_INST_SetHalMcNrInfo(VPSS_MCDEI_INFO_S *pstMcdeiInfo, VPSS_HAL_INFO_S *pstHalInfo,
				HI_DRV_BUF_ADDR_E enLR, HI_DRV_VIDEO_FRAME_S *pstSrcImage);
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /*__VPSS_STT_MCDEI_H__*/
