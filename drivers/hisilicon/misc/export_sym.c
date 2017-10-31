/******************************************************************************
 *    Copyright (C) 2014 Hisilicon STB Development Dept
 *    All rights reserved.
 *    Create by Cai Zhiyong
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/init.h>
#include <linux/kernel.h>
#include <asm/cacheflush.h>
#include <linux/interrupt.h>

EXPORT_SYMBOL(saved_command_line);
#ifdef CONFIG_ARM64
EXPORT_SYMBOL(__flush_dcache_area);
#endif

#if defined(CONFIG_SMP)
EXPORT_SYMBOL(__irq_set_affinity);
#endif

#ifdef CONFIG_GPIOLIB
extern struct spinlock gpio_lock;
extern struct list_head gpio_chips;

EXPORT_SYMBOL(gpio_lock);
EXPORT_SYMBOL(gpio_chips);
#endif

char *audio_options_string = NULL;
static int __init audio_options_setup(char *s)
{
	audio_options_string = s;
	return 1;
}
__setup("audio=", audio_options_setup);
EXPORT_SYMBOL(audio_options_string);

char *pq_options_string = NULL;
static int __init pq_options_setup(char *s)
{
	pq_options_string = s;
	return 1;
}
__setup("pq=", pq_options_setup);
EXPORT_SYMBOL(pq_options_string);

char *disp_options_string = NULL;
static int __init  disp_options_setup(char *s)
{
	disp_options_string = s;
	return 1;
}
__setup("disp=", disp_options_setup);
EXPORT_SYMBOL(disp_options_string);

static bool dongle = false;
static int __init dongle_options_setup(char *s)
{
	dongle = true;
	return 0;
}
early_param("dongle", dongle_options_setup);

bool is_dongle(void)
{
	return dongle;
}
EXPORT_SYMBOL(is_dongle);
