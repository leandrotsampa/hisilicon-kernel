/******************************************************************************
 * Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.6.5
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef CLK_HISI_H
#define CLK_HISI_H

#include <linux/kernel.h>
#include <linux/clk-provider.h>
#include <linux/clk.h>

struct clk_rate_reg{
	unsigned long rate;
	u32 regval;
};

struct hiclk_hw {
	int id;
	const char *name;
	u32 offset;
	u32 mask;
	u32 value;
	u32 rstbit;

	unsigned long rate;
	struct clk_ops *ops;
	struct clk_hw hw;
	void *__iomem peri_crgx;
	void *__iomem peri_crg_base;
	void *__iomem peri_ctrl_base;

#define CLKHW_RESET         (0x01)
#define CLKHW_ENABLE        (0x02)
	u32 flags;
};
#define to_hiclk_hw(_hw) container_of(_hw, struct hiclk_hw, hw)

struct clk *hiclk_register(struct hiclk_hw *hihw, struct clk_ops *clkops);

struct clk *of_hiclk_src_get(struct of_phandle_args *clkspec, void *data);

void hiclk_clocks_init(struct device_node *node, struct hiclk_hw *clks_hw,
		       int nr_hw, int clk_num, struct clk_ops *clkops);

int hiclk_enable(struct clk_hw *hw);

void hiclk_disable(struct clk_hw *hw);

unsigned long hiclk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate);

int hiclk_prepare(struct clk_hw *hw);

void hiclk_unprepare(struct clk_hw *hw);

void hiclk_init(struct clk_hw *hw);

#endif /* CLK_HISI_H*/
