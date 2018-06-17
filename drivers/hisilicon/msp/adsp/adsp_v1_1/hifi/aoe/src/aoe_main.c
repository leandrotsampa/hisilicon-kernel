/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_audsp_aoe.h"
#include "hi_dsp_debug.h"
#include "hi_dsp_mem.h"
#include "hi_dsp_aoe.h"
#include "aoe_aip.h"
#include "aoe_aop.h"
#include "aoe_engine.h"

#include "adsp_osal_ext.h"

#define AOE_WK_BUFFER_SIZE    (8 * sizeof(HI_U32) * (192000 / 1000) * AOE_PROCESS_PERIONDMS_MAX)  /* 8ch/24bit/192kHz */
#define AOE_WK_BUFFER_MAX_NUM (2)
#define AOE_WK_BUFFER_ALIGN   (8 * sizeof(HI_U32))  /* 8ch/24bit */

typedef struct
{
    HI_S32 uWkBufIdx;
    HI_U32 uWkBufBlockSize;
    HI_S32 uWkBufBlockNumber;
    HI_VOID* pWkBufBase;
} AOE_WKBUF_STATE_S;

#define AOE_TASK_PERIOND   2
#define AOE_SWTASK_PERIOND 4
static ADSP_TASK_STATUS_E g_enAoeTaskStatus = ADSP_TASK_STATUS_IDLE;
static HI_U32 g_u32AoeTaskTicks = 0;
static HI_S32 g_stAoeInitFlag = 0;
static AOE_WKBUF_STATE_S g_stWkbuf;
static HI_VOID * g_pRegMapAddr = 0;
static volatile S_AOE_REGS_TYPE* g_pstAOEComReg = HI_NULL;

HI_VOID	  AOE_InitWKBuf(HI_U32 u32WKBufSize, HI_U32 u32WKBufNum, HI_U32 u32AlignToBytes);
HI_VOID	  AOE_DeInitWKBuf(HI_VOID);

#ifdef ENABLE_TRACE_AOE_FSM
HI_VOID	  TRACE_AOE_FSM(AOE_MOD_ID_E ModId, HI_U32 ch, AOE_FSM_E eFsm)
{
    if (g_pstAOEComReg)
    {
	g_pstAOEComReg->AOE_STATUS0 = AOE_BUILD_FSM(ModId, ch, eFsm);
    }
}
#endif

HI_VOID	  AOE_Reset(HI_VOID)
{
    g_stAoeInitFlag = 0;
}

HI_VOID	  AOE_Init(HI_VOID)
{
    if (g_stAoeInitFlag)
    {
	return;
    }
    g_pRegMapAddr = (HI_VOID*)adsp_ioremap(AOE_COM_REG_BASE, AOE_REG_LENGTH);
    adsp_memset(g_pRegMapAddr, 0, AOE_REG_LENGTH);

    g_pstAOEComReg = (volatile S_AOE_REGS_TYPE *)g_pRegMapAddr;
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_IDLE);

    AIP_Init(g_pRegMapAddr +  AOE_AIP_REG_OFFSET);

    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_AIP_INIT);

    AOP_Init(g_pRegMapAddr +  AOE_AOP_REG_OFFSET);

    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_AOP_INIT);

    ENGINE_Init(g_pRegMapAddr + AOE_ENGINE_REG_OFFSET );

    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_EGE_INIT);

    AOE_InitWKBuf(AOE_WK_BUFFER_SIZE, AOE_WK_BUFFER_MAX_NUM, AOE_WK_BUFFER_ALIGN);

    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_WKBUF_INIT);

    g_stAoeInitFlag = 1;

    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_RUNNING);
}

HI_VOID	  AOE_DeInit(HI_VOID)
{
    if (!g_stAoeInitFlag)
    {
	return;
    }
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_AIP_DEINIT);
    AIP_DeInit();
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_AOP_DEINIT);
    AOP_DeInit();
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_EGE_DEINIT);
    ENGINE_DeInit();
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_WKBUF_DEINIT);
    AOE_DeInitWKBuf();
    TRACE_AOE_FSM(AOE_MOD_ID_SYS, 0, AOE_FSM_SYS_IDLE);
    g_pstAOEComReg = HI_NULL;
    g_stAoeInitFlag = 0;
}

HI_VOID	  AOE_InitWKBuf(HI_U32 u32WKBufSize, HI_U32 u32WKBufNum, HI_U32 u32AlignToBytes)
{
    HI_VOID* ptr;

    adsp_memset(&g_stWkbuf, 0, sizeof(AOE_WKBUF_STATE_S));
    if (u32WKBufNum > AOE_WK_BUFFER_MAX_NUM || (!u32WKBufNum))
    {
	HI_DSP_PRINT("WKBufNum(%d) invalid,max(%d)", u32WKBufNum, AOE_WK_BUFFER_MAX_NUM);
	return;
    }

    ptr = HI_ADSP_VMALLOC_Aligned(ADSP_ID_AOE, u32WKBufSize * u32WKBufNum, u32AlignToBytes);
    if (ptr)
    {
	g_stWkbuf.pWkBufBase = (HI_VOID *)ptr;
	g_stWkbuf.uWkBufBlockNumber = u32WKBufNum;
	g_stWkbuf.uWkBufBlockSize = u32WKBufSize;
    }
    HI_DSP_ASSERT(HI_NULL != ptr);
    return;
}

HI_VOID	  AOE_DeInitWKBuf(HI_VOID)
{
    HI_ADSP_VFREE_Aligned(ADSP_ID_AOE, (HI_VOID *)g_stWkbuf.pWkBufBase);
    adsp_memset(&g_stWkbuf, 0, sizeof(AOE_WKBUF_STATE_S));
}

HI_VOID	  AOE_FlushWKBuf()
{
    g_stWkbuf.uWkBufIdx = 0;
}

HI_VOID*   AOE_GetWKBuf(HI_VOID)
{
    HI_VOID* baseAddr = 0;

    if (g_stWkbuf.uWkBufIdx >= g_stWkbuf.uWkBufBlockNumber)
    {
	g_stWkbuf.uWkBufIdx = 0;
    }

    baseAddr = (HI_VOID*)(g_stWkbuf.pWkBufBase + g_stWkbuf.uWkBufIdx * g_stWkbuf.uWkBufBlockSize);
    g_stWkbuf.uWkBufIdx++;

    return baseAddr;
}

HI_VOID	 AOE_ReleaseWKBuf()
{
    if (g_stWkbuf.uWkBufIdx)
    {
	g_stWkbuf.uWkBufIdx--;
    }
    else
    {
	g_stWkbuf.uWkBufIdx = g_stWkbuf.uWkBufBlockNumber - 1;
    }
}

HI_U32	 AOE_GetWKBufSize(HI_VOID)
{
    return g_stWkbuf.uWkBufBlockSize;
}

HI_VOID	  AOE_SchedStatisticsInit(HI_VOID)
{
    if (g_stAoeInitFlag)
    {
	g_pstAOEComReg->AOE_STATUS1.u32 = 0;
    }
}

HI_VOID	  AOE_SchedStatisticsShow(STATUS_STATISTICS_E enStatistics, HI_U16 u16TimeOutCnt)
{
    if (!g_stAoeInitFlag)
    {
	return;
    }

    if (EXCUTE_STATUS_STATISTICS == enStatistics)
    {
	g_pstAOEComReg->AOE_STATUS1.bits.excute_timeout_cnt = u16TimeOutCnt;
    }
    else if (SCHEDULE_STATUS_STATISTICS == enStatistics)
    {
	g_pstAOEComReg->AOE_STATUS1.bits.schedule_timeout_cnt = u16TimeOutCnt;
    }
    else
    {
    }
}

HI_VOID	  AOE_ProcThread_Sw(HI_VOID)
{
    g_enAoeTaskStatus = ADSP_TASK_STATUS_IDLE;
    if (g_stAoeInitFlag)
    {
	AIP_Process();
	AOP_Process();
	ENGINE_Process();

	g_enAoeTaskStatus = ADSP_TASK_STATUS_RUNNING;
    }

    if (ADSP_TASK_STATUS_RUNNING == g_enAoeTaskStatus)
    {
	g_u32AoeTaskTicks++;

	if (0 == (g_u32AoeTaskTicks & (AOE_SWTASK_PERIOND - 1)))
	{
	    g_enAoeTaskStatus = ADSP_TASK_STATUS_IDLE;
	}
    }
}

HI_VOID	  AOE_ProcThread(HI_VOID)
{
    g_enAoeTaskStatus = ADSP_TASK_STATUS_IDLE;

    if (g_stAoeInitFlag)
    {
	AIP_Process();
	AOP_Process();
	ENGINE_Process();
	g_enAoeTaskStatus = ADSP_TASK_STATUS_RUNNING;
    }

    if (ADSP_TASK_STATUS_RUNNING == g_enAoeTaskStatus)
    {
	g_u32AoeTaskTicks++;
	if (0 == (g_u32AoeTaskTicks % AOE_TASK_PERIOND))
	{
	    g_enAoeTaskStatus = ADSP_TASK_STATUS_IDLE;
	}
    }

    return;
}

ADSP_TASK_STATUS_E   AOE_GetThreadStatus(HI_VOID)
{
    return g_enAoeTaskStatus;
}
