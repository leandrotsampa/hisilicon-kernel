/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include <linux/kernel.h>
#include <linux/reset.h>
#include <linux/clk-provider.h>
#include <linux/hikapi.h>
#include <linux/clk.h>
#include "higmac.h"

void higmac_mac_core_reset(struct higmac_netdev_local *priv)
{
	/* undo reset */
	reset_control_deassert(priv->port_rst);
	usleep_range(50, 60);

	/* soft reset mac port */
	reset_control_assert(priv->port_rst);
	usleep_range(50, 60);
	/* undo reset */
	reset_control_deassert(priv->port_rst);
}

void higmac_hw_internal_phy_reset(struct higmac_netdev_local *priv)
{
}

void higmac_internal_fephy_trim(void)
{
}

void higmac_hw_phy_reset(struct higmac_netdev_local *priv)
{
	if (priv->internal_phy)
		higmac_hw_internal_phy_reset(priv);
	else
		higmac_hw_external_phy_reset(priv);
}

static void higmac_phy_reset_assert(struct reset_control *rst,
				    bool rst_when_set)
{
	if (rst_when_set)
		reset_control_assert(rst);
	else
		reset_control_deassert(rst);
}

static void higmac_phy_reset_deassert(struct reset_control *rst,
				      bool rst_when_set)
{
	if (rst_when_set)
		reset_control_deassert(rst);
	else
		reset_control_assert(rst);
}

#define RESET_DATA		1
#define GPIO_DIR		0x400
void higmac_hw_external_phy_reset(struct higmac_netdev_local *priv)
{
	u64 chipid;
	bool rst_when_set;

	/* 98cv200 uses CRG register to reset phy */
	/* RST_BIT, write 0 to reset phy, write 1 to cancel reset */
	chipid = get_chipid(0ULL);
	if (chipid == _HI3798CV200)
		rst_when_set = false;
	else
		rst_when_set = true;

	if (priv->phy_rst) {
		higmac_phy_reset_deassert(priv->phy_rst, rst_when_set);
		msleep(10);

		higmac_phy_reset_assert(priv->phy_rst, rst_when_set);

		/* delay some time to ensure reset ok,
		 * this depends on PHY hardware feature
		 */
		msleep(20);

		higmac_phy_reset_deassert(priv->phy_rst, rst_when_set);
		/* delay some time to ensure later MDIO access */
		msleep(50);
	} else if (priv->gpio_base) {
#ifdef HIGMAC_RESET_PHY_BY_GPIO
		/* use gpio to control mac's phy reset */
		void __iomem *gpio_base;
		u32 gpio_bit;
		u32 v;

		gpio_base = (void __iomem *)IO_ADDRESS(
				(unsigned int)priv->gpio_base);
		gpio_bit = priv->gpio_bit;

		/* config gpip[x] dir to output */
		v = readb(gpio_base + GPIO_DIR);
		v |= (1 << gpio_bit);
		writeb(v, gpio_base + GPIO_DIR);

		/* gpiox[x] set to reset, then delay 200ms */
		writeb(RESET_DATA << gpio_bit, gpio_base + (4 << gpio_bit));
		msleep(20);
		/* then,cancel reset,and should delay 200ms */
		writeb((!RESET_DATA) << gpio_bit, gpio_base + (4 << gpio_bit));
		msleep(20);
		writeb(RESET_DATA << gpio_bit, gpio_base + (4 << gpio_bit));

		/* add some delay in case mdio cann't access now! */
		msleep(30);
#endif
	}
}

void higmac_internal_phy_clk_disable(struct higmac_netdev_local *priv)
{
}

void higmac_internal_phy_clk_enable(struct higmac_netdev_local *priv)
{
}

void higmac_hw_all_clk_disable(struct higmac_netdev_local *priv)
{
	/* If macif clock is enabled when suspend, we should
	 * disable it here.
	 * Because when resume, PHY will link up again and
	 * macif clock will be enabled too. If we don't disable
	 * macif clock in suspend, macif clock will be enabled twice.
	 */
	if (__clk_is_enabled(priv->macif_clk))
		clk_disable_unprepare(priv->macif_clk);

	/* This is called in suspend, when net device is down,
	 * MAC clk is disabled.
	 * So we need to judge whether MAC clk is enabled,
	 * otherwise kernel will WARNING if clk disable twice.
	 */
	if (__clk_is_enabled(priv->clk))
		clk_disable_unprepare(priv->clk);

	if (priv->internal_phy)
		higmac_internal_phy_clk_disable(priv);
}

void higmac_hw_all_clk_enable(struct higmac_netdev_local *priv)
{
	if (priv->internal_phy)
		higmac_internal_phy_clk_enable(priv);

	if (!__clk_is_enabled(priv->macif_clk) &&
	    (priv->netdev->flags & IFF_UP))
		clk_prepare_enable(priv->macif_clk);

	/* If net device is down when suspend, we should not enable MAC clk. */
	if (!__clk_is_enabled(priv->clk) && (priv->netdev->flags & IFF_UP))
		clk_prepare_enable(priv->clk);
}
