//******************************************************************************
//  Copyright (C), 2007-2014, Hisilicon Technologies Co., Ltd.
//
//******************************************************************************
// File name     : hi_reg_sys.h
// Version       : 2.0
// Author        : xxx
// Created       : 2014-02-25
// Last Modified : 
// Description   :  The C union definition file for the module mcu_sysctrl_reg
// Function List : 
// History       : 
// 1 Date        : 
// Author        : xxx
// Modification  : Create file
//******************************************************************************

#ifndef __HI_REG_SYS_H__
#define __HI_REG_SYS_H__

/* Define the union U_SC_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_bus_clk_sel       : 2   ; /* [1..0]  */
        unsigned int    mcu_bus_clk_sel_stat  : 2   ; /* [3..2]  */
        unsigned int    mcu_bus_clk_div       : 2   ; /* [5..4]  */
        unsigned int    Reserved_1            : 2   ; /* [7..6]  */
        unsigned int    remapclear            : 1   ; /* [8]  */
        unsigned int    remapstat             : 1   ; /* [9]  */
        unsigned int    por_sel               : 1   ; /* [10]  */
        unsigned int    Reserved_0            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_CTRL;

/* Define the union U_SC_LOW_POWER_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    Reserved_6            : 1   ; /* [0]  */
        unsigned int    stb_poweroff          : 1   ; /* [1]  */
        unsigned int    Reserved_5            : 1   ; /* [2]  */
        unsigned int    mcu_lp_subsys_iso     : 1   ; /* [3]  */
        unsigned int    Reserved_4            : 1   ; /* [4]  */
        unsigned int    Reserved_3            : 1   ; /* [5]  */
        unsigned int    bus_core_pd_idlereq   : 1   ; /* [6]  */
        unsigned int    bus_core_pd_idle      : 1   ; /* [7]  */
        unsigned int    bus_core_pd_idleack   : 1   ; /* [8]  */
        unsigned int    Reserved_2            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_LOW_POWER_CTRL;

/* Define the union U_SC_HDMI_RX_HPD_PWR_PCTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hdmi_rx_pwr_pctrl     : 4   ; /* [3..0]  */
        unsigned int    hdmi_rx_hpd_pctrl     : 4   ; /* [7..4]  */
        unsigned int    Reserved_8            : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_HDMI_RX_HPD_PWR_PCTRL;

/* Define the union U_SC_CLKGATE_SRST_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mce_cken              : 1   ; /* [0]  */
        unsigned int    mce_srst_req          : 1   ; /* [1]  */
        unsigned int    pwm_cken              : 1   ; /* [2]  */
        unsigned int    pwm_srst_req          : 1   ; /* [3]  */
        unsigned int    ir_cken               : 1   ; /* [4]  */
        unsigned int    ir_srst_req           : 1   ; /* [5]  */
        unsigned int    lsadc_cken            : 1   ; /* [6]  */
        unsigned int    lsadc_srst_req        : 1   ; /* [7]  */
        unsigned int    ledc_cken             : 1   ; /* [8]  */
        unsigned int    ledc_srst_req         : 1   ; /* [9]  */
        unsigned int    timer01_cken          : 1   ; /* [10]  */
        unsigned int    timer01_srst_req      : 1   ; /* [11]  */
        unsigned int    uart1_cken            : 1   ; /* [12]  */
        unsigned int    uart1_srst_req        : 1   ; /* [13]  */
        unsigned int    hdmirx_osc_srst_req   : 1   ; /* [14]  */
        unsigned int    hdmirx_apb_srst_req   : 1   ; /* [15]  */
        unsigned int    hdmirx_cec_srst_req   : 1   ; /* [16]  */
        unsigned int    hdmirx_srst_req       : 1   ; /* [17]  */
        unsigned int    hdmirx_mosc_cksel     : 1   ; /* [18]  */
        unsigned int    hdmirx_cec_cksel      : 1   ; /* [19]  */
        unsigned int    hdmirx_mpllref_cksel  : 1   ; /* [20]  */
        unsigned int    hdmirx_cbus_cksel     : 1   ; /* [21]  */
        unsigned int    hdmirx_mosc_cken      : 1   ; /* [22]  */
        unsigned int    hdmirx_osc_cken       : 1   ; /* [23]  */
        unsigned int    hdmirx_apb_cken       : 1   ; /* [24]  */
        unsigned int    hdmirx_cec_cken       : 1   ; /* [25]  */
        unsigned int    hdmirx_mpllref_cken   : 1   ; /* [26]  */
        unsigned int    hdmirx_mpllref_pll_cken  : 1   ; /* [27]  */
        unsigned int    pd_rst_req            : 1   ; /* [28]  */
        unsigned int    hdmirx_edid_cken      : 1   ; /* [29]  */
        unsigned int    hdmirx_cbus_cken      : 1   ; /* [30]  */
        unsigned int    Reserved_9            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_CLKGATE_SRST_CTRL;

/* Define the union U_SC_CA_RST_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ca_rst_ctrl           : 1   ; /* [0]  */
        unsigned int    Reserved_10           : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_CA_RST_CTRL;

/* Define the union U_SC_WDG_RST_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    wdg_rst_ctrl          : 1   ; /* [0]  */
        unsigned int    Reserved_11           : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_WDG_RST_CTRL;

/* Define the union U_SC_DDRC_DFI_RST_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_dfi_rst_ctrl      : 1   ; /* [0]  */
        unsigned int    Reserved_12           : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_DDRC_DFI_RST_CTRL;

/* Define the union U_SC_DDRPHY_LP_EN */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrphy0_lp_en         : 2   ; /* [1..0]  */
        unsigned int    ddrphy1_lp_en         : 2   ; /* [3..2]  */
        unsigned int    Reserved_13           : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_DDRPHY_LP_EN;

/* Define the union U_SC_MCU_HPM_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_hpm_div           : 6   ; /* [5..0]  */
        unsigned int    mcu_hpm_en            : 1   ; /* [6]  */
        unsigned int    mcu_hpm_rst_req       : 1   ; /* [7]  */
        unsigned int    Reserved_14           : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MCU_HPM_CTRL;

/* Define the union U_SC_MCU_HPM_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_hpm_pc_org        : 10  ; /* [9..0]  */
        unsigned int    mcu_hpm_valid         : 1   ; /* [10]  */
        unsigned int    Reserved_16           : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MCU_HPM_STAT;

/* Define the union U_SC_MCU_LDO_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_ldo_vset          : 4   ; /* [3..0]  */
        unsigned int    Reserved_17           : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MCU_LDO_CTRL;

/* Define the union U_SC_SYS_DBG0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    chip_vision            : 1  ;   /*little chip version 1:98c/96c 0:98c_a/96c_a*/
        unsigned int    Reserved_20           : 7   ; /* [7..1]  */
        unsigned int    core_pwr_active       : 1   ; /* [8]  */
        unsigned int    mcu_noc_mainpending   : 1   ; /* [9]  */
        unsigned int    Reserved_19           : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_SYS_DBG0;

/* Define the union U_AMP_MUTE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    amp_mute_out          : 1   ; /* [0]  */
        unsigned int    amp_mute_out_oen      : 1   ; /* [1]  */
        unsigned int    Reserved_23           : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AMP_MUTE;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_SC_CTRL            SC_CTRL;
    volatile unsigned int         SC_SYSRES;
    volatile unsigned int         Reserved_0[14];
    volatile U_SC_LOW_POWER_CTRL  SC_LOW_POWER_CTRL;
    volatile U_SC_HDMI_RX_HPD_PWR_PCTRL SC_HDMI_RX_HPD_PWR_PCTRL;
    volatile U_SC_CLKGATE_SRST_CTRL SC_CLKGATE_SRST_CTRL;
    volatile U_SC_CA_RST_CTRL     SC_CA_RST_CTRL;
    volatile U_SC_WDG_RST_CTRL    SC_WDG_RST_CTRL;
    volatile U_SC_DDRC_DFI_RST_CTRL SC_DDRC_DFI_RST_CTRL;
    volatile U_SC_DDRPHY_LP_EN    SC_DDRPHY_LP_EN;
    volatile unsigned int         Reserved_1;
    volatile U_SC_MCU_HPM_CTRL    SC_MCU_HPM_CTRL;
    volatile U_SC_MCU_HPM_STAT    SC_MCU_HPM_STAT;
    volatile U_SC_MCU_LDO_CTRL    SC_MCU_LDO_CTRL;
    volatile unsigned int         Reserved_2[5];
    volatile unsigned int         SC_GEN0;
    volatile unsigned int         SC_GEN1;
    volatile unsigned int         SC_GEN2;
    volatile unsigned int         SC_GEN3;
    volatile unsigned int         SC_GEN4;
    volatile unsigned int         SC_GEN5;
    volatile unsigned int         SC_GEN6;
    volatile unsigned int         SC_GEN7;
    volatile unsigned int         SC_GEN8;
    volatile unsigned int         SC_GEN9;
    volatile unsigned int         SC_GEN10;
    volatile unsigned int         SC_GEN11;
    volatile unsigned int         SC_GEN12;
    volatile unsigned int         SC_GEN13;
    volatile unsigned int         SC_GEN14;
    volatile unsigned int         SC_GEN15;
    volatile unsigned int         SC_GEN16;
    volatile unsigned int         SC_GEN17;
    volatile unsigned int         SC_GEN18;
    volatile unsigned int         SC_GEN19;
    volatile unsigned int         SC_GEN20;
    volatile unsigned int         SC_GEN21;
    volatile unsigned int         SC_GEN22;
    volatile unsigned int         SC_GEN23;
    volatile unsigned int         SC_GEN24;
    volatile unsigned int         SC_GEN25;
    volatile unsigned int         SC_GEN26;
    volatile unsigned int         SC_GEN27;
    volatile unsigned int         SC_GEN28;
    volatile unsigned int         SC_GEN29;
    volatile unsigned int         SC_GEN30;
    volatile unsigned int         SC_GEN31;
    volatile U_SC_SYS_DBG0        SC_SYS_DBG0;
    volatile unsigned int         Reserved_3[66];
    volatile unsigned int         SC_LOCKEN;
    volatile unsigned int         Reserved_4[820];
    volatile unsigned int         SC_SYSID;
    volatile U_AMP_MUTE           AMP_MUTE;


} S_SYSCTRL_REGS_TYPE;

#endif /* __HI_REG_SYS_H__ */

