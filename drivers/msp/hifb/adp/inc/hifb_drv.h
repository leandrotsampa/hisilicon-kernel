/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : hifb_drv.h
Version		    : Initial Draft
Author		    :
Created		    : 2014/09/09
Description	    :
Function List	    :
History		    :
Date			   Author		    Modification
2014/09/09		   y00181162		    Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HIFB_DRV_H__
#define __HIFB_DRV_H__

/*********************************add include here******************************/
#include <linux/fb.h>

#include "hi_tde_type.h"
#include "hifb.h"
#include "drv_hifb_common.h"
#include "drv_hifb_hal.h"

/*************************** Structure Definition ****************************/
/*mask bit*/
typedef enum
{
    HIFB_LAYER_PARAMODIFY_FMT	      = 0x1,
    HIFB_LAYER_PARAMODIFY_STRIDE      = 0x2,
    HIFB_LAYER_PARAMODIFY_ALPHA	      = 0x4,
    HIFB_LAYER_PARAMODIFY_COLORKEY    = 0x8,
    HIFB_LAYER_PARAMODIFY_INRECT      = 0x10,
    HIFB_LAYER_PARAMODIFY_OUTRECT     = 0x20,
    HIFB_LAYER_PARAMODIFY_DISPLAYADDR = 0x40,
    HIFB_LAYER_PARAMODIFY_SHOW	      = 0x80,
    HIFB_LAYER_PARAMODIFY_BMUL	      = 0x100,
    HIFB_LAYER_PARAMODIFY_ANTIFLICKERLEVEL = 0x200,
    HIFB_LAYER_PARAMODIFY_FENCE	  = 0x400,
    HIFB_LAYER_PARAMODIFY_REFRESH = 0x800,
    HIFB_LAYER_PARAMODIFY_ALL	  = 0x1 | 0x2 | 0x4 | 0x8 | 0x10 | 0x20 | 0x40 | 0x80 | 0x100 | 0x200 | 0x400 | 0x800,
    HIFB_LAYER_PARAMODIFY_BUTT
}HIFB_LAYER_PARAMODIFY_MASKBIT_E;

typedef struct
{
     /* support how many layers*/
    /*CNcomment:����֧�ֵ�ͼ���� */
    //HI_U32 HIFB_DRV_GetSupportLayerCount();

    /*set layer the default bit extenal mode*/
    /*CNcomment:����Ĭ�ϵ���չbit ģʽ*/
    //HI_S32 (*HIFB_DRV_SetLayerBitExtMode)(HIFB_LAYER_ID_E enLayerID);

    /*enable/disable the layer*/
    /*CNcomment:ʹ��ͼ��*/
    HI_S32 (*HIFB_DRV_EnableLayer)(HIFB_LAYER_ID_E enLayerId,HI_BOOL bEnable);

    /*set the address of layer*/
    /*CNcomment:����ͼ�����ʾ��ַ*/
    HI_S32 (*HIFB_DRV_SetLayerAddr)(HIFB_LAYER_ID_E enLayerId,HI_U32 u32Addr);

    /*get the address of layer*/
    /*CNcomment:��ȡͼ�����ʾ��ַ*/
    HI_S32 (*HIFB_DRV_GetLayerAddr)(HIFB_LAYER_ID_E enLayerId,HI_U32 *pu32Addr);

    /*set layer stride*/
    /*CNcomment:����ͼ���м��*/
    HI_S32 (*HIFB_DRV_SetLayerStride)(HIFB_LAYER_ID_E enLayerId,HI_U32 u32Stride);

    /*set layer pixel format*/
    /*CNcomment:����ͼ�����ظ�ʽ*/
    HI_S32 (*HIFB_DRV_SetLayerDataFmt)(HIFB_LAYER_ID_E enLayerId,HIFB_COLOR_FMT_E enDataFmt);

    /*set color register*/
    /*CNcomment:����CLUT ����ֵ*/
    HI_S32 (*HIFB_DRV_SetColorReg)(HIFB_LAYER_ID_E enLayerId, HI_U32 u32OffSet, HI_U32 u32Color, HI_S32 UpFlag);

    /*wait until vblank, it's a block interface*/
    /*CNcomment:�ȴ���ֱʱ���жϣ������ͽӿ�*/
    HI_S32 (*HIFB_DRV_WaitVBlank)(HIFB_LAYER_ID_E enLayerId);

    /* set layer deflicker */
    /*CNcomment:����ͼ�㿹������*/
    HI_S32 (*HIFB_DRV_SetLayerDeFlicker)(HIFB_LAYER_ID_E enLayerId, HIFB_DEFLICKER_S *pstDeFlicker);

    /*set layer alpha*/
    /*CNcomment:����ͼ��alpha*/
    HI_S32 (*HIFB_DRV_SetLayerAlpha)(HIFB_LAYER_ID_E enLayerId, HIFB_ALPHA_S *pstAlpha);

    /*get gp global alpha zero sum*/
    /*CNcomment:��ȡGPȫ��alphaֵΪ0�����ص���� */
    HI_S32 (*HIFB_DRV_GetGPGalphaSum)(HIFB_LAYER_ID_E enLayerId, HI_U32 *pu32GalphaSum);

    /*set layer start position and size*/
    /*CNcomment:����ͼ����ʼλ�úʹ�С*/
    HI_S32 (*HIFB_DRV_SetLayerRect)(HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstInputRect, const HIFB_RECT *pstOutputRect);

    /*set layer start position and size*/
    /*CNcomment:����ͼ����ʼλ�úʹ�С*/
    HI_S32 (*HIFB_DRV_SetLayerInRect)(HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstInputRect);

    /*set layer output size*/
    /*CNcomment:����ͼ����������*/
    HI_S32 (*HIFB_DRV_SetLayerOutRect)(HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstOutputRect);


    /* set layer colorkey */
    /* CNcomment:����ͼ��colorkey*/
    HI_S32 (*HIFB_DRV_SetLayerKeyMask)(HIFB_LAYER_ID_E enLayerId, const HIFB_COLORKEYEX_S* pstColorkey);

    /* update layer register */
    /*CNcomment:�Ĵ�������*/
    HI_S32 (*HIFB_DRV_UpdataLayerReg)(HIFB_LAYER_ID_E enLayerId);

    /*wait for the config register completed*/
    /*CNcomment:�ȴ��Ĵ����������*/
    HI_S32 (*HIFB_DRV_WaitRegUpdateFinished)(HIFB_LAYER_ID_E enLayerId);

    /*set premul data*/
    /*CNcomment:����Ԥ��*/
    HI_S32 (*HIFB_DRV_SetLayerPreMult)(HIFB_LAYER_ID_E enLayerId, HI_BOOL bPreMul);

    HI_VOID (*HIFB_DRV_GetClosePreMultState)(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbShouldClosePreMult);

    HI_VOID (*HIFB_DRV_WhetherDiscardFrame)(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pNoDiscardFrame);

    HI_VOID (*HIFB_DRV_GetOSDData) (HIFB_LAYER_ID_E enLayerId, HIFB_OSD_DATA_S	*pstLayerData);
    HI_VOID (*DRV_HIFB_OSI_GetLogoData)(HIFB_LAYER_ID_E enLayerId, HIFB_LOGO_DATA_S *pstLogoData);

    /* register call back function*/
    /*CNcomment:ע���жϻص�����*/
    HI_S32 (*HIFB_DRV_SetIntCallback)(HIFB_CALLBACK_TPYE_E enCType, IntCallBack pCallback, HIFB_LAYER_ID_E enLayerId);

    /*open layer*/
    /*CNcomment:��ͼ��*/
    HI_S32 (*HIFB_DRV_OpenLayer)(HIFB_LAYER_ID_E enLayerId);

    /*close layer*/
    /*CNcomment:�ر�ͼ��*/
    HI_S32 (*HIFB_DRV_CloseLayer)(HIFB_LAYER_ID_E enLayerId);

    /*get status of disp*/
    /*CNcomment:��ȡDISP ��״̬*/
    HI_S32 (*HIFB_DRV_GetHaltDispStatus)(HIFB_LAYER_ID_E enLayerId,HI_BOOL *pbDispInit);

    /*set 3D mode*/
    /*CNcomment:����3D ģʽ*/
    HI_S32 (*HIFB_DRV_SetTriDimMode)(HIFB_LAYER_ID_E enLayerId, HIFB_STEREO_MODE_E enStereoMode, HIFB_STEREO_MODE_E enWbcSteroMode);

    /*set 3D address*/
    /*CNcomment:����3D ���ݵ�ַ*/
    HI_S32 (*HIFB_DRV_SetTriDimAddr)(HIFB_LAYER_ID_E enLayerId, HI_U32 u32StereoAddr);

    /*get capability of gfx*/
    /*CNcomment:��ȡͼ��������*/
    HI_VOID (*HIFB_DRV_GetGFXCap)(const HIFB_CAPABILITY_S **pstCap);

    /*pause compression*/
    /*CNcomment:��ͣѹ��*/
    HI_S32 (*HIFB_DRV_PauseCompression)(HIFB_LAYER_ID_E enLayerId);

    /*resume compression*/
    /*CNcomment:�ָ�ѹ��*/
    HI_S32 (*HIFB_DRV_ResumeCompression)(HIFB_LAYER_ID_E enLayerId);

    /*set the priority of layer in gp*/
    /*CNcomment:����ͼ����GP �е����ȼ�*/
    HI_S32 (*HIFB_DRV_SetLayerPriority)(HIFB_LAYER_ID_E enLayerId, HIFB_ZORDER_E enZOrder);

    /*get the priority of layer in gp*/
    /*CNcomment:��ȡͼ����GP �е����ȼ�*/
    HI_S32 (*HIFB_DRV_GetLayerPriority)(HIFB_LAYER_ID_E enLayerId, HI_U32 *pU32Priority);

    /*mask layer,  prevent user to operating the layer in  the period of display format changing*/
    /*CNcomment:����ͼ�㣬��ֹ�û���ͼ���Ӳ�����ò���*/
    HI_S32 (*HIFB_DRV_MaskLayer)(HIFB_LAYER_ID_E enLayerId, HI_BOOL bFlag);

    HI_S32 (*HIFB_DRV_ColorConvert)(const struct fb_var_screeninfo *pstVar, HIFB_COLORKEYEX_S *pCkey);

    HI_S32 (*HIFB_DRV_GfxInit)(HI_VOID);
    HI_S32 (*HIFB_DRV_GfxDeInit)(HI_VOID);

    HI_S32 (*HIFB_DRV_GetLayerOutRect)(HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    HI_S32 (*HIFB_DRV_GetLayerInRect)(HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    /*set layer screen size*/
    /*CNcomment:����ͼ����������*/
    HI_S32 (*HIFB_DRV_SetLayerScreenSize)(HIFB_LAYER_ID_E enLayerId, HI_U32 u32Width, HI_U32 u32Height);
    /*set gfx mask flag*/
    /*CNcomment:����ͼ�����α�־*/
    HI_S32 (*HIFB_DRV_SetLayerMaskFlag)(HIFB_LAYER_ID_E enLayerId, HI_BOOL bFlag);
    /*Get gfx mask flag*/
    /*CNcomment:��ȡͼ�����α�־*/
    HI_S32 (*HIFB_DRV_GetLayerMaskFlag)(HIFB_LAYER_ID_E enLayerId);

    HI_S32 (*HIFB_DRV_GetDispSize)(HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    HI_S32 (*HIFB_DRV_ClearLogo)(HIFB_LAYER_ID_E enLayerId);
    HI_S32 (*HIFB_DRV_SetStereoDepth)(HIFB_LAYER_ID_E enLayerId, HI_S32 s32Depth);
    HI_S32 (*HIFB_DRV_SetTCFlag)(HI_BOOL bFlag);

    HI_VOID (*HIFB_DRV_GetResumeStatus) (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbResume);
    HI_VOID (*HIFB_DRV_SetDeCmpSwitch)	(HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen);
    HI_VOID (*HIFB_DRV_SetDeCmpDdrInfo) (HIFB_LAYER_ID_E enLayerId, HI_U32 ARHeadDdr,HI_U32 ARDataDdr,HI_U32 GBHeadDdr,HI_U32 GBDataDdr,HI_U32 DeCmpStride);
    HI_VOID (*HIFB_DRV_GetDeCmpStatus)	(HIFB_LAYER_ID_E enLayerId, DRV_HIFB_DECMPSTATUS_S *pstDeCmpStatus, HI_BOOL bDebug);
    HI_VOID (*HIFB_DRV_SetVdpIntMask)	(HI_U32 IntMask);
    HI_VOID (*HIFB_DRV_GetVdpIntMask)	(HI_U32 *pIntMask);

    HI_S32 (*HIFB_DRV_SetCmpSwitch)(HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen);
    /*Get compression status*/
    /*CNcomment:��ȡѹ������*/
    HI_S32 (*HIFB_DRV_GetCmpSwitch)(HIFB_LAYER_ID_E enLayerId);
    /*Set compression update rect*/
    /*CNcomment:����ѹ����������*/
    HI_S32 (*HIFB_DRV_SetCmpRect)(HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstRect);
    /*Set compression Mode*/
    /*CNcomment:����ѹ������*/
    HI_S32 (*HIFB_DRV_SetCmpMode)(HIFB_LAYER_ID_E enLayerId, HIFB_CMP_MODE_E enCMPMode);
    /* Set Scanline information */
    /* ����ɨ������Ϣ*/
    HI_VOID (*HIFB_DRV_SetInVoCallBackScanLine)(HIFB_LAYER_ID_E LayerId);
    HI_VOID (*HIFB_DRV_SetOutVoCallBackScanLine)(HIFB_LAYER_ID_E LayerId);

    HIFB_CMP_MODE_E (*HIFB_DRV_GetCmpMode)(HIFB_LAYER_ID_E enLayerId);
    HI_S32  (*HIFB_DRV_SetCmpDDROpen)	  (HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen);
    HI_S32  (*HIFB_DRV_SetGpDeflicker)	  (HI_U32 u32DispChn, HI_BOOL bDeflicker);
    HI_S32  (*HIFB_DRV_GetSlvLayerInfo)	  (HIFB_SLVLAYER_DATA_S *pstLayerInfo);
    HI_BOOL (*DRV_HIFB_GetIsGfxWorkAtWbc) (HI_VOID);
}HIFB_DRV_OPS_S;

/******************************* API declaration *****************************/
HI_VOID DRV_HIFB_GetAdpCallBackFunction(HIFB_DRV_OPS_S *Ops);

#endif /* __HIFB_DRV_H__ */
