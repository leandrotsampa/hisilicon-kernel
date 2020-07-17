/*******************************************************************************
*                          CONFIDENTIAL                                                                                         
*        Hangzhou NationalChip Science and Technology Co., Ltd.                                               
*                      (C)2011, All right reserved                                                                            
********************************************************************************

********************************************************************************
* File Name	 :   	GX1132.c                                                                                                 
* Author		 :     Jerome Lou                                                                                                 
* Project    	 :   	GXAPI 
* Type      	 :     Driver
********************************************************************************
* Purpose   :   GX1132  driver
********************************************************************************
* Release History:
* VERSION   Date              AUTHOR          Description
*    1.0      2011.6.23        Jerome Lou      Original version   
********************************************************************************
*Abbreviation
*   GX		--	GUOXIN 
*   RF		--  radiate frequency
*   SNR		--	signal to noise ratio
*   OSC		--	oscillate
*   SPEC		--	spectrum
*   FREQ		--	frequency
********************************************************************************/
#include <linux/delay.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <linux/time.h>
#include <linux/module.h>
#include <asm/io.h>
#include <linux/kthread.h>
	
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
//#include <math.h>
//#include <stdlib.h>
//#include <stdio.h>

#define gx_abs(a) ((a) >= 0 ? (a) : -(a))

char gStr_driver_version[]="GX1132 V1.0 Build20110623";
static unsigned char gIQ_swap = 0;
static int dat[32];
//static GX1132_BCS_TYPE sg_BSType = {0};

#if TUNER_AV2011
extern GX1132_STATE GX_Av2011_GetLockStatus(void);
#endif

static unsigned int hiI2CNUM  = 2;

static unsigned char EnableTunerAV2011 = 1;


int WriteValue( int chipaddr, int regaddr, unsigned char *data, int data_count)
{
	//boolean ret;
	//ret = iicWriteMultiReg((UINT8)chipaddr, (UINT8)regaddr, data, (UINT8)data_count, 0);
	//return ret;
	HI_S32 s32Ret = HI_SUCCESS;	

	s32Ret = HI_DRV_I2C_Write(hiI2CNUM, chipaddr, (HI_U32)regaddr,1, data, data_count);
    if(HI_SUCCESS != s32Ret)
	{
		printk("[GX1132] WriteValue Error : gpio_i2c_write_ext(chip=%x, reg=%x) : data = %x, ret = %d\n", chipaddr, regaddr, data[0], s32Ret);
		return FAILURE;
	}
	return SUCCESS;
	
}

int ReadValue( int chipaddr, int regaddr, unsigned char *data, int data_count)
{
	//boolean ret;
	//ret = iicReadMultiReg((UINT8)chipaddr, (UINT8)regaddr, data, (UINT8)data_count, 0);
	//return ret;
	HI_S32 s32Ret = HI_SUCCESS;

	s32Ret = HI_DRV_I2C_Read(hiI2CNUM, chipaddr, (HI_U32)regaddr, 1, data, data_count);
    if(HI_SUCCESS != s32Ret)
    {
    	printk("[GX1132] ReadValue Error : gpio_i2c_read_ext(chip=%x, reg=%x) : data = %x, ret = %d\n", chipaddr, regaddr, data[0], s32Ret);
		return FAILURE;
    }
    return SUCCESS;
	
}

int WriteValue2( int chipaddr, int regaddr, unsigned char *data, int data_count)
{
//	boolean ret;
	UINT8 data_tmp[64]={0};
	HI_S32 s32Ret = HI_SUCCESS;

	int i;
	data_tmp[0] = regaddr;
	for(i=0;i<data_count;i++)
	{
		data_tmp[i+1]=data[i];
	}

	s32Ret = HI_DRV_I2C_Write(hiI2CNUM, chipaddr, 0, 0, data_tmp, data_count+1);
    if(HI_SUCCESS != s32Ret)
	{
		printk("[GX1132] WriteValue2 Error : gpio_i2c_write_ext(chip=%x, reg=%x) : data = %x, ret = %d\n", chipaddr, regaddr, data[0], s32Ret);
		return FAILURE;
	}
	return SUCCESS;
}

int ReadValue2( int chipaddr, int regaddr, unsigned char *data, int data_count)
{
//	boolean ret;
	UINT8 data_tmp[64]={0};
	int i;
	HI_S32 s32Ret = HI_SUCCESS;
	
	data_tmp[0] = regaddr;
	s32Ret = HI_DRV_I2C_Write(hiI2CNUM, chipaddr, 0, 0, data_tmp, 1);	
	s32Ret |= HI_DRV_I2C_Read(hiI2CNUM, chipaddr, 0, 0, data_tmp, data_count);

	for(i=0;i<data_count;i++)
	{
		data[i]=data_tmp[i];
	}

	if(HI_SUCCESS != s32Ret)
	{
		printk("[GX1132] ReadValue2 Error : gpio_i2c_write_ext(chip=%x, reg=%x) : data = %x, ret = %d\n", chipaddr, regaddr, data[0], s32Ret);
		return FAILURE;
	}
	return SUCCESS;
}

/******************************************************************************
*Function:	Delay N ms
*Input:		
*       ms_value - delay time (ms)
*******************************************************************************/
/*void GX_Delay_N_ms(unsigned int ms_value)
{
	//TODO:User must add the delay function
	return 1;
}*/
/******************************************************************************
*Function:	IIC BUS Write and Read function
*Input:	
*	WR_flag		-- 1: Write, 0: Read
*	ChipAddress	-- Chip Address
*	RegAddress   -- Write or Read register address
*	*data		-- the pointer of write or read data
*	data_number  -- the data number to be read or written
*Output:	
*        SUCCESS : return 1  , *data = Read_value ( only available when read operation )
*        FAILURE : return -1
*******************************************************************************/
/*GX1132_STATE GX_I2cReadWrite(unsigned char WR_flag, unsigned char ChipAddress,unsigned char RegAddress,unsigned char *data, unsigned char data_number)
{
	//TODO:User must add the IIC BUS Write and Read function
	return SUCCESS;
}*/

/******************************************************************************
*Function:	Delay N ms
*Input:		
*       ms_value - delay time (ms)
*******************************************************************************/
void GX_Delay_N_ms(unsigned int ms_value)
{
	//_sleep(ms_value);
	msleep_interruptible(ms_value);

}

/******************************************************************************
*Function:	IIC BUS Write and Read function
*Input:	
*	WR_flag		-- 1: Write, 0: Read
*	ChipAddress	-- Chip Address
*	RegAddress   -- Write or Read register address
*	*data		-- the pointer of write or read data
*	data_number  -- the data number to be read or written
*Output:	
*        SUCCESS : return 1  , *data = Read_value ( only available when read operation )
*        FAILURE : return -1
*******************************************************************************/
unsigned char GX_I2cReadWrite(unsigned char WR_flag, unsigned char ChipAddress,unsigned char RegAddress,unsigned char *data, unsigned char data_number)
{
	//SetPort(0xDFF0);
	unsigned char data_tmp[64]={0};
	unsigned char i;
	//Convert unsigned char data array to unsigned int because of ReadValue and WriteValue functions definition
	if (WR_flag==0)
		{
			if(ReadValue(ChipAddress, RegAddress, data_tmp, data_number)==0) return FAILURE;
			//if(ReadValue(ChipAddress, RegAddress, data_tmp, data_number, 8, 0)==0) return FAILURE;
			for(i=0;i<data_number;i++)
				{
					data[i]=(unsigned char)data_tmp[i];
				}
		}
	else if (WR_flag==1)	
		{
			for(i=0;i<data_number;i++)
				{
					data_tmp[i]=data[i];
				}
			if(WriteValue(ChipAddress, RegAddress, data_tmp, data_number)==0) return FAILURE;
			//if(WriteValue(ChipAddress, RegAddress, data_tmp, data_number, 8)==0) return FAILURE;
		}
	
	return SUCCESS;
}


unsigned char GX_I2cReadWrite2(unsigned char WR_flag, unsigned char ChipAddress,unsigned char RegAddress,unsigned char *data, unsigned char data_number)
{
	//SetPort(0xDFF0);
	unsigned char data_tmp[64]={0};
	unsigned char i;
	//Convert unsigned char data array to unsigned int because of ReadValue and WriteValue functions definition
	if (WR_flag==0)
		{
			if(ReadValue2(ChipAddress, RegAddress, data_tmp, data_number)==0) return FAILURE;
			//if(ReadValue(ChipAddress, RegAddress, data_tmp, data_number, 8, 0)==0) return FAILURE;
			for(i=0;i<data_number;i++)
				{
					data[i]=(unsigned char)data_tmp[i];
				}
		}
	else if (WR_flag==1)	
		{
			for(i=0;i<data_number;i++)
				{
					data_tmp[i]=data[i];
				}
			if(WriteValue2(ChipAddress, RegAddress, data_tmp, data_number)==0) return FAILURE;
			//if(WriteValue(ChipAddress, RegAddress, data_tmp, data_number, 8)==0) return FAILURE;
		}
	
	return SUCCESS;
}

/******************************************************************************
*Function:	Get the driver version of GX1132
*output:		
*       	return the driver version of GX1132
*******************************************************************************/
char *GX1132_Get_Driver_Version(void)
{
	return gStr_driver_version;
}

/*******************************************************************************
*Function: Write one byte to chip                                                                                           
*Input:                                                                                                                                
*         RegAddress -- The register address                                                                          
*         WriteValue  -- The write value
*Output:
*         SUCCESS or FAILURE
********************************************************************************/
unsigned char GX1132_Write_one_Byte(unsigned char RegAddress,unsigned char WriteValue)
{	
       
	return GX_I2cReadWrite( GX_WRITE, GX1132_CHIP_ADDRESS,RegAddress,&WriteValue, 1);	
}

/*******************************************************************************
*Function: Write one byte to chip with read test 
*Input:
*        RegAddress -- The register address
*        WriteValue  -- The write value
*Output:
*       SUCCESS or FAILURE
********************************************************************************/
unsigned char GX1132_Write_one_Byte_ReadTest(unsigned char RegAddress,unsigned char WriteValue)
{
	unsigned char temp;
	
	GX_I2cReadWrite(GX_WRITE, GX1132_CHIP_ADDRESS,RegAddress,&WriteValue, 1 );	
	GX_I2cReadWrite(GX_READ, GX1132_CHIP_ADDRESS,RegAddress,&temp,1);
	if(temp==WriteValue)
			return SUCCESS;
	else
			return FAILURE;	
}

/******************************************************************************
*Function: Read one byte from chip
*Input:
*        RegAddress -- The register address
*Output:
*        SUCCESS: the value of RegAddress
*        FAILURE  :  FAILURE 
*******************************************************************************/
unsigned char GX1132_Read_one_Byte(unsigned char RegAddress)
{       
	unsigned char state=FAILURE;	
       unsigned char Temp_Read_data =0;	

	state = GX_I2cReadWrite(GX_READ, GX1132_CHIP_ADDRESS,RegAddress,&Temp_Read_data, 1 );
	if (state==SUCCESS)
		return Temp_Read_data;
	else
		return FAILURE;
}

#define GX113x_REG_OR(reg, mask, val) do {                                                   \
    __u8 data = 0;                                                                \
    if (GX_I2cReadWrite(GX_READ, GX1132_CHIP_ADDRESS, reg, &data, 1) == SUCCESS) {                                    \
        data = ( data & (mask) ) | (val);                                     \
        GX_I2cReadWrite(GX_WRITE, GX1132_CHIP_ADDRESS, reg, &data, 1); \
    };                                                                            \
} while(0)


/******************************************************************************
*Function:	Get the Chip ID of GX1132
*output:		
*       	return the Chip ID of GX1132
*******************************************************************************/
GX1132_STATE GX1132_Get_Chip_ID(void)
{
	unsigned char temp1,temp2;	

	temp1=GX1132_Read_one_Byte(GX1132_CHIP_ID_L);
	temp2=GX1132_Read_one_Byte(GX1132_CHIP_ID_H);			
	return ((temp2<<8)|temp1);	
}

/******************************************************************************
*Function: Hot reset the Chip 
*Output:
*        SUCCESS or FAILURE 
*******************************************************************************/
unsigned char GX1132_HotReset_CHIP(void)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_RST);
	temp|=0x01;	 
	return GX1132_Write_one_Byte(GX1132_RST,temp);	
}

/******************************************************************************
*Function: Cool reset the Chip 
*Output:
*        SUCCESS or FAILURE 
*******************************************************************************/
unsigned char GX1132_CoolReset_CHIP(void)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_RST);
	temp|=0x02;	
	return GX1132_Write_one_Byte(GX1132_RST,temp);	
}

/******************************************************************************
*Function: Power down the internal ADC of GX1132
*Output:
*        SUCCESS or FAILURE 
*******************************************************************************/
unsigned char GX1132_ADC_Init(void)
{
#if 0
	unsigned char temp;	

	temp=GX1132_Read_one_Byte(GX1132_ADC_CTRL1);	
	temp&=0x3f;
	GX1132_Write_one_Byte(GX1132_ADC_CTRL1,temp);		
	GX_Delay_N_ms(20);
	
	temp=GX1132_Read_one_Byte(GX1132_ADC_CTRL1);	
	temp|=0xc0;	
	GX1132_Write_one_Byte(GX1132_ADC_CTRL1,temp);
#else
	unsigned char reg = 0;

	GX113x_REG_OR(GX1132_ADC_CTRL1, 0x3F, 0x00);
	GX_Delay_N_ms(20);
	GX113x_REG_OR(GX1132_ADC_CTRL1, 0xFF, 0xC0);
	
	reg = GX1132_Read_one_Byte(GX1132_ADC_CTRL0);    
	if (reg&0x40){
		GX1132_Write_one_Byte(GX1132_ADC_CTRL0, (reg&0x7f));		 
		GX1132_Write_one_Byte(GX1132_ADC_CTRL0, (reg|0x80));	
	}
#endif
	return SUCCESS;
}

/******************************************************************************
*Function: Set PLL1 and PLL2
*input:
*	   sysclk  unit: Hz
*Output:
*	   SUCCESS or FAILURE 
*******************************************************************************/
unsigned char GX1132_PLL_Control(void)
{	
//	unsigned char temp;	
#if 0
	//Configure PLL_ADC
	//Set PLL_ADC_PD to 1
	temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_RD);	
	temp|=0x04;
	GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp);	
	//Set PLL_ADC_D
	temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_RD);	
	temp=(temp&0xcf)|(GX1132_PLL_ADC_D_VALUE<<4);	
	GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp);	
	//Set PLL_ADC_R  ----The same of PLL_SYS
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_RD);	
	temp=(temp&0xf0)|(GX1132_PLL_SYS_R_VALUE);
	GX1132_Write_one_Byte(GX1132_PLL_SYS_RD,temp);	
	//Set PLL_ADC_B
	temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
	temp=(temp&0x80)|(GX1132_PLL_ADC_B_VALUE);
	GX1132_Write_one_Byte(GX1132_PLL_ADC_B,temp);	
	//Set PLL_ADC_PD to 0
	temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_RD);	
	temp&=0xfb;
	GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp);	
	GX_Delay_N_ms(50);
	//Configure PLL_SYS
	//Set PLL_SYS_PD to 1
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_RD);	
	temp|=0x80;
	GX1132_Write_one_Byte(GX1132_PLL_SYS_RD,temp);	
	//Set PLL_SYS_D
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_RD);	
	temp=(temp&0x9f)|(GX1132_PLL_SYS_D_VALUE<<5);	
	GX1132_Write_one_Byte(GX1132_PLL_SYS_RD,temp);	
	//Set PLL_SYS_R
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_RD);	
	temp=(temp&0xf0)|(GX1132_PLL_SYS_R_VALUE);
	GX1132_Write_one_Byte(GX1132_PLL_SYS_RD,temp);	
	//Set PLL_SYS_B
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
	temp=(temp&0x80)|(GX1132_PLL_SYS_B_VALUE);
	GX1132_Write_one_Byte(GX1132_PLL_SYS_B,temp);	
	//Set PLL_SYS_PD to 0
	temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_RD);	
	temp&=0x7f;
	GX1132_Write_one_Byte(GX1132_PLL_SYS_RD,temp);	
	GX_Delay_N_ms(50);
	//Configure PLL_FEC	
	//Set PLL_FEC_PD to 1	
	temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_RD);
	temp|=0x80;
	GX1132_Write_one_Byte(GX1132_PLL_FEC_RD,temp);
	//Set PLL_FEC_D
	temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_RD);	
	temp=(temp&0x9f)|(GX1132_PLL_FEC_D_VALUE<<5);
	GX1132_Write_one_Byte(GX1132_PLL_FEC_RD,temp);	
	//Set PLL_FEC_R
	temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_RD);	
	temp=(temp&0xf0)|(GX1132_PLL_FEC_R_VALUE);	
	GX1132_Write_one_Byte(GX1132_PLL_FEC_RD,temp);	
	//Set PLL_FEC_B
	temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
	temp=(temp&0x80)|(GX1132_PLL_FEC_B_VALUE);	
	GX1132_Write_one_Byte(GX1132_PLL_FEC_B,temp);	
	//Set PLL_FEC_PD to 0
	temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_RD);	
	temp&=0x7f;
	GX1132_Write_one_Byte(GX1132_PLL_FEC_RD,temp);
	GX_Delay_N_ms(20);
	//Set the ratio of demod clock and decoder colck
	GX1132_Write_one_Byte(GX1132_PLL_Cfg_Num,GX1132_PLL_CFG_NUM_VALUE);	
	GX1132_Write_one_Byte(GX1132_PLL_Cfg_Denom,GX1132_PLL_CFG_DENOM_VALUE);
	GX_Delay_N_ms(10);
	//Configure Fsample(sysclk)
	GX1132_Write_one_Byte(GX1132_Fsample_Cfg_L,GX1132_FSAMPLE_VALUE&0xff);	
	GX1132_Write_one_Byte(GX1132_Fsample_Cfg_M,(GX1132_FSAMPLE_VALUE>>8)&0xff);	
	GX1132_Write_one_Byte(GX1132_Fsample_Cfg_H,(GX1132_FSAMPLE_VALUE>>16)&0x01);
#else
  GX113x_REG_OR(GX1132_BCS_RST, 0xfd, 0x00);

//Configure PLL_ADC
 GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFF, 0x04); //Set PLL_ADC_PD to 1
 GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xCF, (GX1132_PLL_ADC_D_VALUE<<4)); //Set PLL_ADC_D
 GX113x_REG_OR(GX1132_PLL_SYS_RD, 0xF0, GX1132_PLL_SYS_R_VALUE); //Set PLL_ADC_R  ----The same of PLL_SYS
 GX113x_REG_OR(GX1132_PLL_ADC_B, 0x80, GX1132_PLL_ADC_B_VALUE); //Set PLL_ADC_B
 GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFB, 0x00); //Set PLL_ADC_PD to 0
 GX_Delay_N_ms(50);
 //Configure PLL_SYS
 GX113x_REG_OR(GX1132_PLL_SYS_RD, 0xFF, 0x80); //Set PLL_SYS_PD to 1
 GX113x_REG_OR(GX1132_PLL_SYS_RD, 0x9F,(GX1132_PLL_SYS_D_VALUE<<5) ); //Set PLL_SYS_D
 GX113x_REG_OR(GX1132_PLL_SYS_RD, 0xF0,GX1132_PLL_SYS_R_VALUE ); //Set PLL_SYS_R
 GX113x_REG_OR(GX1132_PLL_SYS_B, 0x80,GX1132_PLL_SYS_B_VALUE ); //Set PLL_SYS_B
 GX113x_REG_OR(GX1132_PLL_SYS_RD, 0x7F,0x00 ); //Set PLL_SYS_PD to 0
 GX_Delay_N_ms(50);
 //Configure PLL_FEC 
 GX113x_REG_OR(GX1132_PLL_FEC_RD, 0xFF,0x80 ); //Set PLL_FEC_PD to 1   
 GX113x_REG_OR(GX1132_PLL_FEC_RD, 0x9F,(GX1132_PLL_FEC_D_VALUE<<5)); //Set PLL_FEC_D
 GX113x_REG_OR(GX1132_PLL_FEC_RD, 0xF0,GX1132_PLL_FEC_R_VALUE); //Set PLL_FEC_R
 GX113x_REG_OR(GX1132_PLL_FEC_B, 0x80,GX1132_PLL_FEC_B_VALUE); //Set PLL_FEC_B
 GX113x_REG_OR(GX1132_PLL_FEC_RD, 0x7F,0x00); //Set PLL_FEC_PD to 0
 GX_Delay_N_ms(20);
 //Set the ratio of demod clock and decoder colck
 GX1132_Write_one_Byte(GX1132_CFG_CLK_RAT,((GX1132_PLL_CFG_FC_VALUE<<4)&0xf0)|GX1132_PLL_CFG_ADC_VALUE);		
 GX_Delay_N_ms(10);
 GX1132_Write_one_Byte(GX1132_PLL_Cfg_Num,GX1132_PLL_CFG_NUM_VALUE);	 
 GX1132_Write_one_Byte(GX1132_PLL_Cfg_Denom,GX1132_PLL_CFG_DENOM_VALUE);
 GX_Delay_N_ms(10);
 //Configure Fsample(sysclk)
 GX1132_Write_one_Byte(GX1132_Fsample_Cfg_L,(GX1132_FSAMPLE_VALUE>>0 )&0xff);  
 GX1132_Write_one_Byte(GX1132_Fsample_Cfg_M,(GX1132_FSAMPLE_VALUE>>8 )&0xff);  
 GX1132_Write_one_Byte(GX1132_Fsample_Cfg_H,(GX1132_FSAMPLE_VALUE>>16)&0x01);

#endif
	return SUCCESS;
}

/******************************************************************************
*Funtion:	Set chip sleep or wake up
*Input:
*	   Sleep    --    1: Sleep      0: Wake up
*Output:
*        SUCCESS or FAILURE
*******************************************************************************/
unsigned char GX1132_Set_Sleep(unsigned char Sleep)
{
	unsigned char temp=0;
	unsigned char temp1=0;
	
	temp=GX1132_Read_one_Byte(GX1132_STBY_TSTRI);	
	temp=(temp&0x7f)|(Sleep<<7);						
	GX1132_Write_one_Byte(GX1132_STBY_TSTRI,temp);	
	if(Sleep==0)
		temp1=1;
	else
		temp1=0;
	temp=GX1132_Read_one_Byte(GX1132_ADC_CTRL1);	
	temp=(temp&0x7f)|(temp1<<7);						
	GX1132_Write_one_Byte(GX1132_ADC_CTRL1,temp);	

	if (Sleep==0)
		
		GX1132_HotReset_CHIP();			
	
	return SUCCESS;
}
/******************************************************************************
*Function: Enable/Disable the Ts_out
*Input:	
*        1 - Off
*        0 - On
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Set_Ts_Out_Disable(unsigned char ts_off)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_STBY_TSTRI);
	if(ts_off==1)
		temp|=0x08;
	else
		temp&=0xf7;
	GX1132_Write_one_Byte(GX1132_STBY_TSTRI,temp);
	
	return SUCCESS;
}

/******************************************************************************
*Function: GX1132_Set_VCM_High_Modcod
*Input:	
*        1 - select high modcod under vcm mode
*        0 - select low modcod under vcm mode
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Set_VCM_High_Modcod(unsigned char sel_high_modcod)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_FRAME_EST_NUM);
	if(sel_high_modcod==1)
		temp|=0x40;
	else
		temp&=0xbf;
	GX1132_Write_one_Byte(GX1132_FRAME_EST_NUM,temp);
	
	return SUCCESS;
}
/******************************************************************************
*Function: GX1132_Set_VCM_TS_2nd
*Input:	
*        1 - select 2nd ts under vcm mode
*        0 - select 1st  ts under vcm mode
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Set_VCM_TS_2nd(unsigned char ts_sel_2)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_CA_CTRL);
	if(ts_sel_2==1)
		temp|=0x04;
	else
		temp&=0xfb;
	GX1132_Write_one_Byte(GX1132_CA_CTRL,temp);
	
	return SUCCESS;
}

/******************************************************************************
*Function: GX1132_Set_VCM_2nd
*Input:	
*        1 - select 2nd under vcm mode
*        0 - select 1st  under vcm mode
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Sel_VCM_2nd(unsigned char sel_2nd)
{
	unsigned char temp,ret,pls_cod1;
	ret=GX1132_Get_VCM_Mode();
	if(ret==1)
		{
			if(sel_2nd==1)
				{
					temp=GX1132_Read_one_Byte(GX1132_PLS_1);
					pls_cod1=temp&0x7f;
					if(pls_cod1)
						GX1132_Set_VCM_High_Modcod(1);
					else
						GX1132_Set_VCM_TS_2nd(1);
				}
			else	 if(sel_2nd==0)
				{
					temp=GX1132_Read_one_Byte(GX1132_PLS_1);
					pls_cod1=temp&0x7f;
					if(pls_cod1)
						GX1132_Set_VCM_High_Modcod(1);
					else
						GX1132_Set_VCM_TS_2nd(1);
				}
			return SUCCESS;
		}
	else 
		return FAILURE;
}
/******************************************************************************
*Function: Enable/Disable the Tunner repeater
*Input:	
*        1 - On
*        0 - Off
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Set_Tuner_Repeater_Enable(unsigned char Rpt_On)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_I2C_REPEAT);	
	if(Rpt_On==1)
		temp|=0x80;        /*On*/		
	else
		temp&=0x7f;        /*Off*/		
	GX1132_Write_one_Byte(GX1132_I2C_REPEAT,temp);
	
	return SUCCESS;
}

/******************************************************************************
*Function: Set AGC Parameter
*Output:
*        SUCCESS , FAILURE 
*******************************************************************************/
unsigned char GX1132_Set_AGC_Parameter(void)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_AGC_STD);	
	temp=(temp&0xc0)|(GX1132_AGC_STD_VALUE);	
	GX1132_Write_one_Byte(GX1132_AGC_STD, temp);	
	
	temp=GX1132_Read_one_Byte(GX1132_AGC_MODE);	
	temp=(temp&0xa0)|0x5c;
	if(!GX1132_AGC_POLARITY)
		temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_AGC_MODE,temp);

	return SUCCESS;
}

/******************************************************************************
*Function: TS inteface config
*Output:
*	     SUCCESS - Configuration success, FAILURE - Configuration falure 
*******************************************************************************/
unsigned char GX1132_Set_TS_Inteface(void)
{
	unsigned char temp;

#if 1	
	GX1132_Write_one_Byte(GX1132_CFG_TS_0,CFG_TS_0);
	GX1132_Write_one_Byte(GX1132_CFG_TS_2,CFG_TS_2);
	GX1132_Write_one_Byte(GX1132_CFG_TS_4,CFG_TS_4);
	GX1132_Write_one_Byte(GX1132_CFG_TS_6,CFG_TS_6);
	GX1132_Write_one_Byte(GX1132_CFG_TS_8,CFG_TS_8);
	GX1132_Write_one_Byte(GX1132_CFG_TS_A,CFG_TS_A);
#endif

	temp=GX1132_Read_one_Byte(GX1132_TS_MODE);	
	temp=(temp&0xf9)|(GX1132_TS_CLK_POL<<2)|(GX1132_TS_OUTPUT_MODE<<1);	
	GX1132_Write_one_Byte(GX1132_TS_MODE,temp);
	
	return SUCCESS;
}

/******************************************************************************
*Function: set the work mode of GX1132: lock sepcified TP or blind scan
*Input:
*	     Normal: GX1132 work in normal mode(0) or blind scan mode(1)
*Output:
*	     SUCCESS - Configuration success, FAILURE - Configuration falure 
*******************************************************************************/
unsigned char GX1132_Set_Work_BS_Mode(unsigned char bs)
{
#if 0
	unsigned char temp1,temp2,temp3;

	temp1=GX1132_Read_one_Byte(GX1132_BCS_RST);	
	temp2=GX1132_Read_one_Byte(GX1132_PLL_ADC_RD);	
	temp3=GX1132_Read_one_Byte(GX1132_AUTO_RST);	

	if(bs==0)
		{
			GX1132_Write_one_Byte(GX1132_BCS_RST,temp1|0x81);			
			GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp2&0xf7);			
			GX1132_Write_one_Byte(GX1132_AUTO_RST,temp3&0xbf);			
		}
	else if(bs==1)
		{
			GX1132_Write_one_Byte(GX1132_BCS_RST,(temp1&0x7f)|0x01);			
			GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp2|0x08);			
			GX1132_Write_one_Byte(GX1132_AUTO_RST,temp3|0x40);			
		}
#else
	if (bs == 0) {
        GX113x_REG_OR(GX1132_BCS_RST,   0xFF, 0x81);
        GX113x_REG_OR(GX1132_PLL_ADC_RD,0xF7, 0x00);
        GX113x_REG_OR(GX1132_AUTO_RST,  0xBF, 0x00);
    }
    else {
        GX113x_REG_OR(GX1132_BCS_RST,   0x7F, 0x01);
        GX113x_REG_OR(GX1132_PLL_ADC_RD,0xFF, 0x08);
        GX113x_REG_OR(GX1132_AUTO_RST,  0xFF, 0x40);
    }
#endif
	return SUCCESS;
}

/******************************************************************************
*Function: Set symbol rate 
*Input:
*        Symbol_Rate_Value (Unit: kHz)
*Output:
*        SUCCESS or FAILURE
*******************************************************************************/
int GX1132_SetSymbolRate(unsigned int Symbol_Rate_Value)
{	
   	int Center_shift_Value=0;		
	if(Symbol_Rate_Value==0)return FAILURE;

	GX1132_Write_one_Byte(GX1132_SYMBOL_H,(unsigned char)((Symbol_Rate_Value>>8)&0xff));		
	GX1132_Write_one_Byte(GX1132_SYMBOL_L,(unsigned char)(Symbol_Rate_Value&0xff));	
	//Adjust the Fc offset when small symbol rate according to different tuner

	#if(TUNER_SHARP7306==1)
		if(Symbol_Rate_Value <5000)
			Center_shift_Value=3000;
	#endif
	#if(TUNER_ZL10037==1)
		if(Symbol_Rate_Value<5000)
			Center_shift_Value=3000;
	#endif
	#if(TUNER_RDA5812==1)
		if(Symbol_Rate_Value<5000)
			Center_shift_Value=3000;
	#endif	
	#if(TUNER_AV2011==1)
		if(Symbol_Rate_Value<5000)
			Center_shift_Value=3000;
	#endif
	#if(TUNER_STV6110A==1)
		if(Symbol_Rate_Value<5000)
			Center_shift_Value=3000;
	#endif
	#if(TUNER_MJ9014S==1)
		if(Symbol_Rate_Value<5000)
			Center_shift_Value=3000;
	#endif
	if(gIQ_swap==1)
		Center_shift_Value=0-Center_shift_Value;

	Center_shift_Value&=0xffff;
	GX1132_Write_one_Byte(GX1132_FC_OFFSET_H,(unsigned char)((Center_shift_Value>>8)&0xff));	
	GX1132_Write_one_Byte(GX1132_FC_OFFSET_L,(unsigned char)(Center_shift_Value&0xff));	
	
	return Center_shift_Value;
}

/******************************************************************************
*Function: Configure the polarity of LNB, 13V/18V is decided by the hw circuit
*input:
*  	   Polar	1:    V    
*			0:    H  
*Output:
*	   SUCCESS or FAILURE
*******************************************************************************/
unsigned char GX1132_Set_Polar(unsigned char Vpolor)
{      
	unsigned char	temp;
	if(POL_SWITCH) Vpolor = !Vpolor;
	
	temp=GX1132_Read_one_Byte(GX1132_DISEQC_MODE);
	if(Vpolor==0)
		temp = temp & 0xBF;	//18V select	
	else if(Vpolor==1)
		temp=temp|0x40;	//13V select	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);
	
	
	return  SUCCESS;	
}

/******************************************************************************
*Function: Control 22K on/off
*input:
*	   22k_on  1:	22K on
*		         0:	22K off
*Output:
*	   SUCCESS or FAILURE
*******************************************************************************/
unsigned char GX1132_22K_sw(unsigned char b22k_on)
{	
	unsigned char	temp;
#if 0
	unsigned int	diseqc_Ratio;
		
	diseqc_Ratio=((((GX1132_FSAMPLE_VALUE*10)/88)+5)/10)&0x07ff;	
	GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_L, (unsigned char)(diseqc_Ratio&0xff));	
	temp=GX1132_Read_one_Byte(GX1132_DISEQC_RATIO_H);	
	temp = (temp&0xF8)|(unsigned char)(((diseqc_Ratio&0x0700)>>8));	
	GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_H, temp);	

	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	
#endif
	//diag_printf("GX1132_22K_sw : %d\n", b22k_on);

	temp=GX1132_Read_one_Byte(GX1132_DISEQC_MODE);	
	temp &= 0xF8;
	if(b22k_on ==1)
		temp |= 0x01;	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);
	
	return SUCCESS;
}

/******************************************************************************
*Function: Diseqc1.0 control, select 1 of 4 antennas
*input:
*	   Lnb_Num: the sequence number of antenna
*Output:    
*	   SUCCESS or FAILURE
*******************************************************************************/
unsigned char GX1132_Sel_Lnb(unsigned char Lnb_Num)
{	
	unsigned char	   	buffer[4];
	unsigned char		temp,diseqc_mode;
	unsigned int	    	i;

	buffer[0] = GX1132_DISEQC_CMD1 & 0xFF;
	buffer[1] = GX1132_DISEQC_CMD2 & 0xFF;
	buffer[2] = GX1132_DISEQC_CMD3 & 0xFF;    
	diseqc_mode=GX1132_Read_one_Byte( GX1132_DISEQC_MODE);
	
	if(diseqc_mode & 0x1)//22k on
	{
		if(diseqc_mode & 0x40)// 13v select
		{
			switch(Lnb_Num)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW02;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW06;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW10;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW14;
                    break;                                    
            } 
		}
		else
		{
			 switch(Lnb_Num)
             {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW04;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW08;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW12;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW16;
                    break;                                    
             }  
		}
	}
	else
	{
		if(diseqc_mode & 0x40)// 13v select
		{
			switch(Lnb_Num)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW01;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW05;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW09;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW13;
                    break;                                    
            }  
		}
		else
		{
			 switch(Lnb_Num)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW03;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW07;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW11;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW15;
                    break;                                    
            }  
		}
	}
	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	
	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS1, buffer[0]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS2, buffer[1]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);		
		
	temp =  (diseqc_mode&0xc0) | 0x1c;	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);	
	GX_Delay_N_ms(30);
	
	for(i = 0;i<1000;i++)
	{
		temp= GX1132_Read_one_Byte(GX1132_DISEQC_RD_INT);		
		if( (temp&0x10) == 0x10)
			break;		
		else if(i==999)
			return FAILURE;		
		GX_Delay_N_ms(5);
	}

	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,diseqc_mode);
	
	return SUCCESS;     
}
/******************************************************************************
*Function: Diseqc1.1 control, select 1 of 16 antennas
*input:
*	   Lnb_Num: the sequence number of antenna
*Output:    
*	   SUCCESS or FAILURE
*******************************************************************************/
unsigned char GX1132_Diseqc_11(unsigned char chCom,unsigned char Lnb_Num)
{	
	unsigned char	   	buffer[4];
	unsigned char		temp,diseqc_mode;
	unsigned int	    	i;

	buffer[0] = GX1132_DISEQC_CMD1 & 0xFF;
	buffer[1] = GX1132_DISEQC_CMD2 & 0xFF;
	buffer[2] = GX1132_DISEQC_CMD3 & 0xFF;  
	diseqc_mode=GX1132_Read_one_Byte( GX1132_DISEQC_MODE);

	if(diseqc_mode & 0x1)//22k on
	{
		if(diseqc_mode & 0x40)// 13v select
		{
			switch(chCom)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW02;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW06;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW10;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW14;
                    break;                                    
            } 
		}
		else
		{
			 switch(chCom)
             {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW04;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW08;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW12;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW16;
                    break;                                    
             }  
		}
	}
	else
	{
		if(diseqc_mode & 0x40)// 13v select
		{
			switch(chCom)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW01;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW05;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW09;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW13;
                    break;                                    
            }  
		}
		else
		{
			 switch(chCom)
            {
                default:
                case 1:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW03;
                    break;
                case 2:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW07;
                    break;
                case 3:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW11;
                    break;
                case 4:
                    buffer[3]   = (unsigned char)GX1132_DISEQC_CMD4_SW15;
                    break;                                    
            }  
		}
	}
	
	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	
	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS1, buffer[0]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS2, buffer[1]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);		
		
	temp =  (diseqc_mode&0xc0) | 0x1c;	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);	
	GX_Delay_N_ms(30);
	
	for(i = 0;i<1000;i++)
	{
		temp= GX1132_Read_one_Byte(GX1132_DISEQC_RD_INT);		
		if( (temp&0x10) == 0x10)
			break;		
		else if(i==999)
			return FAILURE;		
		GX_Delay_N_ms(5);
	}

	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,diseqc_mode);

	buffer[0] = GX1132_DISEQC_CMD1 & 0xFF;
	buffer[1] = GX1132_DISEQC_CMD2 & 0xFF;
	buffer[2] = GX1132_DISEQC_CMD3_1 & 0xFF;    
	GX1132_Write_one_Byte(GX1132_DISEQC_INS1, buffer[0]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS2, buffer[1]);	
	GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);
	if(Lnb_Num>16)Lnb_Num=1;
	temp=GX1132_DISEQC_CMD4_LNB1+(Lnb_Num-1);
	GX1132_Write_one_Byte(GX1132_DISEQC_INS4, temp);		
	
	temp =  (diseqc_mode&0xc0) | 0x1c;	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);	
	GX_Delay_N_ms(30);
	
	for(i = 0;i<1000;i++)
	{
		temp= GX1132_Read_one_Byte(GX1132_DISEQC_RD_INT);		
		if( (temp&0x10) == 0x10)
			break;		
		else if(i==999)
			return FAILURE;		
		GX_Delay_N_ms(5);
	}

	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,diseqc_mode);
	
	return SUCCESS;     
}
/******************************************************************************
*Function: Diseqc1.2, Control the positioner rotation
*				    case STORE_NN, save a satellite.£ccase GOTO_NN, rotate to a satellite                              
*input:
*	   Pos_Ctl:	   Command to control the positioner
*	   Record_byte:  the sequence number of a satellite to save
*Output:  
*	   SUCCESS or FAILURE
*******************************************************************************/                                        
unsigned char GX1132_Pos_Ctl(GX1132_POS_CTRL Pos_Ctl,unsigned char Record_byte)
{	
	unsigned char		temp,diseqc_mode;
	unsigned char 		buffer[8];
	unsigned int    	i;

	buffer[0] = 0xe0;
	buffer[1] = 0x31;

	diseqc_mode=GX1132_Read_one_Byte( GX1132_DISEQC_MODE);
	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	

	GX1132_Write_one_Byte( GX1132_DISEQC_INS1, buffer[0]);	
  	GX1132_Write_one_Byte( GX1132_DISEQC_INS2, buffer[1]);	
	
	switch(Pos_Ctl)
	{
		case LNB_CTRL_LIMIT_WEST:
		{
			buffer[2] = 0x67;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp & 0xc0) | 0x14;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}			
		case LNB_CTRL_DRIVE_WEST:
		{
			buffer[2] = 0x69;
			buffer[3] = 0x00;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}		
		case LNB_CTRL_LIMIT_EAST:
		{
			buffer[2] = 0x66;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp & 0xc0) | 0x14;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}			
		case LNB_CTRL_DRIVE_EAST:
		{
			buffer[2] = 0x68;
			buffer[3] = 0x00;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE,  temp);			
			break;
		}				
		case LNB_CTRL_STOP:			
		{
			buffer[2] = 0x60;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp & 0xc0) | 0x14;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}			
		case LNB_CTRL_LIMIT_OFF:
		{
			buffer[2] = 0x63;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp & 0xc0) | 0x14;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}		
		case LNB_CTRL_STORE_NN:
		{
			buffer[2] = 0x6a;
			buffer[3] = Record_byte;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}		
		case LNB_CTRL_GOTO_NN:
		{
			buffer[2] = 0x6b;
			buffer[3] = Record_byte;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;			
		}	

		case LNB_CTRL_GOTO_XX://louhq20100726
		{
			buffer[2] = 0x6e;
			buffer[3] = Record_byte;
			buffer[4] = Record_byte;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);
			GX1132_Write_one_Byte(GX1132_DISEQC_INS5, buffer[4]);
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;			
		}	

		case LNB_CTRL_SET_POSNS:
		{
			buffer[2] = 0x6f;
			buffer[3] = Record_byte;
			buffer[4] = Record_byte;
			buffer[5] = Record_byte;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS4, buffer[3]);		
			GX1132_Write_one_Byte(GX1132_DISEQC_INS5, buffer[4]);			
			GX1132_Write_one_Byte(GX1132_DISEQC_INS6, buffer[5]);
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp& 0xc0) | 0x1c;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;			
		}			
		
		default: 
		{
			buffer[2] = 0x60;
			GX1132_Write_one_Byte(GX1132_DISEQC_INS3, buffer[2]);			
			temp = GX1132_Read_one_Byte(GX1132_DISEQC_MODE);			
			temp= (temp & 0xc0) | 0x14;
			GX1132_Write_one_Byte( GX1132_DISEQC_MODE, temp);			
			break;
		}	    
	}	
	GX_Delay_N_ms(30);
    
	for(i = 0;i<1000;i++)
	{
		temp= GX1132_Read_one_Byte(GX1132_DISEQC_RD_INT);		
		if( (temp&0x10) == 0x10)
			break;		
		else if(i==999)
			return FAILURE;		
		GX_Delay_N_ms(5);
	}

	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,diseqc_mode);
	
	return SUCCESS;    
}

/******************************************************************************
*Function:   convert a integer to percentage ranging form 0% to 100%  
*Input:
*        value - integer
*        low   - lower limit of input,corresponding to 0%  .if value <= low ,return 0
*        high  - upper limit of input,corresponding to 100%.if value >= high,return 100
*Output:
*        0~100 - percentage
*******************************************************************************/
unsigned char GX1132_Change2percent(unsigned int value,unsigned int low,unsigned int high)
{
	if (value<=low) return 0;
	if (value>=high) return 100;
	return ((unsigned char)((value-low)*100/(high-low)));
}

/******************************************************************************
*Function:   100LogN calculating function 
*Input:
*	  N: value to cal
*Output:
*        = 100LogN
*******************************************************************************/
unsigned int GX1132_100Log(int iNumber_N)
{
	int iLeftMoveCount_M=0;
	int iChangeN_Y=0;
	int iBuMaY_X=0;
	unsigned int iReturn_value=0;
	int iTemp=0,iResult=0,k=0;

	if(iNumber_N<=0) return 0;
	iChangeN_Y=iNumber_N;
	for (iLeftMoveCount_M=0;iLeftMoveCount_M<16;iLeftMoveCount_M++)
	{
		if ((iChangeN_Y&0x8000)==0x8000)
		{
			break;
		}
		else
		{
			iChangeN_Y=iNumber_N<<iLeftMoveCount_M;
		}
	}
	iBuMaY_X=0x10000-iChangeN_Y;	
	k=iBuMaY_X*10000/65536;
	iTemp = k + (k*k)/20000 + ((k*k/10000)*(k*33/100))/10000 + ((k*k/100000)*(k*k/100000))/400;
	iResult=48165-(iTemp*10000/23025);	
	k=iResult-3010*(iLeftMoveCount_M-1);
	iReturn_value=(unsigned int)(k/10);   
	return iReturn_value;
}


/******************************************************************************
*Function: GX1132_Init_Chip
*Output:
*	     SUCCESS - Configuration success, FAILURE - Configuration falure 
*******************************************************************************/
static unsigned char gx1132_init_tab[][3] = {
		{ GX1132_PLL_ADC_RD,		  0x7F, 0x00 }, // SysClk normal
		{ GX1132_I2C_REPEAT,		  0x7F, 0x00 }, // I2C repeater off
		{ GX1132_AGC_STD,			  0xC0, 0x1C }, // set ADC parameter
		{ GX1132_AGC_MODE,			  0xA0, 0x5C }, // set ADC parameter
		{ GX1132_DISEQC_RATIO_L,	  0x00, (((((GX1132_FSAMPLE_VALUE*10)/88)+5)/10)&0x07ff)&0xff/*0x7f*/ },//GX113x_FSAMPLE_VALUE=101250 !!!
		{ GX1132_DISEQC_RATIO_H,	  0xF8, ((((((GX1132_FSAMPLE_VALUE*10)/88)+5)/10)&0x07ff)&0x0700)>>8/*0x04*/ },//GX113x_FSAMPLE_VALUE=101250 !!!
		{ GX1132_DISEQC_IO_CTRL,	  0xFE, 0x00 },
		{ GX1132_MODULE_RST,		  0xBF, 0x00 },
		{ GX1132_RSD_ERR_STATIC_CTRL, 0x80, 0x05 }, // snr detection setting
		{ GX1132_PKT_LEN_SEL,		  0xFC, 0x02 },
		{ GX1132_BCS_OUT_ADDR,		  0x1F, 0x60 }, // Blindscan setting
		{ GX1132_MIN_FS,			  0x00, 0x64 },
		{ GX1132_FFE_CTRL2, 		  0xC0, 0x08 }, // FFT lmt setting
		{ GX1132_FFE_CTRL1, 		  0xF8, 0x07 },
		{ GX1132_AGC_AMP,			  0x0F, 0xA0 },
		{ GX1132_BW_CTRL2,			  0x0F, 0x70 },
		{ GX1132_EQU_SPEED, 		  0x00, 0x04 },
		{ GX1132_FFE_CTRL1, 		  0xF8, 0x07 },
		{ GX1132_FFE_CTRL2, 		  0xC0, 0x20 },
		{ GX1132_AGC_MODE,			  0xE0, 0x18 },
		{ GX1132_AGC_SPEED, 		  0xF8, 0x04 },
	
	};

unsigned char GX1132_Init_Chip(unsigned char i2c_bus)
{
	unsigned char			 	temp;		
//	unsigned int				Diseqc_Ratio;	
	int i;

	hiI2CNUM = (unsigned int)i2c_bus;

	GX1132_CoolReset_CHIP();		
	GX1132_PLL_Control();
	GX1132_ADC_Init();
	GX1132_Set_TS_Inteface();	
	GX1132_Set_Work_BS_Mode(0);	
	//EQU on
	temp=GX1132_Read_one_Byte(GX1132_EQU_CTL);	
	temp&=0x7f;
	GX1132_Write_one_Byte(GX1132_EQU_CTL,temp);
	//ok out and clk out select 	
	temp = GX1132_Read_one_Byte(GX1132_CLK_OK_SEL);	
	temp=(temp&0x00) |0x75;
	GX1132_Write_one_Byte(GX1132_CLK_OK_SEL,temp);		
	//Sleep off
	GX1132_Set_Sleep(0);
#if 0
	//SysClk normal
	temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_RD);	
	temp&=0x7F;
	GX1132_Write_one_Byte(GX1132_PLL_ADC_RD,temp);	
	//repeater off
	GX1132_Set_Tuner_Repeater_Enable(0);	
	//set AGC parameter
	GX1132_Set_AGC_Parameter();	
	//BBC fb_gain set to 0, 2009.12.28 mike
//	temp=GX1132_Read_one_Byte(GX1132_FB_FSCAN);	
//	temp=temp&0x1f;
//	GX1132_Write_one_Byte(GX1132_FB_FSCAN,(unsigned char)temp);		
	//Set the freq of 22K tone  
	Diseqc_Ratio=((((GX1132_FSAMPLE_VALUE*10)/88)+5)/10)&0x07ff;	
	GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_L, (unsigned char)(Diseqc_Ratio&0xff));	
	temp=GX1132_Read_one_Byte(GX1132_DISEQC_RATIO_H);	
	temp=(temp&0xF8)|((unsigned char)(((Diseqc_Ratio&0x0700)>>8)));	
	GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_H,temp);
	//Set Diseqc out
	temp=GX1132_Read_one_Byte(GX1132_DISEQC_IO_CTRL);	
	temp&=0xfe;
	GX1132_Write_one_Byte(GX1132_DISEQC_IO_CTRL, temp);
	
	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp&=0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	
	// snr detection setting
	temp=GX1132_Read_one_Byte(GX1132_RSD_ERR_STATIC_CTRL);	
	temp=(temp&0x80)|0x05;
	GX1132_Write_one_Byte(GX1132_RSD_ERR_STATIC_CTRL,temp);	
	temp=GX1132_Read_one_Byte(GX1132_PKT_LEN_SEL);
	temp=(temp&0xfc)|0x02;
	GX1132_Write_one_Byte(GX1132_PKT_LEN_SEL,temp);	
	//Blindscan setting
	temp=GX1132_Read_one_Byte(GX1132_BCS_OUT_ADDR);	
	temp=(temp&0x1f)|0x60;
	GX1132_Write_one_Byte(GX1132_BCS_OUT_ADDR,temp);		
	GX1132_Write_one_Byte(GX1132_MIN_FS, 0x64);
	//FFt lmt setting
	temp=GX1132_Read_one_Byte(GX1132_FFE_CTRL2);	
	temp=(temp&0xc0)|0x08;
	GX1132_Write_one_Byte(GX1132_FFE_CTRL2,temp);	

	temp=GX1132_Read_one_Byte(GX1132_FFE_CTRL1);	
	temp=(temp&0xf8)|0x07;
	GX1132_Write_one_Byte(GX1132_FFE_CTRL1,temp);	

	temp=GX1132_Read_one_Byte(GX1132_AGC_AMP);	
	temp=(temp&0x0f)|0xA0;
	GX1132_Write_one_Byte(GX1132_AGC_AMP,temp);

	temp=GX1132_Read_one_Byte(GX1132_BW_CTRL2);	
	temp=(temp&0x0f)|0x70;
	GX1132_Write_one_Byte(GX1132_BW_CTRL2,temp);

	temp=GX1132_Read_one_Byte(GX1132_EQU_SPEED);	
	temp=(temp&0x00)|0x04;
	GX1132_Write_one_Byte(GX1132_EQU_SPEED,temp);

	temp=GX1132_Read_one_Byte(GX1132_FFE_CTRL1);	
	temp=(temp&0xf8)|0x07;
	GX1132_Write_one_Byte(GX1132_FFE_CTRL1,temp);	

	temp=GX1132_Read_one_Byte(GX1132_FFE_CTRL2);	
	temp=(temp&0xc0)|0x20;
	GX1132_Write_one_Byte(GX1132_FFE_CTRL2,temp);
       
	temp=GX1132_Read_one_Byte(GX1132_I2C_REPEAT);	
	if(IIC_REPEAT_SPEED==1)
		temp=(temp&0xe0)|0x02;
	else if(IIC_REPEAT_SPEED==2)
		temp=(temp&0xe0)|0x00;
		else
			temp=(temp&0xe0)|0x06;
	GX1132_Write_one_Byte(GX1132_I2C_REPEAT,temp);   

	temp=GX1132_Read_one_Byte(GX1132_AGC_MODE);	
	temp=(temp&0xE0)|0x18;
	GX1132_Write_one_Byte(GX1132_AGC_MODE,temp);

	temp=GX1132_Read_one_Byte(GX1132_AGC_SPEED);	
	temp=(temp&0xF8)|0x02;
	GX1132_Write_one_Byte(GX1132_AGC_SPEED,temp);

	//temp=GX1132_Read_one_Byte(GX1132_LDPC_CTRL);	
	//temp=(temp&0xFE)|0x01;
	//GX1132_Write_one_Byte(GX1132_LDPC_CTRL,temp);



	
	   /****
	temp=GX1132_Read_one_Byte(GX1132_BCS_BND1);	
	temp=(temp&0xff)|0x2f;
	GX1132_Write_one_Byte(GX1132_BCS_BND1,temp);

	temp=GX1132_Read_one_Byte(GX1132_BCS_BND2);	
	temp=(temp&0xff)|0x3f;
	GX1132_Write_one_Byte(GX1132_BCS_BND2,temp);

	temp=GX1132_Read_one_Byte(GX1132_BCS_BND3);	
	temp=(temp&0xff)|0x50;
	GX1132_Write_one_Byte(GX1132_BCS_BND3,temp);

	temp=GX1132_Read_one_Byte(GX1132_BCS_BND4);	
	temp=(temp&0xff)|0x70;
	GX1132_Write_one_Byte(GX1132_BCS_BND4,temp);

	temp=GX1132_Read_one_Byte(GX1132_BCS_BND5);	
	temp=(temp&0xff)|0x7a;
	GX1132_Write_one_Byte(GX1132_BCS_BND5,temp);

	*/
	/*
	Write some other registers if necessary

	*/
#else
	for (i = 0; i < sizeof(gx1132_init_tab)/sizeof(gx1132_init_tab[0]); i++) 
	{
		GX113x_REG_OR(gx1132_init_tab[i][0], gx1132_init_tab[i][1], gx1132_init_tab[i][2]);

	}
#endif


	/* Check Tuner */
	{
		unsigned char ucTemp;
		GX1132_STATE r;
		ucTemp = 0x00;

		GX1132_Set_Tuner_Repeater_Enable(1);
		//printk("tuner av2011 check!!!!\n");
		r = GX_I2cReadWrite2(GX_READ, 0xC6, 0x05,&ucTemp,1); // AV2011 check
		if(r == SUCCESS)
		{
			printk("[TUNER] AV2011\n");
			EnableTunerAV2011 = 1;
		}
		else
		{
			printk("[TUNER] MJ9014\n");
			r = GX_I2cReadWrite2(GX_READ, 0xC2, 0x05,&ucTemp,1);
			EnableTunerAV2011 = 0;
		}
		GX1132_Set_Tuner_Repeater_Enable(0);
	}
	return SUCCESS;
}

/******************************************************************************
*Function: Read ALL OK
*Input:
*	   No input
*Output:
*        SUCCESS - all ok, FAILURE - not all ok 
*******************************************************************************/
GX1132_LOCK_STATUS GX1132_Read_Lock_Status(void)
{
	unsigned char temp=FAILURE;
	GX1132_LOCK_STATUS lock_status = UNLOCKED;		

	temp=GX1132_Read_one_Byte(GX1132_ALL_OK);	
	if ((temp&0x75)==0x75)
	{
		lock_status=FEC_LOCKED;			
		//diag_printf("lock_reg : 0x%x\n", temp);
	}
	else if((temp&0x35)==0x35)
	{
		lock_status=EQU_LOCKED;	
		//diag_printf("lock_reg : 0x%x\n", temp);
	}
	else if((temp&0x15)==0x15 )		lock_status=CRL_LOCKED;
	else if((temp&0x05)==0x05)		lock_status=TIM_LOCKED;
	else if((temp&0x03)==0x03)		lock_status=BCS_LOCKED;
	else if((temp&0x01)==0x01)		lock_status=AGC_LOCKED;
	else								lock_status=UNLOCKED;	

	return lock_status;
}

/******************************************************************************
*Function : get the course signal SNR
*Input:
*		   
*Output:
*        	   SNR value after timing lock
*******************************************************************************/
unsigned int GX1132_Get_100SNR_Tim(void)
{       
	unsigned char	 temp1,temp2;
	unsigned int  snr100;
	unsigned int  n_pow;
	int  s32Tmp;

	temp1=GX1132_Read_one_Byte(GX1132_SNR_DET_N_TIM_L);
	temp2=GX1132_Read_one_Byte(GX1132_SNR_DET_N_TIM_H);	
	if(GX1132_Read_Lock_Status()>UNLOCKED)		
	{
		n_pow=((temp2 &0x0f)<<8) | temp1;
		if(n_pow!=0)
		{
			s32Tmp = ((20480/n_pow)+5)/10;
			snr100=GX1132_100Log(s32Tmp);
//			snr100=(unsigned int)(1000*log10((f32)(2048.0/n_pow)));
			if(snr100>4000)
				snr100=4000;
		}
		else	
			snr100=0;
	}
	else snr100=0;
	
	return snr100;		
}

/******************************************************************************
*Function : get the fine signal SNR
*Input:
*		   
*Output:
*        	   fine SNR value after fec lock
*******************************************************************************/
unsigned int  GX1132_Get_100SNR(void)
{       
	GX1132_STATE temp1,temp2;
	unsigned int  snr100;
	unsigned int  n_pow;
	int  s32Tmp;
	
	temp1=GX1132_Read_one_Byte(GX1132_SNR_DET_N_FINE_L);
	temp2=GX1132_Read_one_Byte(GX1132_SNR_DET_N_FINE_H);	
	
	if(GX1132_Read_Lock_Status()>=CRL_LOCKED)	
	{
		n_pow=((temp2 &0x0f)<<8) | temp1;
		if(n_pow!=0)
		{
			s32Tmp = ((20480/n_pow)+5)/10;
			snr100=GX1132_100Log(s32Tmp);
//			snr100=(unsigned int)(1000*log10((f32)(2048.0/n_pow)));
			if(snr100>4000)
				snr100=4000;
		}
		else	
			snr100=0;
	}
	else		snr100=0;
			
	return snr100;
}

unsigned int  GX1132_Set_Fb_Gain(void)
{
	int	temp,temp1,temp2,temp3;
	int	n_pow;
	
	temp=GX1132_Read_one_Byte(GX1132_FB_FSCAN);
	temp3=GX1132_Read_one_Byte(GX1132_S2_MODE_CODE);
	temp3&=0x1f;
	if((temp3==0x0C)||(temp3==0x12)||(temp3==0x18))
		{
			GX_Delay_N_ms(1000);
		
			temp1=GX1132_Read_one_Byte(GX1132_SNR_DET_N_FINE_L);
			temp2=GX1132_Read_one_Byte(GX1132_SNR_DET_N_FINE_H);	
			n_pow=((temp2 &0x0f)<<8) | temp1;
			if(((temp3==0x0C)&&(n_pow>0x168))||((temp3==0x12)&&(n_pow>0x9C))||((temp3==0x18)&&(n_pow>0x4D)))
					temp=temp&0x1F;
			else
					temp=temp|0x20;
		}
	else 
		temp=temp|0x20;
	GX1132_Write_one_Byte(GX1132_FB_FSCAN,temp);
	//print("temp=0x%x", temp);
	return 1;
}

/******************************************************************************
*Function: New or Old PLL select
*Input:	
*        1 - old pll	
*        0 - new pll
*Output:
*        SUCCESS or FAILURE 
********************************************************************************/
unsigned char GX1132_Sel_PLL_Use(unsigned char pll_sel)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_BW_PHASE_SEL);	
	if(pll_sel==0)
		temp=temp&0x7f;	
	else	 if(pll_sel==1)
		temp=(temp&0x7f)|0x80;	
	GX1132_Write_one_Byte(GX1132_BW_PHASE_SEL,temp);
	//print("temp=0x%x", temp);
	
	return SUCCESS;
}
/******************************************************************************
*Function: Get Signal Strength in percent according agc value
*Input:
*	   old_percent value
*Output: 
*	   Updated signal strength in percent
*******************************************************************************/
unsigned char GX1132_Get_Signal_Strength(void)
{
       unsigned char	agc_h,agc_l;
	unsigned int  agc_out;
	unsigned char	percent=0;

	agc_l =GX1132_Read_one_Byte(GX1132_AGC_CTRL_OUT_L);	
	agc_h=GX1132_Read_one_Byte(GX1132_AGC_CTRL_OUT_H);
	
	agc_out=(((agc_h&0xf0)>>4)<<8)|agc_l;

	//if(GX1132_AGC_POLARITY==1)
#if 0
		percent=(unsigned char)((409600-100*agc_out)/4096+0.5);
#else
	percent=(unsigned char)(((unsigned int)(409600-100*agc_out)*100/4096+50)/100);
#endif
	//else if(GX1132_AGC_POLARITY==0)
		//percent=(unsigned char)((100*agc_out)/4096+0.5);
	//percent=percent*8/7;
			
	if(percent>100)	percent=100;
	if(percent<0)		percent=0;	
		
	return percent;
}

/******************************************************************************
*Function: Get Signal Quality
*Input:
*	   old signal quality percent
*Output: 
*	   Updated signal quality percent
*******************************************************************************/
unsigned char GX1132_Get_Signal_Quality(void)
{
	unsigned int  Snr100=0;
	unsigned char	percent=0;	
	
	if(GX1132_Read_Lock_Status()>=CRL_LOCKED)
		Snr100=GX1132_Get_100SNR();	
	else if(GX1132_Read_Lock_Status()>=AGC_LOCKED)
		Snr100=GX1132_Get_100SNR_Tim();
	else Snr100=0;
	
	percent=(unsigned char)(Snr100/30);
	
#if 0
	if(percent<30)	percent = (unsigned char)(percent *1.5);
	else if(percent>=30)	percent = (percent -30)/2+45;
#else
	if(percent<30)	percent = (unsigned char)(((unsigned int)percent*15)/10);
	else if(percent>=30)	percent = (percent -30)/2+45;
#endif
	if(percent>100)	percent=100;
	if(percent<0)		percent=0;	
			
	return percent;
}

/******************************************************************************
*Function: Get Error Rate value 
*Input:		
*		*E_param: for get the exponent of E
*Output:
*          	return value = 0 and E_param = 0:		Read GX1132 Error
*          	other:								Error Rate Value
*	       Example:	if  return value = 456 and  E_param = 3 ,
*		then here means the Error Rate value is : 4.56 E-3
*******************************************************************************/
unsigned int GX1132_Get_ErrorRate(unsigned char *E_param)
{
	unsigned char 	flag = FAILURE;
	unsigned char 	i;
	unsigned char 	temp;
	unsigned char	e_value = 0;
	unsigned int 	return_value = 0;
	unsigned int 	ErrorRate=0;
	unsigned char	Read_Value[4];
	unsigned int 	Inf_err_bits=0;
	unsigned int 	divied =2;
	unsigned int 	count_p;

	*E_param = 0;
	
	if (GX1132_Read_Lock_Status()>=CRL_LOCKED)
		{
			temp=GX1132_Read_one_Byte(GX1132_MODU_MODE);			
			temp=(temp&0xc0)>>6;

			switch(temp)
				{
					case 0: 
						{
							for (i=0;i<4;i++)								
								{
									Read_Value[i] = GX1132_Read_one_Byte(GX1132_ERR_OUT_0 + i);
								}
							Inf_err_bits = ((unsigned int)Read_Value[0])+ (((unsigned int)Read_Value[1])<<8) + (((unsigned int)Read_Value[2])<<16)+(((unsigned int)(Read_Value[3]&0x03))<<24);							
							flag=GX1132_Read_one_Byte(GX1132_RSD_ERR_STATIC_CTRL);														
							flag=(flag&0x0e)>>1;							
							count_p=(unsigned int)(0x01<<(2*flag+5));
							divied=204*8*count_p;	
							break;
						}
					case 1:
						{
							for (i=0;i<4;i++)	
							{
								Read_Value[i] = GX1132_Read_one_Byte(GX1132_ERR_OUT_0 + i);											
							}
							Inf_err_bits = ((unsigned int)Read_Value[0])+ (((unsigned int)Read_Value[1])<<8) + (((unsigned int)Read_Value[2])<<16)+(((unsigned int)(Read_Value[3]&0x03))<<24);
							flag=GX1132_Read_one_Byte(GX1132_RSD_ERR_STATIC_CTRL);
							flag=(flag&0x0e)>>1;
							count_p=(unsigned int)(0x01<<(2*flag+5));
							divied=146*8*count_p;	
							break;
						}
					case 2:
					case 3:
						{
							for (i=0;i<2;i++)	
							{
								Read_Value[i]  = GX1132_Read_one_Byte(GX1132_CRC_ERR_SUM_L + i);													
							}
							Inf_err_bits = ((unsigned int)Read_Value[0])+ (((unsigned int)Read_Value[1])<<8);												
							if(((GX1132_Read_one_Byte(GX1132_A_MATYPE1)&0xc0)>>6)==3)
								{
									flag = GX1132_Read_one_Byte(GX1132_PKT_LEN_SEL);									
									if((flag&0x03)==0)				divied=2048;
									else if((flag&0x03)==1)		divied=8192;
									else if((flag&0x03)==2)		divied=32768;
									else if((flag&0x03)==3)		divied=131072;
								}
							else
								{
									flag = GX1132_Read_one_Byte(GX1132_PKT_LEN_SEL);								
									if((flag&0x03)==0)				divied=64;
									else if((flag&0x03)==1)		divied=256;
									else if((flag&0x03)==2)		divied=1024;
									else if((flag&0x03)==3)		divied=4096;
								}
							break;
						}
				}
		}
	else		return 0;		
	if((Inf_err_bits==0)||(divied==0)) return 0;	
	
	while(1)
	{
		ErrorRate= 1000*Inf_err_bits/divied;
		if (ErrorRate>=1000)
		{
			return_value = (Inf_err_bits*100)/divied;
			break;
		}
		else
		{
			e_value ++;
			Inf_err_bits *=10;
		}
	}	
	*E_param = e_value;
	return return_value;
}

/******************************************************************************
*Function: GX1132_Get_VCM_Mode
*Input:	

*Output:
*        1-VCM mode
*        0-Not VCM mode
********************************************************************************/
unsigned char GX1132_Get_VCM_Mode(void)
{
	unsigned char temp;

	temp=GX1132_Read_one_Byte(GX1132_FRAME_EST_NUM);
	temp=temp&0x80;
	if(temp)
		return 1; 
	else
		return 0;
}


GX1132_STATE GX1132_set_tuner(unsigned int RFfreq,unsigned int Symbol_Rate);

/******************************************************************************
*Function: Lock TP 
*Input:		
*		RF_Freq:	       the center frequence of specified TP at L band, unit: MHz
*		Symbol_Rate: the symbol rate of specified TP, unit: KBaud
*		Polar:		polarity of LNB, control 13V/18V
*		Tone_on:		22K on/off control, select the high/low osc
*Output:
*          	SUCESS: locked,   FAILURE: can't locked
*******************************************************************************/
unsigned char GX1132_lock_TP(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver)
{	
	unsigned char temp,temp1;
	int center_shift_KHz;
	temp=GX1132_Read_one_Byte(GX1132_AUTO_RST);		
	temp|=0x01;
	GX1132_Write_one_Byte(GX1132_AUTO_RST,temp);		
	GX1132_Set_Work_BS_Mode(1);
	GX113x_REG_OR(GX1132_BCS_OUT_ADDR, 0xE0, 0x00);
	#if 0
	GX1132_Set_Polar(tp.V_polar);		
	GX1132_22K_sw(tp._22K_on);			
	#endif
	GX1132_SetSymbolRate(tp.SymRate_KSps);			
	temp=GX1132_Read_one_Byte(GX1132_FC_OFFSET_H);
	temp1=GX1132_Read_one_Byte(GX1132_FC_OFFSET_L);

	if(((temp<<8)+temp1)<=32767)		center_shift_KHz=(temp<<8)+temp1;
	else if(((temp<<8)+temp1)>32767)	center_shift_KHz=((temp<<8)+temp1) - 65536;
	
	if(gIQ_swap==1)	center_shift_KHz=0-center_shift_KHz;
//		print("[Lock_tp:]center_shift_KHz=%dKHz",center_shift_KHz);
	GX1132_Set_Tuner_Repeater_Enable(1);
	tunerDriver (((int)tp.Freq_KHz+center_shift_KHz+500)/1000,tp.SymRate_KSps+gx_abs(center_shift_KHz));

	GX1132_Set_Tuner_Repeater_Enable(0);		


#if 0		
	GX_Delay_N_ms(100);
	GX_Av2011_GetLockStatus();

#endif		

	GX1132_HotReset_CHIP();		


	GX_Delay_N_ms(50);	
	
	return SUCCESS;
	
}

/******************************************************************************
*Function: Lock TP with BS on
*Input:		
*		RF_Freq:	       the center frequence of specified TP at L band, unit: MHz
*		Symbol_Rate: the symbol rate of specified TP, unit: KBaud
*		Polar:		polarity of LNB, control 13V/18V
*		Tone_on:		22K on/off control, select the high/low osc
*Output:
*          	SUCESS: locked,   FAILURE: can't locked
*******************************************************************************/
unsigned char GX1132_lock_TP_BS(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver)
{	
	unsigned char temp,temp1;
	int center_shift_KHz;

		temp=GX1132_Read_one_Byte(GX1132_AUTO_RST);		
		temp|=0x01;
		GX1132_Write_one_Byte(GX1132_AUTO_RST,temp);		
		GX1132_Set_Work_BS_Mode(1);			
		#if 0
		GX1132_Set_Polar(tp.V_polar);			
		GX1132_22K_sw(tp._22K_on);	
		#endif
		temp=GX1132_Read_one_Byte(GX1132_BCS_OUT_ADDR);		
		temp=temp&0xe0;
		GX1132_Write_one_Byte(GX1132_BCS_OUT_ADDR,temp);		
	
		GX1132_SetSymbolRate(tp.SymRate_KSps);		
		temp=GX1132_Read_one_Byte(GX1132_FC_OFFSET_H);
		temp1=GX1132_Read_one_Byte(GX1132_FC_OFFSET_L);	
		if(((temp<<8)+temp1)<=32767)		center_shift_KHz=(temp<<8)+temp1;
		if(((temp<<8)+temp1)>32767)	center_shift_KHz=((temp<<8)+temp1) - 65536;
		if(gIQ_swap==1)	center_shift_KHz=0-center_shift_KHz;
//		print("[Lock tp bs:]center_shift_KHz=%dKHz",center_shift_KHz);
		GX1132_Set_Tuner_Repeater_Enable(1);
		tunerDriver(((int)tp.Freq_KHz+center_shift_KHz+500)/1000,tp.SymRate_KSps+gx_abs(center_shift_KHz));		
		
#if(TUNER_AV2011==1)	
		if(EnableTunerAV2011 == 1)
		{
			GX_Delay_N_ms(100);
			GX_Av2011_GetLockStatus();
		}
#endif		
		
		GX1132_Set_Tuner_Repeater_Enable(0);		
		GX1132_HotReset_CHIP();		
		GX_Delay_N_ms(50);	
/*		int tsd,temp1,temp2;
		for(tsd=0;tsd<20;tsd++)
						//if(GX1132_Read_Lock_Status()>=TIM_LOCKED)
					{	temp1=GX1132_Read_one_Byte(0x4A);
						temp2=GX1132_Read_one_Byte(0x4B);
						print("temp1=%x,temp2=%x",temp1,temp2);
						GX_Delay_N_ms(50);	
						if((temp&0x0F)>9)
							{	
								break;
							}
					}
*/

	return SUCCESS;
}
/******************************************************************************
*Function:GX1132_Search_Signal
*Input:		
*		RF_Freq:	       the center frequence of specified TP at L band, unit: MHz
*		Symbol_Rate: the symbol rate of specified TP, unit: KBaud
*		Polar:		polarity of LNB, control 13V/18V
*		Tone_on:		22K on/off control, select the high/low osc
*Output:
*          	SUCESS: locked,   FAILURE: can't locked
*******************************************************************************/
unsigned char GX1132_Search_Signal(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver)
{
	//GX1132_TP_INFO 	tp_info;
	GX1132_LOCK_STATUS lock_status = UNLOCKED;		
	unsigned char	count = 0,locked_flag = 0;
	static unsigned char sym_flag=0;
	unsigned char	temp; //, temp1, temp2;
	//int fs_bs, fc_offset_bs, temp_Fc_offset, fc_offset_fine_K, fc_offset, temp3;
	unsigned int	j;
	unsigned int diseqc_Ratio = 0;

	//printk("GX1132_Search_Signal : u32TunerPort = %d, freq = %d, sr = %d\n", u32TunerPort, tp.Freq_KHz, tp.SymRate_KSps);
	
	if((tp.Freq_KHz<950000) ||(tp.Freq_KHz>2150000)|| (tp.SymRate_KSps<800)|| (tp.SymRate_KSps>50000))	
	{     
		printk("[GX1132_Search_Signal] param error !\n");
		return TP_UNLOCK;	
	}
	else
	{
		GX1132_Set_Ts_Out_Disable(1);
		if(tp.SymRate_KSps<1600)
		{
#if 0
			//Set PLL_ADC_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
			temp=(temp&0x80)|(0x20);
			GX1132_Write_one_Byte(GX1132_PLL_ADC_B,temp);	
			//Set PLL_SYS_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
			temp=(temp&0x80)|(0x20);
			GX1132_Write_one_Byte(GX1132_PLL_SYS_B,temp);	
			//Set PLL_FEC_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
			temp=(temp&0x80)|(0x2b);	
			GX1132_Write_one_Byte(GX1132_PLL_FEC_B,temp);	

			temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
			printk("GX1132_PLL_ADC_B : LOW : %x\n", temp);
			temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
			printk("GX1132_PLL_SYS_B : LOW : %x\n", temp);
			temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
			printk("GX1132_PLL_FEC_B : LOW : %x\n", temp);
#else
			GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFF,0x04);
            GX113x_REG_OR(GX1132_PLL_ADC_B,  0x80,0x1A);
            GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFB,0x00);
            GX_Delay_N_ms(50);
            GX113x_REG_OR(GX1132_PLL_SYS_RD, 0xFF,0x80);
            GX113x_REG_OR(GX1132_PLL_SYS_B,  0x80,0x1D);
            GX113x_REG_OR(GX1132_PLL_SYS_RD, 0x7F,0x00);
            GX_Delay_N_ms(50);
            GX113x_REG_OR(GX1132_PLL_FEC_RD, 0xFF,0x80);
            GX113x_REG_OR(GX1132_PLL_FEC_B,  0x80,0x23);
            GX113x_REG_OR(GX1132_PLL_FEC_RD, 0x7F,0x00);
            GX_Delay_N_ms(20);

            diseqc_Ratio=((((50625*10)/88)+5)/10)&0x07ff;
            GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_L,(diseqc_Ratio&0xff));
            GX113x_REG_OR(GX1132_DISEQC_RATIO_H,0xF8,((diseqc_Ratio&0x0700)>>8));
#endif		

			sym_flag=1;
			//print("sym_flag=%d", sym_flag);
		}
		else
		{
#if 0
			if(sym_flag==1)
			{
				//Set PLL_ADC_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
				temp=(temp&0x80)|(GX1132_PLL_ADC_B_VALUE);
				GX1132_Write_one_Byte(GX1132_PLL_ADC_B,temp);	
				//Set PLL_SYS_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
				temp=(temp&0x80)|(GX1132_PLL_SYS_B_VALUE);
				GX1132_Write_one_Byte(GX1132_PLL_SYS_B,temp);	
				//Set PLL_FEC_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
				temp=(temp&0x80)|(GX1132_PLL_FEC_B_VALUE);	
				GX1132_Write_one_Byte(GX1132_PLL_FEC_B,temp);

				#if 0
				temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
				printk("GX1132_PLL_ADC_B : HIGH : %x\n", temp);
				temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
				printk("GX1132_PLL_SYS_B : HIGH : %x\n", temp);
				temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
				printk("GX1132_PLL_FEC_B : HIGH : %x\n", temp);
				#endif
				sym_flag=0;
				//print("sym_flag=%d", sym_flag);
			}
#else
			GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFF,0x04);
            GX113x_REG_OR(GX1132_PLL_ADC_B,  0x80,GX1132_PLL_ADC_B_VALUE);
            GX113x_REG_OR(GX1132_PLL_ADC_RD, 0xFB,0x00);
            GX_Delay_N_ms(50);
            GX113x_REG_OR(GX1132_PLL_SYS_RD, 0xFF,0x80);
            GX113x_REG_OR(GX1132_PLL_SYS_B,  0x80,GX1132_PLL_SYS_B_VALUE);
            GX113x_REG_OR(GX1132_PLL_SYS_RD, 0x7F,0x00);
            GX_Delay_N_ms(50);
            GX113x_REG_OR(GX1132_PLL_FEC_RD, 0xFF,0x80);
            GX113x_REG_OR(GX1132_PLL_FEC_B,  0x80,GX1132_PLL_FEC_B_VALUE);
            GX113x_REG_OR(GX1132_PLL_FEC_RD, 0x7F,0x00);
            GX_Delay_N_ms(20);

            diseqc_Ratio=((((GX1132_FSAMPLE_VALUE*10)/88)+5)/10)&0x07ff;
            GX1132_Write_one_Byte(GX1132_DISEQC_RATIO_L,(diseqc_Ratio&0xff));
            GX113x_REG_OR(GX1132_DISEQC_RATIO_H,0xF8,((diseqc_Ratio&0x0700)>>8));
#endif
		}

		GX1132_ADC_Init();
		GX1132_HotReset_CHIP();
	

		GX113x_REG_OR(GX1132_TIM_LOOP_BW, 0x8f, 0x00);
		
		GX1132_lock_TP(u32TunerPort, tp,tunerDriver);


		count=100;
		for(j=0;j<count;j++)
		{					
			
			switch(lock_status = GX1132_Read_Lock_Status())
			{
				case FEC_LOCKED:
					{
						locked_flag=1;
						break;
					}
				case EQU_LOCKED:
					{
						if(j>=80)
						j+=5;						
						break;
					}
				case CRL_LOCKED:
					{
						if(j>=60)
						j+=5;//louhq20110503
						break;
					}
				case TIM_LOCKED:
					{
						if(j>=50)
							j+=10;//louhq20110503
						break;
					}
				case BCS_LOCKED:
					{
						if(j>=50)
							j+=10;//louhq20110503
						break;
					}
				case AGC_LOCKED:
					{
						if(j>=50)
							j+=15;
						break;
					}
				case UNLOCKED:
					{
						if(j>=50)
							j+=20;
						break;
					}
			}

#if 0	/* DEBUG */
{
	temp=GX1132_Read_one_Byte(GX1132_RST);	
	printk("GX1132_RST : %x\n", temp);

	temp=GX1132_Read_one_Byte(GX1132_ALL_OK);	
	printk("GX1132_ALL_OK : %x\n", temp);

	temp=GX1132_Read_one_Byte(GX1132_AGC_CTRL_OUT_H);	
	printk("GX1132_AGC_CTRL_OUT_H : %x\n", temp);
	temp=GX1132_Read_one_Byte(GX1132_AGC_CTRL_OUT_L);	
	printk("GX1132_AGC_CTRL_OUT_L : %x\n", temp);

	temp=GX1132_Read_one_Byte(GX1132_MODU_MODE);	
	printk("GX1132_MODU_MODE : %x\n", temp);
	temp=GX1132_Read_one_Byte(GX1132_S2_MODE_CODE);	
	printk("GX1132_S2_MODE_CODE : %x\n", temp);

}
#endif

			if(locked_flag==1)
				break;
			if(tp.SymRate_KSps<=5000)	
				GX_Delay_N_ms(50);
			else	if((tp.SymRate_KSps>5000)&&(tp.SymRate_KSps<=10000))	
				GX_Delay_N_ms(40);
			else			
				GX_Delay_N_ms(30);
		}
		//diag_printf("lock_status : %d\n", lock_status);
//		printk("[GX1132_Search_Signal] lock_status : %d, locked_flag = %d\n", lock_status, locked_flag);
		
		if(locked_flag)
		{
			GX1132_Set_Fb_Gain();
			temp=GX1132_Read_one_Byte(GX1132_S2_MODE_CODE);
			temp&=0x1f;
			if((temp==0x01)||(temp==0x02)||(temp==0x03))
				GX1132_Sel_PLL_Use(0);
			else
				GX1132_Sel_PLL_Use(1);

            GX1132_Set_Ts_Out_Disable(0);
			return TP_LOCK;
		}
		else	 
		{
			GX1132_Set_Ts_Out_Disable(0);
			return TP_UNLOCK;
		}
	}
}

unsigned char GX1132_Search_Signal_BS(unsigned int u32TunerPort, GX1132_TP tp,  TunerDriver tunerDriver)
{
	//GX1132_TP_INFO 	tp_info;
	GX1132_LOCK_STATUS lock_status = UNLOCKED;		
	unsigned char	count = 0,locked_flag = 0;
	static unsigned char sym_flag=0;
	int	temp,temp1,temp2,temp3,Fs_Bs,Fc_offset_Bs,temp_Fc_offset,fc_offset_fine_K,fc_offset;
	unsigned int	j;
	if((tp.Freq_KHz<900000) ||(tp.Freq_KHz>2200000)|| (tp.SymRate_KSps<800)|| (tp.SymRate_KSps>50000))	
	{     
		tp.Freq_KHz=10000;
		tp.SymRate_KSps=50;
		GX1132_lock_TP(u32TunerPort, tp, tunerDriver);
		return TP_UNLOCK;	
	}
	else
	{
		GX1132_Set_Ts_Out_Disable(1);
		if(tp.SymRate_KSps<1600)
		{
			//Set PLL_ADC_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
			temp=(temp&0x80)|(0x20);
			GX1132_Write_one_Byte(GX1132_PLL_ADC_B,temp);	
			//Set PLL_SYS_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
			temp=(temp&0x80)|(0x20);
			GX1132_Write_one_Byte(GX1132_PLL_SYS_B,temp);	
			//Set PLL_FEC_B
			temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
			temp=(temp&0x80)|(0x2b);	
			GX1132_Write_one_Byte(GX1132_PLL_FEC_B,temp);	

			sym_flag=1;
			//print("sym_flag=%d", sym_flag);
		}
		else
		{
			if(sym_flag==1)
			{
				//Set PLL_ADC_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_ADC_B);	
				temp=(temp&0x80)|(GX1132_PLL_ADC_B_VALUE);
				GX1132_Write_one_Byte(GX1132_PLL_ADC_B,temp);	
				//Set PLL_SYS_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_SYS_B);	
				temp=(temp&0x80)|(GX1132_PLL_SYS_B_VALUE);
				GX1132_Write_one_Byte(GX1132_PLL_SYS_B,temp);	
				//Set PLL_FEC_B
				temp=GX1132_Read_one_Byte(GX1132_PLL_FEC_B);	
				temp=(temp&0x80)|(GX1132_PLL_FEC_B_VALUE);	
				GX1132_Write_one_Byte(GX1132_PLL_FEC_B,temp);

				sym_flag=0;
				//print("sym_flag=%d", sym_flag);
			}
		}
		GX1132_lock_TP_BS(u32TunerPort, tp,tunerDriver);
		//GX1132_lock_TP_BS(tp,tunerDriver);
		count=100;
		/////louhq20100826
		for(j=0;j<count;j++)
		{	
			switch(lock_status = GX1132_Read_Lock_Status())
			{
				case FEC_LOCKED:
					{
						locked_flag=1;
						break;
					}
				case EQU_LOCKED:
					{
						if(j>=80)
						j+=5;
						break;
					}
				case CRL_LOCKED:
					{
						if(j>=60)
						j+=5;//louhq20110503
						break;
					}
				case TIM_LOCKED:
					{
						if(j>=50)
							j+=10;//louhq20110503
						break;
					}
				case BCS_LOCKED:
					{
						if(j>=50)
							j+=10;//louhq20110503
						break;
					}
				case AGC_LOCKED:
					{
						if(j>=50)
							j+=15;
						break;
					}
				case UNLOCKED:
					{
						if(j>=50)
							j+=20;
						break;
					}
			}
			if(locked_flag==1)
				break;
			if(tp.SymRate_KSps<=5000)	
				GX_Delay_N_ms(50);
			else	if((tp.SymRate_KSps>5000)&&(tp.SymRate_KSps<=10000))	
				GX_Delay_N_ms(40);
			else			
				GX_Delay_N_ms(30);
		}
		//printk("lock_status : %d, locked_flag : %d\n", lock_status, locked_flag);
		if(locked_flag)
		{
			GX1132_Set_Fb_Gain();
			temp3=GX1132_Read_one_Byte(GX1132_S2_MODE_CODE);
			temp3&=0x1f;
			if((temp3==0x01)||(temp3==0x02)||(temp3==0x03))
				GX1132_Sel_PLL_Use(0);
			else
				GX1132_Sel_PLL_Use(1);
			if(tp.SymRate_KSps<1600)
			{
				GX1132_Set_Ts_Out_Disable(0);
				return TP_LOCK;
			}
			else
			{
				temp1=(GX1132_Read_one_Byte(GX1132_BCS_OUT_ADDR)&0xe0);	
				GX1132_Write_one_Byte(GX1132_BCS_OUT_ADDR,temp1);				
				temp1=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_H);	
				temp2=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_L);	
				if(((temp1<<8)+temp2)<=32767)		Fc_offset_Bs = ((temp1<<8)+temp2);
				if(((temp1<<8)+temp2)>32767)		Fc_offset_Bs = ((temp1<<8)+temp2)-65536;
				if(gIQ_swap==0)	Fc_offset_Bs=0 - Fc_offset_Bs;
				temp1=GX1132_Read_one_Byte(GX1132_BCS_FS_H);				
				temp2=GX1132_Read_one_Byte(GX1132_BCS_FS_L);				
				Fs_Bs = (temp1<<8)+temp2;

				temp1=GX1132_Read_one_Byte(GX1132_FREQ_BACK_L);
				temp2=GX1132_Read_one_Byte(GX1132_FREQ_BACK_H);
				if(((temp2<<8)+temp1)<=32767)	temp_Fc_offset=(temp2<<8)+temp1;
				if(((temp2<<8)+temp1)>32767)		temp_Fc_offset=((temp2<<8)+temp1)-65536;
				if(gIQ_swap==0)	temp_Fc_offset=0-temp_Fc_offset;
				fc_offset_fine_K=(temp_Fc_offset*(int)Fs_Bs)/65536;	
				fc_offset=Fc_offset_Bs+fc_offset_fine_K;
				
				//printk("fc_offset=%d, Fs_Bs=%d\n", (int)fc_offset, (int)Fs_Bs);
				
				if(fc_offset<0)
					fc_offset=0-fc_offset;
				if(Fs_Bs>=5000)
				{
					if(fc_offset>6000)	
					{
						//printk("Fs_Bs=%d\n", (int)Fs_Bs);
						return TP_BAD;
					}
					else
					{
						temp=tp.SymRate_KSps-Fs_Bs;						
						if(temp<0)
						{
							temp=Fs_Bs-tp.SymRate_KSps;
						}
						if(temp>100)
						{
							//printk("temp=%d\n", (int)temp);
							return TP_BAD;
						}
						else 
						{
							GX1132_Set_Ts_Out_Disable(0);
							return TP_LOCK;
						}
					}
				}
				else 
				{
					if(fc_offset>5000)
					{
						//printk("fc_offset=%d\n", (int)fc_offset);
						return TP_BAD;
					}
					else
					{
						temp=tp.SymRate_KSps-Fs_Bs;						
						if(temp<0)
						{
							temp=Fs_Bs-tp.SymRate_KSps;
						}
						if(temp>100)
						{
							//printk("temp=%d\n", (int)temp);
							return TP_BAD;
						}
						else 
						{
							GX1132_Set_Ts_Out_Disable(0);
							return TP_LOCK;
						}
					}
				}
			}
		}
		else	 
		{
			GX1132_Set_Ts_Out_Disable(0);
			return TP_UNLOCK;
		}
	}
}


/******************************************************************************
*Function: Get the channel info after chip locking 
*Input:		
*		
*Output:
*          	
*******************************************************************************/
GX1132_FINE_OFFSET GX1132_Get_Fine_Offset(void)
{
	unsigned char temp, temp1,temp2;	
	unsigned int sym_rate;
	int temp_Fc_offset,temp_Fs_offset;		
	GX1132_FINE_OFFSET fine_offset;	
	
	if(GX1132_Read_Lock_Status()>=CRL_LOCKED)
		{
			temp1=GX1132_Read_one_Byte(GX1132_SYMBOL_L);
			temp2=GX1132_Read_one_Byte(GX1132_SYMBOL_H);
			sym_rate=(temp2<<8)+temp1;			
//			temp=GX1132_Read_one_Byte(GX1132_FB_FSCAN);//mike 20091228
//			temp1=(GX1132_Read_one_Byte(GX1132_MODU_MODE)&0xc0)>>6;					
//			if(temp1<2)
//				{
//					temp=(temp&0x1f)|0x20;
//					GX1132_Write_one_Byte(GX1132_FB_FSCAN, (unsigned char)temp);
//				}
			temp1=GX1132_Read_one_Byte(GX1132_FREQ_BACK_L);
			temp2=GX1132_Read_one_Byte(GX1132_FREQ_BACK_H);
			if(((temp2<<8)+temp1)<=32767)	temp_Fc_offset=(temp2<<8)+temp1;
			if(((temp2<<8)+temp1)>32767)		temp_Fc_offset=((temp2<<8)+temp1)-65536;
			if(gIQ_swap==0)	temp_Fc_offset=0-temp_Fc_offset;
			fine_offset.fc_offset_fine_K=(temp_Fc_offset*(int)sym_rate)/65536;			
//			temp=GX1132_Read_one_Byte(GX1132_FB_FSCAN);			
//			temp=temp&0x1f;
//			GX1132_Write_one_Byte(GX1132_FB_FSCAN,(unsigned char)temp);			

			temp=GX1132_Read_one_Byte(GX1132_INTG_OUT);	
			if(temp<=127)
				temp_Fs_offset=temp;
			else if(temp>127)
				temp_Fs_offset=temp-256;
			if(gIQ_swap==0) temp_Fs_offset= 0- temp_Fs_offset;
			
			if(sym_rate<=2820) 	fine_offset.fs_offset_fine_Sps=(temp_Fs_offset*91800000)/33554432;
			else if(sym_rate<=5650)	fine_offset.fs_offset_fine_Sps=(temp_Fs_offset*91800000)/16777216;
			else if(sym_rate<=11300)	fine_offset.fs_offset_fine_Sps=(temp_Fs_offset*91800000)/8388608;
			else 	fine_offset.fs_offset_fine_Sps=(temp_Fs_offset*91800000)/4194304;				
		}
	else 
		{
			fine_offset.fc_offset_fine_K=0;
			fine_offset.fs_offset_fine_Sps=0;
		}

	return fine_offset;
}

/******************************************************************************
*Function: Get the TP info after chip locking 
*Input:		
*		
*Output:
*          	
*******************************************************************************/
GX1132_TP_INFO GX1132_Get_TP_Info(unsigned int RF_Freq_K,unsigned int Symbol_Rate_K)
{
	GX1132_TP_INFO 	tp_info = {0};
	unsigned char 	temp,temp1,temp2,temp3;
	int rf_center_offset_KHz;
	int offset_bcs;
	unsigned char bcs_on=0;
	GX1132_FINE_OFFSET fine_offset;

	tp_info.V_polor=((GX1132_Read_one_Byte(GX1132_DISEQC_MODE)&0x40)==0x40)?1:0;
	if(POL_SWITCH) 	tp_info.V_polor=~tp_info.V_polor;
	tp_info._22K_on=((GX1132_Read_one_Byte(GX1132_DISEQC_MODE)&0x07)==0x01)?1:0;
	
	if (GX1132_Read_Lock_Status()>=EQU_LOCKED)
		{
			temp=GX1132_Read_one_Byte(GX1132_MODU_MODE);
			temp1=(temp&0xc0)>>6;			
			switch(temp1)
				{
					case 0:
						{
							tp_info.modu_mode=DVBS;
							
							temp2=temp&0x07;
							switch(temp2)
								{
									case 1: 
										{
											tp_info.code_rate_s=CR12;
											break;
											}
									case 2: 
										{
											tp_info.code_rate_s=CR23;
											break;
										}
									case 3:
										{
											tp_info.code_rate_s=CR34;
											break;
										}
									case 5:
										{
											tp_info.code_rate_s=CR56;
											break;
										}
									case 7: 
										{
											tp_info.code_rate_s=CR78;
											break;
										}
									default: 
										{
											tp_info.code_rate_s=CR34;
											break;
										}
							 	}
							break;
						}
					case 1:
						{
							tp_info.modu_mode=DIRECTV;

							temp2=temp&0x07;
							switch(temp2)
								{
									case 1: 
										{
											tp_info.code_rate_s=CR12;
											break;
										}
									case 2: 
										{
											tp_info.code_rate_s=CR23;
											break;
										}
									case 6: 
										{
											tp_info.code_rate_s=CR67;
											break;
										}
									default: 
										{
											tp_info.code_rate_s=CR23;
											break;
										}
								}
							break;
						}
					case 2:
					case 3:
						{
							tp_info.modu_mode=DVBS2;

							temp3=GX1132_Read_one_Byte(GX1132_S2_MODE_CODE);
							temp3&=0x1f;
							switch(temp3)
								{
									case 1: 		
										{
											tp_info.code_rate_s2=QPSK14;
											break;
										}
									case 2: 		
										{
											tp_info.code_rate_s2=QPSK13;
											break;
										}
									case 3: 		
										{
											tp_info.code_rate_s2=QPSK25;
											break;
										}
									case 4: 		
										{
											tp_info.code_rate_s2=QPSK12;
											break;
										}
									case 5: 		
										{
											tp_info.code_rate_s2=QPSK35;
											break;
										}
									case 6:
										{
											tp_info.code_rate_s2=QPSK23;
											break;
										}
									case 7: 		
										{
											tp_info.code_rate_s2=QPSK34;
											break;
										}
									case 8: 		
										{
											tp_info.code_rate_s2=QPSK45;
											break;
										}
									case 9: 		
										{
											tp_info.code_rate_s2=QPSK56;
											break;
										}
									case 10: 	
										{
											tp_info.code_rate_s2=QPSK89;
											break;
										}
									case 11: 	
										{
											tp_info.code_rate_s2=QPSK910;
											break;
										}
									case 12: 	
										{
											tp_info.code_rate_s2=_8PSK35;
											break;
										}
									case 13: 	
										{
											tp_info.code_rate_s2=_8PSK23;
											break;
										}
									case 14: 	
										{
											tp_info.code_rate_s2=_8PSK34;
											break;
										}
									case 15: 	
										{
											tp_info.code_rate_s2=_8PSK56;
											break;
										}
									case 16: 	
										{
											tp_info.code_rate_s2=_8PSK89;
											break;
										}
									case 17: 	
										{
											tp_info.code_rate_s2=_8PSK910;
											break;
										}
									case 18: 	
										{
											tp_info.code_rate_s2=_16APSK23;							
											break;
										}
									case 19: 	
										{
											tp_info.code_rate_s2=_16APSK34;							
											break;
										}
									case 20: 	
										{
											tp_info.code_rate_s2=_16APSK45;							
											break;
										}
									case 21: 	
										{
											tp_info.code_rate_s2=_16APSK56;							
											break;
										}
									case 22: 	
										{
											tp_info.code_rate_s2=_16APSK89;							
											break;
										}
									case 23: 	
										{
											tp_info.code_rate_s2=_16APSK910;							
											break;
										}
									case 24: 	
										{
											tp_info.code_rate_s2=_32APSK34;							
											break;
										}
									case 25: 	
										{
											tp_info.code_rate_s2=_32APSK45;							
											break;
										}
									case 26: 	
										{
											tp_info.code_rate_s2=_32APSK56;							
											break;
										}
									case 27: 	
										{
											tp_info.code_rate_s2=_32APSK89;							
											break;
										}
									case 28: 	
										{
											tp_info.code_rate_s2=_32APSK910;							
											break;
										}
									default: 		
										{
											tp_info.code_rate_s2=_8PSK23;
											break;
										}
										
								}
							break;
						}
					default:
						{
							tp_info.modu_mode=DVBS2;
							tp_info.code_rate_s=CR23;
							tp_info.code_rate_s2=_8PSK23;
							break;
						}
				}			
			}
	else
		{
			tp_info.modu_mode=UNKNOWN;
			tp_info.code_rate_s=CRXX;
			tp_info.code_rate_s2=CRXXX;
		}
	
	temp1=GX1132_Read_one_Byte(GX1132_FC_OFFSET_L);
	temp2=GX1132_Read_one_Byte(GX1132_FC_OFFSET_H);
	if(((temp2<<8)+temp1)<=32767)		rf_center_offset_KHz=(temp2<<8)+temp1;
	else if(((temp2<<8)+temp1)>32767) 	rf_center_offset_KHz=((temp2<<8)+temp1) - 65536;	
	if(gIQ_swap==1)	rf_center_offset_KHz=0-rf_center_offset_KHz;
	temp1=GX1132_Read_one_Byte(GX1132_BCS_RST);
	if((temp1&0x80)==0x00) bcs_on=1;
	fine_offset=GX1132_Get_Fine_Offset();	
	if((GX1132_Read_Lock_Status()>=EQU_LOCKED)&&(bcs_on==1))
		{
			temp1=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_H);			
			temp2=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_L);			
			if(((temp1<<8)+temp2)<=32767)	offset_bcs=(temp1<<8)+temp2;
			if(((temp1<<8)+temp2)>32767)		offset_bcs = ((temp1<<8)+temp2) - 65536;	
			if(gIQ_swap==0)	offset_bcs=0-offset_bcs;
			tp_info.Freq_true_KHz=(int)RF_Freq_K+rf_center_offset_KHz+offset_bcs+fine_offset.fc_offset_fine_K;				
			temp1=GX1132_Read_one_Byte(GX1132_BCS_FS_H);			
			temp2=GX1132_Read_one_Byte(GX1132_BCS_FS_L);			
			tp_info.SymolRate_true_Sps =(int)((temp1<<8)+temp2)*1000+fine_offset.fs_offset_fine_Sps;	
		}
	else if((GX1132_Read_Lock_Status()>=EQU_LOCKED)&&(bcs_on==0))
		{
			tp_info.Freq_true_KHz=(int)RF_Freq_K+fine_offset.fc_offset_fine_K;
 			tp_info.SymolRate_true_Sps=(int)Symbol_Rate_K*1000+fine_offset.fs_offset_fine_Sps;
		}
	else
		{
			tp_info.Freq_true_KHz=RF_Freq_K;
 			tp_info.SymolRate_true_Sps=Symbol_Rate_K*1000;
		}

	return tp_info;
}


/******************************************************************************
*Function: Perform one blind scan within a Lpf_BW window at Fcenter
*Input:
*	   Fcenter: the center freq to blind scan, unit:MHz
*	   Lpf_BW_window: the size of BW windowto blind scan, unit:KHz
*	   TP_Num_Previous_window: the TPs number of previous blind scan window
*Output:
*         the number of TPs in this window blind scan
*	    or FAILURE
*******************************************************************************/
unsigned int GX1132_BS_one_Window(unsigned int Fcenter,unsigned int Lpf_BW_window,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver)
{

	unsigned int 	TP_Num=0;
	unsigned char 	i;
	unsigned char	temp,temp1;	
	int	Fc_offset_Bs;
	unsigned int	Fs_Bs;

	temp=GX1132_Read_one_Byte(GX1132_AUTO_RST)&0xfe;			
	GX1132_Write_one_Byte(GX1132_AUTO_RST,temp);	
	GX1132_Set_Work_BS_Mode(1);		
	temp=GX1132_Read_one_Byte(GX1132_BCS_RST)&0xfe;		
	GX1132_Write_one_Byte(GX1132_BCS_RST, temp);
	
	GX1132_SetSymbolRate(Lpf_BW_window);	
	GX1132_Write_one_Byte(GX1132_FC_OFFSET_H,0x00);
	GX1132_Write_one_Byte(GX1132_FC_OFFSET_L,0x00);	
	GX1132_Set_Tuner_Repeater_Enable(1);	
	tunerDriver(Fcenter,Lpf_BW_window);	
#if 1		
	GX_Delay_N_ms(100);
#endif
	GX1132_Set_Tuner_Repeater_Enable(0);
	GX1132_HotReset_CHIP();	
	
	for(i=0;i<16;i++)
		{
			if(GX1132_Read_Lock_Status()>=BCS_LOCKED)	
				{
						break;
				}
			if(i==15)				
				return 0;				
			GX_Delay_N_ms(10);
		}	
	
	TP_Num = GX1132_Read_one_Byte(GX1132_VID_SIG_NUM)&0x1f;
	if((TP_Num!=0)&&(TP_Num<=size))
	{
		for(i=0;i<TP_Num;i++)
			{
				temp=(GX1132_Read_one_Byte(GX1132_BCS_OUT_ADDR)&0xe0)|i;				
				GX1132_Write_one_Byte(GX1132_BCS_OUT_ADDR,temp);				

				temp=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_H);				
				temp1=GX1132_Read_one_Byte(GX1132_BCS_FC_OFFSET_L);								
				if(((temp<<8)+temp1)<=32767)		Fc_offset_Bs = ((temp<<8)+temp1);
				if(((temp<<8)+temp1)>32767)		Fc_offset_Bs = ((temp<<8)+temp1)-65536;
				if(gIQ_swap==0)	Fc_offset_Bs=0 - Fc_offset_Bs;
				bstp_list->Freq_KHz = (int)Fcenter*1000+Fc_offset_Bs;	
				
				temp=GX1132_Read_one_Byte(GX1132_BCS_FS_H);				
				temp1=GX1132_Read_one_Byte(GX1132_BCS_FS_L);				
				Fs_Bs = (temp<<8)+temp1;
				bstp_list->SymRate_KSps=Fs_Bs;

				//louhq20100728
				print("5F[7:5]=%d,%dKHz,%dKSps", (int)((GX1132_Read_one_Byte(0x5F)>>5)&0x07),(int)(bstp_list->Freq_KHz),(int)Fs_Bs);

				if(Fs_Bs>5000)
					{
						if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)>=2)
					
							bstp_list++;
					}
				else if(Fs_Bs<=5000)
					{
						if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)>=3)
			
							bstp_list++;
					}
			}
	}
	else 		
		return 0;		
	
	return TP_Num;
}	

/******************************************************************************
*Function: Perform blind scan within Start_Freq to End_Freq
*Input:
*	   Start_Freq: the start freq of blind scan freq segment, unit:MHz
*	   Start_Freq: the end freq of blind scan freq segment, unit:MHz
*	   TP_Num_Previous_seg:the TPs number of previous blind scan segment
*Output:
*         the number of TPs in this freq segment
*	    or FAILURE
*******************************************************************************/
unsigned int GX1132_BS_Seg_Freq(unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver)
{
	unsigned int TP_Num=0;
	unsigned int Fcenter;
	unsigned int Bs_window_num=0;
	unsigned int	TP_Num_total=0;
	//unsigned int i;
	//GX1132_TP *dd = 	bstp_list;
	if(Start_Freq<950) Start_Freq=950;
	if(End_Freq>2150) End_Freq=2150;

	Fcenter=Start_Freq;
	do
		{			
			TP_Num=GX1132_BS_one_Window(Fcenter,GX1132_BS_WINDOW_SIZE_K,bstp_list,size,tunerDriver);				
			bstp_list += TP_Num;
			size -= TP_Num;	
			TP_Num_total+=TP_Num;
			Fcenter+=GX1132_BS_STEP_MHZ;					
			Bs_window_num+=1;
		}
	while(Fcenter<=(End_Freq+GX1132_BS_STEP_MHZ));	

	return TP_Num_total;
}	

/******************************************************************************
*Function: sort the BS TPs from low freq to high freq
*Input:
*	   Start_Freq: the start freq of blind scan freq segment, unit:MHz
*	   Start_Freq: the end freq of blind scan freq segment, unit:MHz
*	   TP_Num_Previous_seg:the TPs number of previous blind scan segment
*Output:
*         the number of TPs in this freq segment
*	    or FAILURE
*******************************************************************************/
unsigned int GX1132_BS_TP_Sort_Seg_Freq(unsigned int u32TunerPort, unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver)
{
	unsigned int i,n;
	int j;
	unsigned int k=0;
	unsigned int TP_Num=0;
	GX1132_TP temp_tp;	
	unsigned int deta_fc_K;
	unsigned int deta_fs_K;
	
	TP_Num=GX1132_BS_Seg_Freq(Start_Freq,End_Freq,bstp_list,size,tunerDriver);
	if (TP_Num==0) return 0;
	
	//sort the TPs in this segment according the Fc	
	bstp_list[TP_Num].Freq_KHz=0;
	bstp_list[TP_Num].SymRate_KSps = 0;	
	
	for(i=1;i<TP_Num;i++)
		{
			for(j=i-1;(bstp_list[j].Freq_KHz>bstp_list[j+1].Freq_KHz)&&(j>=0);j--)
				{
				 temp_tp = bstp_list[j];	bstp_list[j]=bstp_list[j+1];	bstp_list[j+1]=temp_tp;				
				}
		}	

/*	//Delete the tp ---louhq20100721
	bstp_list[TP_Num].Freq_KHz=0;
	bstp_list[TP_Num].SymRate_KSps = 0;	

	for(i=0;i<TP_Num; i++)
		{
			if(bstp_list[TP_Num].SymRate_KSps>=5000)
				{
					if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)<2)
						{									
							for(n=i;n<TP_Num-1;n++)
								{
									bstp_list[n]=bstp_list[n+1];												
								}
							TP_Num-=1;
							if (i>0)	i=i-1;
							bstp_list[TP_Num].Freq_KHz=0;
							bstp_list[TP_Num].SymRate_KSps = 0;	
						}
				}
			else
				{
					if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)<3)
						{								
							for(n=i;n<TP_Num-1;n++)
								{
									bstp_list[n]=bstp_list[n+1];												
								}
							TP_Num-=1;
							if (i>0)	i=i-1;
							bstp_list[TP_Num].Freq_KHz=0;
							bstp_list[TP_Num].SymRate_KSps = 0;	
						}
				}
		}
*/	
		 	
	//Delete the semblable TP	
	bstp_list[TP_Num].Freq_KHz=0;
	bstp_list[TP_Num].SymRate_KSps = 0;	
	for(i=0;i<TP_Num; i++)
		{
			if((bstp_list[i].Freq_KHz<945000)||(bstp_list[i].Freq_KHz>2155000)||(bstp_list[i].SymRate_KSps<800)||(bstp_list[i].SymRate_KSps>50000))
				{
					k+=1;									
					for(n=i;n<TP_Num-1;n++)
						{
							bstp_list[n]=bstp_list[n+1];												
						}
					TP_Num-=1;
					if (i>0)	i=i-1;
					bstp_list[TP_Num].Freq_KHz=0;
					bstp_list[TP_Num].SymRate_KSps = 0;	
				}
			else
				{
					j=i+1;					
					deta_fc_K =bstp_list[j].Freq_KHz - bstp_list[i].Freq_KHz;
					deta_fs_K =bstp_list[j].SymRate_KSps - bstp_list[i].SymRate_KSps;
					if(deta_fs_K<0) 
					deta_fs_K =bstp_list[i].SymRate_KSps - bstp_list[j].SymRate_KSps;
					if(((deta_fc_K<=bstp_list[i].SymRate_KSps/4)&&(deta_fc_K<=bstp_list[j].SymRate_KSps/4)
						&&(deta_fs_K<bstp_list[i].SymRate_KSps/32) && (deta_fs_K<bstp_list[j].SymRate_KSps/32))||(deta_fc_K<=500))
						{
							k+=1;									
							for(n=j;n<TP_Num-1;n++)
								{
									bstp_list[n]=bstp_list[n+1];																
								}
							TP_Num-=1;
							if (i>0) i=i-1;
							bstp_list[TP_Num].Freq_KHz=0;
					  		bstp_list[TP_Num].SymRate_KSps=0;
						}
				}			

		}
	
	return TP_Num;
}


/******************************************************************************
*Function: Perform step2 of blind scan and lock a TP scaned
*Input:
*	  Start_Freq:		
*	  End_Freq
*	   Polar: 			the set of polarity
*	   Tone_on: 		22K on/off
*Output:
*         the number of TPs on this satellite
*	    or FAILURE
*******************************************************************************/
unsigned char GX1132_BS_Lock_List(unsigned int u32TunerPort, unsigned int Start_Freq,unsigned int End_Freq,GX1132_TP *bstp_list,unsigned int size,
							  TunerDriver tunerDriver,bcs_callback lock_cb,GX1132_BsBack *BsbackPar)
{
	unsigned int TP_Num=0;	
	unsigned char i,j,k,m,temp1,temp2;		
	unsigned char	locked_flag;
	unsigned char	count;
	unsigned char val_5e, val_5f;
			
	TP_Num=GX1132_BS_TP_Sort_Seg_Freq(u32TunerPort,Start_Freq,End_Freq,bstp_list,size,tunerDriver);	
	
	BsbackPar->nMaxSub = TP_Num;
	BsbackPar->nSubStage = 0;
	BsbackPar->nMaskUpdate = BS_CB_SUB_STAGE | BS_CB_MAX_SUB;
	if (lock_cb(BsbackPar)==FALSE)
		return FALSE;
		
	for(i=0;i<TP_Num;i++)
	{
		//val_5e = GX1132_Read_one_Byte(0x5E);
		//val_5f = GX1132_Read_one_Byte(0x5F);
		
		print("[Scan TP %d]:%dMHz,%dKSps,Polar=%d,Tone=%d",
			i+1,(int)bstp_list[i].Freq_KHz/1000,(int)bstp_list[i].SymRate_KSps,bstp_list[i].V_polar,bstp_list[i]._22K_on);

	
		GX1132_lock_TP_BS(u32TunerPort, bstp_list[i], tunerDriver);
		locked_flag=0;
		m=0;
		k=0;		
		BsbackPar->nSubStage = i + 1;
		BsbackPar->nMaskUpdate = BS_CB_SUB_STAGE;
		count=30;
		/////louhq20100805
		for(j=0;j<count;j++)
			{					
				switch(GX1132_Read_Lock_Status())
					{
						case FEC_LOCKED:
							{
								m+=1;
								if(m>=1)		
									locked_flag=1;
								break;
							}
						case EQU_LOCKED:
							{
								if(j>=22)
									j+=1;
								break;
							}
						case CRL_LOCKED:
							{
								if(j>=18)
									j+=1;//louhq20100805
								break;
							}
						case TIM_LOCKED:
							{
								if(j>=18)
									j+=2;//louhq20100805
								break;
							}
						case BCS_LOCKED:
							{
								if(j>=18)
									j+=2;//louhq20100805
								break;
							}
						case AGC_LOCKED:
							{
								if(j>=18)
									j+=3;
								break;
							}
						case UNLOCKED:
							{
								if(j>=18)
									j+=4;
								break;
							}
					}
				if(locked_flag)	break;

				//////louhq20100805
				if(j>2)
					{
						if(bstp_list[i].SymRate_KSps>5000)
					{
						if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)<2)
							break;
					}
				if(bstp_list[i].SymRate_KSps<=5000)
					{
						if(((GX1132_Read_one_Byte(0x5F)>>5)&0x07)<3)
							break;
					}
				if(GX1132_Read_Lock_Status()>=TIM_LOCKED)
					{	
						temp1=GX1132_Read_one_Byte(0x4A);
						temp2=GX1132_Read_one_Byte(0x4B);
						print("temp2=%x",temp2);
						if((temp2&0x0F)>9)
							{	
								break;
									}
							}
					}
				///////////////////
		if(bstp_list[i].SymRate_KSps<=5000)	GX_Delay_N_ms(100);
		else	if((bstp_list[i].SymRate_KSps>5000)&&(bstp_list[i].SymRate_KSps<=10000))	GX_Delay_N_ms(75);
			else			GX_Delay_N_ms(50);
				}
		if(locked_flag)
			{
				BsbackPar->tpinfo = GX1132_Get_TP_Info(bstp_list[i].Freq_KHz,bstp_list[i].SymRate_KSps);
				BsbackPar->nMaskUpdate |= BS_CB_RESULT;
			}		

		if (lock_cb(BsbackPar)==FALSE)
			return FALSE;

		if(!locked_flag)
		{
			val_5e = GX1132_Read_one_Byte(0x5E);
			val_5f = GX1132_Read_one_Byte(0x5F);
			print("!!!Not locked!, 5E[7:0]=%d, 5F[7:5]=%d,5F[4:0]=%d", (int)val_5e, (int)(val_5f >>5), (int)(val_5f & 0x1F));
		}
	}
	
	return 1;
}

/******************************************************************************
*Function: Perform blind scan and lock on a satellite
*Input:
*	   Ku: 			the type of LNB and antenna, 0 is C band, 1 is Ku band
*	   dual_local_osc: 	the type of LNB, 0 is single local osc, 1 is dual local osc
*Output:
*         the number of TPs on this satellite
*	    or FAILURE
*******************************************************************************/
unsigned char GX1132_BS_lock_a_Satellite(unsigned int u32TunerPort, GX1132_BCS_TYPE *bcs_type,GX1132_TP *bstp_list,unsigned int size,TunerDriver tunerDriver,
                                                               bcs_callback lock_cb,GX1132_BsBack *BsbackPar)
{
	unsigned int i;
		
	if(bcs_type->Start_Freq_MHz<950) bcs_type->Start_Freq_MHz=950;
	if(bcs_type->End_Freq_MHz>2150) bcs_type->End_Freq_MHz=2150;		
	
	if(bcs_type->dual_local_osc_LNB==0)
		{				
			//H polarity
			BsbackPar->nMaxMain=2;
			BsbackPar->nMainStage=1;
			BsbackPar->nMaskUpdate=BS_CB_MAX_MAIN|BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(0);
			GX1132_22K_sw(0);
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=0;
					bstp_list[i]._22K_on=0;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;							

			//V polarity
			BsbackPar->nMainStage=2;
			BsbackPar->nMaskUpdate=BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;

			GX1132_Set_Polar(1);
			GX1132_22K_sw(0);
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=1;
					bstp_list[i]._22K_on=0;
				}

			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;							
			
			return 1;
		}
	else if((bcs_type->dual_local_osc_LNB==1)&&(bcs_type->Ku_LNB==0))
		{				
			BsbackPar->nMaxMain=1;
			BsbackPar->nMainStage=1;
			BsbackPar->nMaskUpdate=BS_CB_MAX_MAIN|BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(0);
			GX1132_22K_sw(0);		
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=0;
					bstp_list[i]._22K_on=0;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;	
				
			return 1;
		}
	else if((bcs_type->dual_local_osc_LNB==1)&&(bcs_type->Ku_LNB==1))
		{
			//low osc H pol
			BsbackPar->nMaxMain=4;
			BsbackPar->nMainStage=1;
			BsbackPar->nMaskUpdate=BS_CB_MAX_MAIN|BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(0);
			GX1132_22K_sw(0);	
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=0;
					bstp_list[i]._22K_on=0;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;					

			//low osc V pol
			BsbackPar->nMainStage=2;
			BsbackPar->nMaskUpdate=BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(1);
			GX1132_22K_sw(0);	
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=1;
					bstp_list[i]._22K_on=0;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;				

			//high osc H pol	
			BsbackPar->nMainStage=3;
			BsbackPar->nMaskUpdate=BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(0);
			GX1132_22K_sw(1);	
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=0;
					bstp_list[i]._22K_on=1;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;					
			
			//high osc V pol	
			BsbackPar->nMainStage=4;
			BsbackPar->nMaskUpdate=BS_CB_MAIN_STAGE;
			if (lock_cb(BsbackPar)==FALSE)
				return FALSE;
			
			GX1132_Set_Polar(1);
			GX1132_22K_sw(1);	
			for(i=0;i<size;i++)
				{
					bstp_list[i].V_polar=1;
					bstp_list[i]._22K_on=1;
				}
			if(GX1132_BS_Lock_List(u32TunerPort, bcs_type->Start_Freq_MHz,bcs_type->End_Freq_MHz,bstp_list,size,
							 tunerDriver,lock_cb,BsbackPar)==FALSE)
				return FALSE;			
			
			return 1;
		}		
	
	return 0;	
}

GX1132_STATE GX1132_set_tuner(unsigned int RFfreq,unsigned int Symbol_Rate)

{
	GX1132_STATE nReturnValue = 0;
    #if TUNER_SHARP7306 
	    nReturnValue = GX_Set_Sharp7306(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

     #if TUNER_RDA5812 
           nReturnValue = GX_Set_RDA5812(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

     #if TUNER_ZL10037 
           nReturnValue = GX_Set_ZL10037(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

     #if 0 //TUNER_AV2011
           nReturnValue = GX_Set_AV2011(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

     #if TUNER_LW37
           nReturnValue = GX_Set_LW37(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

	#if TUNER_WZ5001
           nReturnValue = GX_Set_WZ5001(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif
	
     #if TUNER_STV6110A 
	    nReturnValue = GX_Set_STV6110A(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

    #if 0 //TUNER_MJ9014S
    		printk("TUNER_MJ9014S : RFfreq=%d, Symbol_Rate=%d\n",RFfreq, Symbol_Rate);
           nReturnValue = GX_Set_MJ9014S(RFfreq,Symbol_Rate);
           return nReturnValue;
    #endif

	#if (TUNER_AV2011==1) && (TUNER_MJ9014S==1)
		if(EnableTunerAV2011 == 1)
		{
			//printk("TUNER_AV2011 : RFfreq=%d, Symbol_Rate=%d\n",RFfreq, Symbol_Rate);
			nReturnValue = GX_Set_AV2011(RFfreq,Symbol_Rate);
			return nReturnValue;
		}
		else
		{
			//printk("TUNER_MJ9014S : RFfreq=%d, Symbol_Rate=%d\n",RFfreq, Symbol_Rate);
			nReturnValue = GX_Set_MJ9014S(RFfreq,Symbol_Rate);
			return nReturnValue;
		}
	#elif (TUNER_AV2011==1) && (TUNER_MJ9014S==0)
		nReturnValue = GX_Set_AV2011(RFfreq,Symbol_Rate);
		return nReturnValue;
	#elif (TUNER_AV2011==0) && (TUNER_MJ9014S==1)
		nReturnValue = GX_Set_MJ9014S(RFfreq,Symbol_Rate);
		return nReturnValue;
	#endif
    
}
unsigned char GX1132_DATA_CATCH_AGC(unsigned int S_freq_MHz,unsigned int E_freq_MHz,unsigned int BW_window,
								TunerDriver tunerDriver)
{
	unsigned int Fcenter;
	unsigned int	i=0,j,k;
	unsigned int	AGC_N[256] = {0};
	GX1132_LOCK_STATUS  temp;
	Fcenter=S_freq_MHz;	
	do
		{
			//i+4;
			//print("Fcenter=%dMHz",Fcenter);
			//print("spectrum scan,Debug,step%d",i);
			GX1132_Set_Tuner_Repeater_Enable(1);	
			tunerDriver(Fcenter,BW_window);	
#if 1		
			GX_Delay_N_ms(100);
#endif
			GX1132_Set_Tuner_Repeater_Enable(0);
			GX1132_HotReset_CHIP();
			temp=GX1132_Read_Lock_Status();
			while(1)
				{
					if(temp>=AGC_LOCKED)
						break;
					temp=GX1132_Read_Lock_Status();
				}
			for(k=0;k<1;k++)
			{
				i++;
				temp=GX1132_Get_Signal_Strength();
				//temp=temp*3-180;
				if(temp<=1)
					temp=1;
				if(temp>=100)
					temp=100;
				AGC_N[i]=temp;
				j=i;
				// fix me : data_agc_cb( temp,j);
			}

			//print("AGC_N[%d]=%d%",i,AGC_N[i]);
			Fcenter+=BW_window/1000;	
			
		}while(Fcenter<E_freq_MHz);
	return 1;
}

unsigned char GX1132_Const(void)
{	
	int catch_finish=0,i,j;
	//int a;
	int tmp,auto_rst_ena_tmp,auto_rst_Nena;
 	auto_rst_ena_tmp=GX1132_Read_one_Byte(0x36);
 	auto_rst_Nena = auto_rst_ena_tmp & 0xFE;
 	GX1132_Write_one_Byte(0x36,auto_rst_Nena);
	GX1132_Write_one_Byte(0x38,0x53);
     	for(i=0;i<20;i++)
		{
			catch_finish = GX1132_Read_one_Byte(0x39)&0x80;
			print("catch_finish=%d",catch_finish);
			if(catch_finish)
				{
					print("catch_finish");
					break;
				}
			GX_Delay_N_ms(50);	
     		}
	//GX1132_Read_one_Byte(0x3B);
	for(i=0;i<=31;i++)
	  {  
		dat[i]=GX1132_Read_one_Byte(0x3B);
		//print( "dat[i]= %d,i=%d",dat[i],i);
	  }
	GX1132_Write_one_Byte(0x38,0x50);
 	GX1132_Write_one_Byte(0x36,auto_rst_ena_tmp);
     if(i!=32)
     {
	 return 0;
     }

	for(j=0;j<=31;j++)
	{
        	tmp= dat[j]&0x7F;
		 if(tmp>63)
		dat[j]=tmp-128;
	}
	return 1;
}

unsigned char GX1132_SendTone(int mode)
{	
	unsigned char	temp;
	
	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	

	temp=GX1132_Read_one_Byte(GX1132_DISEQC_MODE);	
	temp &= 0xF8;
	if(mode == 1)
		temp |= 0x02;	
	else if(mode == 2)
		temp |= 0x03;	
		
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);
	
	return SUCCESS;
}


unsigned char GX1132_SendDiseqc(unsigned char *data, int len)
{	
	unsigned char	temp,diseqc_mode;
	int i;
	
	if( len > 8 )
		return FAILURE;
	
	//diag_printf("GX1132_SendDiseqc : len %d\n", len);

	diseqc_mode=GX1132_Read_one_Byte( GX1132_DISEQC_MODE);

	temp=GX1132_Read_one_Byte(GX1132_MODULE_RST);	
	temp=temp&0xbf;
	GX1132_Write_one_Byte(GX1132_MODULE_RST, temp);	

	for(i = 0; i < len; i++)
		GX1132_Write_one_Byte(GX1132_DISEQC_INS1+i, data[i]);	
		
	temp =  (diseqc_mode&0xc0) | ((len-1) << 3) | 0x4;	
	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,temp);	
	GX_Delay_N_ms(30);
	
	for(i = 0;i<1000;i++)
	{
		temp= GX1132_Read_one_Byte(GX1132_DISEQC_RD_INT);		
		if( (temp&0x10) == 0x10)
			break;		
		else if(i==999)
		{
			//diag_printf("GX1132_SendDiseqc : ERROR\n");
			return FAILURE;		
		}
		GX_Delay_N_ms(5);
	}

	GX1132_Write_one_Byte(GX1132_DISEQC_MODE,diseqc_mode);

	return SUCCESS;     
}

#endif

