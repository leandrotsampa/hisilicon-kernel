/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_lcacm.h
  Version       : Initial Draft
  Author        : p00203646
  Created       : 2016/07/18
  Description   :

******************************************************************************/

#ifndef __PQ_MNG_LCACM_H__
#define __PQ_MNG_LCACM_H__


#include "drv_pq_table.h"


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*ACM 增强类型*/
typedef enum hiLCACM_ENHANCE_E
{
    LCACM_ENHANCE_FLESHTONE = 0,    /* 肤色增强 */
    LCACM_ENHANCE_SPEC_COLOR_MODE,  /* 固定模式的颜色增强模式 */
    LCACM_ENHANCE_BUTT
} LCACM_ENHANCE_E;

/* color enhance mode */
typedef enum hiCOLOR_SPEC_MODE_E
{
    COLOR_MODE_RECOMMEND = 0  , /* color enhance recommend mode  */
    COLOR_MODE_PORTRAIT       , /* color enhance portrait mode         */
    COLOR_MODE_SKY            , /* color enhance sky mode               */
    COLOR_MODE_GRASS          , /* color enhance grass mode            */
    COLOR_MODE_SCENERY        , /* color enhance scenery mode         */

    COLOR_MODE_BUTT
} COLOR_SPEC_MODE_E;

HI_S32 PQ_MNG_RegisterLowCostACM(PQ_REG_TYPE_E enType);
HI_S32 PQ_MNG_UnRegisterLowCostACM(HI_VOID);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif


