/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __DRV_TZSMMU_H
#define __DRV_TZSMMU_H

typedef struct TEE_MEM_BUFFER_S
{
	struct sg_table *table;
	u32 u32Size;
}TEE_MEM_BUFFER_S;

struct tz_pageinfo {
	u32 phys_addr;
	u32 npages;
};

/*
 * sec_smmu: sec smmu address
 * phys_addr: phys of the mem
 * normal_smmu: no sec smmu address
 * total_size: the whole size of mem
 * pageinfoaddr: the buf phys of the mem info
 */
typedef struct tz_memblocks {
        u32 sec_smmu;
        u32 phys_addr;
	u32 normal_smmu;
        u32 total_size;
        u32 pageinfoaddr;
} TEE_MEMBLOCKS;

/*
 * phys_buf: phys addree of buffer,in which smmu mem is stored
 * list: list of buffer
 */
typedef struct tee_mem{
	u32 phys_buf;
	struct list_head list;
}TEE_MEM_LIST;

static inline u32 hisi_get_tee_meminfo(u32 sec_addr, int flag)
{
	return 0;
}

static inline u32 hisi_tee_smmumem_into_ta(TEE_MEM_BUFFER_S *teebuf,
						u32 addr, int iommu)
{
	return 0;
}

static inline void hisi_tee_smmumem_outfrom_ta(u32 buf_phys)
{
	return;
}

static inline int hisi_teesmmu_init(void)
{
	return 0;
}

static inline void hisi_teesmmu_exit(void) {}

static inline int hisi_secmem_alloc(TEE_MEM_BUFFER_S *teebuf, u32 addr,
						int iommu, u32 *sec_smmu)
{
	return 0;
}

static inline int hisi_secmem_free(u32 sec_addr, int flag)
{
	return 0;
}

static inline int hisi_secmem_mapto_secsmmu(TEE_MEM_BUFFER_S *teebuf, u32 addr, int iommu, u32 *sec_smmu)
{
	return 0;
}

static inline int hisi_secmem_unmap_from_secsmmu(u32 sec_smmu)
{
	return 0;
}

static inline int hisi_secmem_agent_end(void)
{
	return 0;
}

static inline void hisi_sec_mem_proc(void)
{
	return;
}

#endif
