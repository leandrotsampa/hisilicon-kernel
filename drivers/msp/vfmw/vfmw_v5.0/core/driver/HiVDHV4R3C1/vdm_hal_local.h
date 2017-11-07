/*--------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------------------*/

#ifndef _VDM_HAL_LOCAL_HEADER_
#define _VDM_HAL_LOCAL_HEADER_


//#include "basedef.h"
//#include "mem_manage.h"
#include "vfmw.h"
//#include "vdm_hal.h"
#ifdef _cplusplus
extern "C" {
#endif

#define	   DNR_V4R3C1_ON_LINE_OR_OFF			0  // 1 online; 0 offline
#define	   VHB_V4R3C1_STRIDE_BYTE	      0x400			 // byte stride
#define	   VHB_V4R3C1_STRIDE_WORD	      (VHB_V4R3C1_STRIDE_BYTE/4)	// word stride
#define	   SLOT_V4R3C1_WIDTH_BYTE	      64			 // 64 byte
#define	   SLOT_V4R3C1_WIDTH_WORD	      (SLOT_V4R3C1_WIDTH_BYTE/4)	// 16 word
#define	   HALF_V4R3C1_SLOT_WIDTH_WORD	      8				 // 8 word
#define	   MSG_V4R3C1_SLOT_HEIGHT_BYTE	      (32*1024)			 // one slot height
#define	   HW_V4R3C1_MEM_SIZE		      (640*1024)
#define	   HW_HEVC_MEM_SIZE				(6 * 1024 * 1024)

#define	   MSG_V4R3C1_SLOT_NUM		      (MAX_SLICE_SLOT_NUM + 5)
#define	   UP_V4R3C1_MSG_SLOT_INDEX	      0
#define	   RP_V4R3C1_MSG_SLOT_INDEX	      2
#define	   DN_V4R3C1_MSG_SLOT_INDEX	      4
#define	   RP_V4R3C1_MSG_SLOT_NUM	      2
#define	   DN_V4R3C1_MSG_SLOT_NUM	      1
#define	   VDM_V4R3C1_REG_SIZE			1024	//分配的寄存器大小
#define	   RP_V4R3C1_MSG_SIZE		      (RP_V4R3C1_MSG_SLOT_NUM * MSG_SLOT_SIZE)	//分配的消息大小, WORD
#define	   DN_V4R3C1_MSG_SIZE		      (DN_V4R3C1_MSG_SLOT_NUM * MSG_SLOT_SIZE)	//分配的消息大小, WORD
#define	   VDM_V4R3C1_REG_USED_SIZE	      512			      //实际使用的寄存器大小, WORD
#define	   RP_V4R3C1_MSG_USED_SIZE	      (RP_V4R3C1_MSG_SIZE)			//实际使用的消息大小, WORD

#define	   CA_V4R3C1_MN_ADDR_LEN	      (64*4*20)
#define	   SED_V4R3C1_TOP_ADDR_LEN	      (352*96)//(64*4*96)
#define	   PMV_V4R3C1_TOP_ADDR_LEN	      (352*128)//(64*4*96)
#define	   RCN_V4R3C1_TOP_ADDR_LEN	      (352*128)//(64*4*96)
#define	   ITRANS_V4R3C1_TOP_ADDR_LEN	      (352*128)//(128*128)
#define	   DBLK_V4R3C1_TOP_ADDR_LEN	      (352*192)//(128*512)
#define	   PPFD_V4R3C1_BUF_LEN_DEFAULT	      (64*4*400) //(64*4*800)
#define	   ONEMB_V4R3C1_PMV_COLMB_ADDR_LEN    (20*4)   //计算得知，大致需要16words/mb，现在多分配一点
#define	   DNR2D_V4R3C1_BUF_LEN		      (2048*1088*3/2)  //(1920*1088*3/2)

//db defines
#define	   DB_V4R3C1_THR_LEASTBLKDIFF		0    //key para, (0-128)
#define	   DB_V4R3C1_ALPHA_SCALE				8
#define	   DB_V4R3C1_BETA_SCALE					8

/************************************************************************/
/* VDM寄存器								*/
/************************************************************************/
//crg virtual registers
#define	   VREG_CRG_VDH_CLK_SEL				0x000
#define	   VREG_CRG_VDH_CLK_SKIP			0x001

//control registers
#define	   VREG_V4R3C1_VDH_START		      0x000
#define	   VREG_V4R3C1_VDH_REPAIR		      0x004
#define	   VREG_V4R3C1_BASIC_CFG0		      0x008
#define	   VREG_V4R3C1_BASIC_CFG1		      0x00c
#define	   VREG_V4R3C1_AVM_ADDR			      0x010
#define	   VREG_V4R3C1_VAM_ADDR			      0x014
#define	   VREG_V4R3C1_STREAM_BASE_ADDR		      0x018

//state registers
#define	   VREG_V4R3C1_VDH_STATE		      0x01c
#define	   VREG_V4R3C1_INT_STATE		      0x020
#define	   VREG_V4R3C1_INT_MASK			      0x024
#define	   VREG_V4R3C1_VCTRL_STATE		      0x028

//emar & timeout registers
#define	   VREG_V4R3C1_EMAR_ID			      0x030    //0x0000FF00: no	  RAM OnChip
//0x0001FF00: all  RAM OnChip
//0x0002FF00: all  RAM OnChip, except DBLK/DNR RAM
#define	   VREG_V4R3C1_RPT_CNT			      0x034
#define	   VREG_V4R3C1_VCTRL_TO			      0x038
#define	   VREG_V4R3C1_SED_TO			      0x03c
#define	   VREG_V4R3C1_ITRANS_TO		      0x040
#define	   VREG_V4R3C1_PMV_TO			      0x044
#define	   VREG_V4R3C1_PRC_TO			      0x048
#define	   VREG_V4R3C1_RCN_TO			      0x04c
#define	   VREG_V4R3C1_DBLK_TO			      0x050
#define	   VREG_V4R3C1_PPFD_TO			      0x054
#define	   VREG_V4R3C1_PART_DEC_OVER_INT_LEVEL	      0x05c

//1d registers
#define	   VREG_V4R3C1_YSTADDR_1D		      0x060
#define	   VREG_V4R3C1_YSTRIDE_1D		      0x064
#define	   VREG_V4R3C1_UVOFFSET_1D		      0x068

//prc registers
#define	   VREG_V4R3C1_HEAD_INF_OFFSET		      0x06c
#define	   VREG_V4R3C1_LINE_NUM_STADDR		      0x070

//10Bit extra 2bit
#define	   VREG_V4R3C1_YSTRIDE_2BIT		      0x074
#define	   VREG_V4R3C1_YOFFSET_2BIT		      0x078
#define	   VREG_V4R3C1_UVOFFSET_2BIT		      0x07C

//ppfd registers
#define	   VREG_V4R3C1_PPFD_BUF_ADDR		      0x080
#define	   VREG_V4R3C1_PPFD_BUF_LEN		      0x084

#define	   VREG_V4R3C1_DNR_MBINFO_STADDR			0x090
#define	   VREG_V4R3C1_REF_PIC_TYPE					0x094
#define	   VREG_V4R3C1_FF_APT_EN						0x098
#define	   VREG_V4R3C1_DOWN_CLK_CFG		      0x09C

//performance count registers
#define	   VREG_V4R3C1_DEC_CYCLEPERPIC		      0x0B0
#define	   VREG_V4R3C1_RD_BDWIDTH_PERPIC	      0x0B4
#define	   VREG_V4R3C1_WR_BDWIDTH_PERPIC	      0x0B8
#define	   VREG_V4R3C1_RD_REQ_PERPIC		      0x0BC
#define	   VREG_V4R3C1_WR_REQ_PERPIC		      0x0C0

#define	   VREG_V4R3C1_MB0_QP_IN_CURR_PIC			0x0D0
#define	   VREG_V4R3C1_SWITCH_ROUNDING			0x0D4

//axi registers
#define	   VREG_V4R3C1_AXI_TEST_ST		      0x0E0
#define	   VREG_V4R3C1_AXI_TEST_MODE		      0x0E4
#define	   VREG_V4R3C1_AXI_TEST_ADDR		      0x0E8
#define	   VREG_V4R3C1_AXI_TEST_CMD		      0x0EC
#define	   VREG_V4R3C1_AXI_TEST_STA		      0x0F0
#define	   VREG_V4R3C1_AXI_TEST_RAM		      0x100  //0x100~0x13F

//rpr registers
#define	   VREG_V4R3C1_RPR_START		      0x140
#define	   VREG_V4R3C1_RPR_SRC_YSTADDR_1D	      0x144
#define	   VREG_V4R3C1_RPR_SRC_YSTRIDE_1D	      0x148
#define	   VREG_V4R3C1_RPR_SRC_UVOFFSET_1D	      0x14c
#define	   VREG_V4R3C1_RPR_SRC_WIDTH_HEIGHT	      0x150
#define	   VREG_V4R3C1_RPR_DST_YSTADDR_1D	      0x154
#define	   VREG_V4R3C1_RPR_DST_YSTRIDE_1D	      0x158
#define	   VREG_V4R3C1_RPR_DST_UVOFFSET_1D	      0x15c
#define	   VREG_V4R3C1_RPR_DST_WIDTH_HEIGHT	      0x160

//sed registers
#define	   VREG_V4R3C1_SED_STA			      0x1000
#define	   VREG_V4R3C1_SED_END0			      0x1014
#define	   VREG_V4R3C1_LUMA_HISTORGRAM		      0x8100
#define	   VREG_V4R3C1_LUMA_SUM_LOW		      0x8180
#define	   VREG_V4R3C1_LUMA_SUM_HIGH		      0x8184

//smmu
#define	   VREG_V4R3C1_SMMU_SCR			      0xf000

#define	   VREG_V4R3C1_SMMU_INTSTAT_S		      0xf018
#define	   VREG_V4R3C1_SMMU_INTCLR_S		      0xf01c

#define	   VREG_V4R3C1_SMMU_INTSTAT_NS		      0xf028
#define	   VREG_V4R3C1_SMMU_INTCLR_NS		      0xf02c

#ifdef ENV_SOS_KERNEL
#define	   VREG_V4R3C1_SMMU_CB_TTBR		      0xf208
#define	   VREG_V4R3C1_SMMU_ERR_RDADDR		      0xf2f0
#define	   VREG_V4R3C1_SMMU_ERR_WRADDR		      0xf2f4
#define	   VREG_V4R3C1_SMMU_INTMASK		      0xf010
#else
#define	   VREG_V4R3C1_SMMU_CB_TTBR		      0xf20c
#define	   VREG_V4R3C1_SMMU_ERR_RDADDR		      0xf304
#define	   VREG_V4R3C1_SMMU_ERR_WRADDR		      0xf308
#define	   VREG_V4R3C1_SMMU_INTMASK		      0xf020
#endif

#define	   VREG_V4R3C1_SMMU_FAULT_ADDR_RD_S	      0xf350
#define	   VREG_V4R3C1_SMMU_FAULT_ADDR_WR_S	      0xf330

#define	   VREG_V4R3C1_SMMU_FAULT_ADDR_RD_NS	      0xf360
#define	   VREG_V4R3C1_SMMU_FAULT_ADDR_WR_NS	      0Xf340

////////////////////////////////////////////////////////////////////////////// 以下是scd相关的寄存器
/* control registers */
#define	 REG_SCD_START	      0x800
#define	 REG_LIST_ADDRESS     0x804
#define	 REG_UP_ADDRESS	      0x808
#define	 REG_UP_LEN	      0x80c
#define	 REG_BUFFER_FIRST     0x810
#define	 REG_BUFFER_LAST      0x814
#define	 REG_BUFFER_INI	      0x818
#define	 REG_SCD_INT_MASK     0x81c
#define	 REG_SCD_PROTOCOL     0x820
#define	 REG_SCD_INI_CLR      0x824
/* state registers */
#define	 REG_SCD_OVER	      0x840
#define	 REG_SCD_INT	      0x844
#define	 REG_SCD_NUM	      0x84c
#define	 REG_ROLL_ADDR	      0x850
#define	 REG_SRC_EATEN	      0x854
//add 2012-03-21 3716cv200
#define	 REG_DSP_SPS_MSG_ADDRESS      0x828
#define	 REG_DSP_PPS_MSG_ADDRESS      0x82c
#define	 REG_DVM_MSG_ADDRESS	       0x830
#define	 REG_SED_TOP_ADDRESS	       0x834
#define	 REG_CA_MN_ADDRESS	       0x838
//end add
#define	 REG_SCD_CLK_CFG      0x880

#define	 REG_AVS_FLAG	    0x0000
#define	 REG_EMAR_ID	    0x0004
#define	 REG_VDH_SELRST	       0x0008
#define	 REG_VDH_ARBIT_CTRL_STATE	      0X0010
#define	 REG_VDH_CK_GT	     0x000c
#define	 REG_DSP_WATCH_DOG	       0X0018

#ifdef _cplusplus
}
#endif

#endif
