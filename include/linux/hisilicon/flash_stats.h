/******************************************************************************
 * Copyright (C) 2015 Cai Zhiyong
 * Create By Cai Zhiying 2015.8.10
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef FLASH_STATS_H
#define FLASH_STATS_H

/******************************************************************************/

struct flash_stats {
	void (*erase)(struct flash_stats *stats, u64 addr, u64 len);
	void (*read)(struct flash_stats *stats, u64 addr, u64 len, u8 *ecc);
	void (*write)(struct flash_stats *stats, u64 addr, u64 len);
	void (*read_retry)(struct flash_stats *stats, u64 addr, int index);
};

struct flash_stats *flash_stats_create(char *name, int pagesize, int blocksize,
	u64 totalsize, int nr_ecc_sect, int read_retries);

void flash_stats_destory(struct flash_stats *stats);

/******************************************************************************/

#endif /* FLASH_STATS_H */
