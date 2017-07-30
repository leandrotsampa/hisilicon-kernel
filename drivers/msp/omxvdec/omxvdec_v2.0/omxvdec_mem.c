/*
 * Copyright (c) (2014 - ...) Device Chipset Source Algorithm and Chipset Platform Development Dept
 * Hisilicon. All rights reserved.
 *
 * File:    task.c
 *
 * Purpose: omxvdec task functions
 *
 * Author:  yangyichang 00226912
 *
 * Date:    26, 11, 2014
 *
 */

/* SPDX-License-Identifier: GPL-2.0 */

#include "omxvdec.h"
#include "omxvdec_mem.h"


/*============== EXPORT FUNCTION =============*/

HI_S32 HI_DRV_OMXVDEC_AllocAndMap(const char *bufname, char *zone_name, HI_U32 size, int align, MMZ_BUFFER_S *psMBuf)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SMMU_BUFFER_S stSMMUBuf;
    memset(&stSMMUBuf, 0, sizeof(stSMMUBuf));

    OMXVDEC_ASSERT_RETURN(psMBuf !=  HI_NULL, "invalid param");

    s32Ret = HI_DRV_SMMU_AllocAndMap(bufname, size, align, &stSMMUBuf);

    psMBuf->pu8StartVirAddr  = stSMMUBuf.pu8StartVirAddr;
    psMBuf->u32StartPhyAddr  = stSMMUBuf.u32StartSmmuAddr;
    psMBuf->u32Size	     = stSMMUBuf.u32Size;

    return s32Ret;
}

HI_VOID HI_DRV_OMXVDEC_UnmapAndRelease(MMZ_BUFFER_S *psMBuf)
{
    SMMU_BUFFER_S stSMMUBuf;
    memset(&stSMMUBuf, 0, sizeof(stSMMUBuf));

    OMXVDEC_ASSERT_RETURN_NULL(psMBuf !=  HI_NULL, "invalid param");

    stSMMUBuf.pu8StartVirAddr  = psMBuf->pu8StartVirAddr;
    stSMMUBuf.u32StartSmmuAddr = psMBuf->u32StartPhyAddr;
    stSMMUBuf.u32Size	       = psMBuf->u32Size;

    HI_DRV_SMMU_UnmapAndRelease(&stSMMUBuf);

    return;
}


HI_S32 HI_DRV_OMXVDEC_Alloc(const char *bufname, char *zone_name, HI_U32 size, int align, MMZ_BUFFER_S *psMBuf, HI_BOOL is_sec)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SMMU_BUFFER_S stSMMUBuf;
    memset(&stSMMUBuf, 0, sizeof(stSMMUBuf));

    OMXVDEC_ASSERT_RETURN(psMBuf !=  HI_NULL, "invalid param");


    if (is_sec)
    {
	s32Ret = HI_DRV_SECSMMU_Alloc(bufname, size, align, &stSMMUBuf);
    }
    else
    {
	s32Ret = HI_DRV_SMMU_Alloc(bufname, size, align, &stSMMUBuf);
    }

    psMBuf->pu8StartVirAddr  = stSMMUBuf.pu8StartVirAddr;
    psMBuf->u32StartPhyAddr  = stSMMUBuf.u32StartSmmuAddr;
    psMBuf->u32Size	     = stSMMUBuf.u32Size;

    OmxPrint(OMX_INFO, "%s %s phy 0x%x size 0x%x secure:%d\n", __func__, bufname, psMBuf->u32StartPhyAddr, psMBuf->u32Size, is_sec);

    return s32Ret;
}


HI_VOID HI_DRV_OMXVDEC_Release(MMZ_BUFFER_S *psMBuf, HI_BOOL is_sec)
{
    SMMU_BUFFER_S stSMMUBuf;
    memset(&stSMMUBuf, 0, sizeof(stSMMUBuf));

    OMXVDEC_ASSERT_RETURN_NULL(psMBuf !=  HI_NULL, "invalid param");

    stSMMUBuf.pu8StartVirAddr = psMBuf->pu8StartVirAddr;
    stSMMUBuf.u32StartSmmuAddr = psMBuf->u32StartPhyAddr;
    stSMMUBuf.u32Size	      = psMBuf->u32Size;

    if (is_sec)
    {
	HI_DRV_SECSMMU_Release(&stSMMUBuf);
    }
    else
    {
	HI_DRV_SMMU_Release(&stSMMUBuf);
    }


    OmxPrint(OMX_INFO, "%s phy 0x%x size 0x%x secure:%d\n", __func__, psMBuf->u32StartPhyAddr, psMBuf->u32Size, is_sec);
}


HI_S32 HI_DRV_OMXVDEC_Map(MMZ_BUFFER_S *psMBuf)
{
    HI_S32 s32Ret = HI_SUCCESS;
    SMMU_BUFFER_S stSMMUBuf;

    stSMMUBuf.u32StartSmmuAddr = psMBuf->u32StartPhyAddr;
    stSMMUBuf.u32Size	       = psMBuf->u32Size;

    s32Ret = HI_DRV_SMMU_Map(&stSMMUBuf);

    psMBuf->pu8StartVirAddr  = stSMMUBuf.pu8StartVirAddr;

    return s32Ret;
}

HI_VOID HI_DRV_OMXVDEC_Unmap(MMZ_BUFFER_S *psMBuf)
{
    SMMU_BUFFER_S stSMMUBuf;
    memset(&stSMMUBuf, 0, sizeof(stSMMUBuf));

    OMXVDEC_ASSERT_RETURN_NULL(psMBuf !=  HI_NULL, "invalid param");

    stSMMUBuf.pu8StartVirAddr  = psMBuf->pu8StartVirAddr;
    stSMMUBuf.u32StartSmmuAddr = psMBuf->u32StartPhyAddr;
    stSMMUBuf.u32Size	       = psMBuf->u32Size;

    HI_DRV_SMMU_Unmap(&stSMMUBuf);
}


HI_S32 HI_DRV_OMXVDEC_MapCache(MMZ_BUFFER_S *psMBuf)
{
    HI_S32 s32Ret = HI_SUCCESS;

    SMMU_BUFFER_S stSMMUBuf;

    stSMMUBuf.u32StartSmmuAddr = psMBuf->u32StartPhyAddr;
    stSMMUBuf.u32Size	       = psMBuf->u32Size;

    s32Ret = HI_DRV_SMMU_MapCache(&stSMMUBuf);

    psMBuf->pu8StartVirAddr  = stSMMUBuf.pu8StartVirAddr;
    psMBuf->u32StartPhyAddr  = stSMMUBuf.u32StartSmmuAddr;
    psMBuf->u32Size	     = stSMMUBuf.u32Size;

    return s32Ret;
}

/*********************************** for SMMU end ************************************/
