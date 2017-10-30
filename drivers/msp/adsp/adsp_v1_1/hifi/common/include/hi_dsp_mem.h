/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DSP_MEM_H__
#define __HI_DSP_MEM_H__

#include "hi_type.h"
#include "hi_dsp_common.h"

/**
@brief malloc the pointed size from system heap.
@attention None
@param[in] u32ModuleID The module ID, who need to request memory.
@param[in] u32Size The size of requesting.
@param[out] None
@retval ::Valid memory address Success
@retval ::NULL Failure
@see \n
N/A
*/
HI_VOID* HI_ADSP_MALLOC(HI_U32 u32ModuleID, HI_U32 u32Size);


/**
@brief Free the requsted memory by hi_malloc.
@attention when stopping to use the memory, calling this interface.
@param[in] u32ModuleID The module ID, who need to free memory.
@param[in] pMemAddr The memory address to free
@param[out] None
@retval ::None
@see \n
N/A
*/
HI_VOID HI_ADSP_FREE(HI_U32 u32ModuleID, HI_VOID* pMemAddr);

/**
@brief malloc the pointed size from system heap, start addr align to iAlignToBytes.
@attention None
@param[in] u32ModuleID The module ID, who need to request memory.
@param[in] u32Size The size of requesting.
@param[out] None
@retval ::Valid memory address Success
@retval ::NULL Failure
@see \n
N/A
*/
HI_VOID* HI_ADSP_MALLOC_Aligned(HI_U32 u32ModuleID, HI_U32 u32Size, HI_U32 iAlignToBytes);
/**
@brief Free the requsted memory by HI_ADSP_MALLOC_Aligned.
@attention when stopping to use the memory, calling this interface.
@param[in] u32ModuleID The module ID, who need to free memory.
@param[in] pMemAddr The memory address to free
@param[out] None
@retval ::None
@see \n
N/A
*/
HI_VOID HI_ADSP_FREE_Aligned(HI_U32 u32ModuleID, HI_VOID* pMemAddr);

/**
@brief malloc the pointed size from system heap, start addr align to iAlignToBytes.
@attention None
@param[in] u32ModuleID The module ID, who need to request memory.
@param[in] u32Size The size of requesting.
@param[out] None
@retval ::Valid memory address Success
@retval ::NULL Failure
@see \n
N/A
*/
HI_VOID* HI_ADSP_VMALLOC_Aligned(HI_U32 u32ModuleID, HI_U32 u32Size, HI_U32 iAlignToBytes);

/**
@brief Free the requsted memory by HI_VMALLOC_Aligned.
@attention when stopping to use the memory, calling this interface.
@param[in] u32ModuleID The module ID, who need to free memory.
@param[in] pMemAddr The memory address to free
@param[out] None
@retval ::None
@see \n
N/A
*/
HI_VOID HI_ADSP_VFREE_Aligned(HI_U32 u32ModuleID, HI_VOID* pMemAddr);

#endif
/** @} */
