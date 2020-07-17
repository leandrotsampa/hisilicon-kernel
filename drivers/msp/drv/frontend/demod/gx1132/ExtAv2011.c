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

#define TUNER_I2C_ADDR	0xC6
#define TUNER_I2C_FUNC	GX_I2cReadWrite2

static u8 reg[50] = {0};
static u8 tuner_crystal =  27;
static u8 tuner_initial = 0; 

GX1132_STATE GX_Av2011_Initialize(void)
{
	GX1132_STATE r = 0;
	u8 reg_start=0;

	if (! tuner_initial) 
	{
#if 1
		reg[0]=0x38;
		reg[1]=0x00;
		reg[2]=0x00;
		reg[3]=0x50;
		reg[4]=0x1f;
		reg[5]=0xa3;
		reg[6]=0xfd;
		reg[7]=0x58;
		//reg[8]=0x3f;
		
		//reg[8]=(char) (0x0e); MDKIM  1.5db->7.5db
		//reg[8]=(char) (0x2e); 
		reg[8] = (0x7<<3) | 0x04 | 0x03;		
		
		//printf("BB GAIN is %.1fdB 	",(float)(((reg[8]&0x78)>>3)*15)/10);
		//printf("BB driver Current is %.1fmA	  REG[8] = 0x%x\n",(float)(((reg[8]&0x03)+1)*5)/10, reg[8]);

		reg[9]=0x82;
		reg[10]=0x88;
		reg[11]=0xb4;
		reg[12]=0xd6; //RFLP=ON at Power on initial
		reg[13]=0x40;
#if 1 //def AV2011_Tuner
		reg[14]=0x94;
		reg[15]=0x4a;
#else
		reg[14]=0x5b;
		reg[15]=0x6a;
#endif
		reg[16]=0x66;
		reg[17]=0x40;
		reg[18]=0x80;
		reg[19]=0x2b;
		reg[20]=0x6a;
		reg[21]=0x50;
		reg[22]=0x91;
		reg[23]=0x27;
		reg[24]=0x8f;
		reg[25]=0xcc;
		reg[26]=0x21;
		reg[27]=0x10;
		reg[28]=0x80;
		reg[29]=0x02;
		reg[30]=0xf5;
		reg[31]=0x7f;
		reg[32]=0x4a;
		reg[33]=0x9b;
		reg[34]=0xe0;
		reg[35]=0xe0;
		reg[36]=0x36;
		reg[37]=0x00; //Disble FT-function at Power on initial
		reg[38]=0xab;
		reg[39]=0x97;
		reg[40]=0xc5;
		reg[41]=0xa8;
		
#else
		reg[0]=(char) (0x38);
		reg[1]=(char) (0x00);
		reg[2]=(char) (0x00);
		reg[3]=(char) (0x50);
		reg[4]=(char) (0x1f);
		reg[5]=(char) (0xa3);
		reg[6]=(char) (0xfd);
		reg[7]=(char) (0x58);
		reg[8]=(char) (0x0e);
		reg[9]=(char) (0x82);
		reg[10]=(char) (0x88);
		reg[11]=(char) (0xb4);
		reg[12]=(char) (0xd6); //RFLP=ON at Power on initial
		reg[13]=(char) (0x40);
		
		reg[14]=(char) (0x94); //av2011
		reg[15]=(char) (0x4a); //av2011
		//reg[14]=(char) (0x5b);  // av2010
		//reg[15]=(char) (0x6a);  // av2010
		
		reg[16]=(char) (0x66);
		reg[17]=(char) (0x40);
		reg[18]=(char) (0x80);
		reg[19]=(char) (0x2b);
		reg[20]=(char) (0x6a);
		reg[21]=(char) (0x50);
		reg[22]=(char) (0x91);
		reg[23]=(char) (0x27);
		reg[24]=(char) (0x8f);
		reg[25]=(char) (0xcc);
		reg[26]=(char) (0x21);
		reg[27]=(char) (0x10);
		reg[28]=(char) (0x80);
		reg[29]=(char) (0x02);
		reg[30]=(char) (0xf5);
		reg[31]=(char) (0x7f);
		reg[32]=(char) (0x4a);
		reg[33]=(char) (0x9b);
		reg[34]=(char) (0xe0);
		reg[35]=(char) (0xe0);
		reg[36]=(char) (0x36);
		//monsen 20080710. Disble FT-function at Power on initial
		//reg[37]=(char) (0x02);
		reg[37]=(char) (0x00);
		reg[38]=(char) (0xab);
		reg[39]=(char) (0x97);
		reg[40]=(char) (0xc5);
		reg[41]=(char) (0xa8);
#endif
		reg_start = 0;
		
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start, reg,12);	
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Time delay 1ms
		GX_Delay_N_ms(1); 
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Sequence 2
		// Send Reg13 ->Reg24
		reg_start = 13;

		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+13,12);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Send Reg25 ->Reg35
		reg_start= 25;

		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+25,11);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);

		// Send Reg36 ->Reg41
		reg_start = 36;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+36,6);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);



		// Time delay 1ms
		GX_Delay_N_ms(1); 

		// Sequence 3
		// send reg12		
		reg_start = 12;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+12,1);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);

		//monsen 20081125, Wait 100 ms	
		GX_Delay_N_ms(100);

		//monsen 20081030, Reinitial again
		{
		// Sequence 1    
		// Send Reg0 ->Reg11 
		reg_start = 0;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg,12);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Time delay 1ms
		GX_Delay_N_ms(1); 

		// Sequence 2
		// Send Reg13 ->Reg24
		reg_start = 13;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+13,12);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Send Reg25 ->Reg35
		reg_start = 25;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+25,11);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Send Reg36 ->Reg41
		reg_start = 36;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+36,6);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		// Time delay 1m
		GX_Delay_N_ms(1); 

		// Sequence 3
		// send reg12		
		reg_start = 12;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, reg_start,reg+12,1);
		//diag_printf("r=0x%x (line=%d)\n",(int)r,__LINE__);
		}

		//diag_printf("> AV20111 INIT I2C Return val = %d\n",(int)r);

		// Wait 4 ms		
		GX_Delay_N_ms(4);

		// power on initial end
		tuner_initial = 1;
	}

	return r;
}


GX1132_STATE GX_Av2011_GetLockStatus(void)
{
	GX1132_STATE r;
	u8 ucTemp;

	ucTemp = 0x00;
	r = TUNER_I2C_FUNC(READ, TUNER_I2C_ADDR, 0x0b,&ucTemp,1);
	if( r == SUCCESS ) 
	{		
		//printk("---->>>> Av2011 Lock reg = 0x%x\n",ucTemp);
	/*
		if( ucTemp != 3 ) 
		{
			r = AVL_DVBSx_EC_Running;
		}
	*/	
	}

	/**********/
	ucTemp = 0x00;
	r = TUNER_I2C_FUNC(READ, TUNER_I2C_ADDR, 0x05,&ucTemp,1);

	//printk("---->>>> Av2011 GET BF = 0x%x (err=%d)\n",ucTemp,(int)r);

	return(r);
}

GX1132_STATE GX_Set_AV2011( u32 RFfreq, u32 Symbol_Rate)
{
	GX1132_STATE r;

	u32 fracN;
	u32 BW;
	u32 BF;
	u32 auto_scan = 0;
	u16 channel_freq = RFfreq;
	u16 Symbol = Symbol_Rate;

	GX_Av2011_Initialize();

	//printk("GX_Set_AV2011 : RFfreq = %d, Symbol_Rate = %d\n", RFfreq, Symbol_Rate);
	
	fracN = (channel_freq + tuner_crystal/2)/tuner_crystal;  
	if(fracN > 0xff)
		fracN = 0xff;  
	reg[0]=(s8) (fracN & 0xff);
	fracN = (channel_freq<<17)/tuner_crystal;
	fracN = fracN & 0x1ffff;
	reg[1]=(s8) ((fracN>>9)&0xff);
	reg[2]=(s8) ((fracN>>1)&0xff);    	
	// reg[3]_D7 is frac<0>, D6~D0 is 0x50	
	reg[3]=(s8) (((fracN<<7)&0x80) | 0x50);	// default is 0x50

	//diag_printf("(freq=%d, sym=%d) fracN = %d, reg[0]=%x,  reg[1]=%x,  reg[2]=%x,  reg[3]=%x\n", 
	//				channel_freq, Symbol, (int)fracN, reg[0],reg[1],reg[2], reg[3]);
	
	// Channel Filter Bandwidth Setting.
	//"sym" unit is Hz;
	/*if(auto_scan)//ɨ̨�x requested by BB    
    	{
    		reg[5] = 0xA3; //BW=27MHz
    	} */
	//else
	//{
	// rolloff is 35%
	BW = Symbol*135/200;//s_SymbolRate*135/200;
	// monsen 20080726, BB request low IF when sym < 6.5MHz			
	// add 6M when Rs<6.5M, 
	if(Symbol<6500)//(s_SymbolRate<6500)
		BW = BW + 6000;
	// add 2M for LNB frequency shifting
	BW = BW + 2000;//2000   can adjust
	// add 8% margin since fc is not very accurate	
	BW = BW*108/100;
	// Bandwidth can be tuned from 4M to 40M
	if( BW< 4000)
		BW = 4000;
	if( BW> 40000)
		BW = 40000;    		      
	BF = (BW*127 + 21100/2) / (21100); // 	BW(MHz) * 1.27 / 211KHz
	//diag_printf("BF = 0x%x\n",(int)BF);
	reg[5] = (u8)BF;

	GX_Delay_N_ms(5);		
	if (Symbol == 0 || Symbol == 45000) //auto-scan mode
	{
		auto_scan = 1;
		reg[5] = 0xA3; //BW=27MHz
	}
	if(auto_scan)
	{
    	// Sequence 4	
    	// Send Reg0 ->Reg4
	    r = TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 0,reg,4);
		// Time delay 4ms
  	   	GX_Delay_N_ms(4);
	   	// Sequence 5
    	// Send Reg5  	
	    r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 5, reg+5, 1);
	  	// Fine-tune Function Control
	  	//Auto-scan mode. FT_block=1, FT_EN=0, FT_hold=1
		reg[37] = 0x05;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 37, reg+37, 1);
		// Time delay 4ms
		GX_Delay_N_ms(4);
	}
	else
	{
    	// Sequence 4	
    	// Send Reg0 ->Reg4
	    r = TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 0,reg,4);
		// Time delay 4ms
  	   	GX_Delay_N_ms(5);
	   	// Sequence 5
    	// Send Reg5  	
	    r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 5, reg+5, 1);
	    GX_Delay_N_ms(5);
	  	// Fine-tune Function Control
	  	//Auto-scan mode. FT_block=1, FT_EN=0, FT_hold=1
		reg[37] = 0x06;
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 37, reg+37, 1);
		GX_Delay_N_ms(5);
		//reg[12] = 0x96; //Disable RFLP at Lock Channel sequence after reg[37]		
		reg[12] = 0xd6; //Enable RFLP at Lock Channel sequence after reg[37]  		
		r |= TUNER_I2C_FUNC(WRITE, TUNER_I2C_ADDR, 12, reg+12, 1);
		// Time delay 4ms
		GX_Delay_N_ms(4);
	}
	
	return r;
}
