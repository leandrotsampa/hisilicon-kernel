/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
 ******************************************************************************
File Name     : hi_unf_pmoc.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date  : 2012-08-24
Last Modified by:
Description   : Application programming interfaces (APIs) of the PMOC
Function List :
Change History:
 ******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_PMOC_H__
#define __HI_UNF_PMOC_H__

#include "hi_common.h"
#include "hi_error_mpi.h"

#include "hi_unf_keyled.h"

#include "hi_unf_ir.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     PMOC */
/** @{ */  /** <!-- [PMOC] */

/**ARM mode*/
/**CNcomment:ARM������ģʽ*/
typedef enum hiUNF_PMOC_MODE_E
{
    HI_UNF_PMOC_MODE_NORMAL = 0,    /**<Normal*/     /**<CNcomment:��ͨģʽ */
    HI_UNF_PMOC_MODE_SLOW,	    /**<Slow*/	     /**<CNcomment:����ģʽ */
    HI_UNF_PMOC_MODE_DOZE,	    /**<Doze*/	     /**<CNcomment:����ģʽ */
    HI_UNF_PMOC_MODE_SLEEP,	    /**<Sleep*/	     /**<CNcomment:˯��ģʽ */

    HI_UNF_PMOC_MODE_BUTT
}HI_UNF_PMOC_MODE_E;


/**standby woken type*/
/**CNcomment:���������ѵ����� */
typedef enum hiUNF_PMOC_ACTUAL_WKUP_E
{
    HI_UNF_PMOC_WKUP_IR = 0,	  /**<Woken by the IR module*/		      /**<CNcomment:��IR���� */
    HI_UNF_PMOC_WKUP_KEYLED,	  /**<Woken by the keys on the front panel*/  /**<CNcomment:��ǰ���KEY���� */
    HI_UNF_PMOC_WKUP_TIMEOUT,	  /**<Woken by the timing interrupt*/	      /**<CNcomment:����ʱ�жϻ��� */
    HI_UNF_PMOC_WKUP_ETH,	  /**<Woken by the ethernet interrupt*/	      /**<CNcomment:�������жϻ��� */
    HI_UNF_PMOC_WKUP_USB,	  /**<Woken by the USB interrupt*/	      /**<CNcomment:��USB�������жϻ��� */
    HI_UNF_PMOC_WKUP_GPIO,	  /**<Woken by the GPIO interrupt*/	      /**<CNcomment:��GPIO�жϻ��� */
    HI_UNF_PMOC_WKUP_CEC,	 /**<Woken by the CEC */		     /**<CNcomment:��CEC ���� */
    HI_UNF_PMOC_WKUP_BUTT
}HI_UNF_PMOC_ACTUAL_WKUP_E;

typedef enum hiUNF_PMOC_SCENE_E
{
    HI_UNF_PMOC_SCENE_STANDARD = 0,  /**<Standard scenario*/			/**<CNcomment:��׼���� */
    HI_UNF_PMOC_SCENE_ETH,	     /**<Forward scenario over the ETH port */	/**<CNcomment:����ת������ */
    HI_UNF_PMOC_SCENE_PHONE,	     /**<Calling scenario*/			/**<CNcomment:ͨ������ */
    HI_UNF_PMOC_SCENE_BUTT
}HI_UNF_PMOC_SCENE_E;

typedef enum hiUNF_PMOC_ETH_E
{
    HI_UNF_PMOC_ETH_0 = 0x01,	     /**<The first ETH.*/    /**<CNcomment:��1������*/
    HI_UNF_PMOC_ETH_1 = 0x02,	     /**<The second ETH.*/   /**<CNcomment:��2������*/
    HI_UNF_PMOC_ETH_BUTT = 0x04
}HI_UNF_PMOC_ETH_E;

/**Defines the modules working in smart standby */
/**CNcomment:���ܴ���ʱ���µ�ģ�鶨�� */
typedef enum hiUNF_PMOC_HOLD_MOD_E
{
    HI_UNF_PMOC_HOLD_ETH = 0x0001,   /**<Keep eth working */	/**<CNcomment:���ڲ��µ� */
    HI_UNF_PMOC_HOLD_WIFI = 0x0002,  /**<Keep WIFI working */	/**<CNcomment:WIFI���µ� */
    HI_UNF_PMOC_HOLD_USB = 0x0004,   /**<Keep USB working */	/**<CNcomment:USB���µ� */
    HI_UNF_PMOC_HOLD_TUNER = 0x0008, /**<Keep tuner working */	/**<CNcomment:Tuner���µ� */
    HI_UNF_PMOC_HOLD_DEMUX = 0x0010, /**<Keep demux working */	/**<CNcomment:Demux���µ� */
    HI_UNF_PMOC_HOLD_SDIO = 0x0020,  /**<Keep SDIO working */	/**<CNcomment:SD�����µ� */
    HI_UNF_PMOC_HOLD_SCI = 0x0040,   /**<Keep SCI working */	/**<CNcomment:SCI���µ� */
    HI_UNF_PMOC_HOLD_VENC = 0x0080,  /**<Keep VENC working */	/**<CNcomment:VENC���µ� */
    HI_UNF_PMOC_HOLD_PNG = 0x0100,   /**<Keep PNG working */	/**<CNcomment:PNG���µ� */
    HI_UNF_PMOC_HOLD_JPGE = 0x0200,  /**<Keep JPGE working */	/**<CNcomment:JPGE���µ� */
    HI_UNF_PMOC_HOLD_JPEG = 0x0400,  /**<Keep JPEG working */	/**<CNcomment:JPEG���µ� */
    HI_UNF_PMOC_HOLD_WDG = 0x0800,   /**<Keep WDG working */	/**<CNcomment:WDG���µ� */
    HI_UNF_PMOC_HOLD_HDMI = 0x1000,  /**<Keep HDMI working */	/**<CNcomment:HDMI���µ� */
    HI_UNF_PMOC_HOLD_VO = 0x2000,    /**<Keep VO working */	/**<CNcomment:VO���µ� */
    HI_UNF_PMOC_HOLD_DISP = 0x4000,  /**<Keep DISP working */	/**<CNcomment:DISP���µ� */
    HI_UNF_PMOC_HOLD_AO = 0x8000,    /**<Keep AO working */	/**<CNcomment:AO���µ� */
    HI_UNF_PMOC_HOLD_AI = 0x10000,   /**<Keep AI working */	/**<CNcomment:AI���µ� */
    HI_UNF_PMOC_HOLD_ADSP = 0x20000, /**<Keep ADSP working */	/**<CNcomment:ADSP���µ� */
    HI_UNF_PMOC_HOLD_CIPHER = 0x40000, /**<Keep CIPHER working */   /**<CNcomment:CIPHER���µ� */
    HI_UNF_PMOC_HOLD_VDEC = 0x80000, /**<Keep VDEC working */	/**<CNcomment:VDEC���µ� */
    HI_UNF_PMOC_HOLD_VPSS = 0x100000, /**<Keep VPSS working */	/**<CNcomment:VPSS���µ� */
    HI_UNF_PMOC_HOLD_OTP = 0x200000, /**<Keep OTP working */	/**<CNcomment:OTP���µ� */
    HI_UNF_PMOC_HOLD_TDE = 0x400000, /**<Keep TDE working */	/**<CNcomment:TDE���µ� */
    HI_UNF_PMOC_HOLD_I2C = 0x800000, /**<Keep I2C working */	/**<CNcomment:I2C���µ� */
    HI_UNF_PMOC_HOLD_GPIO = 0x1000000,/**<Keep GPIO working */	/**<CNcomment:GPIO���µ� */
    HI_UNF_PMOC_HOLD_BUTT = 0x80000000,
}HI_UNF_PMOC_HOLD_MOD_E;

#define PMOC_WKUP_IRKEY_MAXNUM 6
#define FILTER_VALUE_COUNT   (31)
#define FILTER_COUNT	     (4)

typedef struct hiUNF_PMOC_WAKEUP_FRAME
{
    HI_U32  u32MaskBytes;  /**<Mask byte, bitN to control u8Value[N]. 0: invalid, 1: valid*/  /**<CNcomment: ��Ӧvalue������, bitN��Ӧu8Value[N], 0������Ч��1������Ч */
    HI_U8   u8Offset;	   /**<Filter offset, should be bigger than or equal to 12*/	      /**<CNcomment: ������ƫ��������Ҫ���ڻ����12*/
    HI_U8   u8Value[FILTER_VALUE_COUNT];   /**<Filter value*/				      /**<CNcomment: ��������ֵ*/
    HI_BOOL bFilterValid;  /**<Valid filter, 0: invalid, 1: valid*/			      /**<CNcomment: �������Ƿ���Ч��0������Ч��1������Ч*/
}HI_UNF_PMOC_WAKEUP_FRAME_S, *HI_UNF_WAKEUP_FRAME_S_PTR;

typedef struct hiUNF_PMOC_NETWORK
{
    HI_UNF_PMOC_ETH_E	       enEthIndex;	   /**<Eth index, can set several eth once*/  /**<CNcomment: ������ţ�����ͬʱ���ö������*/
    HI_BOOL		       bUcPacketEnable;	   /**<Single packet enable*/		      /**<CNcomment: ������ʹ�� */
    HI_BOOL		       bMagicPacketEnable; /**<Magic packet enable*/		      /**<CNcomment: ħ����ʹ��*/
    HI_BOOL		       bWakeupFrameEnable; /**<Wakeup Frame enable*/		      /**<CNcomment: ����֡ʹ�� */
    HI_UNF_PMOC_WAKEUP_FRAME_S stFrame[FILTER_COUNT];	      /**<Filter frame*/	      /**<CNcomment: ����֡���� */
}HI_UNF_PMOC_NETWORK_S, *HI_UNF_PMOC_NETWORK_S_PTR;

/**Defines the standby wake-up conditions.*/
/**CNcomment:�������ѵ���������*/
typedef struct hiUNF_PMOC_WKUP_S
{
    /**<Number of supported values of the power key. For the raw IR remote control, the number cannot be greater than the maximum key value 6 that is defined by the macro definition PMOC_WKUP_IRKEY_MAXNUM. Only one key value is supported for other remote controls.*/
    /**<CNcomment:�ܹ�֧��power��ֵ������raw �ͺ���ң��: ���ܳ�ԽPMOC_WKUP_IRKEY_MAXNUM(<=6)�궨������������ֵ����������ֻ��֧��һ����ֵ*/
    HI_U32 u32IrPmocNum;

    HI_U32 u32IrPowerKey0[PMOC_WKUP_IRKEY_MAXNUM];  /**<Lower-bit value of the power key on an IR remote control*/  /**<CNcomment:����ң�� power ��λ��ֵ */
    HI_U32 u32IrPowerKey1[PMOC_WKUP_IRKEY_MAXNUM];  /**<Upper-bit value of the power key on an IR remote control*/  /**<CNcomment:����ң�� power ��λ��ֵ */
    HI_U32 u32IrSymbol[64];			    /**<Value of the raw power key of IR*/			    /**<CNcomment:����ң�ػ���ԭʼ��ƽ�� */
    HI_U32 u32KeypadPowerKey;				/**<Value of the power key*/					/**<CNcomment:���� power��ֵ */
    HI_U32 u32WakeUpTime;				/**<Preconfigured Wake-up time, in second*/			/**<CNcomment:���Ѷ�ʱʱ�� ,��λΪ ��  */
    HI_UNF_PMOC_NETWORK_S stNetwork;			/**<Network parameter*/						/**<CNcomment:���绽�Ѳ���*/
    HI_BOOL bMouseKeyboardEnable;			/**<Mouse and key wake-up enable*/				/**<CNcomment:�����̻���ʹ��*/
    HI_BOOL bResumeResetEnable;				/**<When resume, reset board enable*/				/**<CNcomment:������������ʹ��*/
    HI_BOOL bGpioWakeUpEnable;				/**<Gpio wake up enable */					/**<CNcomment:GPIO����ʹ��*/
    HI_U32 u32GpioNo;					/**<Gpio wake up number */					/**<CNcomment:GPIO���Ѷ˿�*/
    HI_BOOL bCECWakeUpEnable;			       /**< CEC wake up enable */				       /**<CNcomment:CEC����ʹ��*/
}HI_UNF_PMOC_WKUP_S, *HI_UNF_PMOC_WKUP_S_PTR;

/**Configures the time displayed on the front panel in standby mode.*/
/**CNcomment:����ʱ��ǰ�����ʾ��ʱ������ */
typedef struct hiUNF_PMOC_TIME_S
{
    HI_U32 u32Hour;	       /**<Hour*/     /**<CNcomment:ʱ */
    HI_U32 u32Minute;	       /**<Minute*/   /**<CNcomment:�� */
    HI_U32 u32Second;	       /**<Second*/   /**<CNcomment:�� */
}HI_UNF_PMOC_TIME_S, *HI_UNF_PMOC_TIME_S_PTR;

/**Configures the display mode of the front panel in standby mode.*/
/**CNcomment:����ʱ��ǰ�����ʾ���� */
typedef struct hiUNF_PMOC_STANDBY_MODE_S
{
    HI_U32	       u32Mode;	     /**<0: no display; 1: display the digits represented by u32DispCod; 2: display the time represented by stTimeInfo*/     /**<CNcomment:0 : ����ʾ 1 : ��ʾu32DispCode����������; 2 : ��ʾstTimeInfo������ʱ��. */
    HI_U32	       u32DispCode;  /**<Digits displayed on the front panel when u32Mode is 1, value range from 0000 to 9999, do not support hex */	     /**<CNcomment:u32ModeΪ1ʱ��ǰ�����ʾ�����֣�ȡֵ��Χ��0000��9999����֧��16������ */
    HI_UNF_PMOC_TIME_S stTimeInfo; /**<Time displayed on the front panel when u32Mode is 2*/								     /**<CNcomment:u32ModeΪ2ʱ��ǰ�����ʾ��ʱ��*/
}HI_UNF_PMOC_STANDBY_MODE_S, *HI_UNF_PMOC_STANDBY_MODE_S_PTR;

/**Type of the device that is woken in standby mode*/
/**CNcomment:�������ѵ��豸���� */
typedef struct hiUNF_PMOC_DEV_TYPE_S
{
    HI_UNF_IR_CODE_E	 irtype;    /**<Type of the IR remote control*/	 /**<CNcomment:����ң������ */
    HI_UNF_KEYLED_TYPE_E kltype;  /**<Type of the front panel*/	       /**<CNcomment:ǰ������� */
}HI_UNF_PMOC_DEV_TYPE_S, *HI_UNF_PMOC_DEV_TYPE_S_PTR;

/**Mode of last wakeup*/
/**CNcomment:��һ�δ������ѵĲ���*/
typedef struct hiUNF_PMOC_WAKEUP_MODE_S
{
    HI_UNF_PMOC_ACTUAL_WKUP_E  enWakeUpMode; /**<Wake-up mode returned from last wakeup*/     /**<CNcomment:��һ�δ������ѵ�ģʽ */
    HI_U64		       u64IRPowerKey;  /**<The IR power key of last wakeup*/	       /**<CNcomment:��һ�δ������ѵ�ң��������ֵ */
}HI_UNF_PMOC_WAKEUP_MODE_S, *HI_UNF_PMOC_WAKEUP_MODE_S_PTR;

/** Define of chip temperature */
/**CNcomment: оƬ�¶Ƚṹ��*/
typedef struct hiUNF_PMOC_CHIP_TEMP_S
{
    HI_S32 s32ChipSensor1Temp; /**<The temperature of chip sensor1 in millidegree Celsius */  /**<CNcomment:оƬ��һ�����������¶ȣ���λ���� */
    HI_S32 s32ChipSensor2Temp; /**<Reserved now*/ /**<CNcomment: ��ǰ���� */
    HI_S32 s32ChipSensor3Temp; /**<Reserved now*/ /**<CNcomment: ��ǰ���� */
    HI_S32 s32ChipSensor4Temp; /**<Reserved now*/ /**<CNcomment: ��ǰ���� */
}HI_UNF_PMOC_CHIP_TEMP_S;


/** @} */  /** <!-- ==== Structure Definition End ==== */

/******************************* API Declaration *****************************/
/** \addtogroup	     PMOC */
/** @{ */  /** <!-- [PMOC] */
/*---- pm ----*/

/**
\brief Starts the power management on chip (PMoC) device.
CNcomment:\brief �򿪵͹���ģ���豸��CNend

\attention \n
The ARM can be switched to another operating mode and then to low-power mode only after the PMoC device is started.\n
CNcomment:�ڴ򿪵͹���ģ���豸�󣬲����л�ARM�Ĺ���ģʽ���̶�����͹���״̬��CNend

\param N/A								 CNcomment:�� CNend
\retval HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_FAILED_INIT  The PMoC device fails to open.	 CNcomment:PMoC�豸��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_Init(HI_VOID);

/**
\brief Stops the PMoC device.
CNcomment:\brief �رյ͹����豸��CNend

\attention \n
N/A
\param	N/A								CNcomment:�� CNend
\retval HI_SUCCESS Success						CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		CNcomment:�豸δ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_DeInit(HI_VOID);

/**
\brief Sets the mode to which the ARM is switched and obtains the wake-up mode.
CNcomment:\brief ����ARMҪ�л�����ģʽ��ͬʱ��ȡARM���ѵķ�ʽ��CNend

\attention \n
If the ARM enters the HI_UNF_PMOC_MODE_SLEEP mode, programs stop running at once. The subsequent code can be executed only after the ARM is woken up.\n
Before enabling the standby mode, you must start the IR device, key device on the front panel; otherwise, the interrupts of these devices are masked. As a result, the corresponding wake-up modes cannot be achieved.\n
Do not access DDRs after the ARM enters the sleep mode. Therefore, the functions of display output, video output, DEMUX input, and audio/video decoding must be disabled.\n
CNcomment:ARM����HI_UNF_PMOC_MODE_SLEEP�����ģʽ���������ֹͣ���У������ڻ��Ѻ���ܼ���ִ�к���Ĵ���\n
�������ģʽǰ�������IR��ң�������豸��ǰ���KEY�豸�������Ӧģ����жϱ����Σ�����ʵ�ָ���ģʽ�Ļ���\n
���������ʱ������ȷ������DDR���з��ʡ����Ա���ر���ʾ�������Ƶ�����DEMUX���롢����Ƶ����ȡ�CNend

\param[in] enSystemMode	  Mode of the ARM in low-power mode		   CNcomment: �õ͹�����ARM����ģʽ��CNend

\param[out]  penWakeUpStatus Wake-up mode returned from the HI_UNF_PMOC_MODE_SLEEP mode. For details about the definition, see the description of ::HI_UNF_PMOC_ACTUAL_WKUP_E. \n
			 CNcomment: ��HI_UNF_PMOC_MODE_SLEEP״̬����ʱ�Ļ��ѷ�ʽ�����庬����ο�::HI_UNF_PMOC_ACTUAL_WKUP_E CNend
\retval HI_SUCCESS Success						   CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	 The PMoC device is not started.	   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_STANDBY  It fails to enter standby		   CNcomment:�������ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SwitchSystemMode(HI_UNF_PMOC_MODE_E enSystemMode, HI_UNF_PMOC_ACTUAL_WKUP_E * penWakeUpStatus);

/**
\brief Sets the wake-up mode of the ARM.
CNcomment:\brief ����ARM���ѷ�ʽ��CNend

\attention \n
You can query the original IR code values by referring to IR remote manuals.\n
In addition, you can query the relationships between the keys and key IDs by checking the connection between hardware and chips.\n
CNcomment:IRԭʼ��ֵ����ͨ��ң������ʹ���ֲ�õ�\n
�������ֵ�Ķ�Ӧ��ϵ����ͨ��Ӳ����оƬ�����ӹ�ϵ�õ���CNend

\param[in] pstAttr  Wake-up mode of the ARM				CNcomment:ARM���ѷ�ʽ��CNend
\retval HI_SUCCESS Success						CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_SETWAKEUPVAL It fails to set power val.	CNcomment:���û��ѷ�ʽʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SetWakeUpAttr(HI_UNF_PMOC_WKUP_S_PTR pstAttr);

/**
\brief Gets the wake-up mode of the ARM.
CNcomment:\brief ��ȡ�����õ�ARM���ѷ�ʽ��CNend

\attention \n

\param[out] pstAttr  Wake-up mode of the ARM				CNcomment:ARM���ѷ�ʽ��CNend
\retval HI_SUCCESS Success						CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_GETWAKEUPVAL It fails to set power val.	CNcomment:��ȡ���ѷ�ʽʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_GetWakeUpAttr(HI_UNF_PMOC_WKUP_S_PTR pstAttr);


/**
\brief set display content when wake up.
CNcomment:\brief ���û�����ʾ���ݡ�CNend

\attention \n
content that the panel display when standby
CNcomment:����ʱ�����ʾָ������\n CNend

\param[in] pstStandbyMode  display content:time or channel or no display   CNcomment:��ʾ����:ʱ�� or Ƶ�� or ����ʾ��CNend
\retval HI_SUCCESS  success						   CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_STANDBY  It fails to set standby display	   CNcomment:���û�������ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SetStandbyDispMode(HI_UNF_PMOC_STANDBY_MODE_S_PTR pstStandbyMode);

/**
\brief Obtains the current system mode.
CNcomment:\brief ��ȡϵͳ��ǰģʽ��CNend

\attention \n
This API is abandoned and only used for forward compatible. It always returns normal state.\n
CNcomment:�˽ӿ��ѷ�����ʼ�շ�����ͨģʽ����Ϊ����֮ǰ�汾ʹ�á�\n CNend

\param[in] penSystemMode  Mode to be obtained			CNcomment:��Ҫ��ȡ��ģʽ��CNend
\retval HI_SUCCESS Success					CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started. CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.	CNcomment:�Ƿ�ָ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_ReadSystemMode(HI_UNF_PMOC_MODE_E * penSystemMode);

/**
\brief Sets the operating scenario.
CNcomment:\brief ���ù���������CNend

\attention \n
Only the standby scenario and the forward scenario are supported currently.\n
CNcomment:Ŀǰ��֧�ֱ�׼��������������ת������\n CNend

\param[in] eScene  Standby scenario				  CNcomment:����������CNend
\retval HI_SUCCESS Success					  CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	  The PMoC device is not started. CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The parameter is invalid.	  CNcomment:�Ƿ����� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SetScene(HI_UNF_PMOC_SCENE_E eScene);

/**
\brief Sets the types of the devices related to standby such as front panel and IR remote control.
CNcomment:\brief ����Ŀǰǰ���ͬ����ң�صȴ�������豸�����͡�CNend

\attention \n

\param[in] pdevType  Standby device that needs to be supported in standby	CNcomment:����ʱ��Ҫ֧�ֵĴ����豸��CNend
\retval HI_SUCCESS  success						   CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_STANDBY  It fails to set standby devices.	   CNcomment:���û����豸ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SetDevType(HI_UNF_PMOC_DEV_TYPE_S_PTR pdevType);

/**
\brief when standby, GPIO pin control 12v and 5v power,relate to hardware.
CNcomment:\brief ���ڴ���ʱ,GPIO�ܽſ���12V0��5V0��Դ����Ӳ����ء�CNend

\attention \n
when standby, the outside power controled by STANDBY_PWROFF pin, the function can be ignored.\n
when some part of outside power controled by GPIO pin, use this function will decrease standby power.\n
CNcomment:����ʱ��Χ��Դȫ���ɹܽ�STANDBY_PWROFF����ʱ����������ýӿڣ�\n
��������Χ��Դ��GPIO�ܽ�ȥ����ʱ,�������øýӿ����ڽ��ʹ������ġ�CNend

\param[in] u32GpioNo  GPIO pin index, choose the fifth[40,47] CNcomment:GPIO�ܽ�������,ȡ��5��Ϊ[40, 47] CNend
\param[in] bHighOrLow GPIO output control		      CNcomment:GPIO�ܽ�������� CNend
\retval HI_SUCCESS  success						   CNcomment:�ɹ� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_STANDBY  It fails to set standby Gpio.	   CNcomment:���ô���Gpio�ܽ�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_SetPwrOffGpio(HI_U32 u32GpioNo, HI_BOOL bHighOrLow);

/**
\brief Get the period during standby status.
CNcomment:\brief ��ȡ�Ӵ��������ѳ�����ʱ�䡣CNend

\attention \n

\param[out] pu32Period	The period of standby. CNcomment:����������ʱ�� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_GETPERIOD	It fails to get standby period.	   CNcomment:��ȡ����ʱ��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_GetStandbyPeriod(HI_U32 *pu32Period);


/**
\brief Switch to smart standby status.
CNcomment:\brief �������ܴ���״̬��CNend

\attention \n

\param[in] u32HoldModules  The modules working in smart standby .	   CNcomment:����ʱ���µ��ģ�� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_SUCCESS		Standby success.			   CNcomment:�����ɹ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_EnterSmartStandby(HI_U32 u32HoldModules);

/**
\brief Quit smart standby status.
CNcomment:\brief �˳����ܴ���״̬��CNend

\attention \n

\param	N/A								   CNcomment:�� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_SUCCESS		Quit standby success.			   CNcomment:���ѳɹ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_QuitSmartStandby(HI_VOID);

/**
\brief Get the Parameters of last wake up.
CNcomment:\brief ��ȡ�����������ѵĲ�����CNend

\attention \n

\param[out] pstAttr  The Parameters of last waking up. CNcomment:������һ�λ��ѵĲ��� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_GETWAKEUPMODE  It fails to get parameters of last waking up.    CNcomment:��ȡ���Ѳ���ʧ�� CNend
\retval ::HI_SUCCESS		Getting waking up parameters succeeded.		   CNcomment:��ȡ���Ѳ����ɹ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PMOC_GetWakeUpMode(HI_UNF_PMOC_WAKEUP_MODE_S_PTR pstAttr);

/**
\brief Get the temperatures of the chip.
CNcomment:\brief ��ȡ��ǰоƬ���¶ȡ�CNend

\attention \n

\param[out] pstChipTemp	 The temperatures of the chip sensors. CNcomment:��ǰоƬ�д��������¶� CNend
\retval ::HI_ERR_PMOC_NOT_INIT	The PMoC device is not started.		   CNcomment:PMoC�豸δ�� CNend
\retval ::HI_ERR_PMOC_INVALID_POINT  The pointer is invalid.		   CNcomment:�Ƿ�ָ�� CNend
\retval ::HI_ERR_PMOC_INVALID_PARA  The parameter is invalid.		   CNcomment:�Ƿ����� CNend
\retval ::HI_ERR_PMOC_FAILED_GETTEMPERATURE  It fails to get chip temp.	   CNcomment:��ȡоƬ�¶�ʧ�� CNend
\see \n
N/A
*/

HI_S32 HI_UNF_PMOC_GetChipTemp(HI_UNF_PMOC_CHIP_TEMP_S *pstChipTemp);


/** @} */  /** <!-- ==== API declaration end ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_PMOC_H__ */
