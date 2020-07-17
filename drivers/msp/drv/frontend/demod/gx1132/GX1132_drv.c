#include <linux/delay.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <linux/time.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/kthread.h>
#include <asm/io.h>

#include "hi_type.h"

#include "drv_i2c_ext.h"
#include "drv_gpioi2c_ext.h"
#include "drv_gpio_ext.h"
#include "hi_drv_gpioi2c.h"
#include "hi_debug.h"

#include "hi_drv_stat.h"
#include "hi_drv_dev.h"
#include "hi_drv_reg.h"
#include "hi_kernel_adapt.h"
#include "hi_drv_proc.h"

#include "drv_tuner_ext.h"
#include "drv_tuner_ioctl.h"
#include "hi_drv_diseqc.h"
#include "drv_demod.h"

#include "hi_error_mpi.h"
#include "hi_drv_sys.h"
#include "hi_unf_i2c.h"



#if 1

#include "GX1132.h"

HI_S32 gx1132_init(HI_U32 u32TunerPort, HI_U8 enI2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerDevType)
{
	bool r;
	
    //This function do all the initialization work.It should be called only once at the beginning.It needn��t be recalled when we want to lock a new channel.
	r=GX1132_Init_Chip(enI2cChannel);
	if(r != SUCCESS)
	{
		printk("GX1132 (DVB-S2) : Tuner Init FAIL !!!\n");
		return HI_FAILURE;
	}
	
	printk("GX1132 (DVB-S2) : Tuner Init OK - TunerPort = %d, i2cIndex=%d !\n", u32TunerPort, enI2cChannel);
	printk("GX1132 (DVB-S2) : Chip ID = %04x\n", GX1132_Get_Chip_ID());
	
    return HI_SUCCESS;
}

HI_S32 gx1132_connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    //HI_U32 u32I2cPort;
	GX1132_TP gTP;
	bool r;
	
	//u32I2cPort = g_stTunerOps[u32TunerPort].enI2cChannel;
	
	gTP.Freq_KHz = pstChannel->u32Frequency;
	gTP.SymRate_KSps = pstChannel->unSRBW.u32SymbolRate / 1000;

	printk("%s : tunerId %d, Freq %d, Symbol %d\n",__FUNCTION__, u32TunerPort, gTP.Freq_KHz, gTP.SymRate_KSps);

	r = GX1132_Search_Signal(u32TunerPort, gTP, GX1132_set_tuner);
	printk("GX1132_Search_Signal return value (%d)\n",r);
	if(r != TP_LOCK)
	{
		return false;
	}

    return HI_SUCCESS;

}

HI_S32 gx1132_get_status (HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E  *penTunerStatus)
{
    HI_S32 i = 0;

    //HI_ASSERT(HI_NULL != penTunerStatus);
    //X5HDQAMV200_I2C_CHECK(u32TunerPort);
    for (i = 0; i < 4; i++)  /*prevent twittering*/
    {
        if (GX1132_Read_Lock_Status() == FEC_LOCKED)
        {
            *penTunerStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
            break;
        }
        else
        {
            *penTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
        }
    }

    return HI_SUCCESS;
}

HI_S32 gx1132_get_signal_strength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
	pu32SignalStrength[1] = (int)GX1132_Get_Signal_Strength();
    return HI_SUCCESS;
}

HI_S32 gx1132_get_snr(HI_U32 u32TunerPort, HI_U32* pu32SNR)
{
    *pu32SNR = GX1132_Get_Signal_Quality();
    return HI_SUCCESS;
}

HI_S32 gx1132_get_ber(HI_U32 u32TunerPort, HI_U32 *pu32ber)
{
    //HI_U32 u32BerThres = 4; /* modify by chenxu 2008-01-15 AI7D02092 */
//    HI_U8  u8Temp	= 0;
    HI_U8  u8Val = 0;
//    HI_S32 i = 0;

    //HI_ASSERT(HI_NULL != pu32ber);
    //X5HDQAMV200_I2C_CHECK(u32TunerPort);

    pu32ber[0] = u8Val;
    pu32ber[1] = u8Val;
    pu32ber[2] = u8Val;

	return HI_SUCCESS;
}

HI_S32 gx1132_set_ts_type(HI_U32 u32TunerPort, HI_UNF_TUNER_OUPUT_MODE_E enTsType)
{
    g_stTunerOps[u32TunerPort].enTsType = enTsType;
    return HI_SUCCESS;
}

HI_S32 gx1132_get_freq_symb_offset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb)
{
//    HI_S16 s16FreqOffset;

    HI_ASSERT(HI_NULL != pu32Freq);
    HI_ASSERT(HI_NULL != pu32Symb);

    /* Convert 100kHz to kHz, s16 to u32 */
    *pu32Freq = 0;

    /* Don't support get symbol rate offset now. */
    *pu32Symb = 0;

    return HI_SUCCESS;
}

HI_S32 gx1132_get_signal_info(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
#if 0

    HI_UNF_TUNER_FE_FECTYPE_E aenFECType[] =
    {
        HI_UNF_TUNER_FE_DVBS,  HI_UNF_TUNER_FE_DVBS,  HI_UNF_TUNER_FE_DVBS,
        HI_UNF_TUNER_FE_DVBS,  HI_UNF_TUNER_FE_DVBS,  HI_UNF_TUNER_FE_DVBS,
        HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2,
        HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2,
        HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2,
        HI_UNF_TUNER_FE_DVBS2, HI_UNF_TUNER_FE_DVBS2
    };
    HI_UNF_TUNER_FE_FECRATE_E aenFECRate[] =
    {
        HI_UNF_TUNER_FE_FEC_1_2, HI_UNF_TUNER_FE_FEC_2_3, HI_UNF_TUNER_FE_FEC_3_4,
        HI_UNF_TUNER_FE_FEC_5_6, HI_UNF_TUNER_FE_FEC_6_7, HI_UNF_TUNER_FE_FEC_7_8,
        HI_UNF_TUNER_FE_FEC_1_4, HI_UNF_TUNER_FE_FEC_1_3, HI_UNF_TUNER_FE_FEC_2_5,
        HI_UNF_TUNER_FE_FEC_1_2, HI_UNF_TUNER_FE_FEC_3_5, HI_UNF_TUNER_FE_FEC_2_3,
        HI_UNF_TUNER_FE_FEC_3_4, HI_UNF_TUNER_FE_FEC_4_5, HI_UNF_TUNER_FE_FEC_5_6,
        HI_UNF_TUNER_FE_FEC_8_9, HI_UNF_TUNER_FE_FEC_9_10
    };

    HI_ASSERT(HI_NULL != pstInfo);

	r = AVL_DVBSx_IRx_GetSignalInfo(&SignalInfo, pAVLChip);
    if (AVL_DVBSx_EC_OK != r)
    {
        HI_ERR_TUNER("Get SignalInfo Fail !\n");
        return HI_FAILURE;
    }

    pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_SAT;
    switch (SignalInfo.m_modulation)
    {
    case AVL_DVBSx_MM_QPSK:
        pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_QPSK;
        break;
    case AVL_DVBSx_MM_8PSK:
        pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_8PSK;
        break;
    case AVL_DVBSx_MM_16APSK:
        pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_16APSK;
        break;
    case AVL_DVBSx_MM_32APSK:
        pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_32APSK;
        break;
    default:
        return HI_FAILURE;
    }

    /* Convert SignalInfo.m_coderate to UNF FEC Type */
    pstInfo->unSignalInfo.stSat.enSATType = aenFECType[SignalInfo.m_coderate];

    /* Convert SignalInfo.m_coderate to UNF FEC Rate */
    pstInfo->unSignalInfo.stSat.enFECRate = aenFECRate[SignalInfo.m_coderate];
#endif

    return HI_SUCCESS;
}

HI_S32 gx1132_blindscan_init(HI_U32 u32TunerPort, TUNER_BLINDSCAN_INITPARA_S *pstPara)
{
    return HI_SUCCESS;
}

HI_S32 gx1132_blindscan_action(HI_U32 u32TunerPort, TUNER_BLINDSCAN_PARA_S *pstPara)
{
    return HI_SUCCESS;
}

HI_S32 gx1132_set_funcmode(HI_U32 u32TunerPort, TUNER_FUNC_MODE_E enFuncMode)
{
    switch (enFuncMode)
    {
    case FunctMode_BlindScan:
        //r = AVL_DVBSx_IBase_SetFunctionalMode(pAVLChip, AVL_DVBSx_FunctMode_BlindScan);
        break;

    case FunctMode_Demod:
        //r = AVL_DVBSx_IBase_SetFunctionalMode(pAVLChip, AVL_DVBSx_FunctMode_Demod);
        break;

    default:
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 gx1132_send_continuous_22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K)
{

    if (0 == u32Continuous22K)
    {
        //r = AVL_DVBSx_IDiseqc_StopContinuous(&pstParam->stAVLChip);
		GX1132_22K_sw(0); 
    }
    else
    {
        //r = AVL_DVBSx_IDiseqc_StartContinuous(&pstParam->stAVLChip);
		GX1132_22K_sw(1); 
    }

    return HI_SUCCESS;
}

HI_S32 gx1132_send_tone(HI_U32 u32TunerPort, HI_U32 u32Tone)
{
	GX1132_SendTone(u32Tone);
    return HI_SUCCESS;
}

HI_S32 gx1132_DiSEqC_send_msg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_SENDMSG_S *pstSendMsg)
{
    GX1132_SendDiseqc(pstSendMsg->au8Msg, pstSendMsg->u8Length);
    return HI_SUCCESS;
}

HI_S32 gx1132_DiSEqC_recv_msg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_RECVMSG_S *pstRecvMsg)
{
    return HI_SUCCESS;
}

HI_S32 gx1132_standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{

#if 0
    if (0 == u32Standby)
    {
        return ConvertError(AVL_DVBSx_IBase_Wake(&pstParam->stAVLChip));
    }
    else
    {
        return ConvertError(AVL_DVBSx_IBase_Sleep(&pstParam->stAVLChip));
    }
#endif
	return HI_SUCCESS;

}

HI_S32 gx1132_disable(HI_U32 u32TunerPort, HI_U32 u32Disable)
{
#if 0

    if (0 == u32Disable)
    {
        return ConvertError(AVL_DVBSx_IRx_DriveMpegOutput(&pstParam->stAVLChip));
    }
    else
    {
        return ConvertError(AVL_DVBSx_IRx_ReleaseMpegOutput(&pstParam->stAVLChip));
    }
#endif
		return HI_SUCCESS;

}


#endif






