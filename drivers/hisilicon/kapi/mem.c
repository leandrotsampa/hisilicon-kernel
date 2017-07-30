/******************************************************************************
 * Copyright (C) 2014 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2014.1.26
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/module.h>
#include <linux/init.h>
#include <asm/page.h>
#include <asm/setup.h>
#include <linux/errno.h>
#include <linux/hikapi.h>
#include <linux/memblock.h>

u32 mmz_raw_size = 0;
extern u64 ddrsize;
/******************************************************************************/

int get_mem_size(unsigned int *size, int flags)
{
	int ret = 0;

	switch (flags) {
	case HIKAPI_GET_RAM_SIZE:
	{
		static unsigned int ramsize = 0;
		if (!ramsize)
			ramsize = (unsigned int)(ddrsize >> 20);
		if (size)
			*size = ramsize;
		break;
	}
	case HIKAPI_GET_CMA_SIZE:
	{
		static unsigned int cmasize = 0;
#ifdef CONFIG_CMA
		extern unsigned int get_cma_size(void);
		if (!cmasize)
			cmasize = get_cma_size();
#endif
		if (size)
			*size = cmasize;
		break;
	}
	case HIKAPI_GET_MMZ_SIZE:
	{
		if (size)
			*size = mmz_raw_size;
		break;
	}
	default:
		ret = -EINVAL;
		break;
	}
	return ret;
}
EXPORT_SYMBOL(get_mem_size);
