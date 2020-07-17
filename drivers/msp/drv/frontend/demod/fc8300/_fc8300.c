#include <linux/delay.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <linux/time.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/kthread.h>
#include <asm/io.h>

#include "hi_kernel_adapt.h"

#include "drv_tuner_ioctl.h"

#include "fc8300_regs.h"
#include "fci_types.h"
#include "bbm.h"
#include "fci_tun.h"

static unsigned int fc8300_I2cBus = 2;
struct semaphore fc8300_sem;

DEVICEID getTunerDeviceID(HI_U32 u32TunerPort)
{	
	if(u32TunerPort == 0) return DIV_MASTER;
	else if(u32TunerPort == 1) return DIV_MASTER+0x100;
	else if(u32TunerPort == 2) return DIV_MASTER+0x200;
	else if(u32TunerPort == 3) return DIV_MASTER+0x300;		

	return DIV_MASTER;
}

HI_S32 _fc8300_init(HI_U32 u32TunerPort, HI_U8 enI2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerDevType)
{
	HI_S32 Ret;
	HI_INIT_MUTEX(&fc8300_sem);
	Ret=down_interruptible(&fc8300_sem);
	fc8300_I2cBus = enI2cChannel;
	//printk("ISDBT DEBUG : %s [%d] u32TunerPort=0x%x\n",__FUNCTION__,__LINE__,u32TunerPort);
	bbm_com_i2c_init(fc8300_I2cBus, FCI_HPI_TYPE);
    bbm_com_init(fc8300_I2cBus, getTunerDeviceID(u32TunerPort));
    bbm_com_tuner_select(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), FC8300B_TUNER, ISDBT_13SEG);
    up(&fc8300_sem);
    return HI_SUCCESS;
}

HI_S32 _fc8300_connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
	HI_S32 Ret;
	//printk("ISDBT DEBUG : %s [%d] FREQ = %d\n",__FUNCTION__,__LINE__,pstChannel->u32Frequency);	
	Ret=down_interruptible(&fc8300_sem);
	//printk("ISDBT DEBUG : START : u32TunerPort=%d, FREQ = %d\n",u32TunerPort,pstChannel->u32Frequency);	
	bbm_com_tuner_set_freq(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), pstChannel->u32Frequency, 0x16);
	if(bbm_com_scan_status(fc8300_I2cBus, getTunerDeviceID(u32TunerPort)) == 0)	
	{
		//printk("LOCK OK : %s [%d]\n",__FUNCTION__,__LINE__);
	}
	else
	{
		//printk("LOCK FAIL : %s [%d]\n",__FUNCTION__,__LINE__);
	}
	//printk("ISDBT DEBUG : END : u32TunerPort=%d, FREQ = %d\n",u32TunerPort,pstChannel->u32Frequency);	
	up(&fc8300_sem);

	return HI_SUCCESS;
}

HI_S32 _fc8300_get_status (HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E  *penTunerStatus)
{
	HI_S32 Ret;
	HI_U8 demod_lock = 0;
	HI_U8 err_free = 0;
	
	Ret=down_interruptible(&fc8300_sem);
	bbm_com_byte_read(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), 0x3026, &demod_lock);
	bbm_com_byte_read(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), 0x50C5, &err_free);

	//printk("%s [%d] : demod_lock=0x%x, err_free=0x%x\n",__FUNCTION__,__LINE__,demod_lock,err_free);
	
	//if((demod_lock & 0x04) && (err_free & 0x8))
	if(demod_lock & 0x04)
	{
		*penTunerStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
	}
	else
	{
		//printk("%s [%d] : demod_lock=0x%x, err_free=0x%x\n",__FUNCTION__,__LINE__,demod_lock,err_free);
		*penTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
	}
	up(&fc8300_sem);
	return HI_SUCCESS;
}

HI_S32 _fc8300_get_signal_strength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
	HI_S32 Ret;
//	int res;
	HI_S32 rssi = -120;
	
	Ret=down_interruptible(&fc8300_sem);
	bbm_com_tuner_get_rssi(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), &rssi);

//	printk("SIGNAL Strength (RSSI) = %d\n",rssi);
	if(rssi < -100)
	{
		rssi = -100;
	}

	rssi = rssi + 100;

	if(rssi > 100)
		rssi = 100;
	
   	pu32SignalStrength[1] = (HI_U32)rssi;
   	up(&fc8300_sem);
    return HI_SUCCESS;
}

HI_S32 _fc8300_get_snr(HI_U32 u32TunerPort, HI_U32* pu32SNR)
{
	HI_S32 Ret;

	HI_U32 err_bits = 0, rxd_rsps = 0; //, err_rsps = 0 ;
	HI_U32 viterbi_ber; //, rs_per, demap_ber;
	HI_S32 quality_val = 0;

	Ret=down_interruptible(&fc8300_sem);

	bbm_com_write(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), BBM_BER_REQ, 0x0e);

	bbm_com_long_read(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), BBM_BER_ERR_BITS, &err_bits);
	//bbm_com_word_read(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), BBM_BER_ERR_RSPS, (HI_U16*) &err_rsps);
	bbm_com_word_read(fc8300_I2cBus, getTunerDeviceID(u32TunerPort), BBM_BER_RXD_RSPS, (HI_U16*) &rxd_rsps);
#if 0
	if (rxd_rsps) {
		viterbi_ber = ((double)err_bits / (204.*8.*(double)rxd_rsps)) * 10000.;
		rs_per = ((double)err_rsps / (double)rxd_rsps) * 10000.;
	} else {
		viterbi_ber = 10000;
		rs_per = 10000;
	}
#else
	if(err_bits > 214748) // 0x7fffffff - 10000 = 214748 : size of 'int'
		err_bits = 214748;

	if(err_bits == 0) // kernel warning : Division by zero in kernel
		viterbi_ber = 0;
	else
		viterbi_ber = (err_bits * 10000) / (1632*rxd_rsps); // 204*8 = 1632

	if(viterbi_ber > 220) // all error : 220
		quality_val = 0;
	else if(viterbi_ber == 0) // kernel warning : Division by zero in kernel
		quality_val = 100;
	else
		quality_val = (HI_S32)(100 - ((HI_S32)viterbi_ber*100/220));

	*pu32SNR = (HI_U32)quality_val;
#endif
	up(&fc8300_sem);
    return HI_SUCCESS;
}

HI_S32 _fc8300_get_ber(HI_U32 u32TunerPort, HI_U32 *pu32ber)
{
	HI_S32 Ret;
    HI_U8  u8Val = 0;

	Ret=down_interruptible(&fc8300_sem);

    pu32ber[0] = u8Val;
    pu32ber[1] = u8Val;
    pu32ber[2] = u8Val;
	up(&fc8300_sem);
	return HI_SUCCESS;
}

HI_S32 _fc8300_set_ts_type(HI_U32 u32TunerPort, HI_UNF_TUNER_OUPUT_MODE_E enTsType)
{
	HI_S32 Ret;
	Ret=down_interruptible(&fc8300_sem);
    g_stTunerOps[u32TunerPort].enTsType = enTsType;
    up(&fc8300_sem);
    return HI_SUCCESS;
}

HI_VOID _fc8300_connect_timeout(HI_U32 u32ConnectTimeout)
{
    return;
}


