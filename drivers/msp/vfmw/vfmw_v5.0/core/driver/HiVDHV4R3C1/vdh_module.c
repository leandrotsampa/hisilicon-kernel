
#include "hi_reg_common.h"
#include "vfmw_osal_ext.h"  //#include "public.h"
#include "vdm_drv_nonkey.h"
#include "user_client.h"

//#include "scd_drv.h"
#include "vdm_hal_local.h"  //#include "vdm_hal_v4r3c1_local.h"
#include "vdh_module.h"
#ifdef VFMW_MODULE_LOWDLY_SUPPORT
#include "hi_drv_stat.h"
#endif


/*============== EXTERN VALUE =============*/
#ifdef VFMW_MODULE_LOWDLY_SUPPORT
extern UINT32 g_LowDelaySeqIndex[MAX_CHAN_NUM];
extern VOID VDEC_Lowdelay_Event_Time(SINT32 ChanId, HI_LD_Event_ID_E eventId, HI_U32 u32FrameId);
#endif

extern Vfmw_Osal_Func_Ptr vfmw_Osal_Func_Ptr_S;

/*============== LOCAL MACRO =============*/


/*============== INTERNAL FUNCTION =============*/

/******************************************
 Reset all modules
******************************************/
VOID VDH_Reset_Global(VOID)
{
    VDMDRV_OpenHardware(0);
    VDMDRV_ResetX(0);
#ifdef HI_SMMU_SUPPORT
    VDMDRV_SetSmmuPageTableAddr(0);
    VDMDRV_EnableSmmu();
#endif
    VDMDRV_CloseHardware(0);

    return;
}


/******************************************
 Start mfde to work on repair mode
******************************************/
VOID VDH_Start_Mfde_Repair(TASK_PARAM_S *pTask)
{
    SINT32 D32 = 0;
    SINT32 *pMfdeRegVirAddr = NULL;
    UINT32 MfdeId = pTask->ModuleId;

	pMfdeRegVirAddr = (SINT32*)MEM_Phy2Vir(VDM_REG_PHY_ADDR);
    if ( NULL == pMfdeRegVirAddr)
    {
	dprint(PRN_FATAL, "%s: map mfde %d register 0x%x failed!\n", __func__, MfdeId, VDM_REG_PHY_ADDR);
	return;
    }

    WR_VREG(VREG_V4R3C1_AVM_ADDR, pTask->MFDE_Regs.reg_avm_addr, MfdeId);
    WR_VREG(VREG_V4R3C1_INT_MASK, pTask->MFDE_Regs.reg_int_mask, MfdeId);
    WR_VREG(VREG_V4R3C1_BASIC_CFG1, pTask->MFDE_Regs.reg_basic_cfg1, MfdeId);

    D32 = 0x00300C03;
    WR_VREG(VREG_V4R3C1_SED_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_ITRANS_TO, D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PMV_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PRC_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_RCN_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_DBLK_TO,   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PPFD_TO,   D32, MfdeId);

    WR_VREG(VREG_V4R3C1_BASIC_CFG0, pTask->MFDE_Regs.reg_basic_cfg0, MfdeId);

    // start repair
    vfmw_Osal_Func_Ptr_S.pfun_Osal_mb();
    WR_VREG(VREG_V4R3C1_VDH_START, 0, MfdeId);
    WR_VREG(VREG_V4R3C1_VDH_START, 1, MfdeId);
    WR_VREG(VREG_V4R3C1_VDH_START, 0, MfdeId);

    return;
}


/******************************************
 Start mfde to work on decode mode
******************************************/
VOID VDH_Start_Mfde_Decode(TASK_PARAM_S *pTask)
{
    UINT32 D32 = 0;
    SINT32 *pMfdeRegVirAddr = NULL;
    U_PERI_CRG30 u32TmpValue;
    UINT32 MfdeId = pTask->ModuleId;

	pMfdeRegVirAddr = (SINT32*)MEM_Phy2Vir(VDM_REG_PHY_ADDR);
    if ( NULL == pMfdeRegVirAddr)
    {
	dprint(PRN_FATAL, "%s: map mfde %d register 0x%x failed!\n", __func__, MfdeId, VDM_REG_PHY_ADDR);
	return;
    }

    WR_SCDREG(0, REG_AVS_FLAG, pTask->SCD_Regs.reg_avs_flag);
    WR_SCDREG(0, REG_VDH_SELRST,   pTask->SCD_Regs.reg_vdh_selrst);

    WR_VREG(VREG_V4R3C1_BASIC_CFG0, pTask->MFDE_Regs.reg_basic_cfg0, MfdeId);
    WR_VREG(VREG_V4R3C1_BASIC_CFG1, pTask->MFDE_Regs.reg_basic_cfg1, MfdeId);
    WR_VREG(VREG_V4R3C1_AVM_ADDR, pTask->MFDE_Regs.reg_avm_addr, MfdeId);
    WR_VREG(VREG_V4R3C1_VAM_ADDR, pTask->MFDE_Regs.reg_vam_addr, MfdeId);
    WR_VREG(VREG_V4R3C1_STREAM_BASE_ADDR, pTask->MFDE_Regs.reg_stream_base_addr, MfdeId);

#ifdef VFMW_MODULE_LOWDLY_SUPPORT
    if(1 == pTask->IsLowDelay)
    {
    WR_VREG(VREG_V4R3C1_PART_DEC_OVER_INT_LEVEL, pTask->MFDE_Regs.reg_part_dec_over_int_level, MfdeId);
    WR_VREG(VREG_V4R3C1_LINE_NUM_STADDR, pTask->MFDE_Regs.reg_line_num_staddr, MfdeId);
    }
#endif

    //EMAR_ID
    if (0 == pTask->SCD_Regs.reg_emar_id)
    {
	D32 = RD_SCDREG(0, REG_EMAR_ID) & (0xffff);
    }
    else
    {
	D32 = RD_SCDREG(0, REG_EMAR_ID) | (1 << 16);
    }
    WR_SCDREG(0, REG_EMAR_ID, D32);

    D32 = 0x00300C03;
    WR_VREG(VREG_V4R3C1_SED_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_ITRANS_TO, D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PMV_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PRC_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_RCN_TO,	   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_DBLK_TO,   D32, MfdeId);
    WR_VREG(VREG_V4R3C1_PPFD_TO,   D32, MfdeId);

    WR_VREG(VREG_V4R3C1_YSTADDR_1D,	 pTask->MFDE_Regs.reg_ystaddr, MfdeId);
    WR_VREG(VREG_V4R3C1_YSTRIDE_1D,	 pTask->MFDE_Regs.reg_ystride, MfdeId);
    WR_VREG(VREG_V4R3C1_UVOFFSET_1D,	 pTask->MFDE_Regs.reg_uvoffset, MfdeId);
    WR_VREG(VREG_V4R3C1_HEAD_INF_OFFSET, pTask->MFDE_Regs.reg_head_inf_offset, MfdeId);

    WR_VREG(VREG_V4R3C1_YSTRIDE_2BIT,	 pTask->MFDE_Regs.reg_ystride_2bit, MfdeId);
    WR_VREG(VREG_V4R3C1_YOFFSET_2BIT,	 pTask->MFDE_Regs.reg_yoffset_2bit, MfdeId);
    WR_VREG(VREG_V4R3C1_UVOFFSET_2BIT,	 pTask->MFDE_Regs.reg_uvoffset_2bit, MfdeId);

    WR_VREG(VREG_V4R3C1_PPFD_BUF_ADDR,	 pTask->MFDE_Regs.reg_ppfd_buf_addr, MfdeId);
    WR_VREG(VREG_V4R3C1_PPFD_BUF_LEN,	 pTask->MFDE_Regs.reg_ppfd_buf_len, MfdeId);
    WR_VREG(VREG_V4R3C1_REF_PIC_TYPE,	 pTask->MFDE_Regs.reg_ref_pic_type, MfdeId);
    WR_VREG(VREG_V4R3C1_FF_APT_EN,	 pTask->MFDE_Regs.reg_ff_apt_en, MfdeId);
    WR_VREG(VREG_V4R3C1_DOWN_CLK_CFG,	 pTask->MFDE_Regs.reg_down_clk_cfg, MfdeId);

    /* clock skip config */
    VDMDRV_SetClockSkip(pTask->CRG_Regs.reg_vdh_clk_skip);

    /* clock frequency control */
    u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
    u32TmpValue.bits.vdh_clk_sel = pTask->CRG_Regs.reg_vdh_clk_sel;
    g_pstRegCrg->PERI_CRG30.u32	 = u32TmpValue.u32;

    /* clock gating config */
    WR_SCDREG(0, REG_VDH_CK_GT, pTask->SCD_Regs.reg_vdh_ck_gt);

    //clear  int
    WR_VREG(VREG_V4R3C1_INT_STATE, pTask->MFDE_Regs.reg_int_state, MfdeId);

    //set int mask
    WR_VREG(VREG_V4R3C1_INT_MASK, pTask->MFDE_Regs.reg_int_mask, MfdeId);
    WR_VREG(VREG_V4R3C1_SMMU_INTMASK, pTask->MFDE_Regs.reg_smmu_int_mask, MfdeId);

    vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);
    vfmw_Osal_Func_Ptr_S.pfun_Osal_mb();

    WR_VREG(VREG_V4R3C1_VDH_START, 0, MfdeId);
    WR_VREG(VREG_V4R3C1_VDH_START, 1, MfdeId);
    WR_VREG(VREG_V4R3C1_VDH_START, 0, MfdeId);

#ifdef VFMW_MODULE_LOWDLY_SUPPORT
    VDEC_Lowdelay_Event_Time(pTask->ChanId, EVENT_VDEC_FRM_IN, g_LowDelaySeqIndex[pTask->ChanId]);
#endif

    return;
}


/*============== EXTERNAL FUNCTION =============*/

/******************************************
 Init VDH Module
******************************************/
VOID VDH_Init_Module(VOID)
{
    VDH_Reset_Global();

    return;
}

/******************************************
 Start Mfde Module
******************************************/
VOID VDH_Start_Mfde_Module(TASK_PARAM_S *pTask)
{
    if (1 == pTask->IsRepair)
    {
	//dprint(PRN_ERROR, "Process Normal Mfde Task Repair, Chan id %d.\n", pTask->ChanId);
	VDH_Start_Mfde_Repair(pTask);
    }
    else
    {
	//dprint(PRN_ERROR, "Process Secure Mfde Task Decode, Chan id %d.\n", pTask->ChanId);
	VDH_Start_Mfde_Decode(pTask);
    }

    return;
}


/******************************************
 Start Scd Module
******************************************/
VOID VDH_Start_Scd_Module(TASK_PARAM_S *pTask)
{
    SINT32 *pScdRegVirAddr = NULL;
    UINT32 ScdId = pTask->ModuleId;

    pScdRegVirAddr = (SINT32*)MEM_Phy2Vir(SCD_REG_PHY_ADDR);
    if ( NULL == pScdRegVirAddr)
    {
	dprint(PRN_FATAL, "%s: map scd register 0x%x failed!\n", __func__, SCD_REG_PHY_ADDR);
	return;
    }

    SCDDRV_Reset(ScdId);
    WR_SCDREG(ScdId, REG_LIST_ADDRESS, pTask->SCD_Regs.reg_list_addr);
    WR_SCDREG(ScdId, REG_UP_ADDRESS, pTask->SCD_Regs.reg_up_addr);
    WR_SCDREG(ScdId, REG_UP_LEN, pTask->SCD_Regs.reg_up_len);
    WR_SCDREG(ScdId, REG_BUFFER_FIRST, pTask->SCD_Regs.reg_buffer_first);
    WR_SCDREG(ScdId, REG_BUFFER_LAST, pTask->SCD_Regs.reg_buffer_last);
    WR_SCDREG(ScdId, REG_BUFFER_INI, pTask->SCD_Regs.reg_buffer_ini);
    WR_SCDREG(ScdId, REG_SCD_PROTOCOL, pTask->SCD_Regs.reg_scd_protocol);
    if (pTask->IsLowDelay)
    {
	WR_SCDREG(ScdId, REG_AVS_FLAG, pTask->SCD_Regs.reg_avs_flag);
    }

#ifndef SCD_BUSY_WAITTING
    WR_SCDREG(ScdId, REG_SCD_INT_MASK, pTask->SCD_Regs.reg_scd_int_mask);
#endif

    WR_SCDREG(ScdId, REG_SCD_START, 0);
    WR_SCDREG(ScdId, REG_SCD_START, 1);

    return;
}


/******************************************
 Record crg reg data into task
******************************************/
VOID VDH_Record_CrgRegData(CRG_RegsMap_S *pRegMap, UINT32 Reg, UINT32 Data)
{
    if (VREG_CRG_VDH_CLK_SEL == Reg)
    {
	pRegMap->reg_vdh_clk_sel = Data;
    }
    else if (VREG_CRG_VDH_CLK_SKIP == Reg)
    {
	pRegMap->reg_vdh_clk_skip = Data;
    }
    else
    {
	dprint(PRN_ERROR, "%s: unrecord reg 0x%x data %d!\n", __func__, Reg, Data);
    }

    return;
}


/******************************************
 Record scd reg data into task
******************************************/
VOID VDH_Record_ScdRegData(SCD_RegsMap_S *pRegMap, UINT32 Reg, UINT32 Data)
{
    switch (Reg)
    {
	case REG_LIST_ADDRESS:
	    pRegMap->reg_list_addr = Data;
	    break;
	case REG_UP_ADDRESS:
	    pRegMap->reg_up_addr = Data;
	    break;
	case REG_UP_LEN:
	    pRegMap->reg_up_len = Data;
	    break;
	case REG_BUFFER_FIRST:
	    pRegMap->reg_buffer_first = Data;
	    break;
	case REG_BUFFER_LAST:
	    pRegMap->reg_buffer_last = Data;
	    break;
	case REG_BUFFER_INI:
	    pRegMap->reg_buffer_ini = Data;
	    break;
	case REG_SCD_PROTOCOL:
	    pRegMap->reg_scd_protocol = Data;
	    break;
	case REG_SCD_INT_MASK:
	    pRegMap->reg_scd_int_mask = Data;
	    break;
	case REG_AVS_FLAG:
	    pRegMap->reg_avs_flag = Data;
	    break;
	case REG_EMAR_ID:
	    pRegMap->reg_emar_id = Data;
	    break;
	case REG_VDH_SELRST:
	    pRegMap->reg_vdh_selrst = Data;
	    break;
	case REG_VDH_CK_GT:
	    pRegMap->reg_vdh_ck_gt = Data;
	    break;
	case REG_DSP_SPS_MSG_ADDRESS:
	    pRegMap->reg_dsp_sps_msg_addr = Data;
	    break;
	case REG_DSP_PPS_MSG_ADDRESS:
	    pRegMap->reg_dsp_pps_msg_addr = Data;
	    break;
	case REG_DVM_MSG_ADDRESS:
	    pRegMap->reg_dvm_msg_addr = Data;
	    break;
	case REG_SED_TOP_ADDRESS:
	    pRegMap->reg_sed_top_addr = Data;
	    break;
	case REG_CA_MN_ADDRESS:
	    pRegMap->reg_ca_mn_addr = Data;
	    break;
	default:
	    dprint(PRN_ERROR, "%s: unrecord reg 0x%x data %d!\n", __func__, Reg, Data);
	    break;
    }

    return;
}


/******************************************
 Record mfde reg data into task
******************************************/
VOID VDH_Record_MfdeRegData(MFDE_RegsMap_S *pRegMap, UINT32 Reg, UINT32 Data)
{
    switch (Reg)
    {
	case VREG_V4R3C1_BASIC_CFG0:
	    pRegMap->reg_basic_cfg0 = Data;
	    break;
	case VREG_V4R3C1_BASIC_CFG1:
	    pRegMap->reg_basic_cfg1 = Data;
	    break;
	case VREG_V4R3C1_AVM_ADDR:
	    pRegMap->reg_avm_addr = Data;
	    break;
	case VREG_V4R3C1_VAM_ADDR:
	    pRegMap->reg_vam_addr = Data;
	    break;
	case VREG_V4R3C1_STREAM_BASE_ADDR:
	    pRegMap->reg_stream_base_addr = Data;
	    break;
	case VREG_V4R3C1_INT_STATE:
	    pRegMap->reg_int_state = Data;
	    break;
	case VREG_V4R3C1_INT_MASK:
	    pRegMap->reg_int_mask = Data;
	    break;
	case VREG_V4R3C1_PART_DEC_OVER_INT_LEVEL:
	    pRegMap->reg_part_dec_over_int_level = Data;
	    break;
	case VREG_V4R3C1_YSTADDR_1D:
	    pRegMap->reg_ystaddr = Data;
	    break;
	case VREG_V4R3C1_YSTRIDE_1D:
	    pRegMap->reg_ystride = Data;
	    break;
	case VREG_V4R3C1_UVOFFSET_1D:
	    pRegMap->reg_uvoffset = Data;
	    break;
	case VREG_V4R3C1_HEAD_INF_OFFSET:
	    pRegMap->reg_head_inf_offset = Data;
	    break;
	case VREG_V4R3C1_LINE_NUM_STADDR:
	    pRegMap->reg_line_num_staddr = Data;
	    break;
	case VREG_V4R3C1_YSTRIDE_2BIT:
	    pRegMap->reg_ystride_2bit = Data;
	    break;
	case VREG_V4R3C1_YOFFSET_2BIT:
	    pRegMap->reg_yoffset_2bit = Data;
	    break;
	case VREG_V4R3C1_UVOFFSET_2BIT:
	    pRegMap->reg_uvoffset_2bit = Data;
	    break;
	case VREG_V4R3C1_PPFD_BUF_ADDR:
	    pRegMap->reg_ppfd_buf_addr = Data;
	    break;
	case VREG_V4R3C1_PPFD_BUF_LEN:
	    pRegMap->reg_ppfd_buf_len = Data;
	    break;
	case VREG_V4R3C1_REF_PIC_TYPE:
	    pRegMap->reg_ref_pic_type = Data;
	    break;
	case VREG_V4R3C1_FF_APT_EN:
	    pRegMap->reg_ff_apt_en = Data;
	    break;
	case VREG_V4R3C1_DOWN_CLK_CFG:
	    pRegMap->reg_down_clk_cfg = Data;
	    break;
	case VREG_V4R3C1_SMMU_INTMASK:
	    pRegMap->reg_smmu_int_mask = Data;
	    break;
	case VREG_V4R3C1_DNR_MBINFO_STADDR:
	case VREG_V4R3C1_SED_TO:
	case VREG_V4R3C1_ITRANS_TO:
	case VREG_V4R3C1_PMV_TO:
	case VREG_V4R3C1_PRC_TO:
	case VREG_V4R3C1_RCN_TO:
	case VREG_V4R3C1_DBLK_TO:
	case VREG_V4R3C1_PPFD_TO:
	    break;
	default:
	    dprint(PRN_ERROR, "%s: unrecord reg 0x%x data %d!\n", __func__, Reg, Data);
	    break;
    }

    return;
}


/******************************************
 Init Hardware
******************************************/
VOID VDH_Init_Hardware(VOID)
{
#ifdef HI_SMMU_SUPPORT
    MMUDRV_OpenHardware(0);
    VDMDRV_SetSmmuPageTableAddr(0);
    VDMDRV_EnableSmmu();
#endif

    return;
}


/******************************************
 Enable scd module
******************************************/
VOID VDH_Enable_Scd_Module(SINT32 ModuleID)
{
    SCDDRV_OpenHardware(ModuleID);

    return;
}


/******************************************
 Disable scd module
******************************************/
VOID VDH_Disable_Scd_Module(SINT32 ModuleID)
{
    SCDDRV_CloseHardware(ModuleID);

    return;
}


/******************************************
 Reset scd module
******************************************/
VOID VDH_Reset_Scd_Module(SINT32 ModuleID)
{
    SCDDRV_Reset(ModuleID);
    return;
}


/******************************************
 Enable mfde module
******************************************/
VOID VDH_Enable_Mfde_Module(SINT32 ModuleID)
{
    VDMDRV_OpenHardware(ModuleID);
    return;
}


/******************************************
 Disable mfde module
******************************************/
VOID VDH_Disable_Mfde_Module(SINT32 ModuleID)
{
    VDMDRV_CloseHardware(ModuleID);
    //SCDDRV_SetStateIdle(ModuleID);	 //fix me!
    //VDMDRV_SetStateIdle(ModuleID);	 //fix me!
	return;
}


/******************************************
 Reset mfde module
******************************************/
VOID VDH_Reset_Mfde_Module(SINT32 ModuleID)
{
    VDMDRV_ResetX(ModuleID);
    return;
}


/******************************************
 Enable bpd module
******************************************/
VOID VDH_Enable_Bpd_Module(SINT32 ModuleID)
{
    VDMDRV_OpenHardware(ModuleID);
    BPDDRV_OpenHardware(ModuleID);
    return;
}


/******************************************
 Disable bpd module
******************************************/
VOID VDH_Disable_Bpd_Module(SINT32 ModuleID)
{
    BPDDRV_CloseHardware(ModuleID);
    return;
}


/******************************************
 Enable dsp module
******************************************/
VOID VDH_Enable_Dsp_Module(SINT32 ModuleID)
{
    DSPDRV_OpenHardware(ModuleID);
    return;
}


/******************************************
 Disable dsp module
******************************************/
VOID VDH_Disable_Dsp_Module(SINT32 ModuleID)
{
    DSPDRV_CloseHardware(ModuleID);
    return;
}


/******************************************
 Load dsp code
******************************************/
VOID VDH_Load_Dsp_Code(SINT32 ModuleID, DSP_REQUIRE_E Require)
{
    DSPDRV_LoadDspCode(ModuleID, Require);
    return;
}
