/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __PQ_MNG_ZME_COEF_H__
#define __PQ_MNG_ZME_COEF_H__


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*------------------------ 8 TAP ZME COEF START ----------------------------*/
/* Explain:
   There are 32 group number in all, 32 = 2 + 16*2;
   The first group and The 17th group number is symmetric with himslef;
   The 18th group number is equal to reversed 16th group number;
   The 19th group number is equal to reversed 15th group number;
   etc......
   When it is used, logic  will convert by himslef
   The last number is useless, it places at here for the request of logic;
   */
static	HI_S16 s16ZmeCoef_8T32P_Cubic[18][8] =
{
    {  0,  0,	0, 511,	  0,   0,  0,  0}, /* symmetric with himslef */
    { -1,  3, -12, 511,	 14,  -4,  1,  0},
    { -2,  6, -23, 509,	 28,  -8,  2,  0},
    { -2,  9, -33, 503,	 44, -12,  3,  0},
    { -3, 11, -41, 496,	 61, -16,  4,  0},
    { -3, 13, -48, 488,	 79, -21,  5, -1},
    { -3, 14, -54, 477,	 98, -25,  7, -2},
    { -4, 16, -59, 465, 118, -30,  8, -2},
    { -4, 17, -63, 451, 138, -35,  9, -1},
    { -4, 18, -66, 437, 158, -39, 10, -2},
    { -4, 18, -68, 421, 180, -44, 11, -2},
    { -4, 18, -69, 404, 201, -48, 13, -3},
    { -4, 18, -70, 386, 222, -52, 14, -2},
    { -4, 18, -70, 368, 244, -56, 15, -3},
    { -4, 18, -69, 348, 265, -59, 16, -3},
    { -4, 18, -67, 329, 286, -63, 16, -3},
    { -3, 17, -65, 307, 307, -65, 17, -3}, /* symmetric with himslef */
    {  0,  0,	0,   0,	  0,   0,  0,  0}
};/* normalized ok */

static	HI_S16 s16ZmeCoef_8T32P_Lanc3[18][8] =
{
    {4, -22,  40, 468,	40, -22,  4, 0},
    {3, -18,  26, 468,	54, -26,  5, 0},
    {2, -14,  14, 466,	68, -30,  6, 0},
    {2, -11,   2, 462,	84, -34,  7, 0},
    {1,	 -7,  -9, 457, 100, -38,  8, 0},
    {1,	 -4, -18, 450, 116, -42,  9, 0},
    {1,	 -2, -27, 443, 133, -46, 10, 0},
    {0,	  2, -35, 434, 151, -50, 10, 0},
    {0,	  4, -42, 425, 168, -54, 11, 0},
    {0,	  6, -49, 414, 186, -57, 12, 0},
    {0,	  8, -54, 401, 204, -60, 13, 0},
    {0,	 10, -58, 387, 222, -62, 13, 0},
    {0,	 11, -62, 374, 240, -65, 14, 0},
    {0,	 12, -65, 359, 258, -66, 14, 0},
    {0,	 13, -67, 344, 276, -68, 14, 0},
    {0,	 14, -68, 327, 293, -68, 14, 0},
    {0,	 14, -68, 310, 310, -68, 14, 0},
    {0,	  0,   0,   0,	 0,   0,  0, 0}
};/* normalized ok */

/* Luma-Hor-8T2P */
static HI_S16 s16ZmeCoef_8T2P_Lanc3[2][8] =
{
    {4, -22,  40, 468,	40, -22,  4, 0},
    {0,	 14, -68, 310, 310, -68, 14, 0},
};

/* Luma-Hor-6T2P */
/* 4.667M */
static HI_S16 s16ZmeCoef_6T2P_6M_a25[2][6] =
{
    { -34,  78, 415,  78, -34, 9},
    {	2, -42, 296, 296, -42, 2},
};

/*------------------------- 8 TAP ZME COEF END -----------------------------*/

/*------------------------ 6 TAP ZME COEF START ----------------------------*/

static	HI_S16 s16ZmeCoef_6T32P_Cubic[18][6] =
{
    { 0,   0, 511,   0,	  0,  0},
    { 3, -12, 511,  13,	 -3,  0},
    { 6, -22, 507,  28,	 -7,  0},
    { 8, -32, 502,  44, -11,  1},
    {10, -40, 495,  61, -15,  1},
    {11, -47, 486,  79, -19,  2},
    {12, -53, 476,  98, -24,  3},
    {13, -58, 464, 117, -28,  4},
    {14, -62, 451, 137, -33,  5},
    {15, -65, 437, 157, -38,  6},
    {15, -67, 420, 179, -42,  7},
    {15, -68, 404, 200, -46,  7},
    {14, -68, 386, 221, -50,  9},
    {14, -68, 367, 243, -54, 10},
    {14, -67, 348, 264, -58, 11},
    {13, -66, 328, 286, -61, 12},
    {13, -63, 306, 306, -63, 13},
    { 0,   0,	0,   0,	  0,  0}
};/* normalized ok */

/* 4.667M */
static	HI_S16 s16ZmeCoef_6T32P_6M_a25[18][6] =
{
    { -34, 78, 415,  78, -34, 9},
    { -32, 66, 415,  90, -36, 9},
    { -29, 54, 413, 103, -38, 9},
    { -26, 43, 411, 116, -41, 9},
    { -23, 33, 406, 129, -42, 9},
    { -21, 24, 401, 143, -44, 9},
    { -18, 14, 396, 157, -46, 9},
    { -16,  6, 389, 171, -47, 9},
    { -14, -2, 382, 185, -48, 9},
    { -11, -9, 374, 199, -49, 8},
    { -9, -16, 365, 213, -49, 8},
    { -7, -21, 354, 228, -49, 7},
    { -5, -27, 345, 242, -49, 6},
    { -3, -32, 333, 256, -48, 6},
    { -1, -36, 322, 269, -46, 4},
    {  0, -39, 309, 283, -44, 3},
    {  2, -42, 296, 296, -42, 2},
    {  0,   0,	 0,   0,   0, 0}
};/* normalized ok */

/*------------------------- 6 TAP ZME COEF END -----------------------------*/

/*------------------------ 5 TAP ZME COEF START ----------------------------*/
static	HI_S16 s16coef5tap_cubic_6M[18][5] =
{
    {  -36,  292,  292,	 -36,	 0},
    {  -38,  279,  305,	 -33,	-1},
    {  -40,  266,  319,	 -30,	-3},
    {  -41,  253,  330,	 -26,	-4},
    {  -42,  239,  342,	 -22,	-5},
    {  -42,  226,  352,	 -17,	-7},
    {  -42,  212,  361,	 -11,	-8},
    {  -42,  197,  372,	  -5,  -10},
    {  -41,  183,  380,	   2,  -12},
    {  -40,  169,  388,	   9,  -14},
    {  -39,  155,  395,	  17,  -16},
    {  -38,  142,  400,	  26,  -18},
    {  -36,  128,  405,	  35,  -20},
    {  -35,  115,  409,	  45,  -22},
    {  -33,  102,  412,	  55,  -24},
    {  -31,   90,  414,	  66,  -27},
    {  -29,   78,  414,	  78,  -29},
    {	 0,    0,    0,	   0,	 0},
};


/*------------------------- 5 TAP ZME COEF END -----------------------------*/


/*------------------------ 4 TAP ZME COEF START ----------------------------*/

static	HI_S16 s16ZmeCoef_4T32P_Cubic[18][4] =
{
    {	0, 511,	  0,   0}, { -19, 511,	21,  -1},
    { -37, 509,	 42,  -2}, { -51, 504,	64,  -5},
    { -64, 499,	 86,  -9}, { -74, 492, 108, -14},
    { -82, 484, 129, -19}, { -89, 474, 152, -25},
    { -94, 463, 174, -31}, { -97, 451, 196, -38},
    { -98, 438, 217, -45}, { -98, 424, 238, -52},
    { -98, 409, 260, -59}, { -95, 392, 280, -65},
    { -92, 376, 300, -72}, { -88, 358, 320, -78},
    { -83, 339, 339, -83}, {   0,   0,	 0,   0}
};/* normalized ok */

/* 3.507M */
static	HI_S16 s16ZmeCoef_4T32P_5M_a15[18][4] =
{
    { 103, 335, 103, -29}, { 92, 335, 112, -27},
    {  84, 335, 121, -28}, { 75, 334, 131, -28},
    {  67, 332, 141, -28}, { 59, 329, 152, -28},
    {  51, 326, 162, -27}, { 43, 323, 173, -27},
    {  36, 319, 183, -26}, { 30, 313, 194, -25},
    {  23, 308, 204, -23}, { 17, 301, 215, -21},
    {  12, 295, 225, -20}, {  6, 288, 235, -17},
    {	2, 280, 244, -14}, { -3, 271, 254, -10},
    {  -7, 263, 263,  -7}, {  0,   0,	0,   0}
};/* normalized ok */


/*------------------------- 4 TAP ZME COEF END -----------------------------*/

/*------------------------ 3 TAP ZME COEF START ----------------------------*/

static	HI_S16 s16coef3tap_cubic_6M[18][3] =
{
    {  267,  266,  -21},
    {  254,  277,  -19},
    {  241,  289,  -18},
    {  228,  299,  -15},
    {  215,  310,  -13},
    {  202,  319,   -9},
    {  189,  329,   -6},
    {  176,  337,   -1},
    {  163,  345,    4},
    {  150,  352,   10},
    {  137,  359,   16},
    {  125,  364,   23},
    {  113,  368,   31},
    {  101,  372,   39},
    {	89,  375,   48},
    {	78,  376,   58},
    {	68,  376,   68},
    {	 0,    0,    0},
};


/*------------------------- 3 TAP ZME COEF END -----------------------------*/


/*------------------------ 2 TAP ZME COEF START ----------------------------*/
/* 3.39M */
static HI_S16 s16ZmeCoef_2T32P_4M_0_1[18][2] =
{
    { 366, 146}, { 359, 153}, { 351, 161},
    { 344, 168}, { 337, 175}, { 330, 182},
    { 323, 189}, { 316, 196}, { 309, 203},
    { 302, 210}, { 296, 216}, { 289, 223},
    { 282, 230}, { 276, 236}, { 269, 243},
    { 263, 249}, { 256, 256}, {	  0,   0}
};/* normalized ok */

/* 4.509M */
static HI_S16 s16ZmeCoef_2T32P_Gus2_6M_a0_5[18][2] =
{
    { 462,  50}, { 449,	 63}, { 437,  75},
    { 424,  88}, { 411, 101}, { 398, 114},
    { 386, 126}, { 373, 139}, { 360, 152},
    { 347, 165}, { 334, 178}, { 321, 191},
    { 308, 204}, { 295, 217}, { 282, 230},
    { 269, 243}, { 256, 256}, {	  0,   0}
};

/*------------------------ 2 TAP ZME COEF END ----------------------------*/

/* Vdp Zme Coef Struct */
/* add Chroma-Hor-8T32P and Chroma-Vert-6T32P  add from 3798 */
const HI_S16* g_pVZmeCoef[PQ_HAL_ZME_COEF_RATIO_BUTT][VZME_COEF_TYPE_BUTT] =
{
    //	     Luma-Hor-8T32P,		    Luma-Vert-6T32P,		   Luma-Vert-4T32P,		   Chroma-Hor-4T32P ,		    Chroma-Vert-4T32P,		    Chroma-Hor-8T32P,		       Chroma-Vert-6T32P		Luma-Vert-5T32P		    Chroma-Vert-3T32P		       Hor-8T2P			     Vert-6T2P
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* >1	 */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* ==1	  */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* >=0.75 */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* >=0.5  */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* >=0.33 */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]},/* >=0.25 */
    { &s16ZmeCoef_8T32P_Lanc3[0][0],  &s16ZmeCoef_6T32P_6M_a25[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_4T32P_5M_a15[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],	&s16ZmeCoef_6T32P_6M_a25[0][0],	 &s16coef5tap_cubic_6M[0][0], &s16coef3tap_cubic_6M[0][0], &s16ZmeCoef_8T2P_Lanc3[0][0], &s16ZmeCoef_6T2P_6M_a25[0][0]}, /* else   */
};

/* Vpss Zme Coef Struct */
/* add Chroma-Hor-8T32P and Chroma-Vert-6T32P  add from 3798 and HifoneB2 */
const HI_S16* g_pVZmeVpssCoef[PQ_HAL_ZME_COEF_RATIO_BUTT][VZME_VPSS_COEF_TYPE_BUTT] =
{
    //	     Luma-Hor-8T32P,		      Luma-Vert-6T32P,		      Luma-Vert-4T32P,		     Chroma-Hor-4T32P ,		     Chroma-Vert-4T32P,		    Chroma-Hor-8T32P,		       Chroma-Vert-6T32P
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* >1	*/
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* ==1	 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* >=0.75 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* >=0.5	 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* >=0.33 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]},   /* >=0.25 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_6T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_8T32P_Lanc3[0][0],    &s16ZmeCoef_6T32P_6M_a25[0][0]}    /* else	 */
};

/* Lti Cti Coef Struct */
const HI_S16* g_pVDtiZmeCoef[PQ_HAL_ZME_COEF_RATIO_BUTT][VDTI_COEF_TYPE_BUTT] =
{
    //	       HLTI-8T32P,			    VLTI-2T32P,			       HCTI-4T32P,		       VCTI-2T32P,
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* >1     */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* ==1    */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* >=0.75 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* >=0.5  */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* >=0.33 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}, /* >=0.25 */
    { &s16ZmeCoef_8T32P_Cubic[0][0],  &s16ZmeCoef_2T32P_Gus2_6M_a0_5[0][0], &s16ZmeCoef_4T32P_Cubic[0][0], &s16ZmeCoef_2T32P_4M_0_1[0][0]}  /* else   */
};


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
