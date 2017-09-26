/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __DSP_UTIL__H__
#define __DSP_UTIL__H__

#include "hi_type.h"
#include "hi_dsp_common.h"
#include "hi_audsp_common.h"

#define AOE_VOL_MAX_VALUE 18
#define AOE_VOL_MIN_VALUE (-81)
#define AOE_VOLCOEF_NUM 100
#define AOE_VOL_0DB_COEF_IDX AOE_VOL_MAX_VALUE
#define AOE_VOL_INF_COEF_IDX (AOE_VOLCOEF_NUM - 1)
#define AOE_VOL_BASE_VALUE 0x79
#define AOE_VOL_MAXDB_COEF g_u32VolCoef[0]
#define AOE_VOL_0DB_COEF g_u32VolCoef[AOE_VOL_0DB_COEF_IDX]
#define AOE_VOL_INF_COEF g_u32VolCoef[AOE_VOL_INF_COEF_IDX]

#define FADE_INRATE_DF_MS    8
#define FADE_OUTRATE_DF_MS   8

/*dre*/
#define UTIL_DRE_DC_D16_STEP 0x200
#define UTIL_DRE_NOISE_TIMEMS_THD 1000 /*1 second */

#define UTIL_DRE_NOISE_SUB6dB 3

#define UTIL_ALIGN4(x)			    \
    do					    \
    {					    \
	if ((x) & 3)			    \
	{				    \
	    (x) = ((x) + 4 - ((x) & 3));    \
	}				    \
    } while (0)

typedef enum
{
    FADE_STATUS_NOTE = 0, /* fade finish */
    FADE_STATUS_IN,	  /* fade in */
    FADE_STATUS_OUT,	  /* fade out */

    FADE_STATUS_BUTT
} FADE_STATUS_E;

typedef struct
{
    HI_BOOL bLinearMode; /**< gain tpye of volume*/
    HI_U32  u32LGain; /**<Linear gain(bLinearMode is HI_TRUE) , ranging from 0 to 100*/
    /**<Decibel gain(bLinearMode is HI_FALSE) , ranging from 0x28 to 0x8B, 0x28 is mute, 0x78 is -1dB, 0x79 is 0dB, 0x8B is 18dB*/
    HI_U32  u32RGain; /**<Linear gain(bLinearMode is HI_TRUE)) , ranging from 0 to 100*/
    /**<Decibel gain(bLinearMode is HI_FALSE) , ranging from 0x28 to 0x8B, 0x28 is mute, 0x78 is -1dB, 0x79 is 0dB, 0x8B is 18dB*/
    HI_S32  s32LDecGain; /**< gain decimal part, step 0.125dB, 1 is 0.125dB, 2 is 0.250dB, -1 is -0.125dB*/
    HI_S32  s32RDecGain; /**< gain decimal part, step 0.125dB, 1 is 0.125dB, 2 is 0.250dB, -1 is -0.125dB*/
} UTIL_GAIN_ATTR_S;


typedef struct
{
    HI_U32 u32PrescaleInt;  /**< prescale integer part, ranging from 0x28 to 0x8B, 0x28 is mute, 0x78 is -1dB, 0x79 is 0dB, 0x8B is 18dB*/
    HI_S32 s32PrescaleDec;  /**< prescale decimal part, step 0.125dB, 1 is 0.125dB, 2 is 0.250dB, -1 is -0.125dB*/
} UTIL_PRESCALE_ATTR_S;

typedef struct
{
    HI_S32 as32Error[3];
    HI_S32 s32Random;
} UTIL_DITHER_STATE_S;

/* The internal state variables are implemented in a (for the user)  hidden structure */
/* In this (private) file, the internal structure is declared fro private use.*/
typedef struct
{
    HI_S32 s32LeftDC;	 /* LeftDC  */
    HI_S32 s32RightDC;	 /* RightDC  */

    HI_U32 u32EnergyCntL;
    HI_U32 u32EnergyCntR;

    HI_S32 s32DreThrhd;	 /*dre proccess threshold normal(energy 0~255)	mute (db 0 - -127)*/
    HI_U32 u32Decbps;	/*Dither Decreased bps, u32Decbps = source_bps - target_bps*/

    UTIL_DITHER_STATE_S stDither;
} UTIL_DRE_FILTER_STATE;

HI_VOID	  UTIL_UpmixPcmData(HI_U32 dstCh, HI_VOID* WkBuf,HI_DSP_AUDFRAME_S *pstFrame);
HI_VOID	  UTIL_DownmixPcmData(HI_U32 dstCh, HI_VOID* WkBuf,HI_DSP_AUDFRAME_S *pstFrame);
HI_VOID	  UTIL_UnifyBitDepthPcmData(HI_U32 dstBitDepth, HI_VOID* WkBuf, HI_DSP_AUDFRAME_S *pstFrame);
HI_VOID	  UTIL_LRGainProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_S32 s32Balance, UTIL_GAIN_ATTR_S *pstGain);
HI_VOID	  UTIL_LRFadeGainProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_S32 s32Balance, UTIL_GAIN_ATTR_S *pstCurrentGain, UTIL_GAIN_ATTR_S *pstTargetGain);
HI_VOID	  UTIL_ChannelModeProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_U32 u32ChannelMode, HI_U32 dstBitDepth);
HI_VOID	  UTIL_MixerPro (HI_VOID *pMixBuf, HI_VOID *pInBuf, HI_U32 samples, HI_U32 uBitDepth);

HI_U32	  UTIL_CalcFrameSize(HI_U32 Ch, HI_U32 BitDepth);
HI_U32	  UTIL_LatencyMs2ByteSize(HI_U32 u32LatencyMs, HI_U32 u32FrameSize, HI_U32 u32SampleRate);
HI_U32	  UTIL_LatencyMs(HI_U32 u32DataBytes, HI_U32 u32FrameSize, HI_U32 u32SampleRate);
HI_VOID	  UTIL_LRLinearGainProcess(HI_S16 *pSrcPcmBuf,HI_S16 *pDestPcmBuf, HI_S32 InSamps,HI_S16 s16VolumeL,HI_S16 s16VolumeR);
HI_VOID FADE_Create(HI_VOID* *phFade, HI_U32 inRate, HI_U32 BitPerSample, HI_S32 Channels);
HI_VOID FADE_Destroy(HI_VOID* hFade);
HI_VOID FADE_Active(HI_VOID* hFade, FADE_STATUS_E enUserFadeStauts, HI_U32 u32FadeMs);
HI_VOID FADE_InProcess(HI_VOID* hFade, HI_VOID *pInBuf, HI_U32 samples);
HI_VOID FADE_OutProcess(HI_VOID* hFade, HI_VOID *pInBuf, HI_U32 samples);
HI_VOID FADE_Flush(HI_VOID* hFade, HI_U32 inRate, HI_U32 BitPerSample,HI_S32 Channels);
HI_VOID UTIL_DRE_16BIT_Process(HI_DSP_AUDFRAME_S *pstFrame, UTIL_DRE_FILTER_STATE *pstDreState);
HI_VOID UTIL_DRE_Mute_16BIT_Process(HI_DSP_AUDFRAME_S *pstFrame, UTIL_DRE_FILTER_STATE *pstDreState);

#endif
