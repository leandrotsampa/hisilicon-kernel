/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.5.27
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/kernel.h>
#include <linux/hisilicon/cputable.h>
#include <asm/io.h>
#include <asm/bug.h>

#define REG_BASE_SCTL                                   0xF8000000
#define REG_SC_SYSID0                                   0x0EE0
#define REG_BASE_PERI_CTRL                              0xF8A20000
#define REG_PERI_SOC_FUSE                               0x840

u64 cpu_chipid = 0ULL;

/******************************************************************************/
u64 get_chipid(u64 mask)
{
	u64 val = 0ULL;

	if (cpu_chipid == 0ULL) {
		void __iomem *soc_fuse;
		void __iomem *sysid;

		sysid = ioremap_nocache(REG_BASE_SCTL + REG_SC_SYSID0, PAGE_SIZE);
		if (NULL == sysid)
			BUG();

		soc_fuse = ioremap_nocache(REG_BASE_PERI_CTRL + REG_PERI_SOC_FUSE, PAGE_SIZE);
		if (NULL == soc_fuse)
			BUG();

		cpu_chipid = (u64)readl(sysid);

		val = (u64)readl(soc_fuse);

		cpu_chipid = ((val & (0x1F << 16)) << 16) | (cpu_chipid & 0xFFFFFFFF);
		iounmap(sysid);
		iounmap(soc_fuse);
	}

	return (mask == 0ULL) ? cpu_chipid : (cpu_chipid & mask);
}
EXPORT_SYMBOL(get_chipid);
