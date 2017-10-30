/*
 * xHCI host controller driver for HiSilicon SoCs
 *
 * Copyright (C) 2017 HiSilicon Co., Ltd. http://www.hisilicon.com
 *
 * Authors: Jianguo Sun <sunjianguo1@huawei.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 */

#include <linux/phy/phy.h>
#include <linux/mfd/syscon.h>
#include <linux/regmap.h>

#include "xhci.h"
#include "xhci-histb.h"

#define GTXTHRCFG		(0xc108)
#define GRXTHRCFG		(0xc10c)
#define REG_GCTL		(0xc110)
#define REG_GUSB2PHYCFG0	(0xc200)
#define REG_GUSB3PIPECTL0	(0xc2c0)

#define BIT_UTMI_8_16		BIT(3)
#define BIT_UTMI_ULPI		BIT(4)
#define BIT_FREECLK_EXIST	BIT(30)

#define USB3_PORT_DISABLE	BIT(5)
#define USB3_DEEMPHASIS0	BIT(1)
#define USB3_DEEMPHASIS1	BIT(2)
#define USB3_TX_MARGIN0		BIT(3)
#define USB3_TX_MARGIN1		BIT(4)
#define USB3_TX_MARGIN2		BIT(5)
#define USB3_SUSPEND_EN		BIT(17)
#define USB3_DEEMPHASIS_MASK	(0x6)

void xhci_histb_start(struct usb_hcd *hcd)
{
	struct phy *phy;
	u32 reg, usb3_port_disabled = 0;

	/* If hcd->regs is NULL, we don't just call the following function */
	if (!hcd->regs)
		return;

	phy = phy_get(hcd->self.controller, "combo");
	if (IS_ERR(phy)) {
		if (PTR_ERR(phy) == -EPROBE_DEFER)
			return;
		usb3_port_disabled = 1;
	} else {
		if (phy_init(phy)) {
			phy_put(phy);
			return;
		}
		if (phy_power_on(phy)) {
			phy_exit(phy);
			phy_put(phy);
			return;
		}
	}

	if (usb3_port_disabled) {
		struct device_node *np;
		struct of_phandle_args out_args;
		struct regmap *syscon;
		u32 syscon_reg;

		np = hcd->self.controller->of_node;
		if (of_parse_phandle_with_fixed_args(np,
			"hisilicon,peripheral-syscon", 1, 0, &out_args))
			return;

		syscon = syscon_node_to_regmap(out_args.np);
		if (IS_ERR(syscon))
			return;

		syscon_reg = out_args.args[0];
		regmap_read(syscon, syscon_reg, &reg);
		reg |= USB3_PORT_DISABLE;
		regmap_write(syscon, syscon_reg, reg);
	} else {
		/* write 0x010c0012 to GUSB3PIPECTL0
		 * GUSB3PIPECTL0[17] = 0 : disable U3 suspend
		 * GUSB3PIPECTL0[5:3] = 010 : Tx Margin = 900mV ,
		 * decrease TX voltage
		 * GUSB3PIPECTL0[2:1] = 01 : Tx Deemphasis = -3.5dB,
		 * refer to spec
		 */
		reg = readl(hcd->regs + REG_GUSB3PIPECTL0);
		//reg &= ~USB3_SUSPEND_EN;
		reg &= ~USB3_DEEMPHASIS_MASK;
		reg |= USB3_DEEMPHASIS0;
		reg |= USB3_TX_MARGIN1;
		writel(reg, hcd->regs + REG_GUSB3PIPECTL0);

		udelay(20);
	}

	/* USB2 PHY chose ulpi 8bit interface */
	reg = readl(hcd->regs + REG_GUSB2PHYCFG0);
	reg &= ~BIT_UTMI_ULPI;
	reg &= ~(BIT_UTMI_8_16);
	reg &= ~BIT_FREECLK_EXIST;
	writel(reg, hcd->regs + REG_GUSB2PHYCFG0);

	/* [13:12] 01: Host; 10: Device; 11: OTG */
	reg = readl(hcd->regs + REG_GCTL);
	reg &= ~(0x3 << 12);
	reg |= (0x1 << 12);
	writel(reg, hcd->regs + REG_GCTL);

	writel(0x2310000, hcd->regs + GTXTHRCFG);
	writel(0x2310000, hcd->regs + GRXTHRCFG);

	udelay(200);
}
