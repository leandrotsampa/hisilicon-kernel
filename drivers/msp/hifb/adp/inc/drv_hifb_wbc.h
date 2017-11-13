/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	: drv_hifb_wbc.h
Version		: Initial Draft
Author		:
Created		: 2016/02/02
Description	:
Function List	:


History		:
Date		    Author		  Modification
2016/02/02	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_HIFB_WBC_H__
#define __DRV_HIFB_WBC_H__

/*********************************add include here******************************/
#include "drv_hifb_hal.h"
#include "drv_hifb_adp.h"
#include "optm_define.h"
#include "optm_alg_csc.h"
#include "optm_alg_gzme.h"
#include "optm_alg_gsharp.h"
#include "hi_drv_disp.h"
#include "hi_gfx_comm_k.h"

/***************************** Macro Definition ******************************/

/**
 **ʹ�õĻ�дbuffer����LOGOֻ��Ҫһ��Ϳ����ˣ���Ϊֻ��дһ��
 **/
#define OPTM_WBCBUFFER_NUM		     2

/*************************** Structure Definition ****************************/

/***************************  The enum of Jpeg image format  ******************/

typedef enum tagOPTM_WBC_MODE_E{
    OPTM_WBC_MODE_MONO	    = 0x0,
    OPTM_WBC_MODE_LFET_EYE  = 0x2,
    OPTM_WBC_MODE_RIGHT_EYE = 0x3,
    OPTM_WBC_MODE_BUTT,
}OPTM_WBC_MODE_E;

typedef struct tagOPTM_GFX_WBC_S{
    HI_BOOL		   IsOpen;
    HI_BOOL		   bWorking;
    HI_BOOL		   bStartWork;
    HI_BOOL		   bEndWork;
    OPTM_VDP_LAYER_WBC_E   enWbcHalId;
    HI_S32		   s32BufferWidth;
    HI_S32		   s32BufferHeight;
    HI_U32		   u32BufferStride;
    HI_U32		   u32BufIndex;
    HI_S32		   s32WbcCnt;
    HI_U32		   u32WBCBuffer[OPTM_WBCBUFFER_NUM];
    HI_U32		   u32WriteBufAddr;
    HI_U32		   u32ReadBufAddr;
    GFX_MMZ_BUFFER_S	   stFrameBuffer;
    HI_U32		   u32DataPoint;  /* 0, feeder; others, reserve */
    HIFB_COLOR_FMT_E	   enDataFmt;
    HIFB_RECT		   stInRect;
    HI_BOOL		   bInProgressive;
    HIFB_RECT		   stOutRect;
    HI_BOOL		   bOutProgressive;
    HI_U32		   u32BtmOffset;
    HI_BOOL		   bHdDispProgressive;
    OPTM_VDP_DITHER_E	   enDitherMode;
    OPTM_VDP_WBC_OFMT_E	   stWBCFmt;
    OPTM_VDP_DATA_RMODE_E  enReadMode;
    OPTM_VDP_DATA_RMODE_E  enOutMode;
    OPTM_WBC_MODE_E	   enWbcMode;
    OPTM_VDP_INTMSK_E	   enWbcInt;
    wait_queue_head_t	  WaiteWbcWorkqueueMutex;
}OPTM_GFX_WBC_S;


/********************** Global Variable declaration **************************/


/******************************* API declaration *****************************/


/***************************************************************************************
* func		: HIFB_WBC2_SetRegUp
* description	: CNcomment:���»�д�Ĵ��� CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_S32 HIFB_WBC2_SetRegUp(OPTM_VDP_LAYER_WBC_E enWbcID);



HI_VOID HIFB_WBC_DinitLayer (HIFB_LAYER_ID_E enLayerId);
HI_VOID HIFB_WBC_InitLayer  (HIFB_LAYER_ID_E enLayerId);

HI_VOID HIFB_WBC_StartWorkQueue(struct work_struct *data);


/***************************************************************************************
* func		: HIFB_WBC2_SetTcFlag
* description	: CNcomment: ����TC��д��� CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_SetTcFlag(HI_BOOL bFlag);

/***************************************************************************************
* func		: HIFB_WBC2_SetCropReso
* description	: CNcomment: ����WBC_GP0�ü��ֱ��ʣ�Ҳ���������ʼ�ͽ������� CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_SetCropReso(OPTM_VDP_DISP_RECT_S stInputRect);

/***************************************************************************************
* func		: HIFB_WBC2_SetPreZmeEn
* description	: CNcomment: ����ZMEʹ�� CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_SetPreZmeEn(OPTM_ALG_GZME_DRV_PARA_S *pstZmeDrvPara);



HI_VOID HIFB_WBC2_Init	(HI_VOID);
HI_VOID HIFB_WBC2_Dinit (HI_VOID);

/***************************************************************************************
* func		: HIFB_WBC2_SetEnable
* description	: CNcomment: ���û�дʹ��״̬ CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_SetEnable(HI_BOOL bEnable);

/***************************************************************************************
* func		: HIFB_WBC2_CfgSlvLayer
* description	: CNcomment: ���ñ���ͼ�� CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_S32 HIFB_WBC2_CfgSlvLayer(HIFB_LAYER_ID_E enLayerId,HI_RECT_S *pstRect);

HI_S32	HIFB_WBC_FrameEndProcess(OPTM_GFX_GP_E enGpId);
HI_S32	HIFB_WBC_Process(OPTM_GFX_GP_E enGpId);
HI_S32	HIFB_WBC_GetLayerInfo(HIFB_SLVLAYER_DATA_S *pstLayerInfo);
HI_VOID HIFB_WBC_SetWbcGpZme(HI_VOID);

/***************************************************************************************
* func		: HIFB_WBC2_Recovery
* description	: CNcomment: ��������WBC�ͻ�дͼ������ CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_Recovery(OPTM_GFX_GP_E enGPId);

/***************************************************************************************
* func		: HIFB_WBC2_Reset
* description	: CNcomment: ��д״̬��λ CNend\n
* param[in]	: HI_VOID
* retval	: NA
* others:	: NA
***************************************************************************************/
HI_VOID HIFB_WBC2_Reset(HI_BOOL bWbcRegUp);

#endif /* __HIFB_WBC_H__ */
