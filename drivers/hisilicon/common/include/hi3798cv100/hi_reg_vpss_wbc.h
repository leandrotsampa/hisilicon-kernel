//******************************************************************************
//  Copyright (C), 2007-2014, Hisilicon Technologies Co., Ltd.
//
//******************************************************************************
// File name     : c_union_define.h
// Version       : 2.0
// Author        : x57490
// Created       : 2014-02-20
// Last Modified : 
// Description   :  The C union definition file for the module CAS
// Function List : 
// History       : 
// 1 Date        : 
// Author        : x57490
// Modification  : Create file
//******************************************************************************

#ifndef __C_UNION_DEFINE_H__
#define __C_UNION_DEFINE_H__

// Define the union U_ifmd_pcc_ffwd
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_ffwd           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_ffwd;
// Define the union U_ifmd_pcc_fwd
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_fwd            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_fwd;
// Define the union U_ifmd_pcc_bwd
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_bwd            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_bwd;
// Define the union U_ifmd_pcc_crss
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_crss           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_crss;
// Define the union U_ifmd_pcc_crss_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_crss_be        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_crss_be;
// Define the union U_ifmd_pcc_pw
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_pw             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_pw;
// Define the union U_ifmd_pcc_fwd_tkr
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_fwd_tkr        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_fwd_tkr;
// Define the union U_ifmd_pcc_bwd_tkr
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_pcc_bwd_tkr        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_pcc_bwd_tkr;
// Define the union U_ifmd_osd_out0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    isosd_scence          : 1   ; // [0] 
        unsigned int    curfldbeginosdrow     : 12  ; // [12..1] 
        unsigned int    curfldnoosdrows       : 12  ; // [24..13] 
        unsigned int    Reserved_0            : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ifmd_osd_out0;

// Define the union U_ifmd_osd_out1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lst1fldflag           : 1   ; // [0] 
        unsigned int    lst1fldbeginosdrow    : 12  ; // [12..1] 
        unsigned int    lst1fldnoosdrows      : 12  ; // [24..13] 
        unsigned int    Reserved_1            : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ifmd_osd_out1;

// Define the union U_ifmd_osd_out2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lst2fldflag           : 1   ; // [0] 
        unsigned int    lst2fldbeginosdrow    : 12  ; // [12..1] 
        unsigned int    lst2fldnoosdrows      : 12  ; // [24..13] 
        unsigned int    Reserved_2            : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ifmd_osd_out2;

// Define the union U_ifmd_itdiff
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_itdiff             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_itdiff;
// Define the union U_ifmd_itdiff_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_itdiff_be          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_itdiff_be;
// Define the union U_ifmd_match_um
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_match_um           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_match_um;
// Define the union U_ifmd_nomatch_um
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_nomatch_um         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_nomatch_um;
// Define the union U_ifmd_match_um2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_match_um2          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_match_um2;
// Define the union U_ifmd_nomatch_um2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_nomatch_um2        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_nomatch_um2;
// Define the union U_ifmd_match_um_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_match_um_be        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_match_um_be;
// Define the union U_ifmd_nomatch_um_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_nomatch_um_be      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_nomatch_um_be;
// Define the union U_ifmd_match_um2_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_match_um2_be       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_match_um2_be;
// Define the union U_ifmd_nomatch_um2_be
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_nomatch_um2_be     : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_nomatch_um2_be;
// Define the union U_ifmd_lasicnt14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_lasicnt14          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_lasicnt14;
// Define the union U_ifmd_lasicnt32
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_lasicnt32          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_lasicnt32;
// Define the union U_ifmd_lasicnt34
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_lasicnt34          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_lasicnt34;
// Define the union U_ifmd_ichd
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_ichd               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_ichd;
// Define the union U_ifmd_mcomb01
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_mcomb01            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_mcomb01;
// Define the union U_ifmd_mcomb03
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_mcomb03            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_mcomb03;
// Define the union U_ifmd_mcomb12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_mcomb12            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_mcomb12;
// Define the union U_ifmd_stillblk_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_0_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_0_;
// Define the union U_ifmd_stillblk_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_1_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_1_;
// Define the union U_ifmd_stillblk_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_2_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_2_;
// Define the union U_ifmd_stillblk_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_3_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_3_;
// Define the union U_ifmd_stillblk_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_4_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_4_;
// Define the union U_ifmd_stillblk_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_5_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_5_;
// Define the union U_ifmd_stillblk_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_6_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_6_;
// Define the union U_ifmd_stillblk_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_7_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_7_;
// Define the union U_ifmd_stillblk_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_8_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_8_;
// Define the union U_ifmd_stillblk_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_9_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_9_;
// Define the union U_ifmd_stillblk_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_10_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_10_;
// Define the union U_ifmd_stillblk_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_11_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_11_;
// Define the union U_ifmd_stillblk_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_12_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_12_;
// Define the union U_ifmd_stillblk_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_13_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_13_;
// Define the union U_ifmd_stillblk_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_14_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_14_;
// Define the union U_ifmd_stillblk_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_stillblk_15_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_stillblk_15_;
// Define the union U_ifmd_hist_bin_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_0_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_0_;
// Define the union U_ifmd_hist_bin_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_1_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_1_;
// Define the union U_ifmd_hist_bin_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_2_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_2_;
// Define the union U_ifmd_hist_bin_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_3_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_3_;
// Define the union U_ifmd_hist_bin_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_4_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_4_;
// Define the union U_ifmd_hist_bin_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_5_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_5_;
// Define the union U_ifmd_hist_bin_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_6_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_6_;
// Define the union U_ifmd_hist_bin_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_7_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_7_;
// Define the union U_ifmd_hist_bin_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_8_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_8_;
// Define the union U_ifmd_hist_bin_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_9_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_9_;
// Define the union U_ifmd_hist_bin_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_10_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_10_;
// Define the union U_ifmd_hist_bin_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_11_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_11_;
// Define the union U_ifmd_hist_bin_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_12_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_12_;
// Define the union U_ifmd_hist_bin_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_13_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_13_;
// Define the union U_ifmd_hist_bin_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_14_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_14_;
// Define the union U_ifmd_hist_bin_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_15_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_15_;
// Define the union U_ifmd_hist_bin_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_16_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_16_;
// Define the union U_ifmd_hist_bin_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_17_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_17_;
// Define the union U_ifmd_hist_bin_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_18_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_18_;
// Define the union U_ifmd_hist_bin_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_19_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_19_;
// Define the union U_ifmd_hist_bin_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_20_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_20_;
// Define the union U_ifmd_hist_bin_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_21_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_21_;
// Define the union U_ifmd_hist_bin_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_22_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_22_;
// Define the union U_ifmd_hist_bin_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_23_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_23_;
// Define the union U_ifmd_hist_bin_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_24_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_24_;
// Define the union U_ifmd_hist_bin_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_25_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_25_;
// Define the union U_ifmd_hist_bin_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_26_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_26_;
// Define the union U_ifmd_hist_bin_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_27_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_27_;
// Define the union U_ifmd_hist_bin_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_28_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_28_;
// Define the union U_ifmd_hist_bin_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_29_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_29_;
// Define the union U_ifmd_hist_bin_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_30_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_30_;
// Define the union U_ifmd_hist_bin_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_31_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_31_;
// Define the union U_ifmd_hist_bin_32_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_32_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_32_;
// Define the union U_ifmd_hist_bin_33_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_33_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_33_;
// Define the union U_ifmd_hist_bin_34_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_34_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_34_;
// Define the union U_ifmd_hist_bin_35_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_35_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_35_;
// Define the union U_ifmd_hist_bin_36_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_36_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_36_;
// Define the union U_ifmd_hist_bin_37_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_37_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_37_;
// Define the union U_ifmd_hist_bin_38_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_38_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_38_;
// Define the union U_ifmd_hist_bin_39_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_39_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_39_;
// Define the union U_ifmd_hist_bin_40_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_40_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_40_;
// Define the union U_ifmd_hist_bin_41_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_41_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_41_;
// Define the union U_ifmd_hist_bin_42_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_42_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_42_;
// Define the union U_ifmd_hist_bin_43_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_43_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_43_;
// Define the union U_ifmd_hist_bin_44_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_44_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_44_;
// Define the union U_ifmd_hist_bin_45_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_45_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_45_;
// Define the union U_ifmd_hist_bin_46_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_46_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_46_;
// Define the union U_ifmd_hist_bin_47_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_47_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_47_;
// Define the union U_ifmd_hist_bin_48_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_48_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_48_;
// Define the union U_ifmd_hist_bin_49_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_49_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_49_;
// Define the union U_ifmd_hist_bin_50_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_50_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_50_;
// Define the union U_ifmd_hist_bin_51_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_51_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_51_;
// Define the union U_ifmd_hist_bin_52_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_52_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_52_;
// Define the union U_ifmd_hist_bin_53_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_53_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_53_;
// Define the union U_ifmd_hist_bin_54_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_54_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_54_;
// Define the union U_ifmd_hist_bin_55_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_55_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_55_;
// Define the union U_ifmd_hist_bin_56_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_56_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_56_;
// Define the union U_ifmd_hist_bin_57_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_57_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_57_;
// Define the union U_ifmd_hist_bin_58_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_58_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_58_;
// Define the union U_ifmd_hist_bin_59_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_59_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_59_;
// Define the union U_ifmd_hist_bin_60_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_60_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_60_;
// Define the union U_ifmd_hist_bin_61_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_61_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_61_;
// Define the union U_ifmd_hist_bin_62_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_62_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_62_;
// Define the union U_ifmd_hist_bin_63_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_63_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_63_;
// Define the union U_ifmd_hist_bin_64_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ifmd_hist_bin_64_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ifmd_hist_bin_64_;
// Define the union U_pfmd_combhist_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_0_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_0_;
// Define the union U_pfmd_combhist_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_1_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_1_;
// Define the union U_pfmd_combhist_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_2_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_2_;
// Define the union U_pfmd_combhist_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_3_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_3_;
// Define the union U_pfmd_combhist_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_4_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_4_;
// Define the union U_pfmd_combhist_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_5_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_5_;
// Define the union U_pfmd_combhist_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_6_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_6_;
// Define the union U_pfmd_combhist_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_7_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_7_;
// Define the union U_pfmd_combhist_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_8_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_8_;
// Define the union U_pfmd_combhist_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_9_        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_9_;
// Define the union U_pfmd_combhist_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_10_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_10_;
// Define the union U_pfmd_combhist_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_11_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_11_;
// Define the union U_pfmd_combhist_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_12_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_12_;
// Define the union U_pfmd_combhist_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_13_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_13_;
// Define the union U_pfmd_combhist_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_14_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_14_;
// Define the union U_pfmd_combhist_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_15_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_15_;
// Define the union U_pfmd_combhist_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_16_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_16_;
// Define the union U_pfmd_combhist_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_17_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_17_;
// Define the union U_pfmd_combhist_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_18_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_18_;
// Define the union U_pfmd_combhist_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_19_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_19_;
// Define the union U_pfmd_combhist_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_20_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_20_;
// Define the union U_pfmd_combhist_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_21_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_21_;
// Define the union U_pfmd_combhist_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_22_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_22_;
// Define the union U_pfmd_combhist_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_23_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_23_;
// Define the union U_pfmd_combhist_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_24_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_24_;
// Define the union U_pfmd_combhist_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_25_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_25_;
// Define the union U_pfmd_combhist_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_26_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_26_;
// Define the union U_pfmd_combhist_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_27_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_27_;
// Define the union U_pfmd_combhist_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_28_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_28_;
// Define the union U_pfmd_combhist_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_29_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_29_;
// Define the union U_pfmd_combhist_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_30_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_30_;
// Define the union U_pfmd_combhist_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_31_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_31_;
// Define the union U_pfmd_combhist_32_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_32_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_32_;
// Define the union U_pfmd_combhist_33_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_33_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_33_;
// Define the union U_pfmd_combhist_34_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_34_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_34_;
// Define the union U_pfmd_combhist_35_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_35_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_35_;
// Define the union U_pfmd_combhist_36_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_36_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_36_;
// Define the union U_pfmd_combhist_37_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_37_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_37_;
// Define the union U_pfmd_combhist_38_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_38_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_38_;
// Define the union U_pfmd_combhist_39_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_39_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_39_;
// Define the union U_pfmd_combhist_40_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_40_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_40_;
// Define the union U_pfmd_combhist_41_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_41_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_41_;
// Define the union U_pfmd_combhist_42_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_42_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_42_;
// Define the union U_pfmd_combhist_43_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_43_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_43_;
// Define the union U_pfmd_combhist_44_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_44_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_44_;
// Define the union U_pfmd_combhist_45_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_45_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_45_;
// Define the union U_pfmd_combhist_46_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_46_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_46_;
// Define the union U_pfmd_combhist_47_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_47_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_47_;
// Define the union U_pfmd_combhist_48_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_48_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_48_;
// Define the union U_pfmd_combhist_49_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_49_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_49_;
// Define the union U_pfmd_combhist_50_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_50_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_50_;
// Define the union U_pfmd_combhist_51_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_51_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_51_;
// Define the union U_pfmd_combhist_52_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_52_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_52_;
// Define the union U_pfmd_combhist_53_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_53_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_53_;
// Define the union U_pfmd_combhist_54_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_54_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_54_;
// Define the union U_pfmd_combhist_55_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_55_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_55_;
// Define the union U_pfmd_combhist_56_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_56_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_56_;
// Define the union U_pfmd_combhist_57_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_57_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_57_;
// Define the union U_pfmd_combhist_58_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_58_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_58_;
// Define the union U_pfmd_combhist_59_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_59_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_59_;
// Define the union U_pfmd_combhist_60_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_60_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_60_;
// Define the union U_pfmd_combhist_61_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_61_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_61_;
// Define the union U_pfmd_combhist_62_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_62_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_62_;
// Define the union U_pfmd_combhist_63_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_63_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_63_;
// Define the union U_pfmd_combhist_64_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_combhist_64_       : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_combhist_64_;
// Define the union U_pfmd_chd0_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_0_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_0_;
// Define the union U_pfmd_chd0_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_1_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_1_;
// Define the union U_pfmd_chd0_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_2_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_2_;
// Define the union U_pfmd_chd0_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_3_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_3_;
// Define the union U_pfmd_chd0_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_4_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_4_;
// Define the union U_pfmd_chd0_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_5_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_5_;
// Define the union U_pfmd_chd0_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_6_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_6_;
// Define the union U_pfmd_chd0_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_7_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_7_;
// Define the union U_pfmd_chd0_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_8_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_8_;
// Define the union U_pfmd_chd0_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_9_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_9_;
// Define the union U_pfmd_chd0_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_10_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_10_;
// Define the union U_pfmd_chd0_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_11_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_11_;
// Define the union U_pfmd_chd0_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_12_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_12_;
// Define the union U_pfmd_chd0_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_13_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_13_;
// Define the union U_pfmd_chd0_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_14_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_14_;
// Define the union U_pfmd_chd0_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_15_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_15_;
// Define the union U_pfmd_chd0_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_16_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_16_;
// Define the union U_pfmd_chd0_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_17_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_17_;
// Define the union U_pfmd_chd0_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_18_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_18_;
// Define the union U_pfmd_chd0_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_19_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_19_;
// Define the union U_pfmd_chd0_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_20_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_20_;
// Define the union U_pfmd_chd0_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_21_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_21_;
// Define the union U_pfmd_chd0_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_22_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_22_;
// Define the union U_pfmd_chd0_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_23_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_23_;
// Define the union U_pfmd_chd0_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_24_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_24_;
// Define the union U_pfmd_chd0_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_25_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_25_;
// Define the union U_pfmd_chd0_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_26_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_26_;
// Define the union U_pfmd_chd0_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_27_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_27_;
// Define the union U_pfmd_chd0_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_28_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_28_;
// Define the union U_pfmd_chd0_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_29_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_29_;
// Define the union U_pfmd_chd0_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_30_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_30_;
// Define the union U_pfmd_chd0_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd0_31_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd0_31_;
// Define the union U_pfmd_chd1_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_0_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_0_;
// Define the union U_pfmd_chd1_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_1_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_1_;
// Define the union U_pfmd_chd1_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_2_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_2_;
// Define the union U_pfmd_chd1_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_3_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_3_;
// Define the union U_pfmd_chd1_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_4_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_4_;
// Define the union U_pfmd_chd1_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_5_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_5_;
// Define the union U_pfmd_chd1_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_6_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_6_;
// Define the union U_pfmd_chd1_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_7_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_7_;
// Define the union U_pfmd_chd1_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_8_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_8_;
// Define the union U_pfmd_chd1_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_9_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_9_;
// Define the union U_pfmd_chd1_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_10_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_10_;
// Define the union U_pfmd_chd1_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_11_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_11_;
// Define the union U_pfmd_chd1_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_12_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_12_;
// Define the union U_pfmd_chd1_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_13_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_13_;
// Define the union U_pfmd_chd1_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_14_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_14_;
// Define the union U_pfmd_chd1_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_15_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_15_;
// Define the union U_pfmd_chd1_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_16_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_16_;
// Define the union U_pfmd_chd1_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_17_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_17_;
// Define the union U_pfmd_chd1_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_18_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_18_;
// Define the union U_pfmd_chd1_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_19_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_19_;
// Define the union U_pfmd_chd1_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_20_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_20_;
// Define the union U_pfmd_chd1_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_21_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_21_;
// Define the union U_pfmd_chd1_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_22_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_22_;
// Define the union U_pfmd_chd1_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_23_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_23_;
// Define the union U_pfmd_chd1_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_24_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_24_;
// Define the union U_pfmd_chd1_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_25_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_25_;
// Define the union U_pfmd_chd1_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_26_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_26_;
// Define the union U_pfmd_chd1_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_27_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_27_;
// Define the union U_pfmd_chd1_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_28_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_28_;
// Define the union U_pfmd_chd1_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_29_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_29_;
// Define the union U_pfmd_chd1_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_30_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_30_;
// Define the union U_pfmd_chd1_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd1_31_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd1_31_;
// Define the union U_pfmd_chd2_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_0_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_0_;
// Define the union U_pfmd_chd2_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_1_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_1_;
// Define the union U_pfmd_chd2_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_2_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_2_;
// Define the union U_pfmd_chd2_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_3_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_3_;
// Define the union U_pfmd_chd2_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_4_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_4_;
// Define the union U_pfmd_chd2_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_5_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_5_;
// Define the union U_pfmd_chd2_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_6_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_6_;
// Define the union U_pfmd_chd2_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_7_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_7_;
// Define the union U_pfmd_chd2_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_8_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_8_;
// Define the union U_pfmd_chd2_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_9_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_9_;
// Define the union U_pfmd_chd2_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_10_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_10_;
// Define the union U_pfmd_chd2_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_11_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_11_;
// Define the union U_pfmd_chd2_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_12_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_12_;
// Define the union U_pfmd_chd2_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_13_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_13_;
// Define the union U_pfmd_chd2_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_14_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_14_;
// Define the union U_pfmd_chd2_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_15_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_15_;
// Define the union U_pfmd_chd2_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_16_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_16_;
// Define the union U_pfmd_chd2_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_17_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_17_;
// Define the union U_pfmd_chd2_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_18_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_18_;
// Define the union U_pfmd_chd2_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_19_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_19_;
// Define the union U_pfmd_chd2_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_20_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_20_;
// Define the union U_pfmd_chd2_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_21_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_21_;
// Define the union U_pfmd_chd2_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_22_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_22_;
// Define the union U_pfmd_chd2_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_23_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_23_;
// Define the union U_pfmd_chd2_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_24_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_24_;
// Define the union U_pfmd_chd2_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_25_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_25_;
// Define the union U_pfmd_chd2_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_26_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_26_;
// Define the union U_pfmd_chd2_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_27_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_27_;
// Define the union U_pfmd_chd2_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_28_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_28_;
// Define the union U_pfmd_chd2_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_29_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_29_;
// Define the union U_pfmd_chd2_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_30_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_30_;
// Define the union U_pfmd_chd2_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd2_31_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd2_31_;
// Define the union U_pfmd_chd3_0_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_0_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_0_;
// Define the union U_pfmd_chd3_1_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_1_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_1_;
// Define the union U_pfmd_chd3_2_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_2_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_2_;
// Define the union U_pfmd_chd3_3_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_3_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_3_;
// Define the union U_pfmd_chd3_4_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_4_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_4_;
// Define the union U_pfmd_chd3_5_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_5_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_5_;
// Define the union U_pfmd_chd3_6_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_6_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_6_;
// Define the union U_pfmd_chd3_7_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_7_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_7_;
// Define the union U_pfmd_chd3_8_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_8_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_8_;
// Define the union U_pfmd_chd3_9_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_9_            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_9_;
// Define the union U_pfmd_chd3_10_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_10_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_10_;
// Define the union U_pfmd_chd3_11_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_11_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_11_;
// Define the union U_pfmd_chd3_12_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_12_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_12_;
// Define the union U_pfmd_chd3_13_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_13_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_13_;
// Define the union U_pfmd_chd3_14_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_14_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_14_;
// Define the union U_pfmd_chd3_15_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_15_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_15_;
// Define the union U_pfmd_chd3_16_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_16_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_16_;
// Define the union U_pfmd_chd3_17_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_17_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_17_;
// Define the union U_pfmd_chd3_18_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_18_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_18_;
// Define the union U_pfmd_chd3_19_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_19_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_19_;
// Define the union U_pfmd_chd3_20_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_20_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_20_;
// Define the union U_pfmd_chd3_21_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_21_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_21_;
// Define the union U_pfmd_chd3_22_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_22_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_22_;
// Define the union U_pfmd_chd3_23_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_23_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_23_;
// Define the union U_pfmd_chd3_24_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_24_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_24_;
// Define the union U_pfmd_chd3_25_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_25_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_25_;
// Define the union U_pfmd_chd3_26_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_26_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_26_;
// Define the union U_pfmd_chd3_27_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_27_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_27_;
// Define the union U_pfmd_chd3_28_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_28_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_28_;
// Define the union U_pfmd_chd3_29_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_29_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_29_;
// Define the union U_pfmd_chd3_30_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_30_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_30_;
// Define the union U_pfmd_chd3_31_
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfmd_chd3_31_           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_pfmd_chd3_31_;
// Define the union U_iglb_mtn_bin0
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin0           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin0;
// Define the union U_iglb_mtn_bin1
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin1           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin1;
// Define the union U_iglb_mtn_bin2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin2           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin2;
// Define the union U_iglb_mtn_bin3
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin3           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin3;
// Define the union U_iglb_mtn_bin4
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin4           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin4;
// Define the union U_iglb_mtn_bin5
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin5           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin5;
// Define the union U_iglb_mtn_bin6
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin6           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin6;
// Define the union U_iglb_mtn_bin7
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin7           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin7;
// Define the union U_iglb_mtn_bin8
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin8           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin8;
// Define the union U_iglb_mtn_bin9
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin9           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin9;
// Define the union U_iglb_mtn_bin10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin10          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin10;
// Define the union U_iglb_mtn_bin11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin11          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin11;
// Define the union U_iglb_mtn_bin12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin12          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin12;
// Define the union U_iglb_mtn_bin13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin13          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin13;
// Define the union U_iglb_mtn_bin14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin14          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin14;
// Define the union U_iglb_mtn_bin15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin15          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin15;
// Define the union U_iglb_mtn_bin16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin16          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin16;
// Define the union U_iglb_mtn_bin17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin17          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin17;
// Define the union U_iglb_mtn_bin18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin18          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin18;
// Define the union U_iglb_mtn_bin19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin19          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin19;
// Define the union U_iglb_mtn_bin20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin20          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin20;
// Define the union U_iglb_mtn_bin21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin21          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin21;
// Define the union U_iglb_mtn_bin22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin22          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin22;
// Define the union U_iglb_mtn_bin23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin23          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin23;
// Define the union U_iglb_mtn_bin24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin24          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin24;
// Define the union U_iglb_mtn_bin25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin25          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin25;
// Define the union U_iglb_mtn_bin26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin26          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_mtn_bin26;
// Define the union U_IGLB_MTN_BIN27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin27          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_MTN_BIN27;
// Define the union U_IGLB_MTN_BIN28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin28          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_MTN_BIN28;
// Define the union U_IGLB_MTN_BIN29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin29          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_MTN_BIN29;
// Define the union U_IGLB_MTN_BIN30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin30          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_MTN_BIN30;
// Define the union U_IGLB_MTN_BIN31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_mtn_bin31          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_MTN_BIN31;
// Define the union U_IGLB_SMALL_MTN_NUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_small_mtn_num      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_SMALL_MTN_NUM;
// Define the union U_IGLB_SMALL_MTN_SUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_small_mtn_sum      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_IGLB_SMALL_MTN_SUM;
// Define the union U_iglb_large_mtn_num
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_large_mtn_num      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_large_mtn_num;
// Define the union U_iglb_large_mtn_sum
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_large_mtn_sum      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_large_mtn_sum;
// Define the union U_iglb_middle_mtn_num
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_middle_mtn_num     : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_middle_mtn_num;
// Define the union U_iglb_middle_mtn_sum
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int iglb_middle_mtn_sum     : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_iglb_middle_mtn_sum;
// Define the union U_PGLB_MTN_BIN0
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin0           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN0;
// Define the union U_PGLB_MTN_BIN1
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin1           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN1;
// Define the union U_PGLB_MTN_BIN2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin2           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN2;
// Define the union U_PGLB_MTN_BIN3
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin3           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN3;
// Define the union U_PGLB_MTN_BIN4
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin4           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN4;
// Define the union U_PGLB_MTN_BIN5
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin5           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN5;
// Define the union U_PGLB_MTN_BIN6
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin6           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN6;
// Define the union U_PGLB_MTN_BIN7
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin7           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN7;
// Define the union U_PGLB_MTN_BIN8
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin8           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN8;
// Define the union U_PGLB_MTN_BIN9
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin9           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN9;
// Define the union U_PGLB_MTN_BIN10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin10          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN10;
// Define the union U_PGLB_MTN_BIN11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin11          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN11;
// Define the union U_PGLB_MTN_BIN12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin12          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN12;
// Define the union U_PGLB_MTN_BIN13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin13          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN13;
// Define the union U_PGLB_MTN_BIN14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin14          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN14;
// Define the union U_PGLB_MTN_BIN15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin15          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN15;
// Define the union U_PGLB_MTN_BIN16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin16          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN16;
// Define the union U_PGLB_MTN_BIN17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin17          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN17;
// Define the union U_PGLB_MTN_BIN18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin18          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN18;
// Define the union U_PGLB_MTN_BIN19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin19          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN19;
// Define the union U_PGLB_MTN_BIN20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin20          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN20;
// Define the union U_PGLB_MTN_BIN21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin21          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN21;
// Define the union U_PGLB_MTN_BIN22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin22          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN22;
// Define the union U_PGLB_MTN_BIN23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin23          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN23;
// Define the union U_PGLB_MTN_BIN24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin24          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN24;
// Define the union U_PGLB_MTN_BIN25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin25          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN25;
// Define the union U_PGLB_MTN_BIN26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin26          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN26;
// Define the union U_PGLB_MTN_BIN27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin27          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN27;
// Define the union U_PGLB_MTN_BIN28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin28          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN28;
// Define the union U_PGLB_MTN_BIN29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin29          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN29;
// Define the union U_PGLB_MTN_BIN30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin30          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN30;
// Define the union U_PGLB_MTN_BIN31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_mtn_bin31          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MTN_BIN31;
// Define the union U_PGLB_SMALL_MTN_NUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_small_mtn_num      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_SMALL_MTN_NUM;
// Define the union U_PGLB_SMALL_MTN_SUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_small_mtn_sum      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_SMALL_MTN_SUM;
// Define the union U_PGLB_LARGE_MTN_NUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_large_mtn_num      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_LARGE_MTN_NUM;
// Define the union U_PGLB_LARGE_MTN_SUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_large_mtn_sum      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_LARGE_MTN_SUM;
// Define the union U_PGLB_MIDDLE_MTN_NUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_middle_mtn_num     : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MIDDLE_MTN_NUM;
// Define the union U_PGLB_MIDDLE_MTN_SUM
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pglb_middle_mtn_sum     : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_PGLB_MIDDLE_MTN_SUM;
// Define the union U_scd_hist_bin_1
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_1          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_1;
// Define the union U_scd_hist_bin_2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_2          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_2;
// Define the union U_scd_hist_bin_3
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_3          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_3;
// Define the union U_scd_hist_bin_4
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_4          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_4;
// Define the union U_scd_hist_bin_5
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_5          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_5;
// Define the union U_scd_hist_bin_6
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_6          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_6;
// Define the union U_scd_hist_bin_7
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_7          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_7;
// Define the union U_scd_hist_bin_8
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_8          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_8;
// Define the union U_scd_hist_bin_9
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_9          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_9;
// Define the union U_scd_hist_bin_10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_10         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_10;
// Define the union U_scd_hist_bin_11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_11         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_11;
// Define the union U_scd_hist_bin_12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_12         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_12;
// Define the union U_scd_hist_bin_13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_13         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_13;
// Define the union U_scd_hist_bin_14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_14         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_14;
// Define the union U_scd_hist_bin_15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_15         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_15;
// Define the union U_scd_hist_bin_16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_16         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_16;
// Define the union U_scd_hist_bin_17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_17         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_17;
// Define the union U_scd_hist_bin_18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_18         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_18;
// Define the union U_scd_hist_bin_19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_19         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_19;
// Define the union U_scd_hist_bin_20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_20         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_20;
// Define the union U_scd_hist_bin_21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_21         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_21;
// Define the union U_scd_hist_bin_22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_22         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_22;
// Define the union U_scd_hist_bin_23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_23         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_23;
// Define the union U_scd_hist_bin_24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_24         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_24;
// Define the union U_scd_hist_bin_25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_25         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_25;
// Define the union U_scd_hist_bin_26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_26         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_26;
// Define the union U_scd_hist_bin_27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_27         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_27;
// Define the union U_scd_hist_bin_28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_28         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_28;
// Define the union U_scd_hist_bin_29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_29         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_29;
// Define the union U_scd_hist_bin_30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_30         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_30;
// Define the union U_scd_hist_bin_31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_31         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_31;
// Define the union U_scd_hist_bin_32
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int scd_hist_bin_32         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_scd_hist_bin_32;
// Define the union U_LBD_INFO_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lbd_fix_bot           : 12  ; // [11..0] 
        unsigned int    Reserved_9            : 4   ; // [15..12] 
        unsigned int    lbd_fix_top           : 12  ; // [27..16] 
        unsigned int    Reserved_8            : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_LBD_INFO_0;

// Define the union U_LBD_INFO_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lbd_fix_right         : 12  ; // [11..0] 
        unsigned int    Reserved_12           : 4   ; // [15..12] 
        unsigned int    lbd_fix_left          : 12  ; // [27..16] 
        unsigned int    Reserved_11           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_LBD_INFO_1;

// Define the union U_STR_DET_VIDBLK0TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK0TOL0;

// Define the union U_STR_DET_VIDBLK0TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK0TOL1;

// Define the union U_STR_DET_VIDBLK1TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK1TOL0;

// Define the union U_STR_DET_VIDBLK1TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK1TOL1;

// Define the union U_STR_DET_VIDBLK2TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK2TOL0;

// Define the union U_STR_DET_VIDBLK2TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK2TOL1;

// Define the union U_STR_DET_VIDBLK3TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK3TOL0;

// Define the union U_STR_DET_VIDBLK3TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK3TOL1;

// Define the union U_STR_DET_VIDBLK4TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK4TOL0;

// Define the union U_STR_DET_VIDBLK4TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK4TOL1;

// Define the union U_STR_DET_VIDBLK5TOL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix0              : 8   ; // [7..0] 
        unsigned int    blk_pix1              : 8   ; // [15..8] 
        unsigned int    blk_pix2              : 8   ; // [23..16] 
        unsigned int    blk_pix3              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK5TOL0;

// Define the union U_STR_DET_VIDBLK5TOL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk_pix4              : 8   ; // [7..0] 
        unsigned int    blk_pix5              : 8   ; // [15..8] 
        unsigned int    blk_pix6              : 8   ; // [23..16] 
        unsigned int    blk_pix7              : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLK5TOL1;

//==============================================================================
// Define the global struct
typedef struct
{
   volatile U_ifmd_pcc_ffwd      ifmd_pcc_ffwd;
   volatile U_ifmd_pcc_fwd       ifmd_pcc_fwd;
   volatile U_ifmd_pcc_bwd       ifmd_pcc_bwd;
   volatile U_ifmd_pcc_crss      ifmd_pcc_crss;
   volatile U_ifmd_pcc_crss_be   ifmd_pcc_crss_be;
   volatile U_ifmd_pcc_pw        ifmd_pcc_pw;
   volatile U_ifmd_pcc_fwd_tkr   ifmd_pcc_fwd_tkr;
   volatile U_ifmd_pcc_bwd_tkr   ifmd_pcc_bwd_tkr;
   volatile U_ifmd_osd_out0      ifmd_osd_out0;
   volatile U_ifmd_osd_out1      ifmd_osd_out1;
   volatile U_ifmd_osd_out2      ifmd_osd_out2;
   volatile U_ifmd_itdiff        ifmd_itdiff;
   volatile U_ifmd_itdiff_be     ifmd_itdiff_be;
   volatile U_ifmd_match_um      ifmd_match_um;
   volatile U_ifmd_nomatch_um    ifmd_nomatch_um;
   volatile U_ifmd_match_um2     ifmd_match_um2;
   volatile U_ifmd_nomatch_um2   ifmd_nomatch_um2;
   volatile U_ifmd_match_um_be   ifmd_match_um_be;
   volatile U_ifmd_nomatch_um_be ifmd_nomatch_um_be;
   volatile U_ifmd_match_um2_be  ifmd_match_um2_be;
   volatile U_ifmd_nomatch_um2_be ifmd_nomatch_um2_be;
   volatile U_ifmd_lasicnt14     ifmd_lasicnt14;
   volatile U_ifmd_lasicnt32     ifmd_lasicnt32;
   volatile U_ifmd_lasicnt34     ifmd_lasicnt34;
   volatile U_ifmd_ichd          ifmd_ichd;
   volatile U_ifmd_mcomb01       ifmd_mcomb01;
   volatile U_ifmd_mcomb03       ifmd_mcomb03;
   volatile U_ifmd_mcomb12       ifmd_mcomb12;
   volatile U_ifmd_stillblk_0_   ifmd_stillblk_0_;
   volatile U_ifmd_stillblk_1_   ifmd_stillblk_1_;
   volatile U_ifmd_stillblk_2_   ifmd_stillblk_2_;
   volatile U_ifmd_stillblk_3_   ifmd_stillblk_3_;
   volatile U_ifmd_stillblk_4_   ifmd_stillblk_4_;
   volatile U_ifmd_stillblk_5_   ifmd_stillblk_5_;
   volatile U_ifmd_stillblk_6_   ifmd_stillblk_6_;
   volatile U_ifmd_stillblk_7_   ifmd_stillblk_7_;
   volatile U_ifmd_stillblk_8_   ifmd_stillblk_8_;
   volatile U_ifmd_stillblk_9_   ifmd_stillblk_9_;
   volatile U_ifmd_stillblk_10_  ifmd_stillblk_10_;
   volatile U_ifmd_stillblk_11_  ifmd_stillblk_11_;
   volatile U_ifmd_stillblk_12_  ifmd_stillblk_12_;
   volatile U_ifmd_stillblk_13_  ifmd_stillblk_13_;
   volatile U_ifmd_stillblk_14_  ifmd_stillblk_14_;
   volatile U_ifmd_stillblk_15_  ifmd_stillblk_15_;
   volatile U_ifmd_hist_bin_0_   ifmd_hist_bin_0_;
   volatile U_ifmd_hist_bin_1_   ifmd_hist_bin_1_;
   volatile U_ifmd_hist_bin_2_   ifmd_hist_bin_2_;
   volatile U_ifmd_hist_bin_3_   ifmd_hist_bin_3_;
   volatile U_ifmd_hist_bin_4_   ifmd_hist_bin_4_;
   volatile U_ifmd_hist_bin_5_   ifmd_hist_bin_5_;
   volatile U_ifmd_hist_bin_6_   ifmd_hist_bin_6_;
   volatile U_ifmd_hist_bin_7_   ifmd_hist_bin_7_;
   volatile U_ifmd_hist_bin_8_   ifmd_hist_bin_8_;
   volatile U_ifmd_hist_bin_9_   ifmd_hist_bin_9_;
   volatile U_ifmd_hist_bin_10_  ifmd_hist_bin_10_;
   volatile U_ifmd_hist_bin_11_  ifmd_hist_bin_11_;
   volatile U_ifmd_hist_bin_12_  ifmd_hist_bin_12_;
   volatile U_ifmd_hist_bin_13_  ifmd_hist_bin_13_;
   volatile U_ifmd_hist_bin_14_  ifmd_hist_bin_14_;
   volatile U_ifmd_hist_bin_15_  ifmd_hist_bin_15_;
   volatile U_ifmd_hist_bin_16_  ifmd_hist_bin_16_;
   volatile U_ifmd_hist_bin_17_  ifmd_hist_bin_17_;
   volatile U_ifmd_hist_bin_18_  ifmd_hist_bin_18_;
   volatile U_ifmd_hist_bin_19_  ifmd_hist_bin_19_;
   volatile U_ifmd_hist_bin_20_  ifmd_hist_bin_20_;
   volatile U_ifmd_hist_bin_21_  ifmd_hist_bin_21_;
   volatile U_ifmd_hist_bin_22_  ifmd_hist_bin_22_;
   volatile U_ifmd_hist_bin_23_  ifmd_hist_bin_23_;
   volatile U_ifmd_hist_bin_24_  ifmd_hist_bin_24_;
   volatile U_ifmd_hist_bin_25_  ifmd_hist_bin_25_;
   volatile U_ifmd_hist_bin_26_  ifmd_hist_bin_26_;
   volatile U_ifmd_hist_bin_27_  ifmd_hist_bin_27_;
   volatile U_ifmd_hist_bin_28_  ifmd_hist_bin_28_;
   volatile U_ifmd_hist_bin_29_  ifmd_hist_bin_29_;
   volatile U_ifmd_hist_bin_30_  ifmd_hist_bin_30_;
   volatile U_ifmd_hist_bin_31_  ifmd_hist_bin_31_;
   volatile U_ifmd_hist_bin_32_  ifmd_hist_bin_32_;
   volatile U_ifmd_hist_bin_33_  ifmd_hist_bin_33_;
   volatile U_ifmd_hist_bin_34_  ifmd_hist_bin_34_;
   volatile U_ifmd_hist_bin_35_  ifmd_hist_bin_35_;
   volatile U_ifmd_hist_bin_36_  ifmd_hist_bin_36_;
   volatile U_ifmd_hist_bin_37_  ifmd_hist_bin_37_;
   volatile U_ifmd_hist_bin_38_  ifmd_hist_bin_38_;
   volatile U_ifmd_hist_bin_39_  ifmd_hist_bin_39_;
   volatile U_ifmd_hist_bin_40_  ifmd_hist_bin_40_;
   volatile U_ifmd_hist_bin_41_  ifmd_hist_bin_41_;
   volatile U_ifmd_hist_bin_42_  ifmd_hist_bin_42_;
   volatile U_ifmd_hist_bin_43_  ifmd_hist_bin_43_;
   volatile U_ifmd_hist_bin_44_  ifmd_hist_bin_44_;
   volatile U_ifmd_hist_bin_45_  ifmd_hist_bin_45_;
   volatile U_ifmd_hist_bin_46_  ifmd_hist_bin_46_;
   volatile U_ifmd_hist_bin_47_  ifmd_hist_bin_47_;
   volatile U_ifmd_hist_bin_48_  ifmd_hist_bin_48_;
   volatile U_ifmd_hist_bin_49_  ifmd_hist_bin_49_;
   volatile U_ifmd_hist_bin_50_  ifmd_hist_bin_50_;
   volatile U_ifmd_hist_bin_51_  ifmd_hist_bin_51_;
   volatile U_ifmd_hist_bin_52_  ifmd_hist_bin_52_;
   volatile U_ifmd_hist_bin_53_  ifmd_hist_bin_53_;
   volatile U_ifmd_hist_bin_54_  ifmd_hist_bin_54_;
   volatile U_ifmd_hist_bin_55_  ifmd_hist_bin_55_;
   volatile U_ifmd_hist_bin_56_  ifmd_hist_bin_56_;
   volatile U_ifmd_hist_bin_57_  ifmd_hist_bin_57_;
   volatile U_ifmd_hist_bin_58_  ifmd_hist_bin_58_;
   volatile U_ifmd_hist_bin_59_  ifmd_hist_bin_59_;
   volatile U_ifmd_hist_bin_60_  ifmd_hist_bin_60_;
   volatile U_ifmd_hist_bin_61_  ifmd_hist_bin_61_;
   volatile U_ifmd_hist_bin_62_  ifmd_hist_bin_62_;
   volatile U_ifmd_hist_bin_63_  ifmd_hist_bin_63_;
   volatile U_ifmd_hist_bin_64_  ifmd_hist_bin_64_;
   volatile unsigned int         Reserved_0[19];
   volatile U_pfmd_combhist_0_   pfmd_combhist_0_;
   volatile U_pfmd_combhist_1_   pfmd_combhist_1_;
   volatile U_pfmd_combhist_2_   pfmd_combhist_2_;
   volatile U_pfmd_combhist_3_   pfmd_combhist_3_;
   volatile U_pfmd_combhist_4_   pfmd_combhist_4_;
   volatile U_pfmd_combhist_5_   pfmd_combhist_5_;
   volatile U_pfmd_combhist_6_   pfmd_combhist_6_;
   volatile U_pfmd_combhist_7_   pfmd_combhist_7_;
   volatile U_pfmd_combhist_8_   pfmd_combhist_8_;
   volatile U_pfmd_combhist_9_   pfmd_combhist_9_;
   volatile U_pfmd_combhist_10_  pfmd_combhist_10_;
   volatile U_pfmd_combhist_11_  pfmd_combhist_11_;
   volatile U_pfmd_combhist_12_  pfmd_combhist_12_;
   volatile U_pfmd_combhist_13_  pfmd_combhist_13_;
   volatile U_pfmd_combhist_14_  pfmd_combhist_14_;
   volatile U_pfmd_combhist_15_  pfmd_combhist_15_;
   volatile U_pfmd_combhist_16_  pfmd_combhist_16_;
   volatile U_pfmd_combhist_17_  pfmd_combhist_17_;
   volatile U_pfmd_combhist_18_  pfmd_combhist_18_;
   volatile U_pfmd_combhist_19_  pfmd_combhist_19_;
   volatile U_pfmd_combhist_20_  pfmd_combhist_20_;
   volatile U_pfmd_combhist_21_  pfmd_combhist_21_;
   volatile U_pfmd_combhist_22_  pfmd_combhist_22_;
   volatile U_pfmd_combhist_23_  pfmd_combhist_23_;
   volatile U_pfmd_combhist_24_  pfmd_combhist_24_;
   volatile U_pfmd_combhist_25_  pfmd_combhist_25_;
   volatile U_pfmd_combhist_26_  pfmd_combhist_26_;
   volatile U_pfmd_combhist_27_  pfmd_combhist_27_;
   volatile U_pfmd_combhist_28_  pfmd_combhist_28_;
   volatile U_pfmd_combhist_29_  pfmd_combhist_29_;
   volatile U_pfmd_combhist_30_  pfmd_combhist_30_;
   volatile U_pfmd_combhist_31_  pfmd_combhist_31_;
   volatile U_pfmd_combhist_32_  pfmd_combhist_32_;
   volatile U_pfmd_combhist_33_  pfmd_combhist_33_;
   volatile U_pfmd_combhist_34_  pfmd_combhist_34_;
   volatile U_pfmd_combhist_35_  pfmd_combhist_35_;
   volatile U_pfmd_combhist_36_  pfmd_combhist_36_;
   volatile U_pfmd_combhist_37_  pfmd_combhist_37_;
   volatile U_pfmd_combhist_38_  pfmd_combhist_38_;
   volatile U_pfmd_combhist_39_  pfmd_combhist_39_;
   volatile U_pfmd_combhist_40_  pfmd_combhist_40_;
   volatile U_pfmd_combhist_41_  pfmd_combhist_41_;
   volatile U_pfmd_combhist_42_  pfmd_combhist_42_;
   volatile U_pfmd_combhist_43_  pfmd_combhist_43_;
   volatile U_pfmd_combhist_44_  pfmd_combhist_44_;
   volatile U_pfmd_combhist_45_  pfmd_combhist_45_;
   volatile U_pfmd_combhist_46_  pfmd_combhist_46_;
   volatile U_pfmd_combhist_47_  pfmd_combhist_47_;
   volatile U_pfmd_combhist_48_  pfmd_combhist_48_;
   volatile U_pfmd_combhist_49_  pfmd_combhist_49_;
   volatile U_pfmd_combhist_50_  pfmd_combhist_50_;
   volatile U_pfmd_combhist_51_  pfmd_combhist_51_;
   volatile U_pfmd_combhist_52_  pfmd_combhist_52_;
   volatile U_pfmd_combhist_53_  pfmd_combhist_53_;
   volatile U_pfmd_combhist_54_  pfmd_combhist_54_;
   volatile U_pfmd_combhist_55_  pfmd_combhist_55_;
   volatile U_pfmd_combhist_56_  pfmd_combhist_56_;
   volatile U_pfmd_combhist_57_  pfmd_combhist_57_;
   volatile U_pfmd_combhist_58_  pfmd_combhist_58_;
   volatile U_pfmd_combhist_59_  pfmd_combhist_59_;
   volatile U_pfmd_combhist_60_  pfmd_combhist_60_;
   volatile U_pfmd_combhist_61_  pfmd_combhist_61_;
   volatile U_pfmd_combhist_62_  pfmd_combhist_62_;
   volatile U_pfmd_combhist_63_  pfmd_combhist_63_;
   volatile U_pfmd_combhist_64_  pfmd_combhist_64_;
   volatile unsigned int         Reserved_1[3];
   volatile U_pfmd_chd0_0_       pfmd_chd0_0_;
   volatile U_pfmd_chd0_1_       pfmd_chd0_1_;
   volatile U_pfmd_chd0_2_       pfmd_chd0_2_;
   volatile U_pfmd_chd0_3_       pfmd_chd0_3_;
   volatile U_pfmd_chd0_4_       pfmd_chd0_4_;
   volatile U_pfmd_chd0_5_       pfmd_chd0_5_;
   volatile U_pfmd_chd0_6_       pfmd_chd0_6_;
   volatile U_pfmd_chd0_7_       pfmd_chd0_7_;
   volatile U_pfmd_chd0_8_       pfmd_chd0_8_;
   volatile U_pfmd_chd0_9_       pfmd_chd0_9_;
   volatile U_pfmd_chd0_10_      pfmd_chd0_10_;
   volatile U_pfmd_chd0_11_      pfmd_chd0_11_;
   volatile U_pfmd_chd0_12_      pfmd_chd0_12_;
   volatile U_pfmd_chd0_13_      pfmd_chd0_13_;
   volatile U_pfmd_chd0_14_      pfmd_chd0_14_;
   volatile U_pfmd_chd0_15_      pfmd_chd0_15_;
   volatile U_pfmd_chd0_16_      pfmd_chd0_16_;
   volatile U_pfmd_chd0_17_      pfmd_chd0_17_;
   volatile U_pfmd_chd0_18_      pfmd_chd0_18_;
   volatile U_pfmd_chd0_19_      pfmd_chd0_19_;
   volatile U_pfmd_chd0_20_      pfmd_chd0_20_;
   volatile U_pfmd_chd0_21_      pfmd_chd0_21_;
   volatile U_pfmd_chd0_22_      pfmd_chd0_22_;
   volatile U_pfmd_chd0_23_      pfmd_chd0_23_;
   volatile U_pfmd_chd0_24_      pfmd_chd0_24_;
   volatile U_pfmd_chd0_25_      pfmd_chd0_25_;
   volatile U_pfmd_chd0_26_      pfmd_chd0_26_;
   volatile U_pfmd_chd0_27_      pfmd_chd0_27_;
   volatile U_pfmd_chd0_28_      pfmd_chd0_28_;
   volatile U_pfmd_chd0_29_      pfmd_chd0_29_;
   volatile U_pfmd_chd0_30_      pfmd_chd0_30_;
   volatile U_pfmd_chd0_31_      pfmd_chd0_31_;
   volatile U_pfmd_chd1_0_       pfmd_chd1_0_;
   volatile U_pfmd_chd1_1_       pfmd_chd1_1_;
   volatile U_pfmd_chd1_2_       pfmd_chd1_2_;
   volatile U_pfmd_chd1_3_       pfmd_chd1_3_;
   volatile U_pfmd_chd1_4_       pfmd_chd1_4_;
   volatile U_pfmd_chd1_5_       pfmd_chd1_5_;
   volatile U_pfmd_chd1_6_       pfmd_chd1_6_;
   volatile U_pfmd_chd1_7_       pfmd_chd1_7_;
   volatile U_pfmd_chd1_8_       pfmd_chd1_8_;
   volatile U_pfmd_chd1_9_       pfmd_chd1_9_;
   volatile U_pfmd_chd1_10_      pfmd_chd1_10_;
   volatile U_pfmd_chd1_11_      pfmd_chd1_11_;
   volatile U_pfmd_chd1_12_      pfmd_chd1_12_;
   volatile U_pfmd_chd1_13_      pfmd_chd1_13_;
   volatile U_pfmd_chd1_14_      pfmd_chd1_14_;
   volatile U_pfmd_chd1_15_      pfmd_chd1_15_;
   volatile U_pfmd_chd1_16_      pfmd_chd1_16_;
   volatile U_pfmd_chd1_17_      pfmd_chd1_17_;
   volatile U_pfmd_chd1_18_      pfmd_chd1_18_;
   volatile U_pfmd_chd1_19_      pfmd_chd1_19_;
   volatile U_pfmd_chd1_20_      pfmd_chd1_20_;
   volatile U_pfmd_chd1_21_      pfmd_chd1_21_;
   volatile U_pfmd_chd1_22_      pfmd_chd1_22_;
   volatile U_pfmd_chd1_23_      pfmd_chd1_23_;
   volatile U_pfmd_chd1_24_      pfmd_chd1_24_;
   volatile U_pfmd_chd1_25_      pfmd_chd1_25_;
   volatile U_pfmd_chd1_26_      pfmd_chd1_26_;
   volatile U_pfmd_chd1_27_      pfmd_chd1_27_;
   volatile U_pfmd_chd1_28_      pfmd_chd1_28_;
   volatile U_pfmd_chd1_29_      pfmd_chd1_29_;
   volatile U_pfmd_chd1_30_      pfmd_chd1_30_;
   volatile U_pfmd_chd1_31_      pfmd_chd1_31_;
   volatile U_pfmd_chd2_0_       pfmd_chd2_0_;
   volatile U_pfmd_chd2_1_       pfmd_chd2_1_;
   volatile U_pfmd_chd2_2_       pfmd_chd2_2_;
   volatile U_pfmd_chd2_3_       pfmd_chd2_3_;
   volatile U_pfmd_chd2_4_       pfmd_chd2_4_;
   volatile U_pfmd_chd2_5_       pfmd_chd2_5_;
   volatile U_pfmd_chd2_6_       pfmd_chd2_6_;
   volatile U_pfmd_chd2_7_       pfmd_chd2_7_;
   volatile U_pfmd_chd2_8_       pfmd_chd2_8_;
   volatile U_pfmd_chd2_9_       pfmd_chd2_9_;
   volatile U_pfmd_chd2_10_      pfmd_chd2_10_;
   volatile U_pfmd_chd2_11_      pfmd_chd2_11_;
   volatile U_pfmd_chd2_12_      pfmd_chd2_12_;
   volatile U_pfmd_chd2_13_      pfmd_chd2_13_;
   volatile U_pfmd_chd2_14_      pfmd_chd2_14_;
   volatile U_pfmd_chd2_15_      pfmd_chd2_15_;
   volatile U_pfmd_chd2_16_      pfmd_chd2_16_;
   volatile U_pfmd_chd2_17_      pfmd_chd2_17_;
   volatile U_pfmd_chd2_18_      pfmd_chd2_18_;
   volatile U_pfmd_chd2_19_      pfmd_chd2_19_;
   volatile U_pfmd_chd2_20_      pfmd_chd2_20_;
   volatile U_pfmd_chd2_21_      pfmd_chd2_21_;
   volatile U_pfmd_chd2_22_      pfmd_chd2_22_;
   volatile U_pfmd_chd2_23_      pfmd_chd2_23_;
   volatile U_pfmd_chd2_24_      pfmd_chd2_24_;
   volatile U_pfmd_chd2_25_      pfmd_chd2_25_;
   volatile U_pfmd_chd2_26_      pfmd_chd2_26_;
   volatile U_pfmd_chd2_27_      pfmd_chd2_27_;
   volatile U_pfmd_chd2_28_      pfmd_chd2_28_;
   volatile U_pfmd_chd2_29_      pfmd_chd2_29_;
   volatile U_pfmd_chd2_30_      pfmd_chd2_30_;
   volatile U_pfmd_chd2_31_      pfmd_chd2_31_;
   volatile U_pfmd_chd3_0_       pfmd_chd3_0_;
   volatile U_pfmd_chd3_1_       pfmd_chd3_1_;
   volatile U_pfmd_chd3_2_       pfmd_chd3_2_;
   volatile U_pfmd_chd3_3_       pfmd_chd3_3_;
   volatile U_pfmd_chd3_4_       pfmd_chd3_4_;
   volatile U_pfmd_chd3_5_       pfmd_chd3_5_;
   volatile U_pfmd_chd3_6_       pfmd_chd3_6_;
   volatile U_pfmd_chd3_7_       pfmd_chd3_7_;
   volatile U_pfmd_chd3_8_       pfmd_chd3_8_;
   volatile U_pfmd_chd3_9_       pfmd_chd3_9_;
   volatile U_pfmd_chd3_10_      pfmd_chd3_10_;
   volatile U_pfmd_chd3_11_      pfmd_chd3_11_;
   volatile U_pfmd_chd3_12_      pfmd_chd3_12_;
   volatile U_pfmd_chd3_13_      pfmd_chd3_13_;
   volatile U_pfmd_chd3_14_      pfmd_chd3_14_;
   volatile U_pfmd_chd3_15_      pfmd_chd3_15_;
   volatile U_pfmd_chd3_16_      pfmd_chd3_16_;
   volatile U_pfmd_chd3_17_      pfmd_chd3_17_;
   volatile U_pfmd_chd3_18_      pfmd_chd3_18_;
   volatile U_pfmd_chd3_19_      pfmd_chd3_19_;
   volatile U_pfmd_chd3_20_      pfmd_chd3_20_;
   volatile U_pfmd_chd3_21_      pfmd_chd3_21_;
   volatile U_pfmd_chd3_22_      pfmd_chd3_22_;
   volatile U_pfmd_chd3_23_      pfmd_chd3_23_;
   volatile U_pfmd_chd3_24_      pfmd_chd3_24_;
   volatile U_pfmd_chd3_25_      pfmd_chd3_25_;
   volatile U_pfmd_chd3_26_      pfmd_chd3_26_;
   volatile U_pfmd_chd3_27_      pfmd_chd3_27_;
   volatile U_pfmd_chd3_28_      pfmd_chd3_28_;
   volatile U_pfmd_chd3_29_      pfmd_chd3_29_;
   volatile U_pfmd_chd3_30_      pfmd_chd3_30_;
   volatile U_pfmd_chd3_31_      pfmd_chd3_31_;
   volatile unsigned int         Reserved_2[60];
   volatile U_iglb_mtn_bin0      iglb_mtn_bin0;
   volatile U_iglb_mtn_bin1      iglb_mtn_bin1;
   volatile U_iglb_mtn_bin2      iglb_mtn_bin2;
   volatile U_iglb_mtn_bin3      iglb_mtn_bin3;
   volatile U_iglb_mtn_bin4      iglb_mtn_bin4;
   volatile U_iglb_mtn_bin5      iglb_mtn_bin5;
   volatile U_iglb_mtn_bin6      iglb_mtn_bin6;
   volatile U_iglb_mtn_bin7      iglb_mtn_bin7;
   volatile U_iglb_mtn_bin8      iglb_mtn_bin8;
   volatile U_iglb_mtn_bin9      iglb_mtn_bin9;
   volatile U_iglb_mtn_bin10     iglb_mtn_bin10;
   volatile U_iglb_mtn_bin11     iglb_mtn_bin11;
   volatile U_iglb_mtn_bin12     iglb_mtn_bin12;
   volatile U_iglb_mtn_bin13     iglb_mtn_bin13;
   volatile U_iglb_mtn_bin14     iglb_mtn_bin14;
   volatile U_iglb_mtn_bin15     iglb_mtn_bin15;
   volatile U_iglb_mtn_bin16     iglb_mtn_bin16;
   volatile U_iglb_mtn_bin17     iglb_mtn_bin17;
   volatile U_iglb_mtn_bin18     iglb_mtn_bin18;
   volatile U_iglb_mtn_bin19     iglb_mtn_bin19;
   volatile U_iglb_mtn_bin20     iglb_mtn_bin20;
   volatile U_iglb_mtn_bin21     iglb_mtn_bin21;
   volatile U_iglb_mtn_bin22     iglb_mtn_bin22;
   volatile U_iglb_mtn_bin23     iglb_mtn_bin23;
   volatile U_iglb_mtn_bin24     iglb_mtn_bin24;
   volatile U_iglb_mtn_bin25     iglb_mtn_bin25;
   volatile U_iglb_mtn_bin26     iglb_mtn_bin26;
   volatile U_IGLB_MTN_BIN27     IGLB_MTN_BIN27;
   volatile U_IGLB_MTN_BIN28     IGLB_MTN_BIN28;
   volatile U_IGLB_MTN_BIN29     IGLB_MTN_BIN29;
   volatile U_IGLB_MTN_BIN30     IGLB_MTN_BIN30;
   volatile U_IGLB_MTN_BIN31     IGLB_MTN_BIN31;
   volatile U_IGLB_SMALL_MTN_NUM IGLB_SMALL_MTN_NUM;
   volatile U_IGLB_SMALL_MTN_SUM IGLB_SMALL_MTN_SUM;
   volatile U_iglb_large_mtn_num iglb_large_mtn_num;
   volatile U_iglb_large_mtn_sum iglb_large_mtn_sum;
   volatile U_iglb_middle_mtn_num iglb_middle_mtn_num;
   volatile U_iglb_middle_mtn_sum iglb_middle_mtn_sum;
   volatile unsigned int         Reserved_3[26];
   volatile U_PGLB_MTN_BIN0      PGLB_MTN_BIN0;
   volatile U_PGLB_MTN_BIN1      PGLB_MTN_BIN1;
   volatile U_PGLB_MTN_BIN2      PGLB_MTN_BIN2;
   volatile U_PGLB_MTN_BIN3      PGLB_MTN_BIN3;
   volatile U_PGLB_MTN_BIN4      PGLB_MTN_BIN4;
   volatile U_PGLB_MTN_BIN5      PGLB_MTN_BIN5;
   volatile U_PGLB_MTN_BIN6      PGLB_MTN_BIN6;
   volatile U_PGLB_MTN_BIN7      PGLB_MTN_BIN7;
   volatile U_PGLB_MTN_BIN8      PGLB_MTN_BIN8;
   volatile U_PGLB_MTN_BIN9      PGLB_MTN_BIN9;
   volatile U_PGLB_MTN_BIN10     PGLB_MTN_BIN10;
   volatile U_PGLB_MTN_BIN11     PGLB_MTN_BIN11;
   volatile U_PGLB_MTN_BIN12     PGLB_MTN_BIN12;
   volatile U_PGLB_MTN_BIN13     PGLB_MTN_BIN13;
   volatile U_PGLB_MTN_BIN14     PGLB_MTN_BIN14;
   volatile U_PGLB_MTN_BIN15     PGLB_MTN_BIN15;
   volatile U_PGLB_MTN_BIN16     PGLB_MTN_BIN16;
   volatile U_PGLB_MTN_BIN17     PGLB_MTN_BIN17;
   volatile U_PGLB_MTN_BIN18     PGLB_MTN_BIN18;
   volatile U_PGLB_MTN_BIN19     PGLB_MTN_BIN19;
   volatile U_PGLB_MTN_BIN20     PGLB_MTN_BIN20;
   volatile U_PGLB_MTN_BIN21     PGLB_MTN_BIN21;
   volatile U_PGLB_MTN_BIN22     PGLB_MTN_BIN22;
   volatile U_PGLB_MTN_BIN23     PGLB_MTN_BIN23;
   volatile U_PGLB_MTN_BIN24     PGLB_MTN_BIN24;
   volatile U_PGLB_MTN_BIN25     PGLB_MTN_BIN25;
   volatile U_PGLB_MTN_BIN26     PGLB_MTN_BIN26;
   volatile U_PGLB_MTN_BIN27     PGLB_MTN_BIN27;
   volatile U_PGLB_MTN_BIN28     PGLB_MTN_BIN28;
   volatile U_PGLB_MTN_BIN29     PGLB_MTN_BIN29;
   volatile U_PGLB_MTN_BIN30     PGLB_MTN_BIN30;
   volatile U_PGLB_MTN_BIN31     PGLB_MTN_BIN31;
   volatile U_PGLB_SMALL_MTN_NUM PGLB_SMALL_MTN_NUM;
   volatile U_PGLB_SMALL_MTN_SUM PGLB_SMALL_MTN_SUM;
   volatile U_PGLB_LARGE_MTN_NUM PGLB_LARGE_MTN_NUM;
   volatile U_PGLB_LARGE_MTN_SUM PGLB_LARGE_MTN_SUM;
   volatile U_PGLB_MIDDLE_MTN_NUM PGLB_MIDDLE_MTN_NUM;
   volatile U_PGLB_MIDDLE_MTN_SUM PGLB_MIDDLE_MTN_SUM;
   volatile unsigned int         Reserved_4[26];
   volatile U_scd_hist_bin_1     scd_hist_bin_1;
   volatile U_scd_hist_bin_2     scd_hist_bin_2;
   volatile U_scd_hist_bin_3     scd_hist_bin_3;
   volatile U_scd_hist_bin_4     scd_hist_bin_4;
   volatile U_scd_hist_bin_5     scd_hist_bin_5;
   volatile U_scd_hist_bin_6     scd_hist_bin_6;
   volatile U_scd_hist_bin_7     scd_hist_bin_7;
   volatile U_scd_hist_bin_8     scd_hist_bin_8;
   volatile U_scd_hist_bin_9     scd_hist_bin_9;
   volatile U_scd_hist_bin_10    scd_hist_bin_10;
   volatile U_scd_hist_bin_11    scd_hist_bin_11;
   volatile U_scd_hist_bin_12    scd_hist_bin_12;
   volatile U_scd_hist_bin_13    scd_hist_bin_13;
   volatile U_scd_hist_bin_14    scd_hist_bin_14;
   volatile U_scd_hist_bin_15    scd_hist_bin_15;
   volatile U_scd_hist_bin_16    scd_hist_bin_16;
   volatile U_scd_hist_bin_17    scd_hist_bin_17;
   volatile U_scd_hist_bin_18    scd_hist_bin_18;
   volatile U_scd_hist_bin_19    scd_hist_bin_19;
   volatile U_scd_hist_bin_20    scd_hist_bin_20;
   volatile U_scd_hist_bin_21    scd_hist_bin_21;
   volatile U_scd_hist_bin_22    scd_hist_bin_22;
   volatile U_scd_hist_bin_23    scd_hist_bin_23;
   volatile U_scd_hist_bin_24    scd_hist_bin_24;
   volatile U_scd_hist_bin_25    scd_hist_bin_25;
   volatile U_scd_hist_bin_26    scd_hist_bin_26;
   volatile U_scd_hist_bin_27    scd_hist_bin_27;
   volatile U_scd_hist_bin_28    scd_hist_bin_28;
   volatile U_scd_hist_bin_29    scd_hist_bin_29;
   volatile U_scd_hist_bin_30    scd_hist_bin_30;
   volatile U_scd_hist_bin_31    scd_hist_bin_31;
   volatile U_scd_hist_bin_32    scd_hist_bin_32;
   volatile unsigned int         Reserved_5[32];
   volatile U_LBD_INFO_0         LBD_INFO_0;
   volatile U_LBD_INFO_1         LBD_INFO_1;
   volatile unsigned int         Reserved_6[2];
   volatile U_STR_DET_VIDBLK0TOL0 STR_DET_VIDBLK0TOL0;
   volatile U_STR_DET_VIDBLK0TOL1 STR_DET_VIDBLK0TOL1;
   volatile U_STR_DET_VIDBLK1TOL0 STR_DET_VIDBLK1TOL0;
   volatile U_STR_DET_VIDBLK1TOL1 STR_DET_VIDBLK1TOL1;
   volatile U_STR_DET_VIDBLK2TOL0 STR_DET_VIDBLK2TOL0;
   volatile U_STR_DET_VIDBLK2TOL1 STR_DET_VIDBLK2TOL1;
   volatile U_STR_DET_VIDBLK3TOL0 STR_DET_VIDBLK3TOL0;
   volatile U_STR_DET_VIDBLK3TOL1 STR_DET_VIDBLK3TOL1;
   volatile U_STR_DET_VIDBLK4TOL0 STR_DET_VIDBLK4TOL0;
   volatile U_STR_DET_VIDBLK4TOL1 STR_DET_VIDBLK4TOL1;
   volatile U_STR_DET_VIDBLK5TOL0 STR_DET_VIDBLK5TOL0;
   volatile U_STR_DET_VIDBLK5TOL1 STR_DET_VIDBLK5TOL1;


} S_VPSSWB_REGS_TYPE;//


#endif // __C_UNION_DEFINE_H__
