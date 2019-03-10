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
#define Diseqc_delay 20

extern AVL_ChipInternal gstChipInternalArray[2];

AVL_ErrorCode AVL_Demod_DVBSxAutoLock(AVL_uint32 uiSymbolRateSps, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_FunctionalMode enumFunctionalMode = AVL_FuncMode_BlindScan;

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

    r = AVL_Demod_DVBSx_GetFunctionalMode(&enumFunctionalMode, uiChipNo);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    if(enumFunctionalMode == AVL_FuncMode_Demod)
    {

        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_fec_lock_saddr_offset, 0);

        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_decode_mode_saddr_offset,
            0x14);
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_fec_bypass_coderate_saddr_offset,
            0);//DVBS auto lock

        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_iq_mode_saddr_offset,
            1);//enable spectrum auto detection
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_decode_mode_saddr_offset, 0x14);
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_fec_bypass_coderate_saddr_offset, 0);

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_sym_rate_MHz_iaddr_offset,
            uiSymbolRateSps);


        r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_ACQUIRE, uiChipNo);
    }
    else if(enumFunctionalMode == AVL_FuncMode_BlindScan)
    {
        return AVL_EC_NOT_SUPPORTED;
    }

    return (r);
}
AVL_ErrorCode AVL_Demod_DVBSxManualLock(AVL_DVBSxManualLockInfo *pstManualLockInfo, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_FunctionalMode eFuncMode = AVL_FuncMode_BlindScan;

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

    r = AVL_Demod_DVBSx_GetFunctionalMode(&eFuncMode, uiChipNo);
    if(eFuncMode == AVL_FuncMode_Demod)
    {
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_fec_lock_saddr_offset, 0);

        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_fec_bypass_coderate_saddr_offset, 1);//DVBS manual lock

        if (pstManualLockInfo->eDVBSxStandard == AVL_DVBS )
        {
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dvbs_fec_coderate_iaddr_offset, pstManualLockInfo->eDVBSCodeRate);
        }
        else if(pstManualLockInfo->eDVBSxStandard == AVL_DVBS2 )
        {
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dvbs2_code_rate_saddr_offset, pstManualLockInfo->eDVBS2CodeRate);
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dvbs2_modulation_saddr_offset, pstManualLockInfo->eDVBSxModulationMode);
        }
        else
        {
            return AVL_EC_NOT_SUPPORTED;
        }
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_decode_mode_saddr_offset, pstManualLockInfo->eDVBSxStandard);

        if(pstManualLockInfo->eDVBSxSpecInversion == AVL_SPECTRUM_AUTO)
        {
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_iq_mode_saddr_offset, 1);//enable spectrum auto detection
        }
        else
        {
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_specinv_iaddr_offset, pstManualLockInfo->eDVBSxSpecInversion);
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_iq_mode_saddr_offset, 0);
        }

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_sym_rate_MHz_iaddr_offset, pstManualLockInfo->uiDVBSxSymbolRateSps);

        r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo );

        r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_ACQUIRE, uiChipNo );
    }
    else if(eFuncMode == AVL_FuncMode_BlindScan)
    {
        return AVL_EC_NOT_SUPPORTED;
    }

    return (r);
}
AVL_ErrorCode AVL_Demod_DVBSxGetModulationInfo(AVL_DVBSxModulationInfo *pstModulationInfo, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;
    AVL_uchar  temp_uchar = 0;

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_pilot_iaddr_offset, &uiTemp);
    pstModulationInfo->eDVBSxPilot = (AVL_DVBSx_Pilot)(uiTemp);

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_internal_decode_mode_iaddr_offset,&uiTemp);
    pstModulationInfo->eDVBSxStandard = (AVL_DVBSx_Standard)uiTemp;

    if(AVL_DVBS == (AVL_DVBSx_Standard)uiTemp)
    {
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dvbs_fec_coderate_iaddr_offset,&uiTemp);
        pstModulationInfo->eDVBSCodeRate = (AVL_DVBS_CodeRate)(uiTemp);
    }
    else
    {
        r |= II2C_Read8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dvbs2_fec_coderate_caddr_offset,&temp_uchar);
        pstModulationInfo->eDVBS2CodeRate = (AVL_DVBS2_CodeRate)(temp_uchar);
    }

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_modulation_iaddr_offset, &uiTemp);
    pstModulationInfo->eDVBSxModulationMode = (AVL_DVBSx_ModulationMode)(uiTemp);

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_detected_alpha_iaddr_offset, &uiTemp);
    pstModulationInfo->eDVBSxRollOff = (AVL_DVBSx_RollOff)(uiTemp);

    return (r);

}

AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Start(AVL_BlindScanPara * pBSPara, AVL_uint16 uiTunerLPF_100kHz, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 uiCarrierFreq_100kHz = 0;
    AVL_uint16 uiMinSymRate = 0;
    AVL_FunctionalMode enumFunctionalMode = AVL_FuncMode_Demod;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_Demod_DVBSx_GetFunctionalMode(&enumFunctionalMode, uiChipNo);

    if (enumFunctionalMode == AVL_FuncMode_BlindScan)
    {
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_tuner_LPF_100kHz_saddr_offset, uiTunerLPF_100kHz);
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_tuner_spectrum_inversion_saddr_offset, pBSPara->m_enumBSSpectrumPolarity);

        uiMinSymRate = pBSPara->m_uiMinSymRate_kHz - 200;       // give some tolerance

        if (uiMinSymRate < 800)       //Blind scan doesn't support symbol rate less then 1M, give 200K margin
        {
            uiMinSymRate = 800;
        }

        if( pBSPara->m_uiStartFreq_100kHz < pBSPara->m_uiStopFreq_100kHz )
        {
            if( AVL_EC_OK == r )
            {
                uiCarrierFreq_100kHz = ((pBSPara->m_uiStopFreq_100kHz)+(pBSPara->m_uiStartFreq_100kHz))>>1;
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_tuner_frequency_100kHz_saddr_offset, uiCarrierFreq_100kHz);
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_min_sym_rate_kHz_saddr_offset, uiMinSymRate);
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_max_sym_rate_kHz_saddr_offset, (pBSPara->m_uiMaxSymRate_kHz)+200);
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_start_freq_100kHz_saddr_offset, (pBSPara->m_uiStartFreq_100kHz));
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_end_freq_100kHz_saddr_offset, (pBSPara->m_uiStopFreq_100kHz));
                r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_blind_scan_progress_saddr_offset, 0);

                if( AVL_EC_OK == r )
                {
                    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo );

                    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_BLIND_SCAN, uiChipNo);
                }
            }
        }
        else
        {
            r = AVL_EC_GENERAL_FAIL;
        }
    }
    else
    {
        r = AVL_EC_GENERAL_FAIL;
    }

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_GetStatus(AVL_BSInfo * pBSInfo, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_blind_scan_progress_saddr_offset, &(pBSInfo->m_uiProgress));
    r |= II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_blind_scan_channel_count_saddr_offset, &(pBSInfo->m_uiChannelCount));
    r |= II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_start_freq_100kHz_saddr_offset, &(pBSInfo->m_uiNextStartFreq_100kHz));
    r |= II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_blind_scan_error_code_saddr_offset, &(pBSInfo->m_uiResultCode));
    if( pBSInfo->m_uiProgress > 100 )
    {
        pBSInfo->m_uiProgress = 100;
    }

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Cancel(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r;
    enum AVL_FunctionalMode enumFunctionalMode = AVL_FuncMode_Demod;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_Demod_DVBSx_GetFunctionalMode(&enumFunctionalMode, uiChipNo);

    if(enumFunctionalMode == AVL_FuncMode_BlindScan)
    {
        r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);
    }
    else
    {
        r = AVL_EC_GENERAL_FAIL;
    }

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_ReadChannelInfo(AVL_uint16 uiStartIndex, AVL_puint16 pChannelCount, AVL_ChannelInfo * pChannel, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 channel_addr = 0;
    AVL_uint16 i1 = 0;
    AVL_uint16 i2 = 0;
    AVL_uint32 uiMinFreq = 0;
    AVL_uint16 iMinIdx = 0;
    AVL_ChannelInfo sTempChannel;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_blind_scan_channel_count_saddr_offset, &i1);
    if( (uiStartIndex + (*pChannelCount)) > (i1) )
    {
        *pChannelCount = i1-uiStartIndex;
    }
    r |= II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_channel_info_offset_saddr_offset, &i1);
    channel_addr = gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_blind_scan_info_base + uiStartIndex*sizeof(AVL_ChannelInfo);
    for( i1=0; i1<(*pChannelCount); i1++ )
    {
#if 1  //for some processors which can not read 12 bytes
        //dump the channel information
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, channel_addr, &(pChannel[i1].m_uiFrequency_kHz));
        channel_addr += 4;
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, channel_addr, &(pChannel[i1].m_uiSymbolRate_Hz));
        channel_addr += 4;
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, channel_addr, &(pChannel[i1].m_Flags));
        channel_addr += 4;
#endif
    }

    // Sort the results
    for(i1=0; i1<(*pChannelCount); i1++)
    {
        iMinIdx = i1;
        uiMinFreq = pChannel[i1].m_uiFrequency_kHz;
        for(i2=(i1+1); i2<(*pChannelCount); i2++)
        {
            if(pChannel[i2].m_uiFrequency_kHz < uiMinFreq)
            {
                uiMinFreq = pChannel[i2].m_uiFrequency_kHz;
                iMinIdx = i2;
            }
        }
        sTempChannel = pChannel[iMinIdx];
        pChannel[iMinIdx] = pChannel[i1];
        pChannel[i1] = sTempChannel;
    }

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_BlindScan_Reset(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_blind_scan_reset_saddr_offset, 1);

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_SetFunctionalMode(AVL_FunctionalMode enumFunctionalMode,AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_functional_mode_saddr_offset, (AVL_uint16)enumFunctionalMode);
    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_iq_mode_saddr_offset,0);

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_GetFunctionalMode(AVL_FunctionalMode * pFunctionalMode, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 uiTemp = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_functional_mode_saddr_offset, &uiTemp);
    *pFunctionalMode = (AVL_FunctionalMode)(uiTemp & 0x0001);

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_SetDishPointingMode( AVL_Switch enumOn_Off, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_FunctionalMode enumFunctionalMode = AVL_FuncMode_BlindScan;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r |= AVL_Demod_DVBSx_GetFunctionalMode(&enumFunctionalMode, uiChipNo);
    if(enumFunctionalMode == AVL_FuncMode_Demod)
    {
        if(enumOn_Off == AVL_ON)
        {
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_aagc_acq_gain_saddr_offset, 12);
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dishpoint_mode_saddr_offset, 1);
        }
        else
        {
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_aagc_acq_gain_saddr_offset, 10);
            r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_dishpoint_mode_saddr_offset, 0);
        }
    }
    else
    {
        r = AVL_EC_GENERAL_FAIL;
    }

    return(r);
}

#define Diseqc_delay 20

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_IsSafeToSwitchMode(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 i1 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    switch(gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus)
    {
    case AVL_DOS_InModulation:
    case AVL_DOS_InTone:
        r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_st_offset, &i1);
        if( 1 != ((i1 & 0x00000040) >> 6) ) //check if the last transmit is done
        {
            r |= AVL_EC_RUNNING;
        }
        break;
    case AVL_DOS_InContinuous:
    case AVL_DOS_Initialized:
        break;
    default:
        r = AVL_EC_GENERAL_FAIL;
        break;
    }

    return(r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_ReadModulationData( AVL_puchar pucBuff, AVL_puchar pucSize, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;
    AVL_uint32 i2 = 0;
    AVL_uchar pucBuffTemp[4] = {0};

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_st_offset, &i1);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i2);
    if((i2>>8) & 0x01)
    {
        gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InModulation;
    }

    if( AVL_DOS_InModulation == gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus )
    {
        // In modulation mode
        if( (!((i2>>8) & 0x01 ) && (0x00000004 == (i1 & 0x00000004))) || (((i2>>8) & 0x01 ) &&(0x00000004 != (i1 & 0x00000004))))
        {
            *pucSize = (AVL_uchar)((i1 & 0x00000078)>>3);
            //Receive data
            for( i1=0; i1<*pucSize; i1++ )
            {
                r |= II2C_Read_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_rx_fifo_map_offset, pucBuffTemp, 4);
                pucBuff[i1] = pucBuffTemp[3];
            }
        }
        else
        {
            r = AVL_EC_GENERAL_FAIL;
        }
    }
    else
    {
        r = AVL_EC_GENERAL_FAIL;
    }

    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_SendModulationData( AVL_puchar pucBuff, AVL_uchar ucSize, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;
    AVL_uint32 i2 = 0;
    AVL_uchar pucBuffTemp[8] = {0};
    AVL_uchar Continuousflag = 0;
    AVL_uint16 uiTempOutTh = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    if( ucSize>8 )
    {
        r = AVL_EC_WARNING;
    }
    else
    {
        r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
        r |= AVL_Demod_DVBSx_Diseqc_IsSafeToSwitchMode(uiChipNo);
        if( AVL_EC_OK ==  r)
        {
            if (gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus == AVL_DOS_InContinuous)
            {
                r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
                if ((i1>>10) & 0x01)
                {
                    Continuousflag = 1;
                    i1 &= 0xfffff3ff;
                    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
                    r |= AVL_IBSP_Delay(Diseqc_delay);      //delay 20ms
                }
            }
            //reset rx_fifo
            r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_cntrl_offset, &i2);
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_cntrl_offset, (i2|0x01));
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_cntrl_offset, (i2&0xfffffffe));

            r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
            i1 &= 0xfffffff8;   //set to modulation mode and put it to FIFO load mode
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

            //trunk address
            ChunkAddr_Demod(gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_tx_fifo_map_offset, pucBuffTemp);
            pucBuffTemp[3] = 0;
            pucBuffTemp[4] = 0;
            pucBuffTemp[5] = 0;
            for( i2=0; i2<ucSize; i2++ )
            {
                pucBuffTemp[6] = pucBuff[i2];

                r |= II2C_Write_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, pucBuffTemp, 7);
            }
            i1 |= (1<<2);  //start fifo transmit.
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

            if( AVL_EC_OK == r )
            {
                gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InModulation;
            }
            do
            {
                r |= AVL_IBSP_Delay(1);
                if (++uiTempOutTh > 500)
                {
                    r |= AVL_EC_TIMEOUT;
                    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
                    return(r);
                }
                r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_st_offset, &i1);
            } while ( 1 != ((i1 & 0x00000040) >> 6) );

            r = AVL_IBSP_Delay(Diseqc_delay);       //delay 20ms
            if (Continuousflag == 1)            //resume to send out wave
            {
                //No data in FIFO
                r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
                i1 &= 0xfffffff8;
                i1 |= 0x03;     //switch to continuous mode
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

                //start to send out wave
                i1 |= (1<<10);
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
                if( AVL_EC_OK == r )
                {
                    gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InContinuous;
                }
            }
        }
        r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    }

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_GetTxStatus( AVL_Diseqc_TxStatus * pTxStatus, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_st_offset, &i1);
    pTxStatus->m_TxDone = (AVL_uchar)((i1 & 0x00000040)>>6);
    pTxStatus->m_TxFifoCount = (AVL_uchar)((i1 & 0x0000003c)>>2);

    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_GetRxStatus( AVL_Diseqc_RxStatus * pRxStatus, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    if( AVL_DOS_InModulation == gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus )
    {
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_st_offset, &i1);
        pRxStatus->m_RxDone = (AVL_uchar)((i1 & 0x00000004)>>2);
        pRxStatus->m_RxFifoCount = (AVL_uchar)((i1 & 0x000000078)>>3);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_parity_offset, &i1);
        pRxStatus->m_RxFifoParChk = (AVL_uchar)(i1 & 0x000000ff);
    }
    else
    {
        r |= AVL_EC_GENERAL_FAIL;
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_SendTone( AVL_uchar ucTone, AVL_uchar ucCount, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;
    AVL_uint32 i2 = 0;
    AVL_uchar pucBuffTemp[8] = {0};
    AVL_uchar Continuousflag = 0;
    AVL_uint16 uiTempOutTh = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    if( ucCount>8 )
    {
        r = AVL_EC_WARNING;
    }
    else
    {
        r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
        r |= AVL_Demod_DVBSx_Diseqc_IsSafeToSwitchMode(uiChipNo);

        if( AVL_EC_OK == r )
        {
            if (gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus == AVL_DOS_InContinuous)
            {
                r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
                if ((i1>>10) & 0x01)
                {
                    Continuousflag = 1;
                    i1 &= 0xfffff3ff;
                    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
                    r |= AVL_IBSP_Delay(Diseqc_delay);      //delay 20ms
                }
            }
            //No data in the FIFO.
            r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
            i1 &= 0xfffffff8;  //put it into the FIFO load mode.
            if( 0 == ucTone )
            {
                i1 |= 0x01;
            }
            else
            {
                i1 |= 0x02;
            }
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

            //trunk address
            ChunkAddr_Demod(gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_tx_fifo_map_offset, pucBuffTemp);
            pucBuffTemp[3] = 0;
            pucBuffTemp[4] = 0;
            pucBuffTemp[5] = 0;
            pucBuffTemp[6] = 1;

            for( i2=0; i2<ucCount; i2++ )
            {
                r |= II2C_Write_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, pucBuffTemp, 7);
            }

            i1 |= (1<<2);  //start fifo transmit.
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
            if( AVL_EC_OK == r )
            {
                gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InTone;
            }
            do
            {
                r |= AVL_IBSP_Delay(1);
                if (++uiTempOutTh > 500)
                {
                    r |= AVL_EC_TIMEOUT;
                    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
                    return(r);
                }
                r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_st_offset, &i1);
            } while ( 1 != ((i1 & 0x00000040) >> 6) );

            r = AVL_IBSP_Delay(Diseqc_delay);       //delay 20ms
            if (Continuousflag == 1)            //resume to send out wave
            {
                //No data in FIFO
                r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
                i1 &= 0xfffffff8;
                i1 |= 0x03;     //switch to continuous mode
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

                //start to send out wave
                i1 |= (1<<10);
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
                if( AVL_EC_OK == r )
                {
                    gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InContinuous;
                }
            }
        }
        r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    }

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_StartContinuous (AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    r |= AVL_Demod_DVBSx_Diseqc_IsSafeToSwitchMode(uiChipNo);

    if( AVL_EC_OK == r )
    {
        //No data in FIFO
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
        i1 &= 0xfffffff8;
        i1 |= 0x03;     //switch to continuous mode
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

        //start to send out wave
        i1 |= (1<<10);
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
        if( AVL_EC_OK == r )
        {
            gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_InContinuous;
        }
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    return (r);
}

AVL_ErrorCode AVL_Demod_DVBSx_Diseqc_StopContinuous (AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = 0;
    AVL_uint32 i1 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    if( AVL_DOS_InContinuous == gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus )
    {
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
        i1 &= 0xfffff3ff;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
    }

    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    return (r);
}

AVL_ErrorCode DVBSx_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_Diseqc_Para stDiseqcConfig;

    r = II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_mpeg_clk_MHz_saddr_offset,
        gstChipInternalArray[uiChipNo].uiTSFrequencyHz/10000);
    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_fec_clk_MHz_saddr_offset,
        gstChipInternalArray[uiChipNo].uiCoreFrequencyHz/10000);

    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_adc_clk_MHz_saddr_offset,
        gstChipInternalArray[uiChipNo].uiADCFrequencyHz/10000);
    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_int_dmd_clk_MHz_saddr_offset,
        gstChipInternalArray[uiChipNo].uiDDCFrequencyHz/10000);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_rfagc_pol_iaddr_offset,
        gstChipInternalArray[uiChipNo].stDVBSxPara.eDVBSxAGCPola);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_format_iaddr_offset,
        AVL_OFFBIN);//Offbin
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_input_iaddr_offset,
        AVL_ADC_IN);//ADC in

    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_IF_Offset_10kHz_saddr_offset,
        0);

    r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_show_detail_saddr_offset,
            0);// 1: print more std_out information

    if(gstChipInternalArray[uiChipNo].ucDisableSAGC == 0)
    {
        r |= EnableSAGC_Demod(uiChipNo);
    }
    else
    {
        r |= DisableSAGC_Demod(uiChipNo);
    }


   /* r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
      gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_auto_pnd_collect_frames_saddr_offset, 3);*/


    stDiseqcConfig.eRxTimeout = AVL_DRT_150ms;
    stDiseqcConfig.eRxWaveForm = gstChipInternalArray[uiChipNo].stDVBSxPara.e22KWaveForm;
    stDiseqcConfig.uiToneFrequencyKHz = 22;
    stDiseqcConfig.eTXGap = AVL_DTXG_15ms;
    stDiseqcConfig.eTxWaveForm = AVL_DWM_Normal;

    r |= DVBSx_Diseqc_Initialize_Demod(&stDiseqcConfig,uiChipNo);

    return (r);
}

AVL_ErrorCode DVBSx_Diseqc_Initialize_Demod(AVL_Diseqc_Para *pDiseqcPara, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 i1 = 0;

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    if( AVL_EC_OK == r )
    {
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_srst_offset, 1);

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_samp_frac_n_offset, 2000000);       //2M=200*10kHz
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_samp_frac_d_offset, gstChipInternalArray[uiChipNo].uiDDCFrequencyHz);

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tone_frac_n_offset, ((pDiseqcPara->uiToneFrequencyKHz)<<1));
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tone_frac_d_offset, (gstChipInternalArray[uiChipNo].uiDDCFrequencyHz/1000));

        // Initialize the tx_control
        r |= II2C_Read32_Demod (gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, &i1);
        i1 &= 0x00000300;
        i1 |= 0x20;     //reset tx_fifo
        i1 |= ((AVL_uint32)(pDiseqcPara->eTXGap) << 6);
        i1 |= ((AVL_uint32)(pDiseqcPara->eTxWaveForm) << 4);
        i1 |= (1<<3);           //enable tx gap.
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);
        i1 &= ~(0x20);  //release tx_fifo reset
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_tx_cntrl_offset, i1);

        // Initialize the rx_control
        i1 = ((AVL_uint32)(pDiseqcPara->eRxWaveForm) << 2);
        i1 |= (1<<1);   //active the receiver
        i1 |= (1<<3);   //envelop high when tone present
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_cntrl_offset, i1);
        i1 = (AVL_uint32)(pDiseqcPara->eRxTimeout);
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_rx_msg_tim_offset, i1);

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base + hw_diseqc_srst_offset, 0);

        if( AVL_EC_OK == r )
        {
            gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_Initialized;
        }
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));

    return (r);
}

AVL_ErrorCode DVBSx_GetLockStatus_Demod( AVL_puchar pucLocked, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 usTemp = 0;

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_fec_lock_saddr_offset, &usTemp);

    if(0x1 == usTemp)
    {
        *pucLocked = 1;
    }
    else
    {
        *pucLocked = 0;
    }

    return r;
}

AVL_ErrorCode DVBSx_GetSNR_Demod(AVL_puint32 puiSNR_db, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_int_SNR_dB_iaddr_offset,
        puiSNR_db);
    if( (*puiSNR_db) > 10000 )
    {
        // Not get stable SNR value yet.
        *puiSNR_db = 0;
    }

    return r;
}

AVL_ErrorCode DVBSx_GetSignalQuality_Demod(AVL_puint16 puiQuality , AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    r = DVBSx_GetSNR_Demod(&uiTemp, uiChipNo);

    if(uiTemp > 2500)
    {
        *puiQuality = 100;
    }
    else
    {
        *puiQuality = uiTemp*100/2500;
    }

    return r;
}

void DVBSx_SetFwData_Demod(AVL_puchar pInitialData, AVL_uint32 uiChipNo)
{
    gstChipInternalArray[uiChipNo].ucCustomizeFwData = 1;
    gstChipInternalArray[uiChipNo].DVBSxFwData = pInitialData;
}

AVL_ErrorCode DVBSx_SetAGCPola(AVL_AGCPola enumAGC_Pola, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base + rc_DVBSx_rfagc_pol_iaddr_offset, (AVL_uint32)enumAGC_Pola);

    return r;
}

AVL_ErrorCode DVBSx_GetPrePostBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo)
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
                 gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_post_viterbi_BER_estimate_x10M_iaddr_offset,&uiTemp);
            *puiBERxe9 = uiTemp * 100;//match 1e9
            break;
        case AVL_PRE_LDPC_BER:
            r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_pre_LDPC_BER_estimate_x10M_iaddr_offset,&uiTemp);
            *puiBERxe9 = uiTemp * 100;//match 1e9
            break;
        case AVL_POST_LDPC_BER:
            r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_post_LDPC_BER_estimate_x10M_iaddr_offset,&uiTemp);
            *puiBERxe9 = uiTemp * 100;//match 1e9
            break;
        default:
            break;
    }

    return r;
}
AVL_ErrorCode AVL_Demod_DVBSx_GetFreqOffset( AVL_pint32 piFreqOffsetHz, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    AVL_int16 FreqOffset_100KHz;

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base + rs_DVBSx_int_carrier_freq_100kHz_saddr_offset, (AVL_puint16)&FreqOffset_100KHz);
    *piFreqOffsetHz = (AVL_int32)(FreqOffset_100KHz*100000);

    return r;
}

