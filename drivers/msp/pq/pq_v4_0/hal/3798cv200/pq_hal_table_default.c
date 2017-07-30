/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name	: pq_hal_table_default.c
  Version	: Initial Draft
  Author	: p00203646
  Created	: 2015/10/30
  Description	:

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include "hi_drv_pq.h"
#include "pq_hal_table_default.h"

static PQ_PHY_REG_S sg_stPhyRegDefault[PHY_REG_MAX] =
{
    /*Addr	   Lsb	     Msb  SourceMode  OutputMode   Module     Value	   Description*/

    /***********************************************DEI***********************************************/
    /*VPSS_DIECTRL*/
    {0x1000,	    22,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1000,	    21,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1000,	    29,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1000,	    28,	    28,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1000,	    16,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIECTRL_readonly*/
    {0x1000,	    26,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1000,	    24,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1000,	    17,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIELMA2*/
    {0x1004,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1004,	    7,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1004,	    6,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1004,	    5,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1004,	    4,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1004,	    2,	    2,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1004,	    1,	    1,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1004,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEINTEN*/
    {0x1008,	    16,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    -320},
    {0x1008,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    /*VPSS_DIESCALE*/
    {0x100c,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    /*DIECHECK*/
    {0x1010,	    16,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1010,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1010,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    30},
    {0x1014,	    16,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1014,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1014,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    30},
    /*DIEDIR*/
    {0x1024,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    3},
    {0x1024,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5},
    {0x1024,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5},
    {0x1020,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x1020,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    7},
    {0x1020,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1020,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    9},
    {0x101c,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    11},
    {0x101c,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    {0x101c,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x101c,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    18},
    {0x1018,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    27},
    {0x1018,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1018,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    24},
    {0x1018,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    40},
    /*VPSS_DIEINTPSCL0*/
    {0x1030,	    24,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    20,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    16,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    12,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    4,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1030,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x102c,	    28,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x102c,	    24,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    7},
    {0x102c,	    20,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    7},
    {0x102c,	    16,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x102c,	    12,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x102c,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5},
    {0x102c,	    4,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5},
    {0x102c,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    /*VPSS_DIEDIRTHD*/
    {0x1034,	    16,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5000},
    {0x1034,	    13,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1034,	    12,	    12,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1034,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1034,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    /*VPSS_DIEJITMTN*/
    {0x1038,	    12,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1038,	    4,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1038,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEFLDMTN*/
    {0x103c,	    29,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x103c,	    28,	    28,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x103c,	    24,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x103c,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    -2},
    {0x103c,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x103c,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEMTNDIFFTHD*/
    {0x1044,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1044,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1044,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1044,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1040,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1040,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    208},
    {0x1040,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    144},
    {0x1040,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_DIEMTNIIRSLP*/
    {0x1048,	    18,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1048,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1048,	    6,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1048,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    /*VPSS_DIEMTNIIRRAT*/
    {0x104c,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x104c,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x104c,	    8,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x104c,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    48},
    {0x1048,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    /*VPSS_DIEHISMODE*/
    {0x1050,	    21,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1050,	    20,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1050,	    19,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1050,	    18,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1050,	    17,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1050,	    16,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1050,	    12,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1050,	    8,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1050,	    4,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1050,	    0,	    2,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    /*VPSS_DIEMORFLT*/
    {0x1054,	    26,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1054,	    25,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1054,	    24,	    24,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1054,	    10,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1054,	    8,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1054,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIECOMBCHK*/
    {0x105c,	    16,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x105c,	    8,	    12,	    0,	    0,	    HI_PQ_MODULE_DEI,	    30},
    {0x105c,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1058,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    160},
    {0x1058,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    10},
    {0x1058,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x1058,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    /*VPSS_DIEFRMMTNSMTHTHD*/
    {0x1064,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1064,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1064,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1064,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1060,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1060,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1060,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    72},
    {0x1060,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_DIEFRMMTNSMTHSLP*/
    {0x1068,	    18,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1068,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1068,	    6,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1068,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*DIEFRMMTNSMTHRAT*/
    {0x106c,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x106c,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x106c,	    8,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x106c,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1068,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEFRMFLDBLENDTHD*/
    {0x1074,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1074,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1074,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1074,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1070,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1070,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1070,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    72},
    {0x1070,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_DIEFRMFLDBLENDSLP*/
    {0x1078,	    18,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1078,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1078,	    6,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1078,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*DIEFRMFLDBLENDRAT*/
    {0x107c,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x107c,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x107c,	    8,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x107c,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1078,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEMTNADJ*/
    {0x1080,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    {0x1080,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1080,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    /*VPSS_DIEEDGENORM*/
    {0x1098,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    134},
    {0x1098,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    135},
    {0x1094,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    143},
    {0x1094,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    142},
    {0x1090,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    132},
    {0x1090,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    140},
    {0x108c,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    132},
    {0x108c,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    134},
    {0x1088,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    115},
    {0x1088,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    136},
    {0x1084,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    227},
    {0x1084,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1094,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1098,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x109c,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x109c,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x109c,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_DIEMCSTRENGTH*/
    {0x10a4,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x10a4,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x1090,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10a4,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10a4,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x10a0,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x108c,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10a0,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10a0,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x10a0,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEFUSION*/
    {0x10a8,	    24,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10a8,	    16,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x10a8,	    8,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10a8,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x10ac,	    16,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1023},
    {0x10ac,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10ac,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x10b0,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    {0x10b0,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10b0,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10b0,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10b4,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x10b4,	    20,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x10b4,	    12,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_DIEMAGBMTHD*/
    {0x10b8,	    16,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x10b8,	    0,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    48},
    {0x10bc,	    16,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    80},
    {0x10bc,	    0,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    112},
    /*VPSS_DIEMCGBMCOEF*/
    {0x10c0,	    28,	    28,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x10c0,	    20,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    28},
    {0x10c0,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    20},
    {0x10c0,	    4,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    {0x10c0,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x10c4,	    12,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    96},
    {0x10c4,	    4,	    10,	    0,	    0,	    HI_PQ_MODULE_DEI,	    22},
    {0x10c4,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    /*VPSS_MCDI_RGDIFY*/
    {0x10fc,	    24,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    3},
    {0x10fc,	    14,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1023},
    {0x10fc,	    10,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    7},
    {0x10fc,	    0,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    511},
    /*VPSS_MCDI_RGSAD*/
    {0x1100,	    23,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1100,	    15,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1100,	    9,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    63},
    {0x1100,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    /*VPSS_MCDI_RGMV*/
    {0x1104,	    19,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    48},
    {0x1104,	    10,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    {0x1104,	    0,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    256},
    /*VPSS_MCDI_RGMAG0*/
    {0x1108,	    10,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    3},
    {0x1108,	    0,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    /*VPSS_MCDI_RGMAG1*/
    {0x110c,	    21,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x110c,	    16,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x110c,	    9,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    -64},
    {0x110c,	    5,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    {0x110c,	    1,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x110c,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    /*VPSS_MCDI_RGLS*/
    {0x1110,	    15,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1110,	    9,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    40},
    {0x1110,	    4,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1110,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_SEL*/
    {0x1114,	    8,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1114,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_DLT0*/
    {0x1118,	    16,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x1118,	    12,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1118,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1118,	    4,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1118,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    /*VPSS_MCDI_DLT1*/
    {0x111c,	    23,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x111c,	    18,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    {0x111c,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x111c,	    5,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    96},
    {0x111c,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_MCDI_RGMCW0*/
    {0x1120,	    20,	    24,	    0,	    0,	    HI_PQ_MODULE_DEI,	    20},
    {0x1120,	    14,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1120,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x1120,	    5,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1120,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_RGMCW1*/
    {0x1124,	    23,	    27,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x1124,	    19,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1124,	    10,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1124,	    4,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x1124,	    1,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    3},
    {0x1124,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    /*VPSS_MCDI_RGMCW2*/
    {0x1128,	    19,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    24},
    {0x1128,	    18,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1128,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1128,	    5,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1128,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_RGMCW3*/
    {0x112c,	    18,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x112c,	    9,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    256},
    {0x112c,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    /*VPSS_MCDI_RGMCW4*/
    {0x1130,	    17,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    512},
    {0x1130,	    9,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    96},
    {0x1130,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    320},
    /*VPSS_MCDI_RGMCW5*/
    {0x1134,	    17,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    {0x1134,	    9,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    {0x1134,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    160},
    /*VPSS_MCDI_RGMCW6*/
    {0x1138,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    24},
    {0x1138,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    122},
    {0x1138,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1138,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_MCDI_TPMCW0*/
    {0x113c,	    23,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x113c,	    15,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x113c,	    8,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x113c,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    255},
    /*VPSS_MCDI_TPMCW1*/
    {0x1140,	    11,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1140,	    8,	    10,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1140,	    4,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1140,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    /*VPSS_MCDI_WNDMCW0*/
    {0x1144,	    27,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x1144,	    23,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1144,	    19,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1144,	    15,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1144,	    11,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1144,	    5,	    10,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1144,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    18},
    /*VPSS_MCDI_WNDMCW1*/
    {0x1148,	    21,	    24,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x1148,	    15,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    24},
    {0x1148,	    11,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    6},
    {0x1148,	    4,	    10,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1148,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_WNDMCW2*/
    {0x114c,	    21,	    28,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x114c,	    16,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x114c,	    9,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x114c,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    288},
    /*VPSS_MCDI_WNDMCW3*/
    {0x1150,	    5,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    288},
    {0x1150,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_MCDI_VERTWEIGHT0*/
    {0x1154,	    24,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1154,	    20,	    22,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1154,	    12,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1154,	    8,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    5},
    {0x1154,	    4,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x1154,	    0,	    3,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    /*VPSS_MCDI_VERTWEIGHT1*/
    {0x1158,	    20,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    56},
    {0x1158,	    16,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    -2},
    {0x1158,	    8,	    12,	    0,	    0,	    HI_PQ_MODULE_DEI,	    20},
    {0x1158,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_MCDI_VERTWEIGHT2*/
    {0x115c,	    25,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x115c,	    16,	    24,	    0,	    0,	    HI_PQ_MODULE_DEI,	    128},
    {0x115c,	    9,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x115c,	    0,	    8,	    0,	    0,	    HI_PQ_MODULE_DEI,	    256},
    /*VPSS_MCDI_VERTWEIGHT3*/
    {0x1160,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1160,	    16,	    21,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1160,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x1160,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_VERTWEIGHT4*/
    {0x1164,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1164,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    64},
    {0x1164,	    8,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1164,	    0,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    /*VPSS_MCDI_VERTWEIGHT5*/
    {0x1168,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1168,	    12,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    20},
    {0x1168,	    8,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x1168,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    31},
    /*VPSS_MCDI_MC0*/
    {0x116c,	    28,	    28,	    0,	    0,	    HI_PQ_MODULE_DEI,	    1},
    {0x116c,	    20,	    26,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x116c,	    16,	    18,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x116c,	    15,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x116c,	    10,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x116c,	    5,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x116c,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    /*VPSS_MCDI_MC1*/
    {0x1170,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_MC2*/
    {0x1174,	    5,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    15},
    {0x1174,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_MC3*/
    {0x1178,	    25,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1178,	    20,	    24,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1178,	    14,	    19,	    0,	    0,	    HI_PQ_MODULE_DEI,	    16},
    {0x1178,	    11,	    13,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1178,	    8,	    10,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1178,	    5,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1178,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    /*VPSS_MCDI_MC4*/
    {0x117c,	    26,	    30,	    0,	    0,	    HI_PQ_MODULE_DEI,	    48},
    {0x117c,	    21,	    25,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x117c,	    15,	    20,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x117c,	    10,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x117c,	    5,	    9,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x117c,	    0,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_MC5*/
    {0x1180,	    18,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1180,	    6,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1180,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_MC6*/
    {0x1184,	    24,	    29,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1184,	    12,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4095},
    {0x1184,	    0,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4095},
    /*VPSS_MCDI_MC7*/
    {0x1188,	    6,	    12,	    0,	    0,	    HI_PQ_MODULE_DEI,	    48},
    {0x1188,	    1,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    8},
    {0x1188,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_LCDINEW0*/
    {0x118c,	    24,	    31,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x118c,	    16,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x118c,	    8,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x118c,	    0,	    7,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_LCDINEW1*/
    {0x1190,	    18,	    23,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1190,	    12,	    17,	    0,	    0,	    HI_PQ_MODULE_DEI,	    4},
    {0x1190,	    6,	    11,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1190,	    0,	    5,	    0,	    0,	    HI_PQ_MODULE_DEI,	    12},
    /*VPSS_MCDI_NUMT*/
    {0x1194,	    15,	    15,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1194,	    7,	    14,	    0,	    0,	    HI_PQ_MODULE_DEI,	    32},
    {0x1194,	    1,	    6,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1194,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    /*VPSS_MCDI_DEMO*/
    {0x1198,	    5,	    16,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},
    {0x1198,	    3,	    4,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1198,	    1,	    2,	    0,	    0,	    HI_PQ_MODULE_DEI,	    2},
    {0x1198,	    0,	    0,	    0,	    0,	    HI_PQ_MODULE_DEI,	    0},

};

static PQ_PHY_REG_S sg_stPQSoftReg[SOFT_REG_MAX] =
{
    /***************************************************************************
      * Special Register
     ***************************************************************************/

    /*Addr				     Lsb       Msb    SourceMode  OutputMode   Module	  Value	       Description*/
    /***********************************************FMD_CTRL***********************************************/
    /*IP_DETECT*/
    {PQ_SOFT_IP_DETECT,		0,	 1,	   0,	     0,	    HI_PQ_MODULE_FMD,	    0},
    {PQ_SOFT_FRMRATETHR_L,	0,	15,	   0,	     0,	    HI_PQ_MODULE_FMD,	23800},
    {PQ_SOFT_FRMRATETHR_H,	0,	15,	   0,	     0,	    HI_PQ_MODULE_FMD,	24200},

    /*HDR_SATU*/
    {PQ_SOFT_HDR_SATU,		0,	 0,	   0,	     0,	    HI_PQ_MODULE_HDR,	   50},

    /*COLOR_TEMP*/
    {PQ_SOFT_COLOR_TEMP_R,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	   50},
    {PQ_SOFT_COLOR_TEMP_G,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	   50},
    {PQ_SOFT_COLOR_TEMP_B,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	   50},

    /*MODULE_ON_OR_OFF*/
    {PQ_SOFT_MODULE_FMD_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_FMD,	    1},
    {PQ_SOFT_MODULE_FMD_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_FMD,	    1},
    {PQ_SOFT_MODULE_FMD_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_FMD,	    1},
    {PQ_SOFT_MODULE_TNR_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_TNR,	    1},
    {PQ_SOFT_MODULE_TNR_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_TNR,	    1},
    {PQ_SOFT_MODULE_TNR_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_TNR,	    0},
    {PQ_SOFT_MODULE_SNR_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_SNR,	    1},
    {PQ_SOFT_MODULE_SNR_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_SNR,	    1},
    {PQ_SOFT_MODULE_SNR_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_SNR,	    1},
    {PQ_SOFT_MODULE_DB_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DB,	    1},
    {PQ_SOFT_MODULE_DB_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DB,	    1},
    {PQ_SOFT_MODULE_DB_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DB,	    0},
    {PQ_SOFT_MODULE_DR_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DR,	    1},
    {PQ_SOFT_MODULE_DR_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DR,	    1},
    {PQ_SOFT_MODULE_DR_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DR,	    1},
    {PQ_SOFT_MODULE_DM_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DM,	    1},
    {PQ_SOFT_MODULE_DM_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DM,	    1},
    {PQ_SOFT_MODULE_DM_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DM,	    0},
    {PQ_SOFT_MODULE_SHARPN_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_SHARPNESS, 1},
    {PQ_SOFT_MODULE_SHARPN_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_SHARPNESS, 1},
    {PQ_SOFT_MODULE_SHARPN_UHD, 0,	 0,	   0,	     0,	    HI_PQ_MODULE_SHARPNESS, 0},
    {PQ_SOFT_MODULE_DCI_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DCI,	    1},
    {PQ_SOFT_MODULE_DCI_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DCI,	    1},
    {PQ_SOFT_MODULE_DCI_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DCI,	    0},
    {PQ_SOFT_MODULE_ACM_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_COLOR,	    1},
    {PQ_SOFT_MODULE_ACM_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_COLOR,	    1},
    {PQ_SOFT_MODULE_ACM_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_COLOR,	    1},
    {PQ_SOFT_MODULE_CSC_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	    1},
    {PQ_SOFT_MODULE_CSC_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	    1},
    {PQ_SOFT_MODULE_CSC_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_CSC,	    1},
    {PQ_SOFT_MODULE_DS_SD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DS,	    1},
    {PQ_SOFT_MODULE_DS_HD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DS,	    1},
    {PQ_SOFT_MODULE_DS_UHD,	0,	 0,	   0,	     0,	    HI_PQ_MODULE_DS,	    1},
};


PQ_PHY_REG_S *PQ_TABLE_GetPhyRegDefault(HI_VOID)
{
    return sg_stPhyRegDefault;
}

PQ_PHY_REG_S *PQ_TABLE_GetSoftRegDefault(HI_VOID)
{
    return sg_stPQSoftReg;
}
