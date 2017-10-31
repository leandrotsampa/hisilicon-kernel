/******************************************************************************
 *    Copyright (C) 2014 Hisilicon STB Development Dept
 *    All rights reserved.
 *    Create by Cai Zhiyong
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/export.h>
#include <linux/kernel.h>
#include <linux/stddef.h>
#include <linux/string.h>
#include <linux/hisilicon/himisc.h>

/*
 * name         param name
 * buf          param buffer pointer;
 * buflen       param length;
 *
 * return       -1:    not found this param;
 *              -2:    input parameter bad;
 *              other: parameter real length;
 */
int get_param_data(const char *name, char *buf, unsigned int buflen)
{
	char *data;
	int len = 0;

	if (!buf) {
		pr_err("%s: bad parameter.\n", __FILE__);
		return -2;
	}

	len = find_param_tag(name, &data);
	if (len < 0)
		return len;

	if (len > buflen) {
		pr_err("%s: buffer too smaller\n", __FILE__);
		return -2;
	}

	memcpy(buf, data, len);
	return len;
}
EXPORT_SYMBOL(get_param_data);

/*
 * name         param name
 * buf          param buffer pointer;
 * buflen       param length;
 *
 * return       -1:    not found this param;
 *              -2:    input parameter bad;
 *              other: parameter real length;
 */
int set_param_data(const char *name, char *buf, unsigned int buflen)
{
	char *data;
	int len = 0;

	if (!buf) {
		pr_err("%s: bad parameter.\n", __FILE__);
		return -2;
	}

	len = find_param_tag(name,&data);
	if (len < 0)
		return len;

	len = min_t(int, len, buflen);
	memcpy(data, buf, len);

	return len;
}
EXPORT_SYMBOL(set_param_data);
