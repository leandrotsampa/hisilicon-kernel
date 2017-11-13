/*********************************************************************************
*
*  Copyright (C) 2014 Hisilicon Technologies Co., Ltd.	All rights reserved.
*
***********************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#define KEY_PWR		0x28	//GPIO5_5
#define KEY_OK		0xff	//GPIO0_6
#define KEY_RIGHT	0xff	//GPIO0_1
#define KEY_LEFT	0xff	//GPIO0_2
#define KEY_DOWN	0xff	//GPIO0_4
#define KEY_UP		0xff	//GPIO0_3
#define KEY_MENU	0xff	//GPIO0_5

#define LED0  44  //GPIO5-4
#define LED1  7	 //GPIO0-7


#define SCAN_INTV_GPIOKEY    (100)
#define KEY_MACRO_NO (0xff)

HI_S32 KEYLED_KEY_Open_GpioKey(HI_VOID);
HI_S32 KEYLED_KEY_Close_GpioKey(HI_VOID);
HI_S32 KEYLED_KEY_Reset_GpioKey(HI_VOID);
HI_S32 KEYLED_KEY_GetValue_GpioKey(HI_U32 *pu32PressStatus, HI_U32 *pu32KeyId);
HI_S32 KEYLED_KEY_SetBlockTime_GpioKey(HI_U32 u32BlockTimeMs);
HI_S32 KEYLED_KEY_SetRepTime_GpioKey(HI_U32 u32RepTimeMs);
HI_S32 KEYLED_KEY_IsRepKey_GpioKey(HI_U32 u32IsRepKey);
HI_S32 KEYLED_KEY_IsKeyUp_GpioKey(HI_U32 u32IsKeyUp);

HI_S32 KEYLED_LED_Open_GpioKey(HI_VOID);
HI_S32 KEYLED_LED_Close_GpioKey(HI_VOID);
HI_S32 KEYLED_LED_Display_GpioKey(HI_U32 u32CodeValue);
HI_S32 KEYLED_LED_DisplayTime_GpioKey(HI_UNF_KEYLED_TIME_S stKeyLedTime);
HI_S32 KEYLED_LED_SetFlashPin_GpioKey(HI_UNF_KEYLED_LIGHT_E enPin);
HI_S32 KEYLED_LED_SetFlashFreq_GpioKey(HI_UNF_KEYLED_LEVEL_E enLevel);


 HI_S32 KEYLED_Suspend_GpioKey(HI_VOID);
 HI_S32 KEYLED_Resume_GpioKey(HI_VOID);
