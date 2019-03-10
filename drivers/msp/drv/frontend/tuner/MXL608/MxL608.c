#include <linux/module.h>

#include "hi_type.h"
#include "hi_unf_ecs.h"
//#include "tuner_common_pilot.h"
//#include "qam_common.h"
#include "MxL608_TunerApi.h"
#include "MxL608_OEM_Drv.h"
#include "mxl608.h"

#define EXAMPLE_DEV_MAX 2
#define MXL608_I2C_ADDR 0xC2

/* Example of OEM Data, customers should have
below data structure declared at their appropriate 
places as per their software design 

typedef struct
{
  UINT8   i2c_address;
  UINT8   i2c_bus;
  sem_type_t sem;
  UINT16  i2c_cnt;
} user_data_t;  

user_data_t device_context[EXAMPLE_DEV_MAX];

*/
HI_BOOL mxl608_initflag = HI_FALSE;
//user_data_t device_context[EXAMPLE_DEV_MAX];
//HI_U8 s_u8MXL608devId = 0;

static MXL_STATUS mxl608_cfg_xtal(HI_U32 u32TunerPort, UINT8 devId)
{
	MXL608_XTAL_SET_CFG_T xtalCfg;
	MXL_STATUS status; 


    if((HI_UNF_DEMOD_DEV_TYPE_3137 == g_stTunerOps[u32TunerPort].enDemodDevType)
    ||(HI_UNF_DEMOD_DEV_TYPE_ATBM888X== g_stTunerOps[u32TunerPort].enDemodDevType)
    ||(HI_UNF_DEMOD_DEV_TYPE_MN88473== g_stTunerOps[u32TunerPort].enDemodDevType)
	||(HI_UNF_DEMOD_DEV_TYPE_3138 == g_stTunerOps[u32TunerPort].enDemodDevType))
    {
    	xtalCfg.xtalFreqSel = MXL608_XTAL_24MHz;
    	xtalCfg.xtalCap = 30; //orig is 30,but CDT-816T33M-MH00 is25upF,gbiao...
    }
	else if(HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
	{
        xtalCfg.xtalFreqSel = MXL608_XTAL_16MHz;
        xtalCfg.xtalCap = 28;
	}
    else
    {
        xtalCfg.xtalFreqSel = MXL608_XTAL_16MHz;
        xtalCfg.xtalCap = 12;
    }


	if(HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
	{
		xtalCfg.clkOutEnable = MXL_DISABLE; 
		xtalCfg.clkOutDiv = MXL_DISABLE;
		xtalCfg.clkOutExt = MXL_DISABLE;
		xtalCfg.singleSupply_3_3V = MXL_ENABLE;
		xtalCfg.XtalSharingMode = MXL_DISABLE;

	}else{
		xtalCfg.clkOutEnable = MXL_ENABLE;//MXL_DISABLE; //cfg clk out for hi3137
		xtalCfg.clkOutDiv = MXL_DISABLE;
		xtalCfg.clkOutExt = MXL_DISABLE;
		xtalCfg.singleSupply_3_3V = MXL_ENABLE;
		xtalCfg.XtalSharingMode = MXL_DISABLE;
	}
    status = MxLWare608_API_CfgDevXtal(devId, xtalCfg);
    
    return status;
}


HI_S32 mxl608_init_tuner(HI_U32 u32TunerPort)
{
	MXL_STATUS status; 
	UINT8 devId;
	MXL_BOOL singleSupply_3_3V;
	MXL608_IF_OUT_CFG_T ifOutCfg;
	MXL608_AGC_CFG_T agcCfg;
	MXL608_TUNER_MODE_CFG_T tunerModeCfg;
    MXL608_PWR_MODE_E powerMode = MXL608_PWR_MODE_ACTIVE;
    MXL_BOOL enableLoopthrough = MXL_DISABLE;
    UINT8 standbyLt = 0;

    MxL608_I2C_SetPort(u32TunerPort);
    /* config i2c channel */
    // g_stTunerOps[u32TunerPort].u32TunerAddress = 0xc0;
	
    devId = u32TunerPort;//g_stTunerOps[u32TunerPort].u32TunerAddress;
    MxL608_I2C_SetChn(g_stTunerOps[u32TunerPort].enI2cChannel,g_stTunerOps[u32TunerPort].u32TunerAddress);

    //Step 1 : Soft Reset MxL608
    status = MxLWare608_API_CfgDevSoftReset(devId);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgDevSoftReset\n");
        return HI_FAILURE;
    }

    //Step 2 : Overwrite Default
	singleSupply_3_3V = MXL_ENABLE;//MXL_DISABLE;
    status = MxLWare608_API_CfgDevOverwriteDefaults(devId, singleSupply_3_3V);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgDevOverwriteDefaults\n");
        return HI_FAILURE;
    }

    //Step 3 : XTAL Setting
    status = mxl608_cfg_xtal(u32TunerPort, devId);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgDevXtal\n");
        return HI_FAILURE;
    }

    status = MxLWare608_API_CfgDevPowerMode(devId,powerMode,enableLoopthrough,standbyLt);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgDevXtal\n");
        return HI_FAILURE;
    }
    //Step 4 : IF Out setting
    if(HI_UNF_DEMOD_DEV_TYPE_3137 == g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        ifOutCfg.ifOutFreq = MXL608_IF_5_38MHz;
        ifOutCfg.gainLevel = 11;
    }
    else if(HI_UNF_DEMOD_DEV_TYPE_ATBM888X == g_stTunerOps[u32TunerPort].enDemodDevType ||
	        HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        ifOutCfg.ifOutFreq = MXL608_IF_5MHz;
        ifOutCfg.gainLevel = 11;
    }
    else
    {
        ifOutCfg.ifOutFreq = MXL608_IF_5MHz;
        ifOutCfg.gainLevel = 4;
    }
	if(HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
		ifOutCfg.ifInversion = MXL_ENABLE;
	else
		ifOutCfg.ifInversion = MXL_DISABLE;
	
    ifOutCfg.manualFreqSet = MXL_DISABLE;
    ifOutCfg.manualIFOutFreqInKHz = 0;
    status = MxLWare608_API_CfgTunerIFOutParam(devId, ifOutCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgTunerIFOutParam\n");
        return HI_FAILURE;
    }

    //Step 5 : AGC Setting
    agcCfg.agcType = MXL608_AGC_EXTERNAL;
    agcCfg.setPoint = 66;
    agcCfg.agcPolarityInverstion = MXL_DISABLE;
    status = MxLWare608_API_CfgTunerAGC(devId, agcCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgTunerAGC\n");
        return HI_FAILURE;
    }

    //Step 6 : Application Mode setting
	if((HI_UNF_DEMOD_DEV_TYPE_3137 == g_stTunerOps[u32TunerPort].enDemodDevType)
		|| (HI_UNF_DEMOD_DEV_TYPE_3138 == g_stTunerOps[u32TunerPort].enDemodDevType))
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
        tunerModeCfg.ifOutFreqinKHz = 5380;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_24MHz;
    }
    else if(HI_UNF_DEMOD_DEV_TYPE_ATBM888X== g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
        tunerModeCfg.ifOutFreqinKHz = 5000;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_24MHz;
    }
    else if(HI_UNF_DEMOD_DEV_TYPE_MN88473 == g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
        tunerModeCfg.ifOutFreqinKHz = 5000;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_24MHz;
    }
    else if (HI_UNF_DEMOD_DEV_TYPE_J83B == g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        tunerModeCfg.signalMode = MXL608_DIG_J83B; 
        tunerModeCfg.ifOutFreqinKHz = 5000;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_16MHz;
    }
    else if(HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
        tunerModeCfg.ifOutFreqinKHz = 5000;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	}
    else
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_C; 
        tunerModeCfg.ifOutFreqinKHz = 5000;
        tunerModeCfg.xtalFreqSel = MXL608_XTAL_16MHz;
    }

    tunerModeCfg.ifOutGainLevel = 11;
    status = MxLWare608_API_CfgTunerMode(devId, tunerModeCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Error! MxLWare608_API_CfgTunerMode\n");
        return HI_FAILURE;
    }

    /* 高拓指标要求 */
    if(HI_UNF_DEMOD_DEV_TYPE_ATBM888X== g_stTunerOps[u32TunerPort].enDemodDevType)
    {
        status = MxLWare608_OEM_WriteRegister(devId,0x5b,0x10);
        if (status != MXL_SUCCESS)
        {
            HI_ERR_TUNER("Error! MxLWare608_OEM_WriteRegister\n");
            return HI_FAILURE;
        }

        status = MxLWare608_OEM_WriteRegister(devId,0x5c,0xb1);
        if (status != MXL_SUCCESS)
        {
            HI_ERR_TUNER("Error! MxLWare608_OEM_WriteRegister\n");
            return HI_FAILURE;
        }
    }

    HI_INFO_TUNER("--> mxl608_init OK.\n");

    return HI_SUCCESS;
}

HI_S32 mxl608_init_tuner2(HI_U32 u32TunerPort,HI_U32 uiIFHz)
{
    MXL_BOOL singleSupply_3_3V;
    MXL608_XTAL_SET_CFG_T xtalCfg;
    MXL608_IF_OUT_CFG_T ifOutCfg;
    MXL608_AGC_CFG_T agcCfg;
    MXL_STATUS status;
    UINT8  devId;

    devId  = u32TunerPort;
    HI_ERR_TUNER("!!!!!!MxL608T_Initialize{%d-%d}\n", devId,uiIFHz);

    // Step 1 : Soft Reset MxL608
    status = MxLWare608_API_CfgDevSoftReset(devId);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgdevsoftreset failuret\n");
        return 1;
    }

    // Step 2 : Overwrite Default
//  singleSupply_3_3V = MXL_DISABLE; // china
// 	singleSupply_3_3V = MXL_ENABLE;  // old
    singleSupply_3_3V = MXL_ENABLE;  // sky(ok)
    status = MxLWare608_API_CfgDevOverwriteDefaults(devId, singleSupply_3_3V);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgdevoverwritedefaults failuret\n");
        return 1;
    }
    // Step 3 : XTAL Setting
    xtalCfg.xtalFreqSel  = MXL608_XTAL_16MHz;
//	xtalCfg.xtalCap = 12;
    //xtalCfg.xtalCap = 28; // old
    xtalCfg.xtalCap = 12; // sky(x)
#ifdef xtal_24
    	xtalCfg.xtalFreqSel = MXL608_XTAL_24MHz;
    	xtalCfg.xtalCap = 30; //orig is 30,but CDT-816T33M-MH00 is25upF,gbiao...
#endif
//	xtalCfg.clkOutEnable = MXL_ENABLE;
    xtalCfg.clkOutEnable = MXL_DISABLE; 	// old
    // sky(for dual tuner)
    //xtalCfg.clkOutEnable = (pTuner->usClkOutEnable) ? MXL_ENABLE : MXL_DISABLE;
    xtalCfg.clkOutEnable = MXL_ENABLE;

    xtalCfg.clkOutDiv = MXL_DISABLE;
    xtalCfg.clkOutExt = MXL_DISABLE;
//  xtalCfg.singleSupply_3_3V = MXL_DISABLE; // china
//	xtalCfg.singleSupply_3_3V = MXL_ENABLE;  // old
    xtalCfg.singleSupply_3_3V = MXL_ENABLE;  // sky(ok)
    xtalCfg.XtalSharingMode   = MXL_DISABLE;
    status = MxLWare608_API_CfgDevXtal(devId, xtalCfg);
    MxLWare608_API_CfgTunerLoopThrough(devId, MXL_DISABLE,NULL,NULL);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgtunerloopthrough failuret\n");
        return 1;
    }

    // Step 4 : IF Out setting
//	ifOutCfg.ifOutFreq = MXL608_IF_4_1MHz;
    if (36000000 == uiIFHz)
    {
        ifOutCfg.ifOutFreq = MXL608_IF_36MHz; // old
    }
    else if (36150000 == uiIFHz)
    {
        ifOutCfg.ifOutFreq = MXL608_IF_36_15MHz;
    }
    else
    {
        ifOutCfg.ifOutFreq = MXL608_IF_36_15MHz;
    }
//	ifOutCfg.ifOutFreq = MXL608_IF_5MHz;   // sky(x)

//	ifOutCfg.ifInversion = MXL_DISABLE;
    ifOutCfg.ifInversion = MXL_ENABLE;  // old
    ifOutCfg.ifInversion = MXL_DISABLE; // sky(x)
    ifOutCfg.gainLevel = 11;
    ifOutCfg.manualFreqSet = MXL_DISABLE;
//	ifOutCfg.manualIFOutFreqInKHz = 0;
    if (36000000 == uiIFHz)
    {
        ifOutCfg.manualIFOutFreqInKHz = 36000; // old
    }
    else if (36150000 == uiIFHz)
    {
        ifOutCfg.manualIFOutFreqInKHz = 36150;
    }
    else
    {
        ifOutCfg.manualIFOutFreqInKHz = 36150;
    }
//	ifOutCfg.manualIFOutFreqInKHz = 0; // sky(x)
    status = MxLWare608_API_CfgTunerIFOutParam(devId, ifOutCfg);
    if(status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgtunerifoutparam failuret\n");
        return 1;
    }

    // Step 5 : AGC Setting
    agcCfg.agcType  = MXL608_AGC_EXTERNAL;
    agcCfg.setPoint = 66;
    agcCfg.agcPolarityInverstion = MXL_DISABLE;
    status = MxLWare608_API_CfgTunerAGC(devId, agcCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgtuneragc failuret\n");
        return 1;
    }
    return 0;
}


HI_S32 mxl608_set_tuner(HI_U32 u32TunerPort, HI_U8 i2c_channel, HI_U32 puRF)
{
  MXL_STATUS status; 
  UINT8 devId;
  MXL608_CHAN_TUNE_CFG_T chanTuneCfg;	
  //MXL_BOOL rfLockPtr;
  //MXL_BOOL refLockPtr;
  //MXL608_IF_OUT_CFG_T ifOutCfg;

/* If OEM data is implemented, customer needs to use OEM data structure  
   related operation. Following code should be used as a reference. 
   For more information refer to sections 2.5 & 2.6 of 
   MxL608_mxLWare_API_UserGuide document.

  for (devId = 0; devId < EXAMPLE_DEV_MAX; devId++)
  {
    // assigning i2c address for  the device
    device_context[devId].i2c_address = GET_FROM_FILE_I2C_ADDRESS(devId);     

    // assigning i2c bus for  the device
    device_context[devId].i2c_bus = GET_FROM_FILE_I2C_BUS(devId);                      

    // create semaphore if necessary
    device_context[devId].sem = CREATE_SEM();                                                           

    // sample stat counter
    device_context[devId].i2c_cnt = 0;                                                                               

    status = MxLWare608_API_CfgDrvInit(devId, (void *) &device_context[devId]);  

    // if you donn't want to pass any oem data, just use NULL as a parameter:
    // status = MxLWare608_API_CfgDrvInit(devId, NULL);  
  }

*/

  /* If OEM data is not required, customer should treat devId as 
     I2C slave Address */
  //devId = MXL608_I2C_ADDR;

  memset(&chanTuneCfg, 0, sizeof(chanTuneCfg));
 
 // s_u8MXL608devId = u32TunerPort;
  /* config tuner port */
  MxL608_I2C_SetPort(u32TunerPort);
  /* config i2c channel */
 // g_stTunerOps[u32TunerPort].u32TunerAddress = 0xc0;

  devId = u32TunerPort;//g_stTunerOps[u32TunerPort].u32TunerAddress;
  MxL608_I2C_SetChn(i2c_channel,g_stTunerOps[u32TunerPort].u32TunerAddress);
  
  //Step 7 : Channel frequency & bandwidth setting 
	if((HI_UNF_DEMOD_DEV_TYPE_3137 == g_stTunerOps[u32TunerPort].enDemodDevType)
      ||(HI_UNF_DEMOD_DEV_TYPE_ATBM888X == g_stTunerOps[u32TunerPort].enDemodDevType)
      ||(HI_UNF_DEMOD_DEV_TYPE_MN88473 == g_stTunerOps[u32TunerPort].enDemodDevType)
	  ||(HI_UNF_DEMOD_DEV_TYPE_3138 == g_stTunerOps[u32TunerPort].enDemodDevType))
	{
		switch(g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32BandWidth)
		{
			case 6000:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_6MHz;
				break;
			case 7000:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_7MHz;
				break;
			case 8000:
			default:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
				break;
		}
		chanTuneCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
		chanTuneCfg.xtalFreqSel = MXL608_XTAL_24MHz;
	}
	else if (HI_UNF_DEMOD_DEV_TYPE_J83B == g_stTunerOps[u32TunerPort].enDemodDevType)
	{
		 chanTuneCfg.bandWidth = MXL608_CABLE_BW_6MHz; 
		 chanTuneCfg.signalMode = MXL608_DIG_J83B;
		 chanTuneCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	}
	else if (HI_UNF_DEMOD_DEV_TYPE_AVL6381 == g_stTunerOps[u32TunerPort].enDemodDevType)
	{
		switch(g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32BandWidth)
		{
			case 6000:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_6MHz;
				break;
			case 7000:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_7MHz;
				break;
			case 8000:
			default:
				chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
				break;
		}
		// chanTuneCfg.bandWidth = MXL608_CABLE_BW_6MHz; 
		 chanTuneCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
		 chanTuneCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	}
	else
	{
		 chanTuneCfg.bandWidth = MXL608_CABLE_BW_8MHz;
		 chanTuneCfg.signalMode = MXL608_DIG_DVB_C;	 
		 chanTuneCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	}

  chanTuneCfg.freqInHz = puRF * 1000;
  chanTuneCfg.startTune = MXL_START_TUNE;

 
  status = MxLWare608_API_CfgTunerChanTune(devId, chanTuneCfg);
  if (status != MXL_SUCCESS)
  {
    HI_ERR_TUNER("Error! MxLWare608_API_CfgTunerChanTune\n");
    return HI_FAILURE;
  }
  HI_ERR_TUNER("--> mxl608_set_tuner OK.\n");
  #if 0
  // Wait 15 ms 
  MxLWare608_OEM_Sleep(15);
  
  // Read back Tuner lock status
  status = MxLWare608_API_ReqTunerLockStatus(devId, &rfLockPtr, &refLockPtr);
  if (status == MXL_TRUE)
  {
    if (MXL_LOCKED == rfLockPtr && MXL_LOCKED == refLockPtr)
    {
      HI_INFO_TUNER("----->Tuner locked\n");
    }
    else
    {
      HI_ERR_TUNER("----->Tuner unlocked\n");
    }
  }

  // To Change Channel, GOTO Step #7

  // To change Application mode settings, GOTO Step #6
  #endif
  return 0;
}


typedef enum AVL_Tuner_DTVMode
{
    DTVMode_DVBC  = 0,
    DTVMode_DVBSX = 1,
    DTVMode_DVBTX = 2,
    DTVMode_ISDBT = 3,
    DTVMode_DTMB  = 4,
    DTVMode_ISDBS = 5,
    DTVMode_ABSS  = 6,
    DTVMode_ATSC  = 7,
    DTVMode_DVBC2 = 8
} AVL_Tuner_DTVMode;

HI_S32 mxl608_set_tuner2(HI_U32 u32TunerPort, HI_U8 i2c_channel, HI_U32 puRF,HI_U32 eDTVMode,HI_U32 uiIFHz,HI_U32 uiBandwidthHz)
{
    MXL608_TUNER_MODE_CFG_T tunerModeCfg;
    MXL608_CHAN_TUNE_CFG_T  chanTuneCfg;
    MXL_STATUS status;
    UINT8 devId;

    memset(&chanTuneCfg, 0, sizeof(chanTuneCfg));

   // s_u8MXL608devId = u32TunerPort;
    /* config tuner port */
    MxL608_I2C_SetPort(u32TunerPort);
    /* config i2c channel */
   // g_stTunerOps[u32TunerPort].u32TunerAddress = 0xc0;

    devId = u32TunerPort;//g_stTunerOps[u32TunerPort].u32TunerAddress;
    MxL608_I2C_SetChn(i2c_channel,g_stTunerOps[u32TunerPort].u32TunerAddress);

    HI_ERR_TUNER("    Mxl608T_tune{%d}{%8d,%4d}{%d}\n",
            devId,
            puRF,
            uiBandwidthHz,
            eDTVMode);

    // Step 6 : Application Mode setting
    if (eDTVMode == DTVMode_DVBC)
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_C;
    }
    else if (eDTVMode == DTVMode_DVBTX)
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
    }
    else if (eDTVMode == DTVMode_ISDBT)
    {
        tunerModeCfg.signalMode = MXL608_DIG_ISDBT_ATSC;
    }
    else
    {
        tunerModeCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
    }
//	tunerModeCfg.ifOutFreqinKHz = 4100;
    if (36000000 == uiIFHz)
    {
        tunerModeCfg.ifOutFreqinKHz = 36000; // old
    }
    else if (36150000 == uiIFHz)
    {
        tunerModeCfg.ifOutFreqinKHz = 36150;
    }
    else
    {
        tunerModeCfg.ifOutFreqinKHz = 36150;
    }
//	tunerModeCfg.ifOutFreqinKHz = 5000;	// sky(x)
	#ifdef xtal_24
    tunerModeCfg.xtalFreqSel = MXL608_XTAL_24MHz;//MXL608_XTAL_16MHz; zhaobaoren
	#else
	tunerModeCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	#endif
    tunerModeCfg.ifOutGainLevel = 11;
    status = MxLWare608_API_CfgTunerMode(devId, tunerModeCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgtunermode failuret\n");
        return 1;
    }

    if (eDTVMode == DTVMode_DVBC)//AVL_DEMOD_MODE_DVBC)
    {
        chanTuneCfg.signalMode = MXL608_DIG_DVB_C;
        if (uiBandwidthHz == 0)
        {
            chanTuneCfg.bandWidth = MXL608_CABLE_BW_8MHz;
        }
        else if (uiBandwidthHz <= 6000000)
        {
            chanTuneCfg.bandWidth = MXL608_CABLE_BW_6MHz;
        }
        else if (uiBandwidthHz > 6000000 && uiBandwidthHz <= 7000000)
        {
            chanTuneCfg.bandWidth = MXL608_CABLE_BW_7MHz;
        }
        else if (uiBandwidthHz > 7000000 && uiBandwidthHz <= 8000000)
        {
            chanTuneCfg.bandWidth = MXL608_CABLE_BW_8MHz;
        }
        else
        {
            chanTuneCfg.bandWidth = MXL608_CABLE_BW_8MHz;
        }
    }
    else if (eDTVMode == DTVMode_ATSC || eDTVMode == DTVMode_ISDBT)//AVL_DEMOD_MODE_ISDBT)
    {
        chanTuneCfg.signalMode = MXL608_DIG_ISDBT_ATSC;
        if (uiBandwidthHz <= 6000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_6MHz;
        }
        else if (uiBandwidthHz > 6000000 && uiBandwidthHz <= 7000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_7MHz;
        }
        else if (uiBandwidthHz > 7000000 && uiBandwidthHz <= 8000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
        }
        else
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
        }
    }
    else
    {
        chanTuneCfg.signalMode = MXL608_DIG_DVB_T_DTMB;
        if (uiBandwidthHz == 0)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
        }
        else if (uiBandwidthHz == 1700000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_1_7MHz;
        }
        else if (uiBandwidthHz == 5000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_5MHz;
        }
        else if (uiBandwidthHz == 6000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_6MHz;
        }
        else if (uiBandwidthHz > 6000000 && uiBandwidthHz <= 7000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_7MHz;
        }
        else if (uiBandwidthHz > 7000000 && uiBandwidthHz <= 8000000)
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
        }
        else
        {
            chanTuneCfg.bandWidth = MXL608_TERR_BW_8MHz;
        }
    }

    chanTuneCfg.freqInHz = puRF; // Unit:Hz
	#ifdef xtal_24
    chanTuneCfg.xtalFreqSel = MXL608_XTAL_24MHz;//MXL608_XTAL_16MHz;zhaobaoren
	#else
	chanTuneCfg.xtalFreqSel = MXL608_XTAL_16MHz;
	#endif
    chanTuneCfg.startTune   = MXL_START_TUNE;
    status = MxLWare608_API_CfgTunerChanTune(devId, chanTuneCfg);
    if (status != MXL_SUCCESS)
    {
        HI_ERR_TUNER("Mxl608::cfgtunerchantune failuret\n");
        return 1;
    }
// 	MxLWare608_OEM_Sleep(15);//new

    return 0;
}


#define MXL608_MIN_RSSI	10
#define MXL608_MAX_RSSI	110

HI_S32 mxl608_get_signal_strength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    MXL_STATUS status;
    UINT16 nRSSI = 0;
    UINT16 sDBRatio = 0;
    UINT8  devId;

    devId  = u32TunerPort;
    status = MxLWare608_API_ReqTunerRxPower(devId, &nRSSI);
    if (status != MXL_SUCCESS) return 1;
//  *power = (AVL_int32)nRSSI/100;
    nRSSI  = abs(nRSSI);
    nRSSI /= 100;
// 	HI_INFO_TUNER("Mxl608::nRSSI=%d\n", nRSSI);
    if (nRSSI > MXL608_MAX_RSSI) nRSSI = MXL608_MAX_RSSI;
    if (nRSSI < MXL608_MIN_RSSI) nRSSI = MXL608_MIN_RSSI;
    sDBRatio = nRSSI - MXL608_MIN_RSSI;
    *pu32SignalStrength = 100 - (100 * sDBRatio / (MXL608_MAX_RSSI-MXL608_MIN_RSSI));
    return 0;
}


HI_S32 mxl608_get_signal_strength2(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    MXL_STATUS status;
    UINT16 nRSSI = 0;
    UINT16 sDBRatio = 0;
    UINT8  devId;

    devId  = u32TunerPort;
    status = MxLWare608_API_ReqTunerRxPower(devId, &nRSSI);
    if (status != MXL_SUCCESS) return 1;
//  *power = (AVL_int32)nRSSI/100;
    nRSSI  = abs(nRSSI);
    nRSSI /= 100;
// 	HI_INFO_TUNER("Mxl608::nRSSI=%d\n", nRSSI);
    if (nRSSI > MXL608_MAX_RSSI) nRSSI = MXL608_MAX_RSSI;
    if (nRSSI < MXL608_MIN_RSSI) nRSSI = MXL608_MIN_RSSI;
    sDBRatio = nRSSI - MXL608_MIN_RSSI;
    *pu32SignalStrength = 100 - (100 * sDBRatio / (MXL608_MAX_RSSI-MXL608_MIN_RSSI));
    return 0;
}


HI_VOID mxl608_tuner_resume(HI_U32 u32TunerPort)
{
    mxl608_init_tuner(u32TunerPort);
 
    return;
}

HI_S32 mxl608_GetLockStatus(HI_U32 u32TunerPort) //zhaobaoren
{
    MXL_BOOL refLockPtr = MXL_UNLOCKED;
    MXL_BOOL rfLockPtr  = MXL_UNLOCKED;
    MXL_STATUS status;

    status = MxLWare608_API_ReqTunerLockStatus(u32TunerPort, &rfLockPtr, &refLockPtr);
    if (status != MXL_SUCCESS) return 0;
    if (MXL_LOCKED == rfLockPtr && MXL_LOCKED == refLockPtr)
    {
        return 1;
    }
    return 0;
}










