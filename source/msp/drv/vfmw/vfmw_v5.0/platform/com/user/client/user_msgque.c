
#include "user_msgque.h"


OSAL_IRQ_SPIN_LOCK g_SpinLock_MsgQueue;

static SINT32 MSGQUE_DelMsgNode(MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode)
{
    MSG_QUEUE_NODE *pNode = NULL;
    MSG_QUEUE_NODE *pTmpNode = NULL;

    pNode = pMsgQueue->pFrontDealNode;
    if (pNode == pMsgNode)
    {
	pMsgQueue->pFrontDealNode = pNode->pNextNode;
	pMsgQueue->u32NodeNum--;
	OSAL_KfreeVirMem(pNode);
	pNode = NULL;
	if (pMsgQueue->u32NodeNum == 0)
	{
	    pMsgQueue->pFrontDealNode = NULL;
	    pMsgQueue->pRearNode = NULL;
	}

	return MSQ_OK;
    }

    while(pNode->pNextNode != NULL && pNode->pNextNode != pMsgNode)
    {
	pNode = pNode->pNextNode;
    }

    if (pNode->pNextNode == NULL)
    {
	return MSQ_ERR;
    }

    pTmpNode = pNode->pNextNode;

    if (pTmpNode == pMsgQueue->pRearNode)
    {
	pMsgQueue->pRearNode = pNode;
    }
    pNode->pNextNode = pTmpNode->pNextNode;
    pMsgQueue->u32NodeNum--;
    OSAL_KfreeVirMem(pTmpNode);
    pTmpNode = NULL;

    return MSQ_OK;
}

SINT32 MSGQUE_InitQueue(MSG_QUEUE_INFO *pMsgQueue)
{
    OSAL_SpinLockIRQInit(&g_SpinLock_MsgQueue);

    if (NULL == pMsgQueue)
    {
	return MSQ_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    memset(pMsgQueue, 0, sizeof(MSG_QUEUE_INFO));
    pMsgQueue->pFrontDealNode  = NULL;
    pMsgQueue->pFrontRetNode = NULL;
    pMsgQueue->pRearNode = NULL;
    pMsgQueue->u32NodeNum = 0;

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return MSQ_OK;
}

SINT32 MSGQUE_DeinitQueue(MSG_QUEUE_INFO *pMsgQueue)
{
    MSG_QUEUE_NODE *pNode = NULL;
    MSG_QUEUE_NODE *pNextnode = NULL;

    if (NULL == pMsgQueue)
    {
	return MSQ_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    while (NULL != pMsgQueue->pFrontDealNode)
    {
	pNode = pMsgQueue->pFrontDealNode;
	pNextnode = pMsgQueue->pFrontDealNode->pNextNode;
	pMsgQueue->pFrontDealNode = pNextnode;
	OSAL_KfreeVirMem(pNode);
	pNode = NULL;
    }

    pMsgQueue->u32NodeNum = 0;
    pMsgQueue->pFrontDealNode = NULL;
    pMsgQueue->pFrontRetNode = NULL;
    pMsgQueue->pRearNode = NULL;

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return MSQ_OK;
}

SINT32 MSGQUE_InsertMsg( MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode )
{
    SINT32 s32Ret = MSQ_OK;

    if (NULL == pMsgNode || NULL == pMsgQueue)
    {
	return MSQ_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    if (NULL == pMsgQueue->pFrontDealNode)
    {
	pMsgQueue->pFrontDealNode = pMsgNode;
    }
    else
    {
	pMsgQueue->pRearNode->pNextNode = pMsgNode;
    }

    pMsgQueue->pRearNode = pMsgNode;
    pMsgQueue->u32NodeNum++;

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return s32Ret;
}

SINT32 MSGQUE_InsertMsgFromHead( MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode )
{
    SINT32 s32Ret = MSQ_OK;

    if (NULL == pMsgNode || NULL == pMsgQueue)
    {
	return -1;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    if (NULL == pMsgQueue->pFrontDealNode)
    {
	pMsgQueue->pFrontDealNode = pMsgNode;
	pMsgQueue->pRearNode = pMsgNode;
    }
    else
    {
	MSG_QUEUE_NODE *tmpNode = pMsgQueue->pFrontDealNode;
	pMsgNode->pNextNode = tmpNode;
	pMsgQueue->pFrontDealNode = pMsgNode;
    }

    pMsgQueue->u32NodeNum++;

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return s32Ret;
}

MSG_QUEUE_NODE *MSGQUE_GetMsg(MSG_QUEUE_INFO *pMsgQueue)
{
    SINT32  s32Ret = MSQ_OK;
    MSG_QUEUE_NODE* pmsgnode = NULL;
    MSG_QUEUE_DATA* pmsgdata = NULL;

    if (NULL == pMsgQueue)
    {
	return NULL;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    if (NULL == pMsgQueue->pFrontDealNode)
    {
	s32Ret = MSQ_ERR;
	goto exit0;
    }

    pmsgnode = pMsgQueue->pFrontDealNode;
    pmsgnode->stMsgData.s32GetTime = OSAL_GetTimeInMs();
    pmsgdata = &(pmsgnode->stMsgData);

    if (!pmsgdata)
    {
	dprint(PRN_ERROR, "%s pmsgdata = null!\n", __func__);
	s32Ret = MSQ_ERR;
	goto exit0;
    }

    if (pmsgdata->eState == MSQ_QUEUE_Waiting)
    {
	OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);
	return pmsgnode;
    }
    else
    {
	s32Ret = MSQ_ERR;
	goto exit0;
    }

exit0:
    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return NULL;
}

MSG_QUEUE_NODE *MSGQUE_GetMsgWithTime(MSG_QUEUE_INFO *pMsgQueue, SINT32 MsgTime)
{
    MSG_QUEUE_NODE *pMsgNode = NULL;

    if (NULL == pMsgQueue || NULL == pMsgQueue->pFrontDealNode)
    {
	dprint(PRN_ERROR, "%s: MsgQueue is empty!\n", __func__);

	return NULL;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    pMsgNode = pMsgQueue->pFrontDealNode;

    while(pMsgNode != NULL && pMsgNode->stMsgData.s32GetTime != MsgTime)
    {
	pMsgNode = pMsgNode->pNextNode;
    }

    if (pMsgNode == NULL)
    {
	dprint(PRN_ERROR, "%s: Not find the Message Node!\n", __func__);
	OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

	return NULL;
    }

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return pMsgNode;
}

SINT32 MSGQUE_DelMsg(MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode)
{
    SINT32 s32Ret;

    if (pMsgQueue == NULL || pMsgNode == NULL)
    {
	return MSQ_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    s32Ret = MSGQUE_DelMsgNode(pMsgQueue, pMsgNode);

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return s32Ret;
}

SINT32 MSGQUE_DelMsgBurst(MSG_QUEUE_INFO *pMsgQueue, SINT32 ChanID)
{
    MSG_QUEUE_NODE *pNode = NULL;
    MSG_QUEUE_NODE *pNextNode = NULL;

    if (NULL == pMsgQueue)
    {
	return MSQ_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgQueue);

    for (pNode = pMsgQueue->pFrontDealNode; pNode != pMsgQueue->pRearNode && pNode != NULL; )
    {
	pNextNode = pNode->pNextNode;
	if (pNode->stMsgData.ChanID == ChanID)
	{
	    MSGQUE_DelMsgNode(pMsgQueue, pNode);
	}
	pNode = pNextNode;
    }

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgQueue);

    return MSQ_OK;
}
