
#include "vfmw_osal_ext.h"
#include "simple_core.h"
#include "vdm_drv_nonkey.h"
#include "vfmw_osal_ext.h"
#include "vdm_hal_local.h"
#include "dsp_v100_avsp.h"
#include "dsp_v100_h264.h"
#include "vdh_distributor.h"
#include "user_client_com.h"


/*=============== LOCAL DEFINITION =============*/
typedef struct hiDRV_MEM_S
{
    MEM_RECORD_S  stVdmReg[MAX_VDH_NUM];
    MEM_RECORD_S  stFodReg;
    MEM_RECORD_S  stScdReg[MAX_SCD_NUM];
    MEM_RECORD_S  stBpdReg;
    MEM_RECORD_S  stSystemReg;
} DRV_MEM_S;

typedef struct hiDRV_IRQ_RECORD_S
{
    SINT32 VdhIrq[MAX_VDH_NUM];
    SINT32 ScdIrq[MAX_SCD_NUM];
    SINT32 vdh_mmu_irq[MAX_VDH_NUM];
} DRV_IRQ_RECORD_S;


/*================= LOCAL VALUE ================*/
SINT32 g_CurProcChan = FIRST_CHAN_NUM;

VDMDRV_HWMEM_S	g_HwMem[MAX_VDH_NUM];
UADDR		 s_ScdRegPhyBaseAddr[MAX_SCD_NUM] = {0};

static DRV_MEM_S	s_stDrvMem;
static DRV_IRQ_RECORD_S s_stIrqRecord;
static UINT32 s_VfmwIrqHandle = 0;
static SINT32 s_IRQ_HANDLED   = 1;
static SINT32 s_IRQ_FLAG      = 0x00000080;
static MEM_DESC_S	 g_DspMem;

Vfmw_Osal_Func_Ptr vfmw_Osal_Func_Ptr_S;

extern SINT32 g_IRQ_FLAG;
extern UINT8 g_HalDisable;


/*------------------------- INTERNAL FUNCTION -------------------------*/
static SINT32 VFMW_SCore_VdmISR(SINT32 irq, VOID *dev_id)
{
    VFMW_UCC_DATA UccData;

    WR_VREG(VREG_V4R3C1_INT_STATE, 0xFFFFFFFF, 0);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_ISR, ISR_VDH, NULL, 0, -1);
    UccData.IsBlock = 0;
    UccData.Level   = 1;

    VFMW_UC_Com_Process(&UccData);

    return s_IRQ_HANDLED;
}

static SINT32 VFMW_SCore_ScdISR(SINT32 irq, VOID *dev_id)
{
    VFMW_UCC_DATA UccData;

    if ((RD_SCDREG(0, REG_SCD_OVER) & 0x1) == 0)
    {
       dprint(PRN_ALWS, "%s,%d, Error: Exception interrupted\n",__func__,__LINE__);
    }

    WR_SCDREG(0, REG_SCD_INI_CLR, 1);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_ISR, ISR_SCD, NULL, 0, -1);
    UccData.IsBlock = 0;
    UccData.Level   = 1;

    VFMW_UC_Com_Process(&UccData);

    return s_IRQ_HANDLED;
}

SINT32 VFMW_SCore_MmuISR(SINT32 irq, VOID *dev_id)
{
    LOG_NOT_SUPPORT();

    return s_IRQ_HANDLED;
}

static VOID VFMW_SCore_FreeISR(VOID)
{
#ifdef __VFMW_REGISTER_ISR__
#ifndef VDM_BUSY_WAITTING
    if (1 == s_stIrqRecord.VdhIrq[0])
    {
	OSAL_FP_free_irq(VDM_INT_NUM, LOG_GetString(VDH_IRQ_NAME_INDEX), &s_VfmwIrqHandle);
	s_stIrqRecord.VdhIrq[0] = 0;
    }
#endif
#ifndef SCD_BUSY_WAITTING
    if (1 == s_stIrqRecord.ScdIrq[0])
    {
	OSAL_FP_free_irq(SCD_INT_NUM, LOG_GetString(SCD_IRQ_NAME_INDEX), &s_VfmwIrqHandle);
	s_stIrqRecord.ScdIrq[0] = 0;
    }
#endif
#ifdef HI_SMMU_SUPPORT
    if (1 == s_stIrqRecord.vdh_mmu_irq[0])
    {
	OSAL_FP_free_irq(MMU_VDH_NUM, LOG_GetString(MMU_IRQ_NAME_INDEX), &s_VfmwIrqHandle);
	s_stIrqRecord.vdh_mmu_irq[0] = 0;
    }
#endif
#endif

    return;
}

static SINT32 VFMW_SCore_RegisterISR(VOID)
{
#ifdef __VFMW_REGISTER_ISR__
#ifndef VDM_BUSY_WAITTING
    if (OSAL_FP_request_irq(VDM_INT_NUM, VFMW_SCore_VdmISR, s_IRQ_FLAG, LOG_GetString(VDH_IRQ_NAME_INDEX), &s_VfmwIrqHandle) != 0)
    {
	dprint(PRN_FATAL, "Register irq %d failed! VDM ISR = %d, Name = %s\n", VDM_INT_NUM, VDH_IRQ_NAME_INDEX, LOG_GetString(VDH_IRQ_NAME_INDEX));
	goto Exit_Err;
    }

    s_stIrqRecord.VdhIrq[0] = 1;
#endif
#ifndef SCD_BUSY_WAITTING
    if (OSAL_FP_request_irq(SCD_INT_NUM, VFMW_SCore_ScdISR, s_IRQ_FLAG, LOG_GetString(SCD_IRQ_NAME_INDEX), &s_VfmwIrqHandle) != 0)
    {
	dprint(PRN_FATAL, "Register irq %d failed! SCD ISR = %d, Name = %s\n", SCD_INT_NUM, SCD_IRQ_NAME_INDEX, LOG_GetString(SCD_IRQ_NAME_INDEX));
	goto Exit_Err;
    }

    s_stIrqRecord.ScdIrq[0] = 1;
#endif
#ifdef HI_SMMU_SUPPORT
    if (OSAL_FP_request_irq(MMU_VDH_NUM, VFMW_SCore_MmuISR, s_IRQ_FLAG, LOG_GetString(MMU_IRQ_NAME_INDEX), &s_VfmwIrqHandle) != 0)
    {
	dprint(PRN_FATAL, "Register irq %d failed! MMU ISR = %d, Name = %s\n", MMU_VDH_NUM, MMU_IRQ_NAME_INDEX, LOG_GetString(MMU_IRQ_NAME_INDEX));
	goto Exit_Err;
    }

    s_stIrqRecord.vdh_mmu_irq[0] = 1;
#endif
#endif

    return VDEC_OK;

Exit_Err:
    VFMW_SCore_FreeISR();

    return VDEC_ERR;
}

static VOID VFMW_SCore_UmapRegisterAddr(DRV_MEM_S *pstDrvMem)
{
    SINT32 i;
    MEM_RECORD_S *pstMem = NULL;
    SINT8 *VirAddr;
    UADDR  PhyAddr;
    SINT32 Length;

    for (i = 0; i < MAX_VDH_NUM; i++)
    {
	pstMem = &pstDrvMem->stVdmReg[i];
	PhyAddr = pstMem->PhyAddr;
	VirAddr = pstMem->VirAddr;
	Length = pstMem->Length;

	if ( 0 != pstMem->Length )
	{
	    MEM_UnmapRegisterAddr(pstMem->PhyAddr, pstMem->VirAddr);
	    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pstMem, 0, sizeof(MEM_RECORD_S));
	}

	MEM_DelMemRecord(PhyAddr, VirAddr, Length);
    }

    pstMem = &pstDrvMem->stBpdReg;
    PhyAddr = pstMem->PhyAddr;
    VirAddr = pstMem->VirAddr;
    Length = pstMem->Length;

    if ( 0 != pstMem->Length )
    {
	MEM_UnmapRegisterAddr(pstMem->PhyAddr, pstMem->VirAddr);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pstMem, 0, sizeof(MEM_RECORD_S));
    }

    MEM_DelMemRecord(PhyAddr, VirAddr, Length);

    for (i = 0; i < MAX_SCD_NUM; i++)
    {
	pstMem = &pstDrvMem->stScdReg[i];
	PhyAddr = pstMem->PhyAddr;
	VirAddr = pstMem->VirAddr;
	Length = pstMem->Length;

	if ( 0 != pstMem->Length )
	{
	    MEM_UnmapRegisterAddr(pstMem->PhyAddr, pstMem->VirAddr);
	    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pstMem, 0, sizeof(MEM_RECORD_S));
	}

	MEM_DelMemRecord(PhyAddr, VirAddr, Length);
    }

    pstMem = &pstDrvMem->stFodReg;
    PhyAddr = pstMem->PhyAddr;
    VirAddr = pstMem->VirAddr;
    Length = pstMem->Length;

    if (0 != pstMem->Length)
    {
	MEM_UnmapRegisterAddr(pstMem->PhyAddr, pstMem->VirAddr);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pstMem, 0, sizeof(MEM_RECORD_S));
    }

    MEM_DelMemRecord(PhyAddr, VirAddr, Length);

    pstMem = &pstDrvMem->stSystemReg;
    PhyAddr = pstMem->PhyAddr;
    VirAddr = pstMem->VirAddr;
    Length = pstMem->Length;

    if (0 != pstMem->Length)
    {
	MEM_UnmapRegisterAddr(pstMem->PhyAddr, pstMem->VirAddr);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pstMem, 0, sizeof(MEM_RECORD_S));
    }

    MEM_DelMemRecord(PhyAddr, VirAddr, Length);

    return;
}

static SINT32 VFMW_SCore_MapRegisterAddr(DRV_MEM_S *pstDrvMem)
{
    SINT32 i;
    MEM_RECORD_S *pstMem;
    UADDR  vdm_reg_phy_addr;
    UADDR  scd_reg_phy_addr;

    pstMem = &pstDrvMem->stSystemReg;
#ifndef VFMW_SYSTEM_REG_DISABLE
    if (MEM_MapRegisterAddr(SYSTEM_REG_PHY_ADDR, SYSTEM_REG_RANGE, pstMem) != MEM_MAN_OK)
    {
	dprint(PRN_FATAL, "MEM_VFMW_SCore_MapRegisterAddr failed!\n");
	goto Exit_Err;
    }
    MEM_AddMemRecord(pstMem->PhyAddr, pstMem->VirAddr, pstMem->Length);
#endif

    for (i = 0; i < MAX_VDH_NUM; i++)
    {
	pstMem = &pstDrvMem->stVdmReg[i];

	if (i == 0)
	{
	    vdm_reg_phy_addr = VDM_REG_PHY_ADDR;
	}
    #if (MAX_VDH_NUM != 1)
	else if (i == 1)
	{
	    vdm_reg_phy_addr = VDM_REG_PHY_ADDR_1;
	}
    #endif

	if (MEM_MapRegisterAddr(vdm_reg_phy_addr, 64 * 1024, pstMem) != MEM_MAN_OK)
	{
	    dprint(PRN_FATAL, "MEM_MapRegisterAddr reg 0x%x failed!\n", vdm_reg_phy_addr);
	    goto Exit_Err;
	}
	MEM_AddMemRecord(pstMem->PhyAddr, pstMem->VirAddr, pstMem->Length);

	g_HwMem[i].pVdmRegVirAddr = (SINT32 *)pstMem->VirAddr;
    }

    pstMem = &pstDrvMem->stBpdReg;

    if (MEM_MapRegisterAddr(BPD_REG_PHY_ADDR, 4 * 1024, pstMem) != MEM_MAN_OK)
    {
	dprint(PRN_FATAL, "MEM_MapRegisterAddr reg 0x%x failed!\n", BPD_REG_PHY_ADDR);
	goto Exit_Err;
    }
    MEM_AddMemRecord(pstMem->PhyAddr, pstMem->VirAddr, pstMem->Length);

    for (i = 0; i < MAX_SCD_NUM; i++)
    {
	pstMem = &pstDrvMem->stScdReg[i];

	if (i == 0)
	{
	    scd_reg_phy_addr = SCD_REG_PHY_ADDR;
	}
    #if (MAX_VDH_NUM != 1)
	else if (i == 1)
	{
	    scd_reg_phy_addr = SCD_REG_PHY_ADDR_1;
	}
    #endif

	s_ScdRegPhyBaseAddr[i] = scd_reg_phy_addr;
	if (MEM_MapRegisterAddr(scd_reg_phy_addr, 4 * 1024, pstMem) != MEM_MAN_OK)
	{
	    dprint(PRN_FATAL, "MEM_MapRegisterAddr reg 0x%x failed!\n", scd_reg_phy_addr);
	    goto Exit_Err;
	}
	MEM_AddMemRecord(pstMem->PhyAddr, pstMem->VirAddr, pstMem->Length);
    }

    return VDEC_OK;

Exit_Err:
    VFMW_SCore_UmapRegisterAddr(pstDrvMem);

    return VDEC_ERR;
}


static SINT32 VFMW_SCore_OpenDrivers(DRV_MEM_S *pstDrvMem)
{
    if (VFMW_SCore_MapRegisterAddr(pstDrvMem) != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s,%d, Mapping RegisterAddr Failed!\n",__func__,__LINE__);

	return VDEC_ERR;
    }

    if (VFMW_SCore_RegisterISR() != VDEC_OK)
    {
	VFMW_SCore_UmapRegisterAddr(pstDrvMem);

	return VDEC_ERR;
    }

    return VDEC_OK;
}

static VOID VFMW_SCore_CloseDrivers(DRV_MEM_S *pstDrvMem)
{
    VFMW_SCore_UmapRegisterAddr(pstDrvMem);

    VFMW_SCore_FreeISR();

   return;
}

#ifdef VDH_DISTRIBUTOR_ENABLE
static SINT32 VFMW_SCore_InitDistributor(VDEC_OPERATION_S *pArgs)
{
    SINT32 ret = VDEC_ERR;

#if defined(ENV_ARMLINUX_KERNEL)
    ret = VDH_Normal_Init();
    if (ret != VDH_OK)
    {
	dprint(PRN_ERROR, "VDH_Init failed, return %d\n", ret);
	return VDEC_ERR;
    }
#elif defined(ENV_SOS_KERNEL)
    ret = VDH_Secure_Init(&pArgs->ShareData);
    if (ret != VDH_OK)
    {
	dprint(PRN_ERROR, "VDH_Secure_Init failed, return %d\n", ret);
	return VDEC_ERR;
    }
#endif

    return VDEC_OK;
}

static VOID VFMW_SCore_ExitDistributor(VOID)
{
    SINT32 ret = VDH_ERR;

#if defined(ENV_ARMLINUX_KERNEL)
    ret = VDH_Exit();
    if (ret != VDH_OK)
    {
	dprint(PRN_ERROR, "VDH_Exit failed, return %d\n", ret);
    }
#elif defined(ENV_SOS_KERNEL)
    ret = VDH_UnMap_ShareData();
    if (ret != VDH_OK)
    {
	dprint(PRN_ERROR, "VDH_UnMap_ShareData failed, return %d\n", ret);
    }
#endif

    return;
}
#endif


/*------------------------- EXTERNAL FUNCTION -------------------------*/
VOID VFMW_SCore_InitGlobalResource(VOID)
{
   //todo: 对VFMW KDRV 所有的全局变量进行初始化	 (插KO的时候)
   return;
}

VOID VFMW_SCore_InitStaticResource(VOID)
{
   //todo: 对VFMW KDRV 所有的静态资源进行初始化	 (打开设备文件的时候)
   vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(&s_stDrvMem, 0, sizeof(DRV_MEM_S));

   return;
}

SINT32 VFMW_SCore_OpenVfmw(VDEC_OPERATION_S *pArgs)
{
    MEM_INIT_S MemInit;

    MemInit.MemBaseAddr	    = BOARD_MEM_BASE_ADDR;
    MemInit.MemSize	    = BOARD_MEM_TOTAL_SIZE;

    MEM_InitMemManager(&MemInit);

    OSAL_FP_memset(&g_DspMem, 0, sizeof(MEM_DESC_S));
    if (HI_SUCCESS != OSAL_FP_mem_alloc("VFMW_DSP", (0x1180 * 4), 4, 0, &g_DspMem))
    {
	dprint(PRN_FATAL, "Alloc Dsp Buffer Failed!\n");
	return VDEC_ERR;
    }

    if (VFMW_SCore_OpenDrivers(&s_stDrvMem) != VDEC_OK)
    {
	OSAL_FP_mem_free(&g_DspMem);
	return VDEC_ERR;
    }

    return VDEC_OK;
}

VOID VFMW_SCore_CloseVfmw(VOID)
{
   VFMW_SCore_CloseDrivers(&s_stDrvMem);

   OSAL_FP_mem_free(&g_DspMem);

   return;
}

SINT32 VFMW_SCore_InitHardware(VDEC_OPERATION_S *pArgs)
{
    SINT32 ret = VDEC_ERR;

    MMUDRV_OpenHardware(0);

#ifdef VDH_DISTRIBUTOR_ENABLE
    if (g_HalDisable != 1)
    {
	ret = VFMW_SCore_InitDistributor(pArgs);
    }
    else
#endif
    {
	VDMDRV_OpenHardware(0);
	VDMDRV_Reset();

    #ifdef HI_SMMU_SUPPORT
	VDMDRV_SetSmmuPageTableAddr(0);
	VDMDRV_EnableSmmu();
    #endif
	VDMDRV_CloseHardware(0);

	ret = VDEC_OK;
    }

    return ret;
}

VOID VFMW_SCore_ExitHardware(VOID)
{
#ifdef VDH_DISTRIBUTOR_ENABLE
    if (g_HalDisable != 1)
    {
	VFMW_SCore_ExitDistributor();
    }
#endif

    MMUDRV_CloseHardware(0);

    return;
}

VOID VFMW_SCore_SetSmmuPageTableAddr(UINT32 VdhId)
{
    UINT32 CbTtbr, ErrRdAddr, ErrWrAddr;

    if ( NULL != vfmw_Osal_Func_Ptr_S.pfun_Osal_KernelGetPageTableAddr )
    {
	vfmw_Osal_Func_Ptr_S.pfun_Osal_KernelGetPageTableAddr (&CbTtbr, &ErrRdAddr, &ErrWrAddr);
	WR_VREG( VREG_V4R3C1_SMMU_CB_TTBR,  CbTtbr, VdhId );
	WR_VREG( VREG_V4R3C1_SMMU_ERR_RDADDR, ErrRdAddr, VdhId );
	WR_VREG( VREG_V4R3C1_SMMU_ERR_WRADDR, ErrWrAddr, VdhId );
    }

    return;
}

VOID VFMW_SCore_EnableSmmu( VOID )
{
    WR_VREG(VREG_V4R3C1_SMMU_SCR, ((0 << 0) | (1 << 3)), 0); //Disable Glb Bypass, Enable Interrupt
    return;
}

VOID VFMW_SCore_LoadDspCode(SINT32 ScdId, DSP_REQUIRE_E Require)
{
    UINT32 i;
    UINT8  SmmuFlag = 0;
    UINT8  SecureFlag = 0;
    UINT8 *pVirAddr = NULL;
    UINT32 u32VfmwBinLen = 0;
    UINT32 ReadyFlag = 0;

    if (ScdId < 0 || ScdId >= MAX_SCD_NUM)
    {
	dprint(PRN_FATAL, "Fatal: invalid ScdId %d!\n", ScdId);
	return;
    }

    pVirAddr = UINT64_PTR(g_DspMem.VirAddr);
    if (pVirAddr == NULL)
    {
	dprint(PRN_FATAL, "Fatal: get g_hex_base_addr(0x%x) vir addr failed!\n", g_DspMem.MmuAddr);
	return;
    }

    if (DSP_REQUIRE_AVS == Require)
    {
	u32VfmwBinLen = sizeof(g_avsp_firmware);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemCpy(pVirAddr, (HI_U8 *)g_avsp_firmware, sizeof(g_avsp_firmware));

	u32VfmwBinLen = u32VfmwBinLen / 4;
    }
    else if (DSP_REQUIRE_LOWDLY == Require)
    {
	u32VfmwBinLen = sizeof(g_h264_firmware);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemCpy(pVirAddr, (HI_U8 *)g_h264_firmware, sizeof(g_h264_firmware));
	u32VfmwBinLen = u32VfmwBinLen / 4;
    }
    else
    {
	dprint(PRN_FATAL, "Warn: eVidStd = %d have not DSP vfmw bin file!!\n");
	return;
    }

    if (DSP_REQUIRE_AVS == Require)
    {
	WR_SCDREG(ScdId, 0X000, 1);
    }
    else if (DSP_REQUIRE_LOWDLY == Require)
    {
	WR_SCDREG(ScdId, 0X000, 0);
    }

    WR_SCDREG(ScdId, 0X108, u32VfmwBinLen);
    WR_SCDREG(ScdId, 0X10C, g_DspMem.MmuAddr);
    WR_SCDREG(ScdId, 0X100, 0);

#ifdef HI_SMMU_SUPPORT
    SmmuFlag = 1;
#else
    SmmuFlag = 0;
#endif
#ifdef ENV_SOS_KERNEL
    SecureFlag = 1;
#else
    SecureFlag = 0;
#endif

    WR_SCDREG(ScdId, 0X100, 1 | (SecureFlag << 1) | (SmmuFlag << 2));

    for (i = 0; i < 1000; i++)
    {
	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);
	ReadyFlag = (RD_SCDREG(ScdId, 0X104)) & 0x1;
	if (1 == ReadyFlag)
	{
	    break;
	}
    }

    if (i >= 1000)
    {
	dprint(PRN_FATAL, "%s failed!\n",  __func__);
    }
    else
    {
	dprint(PRN_FATAL, "%s success!\n", __func__);
    }

    return;
}
