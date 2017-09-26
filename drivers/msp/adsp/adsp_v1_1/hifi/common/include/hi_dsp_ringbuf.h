/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DSP_RINGBUF__H__
#define __HI_DSP_RINGBUF__H__

#include "hi_type.h"
#include "hi_dsp_common.h"
#include "hi_audsp_common.h"

typedef struct
{
    HI_BOOL	     bExtMem;	 /* True : Rbf instace is malloc by  external module */
    HI_VOID*	     pBufAddr;
    HI_U32	     uBufSize;
    HI_VOID*	     pBufWptr;
    HI_VOID*	     pBufRptr;
    HI_U32	     uBufFlag;	 /* 1:	uBufWptr & uBufRptr Ϊ���Ѱַ */

    HI_U32	     uFrameSize;
    HI_U32	     uLatencySize; /* uLatencySize <= uFrameSize */
    HI_U32	     uLatencyMs;

} RBUF_ATTR_S;

typedef struct
{
    HI_VOID* pBasePtr;			/* Base pointer of the associated
					   ring buffer */
    HI_U32 u32ReadPtr;			/* Read pointer of the associated
					   ring buffer */
    HI_U32 u32WritePtr;			/* Write pointer of the associated
					   ring buffer */
    HI_U32 u32BufSize;			/* Buffer size of the associated
					   ring buffer */

    HI_U32 u32ContiguousDataSize;	/* Contiguous data size in
					   bytes without wrap around */
    HI_U32 u32TotalDataSize;		/* Total data size in bytes
					   including wrap around */

    HI_U32 u32ContiguousFreeSize;	/* Contiguous free size in
					   bytes without wrap around */
    HI_U32 u32TotalFreeSize;		/* Total free size in bytes
					   including wrap around */
    HI_U32 u32LatencySize;

} RBUF_INFO_S;

HI_VOID RBUF_Create(HI_VOID* *phRBUF, RBUF_ATTR_S *pstAttr);
HI_VOID RBUF_Destroy(HI_VOID* hRBUF);
HI_VOID RBUF_Create_EXT(HI_VOID* *phRBUF, RBUF_ATTR_S *pstAttr);	//for ALSA

HI_U32	  RBUF_ReadData(HI_VOID* hRBUF, HI_U8 * pu32Dest, HI_U32 u32DestSize);
HI_U32	  RBUF_WriteData(HI_VOID* hRBUF, HI_U8 * pu32Src, HI_U32 u3SrcLen);

HI_VOID	   RBUF_ReadDataComplete(HI_VOID* hRBUF, HI_U32 amountRead);
HI_VOID	   RBUF_WriteDataComplete(HI_VOID* hRBUF, HI_U32 amountWritten);

HI_VOID	   RBUF_QueryInfo(HI_VOID* hRBUF, RBUF_INFO_S * pstBufInfo);
HI_U32	   RBUF_QueryBusy(HI_VOID* hRBUF);
HI_U32	   RBUF_QueryFree(HI_VOID* hRBUF);
HI_BOOL	   RBUF_CheckFree(HI_VOID* hRBUF, HI_U32 blocksize);
HI_VOID	   RBUF_Flush(HI_VOID* hRBUF);
HI_U32	   RBUF_QueryBusy_ProvideRptr(HI_VOID* hRBUF, HI_U32 *pu32ReadPtr);

HI_U32	RBUF_ReadDataDma(HI_VOID* hRBUF, HI_U8 * pu32Dest, HI_U32 u32DestSize, HI_U32 *pu32Rptr);
HI_U32	RBUF_WriteDataDma(HI_VOID* hRBUF, HI_U8 * pu32Src, HI_U32 u3SrcLen);

HI_U32	RBUF_CopyData(HI_VOID* hSrc, HI_VOID* hDes, HI_U32 u32Size, ADSP_MEMCPY_DIR_E enDir);
HI_VOID RBUF_GetCompressInfo(HI_VOID* hRBUF, HI_U32* pu32ValidBytes, HI_U32* pu32ZeroBytes);

HI_VOID RBUF_UpdateAttr(HI_VOID* hRBUF, RBUF_ATTR_S* pstAttr);

#endif
