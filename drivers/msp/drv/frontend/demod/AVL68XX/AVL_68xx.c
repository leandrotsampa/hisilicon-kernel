#include "drv_demod.h"

#include "AVL_Demod.h"
#include "AVL_68xx.h"
#include "AVL_Tuner.h"
#include "mxl608.h"

//zhaobaoren

AVL_uint32 MxL608T_Initialize(AVL_Tuners *pTuner)
{
    AVL_uchar devBus, devId;

    devId  = (AVL_uchar)pTuner->uiTunerPort;
    devBus = (AVL_uchar)pTuner->uiTunerI2CBus;
    HI_INFO_TUNER("MxL608T_Initialize{%d,%d}\n", devId, devBus);

    return mxl608_init_tuner2(devId,pTuner->uiIFHz);
}

AVL_uint32 MxL608T_SetTune(AVL_Tuners *pTuner)
{
    AVL_uchar devBus, devId;

    devId  = (AVL_uchar)pTuner->uiTunerPort;
    devBus = (AVL_uchar)pTuner->uiTunerI2CBus;
    HI_INFO_TUNER("    Mxl608T_tune{%d,%d}{%8d,%4d}{%d}\n",
            devId, devBus,
            pTuner->uiRFFrequencyHz,
            pTuner->uiBandwidthHz,
            pTuner->eDTVMode);

    mxl608_set_tuner2(devId, devBus, pTuner->uiRFFrequencyHz,pTuner->eDTVMode,pTuner->uiIFHz,pTuner->uiBandwidthHz);// Unit:Hz

    return 0;
}

AVL_uint32 MxL608T_GetLockStatus(AVL_Tuners *pTuner)
{
    AVL_uint32 status;
    AVL_uchar devBus, devId;

    devId  = (AVL_uchar)pTuner->uiTunerPort;
    devBus = (AVL_uchar)pTuner->uiTunerI2CBus;
    status = mxl608_GetLockStatus(devId);
    pTuner->ucTunerLocked  = status;
    return 0;
}


AVL_uint32 MxL608T_GetRFStrength(AVL_Tuners *pTuner, AVL_int32 *power)
{
    AVL_uchar devBus, devId;

    devId  = (AVL_uchar)pTuner->uiTunerPort;
    devBus = (AVL_uchar)pTuner->uiTunerI2CBus;

    return mxl608_get_signal_strength(devId, power);
}

// tuner configuration
static AVL_Tuners Avl_tuner_tc[2] = {
	{
	    0, // TUNER1
	    1,
	    0xC0, /* 0x60 */
	    AVL_STATUS_UNLOCK,//tuner lock status
	    DTVMode_DVBTX,
	     666*1000*1000,
	      36*1000*1000,
	    8000*1000,
	     340*1000*1000,             //LPF setting, not used for T/C tuner
	    HI_FALSE,
	    NULL,
        MxL608T_Initialize,        	//tuner initialization function
        MxL608T_SetTune,            //tuner lock function
        MxL608T_GetLockStatus,     	//tuner check lock status function
        MxL608T_GetRFStrength
	},
	{
	    1, // TUNER2
	    2,
	    0xC0, /* 0x60 */
	    AVL_STATUS_UNLOCK,			//tuner lock status
	    DTVMode_DVBTX,
	     666*1000*1000,
	      36*1000*1000,
	    8000*1000,
	     340*1000*1000,             //LPF setting, not used for T/C tuner
	    HI_TRUE,
	    NULL,
	    MxL608T_Initialize,        	//tuner initialization function
	    MxL608T_SetTune,            //tuner lock function
	    MxL608T_GetLockStatus,     	//tuner check lock status function
	    MxL608T_GetRFStrength
	},
};

#if 0
static AVL_Tuners Avl_tuner_sat[2] =
{
    0,
    0xC2, /* 0x61 */
    AVL_STATUS_UNLOCK,

    DTVMode_DVBSX,
     666*1000*1000,
    5000*1000,//IF frequency setting, not used for S tuner
    8000*1000,//BW setting, not used for S tuner
     340*1000*1000,

    0,

    0,                  	//tuner initialization function
    0,             			//tuner lock function
    0,                     	//tuner check lock status function
    0
};
#endif

extern AVL_CommonConfig AVL_CommonConfigChip0;
extern AVL_CommonConfig AVL_CommonConfigChip1;
static AVL_uchar Avl_DataPLPArrays[2][255];
static AVL_uchar Avl_DataPLPNumber[2];

int
Avl68xx_Initialize(HI_U32 uiChipNo, AVL_DemodMode eDemodModeMode)
{
    AVL_ErrorCode r = AVL_EC_OK;

    HI_ERR_TUNER("Avl68xx:Initialize{%d,%d}\n", uiChipNo, eDemodModeMode);
    r = AVL_Demod_Initialize(eDemodModeMode, uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_ERR_TUNER("Avl68xx::AVL_Initialize Failed{%d}\n", r);
        return r;
    }
 	AVL_IBSP_Delay(10);
    // Open the I2C bus for tuner
    AVL_Demod_I2CBypassOn(uiChipNo);
    if (Avl_tuner_tc[uiChipNo].fpInitializeFunc != NULL)
    {
        r = Avl_tuner_tc[uiChipNo].fpInitializeFunc(&Avl_tuner_tc[uiChipNo]);
        if (r != AVL_EC_OK)
        {
            HI_ERR_TUNER("Avl68xx::Tuner failure!\n");
        }
	  	else
     	{
            HI_ERR_TUNER("Avl68xx::Tuner ok\n");
     	}
    }
    // Close the I2C bus to avoid interference
    AVL_Demod_I2CBypassOff(uiChipNo);
 	AVL_IBSP_Delay(10);
    if (r == AVL_EC_OK)
    {
        HI_ERR_TUNER("Avl68xx::ok\n");
	}
    return r;
}

HI_S32
AVL68XX_Init(HI_U32 u32TunerPort, HI_U8 enI2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerDevType)
{
    HI_U32 uiChipNo;

	HI_ERR_TUNER("Avl68xx{%d,%d,%02X}{%d,%d}\n", u32TunerPort, enI2cChannel,
			g_stTunerOps[u32TunerPort].u32DemodAddress,
			enTunerDevType,
			g_stTunerOps[u32TunerPort].enSigType);

    if (u32TunerPort == 0) {
    	uiChipNo = 0;
		AVL_CommonConfigChip0.usI2CBus  = enI2cChannel;
		AVL_CommonConfigChip0.usI2CAddr = g_stTunerOps[u32TunerPort].u32DemodAddress;
    }
    else if (u32TunerPort == 1) {
    	uiChipNo = 1;
 		AVL_CommonConfigChip1.usI2CBus  = enI2cChannel;
		AVL_CommonConfigChip1.usI2CAddr = g_stTunerOps[u32TunerPort].u32DemodAddress;
	}
    g_stTunerOps[u32TunerPort].u32ChipNo  = uiChipNo;

	Avl_tuner_tc[uiChipNo].uiTunerPort	  = u32TunerPort;
	Avl_tuner_tc[uiChipNo].uiTunerI2CBus  = enI2cChannel;
	Avl_tuner_tc[uiChipNo].uiTunerI2CAddr = g_stTunerOps[u32TunerPort].u32TunerAddress;
	AVL_IBSP_Initialize();

	if (Avl68xx_Initialize(uiChipNo, AVL_DVBTX))
	{
		HI_ERR_TUNER("Avl68xx:failure\n");
	    return HI_FAILURE;
	}

    HI_ERR_TUNER("Avl68xx:SUCCESS uiChipNo %d\n",uiChipNo);
    return HI_SUCCESS;
}

HI_S32
AVL68XX_SetAttr(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_ATTR_S *pstTerTunerAttr)
{
    HI_U32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;

 	HI_INFO_TUNER("Avl68xx::settsmode_demod{%d,%d}\n", u32TunerPort, uiChipNo);
//	if (pstTerTunerAttr->enTSSerialPIN==HI_UNF_TUNER_TS_SERIAL_PIN_0) gstChipInternalArray[uiChipNo].eTSSerialPin = AVL_MPSP_DATA0
//	else if (pstTerTunerAttr->enTSSerialPIN==HI_UNF_TUNER_TS_SERIAL_PIN_7) gstChipInternalArray[uiChipNo].eTSSerialPin = AVL_MPSP_DATA7

	return HI_SUCCESS;
}

HI_S32
AVL68XX_SetTsType(HI_U32 u32TunerPort, HI_UNF_TUNER_OUPUT_MODE_E enTsType)
{
    HI_U32 uiChipNo  = g_stTunerOps[u32TunerPort].u32ChipNo;

	HI_INFO_TUNER("Avl68xx::tstype{%d,%d}{%d}\n", u32TunerPort, enTsType, uiChipNo);
	switch(enTsType)
	{
		case HI_UNF_TUNER_OUTPUT_MODE_PARALLEL_MODE_A:
		case HI_UNF_TUNER_OUTPUT_MODE_PARALLEL_MODE_B:
		    if (uiChipNo == 0)
		    {
				AVL_CommonConfigChip0.eTSMode = AVL_TS_PARALLEL;
		    }
		    else if (uiChipNo == 1) {
				AVL_CommonConfigChip1.eTSMode = AVL_TS_PARALLEL;
			}
			break;
		case HI_UNF_TUNER_OUTPUT_MODE_SERIAL:
		case HI_UNF_TUNER_OUTPUT_MODE_SERIAL_50:
		case HI_UNF_TUNER_OUTPUT_MODE_SERIAL_2BIT:
		default:
		    if (uiChipNo == 0)
		    {
				AVL_CommonConfigChip0.eTSMode = AVL_TS_SERIAL;
		    }
		    else if (uiChipNo == 1) {
				AVL_CommonConfigChip1.eTSMode = AVL_TS_SERIAL;
			}
			break;
	}
	return HI_SUCCESS; /*AVL68XX_Init(u32TunerPort);*/
}

static AVL_ErrorCode
Avl68xx_SetWorkMode(HI_U32 uiChipNo, AVL_DemodMode eDemodWorkMode)
{
    AVL_ErrorCode r = AVL_EC_OK;

    HI_INFO_TUNER("Avl68xx::set workmode{%d}\n", eDemodWorkMode);
    r = AVL_Demod_SetMode(eDemodWorkMode, uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::Failed to set work mode!\n");
        return (r);
    }

    return (r);
}

static AVL_ErrorCode
Avl68xx_ChkLockStatus(HI_U32 uiChipNo, AVL_int16 *pLockFlag)
{
    AVL_DemodMode eCurrentDemodMode;
    AVL_uchar ucLockStatus = 0;
    AVL_uchar ucNosignal = 0;
    AVL_ErrorCode r = AVL_EC_OK;

	*pLockFlag = 0;
    r = GetMode_Demod(&eCurrentDemodMode, uiChipNo);
    if (r != AVL_EC_OK) return r;

    // No signal Detection
    if (eCurrentDemodMode == AVL_DVBTX)
    {
      	r = AVL_Demod_DVBTxSignalDetection(&ucNosignal, uiChipNo);
	    if (r != AVL_EC_OK) return r;
      	if (ucNosignal==0)//ucNosignal=1:signal exist 0:nosignal
      	{
      		*pLockFlag = -1;
        // 	HI_INFO_TUNER("Avl68xx::---- NoSignal ---- \n");
	        return r;
      	}
    }
    //get the lock status
    r = AVL_Demod_GetLockStatus(&ucLockStatus, uiChipNo);
	if (r != AVL_EC_OK) return r;
    if (ucLockStatus == 1)
    {
    //	HI_INFO_TUNER("Avl68xx::--- locked! ---\n");
        *pLockFlag = 1;
        return r;
    }
//  HI_INFO_TUNER("Avl68xx::unlocked{%d}\n", eCurrentDemodMode);
	return r;
}

static AVL_ErrorCode
Avl68xx_DVBC_SetTuner(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 SymbolrateKhz)
{
    AVL_Tuners *pTuner;
    AVL_ErrorCode r = AVL_EC_OK;

	pTuner = &Avl_tuner_tc[uiChipNo];
    pTuner->uiRFFrequencyHz = FreqKhz * 1000;
    pTuner->uiBandwidthHz = SymbolrateKhz * 1150;///should be set different, the rolloff  is 0.15.
    pTuner->eDTVMode = DTVMode_DVBC;

	// Open the I2C bus for T/C tuner
	AVL_Demod_I2CBypassOn(uiChipNo);

	if (pTuner->fpLockFunc != NULL)
	{
		r = pTuner->fpLockFunc(pTuner);
		if (r != AVL_EC_OK)
		{
			HI_INFO_TUNER("Avl68xx::C:Tuner failure\n");
			AVL_Demod_I2CBypassOff(uiChipNo);
			return (r);
		}
	}

	//check the tuner is locked
	if (pTuner->fpGetLockStatusFunc != NULL)
	{
		AVL_IBSP_Delay(20);
		r = pTuner->fpGetLockStatusFunc(pTuner);
		if (r != AVL_EC_OK)
		{
			HI_INFO_TUNER("Avl68xx::C:Tuner error\n");
		}

		if (pTuner->ucTunerLocked == 1)
		{
		//	HI_INFO_TUNER("Avl68xx::C:Tuner locked!\n");
		}
		else
		{
			HI_INFO_TUNER("Avl68xx::C:Tuner unlock\n");
		}
	}
	// Close the I2C bus to avoid interference
	AVL_Demod_I2CBypassOff(uiChipNo);
	return r;
}

static AVL_ErrorCode
Avl68xx_DVBC_Connect(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 SymbolrateKhz)
{
    AVL_ErrorCode r = AVL_EC_OK;
    AVL_DemodMode eCurrentDemodMode;

    GetMode_Demod(&eCurrentDemodMode,uiChipNo);
    if (eCurrentDemodMode != AVL_DVBC)
    {
        HI_INFO_TUNER("Avl68xx::C:DVB-C\n");
		Avl68xx_SetWorkMode(uiChipNo, AVL_DVBC);
    }

    Avl68xx_DVBC_SetTuner(uiChipNo, FreqKhz, SymbolrateKhz);

    r = AVL_Demod_DVBCAutoLock(uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::C:Failed to lock the channel!\n");
        return r;
    }

    return r;
}

static AVL_ErrorCode
Avl68xx_DVBT_SetTuner(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 BandwidthKhz)
{
    AVL_Tuners *pTuner;
    AVL_ErrorCode r = AVL_EC_OK;

	pTuner = &Avl_tuner_tc[uiChipNo];
    pTuner->uiRFFrequencyHz = FreqKhz * 1000;
    pTuner->uiBandwidthHz   = BandwidthKhz * 1000;
    pTuner->eDTVMode = DTVMode_DVBTX;

    if (pTuner->fpLockFunc != NULL)
    {
	    // Open the I2C bus for T/C tuner
	    AVL_Demod_I2CBypassOn(uiChipNo);
        r = pTuner->fpLockFunc(pTuner);
	    // Close the I2C bus to avoid interference
	    AVL_Demod_I2CBypassOff(uiChipNo);
        if (r != AVL_EC_OK)
        {
            HI_INFO_TUNER("Avl68xx::Tuner-%d failure\n", uiChipNo);
            return (r);
        }
    }

    // check the tuner is locked
    if (pTuner->fpGetLockStatusFunc != NULL)
    {
       	AVL_IBSP_Delay(10);
	    // Open the I2C bus for T/C tuner
	    AVL_Demod_I2CBypassOn(uiChipNo);
        r = pTuner->fpGetLockStatusFunc(pTuner);
	    // Close the I2C bus to avoid interference
	    AVL_Demod_I2CBypassOff(uiChipNo);
        if (r != AVL_EC_OK)
        {
            HI_INFO_TUNER("Avl68xx::Tuner-%d error\n", uiChipNo);
        }

        if (pTuner->ucTunerLocked == 1)
        {
        // 	HI_INFO_TUNER("Avl68xx::T:Tuner locked!\n");
        }
        else
        {
            HI_INFO_TUNER("Avl68xx::Tuner-%d unlock!\n", uiChipNo);
        }
    }
    return(r);
}

static AVL_DVBTxBandWidth
Avl68xx_DVBT_ByBandwidth(AVL_uint32 BandwidthKhz)
{
    AVL_DVBTxBandWidth nBand = AVL_DVBTx_BW_8M;

    if      (BandwidthKhz == 1700) nBand = AVL_DVBTx_BW_1M7;
	else if (BandwidthKhz == 5000) nBand = AVL_DVBTx_BW_5M;
	else if (BandwidthKhz == 6000) nBand = AVL_DVBTx_BW_6M;
	else if (BandwidthKhz == 7000) nBand = AVL_DVBTx_BW_7M;
	else if (BandwidthKhz == 8000) nBand = AVL_DVBTx_BW_8M;
	else
	{
		HI_INFO_TUNER("Avl68xx::T:BandwidthKhz is Err\n");
		nBand = AVL_DVBTx_BW_8M;
	}
	return nBand;
}


static AVL_ErrorCode
Avl68xx_DVBTX_Connect(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 BandwidthKhz)
{
    AVL_DemodMode eCurrentDemodMode;
    AVL_DVBTxBandWidth nBand = AVL_DVBTx_BW_8M;
    AVL_ErrorCode r = AVL_EC_OK;

    r = GetMode_Demod(&eCurrentDemodMode,uiChipNo);
    if (eCurrentDemodMode != AVL_DVBTX)
    {
        HI_INFO_TUNER("Avl68xx::T:DVB-Tx\n");
		Avl68xx_SetWorkMode(uiChipNo, AVL_DVBTX);
    }

    HI_INFO_TUNER("Avl68xx::TxAuto-%d:Freq is %d MHz, Bandwide is %d MHz)\n",
                       uiChipNo, FreqKhz/1000, BandwidthKhz/1000);

    r = Avl68xx_DVBT_SetTuner(uiChipNo, FreqKhz, BandwidthKhz);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::T:Failure{%d}\n", r);
    }

    nBand = Avl68xx_DVBT_ByBandwidth(BandwidthKhz);
    //=====Demod Lock=====//
    r = AVL_Demod_DVBTxChannelScan(nBand, AVL_DVBTx_LockMode_ALL, uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::T:Failed to lock the channel!\n");
    }
    return r;
}


static AVL_ErrorCode
Avl68xx_DVBT1_Connect(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 BandwidthKhz, AVL_int32 ucDVBTLayer)
{
    AVL_DemodMode eCurrentDemodMode;
    AVL_DVBTxBandWidth nBand = AVL_DVBTx_BW_8M;
    AVL_ErrorCode r = AVL_EC_OK;

    r = GetMode_Demod(&eCurrentDemodMode,uiChipNo);
    if (eCurrentDemodMode != AVL_DVBTX)
    {
        HI_INFO_TUNER("Avl68xx::T1:DVB-Tx\n");
		Avl68xx_SetWorkMode(uiChipNo, AVL_DVBTX);
    }

    r = Avl68xx_DVBT_SetTuner(uiChipNo, FreqKhz, BandwidthKhz);

    HI_INFO_TUNER("Avl68xx::T1:Freq is %d MHz, Bandwide is %d MHz, Layer Info is %d (0 : LP; 1 : HP)\n",
                       FreqKhz/1000, BandwidthKhz/1000, ucDVBTLayer);

    nBand = Avl68xx_DVBT_ByBandwidth(BandwidthKhz);
    //=====Demod Lock=====//
    r = AVL_Demod_DVBTAutoLock(nBand, ucDVBTLayer, uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::T1:Failed to lock the channel!\n");
    }
    return r;
}

static AVL_ErrorCode
Avl68xx_DVBT2_Connect(HI_U32 uiChipNo, AVL_uint32 FreqKhz, AVL_uint32 BandwidthKhz, AVL_uchar ucT2Profile, AVL_int32 PLP_ID)
{
    AVL_DemodMode eCurrentDemodMode;
    AVL_DVBTxBandWidth nBand = AVL_DVBTx_BW_8M;
    AVL_ErrorCode r = AVL_EC_OK;

    GetMode_Demod(&eCurrentDemodMode,uiChipNo);
    if (eCurrentDemodMode != AVL_DVBTX)
    {
        HI_INFO_TUNER("Avl68xx::T2:DVB-Tx\n");
		Avl68xx_SetWorkMode(uiChipNo, AVL_DVBTX);
    }

    r = Avl68xx_DVBT_SetTuner(uiChipNo, FreqKhz, BandwidthKhz);

    HI_INFO_TUNER("Avl68xx::T2:Freq is %d MHz, Bandwide is %d MHz, DATA PLP ID is %d   T2_Profile=%d\n",
                       FreqKhz/1000, BandwidthKhz/1000, PLP_ID, ucT2Profile);

    nBand = Avl68xx_DVBT_ByBandwidth(BandwidthKhz);
    //=====Demod Lock=====//
    r = AVL_Demod_DVBT2AutoLock(nBand, (AVL_DVBT2_PROFILE)ucT2Profile, PLP_ID, uiChipNo);
    if (r != AVL_EC_OK)
    {
        HI_INFO_TUNER("Avl68xx::T2:Failed to lock the channel!\n");
    }
    return r;
}

HI_S32
AVL68XX_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
	AVL_int32  uiDVBTLayer = 0;
	AVL_int32  uiT2Profile = AVL_DVBT2_PROFILE_BASE;
	AVL_int32  uiPlpID = 0;
//	AVL_int16  nLockFlag = 0;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pstChannel);
    HI_ERR_TUNER("Avl68xx::CONNECT-%d{%d, %d} {%d.%d.%d, %d}\n",
			uiChipNo,
			pstChannel->u32Frequency,
			pstChannel->unSRBW.u32BandWidth,
			g_stTunerOps[u32TunerPort].enSigType,
			pstChannel->unTer.enDVBT2.u8PlpId,
            pstChannel->unTer.enDVBT2.enChannelAttr,
            pstChannel->u8DVBTMode);

    switch(g_stTunerOps[u32TunerPort].enSigType)
    {
	    case HI_UNF_TUNER_SIG_TYPE_DVB_T2:
	    	uiPlpID = pstChannel->unTer.enDVBT2.u8PlpId;
	    	uiT2Profile = pstChannel->unTer.enDVBT2.enChannelAttr;
            if (pstChannel->u8DVBTMode)
	    	{
		        r = Avl68xx_DVBTX_Connect(uiChipNo, pstChannel->u32Frequency,
	        			pstChannel->unSRBW.u32BandWidth);
	    	}
	    	else
	    	{
		    	if      (pstChannel->unTer.enDVBT2.enChannelAttr == HI_UNF_TUNER_TER_MODE_BASE) uiT2Profile = AVL_DVBT2_PROFILE_BASE;
		    	else if (pstChannel->unTer.enDVBT2.enChannelAttr == HI_UNF_TUNER_TER_MODE_LITE) uiT2Profile = AVL_DVBT2_PROFILE_LITE;
		    	else uiT2Profile = AVL_DVBT2_PROFILE_UNKNOWN;
		        r = Avl68xx_DVBT2_Connect(uiChipNo, pstChannel->u32Frequency,
	        			pstChannel->unSRBW.u32BandWidth,
	        			uiT2Profile,
	        			uiPlpID);
	        }
	        break;
	    case HI_UNF_TUNER_SIG_TYPE_DVB_T:
            if (pstChannel->u8DVBTMode)
	    	{
		        r = Avl68xx_DVBTX_Connect(uiChipNo, pstChannel->u32Frequency,
	        			pstChannel->unSRBW.u32BandWidth);
	    	}
	    	else
	    	{
		    	if      (pstChannel->unTer.enDVBT == HI_UNF_TUNER_TS_PRIORITY_LP) uiDVBTLayer = 0;
		    	else if (pstChannel->unTer.enDVBT == HI_UNF_TUNER_TS_PRIORITY_HP) uiDVBTLayer = 1;
		    	else uiDVBTLayer = 0;
	        	r = Avl68xx_DVBT1_Connect(uiChipNo, pstChannel->u32Frequency,
	        			pstChannel->unSRBW.u32BandWidth,
	        			uiDVBTLayer);
	        }
	        break;
	    case HI_UNF_TUNER_SIG_TYPE_CAB:
	        r = Avl68xx_DVBC_Connect(uiChipNo, pstChannel->u32Frequency,
	        			pstChannel->unSRBW.u32SymbolRate / 1000);
	        break;
	    default:
	    	HI_ERR_TUNER("Avl68xx::not supported!\n");
	       	return HI_FAILURE;
    }
	AVL_IBSP_Delay(100);
//  r = Avl68xx_ChkLockStatus(uiChipNo, &nLockFlag);
//	HI_INFO_TUNER("Avl68xx::lockstatus{%d}\n", nLockFlag);
    return HI_SUCCESS;
}

HI_VOID
AVL68XX_SetWaitTimes(HI_U32 u32ConnectTimeout)
{
    return;
}

HI_S32
AVL68XX_AntennaPower(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_ANTENNA_POWER_E enAntennaPower)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_GPIOPinNumber ePinNumber;
    AVL_GPIOPinValue  ePinValue;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_INFO_TUNER("Avl68xx::Antennapower{%d,%d}\n", enAntennaPower, uiChipNo);
	ePinNumber = AVL_Pin37;
	ePinValue  = (enAntennaPower==HI_UNF_TUNER_TER_ANTENNA_POWER_OFF) ? AVL_LOGIC_1 : AVL_LOGIC_0;
	r = AVL_Demod_SetGPIO(ePinNumber, ePinValue, uiChipNo);
	return HI_SUCCESS;
}

HI_S32
AVL68XX_GetLockStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penLockStatus)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_int16  nLockFlag = 0;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != penLockStatus);
	*penLockStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLockFlag);
    if (r == AVL_EC_OK)
    {
		if (nLockFlag > 0) *penLockStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
        if (nLockFlag < 0) *penLockStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
        //HI_ERR_TUNER("Avl68xx::lockstatus{%d}\n", nLockFlag);
    }
    #if 0
    {
		HI_U32 u32Quality;
		HI_U32 u32SNR;
		HI_U32 u32Strength;
	    AVL68XX_GetQuality(u32TunerPort, &u32Quality);
	    AVL68XX_GetSnr(u32TunerPort, &u32SNR);
	    AVL68XX_GetStrength(u32TunerPort, &u32Strength);
    }
    #endif
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32ber)
{
	HI_ASSERT(HI_NULL != pu32ber);
	*pu32ber = 0;
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetQuality(HI_U32 u32TunerPort, HI_U32 *pu32Quality)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_uint16 uiSQI = 0;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pu32Quality);
	*pu32Quality = 0;
    /******** get SQI *******/
    /* the range for returned uiSQI is 0 to 100 */
    r = AVL_Demod_GetSQI(&uiSQI, uiChipNo);
    if (r == AVL_EC_OK)
    {
    	if (uiSQI < 5)  uiSQI = 5;
    	if (uiSQI > 99) uiSQI = 99;
		*pu32Quality = uiSQI;
	// 	HI_INFO_TUNER("Avl68xx::quality:%d\n", uiSQI);
    }
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetSnr(HI_U32 u32TunerPort, HI_U32 *pu32SNR)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_uint32 uiSNR = 0;//value: 100 times as actual SNR
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pu32SNR);
    /******** get SNR *******/
    /* the returned value of uiSNR is 100 times as actual SNR */
    r = AVL_Demod_GetSNR(&uiSNR, uiChipNo);
    if (r == AVL_EC_OK)
    {
		*pu32SNR = uiSNR/100;
	// 	HI_INFO_TUNER("Avl68xx::SNR:%d\n", uiSNR);
    }
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetStrength(HI_U32 u32TunerPort, HI_U32 *pu32Strength)
{
    AVL_DemodMode current_mode;
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_Tuners *pTuner;
    AVL_uint16 uiSSI = 0;// range 0 - 65535
//	AVL_uchar  ucSSI = 0;// range 0 - 100
    AVL_int32  iRFPower = -100;//dBm
    AVL_uint32 uStrength = 1;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pu32Strength);

	uStrength = 1;
	pTuner = &Avl_tuner_tc[uiChipNo];
    r = GetMode_Demod(&current_mode,uiChipNo);
    switch(current_mode)
    {
        case AVL_DVBTX:
            if (pTuner->fpGetRFStrength != NULL)
            {
                AVL_Demod_I2CBypassOn(uiChipNo);//before tuner control, the tuner I2C control path should be enabled
                pTuner->fpGetRFStrength(pTuner, &iRFPower);
                AVL_Demod_I2CBypassOff(uiChipNo);//before the control is done, the tuner I2C control path should be disabled to avoid interference towards tuner
				// sky()
                #if 0
				iRFPower = -100;
                r = AVL_Demod_DVBTxGetNorDigSSI(&ucSSI, iRFPower, uiChipNo);
			    if (r == AVL_EC_OK)
			    {
	            	uStrength = ucSSI;
	            	uStrength = iRFPower;
		            HI_INFO_TUNER("Avl68xx::T:SSI is %d\n", uStrength);
			    }
			    #else
	           	uStrength = iRFPower;
	        //  HI_INFO_TUNER("Avl68xx::C:RFPower is %d\n", iRFPower);
			    #endif
            }
            else
            {
                HI_INFO_TUNER("Avl68xx::Tuner{%d} doesn't support RF signal\n, uiChipNo");
            }

            //the range for returned uiSSI is 0 to 100
            //HI_INFO_TUNER("SSI is %d\n", ucSSI);
            break;
        case AVL_DVBSX:
        case AVL_ISDBT:
        case AVL_DVBC:
            /* the range for returned uiSSI is 0 to 100 */
            r = AVL_Demod_GetSSI(&uiSSI, uiChipNo);
		    if (r == AVL_EC_OK)
		    {
	            uStrength = uiSSI*100/65535;
	        //  HI_INFO_TUNER("Avl68xx::C:SSI is %d\n", uStrength);
		    }
            break;
        default:
            r = AVL_EC_GENERAL_FAIL;
            break;
    }
	pu32Strength[1] = uStrength;
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    AVL_DemodMode current_mode;
    AVL_uint32 uiChipNo  = g_stTunerOps[u32TunerPort].u32ChipNo;
	AVL_int16  nLockFlag = 0;
    AVL_DVBTxModulationInfo DVBTSignalInfo;
    AVL_DVBCModulationInfo  DVBCSignalInfo;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pstInfo);
    //=====Check Lock Status =====//
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLockFlag);
    if (nLockFlag == 1) //DVBTx is locked
    {
	    r = GetMode_Demod(&current_mode,uiChipNo);
	    switch(current_mode)
	    {
	        case AVL_DVBTX:
		        //get the signal modulation mode
		        r = AVL_Demod_DVBTxGetModulationInfo(&DVBTSignalInfo, uiChipNo);
			    if (r != AVL_EC_OK) break;
				if (DVBTSignalInfo.ucDVBxStandard == AVL_DVBTx_Standard_T)
				{
					pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T;
			        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTFFTSize == AVL_DVBT_FFT_2K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_2K;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTFFTSize == AVL_DVBT_FFT_8K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_8K;
					else pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_DEFAULT;

			        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTGuardInterval == AVL_DVBT_GUARD_1_32) pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_32;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTGuardInterval == AVL_DVBT_GUARD_1_16) pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_16;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTGuardInterval == AVL_DVBT_GUARD_1_8)  pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_8;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTGuardInterval == AVL_DVBT_GUARD_1_4)  pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_4;
					else pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_DEFALUT;

			        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTModulationMode == AVL_DVBT_QPSK)  pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QPSK;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTModulationMode == AVL_DVBT_16QAM) pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_16;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTModulationMode == AVL_DVBT_64QAM) pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_64;
					else pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_AUTO;

			        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHierarchy == AVL_DVBT_HIER_NONE)    pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_NO;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHierarchy == AVL_DVBT_HIER_ALPHA_1) pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA1;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHierarchy == AVL_DVBT_HIER_ALPHA_2) pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA2;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHierarchy == AVL_DVBT_HIER_ALPHA_4) pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA4;
					else pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_DEFAULT;

			        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHPCodeRate == AVL_DVBT_CR_1_2) pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_1_2;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHPCodeRate == AVL_DVBT_CR_2_3) pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_2_3;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHPCodeRate == AVL_DVBT_CR_3_4) pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_3_4;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHPCodeRate == AVL_DVBT_CR_5_6) pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_5_6;
			        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHPCodeRate == AVL_DVBT_CR_7_8) pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_7_8;
					else pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_AUTO;
			        if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTHierarchy != AVL_DVBT_HIER_NONE)
			        {
				        if      (DVBTSignalInfo.eDVBTSingalInfo.eDVBTLPCodeRate == AVL_DVBT_CR_1_2) pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_1_2;
				        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTLPCodeRate == AVL_DVBT_CR_2_3) pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_2_3;
				        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTLPCodeRate == AVL_DVBT_CR_3_4) pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_3_4;
				        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTLPCodeRate == AVL_DVBT_CR_5_6) pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_5_6;
				        else if (DVBTSignalInfo.eDVBTSingalInfo.eDVBTLPCodeRate == AVL_DVBT_CR_7_8) pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_7_8;
						else pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_AUTO;
			        }
				}
				if (DVBTSignalInfo.ucDVBxStandard == AVL_DVBTx_Standard_T2)
				{
					pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T2;
			        if      (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_1K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_1K;
			        if      (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_2K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_2K;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_4K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_4K;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_8K) pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_8K;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_16K)pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_16K;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2FFTSize == AVL_DVBT2_FFT_32K)pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_32K;
					else pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_DEFAULT;

			        if      (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_1_32)  pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_32;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_1_16)  pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_16;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_1_8)   pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_8;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_1_4)   pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_4;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_1_128) pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_128;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_19_128)pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_19_128;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2GuardInterval == AVL_DVBT2_GI_19_256)pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_19_256;
					else pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_DEFALUT;

			        if      (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPModulationMode == AVL_DVBT2_QPSK)  pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QPSK;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPModulationMode == AVL_DVBT2_16QAM) pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_16;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPModulationMode == AVL_DVBT2_64QAM) pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_64;
			        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPModulationMode == AVL_DVBT2_256QAM)pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_256;
					else pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_AUTO;

					if (DVBTSignalInfo.eDVBT2SingalInfo.ucDVBT2CommonPLPExist)
					{
			        	pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_COM;
			        }
			        else
			        {
				        if      (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPType == AVL_DVBT2_DATA_PLP_TYPE1) pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT1;
				        else if (DVBTSignalInfo.eDVBT2SingalInfo.eDVBT2DataPLPType == AVL_DVBT2_DATA_PLP_TYPE2) pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT2;
						else pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_COM;
					}
				}
	            break;
	        case AVL_DVBC:
		        //get the signal modulation mode
		        r = AVL_Demod_DVBCGetModulationInfo(&DVBCSignalInfo, uiChipNo);
			    if (r != AVL_EC_OK) break;
				pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_CAB;
	            break;
	        case AVL_DVBSX:
	        case AVL_ISDBT:
	        default:
	            r = AVL_EC_GENERAL_FAIL;
	            break;
	    }
	}
    return HI_SUCCESS;
}


HI_S32
AVL68XX_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum)
{
    AVL_uint32 uiChipNo  = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_int16  nLockFlag = 0;
    AVL_DemodMode current_mode;
	AVL_DVBTxModulationInfo stModulationInfo;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pu8PLPNum);
	*pu8PLPNum = 0;
    r = GetMode_Demod(&current_mode,uiChipNo);
    if (r != AVL_EC_OK) return HI_FAILURE;
    if (current_mode != AVL_DVBTX) return HI_FAILURE;

    //=====Check Lock Status =====//
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLockFlag);
    if (nLockFlag == 1) //DVBTx is locked
    {
        //get the signal modulation mode
        r = AVL_Demod_DVBTxGetModulationInfo(&stModulationInfo, uiChipNo);
	    if (r != AVL_EC_OK) return HI_FAILURE;
		if (stModulationInfo.ucDVBxStandard == AVL_DVBTx_Standard_T2)
		{
			*pu8PLPNum = stModulationInfo.eDVBT2SingalInfo.ucNumberDPLP;
			HI_INFO_TUNER("Avl68xx::T2:ModulationInfo=%d.%d,%d,%d\n",
					stModulationInfo.eDVBT2SingalInfo.ucNumberDPLP,
					stModulationInfo.eDVBT2SingalInfo.eDVBT2DataPLPType,
					stModulationInfo.eDVBT2SingalInfo.ucDVBT2DataPLPID,
					stModulationInfo.eDVBT2SingalInfo.ucDVBT2CommonPLPExist);
		}
	}
    return HI_SUCCESS;
}

HI_S32
AVL68XX_GetPlpId(HI_U32 u32TunerPort, HI_U8 *pu8PlpId)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
	AVL_int16  nLocked  = 0;
    AVL_DemodMode current_mode;
	AVL_DVBTxModulationInfo stModulationInfo;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != pu8PlpId);
	*pu8PlpId = 0;
    r = GetMode_Demod(&current_mode,uiChipNo);
    if (r != AVL_EC_OK) return HI_FAILURE;
    if (current_mode != AVL_DVBTX) return HI_FAILURE;

    //=====Check Lock Status =====//
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLocked);
    if (nLocked == 1) //DVBTx is locked
    {
        // get the signal modulation mode
        r = AVL_Demod_DVBTxGetModulationInfo(&stModulationInfo, uiChipNo);
	    if (r != AVL_EC_OK) return HI_FAILURE;
		if (stModulationInfo.ucDVBxStandard == AVL_DVBTx_Standard_T2)
		{
			*pu8PlpId = stModulationInfo.eDVBT2SingalInfo.ucDVBT2DataPLPID;
		}
	}
    return HI_SUCCESS;
}

/*only used in DVB-T2*/
HI_S32
AVL68XX_GetCurrentPlpType(HI_U32 u32TunerPort, HI_UNF_TUNER_T2_PLP_TYPE_E *penPLPType)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
	AVL_int16  nLocked  = 0;
    AVL_DemodMode current_mode;
	AVL_DVBTxModulationInfo stModulationInfo;
    AVL_ErrorCode r = AVL_EC_OK;

	HI_ASSERT(HI_NULL != penPLPType);
	*penPLPType = HI_UNF_TUNER_T2_PLP_TYPE_BUTT;
    r = GetMode_Demod(&current_mode,uiChipNo);
    if (r != AVL_EC_OK) return HI_FAILURE;
    if (current_mode != AVL_DVBTX) return HI_FAILURE;

    //=====Check Lock Status =====//
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLocked);
    if (nLocked == 1) //DVBTx is locked
    {
        // get the signal modulation mode
        r = AVL_Demod_DVBTxGetModulationInfo(&stModulationInfo, uiChipNo);
	    if (r != AVL_EC_OK) return HI_FAILURE;
		if (stModulationInfo.ucDVBxStandard == AVL_DVBTx_Standard_T2)
		{
			if (stModulationInfo.eDVBT2SingalInfo.eDVBT2DataPLPType==AVL_DVBT2_DATA_PLP_TYPE1) *penPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT1;
			if (stModulationInfo.eDVBT2SingalInfo.eDVBT2DataPLPType==AVL_DVBT2_DATA_PLP_TYPE2) *penPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT2;
			HI_INFO_TUNER("Avl68xx::T2:ModulationInfo=%d.%d,%d,%d\n",
					stModulationInfo.eDVBT2SingalInfo.ucNumberDPLP,
					stModulationInfo.eDVBT2SingalInfo.eDVBT2DataPLPType,
					stModulationInfo.eDVBT2SingalInfo.ucDVBT2DataPLPID,
					stModulationInfo.eDVBT2SingalInfo.ucDVBT2CommonPLPExist);
		}
	}
    return HI_SUCCESS;
}
/*only used in DVB-T2*/
HI_S32
AVL68XX_SetPlpId(HI_U32 u32TunerPort, HI_U8 u8PLPID, HI_U32 u32Mode)
{
    AVL_uint32 uiChipNo = g_stTunerOps[u32TunerPort].u32ChipNo;
    AVL_Tuners *pTuner;
	AVL_int16  nLocked  = 0;
    AVL_DVBTxScanInfo  stDVBTxScanInfo;
    AVL_DVBT2_PROFILE  ucT2Profile = AVL_DVBT2_PROFILE_BASE;
    AVL_DVBTxBandWidth ucBandwidth = AVL_DVBTx_BW_8M;
    AVL_DemodMode current_mode;
    AVL_ErrorCode r = AVL_EC_OK;
	int	i;

	pTuner = &Avl_tuner_tc[uiChipNo];
    r = GetMode_Demod(&current_mode,uiChipNo);
    if (r != AVL_EC_OK) return HI_FAILURE;
    if (current_mode != AVL_DVBTX) return HI_FAILURE;

    //=====Check Lock Status =====//
    r = Avl68xx_ChkLockStatus(uiChipNo, &nLocked);
    if (nLocked == 1) //DVBTx is locked
    {
        r = AVL_Demod_DVBTxGetScanInfo(&stDVBTxScanInfo, uiChipNo);
	    if (r != AVL_EC_OK) return HI_FAILURE;
		ucBandwidth = Avl68xx_DVBT_ByBandwidth(pTuner->uiBandwidthHz/1000);
		HI_INFO_TUNER("Avl68xx::T2:SCANINFO.%d:%d,%d {%d,%d}(%d)\n",
				uiChipNo,
				stDVBTxScanInfo.eTxStandard,
				ucBandwidth,
				stDVBTxScanInfo.ucTxInfo,
				stDVBTxScanInfo.ucFEFInfo, u32Mode);
		if (stDVBTxScanInfo.eTxStandard == AVL_DVBTx_Standard_T2)
		{
	        ucT2Profile = (AVL_DVBT2_PROFILE)stDVBTxScanInfo.ucTxInfo;
            r = AVL_Demod_DVBT2GetPLPList(&Avl_DataPLPArrays[uiChipNo][0], &Avl_DataPLPNumber[uiChipNo], uiChipNo);
		    if (r != AVL_EC_OK)
		    {
		        HI_INFO_TUNER("Avl68xx::T2:Failed DVBT2GetPLPList{%x}\n", r);
		    }
			for(i=0; i<Avl_DataPLPNumber[uiChipNo]; i++)
			{
				HI_INFO_TUNER("Avl68xx::T2:PLPId %d=%d\n", i, Avl_DataPLPArrays[uiChipNo][i]);
			}
			if (u32Mode==1) u8PLPID = Avl_DataPLPArrays[uiChipNo][u8PLPID];

		    //=====Demod Lock=====//
			HI_INFO_TUNER("Avl68xx::T2:PLPSets:%d/%d\n", u8PLPID, Avl_DataPLPNumber[uiChipNo]);
		    r = AVL_Demod_DVBT2AutoLock(ucBandwidth, (AVL_DVBT2_PROFILE)ucT2Profile, u8PLPID, uiChipNo);
		    if (r != AVL_EC_OK)
		    {
		        HI_INFO_TUNER("Avl68xx::T2:Failed to lock the channel!\n");
		    }
		}
	}
    return HI_SUCCESS;
}


HI_S32
AVL68XX_GetFreqOffset(HI_U32 u32TunerPort, HI_U32 *pu32Freq, HI_U32 *pu32Symb)
{
    *pu32Freq = 0;
    *pu32Symb = 0;
    return HI_SUCCESS;
}

HI_S32
AVL68XX_SetCommonPlpId(HI_U32 u32TunerPort, HI_U8 u8PLpId)
{
	return HI_SUCCESS;
}

HI_S32
AVL68XX_SetCommonPlpCombination(HI_U32 u32TunerPort, HI_U8 u8ComPlpEna)
{
	return HI_SUCCESS;
}

HI_S32
AVL68XX_GetPlpGroupId(HI_U32 u32TunerPort, HI_U8 *u8GrpPlpId)
{
	*u8GrpPlpId = 0;
	return HI_SUCCESS;
}

