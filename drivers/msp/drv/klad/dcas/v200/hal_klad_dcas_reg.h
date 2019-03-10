/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_dcas_reg.h
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HAL_KLAD_DCAS_REG_H__
#define __HAL_KLAD_DCAS_REG_H__

#include "hi_type.h"
#include "hal_klad_reg.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */


#define KL_DCAS_RKD_CTRL                 (KL_BASE_ADDR + 0x100)    //DCAS K3_0  rookey start register
#define KL_DCAS_K3_0_KLAD_CTRL           (KL_BASE_ADDR + 0x104)    //DCAS K3_0 key ladder start register
#define KL_DCAS_K3_1_KLAD_CTRL           (KL_BASE_ADDR + 0x108)    //DCAS K3_1 key ladder start register
#define KL_DCAS_KLAD_STATE               (KL_BASE_ADDR + 0x10C)    //Dcas key ladder state.
#define KL_DCAS_MODULE_ID0               (KL_BASE_ADDR + 0x110)    //DCAS vendor  data in register 0
#define KL_DCAS_MODULE_ID1               (KL_BASE_ADDR + 0x114)    //DCAS module  data in register 1
#define KL_DCAS_MODULE_ID2               (KL_BASE_ADDR + 0x118)    //DCAS module  data in register 2
#define KL_DCAS_MODULE_ID3               (KL_BASE_ADDR + 0x11C)    //DCAS module  data in register 3
#define KL_DCAS_K3_0_DANONCE0            (KL_BASE_ADDR + 0x120)    //K3_0 MODE DCAS NONCE register
#define KL_DCAS_K3_0_DANONCE1            (KL_BASE_ADDR + 0x124)    //K3_0 MODE DCAS NONCE register
#define KL_DCAS_K3_0_DANONCE2            (KL_BASE_ADDR + 0x128)    //K3_0 MODE DCAS NONCE register
#define KL_DCAS_K3_0_DANONCE3            (KL_BASE_ADDR + 0x12C)    //K3_0 MODE DCAS NONCE register
#define KL_DCAS_K3_1_DANONCE0            (KL_BASE_ADDR + 0x130)    //K3_1 MODE DCAS NONCE register
#define KL_DCAS_K3_1_DANONCE1            (KL_BASE_ADDR + 0x134)    //K3_1 MODE DCAS NONCE register
#define KL_DCAS_K3_1_DANONCE2            (KL_BASE_ADDR + 0x138)    //K3_1 MODE DCAS NONCE register
#define KL_DCAS_K3_1_DANONCE3            (KL_BASE_ADDR + 0x13C)    //K3_1 MODE DCAS NONCE register

#define KL_DCAS_SEC_EN                   (KL_BASE_ADDR + 0x344)    //DCAS key ladder  secure attribute.


typedef union
{
    struct
    {
        HI_U32 dcas_calc_start         : 1; //[0]
        HI_U32 dcas_module_id_sel      : 2; //[1~2]
        HI_U32 dcas_profile_sel        : 4; //[3~6]
        HI_U32 reserved                : 25; //[7~31]
    } bits;
    HI_U32 u32;
} KL_DCAS_RKD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 dcas_k30_calc_start     : 1; //[0]
        HI_U32 dcas_k30_level_sel      : 4; //[1~4]
        HI_U32 dcas_k30_tdes_aes_sel   : 1; //[5]
        HI_U32 reserved0               : 2; //[6~7]
        HI_U32 dcas_k30_key_addr       : 8; //[8~15]
        HI_U32 dcas_k30_dsc_mode       : 8; //[16~23]
        HI_U32 dcas_k30_port_sel       : 2; //[24~25]
        HI_U32 reserved1               : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_DCAS_K3_0_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 dcas_k31_calc_start     : 1; //[0]
        HI_U32 dcas_k31_level_sel      : 4; //[1~4]
        HI_U32 dcas_k31_tdes_aes_sel   : 1; //[5]
        HI_U32 reserved0               : 2; //[6~7]
        HI_U32 dcas_k31_key_addr       : 8; //[8~15]
        HI_U32 dcas_k31_dsc_mode       : 8; //[16~23]
        HI_U32 dcas_k31_port_sel       : 2; //[24~25]
        HI_U32 reserved1               : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_DCAS_K3_1_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 k3_0_lk_klad0_rdy      : 1; //[0]
        HI_U32 k3_0_lk_klad1_rdy      : 1; //[1]
        HI_U32 k3_0_lk_klad2_rdy      : 1; //[2]
        HI_U32 k3_0_nonce_klad0_rdy   : 1; //[3]
        HI_U32 k3_1_lk_klad0_rdy      : 1; //[4]
        HI_U32 k3_1_lk_klad1_rdy      : 1; //[5]
        HI_U32 k3_1_lk_klad2_rdy      : 1; //[6]
        HI_U32 k3_1_nonce_klad0_rdy   : 1; //[7]
    } bits;
    HI_U32 u32;
} KL_DCAS_KLAD_STATE_U;


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HAL_KLAD_DCAS_REG_H__ */
