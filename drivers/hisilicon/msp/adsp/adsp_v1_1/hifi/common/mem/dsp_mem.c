/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_type.h"
#include "hi_dsp_mem.h"
#include "hi_dsp_debug.h"

#include "adsp_osal_ext.h"

HI_VOID* HI_ADSP_MALLOC(HI_U32 u32ModuleID, HI_U32 u32Size)
{
    HI_VOID* pMemAddr = HI_NULL;

    pMemAddr = adsp_kmalloc(u32ModuleID, u32Size);

    return pMemAddr;
}

HI_VOID HI_ADSP_FREE(HI_U32 u32ModuleID, HI_VOID* pMemAddr)
{
    if (HI_NULL != pMemAddr)
    {
	adsp_kfree(u32ModuleID, pMemAddr);
    }
}

HI_VOID* HI_ADSP_V_MALLOC(HI_U32 u32ModuleID, HI_U32 u32Size)
{
    HI_VOID* pMemAddr = HI_NULL;

    pMemAddr = adsp_vmalloc(u32ModuleID, u32Size);

    return pMemAddr;
}

HI_VOID HI_ADSP_V_FREE(HI_U32 u32ModuleID, HI_VOID* pMemAddr)
{
    if (HI_NULL != pMemAddr)
    {
	adsp_vfree(u32ModuleID, pMemAddr);
    }
}

static HI_S32 MY_LOG2(HI_U32 i)
{
    // returns n where n = log2(2^n) = log2(2^(n+1)-1)
    HI_U32 iLog2 = 0;

    while ((i >> iLog2) > 1)
    {
	iLog2++;
    }

    return iLog2;
}

HI_VOID* HI_ADSP_MALLOC_Aligned(HI_U32 u32ModuleID, HI_U32 u32Size, HI_U32 iAlignToBytes)
{
#ifdef __aarch64__
    HI_U64 mask = -1;
#else
    HI_U32 mask = -1;					 //Initally set mask to 0xFFFFFFFF
#endif
    HI_U8 *retBuffer;
    HI_VOID *buffer;

    if (iAlignToBytes < 2)
    {
	return HI_NULL;
    }

    if (iAlignToBytes > 256)
    {
	HI_DSP_PRINT("iAlignToBytes(0x%x) should less than 256\n", iAlignToBytes);
	return HI_NULL;
    }

    mask <<= MY_LOG2(iAlignToBytes);			 //Generate mask to clear lsb's
    if (iAlignToBytes & (~mask))
    {
	HI_DSP_PRINT("iAlignToBytes(0x%x) should be power of 2\n", iAlignToBytes);
	return HI_NULL;
    }

    if (u32Size > iAlignToBytes)
    {
	if (u32Size % iAlignToBytes)
	{
	    HI_DSP_PRINT(" Size(0x%x) should align to(0x%x) \n", u32Size, iAlignToBytes);
	    return HI_NULL;
	}
    }

    buffer = HI_ADSP_MALLOC(u32ModuleID, u32Size + iAlignToBytes);	  //allocate buffer + alignment bytes
    if (buffer == HI_NULL)
    {
	HI_DSP_PRINT("malloc(0x%x) failed \n", u32Size + iAlignToBytes);
	return HI_NULL;
    }
#ifdef __aarch64__
    retBuffer = (HI_U8*)HI_NULL + (((HI_U64)((HI_U8*)buffer + iAlignToBytes - (HI_U8*)HI_NULL)) & mask);
#else
    retBuffer = (HI_U8*)HI_NULL + (((HI_U32)((HI_U8*)buffer + iAlignToBytes - (HI_U8*)HI_NULL)) & mask); //Generate aligned pointer
#endif
    ((HI_U8*)retBuffer)[-1] = (HI_U8)((HI_U8*)retBuffer - (HI_U8*)buffer); //Write offset to newPtr-1
    return (HI_VOID *)retBuffer;
}

HI_VOID HI_ADSP_FREE_Aligned(HI_U32 u32ModuleID, HI_VOID* pMemAddr)
{
    HI_U8* realBuffer = (HI_U8*)pMemAddr;
    HI_U8 bytesBack;

    if (realBuffer == HI_NULL)
    {
	return;
    }

    bytesBack	= ((HI_U8*)pMemAddr)[-1];    //Get offset to real pointer from -1 possition
    realBuffer -= bytesBack;	//Get original pointer address
    HI_ADSP_FREE(u32ModuleID, realBuffer);
}

//*****************************************************************************************
//
// allocates a buffer of size bytes aligned to iAlignToBytes bytes.
//
//*****************************************************************************************
HI_VOID* HI_ADSP_VMALLOC_Aligned(HI_U32 u32ModuleID, HI_U32 u32Size, HI_U32 iAlignToBytes)
{
#ifdef __aarch64__
    HI_U64 mask = -1;
#else
    HI_U32 mask = -1;					 //Initally set mask to 0xFFFFFFFF
#endif
    HI_U8 *retBuffer;
    HI_VOID *buffer;

    if (iAlignToBytes < 2)
    {
	return HI_NULL;
    }

    if (iAlignToBytes > 256)
    {
	HI_DSP_PRINT("iAlignToBytes(0x%x) should less than 256\n", iAlignToBytes);
	return HI_NULL;
    }

    mask <<= MY_LOG2(iAlignToBytes);			 //Generate mask to clear lsb's
    if (iAlignToBytes & (~mask))
    {
	HI_DSP_PRINT("iAlignToBytes(0x%x) should be power of 2\n", iAlignToBytes);
	return HI_NULL;
    }

    if (u32Size > iAlignToBytes)
    {
	if (u32Size % iAlignToBytes)
	{
	    HI_DSP_PRINT(" Size(0x%x) should align to(0x%x) \n", u32Size, iAlignToBytes);
	    return HI_NULL;
	}
    }

    buffer = HI_ADSP_V_MALLOC(u32ModuleID, u32Size + iAlignToBytes);	    //allocate buffer + alignment bytes
    if (buffer == HI_NULL)
    {
	HI_DSP_PRINT("vmalloc(0x%x) failed \n", u32Size + iAlignToBytes);
	return HI_NULL;
    }

#ifdef __aarch64__
    retBuffer = (HI_U8*)HI_NULL + (((HI_U64)((HI_U8*)buffer + iAlignToBytes - (HI_U8*)HI_NULL)) & mask);
#else
    retBuffer = (HI_U8*)HI_NULL + (((HI_U32)((HI_U8*)buffer + iAlignToBytes - (HI_U8*)HI_NULL)) & mask); //Generate aligned pointer
#endif
    ((HI_U8*)retBuffer)[-1] = (HI_U8)((HI_U8*)retBuffer - (HI_U8*)buffer); //Write offset to newPtr-1
    return (HI_VOID*)retBuffer;
}

HI_VOID HI_ADSP_VFREE_Aligned(HI_U32 u32ModuleID, HI_VOID* pMemAddr)
{
    HI_U8* realBuffer = (HI_U8*)pMemAddr;
    HI_U8 bytesBack;

    if (realBuffer == HI_NULL)
    {
	return;
    }

    bytesBack	= ((HI_U8*)pMemAddr)[-1];    //Get offset to real pointer from -1 possition
    realBuffer -= bytesBack;	//Get original pointer address
    HI_ADSP_V_FREE(u32ModuleID, realBuffer);
}
