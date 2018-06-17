//******************************************************************************
//  Copyright (C), 2007-2013, Hisilicon Technologies Co., Ltd.
//
//******************************************************************************
// File name     : c_union_define.h
// Version       : 2.0
// Author        : x57490
// Created       : 2013-11-25
// Last Modified : 
// Description   :  The C union definition file for the module VPSS
// Function List : 
// History       : 
// 1 Date        : 
// Author        : x57490
// Modification  : Create file
//******************************************************************************
#ifndef __VPSS_REG_H__
#define __VPSS_REG_H__

// Define the union U_VPSS_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_1            : 1   ; // [0] 
        unsigned int    vsd_en                : 1   ; // [1] 
        unsigned int    vhd1_en               : 1   ; // [2] 
        unsigned int    vhd0_en               : 1   ; // [3] 
        unsigned int    cl_en                 : 1   ; // [4] 
        unsigned int    cc_en                 : 1   ; // [5] 
        unsigned int    lbd_en                : 1   ; // [6] 
        unsigned int    dei_en                : 1   ; // [7] 
        unsigned int    str_det_en            : 1   ; // [8] 
        unsigned int    col_cor_en            : 1   ; // [9] 
        unsigned int    db_en                 : 1   ; // [10] 
        unsigned int    dr_en                 : 1   ; // [11] 
        unsigned int    vsd_mux               : 1   ; // [12] 
        unsigned int    vid_std               : 1   ; // [13] 
        unsigned int    vsd_lba_en            : 1   ; // [14] 
        unsigned int    vhd1_lba_en           : 1   ; // [15] 
        unsigned int    vhd0_lba_en           : 1   ; // [16] 
        unsigned int    Reserved_0            : 1   ; // [17] 
        unsigned int    nr_en                 : 1   ; // [18] 
        unsigned int    rfr_en                : 1   ; // [19] 
        unsigned int    rfr_lba_en            : 1   ; // [20] 
        unsigned int    rotate_angle          : 1   ; // [21] 
        unsigned int    rotate_en             : 1   ; // [22] 
        unsigned int    prot                  : 2   ; // [24..23] 
        unsigned int    ifmd_en               : 1   ; // [25] 
        unsigned int    iglb_en               : 1   ; // [26] 
        unsigned int    img_pro_mode          : 2   ; // [28..27] 
        unsigned int    bfield_first          : 1   ; // [29] 
        unsigned int    bfield_mode           : 1   ; // [30] 
        unsigned int    bfield                : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CTRL;

// Define the union U_VPSS_CTRL2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_2            : 4   ; // [3..0] 
        unsigned int    vsd_format            : 4   ; // [7..4] 
        unsigned int    vhd1_format           : 4   ; // [11..8] 
        unsigned int    vhd0_format           : 4   ; // [15..12] 
        unsigned int    in_format             : 5   ; // [20..16] 
        unsigned int    in_pix_bitw           : 1   ; // [21] 
        unsigned int    scd_k_pixy            : 6   ; // [27..22] 
        unsigned int    scd_en                : 1   ; // [28] 
        unsigned int    uv_invert             : 1   ; // [29] 
        unsigned int    pfmd_en               : 1   ; // [30] 
        unsigned int    pglb_en               : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CTRL2;

// Define the union U_VPSS_CTRL3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_5            : 1   ; // [0] 
        unsigned int    zme_vsd_en            : 1   ; // [1] 
        unsigned int    zme_vhd1_en           : 1   ; // [2] 
        unsigned int    zme_vhd0_en           : 1   ; // [3] 
        unsigned int    Reserved_4            : 2   ; // [5..4] 
        unsigned int    es_en                 : 1   ; // [6] 
        unsigned int    hsp_en                : 1   ; // [7] 
        unsigned int    pd_debug_en           : 1   ; // [8] 
        unsigned int    pd_mode               : 4   ; // [12..9] 
        unsigned int    sd_db_en              : 1   ; // [13] 
        unsigned int    sd_dr_en              : 1   ; // [14] 
        unsigned int    Reserved_3            : 17  ; // [31..15] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CTRL3;

// Define the union U_VPSS_CTRL4
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_pre_vfir_mode    : 2   ; // [1..0] 
        unsigned int    vhd0_pre_vfir_en      : 1   ; // [2] 
        unsigned int    vhd0_pre_hfir_mode    : 2   ; // [4..3] 
        unsigned int    vhd0_pre_hfir_en      : 1   ; // [5] 
        unsigned int    Reserved_8            : 2   ; // [7..6] 
        unsigned int    vhd1_pre_vfir_mode    : 2   ; // [9..8] 
        unsigned int    vhd1_pre_vfir_en      : 1   ; // [10] 
        unsigned int    vhd1_pre_hfir_mode    : 2   ; // [12..11] 
        unsigned int    vhd1_pre_hfir_en      : 1   ; // [13] 
        unsigned int    Reserved_7            : 2   ; // [15..14] 
        unsigned int    vsd_pre_vfir_mode     : 2   ; // [17..16] 
        unsigned int    vsd_pre_vfir_en       : 1   ; // [18] 
        unsigned int    vsd_pre_hfir_mode     : 2   ; // [20..19] 
        unsigned int    vsd_pre_hfir_en       : 1   ; // [21] 
        unsigned int    Reserved_6            : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CTRL4;

// Define the union U_VPSS_IMGSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    imgwidth              : 13  ; // [12..0] 
        unsigned int    Reserved_10           : 3   ; // [15..13] 
        unsigned int    imgheight             : 13  ; // [28..16] 
        unsigned int    Reserved_9            : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_IMGSIZE;

// Define the union U_VPSS_CUR_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cur_dcmp_en           : 1   ; // [0] 
        unsigned int    cur_dcmp_mode         : 1   ; // [1] 
        unsigned int    cury_head_tword       : 1   ; // [2] 
        unsigned int    curc_head_tword       : 1   ; // [3] 
        unsigned int    cur_tile_format       : 1   ; // [4] 
        unsigned int    cur_hor_offset        : 13  ; // [17..5] 
        unsigned int    cur_ver_offset        : 13  ; // [30..18] 
        unsigned int    cur_package422        : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CUR_CTRL;

// Define the union U_VPSS_CURY_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int cury_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CURY_HEAD_ADDR;
// Define the union U_VPSS_CURC_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int curc_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CURC_HEAD_ADDR;
// Define the union U_VPSS_CURYADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int cury_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CURYADDR;
// Define the union U_VPSS_CURCADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int curc_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CURCADDR;
// Define the union U_VPSS_CURSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cury_stride           : 16  ; // [15..0] 
        unsigned int    curc_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CURSTRIDE;

// Define the union U_VPSS_REF_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ref_dcmp_en           : 1   ; // [0] 
        unsigned int    ref_dcmp_mode         : 1   ; // [1] 
        unsigned int    refy_head_tword       : 1   ; // [2] 
        unsigned int    refc_head_tword       : 1   ; // [3] 
        unsigned int    ref_tile_format       : 1   ; // [4] 
        unsigned int    ref_hor_offset        : 13  ; // [17..5] 
        unsigned int    ref_ver_offset        : 13  ; // [30..18] 
        unsigned int    ref_package422        : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_REF_CTRL;

// Define the union U_VPSS_REFY_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int refy_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_REFY_HEAD_ADDR;
// Define the union U_VPSS_REFC_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int refc_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_REFC_HEAD_ADDR;
// Define the union U_VPSS_REFYADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int refy_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_REFYADDR;
// Define the union U_VPSS_REFCADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int refc_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_REFCADDR;
// Define the union U_VPSS_REFSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    refy_stride           : 16  ; // [15..0] 
        unsigned int    refc_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_REFSTRIDE;

// Define the union U_VPSS_NXT1_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt1_dcmp_en          : 1   ; // [0] 
        unsigned int    nxt1_dcmp_mode        : 1   ; // [1] 
        unsigned int    nxt1y_head_tword      : 1   ; // [2] 
        unsigned int    nxt1c_head_tword      : 1   ; // [3] 
        unsigned int    nxt1_tile_format      : 1   ; // [4] 
        unsigned int    nxt1_hor_offset       : 13  ; // [17..5] 
        unsigned int    nxt1_ver_offset       : 13  ; // [30..18] 
        unsigned int    Reserved_11           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT1_CTRL;

// Define the union U_VPSS_NXT1Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt1y_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT1Y_HEAD_ADDR;
// Define the union U_VPSS_NXT1C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt1c_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT1C_HEAD_ADDR;
// Define the union U_VPSS_NXT1YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt1y_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT1YADDR;
// Define the union U_VPSS_NXT1CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt1c_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT1CADDR;
// Define the union U_VPSS_NXT1STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt1y_stride          : 16  ; // [15..0] 
        unsigned int    nxt1c_stride          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT1STRIDE;

// Define the union U_VPSS_NXT2_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt2_dcmp_en          : 1   ; // [0] 
        unsigned int    nxt2_dcmp_mode        : 1   ; // [1] 
        unsigned int    nxt2y_head_tword      : 1   ; // [2] 
        unsigned int    nxt2c_head_tword      : 1   ; // [3] 
        unsigned int    nxt2_tile_format      : 1   ; // [4] 
        unsigned int    nxt2_hor_offset       : 13  ; // [17..5] 
        unsigned int    nxt2_ver_offset       : 13  ; // [30..18] 
        unsigned int    Reserved_12           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT2_CTRL;

// Define the union U_VPSS_NXT2Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt2y_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT2Y_HEAD_ADDR;
// Define the union U_VPSS_NXT2C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt2c_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT2C_HEAD_ADDR;
// Define the union U_VPSS_NXT2YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt2y_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT2YADDR;
// Define the union U_VPSS_NXT2CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt2c_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT2CADDR;
// Define the union U_VPSS_NXT2STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt2y_stride          : 16  ; // [15..0] 
        unsigned int    nxt2c_stride          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT2STRIDE;

// Define the union U_VPSS_NXT3_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt3_dcmp_en          : 1   ; // [0] 
        unsigned int    nxt3_dcmp_mode        : 1   ; // [1] 
        unsigned int    nxt3y_head_tword      : 1   ; // [2] 
        unsigned int    nxt3c_head_tword      : 1   ; // [3] 
        unsigned int    nxt3_tile_format      : 1   ; // [4] 
        unsigned int    nxt3_hor_offset       : 13  ; // [17..5] 
        unsigned int    nxt3_ver_offset       : 13  ; // [30..18] 
        unsigned int    Reserved_13           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT3_CTRL;

// Define the union U_VPSS_NXT3Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt3y_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT3Y_HEAD_ADDR;
// Define the union U_VPSS_NXT3C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt3c_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT3C_HEAD_ADDR;
// Define the union U_VPSS_NXT3YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt3y_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT3YADDR;
// Define the union U_VPSS_NXT3CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nxt3c_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NXT3CADDR;
// Define the union U_VPSS_NXT3STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    nxt3y_stride          : 16  ; // [15..0] 
        unsigned int    nxt3c_stride          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_NXT3STRIDE;

// Define the union U_VPSS_PR1_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pr1_dcmp_en           : 1   ; // [0] 
        unsigned int    pr1_dcmp_mode         : 1   ; // [1] 
        unsigned int    pr1y_head_tword       : 1   ; // [2] 
        unsigned int    pr1c_head_tword       : 1   ; // [3] 
        unsigned int    pr1_tile_format       : 1   ; // [4] 
        unsigned int    pr1_hor_offset        : 13  ; // [17..5] 
        unsigned int    pr1_ver_offset        : 13  ; // [30..18] 
        unsigned int    Reserved_14           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PR1_CTRL;

// Define the union U_VPSS_PR1Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr1y_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR1Y_HEAD_ADDR;
// Define the union U_VPSS_PR1C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr1c_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR1C_HEAD_ADDR;
// Define the union U_VPSS_PR1YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr1y_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR1YADDR;
// Define the union U_VPSS_PR1CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr1c_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR1CADDR;
// Define the union U_VPSS_PR1STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pr1y_stride           : 16  ; // [15..0] 
        unsigned int    pr1c_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PR1STRIDE;

// Define the union U_VPSS_PR2_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pr2_dcmp_en           : 1   ; // [0] 
        unsigned int    pr2_dcmp_mode         : 1   ; // [1] 
        unsigned int    pr2y_head_tword       : 1   ; // [2] 
        unsigned int    pr2c_head_tword       : 1   ; // [3] 
        unsigned int    pr2_tile_format       : 1   ; // [4] 
        unsigned int    pr2_hor_offset        : 13  ; // [17..5] 
        unsigned int    pr2_ver_offset        : 13  ; // [30..18] 
        unsigned int    Reserved_15           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PR2_CTRL;

// Define the union U_VPSS_PR2Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr2y_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR2Y_HEAD_ADDR;
// Define the union U_VPSS_PR2C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr2c_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR2C_HEAD_ADDR;
// Define the union U_VPSS_PR2YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr2y_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR2YADDR;
// Define the union U_VPSS_PR2CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pr2c_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PR2CADDR;
// Define the union U_VPSS_PR2STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pr2y_stride           : 16  ; // [15..0] 
        unsigned int    pr2c_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PR2STRIDE;

// Define the union U_VPSS_RFRCTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    rfr_cmp_en            : 1   ; // [0] 
        unsigned int    rfr_cmp_mode          : 1   ; // [1] 
        unsigned int    rfry_head_tword       : 1   ; // [2] 
        unsigned int    rfrc_head_tword       : 1   ; // [3] 
        unsigned int    Reserved_17           : 3   ; // [6..4] 
        unsigned int    rfr_dither_en         : 1   ; // [7] 
        unsigned int    Reserved_16           : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRCTRL;

// Define the union U_VPSS_RFRY_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int rfry_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_RFRY_HEAD_ADDR;
// Define the union U_VPSS_RFRC_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int rfrc_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_RFRC_HEAD_ADDR;
// Define the union U_VPSS_RFRYADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int rfry_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_RFRYADDR;
// Define the union U_VPSS_RFRCADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int rfrc_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_RFRCADDR;
// Define the union U_VPSS_RFRSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    rfry_stride           : 16  ; // [15..0] 
        unsigned int    rfrc_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRSTRIDE;

// Define the union U_VPSS_VHD0CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_cmp_en           : 1   ; // [0] 
        unsigned int    vhd0_cmp_mode         : 1   ; // [1] 
        unsigned int    vhd0y_head_tword      : 1   ; // [2] 
        unsigned int    vhd0c_head_tword      : 1   ; // [3] 
        unsigned int    vhd0_mirror           : 1   ; // [4] 
        unsigned int    vhd0_flip             : 1   ; // [5] 
        unsigned int    vhd0_pix_bitw         : 1   ; // [6] 
        unsigned int    vhd0_dither_en        : 1   ; // [7] 
        unsigned int    vhd0_uv_invert        : 1   ; // [8] 
        unsigned int    Reserved_18           : 23  ; // [31..9] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0CTRL;

// Define the union U_VPSS_VHD0SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_width            : 13  ; // [12..0] 
        unsigned int    Reserved_20           : 3   ; // [15..13] 
        unsigned int    vhd0_height           : 13  ; // [28..16] 
        unsigned int    Reserved_19           : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0SIZE;

// Define the union U_VPSS_VHD0Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0y_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0Y_HEAD_ADDR;
// Define the union U_VPSS_VHD0C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0c_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0C_HEAD_ADDR;
// Define the union U_VPSS_VHD0YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0y_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0YADDR;
// Define the union U_VPSS_VHD0CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0c_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0CADDR;
// Define the union U_VPSS_VHD0STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0y_stride          : 16  ; // [15..0] 
        unsigned int    vhd0c_stride          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0STRIDE;

// Define the union U_VPSS_VHD1CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd1_cmp_en           : 1   ; // [0] 
        unsigned int    vhd1_cmp_mode         : 1   ; // [1] 
        unsigned int    vhd1y_head_tword      : 1   ; // [2] 
        unsigned int    vhd1c_head_tword      : 1   ; // [3] 
        unsigned int    vhd1_mirror           : 1   ; // [4] 
        unsigned int    vhd1_flip             : 1   ; // [5] 
        unsigned int    vhd1_pix_bitw         : 1   ; // [6] 
        unsigned int    vhd1_dither_en        : 1   ; // [7] 
        unsigned int    vhd1_uv_invert        : 1   ; // [8] 
        unsigned int    Reserved_21           : 23  ; // [31..9] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1CTRL;

// Define the union U_VPSS_VHD1SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd1_width            : 13  ; // [12..0] 
        unsigned int    Reserved_23           : 3   ; // [15..13] 
        unsigned int    vhd1_height           : 13  ; // [28..16] 
        unsigned int    Reserved_22           : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1SIZE;

// Define the union U_VPSS_VHD1Y_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1y_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1Y_HEAD_ADDR;
// Define the union U_VPSS_VHD1C_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1c_head_addr         : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1C_HEAD_ADDR;
// Define the union U_VPSS_VHD1YADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1y_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1YADDR;
// Define the union U_VPSS_VHD1CADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1c_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1CADDR;
// Define the union U_VPSS_VHD1STRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd1y_stride          : 16  ; // [15..0] 
        unsigned int    vhd1c_stride          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1STRIDE;

// Define the union U_VPSS_VSDCTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsd_cmp_en            : 1   ; // [0] 
        unsigned int    vsd_cmp_mode          : 1   ; // [1] 
        unsigned int    vsdy_head_tword       : 1   ; // [2] 
        unsigned int    vsdc_head_tword       : 1   ; // [3] 
        unsigned int    vsd_mirror            : 1   ; // [4] 
        unsigned int    vsd_flip              : 1   ; // [5] 
        unsigned int    vsd_pix_bitw          : 1   ; // [6] 
        unsigned int    vsd_dither_en         : 1   ; // [7] 
        unsigned int    vsd_uv_invert         : 1   ; // [8] 
        unsigned int    Reserved_24           : 23  ; // [31..9] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDCTRL;

// Define the union U_VPSS_VSDSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsd_width             : 13  ; // [12..0] 
        unsigned int    Reserved_26           : 3   ; // [15..13] 
        unsigned int    vsd_height            : 13  ; // [28..16] 
        unsigned int    Reserved_25           : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDSIZE;

// Define the union U_VPSS_VSDY_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsdy_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSDY_HEAD_ADDR;
// Define the union U_VPSS_VSDC_HEAD_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsdc_head_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSDC_HEAD_ADDR;
// Define the union U_VPSS_VSDYADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsdy_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSDYADDR;
// Define the union U_VPSS_VSDCADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsdc_addr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSDCADDR;
// Define the union U_VPSS_VSDSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsdy_stride           : 16  ; // [15..0] 
        unsigned int    vsdc_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDSTRIDE;

// Define the union U_VPSS_YCNTRADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ycnt_raddr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_YCNTRADDR;
// Define the union U_VPSS_CCNTRADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ccnt_raddr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CCNTRADDR;
// Define the union U_VPSS_YCNTWADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ycnt_waddr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_YCNTWADDR;
// Define the union U_VPSS_CCNTWADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int ccnt_waddr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CCNTWADDR;
// Define the union U_VPSS_CNTSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ycnt_stride           : 16  ; // [15..0] 
        unsigned int    ccnt_stride           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CNTSTRIDE;

// Define the union U_VPSS_STRADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int st_raddr                : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_STRADDR;
// Define the union U_VPSS_STWADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int st_waddr                : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_STWADDR;
// Define the union U_VPSS_STSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    st_stride             : 16  ; // [15..0] 
        unsigned int    Reserved_27           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_STSTRIDE;

// Define the union U_VPSS_MAD_RADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int mad_raddr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_MAD_RADDR;
// Define the union U_VPSS_MAD_WADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int mad_waddr               : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_MAD_WADDR;
// Define the union U_VPSS_SNR_MAD_RADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int snr_mad_raddr           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_SNR_MAD_RADDR;
// Define the union U_VPSS_MADSTRIDE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    mad_stride            : 16  ; // [15..0] 
        unsigned int    Reserved_28           : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_MADSTRIDE;

// Define the union U_VPSS_STT_W_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int stt_w_addr              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_STT_W_ADDR;
// Define the union U_VPSS_TUNL_CTRL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_tunl_finish_line  : 12  ; // [11..0] 
        unsigned int    Reserved_29           : 4   ; // [15..12] 
        unsigned int    vhd1_tunl_finish_line  : 12  ; // [27..16] 
        unsigned int    vhd0_tunl_en          : 1   ; // [28] 
        unsigned int    vhd1_tunl_en          : 1   ; // [29] 
        unsigned int    vsd_tunl_en           : 1   ; // [30] 
        unsigned int    cur_tunl_en           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TUNL_CTRL0;

// Define the union U_VPSS_TUNL_CTRL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsd_tunl_finish_line  : 12  ; // [11..0] 
        unsigned int    Reserved_31           : 4   ; // [15..12] 
        unsigned int    cur_tunl_rd_interval  : 8   ; // [23..16] 
        unsigned int    vhd0_tunl_mode        : 2   ; // [25..24] 
        unsigned int    vhd1_tunl_mode        : 2   ; // [27..26] 
        unsigned int    vsd_tunl_mode         : 2   ; // [29..28] 
        unsigned int    Reserved_30           : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TUNL_CTRL1;

// Define the union U_VPSS_VHD0_TUNL_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0_tunl_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0_TUNL_ADDR;
// Define the union U_VPSS_VHD1_TUNL_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1_tunl_addr          : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1_TUNL_ADDR;
// Define the union U_VPSS_VSD_TUNL_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsd_tunl_addr           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSD_TUNL_ADDR;
// Define the union U_VPSS_CUR_TUNL_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int cur_tunl_addr           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_CUR_TUNL_ADDR;
// Define the union U_VPSS_DR_CFG0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_34           : 16  ; // [15..0] 
        unsigned int    drthrmaxsimilarpixdiff  : 5   ; // [20..16] 
        unsigned int    Reserved_33           : 3   ; // [23..21] 
        unsigned int    drthrflat3x3zone      : 5   ; // [28..24] 
        unsigned int    Reserved_32           : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DR_CFG0;

// Define the union U_VPSS_DR_CFG1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dralphascale          : 5   ; // [4..0] 
        unsigned int    Reserved_36           : 11  ; // [15..5] 
        unsigned int    drbetascale           : 5   ; // [20..16] 
        unsigned int    Reserved_35           : 11  ; // [31..21] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DR_CFG1;

// Define the union U_VPSS_DB_CFG0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dbenhor               : 1   ; // [0] 
        unsigned int    dbenvert              : 1   ; // [1] 
        unsigned int    dbuseweakflt          : 1   ; // [2] 
        unsigned int    Reserved_39           : 1   ; // [3] 
        unsigned int    dbtexten              : 1   ; // [4] 
        unsigned int    Reserved_38           : 3   ; // [7..5] 
        unsigned int    picestqp              : 8   ; // [15..8] 
        unsigned int    thrdbedgethr          : 8   ; // [23..16] 
        unsigned int    dbthrmaxgrad          : 5   ; // [28..24] 
        unsigned int    Reserved_37           : 3   ; // [31..29] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CFG0;

// Define the union U_VPSS_DB_CFG1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dbthrleastblkdiffhor  : 8   ; // [7..0] 
        unsigned int    dbthrmaxdiffhor       : 8   ; // [15..8] 
        unsigned int    dbthrleastblkdiffvert  : 8   ; // [23..16] 
        unsigned int    dbthrmaxdiffvert      : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CFG1;

// Define the union U_VPSS_DB_CFG2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    detailimgqpthr        : 8   ; // [7..0] 
        unsigned int    thrdblargesmooth      : 8   ; // [15..8] 
        unsigned int    dbalphascale          : 8   ; // [23..16] 
        unsigned int    dbbetascale           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CFG2;

// Define the union U_VPSS_INCROP_POS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    in_crop_x             : 12  ; // [11..0] 
        unsigned int    Reserved_41           : 4   ; // [15..12] 
        unsigned int    in_crop_y             : 12  ; // [27..16] 
        unsigned int    Reserved_40           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_INCROP_POS;

// Define the union U_VPSS_INCROP_SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    in_crop_width         : 12  ; // [11..0] 
        unsigned int    Reserved_43           : 4   ; // [15..12] 
        unsigned int    in_crop_height        : 12  ; // [27..16] 
        unsigned int    Reserved_42           : 3   ; // [30..28] 
        unsigned int    in_crop_en            : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_INCROP_SIZE;

// Define the union U_VPSS_RFRLBA_DSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    disp_width            : 12  ; // [11..0] 
        unsigned int    disp_height           : 12  ; // [23..12] 
        unsigned int    Reserved_45           : 6   ; // [29..24] 
        unsigned int    mute_en               : 1   ; // [30] 
        unsigned int    Reserved_44           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRLBA_DSIZE;

// Define the union U_VPSS_RFRLBA_VFPOS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_xfpos           : 12  ; // [11..0] 
        unsigned int    video_yfpos           : 12  ; // [23..12] 
        unsigned int    Reserved_46           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRLBA_VFPOS;

// Define the union U_VPSS_RFRLBA_VSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_width           : 12  ; // [11..0] 
        unsigned int    video_height          : 12  ; // [23..12] 
        unsigned int    Reserved_47           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRLBA_VSIZE;

// Define the union U_VPSS_RFRLBA_BK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vbk_cr                : 10  ; // [9..0] 
        unsigned int    vbk_cb                : 10  ; // [19..10] 
        unsigned int    vbk_y                 : 10  ; // [29..20] 
        unsigned int    Reserved_48           : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RFRLBA_BK;

// Define the union U_VPSS_VHD0CROP_POS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_crop_x           : 12  ; // [11..0] 
        unsigned int    Reserved_50           : 4   ; // [15..12] 
        unsigned int    vhd0_crop_y           : 12  ; // [27..16] 
        unsigned int    Reserved_49           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0CROP_POS;

// Define the union U_VPSS_VHD0CROP_SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd0_crop_width       : 12  ; // [11..0] 
        unsigned int    Reserved_52           : 4   ; // [15..12] 
        unsigned int    vhd0_crop_height      : 12  ; // [27..16] 
        unsigned int    Reserved_51           : 3   ; // [30..28] 
        unsigned int    vhd0_crop_en          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0CROP_SIZE;

// Define the union U_VPSS_VHD1CROP_POS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd1_crop_x           : 12  ; // [11..0] 
        unsigned int    Reserved_54           : 4   ; // [15..12] 
        unsigned int    vhd1_crop_y           : 12  ; // [27..16] 
        unsigned int    Reserved_53           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1CROP_POS;

// Define the union U_VPSS_VHD1CROP_SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vhd1_crop_width       : 12  ; // [11..0] 
        unsigned int    Reserved_56           : 4   ; // [15..12] 
        unsigned int    vhd1_crop_height      : 12  ; // [27..16] 
        unsigned int    Reserved_55           : 3   ; // [30..28] 
        unsigned int    vhd1_crop_en          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1CROP_SIZE;

// Define the union U_VPSS_VSDCROP_POS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsd_crop_x            : 12  ; // [11..0] 
        unsigned int    Reserved_58           : 4   ; // [15..12] 
        unsigned int    vsd_crop_y            : 12  ; // [27..16] 
        unsigned int    Reserved_57           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDCROP_POS;

// Define the union U_VPSS_VSDCROP_SIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vsd_crop_width        : 12  ; // [11..0] 
        unsigned int    Reserved_60           : 4   ; // [15..12] 
        unsigned int    vsd_crop_height       : 12  ; // [27..16] 
        unsigned int    Reserved_59           : 3   ; // [30..28] 
        unsigned int    vsd_crop_en           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDCROP_SIZE;

// Define the union U_VPSS_VHD0LBA_DSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    disp_width            : 12  ; // [11..0] 
        unsigned int    disp_height           : 12  ; // [23..12] 
        unsigned int    Reserved_62           : 6   ; // [29..24] 
        unsigned int    mute_en               : 1   ; // [30] 
        unsigned int    Reserved_61           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0LBA_DSIZE;

// Define the union U_VPSS_VHD0LBA_VFPOS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_xfpos           : 12  ; // [11..0] 
        unsigned int    video_yfpos           : 12  ; // [23..12] 
        unsigned int    Reserved_64           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0LBA_VFPOS;

// Define the union U_VPSS_VHD0LBA_VSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_width           : 12  ; // [11..0] 
        unsigned int    video_height          : 12  ; // [23..12] 
        unsigned int    Reserved_65           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0LBA_VSIZE;

// Define the union U_VPSS_VHD0LBA_BK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vbk_cr                : 10  ; // [9..0] 
        unsigned int    vbk_cb                : 10  ; // [19..10] 
        unsigned int    vbk_y                 : 10  ; // [29..20] 
        unsigned int    Reserved_66           : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0LBA_BK;

// Define the union U_VPSS_VHD1LBA_DSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    disp_width            : 12  ; // [11..0] 
        unsigned int    disp_height           : 12  ; // [23..12] 
        unsigned int    Reserved_68           : 6   ; // [29..24] 
        unsigned int    mute_en               : 1   ; // [30] 
        unsigned int    Reserved_67           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1LBA_DSIZE;

// Define the union U_VPSS_VHD1LBA_VFPOS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_xfpos           : 12  ; // [11..0] 
        unsigned int    video_yfpos           : 12  ; // [23..12] 
        unsigned int    Reserved_69           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1LBA_VFPOS;

// Define the union U_VPSS_VHD1LBA_VSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_width           : 12  ; // [11..0] 
        unsigned int    video_height          : 12  ; // [23..12] 
        unsigned int    Reserved_70           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1LBA_VSIZE;

// Define the union U_VPSS_VHD1LBA_BK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vbk_cr                : 10  ; // [9..0] 
        unsigned int    vbk_cb                : 10  ; // [19..10] 
        unsigned int    vbk_y                 : 10  ; // [29..20] 
        unsigned int    Reserved_71           : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1LBA_BK;

// Define the union U_VPSS_VSDLBA_DSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    disp_width            : 12  ; // [11..0] 
        unsigned int    disp_height           : 12  ; // [23..12] 
        unsigned int    Reserved_73           : 6   ; // [29..24] 
        unsigned int    mute_en               : 1   ; // [30] 
        unsigned int    Reserved_72           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDLBA_DSIZE;

// Define the union U_VPSS_VSDLBA_VFPOS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_xfpos           : 12  ; // [11..0] 
        unsigned int    video_yfpos           : 12  ; // [23..12] 
        unsigned int    Reserved_74           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDLBA_VFPOS;

// Define the union U_VPSS_VSDLBA_VSIZE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    video_width           : 12  ; // [11..0] 
        unsigned int    video_height          : 12  ; // [23..12] 
        unsigned int    Reserved_75           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDLBA_VSIZE;

// Define the union U_VPSS_VSDLBA_BK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vbk_cr                : 10  ; // [9..0] 
        unsigned int    vbk_cb                : 10  ; // [19..10] 
        unsigned int    vbk_y                 : 10  ; // [29..20] 
        unsigned int    Reserved_76           : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSDLBA_BK;

// Define the union U_VPSS_DNR_INFO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    thrintlcolcnt         : 4   ; // [3..0] 
        unsigned int    thrintlcnt            : 4   ; // [7..4] 
        unsigned int    thdmaxgrad            : 8   ; // [15..8] 
        unsigned int    thdcntrst8            : 8   ; // [23..16] 
        unsigned int    Reserved_77           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DNR_INFO;

// Define the union U_VPSS_NODEID
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int nodeid                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_NODEID;
// Define the union U_VPSS_AXIID
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    axi_wid               : 1   ; // [0] 
        unsigned int    axi_rid               : 1   ; // [1] 
        unsigned int    Reserved_78           : 14  ; // [15..2] 
        unsigned int    awid_cfg1             : 4   ; // [19..16] 
        unsigned int    awid_cfg0             : 4   ; // [23..20] 
        unsigned int    arid_cfg1             : 4   ; // [27..24] 
        unsigned int    arid_cfg0             : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_AXIID;

// Define the union U_VPSS_INTMASK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    eof_mask              : 1   ; // [0] 
        unsigned int    timeout_mask          : 1   ; // [1] 
        unsigned int    bus_err_mask          : 1   ; // [2] 
        unsigned int    eof_end_mask          : 1   ; // [3] 
        unsigned int    vhd0_tunl_mask        : 1   ; // [4] 
        unsigned int    vhd1_tunl_mask        : 1   ; // [5] 
        unsigned int    vsd_tunl_mask         : 1   ; // [6] 
        unsigned int    dcmp_err_mask         : 1   ; // [7] 
        unsigned int    Reserved_79           : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_INTMASK;

// Define the union U_VPSS_VHD0_ZME_LHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0_scl_lh             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0_ZME_LHADDR;
// Define the union U_VPSS_VHD0_ZME_LVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0_scl_lv             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0_ZME_LVADDR;
// Define the union U_VPSS_VHD0_ZME_CHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0_scl_ch             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0_ZME_CHADDR;
// Define the union U_VPSS_VHD0_ZME_CVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd0_scl_cv             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD0_ZME_CVADDR;
// Define the union U_VPSS_VHD1_ZME_LHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1_scl_lh             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1_ZME_LHADDR;
// Define the union U_VPSS_VHD1_ZME_LVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1_scl_lv             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1_ZME_LVADDR;
// Define the union U_VPSS_VHD1_ZME_CHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1_scl_ch             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1_ZME_CHADDR;
// Define the union U_VPSS_VHD1_ZME_CVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vhd1_scl_cv             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VHD1_ZME_CVADDR;
// Define the union U_VPSS_VSD_ZME_LHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsd_scl_lh              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSD_ZME_LHADDR;
// Define the union U_VPSS_VSD_ZME_LVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsd_scl_lv              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSD_ZME_LVADDR;
// Define the union U_VPSS_VSD_ZME_CHADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsd_scl_ch              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSD_ZME_CHADDR;
// Define the union U_VPSS_VSD_ZME_CVADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vsd_scl_cv              : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VSD_ZME_CVADDR;
// Define the union U_VPSS_VC1_STR_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int vc1_str_cfg_addr        : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VC1_STR_ADDR;
// Define the union U_VPSS_ZME_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int zme_cfg_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_ZME_ADDR;
// Define the union U_VPSS_HSP_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int hsp_cfg_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_HSP_ADDR;
// Define the union U_VPSS_SNR_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int snr_cfg_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_SNR_ADDR;
// Define the union U_VPSS_DB_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int db_cfg_addr             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DB_ADDR;
// Define the union U_VPSS_DR_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int dr_cfg_addr             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DR_ADDR;
// Define the union U_VPSS_DEI_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int dei_cfg_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEI_ADDR;
// Define the union U_VPSS_TNR_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int tnr_cfg_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_TNR_ADDR;
// Define the union U_VPSS_TNR_CLUT_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int tnr_clut_addr           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_TNR_CLUT_ADDR;
// Define the union U_VPSS_ES_ADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int es_cfg_addr             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_ES_ADDR;
// Define the union U_VPSS_CSC_IDC
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscidc0               : 11  ; // [10..0] 
        unsigned int    cscidc1               : 11  ; // [21..11] 
        unsigned int    csc_en                : 1   ; // [22] 
        unsigned int    Reserved_83           : 9   ; // [31..23] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_IDC;

// Define the union U_VPSS_CSC_ODC
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscodc0               : 11  ; // [10..0] 
        unsigned int    cscodc1               : 11  ; // [21..11] 
        unsigned int    csc_sign_mode         : 1   ; // [22] 
        unsigned int    Reserved_85           : 9   ; // [31..23] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_ODC;

// Define the union U_VPSS_CSC_IODC
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscidc2               : 11  ; // [10..0] 
        unsigned int    cscodc2               : 11  ; // [21..11] 
        unsigned int    Reserved_86           : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_IODC;

// Define the union U_VPSS_CSC_P0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscp00                : 15  ; // [14..0] 
        unsigned int    Reserved_88           : 1   ; // [15] 
        unsigned int    cscp01                : 15  ; // [30..16] 
        unsigned int    Reserved_87           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_P0;

// Define the union U_VPSS_CSC_P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscp02                : 15  ; // [14..0] 
        unsigned int    Reserved_90           : 1   ; // [15] 
        unsigned int    cscp10                : 15  ; // [30..16] 
        unsigned int    Reserved_89           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_P1;

// Define the union U_VPSS_CSC_P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscp11                : 15  ; // [14..0] 
        unsigned int    Reserved_92           : 1   ; // [15] 
        unsigned int    cscp12                : 15  ; // [30..16] 
        unsigned int    Reserved_91           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_P2;

// Define the union U_VPSS_CSC_P3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscp20                : 15  ; // [14..0] 
        unsigned int    Reserved_94           : 1   ; // [15] 
        unsigned int    cscp21                : 15  ; // [30..16] 
        unsigned int    Reserved_93           : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_P3;

// Define the union U_VPSS_CSC_P4
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cscp22                : 15  ; // [14..0] 
        unsigned int    Reserved_95           : 17  ; // [31..15] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CSC_P4;

// Define the union U_VPSS_CL_THD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cl_large_thd          : 8   ; // [7..0] 
        unsigned int    cl_small_thd          : 8   ; // [15..8] 
        unsigned int    cl_com_thd            : 8   ; // [23..16] 
        unsigned int    cl_shift              : 3   ; // [26..24] 
        unsigned int    Reserved_96           : 3   ; // [29..27] 
        unsigned int    cccl_mk_mode          : 1   ; // [30] 
        unsigned int    cccl_mk_en            : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CL_THD;

// Define the union U_VPSS_CL_STEP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cl_inc_step           : 4   ; // [3..0] 
        unsigned int    cl_dec_step           : 4   ; // [7..4] 
        unsigned int    Reserved_97           : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CL_STEP;

// Define the union U_VPSS_CL_LUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cl_lut_0              : 4   ; // [3..0] 
        unsigned int    cl_lut_1              : 4   ; // [7..4] 
        unsigned int    cl_lut_2              : 4   ; // [11..8] 
        unsigned int    cl_lut_3              : 4   ; // [15..12] 
        unsigned int    cl_lut_4              : 4   ; // [19..16] 
        unsigned int    cl_lut_5              : 4   ; // [23..20] 
        unsigned int    cl_lut_6              : 4   ; // [27..24] 
        unsigned int    cl_lut_7              : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CL_LUT0;

// Define the union U_VPSS_CL_LUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cl_lut_8              : 4   ; // [3..0] 
        unsigned int    cl_lut_9              : 4   ; // [7..4] 
        unsigned int    cl_lut_10             : 4   ; // [11..8] 
        unsigned int    cl_lut_11             : 4   ; // [15..12] 
        unsigned int    cl_lut_12             : 4   ; // [19..16] 
        unsigned int    cl_lut_13             : 4   ; // [23..20] 
        unsigned int    cl_lut_14             : 4   ; // [27..24] 
        unsigned int    cl_lut_15             : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CL_LUT1;

// Define the union U_VPSS_CC_THD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cc_large_thd          : 8   ; // [7..0] 
        unsigned int    cc_small_thd          : 8   ; // [15..8] 
        unsigned int    cc_com_thd            : 8   ; // [23..16] 
        unsigned int    cc_shift              : 3   ; // [26..24] 
        unsigned int    Reserved_98           : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CC_THD;

// Define the union U_VPSS_CC_STEP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cc_inc_step           : 4   ; // [3..0] 
        unsigned int    cc_dec_step           : 4   ; // [7..4] 
        unsigned int    Reserved_99           : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CC_STEP;

// Define the union U_VPSS_CC_LUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cc_lut_0              : 4   ; // [3..0] 
        unsigned int    cc_lut_1              : 4   ; // [7..4] 
        unsigned int    cc_lut_2              : 4   ; // [11..8] 
        unsigned int    cc_lut_3              : 4   ; // [15..12] 
        unsigned int    cc_lut_4              : 4   ; // [19..16] 
        unsigned int    cc_lut_5              : 4   ; // [23..20] 
        unsigned int    cc_lut_6              : 4   ; // [27..24] 
        unsigned int    cc_lut_7              : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CC_LUT0;

// Define the union U_VPSS_CC_LUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cc_lut_8              : 4   ; // [3..0] 
        unsigned int    cc_lut_9              : 4   ; // [7..4] 
        unsigned int    cc_lut_10             : 4   ; // [11..8] 
        unsigned int    cc_lut_11             : 4   ; // [15..12] 
        unsigned int    cc_lut_12             : 4   ; // [19..16] 
        unsigned int    cc_lut_13             : 4   ; // [23..20] 
        unsigned int    cc_lut_14             : 4   ; // [27..24] 
        unsigned int    cc_lut_15             : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CC_LUT1;

// Define the union U_VPSS_LBD_BLACK_THR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lbd_black_t_thr       : 8   ; // [7..0] 
        unsigned int    lbd_black_b_thr       : 8   ; // [15..8] 
        unsigned int    lbd_black_l_thr       : 8   ; // [23..16] 
        unsigned int    lbd_black_r_thr       : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_LBD_BLACK_THR;

// Define the union U_VPSS_LBD_BLACK_CFG1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lbd_top_max           : 12  ; // [11..0] 
        unsigned int    Reserved_101          : 4   ; // [15..12] 
        unsigned int    lbd_bot_min           : 12  ; // [27..16] 
        unsigned int    Reserved_100          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_LBD_BLACK_CFG1;

// Define the union U_VPSS_LBD_BLACK_CFG2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lbd_left_max          : 12  ; // [11..0] 
        unsigned int    Reserved_103          : 4   ; // [15..12] 
        unsigned int    lbd_right_min         : 12  ; // [27..16] 
        unsigned int    Reserved_102          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_LBD_BLACK_CFG2;

// Define the union U_VPSS_CCO_LUT_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut0              : 6   ; // [5..0] 
        unsigned int    cco_lut1              : 6   ; // [11..6] 
        unsigned int    cco_lut2              : 6   ; // [17..12] 
        unsigned int    cco_lut3              : 6   ; // [23..18] 
        unsigned int    cco_lut4              : 6   ; // [29..24] 
        unsigned int    Reserved_104          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_0;

// Define the union U_VPSS_CCO_LUT_5
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut5              : 6   ; // [5..0] 
        unsigned int    cco_lut6              : 6   ; // [11..6] 
        unsigned int    cco_lut7              : 6   ; // [17..12] 
        unsigned int    cco_lut8              : 6   ; // [23..18] 
        unsigned int    cco_lut9              : 6   ; // [29..24] 
        unsigned int    Reserved_106          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_5;

// Define the union U_VPSS_CCO_LUT_10
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut10             : 6   ; // [5..0] 
        unsigned int    cco_lut11             : 6   ; // [11..6] 
        unsigned int    cco_lut12             : 6   ; // [17..12] 
        unsigned int    cco_lut13             : 6   ; // [23..18] 
        unsigned int    cco_lut14             : 6   ; // [29..24] 
        unsigned int    Reserved_107          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_10;

// Define the union U_VPSS_CCO_LUT_15
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut15             : 6   ; // [5..0] 
        unsigned int    cco_lut16             : 6   ; // [11..6] 
        unsigned int    cco_lut17             : 6   ; // [17..12] 
        unsigned int    cco_lut18             : 6   ; // [23..18] 
        unsigned int    cco_lut19             : 6   ; // [29..24] 
        unsigned int    Reserved_108          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_15;

// Define the union U_VPSS_CCO_LUT_20
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut20             : 6   ; // [5..0] 
        unsigned int    cco_lut21             : 6   ; // [11..6] 
        unsigned int    cco_lut22             : 6   ; // [17..12] 
        unsigned int    cco_lut23             : 6   ; // [23..18] 
        unsigned int    cco_lut24             : 6   ; // [29..24] 
        unsigned int    Reserved_109          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_20;

// Define the union U_VPSS_CCO_LUT_25
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut25             : 6   ; // [5..0] 
        unsigned int    cco_lut26             : 6   ; // [11..6] 
        unsigned int    cco_lut27             : 6   ; // [17..12] 
        unsigned int    cco_lut28             : 6   ; // [23..18] 
        unsigned int    cco_lut29             : 6   ; // [29..24] 
        unsigned int    Reserved_110          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_25;

// Define the union U_VPSS_CCO_LUT_30
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cco_lut30             : 6   ; // [5..0] 
        unsigned int    cco_lut31             : 6   ; // [11..6] 
        unsigned int    k_delta               : 6   ; // [17..12] 
        unsigned int    Reserved_111          : 12  ; // [29..18] 
        unsigned int    cco_mk_mode           : 1   ; // [30] 
        unsigned int    cco_mk_en             : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_CCO_LUT_30;

// Define the union U_VPSS_PNEXT
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int p_next                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PNEXT;
// Define the union U_VPSS_START
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    start                 : 1   ; // [0] 
        unsigned int    Reserved_113          : 31  ; // [31..1] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_START;

// Define the union U_VPSS_INTSTATE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    eof_state             : 1   ; // [0] 
        unsigned int    timeout_state         : 1   ; // [1] 
        unsigned int    bus_err               : 1   ; // [2] 
        unsigned int    eof_end_state         : 1   ; // [3] 
        unsigned int    vhd0_tunl_state       : 1   ; // [4] 
        unsigned int    vhd1_tunl_state       : 1   ; // [5] 
        unsigned int    vsd_tunl_state        : 1   ; // [6] 
        unsigned int    dcmp_err              : 1   ; // [7] 
        unsigned int    Reserved_114          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_INTSTATE;

// Define the union U_VPSS_INTCLR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    eof_clr               : 1   ; // [0] 
        unsigned int    timeout_clr           : 1   ; // [1] 
        unsigned int    bus_err_clr           : 1   ; // [2] 
        unsigned int    eof_end_clr           : 1   ; // [3] 
        unsigned int    vhd0_tunl_clr         : 1   ; // [4] 
        unsigned int    vhd1_tunl_clr         : 1   ; // [5] 
        unsigned int    vsd_tunl_clr          : 1   ; // [6] 
        unsigned int    dcmp_err_clr          : 1   ; // [7] 
        unsigned int    Reserved_115          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_INTCLR;

// Define the union U_VPSS_RAWINT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    raw_eof               : 1   ; // [0] 
        unsigned int    raw_timeout           : 1   ; // [1] 
        unsigned int    raw_bus_err           : 1   ; // [2] 
        unsigned int    raw_eof_end           : 1   ; // [3] 
        unsigned int    raw_vhd0_tunl_state   : 1   ; // [4] 
        unsigned int    raw_vhd1_tunl_state   : 1   ; // [5] 
        unsigned int    raw_vsd_tunl_state    : 1   ; // [6] 
        unsigned int    raw_dcmp_err          : 1   ; // [7] 
        unsigned int    Reserved_116          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_RAWINT;

// Define the union U_VPSS_PFCNT
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int pfcnt                   : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_PFCNT;
// Define the union U_VPSS_MISCELLANEOUS
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    routstanding          : 4   ; // [3..0] 
        unsigned int    woutstanding          : 4   ; // [7..4] 
        unsigned int    init_timer            : 16  ; // [23..8] 
        unsigned int    ck_gt_en              : 1   ; // [24] 
        unsigned int    ck_gt_en_calc         : 1   ; // [25] 
        unsigned int    Reserved_117          : 6   ; // [31..26] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_MISCELLANEOUS;

// Define the union U_VPSS_MACCFG
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int mac_ch_prio             : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_MACCFG;
// Define the union U_VPSS_TIMEOUT
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int timeout                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_TIMEOUT;
// Define the union U_VPSS_EOFCNT
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int eof_cnt                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_EOFCNT;
// Define the union U_VPSS_VERSION
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int version                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_VERSION;
// Define the union U_VPSS_DIECTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_121          : 8   ; // [7..0] 
        unsigned int    edge_smooth_ratio     : 8   ; // [15..8] 
        unsigned int    stinfo_stop           : 1   ; // [16] 
        unsigned int    die_rst               : 1   ; // [17] 
        unsigned int    dir_mch_c             : 1   ; // [18] 
        unsigned int    dir_mch_l             : 1   ; // [19] 
        unsigned int    edge_smooth_en        : 1   ; // [20] 
        unsigned int    Reserved_120          : 3   ; // [23..21] 
        unsigned int    die_chmmode           : 2   ; // [25..24] 
        unsigned int    die_lmmode            : 2   ; // [27..26] 
        unsigned int    die_out_sel_c         : 1   ; // [28] 
        unsigned int    die_out_sel_l         : 1   ; // [29] 
        unsigned int    Reserved_119          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIECTRL;

// Define the union U_VPSS_DIELMA2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    recmode_frmfld_blend_mode  : 1   ; // [0] 
        unsigned int    frame_motion_smooth_en  : 1   ; // [1] 
        unsigned int    luma_scesdf_max       : 1   ; // [2] 
        unsigned int    Reserved_124          : 1   ; // [3] 
        unsigned int    motion_iir_en         : 1   ; // [4] 
        unsigned int    luma_mf_max           : 1   ; // [5] 
        unsigned int    chroma_mf_max         : 1   ; // [6] 
        unsigned int    rec_mode_en           : 1   ; // [7] 
        unsigned int    Reserved_123          : 16  ; // [23..8] 
        unsigned int    chroma_mf_offset      : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIELMA2;

// Define the union U_VPSS_DIEINTEN
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_126          : 8   ; // [7..0] 
        unsigned int    dir_inten_ver         : 4   ; // [11..8] 
        unsigned int    Reserved_125          : 4   ; // [15..12] 
        unsigned int    ver_min_inten         : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEINTEN;

// Define the union U_VPSS_DIESCALE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    range_scale           : 8   ; // [7..0] 
        unsigned int    Reserved_127          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIESCALE;

// Define the union U_VPSS_DIECHECK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ck_max_range          : 8   ; // [7..0] 
        unsigned int    ck_range_gain         : 4   ; // [11..8] 
        unsigned int    Reserved_129          : 4   ; // [15..12] 
        unsigned int    ck_gain               : 4   ; // [19..16] 
        unsigned int    Reserved_128          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIECHECK1;

// Define the union U_VPSS_DIECHECK2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ck_max_range          : 8   ; // [7..0] 
        unsigned int    ck_range_gain         : 4   ; // [11..8] 
        unsigned int    Reserved_131          : 4   ; // [15..12] 
        unsigned int    ck_gain               : 4   ; // [19..16] 
        unsigned int    Reserved_130          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIECHECK2;

// Define the union U_VPSS_DIEDIR0_3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir0_mult             : 6   ; // [5..0] 
        unsigned int    Reserved_135          : 2   ; // [7..6] 
        unsigned int    dir1_mult             : 6   ; // [13..8] 
        unsigned int    Reserved_134          : 2   ; // [15..14] 
        unsigned int    dir2_mult             : 6   ; // [21..16] 
        unsigned int    Reserved_133          : 2   ; // [23..22] 
        unsigned int    dir3_mult             : 6   ; // [29..24] 
        unsigned int    Reserved_132          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEDIR0_3;

// Define the union U_VPSS_DIEDIR4_7
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir4_mult             : 6   ; // [5..0] 
        unsigned int    Reserved_139          : 2   ; // [7..6] 
        unsigned int    dir5_mult             : 6   ; // [13..8] 
        unsigned int    Reserved_138          : 2   ; // [15..14] 
        unsigned int    dir6_mult             : 6   ; // [21..16] 
        unsigned int    Reserved_137          : 2   ; // [23..22] 
        unsigned int    dir7_mult             : 6   ; // [29..24] 
        unsigned int    Reserved_136          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEDIR4_7;

// Define the union U_VPSS_DIEDIR8_11
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir8_mult             : 6   ; // [5..0] 
        unsigned int    Reserved_143          : 2   ; // [7..6] 
        unsigned int    dir9_mult             : 6   ; // [13..8] 
        unsigned int    Reserved_142          : 2   ; // [15..14] 
        unsigned int    dir10_mult            : 6   ; // [21..16] 
        unsigned int    Reserved_141          : 2   ; // [23..22] 
        unsigned int    dir11_mult            : 6   ; // [29..24] 
        unsigned int    Reserved_140          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEDIR8_11;

// Define the union U_VPSS_DIEDIR12_14
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir12_mult            : 6   ; // [5..0] 
        unsigned int    Reserved_146          : 2   ; // [7..6] 
        unsigned int    dir13_mult            : 6   ; // [13..8] 
        unsigned int    Reserved_145          : 2   ; // [15..14] 
        unsigned int    dir14_mult            : 6   ; // [21..16] 
        unsigned int    Reserved_144          : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEDIR12_14;

// Define the union U_VPSS_DIESTA
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    cur_state             : 4   ; // [3..0] 
        unsigned int    cur_cstate            : 4   ; // [7..4] 
        unsigned int    l_height_cnt          : 12  ; // [19..8] 
        unsigned int    c_height_cnt          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIESTA;

// Define the union U_VPSS_DIESTPPREADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int die_ppre_addr           : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DIESTPPREADDR;
// Define the union U_VPSS_DIESTPREADDR
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int die_pre_addr            : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DIESTPREADDR;
// Define the union U_VPSS_DIEINTPSCL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    intp_scale_ratio_1    : 4   ; // [3..0] 
        unsigned int    intp_scale_ratio_2    : 4   ; // [7..4] 
        unsigned int    intp_scale_ratio_3    : 4   ; // [11..8] 
        unsigned int    intp_scale_ratio_4    : 4   ; // [15..12] 
        unsigned int    intp_scale_ratio_5    : 4   ; // [19..16] 
        unsigned int    intp_scale_ratio_6    : 4   ; // [23..20] 
        unsigned int    intp_scale_ratio_7    : 4   ; // [27..24] 
        unsigned int    intp_scale_ratio_8    : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEINTPSCL0;

// Define the union U_VPSS_DIEINTPSCL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    intp_scale_ratio_9    : 4   ; // [3..0] 
        unsigned int    intp_scale_ratio_10   : 4   ; // [7..4] 
        unsigned int    intp_scale_ratio_11   : 4   ; // [11..8] 
        unsigned int    intp_scale_ratio_12   : 4   ; // [15..12] 
        unsigned int    intp_scale_ratio_13   : 4   ; // [19..16] 
        unsigned int    intp_scale_ratio_14   : 4   ; // [23..20] 
        unsigned int    intp_scale_ratio_15   : 4   ; // [27..24] 
        unsigned int    Reserved_147          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEINTPSCL1;

// Define the union U_VPSS_DIEDIRTHD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    bc_gain               : 7   ; // [6..0] 
        unsigned int    Reserved_149          : 1   ; // [7] 
        unsigned int    dir_thd               : 4   ; // [11..8] 
        unsigned int    edge_mode             : 1   ; // [12] 
        unsigned int    hor_edge_en           : 1   ; // [13] 
        unsigned int    Reserved_148          : 2   ; // [15..14] 
        unsigned int    strength_thd          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEDIRTHD;

// Define the union U_VPSS_DIEJITMTN
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    jitter_gain           : 4   ; // [3..0] 
        unsigned int    jitter_coring         : 8   ; // [11..4] 
        unsigned int    fld_motion_coring     : 8   ; // [19..12] 
        unsigned int    Reserved_150          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEJITMTN;

// Define the union U_VPSS_DIEFLDMTN
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    fld_motion_thd_low    : 8   ; // [7..0] 
        unsigned int    fld_motion_thd_high   : 8   ; // [15..8] 
        unsigned int    fld_motion_curve_slope  : 6   ; // [21..16] 
        unsigned int    Reserved_152          : 2   ; // [23..22] 
        unsigned int    fld_motion_gain       : 4   ; // [27..24] 
        unsigned int    Reserved_151          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFLDMTN;

// Define the union U_VPSS_DIEMTNDIFFTHD0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    motion_diff_thd_0     : 8   ; // [7..0] 
        unsigned int    motion_diff_thd_1     : 8   ; // [15..8] 
        unsigned int    motion_diff_thd_2     : 8   ; // [23..16] 
        unsigned int    motion_diff_thd_3     : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMTNDIFFTHD0;

// Define the union U_VPSS_DIEMTNDIFFTHD1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    motion_diff_thd_4     : 8   ; // [7..0] 
        unsigned int    motion_diff_thd_5     : 8   ; // [15..8] 
        unsigned int    min_motion_iir_ratio  : 7   ; // [22..16] 
        unsigned int    Reserved_154          : 1   ; // [23] 
        unsigned int    max_motion_iir_ratio  : 7   ; // [30..24] 
        unsigned int    Reserved_153          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMTNDIFFTHD1;

// Define the union U_VPSS_DIEMTNIIRSLP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    motion_iir_curve_slope_0  : 6   ; // [5..0] 
        unsigned int    motion_iir_curve_slope_1  : 6   ; // [11..6] 
        unsigned int    motion_iir_curve_slope_2  : 6   ; // [17..12] 
        unsigned int    motion_iir_curve_slope_3  : 6   ; // [23..18] 
        unsigned int    motion_iir_curve_ratio_0  : 7   ; // [30..24] 
        unsigned int    Reserved_155          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMTNIIRSLP;

// Define the union U_VPSS_DIEMTNIIRRAT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    motion_iir_curve_ratio_1  : 7   ; // [6..0] 
        unsigned int    Reserved_159          : 1   ; // [7] 
        unsigned int    motion_iir_curve_ratio_2  : 7   ; // [14..8] 
        unsigned int    Reserved_158          : 1   ; // [15] 
        unsigned int    motion_iir_curve_ratio_3  : 7   ; // [22..16] 
        unsigned int    Reserved_157          : 1   ; // [23] 
        unsigned int    motion_iir_curve_ratio_4  : 7   ; // [30..24] 
        unsigned int    Reserved_156          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMTNIIRRAT;

// Define the union U_VPSS_DIEHISMODE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    rec_mode_fld_motion_step_0  : 3   ; // [2..0] 
        unsigned int    Reserved_164          : 1   ; // [3] 
        unsigned int    rec_mode_fld_motion_step_1  : 3   ; // [6..4] 
        unsigned int    Reserved_163          : 1   ; // [7] 
        unsigned int    rec_mode_frm_motion_step_0  : 2   ; // [9..8] 
        unsigned int    Reserved_162          : 2   ; // [11..10] 
        unsigned int    rec_mode_frm_motion_step_1  : 2   ; // [13..12] 
        unsigned int    Reserved_161          : 2   ; // [15..14] 
        unsigned int    ppre_info_en          : 1   ; // [16] 
        unsigned int    pre_info_en           : 1   ; // [17] 
        unsigned int    his_motion_en         : 1   ; // [18] 
        unsigned int    his_motion_using_mode  : 1   ; // [19] 
        unsigned int    his_motion_write_mode  : 1   ; // [20] 
        unsigned int    his_motion_info_write_mode  : 1   ; // [21] 
        unsigned int    Reserved_160          : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEHISMODE;

// Define the union U_VPSS_DIEMORFLT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    mor_flt_thd           : 8   ; // [7..0] 
        unsigned int    mor_flt_size          : 2   ; // [9..8] 
        unsigned int    Reserved_167          : 14  ; // [23..10] 
        unsigned int    mor_flt_en            : 1   ; // [24] 
        unsigned int    Reserved_166          : 1   ; // [25] 
        unsigned int    med_blend_en          : 1   ; // [26] 
        unsigned int    Reserved_165          : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMORFLT;

// Define the union U_VPSS_DIECOMBCHK0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    comb_chk_min_hthd     : 8   ; // [7..0] 
        unsigned int    comb_chk_min_vthd     : 8   ; // [15..8] 
        unsigned int    comb_chk_lower_limit  : 8   ; // [23..16] 
        unsigned int    comb_chk_upper_limit  : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIECOMBCHK0;

// Define the union U_VPSS_DIECOMBCHK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    comb_chk_edge_thd     : 7   ; // [6..0] 
        unsigned int    Reserved_170          : 1   ; // [7] 
        unsigned int    comb_chk_md_thd       : 5   ; // [12..8] 
        unsigned int    Reserved_169          : 3   ; // [15..13] 
        unsigned int    comb_chk_en           : 1   ; // [16] 
        unsigned int    Reserved_168          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIECOMBCHK1;

// Define the union U_VPSS_DIEFRMMTNSMTHTHD0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_motion_smooth_thd0  : 8   ; // [7..0] 
        unsigned int    frame_motion_smooth_thd1  : 8   ; // [15..8] 
        unsigned int    frame_motion_smooth_thd2  : 8   ; // [23..16] 
        unsigned int    frame_motion_smooth_thd3  : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMMTNSMTHTHD0;

// Define the union U_VPSS_DIEFRMMTNSMTHTHD1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_motion_smooth_thd4  : 8   ; // [7..0] 
        unsigned int    frame_motion_smooth_thd5  : 8   ; // [15..8] 
        unsigned int    frame_motion_smooth_ratio_min  : 7   ; // [22..16] 
        unsigned int    Reserved_172          : 1   ; // [23] 
        unsigned int    frame_motion_smooth_ratio_max  : 7   ; // [30..24] 
        unsigned int    Reserved_171          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMMTNSMTHTHD1;

// Define the union U_VPSS_DIEFRMMTNSMTHSLP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_motion_smooth_slope0  : 6   ; // [5..0] 
        unsigned int    frame_motion_smooth_slope1  : 6   ; // [11..6] 
        unsigned int    frame_motion_smooth_slope2  : 6   ; // [17..12] 
        unsigned int    frame_motion_smooth_slope3  : 6   ; // [23..18] 
        unsigned int    frame_motion_smooth_ratio0  : 7   ; // [30..24] 
        unsigned int    Reserved_173          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMMTNSMTHSLP;

// Define the union U_VPSS_DIEFRMMTNSMTHRAT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_motion_smooth_ratio1  : 7   ; // [6..0] 
        unsigned int    Reserved_177          : 1   ; // [7] 
        unsigned int    frame_motion_smooth_ratio2  : 7   ; // [14..8] 
        unsigned int    Reserved_176          : 1   ; // [15] 
        unsigned int    frame_motion_smooth_ratio3  : 7   ; // [22..16] 
        unsigned int    Reserved_175          : 1   ; // [23] 
        unsigned int    frame_motion_smooth_ratio4  : 7   ; // [30..24] 
        unsigned int    Reserved_174          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMMTNSMTHRAT;

// Define the union U_VPSS_DIEFRMFLDBLENDTHD0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_field_blend_thd0  : 8   ; // [7..0] 
        unsigned int    frame_field_blend_thd1  : 8   ; // [15..8] 
        unsigned int    frame_field_blend_thd2  : 8   ; // [23..16] 
        unsigned int    frame_field_blend_thd3  : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMFLDBLENDTHD0;

// Define the union U_VPSS_DIEFRMFLDBLENDTHD1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_field_blend_thd4  : 8   ; // [7..0] 
        unsigned int    frame_field_blend_thd5  : 8   ; // [15..8] 
        unsigned int    frame_field_blend_ratio_min  : 7   ; // [22..16] 
        unsigned int    Reserved_179          : 1   ; // [23] 
        unsigned int    frame_field_blend_ratio_max  : 7   ; // [30..24] 
        unsigned int    Reserved_178          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMFLDBLENDTHD1;

// Define the union U_VPSS_DIEFRMFLDBLENDSLP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_field_blend_slope0  : 6   ; // [5..0] 
        unsigned int    frame_field_blend_slope1  : 6   ; // [11..6] 
        unsigned int    frame_field_blend_slope2  : 6   ; // [17..12] 
        unsigned int    frame_field_blend_slope3  : 6   ; // [23..18] 
        unsigned int    frame_field_blend_ratio0  : 7   ; // [30..24] 
        unsigned int    Reserved_180          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMFLDBLENDSLP;

// Define the union U_VPSS_DIEFRMFLDBLENDRAT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    frame_field_blend_ratio1  : 7   ; // [6..0] 
        unsigned int    Reserved_184          : 1   ; // [7] 
        unsigned int    frame_field_blend_ratio2  : 7   ; // [14..8] 
        unsigned int    Reserved_183          : 1   ; // [15] 
        unsigned int    frame_field_blend_ratio3  : 7   ; // [22..16] 
        unsigned int    Reserved_182          : 1   ; // [23] 
        unsigned int    frame_field_blend_ratio4  : 7   ; // [30..24] 
        unsigned int    Reserved_181          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEFRMFLDBLENDRAT;

// Define the union U_VPSS_DIEMTNADJ
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    motion_adjust_gain    : 8   ; // [7..0] 
        unsigned int    motion_adjust_coring  : 6   ; // [13..8] 
        unsigned int    Reserved_186          : 2   ; // [15..14] 
        unsigned int    motion_adjust_gain_chr  : 8   ; // [23..16] 
        unsigned int    Reserved_185          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEMTNADJ;

// Define the union U_VPSS_DIEGLBMTNTHD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    small_motion_thd      : 10  ; // [9..0] 
        unsigned int    Reserved_188          : 6   ; // [15..10] 
        unsigned int    large_motion_thd      : 10  ; // [25..16] 
        unsigned int    Reserved_187          : 6   ; // [31..26] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DIEGLBMTNTHD;

// Define the union U_VPSS_PDPCCTHR0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    coring_norm           : 8   ; // [7..0] 
        unsigned int    mov_coring_norm       : 8   ; // [15..8] 
        unsigned int    coring_tkr            : 8   ; // [23..16] 
        unsigned int    mov_coring_tkr        : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDPCCTHR0;

// Define the union U_VPSS_PDPCCTHR1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pcc_vthd0             : 8   ; // [7..0] 
        unsigned int    pcc_vthd1             : 8   ; // [15..8] 
        unsigned int    pcc_vthd2             : 8   ; // [23..16] 
        unsigned int    pcc_vthd3             : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDPCCTHR1;

// Define the union U_VPSS_PDPCCTHR2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pcc_hthd              : 8   ; // [7..0] 
        unsigned int    Reserved_190          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDPCCTHR2;

// Define the union U_VPSS_PDOSDTHR0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    osd_en                : 1   ; // [0] 
        unsigned int    osd_lowcoring         : 8   ; // [8..1] 
        unsigned int    osd_highcoring        : 8   ; // [16..9] 
        unsigned int    Reserved_191          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDOSDTHR0;

// Define the union U_VPSS_PDOSDTHR1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    osd_minrows           : 8   ; // [7..0] 
        unsigned int    osd_minpxls           : 8   ; // [15..8] 
        unsigned int    osd_vertdiffthd       : 8   ; // [23..16] 
        unsigned int    osd_horzdiffthd       : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDOSDTHR1;

// Define the union U_VPSS_PDOSDINIT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    isosd_scence_init     : 1   ; // [0] 
        unsigned int    curfldbeginosdrow_init  : 12  ; // [12..1] 
        unsigned int    curfldnoosdrows_init  : 12  ; // [24..13] 
        unsigned int    Reserved_192          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDOSDINIT0;

// Define the union U_VPSS_PDOSDINIT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lst1fldflag_init      : 1   ; // [0] 
        unsigned int    lst1fldbeginosdrow_init  : 12  ; // [12..1] 
        unsigned int    lst1fldnoosdrows_init  : 12  ; // [24..13] 
        unsigned int    Reserved_193          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDOSDINIT1;

// Define the union U_VPSS_PDOSDINIT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lst2fldflag_init      : 1   ; // [0] 
        unsigned int    lst2fldbeginosdrow_init  : 12  ; // [12..1] 
        unsigned int    lst2fldnoosdrows_init  : 12  ; // [24..13] 
        unsigned int    Reserved_194          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDOSDINIT2;

// Define the union U_VPSS_PDITDIFFTHR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    itdiff_thd0           : 8   ; // [7..0] 
        unsigned int    itdiff_thd1           : 8   ; // [15..8] 
        unsigned int    itdiff_thd2           : 8   ; // [23..16] 
        unsigned int    itdiff_thd3           : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDITDIFFTHR;

// Define the union U_VPSS_PDUMTHR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    um_thd0               : 8   ; // [7..0] 
        unsigned int    um_thd1               : 8   ; // [15..8] 
        unsigned int    um_thd2               : 8   ; // [23..16] 
        unsigned int    Reserved_195          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDUMTHR;

// Define the union U_VPSS_PDSTILLBLKTHR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    diff_movblk_thd       : 8   ; // [7..0] 
        unsigned int    Reserved_196          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDSTILLBLKTHR;

// Define the union U_VPSS_PDCOMBTHR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    mcomb_thd             : 8   ; // [7..0] 
        unsigned int    Reserved_197          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDCOMBTHR;

// Define the union U_VPSS_PDLASITHR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lasi_mode             : 1   ; // [0] 
        unsigned int    lasi_coring_thd       : 8   ; // [8..1] 
        unsigned int    lasi_edge_thd         : 8   ; // [16..9] 
        unsigned int    lasi_mov_thd          : 8   ; // [24..17] 
        unsigned int    Reserved_198          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDLASITHR;

// Define the union U_VPSS_PDICHD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    bitsmov2r             : 3   ; // [2..0] 
        unsigned int    Reserved_199          : 29  ; // [31..3] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PDICHD;

// Define the union U_VPSS_VHD0_HSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hratio                : 24  ; // [23..0] 
        unsigned int    hfir_order            : 1   ; // [24] 
        unsigned int    hchfir_en             : 1   ; // [25] 
        unsigned int    hlfir_en              : 1   ; // [26] 
        unsigned int    Reserved_200          : 1   ; // [27] 
        unsigned int    hchmid_en             : 1   ; // [28] 
        unsigned int    hlmid_en              : 1   ; // [29] 
        unsigned int    hchmsc_en             : 1   ; // [30] 
        unsigned int    hlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_HSP;

// Define the union U_VPSS_VHD0_HLOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_loffset           : 28  ; // [27..0] 
        unsigned int    Reserved_202          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_HLOFFSET;

// Define the union U_VPSS_VHD0_HCOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_coffset           : 28  ; // [27..0] 
        unsigned int    Reserved_203          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_HCOFFSET;

// Define the union U_VPSS_VHD0_VSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_205          : 19  ; // [18..0] 
        unsigned int    zme_in_fmt            : 2   ; // [20..19] 
        unsigned int    zme_out_fmt           : 2   ; // [22..21] 
        unsigned int    vchfir_en             : 1   ; // [23] 
        unsigned int    vlfir_en              : 1   ; // [24] 
        unsigned int    Reserved_204          : 3   ; // [27..25] 
        unsigned int    vchmid_en             : 1   ; // [28] 
        unsigned int    vlmid_en              : 1   ; // [29] 
        unsigned int    vchmsc_en             : 1   ; // [30] 
        unsigned int    vlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_VSP;

// Define the union U_VPSS_VHD0_VSR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vratio                : 16  ; // [15..0] 
        unsigned int    Reserved_206          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_VSR;

// Define the union U_VPSS_VHD0_VOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vchroma_offset        : 16  ; // [15..0] 
        unsigned int    vluma_offset          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_VOFFSET;

// Define the union U_VPSS_VHD0_ZMEORESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ow                    : 12  ; // [11..0] 
        unsigned int    oh                    : 12  ; // [23..12] 
        unsigned int    Reserved_207          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_ZMEORESO;

// Define the union U_VPSS_VHD0_ZMEIRESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    iw                    : 12  ; // [11..0] 
        unsigned int    ih                    : 12  ; // [23..12] 
        unsigned int    Reserved_208          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD0_ZMEIRESO;

// Define the union U_VPSS_VHD1_HSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hratio                : 24  ; // [23..0] 
        unsigned int    hfir_order            : 1   ; // [24] 
        unsigned int    hchfir_en             : 1   ; // [25] 
        unsigned int    hlfir_en              : 1   ; // [26] 
        unsigned int    Reserved_209          : 1   ; // [27] 
        unsigned int    hchmid_en             : 1   ; // [28] 
        unsigned int    hlmid_en              : 1   ; // [29] 
        unsigned int    hchmsc_en             : 1   ; // [30] 
        unsigned int    hlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_HSP;

// Define the union U_VPSS_VHD1_HLOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_loffset           : 28  ; // [27..0] 
        unsigned int    Reserved_211          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_HLOFFSET;

// Define the union U_VPSS_VHD1_HCOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_coffset           : 28  ; // [27..0] 
        unsigned int    Reserved_212          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_HCOFFSET;

// Define the union U_VPSS_VHD1_VSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_214          : 19  ; // [18..0] 
        unsigned int    zme_in_fmt            : 2   ; // [20..19] 
        unsigned int    zme_out_fmt           : 2   ; // [22..21] 
        unsigned int    vchfir_en             : 1   ; // [23] 
        unsigned int    vlfir_en              : 1   ; // [24] 
        unsigned int    Reserved_213          : 3   ; // [27..25] 
        unsigned int    vchmid_en             : 1   ; // [28] 
        unsigned int    vlmid_en              : 1   ; // [29] 
        unsigned int    vchmsc_en             : 1   ; // [30] 
        unsigned int    vlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_VSP;

// Define the union U_VPSS_VHD1_VSR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vratio                : 16  ; // [15..0] 
        unsigned int    Reserved_215          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_VSR;

// Define the union U_VPSS_VHD1_VOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vchroma_offset        : 16  ; // [15..0] 
        unsigned int    vluma_offset          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_VOFFSET;

// Define the union U_VPSS_VHD1_ZMEORESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ow                    : 12  ; // [11..0] 
        unsigned int    oh                    : 12  ; // [23..12] 
        unsigned int    Reserved_216          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_ZMEORESO;

// Define the union U_VPSS_VHD1_ZMEIRESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    iw                    : 12  ; // [11..0] 
        unsigned int    ih                    : 12  ; // [23..12] 
        unsigned int    Reserved_217          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VHD1_ZMEIRESO;

// Define the union U_VPSS_VSD_HSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hratio                : 24  ; // [23..0] 
        unsigned int    hfir_order            : 1   ; // [24] 
        unsigned int    hchfir_en             : 1   ; // [25] 
        unsigned int    hlfir_en              : 1   ; // [26] 
        unsigned int    Reserved_218          : 1   ; // [27] 
        unsigned int    hchmid_en             : 1   ; // [28] 
        unsigned int    hlmid_en              : 1   ; // [29] 
        unsigned int    hchmsc_en             : 1   ; // [30] 
        unsigned int    hlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_HSP;

// Define the union U_VPSS_VSD_HLOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_loffset           : 28  ; // [27..0] 
        unsigned int    Reserved_220          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_HLOFFSET;

// Define the union U_VPSS_VSD_HCOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hor_coffset           : 28  ; // [27..0] 
        unsigned int    Reserved_221          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_HCOFFSET;

// Define the union U_VPSS_VSD_VSP
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_223          : 19  ; // [18..0] 
        unsigned int    zme_in_fmt            : 2   ; // [20..19] 
        unsigned int    zme_out_fmt           : 2   ; // [22..21] 
        unsigned int    vchfir_en             : 1   ; // [23] 
        unsigned int    vlfir_en              : 1   ; // [24] 
        unsigned int    Reserved_222          : 3   ; // [27..25] 
        unsigned int    vchmid_en             : 1   ; // [28] 
        unsigned int    vlmid_en              : 1   ; // [29] 
        unsigned int    vchmsc_en             : 1   ; // [30] 
        unsigned int    vlmsc_en              : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_VSP;

// Define the union U_VPSS_VSD_VSR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vratio                : 16  ; // [15..0] 
        unsigned int    Reserved_224          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_VSR;

// Define the union U_VPSS_VSD_VOFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    vchroma_offset        : 16  ; // [15..0] 
        unsigned int    vluma_offset          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_VOFFSET;

// Define the union U_VPSS_VSD_ZMEORESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ow                    : 12  ; // [11..0] 
        unsigned int    oh                    : 12  ; // [23..12] 
        unsigned int    Reserved_225          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_ZMEORESO;

// Define the union U_VPSS_VSD_ZMEIRESO
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    iw                    : 12  ; // [11..0] 
        unsigned int    ih                    : 12  ; // [23..12] 
        unsigned int    Reserved_226          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VSD_ZMEIRESO;

// Define the union U_VPSS_HSPCFG1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf0_tmp0          : 8   ; // [7..0] 
        unsigned int    hsp_hf0_tmp1          : 8   ; // [15..8] 
        unsigned int    hsp_hf0_tmp2          : 8   ; // [23..16] 
        unsigned int    hsp_hf0_tmp3          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG1;

// Define the union U_VPSS_HSPCFG2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf0_coring        : 8   ; // [7..0] 
        unsigned int    Reserved_228          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG2;

// Define the union U_VPSS_HSPCFG3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf0_gainpos       : 11  ; // [10..0] 
        unsigned int    Reserved_230          : 5   ; // [15..11] 
        unsigned int    hsp_hf0_gainneg       : 11  ; // [26..16] 
        unsigned int    Reserved_229          : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG3;

// Define the union U_VPSS_HSPCFG4
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf0_overth        : 8   ; // [7..0] 
        unsigned int    hsp_hf0_underth       : 8   ; // [15..8] 
        unsigned int    hsp_hf0_mixratio      : 8   ; // [23..16] 
        unsigned int    Reserved_232          : 4   ; // [27..24] 
        unsigned int    hsp_hf0_winsize       : 3   ; // [30..28] 
        unsigned int    hsp_hf0_adpshoot_en   : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG4;

// Define the union U_VPSS_HSPCFG5
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf1_tmp0          : 8   ; // [7..0] 
        unsigned int    hsp_hf1_tmp1          : 8   ; // [15..8] 
        unsigned int    hsp_hf1_tmp2          : 8   ; // [23..16] 
        unsigned int    hsp_hf1_tmp3          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG5;

// Define the union U_VPSS_HSPCFG6
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf1_coring        : 8   ; // [7..0] 
        unsigned int    Reserved_233          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG6;

// Define the union U_VPSS_HSPCFG7
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf1_gainpos       : 11  ; // [10..0] 
        unsigned int    Reserved_235          : 5   ; // [15..11] 
        unsigned int    hsp_hf1_gainneg       : 11  ; // [26..16] 
        unsigned int    Reserved_234          : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG7;

// Define the union U_VPSS_HSPCFG8
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_hf1_overth        : 8   ; // [7..0] 
        unsigned int    hsp_hf1_underth       : 8   ; // [15..8] 
        unsigned int    hsp_hf1_mixratio      : 8   ; // [23..16] 
        unsigned int    Reserved_237          : 4   ; // [27..24] 
        unsigned int    hsp_hf1_winsize       : 3   ; // [30..28] 
        unsigned int    hsp_hf1_adpshoot_en   : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG8;

// Define the union U_VPSS_HSPCFG9
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_cdti_gain         : 8   ; // [7..0] 
        unsigned int    hsp_ldti_gain         : 8   ; // [15..8] 
        unsigned int    hsp_lti_ratio         : 8   ; // [23..16] 
        unsigned int    hsp_hf_shootdiv       : 3   ; // [26..24] 
        unsigned int    Reserved_238          : 1   ; // [27] 
        unsigned int    hsp_ctih_en           : 1   ; // [28] 
        unsigned int    hsp_ltih_en           : 1   ; // [29] 
        unsigned int    hsp_h1_en             : 1   ; // [30] 
        unsigned int    hsp_h0_en             : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG9;

// Define the union U_VPSS_HSPCFG10
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hsp_glb_underth       : 9   ; // [8..0] 
        unsigned int    hsp_mk_en             : 1   ; // [9] 
        unsigned int    hsp_glb_overth        : 9   ; // [18..10] 
        unsigned int    hsp_mk_mode           : 1   ; // [19] 
        unsigned int    hsp_peak_ratio        : 8   ; // [27..20] 
        unsigned int    Reserved_239          : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_HSPCFG10;

// Define the union U_VPSS_DB_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    db_luma_en            : 1   ; // [0] 
        unsigned int    db_luma_hen           : 1   ; // [1] 
        unsigned int    db_luma_ven           : 1   ; // [2] 
        unsigned int    db_demo_en            : 1   ; // [3] 
        unsigned int    db_chroma_en          : 1   ; // [4] 
        unsigned int    db_chroma_hen         : 1   ; // [5] 
        unsigned int    db_chroma_ven         : 1   ; // [6] 
        unsigned int    vfilter_mode          : 1   ; // [7] 
        unsigned int    db_dir_en             : 1   ; // [8] 
        unsigned int    range_limit_en        : 1   ; // [9] 
        unsigned int    filter_mode           : 1   ; // [10] 
        unsigned int    db_demo_mode          : 1   ; // [11] 
        unsigned int    ridax                 : 9   ; // [20..12] 
        unsigned int    Reserved_240          : 11  ; // [31..21] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CTRL;

// Define the union U_VPSS_DB_OFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lum_hblk_offset       : 6   ; // [5..0] 
        unsigned int    Reserved_245          : 2   ; // [7..6] 
        unsigned int    lum_vblk_offset       : 6   ; // [13..8] 
        unsigned int    Reserved_244          : 2   ; // [15..14] 
        unsigned int    chr_hblk_offset       : 6   ; // [21..16] 
        unsigned int    Reserved_243          : 2   ; // [23..22] 
        unsigned int    chr_vblk_offset       : 6   ; // [29..24] 
        unsigned int    Reserved_242          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_OFFSET;

// Define the union U_VPSS_DB_LUMHBLK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lum_hblk_sizei        : 7   ; // [6..0] 
        unsigned int    Reserved_247          : 1   ; // [7] 
        unsigned int    lum_hblk_sized        : 9   ; // [16..8] 
        unsigned int    Reserved_246          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_LUMHBLK;

// Define the union U_VPSS_DB_LUMVBLK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lum_vblk_sizei        : 7   ; // [6..0] 
        unsigned int    Reserved_249          : 1   ; // [7] 
        unsigned int    lum_vblk_sized        : 9   ; // [16..8] 
        unsigned int    Reserved_248          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_LUMVBLK;

// Define the union U_VPSS_DB_CHRHBLK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    chr_hblk_sizei        : 7   ; // [6..0] 
        unsigned int    Reserved_251          : 1   ; // [7] 
        unsigned int    chr_hblk_sized        : 9   ; // [16..8] 
        unsigned int    Reserved_250          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CHRHBLK;

// Define the union U_VPSS_DB_CHRVBLK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    chr_vblk_sizei        : 7   ; // [6..0] 
        unsigned int    Reserved_253          : 1   ; // [7] 
        unsigned int    chr_vblk_sized        : 9   ; // [16..8] 
        unsigned int    Reserved_252          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_CHRVBLK;

// Define the union U_VPSS_DB_WEIGHT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    db_hweight            : 6   ; // [5..0] 
        unsigned int    Reserved_256          : 2   ; // [7..6] 
        unsigned int    db_vweight            : 6   ; // [13..8] 
        unsigned int    Reserved_255          : 2   ; // [15..14] 
        unsigned int    hglobal_motion_delt   : 4   ; // [19..16] 
        unsigned int    vglobal_motion_delt   : 4   ; // [23..20] 
        unsigned int    Reserved_254          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_WEIGHT;

// Define the union U_VPSS_DB_STRLUT00
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut00             : 5   ; // [4..0] 
        unsigned int    str_lut01             : 5   ; // [9..5] 
        unsigned int    str_lut02             : 5   ; // [14..10] 
        unsigned int    str_lut03             : 5   ; // [19..15] 
        unsigned int    str_lut04             : 5   ; // [24..20] 
        unsigned int    Reserved_257          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT00;

// Define the union U_VPSS_DB_STRLUT01
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut05             : 5   ; // [4..0] 
        unsigned int    str_lut06             : 5   ; // [9..5] 
        unsigned int    str_lut07             : 5   ; // [14..10] 
        unsigned int    str_lut08             : 5   ; // [19..15] 
        unsigned int    str_lut09             : 5   ; // [24..20] 
        unsigned int    Reserved_258          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT01;

// Define the union U_VPSS_DB_STRLUT10
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut10             : 5   ; // [4..0] 
        unsigned int    str_lut11             : 5   ; // [9..5] 
        unsigned int    str_lut12             : 5   ; // [14..10] 
        unsigned int    str_lut13             : 5   ; // [19..15] 
        unsigned int    str_lut14             : 5   ; // [24..20] 
        unsigned int    Reserved_259          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT10;

// Define the union U_VPSS_DB_STRLUT11
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut15             : 5   ; // [4..0] 
        unsigned int    str_lut16             : 5   ; // [9..5] 
        unsigned int    str_lut17             : 5   ; // [14..10] 
        unsigned int    str_lut18             : 5   ; // [19..15] 
        unsigned int    str_lut19             : 5   ; // [24..20] 
        unsigned int    Reserved_260          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT11;

// Define the union U_VPSS_DB_STRLUT20
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut20             : 5   ; // [4..0] 
        unsigned int    str_lut21             : 5   ; // [9..5] 
        unsigned int    str_lut22             : 5   ; // [14..10] 
        unsigned int    str_lut23             : 5   ; // [19..15] 
        unsigned int    str_lut24             : 5   ; // [24..20] 
        unsigned int    Reserved_261          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT20;

// Define the union U_VPSS_DB_STRLUT21
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut25             : 5   ; // [4..0] 
        unsigned int    str_lut26             : 5   ; // [9..5] 
        unsigned int    str_lut27             : 5   ; // [14..10] 
        unsigned int    str_lut28             : 5   ; // [19..15] 
        unsigned int    str_lut29             : 5   ; // [24..20] 
        unsigned int    Reserved_262          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT21;

// Define the union U_VPSS_DB_STRLUT30
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut30             : 5   ; // [4..0] 
        unsigned int    str_lut31             : 5   ; // [9..5] 
        unsigned int    str_lut32             : 5   ; // [14..10] 
        unsigned int    str_lut33             : 5   ; // [19..15] 
        unsigned int    str_lut34             : 5   ; // [24..20] 
        unsigned int    Reserved_263          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT30;

// Define the union U_VPSS_DB_STRLUT31
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut35             : 5   ; // [4..0] 
        unsigned int    str_lut36             : 5   ; // [9..5] 
        unsigned int    str_lut37             : 5   ; // [14..10] 
        unsigned int    str_lut38             : 5   ; // [19..15] 
        unsigned int    str_lut39             : 5   ; // [24..20] 
        unsigned int    Reserved_264          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT31;

// Define the union U_VPSS_DB_STRLUT40
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut40             : 5   ; // [4..0] 
        unsigned int    str_lut41             : 5   ; // [9..5] 
        unsigned int    str_lut42             : 5   ; // [14..10] 
        unsigned int    str_lut43             : 5   ; // [19..15] 
        unsigned int    str_lut44             : 5   ; // [24..20] 
        unsigned int    Reserved_265          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT40;

// Define the union U_VPSS_DB_STRLUT41
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut45             : 5   ; // [4..0] 
        unsigned int    str_lut46             : 5   ; // [9..5] 
        unsigned int    str_lut47             : 5   ; // [14..10] 
        unsigned int    str_lut48             : 5   ; // [19..15] 
        unsigned int    str_lut49             : 5   ; // [24..20] 
        unsigned int    Reserved_266          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT41;

// Define the union U_VPSS_DB_STRLUT50
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut50             : 5   ; // [4..0] 
        unsigned int    str_lut51             : 5   ; // [9..5] 
        unsigned int    str_lut52             : 5   ; // [14..10] 
        unsigned int    str_lut53             : 5   ; // [19..15] 
        unsigned int    str_lut54             : 5   ; // [24..20] 
        unsigned int    Reserved_267          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT50;

// Define the union U_VPSS_DB_STRLUT51
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut55             : 5   ; // [4..0] 
        unsigned int    str_lut56             : 5   ; // [9..5] 
        unsigned int    str_lut57             : 5   ; // [14..10] 
        unsigned int    str_lut58             : 5   ; // [19..15] 
        unsigned int    str_lut59             : 5   ; // [24..20] 
        unsigned int    Reserved_268          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT51;

// Define the union U_VPSS_DB_STRLUT60
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut60             : 5   ; // [4..0] 
        unsigned int    str_lut61             : 5   ; // [9..5] 
        unsigned int    str_lut62             : 5   ; // [14..10] 
        unsigned int    str_lut63             : 5   ; // [19..15] 
        unsigned int    str_lut64             : 5   ; // [24..20] 
        unsigned int    Reserved_269          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT60;

// Define the union U_VPSS_DB_STRLUT61
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut65             : 5   ; // [4..0] 
        unsigned int    str_lut66             : 5   ; // [9..5] 
        unsigned int    str_lut67             : 5   ; // [14..10] 
        unsigned int    str_lut68             : 5   ; // [19..15] 
        unsigned int    str_lut69             : 5   ; // [24..20] 
        unsigned int    Reserved_270          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT61;

// Define the union U_VPSS_DB_STRLUT70
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut70             : 5   ; // [4..0] 
        unsigned int    str_lut71             : 5   ; // [9..5] 
        unsigned int    str_lut72             : 5   ; // [14..10] 
        unsigned int    str_lut73             : 5   ; // [19..15] 
        unsigned int    str_lut74             : 5   ; // [24..20] 
        unsigned int    Reserved_271          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT70;

// Define the union U_VPSS_DB_STRLUT71
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut75             : 5   ; // [4..0] 
        unsigned int    str_lut76             : 5   ; // [9..5] 
        unsigned int    str_lut77             : 5   ; // [14..10] 
        unsigned int    str_lut78             : 5   ; // [19..15] 
        unsigned int    str_lut79             : 5   ; // [24..20] 
        unsigned int    Reserved_272          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT71;

// Define the union U_VPSS_DB_STRLUT80
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut80             : 5   ; // [4..0] 
        unsigned int    str_lut81             : 5   ; // [9..5] 
        unsigned int    str_lut82             : 5   ; // [14..10] 
        unsigned int    str_lut83             : 5   ; // [19..15] 
        unsigned int    str_lut84             : 5   ; // [24..20] 
        unsigned int    Reserved_273          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT80;

// Define the union U_VPSS_DB_STRLUT81
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut85             : 5   ; // [4..0] 
        unsigned int    str_lut86             : 5   ; // [9..5] 
        unsigned int    str_lut87             : 5   ; // [14..10] 
        unsigned int    str_lut88             : 5   ; // [19..15] 
        unsigned int    str_lut89             : 5   ; // [24..20] 
        unsigned int    Reserved_274          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT81;

// Define the union U_VPSS_DB_STRLUT90
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut90             : 5   ; // [4..0] 
        unsigned int    str_lut91             : 5   ; // [9..5] 
        unsigned int    str_lut92             : 5   ; // [14..10] 
        unsigned int    str_lut93             : 5   ; // [19..15] 
        unsigned int    str_lut94             : 5   ; // [24..20] 
        unsigned int    Reserved_275          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT90;

// Define the union U_VPSS_DB_STRLUT91
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    str_lut95             : 5   ; // [4..0] 
        unsigned int    str_lut96             : 5   ; // [9..5] 
        unsigned int    str_lut97             : 5   ; // [14..10] 
        unsigned int    str_lut98             : 5   ; // [19..15] 
        unsigned int    str_lut99             : 5   ; // [24..20] 
        unsigned int    Reserved_276          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DB_STRLUT91;

// Define the union U_VPSS_DR_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    enep                  : 1   ; // [0] 
        unsigned int    enovt                 : 4   ; // [4..1] 
        unsigned int    enstradjstbylm        : 1   ; // [5] 
        unsigned int    enangadjstbylm        : 1   ; // [6] 
        unsigned int    clipmode              : 1   ; // [7] 
        unsigned int    demo_en               : 1   ; // [8] 
        unsigned int    demo_mode             : 1   ; // [9] 
        unsigned int    Reserved_277          : 22  ; // [31..10] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DR_CTRL;

// Define the union U_VPSS_DR_THR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    regthrmdfangctrst     : 4   ; // [3..0] 
        unsigned int    regthrovshtminang     : 4   ; // [7..4] 
        unsigned int    regdrstrenth          : 5   ; // [12..8] 
        unsigned int    regovtstrenth         : 3   ; // [15..13] 
        unsigned int    Reserved_279          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DR_THR;

// Define the union U_VPSS_DRLSWSTRLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut00           : 5   ; // [4..0] 
        unsigned int    lswstrlut10           : 5   ; // [9..5] 
        unsigned int    lswstrlut20           : 5   ; // [14..10] 
        unsigned int    lswstrlut30           : 5   ; // [19..15] 
        unsigned int    lswstrlut40           : 5   ; // [24..20] 
        unsigned int    lswstrlut50           : 5   ; // [29..25] 
        unsigned int    Reserved_280          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT0;

// Define the union U_VPSS_DRLSWSTRLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut01           : 5   ; // [4..0] 
        unsigned int    lswstrlut11           : 5   ; // [9..5] 
        unsigned int    lswstrlut21           : 5   ; // [14..10] 
        unsigned int    lswstrlut31           : 5   ; // [19..15] 
        unsigned int    lswstrlut41           : 5   ; // [24..20] 
        unsigned int    lswstrlut51           : 5   ; // [29..25] 
        unsigned int    Reserved_281          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT1;

// Define the union U_VPSS_DRLSWSTRLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut02           : 5   ; // [4..0] 
        unsigned int    lswstrlut12           : 5   ; // [9..5] 
        unsigned int    lswstrlut22           : 5   ; // [14..10] 
        unsigned int    lswstrlut32           : 5   ; // [19..15] 
        unsigned int    lswstrlut42           : 5   ; // [24..20] 
        unsigned int    lswstrlut52           : 5   ; // [29..25] 
        unsigned int    Reserved_282          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT2;

// Define the union U_VPSS_DRLSWSTRLUT3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut03           : 5   ; // [4..0] 
        unsigned int    lswstrlut13           : 5   ; // [9..5] 
        unsigned int    lswstrlut23           : 5   ; // [14..10] 
        unsigned int    lswstrlut33           : 5   ; // [19..15] 
        unsigned int    lswstrlut43           : 5   ; // [24..20] 
        unsigned int    lswstrlut53           : 5   ; // [29..25] 
        unsigned int    Reserved_283          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT3;

// Define the union U_VPSS_DRLSWSTRLUT4
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut04           : 5   ; // [4..0] 
        unsigned int    lswstrlut14           : 5   ; // [9..5] 
        unsigned int    lswstrlut24           : 5   ; // [14..10] 
        unsigned int    lswstrlut34           : 5   ; // [19..15] 
        unsigned int    lswstrlut44           : 5   ; // [24..20] 
        unsigned int    lswstrlut54           : 5   ; // [29..25] 
        unsigned int    Reserved_284          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT4;

// Define the union U_VPSS_DRLSWSTRLUT5
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut05           : 5   ; // [4..0] 
        unsigned int    lswstrlut15           : 5   ; // [9..5] 
        unsigned int    lswstrlut25           : 5   ; // [14..10] 
        unsigned int    lswstrlut35           : 5   ; // [19..15] 
        unsigned int    lswstrlut45           : 5   ; // [24..20] 
        unsigned int    lswstrlut55           : 5   ; // [29..25] 
        unsigned int    Reserved_285          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT5;

// Define the union U_VPSS_DRLSWSTRLUT6
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut06           : 5   ; // [4..0] 
        unsigned int    lswstrlut16           : 5   ; // [9..5] 
        unsigned int    lswstrlut26           : 5   ; // [14..10] 
        unsigned int    lswstrlut36           : 5   ; // [19..15] 
        unsigned int    lswstrlut46           : 5   ; // [24..20] 
        unsigned int    lswstrlut56           : 5   ; // [29..25] 
        unsigned int    Reserved_286          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT6;

// Define the union U_VPSS_DRLSWSTRLUT7
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut07           : 5   ; // [4..0] 
        unsigned int    lswstrlut17           : 5   ; // [9..5] 
        unsigned int    lswstrlut27           : 5   ; // [14..10] 
        unsigned int    lswstrlut37           : 5   ; // [19..15] 
        unsigned int    lswstrlut47           : 5   ; // [24..20] 
        unsigned int    lswstrlut57           : 5   ; // [29..25] 
        unsigned int    Reserved_287          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT7;

// Define the union U_VPSS_DRLSWSTRLUT8
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lswstrlut08           : 5   ; // [4..0] 
        unsigned int    lswstrlut18           : 5   ; // [9..5] 
        unsigned int    lswstrlut28           : 5   ; // [14..10] 
        unsigned int    lswstrlut38           : 5   ; // [19..15] 
        unsigned int    lswstrlut48           : 5   ; // [24..20] 
        unsigned int    lswstrlut58           : 5   ; // [29..25] 
        unsigned int    Reserved_288          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRLUT8;

// Define the union U_VPSS_DRLRWSTRLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut00           : 5   ; // [4..0] 
        unsigned int    lrwstrlut10           : 5   ; // [9..5] 
        unsigned int    lrwstrlut20           : 5   ; // [14..10] 
        unsigned int    lrwstrlut30           : 5   ; // [19..15] 
        unsigned int    lrwstrlut40           : 5   ; // [24..20] 
        unsigned int    lrwstrlut50           : 5   ; // [29..25] 
        unsigned int    Reserved_289          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT0;

// Define the union U_VPSS_DRLRWSTRLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut01           : 5   ; // [4..0] 
        unsigned int    lrwstrlut11           : 5   ; // [9..5] 
        unsigned int    lrwstrlut21           : 5   ; // [14..10] 
        unsigned int    lrwstrlut31           : 5   ; // [19..15] 
        unsigned int    lrwstrlut41           : 5   ; // [24..20] 
        unsigned int    lrwstrlut51           : 5   ; // [29..25] 
        unsigned int    Reserved_290          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT1;

// Define the union U_VPSS_DRLRWSTRLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut02           : 5   ; // [4..0] 
        unsigned int    lrwstrlut12           : 5   ; // [9..5] 
        unsigned int    lrwstrlut22           : 5   ; // [14..10] 
        unsigned int    lrwstrlut32           : 5   ; // [19..15] 
        unsigned int    lrwstrlut42           : 5   ; // [24..20] 
        unsigned int    lrwstrlut52           : 5   ; // [29..25] 
        unsigned int    Reserved_291          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT2;

// Define the union U_VPSS_DRLRWSTRLUT3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut03           : 5   ; // [4..0] 
        unsigned int    lrwstrlut13           : 5   ; // [9..5] 
        unsigned int    lrwstrlut23           : 5   ; // [14..10] 
        unsigned int    lrwstrlut33           : 5   ; // [19..15] 
        unsigned int    lrwstrlut43           : 5   ; // [24..20] 
        unsigned int    lrwstrlut53           : 5   ; // [29..25] 
        unsigned int    Reserved_292          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT3;

// Define the union U_VPSS_DRLRWSTRLUT4
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut04           : 5   ; // [4..0] 
        unsigned int    lrwstrlut14           : 5   ; // [9..5] 
        unsigned int    lrwstrlut24           : 5   ; // [14..10] 
        unsigned int    lrwstrlut34           : 5   ; // [19..15] 
        unsigned int    lrwstrlut44           : 5   ; // [24..20] 
        unsigned int    lrwstrlut54           : 5   ; // [29..25] 
        unsigned int    Reserved_293          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT4;

// Define the union U_VPSS_DRLRWSTRLUT5
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut05           : 5   ; // [4..0] 
        unsigned int    lrwstrlut15           : 5   ; // [9..5] 
        unsigned int    lrwstrlut25           : 5   ; // [14..10] 
        unsigned int    lrwstrlut35           : 5   ; // [19..15] 
        unsigned int    lrwstrlut45           : 5   ; // [24..20] 
        unsigned int    lrwstrlut55           : 5   ; // [29..25] 
        unsigned int    Reserved_294          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT5;

// Define the union U_VPSS_DRLRWSTRLUT6
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut06           : 5   ; // [4..0] 
        unsigned int    lrwstrlut16           : 5   ; // [9..5] 
        unsigned int    lrwstrlut26           : 5   ; // [14..10] 
        unsigned int    lrwstrlut36           : 5   ; // [19..15] 
        unsigned int    lrwstrlut46           : 5   ; // [24..20] 
        unsigned int    lrwstrlut56           : 5   ; // [29..25] 
        unsigned int    Reserved_295          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT6;

// Define the union U_VPSS_DRLRWSTRLUT7
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut07           : 5   ; // [4..0] 
        unsigned int    lrwstrlut17           : 5   ; // [9..5] 
        unsigned int    lrwstrlut27           : 5   ; // [14..10] 
        unsigned int    lrwstrlut37           : 5   ; // [19..15] 
        unsigned int    lrwstrlut47           : 5   ; // [24..20] 
        unsigned int    lrwstrlut57           : 5   ; // [29..25] 
        unsigned int    Reserved_296          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT7;

// Define the union U_VPSS_DRLRWSTRLUT8
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    lrwstrlut08           : 5   ; // [4..0] 
        unsigned int    lrwstrlut18           : 5   ; // [9..5] 
        unsigned int    lrwstrlut28           : 5   ; // [14..10] 
        unsigned int    lrwstrlut38           : 5   ; // [19..15] 
        unsigned int    lrwstrlut48           : 5   ; // [24..20] 
        unsigned int    lrwstrlut58           : 5   ; // [29..25] 
        unsigned int    Reserved_297          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRLUT8;

// Define the union U_VPSS_DRLSWSTRADJUSTLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lswadjlut0         : 4   ; // [3..0] 
        unsigned int    dr_lswadjlut1         : 4   ; // [7..4] 
        unsigned int    dr_lswadjlut2         : 4   ; // [11..8] 
        unsigned int    Reserved_298          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRADJUSTLUT0;

// Define the union U_VPSS_DRLSWSTRADJUSTLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lswadjlut3         : 4   ; // [3..0] 
        unsigned int    dr_lswadjlut4         : 4   ; // [7..4] 
        unsigned int    dr_lswadjlut5         : 4   ; // [11..8] 
        unsigned int    Reserved_299          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRADJUSTLUT1;

// Define the union U_VPSS_DRLSWSTRADJUSTLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lswadjlut6         : 4   ; // [3..0] 
        unsigned int    dr_lswadjlut7         : 4   ; // [7..4] 
        unsigned int    dr_lswadjlut8         : 4   ; // [11..8] 
        unsigned int    Reserved_300          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLSWSTRADJUSTLUT2;

// Define the union U_VPSS_DRLRWSTRADJUSTLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lrwadjlut0         : 4   ; // [3..0] 
        unsigned int    dr_lrwadjlut1         : 4   ; // [7..4] 
        unsigned int    dr_lrwadjlut2         : 4   ; // [11..8] 
        unsigned int    Reserved_301          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRADJUSTLUT0;

// Define the union U_VPSS_DRLRWSTRADJUSTLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lrwadjlut3         : 4   ; // [3..0] 
        unsigned int    dr_lrwadjlut4         : 4   ; // [7..4] 
        unsigned int    dr_lrwadjlut5         : 4   ; // [11..8] 
        unsigned int    Reserved_302          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRADJUSTLUT1;

// Define the union U_VPSS_DRLRWSTRADJUSTLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_lrwadjlut6         : 4   ; // [3..0] 
        unsigned int    dr_lrwadjlut7         : 4   ; // [7..4] 
        unsigned int    dr_lrwadjlut8         : 4   ; // [11..8] 
        unsigned int    Reserved_303          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRLRWSTRADJUSTLUT2;

// Define the union U_VPSS_DRANGADJSUTLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angadjlut0         : 4   ; // [3..0] 
        unsigned int    dr_angadjlut1         : 4   ; // [7..4] 
        unsigned int    dr_angadjlut2         : 4   ; // [11..8] 
        unsigned int    Reserved_304          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGADJSUTLUT0;

// Define the union U_VPSS_DRANGADJSUTLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angadjlut3         : 4   ; // [3..0] 
        unsigned int    dr_angadjlut4         : 4   ; // [7..4] 
        unsigned int    dr_angadjlut5         : 4   ; // [11..8] 
        unsigned int    Reserved_305          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGADJSUTLUT1;

// Define the union U_VPSS_DRANGADJSUTLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angadjlut6         : 4   ; // [3..0] 
        unsigned int    dr_angadjlut7         : 4   ; // [7..4] 
        unsigned int    dr_angadjlut8         : 4   ; // [11..8] 
        unsigned int    Reserved_306          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGADJSUTLUT2;

// Define the union U_VPSS_DRANGLESTRLUT1_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angdifflut0        : 5   ; // [4..0] 
        unsigned int    dr_angdifflut1        : 5   ; // [9..5] 
        unsigned int    dr_angdifflut2        : 5   ; // [14..10] 
        unsigned int    dr_angdifflut3        : 5   ; // [19..15] 
        unsigned int    dr_angdifflut4        : 5   ; // [24..20] 
        unsigned int    dr_angdifflut5        : 5   ; // [29..25] 
        unsigned int    Reserved_307          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT1_0;

// Define the union U_VPSS_DRANGLESTRLUT1_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angdifflut6        : 5   ; // [4..0] 
        unsigned int    dr_angdifflut7        : 5   ; // [9..5] 
        unsigned int    dr_angdifflut8        : 5   ; // [14..10] 
        unsigned int    dr_angdifflut9        : 5   ; // [19..15] 
        unsigned int    dr_angdifflut10       : 5   ; // [24..20] 
        unsigned int    dr_angdifflut11       : 5   ; // [29..25] 
        unsigned int    Reserved_308          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT1_1;

// Define the union U_VPSS_DRANGLESTRLUT1_2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angdifflut12       : 5   ; // [4..0] 
        unsigned int    dr_angdifflut13       : 5   ; // [9..5] 
        unsigned int    dr_angdifflut14       : 5   ; // [14..10] 
        unsigned int    dr_angdifflut15       : 5   ; // [19..15] 
        unsigned int    dr_angdifflut16       : 5   ; // [24..20] 
        unsigned int    Reserved_309          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT1_2;

// Define the union U_VPSS_DRANGLESTRLUT2_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angminlut0         : 5   ; // [4..0] 
        unsigned int    dr_angminlut1         : 5   ; // [9..5] 
        unsigned int    dr_angminlut2         : 5   ; // [14..10] 
        unsigned int    dr_angminlut3         : 5   ; // [19..15] 
        unsigned int    dr_angminlut4         : 5   ; // [24..20] 
        unsigned int    dr_angminlut5         : 5   ; // [29..25] 
        unsigned int    Reserved_310          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT2_0;

// Define the union U_VPSS_DRANGLESTRLUT2_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angminlut6         : 5   ; // [4..0] 
        unsigned int    dr_angminlut7         : 5   ; // [9..5] 
        unsigned int    dr_angminlut8         : 5   ; // [14..10] 
        unsigned int    dr_angminlut9         : 5   ; // [19..15] 
        unsigned int    dr_angminlut10        : 5   ; // [24..20] 
        unsigned int    dr_angminlut11        : 5   ; // [29..25] 
        unsigned int    Reserved_311          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT2_1;

// Define the union U_VPSS_DRANGLESTRLUT2_2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_angminlut12        : 5   ; // [4..0] 
        unsigned int    dr_angminlut13        : 5   ; // [9..5] 
        unsigned int    dr_angminlut14        : 5   ; // [14..10] 
        unsigned int    dr_angminlut15        : 5   ; // [19..15] 
        unsigned int    dr_angminlut16        : 5   ; // [24..20] 
        unsigned int    Reserved_312          : 7   ; // [31..25] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DRANGLESTRLUT2_2;

// Define the union U_VPSS_DROVTSTRADJUSTLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovadjlut0          : 4   ; // [3..0] 
        unsigned int    dr_ovadjlut1          : 4   ; // [7..4] 
        unsigned int    dr_ovadjlut2          : 4   ; // [11..8] 
        unsigned int    Reserved_313          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRADJUSTLUT0;

// Define the union U_VPSS_DROVTSTRADJUSTLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovadjlut3          : 4   ; // [3..0] 
        unsigned int    dr_ovadjlut4          : 4   ; // [7..4] 
        unsigned int    dr_ovadjlut5          : 4   ; // [11..8] 
        unsigned int    Reserved_314          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRADJUSTLUT1;

// Define the union U_VPSS_DROVTSTRADJUSTLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovadjlut6          : 4   ; // [3..0] 
        unsigned int    dr_ovadjlut7          : 4   ; // [7..4] 
        unsigned int    dr_ovadjlut8          : 4   ; // [11..8] 
        unsigned int    Reserved_315          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRADJUSTLUT2;

// Define the union U_VPSS_DROVTSTRLUT0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovstrlut0          : 4   ; // [3..0] 
        unsigned int    dr_ovstrlut1          : 4   ; // [7..4] 
        unsigned int    dr_ovstrlut2          : 4   ; // [11..8] 
        unsigned int    Reserved_316          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRLUT0;

// Define the union U_VPSS_DROVTSTRLUT1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovstrlut3          : 4   ; // [3..0] 
        unsigned int    dr_ovstrlut4          : 4   ; // [7..4] 
        unsigned int    dr_ovstrlut5          : 4   ; // [11..8] 
        unsigned int    Reserved_317          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRLUT1;

// Define the union U_VPSS_DROVTSTRLUT2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dr_ovstrlut6          : 4   ; // [3..0] 
        unsigned int    dr_ovstrlut7          : 4   ; // [7..4] 
        unsigned int    dr_ovstrlut8          : 4   ; // [11..8] 
        unsigned int    Reserved_318          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_DROVTSTRLUT2;

// Define the union U_VPSS_VC1_CTRL0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    fr0_vc1_profile       : 2   ; // [1..0] 
        unsigned int    fr0_vc1_rangedfrm     : 1   ; // [2] 
        unsigned int    fr0_vc1_mapyflg       : 1   ; // [3] 
        unsigned int    fr0_vc1_mapcflg       : 1   ; // [4] 
        unsigned int    Reserved_321          : 3   ; // [7..5] 
        unsigned int    fr0_vc1_mapy          : 3   ; // [10..8] 
        unsigned int    Reserved_320          : 1   ; // [11] 
        unsigned int    fr0_vc1_mapc          : 3   ; // [14..12] 
        unsigned int    Reserved_319          : 16  ; // [30..15] 
        unsigned int    fr0_vc1_en            : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VC1_CTRL0;

// Define the union U_VPSS_VC1_CTRL1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    fr1_vc1_profile       : 2   ; // [1..0] 
        unsigned int    fr1_vc1_rangedfrm     : 1   ; // [2] 
        unsigned int    fr1_vc1_mapyflg       : 1   ; // [3] 
        unsigned int    fr1_vc1_mapcflg       : 1   ; // [4] 
        unsigned int    Reserved_325          : 3   ; // [7..5] 
        unsigned int    fr1_vc1_mapy          : 3   ; // [10..8] 
        unsigned int    Reserved_324          : 1   ; // [11] 
        unsigned int    fr1_vc1_mapc          : 3   ; // [14..12] 
        unsigned int    Reserved_323          : 16  ; // [30..15] 
        unsigned int    fr1_vc1_en            : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VC1_CTRL1;

// Define the union U_VPSS_VC1_CTRL2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    fr2_vc1_profile       : 2   ; // [1..0] 
        unsigned int    fr2_vc1_rangedfrm     : 1   ; // [2] 
        unsigned int    fr2_vc1_mapyflg       : 1   ; // [3] 
        unsigned int    fr2_vc1_mapcflg       : 1   ; // [4] 
        unsigned int    Reserved_328          : 3   ; // [7..5] 
        unsigned int    fr2_vc1_mapy          : 3   ; // [10..8] 
        unsigned int    Reserved_327          : 1   ; // [11] 
        unsigned int    fr2_vc1_mapc          : 3   ; // [14..12] 
        unsigned int    Reserved_326          : 16  ; // [30..15] 
        unsigned int    fr2_vc1_en            : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_VC1_CTRL2;

// Define the union U_STR_DET_VIDCTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_330          : 30  ; // [29..0] 
        unsigned int    vid_mode              : 1   ; // [30] 
        unsigned int    Reserved_329          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDCTRL;

// Define the union U_STR_DET_VIDBLKPOS0_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk0_xlpos            : 8   ; // [7..0] 
        unsigned int    blk0_ylpos            : 8   ; // [15..8] 
        unsigned int    blk1_xlpos            : 8   ; // [23..16] 
        unsigned int    blk1_ylpos            : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLKPOS0_1;

// Define the union U_STR_DET_VIDBLKPOS2_3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk2_xlpos            : 8   ; // [7..0] 
        unsigned int    blk2_ylpos            : 8   ; // [15..8] 
        unsigned int    blk3_xlpos            : 8   ; // [23..16] 
        unsigned int    blk3_ylpos            : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLKPOS2_3;

// Define the union U_STR_DET_VIDBLKPOS4_5
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    blk4_xlpos            : 8   ; // [7..0] 
        unsigned int    blk4_ylpos            : 8   ; // [15..8] 
        unsigned int    blk5_xlpos            : 8   ; // [23..16] 
        unsigned int    blk5_ylpos            : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_STR_DET_VIDBLKPOS4_5;

// Define the union U_ES_MODE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    mk_en                 : 1   ; // [0] 
        unsigned int    mk_mode               : 1   ; // [1] 
        unsigned int    Reserved_332          : 22  ; // [23..2] 
        unsigned int    blend_mode            : 1   ; // [24] 
        unsigned int    edge_strength_mode    : 1   ; // [25] 
        unsigned int    alter_dir_en          : 1   ; // [26] 
        unsigned int    check2_en             : 1   ; // [27] 
        unsigned int    check1_en             : 1   ; // [28] 
        unsigned int    dir_mode              : 1   ; // [29] 
        unsigned int    interlaced_proc       : 1   ; // [30] 
        unsigned int    edge_smooth_en        : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_MODE;

// Define the union U_ES_DIR_RATIO_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir_ratio_0           : 4   ; // [3..0] 
        unsigned int    dir_ratio_1           : 4   ; // [7..4] 
        unsigned int    dir_ratio_2           : 4   ; // [11..8] 
        unsigned int    dir_ratio_3           : 4   ; // [15..12] 
        unsigned int    dir_ratio_4           : 4   ; // [19..16] 
        unsigned int    dir_ratio_5           : 4   ; // [23..20] 
        unsigned int    dir_ratio_6           : 4   ; // [27..24] 
        unsigned int    dir_ratio_7           : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_DIR_RATIO_0;

// Define the union U_ES_DIR_RATIO_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    dir_ratio_8           : 4   ; // [3..0] 
        unsigned int    Reserved_334          : 28  ; // [31..4] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_DIR_RATIO_1;

// Define the union U_ES_NORMALIZED_SCALE_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    normalized_scale_0    : 6   ; // [5..0] 
        unsigned int    normalized_scale_1    : 6   ; // [11..6] 
        unsigned int    normalized_scale_2    : 6   ; // [17..12] 
        unsigned int    normalized_scale_3    : 6   ; // [23..18] 
        unsigned int    normalized_scale_4    : 6   ; // [29..24] 
        unsigned int    Reserved_335          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_NORMALIZED_SCALE_0;

// Define the union U_ES_NORMALIZED_SCALE_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    normalized_scale_5    : 6   ; // [5..0] 
        unsigned int    normalized_scale_6    : 6   ; // [11..6] 
        unsigned int    normalized_scale_7    : 6   ; // [17..12] 
        unsigned int    normalized_scale_8    : 6   ; // [23..18] 
        unsigned int    Reserved_336          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_NORMALIZED_SCALE_1;

// Define the union U_ES_BC1_CFG
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    check1_deadzone       : 6   ; // [5..0] 
        unsigned int    check1_autodz_gain    : 6   ; // [11..6] 
        unsigned int    check1_gain           : 6   ; // [17..12] 
        unsigned int    chech1_dir_diff_gain  : 8   ; // [25..18] 
        unsigned int    Reserved_337          : 6   ; // [31..26] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_BC1_CFG;

// Define the union U_ES_BC2_CFG
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    check2_deadzone       : 6   ; // [5..0] 
        unsigned int    check2_autodz_gain    : 6   ; // [11..6] 
        unsigned int    check2_gain           : 6   ; // [17..12] 
        unsigned int    Reserved_338          : 14  ; // [31..18] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_BC2_CFG;

// Define the union U_ES_BC_CFG
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    check_gain            : 8   ; // [7..0] 
        unsigned int    Reserved_339          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_BC_CFG;

// Define the union U_ES_RATIO_LIMIT_SCALE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ratio_limit_scale     : 8   ; // [7..0] 
        unsigned int    Reserved_340          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_RATIO_LIMIT_SCALE;

// Define the union U_ES_VER_MIN_STRENGTH
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ver_min_strength      : 16  ; // [15..0] 
        unsigned int    Reserved_341          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_VER_MIN_STRENGTH;

// Define the union U_ES_EDGE_SMOOTH_GAIN
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_smooth_gain      : 8   ; // [7..0] 
        unsigned int    Reserved_342          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SMOOTH_GAIN;

// Define the union U_ES_EDGE_THD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_thd_0            : 8   ; // [7..0] 
        unsigned int    edge_thd_1            : 8   ; // [15..8] 
        unsigned int    edge_thd_2            : 8   ; // [23..16] 
        unsigned int    edge_thd_3            : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_THD;

// Define the union U_ES_EDGE_SMOOTH_RATIO_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_smooth_ratio_0   : 8   ; // [7..0] 
        unsigned int    edge_smooth_ratio_1   : 8   ; // [15..8] 
        unsigned int    edge_smooth_ratio_2   : 8   ; // [23..16] 
        unsigned int    edge_smooth_ratio_3   : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SMOOTH_RATIO_0;

// Define the union U_ES_EDGE_SMOOTH_RATIO_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_smooth_ratio_4   : 8   ; // [7..0] 
        unsigned int    Reserved_343          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SMOOTH_RATIO_1;

// Define the union U_ES_EDGE_SLOPE_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_slope_0          : 11  ; // [10..0] 
        unsigned int    edge_slope_1          : 11  ; // [21..11] 
        unsigned int    Reserved_344          : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SLOPE_0;

// Define the union U_ES_EDGE_SLOPE_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_slope_2          : 11  ; // [10..0] 
        unsigned int    edge_slope_3          : 11  ; // [21..11] 
        unsigned int    Reserved_345          : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SLOPE_1;

// Define the union U_ES_EDGE_SLOPE_2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_slope_4          : 11  ; // [10..0] 
        unsigned int    Reserved_346          : 21  ; // [31..11] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_ES_EDGE_SLOPE_2;

// Define the union U_ES_STATUS_0
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int status                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ES_STATUS_0;
// Define the union U_ES_STATUS_1
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int status                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ES_STATUS_1;
// Define the union U_ES_STATUS_2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int status                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_ES_STATUS_2;
// Define the union U_VPSS_SNR_ENABLE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_348          : 1   ; // [0] 
        unsigned int    ynr2den               : 1   ; // [1] 
        unsigned int    cnr2den               : 1   ; // [2] 
        unsigned int    motionedgeweighten    : 1   ; // [3] 
        unsigned int    colorweighten         : 1   ; // [4] 
        unsigned int    edgeprefilteren       : 1   ; // [5] 
        unsigned int    marketen              : 1   ; // [6] 
        unsigned int    test_en               : 1   ; // [7] 
        unsigned int    market_mux            : 1   ; // [8] 
        unsigned int    Reserved_347          : 23  ; // [31..9] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_ENABLE;

// Define the union U_VPSS_SNR_EDGE_RATIORANGE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemaxratio          : 4   ; // [3..0] 
        unsigned int    edgeminratio          : 4   ; // [7..4] 
        unsigned int    edgeoriratio          : 4   ; // [11..8] 
        unsigned int    Reserved_350          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_RATIORANGE;

// Define the union U_VPSS_SNR_EDGE_STRRANGE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemaxstrength       : 4   ; // [3..0] 
        unsigned int    edgeminstrength       : 4   ; // [7..4] 
        unsigned int    edgeoristrength       : 4   ; // [11..8] 
        unsigned int    Reserved_351          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_STRRANGE;

// Define the union U_VPSS_SNR_EDGE_STRTH
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgestrth1            : 10  ; // [9..0] 
        unsigned int    edgestrth2            : 10  ; // [19..10] 
        unsigned int    edgestrth3            : 10  ; // [29..20] 
        unsigned int    Reserved_352          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_STRTH;

// Define the union U_VPSS_SNR_EDGE_STRK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgestrk1             : 6   ; // [5..0] 
        unsigned int    edgestrk2             : 6   ; // [11..6] 
        unsigned int    edgestrk3             : 6   ; // [17..12] 
        unsigned int    Reserved_353          : 14  ; // [31..18] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_STRK;

// Define the union U_VPSS_SNR_EDGE_MEANTH1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemeanth1           : 10  ; // [9..0] 
        unsigned int    edgemeanth2           : 10  ; // [19..10] 
        unsigned int    edgemeanth3           : 10  ; // [29..20] 
        unsigned int    Reserved_354          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_MEANTH1;

// Define the union U_VPSS_SNR_EDGE_MEANTH2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemeanth4           : 10  ; // [9..0] 
        unsigned int    edgemeanth5           : 10  ; // [19..10] 
        unsigned int    edgemeanth6           : 10  ; // [29..20] 
        unsigned int    Reserved_355          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_MEANTH2;

// Define the union U_VPSS_SNR_EDGE_MEANTH3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemeanth7           : 10  ; // [9..0] 
        unsigned int    edgemeanth8           : 10  ; // [19..10] 
        unsigned int    Reserved_356          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_MEANTH3;

// Define the union U_VPSS_SNR_EDGE_MEANK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemeank1            : 6   ; // [5..0] 
        unsigned int    edgemeank2            : 6   ; // [11..6] 
        unsigned int    edgemeank3            : 6   ; // [17..12] 
        unsigned int    edgemeank4            : 6   ; // [23..18] 
        unsigned int    Reserved_357          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_MEANK1;

// Define the union U_VPSS_SNR_EDGE_MEANK2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edgemeank5            : 6   ; // [5..0] 
        unsigned int    edgemeank6            : 6   ; // [11..6] 
        unsigned int    edgemeank7            : 6   ; // [17..12] 
        unsigned int    edgemeank8            : 6   ; // [23..18] 
        unsigned int    Reserved_358          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_MEANK2;

// Define the union U_VPSS_SNR_WIN
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    y2dwinwidth           : 5   ; // [4..0] 
        unsigned int    y2dwinheight          : 4   ; // [8..5] 
        unsigned int    c2dwinwidth           : 4   ; // [12..9] 
        unsigned int    c2dwinheight          : 2   ; // [14..13] 
        unsigned int    Reserved_359          : 17  ; // [31..15] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_WIN;

// Define the union U_VPSS_SNR_STR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ysnrstr               : 8   ; // [7..0] 
        unsigned int    csnrstr               : 8   ; // [15..8] 
        unsigned int    Reserved_360          : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_STR;

// Define the union U_VPSS_SNR_STR_OFFSET
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    stroffset0            : 2   ; // [1..0] 
        unsigned int    stroffset1            : 2   ; // [3..2] 
        unsigned int    stroffset2            : 2   ; // [5..4] 
        unsigned int    stroffset3            : 2   ; // [7..6] 
        unsigned int    Reserved_361          : 24  ; // [31..8] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_STR_OFFSET;

// Define the union U_VPSS_SNR_STR_ADJUST
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ystradjust            : 6   ; // [5..0] 
        unsigned int    cstradjust            : 6   ; // [11..6] 
        unsigned int    Reserved_362          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_STR_ADJUST;

// Define the union U_VPSS_SNR_SCHANGE_TH
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    scenechangeth         : 4   ; // [3..0] 
        unsigned int    Reserved_363          : 28  ; // [31..4] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_SCHANGE_TH;

// Define the union U_VPSS_SNR_EDGE_RATIO_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ratio1                : 9   ; // [8..0] 
        unsigned int    ratio2                : 9   ; // [17..9] 
        unsigned int    ratio3                : 9   ; // [26..18] 
        unsigned int    Reserved_364          : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_RATIO_1;

// Define the union U_VPSS_SNR_EDGE_RATIO_2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ratio4                : 9   ; // [8..0] 
        unsigned int    ratio5                : 9   ; // [17..9] 
        unsigned int    ratio6                : 9   ; // [26..18] 
        unsigned int    Reserved_365          : 5   ; // [31..27] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_RATIO_2;

// Define the union U_VPSS_SNR_EDGE_RATIO_3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ratio7                : 9   ; // [8..0] 
        unsigned int    ratio8                : 9   ; // [17..9] 
        unsigned int    Reserved_366          : 14  ; // [31..18] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_RATIO_3;

// Define the union U_VPSS_SNR_EDGE_STR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge1                 : 4   ; // [3..0] 
        unsigned int    edge2                 : 4   ; // [7..4] 
        unsigned int    edge3                 : 4   ; // [11..8] 
        unsigned int    Reserved_367          : 20  ; // [31..12] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_EDGE_STR;

// Define the union U_VPSS_SNR_TEST_COLOR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    test_color_cb         : 10  ; // [9..0] 
        unsigned int    test_color_cr         : 10  ; // [19..10] 
        unsigned int    Reserved_368          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_TEST_COLOR;

// Define the union U_VPSS_SNR_SCHANGE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    scenechange_info      : 8   ; // [7..0] 
        unsigned int    scenechange_en        : 1   ; // [8] 
        unsigned int    scenechange_mode1_en  : 1   ; // [9] 
        unsigned int    scenechange_bldk      : 10  ; // [19..10] 
        unsigned int    scenechange_bldcore   : 10  ; // [29..20] 
        unsigned int    scenechange_mode2_en  : 1   ; // [30] 
        unsigned int    Reserved_369          : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_SNR_SCHANGE;

// Define the union U_MOTION_EDGE_LUT_01
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_01      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_01;
// Define the union U_MOTION_EDGE_LUT_02
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_02      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_02;
// Define the union U_MOTION_EDGE_LUT_03
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_03      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_03;
// Define the union U_MOTION_EDGE_LUT_04
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_04      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_04;
// Define the union U_MOTION_EDGE_LUT_05
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_05      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_05;
// Define the union U_MOTION_EDGE_LUT_06
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_06      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_06;
// Define the union U_MOTION_EDGE_LUT_07
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_07      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_07;
// Define the union U_MOTION_EDGE_LUT_08
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_08      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_08;
// Define the union U_MOTION_EDGE_LUT_09
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_09      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_09;
// Define the union U_MOTION_EDGE_LUT_10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_10      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_10;
// Define the union U_MOTION_EDGE_LUT_11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_11      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_11;
// Define the union U_MOTION_EDGE_LUT_12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_12      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_12;
// Define the union U_MOTION_EDGE_LUT_13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_13      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_13;
// Define the union U_MOTION_EDGE_LUT_14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_14      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_14;
// Define the union U_MOTION_EDGE_LUT_15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_15      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_15;
// Define the union U_MOTION_EDGE_LUT_16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_16      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_16;
// Define the union U_MOTION_EDGE_LUT_17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_17      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_17;
// Define the union U_MOTION_EDGE_LUT_18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_18      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_18;
// Define the union U_MOTION_EDGE_LUT_19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_19      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_19;
// Define the union U_MOTION_EDGE_LUT_20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_20      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_20;
// Define the union U_MOTION_EDGE_LUT_21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_21      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_21;
// Define the union U_MOTION_EDGE_LUT_22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_22      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_22;
// Define the union U_MOTION_EDGE_LUT_23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_23      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_23;
// Define the union U_MOTION_EDGE_LUT_24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_24      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_24;
// Define the union U_MOTION_EDGE_LUT_25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_25      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_25;
// Define the union U_MOTION_EDGE_LUT_26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_26      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_26;
// Define the union U_MOTION_EDGE_LUT_27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_27      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_27;
// Define the union U_MOTION_EDGE_LUT_28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_28      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_28;
// Define the union U_MOTION_EDGE_LUT_29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_29      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_29;
// Define the union U_MOTION_EDGE_LUT_30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_30      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_30;
// Define the union U_MOTION_EDGE_LUT_31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_31      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_31;
// Define the union U_MOTION_EDGE_LUT_32
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int motion_edge_lut_32      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_MOTION_EDGE_LUT_32;
// Define the union U_COLOR_BASED_LUT_01
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_01      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_01;
// Define the union U_COLOR_BASED_LUT_02
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_02      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_02;
// Define the union U_COLOR_BASED_LUT_03
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_03      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_03;
// Define the union U_COLOR_BASED_LUT_04
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_04      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_04;
// Define the union U_COLOR_BASED_LUT_05
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_05      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_05;
// Define the union U_COLOR_BASED_LUT_06
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_06      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_06;
// Define the union U_COLOR_BASED_LUT_07
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_07      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_07;
// Define the union U_COLOR_BASED_LUT_08
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_08      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_08;
// Define the union U_COLOR_BASED_LUT_09
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_09      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_09;
// Define the union U_COLOR_BASED_LUT_10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_10      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_10;
// Define the union U_COLOR_BASED_LUT_11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_11      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_11;
// Define the union U_COLOR_BASED_LUT_12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_12      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_12;
// Define the union U_COLOR_BASED_LUT_13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_13      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_13;
// Define the union U_COLOR_BASED_LUT_14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_14      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_14;
// Define the union U_COLOR_BASED_LUT_15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_15      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_15;
// Define the union U_COLOR_BASED_LUT_16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_16      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_16;
// Define the union U_COLOR_BASED_LUT_17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_17      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_17;
// Define the union U_COLOR_BASED_LUT_18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_18      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_18;
// Define the union U_COLOR_BASED_LUT_19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_19      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_19;
// Define the union U_COLOR_BASED_LUT_20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_20      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_20;
// Define the union U_COLOR_BASED_LUT_21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_21      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_21;
// Define the union U_COLOR_BASED_LUT_22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_22      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_22;
// Define the union U_COLOR_BASED_LUT_23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_23      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_23;
// Define the union U_COLOR_BASED_LUT_24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_24      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_24;
// Define the union U_COLOR_BASED_LUT_25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_25      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_25;
// Define the union U_COLOR_BASED_LUT_26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_26      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_26;
// Define the union U_COLOR_BASED_LUT_27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_27      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_27;
// Define the union U_COLOR_BASED_LUT_28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_28      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_28;
// Define the union U_COLOR_BASED_LUT_29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_29      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_29;
// Define the union U_COLOR_BASED_LUT_30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_30      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_30;
// Define the union U_COLOR_BASED_LUT_31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_31      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_31;
// Define the union U_COLOR_BASED_LUT_32
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int color_based_lut_32      : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_COLOR_BASED_LUT_32;
// Define the union U_VPSS_TNR_MODE
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_lpf_mode           : 2   ; // [1..0] 
        unsigned int    te_ylpf_mode          : 2   ; // [3..2] 
        unsigned int    te_clpf_mode          : 2   ; // [5..4] 
        unsigned int    tm_ymt_mean_mode      : 2   ; // [7..6] 
        unsigned int    tm_cmt_mean_mode      : 2   ; // [9..8] 
        unsigned int    tm_ymt_mode           : 2   ; // [11..10] 
        unsigned int    tm_cmt_mode           : 2   ; // [13..12] 
        unsigned int    te_yeg_mean_mode      : 2   ; // [15..14] 
        unsigned int    te_ceg_mean_mode      : 2   ; // [17..16] 
        unsigned int    te_yceg_mode          : 3   ; // [20..18] 
        unsigned int    tfm_lpf_en            : 1   ; // [21] 
        unsigned int    edge_ymoving_lpfmode  : 2   ; // [23..22] 
        unsigned int    edge_cmoving_lpfmode  : 2   ; // [25..24] 
        unsigned int    hist_motion_en        : 1   ; // [26] 
        unsigned int    tnr_c_bypass          : 1   ; // [27] 
        unsigned int    tnr_y_bypass          : 1   ; // [28] 
        unsigned int    Reserved_371          : 1   ; // [29] 
        unsigned int    market_mode           : 1   ; // [30] 
        unsigned int    market_en             : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_MODE;

// Define the union U_VPSS_TNR_YMOTION_MAP_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_min    : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_max    : 10  ; // [19..10] 
        unsigned int    Reserved_373          : 11  ; // [30..20] 
        unsigned int    tm_ymt_meanratio_en   : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_CTRL;

// Define the union U_VPSS_TNR_YMOTION_MAP_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_r0     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_r1     : 10  ; // [19..10] 
        unsigned int    tm_ymt_mapping_r2     : 10  ; // [29..20] 
        unsigned int    Reserved_374          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_R0;

// Define the union U_VPSS_TNR_YMOTION_MAP_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_r3     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_r4     : 10  ; // [19..10] 
        unsigned int    Reserved_375          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_R1;

// Define the union U_VPSS_TNR_YMOTION_MAP_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_t1     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_t2     : 10  ; // [19..10] 
        unsigned int    tm_ymt_mapping_t3     : 10  ; // [29..20] 
        unsigned int    Reserved_376          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_T1;

// Define the union U_VPSS_TNR_YMOTION_MAP_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_t4     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_t5     : 10  ; // [19..10] 
        unsigned int    tm_ymt_mapping_t6     : 10  ; // [29..20] 
        unsigned int    Reserved_377          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_T2;

// Define the union U_VPSS_TNR_YMOTION_MAP_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_k1     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_k2     : 10  ; // [19..10] 
        unsigned int    Reserved_378          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_K1;

// Define the union U_VPSS_TNR_YMOTION_MAP_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_mapping_k3     : 10  ; // [9..0] 
        unsigned int    tm_ymt_mapping_k4     : 10  ; // [19..10] 
        unsigned int    Reserved_379          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MAP_K2;

// Define the union U_VPSS_TNR_CMOTION_MAP_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_min    : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_max    : 10  ; // [19..10] 
        unsigned int    Reserved_380          : 11  ; // [30..20] 
        unsigned int    tm_cmt_meanratio_en   : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_CTRL;

// Define the union U_VPSS_TNR_CMOTION_MAP_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_r0     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_r1     : 10  ; // [19..10] 
        unsigned int    tm_cmt_mapping_r2     : 10  ; // [29..20] 
        unsigned int    Reserved_381          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_R0;

// Define the union U_VPSS_TNR_CMOTION_MAP_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_r3     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_r4     : 10  ; // [19..10] 
        unsigned int    Reserved_382          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_R1;

// Define the union U_VPSS_TNR_CMOTION_MAP_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_t1     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_t2     : 10  ; // [19..10] 
        unsigned int    tm_cmt_mapping_t3     : 10  ; // [29..20] 
        unsigned int    Reserved_383          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_T1;

// Define the union U_VPSS_TNR_CMOTION_MAP_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_t4     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_t5     : 10  ; // [19..10] 
        unsigned int    tm_cmt_mapping_t6     : 10  ; // [29..20] 
        unsigned int    Reserved_384          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_T2;

// Define the union U_VPSS_TNR_CMOTION_MAP_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_k1     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_k2     : 10  ; // [19..10] 
        unsigned int    Reserved_385          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_K1;

// Define the union U_VPSS_TNR_CMOTION_MAP_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_mapping_k3     : 10  ; // [9..0] 
        unsigned int    tm_cmt_mapping_k4     : 10  ; // [19..10] 
        unsigned int    Reserved_386          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MAP_K2;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_min  : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_max  : 10  ; // [19..10] 
        unsigned int    Reserved_387          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_CTRL;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_r0   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_r1   : 10  ; // [19..10] 
        unsigned int    tm_ymt_meanratio_r2   : 10  ; // [29..20] 
        unsigned int    Reserved_388          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_R0;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_r3   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_r4   : 10  ; // [19..10] 
        unsigned int    Reserved_389          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_R1;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_t1   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_t2   : 10  ; // [19..10] 
        unsigned int    tm_ymt_meanratio_t3   : 10  ; // [29..20] 
        unsigned int    Reserved_390          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_T1;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_t4   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_t5   : 10  ; // [19..10] 
        unsigned int    tm_ymt_meanratio_t6   : 10  ; // [29..20] 
        unsigned int    Reserved_391          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_T2;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_k1   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_k2   : 10  ; // [19..10] 
        unsigned int    Reserved_392          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_K1;

// Define the union U_VPSS_TNR_YMOTION_MEANRATIO_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_meanratio_k3   : 10  ; // [9..0] 
        unsigned int    tm_ymt_meanratio_k4   : 10  ; // [19..10] 
        unsigned int    Reserved_393          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_YMOTION_MEANRATIO_K2;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_min  : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_max  : 10  ; // [19..10] 
        unsigned int    Reserved_394          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_CTRL;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_r0   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_r1   : 10  ; // [19..10] 
        unsigned int    tm_cmt_meanratio_r2   : 10  ; // [29..20] 
        unsigned int    Reserved_395          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_R0;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_r3   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_r4   : 10  ; // [19..10] 
        unsigned int    Reserved_396          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_R1;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_t1   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_t2   : 10  ; // [19..10] 
        unsigned int    tm_cmt_meanratio_t3   : 10  ; // [29..20] 
        unsigned int    Reserved_397          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_T1;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_t4   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_t5   : 10  ; // [19..10] 
        unsigned int    tm_cmt_meanratio_t6   : 10  ; // [29..20] 
        unsigned int    Reserved_398          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_T2;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_k1   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_k2   : 10  ; // [19..10] 
        unsigned int    Reserved_399          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_K1;

// Define the union U_VPSS_TNR_CMOTION_MEANRATIO_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_meanratio_k3   : 10  ; // [9..0] 
        unsigned int    tm_cmt_meanratio_k4   : 10  ; // [19..10] 
        unsigned int    Reserved_400          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CMOTION_MEANRATIO_K2;

// Define the union U_VPSS_TNR_TM_YCMTCOEF
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ycmtcoef0          : 6   ; // [5..0] 
        unsigned int    tm_ycmtcoef1          : 6   ; // [11..6] 
        unsigned int    tm_ycmtcoef2          : 6   ; // [17..12] 
        unsigned int    tm_ycmtcoef3          : 6   ; // [23..18] 
        unsigned int    tm_ycmtcoef4          : 6   ; // [29..24] 
        unsigned int    Reserved_401          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_YCMTCOEF;

// Define the union U_VPSS_TNR_TM_YCLPFCOEF
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_yclpfcoef0         : 6   ; // [5..0] 
        unsigned int    tm_yclpfcoef1         : 6   ; // [11..6] 
        unsigned int    tm_yclpfcoef2         : 6   ; // [17..12] 
        unsigned int    tm_yclpfcoef3         : 6   ; // [23..18] 
        unsigned int    tm_yclpfcoef4         : 6   ; // [29..24] 
        unsigned int    Reserved_402          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_YCLPFCOEF;

// Define the union U_VPSS_TNR_TE_YHPF1_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf1coef0         : 4   ; // [3..0] 
        unsigned int    te_yhpf1coef1         : 4   ; // [7..4] 
        unsigned int    te_yhpf1coef2         : 4   ; // [11..8] 
        unsigned int    te_yhpf1coef3         : 4   ; // [15..12] 
        unsigned int    te_yhpf1coef4         : 4   ; // [19..16] 
        unsigned int    te_yhpf1coef5         : 4   ; // [23..20] 
        unsigned int    te_yhpf1coef6         : 4   ; // [27..24] 
        unsigned int    te_yhpf1coef7         : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF1_0;

// Define the union U_VPSS_TNR_TE_YHPF1_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf1coef8         : 4   ; // [3..0] 
        unsigned int    te_yhpf1lshiift       : 3   ; // [6..4] 
        unsigned int    Reserved_403          : 25  ; // [31..7] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF1_1;

// Define the union U_VPSS_TNR_TE_YHPF2_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf2coef0         : 4   ; // [3..0] 
        unsigned int    te_yhpf2coef1         : 4   ; // [7..4] 
        unsigned int    te_yhpf2coef2         : 4   ; // [11..8] 
        unsigned int    te_yhpf2coef3         : 4   ; // [15..12] 
        unsigned int    te_yhpf2coef4         : 4   ; // [19..16] 
        unsigned int    te_yhpf2coef5         : 4   ; // [23..20] 
        unsigned int    te_yhpf2coef6         : 4   ; // [27..24] 
        unsigned int    te_yhpf2coef7         : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF2_0;

// Define the union U_VPSS_TNR_TE_YHPF2_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf2coef8         : 4   ; // [3..0] 
        unsigned int    te_yhpf2lshiift       : 3   ; // [6..4] 
        unsigned int    Reserved_404          : 25  ; // [31..7] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF2_1;

// Define the union U_VPSS_TNR_TE_YHPF3_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf3coef0         : 4   ; // [3..0] 
        unsigned int    te_yhpf3coef1         : 4   ; // [7..4] 
        unsigned int    te_yhpf3coef2         : 4   ; // [11..8] 
        unsigned int    te_yhpf3coef3         : 4   ; // [15..12] 
        unsigned int    te_yhpf3coef4         : 4   ; // [19..16] 
        unsigned int    te_yhpf3coef5         : 4   ; // [23..20] 
        unsigned int    te_yhpf3coef6         : 4   ; // [27..24] 
        unsigned int    te_yhpf3coef7         : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF3_0;

// Define the union U_VPSS_TNR_TE_YHPF3_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf3coef8         : 4   ; // [3..0] 
        unsigned int    te_yhpf3lshiift       : 3   ; // [6..4] 
        unsigned int    Reserved_405          : 25  ; // [31..7] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF3_1;

// Define the union U_VPSS_TNR_TE_YHPF4_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf4coef0         : 4   ; // [3..0] 
        unsigned int    te_yhpf4coef1         : 4   ; // [7..4] 
        unsigned int    te_yhpf4coef2         : 4   ; // [11..8] 
        unsigned int    te_yhpf4coef3         : 4   ; // [15..12] 
        unsigned int    te_yhpf4coef4         : 4   ; // [19..16] 
        unsigned int    te_yhpf4coef5         : 4   ; // [23..20] 
        unsigned int    te_yhpf4coef6         : 4   ; // [27..24] 
        unsigned int    te_yhpf4coef7         : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF4_0;

// Define the union U_VPSS_TNR_TE_YHPF4_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yhpf4coef8         : 4   ; // [3..0] 
        unsigned int    te_yhpf4lshiift       : 3   ; // [6..4] 
        unsigned int    Reserved_406          : 25  ; // [31..7] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YHPF4_1;

// Define the union U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymtmeanlpfcoef0    : 6   ; // [5..0] 
        unsigned int    te_ymtmeanlpfcoef1    : 6   ; // [11..6] 
        unsigned int    te_ymtmeanlpfcoef2    : 6   ; // [17..12] 
        unsigned int    te_ymtmeanlpfcoef3    : 6   ; // [23..18] 
        unsigned int    te_ymtmeanlpfcoef4    : 6   ; // [29..24] 
        unsigned int    Reserved_407          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_0;

// Define the union U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymtmeanlpfcoef5    : 6   ; // [5..0] 
        unsigned int    te_ymtmeanlpfcoef6    : 6   ; // [11..6] 
        unsigned int    te_ymtmeanlpfcoef7    : 6   ; // [17..12] 
        unsigned int    te_ymtmeanlpfcoef8    : 6   ; // [23..18] 
        unsigned int    Reserved_408          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_1;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_min  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_max  : 10  ; // [19..10] 
        unsigned int    Reserved_409          : 11  ; // [30..20] 
        unsigned int    te_yceg_meanratio_en  : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_CTRL;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_r0  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_r1  : 10  ; // [19..10] 
        unsigned int    te_yceg_meanratio_r2  : 10  ; // [29..20] 
        unsigned int    Reserved_410          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_R0;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_r3  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_r4  : 10  ; // [19..10] 
        unsigned int    Reserved_411          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_R1;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_t1  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_t2  : 10  ; // [19..10] 
        unsigned int    te_yceg_meanratio_t3  : 10  ; // [29..20] 
        unsigned int    Reserved_412          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_T1;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_t4  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_t5  : 10  ; // [19..10] 
        unsigned int    te_yceg_meanratio_t6  : 10  ; // [29..20] 
        unsigned int    Reserved_413          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_T2;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_k1  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_k2  : 10  ; // [19..10] 
        unsigned int    Reserved_414          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_K1;

// Define the union U_VPSS_TNR_TE_YCEG_MEANRATIO_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_meanratio_k3  : 10  ; // [9..0] 
        unsigned int    te_yceg_meanratio_k4  : 10  ; // [19..10] 
        unsigned int    Reserved_415          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MEANRATIO_K2;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_min  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_max  : 10  ; // [19..10] 
        unsigned int    Reserved_416          : 11  ; // [30..20] 
        unsigned int    te_ycmt_meanratio_en  : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_CTRL;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_r0  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_r1  : 10  ; // [19..10] 
        unsigned int    te_ycmt_meanratio_r2  : 10  ; // [29..20] 
        unsigned int    Reserved_417          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_R0;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_r3  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_r4  : 10  ; // [19..10] 
        unsigned int    Reserved_418          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_R1;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_t1  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_t2  : 10  ; // [19..10] 
        unsigned int    te_ycmt_meanratio_t3  : 10  ; // [29..20] 
        unsigned int    Reserved_419          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_T1;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_t4  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_t5  : 10  ; // [19..10] 
        unsigned int    te_ycmt_meanratio_t6  : 10  ; // [29..20] 
        unsigned int    Reserved_420          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_T2;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_k1  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_k2  : 10  ; // [19..10] 
        unsigned int    Reserved_421          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_K1;

// Define the union U_VPSS_TNR_TE_CMT_MEANRATIO_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_meanratio_k3  : 10  ; // [9..0] 
        unsigned int    te_ycmt_meanratio_k4  : 10  ; // [19..10] 
        unsigned int    Reserved_422          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_MEANRATIO_K2;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_min   : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_max   : 10  ; // [19..10] 
        unsigned int    Reserved_423          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_CTRL;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_r0    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_r1    : 10  ; // [19..10] 
        unsigned int    te_ycmt_mapping_r2    : 10  ; // [29..20] 
        unsigned int    Reserved_424          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_R0;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_r3    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_r4    : 10  ; // [19..10] 
        unsigned int    Reserved_425          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_R1;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_t1    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_t2    : 10  ; // [19..10] 
        unsigned int    te_ycmt_mapping_t3    : 10  ; // [29..20] 
        unsigned int    Reserved_426          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_T1;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_t4    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_t5    : 10  ; // [19..10] 
        unsigned int    te_ycmt_mapping_t6    : 10  ; // [29..20] 
        unsigned int    Reserved_427          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_T2;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_k1    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_k2    : 10  ; // [19..10] 
        unsigned int    Reserved_428          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_K1;

// Define the union U_VPSS_TNR_TE_YCMT_MAPPING_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ycmt_mapping_k3    : 10  ; // [9..0] 
        unsigned int    te_ycmt_mapping_k4    : 10  ; // [19..10] 
        unsigned int    Reserved_429          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCMT_MAPPING_K2;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_min   : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_max   : 10  ; // [19..10] 
        unsigned int    Reserved_430          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_CTRL;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_r0    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_r1    : 10  ; // [19..10] 
        unsigned int    te_yceg_mapping_r2    : 10  ; // [29..20] 
        unsigned int    Reserved_432          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_R0;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_r3    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_r4    : 10  ; // [19..10] 
        unsigned int    Reserved_433          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_R1;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_t1    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_t2    : 10  ; // [19..10] 
        unsigned int    te_yceg_mapping_t3    : 10  ; // [29..20] 
        unsigned int    Reserved_434          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_T1;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_t4    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_t5    : 10  ; // [19..10] 
        unsigned int    te_yceg_mapping_t6    : 10  ; // [29..20] 
        unsigned int    Reserved_435          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_T2;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_k1    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_k2    : 10  ; // [19..10] 
        unsigned int    Reserved_436          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_K1;

// Define the union U_VPSS_TNR_TE_YCEG_MAPPING_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yceg_mapping_k3    : 10  ; // [9..0] 
        unsigned int    te_yceg_mapping_k4    : 10  ; // [19..10] 
        unsigned int    Reserved_437          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YCEG_MAPPING_K2;

// Define the union U_VPSS_TNR_TE_CEG_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ceg_core           : 10  ; // [9..0] 
        unsigned int    te_ceg_k              : 10  ; // [19..10] 
        unsigned int    te_crshift            : 4   ; // [23..20] 
        unsigned int    Reserved_438          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CEG_CK;

// Define the union U_VPSS_TNR_TE_CEG_CK2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ceg_core2          : 10  ; // [9..0] 
        unsigned int    te_ceg_k2             : 10  ; // [19..10] 
        unsigned int    Reserved_439          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CEG_CK2;

// Define the union U_VPSS_TNR_TE_CMT_CK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_cmt_core1          : 10  ; // [9..0] 
        unsigned int    te_cmt_k1             : 10  ; // [19..10] 
        unsigned int    Reserved_440          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_CK1;

// Define the union U_VPSS_TNR_TE_CMT_CK2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_cmt_core2          : 10  ; // [9..0] 
        unsigned int    te_cmt_k2             : 10  ; // [19..10] 
        unsigned int    Reserved_441          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_CK2;

// Define the union U_VPSS_TNR_TE_CMT_CK3
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_cmt_core3          : 10  ; // [9..0] 
        unsigned int    te_cmt_k3             : 10  ; // [19..10] 
        unsigned int    Reserved_442          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMT_CK3;

// Define the union U_VPSS_TNR_TE_CHPF4_COEF0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_chpf4coef0         : 4   ; // [3..0] 
        unsigned int    te_chpf4coef1         : 4   ; // [7..4] 
        unsigned int    te_chpf4coef2         : 4   ; // [11..8] 
        unsigned int    te_chpf4coef3         : 4   ; // [15..12] 
        unsigned int    te_chpf4coef4         : 4   ; // [19..16] 
        unsigned int    te_chpf4coef5         : 4   ; // [23..20] 
        unsigned int    te_chpf4coef6         : 4   ; // [27..24] 
        unsigned int    te_chpf4coef7         : 4   ; // [31..28] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CHPF4_COEF0;

// Define the union U_VPSS_TNR_TE_CHPF4_COEF1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_chpf4coef8         : 4   ; // [3..0] 
        unsigned int    te_chpf4lshiift       : 3   ; // [6..4] 
        unsigned int    Reserved_443          : 25  ; // [31..7] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CHPF4_COEF1;

// Define the union U_VPSS_TNR_TE_YEG_WEIGHT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yeg_weight1        : 6   ; // [5..0] 
        unsigned int    te_yeg_weight2        : 6   ; // [11..6] 
        unsigned int    te_yeg_weight3        : 6   ; // [17..12] 
        unsigned int    te_yeg_weight4        : 6   ; // [23..18] 
        unsigned int    Reserved_444          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YEG_WEIGHT;

// Define the union U_VPSS_TNR_TE_CEG_WEIGHT
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ceg_weight1        : 6   ; // [5..0] 
        unsigned int    te_ceg_weight2        : 6   ; // [11..6] 
        unsigned int    te_ceg_weight3        : 6   ; // [17..12] 
        unsigned int    te_ceg_weight4        : 6   ; // [23..18] 
        unsigned int    Reserved_445          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CEG_WEIGHT;

// Define the union U_VPSS_TNR_TE_CMEAN_LPFCOEF1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_cmean_lpfcoef0     : 6   ; // [5..0] 
        unsigned int    te_cmean_lpfcoef1     : 6   ; // [11..6] 
        unsigned int    te_cmean_lpfcoef2     : 6   ; // [17..12] 
        unsigned int    te_cmean_lpfcoef3     : 6   ; // [23..18] 
        unsigned int    te_cmean_lpfcoef4     : 6   ; // [29..24] 
        unsigned int    Reserved_446          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMEAN_LPFCOEF1;

// Define the union U_VPSS_TNR_TE_CMEAN_LPFCOEF2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_cmean_lpfcoef5     : 6   ; // [5..0] 
        unsigned int    te_cmean_lpfcoef6     : 6   ; // [11..6] 
        unsigned int    te_cmean_lpfcoef7     : 6   ; // [17..12] 
        unsigned int    te_cmean_lpfcoef8     : 6   ; // [23..18] 
        unsigned int    Reserved_447          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_CMEAN_LPFCOEF2;

// Define the union U_VPSS_TNR_TE_YMT_CK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymt_core1          : 10  ; // [9..0] 
        unsigned int    te_ymt_k1             : 10  ; // [19..10] 
        unsigned int    Reserved_448          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMT_CK1;

// Define the union U_VPSS_TNR_TE_YMT_CK2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymt_core2          : 10  ; // [9..0] 
        unsigned int    te_ymt_k2             : 10  ; // [19..10] 
        unsigned int    Reserved_449          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMT_CK2;

// Define the union U_VPSS_TNR_TE_YEG_CK1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yeg_core1          : 10  ; // [9..0] 
        unsigned int    te_yeg_k1             : 10  ; // [19..10] 
        unsigned int    Reserved_450          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YEG_CK1;

// Define the union U_VPSS_TNR_TE_YMT_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymt_core           : 10  ; // [9..0] 
        unsigned int    te_ymt_k              : 10  ; // [19..10] 
        unsigned int    Reserved_451          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMT_CK;

// Define the union U_VPSS_TNR_TE_YEG_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_yeg_core           : 10  ; // [9..0] 
        unsigned int    te_yeg_k              : 10  ; // [19..10] 
        unsigned int    te_yrshift            : 4   ; // [23..20] 
        unsigned int    Reserved_452          : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YEG_CK;

// Define the union U_VPSS_TNR_TE_YMOVING_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    te_ymoving_core       : 10  ; // [9..0] 
        unsigned int    te_ymoving_k          : 10  ; // [19..10] 
        unsigned int    Reserved_453          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TE_YMOVING_CK;

// Define the union U_VPSS_TNR_TFM_CMOTION_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_cmotion_core      : 10  ; // [9..0] 
        unsigned int    tfm_cmotion_k         : 10  ; // [19..10] 
        unsigned int    Reserved_454          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_CMOTION_CK;

// Define the union U_VPSS_TNR_TFM_CEDGE_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_cedge_core        : 10  ; // [9..0] 
        unsigned int    tfm_cedge_k           : 10  ; // [19..10] 
        unsigned int    tfm_2dupdate          : 1   ; // [20] 
        unsigned int    tfm_cbcrupdate        : 1   ; // [21] 
        unsigned int    Reserved_455          : 10  ; // [31..22] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_CEDGE_CK;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_min     : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_max     : 10  ; // [19..10] 
        unsigned int    Reserved_456          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_CTRL;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_r0      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_r1      : 10  ; // [19..10] 
        unsigned int    tfm_y_mapping_r2      : 10  ; // [29..20] 
        unsigned int    Reserved_457          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_R0;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_r3      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_r4      : 10  ; // [19..10] 
        unsigned int    Reserved_458          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_R1;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_t1      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_t2      : 10  ; // [19..10] 
        unsigned int    tfm_y_mapping_t3      : 10  ; // [29..20] 
        unsigned int    Reserved_459          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_T1;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_t4      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_t5      : 10  ; // [19..10] 
        unsigned int    tfm_y_mapping_t6      : 10  ; // [29..20] 
        unsigned int    Reserved_460          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_T2;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_k1      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_k2      : 10  ; // [19..10] 
        unsigned int    Reserved_461          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_K1;

// Define the union U_VPSS_TNR_TFM_Y_MAPPING_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_y_mapping_k3      : 10  ; // [9..0] 
        unsigned int    tfm_y_mapping_k4      : 10  ; // [19..10] 
        unsigned int    Reserved_462          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_Y_MAPPING_K2;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_min     : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_max     : 10  ; // [19..10] 
        unsigned int    Reserved_463          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_CTRL;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_R0
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_r0      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_r1      : 10  ; // [19..10] 
        unsigned int    tfm_c_mapping_r2      : 10  ; // [29..20] 
        unsigned int    Reserved_464          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_R0;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_R1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_r3      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_r4      : 10  ; // [19..10] 
        unsigned int    Reserved_465          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_R1;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_T1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_t1      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_t2      : 10  ; // [19..10] 
        unsigned int    tfm_c_mapping_t3      : 10  ; // [29..20] 
        unsigned int    Reserved_466          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_T1;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_T2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_t4      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_t5      : 10  ; // [19..10] 
        unsigned int    tfm_c_mapping_t6      : 10  ; // [29..20] 
        unsigned int    Reserved_467          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_T2;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_K1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_k1      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_k2      : 10  ; // [19..10] 
        unsigned int    Reserved_468          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_K1;

// Define the union U_VPSS_TNR_TFM_C_MAPPING_K2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_c_mapping_k3      : 10  ; // [9..0] 
        unsigned int    tfm_c_mapping_k4      : 10  ; // [19..10] 
        unsigned int    Reserved_469          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_C_MAPPING_K2;

// Define the union U_VPSS_TNR_TFM_HISTMOTION_BLEND
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_hism_term1        : 10  ; // [9..0] 
        unsigned int    tfm_hism_term2        : 10  ; // [19..10] 
        unsigned int    tfm_hism_alpha1       : 6   ; // [25..20] 
        unsigned int    tfm_hism_alpha2       : 6   ; // [31..26] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_HISTMOTION_BLEND;

// Define the union U_VPSS_TNR_TFM_PARA
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_filter_mode       : 1   ; // [0] 
        unsigned int    tfm_calc_mode         : 2   ; // [2..1] 
        unsigned int    tfm_scenechange_en    : 1   ; // [3] 
        unsigned int    tfm_scenechangeformotion_en  : 1   ; // [4] 
        unsigned int    tfm_globalmotion_en   : 1   ; // [5] 
        unsigned int    tfm_cbcrupdate_mode   : 1   ; // [6] 
        unsigned int    tfm_1dlpf_mode        : 1   ; // [7] 
        unsigned int    ymotion_mode          : 1   ; // [8] 
        unsigned int    cmotion_mode          : 1   ; // [9] 
        unsigned int    tfm_globalmotion      : 8   ; // [17..10] 
        unsigned int    Reserved_470          : 14  ; // [31..18] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_PARA;

// Define the union U_VPSS_TNR_TFM_YMOTION_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_ymotion_core      : 10  ; // [9..0] 
        unsigned int    tfm_ymotion_k         : 10  ; // [19..10] 
        unsigned int    Reserved_471          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_YMOTION_CK;

// Define the union U_VPSS_TNR_TFM_YEG_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tfm_yedge_core        : 10  ; // [9..0] 
        unsigned int    tfm_yedge_k           : 10  ; // [19..10] 
        unsigned int    Reserved_472          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TFM_YEG_CK;

// Define the union U_VPSS_TNR_TM_YMTMEAN_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymtmean_core       : 10  ; // [9..0] 
        unsigned int    tm_ymtmean_k          : 10  ; // [19..10] 
        unsigned int    Reserved_473          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_YMTMEAN_CK;

// Define the union U_VPSS_TNR_TYMYCK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tymy_core             : 10  ; // [9..0] 
        unsigned int    tymy_k                : 10  ; // [19..10] 
        unsigned int    Reserved_474          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TYMYCK;

// Define the union U_VPSS_TNR_TYMEYCK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tymey_core            : 10  ; // [9..0] 
        unsigned int    tymey_k               : 10  ; // [19..10] 
        unsigned int    Reserved_475          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TYMEYCK;

// Define the union U_VPSS_TNR_TCMYCK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tcmy_core             : 10  ; // [9..0] 
        unsigned int    tcmy_k                : 10  ; // [19..10] 
        unsigned int    Reserved_476          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TCMYCK;

// Define the union U_VPSS_TNR_TCMEYCK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tcmey_core            : 10  ; // [9..0] 
        unsigned int    tcmey_k               : 10  ; // [19..10] 
        unsigned int    Reserved_477          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TCMEYCK;

// Define the union U_VPSS_TNR_TM_CMT_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmt_core           : 10  ; // [9..0] 
        unsigned int    tm_cmt_k              : 10  ; // [19..10] 
        unsigned int    Reserved_478          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_CMT_CK;

// Define the union U_VPSS_TNR_TM_YMT_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_ymt_core           : 10  ; // [9..0] 
        unsigned int    tm_ymt_k              : 10  ; // [19..10] 
        unsigned int    Reserved_479          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_YMT_CK;

// Define the union U_VPSS_TNR_TM_CMTMEAN_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    tm_cmtmean_core       : 10  ; // [9..0] 
        unsigned int    tm_cmtmean_k          : 10  ; // [19..10] 
        unsigned int    Reserved_480          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_TM_CMTMEAN_CK;

// Define the union U_VPSS_TNR_SNR_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_483          : 1   ; // [0] 
        unsigned int    ynr_1d_en             : 1   ; // [1] 
        unsigned int    cnr_1d_en             : 1   ; // [2] 
        unsigned int    sencechange           : 8   ; // [10..3] 
        unsigned int    Reserved_482          : 8   ; // [18..11] 
        unsigned int    ctrandnoise_en        : 1   ; // [19] 
        unsigned int    ctrandnoise_bit       : 3   ; // [22..20] 
        unsigned int    ytrandnoise_en        : 1   ; // [23] 
        unsigned int    ytrandnoise_bit       : 3   ; // [26..24] 
        unsigned int    t2dedgemode           : 1   ; // [27] 
        unsigned int    Reserved_481          : 1   ; // [28] 
        unsigned int    t2dmeanen             : 1   ; // [29] 
        unsigned int    t2dmeden              : 1   ; // [30] 
        unsigned int    t2dmmen               : 1   ; // [31] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_SNR_CTRL;

// Define the union U_VPSS_TNR_BLEND_CTRL
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    Reserved_485          : 2   ; // [1..0] 
        unsigned int    s_change              : 8   ; // [9..2] 
        unsigned int    Reserved_484          : 22  ; // [31..10] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_BLEND_CTRL;

// Define the union U_VPSS_TNR_T2D_EDGE_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    t2d_edge_core         : 10  ; // [9..0] 
        unsigned int    t2d_edge_k            : 10  ; // [19..10] 
        unsigned int    Reserved_486          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_T2D_EDGE_CK;

// Define the union U_VPSS_TNR_T2D_NOISE_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    t2d_noise_core        : 10  ; // [9..0] 
        unsigned int    t2d_noise_k           : 10  ; // [19..10] 
        unsigned int    Reserved_487          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_T2D_NOISE_CK;

// Define the union U_VPSS_TNR_EDGE_CMOVING_CK
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    edge_cmoving_core     : 10  ; // [9..0] 
        unsigned int    edge_cmoving_k        : 10  ; // [19..10] 
        unsigned int    Reserved_488          : 12  ; // [31..20] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_EDGE_CMOVING_CK;

// Define the union U_VPSS_TNR_GLBMTN_THD
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    small_motion_thd_pglb  : 10  ; // [9..0] 
        unsigned int    Reserved_492          : 2   ; // [11..10] 
        unsigned int    tgm_get_mode          : 2   ; // [13..12] 
        unsigned int    Reserved_491          : 2   ; // [15..14] 
        unsigned int    large_motion_thd_pglb  : 10  ; // [25..16] 
        unsigned int    Reserved_490          : 2   ; // [27..26] 
        unsigned int    motion_lfshift_pglb   : 2   ; // [29..28] 
        unsigned int    Reserved_489          : 2   ; // [31..30] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_GLBMTN_THD;

// Define the union U_VPSS_PFMD_THR
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    osd_en                : 1   ; // [0] 
        unsigned int    coring                : 8   ; // [8..1] 
        unsigned int    mov_coring            : 8   ; // [16..9] 
        unsigned int    Reserved_493          : 15  ; // [31..17] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_THR;

// Define the union U_VPSS_PFMD_HD1P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hd1p1x                : 16  ; // [15..0] 
        unsigned int    hd1p1y                : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_HD1P1;

// Define the union U_VPSS_PFMD_HD1P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hd1p2x                : 16  ; // [15..0] 
        unsigned int    hd1p2y                : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_HD1P2;

// Define the union U_VPSS_PFMD_HD2P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hd2p1x                : 16  ; // [15..0] 
        unsigned int    hd2p1y                : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_HD2P1;

// Define the union U_VPSS_PFMD_HD2P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    hd2p2x                : 16  ; // [15..0] 
        unsigned int    hd2p2y                : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_HD2P2;

// Define the union U_VPSS_PFMD_PAL1P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pal1p1x               : 16  ; // [15..0] 
        unsigned int    pal1p1y               : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_PAL1P1;

// Define the union U_VPSS_PFMD_PAL1P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pal1p2x               : 16  ; // [15..0] 
        unsigned int    pal1p2y               : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_PAL1P2;

// Define the union U_VPSS_PFMD_PAL2P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pal2p1x               : 16  ; // [15..0] 
        unsigned int    pal2p1y               : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_PAL2P1;

// Define the union U_VPSS_PFMD_PAL2P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    pal2p2x               : 16  ; // [15..0] 
        unsigned int    pal2p2y               : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_PAL2P2;

// Define the union U_VPSS_PFMD_NTSC1P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ntsc1p1x              : 16  ; // [15..0] 
        unsigned int    ntsc1p1y              : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_NTSC1P1;

// Define the union U_VPSS_PFMD_NTSC1P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ntsc1p2x              : 16  ; // [15..0] 
        unsigned int    ntsc1p2y              : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_NTSC1P2;

// Define the union U_VPSS_PFMD_NTSC2P1
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ntsc2p1x              : 16  ; // [15..0] 
        unsigned int    ntsc2p1y              : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_NTSC2P1;

// Define the union U_VPSS_PFMD_NTSC2P2
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    ntsc2p2x              : 16  ; // [15..0] 
        unsigned int    ntsc2p2y              : 16  ; // [31..16] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_PFMD_NTSC2P2;

// Define the union U_VPSS_TNR_CLUT10
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT10;

// Define the union U_VPSS_TNR_CLUT11
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT11;

// Define the union U_VPSS_TNR_CLUT12
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT12;

// Define the union U_VPSS_TNR_CLUT13
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT13;

// Define the union U_VPSS_TNR_CLUT14
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT14;

// Define the union U_VPSS_TNR_CLUT15
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT15;

// Define the union U_VPSS_TNR_CLUT16
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT16;

// Define the union U_VPSS_TNR_CLUT17
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT17;

// Define the union U_VPSS_TNR_CLUT18
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT18;

// Define the union U_VPSS_TNR_CLUT19
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT19;

// Define the union U_VPSS_TNR_CLUT110
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT110;

// Define the union U_VPSS_TNR_CLUT111
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT111;

// Define the union U_VPSS_TNR_CLUT112
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT112;

// Define the union U_VPSS_TNR_CLUT113
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT113;

// Define the union U_VPSS_TNR_CLUT114
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT114;

// Define the union U_VPSS_TNR_CLUT115
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT115;

// Define the union U_VPSS_TNR_CLUT20
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT20;

// Define the union U_VPSS_TNR_CLUT21
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT21;

// Define the union U_VPSS_TNR_CLUT22
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT22;

// Define the union U_VPSS_TNR_CLUT23
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT23;

// Define the union U_VPSS_TNR_CLUT24
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT24;

// Define the union U_VPSS_TNR_CLUT25
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT25;

// Define the union U_VPSS_TNR_CLUT26
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT26;

// Define the union U_VPSS_TNR_CLUT27
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT27;

// Define the union U_VPSS_TNR_CLUT28
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT28;

// Define the union U_VPSS_TNR_CLUT29
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT29;

// Define the union U_VPSS_TNR_CLUT210
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT210;

// Define the union U_VPSS_TNR_CLUT211
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT211;

// Define the union U_VPSS_TNR_CLUT212
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT212;

// Define the union U_VPSS_TNR_CLUT213
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT213;

// Define the union U_VPSS_TNR_CLUT214
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT214;

// Define the union U_VPSS_TNR_CLUT215
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT215;

// Define the union U_VPSS_TNR_CLUT216
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT216;

// Define the union U_VPSS_TNR_CLUT217
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT217;

// Define the union U_VPSS_TNR_CLUT218
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT218;

// Define the union U_VPSS_TNR_CLUT219
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT219;

// Define the union U_VPSS_TNR_CLUT220
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT220;

// Define the union U_VPSS_TNR_CLUT221
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT221;

// Define the union U_VPSS_TNR_CLUT222
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT222;

// Define the union U_VPSS_TNR_CLUT223
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT223;

// Define the union U_VPSS_TNR_CLUT224
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT224;

// Define the union U_VPSS_TNR_CLUT225
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT225;

// Define the union U_VPSS_TNR_CLUT226
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT226;

// Define the union U_VPSS_TNR_CLUT227
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT227;

// Define the union U_VPSS_TNR_CLUT228
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT228;

// Define the union U_VPSS_TNR_CLUT229
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT229;

// Define the union U_VPSS_TNR_CLUT230
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT230;

// Define the union U_VPSS_TNR_CLUT231
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT231;

// Define the union U_VPSS_TNR_CLUT232
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT232;

// Define the union U_VPSS_TNR_CLUT233
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT233;

// Define the union U_VPSS_TNR_CLUT234
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT234;

// Define the union U_VPSS_TNR_CLUT235
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT235;

// Define the union U_VPSS_TNR_CLUT236
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT236;

// Define the union U_VPSS_TNR_CLUT237
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT237;

// Define the union U_VPSS_TNR_CLUT238
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT238;

// Define the union U_VPSS_TNR_CLUT239
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT239;

// Define the union U_VPSS_TNR_CLUT240
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT240;

// Define the union U_VPSS_TNR_CLUT241
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT241;

// Define the union U_VPSS_TNR_CLUT242
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT242;

// Define the union U_VPSS_TNR_CLUT243
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT243;

// Define the union U_VPSS_TNR_CLUT244
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT244;

// Define the union U_VPSS_TNR_CLUT245
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT245;

// Define the union U_VPSS_TNR_CLUT246
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT246;

// Define the union U_VPSS_TNR_CLUT247
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT247;

// Define the union U_VPSS_TNR_CLUT248
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT248;

// Define the union U_VPSS_TNR_CLUT249
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT249;

// Define the union U_VPSS_TNR_CLUT250
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT250;

// Define the union U_VPSS_TNR_CLUT251
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT251;

// Define the union U_VPSS_TNR_CLUT252
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT252;

// Define the union U_VPSS_TNR_CLUT253
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT253;

// Define the union U_VPSS_TNR_CLUT254
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT254;

// Define the union U_VPSS_TNR_CLUT255
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT255;

// Define the union U_VPSS_TNR_CLUT256
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT256;

// Define the union U_VPSS_TNR_CLUT257
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT257;

// Define the union U_VPSS_TNR_CLUT258
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT258;

// Define the union U_VPSS_TNR_CLUT259
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT259;

// Define the union U_VPSS_TNR_CLUT260
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT260;

// Define the union U_VPSS_TNR_CLUT261
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT261;

// Define the union U_VPSS_TNR_CLUT262
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT262;

// Define the union U_VPSS_TNR_CLUT263
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT263;

// Define the union U_VPSS_TNR_CLUT264
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT264;

// Define the union U_VPSS_TNR_CLUT265
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT265;

// Define the union U_VPSS_TNR_CLUT266
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT266;

// Define the union U_VPSS_TNR_CLUT267
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT267;

// Define the union U_VPSS_TNR_CLUT268
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT268;

// Define the union U_VPSS_TNR_CLUT269
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT269;

// Define the union U_VPSS_TNR_CLUT270
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT270;

// Define the union U_VPSS_TNR_CLUT271
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT271;

// Define the union U_VPSS_TNR_CLUT272
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT272;

// Define the union U_VPSS_TNR_CLUT273
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT273;

// Define the union U_VPSS_TNR_CLUT274
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT274;

// Define the union U_VPSS_TNR_CLUT275
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT275;

// Define the union U_VPSS_TNR_CLUT276
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT276;

// Define the union U_VPSS_TNR_CLUT277
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT277;

// Define the union U_VPSS_TNR_CLUT278
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT278;

// Define the union U_VPSS_TNR_CLUT279
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT279;

// Define the union U_VPSS_TNR_CLUT280
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT280;

// Define the union U_VPSS_TNR_CLUT281
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT281;

// Define the union U_VPSS_TNR_CLUT282
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT282;

// Define the union U_VPSS_TNR_CLUT283
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT283;

// Define the union U_VPSS_TNR_CLUT284
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT284;

// Define the union U_VPSS_TNR_CLUT285
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT285;

// Define the union U_VPSS_TNR_CLUT286
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT286;

// Define the union U_VPSS_TNR_CLUT287
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT287;

// Define the union U_VPSS_TNR_CLUT288
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT288;

// Define the union U_VPSS_TNR_CLUT289
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT289;

// Define the union U_VPSS_TNR_CLUT290
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT290;

// Define the union U_VPSS_TNR_CLUT291
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT291;

// Define the union U_VPSS_TNR_CLUT292
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT292;

// Define the union U_VPSS_TNR_CLUT293
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT293;

// Define the union U_VPSS_TNR_CLUT294
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT294;

// Define the union U_VPSS_TNR_CLUT295
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT295;

// Define the union U_VPSS_TNR_CLUT296
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT296;

// Define the union U_VPSS_TNR_CLUT297
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT297;

// Define the union U_VPSS_TNR_CLUT298
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT298;

// Define the union U_VPSS_TNR_CLUT299
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT299;

// Define the union U_VPSS_TNR_CLUT2100
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2100;

// Define the union U_VPSS_TNR_CLUT2101
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2101;

// Define the union U_VPSS_TNR_CLUT2102
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2102;

// Define the union U_VPSS_TNR_CLUT2103
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2103;

// Define the union U_VPSS_TNR_CLUT2104
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2104;

// Define the union U_VPSS_TNR_CLUT2105
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2105;

// Define the union U_VPSS_TNR_CLUT2106
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2106;

// Define the union U_VPSS_TNR_CLUT2107
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2107;

// Define the union U_VPSS_TNR_CLUT2108
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2108;

// Define the union U_VPSS_TNR_CLUT2109
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2109;

// Define the union U_VPSS_TNR_CLUT2110
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2110;

// Define the union U_VPSS_TNR_CLUT2111
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2111;

// Define the union U_VPSS_TNR_CLUT2112
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2112;

// Define the union U_VPSS_TNR_CLUT2113
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2113;

// Define the union U_VPSS_TNR_CLUT2114
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2114;

// Define the union U_VPSS_TNR_CLUT2115
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2115;

// Define the union U_VPSS_TNR_CLUT2116
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2116;

// Define the union U_VPSS_TNR_CLUT2117
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2117;

// Define the union U_VPSS_TNR_CLUT2118
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2118;

// Define the union U_VPSS_TNR_CLUT2119
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2119;

// Define the union U_VPSS_TNR_CLUT2120
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2120;

// Define the union U_VPSS_TNR_CLUT2121
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2121;

// Define the union U_VPSS_TNR_CLUT2122
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2122;

// Define the union U_VPSS_TNR_CLUT2123
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2123;

// Define the union U_VPSS_TNR_CLUT2124
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2124;

// Define the union U_VPSS_TNR_CLUT2125
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2125;

// Define the union U_VPSS_TNR_CLUT2126
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2126;

// Define the union U_VPSS_TNR_CLUT2127
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT2127;

// Define the union U_VPSS_TNR_CLUT30
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT30;

// Define the union U_VPSS_TNR_CLUT31
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT31;

// Define the union U_VPSS_TNR_CLUT32
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT32;

// Define the union U_VPSS_TNR_CLUT33
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT33;

// Define the union U_VPSS_TNR_CLUT34
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT34;

// Define the union U_VPSS_TNR_CLUT35
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT35;

// Define the union U_VPSS_TNR_CLUT36
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT36;

// Define the union U_VPSS_TNR_CLUT37
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT37;

// Define the union U_VPSS_TNR_CLUT38
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT38;

// Define the union U_VPSS_TNR_CLUT39
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT39;

// Define the union U_VPSS_TNR_CLUT310
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT310;

// Define the union U_VPSS_TNR_CLUT311
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT311;

// Define the union U_VPSS_TNR_CLUT312
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT312;

// Define the union U_VPSS_TNR_CLUT313
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT313;

// Define the union U_VPSS_TNR_CLUT314
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT314;

// Define the union U_VPSS_TNR_CLUT315
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT315;

// Define the union U_VPSS_TNR_CLUT316
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT316;

// Define the union U_VPSS_TNR_CLUT317
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT317;

// Define the union U_VPSS_TNR_CLUT318
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT318;

// Define the union U_VPSS_TNR_CLUT319
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT319;

// Define the union U_VPSS_TNR_CLUT320
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT320;

// Define the union U_VPSS_TNR_CLUT321
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT321;

// Define the union U_VPSS_TNR_CLUT322
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT322;

// Define the union U_VPSS_TNR_CLUT323
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT323;

// Define the union U_VPSS_TNR_CLUT324
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT324;

// Define the union U_VPSS_TNR_CLUT325
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT325;

// Define the union U_VPSS_TNR_CLUT326
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT326;

// Define the union U_VPSS_TNR_CLUT327
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT327;

// Define the union U_VPSS_TNR_CLUT328
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT328;

// Define the union U_VPSS_TNR_CLUT329
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT329;

// Define the union U_VPSS_TNR_CLUT330
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT330;

// Define the union U_VPSS_TNR_CLUT331
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT331;

// Define the union U_VPSS_TNR_CLUT40
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT40;

// Define the union U_VPSS_TNR_CLUT41
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT41;

// Define the union U_VPSS_TNR_CLUT42
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT42;

// Define the union U_VPSS_TNR_CLUT43
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT43;

// Define the union U_VPSS_TNR_CLUT44
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT44;

// Define the union U_VPSS_TNR_CLUT45
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT45;

// Define the union U_VPSS_TNR_CLUT46
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT46;

// Define the union U_VPSS_TNR_CLUT47
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT47;

// Define the union U_VPSS_TNR_CLUT48
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT48;

// Define the union U_VPSS_TNR_CLUT49
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT49;

// Define the union U_VPSS_TNR_CLUT410
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT410;

// Define the union U_VPSS_TNR_CLUT411
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT411;

// Define the union U_VPSS_TNR_CLUT412
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT412;

// Define the union U_VPSS_TNR_CLUT413
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT413;

// Define the union U_VPSS_TNR_CLUT414
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT414;

// Define the union U_VPSS_TNR_CLUT415
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT415;

// Define the union U_VPSS_TNR_CLUT416
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT416;

// Define the union U_VPSS_TNR_CLUT417
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT417;

// Define the union U_VPSS_TNR_CLUT418
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT418;

// Define the union U_VPSS_TNR_CLUT419
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT419;

// Define the union U_VPSS_TNR_CLUT420
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT420;

// Define the union U_VPSS_TNR_CLUT421
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT421;

// Define the union U_VPSS_TNR_CLUT422
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT422;

// Define the union U_VPSS_TNR_CLUT423
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT423;

// Define the union U_VPSS_TNR_CLUT424
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT424;

// Define the union U_VPSS_TNR_CLUT425
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT425;

// Define the union U_VPSS_TNR_CLUT426
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT426;

// Define the union U_VPSS_TNR_CLUT427
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT427;

// Define the union U_VPSS_TNR_CLUT428
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT428;

// Define the union U_VPSS_TNR_CLUT429
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT429;

// Define the union U_VPSS_TNR_CLUT430
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT430;

// Define the union U_VPSS_TNR_CLUT431
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int    data0                 : 8   ; // [7..0] 
        unsigned int    data1                 : 8   ; // [15..8] 
        unsigned int    data2                 : 8   ; // [23..16] 
        unsigned int    data3                 : 8   ; // [31..24] 
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_VPSS_TNR_CLUT431;

// Define the union U_VPSS_DEBUG0
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug0                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG0;
// Define the union U_VPSS_DEBUG1
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug1                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG1;
// Define the union U_VPSS_DEBUG2
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug2                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG2;
// Define the union U_VPSS_DEBUG3
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug3                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG3;
// Define the union U_VPSS_DEBUG4
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug4                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG4;
// Define the union U_VPSS_DEBUG5
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug5                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG5;
// Define the union U_VPSS_DEBUG6
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug6                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG6;
// Define the union U_VPSS_DEBUG7
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug7                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG7;
// Define the union U_VPSS_DEBUG8
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug8                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG8;
// Define the union U_VPSS_DEBUG9
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug9                  : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG9;
// Define the union U_VPSS_DEBUG10
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug10                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG10;
// Define the union U_VPSS_DEBUG11
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug11                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG11;
// Define the union U_VPSS_DEBUG12
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug12                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG12;
// Define the union U_VPSS_DEBUG13
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug13                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG13;
// Define the union U_VPSS_DEBUG14
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug14                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG14;
// Define the union U_VPSS_DEBUG15
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug15                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG15;
// Define the union U_VPSS_DEBUG16
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug16                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG16;
// Define the union U_VPSS_DEBUG17
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug17                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG17;
// Define the union U_VPSS_DEBUG18
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug18                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG18;
// Define the union U_VPSS_DEBUG19
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug19                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG19;
// Define the union U_VPSS_DEBUG20
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug20                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG20;
// Define the union U_VPSS_DEBUG21
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug21                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG21;
// Define the union U_VPSS_DEBUG22
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug22                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG22;
// Define the union U_VPSS_DEBUG23
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug23                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG23;
// Define the union U_VPSS_DEBUG24
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug24                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG24;
// Define the union U_VPSS_DEBUG25
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug25                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG25;
// Define the union U_VPSS_DEBUG26
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug26                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG26;
// Define the union U_VPSS_DEBUG27
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug27                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG27;
// Define the union U_VPSS_DEBUG28
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug28                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG28;
// Define the union U_VPSS_DEBUG29
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug29                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG29;
// Define the union U_VPSS_DEBUG30
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug30                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG30;
// Define the union U_VPSS_DEBUG31
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug31                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG31;
// Define the union U_VPSS_DEBUG32
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug32                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG32;
// Define the union U_VPSS_DEBUG33
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug33                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG33;
// Define the union U_VPSS_DEBUG34
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug34                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG34;
// Define the union U_VPSS_DEBUG35
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug35                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG35;
// Define the union U_VPSS_DEBUG36
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug36                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG36;
// Define the union U_VPSS_DEBUG37
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug37                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG37;
// Define the union U_VPSS_DEBUG38
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug38                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG38;
// Define the union U_VPSS_DEBUG39
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug39                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG39;
// Define the union U_VPSS_DEBUG40
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug40                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG40;
// Define the union U_VPSS_DEBUG41
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug41                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG41;
// Define the union U_VPSS_DEBUG42
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug42                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG42;
// Define the union U_VPSS_DEBUG43
typedef union
{
    // Define the struct bits 
    struct
    {
        unsigned int debug43                 : 32  ; // [31..0] 
    } bits;
 
    // Define an unsigned member
        unsigned int    u32;
 
} U_VPSS_DEBUG43;
//==============================================================================
// Define the global struct
typedef struct
{
    volatile U_VPSS_CTRL          VPSS_CTRL;
    volatile U_VPSS_CTRL2         VPSS_CTRL2;
    volatile U_VPSS_CTRL3         VPSS_CTRL3;
    volatile U_VPSS_CTRL4         VPSS_CTRL4;
    volatile U_VPSS_IMGSIZE       VPSS_IMGSIZE;
    volatile U_VPSS_CUR_CTRL      VPSS_CUR_CTRL;
    volatile U_VPSS_CURY_HEAD_ADDR VPSS_CURY_HEAD_ADDR;
    volatile U_VPSS_CURC_HEAD_ADDR VPSS_CURC_HEAD_ADDR;
    volatile U_VPSS_CURYADDR      VPSS_CURYADDR;
    volatile U_VPSS_CURCADDR      VPSS_CURCADDR;
    volatile U_VPSS_CURSTRIDE     VPSS_CURSTRIDE;
    volatile U_VPSS_REF_CTRL      VPSS_REF_CTRL;
    volatile U_VPSS_REFY_HEAD_ADDR VPSS_REFY_HEAD_ADDR;
    volatile U_VPSS_REFC_HEAD_ADDR VPSS_REFC_HEAD_ADDR;
    volatile U_VPSS_REFYADDR      VPSS_REFYADDR;
    volatile U_VPSS_REFCADDR      VPSS_REFCADDR;
    volatile U_VPSS_REFSTRIDE     VPSS_REFSTRIDE;
    volatile U_VPSS_NXT1_CTRL     VPSS_NXT1_CTRL;
    volatile U_VPSS_NXT1Y_HEAD_ADDR VPSS_NXT1Y_HEAD_ADDR;
    volatile U_VPSS_NXT1C_HEAD_ADDR VPSS_NXT1C_HEAD_ADDR;
    volatile U_VPSS_NXT1YADDR     VPSS_NXT1YADDR;
    volatile U_VPSS_NXT1CADDR     VPSS_NXT1CADDR;
    volatile U_VPSS_NXT1STRIDE    VPSS_NXT1STRIDE;
    volatile U_VPSS_NXT2_CTRL     VPSS_NXT2_CTRL;
    volatile U_VPSS_NXT2Y_HEAD_ADDR VPSS_NXT2Y_HEAD_ADDR;
    volatile U_VPSS_NXT2C_HEAD_ADDR VPSS_NXT2C_HEAD_ADDR;
    volatile U_VPSS_NXT2YADDR     VPSS_NXT2YADDR;
    volatile U_VPSS_NXT2CADDR     VPSS_NXT2CADDR;
    volatile U_VPSS_NXT2STRIDE    VPSS_NXT2STRIDE;
    volatile U_VPSS_NXT3_CTRL     VPSS_NXT3_CTRL;
    volatile U_VPSS_NXT3Y_HEAD_ADDR VPSS_NXT3Y_HEAD_ADDR;
    volatile U_VPSS_NXT3C_HEAD_ADDR VPSS_NXT3C_HEAD_ADDR;
    volatile U_VPSS_NXT3YADDR     VPSS_NXT3YADDR;
    volatile U_VPSS_NXT3CADDR     VPSS_NXT3CADDR;
    volatile U_VPSS_NXT3STRIDE    VPSS_NXT3STRIDE;
    volatile U_VPSS_PR1_CTRL      VPSS_PR1_CTRL;
    volatile U_VPSS_PR1Y_HEAD_ADDR VPSS_PR1Y_HEAD_ADDR;
    volatile U_VPSS_PR1C_HEAD_ADDR VPSS_PR1C_HEAD_ADDR;
    volatile U_VPSS_PR1YADDR      VPSS_PR1YADDR;
    volatile U_VPSS_PR1CADDR      VPSS_PR1CADDR;
    volatile U_VPSS_PR1STRIDE     VPSS_PR1STRIDE;
    volatile U_VPSS_PR2_CTRL      VPSS_PR2_CTRL;
    volatile U_VPSS_PR2Y_HEAD_ADDR VPSS_PR2Y_HEAD_ADDR;
    volatile U_VPSS_PR2C_HEAD_ADDR VPSS_PR2C_HEAD_ADDR;
    volatile U_VPSS_PR2YADDR      VPSS_PR2YADDR;
    volatile U_VPSS_PR2CADDR      VPSS_PR2CADDR;
    volatile U_VPSS_PR2STRIDE     VPSS_PR2STRIDE;
    volatile U_VPSS_RFRCTRL       VPSS_RFRCTRL;
    volatile U_VPSS_RFRY_HEAD_ADDR VPSS_RFRY_HEAD_ADDR;
    volatile U_VPSS_RFRC_HEAD_ADDR VPSS_RFRC_HEAD_ADDR;
    volatile U_VPSS_RFRYADDR      VPSS_RFRYADDR;
    volatile U_VPSS_RFRCADDR      VPSS_RFRCADDR;
    volatile U_VPSS_RFRSTRIDE     VPSS_RFRSTRIDE;
    volatile U_VPSS_VHD0CTRL      VPSS_VHD0CTRL;
    volatile U_VPSS_VHD0SIZE      VPSS_VHD0SIZE;
    volatile U_VPSS_VHD0Y_HEAD_ADDR VPSS_VHD0Y_HEAD_ADDR;
    volatile U_VPSS_VHD0C_HEAD_ADDR VPSS_VHD0C_HEAD_ADDR;
    volatile U_VPSS_VHD0YADDR     VPSS_VHD0YADDR;
    volatile U_VPSS_VHD0CADDR     VPSS_VHD0CADDR;
    volatile U_VPSS_VHD0STRIDE    VPSS_VHD0STRIDE;
    volatile U_VPSS_VHD1CTRL      VPSS_VHD1CTRL;
    volatile U_VPSS_VHD1SIZE      VPSS_VHD1SIZE;
    volatile U_VPSS_VHD1Y_HEAD_ADDR VPSS_VHD1Y_HEAD_ADDR;
    volatile U_VPSS_VHD1C_HEAD_ADDR VPSS_VHD1C_HEAD_ADDR;
    volatile U_VPSS_VHD1YADDR     VPSS_VHD1YADDR;
    volatile U_VPSS_VHD1CADDR     VPSS_VHD1CADDR;
    volatile U_VPSS_VHD1STRIDE    VPSS_VHD1STRIDE;
    volatile U_VPSS_VSDCTRL       VPSS_VSDCTRL;
    volatile U_VPSS_VSDSIZE       VPSS_VSDSIZE;
    volatile U_VPSS_VSDY_HEAD_ADDR VPSS_VSDY_HEAD_ADDR;
    volatile U_VPSS_VSDC_HEAD_ADDR VPSS_VSDC_HEAD_ADDR;
    volatile U_VPSS_VSDYADDR      VPSS_VSDYADDR;
    volatile U_VPSS_VSDCADDR      VPSS_VSDCADDR;
    volatile U_VPSS_VSDSTRIDE     VPSS_VSDSTRIDE;
    volatile U_VPSS_YCNTRADDR     VPSS_YCNTRADDR;
    volatile U_VPSS_CCNTRADDR     VPSS_CCNTRADDR;
    volatile U_VPSS_YCNTWADDR     VPSS_YCNTWADDR;
    volatile U_VPSS_CCNTWADDR     VPSS_CCNTWADDR;
    volatile U_VPSS_CNTSTRIDE     VPSS_CNTSTRIDE;
    volatile U_VPSS_STRADDR       VPSS_STRADDR;
    volatile U_VPSS_STWADDR       VPSS_STWADDR;
    volatile U_VPSS_STSTRIDE      VPSS_STSTRIDE;
    volatile U_VPSS_MAD_RADDR     VPSS_MAD_RADDR;
    volatile U_VPSS_MAD_WADDR     VPSS_MAD_WADDR;
    volatile U_VPSS_SNR_MAD_RADDR VPSS_SNR_MAD_RADDR;
    volatile U_VPSS_MADSTRIDE     VPSS_MADSTRIDE;
    volatile U_VPSS_STT_W_ADDR    VPSS_STT_W_ADDR;
    volatile U_VPSS_TUNL_CTRL0    VPSS_TUNL_CTRL0;
    volatile U_VPSS_TUNL_CTRL1    VPSS_TUNL_CTRL1;
    volatile U_VPSS_VHD0_TUNL_ADDR VPSS_VHD0_TUNL_ADDR;
    volatile U_VPSS_VHD1_TUNL_ADDR VPSS_VHD1_TUNL_ADDR;
    volatile U_VPSS_VSD_TUNL_ADDR VPSS_VSD_TUNL_ADDR;
    volatile U_VPSS_CUR_TUNL_ADDR VPSS_CUR_TUNL_ADDR;
    volatile U_VPSS_DR_CFG0       VPSS_DR_CFG0;
    volatile U_VPSS_DR_CFG1       VPSS_DR_CFG1;
    volatile U_VPSS_DB_CFG0       VPSS_DB_CFG0;
    volatile U_VPSS_DB_CFG1       VPSS_DB_CFG1;
    volatile U_VPSS_DB_CFG2       VPSS_DB_CFG2;
    volatile U_VPSS_INCROP_POS    VPSS_INCROP_POS;
    volatile U_VPSS_INCROP_SIZE   VPSS_INCROP_SIZE;
    volatile U_VPSS_RFRLBA_DSIZE  VPSS_RFRLBA_DSIZE;
    volatile U_VPSS_RFRLBA_VFPOS  VPSS_RFRLBA_VFPOS;
    volatile U_VPSS_RFRLBA_VSIZE  VPSS_RFRLBA_VSIZE;
    volatile U_VPSS_RFRLBA_BK     VPSS_RFRLBA_BK;
    volatile U_VPSS_VHD0CROP_POS  VPSS_VHD0CROP_POS;
    volatile U_VPSS_VHD0CROP_SIZE VPSS_VHD0CROP_SIZE;
    volatile U_VPSS_VHD1CROP_POS  VPSS_VHD1CROP_POS;
    volatile U_VPSS_VHD1CROP_SIZE VPSS_VHD1CROP_SIZE;
    volatile U_VPSS_VSDCROP_POS   VPSS_VSDCROP_POS;
    volatile U_VPSS_VSDCROP_SIZE  VPSS_VSDCROP_SIZE;
    volatile unsigned int         Reserved_0[2];
    volatile U_VPSS_VHD0LBA_DSIZE VPSS_VHD0LBA_DSIZE;
    volatile U_VPSS_VHD0LBA_VFPOS VPSS_VHD0LBA_VFPOS;
    volatile U_VPSS_VHD0LBA_VSIZE VPSS_VHD0LBA_VSIZE;
    volatile U_VPSS_VHD0LBA_BK    VPSS_VHD0LBA_BK;
    volatile U_VPSS_VHD1LBA_DSIZE VPSS_VHD1LBA_DSIZE;
    volatile U_VPSS_VHD1LBA_VFPOS VPSS_VHD1LBA_VFPOS;
    volatile U_VPSS_VHD1LBA_VSIZE VPSS_VHD1LBA_VSIZE;
    volatile U_VPSS_VHD1LBA_BK    VPSS_VHD1LBA_BK;
    volatile U_VPSS_VSDLBA_DSIZE  VPSS_VSDLBA_DSIZE;
    volatile U_VPSS_VSDLBA_VFPOS  VPSS_VSDLBA_VFPOS;
    volatile U_VPSS_VSDLBA_VSIZE  VPSS_VSDLBA_VSIZE;
    volatile U_VPSS_VSDLBA_BK     VPSS_VSDLBA_BK;
    volatile U_VPSS_DNR_INFO      VPSS_DNR_INFO;
    volatile U_VPSS_NODEID        VPSS_NODEID;
    volatile U_VPSS_AXIID         VPSS_AXIID;
    volatile U_VPSS_INTMASK       VPSS_INTMASK;
    volatile U_VPSS_VHD0_ZME_LHADDR VPSS_VHD0_ZME_LHADDR;
    volatile U_VPSS_VHD0_ZME_LVADDR VPSS_VHD0_ZME_LVADDR;
    volatile U_VPSS_VHD0_ZME_CHADDR VPSS_VHD0_ZME_CHADDR;
    volatile U_VPSS_VHD0_ZME_CVADDR VPSS_VHD0_ZME_CVADDR;
    volatile U_VPSS_VHD1_ZME_LHADDR VPSS_VHD1_ZME_LHADDR;
    volatile U_VPSS_VHD1_ZME_LVADDR VPSS_VHD1_ZME_LVADDR;
    volatile U_VPSS_VHD1_ZME_CHADDR VPSS_VHD1_ZME_CHADDR;
    volatile U_VPSS_VHD1_ZME_CVADDR VPSS_VHD1_ZME_CVADDR;
    volatile U_VPSS_VSD_ZME_LHADDR VPSS_VSD_ZME_LHADDR;
    volatile U_VPSS_VSD_ZME_LVADDR VPSS_VSD_ZME_LVADDR;
    volatile U_VPSS_VSD_ZME_CHADDR VPSS_VSD_ZME_CHADDR;
    volatile U_VPSS_VSD_ZME_CVADDR VPSS_VSD_ZME_CVADDR;
    volatile U_VPSS_VC1_STR_ADDR  VPSS_VC1_STR_ADDR;
    volatile unsigned int         Reserved_1[3];
    volatile U_VPSS_ZME_ADDR      VPSS_ZME_ADDR;
    volatile U_VPSS_HSP_ADDR      VPSS_HSP_ADDR;
    volatile unsigned int         Reserved_2;
    volatile U_VPSS_SNR_ADDR      VPSS_SNR_ADDR;
    volatile U_VPSS_DB_ADDR       VPSS_DB_ADDR;
    volatile U_VPSS_DR_ADDR       VPSS_DR_ADDR;
    volatile U_VPSS_DEI_ADDR      VPSS_DEI_ADDR;
    volatile unsigned int         Reserved_3;
    volatile U_VPSS_TNR_ADDR      VPSS_TNR_ADDR;
    volatile U_VPSS_TNR_CLUT_ADDR VPSS_TNR_CLUT_ADDR;
    volatile U_VPSS_ES_ADDR       VPSS_ES_ADDR;
    volatile unsigned int         Reserved_4[5];
    volatile U_VPSS_CSC_IDC       VPSS_CSC_IDC;
    volatile U_VPSS_CSC_ODC       VPSS_CSC_ODC;
    volatile U_VPSS_CSC_IODC      VPSS_CSC_IODC;
    volatile U_VPSS_CSC_P0        VPSS_CSC_P0;
    volatile U_VPSS_CSC_P1        VPSS_CSC_P1;
    volatile U_VPSS_CSC_P2        VPSS_CSC_P2;
    volatile U_VPSS_CSC_P3        VPSS_CSC_P3;
    volatile U_VPSS_CSC_P4        VPSS_CSC_P4;
    volatile U_VPSS_CL_THD        VPSS_CL_THD;
    volatile U_VPSS_CL_STEP       VPSS_CL_STEP;
    volatile U_VPSS_CL_LUT0       VPSS_CL_LUT0;
    volatile U_VPSS_CL_LUT1       VPSS_CL_LUT1;
    volatile U_VPSS_CC_THD        VPSS_CC_THD;
    volatile U_VPSS_CC_STEP       VPSS_CC_STEP;
    volatile U_VPSS_CC_LUT0       VPSS_CC_LUT0;
    volatile U_VPSS_CC_LUT1       VPSS_CC_LUT1;
    volatile U_VPSS_LBD_BLACK_THR VPSS_LBD_BLACK_THR;
    volatile U_VPSS_LBD_BLACK_CFG1 VPSS_LBD_BLACK_CFG1;
    volatile U_VPSS_LBD_BLACK_CFG2 VPSS_LBD_BLACK_CFG2;
    volatile unsigned int         Reserved_5;
    volatile U_VPSS_CCO_LUT_0     VPSS_CCO_LUT_0;
    volatile U_VPSS_CCO_LUT_5     VPSS_CCO_LUT_5;
    volatile U_VPSS_CCO_LUT_10    VPSS_CCO_LUT_10;
    volatile U_VPSS_CCO_LUT_15    VPSS_CCO_LUT_15;
    volatile U_VPSS_CCO_LUT_20    VPSS_CCO_LUT_20;
    volatile U_VPSS_CCO_LUT_25    VPSS_CCO_LUT_25;
    volatile U_VPSS_CCO_LUT_30    VPSS_CCO_LUT_30;
    volatile unsigned int         Reserved_6[4];
    volatile U_VPSS_PNEXT         VPSS_PNEXT;
    volatile U_VPSS_START         VPSS_START;
    volatile U_VPSS_INTSTATE      VPSS_INTSTATE;
    volatile U_VPSS_INTCLR        VPSS_INTCLR;
    volatile U_VPSS_RAWINT        VPSS_RAWINT;
    volatile U_VPSS_PFCNT         VPSS_PFCNT;
    volatile U_VPSS_MISCELLANEOUS VPSS_MISCELLANEOUS;
    volatile U_VPSS_MACCFG        VPSS_MACCFG;
    volatile U_VPSS_TIMEOUT       VPSS_TIMEOUT;
    volatile U_VPSS_EOFCNT        VPSS_EOFCNT;
    volatile unsigned int         Reserved_7[3];
    volatile U_VPSS_VERSION       VPSS_VERSION;
    volatile unsigned int         Reserved_8[819];
    volatile U_VPSS_DIECTRL       VPSS_DIECTRL;
    volatile U_VPSS_DIELMA2       VPSS_DIELMA2;
    volatile U_VPSS_DIEINTEN      VPSS_DIEINTEN;
    volatile U_VPSS_DIESCALE      VPSS_DIESCALE;
    volatile U_VPSS_DIECHECK1     VPSS_DIECHECK1;
    volatile U_VPSS_DIECHECK2     VPSS_DIECHECK2;
    volatile U_VPSS_DIEDIR0_3     VPSS_DIEDIR0_3;
    volatile U_VPSS_DIEDIR4_7     VPSS_DIEDIR4_7;
    volatile U_VPSS_DIEDIR8_11    VPSS_DIEDIR8_11;
    volatile U_VPSS_DIEDIR12_14   VPSS_DIEDIR12_14;
    volatile U_VPSS_DIESTA        VPSS_DIESTA;
    volatile U_VPSS_DIESTPPREADDR VPSS_DIESTPPREADDR;
    volatile U_VPSS_DIESTPREADDR  VPSS_DIESTPREADDR;
    volatile U_VPSS_DIEINTPSCL0   VPSS_DIEINTPSCL0;
    volatile U_VPSS_DIEINTPSCL1   VPSS_DIEINTPSCL1;
    volatile U_VPSS_DIEDIRTHD     VPSS_DIEDIRTHD;
    volatile U_VPSS_DIEJITMTN     VPSS_DIEJITMTN;
    volatile U_VPSS_DIEFLDMTN     VPSS_DIEFLDMTN;
    volatile U_VPSS_DIEMTNDIFFTHD0 VPSS_DIEMTNDIFFTHD0;
    volatile U_VPSS_DIEMTNDIFFTHD1 VPSS_DIEMTNDIFFTHD1;
    volatile U_VPSS_DIEMTNIIRSLP  VPSS_DIEMTNIIRSLP;
    volatile U_VPSS_DIEMTNIIRRAT  VPSS_DIEMTNIIRRAT;
    volatile U_VPSS_DIEHISMODE    VPSS_DIEHISMODE;
    volatile U_VPSS_DIEMORFLT     VPSS_DIEMORFLT;
    volatile U_VPSS_DIECOMBCHK0   VPSS_DIECOMBCHK0;
    volatile U_VPSS_DIECOMBCHK1   VPSS_DIECOMBCHK1;
    volatile U_VPSS_DIEFRMMTNSMTHTHD0 VPSS_DIEFRMMTNSMTHTHD0;
    volatile U_VPSS_DIEFRMMTNSMTHTHD1 VPSS_DIEFRMMTNSMTHTHD1;
    volatile U_VPSS_DIEFRMMTNSMTHSLP VPSS_DIEFRMMTNSMTHSLP;
    volatile U_VPSS_DIEFRMMTNSMTHRAT VPSS_DIEFRMMTNSMTHRAT;
    volatile U_VPSS_DIEFRMFLDBLENDTHD0 VPSS_DIEFRMFLDBLENDTHD0;
    volatile U_VPSS_DIEFRMFLDBLENDTHD1 VPSS_DIEFRMFLDBLENDTHD1;
    volatile U_VPSS_DIEFRMFLDBLENDSLP VPSS_DIEFRMFLDBLENDSLP;
    volatile U_VPSS_DIEFRMFLDBLENDRAT VPSS_DIEFRMFLDBLENDRAT;
    volatile U_VPSS_DIEMTNADJ     VPSS_DIEMTNADJ;
    volatile U_VPSS_DIEGLBMTNTHD  VPSS_DIEGLBMTNTHD;
    volatile unsigned int         Reserved_9[4];
    volatile U_VPSS_PDPCCTHR0     VPSS_PDPCCTHR0;
    volatile U_VPSS_PDPCCTHR1     VPSS_PDPCCTHR1;
    volatile U_VPSS_PDPCCTHR2     VPSS_PDPCCTHR2;
    volatile U_VPSS_PDOSDTHR0     VPSS_PDOSDTHR0;
    volatile U_VPSS_PDOSDTHR1     VPSS_PDOSDTHR1;
    volatile U_VPSS_PDOSDINIT0    VPSS_PDOSDINIT0;
    volatile U_VPSS_PDOSDINIT1    VPSS_PDOSDINIT1;
    volatile U_VPSS_PDOSDINIT2    VPSS_PDOSDINIT2;
    volatile U_VPSS_PDITDIFFTHR   VPSS_PDITDIFFTHR;
    volatile U_VPSS_PDUMTHR       VPSS_PDUMTHR;
    volatile U_VPSS_PDSTILLBLKTHR VPSS_PDSTILLBLKTHR;
    volatile U_VPSS_PDCOMBTHR     VPSS_PDCOMBTHR;
    volatile U_VPSS_PDLASITHR     VPSS_PDLASITHR;
    volatile U_VPSS_PDICHD        VPSS_PDICHD;
    volatile unsigned int         Reserved_10[970];
    volatile U_VPSS_VHD0_HSP      VPSS_VHD0_HSP;
    volatile U_VPSS_VHD0_HLOFFSET VPSS_VHD0_HLOFFSET;
    volatile U_VPSS_VHD0_HCOFFSET VPSS_VHD0_HCOFFSET;
    volatile U_VPSS_VHD0_VSP      VPSS_VHD0_VSP;
    volatile U_VPSS_VHD0_VSR      VPSS_VHD0_VSR;
    volatile U_VPSS_VHD0_VOFFSET  VPSS_VHD0_VOFFSET;
    volatile U_VPSS_VHD0_ZMEORESO VPSS_VHD0_ZMEORESO;
    volatile U_VPSS_VHD0_ZMEIRESO VPSS_VHD0_ZMEIRESO;
    volatile unsigned int         Reserved_11[8];
    volatile U_VPSS_VHD1_HSP      VPSS_VHD1_HSP;
    volatile U_VPSS_VHD1_HLOFFSET VPSS_VHD1_HLOFFSET;
    volatile U_VPSS_VHD1_HCOFFSET VPSS_VHD1_HCOFFSET;
    volatile U_VPSS_VHD1_VSP      VPSS_VHD1_VSP;
    volatile U_VPSS_VHD1_VSR      VPSS_VHD1_VSR;
    volatile U_VPSS_VHD1_VOFFSET  VPSS_VHD1_VOFFSET;
    volatile U_VPSS_VHD1_ZMEORESO VPSS_VHD1_ZMEORESO;
    volatile U_VPSS_VHD1_ZMEIRESO VPSS_VHD1_ZMEIRESO;
    volatile unsigned int         Reserved_12[8];
    volatile U_VPSS_VSD_HSP       VPSS_VSD_HSP;
    volatile U_VPSS_VSD_HLOFFSET  VPSS_VSD_HLOFFSET;
    volatile U_VPSS_VSD_HCOFFSET  VPSS_VSD_HCOFFSET;
    volatile U_VPSS_VSD_VSP       VPSS_VSD_VSP;
    volatile U_VPSS_VSD_VSR       VPSS_VSD_VSR;
    volatile U_VPSS_VSD_VOFFSET   VPSS_VSD_VOFFSET;
    volatile U_VPSS_VSD_ZMEORESO  VPSS_VSD_ZMEORESO;
    volatile U_VPSS_VSD_ZMEIRESO  VPSS_VSD_ZMEIRESO;
    volatile unsigned int         Reserved_13[24];
    volatile U_VPSS_HSPCFG1       VPSS_HSPCFG1;
    volatile U_VPSS_HSPCFG2       VPSS_HSPCFG2;
    volatile unsigned int         Reserved_14[3];
    volatile U_VPSS_HSPCFG3       VPSS_HSPCFG3;
    volatile U_VPSS_HSPCFG4       VPSS_HSPCFG4;
    volatile U_VPSS_HSPCFG5       VPSS_HSPCFG5;
    volatile U_VPSS_HSPCFG6       VPSS_HSPCFG6;
    volatile unsigned int         Reserved_15[3];
    volatile U_VPSS_HSPCFG7       VPSS_HSPCFG7;
    volatile U_VPSS_HSPCFG8       VPSS_HSPCFG8;
    volatile U_VPSS_HSPCFG9       VPSS_HSPCFG9;
    volatile U_VPSS_HSPCFG10      VPSS_HSPCFG10;
    volatile unsigned int         Reserved_16[48];
    volatile U_VPSS_DB_CTRL       VPSS_DB_CTRL;
    volatile U_VPSS_DB_OFFSET     VPSS_DB_OFFSET;
    volatile U_VPSS_DB_LUMHBLK    VPSS_DB_LUMHBLK;
    volatile U_VPSS_DB_LUMVBLK    VPSS_DB_LUMVBLK;
    volatile U_VPSS_DB_CHRHBLK    VPSS_DB_CHRHBLK;
    volatile U_VPSS_DB_CHRVBLK    VPSS_DB_CHRVBLK;
    volatile U_VPSS_DB_WEIGHT     VPSS_DB_WEIGHT;
    volatile U_VPSS_DB_STRLUT00   VPSS_DB_STRLUT00;
    volatile U_VPSS_DB_STRLUT01   VPSS_DB_STRLUT01;
    volatile U_VPSS_DB_STRLUT10   VPSS_DB_STRLUT10;
    volatile U_VPSS_DB_STRLUT11   VPSS_DB_STRLUT11;
    volatile U_VPSS_DB_STRLUT20   VPSS_DB_STRLUT20;
    volatile U_VPSS_DB_STRLUT21   VPSS_DB_STRLUT21;
    volatile U_VPSS_DB_STRLUT30   VPSS_DB_STRLUT30;
    volatile U_VPSS_DB_STRLUT31   VPSS_DB_STRLUT31;
    volatile U_VPSS_DB_STRLUT40   VPSS_DB_STRLUT40;
    volatile U_VPSS_DB_STRLUT41   VPSS_DB_STRLUT41;
    volatile U_VPSS_DB_STRLUT50   VPSS_DB_STRLUT50;
    volatile U_VPSS_DB_STRLUT51   VPSS_DB_STRLUT51;
    volatile U_VPSS_DB_STRLUT60   VPSS_DB_STRLUT60;
    volatile U_VPSS_DB_STRLUT61   VPSS_DB_STRLUT61;
    volatile U_VPSS_DB_STRLUT70   VPSS_DB_STRLUT70;
    volatile U_VPSS_DB_STRLUT71   VPSS_DB_STRLUT71;
    volatile U_VPSS_DB_STRLUT80   VPSS_DB_STRLUT80;
    volatile U_VPSS_DB_STRLUT81   VPSS_DB_STRLUT81;
    volatile U_VPSS_DB_STRLUT90   VPSS_DB_STRLUT90;
    volatile U_VPSS_DB_STRLUT91   VPSS_DB_STRLUT91;
    volatile unsigned int         Reserved_17[37];
    volatile U_VPSS_DR_CTRL       VPSS_DR_CTRL;
    volatile U_VPSS_DR_THR        VPSS_DR_THR;
    volatile U_VPSS_DRLSWSTRLUT0  VPSS_DRLSWSTRLUT0;
    volatile U_VPSS_DRLSWSTRLUT1  VPSS_DRLSWSTRLUT1;
    volatile U_VPSS_DRLSWSTRLUT2  VPSS_DRLSWSTRLUT2;
    volatile U_VPSS_DRLSWSTRLUT3  VPSS_DRLSWSTRLUT3;
    volatile U_VPSS_DRLSWSTRLUT4  VPSS_DRLSWSTRLUT4;
    volatile U_VPSS_DRLSWSTRLUT5  VPSS_DRLSWSTRLUT5;
    volatile U_VPSS_DRLSWSTRLUT6  VPSS_DRLSWSTRLUT6;
    volatile U_VPSS_DRLSWSTRLUT7  VPSS_DRLSWSTRLUT7;
    volatile U_VPSS_DRLSWSTRLUT8  VPSS_DRLSWSTRLUT8;
    volatile U_VPSS_DRLRWSTRLUT0  VPSS_DRLRWSTRLUT0;
    volatile U_VPSS_DRLRWSTRLUT1  VPSS_DRLRWSTRLUT1;
    volatile U_VPSS_DRLRWSTRLUT2  VPSS_DRLRWSTRLUT2;
    volatile U_VPSS_DRLRWSTRLUT3  VPSS_DRLRWSTRLUT3;
    volatile U_VPSS_DRLRWSTRLUT4  VPSS_DRLRWSTRLUT4;
    volatile U_VPSS_DRLRWSTRLUT5  VPSS_DRLRWSTRLUT5;
    volatile U_VPSS_DRLRWSTRLUT6  VPSS_DRLRWSTRLUT6;
    volatile U_VPSS_DRLRWSTRLUT7  VPSS_DRLRWSTRLUT7;
    volatile U_VPSS_DRLRWSTRLUT8  VPSS_DRLRWSTRLUT8;
    volatile U_VPSS_DRLSWSTRADJUSTLUT0 VPSS_DRLSWSTRADJUSTLUT0;
    volatile U_VPSS_DRLSWSTRADJUSTLUT1 VPSS_DRLSWSTRADJUSTLUT1;
    volatile U_VPSS_DRLSWSTRADJUSTLUT2 VPSS_DRLSWSTRADJUSTLUT2;
    volatile U_VPSS_DRLRWSTRADJUSTLUT0 VPSS_DRLRWSTRADJUSTLUT0;
    volatile U_VPSS_DRLRWSTRADJUSTLUT1 VPSS_DRLRWSTRADJUSTLUT1;
    volatile U_VPSS_DRLRWSTRADJUSTLUT2 VPSS_DRLRWSTRADJUSTLUT2;
    volatile U_VPSS_DRANGADJSUTLUT0 VPSS_DRANGADJSUTLUT0;
    volatile U_VPSS_DRANGADJSUTLUT1 VPSS_DRANGADJSUTLUT1;
    volatile U_VPSS_DRANGADJSUTLUT2 VPSS_DRANGADJSUTLUT2;
    volatile U_VPSS_DRANGLESTRLUT1_0 VPSS_DRANGLESTRLUT1_0;
    volatile U_VPSS_DRANGLESTRLUT1_1 VPSS_DRANGLESTRLUT1_1;
    volatile U_VPSS_DRANGLESTRLUT1_2 VPSS_DRANGLESTRLUT1_2;
    volatile U_VPSS_DRANGLESTRLUT2_0 VPSS_DRANGLESTRLUT2_0;
    volatile U_VPSS_DRANGLESTRLUT2_1 VPSS_DRANGLESTRLUT2_1;
    volatile U_VPSS_DRANGLESTRLUT2_2 VPSS_DRANGLESTRLUT2_2;
    volatile U_VPSS_DROVTSTRADJUSTLUT0 VPSS_DROVTSTRADJUSTLUT0;
    volatile U_VPSS_DROVTSTRADJUSTLUT1 VPSS_DROVTSTRADJUSTLUT1;
    volatile U_VPSS_DROVTSTRADJUSTLUT2 VPSS_DROVTSTRADJUSTLUT2;
    volatile U_VPSS_DROVTSTRLUT0  VPSS_DROVTSTRLUT0;
    volatile U_VPSS_DROVTSTRLUT1  VPSS_DROVTSTRLUT1;
    volatile U_VPSS_DROVTSTRLUT2  VPSS_DROVTSTRLUT2;
    volatile unsigned int         Reserved_18[23];
    volatile U_VPSS_VC1_CTRL0     VPSS_VC1_CTRL0;
    volatile U_VPSS_VC1_CTRL1     VPSS_VC1_CTRL1;
    volatile U_VPSS_VC1_CTRL2     VPSS_VC1_CTRL2;
    volatile unsigned int         Reserved_19;
    volatile U_STR_DET_VIDCTRL    STR_DET_VIDCTRL;
    volatile U_STR_DET_VIDBLKPOS0_1 STR_DET_VIDBLKPOS0_1;
    volatile U_STR_DET_VIDBLKPOS2_3 STR_DET_VIDBLKPOS2_3;
    volatile U_STR_DET_VIDBLKPOS4_5 STR_DET_VIDBLKPOS4_5;
    volatile unsigned int         Reserved_20[56];
    volatile U_ES_MODE            ES_MODE;
    volatile U_ES_DIR_RATIO_0     ES_DIR_RATIO_0;
    volatile U_ES_DIR_RATIO_1     ES_DIR_RATIO_1;
    volatile U_ES_NORMALIZED_SCALE_0 ES_NORMALIZED_SCALE_0;
    volatile U_ES_NORMALIZED_SCALE_1 ES_NORMALIZED_SCALE_1;
    volatile U_ES_BC1_CFG         ES_BC1_CFG;
    volatile U_ES_BC2_CFG         ES_BC2_CFG;
    volatile U_ES_BC_CFG          ES_BC_CFG;
    volatile U_ES_RATIO_LIMIT_SCALE ES_RATIO_LIMIT_SCALE;
    volatile U_ES_VER_MIN_STRENGTH ES_VER_MIN_STRENGTH;
    volatile U_ES_EDGE_SMOOTH_GAIN ES_EDGE_SMOOTH_GAIN;
    volatile U_ES_EDGE_THD        ES_EDGE_THD;
    volatile U_ES_EDGE_SMOOTH_RATIO_0 ES_EDGE_SMOOTH_RATIO_0;
    volatile U_ES_EDGE_SMOOTH_RATIO_1 ES_EDGE_SMOOTH_RATIO_1;
    volatile U_ES_EDGE_SLOPE_0    ES_EDGE_SLOPE_0;
    volatile U_ES_EDGE_SLOPE_1    ES_EDGE_SLOPE_1;
    volatile U_ES_EDGE_SLOPE_2    ES_EDGE_SLOPE_2;
    volatile U_ES_STATUS_0        ES_STATUS_0;
    volatile U_ES_STATUS_1        ES_STATUS_1;
    volatile U_ES_STATUS_2        ES_STATUS_2;
    volatile unsigned int         Reserved_21[684];
    volatile U_VPSS_SNR_ENABLE    VPSS_SNR_ENABLE;
    volatile U_VPSS_SNR_EDGE_RATIORANGE VPSS_SNR_EDGE_RATIORANGE;
    volatile U_VPSS_SNR_EDGE_STRRANGE VPSS_SNR_EDGE_STRRANGE;
    volatile U_VPSS_SNR_EDGE_STRTH VPSS_SNR_EDGE_STRTH;
    volatile U_VPSS_SNR_EDGE_STRK VPSS_SNR_EDGE_STRK;
    volatile U_VPSS_SNR_EDGE_MEANTH1 VPSS_SNR_EDGE_MEANTH1;
    volatile U_VPSS_SNR_EDGE_MEANTH2 VPSS_SNR_EDGE_MEANTH2;
    volatile U_VPSS_SNR_EDGE_MEANTH3 VPSS_SNR_EDGE_MEANTH3;
    volatile U_VPSS_SNR_EDGE_MEANK1 VPSS_SNR_EDGE_MEANK1;
    volatile U_VPSS_SNR_EDGE_MEANK2 VPSS_SNR_EDGE_MEANK2;
    volatile U_VPSS_SNR_WIN       VPSS_SNR_WIN;
    volatile U_VPSS_SNR_STR       VPSS_SNR_STR;
    volatile U_VPSS_SNR_STR_OFFSET VPSS_SNR_STR_OFFSET;
    volatile U_VPSS_SNR_STR_ADJUST VPSS_SNR_STR_ADJUST;
    volatile U_VPSS_SNR_SCHANGE_TH VPSS_SNR_SCHANGE_TH;
    volatile U_VPSS_SNR_EDGE_RATIO_1 VPSS_SNR_EDGE_RATIO_1;
    volatile U_VPSS_SNR_EDGE_RATIO_2 VPSS_SNR_EDGE_RATIO_2;
    volatile U_VPSS_SNR_EDGE_RATIO_3 VPSS_SNR_EDGE_RATIO_3;
    volatile U_VPSS_SNR_EDGE_STR  VPSS_SNR_EDGE_STR;
    volatile U_VPSS_SNR_TEST_COLOR VPSS_SNR_TEST_COLOR;
    volatile U_VPSS_SNR_SCHANGE   VPSS_SNR_SCHANGE;
    volatile unsigned int         Reserved_22[43];
    volatile U_MOTION_EDGE_LUT_01 MOTION_EDGE_LUT_01;
    volatile U_MOTION_EDGE_LUT_02 MOTION_EDGE_LUT_02;
    volatile U_MOTION_EDGE_LUT_03 MOTION_EDGE_LUT_03;
    volatile U_MOTION_EDGE_LUT_04 MOTION_EDGE_LUT_04;
    volatile U_MOTION_EDGE_LUT_05 MOTION_EDGE_LUT_05;
    volatile U_MOTION_EDGE_LUT_06 MOTION_EDGE_LUT_06;
    volatile U_MOTION_EDGE_LUT_07 MOTION_EDGE_LUT_07;
    volatile U_MOTION_EDGE_LUT_08 MOTION_EDGE_LUT_08;
    volatile U_MOTION_EDGE_LUT_09 MOTION_EDGE_LUT_09;
    volatile U_MOTION_EDGE_LUT_10 MOTION_EDGE_LUT_10;
    volatile U_MOTION_EDGE_LUT_11 MOTION_EDGE_LUT_11;
    volatile U_MOTION_EDGE_LUT_12 MOTION_EDGE_LUT_12;
    volatile U_MOTION_EDGE_LUT_13 MOTION_EDGE_LUT_13;
    volatile U_MOTION_EDGE_LUT_14 MOTION_EDGE_LUT_14;
    volatile U_MOTION_EDGE_LUT_15 MOTION_EDGE_LUT_15;
    volatile U_MOTION_EDGE_LUT_16 MOTION_EDGE_LUT_16;
    volatile U_MOTION_EDGE_LUT_17 MOTION_EDGE_LUT_17;
    volatile U_MOTION_EDGE_LUT_18 MOTION_EDGE_LUT_18;
    volatile U_MOTION_EDGE_LUT_19 MOTION_EDGE_LUT_19;
    volatile U_MOTION_EDGE_LUT_20 MOTION_EDGE_LUT_20;
    volatile U_MOTION_EDGE_LUT_21 MOTION_EDGE_LUT_21;
    volatile U_MOTION_EDGE_LUT_22 MOTION_EDGE_LUT_22;
    volatile U_MOTION_EDGE_LUT_23 MOTION_EDGE_LUT_23;
    volatile U_MOTION_EDGE_LUT_24 MOTION_EDGE_LUT_24;
    volatile U_MOTION_EDGE_LUT_25 MOTION_EDGE_LUT_25;
    volatile U_MOTION_EDGE_LUT_26 MOTION_EDGE_LUT_26;
    volatile U_MOTION_EDGE_LUT_27 MOTION_EDGE_LUT_27;
    volatile U_MOTION_EDGE_LUT_28 MOTION_EDGE_LUT_28;
    volatile U_MOTION_EDGE_LUT_29 MOTION_EDGE_LUT_29;
    volatile U_MOTION_EDGE_LUT_30 MOTION_EDGE_LUT_30;
    volatile U_MOTION_EDGE_LUT_31 MOTION_EDGE_LUT_31;
    volatile U_MOTION_EDGE_LUT_32 MOTION_EDGE_LUT_32;
    volatile U_COLOR_BASED_LUT_01 COLOR_BASED_LUT_01;
    volatile U_COLOR_BASED_LUT_02 COLOR_BASED_LUT_02;
    volatile U_COLOR_BASED_LUT_03 COLOR_BASED_LUT_03;
    volatile U_COLOR_BASED_LUT_04 COLOR_BASED_LUT_04;
    volatile U_COLOR_BASED_LUT_05 COLOR_BASED_LUT_05;
    volatile U_COLOR_BASED_LUT_06 COLOR_BASED_LUT_06;
    volatile U_COLOR_BASED_LUT_07 COLOR_BASED_LUT_07;
    volatile U_COLOR_BASED_LUT_08 COLOR_BASED_LUT_08;
    volatile U_COLOR_BASED_LUT_09 COLOR_BASED_LUT_09;
    volatile U_COLOR_BASED_LUT_10 COLOR_BASED_LUT_10;
    volatile U_COLOR_BASED_LUT_11 COLOR_BASED_LUT_11;
    volatile U_COLOR_BASED_LUT_12 COLOR_BASED_LUT_12;
    volatile U_COLOR_BASED_LUT_13 COLOR_BASED_LUT_13;
    volatile U_COLOR_BASED_LUT_14 COLOR_BASED_LUT_14;
    volatile U_COLOR_BASED_LUT_15 COLOR_BASED_LUT_15;
    volatile U_COLOR_BASED_LUT_16 COLOR_BASED_LUT_16;
    volatile U_COLOR_BASED_LUT_17 COLOR_BASED_LUT_17;
    volatile U_COLOR_BASED_LUT_18 COLOR_BASED_LUT_18;
    volatile U_COLOR_BASED_LUT_19 COLOR_BASED_LUT_19;
    volatile U_COLOR_BASED_LUT_20 COLOR_BASED_LUT_20;
    volatile U_COLOR_BASED_LUT_21 COLOR_BASED_LUT_21;
    volatile U_COLOR_BASED_LUT_22 COLOR_BASED_LUT_22;
    volatile U_COLOR_BASED_LUT_23 COLOR_BASED_LUT_23;
    volatile U_COLOR_BASED_LUT_24 COLOR_BASED_LUT_24;
    volatile U_COLOR_BASED_LUT_25 COLOR_BASED_LUT_25;
    volatile U_COLOR_BASED_LUT_26 COLOR_BASED_LUT_26;
    volatile U_COLOR_BASED_LUT_27 COLOR_BASED_LUT_27;
    volatile U_COLOR_BASED_LUT_28 COLOR_BASED_LUT_28;
    volatile U_COLOR_BASED_LUT_29 COLOR_BASED_LUT_29;
    volatile U_COLOR_BASED_LUT_30 COLOR_BASED_LUT_30;
    volatile U_COLOR_BASED_LUT_31 COLOR_BASED_LUT_31;
    volatile U_COLOR_BASED_LUT_32 COLOR_BASED_LUT_32;
    volatile unsigned int         Reserved_23[384];
    volatile U_VPSS_TNR_MODE      VPSS_TNR_MODE;
    volatile U_VPSS_TNR_YMOTION_MAP_CTRL VPSS_TNR_YMOTION_MAP_CTRL;
    volatile U_VPSS_TNR_YMOTION_MAP_R0 VPSS_TNR_YMOTION_MAP_R0;
    volatile U_VPSS_TNR_YMOTION_MAP_R1 VPSS_TNR_YMOTION_MAP_R1;
    volatile U_VPSS_TNR_YMOTION_MAP_T1 VPSS_TNR_YMOTION_MAP_T1;
    volatile U_VPSS_TNR_YMOTION_MAP_T2 VPSS_TNR_YMOTION_MAP_T2;
    volatile U_VPSS_TNR_YMOTION_MAP_K1 VPSS_TNR_YMOTION_MAP_K1;
    volatile U_VPSS_TNR_YMOTION_MAP_K2 VPSS_TNR_YMOTION_MAP_K2;
    volatile U_VPSS_TNR_CMOTION_MAP_CTRL VPSS_TNR_CMOTION_MAP_CTRL;
    volatile U_VPSS_TNR_CMOTION_MAP_R0 VPSS_TNR_CMOTION_MAP_R0;
    volatile U_VPSS_TNR_CMOTION_MAP_R1 VPSS_TNR_CMOTION_MAP_R1;
    volatile U_VPSS_TNR_CMOTION_MAP_T1 VPSS_TNR_CMOTION_MAP_T1;
    volatile U_VPSS_TNR_CMOTION_MAP_T2 VPSS_TNR_CMOTION_MAP_T2;
    volatile U_VPSS_TNR_CMOTION_MAP_K1 VPSS_TNR_CMOTION_MAP_K1;
    volatile U_VPSS_TNR_CMOTION_MAP_K2 VPSS_TNR_CMOTION_MAP_K2;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_CTRL VPSS_TNR_YMOTION_MEANRATIO_CTRL;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_R0 VPSS_TNR_YMOTION_MEANRATIO_R0;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_R1 VPSS_TNR_YMOTION_MEANRATIO_R1;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_T1 VPSS_TNR_YMOTION_MEANRATIO_T1;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_T2 VPSS_TNR_YMOTION_MEANRATIO_T2;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_K1 VPSS_TNR_YMOTION_MEANRATIO_K1;
    volatile U_VPSS_TNR_YMOTION_MEANRATIO_K2 VPSS_TNR_YMOTION_MEANRATIO_K2;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_CTRL VPSS_TNR_CMOTION_MEANRATIO_CTRL;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_R0 VPSS_TNR_CMOTION_MEANRATIO_R0;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_R1 VPSS_TNR_CMOTION_MEANRATIO_R1;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_T1 VPSS_TNR_CMOTION_MEANRATIO_T1;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_T2 VPSS_TNR_CMOTION_MEANRATIO_T2;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_K1 VPSS_TNR_CMOTION_MEANRATIO_K1;
    volatile U_VPSS_TNR_CMOTION_MEANRATIO_K2 VPSS_TNR_CMOTION_MEANRATIO_K2;
    volatile U_VPSS_TNR_TM_YCMTCOEF VPSS_TNR_TM_YCMTCOEF;
    volatile U_VPSS_TNR_TM_YCLPFCOEF VPSS_TNR_TM_YCLPFCOEF;
    volatile U_VPSS_TNR_TE_YHPF1_0 VPSS_TNR_TE_YHPF1_0;
    volatile U_VPSS_TNR_TE_YHPF1_1 VPSS_TNR_TE_YHPF1_1;
    volatile U_VPSS_TNR_TE_YHPF2_0 VPSS_TNR_TE_YHPF2_0;
    volatile U_VPSS_TNR_TE_YHPF2_1 VPSS_TNR_TE_YHPF2_1;
    volatile U_VPSS_TNR_TE_YHPF3_0 VPSS_TNR_TE_YHPF3_0;
    volatile U_VPSS_TNR_TE_YHPF3_1 VPSS_TNR_TE_YHPF3_1;
    volatile U_VPSS_TNR_TE_YHPF4_0 VPSS_TNR_TE_YHPF4_0;
    volatile U_VPSS_TNR_TE_YHPF4_1 VPSS_TNR_TE_YHPF4_1;
    volatile U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_0 VPSS_TNR_TE_YMTMEAN_LPFCOEF_0;
    volatile U_VPSS_TNR_TE_YMTMEAN_LPFCOEF_1 VPSS_TNR_TE_YMTMEAN_LPFCOEF_1;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_CTRL VPSS_TNR_TE_YCEG_MEANRATIO_CTRL;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_R0 VPSS_TNR_TE_YCEG_MEANRATIO_R0;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_R1 VPSS_TNR_TE_YCEG_MEANRATIO_R1;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_T1 VPSS_TNR_TE_YCEG_MEANRATIO_T1;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_T2 VPSS_TNR_TE_YCEG_MEANRATIO_T2;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_K1 VPSS_TNR_TE_YCEG_MEANRATIO_K1;
    volatile U_VPSS_TNR_TE_YCEG_MEANRATIO_K2 VPSS_TNR_TE_YCEG_MEANRATIO_K2;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_CTRL VPSS_TNR_TE_CMT_MEANRATIO_CTRL;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_R0 VPSS_TNR_TE_CMT_MEANRATIO_R0;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_R1 VPSS_TNR_TE_CMT_MEANRATIO_R1;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_T1 VPSS_TNR_TE_CMT_MEANRATIO_T1;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_T2 VPSS_TNR_TE_CMT_MEANRATIO_T2;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_K1 VPSS_TNR_TE_CMT_MEANRATIO_K1;
    volatile U_VPSS_TNR_TE_CMT_MEANRATIO_K2 VPSS_TNR_TE_CMT_MEANRATIO_K2;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_CTRL VPSS_TNR_TE_YCMT_MAPPING_CTRL;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_R0 VPSS_TNR_TE_YCMT_MAPPING_R0;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_R1 VPSS_TNR_TE_YCMT_MAPPING_R1;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_T1 VPSS_TNR_TE_YCMT_MAPPING_T1;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_T2 VPSS_TNR_TE_YCMT_MAPPING_T2;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_K1 VPSS_TNR_TE_YCMT_MAPPING_K1;
    volatile U_VPSS_TNR_TE_YCMT_MAPPING_K2 VPSS_TNR_TE_YCMT_MAPPING_K2;
    volatile unsigned int         Reserved_24[7];
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_CTRL VPSS_TNR_TE_YCEG_MAPPING_CTRL;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_R0 VPSS_TNR_TE_YCEG_MAPPING_R0;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_R1 VPSS_TNR_TE_YCEG_MAPPING_R1;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_T1 VPSS_TNR_TE_YCEG_MAPPING_T1;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_T2 VPSS_TNR_TE_YCEG_MAPPING_T2;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_K1 VPSS_TNR_TE_YCEG_MAPPING_K1;
    volatile U_VPSS_TNR_TE_YCEG_MAPPING_K2 VPSS_TNR_TE_YCEG_MAPPING_K2;
    volatile U_VPSS_TNR_TE_CEG_CK VPSS_TNR_TE_CEG_CK;
    volatile U_VPSS_TNR_TE_CEG_CK2 VPSS_TNR_TE_CEG_CK2;
    volatile U_VPSS_TNR_TE_CMT_CK1 VPSS_TNR_TE_CMT_CK1;
    volatile U_VPSS_TNR_TE_CMT_CK2 VPSS_TNR_TE_CMT_CK2;
    volatile U_VPSS_TNR_TE_CMT_CK3 VPSS_TNR_TE_CMT_CK3;
    volatile U_VPSS_TNR_TE_CHPF4_COEF0 VPSS_TNR_TE_CHPF4_COEF0;
    volatile U_VPSS_TNR_TE_CHPF4_COEF1 VPSS_TNR_TE_CHPF4_COEF1;
    volatile U_VPSS_TNR_TE_YEG_WEIGHT VPSS_TNR_TE_YEG_WEIGHT;
    volatile U_VPSS_TNR_TE_CEG_WEIGHT VPSS_TNR_TE_CEG_WEIGHT;
    volatile U_VPSS_TNR_TE_CMEAN_LPFCOEF1 VPSS_TNR_TE_CMEAN_LPFCOEF1;
    volatile U_VPSS_TNR_TE_CMEAN_LPFCOEF2 VPSS_TNR_TE_CMEAN_LPFCOEF2;
    volatile U_VPSS_TNR_TE_YMT_CK1 VPSS_TNR_TE_YMT_CK1;
    volatile U_VPSS_TNR_TE_YMT_CK2 VPSS_TNR_TE_YMT_CK2;
    volatile U_VPSS_TNR_TE_YEG_CK1 VPSS_TNR_TE_YEG_CK1;
    volatile U_VPSS_TNR_TE_YMT_CK VPSS_TNR_TE_YMT_CK;
    volatile U_VPSS_TNR_TE_YEG_CK VPSS_TNR_TE_YEG_CK;
    volatile U_VPSS_TNR_TE_YMOVING_CK VPSS_TNR_TE_YMOVING_CK;
    volatile U_VPSS_TNR_TFM_CMOTION_CK VPSS_TNR_TFM_CMOTION_CK;
    volatile U_VPSS_TNR_TFM_CEDGE_CK VPSS_TNR_TFM_CEDGE_CK;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_CTRL VPSS_TNR_TFM_Y_MAPPING_CTRL;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_R0 VPSS_TNR_TFM_Y_MAPPING_R0;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_R1 VPSS_TNR_TFM_Y_MAPPING_R1;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_T1 VPSS_TNR_TFM_Y_MAPPING_T1;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_T2 VPSS_TNR_TFM_Y_MAPPING_T2;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_K1 VPSS_TNR_TFM_Y_MAPPING_K1;
    volatile U_VPSS_TNR_TFM_Y_MAPPING_K2 VPSS_TNR_TFM_Y_MAPPING_K2;
    volatile U_VPSS_TNR_TFM_C_MAPPING_CTRL VPSS_TNR_TFM_C_MAPPING_CTRL;
    volatile U_VPSS_TNR_TFM_C_MAPPING_R0 VPSS_TNR_TFM_C_MAPPING_R0;
    volatile U_VPSS_TNR_TFM_C_MAPPING_R1 VPSS_TNR_TFM_C_MAPPING_R1;
    volatile U_VPSS_TNR_TFM_C_MAPPING_T1 VPSS_TNR_TFM_C_MAPPING_T1;
    volatile U_VPSS_TNR_TFM_C_MAPPING_T2 VPSS_TNR_TFM_C_MAPPING_T2;
    volatile U_VPSS_TNR_TFM_C_MAPPING_K1 VPSS_TNR_TFM_C_MAPPING_K1;
    volatile U_VPSS_TNR_TFM_C_MAPPING_K2 VPSS_TNR_TFM_C_MAPPING_K2;
    volatile U_VPSS_TNR_TFM_HISTMOTION_BLEND VPSS_TNR_TFM_HISTMOTION_BLEND;
    volatile U_VPSS_TNR_TFM_PARA  VPSS_TNR_TFM_PARA;
    volatile U_VPSS_TNR_TFM_YMOTION_CK VPSS_TNR_TFM_YMOTION_CK;
    volatile U_VPSS_TNR_TFM_YEG_CK VPSS_TNR_TFM_YEG_CK;
    volatile U_VPSS_TNR_TM_YMTMEAN_CK VPSS_TNR_TM_YMTMEAN_CK;
    volatile U_VPSS_TNR_TYMYCK    VPSS_TNR_TYMYCK;
    volatile U_VPSS_TNR_TYMEYCK   VPSS_TNR_TYMEYCK;
    volatile U_VPSS_TNR_TCMYCK    VPSS_TNR_TCMYCK;
    volatile U_VPSS_TNR_TCMEYCK   VPSS_TNR_TCMEYCK;
    volatile U_VPSS_TNR_TM_CMT_CK VPSS_TNR_TM_CMT_CK;
    volatile U_VPSS_TNR_TM_YMT_CK VPSS_TNR_TM_YMT_CK;
    volatile U_VPSS_TNR_TM_CMTMEAN_CK VPSS_TNR_TM_CMTMEAN_CK;
    volatile U_VPSS_TNR_SNR_CTRL  VPSS_TNR_SNR_CTRL;
    volatile U_VPSS_TNR_BLEND_CTRL VPSS_TNR_BLEND_CTRL;
    volatile U_VPSS_TNR_T2D_EDGE_CK VPSS_TNR_T2D_EDGE_CK;
    volatile U_VPSS_TNR_T2D_NOISE_CK VPSS_TNR_T2D_NOISE_CK;
    volatile U_VPSS_TNR_EDGE_CMOVING_CK VPSS_TNR_EDGE_CMOVING_CK;
    volatile U_VPSS_TNR_GLBMTN_THD VPSS_TNR_GLBMTN_THD;
    volatile unsigned int         Reserved_25;
    volatile U_VPSS_PFMD_THR      VPSS_PFMD_THR;
    volatile U_VPSS_PFMD_HD1P1    VPSS_PFMD_HD1P1;
    volatile U_VPSS_PFMD_HD1P2    VPSS_PFMD_HD1P2;
    volatile U_VPSS_PFMD_HD2P1    VPSS_PFMD_HD2P1;
    volatile U_VPSS_PFMD_HD2P2    VPSS_PFMD_HD2P2;
    volatile U_VPSS_PFMD_PAL1P1   VPSS_PFMD_PAL1P1;
    volatile U_VPSS_PFMD_PAL1P2   VPSS_PFMD_PAL1P2;
    volatile U_VPSS_PFMD_PAL2P1   VPSS_PFMD_PAL2P1;
    volatile U_VPSS_PFMD_PAL2P2   VPSS_PFMD_PAL2P2;
    volatile U_VPSS_PFMD_NTSC1P1  VPSS_PFMD_NTSC1P1;
    volatile U_VPSS_PFMD_NTSC1P2  VPSS_PFMD_NTSC1P2;
    volatile U_VPSS_PFMD_NTSC2P1  VPSS_PFMD_NTSC2P1;
    volatile U_VPSS_PFMD_NTSC2P2  VPSS_PFMD_NTSC2P2;
    volatile unsigned int         Reserved_26[51];
    volatile U_VPSS_TNR_CLUT10    VPSS_TNR_CLUT10;
    volatile U_VPSS_TNR_CLUT11    VPSS_TNR_CLUT11;
    volatile U_VPSS_TNR_CLUT12    VPSS_TNR_CLUT12;
    volatile U_VPSS_TNR_CLUT13    VPSS_TNR_CLUT13;
    volatile U_VPSS_TNR_CLUT14    VPSS_TNR_CLUT14;
    volatile U_VPSS_TNR_CLUT15    VPSS_TNR_CLUT15;
    volatile U_VPSS_TNR_CLUT16    VPSS_TNR_CLUT16;
    volatile U_VPSS_TNR_CLUT17    VPSS_TNR_CLUT17;
    volatile U_VPSS_TNR_CLUT18    VPSS_TNR_CLUT18;
    volatile U_VPSS_TNR_CLUT19    VPSS_TNR_CLUT19;
    volatile U_VPSS_TNR_CLUT110   VPSS_TNR_CLUT110;
    volatile U_VPSS_TNR_CLUT111   VPSS_TNR_CLUT111;
    volatile U_VPSS_TNR_CLUT112   VPSS_TNR_CLUT112;
    volatile U_VPSS_TNR_CLUT113   VPSS_TNR_CLUT113;
    volatile U_VPSS_TNR_CLUT114   VPSS_TNR_CLUT114;
    volatile U_VPSS_TNR_CLUT115   VPSS_TNR_CLUT115;
    volatile U_VPSS_TNR_CLUT20    VPSS_TNR_CLUT20;
    volatile U_VPSS_TNR_CLUT21    VPSS_TNR_CLUT21;
    volatile U_VPSS_TNR_CLUT22    VPSS_TNR_CLUT22;
    volatile U_VPSS_TNR_CLUT23    VPSS_TNR_CLUT23;
    volatile U_VPSS_TNR_CLUT24    VPSS_TNR_CLUT24;
    volatile U_VPSS_TNR_CLUT25    VPSS_TNR_CLUT25;
    volatile U_VPSS_TNR_CLUT26    VPSS_TNR_CLUT26;
    volatile U_VPSS_TNR_CLUT27    VPSS_TNR_CLUT27;
    volatile U_VPSS_TNR_CLUT28    VPSS_TNR_CLUT28;
    volatile U_VPSS_TNR_CLUT29    VPSS_TNR_CLUT29;
    volatile U_VPSS_TNR_CLUT210   VPSS_TNR_CLUT210;
    volatile U_VPSS_TNR_CLUT211   VPSS_TNR_CLUT211;
    volatile U_VPSS_TNR_CLUT212   VPSS_TNR_CLUT212;
    volatile U_VPSS_TNR_CLUT213   VPSS_TNR_CLUT213;
    volatile U_VPSS_TNR_CLUT214   VPSS_TNR_CLUT214;
    volatile U_VPSS_TNR_CLUT215   VPSS_TNR_CLUT215;
    volatile U_VPSS_TNR_CLUT216   VPSS_TNR_CLUT216;
    volatile U_VPSS_TNR_CLUT217   VPSS_TNR_CLUT217;
    volatile U_VPSS_TNR_CLUT218   VPSS_TNR_CLUT218;
    volatile U_VPSS_TNR_CLUT219   VPSS_TNR_CLUT219;
    volatile U_VPSS_TNR_CLUT220   VPSS_TNR_CLUT220;
    volatile U_VPSS_TNR_CLUT221   VPSS_TNR_CLUT221;
    volatile U_VPSS_TNR_CLUT222   VPSS_TNR_CLUT222;
    volatile U_VPSS_TNR_CLUT223   VPSS_TNR_CLUT223;
    volatile U_VPSS_TNR_CLUT224   VPSS_TNR_CLUT224;
    volatile U_VPSS_TNR_CLUT225   VPSS_TNR_CLUT225;
    volatile U_VPSS_TNR_CLUT226   VPSS_TNR_CLUT226;
    volatile U_VPSS_TNR_CLUT227   VPSS_TNR_CLUT227;
    volatile U_VPSS_TNR_CLUT228   VPSS_TNR_CLUT228;
    volatile U_VPSS_TNR_CLUT229   VPSS_TNR_CLUT229;
    volatile U_VPSS_TNR_CLUT230   VPSS_TNR_CLUT230;
    volatile U_VPSS_TNR_CLUT231   VPSS_TNR_CLUT231;
    volatile U_VPSS_TNR_CLUT232   VPSS_TNR_CLUT232;
    volatile U_VPSS_TNR_CLUT233   VPSS_TNR_CLUT233;
    volatile U_VPSS_TNR_CLUT234   VPSS_TNR_CLUT234;
    volatile U_VPSS_TNR_CLUT235   VPSS_TNR_CLUT235;
    volatile U_VPSS_TNR_CLUT236   VPSS_TNR_CLUT236;
    volatile U_VPSS_TNR_CLUT237   VPSS_TNR_CLUT237;
    volatile U_VPSS_TNR_CLUT238   VPSS_TNR_CLUT238;
    volatile U_VPSS_TNR_CLUT239   VPSS_TNR_CLUT239;
    volatile U_VPSS_TNR_CLUT240   VPSS_TNR_CLUT240;
    volatile U_VPSS_TNR_CLUT241   VPSS_TNR_CLUT241;
    volatile U_VPSS_TNR_CLUT242   VPSS_TNR_CLUT242;
    volatile U_VPSS_TNR_CLUT243   VPSS_TNR_CLUT243;
    volatile U_VPSS_TNR_CLUT244   VPSS_TNR_CLUT244;
    volatile U_VPSS_TNR_CLUT245   VPSS_TNR_CLUT245;
    volatile U_VPSS_TNR_CLUT246   VPSS_TNR_CLUT246;
    volatile U_VPSS_TNR_CLUT247   VPSS_TNR_CLUT247;
    volatile U_VPSS_TNR_CLUT248   VPSS_TNR_CLUT248;
    volatile U_VPSS_TNR_CLUT249   VPSS_TNR_CLUT249;
    volatile U_VPSS_TNR_CLUT250   VPSS_TNR_CLUT250;
    volatile U_VPSS_TNR_CLUT251   VPSS_TNR_CLUT251;
    volatile U_VPSS_TNR_CLUT252   VPSS_TNR_CLUT252;
    volatile U_VPSS_TNR_CLUT253   VPSS_TNR_CLUT253;
    volatile U_VPSS_TNR_CLUT254   VPSS_TNR_CLUT254;
    volatile U_VPSS_TNR_CLUT255   VPSS_TNR_CLUT255;
    volatile U_VPSS_TNR_CLUT256   VPSS_TNR_CLUT256;
    volatile U_VPSS_TNR_CLUT257   VPSS_TNR_CLUT257;
    volatile U_VPSS_TNR_CLUT258   VPSS_TNR_CLUT258;
    volatile U_VPSS_TNR_CLUT259   VPSS_TNR_CLUT259;
    volatile U_VPSS_TNR_CLUT260   VPSS_TNR_CLUT260;
    volatile U_VPSS_TNR_CLUT261   VPSS_TNR_CLUT261;
    volatile U_VPSS_TNR_CLUT262   VPSS_TNR_CLUT262;
    volatile U_VPSS_TNR_CLUT263   VPSS_TNR_CLUT263;
    volatile U_VPSS_TNR_CLUT264   VPSS_TNR_CLUT264;
    volatile U_VPSS_TNR_CLUT265   VPSS_TNR_CLUT265;
    volatile U_VPSS_TNR_CLUT266   VPSS_TNR_CLUT266;
    volatile U_VPSS_TNR_CLUT267   VPSS_TNR_CLUT267;
    volatile U_VPSS_TNR_CLUT268   VPSS_TNR_CLUT268;
    volatile U_VPSS_TNR_CLUT269   VPSS_TNR_CLUT269;
    volatile U_VPSS_TNR_CLUT270   VPSS_TNR_CLUT270;
    volatile U_VPSS_TNR_CLUT271   VPSS_TNR_CLUT271;
    volatile U_VPSS_TNR_CLUT272   VPSS_TNR_CLUT272;
    volatile U_VPSS_TNR_CLUT273   VPSS_TNR_CLUT273;
    volatile U_VPSS_TNR_CLUT274   VPSS_TNR_CLUT274;
    volatile U_VPSS_TNR_CLUT275   VPSS_TNR_CLUT275;
    volatile U_VPSS_TNR_CLUT276   VPSS_TNR_CLUT276;
    volatile U_VPSS_TNR_CLUT277   VPSS_TNR_CLUT277;
    volatile U_VPSS_TNR_CLUT278   VPSS_TNR_CLUT278;
    volatile U_VPSS_TNR_CLUT279   VPSS_TNR_CLUT279;
    volatile U_VPSS_TNR_CLUT280   VPSS_TNR_CLUT280;
    volatile U_VPSS_TNR_CLUT281   VPSS_TNR_CLUT281;
    volatile U_VPSS_TNR_CLUT282   VPSS_TNR_CLUT282;
    volatile U_VPSS_TNR_CLUT283   VPSS_TNR_CLUT283;
    volatile U_VPSS_TNR_CLUT284   VPSS_TNR_CLUT284;
    volatile U_VPSS_TNR_CLUT285   VPSS_TNR_CLUT285;
    volatile U_VPSS_TNR_CLUT286   VPSS_TNR_CLUT286;
    volatile U_VPSS_TNR_CLUT287   VPSS_TNR_CLUT287;
    volatile U_VPSS_TNR_CLUT288   VPSS_TNR_CLUT288;
    volatile U_VPSS_TNR_CLUT289   VPSS_TNR_CLUT289;
    volatile U_VPSS_TNR_CLUT290   VPSS_TNR_CLUT290;
    volatile U_VPSS_TNR_CLUT291   VPSS_TNR_CLUT291;
    volatile U_VPSS_TNR_CLUT292   VPSS_TNR_CLUT292;
    volatile U_VPSS_TNR_CLUT293   VPSS_TNR_CLUT293;
    volatile U_VPSS_TNR_CLUT294   VPSS_TNR_CLUT294;
    volatile U_VPSS_TNR_CLUT295   VPSS_TNR_CLUT295;
    volatile U_VPSS_TNR_CLUT296   VPSS_TNR_CLUT296;
    volatile U_VPSS_TNR_CLUT297   VPSS_TNR_CLUT297;
    volatile U_VPSS_TNR_CLUT298   VPSS_TNR_CLUT298;
    volatile U_VPSS_TNR_CLUT299   VPSS_TNR_CLUT299;
    volatile U_VPSS_TNR_CLUT2100  VPSS_TNR_CLUT2100;
    volatile U_VPSS_TNR_CLUT2101  VPSS_TNR_CLUT2101;
    volatile U_VPSS_TNR_CLUT2102  VPSS_TNR_CLUT2102;
    volatile U_VPSS_TNR_CLUT2103  VPSS_TNR_CLUT2103;
    volatile U_VPSS_TNR_CLUT2104  VPSS_TNR_CLUT2104;
    volatile U_VPSS_TNR_CLUT2105  VPSS_TNR_CLUT2105;
    volatile U_VPSS_TNR_CLUT2106  VPSS_TNR_CLUT2106;
    volatile U_VPSS_TNR_CLUT2107  VPSS_TNR_CLUT2107;
    volatile U_VPSS_TNR_CLUT2108  VPSS_TNR_CLUT2108;
    volatile U_VPSS_TNR_CLUT2109  VPSS_TNR_CLUT2109;
    volatile U_VPSS_TNR_CLUT2110  VPSS_TNR_CLUT2110;
    volatile U_VPSS_TNR_CLUT2111  VPSS_TNR_CLUT2111;
    volatile U_VPSS_TNR_CLUT2112  VPSS_TNR_CLUT2112;
    volatile U_VPSS_TNR_CLUT2113  VPSS_TNR_CLUT2113;
    volatile U_VPSS_TNR_CLUT2114  VPSS_TNR_CLUT2114;
    volatile U_VPSS_TNR_CLUT2115  VPSS_TNR_CLUT2115;
    volatile U_VPSS_TNR_CLUT2116  VPSS_TNR_CLUT2116;
    volatile U_VPSS_TNR_CLUT2117  VPSS_TNR_CLUT2117;
    volatile U_VPSS_TNR_CLUT2118  VPSS_TNR_CLUT2118;
    volatile U_VPSS_TNR_CLUT2119  VPSS_TNR_CLUT2119;
    volatile U_VPSS_TNR_CLUT2120  VPSS_TNR_CLUT2120;
    volatile U_VPSS_TNR_CLUT2121  VPSS_TNR_CLUT2121;
    volatile U_VPSS_TNR_CLUT2122  VPSS_TNR_CLUT2122;
    volatile U_VPSS_TNR_CLUT2123  VPSS_TNR_CLUT2123;
    volatile U_VPSS_TNR_CLUT2124  VPSS_TNR_CLUT2124;
    volatile U_VPSS_TNR_CLUT2125  VPSS_TNR_CLUT2125;
    volatile U_VPSS_TNR_CLUT2126  VPSS_TNR_CLUT2126;
    volatile U_VPSS_TNR_CLUT2127  VPSS_TNR_CLUT2127;
    volatile U_VPSS_TNR_CLUT30    VPSS_TNR_CLUT30;
    volatile U_VPSS_TNR_CLUT31    VPSS_TNR_CLUT31;
    volatile U_VPSS_TNR_CLUT32    VPSS_TNR_CLUT32;
    volatile U_VPSS_TNR_CLUT33    VPSS_TNR_CLUT33;
    volatile U_VPSS_TNR_CLUT34    VPSS_TNR_CLUT34;
    volatile U_VPSS_TNR_CLUT35    VPSS_TNR_CLUT35;
    volatile U_VPSS_TNR_CLUT36    VPSS_TNR_CLUT36;
    volatile U_VPSS_TNR_CLUT37    VPSS_TNR_CLUT37;
    volatile U_VPSS_TNR_CLUT38    VPSS_TNR_CLUT38;
    volatile U_VPSS_TNR_CLUT39    VPSS_TNR_CLUT39;
    volatile U_VPSS_TNR_CLUT310   VPSS_TNR_CLUT310;
    volatile U_VPSS_TNR_CLUT311   VPSS_TNR_CLUT311;
    volatile U_VPSS_TNR_CLUT312   VPSS_TNR_CLUT312;
    volatile U_VPSS_TNR_CLUT313   VPSS_TNR_CLUT313;
    volatile U_VPSS_TNR_CLUT314   VPSS_TNR_CLUT314;
    volatile U_VPSS_TNR_CLUT315   VPSS_TNR_CLUT315;
    volatile U_VPSS_TNR_CLUT316   VPSS_TNR_CLUT316;
    volatile U_VPSS_TNR_CLUT317   VPSS_TNR_CLUT317;
    volatile U_VPSS_TNR_CLUT318   VPSS_TNR_CLUT318;
    volatile U_VPSS_TNR_CLUT319   VPSS_TNR_CLUT319;
    volatile U_VPSS_TNR_CLUT320   VPSS_TNR_CLUT320;
    volatile U_VPSS_TNR_CLUT321   VPSS_TNR_CLUT321;
    volatile U_VPSS_TNR_CLUT322   VPSS_TNR_CLUT322;
    volatile U_VPSS_TNR_CLUT323   VPSS_TNR_CLUT323;
    volatile U_VPSS_TNR_CLUT324   VPSS_TNR_CLUT324;
    volatile U_VPSS_TNR_CLUT325   VPSS_TNR_CLUT325;
    volatile U_VPSS_TNR_CLUT326   VPSS_TNR_CLUT326;
    volatile U_VPSS_TNR_CLUT327   VPSS_TNR_CLUT327;
    volatile U_VPSS_TNR_CLUT328   VPSS_TNR_CLUT328;
    volatile U_VPSS_TNR_CLUT329   VPSS_TNR_CLUT329;
    volatile U_VPSS_TNR_CLUT330   VPSS_TNR_CLUT330;
    volatile U_VPSS_TNR_CLUT331   VPSS_TNR_CLUT331;
    volatile U_VPSS_TNR_CLUT40    VPSS_TNR_CLUT40;
    volatile U_VPSS_TNR_CLUT41    VPSS_TNR_CLUT41;
    volatile U_VPSS_TNR_CLUT42    VPSS_TNR_CLUT42;
    volatile U_VPSS_TNR_CLUT43    VPSS_TNR_CLUT43;
    volatile U_VPSS_TNR_CLUT44    VPSS_TNR_CLUT44;
    volatile U_VPSS_TNR_CLUT45    VPSS_TNR_CLUT45;
    volatile U_VPSS_TNR_CLUT46    VPSS_TNR_CLUT46;
    volatile U_VPSS_TNR_CLUT47    VPSS_TNR_CLUT47;
    volatile U_VPSS_TNR_CLUT48    VPSS_TNR_CLUT48;
    volatile U_VPSS_TNR_CLUT49    VPSS_TNR_CLUT49;
    volatile U_VPSS_TNR_CLUT410   VPSS_TNR_CLUT410;
    volatile U_VPSS_TNR_CLUT411   VPSS_TNR_CLUT411;
    volatile U_VPSS_TNR_CLUT412   VPSS_TNR_CLUT412;
    volatile U_VPSS_TNR_CLUT413   VPSS_TNR_CLUT413;
    volatile U_VPSS_TNR_CLUT414   VPSS_TNR_CLUT414;
    volatile U_VPSS_TNR_CLUT415   VPSS_TNR_CLUT415;
    volatile U_VPSS_TNR_CLUT416   VPSS_TNR_CLUT416;
    volatile U_VPSS_TNR_CLUT417   VPSS_TNR_CLUT417;
    volatile U_VPSS_TNR_CLUT418   VPSS_TNR_CLUT418;
    volatile U_VPSS_TNR_CLUT419   VPSS_TNR_CLUT419;
    volatile U_VPSS_TNR_CLUT420   VPSS_TNR_CLUT420;
    volatile U_VPSS_TNR_CLUT421   VPSS_TNR_CLUT421;
    volatile U_VPSS_TNR_CLUT422   VPSS_TNR_CLUT422;
    volatile U_VPSS_TNR_CLUT423   VPSS_TNR_CLUT423;
    volatile U_VPSS_TNR_CLUT424   VPSS_TNR_CLUT424;
    volatile U_VPSS_TNR_CLUT425   VPSS_TNR_CLUT425;
    volatile U_VPSS_TNR_CLUT426   VPSS_TNR_CLUT426;
    volatile U_VPSS_TNR_CLUT427   VPSS_TNR_CLUT427;
    volatile U_VPSS_TNR_CLUT428   VPSS_TNR_CLUT428;
    volatile U_VPSS_TNR_CLUT429   VPSS_TNR_CLUT429;
    volatile U_VPSS_TNR_CLUT430   VPSS_TNR_CLUT430;
    volatile U_VPSS_TNR_CLUT431   VPSS_TNR_CLUT431;
    volatile unsigned int         Reserved_27[112];
    volatile U_VPSS_DEBUG0        VPSS_DEBUG0;
    volatile U_VPSS_DEBUG1        VPSS_DEBUG1;
    volatile U_VPSS_DEBUG2        VPSS_DEBUG2;
    volatile U_VPSS_DEBUG3        VPSS_DEBUG3;
    volatile U_VPSS_DEBUG4        VPSS_DEBUG4;
    volatile U_VPSS_DEBUG5        VPSS_DEBUG5;
    volatile U_VPSS_DEBUG6        VPSS_DEBUG6;
    volatile U_VPSS_DEBUG7        VPSS_DEBUG7;
    volatile U_VPSS_DEBUG8        VPSS_DEBUG8;
    volatile U_VPSS_DEBUG9        VPSS_DEBUG9;
    volatile U_VPSS_DEBUG10       VPSS_DEBUG10;
    volatile U_VPSS_DEBUG11       VPSS_DEBUG11;
    volatile U_VPSS_DEBUG12       VPSS_DEBUG12;
    volatile U_VPSS_DEBUG13       VPSS_DEBUG13;
    volatile U_VPSS_DEBUG14       VPSS_DEBUG14;
    volatile U_VPSS_DEBUG15       VPSS_DEBUG15;
    volatile U_VPSS_DEBUG16       VPSS_DEBUG16;
    volatile U_VPSS_DEBUG17       VPSS_DEBUG17;
    volatile U_VPSS_DEBUG18       VPSS_DEBUG18;
    volatile U_VPSS_DEBUG19       VPSS_DEBUG19;
    volatile U_VPSS_DEBUG20       VPSS_DEBUG20;
    volatile U_VPSS_DEBUG21       VPSS_DEBUG21;
    volatile U_VPSS_DEBUG22       VPSS_DEBUG22;
    volatile U_VPSS_DEBUG23       VPSS_DEBUG23;
    volatile U_VPSS_DEBUG24       VPSS_DEBUG24;
    volatile U_VPSS_DEBUG25       VPSS_DEBUG25;
    volatile U_VPSS_DEBUG26       VPSS_DEBUG26;
    volatile U_VPSS_DEBUG27       VPSS_DEBUG27;
    volatile U_VPSS_DEBUG28       VPSS_DEBUG28;
    volatile U_VPSS_DEBUG29       VPSS_DEBUG29;
    volatile U_VPSS_DEBUG30       VPSS_DEBUG30;
    volatile U_VPSS_DEBUG31       VPSS_DEBUG31;
    volatile U_VPSS_DEBUG32       VPSS_DEBUG32;
    volatile U_VPSS_DEBUG33       VPSS_DEBUG33;
    volatile U_VPSS_DEBUG34       VPSS_DEBUG34;
    volatile U_VPSS_DEBUG35       VPSS_DEBUG35;
    volatile U_VPSS_DEBUG36       VPSS_DEBUG36;
    volatile U_VPSS_DEBUG37       VPSS_DEBUG37;
    volatile U_VPSS_DEBUG38       VPSS_DEBUG38;
    volatile U_VPSS_DEBUG39       VPSS_DEBUG39;
    volatile U_VPSS_DEBUG40       VPSS_DEBUG40;
    volatile U_VPSS_DEBUG41       VPSS_DEBUG41;
    volatile U_VPSS_DEBUG42       VPSS_DEBUG42;
    volatile U_VPSS_DEBUG43       VPSS_DEBUG43;
    
} S_CAS_REGS_TYPE,VPSS_REG_S;

#endif // __C_UNION_DEFINE_H__

