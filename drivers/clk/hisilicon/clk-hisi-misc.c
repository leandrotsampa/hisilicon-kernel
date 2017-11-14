/*
 * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
 *
 * Authors: Jianguo Sun <sunjianguo1@huawei.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * Simple HiSilicon phase clock implementation.
 */

#include <linux/err.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>

#include "clk.h"

struct hisi_clk_misc {
	struct clk_hw	hw;
	u32		id;
	void __iomem	*reg_addr;
	u32		ctrl_rst_mask;
	u32		ctrl_clk_mask;
};

#define to_clk_misc(_hw) container_of(_hw, struct hisi_clk_misc, hw)

static int clk_misc_enable(struct clk_hw *hw)
{
	struct hisi_clk_misc *clk = to_clk_misc(hw);
	u32 reg;

	reg = readl(clk->reg_addr);

	if (clk->ctrl_clk_mask)
		reg |= clk->ctrl_clk_mask;

	if (clk->ctrl_rst_mask)
		reg &= ~(clk->ctrl_rst_mask);

	writel(reg, clk->reg_addr);

	return 0;
}

static void clk_misc_disable(struct clk_hw *hw)
{
	struct hisi_clk_misc *clk = to_clk_misc(hw);
	u32 reg;

	reg = readl(clk->reg_addr);

	if (clk->ctrl_rst_mask)
		reg |= clk->ctrl_rst_mask;

	if (clk->ctrl_clk_mask)
		reg &= ~(clk->ctrl_clk_mask);

	writel(reg, clk->reg_addr);
}

static const struct clk_ops clk_misc_ops = {
	.enable = clk_misc_enable,
	.disable = clk_misc_disable,
};

struct clk *clk_register_hisi_misc(struct device *dev,
					const struct hisi_misc_clock *clock,
					void __iomem *base)
{
	struct hisi_clk_misc *clk_misc;
	struct clk_init_data init;
	struct clk *clk;

	clk_misc = kzalloc(sizeof(*clk_misc), GFP_KERNEL);
	if (!clk_misc)
		return ERR_PTR(-ENOMEM);

	init.name = clock->name;
	init.ops = &clk_misc_ops;
	init.parent_names = clock->parent_name ? &clock->parent_name : NULL;
	init.num_parents = clock->parent_name ? 1 : 0;
	init.flags = clock->flags;

	clk_misc->reg_addr = base + clock->reg_offset;
	clk_misc->ctrl_rst_mask = clock->ctrl_rst_mask;
	clk_misc->ctrl_clk_mask = clock->ctrl_clk_mask;
	clk_misc->hw.init = &init;

	clk = clk_register(dev, &clk_misc->hw);
	if (IS_ERR(clk))
		kfree(clk_misc);

	return clk;
}
EXPORT_SYMBOL_GPL(clk_register_hisi_misc);

void clk_unregister_hisi_misc(struct clk *clk)
{
	struct clk_hw *hw;

	hw = __clk_get_hw(clk);

	if (!hw)
		return;

	clk_unregister(clk);
	kfree(to_clk_misc(hw));
}
EXPORT_SYMBOL_GPL(clk_unregister_hisi_misc);
