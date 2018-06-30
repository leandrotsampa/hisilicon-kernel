/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Copyright (C) 2012 ARM Limited
 */

#include <linux/jiffies.h>
#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/stat.h>
#include <linux/io.h>
#include <linux/module.h>

#include <asm/system_misc.h>
#include <linux/delay.h>

static void __iomem *wdg0_regbase;

static void hi3798cv2x_do_reset(enum reboot_mode reboot_mode)
{
	printk(KERN_INFO "CPU will restart.");

	mdelay(200);

	local_irq_disable();

	/* unclock wdg */
	writel(0x1ACCE551,  (wdg0_regbase + 0xc00));
	/* wdg load value */
	writel(0x00000100,  (wdg0_regbase + 0x0));
	/* bit0: int enable bit1: reboot enable */
	writel(0x00000003,  (wdg0_regbase + 0x8));

	while (1)
		;
}

static void hi3798cv2x_restart(enum reboot_mode reboot_mode, const char *cmd)
{
	hi3798cv2x_do_reset(reboot_mode);
}

static struct of_device_id hi3798cv2x_reset_of_match[] = {
	{
		.compatible = "arm,hi3798cv2x-reset",
	},
	{}
};
MODULE_DEVICE_TABLE(of, hi3798cv2x_reset_of_match);

static int hi3798cv2x_reset_probe(struct platform_device *pdev)
{
	struct resource *res;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	wdg0_regbase = devm_ioremap_resource(&pdev->dev, res);
	if (IS_ERR_OR_NULL(wdg0_regbase)) {
		pr_err("%s: wdg0_regbase ioremap fail.\n", __func__);
		return -EINVAL;
	}

	/* If a arm_pm_restart function has already been added, leave it alone */
	if (arm_pm_restart != NULL) {
		dev_err(&pdev->dev,
			"arm_pm_restart function already registered");
		return -EBUSY;
	}

	arm_pm_restart = &hi3798cv2x_restart;

	return 0;
}

static int hi3798cv2x_reset_remove(struct platform_device *pdev)
{
	if (arm_pm_restart == &hi3798cv2x_restart)
		arm_pm_restart = NULL;

	return 0;
}

static struct platform_driver hi3798cv2x_reset_driver = {
	.probe = hi3798cv2x_reset_probe,
	.remove = hi3798cv2x_reset_remove,
	.driver = {
		.name = "hi3798cv2x-reset",
		.owner = THIS_MODULE,
		.of_match_table = hi3798cv2x_reset_of_match,
	},
};

static int __init hi3798cv2x_reset_init(void)
{
	return platform_driver_register(&hi3798cv2x_reset_driver);
}
device_initcall(hi3798cv2x_reset_init);
