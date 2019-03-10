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



#ifndef AVL_ISDBT_H
#define AVL_ISDBT_H

#ifdef AVL_CPLUSPLUS
extern "C" {
#endif

#define rc_ISDBT_fund_rate_Hz_iaddr_offset                                0x00000004
#define rc_ISDBT_rf_agc_pol_caddr_offset								  0x0000000f
#define rc_ISDBT_sample_rate_Hz_iaddr_offset                              0x00000008
#define rc_ISDBT_tuner_type_caddr_offset                                  0x00000040
#define rc_ISDBT_input_format_caddr_offset                                0x00000041
#define rc_ISDBT_input_select_caddr_offset                                0x00000043
#define rc_ISDBT_nom_carrier_freq_Hz_iaddr_offset                         0x00000044
#define rc_ISDBT_TS_clk_rate_Hz_iaddr_offset                              0x0000006c
#define rc_ISDBT_adc_sel_caddr_offset                                     0x00000077
#define rc_ISDBT_adc_use_pll_clk_offset                                   0x00000076

#define rs_ISDBT_mode_caddr_offset                                        0x00000001
#define rs_ISDBT_system_type_caddr_offset                                 0x00000002
#define rs_ISDBT_GI_saddr_offset                                          0x0000000c
#define rs_ISDBT_layA_constel_size_caddr_offset                           0x0000001c
#define rs_ISDBT_layA_fec_rate_caddr_offset                               0x0000001d
#define rs_ISDBT_layA_itlv_len_caddr_offset                               0x0000001e
#define rs_ISDBT_layA_seg_no_caddr_offset                                 0x0000001f
#define rs_ISDBT_partial_reception_caddr_offset                           0x00000023
#define rs_ISDBT_layB_constel_size_caddr_offset                           0x00000024
#define rs_ISDBT_layB_fec_rate_caddr_offset                               0x00000025
#define rs_ISDBT_layB_itlv_len_caddr_offset                               0x00000026
#define rs_ISDBT_layB_seg_no_caddr_offset                                 0x00000027
#define rs_ISDBT_layC_constel_size_caddr_offset                           0x00000028
#define rs_ISDBT_layC_fec_rate_caddr_offset                               0x00000029
#define rs_ISDBT_layC_itlv_len_caddr_offset                               0x0000002a
#define rs_ISDBT_layC_seg_no_caddr_offset                                 0x0000002b
#define rs_ISDBT_fec_lock_caddr_offset                                    0x000000ce
#define rs_ISDBT_snr_dB_x100_saddr_offset                                 0x000000d2
#define rs_ISDBT_ISDBT_sys_state_iaddr_offset                             0x000000e0
#define rs_ISDBT_Signal_Presence_iaddr_offset							  0x0000010c

typedef enum AVL_ISDBT_TunerType
{
    AVL_ISDBT_REAL_IF            =   0,
    AVL_ISDBT_COMPLEX_BASEBAND   =   1,
    AVL_ISDBT_REAL_IF_FROM_Q     =   2
}AVL_ISDBT_TunerType;

typedef enum AVL_ISDBT_Standard
{
    AVL_ISDBT_FULL_SEG   =  0,
    AVL_ISDBT_ONE_SEG    =  1,
    AVL_ISDBT_THREE_SEG  =  2
}AVL_ISDBT_Standard;

typedef enum AVL_ISDBT_Layer
{
    AVL_ISDBT_LAYER_ALL = 0,
    AVL_ISDBT_LAYER_A = 1,
    AVL_ISDBT_LAYER_B = 2,
    AVL_ISDBT_LAYER_C = 3
}AVL_ISDBT_Layer;

typedef enum AVL_ISDBT_SystemType
{
    AVL_ISDBT_Std = 0,
    AVL_ISDBTsb_1seg = 1,
    AVL_ISDBTsb_3seg = 2
}AVL_ISDBT_SystemType;

typedef enum AVL_ISDBT_Mode
{
    AVL_ISDBT_Mode1 = 0,
    AVL_ISDBT_Mode2 = 1,
    AVL_ISDBT_Mode3 = 2
}AVL_ISDBT_Mode;

typedef enum AVL_ISDBT_GuardInterval
{
    AVL_ISDBT_GUARD_1_32 =   0,
    AVL_ISDBT_GUARD_1_16 =   1,
    AVL_ISDBT_GUARD_1_8  =   2,
    AVL_ISDBT_GUARD_1_4  =   3
}AVL_ISDBT_GuardInterval;

typedef enum AVL_ISDBT_PartialReception
{
    AVL_ISDBT_PartialReception_Off = 0,
    AVL_ISDBT_PartialReception_On = 1
}AVL_ISDBT_PartialReception;

typedef enum AVL_ISDBT_CodeRate
{
    AVL_ISDBT_CR_1_2 = 0,
    AVL_ISDBT_CR_2_3 = 1,
    AVL_ISDBT_CR_3_4 = 2,
    AVL_ISDBT_CR_5_6 = 3,
    AVL_ISDBT_CR_7_8 = 4
}AVL_ISDBT_CodeRate;

typedef enum AVL_ISDBT_ModulationMode
{
    AVL_ISDBT_DQPSK  = 0,
    AVL_ISDBT_QPSK   = 1,
    AVL_ISDBT_16QAM  = 2,
    AVL_ISDBT_64QAM  = 3
}AVL_ISDBT_ModulationMode;

typedef struct AVL_ISDBT_LayerSignalInfo
{
    AVL_ISDBT_ModulationMode  eISDBTModulationMode;
    AVL_ISDBT_CodeRate        eISDBTCodeRate;
    AVL_uchar                 ucISDBTInterleaverLen;
    AVL_uchar                 ucISDBTSegmentNum;
}AVL_ISDBT_LayerSignalInfo;

typedef struct AVL_ISDBTModulationInfo
{
    AVL_ISDBT_SystemType       eISDBTSystemType;
    AVL_ISDBT_Mode             eISDBTMode;
    AVL_ISDBT_GuardInterval    eISDBTGuardInterval;
    AVL_ISDBT_PartialReception eISDBTPartialReception;
    AVL_ISDBT_LayerSignalInfo  eISDBTLayerA;
    AVL_ISDBT_LayerSignalInfo  eISDBTLayerB;
    AVL_ISDBT_LayerSignalInfo  eISDBTLayerC;
}AVL_ISDBTModulationInfo;

AVL_ErrorCode AVL_Demod_ISDBTAutoLock(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_ISDBTGetModulationInfo(AVL_ISDBTModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo);

AVL_ErrorCode ISDBT_Initialize_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo );
AVL_ErrorCode ISDBT_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo );
AVL_ErrorCode ISDBT_GetSNR_Demod( AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo );
AVL_ErrorCode ISDBT_GetSQI(AVL_puint32 puiSQI, AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_SetIFInputPath_Demod(AVL_InputPath eInputPath, AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_SetIFFrequency_Demod(AVL_uint32 uiIFFrequencyHz, AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_SetBandWidth_Demod(AVL_ISDBT_BandWidth eISDBTBandWidth, AVL_uint32 uiChipNo);
void ISDBT_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo);
AVL_ErrorCode ISDBT_GetSignalDetection(AVL_uchar *pucNoSig, AVL_uint32 uiChipNo);

#ifdef AVL_CPLUSPLUS
    }
#endif

#endif

