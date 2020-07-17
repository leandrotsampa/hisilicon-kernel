/******************************************************************************** 
* (c) COPYRIGHT 2013 NationalChip, Inc. ALL RIGHTS RESERVED.
* 
* This software is the property of NationalChip and is furnished under license by NationalChip.                
* This software may be used only in accordance with the terms of said license.                         
* This copyright noitce may not be remoced, modified or obliterated without the prior                  
* written permission of NationalChip, Inc.                                                                 
*                                                                                                      
* This software may not be copied, transmitted, provided to or otherwise made available                
* to any other person, company, corporation or other entity except as specified in the                 
* terms of said license.                                                                               
*                                                                                                      
* No right, title, ownership or other interest in the software is hereby granted or transferred.       
*                                                                                                      
* The information contained herein is subject to change without notice and should 
* not be construed as a commitment by NationalChip, Inc.                                                                    
* 
* TITLE 	  : NationalChip DBS RF services source file. 
*
* FILENAME    : dbs_rf_mj0914s.c
*
* DESCRIPTION : 
*		Library of routines to initialize, and operate on, the NationalChip RF chip.
*
********************************************************************************/
 
/******************************************************************************** 
* REVISION HISTORY
*
*    DATE	  	  NAME				REMARKS
* ----------  -------------    --------------------------------------------------
* 01/09/2013                       Created.                                                     
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


#include "GX1132.h"

#define TUNER_I2C_ADDR	0xC2  //0xC6
#define TUNER_I2C_FUNC	GX_I2cReadWrite2
//#include "dbs_rf_mj0914s.h"

//#define MJ0914S_CHIP_ADDR	0xC2 
#define MJ0914S_DELAY_MS(ms)   // Sleep(ms) 
#define MJ0914S_SRC_CLK_FREQ_KHz			27000 //16000

#define PLLF_MAX(a,b) ((a)>(b) ? 1:0)

#if (MJ0914S_SRC_CLK_FREQ_KHz ==16000)
    #define PLLF_BOUNDARY_VALUE  (0x4000)
    #define PLLF_CHK_VALUE (0x7FFF)
    #define PLLF_MASK_VALUE (0xFFFF8000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==18000)
    #define PLLF_BOUNDARY_VALUE  (0x3C3C)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==20000)
	#define PLLF_BOUNDARY_VALUE  (0x3333)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==24000)
	#define PLLF_BOUNDARY_VALUE  (0x2AAA)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==26000)
	#define PLLF_BOUNDARY_VALUE  (0x2762)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==27000)
	#define PLLF_BOUNDARY_VALUE  (0x25ED)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==32000)
	#define PLLF_BOUNDARY_VALUE  (0x2000)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#elif (MJ0914S_SRC_CLK_FREQ_KHz ==36000)
	#define PLLF_BOUNDARY_VALUE  (0x1C71)
	#define PLLF_CHK_VALUE (0x1FFF)
	#define PLLF_MASK_VALUE (0xFFFFE000)
#else
	#define PLLF_BOUNDARY_VALUE  (0x25ED)
	#define PLLF_CHK_VALUE (0x3FFF)
	#define PLLF_MASK_VALUE (0xFFFFC000)
#endif

#define MJ0914S_AGC_POL_INVERSE
//#define MJ0914S_AGC_POL_NORMAL

#define MJ0914S_SUCCESS							0
#define MJ0914S_INVAILD_LPF_BW_TYPE				-1
#define MJ0914S_INVAILD_FREQUENCY_RANGE			-2
#define MJ0914S_INVAILD_RF_BAND                 -3

typedef struct
{
	unsigned char	bReg;
	unsigned char	bVal;
}MJ0914S_REG_INIT_INFO;

typedef struct
{
	unsigned char	CB15_I2C;
	unsigned char	CB24_I2C;
	unsigned char	CB3_I2C;
	unsigned char	RSB_I2C;
}MJ0914S_SET_LPF_INFO;


#define MJ0914S_RSSI_DIVIDER 10 //10.0 


#if 0
#define	MJ0914S_REG_GET(reg)					TUNER_I2C_FUNC(READ, TUNER_I2C_ADDR, (unsigned char)reg, 1)           		//mj0914s_i2c_read((unsigned char)(reg))
#define	MJ0914S_REG_SET(reg, val)				TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, (unsigned char)reg, (unsigned char)val, 1)       	//	mj0914s_i2c_write((unsigned char)(reg), (unsigned char)(val))
#define	MJ0914S_REG_MASK_SET(reg, mask, val) 								\
		do {																\
			unsigned char tmp;															\
			tmp = (MJ0914S_REG_GET(reg)|(unsigned char)(mask)) & (unsigned char)((~(mask))|(val));	\
			MJ0914S_REG_SET(reg, tmp);											\
		} while(0)
#endif

unsigned char MJ0914S_REG_GET(unsigned char reg)
{
	unsigned char rdata = 0;
	TUNER_I2C_FUNC(READ, TUNER_I2C_ADDR, reg, &rdata, 1);
	return rdata;	
}

unsigned char MJ0914S_REG_SET(unsigned char reg, unsigned char val)
{
	unsigned char ret = 1;
	ret = TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg, &val, 1);
	return ret;
}

void MJ0914S_REG_MASK_SET(unsigned char reg, unsigned char mask, unsigned char val)
{
	unsigned char tmp;
	tmp = (MJ0914S_REG_GET(reg)|(unsigned char)(mask)) & (unsigned char)((~(mask))|(val));
	MJ0914S_REG_SET(reg, tmp);
}
		
MJ0914S_REG_INIT_INFO t_MJ0914S_INIT[] =   
{
	{0x20,	0x0b},
	{0x21,	0xb8},
	{0x22,	0x09},
	{0x26,	0x81},
	{0x27,	0x20},
	{0x28,	0xe2},
	{0x29,	0xd4},
	{0x2a,	0x02},
	{0x2b,	0x0c},
	{0x2c,	0x00},
	{0x2d,	0x2f},
	{0x2e,	0x10},
	{0x2f,	0x80},
	{0x30,	0x10},
	{0x31,	0x8c},
	{0x32,	0x17},
	{0x33,	0x34},
	{0x34,	0x30},
	{0x35,	0x4a},
	{0x36,	0x81},
	{0x37,	0x92},
	{0x38,	0x90},
	{0x39,	0x18},
	{0x3a,	0x00},
	{0x3b,	0x44},
	{0x3c,	0x92},
	{0x3d,	0x85},
	{0x3e,	0x00},
	{0x3f,	0x00},
	{0x40,	0xff},
	{0x41,	0x57},
	{0x42,	0x9a},
	{0x43,	0x04}
}; 


MJ0914S_SET_LPF_INFO g_atLpfBwSetValue[]= 
{
	{   0x60, 	0x58, 	0x50, 	0x8 },    //4  
	{   0x52, 	0x34, 	0x40, 	0x8 },	  //5
	{   0x70, 	0x80, 	0x60, 	0x4 },	  //6
	{   0x60, 	0x60, 	0x58, 	0x4 },	  //7
	{   0x60, 	0x58, 	0x38, 	0x4 },	  //8
	{   0x58, 	0x48, 	0x30, 	0x4 },	  //9
	{  	0x52, 	0x34, 	0x24, 	0x4 },	  //10
	{  	0x70, 	0x88, 	0x68, 	0x2 },	  //11
	{  	0x70, 	0x80, 	0x48, 	0x2 },	  //12
	{  	0x60, 	0x60, 	0x40, 	0x2 },	  //13
	{  	0x60, 	0x58, 	0x40, 	0x2 },	  //14
	{  	0x58, 	0x50, 	0x40, 	0x2 },	  //15
	{  	0x58, 	0x50, 	0x30, 	0x2 },	  //16
	{  	0x52, 	0x48, 	0x28, 	0x2 },	  //17
	{  	0x48, 	0x40, 	0x28, 	0x2 },	  //18
	{  	0x40, 	0x38, 	0x28, 	0x2 },	  //19
	{  	0x40, 	0x34, 	0x20, 	0x2 },	  //20
	{  	0x70, 	0x88, 	0x58, 	0x1 },	  //21
	{  	0x70, 	0x80, 	0x50, 	0x1 },	  //22
	{  	0x68, 	0x70, 	0x50, 	0x1 },	  //23
	{  	0x68, 	0x70, 	0x48, 	0x1 },	  //24
	{  	0x68, 	0x70, 	0x38, 	0x1 },	  //25
	{  	0x60, 	0x60, 	0x40, 	0x1 },	  //26
	{  	0x60, 	0x58, 	0x40, 	0x1 },	  //27
	{  	0x58, 	0x50, 	0x40, 	0x1 },	  //28
	{  	0x58, 	0x50, 	0x38, 	0x1 },	  //29
	{  	0x58, 	0x50, 	0x34, 	0x1 },	  //30
	{  	0x52, 	0x48, 	0x38, 	0x1 },	  //31
	{  	0x48, 	0x40, 	0x38, 	0x1 },	  //32
	{  	0x40, 	0x38, 	0x40, 	0x1 },	  //33
	{  	0x40, 	0x34, 	0x40, 	0x1 },	  //34
	{  	0x40, 	0x30, 	0x3c,	0x1 },	  //35
	{  	0x38, 	0x30, 	0x3c,	0x1 },	  //36
	{  	0x30, 	0x30, 	0x34, 	0x1 },	  //37
	{  	0x30, 	0x2c,	0x34, 	0x1 },	  //38
	{  	0x2c,	0x2c,	0x30, 	0x1 },	  //39
	{  	0x28, 	0x28, 	0x24, 	0x1 }	  //40
};	  

unsigned char g_aeLpfBwType;

int mj0914sRF_ChangeLpfBwType(unsigned int dwSymbolRateKsps, unsigned char uRollOff)
{	
    unsigned char uReg26=0;
	unsigned char uCalculatedLPF=0;
	unsigned int dwSymbolrateReconfig=0;

	dwSymbolrateReconfig = dwSymbolRateKsps * (100 + uRollOff);
    dwSymbolrateReconfig = (dwSymbolrateReconfig >> 1) * 120;

    uCalculatedLPF = (dwSymbolrateReconfig/10000000) + 1;   //ksps(1000) * rolloff(100) * 120(100) = 10000000 is to be MHz of LPF Setting.// +1 means ceil().

  	if(uCalculatedLPF < 4 ) uCalculatedLPF = 4;
	else if( uCalculatedLPF > 40)  uCalculatedLPF = 40;
	else uCalculatedLPF = uCalculatedLPF;

	if(g_aeLpfBwType == uCalculatedLPF)
	return MJ0914S_SUCCESS;

    uReg26 = MJ0914S_REG_GET(0x26);

	MJ0914S_REG_SET(0x32, ((g_atLpfBwSetValue[uCalculatedLPF-4].CB15_I2C << 1) | 0x01));  //EN_EXT_LPFCON = 1
	MJ0914S_REG_SET(0x33, g_atLpfBwSetValue[uCalculatedLPF-4].CB24_I2C);
	MJ0914S_REG_SET(0x34, g_atLpfBwSetValue[uCalculatedLPF-4].CB3_I2C);
	MJ0914S_REG_MASK_SET(0x35,0xF0,(g_atLpfBwSetValue[uCalculatedLPF-4].RSB_I2C << 4));

	MJ0914S_REG_SET(0x26,(uReg26 | 0x40));  // LPFBW_I2C<0> = 1  
	MJ0914S_REG_SET(0x26,(uReg26 & 0xBF));  // LPFBW_I2C<0> = 0  
	
	g_aeLpfBwType = uCalculatedLPF;
	
	return MJ0914S_SUCCESS;	
}

int mj0914sRF_SetVcoBand(unsigned int dwLoFreq)
{
    int nRet;
	unsigned char nVcoBandI2C;
	
	if((dwLoFreq > 900000)&&(dwLoFreq < 1175000)) 
	{
	 	nVcoBandI2C = 2;
	}
    else if((dwLoFreq >= 1175000)&&(dwLoFreq < 1750000)) 
    {
	 	nVcoBandI2C = 1;
    }
	else if((dwLoFreq >= 1750000)&&(dwLoFreq < 2200000)) 
	{
     	nVcoBandI2C = 0;
	}	
	else 
		return  MJ0914S_INVAILD_FREQUENCY_RANGE;

	MJ0914S_REG_MASK_SET(0x23, 0xC0,nVcoBandI2C << 6 );

	nRet = MJ0914S_SUCCESS;
	
	return nRet;
}

int mj0914sRF_SetFrequency( unsigned int dwChFreqKHz,unsigned int dwSymbolRateKsps, unsigned char uRollOff)
{

	unsigned char pllf_mul=0, r_div=4;
	unsigned int dwPLLN,dwPLLF, dwPLLNF;
	unsigned int dwPLLFRefkVal=0,dwPLLFCkeckVal=0,dwPLLFMaskVal=0; 
		
	if(mj0914sRF_ChangeLpfBwType(dwSymbolRateKsps,uRollOff)!= MJ0914S_SUCCESS)
		return MJ0914S_INVAILD_LPF_BW_TYPE;
	
	if( mj0914sRF_SetVcoBand( dwChFreqKHz) != MJ0914S_SUCCESS)
		return MJ0914S_INVAILD_FREQUENCY_RANGE;

	dwPLLN = ( dwChFreqKHz / MJ0914S_SRC_CLK_FREQ_KHz  );		
	dwPLLF = dwChFreqKHz -(dwPLLN * MJ0914S_SRC_CLK_FREQ_KHz);
	if (MJ0914S_SRC_CLK_FREQ_KHz==13000 || MJ0914S_SRC_CLK_FREQ_KHz==27000)
	{
		pllf_mul=1;
		r_div=3;
	}
	
	if(dwPLLN < 40)   
	{
		MJ0914S_REG_MASK_SET(0x22, 0x01, 0x00);
		MJ0914S_REG_MASK_SET(0x26, 0x0E, 0x02);
		dwPLLNF = ((dwPLLN << 20 ) + (  ((dwPLLF <<16) / (MJ0914S_SRC_CLK_FREQ_KHz>>r_div))  << pllf_mul));
		dwPLLFRefkVal = PLLF_BOUNDARY_VALUE << 1;
		dwPLLFCkeckVal= (PLLF_CHK_VALUE << 1 ) + 1;
		dwPLLFMaskVal= (PLLF_MASK_VALUE  << 1 );
	}
	else
	{
		MJ0914S_REG_MASK_SET(0x22, 0x01, 0x01);
        MJ0914S_REG_MASK_SET(0x26, 0x0E, 0x00);
		dwPLLNF = ((dwPLLN << 20 ) + (  ((dwPLLF <<16) / (MJ0914S_SRC_CLK_FREQ_KHz>>r_div))  << pllf_mul)) >> 1;
		dwPLLFRefkVal = PLLF_BOUNDARY_VALUE;
		dwPLLFCkeckVal= PLLF_CHK_VALUE;
		dwPLLFMaskVal= PLLF_MASK_VALUE;
	}

	 if(PLLF_MAX(dwPLLFRefkVal,(dwPLLNF & dwPLLFCkeckVal )))
	 	 dwPLLNF = (dwPLLNF & dwPLLFMaskVal) + dwPLLFRefkVal;
	 	
	 /* Important :  Do not modify the writing sequence */
	MJ0914S_REG_SET(0x24, ((dwPLLNF>>7) & 0xFF));
	MJ0914S_REG_SET(0x25, (((dwPLLNF & 0x7F)<<1) | ((dwPLLNF>>29) & 0x01)));
	MJ0914S_REG_MASK_SET(0x31, 0x01, ((dwPLLNF>>28) & 0x01));
	MJ0914S_REG_MASK_SET(0x20, 0x1F, (dwPLLNF>>23) & 0x1F);
	/*Address 0x21 must be written as last of PLL value setting sequence*/
	MJ0914S_REG_SET(0x21, (dwPLLNF>>15) & 0xFF);
	
	MJ0914S_DELAY_MS(1);  //1ms Delay	
		
	return MJ0914S_SUCCESS;
}

int mj0914sRF_ConfigureLpfBwType(unsigned int dwSymbolRateKsps, unsigned char uRollOff)
{

	unsigned char uReg26=0;
	unsigned char uCalculatedLPF=0;
	unsigned int dwSymbolrateReconfig=0;

	dwSymbolrateReconfig = dwSymbolRateKsps * (100 + uRollOff);
    dwSymbolrateReconfig = (dwSymbolrateReconfig >> 1) * 120;

    uCalculatedLPF = (dwSymbolrateReconfig/10000000) + 1;   //ksps(1000) * rolloff(100) * 120(100) = 10000000 is to be MHz of LPF Setting. +1 means ceil().

  	if(uCalculatedLPF < 4 ) uCalculatedLPF = 4;
	else if( uCalculatedLPF > 40)  uCalculatedLPF = 40;
	else uCalculatedLPF = uCalculatedLPF;
	
    uReg26 = MJ0914S_REG_GET(0x26);

	MJ0914S_REG_SET(0x32, ((g_atLpfBwSetValue[uCalculatedLPF-4].CB15_I2C << 1) | 0x01));  //EN_EXT_LPFCON = 1
	MJ0914S_REG_SET(0x33, g_atLpfBwSetValue[uCalculatedLPF-4].CB24_I2C);
	MJ0914S_REG_SET(0x34, g_atLpfBwSetValue[uCalculatedLPF-4].CB3_I2C);
	MJ0914S_REG_MASK_SET(0x35,0xF0,(g_atLpfBwSetValue[uCalculatedLPF-4].RSB_I2C << 4));

	MJ0914S_REG_SET(0x26,(uReg26 | 0x40));  // LPFBW_I2C<0> = 1  
	MJ0914S_REG_SET(0x26,(uReg26 & 0xBF));  // LPFBW_I2C<0> = 0  
	

	g_aeLpfBwType = uCalculatedLPF;

	return MJ0914S_SUCCESS;
}

int  mj0914sRF_GetRSSI(void)
{
  int rssi=0;
  unsigned char uReg05=0;
  
  uReg05 = MJ0914S_REG_GET(0x05);

  //rssi = (-0.7*MJ0914S_RSSI_DIVIDER)  * (uReg05 - 60 );

  return rssi;
}

int mj0914sRF_Initilize(unsigned int dwSymbolRateKsps, unsigned char uRollOff)
{

	unsigned int nNumTblEntry=0;
	const MJ0914S_REG_INIT_INFO *ptInitTbl = NULL;
	
	ptInitTbl = t_MJ0914S_INIT;
	nNumTblEntry = sizeof(t_MJ0914S_INIT) / sizeof(MJ0914S_REG_INIT_INFO);
		
	do
	{
		MJ0914S_REG_SET(ptInitTbl->bReg, ptInitTbl->bVal);
		ptInitTbl++;						
	} while( --nNumTblEntry );

#if defined(MJ0914S_AGC_POL_INVERSE)
	MJ0914S_REG_SET(0x23, 0x40);
#elif defined(MJ0914S_AGC_POL_NORMAL)
	MJ0914S_REG_SET(0x23, 0x42);
#else 
    #error "AGC Polarity type is not defined"
#endif 
	return mj0914sRF_ConfigureLpfBwType(dwSymbolRateKsps,uRollOff);
}

GX1132_STATE GX_Set_MJ9014S(u32 RFfreq,u32 Symbol_Rate)
{
	mj0914sRF_Initilize(Symbol_Rate, 0);
	mj0914sRF_SetFrequency( RFfreq*1000,Symbol_Rate, 0);
	return 0;
}
