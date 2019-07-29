/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_debug.h"
#include "aoe_reg.h"

static HI_U32 g_u32AoeSampleRateTab[] =
{
    8000,
    11025,
    12000,
    16000,
    22050,
    24000,
    32000,
    44100,
    48000,
    88200,
    96000,
    176400,
    192000,
};

HI_S32	AOE_REG_ReadBitDepth(HI_U32 *pu32BitPerSample, HI_U32 precision)
{
    switch (precision)
    {
    case 0x0:
	*pu32BitPerSample = 8;
	break;
    case 0x1:
	*pu32BitPerSample = 16;
	break;
    case 0x2:
	*pu32BitPerSample = 24;
	break;
    default:
	*pu32BitPerSample = 0;
	HI_DSP_PRINT("invalid precision(%d)\n",precision);
	return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_S32	AOE_REG_ReadChannel(HI_U32 *pu32Channels, HI_U32 ch)
{
    switch (ch)
    {
    case 0x00:
	*pu32Channels = 1;
	break;
    case 0x01:
	*pu32Channels = 2;
	break;
    case 0x03:
	*pu32Channels = 8;
	break;
    default:
	*pu32Channels = 0;
	HI_DSP_PRINT("invalid ch(%d)\n",ch);
	return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_S32	AOE_REG_ReadPcmType(AOE_AIP_TYPE_PCM_E *pEnPcmType, HI_U32 pcmType)
{
    if (pcmType >= AOE_AIP_TYPE_PCM_BUTT )
    {
	HI_DSP_PRINT("invalid pcm type(%d)\n",pcmType);

	return HI_FAILURE;
    }

    *pEnPcmType = (AOE_AIP_TYPE_PCM_E)pcmType;

    return HI_SUCCESS;
}

HI_S32	AOE_REG_ReadSampelRate(HI_U32 *pu32SampelRate, HI_U32 rate)
{
    if(rate < sizeof(g_u32AoeSampleRateTab) / sizeof(g_u32AoeSampleRateTab[0]))
    {
	*pu32SampelRate = g_u32AoeSampleRateTab[rate];
	return HI_SUCCESS;
    }
    else
    {
	HI_DSP_PRINT("\ninvalid rate(%d)\n",rate);
	return HI_FAILURE;
    }
}

HI_S32	AOE_REG_ReadDataFormat(HI_U32 *pu32DataFormat, HI_U32 format)
{
    *pu32DataFormat = format;
    return HI_SUCCESS;
}

HI_S32	AOE_REG_ReadBufLatencyMs(HI_U32 *pu32LatencyMs, HI_U32 latency)
{
    *pu32LatencyMs = latency;
    return HI_SUCCESS;
}

HI_S32	AOE_REG_ReadBufDelayMs(HI_U32 *pu32DelayMs, HI_U32 delay)
{
    *pu32DelayMs = delay;
    return HI_SUCCESS;
}
