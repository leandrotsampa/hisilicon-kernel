/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	 : hi_gfx_comm_k.h
Version		   : version 1.0
Author		  :
Created		   : 2016/02/02
Description	   : Describes adp file. CNcomment:������ƽ̨���� CNend\n
Function List	  :

History		  :
Date		    Author		  Modification
2016/02/02	      y00181162
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 _HI_GFX_COMM_K_H_
#define	 _HI_GFX_COMM_K_H_

/***************************** SDK Version Macro Definition *********************/

/** \addtogroup	    GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */


/** @} */    /*! <!-- Macro Definition end */


/*********************************add include here******************************/
#include "hi_type.h"

#include <linux/version.h>

#include "hi_drv_module.h"

#include "hi_drv_dev.h"

#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"
#include "hi_drv_proc.h"
#include "hi_drv_sys.h"
#include "hi_gfx_smmu.h"

/***************************** Macro Definition ******************************/

/** \addtogroup	    GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */

/** pm disable */
/** CNcomment:pmʹ�� CNend */
//#define  CONFIG_GFX_COMM_PM_DISABLE


/** register mammap operate */
/** CNcomment:�Ĵ���ӳ����� CNend */
#define HI_GFX_REG_MAP(base, size)			 ioremap_nocache((base), (size))
/** register unmap operate */
/** CNcomment:�Ĵ�����ӳ����� CNend */
#define HI_GFX_REG_UNMAP(base)				    iounmap((HI_VOID*)(base))


#define GFX_MMZ_ALIGN_BYTES	16


#define SEQ_Printf					  PROC_PRINT
#define GFX_Printk				  HI_PRINT


/** the mutex init */
/** CNcomment:�ź�����ʼ�� CNend */
#define HI_GFX_INIT_MUTEX(x)				  sema_init(x, 1)
#define HI_GFX_DECLARE_MUTEX(x)			       DEFINE_SEMAPHORE(x)

#define ConvertID(module_id) (module_id + HI_ID_TDE - HIGFX_TDE_ID)

#define HI_GFX_COMM_LOG_FATAL(module_id, fmt...)   HI_FATAL_PRINT(ConvertID(module_id), fmt)
#define HI_GFX_COMM_LOG_ERROR(module_id,fmt...)	   HI_ERR_PRINT(ConvertID(module_id), fmt)
#define HI_GFX_COMM_LOG_WARNING(module_id,fmt...)  HI_WARN_PRINT(ConvertID(module_id), fmt)
#define HI_GFX_COMM_LOG_INFO(module_id,fmt...)	   HI_INFO_PRINT(ConvertID(module_id), fmt)

#ifndef CONFIG_GFX_COMM_PM_DISABLE
#ifdef CONFIG_COMPAT
	#define DECLARE_GFX_NODE(gfx_name,gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume) \
	static struct file_operations gfx_fops =\
	{\
	    .owner	    = THIS_MODULE,	\
	    .unlocked_ioctl = gfx_ioctl,	\
	    .compat_ioctl   = gfx_compat_ioctl, \
	    .open	    = gfx_open,		\
	    .release	    = gfx_release,	\
	    .mmap	     = gfx_mmap		 \
	};\
	static PM_BASEOPS_S gfx_drvops = \
	{\
	    .suspend	  = gfx_suspend, \
	    .resume	  = gfx_resume	 \
	};\
	static PM_DEVICE_S gfx_dev = \
	{\
	    .name     = gfx_name,	       \
	    .minor    = HIMEDIA_DYNAMIC_MINOR, \
	    .owner    = THIS_MODULE,	       \
	    .app_ops  = &gfx_fops,	       \
	    .base_ops = &gfx_drvops	       \
	}
#else
	#define DECLARE_GFX_NODE(gfx_name,gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume) \
	static struct file_operations gfx_fops =\
	{\
	    .owner	    = THIS_MODULE,	\
	    .unlocked_ioctl = gfx_ioctl,	\
	    .open	    = gfx_open,		\
	    .release	    = gfx_release,	\
	    .mmap	     = gfx_mmap		 \
	};\
	static PM_BASEOPS_S gfx_drvops = \
	{\
	    .suspend	  = gfx_suspend,\
	    .resume	  = gfx_resume	\
	};\
	static PM_DEVICE_S gfx_dev = \
	{\
	    .name     = gfx_name,	      \
	    .minor    = HIMEDIA_DYNAMIC_MINOR,\
	    .owner    = THIS_MODULE,	      \
	    .app_ops  = &gfx_fops,	      \
	    .base_ops = &gfx_drvops	      \
	}
#endif    /*CONFIG_COMPAT*/
#else
	#define DECLARE_GFX_NODE(gfx_name, gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume)  \
	static struct file_operations gfx_fops =\
	{\
	    .owner	    = THIS_MODULE,	\
	    .unlocked_ioctl = gfx_ioctl,	\
	    .open	    = gfx_open,		\
	    .release	    = gfx_release,	\
	    .mmap	     = gfx_mmap		 \
	};\
	static PM_BASEOPS_S gfx_drvops = \
	{\
	    .suspend	  = gfx_suspend,\
	    .resume	  = gfx_resume	\
	};\
	static PM_DEVICE_S gfx_dev = \
	{\
	    .name    = gfx_name,	     \
	    .minor   = HIMEDIA_DYNAMIC_MINOR,\
	    .owner   = THIS_MODULE,	     \
	    .app_ops = &gfx_fops	     \
	}
 #endif  /*CONFIG_GFX_COMM_PM_DISABLE*/

typedef struct tagGFXMMZBUFFER_S{
	HI_U8  *pu8StartVirAddr;
	HI_U32	u32StartSmmuAddr;
	HI_U32	u32StartPhyAddr;
	HI_U32	u32Size;
	HI_BOOL bSmmu;
}GFX_MMZ_BUFFER_S;


/** @} */    /*! <!-- Macro Definition end */


/*************************** Enum Definition ****************************/

/** \addtogroup	     GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */


/** enum of the chip type */
/** CNcomment:оƬ����ö�� CNend */
typedef enum tagHIGFX_CHIP_TYPE_E
{
    HIGFX_CHIP_TYPE_HI3716MV100 = 0,   /**< HI3716MV100 */
    HIGFX_CHIP_TYPE_HI3716MV200,       /**< HI3716MV200 */
    HIGFX_CHIP_TYPE_HI3716MV300,       /**< HI3716MV300 */
    HIGFX_CHIP_TYPE_HI3716H,	       /**< HI3716H	*/
    HIGFX_CHIP_TYPE_HI3716CV100,       /**< HI3716C	*/

    HIGFX_CHIP_TYPE_HI3720,	       /**< HI3720	 */
    HIGFX_CHIP_TYPE_HI3712V300,	       /**< X6V300	 */
    HIGFX_CHIP_TYPE_HI3715,	       /**< HI3715	 */

    HIGFX_CHIP_TYPE_HI3716CV200ES,     /**< S40V200	 */
    HIGFX_CHIP_TYPE_HI3716CV200,       /**< HI3716CV200	 */
    HIGFX_CHIP_TYPE_HI3719MV100,       /**< HI3719MV100	 */
    HIGFX_CHIP_TYPE_HI3718CV100,	/**<HI3718CV100 */
    HIGFX_CHIP_TYPE_HI3719CV100,	/**<HI3719CV100 */
    HIGFX_CHIP_TYPE_HI3719MV100_A,	/**<HI3719MV100_A */
    HIGFX_CHIP_TYPE_HI3716MV400,     /*< HI3716MV400*/

    HIGFX_CHIP_TYPE_HI3531	= 100, /**< HI3531	 */
    HIGFX_CHIP_TYPE_HI3521,	       /**< HI3521	 */
    HIGFX_CHIP_TYPE_HI3518,	       /**< HI3518	 */
    HIGFX_CHIP_TYPE_HI3520A,	       /**< HI3520A	 */
    HIGFX_CHIP_TYPE_HI3520D,	       /**< HI3520D	 */
    HIGFX_CHIP_TYPE_HI3535,	       /**< HI3535	 */

    HIGFX_CHIP_TYPE_BUTT	= 400  /**< Invalid Chip */

}HIGFX_CHIP_TYPE_E;


/** enum of the module ID */
/** CNcomment:ÿ��ģ���ID�� CNend */
typedef enum tagHIGFX_MODE_ID_E
{

    HIGFX_TDE_ID      = 0,    /**< TDE ID	  */
    HIGFX_JPGDEC_ID,	      /**< JPEG DECODE ID */
    HIGFX_JPGENC_ID,	      /**< JPEG_ENCODE ID */
    HIGFX_FB_ID,	      /**<  FRAMEBUFFER ID */
    HIGFX_PNG_ID,	      /**< PNG ID	   */
    HIGFX_HIGO_ID,
    HIGFX_GFX2D_ID,
    HIGFX_BUTT_ID,

}HIGFX_MODE_ID_E;


/** @} */  /*! <!-- enum Definition end */

/*************************** Structure Definition ****************************/


/** \addtogroup	     GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */


/** Structure of proc item */
/** CNcomment:proc��غ������� CNend */
typedef struct struGFX_PROC_ITEM
{
    HI_S32 (*fnRead)(struct seq_file *, HI_VOID *);
    HI_S32 (*fnWrite)(struct file * file,  const char __user * buf, size_t count, loff_t *ppos);
    HI_S32 (*fnIoctl)(struct seq_file *, HI_U32 cmd, HI_U32 arg);
}GFX_PROC_ITEM_S;


/** @} */  /*! <!-- Structure Definition end */


/********************** Global Variable declaration **************************/

extern unsigned long long sched_clock(void);

/******************************* API declaration *****************************/

/** \addtogroup	     GFX COMM */
/** @{ */  /** <!-- ��GFX COMM�� */


/***************************************************************************
* func		: HI_GFX_SetIrq
* description	: set irq to cpu
		  CNcomment: ���жϺŰ󶨵���Ӧ��CPU�� CNend\n
* param[in]	: u32ModId   CNcomment: ģ��ID CNend\n
* param[in]	: u32IrqNum  CNcomment: �жϺ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_SetIrq(HI_U32 u32ModId, HI_U32 u32IrqNum, const HI_CHAR* pIrqName)
{
    HI_S32 s32Ret = HI_SUCCESS;
    s32Ret = HI_DRV_SYS_SetIrqAffinity(ConvertID(u32ModId), u32IrqNum, pIrqName);
    if(HI_SUCCESS != s32Ret){
	return HI_FAILURE;
    }
    return HI_SUCCESS;
}

/***************************************************************************
* func		: HI_GFX_GetTimeStamp
* description	: get time function.
		  CNcomment:��ȡʱ�亯�� CNend\n
* param[out]	: pu32TimeMs  CNcomment: ��ȡms CNend\n
* param[out]	: pu32TimeUs  CNcomment: ��ȡus CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_GetTimeStamp(HI_U32 *pu32TimeMs, HI_U32 *pu32TimeUs)
{
    HI_U64 u64TimeNow;

    if(HI_NULL == pu32TimeMs)
    {
	return HI_FAILURE;
    }

    u64TimeNow = sched_clock();

    do_div(u64TimeNow, (HI_U64)1000000);

    *pu32TimeMs = (HI_U32)u64TimeNow;

    return HI_SUCCESS;
}


/***************************************************************************
* func		: HI_GFX_LOG_Display
* description	: display buffer information
* retval	:
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_LOG_Display(HI_U32 u32ModuleId, HI_U32 u32Size, HI_VOID* pBuf, const HI_CHAR* pBufName, HI_BOOL bAlloc)
{

    UNUSED(u32ModuleId);
    UNUSED(u32Size);
    UNUSED(pBuf);
    UNUSED(pBufName);
    UNUSED(bAlloc);
    return;
}


/***************************************************************************
* func		: HI_GFX_KZALLOC
* description	: kzalloc buffer
* retval	: mem address
* others:	: NA
****************************************************************************/
static inline HI_VOID* HI_GFX_KZALLOC(HI_U32 u32ModuleId, HI_U32 u32Size, HI_S32 s32Flags)
{
    HI_VOID* pBuf = NULL;
    pBuf = HI_KZALLOC(ConvertID(u32ModuleId), u32Size, s32Flags);
    HI_GFX_LOG_Display(u32ModuleId,u32Size,pBuf,NULL,HI_TRUE);
    return pBuf;
}
/***************************************************************************
* func		: HI_GFX_KMALLOC
* description	: kmalloc buffer
* retval	: mem address
* others:	: NA
****************************************************************************/
static inline HI_VOID* HI_GFX_KMALLOC(HI_U32 u32ModuleId, HI_U32 u32Size, HI_S32 s32Flags)
{
    HI_VOID* pBuf = NULL;
    pBuf = HI_KMALLOC(ConvertID(u32ModuleId), u32Size, s32Flags);
    HI_GFX_LOG_Display(u32ModuleId,u32Size,pBuf,NULL,HI_TRUE);
    return pBuf;
}
/***************************************************************************
* func		: HI_GFX_VMALLOC
* description	: vmalloc buffer
* retval	: mem address
* others:	: NA
****************************************************************************/
static inline HI_VOID* HI_GFX_VMALLOC(HI_U32 u32ModuleId, HI_U32 u32Size)
{
    HI_VOID* pBuf = NULL;
    pBuf = HI_VMALLOC(ConvertID(u32ModuleId), u32Size);
    HI_GFX_LOG_Display(u32ModuleId,u32Size,pBuf,NULL,HI_TRUE);
    return pBuf;
}

/***************************************************************************
* func		: HI_GFX_KFREE
* description	: free buffer
* retval	: NA
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_KFREE(HI_U32 u32ModuleId, HI_VOID* pBuf)
{
    if(NULL == pBuf){
	return;
    }
    HI_GFX_LOG_Display(u32ModuleId,0,pBuf,NULL,HI_FALSE);
    HI_KFREE(ConvertID(u32ModuleId), pBuf);
    return;
}

/***************************************************************************
* func		: HI_GFX_VFREE
* description	: vfree buffer
* retval	: NA
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_VFREE(HI_U32 u32ModuleId, HI_VOID* pBuf)
{
    HI_GFX_LOG_Display(u32ModuleId,0,pBuf,NULL,HI_FALSE);
    HI_VFREE(ConvertID(u32ModuleId), pBuf);
    return;
}

/***************************************************************************
* func		: HI_GFX_FreeMem
* description	: free the mem that has alloced
		  CNcomment: �ͷŷ�������ڴ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_FreeMem(HI_U32 u32Phyaddr, HI_BOOL bMmu)
{

	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

	HI_GFX_LOG_Display(HIGFX_BUTT_ID,0,(HI_VOID*)(unsigned long)u32Phyaddr,NULL,HI_FALSE);

#ifdef CONFIG_GFX_MMU_SUPPORT
	if(bMmu){
	    stSMMUBuffer.u32StartSmmuAddr = u32Phyaddr;
	    HI_DRV_SMMU_Release(&stSMMUBuffer);
	}
	else
#endif
	{
	    stMMZBuffer.u32StartPhyAddr	 = u32Phyaddr;
	    HI_DRV_MMZ_Release(&stMMZBuffer);
	}
	return;

}

/***************************************************************************
* func		: HI_GFX_AllocMem
* description	: alloc the mem that need
		  CNcomment: ������Ҫ���ڴ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_U32 HI_GFX_AllocMem(HI_CHAR *pName, HI_CHAR* pZoneName, HI_U32 u32LayerSize, HI_BOOL *pbMmu)
{

	HI_S32 s32Ret = HI_SUCCESS;
	HI_U32 addr   = 0;

	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

	UNUSED(pZoneName);/** deal with warning **/
	*pbMmu = HI_FALSE;

	if ((u32LayerSize == 0) || (u32LayerSize > 0x40000000)){
	    return 0;
	}

#ifdef CONFIG_GFX_MMU_SUPPORT
	if( (NULL != pZoneName) && (0 == strncmp(pZoneName, "iommu", strlen("iommu"))) ){
	    s32Ret = HI_DRV_SMMU_Alloc(pName,u32LayerSize,GFX_MMZ_ALIGN_BYTES,&stSMMUBuffer);
	    *pbMmu = HI_TRUE;
	    addr = stSMMUBuffer.u32StartSmmuAddr;
	}
	else
#endif
	{
	   s32Ret = HI_DRV_MMZ_Alloc(pName, NULL,u32LayerSize,GFX_MMZ_ALIGN_BYTES,&stMMZBuffer);
	   *pbMmu = HI_FALSE;
	   addr	  = stMMZBuffer.u32StartPhyAddr;
	}

	if(HI_SUCCESS != s32Ret){
	    return 0;
	}

	HI_GFX_LOG_Display(HIGFX_BUTT_ID,u32LayerSize,(HI_VOID*)(unsigned long)addr,pName,HI_TRUE);

	return addr;

}

/***************************************************************************
* func		: HI_GFX_MapMmzToSmmu
* description	:
		  CNcomment: map mmz to smmu CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_U32 HI_GFX_MapMmzToSmmu(HI_U32 u32PhyAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    MMZ_BUFFER_S stsMBuf = {0};
    stsMBuf.u32StartPhyAddr = u32PhyAddr;
    return HI_DRV_MMZ_MapToSmmu(&stsMBuf);
#else
    return u32PhyAddr;
#endif
}

/***************************************************************************
* func		: HI_GFX_UnMapSmmu
* description	:
		  CNcomment: un map mmz to smmu CNend\n
* retval	: smmu mem
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_UnMapSmmu(HI_U32 u32SmmuAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stsMBuf = {0};
    stsMBuf.u32StartSmmuAddr = u32SmmuAddr;
    return HI_DRV_MMZ_UnmapFromSmmu(&stsMBuf);
#else
    return HI_SUCCESS;
#endif
}


/***************************************************************************
* func		: HI_GFX_Map
* description	:
		  CNcomment: ӳ�䲻��cache�������ڴ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID *HI_GFX_Map(HI_U32 u32PhyAddr,HI_U32 size, HI_BOOL bMmu)
{
	HI_S32 s32Ret	 = HI_SUCCESS;
	HI_U8* pu8VirDdr = NULL;

	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

#ifdef CONFIG_GFX_MMU_SUPPORT
	if(bMmu){
	    stSMMUBuffer.u32StartSmmuAddr = u32PhyAddr;
	    s32Ret = HI_DRV_SMMU_Map(&stSMMUBuffer);
	    pu8VirDdr = stSMMUBuffer.pu8StartVirAddr;
	}
	else
#endif
	{
	    stMMZBuffer.u32StartPhyAddr	 = u32PhyAddr;
	    s32Ret = HI_DRV_MMZ_Map(&stMMZBuffer);
	    pu8VirDdr = stMMZBuffer.pu8StartVirAddr;
	}

	if(HI_SUCCESS != s32Ret){
	    return NULL;
	}

	return ((unsigned char *)pu8VirDdr);

}

/***************************************************************************
* func		: HI_GFX_MapCached
* description	:
		  CNcomment: ӳ���cache�������ڴ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID *HI_GFX_MapCached(HI_U32 u32PhyAddr,HI_U32 size, HI_BOOL bMmu)
{
	HI_S32 s32Ret	 = HI_SUCCESS;
	HI_U8* pu8VirDdr = NULL;

	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

#ifdef CONFIG_GFX_MMU_SUPPORT
	if(bMmu){
	    stSMMUBuffer.u32StartSmmuAddr = u32PhyAddr;
	    s32Ret = HI_DRV_SMMU_MapCache(&stSMMUBuffer);
	    pu8VirDdr = stSMMUBuffer.pu8StartVirAddr;
	}
	else
#endif
	{
	    stMMZBuffer.u32StartPhyAddr	 = u32PhyAddr;
	    s32Ret = HI_DRV_MMZ_MapCache(&stMMZBuffer);
	    pu8VirDdr = stMMZBuffer.pu8StartVirAddr;
	}

	if(HI_SUCCESS != s32Ret){
	    return NULL;
	}

	return ((unsigned char *)pu8VirDdr);

}


#ifdef CONFIG_GFX_MMU_SUPPORT
extern struct sg_table *get_meminfo(u32 addr, u32 iommu, u32 *size);
/***************************************************************************
* func		: HI_GFX_MapToUser
* description	:
		  CNcomment: ���ں�̬���ڴ�ӳ�䵽�û�̬ʹ�� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_MapToUser(HI_U32 u32PhyAddr,struct vm_area_struct *vma)
{
    HI_U32 u32size = 0;
    HI_U32 u32Cnt  = 0;
    HI_U32 u32Len  = 0;
    HI_U32 pfn	   = 0;
    struct sg_table  *pTable = NULL;
    struct scatterlist *sg   = NULL;
    struct page *page	     = NULL;

    unsigned long addr = vma->vm_start;

    if(0 == u32PhyAddr){
	return HI_FAILURE;
    }

    pTable = get_meminfo(u32PhyAddr, 1, &u32size);
    if (!pTable) {
	return HI_FAILURE;
    }

    if(u32size != (vma->vm_end - vma->vm_start)){
	return -EINVAL;
    }

    for_each_sg(pTable->sgl, sg, pTable->nents, u32Cnt){
	page	= sg_page(sg);
	pfn	= page_to_pfn(page);
	u32Len	= PAGE_ALIGN(sg->length);
	remap_pfn_range(vma, addr, pfn, u32Len,vma->vm_page_prot);
	addr = addr + u32Len;
    }

    return HI_SUCCESS;

}
#endif

/***************************************************************************
* func		: HI_GFX_Flush
* description	:
		  CNcomment: ��ַ����ˢ�� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_Flush(GFX_MMZ_BUFFER_S *stFlushBuf, HI_BOOL bMmu)
{
    MMZ_BUFFER_S  stMMZBuffer  = {0};

#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
    if(bMmu){
	stSMMUBuffer.u32Size = stFlushBuf->u32Size;
	stSMMUBuffer.pu8StartVirAddr  = stFlushBuf->pu8StartVirAddr;
	stSMMUBuffer.u32StartSmmuAddr = stFlushBuf->u32StartSmmuAddr;
	(HI_VOID)HI_DRV_SMMU_Flush(&stSMMUBuffer);
    }else
#endif
    {
	stMMZBuffer.u32Size = stFlushBuf->u32Size;
	stMMZBuffer.pu8StartVirAddr = stFlushBuf->pu8StartVirAddr;
	stMMZBuffer.u32StartPhyAddr = stFlushBuf->u32StartPhyAddr;
	(HI_VOID)HI_DRV_MMZ_Flush(&stMMZBuffer);
    }
    return;
}


/***************************************************************************
* func		: HI_GFX_Unmap
* description	: un map phy ddr
		  CNcomment: ��ӳ��������ַ CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_Unmap(HI_VOID *pViraddr, HI_BOOL bMmu)
{

	MMZ_BUFFER_S  stMMZBuffer  = {0};

#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
	if(bMmu){
	    stSMMUBuffer.pu8StartVirAddr = (HI_U8*)pViraddr;
	    HI_DRV_SMMU_Unmap(&stSMMUBuffer);
	}else
#endif
	{
	    stMMZBuffer.pu8StartVirAddr = (HI_U8*)pViraddr;
	    HI_DRV_MMZ_Unmap(&stMMZBuffer);
	}
	return HI_SUCCESS;
}

/***************************************************************************
* func		: HI_GFX_AllocAndMap
* description	: alloc the mem that need
		  CNcomment: ������Ҫ���ڴ� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_AllocAndMap(const HI_CHAR *pName, HI_CHAR* pZoneName, HI_U32 u32LayerSize, HI_S32 s32Align, GFX_MMZ_BUFFER_S *pstBuf)
{
	HI_S32 s32Ret = HI_SUCCESS;

	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
	UNUSED(pZoneName);/** deal with warning **/

	if ((u32LayerSize == 0) || (u32LayerSize > 0x40000000)){
	    return 0;
	}

#ifdef CONFIG_GFX_MMU_SUPPORT
	if( (NULL != pZoneName) && (0 == strncmp(pZoneName, "iommu", strlen("iommu"))) ){
	    s32Ret = HI_DRV_SMMU_AllocAndMap(pName, u32LayerSize, s32Align, &stSMMUBuffer);
	    pstBuf->pu8StartVirAddr   = stSMMUBuffer.pu8StartVirAddr;
	    pstBuf->u32StartSmmuAddr  = stSMMUBuffer.u32StartSmmuAddr;
	    pstBuf->u32Size	      = stSMMUBuffer.u32Size;
	    pstBuf->bSmmu	      = HI_TRUE;
	    HI_GFX_LOG_Display(HIGFX_BUTT_ID,u32LayerSize,(HI_VOID*)(unsigned long)pstBuf->u32StartSmmuAddr,pName,HI_TRUE);
	}else
#endif
	{
	    s32Ret = HI_DRV_MMZ_AllocAndMap(pName, NULL, u32LayerSize, s32Align, &stMMZBuffer);
	    pstBuf->pu8StartVirAddr   = stMMZBuffer.pu8StartVirAddr;
	    pstBuf->u32StartPhyAddr   = stMMZBuffer.u32StartPhyAddr;
	    pstBuf->u32Size	      = stMMZBuffer.u32Size;
	    pstBuf->bSmmu	      = HI_FALSE;
	    HI_GFX_LOG_Display(HIGFX_BUTT_ID,u32LayerSize,(HI_VOID*)(unsigned long)pstBuf->u32StartPhyAddr,pName,HI_TRUE);
	}

	return s32Ret;

}

/***************************************************************************
* func		: HI_GFX_UnmapAndRelease
* description	: un map and release phy ddr
		  CNcomment: ��ӳ�䲢�ͷ�������ַ CNend\n
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_UnmapAndRelease(GFX_MMZ_BUFFER_S *pstBuf)
{
	MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
	SMMU_BUFFER_S stSMMUBuffer = {0};
	if(pstBuf->bSmmu){
	    stSMMUBuffer.pu8StartVirAddr  = pstBuf->pu8StartVirAddr;
	    stSMMUBuffer.u32StartSmmuAddr = pstBuf->u32StartSmmuAddr;
	    stSMMUBuffer.u32Size	  = pstBuf->u32Size;
	    HI_DRV_SMMU_UnmapAndRelease(&stSMMUBuffer);
	}
#endif
	{
	    stMMZBuffer.pu8StartVirAddr = pstBuf->pu8StartVirAddr;
	    stMMZBuffer.u32StartPhyAddr = pstBuf->u32StartPhyAddr;
	    stMMZBuffer.u32Size		= pstBuf->u32Size;
	    HI_DRV_MMZ_UnmapAndRelease(&stMMZBuffer);
	}
	return;
}


/***************************************************************************
* func		: HI_GFX_PROC_AddModule
* description	: register proc module
		  CNcomment: proc��Ϣע�� CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_PROC_AddModule(HI_CHAR * pEntry_name, GFX_PROC_ITEM_S* pProcItem, HI_VOID *pData)
{
	DRV_PROC_EX_S stProcItem;
	stProcItem.fnIoctl =  pProcItem->fnIoctl;
	stProcItem.fnRead = pProcItem->fnRead;
	stProcItem.fnWrite= pProcItem->fnWrite;
	HI_DRV_PROC_AddModule(pEntry_name, &stProcItem, pData);
    return 0;

}

/***************************************************************************
* func		: HI_GFX_PROC_RemoveModule
* description	: remove proc module
		  CNcomment: ɾ��ע�����proc CNend\n
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_PROC_RemoveModule(HI_CHAR *pEntry_name)
{
      HI_DRV_PROC_RemoveModule(pEntry_name);
}


/***************************************************************************
* func		: HI_GFX_MODULE_Register
* description	: ע��ģ��
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_MODULE_Register(HI_U32 u32ModuleID, const HI_CHAR * pszModuleName, HI_VOID *pData)
{
    return HI_DRV_MODULE_Register(ConvertID(u32ModuleID), pszModuleName, pData);
}

/***************************************************************************
* func		: HI_GFX_MODULE_UnRegister
* description	: ɾ��ģ��
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_S32 HI_GFX_MODULE_UnRegister(HI_U32 u32ModuleID)
{
    return HI_DRV_MODULE_UnRegister(ConvertID(u32ModuleID));
}

#define HI_GFX_PM_Register()	    HI_DRV_PM_Register(&gfx_dev);

#define HI_GFX_PM_UnRegister()	    HI_DRV_PM_UnRegister(&gfx_dev);


/***************************************************************************
* func		: HI_GFX_SYS_GetChipVersion
* description	: ��ȡоƬ����
* retval	: HI_SUCCESS �ɹ�
* retval	: HI_FAILURE ʧ��
* others:	: NA
****************************************************************************/
static inline HI_VOID HI_GFX_SYS_GetChipVersion(HIGFX_CHIP_TYPE_E *penChipType)
{
    HI_CHIP_TYPE_E    ChipType = HI_CHIP_TYPE_BUTT;
    HI_CHIP_VERSION_E ChipVersion = HI_CHIP_VERSION_BUTT;

    HI_DRV_SYS_GetChipVersion(&ChipType, &ChipVersion);

    if ((HI_CHIP_TYPE_HI3716M == ChipType) && (ChipVersion == HI_CHIP_VERSION_V100))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716MV100;
	return;
    }
    if ((HI_CHIP_TYPE_HI3716M == ChipType) && (ChipVersion == HI_CHIP_VERSION_V200))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716MV200;
	return;
    }
    if ((HI_CHIP_TYPE_HI3716M == ChipType) && (ChipVersion == HI_CHIP_VERSION_V300))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716MV300;
	return;
    }
    if (HI_CHIP_TYPE_HI3716H == ChipType)
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716H;
	return;
    }
    if ((HI_CHIP_TYPE_HI3716C == ChipType) && (ChipVersion == HI_CHIP_VERSION_V100))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716CV100;
	return;
    }
    if (HI_CHIP_TYPE_HI3720 == ChipType)
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3720;
	return;
    }
    if ((HI_CHIP_TYPE_HI3712 == ChipType) && (ChipVersion == HI_CHIP_VERSION_V300))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3712V300;
	return;
    }
    if (HI_CHIP_TYPE_HI3715 == ChipType)
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3715;
	return;
    }
    if ((HI_CHIP_TYPE_HI3716C == ChipType) && (ChipVersion == HI_CHIP_VERSION_V200))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3716CV200;
	return;
    }
    if ((HI_CHIP_TYPE_HI3718C == ChipType) && (ChipVersion == HI_CHIP_VERSION_V100))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3718CV100;
	return;
    }
    if ((HI_CHIP_TYPE_HI3719C == ChipType) && (ChipVersion == HI_CHIP_VERSION_V100))
    {
	*penChipType = HIGFX_CHIP_TYPE_HI3719CV100;
	return;
    }
    if ((HI_CHIP_TYPE_HI3716M == ChipType) && (ChipVersion == HI_CHIP_VERSION_V400))
    {
	 *penChipType = HIGFX_CHIP_TYPE_HI3716MV400;
	return;
    }
}

/** @} */  /*! <!-- API declaration end */

#endif /*_HI_GFX_COMM_K_H_ */
