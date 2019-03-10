/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_dcas.c
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include "hal_klad.h"
#include "hal_klad_dcas_reg.h"
#include "hal_klad_dcas.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


HI_VOID HAL_KLAD_DCAS_RKDStart(HI_U8 module_id, HI_U8 profile_mode)
{
    KL_DCAS_RKD_CTRL_U ctrl;

    ctrl.u32 = 0;
    ctrl.bits.dcas_calc_start = 0x1;
    ctrl.bits.dcas_module_id_sel = module_id & 0x3;
    ctrl.bits.dcas_profile_sel = profile_mode & 0xf;
    HAL_KLAD_WriteReg(KL_DCAS_RKD_CTRL, ctrl.u32);

    return;
}

HI_VOID HAL_KLAD_DCAS_K30Start(HI_U8 level, HI_U8 alg, HI_U8 addr, HI_U8 odd, HI_U8 engine, HI_U8 target)
{
    KL_DCAS_K3_0_KLAD_CTRL_U ctrl;

    ctrl.u32 = 0;
    ctrl.bits.dcas_k30_calc_start   = 0x1;
    ctrl.bits.dcas_k30_level_sel    = level & 0xf;
    ctrl.bits.dcas_k30_tdes_aes_sel = alg & 0x1;
    ctrl.bits.dcas_k30_key_addr     = ((addr & 0x7F) << 1) + (odd & 0x1);
    ctrl.bits.dcas_k30_dsc_mode     = engine;
    ctrl.bits.dcas_k30_port_sel     = target & 0x3;
    HAL_KLAD_WriteReg(KL_DCAS_K3_0_KLAD_CTRL, ctrl.u32);

    return;
}

HI_U8 HAL_KLAD_DCAS_K30GetLevel(HI_VOID)
{
    return 3;
}

HI_U32 HAL_KLAD_DCAS_K30GetDaNonceState(HI_VOID)
{
    KL_DCAS_KLAD_STATE_U state;

    state.u32 = HAL_KLAD_ReadReg(KL_DCAS_KLAD_STATE);

    return state.bits.k3_0_nonce_klad0_rdy;
}

HI_VOID HAL_KLAD_DCAS_K30GetDaNonce(HI_U8 *data)
{
    HI_U32 i = 0;
    HI_U32 din = 0;

    for(i=0; i<16; i+=4)
    {
        din = HAL_KLAD_ReadReg(KL_DCAS_K3_0_DANONCE0 + 4*i);
        data[4*i] = din & 0xff;
        data[4*i + 1] = (din >> 8) & 0xff;
        data[4*i + 2] = (din >> 16) & 0xff;
        data[4*i + 3] = (din >> 24) & 0xff;
    }

    return;
}

HI_VOID HAL_KLAD_DCAS_K31Start(HI_U8 level, HI_U8 alg, HI_U8 addr, HI_U8 odd, HI_U8 engine, HI_U8 target)
{
    KL_DCAS_K3_1_KLAD_CTRL_U ctrl;

    ctrl.u32 = 0;
    ctrl.bits.dcas_k31_calc_start   = 0x1;
    ctrl.bits.dcas_k31_level_sel    = level & 0xf;
    ctrl.bits.dcas_k31_tdes_aes_sel = alg & 0x1;
    ctrl.bits.dcas_k31_key_addr     = ((addr & 0x7F) << 1) + (odd & 0x1);
    ctrl.bits.dcas_k31_dsc_mode     = engine;
    ctrl.bits.dcas_k31_port_sel     = target & 0x3;
    HAL_KLAD_WriteReg(KL_DCAS_K3_0_KLAD_CTRL, ctrl.u32);

    return;
}

HI_U8 HAL_KLAD_DCAS_K31GetLevel(HI_VOID)
{
    return 3;
}

HI_U32 HAL_KLAD_DCAS_K31GetDaNonceState(HI_VOID)
{
    KL_DCAS_KLAD_STATE_U state;

    state.u32 = HAL_KLAD_ReadReg(KL_DCAS_KLAD_STATE);

    return state.bits.k3_1_nonce_klad0_rdy;
}

HI_VOID HAL_KLAD_DCAS_K31GetDaNonce(HI_U8 *data)
{
    HI_U32 i = 0;
    HI_U32 din = 0;

    for(i=0; i<16; i+=4)
    {
        din = HAL_KLAD_ReadReg(KL_DCAS_K3_1_DANONCE0 + 4*i);
        data[4*i] = din & 0xff;
        data[4*i + 1] = (din >> 8) & 0xff;
        data[4*i + 2] = (din >> 16) & 0xff;
        data[4*i + 3] = (din >> 24) & 0xff;
    }

    return;
}

HI_VOID HAL_KLAD_DCAS_SetModuleId(HI_U8 *data)
{
    HI_U32 i = 0;
    HI_U32 din = 0;

    for(i=0; i<16; i+=4)
    {
        din = (data[i+3] << 24) | (data[i+2] << 16) | (data[i+1] << 8) | data[i];
        HAL_KLAD_WriteReg(KL_DCAS_MODULE_ID0 + i, din);
    }

    return;
}

HI_U32 HAL_KLAD_DCAS_GetState(HI_VOID)
{
    KL_DCAS_KLAD_STATE_U state;

    state.u32 = HAL_KLAD_ReadReg(KL_DCAS_KLAD_STATE);

    return state.u32;
}


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
