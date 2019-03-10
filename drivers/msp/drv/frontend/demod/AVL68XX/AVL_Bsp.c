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
#include <linux/delay.h>
#include "hi_kernel_adapt.h"
#include "hi_type.h"
#include "hi_drv_i2c.h"
#include "hi_drv_gpioi2c.h"
#include "AVL_Demod.h"

AVL_uint32 AVL_IBSP_Reset(void)
{
    return(0);
}

AVL_uint32 AVL_IBSP_Delay(AVL_uint32 uiDelay_ms)
{
	msleep_interruptible(uiDelay_ms);
    return(0);
}

AVL_uint32 AVL_IBSP_I2C_Read (AVL_uint16 uiSlaveBus, AVL_uint16 usSlaveAddr, AVL_puchar pucBuff, AVL_puint16 pusSize)
{
	AVL_uint16 usSize = *pusSize;
    int ret = 0;

	if (!pucBuff) return 0;
	if (!pusSize) return 0;
    if (HI_STD_I2C_NUM > uiSlaveBus)
    {
        ret = HI_DRV_I2C_ReadDirectly(uiSlaveBus, usSlaveAddr, 0, 0, pucBuff, usSize);
   	}
    else
    {
        ret = HI_DRV_GPIOI2C_ReadExtDirectly(uiSlaveBus, usSlaveAddr, 0, 0, pucBuff, usSize);
   	}
    if (ret != HI_SUCCESS)
    {
        HI_INFO_TUNER("Avl68xx::failure I2CR{%d,%02x}{%x}\n", uiSlaveBus, usSlaveAddr, ret);
    }
    return ((ret == HI_SUCCESS) ? AVL_EC_OK : AVL_EC_I2C_FAIL);
}

AVL_uint32 AVL_IBSP_I2C_Write(AVL_uint16 uiSlaveBus, AVL_uint16 usSlaveAddr, AVL_puchar pucBuff, AVL_puint16 pusSize)
{
	AVL_uint16 usSize = *pusSize;
    int ret = 0;

	if (!pucBuff) return 0;
	if (!pusSize) return 0;
    if (HI_STD_I2C_NUM > uiSlaveBus)
    {
        ret = HI_DRV_I2C_Write(uiSlaveBus, usSlaveAddr, 0, 0, pucBuff, usSize);
   	}
    else
    {
        ret = HI_DRV_GPIOI2C_WriteExt(uiSlaveBus, usSlaveAddr, 0, 0, pucBuff, usSize);
    }
    if (ret != HI_SUCCESS)
    {
        HI_INFO_TUNER("Avl68xx::failure I2CW{%d,%02x}{%x}\n", uiSlaveBus, usSlaveAddr, ret);
    }
    return ((ret == HI_SUCCESS) ? AVL_EC_OK : AVL_EC_I2C_FAIL);
}

AVL_uint32 AVL_IBSP_Initialize(void)
{
    return(0);
}

AVL_uint32 AVL_IBSP_InitSemaphore(AVL_psemaphore pSemaphore)
{
	HI_INIT_MUTEX(pSemaphore);
    return(0);
}

AVL_uint32 AVL_IBSP_ReleaseSemaphore(AVL_psemaphore pSemaphore)
{
	up(pSemaphore);
    return(0);
}

AVL_uint32 AVL_IBSP_WaitSemaphore(AVL_psemaphore pSemaphore)
{
	if (0 != down_interruptible(pSemaphore))
	{
        return 1;
    }
    return(0);
}

AVL_uint32 AVL_IBSP_Dispose(void)
{
    return(0);
}


