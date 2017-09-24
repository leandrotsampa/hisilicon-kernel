/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name	: mpi_priv_adec.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2006/03/10
  Description	:
  History	:
  1.Date	: 2006/03/10
    Author	: f47391
    Modification: Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __MPI_PRIV_ADEC_H__
#define __MPI_PRIV_ADEC_H__

#include "hi_type.h"
#include "hi_unf_sound.h"
#include "hi_mpi_adec.h"
#include "hi_module.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#define ADEC_INSTANCE_MAXNUM	8

typedef enum
{
    ADEC_CMD_CTRL_START = 0,
    ADEC_CMD_CTRL_STOP,
    ADEC_CMD_CTRL_BUTT
} ADEC_CMD_CTRL_E;

typedef enum
{
    ADEC_CMD_PROC_SAVE_PCM = 0,
    ADEC_CMD_PROC_SAVE_ES,
    ADEC_CMD_PROC_BUTT
} ADEC_CMD_SAVE_E;

typedef struct hiADEC_PROC_ITEM_S
{
    HI_BOOL	   bAdecWorkEnable;
    HI_CHAR	   szCodecType[32];
    HI_CHAR	   szCodecDescription[32];
    HI_U32	   u32CodecID;
    HI_BOOL	   enFmt;
    HI_UNF_SAMPLE_RATE_E enSampleRate;
    HI_UNF_BIT_DEPTH_E	 enBitWidth;
    HI_U32	     u32PcmSamplesPerFrame;
    HI_U32	     u32FramnNm;
    HI_U32	     u32ErrFrameNum;
    HI_U32	     u32ADBufSize;
    HI_S32	     s32ADBufRead;
    HI_U32	     u32ADBufWrite;

    HI_S16	     s16ADBalance;
    HI_BOOL	     bADEnable;
    HI_U32	     u32BufSize;
    HI_S32	     s32BufRead;
    HI_U32	     u32BufWrite;
    HI_U32	     u32FrameSize;
    HI_U32	     u32FrameRead;
    HI_U32	     u32FrameWrite;
    HI_U32	     u32FrameReadWrap;
    HI_U32	     u32FrameWriteWrap;

    HI_U32	     u32PTSDif;
    HI_U32	     u32ADPTSDif;
    HI_BOOL	     bPriPTSAhead;
    HI_U32	     u32PTSDelay;
    HI_U32	     u32PTSFrameDelayNum;
    HI_U32	     u32DiscardPTSCnt;
    HI_U32	     u32MixPTSCnt;
    HI_U32	     u32PtsLost;
    HI_U32	     u32Volume;
    HI_U32	     u32OutChannels;
    HI_U32	     u32BitsOutBytesPerFrame;
    HI_U32	     u32DbgGetBufCount_Try;
    HI_U32	     u32DbgGetBufCount;
    HI_U32	     u32DbgPutBufCount_Try;
    HI_U32	     u32DbgPutBufCount;
    HI_U32	     u32DbgReceiveFrameCount_Try;
    HI_U32	     u32DbgReceiveFrameCount;
    HI_U32	     u32DbgSendStraemCount_Try;
    HI_U32	     u32DbgSendStraemCount;
    HI_U32	     u32DbgTryDecodeCount;

    HI_U32	     u32DbgGetADBufCount_Try;
    HI_U32	     u32DbgGetADBufCount;
    HI_U32	     u32DbgPutADBufCount_Try;
    HI_U32	     u32DbgPutADBufCount;
    HI_U32	     u32DbgSendADStraemCount_Try;
    HI_U32	     u32DbgSendADStraemCount;
    HI_U32	     u32DbgTryADDecodeCount;

    HI_U32	     u32FrameConsumedBytes;
    HI_U32	     u32LastCorrectFrameNum;
    HI_U32	     u32ThreadId;

    ADEC_CMD_CTRL_E    enPcmCtrlState;
    ADEC_CMD_CTRL_E    enEsCtrlState;
    HI_U32	       u32SavePcmCnt;
    HI_U32	       u32SaveEsCnt;
    HI_CHAR	       filePath[512];
    HI_CHAR	       adfilePath[512];

    HI_U32	     ThreadBeginTime;
    HI_U32	     ThreadEndTime;
    HI_U32	     ThreadScheTimeOutCnt;
    HI_U32	     ThreadExeTimeOutCnt;

    HI_U32	     u32AdecSystemSleepTime;

    HI_U32	     u32CodecUnsupportNum;
    HI_U32	     u32StreamCorruptNum;
    HI_U32	     u32AdecDelayMS;
} ADEC_PROC_ITEM_S;
/* 'IOC_TYPE_ADEC' means ADEC magic macro */
#define	    DRV_ADEC_PROC_INIT _IOW(HI_ID_ADEC, 0, HI_U32)
#define	    DRV_ADEC_PROC_EXIT _IO(HI_ID_ADEC, 1)

/*Define Debug Level For HI_ID_AO		      */
#define HI_FATAL_ADEC(fmt...) \
    HI_FATAL_PRINT(HI_ID_ADEC, fmt)

#define HI_ERR_ADEC(fmt...) \
    HI_ERR_PRINT(HI_ID_ADEC, fmt)

#define HI_WARN_ADEC(fmt...) \
    HI_WARN_PRINT(HI_ID_ADEC, fmt)

#define HI_INFO_ADEC(fmt...) \
    HI_INFO_PRINT(HI_ID_ADEC, fmt)

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif /* End of #ifndef __MPI_PRIV_ADEC_H__ */
