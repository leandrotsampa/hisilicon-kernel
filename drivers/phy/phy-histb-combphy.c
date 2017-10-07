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

#define PERI_CTRL			0x0008
#define PERI_COMBPHY1_CFG		0x0858

#define COMBPHY1_MODE_MASK		GENMASK(12, 11)
#define COMBPHY_MODE_SHIFT		11
#define COMBPHY_MODE_PCIE		0
#define COMBPHY_MODE_USB		1
#define COMBPHY_MODE_SATA		2
#define COMBPHY_MODE_RESV		3

#define COMBPHY1_BYPASS_CODEC_MASK	BIT(31)
#define COMBPHY1_BYPASS_CODEC_VAL	(1 << 31)

#define COMBPHY1_SRST_REQ_MASK		BIT(12)
#define COMBPHY1_SRST_REQ_VAL		(1 << 12)

#define COMBPHY1_REFCLK_SEL_MASK	GENMASK(11, 10)
#define COMBPHY1_REFCLK_SEL_VAL		(2 << 10)

#define COMBPHY1_CLKREF_OUT_OEN_MASK	BIT(0)
#define COMBPHY1_CLKREF_OUT_OEN_VAL	(1 << 0)

#define NANO_TEST_WRITE			GENMASK(24, 24)
#define NANO_TEST_DATA			GENMASK(23, 20)
#define NANO_TEST_ADDR			GENMASK(16, 12)

struct histb_combphy_priv {
	u32 mode;
	struct regmap *peri;
	struct clk *ref;
	struct phy *phy;
	struct reset_control *por;
};

static void nano_register_write(struct regmap *peri, u32 addr,
				u32 offset, u32 value)
{
	u32 val;
	int ret;

	ret = regmap_read(peri, addr, &val);
	val &= ~NANO_TEST_ADDR;
	val &= ~NANO_TEST_DATA;
	val |= (offset << 12);
	val |= (value << 20);
	ret |= regmap_write(peri, addr, val);

	ret = regmap_read(peri, addr, &val);
	val &= ~NANO_TEST_WRITE;
	ret |= regmap_write(peri, addr, val);

	ret = regmap_read(peri, addr, &val);
	val |= NANO_TEST_WRITE;
	ret |= regmap_write(peri, addr, val);
}

static int histb_pcie_phy_init(struct histb_combphy_priv *priv)
{
	struct regmap *peri = priv->peri;
	int ret;

	/* set to pcie mode */
	regmap_update_bits(peri, PERI_CTRL, COMBPHY1_MODE_MASK,
			    COMBPHY_MODE_PCIE << COMBPHY_MODE_SHIFT);

	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
			    COMBPHY1_BYPASS_CODEC_MASK,
			    ~COMBPHY1_BYPASS_CODEC_VAL);

	ret = clk_prepare_enable(priv->ref);
	if (ret) {
		dev_err(&priv->phy->dev, "clk_prepare_enable fail!\n");
		return ret;
	}
	reset_control_deassert(priv->por);

	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
			    COMBPHY1_CLKREF_OUT_OEN_MASK,
			    COMBPHY1_CLKREF_OUT_OEN_VAL);
	/* need to wait for EP clk stable */
	mdelay(5);

	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1, 0x8);
	nano_register_write(peri, PERI_COMBPHY1_CFG, 0xc, 0x9);
	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1a, 0x4);

	return 0;
}

static int histb_pcie_phy_exit(struct histb_combphy_priv *priv)
{
	regmap_update_bits(priv->peri, PERI_COMBPHY1_CFG,
				COMBPHY1_CLKREF_OUT_OEN_MASK,
				~COMBPHY1_CLKREF_OUT_OEN_VAL);
	reset_control_deassert(priv->por);
	clk_disable_unprepare(priv->ref);

	return 0;
}

static int histb_combphy_init(struct phy *phy)
{
	struct histb_combphy_priv *priv = phy_get_drvdata(phy);
	int ret = -1;

	if (priv->mode == COMBPHY_MODE_PCIE)
		ret = histb_pcie_phy_init(priv);

	return ret;
}

static int histb_combphy_exit(struct phy *phy)
{
	struct histb_combphy_priv *priv = phy_get_drvdata(phy);
	int ret = 0;

	if (priv->mode == COMBPHY_MODE_PCIE)
		ret = histb_pcie_phy_exit(priv);

	return ret;
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
		dev_err(dev, "DT did not pass correct no of args\n");
		return ERR_PTR(-ENODEV);
	}

	priv->mode = args->args[0];

	if (priv->mode > COMBPHY_MODE_RESV) {
		dev_err(dev, "DT did not pass correct phy mode\n");
		return ERR_PTR(-ENODEV);
	}

	return priv->phy;
}

static int histb_combphy_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct histb_combphy_priv *priv;
	struct phy_provider *phy_provider;

	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	if (!priv)
		return -ENOMEM;

	priv->peri = syscon_regmap_lookup_by_phandle(dev->of_node,
				"hisilicon,peripheral-syscon");
	if (IS_ERR(priv->peri)) {
		dev_err(dev, "failed to find peri_ctrl regmap\n");
		return PTR_ERR(priv->peri);
	}

	priv->ref = devm_clk_get(dev, NULL);
	if (IS_ERR(priv->ref)) {
		dev_err(dev, "failed to find ref clk\n");
		return PTR_ERR(priv->ref);
	}

	priv->por = devm_reset_control_get(dev, NULL);
	if (IS_ERR(priv->por)) {
		dev_err(dev, "failed to por reset\n");
		return PTR_ERR(priv->por);
	}

	priv->phy = devm_phy_create(dev, NULL, &histb_combphy_ops);
	if (IS_ERR(priv->phy)) {
		dev_err(dev, "failed to create combphy\n");
		return PTR_ERR(priv->phy);
	}

	dev_set_drvdata(dev, priv);
	phy_set_drvdata(priv->phy, priv);

	phy_provider = devm_of_phy_provider_register(dev, histb_combphy_xlate);
	if (IS_ERR(phy_provider)) {
		dev_err(dev, "failed to register phy provider\n");
		return PTR_ERR(phy_provider);
	}

	return 0;
}

static const struct of_device_id histb_combphy_of_match[] = {
	{ .compatible = "hisilicon,hi3798cv200-combphy" },
	{ },
};
MODULE_DEVICE_TABLE(of, histb_combphy_of_match);

static struct platform_driver histb_combphy_driver = {
	.probe		= histb_combphy_probe,
	.driver = {
		.name = "combphy",
		.of_match_table = of_match_ptr(histb_combphy_of_match),
	},
};

module_platform_driver(histb_combphy_driver);

MODULE_DESCRIPTION("HiSilicon STB COMBPHY driver");
MODULE_LICENSE("GPL v2");
