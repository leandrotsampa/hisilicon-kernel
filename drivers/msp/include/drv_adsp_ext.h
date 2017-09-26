/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __DRV_ADSP_EXT_H__
#define __DRV_ADSP_EXT_H__

#include "hi_drv_dev.h"
#include "hi_type.h"
#include "hi_audsp_common.h"

typedef struct
{
    HI_U32  u32AoeRegBaseAddr;
    HI_BOOL bAoeSwFlag;
} ADSP_FIRMWARE_AOE_INFO_S;

typedef HI_S32 (*FN_ADSP_LoadFrm)(ADSP_CODEID_E);

typedef HI_S32 (*FN_ADSP_UnLoadFrm)(ADSP_CODEID_E);

typedef HI_S32 (*FN_ADSP_GetAoeFwmInfo)(ADSP_CODEID_E, ADSP_FIRMWARE_AOE_INFO_S*);

typedef struct
{
    FN_ADSP_LoadFrm pfnADSP_LoadFirmware;
    FN_ADSP_UnLoadFrm pfnADSP_UnLoadFirmware;
    FN_ADSP_GetAoeFwmInfo pfnADSP_GetAoeFwmInfo;
} ADSP_EXPORT_FUNC_S;

HI_S32	ADSP_DRV_ModInit(HI_VOID);
HI_VOID ADSP_DRV_ModExit(HI_VOID);

#endif /* __DRV_ADSP_EXT_H__ */
