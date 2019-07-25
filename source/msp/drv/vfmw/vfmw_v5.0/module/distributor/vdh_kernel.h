#ifndef __VDH_KERNEL_H__
#define __VDH_KERNEL_H__

#include "vfmw_log.h"
#include "vdh_common.h"
#include "vdh_module.h"
#include "vfmw_linux_kernel_osal.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
    DISTRIBUTOR_SLEEPING = 0,
    DISTRIBUTOR_RUNNING,
    DISTRIBUTOR_EXITED,
}DISTRIBUTOR_STATE_E;

typedef enum
{
    CMD_SLEEP = 0,
    CMD_RUN,
    CMD_EXIT,
}DISTRIBUTOR_CMD_E;

typedef struct
{
    UINT8		    InUsed;
    OSAL_LIST_HEAD	    Node;
    TASK_PARAM_S	    Task;
}TASK_NODE_S;

typedef struct
{
    UINT32		    TaskNum;
    TASK_NODE_S		    TaskNode;
    OSAL_LIST_HEAD	    TaskList;
    OSAL_RW_LOCK	    TaskLock;
}TASK_LIST_S;

typedef struct
{
    TASK_LIST_S		    NormalScdTask[SCD_MODULE_NUM];
    TASK_LIST_S		    NormalMfdeTask[MFDE_MODULE_NUM];

    DISTRIBUTOR_CMD_E	    DistributorCommand;
    DISTRIBUTOR_STATE_E	    DistributorState;
    OSAL_TASK		    DistributorThread;
    OSAL_EVENT_L	    ThreadEvent;

    VDH_COMMON_CTX_S	   *pCommonContext;

}VDH_NORMAL_CTX_S;

/******************************************
 Get Common Context
******************************************/
VDH_COMMON_CTX_S* VDH_Get_CommonCtx(VOID);

#if 0
/******************************************
 check if some task wait to do
******************************************/
SINT32 VDH_TaskInUse(MODULE_TYPE_E Type, UINT8 ModuleId);
#endif


/******************************************
 Insert Task into list
******************************************/
SINT32 VDH_PostTask(TASK_PARAM_S *pTask);

/******************************************
 Need module notification
******************************************/
SINT32 VDH_Need_Module(MODULE_TYPE_E Type, SINT32 ModuleID);

/******************************************
 UnNeed module notification
******************************************/
SINT32 VDH_UnNeed_Module(MODULE_TYPE_E Type, SINT32 ModuleID);

/******************************************
 Reset Module
******************************************/
SINT32 VDH_Reset_Module(MODULE_TYPE_E Type, SINT32 ModuleID);

/******************************************
 Require to load dsp code
******************************************/
SINT32 VDH_Require_DspCode(SINT32 DspID, DSP_REQUIRE_E Type);

#ifdef __cplusplus
}
#endif

#endif
