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



    
#ifndef AVL_DVBC_H
#define AVL_DVBC_H
    
    
#ifdef AVL_CPLUSPLUS
    extern "C" {
#endif

//DVBC config registers offset address
#define rc_DVBC_symbol_rate_Hz_iaddr_offset                     0x00000000
#define rc_DVBC_sample_rate_Hz_iaddr_offset                     0x00000004
#define rc_DVBC_dmd_clk_Hz_iaddr_offset                         0x00000008
#define rc_DVBC_j83b_mode_caddr_offset                          0x00000017
#define rc_DVBC_tuner_type_caddr_offset                         0x00000024
#define rc_DVBC_input_format_caddr_offset                       0x00000025
#define rc_DVBC_spectrum_invert_caddr_offset                    0x00000026
#define rc_DVBC_input_select_caddr_offset                       0x00000027
#define rc_DVBC_if_freq_Hz_iaddr_offset                         0x00000028
#define rc_DVBC_qam_mode_iaddr_offset                           0x0000002c
#define rc_DVBC_rfagc_pol_caddr_offset						    0x00000049
#define rc_DVBC_fec_clk_Hz_iaddr_offset                         0x00000050
#define rc_DVBC_get_btr_crl_iaddr_offset                        0x00000080
#define rc_DVBC_qam_mode_scan_control_iaddr_offset              0x00000090
#define rc_DVBC_lock_mode_caddr_offset                          0x00000093
#define rc_DVBC_adc_sel_caddr_offset							0x000001ef
#define rc_DVBC_adc_use_pll_clk_caddr_offset				    0x000001ee



//DVBC status registers offset address
#define rs_DVBC_mode_status_iaddr_offset                        0x00000004
#define rs_DVBC_snr_dB_x100_saddr_offset                        0x0000000e
#define rs_DVBC_j83b_il_mode_caddr_offset                       0x0000001d
#define rs_DVBC_post_viterbi_BER_estimate_x10M_iaddr_offset     0x0000004c

typedef enum AVL_DVBC_TunerType
{
    AVL_DVBC_IF          =       0,
    AVL_DVBC_BASEBAND    =       1
}AVL_DVBC_TunerType;

typedef enum AVL_DVBC_ChannelType
{
    AVL_DVBC_I_CHANNEL   =       0,
    AVL_DVBC_Q_CHANNEL   =       1
}AVL_DVBC_ChannelType;

typedef enum AVL_DVBCQAMMode
{
    AVL_DVBC_16QAM               =   0,      
    AVL_DVBC_32QAM               =   1,
    AVL_DVBC_64QAM               =   2,      
    AVL_DVBC_128QAM              =   3,
    AVL_DVBC_256QAM              =   4
}AVL_DVBCQAMMode;

// Defines the symbol interleave mode of the received DVBC signal, only used for J.83B.
typedef enum AVL_DVBCInterleaveMode
{
    AVL_DVBC_INTERLEAVE_128_1_0  =   0,
    AVL_DVBC_INTERLEAVE_128_1_1  =   1,
    AVL_DVBC_INTERLEAVE_128_2    =   2,
    AVL_DVBC_INTERLEAVE_64_2     =   3,
    AVL_DVBC_INTERLEAVE_128_3    =   4,
    AVL_DVBC_INTERLEAVE_32_4     =   5,
    AVL_DVBC_INTERLEAVE_128_4    =   6,
    AVL_DVBC_INTERLEAVE_16_8     =   7,
    AVL_DVBC_INTERLEAVE_128_5    =   8,
    AVL_DVBC_INTERLEAVE_8_16     =   9,
    AVL_DVBC_INTERLEAVE_128_6    =   10,
    AVL_DVBC_INTERLEAVE_128_7    =   12,
    AVL_DVBC_INTERLEAVE_128_8    =   14
}AVL_DVBCInterleaveMode;

typedef struct AVL_DVBCModulationInfo
{
	AVL_DVBCQAMMode         eQAMMode;
	AVL_DVBCInterleaveMode  eInterleaveMode;
}AVL_DVBCModulationInfo;
 
AVL_ErrorCode AVL_Demod_DVBCAutoLock(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBCManualLock (AVL_uint32 uiSymbolRateSps, AVL_DVBCQAMMode eQAMMode, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBCGetModulationInfo(AVL_DVBCModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo);
    
AVL_ErrorCode DVBC_Initialize_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_GetSNR_Demod(AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_SetIFInputPath_Demod(AVL_InputPath eInputPath, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_SetIFFrequency_Demod(AVL_uint32 uiIFFrequencyHz, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_SetStandard_Demod(AVL_DVBC_Standard eDVBCStandard, AVL_uint32 uiChipNo);
void DVBC_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_SetSymbolRate_Demod(AVL_uint32 uiDVBCSymbolRateSps, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBC_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo);

#ifdef AVL_CPLUSPLUS
    }
#endif

#endif



