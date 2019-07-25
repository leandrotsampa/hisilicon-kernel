/******************************************************************************

  版权所有 (C), 2001-2011, 华为技术有限公司

******************************************************************************
    文 件 名   : product.c
    版 本 号   : 初稿
    作	  者   :
    生成日期   :
    最近修改   :
    功能描述   : 产品差异适配

 修改历史   :
    1.日    期 : 2016-06-01
    作	  者   : sdk
    修改内容   :

******************************************************************************/

#include "hi_reg_common.h"
#include "product.h"
#include "vfmw_log.h"
#include "vfmw_osal_ext.h"
#include "hi_drv_stat.h"

#if defined(ENV_SOS_KERNEL) || defined(ENV_ARMLINUX_USER)
#ifdef VFMW_VDH_V4R3C1_SUPPORT
#include "vdm_hal_v4r3c1_api.h"
#endif
#endif

#if defined(ENV_ARMLINUX_KERNEL)
#include "hi_kernel_adapt.h"
#include "hi_drv_sys.h"
#endif

#if !defined(ENV_ARMLINUX_USER)
#include "vdm_drv_nonkey.h"
#include "user_client.h"
#include "vdm_hal_local.h"
#endif


/*======================================================================*/
/*   全局数据								*/
/*======================================================================*/
SINT32 g_ChipMaxWidth  = 8192;	 // chip support max width
SINT32 g_ChipMaxHeight = 8192;	// chip support max height

#ifdef VFMW_MODULE_LOWDLY_SUPPORT
UINT8  g_LowDelayCalcStat[MAX_CHAN_NUM];
SINT32 g_LowDelayCalcHandle[MAX_CHAN_NUM];
UINT32 g_LowDelaySeqIndex[MAX_CHAN_NUM];
#endif

#if  defined(ENV_SOS_KERNEL) || defined(ENV_ARMLINUX_USER)
volatile HI_REG_CRG_S  *g_pstRegCrg;
#endif


/*======================================================================*/
/*   内部接口								*/
/*======================================================================*/



#ifdef VFMW_MODULE_LOWDLY_SUPPORT
/************************************************************************
    低延迟时间统计
 ************************************************************************/
VOID VDEC_Lowdelay_Event_Time(SINT32 ChanId, HI_LD_Event_ID_E eventId, HI_U32 u32FrameId)
{
    //TODO
}
#endif

#ifndef ENV_ARMLINUX_USER
VOID VDM_SetClockSkip(UINT32 SkipValue)
{
	U_PERI_CRG30 u32TmpValue_30;

	u32TmpValue_30.u32 = g_pstRegCrg->PERI_CRG30.u32;
    u32TmpValue_30.bits.vdhclk_skipcfg = SkipValue;

    /* To reset config, we should set 0 then 1 */
    u32TmpValue_30.bits.vdhclk_loaden = 0x0;
    g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue_30.u32;
    u32TmpValue_30.bits.vdhclk_loaden = 0x1;
    g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue_30.u32;

	return;
}

VOID VDM_OpenHardware(SINT32 VdhId)
{
    SINT32 ScdId, D32;

    if (0 == VdhId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
	u32TmpValue.bits.vdh_cken = 0x1;
	u32TmpValue.bits.vdh_all_srst_req = 0x0;
	u32TmpValue.bits.vdh_mfd_srst_req = 0x0;
	u32TmpValue.bits.vdh_clk_sel = 0x0;
	u32TmpValue.bits.vdhclk_skipcfg = 0x0;
	u32TmpValue.bits.vdhclk_loaden = 0x0;/*使能扣脉冲的操作，要扣脉冲的时候此位要配位1*/

	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;

	//VDM_SetClockSkip(25);

	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);
    }
    else
    {
	dprint(PRN_FATAL, "VDM_OpenHardware failed, wrong VdhId %d\n", VdhId);
    }

    for (ScdId = 0; ScdId < MAX_SCD_NUM; ScdId++)
    {
	D32 = 0x1a1f7;
	WR_SCDREG(ScdId, REG_EMAR_ID, D32);
    }

    return;
}

VOID VDM_CloseHardware(SINT32 VdhId)
{
    if (0 == VdhId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;

	VDMDRV_ResetX(VdhId);

	u32TmpValue.bits.vdh_cken = 0x0;
	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);
    }
    else
    {
	dprint(PRN_FATAL, "VDM_CloseHardware failed, wrong VdhId %d\n", VdhId);
    }

    return;
}

VOID DSP_OpenHardware(SINT32 VdhId)
{
    if (0 == VdhId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
	u32TmpValue.bits.vdhdsp_cken = 0x1;

	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);
    }
    else
    {
	dprint(PRN_FATAL, "DSP_OpenHardware failed, wrong VdhId %d\n", VdhId);
    }

    return;
}

VOID DSP_CloseHardware(SINT32 VdhId)
{
    if (0 == VdhId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
	u32TmpValue.bits.vdhdsp_cken = 0x0;

	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);

    }
    else
    {
	dprint(PRN_FATAL, "DSP_CloseHardware failed, wrong VdhId %d\n", VdhId);
    }

    return;
}

VOID SCD_OpenHardware(SINT32 ScdId)
{
    if (0 == ScdId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
	u32TmpValue.bits.vdh_scd_srst_req = 0x0;
	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;
    }
    else
    {
	dprint(PRN_FATAL, "SCD_OpenHardware Wrong ScdId %d\n", ScdId);
    }

    return;
}

VOID SCD_CloseHardware(SINT32 ScdId)
{
    if (0 == ScdId)
    {
	U_PERI_CRG30 u32TmpValue;
	u32TmpValue.u32 = g_pstRegCrg->PERI_CRG30.u32;
	u32TmpValue.bits.vdh_scd_srst_req = 0x1;
	g_pstRegCrg->PERI_CRG30.u32 = u32TmpValue.u32;
    }
    else
    {
	dprint(PRN_FATAL, "SCD_CloseHardware Wrong ScdId %d\n", ScdId);
    }

    return;
}

VOID BPD_OpenHardware(SINT32 BpdId)
{
    U_PERI_CRG34 u32TmpValue;
    u32TmpValue.u32 = g_pstRegCrg->PERI_CRG34.u32;
    u32TmpValue.bits.bpd_cken = 0x1;
    u32TmpValue.bits.bpd_srst_req = 0x0;
    g_pstRegCrg->PERI_CRG34.u32 = u32TmpValue.u32;

    return;
}

VOID BPD_CloseHardware(SINT32 BpdId)
{
    U_PERI_CRG34 u32TmpValue;
    u32TmpValue.u32 = g_pstRegCrg->PERI_CRG34.u32;
    u32TmpValue.bits.bpd_cken = 0x0;
    u32TmpValue.bits.bpd_srst_req = 0x1;
    g_pstRegCrg->PERI_CRG34.u32 = u32TmpValue.u32;

    return;
}


SINT32 SCD_Reset(SINT32 ScdId)
{
    UINT32 tmp;
    UINT32 i;
    U_PERI_CRG30 u32Tmp30Value;

#if (MAX_VDH_NUM != 1)
    U_PERI_CRG162 u32Tmp162Value;
#endif

    //98cv200 复位scd之前，强制打开时钟
    WR_SCDREG( ScdId, REG_SCD_CLK_CFG ,0x3);
    tmp = RD_SCDREG( ScdId, REG_SCD_INT_MASK );

    if (0 == ScdId)
    {
	u32Tmp30Value.u32 = g_pstRegCrg->PERI_CRG30.u32;

	if (u32Tmp30Value.bits.vdh_cken == 0)
	{

	    dprint(PRN_SCD_INFO, "Ignore the reset request when the SCD[%d] clock is closed.\n", ScdId);
	    return VDEC_OK;
	}

	u32Tmp30Value.bits.vdh_scd_srst_req = 0x1;
	g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;
    }

#if (MAX_VDH_NUM != 1)
    else if ( 1 == ScdId)
    {
	u32Tmp162Value.u32 = g_pstRegCrg->PERI_CRG162.u32;

	if (u32Tmp162Value.bits.vdh1_cken == 0)
	{
	    dprint(PRN_SCD_INFO, "Ignore the reset request when the SCD[%d] clock is closed.\n", ScdId);
	    return VDEC_OK;
	}

	u32Tmp162Value.bits.vdh1_scd_srst_req = 0x1;
	g_pstRegCrg->PERI_CRG162.u32 = u32Tmp162Value.u32;
    }
#endif

    for (i = 0; i < 10000; i++)
    {
	U_PERI_CRG93 u32TmpValue_93;
	u32TmpValue_93.u32 = g_pstRegCrg->PERI_CRG93.u32;

	if (0 == ScdId)
	{
	    if ( 0x1 == u32TmpValue_93.bits.vdh_scd_rst_ok)
	    {
		break;
	    }
	}

#if (MAX_VDH_NUM != 1)
	else if (1 == ScdId)
	{
	    if ( 0x1 == u32TmpValue_93.bits.vdh1_scd_rst_ok)
	    {
		break;
	    }
	}
#endif
    }

    if (i >= 10000)
    {
	dprint(PRN_FATAL, "SCD[%d]   ResetSCD ERROR!!!\n", ScdId);
    }

    if (0 == ScdId)
    {
	u32Tmp30Value.bits.vdh_scd_srst_req = 0x0;
	g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;

    }

#if (MAX_VDH_NUM != 1)
    else if (1 == ScdId)
    {
	u32Tmp162Value.bits.vdh1_scd_srst_req = 0x0;
	g_pstRegCrg->PERI_CRG162.u32 = u32Tmp162Value.u32;
    }
#endif

    WR_SCDREG(ScdId, REG_SCD_INT_MASK, (tmp & 1));
    WR_SCDREG( ScdId, REG_SCD_CLK_CFG ,0x2);

    return (VDEC_OK);
}

VOID VDM_ResetX( SINT32 VdhId)
{
    SINT32 i;
    SINT32 *pVdmRegVirAddr;
    SINT32 tmp;
    U_PERI_CRG30 u32Tmp30Value;
    U_PERI_CRG93 u32TmpValue_93;

    if (VdhId > (MAX_VDH_NUM - 1))
    {
	dprint(PRN_FATAL, "%s: VdhId(%d) > %d\n", __func__, VdhId, (MAX_VDH_NUM - 1));
	return ;
    }

    pVdmRegVirAddr = (SINT32 *)MEM_Phy2Vir(VDM_REG_PHY_ADDR);

    if (NULL == pVdmRegVirAddr)
    {
	dprint(PRN_FATAL, "VDMHAL_V4R3C1_ResetVdm: map vdm register fail, vir(reg) = (%p)\n",
	       pVdmRegVirAddr);
	return;
    }

    RD_VREG( VREG_V4R3C1_INT_MASK, tmp, VdhId );

    /* 发出复位请求 */
    u32Tmp30Value.u32 = g_pstRegCrg->PERI_CRG30.u32;

    if (u32Tmp30Value.bits.vdh_cken == 0)
    {
	return;
    }

    u32Tmp30Value.bits.vdh_clk_sel = 0x2;
    g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;
    vfmw_Osal_Func_Ptr_S.pfun_Osal_mb();

    u32Tmp30Value.bits.vdh_mfd_srst_req = 0x1;
    g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;

    /* 确认VDH复位完成 */
    for (i = 0; i < 1000; i++)
    {
	vfmw_Osal_Func_Ptr_S.pfun_Osal_udelay(30);

	u32TmpValue_93.u32 = g_pstRegCrg->PERI_CRG93.u32;

	if ( 0x1 == u32TmpValue_93.bits.vdh_mfd_rst_ok)
	{
	    break;
	}
    }

    if (i >= 1000)
    {
	dprint(PRN_FATAL, "%s module id %d failed!\n", __func__, VdhId);
    }
    else
    {
	dprint(PRN_DBG, "%s module id %d success!\n", __func__, VdhId);
    }

    /* 撤销复位 */
    //*(volatile SINT32 *)pVdmResetVirAddr = reg & (SINT32)(~(1<<vdm_reset_reg_ctrl_bit));
    u32Tmp30Value.bits.vdh_mfd_srst_req = 0x0;
    g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;
    vfmw_Osal_Func_Ptr_S.pfun_Osal_mb();

    u32Tmp30Value.bits.vdh_clk_sel = 0x0;
    g_pstRegCrg->PERI_CRG30.u32 = u32Tmp30Value.u32;

    /* 为了实现互斥功能，VDM中断使能在复位后的值保持复位前相同 */
    WR_VREG( VREG_V4R3C1_INT_MASK, tmp, VdhId );

    return;
}

VOID VDM_Reset( VOID )
{
    UINT32 i = 0;
    SINT32 *pVdmRegVirAddr = NULL;

    pVdmRegVirAddr = (SINT32 *)MEM_Phy2Vir(VDM_REG_PHY_ADDR);

    if (NULL == pVdmRegVirAddr)
    {
	dprint(PRN_FATAL, "%s: map vdm register 0x%x failed!\n", __func__, VDM_REG_PHY_ADDR);
	return;
    }

    for (i = 0; i < MAX_VDH_NUM; i++)
    {
	VDM_ResetX(i);
    }
}

#endif
/************************************************************************
    初始化hal层函数指针
 ************************************************************************/
#ifdef ENV_ARMLINUX_USER
VOID PDT_InitHalInterface(VDMHAL_FUN_PTR_S *pFuncPtr)
{
    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pFuncPtr, 0, sizeof(VDMHAL_FUN_PTR_S));

#ifdef VFMW_VDH_V4R3C1_SUPPORT
    pFuncPtr->pfun_VDMHAL_GetHalMemSize		 = VDMHAL_V4R3C1_GetHalMemSize;
    pFuncPtr->pfun_VDMHAL_CalcFsSize		 = VDMHAL_V4R3C1_CalcFsSize;
    pFuncPtr->pfun_VDMHAL_OpenHAL		 = VDMHAL_V4R3C1_OpenHAL;
    pFuncPtr->pfun_VDMHAL_CloseHAL		 = VDMHAL_V4R3C1_CloseHAL;
    pFuncPtr->pfun_VDMHAL_ArrangeMem		 = VDMHAL_V4R3C1_ArrangeMem;
    pFuncPtr->pfun_VDMHAL_ResetVdm		 = VDMHAL_V4R3C1_ResetVdm;
    pFuncPtr->pfun_VDMHAL_GetRpuSize		 = VDMHAL_V4R3C1_GetRpuSize;
    pFuncPtr->pfun_VDMHAL_GlbReset		 = VDMHAL_V4R3C1_GlbReset;
    pFuncPtr->pfun_VDMHAL_GlbResetX		 = VDMHAL_V4R3C1_GlbResetX;
    pFuncPtr->pfun_VDMHAL_ClearIntState		 = VDMHAL_V4R3C1_ClearIntState;
    pFuncPtr->pfun_VDMHAL_ClearMMUIntState	 = VDMHAL_V4R3C1_ClearMMUIntState;
    pFuncPtr->pfun_VDMHAL_MaskInt		 = VDMHAL_V4R3C1_MaskInt;
    pFuncPtr->pfun_VDMHAL_EnableInt		 = VDMHAL_V4R3C1_EnableInt;
    pFuncPtr->pfun_VDMHAL_CheckReg		 = VDMHAL_V4R3C1_CheckReg;
    pFuncPtr->pfun_VDMHAL_ReadMMUMask		 = VDMHAL_V4R3C1_ReadMMUMask;
    pFuncPtr->pfun_VDMHAL_WriteMMUMask		 = VDMHAL_V4R3C1_WriteMMUMask;
    pFuncPtr->pfun_VDMHAL_StartHwRepair		 = VDMHAL_V4R3C1_StartHwRepair;
    pFuncPtr->pfun_VDMHAL_StartHwDecode		 = VDMHAL_V4R3C1_StartHwDecode;
    pFuncPtr->pfun_VDMHAL_PrepareDec		 = VDMHAL_V4R3C1_PrepareDec;
    pFuncPtr->pfun_VDMHAL_IsVdmReady		 = VDMHAL_V4R3C1_IsVdmReady;
    pFuncPtr->pfun_VDMHAL_IsVdmRun		 = VDMHAL_V4R3C1_IsVdmRun;
    pFuncPtr->pfun_VDMHAL_PrepareRepair		 = VDMHAL_V4R3C1_PrepareRepair;
    pFuncPtr->pfun_VDMHAL_MakeDecReport		 = VDMHAL_V4R3C1_MakeDecReport;
    pFuncPtr->pfun_VDMHAL_UpdateHardwareInfo	 = VDMHAL_V4R3C1_UpdateHardwareInfo;
    pFuncPtr->pfun_VDMHAL_GetCharacter		 = VDMHAL_V4R3C1_GetCharacter;
    pFuncPtr->pfun_VDMHAL_Write1DYuv		 = VDMHAL_V4R3C1_WriteBigTitle1DYuv;
    pFuncPtr->pfun_VDMHAL_IsVdhDecOver		 = VDMHAL_V4R3C1_IsVdhDecOver;
    pFuncPtr->pfun_VDMHAL_IsVdhPartDecOver	 = VDMHAL_V4R3C1_IsVdhPartDecOver;
#endif
}
#else

static VOID PDT_InitHalInterface(VOID *pFuncPtr)
{
    VDMDRV_FUN_PTR_S *pDrvFuncPtr = (VDMDRV_FUN_PTR_S*)pFuncPtr;

    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pDrvFuncPtr, 0, sizeof(VDMDRV_FUN_PTR_S));

    pDrvFuncPtr->pfun_VDMDRV_SetClockSkip	    = VDM_SetClockSkip;
    pDrvFuncPtr->pfun_VDMDRV_OpenHardware	    = VDM_OpenHardware;
    pDrvFuncPtr->pfun_VDMDRV_CloseHardware	    = VDM_CloseHardware;
    pDrvFuncPtr->pfun_DSPDRV_OpenHardware	    = DSP_OpenHardware;
    pDrvFuncPtr->pfun_DSPDRV_CloseHardware	    = DSP_CloseHardware;
    pDrvFuncPtr->pfun_DSPDRV_LoadDspCode	    = VFMW_SCore_LoadDspCode;
    pDrvFuncPtr->pfun_SCDDRV_OpenHardware	    = SCD_OpenHardware;
    pDrvFuncPtr->pfun_SCDDRV_CloseHardware	    = SCD_CloseHardware;
    pDrvFuncPtr->pfun_BPDDRV_OpenHardware	    = BPD_OpenHardware;
    pDrvFuncPtr->pfun_BPDDRV_CloseHardware	    = BPD_CloseHardware;

    pDrvFuncPtr->pfun_SCDDRV_Reset		    = SCD_Reset;
    pDrvFuncPtr->pfun_VDMDRV_Reset		    = VDM_Reset;
    pDrvFuncPtr->pfun_VDMDRV_ResetX		    = VDM_ResetX;

    pDrvFuncPtr->pfun_VDMDRV_SetSmmuPageTableAddr   = VFMW_SCore_SetSmmuPageTableAddr;
    pDrvFuncPtr->pfun_VDMDRV_EnableSmmu		    = VFMW_SCore_EnableSmmu;
}
#endif


/*======================================================================*/
/*   外部接口								*/
/*======================================================================*/

/************************************************************************
    获取解码器能力集
 ************************************************************************/
VOID PDT_GetVdecCapability(VDEC_CAP_S *pCap)
{
    SINT32 StdCnt = 0;

    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(pCap, 0, sizeof(VDEC_CAP_S));

    pCap->s32MaxChanNum = MAX_CHAN_NUM;
    pCap->s32MaxBitRate = 50;
    pCap->s32MaxFrameWidth  = 4096;
    pCap->s32MaxFrameHeight = 2304;
    pCap->s32MaxPixelPerSec = pCap->s32MaxFrameWidth * pCap->s32MaxFrameHeight * 30 * 3 / 2;

    pCap->SupportedStd[StdCnt++] = VFMW_H264;
    pCap->SupportedStd[StdCnt++] = VFMW_MPEG2;
    pCap->SupportedStd[StdCnt++] = VFMW_MPEG4;
    pCap->SupportedStd[StdCnt++] = VFMW_AVS;
#ifdef VFMW_REAL8_SUPPORT
    pCap->SupportedStd[StdCnt++] = VFMW_REAL8;
#endif
#ifdef VFMW_REAL9_SUPPORT
    pCap->SupportedStd[StdCnt++] = VFMW_REAL9;
#endif
    pCap->SupportedStd[StdCnt++] = VFMW_VC1;
    pCap->SupportedStd[StdCnt++] = VFMW_DIVX3;
#ifdef VFMW_H263_SUPPORT
    pCap->SupportedStd[StdCnt++] = VFMW_H263;
    pCap->SupportedStd[StdCnt++] = VFMW_SORENSON;
#endif
    pCap->SupportedStd[StdCnt++] = VFMW_VP6;
    pCap->SupportedStd[StdCnt++] = VFMW_VP6F;
    pCap->SupportedStd[StdCnt++] = VFMW_VP6A;
    pCap->SupportedStd[StdCnt++] = VFMW_VP8;
    pCap->SupportedStd[StdCnt++] = VFMW_MVC;
#ifdef VFMW_HEVC_SUPPORT
    pCap->SupportedStd[StdCnt++] = VFMW_HEVC;
#endif
#ifdef VFMW_VP9_SUPPORT
	pCap->SupportedStd[StdCnt++] = VFMW_VP9;
#endif
    pCap->SupportedStd[StdCnt++] = VFMW_RAW;
    pCap->SupportedStd[StdCnt++] = VFMW_USER;
    pCap->SupportedStd[StdCnt++] = VFMW_END_RESERVED;

    return;
}

/*======================================================================*/
/*   外部接口								*/
/*======================================================================*/

/************************************************************************
    查询解码器特性
 ************************************************************************/
SINT32 PDT_GetAttribute(ATTR_ID eAttrID, VOID *pArgs)
{
    SINT32 ret = PDT_OK;

    switch(eAttrID)
    {
	case ATTR_VDEC_CAP:
	    PDT_GetVdecCapability((VDEC_CAP_S *)pArgs);
	    break;

	default:
	    dprint(PRN_ERROR, "%s unkown eAttrID %d\n", __func__, eAttrID);
	    ret = PDT_ERR;
	    break;
    }

    return ret;
}
/************************************************************************
    产品初始化
 ************************************************************************/
#ifdef ENV_ARMLINUX_USER
SINT32 PDT_Init(VOID *pFuncPtr)
{
    VDMHAL_FUN_PTR_S *ptr = (VDMHAL_FUN_PTR_S *)pFuncPtr;
#if defined(ENV_SOS_KERNEL) || defined(ENV_ARMLINUX_USER)
    g_pstRegCrg = (HI_REG_CRG_S *)vfmw_Osal_Func_Ptr_S.pfun_Osal_KernelRegisterMap(SYSTEM_REG_PHY_ADDR);
    if (g_pstRegCrg == NULL)
    {
	dprint(PRN_FATAL, "SOS map CRG reg failed!\n");

	return PDT_ERR;
    }
#endif

    PDT_InitHalInterface(ptr);

    VDMHAL_GetCharacter();

    return PDT_OK;
}
#else

SINT32 PDT_Init(VOID *pFuncPtr)
{
#ifdef ENV_SOS_KERNEL
    g_pstRegCrg = (HI_REG_CRG_S *)vfmw_Osal_Func_Ptr_S.pfun_Osal_KernelRegisterMap(SYSTEM_REG_PHY_ADDR);
    if (g_pstRegCrg == NULL)
    {
	dprint(PRN_FATAL, "SOS map CRG reg failed!\n");

	return PDT_ERR;
    }
#endif

    PDT_InitHalInterface(pFuncPtr);

    return PDT_OK;
}
#endif
