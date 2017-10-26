/*
 * COMBPHY driver for HiSilicon STB SoCs
 *
 * Copyright (C) 2016-2017 HiSilicon Co., Ltd. http://www.hisilicon.com
 *
 * Authors: Jianguo Sun <sunjianguo1@huawei.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/clk.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/kernel.h>
#include <linux/mfd/syscon.h>
#include <linux/module.h>
#include <linux/of_device.h>
#include <linux/phy/phy.h>
#include <linux/regmap.h>
#include <linux/reset.h>
#include <dt-bindings/phy/phy.h>

#define PERI_CTRL			0x8
#define COMBPHY1_MODE_MASK		GENMASK(12, 11)
#define COMBPHY1_MODE_SHIFT		11
#define COMBPHY_MODE_PCIE		0
#define COMBPHY_MODE_USB3		1
#define COMBPHY_MODE_SATA		2

#define COMBPHY_CFG_REG			0x0
#define COMBPHY_BYPASS_CODEC		BIT(31)
#define COMBPHY_TEST_WRITE		BIT(24)
#define COMBPHY_TEST_DATA_SHIFT		20
#define COMBPHY_TEST_DATA_MASK		GENMASK(23, 20)
#define COMBPHY_TEST_ADDR_SHIFT		12
#define COMBPHY_TEST_ADDR_MASK		GENMASK(16, 12)
#define COMBPHY_CLKREF_OUT_OEN		BIT(0)

struct histb_combphy_priv {
	void __iomem *mmio;
	struct regmap *syscon;
	struct reset_control *por_rst;
	struct clk *ref_clk;
	struct phy *phy;
	int phy_mode;
	int phy_id;
};

static void nano_register_write(struct histb_combphy_priv *priv,
				u32 addr, u32 data)
{
	void __iomem *reg = priv->mmio + COMBPHY_CFG_REG;
	u32 val;

	/* Set up address and data for the write */
	val = readl(reg);
	val &= ~COMBPHY_TEST_ADDR_MASK;
	val |= addr << COMBPHY_TEST_ADDR_SHIFT;
	val &= ~COMBPHY_TEST_DATA_MASK;
	val |= data << COMBPHY_TEST_DATA_SHIFT;
	writel(val, reg);

	/* Flip strobe control to trigger the write */
	val &= ~COMBPHY_TEST_WRITE;
	writel(val, reg);
	val |= COMBPHY_TEST_WRITE;
	writel(val, reg);
}

static int histb_combphy_set_mode(struct histb_combphy_priv *priv)
{
	struct regmap *syscon = priv->syscon;
	u32 mode;

	switch (priv->phy_mode) {
	case PHY_TYPE_SATA:
		mode = COMBPHY_MODE_SATA;
		break;
	case PHY_TYPE_PCIE:
		mode = COMBPHY_MODE_PCIE;
		break;
	case PHY_TYPE_USB3:
		mode = COMBPHY_MODE_USB3;
		break;
	default:
		return -EINVAL;
	}

	return regmap_update_bits(syscon, PERI_CTRL, COMBPHY1_MODE_MASK,
				  mode << COMBPHY1_MODE_SHIFT);
}

static int histb_combphy_init(struct phy *phy)
{
	struct histb_combphy_priv *priv = phy_get_drvdata(phy);
	u32 val;
	int ret;

	/* PHY0 doesn't support mode setting */
	if (priv->phy_id != 0) {
		ret = histb_combphy_set_mode(priv);
		if (ret)
			return ret;
	}

	/* Clear bypass bit to enable encoding/decoding */
	val = readl(priv->mmio + COMBPHY_CFG_REG);
	val &= ~COMBPHY_BYPASS_CODEC;
	writel(val, priv->mmio + COMBPHY_CFG_REG);

	ret = clk_prepare_enable(priv->ref_clk);
	if (ret)
		return ret;

	reset_control_deassert(priv->por_rst);

	/* Enable EP clock */
	val = readl(priv->mmio + COMBPHY_CFG_REG);
	val |= COMBPHY_CLKREF_OUT_OEN;
	writel(val, priv->mmio + COMBPHY_CFG_REG);

	/* Need to wait for EP clock stable */
	mdelay(5);

	/* Configure nano phy registers as suggested by vendor */
	nano_register_write(priv, 0x1, 0x8);
	nano_register_write(priv, 0xc, 0x9);
	nano_register_write(priv, 0x1a, 0x4);

	return 0;
}

static int histb_combphy_exit(struct phy *phy)
{
	struct histb_combphy_priv *priv = phy_get_drvdata(phy);
	u32 val;

	/* Disable EP clock */
	val = readl(priv->mmio + COMBPHY_CFG_REG);
	val &= ~COMBPHY_CLKREF_OUT_OEN;
	writel(val, priv->mmio + COMBPHY_CFG_REG);

	reset_control_assert(priv->por_rst);
	clk_disable_unprepare(priv->ref_clk);

	return 0;
}

static const struct phy_ops histb_combphy_ops = {
	.init = histb_combphy_init,
	.exit = histb_combphy_exit,
	.owner = THIS_MODULE,
};

static struct phy *histb_combphy_xlate(struct device *dev,
				       struct of_phandle_args *args)
{
	struct histb_combphy_priv *priv = dev_get_drvdata(dev);

	if (args->args_count < 1) {
		dev_err(dev, "invalid number of arguments\n");
		return ERR_PTR(-EINVAL);
	}

	priv->phy_mode = args->args[0];

	if (priv->phy_mode < PHY_TYPE_SATA || priv->phy_mode > PHY_TYPE_USB3) {
		dev_err(dev, "invalid phy mode argument\n");
		return ERR_PTR(-EINVAL);
	}

	if (priv->phy_id == 0 && priv->phy_mode != PHY_TYPE_USB3) {
		dev_err(dev, "PHY0 works in USB3 mode only\n");
		return ERR_PTR(-EINVAL);
	}

	return priv->phy;
}

static int histb_combphy_probe(struct platform_device *pdev)
{
	struct phy_provider *phy_provider;
	struct device *dev = &pdev->dev;
	struct histb_combphy_priv *priv;
	struct device_node *np = dev->of_node;
	struct resource *res;
	int ret;

	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	if (!priv)
		return -ENOMEM;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	priv->mmio = devm_ioremap_resource(dev, res);
	if (IS_ERR(priv->mmio)) {
		ret = PTR_ERR(priv->mmio);
		return ret;
	}

	priv->syscon = syscon_node_to_regmap(np->parent);
	if (IS_ERR(priv->syscon)) {
		dev_err(dev, "failed to find peri_ctrl syscon regmap\n");
		return PTR_ERR(priv->syscon);
	}

	priv->phy_id = of_alias_get_id(np, "combphy");
	if (priv->phy_id < 0)
		priv->phy_id = 0;

	priv->ref_clk = devm_clk_get(dev, NULL);
	if (IS_ERR(priv->ref_clk)) {
		dev_err(dev, "failed to find ref clock\n");
		return PTR_ERR(priv->ref_clk);
	}

	priv->por_rst = devm_reset_control_get(dev, NULL);
	if (IS_ERR(priv->por_rst)) {
		dev_err(dev, "failed to get poweron reset\n");
		return PTR_ERR(priv->por_rst);
	}

	priv->phy = devm_phy_create(dev, NULL, &histb_combphy_ops);
	if (IS_ERR(priv->phy)) {
		dev_err(dev, "failed to create combphy\n");
		return PTR_ERR(priv->phy);
	}

	dev_set_drvdata(dev, priv);
	phy_set_drvdata(priv->phy, priv);

	phy_provider = devm_of_phy_provider_register(dev, histb_combphy_xlate);
	return PTR_ERR_OR_ZERO(phy_provider);
}

static const struct of_device_id histb_combphy_of_match[] = {
	{ .compatible = "hisilicon,hi3798cv200-combphy" },
	{ },
};
MODULE_DEVICE_TABLE(of, histb_combphy_of_match);

static struct platform_driver histb_combphy_driver = {
	.probe	= histb_combphy_probe,
	.driver = {
		.name = "combphy",
		.of_match_table = histb_combphy_of_match,
	},
};
module_platform_driver(histb_combphy_driver);

MODULE_DESCRIPTION("HiSilicon STB COMBPHY driver");
MODULE_LICENSE("GPL v2");
