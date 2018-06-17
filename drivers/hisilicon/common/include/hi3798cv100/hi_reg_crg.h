//******************************************************************************
//  Copyright (C), 2007-2014, Hisilicon Technologies Co., Ltd.
//
//******************************************************************************
// File name     : hi_reg_crg.h
// Version       : 2.0
// Author        : xxx
// Created       : 2014-02-25
// Last Modified : 
// Description   :  The C union definition file for the module CRG
// Function List : 
// History       : 
// 1 Date        : 
// Author        : xxx
// Modification  : Create file
//******************************************************************************

#ifndef __HI_REG_CRG_H__
#define __HI_REG_CRG_H__

/* Define the union U_PERI_CRG_PLL0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg0_apb      : 31  ; /* [30..0]  */
        unsigned int    Reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL0;

/* Define the union U_PERI_CRG_PLL1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg1_apb      : 27  ; /* [26..0]  */
        unsigned int    Reserved_1            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL1;

/* Define the union U_PERI_CRG_PLL2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_2            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL2;

/* Define the union U_PERI_CRG_PLL3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_3            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL3;

/* Define the union U_PERI_CRG_PLL4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg0_apb      : 31  ; /* [30..0]  */
        unsigned int    Reserved_4            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL4;

/* Define the union U_PERI_CRG_PLL5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg1_apb      : 27  ; /* [26..0]  */
        unsigned int    Reserved_5            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL5;

/* Define the union U_PERI_CRG_PLL8 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_6            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL8;

/* Define the union U_PERI_CRG_PLL9 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_8            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL9;

/* Define the union U_PERI_CRG_PLL10 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_9            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL10;

/* Define the union U_PERI_CRG_PLL11 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_10           : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL11;

/* Define the union U_PERI_CRG_PLL12 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    epll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_11           : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL12;

/* Define the union U_PERI_CRG_PLL13 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    epll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_12           : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL13;

/* Define the union U_PERI_CRG_PLL16 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_13           : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL16;

/* Define the union U_PERI_CRG_PLL17 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_15           : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL17;

/* Define the union U_PERI_CRG18 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_freq_sel_cfg_crg  : 3   ; /* [2..0]  */
        unsigned int    Reserved_18           : 1   ; /* [3]  */
        unsigned int    cpu_freq_div_cfg_crg  : 2   ; /* [5..4]  */
        unsigned int    Reserved_17           : 2   ; /* [7..6]  */
        unsigned int    cpu_div_cfg_bypass    : 1   ; /* [8]  */
        unsigned int    cpu_begin_cfg_bypass  : 1   ; /* [9]  */
        unsigned int    cpu_sw_begin_cfg      : 1   ; /* [10]  */
        unsigned int    Reserved_16           : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG18;

/* Define the union U_PERI_CRG19 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    timeout_plllock       : 12  ; /* [11..0]  */
        unsigned int    lock_bypass           : 1   ; /* [12]  */
        unsigned int    pll_cfg_bypass        : 1   ; /* [13]  */
        unsigned int    Reserved_19           : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG19;

/* Define the union U_PERI_CRG20 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_clkoff_sys        : 4   ; /* [3..0]  */
        unsigned int    neon_clkoff_sys       : 4   ; /* [7..4]  */
        unsigned int    l2_clkoff_sys         : 1   ; /* [8]  */
        unsigned int    a9_pclkdbg_cken       : 1   ; /* [9]  */
        unsigned int    Reserved_21           : 1   ; /* [10]  */
        unsigned int    a9_peri_cken          : 1   ; /* [11]  */
        unsigned int    arm_srst_req          : 4   ; /* [15..12]  */
        unsigned int    neon_srst_req         : 4   ; /* [19..16]  */
        unsigned int    cs_srst_req           : 1   ; /* [20]  */
        unsigned int    cluster_peri_srst_req  : 1   ; /* [21]  */
        unsigned int    cluster_scu_srst_req  : 1   ; /* [22]  */
        unsigned int    cluster_dbg_srst_req  : 4   ; /* [26..23]  */
        unsigned int    sc_wd_srst_req        : 4   ; /* [30..27]  */
        unsigned int    Reserved_20           : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG20;

/* Define the union U_PERI_CRG21 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    l2_clk_div            : 2   ; /* [1..0]  */
        unsigned int    Reserved_23           : 6   ; /* [7..2]  */
        unsigned int    peri_clk_div          : 3   ; /* [10..8]  */
        unsigned int    l2_dataram_clken_sel  : 1   ; /* [11]  */
        unsigned int    Reserved_22           : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG21;

/* Define the union U_PERI_CRG23 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sfc_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_26           : 3   ; /* [3..1]  */
        unsigned int    sfc_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_25           : 3   ; /* [7..5]  */
        unsigned int    sfc_clk_sel           : 3   ; /* [10..8]  */
        unsigned int    Reserved_24           : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG23;

/* Define the union U_PERI_CRG24 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    nf_cken               : 1   ; /* [0]  */
        unsigned int    Reserved_30           : 3   ; /* [3..1]  */
        unsigned int    nf_srst_req           : 1   ; /* [4]  */
        unsigned int    Reserved_29           : 3   ; /* [7..5]  */
        unsigned int    nf_clk_sel            : 3   ; /* [10..8]  */
        unsigned int    Reserved_28           : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG24;

/* Define the union U_PERI_CRG25 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrphy1_cken          : 1   ; /* [0]  */
        unsigned int    ddrphy0_cken          : 1   ; /* [1]  */
        unsigned int    hipack_cken           : 1   ; /* [2]  */
        unsigned int    ddrc_apb_cken         : 1   ; /* [3]  */
        unsigned int    Reserved_35           : 1   ; /* [4]  */
        unsigned int    tap_cken              : 1   ; /* [5]  */
        unsigned int    ddrt0_cken            : 1   ; /* [6]  */
        unsigned int    ddrt1_cken            : 1   ; /* [7]  */
        unsigned int    hipack_srst_req       : 1   ; /* [8]  */
        unsigned int    ddrc_apb_srst_req     : 1   ; /* [9]  */
        unsigned int    Reserved_34           : 2   ; /* [11..10]  */
        unsigned int    ddrt0_srst_req        : 1   ; /* [12]  */
        unsigned int    Reserved_33           : 3   ; /* [15..13]  */
        unsigned int    ddrt1_srst_req        : 1   ; /* [16]  */
        unsigned int    Reserved_32           : 3   ; /* [19..17]  */
        unsigned int    tap_srst_req          : 1   ; /* [20]  */
        unsigned int    reserve_for_eco_ddr   : 6   ; /* [26..21]  */
        unsigned int    Reserved_31           : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG25;

/* Define the union U_PERI_CRG26 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    uart0_cken            : 1   ; /* [0]  */
        unsigned int    uart0_srst_req        : 1   ; /* [1]  */
        unsigned int    Reserved_38           : 2   ; /* [3..2]  */
        unsigned int    uart2_cken            : 1   ; /* [4]  */
        unsigned int    uart2_srst_req        : 1   ; /* [5]  */
        unsigned int    Reserved_37           : 8   ; /* [13..6]  */
        unsigned int    Reserved_36           : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG26;

/* Define the union U_PERI_CRG27 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    i2c0_cken             : 1   ; /* [0]  */
        unsigned int    i2c1_cken             : 1   ; /* [1]  */
        unsigned int    i2c2_cken             : 1   ; /* [2]  */
        unsigned int    i2c3_cken             : 1   ; /* [3]  */
        unsigned int    i2c4_cken             : 1   ; /* [4]  */
        unsigned int    i2c5_cken             : 1   ; /* [5]  */
        unsigned int    i2c6_cken             : 1   ; /* [6]  */
        unsigned int    i2c_qamc_cken         : 1   ; /* [7]  */
        unsigned int    i2c_qamadc_cken       : 1   ; /* [8]  */
        unsigned int    i2c_qamt_cken         : 1   ; /* [9]  */
        unsigned int    i2c7_cken             : 1   ; /* [10]  */
        unsigned int    Reserved_41           : 1   ; /* [11]  */
        unsigned int    i2c0_srst_req         : 1   ; /* [12]  */
        unsigned int    i2c1_srst_req         : 1   ; /* [13]  */
        unsigned int    i2c2_srst_req         : 1   ; /* [14]  */
        unsigned int    i2c3_srst_req         : 1   ; /* [15]  */
        unsigned int    i2c4_srst_req         : 1   ; /* [16]  */
        unsigned int    i2c5_srst_req         : 1   ; /* [17]  */
        unsigned int    i2c6_srst_req         : 1   ; /* [18]  */
        unsigned int    i2c_qamc_srst_req     : 1   ; /* [19]  */
        unsigned int    i2c_qamadc_srst_req   : 1   ; /* [20]  */
        unsigned int    i2c_qamt_srst_req     : 1   ; /* [21]  */
        unsigned int    i2c7_srst_req         : 1   ; /* [22]  */
        unsigned int    Reserved_40           : 1   ; /* [23]  */
        unsigned int    Reserved_39           : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG27;

/* Define the union U_PERI_CRG28 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ssp0_cken             : 1   ; /* [0]  */
        unsigned int    ssp0_srst_req         : 1   ; /* [1]  */
        unsigned int    Reserved_44           : 2   ; /* [3..2]  */
        unsigned int    ssp1_cken             : 1   ; /* [4]  */
        unsigned int    ssp1_srst_req         : 1   ; /* [5]  */
        unsigned int    Reserved_43           : 2   ; /* [7..6]  */
        unsigned int    Reserved_42           : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG28;

/* Define the union U_PERI_CRG29 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sci0_cken             : 1   ; /* [0]  */
        unsigned int    sci0_srst_req         : 1   ; /* [1]  */
        unsigned int    Reserved_47           : 2   ; /* [3..2]  */
        unsigned int    sci1_cken             : 1   ; /* [4]  */
        unsigned int    sci1_srst_req         : 1   ; /* [5]  */
        unsigned int    Reserved_46           : 2   ; /* [7..6]  */
        unsigned int    Reserved_45           : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG29;

/* Define the union U_PERI_CRG30 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdh_cken              : 1   ; /* [0]  */
        unsigned int    vdhdsp_cken           : 1   ; /* [1]  */
        unsigned int    Reserved_51           : 2   ; /* [3..2]  */
        unsigned int    vdh_all_srst_req      : 1   ; /* [4]  */
        unsigned int    vdh_scd_srst_req      : 1   ; /* [5]  */
        unsigned int    vdh_mfd_srst_req      : 1   ; /* [6]  */
        unsigned int    Reserved_50           : 1   ; /* [7]  */
        unsigned int    vdh_clk_sel           : 3   ; /* [10..8]  */
        unsigned int    Reserved_49           : 1   ; /* [11]  */
        unsigned int    vdhclk_skipcfg        : 5   ; /* [16..12]  */
        unsigned int    vdhclk_loaden         : 1   ; /* [17]  */
        unsigned int    Reserved_48           : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG30;

/* Define the union U_PERI_CRG31 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    jpgd_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_54           : 3   ; /* [3..1]  */
        unsigned int    jpgd_srst_req         : 1   ; /* [4]  */
        unsigned int    Reserved_53           : 3   ; /* [7..5]  */
        unsigned int    jpgd_clk_sel          : 1   ; /* [8]  */
        unsigned int    Reserved_52           : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG31;

/* Define the union U_PERI_CRG33 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pgd_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_56           : 3   ; /* [3..1]  */
        unsigned int    pgd_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_55           : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG33;

/* Define the union U_PERI_CRG34 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bpd_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_59           : 3   ; /* [3..1]  */
        unsigned int    bpd_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_58           : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG34;

/* Define the union U_PERI_CRG35 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    venc_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_63           : 3   ; /* [3..1]  */
        unsigned int    venc_srst_req         : 1   ; /* [4]  */
        unsigned int    Reserved_62           : 3   ; /* [7..5]  */
        unsigned int    venc_clk_sel          : 1   ; /* [8]  */
        unsigned int    Reserved_61           : 3   ; /* [11..9]  */
        unsigned int    venc_clk_sel_bus      : 1   ; /* [12]  */
        unsigned int    Reserved_60           : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG35;

/* Define the union U_PERI_CRG36 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    jpge_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_66           : 3   ; /* [3..1]  */
        unsigned int    jpge_srst_req         : 1   ; /* [4]  */
        unsigned int    Reserved_65           : 3   ; /* [7..5]  */
        unsigned int    jpge_clk_sel          : 2   ; /* [9..8]  */
        unsigned int    jpge_clk_sel_bus      : 1   ; /* [10]  */
        unsigned int    Reserved_64           : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG36;

/* Define the union U_PERI_CRG37 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    tde_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_69           : 3   ; /* [3..1]  */
        unsigned int    tde_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_68           : 3   ; /* [7..5]  */
        unsigned int    tdeclk_skipcfg        : 5   ; /* [12..8]  */
        unsigned int    tdeclk_loaden         : 1   ; /* [13]  */
        unsigned int    Reserved_67           : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG37;

/* Define the union U_PERI_CRG39 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sdio0_bus_cken        : 1   ; /* [0]  */
        unsigned int    sdio0_cken            : 1   ; /* [1]  */
        unsigned int    Reserved_74           : 2   ; /* [3..2]  */
        unsigned int    sdio0_srst_req        : 1   ; /* [4]  */
        unsigned int    Reserved_73           : 3   ; /* [7..5]  */
        unsigned int    sdio0_clk_sel         : 2   ; /* [9..8]  */
        unsigned int    Reserved_72           : 2   ; /* [11..10]  */
        unsigned int    sdio0_sap_ps_sel      : 3   ; /* [14..12]  */
        unsigned int    Reserved_71           : 1   ; /* [15]  */
        unsigned int    sdio0_drv_ps_sel      : 3   ; /* [18..16]  */
        unsigned int    Reserved_70           : 13  ; /* [31..19]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG39;

/* Define the union U_PERI_CRG40 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sdio1_bus_cken        : 1   ; /* [0]  */
        unsigned int    sdio1_cken            : 1   ; /* [1]  */
        unsigned int    Reserved_80           : 2   ; /* [3..2]  */
        unsigned int    sdio1_srst_req        : 1   ; /* [4]  */
        unsigned int    Reserved_79           : 3   ; /* [7..5]  */
        unsigned int    sdio1_clk_sel         : 2   ; /* [9..8]  */
        unsigned int    Reserved_78           : 2   ; /* [11..10]  */
        unsigned int    sdio1_sap_ps_sel      : 3   ; /* [14..12]  */
        unsigned int    Reserved_77           : 1   ; /* [15]  */
        unsigned int    sdio1_drv_ps_sel      : 3   ; /* [18..16]  */
        unsigned int    Reserved_76           : 13  ; /* [31..19]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG40;

/* Define the union U_PERI_CRG46 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_bus_cken         : 1   ; /* [0]  */
        unsigned int    usb2_ohci48m_cken     : 1   ; /* [1]  */
        unsigned int    usb2_ohci12m_cken     : 1   ; /* [2]  */
        unsigned int    Reserved_84           : 1   ; /* [3]  */
        unsigned int    usb2_hst_phy_cken     : 1   ; /* [4]  */
        unsigned int    usb2_utmi0_cken       : 1   ; /* [5]  */
        unsigned int    usb2_utmi1_cken       : 1   ; /* [6]  */
        unsigned int    usb2_utmi2_cken       : 1   ; /* [7]  */
        unsigned int    Reserved_83           : 4   ; /* [11..8]  */
        unsigned int    usb2_bus_srst_req     : 1   ; /* [12]  */
        unsigned int    usb2_utmi0_srst_req   : 1   ; /* [13]  */
        unsigned int    usb2_utmi1_srst_req   : 1   ; /* [14]  */
        unsigned int    usb2_utmi2_srst_req   : 1   ; /* [15]  */
        unsigned int    usb2_hst_phy_srst_req  : 1   ; /* [16]  */
        unsigned int    Reserved_82           : 1   ; /* [17]  */
        unsigned int    Reserved_81           : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG46;

/* Define the union U_PERI_CRG47 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_phy0_ref_cken    : 1   ; /* [0]  */
        unsigned int    usb2_phy1_ref_cken    : 1   ; /* [1]  */
        unsigned int    usb2_phy2_ref_cken    : 1   ; /* [2]  */
        unsigned int    Reserved_88           : 5   ; /* [7..3]  */
        unsigned int    usb2_phy0_srst_req    : 1   ; /* [8]  */
        unsigned int    usb2_phy0_srst_treq   : 1   ; /* [9]  */
        unsigned int    usb2_phy1_srst_req    : 1   ; /* [10]  */
        unsigned int    usb2_phy1_srst_treq   : 1   ; /* [11]  */
        unsigned int    usb2_phy2_srst_req    : 1   ; /* [12]  */
        unsigned int    usb2_phy2_srst_treq   : 1   ; /* [13]  */
        unsigned int    Reserved_87           : 2   ; /* [15..14]  */
        unsigned int    usb2_phy0_refclk_sel  : 1   ; /* [16]  */
        unsigned int    usb2_phy1_refclk_sel  : 1   ; /* [17]  */
        unsigned int    usb2_phy2_refclk_sel  : 1   ; /* [18]  */
        unsigned int    Reserved_86           : 13  ; /* [31..19]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG47;

/* Define the union U_PERI_CRG48 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    Reserved_91           : 8   ; /* [7..0]  */
        unsigned int    ca_kl_srst_req        : 1   ; /* [8]  */
        unsigned int    ca_ci_srst_req        : 1   ; /* [9]  */
        unsigned int    otp_srst_req          : 1   ; /* [10]  */
        unsigned int    Reserved_90           : 1   ; /* [11]  */
        unsigned int    ca_ci_clk_sel         : 1   ; /* [12]  */
        unsigned int    Reserved_89           : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG48;

/* Define the union U_PERI_CRG49 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sha_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_93           : 3   ; /* [3..1]  */
        unsigned int    sha_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_92           : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG49;

/* Define the union U_PERI_CRG50 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pmc_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_95           : 3   ; /* [3..1]  */
        unsigned int    pmc_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_94           : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG50;

/* Define the union U_PERI_CRG51 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    gsf_bus_m2_cken       : 1   ; /* [0]  */
        unsigned int    gsf_bus_m0_cken       : 1   ; /* [1]  */
        unsigned int    gsf_bus_m1_cken       : 1   ; /* [2]  */
        unsigned int    Reserved_99           : 1   ; /* [3]  */
        unsigned int    gsf_ge0_cken          : 1   ; /* [4]  */
        unsigned int    gsf_ge1_cken          : 1   ; /* [5]  */
        unsigned int    gsf_ge2_cken          : 1   ; /* [6]  */
        unsigned int    Reserved_98           : 1   ; /* [7]  */
        unsigned int    mac_if0_cken          : 1   ; /* [8]  */
        unsigned int    mac_if1_cken          : 1   ; /* [9]  */
        unsigned int    Reserved_97           : 2   ; /* [11..10]  */
        unsigned int    gsf_g0_srst_req       : 1   ; /* [12]  */
        unsigned int    gsf_g1_srst_req       : 1   ; /* [13]  */
        unsigned int    gsf_mac0_srst_req     : 1   ; /* [14]  */
        unsigned int    gsf_mac1_srst_req     : 1   ; /* [15]  */
        unsigned int    gsf_rmii0_clk_sel     : 1   ; /* [16]  */
        unsigned int    gsf_rmii1_clk_sel     : 1   ; /* [17]  */
        unsigned int    gsf_clk_sel           : 1   ; /* [18]  */
        unsigned int    gsf_rmii0_clk_oen     : 1   ; /* [19]  */
        unsigned int    gsf_rmii1_clk_oen     : 1   ; /* [20]  */
        unsigned int    Reserved_96           : 11  ; /* [31..21]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG51;

/* Define the union U_PERI_CRG52 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dsp1_cken             : 1   ; /* [0]  */
        unsigned int    dsp0_cken             : 1   ; /* [1]  */
        unsigned int    Reserved_103          : 2   ; /* [3..2]  */
        unsigned int    dsp1_srst_req         : 1   ; /* [4]  */
        unsigned int    dsp0_srst_req         : 1   ; /* [5]  */
        unsigned int    Reserved_102          : 2   ; /* [7..6]  */
        unsigned int    dsp_clk_sel           : 2   ; /* [9..8]  */
        unsigned int    Reserved_101          : 8   ; /* [17..10]  */
        unsigned int    Reserved_100          : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG52;

/* Define the union U_PERI_CRG53 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    gpu_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_106          : 3   ; /* [3..1]  */
        unsigned int    gpu_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_105          : 3   ; /* [7..5]  */
        unsigned int    gpu_pp0_cken          : 1   ; /* [8]  */
        unsigned int    gpu_pp1_cken          : 1   ; /* [9]  */
        unsigned int    gpu_pp2_cken          : 1   ; /* [10]  */
        unsigned int    gpu_pp3_cken          : 1   ; /* [11]  */
        unsigned int    Reserved_104          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG53;

/* Define the union U_PERI_CRG54 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vo_bus_cken           : 1   ; /* [0]  */
        unsigned int    Reserved_110          : 1   ; /* [1]  */
        unsigned int    vo_sd_cken            : 1   ; /* [2]  */
        unsigned int    vo_sdate_cken         : 1   ; /* [3]  */
        unsigned int    vo_hd_cken            : 1   ; /* [4]  */
        unsigned int    vo_hdate_cken         : 1   ; /* [5]  */
        unsigned int    vdac_ch0_cken         : 1   ; /* [6]  */
        unsigned int    vdac_ch1_cken         : 1   ; /* [7]  */
        unsigned int    vdac_ch2_cken         : 1   ; /* [8]  */
        unsigned int    vdac_ch3_cken         : 1   ; /* [9]  */
        unsigned int    vo_clkout_cken        : 1   ; /* [10]  */
        unsigned int    Reserved_109          : 1   ; /* [11]  */
        unsigned int    vo_sd_clk_sel         : 2   ; /* [13..12]  */
        unsigned int    vo_sd_clk_div         : 2   ; /* [15..14]  */
        unsigned int    vo_hd_clk_sel         : 2   ; /* [17..16]  */
        unsigned int    vo_hd_clk_div         : 2   ; /* [19..18]  */
        unsigned int    vdac_ch0_clk_sel      : 1   ; /* [20]  */
        unsigned int    vdac_ch1_clk_sel      : 1   ; /* [21]  */
        unsigned int    vdac_ch2_clk_sel      : 1   ; /* [22]  */
        unsigned int    vdac_ch3_clk_sel      : 1   ; /* [23]  */
        unsigned int    vo_clkout_sel         : 1   ; /* [24]  */
        unsigned int    vo_clkout_pctrl       : 1   ; /* [25]  */
        unsigned int    hdmi_clk_sel          : 1   ; /* [26]  */
        unsigned int    vo_sd_hdmi_clk_sel    : 1   ; /* [27]  */
        unsigned int    Reserved_108          : 1   ; /* [28]  */
        unsigned int    vo_hd_hdmi_clk_sel    : 1   ; /* [29]  */
        unsigned int    vou_srst_req          : 1   ; /* [30]  */
        unsigned int    Reserved_107          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG54;

/* Define the union U_PERI_CRG55 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vi_bus_cken           : 1   ; /* [0]  */
        unsigned int    vi_p0_cken            : 1   ; /* [1]  */
        unsigned int    vi_p1_cken            : 1   ; /* [2]  */
        unsigned int    vi_ppc0_cken          : 1   ; /* [3]  */
        unsigned int    vi_ppc1_cken          : 1   ; /* [4]  */
        unsigned int    Reserved_115          : 3   ; /* [7..5]  */
        unsigned int    vi_bus_srst_req       : 1   ; /* [8]  */
        unsigned int    vi_p0_srst_req        : 1   ; /* [9]  */
        unsigned int    vi_p1_srst_req        : 1   ; /* [10]  */
        unsigned int    vi_ppc0_srst_req      : 1   ; /* [11]  */
        unsigned int    vi_ppc1_srst_req      : 1   ; /* [12]  */
        unsigned int    Reserved_114          : 3   ; /* [15..13]  */
        unsigned int    vi_ppc0_cksel         : 2   ; /* [17..16]  */
        unsigned int    Reserved_113          : 2   ; /* [19..18]  */
        unsigned int    vi_ppc1_cksel         : 2   ; /* [21..20]  */
        unsigned int    vi_ppc0_hdmirx_cksel  : 1   ; /* [22]  */
        unsigned int    vi_ppc1_hdmirx_cksel  : 1   ; /* [23]  */
        unsigned int    vi_p0_cksel           : 2   ; /* [25..24]  */
        unsigned int    Reserved_112          : 2   ; /* [27..26]  */
        unsigned int    vi_p1_cksel           : 2   ; /* [29..28]  */
        unsigned int    Reserved_111          : 2   ; /* [31..30]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG55;

/* Define the union U_PERI_CRG56 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qtc_bus_cken          : 1   ; /* [0]  */
        unsigned int    qtc_cken              : 1   ; /* [1]  */
        unsigned int    Reserved_118          : 2   ; /* [3..2]  */
        unsigned int    qtc_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_117          : 3   ; /* [7..5]  */
        unsigned int    qtc_clk_pctrl         : 1   ; /* [8]  */
        unsigned int    Reserved_116          : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG56;

/* Define the union U_PERI_CRG57 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qam_2x_cken           : 1   ; /* [0]  */
        unsigned int    qam_1x_cken           : 1   ; /* [1]  */
        unsigned int    qam_j83b_cken         : 1   ; /* [2]  */
        unsigned int    qam_j83ac_cken        : 1   ; /* [3]  */
        unsigned int    qam_ads_cken          : 1   ; /* [4]  */
        unsigned int    qam_ts_cken           : 1   ; /* [5]  */
        unsigned int    qam_tsout_cken        : 1   ; /* [6]  */
        unsigned int    Reserved_122          : 1   ; /* [7]  */
        unsigned int    qam_2x_srst_req       : 1   ; /* [8]  */
        unsigned int    qam_1x_srst_req       : 1   ; /* [9]  */
        unsigned int    Reserved_121          : 2   ; /* [11..10]  */
        unsigned int    qam_ads_srst_req      : 1   ; /* [12]  */
        unsigned int    qam_ts_srst_req       : 1   ; /* [13]  */
        unsigned int    Reserved_120          : 2   ; /* [15..14]  */
        unsigned int    qam_tsout_pctrl       : 1   ; /* [16]  */
        unsigned int    qam_adsclk_pctrl      : 1   ; /* [17]  */
        unsigned int    qam_ts_clk_sel        : 2   ; /* [19..18]  */
        unsigned int    qam_ts_clk_div        : 4   ; /* [23..20]  */
        unsigned int    qam2x_clk_sel         : 1   ; /* [24]  */
        unsigned int    Reserved_119          : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG57;

/* Define the union U_PERI_CRG58 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    Reserved_124          : 7   ; /* [6..0]  */
        unsigned int    qamadc_clk_sel        : 3   ; /* [9..7]  */
        unsigned int    qamctrl_clk_sel       : 3   ; /* [12..10]  */
        unsigned int    qamctrl_clk_div       : 1   ; /* [13]  */
        unsigned int    qamadc_pctrl          : 1   ; /* [14]  */
        unsigned int    Reserved_123          : 17  ; /* [31..15]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG58;

/* Define the union U_PERI_CRG61 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hwc_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_126          : 3   ; /* [3..1]  */
        unsigned int    hwc_srst_req          : 1   ; /* [4]  */
        unsigned int    hwc_clk_sel           : 2   ; /* [6..5]  */
        unsigned int    hwc_bus_cksel         : 1   ; /* [7]  */
        unsigned int    hwcclk_skipcfg        : 5   ; /* [12..8]  */
        unsigned int    hwcclk_loaden         : 1   ; /* [13]  */
        unsigned int    Reserved_125          : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG61;

/* Define the union U_PERI_CRG62 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bootmem_cken          : 1   ; /* [0]  */
        unsigned int    Reserved_129          : 3   ; /* [3..1]  */
        unsigned int    bootmem_srst_req      : 1   ; /* [4]  */
        unsigned int    Reserved_128          : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG62;

/* Define the union U_PERI_CRG63 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pvr_bus_cken          : 1   ; /* [0]  */
        unsigned int    pvr_dmx_cken          : 1   ; /* [1]  */
        unsigned int    pvr_27m_cken          : 1   ; /* [2]  */
        unsigned int    pvr_tsi1_cken         : 1   ; /* [3]  */
        unsigned int    pvr_tsi2_cken         : 1   ; /* [4]  */
        unsigned int    pvr_tsi3_cken         : 1   ; /* [5]  */
        unsigned int    pvr_tsi4_cken         : 1   ; /* [6]  */
        unsigned int    pvr_tsi5_cken         : 1   ; /* [7]  */
        unsigned int    pvr_tsi6_cken         : 1   ; /* [8]  */
        unsigned int    pvr_tsi7_cken         : 1   ; /* [9]  */
        unsigned int    pvr_tsi8_cken         : 1   ; /* [10]  */
        unsigned int    pvr_ts0_cken          : 1   ; /* [11]  */
        unsigned int    pvr_ts1_cken          : 1   ; /* [12]  */
        unsigned int    pvr_tsout0_cken       : 1   ; /* [13]  */
        unsigned int    pvr_tsout1_cken       : 1   ; /* [14]  */
        unsigned int    Reserved_131          : 1   ; /* [15]  */
        unsigned int    pvr_tsi3_pctrl        : 1   ; /* [16]  */
        unsigned int    pvr_tsi4_pctrl        : 1   ; /* [17]  */
        unsigned int    pvr_tsi5_pctrl        : 1   ; /* [18]  */
        unsigned int    pvr_tsi6_pctrl        : 1   ; /* [19]  */
        unsigned int    pvr_tsi7_pctrl        : 1   ; /* [20]  */
        unsigned int    pvr_tsi8_pctrl        : 1   ; /* [21]  */
        unsigned int    pvr_srst_req          : 1   ; /* [22]  */
        unsigned int    pvr_tsi4_cksel        : 2   ; /* [24..23]  */
        unsigned int    Reserved_130          : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG63;

/* Define the union U_PERI_CRG64 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pvr_tsout0_pctrl      : 1   ; /* [0]  */
        unsigned int    pvr_tsout1_pctrl      : 1   ; /* [1]  */
        unsigned int    pvr_dmx_clk_sel       : 2   ; /* [3..2]  */
        unsigned int    sw_dmx_clk_div        : 5   ; /* [8..4]  */
        unsigned int    sw_dmxclk_loaden      : 1   ; /* [9]  */
        unsigned int    pvr_dmx_clkdiv_cfg    : 1   ; /* [10]  */
        unsigned int    Reserved_133          : 1   ; /* [11]  */
        unsigned int    pvr_ts0_clk_sel       : 2   ; /* [13..12]  */
        unsigned int    pvr_ts1_clk_sel       : 2   ; /* [15..14]  */
        unsigned int    pvr_ts0_clk_div       : 4   ; /* [19..16]  */
        unsigned int    pvr_ts1_clk_div       : 4   ; /* [23..20]  */
        unsigned int    Reserved_132          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG64;

/* Define the union U_PERI_CRG67 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hdmitx_ctrl_bus_cken  : 1   ; /* [0]  */
        unsigned int    hdmitx_ctrl_cec_cken  : 1   ; /* [1]  */
        unsigned int    hdmitx_ctrl_id_cken   : 1   ; /* [2]  */
        unsigned int    hdmitx_ctrl_mhl_cken  : 1   ; /* [3]  */
        unsigned int    hdmitx_ctrl_os_cken   : 1   ; /* [4]  */
        unsigned int    hdmitx_ctrl_as_cken   : 1   ; /* [5]  */
        unsigned int    Reserved_136          : 2   ; /* [7..6]  */
        unsigned int    hdmitx_ctrl_bus_srst_req  : 1   ; /* [8]  */
        unsigned int    hdmitx_ctrl_srst_req  : 1   ; /* [9]  */
        unsigned int    Reserved_135          : 2   ; /* [11..10]  */
        unsigned int    hdmitx_ctrl_cec_clk_sel  : 1   ; /* [12]  */
        unsigned int    hdmitx_ctrl_osclk_sel  : 1   ; /* [13]  */
        unsigned int    hdmitx_ctrl_asclk_sel  : 1   ; /* [14]  */
        unsigned int    Reserved_134          : 17  ; /* [31..15]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG67;

/* Define the union U_PERI_CRG68 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hdmitx_phy_bus_cken   : 1   ; /* [0]  */
        unsigned int    Reserved_139          : 3   ; /* [3..1]  */
        unsigned int    hdmitx_phy_srst_req   : 1   ; /* [4]  */
        unsigned int    Reserved_138          : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG68;

/* Define the union U_PERI_CRG69 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_141          : 3   ; /* [3..1]  */
        unsigned int    adac_srst_req         : 1   ; /* [4]  */
        unsigned int    Reserved_140          : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG69;

/* Define the union U_PERI_CRG70 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aiao_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_146          : 3   ; /* [3..1]  */
        unsigned int    aiao_srst_req         : 1   ; /* [4]  */
        unsigned int    Reserved_145          : 3   ; /* [7..5]  */
        unsigned int    aiao_clk_sel          : 1   ; /* [8]  */
        unsigned int    Reserved_144          : 3   ; /* [11..9]  */
        unsigned int    aiaoclk_skipcfg       : 5   ; /* [16..12]  */
        unsigned int    aiaoclk_loaden        : 1   ; /* [17]  */
        unsigned int    Reserved_143          : 2   ; /* [19..18]  */
        unsigned int    aiao_mclk_sel         : 2   ; /* [21..20]  */
        unsigned int    Reserved_142          : 10  ; /* [31..22]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG70;

/* Define the union U_PERI_CRG71 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    equator_dac0_cken     : 1   ; /* [0]  */
        unsigned int    equator_dac1_cken     : 1   ; /* [1]  */
        unsigned int    Reserved_149          : 2   ; /* [3..2]  */
        unsigned int    equator_dac0_pctrl    : 1   ; /* [4]  */
        unsigned int    equator_dac1_pctrl    : 1   ; /* [5]  */
        unsigned int    Reserved_148          : 2   ; /* [7..6]  */
        unsigned int    equator_dac0_cksel    : 2   ; /* [9..8]  */
        unsigned int    equator_dac1_cksel    : 2   ; /* [11..10]  */
        unsigned int    Reserved_147          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG71;

/* Define the union U_PERI_CRG73 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    gpu_freq_sel_cfg_crg  : 3   ; /* [2..0]  */
        unsigned int    Reserved_152          : 1   ; /* [3]  */
        unsigned int    gpu_freq_div_cfg_crg  : 2   ; /* [5..4]  */
        unsigned int    Reserved_151          : 2   ; /* [7..6]  */
        unsigned int    gpu_div_cfg_bypass    : 1   ; /* [8]  */
        unsigned int    gpu_begin_cfg_bypass  : 1   ; /* [9]  */
        unsigned int    gpu_sw_begin_cfg      : 1   ; /* [10]  */
        unsigned int    Reserved_150          : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG73;

/* Define the union U_PERI_CRG74 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_freq_sel_cfg_crg  : 3   ; /* [2..0]  */
        unsigned int    Reserved_156          : 1   ; /* [3]  */
        unsigned int    ddr_freq_div_cfg_crg  : 2   ; /* [5..4]  */
        unsigned int    Reserved_155          : 2   ; /* [7..6]  */
        unsigned int    ddr_div_cfg_bypass    : 1   ; /* [8]  */
        unsigned int    ddr_begin_cfg_bypass  : 1   ; /* [9]  */
        unsigned int    ddr_sw_begin_cfg      : 1   ; /* [10]  */
        unsigned int    Reserved_154          : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG74;

/* Define the union U_PERI_CRG75 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_157          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG75;

/* Define the union U_PERI_CRG76 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_158          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG76;

/* Define the union U_PERI_CRG77 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_159          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG77;

/* Define the union U_PERI_CRG79 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_160          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG79;

/* Define the union U_PERI_CRG80 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_162          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG80;

/* Define the union U_PERI_CRG81 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    epll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_163          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG81;

/* Define the union U_PERI_CRG83 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_164          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG83;

/* Define the union U_PERI_CRG84 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pll_lock              : 9   ; /* [8..0]  */
        unsigned int    Reserved_166          : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG84;

/* Define the union U_PERI_CRG85 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_clk_sw_ok_crg     : 1   ; /* [0]  */
        unsigned int    cpu_clk_mux           : 3   ; /* [3..1]  */
        unsigned int    gpu_clk_sw_ok_crg     : 1   ; /* [4]  */
        unsigned int    gpu_clk_mux           : 3   ; /* [7..5]  */
        unsigned int    ddr_clk_sw_ok_crg     : 1   ; /* [8]  */
        unsigned int    ddr_clk_mux           : 3   ; /* [11..9]  */
        unsigned int    Reserved_168          : 2   ; /* [13..12]  */
        unsigned int    sfc_clk_seled         : 1   ; /* [14]  */
        unsigned int    nf_clk_seled          : 1   ; /* [15]  */
        unsigned int    sdio0_clk_seled       : 2   ; /* [17..16]  */
        unsigned int    sdio1_clk_seled       : 2   ; /* [19..18]  */
        unsigned int    ddrphy0_clk_seled     : 1   ; /* [20]  */
        unsigned int    vdh_clk_seled         : 1   ; /* [21]  */
        unsigned int    hevc_a_clk_seled      : 1   ; /* [22]  */
        unsigned int    hevc_c_clk_seled      : 2   ; /* [24..23]  */
        unsigned int    hevc_b_clk_seled      : 2   ; /* [26..25]  */
        unsigned int    dsp_clk_seled         : 2   ; /* [28..27]  */
        unsigned int    Reserved_167          : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG85;

/* Define the union U_PERI_CRG86 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg0_sw       : 31  ; /* [30..0]  */
        unsigned int    Reserved_169          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG86;

/* Define the union U_PERI_CRG87 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg1_sw       : 27  ; /* [26..0]  */
        unsigned int    Reserved_170          : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG87;

/* Define the union U_PERI_CRG88 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg0_sw       : 31  ; /* [30..0]  */
        unsigned int    Reserved_171          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG88;

/* Define the union U_PERI_CRG89 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg1_sw       : 27  ; /* [26..0]  */
        unsigned int    Reserved_172          : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG89;

/* Define the union U_PERI_CRG90 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    slic_rst_out          : 1   ; /* [0]  */
        unsigned int    fe_rstn_out           : 1   ; /* [1]  */
        unsigned int    dem_rst0_out          : 1   ; /* [2]  */
        unsigned int    dem_rst2_out          : 1   ; /* [3]  */
        unsigned int    Reserved_173          : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG90;

/* Define the union U_PERI_CRG91 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_phy0_cnt_out     : 1   ; /* [0]  */
        unsigned int    usb2_phy1_cnt_out     : 1   ; /* [1]  */
        unsigned int    usb2_phy2_cnt_out     : 1   ; /* [2]  */
        unsigned int    Reserved_174          : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG91;

/* Define the union U_PERI_CRG93 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdh_all_rst_ok        : 1   ; /* [0]  */
        unsigned int    vdh_scd_rst_ok        : 1   ; /* [1]  */
        unsigned int    vdh_mfd_rst_ok        : 1   ; /* [2]  */
        unsigned int    hevc_rst_ok           : 1   ; /* [3]  */
        unsigned int    Reserved_175          : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG93;

/* Define the union U_PERI_CRG94 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    wdg0_cken             : 1   ; /* [0]  */
        unsigned int    wdg1_cken             : 1   ; /* [1]  */
        unsigned int    wdg2_cken             : 1   ; /* [2]  */
        unsigned int    Reserved_179          : 1   ; /* [3]  */
        unsigned int    wdg0_srst_req         : 1   ; /* [4]  */
        unsigned int    wdg1_srst_req         : 1   ; /* [5]  */
        unsigned int    wdg2_srst_req         : 1   ; /* [6]  */
        unsigned int    Reserved_178          : 1   ; /* [7]  */
        unsigned int    Reserved_177          : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG94;

/* Define the union U_PERI_CRG95 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pll_test_en           : 1   ; /* [0]  */
        unsigned int    test_clk_sel          : 1   ; /* [1]  */
        unsigned int    test_fq_clk_sel       : 1   ; /* [2]  */
        unsigned int    Reserved_180          : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG95;

/* Define the union U_PERI_CRG96 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mem_adjust_cpu        : 27  ; /* [26..0]  */
        unsigned int    Reserved_181          : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG96;

/* Define the union U_PERI_CRG97 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mem_adjust_gpu        : 16  ; /* [15..0]  */
        unsigned int    Reserved_182          : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG97;

/* Define the union U_PERI_CRG98 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ci_cksel              : 1   ; /* [0]  */
        unsigned int    ci_srst_req           : 1   ; /* [1]  */
        unsigned int    Reserved_184          : 2   ; /* [3..2]  */
        unsigned int    ci_cken               : 1   ; /* [4]  */
        unsigned int    Reserved_183          : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG98;

/* Define the union U_PERI_CRG100 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aif_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_186          : 1   ; /* [1]  */
        unsigned int    aif_srst_req          : 1   ; /* [2]  */
        unsigned int    dto_srst_req          : 1   ; /* [3]  */
        unsigned int    Reserved_185          : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG100;

/* Define the union U_PERI_CRG101 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    tvd_cken              : 1   ; /* [0]  */
        unsigned int    tvd_frabuff_srst_req  : 1   ; /* [1]  */
        unsigned int    tvd_core_srst_req     : 1   ; /* [2]  */
        unsigned int    tvd_srst_req          : 1   ; /* [3]  */
        unsigned int    Reserved_188          : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG101;

/* Define the union U_PERI_CRG102 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    clk_det_hddec_cken    : 1   ; /* [0]  */
        unsigned int    clk_sog2_hddec_cken   : 1   ; /* [1]  */
        unsigned int    clk_pixel_hddec_cken  : 1   ; /* [2]  */
        unsigned int    clk_apb_hddec_cken    : 1   ; /* [3]  */
        unsigned int    hddec_apb_srst_req    : 1   ; /* [4]  */
        unsigned int    hddec_det_srst_req    : 1   ; /* [5]  */
        unsigned int    hddec_pixel_srst_req  : 1   ; /* [6]  */
        unsigned int    Reserved_189          : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG102;

/* Define the union U_PERI_CRG103 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    demod_cken            : 1   ; /* [0]  */
        unsigned int    afe2_cken             : 1   ; /* [1]  */
        unsigned int    sif_cken              : 1   ; /* [2]  */
        unsigned int    pwm_sif_cken          : 1   ; /* [3]  */
        unsigned int    demod_srst_req        : 1   ; /* [4]  */
        unsigned int    demod_cksel           : 1   ; /* [5]  */
        unsigned int    afe2_clkin_pctrl      : 1   ; /* [6]  */
        unsigned int    pwm_sif_srst_req      : 1   ; /* [7]  */
        unsigned int    demod_bclk_div        : 4   ; /* [11..8]  */
        unsigned int    demod_fsclk_div       : 3   ; /* [14..12]  */
        unsigned int    Reserved_191          : 4   ; /* [18..15]  */
        unsigned int    Reserved_190          : 13  ; /* [31..19]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG103;

/* Define the union U_PERI_CRG104 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    me_cken               : 1   ; /* [0]  */
        unsigned int    me_bus_cken           : 1   ; /* [1]  */
        unsigned int    me_srst_req           : 1   ; /* [2]  */
        unsigned int    Reserved_192          : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG104;

/* Define the union U_PERI_CRG105 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fi_cken               : 1   ; /* [0]  */
        unsigned int    Reserved_194          : 1   ; /* [1]  */
        unsigned int    fi_srst_req           : 1   ; /* [2]  */
        unsigned int    Reserved_193          : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG105;

/* Define the union U_PERI_CRG106 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    lvds_pwm_cken         : 1   ; /* [0]  */
        unsigned int    Reserved_196          : 1   ; /* [1]  */
        unsigned int    lvds_pwm_srst_req     : 1   ; /* [2]  */
        unsigned int    Reserved_195          : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG106;

/* Define the union U_PERI_CRG107 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrphy1_clk_seled     : 1   ; /* [0]  */
        unsigned int    Reserved_197          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG107;

/* Define the union U_PERI_CRG108 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    timer23_cken          : 1   ; /* [0]  */
        unsigned int    timer45_cken          : 1   ; /* [1]  */
        unsigned int    timer67_cken          : 1   ; /* [2]  */
        unsigned int    timer89_cken          : 1   ; /* [3]  */
        unsigned int    timercd_cken          : 1   ; /* [4]  */
        unsigned int    timerab_cken          : 1   ; /* [5]  */
        unsigned int    Reserved_199          : 2   ; /* [7..6]  */
        unsigned int    timer23_srst_req      : 1   ; /* [8]  */
        unsigned int    timer45_srst_req      : 1   ; /* [9]  */
        unsigned int    timer67_srst_req      : 1   ; /* [10]  */
        unsigned int    timer89_srst_req      : 1   ; /* [11]  */
        unsigned int    timercd_srst_req      : 1   ; /* [12]  */
        unsigned int    timerab_srst_req      : 1   ; /* [13]  */
        unsigned int    Reserved_198          : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG108;

/* Define the union U_PERI_CRG109 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_200          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG109;

/* Define the union U_PERI_CRG110 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mpll_ssmod_ctrl       : 13  ; /* [12..0]  */
        unsigned int    Reserved_201          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG110;

/* Define the union U_PERI_CRG_PLL111 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_202          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL111;

/* Define the union U_PERI_CRG_PLL112 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_203          : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL112;

/* Define the union U_PERI_CRG_PLL113 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    Reserved_204          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL113;

/* Define the union U_PERI_CRG_PLL114 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    Reserved_205          : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL114;

/* Define the union U_PERI_CRG115 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dma_cken              : 1   ; /* [0]  */
        unsigned int    Reserved_207          : 3   ; /* [3..1]  */
        unsigned int    dma_srst_req          : 1   ; /* [4]  */
        unsigned int    Reserved_206          : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG115;

/* Define the union U_PERI_CRG116 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    lvds_cken             : 1   ; /* [0]  */
        unsigned int    Reserved_210          : 3   ; /* [3..1]  */
        unsigned int    lvds_pctrl            : 1   ; /* [4]  */
        unsigned int    Reserved_209          : 3   ; /* [7..5]  */
        unsigned int    lvds_cksel            : 2   ; /* [9..8]  */
        unsigned int    Reserved_208          : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG116;

/* Define the union U_PERI_CRG117 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vbo_para_cken         : 1   ; /* [0]  */
        unsigned int    vbo_div_cken          : 1   ; /* [1]  */
        unsigned int    Reserved_214          : 2   ; /* [3..2]  */
        unsigned int    vbo_div_cksel         : 2   ; /* [5..4]  */
        unsigned int    Reserved_213          : 2   ; /* [7..6]  */
        unsigned int    vbo_para_cksel        : 2   ; /* [9..8]  */
        unsigned int    Reserved_212          : 2   ; /* [11..10]  */
        unsigned int    vbo_para_phy_pctrl    : 1   ; /* [12]  */
        unsigned int    Reserved_211          : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG117;

/* Define the union U_PERI_CRG118 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpss0_cken            : 1   ; /* [0]  */
        unsigned int    Reserved_218          : 3   ; /* [3..1]  */
        unsigned int    vpss0_srst_req        : 1   ; /* [4]  */
        unsigned int    Reserved_217          : 3   ; /* [7..5]  */
        unsigned int    vpss0_clk_sel         : 2   ; /* [9..8]  */
        unsigned int    Reserved_216          : 2   ; /* [11..10]  */
        unsigned int    vpss0clk_skipcfg      : 5   ; /* [16..12]  */
        unsigned int    vpss0clk_loaden       : 1   ; /* [17]  */
        unsigned int    Reserved_215          : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG118;

/* Define the union U_PERI_CRG119 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpss1_cken            : 1   ; /* [0]  */
        unsigned int    Reserved_222          : 3   ; /* [3..1]  */
        unsigned int    vpss1_srst_req        : 1   ; /* [4]  */
        unsigned int    Reserved_221          : 3   ; /* [7..5]  */
        unsigned int    vpss1_clk_sel         : 2   ; /* [9..8]  */
        unsigned int    Reserved_220          : 2   ; /* [11..10]  */
        unsigned int    vpss1clk_skipcfg      : 5   ; /* [16..12]  */
        unsigned int    vpss1clk_loaden       : 1   ; /* [17]  */
        unsigned int    Reserved_219          : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG119;

/* Define the union U_PERI_CRG120 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hdmirxphy_tmds_div20sync_cken  : 4   ; /* [3..0]  */
        unsigned int    hdmirxphy_pre_pll_cken  : 4   ; /* [7..4]  */
        unsigned int    hdmirxphy_tmds_clk1x_cken  : 4   ; /* [11..8]  */
        unsigned int    hdmirxphy_dp_clr_cken  : 4   ; /* [15..12]  */
        unsigned int    reserve_for_eco_m0    : 10  ; /* [25..16]  */
        unsigned int    Reserved_223          : 6   ; /* [31..26]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG120;

/* Define the union U_PERI_CRG121 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hevc_cken             : 1   ; /* [0]  */
        unsigned int    hevc_v_srst_req       : 1   ; /* [1]  */
        unsigned int    hevc_m_srst_req       : 1   ; /* [2]  */
        unsigned int    hevc_b_srst_req       : 1   ; /* [3]  */
        unsigned int    hevc_c_srst_req       : 1   ; /* [4]  */
        unsigned int    hevc_p_srst_req       : 1   ; /* [5]  */
        unsigned int    hevc_a_srst_req       : 1   ; /* [6]  */
        unsigned int    hevc_srst_req         : 1   ; /* [7]  */
        unsigned int    hevc_v_cksel          : 2   ; /* [9..8]  */
        unsigned int    hevc_m_cksel          : 2   ; /* [11..10]  */
        unsigned int    hevc_b_cksel          : 4   ; /* [15..12]  */
        unsigned int    hevc_c_cksel          : 4   ; /* [19..16]  */
        unsigned int    hevc_a_cksel          : 3   ; /* [22..20]  */
        unsigned int    Reserved_224          : 9   ; /* [31..23]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG121;

/* Define the union U_PERI_CRG122 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vo_hd_tv_cksel        : 3   ; /* [2..0]  */
        unsigned int    vo_hd_stb_tv_cksel    : 1   ; /* [3]  */
        unsigned int    reserve_for_eco_m3    : 10  ; /* [13..4]  */
        unsigned int    Reserved_225          : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG122;

/* Define the union U_PERI_CRG123 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    Reserved_228          : 12  ; /* [11..0]  */
        unsigned int    usb3_vcc_srst_req     : 1   ; /* [12]  */
        unsigned int    usb3_phy_srst_req     : 1   ; /* [13]  */
        unsigned int    usb3_phy_srst_treq    : 1   ; /* [14]  */
        unsigned int    usb3_phy_ref_cken     : 1   ; /* [15]  */
        unsigned int    usb3_phy_refclk_sel   : 1   ; /* [16]  */
        unsigned int    usb3_ref_use_pad      : 1   ; /* [17]  */
        unsigned int    usb3_ref_ssp_en       : 1   ; /* [18]  */
        unsigned int    Reserved_227          : 1   ; /* [19]  */
        unsigned int    usb3_bus_cken         : 1   ; /* [20]  */
        unsigned int    usb3_ref_cken         : 1   ; /* [21]  */
        unsigned int    usb3_suspend_cken     : 1   ; /* [22]  */
        unsigned int    usb3_rx_cken          : 1   ; /* [23]  */
        unsigned int    usb3_mpll_qword_cken  : 1   ; /* [24]  */
        unsigned int    usb3_mpll_dword_cken  : 1   ; /* [25]  */
        unsigned int    usb3_pcs_ref_cken     : 1   ; /* [26]  */
        unsigned int    usb3_utmi_cken        : 1   ; /* [27]  */
        unsigned int    Reserved_226          : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG123;

/* Define the union U_PERI_CRG124 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mpll_hdmi_cfg_bypass  : 1   ; /* [0]  */
        unsigned int    Reserved_229          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG124;

/* Define the union U_PERI_CRG125 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qamt_fec_cken         : 1   ; /* [0]  */
        unsigned int    qamt_demo_cken        : 1   ; /* [1]  */
        unsigned int    qamt_adc_cken         : 1   ; /* [2]  */
        unsigned int    qamt_i2c_cken         : 1   ; /* [3]  */
        unsigned int    qamt_tsout_cken       : 1   ; /* [4]  */
        unsigned int    qamt_tsout_pctrl      : 1   ; /* [5]  */
        unsigned int    reserve_for_eco_ahb   : 10  ; /* [15..6]  */
        unsigned int    Reserved_230          : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG125;

/* Define the union U_PERI_CRG126 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdac_rct_cken         : 1   ; /* [0]  */
        unsigned int    vdac_bg_cken          : 1   ; /* [1]  */
        unsigned int    Reserved_234          : 2   ; /* [3..2]  */
        unsigned int    vdac_c_srst_req       : 1   ; /* [4]  */
        unsigned int    vdac_r_srst_req       : 1   ; /* [5]  */
        unsigned int    vdac_g_srst_req       : 1   ; /* [6]  */
        unsigned int    vdac_b_srst_req       : 1   ; /* [7]  */
        unsigned int    Reserved_233          : 4   ; /* [11..8]  */
        unsigned int    vdac_bg_clk_div       : 2   ; /* [13..12]  */
        unsigned int    Reserved_232          : 2   ; /* [15..14]  */
        unsigned int    vdac_c_clk_pctrl      : 1   ; /* [16]  */
        unsigned int    vdac_r_clk_pctrl      : 1   ; /* [17]  */
        unsigned int    vdac_g_clk_pctrl      : 1   ; /* [18]  */
        unsigned int    vdac_b_clk_pctrl      : 1   ; /* [19]  */
        unsigned int    Reserved_231          : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG126;

/* Define the union U_PERI_CRG127 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vo_ppc_cken           : 1   ; /* [0]  */
        unsigned int    sd_ppc_cken           : 1   ; /* [1]  */
        unsigned int    hd_ppc_cken           : 1   ; /* [2]  */
        unsigned int    vdp_cfg_cken          : 1   ; /* [3]  */
        unsigned int    vdp_clk_sel           : 2   ; /* [5..4]  */
        unsigned int    Reserved_235          : 26  ; /* [31..6]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG127;

/* Define the union U_PERI_CRG128 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pwm35_cken            : 1   ; /* [0]  */
        unsigned int    pwm35_srst_req        : 1   ; /* [1]  */
        unsigned int    Reserved_238          : 2   ; /* [3..2]  */
        unsigned int    pwm02_cken            : 1   ; /* [4]  */
        unsigned int    pwm02_srst_req        : 1   ; /* [5]  */
        unsigned int    Reserved_237          : 2   ; /* [7..6]  */
        unsigned int    Reserved_236          : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG128;

/* Define the union U_PERI_CRG129 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    edid_cken             : 1   ; /* [0]  */
        unsigned int    edid_srst_req         : 1   ; /* [1]  */
        unsigned int    Reserved_241          : 2   ; /* [3..2]  */
        unsigned int    edid_bus_cken         : 1   ; /* [4]  */
        unsigned int    edid_bus_srst_req     : 1   ; /* [5]  */
        unsigned int    Reserved_240          : 2   ; /* [7..6]  */
        unsigned int    edid_cksel            : 1   ; /* [8]  */
        unsigned int    Reserved_239          : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG129;

/* Define the union U_PERI_CRG130 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hard_ajust_lock       : 1   ; /* [0]  */
        unsigned int    Reserved_242          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG130;

/* Define the union U_PERI_CRG131 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hard_ajust_clk_divval  : 4   ; /* [3..0]  */
        unsigned int    Reserved_247          : 4   ; /* [7..4]  */
        unsigned int    soft_ajust_clk_divval  : 4   ; /* [11..8]  */
        unsigned int    Reserved_246          : 4   ; /* [15..12]  */
        unsigned int    hpll_freq_config_end  : 1   ; /* [16]  */
        unsigned int    Reserved_245          : 3   ; /* [19..17]  */
        unsigned int    hpll_sample_old_config  : 1   ; /* [20]  */
        unsigned int    Reserved_244          : 3   ; /* [23..21]  */
        unsigned int    Reserved_243          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG131;

/* Define the union U_PERI_CRG132 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ajust_cken       : 1   ; /* [0]  */
        unsigned int    Reserved_251          : 3   ; /* [3..1]  */
        unsigned int    hpll_ajust_srst_req   : 1   ; /* [4]  */
        unsigned int    Reserved_250          : 3   ; /* [7..5]  */
        unsigned int    hpll_freq_mode        : 2   ; /* [9..8]  */
        unsigned int    Reserved_249          : 2   ; /* [11..10]  */
        unsigned int    Reserved_248          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG132;

/* Define the union U_PERI_CRG133 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    step_int              : 12  ; /* [11..0]  */
        unsigned int    Reserved_252          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG133;

/* Define the union U_PERI_CRG134 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    step_frac             : 24  ; /* [23..0]  */
        unsigned int    Reserved_253          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG134;

/* Define the union U_PERI_CRG135 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mpll_ref_cksel        : 1   ; /* [0]  */
        unsigned int    Reserved_254          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG135;

/* Define the union U_PERI_CRG136 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mem_adjust_l2         : 20  ; /* [19..0]  */
        unsigned int    Reserved_255          : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG136;

/* Define the union U_PERI_CRG137 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_hard_ajust_lock  : 1   ; /* [0]  */
        unsigned int    Reserved_256          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG137;

/* Define the union U_PERI_CRG138 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_hard_ajust_clk_divval  : 4   ; /* [3..0]  */
        unsigned int    Reserved_261          : 4   ; /* [7..4]  */
        unsigned int    fpll_soft_ajust_clk_divval  : 4   ; /* [11..8]  */
        unsigned int    Reserved_260          : 4   ; /* [15..12]  */
        unsigned int    fpll_pll_freq_config_end  : 1   ; /* [16]  */
        unsigned int    Reserved_259          : 3   ; /* [19..17]  */
        unsigned int    fpll_pll_sample_old_config  : 1   ; /* [20]  */
        unsigned int    Reserved_258          : 3   ; /* [23..21]  */
        unsigned int    Reserved_257          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG138;

/* Define the union U_PERI_CRG139 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_pll_ajust_cken   : 1   ; /* [0]  */
        unsigned int    Reserved_265          : 3   ; /* [3..1]  */
        unsigned int    fpll_pll_ajust_srst_req  : 1   ; /* [4]  */
        unsigned int    Reserved_264          : 3   ; /* [7..5]  */
        unsigned int    fpll_pll_freq_mode    : 2   ; /* [9..8]  */
        unsigned int    Reserved_263          : 2   ; /* [11..10]  */
        unsigned int    Reserved_262          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG139;

/* Define the union U_PERI_CRG140 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_step_int         : 12  ; /* [11..0]  */
        unsigned int    Reserved_266          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG140;

/* Define the union U_PERI_CRG141 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fpll_step_frac        : 24  ; /* [23..0]  */
        unsigned int    Reserved_267          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG141;

/* Define the union U_PERI_CRG142 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_hard_ajust_lock  : 1   ; /* [0]  */
        unsigned int    Reserved_268          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG142;

/* Define the union U_PERI_CRG143 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_hard_ajust_clk_divval  : 4   ; /* [3..0]  */
        unsigned int    Reserved_273          : 4   ; /* [7..4]  */
        unsigned int    dpll_soft_ajust_clk_divval  : 4   ; /* [11..8]  */
        unsigned int    Reserved_272          : 4   ; /* [15..12]  */
        unsigned int    dpll_pll_freq_config_end  : 1   ; /* [16]  */
        unsigned int    Reserved_271          : 3   ; /* [19..17]  */
        unsigned int    dpll_pll_sample_old_config  : 1   ; /* [20]  */
        unsigned int    Reserved_270          : 3   ; /* [23..21]  */
        unsigned int    Reserved_269          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG143;

/* Define the union U_PERI_CRG144 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_pll_ajust_cken   : 1   ; /* [0]  */
        unsigned int    Reserved_277          : 3   ; /* [3..1]  */
        unsigned int    dpll_pll_ajust_srst_req  : 1   ; /* [4]  */
        unsigned int    Reserved_276          : 3   ; /* [7..5]  */
        unsigned int    dpll_pll_freq_mode    : 2   ; /* [9..8]  */
        unsigned int    Reserved_275          : 2   ; /* [11..10]  */
        unsigned int    Reserved_274          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG144;

/* Define the union U_PERI_CRG145 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_step_int         : 12  ; /* [11..0]  */
        unsigned int    Reserved_278          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG145;

/* Define the union U_PERI_CRG146 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_step_frac        : 24  ; /* [23..0]  */
        unsigned int    Reserved_279          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG146;

/* Define the union U_PERI_CRG147 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_hard_ajust_lock  : 1   ; /* [0]  */
        unsigned int    Reserved_280          : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG147;

/* Define the union U_PERI_CRG148 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_hard_ajust_clk_divval  : 4   ; /* [3..0]  */
        unsigned int    Reserved_285          : 4   ; /* [7..4]  */
        unsigned int    qpll_soft_ajust_clk_divval  : 4   ; /* [11..8]  */
        unsigned int    Reserved_284          : 4   ; /* [15..12]  */
        unsigned int    qpll_pll_freq_config_end  : 1   ; /* [16]  */
        unsigned int    Reserved_283          : 3   ; /* [19..17]  */
        unsigned int    qpll_pll_sample_old_config  : 1   ; /* [20]  */
        unsigned int    Reserved_282          : 3   ; /* [23..21]  */
        unsigned int    Reserved_281          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG148;

/* Define the union U_PERI_CRG149 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_pll_ajust_cken   : 1   ; /* [0]  */
        unsigned int    Reserved_289          : 3   ; /* [3..1]  */
        unsigned int    qpll_pll_ajust_srst_req  : 1   ; /* [4]  */
        unsigned int    Reserved_288          : 3   ; /* [7..5]  */
        unsigned int    qpll_pll_freq_mode    : 2   ; /* [9..8]  */
        unsigned int    Reserved_287          : 2   ; /* [11..10]  */
        unsigned int    Reserved_286          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG149;

/* Define the union U_PERI_CRG150 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_step_int         : 12  ; /* [11..0]  */
        unsigned int    Reserved_290          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG150;

/* Define the union U_PERI_CRG151 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_step_frac        : 24  ; /* [23..0]  */
        unsigned int    Reserved_291          : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG151;

/* Define the union U_PERI_CRG152 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hdmirx_osc_cken       : 1   ; /* [0]  */
        unsigned int    hdmirx_edid_cken      : 1   ; /* [1]  */
        unsigned int    hdmirx_cbus_cken      : 1   ; /* [2]  */
        unsigned int    hdmirx_cec_cken       : 1   ; /* [3]  */
        unsigned int    hdmirx_apb_cken       : 1   ; /* [4]  */
        unsigned int    hdmirx_mpllref_cken   : 1   ; /* [5]  */
        unsigned int    hdmirx_mpllref_pll_cken  : 1   ; /* [6]  */
        unsigned int    hdmirx_mosc_cken      : 1   ; /* [7]  */
        unsigned int    hdmirx_osc_srst_req   : 1   ; /* [8]  */
        unsigned int    hdmirx_srst_req       : 1   ; /* [9]  */
        unsigned int    hdmirx_cec_srst_req   : 1   ; /* [10]  */
        unsigned int    hdmirx_apb_srst_req   : 1   ; /* [11]  */
        unsigned int    hdmirx_mosc_cksel     : 1   ; /* [12]  */
        unsigned int    hdmirx_cbus_cksel     : 1   ; /* [13]  */
        unsigned int    hdmirx_cec_cksel      : 1   ; /* [14]  */
        unsigned int    hdmirx_mpllref_cksel  : 1   ; /* [15]  */
        unsigned int    reserve_for_eco_m0_add  : 10  ; /* [25..16]  */
        unsigned int    Reserved_292          : 6   ; /* [31..26]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG152;

/* Define the union U_PERI_CRG153 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    equator_apb_srst_req  : 1   ; /* [0]  */
        unsigned int    cvbs_srst_req         : 1   ; /* [1]  */
        unsigned int    rgb_srst_req          : 1   ; /* [2]  */
        unsigned int    Reserved_296          : 1   ; /* [3]  */
        unsigned int    rgb_cvbs_cksel        : 1   ; /* [4]  */
        unsigned int    Reserved_295          : 3   ; /* [7..5]  */
        unsigned int    clk_cvbs_pctrl        : 1   ; /* [8]  */
        unsigned int    clk_rgb_pctrl         : 1   ; /* [9]  */
        unsigned int    Reserved_294          : 2   ; /* [11..10]  */
        unsigned int    Reserved_293          : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG153;

/* Define the union U_PERI_CRG154 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_switch_bypass     : 1   ; /* [0]  */
        unsigned int    Reserved_300          : 3   ; /* [3..1]  */
        unsigned int    cpu_cfg_num           : 6   ; /* [9..4]  */
        unsigned int    Reserved_299          : 2   ; /* [11..10]  */
        unsigned int    cpu_cfg_num_step      : 3   ; /* [14..12]  */
        unsigned int    Reserved_298          : 1   ; /* [15]  */
        unsigned int    Reserved_297          : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG154;

/* Define the union U_PERI_CRG155 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    gpu_switch_bypass     : 1   ; /* [0]  */
        unsigned int    Reserved_304          : 3   ; /* [3..1]  */
        unsigned int    gpu_cfg_num           : 6   ; /* [9..4]  */
        unsigned int    Reserved_303          : 2   ; /* [11..10]  */
        unsigned int    gpu_cfg_num_step      : 3   ; /* [14..12]  */
        unsigned int    Reserved_302          : 1   ; /* [15]  */
        unsigned int    Reserved_301          : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG155;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_PERI_CRG_PLL0      PERI_CRG_PLL0;
    volatile U_PERI_CRG_PLL1      PERI_CRG_PLL1;
    volatile U_PERI_CRG_PLL2      PERI_CRG_PLL2;
    volatile U_PERI_CRG_PLL3      PERI_CRG_PLL3;
    volatile U_PERI_CRG_PLL4      PERI_CRG_PLL4;
    volatile U_PERI_CRG_PLL5      PERI_CRG_PLL5;
    volatile unsigned int         Reserved_0[2];
    volatile U_PERI_CRG_PLL8      PERI_CRG_PLL8;
    volatile U_PERI_CRG_PLL9      PERI_CRG_PLL9;
    volatile U_PERI_CRG_PLL10     PERI_CRG_PLL10;
    volatile U_PERI_CRG_PLL11     PERI_CRG_PLL11;
    volatile U_PERI_CRG_PLL12     PERI_CRG_PLL12;
    volatile U_PERI_CRG_PLL13     PERI_CRG_PLL13;
    volatile unsigned int         Reserved_1[2];
    volatile U_PERI_CRG_PLL16     PERI_CRG_PLL16;
    volatile U_PERI_CRG_PLL17     PERI_CRG_PLL17;
    volatile U_PERI_CRG18         PERI_CRG18;
    volatile U_PERI_CRG19         PERI_CRG19;
    volatile U_PERI_CRG20         PERI_CRG20;
    volatile U_PERI_CRG21         PERI_CRG21;
    volatile unsigned int         Reserved_2;
    volatile U_PERI_CRG23         PERI_CRG23;
    volatile U_PERI_CRG24         PERI_CRG24;
    volatile U_PERI_CRG25         PERI_CRG25;
    volatile U_PERI_CRG26         PERI_CRG26;
    volatile U_PERI_CRG27         PERI_CRG27;
    volatile U_PERI_CRG28         PERI_CRG28;
    volatile U_PERI_CRG29         PERI_CRG29;
    volatile U_PERI_CRG30         PERI_CRG30;
    volatile U_PERI_CRG31         PERI_CRG31;
    volatile unsigned int         Reserved_3;
    volatile U_PERI_CRG33         PERI_CRG33;
    volatile U_PERI_CRG34         PERI_CRG34;
    volatile U_PERI_CRG35         PERI_CRG35;
    volatile U_PERI_CRG36         PERI_CRG36;
    volatile U_PERI_CRG37         PERI_CRG37;
    volatile unsigned int         Reserved_4;
    volatile U_PERI_CRG39         PERI_CRG39;
    volatile U_PERI_CRG40         PERI_CRG40;
    volatile unsigned int         Reserved_5[5];
    volatile U_PERI_CRG46         PERI_CRG46;
    volatile U_PERI_CRG47         PERI_CRG47;
    volatile U_PERI_CRG48         PERI_CRG48;
    volatile U_PERI_CRG49         PERI_CRG49;
    volatile U_PERI_CRG50         PERI_CRG50;
    volatile U_PERI_CRG51         PERI_CRG51;
    volatile U_PERI_CRG52         PERI_CRG52;
    volatile U_PERI_CRG53         PERI_CRG53;
    volatile U_PERI_CRG54         PERI_CRG54;
    volatile U_PERI_CRG55         PERI_CRG55;
    volatile U_PERI_CRG56         PERI_CRG56;
    volatile U_PERI_CRG57         PERI_CRG57;
    volatile U_PERI_CRG58         PERI_CRG58;
    volatile unsigned int         Reserved_6[2];
    volatile U_PERI_CRG61         PERI_CRG61;
    volatile U_PERI_CRG62         PERI_CRG62;
    volatile U_PERI_CRG63         PERI_CRG63;
    volatile U_PERI_CRG64         PERI_CRG64;
    volatile unsigned int         Reserved_7[2];
    volatile U_PERI_CRG67         PERI_CRG67;
    volatile U_PERI_CRG68         PERI_CRG68;
    volatile U_PERI_CRG69         PERI_CRG69;
    volatile U_PERI_CRG70         PERI_CRG70;
    volatile U_PERI_CRG71         PERI_CRG71;
    volatile unsigned int         Reserved_8;
    volatile U_PERI_CRG73         PERI_CRG73;
    volatile U_PERI_CRG74         PERI_CRG74;
    volatile U_PERI_CRG75         PERI_CRG75;
    volatile U_PERI_CRG76         PERI_CRG76;
    volatile U_PERI_CRG77         PERI_CRG77;
    volatile unsigned int         Reserved_9;
    volatile U_PERI_CRG79         PERI_CRG79;
    volatile U_PERI_CRG80         PERI_CRG80;
    volatile U_PERI_CRG81         PERI_CRG81;
    volatile unsigned int         Reserved_10;
    volatile U_PERI_CRG83         PERI_CRG83;
    volatile U_PERI_CRG84         PERI_CRG84;
    volatile U_PERI_CRG85         PERI_CRG85;
    volatile U_PERI_CRG86         PERI_CRG86;
    volatile U_PERI_CRG87         PERI_CRG87;
    volatile U_PERI_CRG88         PERI_CRG88;
    volatile U_PERI_CRG89         PERI_CRG89;
    volatile U_PERI_CRG90         PERI_CRG90;
    volatile U_PERI_CRG91         PERI_CRG91;
    volatile unsigned int         Reserved_11;
    volatile U_PERI_CRG93         PERI_CRG93;
    volatile U_PERI_CRG94         PERI_CRG94;
    volatile U_PERI_CRG95         PERI_CRG95;
    volatile U_PERI_CRG96         PERI_CRG96;
    volatile U_PERI_CRG97         PERI_CRG97;
    volatile U_PERI_CRG98         PERI_CRG98;
    volatile unsigned int         Reserved_12;
    volatile U_PERI_CRG100        PERI_CRG100;
    volatile U_PERI_CRG101        PERI_CRG101;
    volatile U_PERI_CRG102        PERI_CRG102;
    volatile U_PERI_CRG103        PERI_CRG103;
    volatile U_PERI_CRG104        PERI_CRG104;
    volatile U_PERI_CRG105        PERI_CRG105;
    volatile U_PERI_CRG106        PERI_CRG106;
    volatile U_PERI_CRG107        PERI_CRG107;
    volatile U_PERI_CRG108        PERI_CRG108;
    volatile U_PERI_CRG109        PERI_CRG109;
    volatile U_PERI_CRG110        PERI_CRG110;
    volatile U_PERI_CRG_PLL111    PERI_CRG_PLL111;
    volatile U_PERI_CRG_PLL112    PERI_CRG_PLL112;
    volatile U_PERI_CRG_PLL113    PERI_CRG_PLL113;
    volatile U_PERI_CRG_PLL114    PERI_CRG_PLL114;
    volatile U_PERI_CRG115        PERI_CRG115;
    volatile U_PERI_CRG116        PERI_CRG116;
    volatile U_PERI_CRG117        PERI_CRG117;
    volatile U_PERI_CRG118        PERI_CRG118;
    volatile U_PERI_CRG119        PERI_CRG119;
    volatile U_PERI_CRG120        PERI_CRG120;
    volatile U_PERI_CRG121        PERI_CRG121;
    volatile U_PERI_CRG122        PERI_CRG122;
    volatile U_PERI_CRG123        PERI_CRG123;
    volatile U_PERI_CRG124        PERI_CRG124;
    volatile U_PERI_CRG125        PERI_CRG125;
    volatile U_PERI_CRG126        PERI_CRG126;
    volatile U_PERI_CRG127        PERI_CRG127;
    volatile U_PERI_CRG128        PERI_CRG128;
    volatile U_PERI_CRG129        PERI_CRG129;
    volatile U_PERI_CRG130        PERI_CRG130;
    volatile U_PERI_CRG131        PERI_CRG131;
    volatile U_PERI_CRG132        PERI_CRG132;
    volatile U_PERI_CRG133        PERI_CRG133;
    volatile U_PERI_CRG134        PERI_CRG134;
    volatile U_PERI_CRG135        PERI_CRG135;
    volatile U_PERI_CRG136        PERI_CRG136;
    volatile U_PERI_CRG137        PERI_CRG137;
    volatile U_PERI_CRG138        PERI_CRG138;
    volatile U_PERI_CRG139        PERI_CRG139;
    volatile U_PERI_CRG140        PERI_CRG140;
    volatile U_PERI_CRG141        PERI_CRG141;
    volatile U_PERI_CRG142        PERI_CRG142;
    volatile U_PERI_CRG143        PERI_CRG143;
    volatile U_PERI_CRG144        PERI_CRG144;
    volatile U_PERI_CRG145        PERI_CRG145;
    volatile U_PERI_CRG146        PERI_CRG146;
    volatile U_PERI_CRG147        PERI_CRG147;
    volatile U_PERI_CRG148        PERI_CRG148;
    volatile U_PERI_CRG149        PERI_CRG149;
    volatile U_PERI_CRG150        PERI_CRG150;
    volatile U_PERI_CRG151        PERI_CRG151;
    volatile U_PERI_CRG152        PERI_CRG152;
    volatile U_PERI_CRG153        PERI_CRG153;
    volatile U_PERI_CRG154        PERI_CRG154;
    volatile U_PERI_CRG155        PERI_CRG155;


} S_CRG_REGS_TYPE;

#endif /* __HI_REG_CRG_H__ */

