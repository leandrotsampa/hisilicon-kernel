#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/unistd.h>
#include <linux/interrupt.h>
#include <linux/delay.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/skbuff.h>
#include <linux/spinlock.h>
#include <linux/mm.h>
#include <linux/mii.h>
#include <linux/mdio.h>
#include <linux/ethtool.h>
#include <linux/phy.h>
#include <linux/dma-mapping.h>
#include <linux/workqueue.h>
#include <linux/device.h>
#include <linux/atomic.h>
#include <linux/platform_device.h>
#include <linux/capability.h>
#include <linux/time.h>
#include <asm/setup.h>
#include <linux/proc_fs.h>
#include <linux/module.h>

#include <linux/circ_buf.h>
#include <linux/if_vlan.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <net/ipv6.h>

#include <linux/of_net.h>
#include <linux/of_mdio.h>
#include <linux/clk.h>
#include <linux/reset.h>

#include "util.h"
#include "higmac.h"
#include "mdio.h"
#include "autoeee/autoeee.h"
#include "sockioctl.h"

#define REG_BASE_CRG			0xF8A22000
#define REG_BASE_PERI_CTRL		0xF8A20000

#define RGMII_SPEED_1000		0x2c
#define RGMII_SPEED_100			0x2f
#define RGMII_SPEED_10			0x2d
#define MII_SPEED_100			0x0f
#define MII_SPEED_10			0x0d
#define RMII_SPEED_100			0x8f
#define RMII_SPEED_10			0x8d
#define GMAC_FULL_DUPLEX		BIT(4)

/* set irq affinity to cpu1 when multi-processor */
#define HIGMAC_IRQ_AFFINITY_CPU		2

#define DEFAULT_MSG_ENABLE (NETIF_MSG_DRV|NETIF_MSG_PROBE|NETIF_MSG_LINK)
static int debug = -1;
module_param(debug, int, 0);
MODULE_PARM_DESC(debug, "Debug level (0=none,...,16=all)");

static void higmac_config_port(struct net_device *dev, u32 speed, u32 duplex)
{
	struct higmac_netdev_local *priv = netdev_priv(dev);
	u32 val;

	switch (priv->phy_mode) {
	case PHY_INTERFACE_MODE_RGMII:
		if (speed == SPEED_1000)
			val = RGMII_SPEED_1000;
		else if (speed == SPEED_100)
			val = RGMII_SPEED_100;
		else
			val = RGMII_SPEED_10;
		break;
	case PHY_INTERFACE_MODE_MII:
		if (speed == SPEED_100)
			val = MII_SPEED_100;
		else
			val = MII_SPEED_10;
		break;
	case PHY_INTERFACE_MODE_RMII:
		if (speed == SPEED_100)
			val = RMII_SPEED_100;
		else
			val = RMII_SPEED_10;
		break;
	default:
		netdev_warn(dev, "not supported mode\n");
		val = MII_SPEED_10;
		break;
	}

	if (duplex)
		val |= GMAC_FULL_DUPLEX;

	reset_control_assert(priv->macif_rst);
	writel_relaxed(val, priv->macif_base);
	reset_control_deassert(priv->macif_rst);

	writel_relaxed(BIT_MODE_CHANGE_EN, priv->gmac_iobase + MODE_CHANGE_EN);
	if (speed == SPEED_1000)
		val = GMAC_SPEED_1000;
	else if (speed == SPEED_100)
		val = GMAC_SPEED_100;
	else
		val = GMAC_SPEED_10;
	writel_relaxed(val, priv->gmac_iobase + PORT_MODE);
	writel_relaxed(0, priv->gmac_iobase + MODE_CHANGE_EN);
	writel_relaxed(duplex, priv->gmac_iobase + MAC_DUPLEX_HALF_CTRL);
}

static void higmac_set_desc_depth(struct higmac_netdev_local *priv,
				  int rx, int tx)
{
	writel(BITS_RX_FQ_DEPTH_EN, priv->gmac_iobase + RX_FQ_REG_EN);
	writel(rx << DESC_WORD_SHIFT, priv->gmac_iobase + RX_FQ_DEPTH);
	writel(0, priv->gmac_iobase + RX_FQ_REG_EN);

	writel(BITS_RX_BQ_DEPTH_EN, priv->gmac_iobase + RX_BQ_REG_EN);
	writel(rx << DESC_WORD_SHIFT, priv->gmac_iobase + RX_BQ_DEPTH);
	writel(0, priv->gmac_iobase + RX_BQ_REG_EN);

	writel(BITS_TX_BQ_DEPTH_EN, priv->gmac_iobase + TX_BQ_REG_EN);
	writel(tx << DESC_WORD_SHIFT, priv->gmac_iobase + TX_BQ_DEPTH);
	writel(0, priv->gmac_iobase + TX_BQ_REG_EN);

	writel(BITS_TX_RQ_DEPTH_EN, priv->gmac_iobase + TX_RQ_REG_EN);
	writel(tx << DESC_WORD_SHIFT, priv->gmac_iobase + TX_RQ_DEPTH);
	writel(0, priv->gmac_iobase + TX_RQ_REG_EN);
}

static void higmac_set_rx_fq(struct higmac_netdev_local *priv,
			     dma_addr_t phy_addr)
{
	writel(BITS_RX_FQ_START_ADDR_EN, priv->gmac_iobase + RX_FQ_REG_EN);
	writel(phy_addr, priv->gmac_iobase + RX_FQ_START_ADDR);
	writel(0, priv->gmac_iobase + RX_FQ_REG_EN);
}

static void higmac_set_rx_bq(struct higmac_netdev_local *priv,
			     dma_addr_t phy_addr)
{
	writel(BITS_RX_BQ_START_ADDR_EN, priv->gmac_iobase + RX_BQ_REG_EN);
	writel(phy_addr, priv->gmac_iobase + RX_BQ_START_ADDR);
	writel(0, priv->gmac_iobase + RX_BQ_REG_EN);
}

static void higmac_set_tx_bq(struct higmac_netdev_local *priv,
			     dma_addr_t phy_addr)
{
	writel(BITS_TX_BQ_START_ADDR_EN, priv->gmac_iobase + TX_BQ_REG_EN);
	writel(phy_addr, priv->gmac_iobase + TX_BQ_START_ADDR);
	writel(0, priv->gmac_iobase + TX_BQ_REG_EN);
}

static void higmac_set_tx_rq(struct higmac_netdev_local *priv,
			     dma_addr_t phy_addr)
{
	writel(BITS_TX_RQ_START_ADDR_EN, priv->gmac_iobase + TX_RQ_REG_EN);
	writel(phy_addr, priv->gmac_iobase + TX_RQ_START_ADDR);
	writel(0, priv->gmac_iobase + TX_RQ_REG_EN);
}

static void higmac_hw_set_desc_addr(struct higmac_netdev_local *priv)
{
	higmac_set_rx_fq(priv, priv->rx_fq.phys_addr);
	higmac_set_rx_bq(priv, priv->rx_bq.phys_addr);
	higmac_set_tx_rq(priv, priv->tx_rq.phys_addr);
	higmac_set_tx_bq(priv, priv->tx_bq.phys_addr);
}

static void higmac_hw_init(struct higmac_netdev_local *priv)
{
	u32 val;

	/* disable and clear all interrupts */
	writel(0, priv->gmac_iobase + ENA_PMU_INT);
	writel(~0, priv->gmac_iobase + RAW_PMU_INT);

	/* enable CRC erro packets filter */
	val = readl(priv->gmac_iobase + REC_FILT_CONTROL);
	val |= BIT_CRC_ERR_PASS;
	writel(val, priv->gmac_iobase + REC_FILT_CONTROL);

	/* fix bug for udp and ip error check */
	writel(CONTROL_WORD_CONFIG, priv->gmac_iobase + CONTROL_WORD);

	writel(0, priv->gmac_iobase + COL_SLOT_TIME);

	writel(DUPLEX_HALF, priv->gmac_iobase + MAC_DUPLEX_HALF_CTRL);

	/* FIXME: interrupt when rcv packets >= RX_BQ_INT_THRESHOLD */
	val = RX_BQ_INT_THRESHOLD |
	    (TX_RQ_INT_THRESHOLD << BITS_OFFSET_TX_RQ_IN_TH);
	writel(val, priv->gmac_iobase + IN_QUEUE_TH);

	/* FIXME: rx_bq/tx_rq in timeout threshold */
	writel(0x10000, priv->gmac_iobase + RX_BQ_IN_TIMEOUT_TH);

	writel(0x18000, priv->gmac_iobase + TX_RQ_IN_TIMEOUT_TH);

	higmac_set_desc_depth(priv, RX_DESC_NUM, TX_DESC_NUM);
}

static inline void higmac_irq_enable(struct higmac_netdev_local *ld)
{
	writel(RX_BQ_IN_INT | RX_BQ_IN_TIMEOUT_INT
	       | TX_RQ_IN_INT | TX_RQ_IN_TIMEOUT_INT,
	       ld->gmac_iobase + ENA_PMU_INT);
}

static inline void higmac_irq_disable(struct higmac_netdev_local *ld)
{
	writel(0, ld->gmac_iobase + ENA_PMU_INT);
}

static inline void higmac_hw_desc_enable(struct higmac_netdev_local *ld)
{
	writel(0xF, ld->gmac_iobase + DESC_WR_RD_ENA);
}

static inline void higmac_hw_desc_disable(struct higmac_netdev_local *ld)
{
	writel(0, ld->gmac_iobase + DESC_WR_RD_ENA);
}

static inline void higmac_port_enable(struct higmac_netdev_local *ld)
{
	writel(BITS_TX_EN | BITS_RX_EN, ld->gmac_iobase + PORT_EN);
}

static inline void higmac_port_disable(struct higmac_netdev_local *ld)
{
	writel(0, ld->gmac_iobase + PORT_EN);
}

/* set gmac's multicast list, here we setup gmac's mc filter */
static void higmac_gmac_multicast_list(struct net_device *dev)
{
	struct higmac_netdev_local *ld = netdev_priv(dev);
	struct netdev_hw_addr *ha;
	unsigned int d = 0;
	unsigned int rec_filter;

	rec_filter = readl(ld->gmac_iobase + REC_FILT_CONTROL);
	/* when set gmac in promisc mode
	 * a. dev in IFF_PROMISC mode
	 */
	if ((dev->flags & IFF_PROMISC)) {
		/* promisc mode.received all pkgs. */
		rec_filter &= ~(BIT_BC_DROP_EN | BIT_MC_MATCH_EN |
				BIT_UC_MATCH_EN);
	} else {
		/* drop uc pkgs with field 'DA' not match our's */
		rec_filter |= BIT_UC_MATCH_EN;

		if (dev->flags & IFF_BROADCAST)	/* no broadcast */
			rec_filter &= ~BIT_BC_DROP_EN;
		else
			rec_filter |= BIT_BC_DROP_EN;

		if (netdev_mc_empty(dev) || !(dev->flags & IFF_MULTICAST)) {
			/* haven't join any mc group */
			writel(0, ld->gmac_iobase + PORT_MC_ADDR_LOW);
			writel(0, ld->gmac_iobase + PORT_MC_ADDR_HIGH);
			rec_filter |= BIT_MC_MATCH_EN;
		} else if (1 == netdev_mc_count(dev) &&
			   (dev->flags & IFF_MULTICAST)) {
			netdev_for_each_mc_addr(ha, dev) {
				d = (ha->addr[0] << 8) | (ha->addr[1]);
				writel(d, ld->gmac_iobase + PORT_MC_ADDR_HIGH);

				d = (ha->addr[2] << 24) | (ha->addr[3] << 16)
				    | (ha->addr[4] << 8) | (ha->addr[5]);
				writel(d, ld->gmac_iobase + PORT_MC_ADDR_LOW);
			}
			rec_filter |= BIT_MC_MATCH_EN;
		} else {
			rec_filter &= ~BIT_MC_MATCH_EN;
		}
	}
	writel(rec_filter, ld->gmac_iobase + REC_FILT_CONTROL);
}

/* the func stop the hw desc and relaim the software skb resource
 * before reusing the gmac, you'd better reset the gmac
 */
void higmac_reclaim_rx_tx_resource(struct higmac_netdev_local *ld)
{
	unsigned long rxflags, txflags;
	int rd_offset, wr_offset;
	int i;

	higmac_irq_disable(ld);
	higmac_hw_desc_disable(ld);
	writel(STOP_RX_TX, ld->gmac_iobase + STOP_CMD);

	spin_lock_irqsave(&ld->rxlock, rxflags);
	/* rx_bq: logic write pointer */
	wr_offset = readl(ld->gmac_iobase + RX_BQ_WR_ADDR);
	/* rx_bq: software read pointer */
	rd_offset = readl(ld->gmac_iobase + RX_BQ_RD_ADDR);
	/* FIXME: prevent to reclaim skb in rx bottom half */
	writel(wr_offset, ld->gmac_iobase + RX_BQ_RD_ADDR);

	/* rx_fq: software write pointer */
	wr_offset = readl(ld->gmac_iobase + RX_FQ_WR_ADDR);
	/* rx_fq: logic read pointer */
	rd_offset = readl(ld->gmac_iobase + RX_FQ_RD_ADDR);
	if (!rd_offset)
		rd_offset = (RX_DESC_NUM - 1) << DESC_BYTE_SHIFT;
	else
		rd_offset -= DESC_SIZE;
	/* FIXME: stop to feed hw desc */
	writel(rd_offset, ld->gmac_iobase + RX_FQ_WR_ADDR);

	for (i = 0; i < ld->rx_fq.count; i++) {
		if (!ld->rx_fq.skb[i])
			ld->rx_fq.skb[i] = SKB_MAGIC;
	}
	spin_unlock_irqrestore(&ld->rxlock, rxflags);

	/* no need to wait pkts in tx_rq finish to free all skb,
	 * because higmac_xmit_reclaim is in the tx_lock,
	 */
	spin_lock_irqsave(&ld->txlock, txflags);
	/* tx_rq: logic write */
	wr_offset = readl(ld->gmac_iobase + TX_RQ_WR_ADDR);
	/* tx_rq: software read */
	rd_offset = readl(ld->gmac_iobase + TX_RQ_RD_ADDR);
	/* FIXME: stop to reclaim tx skb */
	writel(wr_offset, ld->gmac_iobase + TX_RQ_RD_ADDR);

	/* tx_bq: logic read */
	rd_offset = readl(ld->gmac_iobase + TX_BQ_RD_ADDR);
	if (!rd_offset)
		rd_offset = (TX_DESC_NUM - 1) << DESC_BYTE_SHIFT;
	else
		rd_offset -= DESC_SIZE;
	/* FIXME: stop software tx skb */
	writel(rd_offset, ld->gmac_iobase + TX_BQ_WR_ADDR);

	for (i = 0; i < ld->tx_bq.count; i++) {
		if (!ld->tx_bq.skb[i])
			ld->tx_bq.skb[i] = SKB_MAGIC;
	}
	spin_unlock_irqrestore(&ld->txlock, txflags);
}

static void higmac_monitor_func(unsigned long arg);
static void higmac_set_multicast_list(struct net_device *dev);

static void higmac_hw_set_mac_addr(struct net_device *dev)
{
	struct higmac_netdev_local *priv = netdev_priv(dev);
	unsigned char *mac = dev->dev_addr;
	u32 val;

	val = mac[1] | (mac[0] << 8);
	writel(val, priv->gmac_iobase + STATION_ADDR_HIGH);

	val = mac[5] | (mac[4] << 8) | (mac[3] << 16) | (mac[2] << 24);
	writel(val, priv->gmac_iobase + STATION_ADDR_LOW);
}

static void higmac_rx_refill(struct higmac_netdev_local *priv);

/* reset and re-config gmac */
void higmac_restart(struct higmac_netdev_local *ld)
{
	unsigned long rxflags, txflags;
	struct sk_buff *skb = NULL;
	int i;

	/* restart hw engine now */
	higmac_mac_core_reset(ld);

	spin_lock_irqsave(&ld->rxlock, rxflags);
	spin_lock_irqsave(&ld->txlock, txflags);

	for (i = 0; i < ld->rx_fq.count; i++) {
		skb = ld->rx_fq.skb[i];
		if (skb) {
			ld->rx_skb[i] = NULL;
			ld->rx_fq.skb[i] = NULL;
			if (skb == SKB_MAGIC)
				continue;
			dev_kfree_skb_any(skb);
			/* TODO: need to unmap the skb here
			 * but there is no way to get the dma_addr here,
			 * and unmap(TO_DEVICE) ops do nothing in fact,
			 * so we ignore to call
			 * dma_unmap_single(dev, dma_addr, skb->len,
			 *      DMA_TO_DEVICE)
			 */
		}
	}

	for (i = 0; i < ld->tx_bq.count; i++) {
		skb = ld->tx_bq.skb[i];
		if (skb) {
			ld->tx_skb[i] = NULL;
			ld->tx_bq.skb[i] = NULL;
			if (skb == SKB_MAGIC)
				continue;
			dev_kfree_skb_any(skb);
			/* TODO: unmap the skb */
		}
	}

	pmt_reg_restore(ld);
	higmac_hw_init(ld);
	higmac_hw_set_mac_addr(ld->netdev);
	higmac_hw_set_desc_addr(ld);

	/* we don't set macif here, it will be set in adjust_link */
	if (ld->netdev->flags & IFF_UP) {
		/* when resume, only do the following operations
		 * when dev is up before suspend.
		 */
		higmac_rx_refill(ld);
		higmac_set_multicast_list(ld->netdev);

		higmac_hw_desc_enable(ld);
		higmac_port_enable(ld);
		higmac_irq_enable(ld);
	}
	spin_unlock_irqrestore(&ld->txlock, txflags);
	spin_unlock_irqrestore(&ld->rxlock, rxflags);
}

static int higmac_net_set_mac_address(struct net_device *dev, void *p)
{
	int ret;

	ret = eth_mac_addr(dev, p);
	if (!ret)
		higmac_hw_set_mac_addr(dev);

	return ret;
}

#if defined(CONFIG_ARCH_S40) || defined(CONFIG_ARCH_HI3716MV420N)
#define HIGMAC_LINK_CHANGE_PROTECT
#endif

#ifdef HIGMAC_LINK_CHANGE_PROTECT
#define HIGMAC_MS_TO_NS (1000000ULL)
#define HIGMAC_FLUSH_WAIT_TIME (100*HIGMAC_MS_TO_NS)
/* protect code */
static void higmac_linkup_flush(struct higmac_netdev_local *ld)
{
	int tx_bq_wr_offset, tx_bq_rd_offset;
	unsigned long long time_limit, time_now;

	time_now = sched_clock();
	time_limit = time_now + HIGMAC_FLUSH_WAIT_TIME;

	do {
		tx_bq_wr_offset = readl(ld->gmac_iobase + TX_BQ_WR_ADDR);
		tx_bq_rd_offset = readl(ld->gmac_iobase + TX_BQ_RD_ADDR);

		time_now = sched_clock();
		if (unlikely((long long)time_now -
					(long long)time_limit >= 0))
			break;
	} while (tx_bq_rd_offset != tx_bq_wr_offset);

	mdelay(1);
}
#endif

static void higmac_disable_phy_eee(struct phy_device *phydev)
{
	int eee_adv;

	eee_adv = phy_read_mmd_indirect(phydev, MDIO_AN_EEE_ADV,
					MDIO_MMD_AN, phydev->addr);
	if (eee_adv <= 0)
		return;

	eee_adv &= ~(MDIO_AN_EEE_ADV_100TX | MDIO_AN_EEE_ADV_1000T);

	phy_write_mmd_indirect(phydev, MDIO_AN_EEE_ADV, MDIO_MMD_AN,
			       phydev->addr, eee_adv);
}

static void higmac_adjust_link(struct net_device *dev)
{
	struct higmac_netdev_local *priv = netdev_priv(dev);
	struct phy_device *phy = priv->phy;
	bool link_status_changed = false;

	if (phy->link) {
		if ((priv->old_speed != phy->speed) ||
		    (priv->old_duplex != phy->duplex)) {
#ifdef HIGMAC_LINK_CHANGE_PROTECT
			unsigned long txflags;

			spin_lock_irqsave(&priv->txlock, txflags);

			higmac_linkup_flush(priv);
#endif
			higmac_config_port(dev, phy->speed, phy->duplex);
#ifdef HIGMAC_LINK_CHANGE_PROTECT
			spin_unlock_irqrestore(&priv->txlock, txflags);
#endif
			if (priv->autoeee)
				init_autoeee(priv);
			else
				higmac_disable_phy_eee(priv->phy);

			link_status_changed = true;
			priv->old_link = 1;
			priv->old_speed = phy->speed;
			priv->old_duplex = phy->duplex;
		}
	} else if (priv->old_link) {
		link_status_changed = true;
		priv->old_link = 0;
		priv->old_speed = SPEED_UNKNOWN;
		priv->old_duplex = DUPLEX_UNKNOWN;
	}

	if (link_status_changed && netif_msg_link(priv))
		phy_print_status(phy);
}

int higmac_tx_avail(struct higmac_netdev_local *ld)
{
	int tx_bq_wr_offset, tx_bq_rd_offset;

	tx_bq_wr_offset = readl(ld->gmac_iobase + TX_BQ_WR_ADDR);
	tx_bq_rd_offset = readl(ld->gmac_iobase + TX_BQ_RD_ADDR);

	return (tx_bq_rd_offset >> DESC_BYTE_SHIFT) + TX_DESC_NUM
	    - (tx_bq_wr_offset >> DESC_BYTE_SHIFT) - 1;
}

static int higmac_init_sg_desc_queue(struct higmac_netdev_local *ld)
{
	ld->sg_count = ld->tx_bq.count + HIGMAC_SG_DESC_ADD;
	ld->dma_sg_desc = (struct sg_desc *)dma_alloc_coherent(ld->dev,
				ld->sg_count * sizeof(struct sg_desc),
				&ld->dma_sg_phy, GFP_KERNEL);

	if (ld->dma_sg_desc == NULL) {
		pr_err("alloc sg desc dma error!\n");
		return -ENOMEM;
	}
#ifdef HIGMAC_TSO_DEBUG
	pr_info("Higmac dma_sg_phy: 0x%p\n", (void *)ld->dma_sg_phy);
#endif

	ld->sg_head = 0;
	ld->sg_tail = 0;

	return 0;
}

static void higmac_destroy_sg_desc_queue(struct higmac_netdev_local *ld)
{
	if (ld->dma_sg_desc) {
		dma_free_coherent(ld->dev,
				  ld->sg_count * sizeof(struct sg_desc),
				  ld->dma_sg_desc, ld->dma_sg_phy);
		ld->dma_sg_desc = NULL;
	}
}

static void higmac_monitor_func(unsigned long arg)
{
	struct net_device *dev = (struct net_device *)arg;
	struct higmac_netdev_local *ld = netdev_priv(dev);
	unsigned long flags;

	if (!ld || !netif_running(dev)) {
		higmac_trace(7, "network driver is stopped.");
		return;
	}

	spin_lock_irqsave(&ld->rxlock, flags);
	higmac_rx_refill(ld);
	spin_unlock_irqrestore(&ld->rxlock, flags);

	ld->monitor.expires = jiffies + HIGMAC_MONITOR_TIMER;
	mod_timer(&ld->monitor, ld->monitor.expires);
}

static void higmac_rx_refill(struct higmac_netdev_local *priv)
{
	struct higmac_desc *desc;
	struct sk_buff *skb;
	u32 start, end, num, pos, i;
	u32 len = HIETH_MAX_FRAME_SIZE;
	dma_addr_t addr;

	/* software write pointer */
	start = dma_cnt(readl(priv->gmac_iobase + RX_FQ_WR_ADDR));
	/* logic read pointer */
	end = dma_cnt(readl(priv->gmac_iobase + RX_FQ_RD_ADDR));
	num = CIRC_SPACE(start, end, RX_DESC_NUM);

	for (i = 0, pos = start; i < num; i++) {
		if (priv->rx_fq.skb[pos] || priv->rx_skb[pos])
			break;

		skb = netdev_alloc_skb_ip_align(priv->netdev, len);
		if (unlikely(!skb))
			break;

		addr = dma_map_single(priv->dev, skb->data, len,
				      DMA_FROM_DEVICE);
		if (dma_mapping_error(priv->dev, addr)) {
			dev_kfree_skb_any(skb);
			break;
		}

		desc = priv->rx_fq.desc + pos;
		desc->data_buff_addr = addr;
		priv->rx_fq.skb[pos] = skb;
		priv->rx_skb[pos] = skb;
		if (priv->tso_supported) {
			struct higmac_tso_desc *tso_desc;

			tso_desc = (struct higmac_tso_desc *)desc;
			tso_desc->desc1.rx.buffer_len = len - 1;
			tso_desc->desc1.rx.data_len = 0;
			tso_desc->desc1.rx.fl = 0;
			tso_desc->desc1.rx.descvid = DESC_VLD_FREE;
		} else {
			desc->buffer_len = len - 1;
			desc->data_len = 0;
			desc->fl = 0;
			desc->descvid = DESC_VLD_FREE;
		}

		pos = dma_ring_incr(pos, RX_DESC_NUM);
	}

	/* This barrier is important here.  It is required to ensure
	 * the ARM CPU flushes it's DMA write buffers before proceeding
	 * to the next instruction, to ensure that GMAC will see
	 * our descriptor changes in memory
	 */
	HIGMAC_SYNC_BARRIER();

	if (pos != start)
		writel(dma_byte(pos), priv->gmac_iobase + RX_FQ_WR_ADDR);
}

#ifdef HIGMAC_TSO_DEBUG
unsigned int id_send;
unsigned int id_free;
struct send_pkt_info pkt_rec[MAX_RECORD];
#endif

static int higmac_check_tx_err(struct higmac_netdev_local *ld,
			       struct higmac_tso_desc *tx_bq_desc,
			       unsigned int desc_pos)
{
	unsigned int tx_err = tx_bq_desc->tx_err;

	if (unlikely(tx_err & ERR_ALL)) {
		struct sg_desc *desc_cur;
		int *sg_word;
		int i;

		WARN((tx_err & ERR_ALL),
		     "TX ERR: desc1=0x%x, desc2=0x%x, desc5=0x%x\n",
		     tx_bq_desc->data_buff_addr,
		     tx_bq_desc->desc1.val, tx_bq_desc->tx_err);

		desc_cur = ld->dma_sg_desc + ld->tx_bq.sg_desc_offset[desc_pos];
		sg_word = (int *)desc_cur;
		for (i = 0; i < sizeof(struct sg_desc) / sizeof(int); i++)
			pr_err("%s,%d: sg_desc word[%d]=0x%x\n",
			       __func__, __LINE__, i, sg_word[i]);

		return -1;
	}

	return 0;
}

static int higmac_xmit_release_gso(struct higmac_netdev_local *ld,
				   struct higmac_tso_desc *tx_bq_desc,
				   unsigned int desc_pos)
{
	struct sk_buff *skb = ld->tx_skb[desc_pos];
	int pkt_type;
	int nfrags = skb_shinfo(skb)->nr_frags;
	dma_addr_t addr;
	size_t len;

	if (unlikely(higmac_check_tx_err(ld, tx_bq_desc, desc_pos) < 0)) {
		/* dev_close */
		higmac_irq_disable(ld);
		higmac_hw_desc_disable(ld);

		netif_carrier_off(ld->netdev);
		netif_stop_queue(ld->netdev);

		phy_stop(ld->phy);
		del_timer_sync(&ld->monitor);
		return -1;
	}

	if (skb_is_gso(skb) || nfrags)
		pkt_type = PKT_SG;
	else
		pkt_type = PKT_NORMAL;

	if (pkt_type == PKT_NORMAL) {
		addr = tx_bq_desc->data_buff_addr;
		dma_unmap_single(ld->dev, addr, skb->len, DMA_TO_DEVICE);
	} else {
		struct sg_desc *desc_cur;
		unsigned int desc_offset;
		int i;

		desc_offset = ld->tx_bq.sg_desc_offset[desc_pos];
		BUG_ON(desc_offset != ld->sg_tail);
		desc_cur = ld->dma_sg_desc + desc_offset;

		addr = desc_cur->linear_addr;
		len = desc_cur->linear_len;
		dma_unmap_single(ld->dev, addr, len, DMA_TO_DEVICE);
		for (i = 0; i < nfrags; i++) {
			addr = desc_cur->frags[i].addr;
			len = desc_cur->frags[i].size;
			dma_unmap_page(ld->dev, addr, len, DMA_TO_DEVICE);
		}

		ld->sg_tail = (ld->sg_tail + 1) % ld->sg_count;
	}

#ifdef HIGMAC_TSO_DEBUG
	pkt_rec[id_free].status = 0;
	id_free++;
	if (id_free == MAX_RECORD)
		id_free = 0;
#endif

	return 0;
}

static void higmac_xmit_reclaim(struct net_device *dev)
{
	struct sk_buff *skb;
	struct higmac_desc *desc;
	struct higmac_tso_desc *tso_desc;
	struct higmac_netdev_local *priv = netdev_priv(dev);
	unsigned int bytes_compl = 0, pkts_compl = 0;
	u32 start, end, num, pos, i;
	dma_addr_t addr;
	int ret;

	/* software read */
	start = dma_cnt(readl(priv->gmac_iobase + TX_RQ_RD_ADDR));
	/* logic write */
	end = dma_cnt(readl(priv->gmac_iobase + TX_RQ_WR_ADDR));
	num = CIRC_CNT(end, start, TX_DESC_NUM);

	for (i = 0, pos = start; i < num; i++) {
		skb = priv->tx_skb[pos];
		if (unlikely(!skb)) {
			netdev_err(dev, "inconsistent tx_skb\n");
			break;
		}

		if (skb != priv->tx_bq.skb[pos]) {
			netdev_err(dev, "wired, tx skb[%d](%p) != skb(%p)\n",
			       pos, priv->tx_bq.skb[pos], skb);
			if (priv->tx_bq.skb[pos] == SKB_MAGIC)
				goto next;
		}

		pkts_compl++;
		bytes_compl += skb->len;
		desc = priv->tx_rq.desc + pos;
		if (priv->tso_supported) {
			tso_desc = (struct higmac_tso_desc *)desc;
			ret = higmac_xmit_release_gso(priv, tso_desc, pos);
			if (ret < 0)
				break;
		} else {
			addr = desc->data_buff_addr;
			dma_unmap_single(priv->dev, addr, skb->len,
					 DMA_TO_DEVICE);
		}
		priv->tx_bq.skb[pos] = NULL;
next:
		priv->tx_skb[pos] = NULL;
		dev_consume_skb_any(skb);
		pos = dma_ring_incr(pos, TX_DESC_NUM);
	}

	if (pos != start)
		writel(dma_byte(pos), priv->gmac_iobase + TX_RQ_RD_ADDR);

	if (pkts_compl || bytes_compl)
		netdev_completed_queue(dev, pkts_compl, bytes_compl);

	if (unlikely(netif_queue_stopped(priv->netdev)) && pkts_compl)
		netif_wake_queue(priv->netdev);
}

static void higmac_bfproc_recv(unsigned long data)
{
	struct net_device *dev = (void *)data;
	struct higmac_netdev_local *ld = netdev_priv(dev);
	struct sk_buff *skb;
	struct higmac_desc *desc;
	dma_addr_t addr;
	unsigned long flags;
	int ret = 0;
	u32 start, end, num, pos, i, len;

	spin_lock_irqsave(&ld->txlock, flags);
	higmac_xmit_reclaim(dev);
	spin_unlock_irqrestore(&ld->txlock, flags);

	spin_lock_irqsave(&ld->rxlock, flags);
	/* software read pointer */
	start = dma_cnt(readl(ld->gmac_iobase + RX_BQ_RD_ADDR));
	/* logic write pointer */
	end = dma_cnt(readl(ld->gmac_iobase + RX_BQ_WR_ADDR));
	num = CIRC_CNT(end, start, RX_DESC_NUM);

	/* ensure get updated desc */
	rmb();
	for (i = 0, pos = start; i < num; i++) {
		skb = ld->rx_skb[pos];
		if (unlikely(!skb)) {
			netdev_err(dev, "inconsistent rx_skb\n");
			break;
		}

		/* data consistent check */
		if (unlikely(skb != ld->rx_fq.skb[pos])) {
			netdev_err(dev, "desc->skb(0x%p),rx_fq.skb[%d](0x%p)\n",
			       skb, pos, ld->rx_fq.skb[pos]);
			if (ld->rx_fq.skb[pos] == SKB_MAGIC)
				goto next;
			BUG_ON(1);
		} else {
			ld->rx_fq.skb[pos] = NULL;
		}

		desc = ld->rx_bq.desc + pos;
		if (ld->tso_supported) {
			struct higmac_tso_desc *tso_desc;

			tso_desc = (struct higmac_tso_desc *)desc;
			len = tso_desc->desc1.rx.data_len;
		} else {
			len = desc->data_len;
		}

		addr = desc->data_buff_addr;
		dma_unmap_single(ld->dev, addr, HIETH_MAX_FRAME_SIZE,
				 DMA_FROM_DEVICE);

		skb_put(skb, len);

		if (skb->len > HIETH_MAX_FRAME_SIZE) {
			netdev_err(dev, "rcv len error, len = %d\n", skb->len);
			dev->stats.rx_errors++;
			dev->stats.rx_length_errors++;
			dev_kfree_skb_any(skb);
			goto next;
		}

		skb->protocol = eth_type_trans(skb, dev);
		skb->ip_summed = CHECKSUM_NONE;
#if defined(CONFIG_HIGMAC_RXCSUM)
		if (dev->features & NETIF_F_RXCSUM) {
			int hdr_csum_done =
				desc->header_csum_done;
			int payload_csum_done =
				desc->payload_csum_done;
			int hdr_csum_err =
				desc->header_csum_err;
			int payload_csum_err =
				desc->payload_csum_err;

			if (hdr_csum_done && payload_csum_done) {
				if (unlikely(hdr_csum_err ||
					     payload_csum_err)) {
					dev->stats.rx_errors++;
					dev->stats.rx_crc_errors++;
					dev_kfree_skb_any(skb);
					goto next;
				} else {
					skb->ip_summed = CHECKSUM_UNNECESSARY;
				}
			}
		}
#endif

		dev->stats.rx_packets++;
		dev->stats.rx_bytes += skb->len;
		dev->last_rx = jiffies;

		ret = netif_rx(skb);
		if (ret)
			dev->stats.rx_dropped++;
next:
		ld->rx_skb[pos] = NULL;
		pos = dma_ring_incr(pos, RX_DESC_NUM);
	}

	if (pos != start)
		writel(dma_byte(pos), ld->gmac_iobase + RX_BQ_RD_ADDR);

	higmac_rx_refill(ld);
	spin_unlock_irqrestore(&ld->rxlock, flags);
}

static irqreturn_t higmac_interrupt(int irq, void *dev_id)
{
	struct net_device *dev = (struct net_device *)dev_id;
	struct higmac_netdev_local *ld = netdev_priv(dev);
	int ints;

	higmac_irq_disable(ld);

	ints = readl(ld->gmac_iobase + RAW_PMU_INT);

	writel(ints, ld->gmac_iobase + RAW_PMU_INT);

	if (likely(ints & DEF_INT_MASK))
		tasklet_schedule(&ld->bf_recv);

	higmac_irq_enable(ld);

	return IRQ_HANDLED;
}

static int higmac_get_pkt_info(struct higmac_netdev_local *ld,
			       struct sk_buff *skb,
			       struct higmac_tso_desc *tx_bq_desc)
{
	int nfrags = skb_shinfo(skb)->nr_frags;

	__be16 l3_proto;	/* level 3 protocol */
	unsigned int l4_proto = IPPROTO_MAX;
	unsigned int mtu = 0;
	unsigned char coe_enable = 0;

	if (likely(skb->ip_summed == CHECKSUM_PARTIAL))
		coe_enable = 1;

	tx_bq_desc->desc1.val = 0;

	mtu = skb_shinfo(skb)->gso_size;

	if (skb_is_gso(skb)) {
		tx_bq_desc->desc1.tx.tso_flag = 1;
		tx_bq_desc->desc1.tx.sg_flag = 1;
	} else if (nfrags) {
		tx_bq_desc->desc1.tx.sg_flag = 1;
	}

	/* deal with VLAN flag */
	l3_proto = skb->protocol;
	if (skb->protocol == htons(ETH_P_8021Q)) {
		struct vlan_hdr *vhdr;

		vhdr = (struct vlan_hdr *)(skb->data + ETH_HLEN);
		l3_proto = vhdr->h_vlan_encapsulated_proto;
		tx_bq_desc->desc1.tx.vlan_flag = 1;
	}

	if (l3_proto == htons(ETH_P_IP)) {
		const struct iphdr *iph;

		iph = ip_hdr(skb);
		tx_bq_desc->desc1.tx.ip_ver = PKT_IPV4;
		tx_bq_desc->desc1.tx.ip_hdr_len = iph->ihl;

		mtu += iph->ihl * WORD_TO_BYTE;
		l4_proto = iph->protocol;
	} else if (l3_proto == htons(ETH_P_IPV6)) {
		const struct ipv6hdr *hdr;

		tx_bq_desc->desc1.tx.ip_ver = PKT_IPV6;
		tx_bq_desc->desc1.tx.ip_hdr_len = PKT_IPV6_HDR_LEN;
		mtu += PKT_IPV6_HDR_LEN * WORD_TO_BYTE;
		hdr = ipv6_hdr(skb);
		l4_proto = hdr->nexthdr;
	} else {
		coe_enable = 0;
		/* pr_err("unknown level 3 prot=0x%x\n", ntohs(l3_proto)); */
	}

	if (l4_proto == IPPROTO_TCP) {
		const struct tcphdr *th;

		th = tcp_hdr(skb);
		tx_bq_desc->desc1.tx.prot_type = PKT_TCP;
		tx_bq_desc->desc1.tx.prot_hdr_len = th->doff;
		mtu += th->doff * WORD_TO_BYTE;
	} else if (l4_proto == IPPROTO_UDP) {
		tx_bq_desc->desc1.tx.prot_type = PKT_UDP;
		tx_bq_desc->desc1.tx.prot_hdr_len = PKT_UDP_HDR_LEN;
		if (l3_proto == htons(ETH_P_IPV6))
			mtu += sizeof(struct frag_hdr);
	} else {
		coe_enable = 0;
		/* pr_err("unknown level 4 prot=0x%x\n", l4_proto); */
		/* TODO: when l3_proto == ETH_P_IPV6,
		 * we need to deal with IPV6 next header.
		 */
		if (l3_proto == htons(ETH_P_IPV6) &&
		    skb->ip_summed == CHECKSUM_PARTIAL)
			return -E_MAC_SW_GSO;
	}

	if (skb_is_gso(skb))
		tx_bq_desc->desc1.tx.data_len = skb_shinfo(skb)->gso_size;
	else
		tx_bq_desc->desc1.tx.data_len = skb->len;

	if (coe_enable) {
		if (skb_is_gso(skb) && (l4_proto == IPPROTO_UDP)) {
			struct ethhdr *eth;

			/* TODO: self checksum caculate */
			int offset;
			__wsum csum;
			__sum16 udp_csum;

			/* hardware can't dea with UFO broadcast packet */
			eth = (struct ethhdr *)(skb->data);
			if (unlikely(is_broadcast_ether_addr(eth->h_dest)))
				return -E_MAC_UFO_BROADCAST;

			offset = skb_checksum_start_offset(skb);
			WARN_ON(offset >= skb_headlen(skb));
			csum = skb_checksum(skb, offset, skb->len - offset, 0);

			offset += skb->csum_offset;
			BUG_ON(offset + sizeof(__sum16) > skb_headlen(skb));
			udp_csum = csum_fold(csum);
			if (udp_csum == 0)
				udp_csum = CSUM_MANGLED_0;

			*(__sum16 *)(skb->data + offset) = udp_csum;

			skb->ip_summed = CHECKSUM_NONE;
		}

		tx_bq_desc->desc1.tx.coe_flag = 1;
	}

	tx_bq_desc->desc1.tx.nfrags_num = nfrags;

	tx_bq_desc->desc1.tx.hw_own = DESC_VLD_BUSY;

	return 0;
}

static int higmac_xmit_gso(struct higmac_netdev_local *ld, struct sk_buff *skb,
			   struct higmac_tso_desc *tx_bq_desc,
			   unsigned int desc_pos)
{
	int pkt_type = PKT_NORMAL;
	int nfrags = skb_shinfo(skb)->nr_frags;
	dma_addr_t addr;
	int ret;

	if (skb_is_gso(skb) || nfrags) {
		/* TSO pkt or SG pkt */
		pkt_type = PKT_SG;
	} else {		/* Normal pkt */
		pkt_type = PKT_NORMAL;
	}

	ret = higmac_get_pkt_info(ld, skb, tx_bq_desc);
	if (unlikely(ret < 0))
		return ret;

	if (pkt_type == PKT_NORMAL) {
		addr = dma_map_single(ld->dev, skb->data, skb->len,
				      DMA_TO_DEVICE);
		ret = dma_mapping_error(ld->dev, addr);
		if (unlikely(ret)) {
			pr_err("Normal Packet DMA Mapping fail.\n");
			return -E_MAC_TX_FAIL;
		}
		tx_bq_desc->data_buff_addr = addr;
	} else {
		struct sg_desc *desc_cur;
		int i;

		if (unlikely(((ld->sg_head + 1) % ld->sg_count) ==
			     ld->sg_tail)) {
			/* SG pkt, but sg desc all used */
			pr_err("WARNING: sg desc all used.\n");
			return -E_MAC_TX_FAIL;
		}

		desc_cur = ld->dma_sg_desc + ld->sg_head;

		/* TODO: deal with ipv6_id */
		if (tx_bq_desc->desc1.tx.tso_flag &&
		    tx_bq_desc->desc1.tx.ip_ver == PKT_IPV6 &&
		    tx_bq_desc->desc1.tx.prot_type == PKT_UDP) {
			desc_cur->ipv6_id = ntohl(skb_shinfo(skb)->ip6_frag_id);
		}

		desc_cur->total_len = skb->len;
		desc_cur->linear_len = skb_headlen(skb);
		addr = dma_map_single(ld->dev, skb->data, desc_cur->linear_len,
				      DMA_TO_DEVICE);
		ret = dma_mapping_error(ld->dev, addr);
		if (unlikely(ret)) {
			pr_err("DMA Mapping fail.");
			return -E_MAC_TX_FAIL;
		}
		desc_cur->linear_addr = addr;

		for (i = 0; i < nfrags; i++) {
			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
			int len = frag->size;

			addr = skb_frag_dma_map(ld->dev, frag, 0, len,
						DMA_TO_DEVICE);
			ret = dma_mapping_error(ld->dev, addr);
			if (unlikely(ret)) {
				pr_err("skb frag DMA Mapping fail.");
				return -E_MAC_TX_FAIL;
			}
			desc_cur->frags[i].addr = addr;
			desc_cur->frags[i].size = len;
		}
		tx_bq_desc->data_buff_addr = ld->dma_sg_phy +
		    ld->sg_head * sizeof(struct sg_desc);
		ld->tx_bq.sg_desc_offset[desc_pos] = ld->sg_head;

		ld->sg_head = (ld->sg_head + 1) % ld->sg_count;
	}

#ifdef HIGMAC_TSO_DEBUG
	memcpy(&pkt_rec[id_send].desc, tx_bq_desc,
	       sizeof(struct higmac_tso_desc));
	pkt_rec[id_send].status = 1;
	id_send++;
	if (id_send == MAX_RECORD)
		id_send = 0;
#endif
	return 0;
}

static netdev_tx_t higmac_net_xmit(struct sk_buff *skb, struct net_device *dev);

static netdev_tx_t higmac_sw_gso(struct higmac_netdev_local *ld,
				 struct sk_buff *skb)
{
	struct sk_buff *segs, *curr_skb;
	int gso_segs = skb_shinfo(skb)->gso_segs;

	if (gso_segs == 0 && skb_shinfo(skb)->gso_size != 0)
		gso_segs = DIV_ROUND_UP(skb->len, skb_shinfo(skb)->gso_size);

	/* Estimate the number of fragments in the worst case */
	if (unlikely(higmac_tx_avail(ld) < gso_segs)) {
		netif_stop_queue(ld->netdev);
		if (higmac_tx_avail(ld) < gso_segs) {
			ld->netdev->stats.tx_dropped++;
			ld->netdev->stats.tx_fifo_errors++;
			return NETDEV_TX_BUSY;
		}

		netif_wake_queue(ld->netdev);
	}

	segs = skb_gso_segment(skb, ld->netdev->features &
			       ~(NETIF_F_ALL_CSUM | NETIF_F_GSO_SOFTWARE));

	if (IS_ERR(segs))
		goto drop;

	do {
		curr_skb = segs;
		segs = segs->next;
		curr_skb->next = NULL;
		higmac_net_xmit(curr_skb, ld->netdev);
	} while (segs);

	dev_kfree_skb_any(skb);
	return NETDEV_TX_OK;

drop:
	dev_kfree_skb_any(skb);
	ld->netdev->stats.tx_dropped++;
	return NETDEV_TX_OK;
}

static netdev_tx_t higmac_net_xmit(struct sk_buff *skb, struct net_device *dev)
{
	struct higmac_netdev_local *ld = netdev_priv(dev);
	struct higmac_desc *desc;
	dma_addr_t addr;
	unsigned long txflags;
	int ret;
	u32 pos;

	/* if adding higmac_xmit_reclaim here, iperf tcp client
	 * performance will be affected, from 550M(avg) to 513M~300M
	 */

	/* software write pointer */
	pos = dma_cnt(readl(ld->gmac_iobase + TX_BQ_WR_ADDR));

	spin_lock_irqsave(&ld->txlock, txflags);

	if (unlikely(ld->tx_skb[pos] || ld->tx_bq.skb[pos])) {
		dev->stats.tx_dropped++;
		dev->stats.tx_fifo_errors++;
		netif_stop_queue(dev);
		spin_unlock_irqrestore(&ld->txlock, txflags);

		return NETDEV_TX_BUSY;
	}

	ld->tx_bq.skb[pos] = skb;
	ld->tx_skb[pos] = skb;

	desc = ld->tx_bq.desc + pos;

	if (ld->tso_supported) {
		ret = higmac_xmit_gso(ld, skb,
				      (struct higmac_tso_desc *)desc,
				      pos);
		if (unlikely(ret < 0)) {
			ld->tx_skb[pos] = NULL;
			ld->tx_bq.skb[pos] = NULL;
			spin_unlock_irqrestore(&ld->txlock, txflags);

			if (ret == -E_MAC_SW_GSO || ret == -E_MAC_UFO_BROADCAST)
				return higmac_sw_gso(ld, skb);

			dev_kfree_skb_any(skb);
			dev->stats.tx_dropped++;
			return NETDEV_TX_OK;
		}
	} else {
		addr = dma_map_single(ld->dev, skb->data, skb->len,
				       DMA_TO_DEVICE);
		if (unlikely(dma_mapping_error(ld->dev, addr))) {
			dev_kfree_skb_any(skb);
			dev->stats.tx_dropped++;
			ld->tx_skb[pos] = NULL;
			ld->tx_bq.skb[pos] = NULL;
			spin_unlock_irqrestore(&ld->txlock, txflags);
			return NETDEV_TX_OK;
		}
		desc->data_buff_addr = addr;
		desc->buffer_len = HIETH_MAX_FRAME_SIZE - 1;
		desc->data_len = skb->len;
		desc->fl = DESC_FL_FULL;
		desc->descvid = DESC_VLD_BUSY;
	}

	/* This barrier is important here.  It is required to ensure
	 * the ARM CPU flushes it's DMA write buffers before proceeding
	 * to the next instruction, to ensure that GMAC will see
	 * our descriptor changes in memory
	 */
	HIGMAC_SYNC_BARRIER();

	pos = dma_ring_incr(pos, TX_DESC_NUM);
	writel(dma_byte(pos), ld->gmac_iobase + TX_BQ_WR_ADDR);

	dev->trans_start = jiffies;
	dev->stats.tx_packets++;
	dev->stats.tx_bytes += skb->len;
	netdev_sent_queue(dev, skb->len);

	spin_unlock_irqrestore(&ld->txlock, txflags);

	return NETDEV_TX_OK;
}

static int higmac_net_open(struct net_device *dev)
{
	struct higmac_netdev_local *ld = netdev_priv(dev);
	unsigned long flags;

	clk_prepare_enable(ld->macif_clk);
	clk_prepare_enable(ld->clk);

	/* If we configure mac address by
	 * "ifconfig ethX hw ether XX:XX:XX:XX:XX:XX",
	 * the ethX must be down state and mac core clock is disabled
	 * which results the mac address has not been configured
	 * in mac core register.
	 * So we must set mac address again here,
	 * because mac core clock is enabled at this time
	 * and we can configure mac address to mac core register.
	 */
	higmac_hw_set_mac_addr(dev);

	/* We should use netif_carrier_off() here,
	 * because the default state should be off.
	 * And this call should before phy_start().
	 */
	netif_carrier_off(dev);
	phy_start(ld->phy);

	higmac_hw_desc_enable(ld);
	higmac_port_enable(ld);
	higmac_irq_enable(ld);

	spin_lock_irqsave(&ld->rxlock, flags);
	higmac_rx_refill(ld);
	spin_unlock_irqrestore(&ld->rxlock, flags);

	ld->monitor.expires = jiffies + HIGMAC_MONITOR_TIMER;
	mod_timer(&ld->monitor, ld->monitor.expires);

	netdev_reset_queue(dev);
	netif_start_queue(dev);

	return 0;
}

static int higmac_net_close(struct net_device *dev)
{
	struct higmac_netdev_local *ld = netdev_priv(dev);

	higmac_irq_disable(ld);
	higmac_hw_desc_disable(ld);

	netif_carrier_off(dev);
	netif_stop_queue(dev);

	phy_stop(ld->phy);
	del_timer_sync(&ld->monitor);

	clk_disable_unprepare(ld->clk);
	clk_disable_unprepare(ld->macif_clk);

	return 0;
}

static void higmac_net_timeout(struct net_device *dev)
{
	dev->stats.tx_errors++;

	pr_err("tx timeout!\n");
}

static void higmac_set_multicast_list(struct net_device *dev)
{
	higmac_gmac_multicast_list(dev);
}

static inline void higmac_enable_rxcsum_drop(struct higmac_netdev_local *ld,
					     bool drop)
{
	unsigned int v;

	v = readl(ld->gmac_iobase + TSO_COE_CTRL);
	if (drop)
		v |= COE_ERR_DROP;
	else
		v &= ~COE_ERR_DROP;
	writel(v, ld->gmac_iobase + TSO_COE_CTRL);
}

static int higmac_set_features(struct net_device *dev,
			       netdev_features_t features)
{
	struct higmac_netdev_local *ld = netdev_priv(dev);
	netdev_features_t changed = dev->features ^ features;

	if (changed & NETIF_F_RXCSUM) {
		if (features & NETIF_F_RXCSUM)
			higmac_enable_rxcsum_drop(ld, true);
		else
			higmac_enable_rxcsum_drop(ld, false);
	}

	return 0;
}

static struct net_device_stats *higmac_net_get_stats(struct net_device *dev)
{
	return &dev->stats;
}

static void higmac_get_drvinfo(struct net_device *net_dev,
			       struct ethtool_drvinfo *info)
{
	strncpy(info->driver, "higmac driver", 15);
	strncpy(info->version, "higmac v200", 15);
	strncpy(info->bus_info, "platform", 15);
}

static unsigned int higmac_get_link(struct net_device *net_dev)
{
	struct higmac_netdev_local *ld = netdev_priv(net_dev);

	return ld->phy->link ? HIGMAC_LINKED : 0;
}

static int higmac_get_settings(struct net_device *net_dev,
			       struct ethtool_cmd *cmd)
{
	struct higmac_netdev_local *ld = netdev_priv(net_dev);

	if (ld->phy)
		return phy_ethtool_gset(ld->phy, cmd);

	return -EINVAL;
}

static int higmac_set_settings(struct net_device *net_dev,
			       struct ethtool_cmd *cmd)
{
	struct higmac_netdev_local *ld = netdev_priv(net_dev);

	if (!capable(CAP_NET_ADMIN))
		return -EPERM;

	if (ld->phy)
		return phy_ethtool_sset(ld->phy, cmd);

	return -EINVAL;
}

static u32 higmac_ethtool_getmsglevel(struct net_device *ndev)
{
	struct higmac_netdev_local *priv = netdev_priv(ndev);

	return priv->msg_enable;
}

static void higmac_ethtool_setmsglevel(struct net_device *ndev, u32 level)
{
	struct higmac_netdev_local *priv = netdev_priv(ndev);

	priv->msg_enable = level;
}

static struct ethtool_ops hieth_ethtools_ops = {
	.get_drvinfo = higmac_get_drvinfo,
	.get_link = higmac_get_link,
	.get_settings = higmac_get_settings,
	.set_settings = higmac_set_settings,
	.get_msglevel = higmac_ethtool_getmsglevel,
	.set_msglevel = higmac_ethtool_setmsglevel,
};

static const struct net_device_ops hieth_netdev_ops = {
	.ndo_open = higmac_net_open,
	.ndo_stop = higmac_net_close,
	.ndo_start_xmit = higmac_net_xmit,
	.ndo_tx_timeout = higmac_net_timeout,
	.ndo_set_rx_mode = higmac_set_multicast_list,
	.ndo_set_features = higmac_set_features,
	.ndo_do_ioctl = higmac_ioctl,
	.ndo_set_mac_address = higmac_net_set_mac_address,
	.ndo_change_mtu = eth_change_mtu,
	.ndo_get_stats = higmac_net_get_stats,
};

static int higmac_of_get_param(struct higmac_netdev_local *ld,
			       struct device_node *node)
{
	struct device_node *child = NULL;
	int data;

	/* get auto eee */
	ld->autoeee = of_property_read_bool(node, "autoeee");
	/* get internal flag */
	ld->internal_phy =
		of_property_read_bool(node, "internal-phy");
	if (ld->internal_phy) {
		ld->crg_iobase = ioremap_nocache(REG_BASE_CRG, 0x1000);
		ld->peri_iobase = ioremap_nocache(REG_BASE_PERI_CTRL, 0x1000);
	}

	/* get gpio_base and bit */
	of_property_read_u32(node, "phy-gpio-base",
			(u32 *)(&ld->gpio_base));
	of_property_read_u32(node, "phy-gpio-bit",
			&ld->gpio_bit);

	child = of_get_next_available_child(node, NULL);
	WARN_ON(child == NULL);

	/* get phy-addr */
	if (of_property_read_u32(child, "reg", &data)) {
		pr_err("%s has not config PHY address\n",
		       child->full_name);
		return -EINVAL;
	}
	if ((data < 0) || (data >= PHY_MAX_ADDR)) {
		pr_err("%s has invalid PHY address=%d\n",
		       child->full_name, data);
		return -EINVAL;
	}

	ld->phy_addr = data;

	child = of_get_next_available_child(node, child);
	WARN_ON(child != NULL);

	return 0;
}

static void higmac_destroy_hw_desc_queue(struct higmac_netdev_local *priv)
{
	int i;

	for (i = 0; i < QUEUE_NUMS; i++) {
		if (priv->pool[i].desc) {
			dma_free_coherent(priv->dev, priv->pool[i].size,
					  priv->pool[i].desc,
					  priv->pool[i].phys_addr);
			priv->pool[i].desc = NULL;
		}
	}

	kfree(priv->rx_fq.skb);
	kfree(priv->tx_bq.skb);
	priv->rx_fq.skb = NULL;
	priv->tx_bq.skb = NULL;

	if (priv->tso_supported) {
		kfree(priv->tx_bq.sg_desc_offset);
		priv->tx_bq.sg_desc_offset = NULL;
	}

	kfree(priv->tx_skb);
	priv->tx_skb = NULL;

	kfree(priv->rx_skb);
	priv->rx_skb = NULL;
}

static int higmac_init_hw_desc_queue(struct higmac_netdev_local *priv)
{
	struct device *dev = priv->dev;
	struct higmac_desc *virt_addr;
	dma_addr_t phys_addr;
	int size, i;

	priv->rx_fq.count = RX_DESC_NUM;
	priv->rx_bq.count = RX_DESC_NUM;
	priv->tx_bq.count = TX_DESC_NUM;
	priv->tx_rq.count = TX_DESC_NUM;

	for (i = 0; i < QUEUE_NUMS; i++) {
		size = priv->pool[i].count * sizeof(struct higmac_desc);
		virt_addr = dma_alloc_coherent(dev, size, &phys_addr,
					       GFP_KERNEL);
		if (virt_addr == NULL)
			goto error_free_pool;

		memset(virt_addr, 0, size);
		priv->pool[i].size = size;
		priv->pool[i].desc = virt_addr;
		priv->pool[i].phys_addr = phys_addr;
	}
	priv->rx_fq.skb = kzalloc(priv->rx_fq.count
				* sizeof(struct sk_buff *), GFP_KERNEL);
	if (priv->rx_fq.skb == NULL)
		goto error_free_pool;

	priv->rx_skb = kzalloc(priv->rx_fq.count
			     * sizeof(struct sk_buff *), GFP_KERNEL);
	if (priv->rx_skb == NULL)
		goto error_free_pool;

	priv->tx_bq.skb = kzalloc(priv->tx_bq.count
				* sizeof(struct sk_buff *), GFP_KERNEL);
	if (priv->tx_bq.skb == NULL)
		goto error_free_pool;

	priv->tx_skb = kzalloc(priv->tx_bq.count
			     * sizeof(struct sk_buff *), GFP_KERNEL);
	if (priv->tx_skb == NULL)
		goto error_free_pool;

	if (priv->tso_supported) {
		priv->tx_bq.sg_desc_offset = kzalloc(priv->tx_bq.count
						   * sizeof(int), GFP_KERNEL);
		if (priv->tx_bq.sg_desc_offset == NULL)
			goto error_free_pool;
	}

	higmac_hw_set_desc_addr(priv);

	return 0;

error_free_pool:
	higmac_destroy_hw_desc_queue(priv);

	return -ENOMEM;
}

static int higmac_dev_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct device_node *node = dev->of_node;
	struct net_device *ndev;
	struct higmac_netdev_local *priv;
	struct resource *res;
	struct mii_bus *bus;
	const char *mac_addr;
	unsigned int tso_ver;
	int ret;
	struct cpumask cpumask;

	ndev = alloc_etherdev(sizeof(struct higmac_netdev_local));
	if (!ndev)
		return -ENOMEM;

	platform_set_drvdata(pdev, ndev);

	priv = netdev_priv(ndev);
	priv->dev = dev;
	priv->netdev = ndev;

	higmac_of_get_param(priv, node);

	res = platform_get_resource(pdev, IORESOURCE_MEM, MEM_GMAC_IOBASE);
	priv->gmac_iobase = devm_ioremap_resource(dev, res);
	if (IS_ERR(priv->gmac_iobase)) {
		ret = PTR_ERR(priv->gmac_iobase);
		goto out_free_netdev;
	}

	res = platform_get_resource(pdev, IORESOURCE_MEM,
				    MEM_MACIF_IOBASE);
	priv->macif_base = devm_ioremap_resource(dev, res);
	if (IS_ERR(priv->macif_base)) {
		ret = PTR_ERR(priv->macif_base);
		goto out_free_netdev;
	}

	priv->port_rst = devm_reset_control_get(dev, HIGMAC_PORT_RST_NAME);
	if (IS_ERR(priv->port_rst)) {
		ret = PTR_ERR(priv->port_rst);
		goto out_free_netdev;
	}

	priv->macif_rst = devm_reset_control_get(dev, HIGMAC_MACIF_RST_NAME);
	if (IS_ERR(priv->macif_rst)) {
		ret = PTR_ERR(priv->macif_rst);
		goto out_free_netdev;
	}

	priv->phy_rst = devm_reset_control_get(dev, HIGMAC_PHY_RST_NAME);
	if (IS_ERR(priv->phy_rst))
		priv->phy_rst = NULL;

	priv->pub_clk = devm_clk_get(&pdev->dev, "pub_clk");
	if (IS_ERR(priv->pub_clk))
		priv->pub_clk = NULL;

	priv->clk = devm_clk_get(&pdev->dev, HIGMAC_MAC_CLK_NAME);
	if (IS_ERR(priv->clk)) {
		dev_err(dev, "failed to get clk\n");
		ret = -ENODEV;
		goto out_free_netdev;
	}

	/* phy reset, should be early than "of_mdiobus_register".
	 * becausue "of_mdiobus_register" will read PHY register by MDIO.
	 */
	higmac_hw_phy_reset(priv);

	ret = clk_prepare_enable(priv->pub_clk);
	if (ret < 0) {
		dev_err(dev, "failed to enable clk %d\n", ret);
		goto out_free_netdev;
	}

	ret = clk_prepare_enable(priv->clk);
	if (ret < 0) {
		dev_err(dev, "failed to enable clk %d\n", ret);
		goto out_free_netdev;
	}

	priv->macif_clk = devm_clk_get(&pdev->dev, HIGMAC_MACIF_CLK_NAME);
	if (IS_ERR(priv->macif_clk))
		priv->macif_clk = NULL;

	ret = clk_prepare_enable(priv->macif_clk);
	if (ret < 0) {
		dev_err(dev, "failed enable macif_clk %d\n", ret);
		goto out_clk_disable;
	}

	higmac_mac_core_reset(priv);

	bus = mdiobus_alloc();
	if (bus == NULL) {
		ret = -ENOMEM;
		goto out_macif_clk_disable;
	}

	bus->priv = priv;
	bus->name = "higmac_mii_bus";
	bus->read = higmac_mdio_read;
	bus->write = higmac_mdio_write;
	bus->parent = &pdev->dev;
	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
	priv->bus = bus;

	if (priv->internal_phy) {
		usleep_range(5000, 8000);
		higmac_internal_fephy_trim();
	}

	ret = of_mdiobus_register(bus, node);
	if (ret)
		goto err_free_mdio;

	priv->phy_mode = of_get_phy_mode(node);
	if (priv->phy_mode < 0) {
		dev_err(dev, "not find phy-mode\n");
		ret = -EINVAL;
		goto err_mdiobus;
	}

	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
	if (!priv->phy_node) {
		dev_err(dev, "not find phy-handle\n");
		ret = -EINVAL;
		goto err_mdiobus;
	}

	mac_addr = of_get_mac_address(node);
	if (mac_addr)
		ether_addr_copy(ndev->dev_addr, mac_addr);
	if (!is_valid_ether_addr(ndev->dev_addr)) {
		eth_hw_addr_random(ndev);
		netdev_warn(ndev, "using random MAC address %pM\n",
			    ndev->dev_addr);
	}

	higmac_hw_set_mac_addr(ndev);

	/* init hw controller */
	higmac_hw_init(priv);

	/* TODO: phy fix here?? other way ??? */
	phy_register_fixups();

	priv->phy = of_phy_connect(ndev, priv->phy_node,
				   &higmac_adjust_link, 0, priv->phy_mode);
	if (!priv->phy) {
		ret = -ENODEV;
		goto out_phy_node;
	}

	/* If the phy_id is mostly Fs, there is no device there */
	if ((priv->phy->phy_id & 0x1fffffff) == 0x1fffffff ||
	    priv->phy->phy_id == 0) {
		pr_info("phy %d not found\n", priv->phy->addr);
		ret = -ENODEV;
		goto out_phy_disconnect;
	}

	pr_info("attached PHY %d to driver %s, PHY_ID=0x%x\n",
		priv->phy->addr, priv->phy->drv->name, priv->phy->phy_id);

	/* Stop Advertising 1000BASE Capability if interface is not RGMII */
	if ((priv->phy_mode == PHY_INTERFACE_MODE_MII) ||
	    (priv->phy_mode == PHY_INTERFACE_MODE_RMII)) {
		priv->phy->advertising &= ~(SUPPORTED_1000baseT_Half |
					    SUPPORTED_1000baseT_Full);

		/* Internal FE phy's reg BMSR bit8 is wrong, make the kernel
		 * believe it has the 1000base Capability, so fix it here
		 */
		if (priv->phy->phy_id == HISILICON_PHY_ID_FESTAV200)
			priv->phy->supported &= ~(ADVERTISED_1000baseT_Full |
						  ADVERTISED_1000baseT_Half);
	}

	if (priv->autoeee)
		init_autoeee(priv);
	else
		higmac_disable_phy_eee(priv->phy);

	ndev->irq = platform_get_irq(pdev, 0);
	if (ndev->irq <= 0) {
		dev_err(dev, "No irq resource\n");
		ret = -EINVAL;
		goto out_phy_disconnect;
	}

	ret = devm_request_irq(dev, ndev->irq, higmac_interrupt,
			       IRQF_SHARED, pdev->name, ndev);
	if (ret) {
		dev_err(dev, "devm_request_irq failed\n");
		goto out_phy_disconnect;
	}

	/* set irq affinity */
	if ((num_online_cpus() > HIGMAC_IRQ_AFFINITY_CPU) &&
	    cpu_online(HIGMAC_IRQ_AFFINITY_CPU)) {
		cpumask_clear(&cpumask);
		cpumask_set_cpu(HIGMAC_IRQ_AFFINITY_CPU, &cpumask);
		irq_set_affinity(ndev->irq, &cpumask);
	}

	spin_lock_init(&priv->rxlock);
	spin_lock_init(&priv->txlock);
	spin_lock_init(&priv->pmtlock);

	/* init netdevice */
	SET_NETDEV_DEV(ndev, dev);	/* init ndev */
	ndev->watchdog_timeo = 3 * HZ;
	ndev->netdev_ops = &hieth_netdev_ops;
	ndev->ethtool_ops = &hieth_ethtools_ops;

	tso_ver = readl(priv->gmac_iobase + CRF_MIN_PACKET);
	tso_ver = (tso_ver >> BIT_OFFSET_TSO_VERSION) & BIT_MASK_TSO_VERSION;

	if (tso_ver == VER_TSO) {
		priv->tso_supported = true;
		ndev->hw_features |= NETIF_F_SG |
			NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
			NETIF_F_TSO | NETIF_F_TSO6 | NETIF_F_UFO;
	}
#if defined(CONFIG_HIGMAC_RXCSUM)
	ndev->hw_features |= NETIF_F_RXCSUM;
	higmac_enable_rxcsum_drop(priv, true);
#endif

	ndev->features |= ndev->hw_features;
	ndev->features |= NETIF_F_HIGHDMA | NETIF_F_GSO;
	ndev->vlan_features |= ndev->features;

	/* init tasklet */
	priv->bf_recv.next = NULL;
	priv->bf_recv.state = 0;
	priv->bf_recv.func = higmac_bfproc_recv;
	priv->bf_recv.data = (unsigned long)ndev;
	atomic_set(&priv->bf_recv.count, 0);

	init_timer(&priv->monitor);
	priv->monitor.function = higmac_monitor_func;
	priv->monitor.data = (unsigned long)ndev;
	priv->monitor.expires = jiffies + HIGMAC_MONITOR_TIMER;

	device_set_wakeup_capable(priv->dev, 1);
	/* TODO: when we can let phy powerdown?
	 * In some mode, we don't want phy powerdown,
	 * so I set wakeup enable all the time
	 */
	device_set_wakeup_enable(priv->dev, 1);

	priv->wol_enable = false;

	priv->msg_enable = netif_msg_init(debug, DEFAULT_MSG_ENABLE);

	/* init hw desc queue */
	ret = higmac_init_hw_desc_queue(priv);
	if (ret)
		goto _error_hw_desc_queue;

	if (priv->tso_supported) {
		ret = higmac_init_sg_desc_queue(priv);
		if (ret)
			goto _error_sg_desc_queue;
	}

	/* register netdevice */
	ret = register_netdev(priv->netdev);
	if (ret) {
		pr_err("register_ndev failed!");
		goto _error_sg_desc_queue;
	}

	clk_disable_unprepare(priv->clk);
	clk_disable_unprepare(priv->macif_clk);

	pr_info("ETH: %s, phy_addr=%d\n",
		phy_modes(priv->phy_mode), priv->phy->addr);

	return ret;

_error_sg_desc_queue:
	if (priv->tso_supported)
		higmac_destroy_sg_desc_queue(priv);

_error_hw_desc_queue:
	higmac_destroy_hw_desc_queue(priv);
	devm_free_irq(dev, ndev->irq, ndev);
out_phy_disconnect:
	phy_disconnect(priv->phy);
out_phy_node:
	of_node_put(priv->phy_node);
err_mdiobus:
	mdiobus_unregister(bus);
err_free_mdio:
	mdiobus_free(bus);
out_macif_clk_disable:
	clk_disable_unprepare(priv->macif_clk);
out_clk_disable:
	clk_disable_unprepare(priv->clk);
out_free_netdev:
	if (priv->internal_phy) {
		iounmap(priv->crg_iobase);
		iounmap(priv->peri_iobase);
	}
	free_netdev(ndev);

	return ret;
}

static int higmac_dev_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct net_device *ndev = platform_get_drvdata(pdev);
	struct higmac_netdev_local *priv = netdev_priv(ndev);

	/* TODO: stop the gmac and free all resource */
	del_timer_sync(&priv->monitor);
	tasklet_disable(&priv->bf_recv);

	unregister_netdev(ndev);

	higmac_reclaim_rx_tx_resource(priv);

	if (priv->tso_supported)
		higmac_destroy_sg_desc_queue(priv);
	higmac_destroy_hw_desc_queue(priv);

	devm_free_irq(dev, ndev->irq, ndev);

	phy_disconnect(priv->phy);
	of_node_put(priv->phy_node);

	mdiobus_unregister(priv->bus);
	mdiobus_free(priv->bus);

	clk_disable_unprepare(priv->pub_clk);
	free_netdev(ndev);

	return 0;
}

#include "pm.c"
#ifdef CONFIG_PM

int higmac_dev_suspend(struct platform_device *pdev, pm_message_t state)
{
	struct net_device *ndev = platform_get_drvdata(pdev);
	struct higmac_netdev_local *priv = netdev_priv(ndev);

	disable_irq(ndev->irq);
	/* If support Wake on LAN, we should not disconnect phy
	 * because it will call phy_suspend to power down phy.
	 */
	if (!priv->wol_enable)
		phy_disconnect(priv->phy);
	del_timer_sync(&priv->monitor);
	tasklet_disable(&priv->bf_recv);
	netif_device_detach(ndev);

	netif_carrier_off(ndev);

	/* If netdev is down, MAC clock is disabled.
	 * So if we want to reclaim MAC rx and tx resource,
	 * we must first enable MAC clock and then disable it.
	 */
	if (!(ndev->flags & IFF_UP))
		clk_prepare_enable(priv->clk);

	higmac_reclaim_rx_tx_resource(priv);

	if (!(ndev->flags & IFF_UP))
		clk_disable_unprepare(priv->clk);

	pmt_enter(priv);

	if (!priv->wol_enable) {	/* if no WOL, then poweroff */
		/* pr_info("power off gmac.\n"); */
		/* no need to call genphy_resume() in resume,
		 * because we reset everything
		 */
		genphy_suspend(priv->phy);	/* power down phy */
		msleep(20);
		higmac_hw_all_clk_disable(priv);
	}

	return 0;
}
EXPORT_SYMBOL(higmac_dev_suspend);

int higmac_dev_resume(struct platform_device *pdev)
{
	struct net_device *ndev = platform_get_drvdata(pdev);
	struct higmac_netdev_local *priv = netdev_priv(ndev);

	/* make sure MAC_PUB_CLK is always on,
	 * even if the suspend/resume power down CRG and
	 * disable all the GSF clock bit. */
	clk_disable_unprepare(priv->pub_clk);
	clk_prepare_enable(priv->pub_clk);

	/* If we support Wake on LAN, we doesn't call clk_disable.
	 * But when we resume, the uboot may off mac clock and reset phy
	 * by re-write the mac CRG register.
	 * So we first call clk_disable, and then clk_enable.
	 */
	if (priv->wol_enable)
		higmac_hw_all_clk_disable(priv);

	/* internal FE_PHY: enable clk and reset  */
	higmac_hw_phy_reset(priv);
	higmac_hw_all_clk_enable(priv);
	if (priv->internal_phy) {
		usleep_range(5000, 8000);
		higmac_internal_fephy_trim();
	}

	/* If netdev is down, MAC clock is disabled.
	 * So if we want to restart MAC and re-initialize it,
	 * we must first enable MAC clock and then disable it.
	 */
	if (!(ndev->flags & IFF_UP))
		clk_prepare_enable(priv->clk);

	/* power on gmac */
	higmac_restart(priv);

	/* If support WoL, we didn't disconnect phy.
	 * But when we resume, we reset PHY, so we want to
	 * call phy_connect to make phy_fixup excuted.
	 * This is important for internal PHY fix.
	 */
	if (priv->wol_enable)
		phy_disconnect(priv->phy);

	phy_connect_direct(ndev, priv->phy, higmac_adjust_link, priv->phy_mode);

	/* If we suspend and resume when net device is down,
	 * some operations are unnecessary.
	 */
	if (ndev->flags & IFF_UP) {
		priv->monitor.expires = jiffies + HIGMAC_MONITOR_TIMER;
		mod_timer(&priv->monitor, priv->monitor.expires);
		priv->old_link = 0;
		priv->old_speed = SPEED_UNKNOWN;
		priv->old_duplex = DUPLEX_UNKNOWN;
	}
	tasklet_enable(&priv->bf_recv);
	netif_device_attach(ndev);
	if (ndev->flags & IFF_UP)
		phy_start(priv->phy);
	enable_irq(ndev->irq);

	pmt_exit(priv);

	if (!(ndev->flags & IFF_UP))
		clk_disable_unprepare(priv->clk);

	return 0;
}
EXPORT_SYMBOL(higmac_dev_resume);
#else
#define higmac_dev_suspend	NULL
#define higmac_dev_resume	NULL
#endif

static const struct of_device_id higmac_of_match[] = {
	{.compatible = "hisilicon,higmac",},
	{},
};

MODULE_DEVICE_TABLE(of, higmac_of_match);

static struct platform_driver higmac_dev_driver = {
	.probe = higmac_dev_probe,
	.remove = higmac_dev_remove,
	.suspend = higmac_dev_suspend,
	.resume = higmac_dev_resume,
	.driver = {
		   .owner = THIS_MODULE,
		   .name = HIGMAC_DRIVER_NAME,
		   .of_match_table = higmac_of_match,
		   },
};

#include "proc-dev.c"

static int __init higmac_init(void)
{
	int ret = 0;

	ret = platform_driver_register(&higmac_dev_driver);
	if (ret)
		return ret;

	higmac_proc_create();

	return ret;
}

static void __exit higmac_exit(void)
{
	platform_driver_unregister(&higmac_dev_driver);

	higmac_proc_destroy();
}

module_init(higmac_init);
module_exit(higmac_exit);

MODULE_AUTHOR("ZMJUN");
MODULE_DESCRIPTION("Hisilicon double GMAC driver, base on driver higmacv200 by CHH");
MODULE_LICENSE("GPL v2");
