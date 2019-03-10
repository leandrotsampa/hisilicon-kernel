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



#ifndef AVL_DVBSX_H
#define AVL_DVBSX_H

#ifdef AVL_CPLUSPLUS
    extern "C" {
#endif

#define rc_DVBSx_rfagc_pol_iaddr_offset                                  0x00000000
#define rc_DVBSx_internal_decode_mode_iaddr_offset                        0x0000000c
#define rc_DVBSx_format_iaddr_offset                                      0x00000010
#define rc_DVBSx_input_iaddr_offset                                       0x00000014
#define rc_DVBSx_specinv_iaddr_offset                                     0x00000034
#define rc_DVBSx_dvbs_fec_coderate_iaddr_offset                           0x00000044
#define rc_DVBSx_int_sym_rate_MHz_iaddr_offset                            0x00000054
#define rc_DVBSx_aagc_acq_gain_saddr_offset                               0x000000fe
#define rc_DVBSx_Max_LowIF_sps_iaddr_offset                               0x000000a4
#define rc_DVBSx_int_dmd_clk_MHz_saddr_offset                             0x00000164
#define rc_DVBSx_int_mpeg_clk_MHz_saddr_offset                            0x00000168
#define rc_DVBSx_int_fec_clk_MHz_saddr_offset                             0x0000016a
#define rc_DVBSx_fec_bypass_coderate_saddr_offset                         0x0000019a
#define rc_DVBSx_tuner_frequency_100kHz_saddr_offset                      0x000001c0
#define rc_DVBSx_tuner_LPF_100kHz_saddr_offset                            0x000001c6
#define rc_DVBSx_blind_scan_start_freq_100kHz_saddr_offset                0x000001cc
#define rc_DVBSx_blind_scan_min_sym_rate_kHz_saddr_offset                 0x000001d0
#define rc_DVBSx_blind_scan_end_freq_100kHz_saddr_offset                  0x000001d2
#define rc_DVBSx_blind_scan_channel_info_offset_saddr_offset              0x000001d4
#define rc_DVBSx_blind_scan_max_sym_rate_kHz_saddr_offset                 0x000001d6
#define rc_DVBSx_decode_mode_saddr_offset                                 0x00000204
#define rc_DVBSx_iq_mode_saddr_offset                                     0x0000020a
#define rc_DVBSx_dishpoint_mode_saddr_offset                              0x0000020e
#define rc_DVBSx_blind_scan_reset_saddr_offset                            0x00000210
#define rc_DVBSx_functional_mode_saddr_offset                             0x00000212
#define rc_DVBSx_blind_scan_tuner_spectrum_inversion_saddr_offset         0x00000226
#define rc_DVBSx_IF_Offset_10kHz_saddr_offset                             0x00000234
#define rc_DVBSx_dvbs2_fec_coderate_caddr_offset                          0x0000023f
#define rc_DVBSx_adc_Q_chan_sel_caddr_offset                              0x00000246
#define rc_DVBSx_adc_I_chan_sel_caddr_offset                              0x00000247
#define rc_DVBSx_dvbs2_code_rate_saddr_offset                             0x00000258
#define rc_DVBSx_dvbs2_modulation_saddr_offset                            0x0000025a
#define rc_DVBSx_int_adc_clk_MHz_saddr_offset                             0x000002a0
#define rc_DVBSx_show_detail_saddr_offset                                 0x000000d6


#define rs_DVBSx_modulation_iaddr_offset                                  0x0000000c
#define rs_DVBSx_pilot_iaddr_offset                                       0x00000010
#define rs_DVBSx_int_SNR_dB_iaddr_offset                                  0x00000020
#define rs_DVBSx_blind_scan_channel_count_saddr_offset                    0x000000b0
#define rs_DVBSx_blind_scan_error_code_saddr_offset                       0x000000b4
#define rs_DVBSx_blind_scan_progress_saddr_offset                         0x000000b6
#define rs_DVBSx_post_viterbi_BER_estimate_x10M_iaddr_offset    		  0x000000c4
#define rs_DVBSx_post_LDPC_BER_estimate_x10M_iaddr_offset                 0x000000c8
#define rs_DVBSx_pre_LDPC_BER_estimate_x10M_iaddr_offset        		  0x000000cc
#define rs_DVBSx_detected_alpha_iaddr_offset                              0x000000d0
#define rs_DVBSx_int_carrier_freq_100kHz_saddr_offset                     0x00000078
#define rs_DVBSx_fec_lock_saddr_offset                                    0x0000009e


#define hw_diseqc_tx_cntrl_offset                                     0x0 
#define hw_diseqc_tone_frac_n_offset                                  0x4 
#define hw_diseqc_tone_frac_d_offset                                  0x8 
#define hw_diseqc_tx_st_offset                                        0xC 
#define hw_diseqc_rx_parity_offset                                    0x10
#define hw_diseqc_rx_msg_tim_offset                                   0x14
#define hw_diseqc_rx_st_offset                                        0x18
#define hw_diseqc_rx_cntrl_offset                                     0x1C
#define hw_diseqc_srst_offset                                         0x20
#define hw_diseqc_samp_frac_n_offset                                  0x28
#define hw_diseqc_samp_frac_d_offset                                  0x2C
#define hw_rx_fifo_map_offset                                         0x40
#define hw_tx_fifo_map_offset                                         0x80

/// Represents the code rate. The Availink device can automatically detect the code rate of the input signal.
typedef enum AVL_DVBS_CodeRate
{
    AVL_DVBS_CR_1_2  =   0, 
    AVL_DVBS_CR_2_3  =   1,
    AVL_DVBS_CR_3_4  =   2,
    AVL_DVBS_CR_5_6  =   3,
    AVL_DVBS_CR_6_7  =   4,
    AVL_DVBS_CR_7_8  =   5
}AVL_DVBS_CodeRate;


typedef enum AVL_DVBS2_CodeRate
{
    AVL_DVBS2_CR_1_4     =   0,
    AVL_DVBS2_CR_1_3     =   1,
    AVL_DVBS2_CR_2_5     =   2,
    AVL_DVBS2_CR_1_2     =   3,
    AVL_DVBS2_CR_3_5     =   4,
    AVL_DVBS2_CR_2_3     =   5,
    AVL_DVBS2_CR_3_4     =   6,
    AVL_DVBS2_CR_4_5     =   7,
    AVL_DVBS2_CR_5_6     =   8,
    AVL_DVBS2_CR_8_9     =   9,
    AVL_DVBS2_CR_9_10    =   10
}AVL_DVBS2_CodeRate;

typedef enum AVL_DVBSx_Pilot
{
    AVL_DVBSx_Pilot_OFF  =   0,                  // Pilot off
    AVL_DVBSx_Pilot_ON   =   1                   // Pilot on
}AVL_DVBSx_Pilot;

typedef enum AVL_DVBSx_ModulationMode
{
    AVL_DVBSx_QPSK   =   0,                      // QPSK
    AVL_DVBSx_8PSK   =   1,                      // 8-PSK
    AVL_DVBSx_16APSK =   2,                      // 16-APSK
    AVL_DVBSx_32APSK =   3                       // 32-APSK
}AVL_DVBSx_ModulationMode;


typedef enum AVL_DVBSx_RollOff
{
    AVL_DVBSx_RollOff_20 = 0,                    // Roll off is 0.20
    AVL_DVBSx_RollOff_25 = 1,                    // Roll off is 0.25
    AVL_DVBSx_RollOff_35 = 2                     // Roll off is 0.35
}AVL_DVBSx_RollOff;

typedef enum AVL_DVBSx_Standard
{
    AVL_DVBS     =   0,                          // DVBS standard
    AVL_DVBS2    =   1                           // DVBS2 standard
}AVL_DVBSx_Standard;    

// Defines the AVL device spectrum inversion mode
typedef enum AVL_SpectrumInversion
{
    AVL_SPECTRUM_NORMAL     =   0,                      // Signal spectrum in normal.
    AVL_SPECTRUM_INVERTED   =   1,                      // Signal spectrum in inverted.
    AVL_SPECTRUM_AUTO       =   2                       // Signal spectrum isn't known.
}AVL_SpectrumInversion;

// Defines the ON/OFF options for the AVLEM61 device.
typedef enum AVL_Switch
{
    AVL_ON  =   0,                              // switched on
    AVL_OFF =   1                               // switched off
}AVL_Switch;

// Defines the device functional mode.
typedef enum AVL_FunctionalMode
{
    AVL_FuncMode_Demod      =   0,              // The device is in demod mode.
    AVL_FuncMode_BlindScan  =   1               // The device is in blind scan mode.
}AVL_FunctionalMode;

typedef enum AVL_Diseqc_TxGap
{
    AVL_DTXG_15ms = 0,                          // The gap is 15 ms.
    AVL_DTXG_20ms = 1,                          // The gap is 20 ms.
    AVL_DTXG_25ms = 2,                          // The gap is 25 ms.
    AVL_DTXG_30ms = 3                           // The gap is 30 ms.
}AVL_Diseqc_TxGap;

typedef enum AVL_Diseqc_TxMode
{
    AVL_DTM_Modulation = 0,                     // Use modulation mode.
    AVL_DTM_Tone0 = 1,                          // Send out tone 0.
    AVL_DTM_Tone1 = 2,                          // Send out tone 1.
    AVL_DTM_Continuous = 3                      // Continuously send out pulses.
}AVL_Diseqc_TxMode;

typedef enum AVL_Diseqc_RxTime
{
    AVL_DRT_150ms = 0,                          // Wait 150 ms for receive data and then close the input FIFO.
    AVL_DRT_170ms = 1,                          // Wait 170 ms for receive data and then close the input FIFO.
    AVL_DRT_190ms = 2,                          // Wait 190 ms for receive data and then close the input FIFO.
    AVL_DRT_210ms = 3                           // Wait 210 ms for receive data and then close the input FIFO.
}AVL_Diseqc_RxTime;

// Stores blind scan info
typedef struct AVL_BSInfo
{
    AVL_uint16 m_uiProgress;                        // The percentage completion of the blind scan procedure. A value of 100 indicates that the blind scan is finished.
    AVL_uint16 m_uiChannelCount;                    // The number of channels detected thus far by the blind scan operation.  The Availink device can store up to 120 detected channels.
    AVL_uint16 m_uiNextStartFreq_100kHz;            // The start frequency of the next scan in units of 100kHz.
    AVL_uint16 m_uiResultCode;                      // The result of the blind scan operation.  Possible values are:  0 - blind scan operation normal; 1 -- more than 120 channels have been detected.
}AVL_BSInfo;

// Stores channel info
typedef struct AVL_ChannelInfo
{
    AVL_uint32 m_uiFrequency_kHz;                   // The channel carrier frequency in units of kHz. 
    AVL_uint32 m_uiSymbolRate_Hz;                   // The symbol rate in units of Hz. 
    AVL_uint32 m_Flags;                             // Contains bit-mapped fields which store additional channel configuration information.
}AVL_ChannelInfo;

typedef struct AVL_DVBSxModulationInfo
{
    AVL_DVBSx_ModulationMode    eDVBSxModulationMode;
    AVL_DVBS_CodeRate           eDVBSCodeRate;
    AVL_DVBS2_CodeRate          eDVBS2CodeRate;
    AVL_DVBSx_Pilot             eDVBSxPilot;
    AVL_DVBSx_RollOff           eDVBSxRollOff;
    AVL_DVBSx_Standard          eDVBSxStandard;
}AVL_DVBSxModulationInfo;

typedef struct AVL_DVBSxManualLockInfo
{
    AVL_DVBSx_ModulationMode    eDVBSxModulationMode;
    AVL_DVBS_CodeRate           eDVBSCodeRate;
    AVL_DVBS2_CodeRate          eDVBS2CodeRate;
    AVL_DVBSx_Pilot             eDVBSxPilot;
    AVL_SpectrumInversion       eDVBSxSpecInversion;
    AVL_DVBSx_Standard          eDVBSxStandard;
    AVL_uint32                  uiDVBSxSymbolRateSps;
}AVL_DVBSxManualLockInfo;

// Defines the device spectrum polarity setting. 
typedef enum AVL_BlindSanSpectrumPolarity
{
    AVL_Spectrum_Invert = 0,
    AVL_Spectrum_Normal = 1
}AVL_BlindSanSpectrumPolarity;

/// Stores the blind scan parameters which are passed to the blind scan function.
typedef struct AVL_BlindScanPara
{
    AVL_uint16 m_uiStartFreq_100kHz;                // The start scan frequency in units of 100kHz. The minimum value depends on the tuner specification. 
    AVL_uint16 m_uiStopFreq_100kHz;                 // The stop scan frequency in units of 100kHz. The maximum value depends on the tuner specification.
    AVL_uint16 m_uiMinSymRate_kHz;                  // The minimum symbol rate to be scanned in units of kHz. The minimum value is 1000 kHz.
    AVL_uint16 m_uiMaxSymRate_kHz;                  // The maximum symbol rate to be scanned in units of kHz. The maximum value is 45000 kHz.
    AVL_BlindSanSpectrumPolarity m_enumBSSpectrumPolarity;
}AVL_BlindScanPara;

// Stores DiSEqC operation parameters
typedef struct AVL_Diseqc_Para
{
    AVL_uint16              uiToneFrequencyKHz;// The DiSEqC bus speed in units of kHz. Normally, it is 22kHz. 
    AVL_Diseqc_TxGap        eTXGap;            // Transmit gap
    AVL_Diseqc_WaveFormMode eTxWaveForm;       // Transmit waveform format
    AVL_Diseqc_RxTime       eRxTimeout;        // Receive time frame window
    AVL_Diseqc_WaveFormMode eRxWaveForm;       // Receive waveform format
}AVL_Diseqc_Para;

// Stores the DiSEqC transmitter status.
typedef struct AVL_Diseqc_TxStatus
{
    AVL_uchar   m_TxDone;                           // Indicates whether the transmission is complete (1 - transmission is finished, 0 - transmission is still in progress).
    AVL_uchar   m_TxFifoCount;                      // The number of bytes remaining in the transmit FIFO
}AVL_Diseqc_TxStatus;

// Stores the DiSEqC receiver status
typedef struct AVL_Diseqc_RxStatus
{
    AVL_uchar   m_RxFifoCount;                      // The number of bytes in the DiSEqC receive FIFO.
    AVL_uchar   m_RxFifoParChk;                     // The parity check result of the received data. This is a bit-mapped field in which each bit represents the parity check result for each each byte in the receive FIFO.  The upper bits without corresponding data are undefined. If a bit is 1, the corresponding byte in the FIFO has good parity. For example, if three bytes are in the FIFO, and the parity check value is 0x03 (value of bit 2 is zero), then the first and the second bytes in the receive FIFO are good. The third byte had bad parity. 
    AVL_uchar   m_RxDone;                           // 1 if the receiver window is turned off, 0 if it is still in receiving state.
}AVL_Diseqc_RxStatus;

AVL_ErrorCode AVL_Demod_DVBSxAutoLock(AVL_uint32 uiSymbolRateSps, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSxManualLock(AVL_DVBSxManualLockInfo *pstManualLockInfo, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSxGetModulationInfo(AVL_DVBSxModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_IsSafeToSwitchMode(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Start(AVL_BlindScanPara * pBSPara, AVL_uint16 uiTunerLPF_100kHz, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_GetStatus(AVL_BSInfo * pBSInfo, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Cancel(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_ReadChannelInfo(AVL_uint16 uiStartIndex, AVL_puint16 pChannelCount,  AVL_ChannelInfo * pChannel, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Reset(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_SetFunctionalMode(AVL_FunctionalMode enumFunctionalMode,AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_GetFunctionalMode(AVL_FunctionalMode * pFunctionalMode, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_SetDishPointingMode(AVL_Switch enumOn_Off, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_Diseqc_Initialize_Demod(AVL_Diseqc_Para *pDiseqcPara, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_ReadModulationData( AVL_puchar pucBuff, AVL_puchar pucSize, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_SendModulationData( AVL_puchar pucBuff, AVL_uchar ucSize, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_GetTxStatus( AVL_Diseqc_TxStatus * pTxStatus, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_GetRxStatus( AVL_Diseqc_RxStatus * pRxStatus, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_SendTone( AVL_uchar ucTone, AVL_uchar ucCount, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_StartContinuous (AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_StopContinuous (AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_Initialize_Demod(AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_GetSNR_Demod(AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo);
void DVBSx_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_SetAGCPola(AVL_AGCPola enumAGC_Pola, AVL_uint32 uiChipNo);
AVL_ErrorCode DVBSx_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_DVBSx_GetFreqOffset( AVL_pint32 piFreqOffsetHz, AVL_uint32 uiChipNo);


#ifdef AVL_CPLUSPLUS
    }
#endif

#endif

