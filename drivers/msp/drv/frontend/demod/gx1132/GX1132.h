/*******************************************************************************
*                          CONFIDENTIAL                                                                                         
*        Hangzhou NationalChip Science and Technology Co., Ltd.                                               
*                      (C)2011, All right reserved                                                                            
********************************************************************************

********************************************************************************
* File Name	 :   	GX1132.h                                                                                                 
* Author		 :     Jerome Lou                                                                                                  
* Project    	 :   	GXAPI 
* Type      	 :     Driver
********************************************************************************
* Purpose   :   GX1132  driver
********************************************************************************
* Release History:
* VERSION   Date              AUTHOR          Description
*    1.0      2011.6.23        Jerome Lou      Original version  
********************************************************************************
*Abbreviation
*   GX		--	GUOXIN 
*   RF		--  radiate frequency
*   SNR		--	signal to noise ratio
*   OSC		--	oscillate
*   SPEC		--	spectrum
*   FREQ		--	frequency
********************************************************************************/
#if 1
#define print printk
#else
#define print(...)   ((void)0)
#endif

#undef SUCCESS
#undef FAILURE

//typedef float				f32;			/* Single precision floating point*/
//typedef double			f64;			/* Double precision floating point*/

typedef unsigned char boolean;
typedef unsigned char UINT8;

typedef unsigned int GX1132_STATE;

typedef enum _GX1132_POS_CTRL
{
	LNB_CTRL_LIMIT_WEST,
	LNB_CTRL_DRIVE_WEST,
	LNB_CTRL_LIMIT_EAST,
	LNB_CTRL_DRIVE_EAST,
	LNB_CTRL_STOP,
	LNB_CTRL_LIMIT_OFF,
	LNB_CTRL_STORE_NN,
	LNB_CTRL_GOTO_NN,
	LNB_CTRL_GOTO_XX 	,
	LNB_CTRL_SET_POSNS
}GX1132_POS_CTRL;

typedef enum _GX1132_MODU_TYPE
{
	UNKNOWN,
	DVBS,
	DIRECTV,
	DVBS2
	
}GX1132_MODU_TYPE;

typedef enum _GX1132_CODE_RATE_S
{
	CRXX,
	CR12,
	CR23,
	CR34,
	CR45,
	CR56,
	CR67,
	CR78	
}GX1132_CODE_RATE_S;

typedef enum _GX1132_CODE_RATE_S2
{
	CRXXX,
	QPSK14,
	QPSK13,
	QPSK25,
	QPSK12,
	QPSK35,
	QPSK23,
	QPSK34,
	QPSK45,
	QPSK56,
	QPSK89,
	QPSK910,
	_8PSK35,
	_8PSK23,
	_8PSK34,
	_8PSK56,
	_8PSK89,
	_8PSK910,
	_16APSK23,
	_16APSK34,
	_16APSK45,
	_16APSK56,
	_16APSK89,
	_16APSK910,
	_32APSK34,
	_32APSK45,
	_32APSK56,
	_32APSK89,
	_32APSK910
}GX1132_CODE_RATE_S2;

typedef enum _GX1132_LOCK_STATUS
{
	UNLOCKED,
	AGC_LOCKED,
	BCS_LOCKED,
	TIM_LOCKED,
	CRL_LOCKED,
	EQU_LOCKED,
	FEC_LOCKED
}GX1132_LOCK_STATUS;

typedef struct _GX1132_FINE_OFFSET
{	
	int	fc_offset_fine_K;
	int	fs_offset_fine_Sps;
}GX1132_FINE_OFFSET;

typedef struct _GX1132_TP_INFO
{
	unsigned int			Freq_true_KHz;
	unsigned int			SymolRate_true_Sps;
	unsigned char			V_polor;
	unsigned char			_22K_on;
	GX1132_MODU_TYPE		modu_mode;
	GX1132_CODE_RATE_S		code_rate_s;
	GX1132_CODE_RATE_S2	code_rate_s2;
}GX1132_TP_INFO;

typedef struct _GX1132_TP
{
	unsigned int	Freq_KHz;
	unsigned int	SymRate_KSps;
	unsigned char	V_polar;
	unsigned char	_22K_on;
}GX1132_TP;

#define BS_CB_MAIN_STAGE 1
#define BS_CB_MAX_MAIN   2
#define BS_CB_SUB_STAGE  4
#define BS_CB_MAX_SUB    8
#define BS_CB_RESULT     16

typedef struct _GX1132_BsBack
{
	unsigned int nMaskUpdate;
	unsigned int nMainStage;
	unsigned int nMaxMain;
	unsigned int nSubStage;
	unsigned int nMaxSub;
	GX1132_TP_INFO tpinfo;
	void *pPrivate;
}GX1132_BsBack;

typedef struct _GX1132_BCS_TYPE
{
	unsigned int Start_Freq_MHz;
	unsigned int End_Freq_MHz;
	unsigned char Ku_LNB;
	unsigned char dual_local_osc_LNB;
}GX1132_BCS_TYPE;

typedef GX1132_STATE (*TunerDriver)(unsigned int RFfreq,unsigned int Symbol_Rate);
typedef unsigned char (*bcs_callback)(GX1132_BsBack *bsback);

#define  FALSE				0
#define  TRUE				1

#define GX_WRITE				1
#define GX_READ  				0

#define SUCCESS				1
#define FAILURE				0	
#define TP_UNLOCK			0
#define TP_LOCK				1
#define TP_BAD				2

#define ENABLE				1
#define DISABLE				0

#define POL_SWITCH			0							/*18V/13V select, 0--low level for 18V and high level for 13V*/

#define IIC_REPEAT_SPEED      0							/*0--IIC speed below 150K,1--IIC speed from 150K to 300K,2--IIC speed from300K to 400K*/							                       

#define DEMO_PCB			3

#define TUNER_ZL10037		0							/*Select a tuner to use*/
#define TUNER_SHARP7306		0
#define TUNER_RDA5812		0
#define TUNER_AV2011		1
#define TUNER_STV6110A		0
#define TUNER_LW37     		0
#define TUNER_WZ5001		0
#define TUNER_MJ9014S		1

#define 		GX1132_CHIP_ADDRESS  			0xD0 
#define  	 	GX1132_OSCILLATE_FREQ		27	

#define	 	GX1132_TS_OUTPUT_MODE		0  			/*1: parallel output, 0:serial output*/
#define		GX1132_TS_CLK_POL 			0 			/*1: change the polarity of TS clk, 0: don't change*/

#if(DEMO_PCB==0)
#define 	  	CFG_TS_0						0x89		/*this default configure is compatible with GX3001 decoder board*/
#define 	  	CFG_TS_2						0xBA
#define 	  	CFG_TS_4						0x67
#define 	  	CFG_TS_6						0x45
#define 	  	CFG_TS_8						0x23
#define 	  	CFG_TS_A						0x01
#endif

#if(DEMO_PCB==1)
#define 	  	CFG_TS_0						0x10		/*this default configure is compatible with GX3001 decoder board*/
#define 	  	CFG_TS_2						0x32
#define 	  	CFG_TS_4						0x54
#define 	  	CFG_TS_6						0x76
#define 	  	CFG_TS_8						0xAB
#define 	  	CFG_TS_A						0x98
#endif

#if(DEMO_PCB==2)
#define 	  	CFG_TS_0						0xA8		/*this default configure is compatible with decoder board*/
#define 	  	CFG_TS_2						0x7B
#define 	  	CFG_TS_4						0x56
#define 	  	CFG_TS_6						0x34
#define 	  	CFG_TS_8						0x12
#define 	  	CFG_TS_A						0x90
#endif

#if(DEMO_PCB==3)
#define 	  	CFG_TS_0						0x10		/*this default configure is compatible with GX3001 decoder board*/
#define 	  	CFG_TS_2						0x32
#define 	  	CFG_TS_4						0x54
#define 	  	CFG_TS_6						0x76
#define 	  	CFG_TS_8						0xA8
#define 	  	CFG_TS_A						0x9B
#endif

#define	  	GX1132_PLL_ADC_D_VALUE			2			/*2^pll_od*/
#define  	  	GX1132_PLL_ADC_B_VALUE			53			/*fpll_adc=fosc/(pll_ref+1)*(pll_fb+1)/2^pll_od*/

#define	  	GX1132_PLL_SYS_D_VALUE			3			/*2^pll_od*/
#define  	  	GX1132_PLL_SYS_R_VALUE			1
#define  	  	GX1132_PLL_SYS_B_VALUE			59 //53			/*fpll_sys=fosc/(pll_ref+1)*(pll_fb+1)/2^pll_od*/

#define  	  	GX1132_PLL_FEC_D_VALUE			3			/*2^pll_od*/
#define  	  	GX1132_PLL_FEC_R_VALUE			1	
#define  	  	GX1132_PLL_FEC_B_VALUE			71			/*fpll_fec=fosc/(pll_ref+1)*(pll_fb+1)/2^pll_od*/

#define  	  	GX1132_FSAMPLE_VALUE			101250 //91125		/*the clk frequency of ADC sampling, same with sysclk, unit: KHz*/

#define  	  	GX1132_PLL_CFG_NUM_VALUE	5 //3			/*pll_sys/pll_fec=Cfg_Num/CFG_Denom*/
#define  	  	GX1132_PLL_CFG_DENOM_VALUE	6 //4

#define  GX1132_PLL_CFG_ADC_VALUE       9           /*pll_adc/pll_sys=Cfg_Adc/Cfg_Fc*/
#define  GX1132_PLL_CFG_FC_VALUE        10
#define 	  	GX1132_AGC_STD_VALUE			28

#define		GX1132_BS_STEP_MHZ 			12
#define		GX1132_BS_WINDOW_SIZE_K		45000

#if (TUNER_ZL10037==1)										/*Select the polarity of agc accoring different tuner*/
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_SHARP7306==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_RDA5812==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_AV2011==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_LW37==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_WZ5001==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
#if (TUNER_STV6110A==1)
		#define  	  	GX1132_AGC_POLARITY		0
#endif
#if (TUNER_MJ9014S==1)
		#define  	  	GX1132_AGC_POLARITY		1
#endif
/*-- Register Address Defination begin ---------------*/
#define GX1132_CHIP_ID_H				0x00
#define GX1132_CHIP_ID_L				0x01
#define GX1132_CHIP_VERSION			0x02
#define GX1132_CFG_CLK_RAT				0x03
#define GX1132_STBY_TSTRI				0x04
#define GX1132_PLL_ADC_RD				0x05
#define GX1132_I2C_REPEAT				0x06
#define GX1132_PLL_ADC_B				0x07
#define GX1132_PLL_SYS_RD				0x08
#define GX1132_PLL_SYS_B				0x09
#define GX1132_PLL_FEC_RD				0x0A
#define GX1132_PLL_FEC_B				0x0B
#define GX1132_ADC_CTRL0				0x0C
#define GX1132_ADC_CTRL1				0x0D
#define GX1132_PLL_Cfg_Num				0x0E
#define GX1132_PLL_Cfg_Denom			0x0F

#define GX1132_DISEQC_MODE			0x10
#define GX1132_DISEQC_RATIO_L			0x11
#define GX1132_DISEQC_RATIO_H			0x12
#define GX1132_DISEQC_GUARD			0x13
#define GX1132_DISEQC_WR_EN			0x14
#define GX1132_DISEQC_WR_CTRL			0x15
#define GX1132_DISEQC_RD_INT			0x16
#define GX1132_DISEQC_STATE			0x17
#define GX1132_DISEQC_IO_CTRL			0x1F

#define GX1132_DISEQC_INS1				0x20
#define GX1132_DISEQC_INS2				0x21
#define GX1132_DISEQC_INS3				0x22
#define GX1132_DISEQC_INS4				0x23
#define GX1132_DISEQC_INS5				0x24
#define GX1132_DISEQC_INS6				0x25
#define GX1132_DISEQC_INS7				0x26
#define GX1132_DISEQC_INS8				0x27
#define GX1132_DISEQC_RD_RESP1		0x28
#define GX1132_DISEQC_RD_RESP2		0x29
#define GX1132_DISEQC_RD_RESP3		0x2A
#define GX1132_DISEQC_RD_RESP4		0x2B
#define GX1132_DISEQC_RD_RESP5		0x2C
#define GX1132_DISEQC_RD_RESP6		0x2D
#define GX1132_DISEQC_RD_RESP7		0x2E
#define GX1132_DISEQC_RD_RESP8		0x2F

#define GX1132_RST						0x30
#define GX1132_ALL_OK					0x31
#define GX1132_NOISE_POW_L			0x32
#define GX1132_NOISE_POW_H			0x33
#define GX1132_MODULE_RST				0x34
#define GX1132_CLK_OK_SEL				0x35
#define GX1132_AUTO_RST				0x36
#define GX1132_WAIT_LENGTH			0x37
#define GX1132_DATA_SEL				0x38
#define GX1132_TRIG_POS				0x39
#define GX1132_DOWN_SAMPLE			0x3A
#define GX1132_DATA_CATCH				0x3B
#define GX1132_PDM_VALUE				0x3C
#define GX1132_TST_MOD_SEL			0x3F

#define GX1132_AGC_SPEED				0x40
#define GX1132_AGC_STD					0x41
#define GX1132_AGC_CTRL_OUT_L			0x42
#define GX1132_AGC_CTRL_OUT_H			0x43
#define GX1132_AGC_AMP_ERR			0x44
#define GX1132_AGC_SET_DATA			0x45
#define GX1132_AGC_MODE				0x46
#define GX1132_AGC_PDM_CLK			0x47
#define GX1132_AGC_LOST_TIME			0x48
#define GX1132_AGC_AMP					0x49
#define GX1132_SNR_DET_N_TIM_L		0x4A
#define GX1132_SNR_DET_N_TIM_H		0x4B

#define GX1132_MIN_FS					0x50
#define GX1132_BCS_BND1				0x51
#define GX1132_BCS_BND2				0x52
#define GX1132_BCS_BND3				0x53
#define GX1132_BCS_BND4				0x54
#define GX1132_BCS_BND5				0x55
#define GX1132_BCS_RST					0x56
#define GX1132_SAME_FC					0x57
#define GX1132_BCS_OUT_ADDR			0x58
#define GX1132_VID_SIG_NUM				0x59
#define GX1132_BCS_FC_OFFSET_L		0x5A
#define GX1132_BCS_FC_OFFSET_H		0x5B
#define GX1132_BCS_FS_L				0x5C
#define GX1132_BCS_FS_H				0x5D
#define GX1132_BCS_SIG_AMP				0x5E
#define GX1132_BCS_SIG_POW			0x5F

#define GX1132_Fsample_Cfg_L			0x70
#define GX1132_Fsample_Cfg_M			0x71
#define GX1132_Fsample_Cfg_H			0x72
#define GX1132_SYMBOL_L				0x73
#define GX1132_SYMBOL_H				0x74
#define GX1132_FC_OFFSET_L				0x75
#define GX1132_FC_OFFSET_H				0x76
#define GX1132_DAGC_CTL				0x77
#define GX1132_DAGC_STD				0x78
#define GX1132_TIM_LOOP_BW			0x79
#define GX1132_TIM_OK_BOUND			0x7A
#define GX1132_TIM_LOCK_CNT			0x7B
#define GX1132_TIM_LOST_CNT			0x7C
#define GX1132_INTG_OUT				0x7D
#define GX1132_SFIC_CTL1				0x7E
#define GX1132_SFIC_CTL2				0x7F

#define GX1132_FLAG_DMY				0x80
#define GX1132_PLH_THRESH				0x81
#define GX1132_FSCAN_RANGE			0x82
#define GX1132_FRAME_EST_NUM			0x83
#define GX1132_PD_GAIN 					0x84
#define GX1132_PFD_ALPHA				0x85
#define GX1132_BBC_BW_CTRL			0x86
#define GX1132_BW_CTRL2				0x87
#define GX1132_BW_PHASE_SEL			0x88
#define GX1132_FB_FSCAN				0x89
#define GX1132_BBC_OK_BOUND			0x8A
#define GX1132_BBC_LOCK_COUNT			0x8B
#define GX1132_FREQ_BACK_L				0x8C
#define GX1132_FREQ_BACK_H			0x8D
#define GX1132_SCAN_SPEED				0x8E
#define GX1132_MSK_PLL_OK				0x8F

#define GX1132_EQU_SPEED				0x90
#define GX1132_EQU_CTL					0x91
#define GX1132_SNR_DET_N_FINE_L		0x92
#define GX1132_SNR_DET_N_FINE_H		0x93
#define GX1132_AWGN_POW_L			0x94
#define GX1132_AWGN_POW_H			0x95
#define GX1132_SCRAM_1X1Y0X_H			0x96
#define GX1132_SCRAM_1X_M				0x97
#define GX1132_SCRAM_1X_L				0x98
#define GX1132_SCRAM_1Y_M				0x99
#define GX1132_SCRAM_1Y_L				0x9A
#define GX1132_SCRAM_0X_M				0x9B
#define GX1132_SCRAM_0X_L				0x9C
#define GX1132_FFE_CTRL1				0x9D
#define GX1132_FFE_CTRL2                          0x9E
#define GX1132_ERR_BND_AMP_RATE		0x9F

#define GX1132_LDPC_CTRL				0xA0
#define GX1132_LDPC_ITER_NUM			0xA1
#define GX1132_LDPC_SIGMA_NUM			0xA2

#define GX1132_BCH_ERR_THR				0xB0
#define GX1132_BCH_ERR_NUM_L			0xB1
#define GX1132_BCH_ERR_NUM_H			0xB2
#define GX1132_BCH_TST_SEL				0xB3
#define GX1132_BCH_ERR_STA_LEN_MOD	0xB4

#define GX1132_VIT_LEN_OPT				0xC0
#define GX1132_ICD_ERR_THR12			0xC1
#define GX1132_ICD_ERR_THR23			0xC2
#define GX1132_ICD_ERR_THR34			0xC3
#define GX1132_ICD_ERR_THR56			0xC4
#define GX1132_ICD_ERR_THR67			0xC5
#define GX1132_ICD_ERR_THR78			0xC6
#define GX1132_VIT_SYS_SEL				0xC7
#define GX1132_VIT_IQ_SHIFT			0xC8


#define GX1132_RSD_ERR_STATIC_CTRL	0xD0
#define GX1132_ERR_OUT_0				0xD1
#define GX1132_ERR_OUT_1				0xD2
#define GX1132_ERR_OUT_2				0xD3
#define GX1132_ERR_OUT_3				0xD4

#define GX1132_TS_MODE					0xE0
#define GX1132_PLS_0                                  0xE1
#define GX1132_PLS_1					0xE2
#define GX1132_PKT_LEN_SEL				0xE3
#define GX1132_CRC_ERR_THRESH_L		0xE4
#define GX1132_CRC_ERR_THRESH_H		0xE5
#define GX1132_CFG_TS_0				0xE6
#define GX1132_CFG_TS_2				0xE7
#define GX1132_CFG_TS_4				0xE8
#define GX1132_CFG_TS_6				0xE9
#define GX1132_CFG_TS_8				0xEA
#define GX1132_CFG_TS_A				0xEB
#define GX1132_CRC_ERR_SUM_L			0xEC
#define GX1132_CRC_ERR_SUM_H			0xED
#define GX1132_MODU_MODE				0xEE
#define GX1132_S2_MODE_CODE			0xEF

#define GX1132_A_MATYPE1				0xF0
#define GX1132_A_MATYPE2				0xF1
#define GX1132_A_UPL_L					0xF2
#define GX1132_A_UPL_H					0xF3
#define GX1132_A_SYNC					0xF4
#define GX1132_B_MATYPE1				0xF5
#define GX1132_B_MATYPE2				0xF6
#define GX1132_B_UPL_L					0xF7
#define GX1132_B_UPL_H					0xF8
#define GX1132_B_SYNC					0xF9
#define GX1132_CA_CTRL					0xFA
#define GX1132_CA_DIV					0xFB
#define GX1132_ISSY						0xFC
/*-- Register Address Defination end ---------------*/

/*-- diseqc control byte(standard) ---------------*/
#define	GX1132_DISEQC_CMD1			0xE0
#define	GX1132_DISEQC_CMD2			0x10
#define	GX1132_DISEQC_CMD3			0x38
#define	GX1132_DISEQC_CMD3_1			0x39
#define	GX1132_DISEQC_CMD4_LNB1		0xF0
#define	GX1132_DISEQC_CMD4_LNB2		0xF4
#define	GX1132_DISEQC_CMD4_LNB3		0xF8
#define	GX1132_DISEQC_CMD4_LNB4		0xFC
#define	GX1132_DISEQC_CMD4_SW01        0xF0
#define	GX1132_DISEQC_CMD4_SW02        0xF1
#define	GX1132_DISEQC_CMD4_SW03        0xF2
#define	GX1132_DISEQC_CMD4_SW04        0xF3
#define	GX1132_DISEQC_CMD4_SW05        0xF4
#define	GX1132_DISEQC_CMD4_SW06        0xF5
#define	GX1132_DISEQC_CMD4_SW07        0xF6
#define	GX1132_DISEQC_CMD4_SW08        0xF7
#define	GX1132_DISEQC_CMD4_SW09        0xF8
#define	GX1132_DISEQC_CMD4_SW10        0xF9
#define	GX1132_DISEQC_CMD4_SW11        0xFA
#define	GX1132_DISEQC_CMD4_SW12        0xFB
#define	GX1132_DISEQC_CMD4_SW13        0xFC
#define	GX1132_DISEQC_CMD4_SW14        0xFD
#define	GX1132_DISEQC_CMD4_SW15        0xFE
#define	GX1132_DISEQC_CMD4_SW16        0xFF
/*-- diseqc control byte(standard) ---------------*/

GX1132_STATE GX1132_set_tuner(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_RDA5812(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_Sharp7306(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_ZL10037(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_AV2011( unsigned int RFfreq, unsigned int Symbol_Rate);
GX1132_STATE GX_Set_STV6110A(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_LW37(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_WZ5001(unsigned int RFfreq,unsigned int Symbol_Rate);
GX1132_STATE GX_Set_MJ9014S(unsigned int RFfreq,unsigned int Symbol_Rate);

void GX_Delay_N_ms(unsigned int ms_value);
unsigned char GX_I2cReadWrite(unsigned char WR_flag, unsigned char ChipAddress,unsigned char RegAddress,unsigned char *data, unsigned char data_number);
unsigned char GX_I2cReadWrite2(unsigned char WR_flag, unsigned char ChipAddress,unsigned char RegAddress,unsigned char *data, unsigned char data_number);
char *GX1132_Get_Driver_Version(void);
unsigned char GX1132_Write_one_Byte(unsigned char RegAddress,unsigned char WriteValue);
unsigned char GX1132_Write_one_Byte_ReadTest(unsigned char RegAddress,unsigned char WriteValue);
unsigned char GX1132_Read_one_Byte(unsigned char RegAddress);
GX1132_STATE GX1132_Get_Chip_ID(void);
unsigned char GX1132_HotReset_CHIP(void);
unsigned char GX1132_CoolReset_CHIP(void);
unsigned char GX1132_ADC_Init(void);
unsigned char GX1132_PLL_Control(void);
unsigned char GX1132_Set_Sleep(unsigned char Sleep);
unsigned char GX1132_Set_Tuner_Repeater_Enable(unsigned char Rpt_On);
unsigned char GX1132_Set_AGC_Parameter(void);
unsigned char GX1132_Set_TS_Inteface(void);
unsigned char GX1132_Set_Ts_Out_Disable(unsigned char ts_off);
unsigned char GX1132_Set_VCM_Modcod(unsigned char sel_modcod);
unsigned char GX1132_Set_VCM_TS_2nd(unsigned char ts_sel_2);
unsigned char GX1132_Set_Work_BS_Mode(unsigned char bs);
int GX1132_SetSymbolRate(unsigned int Symbol_Rate_Value);
unsigned char GX1132_Set_Polar(unsigned char Vpolor);
unsigned char GX1132_22K_sw(unsigned char b22k_on);
unsigned char GX1132_Sel_Lnb(unsigned char Lnb_Num);
unsigned char GX1132_Diseqc_11(unsigned char chCom,unsigned char Lnb_Num);
unsigned char GX1132_Pos_Ctl(GX1132_POS_CTRL Pos_Ctl,unsigned char Record_byte);
unsigned char GX1132_Change2percent(unsigned int value,unsigned int low,unsigned int high);
unsigned int GX1132_100Log(int iNumber_N);
unsigned char GX1132_Init_Chip(unsigned char i2c_bus);
GX1132_LOCK_STATUS GX1132_Read_Lock_Status(void);
unsigned int GX1132_Get_100SNR_Tim(void);
unsigned int  GX1132_Get_100SNR(void);
unsigned char GX1132_Get_Signal_Strength(void);
unsigned char GX1132_Get_Signal_Quality(void);
unsigned int GX1132_Get_ErrorRate(unsigned char *E_param);
unsigned char GX1132_Get_VCM_Mode(void);
unsigned char GX1132_lock_TP(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver);
unsigned char GX1132_lock_TP_BS(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver);
unsigned char GX1132_Search_Signal(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver);
unsigned char GX1132_Search_Signal_BS(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver);
GX1132_FINE_OFFSET GX1132_Get_Fine_Offset(void);
GX1132_TP_INFO GX1132_Get_TP_Info(unsigned int RF_Freq_K,unsigned int Symbol_Rate_K);

unsigned int GX1132_BS_one_Window(unsigned int Fcenter,unsigned int Lpf_BW_window,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver);
unsigned int GX1132_BS_Seg_Freq(unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver);
unsigned int GX1132_BS_TP_Sort_Seg_Freq(unsigned int u32TunerPort, unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver);
unsigned char GX1132_BS_Lock_List(unsigned int u32TunerPort, unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size, TunerDriver tunerDriver,bcs_callback lock_cb,GX1132_BsBack *BsbackPar);

unsigned char GX1132_BS_lock_a_Satellite(unsigned int u32TunerPort, GX1132_BCS_TYPE *bcs_type,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver, bcs_callback lock_cb,GX1132_BsBack *BsbackPar);

unsigned char GX1132_DATA_CATCH_AGC(unsigned int Start_freq_MHz,unsigned int End_freq_MHz,unsigned int BW_window,
								TunerDriver tunerDriver);

unsigned char GX1132_Const(void);
unsigned int  GX1132_Set_Fb_Gain(void);
unsigned char GX1132_Sel_PLL_Use(unsigned char pll_sel);
unsigned char GX1132_SendTone(int mode);
unsigned char GX1132_SendDiseqc(unsigned char *data, int len);

//GX1132_STATE Tuner_control(unsigned int RFfreq, unsigned int Symbol_Rate);
