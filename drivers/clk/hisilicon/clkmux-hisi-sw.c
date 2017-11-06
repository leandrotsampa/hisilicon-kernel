/*
 * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#include <linux/clk-provider.h>
#include <linux/delay.h>
#include <linux/err.h>
#include <linux/io.h>
#include <linux/slab.h>

#include "clk.h"

#define SW_BEGIN_CFG		BIT(10)
#define SW_BEGIN_CFG_BYPASS	BIT(9)

struct clk_hisi_mux_sw {
	struct clk_mux mux;
	const struct clk_ops *ops;
};

static inline struct clk_hisi_mux_sw *to_clk_hisi_mux_sw(struct clk_hw *hw)
{
	struct clk_mux *mux = to_clk_mux(hw);

	return container_of(mux, struct clk_hisi_mux_sw, mux);
}

static u8 clk_hisi_mux_sw_get_parent(struct clk_hw *hw)
{
	struct clk_hisi_mux_sw *mux_sw = to_clk_hisi_mux_sw(hw);
	struct clk_mux *mux = to_clk_mux(hw);

	return mux_sw->ops->get_parent(&mux->hw);
}

static int clk_hisi_mux_sw_set_parent(struct clk_hw *hw, u8 index)
{
	struct clk_hisi_mux_sw *mux_sw = to_clk_hisi_mux_sw(hw);
	struct clk_mux *mux = to_clk_mux(hw);
	u32 val;
	int ret;

	/* Clear switch begin and set bypass bit */
	val = readl(mux->reg);
	val &= ~SW_BEGIN_CFG;
	val |= SW_BEGIN_CFG_BYPASS;
	writel(val, mux->reg);

	ret = mux_sw->ops->set_parent(&mux->hw, index);
	if (ret)
		goto out;

	/* Begin switch */
	val = readl(mux->reg);
	val |= SW_BEGIN_CFG;
	writel(val, mux->reg);

	udelay(1);
out:
	return ret;
}

static const struct clk_ops clk_hisi_mux_sw_ops = {
	.get_parent = clk_hisi_mux_sw_get_parent,
	.set_parent = clk_hisi_mux_sw_set_parent,
	.determine_rate = __clk_mux_determine_rate,
};

struct clk *clk_register_hisi_mux_sw(struct device *dev,
				     const struct hisi_mux_clock *clock,
				     void __iomem *base, spinlock_t *lock)
{
	struct clk_hisi_mux_sw *mux_sw;
	struct clk_mux *mux;
	struct clk_init_data init;
	struct clk *clk;

	mux_sw = kzalloc(sizeof(*mux_sw), GFP_KERNEL);
	if (!mux_sw)
		return ERR_PTR(-ENOMEM);

	init.name = clock->name;
	init.ops = &clk_hisi_mux_sw_ops;
	init.flags = clock->flags | CLK_IS_BASIC;
	init.parent_names = clock->parent_names;
	init.num_parents = clock->num_parents;

	mux = &mux_sw->mux;
	mux->reg = base + clock->offset;
	mux->shift = clock->shift;
	mux->mask = BIT(clock->width) - 1;
	mux->flags = clock->mux_flags;
	mux->lock = lock;
	mux->table = clock->table;
	mux->hw.init = &init;

	mux_sw->ops = &clk_mux_ops;

	clk = clk_register(dev, &mux->hw);
	if (IS_ERR(clk))
		kfree(mux_sw);

	return clk;
}
EXPORT_SYMBOL_GPL(clk_register_hisi_mux_sw);

void clk_unregister_hisi_mux_sw(struct clk *clk)
{
	struct clk_hisi_mux_sw *mux_sw;
	struct clk_hw *hw;

	hw = __clk_get_hw(clk);
	if (!hw)
		return;

	mux_sw = to_clk_hisi_mux_sw(hw);

	clk_unregister(clk);
	kfree(mux_sw);
}
EXPORT_SYMBOL_GPL(clk_unregister_hisi_mux_sw);
