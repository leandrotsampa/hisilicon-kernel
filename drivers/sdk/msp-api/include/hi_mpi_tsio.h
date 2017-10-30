/*******************************************************************************
*	      Copyright 2016 - 2016, Hisilicon Tech. Co., Ltd.
*			    ALL RIGHTS RESERVED
* FileName: hi_mpi_tsio.h
* Description: tsio user export interface declaration.
*
* History:
* Version   Date	      Author	  DefectNum	 Description
* main\1    2016-08-15	      l00326021	    NULL	    init.
*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_MPI_TSIO_H__
#define __HI_MPI_TSIO_H__

#include "hi_type.h"

#include "hi_unf_demux.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define INVALID_PID 0x1fff

#define HI_FATAL_TSIO(fmt...)	   HI_FATAL_PRINT  (HI_ID_TSIO, fmt)
#define HI_ERR_TSIO(fmt...)	   HI_ERR_PRINT	   (HI_ID_TSIO, fmt)
#define HI_WARN_TSIO(fmt...)	   HI_WARN_PRINT   (HI_ID_TSIO, fmt)
#define HI_INFO_TSIO(fmt...)	   HI_INFO_PRINT   (HI_ID_TSIO, fmt)
#define HI_DBG_TSIO(fmt...)	   HI_DBG_PRINT	   (HI_ID_TSIO, fmt)

/*
 * capacity definitions.
 */
typedef struct {
    HI_U32 TsiPortCnt;
    HI_U32 RamPortCnt;
    HI_U32 PidChanCnt;
    HI_U32 RawChanCnt;
    HI_U32 SpChanCnt;
    HI_U32 IvrChanCnt;
    HI_U32 SecEngCnt;
}TSIO_CAPABILITY;

/*
 * port resource definitions.
 */
typedef enum {
    TSIO_ANY_TSI_PORT = 0x0,
    TSIO_TSI_PORT_0,
    TSIO_TSI_PORT_1,
    TSIO_TSI_PORT_2,
    TSIO_TSI_PORT_3,
    TSIO_TSI_PORT_4,
    TSIO_TSI_PORT_5,
    TSIO_TSI_PORT_6,
    TSIO_TSI_PORT_7,
    TSIO_TSI_PORT_BUTT,

    TSIO_ANY_RAM_PORT = 0x32,
    TSIO_RAM_PORT_0,
    TSIO_RAM_PORT_1,
    TSIO_RAM_PORT_2,
    TSIO_RAM_PORT_3,
    TSIO_RAM_PORT_4,
    TSIO_RAM_PORT_5,
    TSIO_RAM_PORT_6,
    TSIO_RAM_PORT_7,
    TSIO_RAM_PORT_8,
    TSIO_RAM_PORT_9,
    TSIO_RAM_PORT_10,
    TSIO_RAM_PORT_11,
    TSIO_RAM_PORT_12,
    TSIO_RAM_PORT_13,
    TSIO_RAM_PORT_14,
    TSIO_RAM_PORT_15,
    TSIO_RAM_PORT_BUTT,
}TSIO_PORT;

/*
 * sid resource definitions.
 */
typedef enum {
    TSIO_ANY_SID = 0x0,
    TSIO_SID_0,
    TSIO_SID_1,
    TSIO_SID_2,
    TSIO_SID_3,
    TSIO_SID_4,
    TSIO_SID_5,
    TSIO_SID_6,
    TSIO_SID_7,
    TSIO_SID_8,
    TSIO_SID_9,
    TSIO_SID_10,
    TSIO_SID_11,
    TSIO_SID_12,
    TSIO_SID_13,
    TSIO_SID_14,
    TSIO_SID_15,
    TSIO_SID_16,
    TSIO_SID_17,
    TSIO_SID_18,
    TSIO_SID_19,
    TSIO_SID_20,
    TSIO_SID_21,
    TSIO_SID_22,
    TSIO_SID_23,
    TSIO_SID_24,
    TSIO_SID_25,
    TSIO_SID_26,
    TSIO_SID_27,
    TSIO_SID_28,
    TSIO_SID_29,
    TSIO_SID_30,
    TSIO_SID_31,
    TSIO_SID_32,
    TSIO_SID_33,
    TSIO_SID_34,
    TSIO_SID_35,
    TSIO_SID_36,
    TSIO_SID_37,
    TSIO_SID_38,
    TSIO_SID_39,
    TSIO_SID_40,
    TSIO_SID_41,
    TSIO_SID_42,
    TSIO_SID_43,
    TSIO_SID_44,
    TSIO_SID_45,
    TSIO_SID_46,
    TSIO_SID_47,
    TSIO_SID_48,
    TSIO_SID_49,
    TSIO_SID_50,
    TSIO_SID_51,
    TSIO_SID_52,
    TSIO_SID_53,
    TSIO_SID_54,
    TSIO_SID_55,
    TSIO_SID_56,
    TSIO_SID_57,
    TSIO_SID_58,
    TSIO_SID_59,
    TSIO_SID_60,
    TSIO_SID_61,
    TSIO_SID_62,
    TSIO_SID_63,
    TSIO_SID_BUTT,
}TSIO_SID;

/*
 * global config definitions.
 */
typedef enum {
    TSIO_BW_50M,
    TSIO_BW_100M,
    TSIO_BW_200M,
    TSIO_BW_400M,
    TSIO_BW_BUTT,
}TSIO_BW; /* mbps */

typedef struct {
    TSIO_BW  BandWidth;
    TSIO_SID StuffSid;
}TSIO_CONFIG;

#define TSIO_BW_DEFAULT		   TSIO_BW_400M
#define TSIO_STUFF_SID_DEFAULT	   TSIO_SID_63

/*
 * tsi port definitions.
 */
typedef struct {
    HI_UNF_DMX_PORT_E SourcePort;
}TSIO_TSI_PORT_ATTRS;

typedef struct {
    HI_U32 PktNum;
}TSIO_TSI_PORT_STATUS;

/*
 * ram port definitions.
 */
typedef enum {
    TSIO_SOURCE_TS,
    TSIO_SOURCE_BULK
}TSIO_SOURCE_TYPE;

typedef enum {
    TSIO_KEY_EVEN,
    TSIO_KEY_ODD,
}TSIO_KEY_TYPE;

typedef struct {
    HI_U8  *Data;
    HI_U32 PhyAddr;
    HI_U32 Length;
}TSIO_BUFFER;

typedef struct {
    HI_U32 Reserved;
    HI_U32 Data;
    HI_U32 PhyAddr;
    HI_U32 Length;
}TSIO_COMPAT_BUFFER;

typedef struct {
    TSIO_SOURCE_TYPE SourceType;
    HI_U32	     BufferSize;
    HI_U32	     MaxDataRate;  /* mbps */
}TSIO_RAM_PORT_ATTRS;

typedef struct {
    HI_U32 BufferBlkSize;
    HI_U32 BufferUsed;
    HI_U32 BufferSize;

    HI_U32 PktNum;
}TSIO_RAM_PORT_STATUS;

typedef struct {
    HI_U32 Pid;
}TSIO_PID_CHANNEL_STATUS;

/*
 * secure engine definitions.
 */
typedef enum {
    TSIO_SECURE_ENGINE_OUTPUT2TSI,
    TSIO_SECURE_ENGINE_OUTPUT2RAM,
}TSIO_SECURE_ENGINE_OUTPUT_MOD;

typedef enum {
    TSIO_SECURE_ENGINE_CLOSED,
    TSIO_SECURE_ENGINE_OPENED,
}TSIO_SECURE_ENGINE_STATE;

typedef struct {
    TSIO_SECURE_ENGINE_OUTPUT_MOD Mod;

    union {
	struct {
	    HI_UNF_DMX_PORT_E OPort;
	};

	struct {
	    HI_U32 BufferSize;
	};
    };
}TSIO_SECURE_ENGINE_ATTRS;

typedef struct {
    HI_U32			    Sid;
    TSIO_SECURE_ENGINE_STATE	    State;

    HI_U32			    BufferUsed;
    HI_U32			    BufferSize;

    HI_U32			    OverflowCnt;
    HI_U32			    DmaEndIntCnt;
    HI_U32			    DecryptErrorCnt;
    HI_U32			    UnkownPidCnt;
}TSIO_SECURE_ENGINE_STATUS;

/*
 * CC definitions.
 */
#define MIN_CC_CMD_LEN		   2	   /* 2 bytes */
#define MAX_CC_CMD_LEN		   258	   /* 258 bytes */

HI_S32 HI_MPI_TSIO_Init(TSIO_BW BandWidth, TSIO_SID StuffSid);
HI_S32 HI_MPI_TSIO_DeInit(HI_VOID);
HI_S32 HI_MPI_TSIO_GetCapability(TSIO_CAPABILITY *Cap);

HI_S32 HI_MPI_TSIO_TSI_GetPortDefaultAttrs(TSIO_TSI_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_TSI_OpenPort(TSIO_PORT Port, const TSIO_TSI_PORT_ATTRS *Attrs, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_TSI_GetPortAttrs(HI_HANDLE Handle, TSIO_TSI_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_TSI_SetPortAttrs(HI_HANDLE Handle, const TSIO_TSI_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_TSI_GetPortStatus(HI_HANDLE Handle, TSIO_TSI_PORT_STATUS *Status);
HI_S32 HI_MPI_TSIO_TSI_ClosePort(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_RAM_GetPortDefaultAttrs(TSIO_RAM_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_RAM_OpenPort(TSIO_PORT Port, const TSIO_RAM_PORT_ATTRS *Attrs, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_RAM_GetPortAttrs(HI_HANDLE Handle, TSIO_RAM_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_RAM_SetPortAttrs(HI_HANDLE Handle, const TSIO_RAM_PORT_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_RAM_GetPortStatus(HI_HANDLE Handle, TSIO_RAM_PORT_STATUS *Status);
HI_S32 HI_MPI_TSIO_RAM_BeginBulkSeg(HI_HANDLE Handle, TSIO_KEY_TYPE Key, const HI_U8 *IV);
HI_S32 HI_MPI_TSIO_RAM_EndBulkSeg(HI_HANDLE Handle);
HI_S32 HI_MPI_TSIO_RAM_GetBuffer(HI_HANDLE Handle, HI_U32 ReqLen, TSIO_BUFFER *Buf, HI_U32 TimeOut/* ms */);
HI_S32 HI_MPI_TSIO_RAM_PushBuffer(HI_HANDLE Handle, TSIO_BUFFER *Buf);
HI_S32 HI_MPI_TSIO_RAM_PutBuffer(HI_HANDLE Handle, TSIO_BUFFER *Buf);
HI_S32 HI_MPI_TSIO_RAM_ResetBuffer(HI_HANDLE Handle);
HI_S32 HI_MPI_TSIO_RAM_ClosePort(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_PID_CreateChannel(HI_HANDLE PtHandle, HI_U32 Pid, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_PID_GetChannelStatus(HI_HANDLE Handle, TSIO_PID_CHANNEL_STATUS *Status);
HI_S32 HI_MPI_TSIO_PID_DestroyChannel(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_RAW_CreateChannel(HI_HANDLE PtHandle, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_RAW_DestroyChannel(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_SP_CreateChannel(HI_HANDLE PtHandle, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_SP_DestroyChannel(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_IVR_CreateChannel(HI_HANDLE PtHandle, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_IVR_DestroyChannel(HI_HANDLE Handle);

HI_S32 HI_MPI_TSIO_SE_GetDefaultAttrs(TSIO_SECURE_ENGINE_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_SE_Create(TSIO_SID Sid, const TSIO_SECURE_ENGINE_ATTRS *Attrs, HI_HANDLE *Handle);
HI_S32 HI_MPI_TSIO_SE_Open(HI_HANDLE Handle);
HI_S32 HI_MPI_TSIO_SE_GetAttrs(HI_HANDLE Handle, TSIO_SECURE_ENGINE_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_SE_SetAttrs(HI_HANDLE Handle, const TSIO_SECURE_ENGINE_ATTRS *Attrs);
HI_S32 HI_MPI_TSIO_SE_GetStatus(HI_HANDLE Handle, TSIO_SECURE_ENGINE_STATUS *Status);
HI_S32 HI_MPI_TSIO_SE_AddChannel(HI_HANDLE Handle, HI_HANDLE ChHandle);
HI_S32 HI_MPI_TSIO_SE_DelChannel(HI_HANDLE Handle, HI_HANDLE ChHandle);
HI_S32 HI_MPI_TSIO_SE_DelAllChannels(HI_HANDLE Handle);
/*
 * return any data available, up to the ReqLen, if TimeOut is 0.
 * return request length data, if TimeOut is not 0 and not expired .
 * return any data available, if TimeOut is not 0 and expired.
 */
HI_S32 HI_MPI_TSIO_SE_AcquireBuffer(HI_HANDLE Handle, HI_U32 ReqLen, TSIO_BUFFER *Buf, HI_U32 TimeOut);
HI_S32 HI_MPI_TSIO_SE_ReleaseBuffer(HI_HANDLE Handle, TSIO_BUFFER *Buf);
HI_S32 HI_MPI_TSIO_SE_Close(HI_HANDLE Handle);
HI_S32 HI_MPI_TSIO_SE_Destroy(HI_HANDLE Handle);

/*
 * TimeOut 0 means wait forever.
 */
HI_S32 HI_MPI_TSIO_CC_Send(const HI_UCHAR *Cmd, HI_U32 CmdLen, HI_UCHAR *Resp, HI_U32 *RespLen, HI_U32 TimeOut);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif	// __HI_MPI_TSIO_H__
