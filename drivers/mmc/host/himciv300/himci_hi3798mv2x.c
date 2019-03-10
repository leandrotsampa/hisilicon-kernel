/* Phase details */
#define SDIO_DRV_PS_MASK                   (0x7 << 16)
#define SDIO_DRV_PS_0_0                    (0b000 << 16)
#define SDIO_DRV_PS_45_22DOT5              (0b001 << 16)
#define SDIO_DRV_PS_90_45                  (0b010 << 16)
#define SDIO_DRV_PS_135_67DOT5             (0b011 << 16)
#define SDIO_DRV_PS_180_90                 (0b100 << 16)
#define SDIO_DRV_PS_225_112DOT5            (0b101 << 16)
#define SDIO_DRV_PS_270_145                (0b110 << 16)
#define SDIO_DRV_PS_315_167DOT5            (0b111 << 16)

#define SDIO_SAP_PS_SHIFT_BIT              (12)
#define EMMC_CLK_MODE                	   (0x1 << 19)
#define SDIO_SAP_PS_NUM                    (8)
#define SDIO_SAP_PS_MASK                   (0x7 << 12)
#define SDIO_SAP_PS_OFFSET                 (12)
#define SDIO_SAP_PS_0_0                    (0b000 << 12)
#define SDIO_SAP_PS_45_22DOT5              (0b001 << 12)
#define SDIO_SAP_PS_90_45                  (0b010 << 12)
#define SDIO_SAP_PS_135_67DOT5             (0b011 << 12)
#define SDIO_SAP_PS_180_90                 (0b100 << 12)
#define SDIO_SAP_PS_225_112DOT5            (0b101 << 12)
#define SDIO_SAP_PS_270_145                (0b110 << 12)
#define SDIO_SAP_PS_315_167DOT5            (0b111 << 12)

/* Driver caps details */
#define DRV_CAPS_MASK                       (0xf << 4)
#define DRV_SLEV_RATE                       BIT(8)

#define EMMC_DRV_CAP_DDR50_CMD_DATA         (0b1110 << 4)
#define EMMC_DRV_CAP_DDR50_CLOCK            (0b1101 << 4)

#define EMMC_DRV_CAP_HS200_CMD_DATA         (0b1011 << 4)
#define EMMC_DRV_CAP_HS200_CLOCK            (0b0011 << 4)

#define EMMC_DRV_CAP_HS400_CMD_DATA         (0b1011 << 4)
#define EMMC_DRV_CAP_HS400_CLOCK            (0b1011 << 4)

#define SDIO_DRV_CAP_3V3_50M_CMD_DATA       (0b101 << 4)
#define SDIO_DRV_CAP_3V3_50M_CLOCK          (0b1101 << 4)

#define SDIO_DRV_CAP_1V8_50M_CMD_DATA       (0b011 << 4)
#define SDIO_DRV_CAP_1V8_50M_CLOCK          (0b1001 << 4)

#define SDIO_DRV_CAP_1V8_100M_CMD_DATA      (0b011 << 4)
#define SDIO_DRV_CAP_1V8_100M_CLOCK         (0b0100 << 4)

#define SDIO_DRV_CAP_1V8_200M_CMD_DATA      (0b011 << 4)
#define SDIO_DRV_CAP_1V8_200M_CLOCK         (0b0000 << 4)

#define IOSHARE_OFFSET_EMMC_CLOCK  0x030
#define IOSHARE_OFFSET_EMMC_CMD    0x038
#define IOSHARE_OFFSET_EMMC_DATA0  0x018
#define IOSHARE_OFFSET_EMMC_DATA1  0x020
#define IOSHARE_OFFSET_EMMC_DATA2  0x028
#define IOSHARE_OFFSET_EMMC_DATA3  0x010
#define IOSHARE_OFFSET_EMMC_DATA4  0x014
#define IOSHARE_OFFSET_EMMC_DATA5  0x01C
#define IOSHARE_OFFSET_EMMC_DATA6  0x024
#define IOSHARE_OFFSET_EMMC_DATA7  0x02C

#define IOSHARE_OFFSET_SDIO0_CLOCK  0x00C
#define IOSHARE_OFFSET_SDIO0_CMD    0x010
#define IOSHARE_OFFSET_SDIO0_DATA0  0x008
#define IOSHARE_OFFSET_SDIO0_DATA1  0x004
#define IOSHARE_OFFSET_SDIO0_DATA2  0x018
#define IOSHARE_OFFSET_SDIO0_DATA3  0x014

#define EMMC_IO_VOLTAGE_MASK               (0x01)
#define EMMC_IO_VOL_1_8V                   (0x01)
#define EMMC_IO_VOL_3_3V                   (0x00)

#define HS400_CLK_100M  100000000
#define HS400_CLK_150M  150000000
#define HS400_MAX_CLK  HS400_CLK_100M

#ifndef REG_BASE_SCTL
#define REG_BASE_SCTL                      (0xF8000000)
#endif

#ifndef REG_SC_GEN29
#define REG_SC_GEN29                        0x00F4
#endif

#define HIMCI_DLL_TUNING
#ifdef HIMCI_DLL_TUNING
#define REG_BASE_CRG	0xF8A22000
#define REG_EMMC_SAP_DLL_CTRL			(REG_BASE_CRG + 0x039C)
#define REG_EMMC_SAP_DLL_STATUS			(REG_BASE_CRG + 0x03A0)
#define REG_SDIO0_SAP_DLL_CTRL			(REG_BASE_CRG + 0x03A4)
#define REG_SDIO0_SAP_DLL_STATUS		(REG_BASE_CRG + 0x03A8)

#define SAP_DLL_CTRL_SLAVE_EN		BIT(19)
#define SAP_DLL_CTRL_STOP			BIT(18)
#define SAP_DLL_CTRL_BYPASS			BIT(17)
#define SAP_DLL_CTRL_DLLMODE		BIT(16)
#define SAP_DLL_CTRL_DLLSSEL		(0xFF << 8)
#define SAP_DLL_CTRL_DLLSSEL_OFFSET 8

#define SAP_DLL_MDLY_TAP_FLAG		(0xFF)

#define SAP_TUNING_CLKAB_INTERVAL_90   	4

#define MCI_TUNING_CONTROL				0x118
#define MCI_TUNING_FIND_EDGE			BIT(5)
#define MCI_TUNING_DATA_SEL				(0x07 << 2)
#define MCI_TUNING_EDGE_CONTROL			BIT(1)
#define MCI_TUNING_ENABLE_NEW_TUNING	BIT(0)
#define MCI_TUNING_DATA_SEL_OFFSET		(2)

//#define MCI_TUNING_TEST

#ifdef CONFIG_ARM64
#define IOMEM(x)	((void __force __iomem *)(x))
#endif

#define himci_readl(addr) ({unsigned int reg = readl(IOMEM(addr)); \
	himci_trace(1, "readl(0x%04X) = 0x%08X", (unsigned int)addr, reg); \
	reg; })

#define himci_writel(v, addr) do { writel(v, IOMEM(addr)); \
	himci_trace(1, "writel(0x%04X) = 0x%08X", (unsigned int)addr, \
			(unsigned int)(v)); \
} while (0)

static int himciv300_send_tuning(struct mmc_host * mmc, u32 opcode)
{
	int err = 0;

	switch(opcode) {
		case MMC_SEND_EXT_CSD:
			//err = mmc_send_hs_ddr_tuning(mmc);
			break;

		case MMC_SWITCH:
			//err = mmc_sd_send_tuning(mmc);
			break;

		case MMC_SEND_TUNING_BLOCK:
		case MMC_SEND_TUNING_BLOCK_HS200:
			err = mmc_send_tuning(mmc, opcode, NULL);
			break;

		default :
			err = -1;
			break;
	}

	return err;
}

static u32 himciv300_edge_tuning_max_dline(struct himciv300_host *host)
{
	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		return 8;
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		return 4;
	}
	return 1;
}

static u32 himciv300_get_tuning_phase_num(struct himciv300_host *host)
{
	struct mmc_host  *mmc = host->mmc;
	u8 timing = mmc->ios.timing;
	u32 phase_num = SDIO_SAP_PS_NUM;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		if (timing == MMC_TIMING_MMC_DDR52) {
			phase_num /= 2;
		}
	} else if (strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		if (timing == MMC_TIMING_UHS_DDR50) {
			phase_num /= 2;
		}
	}
	return phase_num;
}


static void himciv300_edge_tuning_enable(struct himciv300_host *host)
{
	u32 regval;
	void __iomem *reg_sap_dll_ctrl;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_EMMC_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval &=~SAP_DLL_CTRL_DLLMODE;
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_SDIO0_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval &=~SAP_DLL_CTRL_DLLMODE;
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	}

	regval = mci_readl(host, MCI_TUNING_CONTROL);
	regval |= MCI_TUNING_ENABLE_NEW_TUNING;
	mci_writel(host, MCI_TUNING_CONTROL, regval);
}

static void himciv300_edge_tuning_disable(struct himciv300_host *host)
{
	u32 regval;
	void __iomem *reg_sap_dll_ctrl;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_EMMC_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval |= SAP_DLL_CTRL_DLLMODE;
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_SDIO0_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval |= SAP_DLL_CTRL_DLLMODE;
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	}

	regval = mci_readl(host, MCI_TUNING_CONTROL);
	regval &= ~MCI_TUNING_ENABLE_NEW_TUNING;
	mci_writel(host, MCI_TUNING_CONTROL, regval);
}


static void himciv300_set_sap_phase(struct himciv300_host *host, u32 phase)
{
	u32 regval;

	regval = (u32)clk_get_phase(host->clk);
	regval = regval << SDIO_SAP_PS_SHIFT_BIT;
	regval &= ~SDIO_SAP_PS_MASK;
	regval |= (phase << SDIO_SAP_PS_OFFSET);
	/* clk_set_phase has  regval%360, so shifit 12bit */
	regval = regval >> SDIO_SAP_PS_SHIFT_BIT;
	clk_set_phase(host->clk, (int)regval);
}

static void himciv300_set_dll_element(struct himciv300_host *host, u32 element)
{
	u32 regval;
	void __iomem *reg_sap_dll_ctrl;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_EMMC_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval &=~SAP_DLL_CTRL_DLLSSEL;
		regval |= (element << SAP_DLL_CTRL_DLLSSEL_OFFSET);
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_SDIO0_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		regval &=~SAP_DLL_CTRL_DLLSSEL;
		regval |= (element << SAP_DLL_CTRL_DLLSSEL_OFFSET);
		himci_writel(regval, reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	}
}

static u32 himciv300_get_dll_element(struct himciv300_host *host)
{
	u32 regval = 0;
	void __iomem *reg_sap_dll_ctrl;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_EMMC_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(reg_sap_dll_ctrl);
		iounmap(reg_sap_dll_ctrl);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_ctrl = ioremap_nocache(REG_SDIO0_SAP_DLL_CTRL, sizeof(u32));
		regval = himci_readl(REG_SDIO0_SAP_DLL_CTRL);
		iounmap(reg_sap_dll_ctrl);
	}

	return (regval & SAP_DLL_CTRL_DLLSSEL);
}

static u32 himciv300_get_phase22dot5_element(struct himciv300_host *host)
{
	u32 regval;
	u32 mdly_tap_flag,phase22dot5_ele;
	void __iomem *reg_sap_dll_status;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_status = ioremap_nocache(REG_EMMC_SAP_DLL_STATUS, sizeof(u32));
		regval = himci_readl(reg_sap_dll_status);
		iounmap(reg_sap_dll_status);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_status = ioremap_nocache(REG_SDIO0_SAP_DLL_STATUS, sizeof(u32));
		regval = himci_readl(reg_sap_dll_status);
		iounmap(reg_sap_dll_status);
	}

	mdly_tap_flag = (regval & SAP_DLL_MDLY_TAP_FLAG);
	phase22dot5_ele = mdly_tap_flag/SDIO_SAP_PS_NUM/2;
	return phase22dot5_ele;
}

static u32 himciv300_get_sap_dll_taps(struct himciv300_host *host)
{
	u32 regval;
	void __iomem *reg_sap_dll_status;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		reg_sap_dll_status = ioremap_nocache(REG_EMMC_SAP_DLL_STATUS, sizeof(u32));
		regval = himci_readl(reg_sap_dll_status);
		iounmap(reg_sap_dll_status);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		reg_sap_dll_status = ioremap_nocache(REG_SDIO0_SAP_DLL_STATUS, sizeof(u32));
		regval = himci_readl(reg_sap_dll_status);
		iounmap(reg_sap_dll_status);
	}

	return (regval & SAP_DLL_MDLY_TAP_FLAG);
}

static void himciv300_tuning_feedback(struct mmc_host * mmc)
{
	struct himciv300_host *host = mmc_priv(mmc);

	himciv300_control_cclk(host, false);
	msleep(1);
	himciv300_host_reset(host);
	msleep(1);
	mci_writel(host, MCI_RINTSTS, ALL_INT_CLR);
	himciv300_control_cclk(host, true);
	msleep(1);
	host->pending_events = 0;
}

/************************************************************
*************************************************************
|															|
|St|<------->|90?? 		Found								|
|		||||||			[ Start+1 ~ Start+1 + 45??]			|
|	St+1|<------->|90??	Found								|
|			||||..											|
|			||||..											|
|			End|<------->|90?? 			Found				|
|				||||||					[ End ~ End+45??]	|
|				End+1|<------->|90??	unFound				|
|															|
************************************************************
*************************************************************/
static int himciv300_tuning_edgedll_mode(struct himciv300_host *host, u32 opcode, int startEdge, int endEdge, u32 edgeNum)
{
	u32 index;
	u32 found = 0;
	u32 startp =-1, endp = -1;
	u32 curphase,lastphaseoffset = 0,phaseoffset = 0, totalphases = 0;
	u16 ele,start_ele, phase_dll_elements;
	u8 mdly_tap_flag = 0;
	int prev_err = 0, err = 0;
	u32 phase_num = himciv300_get_tuning_phase_num(host);

	himci_trace(3, "begin");

	mdly_tap_flag = himciv300_get_sap_dll_taps(host);
	phase_dll_elements = mdly_tap_flag/SDIO_SAP_PS_NUM;
	totalphases = phase_dll_elements*phase_num;

	if (endEdge < startEdge)
		endEdge += phase_num;

	phaseoffset = startEdge*phase_dll_elements;

	found = 0;
	start_ele = 2;
	for (index = startEdge; index <= endEdge; index++) {

		curphase = index%phase_num;
		phaseoffset %= totalphases;
		/* set phase shift */
		himciv300_set_sap_phase(host, curphase);

		for (ele = start_ele; ele <= phase_dll_elements ; ele++) {

			mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
			himciv300_set_dll_element(host, ele);

			err = himciv300_send_tuning(host->mmc,opcode);
			//printk("\tphase:%02d ele:%02d error:%d\n",curphase,ele,err);

			if (!err) {
				found = 1;
			}
			if (!((index == startEdge)&&(ele == start_ele))) {
				if (err && !prev_err) {
					if(ele == start_ele)
						endp = lastphaseoffset;
					else
						endp = phaseoffset + ele - 1;
				}

				if (!err && prev_err) {
					startp = phaseoffset + ele;
				}
			}

			if ((startp != -1) && (endp != -1))
				goto tuning_out;

			prev_err = err;
			err = 0;
		}
		lastphaseoffset = phaseoffset;
		phaseoffset += phase_dll_elements;
	}

tuning_out:

	if (found) {
		printk("scan elemnts /-:%d \\-:%d under edges /-:%d \\-:%d\n",startp,endp,startEdge,endEdge);
		if (-1 == startp)
			startp = (startEdge + edgeNum)*phase_dll_elements + start_ele;
		if (-1 == endp)
			endp = startEdge*phase_dll_elements - 1;

		if (endp < startp)
			endp += totalphases;

		phaseoffset = (( startp + endp ) / 2) % totalphases;
		index = (phaseoffset / phase_dll_elements);
		ele = (phaseoffset % phase_dll_elements);
		ele = ((ele > start_ele)?ele:start_ele);

		himciv300_set_sap_phase(host, index);
		himciv300_set_dll_element(host,ele);
		emmc_boot_tuning_phase = index;

		printk(KERN_NOTICE "Tuning SampleClock. mix set phase:[%02d/%02d] ele:[%02d/%02d] \n",index,(phase_num-1),ele,phase_dll_elements);
		mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
		return 0;
	}
	printk(KERN_NOTICE "No valid phase shift! use default\n");
	return -1;
}

int himciv300_tuning_mix_mode(struct mmc_host * mmc, u32 opcode)
{
	struct himciv300_host *host = mmc_priv(mmc);
	u32 index, regval;
	u32 found = 0,prefound = 0;
	u32 startp =-1, endp = -1;
	u32 edgeNum = 0;
	int err;
	u32 phase_num = himciv300_get_tuning_phase_num(host);

	himci_trace(3, "begin");

	himciv300_edge_tuning_enable(host);
	host->tunning = 1;
	for (index = 0; index < phase_num; index++) {

		/* set phase shift */
		himciv300_set_sap_phase(host, index);
		mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);

		err = himciv300_send_tuning(mmc,opcode);
		if (!err) {
			regval = mci_readl(host, MCI_TUNING_CONTROL);
			found = ((regval & MCI_TUNING_FIND_EDGE) == MCI_TUNING_FIND_EDGE);
		} else {
			found = 1;
		}

		//printk("\tphase:%02d found:%02d error:%d\n",index,found,err);
		if(found){
			edgeNum++;
		}
		if (prefound && !found) {
			endp = index - 1;
		} else if (!prefound && found) {
			if(index != 0) {
				startp = index;
			}
		}

		//if ((startp != -1) && (endp != -1))
		//	break;

		prefound = found;
		found = 0;
	}

	if ((startp == -1)&&(endp == -1))
	{
		printk("unfound correct edge! check your config is correct!!\n");
		return -1;
	}else {
		printk("scan edges:%d /-:%d \\-:%d\n",edgeNum,startp,endp);
	}

	if (startp == -1)
		startp = endp - (edgeNum -1);
	if (endp == -1)
		endp = startp + (edgeNum -1);

	himciv300_edge_tuning_disable(host);
	err = himciv300_tuning_edgedll_mode(host, opcode, startp, endp, edgeNum);
	host->tunning = 0;
	return err;
}

int himciv300_tuning_edge_mode(struct mmc_host * mmc, u32 opcode)
{
	struct himciv300_host *host = mmc_priv(mmc);
	u32 index, regval;
	u32 found = 0,prefound = 0;
	u32 startp =-1, endp = -1, prevp = 0;
	u32 phaseoffset = 0;
	u32 eleoffset = 0;
	int err = 0;
	u32 edgeNum = 0;
	u32 phase_num = himciv300_get_tuning_phase_num(host);

	himci_trace(3, "begin");

	host->tunning = 1;
	himciv300_edge_tuning_enable(host);

	for (index = 0; index < phase_num; index++) {

		/* set phase shift */
		himciv300_set_sap_phase(host, index);
		mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);

		err = himciv300_send_tuning(mmc,opcode);
		if (!err) {
			regval = mci_readl(host, MCI_TUNING_CONTROL);
			found = ((regval & MCI_TUNING_FIND_EDGE) == MCI_TUNING_FIND_EDGE);
		} else {
			found = 1;
		}

		//printk("\tindex:%02d error:%d  found:%d\n",index,err,found);
		if(found){
			edgeNum++;
		}

		if (prefound && !found){
			endp = prevp;
		} else if (!prefound && found){
			if(index != 0){
				startp = index;
			}
		}
		if ((startp != -1) && (endp != -1))
			goto scan_out;

		prevp = index;
		prefound = found;
		found = 0;
	}

scan_out:

	if ((startp == -1)&&(endp == -1))
	{
		printk("unfound correct edge! check your config is correct!!\n");
		return -1;
	}

	if (startp == -1)
		startp = endp - (edgeNum -1);
	if (endp == -1)
		endp = startp + (edgeNum -1);

	if (startp > endp)
		endp += phase_num;

	if (startp == endp) //one edge
		phaseoffset = (((startp + endp))/2)%phase_num;
	else
		phaseoffset = (((startp + 1) + (endp + 1))/2)%phase_num;

	phaseoffset += phase_num/2;
	phaseoffset %= phase_num;

	emmc_boot_tuning_phase = phaseoffset;
	himciv300_set_sap_phase(host, phaseoffset);

	if ((startp == endp)||((endp + 1 - startp)%2)) {
		eleoffset = himciv300_get_phase22dot5_element(host);
		himciv300_set_dll_element(host,eleoffset);
	}

	printk(KERN_NOTICE "Tuning SampleClock. edg set phase:[%02d/%02d] ele:[%02d/%02d] \n",phaseoffset,(phase_num-1),eleoffset,eleoffset*2);

	himciv300_edge_tuning_disable(host);
	mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
	host->tunning = 0;
	return 0;
}

int himciv300_tuning_dll_mode(struct mmc_host * mmc, u32 opcode)
{
	struct himciv300_host *host = mmc_priv(mmc);
	u32 index;
	u32 found = 0;
	u32 startp =-1, endp = -1;
	u32 phaseoffset = 0, lastphaseoffset = 0,totalphases = 0;
	u16 ele,start_ele, phase_dll_elements;
	u8 mdly_tap_flag = 0;
	int prev_err = 0, err = 0;
	u32 phase_num = himciv300_get_tuning_phase_num(host);

	himci_trace(3, "begin");

	mdly_tap_flag = himciv300_get_sap_dll_taps(host);
	phase_dll_elements = mdly_tap_flag/SDIO_SAP_PS_NUM;
	totalphases = phase_dll_elements*phase_num;

	host->tunning = 1;
	found = 0;
	start_ele = 2;
	for (index = 0; index < phase_num; index++) {

		/* set phase shift */
		himciv300_set_sap_phase(host, index);

		for (ele = start_ele; ele <= phase_dll_elements ; ele++) {

			mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
			himciv300_set_dll_element(host, ele);

			err = himciv300_send_tuning(mmc,opcode);
			//printk("\tphase:%02d ele:%02d error:%d\n",index,ele,err);

			if (!err) {
				found = 1;
			}
			if (!((index == 0)&&(ele == start_ele))) {
				if (err && !prev_err) {
					if(ele == start_ele)
						endp = lastphaseoffset;
					else
						endp = phaseoffset + ele - 1;
				}

				if (!err && prev_err) {
					startp = phaseoffset + ele;
				}
			}

			if ((startp != -1) && (endp != -1))
				goto tuning_out;

			prev_err = err;
			err = 0;
		}
		lastphaseoffset = phaseoffset;
		phaseoffset += phase_dll_elements;
	}

tuning_out:

	if (found) {

		if (-1 == startp)
			startp = 0;
		if (-1 == endp)
			endp = totalphases - 1;

		if (endp < startp){
			endp += totalphases;
		}

		phaseoffset = (( startp + endp ) / 2) % totalphases;
		index = (phaseoffset / phase_dll_elements);
		ele = (phaseoffset % phase_dll_elements);
		ele = ((ele > start_ele)?ele:start_ele);
		himciv300_set_sap_phase(host, index);
		himciv300_set_dll_element(host, ele);

		emmc_boot_tuning_phase = index;
		printk(KERN_NOTICE "Tuning SampleClock. dll set phase:[%02d/%02d] ele:[%02d/%02d] \n",index,(phase_num-1),ele,phase_dll_elements);

		mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
		host->tunning = 0;
		return 0;
	}

	printk(KERN_NOTICE "No valid phase shift! use default\n");
	return -1;
}

static int himciv300_tuning_normal_mode(struct mmc_host * mmc, u32 opcode)
{
	struct himciv300_host *host = mmc_priv(mmc);
	u32 index;
	u32 found = 0, startp =-1, endp = -1;
	int prev_err, err = 0;
	u32 phase_num = himciv300_get_tuning_phase_num(host);

	host->tunning = 1;

	for (index = 0; index < phase_num; index++) {

		/* set phase shift */
		himciv300_set_sap_phase(host,index);
		mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);

		err = himciv300_send_tuning(mmc,opcode);
		//printk("\tphase:%02d  error:%d\n",index,err);

		if (!err) {
			found = 1;
		}
		if (index > 0) {
			if (err && !prev_err)
				endp = index - 1;

			if (!err && prev_err)
				startp = index;
		}

		if ((startp != -1) && (endp != -1))
			goto tuning_out;

		prev_err = err;
		err = 0;
	}

tuning_out:

	if (found) {

		if (-1 == startp)
			startp = 0;
		if (-1 == endp)
			endp = phase_num -1;

		if (endp < startp) {
			endp += phase_num;
		}
		index = ((startp + endp) / 2)%phase_num;

		emmc_boot_tuning_phase = index;
		himciv300_set_sap_phase(host, index);
		printk(KERN_NOTICE "Tuning SampleClock. nml set phase:[%02d/%02d]\n",index,(phase_num-1));
	} else {
		printk(KERN_NOTICE "No valid phase shift! use default\n");
		return -1;
	}

	host->tunning = 0;
	mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
	return 0;
}
#endif

#ifdef MCI_TUNING_TEST
int himciv300_tuning_test_mode(struct mmc_host * mmc, u32 opcode)
{
	struct himciv300_host *host = mmc_priv(mmc);
	u32 index, regval;
	u32 dline,maxdline;
	u32 found = 0,prefound = 0;
	u32 startp =-1, endp = -1;
	u32 edgeNum = 0;
	u16 ele, phase_dll_elements;
	u8 mdly_tap_flag = 0;
	u32 phase_num = himciv300_get_tuning_phase_num(host);
	u32 goodphase, goodele ;
	int err;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		return 0;
	} else if (strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		return 0;
	}

	himci_trace(5, " ################ begin ##################");

	host->tunning = 1;
	maxdline = himciv300_edge_tuning_max_dline(host);
	for (dline = 0 ; dline < maxdline; dline++) {
		regval = mci_readl(host, MCI_TUNING_CONTROL);
		regval &= ~MCI_TUNING_DATA_SEL;
		regval |= (dline << MCI_TUNING_DATA_SEL_OFFSET);
		mci_writel(host, MCI_TUNING_CONTROL, regval);

		found = 0;
		mdly_tap_flag = himciv300_get_sap_dll_taps(host);
		phase_dll_elements = mdly_tap_flag/SDIO_SAP_PS_NUM;
		printk("\n");
		himciv300_edge_tuning_enable(host);
		for (index = 0; index < phase_num; index++) {
			/* set phase shift */
			himciv300_set_sap_phase(host, index);
			mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);

			err = himciv300_send_tuning(mmc,opcode);
			if (!err) {
				regval = mci_readl(host, MCI_TUNING_CONTROL);
				found = ((regval & MCI_TUNING_FIND_EDGE) == MCI_TUNING_FIND_EDGE);
			} else {
				found = 1;
			}

			if(found)
				printk("data%d p%d tag:%d found:%d phaseele:%d\n",dline,index,mdly_tap_flag,found,phase_dll_elements);
			else
				printk("data%d p%d tag:%d         phaseele:%d\n",dline,index,mdly_tap_flag,phase_dll_elements);
		}
		himciv300_edge_tuning_disable(host);

		for (index = 0; index < phase_num; index++) {
			/* set phase shift */
			himciv300_set_sap_phase(host, index);
			for (ele = 2; ele <= phase_dll_elements ; ele++) {
				mci_writel(host,  MCI_RINTSTS, ALL_INT_CLR);
				himciv300_set_dll_element(host, ele);
				err = himciv300_send_tuning(mmc,opcode);
				if (err) {
					printk("\tp%d ele:%02d error:%d\n",index,ele,err);
				} else {
					goodphase = index;
					goodele = ele;
				}
			}
		}
		himciv300_set_sap_phase(host, goodphase);
		himciv300_set_dll_element(host, goodele);
		err = himciv300_send_tuning(mmc,opcode);
	}
	host->tunning = 0;
	himci_trace(5, " ################ end ##################");
	return err;
}
#endif


/******************************************************************************/

u32 iohs[] = {
	IOSHARE_OFFSET_EMMC_DATA3, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA4, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA0, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA5, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA1, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA6, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA2, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA7, EMMC_DRV_CAP_DDR50_CMD_DATA,
	IOSHARE_OFFSET_EMMC_CLOCK, EMMC_DRV_CAP_DDR50_CLOCK,
	IOSHARE_OFFSET_EMMC_CMD,   EMMC_DRV_CAP_DDR50_CMD_DATA,
	0xff, 0xff,
};

u32 iohs200[] = {
	IOSHARE_OFFSET_EMMC_DATA3, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA4, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA0, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA5, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA1, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA6, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA2, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA7, EMMC_DRV_CAP_HS200_CMD_DATA,
	IOSHARE_OFFSET_EMMC_CLOCK, EMMC_DRV_CAP_HS200_CLOCK,
	IOSHARE_OFFSET_EMMC_CMD,   EMMC_DRV_CAP_HS200_CMD_DATA,
	0xff, 0xff,
};

u32 iohs400[] = {
	IOSHARE_OFFSET_EMMC_DATA3, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA4, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA0, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA5, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA1, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA6, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA2, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_DATA7, EMMC_DRV_CAP_HS400_CMD_DATA,
	IOSHARE_OFFSET_EMMC_CLOCK, EMMC_DRV_CAP_HS400_CLOCK,
	IOSHARE_OFFSET_EMMC_CMD,   EMMC_DRV_CAP_HS400_CMD_DATA,
	0xff, 0xff,
};

u32 io_sdhs[] = {
	IOSHARE_OFFSET_SDIO0_CLOCK, SDIO_DRV_CAP_3V3_50M_CLOCK,
	IOSHARE_OFFSET_SDIO0_CMD,   SDIO_DRV_CAP_3V3_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA0, SDIO_DRV_CAP_3V3_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA1, SDIO_DRV_CAP_3V3_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA2, SDIO_DRV_CAP_3V3_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA3, SDIO_DRV_CAP_3V3_50M_CMD_DATA,
	0xff,0xff,
};

u32 io_uhs_sdr25[] = {
	IOSHARE_OFFSET_SDIO0_CLOCK, SDIO_DRV_CAP_1V8_50M_CLOCK,
	IOSHARE_OFFSET_SDIO0_CMD,   SDIO_DRV_CAP_1V8_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA0, SDIO_DRV_CAP_1V8_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA1, SDIO_DRV_CAP_1V8_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA2, SDIO_DRV_CAP_1V8_50M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA3, SDIO_DRV_CAP_1V8_50M_CMD_DATA,
	0xff,0xff,
};

u32 io_uhs_sdr50[] = {
	IOSHARE_OFFSET_SDIO0_CLOCK, SDIO_DRV_CAP_1V8_100M_CLOCK,
	IOSHARE_OFFSET_SDIO0_CMD,   SDIO_DRV_CAP_1V8_100M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA0, SDIO_DRV_CAP_1V8_100M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA1, SDIO_DRV_CAP_1V8_100M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA2, SDIO_DRV_CAP_1V8_100M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA3, SDIO_DRV_CAP_1V8_100M_CMD_DATA,
	0xff,0xff,
};

u32 io_uhs_sdr104[] = {
	IOSHARE_OFFSET_SDIO0_CLOCK, SDIO_DRV_CAP_1V8_200M_CLOCK,
	IOSHARE_OFFSET_SDIO0_CMD,   SDIO_DRV_CAP_1V8_200M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA0, SDIO_DRV_CAP_1V8_200M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA1, SDIO_DRV_CAP_1V8_200M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA2, SDIO_DRV_CAP_1V8_200M_CMD_DATA,
	IOSHARE_OFFSET_SDIO0_DATA3, SDIO_DRV_CAP_1V8_200M_CMD_DATA,
	0xff,0xff,
};

/******************************************************************************/

static void himciv300_set_driver(struct himciv300_host * host, u8 timing)
{
	u32 ix, regval;

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		 if ((timing == MMC_TIMING_MMC_HS)
			|| (timing == MMC_TIMING_LEGACY)
			|| (timing == MMC_TIMING_MMC_DDR52)) {

			for (ix = 0; iohs[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + iohs[ix]);
				regval &= ~(DRV_CAPS_MASK);
				regval |= (DRV_SLEV_RATE | iohs[ix+1]);
				writel(regval, host->ioshare_addr + iohs[ix]);
			}
		} else if (timing == MMC_TIMING_MMC_HS200) {

			for (ix = 0; iohs200[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + iohs200[ix]);
				regval &= ~(DRV_CAPS_MASK | DRV_SLEV_RATE);
				if (IOSHARE_OFFSET_EMMC_CLOCK != iohs200[ix]) {
					regval |= DRV_SLEV_RATE;
				}
				regval |= iohs200[ix+1];
				writel(regval, host->ioshare_addr +iohs200[ix]);
			}
		} else if (timing == MMC_TIMING_MMC_HS400) {

			for (ix = 0; iohs400[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr +iohs400[ix]);
				regval &= ~(DRV_CAPS_MASK | DRV_SLEV_RATE);
				if (HS400_MAX_CLK == HS400_CLK_100M) {
					regval |= DRV_SLEV_RATE;
				}
				regval |= iohs400[ix+1];
				writel(regval, host->ioshare_addr +iohs400[ix]);
			}
		}
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		if((timing == MMC_TIMING_SD_HS)
		   || (timing == MMC_TIMING_UHS_SDR12)
		   || (timing == MMC_TIMING_LEGACY)) {
			for (ix = 0; io_sdhs[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + io_sdhs[ix]);
				regval &= ~(DRV_CAPS_MASK);
				regval |= (DRV_SLEV_RATE |io_sdhs[ix+1]);
				writel(regval, host->ioshare_addr + io_sdhs[ix]);
			}
		} else if ((timing == MMC_TIMING_UHS_DDR50)||
		           (timing == MMC_TIMING_UHS_SDR25)){
			for (ix = 0; io_uhs_sdr25[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + io_uhs_sdr25[ix]);
				regval &= ~(DRV_CAPS_MASK);
				regval |= (DRV_SLEV_RATE |io_uhs_sdr25[ix+1]);
				writel(regval, host->ioshare_addr + io_uhs_sdr25[ix]);
			}
		} else if (timing == MMC_TIMING_UHS_SDR50) {
			for (ix = 0; io_uhs_sdr50[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + io_uhs_sdr50[ix]);
				regval &= ~(DRV_CAPS_MASK);
				regval &= ~DRV_SLEV_RATE;
				regval |=  io_uhs_sdr50[ix+1];
				writel(regval, host->ioshare_addr + io_uhs_sdr50[ix]);
			}
		} else if (timing == MMC_TIMING_UHS_SDR104) {
			for (ix = 0; io_uhs_sdr104[ix] != 0xff; ix += 2) {
				regval = readl( host->ioshare_addr + io_uhs_sdr104[ix]);
				regval &= ~(DRV_CAPS_MASK);
				regval &= ~DRV_SLEV_RATE;
				regval |=  io_uhs_sdr104[ix+1];
				writel(regval, host->ioshare_addr + io_uhs_sdr104[ix]);
			}
		}
	}
}

/******************************************************************************/

static void himciv300_set_crgclk(struct himciv300_host * host, u8 timing)
{
	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {

		if(timing == MMC_TIMING_MMC_HS) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_UHS_DDR50) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_MMC_DDR52) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_MMC_HS200) {
			host->mmc->f_max = 200000000;
		} else if (timing == MMC_TIMING_MMC_HS400) {
			host->mmc->f_max = HS400_MAX_CLK;
		}

		clk_set_rate(host->clk,	(unsigned long)host->mmc->f_max);
	} else if (strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		if (timing == MMC_TIMING_LEGACY) {
			host->mmc->f_max = 25000000;
		} else if (timing == MMC_TIMING_SD_HS) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_UHS_DDR50) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_UHS_SDR12) {
			host->mmc->f_max = 25000000;
		} else if (timing == MMC_TIMING_UHS_SDR25) {
			host->mmc->f_max = 50000000;
		} else if (timing == MMC_TIMING_UHS_SDR50) {
			host->mmc->f_max = 100000000;
		} else if (timing == MMC_TIMING_UHS_SDR104) {
			host->mmc->f_max = 150000000;
		}

		clk_set_rate(host->clk,	(unsigned long)host->mmc->f_max);
	}
}
/******************************************************************************/

static void himciv300_set_phase(struct himciv300_host * host, u8 timing)
{
	u32 regval;

	himci_trace(3, "begin");

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		/* config sample clk/drv clk phase shift */
		regval = (u32)clk_get_phase(host->clk);
		regval = regval << SDIO_SAP_PS_SHIFT_BIT;
		if ((timing == MMC_TIMING_MMC_HS) || (timing == MMC_TIMING_LEGACY)) {
			regval &= ~(SDIO_SAP_PS_MASK | SDIO_DRV_PS_MASK);
			regval |=  SDIO_SAP_PS_315_167DOT5 | SDIO_DRV_PS_180_90;
		} else if (timing == MMC_TIMING_MMC_DDR52) {
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
				regval |= SDIO_DRV_PS_90_45;
			if (host->iovoltage == EMMC_IO_VOL_1_8V)
				regval |= SDIO_SAP_PS_90_45;
			else
				regval |= SDIO_SAP_PS_45_22DOT5;
		} else if (timing == MMC_TIMING_MMC_HS200) {
			regval &= ~(SDIO_DRV_PS_MASK);
			regval |=  SDIO_DRV_PS_90_45;
		} else if(timing == MMC_TIMING_MMC_HS400) {
			regval &= ~(SDIO_SAP_PS_MASK | SDIO_DRV_PS_MASK);
			if (HS400_MAX_CLK == HS400_CLK_100M) {
				regval |= (emmc_boot_tuning_phase << SDIO_SAP_PS_OFFSET) | SDIO_DRV_PS_90_45;
			} else {
				regval |= EMMC_CLK_MODE|(emmc_boot_tuning_phase << SDIO_SAP_PS_OFFSET) | SDIO_DRV_PS_135_67DOT5;
			}
		}
		/* clk_set_phase has  regval%360, so shifit 12bit */
		regval = regval >> SDIO_SAP_PS_SHIFT_BIT;
		clk_set_phase(host->clk, (int)regval);

		/* ddr50 need to enable shift */
		regval = mci_readl(host, MCI_ENABLE_SHIFT);
		 if (timing == MMC_TIMING_MMC_DDR52)
			regval |= ENABLE_SHIFT_01;
		else
			regval &= ~ENABLE_SHIFT_01;
		mci_writel(host, MCI_ENABLE_SHIFT, regval);
	} else if(strcmp(dev_name(host->dev), "f9820000.himciv200.SD") == 0) {
		regval = (u32)clk_get_phase(host->clk);
		regval = regval << SDIO_SAP_PS_SHIFT_BIT;
		if (timing == MMC_TIMING_UHS_SDR104){
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_135_67DOT5|SDIO_SAP_PS_225_112DOT5);
		} else if (timing == MMC_TIMING_UHS_DDR50) {
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_45_22DOT5|SDIO_SAP_PS_135_67DOT5);
		} else if (timing == MMC_TIMING_UHS_SDR50){
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_135_67DOT5|SDIO_SAP_PS_90_45);
		} else if(timing == MMC_TIMING_LEGACY) {
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_180_90|SDIO_SAP_PS_90_45);
		} else if (timing == MMC_TIMING_SD_HS){
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_180_90|SDIO_SAP_PS_0_0);
		}  else if (timing == MMC_TIMING_UHS_SDR25){
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_180_90|SDIO_SAP_PS_90_45);
		} else if (timing == MMC_TIMING_UHS_SDR12){
			regval &= ~(SDIO_SAP_PS_MASK| SDIO_DRV_PS_MASK);
			regval |= (SDIO_DRV_PS_180_90|SDIO_SAP_PS_180_90);
		}
		/* clk_set_phase has  regval%360, so shifit 12bit */
		regval = regval >> SDIO_SAP_PS_SHIFT_BIT;
		clk_set_phase(host->clk, (int)regval);
	}
}
/******************************************************************************/

static void himciv300_set_timing(struct himciv300_host * host, u8 timing)
{
	himciv300_set_driver(host, timing);
	himciv300_set_crgclk(host, timing);
	himciv300_set_phase(host, timing);
}
/******************************************************************************/

static int himciv300_prepare_hs400(struct mmc_host * mmc, struct mmc_ios * ios)
{
	u32 ix, regval;
	struct himciv300_host *host = mmc_priv(mmc);
	himci_trace(3, "begin");

	if (strcmp(dev_name(host->dev), "f9830000.himciv200.MMC") == 0) {
		/* config driver strength */
		for (ix = 0; iohs400[ix] != 0xff; ix += 2) {
			regval = readl( host->ioshare_addr + iohs400[ix]);
			regval &= ~(DRV_CAPS_MASK | DRV_SLEV_RATE);
			if(HS400_MAX_CLK == HS400_CLK_100M) {
				regval |= DRV_SLEV_RATE;
			}
			regval |= iohs400[ix+1];
			writel(regval, host->ioshare_addr + iohs400[ix]);
		}

		/* config source clock */
		host->mmc->f_max = HS400_MAX_CLK;
		clk_set_rate(host->clk,	(unsigned long)host->mmc->f_max);

		/* config clk phase */
		regval = (u32)clk_get_phase(host->clk);
		regval = regval << SDIO_SAP_PS_SHIFT_BIT;
		regval &= ~(SDIO_DRV_PS_MASK);
		if (HS400_MAX_CLK == HS400_CLK_100M) {
			regval |= SDIO_DRV_PS_90_45;
		} else {
			regval |= SDIO_DRV_PS_135_67DOT5;
		}
		regval = regval >> SDIO_SAP_PS_SHIFT_BIT;
		clk_set_phase(host->clk, (int)regval);
	}

	return 0;
}
/******************************************************************************/

int himciv300_execute_tuning(struct mmc_host * mmc, u32 opcode)
{
	int err;

	struct himciv300_host *host = mmc_priv(mmc);

	himci_trace(3, "begin");
#ifdef MCI_TUNING_TEST
	himciv300_tuning_test_mode(mmc,opcode);
#endif

	err = himciv300_tuning_mix_mode(mmc,opcode);
	if (err) {
		err = himciv300_tuning_dll_mode(mmc,opcode);
	}
	himciv300_tuning_feedback(mmc);
	if (!err) { //double check tuning success
		host->tunning = 1;
		err = himciv300_send_tuning(mmc,opcode);
		host->tunning = 0;
	}
	return err;
}
/******************************************************************************/

unsigned int get_mmc_io_voltage(void)
{
	unsigned int voltage = 0;
	void __iomem *virtaddr;

	virtaddr = ioremap_nocache(REG_BASE_SCTL + REG_SC_GEN29, PAGE_SIZE);
	if (!virtaddr) {
		printk("ioremap emmc error.\n");
		return 1;
	}

	voltage = readl(virtaddr);
	voltage &= EMMC_IO_VOLTAGE_MASK;

	iounmap(virtaddr);

	return voltage;
}
