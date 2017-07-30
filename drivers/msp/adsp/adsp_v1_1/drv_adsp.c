/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name	: drv_adsp.c
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2013/04/17
  Description	:
  History	:
  1.Date	: 2013/04/17
    Author	: zgjie
    Modification: Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/string.h>
#include <linux/delay.h>
#include <asm/uaccess.h>
#include <asm/io.h>

/* Unf headers */
#include "hi_error_mpi.h"
#include "hi_reg_common.h"

/* Drv headers */
#include "drv_adsp_private.h"
#include "drv_adsp_ext.h"
#include "hi_audsp_common.h"
#include "hi_audsp_aoe.h"

#include "drv_adsp_hal.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

typedef struct
{
    ADSP_EXPORT_FUNC_S	    stExtFunc;	    /* ADSP extenal functions */
} ADSP_GLOBAL_PARAM_S;

static HI_S32 ADSP_LoadFirmware(ADSP_CODEID_E u32DspCodeId);
static HI_S32 ADSP_UnLoadFirmware(ADSP_CODEID_E u32DspCodeId);
static HI_S32 ADSP_GetAoeFwmInfo(ADSP_CODEID_E u32DspCodeId, ADSP_FIRMWARE_AOE_INFO_S* pstInfo);

static ADSP_GLOBAL_PARAM_S s_stAdspDrv =
{
    .stExtFunc			   =
    {
	.pfnADSP_LoadFirmware	   = ADSP_LoadFirmware,
	.pfnADSP_UnLoadFirmware	   = ADSP_UnLoadFirmware,
	.pfnADSP_GetAoeFwmInfo	   = ADSP_GetAoeFwmInfo,
    }
};

extern HI_S32 AOE_SwEngineCreate(HI_VOID);
extern HI_S32 AOE_SwEngineDestory(HI_VOID);

static HI_S32 ADSP_AOEDestory(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = AOE_SwEngineDestory();
    if (HI_SUCCESS != s32Ret)
    {
	HI_ERR_ADSP("AOE_SwEngineDestory failed(0x%x)\n", s32Ret);
    }

    ADSP_ProcDeInit();
    HAL_ADSP_DeInit();

    HI_INFO_ADSP("AOE_SwEngineDestory success.\n");

    return s32Ret;
}

static HI_S32 ADSP_AOECreate(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = HAL_ADSP_Init();
    if (HI_SUCCESS != s32Ret)
    {
	HI_FATAL_ADSP("call HAL_DSP_Init failed(0x%x)\n", s32Ret);
	return s32Ret;
    }

    s32Ret = ADSP_ProcInit();
    if (HI_SUCCESS != s32Ret)
    {
	HI_ERR_ADSP("ADSP_ProcInit failed(0x%x)\n", s32Ret);
	HAL_ADSP_DeInit();
	return s32Ret;
    }

    s32Ret = AOE_SwEngineCreate();
    if (HI_SUCCESS != s32Ret)
    {
	HI_ERR_ADSP("AOE_SwEngineCreate failed(0x%x)\n", s32Ret);
	ADSP_ProcDeInit();
	HAL_ADSP_DeInit();
    }

    HI_INFO_ADSP("AOE_SwEngineCreate success.\n");

    return s32Ret;
}

static HI_S32 ADSP_LoadFirmware(ADSP_CODEID_E u32DspCodeId)
{
    HI_S32 s32Ret = HI_FAILURE;

    switch (u32DspCodeId)
    {
	case ADSP_CODE_AOE:
	    s32Ret = ADSP_AOECreate();
	    break;

	default:
	    HI_ERR_ADSP("dont support DspCode(%d)\n", u32DspCodeId);
	    break;
    }

    return s32Ret;
}

static HI_S32 ADSP_UnLoadFirmware(ADSP_CODEID_E u32DspCodeId)
{
    HI_S32 s32Ret = HI_SUCCESS;

    switch (u32DspCodeId)
    {
	case ADSP_CODE_AOE:
	    s32Ret = ADSP_AOEDestory();
	    break;

	default:
	    HI_WARN_ADSP("dont support DspCode(%d)\n", u32DspCodeId);
	    break;
    }

    return s32Ret;
}

static HI_S32 ADSP_GetAoeFwmInfo(ADSP_CODEID_E u32DspCodeId, ADSP_FIRMWARE_AOE_INFO_S* pstInfo)
{
    switch (u32DspCodeId)
    {
	case ADSP_CODE_AOE:
	    pstInfo->bAoeSwFlag = HI_TRUE;

	    return HI_SUCCESS;

	default:
	    HI_ERR_ADSP("dont support DspCode(%d)\n", u32DspCodeId);
	    return HI_FAILURE;
    }
}

HI_S32 ADSP_DRV_Suspend(PM_BASEDEV_S* dev, pm_message_t state)
{
    HI_PRINT("ADSP suspend OK\n");
    return HI_SUCCESS;
}

HI_S32 ADSP_DRV_Resume(PM_BASEDEV_S* dev)
{
    HI_PRINT("ADSP resume OK\n");
    return HI_SUCCESS;
}

HI_S32 ADSP_DRV_Init(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = HI_DRV_MODULE_Register(HI_ID_ADSP, "HI_ADSP", (HI_VOID*)&s_stAdspDrv.stExtFunc);
    if (HI_SUCCESS != s32Ret)
    {
	HI_FATAL_ADSP("HI_DRV_MODULE_Register adsp fail(0x%x)\n", s32Ret);
    }

    return s32Ret;
}

HI_VOID ADSP_DRV_Exit(HI_VOID)
{
    HI_DRV_MODULE_UnRegister(HI_ID_ADSP);
}

HI_S32 HI_DRV_ADSP_Init(HI_VOID)
{
    return ADSP_DRV_Init();
}

HI_VOID HI_DRV_ADSP_DeInit(HI_VOID)
{
    ADSP_DRV_Exit();
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
