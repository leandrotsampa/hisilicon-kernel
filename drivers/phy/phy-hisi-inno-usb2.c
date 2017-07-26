/*
 * HiSilicon INNO USB2 PHY Driver.
 *
 * Copyright (c) 2016-2017 HiSilicon Technologies Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <linux/clk.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/phy/phy.h>
#include <linux/reset.h>

#define INNO_PHY_PORT_NUM	2
#define REF_CLK_STABLE_TIME	100	/* unit:us */
#define UTMI_CLK_STABLE_TIME	200	/* unit:us */
#define TEST_CLK_STABLE_TIME	2	/* unit:ms */
#define PHY_CLK_STABLE_TIME	2	/* unit:ms */
#define UTMI_RST_COMPLETE_TIME	2	/* unit:ms */
#define POR_RST_COMPLETE_TIME	300	/* unit:us */
#define PHY_TEST_DATA		GENMASK(7, 0)
#define PHY_TEST_ADDR		GENMASK(15, 8)
#define PHY_TEST_PORT		GENMASK(18, 16)
#define PHY_TEST_WREN		BIT(21)
#define PHY_TEST_CLK		BIT(22)	/* rising edge active */
#define PHY_TEST_RST		BIT(23)	/* low active */
#define PHY_CLK_ENABLE		BIT(2)

struct hisi_inno_phy_port {
	struct phy *phy;
	struct device *dev;
	struct reset_control *utmi_rst;
};

struct hisi_inno_phy_priv {
	void __iomem *mmio;
	struct clk *ref_clk;
	struct reset_control *por_rst;
	struct hisi_inno_phy_port ports[INNO_PHY_PORT_NUM];
	u32 port_num;
};

static void hisi_inno_phy_write_reg(struct hisi_inno_phy_priv *priv,
				    u8 port, u32 addr, u32 data)
{
	void __iomem *reg = priv->mmio;
	u32 val;

	val = (data & PHY_TEST_DATA) |
	      ((addr << 8) & PHY_TEST_ADDR) |
	      ((port << 16) & PHY_TEST_PORT) |
	      PHY_TEST_WREN | PHY_TEST_RST;
	writel(val, reg);

	val |= PHY_TEST_CLK;
	writel(val, reg);

	val &= ~PHY_TEST_CLK;
	writel(val, reg);
}

static void hisi_inno_phy_setup(struct hisi_inno_phy_priv *priv)
{
	hisi_inno_phy_write_reg(priv, 0, 0x06, PHY_CLK_ENABLE);
	msleep(PHY_CLK_STABLE_TIME);
}

static int hisi_inno_phy_init(struct phy *phy)
{
	struct hisi_inno_phy_port *port = phy_get_drvdata(phy);
	struct hisi_inno_phy_priv *priv = dev_get_drvdata(port->dev);
	int ret;

	ret = clk_prepare_enable(priv->ref_clk);
	if (ret)
		return ret;
	udelay(REF_CLK_STABLE_TIME);

	reset_control_deassert(priv->por_rst);
	udelay(POR_RST_COMPLETE_TIME);

	/* Set up phy registers */
	hisi_inno_phy_setup(priv);

	reset_control_deassert(port->utmi_rst);
	udelay(UTMI_RST_COMPLETE_TIME);

	return 0;
}

static int hisi_inno_phy_exit(struct phy *phy)
{
	struct hisi_inno_phy_port *port = phy_get_drvdata(phy);
	struct hisi_inno_phy_priv *priv = dev_get_drvdata(port->dev);

	reset_control_assert(port->utmi_rst);
	reset_control_assert(priv->por_rst);
	clk_disable_unprepare(priv->ref_clk);

	return 0;
}

static const struct phy_ops hisi_inno_phy_ops = {
	.init = hisi_inno_phy_init,
	.exit = hisi_inno_phy_exit,
	.owner = THIS_MODULE,
};

static struct phy *hisi_inno_phy_xlate(struct device *dev,
				       struct of_phandle_args *args)
{
	struct hisi_inno_phy_priv *priv = dev_get_drvdata(dev);
	int id = args->args[0];

	if (id >= priv->port_num)
		return ERR_PTR(-ENODEV);

	return priv->ports[id].phy;
}

static int hisi_inno_phy_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct device_node *np = dev->of_node;
	struct hisi_inno_phy_priv *priv;
	struct phy_provider *provider;
	struct resource *res;
	int ret, i;

	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	if (!priv)
		return -ENOMEM;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	priv->mmio = devm_ioremap_resource(dev, res);
	if (IS_ERR(priv->mmio)) {
		ret = PTR_ERR(priv->mmio);
		return ret;
	}

	priv->ref_clk = devm_clk_get(dev, NULL);
	if (IS_ERR(priv->ref_clk))
		return PTR_ERR(priv->ref_clk);

	priv->port_num = of_count_phandle_with_args(np, "resets",
						    "#reset-cells");
	/* Do not count power_on reset */
	priv->port_num--;

	if (priv->port_num <= 0 || priv->port_num > INNO_PHY_PORT_NUM) {
		dev_err(dev, "Invalid port number %d\n", priv->port_num);
		return -EINVAL;
	}

	priv->por_rst = devm_reset_control_get_shared(dev, "power_on");
	if (IS_ERR(priv->por_rst))
		return PTR_ERR(priv->por_rst);

	for (i = 0; i < priv->port_num; i++) {
		struct reset_control *rst;
		struct phy *phy;
		char id[6];

		snprintf(id, 6, "utmi%1d\n", i);
		rst = devm_reset_control_get_exclusive(dev, id);
		if (IS_ERR(rst))
			return PTR_ERR(rst);
		priv->ports[i].utmi_rst = rst;

		phy = devm_phy_create(dev, NULL, &hisi_inno_phy_ops);
		if (IS_ERR(phy))
			return PTR_ERR(phy);

		priv->ports[i].phy = phy;
		priv->ports[i].dev = dev;
		phy_set_bus_width(phy, 8);
		phy_set_drvdata(phy, &priv->ports[i]);
	}

	dev_set_drvdata(dev, priv);

	provider = devm_of_phy_provider_register(dev, hisi_inno_phy_xlate);
	return PTR_ERR_OR_ZERO(provider);
}

static const struct of_device_id hisi_inno_phy_of_match[] = {
	{ .compatible = "hisilicon,inno-usb2-phy", },
	{ .compatible = "hisilicon,hi3798cv200-usb2-phy", },
	{ },
};
MODULE_DEVICE_TABLE(of, hisi_inno_phy_of_match);

static struct platform_driver hisi_inno_phy_driver = {
	.probe	= hisi_inno_phy_probe,
	.driver = {
		.name	= "hisi-inno-phy",
		.of_match_table	= hisi_inno_phy_of_match,
	}
};
module_platform_driver(hisi_inno_phy_driver);

MODULE_DESCRIPTION("HiSilicon INNO USB2 PHY Driver");
MODULE_LICENSE("GPL v2");
