/******************************************************************************
  Copyright (C), 2001-2015, Hisilicon Tech. Co., Ltd.
 ******************************************************************************
  File Name	: drv_vdp_hdr_com.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2015-09-23
  Description	: this file keeps win and disp shared structures and functions.
  History	:
  1.Date	: 2015-09-23
    Author	: q00293180
    Modification: Created file
*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

//common structure and functions for window and display.

#ifndef __DRV_VDP_HDR_COM_H__
#define __DRV_VDP_HDR_COM_H__

#include "hi_type.h"
#include "hi_drv_video.h"
#include "hi_drv_win.h"



#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/****************************************************************************
Structures
*****************************************************************************/
typedef struct tagWINDOW_DOLBY_REFERENCE_INFO_S
{
    HI_U32			u32HdrWinHandle;
    HI_BOOL			bHDRPathClose;	      /* �Ƿ�ر�HDRͨ·����ʾ��� */
    HI_U32			u32HDDispWinNum;      /* ��ǰ����ʵ�崰�ڵĸ��� */
    HI_DRV_VIDEO_FRAME_S	*pCurrentFrame;	    /* ��ǰ�ж����õ�֡ */
    HI_DRV_VIDEO_FRAME_S	*pNextFrame;	    /* ��һ�ж����õ�֡ */
    HI_RECT_S			stWinOutRect;
    HI_BOOL			bHdrWinStatus;	    /* dolby mode win status */
}WINDOW_DOLBY_REFERENCE_INFO_S;




/****************************************************************************
Functions
*****************************************************************************/
#ifdef VDP_DOLBY_HDR_SUPPORT
HI_VOID ResetWinDoviRefInfo(HI_VOID);
HI_VOID ClearWinDoviRefInfo(HI_DRV_WINDOW_MODE_E eHdrMode);
HI_VOID SetHdrWinHandle(HI_U32 u32WinIndex);
HI_VOID GetHdrWinHandle(HI_U32 *pu32WinHandle);
HI_VOID SetHdrWinStatus(HI_BOOL bEnable);

HI_VOID SetHDRPathStatus(HI_BOOL bEnable);
HI_VOID GetHDRPathStatus(HI_BOOL *pbEnable);


HI_VOID UpdateHDWinNum(HI_U32  u32HDWinNum);


HI_VOID SetWinDoviRefInfo(HI_U32	      u32HDWinNum,
			 HI_DRV_VIDEO_FRAME_S *pstCurrentFrm,
			 HI_DRV_VIDEO_FRAME_S *pstNextFrm,
			 HI_RECT_S	      stOutRect);

//this function will get the global variable stWinDoviRefInfo in window , it will be called by DISP.
HI_VOID GetWinDoviRefInfo(WINDOW_DOLBY_REFERENCE_INFO_S *pstWinDoviRefInfo);

#else
#define ResetWinDoviRefInfo()
#define ClearWinDoviRefInfo(a)
#define SetHdrWinHandle(a)
#define GetHdrWinHandle(a)
#define SetHdrWinStatus(a)
#define SetHDRPathStatus(a)
#define GetHDRPathStatus(a)
#define UpdateHDWinNum(a)
#define SetWinDoviRefInfo(a,b,c,d)
#define GetWinDoviRefInfo(a)
#endif


#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /*  __DRV_VDP_HDR_COM_H__  */
