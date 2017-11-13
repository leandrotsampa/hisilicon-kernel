/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
*****************************************************************************

  File Name	: pq_mng_gfxzme_coef.h
  Version	: Initial Draft
  Author	: p00203646
  Created	: 2015/10/15
  Description	:

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __PQ_GFXZME_COEF_H__
#define __PQ_GFXZME_COEF_H__


/*********************************add include here******************************/
#include "hi_type.h"

/********************** Global Variable declaration **************************/
extern HI_S16 PQ_s16GZmeCoef_8T8P_Cubic[8][8];
extern HI_S16 PQ_s16GZmeCoef_4T16P_Cubic[16][4];
extern HI_S16 PQ_s16GZmeCoef_4T16P_3M_a13[16][4];
extern HI_S16 PQ_s16GZmeCoef_2T8P_Gus2_6_75M_a0_5[8][2];
extern HI_S16 PQ_s16GZmeCoef_2T8P_4M_0_1[8][2];
extern HI_S16 PQ_s16GZmeCoef_2T16P_Gus2_6M_a0_5[16][2];
extern HI_S16 PQ_s16GZmeCoef_2T16P_4M_0_1[16][2];

/**
 **and from HiFoneB2 4K TinyZME, 2T16P align with 0 by d00241380
 **/
extern HI_S16 PQ_s16TinyZmeCoef_2T16P_Gus2_6M_a0_5[16][4];
extern HI_S16 PQ_s16TinyZmeCoef_2T16P_4M_0_1[16][4];

#endif /* __OPTM_ALG_ZME_COEF_H__ */
