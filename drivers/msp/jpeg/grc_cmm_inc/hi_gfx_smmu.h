/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	 : hi_gfx_smmu.h
Version		   : version 1.0
Author		  :
Created		   : 2016/02/02
Description	   : Describes adp file. CNcomment:������ƽ̨���� CNend\n

		 SMMU����:
		 �����Թ���btools�ŵ������/Ŀ¼��
		 ln -fs btools hismm
		 ln -fs btools hismd
		 Ȼ��Ϳ���������������mmu��ַ��
		 hismd.l 0xf8c4f208
		 hismd.l 0xf8c4f20c
		 hismd.l 0xf8c4f304
		 hismd.l 0xf8c4f308
Function List	  :
History		  :
Date		    Author		  Modification
2016/02/02	      y00181162
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 _HI_GFX_SMMU_H_
#define	 _HI_GFX_SMMU_H_


#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */



/***************************** SDK Version Macro Definition *********************/

/** \addtogroup	    GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */


/** @} */    /*! <!-- Macro Definition end */


/*********************************add include here******************************/
#include "hi_type.h"

/***************************** Macro Definition ******************************/

/** \addtogroup	    GFX SMMU */
/** @{ */  /** <!-- ��GFX SMMU�� */



/** @} */    /*! <!-- Macro Definition end */


/*************************** Enum Definition ****************************/

/** \addtogroup	     GFX SMMU */
/** @{ */  /** <!-- ��GFX SMMU�� */


/** @} */  /*! <!-- enum Definition end */

/*************************** Structure Definition ****************************/

#ifdef CONFIG_GFX_MMU_SUPPORT

/** \addtogroup	     GFX SMMU */
/** @{ */  /** <!-- ��GFX SMMU�� */

typedef union
{
    struct
    {
	HI_U32 glb_bypass    :	  1;
	HI_U32 reserved1     :	  2;
	HI_U32 int_en	     :	  1;
	HI_U32 reserved2     :	  12;
	HI_U32 ptw_pf	     :	  4;
	HI_U32 reserved3     :	  12;
    }bits;
    HI_U32 u32Value;
}SMMU_SCR_U;

typedef union
{
    struct
    {
	HI_U32 auto_clk_gt_en	 :    1;
	HI_U32 reserved1	 :    1;
	HI_U32 smmu_idle	 :    1;
	HI_U32 reserved2	 :    29;
    }bits;
    HI_U32 u32Value;
}SMMU_LP_CTRL_U;

typedef union
{
    struct
    {
	HI_U32 int_tlbinvalid_wr_msk	:    1;
	HI_U32 int_tlbinvalid_rd_msk	:    1;
	HI_U32 int_ptw_trans_msk	:    1;
	HI_U32 int_tlbinvalid_msk	:    1;
	HI_U32 reserved1		:    28;
    }bits;
    HI_U32 u32Value;
}SMMU_INTMASK_U;

typedef union
{
    struct
    {
	HI_U32 int_tlbinvalid_wr_raw	:    1;
	HI_U32 int_tlbinvalid_rd_raw	:    1;
	HI_U32 int_ptw_trans_raw	:    1;
	HI_U32 int_tlbinvalid_raw	:    1;
	HI_U32 reserved1		:    28;
    }bits;
    HI_U32 u32Value;
}SMMU_INTRAW_U;

typedef union
{
    struct
    {
	HI_U32 int_ptw_trans_stat	 :    1;
	HI_U32 int_tlbinvalid_stat	 :    1;
	HI_U32 int_tlbinvalid_rd_stat	 :    1;
	HI_U32 int_tlbinvalid_wr_stat	 :    1;
	HI_U32 reserved1		 :    28;
    }bits;
    HI_U32 u32Value;
}SMMU_INTSTAT_U;

typedef union
{
    struct
    {
	HI_U32 int_tlbinvalid_wr_clr	:    1;
	HI_U32 int_tlbinvalid_rd_clr	:    1;
	HI_U32 int_ptw_trans_clr	:    1;
	HI_U32 int_tlbinvalid_clr	:    1;
	HI_U32 reserved1		:    28;
    }bits;
    HI_U32 u32Value;
}SMMU_INTCLR_U;


typedef struct
{
    SMMU_SCR_U		      uScr;		      /** 0x00 **/
    HI_U32		      u32Reserved1;	      /** 0x04 **/
    SMMU_LP_CTRL_U	      uLpCtrl;		      /** 0x08 **/
    HI_U32		      u32Reserved2;	      /** 0x0c **/
    SMMU_INTMASK_U	      uIntMaskSafe;	      /** 0x10 **/
    SMMU_INTRAW_U	      uIntRawSafe;	      /** 0x14 **/
    SMMU_INTSTAT_U	      uIntStatSafe;	      /** 0x18 **/
    SMMU_INTCLR_U	      uIntClrSafe;	      /** 0x1c **/
    SMMU_INTMASK_U	      uIntMask;		      /** 0x20 **/
    SMMU_INTRAW_U	      uIntRaw;		      /** 0x24 **/
    SMMU_INTSTAT_U	      uIntStat;		      /** 0x28 **/
    SMMU_INTCLR_U	      uIntClr;		      /** 0x2c **/
    HI_U32		      u32Reserved3[118];      /** 0x30 **/
    HI_U32		      u32ScbTtbr;	      /** 0x208**/
    HI_U32		      u32CbTtbr;	      /** 0x20c**/
    HI_U32		      u32Reserved4[61];	      /** 0x210**/
    HI_U32		      u32ErrRdAddr;	      /** 0x304**/
    HI_U32		      u32ErrWrAddr;	      /** 0x308**/
    HI_U32		      u32Reserved5;	      /** 0x30c**/
    HI_U32		      u32FaultAddrPtwSafe;    /** 0x310**/
    HI_U32		      u32FaultIdPtwSafe;      /** 0x314**/
    HI_U32		      u32Reserved6[2];	      /** 0x318**/
    HI_U32		      u32FaultAddrPtw;	      /** 0x320**/
    HI_U32		      u32FaultIdPtw;	      /** 0x324**/
    HI_U32		      u32FaultPtwNum;	      /** 0x328**/
    HI_U32		      u32Reserved7;	      /** 0x32c**/
    HI_U32		      u32FaultAddrWrSafe;     /** 0x330**/
    HI_U32		      u32FaultTlbWrSafe;      /** 0x334**/
    HI_U32		      u32FaultIdWrSafe;	      /** 0x338**/
    HI_U32		      u32Reserved8;	      /** 0x33c**/
    HI_U32		      u32FaultAddrWr;	      /** 0x340**/
    HI_U32		      u32FaultTlbWr;	      /** 0x344**/
    HI_U32		      u32FaultIdWr;	      /** 0x348**/
    HI_U32		      u32Reserved9;	      /** 0x34c**/
    HI_U32		      u32FaultAddrRdSafe;     /** 0x350**/
    HI_U32		      u32FaultTlbRdSafe;      /** 0x354**/
    HI_U32		      u32FaultIdRdSafe;	      /** 0x358**/
    HI_U32		      u32Reserved10;	      /** 0x35c**/
    HI_U32		      u32FaultAddrRd;	      /** 0x360**/
    HI_U32		      u32FaultTlbRd;	      /** 0x364**/
    HI_U32		      u32FaultIdRd;	      /** 0x368**/
    HI_U32		      u32FaultTbuInfo;	      /** 0x36c**/
    HI_U32		      u32FaultTbuDbg;	      /** 0x370**/
    HI_U32		      u32PrefBufEmpty;	      /** 0x374**/
    HI_U32		      u32PtwqIdle;	      /** 0x378**/
    HI_U32		      u32ResetState;	      /** 0x37c**/
    HI_U32		      u32MasterDbg0;
    HI_U32		      u32MasterDbg1;
    HI_U32		      u32MasterDbg2;
    HI_U32		      u32MasterDbg3;
}GFX_MMU_REG_S;


/** @} */  /*! <!-- Structure Definition end */


/********************** Global Variable declaration **************************/

static volatile GFX_MMU_REG_S *s_pstMmuReg = NULL;

#endif


/******************************* API declaration *****************************/

/***************************************************************************
* func		   : HI_GFX_MapSmmu
* description	: map smmu register
			  CNcomment: ӳ��SMMU�Ĵ��� CNend\n
* retval	   : HI_SUCCESS �ɹ�
* retval	   : HI_FAILURE ʧ��
* others:	 : NA
****************************************************************************/
static inline HI_S32 HI_GFX_MapSmmuReg(HI_U32 u32SmmuAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    if (NULL == s_pstMmuReg)
    {
       s_pstMmuReg = (volatile GFX_MMU_REG_S*)ioremap_nocache(u32SmmuAddr, sizeof(GFX_MMU_REG_S));
    }
    if (NULL == s_pstMmuReg)
    {
       return HI_FAILURE;
    }
#endif
    return HI_SUCCESS;
}


/***************************************************************************
* func		   : HI_GFX_UnMapSmmu
* description	: un map smmu register
			  CNcomment: ȥӳ��SMMU�Ĵ��� CNend\n
* retval	   : HI_SUCCESS �ɹ�
* retval	   : HI_FAILURE ʧ��
* others:	 : NA
****************************************************************************/
static inline HI_VOID HI_GFX_UnMapSmmuReg(HI_VOID)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    if (NULL == s_pstMmuReg)
    {
	return;
    }
    iounmap((HI_VOID*)s_pstMmuReg);
    s_pstMmuReg = NULL;
#endif
    return;
}


/***************************************************************************
* func		: HI_GFX_InitSmmu
* description	: init smmu, open smmu while work
		  CNcomment: �ڹ�����ʱ��Ŵ�smmu���͹��Ĳ��� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_InitSmmu(HI_U32 u32SmmuAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_U32 u32CbTtbr	= 0;
    HI_U32 u32ErrRdAddr = 0;
    HI_U32 u32ErrWrAddr = 0;

    if (NULL == s_pstMmuReg)
    {
	return HI_FAILURE;
    }
    s_pstMmuReg->uScr.bits.glb_bypass = 0x0;
    s_pstMmuReg->uScr.bits.int_en     = 0x1;

    /** �����ں�Ȼ����Ĵ���������himd.l 0xf8c40000 + 0xf000 + 0x20c�������������� **/
    HI_DRV_SMMU_GetPageTableAddr(&u32CbTtbr, &u32ErrRdAddr, &u32ErrWrAddr);
    s_pstMmuReg->u32ScbTtbr   = u32CbTtbr;	/** 208 ��ȫҳ������ַ	   **/
    s_pstMmuReg->u32CbTtbr    = u32CbTtbr;	/** 20c �ǰ�ȫҳ������ַ   **/
    s_pstMmuReg->u32ErrRdAddr = u32ErrRdAddr;	/** 304 ��ͨ����ַת������ **/
    s_pstMmuReg->u32ErrWrAddr = u32ErrWrAddr;	/** 308 дͨ����ַת������ **/
#endif
    return HI_SUCCESS;
}


/***************************************************************************
* func		: HI_GFX_SmmuResetValue
* description	: get smmu reset value
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_SmmuResetValue(HI_U32 u32SmmuAddr, HI_U32 *pValue)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    if (NULL == s_pstMmuReg)
    {
	return;
    }

    *pValue = s_pstMmuReg->u32ResetState;
#endif
    return;
}

/***************************************************************************
* func		: HI_GFX_DeinitSmmu
* description	: dinit smmu, close smmu while not work
		  CNcomment: ��������ʱ��ر�smmu���͹��Ĳ��� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_DeinitSmmu(HI_VOID)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    if (NULL == s_pstMmuReg)
    {
	return;
    }
    s_pstMmuReg->uScr.bits.glb_bypass = 0x1;
    s_pstMmuReg->uScr.bits.int_en     = 0x0;
#endif
    return;
}

/***************************************************************************
* func		: HI_GFX_SmmuIsr
* description	: irq of smmu
		  CNcomment: smmu�жϴ���
			     0x10 ~ 0x1c ��ȫ�жϴ�������Ӧ��
			     0x20 ~ 0x2c �ǰ�ȫ�жϴ��� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_SmmuIsr(HI_CHAR* pErrType)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    if (NULL == s_pstMmuReg)
    {
	return HI_FAILURE;
    }

    if ((0 == s_pstMmuReg->uIntStatSafe.u32Value) && (0 == s_pstMmuReg->uIntStat.u32Value))
    {
	return HI_SUCCESS;
    }

    HI_PRINT("MODULE : %s safe int stat value : 0x%x unsafe int stat value : 0x%x\n",pErrType,s_pstMmuReg->uIntStatSafe.u32Value,s_pstMmuReg->uIntStat.u32Value);

    if (0 != s_pstMmuReg->uIntStatSafe.bits.int_tlbinvalid_wr_stat)
    {
	HI_PRINT("SMMU_WRITE_ERR MODULE : %s  safe write_err_addr : 0x%x\n",pErrType,s_pstMmuReg->u32FaultAddrWrSafe);
    }

    if (0 != s_pstMmuReg->uIntStatSafe.bits.int_tlbinvalid_rd_stat)
    {
	HI_PRINT("SMMU_READ_ERR	 MODULE : %s  safe read_err_addr : 0x%x\n",pErrType,s_pstMmuReg->u32FaultAddrRdSafe);
    }

    if (0 != s_pstMmuReg->uIntStat.bits.int_tlbinvalid_wr_stat)
    {
	HI_PRINT("SMMU_WRITE_ERR MODULE : %s  unsafe write_err_addr : 0x%x\n",pErrType,s_pstMmuReg->u32FaultAddrWr);
    }

    if (0 != s_pstMmuReg->uIntStat.bits.int_tlbinvalid_rd_stat)
    {
	HI_PRINT("SMMU_READ_ERR	 MODULE : %s  unsafe read_err_addr : 0x%x\n",pErrType,s_pstMmuReg->u32FaultAddrRd);
    }

    s_pstMmuReg->uIntClr.u32Value     |= 0xf;
    s_pstMmuReg->uIntClrSafe.u32Value |= 0xf;

    return HI_FAILURE;
#else
    return HI_SUCCESS;
#endif
}

/** \addtogroup	     GFX SMMU */
/** @{ */  /** <!-- ��GFX SMMU�� */


/** @} */  /*! <!-- API declaration end */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif /* __cplusplus */
#endif	/* __cplusplus */

#endif /**_HI_GFX_SMMU_H_	  *\*/
