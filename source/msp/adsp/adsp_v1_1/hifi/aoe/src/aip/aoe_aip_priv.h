/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: aoe_aip_priv.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2013/02/28
  Description	:
  History	:
  1.Date	: 2013/02/28
    Author	: zgjie
    Modification: Created file

 *******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __AOE_AIP_PRIV__H__
#define	 __AOE_AIP_PRIV__H__

#include "hi_type.h"
#include "hi_audsp_aoe.h"
#include "hi_dsp_common.h"
#include "hi_dsp_ringbuf.h"
#include "aoe_aip.h"

#define AIP_MAX_SAMPLE_INPUT_LEFT 4
#define AIP_MAX_SAMPLE_OUTPUT_LEFT_PERFRAME (192000 / 8000)
#define AIP_MAX_BYTES_LEFT (AIP_MAX_SAMPLE_INPUT_LEFT * AOE_CHNUM_2 * sizeof(HI_U32) * AIP_MAX_SAMPLE_OUTPUT_LEFT_PERFRAME)

#define AIP_FLUSH_TYPE_STATE 0x01
#define AIP_FLUSH_TYPE_RBFIN 0x02
#define AIP_FLUSH_TYPE_FIFO 0x04

#define AIP_XA_RESAMPLER  0x00	      //Tensilica XA resampler
#define AIP_SW_RESAMPLER  0x01	      //HISI resampler
#define AIP_IMEDIA_RESAMPLER  0x02    //Imedia resampler

typedef struct
{
    AOE_AIP_TYPE_PCM_E enPcmType;
    HI_S32	Priority;

    HI_U32	u32FadeinMs;
    HI_U32	u32FadeoutMs;
    HI_U32	u32InBitPerSample;
    HI_U32	u32InChannels;		/*<I/O, number of channels*/
    HI_U32	u32InSampleRate;	/*<I/O, sampling rate*/
    HI_U32	u32InDataFormat;	/*<I/O, 0, linear pcm, 1, iec61937 */
    RBUF_ATTR_S stRbfInAttr;

    HI_U32	u32OutBitPerSample; /*<I/O, bit per sampling*/
    HI_U32	u32OutChannels;	    /*<I/O, number of channels*/
    HI_U32	u32OutSampleRate;   /*<I/O, sampling rate*/
    HI_U32	u32OutDataFormat;   /*<I/O, 0, linear pcm, 1, iec61937 */
    HI_U32	u32OutLatencyThdMs;
    RBUF_ATTR_S stRbfOutAttr;
} AIP_CHN_ATTR_S;

typedef enum
{
    HI_DSP_DRE_OFF    = 0,
    HI_DSP_DRE_NORMAL = 1,
    HI_DSP_DRE_MUTE   = 2,
} HI_DSP_DREMODE;

typedef struct
{
    AIP_CHN_ATTR_S stAttr;

    HI_VOID* hRingIn;
    HI_VOID* hRingOut;
    HI_VOID* hADJ;
    HI_VOID* hSRC;
    HI_VOID* hFADE;

    // internal
    AIP_STATUS_E       CurStatus;
    UTIL_GAIN_ATTR_S   stGain;
    UTIL_PRESCALE_ATTR_S  stPrescale;
    HI_BOOL	       bMute;
    HI_U32	       u32ChannelMode;
    HI_U32	       u32DreMode;
    HI_S32	       s32FadeInVol;
    HI_S32	       s32FadeOutVol;
    HI_S32	       s32FadeState; /* 1:fade_in,2:fade_out */
    HI_S32	       s32UserSpeedAdjust;

    HI_U32	       OutputLeftSamples;
    HI_U8*	       pOutputLeftBuf;
    HI_U32	       OutBlockSize;
    HI_U32	       OutFrameSize;
    HI_U32	       InFrameSize;
    HI_U32	       OutLatencySize;
    HI_U32	       Id;
    HI_U32	       u32ResampleId;
    HI_BOOL	       bCutoff;
    HI_BOOL	       bFifoBypass;
    HI_BOOL	       bDuplicate;
    HI_U32	       DestAop;
    HI_U32	       u32SkipMs;
    HI_BOOL	       bDupStart;
    HI_U32	       ReadRptr;

    UTIL_DRE_FILTER_STATE    stDreState;
} AIP_STATE_S;

typedef struct
{
    S_AIP_REGS_TYPE* hwAipReg[AOE_MAX_AIP_NUM];
    HI_VOID*	     hAip[AOE_MAX_AIP_NUM];
} AIP_GLOBAL_SOURCE_S;

#endif
