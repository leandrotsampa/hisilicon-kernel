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

AVL_ErrorCode AVL_Demod_DVBCAutoLock(AVL_uint32 uiChipNo)
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

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_qam_mode_scan_control_iaddr_offset, 0x0101);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_ACQUIRE, uiChipNo);

    return r;
}

AVL_ErrorCode AVL_Demod_DVBCManualLock (AVL_uint32 uiSymbolRateSps,AVL_DVBCQAMMode eQAMMode, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

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

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_symbol_rate_Hz_iaddr_offset, uiSymbolRateSps);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_qam_mode_iaddr_offset, &uiTemp);
    uiTemp &= 0xFFFFFF00;

    uiTemp |= ((AVL_uint32)(eQAMMode))<<0;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_qam_mode_iaddr_offset, uiTemp);

    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_lock_mode_caddr_offset, 0);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_ACQUIRE, uiChipNo);

    return r ;
}

AVL_ErrorCode AVL_Demod_DVBCGetModulationInfo(AVL_DVBCModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;
    AVL_uchar ucTemp = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_qam_mode_iaddr_offset, &uiTemp);
    pstModulationInfo->eQAMMode = (AVL_DVBCQAMMode)(uiTemp & 0x00000007);

    r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_status_reg_base + rs_DVBC_j83b_il_mode_caddr_offset, &ucTemp);
        pstModulationInfo->eInterleaveMode = (AVL_DVBCInterleaveMode)ucTemp;

    return r;
}

AVL_ErrorCode DVBC_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
         gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_j83b_mode_caddr_offset,
         gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCStandard);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_dmd_clk_Hz_iaddr_offset,
        gstChipInternalArray[uiChipNo].uiCoreFrequencyHz);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_fec_clk_Hz_iaddr_offset,
        gstChipInternalArray[uiChipNo].uiFECFrequencyHz);

    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_rfagc_pol_caddr_offset,
        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCAGCPola);



    r |= DVBC_SetIFFrequency_Demod(gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCIFFreqHz,uiChipNo);
    r |= DVBC_SetIFInputPath_Demod((AVL_InputPath)(gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCInputPath^1),uiChipNo);
    r |= DVBC_SetSymbolRate_Demod(gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCSymbolRateSps,uiChipNo);
    r |= DVBC_SetStandard_Demod(gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCStandard,uiChipNo);

    //DDC configuration
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_input_format_caddr_offset, AVL_ADC_IN);//ADC in
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_input_select_caddr_offset, AVL_OFFBIN);//RX_OFFBIN
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_tuner_type_caddr_offset, AVL_DVBC_IF);//IF

    //ADC configuration
    switch(gstChipInternalArray[uiChipNo].eDemodXtal)
    {
     case Xtal_16M :
     case Xtal_24M :
        {
          r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_adc_use_pll_clk_caddr_offset, 1);
          break;
        }

      case Xtal_30M :
      case Xtal_27M :
        {
          r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_adc_use_pll_clk_caddr_offset, 0);
          break;
        }
    }

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_sample_rate_Hz_iaddr_offset,
        gstChipInternalArray[uiChipNo].uiADCFrequencyHz);

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

AVL_ErrorCode DVBC_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;


    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_status_reg_base + rs_DVBC_mode_status_iaddr_offset, &uiTemp);

    if((r == AVL_EC_OK) && (0x15 == ((uiTemp)&0xff)))
    {
        *pucLocked = 1;
    }
    else
    {
        *pucLocked = 0;
    }

    return r;
}

AVL_ErrorCode DVBC_GetSNR_Demod(AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 usSNR = 0;
    AVL_uint32 uiTemp = 0;

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_get_btr_crl_iaddr_offset, &uiTemp);
    if(0x00 == uiTemp)
    {
        r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_status_reg_base + rs_DVBC_snr_dB_x100_saddr_offset, &usSNR);
        *puiSNR_db = (AVL_uint32)usSNR;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_get_btr_crl_iaddr_offset, 0x01);
    }
    else
    {
        r |= AVL_EC_RUNNING;
    }

    return r;
}

typedef struct AVL_DVBC_SQI_CN_Table_Element
{
    AVL_DVBC_Standard eStandard;
    AVL_DVBCQAMMode modulation;
    AVL_uint32 CN_Test_Result_x100_db;
}AVL_DVBC_SQI_CN_Table_Element;

AVL_DVBC_SQI_CN_Table_Element AVL_DVBC_CN_Table[]=
{
    //profile 1, AWGN
    {AVL_DVBC_J83A, AVL_DVBC_16QAM  , 1700},
    {AVL_DVBC_J83A, AVL_DVBC_32QAM  , 1980},
    {AVL_DVBC_J83A, AVL_DVBC_64QAM  , 2300},
    {AVL_DVBC_J83A, AVL_DVBC_128QAM , 2600},
    {AVL_DVBC_J83A, AVL_DVBC_256QAM , 2920},

    {AVL_DVBC_J83B, AVL_DVBC_64QAM ,  2180},
    {AVL_DVBC_J83B, AVL_DVBC_256QAM , 2810}
};

AVL_ErrorCode DVBC_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiEstimated_SNR = 0;
    AVL_uint32 CN_Ref_x100_db = 0;
    AVL_int32  index = 0;
    AVL_int32  temp_range = 0;
    AVL_LockStatus lock_status;
    AVL_DVBCModulationInfo DVBCSignalInfo;
    AVL_DVBCQAMMode modulation;
    AVL_DVBC_Standard eStandard;
    AVL_uchar ucTemp;

    r = DVBC_GetLockStatus_Demod( &ucTemp, uiChipNo );
    lock_status = (AVL_LockStatus)ucTemp;

    if ((lock_status == AVL_STATUS_LOCK)&&(r == AVL_EC_OK))
    {
        //get the signal modulation mode
        r |= AVL_Demod_DVBCGetModulationInfo(&DVBCSignalInfo, uiChipNo);
        modulation = DVBCSignalInfo.eQAMMode;

        II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_j83b_mode_caddr_offset,
        (AVL_puchar)&eStandard);

        //get the signal reference CN for CN table
        temp_range = sizeof(AVL_DVBC_CN_Table) / sizeof(AVL_DVBC_SQI_CN_Table_Element);
        for(index=0; index < temp_range; index++)
        {
            if(AVL_DVBC_CN_Table[index].modulation == modulation && AVL_DVBC_CN_Table[index].eStandard == eStandard)
            {
                CN_Ref_x100_db = AVL_DVBC_CN_Table[index].CN_Test_Result_x100_db;
                break;
            }
        }

        //get the signal estimate SNR
        r |= DVBC_GetSNR_Demod(&uiEstimated_SNR, uiChipNo);

        //SQI is 100 when the CN higher than threshold 2dB
        if (uiEstimated_SNR > CN_Ref_x100_db + 200)
        {
            *puiQuality = 100;
        }
        else if (uiEstimated_SNR < CN_Ref_x100_db -100)
        {
            *puiQuality = 0;
        }
        else
        {
            *puiQuality = (uiEstimated_SNR - CN_Ref_x100_db + 100) / 3;
        }

        return (r);
    }
    else
    {
        *puiQuality = 0;
        return(r);
    }

    return r;
}

AVL_ErrorCode DVBC_SetIFInputPath_Demod(AVL_InputPath eInputPath, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_adc_sel_caddr_offset,(AVL_uchar)eInputPath);

    return r;
}

AVL_ErrorCode DVBC_SetIFFrequency_Demod(AVL_uint32 uiIFFrequencyHz, AVL_uint32 uiChipNo)
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
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_if_freq_Hz_iaddr_offset,carrier_offset_hz);

    return r;
}

AVL_ErrorCode DVBC_SetStandard_Demod(AVL_DVBC_Standard eDVBCStandard, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_j83b_mode_caddr_offset, eDVBCStandard);

    return r;
}

AVL_ErrorCode DVBC_SetSymbolRate_Demod(AVL_uint32 uiDVBCSymbolRateSps, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base + rc_DVBC_symbol_rate_Hz_iaddr_offset, uiDVBCSymbolRateSps);

    return r;
}

void DVBC_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo)
{
    gstChipInternalArray[uiChipNo].ucCustomizeFwData = 1;
    gstChipInternalArray[uiChipNo].DVBCFwData = pInitialData;
}

AVL_ErrorCode DVBC_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    switch(eBERType)
    {
        case AVL_PRE_VITERBI_BER:
            *puiBERxe9 = 0;
            break;
        case AVL_POST_VITERBI_BER:
             r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                 gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_status_reg_base + rs_DVBC_post_viterbi_BER_estimate_x10M_iaddr_offset,&uiTemp);
            *puiBERxe9 = uiTemp * 100;//match 1e9
            break;
        case AVL_PRE_LDPC_BER:
            *puiBERxe9 = 0;
            break;
        case AVL_POST_LDPC_BER:
            *puiBERxe9 = 0;
            break;
        default:
            break;
    }

    return r;
}

