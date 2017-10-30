/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: aoe_aip.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2012/10/08
  Description	:
  History	:
  1.Date	: 2013/02/28
    Author	: zgjie
    Modification: Created file

 *******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __AOE_AIP_H__
#define __AOE_AIP_H__

#include "hi_type.h"
#include "hi_dsp_common.h"
#include "hi_dsp_util.h"
#include "hi_dsp_ringbuf.h"
#include "hi_dsp_aoe.h"
#include "hi_audsp_aoe.h"

#define AIP_PROCESS_PERIONDMS_DEFAULT 5
#define AIP_PROCESS_PERIONDMS_MAX 10
#define AIP_PROCESS_PERIONDMS_MIN 2

#define AIP_FADE_IN_MS_DEFAULT	16
#define AIP_FADE_OUT_MS_DEFAULT 8

/**Defines the	status of an AIP.*/
typedef enum
{
    AIP_STATUS_STOP = 0,
    AIP_STATUS_START,
    AIP_STATUS_PAUSE,

    AIP_STATUS_BUTT
} AIP_STATUS_E;

typedef struct
{
    AIP_STATUS_E CurnStatus;
    HI_S32	 Priority;
    HI_BOOL	 bCutoff;
} AIP_CHN_STAUTS_S;

/******************************* API Declaration *****************************/
HI_VOID AIP_Init(HI_VOID* pAipRegBase);
HI_VOID AIP_DeInit(HI_VOID);
HI_VOID AIP_Process(HI_VOID);

HI_U32	AIP_ReadFiFoData(HI_U32 Id, HI_U8* pu32Dest, HI_U32 u32DestSize);
HI_VOID AIP_QueryFiFoInfo(HI_U32 Id, RBUF_INFO_S* pstBufInfo);
HI_U32	AIP_QueryFiFoBusy(HI_U32 Id);
HI_U32	AIP_QueryBusy(HI_U32 Id);
HI_VOID AIP_ReadDataComplete(HI_U32 Id, HI_U32 amountRead);
HI_VOID AIP_GetChnStatus(HI_U32 Id, AIP_CHN_STAUTS_S* pstStatus);
HI_VOID AIP_UnderFlowCalc(HI_U32 Id);
HI_VOID AIP_GetPcmType(HI_U32 Id, AOE_AIP_TYPE_PCM_E* penPcmType);
HI_VOID AIP_FlushCutoffFlag(HI_U32 Id);

HI_VOID* AIP_GetRingIn(HI_U32 Id);
HI_VOID	 AIP_GetCompressInfo(HI_U32 Id, HI_U32* pu32ValidBytes, HI_U32* pu32ZeroBytes);

/** @}*/  /** <!-- ==== API Declaration End ====*/

#endif
