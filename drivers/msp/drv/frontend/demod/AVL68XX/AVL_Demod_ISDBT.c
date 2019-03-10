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




#include "AVL_Demod.h"

extern AVL_ChipInternal gstChipInternalArray[2];

static int BW_FFT_Table[2]=
{
    8126984,    //bw=6.0MHz
    10835979    //bw=8.0MHz
};

AVL_ErrorCode AVL_Demod_ISDBTAutoLock(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    if(1 == gstChipInternalArray[uiChipNo].ucSleepFlag)
    {
        r = AVL_EC_SLEEP;
        return r;
    }
    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    ISDBT_SetIFFrequency_Demod((AVL_uint32)gstChipInternalArray[uiChipNo].stISDBTPara.uiISDBTIFFreqHz, uiChipNo);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_ACQUIRE, uiChipNo);

    return (r);

}

AVL_ErrorCode AVL_Demod_ISDBTGetModulationInfo(AVL_ISDBTModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar ucTemp = 0;
    AVL_uint16 usTemp = 0;
    static unsigned int fsba = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    if(fsba == 0)
    {
        II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_status_reg_base + rs_ISDBT_ISDBT_sys_state_iaddr_offset, &fsba);
    }

    r = II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_system_type_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTSystemType = (AVL_ISDBT_SystemType)ucTemp;

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_mode_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTMode = (AVL_ISDBT_Mode)ucTemp;

    r |= II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_GI_saddr_offset, &usTemp);
    pstModulationInfo->eISDBTGuardInterval = (AVL_ISDBT_GuardInterval)usTemp;

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_partial_reception_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTPartialReception = (AVL_ISDBT_PartialReception)ucTemp;

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layA_constel_size_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerA.eISDBTModulationMode = (AVL_ISDBT_ModulationMode)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layA_fec_rate_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerA.eISDBTCodeRate = (AVL_ISDBT_CodeRate)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layA_itlv_len_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerA.ucISDBTInterleaverLen = ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layA_seg_no_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerA.ucISDBTSegmentNum = ucTemp;

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layB_constel_size_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerB.eISDBTModulationMode = (AVL_ISDBT_ModulationMode)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layB_fec_rate_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerB.eISDBTCodeRate = (AVL_ISDBT_CodeRate)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layB_itlv_len_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerB.ucISDBTInterleaverLen = ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layB_seg_no_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerB.ucISDBTSegmentNum = ucTemp;

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layC_constel_size_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerC.eISDBTModulationMode = (AVL_ISDBT_ModulationMode)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layC_fec_rate_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerC.eISDBTCodeRate = (AVL_ISDBT_CodeRate)ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layC_itlv_len_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerC.ucISDBTInterleaverLen = ucTemp;
    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, fsba + rs_ISDBT_layC_seg_no_caddr_offset, &ucTemp);
    pstModulationInfo->eISDBTLayerC.ucISDBTSegmentNum = ucTemp;

    return (r);
}

AVL_ErrorCode ISDBT_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_sample_rate_Hz_iaddr_offset, gstChipInternalArray[uiChipNo].uiADCFrequencyHz);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_TS_clk_rate_Hz_iaddr_offset, gstChipInternalArray[uiChipNo].uiTSFrequencyHz);

    //DDC configuration
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_input_format_caddr_offset, AVL_OFFBIN);//ADC in
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_input_select_caddr_offset, AVL_ADC_IN);//RX_OFFBIN
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_tuner_type_caddr_offset, 2);//RX_REAL_IF_FROM_Q

    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_rf_agc_pol_caddr_offset,
        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTAGCPola);

    r |= ISDBT_SetIFFrequency_Demod(gstChipInternalArray[uiChipNo].stISDBTPara.uiISDBTIFFreqHz,uiChipNo);
    r |= ISDBT_SetIFInputPath_Demod((AVL_InputPath)(gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTInputPath^1),uiChipNo);
    r |= ISDBT_SetBandWidth_Demod(gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTBandwidth, uiChipNo);

    //ADC configuration
    switch(gstChipInternalArray[uiChipNo].eDemodXtal)
    {
     case Xtal_16M :
     case Xtal_24M :
        {
          r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_adc_use_pll_clk_offset, 1);

        }
        break;

    case Xtal_30M :
    case Xtal_27M :
        {
          r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_adc_use_pll_clk_offset, 0);

        }
        break;
    }

    //AGC configuration
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + agc1_sel_offset, 6);

    if(gstChipInternalArray[uiChipNo].ucDisableTCAGC == 0)
    {
        r |= EnableTCAGC_Demod(uiChipNo);
    }
    else
    {
        r |= DisableTCAGC_Demod(uiChipNo);
    }

    return (r);
}

AVL_ErrorCode ISDBT_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo )
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_status_reg_base + rs_ISDBT_fec_lock_caddr_offset, pucLocked);

    return (r);
}

AVL_ErrorCode ISDBT_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    r = ISDBT_GetSQI(&uiTemp, uiChipNo);

    *puiQuality = (AVL_uint16)uiTemp;//uiTemp's range is 0 to 100. It's safe here.

    return (r);

}

AVL_ErrorCode ISDBT_GetSNR_Demod( AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 uiTemp = 0;

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_status_reg_base + rs_ISDBT_snr_dB_x100_saddr_offset,&uiTemp);

    *puiSNR_db = (AVL_uint32)uiTemp;

    return (r);
}

typedef struct AVL_ISDBT_CN_Table_Element
{
    AVL_ISDBT_ModulationMode modulation;
    AVL_ISDBT_CodeRate code_rate;
    AVL_int32 CN_NordigP1_x100_db;
}AVL_ISDBT_CN_Table_Element;

AVL_ISDBT_CN_Table_Element AVL_ISDBT_CN_Table[]=
{
    //Gaussian
    {AVL_ISDBT_DQPSK, AVL_ISDBT_CR_1_2, 510},//FIXME, CN needs to be corrected
    {AVL_ISDBT_DQPSK, AVL_ISDBT_CR_2_3, 690},//FIXME
    {AVL_ISDBT_DQPSK, AVL_ISDBT_CR_3_4, 790},//FIXME
    {AVL_ISDBT_DQPSK, AVL_ISDBT_CR_5_6, 890},//FIXME
    {AVL_ISDBT_DQPSK, AVL_ISDBT_CR_7_8, 970},//FIXME

    {AVL_ISDBT_QPSK, AVL_ISDBT_CR_1_2, 510},
    {AVL_ISDBT_QPSK, AVL_ISDBT_CR_2_3, 690},
    {AVL_ISDBT_QPSK, AVL_ISDBT_CR_3_4, 790},
    {AVL_ISDBT_QPSK, AVL_ISDBT_CR_5_6, 890},
    {AVL_ISDBT_QPSK, AVL_ISDBT_CR_7_8, 970},

    {AVL_ISDBT_16QAM, AVL_ISDBT_CR_1_2, 1080},
    {AVL_ISDBT_16QAM, AVL_ISDBT_CR_2_3, 1310},
    {AVL_ISDBT_16QAM, AVL_ISDBT_CR_3_4, 1460},
    {AVL_ISDBT_16QAM, AVL_ISDBT_CR_5_6, 1560},
    {AVL_ISDBT_16QAM, AVL_ISDBT_CR_7_8, 1600},

    {AVL_ISDBT_64QAM, AVL_ISDBT_CR_1_2, 1650},
    {AVL_ISDBT_64QAM, AVL_ISDBT_CR_2_3, 1870},
    {AVL_ISDBT_64QAM, AVL_ISDBT_CR_3_4, 2020},
    {AVL_ISDBT_64QAM, AVL_ISDBT_CR_5_6, 2160},
    {AVL_ISDBT_64QAM, AVL_ISDBT_CR_7_8, 2250}
};

typedef struct AVL_ISDBT_BERSQI_List
{
    AVL_uint32                 m_ber;
    AVL_uint32                 m_ber_sqi;
}AVL_ISDBT_BERSQI_List;

AVL_ISDBT_BERSQI_List ISDBT_BERSQI_Table[]=
{
    {1000      ,    60  },
    {1778      ,    65  },
    {3162      ,    70  },
    {5623      ,    75  },
    {10000     ,    80  },
    {17783     ,    85  },
    {31623     ,    90  },
    {56234     ,    95  },
    {100000    ,    100 },
    {177828    ,    105 },
    {316228    ,    110 },
    {562341    ,    115 },
    {1000000   ,    120 },
    {1778279   ,    125 },
    {3162278   ,    130 },
    {5623413   ,    135 },
    {10000000  ,    140 }
};

AVL_ErrorCode ISDBT_GetSQI(AVL_puint32 puiSQI, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 post_viterbi_ber_x1e9 = 0;
    AVL_uint32 ber_sqi = 0;
    AVL_int32 CN_NordigP1_x100_db = 0;
    AVL_uint32 CN_received_x100_db = 0;
    AVL_int32 CN_relative_x100_db = 0;

    AVL_ISDBTModulationInfo ISDBTSignalInfo;

    AVL_ISDBT_ModulationMode modulation = AVL_ISDBT_DQPSK;
    AVL_ISDBT_CodeRate code_rate = AVL_ISDBT_CR_1_2;
    AVL_uint32 uiTemp0 = 0;
    AVL_uint32 uiTemp1 = 0;
    AVL_uint16 index = 0;

    //tweaked: This will cause the SQI to be a meaningful indicator at and around the "60s clean" C/N threshold.
    r = GetBER_Demod(&post_viterbi_ber_x1e9,AVL_POST_VITERBI_BER, uiChipNo);
    if (post_viterbi_ber_x1e9 <= 100)//RS BER <= 1e-7
    {
        ber_sqi = 100;
    }
    else if((post_viterbi_ber_x1e9 > 100)&&(post_viterbi_ber_x1e9 <= 1000000))//RS BER >1e-7, <=1e-3
    {
        //ber_sqi = (AVL_int32)(20.0*AVL_LOG10((AVL_int32)(1e9/post_viterbi_ber_x1e9))) - 40;
        uiTemp0 = (AVL_uint32)(1000000000/post_viterbi_ber_x1e9);
        uiTemp1 = sizeof(ISDBT_BERSQI_Table)/sizeof(AVL_ISDBT_BERSQI_List);
        for (index = 0; index < uiTemp1; index++)
        {
            if (uiTemp0 < ISDBT_BERSQI_Table[index].m_ber)
            {
                break;
            }
        }
        if (0 == index)
        {
            index = 1;
        }
        ber_sqi = ISDBT_BERSQI_Table[index - 1].m_ber_sqi - 40;
    }
    else //RS BER >1e-3
    {
        ber_sqi = 0;
    }

    //get signal info for mapping
    r |= AVL_Demod_ISDBTGetModulationInfo(&ISDBTSignalInfo, uiChipNo);

    modulation = ISDBTSignalInfo.eISDBTLayerA.eISDBTModulationMode;
    code_rate = ISDBTSignalInfo.eISDBTLayerA.eISDBTCodeRate;


    //Get Nordig C/N

    for(index=0;index<sizeof(AVL_ISDBT_CN_Table)/sizeof(AVL_ISDBT_CN_Table_Element);index++)
    {
        if((AVL_ISDBT_CN_Table[index].modulation == modulation)&&
            (AVL_ISDBT_CN_Table[index].code_rate == code_rate))
        {
            CN_NordigP1_x100_db = AVL_ISDBT_CN_Table[index].CN_NordigP1_x100_db;
            break;
        }
    }

    if(index == sizeof(AVL_ISDBT_CN_Table)/sizeof(AVL_ISDBT_CN_Table_Element))
    {
        return AVL_EC_NOT_SUPPORTED;
    }

    //Get received C/N
    r |= ISDBT_GetSNR_Demod(&CN_received_x100_db, uiChipNo);
    CN_received_x100_db += CN_received_x100_db/12;  //adjust Rx C/N estimate to Tx C/N estimate
    CN_received_x100_db += 100; //bias Rx C/N to provide more SQI resolution near threshold while keeping the result within NorDig acceptable range


    //Calculate relative C/N
    CN_relative_x100_db = (AVL_int32)CN_received_x100_db - CN_NordigP1_x100_db;

    if(CN_relative_x100_db < -700)
    {
        *puiSQI = 0;
    }
    else if((CN_relative_x100_db >= -700) && (CN_relative_x100_db < 300))
    {
        *puiSQI = (((CN_relative_x100_db - 300)/10) + 100)*ber_sqi/100;
    }
    else
    {
        *puiSQI = ber_sqi;
    }

    return r;
}


AVL_ErrorCode ISDBT_SetIFInputPath_Demod(AVL_InputPath eInputPath, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_adc_sel_caddr_offset, (AVL_uchar)eInputPath);

    return r;
}

AVL_ErrorCode ISDBT_GetSignalDetection(AVL_uchar *pucNoSig, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_status_reg_base + rs_ISDBT_Signal_Presence_iaddr_offset,&uiTemp);
    if(uiTemp==1)// detected
    {
        *pucNoSig=1;
    }
    else if(uiTemp==0)//no signal (0)
    {
        *pucNoSig=0;
    }
    else if(uiTemp==2)//unknown (not send command acquire)
    {
        *pucNoSig=1;
    }

    return (r);
}

AVL_ErrorCode ISDBT_SetIFFrequency_Demod(AVL_uint32 uiIFFrequencyHz, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 carrier_offset_hz = 0;

    if(uiIFFrequencyHz >= gstChipInternalArray[uiChipNo].uiADCFrequencyHz)
    {
       carrier_offset_hz = uiIFFrequencyHz - gstChipInternalArray[uiChipNo].uiADCFrequencyHz;
    }
    else
    {
      carrier_offset_hz = uiIFFrequencyHz;
    }

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_nom_carrier_freq_Hz_iaddr_offset, carrier_offset_hz);

    return r;
}

AVL_ErrorCode ISDBT_SetBandWidth_Demod(AVL_ISDBT_BandWidth eISDBTBandWidth, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base + rc_ISDBT_fund_rate_Hz_iaddr_offset, BW_FFT_Table[eISDBTBandWidth]);

    return r;
}

void ISDBT_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo)
{
    gstChipInternalArray[uiChipNo].ucCustomizeFwData = 1;
    gstChipInternalArray[uiChipNo].ISDBTFwData = pInitialData;
}

AVL_ErrorCode ISDBT_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    return r;
}


