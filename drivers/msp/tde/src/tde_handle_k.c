/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : tde_handle_k.c
Version		    : Initial Draft
Author		    :
Created		    : 2015/07/11
Description	    :
Function List	    :
History		    :
Date				Author			Modification
2015/07/11						Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/list.h>
#include <linux/mm.h>
#include "hi_gfx_comm_k.h"
#include "tde_define.h"
#include "tde_handle.h"

STATIC HI_HANDLE_MGR *s_pstTdeHandleList = NULL; /* Manager list of global handle */

STATIC HI_S32 s_handle = 1; /* handle=0, reserve */
STATIC spinlock_t s_handlelock;

 HI_BOOL  initial_handle(HI_VOID)
{
    if (NULL == s_pstTdeHandleList)
    {
	s_pstTdeHandleList = (HI_HANDLE_MGR *) HI_GFX_KMALLOC(HIGFX_TDE_ID,sizeof(HI_HANDLE_MGR),GFP_KERNEL);
	if (NULL == s_pstTdeHandleList)
	{
	    return HI_FALSE;
	}

	/* Initialize list head */
	INIT_LIST_HEAD(&s_pstTdeHandleList->stHeader);
	spin_lock_init(&s_pstTdeHandleList->lock);
	spin_lock_init(&s_handlelock);
    }

    s_handle = 1;

    return HI_TRUE;
}


 HI_VOID  get_handle(HI_HANDLE_MGR *res, HI_S32 *handle)
{
    HI_SIZE_T lockflags;
    HI_SIZE_T handlockflags;
    TDE_LOCK(&s_handlelock, handlockflags);
    /* Jump over unlawful handle */
    if (TDE_MAX_HANDLE_VALUE == s_handle)
    {
	s_handle = 1;
    }
    res->handle = s_handle;
    *handle = s_handle++;
    TDE_UNLOCK(&s_handlelock, handlockflags);
    TDE_LOCK(&s_pstTdeHandleList->lock,lockflags);
    list_add_tail(&res->stHeader, &s_pstTdeHandleList->stHeader);
    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
}

/* To accelerate the speed of find, find form back to front */
 HI_BOOL  query_handle(HI_S32 handle, HI_HANDLE_MGR **res)
{
    HI_SIZE_T lockflags;

    HI_HANDLE_MGR *pstHandle =NULL;
    TDE_LOCK(&s_pstTdeHandleList->lock,lockflags);
    pstHandle = list_entry(s_pstTdeHandleList->stHeader.prev, HI_HANDLE_MGR, stHeader);
    while (pstHandle != s_pstTdeHandleList)
    {
	if (pstHandle->handle == handle)
	{
	    *res = pstHandle;
	    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
	    return HI_TRUE;
	}
	pstHandle = list_entry(pstHandle->stHeader.prev, HI_HANDLE_MGR, stHeader);

    }
    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
    return HI_FALSE;
}

 HI_BOOL  release_handle(HI_S32 handle)
{
    HI_SIZE_T lockflags;
    HI_HANDLE_MGR *pstHandle = NULL;
    TDE_LOCK(&s_pstTdeHandleList->lock,lockflags);
    pstHandle = list_entry(s_pstTdeHandleList->stHeader.next, HI_HANDLE_MGR, stHeader);
    while (pstHandle != s_pstTdeHandleList)
    {
	if (pstHandle->handle == handle)
	{
	    list_del_init(&pstHandle->stHeader);
	    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
	    return HI_TRUE;
	}
	pstHandle = list_entry(pstHandle->stHeader.next, HI_HANDLE_MGR, stHeader);
    }
    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
    return HI_FALSE;
}

 HI_VOID destroy_handle(HI_VOID)
{
	/* Free head node, note: other nodes are all loaded, their resource  are responsibilited by its own module */
    if (NULL != s_pstTdeHandleList)
    {
	    HI_GFX_KFREE(HIGFX_TDE_ID,s_pstTdeHandleList);
	s_pstTdeHandleList = NULL;
    }

    return;
}

HI_VOID TdeFreePendingJob(HI_VOID)
{
    HI_HANDLE_MGR *pstHandle;
    HI_HANDLE_MGR *pstSave;
    TDE_SWJOB_S *pstJob;
    pid_t pid;
    HI_SIZE_T lockflags;

    pid = current->tgid;

    TDE_LOCK(&s_pstTdeHandleList->lock,lockflags);
    pstHandle = list_entry(s_pstTdeHandleList->stHeader.next, HI_HANDLE_MGR, stHeader);
    if(NULL==pstHandle)
    {
	TDE_FATAL("No pending job!!\n");
	TDE_UNLOCK(&s_pstTdeHandleList->lock, lockflags);
	return;
    }
    while (pstHandle != s_pstTdeHandleList)
    {
	pstSave = pstHandle;
	pstJob = (TDE_SWJOB_S *)pstSave->res;
	/* FIXME debug */
	if(NULL==pstJob)
	{
	    TDE_FATAL("ERR:pstJob Null Pointer!!!\n");
	    TDE_UNLOCK(&s_pstTdeHandleList->lock, lockflags);
	    return;
	}
	/* FIXME END */
	pstHandle = list_entry(pstHandle->stHeader.next, HI_HANDLE_MGR, stHeader);
	if(NULL==pstHandle)
	{
	    TDE_FATAL("ERR: pstHandle Null Pointer!!\n");
	    TDE_UNLOCK(&s_pstTdeHandleList->lock, lockflags);
	    return;
	}
	/** free when it is not submitted */
	if ((!pstJob->bSubmitted)&&(pid==pstJob->pid))
	{
	    /** free handle resource */
	    TdeOsiListFreeSerialCmd(pstJob->pstFirstCmd, pstJob->pstTailNode);
	    list_del_init(&pstSave->stHeader);
	    TDE_FREE(pstSave);
	}

    }
    TDE_UNLOCK(&s_pstTdeHandleList->lock,lockflags);
    return;
}
