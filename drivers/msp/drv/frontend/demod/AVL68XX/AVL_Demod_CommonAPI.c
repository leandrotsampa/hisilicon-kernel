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

AVL_semaphore gsemI2C;
AVL_ChipInternal gstChipInternalArray[2];

extern AVL_PLL_Conf0 	gstPLLConfigArray0[2];
extern AVL_CommonConfig AVL_CommonConfigChip0;
extern AVL_DVBTxConfig  AVL_DVBTxConfigChip0;
extern AVL_DVBSxConfig  AVL_DVBSxConfigChip0;
extern AVL_ISDBTConfig  AVL_ISDBTConfigChip0;
extern AVL_DVBCConfig   AVL_DVBCConfigChip0;
extern AVL_DTMBConfig   AVL_DTMBConfigChip0;
extern AVL_CommonConfig AVL_CommonConfigChip1;
extern AVL_DVBTxConfig  AVL_DVBTxConfigChip1;
extern AVL_DVBSxConfig  AVL_DVBSxConfigChip1;
extern AVL_ISDBTConfig  AVL_ISDBTConfigChip1;
extern AVL_DVBCConfig   AVL_DVBCConfigChip1;
extern AVL_DTMBConfig   AVL_DTMBConfigChip1;

AVL_ErrorCode AVL_Demod_Initialize(AVL_DemodMode eStartupMode, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiMaxRetries  = 100;
    AVL_uint32 delay_unit_ms = 20;//the time out window is 10*20=200ms
    AVL_uint32 i = 0;
    AVL_uint32 j = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    if(uiChipNo == 0)
    {
        gstChipInternalArray[uiChipNo].usI2CBus   = AVL_CommonConfigChip0.usI2CBus;
        gstChipInternalArray[uiChipNo].usI2CAddr  = AVL_CommonConfigChip0.usI2CAddr;
        gstChipInternalArray[uiChipNo].eDemodXtal = AVL_CommonConfigChip0.eDemodXtal;
        gstChipInternalArray[uiChipNo].eCurrentDemodMode = eStartupMode;
        gstChipInternalArray[uiChipNo].stTSConfig.eMode      = AVL_CommonConfigChip0.eTSMode;
        gstChipInternalArray[uiChipNo].stTSConfig.eClockEdge = AVL_CommonConfigChip0.eClockEdge;
        gstChipInternalArray[uiChipNo].stTSConfig.eClockMode = AVL_CommonConfigChip0.eClockMode;

        gstChipInternalArray[uiChipNo].stDVBTxPara.eDVBTxInputPath = AVL_DVBTxConfigChip0.eDVBTxInputPath;
        gstChipInternalArray[uiChipNo].stDVBTxPara.uiDVBTxIFFreqHz = AVL_DVBTxConfigChip0.uiDVBTxIFFreqHz;
        gstChipInternalArray[uiChipNo].stDVBTxPara.eDVBTxAGCPola   = AVL_DVBTxConfigChip0.eDVBTxAGCPola;

        gstChipInternalArray[uiChipNo].stDVBSxPara.eDVBSxAGCPola   = AVL_DVBSxConfigChip0.eDVBSxAGCPola;
        gstChipInternalArray[uiChipNo].stDVBSxPara.e22KWaveForm    = AVL_DVBSxConfigChip0.e22KWaveForm;

        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTInputPath = AVL_ISDBTConfigChip0.eISDBTInputPath;
        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTBandwidth = AVL_ISDBTConfigChip0.eISDBTBandwidth;
        gstChipInternalArray[uiChipNo].stISDBTPara.uiISDBTIFFreqHz = AVL_ISDBTConfigChip0.uiISDBTIFFreqHz;
        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTAGCPola   = AVL_ISDBTConfigChip0.eISDBTAGCPola;


        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCInputPath      = AVL_DVBCConfigChip0.eDVBCInputPath;
        gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCIFFreqHz      = AVL_DVBCConfigChip0.uiDVBCIFFreqHz;
        gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCSymbolRateSps = AVL_DVBCConfigChip0.uiDVBCSymbolRateSps;
        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCAGCPola        = AVL_DVBCConfigChip0.eDVBCAGCPola;
        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCStandard       = AVL_DVBCConfigChip0.eDVBCStandard;

        gstChipInternalArray[uiChipNo].stDTMBPara.uiDTMBSymbolRateHz  = AVL_DTMBConfigChip0.uiDTMBSymbolRateHz;
        gstChipInternalArray[uiChipNo].stDTMBPara.eDTMBInputPath      = AVL_DTMBConfigChip0.eDTMBInputPath;
        gstChipInternalArray[uiChipNo].stDTMBPara.uiDTMBIFFreqHz      = AVL_DTMBConfigChip0.uiDTMBIFFreqHz;
        gstChipInternalArray[uiChipNo].stDTMBPara.eDTMBAGCPola        = AVL_DTMBConfigChip0.eDTMBAGCPola;
        for(i=0; i<PATCH_VAR_ARRAY_SIZE; i++)
        {
            gstChipInternalArray[uiChipNo].variable_array[i] = 0;
        }
        gstChipInternalArray[uiChipNo].ucSleepFlag = 0;
    }
    else if(uiChipNo == 1)
    {
        gstChipInternalArray[uiChipNo].usI2CBus   = AVL_CommonConfigChip1.usI2CBus;
        gstChipInternalArray[uiChipNo].usI2CAddr  = AVL_CommonConfigChip1.usI2CAddr;
        gstChipInternalArray[uiChipNo].eDemodXtal = AVL_CommonConfigChip1.eDemodXtal;
        gstChipInternalArray[uiChipNo].eCurrentDemodMode = eStartupMode;
        gstChipInternalArray[uiChipNo].stTSConfig.eMode      = AVL_CommonConfigChip1.eTSMode;
        gstChipInternalArray[uiChipNo].stTSConfig.eClockEdge = AVL_CommonConfigChip1.eClockEdge;
        gstChipInternalArray[uiChipNo].stTSConfig.eClockMode = AVL_CommonConfigChip1.eClockMode;

        gstChipInternalArray[uiChipNo].stDVBTxPara.eDVBTxInputPath = AVL_DVBTxConfigChip1.eDVBTxInputPath;
        gstChipInternalArray[uiChipNo].stDVBTxPara.uiDVBTxIFFreqHz = AVL_DVBTxConfigChip1.uiDVBTxIFFreqHz;
        gstChipInternalArray[uiChipNo].stDVBTxPara.eDVBTxAGCPola   = AVL_DVBTxConfigChip1.eDVBTxAGCPola;

        gstChipInternalArray[uiChipNo].stDVBSxPara.eDVBSxAGCPola   = AVL_DVBSxConfigChip1.eDVBSxAGCPola;
        gstChipInternalArray[uiChipNo].stDVBSxPara.e22KWaveForm    = AVL_DVBSxConfigChip1.e22KWaveForm;

        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTInputPath = AVL_ISDBTConfigChip1.eISDBTInputPath;
        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTBandwidth = AVL_ISDBTConfigChip1.eISDBTBandwidth;
        gstChipInternalArray[uiChipNo].stISDBTPara.uiISDBTIFFreqHz = AVL_ISDBTConfigChip1.uiISDBTIFFreqHz;
        gstChipInternalArray[uiChipNo].stISDBTPara.eISDBTAGCPola   = AVL_ISDBTConfigChip1.eISDBTAGCPola;


        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCInputPath      = AVL_DVBCConfigChip1.eDVBCInputPath;
        gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCIFFreqHz      = AVL_DVBCConfigChip1.uiDVBCIFFreqHz;
        gstChipInternalArray[uiChipNo].stDVBCPara.uiDVBCSymbolRateSps = AVL_DVBCConfigChip1.uiDVBCSymbolRateSps;
        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCAGCPola        = AVL_DVBCConfigChip1.eDVBCAGCPola;
        gstChipInternalArray[uiChipNo].stDVBCPara.eDVBCStandard       = AVL_DVBCConfigChip1.eDVBCStandard;

        gstChipInternalArray[uiChipNo].stDTMBPara.uiDTMBSymbolRateHz  = AVL_DTMBConfigChip1.uiDTMBSymbolRateHz;
        gstChipInternalArray[uiChipNo].stDTMBPara.eDTMBInputPath      = AVL_DTMBConfigChip1.eDTMBInputPath;
        gstChipInternalArray[uiChipNo].stDTMBPara.uiDTMBIFFreqHz      = AVL_DTMBConfigChip1.uiDTMBIFFreqHz;
        gstChipInternalArray[uiChipNo].stDTMBPara.eDTMBAGCPola        = AVL_DTMBConfigChip1.eDTMBAGCPola;
        for(i=0; i<PATCH_VAR_ARRAY_SIZE; i++)
        {
            gstChipInternalArray[uiChipNo].variable_array[i] = 0;
        }
        gstChipInternalArray[uiChipNo].ucSleepFlag = 0;
    }
    r = GetFamilyID_Demod(&(gstChipInternalArray[uiChipNo].uiFamilyID), uiChipNo);
	if (r != AVL_EC_OK)
	{
        HI_INFO_TUNER("Avl68xx::familyid failure\n");
		return r;
	}
	// sky()
    HI_INFO_TUNER("Avl68xx::family:%08x\n", gstChipInternalArray[uiChipNo].uiFamilyID);
	if (gstChipInternalArray[uiChipNo].uiFamilyID != AVL68XX &&
		gstChipInternalArray[uiChipNo].uiFamilyID != AVL6762_FAMILYID)
	{
        HI_INFO_TUNER("Avl68xx::familyid not support\n");
		return AVL_EC_NOT_SUPPORTED;
	}

    IBase_LoadRegisterBaseAddr_Demod(uiChipNo);

    r |= InitSemaphore_Demod(uiChipNo);
    r |= IBase_Initialize_Demod(uiChipNo);
	if (r != AVL_EC_OK)
	{
        HI_INFO_TUNER("Avl68xx::fw failure\n");
		return r;
	}
    while (AVL_EC_OK != IBase_CheckChipReady_Demod(uiChipNo))
    {
        if (uiMaxRetries <= j++)
        {
            r |= AVL_EC_GENERAL_FAIL;
            break;
        }
        AVL_IBSP_Delay(delay_unit_ms);
    }

    r |= SetInternalFunc_Demod(gstChipInternalArray[uiChipNo].eCurrentDemodMode, uiChipNo);
    gstChipInternalArray[uiChipNo].ucDisableTCAGC = 0;
    gstChipInternalArray[uiChipNo].ucDisableSAGC  = 0;

    r |= IRx_Initialize_Demod(uiChipNo);
    r |= SetTSMode_Demod(uiChipNo);
    r |= SetTSSerialPin_Demod(AVL_MPSP_DATA0, uiChipNo);
    r |= SetTSSerialOrder_Demod(AVL_MPBO_MSB, uiChipNo);
// sky
//  r |= SetTSSerialSyncPulse_Demod(AVL_TS_SERIAL_SYNC_1_PULSE, uiChipNo);
	r |= SetTSSerialSyncPulse_Demod(AVL_TS_SERIAL_SYNC_8_PULSE, uiChipNo);
    r |= SetTSErrorBit_Demod (AVL_TS_ERROR_BIT_DISABLE, uiChipNo);
    r |= SetTSErrorPola_Demod(AVL_MPEP_Normal, uiChipNo);
    r |= SetTSValidPola_Demod(AVL_MPVP_Normal, uiChipNo);
    r |= SetTSPacketLen_Demod(AVL_TS_188, uiChipNo);
    r |= SetTSParallelOrder_Demod(AVL_TS_PARALLEL_ORDER_NORMAL, uiChipNo);
    r |= SetTSParallelPhase_Demod(AVL_TS_PARALLEL_PHASE_0, uiChipNo);
    r |= EnableTSOutput_Demod(uiChipNo);
    r |= TunerI2C_Initialize_Demod(uiChipNo);
    r |= InitErrorStat_Demod(uiChipNo);
    r |= Initilize_GPIOStatus_Demod(uiChipNo);
    return r;
}

AVL_ErrorCode AVL_Demod_GetChipID(AVL_puint32 puiChipID,AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiMemberIDRegAddr = 0x0;
    AVL_uint16 usAddrSize = 3;
    AVL_uint16 usDataSize = 4;
    AVL_uchar pucBuffAddr[3] = {0};
    AVL_uchar pucBuffData[4]= {0};

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = GetFamilyID_Demod(&(gstChipInternalArray[uiChipNo].uiFamilyID), uiChipNo);

    IBase_LoadRegisterBaseAddr_Demod(uiChipNo);

    uiMemberIDRegAddr = gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_member_ID_base;

    ChunkAddr_Demod(uiMemberIDRegAddr, pucBuffAddr);

    if(uiChipNo == 0)
    {
        r  = AVL_IBSP_I2C_Write(AVL_CommonConfigChip0.usI2CBus, AVL_CommonConfigChip0.usI2CAddr, pucBuffAddr, &usAddrSize);
        r |= AVL_IBSP_I2C_Read (AVL_CommonConfigChip0.usI2CBus, AVL_CommonConfigChip0.usI2CAddr, pucBuffData, &usDataSize);
    }
    else if(uiChipNo == 1)
    {
        r  = AVL_IBSP_I2C_Write(AVL_CommonConfigChip1.usI2CBus, AVL_CommonConfigChip1.usI2CAddr, pucBuffAddr, &usAddrSize);
        r |= AVL_IBSP_I2C_Read (AVL_CommonConfigChip1.usI2CBus, AVL_CommonConfigChip1.usI2CAddr, pucBuffData, &usDataSize);
    }

    *puiChipID = DeChunk32_Demod(pucBuffData);

    return r;
}

AVL_ErrorCode AVL_Demod_GetLockStatus(AVL_puchar pucDemodLocked, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    *pucDemodLocked = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r =  AVL_EC_GENERAL_FAIL;
        return r;
    }

    if(gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus)
    {
        r = gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus(pucDemodLocked, uiChipNo);
    }

    return r;
}

AVL_ErrorCode AVL_Demod_GetSNR (AVL_puint32 puiSNRx100, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    *puiSNRx100 = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    if(gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR)
    {
        r = gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR(puiSNRx100, uiChipNo);
    }

    return (r);
}

AVL_ErrorCode AVL_Demod_GetSQI (AVL_puint16 pusSQI, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    *pusSQI = 0;
    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    if(gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI)
    {
        r = gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI(pusSQI, uiChipNo);
    }

    return (r);
}

AVL_ErrorCode AVL_Demod_GetSSI(AVL_puint16 pusSSI, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    *pusSSI = 0;
    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_rf_agc_saddr_offset, pusSSI);

    return (r);
}

AVL_ErrorCode AVL_Demod_GetPER(AVL_uint32 *puiPERxe9, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiHwCntPktErrors = 0;
    AVL_uint32 uiHwCntNumPkts = 0;
    AVL_uint32 uiTemp = 0;
    AVLuint64 uiTemp64 = {0,0};
    AVL_uchar uclock_status = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        *puiPERxe9 = AVL_CONSTANT_10_TO_THE_9TH;
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = AVL_Demod_GetLockStatus(&uclock_status, uiChipNo);

    //record the lock status before return the PER
    if(1 == uclock_status)
    {
        gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 0;
    }
    else
    {
        gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 1;
        *puiPERxe9 = AVL_CONSTANT_10_TO_THE_9TH;
        return r;
    }

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + packet_error_offset, &uiHwCntPktErrors);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + packet_num_offset, &uiHwCntNumPkts);

    if(uiHwCntNumPkts > (AVL_uint32)(1 << 31))
    {
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base, &uiTemp);
        uiTemp |= 0x00000001;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base, uiTemp);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + packet_error_offset, &uiHwCntPktErrors);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + packet_num_offset, &uiHwCntNumPkts);
        uiTemp &= 0xFFFFFFFE;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base, uiTemp);
        Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumPkts, uiHwCntNumPkts);
        Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntPktErrors, uiHwCntPktErrors);
        uiHwCntNumPkts = 0;
        uiHwCntPktErrors = 0;
    }

    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts.uiHighWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumPkts.uiHighWord;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts.uiLowWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumPkts.uiLowWord;
    Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts, uiHwCntNumPkts);
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors.uiHighWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntPktErrors.uiHighWord;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors.uiLowWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntPktErrors.uiLowWord;
    Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors, uiHwCntPktErrors);

    Multiply32_Demod(&uiTemp64, gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors.uiLowWord, AVL_CONSTANT_10_TO_THE_9TH);
    gstChipInternalArray[uiChipNo].stAVLErrorStat.uiPER = Divide64_Demod(gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts, uiTemp64);

    *puiPERxe9 = gstChipInternalArray[uiChipNo].stAVLErrorStat.uiPER;

    return r;

}

AVL_ErrorCode AVL_Demod_SetMode(AVL_DemodMode eDemodMode,AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTimeDelay = 5;
    AVL_uint32 uiMaxRetries = 40;//time out window 5*40 = 200ms
    AVL_puchar pInitialData = 0;
    AVL_uint32 i = 0;
    AVL_uchar uc_dl_patch_parse_format = 0;
    AVL_uint32 ui_patch_idx = 0;
    AVL_uint32 ui_patch_script_version = 0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = GetMode_Demod(&gstChipInternalArray[uiChipNo].eCurrentDemodMode, uiChipNo);
    if(r != AVL_EC_OK)
    {
        return r;
    }


    if(gstChipInternalArray[uiChipNo].eCurrentDemodMode == eDemodMode)
    {
        return AVL_EC_OK;
    }

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    if(gstChipInternalArray[uiChipNo].ucCustomizeFwData == 0)
        {
            switch(gstChipInternalArray[uiChipNo].uiFamilyID)
            {
                case AVL68XX:
                    switch(eDemodMode)
                    {
                        case AVL_DVBTX:
                            pInitialData = AVL_Demod_Patch_DVBTxFw;
                            break;
                        case AVL_DVBSX:
                            pInitialData = AVL_Demod_Patch_DVBSxFw;
                            break;
                        case AVL_ISDBT:
                            pInitialData = AVL_Demod_Patch_ISDBTFw;
                            break;
                        case AVL_DVBC:
                            pInitialData = AVL_Demod_Patch_DVBCFw;
                            break;
                        default:
                            pInitialData = AVL_Demod_Patch_DVBTxFw;
                            break;
                    }
                    break;
                default:
                    pInitialData = AVL_Demod_Patch_DVBTxFw;
                    break;
            }

        }
        else
        {
            switch(gstChipInternalArray[uiChipNo].uiFamilyID)
            {
                case AVL68XX:
                    switch(eDemodMode)
                    {
                        case AVL_DVBTX:
                            pInitialData = gstChipInternalArray[uiChipNo].DVBTxFwData;
                            break;
                        case AVL_DVBSX:
                            pInitialData = gstChipInternalArray[uiChipNo].DVBSxFwData;
                            break;
                        case AVL_ISDBT:
                            pInitialData = gstChipInternalArray[uiChipNo].ISDBTFwData;
                            break;
                        case AVL_DVBC:
                            pInitialData = gstChipInternalArray[uiChipNo].DVBCFwData;
                            break;
                        default:
                            pInitialData = gstChipInternalArray[uiChipNo].DVBTxFwData;
                            break;
                    }
                    break;
                default:
                    pInitialData = gstChipInternalArray[uiChipNo].DVBTxFwData;
                    break;
            }


        }

        if( AVL_EC_OK == r )
        {

          if((pInitialData[0] & 0x0f0) == 0x10)
          {
            uc_dl_patch_parse_format = 1;
          }
          else
          {
            return AVL_EC_GENERAL_FAIL;//Neither format enumeration was found. Firmware File is Corrupt
          }
        }

    if( AVL_EC_OK == r )
    {

        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 1);


        // Configure the PLL
        if( (gstChipInternalArray[uiChipNo].eCurrentDemodMode != AVL_DVBSX && eDemodMode == AVL_DVBSX) ||
            (gstChipInternalArray[uiChipNo].eCurrentDemodMode == AVL_DVBSX && eDemodMode != AVL_DVBSX) )
        {
            gstChipInternalArray[uiChipNo].eCurrentDemodMode = eDemodMode;
            r |= SetPLL_Demod(uiChipNo);
        }
        else
        {
         	gstChipInternalArray[uiChipNo].eCurrentDemodMode = eDemodMode;
     	}




       	if (AVL_EC_OK == r)
       	{
          	if(uc_dl_patch_parse_format)
          	{
            	r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                		gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_core_ready_word_iaddr_offset, 0x00000000);

            	r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                 		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 0);

            	ui_patch_script_version = AVL_patch_read32(pInitialData, &ui_patch_idx,1);

            	if((ui_patch_script_version & 0x00ff) == 0x1)
            	{ //read patch script version
               		r |= AVL_ParseFwPatch_v0(uiChipNo, 0);
            	}
            	else
            	{
             		r |= AVL_EC_GENERAL_FAIL;
              		return r;
            	}

          	}
      	}
    }
    while (AVL_EC_OK != IBase_CheckChipReady_Demod(uiChipNo))
    {
        if (uiMaxRetries <= i++)
        {
            r |= AVL_EC_GENERAL_FAIL;
            break;
        }
        AVL_IBSP_Delay(uiTimeDelay);
    }

    gstChipInternalArray[uiChipNo].eCurrentDemodMode = eDemodMode;

    r |= SetInternalFunc_Demod(gstChipInternalArray[uiChipNo].eCurrentDemodMode,uiChipNo);

    r |= IRx_Initialize_Demod(uiChipNo);

    r |= SetTSMode_Demod(uiChipNo);
    r |= SetTSSerialPin_Demod(gstChipInternalArray[uiChipNo].eTSSerialPin, uiChipNo);
    r |= SetTSSerialOrder_Demod(gstChipInternalArray[uiChipNo].eTSSerialOrder, uiChipNo);
    r |= SetTSSerialSyncPulse_Demod(gstChipInternalArray[uiChipNo].eTSSerialSyncPulse, uiChipNo);
    r |= SetTSErrorBit_Demod(gstChipInternalArray[uiChipNo].eTSErrorBit, uiChipNo);
    r |= SetTSErrorPola_Demod(gstChipInternalArray[uiChipNo].eTSErrorPola, uiChipNo);
    r |= SetTSValidPola_Demod(gstChipInternalArray[uiChipNo].eTSValidPola, uiChipNo);
    r |= SetTSPacketLen_Demod(gstChipInternalArray[uiChipNo].eTSPacketLen, uiChipNo);
    r |= SetTSParallelOrder_Demod(gstChipInternalArray[uiChipNo].eTSParallelOrder, uiChipNo);
    r |= SetTSParallelPhase_Demod(gstChipInternalArray[uiChipNo].eTSParallelPhase, uiChipNo);
    r |= SetGPIOStatus_Demod(uiChipNo);

    if(gstChipInternalArray[uiChipNo].ucDisableTSOutput == 0)
    {
        r |= EnableTSOutput_Demod(uiChipNo);
    }

    r |= TunerI2C_Initialize_Demod(uiChipNo);

    r |= InitErrorStat_Demod(uiChipNo);

    return r;
}

AVL_ErrorCode AVL_Demod_Sleep(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    r |= IBase_SetSleepClock_Demod(uiChipNo);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_SLEEP, uiChipNo);

    if(AVL_EC_OK == r)
    {
        gstChipInternalArray[uiChipNo].ucSleepFlag = 1;
    }

    r |= TunerI2C_Initialize_Demod(uiChipNo);

    r |= SetGPIOStatus_Demod(uiChipNo);


    return r;

}

AVL_ErrorCode AVL_Demod_Wakeup(AVL_uint32 uiChipNo)
{

    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTimeDelay = 5;
    AVL_uint32 uiMaxRetries = 10;
    AVL_uint32 uiIndex=0;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }
    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo );

    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_WAKE, uiChipNo);

    if(r != AVL_EC_OK)
    {
        return r;
    }

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 1);

    r |= SetPLL_Demod(uiChipNo);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_core_ready_word_iaddr_offset, 0x00000000);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 0);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 0);

    while (AVL_EC_OK != IBase_CheckChipReady_Demod(uiChipNo))
    {
        if (uiMaxRetries < uiIndex++)
        {
            return AVL_EC_GENERAL_FAIL;
        }
        AVL_IBSP_Delay(uiTimeDelay);
    }

    r |= IRx_Initialize_Demod(uiChipNo);

    r |= SetTSMode_Demod(uiChipNo);
    r |= SetTSSerialPin_Demod(gstChipInternalArray[uiChipNo].eTSSerialPin, uiChipNo);
    r |= SetTSSerialOrder_Demod(gstChipInternalArray[uiChipNo].eTSSerialOrder, uiChipNo);
    r |= SetTSSerialSyncPulse_Demod(gstChipInternalArray[uiChipNo].eTSSerialSyncPulse, uiChipNo);
    r |= SetTSErrorBit_Demod(gstChipInternalArray[uiChipNo].eTSErrorBit, uiChipNo);
    r |= SetTSErrorPola_Demod(gstChipInternalArray[uiChipNo].eTSErrorPola, uiChipNo);
    r |= SetTSValidPola_Demod(gstChipInternalArray[uiChipNo].eTSValidPola, uiChipNo);
    r |= SetTSPacketLen_Demod(gstChipInternalArray[uiChipNo].eTSPacketLen, uiChipNo);
    r |= SetTSParallelOrder_Demod(gstChipInternalArray[uiChipNo].eTSParallelOrder, uiChipNo);
    r |= SetTSParallelPhase_Demod(gstChipInternalArray[uiChipNo].eTSParallelPhase, uiChipNo);

    if(gstChipInternalArray[uiChipNo].ucDisableTSOutput == 0)
    {
        r |= EnableTSOutput_Demod(uiChipNo);
    }

    r |= TunerI2C_Initialize_Demod(uiChipNo);

    r |= InitErrorStat_Demod(uiChipNo);

    r |= SetGPIOStatus_Demod(uiChipNo);

    if(AVL_EC_OK == r)
    {
        gstChipInternalArray[uiChipNo].ucSleepFlag = 0;
    }

    return r;

}

AVL_ErrorCode AVL_Demod_I2CBypassOn(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_bit_rpt_cntrl_offset, 0x07);

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_bit_rpt_cntrl_offset, 0x07);

    return (r);
}

AVL_ErrorCode AVL_Demod_I2CBypassOff(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_bit_rpt_cntrl_offset, 0x06);

    return (r);
}

AVL_ErrorCode AVL_Demod_GetVersion(AVL_DemodVersion *pstDemodVersion, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;
    AVL_uchar ucBuff[4] = {0};

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    r =  II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, 0x40000, &uiTemp);
    if( AVL_EC_OK == r )
    {
        pstDemodVersion->uiChip = uiTemp;
    }

    r |=  II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_patch_ver_iaddr_offset, &uiTemp);
    if( AVL_EC_OK == r )
    {
        Chunk32_Demod(uiTemp, ucBuff);
        pstDemodVersion->stPatch.ucMajor = ucBuff[0];
        pstDemodVersion->stPatch.ucMinor = ucBuff[1];
        pstDemodVersion->stPatch.usBuild = ucBuff[2];
        pstDemodVersion->stPatch.usBuild = ((AVL_uint16)((pstDemodVersion->stPatch.usBuild)<<8)) + ucBuff[3];

        pstDemodVersion->stAPI.ucMajor = AVL_API_VER_MAJOR;
        pstDemodVersion->stAPI.ucMinor = AVL_API_VER_MINOR;
        pstDemodVersion->stAPI.usBuild = AVL_API_VER_BUILD;
    }

    return r;
}

AVL_ErrorCode AVL_Demod_SetGPIO(AVL_GPIOPinNumber ePinNumber, AVL_GPIOPinValue ePinValue, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    switch(ePinNumber)
    {
        case AVL_Pin37:
            gstChipInternalArray[uiChipNo].ucPin37Status = 1; // 1 - output
            r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_LOGIC_0);

            switch(ePinValue)
            {
                case AVL_LOGIC_0:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin37Voltage = 0;
                    break;
                case AVL_LOGIC_1:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin37Voltage = 1;
                    break;
                case AVL_HIGH_Z:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin37Voltage = 2;
                    break;
                default:
                        break;
            }
            break;
        case AVL_Pin38:
            gstChipInternalArray[uiChipNo].ucPin38Status = 1;
            r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_LOGIC_0);

            switch(ePinValue)
            {
                case AVL_LOGIC_0:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin38Voltage = 0;
                    break;
                case AVL_LOGIC_1:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin38Voltage = 1;
                    break;
                case AVL_HIGH_Z:
                    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, ePinValue);
                    gstChipInternalArray[uiChipNo].ucPin38Voltage = 2;
                    break;
                default:
                        break;
            }
            break;
        default:
            break;
    }

    return r;
}

AVL_ErrorCode AVL_Demod_GetGPIOValue(AVL_GPIOPinNumber ePinNumber, AVL_GPIOPinValue *pePinValue, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    switch(ePinNumber)
    {
        case AVL_Pin37:
            gstChipInternalArray[uiChipNo].ucPin37Status = 0;  // 0 - input
            r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_HIGH_Z);

            r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_i_offset, (AVL_puint32)pePinValue);
            break;

        case AVL_Pin38:
            gstChipInternalArray[uiChipNo].ucPin38Status = 0;
            r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_HIGH_Z);

            r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_i_offset, (AVL_puint32)pePinValue);
            break;
        default:
            break;
    }

    return r;
}

