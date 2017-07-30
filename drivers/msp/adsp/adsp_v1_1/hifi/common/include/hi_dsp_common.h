/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DSP_COMMON__H__
#define __HI_DSP_COMMON__H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#ifndef MAX_32
#define MAX_32 (HI_S32)0x7fffffffL
#endif

#ifndef MIN_32
#define MIN_32 (HI_S32)0x80000000L
#endif

#ifndef MAX_24
#define MAX_24 ((HI_S32)0x007fffffL)
#endif

#ifndef MIN_24
#define MIN_24 ((HI_S32)0xff800000L)
#endif

#ifndef MAX_16
#define MAX_16 (HI_S16)0x7fff
#endif

#ifndef MIN_16
#define MIN_16 (HI_S16)0x8000
#endif

#ifndef SIGN_24
#define SIGN_24 ((HI_S32)0xff800000L)
#endif

#ifndef SIGN_16
#define SIGN_16 ((HI_S32)0xffff8000)
#endif

#define AOE_PROCESS_PERIONDMS_DEFAULT 5	  /* 5ms */
#define AOE_PROCESS_PERIONDMS_MAX     10  /* 10ms */
#define AOE_PROCESS_PERIONDMS_MIN     2	  /* 2ms */
#define AOE_TIMER_SW_INTERVAL 5		 /* 5ms */

#define AOE_CAST_PROCESS_PERIONDMS 5

#define AOE_CAST_FIFO_PERIONDMS 30 //30ms
#define AOE_CAST_FIFO_THRESHOLD 4

#include "hi_module.h"
#define ADSP_ID_AOE  (HI_ID_ADSP)
#define ADSP_ID_AFLT (HI_ID_AFLT)

typedef enum
{
    AOE_BIT_DEPTH_16 = 16,
    AOE_BIT_DEPTH_24 = 24,
} DSP_BITDEPTH_E;

typedef enum
{
    AOE_CHNUM_1 = 1,
    AOE_CHNUM_2 = 2,
    AOE_CHNUM_8 = 8,
} DSP_CHNUM_E;

/**Defines the	status of task.*/
typedef enum
{
    ADSP_TASK_STATUS_IDLE = 0,
    ADSP_TASK_STATUS_RUNNING,

    ADSP_TASK_STATUS_BUTT
} ADSP_TASK_STATUS_E;

/**Defines the	status of system.*/
typedef enum
{
    ADSP_SYS_STATUS_IDLE = 0,
    ADSP_SYS_STATUS_CMDPROC,
    ADSP_SYS_STATUS_AOEPROC,
    ADSP_SYS_STATUS_AFLTPROC,
    ADSP_SYS_STATUS_LOWPOWERWAITI,
    ADSP_SYS_STATUS_POWEROFF,
} ADSP_SYS_STATUS_E;

/**
 *  structure of the dsp audio frame
 *
 */
typedef struct hiHI_DSP_AUDFRAME_S
{
    HI_VOID* pDataBuf;	     /**<I/O, pointer to the decoded PCM data.
				  Note: 1) pDataBuf must be 32-word aligned. */

    HI_U32 u32DataBytes;   /**<I/O, size (in byte) of the buffer for storing the audio data */

    HI_U32 u32SamplesPerFrame; /**<I/O, number of output samples per channel*/
    HI_U32 u32BitPerSample; /**<I/O, bit per sampling*/
    HI_U32 u32Channels; /**<I/O, number of channels*/
    HI_U32 u32SampleRate; /**<I/O, sampling rate*/
    HI_U32 u32DataFormat;		/**<I/O, 0, linear pcm, 1, iec61937 */
} HI_DSP_AUDFRAME_S;

#define DSP_ASSERT(x)

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
