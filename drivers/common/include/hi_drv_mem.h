/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_drv_mem.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2006/05/17
  Description	:
  History	:
  1.Date	: 2006/05/17
    Author	: g45345
    Modification: Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_DRV_MEM_H__
#define __HI_DRV_MEM_H__

#include "hi_type.h"
#include "hi_module.h"
#include "hi_debug.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/*Define Debug Level For MEM */
#define HI_FATAL_MEM(fmt...)	HI_FATAL_PRINT(HI_ID_MEM, fmt)
#define HI_ERR_MEM(fmt...)	HI_ERR_PRINT(HI_ID_MEM, fmt)
#define HI_WARN_MEM(fmt...)	HI_WARN_PRINT(HI_ID_MEM, fmt)
#define HI_INFO_MEM(fmt...)	HI_INFO_PRINT(HI_ID_MEM, fmt)

/*MPI error code*/
#define HI_ERR_MEM_OPEN_FAILED		  HI_DEF_ERR(HI_ID_MEM, HI_LOG_LEVEL_ERROR, 41)
#define HI_ERR_MEM_CLOSE_FAILED		  HI_DEF_ERR(HI_ID_MEM, HI_LOG_LEVEL_ERROR, 42)
#define HI_ERR_MEM_INVALID_PARA		  HI_DEF_ERR(HI_ID_MEM, HI_LOG_LEVEL_ERROR, 43)
#define HI_ERR_MEM_MALLOC_FAILED	  HI_DEF_ERR(HI_ID_MEM, HI_LOG_LEVEL_ERROR, 44)
#define HI_ERR_MEM_NOT_OPEN		  HI_DEF_ERR(HI_ID_MEM, HI_LOG_LEVEL_ERROR, 45)

#ifdef __KERNEL__

#include <linux/slab.h>
#include <linux/vmalloc.h>

#define HI_KZALLOC(module_id, size, flags)	kzalloc(size, flags)
#define HI_KMALLOC(module_id, size, flags)	kmalloc(size, flags)
#define HI_KFREE(module_id, addr)		kfree(addr)
#define HI_VMALLOC(module_id, size)		vmalloc(size)
#define HI_VFREE(module_id, addr)		vfree(addr)

HI_VOID*    hi_kzalloc(HI_U32 module_id, HI_U32 size, HI_S32 flags);
HI_VOID*    hi_kmalloc(HI_U32 module_id, HI_U32 size, HI_S32 flags);
HI_VOID	    hi_kfree(HI_U32 module_id, HI_VOID *ptr);

HI_VOID*    hi_vmalloc(HI_U32 module_id, HI_U32 size);
HI_VOID	    hi_vfree(HI_U32 module_id, HI_VOID *ptr);
#endif

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* End of #ifndef __HI_DRV_MEM_H__ */
