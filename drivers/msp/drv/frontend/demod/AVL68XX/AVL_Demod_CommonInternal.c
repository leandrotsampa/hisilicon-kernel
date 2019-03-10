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

#if defined(_AVL68XX_)
#include "AVL_Demod_Patch_DVBTxFw.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_Patch_DVBCFw.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_Patch_DVBSxFw.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_Patch_ISDBTFw.h"
#endif

#if defined(_AVL63XX_)
#include "AVL_Demod_DTMBFw.h"
#endif


extern AVL_semaphore 	gsemI2C;
extern AVL_CommonConfig AVL_CommonConfigChip0;
extern AVL_CommonConfig AVL_CommonConfigChip1;
extern AVL_ChipInternal gstChipInternalArray[2];

AVL_ErrorCode InitSemaphore_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    static AVL_uchar gReceiver_sem_inited[2] = {0, };	//receiver semaphore initialization indicator
    static AVL_uchar gDisqec_sem_inited[2] = {0, };   	//Disqec operation semaphore indicator
    static AVL_uchar gI2C_sem_inited = 0;               //I2C operation semaphore indicator

    if( 0 == gReceiver_sem_inited[uiChipNo] )
    {
        gReceiver_sem_inited[uiChipNo] = 1;
        r |= AVL_IBSP_InitSemaphore(&(gstChipInternalArray[uiChipNo].semRx));
    }
    if( 0 == gDisqec_sem_inited[uiChipNo] )
    {
        gDisqec_sem_inited[uiChipNo] = 1;
        r |= AVL_IBSP_InitSemaphore(&(gstChipInternalArray[uiChipNo].stDVBSxPara.semDiseqc));
    }
    if( 0 == gI2C_sem_inited )
    {
        gI2C_sem_inited = 1;
        r |= AVL_IBSP_InitSemaphore(&gsemI2C);
    }

    gstChipInternalArray[uiChipNo].stDVBSxPara.eDiseqcStatus = AVL_DOS_Uninitialized;

    return (r);
}

void IBase_LoadRegisterBaseAddr_Demod(AVL_uint32 uiChipNo)
{
    switch(gstChipInternalArray[uiChipNo].uiFamilyID)
    {
         case AVL68XX:
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base           = 0x110840;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base    = 0x110010;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base                 = 0x132050;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base           = 0x118000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_control_base        = 0x124000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base          = 0x120000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_TS_tri_state_cntrl_base  = 0x130420;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_AGC_tri_state_cntrl_base = 0x120000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_diseqc_base              = 0x16c000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_plp_list_base            = 0x2912b4;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_blind_scan_info_base     = 0x200C00;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_member_ID_base           = 0x108000;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_dma_sys_status_base      = 0x00110048;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_dma_sys_cmd_base         = 0x00110050;

            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base          = 0x200;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base          = 0x0a4;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBTx_config_reg_base    = 0xa00;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBTx_status_reg_base    = 0x800;

            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT2_data_PLP_config_reg_base     = 0x868;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT2_common_PLP_config_reg_base   = 0x884;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT2_P1_reg_base                  = 0x800;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT2_L1_pre_reg_base              = 0x808;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT2_L1_post_config_reg_base      = 0x830;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBT_TPS_reg_base                  = 0x8f0;

            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_config_reg_base    = 0xe00;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBSx_status_reg_base    = 0xc00;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_config_reg_base    = 0xa00;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_ISDBT_status_reg_base    = 0x800;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_config_reg_base     = 0x600;
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_DVBC_status_reg_base     = 0x400;
            break;
        default:
            break;
    }
}

AVL_ErrorCode IBase_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_puchar pInitialData = 0;
    AVL_uchar  dl_patch_parse_format = 0;
    AVL_uint32 patch_idx = 0;
    AVL_uint32 patch_script_version = 0;

    if(gstChipInternalArray[uiChipNo].ucCustomizeFwData == 0)
    {
        switch(gstChipInternalArray[uiChipNo].uiFamilyID)
        {
            case AVL68XX:
                switch(gstChipInternalArray[uiChipNo].eCurrentDemodMode)
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
                r = AVL_EC_GENERAL_FAIL;
                return r;
        }

    }
    else
    {
        switch(gstChipInternalArray[uiChipNo].uiFamilyID)
        {
            case AVL68XX:
                switch(gstChipInternalArray[uiChipNo].eCurrentDemodMode)
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
                r = AVL_EC_GENERAL_FAIL;
                return r;
        }
    }




    if( AVL_EC_OK == r )
    {

        if((pInitialData[0] & 0x0f0) == 0x10)
        {
            dl_patch_parse_format = 1;
        }
        else
        {
			HI_INFO_TUNER("Avl68xx::unk_p:%08x\n", pInitialData[0]);
            return AVL_EC_GENERAL_FAIL;//Neither format enumeration was found. Firmware File is Corrupt
        }
    }

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                                       gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 1);

    // Configure the PLL
    r |= SetPLL_Demod(uiChipNo);
    if (AVL_EC_OK == r)
    {
        if(dl_patch_parse_format)
        {
        	r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                		gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_core_ready_word_iaddr_offset, 0x00000000);
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                 		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 0);

           	patch_script_version = AVL_patch_read32(pInitialData, &patch_idx,1);

           	if((patch_script_version & 0x00ff) == 0x1)
           	{ //read patch script version
             	r |= AVL_ParseFwPatch_v0(uiChipNo, 0);
           	}
           	else
           	{
				HI_INFO_TUNER("Avl68xx::ver.%08x\n", patch_script_version);
             	r |= AVL_EC_GENERAL_FAIL;
        	}

           	return r;

        }
    }
    return r;
}

AVL_ErrorCode TunerI2C_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 bit_rpt_divider = 0;
    AVL_uint32 uiTemp = 0;

    r  = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_srst_offset, 1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_bit_rpt_cntrl_offset, 0x6);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_cntrl_offset, &uiTemp);
    uiTemp = (uiTemp&0xFFFFFFFE);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_cntrl_offset, uiTemp);
    bit_rpt_divider = (0x2A)*(gstChipInternalArray[uiChipNo].uiCoreFrequencyHz/1000)/(240*1000);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_bit_rpt_clk_div_offset, bit_rpt_divider);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_tuner_i2c_base + tuner_i2c_srst_offset, 0);

    return r;
}

AVL_ErrorCode EnableTSOutput_Demod(AVL_uint32 uiChipNo)
{

    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableTSOutput = 0;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_TS_tri_state_cntrl_base, 0);

    return r;
}

AVL_ErrorCode DisableTSOutput_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableTSOutput = 1;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_TS_tri_state_cntrl_base, 0xfff);

    return r;
}

AVL_ErrorCode InitErrorStat_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_ErrorStatConfig stErrorStatConfig;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r=AVL_EC_GENERAL_FAIL;
        return r;
    }

    stErrorStatConfig.eErrorStatMode = AVL_ERROR_STAT_AUTO;
    stErrorStatConfig.eAutoErrorStatType = AVL_ERROR_STAT_TIME;
    stErrorStatConfig.uiTimeThresholdMs = 3000;
    stErrorStatConfig.uiNumberThresholdByte = 0;


    r = ErrorStatMode_Demod(stErrorStatConfig, uiChipNo);
    r |= ResetPER_Demod(uiChipNo);

    return (r);
}

AVL_ErrorCode ErrorStatMode_Demod(AVL_ErrorStatConfig stErrorStatConfig,AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVLuint64 time_tick_num = {0,0};

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_mode_offset,(AVL_uint32)stErrorStatConfig.eErrorStatMode);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + tick_type_offset,(AVL_uint32)stErrorStatConfig.eAutoErrorStatType);

    Multiply32_Demod(&time_tick_num, gstChipInternalArray[uiChipNo].uiTSFrequencyHz/1000, stErrorStatConfig.uiTimeThresholdMs);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + time_tick_low_offset,time_tick_num.uiLowWord);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + time_tick_high_offset,time_tick_num.uiHighWord);

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_tick_low_offset,stErrorStatConfig.uiTimeThresholdMs);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_tick_high_offset,0);//high 32-bit is not used

    if(stErrorStatConfig.eErrorStatMode == AVL_ERROR_STAT_AUTO)//auto mode
    {
        //reset auto error stat
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + tick_clear_offset,0);
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + tick_clear_offset,1);
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + tick_clear_offset,0);
    }

    return (r);
}

AVL_ErrorCode ResetErrorStat_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r = ResetPER_Demod(uiChipNo);

    return r;
}

AVL_ErrorCode ResetPER_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntPktErrors.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntPktErrors.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumPkts.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumPkts.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stPktErrors.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumPkts.uiLowWord = 0;

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, &uiTemp);
    uiTemp |= 0x00000001;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, &uiTemp);
    uiTemp |= 0x00000008;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
    uiTemp |= 0x00000001;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
    uiTemp &= 0xFFFFFFFE;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

    return r;
}

AVL_ErrorCode ResetBER_Demod(AVL_BERConfig *pstErrorStatConfig, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiLFSRSynced = 0;
    AVL_uint32 uiTemp = 0;
    AVL_uint32 uiCnt = 0;
    AVL_uint32 uiByteCnt = 0;
    AVL_uint32 uiBER_FailCnt = 0;
    AVL_uint32 uiBitErrors = 0;


    gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.usLFSRSynced = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntBitErrors.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntBitErrors.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumBits.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumBits.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors.uiLowWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits.uiHighWord = 0;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits.uiLowWord = 0;

    //ber software reset
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, &uiTemp);
    uiTemp |= 0x00000002;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

    //alway inverted
    pstErrorStatConfig->eBERFBInversion = AVL_LFSR_FB_INVERTED;

    //set Test Pattern and Inversion
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, &uiTemp);
    uiTemp &= 0xFFFFFFCF;
    uiTemp |= ((((AVL_uint32)pstErrorStatConfig->eBERTestPattern) << 5) | (((AVL_uint32)pstErrorStatConfig->eBERFBInversion) << 4));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
    uiTemp &= 0xFFFFFE3F;
    uiTemp |= (pstErrorStatConfig->uiLFSRStartPos<<6);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

    while(!uiLFSRSynced)
    {
        uiTemp |= 0x00000006;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
        uiTemp &= 0xFFFFFFFD;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

        uiCnt = 0;
        uiByteCnt = 0;
        while((uiByteCnt < 1000) && (uiCnt < 200))
        {
            r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
               gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_num_offset, &uiByteCnt);
            uiCnt++;
        }

        uiTemp |= 0x00000006;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
        uiTemp &= 0xFFFFFFF9;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

        uiCnt = 0;
        uiByteCnt = 0;
        while((uiByteCnt < 10000) && (uiCnt < 200))
        {
            uiCnt++;
            r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                 gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_num_offset, &uiByteCnt);
        }

        uiTemp &= 0xFFFFFFF9;
        uiTemp |= 0x00000002;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);

        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_num_offset, &uiByteCnt);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + bit_error_offset, &uiBitErrors);
        if(uiCnt == 200)
        {
            break;
        }
        else if((uiByteCnt << 3) < (10 * uiBitErrors))
        {
            uiBER_FailCnt++;
            if(uiBER_FailCnt > 10)
            {
                break;
            }
        }
        else
        {
            uiLFSRSynced = 1;
        }
    }

    if(uiLFSRSynced == 1)
    {
        uiTemp &= 0xFFFFFFF9;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
    }

    pstErrorStatConfig->uiLFSRSynced = uiLFSRSynced;

    return(r);
 }

AVL_ErrorCode SetPLL_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    switch(gstChipInternalArray[uiChipNo].uiFamilyID)
    {
        case AVL68XX:
            SetPLL0_Demod(uiChipNo);
            break;
        default:
            break;
    }

    return(r);
}


AVL_PLL_Conf0 gstPLLConfigArray0[] =
{
// Note: All the unit of clock frequency in the following is Hz.
//----------------------------------------------------------------------------------------------------------------------------------------------
//| REF_Hz    | C_R | C_F | C_Q | M_R | M_F | M_Q | A_R | A_F | A_Q | CORE_Hz | MPEG_Hz |  ADC_Hz | D_S | D_Q | S_S | S_Q |  DDC_Hz | SDRAM_Hz |
//----------------------------------------------------------------------------------------------------------------------------------------------
  {30000000,  3,  100,    8,   1,   36,   8,    3,  100,    8, 250000000, 270000000, 250000000, 2,   12,   2,   14, 166666667, 142857143},
  {16000000,  1,   55,    7,   1,   68,   8,    1,   60,   32, 251428571, 272000000, 60000000,  2,   12,   2,   14, 160000000, 137142857},
  {24000000,  2,   84,    8,   2,   90,   8,    2,   80,   32, 252000000, 270000000, 60000000,  2,   12,   2,   14, 160000000, 137142857},
  {27000000,  2,   65,    7,   2,   80,   8,    2,   74,    8, 250714286, 270000000, 249750000, 2,   12,   2,   14, 165000000, 142714286},
  {30000000,  3,  100,    8,   1,   36,   8,    3,  100,    8, 250000000, 270000000, 250000000, 2,   12,   2,   14, 166666667, 142857143}, //DVBS
  {16000000,  1,   55,    7,   1,   68,   8,    1,   62,    8, 251428571, 272000000, 248000000, 2,   12,   2,   14, 165333333, 141714286},
  {24000000,  2,   84,    8,   2,   90,   8,    2,   83,    8, 252000000, 270000000, 249000000, 2,   12,   2,   14, 166000000, 142857143},
  {27000000,  2,   65,    7,   2,   80,   8,    2,   74,    8, 250714286, 270000000, 249750000, 2,   12,   2,   14, 166500000, 142714286}

};


AVL_ErrorCode SetPLL0_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 DivRefHz = 0;
    AVL_uint32 PLLRange = 1;

    AVL_PLL_Conf0 *pPLL_Conf = &gstPLLConfigArray0[gstChipInternalArray[uiChipNo].eDemodXtal];

    if(gstChipInternalArray[uiChipNo].eCurrentDemodMode == AVL_DVBSX )
    {
        pPLL_Conf = &gstPLLConfigArray0[gstChipInternalArray[uiChipNo].eDemodXtal+4];
    }
    //sys_pll
    DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_CoreClock_DivR;

    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r  = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divr, pPLL_Conf->m_PLL_CoreClock_DivR-1);//DIVR
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divf, pPLL_Conf->m_PLL_CoreClock_DivF-1);//DIVF
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq, pPLL_Conf->m_PLL_CoreClock_DivQ-1);//DIVQ1
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_range, PLLRange);//range
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);//DIVQ2
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);//DIVQ3
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_CORE));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_CORE));

    //mpeg_pll
    DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_MPEGClock_DivR;
    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divr, pPLL_Conf->m_PLL_MPEGClock_DivR-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divf, pPLL_Conf->m_PLL_MPEGClock_DivF-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq, pPLL_Conf->m_PLL_MPEGClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_range, PLLRange);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_MPEG));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_MPEG));

    //adc_pll
    DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_ADCClock_DivR;
    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divr, pPLL_Conf->m_PLL_ADCClock_DivR-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divf, pPLL_Conf->m_PLL_ADCClock_DivF-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq, pPLL_Conf->m_PLL_ADCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_range, PLLRange);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_ADC));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_ADC));

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_reset_register, 0);
    II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_reset_register, 1);//no I2C ACK
    AVL_IBSP_Delay(1);



    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_dll_out_phase, 96);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_dll_rd_phase, 0);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_deglitch_mode, 1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_dll_init, 1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_dll_init, 0);



    gstChipInternalArray[uiChipNo].uiCoreFrequencyHz = pPLL_Conf->m_CoreFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiFECFrequencyHz = gstChipInternalArray[uiChipNo].uiCoreFrequencyHz;
    gstChipInternalArray[uiChipNo].uiTSFrequencyHz = pPLL_Conf->m_MPEGFrequency_Hz;
    //gstChipInternalArray[uiChipNo].uiADCFrequencyHz = pPLL_Conf->m_ADCFrequency_Hz;


    if(gstChipInternalArray[uiChipNo].eCurrentDemodMode == AVL_DVBSX )
    {
        gstChipInternalArray[uiChipNo].uiADCFrequencyHz = (pPLL_Conf->m_ADCFrequency_Hz)/2;
    }
    else
    {
        switch(gstChipInternalArray[uiChipNo].eDemodXtal)
       {
         case Xtal_16M :
         case Xtal_24M :
        {
         gstChipInternalArray[uiChipNo].uiADCFrequencyHz = (pPLL_Conf->m_ADCFrequency_Hz)/2;
          break;
        }

        case Xtal_30M :
        case Xtal_27M :
        {
          gstChipInternalArray[uiChipNo].uiADCFrequencyHz = pPLL_Conf->m_RefFrequency_Hz;
          break;
        }
      }
    }

    gstChipInternalArray[uiChipNo].uiRefFrequencyHz = pPLL_Conf->m_RefFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiDDCFrequencyHz = pPLL_Conf->m_DDCFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiSDRAMFrequencyHz = pPLL_Conf->m_SDRAMFrequency_Hz;

    return r;
}

AVL_ErrorCode IBase_CheckChipReady_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiCoreReadyWord = 0;
    AVL_uint32 uiCoreRunning = 0;

    r  = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, &uiCoreRunning);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,rs_core_ready_word_iaddr_offset, &uiCoreReadyWord);
    if( (AVL_EC_OK == r) )
    {
        if((1 == uiCoreRunning) || (uiCoreReadyWord != 0x5aa57ff7))
        {
            r = AVL_EC_GENERAL_FAIL;
        }
    }

    return(r);
}

AVL_ErrorCode IRx_Initialize_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    // Load the default configuration
    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_LD_DEFAULT, uiChipNo);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_INIT_SDRAM, uiChipNo);

    r |= IBase_SendRxOPWait_Demod(AVL_FW_CMD_INIT_ADC, uiChipNo);

    r |= gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc(uiChipNo);

    return (r);
}


AVL_ErrorCode IBase_SendRxOPWait_Demod(AVL_uchar ucOpCmd, AVL_uint32 uiChipNo )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pucBuff[4] = {0};
    AVL_uint16 uiTemp = 0;
    const AVL_uint16 uiTimeDelay = 10;
    const AVL_uint16 uiMaxRetries = 20;//the time out window is 10*20 = 200ms
    AVL_uint32 i = 0;

    r = AVL_IBSP_WaitSemaphore(&(gstChipInternalArray[uiChipNo].semRx));

    while (AVL_EC_OK != IBase_GetRxOPStatus_Demod(uiChipNo))
    {
        if (uiMaxRetries < i++)
        {
            r |= AVL_EC_RUNNING;
            break;
        }
        AVL_IBSP_Delay(uiTimeDelay);
    }

    if( AVL_EC_OK == r )
    {
        pucBuff[0] = 0;
        pucBuff[1] = ucOpCmd;
        uiTemp = DeChunk16_Demod(pucBuff);
        r |= II2C_Write16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_fw_command_saddr_offset, uiTemp);
    }

    i = 0;

    do{
          AVL_IBSP_Delay(uiTimeDelay);
          {
             if (uiMaxRetries < i++)
                {
                    r |= AVL_EC_RUNNING;
                    break;
                }
          }
       }while(AVL_EC_OK != IBase_GetRxOPStatus_Demod(uiChipNo));


    r |= AVL_IBSP_ReleaseSemaphore(&(gstChipInternalArray[uiChipNo].semRx));

    return(r);
}



AVL_ErrorCode IBase_GetRxOPStatus_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 uiCmd = 0;

    r = II2C_Read16_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_fw_command_saddr_offset, &uiCmd);

     //System::Console::WriteLine("status: {0}",uiCmd);

    if( AVL_EC_OK == r )
    {
        if( 0 != uiCmd )
        {
            r = AVL_EC_RUNNING;
        }
    }

    return(r);
}

AVL_ErrorCode SetTSMode_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    r  = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_serial_caddr_offset, gstChipInternalArray[uiChipNo].stTSConfig.eMode);
    r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_clock_edge_caddr_offset, gstChipInternalArray[uiChipNo].stTSConfig.eClockEdge);

    if(gstChipInternalArray[uiChipNo].stTSConfig.eClockMode == AVL_TS_CONTINUOUS_ENABLE)
    {
        r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_enable_ts_continuous_caddr_offset, 1);
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_d_iaddr_offset, gstChipInternalArray[uiChipNo].uiTSFrequencyHz);

        if(gstChipInternalArray[uiChipNo].stTSConfig.eMode == AVL_TS_SERIAL)
        {
            if(AVL_DTMB == gstChipInternalArray[uiChipNo].eCurrentDemodMode)
            {
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                    gstChipInternalArray[uiChipNo].uiTSFrequencyHz/2);
            }
            else if(AVL_DVBTX == gstChipInternalArray[uiChipNo].eCurrentDemodMode)
            {
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                    gstChipInternalArray[uiChipNo].uiTSFrequencyHz/2);
            }
            else if(AVL_DVBSX == gstChipInternalArray[uiChipNo].eCurrentDemodMode)
            {
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                    gstChipInternalArray[uiChipNo].uiTSFrequencyHz);
            }
            else if(AVL_ISDBT == gstChipInternalArray[uiChipNo].eCurrentDemodMode)
            {
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                    gstChipInternalArray[uiChipNo].uiTSFrequencyHz/2);
            }
            else if(AVL_DVBC == gstChipInternalArray[uiChipNo].eCurrentDemodMode)
            {
                r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                    gstChipInternalArray[uiChipNo].uiTSFrequencyHz/2);
            }
        }
        else
        {
            r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_cntns_clk_frac_n_iaddr_offset,
                gstChipInternalArray[uiChipNo].uiTSFrequencyHz/8);
        }
    }
    else
    {
        r |= II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_enable_ts_continuous_caddr_offset, 0);
    }

    return r;
}

AVL_ErrorCode SetInternalFunc_Demod(AVL_DemodMode eDemodMode, AVL_uint32 uiChipNo)
{
 AVL_ErrorCode r = AVL_EC_OK;
 if(uiChipNo == 0 || uiChipNo == 1)
 {
    switch(eDemodMode)
    {
 #if defined(_AVL68XX_)
        case AVL_DVBC:
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc = DVBC_Initialize_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus = DVBC_GetLockStatus_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR = DVBC_GetSNR_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI = DVBC_GetSignalQuality_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER = DVBC_GetPrePostBER_Demod;
            break;
#endif

#if defined(_AVL68XX_)
        case AVL_DVBSX:
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc = DVBSx_Initialize_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus = DVBSx_GetLockStatus_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR = DVBSx_GetSNR_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI = DVBSx_GetSignalQuality_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER = DVBSx_GetPrePostBER_Demod;
            break;
#endif

#if defined(_AVL68XX_)
        case AVL_DVBTX:
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc = DVBTx_Initialize_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus = DVBTx_GetLockStatus_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR = DVBTx_GetSNR_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI = DVBTx_GetSignalQuality_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER = DVBTx_GetPrePostBER_Demod;
            break;
#endif

#if defined(_AVL68XX_)
        case AVL_ISDBT:
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc = ISDBT_Initialize_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus = ISDBT_GetLockStatus_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR = ISDBT_GetSNR_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI = ISDBT_GetSignalQuality_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER = ISDBT_GetPrePostBER_Demod;
            break;
#endif

#if defined(_AVL63XX_)
        case AVL_DTMB:
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpRxInitializeFunc = DTMB_Initialize_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetLockStatus = DTMB_GetLockStatus_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSNR = DTMB_GetSNR_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetSQI = DTMB_GetSignalQuality_Demod;
            gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER = DTMB_GetPrePostBER_Demod;
            break;
#endif
        default:
            break;
    }
 }

    return r;
}

AVL_ErrorCode EnableTCAGC_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableTCAGC = 0;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + agc1_sel_offset, 6);

    return r;
}

AVL_ErrorCode DisableTCAGC_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableTCAGC = 1;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + agc1_sel_offset, 2);

    return r;
}

AVL_ErrorCode EnableSAGC_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableSAGC = 0;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + agc2_sel_offset, 6);

    return r;
}

AVL_ErrorCode DisableSAGC_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].ucDisableSAGC = 1;

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + agc2_sel_offset, 2);

    return r;
}


AVL_ErrorCode SetTSSerialPin_Demod(AVL_TSSerialPin eTSSerialPin, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSSerialPin = eTSSerialPin;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_serial_outpin_caddr_offset, (AVL_uchar)eTSSerialPin);

    return r;
}

AVL_ErrorCode SetTSSerialOrder_Demod(AVL_TSSerialOrder eTSSerialOrder, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSSerialOrder = eTSSerialOrder;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_serial_msb_caddr_offset, (AVL_uchar)eTSSerialOrder);

    return r;
}

AVL_ErrorCode SetTSSerialSyncPulse_Demod(AVL_TSSerialSyncPulse eTSSerialSyncPulse, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSSerialSyncPulse = eTSSerialSyncPulse;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_sync_pulse_caddr_offset, (AVL_uchar)eTSSerialSyncPulse);

    return r;
}

AVL_ErrorCode SetTSErrorBit_Demod(AVL_TSErrorBit eTSErrorBit, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSErrorBit = eTSErrorBit;

    //r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
    //    gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_error_bit_en_caddr_offset, ucData);

    return r;
}

AVL_ErrorCode SetTSErrorPola_Demod(AVL_TSErrorPolarity eTSErrorPola, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

   gstChipInternalArray[uiChipNo].eTSErrorPola = eTSErrorPola;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_error_polarity_caddr_offset,(AVL_uchar)eTSErrorPola);

    return r;
}

AVL_ErrorCode SetTSValidPola_Demod(AVL_TSValidPolarity eTSValidPola, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSValidPola = eTSValidPola;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_valid_polarity_caddr_offset, (AVL_uchar)eTSValidPola);

    return r;
}

AVL_ErrorCode SetTSPacketLen_Demod(AVL_TSPacketLen eTSPacketLen, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSPacketLen = eTSPacketLen;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_packet_len_caddr_offset, (AVL_uchar)eTSPacketLen);

    return r;
}

AVL_ErrorCode SetTSParallelOrder_Demod(AVL_TSParallelOrder eTSParallelOrder, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSParallelOrder = eTSParallelOrder;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_ts_packet_order_caddr_offset, (AVL_uchar)eTSParallelOrder);

    return r;
}

AVL_ErrorCode SetTSParallelPhase_Demod(AVL_TSParallelPhase eTSParallelPhase, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    gstChipInternalArray[uiChipNo].eTSParallelPhase = eTSParallelPhase;

    r = II2C_Write8_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + ts_clock_phase_caddr_offset, (AVL_uchar)eTSParallelPhase);

    return r;
}

AVL_ErrorCode IBase_SetSleepClock_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;
    AVL_uint32 uiMaxRetries = 10;
    AVL_uint32 delay_unit_ms = 20;//the time out window is 10*20=200ms

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 1);
    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 1);

    switch(gstChipInternalArray[uiChipNo].uiFamilyID)
    {
        case AVL68XX:
            SetSleepPLL0_Demod(uiChipNo);
            break;
        default:
            break;
    }

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rs_core_ready_word_iaddr_offset, 0x00000000);

    r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                           gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_system_reset_base, 0);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                           gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 0);

    while (AVL_EC_OK != IBase_CheckChipReady_Demod(uiChipNo))
    {
        if (uiMaxRetries <= uiTemp++)
        {
            r |= AVL_EC_GENERAL_FAIL;
            break;
        }
        AVL_IBSP_Delay(delay_unit_ms);
    }

    return r;

}

AVL_PLL_Conf0 gstSleepPLLConfigArray0[] =
{
// Note: All the unit of clock frequency in the following is Hz.
//----------------------------------------------------------------------------------------------------------------------------------------------
//| REF_Hz    | C_R | C_F | C_Q | M_R | M_F | M_Q | A_R | A_F | A_Q | CORE_Hz | MPEG_Hz |  ADC_Hz | D_S | D_Q | S_S | S_Q |  DDC_Hz | SDRAM_Hz |
//----------------------------------------------------------------------------------------------------------------------------------------------
  {30000000,  1,   20,   20,   1,   20,   20,  1,   20,   30, 60000000, 60000000, 40000000,  2,   20,   2,   20,  60000000, 60000000}
};

AVL_ErrorCode SetSleepPLL0_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    AVL_PLL_Conf0 *pPLL_Conf = &gstPLLConfigArray0[gstChipInternalArray[uiChipNo].eDemodXtal];

    //sys_pll
    AVL_uint32 DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_CoreClock_DivR;
    AVL_uint32 PLLRange = 1;
    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r  = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divr, pPLL_Conf->m_PLL_CoreClock_DivR-1);//DIVR
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divf, pPLL_Conf->m_PLL_CoreClock_DivF-1);//DIVF
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq, pPLL_Conf->m_PLL_CoreClock_DivQ-1);//DIVQ1
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_range, PLLRange);//range
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);//DIVQ2
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);//DIVQ3
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_CORE));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_sys_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_CORE));

    //mpeg_pll
    DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_MPEGClock_DivR;
    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divr, pPLL_Conf->m_PLL_MPEGClock_DivR-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divf, pPLL_Conf->m_PLL_MPEGClock_DivF-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq, pPLL_Conf->m_PLL_MPEGClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_range, PLLRange);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_MPEG));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_mpeg_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_MPEG));

    //adc_pll
    DivRefHz = pPLL_Conf->m_RefFrequency_Hz / (AVL_uint32)pPLL_Conf->m_PLL_ADCClock_DivR;
    if(DivRefHz < 16000000)
        PLLRange = 1;
    else if(DivRefHz < 25000000)
        PLLRange = 2;
    else
        PLLRange = 3;
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divr, pPLL_Conf->m_PLL_ADCClock_DivR-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divf, pPLL_Conf->m_PLL_ADCClock_DivF-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq, pPLL_Conf->m_PLL_ADCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_range, PLLRange);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq2, pPLL_Conf->m_PLL_DDCClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_divq3, pPLL_Conf->m_PLL_SDRAMClock_DivQ-1);
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_enable2, (pPLL_Conf->m_PLL_DDCClock_sel == hw_E2_PLL_SEL_ADC));
    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, hw_E2_AVLEM61_adc_pll_enable3, (pPLL_Conf->m_PLL_SDRAMClock_sel == hw_E2_PLL_SEL_ADC));

    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, 0x100000, 0);
    II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr, 0x100000, 1);//no I2C ACK
    AVL_IBSP_Delay(1);

    gstChipInternalArray[uiChipNo].uiCoreFrequencyHz = pPLL_Conf->m_CoreFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiFECFrequencyHz = gstChipInternalArray[uiChipNo].uiCoreFrequencyHz;
    gstChipInternalArray[uiChipNo].uiTSFrequencyHz = pPLL_Conf->m_MPEGFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiADCFrequencyHz = pPLL_Conf->m_ADCFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiRefFrequencyHz = pPLL_Conf->m_RefFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiDDCFrequencyHz = pPLL_Conf->m_DDCFrequency_Hz;
    gstChipInternalArray[uiChipNo].uiSDRAMFrequencyHz = pPLL_Conf->m_SDRAMFrequency_Hz;

    return(r);
}

AVL_ErrorCode GetMode_Demod(AVL_DemodMode* peCurrentMode, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiTemp = 0;

    r = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rs_current_active_mode_iaddr_offset, &uiTemp);
    *peCurrentMode = (AVL_DemodMode)(uiTemp);

    return r;
}

AVL_ErrorCode GetBER_Demod(AVL_uint32 *puiBERxe9, AVL_BER_Type eBERType, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiHwCntBitErrors = 0;
    AVL_uint32 uiHwCntNumBits = 0;
    AVL_uint32 uiTemp = 0;
    AVLuint64 uiTemp64;
    AVL_uchar ucLocked;

    r = AVL_Demod_GetLockStatus(&ucLocked,uiChipNo);

    //record the lock status before return the BER
    if(1 == ucLocked)
    {
        gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 0;
    }
    else
    {
        gstChipInternalArray[uiChipNo].stAVLErrorStat.usLostLock = 1;
        return *puiBERxe9 = AVL_CONSTANT_10_TO_THE_9TH;
    }

    switch (eBERType)
    {
        case AVL_PRE_VITERBI_BER:
        case AVL_POST_VITERBI_BER:
        case AVL_PRE_LDPC_BER:
        case AVL_POST_LDPC_BER:
        {
            r = gstChipInternalArray[uiChipNo].stStdSpecFunc.fpGetPrePostBER(puiBERxe9,eBERType, uiChipNo);
            return (r);
        }
        case AVL_FINAL_BER:
        {
            //just break for following statistics
            break;
        }
        default:
        {
            // the inputted type is not supported, final ber will be presented
            r = AVL_EC_WARNING;
            break;
        }
    }


    r  = II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + bit_error_offset, &uiHwCntBitErrors);
    r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_num_offset, &uiHwCntNumBits);
    uiHwCntNumBits <<= 3;

    if(uiHwCntNumBits > (AVL_uint32)(1 << 31))
    {
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, &uiTemp);
        uiTemp |= 0x00000002;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + bit_error_offset, &uiHwCntBitErrors);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + byte_num_offset, &uiHwCntNumBits);
        uiTemp &= 0xFFFFFFFD;
        r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_esm_base + esm_cntrl_offset, uiTemp);
        uiHwCntNumBits <<= 3;
        Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumBits, uiHwCntNumBits);
        Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntBitErrors, uiHwCntBitErrors);
        uiHwCntNumBits = 0;
        uiHwCntBitErrors = 0;
    }

    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits.uiHighWord= gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumBits.uiHighWord;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits.uiLowWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntNumBits.uiLowWord;
    Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits, uiHwCntNumBits);
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors.uiHighWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntBitErrors.uiHighWord;
    gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors.uiLowWord = gstChipInternalArray[uiChipNo].stAVLErrorStat.stSwCntBitErrors.uiLowWord;
    Add32To64_Demod(&gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors, uiHwCntBitErrors);

    Multiply32_Demod(&uiTemp64, gstChipInternalArray[uiChipNo].stAVLErrorStat.stBitErrors.uiLowWord, AVL_CONSTANT_10_TO_THE_9TH);
    gstChipInternalArray[uiChipNo].stAVLErrorStat.uiBER = Divide64_Demod(gstChipInternalArray[uiChipNo].stAVLErrorStat.stNumBits, uiTemp64);

    //keep the BER user wanted
    *puiBERxe9 = gstChipInternalArray[uiChipNo].stAVLErrorStat.uiBER;

    return r;
}

AVL_ErrorCode II2C_Read_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiOffset, AVL_puchar pucBuff, AVL_uint32 uiSize)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pucBuffTemp[3] = {0};
    AVL_uint16 us1 = 0;
    AVL_uint32 ui2 = 0;
    AVL_int16  usSize = 0;

    r = AVL_IBSP_WaitSemaphore(&(gsemI2C));
    if (AVL_EC_OK == r)
    {
        ChunkAddr_Demod(uiOffset, pucBuffTemp);
        us1 = 3;
        r = AVL_IBSP_I2C_Write(uiSlaveBus, uiSlaveAddr, pucBuffTemp, &us1);
        if (AVL_EC_OK == r)
        {
            usSize = uiSize;
            while( usSize > MAX_II2C_READ_SIZE )
            {
                us1 = MAX_II2C_READ_SIZE;
                r |= AVL_IBSP_I2C_Read(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &us1);
                ui2 += MAX_II2C_READ_SIZE;
                usSize -= MAX_II2C_READ_SIZE;
            }

            if (0 != usSize)
            {
                r |= AVL_IBSP_I2C_Read(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &usSize);
            }
        }
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gsemI2C));

    return(r);
}

AVL_ErrorCode II2C_Read8_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puchar puiData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar Data = 0;

    r = II2C_Read_Demod(uiSlaveBus, uiSlaveAddr, uiAddr, &Data, 1);
    if( AVL_EC_OK == r )
    {
        *puiData = Data;
    }

    return(r);
}

AVL_ErrorCode II2C_Read16_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puint16 puiData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pBuff[2] = {0};

    r = II2C_Read_Demod(uiSlaveBus, uiSlaveAddr, uiAddr, pBuff, 2);
    if( AVL_EC_OK == r )
    {
        *puiData = DeChunk16_Demod(pBuff);
    }

    return(r);
}

AVL_ErrorCode II2C_Read32_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_puint32 puiData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pBuff[4] = {0};

    r = II2C_Read_Demod(uiSlaveBus, uiSlaveAddr, uiAddr, pBuff, 4);
    if( AVL_EC_OK == r )
    {
        *puiData = DeChunk32_Demod(pBuff);
    }

    return(r);
}

AVL_ErrorCode II2C_ReadDirect_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint16 uiSize)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 ui1 = 0;
    AVL_uint32 ui2 = 0;
    AVL_int16  iSize = 0;

    r = AVL_IBSP_WaitSemaphore(&(gsemI2C));
    if( AVL_EC_OK == r )
    {
        iSize = uiSize;
        while( iSize > MAX_II2C_READ_SIZE )
        {
            ui1 = MAX_II2C_READ_SIZE;
            r |= AVL_IBSP_I2C_Read(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &ui1);
            ui2 += MAX_II2C_READ_SIZE;
            iSize -= MAX_II2C_READ_SIZE;
        }

        if( 0 != iSize )
        {
            r |= AVL_IBSP_I2C_Read(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &iSize);
        }
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gsemI2C));

    return(r);
}

AVL_ErrorCode II2C_WriteDirect_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint16 uiSize)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint16 ui1 = 0;
    AVL_uint32 ui2 = 0;
    AVL_uint32 uTemp = 0;
    AVL_uint32 iSize = 0;

    r = AVL_IBSP_WaitSemaphore(&(gsemI2C));
    if( AVL_EC_OK == r )
    {
        iSize = uiSize;
        uTemp = (MAX_II2C_WRITE_SIZE-3) & 0xfffe;
        while( iSize > uTemp )
        {
            ui1 = uTemp;
            r |= AVL_IBSP_I2C_Write(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &ui1);
            ui2 += uTemp;
            iSize -= uTemp;
        }
        ui1 = iSize;
        r |= AVL_IBSP_I2C_Write(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &ui1);
        ui2 += iSize;
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gsemI2C));

    return(r);
}

AVL_ErrorCode II2C_Write_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_uint32 uiSize)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pucBuffTemp[5] = {0};
    AVL_uint16 ui1 = 0;
    AVL_uint32 ui2 = 0;
    AVL_int16  uTemp = 0;
    AVL_int32  iSize = 0;
    AVL_uint32 uAddr = 0;

    if( uiSize<3 )
    {
        return(AVL_EC_GENERAL_FAIL);     //at least 3 bytes
    }

    uiSize -= 3;            //actual data size
    r = AVL_IBSP_WaitSemaphore(&(gsemI2C));
    if( AVL_EC_OK == r )
    {
        //dump address
        uAddr  = pucBuff[0];
        uAddr  = uAddr<<8;
        uAddr += pucBuff[1];
        uAddr  = uAddr<<8;
        uAddr += pucBuff[2];

        iSize = uiSize;

        uTemp = (MAX_II2C_WRITE_SIZE-3); //how many bytes data we can transfer every time

        ui2 = 0;
        while( iSize > uTemp )
        {
            ui1 = uTemp+3;
            //save the data
            pucBuffTemp[0] = pucBuff[ui2];
            pucBuffTemp[1] = pucBuff[ui2+1];
            pucBuffTemp[2] = pucBuff[ui2+2];
            ChunkAddr_Demod(uAddr, pucBuff+ui2);
            r |= AVL_IBSP_I2C_Write(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &ui1);
            //restore data
            pucBuff[ui2]   = pucBuffTemp[0];
            pucBuff[ui2+1] = pucBuffTemp[1];
            pucBuff[ui2+2] = pucBuffTemp[2];
            uAddr += uTemp;
            ui2   += uTemp;
            iSize -= uTemp;
        }
        ui1 = iSize+3;
        //save the data
        pucBuffTemp[0] = pucBuff[ui2];
        pucBuffTemp[1] = pucBuff[ui2+1];
        pucBuffTemp[2] = pucBuff[ui2+2];
        ChunkAddr_Demod(uAddr, pucBuff+ui2);
        r |= AVL_IBSP_I2C_Write(uiSlaveBus, uiSlaveAddr, pucBuff+ui2, &ui1);
        //restore data
        pucBuff[ui2]   = pucBuffTemp[0];
        pucBuff[ui2+1] = pucBuffTemp[1];
        pucBuff[ui2+2] = pucBuffTemp[2];
        uAddr += iSize;
        ui2   += iSize;
    }
    r |= AVL_IBSP_ReleaseSemaphore(&(gsemI2C));

    return(r);
}

AVL_ErrorCode II2C_Write8_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uchar ucData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pBuff[4] = {0};

    ChunkAddr_Demod(uiAddr, pBuff);
    pBuff[3] = ucData;

    r = II2C_Write_Demod(uiSlaveBus, uiSlaveAddr, pBuff, 4);

    return(r);
}

AVL_ErrorCode II2C_Write16_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uint16 uiData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pBuff[5] = {0};

    ChunkAddr_Demod(uiAddr, pBuff);
    Chunk16_Demod(uiData, pBuff+3);

    r = II2C_Write_Demod(uiSlaveBus, uiSlaveAddr, pBuff, 5);

    return(r);
}

AVL_ErrorCode II2C_Write32_Demod( AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_uint32 uiAddr, AVL_uint32 uiData )
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uchar pBuff[7] = {0};

    ChunkAddr_Demod(uiAddr, pBuff);
    Chunk32_Demod(uiData, pBuff+3);

    r = II2C_Write_Demod(uiSlaveBus, uiSlaveAddr, pBuff, 7);

    return(r);
}

void ChunkAddr_Demod(AVL_uint32 uiaddr, AVL_puchar pBuff)
{
    pBuff[0] =(AVL_uchar)(uiaddr>>16);
    pBuff[1] =(AVL_uchar)(uiaddr>>8);
    pBuff[2] =(AVL_uchar)(uiaddr);

    return;
}

void Chunk16_Demod(AVL_uint16 uidata, AVL_puchar pBuff)
{
    pBuff[0] = (AVL_uchar)(uidata>>8);
    pBuff[1] = (AVL_uchar)(uidata & 0xff);
    return;
}

AVL_uint16 DeChunk16_Demod(const AVL_puchar pBuff)
{
    AVL_uint16 uiData = 0;
    uiData = pBuff[0];
    uiData = (AVL_uint16)(uiData << 8) + pBuff[1];

    return uiData;
}

void Chunk32_Demod(AVL_uint32 uidata, AVL_puchar pBuff)
{
    pBuff[0] = (AVL_uchar)(uidata>>24);
    pBuff[1] = (AVL_uchar)(uidata>>16);
    pBuff[2] = (AVL_uchar)(uidata>>8);
    pBuff[3] = (AVL_uchar)(uidata);

    return;
}

AVL_uint32 DeChunk32_Demod(const AVL_puchar pBuff)
{
    AVL_uint32 uiData = 0;
    uiData = pBuff[0];
    uiData = (uiData << 8) + pBuff[1];
    uiData = (uiData << 8) + pBuff[2];
    uiData = (uiData << 8) + pBuff[3];

    return uiData;
}

void Multiply32_Demod(AVLuint64 *pDst, AVL_uint32 m1, AVL_uint32 m2)
{
    pDst->uiLowWord = (m1 & 0xFFFF) * (m2 & 0xFFFF);
    pDst->uiHighWord = 0;

    AddScaled32To64_Demod(pDst, (m1 >> 16) * (m2 & 0xFFFF));
    AddScaled32To64_Demod(pDst, (m2 >> 16) * (m1 & 0xFFFF));

    pDst->uiHighWord += (m1 >> 16) * (m2 >> 16);
}

void AddScaled32To64_Demod(AVLuint64 *pDst, AVL_uint32 a)
{
    AVL_uint32 saved = 0;

    saved = pDst->uiLowWord;
    pDst->uiLowWord += (a << 16);

    pDst->uiLowWord &= 0xFFFFFFFF;
    pDst->uiHighWord += ((pDst->uiLowWord < saved) ? 1 : 0) + (a >> 16);
}



void Add32To64_Demod(AVLuint64 *pSum, AVL_uint32 uiAddend)
{
    AVL_uint32 uiTemp = 0;

    uiTemp = pSum->uiLowWord;
    pSum->uiLowWord += uiAddend;
    pSum->uiLowWord &= 0xFFFFFFFF;

    if (pSum->uiLowWord < uiTemp)
    {
        pSum->uiHighWord++;
    }
}

AVL_uint32 Divide64_Demod(AVLuint64 divisor, AVLuint64 dividend)
{
    AVL_uint32 uFlag = 0x0;
    AVL_uint32 uQuto = 0x0;
    AVL_uint32 i = 0;
    AVL_uint32 dividend_H = dividend.uiHighWord;
    AVL_uint32 dividend_L = dividend.uiLowWord;
    AVL_uint32 divisor_H = divisor.uiHighWord;
    AVL_uint32 divisor_L = divisor.uiLowWord;

    if(((divisor_H == 0x0) && (divisor_L == 0x0)) || (dividend_H/divisor_L))
    {
        return 0;
    }
    else if((divisor_H == 0x0)&&(dividend_H == 0x0))
    {
        return  dividend_L / divisor_L;
    }
    else
    {
        if(divisor_H != 0)
        {
            while(divisor_H)
            {
                dividend_L /= 2;
                if(dividend_H % 2)
                {
                    dividend_L += 0x80000000;
                }
                dividend_H /= 2;

                divisor_L /= 2;
                if(divisor_H %2)
                {
                    divisor_L += 0x80000000;
                }
                divisor_H /= 2;
            }
        }
        for   (i = 0; i <= 31; i++)
        {

            uFlag = (AVL_int32)dividend_H >> 31;

            dividend_H = (dividend_H << 1)|(dividend_L >> 31);
            dividend_L <<= 1;

            uQuto <<= 1;
            if((dividend_H|uFlag) >= divisor_L)
            {
                dividend_H -= divisor_L;
                uQuto++;
            }
        }
        return uQuto;
    }
}

AVL_uint32 GreaterThanOrEqual64_Demod(AVLuint64 a, AVLuint64 b)
{
    AVL_uint32 result =0;

    if((a.uiHighWord == b.uiHighWord) && (a.uiLowWord == b.uiLowWord))
    {
        result = 1;
    }
    if(a.uiHighWord > b.uiHighWord)
    {
        result = 1;
    }
    else if(a.uiHighWord == b.uiHighWord)
    {
        if(a.uiLowWord > b.uiLowWord)
        {
            result = 1;
        }
    }

    return result;
}

void Subtract64_Demod(AVLuint64 *pA, AVLuint64 b)
{
    AVLuint64 a = {0,0};
    AVLuint64 temp = {0,0};

    a.uiHighWord = pA->uiHighWord;
    a.uiLowWord = pA->uiLowWord;

    temp.uiHighWord = a.uiHighWord - b.uiHighWord;
    if(a.uiLowWord >= b.uiLowWord)
    {
        temp.uiLowWord = a.uiLowWord - b.uiLowWord;
    }
    else
    {
        temp.uiLowWord = b.uiLowWord - a.uiLowWord;
        temp.uiHighWord >>= 1;
    }

    pA->uiHighWord = temp.uiHighWord;
    pA->uiLowWord = temp.uiLowWord;
}

AVL_ErrorCode TestSDRAM_Demod(AVL_puint32 puiTestResult, AVL_puint32 puiTestPattern, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    //AVL_uint16 uiTimeDelay = 100;
    //AVL_uint16 uiMaxRetries = 200;
    //AVL_uint32 i=0;

    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_HALT, uiChipNo);

    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_SDRAM_TEST, uiChipNo);
    if(AVL_EC_OK == r )
    {

        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rc_sdram_test_return_iaddr_offset, puiTestPattern);
        r |= II2C_Read32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
            gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_status_reg_base + rc_sdram_test_result_iaddr_offset, puiTestResult);
    }

    return r;
}

AVL_ErrorCode GetValidModeList_Demod(AVL_puchar pucValidModeList, AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 uiMemberIDRegAddr = 0x0;
    AVL_uint32 uiMemberID = 0x0;
    AVL_uint16 usAddrSize = 3;
    AVL_uint16 usDataSize = 4;
    AVL_uchar pucBuffAddr[3] = {0};
    AVL_uchar pucBuffData[4]= {0};

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

    uiMemberID = DeChunk32_Demod(pucBuffData);

    switch(gstChipInternalArray[uiChipNo].uiFamilyID)
    {
        case AVL68XX:
            GetValidModeList0_Demod(pucValidModeList, uiMemberID);
            break;
        default:
            r = AVL_EC_GENERAL_FAIL;
            break;
    }

    return r;
}

void GetValidModeList0_Demod(AVL_puchar pucValidModeList, AVL_uint32 uiMemberID)
{
    if(uiMemberID == 0xB)
    {
        *pucValidModeList++ = 1;//DVBC valid
        *(pucValidModeList++) = 1;//DVBSx valid
        *(pucValidModeList++) = 1;//DVBTx valid
        *(pucValidModeList++) = 1;//ISDBT valid
    }
    else if(uiMemberID == 0xF)
    {
        *pucValidModeList++ = 1;//DVBC valid
        *(pucValidModeList++) = 1;//DVBSx valid
        *(pucValidModeList++) = 1;//DVBTx valid
        *(pucValidModeList++) = 0;//ISDBT invalid
    }
    else if(uiMemberID == 0xE)
    {
        *pucValidModeList++ = 1;//DVBC valid
        *(pucValidModeList++) = 0;//DVBSx invalid
        *(pucValidModeList++) = 1;//DVBTx valid
        *(pucValidModeList++) = 0;//ISDBT invalid
    }
    else if(uiMemberID == 0xD)
    {
        *pucValidModeList++ = 0;//DVBC invalid
        *(pucValidModeList++) = 1;//DVBSx valid
        *(pucValidModeList++) = 0;//DVBTx invalid
        *(pucValidModeList++) = 1;//ISDBT valid
    }
}

AVL_ErrorCode GetFamilyID_Demod(AVL_puint32 puiFamilyID,AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_uint32 ChipIDRegAddr = 0x40000;
    AVL_uint16 usAddrSize = 3;
    AVL_uint16 usDataSize = 4;
    AVL_uchar pucBuffAddr[3] = {0};
    AVL_uchar pucBuffData[4] = {0};

    ChunkAddr_Demod(ChipIDRegAddr, pucBuffAddr);

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

    *puiFamilyID = DeChunk32_Demod(pucBuffData);

    return r;
}

AVL_ErrorCode SetGPIOStatus_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    //if(gstChipInternalArray[uiChipNo].ucPin37Status == 1)  // 1 - output
    //{
       if(gstChipInternalArray[uiChipNo].ucPin37Voltage == 0)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
               gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_LOGIC_0);
       }
       if(gstChipInternalArray[uiChipNo].ucPin37Voltage == 1)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
              gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_LOGIC_1);
       }
       if(gstChipInternalArray[uiChipNo].ucPin37Voltage == 2)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
              gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_HIGH_Z);
       }
    //}
    //if(gstChipInternalArray[uiChipNo].ucPin38Status == 1) // 1 - output
    //{
       if(gstChipInternalArray[uiChipNo].ucPin38Voltage == 0)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
              gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_LOGIC_0);
       }
       if(gstChipInternalArray[uiChipNo].ucPin38Voltage == 1)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
               gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_LOGIC_1);
       }
       if(gstChipInternalArray[uiChipNo].ucPin38Voltage == 2)
       {
           r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
              gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_HIGH_Z);
       }
   // }
    return r;
}

AVL_ErrorCode Initilize_GPIOStatus_Demod(AVL_uint32 uiChipNo)
{
    AVL_ErrorCode r = AVL_EC_OK;

    if( uiChipNo != 0 && uiChipNo != 1)
    {
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

     r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_0_sel_offset, AVL_LOGIC_0);
     gstChipInternalArray[uiChipNo].ucPin37Voltage = 0;
     gstChipInternalArray[uiChipNo].ucPin37Status = 1;

     r = II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                        gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_gpio_debug_base + lnb_cntrl_1_sel_offset, AVL_LOGIC_0);
     gstChipInternalArray[uiChipNo].ucPin38Voltage = 0;
     gstChipInternalArray[uiChipNo].ucPin38Status = 1;

    return r;
}

AVL_uchar AVL_patch_read8(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx)
{
    AVL_uchar tmp = 0;
    tmp = pPatchBuf[*idx];
    if(update_idx)
        *idx += 1;
    return tmp;
}
AVL_uint16 AVL_patch_read16(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx)
{
    AVL_uint16 tmp = 0;
    tmp = (pPatchBuf[*idx+0]<<8) | (pPatchBuf[*idx+1]);
    if(update_idx)
        *idx += 2;
    return tmp;
}
AVL_uint32 AVL_patch_read32(AVL_puchar pPatchBuf, AVL_uint32 *idx, AVL_uchar update_idx)
{
    AVL_uint32 tmp = 0;
    #define SWIZZLE
    #ifdef SWIZZLE
        tmp = (pPatchBuf[*idx+0]<<24) | (pPatchBuf[*idx+1]<<16) | (pPatchBuf[*idx+2]<<8) | pPatchBuf[*idx+3];
    #else
        tmp = (pPatchBuf[*idx+3]<<24) | (pPatchBuf[*idx+2]<<16) | (pPatchBuf[*idx+1]<<8) | pPatchBuf[*idx+0];
    #endif
    if(update_idx)
        *idx += 4;
    return tmp;
}


//	#define PARSER_DEBUG
AVL_ErrorCode AVL_ParseFwPatch_v0(AVL_uint32 uiChipNo, AVL_uchar download_only)
{
    #ifdef PARSER_DEBUG
    	int cmd_count = 0;//FIXME remove when not debugging
    #endif
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_puchar pPatchData = 0;
    AVL_puchar pInitialData = 0;
    AVL_uint32 patch_idx = 0;
    //AVL_uint32 total_patch_len = 0;
    //AVL_uint32 standard = 0;
    AVL_uint32 args_addr = 0;
    AVL_uint32 data_section_offset = 0;
    AVL_uint32 reserved_len = 0;
    AVL_uint32 script_len = 0;
    AVL_uchar  unary_op = 0;
    AVL_uchar  binary_op = 0;
    AVL_uchar  addr_mode_op = 0;
    AVL_uint32 script_start_idx = 0;
    AVL_uint32 num_cmd_words = 0;
    AVL_uint32 next_cmd_idx = 0;
    AVL_uint32 num_cond_words = 0;
    AVL_uint32 condition = 0;
    AVL_uint32 operation =0;
    AVL_uint32 value = 0;
    AVL_uint32 tmp_top_valid = 0;
    AVL_uint32 core_rdy_word = 0;
    AVL_uint32 cmd = 0;
    AVL_uint32 num_rvs = 0;
    AVL_uint32 rv0_idx = 0;
    AVL_uint32 exp_crc_val = 0;
    AVL_uint32 start_addr = 0;
    AVL_uint32 crc_result = 0;
    AVL_uint32 length = 0;
    AVL_uint32 dest_addr = 0;
    AVL_uint32 src_data_offset = 0;
    AVL_uint32 data = 0;
    AVL_uint16 data1 = 0;
    AVL_uchar  data2 = 0;
    AVL_uint32 src_addr = 0;
    AVL_uint32 descr_addr = 0;
    AVL_uint32 num_descr = 0;
    AVL_uint32 type = 0;
    AVL_uint32 ref_addr = 0;
    AVL_uint32 ref_size = 0;
    AVL_uint32 ready = 0;
    AVL_uint32 dma_max_tries = 0;
    AVL_uint32 dma_tries = 0;
    AVL_uint32 rv = 0;
    AVL_char   temp[3];
    AVL_char   tem[3];
    AVL_puchar pPatchDatatemp = 0 ;
    AVL_puchar pPatchDatatemp1 = 0;
    AVL_puchar pPatchDatatem = 0;
    AVL_puchar pPatchDatatem1 = 0;
    AVL_uint32 cond=0;
    AVL_uint32 d=0;
    AVL_uint32 e = 0;
    if(gstChipInternalArray[uiChipNo].ucCustomizeFwData == 0)
    {
        switch(gstChipInternalArray[uiChipNo].uiFamilyID)
        {
            case AVL68XX:
                switch(gstChipInternalArray[uiChipNo].eCurrentDemodMode)
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
                r = AVL_EC_GENERAL_FAIL;
                return r;
        }

    }
    else
    {
        switch(gstChipInternalArray[uiChipNo].uiFamilyID)
        {
            case AVL68XX:
                switch(gstChipInternalArray[uiChipNo].eCurrentDemodMode)
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
                r = AVL_EC_GENERAL_FAIL;
                return r;
        }
    }
//	HI_INFO_TUNER("Avl68xx:fw{%d}{%02x%02x%02x%02x:{%02x%02x%02x%02x}\n", gstChipInternalArray[uiChipNo].eCurrentDemodMode,
//					pInitialData[0],pInitialData[1],pInitialData[2],pInitialData[3],
//					pInitialData[4],pInitialData[5],pInitialData[6],pInitialData[7]);
    pPatchData = pInitialData;
    //patch_idx = 4; //INDEX IS A BYTE OFFSET
    //total_patch_len = AVL_patch_read32(pPatchData, &patch_idx,1);
    //standard = AVL_patch_read32(pPatchData, &patch_idx,1);
    patch_idx = 12;
    args_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
    data_section_offset = AVL_patch_read32(pPatchData, &patch_idx,1);
    reserved_len = AVL_patch_read32(pPatchData, &patch_idx,1);
    patch_idx += 4*reserved_len; //skip over reserved area for now
    script_len = AVL_patch_read32(pPatchData, &patch_idx,1);


    if((patch_idx/4 + script_len) != data_section_offset)
    {
// sky()
//      while(1);
        r = AVL_EC_GENERAL_FAIL;
        return r;
    }

    script_start_idx = patch_idx/4;

    while(patch_idx/4 <(script_start_idx+script_len))
    {
        num_cmd_words = AVL_patch_read32(pPatchData, &patch_idx,1);
        next_cmd_idx = patch_idx + (num_cmd_words-1)*4; //BYTE OFFSET
        num_cond_words = AVL_patch_read32(pPatchData, &patch_idx,1);

        if(num_cond_words == 0)
        {
            condition = 1;
        }
        else
        {
            for( cond=0; cond<num_cond_words; cond++)
            {   //printf("condition = %d.\n",condition);
                operation = AVL_patch_read32(pPatchData, &patch_idx,1);
                value = AVL_patch_read32(pPatchData, &patch_idx,1);
                unary_op = (operation>>8) & 0xFF;
                binary_op = operation & 0xFF;
                addr_mode_op = ((operation>>16)&0x3);

                if( (addr_mode_op == PATCH_OP_ADDR_MODE_VAR_IDX) && (binary_op != PATCH_OP_BINARY_STORE))
                {

                    value = gstChipInternalArray[uiChipNo].variable_array[value]; //grab variable value
                    // printf("value = %d.\n",value);

				}

                switch(unary_op)
                {
                    case PATCH_OP_UNARY_LOGICAL_NEGATE:
                        value = !value;
                        break;
                    case PATCH_OP_UNARY_BITWISE_NEGATE:
                        value = ~value;
                        break;
                    case PATCH_OP_UNARY_BITWISE_AND:
                        //value = why can't C be more like Verilog?! FIXME
                        break;
                    case PATCH_OP_UNARY_BITWISE_OR:
                        //value = FIXME
                        break;
                }
                switch(binary_op)
                {
                    case PATCH_OP_BINARY_LOAD:
                        condition = value;
                        break;
                    case PATCH_OP_BINARY_STORE:
                        gstChipInternalArray[uiChipNo].variable_array[value] = condition;
                        break;
                    case PATCH_OP_BINARY_AND:
                        condition = condition && value;
                        break;

                    case PATCH_OP_BINARY_OR:
                        condition = condition || value;
                        break;
                    case PATCH_OP_BINARY_BITWISE_AND:
                        condition = condition & value;
                        break;
                    case PATCH_OP_BINARY_BITWISE_OR:
                        condition = condition | value;
                        break;
                    case PATCH_OP_BINARY_EQUALS:
                        condition = condition == value;
                        break;
                    case PATCH_OP_BINARY_NOT_EQUALS:
                        condition = condition != value;
                        break;
                    default:
                        //TODO error!
                        ;;
                }
            } //for conditions
        }

       II2C_Read32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),(AVL_uint32)0x29A648,&tmp_top_valid);
       II2C_Read32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),(AVL_uint32)0x0A0,&core_rdy_word);
      //System::Console::WriteLine("cmd: {0} value: {1} core_ready_word: {2}",cmd_count++, tmp_top_valid,core_rdy_word);

    #ifdef PARSER_DEBUG
        char *cmd_str;
        int cmd_tmp = AVL_patch_read32(pPatchData, &patch_idx,0);
        switch(cmd_tmp){

            case PATCH_CMD_VALIDATE_CRC:
                cmd_str = "VALIDATE_CRC";
                break;
            case PATCH_CMD_PING:
                cmd_str = "PING";
                break;
            case PATCH_CMD_LD_TO_DEVICE:
                cmd_str = "LD_TO_DEVICE";
                break;
            case PATCH_CMD_DMA:
                cmd_str = "DMA";
                break;
            case PATCH_CMD_DECOMPRESS:
                cmd_str = "DECOMPRESS";
                break;
            case PATCH_CMD_ASSERT_CPU_RESET:
                cmd_str = "ASSERT_CPU_RESET";
                break;
            case PATCH_CMD_RELEASE_CPU_RESET:
                cmd_str = "RELEASE_CPU_RESET";
                break;
            case PATCH_CMD_LD_TO_DEVICE_IMM:
                cmd_str = "LD_TO_DEVICE_IMM";
                break;
            case PATCH_CMD_RD_FROM_DEVICE:
                cmd_str = "RD_FROM_DEVICE";
                break;
            case PATCH_CMD_DMA_HW:
                cmd_str = "DMA_HW";
                break;
            case PATCH_CMD_SET_COND_IMM:
                cmd_str = "SET_COND_IMM";
                break;
            case PATCH_CMD_EXIT:
                cmd_str = "CMD_EXIT";
                break;
            default:
                cmd_str="unknown";
                break;

        }
       	HI_INFO_TUNER("num_cmd: {%2d} condition: {%d} cmd: {%16s} r: {%d}\n",cmd_count++ ,condition,cmd_str, r);
    #endif
        if(condition)
        {
            cmd = AVL_patch_read32(pPatchData, &patch_idx,1);
            switch(cmd)
            {
                case PATCH_CMD_PING:
                {
                    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_PING, uiChipNo);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    rv0_idx = AVL_patch_read32(pPatchData, &patch_idx,1);
                    gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = (r == AVL_EC_OK);
                    patch_idx += 4*(num_rvs - 1); //skip over any extraneous RV's
                    break;
                }
                case PATCH_CMD_VALIDATE_CRC:
                {
                    exp_crc_val = AVL_patch_read32(pPatchData, &patch_idx,1);
                    start_addr  = AVL_patch_read32(pPatchData, &patch_idx,1);
                    length = AVL_patch_read32(pPatchData, &patch_idx,1);

                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_fw_command_args_addr_iaddr_offset,
                                      args_addr);
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      args_addr+0, start_addr);
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      args_addr+4, length);
                    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_CALC_CRC, uiChipNo);

                    II2C_Read32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                        args_addr+8,&crc_result);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    rv0_idx = AVL_patch_read32(pPatchData, &patch_idx,1);
                    gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = (crc_result == exp_crc_val);
                    patch_idx += 4*(num_rvs - 1); //skip over any extraneous RV's
                    break;
                }

                case PATCH_CMD_LD_TO_DEVICE://4
                {
                    length = AVL_patch_read32(pPatchData, &patch_idx,1); //in words  41
                    dest_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    src_data_offset = AVL_patch_read32(pPatchData, &patch_idx,1);
                    src_data_offset += data_section_offset; //add in base offset
                    src_data_offset *= 4; //convert to byte offset
                    #define BURST
                    #ifdef 	BURST
                        length *= 4; //Convert to byte length

                        pPatchDatatemp  = pPatchData + src_data_offset;
                        pPatchDatatemp1 = pPatchDatatemp - 3;
                        temp[0] = *(pPatchDatatemp -1);
                        temp[1] = *(pPatchDatatemp -2);
                        temp[2] = *(pPatchDatatemp -3);
                        ChunkAddr_Demod(dest_addr, pPatchDatatemp1);

                        r |= II2C_Write_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr), pPatchDatatemp1, (AVL_uint32)(length+3));

                        * pPatchDatatemp1 = temp[2];
                        *(pPatchDatatemp1+1) = temp[1];
                        *(pPatchDatatemp1+2) = temp[0];

                    #else
                    for(AVL_uint32 i=0; i<length; i++) {
                        //FIXME: make this a burst write
                        AVL_uint32 tdata = AVL_patch_read32(pPatchData, &src_data_offset);
                        r |= II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                               dest_addr+i*4,tdata);
                    }
                    #endif

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;
                }

                case PATCH_CMD_LD_TO_DEVICE_IMM: // 7
                {
                    length = AVL_patch_read32(pPatchData, &patch_idx,1); //in bytes
                    dest_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    data = AVL_patch_read32(pPatchData, &patch_idx,1);

                    if(length == 4)
                    {
                        r = II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              dest_addr,data);
                    }
                    else if(length == 2)
                    {
                        r = II2C_Write16_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              dest_addr,data);
                    }
                    else if(length == 1)
                    {
                        r = II2C_Write8_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              dest_addr,data);
                    }

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;
                }
                case PATCH_CMD_RD_FROM_DEVICE://8 8
                {
                    length   = AVL_patch_read32(pPatchData, &patch_idx,1); //in bytes
                    src_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    num_rvs  = AVL_patch_read32(pPatchData, &patch_idx,1);
                    rv0_idx  = AVL_patch_read32(pPatchData, &patch_idx,1);

                    if(length == 4)
                    {
                        r = II2C_Read32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              src_addr,&data);
                        gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = data;
                    }
                    else if(length == 2)
                    {
                        r = II2C_Read16_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              src_addr,&data1);
                        gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = data1;
                    }
                    else if(length == 1)
                    {

                        r = II2C_Read8_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              src_addr,&data2);
                        gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = data2;
                    }

                    patch_idx += 4*(num_rvs - 1); //skip over any extraneous RV's
                    break;
                }
                case PATCH_CMD_DMA://3
                {
                    descr_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    num_descr  = AVL_patch_read32(pPatchData, &patch_idx,1);
                    #define DMA_BURST
                    #ifdef 	DMA_BURST
                        //AVL_puchar dma_temp = new AVL_uchar[3+num_descr*3*4];
                        //ChunkAddr_Demod(descr_addr, dma_temp);
                        pPatchDatatem = pPatchData + patch_idx;
                        pPatchDatatem1 = pPatchDatatem - 3;
                        tem[0] = *(pPatchDatatem -1);
                        tem[1] = *(pPatchDatatem -2);
                        tem[2] = *(pPatchDatatem -3);
                        ChunkAddr_Demod(descr_addr, pPatchDatatem1);

                    #endif
                    for(d=0; d<num_descr; d++)
                    {
                        for(e=0; e<3; e++)
                        { //LENGTH, SRC_ADDR, DEST_ADDR

                            #ifdef DMA_BURST
                             //  AVL_uint32 data = AVL_patch_read32(pPatchData, &patch_idx,1);
                             //  Chunk32_Demod(data,(3 + dma_temp + 4*((3*d)+e)));
                                e = 3;
                                d = num_descr;
                            #else
                                AVL_uint32 data = AVL_patch_read32(pPatchData, &patch_idx,1);
                                II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                              descr_addr+d*12+e*4, data);
                            #endif
                        }
                    }
                    #ifdef DMA_BURST
                        r |= II2C_Write_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr), pPatchDatatem1, (AVL_uint32)(num_descr*3*4));
                        * pPatchDatatem1 = tem[2];
                        *(pPatchDatatem1+1) = tem[1];
                        *(pPatchDatatem1+2) = tem[0];
                        patch_idx += 12*num_descr;
                    #endif

                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_fw_command_args_addr_iaddr_offset,
                                      descr_addr);
                    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_DMA, uiChipNo);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;

                }
                case PATCH_CMD_DECOMPRESS://4
                {
                //	AVL_uint32 num_rvs;
                    type = AVL_patch_read32(pPatchData, &patch_idx,1);
                    src_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    dest_addr = AVL_patch_read32(pPatchData, &patch_idx,1);

                    if(type == PATCH_CMP_TYPE_ZLIB)
                    {
                        ref_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                        ref_size = AVL_patch_read32(pPatchData, &patch_idx,1);
                    }

                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      gstChipInternalArray[uiChipNo].stBaseAddrSet.fw_config_reg_base + rc_fw_command_args_addr_iaddr_offset,
                                      args_addr);
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      args_addr+0, type);
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      args_addr+4, src_addr);
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                      args_addr+8, dest_addr);
                    if(type == PATCH_CMP_TYPE_ZLIB) {
                        II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                          args_addr+12, ref_addr);
                        II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                                          args_addr+16, ref_size);
                    }

                    r = IBase_SendRxOPWait_Demod(AVL_FW_CMD_DECOMPRESS, uiChipNo);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet

                    break;
                }
                case PATCH_CMD_ASSERT_CPU_RESET://5
                {
                    r |= II2C_Write32_Demod(gstChipInternalArray[uiChipNo].usI2CBus, gstChipInternalArray[uiChipNo].usI2CAddr,
                   	gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 1);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;
                }
                case PATCH_CMD_RELEASE_CPU_RESET://6
                {
                    //FIXME: are both of these resets necessary? Does one reset the sys DMA??
                    II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr), gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_mcu_reset_base, 0);

                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;
                }
                case PATCH_CMD_DMA_HW://9
                {

                    //hw_AVL_dma_sys_status          hw_AVL_dma_sys_cmd
                    descr_addr = AVL_patch_read32(pPatchData, &patch_idx,1);
                    num_descr  = AVL_patch_read32(pPatchData, &patch_idx,1); //10

                    temp[0] = *(pPatchData + patch_idx -1);
                    temp[1] = *(pPatchData + patch_idx -2);
                    temp[2] = *(pPatchData + patch_idx -3);
                    ChunkAddr_Demod(descr_addr, pPatchData + patch_idx -3);
                    if(num_descr >0)
                    {
                        r |= II2C_Write_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr), pPatchData + patch_idx - 3, (AVL_uint16)(num_descr*12+3));//not putting in >2^16 size yet, come on, thats alot of dma's...
                    }

                 	*(pPatchData + patch_idx -1) = temp[0];
                 	*(pPatchData + patch_idx -2) = temp[1];
                 	*(pPatchData + patch_idx -3) = temp[2];

                    patch_idx += num_descr * 3 * 4;
                    dma_tries  = 0;
                    dma_max_tries = 20;
                    do{
                        if(dma_tries > dma_max_tries)
                        {
                           	return AVL_EC_GENERAL_FAIL; //FIXME return a value to check instead, and load the bootstrap
                            break;
                        }
                        r |= II2C_Read32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                            		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_dma_sys_status_base,
                            		&ready);
                        dma_tries++;
                    } while(!(0x01 & ready));

                    if(ready)
                    {
                        r |= II2C_Write32_Demod((AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CBus), (AVL_uint16)(gstChipInternalArray[uiChipNo].usI2CAddr),
                            		gstChipInternalArray[uiChipNo].stBaseAddrSet.hw_dma_sys_cmd_base,
                            		descr_addr); //Trigger DMA
                    }
                    //Add return value later
                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    patch_idx += 4*(num_rvs); //no RV's defined yet
                    break;
                }

                case PATCH_CMD_SET_COND_IMM://10
                {
                    rv = AVL_patch_read32(pPatchData, &patch_idx,1);
                    num_rvs = AVL_patch_read32(pPatchData, &patch_idx,1);
                    rv0_idx = AVL_patch_read32(pPatchData, &patch_idx,1);
                    gstChipInternalArray[uiChipNo].variable_array[rv0_idx] = rv;
                    patch_idx += 4*(num_rvs - 1); //skip over any extraneous RV's
                    break;
                }
            }
        }
   		else {
            patch_idx = next_cmd_idx; //jump to next command
            continue;
        }
    }


    return r;
}
