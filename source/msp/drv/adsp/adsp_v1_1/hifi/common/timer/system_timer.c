/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_audsp_common.h"
#include "hi_dsp_common.h"
#include "system_timer.h"

#include "adsp_osal_ext.h"

typedef enum
{
    TIMER_CLOSED = 0,
    TIMER_OPENED,
    TIMER_RUNNING,
    TIMER_PAUSED,
} Timer_Status_E;

static Timer_Status_E g_Timer_Status = TIMER_CLOSED;
static ADSP_TIMER_SOURCE_S g_TIMERRm;

static HI_VOID TimerHandle(HI_VOID)
{
    if (g_TIMERRm.fCastIsr)
    {
	g_TIMERRm.fCastIsr();
    }
}

static HI_VOID TimerSwFunc(unsigned int data)
{
    if (TIMER_RUNNING == g_Timer_Status)
    {
	TimerHandle();
    }
    adsp_mod_timer(TIMER_ID_0, AOE_TIMER_SW_INTERVAL);
}

HI_VOID TIMER_RegIsrFunc(HI_VOID* func)
{
    g_TIMERRm.fCastIsr = (DSP_TimerIsrFunc *)func;
}

HI_VOID TIMER_DelIsrFunc(HI_VOID)
{
    g_TIMERRm.fCastIsr = HI_NULL;
}

HI_VOID TIMER_SetEnable(HI_VOID)
{
    g_Timer_Status = TIMER_RUNNING;
}

HI_VOID TIMER_SetDisable(HI_VOID)
{
    g_Timer_Status = TIMER_PAUSED;
}

HI_VOID TIMER_Init(HI_VOID)
{
    g_TIMERRm.fCastIsr = HI_NULL;
    g_Timer_Status = TIMER_OPENED;

    adsp_add_timer(TIMER_ID_0, (HI_VOID *)TimerSwFunc, AOE_TIMER_SW_INTERVAL);
}

HI_VOID TIMER_DeInit(HI_VOID)
{
    g_TIMERRm.fCastIsr = HI_NULL;
    g_Timer_Status = TIMER_CLOSED;
    adsp_del_timer_sync(TIMER_ID_0);
}
