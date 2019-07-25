#ifndef __MSGQUE_H__
#define	 __MSGQUE_H__

#include "vfmw.h"
#include "vfmw_linux_kernel_osal.h"
#include "mem_manage.h"

#include "simple_core.h"
#include "user_com_dev_ext.h"
#include "user_common_type.h"

#define MSQ_OK	 0
#define MSQ_ERR -1

typedef enum
{
    MSQ_QUEUE_NULL	= 0,
    MSQ_QUEUE_Waiting  = 1,
    MSQ_QUEUE_FINISH	= 2,
} MSG_QUEUE_STATE_E;

typedef struct hiMsgQueueData
{
   MSG_QUEUE_STATE_E eState;
   SINT32 ChanID;
   UINT32 CmdID;
   VFMW_HID_E eHandID;
   SINT32 s32RetValue;
   SINT32 s32InsertTime;
   SINT32 s32GetTime;
   SINT32 s32UpdateTime;
   OSAL_EVENT stCmdEvent;
   VOID *pArgs;
   UINT32 ArgsLen;
   SINT32 Level;
   SINT32 IsBlock;
   //HI_U64 NodeAddr;
} MSG_QUEUE_DATA;

typedef struct hiMsQueueNode
{
    MSG_QUEUE_DATA stMsgData;
    struct hiMsQueueNode *pNextNode;
} MSG_QUEUE_NODE;

typedef struct hiMsgQueue
{
    MSG_QUEUE_NODE *pFrontDealNode; // point to the first node to be deal with
    MSG_QUEUE_NODE *pFrontRetNode;  // point to the first node be dealed with
    MSG_QUEUE_NODE *pRearNode;	    // point to the last node
    UINT32 u32NodeNum;		    // the number of Msg of queue
} MSG_QUEUE_INFO;


SINT32 MSGQUE_InitQueue(MSG_QUEUE_INFO *pMsgQueue);
SINT32 MSGQUE_DeinitQueue(MSG_QUEUE_INFO *pMsgQueue);
SINT32 MSGQUE_InsertMsg(MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode);
SINT32 MSGQUE_InsertMsgFromHead(MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode);
SINT32 MSGQUE_DelMsg(MSG_QUEUE_INFO *pMsgQueue, MSG_QUEUE_NODE *pMsgNode);
SINT32 MSGQUE_DelMsgBurst(MSG_QUEUE_INFO *pMsgQueue, SINT32 ChanID);
MSG_QUEUE_NODE *MSGQUE_GetMsg(MSG_QUEUE_INFO *pMsgQueue);
MSG_QUEUE_NODE *MSGQUE_GetMsgWithTime(MSG_QUEUE_INFO *pMsgQueue, SINT32 MsgTime);

#endif
