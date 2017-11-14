/*
 * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
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

struct clk_hisi_phase {
	struct clk_hw	hw;
	void __iomem	*reg;
	u32		*phase_values;
	u32		*phase_regs;
	u8		phase_num;
	u32		mask;
	u8		shift;
	u8		flags;
	spinlock_t	*lock;
};
#define to_clk_hisi_phase(_hw) container_of(_hw, struct clk_hisi_phase, hw)

#define PHASE_REG_INVALID 0xFF

static u32 hisi_clk_get_phase_reg(struct clk_hisi_phase *phase, int degrees)
{
	int i;

	for (i = 0; i < phase->phase_num; i++)
		if (phase->phase_values[i] == degrees)
			return phase->phase_regs[i];

	return PHASE_REG_INVALID;
}

static int hisi_clk_set_phase(struct clk_hw *hw, int degrees)
{
	struct clk_hisi_phase *phase = to_clk_hisi_phase(hw);
	u32 val, phase_reg;
	unsigned long flags = 0;

	phase_reg = hisi_clk_get_phase_reg(phase, degrees);
	if (phase_reg == PHASE_REG_INVALID)
		return -EINVAL;

	if (phase->lock)
		spin_lock_irqsave(phase->lock, flags);
	else
		__acquire(phase->lock);

	val = clk_readl(phase->reg);
	val &= ~(phase->mask << phase->shift);
	val |= phase_reg << phase->shift;
	clk_writel(val, phase->reg);

	if (phase->lock)
		spin_unlock_irqrestore(phase->lock, flags);
	else
		__release(phase->lock);

	return 0;
}

const struct clk_ops clk_phase_ops = {
	.set_phase = hisi_clk_set_phase,
};

void clk_unregister_hisi_phase(struct clk *clk)
{
	struct clk_hisi_phase *phase;
	struct clk_hw *hw;

	hw = __clk_get_hw(clk);
	if (!hw)
		return;

	phase = to_clk_hisi_phase(hw);
	clk_unregister(clk);
	kfree(phase);
}
EXPORT_SYMBOL_GPL(clk_unregister_hisi_phase);

struct clk *clk_register_hisi_phase(struct device *dev,
		const struct hisi_phase_clock *clks,
		void __iomem *base, spinlock_t *lock)
{
	struct clk_hisi_phase *phase;
	struct clk *clk;
	struct clk_init_data init;

	phase = kzalloc(sizeof(struct clk_hisi_phase), GFP_KERNEL);
	if (!phase)
		return ERR_PTR(-ENOMEM);

	init.name = clks->name;
	init.ops = &clk_phase_ops;
	init.flags = clks->flags | CLK_IS_BASIC;
	init.parent_names = clks->parent_names ? &clks->parent_names : NULL;
	init.num_parents = clks->parent_names ? 1 : 0;

	phase->reg = base + clks->offset;
	phase->shift = clks->shift;
	phase->mask = BIT(clks->width) - 1;
	phase->lock = lock;
	phase->phase_values = clks->phase_values;
	phase->phase_regs = clks->phase_regs;
	phase->phase_num = clks->phase_num;
	phase->hw.init = &init;

	clk = clk_register(dev, &phase->hw);
	if (IS_ERR(clk))
		kfree(phase);

	return clk;
}
EXPORT_SYMBOL_GPL(clk_register_hisi_phase);
