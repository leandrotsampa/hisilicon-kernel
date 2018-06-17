/******************************************************************************

  Copyright (C), 2001-2014, HiSilicon Technologies Co., Ltd.
 ******************************************************************************
File Name     : hi_unf_keyled.h
Version	      : Initial draft
Author	      : HiSilicon multimedia software group
Created Date  : 2012-08-24
Last Modified by:
Description   : Application programming interfaces (APIs) of the KEYLED
Function List :
Change History:
 ******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_KEYLED_H__
#define __HI_UNF_KEYLED_H__

#include "hi_common.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     KEYLED */
/** @{ */  /** <!-- [KEYLED] */
/**keyled type*/
/**CNcomment:KEYLED���� */
typedef enum  hiUNF_KEYLED_TYPE_E
{
    HI_UNF_KEYLED_TYPE_74HC164 = 0x0, /**<KEYLED type:74HC164*/			  /**<CNcomment:KEYLED�ͺ�: 74HC164 */
    HI_UNF_KEYLED_TYPE_PT6961,	  /**<KEYLED type: PT6961*/			  /**<CNcomment:KEYLED�ͺţ�PT6961 */
    HI_UNF_KEYLED_TYPE_CT1642,	  /**<KEYLED type: CT1642*/			  /**<CNcomment:KEYLED�ͺţ�CT1642 */
    HI_UNF_KEYLED_TYPE_PT6964,	  /**<KEYLED type: PT6964*/			  /**<CNcomment:KEYLED�ͺţ�PT6964 */
    HI_UNF_KEYLED_TYPE_FD650,	  /**<KEYLED type: FD650*/			  /**<CNcomment:KEYLED�ͺţ�FD650 */
    HI_UNF_KEYLED_TYPE_GPIOKEY,	  /**<KEYLED type :GPIOKEY*/					 /**<CNcomment:GPIO�������*/
    HI_UNF_KEYLED_TYPE_BUTT
}HI_UNF_KEYLED_TYPE_E;

/**Blink frequency level of the LED*/
/**CNcomment:LED��˸Ƶ�ʼ���*/
typedef enum hiUNF_KEYLED_LEVEL_E
{
    HI_UNF_KEYLED_LEVEL_1 = 0x01,   /**<Level 1, slowest*/  /**<CNcomment:����1,��˸Ƶ������*/
    HI_UNF_KEYLED_LEVEL_2,	    /**<Level 2*/	    /**<CNcomment:����2 */
    HI_UNF_KEYLED_LEVEL_3,	    /**<Level 3*/	    /**<CNcomment:����3 */
    HI_UNF_KEYLED_LEVEL_4,	    /**<Level 4*/	    /**<CNcomment:����4 */
    HI_UNF_KEYLED_LEVEL_5,	    /**<Level 5, fastest*/  /**<CNcomment:����5 , ��˸Ƶ�����*/

    HI_UNF_KEYLED_LEVEL_BUTT
}HI_UNF_KEYLED_LEVEL_E;

/**Blink sequence of LEDs*/
/**CNcomment:��˸��LED���*/
typedef enum hiUNF_KEYLED_LIGHT_E
{
    HI_UNF_KEYLED_LIGHT_1 = 0x01,   /**<The first LED blinks.*/	  /**<CNcomment:��1��LED��˸*/
    HI_UNF_KEYLED_LIGHT_2,	    /**<The second LED blinks.*/  /**<CNcomment:��2��LED��˸*/
    HI_UNF_KEYLED_LIGHT_3,	    /**<The third LED blinks.*/	  /**<CNcomment:��3��LED��˸*/
    HI_UNF_KEYLED_LIGHT_4,	    /**<The fourth LED blinks.*/  /**<CNcomment:��4��LED��˸*/
    HI_UNF_KEYLED_LIGHT_ALL,	    /**<All LEDs blink.*/	 /**<CNcomment:����LED����˸*/
    HI_UNF_KEYLED_LIGHT_NONE,	    /**<All LEDs do not blink.*/  /**<CNcomment:����LED������˸*/

    HI_UNF_KEYLED_LIGHT_BUTT
}HI_UNF_KEYLED_LIGHT_E;

/**Display time of each LED*/
/**CNcomment:LED��ʾʱ��*/
typedef struct hiUNF_KEYLED_Time_S
{
    HI_U32 u32Hour;	      /**<Hour*/   /**<CNcomment:ʱ*/
    HI_U32 u32Minute;	      /**<Minute*/ /**<CNcomment:��*/
}HI_UNF_KEYLED_TIME_S, *HI_UNF_KEYLED_TIME_S_PTR;

/** @} */  /** <!-- ==== Structure Definition End ==== */

/******************************* API Declaration *****************************/
/** \addtogroup	     KEYLED */
/** @{ */  /** <!-- [KEYLED] */
/**---- keyled ----*/

/**
\brief Initializes the KEYLED module.
CNcomment:\brief ��ʼ��KEYLEDģ�顣CNend

\attention \n
The error code HI_SUCCESS is returned if this API is called repeatedly.
CNcomment:�ظ����ñ��ӿڣ��᷵�سɹ���CNend

\param N/A					       CNcomment:�� CNend
\retval ::HI_SUCCESS Success			       CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  The KEYLED device fails to open. CNcomment:KEYLED�豸��ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEYLED_Init(HI_VOID);


/**
\brief Deinitializes the KEYLED module.
CNcomment:\brief ȥ��ʼ��KEYLEDģ�顣CNend

\attention \n
The error code HI_SUCCESS is returned if this API is called repeatedly.
CNcomment:�ظ����ñ��ӿڣ��᷵�سɹ���CNend

\param N/A					       CNcomment:�� CNend
\retval ::HI_SUCCESS Success			       CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  The KEYLED device fails to close. CNcomment:KEYLED�豸�ر�ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEYLED_DeInit(HI_VOID);

/**
\brief Selects the type of the KEYLED.
CNcomment:\brief ѡ��KEYLED�������͡�CNend

\attention \n
It is recommended to call this API once after the KEYLED module is initialized.
CNcomment:�����ʼ����ֻѡ��һ�Σ���Ҫ�ظ����á�CNend

\param[in] enKeyLedType	  KEYLED type						CNcomment:keyled���͡� CNend
\retval ::HI_SUCCESS   Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED device is not initialized.		CNcomment:KEYLED�豸δ��ʼ�� CNend
\retval ::HI_ERR_KEYLED_INVALID_PARA  The parameter is invalid.			CNcomment:�����Ƿ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.					CNcomment: Ioctrl����ʧ�� CNend

\see \n
N/A
*/
HI_S32 HI_UNF_KEYLED_SelectType(HI_UNF_KEYLED_TYPE_E enKeyLedType);

/**
\brief Enables the key function.
CNcomment:\brief �򿪰������ܡ�CNend
\attention \n
The KEYLED module starts to receive key values after the key function is enabled.\n
The error code HI_SUCCESS is returned if this API is called repeatedly.\n
CNcomment:�򿪺�ʼ���հ���\n
�ظ����ñ��ӿڣ��᷵�سɹ���CNend
\param N/A									CNcomment:�� CNend
\retval ::HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED device is not initialized.		CNcomment:KEYLED�豸δ��ʼ�� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.					CNcomment: Ioctrl����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_Open(HI_VOID);

/**
\brief Disables the key function.
CNcomment:\brief �رհ������ܡ�CNend

\attention \n
The KEYLED module stops receiving key IDs after the key function is disabled.\n
This API is valid when it is called for the first time. If this API is called repeatedly, the error code HI_SUCCESS is returned.\n
CNcomment:�رպ�ֹͣ���հ���\n
���ӿڵ�һ�ε���������,�ظ����÷��سɹ���CNend

\param N/A									CNcomment:�� CNend
\retval ::HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED device is not initialized.		CNcomment:KEYLED�豸δ��ʼ�� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.					CNcomment: Ioctrl����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_Close(HI_VOID);

/**
\brief Clears the key values that are not received.
CNcomment:\brief ��յ�ǰû�н��յİ�����CNend

\attention \n
This API is used to clear the buffer for storing the key values. In this way, the initial state is returned.
CNcomment:��հ���buffer���ص���ʼ״̬��CNend
\param N/A Success								CNcomment:�� CNend
\retval ::HI_SUCCESS Success							CNcomment:�ɹ� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED device is not initialized.		CNcomment:KEYLED�豸δ��ʼ�� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.					CNcomment: Ioctrl����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_Reset(HI_VOID);


/**
\brief Obtains a key value.
CNcomment:\brief ��ȡһ������ֵ��CNend

\attention \n
This API is used to obtain the key value that is received first in the buffer. After this API is called, the key value and key status are returned.\n
The key status contains pressed, hold and released.\n
This API needs to work with ::HI_UNF_KEY_SetBlockTime.\n
If there are no key values, the API waits until timeout occurs. In this case, the error code ::HI_ERR_KEYLED_TIMEOUT is returned.\n
If the timeout is set to 0 in non-block mode, the error code ::HI_ERR_KEYLED_NO_NEW_KEY is returned when there are no key values.\n
If the timeout is set to 0xFFFFFFFF, it indicates infinite wait.\n
CNcomment:��ȡbuffer�����絽��İ���ֵ�����ذ���ֵ����ֵ��״̬\n
״̬�������£������͵���\n
�ӿ����::HI_UNF_KEY_SetBlockTime�ӿ�һ��ʹ��\n
û�а���ʱ�����еȴ�����ʱ���˳������س�ʱ������\n
��ʱֵΪ0ʱΪ�������ӿڣ�û�а���ֱ�ӷ���û�а���������\n
��ʱֵ����Ϊ0xffffffff��һֱ�ȴ���CNend
\param[out] pu32PressStatus Key status: pressed(0x0), hold(0x1) or released(0x2) CNcomment:����״̬�ǰ��£��������ǵ���CNend
\param[out] pu32KeyId  Key value						 CNcomment:����ֵ��CNend
\retval ::HI_SUCCESS  Success							 CNcomment:�ɹ� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.		 CNcomment:ģ��û�г�ʼ�� CNend
\retval ::HI_ERR_KEYLED_NULL_PTR  The pointer is null.				 CNcomment:ָ�����Ϊ�� CNend
\retval ::HI_ERR_KEYLED_NO_NEW_KEY  There are no key values.			 CNcomment:û�а��� CNend
\retval ::HI_ERR_KEYLED_TIMEOUT	 Waiting for key values times out.		 CNcomment:�ȴ�������ʱ CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_GetValue(HI_U32 * pu32PressStatus, HI_U32 * pu32KeyId);

/**
\brief Sets the timeout of reading key IDs.
CNcomment:\brief ���ð�����ȡ�ĳ�ʱʱ�䡣CNend

\attention \n
If the timeout is set to 0, the API is not blocked. If there is no key ID, the error code HI_ERR_KEYLED_NO_NEW_KEY is returned.\n
If the timeout is set to 0xFFFFFFFF, it indicates infinite wait.\n
The default time is 500 ms.\n
CNcomment:��ʱֵΪ0ʱ��������û�а���ֱ�ӷ���û�а���������\n
��ʱֵ����Ϊ0xffffffff��һֱ�ȴ���\n
Ĭ�ϵĳ�ʱ�ж�ʱ��Ϊ500ms��CNend
\param[in] u32BlockTimeMs   Timeout, in ms				 CNcomment:��ʱʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	 CNcomment:ģ��û�г�ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_SetBlockTime(HI_U32 u32BlockTimeMs);


/**
\brief Set the time of pressing a key repeatedly.
CNcomment:\brief �����ظ�������ʱ�䡣CNend

\attention \n
If a key is pressed for a period of time, it considers that the key is pressed repeatedly.\n
The time ranges from 108 ms to 65536 ms. If the time is not within the range, the time is automatically restricted to this range.\n
The default time is 200 ms.\n
CNcomment:��ĳ�������ڰ���״̬���������õ�ʱ��ֵ�ж�Ϊ�ظ�����\n
�ظ����������÷�Χ��108ms��65536ms֮�䣬���������Χ���Զ�Լ�������޻�������\n
Ĭ�ϵ��ظ������ж�ʱ��Ϊ200ms��CNend

\param[in] u32RepTimeMs	 Time of pressing a key repeatedly, in ms	CNcomment:�ж�Ϊ�ظ�������ʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success						CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized. CNcomment:ģ��û�г�ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_RepKeyTimeoutVal(HI_U32 u32RepTimeMs);

/**
\brief Enables or disables the function of reporting the same key ID.
CNcomment:\brief �����Ƿ�ʹ���ظ�������CNend

\attention \n
The ID of a pressed key is reported consecutively only after the report function is enabled.\n
CNcomment:ֻ��ʹ�ܺ�һֱ��סĳ���������������ϱ���ֵ��CNend

\param[in] u32IsRepKey Repeat key report enable. 1: enabled; 0: disabled   CNcomment:�Ƿ�ʹ���ظ�������1 ʹ�ܣ�0 ��ʹ�ܡ�CNend
\retval ::HI_SUCCESS Success						   CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				   CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	   CNcomment:ģ��û�г�ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_IsRepKey(HI_U32 u32IsRepKey);

/**
\brief Enables or disables the function of reporting the released status of a key.
CNcomment:\brief �����Ƿ��ϱ���������CNend

\attention \n
The released statuses of keys are reported only after the report function is enabled. Otherwise, only the pressed statuses are reported.\n
CNcomment:ʹ�ܺ�Ż��ϱ����������¼�����Ȼֻ�ϱ������¼���CNend

\param[in] u32IsKeyUp Repeat key report enable. 1: enabled; 0: disabled	 CNcomment:�Ƿ�ʹ���ظ�������1 ʹ�ܣ�0 ��ʹ�ܡ�CNend
\retval ::HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	 CNcomment:ģ��û�г�ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_KEY_IsKeyUp(HI_U32 u32IsKeyUp);

/**
\brief Enables the display function of LEDs.
CNcomment:\brief ���������ʾ���ܡ�CNend

\attention \n
The LEDs work only after the display function is enabled.\n
The error code HI_SUCCESS is returned if this API is called repeatedly.\n
CNcomment:�򿪺�Ż�������ܵ���ʾ\n
�ظ����ñ��ӿڣ��᷵�سɹ���CNend

\param N/A				       CNcomment:�� CNend
\retval ::HI_SUCCESS Success		       CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.    CNcomment: Ioctrl����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_Open(HI_VOID);

/**
\brief Disables the display function of LEDs.
CNcomment:\brief �ر��������ʾ���ܡ�CNend

\attention \n
The LEDs do not work after the display function is disabled.\n
This API is valid when it is called for the first time. If this API is called repeatedly, the error code HI_SUCCESS is returned.\n
CNcomment:�رպ�ֹͣ�������ʾ\n
���ӿڵ�һ�ε���������,�ظ����÷��سɹ���CNend

\param N/A				      CNcomment:�� CNend
\retval ::HI_SUCCESS Success		      CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.   CNcomment: Ioctrl����ʧ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_Close(HI_VOID);


/**
\brief Displays characters based on the type of the input code.
CNcomment:\brief ���ݴ��������ֵ������ʾ��CNend

\attention \n
Each LED displays a character that corresponds to the value of one byte.\n
During displaying, the values of the four characters to be displayed need to be combined to form a 32-bit unsigned int data segment. The data serves as the parameter value of this API.\n
The four LEDs from left to right display bit[7:0], bit[15:8], bit[23:16], and bit[31:24] of the data respectively.\n
For example, if you want to display "0123" on LEDs, you need to combine the display values corresponding to these characters to form the following unsigned int variable:\n
  Unsigned int parameter = 0x03 + (0x9F <<8) + (0x25<<16) + (0x0D <<24);\n
Where, 0x03, 0x9F, 0x25, and 0x0D are the display values of 0, 1, 2, and 3 respectively.\n
The following shows the mapping between the segments of a 7-segment LED and data bits:\n
       --7--	   \n
      |	    |	   \n
     2|	    |6	   \n
      |--1--	   \n
      |	    |	   \n
     3|	    |5	   \n
       --4-- .0	   \n
The common display characters and values of the LEDs on HiSilicon demo board are as follows in the case of co-anode (the display characters and values need to be reversed in the case of co-cathode):
  Digitals 0-9: 0x03, 0x9F, 0x25, 0x0D, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09\n
  Upper-case letters A-Z (the characters that cannot be displayed are expressed as 0xFF):\n
     0xFF, 0xFF, 0x63, 0xFF, 0x61, 0x71, 0xFF, 0x91, 0xFF, 0xFF, 0xFF, 0xE3, 0xFF,\n
     0xFF, 0x03, 0x31, 0xFF, 0xFF, 0x49, 0xFF, 0x83, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF\n
  Lower-case letters a-z (the characters that cannot be displayed are expressed as 0xFF):\n
    0xFF, 0xC1, 0xE5, 0x85, 0x21, 0xFF, 0x09, 0xD1, 0xDF, 0xFF, 0xFF, 0x9F, 0xFF,\n
    0xD5, 0xC5, 0x31, 0x19, 0xFF, 0x49, 0xFF, 0xC7, 0xE1, 0xFF, 0xFF, 0xFF, 0xFF
CNcomment:	ÿ�������Ҫ��ʾ���ַ���Ӧһ���ֽڵ���ʾֵ��\n
��ʾʱ��Ҫ��4 ������ʾ�ַ���Ӧ����ʾֵ��ϳ�һ��unsiged int��32bit��������Ϊ�˽ӿڵĲ���ֵ��\n
�����ҵ�4 ��LED ������ʾ���ݵ�bit[7:0]��bit[15:8]��bit[23:16]��bit[31:24]��\n
���磺��LED ����ʾ��0123��������Ҫ����Щ�ַ���Ӧ����ʾֵ��ϳ�һ��Unsigned int �ı�����\n
   Unsigned int parameter = 0x03 + (0x9F <<8) + (0x25<<16) + (0x0D <<24)��\n
���У�0x03��0x9F��0x25��0x0D �ֱ��ǡ�0������1������2������3������ʾֵ��\n
�߶�����ܶ��������ݵ�bit��Ӧ��ϵ����:\n
       --7--	   \n
      |	    |	   \n
     2|	    |6	   \n
      |--1--	   \n
      |	    |	   \n
     3|	    |5	   \n
       --4-- .0	   \n
��˼DEMO������ܳ�����ʾ�ַ������Ӧ����ʾֵ����(��Թ�������������Ҫȡ��)��\n
  . �ַ�0-9��0x03, 0x9F, 0x25, 0x0D, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09\n
  . ��д��ĸA-Z��������ʾ����0xFF ��ʾ����\n
     0xFF, 0xFF, 0x63, 0xFF, 0x61, 0x71, 0xFF, 0x91, 0xFF, 0xFF, 0xFF, 0xE3, 0xFF,\n
     0xFF, 0x03, 0x31, 0xFF, 0xFF, 0x49, 0xFF, 0x83, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF\n
  . Сд��ĸa-z��������ʾ����0xFF ��ʾ����\n
     0xFF, 0xC1, 0xE5, 0x85, 0x21, 0xFF, 0x09, 0xD1, 0xDF, 0xFF, 0xFF, 0x9F, 0xFF,\n
     0xD5, 0xC5, 0x31, 0x19, 0xFF, 0x49, 0xE1, 0xC7, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF CNend
\param[in] u32CodeValue 4-digit value to be displayed			CNcomment:��Ҫ��ʾ��4λ��ֵ��CNend
\retval ::HI_SUCCESS Success						CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized. CNcomment:ģ��û�г�ʼ�� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_Display(HI_U32 u32CodeValue);


/**
\brief Displays the time on LEDs.
CNcomment:\brief �����������ʾʱ�䡣CNend

\attention \n
The values of hour and minute need to be converted into corresponding decimal values. For example, if you want to display 22:45, you need to set hour to 22 and set minute to 45.\n
After the start time is set, the time is displayed on LEDs. At the same time, the colon (:) in the time blinks at the frequency of 1 Hz.\n
Because the time is displayed in 24-hour format, the maximum value of hour is 23, and the maximum value of minute is 59.\n
CNcomment:Сʱ������ֻ�����ó���Ӧ��ʮ����ֵ�����ˡ�������ʾ22��45����hour=22��minute=45��\n
����ʱ�����ݽṹ��Ȼ�������������ʾ����ʾʱ���ͬʱð�Ż���1HZ��Ƶ����˸\n
ʱ��ķ�Χע�ⰴ24Сʱ�ƣ����֧��СʱΪ23����Ϊ59��CNend

\param[in] stLedTime Time						 CNcomment:ʱ�䡣CNend
\retval ::HI_SUCCESS  Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	 CNcomment:ģ��û�г�ʼ�� CNend
\retval ::HI_ERR_KEYLED_INVALID_PARA  The input parameter is invalid.	 CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_DisplayTime(HI_UNF_KEYLED_TIME_S stLedTime);

/**
\brief Sets the ID of the blinked LED.
CNcomment:\brief ����Ҫ��˸��LED ��š�CNend

\attention \n
The IDs of the LEDs on the board are 1, 2, 3, and 4 from left to right. If you want 4 LEDs to blink together, set 5.\n
CNcomment:�����ϵ�����ܵ���Ŵ���������Ϊ��1��2��3��4������4�������һ����˸:5��CNend

\param[in] enPin  Pin ID						 CNcomment:Ҫ��ʾ����š�CNend
\retval ::HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	 CNcomment:ģ��û�г�ʼ�� CNend
\retval ::HI_ERR_KEYLED_INVALID_PARA  The input parameter is invalid.	 CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_SetFlashPin(HI_UNF_KEYLED_LIGHT_E enPin);

/**
\brief Sets the blink level of an LED.
CNcomment:\brief ����LED ��˸����CNend

\attention \n
The higher the level, the faster an LED blinks.
CNcomment:����Խ����˸�ٶ�Խ�졣CNend

\param[in] enLevel  Blink level from 1 to 5.				 CNcomment:��˸�������÷�Χ:1 �� 5 CNend
\retval ::HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_NOT_INIT  The KEYLED module is not initialized.	 CNcomment:ģ��û�г�ʼ�� CNend
\retval ::HI_ERR_KEYLED_INVALID_PARA The input parameter is invalid.	 CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_SetFlashFreq(HI_UNF_KEYLED_LEVEL_E enLevel);

/**
\brief	whether enable the lockfreq led.
CNcomment:\brief ������ƵLED��CNend

\attention \n
At present,only FD650 KEYLED support this.
CNcomment:Ŀǰֻ��FD650���֧�ָ�����CNend

\param[in] setLock  If lock ,set to HI_TRUE. Otherwise,set to HI_FALSE.				   CNcomment:LOCKLED���ã�����ʱ����ΪHI_TRUE����������ΪHI_FALSE.CNend
\retval ::HI_SUCCESS Success						 CNcomment:�ɹ� CNend
\retval ::HI_FAILURE  Calling Ioctrl fails.				 CNcomment: Ioctrl����ʧ�� CNend
\retval ::HI_ERR_KEYLED_INVALID_PARA The input parameter is invalid.	 CNcomment:��������Ƿ� CNend
\see \n
N/A
*/
HI_S32 HI_UNF_LED_SetLockPin(HI_BOOL setLock);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* End of #ifndef __HI_UNF_KEYLED_H__ */
