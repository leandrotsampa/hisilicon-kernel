/******************************************************************************
 * Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.6.10
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/kernel.h>
#include <linux/string.h>
#include "setup.h"

static char sdkver_boot[64] = "0.0.0.0";

static int __init parse_sdkver(const struct tag *tag, void *fdt)
{
	memcpy(sdkver_boot, &tag->u, sizeof(sdkver_boot));

	sdkver_boot[sizeof(sdkver_boot)-1] = '\0';

	return 0;
}
struct tagtable tag_sdkver __initdata = {0x726d6d75, parse_sdkver};
/*****************************************************************************/

const char *get_sdkversion(void)
{
	return sdkver_boot;
}
EXPORT_SYMBOL(get_sdkversion);
