/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __AOE_REG_H__
#define __AOE_REG_H__

#include "hi_type.h"
#include "hi_audsp_aoe.h"
#include "hi_dsp_common.h"
#include "hi_dsp_aoe.h"

/******************************* API Declaration *****************************/
HI_S32	AOE_REG_ReadBitDepth(HI_U32 *pu32BitPerSample, HI_U32 precision);
HI_S32	AOE_REG_ReadChannel(HI_U32 *pu32Channels, HI_U32 ch);
HI_S32	AOE_REG_ReadSampelRate(HI_U32 *pu32SampelRate, HI_U32 rate);
HI_S32	AOE_REG_ReadDataFormat(HI_U32 *pu32DataFormat, HI_U32 format);
HI_S32	AOE_REG_ReadBufLatencyMs(HI_U32 *pu32LatencyMs, HI_U32 latency);
HI_S32	AOE_REG_ReadBufDelayMs(HI_U32 *pu32DelayMs, HI_U32 delay);
HI_S32	AOE_REG_ReadPcmType(AOE_AIP_TYPE_PCM_E *pEnPcmType, HI_U32 pcmType);

/** @}*/  /** <!-- ==== API Declaration End ====*/

#endif
