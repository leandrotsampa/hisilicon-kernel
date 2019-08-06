#ifndef __HI_ADEC_CORE_H__
#define __HI_ADEC_CORE_H__

#include <stdio.h>
#include <pthread.h>

#include "hi_type.h"
#include "hi_unf_sound.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */


#define RET_VOID HI_VOID

#define ADEC_PTS_BOUNDARY_SIZE 0x40000000L  /* 0x40000000L */

#define ADEC_BYTES_DISCARD_THD 0x100      /* dicard max when decoder  holding  */

//#define ADEC_MMZ_INBUF_SUPPORT /* Input Buffer use mmz memory */
#define ADEC_MMZ_OUTBUF_SUPPORT /* output Buffer use mmz memory */
#define ADEC_MAX_INPUT_FRAME 0x8000    /* max adec input frame size */
#define ADEC_MIN_INPUT_FRAME 8            /* min  adec input frame size */
#define ADEC_CONTINUE_DISCARDPTS_THD 8     /*continue discard pts threshold  */
#define ADEC_SYS_SLEEP_TIME 10   //for adec pull thread
#define ADEC_MIN_SLEEP_TIME 1    //for adec pull thread 
#define ADEC_PTSMS_DIFF 30 //max differ-times stream bps
#define ADEC_MAXPTSTIME 50000
#define ADEC_MAX_PTS_SCOPE 100

#define ADEC_SCHE_THREADTIME_LIMIT  (ADEC_SYS_SLEEP_TIME*3)
#define ADEC_EXE_THREADTIME_LIMIT    (ADEC_SYS_SLEEP_TIME*3)

#define ADEC_MAX_CODECUNSUPPORT_NUM   10
#define ADEC_MAX_STREAMCORRUPT_NUM    10
#define ADEC_DUAL_PTS_DELAY_THRESHOLD 2
/* ADEC_INPUTBUF_PADDING_SIZE description: Buffer allocate additional memory, deal with Buf loop
   mechanism:
 |---- PADDING_SIZE ----|-----------------Buffer_Size --------------------|
    1) Buffer Loop
    2) data not enough when decode
    copy buffer when the two condition come at the same time, change to linear buffer.
    Normal, don't need considering the affection to system, because the data is very little
    Note: must insure that PADDING_SIZE > the MAX Audio Frame Length, otherwise, the space buffer is not big enough to copy.
    (knowing: the MAX Audio Frame Length = 16384 Bytes)
 */
#define ADEC_INPUTBUF_PADDING_SIZE 0x10000   /* DTSHD max frame size is 0x8000, need two frame */
#define PACKET_ADEC_INPUTBUF_PADDING_SIZE (2 * 1024 * 1024)

#if ADEC_INPUTBUF_PADDING_SIZE < ADEC_MAX_INPUT_BLOCK_SIZE
#error "ADEC_INPUTBUF_PADDING_SIZE must bigger than  ADEC_MAX_INPUT_BLOCK_SIZE"
#elif ADEC_INPUTBUF_PADDING_SIZE < ADEC_MAX_INPUT_FRAME
#error "ADEC_INPUTBUF_PADDING_SIZE must bigger than  ADEC_MAX_INPUT_FRAME"
#endif


typedef struct hiADEC_Stream_OutBuf_S
{
    HI_U32           u32OutBufNum;
    HI_U32           u32BufReadIdx;
    HI_U32           u32BufWriteIdx;
    HI_U32*          pu32BaseAddr;
    ADEC_OUTPUTBUF_S outBuf[ADEC_MAX_WORK_BUFFER_NUMBER];
#ifdef ADEC_MMZ_OUTBUF_SUPPORT
    HI_MMZ_BUF_S     sAdecOutMMzBuf;
#endif
} ADEC_STREAM_OUTBUF_S;

typedef struct hiADEC_Info_S
{
    HI_VOID*                             hDecoder;
    HI_HADECODE_OPENPARAM_S              decParam;
    HI_VOID*                             pAudPrivDataBak; /* backup private data */
    HI_U32                               u32AudPrivDataBakDize;
    HI_HA_DECODE_S*                      pHaDecoderDev;
} ADEC_INFO_S;


typedef struct hiADEC_MidState_S
{
    HI_U32               u32ContinueErrNum; /*adec err times, when more than 3, we will reset decoder*/
    HI_U32               u32LastFrameChannels;
    HI_UNF_SAMPLE_RATE_E enLastFrameSmaplerate;
    HI_UNF_STREAM_BUF_S  lastPkt[2];
} ADEC_MIDSTATE_S;

typedef struct hiADEC_PTS_Queue_S
{
    HI_U32   u32LastPtsMs;
    HI_U32   u32LastStorePtsMs;
    HI_U32   u32RecyleStorePtsMs;
    HI_U32   u32RecycleFirstPtsMs;
    HI_U32   u32PtsBeforeRevise;
    HI_U32   ulPTSread;    /* PTS buffer read  ptr */
    HI_U32   ulPTSwrite;    /* PTS buffer write ptr */
    ADEC_PTS tPTSArry[ADEC_MAX_STORED_PTS_NUM];
} ADEC_PTS_QUE_S;

typedef struct hiADEC_PACKET_Queue_S
{
    HI_U32      ulPacketRead;  /* Queue read  offset */
    HI_U32      ulPacketwrite; /* Queue write offset */
    ADEC_PACKET tPacketArry[ADEC_MAX_STORED_PACKET_NUM];
} ADEC_PACKET_QUE_S;


/* Audio frame information structure */
typedef struct hiADEC_FRAME_INFO_S
{      
    HI_BOOL                bFrameInfoChange;
    HI_BOOL                bUnSupportFormat;
    HI_BOOL                bStreamCorrupt;
    HI_U32                 u32Channel;
    HI_U32                 enSampleRate;
    HI_UNF_BIT_DEPTH_E     enBitDepth;
} ADEC_FRAME_INFO_S;

typedef struct hiADEC_PTS_Info_S
{
    HI_U32           u32LastPTS;
    HI_U32           u32ADLastPTS;
    HI_U32           u32PTSDif;
    HI_U32           u32ADPTSDif;
    HI_BOOL          bPriPTSAhead;
    HI_U32           u32PTSDelay;
    HI_U32           u32DelayFrameNum;
    HI_U32           u32DiscardPTSCnt;
    HI_U32           u32MixPTSCnt;
} ADEC_PTS_INFO_S;

typedef struct hiADEC_CHANNEL_S
{
    HI_U32               u32Volume;
    HI_S16               s16VolumeFrac;  /* 1.15 fix-point (u32Volume*0x7fff/ADEC_MAX_VOLUME) */
    HI_U32               u32AdecChID;
    HI_BOOL              beAssigned;
    HI_BOOL              beWork;
    HI_BOOL              bAdecEosFlag; /*eos flag*/
    HI_U32               u32NotEnoughBufCnt; /* counter for not enough data in decoding*/
    HI_U32               u32TotalAdecInByte;
    HI_U32               u32TotalAdecTime;
    HI_U32               u32StartTime;
    HI_U32               u32EndTime;
    HI_BOOL              AdecThreadRun;
    pthread_t            AdecThreadInst;
    HI_U32               u32CodecID;                 /* decoder u32CodecID                         */
    HI_BOOL              bPacketDecoder;
    HI_BOOL              bHwDecoder;
    HI_U32               u32ADTotalAdecInByte;
    ADEC_PTS_INFO_S      stPTSInfo; 
    HI_BOOL              bDualDecoder;               //Dual Decoder
    HI_BOOL              bADEnable;                  //AD service On/OFF
    HI_BOOL              bADToSomePort;              //AD only to some port On/OFF
    HI_S16               s16ADBalance;               //AD Balance
    HI_S32               AdecDevFd;
    HI_S32               s32BsConsumeBytes;
    FILE*                pfEs;
    FILE*                pfPcm;
    ADEC_INFO_S          decAttr;
    ADEC_PTS_QUE_S       PTSQue;
    ADEC_MIDSTATE_S      midState;
    ADEC_STREAM_BUFFER_S InStreamBuf;
    ADEC_PTS_QUE_S       PTSADQue;
    ADEC_MIDSTATE_S      midADState;
    ADEC_STREAM_BUFFER_S InADStreamBuf;

#ifdef HA_SW_DUALDEC_SUPPORT
    HI_U32               CalPTS;
#endif
    ADEC_STREAM_OUTBUF_S outStreamBuf;
    ADEC_PROC_ITEM_S*    pstAdecInfo;
    ADEC_PACKET_QUE_S*   pstPacketQue;
    ADEC_FRAME_INFO_S    stFrameInfo;
} ADEC_CHAN_S;

HI_S32    ADEC_Init(HI_VOID);
HI_S32    ADEC_deInit(HI_VOID);
//HI_S32    ADEC_Reset(HI_HANDLE hAdec);
HI_S32    ADEC_Open(HI_HANDLE *phAdec);
HI_S32    ADEC_Close(HI_HANDLE hAdec);
HI_S32    ADEC_GetAttr(HI_HANDLE hAdec, HI_U32 u32Command, void  *pstAttr);

HI_S32    ADEC_GetBuffer(HI_HANDLE hAdec,
                         HI_U32 u32RequestSize,
                         HI_UNF_STREAM_BUF_S *pstStream1,
                         HI_UNF_STREAM_BUF_S *pstStream2);
HI_S32    ADEC_PutBuffer (HI_HANDLE hAdec,
                          const HI_UNF_STREAM_BUF_S *pstStream1,
                          const HI_UNF_STREAM_BUF_S *pstStream2,
                          HI_U32 u32PtsMs);

HI_S32     ADEC_GetBufferStatus (HI_HANDLE hAdec, ADEC_BUFSTATUS_S *ptsBufStatus);
HI_S32     ADEC_GetDebugInfo(HI_HANDLE hAdec, ADEC_DEBUGINFO_S *pstDebuginfo);
HI_S32     ADEC_GetStatusInfo(HI_HANDLE hAdec, ADEC_STATUSINFO_S *pstStatusinfo);
HI_S32     ADEC_GetStreamInfo(HI_HANDLE hAdec, ADEC_STREAMINFO_S * pstStreaminfo);
HI_S32     ADEC_GetHaSzNameInfo(HI_HANDLE hAdec,ADEC_SzNameINFO_S *pHaSznameInfo);

#ifdef HI_ADEC_AUDSPECTRUM_SUPPORT
HI_S32    ADEC_TryReceiveFrame (HI_HANDLE hAdec, HI_UNF_AO_FRAMEINFO_S *pstAOFrame, ADEC_EXTFRAMEINFO_S *pstExtInfo);
HI_S32    ADEC_GetAnalysisPcmData(HI_HANDLE hAdec);
HI_S32    ADEC_GetAudSpectrum(HI_U16 *pSpectrum ,HI_U32 u32BandNum);
#endif


HI_S32    ADEC_ReceiveFrame (HI_HANDLE hAdec, HI_UNF_AO_FRAMEINFO_S *pstAOFrame, ADEC_EXTFRAMEINFO_S *pstExtInfo);
HI_S32    ADEC_RegisterDeoder(const HI_CHAR* pszDecoderDllName, HI_U32 u32Length);

//HI_S32    ADEC_ShowRegisterDeoder(HI_VOID);
HI_S32    ADEC_FoundSupportDeoder(HA_FORMAT_E enFormat,HI_U32 *penDstCodecID);

HI_S32    ADEC_ReleaseFrame(HI_HANDLE hAdec, const HI_UNF_AO_FRAMEINFO_S *pstAOFrame);
HI_S32    ADEC_SendStream (HI_HANDLE hAdec, const HI_UNF_STREAM_BUF_S *pstStream, HI_U32 u32PtsMs);
HI_S32    ADEC_SetAttr(HI_HANDLE hAdec,HI_U32 command  ,void  *pstParam);
HI_S32    ADEC_SetConfigDeoder(HI_HANDLE hAdec, HI_VOID *pstConfigStructure);
HI_S32    ADEC_GetDecoderList(HI_HA_DECODE_LIB_S **ppHaLib);

HI_VOID   ADEC_DbgCountTryGetBuffer(HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountGetBuffer (HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountTryReceiveFrame (HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountReceiveFrame (HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountTrySendStream (HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountSendStream (HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountTryPutBuffer(HI_HANDLE hAdec);
HI_VOID   ADEC_DbgCountPutBuffer(HI_HANDLE hAdec);
HI_S32    ADEC_SetEosFlag(HI_HANDLE hAdec);
HI_S32    ADEC_SetCodecCmd(HI_HANDLE hAdec, HI_VOID *pstCodecCmd);
HI_S32    ADEC_GetDelayMs(HI_HANDLE hAdec, HI_U32 *pDelayMs);
HI_S32    ADEC_DropStream(HI_HANDLE hAdec, HI_U32 u32SeekPts);
HI_S32    ADEC_CheckNewEvent(HI_HANDLE hAdec, ADEC_EVENT_S *pstNewEvent);

HI_S32  ADEC_SendADStream (HI_HANDLE hAdec, const HI_UNF_STREAM_BUF_S* pstStream, HI_U32 u32PtsMs);
HI_S32  ADEC_GetADBuffer (HI_HANDLE hAdec, HI_U32 u32RequestSize, HI_UNF_STREAM_BUF_S* pstStream1,
                          HI_UNF_STREAM_BUF_S* pstStream2);
HI_S32  ADEC_PutADBuffer (HI_HANDLE hAdec, const HI_UNF_STREAM_BUF_S* pstStream1,
                          const HI_UNF_STREAM_BUF_S* pstStream2, HI_U32 u32PtsMs);
HI_S32  ADEC_GetADDelayMs(HI_HANDLE hAdec, HI_U32* pDelayMs);

HI_S32  ADEC_SetADMixAttr(HI_HANDLE hAdec, HI_BOOL bAdEnable, HI_BOOL bAdToSomePort);
HI_S32  ADEC_GetADMixAttr(HI_HANDLE hAdec, HI_BOOL *pbAdEnable, HI_BOOL* pbAdToSomePort);
HI_S32  ADEC_SetADBalance(HI_HANDLE hAdec,HI_S32 s16ADBalance);
HI_S32  ADEC_GetADBalance(HI_HANDLE hAdec, HI_S16* ps16ADBalance);
HI_VOID ADEC_DbgCountTrySendADStream (HI_HANDLE hAdec);
HI_VOID ADEC_DbgCountSendADStream (HI_HANDLE hAdec);
HI_VOID ADEC_DbgCountTryGetADBuffer(HI_HANDLE hAdec);
HI_VOID ADEC_DbgCountGetADBuffer (HI_HANDLE hAdec);
HI_VOID ADEC_DbgCountTryPutADBuffer(HI_HANDLE hAdec);   
HI_VOID ADEC_DbgCountPutADBuffer (HI_HANDLE hAdec);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_AENC_H__ */

