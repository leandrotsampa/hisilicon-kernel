/*
 *           Copyright 2007-2014 Availink, Inc.
 *
 *  This software contains Availink proprietary information and
 *  its use and disclosure are restricted solely to the terms in
 *  the corresponding written license agreement. It shall not be
 *  disclosed to anyone other than valid licensees without
 *  written permission of Availink, Inc.
 *
 */




#ifndef AVL_COMMONINTERNAL_H
#define AVL_COMMONINTERNAL_H

#ifdef AVL_CPLUSPLUS
extern "C" {
#endif

//SDK Version
#define AVL_API_VER_MAJOR                   0x02
#define AVL_API_VER_MINOR                   10
#define AVL_API_VER_BUILD                   0x07


// sky(TEST)
#define AVL6762_FAMILYID                	0x68624955
#define AVL68XX                            	AVL6762_FAMILYID

#define AVL_FW_CMD_IDLE                   	0
#define AVL_FW_CMD_LD_DEFAULT              	1
#define AVL_FW_CMD_ACQUIRE                 	2
#define AVL_FW_CMD_HALT                   	3
#define AVL_FW_CMD_DEBUG                 	4
#define AVL_FW_CMD_SLEEP                   	7
#define AVL_FW_CMD_WAKE                    	8
#define AVL_FW_CMD_BLIND_SCAN             	9
#define AVL_FW_CMD_SDRAM_TEST             	16
#define AVL_FW_CMD_INIT_SDRAM             	17
#define AVL_FW_CMD_INIT_ADC               	18
#define AVL_FW_CMD_CHANGE_MODE            	19

#define AVL_FW_CMD_DMA                    	21
#define AVL_FW_CMD_CALC_CRC                	22
#define AVL_FW_CMD_PING                    	23
#define AVL_FW_CMD_DECOMPRESS             	24

/*
 * Patch file stuff
 */
#define PATCH_VAR_ARRAY_SIZE                32

#define PATCH_CMD_VALIDATE_CRC              0
#define PATCH_CMD_PING                      1
#define PATCH_CMD_LD_TO_DEVICE              2
#define PATCH_CMD_DMA                       3
#define PATCH_CMD_DECOMPRESS                4
#define PATCH_CMD_ASSERT_CPU_RESET          5
#define PATCH_CMD_RELEASE_CPU_RESET         6
#define PATCH_CMD_LD_TO_DEVICE_IMM          7
#define PATCH_CMD_RD_FROM_DEVICE            8
#define PATCH_CMD_DMA_HW                    9
#define PATCH_CMD_SET_COND_IMM              10
#define PATCH_CMD_EXIT                      11


#define PATCH_CMP_TYPE_ZLIB                 0
#define PATCH_CMP_TYPE_ZLIB_NULL            1
#define PATCH_CMP_TYPE_GLIB                 2
#define PATCH_CMP_TYPE_NONE                 3

//Addr modes 2 bits
#define PATCH_OP_ADDR_MODE_VAR_IDX          0
#define PATCH_OP_ADDR_MODE_IMMIDIATE        1

//Unary operators 6 bits
#define PATCH_OP_UNARY_NOP                  0
#define PATCH_OP_UNARY_LOGICAL_NEGATE       1
#define PATCH_OP_UNARY_BITWISE_NEGATE       2
#define PATCH_OP_UNARY_BITWISE_AND          3
#define PATCH_OP_UNARY_BITWISE_OR           4

//Binary operators 1 Byte
#define PATCH_OP_BINARY_LOAD                0
#define PATCH_OP_BINARY_AND                 1
#define PATCH_OP_BINARY_OR                  2
#define PATCH_OP_BINARY_BITWISE_AND         3
#define PATCH_OP_BINARY_BITWISE_OR          4
#define PATCH_OP_BINARY_EQUALS              5
#define PATCH_OP_BINARY_STORE               6
#define PATCH_OP_BINARY_NOT_EQUALS          7

#define PATCH_COND_EXIT_AFTER_LD            8

#define PATCH_STD_DVBC                      0
#define PATCH_STD_DVBSx                     1
#define PATCH_STD_DVBTx                     2
#define PATCH_STD_ISDBT                     3

#define tuner_i2c_srst_offset                0x0
#define tuner_i2c_cntrl_offset               0x4
#define tuner_i2c_bit_rpt_clk_div_offset     0x18
#define tuner_i2c_bit_rpt_cntrl_offset       0x1C

#define esm_cntrl_offset                    0x4
#define bit_error_offset                    0x8
#define byte_num_offset                     0xC
#define packet_error_offset                 0x10
#define packet_num_offset                   0x14
#define tick_clear_offset                   0x88
#define tick_type_offset                    0x8C
#define time_tick_low_offset                0x90
#define time_tick_high_offset               0x94
#define byte_tick_low_offset                0x98
#define byte_tick_high_offset               0x9C
#define esm_mode_offset                     0xC0

#define rs_current_active_mode_iaddr_offset 0x24
#define rc_fw_command_saddr_offset          0x00
#define rc_fw_last_command_saddr_offset     0x02
#define rs_core_ready_word_iaddr_offset     0xa0
#define rc_sdram_test_return_iaddr_offset   0x3C
#define rc_sdram_test_result_iaddr_offset   0x40
#define rs_rf_agc_saddr_offset              0x44

#define rc_fw_command_args_addr_iaddr_offset 0x58

#define rc_ts_cntns_clk_frac_d_iaddr_offset                 0x0000007c
#define rc_ts_cntns_clk_frac_n_iaddr_offset                 0x00000078
#define rc_enable_ts_continuous_caddr_offset                0x0000003a
#define rc_ts_clock_edge_caddr_offset                       0x0000003b
#define rc_ts_serial_caddr_offset                           0x0000003c
#define rc_ts_serial_outpin_caddr_offset                    0x0000003f
#define rc_ts_serial_msb_caddr_offset                       0x0000003e
#define rc_ts_packet_len_caddr_offset                       0x00000039
#define rc_ts_packet_order_caddr_offset                     rc_ts_serial_msb_caddr_offset
#define rc_ts_error_bit_en_caddr_offset                     0x000000000
#define rc_ts_error_polarity_caddr_offset                   0x00000041
#define rc_ts_valid_polarity_caddr_offset                   0x00000040
#define rc_ts_sync_pulse_caddr_offset                       0x00000097
#define ts_clock_phase_caddr_offset                         0x00000096

#define rs_patch_ver_iaddr_offset           0x00000004

//GPIO control
#define agc1_sel_offset                          0x00
#define agc2_sel_offset                          0x10
#define lnb_cntrl_1_sel_offset                   0x08
#define lnb_cntrl_0_sel_offset                   0x0c
#define lnb_cntrl_1_i_offset                     0x48
#define lnb_cntrl_0_i_offset                     0x4c


#define hw_AVL_rx_rf_aagc_gain              0x160888


//Define ADC channel selection
typedef enum AVL_ADC_Channel
{
    AVL_ADC_CHAN2   =   0,
    AVL_ADC_CHAN1   =   1,
    AVL_ADC_OFF     =   2
}AVL_ADC_Channel;

typedef enum AVL_ADC_Output_format
{
    AVL_2COMP    =   0,
    AVL_OFFBIN   =   1
}AVL_ADC_Output_format;

//Input_select enumeration definitions
typedef enum AVL_DDC_Input
{
    AVL_DIG_IN       =   0,
    AVL_ADC_IN       =   1,
    AVL_VEC_IN       =   2,
    AVL_VEC1x_IN     =   3,
    AVL_DIG1x_IN     =   4
}AVL_DDC_Input;

// Defines BER type
typedef enum AVL_BER_Type
{
    AVL_PRE_VITERBI_BER     =   0,                      // previous viterbi BER will be acquired.
    AVL_POST_VITERBI_BER    =   1,                      // post viterbi BER will be acquired.
    AVL_PRE_LDPC_BER        =   2,                      // previous LDPC BER will be acquired.
    AVL_POST_LDPC_BER       =   3,                      // post LDPC BER will be acquired.
    AVL_FINAL_BER           =   4                       // final BER will be acquired.
}AVL_BER_Type;

// Defines different standards supported by the demod.
typedef enum AVL_DemodMode
{
    AVL_DVBC = 0,
    AVL_DVBSX = 1,
    AVL_DVBTX = 2,
    AVL_ISDBT = 3,
    AVL_DTMB = 4,
    AVL_ISDBS = 5,
    AVL_ABSS = 6,
    AVL_ATSC = 7,
    AVL_DVBC2 = 8
} AVL_DemodMode;

// Defines the channel lock mode.
typedef enum AVL_LockMode
{
    AVL_LOCK_MODE_AUTO      =   0,                      // lock channel automatically.
    AVL_LOCK_MODE_MANUAL    =   1                       // lock channel manually.
}AVL_LockMode;

// Defines channel lock status
typedef enum AVL_LockStatus
{
    AVL_STATUS_UNLOCK   =   0,                          // channel isn't locked
    AVL_STATUS_LOCK     =   1                           // channel is in locked state.
}AVL_LockStatus;

typedef enum AVL_TSMode
{
    AVL_TS_PARALLEL = 0,
    AVL_TS_SERIAL =   1
}AVL_TSMode;

typedef enum AVL_TSClockEdge
{
    AVL_MPCM_FALLING   =   0,
    AVL_MPCM_RISING    =   1
} AVL_TSClockEdge;

typedef enum AVL_TSClockMode
{
    AVL_TS_CONTINUOUS_ENABLE = 0,
    AVL_TS_CONTINUOUS_DISABLE = 1
} AVL_TSClockMode;

typedef enum AVL_TSSerialPin
{
    AVL_MPSP_DATA0  =   0,
    AVL_MPSP_DATA7  =   1
} AVL_TSSerialPin;

typedef enum AVL_TSSerialOrder
{
    AVL_MPBO_LSB = 0,
    AVL_MPBO_MSB = 1
} AVL_TSSerialOrder;

typedef enum AVL_TSSerialSyncPulse
{
    AVL_TS_SERIAL_SYNC_8_PULSE    =   0,
    AVL_TS_SERIAL_SYNC_1_PULSE      =   1
} AVL_TSSerialSyncPulse;

typedef enum AVL_TSErrorBit
{
    AVL_TS_ERROR_BIT_DISABLE  =   0,
    AVL_TS_ERROR_BIT_ENABLE   =   1
} AVL_TSErrorBit;

typedef enum AVL_TSErrorPolarity
{
    AVL_MPEP_Normal = 0,
    AVL_MPEP_Invert = 1
} AVL_TSErrorPolarity;

typedef enum AVL_TSValidPolarity
{
    AVL_MPVP_Normal     =   0,
    AVL_MPVP_Invert     =   1
} AVL_TSValidPolarity;

typedef enum AVL_TSPacketLen
{
    AVL_TS_188 = 0,
    AVL_TS_204 = 1
} AVL_TSPacketLen;

typedef enum AVL_AGCPola
{
    AVL_AGC_NORMAL  =   0,        //  normal AGC polarity. Used for a tuner whose gain increases with increased AGC voltage.
    AVL_AGC_INVERTED=   1         //  inverted AGC polarity. Used for tuner whose gain decreases with increased AGC voltage.
}AVL_AGCPola;

typedef enum AVL_TSParallelOrder
{
    AVL_TS_PARALLEL_ORDER_INVERT =   0,
    AVL_TS_PARALLEL_ORDER_NORMAL =   1
} AVL_TSParallelOrder;

typedef enum AVL_TSParallelPhase
{
    AVL_TS_PARALLEL_PHASE_0 = 0,
    AVL_TS_PARALLEL_PHASE_1 = 1,
    AVL_TSG_PARALLEL_PHASE_2 = 2,
    AVL_TS_PARALLEL_PHASE_3 = 3
}AVL_TSParallelPhase;

// Stores an unsigned 64-bit integer
typedef struct AVLuint64
{
    AVL_uint32 uiHighWord;                  // The most significant 32-bits of the unsigned 64-bit integer
    AVL_uint32 uiLowWord;                   // The least significant 32-bits of the unsigned 64-bit integer
}AVLuint64;

// Stores a signed 64-bit integer
typedef struct AVLint64
{
    AVL_int32 iHighWord;                   // The most significant 32-bits of the signed 64-bit integer
    AVL_uint32 uiLowWord;                   // The least significant 32-bits of the signed 64-bit integer
}AVLint64;

// Defines whether the feeback bit of the LFSR used to generate the BER/PER test pattern is inverted.
typedef enum AVL_LFSR_FbBit
{
    AVL_LFSR_FB_NOT_INVERTED    =   0,          // LFSR feedback bit isn't inverted
    AVL_LFSR_FB_INVERTED        =   1           // LFSR feedback bit is inverted
}AVL_LFSR_FbBit;

// Defines the test pattern being used for BER/PER measurements.
typedef enum AVL_TestPattern
{
    AVL_TEST_LFSR_15    =   0,                  // BER test pattern is LFSR15
    AVL_TEST_LFSR_23    =   1                   // BER test pattern is LFSR23
}AVL_TestPattern;

// Defines the type of auto error statistics
typedef enum AVL_AutoErrorStat_Type
{
    AVL_ERROR_STAT_BYTE     =   0,                      // error statistics will be reset according to the number of received bytes.
    AVL_ERROR_STAT_TIME     =   1                       // error statistics will be reset according to time interval.
}AVL_AutoErrorStat_Type;

// Defines Error statistics mode
typedef enum AVL_ErrorStat_Mode
{
    AVL_ERROR_STAT_MANUAL   =   0,
    AVL_ERROR_STAT_AUTO     =   1
}AVL_ErrorStat_Mode;

//Emerald2  PLL
#define hw_E2_AVLEM61_reset_register                       0x00100000
#define hw_E2_AVLEM61_dll_init                             0x00100008
#define hw_E2_AVLEM61_deglitch_mode                        0x00100010
#define hw_E2_AVLEM61_sys_pll_bypass                       0x00100040
#define hw_E2_AVLEM61_sys_pll_enable                       0x00100044
#define hw_E2_AVLEM61_sys_pll_divr                         0x00100048
#define hw_E2_AVLEM61_sys_pll_divf                         0x0010004c
#define hw_E2_AVLEM61_sys_pll_divq                         0x00100050
#define hw_E2_AVLEM61_sys_pll_range                        0x00100054
#define hw_E2_AVLEM61_sys_pll_lock                         0x00100058
#define hw_E2_AVLEM61_mpeg_pll_bypass                      0x0010005c
#define hw_E2_AVLEM61_mpeg_pll_enable                      0x00100060
#define hw_E2_AVLEM61_mpeg_pll_divr                        0x00100064
#define hw_E2_AVLEM61_mpeg_pll_divf                        0x00100068
#define hw_E2_AVLEM61_mpeg_pll_divq                        0x0010006c
#define hw_E2_AVLEM61_mpeg_pll_range                       0x00100070
#define hw_E2_AVLEM61_mpeg_pll_lock                        0x00100074
#define hw_E2_AVLEM61_adc_pll_bypass                       0x00100078
#define hw_E2_AVLEM61_adc_pll_enable                       0x0010007c
#define hw_E2_AVLEM61_adc_pll_divr                         0x00100080
#define hw_E2_AVLEM61_adc_pll_divf                         0x00100084
#define hw_E2_AVLEM61_adc_pll_divq                         0x00100088
#define hw_E2_AVLEM61_adc_pll_range                        0x0010008c
#define hw_E2_AVLEM61_adc_pll_lock                         0x00100090
#define hw_E2_AVLEM61_mpeg_pll_reset                       0x00100094
#define hw_E2_AVLEM61_adc_pll_reset                        0x00100098
#define hw_E2_AVLEM61_sys_pll_reset                        0x0010009c
#define hw_E2_AVLEM61_sys_pll_enable2                      0x001000b4
#define hw_E2_AVLEM61_sys_pll_enable3                      0x001000b8
#define hw_E2_AVLEM61_sys_pll_divq2                        0x001000bc
#define hw_E2_AVLEM61_sys_pll_divq3                        0x001000c0
#define hw_E2_AVLEM61_mpeg_pll_enable2                     0x001000c4
#define hw_E2_AVLEM61_mpeg_pll_enable3                     0x001000c8
#define hw_E2_AVLEM61_mpeg_pll_divq2                       0x001000cc
#define hw_E2_AVLEM61_mpeg_pll_divq3                       0x001000d0
#define hw_E2_AVLEM61_adc_pll_enable2                      0x001000d4
#define hw_E2_AVLEM61_adc_pll_enable3                      0x001000d8
#define hw_E2_AVLEM61_adc_pll_divq2                        0x001000dc
#define hw_E2_AVLEM61_adc_pll_divq3                        0x001000e0
#define hw_E2_AVLEM61_ddc_clk_sel                          0x001000e4
#define hw_E2_AVLEM61_sdram_clk_sel                        0x001000e8
#define hw_E2_AVLEM61_dll_out_phase                        0x00100100
#define hw_E2_AVLEM61_dll_rd_phase                         0x00100104

typedef struct AVL_PLL_Conf0
{
    AVL_uint32 m_RefFrequency_Hz;                   // The reference clock frequency in units of Hz.
    AVL_uchar m_PLL_CoreClock_DivR;                 // PLL reference clock divider value
    AVL_uchar m_PLL_CoreClock_DivF;                 // PLL feedback clock divider value
    AVL_uchar m_PLL_CoreClock_DivQ;                 // PLL feedback clock divider value
    AVL_uchar m_PLL_MPEGClock_DivR;                 // PLL reference clock divider value
    AVL_uchar m_PLL_MPEGClock_DivF;                 // PLL feedback clock divider value
    AVL_uchar m_PLL_MPEGClock_DivQ;                 // PLL feedback clock divider value
    AVL_uchar m_PLL_ADCClock_DivR;                  // PLL reference clock divider value
    AVL_uchar m_PLL_ADCClock_DivF;                  // PLL feedback clock divider value
    AVL_uchar m_PLL_ADCClock_DivQ;                  // PLL feedback clock divider value
    AVL_uint32 m_CoreFrequency_Hz;                  // The internal core clock frequency in units of Hz.
    AVL_uint32 m_MPEGFrequency_Hz;                  // The MPEG clock frequency in units of Hz.
    AVL_uint32 m_ADCFrequency_Hz;                   // The ADC clock frequency in units of Hz.
    AVL_uchar m_PLL_DDCClock_sel;                   // ddc_clk source select (Emerald2 only)
    AVL_uchar m_PLL_DDCClock_DivQ;                  // PLL feedback clock divider value(Emerald2 only)
    AVL_uchar m_PLL_SDRAMClock_sel;                 // sdram_clk source select (Emerald2 only)
    AVL_uchar m_PLL_SDRAMClock_DivQ;                // PLL feedback clock divider value(Emerald2 only)
    AVL_uint32 m_DDCFrequency_Hz;                   // The DDC clock frequency in units of Hz (Emerald2 only).
    AVL_uint32 m_SDRAMFrequency_Hz;                 // The SDRAM clock frequency in units of Hz (Emerald2 only).
}AVL_PLL_Conf0;


#define hw_E2_PLL_SEL_CORE 0
#define hw_E2_PLL_SEL_MPEG 1
#define hw_E2_PLL_SEL_ADC  2


// Used to configure the AVL PART device SDRAM controller.
typedef struct AVL_SDRAM_Conf0
{
    AVL_uint16 m_SDRAM_TRC;             // SDRAM active to active command period in ns.
    AVL_uint16 m_SDRAM_TXSR;            // SDRAM exit self-refresh to active command period in ns.
    AVL_uint16 m_SDRAM_TRCAR;           // SDRAM auto refresh period in ns.  Minimum time between two auto refresh commands.
    AVL_uint16 m_SDRAM_TWR;             // SDRAM write recovery time in SDRAM clock cycles->  The delay from the last data in to the next precharge command.  Valid range is 1 to 4 clock cycles->
    AVL_uint16 m_SDRAM_TRP;             // SDRAM precharge period in ns.
    AVL_uint16 m_SDRAM_TRCD;            // SDRAM minimum delay between active and read/write commands in ns.
    AVL_uint16 m_SDRAM_TRAS;            // SDRAM minimum delay between active and precharge commands in ns.
    AVL_uint16 m_SDRAM_CAS_Latency;     // SDRAM delay between read command and availability of first data in SDRAM clock cycles->  Valid range is 1 to 4 clock cycles->
}AVL_SDRAM_Conf0;

// Defines the DiSEqC status
typedef enum AVL_DiseqcStatus
{
    AVL_DOS_Uninitialized = 0,                  // DiSEqC has not been initialized yet.
    AVL_DOS_Initialized   = 1,                  // DiSEqC has been initialized.
    AVL_DOS_InContinuous  = 2,                  // DiSEqC is in continuous mode.
    AVL_DOS_InTone        = 3,                  // DiSEqC is in tone burst mode.
    AVL_DOS_InModulation  = 4                   // DiSEqC is in modulation mode.
}AVL_DiseqcStatus;

// Contains variables for storing error statistics used in the BER and PER calculations.
typedef  struct AVL_ErrorStats
{
    AVL_uint16 usLFSRSynced;    // Indicates whether the receiver is synchronized with the transmitter generating the BER test pattern.
    AVL_uint16 usLostLock;      // Indicates whether the receiver has lost lock since the BER/PER measurement was started.
    AVLuint64 stSwCntNumBits;     // A software counter which stores the number of bits which have been received.
    AVLuint64 stSwCntBitErrors;   // A software counter which stores the number of bit errors which have been detected.
    AVLuint64 stNumBits;          // The total number of bits which have been received.
    AVLuint64 stBitErrors;        // The total number of bit errors which have been detected.
    AVLuint64 stSwCntNumPkts;     // A software counter which stores the number of packets which have been received.
    AVLuint64 stSwCntPktErrors;   // A software counter which stores the number of packet errors which have been detected.
    AVLuint64 stNumPkts;          // The total number of packets which have been received.
    AVLuint64 stPktErrors;        // The total number of packet errors which have been detected.
    AVL_uint32 uiBER;             // The bit error rate scaled by 1e9.
    AVL_uint32 uiPER;             // The packet error rate scaled by 1e9.
}AVL_ErrorStats;

typedef enum AVL_Demod_Xtal
{
    Xtal_30M = 0,
    Xtal_16M,
    Xtal_24M,
    Xtal_27M
} AVL_Demod_Xtal;

typedef enum AVL_InputPath
{
    AVL_IF_I,
    AVL_IF_Q
} AVL_InputPath;

// Contains variables for storing error statistics used in the BER and PER calculations.
typedef  struct AVL_ErrorStatConfig
{
    AVL_ErrorStat_Mode      eErrorStatMode;           // indicates the error statistics mode.
    AVL_AutoErrorStat_Type  eAutoErrorStatType;       // indicates the MPEG data sampling clock mode.
    AVL_uint32              uiTimeThresholdMs;        // used to set time interval for auto error statistics.
    AVL_uint32              uiNumberThresholdByte;    // used to set the received byte number threshold for auto error statistics.
}AVL_ErrorStatConfig;

// Contains variables for storing error statistics used in the BER and PER calculations.
typedef  struct AVL_BERConfig
{
    AVL_TestPattern         eBERTestPattern;         // indicates the pattern of LFSR.
    AVL_LFSR_FbBit          eBERFBInversion;         // indicates LFSR feedback bit inversion.
    AVL_uint32              uiLFSRSynced;                // indicates the LFSR synchronization status.
    AVL_uint32              uiLFSRStartPos;         //set LFSR start byte positon
}AVL_BERConfig;

typedef enum AVL_GPIOPinNumber
{
    AVL_Pin37 = 0,
    AVL_Pin38 = 1
}AVL_GPIOPinNumber;

typedef enum AVL_GPIOPinValue
{
    AVL_LOGIC_0 = 0,
    AVL_LOGIC_1 = 1,
    AVL_HIGH_Z = 2
}AVL_GPIOPinValue;



void IBase_LoadRegisterBaseAddr_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode InitSemaphore_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode IBase_Initialize_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode TunerI2C_Initialize_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode EnableTSOutput_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode DisableTSOutput_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode InitErrorStat_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode ErrorStatMode_Demod(AVL_ErrorStatConfig stErrorStatConfig,AVL_uint32 uiChipNo);
AVL_ErrorCode ResetErrorStat_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode ResetPER_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode ResetBER_Demod(AVL_BERConfig *pstErrorStatConfig, AVL_uint32 uiChipNo);
AVL_ErrorCode SetPLL_Demod(   AVL_uint32 uiChipNo);
AVL_ErrorCode IBase_CheckChipReady_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode IRx_Initialize_Demod(AVL_uint32 uiChipNo);
//AVL_ErrorCode IBase_SendRxOP_Demod(AVL_uchar ucOpCmd, AVL_uint32 uiChipNo);
AVL_ErrorCode IBase_SendRxOPWait_Demod(AVL_uchar ucOpCmd, AVL_uint32 uiChipNo);
AVL_ErrorCode IBase_GetRxOPStatus_Demod(AVL_uint32 uiChipNo);
//AVL_ErrorCode IBase_GetRxOPLastCmd_Demod(AVL_uchar ucOpCmd, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSMode_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode SetInternalFunc_Demod(AVL_DemodMode eDemodMode, AVL_uint32 uiChipNo);
AVL_ErrorCode SetAGCPola_Demod(AVL_AGCPola enumAGCPola, AVL_uint32 uiChipNo);
AVL_ErrorCode EnableTCAGC_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode DisableTCAGC_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode EnableSAGC_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode DisableSAGC_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSSerialPin_Demod(AVL_TSSerialPin TSSerialPin, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSSerialOrder_Demod(AVL_TSSerialOrder TSSerialOrder, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSSerialSyncPulse_Demod(AVL_TSSerialSyncPulse TSSerialSyncPulse, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSErrorBit_Demod(AVL_TSErrorBit TSErrorBit, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSErrorPola_Demod(AVL_TSErrorPolarity TSErrorPola, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSValidPola_Demod(AVL_TSValidPolarity TSValidPola, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSPacketLen_Demod(AVL_TSPacketLen TSPacketLen, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSParallelOrder_Demod(AVL_TSParallelOrder TSParallelOrder, AVL_uint32 uiChipNo);
AVL_ErrorCode SetTSParallelPhase_Demod(AVL_TSParallelPhase eParallelPhase, AVL_uint32 uiChipNo);
AVL_ErrorCode IBase_SetSleepClock_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode GetMode_Demod(AVL_DemodMode* peCurrentMode, AVL_uint32 uiChipNo);
AVL_ErrorCode GetBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type  enumBERType, AVL_uint32 uiChipNo);
// sky()
AVL_ErrorCode II2C_Read_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiOffset, AVL_puchar pucBuff, AVL_uint32 uiSize);
AVL_ErrorCode II2C_Read8_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puchar puiData );
AVL_ErrorCode II2C_Read16_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puint16 puiData );
AVL_ErrorCode II2C_Read32_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puint32 puiData );
AVL_ErrorCode II2C_ReadDirect_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint16 uiSize);
AVL_ErrorCode II2C_WriteDirect_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint16 uiSize);
AVL_ErrorCode II2C_Write_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint32 uiSize);
AVL_ErrorCode II2C_Write8_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uchar ucData );
AVL_ErrorCode II2C_Write16_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uint16 uiData );
AVL_ErrorCode II2C_Write32_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uint32 uiData );
void ChunkAddr_Demod(AVL_uint32 uiaddr, AVL_puchar pBuff);
void Chunk16_Demod(AVL_uint16 uidata, AVL_puchar pBuff);
AVL_uint16 DeChunk16_Demod(const AVL_puchar pBuff);
void Chunk32_Demod(AVL_uint32 uidata, AVL_puchar pBuff);
AVL_uint32 DeChunk32(const AVL_puchar pBuff);
void Multiply32(AVLuint64 *pDst, AVL_uint32 m1, AVL_uint32 m2);
void AddScaled32To64(AVLuint64 *pDst, AVL_uint32 a);
void Multiply32By16(AVLint64 *pY, AVL_int32 a, AVL_int16 b);
void Add32To64(AVLuint64 *pSum, AVL_uint32 uiAddend);
AVL_uint32 Divide64(AVLuint64 y, AVLuint64 x);
AVL_uint32 GreaterThanOrEqual64(AVLuint64 a, AVLuint64 b);
void Subtract64(AVLuint64 *pA, AVLuint64 b);
AVL_ErrorCode SetPLL0_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode SetSleepPLL0_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode TestSDRAM_Demod(AVL_puint32 puiTestResult, AVL_puint32 puiTestPattern, AVL_uint32 uiChipNo);
AVL_ErrorCode GetValidModeList_Demod(AVL_puchar pucValidModeList, AVL_uint32 uiChipNo);
void GetValidModeList0_Demod(AVL_puchar pucValidModeList, AVL_uint32 uiMemberID);
AVL_ErrorCode GetFamilyID_Demod(AVL_puint32 puiFamilyID,AVL_uint32 uiChipNo);
AVL_ErrorCode Initilize_GPIOStatus_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode SetGPIOStatus_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_ParseFwPatch_v0(AVL_uint32 uiChipNo, AVL_uchar download_only );
AVL_uchar AVL_patch_read8(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx );
AVL_uint16 AVL_patch_read16(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx );
AVL_uint32 AVL_patch_read32(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx );

extern AVL_uchar AVL_Demod_DTMBFw[];
extern AVL_uchar AVL_Demod_Patch_DVBTxFw[];
extern AVL_uchar AVL_Demod_Patch_DVBSxFw[];
extern AVL_uchar AVL_Demod_Patch_DVBCFw[];
extern AVL_uchar AVL_Demod_Patch_ISDBTFw[];

typedef AVL_ErrorCode (* AVL_Func_Initialize)(AVL_uint32 uiChipNo);
typedef AVL_ErrorCode (* AVL_Func_GetLockStatus)(AVL_puchar pucLocked, AVL_uint32 uiChipNo );
typedef AVL_ErrorCode (* AVL_Func_GetSSI)(AVL_puint16 puiStrength , AVL_uint32 uiChipNo);
typedef AVL_ErrorCode (* AVL_Func_GetSQI)(AVL_puint16 puiQuality , AVL_uint32 uiChipNo);
typedef AVL_ErrorCode (* AVL_Func_GetSNR)(AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo);
typedef AVL_ErrorCode (* AVL_Func_GetPrePostBER)(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo);

typedef struct AVL_StandardSpecificFunctions
{
    AVL_Func_Initialize fpRxInitializeFunc;
    AVL_Func_GetLockStatus fpGetLockStatus;
    AVL_Func_GetSNR fpGetSNR;
    AVL_Func_GetSQI fpGetSQI;
    AVL_Func_GetPrePostBER fpGetPrePostBER;
}AVL_StandardSpecificFunctions;

typedef struct AVL_DVBTxPara
{
    AVL_InputPath eDVBTxInputPath;
    AVL_uint32 uiDVBTxIFFreqHz;
    AVL_AGCPola eDVBTxAGCPola;
} AVL_DVBTxPara;

typedef enum AVL_Diseqc_WaveFormMode
{
    AVL_DWM_Normal = 0,                         // Normal waveform mode
    AVL_DWM_Envelope = 1                        // Envelope waveform mode
}AVL_Diseqc_WaveFormMode;

typedef struct AVL_DVBSxPara
{
    AVL_semaphore semDiseqc;
    AVL_DiseqcStatus eDiseqcStatus;
    AVL_AGCPola eDVBSxAGCPola;
    AVL_Diseqc_WaveFormMode e22KWaveForm;
}AVL_DVBSxPara;

typedef enum AVL_ISDBT_BandWidth
{
    AVL_ISDBT_BW_6M  =   0,
    AVL_ISDBT_BW_8M  =   1,
}AVL_ISDBT_BandWidth;

typedef struct AVL_ISDBTPara
{
    AVL_InputPath eISDBTInputPath;
    AVL_ISDBT_BandWidth eISDBTBandwidth;
    AVL_uint32 uiISDBTIFFreqHz;
    AVL_AGCPola eISDBTAGCPola;
} AVL_ISDBTPara;

typedef struct AVL_DTMBPara
{
    AVL_InputPath eDTMBInputPath;
    AVL_uint32 uiDTMBIFFreqHz;
    AVL_uint32 uiDTMBSymbolRateHz;
    AVL_AGCPola eDTMBAGCPola;
} AVL_DTMBPara;

typedef enum AVL_DVBC_Standard
{
    AVL_DVBC_J83A    =   0,           //the J83A standard
    AVL_DVBC_J83B    =   1,           //the J83B standard
    AVL_DVBC_UNKNOWN =   2
}AVL_DVBC_Standard;

typedef struct AVL_DVBCPara
{
    AVL_InputPath eDVBCInputPath;
    AVL_uint32 uiDVBCIFFreqHz;
    AVL_uint32 uiDVBCSymbolRateSps;
    AVL_AGCPola eDVBCAGCPola;
    AVL_DVBC_Standard eDVBCStandard;
} AVL_DVBCPara;

/**************************************************/
typedef struct AVL_CommonConfig
{
    AVL_uint16      usI2CBus;	// sky(A)
    AVL_uint16      usI2CAddr;
    AVL_Demod_Xtal  eDemodXtal;
    AVL_TSMode      eTSMode;
    AVL_TSClockEdge eClockEdge;
    AVL_TSClockMode eClockMode;
}AVL_CommonConfig;

typedef struct AVL_DVBTxConfig
{
    AVL_InputPath eDVBTxInputPath;
    AVL_uint32  uiDVBTxIFFreqHz;
    AVL_AGCPola eDVBTxAGCPola;
} AVL_DVBTxConfig;

typedef struct AVL_DVBCConfig
{
    AVL_InputPath eDVBCInputPath;
    AVL_uint32 uiDVBCIFFreqHz;
    AVL_uint32 uiDVBCSymbolRateSps;
    AVL_AGCPola eDVBCAGCPola;
    AVL_DVBC_Standard eDVBCStandard;
} AVL_DVBCConfig;

typedef struct AVL_DVBSxConfig
{
    AVL_AGCPola eDVBSxAGCPola;
    AVL_Diseqc_WaveFormMode e22KWaveForm;
} AVL_DVBSxConfig;

typedef struct AVL_DTMBConfig
{
    AVL_InputPath eDTMBInputPath;
    AVL_uint32 uiDTMBIFFreqHz;
    AVL_uint32 uiDTMBSymbolRateHz;
    AVL_AGCPola eDTMBAGCPola;
} AVL_DTMBConfig;

typedef struct AVL_ISDBTConfig
{
    AVL_InputPath eISDBTInputPath;
    AVL_ISDBT_BandWidth eISDBTBandwidth;
    AVL_uint32 uiISDBTIFFreqHz;
    AVL_AGCPola eISDBTAGCPola;
} AVL_ISDBTConfig;

typedef struct AVL_TSConfig
{
    AVL_TSMode eMode;
    AVL_TSClockEdge eClockEdge;
    AVL_TSClockMode eClockMode;
    AVL_TSSerialPin eSerialPin;
    AVL_TSSerialOrder eSerialOrder;
    AVL_TSSerialSyncPulse eSerialSyncPulse;
    AVL_TSErrorBit eErrorBit;
    AVL_TSErrorPolarity eErrorPolarity;
    AVL_TSValidPolarity eValidPolarity;
    AVL_TSPacketLen ePacketLen;
    AVL_TSParallelOrder eParallelOrder;
    AVL_uint32 guiDVBTxSerialTSContinuousHz;
    AVL_uint32 guiDVBSxSerialTSContinuousHz;
    AVL_uint32 guiISDBTSerialTSContinuousHz;
    AVL_uint32 guiDTMBSerialTSContinuousHz;
    AVL_uint32 guiDVBCSerialTSContinuousHz;
}AVL_TSConfig;

typedef struct AVL_BaseAddressSet
{
    AVL_uint32 hw_mcu_reset_base;
    AVL_uint32 hw_mcu_system_reset_base;
    AVL_uint32 hw_esm_base;
    AVL_uint32 hw_tuner_i2c_base;
    AVL_uint32 hw_gpio_control_base;
    AVL_uint32 hw_gpio_debug_base;
    AVL_uint32 hw_TS_tri_state_cntrl_base;
    AVL_uint32 hw_AGC_tri_state_cntrl_base;
    AVL_uint32 hw_diseqc_base;
    AVL_uint32 hw_plp_list_base;
    AVL_uint32 hw_blind_scan_info_base;
    AVL_uint32 hw_member_ID_base;
    AVL_uint32 hw_dma_sys_status_base;
    AVL_uint32 hw_dma_sys_cmd_base;
    AVL_uint32 fw_config_reg_base;
    AVL_uint32 fw_status_reg_base;
    AVL_uint32 fw_DVBTx_config_reg_base;
    AVL_uint32 fw_DVBTx_status_reg_base;
    AVL_uint32 fw_DVBT2_data_PLP_config_reg_base;
    AVL_uint32 fw_DVBT2_common_PLP_config_reg_base;
    AVL_uint32 fw_DVBT2_P1_reg_base;
    AVL_uint32 fw_DVBT2_L1_pre_reg_base;
    AVL_uint32 fw_DVBT2_L1_post_config_reg_base;
    AVL_uint32 fw_DVBT_TPS_reg_base;
    AVL_uint32 fw_DVBSx_config_reg_base;
    AVL_uint32 fw_DVBSx_status_reg_base;
    AVL_uint32 fw_ISDBT_config_reg_base;
    AVL_uint32 fw_ISDBT_status_reg_base;
    AVL_uint32 fw_DTMB_config_reg_base;
    AVL_uint32 fw_DTMB_status_reg_base;
    AVL_uint32 fw_DVBC_config_reg_base;
    AVL_uint32 fw_DVBC_status_reg_base;
}AVL_BaseAddressSet;

typedef struct AVL_ChipInternal
{
    AVL_uint16 usI2CBus; // sky() */
    AVL_uint16 usI2CAddr;
    AVL_uint32 uiFamilyID;
    AVL_Demod_Xtal eDemodXtal;
    AVL_DemodMode eCurrentDemodMode;
    AVL_semaphore semRx;
    AVL_uint32 uiCoreFrequencyHz;
    AVL_uint32 uiFECFrequencyHz;
    AVL_uint32 uiTSFrequencyHz;
    AVL_uint32 uiADCFrequencyHz;
    AVL_uint32 uiRefFrequencyHz;
    AVL_uint32 uiDDCFrequencyHz;
    AVL_uint32 uiSDRAMFrequencyHz;
    AVL_TSConfig stTSConfig;
    AVL_ErrorStatConfig stErrorStatConfig;
    AVL_DVBTxPara stDVBTxPara;
    AVL_DVBSxPara stDVBSxPara;
    AVL_ISDBTPara stISDBTPara;
    AVL_DTMBPara stDTMBPara;
    AVL_DVBCPara stDVBCPara;
    AVL_StandardSpecificFunctions stStdSpecFunc;
    AVL_uchar ucCustomizeFwData;
    AVL_BaseAddressSet stBaseAddrSet;
    AVL_ErrorStats stAVLErrorStat;
    AVL_puchar DVBTxFwData;
    AVL_puchar DVBSxFwData;
    AVL_puchar ISDBTFwData;
    AVL_puchar DVBCFwData;
    AVL_puchar DTMBFwData;
	AVL_uint32 variable_array[PATCH_VAR_ARRAY_SIZE];

    AVL_TSSerialPin eTSSerialPin;
    AVL_TSSerialOrder eTSSerialOrder;
    AVL_TSSerialSyncPulse eTSSerialSyncPulse;
    AVL_TSErrorBit eTSErrorBit;
    AVL_TSErrorPolarity eTSErrorPola;
    AVL_TSValidPolarity eTSValidPola;
    AVL_TSPacketLen eTSPacketLen;
    AVL_TSParallelOrder eTSParallelOrder;
    AVL_TSParallelPhase eTSParallelPhase;

    AVL_uchar ucDisableTCAGC;
    AVL_uchar ucDisableSAGC;
    AVL_uchar ucDisableTSOutput;

    AVL_uchar ucPin37Status; // 0 - InPut; 1- OutPut
    AVL_uchar ucPin38Status;
    AVL_uchar ucPin37Voltage; // 0 - High; 1- Low; 2 - High_Z
    AVL_uchar ucPin38Voltage;

    AVL_uchar ucSleepFlag;  //0 - Wakeup, 1 - Sleep

} AVL_ChipInternal;

// The Availink version structure.
typedef struct AVL_Version
{
    AVL_uchar   ucMajor;                            // The major version number.
    AVL_uchar   ucMinor;                            // The minor version number.
    AVL_uint16  usBuild;                            // The build version number.
}AVL_Version;

// Stores AVLEM61 device version information.
typedef struct AVL_DemodVersion
{
    AVL_uint32  uiChip;                             // Hardware version information. 0xYYYYMMDD
    AVL_Version stAPI;                              // SDK version information.
    AVL_Version stPatch;                            // The version of the internal patch.
} AVL_DemodVersion;


extern AVL_ChipInternal gstChipInternalArray[2];

#ifdef AVL_CPLUSPLUS
}
#endif

#endif

