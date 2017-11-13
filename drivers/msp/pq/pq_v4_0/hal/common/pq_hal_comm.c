/******************************************************************************
*
* Copyright (C) 2014-2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
*****************************************************************************

  File Name	: pq_hal_comm.c
  Version	: Initial Draft
  Author	: pengjunwei 00203646
  Created	: 2013/10/15
  Description	:

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include "pq_hal_comm.h"
#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"
#include "hi_osal.h"



/* VPSS/VDP ���ؼĴ��������ڳ�ʼ������*/
static S_CAS_REGS_TYPE *sg_pstVPSSRegLocal = NULL;
static S_VDP_REGS_TYPE *sg_pstVDPRegLocal  = NULL;

/* VPSS/VDP ����Ĵ������������ò���*/
static S_CAS_REGS_TYPE	  *sg_pstVPSSRegMem[VPSS_HANDLE_NUM]	= {NULL};
static S_VPSSWB_REGS_TYPE *sg_pstVPSSWbcRegMem[VPSS_HANDLE_NUM] = {NULL};
static S_VDP_REGS_TYPE	  *sg_pstVDPRegMem = NULL;

/* PQ HAL��ʼ����־λ*/
static HI_BOOL sg_bHALInit = HI_FALSE;

/* ��ӡʹ�ܿ��� */
static HI_U32 sg_PrintType = PQ_PRN_NOTHING;

/* ��ӡ�м������ݴ����� */
static HI_S8  sg_PrintMsg[1024];

PQ_MMZ_BUF_S	 g_stIPSelAlgBuffer;
S_VDP_REGS_TYPE *g_pstIPSelVdpAlg = HI_NULL;

/**
 \brief ��ʼ��HALģ�飬���뱾�ؼĴ����ڴ�;
 \attention \n
  ��

 \param[in] none

 \retval ::HI_SUCCESS

 */
HI_S32	PQ_HAL_Init(HI_VOID)
{
    if (HI_TRUE == sg_bHALInit)
    {
	return HI_SUCCESS;
    }

    sg_pstVPSSRegLocal = (S_CAS_REGS_TYPE *)HI_KMALLOC(HI_ID_PQ, sizeof(S_CAS_REGS_TYPE), GFP_KERNEL);
    if (sg_pstVPSSRegLocal == HI_NULL)
    {
	HI_ERR_PQ("sg_pstVPSSRegLocal can not kmalloc!\n");
	return HI_FAILURE;
    }

    memset(sg_pstVPSSRegLocal, 0, sizeof(S_CAS_REGS_TYPE));
    sg_pstVDPRegLocal = (S_VDP_REGS_TYPE *)HI_KMALLOC(HI_ID_PQ, sizeof(S_VDP_REGS_TYPE), GFP_KERNEL);
    if (sg_pstVDPRegLocal == HI_NULL)
    {
	HI_ERR_PQ("sg_pstVDPRegLocal can not kmalloc!\n");
	return HI_FAILURE;
    }

    memset(sg_pstVDPRegLocal, 0, sizeof(S_VDP_REGS_TYPE));

    memset(&g_stIPSelAlgBuffer, 0, sizeof(PQ_MMZ_BUF_S));
    if (HI_SUCCESS != PQ_HAL_MMZ_AllocAndMap("PQ_IPSEL_ALG", HI_NULL, sizeof(S_VDP_REGS_TYPE), 0, &g_stIPSelAlgBuffer))
    {
	HI_ERR_PQ("PQ_IPSEL_ALG memory allocated failed!\n");
	return HI_FAILURE;
    }
    g_pstIPSelVdpAlg = (S_VDP_REGS_TYPE *)g_stIPSelAlgBuffer.pu8StartVirAddr;

    sg_bHALInit = HI_TRUE;
    return HI_SUCCESS;
}

/**
 \brief ȥ��ʼ��HALģ��,�ͷű��ؼĴ����ڴ�;
 \attention \n
  ��

 \param[in] none

 \retval ::HI_SUCCESS

 */
HI_S32	PQ_HAL_Deinit(HI_VOID)
{
    HI_S32 i;

    if (HI_FALSE == sg_bHALInit)
    {
	return HI_SUCCESS;
    }

    HI_KFREE(HI_ID_PQ, sg_pstVPSSRegLocal);
    HI_KFREE(HI_ID_PQ, sg_pstVDPRegLocal);

    sg_pstVPSSRegLocal	= NULL;
    sg_pstVDPRegLocal	= NULL;

    for (i = 0; i < VPSS_HANDLE_NUM; i++)
    {
	sg_pstVPSSRegMem[i]    = NULL;
	sg_pstVPSSWbcRegMem[i] = NULL;
    }

    sg_pstVDPRegMem   = NULL;

    PQ_HAL_MMZ_UnmapAndRelease(&g_stIPSelAlgBuffer);
    g_pstIPSelVdpAlg = HI_NULL;

    sg_bHALInit = HI_FALSE;

    return HI_SUCCESS;
}


HI_VOID PQ_HAL_CopyRegBySize(HI_U32 *pDstReg, HI_U32 *pSrcReg, HI_U32 u32RegSize)
{
    HI_U32 i = 0;

    for (i = 0; i < u32RegSize; i++)
    {
	PQ_HAL_RegWrite((HI_U32 *)(pDstReg + i), (*(pSrcReg + i)));
    }

    return;
}


/**
 \brief ����VPSS PQ;
 \attention \n
  ��

 \param[in] *pDstVpssAddr  :Ŀ���ַ
 \param[in] *pSrcVpssAddr  :Դ��ַ
 \retval ::HI_SUCCESS

 */
HI_VOID PQ_HAL_UpdateVpssPQ(S_CAS_REGS_TYPE *pDstVpssAddr, S_CAS_REGS_TYPE *pSrcVpssAddr)
{
    HI_U32 u32ByteSize = 0;


#ifdef PQ_ALG_FMD
    /* FMD */
    u32ByteSize = VPSS_PQ_REG_SIZE(VPSS_PDPCCMOV, VPSS_PDREGION);
    PQ_HAL_CopyRegBySize((HI_VOID *)(&pDstVpssAddr->VPSS_PDPCCMOV),
			 (HI_VOID *)(&pSrcVpssAddr->VPSS_PDPCCMOV), u32ByteSize / 4);
#endif


u32ByteSize = 0;
    return;
}


/**
 \brief ����VDP PQ;
 \attention \n
  ��

 \param[in] *pDstVdpAddr  :Ŀ���ַ
 \param[in] *pSrcVdpAddr  :Դ��ַ
 \retval ::HI_SUCCESS

 */
HI_VOID PQ_HAL_UpdateVdpPQ(S_VDP_REGS_TYPE *pDstVdpAddr, S_VDP_REGS_TYPE *pSrcVdpAddr)
{
    HI_U32 u32ByteSize = 0;

    if (HI_NULL == pDstVdpAddr)
    {
	HI_TRACE(HI_LOG_LEVEL_ERROR, HI_ID_PQ, "pDstVdpAddr is NULL!\n");
	return;
    }

    if (HI_NULL == pSrcVdpAddr)
    {
	HI_TRACE(HI_LOG_LEVEL_ERROR, HI_ID_PQ, "pSrcVdpAddr is NULL!\n");
	return;
    }
    u32ByteSize = 0;

    return;
}

/**
 \brief ����VPSS�Ĵ���;
 \attention \n
  ��

 \param[in] u32HandleNo	 :VPSSͨ����
 \param[in] *pstVPSSReg	 :�������������ļĴ���ָ��

 \retval ::HI_SUCCESS

 */
HI_S32 PQ_HAL_UpdateVpssReg(HI_U32 u32HandleNo, S_CAS_REGS_TYPE *pstVPSSReg, S_VPSSWB_REGS_TYPE *pstVPSSWbcReg)
{
    HI_BOOL bReload = HI_FALSE;

    if (u32HandleNo >= VPSS_HANDLE_NUM)
    {
	HI_ERR_PQ("VPSS HandleNo[%d] over range!\n", u32HandleNo);
	return HI_FAILURE;
    }

    if (sg_pstVPSSWbcRegMem[u32HandleNo] != pstVPSSWbcReg)
    {
	sg_pstVPSSWbcRegMem[u32HandleNo] = pstVPSSWbcReg;
    }

    if (sg_pstVPSSRegMem[u32HandleNo] != pstVPSSReg)
    {
	sg_pstVPSSRegMem[u32HandleNo] = pstVPSSReg;
	bReload = HI_TRUE;
    }

    if (sg_pstVPSSRegMem[u32HandleNo] != NULL && bReload == HI_TRUE)
    {
	PQ_HAL_UpdateVpssPQ(sg_pstVPSSRegMem[u32HandleNo], sg_pstVPSSRegLocal);
    }

    return HI_SUCCESS;
}

/**
 \brief ����VDP�Ĵ���;
 \attention \n
  ��

 \param[in] *pstVDPReg	:��������������VPSS�Ĵ���ָ��

 \retval ::HI_SUCCESS

 */
HI_S32 PQ_HAL_UpdateVdpReg(S_VDP_REGS_TYPE *pstVDPReg)
{
    HI_BOOL bReload = HI_FALSE;

    if (sg_pstVDPRegMem != pstVDPReg)
    {
	sg_pstVDPRegMem = pstVDPReg;
	bReload = HI_TRUE;
    }

    if (sg_pstVDPRegMem != NULL && bReload == HI_TRUE)
    {
	PQ_HAL_UpdateVdpPQ(sg_pstVDPRegMem, sg_pstVDPRegLocal);
    }

    return HI_SUCCESS;
}

/**
 \brief ���VPSS��ǰu32HandleNo��Ӧ����Ĵ����Ƿ���Ч;
 \attention \n
  ��

 \param[in] u32HandleNo

 \retval ::HI_BOOL

 */
HI_BOOL PQ_HAL_CheckVpssValid(HI_U32 u32HandleNo)
{
    if (u32HandleNo >= VPSS_HANDLE_NUM)
    {
	HI_ERR_PQ("VPSS HandleNo=%d is over range!\n", u32HandleNo);
	return HI_FALSE;
    }

    if (sg_pstVPSSRegMem[u32HandleNo] == NULL)
    {
	return HI_FALSE;
    }

    return HI_TRUE;
}

/**
 \brief ���VDP�Ĵ����Ƿ���Ч;
 \attention \n
  ��

 \param[in] none

 \retval ::HI_BOOL

 */
HI_BOOL PQ_HAL_CheckVdpValid(HI_VOID)
{
    if (sg_pstVDPRegMem == NULL)
    {
	return HI_FALSE;
    }

    return HI_TRUE;
}

/**
 \brief ��ȡVPSS��ǰ�Ĵ���;
 \attention \n
  ��

 \param[in] u32HandleNo

 \retval ::VPSS�Ĵ���ָ��

 */
S_CAS_REGS_TYPE *PQ_HAL_GetVpssReg(HI_U32 u32HandleNo)
{
    S_CAS_REGS_TYPE *pstVPSSReg = HI_NULL;

    if (u32HandleNo >= VPSS_HANDLE_NUM)
    {
	HI_ERR_PQ("VPSS HandleNo=%d is over range!\n", u32HandleNo);
	return NULL;
    }

    if (sg_pstVPSSRegMem[u32HandleNo] == NULL)
    {
	pstVPSSReg = sg_pstVPSSRegLocal;
    }
    else
    {
	pstVPSSReg = sg_pstVPSSRegMem[u32HandleNo];
    }

    return pstVPSSReg;
}


/**
 \brief ��ȡVPSS WBC INFO;
 \attention \n
  ��

 \param[in] u32HandleNo

 \retval ::VPSS WBC INFO

 */
S_VPSSWB_REGS_TYPE *PQ_HAL_GetVpssWbcReg(HI_U32 u32HandleNo)
{
    S_VPSSWB_REGS_TYPE *pstVPSSWbcReg = HI_NULL;

    if (u32HandleNo >= VPSS_HANDLE_NUM)
    {
	HI_ERR_PQ("VPSS HandleNo=%d is over range!\n", u32HandleNo);
	return NULL;
    }

    if (sg_pstVPSSWbcRegMem[u32HandleNo] != HI_NULL)
    {
	pstVPSSWbcReg = sg_pstVPSSWbcRegMem[u32HandleNo];
    }
    else
    {
	HI_ERR_PQ("ERROR: VPSS Wbc REG is null point!\n");
    }

    return pstVPSSWbcReg;
}


/**
 \brief ��ȡVDP��ǰ�Ĵ���;
 \attention \n
  ��

 \param[in] none

 \retval ::VDP�Ĵ���ָ��

 */
S_VDP_REGS_TYPE *PQ_HAL_GetVdpReg(HI_VOID)
{
    S_VDP_REGS_TYPE *pstVDPReg = NULL;

    if (sg_pstVDPRegMem == NULL)
    {
	pstVDPReg = sg_pstVDPRegLocal;
    }
    else
    {
	pstVDPReg = sg_pstVDPRegMem;
    }

    return pstVDPReg;
}


/**
 \brief д�Ĵ���;
 \attention \n
  ��

 \param[in] u32HandleNo
 \param[in] u32RegAddr
 \param[in] u32Value

 \retval ::HI_SUCCESS

 */
HI_S32 PQ_HAL_WriteRegister(HI_U32 u32HandleNo, HI_U32 u32RegAddr, HI_U32 u32Value)
{
    S_CAS_REGS_TYPE *pstVPSSReg = HI_NULL;
    S_VDP_REGS_TYPE *pstVDPReg = HI_NULL;
    HI_U32 u32OffsetAddr = 0x0;

    u32OffsetAddr = u32RegAddr & REG_OFFSET_ADDR_MASK;

    if ((PQ_HAL_IsVpssReg(u32RegAddr) == HI_TRUE) && (u32HandleNo < VPSS_HANDLE_NUM))
    {
	pstVPSSReg = PQ_HAL_GetVpssReg(u32HandleNo);

	if (pstVPSSReg == HI_NULL)
	{
	    HI_ERR_PQ("VPSS REG is null point!\n");
	    return HI_FAILURE;
	}

	*(HI_U32 *)((HI_VOID *)pstVPSSReg + u32OffsetAddr) = u32Value;
    }
    else if (PQ_HAL_IsVdpReg(u32RegAddr) == HI_TRUE)
    {
	pstVDPReg = PQ_HAL_GetVdpReg();

	if (pstVDPReg == HI_NULL)
	{
	    HI_ERR_PQ("VDP REG is null point!\n");
	    return HI_FAILURE;
	}

	*(HI_U32 *)((HI_VOID *)pstVDPReg + u32OffsetAddr) = u32Value;
    }
    else
    {}

    return HI_SUCCESS;
}

/* ���Ĵ��� */
HI_S32 PQ_HAL_ReadRegister(HI_U32 u32HandleNo, HI_U32 u32RegAddr, HI_U32 *pu32Value)
{
    S_CAS_REGS_TYPE *pstVPSSReg = HI_NULL;
    S_VDP_REGS_TYPE *pstVDPReg = HI_NULL;
    HI_U32 u32OffsetAddr = 0x0;

    u32OffsetAddr = u32RegAddr & REG_OFFSET_ADDR_MASK;

    if ((PQ_HAL_IsVpssReg(u32RegAddr) == HI_TRUE) && (u32HandleNo < VPSS_HANDLE_NUM))
    {
	pstVPSSReg = PQ_HAL_GetVpssReg(u32HandleNo);

	if (pstVPSSReg == NULL)
	{
	    HI_ERR_PQ("VPSS REG is null point!\n");
	    return HI_FAILURE;
	}

	*pu32Value = *((HI_U32 *)((HI_VOID *)pstVPSSReg + u32OffsetAddr));
    }
    else if (PQ_HAL_IsVdpReg(u32RegAddr) == HI_TRUE)
    {
	pstVDPReg = PQ_HAL_GetVdpReg();

	if (pstVDPReg == NULL)
	{
	    HI_ERR_PQ("VDP REG is null point!\n");
	    return HI_FAILURE;
	}

	*pu32Value = *((HI_U32 *)((HI_VOID *)pstVDPReg + u32OffsetAddr));
    }
    else
    {}

    return HI_SUCCESS;
}

/* ������ʼBITλ����U32���� */
HI_VOID PQ_HAL_CopyU32ByBit(HI_U32 u32Src, HI_U32 u32SrcStartBit, HI_U32 *pu32Dst, HI_U32 u32DstStartBit, HI_U32 u32Num)
{
    HI_U32 u32SrcTmp = 0;
    HI_U32 u32DstTmp = 0;
    HI_U32 u32DstTmpLow	 = 0;
    HI_U32 u32DstTmpHigh = 0;

    if (((u32SrcStartBit + u32Num) > 32) || (u32DstStartBit + u32Num) > 32)
    {
	HI_ERR_PQ("param is illegal!!\n");
	return;
    }

    /* ����src��Ҫ������u32Num��bits�����ƶ���dstָ����λ��; ����λ��0 */
    u32SrcTmp = u32Src << (32 - u32SrcStartBit - u32Num);

    /* ��ָ����u32Numλ�Ƶ���bitλ�� */
    u32SrcTmp = u32SrcTmp >> (32 - u32Num);
    u32SrcTmp = u32SrcTmp << u32DstStartBit;

    /* ����dst��0bit��u32DstStartBitλ */
    u32DstTmpLow = *pu32Dst << (32 - u32DstStartBit); /* ����λ��0 */
    u32DstTmpLow = u32DstTmpLow >> (32 - u32DstStartBit);

    /* ����dst��u32DstStartBit + u32Numλ��32bit */
    u32DstTmpHigh = *pu32Dst >> (u32DstStartBit + u32Num);
    u32DstTmpHigh = u32DstTmpHigh << (u32DstStartBit + u32Num);

    /* ������ */
    u32DstTmp = u32DstTmpHigh | u32SrcTmp | u32DstTmpLow;
    *pu32Dst = u32DstTmp;

    return ;
}

/**
 \brief ����bitλ����U32����
 \attention \n
  ��

 \param[in] pulData,ucBitNo;

 \retval ::HI_SUCCESS

 */
HI_VOID	 PQ_HAL_U32SetBit( HI_U32 *pulData, HI_U8 ucBitNo)
{
    HI_U32 ulBitsMask, ulData;

    if (ucBitNo > 31)
    {
	HI_ERR_PQ("PQ_MNG_U32SetBit bit over range!\n");
	return;
    }

    /* Bits Mask */
    ulBitsMask = 0x00000001;
    ulBitsMask = ulBitsMask << ucBitNo;

    ulData   = *pulData;
    *pulData = ulData | ulBitsMask;
}

/**
 \brief ��U32��Ӧ��bitλ����
 \attention \n
  ��

 \param[in] pulData,ucBitNo;

 \retval ::HI_SUCCESS

 */
HI_VOID PQ_HAL_U32ClearBit( HI_U32 *pulData, HI_U8 ucBitNo)
{
    HI_U32 ulBitsMask, ulData;

    if (ucBitNo > 31)
    {
	HI_ERR_PQ("PQ_MNG_U32ClearBit bit over range!\n");
	return;
    }

    /* Bits Mask */
    ulBitsMask = 0x00000001;
    ulBitsMask = ulBitsMask << ucBitNo;

    ulData   = *pulData;
    *pulData = ulData & (~ulBitsMask);
}

/**
 \brief ��U32�����������λ����ͻ�ȡ��Ӧ��ֵ
 \attention \n
  ��

 \param[in]  ulData,  ucMaxBit,	 ucMinBit;

 \retval ::HI_U32

 */
HI_U32 PQ_HAL_GetU32ByBit( HI_U32 ulData, HI_U8 ucMaxBit, HI_U8 ucMinBit)
{
    HI_U8 ucFlagEr = HI_FALSE;

    if (ucMaxBit < ucMinBit)
    {
	ucFlagEr = HI_TRUE;
    }

    if (ucMaxBit > 31 || ucMinBit > 31)
    {
	ucFlagEr = HI_TRUE;
    }

    if (ucFlagEr == HI_TRUE)
    {
	HI_ERR_PQ("NTDRIVER_BITS_u32GetData bit over range!\n");
	return ucFlagEr;
    }

    ulData = ulData << (31 - ucMaxBit);
    ulData = ulData >> (31 - ucMaxBit);
    ulData = (ulData >> ucMinBit);
    return ulData;
}

/**
 \brief �������λ�����λ����U32������Ӧ��ֵ
 \attention \n
  ��

 \param[in] pulData, ucMaxBit, ucMinBit, ulValue;

 \retval ::none

 */
HI_VOID PQ_HAL_SetU32ByBit( HI_U32 *pulData, HI_U8 ucMaxBit, HI_U8 ucMinBit, HI_U32 ulValue)
{
    HI_U8 ucFlagEr = HI_FALSE;
    HI_U32 ulBitsMask, ulData;

    if (ucMaxBit < ucMinBit)
    {
	ucFlagEr = HI_TRUE;
    }

    if (ucMaxBit > 31 || ucMinBit > 31)
    {
	ucFlagEr = HI_TRUE;
    }

    if (ucFlagEr == HI_TRUE)
    {
	HI_ERR_PQ("bit over range:maxbit[%d],minbit[%d]\n", ucMaxBit, ucMinBit);
	return;
    }

    /* Bits Mask */
    ulBitsMask = 0xFFFFFFFF;
    ulBitsMask = ulBitsMask >> ucMinBit;
    ulBitsMask = ulBitsMask << (31 - ucMaxBit + ucMinBit);
    ulBitsMask = ulBitsMask >> (31 - ucMaxBit);

    ulData   = *pulData;
    ulData   = ulData & (~ulBitsMask);
    ulValue  = (ulValue << ucMinBit) & ulBitsMask;
    *pulData = ulData | ulValue;
}

HI_BOOL PQ_HAL_IsVpssReg(HI_U32 u32RegAddr)
{
    if ((u32RegAddr & REG_BASE_ADDR_MASK) == VPSS_REGS_ADDR)
    {
	return HI_TRUE;
    }

    return HI_FALSE;
}

HI_BOOL PQ_HAL_IsVdpReg(HI_U32 u32RegAddr)
{
    if ((u32RegAddr & REG_BASE_ADDR_MASK) == VDP_REGS_ADDR)
    {
	return HI_TRUE;
    }

    return HI_FALSE;
}

HI_BOOL PQ_HAL_IsSpecialReg(HI_U32 u32RegAddr)
{
    if ((u32RegAddr & REG_BASE_ADDR_MASK) == SPECIAL_REGS_ADDR)
    {
	return HI_TRUE;
    }

    return HI_FALSE;
}

HI_S32 PQ_HAL_PrintMsg(HI_U32 type, const HI_S8 *format, ...)
{
    va_list args;
    HI_S32  nTotalChar = 0;

    /* ��Ϣ���͹��� */
    if ((PQ_PRN_ALWS != type) && (0 == (sg_PrintType & type))) /* ������ӡû�д� */
    {
	return HI_FAILURE;
    }

    /* ����Ϣ��ӡ���ַ��� */
    va_start( args, format );
    nTotalChar = HI_OSAL_Vsnprintf( sg_PrintMsg, sizeof(sg_PrintMsg), format, args );
    va_end( args );

    if ((nTotalChar <= 0) || (nTotalChar >= 1023))
    {
	return HI_FAILURE;
    }

    HI_PRINT("%s", sg_PrintMsg);

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetPrintType(HI_U32 type)
{
    sg_PrintType = type;
    return HI_SUCCESS;
}


HI_VOID PQ_HAL_RegWrite(volatile HI_U32 *a, HI_U32 value)
{
    *a = value;

    return;
}

HI_U32 PQ_HAL_RegRead(volatile HI_U32 *a)
{
    return (*a);
}


HI_S32 PQ_HAL_AllocAndMap(const char *bufname, char *zone_name, HI_U32 u32Size, int align, PQ_MMZ_BUF_S *pstMBuf)
{
    HI_S32 s32Ret = HI_FAILURE;

#ifdef	HI_PQ_SMMU_SUPPORT
    SMMU_BUFFER_S stMMU;
    s32Ret = HI_DRV_SMMU_AllocAndMap( bufname,
				      u32Size, 0, &stMMU);

    if (s32Ret == HI_SUCCESS)
    {

	pstMBuf->u32StartPhyAddr = stMMU.u32StartSmmuAddr;
	pstMBuf->pu8StartVirAddr = stMMU.pu8StartVirAddr;
	pstMBuf->u32Size = stMMU.u32Size;
    }

#else
    MMZ_BUFFER_S stMMZ;

    s32Ret = HI_DRV_MMZ_AllocAndMap(bufname, zone_name, u32Size, align, &stMMZ);

    if (!s32Ret)
    {
	pstMBuf->u32StartPhyAddr = stMMZ.u32StartPhyAddr;
	pstMBuf->pu8StartVirAddr = stMMZ.pu8StartVirAddr;
	pstMBuf->u32Size	 = stMMZ.u32Size;
    }

#endif

    return s32Ret;
}


HI_VOID PQ_HAL_UnmapAndRelease(PQ_MMZ_BUF_S *pstMBuf)
{
#ifdef HI_PQ_SMMU_SUPPORT
    SMMU_BUFFER_S stMMU;

    stMMU.u32StartSmmuAddr = pstMBuf->u32StartPhyAddr;
    stMMU.pu8StartVirAddr = pstMBuf->pu8StartVirAddr;
    stMMU.u32Size = pstMBuf->u32Size;
    HI_DRV_SMMU_UnmapAndRelease(&stMMU);
#else
    MMZ_BUFFER_S stMMZ;

    stMMZ.u32StartPhyAddr = pstMBuf->u32StartPhyAddr;
    stMMZ.pu8StartVirAddr = pstMBuf->pu8StartVirAddr;
    stMMZ.u32Size	  = pstMBuf->u32Size;

    HI_DRV_MMZ_UnmapAndRelease(&stMMZ);
#endif

    return;
}

HI_S32 PQ_HAL_MMZ_AllocAndMap(const HI_CHAR *pchBufName,
			      HI_CHAR *pchZoneName,
			      HI_U32 u32Size,
			      HI_S32 s32Align,
			      PQ_MMZ_BUF_S *pstMBuf)
{
    HI_S32 s32Ret = HI_FAILURE;
    MMZ_BUFFER_S stMMZ;

    s32Ret = HI_DRV_MMZ_AllocAndMap(pchBufName, pchZoneName, u32Size, s32Align, &stMMZ);
    if (HI_SUCCESS == s32Ret)
    {
	pstMBuf->u32StartPhyAddr = stMMZ.u32StartPhyAddr;
	pstMBuf->pu8StartVirAddr = stMMZ.pu8StartVirAddr;
	pstMBuf->u32Size	 = stMMZ.u32Size;
    }

    return s32Ret;
}

HI_VOID PQ_HAL_MMZ_UnmapAndRelease(PQ_MMZ_BUF_S *pstMBuf)
{
    MMZ_BUFFER_S stMMZ;

    stMMZ.u32StartPhyAddr = pstMBuf->u32StartPhyAddr;
    stMMZ.pu8StartVirAddr = pstMBuf->pu8StartVirAddr;
    stMMZ.u32Size	  = pstMBuf->u32Size;
    HI_DRV_MMZ_UnmapAndRelease(&stMMZ);

    return;
}
