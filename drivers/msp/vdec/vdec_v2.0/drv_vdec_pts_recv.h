/**
 \file
 \brief pts recovery
 \copyright Shenzhen Hisilicon Co., Ltd.
 \version draft
 \author x57522
 \date 2011-4-21
 */

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __PTS_RECV_H__
#define __PTS_RECV_H__

/******************************* Include Files *******************************/

/* add include here */
#include "hi_type.h"
#include "hi_unf_common.h"
#include "hi_unf_avplay.h"
#include "vfmw.h"
#include "drv_vdec_private.h"

/******************************* API declaration *****************************/
HI_S32 PTSREC_Init(HI_VOID);
HI_S32 PTSREC_DeInit(HI_VOID);
HI_S32 PTSREC_Alloc(HI_HANDLE hHandle);
HI_S32 PTSREC_Free(HI_HANDLE hHandle);
HI_S32 PTSREC_Start(HI_HANDLE hHandle);
HI_S32 PTSREC_Stop(HI_HANDLE hHandle);
HI_S32 PTSREC_Reset(HI_HANDLE hHandle);
HI_S32 PTSREC_SetFrmRate(HI_HANDLE hHandle, HI_UNF_AVPLAY_FRMRATE_PARAM_S* pstFrmRate);
HI_S32 PTSREC_GetFrmRate(HI_HANDLE hHandle, HI_UNF_AVPLAY_FRMRATE_PARAM_S* pstFrmRate);
HI_U32 PTSREC_CalcStamp(HI_HANDLE hHandle, VDEC_CHANNEL_S* pstChan, IMAGE* pstImage);
HI_U32 PTSREC_GetInterPtsDelta(HI_HANDLE hHandle);

#endif /* __PTS_RECV_H__ */
