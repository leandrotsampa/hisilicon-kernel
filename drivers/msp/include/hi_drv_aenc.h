/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DRV_AENC_H__
#define __HI_DRV_AENC_H__

#include "hi_mpi_aenc.h"
#include "hi_unf_sound.h"
#include "hi_module.h"
#include "hi_debug.h"

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Macro Definition ******************************/
#define AENC_INSTANCE_MAXNUM (3)     /* max encoder instance */


typedef enum
{
    ANEC_SOURCE_AI	   = 0,
    ANEC_SOURCE_CAST,
    ANEC_SOURCE_VIRTRACK,
    ANEC_SOURCE_BUTT
} ANEC_SOURCE_TYPE_E;

typedef struct hi_AENC_INFO_ATTACH_S
{
    ANEC_SOURCE_TYPE_E eType;
    HI_HANDLE hSource;
} AENC_INFO_ATTACH_S;

typedef enum
{
    AENC_CMD_CTRL_START = 0,
    AENC_CMD_CTRL_STOP,
    AENC_CMD_CTRL_BUTT
} AENC_CMD_CTRL_E;

typedef enum
{
    AENC_CMD_PROC_SAVE_PCM = 0,
    AENC_CMD_PROC_SAVE_ES,
    AENC_CMD_PROC_BUTT
} AENC_CMD_SAVE_E;

typedef struct hiAENC_PROC_ITEM_S
{
    AENC_INFO_ATTACH_S stAttach;
    HI_BOOL	       bAencWorkEnable;
    HI_U32	       u32CodecID;
    HI_CHAR	       szCodecType[32];
    HI_U32	       u32SampleRate;
    HI_U32	       u32BitWidth;
    HI_U32	       u32Channels;

    HI_BOOL	       bAutoSRC;
    HI_U32	       u32EncFrame;
    HI_U32	       u32ErrFrame;

    HI_U32	   u32InBufSize;
    HI_VIRT_ADDR_T tInBufRead;
    HI_VIRT_ADDR_T tInBufWrite;

    HI_U32 u32OutFrameNum;
    HI_U32 u32OutFrameRIdx;
    HI_U32 u32OutFrameWIdx;
    HI_U32 u32DbgSendBufCount_Try;
    HI_U32 u32DbgSendBufCount;
    HI_U32 u32DbgReceiveStreamCount_Try;
    HI_U32 u32DbgReceiveStreamCount;
    HI_U32 u32DbgReleaseStreamCount_Try;
    HI_U32 u32DbgReleaseStreamCount;
    HI_U32 u32DbgTryEncodeCount;

    AENC_CMD_CTRL_E	    enPcmCtrlState;
    AENC_CMD_CTRL_E	    enEsCtrlState;
    HI_U32		    u32SavePcmCnt;
    HI_U32		    u32SaveEsCnt;
    HI_CHAR		    filePath[512];
} AENC_PROC_ITEM_S;

/* Define Debug Level For HI_ID_AENC */
#define HI_FATAL_AENC(fmt...)  HI_FATAL_PRINT(HI_ID_AENC, fmt)
#define HI_ERR_AENC(fmt...)    HI_ERR_PRINT(HI_ID_AENC, fmt)
#define HI_WARN_AENC(fmt...)   HI_WARN_PRINT(HI_ID_AENC, fmt)
#define HI_INFO_AENC(fmt...)   HI_INFO_PRINT(HI_ID_AENC, fmt)

/********************** Global Variable declaration **************************/
#define DRV_AENC_DEVICE_NAME "hi_aenc"

/* 'IOC_TYPE_AENC' means AENC magic macro */
#define	    DRV_AENC_PROC_INIT _IOW(HI_ID_AENC, 0, HI_U32)
#define	    DRV_AENC_PROC_EXIT _IO(HI_ID_AENC, 1)

/******************************* API declaration *****************************/
HI_S32 AENC_Close(HI_U32 hAenc);
HI_S32 AENC_DeInit(HI_VOID);
HI_S32 AENC_Init(HI_VOID);
HI_S32 AENC_Open(HI_HANDLE* phAenc, const HI_UNF_AENC_ATTR_S* pstAencAttr);
HI_S32 AENC_ReceiveStream (HI_HANDLE hAenc, AENC_STREAM_S* pstStream, HI_U32 u32TimeoutMs);
HI_S32 AENC_ReleaseStream(HI_HANDLE hAenc, const AENC_STREAM_S* pstStream);
HI_S32 AENC_SendBuffer (HI_HANDLE hAenc, const HI_UNF_AO_FRAMEINFO_S* pstAOFrame);
HI_S32 AENC_SetConfigEncoder(HI_HANDLE hAenc, HI_VOID* pstConfigStructure);
HI_S32 AENC_RegisterEncoder(const HI_CHAR* pszCodecDllName);
HI_S32 AENC_SetEnable(HI_HANDLE hAenc, HI_BOOL bEnable);
HI_S32 AENC_AttachInput(HI_HANDLE hAenc, HI_HANDLE hSource);
HI_S32 AENC_GetAttachSrc(HI_HANDLE hAenc, HI_HANDLE* hSrc);
HI_S32 AENC_DetachInput(HI_HANDLE hAenc);
HI_S32 AENC_SetAttr(HI_HANDLE hAenc, const HI_UNF_AENC_ATTR_S* pstAencAttr);
HI_S32 AENC_GetAttr(HI_HANDLE hAenc, HI_UNF_AENC_ATTR_S* pstAencAttr);

#ifdef __cplusplus
}
#endif

#endif /* __MPI_PRIV_AENC_H__ */
