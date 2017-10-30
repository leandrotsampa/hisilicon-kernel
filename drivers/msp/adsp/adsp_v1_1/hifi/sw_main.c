/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_audsp_aoe.h"
#include "hi_dsp_aoe.h"

#include "hi_dsp_debug.h"
#include "system_timer.h"

#include "adsp_osal_ext.h"

ADSP_OSAL_FUNC_S g_AdspOsalFunc;

extern HI_VOID ASDP_OSAL_InterfaceInit(ADSP_OSAL_FUNC_S *pstOsalFunc);

#define AoEngine_Stop 0
#define AoEngine_Run 1

#define AOE_TASK_TIMER_MS 5

#define AOE_RUNNING_FLAG  0xa5a5a5a5

#define WAIT_TIMEOUT  0x200

static HI_S32 g_AoeTaskstate = AoEngine_Stop;

static HI_VOID* g_pAOEThread;
static HI_U32 g_AoeRunningFlag = 0;

static HI_S32 AoEngineTask(void *data)
{
    adsp_set_task_uninterrupt();

    AOE_Init();

    g_AoeRunningFlag = AOE_RUNNING_FLAG;

    while (AoEngine_Run == g_AoeTaskstate)
    {
	AOE_ProcThread_Sw();

	if (ADSP_TASK_STATUS_RUNNING == AOE_GetThreadStatus())
	{
	    continue;
	}

	adsp_schedule_task(AOE_TASK_TIMER_MS * 1000 * 1000);
    }

    adsp_set_task_running();

    AOE_DeInit();

    return HI_SUCCESS;
}

HI_S32 AOE_SwEngineCreate(HI_VOID)
{
    HI_U32 cnt = 0;

    HI_S32 s32Ret;

    g_AoeTaskstate = AoEngine_Run;

    g_AoeRunningFlag = 0;
    ASDP_OSAL_InterfaceInit(&g_AdspOsalFunc);

    s32Ret = adsp_create_task(&g_pAOEThread, "AoEngineTask", (HI_VOID*)AoEngineTask);
    if (HI_SUCCESS != s32Ret)
    {
	return s32Ret;
    }

    adsp_wakeup_task(g_pAOEThread);

    TIMER_Init();
    TIMER_SetEnable();

    //check simulate run
    for (cnt = 0; cnt < WAIT_TIMEOUT; cnt++)
    {
	if (AOE_RUNNING_FLAG == g_AoeRunningFlag)
	    break;
	adsp_msleep(1);
    }

    return HI_SUCCESS;
}

HI_S32 AOE_SwEngineDestory(HI_VOID)
{
    g_AoeTaskstate = AoEngine_Stop;
    TIMER_SetDisable();
    TIMER_DeInit();

    adsp_destory_task(g_pAOEThread);
    g_pAOEThread = HI_NULL;

    return HI_SUCCESS;
}
