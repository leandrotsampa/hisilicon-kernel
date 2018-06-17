/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hi_unf_klad_com_ca.h
Version	      : Initial draft
Author	      : Hisilicon hisecurity team
Created	      : 2016-12-08
Last Modified :
Description   : Key ladder API declaration for DCAS
Function List :
History	      :
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_KLAD_DCAS_H__
#define __HI_UNF_KLAD_DCAS_H__

#include "hi_type.h"
#include "hi_unf_klad.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	      */
/** @{ */  /** <!-- [DCAS] */


/*
Level: 1
Algorithm: AES
Target Engine: NA
Profile Mode: profile0 mode for china; the left mode for other country
Module ID:
profile0 mode:
0x0 - static value0 for k3_0 rootkey
0x1 - static value0 for k3_1 rootkey
0x2 - static value0(high 120bits) + cpu(low 8-bits) for k3_0 rootkey
0x3 - static value0(high 120bits) + cpu(low 8-bits) for k3_1 rootkey
other profile mode:
0x0/0x2 - cpu for  k3_0 rootkey
0x1/0x3 - cpu for  k3_1 rootkey
*/
#define HI_UNF_KLAD_DCAS_TYPE_RKD    0x0c00

/*
Level: 3
Algorithm: TDES/AES
Target Engine: Demux - CSA2/CSA3/AES/NOVEL/SM4/TDES; Payload cipher - AES; Multicipher - fixed
*/
#define HI_UNF_KLAD_DCAS_TYPE_K30    0x0c01

/*
Level: 3
Algorithm: TDES/AES
Target Engine: Demux - CSA2/CSA3/AES/NOVEL/SM4/TDES; Payload cipher - AES; Multicipher - fixed
*/
#define HI_UNF_KLAD_DCAS_TYPE_K31    0x0c02


/**profile mode of dcas key ladder*/
typedef enum hiUNF_KLAD_DCAS_PROFILE_MODE_E
{
    HI_UNF_KLAD_DCAS_PROFILE_MODE0  = 0x0,
    HI_UNF_KLAD_DCAS_PROFILE_MODE1  = 0x1,
    HI_UNF_KLAD_DCAS_PROFILE_MODE1A = 0x2,
    HI_UNF_KLAD_DCAS_PROFILE_MODE2  = 0x3,
    HI_UNF_KLAD_DCAS_PROFILE_MODE2A = 0x4,
    HI_UNF_KLAD_DCAS_PROFILE_MODE2B = 0x5,
    HI_UNF_KLAD_DCAS_PROFILE_BUTT
} HI_UNF_KLAD_DCAS_PROFILE_MODE_E;

/**mode id selection of dcas key ladder*/
typedef enum hiUNF_KLAD_DCAS_MODULE_ID_E
{
    HI_UNF_KLAD_DCAS_MODULE_ID_STATIC_0_OR_CPU_FOR_K3_0 = 0x0,
    HI_UNF_KLAD_DCAS_MODULE_ID_STATIC_1_OR_CPU_FOR_K3_1 = 0x1,
    HI_UNF_KLAD_DCAS_MODULE_ID_STATIC_2_OR_CPU_FOR_K3_0 = 0x2,
    HI_UNF_KLAD_DCAS_MODULE_ID_STATIC_2_OR_CPU_FOR_K3_1 = 0x3,
    HI_UNF_KLAD_DCAS_MODULE_ID_BUTT
} HI_UNF_KLAD_DCAS_MODULE_ID_E;

/**da nonce*/
typedef struct hiUNF_KLAD_DCAS_DA_NONCE_S
{
    HI_U8 au8Nonce[HI_UNF_KLAD_MAX_KEY_LEN];
    HI_U8 au8DaNonce[HI_UNF_KLAD_MAX_KEY_LEN];
} HI_UNF_KLAD_DCAS_DA_NONCE_S;


/************************************************/

/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     DCAS */
/** @{ */  /** <!-- [DCAS] */

/**
\brief Config rootkey
\param[in] hKlad    Handle of key ladder
\param[in] enMode   mode of profile
\param[in] enModuleID	module ID
\param[in] pu8Data   data in
\param[in] u32Len   length of pu8Data
\retval HI_SUCCESS  Success
\retval HI_FAILURE  Failure
*/
HI_S32 HI_UNF_KLAD_DCAS_StartRKD(HI_HANDLE hKlad, HI_UNF_KLAD_DCAS_PROFILE_MODE_E enMode, HI_UNF_KLAD_DCAS_MODULE_ID_E enModuleID, HI_U8 *pu8Data, HI_U32 u32Len);

/**
\brief Generate K30 DA nonce
\param[in] hKlad    Handle of key ladder
\param[in/out] pstDaNonce    pointer to the DA nonce
\retval HI_SUCCESS  Success
\retval HI_FAILURE  Failure
*/
HI_S32 HI_UNF_KLAD_DCAS_K30GenDaNonce(HI_HANDLE hKlad, HI_UNF_KLAD_DCAS_DA_NONCE_S *pstDaNonce);

/**
\brief Generate K31 DA nonce
\param[in] hKlad    Handle of key ladder
\param[in/out] pstDaNonce    pointer to the DA nonce
\retval HI_SUCCESS  Success
\retval HI_FAILURE  Failure
*/
HI_S32 HI_UNF_KLAD_DCAS_K30GenDaNonce(HI_HANDLE hKlad, HI_UNF_KLAD_DCAS_DA_NONCE_S *pstDaNonce);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_KLAD_DCAS_H__ */
