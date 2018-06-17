/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __HI_LINEAR_SRC_H__
#define	 __HI_LINEAR_SRC_H__

#include "hi_type.h"

#define LINEAR_MAX_SPEED_ADJUST 100  /* LINEAR_MAX_SPEED_ADJUST/1000 */
#define LINEAR_MAX_CHANNELS 10

HI_VOID	 LSRC_Create(HI_VOID* *phLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
			  HI_S32 Channels);

HI_VOID	 LSRC_Destroy(HI_VOID* hLSRC);

HI_VOID	 LSRC_UpdateChange(HI_VOID* hLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
				HI_S32 Channels);

HI_S32	 LSRC_CheckDoSRC(HI_VOID* hLSRC);

HI_VOID	 LSRC_SetSpeedAdjust(HI_VOID* hLSRC, HI_S32 SpeedAdjust);

HI_S32	 LSRC_ProcessFrame(HI_VOID* hLSRC,
				HI_S32 *      pInPcmBuf,
				HI_S32 *      pOutpcmBuf,
				HI_S32	      InSamps);

HI_S32	 LSRC_GetMaxOutputNum(HI_VOID* hLSRC, HI_S32 insamps);
HI_S32	 LSRC_GetMinInputNum(HI_VOID* hLSRC, HI_S32 outsamps);
HI_S32	 LSRC_CheckUpdate(HI_VOID* hLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
			       HI_S32 Channels);
HI_VOID LSRC_Flush(HI_VOID* hLSRC);

#endif
