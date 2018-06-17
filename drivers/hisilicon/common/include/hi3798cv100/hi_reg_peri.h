//****************************************************************************** 
// Copyright     :  Copyright (C) 2014, Hisilicon Technologies Co., Ltd.
// File name     :  hi_reg_peri.h
// Author        :  xxx
// Version       :  1.0 
// Date          :  2014-02-25
// Description   :  Define all registers/tables for xxx
// Others        :  Generated automatically by nManager V4.0 
// History       :  xxx 2014-02-25 Create file
//******************************************************************************

#ifndef __HI_REG_PERI_H__
#define __HI_REG_PERI_H__

/* Define the union U_START_MODE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 7   ; /* [6..0]  */
        unsigned int    romboot_sel_lock      : 1   ; /* [7]  */
        unsigned int    reserved_1            : 1   ; /* [8]  */
        unsigned int    boot_sel              : 2   ; /* [10..9]  */
        unsigned int    sfc_addr_mode         : 1   ; /* [11]  */
        unsigned int    nf_bootbw             : 1   ; /* [12]  */
        unsigned int    reserved_2            : 1   ; /* [13]  */
        unsigned int    reserved_3            : 4   ; /* [17..14]  */
        unsigned int    reserved_4            : 1   ; /* [18]  */
        unsigned int    reserved_5            : 1   ; /* [19]  */
        unsigned int    romboot_sel           : 1   ; /* [20]  */
        unsigned int    jtgprt_en             : 1   ; /* [21]  */
        unsigned int    pcb_l                 : 1   ; /* [22]  */
        unsigned int    jtag_sel_in           : 1   ; /* [23]  */
        unsigned int    chip_jtag_mux         : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_START_MODE;

/* Define the union U_PERI_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 1   ; /* [0]  */
        unsigned int    pad_jtag_mux          : 2   ; /* [2..1]  */
        unsigned int    reserved_1            : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_STAT;

/* Define the union U_PERI_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sdio1_card_det_mode   : 1   ; /* [0]  */
        unsigned int    sdio0_card_det_mode   : 1   ; /* [1]  */
        unsigned int    reserved_0            : 8   ; /* [9..2]  */
        unsigned int    peri_mven             : 1   ; /* [10]  */
        unsigned int    reserved_1            : 2   ; /* [12..11]  */
        unsigned int    peri_ld_en            : 1   ; /* [13]  */
        unsigned int    peri_3d_en            : 1   ; /* [14]  */
        unsigned int    peri_scn_en           : 1   ; /* [15]  */
        unsigned int    peri_blk_on           : 1   ; /* [16]  */
        unsigned int    peri_lvds_pwren       : 1   ; /* [17]  */
        unsigned int    peri_pol_3d           : 1   ; /* [18]  */
        unsigned int    io_driver_sel         : 1   ; /* [19]  */
        unsigned int    reserved_2            : 9   ; /* [28..20]  */
        unsigned int    peri_jtagsel          : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CTRL;

/* Define the union U_CPU_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    core0_smpnamp         : 1   ; /* [0]  */
        unsigned int    core1_smpnamp         : 1   ; /* [1]  */
        unsigned int    core2_smpnamp         : 1   ; /* [2]  */
        unsigned int    core3_smpnamp         : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CPU_STAT;

/* Define the union U_CPU_SET */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    core0_cfgnmfi         : 1   ; /* [0]  */
        unsigned int    core1_cfgnmfi         : 1   ; /* [1]  */
        unsigned int    core2_cfgnmfi         : 1   ; /* [2]  */
        unsigned int    core3_cfgnmfi         : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CPU_SET;

/* Define the union U_NF_CFG */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 3   ; /* [2..0]  */
        unsigned int    nandc_block_size_pad  : 2   ; /* [4..3]  */
        unsigned int    nandc_page_size_pad   : 3   ; /* [7..5]  */
        unsigned int    nandc_addr_num_pad    : 1   ; /* [8]  */
        unsigned int    nandc_randomizer_pad  : 1   ; /* [9]  */
        unsigned int    nandc_sync_nand_pad   : 1   ; /* [10]  */
        unsigned int    nandc_ecc_type_pad    : 4   ; /* [14..11]  */
        unsigned int    nandc_boot_page0_cfg  : 1   ; /* [15]  */
        unsigned int    reserved_1            : 4   ; /* [19..16]  */
        unsigned int    nf_boot_cfg_lock      : 6   ; /* [25..20]  */
        unsigned int    reserved_2            : 2   ; /* [27..26]  */
        unsigned int    reserved_3            : 1   ; /* [28]  */
        unsigned int    reserved_4            : 1   ; /* [29]  */
        unsigned int    reserved_5            : 1   ; /* [30]  */
        unsigned int    reserved_6            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_NF_CFG;

/* Define the union U_PERI_SEC_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    a9mp_pmusecure        : 4   ; /* [3..0]  */
        unsigned int    a9mp_pmupriv          : 4   ; /* [7..4]  */
        unsigned int    reserved_0            : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SEC_STAT;

/* Define the union U_PERI_USB_RESUME_INT_MASK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb_suspend_int_mask : 4   ; /* [3..0]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_MASK;

/* Define the union U_PERI_USB_RESUME_INT_RAWSTAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb_suspend_int_rawstat : 4   ; /* [3..0]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_RAWSTAT;

/* Define the union U_PERI_USB_RESUME_INT_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb_suspend_int_stat : 4   ; /* [3..0]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_STAT;

/* Define the union U_PERI_INT_A9TOMCE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_a9tomce           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_A9TOMCE;

/* Define the union U_PERI_INT_A9TODSP0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_a9todsp0      : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_A9TODSP0;

/* Define the union U_PERI_INT_DSP0TOA9 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_dsp0toa9      : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_DSP0TOA9;

/* Define the union U_PERI_INT_A9TODSP1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_a9todsp1      : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_A9TODSP1;

/* Define the union U_PERI_INT_DSP1TOA9 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_dsp1toa9      : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_DSP1TOA9;

/* Define the union U_PERI_INT_DSP0TODSP1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_dsp0todsp1    : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_DSP0TODSP1;

/* Define the union U_PERI_INT_DSP1TODSP0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi_dsp1todsp0    : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_DSP1TODSP0;

/* Define the union U_PERI_INT_SWI0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi0_a9           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI0;

/* Define the union U_PERI_INT_SWI1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi1_a9           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI1;

/* Define the union U_PERI_INT_SWI2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi2_a9           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI2;

/* Define the union U_PERI_QAM */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_qamc_i2c_devaddr : 7   ; /* [6..0]  */
        unsigned int    peri_qamt_i2c_devaddr : 2   ; /* [8..7]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QAM;

/* Define the union U_PERI_QAM_ADC0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_qamadc_opm       : 2   ; /* [1..0]  */
        unsigned int    peri_qamadc_use_prev_f : 1   ; /* [2]  */
        unsigned int    peri_qamadc_ppsel     : 1   ; /* [3]  */
        unsigned int    peri_qamadc_chsel     : 1   ; /* [4]  */
        unsigned int    peri_qamadc_endcr     : 1   ; /* [5]  */
        unsigned int    peri_qamadc_bctrl     : 5   ; /* [10..6]  */
        unsigned int    peri_qamadc_endoutz   : 1   ; /* [11]  */
        unsigned int    peri_qamadc_selof     : 1   ; /* [12]  */
        unsigned int    peri_qamadc_startcal  : 1   ; /* [13]  */
        unsigned int    peri_qamadc_bcal      : 2   ; /* [15..14]  */
        unsigned int    peri_qamadc_fsctrl    : 8   ; /* [23..16]  */
        unsigned int    peri_qamadc_adcrdy    : 1   ; /* [24]  */
        unsigned int    peri_qamadc_bitosync  : 1   ; /* [25]  */
        unsigned int    peri_qamadc_rfalgi    : 3   ; /* [28..26]  */
        unsigned int    peri_qamadc_rfalgq    : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QAM_ADC0;

/* Define the union U_PERI_QAM_ADC1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_qamadc_i2c_devaddr : 7   ; /* [6..0]  */
        unsigned int    peri_qamadc_enavcmin  : 1   ; /* [7]  */
        unsigned int    peri_qamadc_i2c_resetz : 1   ; /* [8]  */
        unsigned int    reserved_0            : 1   ; /* [9]  */
        unsigned int    reserved_1            : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QAM_ADC1;

/* Define the union U_FPGA_CTRL0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_FPGA_CTRL0;
/* Define the union U_FPGA_CTRL1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_FPGA_CTRL1;
/* Define the union U_PERI_SD_LDO */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_sd_ldo_fuse      : 4   ; /* [3..0]  */
        unsigned int    peri_sd_ldo_vset      : 1   ; /* [4]  */
        unsigned int    peri_sd_ldo_en        : 1   ; /* [5]  */
        unsigned int    peri_sd_ldo_bypass    : 1   ; /* [6]  */
        unsigned int    reserved_0            : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SD_LDO;

/* Define the union U_PERI_USB2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb2_ss_word_if_i : 1   ; /* [0]  */
        unsigned int    peri_usb2_ohci_susp_lgcy_i : 1   ; /* [1]  */
        unsigned int    peri_usb2_app_start_clk_i : 1   ; /* [2]  */
        unsigned int    peri_usb2_ulpi_bypass_en_i : 1   ; /* [3]  */
        unsigned int    reserved_0            : 1   ; /* [4]  */
        unsigned int    peri_usb2_ss_autoppd_on_overcur_en_i : 1   ; /* [5]  */
        unsigned int    peri_usb2_ss_ena_incrx_align_i : 1   ; /* [6]  */
        unsigned int    peri_usb2_ss_ena_incr4_i : 1   ; /* [7]  */
        unsigned int    peri_usb2_ss_ena_incr8_i : 1   ; /* [8]  */
        unsigned int    peri_usb2_ss_ena_incr16_i : 1   ; /* [9]  */
        unsigned int    reserved_1            : 2   ; /* [11..10]  */
        unsigned int    peri_usb2_pwr_ctrl    : 16  ; /* [27..12]  */
        unsigned int    reserved_2            : 1   ; /* [28]  */
        unsigned int    reserved_3            : 2   ; /* [30..29]  */
        unsigned int    peri_usb2_ohci_0_cntsel_i_n : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB2;

/* Define the union U_PERI_USB3_0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_pwr_ctrl    : 4   ; /* [3..0]  */
        unsigned int    peri_usb3_hub_vbus_ctrl : 1   ; /* [4]  */
        unsigned int    reserved_0            : 1   ; /* [5]  */
        unsigned int    peri_usb3_hub_port_overcurrent : 1   ; /* [6]  */
        unsigned int    peri_usb3_pcs_tx_deemph_6db : 6   ; /* [12..7]  */
        unsigned int    peri_usb3_host_u3_port_disable : 1   ; /* [13]  */
        unsigned int    peri_usb3_bus_filter_bypass : 4   ; /* [17..14]  */
        unsigned int    peri_usb3_host_u2_port_disable : 1   ; /* [18]  */
        unsigned int    peri_usb3_host_num_u3_port : 4   ; /* [22..19]  */
        unsigned int    peri_usb3_pcs_tx_swing_full : 7   ; /* [29..23]  */
        unsigned int    peri_usb3_lane0_tx2rx_loopbk : 1   ; /* [30]  */
        unsigned int    reserved_1            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_0;

/* Define the union U_PERI_USB3_1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_fladj_30mhz_reg : 7   ; /* [6..0]  */
        unsigned int    peri_usb3_host_num_u2_port : 4   ; /* [10..7]  */
        unsigned int    peri_usb3_lane0_ext_pclk_req : 1   ; /* [11]  */
        unsigned int    peri_usb3_hub_port_perm_attach : 2   ; /* [13..12]  */
        unsigned int    peri_usb3_host_current_belt : 12  ; /* [25..14]  */
        unsigned int    peri_usb3_pcs_tx_deemph_3p5db : 6   ; /* [31..26]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_1;

/* Define the union U_PERI_USB3_2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_pcs_rx_los_mask_val : 10  ; /* [9..0]  */
        unsigned int    reserved_0            : 2   ; /* [11..10]  */
        unsigned int    peri_usb3_reg_sel     : 4   ; /* [15..12]  */
        unsigned int    reserved_1            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_2;

/* Define the union U_PERI_USB3_PHY_0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_phy_acjtlevel : 5   ; /* [4..0]  */
        unsigned int    peri_usb3_phy_testpowerdownhsp : 1   ; /* [5]  */
        unsigned int    peri_usb3_phy_testpowerdownssp : 1   ; /* [6]  */
        unsigned int    peri_usb3_phy_atereset : 1   ; /* [7]  */
        unsigned int    peri_usb3_phy_vatestenb : 2   ; /* [9..8]  */
        unsigned int    peri_usb3_phy_loopbackenb0 : 1   ; /* [10]  */
        unsigned int    peri_usb3_phy_crcapaddr : 1   ; /* [11]  */
        unsigned int    peri_usb3_phy_crcapdata : 1   ; /* [12]  */
        unsigned int    peri_usb3_phy_crdatain : 16  ; /* [28..13]  */
        unsigned int    peri_usb3_phy_crread  : 1   ; /* [29]  */
        unsigned int    peri_usb3_phy_crwrite : 1   ; /* [30]  */
        unsigned int    peri_usb3_phy_rtunereq : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_PHY_0;

/* Define the union U_PERI_USB3_PHY_1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_phy_crdataout : 16  ; /* [15..0]  */
        unsigned int    peri_usb3_phy_crack   : 1   ; /* [16]  */
        unsigned int    reserved_0            : 15  ; /* [31..17]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_PHY_1;

/* Define the union U_PERI_USB3_PHY_2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_phy_tx0_termoffset : 5   ; /* [4..0]  */
        unsigned int    peri_usb3_phy_commononn : 1   ; /* [5]  */
        unsigned int    peri_usb3_phy_refclksel : 2   ; /* [7..6]  */
        unsigned int    peri_usb3_phy_retenablen : 1   ; /* [8]  */
        unsigned int    peri_usb3_phy_fsel    : 6   ; /* [14..9]  */
        unsigned int    peri_usb3_phy_mpll_multiplier : 7   ; /* [21..15]  */
        unsigned int    peri_usb3_phy_mpll_refsscclken : 1   ; /* [22]  */
        unsigned int    peri_usb3_phy_refclkdiv2 : 1   ; /* [23]  */
        unsigned int    reserved_0            : 1   ; /* [24]  */
        unsigned int    peri_usb3_phy_sscen   : 1   ; /* [25]  */
        unsigned int    peri_usb3_phy_sscrange : 3   ; /* [28..26]  */
        unsigned int    reserved_1            : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_PHY_2;

/* Define the union U_PERI_USB3_PHY_3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_phy_sscrefclksel : 9   ; /* [8..0]  */
        unsigned int    peri_usb3_phy_compdistune0 : 3   ; /* [11..9]  */
        unsigned int    peri_usb3_phy_otgtune0 : 3   ; /* [14..12]  */
        unsigned int    peri_usb3_phy_sqrxtune0 : 3   ; /* [17..15]  */
        unsigned int    peri_usb3_phy_txfslstune0 : 4   ; /* [21..18]  */
        unsigned int    peri_usb3_phy_txhsxvtune0 : 2   ; /* [23..22]  */
        unsigned int    peri_usb3_phy_txpreempamptune0 : 2   ; /* [25..24]  */
        unsigned int    peri_usb3_phy_txpreemppulsetune0 : 1   ; /* [26]  */
        unsigned int    peri_usb3_phy_txrestune0 : 2   ; /* [28..27]  */
        unsigned int    reserved_0            : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_PHY_3;

/* Define the union U_PERI_USB3_PHY_4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb3_phy_txrisetune0 : 2   ; /* [1..0]  */
        unsigned int    peri_usb3_phy_txvreftune0 : 4   ; /* [5..2]  */
        unsigned int    peri_usb3_phy_losbias : 3   ; /* [8..6]  */
        unsigned int    peri_usb3_phy_loslevel : 5   ; /* [13..9]  */
        unsigned int    peri_usb3_phy_txvboostlvl : 3   ; /* [16..14]  */
        unsigned int    peri_usb3_phy_txenablen0 : 1   ; /* [17]  */
        unsigned int    peri_usb3_phy_txbitstuffen0 : 1   ; /* [18]  */
        unsigned int    peri_usb3_phy_txbitstuffenh0 : 1   ; /* [19]  */
        unsigned int    reserved_0            : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3_PHY_4;

/* Define the union U_PERI_USB2_PHY_0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_usb2_phy_test_rstn : 1   ; /* [0]  */
        unsigned int    peri_usb2_phy_test_clk : 1   ; /* [1]  */
        unsigned int    peri_usb2_phy_test_wren : 1   ; /* [2]  */
        unsigned int    peri_usb2_phy_test_addr : 6   ; /* [8..3]  */
        unsigned int    peri_usb2_phy_test_wrdata : 8   ; /* [16..9]  */
        unsigned int    peri_usb2_phy_test_rddata : 8   ; /* [24..17]  */
        unsigned int    reserved_0            : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB2_PHY_0;

/* Define the union U_DSP_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_runstall_dsp0    : 1   ; /* [0]  */
        unsigned int    peri_statvectorsel_dsp0 : 1   ; /* [1]  */
        unsigned int    peri_ocdhaltonreset_dsp0 : 1   ; /* [2]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    peri_wdg1_en_dsp0     : 1   ; /* [4]  */
        unsigned int    peri_syn_dbg_sel_dsp0 : 1   ; /* [5]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    peri_runstall_dsp1    : 1   ; /* [8]  */
        unsigned int    peri_statvectorsel_dsp1 : 1   ; /* [9]  */
        unsigned int    peri_ocdhaltonreset_dsp1 : 1   ; /* [10]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    peri_wdg1_en_dsp1     : 1   ; /* [12]  */
        unsigned int    peri_syn_dbg_sel_dsp1 : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DSP_CTRL;

/* Define the union U_DSP_STATUS */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_pwaitmode_dsp0   : 1   ; /* [0]  */
        unsigned int    peri_xocdmode_dsp0    : 1   ; /* [1]  */
        unsigned int    peri_pwaitmode_dsp1   : 1   ; /* [2]  */
        unsigned int    peri_xocdmode_dsp1    : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DSP_STATUS;

/* Define the union U_PERI_DDRPHY_TEST0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_ddrphy0_dbgmux_sel : 4   ; /* [3..0]  */
        unsigned int    peri_ddrphy1_dbgmux_sel : 4   ; /* [7..4]  */
        unsigned int    reserved_0            : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_DDRPHY_TEST0;

/* Define the union U_PERI_CHIP_INFO4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int    dolby_flag            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 1   ; /* [1]  */
        unsigned int    dts_flag              : 1   ; /* [2]  */
        unsigned int    peri_chip_info4       : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_CHIP_INFO4;

/* Define the union U_PERI_SIM_OD_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sim1_pwren_od_sel     : 1   ; /* [0]  */
        unsigned int    sim0_pwren_od_sel     : 1   ; /* [1]  */
        unsigned int    sim0_rst_od_sel       : 1   ; /* [2]  */
        unsigned int    sim1_rst_od_sel       : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SIM_OD_CTRL;
/* Define the union U_PERI_SW_SET */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int peri_sw_set            : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_SW_SET;
/* Define the union U_PERI_QOS_CFG00 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    tvd_arqos             : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    tvd_awqos             : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    peri_dvb3_bypass      : 1   ; /* [8]  */
        unsigned int    peri_dvb4_bypass      : 1   ; /* [9]  */
        unsigned int    peri_qamc_qamt_sel    : 1   ; /* [10]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    hevc_id_cmp_bypass    : 1   ; /* [12]  */
        unsigned int    peri_hevc_reorder_en  : 1   ; /* [13]  */
        unsigned int    mdck_rgmii_clk_mux    : 1   ; /* [14]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    dsp0_arqos            : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    dsp0_awqos            : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    gpu_arqos             : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    gpu_awqos             : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG00;

/* Define the union U_PERI_QOS_CFG01 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrt0_arqos           : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ddrt0_awqos           : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    reserved_2            : 3   ; /* [10..8]  */
        unsigned int    reserved_3            : 1   ; /* [11]  */
        unsigned int    vicap_awqos           : 3   ; /* [14..12]  */
        unsigned int    reserved_4            : 1   ; /* [15]  */
        unsigned int    qtc_arqos             : 3   ; /* [18..16]  */
        unsigned int    reserved_5            : 1   ; /* [19]  */
        unsigned int    qtc_awqos             : 3   ; /* [22..20]  */
        unsigned int    reserved_6            : 1   ; /* [23]  */
        unsigned int    aiao_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_7            : 1   ; /* [27]  */
        unsigned int    aiao_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_8            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG01;

/* Define the union U_PERI_QOS_CFG02 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bpd_arqos             : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    bpd_awqos             : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    vpss0_arqos           : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    vpss0_awqos           : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    jpge_arqos            : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    jpge_awqos            : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    vedu_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    vedu_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG02;

/* Define the union U_PERI_QOS_CFG03 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpss1_arqos           : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    vpss1_awqos           : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    jpgd_arqos            : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    jpgd_awqos            : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    vdh_arqos             : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    vdh_awqos             : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    pgd_arqos             : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    pgd_awqos             : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG03;

/* Define the union U_PERI_QOS_CFG04 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrt1_arqos           : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ddrt1_awqos           : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    dma_arqos             : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    dma_awqos             : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    hwc_arqos             : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    hwc_awqos             : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    tde_arqos             : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    tde_awqos             : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG04;

/* Define the union U_PERI_QOS_CFG05 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdp1_arqos            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    vdp1_awqos            : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    vdp0_arqos            : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    vdp0_awqos            : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    me_arqos              : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    me_awqos              : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    hevc_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    hevc_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG05;

/* Define the union U_PERI_QOS_CFG06 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sfc_hqos              : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    nc_sd1_sd1_hqos       : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    nc_sd1_nc_hqos        : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    hevc_sync_cksel       : 1   ; /* [12]  */
        unsigned int    hevc_source_cksel     : 1   ; /* [13]  */
        unsigned int    peri_ts_3_line        : 1   ; /* [14]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    vdp3_arqos            : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    vdp3_awqos            : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    vdp2_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    vdp2_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG06;

/* Define the union U_PERI_QOS_CFG07 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mc_sha_sha_hqos       : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    eth1_hqos             : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    eth0_hqos             : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    mc_sha_mc_hqos        : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    pvr_hqos              : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    sd0_hqos              : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    u3_arqos              : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    u3_awqos              : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG07;

/* Define the union U_PERI_QOS_CFG08 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 16  ; /* [15..0]  */
        unsigned int    cpu1_arqos            : 3   ; /* [18..16]  */
        unsigned int    reserved_1            : 1   ; /* [19]  */
        unsigned int    cpu1_awqos            : 3   ; /* [22..20]  */
        unsigned int    reserved_2            : 1   ; /* [23]  */
        unsigned int    uoe_hqos              : 3   ; /* [26..24]  */
        unsigned int    reserved_3            : 1   ; /* [27]  */
        unsigned int    d1_df_m_hqos          : 3   ; /* [30..28]  */
        unsigned int    reserved_4            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG08;

/* Define the union U_PERI_DSP1_0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_0;
/* Define the union U_PERI_DSP1_1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_1;
/* Define the union U_PERI_DSP1_2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_2;
/* Define the union U_PERI_DSP1_3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_3;
/* Define the union U_PERI_DSP1_4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_4;
/* Define the union U_PERI_DSP1_5 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_5;
/* Define the union U_PERI_DSP1_6 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_6;
/* Define the union U_PERI_DSP1_7 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP1_7;
/* Define the union U_PERI_DSP0_0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_0;
/* Define the union U_PERI_DSP0_1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_1;
/* Define the union U_PERI_DSP0_2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_2;
/* Define the union U_PERI_DSP0_3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_3;
/* Define the union U_PERI_DSP0_4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_4;
/* Define the union U_PERI_DSP0_5 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_5;
/* Define the union U_PERI_DSP0_6 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_6;
/* Define the union U_PERI_DSP0_7 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_DSP0_7;
/* Define the union U_PERI_OD_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_sim1_pwren_od_sel : 1   ; /* [0]  */
        unsigned int    peri_sim0_pwren_od_sel : 1   ; /* [1]  */
        unsigned int    peri_sim0_rst_od_sel  : 1   ; /* [2]  */
        unsigned int    peri_sim1_rst_od_sel  : 1   ; /* [3]  */
        unsigned int    peri_dimming_pwm_od_sel : 1   ; /* [4]  */
        unsigned int    peri_dimming_pwm_1d1_od_sel : 1   ; /* [5]  */
        unsigned int    peri_dimming_pwm_1d2_od_sel : 1   ; /* [6]  */
        unsigned int    peri_dimming_pwm_1d3_od_sel : 1   ; /* [7]  */
        unsigned int    peri_rf_tagc_od_sel   : 1   ; /* [8]  */
        unsigned int    peri_blk_on_od_sel    : 1   ; /* [9]  */
        unsigned int    peri_demo_agc_od_sel  : 1   ; /* [10]  */
        unsigned int    peri_uart2_txd_od_sel : 1   ; /* [11]  */
        unsigned int    peri_spi0_clk_od_sel  : 1   ; /* [12]  */
        unsigned int    peri_spi0_csn_od_sel  : 1   ; /* [13]  */
        unsigned int    peri_spi0_do_od_sel   : 1   ; /* [14]  */
        unsigned int    reserved_0            : 17  ; /* [31..15]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_OD_CTRL;

/* Define the union U_PERI_SOC_FUSE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 1   ; /* [0]  */
        unsigned int    reserved_1            : 2   ; /* [2..1]  */
        unsigned int    reserved_2            : 2   ; /* [4..3]  */
        unsigned int    reserved_3            : 2   ; /* [6..5]  */
        unsigned int    reserved_4            : 1   ; /* [7]  */
        unsigned int    reserved_5            : 1   ; /* [8]  */
        unsigned int    reserved_6            : 1   ; /* [9]  */
        unsigned int    reserved_7            : 1   ; /* [10]  */
        unsigned int    reserved_8            : 1   ; /* [11]  */
        unsigned int    otp_ctrl_vdac         : 4   ; /* [15..12]  */
        unsigned int    chip_id               : 5   ; /* [20..16]  */
        unsigned int    BTSC                  : 1   ; /* [21]  */
        unsigned int    reserved_9            : 2   ; /* [23..22]  */
        unsigned int    mven                  : 1   ; /* [24]  */
        unsigned int    reserved_10           : 2   ; /* [26..25]  */
        unsigned int    reserved_11           : 1   ; /* [27]  */
        unsigned int    reserved_12           : 2   ; /* [29..28]  */
        unsigned int    reserved_13           : 1   ; /* [30]  */
        unsigned int    reserved_14           : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SOC_FUSE;

/* Define the union U_QTC_MODE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qtc_mode              : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_QTC_MODE;

/* Define the union U_GPU_DDR_MUX */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    gpu_ddr_mux           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_GPU_DDR_MUX;

/* Define the union U_MODE_ATV */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mode_atv              : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_MODE_ATV;

/* Define the union U_VDAC_EQUA_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdac0_equa_sel        : 2   ; /* [1..0]  */
        unsigned int    vdac1_equa_sel        : 2   ; /* [3..2]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_VDAC_EQUA_SEL;

/* Define the union U_HDMITX_MHLNX_CLK_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_hdmitx_mhlnx_clk_sel : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_HDMITX_MHLNX_CLK_SEL;

/* Define the union U_PERI_AGC_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_agc_sel          : 2   ; /* [1..0]  */
        unsigned int    peri_agc_rf_sel       : 1   ; /* [2]  */
        unsigned int    reserved_0            : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_AGC_SEL;

/* Define the union U_PERI_INT_SWI0_DSP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi0_dsp          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI0_DSP;

/* Define the union U_PERI_INT_SWI1_DSP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi1_dsp          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI1_DSP;

/* Define the union U_PERI_INT_SWI2_DSP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi2_dsp          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI2_DSP;

/* Define the union U_PERI_INT_SWI3_DSP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi3_dsp          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI3_DSP;

/* Define the union U_PERI_INT_SWI4_DSP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi4_dsp          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI4_DSP;

/* Define the union U_PERI_INT_SWI_DSP_MASK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_swi0_mask_dsp1    : 1   ; /* [0]  */
        unsigned int    int_swi0_mask_dsp0    : 1   ; /* [1]  */
        unsigned int    int_swi1_mask_dsp1    : 1   ; /* [2]  */
        unsigned int    int_swi1_mask_dsp0    : 1   ; /* [3]  */
        unsigned int    int_swi2_mask_dsp1    : 1   ; /* [4]  */
        unsigned int    int_swi2_mask_dsp0    : 1   ; /* [5]  */
        unsigned int    int_swi3_mask_dsp1    : 1   ; /* [6]  */
        unsigned int    int_swi3_mask_dsp0    : 1   ; /* [7]  */
        unsigned int    int_swi4_mask_dsp1    : 1   ; /* [8]  */
        unsigned int    int_swi4_mask_dsp0    : 1   ; /* [9]  */
        unsigned int    reserved_0            : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_SWI_DSP_MASK;

/* Define the union U_PERI_CI_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_ci_sel           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CI_SEL;

/* Define the union U_PERI_EMMC_LDO */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_emmc_ldo_fuse    : 4   ; /* [3..0]  */
        unsigned int    peri_emmc_ldo_vset    : 1   ; /* [4]  */
        unsigned int    peri_emmc_ldo_en      : 1   ; /* [5]  */
        unsigned int    peri_emmc_ldo_bypass  : 1   ; /* [6]  */
        unsigned int    reserved_0            : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_EMMC_LDO;

/* Define the union U_PERI_DDC_EDID_TIMEOUT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_ddc_edid_timeout : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    peri_ddc_sda_del_en   : 1   ; /* [4]  */
        unsigned int    peri_reg_ddc_del_en   : 1   ; /* [5]  */
        unsigned int    peri_reg_ddc_en       : 1   ; /* [6]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    peri_ddc_filter_sel   : 2   ; /* [9..8]  */
        unsigned int    reserved_2            : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_DDC_EDID_TIMEOUT;

/* Define the union U_PERI_ADEC_SIF_DATA_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_adec_sif_data_sel : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_ADEC_SIF_DATA_SEL;

/* Define the union U_PERI_AIAO_RX1_SD_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_aiao_rx1_sd_sel  : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_AIAO_RX1_SD_SEL;

/* Define the union U_PERI_QTC_EQUA_SEL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_qtc_equa_sel     : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QTC_EQUA_SEL;

/* Define the union U_PERI_PENDING0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_PENDING0;
/* Define the union U_PERI_PENDING1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_PENDING1;
/* Define the union U_PERI_PENDING2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_PENDING2;
/* Define the union U_PERI_MAINFAULT */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_PERI_MAINFAULT;
/* Define the union U_PERI_OTP_NAND_CFG */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_otp_nand_cfg     : 8   ; /* [7..0]  */
        unsigned int    peri_otp_nand_cfg_sel : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_OTP_NAND_CFG;

/* Define the union U_PERI_IO_OEN */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_tso0_oen         : 1   ; /* [0]  */
        unsigned int    peri_qam_tso_oen      : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_IO_OEN;

/* Define the union U_PERI_RESERVED */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    peri_hdmi_rx_tx_otp_sel : 1   ; /* [0]  */
        unsigned int    peri_hdmirx_i2s_sel   : 1   ; /* [1]  */
        unsigned int    peri_arc_sel          : 1   ; /* [2]  */
        unsigned int    reserved_0            : 29  ; /* [31..3]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_RESERVED;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_START_MODE           START_MODE                        ; /* 0x0 */
    volatile U_PERI_STAT            PERI_STAT                         ; /* 0x4 */
    volatile U_PERI_CTRL            PERI_CTRL                         ; /* 0x8 */
    volatile U_CPU_STAT             CPU_STAT                          ; /* 0xc */
    volatile U_CPU_SET              CPU_SET                           ; /* 0x10 */
    volatile U_NF_CFG               NF_CFG                            ; /* 0x14 */
    volatile U_PERI_SEC_STAT        PERI_SEC_STAT                     ; /* 0x18 */
    volatile unsigned int           reserved_0[38]                     ; /* 0x1c~0xb0 */
    volatile U_PERI_USB_RESUME_INT_MASK   PERI_USB_RESUME_INT_MASK    ; /* 0xb4 */
    volatile U_PERI_USB_RESUME_INT_RAWSTAT   PERI_USB_RESUME_INT_RAWSTAT ; /* 0xb8 */
    volatile U_PERI_USB_RESUME_INT_STAT   PERI_USB_RESUME_INT_STAT    ; /* 0xbc */
    volatile U_PERI_INT_A9TOMCE     PERI_INT_A9TOMCE                  ; /* 0xc0 */
    volatile U_PERI_INT_A9TODSP0    PERI_INT_A9TODSP0                 ; /* 0xc4 */
    volatile U_PERI_INT_DSP0TOA9    PERI_INT_DSP0TOA9                 ; /* 0xc8 */
    volatile U_PERI_INT_A9TODSP1    PERI_INT_A9TODSP1                 ; /* 0xcc */
    volatile U_PERI_INT_DSP1TOA9    PERI_INT_DSP1TOA9                 ; /* 0xd0 */
    volatile U_PERI_INT_DSP0TODSP1   PERI_INT_DSP0TODSP1              ; /* 0xd4 */
    volatile U_PERI_INT_DSP1TODSP0   PERI_INT_DSP1TODSP0              ; /* 0xd8 */
    volatile unsigned int           reserved_1[2]                     ; /* 0xdc~0xe0 */
    volatile U_PERI_INT_SWI0        PERI_INT_SWI0                     ; /* 0xe4 */
    volatile U_PERI_INT_SWI1        PERI_INT_SWI1                     ; /* 0xe8 */
    volatile U_PERI_INT_SWI2        PERI_INT_SWI2                     ; /* 0xec */
    volatile unsigned int           reserved_2[4]                     ; /* 0xf0~0xfc */
    volatile U_PERI_QAM             PERI_QAM                          ; /* 0x100 */
    volatile U_PERI_QAM_ADC0        PERI_QAM_ADC0                     ; /* 0x104 */
    volatile U_PERI_QAM_ADC1        PERI_QAM_ADC1                     ; /* 0x108 */
    volatile unsigned int           reserved_3                     ; /* 0x10c */
    volatile U_FPGA_CTRL0           FPGA_CTRL0                        ; /* 0x110 */
    volatile U_FPGA_CTRL1           FPGA_CTRL1                        ; /* 0x114 */
    volatile unsigned int           reserved_4                     ; /* 0x118 */
    volatile U_PERI_SD_LDO          PERI_SD_LDO                       ; /* 0x11c */
    volatile U_PERI_USB2            PERI_USB2                         ; /* 0x120 */
    volatile U_PERI_USB3_0          PERI_USB3_0                       ; /* 0x124 */
    volatile U_PERI_USB3_1          PERI_USB3_1                       ; /* 0x128 */
    volatile U_PERI_USB3_2          PERI_USB3_2                       ; /* 0x12c */
    volatile U_PERI_USB3_PHY_0      PERI_USB3_PHY_0                   ; /* 0x130 */
    volatile U_PERI_USB3_PHY_1      PERI_USB3_PHY_1                   ; /* 0x134 */
    volatile U_PERI_USB3_PHY_2      PERI_USB3_PHY_2                   ; /* 0x138 */
    volatile U_PERI_USB3_PHY_3      PERI_USB3_PHY_3                   ; /* 0x13c */
    volatile U_PERI_USB3_PHY_4      PERI_USB3_PHY_4                   ; /* 0x140 */
    volatile U_PERI_USB2_PHY_0      PERI_USB2_PHY_0                   ; /* 0x144 */
    volatile unsigned int           reserved_5[14]                     ; /* 0x148~0x17c */
    volatile U_DSP_CTRL             DSP_CTRL                          ; /* 0x180 */
    volatile unsigned int           reserved_6                     ; /* 0x184 */
    volatile U_DSP_STATUS           DSP_STATUS                        ; /* 0x188 */
    volatile unsigned int           reserved_7[10]                     ; /* 0x18c~0x1b0 */
    volatile U_PERI_DDRPHY_TEST0    PERI_DDRPHY_TEST0                 ; /* 0x1b4 */
    volatile unsigned int           reserved_8[10]                     ; /* 0x1b8~0x1dc */
    volatile U_PERI_CHIP_INFO4      PERI_CHIP_INFO4                   ; /* 0x1e0 */
    volatile unsigned int           reserved_9[3]                     ; /* 0x1e4~0x1ec */
    volatile U_PERI_SW_SET          PERI_SW_SET                       ; /* 0x1f0 */
    volatile unsigned int           reserved_10[3]                     ; /* 0x1f4~0x1fc */
    volatile U_PERI_QOS_CFG00       PERI_QOS_CFG00                    ; /* 0x200 */
    volatile U_PERI_QOS_CFG01       PERI_QOS_CFG01                    ; /* 0x204 */
    volatile U_PERI_QOS_CFG02       PERI_QOS_CFG02                    ; /* 0x208 */
    volatile U_PERI_QOS_CFG03       PERI_QOS_CFG03                    ; /* 0x20c */
    volatile U_PERI_QOS_CFG04       PERI_QOS_CFG04                    ; /* 0x210 */
    volatile U_PERI_QOS_CFG05       PERI_QOS_CFG05                    ; /* 0x214 */
    volatile U_PERI_QOS_CFG06       PERI_QOS_CFG06                    ; /* 0x218 */
    volatile U_PERI_QOS_CFG07       PERI_QOS_CFG07                    ; /* 0x21c */
    volatile U_PERI_QOS_CFG08       PERI_QOS_CFG08                    ; /* 0x220 */
    volatile unsigned int           reserved_11[119]                     ; /* 0x224~0x3fc */
    volatile U_PERI_DSP1_0          PERI_DSP1_0                       ; /* 0x400 */
    volatile U_PERI_DSP1_1          PERI_DSP1_1                       ; /* 0x404 */
    volatile U_PERI_DSP1_2          PERI_DSP1_2                       ; /* 0x408 */
    volatile U_PERI_DSP1_3          PERI_DSP1_3                       ; /* 0x40c */
    volatile U_PERI_DSP1_4          PERI_DSP1_4                       ; /* 0x410 */
    volatile U_PERI_DSP1_5          PERI_DSP1_5                       ; /* 0x414 */
    volatile U_PERI_DSP1_6          PERI_DSP1_6                       ; /* 0x418 */
    volatile U_PERI_DSP1_7          PERI_DSP1_7                       ; /* 0x41c */
    volatile unsigned int           reserved_12[248]                     ; /* 0x420~0x7fc */
    volatile U_PERI_DSP0_0          PERI_DSP0_0                       ; /* 0x800 */
    volatile U_PERI_DSP0_1          PERI_DSP0_1                       ; /* 0x804 */
    volatile U_PERI_DSP0_2          PERI_DSP0_2                       ; /* 0x808 */
    volatile U_PERI_DSP0_3          PERI_DSP0_3                       ; /* 0x80c */
    volatile U_PERI_DSP0_4          PERI_DSP0_4                       ; /* 0x810 */
    volatile U_PERI_DSP0_5          PERI_DSP0_5                       ; /* 0x814 */
    volatile U_PERI_DSP0_6          PERI_DSP0_6                       ; /* 0x818 */
    volatile U_PERI_DSP0_7          PERI_DSP0_7                       ; /* 0x81c */
    volatile unsigned int           reserved_13[7]                     ; /* 0x820~0x838 */
    volatile U_PERI_OD_CTRL         PERI_OD_CTRL                      ; /* 0x83c */
    volatile U_PERI_SOC_FUSE        PERI_SOC_FUSE                     ; /* 0x840 */
    volatile unsigned int           reserved_14                     ; /* 0x844 */
    volatile U_QTC_MODE             QTC_MODE                          ; /* 0x848 */
    volatile unsigned int           reserved_15                     ; /* 0x84c */
    volatile U_GPU_DDR_MUX          GPU_DDR_MUX                       ; /* 0x850 */
    volatile unsigned int           reserved_16                     ; /* 0x854 */
    volatile U_MODE_ATV             MODE_ATV                          ; /* 0x858 */
    volatile U_VDAC_EQUA_SEL        VDAC_EQUA_SEL                     ; /* 0x85c */
    volatile U_HDMITX_MHLNX_CLK_SEL   HDMITX_MHLNX_CLK_SEL            ; /* 0x860 */
    volatile U_PERI_AGC_SEL         PERI_AGC_SEL                      ; /* 0x864 */
    volatile U_PERI_INT_SWI0_DSP    PERI_INT_SWI0_DSP                 ; /* 0x868 */
    volatile U_PERI_INT_SWI1_DSP    PERI_INT_SWI1_DSP                 ; /* 0x86c */
    volatile U_PERI_INT_SWI2_DSP    PERI_INT_SWI2_DSP                 ; /* 0x870 */
    volatile U_PERI_INT_SWI3_DSP    PERI_INT_SWI3_DSP                 ; /* 0x874 */
    volatile U_PERI_INT_SWI4_DSP    PERI_INT_SWI4_DSP                 ; /* 0x878 */
    volatile U_PERI_INT_SWI_DSP_MASK   PERI_INT_SWI_DSP_MASK          ; /* 0x87c */
    volatile U_PERI_CI_SEL          PERI_CI_SEL                       ; /* 0x880 */
    volatile U_PERI_EMMC_LDO        PERI_EMMC_LDO                     ; /* 0x884 */
    volatile U_PERI_DDC_EDID_TIMEOUT   PERI_DDC_EDID_TIMEOUT          ; /* 0x888 */
    volatile U_PERI_ADEC_SIF_DATA_SEL   PERI_ADEC_SIF_DATA_SEL        ; /* 0x88c */
    volatile U_PERI_AIAO_RX1_SD_SEL   PERI_AIAO_RX1_SD_SEL            ; /* 0x890 */
    volatile U_PERI_QTC_EQUA_SEL    PERI_QTC_EQUA_SEL                 ; /* 0x894 */
    volatile U_PERI_PENDING0        PERI_PENDING0                     ; /* 0x898 */
    volatile U_PERI_PENDING1        PERI_PENDING1                     ; /* 0x89c */
    volatile U_PERI_PENDING2        PERI_PENDING2                     ; /* 0x8a0 */
    volatile U_PERI_MAINFAULT       PERI_MAINFAULT                    ; /* 0x8a4 */
    volatile U_PERI_OTP_NAND_CFG    PERI_OTP_NAND_CFG                 ; /* 0x8a8 */
    volatile U_PERI_IO_OEN          PERI_IO_OEN                       ; /* 0x8ac */
    volatile U_PERI_RESERVED        PERI_RESERVED                     ; /* 0x8b0 */
} S_PERICTRL_REGS_TYPE;

#endif /* __HI_REG_PERI_H__ */
