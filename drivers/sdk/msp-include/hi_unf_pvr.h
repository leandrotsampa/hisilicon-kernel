/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_pvr.h
  Version	: Initial draft
  Author	: HiSilicon multimedia software group
  Created Date	 : 2008-04-09
  Description	: hi_pvr_api.h header file
  Change History:
  Date	      : 2008-04-09
    Author	: Qu Yaxin (employee ID: 46153)
    Description: This file is created.

******************************************************************************/
/**
 * \file
 * \brief Describes the information about the personal video recorder (PVR). CNcomment: �ṩPVR�������Ϣ CNend
 */

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_PVR_H__
#define __HI_UNF_PVR_H__

#include "hi_type.h"
#include "hi_debug.h"
#include "hi_unf_cipher.h"
#include "hi_unf_common.h"
#include "hi_unf_avplay.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"
{
#endif
#endif /* End of #ifdef __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	   PVR */
/** @{ */  /** <!--[PVR]*/

/**Recommended value of the recording attribute u32ScdBufSize*//** CNcomment: ¼��������u32ScdBufSize���Ƽ�ֵ */
#define PVR_STUB_SC_BUF_SZIE (7*4*2048)

/**Recommended value of the recording attribute u32DavBufSize*//** CNcomment:  ¼��������u32DavBufSize���Ƽ�ֵ */
#define PVR_STUB_TSDATA_SIZE (188*12*2048)

/*****************Macro Definition*******************************/
/**Maximum length of the file name, in byte*//** CNcomment:  �ļ�����󳤶ȣ���λ:�ֽ�*/
#define PVR_MAX_FILENAME_LEN		256
/**Maximum length of the encryption key, in byte. Note: The valid key length may not be the maximum length, and depends on the encryption algorithm.*/
/** CNcomment: ������Կ��󳤶ȣ���λ:�ֽڡ�ע��: ��Կ����Ч���Ȳ�һ������󳤶ȣ������ɼ��ܵ��㷨���� */
#define PVR_MAX_CIPHER_KEY_LEN		128
/**Maximum length of the user data, in byte*//** CNcomment:  �û�������󳤶ȣ� ��λ:�ֽ� */
#define PVR_MAX_USERDATA_LEN		(1024*1024)
#define PVR_MAX_CADATA_LEN		(16*1024)



/***********************************************************
		Data Structure Definition
 ***********************************************************/

/***** Common Data Structures*****/

/** Secure mode type*/
/**CNcomment:��ȫģʽ����*/
typedef enum hiUNF_PVR_SECURE_MODE_E
{
    HI_UNF_PVR_SECURE_MODE_NONE = 0,	    /** <no security protection*/ /**<CNcomment:�ް�ȫ����*/
    HI_UNF_PVR_SECURE_MODE_TEE,		    /** <trustedzone security protection*/ /**<CNcomment:trustedzone��ȫ����*/

    HI_UNF_PVR_SECURE_MODE_BUTT
} HI_UNF_PVR_SECURE_MODE_E;

/**Cyclic control data structure of the PVR index file*//** CNcomment: PVR index�ļ���ѭ�����ƽṹ��Ϣ */
typedef struct hiPVR_CYC_HEADER_INFO_S
{
    HI_U32 u32StartFrame;     /**<Offset of the start frame in the index file. The start frame is at u32StartFrame.*//**<CNcomment: ��������ʼ֡��index�ļ��е�ƫ��, ��ʼ֡����u32StartFrame��λ��*/
    HI_U32 u32EndFrame;	      /**<Offset of the end frame in the index file. The end frame is at u32EndFrame - 1.*//**<CNcomment: �����Ľ���֡��index�ļ��е�ƫ��, ����֡����u32EndFrame-1��λ��*/
    HI_U32 u32LastFrame;      /**<Offset of the last frame in the index file. The last frame is at u32LastFrame - 1.*//**<CNcomment: index�ļ��н�β֡��ƫ��, ��β֡����u32LastFrame-1��λ��*/
    HI_U32 u32IsRewind;	      /**<Whether to record the file in rewind mode. 0: no rewind; 1: rewind*//**<CNcomment: �ļ��Ƿ����¼��, 0 �ǻ���, 1 ����*/
}PVR_CYC_HEADER_INFO_S;

/**Structure of the file header in the PVR index file*//** CNcomment: PVR index�ļ����ļ�ͷ��Ϣ�ṹ */
typedef struct hiPVR_IDX_HEADER_INFO_S
{
    HI_U32 u32StartCode;			  /**<Start code (0x5A5A5A5A)*//**<CNcomment: ��ʼ��(0x5A5A5A5A) */
    HI_U32 u32HeaderLen;			  /**<Length from u32StartCode to UsrData*//**<CNcomment: ��u32StartCode��ʼ��UsrData�����ĳ��� */
    PVR_CYC_HEADER_INFO_S stCycInfo;		  /**<Records the cyclic control information in the index file*//**<CNcomment: index��¼�ƻ��ؿ�����Ϣ */
    HI_U64 u64ValidSize;			  /**<Size of the valid content in a file, in byte*//**<CNcomment:�ļ�����Ч���ݴ�С ��λByte */
    HI_U32 u32Reserved;				  /**<Reserved, for alignment*//**<CNcomment:�������������� */
    HI_U32 u32UsrDataInfoLen;			  /**<User information length*//**<CNcomment: �û���Ϣ���� */
    HI_U32 u32CADataInfoLen;
}PVR_IDX_HEADER_INFO_S;

/**Index data saved in the PVR index file*//** CNcomment: PVR index�ļ��б�����������ݽṹ */
typedef struct hiPVR_INDEX_ENTRY_S
{
    HI_U16 u16FrameTypeAndGop;			  /**<2-bit frame type and 14-bit group of pictures (GOP)*/
    HI_U16 u16UpFlowFlag;			  /**<DAV overflow flag*/
    HI_U32 s32CycTimes;				  /**<Number of times that the file is rewound*/
    HI_U64 u64GlobalOffset;			  /**<Total global offset (rewind ignored), in byte*/
    HI_U32 u32DisplayTimeMs;			  /**<Display time (in ms), no rewind*/
    HI_U32 u32FrameSize;			  /**<Frame size*/
    HI_U64 u64Offset;				  /**<Frame offset in a stream file*/
    HI_U32 u32PtsMs;				  /**<Presentation time stamp (PTS), in ms*/
    HI_U16 u16IndexType;			  /**<Index type*/
    HI_U16 u161stFrameOfTT;			  /**<Useless*/
}PVR_INDEX_ENTRY_S,*PTR_PVR_INDEX_ENTRY;


/**Encryption or decryption configuration of the PVR*//** CNcomment:  PVR�ӽ������� */
typedef struct hiUNF_PVR_CIPHER_S
{
    HI_BOOL		bDoCipher;			       /**<Whether to perform encryption or decryption. When this parameter is set to HI_FALSE, other parameters are invalid.*//**<CNcomment:  �Ƿ���м��ܻ��߽��ܣ���������ΪHI_FALSEʱ��������û������ */
    HI_UNF_CIPHER_ALG_E enType;				       /**<Algorithm for encryption or decryption*//**<CNcomment: ���ܻ��߽�����㷨���� */
    HI_U8		au8Key[PVR_MAX_CIPHER_KEY_LEN];	       /**<In normal PVR,it's cipher key.If advance security PVR, it's Keyladder's first session key*//**<CNcomment: ��ͨPVR�����У���ΪCipher����Կ���߰�ȫPVR�����У���ΪKeyladder��һ���Ự��Կ */
    HI_U32		u32KeyLen;			       /**<Cipher key length*//**<CNcomment: ��Կ���� */
}HI_UNF_PVR_CIPHER_S;

/**Type of the PVR event*//** CNcomment:  PVR�¼����� */
typedef enum hiUNF_PVR_EVENT_E
{

    HI_UNF_PVR_EVENT_PLAY_EOF	     = 0x001,	       /**<A file is played at the end of file (EOF).*//**<CNcomment:  ���ŵ��ļ�β */
    HI_UNF_PVR_EVENT_PLAY_SOF	     = 0x002,	       /**<A file is played to the start of file (SOF).*//**<CNcomment:	 ���˵��ļ�ͷ */
    HI_UNF_PVR_EVENT_PLAY_ERROR	     = 0x003,	       /**<An internal error occurs during playing.*//**<CNcomment:  �����ڲ����� */
    HI_UNF_PVR_EVENT_PLAY_REACH_REC  = 0x004,	       /**<The playing speed reaches the recording speed during time shift.*//**<CNcomment:  ʱ�Ƶ�ʱ�򲥷�׷��¼�� */
    HI_UNF_PVR_EVENT_PLAY_RESV	     = 0x00f,	       /**<Reserved*//**<CNcomment:  ���� */
    HI_UNF_PVR_EVENT_REC_DISKFULL    = 0x010,	       /**<The disk is full.*//**<CNcomment:  ������ */
    HI_UNF_PVR_EVENT_REC_ERROR	     = 0x011,	       /**<An internal error occurs during recording.*//**<CNcomment:  ¼���ڲ����� */
    HI_UNF_PVR_EVENT_REC_OVER_FIX    = 0x012,	       /**<The length of the recorded data reaches the specified length. after report this event, in non-rewind mode, pvr stop recording; In rewind mode, pvr keep recording.*//**<CNcomment: ¼�Ƴ��ȴﵽָ���ĳ���. �ϱ�����¼��󣬷ǻ���¼��ģʽ��ֹͣ¼�ƣ�����¼��ģʽ�¼���¼�� */
    HI_UNF_PVR_EVENT_REC_REACH_PLAY  = 0x013,	       /**<The recording speed reaches the playing speed during time shift.*//**<CNcomment:  ʱ�Ƶ�ʱ��¼��׷�ϲ��� */
    HI_UNF_PVR_EVENT_REC_DISK_SLOW   = 0x014,	       /**<The storage speed of the disk is slower than the recording speed.*//**<CNcomment: ���̴洢�ٶ�����¼���ٶ� */
    HI_UNF_PVR_EVENT_REC_RESV	     = 0x01f,	       /**<Reserved*//**<CNcomment:  ���� */
    HI_UNF_PVR_EVENT_BUTT	     = 0x020	       /**<Invalid event type*//**<CNcomment: ��Ч���¼����� */
} HI_UNF_PVR_EVENT_E;

/**Callback function of PVR event*//** CNcomment: PVR�¼��ص����� */
typedef void (*eventCallBack)(HI_U32 u32ChnID, HI_UNF_PVR_EVENT_E EventType, HI_S32 s32EventValue, HI_VOID *args);

/**Type of recorded and played streams of the PVR*//** CNcomment: PVR¼�ơ����ŵ��������� */
typedef enum hiUNF_PVR_STREAM_TYPE_E
{
    HI_UNF_PVR_STREAM_TYPE_TS,	      /**<Transport stream (TS)*//**<CNcomment:	 TS�� */
    HI_UNF_PVR_STREAM_TYPE_PES,	      /**<Packetized elementary stream (PES)*//**<CNcomment: PES�� */
    HI_UNF_PVR_STREAM_TYPE_ALL_TS,    /**<All types of streams. That is, the streams at all frequencies are recorded.*//**<CNcomment: ȫ����¼�ƣ�¼������Ƶ����������� */
    HI_UNF_PVR_STREAM_TYPE_OTHER,     /**<Invalid*//**<CNcomment:  ��Ч������ */
    HI_UNF_PVR_STREAM_TYPE_BUTT
} HI_UNF_PVR_STREAM_TYPE_E;

/**Index type*//** CNcomment: �������� */
typedef enum hiUNF_PVR_REC_INDEX_TYPE_E
{
    HI_UNF_PVR_REC_INDEX_TYPE_NONE,	 /**<No index is created. You need to select this type when recording all streams.*//**<CNcomment: <����������ȫ����¼�Ƶ�ʱ����ʹ�ô�����  */
    HI_UNF_PVR_REC_INDEX_TYPE_VIDEO,	 /**<The index is created based on videos.*//**<CNcomment: <�����Ƶ���������� */
    HI_UNF_PVR_REC_INDEX_TYPE_AUDIO,	 /**<The index is created based on audios. *//**<CNcomment: <�����Ƶ���������� */
    HI_UNF_PVR_REC_INDEX_TYPE_BUTT	 /**<Invalid*//**<CNcomment: <��Ч���������͡�	 */
} HI_UNF_PVR_REC_INDEX_TYPE_E;

/**Information about a stream file recorded by the PVR*//** CNcomment:	PVR¼�Ƶ������ļ���Ϣ */
typedef struct hiUNF_PVR_FILE_ATTR_S
{
    HI_UNF_PVR_REC_INDEX_TYPE_E enIdxType;	    /**<Index type*//**<CNcomment:  �������� */
    HI_U32			u32FrameNum;	    /**<For a video file: number of frames in the file. For an audio file: number of PESs in the file*//**<CNcomment:  ����Ƶ�ļ����ļ�֡��;����Ƶ�ļ����ļ��е�PES�� */
    HI_U32			u32StartTimeInMs;   /**<Start time of the file, in ms*//**<CNcomment: �ļ����ݵ���ʼʱ�䣬��ʼ֡PTS����λms */
    HI_U32			u32EndTimeInMs;	    /**<End time of the file, in ms*//**<CNcomment: �ļ����ݵĽ���ʱ�䣬����֡PTS����λms  */
    HI_U64			u64ValidSizeInByte; /**<Valid data length of the file, in byte *//**<CNcomment:	 �ļ�����Ч���ݳ��ȣ���λbyte */
} HI_UNF_PVR_FILE_ATTR_S;

/***** Data Structures for Recording  *****/
/** Record statuses*/
/**INVALID -> INIT -> RUNNING -> STOPPING ->	STOP ->	   INVALID  (saveIndex)	 (saveStream)*/

/**Status of a recording channel*//** CNcomment: ¼��ͨ����״̬ */
typedef enum hiUNF_PVR_REC_STATE_E
{
  HI_UNF_PVR_REC_STATE_INVALID,	       /**<Not initialized*//**<CNcomment:  δ��ʼ����	  */
  HI_UNF_PVR_REC_STATE_INIT,	       /**<Initialized*//**<CNcomment:	��ʼ����      */
  HI_UNF_PVR_REC_STATE_RUNNING,	       /**<Recording*//**<CNcomment:  ¼���С�	    */
  HI_UNF_PVR_REC_STATE_PAUSE,	       /**<Pause*//**<CNcomment:  ��ͣ��	*/
  HI_UNF_PVR_REC_STATE_STOPPING,       /**<Stopping*//**<CNcomment: ����ֹͣ��	  */
  HI_UNF_PVR_REC_STATE_STOP,	       /**<<Stopped*//**<CNcomment: �Ѿ�ֹͣ��	  */
  HI_UNF_PVR_REC_STATE_BUTT	       /**<Invalid*//**<CNcomment: ��Ч��״ֵ̬��*/
} HI_UNF_PVR_REC_STATE_E;

/**Attributes of a recording channel*//** CNcomment: ¼��ͨ���������ݽṹ */
typedef struct hiUNF_PVR_REC_ATTR_S
{
    HI_UNF_PVR_REC_INDEX_TYPE_E enIndexType;			       /**<Index type, static attribute.*//**<CNcomment:  �������ͣ���̬���ԡ� */
    HI_UNF_VCODEC_TYPE_E	enIndexVidType;			       /**<Video encoding protocol with which the stream (for which an index is to be created) complies. The protocol (static attribute) needs to be set only when the index type is HI_UNF_PVR_REC_INDEX_TYPE_VIDEO.*/
								       /**<CNcomment: ��������������������Ƶ����Э��, ����������HI_UNF_PVR_REC_INDEX_TYPE_VIDEOʱ����Ҫ����,��̬����  */
    HI_U32			u32IndexPid;			       /**<Index PID, static attribute.*//**<CNcomment:	 ����PID����̬����*/
    HI_U32			u32DemuxID;			       /**<Recording DEMUX ID, static attribute.*//**<CNcomment:  ¼��DEMUX�ţ���̬���ԡ�*/
    HI_U32			u32DavBufSize;			       /**<Size (in byte) of a data stream buffer, static attribute.*//**<CNcomment:  ��������������С����λΪByte����̬���ԡ�	*/
    HI_U32			u32ScdBufSize;			       /**<Size (in byte) of an index data buffer, static attribute.*//**<CNcomment:  �������ݻ�������С����λΪByte����̬���ԡ�*/
    HI_U32			u32UsrDataInfoSize;		       /**<Size (in byte) of the private user data, static attribute.*//**<CNcomment:  �û�˽�����ݴ�С����λΪByte����̬���ԡ�	 */
    HI_BOOL			bIsClearStream;			       /**<Whether to record streams as clear streams, static attribute. This item indicates that the stored streams are clear streams or scrambled streams. If the programs to be recorded are scrambled streams, the clear streams can be recorded only after a descrambler is configured for the audio/video channel of the DEMUX.
								       The recording module of the PVR does not descramble the scrambled streams.*/
								       /**<CNcomment: �Ƿ������¼�Ƴ���������̬���ԡ��������˼�Ǵ��������������������Ǽ������������¼�ƵĽ�Ŀ�Ǽ���������Ҫ��¼��DEMUX������һ·CA����¼������,PVR¼��ģ�鲢������Լ������Ľ��Ų�����*/
    HI_UNF_PVR_STREAM_TYPE_E	enStreamType;			       /**<Type of the data to be recorded, static attribute.*//**<CNcomment: ��¼�Ƶ��������ͣ���̬���ԡ�*/
    HI_UNF_PVR_CIPHER_S		stEncryptCfg;			       /**<Stream encryption configuration, static attribute.*//**<CNcomment: ��������������Ϣ����̬���ԡ�*/
    HI_U64			u64MaxFileSize;			       /**<Size of the file to be recorded, static attribute. If the value is 0, it indicates that there is no limit on the file size. The minimum file size is 52428800 bytes (50 MB). If the disk space is sufficient, it is recommended to set the file size to a value greater than 512 MB. The file size cannot be 0 in rewind mode. */
								       /**<CNcomment: ��¼�Ƶ��ļ���С��Ϊ0ʱ��ʾ�����ƣ���̬���ԡ���СֵΪ50M,������̿ռ��㹻�Ļ����Ƽ�����Ϊ512M���ϡ�����Ϊ����ʱ���������ļ���С���ļ�����ʱ�䶼����Ϊ0�� */
    HI_U64			u64MaxTimeInMs;			       /**<Max play time of the file to be recorded, static attribute. If the value is 0, it indicates that there is no limit on the file play time. The minimum file time is 60*1000 MS (1 Min).  The file size  and file time cannot both be 0 in rewind mode.*/
								       /**<CNcomment: ��¼�Ƶ��ļ��������ʱ�䳤�ȣ�Ϊ0ʱ��ʾ�����ƣ���̬���ԡ���С����ʱ��Ϊ60*1000����(1����)������ģʽ�£����ܽ��ļ�����С���ļ������ʱ��ͬʱ����Ϊ0��*/
    HI_BOOL			bRewind;			       /**<Whether to rewind, static attribute. If this item is set to HI_TRUE, the PVR rewinds to the file header to record streams after the recorded file size reaches u64MaxFileSize. If this item is set to HI_FALSE, the PVR stops recording after the recorded file size reaches u64MaxFileSize.*/
								       /**<CNcomment: �Ƿ���ƣ���̬���ԡ�������ΪHI_TRUE��¼���ļ���С����u64MaxFileSize�󣬻���Ƶ��ļ�ͷ��������¼�ƣ�������ΪHI_FALSE����¼���ļ���С����u64MaxFileSize�󣬻�ֹͣ¼�ơ�*/
    HI_CHAR			szFileName[PVR_MAX_FILENAME_LEN];      /**<Name of a stream file, static attribute*//**<CNcomment: �����ļ�������̬���ԡ�*/
    HI_U32			u32FileNameLen;			       /**<Length of a stream file name, static attribute. You need to set the item to strlen (szFileName).*//**<CNcomment: �����ļ������ȣ���̬���ԡ�ȡֵΪstrlen��szFileName������ */
    HI_UNF_PVR_SECURE_MODE_E	enSecureMode;			       /**<Secure channel indication*/ /**<CNcomment:��ȫͨ����ʾ*/
    HI_U32			u32Reserved;
}HI_UNF_PVR_REC_ATTR_S;

/**Status of a PVR buffer*//** CNcomment:����PVR��������״̬��Ϣ */
typedef struct hiUNF_PVR_BUF_STATUS_S
{
    HI_U32 u32BufSize;	     /**<Buffer size*//**<CNcomment: ��������С	      */
    HI_U32 u32UsedSize;	     /**<Used buffer size*//**<CNcomment: ��������ʹ�ô�С */
} HI_UNF_PVR_BUF_STATUS_S;

/**Status of a recording channel.
The following describes the relationships among u32CurTimeInMs, u32StartTimeInMs, and u32EndTimeInMs by taking examples:
1. Assume that the total recording time is 10000 ms, and no rewind occurs. In this case, u32StartTimeInMs is 0 ms, u32EndTimeInMs is 10000 ms, and u32CurTimeInMs is 10000 ms.
2. Assume that the total recording time is 10000 ms, and rewind occurs at 8000 ms. In this case, u32StartTimeInMs is 2000 ms, u32EndTimeInMs is 10000 ms, and u32CurTimeInMs is 8000 ms.
*/
/** CNcomment:¼��ͨ��״̬���ݽṹ.
��u32CurTimeInMs��u32StartTimeInMs��u32EndTimeInMs���ߵĹ�ϵ����˵�����£�
1������ӿ�ʼ¼�ƺ�һ��¼����10000���룬���û�з������ƣ���ôu32StartTimeInMs Ϊ0��u32EndTimeInMs Ϊ10000�� u32CurTimeInMsΪ10000��
2������ӿ�ʼ¼�ƺ�һ��¼����10000���룬�����ڵ�8000�����ʱ�����˻��ƣ���ôu32StartTimeInMs Ϊ2000��u32EndTimeInMs Ϊ10000�� u32CurTimeInMsΪ8000��
*/
typedef struct hiUNF_PVR_REC_STATUS_S
{
    HI_UNF_PVR_REC_STATE_E	enState;		 /**<Current status of a channel*//**<CNcomment: ͨ��������״̬��    */
    HI_U32			u32Reserved;		 /**<Reserved, for alignment*//**<CNcomment: �������������롣	 */
    HI_U64			u64CurWritePos;		 /**<Current recording position of file, in byte*//**<CNcomment: ��ǰ¼��д�ļ���λ�ã���λ��byte���� */
    HI_U32			u32CurWriteFrame;	 /**<Number of currently recorded frames*//**<CNcomment: ��ǰ¼�Ƶ�֡����		   */
    HI_U32			u32CurTimeInMs;		 /**<Current recording time (in ms). The value is the valid time for recording the file.*//**<CNcomment: ��ǰ¼�Ƶĺ���������ֵΪ¼���ļ���ʵ����Чʱ����*/
    HI_U32			u32StartTimeInMs;	 /**<Actual start time for recording files. Before the recording is rewound, the time is that of the first frame; after the recording is rewound, the time is the rewind time.*//**<CNcomment: ¼���ļ���ʵ����ʼ�㡣¼�ƻ���ǰ��Ϊ��һ֡ʱ�䣻¼�ƻ��ƺ�Ϊ���Ƶ��ʱ�䡣 */
    HI_U32			u32EndTimeInMs;		 /**<Time of the end frame in the recorded file. Before the recording is rewound, the time is that of the last frame.*//**<CNcomment:¼���ļ��н���֡��ʱ�䣬û�л���ǰ�����һ֡��ʱ�䡣    */
    HI_UNF_PVR_BUF_STATUS_S	stRecBufStatus;		 /**<Status of the recording channel buffer*//**<CNcomment:¼��ͨ��������״̬��	   */
}HI_UNF_PVR_REC_STATUS_S;

/** Data structures for playing */

/**Playing direction of the PVR: forward*//** CNcomment:PVR���ŷ���:��ǰ���� */
#define HI_UNF_PVR_PLAY_DIRECTION_FORWARD	      (1)
/**Playing direction of the PVR: backward*//** CNcomment: PVR���ŷ���:���󲥷� */
#define HI_UNF_PVR_PLAY_DIRECTION_BACK		      (-1)

/**Type of the playing position*//** CNcomment: ����λ������ */
typedef enum hiUNF_PVR_PLAY_POS_TYPE_E
{
  HI_UNF_PVR_PLAY_POS_TYPE_SIZE,	      /**<The playing position is expressed by size (in byte). This type is not supported currently.*//**<CNcomment: �ô�С����λ��byte����ʾλ�ã��ݲ�֧�֣� */
  HI_UNF_PVR_PLAY_POS_TYPE_TIME,	      /**<The playing position is expressed by time (in ms).*//**<CNcomment: ��ʱ�䣨��λ��ms������ʾλ�� */
  HI_UNF_PVR_PLAY_POS_TYPE_FRAME,	      /**<The playing position is expressed by the number of frames or PESs. This type is not supported currently.*//**<CNcomment: ��֡��������PES������ʾλ�ã��ݲ�֧�֣�  */
  HI_UNF_PVR_PLAY_POS_TYPE_BUTT		      /**<Invalid*//**<CNcomment:��Ч��λ������*/
} HI_UNF_PVR_PLAY_POS_TYPE_E;

/**Status of a playing channel*//** CNcomment: ����ͨ����״̬  */
typedef enum hiUNF_PVR_PALY_STATE_E
{
    HI_UNF_PVR_PLAY_STATE_INVALID,	 /**<Not initialized*//**<CNcomment: δ��ʼ��		 */
    HI_UNF_PVR_PLAY_STATE_INIT,		 /**<Initialized*//**<CNcomment: ��ʼ��		     */
    HI_UNF_PVR_PLAY_STATE_PLAY,		 /**<Normal playing*//**<CNcomment: ����������		*/
    HI_UNF_PVR_PLAY_STATE_PAUSE,	 /**<Pause*//**<CNcomment: ��ͣ		       */
    HI_UNF_PVR_PLAY_STATE_FF,		 /**<Fast forward*//**<CNcomment: ���		      */
    HI_UNF_PVR_PLAY_STATE_FB,		 /**<Fast backward*//**<CNcomment: ����		       */
    HI_UNF_PVR_PLAY_STATE_SF,		 /**<Slow forward*//**<CNcomment: ����		      */
    HI_UNF_PVR_PLAY_STATE_SB,		 /**<Slow backward*//**<CNcomment:����	       */
    HI_UNF_PVR_PLAY_STATE_STEPF,	 /**<Step forward*//**<CNcomment:��֡����	     */
    HI_UNF_PVR_PLAY_STATE_STEPB,	 /**<Step backward*//**<CNcomment: ��֡����	       */
    HI_UNF_PVR_PLAY_STATE_STOP,		 /**<Stop*//**<CNcomment: ֹͣ		      */
    HI_UNF_PVR_PLAY_STATE_BUTT		 /**<Invalid*//**<CNcomment: ��Ч��״ֵ̬	 */
} HI_UNF_PVR_PLAY_STATE_E;

/**Identifier of the playing speed*//** CNcomment: �����ٶȱ�ʶ */
typedef enum hiUNF_PVR_PLAY_SPEED_E
{
    HI_UNF_PVR_PLAY_SPEED_NORMAL	    = 1024,					/**<Normal playing speed*//**<CNcomment:�����ٶȲ��š�	  */
    HI_UNF_PVR_PLAY_SPEED_2X_FAST_FORWARD   = 2 * HI_UNF_PVR_PLAY_SPEED_NORMAL,		/**<Fast forward at two times the normal speed*//**<CNcomment:2���ٿ�š�	     */
    HI_UNF_PVR_PLAY_SPEED_4X_FAST_FORWARD   = 4 * HI_UNF_PVR_PLAY_SPEED_NORMAL,		/**<Fast forward at four times the normal speed*//**<CNcomment:4���ٿ�š�	      */
    HI_UNF_PVR_PLAY_SPEED_8X_FAST_FORWARD   = 8 * HI_UNF_PVR_PLAY_SPEED_NORMAL,		/**<Fast forward at eight times the normal speed*//**<CNcomment:8���ٿ�š�	       */
    HI_UNF_PVR_PLAY_SPEED_16X_FAST_FORWARD  = 16 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast forward at 16 times the normal speed*//**<CNcomment:16���ٿ�š�	    */
    HI_UNF_PVR_PLAY_SPEED_32X_FAST_FORWARD  = 32 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast forward at 32 times the normal speed*//**<CNcomment:32���ٿ�š�	    */
    HI_UNF_PVR_PLAY_SPEED_64X_FAST_FORWARD  = 64 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast forward at 64 times the normal speed*//**<CNcomment:64���ٿ�š�	    */
    HI_UNF_PVR_PLAY_SPEED_1X_FAST_BACKWARD  = -1 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at 1 times the normal speed, not support*//**<CNcomment:1���ٵ������ݲ�֧�֡� */
    HI_UNF_PVR_PLAY_SPEED_2X_FAST_BACKWARD  = -2 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at two times the normal speed*//**<CNcomment:2���ٿ��ˡ�	      */
    HI_UNF_PVR_PLAY_SPEED_4X_FAST_BACKWARD  = -4 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at four times the normal speed*//**<CNcomment:4���ٿ��ˡ�	       */
    HI_UNF_PVR_PLAY_SPEED_8X_FAST_BACKWARD  = -8 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at eight times the normal speed*//**<CNcomment:8���ٿ��ˡ�		*/
    HI_UNF_PVR_PLAY_SPEED_16X_FAST_BACKWARD = -16 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at 16 times the normal speed*//**<CNcomment:16���ٿ��ˡ�	     */
    HI_UNF_PVR_PLAY_SPEED_32X_FAST_BACKWARD = -32 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at 32 times the normal speed*//**<CNcomment:32���ٿ��ˡ�	     */
    HI_UNF_PVR_PLAY_SPEED_64X_FAST_BACKWARD = -64 * HI_UNF_PVR_PLAY_SPEED_NORMAL,	/**<Fast backward at 64 times the normal speed*//**<CNcomment:64���ٿ��ˡ�	     */

    HI_UNF_PVR_PLAY_SPEED_2X_SLOW_FORWARD   = HI_UNF_PVR_PLAY_SPEED_NORMAL / 2,		/**<Slow forward at 1/2 times the normal speed*//**<CNcomment:1/2�������š�	     */
    HI_UNF_PVR_PLAY_SPEED_4X_SLOW_FORWARD   = HI_UNF_PVR_PLAY_SPEED_NORMAL / 4,		/**<Slow forward at 1/4 times the normal speed*//**<CNcomment:1/4�������š�	     */
    HI_UNF_PVR_PLAY_SPEED_8X_SLOW_FORWARD   = HI_UNF_PVR_PLAY_SPEED_NORMAL / 8,		/**<Slow forward at 1/8 times the normal speed*//**<CNcomment:1/8�������š�	     */
    HI_UNF_PVR_PLAY_SPEED_16X_SLOW_FORWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / 16,	/**<Slow forward at 1/16 times the normal speed*//**<CNcomment:1/16�������š�	      */
    HI_UNF_PVR_PLAY_SPEED_32X_SLOW_FORWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / 32,	/**<Slow forward at 1/32 times the normal speed*//**<CNcomment:1/32�������š�	      */
    HI_UNF_PVR_PLAY_SPEED_64X_SLOW_FORWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / 64,	/**<Slow forward at 1/64 times the normal speed*//**<CNcomment:1/64�������š�	      */
    HI_UNF_PVR_PLAY_SPEED_2X_SLOW_BACKWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-2),	/**<Slow backward at two times the normal speed. This mode is not supported currently.*//**<CNcomment:2�������ˣ��ݲ�֧�֡�  */
    HI_UNF_PVR_PLAY_SPEED_4X_SLOW_BACKWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-4),	/**<Slow backward at four times the normal speed. This mode is not supported currently.*//**<CNcomment:4�������ˣ��ݲ�֧�֡�  */
    HI_UNF_PVR_PLAY_SPEED_8X_SLOW_BACKWARD  = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-8),	/**<Slow backward at eight times the normal speed. This mode is not supported currently.*//**<CNcomment:8�������ˣ��ݲ�֧�֡�  */
    HI_UNF_PVR_PLAY_SPEED_16X_SLOW_BACKWARD = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-16),	/**<Slow backward at 16 times the normal speed. This mode is not supported currently.*//**<CNcomment:16�������ˣ��ݲ�֧�֡� */
    HI_UNF_PVR_PLAY_SPEED_32X_SLOW_BACKWARD = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-32),	/**<Slow backward at 32 times the normal speed. This mode is not supported currently.*//**<CNcomment:32�������ˣ��ݲ�֧�֡� */
    HI_UNF_PVR_PLAY_SPEED_64X_SLOW_BACKWARD = HI_UNF_PVR_PLAY_SPEED_NORMAL / (-64),	/**<Slow backward at 64 times the normal speed. This mode is not supported currently.*//**<CNcomment:64�������ˣ��ݲ�֧�֡� */
    HI_UNF_PVR_PLAY_SPEED_BUTT								/**<Invalid value*//**<CNcomment:��Ч���ٶ�ֵ��		*/
} HI_UNF_PVR_PLAY_SPEED_E;

/**Trick mode*//** CNcomment: �ؼ����ŵ�ģʽ  */
typedef struct hiUNF_PVR_PLAY_MODE_S
{
    HI_UNF_PVR_PLAY_SPEED_E		  enSpeed;    /**<For details about the playing speed, see the description of HI_UNF_PVR_PLAY_SPEED_E.*//**<CNcomment: �ٶȣ���HI_UNF_PVR_PLAY_SPEED_E�Ķ��� */
}HI_UNF_PVR_PLAY_MODE_S;

typedef enum hiUNFPVR_TRICKPLAYTOEND_ACTION_E
{
    HI_UNF_PVR_TRICKPLAYTOEND_ACTION_STOP = 0, /**report event and stop channel when fast forward to end of the file or fast backward to the start**//**<CNcomment:�����β����˵�ͷ���ϱ��¼���ֹͣ����ͨ��**/
    HI_UNF_PVR_TRICKPLAYTOEND_ACTION_PLAY,     /**report event and switch to normal play when fast forward to end of the file or fast backward to the start**//**<CNcomment:�����β����˵�ͷ���ϱ��¼����л�����������**/
    HI_UNF_PVR_TRICKPLAYTOEND_ACTION_BUTT	 /**Invalid option**//**<CNcomment:�Ƿ�ѡ��**/
}HI_UNF_PVR_TRICKPLAYTOEND_ACTION_E;

/**Attributes of a playing channel*//** CNcomment:����ͨ������ */
typedef struct hiUNF_PVR_PLAY_ATTR_S
{
    HI_UNF_PVR_STREAM_TYPE_E	    enStreamType;			  /**<Type of the played stream, static attributes. At present, only the TS is supported.*//**<CNcomment: �����������ͣ�Ŀǰֻ֧��TS����̬���ԡ�*/
    HI_BOOL			    bIsClearStream;			  /**<Whether the stream to be played is the clear stream, static attribute. Scrambled streams can be played in normal mode only rather than in trick mode.*//**<CNcomment: �����ŵ������Ƿ���������̬���ԡ���������֧���ؼ����ţ�ֻ֧���������� */
    HI_UNF_PVR_CIPHER_S		    stDecryptCfg;			  /**<Decryption configuration, static attribute		  *//**<CNcomment: �������ã���̬���ԡ�			 */
    HI_CHAR			    szFileName[PVR_MAX_FILENAME_LEN];	  /**<Name of the file that contains the streams to be played, static attribute	       *//**<CNcomment: �������������ļ�������̬���ԡ�	      */
    HI_U32			    u32FileNameLen;			  /**<Length of the file name, static attribute. You need to set the item to strlen (szFileName).*//**<CNcomment: �ļ������ȣ���̬���ԡ�ȡֵΪstrlen��szFileName������ */
    HI_UNF_PVR_SECURE_MODE_E	    enSecureMode;			  /**<Secure channel indication*/ /**<CNcomment:��ȫͨ����ʾ*/
    HI_UNF_PVR_TRICKPLAYTOEND_ACTION_E	enTrickPlayToEndAction;		    /**option for timeshift play, reference the HI_UNF_PVR_TRICKPLAYTOEND_ACTION_E**//**<CNcomment:ʱ�Ʋ���ѡ������β����˵�ͷ��ȡ�Ķ���**/
}HI_UNF_PVR_PLAY_ATTR_S;


/**Description of the playing position*//** CNcomment: ����λ������  */
typedef struct hiUNF_PVR_PLAY_POSITION_S
{
    HI_UNF_PVR_PLAY_POS_TYPE_E	enPositionType;	      /**<Position type*//**<CNcomment: λ�����͡�	     */
    HI_S32			s32Whence;	      /**<Offset type, including SEEK_SET, SEEK_CUR, or SEEK_END*//**<CNcomment:ƫ�����ͣ�ȡֵ��ΧΪSEEK_SET/SEEK_CUR/SEEK_END��*/
    HI_S64			s64Offset;	      /**<Offset. If the offset type is time, the offset is in the unit of millisecond; if the offset type is frame, the offset is in the unit of frame.*//**<CNcomment:ƫ�ơ� ƫ������Ϊʱ��ʱ����λ���룻ƫ������Ϊ֡ʱ����λΪһ֡ */
}HI_UNF_PVR_PLAY_POSITION_S;

/**Information required for creating an index file*//** CNcomment: ���������ļ���Ҫ����Ϣ */
typedef struct hiUNF_PVR_GEN_IDX_ATTR_S
{
    HI_U32			u32UsrDataInfoLen;	   /**<Length of the user data*//**<CNcomment: �û����ݳ��� */
    HI_U32			u32IdxPid;		   /**<Index PID*//**<CNcomment: ����ĸ�Pid�������� */
    HI_UNF_PVR_REC_INDEX_TYPE_E enIdxType;		   /**<Index type*//**<CNcomment: �������� */
}HI_UNF_PVR_GEN_IDX_ATTR_S;

/**Status of a playing channel*//** CNcomment:����ͨ����״̬ */
typedef struct hiUNF_PVR_PLAY_STATUS_S
{
    HI_UNF_PVR_PLAY_STATE_E	enState;			      /**<Status of a playing channel*//**<CNcomment:����ͨ��״̬��				     */
    HI_UNF_PVR_PLAY_SPEED_E	enSpeed;			      /**<Playing speed of a playing channel*//**<CNcomment: ����ͨ���Ĳ����ٶȡ�			     */
    HI_U64			u64CurPlayPos;			      /**<Start position (byte) of the current frame in the file*//**<CNcomment:��ǰ����֡����ʼ���ļ��е�λ�ã�byte������	*/
    HI_U32			u32CurPlayFrame;		      /**<Start position (number of frames or PESs) of the current frame in the file*//**<CNcomment:��ǰ����֡���ļ��е�λ�ã�֡������PES����	    */
    HI_U32			u32CurPlayTimeInMs;		      /**<PTS of the current frame, in ms*//**<CNcomment: ��ǰ����֡��PTS, ��λ���롣			  */
}HI_UNF_PVR_PLAY_STATUS_S;

/**<Data file attribution *//** CNcomment:�����ļ�����*/
typedef struct hiUNF_PVR_DATA_ATTR_S
{
    HI_U32     u32ChnID;			      /**<PVR channel, just consider one channel*//**<CNcomment: PVRͨ�������ڿ���ֻ����һ��ͨ������� */
    HI_CHAR    CurFileName[PVR_MAX_FILENAME_LEN];     /**<Current reading file 's name include direction.If there are multi-node, the file name maybe different*//**<CNcomment: ��ǰ���ڶ�ȡ���ļ�������������·��������ڵ�����£����ļ����п��ܻ�䡣  */
    HI_CHAR    IdxFileName[PVR_MAX_FILENAME_LEN+5];
    HI_U64     u64FileStartPos;			      /**<Position of start frame ,it should be considered if rewind record ,0 invalid*//**<CNcomment:�ļ��Ŀ�ʼλ�ã���Ҫ���ļ����ص��������Ҫ����,Ϊ0ʱ��ʾ��Ч  */
    HI_U64     u64FileEndPos;			      /**<Position of end frame ,it should be considered if rewind record ,0 invalid*//**<CNcomment:�ļ��Ľ���λ�ã���Ҫ���ļ����ص��������Ҫ����,Ϊ0ʱ��ʾ��Ч   */
    HI_U64     u64GlobalOffset;
    HI_U64     u64FileReadOffset;
} HI_UNF_PVR_DATA_ATTR_S;

/**<Read or write data extra callback *//** CNcomment:�ⲿ����д���ݻص�����*/
typedef enum hiUNF_PVR_EXTRA_CALLBACK_E
{
    HI_UNF_PVR_EXTRA_READ_CALLBACK,	     /**<Read data callback *//**<CNcomment:�����ݻص�����*/
    HI_UNF_PVR_EXTRA_WRITE_CALLBACK,	     /**<Write data callback*//**<CNcomment:д���ݻص�����*/
    HI_UNF_PVR_EXTRA_CALLBACK_BUTT	     /**<Invalid*//**<CNcomment: ��Ч��״ֵ̬	     */
} HI_UNF_PVR_EXTRA_CALLBACK_E;

/**<Read or write data extra callback type *//** CNcomment:�ⲿ����д���ݻص���������*/
typedef HI_S32 ( *ExtraCallBack)(HI_UNF_PVR_DATA_ATTR_S *pstDataAttr, HI_U8 *pu8DataAddr, HI_U32 u32PhyAddr, HI_U32 u32Offset, HI_U32 u32DataSize);
typedef HI_S32 ( *ExtendCallBack)(HI_UNF_PVR_DATA_ATTR_S *pstDataAttr, HI_U8 *pu8DataAddr, HI_U32 u32PhyAddr, HI_U32 u32Offset, HI_U32 u32DataSize, HI_VOID *pUserData);

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     PVR  */
/** @{ */  /** <!-- [PVR]*/

/***** Application programming interfaces (APIs) for the PVR recoding module*****/

/**
\brief Initializes the PVR recording module. CNcomment:��ʼ��PVR¼��ģ�� CNend
\attention \n
If you initialize the PVR recording module repeatedly, the error code HI_SUCCESS is returned.
Before using the APIs of the PVR recording module, you must call this API. Otherwise, other APIs are unavailable.
CNcomment: �ظ���ʼ�����سɹ�.
ÿ������ʹ��PVR¼��ģ��ӿ�ǰ�������ȵ��ô˽ӿڣ����������ӿھ��޷�ʹ�� CNend
\param N/A CNcomment: �� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_FAILURE This API fails to be called due to system errors. CNcomment: ����ϵͳ����API����ʧ�� CNend
\see \n
::HI_UNF_PVR_RecDeInit
*/
HI_S32 HI_UNF_PVR_RecInit(HI_VOID);

/**
\brief Deinitializes the PVR recording module. CNcomment: ȥ��ʼ��PVR¼��ģ�� CNend
\attention \n
If you deinitialize the PVR recording module repeatedly, the error code HI_SUCCESS is returned.\n
Before deintializing the PVR recording module, you must release all the recording channels. Otherwise,
the error code HI_ERR_PVR_BUSY is returned.
CNcomment:�ظ�ȥ��ʼ�����سɹ�\n
ȥ��ʼ��PVR¼��ģ��ǰ��ر�֤������������¼��ͨ�����Ѿ��ͷţ��������¼��ͨ��û���ͷţ��˽ӿڽ��᷵�ش�����HI_ERR_PVR_BUSY CNend
\param N/A CNcomment:�� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_FAILURE This API fails to be called due to system errors.CNcomment: ����ϵͳ����API����ʧ�� CNend
\retval ::HI_ERR_PVR_BUSY  The PVR recording module is being used. CNcomment: ¼��ģ�黹��ʹ���� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized. CNcomment: ¼��ģ��δ��ʼ�� CNend
\see \n
::HI_UNF_PVR_RecInit
*/
HI_S32 HI_UNF_PVR_RecDeInit(HI_VOID);

/**
\brief Creates a recording channel. CNcomment: ����1·¼��ͨ�� CNend
\attention \n
The PVR recording module automatically generates an .idx index file based on the file name specified in pAttr. \n
The PVR recording module splits the recorded streams files to ensure that the size of each file is not greater than 4 GB (the size of each file is about 3.99 GB). \n
The names of streams files are szFileName, szFileName.0001, szFileName.0002, szFileName.0003, szFileName.0004.\n
If the file specified in pAttr already exists, it is replaced.\n
If the index file to be created by the PVR recording module already exists, the file is also replaced.\n
If the PVR calls the APIs of other modules (such as the APIs of the audio module, video module, and DEMUX module), the error codes of other modules may be returned.\n
the error codes of other modules may be returned. For details, see the definitions of the error codes of corresponding modules.This description is applicable to the following APIs.
This description is applicable to the following APIs.
CNcomment:PVR¼��ģ������pAttr��ָ�����ļ����Զ�����һ����׺��Ϊ".idx"�����ļ�\n
PVR¼��ģ����¼�Ƶ������ļ����зָ��ȷ�������ļ�������4G�Ĵ�С��ÿ���ļ��Ĵ�СԼΪ3.99G����
���ɵ������ļ�����ΪszFileName��szFileName.0001��szFileName.0002��szFileName.0003��szFileName.0004������\n
���pAttr��ָ�����ļ��Ѿ����ڣ���ô����ļ��ᱻ����\n
���PVR¼��ģ�齫Ҫ�����������ļ��Ѿ����ڣ��������ļ�Ҳ�ᱻ����\n
����PVRʹ�õ�������ģ���API�ӿں�������������ƵAPI�ӿں�DEMUX API�ӿڣ�����˷��صĴ������п���������ģ��Ĵ����룬
���������ֵ��ο���Ӧģ�������ֵ���塣���������API���������д������	 CNend
\param[in] pu32ChnID   ID of the obtained recording channel  CNcomment: ��ȡ����¼��ͨ��ID CNend
\param[in] pstRecAttr  Pointer to the attributes of a channel	CNcomment:ָ�����ͣ�ָ��ͨ���������� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized.  CNcomment:¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_NUL_PTR The pointer is null. CNcomment: ָ�����Ϊ�� CNend
\retval ::HI_ERR_PVR_INVALID_PARA  The parameter is invalid.  CNcomment:  �����Ƿ� CNend
\retval ::HI_ERR_PVR_FILE_INVALID_FNAME	 The file name is invalid.  CNcomment:�ļ��������Ƿ� CNend
\retval ::HI_ERR_PVR_FILE_EXIST The file already exists.  CNcomment:�ļ��Ѿ����� CNend
\retval ::HI_ERR_PVR_NO_CHN_LEFT  There is no available channel.   CNcomment:�Ѿ�û�п��е�ͨ�������� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN  The file cannot be opened.	 CNcomment: �޷����ļ� CNend
\retval ::HI_ERR_PVR_INDEX_CANT_MKIDX  The index file cannot be opened.	 CNcomment: �޷��������ļ� CNend
\retval ::HI_ERR_PVR_REC_INVALID_DMXID The DEMUX ID received during recording is incorrect.  CNcomment: ¼��ʱ�����˴����DEMUX ID CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RecCreateChn(HI_U32 *pu32ChnID, const HI_UNF_PVR_REC_ATTR_S *pstRecAttr);

/**
\brief	Releases a specified recording channel. CNcomment: �ͷ�ָ����¼��ͨ�� CNend
\attention \n
CNcomment:If the channel to be released is not stopped, the error code HI_ERR_PVR_BUSY is returned.
������ͷŵ�ͨ��û��ֹͣ�������ش�����::HI_ERR_PVR_BUSY CNend
\param[in] u32ChnID   ID of the channel to be released CNcomment: ��Ҫ�ͷŵ�ͨ���� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized. CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The channel ID is invalid.	CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_BUSY  The current operation is forbidden because the channel is busy. CNcomment: ͨ��æ�����������е�ǰ���� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RecDestroyChn(HI_U32 u32ChnID);

/**
\brief Sets the attributes of a recording channel. CNcomment: ����¼��ͨ������ CNend
\attention \n
You can modify only the dynamic attributes by calling this API.
CNcomment:ֻ�ж�̬���Բ����ô˽ӿڸı����ã�����Ŀǰ���Զ��Ǿ�̬�ģ����Դ˽ӿ���ʱ��֧�ֹ������� CNend
\param[in] u32ChnID   Channel ID CNcomment: ͨ���� CNend
\param[in] pstRecAttr  Attribute to be set  CNcomment:�����õ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized. CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The channel ID is invalid.	CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT  The function is not supported. CNcomment:���ܲ�֧�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RecSetChn(HI_U32 u32ChnID, const HI_UNF_PVR_REC_ATTR_S *pstRecAttr);

/**
\brief Obtains the attributes of a recording channel. CNcomment: ��ȡ¼��ͨ������ CNend
\attention \n
N/A
\param[in] u32ChnID   Channel ID CNcomment: ͨ���� CNend
\param[out] pstRecAttr	 Pointer to the obtained channel attributes   CNcomment:ָ�����ͣ�ָ���ȡ����ͨ���������� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	 The PVR recording module is not initialized.  CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The channel ID is invalid.	CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_NUL_PTR	    The pointer is null.  CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT  The specified channel is not initialized.   CNcomment:ָ����ͨ��δ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RecGetChn(HI_U32 u32ChnID, HI_UNF_PVR_REC_ATTR_S *pstRecAttr);

/**
\brief Starts a recording channel. CNcomment:����¼��ͨ�� CNend
\attention \n
N/A
\param[in] u32ChnID Channel ID	 CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	The PVR recording module is not initialized. CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID    The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   The specified channel is not initialized.  CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY	   The specified channel has been started.  CNcomment: ָ����ͨ���Ѿ����� CNend
\retval ::HI_FAILURE		     This API fails to be called due to system errors.	CNcomment:����ϵͳ����API����ʧ�� CNend
\see \n
::HI_UNF_PVR_RecStopChn
*/
HI_S32 HI_UNF_PVR_RecStartChn(HI_U32 u32ChnID);

/**
\brief Stops a recording channel. CNcomment: ֹͣ¼��ͨ�� CNend
\attention \n
If a recording channel is working in time-shift playing mode, the channel cannot be stopped until the time-shift operation stops.
In this case, the error code HI_ERR_PVR_BUSY is returned if you call this API.
CNcomment:���1��¼��ͨ�����ڽ���ʱ�Ʋ��Ų���������ֹͣʱ�Ʋ���֮ǰ��������ֹͣ��¼��ͨ�� \n
�����ͨ�����ڽ���ʱ�Ʋ��Ų����������ش�����HI_ERR_PVR_BUSY CNend
\param[in] u32ChnID   Channel ID  CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	 The PVR recording module is not initialized.  CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID     The channel ID is invalid.    CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT     The specified channel is not initialized. CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY	     The specified channel has been stopped.	CNcomment:ָ����ͨ���Ѿ�ֹͣ CNend
\retval ::HI_ERR_PVR_BUSY	     The current operation is forbidden because the channel is busy. CNcomment:ͨ��æ�����������е�ǰ���� CNend
\see \n
::HI_UNF_PVR_RecStartChn
*/
HI_S32 HI_UNF_PVR_RecStopChn(HI_U32 u32ChnID);

/**
\brief Pauses a recording channel. CNcomment: ��ͣ¼��ͨ�� CNend
\attention \n
It should be called under recording mode and can be repeated call.
CNcomment:ֻ��¼��״̬���øýӿڲ������ã������ظ����� CNend
\param[in] u32ChnID   Channel ID  CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_REC_INVALID_STATE	PVR isn't playing or pausing. CNcomment: PVR�ǲ��Ż�����ͣ״̬ CNend
\see \n
::HI_UNF_PVR_RecResumeChn
*/
HI_S32 HI_UNF_PVR_RecPauseChn(HI_U32 u32ChnID);

/**
\brief Resumes a recording channel. CNcomment: �ָ�¼��ͨ�� CNend
\attention \n
It should be called under recording mode and can be repeated call.
CNcomment:ֻ��¼��״̬���øýӿڲ������ã������ظ����� CNend
\param[in] u32ChnID   Channel ID  CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_REC_INVALID_STATE	PVR isn't playing or paused.CNcomment: PVR�ǲ��Ż�����ͣ״̬ CNend
\see \n
::HI_UNF_PVR_RecPauseChn
*/
HI_S32 HI_UNF_PVR_RecResumeChn(HI_U32 u32ChnID);

/**
\brief Obtains the status of a recording channel.CNcomment:  ��ȡ¼��ͨ��״̬ CNend
\attention \n
N/A
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[out] pstRecStatus   Pointer to the recording status   CNcomment:¼��״̬��Ϣָ�� CNend
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	 The PVR recording module is not initialized.  CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID   The channel ID is invalid.	  CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT    The specified channel is not initialized.	CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_NUL_PTR	    The pointer is null. CNcomment:ָ�����Ϊ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RecGetStatus(HI_U32 u32ChnID, HI_UNF_PVR_REC_STATUS_S *pstRecStatus);


/***** APIs for the PVR playing module *****/
/**
\brief Initializes the PVR playing module. CNcomment: ��ʼ��PVR����ģ�� CNend
\attention \n
If you initialize the PVR playing module repeatedly, the error code HI_SUCCESS is returned.\n
Before using the APIs of the PVR playing module, you must call this API. Otherwise, other APIs are unavailable.
CNcomment:�ظ���ʼ�����سɹ� \n
ÿ������ʹ��PVR����ģ��ӿ�ǰ�������ȵ��ô˽ӿڣ����������ӿھ��޷�ʹ�� CNend
\param N/A
\retval ::HI_SUCCESS	     Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	       This API fails to be called due to system errors.    CNcomment:����ϵͳ����API����ʧ�� CNend
\see \n
::HI_UNF_PVR_PlayDeInit
*/
HI_S32 HI_UNF_PVR_PlayInit(HI_VOID);

/**
\brief Deinitializes the PVR playing module.  CNcomment:ȥ��ʼ��PVR����ģ�� CNend
\attention \n
If you deinitialize the PVR recording module repeatedly, the error code HI_SUCCESS is returned.\n
Before deintializing the PVR playing module, you must release all the playing channels. Otherwise, the error code HI_ERR_PVR_BUSY is returned.
CNcomment:�ظ�ȥ��ʼ�����سɹ� \n
ȥ��ʼ��PVR����ģ��ǰ��ر�֤�����������в���ͨ�����Ѿ��ͷţ�������в���ͨ��û���ͷţ��˽ӿڽ��᷵�ش�����::HI_ERR_PVR_BUSY CNend
\param N/A
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_FAILURE	      This API fails to be called due to system errors.	  CNcomment: ����ϵͳ����API����ʧ�� CNend
\retval ::HI_ERR_PVR_BUSY  The PVR playing module is being used.  CNcomment: PVR����ģ�黹��ʹ���� CNend
\retval ::HI_ERR_PVR_NOT_INIT	The PVR recording module is not initialized.CNcomment:	PVR¼��ģ��δ��ʼ�� CNend
\see \n
::HI_UNF_PVR_PlayInit
*/
HI_S32 HI_UNF_PVR_PlayDeInit(HI_VOID);

/**
\brief Creates a playing channel. CNcomment:����1·����ͨ�� CNend
\attention \n
The PVR playing module automatically searches for an .idx index file based on the file name specified in pAttr.
If the index file does not exist, the PVR playing module attempts to play the stream file, but cannot support some features,
such as fast forward, fast backward, or seek. The features vary according to versions of the software developer's kit (SDK).
Only the playing function is supported in the current version.
The played file may be the file that is being recorded (that is, time-shift playing).
The audio/video player (AVPLAY) indicated by hAVPLAY must be stopped.
CNcomment:PVR����ģ������pAttr��ָ�����ļ����Զ�Ѱ�Һ�׺��Ϊ".idx"�������ļ� \n
��������ļ������ڣ�PVR����ģ��Ҳ�᳢�Բ�������ļ������ǿ����޷�֧��ĳЩ���ԣ�
���������˻���SEEK���������ݰ汾�Ĳ�ͬ��������𣬵�ǰ�汾ֻ֧�ֲ��ţ�\n
���ŵ��ļ�����������¼�Ƶ��ļ���������ʱ�Ʋ��ţ�
hAVPlay��������avplay���봦��stop״̬�� CNend
\param[out] pu32ChnID  ID of the obtained playing channel  CNcomment: ��ȡ���Ĳ���ͨ��ID CNend
\param[in] pstPlayAttr	Pointer to the channel attributes CNcomment: ͨ����������ָ�� CNend
\param[in] hAvplay	AVPLAY handle. It specifies the APVPLAY to be used. CNcomment: avplay�������ʶ���ĸ�avplay������ CNend
\param[in] hTsBuffer  TS buffer handle. It specifies that TS buffer that is used for playback. In general, the TS port corresponding to the TS buffer must be attached to the DEMUX corresponding to the AVPLAY.
tCNcomment:s buffer�������ʶ���ĸ�ts buffer���طţ�һ����˵����ts buffer��Ӧ��ts�˿�Ӧ���ǰ���hAVPlay��Ӧ��demux�ϵ� CNend
\retval ::HI_SUCCESS   Success	CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	    The PVR recording module is not initialized.  CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_NUL_PTR		The pointer is null. CNcomment:	 ָ�����Ϊ�� CNend
\retval ::HI_ERR_DMX_INVALID_PARA	 The parameter is invalid.  CNcomment: �����Ƿ� CNend
\retval ::HI_ERR_PVR_FILE_INVALID_FNAME	  The file name is invalid.   CNcomment:�ļ��������Ƿ� CNend
\retval ::HI_ERR_PVR_FILE_EXIST		 The file already exists.  CNcomment:�ļ��Ѿ����� CNend
\retval ::HI_ERR_PVR_NO_CHN_LEFT	There is no available channel. CNcomment:  �Ѿ�û�п��е�ͨ�������� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN	 The file cannot be opened.   CNcomment:  �޷����ļ� CNend
\retval ::HI_ERR_PVR_FILE_NOT_EXIST	 The file cannot be played because it does not exist. CNcomment: �ļ������ڣ��޷����� CNend
\retval ::HI_ERR_PVR_NO_MEM		The buffer required for playing cannot be allocated due to insufficient memory. CNcomment: �ڴ治�㣬�޷����䲥����Ҫ��Buffer CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ   The file cannot be read.	CNcomment:   �ļ���ȡ���� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayCreateChn(HI_U32 *pu32ChnID, const HI_UNF_PVR_PLAY_ATTR_S *pstPlayAttr, HI_HANDLE hAvplay, HI_HANDLE hTsBuffer);

/**
\brief Releases a specified playing channel. CNcomment:�ͷ�ָ���Ĳ���ͨ�� CNend
\attention \n
If the channel to be released is not stopped, the error code HI_ERR_PVR_BUSY is returned.
CNcomment:������ͷŵ�ͨ��û��ֹͣ�������ش�����::HI_ERR_PVR_BUSY CNend
\param[in] u32ChnID  ID of the channel to be released CNcomment:��Ҫ�ͷŵ�ͨ���� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	  The PVR recording module is not initialized.	 CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	 The channel ID is invalid.  CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_BUSY  The current operation is forbidden because the channel is busy.  CNcomment: ͨ��æ�����������е�ǰ���� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayDestroyChn(HI_U32 u32ChnID);

/**
\brief
Starts a time-shift playing channel.
You can call this API to start a time-shift playing channel based on the entered IDs of recording channels. To be specific, this API automatically initializes a playing channel to play files based on the parameter configuration of the corresponding recording channel.
CNcomment:����ʱ�Ʋ���ͨ�������ô˽ӿڿ��Ը��������¼��ͨ���ţ�����1·ʱ�Ʋ��š��˽ӿڽ����ݶ�Ӧ¼��ͨ���Ĳ����Զ���ʼ��1������ͨ��������ʼ���� CNend
\attention \n
This API is not recommended. It is used to be compatible with other interfaces. You are recommended to call HI_UNF_PVR_PlayCreateChn and HI_UNF_PVR_PlayStartChn in sequence to start to play. If you want to enable the time-shift playing mode,
you only need to set same names for the file to be played and recorded file. Then the PVR automatically identifies the same names, and enters the time-shift playing mode.
After HI_UNF_PVR_PlayStartTimeShift is called, HI_UNF_PVR_PlayCreateChn is automatically called to allocate a playing channel. Therefore, you do not need to call HI_UNF_PVR_PlayNewChn.\n
In addition, before calling HI_UNF_PVR_PlayStartTimeShift, you must start the corresponding recording channel. Otherwise, the error code HI_ERR_PVR_REC_INVAL_STATE is returned.\n
After you start a time-shift playing channel by calling this API, the corresponding recording channel cannot be stopped or destroyed until time-shift playing stops.
CNcomment:���Ƽ�ʹ�ô˽ӿڣ������˽ӿ�ֻ��Ϊ�˱������Ͻӿڵļ��ݣ��Ƽ�ʹ��HI_UNF_PVR_PlayCreateChn���ٵ���HI_UNF_PVR_PlayStartChn�������ţ����Ҫ����ʱ�ƣ�
ֻ��Ҫ���ò��ŵ��ļ�����¼�Ƶ��ļ���һ�����ɣ�PVR���Զ�ʶ����ͬ���ļ���������ʱ��״̬��
���ô˽ӿڿ���ֱ������1·ʱ�Ʋ��ţ��ӿ��ڲ����Զ�����HI_UNF_PVR_PlayCreateChn���䲥��ͨ�����û�����Ҫ���ȵ���HI_UNF_PVR_PlayCreateChn��������ͨ�� \n
���ô˽ӿ�ǰ��ȷ����Ӧ��¼��ͨ���Ѿ����������򽫻᷵�ش�����HI_ERR_PVR_REC_INVAL_STATE \n
���ô˽ӿ�����1·ʱ�ƺ󣬶�Ӧ��¼��ͨ�������ܱ�ֹͣ��������ֱ��ʱ�Ʋ���ֹͣ CNend
\param[out] pu32PlayChnID   ID of a playing channel CNcomment:����ͨ���� CNend
\param[in] u32RecChnID	  ID of the recording channel to be time-shifted CNcomment: ��Ҫʱ�Ƶ�¼��ͨ���� CNend
\param[in] hAvplay     AVPLAY handle. It specifies the APVPLAY to be used.   CNcomment:avplay�������ʶ���ĸ�avplay������ CNend
\param[in] hTsBuffer	TS buffer handle. It specifies that TS buffer that is used for playback. In general, the TS port corresponding to the TS buffer must be attached to the DEMUX corresponding to the AVPLAY.
CNcomment:ts buffer�������ʶ���ĸ�ts buffer���طţ�һ����˵����ts buffer��Ӧ��ts�˿�Ӧ���ǰ���hAVPlay��Ӧ��demux�ϵ� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NUL_PTR The pointer is null.  CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_DMXID The DEMUX ID received during playing is incorrect. CNcomment:����ʱ�����˴����DEMUX ID CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid. CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT The specified channel is not initialized. CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY  The specified channel has been started. CNcomment:ָ����ͨ���Ѿ����� CNend
\retval ::HI_ERR_PVR_NO_CHN_LEFT  There is no available playing channel.CNcomment: �Ѿ�û�п��еĲ���ͨ�������� CNend
\retval ::HI_ERR_PVR_REC_INVALID_STATE	The recording channel is not started.CNcomment:	 ¼��ͨ��û������ CNend
\retval ::HI_ERR_PVR_NO_MEM   The buffer required for playing cannot be allocated due to insufficient memory.CNcomment: �ڴ治�㣬�޷����䲥����Ҫ��Buffer CNend
\retval ::HI_FAILURE This API fails to be called due to system errors. CNcomment:����ϵͳ����API����ʧ�� CNend
\see \n
::HI_UNF_PVR_PlayStopTimeShift
*/
HI_S32 HI_UNF_PVR_PlayStartTimeShift(HI_U32 *pu32PlayChnID, HI_U32 u32RecChnID, HI_HANDLE hAvplay, HI_HANDLE hTsBuffer);

/**
\brief Stops a playing channel.	 CNcomment:ֹͣ����ͨ�� CNend
\attention \n
This API must work with ::HI_UNF_PVR_PlayStartTimeShift, and this API can be only used to stop the playing channel that is started by calling ::HI_UNF_PVR_PlayStartTimeShift.
You must call ::HI_UNF_PVR_PlayStopTimeShift rather than ::HI_UNF_PVR_PlayStopChn to stop the playing channel that is started by calling ::HI_UNF_PVR_PlayStartTimeShift.

CNcomment:�˽ӿ���::HI_UNF_PVR_PlayStartTimeShift�ӿڱ������ʹ�ã��˽ӿ�ֻ��ֹͣʹ��::HI_UNF_PVR_PlayStartTimeShift�����Ĳ���ͨ�� \n
ͨ��::HI_UNF_PVR_PlayStartTimeShift�ӿ������Ĳ���ͨ������ʹ�ô˽ӿ���ֹͣ������������::HI_UNF_PVR_PlayStopChn�ӿ���ֹͣ CNend
\param[in] u32PlayChnID Channel ID  CNcomment:ͨ���� CNend
\param[in] pstStopOpt  Pointer to the attribute structure when the AVPLAY stops CNcomment:ֹͣ���������� CNend
\retval ::HI_SUCCESS  SuccessCNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	     The PVR recording module is not initialized. CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	  The channel ID is invalid. CNcomment:	 ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	The specified channel is not initialized.   CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY		The specified channel has been started.	 CNcomment: ָ����ͨ���Ѿ����� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE	   The channel status is incorrect. For example, you call this API to stop the playing channel that is started by calling HI_UNF_PVR_PlayStartChn.
CNcomment:ͨ��״̬�������磺����::HI_UNF_PVR_PlayStartChn�����Ĳ���ͨ�����ô˽ӿ� CNend
\see \n
::HI_UNF_PVR_PlayStartTimeShift
*/
HI_S32 HI_UNF_PVR_PlayStopTimeShift(HI_U32 u32PlayChnID, const HI_UNF_AVPLAY_STOP_OPT_S *pstStopOpt);

/**
\brief Sets the attributes of a playing channel. CNcomment:���ò���ͨ������ CNend
\attention \n
You can set the dynamic attributes only by calling this API.
CNcomment:ֻ�ж�̬���Բ���ͨ���˽ӿڽ������ã�����Ŀǰ���Ƕ�̬���ԣ����Դ˽ӿ���ʱ���ṩ���ù��ܡ� CNend
\param[in] u32ChnID    Channel ID CNcomment: ͨ���� CNend
\param[in] pstPlayAttr	Pointer to the channel attributes to be set  CNcomment:ָ�����ͣ�ָ��Ҫ���õ�ͨ���������� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized. CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT  The function is not supported. CNcomment:���ܲ�֧�� CNend
\see \n
::HI_UNF_PVR_PlayGetChn
*/
HI_S32 HI_UNF_PVR_PlaySetChn(HI_U32 u32ChnID, const HI_UNF_PVR_PLAY_ATTR_S *pstPlayAttr);

/**
\brief	Obtains the attributes of a playing channel. CNcomment:��ȡ����ͨ������ CNend
\attention \n
N/A
\param[in] u32ChnID   Channel ID CNcomment:CNcomment:ͨ���� CNend
\param[out] pstPlayAttr	  Pointer to the obtained channel attributes CNcomment:ָ�����ͣ�ָ���ȡ����ͨ���������� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	The PVR recording module is not initialized.CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID   The channel ID is invalid. CNcomment:  ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   The specified channel is not initialized. CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_NUL_PTR	  The pointer is null.	CNcomment:  ָ�����Ϊ�� CNend
\see \n
::HI_UNF_PVR_PlaySetChn
*/
HI_S32 HI_UNF_PVR_PlayGetChn(HI_U32 u32ChnID, HI_UNF_PVR_PLAY_ATTR_S *pstPlayAttr);

/**
\brief	Starts a playing channel. CNcomment:��������ͨ�� CNend
\attention \n
You can call this API to start the channel that is created by calling ::HI_UNF_PVR_PlayCreateChn only once. To pause or resume playing,
you need to call ::HI_UNF_PVR_PlayPauseChn and ::HI_UNF_PVR_PlayResumeChn respectively.
CNcomment:����::HI_UNF_PVR_PlayCreateChn�����ͨ��ֻ��ͨ���˽ӿ�����һ�Σ������Ҫ��ͣ/�ָ����ţ�
��ʹ��::HI_UNF_PVR_PlayPauseChn��::HI_UNF_PVR_PlayResumeChn�ӿ� CNend
\param[in] u32ChnID Channel ID	CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	  The PVR recording module is not initialized.	CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID     The channel ID is invalid.  CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT    The specified channel is not initialized. CNcomment:  ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY	    The specified channel has been started.   CNcomment: ָ����ͨ���Ѿ����� CNend
\retval ::HI_FAILURE		     This API fails to be called due to system errors. CNcomment: ����ϵͳ����API����ʧ�� CNend
\see \n
::HI_UNF_PVR_PlayStopChn
*/
HI_S32 HI_UNF_PVR_PlayStartChn(HI_U32 u32ChnID);

/**
\brief	Stops a playing channel. CNcomment:ֹͣ����ͨ�� CNend
\attention \n
This API must work with ::HI_UNF_PVR_PlayStartChn, and this API can be only used to stop the playing channel that is started by calling HI_UNF_PVR_PlayStartChn.
You must call ::HI_UNF_PVR_PlayStopChn rather than HI_UNF_PVR_PlayStopTimeShift to stop the playing channel that is started by calling HI_UNF_PVR_PlayStartChn.
CNcomment:�˽ӿ���::HI_UNF_PVR_PlayStartChn�ӿڱ������ʹ�ã��˽ӿ�ֻ��ֹͣʹ��::HI_UNF_PVR_PlayStartChn�����Ĳ���ͨ�� \n
ͨ��::HI_UNF_PVR_PlayStartChn�ӿ������Ĳ���ͨ������ʹ�ô˽ӿ���ֹͣ������������::HI_UNF_PVR_PlayStopTimeShift�ӿ���ֹͣ CNend
\param[in] u32ChnID  Channel ID CNcomment:ͨ���� CNend
\param[in] pstStopOpt  Pointer to the attribute structure when the AVPLAY stops	 CNcomment:ֹͣ���������� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	 The PVR recording module is not initialized. CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID     The channel ID is invalid.  CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT    The specified channel is not initialized.	CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_ALREADY	    The specified channel has been started.  CNcomment:	 ָ����ͨ���Ѿ����� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE The channel status is incorrect. For example, you call this API to stop the playing channel that is started by calling HI_UNF_PVR_PlayStartTimeShift.
CNcomment:ͨ��״̬�������磺����::HI_UNF_PVR_PlayStartTimeShift�����Ĳ���ͨ�����ô˽ӿ� CNend
\see \n
::HI_UNF_PVR_PlayStartChn
*/
HI_S32 HI_UNF_PVR_PlayStopChn(HI_U32 u32ChnID, const HI_UNF_AVPLAY_STOP_OPT_S *pstStopOpt);

/**
\brief	Pauses a playing channel. CNcomment:��ͣ����ͨ�� CNend
\attention \n
If you call this API when the channel is paused, the error code HI_SUCCESS is returned.\n
If you call this API is called when the channel is stopped, the error code HI_ERR_PVR_PLAY_INVALID_STATE is returned.
CNcomment:��ͨ���Ѿ���ͣ��������ٴε���::HI_UNF_PVR_PlayPauseChn��ͣͨ�������سɹ� \n
��ͨ���Ѿ���ֹͣ������µ��ô˽ӿ���ͣͨ�������ش�����::HI_ERR_PVR_PLAY_INVALID_STATE CNend
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS  Success CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	   The PVR recording module is not initialized. CNcomment:  PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID     The channel ID is invalid.  CNcomment:  ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	The specified channel is not initialized.  CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE	  The channel status is incorrect, that is , the channel has been stopped. CNcomment: ͨ��״̬����ͨ���Ѿ�ֹͣ���� CNend
\see \n
::HI_UNF_PVR_PlayResumeChn
*/
HI_S32 HI_UNF_PVR_PlayPauseChn(HI_U32 u32ChnID);

/**
\brief Resumes a playing channel. You can resume a playing channel or enable a playing channel to exit the pause mode by calling this API.
CNcomment:�ָ�����ͨ�������ô˽ӿڿ��Իָ�����ͨ�����������ͨ������ͣ״̬ CNend
\attention \n
This API must work with HI_UNF_PVR_PlayPauseChn. In addition, a channel can be resumed only when it is paused.
CNcomment:�˽ӿ���::HI_UNF_PVR_PlayPauseChn�ӿڱ������ʹ�ã�ֻ����ͨ���Ѿ���ͣ������²������ָ�ͨ�� CNend
\param[in] u32ChnID Channel ID	CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	    The PVR recording module is not initialized.  CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	The channel ID is invalid.   CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT     The specified channel is not initialized.	  CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE The specified channel is not paused.   CNcomment:ָ����ͨ��������ͣ״̬ CNend
\see \n
::HI_UNF_PVR_PlayPauseChn
*/
HI_S32 HI_UNF_PVR_PlayResumeChn(HI_U32 u32ChnID);

/**
\brief Starts the trick playing mode. You can call this API to start the trick playing mode. In this mode, the operations include fast forward, fast backward, slow playing, and normal playing.
CNcomment:�����ؼ����š����ô˽ӿڿ��Խ����ؼ����ţ������п�������ˡ����š��������ŵȲ��� CNend
\attention \n
If you want to switch the trick playing mode to the normal playing mode, you only need to the playing speed in trick playing mode to PVR_PLAY_SPEED_NORMAL.
CNcomment:�����ؼ�����ģʽ��������˻���������ģʽ��ֻ��Ҫ�����ؼ�����ģʽ���ٶ�ΪPVR_PLAY_SPEED_NORMAL CNend
\param[in] u32ChnID	 Channel ID CNcomment: ͨ���� CNend
\param[in] pstTrickMode	  Pointer to the information about the trick playing mode  CNcomment:�ؼ�����ģʽ��Ϣָ�� CNend
\retval ::HI_SUCCESS   Success	CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	     The PVR recording module is not initialized.   CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID     The channel ID is invalid.      CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	The specified channel is not initialized.   CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE	  The channel status is incorrect, that is , the channel has been stopped.  CNcomment:ͨ��״̬����ͨ���Ѿ�ֹͣ���� CNend
\retval ::HI_ERR_DMX_INVALID_PARA      The parameter is invalid.     CNcomment:�����Ƿ� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT    The trick playing mode is not supported.  CNcomment:��֧�ֵ��ؼ�����ģʽ CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayTPlay(HI_U32 u32ChnID, const HI_UNF_PVR_PLAY_MODE_S *pstTrickMode);

/**
\brief Seeks a specified position to play, seeks by size and frame is not supported currently. CNcomment:��λ��ָ��λ�ý��в���,�ݲ�֧�ְ��մ�С��֡�����ж�λ CNend
\attention \n
If you call this API when the channel is disabled, the error code :HI_ERR_PVR_PLAY_INVALID_STATE is returned.\n
If the sought position is out of the boundary, the position is adjusted to the boundary automatically.\n
If you seek the position backward or from the start of a file, the next I frame in the corresponding position is sought. Otherwise, the previous I frame is sought.\n
If you seek the position forward or from the end of a file, the previous I frame in the corresponding position is sought. Otherwise, the next I frame is sought.\n
If no I frame is found, an error code is returned.
CNcomment:��ͨ���Ѿ�ֹͣ������µ��ñ��ӿڽ����ش�����::HI_ERR_PVR_PLAY_INVALID_STATE\n
seekʱ��������߽磬�Զ��������߽�\n
���seek�ʹӿ�ʼseek����seek����Ӧλ�õ���һ��I֡�����ɹ�����ǰһ��I֡\n
��ǰseek�ʹӽ�βseek����seek����Ӧλ�õ�ǰһ��I֡�����ɹ�������һ��I֡\n
�Ҳ���I֡�᷵�ش��� CNend
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] pstPosition Pointer to the playing position.	 CNcomment:����λ����Ϣָ�� CNend
\retval ::HI_SUCCESS  Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	     The PVR recording module is not initialized.  CNcomment:PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	  The channel ID is invalid.   CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	The specified channel is not initialized.   CNcomment:ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE	 The channel status is incorrect, that is , the channel has been stopped.  CNcomment: ͨ��״̬����ͨ���Ѿ�ֹͣ���� CNend
\retval ::HI_ERR_DMX_INVALID_PARA	The parameter is invalid.   CNcomment: �����Ƿ� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT     The seek mode is not supported.   CNcomment:��֧�ֵ�Seekģʽ CNend
\retval ::HI_ERR_PVR_FILE_TILL_END	 No corresponding frame is sought till the end of a file.  CNcomment:Seek���ļ�βû���ҵ���Ӧ��֡ CNend
\retval ::HI_ERR_PVR_FILE_TILL_START   No corresponding frame is sought till the start of a file.    CNcomment:Seek���ļ�ͷû���ҵ���Ӧ��֡ CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ	The file cannot be read.   CNcomment:��ȡ�ļ�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlaySeek(HI_U32 u32ChnID, const HI_UNF_PVR_PLAY_POSITION_S *pstPosition);

/**
\brief Plays streams by frame. You can call this API to start step forward mode or step backward mode.
CNcomment: ��֡���š����ô˽ӿڿ��Խ�����֡���˻�����֡ǰ������ CNend
\attention \n
Step backward mode is not supported currently. CNcomment:Ŀǰ��ʱ��֧����֡���� CNend
\param[in] u32ChnID	Channel ID  CNcomment:ͨ���� CNend
\param[in] s32Direction	 Playing direction. If the value is greater than or equal to 0, the direction is forward; if the value is less than 0, the direction is backward. CNcomment:  ���ŷ��򡣴��ڵ���0��ʾǰ����С��0��ʾ���� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT	     The PVR recording module is not initialized. CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	The channel ID is invalid.    CNcomment: ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	The specified channel is not initialized.  CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_PLAY_INVALID_STATE	  The channel status is incorrect, that is , the channel has been stopped. CNcomment: ͨ��״̬����ͨ���Ѿ�ֹͣ���� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT   This function is not supported.  CNcomment:��֧�ֵĹ��� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayStep(HI_U32 u32ChnID, HI_S32 s32Direction);

/**
\brief Obtains the playing status of the PVR. CNcomment:��ȡPVR�طŵ�״̬ CNend
\attention \n
Before calling this API to obtain the playing status, you must create a player.
CNcomment:��ȡ���ŵ�״̬��ע���ڲ���������֮����� CNend
\param[in] u32ChnID
\param[in] pstStatus
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_BUSY   The system is busy. Please try again later. CNcomment:ϵͳæ��������������������ԡ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayGetStatus(HI_U32 u32ChnID, HI_UNF_PVR_PLAY_STATUS_S *pstStatus);

/**
\brief Obtains the information about the stream file recorded by the PVR based on the ID of the playing channel.  CNcomment:ͨ������ͨ��ID����ȡPVR¼�Ƶ������ļ���Ϣ CNend
\attention \n
You can call this API to obtain the fixed information about the file to be played. However, the information is variable in the time-shift scenario.
You can call ::HI_UNF_PVR_PlayGetStatus to obtain the current playing position during playing.\n
You can call ::HI_UNF_PVR_RecGetStatus to obtain the current recording position during time shifting.
In addition, if both recording and playing do not start, you can call ::HI_UNF_PVR_GetFileAttrByFileName to obtain the attributes of a file.
CNcomment: ���ô˽ӿ�������ȡ�����ļ��Ĺ̶���Ϣ�����Ƕ���ʱ�Ƴ�����Щ��Ϣ�ǲ��ϱ仯��
�ڲ��Ź����п���ͨ��::HI_UNF_PVR_PlayGetStatus�ӿڻ�ȡ��ǰ�Ĳ���λ�� \n
��ʱ�ƹ����п���ͨ��::HI_UNF_PVR_RecGetStatus�ӿڻ�ȡ��ǰ��¼��λ��
���⣬�����û������¼��Ҳû���������ţ�����ͨ��::HI_UNF_PVR_GetFileAttrByFileName�ӿڻ�ȡ�ļ����� CNend
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] pAttr Pointer to the playing status
\param[in] pAttr   CNcomment:����״̬��Ϣָ�� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT		 The PVR playing module is not initialized.  CNcomment:PVR����ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_NUL_PTR	       The pointer is null.   CNcomment: ��ָ����� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID	The channel ID is invalid.   CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT	 The specified channel is not initialized. CNcomment: ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN	 The file cannot be opened.  CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ    The file cannot be read.	  CNcomment: �޷����ļ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_PlayGetFileAttr(HI_U32 u32ChnID, HI_UNF_PVR_FILE_ATTR_S *pAttr);

/**
\brief
Obtains the information about a stream file.
By calling this API, you can obtain the information about a specified stream file without creating a playing channel.
CNcomment:��ȡ�����ļ���Ϣ�����ô˽ӿڿ����ڲ����벥��ͨ��������»�ȡָ�������ļ�����Ϣ CNend
\attention \n
pFileName points to the name of a stream file rather than an index file.\n
You can call this API to obtain the attributes of a stream file at any time.
CNcomment:ָ�������ļ��������������ļ���.�κ�ʱ�򶼿��Ե��ô˽ӿڻ�ȡ�����ļ������� CNend
\param[in] pFileName Name of a stream file  CNcomment:�����ļ��� CNend
\param[in] pAttr   Pointer to the playing status   CNcomment:����״̬��Ϣָ�� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NUL_PTR	   The pointer is null.	   CNcomment:��ָ����� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN  The file cannot be opened.	 CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ   The file cannot be read. CNcomment:�޷����ļ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_GetFileAttrByFileName(const HI_CHAR *pFileName, HI_UNF_PVR_FILE_ATTR_S *pAttr);

/**
\brief	Writes the user data. CNcomment: д���û����� CNend
\attention \n
pFileName points to the name of a stream file rather than an index file.\n
The value of u32UsrDataLen cannot be greater than that of u32UsrDataInfoSize. The value of u32UsrDataInfoSize (one of recording channel attributes) is set before a file is recorded.
The user data is saved in the index file.\n
You need to write the user data after starting a recording channel.
CNcomment:pFileNameָ�������ļ��������������ļ��� \n
u32UsrDataLen��ȡֵ���ܴ���¼�ƴ��ļ�ʱ��¼��ͨ����������ָ����u32UsrDataInfoSize��ȡֵ \n
�û����ݱ������������ļ��� \n
��������¼��ͨ������д���û�������Ϣ CNend
\param[in] pFileName Name of a stream file CNcomment: �����ļ��� CNend
\param[in] pInfo    Pointer to the user data. The memory is allocated by customers. CNcomment:�û�����ָ�룬�ռ����û����� CNend
\param[in] u32UsrDataLen   Length of the user data CNcomment: �û����ݳ��� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NUL_PTR	   The pointer is null.	  CNcomment: ��ָ����� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN   The file cannot be opened.CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ  The file cannot be read.  CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_DMX_INVALID_PARA    The parameter is invalid.	CNcomment: �����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_SetUsrDataInfoByFileName(const HI_CHAR *pFileName, HI_U8 *pInfo, HI_U32 u32UsrDataLen);

/**
\brief	Reads the user data. CNcomment: ��ȡ�û����� CNend
\attention \n
pFileName points to the name of a stream file rather than an index file.\n
The return value of pUsrDataLen indicates the length of the obtained user data. The value is the smaller one between the values of u32BufLen and actual length of the user data.
The actual length of the user data is greater than or equal to the maximum length of the user data set by calling HI_UNF_PVR_RecCreateChn. In this way, all user data can be read.\n
The PVR does not save the length of the user data set by calling HI_UNF_PVR_SetUsrDataInfoByFileName, but save the maximum length of the user data set by calling HI_UNF_PVR_RecCreateChn.
CNcomment:pFileNameָ�������ļ��������������ļ��� \n
pUsrDataLen���ض�ȡ�����û����ݵĳ��ȣ���ȡֵΪu32BufLen��"ʵ���û����ݳ���"�����еĽ�Сֵ��
"ʵ���û����ݳ���"����С��HI_UNF_PVR_RecNewChnʱ���õ�����û����ݳ��ȣ��Ա�֤�ܹ���ȫ���û����ݶ��� \n
PVRģ�鲻����HI_UNF_PVR_SetUsrDataInfoByFileNameʱ������û����ݳ��ȣ�ֻ����HI_UNF_PVR_RecNewChnʱ���õ�����û����ݳ��� CNend
\param[in] pFileName	Name of a stream file CNcomment:�����ļ��� CNend
\param[in] pInfo    User data buffer. The memory is allocated by customers.   CNcomment:�û����ݻ��������ռ����û����� CNend
\param[in] u32BufLen   Buffer length .CNcomment:���������� CNend
\param[in] pUsrDataLen Actual length of the obtained user data .CNcomment:ʵ�ʶ�ȡ�����û����ݳ��� CNend
\retval ::HI_SUCCESS  Success  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_NUL_PTR	    The pointer is null.      CNcomment: ��ָ����� CNend
\retval ::HI_ERR_PVR_FILE_CANT_OPEN    The file cannot be opened. CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_PVR_FILE_CANT_READ    The file cannot be read.	 CNcomment:�޷����ļ� CNend
\retval ::HI_ERR_DMX_INVALID_PARA      The parameter is invalid.  CNcomment: �����Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_GetUsrDataInfoByFileName(const HI_CHAR *pFileName, HI_U8 *pInfo, HI_U32 u32BufLen, HI_U32* pUsrDataLen);

/**
\brief	Registers an event callback function. You can call this API to register a callback function for PVR event. In this way, you can handle the events occurred during PVR recording and playing.
CNcomment: ע���¼��ص����������ô˽ӿڿ���ע��PVR�¼��Ļص��������Ӷ���PVR¼�ơ����Ź����в������¼����д��� CNend
\attention \n
You can call ::HI_UNF_PVR_UnRegisterEvent to deregister an event. If a registered event is not deregistered, it is always valid.
For the PVR_EVENT_PLAY_REACH_REC message, it is recommended to stop the playing of the PVR by calling the registered callback function, and switch the playing mode to live mode of the AVPLAY.
If the recording attribute is set to non-rewind, the PVR_EVENT_REC_OVER_FIX message is reported at the end of recording when the recording length reaches the specified length.
When the recording attribute is set to rewind, the PVR_EVENT_REC_OVER_FIX message is reported during each rewind. In this case, the value of s32EventValue of the message handling callback function is the times of rewind (counting from 1).
The PVR_EVENT_REC_REACH_PLAY message is reported when the recording speed will reach the playing speed. In this case, the value of s32EventValue is the number of bytes between the recording position and the playing position.
CNcomment: ����ʹ��::HI_UNF_PVR_UnRegisterEvent����ע��1���¼��������Ѿ�ע����¼���һֱ������Ч
����PVR_EVENT_PLAY_REACH_REC��Ϣ�������û���ע��Ļص�������ֹͣPVR���ţ����л���ֱ��ģʽ��AVPLAY���в��š�
��¼����������Ϊ�����Ƶ�ʱ��PVR_EVENT_REC_OVER_FIX��Ϣ��¼�Ƴ��ȵ���ָ�����ȣ�����ֹͣ¼�Ƶ�ʱ���ϱ���
��¼����������Ϊ���Ƶ�ʱ��PVR_EVENT_REC_OVER_FIX��Ϣ��ÿ�λ��Ƶ�ʱ�򶼻��ϱ�����ʱ����Ϣ�����ص�������s32EventValue����ֵΪ���ƵĴ���(��1��ʼ����)��
PVR_EVENT_REC_REACH_PLAY��Ϣ��¼�Ƽ���׷�ϲ��ŵ�ʱ���ϱ�����ʱ����Ϣ�����ص�������s32EventValue����ֵΪ¼��λ�þ��벥��λ�õ��ֽ����� CNend
\param[in] enEventType	Type of the event to be registered.  CNcomment: ��Ҫע����¼����� CNend
\param[in] callBack   Event handling callback function.	  CNcomment: �¼��������� CNend
\param[in] args	     Parameters of a customized callback function.    CNcomment:�û��Զ���ص������Ĳ��� CNend
\retval ::HI_SUCCESS   Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_INTF_EVENT_INVAL	The event is invalid.  CNcomment: �Ƿ����¼� CNend
\retval ::HI_ERR_PVR_ALREADY	     The registering event has been registered.	   CNcomment: ���Զ��Ѿ�ע����¼��ٴ�ע�� CNend
\retval ::HI_ERR_PVR_INTF_EVENT_NOREG	 Registration fails because the callback function pointer is incorrect. CNcomment:  �ص�����ָ��������޷�ע��ɹ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RegisterEvent(HI_UNF_PVR_EVENT_E enEventType, eventCallBack callBack, HI_VOID *args);

/**
\brief	Deregisters a PVR event. CNcomment: ȥע��PVR�¼��Ļص����� CNend
\attention \n
You can call this API to deregister an event. If a registered event is not deregistered, it is always valid.
CNcomment: ����ʹ�ô˽ӿ���ȥע��1���¼��������Ѿ�ע����¼���һֱ������Ч CNend
\param[in] enEventType	    Type of the event to be deregistered    CNcomment: ��Ҫȥע����¼����� CNend
\retval ::HI_SUCCESS   Success	CNcomment:�ɹ� CNend
\retval ::HI_ERR_PVR_INTF_EVENT_INVAL  The event is invalid. CNcomment: �Ƿ����¼� CNend
\retval ::HI_ERR_PVR_INTF_EVENT_NOREG  The deregistering event is not registered. CNcomment: ��û��ע����¼�����ȥע�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_UnRegisterEvent(HI_UNF_PVR_EVENT_E enEventType);

/**
\brief Create index file by ts file. CNcomment:���������ļ����������ļ� CNend
\attention \n
This function is not supported currently.
CNcomment: ��ʱ��֧�ִ˹��� CNend
\param[in] pstTsFileName
\param[in] pstIdxFileName
\param[in] pAttr
\retval ::HI_SUCCESS Success CNcomment:	 �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_CreateIdxFile(HI_U8* pstTsFileName, HI_U8* pstIdxFileName, HI_UNF_PVR_GEN_IDX_ATTR_S* pAttr);

/**
\brief Controls whether to output debugging information.  CNcomment:�����Ƿ����������Ϣ CNend
\attention \n
The debugging information about the severity level higher than the error level is output.
CNcomment:Ĭ�����error ���ϼ���ĵ�����Ϣ��ע���ȫ�ִ�ӡ�������ʹ�ã����˼�����ҪС�ڵ���ȫ�ִ�ӡ�������Ч CNend
\param[in] enDebugLevel	 Output level of the debugging information CNcomment: ������Ϣ������� CNend
\retval none
\see \n
N/A
*/
HI_VOID HI_UNF_PVR_ConfigDebugInfo(HI_LOG_LEVEL_E enDebugLevel);

/**
\brief	Deletes the stream files and index files generated during recording. CNcomment:ɾ��¼��ʱ���ɵ������ļ��������ļ� CNend
\attention \n
pFileName points to the name of a stream file rather than an index file.\n
After this API is called, the stream files and index files generated during stream recording are deleted.
If a stream file is greater than 4 GB, multiple files named data.ts, data.ts.0001, data.ts.0002, data.ts.0003, and ... are generated. To delete these files, you only need to enter the file name data.ts.
CNcomment:pFileNameָ�������ļ��������������ļ���\n
���ô˽ӿں�¼�ƴ�����ʱ���ɵ������ļ��������ļ�������ɾ��\n
��������ļ�����4G��������data.ts, data.ts.0001, data.ts.0002, data.ts.0003 ...\n
�ȶ���ļ�������ɾ��ʱֻ��Ҫ�����ļ���"data.ts"�Ϳ����ˡ� CNend
\param[in] pFileName  Name of a stream file  CNcomment:�����ļ��� CNend
\retval none
\see \n
N/A
*/
HI_VOID HI_UNF_PVR_RemoveFile(const HI_CHAR *pFileName);


/**
\brief
Register extra write callback function.When the stream file need to be extra processed	CNcomment: ע���ⲿ����д���ݻص����������ļ���Ҫ���⴦��ʱע�ᣬ��˽��Э����ŵĽ�Ŀ�� CNend
\attention \n
N/A
\param[in] u32ChnID    Channel ID  CNcomment:ͨ���� CNend
\param[in] enExtraCallbackType	Callback function type CNcomment: �ص��������� CNend
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   Specified channel is not initialized   CNcomment:	ָ����ͨ��δ��ʼ? CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RegisterExtraCallback(HI_U32 u32ChnID, HI_UNF_PVR_EXTRA_CALLBACK_E enExtraCallbackType, ExtraCallBack fCallback, HI_VOID *args);

/**
\brief Deregisters extra write callback function.When the stream file need to be extra processed  CNcomment:ȥע���ⲿ����д���ݻص������� CNend
\attention \n
N/A
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] enExtraCallbackType	Callback function type CNcomment: �ص��������� CNend
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   Specified channel is not initialized   CNcomment:	ָ����ͨ��δ��ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_UnRegisterExtraCallBack(HI_U32 u32ChnID, HI_UNF_PVR_EXTRA_CALLBACK_E enExtraCallbackType);

/**
\brief
Register extra write callback function.When the stream file need to be extra processed	CNcomment: ע���ⲿ����д���ݻص����������ļ���Ҫ���⴦��ʱע�ᣬ��˽��Э����ŵĽ�Ŀ�� CNend
\attention \n
N/A
\param[in] u32ChnID    Channel ID  CNcomment:ͨ���� CNend
\param[in] enExtraCallbackType	Callback function type CNcomment: �ص��������� CNend
\param[in] fCallback  Callback function CNcomment: �ص�����CNend
\param[in] pUserData  arguments of the Callback function CNcomment: �ص��������û�����CNend
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   Specified channel is not initialized   CNcomment:	ָ����ͨ��δ��ʼ? CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_RegisterExtendCallback(HI_U32 u32ChnID, HI_UNF_PVR_EXTRA_CALLBACK_E enExtraCallbackType, ExtendCallBack fCallback, HI_VOID *pUserData);

/**
\brief Deregisters extra write callback function.When the stream file need to be extra processed  CNcomment:ȥע���ⲿ����д���ݻص������� CNend
\attention \n
N/A
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] enExtraCallbackType	Callback function type CNcomment: �ص��������� CNend
\param[in] fCallback  Callback function CNcomment: �ص����� CNend
\retval ::HI_SUCCESS Success  CNcomment: �ɹ� CNend
\retval ::HI_ERR_PVR_NOT_INIT  The PVR recording module is not initialized CNcomment: PVR¼��ģ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_CHNID The channel ID is invalid.  CNcomment:ͨ���ŷǷ� CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT   Specified channel is not initialized   CNcomment:	ָ����ͨ��δ��ʼ�� CNend
\retval ::HI_ERR_PVR_INVALID_PARA   invalid input param, E.x.	fCallback hasn't been registered before CNcomment:   �Ƿ���������������뺯��ָ��δ��ע��CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PVR_UnRegisterExtendCallback(HI_U32 u32ChnID, HI_UNF_PVR_EXTRA_CALLBACK_E enExtraCallbackType, ExtendCallBack fCallback);

/**
\brief create pid channel and create the binding relationship of rec channel.  CNcomment:����PID  ͨ����������¼��ͨ���İ󶨹�ϵ�� CNend
\attention \n
You can call this api after creating the rec channl successfully.  CNcomment:�ýӿڱ����ڳɹ�����¼��ͨ���󱻵���
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] u32Pid  PID value CNcomment: PID ֵ CNend
\retval ::HI_SUCCESS  Success. CNcomment: �ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment: APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The recorde channel ID is invalide. CNcomment: ͨ���ŷǷ���CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT  The recorde channel is not initialized. CNcomment:	ָ����ͨ��δ��ʼ����CNend
\retval ::HI_ERR_PVR_NOT_INIT  The recorde channel is not initialized. CNcomment: PVR¼��ģ��δ��ʼ����CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment: ��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment: ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\see \nN/A
*/
HI_S32 HI_UNF_PVR_RecAddPID(HI_U32 u32ChnID, HI_U32 u32Pid);

/**
\brief destroy pid channel and destroy the relationship with rec channel.  CNcomment:����PID  ͨ���������¼��ͨ���İ󶨹�ϵ�� CNend
\attention \n
You can call this api before destroying the rec channl.	 CNcomment:�ýӿڱ���������¼��ͨ��ǰ������
\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\param[in] u32Pid  PID value CNcomment: PID ֵ CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The recorde channel ID is invalide. CNcomment: ͨ���ŷǷ���CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT  The recorde channel is not initialized. CNcomment:	ָ����ͨ��δ��ʼ����CNend
\retval ::HI_ERR_PVR_NOT_INIT  The recorde channel is not initialized. CNcomment: PVR¼��ģ��δ��ʼ����CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \nN/A
*/
HI_S32 HI_UNF_PVR_RecDelPID(HI_U32 u32ChnID, HI_U32 u32Pid);

/**
\brief destroy any pid channel which has binding relationship with rec channel.	 CNcomment:����������¼��ͨ���а󶨹�ϵ��PID ͨ���� CNend
\attention \n

\param[in] u32ChnID  Channel ID	 CNcomment:ͨ���� CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_PVR_INVALID_CHNID  The recorde channel ID is invalide. CNcomment: ͨ���ŷǷ���CNend
\retval ::HI_ERR_PVR_CHN_NOT_INIT  The recorde channel is not initialized. CNcomment:	ָ����ͨ��δ��ʼ����CNend
\retval ::HI_ERR_PVR_NOT_INIT  The recorde channel is not initialized. CNcomment: PVR¼��ģ��δ��ʼ����CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n\see \nN/A
*/
HI_S32 HI_UNF_PVR_RecDelAllPID(HI_U32 u32ChnID);


/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */


#endif /* End of #ifndef __HI_UNF_PVR_H__ */
