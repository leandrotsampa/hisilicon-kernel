
#include "user_client_com.h"
#include "user_msgque.h"
#include "user_com_dev_ext.h"

static MSG_QUEUE_INFO g_ComMsgQueue;
static OSAL_TASK_MUTEX g_ComIntEvent;

OSAL_IRQ_SPIN_LOCK g_SpinLock_MsgNode;

SINT32 VFMW_UC_Com_Init(VOID)
{
    SINT32 ret;

    OSAL_InitEvent(&g_ComIntEvent, 0);

    OSAL_SpinLockIRQInit(&g_SpinLock_MsgNode);

    ret = MSGQUE_InitQueue(&g_ComMsgQueue);

    return (ret==MSQ_OK)? VDEC_OK: VDEC_ERR;
}

SINT32 VFMW_UC_Com_DeInit(VOID)
{
    SINT32 ret;

    ret = MSGQUE_DeinitQueue(&g_ComMsgQueue);

    return (ret==MSQ_OK)? VDEC_OK: VDEC_ERR;
}

VOID VFMW_UC_Com_PrepareData(VFMW_UCC_DATA *pUccData, VFMW_HID_E eHandleID, UINT32 CmdID, VOID *pData, UINT32 DataLen, SINT32 ChanID)
{
    memset(pUccData, 0, sizeof(VFMW_UCC_DATA));

    pUccData->eHandleID = eHandleID;
    pUccData->CmdID	= CmdID;
    pUccData->pArgs	= pData;
    pUccData->ArgsLen	= DataLen;
    pUccData->ChanID	= ChanID;
    pUccData->IsBlock	= 1;
    pUccData->Level	= 0;

    return;
}

SINT32 VFMW_UC_Com_Process(VFMW_UCC_DATA *pUccData)
{
    SINT32 ret;
    MSG_QUEUE_NODE *pMsgNode = NULL;

    if (pUccData == NULL)
    {
	dprint(PRN_ERROR, "%s: input param error!\n", __func__);
	return VDEC_ERR;
    }

    if (current->files == NULL)
    {
	dprint(PRN_ERROR, "%s: process %d (current->files = null) already been killed, not need to handle.\n", __func__, current->pid);
	return VDEC_OK;
    }

    pMsgNode = (MSG_QUEUE_NODE *)OSAL_KmallocVirMem(sizeof(MSG_QUEUE_NODE));

    memset(pMsgNode, 0x0, sizeof(MSG_QUEUE_NODE));
    pMsgNode->stMsgData.eState	= MSQ_QUEUE_Waiting;
    pMsgNode->stMsgData.ChanID	= pUccData->ChanID;
    pMsgNode->stMsgData.eHandID = pUccData->eHandleID;
    pMsgNode->stMsgData.CmdID	= pUccData->CmdID;
    pMsgNode->stMsgData.pArgs	= pUccData->pArgs;
    pMsgNode->stMsgData.ArgsLen = pUccData->ArgsLen;
    pMsgNode->stMsgData.Level	= pUccData->Level;
    pMsgNode->stMsgData.IsBlock = pUccData->IsBlock;
    pMsgNode->stMsgData.s32RetValue = VDEC_ERR;

    OSAL_InitEvent(&pMsgNode->stMsgData.stCmdEvent, 0);

    if(pUccData->Level == 0)
    {
	ret = MSGQUE_InsertMsg(&g_ComMsgQueue, pMsgNode);
    }
    else
    {
	ret = MSGQUE_InsertMsgFromHead(&g_ComMsgQueue, pMsgNode);
    }

    if (ret != MSQ_OK)
    {
	OSAL_KfreeVirMem(pMsgNode);
	dprint(PRN_ERROR, "%s: insert msgqueue fail! ret = %d\n", __func__, ret);
	ret = VDEC_ERR;
	goto EXIT;
    }

    OSAL_GiveEvent(&g_ComIntEvent);

    if (pUccData->IsBlock == 0)
    {
	ret = VDEC_OK;
	goto EXIT;
    }

    if (OSAL_WaitEvent(&pMsgNode->stMsgData.stCmdEvent, 1000) != OSAL_OK)
    {
	dprint(PRN_ERROR, "%s OSAL_WaitEvent timeout!!! eHandID %d, CmdID %d, RetValue = 0x%x\n", __func__, pMsgNode->stMsgData.eHandID, pMsgNode->stMsgData.CmdID, pMsgNode->stMsgData.s32RetValue);
    }

    ret = pMsgNode->stMsgData.s32RetValue;
    if (ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "Warning, msg eHandleID %d CmdID %d return %d\n", pUccData->eHandleID, pUccData->CmdID, ret);
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgNode);
    MSGQUE_DelMsg(&g_ComMsgQueue, pMsgNode);
    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);

EXIT:
    if (pUccData->eHandleID == VFMW_HID_CONTROL && pUccData->CmdID == VDEC_CID_DESTROY_CHAN)
    {
	MSGQUE_DelMsgBurst(&g_ComMsgQueue, pUccData->ChanID);
    }

    return ret;
}

SINT32 VFMW_UC_Com_GetMsg(UCS_MSG_DATA *pGetMsg)
{
    SINT32 ret;
    MSG_QUEUE_NODE *pMsgNode = NULL;
    MSG_QUEUE_DATA *pMsgData = NULL;

    if (pGetMsg == NULL)
    {
	dprint(PRN_ERROR, "%s: pGetMsg = NULL!\n", __func__);
	return VDEC_ERR;
    }

    OSAL_SpinLockIRQ(&g_SpinLock_MsgNode);

    pMsgNode = MSGQUE_GetMsg(&g_ComMsgQueue);
    if (pMsgNode == NULL)
    {
	OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);
	ret = OSAL_WaitEvent(&g_ComIntEvent, 100);
	if (ret == OSAL_ERR)
	{
	    return VDEC_ERR;
	}
	OSAL_SpinLockIRQ(&g_SpinLock_MsgNode);

	pMsgNode = MSGQUE_GetMsg(&g_ComMsgQueue);
	if (pMsgNode == NULL)
	{
	    dprint(PRN_DBG, "%s: no message.\n", __func__);
	    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);

	    return VDEC_ERR;
	}
    }

    pMsgData = &(pMsgNode->stMsgData);
    pGetMsg->HandleID = pMsgData->eHandID;
    pGetMsg->CmdID    = pMsgData->CmdID;
    pGetMsg->ChanID   = pMsgData->ChanID;

    if ((pMsgData->pArgs != NULL) && (pMsgData->ArgsLen != 0))
    {
	memcpy(pGetMsg->Args, pMsgData->pArgs, pMsgData->ArgsLen);
    }

    pGetMsg->MsgTime = pMsgData->s32GetTime;
    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);

    return VDEC_OK;
}

SINT32 VFMW_UC_Com_RetMsg(UCS_MSG_DATA *pRetMsg)
{
    MSG_QUEUE_DATA* pMsgData = NULL;
    MSG_QUEUE_NODE *pMsgNode = NULL;
    SINT32 MsgTime = pRetMsg->MsgTime;

    if (pRetMsg == NULL)
    {
	dprint(PRN_ERROR, "%s: pRetMsg = NULL!\n", __func__);
	return VDEC_ERR;
    }
    OSAL_SpinLockIRQ(&g_SpinLock_MsgNode);

    pMsgNode = MSGQUE_GetMsgWithTime(&g_ComMsgQueue, MsgTime);
    if (NULL == pMsgNode)
    {
	dprint(PRN_ERROR, "%s %d Get message with time failed!\n", __func__, __LINE__);
	OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);

	return VDEC_ERR;
    }

    pMsgData = &(pMsgNode->stMsgData);
    pMsgData->s32RetValue = pRetMsg->RetValue;
    pMsgData->eState = MSQ_QUEUE_FINISH;

    if (pMsgData->pArgs != NULL && pMsgData->ArgsLen != 0)
    {
	memcpy(pMsgData->pArgs, pRetMsg->Args, pMsgData->ArgsLen);
    }

    if (pMsgData->IsBlock == 0)
    {
	MSGQUE_DelMsg(&g_ComMsgQueue, pMsgNode);
    }
    else
    {
	OSAL_GiveEvent(&(pMsgData->stCmdEvent));
    }

    OSAL_SpinUnLockIRQ(&g_SpinLock_MsgNode);

    return VDEC_OK;
}

#ifdef VCODEC_UT_ENABLE
EXPORT_SYMBOL(VFMW_UC_Com_Init);
EXPORT_SYMBOL(VFMW_UC_Com_DeInit);
EXPORT_SYMBOL(VFMW_UC_Com_Process);
EXPORT_SYMBOL(VFMW_UC_Com_GetMsg);
EXPORT_SYMBOL(VFMW_UC_Com_RetMsg);
#endif
