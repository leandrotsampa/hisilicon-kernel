/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __CIRC_BUF_H__
#define __CIRC_BUF_H__

#include "hi_type.h"
#include "hi_audsp_common.h"

#include "adsp_osal_ext.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif/* End of #ifdef __cplusplus */

#define SIMPLE_CB_GAP 32

typedef struct hiCIRC_BUF_S
{
    volatile HI_U32*	  pu32Write;
    volatile HI_U32*	  pu32Read;
    volatile HI_U8*	  pu8Data;
    HI_U32		  u32Lenght;
} CIRC_BUF_S;

static inline HI_VOID CIRC_BUF_Init_EXT(CIRC_BUF_S* pstCb,
					HI_VOID*    pu32Write,
					HI_VOID*    pu32Read,
					HI_VOID*    pu8Data,
					HI_U32	    u32Len)
{
    //HI_ASSERT(NULL != pstCb);

    pstCb->pu32Write = pu32Write;
    pstCb->pu32Read = pu32Read;
    pstCb->pu8Data   = pu8Data;
    pstCb->u32Lenght = u32Len;
#if 0
    *pstCb->pu32Write = 0;
    *pstCb->pu32Read = 0;
#endif
}

static inline HI_VOID CIRC_BUF_Init(CIRC_BUF_S* pstCb,
				    HI_VOID*	pu32Write,
				    HI_VOID*	pu32Read,
				    HI_VOID*	pu8Data,
				    HI_U32	u32Len)
{
    //HI_ASSERT(NULL != pstCb);

    pstCb->pu32Write = pu32Write;
    pstCb->pu32Read = pu32Read;
    pstCb->pu8Data   = pu8Data;
    pstCb->u32Lenght = u32Len;

    *pstCb->pu32Write = 0;
    *pstCb->pu32Read = 0;
}

static inline HI_VOID CIRC_BUF_DeInit(CIRC_BUF_S* pstCb)
{
    return;
}

static inline HI_VOID CIRC_BUF_Flush(CIRC_BUF_S* pstCb)
{
    *pstCb->pu32Read = *pstCb->pu32Write;
}

static inline HI_U32 CIRC_BUF_QueryBusy_ProvideRptr(CIRC_BUF_S *pstCb, HI_U32 *pu32Rptr)
{
    HI_U32  u32ReadPos, u32WritePos, u32BusyLen=0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32ReadPos = *pu32Rptr;

    if (u32WritePos >= u32ReadPos)
    {
	u32BusyLen = u32WritePos - u32ReadPos;
    }
    else
    {
	u32BusyLen = pstCb->u32Lenght - (u32ReadPos - u32WritePos);
    }

    return u32BusyLen;
}

static inline HI_U32 CIRC_BUF_QueryBusy(CIRC_BUF_S* pstCb)
{
    HI_U32 u32ReadPos, u32WritePos, u32BusyLen = 0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	u32BusyLen = u32WritePos - u32ReadPos;
    }
    else
    {
	u32BusyLen = pstCb->u32Lenght - (u32ReadPos - u32WritePos);
    }

    return u32BusyLen;
}

static inline HI_VOID CIRC_BUF_QueryBusy_Ext(CIRC_BUF_S* pstCb, HI_U32* u32ContiguousDataSize, HI_U32* u32TotalDataSize)
{
    HI_U32 u32ReadPos, u32WritePos, u32BusyLen = 0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	u32BusyLen = u32WritePos - u32ReadPos;
	*u32ContiguousDataSize = u32BusyLen;
	*u32TotalDataSize = u32BusyLen;
    }
    else
    {
	u32BusyLen = pstCb->u32Lenght - (u32ReadPos - u32WritePos);
	*u32ContiguousDataSize = pstCb->u32Lenght - u32ReadPos;
	*u32TotalDataSize = u32BusyLen;
    }

    return;
}

static inline HI_U32 CIRC_BUF_QueryFree(CIRC_BUF_S* pstCb, HI_U32 u32Gap)
{
    HI_U32 u32ReadPos, u32WritePos, u32FreeLen = 0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	u32FreeLen = (pstCb->u32Lenght - (u32WritePos - u32ReadPos));
    }
    else
    {
	u32FreeLen = (u32ReadPos - u32WritePos);
    }

    u32FreeLen = (u32FreeLen <= u32Gap) ? 0 : u32FreeLen - u32Gap;

    return u32FreeLen;
}

static inline HI_VOID CIRC_BUF_QueryFree_Ext(CIRC_BUF_S* pstCb, HI_U32 u32Gap, HI_U32* u32ContiguousFreeSize,
					     HI_U32* u32TotalFreeSize)
{
    HI_U32 u32ReadPos, u32WritePos, u32FreeLen = 0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	u32FreeLen = pstCb->u32Lenght - (u32WritePos - u32ReadPos);
	*u32ContiguousFreeSize = pstCb->u32Lenght - u32WritePos;
	*u32TotalFreeSize = u32FreeLen;
    }
    else
    {
	u32FreeLen = u32ReadPos - u32WritePos;

	*u32ContiguousFreeSize = u32FreeLen;
	*u32TotalFreeSize = u32FreeLen;
    }

    if (u32FreeLen <= u32Gap)
    {
	*u32ContiguousFreeSize = 0;
	*u32TotalFreeSize = 0;
    }
    else
    {
	u32FreeLen -= u32Gap;

	if ((*u32TotalFreeSize - *u32ContiguousFreeSize) < u32Gap)
	{
	    *u32ContiguousFreeSize = u32FreeLen;
	}

	*u32TotalFreeSize = u32FreeLen;
    }

    return;
}

static inline HI_VOID CIRC_BUF_QueryInfo_Ext(CIRC_BUF_S* pstCb,
	HI_U32 u32Gap,
	HI_U32* pu32TotalDataSize,
	HI_U32* pu32TotalFreeSize)
{
    HI_U32 u32ReadPos, u32WritePos, u32BusyLen = 0, u32FreeLen = 0;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	u32BusyLen = u32WritePos - u32ReadPos;
	u32FreeLen = pstCb->u32Lenght - (u32WritePos - u32ReadPos);
    }
    else
    {
	u32BusyLen = pstCb->u32Lenght - (u32ReadPos - u32WritePos);
	u32FreeLen = u32ReadPos - u32WritePos;
    }

    u32FreeLen = (u32FreeLen <= u32Gap) ? 0 : u32FreeLen - u32Gap;

    *pu32TotalDataSize = u32BusyLen;
    *pu32TotalFreeSize = u32FreeLen;
}


static inline HI_U32 CIRC_BUF_Read(CIRC_BUF_S* pstCb, HI_U8* pDest, HI_U32 u32Len)
{
    HI_U8*  pVirAddr   = NULL;
    HI_U32 u32RdLen[2] = {0, 0}, u32RdPos[2] = {0, 0}, i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32RdPos[0] = u32ReadPos;

    if (u32WritePos >= u32ReadPos)
    {
	if (u32WritePos >= u32ReadPos + u32Len)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = u32WritePos - u32ReadPos;
	}
    }
    else
    {
	if (u32ReadPos + u32Len <= pstCb->u32Lenght)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = pstCb->u32Lenght - u32ReadPos;

	    u32RdPos[1] = 0;
	    u32RdLen[1] = u32Len - u32RdLen[0];

	    if (u32WritePos < u32RdLen[1])
	    {
		u32RdLen[1] = u32WritePos;
	    }
	}
    }

    for (i = 0; (i < 2) && (u32RdLen[i] != 0); i++)
    {
	pVirAddr = (HI_U8*)(pstCb->pu8Data + u32RdPos[i]);

	if (HI_NULL != pDest)
	{
	    adsp_memcpy(pDest, pVirAddr, u32RdLen[i]);
	    pDest += u32RdLen[i];
	}

	u32ReadPos = u32RdPos[i] + u32RdLen[i];
    }

    if (u32ReadPos == pstCb->u32Lenght)
    {
	u32ReadPos = 0;
    }

    *(pstCb->pu32Read) = u32ReadPos;

    return u32RdLen[0] + u32RdLen[1];
}

static inline HI_U32 CIRC_BUF_Write(CIRC_BUF_S* pstCb, HI_U8* pDest, HI_U32 u32Len)
{
    HI_U32*  pVirAddr = NULL;

    HI_U32 u32WtLen[2] = {0, 0};
    HI_U32 u32WtPos[2] = {0, 0};
    HI_U32 i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32WtPos[0] = u32WritePos;

    if (u32WritePos >= u32ReadPos)
    {
	if (pstCb->u32Lenght >= (u32WritePos + u32Len))
	{
	    u32WtLen[0] = u32Len;
	}
	else
	{
	    u32WtLen[0] = pstCb->u32Lenght - u32WritePos;
	    u32WtLen[1] = u32Len - u32WtLen[0];

	    u32WtPos[1] = 0;
	}
    }
    else
    {
	if (u32ReadPos > (u32WritePos + u32Len))
	{
	    u32WtLen[0] = u32Len;
	}
	else
	{
	    u32WtLen[0] = u32ReadPos - u32WritePos;
	}
    }

    for (i = 0; (i < 2) && (u32WtLen[i] != 0); i++)
    {
	pVirAddr = (HI_U32 *)(pstCb->pu8Data + u32WtPos[i]);

	if (HI_NULL == pDest)
	{
	    adsp_memset(pVirAddr, 0, u32WtLen[i]);
	}
	else
	{
	    adsp_memcpy(pVirAddr, pDest, u32WtLen[i]);
	    pDest = pDest + u32WtLen[i];
	}

	u32WritePos = u32WtPos[i] + u32WtLen[i];
    }


    if (u32WritePos >= pstCb->u32Lenght)
    {
	u32WritePos = 0;
    }

    *(pstCb->pu32Write) = u32WritePos;


    return u32WtLen[0] + u32WtLen[1];
}

typedef enum
{
    CIRC_BUF_CONTINUOUS	   = 1,
    CIRC_BUF_NONCONTINUOUS = 2
} CIRC_BUF_STATE_E;

static inline CIRC_BUF_STATE_E CheckRdLen(CIRC_BUF_S* pstCb, HI_U32 u32Len, HI_U32* pu32RdLen)
{
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	if (u32WritePos >= u32ReadPos + u32Len)
	{
	    pu32RdLen[0] = u32Len;
	}
	else
	{
	    pu32RdLen[0] = u32WritePos - u32ReadPos;
	}
    }
    else
    {
	if (u32ReadPos + u32Len <= pstCb->u32Lenght)
	{
	    pu32RdLen[0] = u32Len;
	}
	else
	{
	    pu32RdLen[0] = pstCb->u32Lenght - u32ReadPos;
	    pu32RdLen[1] = u32Len - pu32RdLen[0];

	    if (u32WritePos < pu32RdLen[1])
	    {
		pu32RdLen[1] = u32WritePos;
	    }

	    return CIRC_BUF_NONCONTINUOUS;
	}
    }

    return CIRC_BUF_CONTINUOUS;
}

static inline CIRC_BUF_STATE_E CheckWtLen(CIRC_BUF_S* pstCb, HI_U32 u32Len, HI_U32* pu32WtLen)
{
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if (u32WritePos >= u32ReadPos)
    {
	if (pstCb->u32Lenght >= (u32WritePos + u32Len))
	{
	    pu32WtLen[0] = u32Len;
	}
	else
	{
	    pu32WtLen[0] = pstCb->u32Lenght - u32WritePos;
	    pu32WtLen[1] = u32Len - pu32WtLen[0];
	    return CIRC_BUF_NONCONTINUOUS;
	}
    }
    else
    {
	if (u32ReadPos > (u32WritePos + u32Len))
	{
	    pu32WtLen[0] = u32Len;
	}
	else
	{
	    pu32WtLen[0] = u32ReadPos - u32WritePos;
	}
    }

    return CIRC_BUF_CONTINUOUS;
}



static inline HI_VOID dsp_memcpy(HI_VOID* pDes, HI_VOID* pSrc, HI_U32 u32Len, ADSP_MEMCPY_DIR_E enDir)
{
    adsp_memcpy(pDes, pSrc, u32Len);
}

static inline HI_U32 CIRC_BUF_Copy(CIRC_BUF_S* pstSrcCb, CIRC_BUF_S* pstDesCb, HI_U32 u32Len, ADSP_MEMCPY_DIR_E enDir)
{
    HI_U32 u32ReadPos, u32WritePos;
    HI_U8* pu8Write;
    HI_U8* pu8Read;

    HI_U32 u32RdLen[2] = {0, 0};
    HI_U32 u32WtLen[2] = {0, 0};

    HI_U32 u32RdState, u32WtState;

    u32ReadPos	= *(pstSrcCb->pu32Read);
    u32WritePos = *(pstDesCb->pu32Write);

    pu8Read = (HI_U8*)(pstSrcCb->pu8Data);
    pu8Write = (HI_U8*)(pstDesCb->pu8Data);

    u32RdState = CheckRdLen(pstSrcCb, u32Len, u32RdLen);
    u32WtState = CheckWtLen(pstDesCb, u32Len, u32WtLen);

    /*
    * 1: src |--------|
    *	 des |--------|
    */
    if (CIRC_BUF_CONTINUOUS == u32RdState && CIRC_BUF_CONTINUOUS == u32WtState)
    {
	dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32Len, enDir);
	u32WritePos += u32Len;
	u32ReadPos += u32Len;
    }
    /*
    * 2: src |----|	  |----|
    *	 des |--------|
    */
    else if (CIRC_BUF_NONCONTINUOUS == u32RdState && CIRC_BUF_CONTINUOUS == u32WtState)
    {
	dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32RdLen[0], enDir);
	u32WritePos += u32RdLen[0];
	dsp_memcpy(pu8Write + u32WritePos, pu8Read, u32RdLen[1], enDir);
	u32WritePos += u32RdLen[1];
	u32ReadPos = u32RdLen[1];
    }
    /*
    * 3: src |--------|
    *	 des |----|	  |----|
    */
    else if (CIRC_BUF_CONTINUOUS == u32RdState && CIRC_BUF_NONCONTINUOUS == u32WtState)
    {
	dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32WtLen[0], enDir);
	u32ReadPos += u32WtLen[0];
	dsp_memcpy(pu8Write, pu8Read + u32ReadPos, u32WtLen[1], enDir);
	u32ReadPos += u32WtLen[1];
	u32WritePos = u32WtLen[1];
    }
    /*
    * 4: src |----|	  |----|
    *	 des |----|	  |----|
    */
    else
    {
	if (u32RdLen[0] == u32WtLen[0])
	{
	    dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32WtLen[0], enDir);
	    dsp_memcpy(pu8Write, pu8Read, u32WtLen[1], enDir);
	    u32ReadPos = u32WtLen[1];
	    u32WritePos = u32WtLen[1];
	}
	else if (u32RdLen[0] > u32WtLen[0])
	{
	    dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32WtLen[0], enDir);
	    u32ReadPos += u32WtLen[0];
	    dsp_memcpy(pu8Write, pu8Read + u32ReadPos, u32RdLen[0] - u32WtLen[0], enDir);
	    u32WritePos = u32RdLen[0] - u32WtLen[0];
	    dsp_memcpy(pu8Write + u32WritePos, pu8Read, u32RdLen[1], enDir);
	    u32WritePos += u32RdLen[1];
	    u32ReadPos = u32RdLen[1];
	}
	else
	{
	    dsp_memcpy(pu8Write + u32WritePos, pu8Read + u32ReadPos, u32RdLen[0], enDir);
	    u32WritePos += u32RdLen[0];
	    dsp_memcpy(pu8Write + u32WritePos, pu8Read, u32WtLen[0] - u32RdLen[0], enDir);
	    u32ReadPos = u32WtLen[0] - u32RdLen[0];
	    dsp_memcpy(pu8Write, pu8Read + u32ReadPos, u32WtLen[1], enDir);
	    u32WritePos = u32WtLen[1];
	    u32ReadPos += u32WtLen[1];
	}
    }

    if (u32ReadPos == pstSrcCb->u32Lenght)
    {
	u32ReadPos = 0;
    }

    if (u32WritePos == pstDesCb->u32Lenght)
    {
	u32WritePos = 0;
    }

    *(pstSrcCb->pu32Read) = u32ReadPos;
    *(pstDesCb->pu32Write) = u32WritePos;

    return u32Len;
}


static inline HI_VOID CIRC_BUF_GetCompressInfo(CIRC_BUF_S* pstCb, HI_U32* pu32ValidBytes, HI_U32* pu32ZeroBytes)
{
#define	 IEC_61937_SYNC1 0xF872
#define	 IEC_61937_SYNC2 0x4E1F
    HI_U32 u32ReadPos;
    HI_U8* pu8Read;

    HI_U16* pu16Pa, *pu16Pb;

    pu8Read = (HI_U8*)(pstCb->pu8Data);
    u32ReadPos	= *(pstCb->pu32Read);

    //Pa
    pu16Pa = (HI_U16*)(pu8Read + u32ReadPos);
    u32ReadPos += 2;

    if (u32ReadPos >= pstCb->u32Lenght)
    {
	u32ReadPos = 0;
    }

    //Pb
    pu16Pb = (HI_U16*)(pu8Read + u32ReadPos);

    if (*pu16Pa <= 0)
    {
	return;
    }

    if (*pu16Pa != 0xffff && *pu16Pb < *pu16Pa)
    {
	return;
    }

    *pu32ValidBytes = *pu16Pa;

    if (*pu16Pa == 0xffff)
    {
	*pu32ValidBytes = 0;
	*pu32ZeroBytes = *pu16Pb;

	u32ReadPos += 2;
	if (u32ReadPos >= pstCb->u32Lenght)
	{
	    u32ReadPos = 0;
	}
	*(pstCb->pu32Read) = u32ReadPos;
	return;
    }
    else
    {
	*pu32ZeroBytes = *pu16Pb - *pu32ValidBytes;
    }

    *pu16Pa = IEC_61937_SYNC1;
    *pu16Pb = IEC_61937_SYNC2;
}

static inline HI_VOID CIRC_BUF_UpdateRptr(CIRC_BUF_S* pstCb, HI_U32 u32Len)
{
    HI_U32 u32RdLen[2] = {0, 0}, u32RdPos[2] = {0, 0}, i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32RdPos[0] = u32ReadPos;

    if (u32WritePos >= u32ReadPos)
    {
	if (u32WritePos >= u32ReadPos + u32Len)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = u32WritePos - u32ReadPos;
	}
    }
    else
    {
	if (u32ReadPos + u32Len <= pstCb->u32Lenght)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = pstCb->u32Lenght - u32ReadPos;

	    u32RdPos[1] = 0;
	    u32RdLen[1] = u32Len - u32RdLen[0];

	    if (u32WritePos < u32RdLen[1])
	    {
		u32RdLen[1] = u32WritePos;
	    }
	}
    }

    for (i = 0; (i < 2) && (u32RdLen[i] != 0); i++)
    {
	u32ReadPos = u32RdPos[i] + u32RdLen[i];
    }

    if (u32ReadPos == pstCb->u32Lenght)
    {
	u32ReadPos = 0;
    }

    *(pstCb->pu32Read) = u32ReadPos;

    return;
}

static inline HI_VOID CIRC_BUF_UpdateWptr(CIRC_BUF_S* pstCb, HI_U32 u32Len)
{
    HI_U32 u32WtLen[2] = {0, 0};
    HI_U32 u32WtPos[2] = {0, 0};
    HI_U32 i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32WtPos[0] = u32WritePos;

    if (u32WritePos >= u32ReadPos)
    {
	if (pstCb->u32Lenght >= (u32WritePos + u32Len))
	{
	    u32WtLen[0] = u32Len;
	}
	else
	{
	    u32WtLen[0] = pstCb->u32Lenght - u32WritePos;
	    u32WtLen[1] = u32Len - u32WtLen[0];

	    u32WtPos[1] = 0;
	}
    }
    else
    {
	u32WtLen[0] = u32Len;
    }

    for (i = 0; (i < 2) && (u32WtLen[i] != 0); i++)
    {
	u32WritePos = u32WtPos[i] + u32WtLen[i];
    }

    if (u32WritePos == pstCb->u32Lenght)
    {
	u32WritePos = 0;
    }

    *(pstCb->pu32Write) = u32WritePos;

    return;
}


static inline HI_U32 CIRC_BUF_ReadDma(CIRC_BUF_S* pstCb, HI_U8* pDest, HI_U32 u32Len, HI_U32 *pu32Rptr)
{
    HI_U8*  pVirAddr   = NULL;
    HI_U32 u32RdLen[2] = {0, 0}, u32RdPos[2] = {0, 0}, i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    if(pu32Rptr)
    {
	u32ReadPos  = *pu32Rptr;
    }

    u32RdPos[0] = u32ReadPos;

    if (u32WritePos >= u32ReadPos)
    {
	if (u32WritePos >= u32ReadPos + u32Len)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = u32WritePos - u32ReadPos;
	}
    }
    else
    {
	if (u32ReadPos + u32Len <= pstCb->u32Lenght)
	{
	    u32RdLen[0] = u32Len;
	}
	else
	{
	    u32RdLen[0] = pstCb->u32Lenght - u32ReadPos;

	    u32RdPos[1] = 0;
	    u32RdLen[1] = u32Len - u32RdLen[0];

	    if (u32WritePos < u32RdLen[1])
	    {
		u32RdLen[1] = u32WritePos;
	    }
	}
    }

    for (i = 0; (i < 2) && (u32RdLen[i] != 0); i++)
    {
	pVirAddr = (HI_U8*)(pstCb->pu8Data + u32RdPos[i]);

	if (HI_NULL != pDest)
	{
	    adsp_memcpy(pDest, pVirAddr, u32RdLen[i]);
	    pDest += u32RdLen[i];
	}

	u32ReadPos = u32RdPos[i] + u32RdLen[i];
    }

    if (u32ReadPos == pstCb->u32Lenght)
    {
	u32ReadPos = 0;
    }

    if (!pu32Rptr)
    {
	*(pstCb->pu32Read) = u32ReadPos;
    }
    else
    {
	*pu32Rptr = u32ReadPos;
    }

    return u32RdLen[0] + u32RdLen[1];
}

static inline HI_U32 CIRC_BUF_WriteDma(CIRC_BUF_S* pstCb, HI_U8* pDest, HI_U32 u32Len)
{
    HI_U32*  pVirAddr = NULL;

    HI_U32 u32WtLen[2] = {0, 0};
    HI_U32 u32WtPos[2] = {0, 0};
    HI_U32 i;
    HI_U32 u32ReadPos, u32WritePos;

    u32ReadPos	= *(pstCb->pu32Read);
    u32WritePos = *(pstCb->pu32Write);

    u32WtPos[0] = u32WritePos;

    if (u32WritePos >= u32ReadPos)
    {
	if (pstCb->u32Lenght >= (u32WritePos + u32Len))
	{
	    u32WtLen[0] = u32Len;
	}
	else
	{
	    u32WtLen[0] = pstCb->u32Lenght - u32WritePos;
	    u32WtLen[1] = u32Len - u32WtLen[0];

	    u32WtPos[1] = 0;
	}
    }
    else
    {
	if (u32ReadPos > (u32WritePos + u32Len))
	{
	    u32WtLen[0] = u32Len;
	}
	else
	{
	    u32WtLen[0] = u32ReadPos - u32WritePos;
	}
    }

    for (i = 0; (i < 2) && (u32WtLen[i] != 0); i++)
    {
	 pVirAddr = (HI_U32 *)(pstCb->pu8Data + u32WtPos[i]);

	if (HI_NULL == pDest)
	{
	    adsp_memset(pVirAddr, 0, u32WtLen[i]);
	}
	else
	{
	    adsp_memcpy(pVirAddr, pDest, u32WtLen[i]);
	    pDest = pDest + u32WtLen[i];
	}

	u32WritePos = u32WtPos[i] + u32WtLen[i];
    }

    if (u32WritePos >= pstCb->u32Lenght)
    {
	u32WritePos = 0;
    }

    *(pstCb->pu32Write) = u32WritePos;

    return u32WtLen[0] + u32WtLen[1];
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif/* End of #ifdef __cplusplus */

#endif /* End of #ifndef __SIMPLE_CB_H__*/
