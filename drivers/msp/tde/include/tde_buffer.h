/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : tde_buffer.h
Version		    : Initial Draft
Author		    :
Created		    : 2014/06/20
Description	    :
Function List	    :
History		    :
Date			    Author		    Modification
2014/06/20				   Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __TDE_BUFFER_H__
#define	 __TDE_BUFFER_H__

#include "tde_define.h"

STATIC HI_U32 s_u32TDEPhyBuff = 0;
STATIC HI_U32 s_u32TDEBuffRef = 0;
static spinlock_t s_TDEBuffLock;
static HI_SIZE_T s_TDEBuffLockFlags;
STATIC HI_U32  TDE_AllocPhysicBuff(HI_U32 u32CbCrOffset)
{
    HI_U32 u32PhyAddr;
    HI_U32 u32CscBufferSize;

	HI_BOOL bMmu = HI_TRUE;

	u32CscBufferSize = 0x0;
    TDE_LOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
    if (0 == s_u32TDEPhyBuff)
    {
	if((u32CbCrOffset*3) > u32CscBufferSize)
	{
	    TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
	    return 0;
	}

	TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);

	    u32PhyAddr = HI_GFX_AllocMem("TDE_TEMP_BUFFER", "iommu",u32CscBufferSize, &bMmu);
	if(0 == u32PhyAddr)
	{
	    return 0;
	}

	TDE_LOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
	if (0 == s_u32TDEPhyBuff)
	{
	    s_u32TDEPhyBuff = u32PhyAddr;
	    s_u32TDEBuffRef = 0;
	}
	else
	{
	    s_u32TDEBuffRef++;
	    TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
		HI_GFX_FreeMem(u32PhyAddr, bMmu);
	    return s_u32TDEPhyBuff + u32CbCrOffset;
	}

    }

    s_u32TDEBuffRef++;
    TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);

    return s_u32TDEPhyBuff + u32CbCrOffset;
}

STATIC HI_VOID TDE_FreePhysicBuff(HI_VOID)
{
    TDE_LOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
    if (0 == s_u32TDEBuffRef)
    {
	TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
	return;
    }

    s_u32TDEBuffRef--;
    if (0 == s_u32TDEBuffRef)
    {
	HI_U32 u32PhyBuff = s_u32TDEPhyBuff;
	s_u32TDEPhyBuff = 0;
	TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
		HI_GFX_FreeMem(u32PhyBuff, HI_TRUE);
	return;
    }
    TDE_UNLOCK(&s_TDEBuffLock, s_TDEBuffLockFlags);
}

#endif /* __HI_HANDLE_MGR_H__ */
