/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __HI_DSP_AOE__H__
#define	 __HI_DSP_AOE__H__

#include "hi_type.h"
#include "hi_dsp_common.h"

/*=============================================================================
			    error code definition
==============================================================================*/
#define ERR_AOE_AIP_XXX_01_ERR (HI_S32)(0x80100001)
#define ERR_AOE_AIP_XXX_02_ERR (HI_S32)(0x80100002)
#define ERR_AOE_AIP_XXX_03_ERR (HI_S32)(0x80100003)
#define ERR_AOE_AIP_XXX_04_ERR (HI_S32)(0x80100004)

/** Aoe sub Module ID flags */
typedef enum
{

    AOE_MOD_ID_SYS = 0x0000,  /* aoe system  */
    AOE_MOD_ID_AIP,	      /* aip  */
    AOE_MOD_ID_EGE,	      /* engine	 */
    AOE_MOD_ID_AOP,	      /* aop  */


    AOE_MOD_ID_BUTT
} AOE_MOD_ID_E;

typedef enum
{
    AOE_FSM_SYS_IDLE = 0x00,
    AOE_FSM_SYS_AIP_INIT,
    AOE_FSM_SYS_AOP_INIT,
    AOE_FSM_SYS_EGE_INIT,
    AOE_FSM_SYS_WKBUF_INIT,
    AOE_FSM_SYS_RUNNING,
    AOE_FSM_SYS_AIP_DEINIT,
    AOE_FSM_SYS_AOP_DEINIT,
    AOE_FSM_SYS_EGE_DEINIT,
    AOE_FSM_SYS_WKBUF_DEINIT,

    AOE_FSM_AIP_IDLE = 0x10,
    AOE_FSM_AIP_PROC_CMD,
    AOE_FSM_AIP_DMA_IN,
    AOE_FSM_AIP_PROC_DATA,
    AOE_FSM_AIP_DMA_OUT,

    AOE_FSM_EGE_IDLE = 0x20,
    AOE_FSM_EGE_PROC_CMD,
    AOE_FSM_EGE_CHECK_AOP,
    AOE_FSM_EGE_PROC_DATA,
    AOE_FSM_EGE_DMA_OUT,

    AOE_FSM_AOP_IDLE = 0x40,
    AOE_FSM_AOP_PROC_CMD,
    AOE_FSM_AOP_DMA_IN,
    AOE_FSM_AOP_PROC_DATA,
    AOE_FSM_AOP_DMA_OUT,

    AOE_FSM_BUTT = 0x7f,
} AOE_FSM_E;

typedef enum
{
    EXCUTE_STATUS_STATISTICS = 0,
    SCHEDULE_STATUS_STATISTICS,
} STATUS_STATISTICS_E;

#define AOE_BUILD_FSM(mod_id, ch, fsm) ((0x00<<24)|(((((HI_U32)mod_id) << 16)) | ((((HI_U32)ch) << 8) ) | (((HI_U32)fsm) & 0x00ff)))

#ifdef ENABLE_TRACE_AOE_FSM
HI_VOID	  TRACE_AOE_FSM(AOE_MOD_ID_E ModId, HI_U32 ch, AOE_FSM_E eFsm);
#else
#define TRACE_AOE_FSM(ModId, ch, eFsm)
#endif

HI_VOID	  AOE_Reset(HI_VOID);

HI_VOID	  AOE_Init(HI_VOID);

HI_VOID	  AOE_DeInit(HI_VOID);

HI_VOID	  AOE_FlushWKBuf(HI_VOID);

HI_VOID*  AOE_GetWKBuf(HI_VOID);

HI_VOID	  AOE_ReleaseWKBuf(HI_VOID);

HI_U32	  AOE_GetWKBufSize(HI_VOID);

HI_VOID	  AOE_SchedStatisticsInit(HI_VOID);

HI_VOID	  AOE_SchedStatisticsShow(STATUS_STATISTICS_E enStatistics, HI_U16 u32TimeOutCnt);

HI_VOID	  AOE_ProcThread_Sw(HI_VOID);

HI_VOID	  AOE_ProcThread(HI_VOID);

ADSP_TASK_STATUS_E   AOE_GetThreadStatus(HI_VOID);

#endif
