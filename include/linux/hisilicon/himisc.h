/******************************************************************************
 *    Copyright (C) 2014 Hisilicon STB Development Dept
 *    All rights reserved.
 *    Create by Cai Zhiyong
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HISI_MISC__
#define __HISI_MISC__

#include <uapi/linux/types.h>

#ifdef CONFIG_BLK_DEV_RAM
void initmrd_reserve_memory(void);
#else
static inline void initmrd_reserve_memory(void) {}
#endif

#ifdef CONFIG_BLK_DEV_LOOP
void initfile_reserve_memory(void);
#else
static inline void initfile_reserve_memory(void) {}
#endif

#ifdef CONFIG_PCIE_HISILICON
void pcie_reserve_memory(void);
#else
static inline void pcie_reserve_memory(void) {}
#endif

void pdm_reserve_mem(void);

struct match_t {
	int type;
	int reg;
	void *data;
};

#define MATCH_SET_TYPE_REG(_type, _reg)   {(_type), (_reg), (void *)0}
#define MATCH_SET_TYPE_DATA(_type, _data) {(_type), 0, (void *)(_data)}
#define MATCH_SET(_type, _reg, _data)     {(_type), (_reg), (void *)(_data)}

int match_reg_to_type(struct match_t *table, int nr_table, int reg, int def);

int match_type_to_reg(struct match_t *table, int nr_table, int type, int def);

int match_data_to_type(struct match_t *table, int nr_table, char *data, int size,
		       int def);

void *match_type_to_data(struct match_t *table, int nr_table, int type,
			 void *def);

int find_param_tag(const char *name, char **data);

int fdt_add_memory_reserve(u64 base, u64 size);

#endif /* __HISI_MISC__ */
