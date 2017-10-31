/******************************************************************************
 * Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.6.10
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#define DRVNAME "tag-emmc"
#define pr_fmt(fmt) DRVNAME ": " fmt

#include <linux/kernel.h>
#include <linux/libfdt.h>
#include "setup.h"

#define TAG_EMMC_PARAM 0x48694E7b

u32 emmc_boot_tuning_phase = 3;

#define HS200_MODE  (0x1<<8)
#define HS400_MODE  (0x2<<8)

static int __init parse_emmc_param(const struct tag *tag, void *fdt)
{
	int err;
	int node;
	u32 offline;
	u32 cap2;

	offline = *((u32 *)(&tag->u)); /* disabled okay */

	if (offline) {
		node = fdt_path_offset(fdt, "emmc");
		if (node >= 0) {
			err = fdt_setprop_string(fdt, node, "status", "disabled");
			if (err)
				pr_err("set prop emmc status fail.\n");
		}
		pr_info("emmc is not scaned!\n");
	}

	emmc_boot_tuning_phase = (*(((u32 *)(&tag->u)) + 1)) & 0xff;
	cap2 = (*(((u32 *)(&tag->u)) + 1)) & 0xff00;

	if (cap2 & HS200_MODE) {
		node = fdt_path_offset(fdt, "emmc");
		if (node >= 0) {
			err = fdt_setprop_cell(fdt, node, "caps2", 0x0020);
			if (err)
				pr_err("set prop emmc caps2 fail.\n");
		}
	}

	if (cap2 & HS400_MODE) {
		node = fdt_path_offset(fdt, "emmc");
		if (node >= 0) {
			err = fdt_setprop_cell(fdt, node, "caps2", 0x8020);
			if (err)
				pr_err("set prop emmc caps2 fail.\n");
		}
	}

	return 0;
}

/*****************************************************************************/
struct tagtable tag_emmc __initdata = {TAG_EMMC_PARAM, parse_emmc_param};
/*****************************************************************************/
