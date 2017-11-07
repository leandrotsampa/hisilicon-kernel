#include "vdh_kernel.h"

/*=============== LOCAL VALUE =================*/
VDH_NORMAL_CTX_S  NormalCtx;

/*============== INTERNAL FUNCTION =============*/
/******************************************
 Clear specific task list
******************************************/
SINT32 VDH_Clear_TaskList(MODULE_TYPE_E Type, SINT32 ModuleID)
{
    TASK_NODE_S	   *pTaskNode  = NULL;
    TASK_NODE_S	   *pTempNode  = NULL;
    TASK_LIST_S	   *pTaskList  = NULL;

    switch(Type)
    {
	case MODULE_SCD:
	    pTaskList  = &NormalCtx.NormalScdTask[ModuleID];
	    break;

	case MODULE_MFDE:
	    pTaskList  = &NormalCtx.NormalMfdeTask[ModuleID];
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown module type %d!\n", __func__, Type);
	    return VDH_ERR;
    }

    OSAL_WriteLockIRQ(&pTaskList->TaskLock);
    if (!OSAL_LIST_EMPTY(&pTaskList->TaskList))
    {
	OSAL_LIST_FOR_EACH_ENTRY_SAFE(pTaskNode, pTempNode, &pTaskList->TaskList, Node)
	{
	    OSAL_LIST_DEL(&pTaskNode->Node);
	    pTaskNode->InUsed = 0;
	}
    }
    pTaskList->TaskNum = 0;
    OSAL_WriteUnLockIRQ(&pTaskList->TaskLock);

    return VDH_OK;
}


/*============== EXTERNAL FUNCTION =============*/
/******************************************
 Get Common Context
******************************************/
VDH_COMMON_CTX_S* VDH_Get_CommonCtx(VOID)
{
    if (NULL == NormalCtx.pCommonContext)
    {
	dprint(PRN_ERROR,"Get CommonCtx Failed: pCommonContext = NULL!\n");
	return NULL;
    }

    //dprint(PRN_ALWS, "sizeof(VDH_COMMON_CTX_S) = %d, sizeof(long) = %d\n", sizeof(VDH_COMMON_CTX_S), sizeof(long));

    return NormalCtx.pCommonContext;
}

#if 0
/******************************************
 check if some task wait to do
******************************************/
SINT32 VDH_TaskInUse(MODULE_TYPE_E Type, UINT8 ModuleId)
{
    TASK_NODE_S	       *pTaskNode = NULL;
    TASK_LIST_S	       *pTaskList = NULL;

    VDH_ASSERT_RET(NULL != NormalCtx.pCommonContext, "pCommonContext = NULL");

    switch(Type)
    {
	case MODULE_SCD:
	    VDH_ASSERT_RET(ModuleId < SCD_MODULE_NUM, "invalid Scd ModuleID");
	    pTaskList = &NormalCtx.NormalScdTask[ModuleId];
	    break;

	case MODULE_MFDE:
	    VDH_ASSERT_RET(ModuleId < MFDE_MODULE_NUM, "invalid Mfde ModuleID");
	    pTaskList = &NormalCtx.NormalMfdeTask[ModuleId];
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown task type %d!\n", __func__, Type);
	    return VDH_TASK_BUSY;
    }

    pTaskList = &NormalCtx.NormalMfdeTask[ModuleId];

    OSAL_ReadLockIRQ(&pTaskList->TaskLock);

    pTaskNode = &pTaskList->TaskNode;

    if (1 == pTaskNode->InUsed)
    {
	OSAL_ReadUnLockIRQ(&pTaskList->TaskLock);
	//dprint(PRN_ALWS, "%s Type=%d, TaskNode InUsed!\n", __func__, Type);

	return VDH_TASK_BUSY;
    }

    OSAL_ReadUnLockIRQ(&pTaskList->TaskLock);

    return VDH_TASK_IDLE;
}
#endif

/******************************************
 Post a normal task
******************************************/
SINT32 VDH_PostTask(TASK_PARAM_S *pTask)
{
    TASK_NODE_S	       *pTaskNode = NULL;
    TASK_LIST_S	       *pTaskList = NULL;
    WAKE_UP_TYPE_E	eWakeType = WAKE_UP_NOTHING;

    VDH_ASSERT_RET(NULL != NormalCtx.pCommonContext, "pCommonContext = NULL");
    VDH_ASSERT_RET(NULL != pTask,	 "pTask = NULL");

    switch(pTask->Type)
    {
	case NORMAL_SCD_TASK:
	    VDH_ASSERT_RET(pTask->ModuleId < SCD_MODULE_NUM, "invalid Scd ModuleID");
	    pTaskList = &NormalCtx.NormalScdTask[pTask->ModuleId];
	    eWakeType = WAKE_UP_NORMAL_SCD_TASK;
	    //dprint(PRN_ERROR, "Post Normal Scd Task, Chan id %d\n", pTask->ChanId);
	    break;

	case NORMAL_MFDE_TASK:
	    VDH_ASSERT_RET(pTask->ModuleId < MFDE_MODULE_NUM, "invalid Mfde ModuleID");
	    pTaskList = &NormalCtx.NormalMfdeTask[pTask->ModuleId];
	    eWakeType = WAKE_UP_NORMAL_MFDE_TASK;
	    //dprint(PRN_ERROR, "Post Normal Mfde Task, Chan id %d\n", pTask->ChanId);
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown task type %d!\n", __func__, pTask->Type);
	    return VDH_ERR;
    }

    OSAL_WriteLockIRQ(&pTaskList->TaskLock);

    pTaskNode = &pTaskList->TaskNode;
    if (1 == pTaskNode->InUsed)
    {
	dprint(PRN_ERROR, "%s TaskNode InUsed!\n", __func__);
	OSAL_WriteUnLockIRQ(&pTaskList->TaskLock);
	return VDH_ERR;
    }

    memcpy(&pTaskNode->Task, pTask, sizeof(TASK_PARAM_S));

    OSAL_LIST_ADD_TAIL(&pTaskNode->Node, &pTaskList->TaskList);

    pTaskNode->InUsed = 1;

    pTaskList->TaskNum += 1;

    OSAL_WriteUnLockIRQ(&pTaskList->TaskLock);

    VDH_WakeUp_Distributor(eWakeType);

    return VDH_OK;
}

/******************************************
 Need module notification
******************************************/
SINT32 VDH_Need_Module(MODULE_TYPE_E Type, SINT32 ModuleID)
{
    VDH_COMMON_CTX_S *pCtx = NULL;

    VDH_GET_COMMON_CTX_RET(pCtx);

    switch(Type)
    {
	case MODULE_SCD:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < SCD_MODULE_NUM), "invalid Scd ModuleID");
	    pCtx->Scd_Module[ModuleID].NormalNeed = 1;
	    break;

	case MODULE_MFDE:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < MFDE_MODULE_NUM), "invalid Mfde ModuleID");
	    pCtx->Mfde_Module[ModuleID].NormalNeed = 1;
	    break;

	case MODULE_BPD:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < BPD_MODULE_NUM), "invalid Bpd ModuleID");
	    pCtx->Bpd_Module[ModuleID].NormalNeed = 1;
	    break;

	case MODULE_DSP:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < DSP_MODULE_NUM), "invalid Dsp ModuleID");
	    pCtx->Dsp_Module[ModuleID].NormalNeed = 1;
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown module type %d!\n", __func__, Type);
	    return VDH_ERR;
    }

    return VDH_OK;
}


/******************************************
 UnNeed module notification
******************************************/
SINT32 VDH_UnNeed_Module(MODULE_TYPE_E Type, SINT32 ModuleID)
{
    VDH_COMMON_CTX_S *pCtx = NULL;

    VDH_GET_COMMON_CTX_RET(pCtx);

    switch(Type)
    {
	case MODULE_SCD:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < SCD_MODULE_NUM), "invalid Scd ModuleID");
	    pCtx->Scd_Module[ModuleID].NormalNeed = 0;
	    break;

	case MODULE_MFDE:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < MFDE_MODULE_NUM), "invalid Mfde ModuleID");
	    pCtx->Mfde_Module[ModuleID].NormalNeed = 0;
	    break;

	case MODULE_BPD:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < BPD_MODULE_NUM), "invalid Bpd ModuleID");
	    pCtx->Bpd_Module[ModuleID].NormalNeed = 0;
	    break;

	case MODULE_DSP:
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < DSP_MODULE_NUM), "invalid Dsp ModuleID");
	    pCtx->Dsp_Module[ModuleID].NormalNeed = 0;
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown module type %d!\n", __func__, Type);
	    return VDH_ERR;
    }

    return VDH_OK;
}


/******************************************
 Reset Module
******************************************/
SINT32 VDH_Reset_Module(MODULE_TYPE_E Type, SINT32 ModuleID)
{
    VDH_COMMON_CTX_S *pCtx = NULL;

    VDH_GET_COMMON_CTX_RET(pCtx);

    switch(Type)
    {
	case MODULE_SCD:
	    dprint(PRN_ERROR, "Normal call Reset Scd\n");
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < SCD_MODULE_NUM), "invalid Scd ModuleID");

	    VDH_Acquire_Usage(USAGE_SCD, ModuleID, SPONSOR_NORMAL, 200, WITH_FORCE);
	    VDH_Clear_TaskList(MODULE_SCD, ModuleID);
	    if (MODULE_NORMAL_WORKING == pCtx->Scd_Module[ModuleID].ModuleState)
	    {
		VDH_Reset_Scd_Module(ModuleID);
		VDH_Notify_ModuleIdle(MODULE_SCD, ModuleID);
	    }
	    VDH_Loose_Usage(USAGE_SCD, ModuleID, SPONSOR_NORMAL);
	    break;

	case MODULE_MFDE:
	    dprint(PRN_ERROR, "Normal call Reset Mfde\n");
	    VDH_ASSERT_RET((ModuleID >= 0 && ModuleID < MFDE_MODULE_NUM), "invalid Mfde ModuleID");

	    VDH_Acquire_Usage(USAGE_MFDE, ModuleID, SPONSOR_NORMAL, 200, WITH_FORCE);
	    VDH_Clear_TaskList(MODULE_MFDE, ModuleID);
	    if (MODULE_NORMAL_WORKING == pCtx->Mfde_Module[ModuleID].ModuleState)
	    {
		VDH_Reset_Mfde_Module(ModuleID);
		VDH_Notify_ModuleIdle(MODULE_MFDE, ModuleID);
	    }
	    VDH_Loose_Usage(USAGE_MFDE, ModuleID, SPONSOR_NORMAL);
	    break;

	// TODO:: add other module reset function if needed

	default:
	    dprint(PRN_ERROR, "%s unkown module type %d!\n", __func__, Type);
	    return VDH_ERR;
    }

    return VDH_OK;
}

/******************************************
 Require to load dsp code
******************************************/
SINT32 VDH_Require_DspCode(SINT32 DspID, DSP_REQUIRE_E Type)
{
    VDH_COMMON_CTX_S *pCtx = NULL;

    VDH_ASSERT_RET((DspID >= 0 && DspID < DSP_MODULE_NUM), "invalid DspID");
    VDH_ASSERT_RET((DSP_REQUIRE_AVS == Type || DSP_REQUIRE_LOWDLY == Type), "invalid dsp code type");

    VDH_GET_COMMON_CTX_RET(pCtx);

    pCtx->Dsp_Code[DspID].NormalRequire = Type;
    dprint(PRN_ERROR, "Normal require dsp code type %d\n", Type);

    return VDH_OK;
}
