/******************************************************************************

Copyright (C), 2004-2014, HiSilicon Technologies Co., Ltd.
******************************************************************************
File Name     : hi_unf_demux.h
Version	      : Initial
Author	      : HiSilicon multimedia software group
Created	      : 2008-06-10
Last Modified :
Description   : HiSilicon DEMUX API declaration
Function List :
History	      :
* Version   Date	 Author				  Defect No.	 Description
* main\1    2008-06-10	 Jiang Lei (employee ID: 40671)	    NULL	 Created this file.
* main\2    2010-04-02	 Jiang Lei (employee ID: 40671)	    NULL	 modified for HD series.
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about the DEMUX module.CNcomment:�ṩDEMUX�������Ϣ CNend
 */

#ifndef __HI_UNF_DEMUX_H__
#define __HI_UNF_DEMUX_H__

#include "hi_unf_common.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*************************** Structure Definition ****************************/
/** \addtogroup	     DEMUX */
/** @{ */  /** <!-- [DEMUX] */

/**Maximum depth of a filter. */
/**CNcomment:filter������*/
#define DMX_FILTER_MAX_DEPTH		16
#define DMX_MAX_IDX_ACQUIRED_EACH_TIME	256

/**Defines the capability of the DEMUX module*/
/**CNcomment:����DEMUXģ��ҵ���ܽṹ��*/
typedef struct hiUNF_DMX_CAPABILITY_S
{
    HI_U32 u32IFPortNum;	/**<Number of IF ports. */ /**< CNcomment: IF �˿�����	(��TS In �˿ڶ���ͨ��Tuner ����,����IF �˿���ʹ������ QAM)    */
    HI_U32 u32TSIPortNum;	/**<Number of TS In ports. */ /**< CNcomment: TS In �˿����� (��IF�˿ڶ���ͨ��Tuner ����,����IF �˿���ʹ������ QAM)    */
    HI_U32 u32TSOPortNum;	/**<Number of TS Out ports. */ /**< CNcomment: TS Out  �˿�����*/
    HI_U32 u32RamPortNum;	/**<Number of Ram ports. */ /**< CNcomment: Ram�˿�����	    */
    HI_U32 u32DmxNum;		/**<Number of DEMUX devices*/ /**< CNcomment:�豸����	  */
    HI_U32 u32ChannelNum;	/**<Number of channels, containing the audio and video channels */ /**< CNcomment:ͨ��������������Ƶͨ�������� */
    HI_U32 u32AVChannelNum;	/**<Number of av channels*/ /**< CNcomment:����Ƶͨ������ */
    HI_U32 u32FilterNum;	/**<Number of filters*/ /**< CNcomment:����������   */
    HI_U32 u32KeyNum;		/**<Number of keys*/ /**< CNcomment:��Կ������	 */
    HI_U32 u32RecChnNum;	/**<Number of record channels */ /**< CNcomment:¼��ͨ�������� */
    HI_U32 u32TagPortNum;	/**<Number of Tag ports. */ /**< CNcomment: Tag�˿�����	    */
    HI_U32 u32TsioPortNum;	/**<Number of Tsio ports. */ /**< CNcomment: Tsio�˿�����     */
} HI_UNF_DMX_CAPABILITY_S;

/**TSO port ID*/
/**CNcomment:TS����˿�ID */
typedef enum hiUNF_DMX_TSO_PORT_E
{
    HI_UNF_DMX_PORT_TSO_0,	/**<The first TS OUT port . */ /**< CNcomment:TS Out �˿�0 */
    HI_UNF_DMX_PORT_TSO_1,
    HI_UNF_DMX_PORT_TSO_2,
    HI_UNF_DMX_PORT_TSO_3
}HI_UNF_DMX_TSO_PORT_E;

/**TS port ID*/
/**CNcomment:TS�˿�ID */
typedef enum hiUNF_DMX_PORT_E
{
    HI_UNF_DMX_PORT_IF_0 = 0x0,	 /**<The first IF port (port with  QAM	inside chipset). */ /**< CNcomment: IF �˿�0 , (IF �˿�������QAM�˿ڣ�ͨ��������һ��) */
    HI_UNF_DMX_PORT_IF_1,
    HI_UNF_DMX_PORT_IF_2,
    HI_UNF_DMX_PORT_IF_3,
    HI_UNF_DMX_PORT_IF_4,
    HI_UNF_DMX_PORT_IF_5,
    HI_UNF_DMX_PORT_IF_6,
    HI_UNF_DMX_PORT_IF_7,
    HI_UNF_DMX_PORT_IF_8,
    HI_UNF_DMX_PORT_IF_9,
    HI_UNF_DMX_PORT_IF_10,
    HI_UNF_DMX_PORT_IF_11,
    HI_UNF_DMX_PORT_IF_12,
    HI_UNF_DMX_PORT_IF_13,
    HI_UNF_DMX_PORT_IF_14,
    HI_UNF_DMX_PORT_IF_15,

    HI_UNF_DMX_PORT_TSI_0 = 0x20,/**<The first TS IN  port . */ /**< CNcomment:TSIN �˿�0 , (TSIN �˿ڼ�Tuner �˿�) */
    HI_UNF_DMX_PORT_TSI_1,
    HI_UNF_DMX_PORT_TSI_2,
    HI_UNF_DMX_PORT_TSI_3,
    HI_UNF_DMX_PORT_TSI_4,
    HI_UNF_DMX_PORT_TSI_5,
    HI_UNF_DMX_PORT_TSI_6,
    HI_UNF_DMX_PORT_TSI_7,
    HI_UNF_DMX_PORT_TSI_8,
    HI_UNF_DMX_PORT_TSI_9,
    HI_UNF_DMX_PORT_TSI_10,
    HI_UNF_DMX_PORT_TSI_11,
    HI_UNF_DMX_PORT_TSI_12,
    HI_UNF_DMX_PORT_TSI_13,
    HI_UNF_DMX_PORT_TSI_14,
    HI_UNF_DMX_PORT_TSI_15,

    HI_UNF_DMX_PORT_RAM_0 = 0x80,/**<The first RAM port . */ /**< CNcomment:RAM �˿�0 */
    HI_UNF_DMX_PORT_RAM_1,
    HI_UNF_DMX_PORT_RAM_2,
    HI_UNF_DMX_PORT_RAM_3,
    HI_UNF_DMX_PORT_RAM_4,
    HI_UNF_DMX_PORT_RAM_5,
    HI_UNF_DMX_PORT_RAM_6,
    HI_UNF_DMX_PORT_RAM_7,
    HI_UNF_DMX_PORT_RAM_8,
    HI_UNF_DMX_PORT_RAM_9,
    HI_UNF_DMX_PORT_RAM_10,
    HI_UNF_DMX_PORT_RAM_11,
    HI_UNF_DMX_PORT_RAM_12,
    HI_UNF_DMX_PORT_RAM_13,
    HI_UNF_DMX_PORT_RAM_14,
    HI_UNF_DMX_PORT_RAM_15,

    HI_UNF_DMX_PORT_TSIO_0 = 0xA0,/**<The first TSIO port . */ /**< CNcomment:TSIO �˿�0 */
    HI_UNF_DMX_PORT_TSIO_1,
    HI_UNF_DMX_PORT_TSIO_2,
    HI_UNF_DMX_PORT_TSIO_3,
    HI_UNF_DMX_PORT_TSIO_4,
    HI_UNF_DMX_PORT_TSIO_5,
    HI_UNF_DMX_PORT_TSIO_6,
    HI_UNF_DMX_PORT_TSIO_7,

    HI_UNF_DMX_PORT_BUTT
} HI_UNF_DMX_PORT_E;


/**TS port mode*/
/**CNcomment:TS�˿�ģʽ */
typedef enum hiUNF_DMX_PORT_MODE_E
{
    HI_UNF_DMX_PORT_MODE_EXTERNAL,   /**<External TS input mode*/ /**< CNcomment:�ⲿTS����*/
    HI_UNF_DMX_PORT_MODE_INTERNAL,   /**<Internal TS input mode*/ /**< CNcomment:�ڲ�TS����*/
    HI_UNF_DMX_PORT_MODE_RAM,	     /**<Memory input mode*/ /**< CNcomment:���ڴ�����*/

    HI_UNF_DMX_PORT_MODE_BUTT
} HI_UNF_DMX_PORT_MODE_E;

/**TS port type*/
/**CNcomment:TS�˿����� */
typedef enum hiUNF_DMX_PORT_TYPE_E
{
    HI_UNF_DMX_PORT_TYPE_PARALLEL_BURST,	  /**<Parallel burst mode*/ /**< CNcomment:����BURSTģʽ	     */
    HI_UNF_DMX_PORT_TYPE_PARALLEL_VALID,	  /**<Parallel valid mode*/ /**< CNcomment:����VALIDģʽ	     */
    HI_UNF_DMX_PORT_TYPE_PARALLEL_NOSYNC_188,	  /**<Self-sync 188 mode*/ /**< CNcomment:��ͬ��188ģʽ		    */
    HI_UNF_DMX_PORT_TYPE_PARALLEL_NOSYNC_204,	  /**<Self-sync 204 mode*/ /**< CNcomment:��ͬ��204ģʽ		    */
    HI_UNF_DMX_PORT_TYPE_PARALLEL_NOSYNC_188_204, /**<self-sync 188/204 auto-identification mode */ /**< CNcomment:��ͬ��188/204�Զ�ʶ��ģʽ */
    HI_UNF_DMX_PORT_TYPE_SERIAL,		  /**<Serial sync mode, 1bit*/ /**< CNcomment:����syncģʽ, 1bit���� */
    HI_UNF_DMX_PORT_TYPE_USER_DEFINED,		  /**<User defined mode*//**< CNcomment:�û��Զ���ģʽ */
    HI_UNF_DMX_PORT_TYPE_SERIAL2BIT,		  /**<Serial sync mode, 2bit*/ /**< CNcomment:����syncģʽ, 2bit���� */
    HI_UNF_DMX_PORT_TYPE_SERIAL_NOSYNC,		  /**<Serial nosync mode, 1bit */ /**< CNcomment:����nosyncģʽ, 1bit���� */
    HI_UNF_DMX_PORT_TYPE_SERIAL2BIT_NOSYNC,	  /**<Serial nosync mode, 2bit */ /**< CNcomment:����nosyncģʽ, 2bit���� */
    HI_UNF_DMX_PORT_TYPE_AUTO,			  /**<Auto mode*/ /**< CNcomment: �Զ�ģʽ */

    HI_UNF_DMX_PORT_TYPE_BUTT
} HI_UNF_DMX_PORT_TYPE_E;

/**TSO clock mode*/
/**CNcomment:TS����˿�ʱ��ģʽ */
typedef enum hiUNF_DMX_TSO_CLK_MODE_E
{
    HI_UNF_DMX_TSO_CLK_MODE_NORMAL,		     /**<Normal clock: clock always active*/ /**< CNcomment:��ͨģʽ��ʱ��,ʱ��ƽ�ʾ���*/
    HI_UNF_DMX_TSO_CLK_MODE_JITTER ,		      /**<Jittered clock: clock active only when outputing data*/ /**< CNcomment:Jittered ģʽʱ��,ʱ��Ƶ�ʲ�����,��ʱֻ�������������ʱ�Ż��ʱ�� (valid�ź�Ϊ�ߵ������)*/
    HI_UNF_DMX_TSO_CLK_MODE_BUTT
}HI_UNF_DMX_TSO_CLK_MODE_E;

/**TSO valid mode*/
/**CNcomment:TS����˿�valid�ź�ģʽ */
typedef enum hiUNF_DMX_TSO_VALID_MODE_E
{
    HI_UNF_DMX_TSO_VALID_ACTIVE_OUTPUT,		 /**<Valid signal high when outputing datas*/ /**< CNcomment:valid�ź����������ʱΪ��*/
    HI_UNF_DMX_TSO_VALID_ACTIVE_HIGH ,		/**<Valid signal always high*/ /**< CNcomment:valid�ź�����Ϊ��*/
    HI_UNF_DMX_TSO_VALID_ACTIVE_BUTT
}HI_UNF_DMX_TSO_VALID_MODE_E;

/**TSO port signal line selector*/
/**CNcomment:TS����˿�����ѡ�� */
typedef enum hiUNF_DMX_TSO_SERIAL_BIT_E
{
    HI_UNF_DMX_TSO_SERIAL_BIT_0 = 0x0,		/**< Serial output data using data[0] as signal line*/ /**< CNcomment:ʹ��data[0]��Ϊ�����ź������*/
    HI_UNF_DMX_TSO_SERIAL_BIT_7 = 0x7,		/**< Serial output data using data[7] as signal line*/ /**< CNcomment:ʹ��data[7]��Ϊ�����ź������*/
    HI_UNF_DMX_TSO_SERIAL_BIT_BUTT
}HI_UNF_DMX_TSO_SERIAL_BIT_E;

/**TS out mode clock frequency*/
/**CNcomment:TS���ģ��ʱ��Ƶ�� ,ע��,ʵ�ʵ�TS out �˿����Ƶ�� = TSO ģ��ʱ��/��Ƶ����*/
typedef enum hiUNF_DMX_TSO_CLK_E
{
    HI_UNF_DMX_TSO_CLK_100M ,		/**< TS out mode clock frequency 100M*/ /**< CNcomment:TS���ģ��ʱ��Ƶ��ѡ��Ϊ100M*/
    HI_UNF_DMX_TSO_CLK_150M ,		/**< TS out mode clock frequency 150M*/ /**< CNcomment:TS���ģ��ʱ��Ƶ��ѡ��Ϊ150M*/
    HI_UNF_DMX_TSO_CLK_1200M ,		/**< TS out mode clock frequency 1200M*/ /**< CNcomment:TS���ģ��ʱ��Ƶ��ѡ��Ϊ1200M*/
    HI_UNF_DMX_TSO_CLK_1500M ,		/**< TS out mode clock frequency 1500M*/ /**< CNcomment:TS���ģ��ʱ��Ƶ��ѡ��Ϊ1500M*/
    HI_UNF_DMX_TSO_CLK_BUTT
}HI_UNF_DMX_TSO_CLK_E;

/** Tag sync mode */
/** CNcomment: Tag ͬ��ģʽ*/
typedef enum hiUNF_DMX_TAG_SYNC_MODE_E
{
    HI_UNF_DMX_TAG_HEAD_SYNC = 0x0,	     /** < tag sync signal at tag head*/ /**< CNcomment:sync�ź���tagͷ*/
    HI_UNF_DMX_NORMAL_HEAD_SYNC = 0x1,	  /** < tag sync signal at 47 heade*/ /** <CNcomment:sync�ź���47ͷ*/
}HI_UNF_DMX_TAG_SYNC_MODE_E;

/** TS Tag attributes */
/** CNcomment: TS Tag ��������*/
#define MAX_TAG_LENGTH (12)
typedef struct hiUNF_DMX_TAG_ATTR_S
{
    HI_U8     au8Tag[MAX_TAG_LENGTH];	    /** <[IN]tag index value*/ /**< CNcomment:�˿ڵ�tagֵ */
    HI_U32   u32TagLen;	  /** <[IN & OUT]Valid tag length(1 ~ 12bytes), which is an input para when setTagAttr, otherwise out para when getTagAttr*/ /** <CNcomment:��Чtag����(1~12�ֽ�),setTagAttrʱ��Ϊ�������,getTagAttrʱ��Ϊ�������*/
    HI_BOOL bEnabled;	    /**<[IN & OUT]Port state(default disabled), which is an input para when setTagAttr, otherwise out para when getTagAttr*/ /**< CNcomment:�˿�ʹ��(Ĭ�ϲ�ʹ��),setTagAttrʱ��Ϊ�������,getTagAttrʱ��Ϊ�������*/
    HI_UNF_DMX_TAG_SYNC_MODE_E enSyncMod; /** <[IN & OUT]Sync mode(default HI_UNF_DMX_TAG_HEAD_SYNC), which is an input para when setTagAttr, otherwise out para when getTagAttr*/ /**<CNcomment:ͬ��ģʽ(Ĭ��ֵΪHI_UNF_DMX_PORT_TAG_HEAD_SYNC ),setTagAttrʱ��Ϊ�������,getTagAttrʱ��Ϊ�������*/
}HI_UNF_DMX_TAG_ATTR_S;


/**TS out port attributes*/
/**CNcomment:TS Out �˿�����*/
typedef struct hiUNF_DMX_TSO_PORT_ATTR_S
{
    HI_BOOL			bEnable;       /**<Port enable, default value HI_TRUE means enable*/ /**< CNcomment:�˿�ʹ��,Ĭ��ʹ��*/
    HI_BOOL			bClkReverse;   /**<Clock phase reverse, default value HI_FALSE means do not reverse the phase of clock*/ /**< CNcomment:�˿�ʱ�ӷ���,Ĭ�ϲ�����*/
    HI_UNF_DMX_PORT_E		enTSSource;    /**<Source of this TS Out port ,can choose from HI_UNF_DMX_PORT_IF_0 to HI_UNF_DMX_PORT_TSI_9*/	/**< CNcomment:TS Out �˿�����Դ,���Դ�HI_UNF_DMX_PORT_IF_0 ��HI_UNF_DMX_PORT_TSI_9 ֮��ѡ��*/
    HI_UNF_DMX_TSO_CLK_MODE_E	enClkMode;     /**<Clock mode: HI_UNF_DMX_TSO_CLK_MODE_NORMAL is the default value*/ /**< CNcomment:ʱ��ģʽ: Ĭ��ֵΪ HI_UNF_DMX_TSO_CLK_MODE_NORMAL*/
    HI_UNF_DMX_TSO_VALID_MODE_E enValidMode;   /**<Wether valid signal always enable : HI_UNF_DMX_TSO_VALID_ACTIVE_OUTPUT is the default value */ /**< CNcomment:Valid ģʽ: Ĭ��ֵΪ:HI_UNF_DMX_TSO_VALID_ACTIVE_OUTPUT  */
    HI_BOOL			bBitSync;	/**<The sync signal duration : HI_TRUE: only valid when output the first bit(default). HI_FALSE: keep when outputing the whole byte*/
						/**< CNcomment:sync �ź���Ч�� : HI_TRUE: ֻ�������һ��bitʱ��Ч (Ĭ��) . HI_FALSE: ����������ֽ�ʱ����Ч  */
    HI_UNF_DMX_PORT_TYPE_E	enPortType;	/**<Port out put mode: serial(HI_UNF_DMX_PORT_TYPE_SERIAL), parallel(HI_UNF_DMX_PORT_TYPE_PARALLEL_BURST) or serial 2bits(HI_UNF_DMX_PORT_TYPE_SERIAL2BIT) mode. default is serial(HI_UNF_DMX_PORT_TYPE_SERIAL)*/
						/**< CNcomment:TSOģ�����ģʽ:����(HI_UNF_DMX_PORT_TYPE_SERIAL)������(HI_UNF_DMX_PORT_TYPE_PARALLEL_BURST) ���ߴ���2bit(HI_UNF_DMX_PORT_TYPE_SERIAL2BIT) ģʽ�� Ĭ���Ǵ���(HI_UNF_DMX_PORT_TYPE_SERIAL)*/
    HI_UNF_DMX_TSO_SERIAL_BIT_E enBitSelector;	/**<Port line sequence select In serial mode.only valid when using serial out put mode,HI_UNF_DMX_TSO_SERIAL_BIT_7 is the default value.*/
						/**< CNcomment:�˿ڴ���ģʽ����ѡ��,ֻ��ʹ�ô������ģʽ��ʱ����Ч,Ĭ��ֵΪ HI_UNF_DMX_TSO_SERIAL_BIT_7*/
    HI_BOOL			bLSB;		/**<Out put byte endian .only valid when using serial out put mode: HI_FALSE: first output MSB (default). HI_TRUE:  first output LSB*/
						/**< CNcomment:�˿������С��ģʽ,ֻ��ʹ�ô������ģʽ��ʱ����Ч: HI_FALSE: ����������λ (Ĭ��) . HI_TRUE: ����������λ  */
    HI_UNF_DMX_TSO_CLK_E	enClk;		/**<TS out mode clock frequency,default is HI_UNF_DMX_TSO_CLK_150M*/ /**< CNcomment:TS���ģ��ʱ��Ƶ��,Ĭ���� HI_UNF_DMX_TSO_CLK_150M*/
    HI_U32			u32ClkDiv;	/**<TS out mode clock frequency divider,must be times of 2 ,and must meet (2 <= u32ClkDiv <= 32) .default is 2*/ /**< CNcomment:TSOģ���Ƶ����,������2��������,ȡֵ��Χ��2��32֮��*/
} HI_UNF_DMX_TSO_PORT_ATTR_S;


/**TS port attributes*/
/**CNcomment:TS�˿�����*/
typedef struct hiUNF_DMX_PORT_ATTR_S
{
    HI_UNF_DMX_PORT_MODE_E enPortMod;	    /**<Port mode.Readonly*/ /**< CNcomment:�˿�ģʽ ֻ��*/
    HI_UNF_DMX_PORT_TYPE_E enPortType;	    /**<Port type*/ /**< CNcomment:�˿����� */
    HI_U32 u32SyncLostTh;		    /**<Sync loss threshold.The default value is recommended.*/ /**< CNcomment:ͬ����ʧ���ޣ��Ƽ�ʹ��Ĭ��ֵ */
    HI_U32 u32SyncLockTh;		    /**<Sync lock threshold.The default value is recommended.*/ /**< CNcomment:ͬ���������ޣ��Ƽ�ʹ��Ĭ��ֵ */
    HI_U32 u32TunerInClk;		    /**<Whether to reverse the phase of the clock input from the tuner*/ /**< CNcomment:Tuner����ʱ���Ƿ���.0: ͬ��(Ĭ��); 1: ����*/
    HI_U32 u32SerialBitSelector;	    /**<Port line sequence select In parallel mode: 0: cdata[7] is the most significant bit (MSB) (default). 1: cdata[0] is the MSB.
							    In serial mode: 1: cdata[0] is the data line (default). 0: cdata[7] is the data line.*/
					    /**< CNcomment:�˿�����ѡ�񡣲���ʱ:0: ��ʾcdata[7]���λ(Ĭ��);1: ��ʾcdata[0]���λ��
							    ����ʱ:1: ��ʾcdata[0]Ϊ������(Ĭ��); 0: ��ʾcdata[7]Ϊ������*/

    HI_U32 u32TunerErrMod;		    /**<Level mode of the cerr_n line from the tuner to a DEMUX.
						       0: A data error occurs when the cerr_n line is high.
						       1: A data error occurs when the cerr_n line is low (default).*/
					    /**< CNcomment:tuner��DEMUX��cerr_n�ߵ�ƽģʽ:
						       0: ��ʾcerr_n��Ϊ��ʱ��ʾ���ݴ���;
						       1: ��ʾcerr_n��Ϊ��ʱ��ʾ���ݴ��� (Ĭ��) */
    HI_U32 u32UserDefLen1;		    /**<User defined length1,valid when enPortType is HI_UNF_DMX_PORT_TYPE_USER_DEFINED,188~255 *//**< CNcomment:�û��Զ��峤�ȼ�����1��ֻ�ж˿�����Ϊ�û��Զ���ʱ��Ч����Ч��Χ188~255 */
    HI_U32 u32UserDefLen2;		    /**<User defined length2,valid when enPortType is HI_UNF_DMX_PORT_TYPE_USER_DEFINED,188~255 *//**< CNcomment:�û��Զ��峤�ȼ�����2��ֻ�ж˿�����Ϊ�û��Զ���ʱ��Ч����Ч��Χ188~255*/
    HI_UNF_DMX_PORT_E enSerialPortShareClk; /**<Port of clock that this port shared, only valid for TSI port tpye *//**< CNcomment:ָ���ö˿�������ʱ�ӵĶ�Ӧ�˿ڣ��ó�Ա����TSI�˿�������Ч*/
} HI_UNF_DMX_PORT_ATTR_S;

/**Status of the TS port*/
/**CNcomment:TS�˿ڵ�״̬*/
typedef struct hiUNF_DMX_PORT_PACKETNUM_S
{
    HI_U32  u32TsPackCnt;    /**<Number of TS packets received from the TS port*/ /**< CNcomment:�˿��յ���TS������*/
    HI_U32  u32ErrTsPackCnt; /**<Number of error TS packets received from the TS port*/ /**< CNcomment:�˿��ϴ���TS���ļ���*/
} HI_UNF_DMX_PORT_PACKETNUM_S;

/** Secure mode type*/
/**CNcomment:��ȫģʽ����*/
typedef enum hiUNF_DMX_SECURE_MODE_E
{
    HI_UNF_DMX_SECURE_MODE_NONE = 0,	    /** <no security protection*/ /**<CNcomment:�ް�ȫ����*/
    HI_UNF_DMX_SECURE_MODE_TEE,		    /** <trustedzone security protection*/ /**<CNcomment:trustedzone��ȫ����*/

    HI_UNF_DMX_SECURE_MODE_BUTT
} HI_UNF_DMX_SECURE_MODE_E;

/** TS buffer attribute*/
/**CNcomment:TS buffer ����*/
typedef struct hiUNF_DMX_TSBUF_ATTR_S
{
    HI_UNF_DMX_SECURE_MODE_E enSecureMode;  /**<Secure indication*/ /**<CNcomment:��ȫ��ʾ*/
    HI_U32  u32BufSize;			    /**<Buffer size*/ /**< CNcomment:��������С*/
}HI_UNF_DMX_TSBUF_ATTR_S;

/**Status of a TS buffer of a DEMUX*/
/**CNcomment:DEMUX��TS Buffer״̬ */
typedef struct hiUNF_DMX_TSBUF_STATUS_S
{
    HI_U32 u32BufSize;	  /**<Buffer size*/ /**< CNcomment:��������С	    */
    HI_U32 u32UsedSize;	  /**<Used buffer size*/ /**< CNcomment:��������ʹ�ô�С,��ֵ��ʵ��ʹ��ֵ��0x100�ֽ� */
    HI_UNF_DMX_SECURE_MODE_E enSecureMode;  /**<Secure indication*/ /**<CNcomment:��ȫ��ʾ*/
} HI_UNF_DMX_TSBUF_STATUS_S;

/**Channel type*/
/**CNcomment:ͨ������ */
typedef enum hiUNF_DMX_CHAN_TYPE_E
{
    HI_UNF_DMX_CHAN_TYPE_SEC = 0, /**<Channel that receives sections data such as program specific information (PSI) or service information (SI) data*/ /**< CNcomment:���ڽ��� PSI/SI��secitons���ݵ�ͨ��*/
    HI_UNF_DMX_CHAN_TYPE_PES,	  /**<Channel that receives packetized elementary stream (PES) data*/ /**< CNcomment:���ڽ���PES�����ݵ�ͨ��*/
    HI_UNF_DMX_CHAN_TYPE_AUD,	  /**<Channel that receives audio data*/ /**< CNcomment:���ڽ�����Ƶ���ݵ�ͨ��*/
    HI_UNF_DMX_CHAN_TYPE_VID,	  /**<Channel that receives video data*/ /**< CNcomment:���ڽ�����Ƶ���ݵ�ͨ��*/
    HI_UNF_DMX_CHAN_TYPE_POST,	    /**<Entire-packet posting channel that receives an entire TS packet with a specific packet identifier (PID). */ /**< CNcomment:��������ͨ�������ڽ���ĳPID������TS��*/
    HI_UNF_DMX_CHAN_TYPE_ECM_EMM,   /**<Channel that receives entitlement control message (ECM) or entitlement management message (EMM) data*/ /**< CNcomment:���ڽ���ECM��EMM���ݵ�ͨ��*/

    HI_UNF_DMX_CHAN_TYPE_BUTT
} HI_UNF_DMX_CHAN_TYPE_E;

/**Cyclic redundancy check (CRC) mode of a channel*/
/**CNcomment:ͨ����CRCģʽ */
typedef enum hiUNF_DMX_CHAN_CRC_MODE_E
{
    HI_UNF_DMX_CHAN_CRC_MODE_FORBID = 0,		/**<The CRC check is disabled*/ /**< CNcomment:CRCУ���ֹ */
    HI_UNF_DMX_CHAN_CRC_MODE_FORCE_AND_DISCARD = 1,	/**<The CRC check is enabled, and the error Section data is discarded*/ /**< CNcomment:CRCУ��ʹ�ܣ�����������Section */
    HI_UNF_DMX_CHAN_CRC_MODE_FORCE_AND_SEND = 2,	/**<The CRC check is enabled, and the error Section data is received*/ /**< CNcomment:CRCУ��ʹ�ܣ������ʹ���Section */
    HI_UNF_DMX_CHAN_CRC_MODE_BY_SYNTAX_AND_DISCARD = 3, /**<Whether the CRC check is performed depends on the syntax, and the error Section data is discarded*/ /**< CNcomment:�����﷨�ж��Ƿ����CRCУ�飬����������Section */
    HI_UNF_DMX_CHAN_CRC_MODE_BY_SYNTAX_AND_SEND = 4,	/**<Whether the CRC check is performed depends on the syntax, and the error Section data is received*/ /**< CNcomment:�����﷨�ж��Ƿ����CRCУ�飬�����ʹ���Section */

    HI_UNF_DMX_CHAN_CRC_MODE_BUTT
} HI_UNF_DMX_CHAN_CRC_MODE_E;

/**Output mode of a channel*/
/**CNcomment:ͨ�������ģʽ */
typedef enum hiUNF_DMX_CHAN_OUTPUT_MODE_E
{
    HI_UNF_DMX_CHAN_OUTPUT_MODE_PLAY = 0x1,	/**<Mode of playing audios/videos or receiving data*/ /**< CNcomment:����Ƶ���Ż����ݽ��� */
    HI_UNF_DMX_CHAN_OUTPUT_MODE_REC  = 0x2,	/**<Recording mode*/ /**< CNcomment:¼�� */
    HI_UNF_DMX_CHAN_OUTPUT_MODE_PLAY_REC = 0x3, /**<Mode of recording and playing data or receiving data*/ /**< CNcomment:ͬʱ¼�ƺͲ��Ż����ݽ��� */
    HI_UNF_DMX_CHAN_OUTPUT_MODE_BUTT
} HI_UNF_DMX_CHAN_OUTPUT_MODE_E;

/**Channel attribute*/
/**CNcomment:ͨ������*/
typedef struct hiUNF_DMX_CHAN_ATTR_S
{
    HI_U32 u32BufSize;				  /**<Buffer size used by channels*/ /**< CNcomment:ͨ��Ӳ��ʹ��buffer��С*/
    HI_UNF_DMX_CHAN_TYPE_E enChannelType;	  /**<Channel type*/ /**< CNcomment:ͨ������ */
    HI_UNF_DMX_CHAN_CRC_MODE_E enCRCMode;	  /**<CRC mode.It is valid for the DEMUX_CHAN_SEC channel.*/ /**< CNcomment:CRCģʽ��ͨ������ΪDMX_CHAN_SEC ʱ��Ч */
    HI_UNF_DMX_CHAN_OUTPUT_MODE_E enOutputMode;	  /**<Output mode of the channel data*/ /**< CNcomment:ͨ���������ģʽ */
    HI_UNF_DMX_SECURE_MODE_E enSecureMode;	  /**<Secure channel indication*/ /**<CNcomment:��ȫͨ����ʾ*/
} HI_UNF_DMX_CHAN_ATTR_S;

/**Scrambled flag of the channel data*/
/**CNcomment:ͨ�����ݵļ��ű�־ */
typedef enum hiUNF_DMX_SCRAMBLED_FLAG_E
{
    HI_UNF_DMX_SCRAMBLED_FLAG_TS,  /**<TS data is scrambled*/ /**< CNcomment:���ݱ�TS������*/
    HI_UNF_DMX_SCRAMBLED_FLAG_PES, /**<PES data is scrambled*/ /**< CNcomment:���ݱ�PES������*/
    HI_UNF_DMX_SCRAMBLED_FLAG_NO,  /**<Data is not scrambled*/ /**< CNcomment:����δ������*/

    HI_UNF_DMX_SCRAMBLED_FLAG_BUTT
} HI_UNF_DMX_SCRAMBLED_FLAG_E;

/**Channel status*/
/**CNcomment:ͨ��״̬ */
typedef enum hiUNF_DMX_CHAN_STATUS_E
{
    HI_UNF_DMX_CHAN_CLOSE = 0x0,	/**<The channel is stopped.*/ /**< CNcomment:ͨ�����ڹر�״̬*/
    HI_UNF_DMX_CHAN_PLAY_EN = 0x1,	/**<The channel is playing audios/videos or receiving data.*/ /**< CNcomment:ͨ����������Ƶ���Ż����ݽ���״̬*/
    HI_UNF_DMX_CHAN_REC_EN = 0x2,	/**<The channel is recording data.*/ /**< CNcomment:ͨ����������¼��״̬*/
    HI_UNF_DMX_CHAN_PLAY_REC_EN = 0x3,	/**<The channel is recording and receiving data.*/ /**< CNcomment:ͨ������ͬʱ¼�ƺ����ݽ���״̬*/
} HI_UNF_DMX_CHAN_STATUS_E;

/**Defines the channel status*/
/** CNcomment:����ͨ��״̬�ṹ��*/
typedef struct hiUNF_DMX_CHAN_STATUS_S
{
    HI_UNF_DMX_CHAN_STATUS_E enChanStatus;   /**<Channel status*/ /**< CNcomment:ͨ��״̬*/
} HI_UNF_DMX_CHAN_STATUS_S;

/**Filter attribute*/
/**CNcomment:����������*/
typedef struct hiUNF_DMX_FILTER_ATTR_S
{
    HI_U32  u32FilterDepth;			/**<Depth of a filter.*/ /**< CNcomment:���������*/
    HI_U8   au8Match[DMX_FILTER_MAX_DEPTH];	/**<Matched bytes of a filter.The data is compared by bit.*/ /**< CNcomment:������ƥ���ֽ�,��bit�Ƚ�*/
    HI_U8   au8Mask[DMX_FILTER_MAX_DEPTH];	/**<Masked bytes of a filter. The conditions are set by bit. 0: no mask. Comparison is required. 1: mask. Comparison is not required.*/ /**< CNcomment:�����������ֽ�,��bit����, 0:û��mask��Ҫ���бȽ�, 1:mask�����ã������бȽ�*/
    HI_U8   au8Negate[DMX_FILTER_MAX_DEPTH];	/**<Negated bytes of a filter. 0: not negated; 1: negated*/ /**< CNcomment:������ȡ���ֽ�,��byte����, 0:��ȡ��,1:ȡ��*/
} HI_UNF_DMX_FILTER_ATTR_S;

/**Type of the DEMUX data packet.*/
/**CNcomment:DEMUX���ݰ�������*/
typedef enum hiUNF_DMX_DATA_TYPE_E
{
    HI_UNF_DMX_DATA_TYPE_WHOLE = 0,  /**<The data segment contains a complete data packet*/ /**< CNcomment:�˶����ݰ������������ݰ�, ����SECTIONÿ��������������*/
    HI_UNF_DMX_DATA_TYPE_HEAD,	     /**<The data segment contains the head of a data packet, but the data packet may not be complete*/ /**< CNcomment:�˶����ݰ������ݰ�����ʼ�����ǲ�һ���������İ�, ֻ����PES����*/
    HI_UNF_DMX_DATA_TYPE_BODY,	     /**<This type is valid only for the PES data.The data segment contains the body of a data packet. */ /**< CNcomment:�˶����ݰ������ݰ������ݣ���������ʼ�������н�β, ֻ����PES����*/
    HI_UNF_DMX_DATA_TYPE_TAIL,	     /**<This type is valid only for the PES data.The data segment contains the tail of a data packet, and is used to identify the end of a data packet.*/ /**< CNcomment:�˶����ݰ������ݰ��Ľ�β������ָʾ��ʶ��İ�����, ֻ����PES����*/

    HI_UNF_DMX_DATA_TYPE_BUTT
} HI_UNF_DMX_DATA_TYPE_E;

/**DEMUX data packet*/
/**CNcomment:DEMUX���ݰ��ṹ*/
typedef struct hiUNF_DMX_DATA_S
{
    HI_U8   *pu8Data;			/**<Data pointer*/ /**< CNcomment:����ָ�� */
    HI_U32  u32Size;			/**<Data length*/ /**< CNcomment:���ݳ��� */
    HI_UNF_DMX_DATA_TYPE_E enDataType;	/**<Data packet type*/ /**< CNcomment:���ݰ������� */
} HI_UNF_DMX_DATA_S;

/**type of record*/
/**CNcomment: ¼������*/
typedef enum hiUNF_DMX_REC_TYPE_E
{
    HI_UNF_DMX_REC_TYPE_SELECT_PID,
    HI_UNF_DMX_REC_TYPE_ALL_PID,
    HI_UNF_DMX_REC_TYPE_BUTT
} HI_UNF_DMX_REC_TYPE_E;

/**type of index*/
/**CNcomment: �������� */
typedef enum hiUNF_DMX_REC_INDEX_TYPE_E
{
    HI_UNF_DMX_REC_INDEX_TYPE_NONE,	/**<No index is created */  /**<CNcomment: �������� */
    HI_UNF_DMX_REC_INDEX_TYPE_VIDEO,	/**<Video index */	    /**<CNcomment: ��Ƶ���� */
    HI_UNF_DMX_REC_INDEX_TYPE_AUDIO,	/**<Audio index */	    /**<CNcomment: ��Ƶ���� */
    HI_UNF_DMX_REC_INDEX_TYPE_BUTT
} HI_UNF_DMX_REC_INDEX_TYPE_E;

/**record attribute*/
/**CNcomment: ¼������*/
typedef struct hiUNF_DMX_REC_ATTR_S
{
    HI_U32			u32DmxId;
    HI_U32			u32RecBufSize;	/**<Buffer size used by record */ /**< CNcomment: ¼�ƻ����С */
    HI_UNF_DMX_REC_TYPE_E	enRecType;	/**<Record type */ /**< CNcomment: ¼������ */
    HI_BOOL			bDescramed;	/**<HI_TRUE is the descrambled TS. HI_FALSE is the original TS. */ /**<CNcomment: HI_TRUE��ʾ¼�ƽ��ź��TS����HI_FALSE��ʾ¼��ԭʼ�� */
    HI_UNF_DMX_REC_INDEX_TYPE_E enIndexType;	/**<Index type */ /**< CNcomment: �������� */
    HI_U32			u32IndexSrcPid; /**<The index information is formed according to the PID. when indexing video, it has to be set to the video of PID. when indexing audio, it has to be set to the audio of PID. */ /**< CNcomment: ���ݴ�PID�����������ݣ���Ƶ����ʱ����Ϊ��Ƶ��PID����Ƶ����ʱ����Ϊ��Ƶ��PID */
    HI_UNF_VCODEC_TYPE_E	enVCodecType;	/**<Video encoding protocol. The protocol needs to be set only when the index type is HI_UNF_DMX_REC_INDEX_TYPE_VIDEO.*/ /**< CNcomment: ��Ƶ����ʱ������Ƶ�ı������� */
    HI_UNF_DMX_SECURE_MODE_E	enSecureMode;	/**<Secure record indication*/ /**<CNcomment:��ȫ¼�Ʊ�ʾ*/
} HI_UNF_DMX_REC_ATTR_S;

/**record data*/
/**CNcomment: ¼������*/
typedef struct hiUNF_DMX_REC_DATA_S
{
    HI_U8  *pDataAddr;	    /**<Data address*/		/**<CNcomment: ���ݵ�ַ */
    HI_U32  u32DataPhyAddr; /**<Data physical address*/ /**<CNcomment: ���ݵ�������ַ */
    HI_U32  u32Len;	    /**<Data length*/		/**<CNcomment: ���ݳ��� */
} HI_UNF_DMX_REC_DATA_S;

/**index data*/
/**CNcomment: ��������*/
typedef struct hiUNF_DMX_REC_INDEX_S
{
    HI_UNF_VIDEO_FRAME_TYPE_E	enFrameType;	    /**< it is meaningless when indexing audio. */ /**<CNcomment: ��Ƶ����ʱ������ */
    HI_U32			u32PtsMs;
    HI_U64			u64GlobalOffset;
    HI_U32			u32FrameSize;	    /**< it is meaningless when indexing audio. */ /**<CNcomment: ��Ƶ����ʱ������ */
    HI_U32			u32DataTimeMs;
} HI_UNF_DMX_REC_INDEX_S;

/**index and record data*/
/**CNcomment: �������ݺ�¼������*/
typedef struct hiUNF_DMX_REC_DATA_INDEX_S
{
    HI_U32 u32IdxNum;					/**< Number of index */ /**<CNcomment: �������ݸ��� */
    HI_U32 u32RecDataCnt;				/**< Number of record data block*/ /**<CNcomment: ¼�����ݿ���� ,һ��Ϊ1����ֻ���ڵ�ǰ¼������һ������¼��bufferβ����һ������ͷ����ʱ�򣬻�ֳ�����block �ֱ��ȡ���� */
    HI_UNF_DMX_REC_INDEX_S stIndex[DMX_MAX_IDX_ACQUIRED_EACH_TIME];
    HI_UNF_DMX_REC_DATA_S  stRecData[2];
} HI_UNF_DMX_REC_DATA_INDEX_S;

/**record buffer status*/
/**CNcomment: ¼�ƻ�����״̬�ṹ*/
typedef struct hiUNF_DMX_RECBUF_STATUS_S
{
    HI_U32  u32BufSize;	    /**<Buffer size*/ /**< CNcomment:��������С */
    HI_U32  u32UsedSize;    /**<Used buffer*/ /**< CNcomment:��������ʹ�ô�С */
} HI_UNF_DMX_RECBUF_STATUS_S;

/**Repeat CC mode of channel*//**CNcomment:ͨ����CC�ظ�ģʽ */
typedef enum hiUNF_DMX_CHAN_CC_REPEAT_MODE
{
    HI_UNF_DMX_CHAN_CC_REPEAT_MODE_RSV	 = 0x0,	    /**<Receive CC repeat ts packet*/ /**< CNcomment:����cc�ظ���ts��*/
    HI_UNF_DMX_CHAN_CC_REPEAT_MODE_DROP	 = 0x1,	    /**<Drop CC repeat ts packet*/ /**< CNcomment:����cc�ظ���ts�� */
    HI_UNF_DMX_CHAN_CC_REPEAT_MODE_BUTT = -1
}HI_UNF_DMX_CHAN_CC_REPEAT_MODE_E;

typedef struct hiUNF_DMX_CHAN_CC_REPEAT_SET_S
{
    HI_HANDLE hChannel;				      /**<The channel handle*/ /**< CNcomment:ͨ�����*/
    HI_UNF_DMX_CHAN_CC_REPEAT_MODE_E enCCRepeatMode;   /**<Repeat CC mode of channel*/ /**< CNcomment:ͨ����CCģʽ*/
}HI_UNF_DMX_CHAN_CC_REPEAT_SET_S;

/** PUSI (Payload Unit Start Index) config structure*/
/**CNcomment: PUSI ���ýṹ�� */
typedef struct hiUNF_DMX_PUSI_SET_S
{
    HI_BOOL bPusi;				 /**< Value of Pusi , Default is HI_FALSE means receive ts packet without checking PUSI*/ /**< CNcomment:NoPusiEn ��ֵ��Ĭ��Ϊ HI_FALSE ��ʾ����TS����ʱ�򲻼��PUSI��־*/
}HI_UNF_DMX_PUSI_SET_S;

/** TEI (Transport Error Index) config structure*/
/**CNcomment: TEI ���ýṹ�� */
typedef struct hiUNF_DMX_TEI_SET_S
{
    HI_U32   u32DemuxID;		    /**<The Subdiviece ID*/ /**< CNcomment:Demux ���豸ID*/
    HI_BOOL bTei;				    /**< Value of bTei , Default is HI_FALSE means receive ts packet even TEI equal 1*/ /**< CNcomment:TEICfg ��ֵ��Ĭ��Ϊ HI_FALSE ��ʾ����TEIΪ1 �� TS����Ȼ����*/
}HI_UNF_DMX_TEI_SET_S;

/** Define of how TSI and TSO to be attached */
/**CNcomment: TSI/TSO�󶨹�ϵ�ṹ�� */
typedef struct hiUNF_DMX_TSI_ATTACH_TSO_S
{
    HI_UNF_DMX_PORT_E	    enTSI;		/**<The TSI ID*/ /**< CNcomment:TSI �˿�ID*/
    HI_UNF_DMX_TSO_PORT_E   enTSO;		/**<The TSO ID*/ /**< CNcomment:TSO �˿�ID*/
}HI_UNF_DMX_TSI_ATTACH_TSO_S;

typedef enum hiUNF_DMX_INVOKE_TYPE
{
    HI_UNF_DMX_INVOKE_TYPE_CHAN_CC_REPEAT_SET  = 0,  /**<dmx set channel extra attr,param:HI_UNF_DMX_CHAN_CC_REPEAT_SET_S*//**<CNcomment: ����ͨ���������ԣ�ʹ�ò���HI_UNF_DMX_CHAN_CC_REPEAT_SET_S */
    HI_UNF_DMX_INVOKE_TYPE_PUSI_SET,			/**<dmx set PUSI flag,param:HI_UNF_DMX_PUSI_SET_S*//**<CNcomment: ���� NoPusiEn ��־��ʹ�ò���HI_UNF_DMX_PUSI_SET_S */
    HI_UNF_DMX_INVOKE_TYPE_TEI_SET,		/**<dmx set TEI flag,param:HI_UNF_DMX_TEI_SET_S*//**<CNcomment: ����Demux ���豸TEICfg ��־��ʹ�ò���HI_UNF_DMX_TEI_SET_S */
    HI_UNF_DMX_INVOKE_TYPE_TSI_ATTACH_TSO,	/**<Attach TSI with TSO ,param:HI_UNF_DMX_TSI_ATTACH_TSO_S*//**<CNcomment: ��TSI �� ĳ�� TSO ��,��: TSI ���������� TSO ��ʹ�ò���HI_UNF_DMX_TEI_SET_S */
    HI_UNF_DMX_INVOKE_TYPE_BUTT
} HI_UNF_DMX_INVOKE_TYPE_E;

/** Define cb context type */
/**CNcomment:����ص������ĵ�����*/
typedef enum hiUNF_DMX_CB_CONTEXT_TYPE_E
{
    HI_UNF_DMX_CB_CONTEXT_TYPE_SHARED = 0, /**<public shared context thread*//**<CNcomment:�����Ĺ��������� */
    HI_UNF_DMX_CB_CONTEXT_TYPE_PRIVATE, /**<private context thread *//**<CNcomment:˽��������*/
    HI_UNF_DMX_CB_CONTEXT_TYPE_BUTT
}HI_UNF_DMX_CB_CONTEXT_TYPE_E;

/** Declare section/pes/post cb function interface */
/**CNcomment:����section/pes/postͨ���Ļص������ӿ�*/
typedef HI_S32 (*HI_UNF_DMX_CHAN_BUF_CB_FUNC)(HI_HANDLE hChannel, HI_U32 u32AcquiredNum, HI_UNF_DMX_DATA_S *pstBuf, HI_VOID *pUserData);

/** Define cb descriptor */
/**CNcomment:����ص�������Ϣ*/
typedef struct hiUNF_DMX_CB_DESC_S
{
    HI_UNF_DMX_CB_CONTEXT_TYPE_E enContextType; /**<cb context type*//**<CNcomment:�ص�����������*/
    HI_UNF_DMX_CHAN_BUF_CB_FUNC pfnChanBufCb; /**<section/pes/post cb function *//**<CNcomment:section/pes/postͨ���ص�����*/
    HI_VOID *pUserData; /** user private data *//**<CNcomment:�û�˽����Ϣ */
}HI_UNF_DMX_CB_DESC_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */


/******************************* API Declaration *****************************/
/** \addtogroup	     DEMUX */
/** @{ */  /** <!-- [DEMUX] */

/**
\brief Initializes the DEMUX module.CNcomment:��ʼ��DEMUXģ�顣CNend
\attention \n
Before using DEMUXs, you must call this application programming interface (API).\n
Before using the personal video recorder (PVR) or audio/video player (AVPLAY), you need to initialize the DEMUX module.\n
The error code HI_SUCCESS is returned if this API is called repeatedly.
CNcomment:�ڽ���DEMUX��ز���ǰӦ�����ȵ��ñ��ӿ�\n
��ʹ��PVR��AVPLAYǰ����ǰ����DEMUXģ��ĳ�ʼ��\n
�ظ����ñ��ӿڷ��سɹ���CNend
\param	N/A.CNcomment:�ޡ�CNend
\retval ::HI_SUCCESS Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\see \n
N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_Init(HI_VOID);


/**
\brief Deinitializes the DEMUX module. CNcomment:ȥ��ʼ��DEMUXģ�顣CNend
\attention \n
After this API is called, the DEMUX module is stopped, and the DEMUX resources used by the process are released.\n
This API is valid when it is called for the first time. If this API is called repeatedly, the error code HI_SUCCESS is returned.
CNcomment:���ñ��ӿ�ֹͣʹ��DEMUXģ�飬���ͷű�������ռ�õ�DEMUX��Դ\n
���ӿڵ�һ�ε��������ã��ظ����÷��سɹ���CNend
\param	N/A.CNcomment:�ޡ�CNend
\retval ::HI_SUCCESS Success CNcomment:�ɹ���CNend
\retval ::HI_FAILURE Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DeInit(HI_VOID);


/**
\brief Obtains the information about the service capabilities of the DEMUX module.The information includes the numbers of channels, filters, keys, ports, DEMUXs, and audio/video channels.
CNcomment:��ѯDEMUXģ��ҵ��������ҵ���ܰ���ͨ��ͨ����Ŀ����������Ŀ����Կ��Ŀ���˿���Ŀ��DEMUX�豸��Ŀ������Ƶͨ����Ŀ�ȡ�CNend
\attention \n
N/A.CNcomment:�ޡ�CNend
\param[out] pstCap   Pointer to the capability of the DEMUX module (output).CNcomment:ָ�����ͣ����DEMUXģ��������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null.CNcomment:ָ�����Ϊ�ա�CNend
\see \n
::HI_UNF_DMX_CAPABILITY_S
*/
HI_S32 HI_UNF_DMX_GetCapability(HI_UNF_DMX_CAPABILITY_S *pstCap);


/**
\brief Obtains the attributes of a DEMUX port.CNcomment:��ȡDEMUX�˿����ԡ�CNend
\attention \n
 N/A.CNcomment:�ޡ�CNend
\param[in] enPortId Port ID.CNcomment:�˿ںš�CNend
\param[out] pstAttr Pointer to the port attributes (output).CNcomment:ָ�����ͣ�����˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null.CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSPortAttr(HI_UNF_DMX_PORT_E enPortId, HI_UNF_DMX_PORT_ATTR_S *pstAttr);


/**
\brief Sets the attributes of a DEMUX port.CNcomment:����DEMUX�˿����ԡ�CNend
\attention \n
It is recommended to query the default attributes of a DEMUX port by calling HI_UNF_DMX_GetTSPortAttr before modifying the attributes of the port.\n
The port mode can be queried only, notice that it will lose TS data if call this function during receiving data.\n
If the sync loss threshold and sync lock threshold are used, their default values are recommended.\n
For details on how to set the input clock of the tuner, select the line sequence of the port, and set the level of the tuner error line, contact hardware engineers of HiSilicon\n
and refer to tuner user manuals.
CNcomment:������ͨ��HI_UNF_DMX_GetTSPortAttr��ȡĬ�����ԣ�Ȼ���Ҫ�ı�����Խ�������\n
�˿�ģʽֻ֧�ֲ�ѯ����֧���޸ģ�ע�������ݹ��̵��øýӿڻ�����TS��\n
ͬ����ʧ��ͬ���������ޣ��Ƽ�ʹ��Ĭ��ֵ\n
tuner����ʱ�ӷ��򡢶˿�����ѡ���tuner error�ߵ�ƽģʽ����������ѯӲ������ʦ\n
���ο�tuner���û��ֲᣬȻ������Ϊ���ʵ�ֵ��CNend
\param[in] enPortId Port ID.CNcomment:�˿ںš�CNend
\param[in] pstAttr  Pointer to port attributes.CNcomment:ָ�����ͣ��˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetTSPortAttr(HI_UNF_DMX_PORT_E enPortId, const HI_UNF_DMX_PORT_ATTR_S *pstAttr);


/**
\brief Obtains the attributes of a DEMUX TSO port.CNcomment:��ȡDEMUX TS����˿����ԡ�CNend
\attention \n
 N/A.CNcomment:�ޡ�CNend
\param[in] enPortId Port ID.CNcomment:�˿ںš�CNend
\param[out] pstAttr Pointer to the port attributes (output).CNcomment:ָ�����ͣ�����˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null.CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSOPortAttr(HI_UNF_DMX_TSO_PORT_E enPortId, HI_UNF_DMX_TSO_PORT_ATTR_S *pstAttr);


/**
\brief Sets the attributes of a DEMUX TSO port.CNcomment:����DEMUX TS ����˿����ԡ�CNend
\attention \n
It is recommended to query the default attributes of a DEMUX TSO port by calling HI_UNF_DMX_GetTSOPortAttr before modifying the attributes of the TSO port.
CNcomment:������ͨ��HI_UNF_DMX_GetTSPortAttr��ȡĬ�����ԣ�Ȼ���Ҫ�ı�����Խ������á�CNend
\param[in] enPortId Port ID.CNcomment:�˿ںš�CNend
\param[in] pstAttr  Pointer to port attributes.CNcomment:ָ�����ͣ��˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetTSOPortAttr(HI_UNF_DMX_TSO_PORT_E enPortId, HI_UNF_DMX_TSO_PORT_ATTR_S *pstAttr);

/**
\brief Get the tag attributes.CNcomment:��ȡtag ��������ԡ�CNend
\attention \n
pstAttr.au8Tag is a key index, this interface will return corresponding tag attrs if this key value has registered, otherwise return default tag attrs.
 N/A.CNcomment:pstAttr.au8Tag������һ������������ӿڻ᷵�ض�Ӧ��tag���������������Ѿ���ע�ᣬ����Ļ�����Ĭ�ϵ�tag�������á�CNend
\param[in] u32DmxId  DEMUX ID.CNcomment:DEMUX�š�CNend
\param[in & out] pstAttr Pointer to the tag port attributes (output).CNcomment:ָ�����ͣ�tag�˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetDmxTagAttr(HI_U32 u32DmxId, HI_UNF_DMX_TAG_ATTR_S *pstAttr);

/**
\brief Set the tag attributes.CNcomment:����tag��������ԡ�CNend
\attention \n
pstAttr.au8Tag is a key index, it will register this new tag if this key value has not registered. otherwise increase tag reference number.
 N/A.CNcomment:pstAttr.au8Tag������һ������������ӿڻ�ע���µ�tagֵ���tagδ��ע��Ļ������������tag��Ӧ�ü�����CNend
\param[in] u32DmxId  DEMUX ID.CNcomment:DEMUX�š�CNend
\param[in] pstAttr Pointer to the tag port attributes (output).CNcomment:ָ�����ͣ�tag�˿����ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
 */
HI_S32 HI_UNF_DMX_SetDmxTagAttr(HI_U32 u32DmxId, const HI_UNF_DMX_TAG_ATTR_S *pstAttr);


/**
\brief Attaches a DEMUX to a port.CNcomment:��DEMUX���˿��ϡ�CNend
\attention \n
Each DEMUX can be attached to only one port, but the data from a port can be delivered to multiple DEMUXs.\n
After a DEMUX is attached to a port, the DEMUX starts to receive the data input from this port.\n
If the DEMUX is not used, you can detach it by calling HI_UNF_DMX_DetachTSPort.\n
The DEMUXs can be attached to different ports dynamically. That is, you can attach the DEMUXs without detaching them.\n
If you call this API to attach a DEMUX to the same channel, the error code HI_SUCCESS is returned.
CNcomment:ÿ·DEMUXֻ�ܰ󶨵�һ��PORT������һ��PORT�����ݿ��Էַ������DEMUX\n
DEMUX�󶨵��˿���֮��Ϳ�ʼ��������˿������������\n
����ʹ����·DEMUX�������ݺ�ʹ��HI_UNF_DMX_DetachTSPort�ӿڽ��DEMUX\n
���Զ�̬�İ󶨵���ͬ�Ķ˿��ϣ������Ƚ��\n
�ظ����ô˽ӿڰ󶨵���ͬͨ���Ϸ��سɹ���CNend
\param[in] u32DmxId  DEMUX ID.CNcomment:DEMUX�š�CNend
\param[in] enPortId  Port ID.CNcomment:�˿ںš�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
::HI_UNF_DMX_DetachTSPort
*/
HI_S32 HI_UNF_DMX_AttachTSPort(HI_U32 u32DmxId, HI_UNF_DMX_PORT_E enPortId);


/**
\brief Detaches a DEMUX from a port.CNcomment:�Ӷ˿��Ͻ��DEMUX��CNend
\attention \n
If a DEMUX is not used, you can detach it from the corresponding port by calling this API.\n
This API can be called dynamically, and can be used to disable the input sources of a DEMUX.\n
If this API is called repeatedly, the error code HI_SUCCESS is returned.
CNcomment:����ʹ��DEMUX�����κ�����ʱʹ�ô˽ӿڽ�DEMUX�Ӷ˿��Ͻ��\n
���Զ�̬ʹ�ý�󶨽ӿڣ�����ͨ����󶨽ӿ��ж�DEMUX������Դ\n
�ظ���󶨷��سɹ���CNend
\param[in] u32DmxId  DEMUX ID. CNcomment: DEMUX�š�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
::HI_UNF_DMX_AttachTSPort
*/
HI_S32 HI_UNF_DMX_DetachTSPort(HI_U32 u32DmxId);


/**
\brief Obtains the ID of the port that is attached to a DEMUX. CNcomment:��ȡDEMUX���󶨵Ķ˿ڵĶ˿ںš�CNend
\attention \n
If a DEMUX is not attached to any port, an error code is returned.CNcomment:���DEMUXû�а󶨵��κζ˿��ϻ᷵�ش����롣CNend
\param[in] u32DmxId  DEMUX ID. CNcomment: DEMUX�š�CNend
\param[out] penPortId  Pointer to the ID of the port that is attached to a DEMUX(output).CNcomment:ָ�����ͣ����DEMUX�󶨵Ķ˿ںš�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOATTACH_PORT  The DEMUX is not attached to any port.CNcomment:��·DEMUXû�а󶨵��κζ˿��ϡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSPortId(HI_U32 u32DmxId, HI_UNF_DMX_PORT_E *penPortId);

/**
\brief Obtains the default attributes of a TS Buffer.CNcomment:��ȡTS BufferĬ�����ԡ�CNend
\attention \n
It is recommended to query the default TS Buffer attributes before creating a TS Buffer, and then modify the attributes,\n
notice the secure mode of default attributes is None Secure Mode.
CNcomment:���������TS Buffer֮ǰʹ�ô˽ӿڻ�ȡĬ�����ԣ�\n
Ȼ��ı���Ҫ�޸ĵ����Լ��ɣ�ע��Ĭ������Ϊ�ǰ�ȫģʽ��CNend
\param[out] pstTsBufAttr Pointer to the structure of the TS Buffer attributes.CNcomment:TS Buffer���Խṹ��ָ�롣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBufferDefaultAttr(HI_UNF_DMX_TSBUF_ATTR_S *pstTsBufAttr);

/**
\brief Creates a TS buffer for the RAM port to receive the TS data from Internet or local memory. CNcomment:ΪRAM�˿ڴ���TS Buffer���ڽ��մ�����򱾵ش洢�������TS���ݡ�CNend
\attention \n
A TS buffer can be created for the RAM port only.\n
The buffer size must range from 4 KB to 16 MB.\n
It is recommended to set the buffer size to an integral multiple of 4 KB. Otherwise, bottom alignment is performed inside.\n
The TS buffer cannot be created for the same port for multiple times; otherwise, an error code is returned.
CNcomment:ֻ��RAM�˿ڿ��Դ���TS Buffer\n
buffer��С������4K��16M֮�䣬��λΪ�ֽ�\n
buffer��С���Ϊ4K��������������������������ڲ���������¶������\n
ͬһ���˿ڲ����ظ�����TS Buffer,���򷵻ش����롣CNend
\param[in] enPortId  Port ID.CNcomment:�˿ںš�CNend
\param[in] u32TsBufSize Size of a TS buffer.CNcomment:TS Buffer��С��CNend
\param[out] phTsBuffer	Pointer to the handle of a created TS buffer (output).CNcomment:ָ�����ͣ����������TS Buffer �����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_RECREAT_TSBUFFER  The TS buffer corresponding to the port is created.CNcomment:�ظ�����TS Buffer��CNend
\see \n
N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateTSBuffer(HI_UNF_DMX_PORT_E enPortId, HI_U32 u32TsBufSize, HI_HANDLE *phTsBuffer);

/**
\brief Creates a TS buffer for the RAM port to receive the TS data from Internet or local memory. CNcomment:ΪRAM�˿ڴ���TS Buffer���ڽ��մ�����򱾵ش洢�������TS���ݡ�CNend
\attention \n
A TS buffer can be created for the RAM port only.\n
The buffer size must range from 4 KB to 16 MB.\n
It is recommended to set the buffer size to an integral multiple of 4 KB. Otherwise, bottom alignment is performed inside.\n
The TS buffer cannot be created for the same port for multiple times; otherwise, an error code is returned.
CNcomment:ֻ��RAM�˿ڿ��Դ���TS Buffer\n
buffer��С������4K��16M֮�䣬��λΪ�ֽ�\n
buffer��С���Ϊ4K��������������������������ڲ���������¶������\n
ͬһ���˿ڲ����ظ�����TS Buffer,���򷵻ش����롣CNend
\param[in] enPortId  Port ID.CNcomment:�˿ںš�CNend
\param[in] pstTsBufAttr Attributes of a TS buffer.CNcomment:TS Buffer�������ԡ�CNend
\param[out] phTsBuffer	Pointer to the handle of a created TS buffer (output).CNcomment:ָ�����ͣ����������TS Buffer �����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_RECREAT_TSBUFFER  The TS buffer corresponding to the port is created.CNcomment:�ظ�����TS Buffer��CNend
\see \n
N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateTSBufferExt(HI_UNF_DMX_PORT_E enPortId, const HI_UNF_DMX_TSBUF_ATTR_S *pstTsBufAttr, HI_HANDLE *phTsBuffer);

/**
\brief Destroys an existing TS buffer. CNcomment:���ٴ�����TS Buffer��CNend
\attention \n
A TS buffer cannot be destroyed repeatedly. If a TS buffer is destroyed, its handle is also destroyed.\n
In addition, if a buffer is destroyed, its data is cleared. In this case, the get and put operations are not available.\n
However, the data in channels is retained when a TS buffer is destroyed. To switch streams, you need disable the channel, and then enable the channel again.
CNcomment:�����ظ�����һ��TS Buffer,����֮��handle�Ͳ�������\n
����֮��buffer�е����ݾͻᱻ��գ������ٽ���Get��Put����\n
����TS buffer���������ͨ�������ݣ�Ҫ�л�������Ҫע��ر�ͨ�������´򿪡�CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DestroyTSBuffer(HI_HANDLE hTsBuffer);


/**
\brief Obtains a TS buffer to input data.CNcomment:��ȡTS Buffer�ռ䣬�����������롣CNend
\attention \n
If you call this API repeatedly, the address of the same buffer is returned.\n
The input data length must be appropriate. If the data length is too large, data cannot be input in time.\n
If the data length is too small, the buffer is scheduled frequently, which causes the system performance to deteriorate.\n
If the size of the available space is smaller than the requested data length, an error code is returned.\n
To be specific, the requested data length must be smaller than the size of the available space, that is, the buffer cannot be full.\n
In addition, the requested data length cannot be 0; otherwise, the error code HI_ERR_DMX_INVALID_PARA is returned.\n
If u32TimeOutMs is set to 0, it indicates that the waiting time is 0; if u32TimeOutMs is set to 0XFFFFFFFF, it indicates infinite wait; if u32TimeOutMs is set to other values, it indicates that the waiting time is u32TimeOutMs ms.\n
If no buffer can be applied for during the block period, the error code HI_ERR_DMX_TIMEOUT is returned.\n
If u32TimeOutMs is set to 0, and no buffer can be applied for, it indicates that the internal TS buffer is full. In this case, you need to call the usleep(10000) function to release the CPU. Therefore, other threads can be scheduled.
CNcomment:�ظ�get����ͬһ��buffer��ַ\n
��������ʱע��ÿ����������ݳ��ȣ�̫�����ܻᵼ���������ݲ���ʱ\n
̫�̿��ܻᵼ�µ���̫Ƶ���������½�\n
��ʣ��ռ�С�ڵ�������ĳ���ʱ�����ش�����\n
ÿ������ĳ���ҪС��ʣ��ʣ�೤�ȣ���buffer�����ܱ�����\n
���󳤶Ȳ�����Ϊ0�����򷵻ز����Ƿ�������\n
u32TimeOutMs����Ϊ0��ʾ���ȴ�������Ϊ0xffffffff��ʾһֱ�ȴ�������Ϊ����ֵ��ʾ�ȴ�u32TimeOutMs���롣\n
����������ʱ�䣬���޷����뵽Buffer���򷵻�HI_ERR_DMX_TIMEOUT������\n
u32TimeOutMs����Ϊ0ʱ��������벻��Buffer��˵����ʱ�ڲ�TS Buffer�ռ���������Ҫͨ��usleep(10000)�ͷ�cpu
��ʹ�����߳��ܹ��õ����ȡ�CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[in] u32ReqLen Requested data length.CNcomment:�������ݵĳ��ȡ�CNend
\param[out] pstData  Data buffer.CNcomment:����buffer�ṹ��CNend
\param[in] u32TimeOutMs	     Wait timeout, in ms.CNcomment:�ȴ���ʱʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_TIMEOUT  The wait times out. CNcomment:�ȴ���ʱ��CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_BUF  The size of the available buffer is smaller than the requested data length.CNcomment:ʣ��buffer�ռ�С�����󳤶ȡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBuffer(HI_HANDLE hTsBuffer, HI_U32 u32ReqLen,
	    HI_UNF_STREAM_BUF_S *pstData, HI_U32 u32TimeOutMs);

/**
\brief Obtains a TS buffer to input data.CNcomment:��ȡTS Buffer�ռ䣬�����������롣CNend
\attention \n
If you call this API repeatedly, the address of the same buffer is returned.\n
The input data length must be appropriate. If the data length is too large, data cannot be input in time.\n
If the data length is too small, the buffer is scheduled frequently, which causes the system performance to deteriorate.\n
If the size of the available space is smaller than the requested data length, an error code is returned.\n
To be specific, the requested data length must be smaller than the size of the available space, that is, the buffer cannot be full.\n
In addition, the requested data length cannot be 0; otherwise, the error code HI_ERR_DMX_INVALID_PARA is returned.\n
If u32TimeOutMs is set to 0, it indicates that the waiting time is 0; if u32TimeOutMs is set to 0XFFFFFFFF, it indicates infinite wait; if u32TimeOutMs is set to other values, it indicates that the waiting time is u32TimeOutMs ms.\n
If no buffer can be applied for during the block period, the error code HI_ERR_DMX_TIMEOUT is returned.\n
If u32TimeOutMs is set to 0, and no buffer can be applied for, it indicates that the internal TS buffer is full. In this case, you need to call the usleep(10000) function to release the CPU. Therefore, other threads can be scheduled.
CNcomment:�ظ�get����ͬһ��buffer��ַ\n
��������ʱע��ÿ����������ݳ��ȣ�̫�����ܻᵼ���������ݲ���ʱ\n
̫�̿��ܻᵼ�µ���̫Ƶ���������½�\n
��ʣ��ռ�С�ڵ�������ĳ���ʱ�����ش�����\n
ÿ������ĳ���ҪС��ʣ��ʣ�೤�ȣ���buffer�����ܱ�����\n
���󳤶Ȳ�����Ϊ0�����򷵻ز����Ƿ�������\n
u32TimeOutMs����Ϊ0��ʾ���ȴ�������Ϊ0xffffffff��ʾһֱ�ȴ�������Ϊ����ֵ��ʾ�ȴ�u32TimeOutMs���롣\n
����������ʱ�䣬���޷����뵽Buffer���򷵻�HI_ERR_DMX_TIMEOUT������\n
u32TimeOutMs����Ϊ0ʱ��������벻��Buffer��˵����ʱ�ڲ�TS Buffer�ռ���������Ҫͨ��usleep(10000)�ͷ�cpu
��ʹ�����߳��ܹ��õ����ȡ�CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[in] u32ReqLen Requested data length.CNcomment:�������ݵĳ��ȡ�CNend
\param[out] pstData  Data buffer.CNcomment:����buffer�ṹ��CNend
\param[out] pu32PhyAddr buffer physical address.CNcomment:buffer��������ַ��CNend
\param[in] u32TimeOutMs	     Wait timeout, in ms.CNcomment:�ȴ���ʱʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_TIMEOUT  The wait times out. CNcomment:�ȴ���ʱ��CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_BUF  The size of the available buffer is smaller than the requested data length.CNcomment:ʣ��buffer�ռ�С�����󳤶ȡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBufferEx(HI_HANDLE hTsBuffer, HI_U32 u32ReqLen,
	    HI_UNF_STREAM_BUF_S *pstData, HI_U32 *pu32PhyAddr, HI_U32 u32TimeOutMs);

/**
\brief Updates the write pointer of a TS buffer after the TS data is input.CNcomment:TS����������ϣ����ڸ���TS Bufferдָ�롣CNend
\attention \n
This API must work with HI_UNF_DMX_GetTSBuffer. That is, if you call HI_UNF_DMX_PutTSBuffer without calling HI_UNF_DMX_GetTSBuffer, no operation takes effect, but the error code HI_SUCCESS is returned.\n
If the valid data length is 0, no operation takes effect, and the error code HI_SUCCESS.\n
The valid data length cannot be greater than data length queried by calling HI_UNF_DMX_GetTSBuffer. Otherwise, the error code HI_ERR_DMX_INVALID_PARA is returned.\n
If the valid data length is smaller than the data length queried by calling HI_UNF_DMX_GetTSBuffer, it indicates that a part of data is stored.
CNcomment:�˽ӿڱ����Get�ӿ����ʹ�ã����û��Get�����Put�������򲻻�����κβ����������سɹ�\n
Put�ĳ������Ϊ0��Ҳ��������κβ���ֱ�ӷ��سɹ�\n
������Put���ȴ���ʵ��Get���ĳ��ȣ����򷵻ز����Ƿ�������\n
����Put����С��Get���ȣ�����ֻ������һ��������\n
Ϊ���Ч�ʣ�Put�ĳ��Ⱦ�����Ҫ̫�̣�����������10��ts������Putһ�Σ�����̫�̻ᵼ�������½�\n��CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[in] u32ValidDataLen Valid data length.CNcomment:��Ч���ݵĳ��ȡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_PutTSBuffer(HI_HANDLE hTsBuffer, HI_U32 u32ValidDataLen);

/**
\brief Updates the write pointer of a TS buffer after the TS data is input.CNcomment:TS����������ϣ����ڸ���TS Bufferдָ�롣CNend
\attention \n
This API must work with HI_UNF_DMX_GetTSBuffer. That is, if you call HI_UNF_DMX_PutTSBuffer without calling HI_UNF_DMX_GetTSBuffer, no operation takes effect, but the error code HI_SUCCESS is returned.\n
If the valid data length is 0, no operation takes effect, and the error code HI_SUCCESS.\n
The valid data length cannot be greater than data length queried by calling HI_UNF_DMX_GetTSBuffer. Otherwise, the error code HI_ERR_DMX_INVALID_PARA is returned.\n
If the valid data length is smaller than the data length queried by calling HI_UNF_DMX_GetTSBuffer, it indicates that a part of data is stored.
CNcomment:�˽ӿڱ����Get�ӿ����ʹ�ã����û��Get�����Put�������򲻻�����κβ����������سɹ�\n
Put�ĳ������Ϊ0��Ҳ��������κβ���ֱ�ӷ��سɹ�\n
������Put���ȴ���ʵ��Get���ĳ��ȣ����򷵻ز����Ƿ�������\n
����Put����С��Get���ȣ�����ֻ������һ��������\n
Ϊ���Ч�ʣ�Put�ĳ��Ⱦ�����Ҫ̫�̣�����������10��ts������Putһ�Σ�����̫�̻ᵼ�������½�\n��CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[in] u32ValidDataLen Valid data length.CNcomment:��Ч���ݵĳ��ȡ�CNend
\param[in] u32StartPos start position of the valid data. CNcomment:��Ч���ݵ���ʼλ�á�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_PutTSBufferEx(HI_HANDLE hTsBuffer, HI_U32 u32ValidDataLen, HI_U32 u32StartPos);

/**
\brief Resets a TS buffer to clear its data.CNcomment:��λTS Buffer�����TS Buffer�е����ݡ�CNend
\attention \n
If a TS buffer is reset, you can call HI_UNF_DMX_PutTSBuffer only after calling HI_UNF_DMX_GetTSBuffer.CNcomment:TS Buffer��λ����Ҫ����get����ִ��put������CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_ResetTSBuffer(HI_HANDLE hTsBuffer);

/**
\brief Obtains the status of a TS buffer. CNcomment:��ȡTS Buffer״̬��CNend
\attention \n
You can query the size of a TS buffer and the used buffer size by calling this API. CNcomment:���Բ�ѯTS Buffer��С�����õĿռ��С��CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[out] pStatus  TS buffer status.CNcomment:TS Buffer״̬�ṹ��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBufferStatus(HI_HANDLE hTsBuffer, HI_UNF_DMX_TSBUF_STATUS_S *pStatus);

/**
\brief Obtains the ID of the port corresponding to a TS buffer.CNcomment:��ȡTS Buffer��Ӧ��Port ID��CNend
\attention \n
If you query the ID of the port corresponding to a TS buffer that is not applied for successfully, an error code is returned.
CNcomment:����û�������TS buffer,��ѯ�᷵�ش���CNend
\param[in] hTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\param[out] penPortId  ID of the port.corresponding to a TS buffer  CNcomment:TS Buffer��Ӧ��Port ID��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBufferPortId(HI_HANDLE hTsBuffer, HI_UNF_DMX_PORT_E *penPortId);

/**
\brief Obtains the handle of the TS buffer corresponding to a port ID.CNcomment:��ȡPort ID��Ӧ��TS Buffer handle��CNend
\attention \n
If you obtain the handle of a TS buffer that is not created, an error code is returned.CNcomment:����û�������TS buffer,��ѯ�᷵�ش���CNend
\param[in] enPortId   Port ID. CNcomment:�˿ںš�CNend
\param[out] phTsBuffer Handle of a TS buffer.CNcomment:TS Buffer�����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSBufferHandle(HI_UNF_DMX_PORT_E enPortId, HI_HANDLE *phTsBuffer);

/**
\brief Obtains the information about TS packets of a port.CNcomment:��ȡ�˿ڵ�TS����Ϣ��CNend
\attention \n
If you query the information about an unattached port, an error code is returned.
CNcomment:����û�а󶨵Ķ˿�,��ѯ�᷵�ش���CNend
\param[in] enPortId    Port ID. CNcomment:�˿ںš�CNend
\param[out] sPortStat	Number of TS packets .CNcomment:TS��������Ϣ��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetTSPortPacketNum(HI_UNF_DMX_PORT_E enPortId, HI_UNF_DMX_PORT_PACKETNUM_S *sPortStat);

/**
\brief Obtains the default attributes of a channel.CNcomment:��ȡͨ��Ĭ�����ԡ�CNend
\attention \n
It is recommended to query the default channel attributes before creating a channel, and then modify the attributes.\n
By default, the attributes of the Section channel are returned. If other channels are used, you need to modify the attributes.
CNcomment:���������ͨ��֮ǰʹ�ô˽ӿڻ�ȡĬ�����ԣ�Ȼ��ı���Ҫ�޸ĵ����Լ���\n
Ĭ�����԰�һ���sectionͨ�����صģ����Ҫʹ���������͵�ͨ��ע���޸�����ֵ��CNend
\param[out] pstChAttr Pointer to the structure of the channel attributes.CNcomment:ͨ�����Խṹ��ָ�롣CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetChannelDefaultAttr(HI_UNF_DMX_CHAN_ATTR_S *pstChAttr);


/**
\brief Creates a PID channel based on channel attributes.CNcomment:����ͨ�����Դ���һ��PIDͨ����CNend
\attention \n
It is recommended to call HI_UNF_DMX_GetChannelDefaultAttr to query default channel attributes before calling HI_UNF_DMX_CreateChannel.
For the Section channel and ECM/EMM channel, you can set the CRC mode, and dynamically change the CRC mode by calling HI_UNF_DMX_SetChannelAttr.\n
For other channels, the CRC check is always disabled. If you select other CRC modes, the CRC disable mode takes effect by default.\n
You need to set the buffer size when creating a channel. The buffer size is in the unit of byte and the default size is 16 KB.\n
It is recommended to set the buffer size to a value greater than 4 KB for the Section channel, ECM/EMM channel, or post channel. If the buffer size is smaller than 4 KB, the size of 4 KB is used by default.\n
It is recommended to set the buffer size to a value greater than 64 KB for the PES channel. If the buffer size is smaller than 64 KB, the size of 64 KB is used by default.\n
The playing channel and playing/recording channel cannot be created at the same time./n
The audio/video playing channels are allocated and managed by the player.
CNcomment:������ô˽ӿ�֮ǰ�������ȵ���HI_UNF_DMX_GetChannelDefaultAttr��ȡͨ��Ĭ������\n
ֻ��section���͵�ͨ����ecm emm���͵�ͨ��֧������CRCģʽ�����ҿ���ͨ���������ýӿڶ�̬�޸�CRCģʽ\n
��������ͨ��ֻ֧������ΪCRC��ֹ�����ѡ�����������͵�CRC�ᱻĬ���޸�ΪCRC��ֹ\n
������ͨ��ʱע��Buffer��С�����ã�Ĭ�ϴ�СΪ16K��buffer��С�ĵ�λΪ�ֽ�\n
Section��ecm emm��POSTͨ����buffer��С����Ϊ4K�����С��4K�ᱻĬ���޸�Ϊ4K\n
PESͨ������ʹ��64K���ϵ�buffer��С�����С��64K�ᱻĬ���޸�Ϊ64K\n
�������ͺ�ͬʱ������¼�����͵�����Ƶͨ���ǲ��������\n
����Ƶ�Ĳ���ͨ����Playerͳһ����͹�����CNend
\param[in] u32DmxId  DEMUX ID. CNcomment: DEMUX�š�CNend
\param[in] pstChAttr  Pointer to the attributes of an input channel. For details, see the description of HI_UNF_DMX_CHAN_ATTR_S.CNcomment:ָ�����ͣ�����ͨ�����ԡ���μ�::HI_UNF_DMX_CHAN_ATTR_S��CNend
\param[out] phChannel  Pointer to the handle of an allocated channel.CNcomment:ָ�����ͣ���������ͨ��Handle����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_CHAN  There is no available channel.CNcomment:û�п���ͨ����CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateChannel(HI_U32 u32DmxId, const HI_UNF_DMX_CHAN_ATTR_S *pstChAttr,
	    HI_HANDLE *phChannel);

/**
\brief Creates or reuse a channel based on PID.CNcomment:����PID ��������һ��ͨ����CNend
\attention \n
It is recommended to call HI_UNF_DMX_GetChannelDefaultAttr to query default channel attributes before calling HI_UNF_DMX_CreateChannel.
For the Section channel and ECM/EMM channel, you can set the CRC mode, and dynamically change the CRC mode by calling HI_UNF_DMX_SetChannelAttr.\n
For other channels, the CRC check is always disabled. If you select other CRC modes, the CRC disable mode takes effect by default.\n
You need to set the buffer size when creating a channel. The buffer size is in the unit of byte and the default size is 16 KB.\n
It is recommended to set the buffer size to a value greater than 4 KB for the Section channel, ECM/EMM channel, or post channel. If the buffer size is smaller than 4 KB, the size of 4 KB is used by default.\n
It is recommended to set the buffer size to a value greater than 64 KB for the PES channel. If the buffer size is smaller than 64 KB, the size of 64 KB is used by default.\n
The playing channel and playing/recording channel cannot be created at the same time./n
The audio/video playing channels are allocated and managed by the player.
CNcomment:������ô˽ӿ�֮ǰ�������ȵ���HI_UNF_DMX_GetChannelDefaultAttr��ȡͨ��Ĭ������\n
ֻ��section���͵�ͨ����ecm emm���͵�ͨ��֧������CRCģʽ�����ҿ���ͨ���������ýӿڶ�̬�޸�CRCģʽ\n
��������ͨ��ֻ֧������ΪCRC��ֹ�����ѡ�����������͵�CRC�ᱻĬ���޸�ΪCRC��ֹ\n
������ͨ��ʱע��Buffer��С�����ã�Ĭ�ϴ�СΪ16K��buffer��С�ĵ�λΪ�ֽ�\n
Section��ecm emm��POSTͨ����buffer��С����Ϊ4K�����С��4K�ᱻĬ���޸�Ϊ4K\n
PESͨ������ʹ��64K���ϵ�buffer��С�����С��64K�ᱻĬ���޸�Ϊ64K\n
�������ͺ�ͬʱ������¼�����͵�����Ƶͨ���ǲ��������\n
����Ƶ�Ĳ���ͨ����Playerͳһ����͹�����CNend
\param[in] u32DmxId  DEMUX ID. CNcomment: DEMUX�š�CNend
\param[in] u32Pid  PID. CNcomment: PID ֵ��CNend
\param[in] pstChAttr  Pointer to the attributes of an input channel. For details, see the description of HI_UNF_DMX_CHAN_ATTR_S.CNcomment:ָ�����ͣ�����ͨ�����ԡ���μ�::HI_UNF_DMX_CHAN_ATTR_S��CNend
\param[out] phChannel  Pointer to the handle of an allocated channel.CNcomment:ָ�����ͣ���������ͨ��Handle����CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_CHAN  There is no available channel.CNcomment:û�п���ͨ����CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateChannelWithPID(HI_U32 u32DmxId, HI_U32 u32Pid, const HI_UNF_DMX_CHAN_ATTR_S *pstChAttr, HI_HANDLE *phChannel);

/**
\brief Destroys an existing PID channel.CNcomment:���ٴ�����PIDͨ����CNend
\attention \n
If you release an enabled channel, the channel is disabled automatically. If you release a channel that is attached to a filter or key area, the channel is detached from the filter or key area automatically.\n
However, the filter or key area is not released.\n
It is recommended to explicitly detach channels by calling corresponding detach APIs. In this way, resources are managed in a unified manner.
CNcomment:�ͷ�ͨ��ʱ���ͨ�����ڴ�״̬���Զ��ر�ͨ�������ͨ���ϰ��˹���������Կ�������Զ����\n
���ǲ������ͷŹ���������Կ��
����ʹ�ý�󶨽ӿڽ�����ʽ�Ľ�󶨲���������Դ��ʹ�ý��������Ĺ�����CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DestroyChannel(HI_HANDLE hChannel);


/**
\brief Obtains the attributes of a channel.CNcomment:��ȡͨ�����ԡ�CNend
\attention \n
The API can be called only after a channel is allocated.CNcomment:���ӿڱ�����ͨ�������Ժ�ſ��Ե��á�CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ��Handle��CNend
\param[out] pstChAttr  Pointer to the attributes of a specified channel. For details, see the description of HI_UNF_DMX_CHAN_ATTR_S.CNcomment:ָ�����ͣ����ָ��ͨ�����ԡ���μ�::HI_UNF_DMX_CHAN_ATTR_S��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetChannelAttr(HI_HANDLE hChannel, HI_UNF_DMX_CHAN_ATTR_S *pstChAttr);


/**
\brief Sets the attributes of a channel.CNcomment:����ͨ�����ԡ�CNend
\attention \n
The API can be called only after a channel is allocated.\n
You cannot dynamically modify all attributes except the CRC mode by calling HI_UNF_DMX_SetChannelAttr.\n
To be specific, the CRC mode can be changed dynamically after a channel is created.\n
If you modify other attributes, the error code HI_ERR_DMX_INVALID_PARA is returned.
CNcomment:���ӿڱ�����ͨ�������Ժ�ſ��Ե���\n
����CRCģʽ�������Զ�������ʹ��HI_UNF_DMX_SetChannelAttr�ӿڽ��ж�̬�޸�\n
CRCģʽ������ͨ������������ʱ���޸ģ���̬��Ч\n
Ҫ�޸��������Ի᷵�ز����Ƿ������롣CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\param[in] pstChAttr	Pointer to the attributes of an input channel. For details, see the description of HI_UNF_DMX_CHAN_ATTR_S.  CNcomment:ָ�����ͣ�����ͨ�����ԡ���μ� ::HI_UNF_DMX_CHAN_ATTR_S��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetChannelAttr(HI_HANDLE hChannel, const HI_UNF_DMX_CHAN_ATTR_S *pstChAttr);


/**
\brief Sets the PID of a channel.CNcomment:����ͨ��PID��CNend
\attention \n
If you set the same PID for two channels of a DEMUX, the PID of the second channel is valid, and the PID of the first channel is changed to 0x1FFF.\n
You must set the PID of a channel after the channel is disabled.\n
If you set the PID of a channel to 0x1FFF, the channel cannot receive data. That is, the channel is disabled.
CNcomment:ͬһ·DEMUX������ͨ��������ͬ��PID�������õ�ͨ����Ч�������õ�ͨ����PID���޸�Ϊ0x1fff\n
������ͨ���رյ�״̬������ͨ����PID\n
������ͨ����PID����Ϊ0x1fff,����Ϊ0x1fff�󲻽����κ����ݣ��൱�ڹر�ͨ����CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\param[in] u32Pid     Channel PID.CNcomment:ͨ��PID��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_OPENING_CHAN  The channel is enabled.CNcomment:ͨ�����ڴ�״̬��CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetChannelPID(HI_HANDLE hChannel, HI_U32 u32Pid);


/**
\brief Obtains the PID of a channel.CNcomment:��ȡͨ�����õ�PID��CNend
\attention \n
If no PID is set for a channel, the obtained value is 0x1FFF.\n
You can obtain the channel PID after a channel is created.
CNcomment:û������PIDǰ����ȡ����PIDΪ0x1fff\n
������ͨ������������ʱ�̻�ȡͨ��PID��CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\param[out] pu32Pid   Pointer to the PID of a channel (output).CNcomment:ָ�����ͣ����ͨ����PID��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetChannelPID(HI_HANDLE hChannel, HI_U32 *pu32Pid);


/**
\brief Enables a channel.CNcomment:��ͨ����CNend
\attention \n
If you call this API to enable a PID channel that has been enabled, no error occurs.\n
If you call this API to enable a Section channel that is not attached to a filter, the channel cannot receive data.\n
If you want to receive data without filter, you can create a filter and then set its filter depth to 0.
CNcomment:��PIDͨ����״̬�£����ñ��ӿڴ�ͨ�����ᷢ������\n
����sectionͨ������ͨ��û�а󶨹�����ʱ���ñ��ӿڣ�ͨ�����ܽ�������\n
�������ʹ��filter�������ݣ���������һ��filter�������������Ϊ0���������ݽ��ա�CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_OpenChannel(HI_HANDLE hChannel);


/**
\brief Disables a channel.CNcomment:�ر�ͨ����CNend
\attention \n
If you this API to disable a PID channel that has been disabled, no error occurs.CNcomment:��PIDͨ���ر�״̬�£����ñ��ӿڹر�ͨ�����ᷢ������CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CloseChannel(HI_HANDLE hChannel);


/**
\brief Obtains the status of a channel.CNcomment:��ȡͨ��״̬��CNend
\attention \n
You can call this API after a channel is created.CNcomment:������ͨ������������ʱ�̵��á�CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\param[out] pstStatus  Pointer to the status of a channel (output). For details, see the description of ::HI_UNF_DMX_CHAN_STATUS_S.CNcomment:ָ�����ͣ����ͨ��״̬����μ�::HI_UNF_DMX_CHAN_STATUS_S��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetChannelStatus(HI_HANDLE hChannel, HI_UNF_DMX_CHAN_STATUS_S *pstStatus);

/**
\brief Obtains the ts count of a channel.CNcomment:��ȡͨ��ts��������CNend
\attention \n
You can call this API after a channel is created.CNcomment:������ͨ������������ʱ�̵��á�CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\param[out] pu32TsCount	 Pointer to the count of a channel (output).CNcomment:ָ�����ͣ����ͨ��ts��������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
 */
HI_S32 HI_UNF_DMX_GetChannelTsCount(HI_HANDLE hChannel, HI_U32 *pu32TsCount);



/**
\brief Obtains the handle of the channel with a specific PID.CNcomment:��ȡ����ĳPID��ͨ�������CNend
\attention \n
You must specify the DEMUX ID when calling this API, because the channel PIDs of different DEMUXs can be the same.\n
You cannot query the PID that is equal to or greater than 0x1FFF; otherwise, the error code HI_ERR_DMX_INVALID_PARA is returned.\n
If no channel with a specific PID is found, an error code is returned.
CNcomment:��ͬDEMUX�豸��ͨ������������ͬ��PID�����ñ��ӿ���Ҫָ��DEMUX ID\n
��������ѯ0x1fff�����ϵķǷ�PIDֵ�����򷵻ز����Ƿ�������\n
���û�в�ѯ���κ�ͨ��������Ҫ��ѯ��PID�������ش����롣CNend
\param[in] u32DmxId    DEMUX ID. CNcomment: DEMUX�š�CNend
\param[in] u32Pid      Channel PID.CNcomment:ͨ��PID��CNend
\param[out] phChannel Pointer to channel handle.CNcomment: ָ�����ͣ����ͨ��Handle��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_UNMATCH_CHAN  No matched channel is found.CNcomment:û�в�ѯ��ƥ��ͨ����CNend
\retval ::HI_ERR_DMX_OCCUPIED_PID  The same pid was found on multiple channels.CNcomment:�ڶ��ͨ���Ϸ�������ͬ��PID��CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetChannelHandle(HI_U32 u32DmxId , HI_U32 u32Pid, HI_HANDLE *phChannel);


/**
\brief Obtains the number of available channels of a DEMUX.CNcomment:��ȡDEMUX�豸���õĿ���ͨ����������CNend
\attention \n
The returned number is the number of all remaining channels including the used audio/video channels.\n
Because channels are allocated in a unified manner, the parameter u32DmxId is invalid.
CNcomment:���ص�����Ϊ����ͨ��ʣ��������������ѱ�ʹ�õ�����Ƶͨ��\n
����ͨ����Դͳһ�������Բ���u32DmxId�Ѿ�û�����塣CNend
\param[in] u32DmxId	    DEMUX ID. CNcomment: DEMUX�š�CNend
\param[out] pu32FreeCount   Pointer to the number of available channels of a DEMUX.CNcomment:ָ�����ͣ����DEMUX����ͨ����Ŀ��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetFreeChannelCount (HI_U32 u32DmxId, HI_U32 *pu32FreeCount);


/**
\brief Obtains the scrambled flag of the channel data.CNcomment:��ȡͨ�����ݼ��ű�־��CNend
\attention \n
You can query the scrambled PES data and ES data.CNcomment:֧��PES�����ź�TS�����ŵĲ�ѯ��CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\param[out] penScrambleFlag   Pointer to the scrambled flag of the channel data (output). For details, see the description of ::HI_UNF_DMX_SCRAMBLED_FLAG_E.CNcomment:ָ�����ͣ����ͨ�����ݼ��ű�־����μ�::HI_UNF_DMX_SCRAMBLED_FLAG_E��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetScrambledFlag(HI_HANDLE hChannel, HI_UNF_DMX_SCRAMBLED_FLAG_E *penScrambleFlag);

/**
\brief Creates a data filter.CNcomment:����һ�����ݹ�������CNend
\attention \n
The maximum depth of a filter is 16 bytes.\n
For details on how to set the attributes of a filter, see the description of ::HI_UNF_DMX_FILTER_ATTR_S.\n
You can set a filter when creating it. If you do not want to filter data, you can set the filter depth to 0.\n
To modify the attributes of a filter, call HI_UNF_DMX_SetFilterAttr.\n
The attributes can be modified dynamically.\n
If a filter is used to filter the Section data, the valid byte is byte 1 and byte 4 to byte 18.\n
If a filter is used to filter the PES data, the valid byte is byte 4 and byte 7 to byte 21.\n
The filter can be used to filter the data of general-purpose channels only, including the Section channel, ECM/EMM channel, and PES channel.\n
If a filter is allocated successfully, phFilter returns the handle of the created filter.
CNcomment:������������Ϊ16\n
����������������ο�::HI_UNF_DMX_FILTER_ATTR_S\n
����������ʱ��ͬʱʵ�ֶԹ����������ã�������Ҫ���ݹ��ˣ����ù��������Ϊ0����\n
����Ҫ�޸Ĺ��������ԣ��ɵ���HI_UNF_DMX_SetFilterAttr���������޸�\n
֧�����ԵĶ�̬�޸�\n
���������ڹ���Section����ʱ����Ч�����ֽ�Ϊ��1�ֽڼ���4�ֽڡ���18�ֽ�\n
���������ڹ���PES����ʱ����Ч�����ֽ�Ϊ��4�ֽڼ���7�ֽڡ���21�ֽ�\n
������ֻ������ͨ��ͨ�������ݹ��ˣ�����sectionͨ����ECM/EMMͨ����PESͨ��\n
������ɹ���phFilter���ػ�ȡ�Ĺ�����Handle��CNend
\param[in] u32DmxId    DEMUX ID. CNcomment: DEMUX�š�CNend
\param[in] pstFilterAttr   Pointer to the attributes of a filter (input).CNcomment:ָ�����ͣ�������������ԡ�CNend
\param[out] phFilter   Pointer to the handle of the created filter (output).CNcomment:ָ�����ͣ��������Ĺ�����Handle��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_FILTER There is no available filter.CNcomment:û�п���filter��CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_CreateFilter(HI_U32 u32DmxId, const HI_UNF_DMX_FILTER_ATTR_S	*pstFilterAttr,
	    HI_HANDLE *phFilter);


/**
\brief Destroys an existing data filter.CNcomment:���ٴ��������ݹ�������CNend
\attention \n
If a filter is attached to a general-purpose channel, you can call this API to release the filter when the channel is enabled or disabled.\n
If no filter is attached to a Section channel, the channel cannot receive data. This restriction is not applicable to other channels.
CNcomment:����������ͨ��ͨ���󶨣�������ͨ���򿪻��߹ر�״̬�£����ñ��ӿ��ͷŹ�����\n
����sectionͨ����ͨ����û���κι�������ʱ�����ٽ������ݣ�����ͨ��û�д����ơ�CNend
\param[in] hFilter  Filter handle.CNcomment:�����������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DestroyFilter(HI_HANDLE hFilter);


/**
\brief Releases all the filters attached to a channel.CNcomment:�ͷŰ���ĳ��ͨ���ϵ����й�������CNend
\attention \n
You can call this API to release all filters attached to a channel when the channel is enabled or disabled.CNcomment:������ͨ���򿪻��߹ر�״̬�£����ñ��ӿ��ͷ�ͨ���ϰ󶨵����й�������CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is valid.CNcomment:��������Ƿ���CNend
\see \n
N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DeleteAllFilter(HI_HANDLE hChannel);


/**
\brief Sets the filter criteria of a filter.CNcomment:���ù������Ĺ���������CNend
\attention \n
The maximum filter depth u32FilterDepth is 16.\n
For details on how to set the attributes of a filter, see the description of ::HI_UNF_DMX_FILTER_ATTR_S.\n
If a filter is used to filter the Section data, the valid byte is byte 1 and byte 4 to byte 18.\n
If a filter is used to filter the PES data, the valid byte is byte 4 and byte 7 to byte 21.\n
The attributes can be modified dynamically.
CNcomment:���������������u32FilterDepth���Ϊ16\n
����������������ο�::HI_UNF_DMX_FILTER_ATTR_S\n
���������ڹ���Section����ʱ����Ч�����ֽ�Ϊ��1�ֽڼ���4�ֽڡ���18�ֽ�\n
���������ڹ���PES����ʱ����Ч�����ֽ�Ϊ��4�ֽڼ���7�ֽڡ���21�ֽ�\n
֧�����ԵĶ�̬�޸ġ�CNend
\param[in] hFilter   Filter handle.CNcomment:�����������CNend
\param[in] pstFilterAttr   Pointer to the attributes of a filter (input).CNcomment:ָ�����ͣ�������������ԡ�CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_ATTACHED_FILTER  The attributes cannot be set dynamically, because the filter is attached to a channel.CNcomment:����������ͨ���ϣ����ܶ�̬���á�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_SetFilterAttr(HI_HANDLE hFilter, const HI_UNF_DMX_FILTER_ATTR_S *pstFilterAttr);


/**
\brief Obtains the filter criteria of a filter.CNcomment:��ȡ�������Ĺ���������CNend
\attention \n
If you call the API before a filter is allocated, an error code is returned.
CNcomment:�ڹ�����δ����ʱ���øýӿڣ����ش���CNend
\param[in] hFilter   Filter handle.CNcomment:�����������CNend
\param[out] pstFilterAttr   Pointer to the attributes of a filter (output). For details, see the description of ::HI_UNF_DMX_FILTER_ATTR_S.CNcomment:ָ�����ͣ�������������ԡ���μ�::HI_UNF_DMX_FILTER_ATTR_S��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetFilterAttr(HI_HANDLE hFilter, HI_UNF_DMX_FILTER_ATTR_S *pstFilterAttr);


/**
\brief	Attaches filters to a specific channel.CNcomment:�󶨹�������ָ����ͨ����CNend
\attention \n
One or more filters can be attached to a general-purpose channel. All filters are ORed.\n
That is, if the data meets the filter criteria of a filter, the data is transmitted to the DMA buffer.\n
Filters cannot be attached to the audio/video channel and post channel.\n
If a filter is used, it cannot be attached to one or more channels repeatedly.\n
If a filter and a channel do not belong to the same DEMUX, the filter cannot be detached from the channel.\n
A filter can be attached to a general-purpose channel when the channel is enabled or disabled.
CNcomment:һ��ͨ��ͨ�����԰�һ�����߶�����ݹ����������й�����֮��Ĺ��˹�ϵ�ǻ�\n
��ֻҪ���������κ�һ���������Ĺ�����������ǰ���˵����ݶ���ͨ�����˶�������DMA������\n
��֧������Ƶͨ����POSTͨ���Ĺ�������\n
���ܽ�һ���������ظ��󶨵�һ������ͨ����\n
��������ͨ��������ͬһ·DEMUXʱ�����ܽ��а󶨲���\n
֧��ͨ��ͨ���򿪻��߹ر�״̬�µĹ������󶨡�CNend
\param[in] hFilter  Filter handle.CNcomment:�����������CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_ATTACHED_FILTER  The filter is attached.CNcomment:�������Ѿ����ڰ�״̬��CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT   No filter can be attached to the channel.CNcomment:������ͨ����֧�ְ󶨹�������CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_AttachFilter(HI_HANDLE hFilter, HI_HANDLE hChannel);



/**
\brief Detaches a filter from a specific channel.CNcomment:����������ָ��ͨ���Ͻ�󶨡�CNend
\attention \n
If no filter is attached to a channel, the error code HI_FAILURE is returned when you call this API.\n
If a filter and a channel do not belong to the same DEMUX, an error code is returned.\n
A filter can be detached from a general-purpose channel when the channel is enabled or disabled.
CNcomment:ͨ����û�а󶨹��������н�󶨷���ʧ��\n
��������ͨ��������ͬһ·DEMUXά��ʱ�����ش���\n
֧��ͨ��ͨ���򿪻��߹ر�״̬�µĹ�������󶨡�CNend
\param[in] hFilter   Filter handle.CNcomment:�����������CNend
\param[in] hChannel  Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NOATTACH_FILTER  No filter is attached to any channel.CNcomment:filterû�а����κ�ͨ���ϡ�CNend
\retval ::HI_ERR_DMX_UNMATCH_FILTER  No filter is attached to the channel.CNcomment:filterû�а��ڴ�ͨ���ϡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_DetachFilter(HI_HANDLE hFilter, HI_HANDLE hChannel);


/**
\brief Obtains the handle of the channel to which a filter is attached.CNcomment:��ȡ���������󶨵�ͨ�������CNend
\attention \n
Each filter corresponds to a channel. If a filter is not attached to a channel, the error code HI_ERR_DMX_NOATTACH_FILTER is returned.CNcomment:ÿ��������Ψһ��Ӧһ��ͨ������������û�а��κε�ͨ���ϣ��򷵻�HI_ERR_DMX_NOATTACH_FILTER�����롣CNend
\param[in] hFilter    Filter handle.CNcomment:�����������CNend
\param[out] phChannel	Pointer to the handle of the channel to which a filter is attached (output).CNcomment:ָ�����ͣ�����������󶨵�ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOATTACH_FILTER  No filter is attached to any channel.CNcomment:filterû�а����κ�ͨ���ϡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetFilterChannelHandle(HI_HANDLE hFilter, HI_HANDLE *phChannel);


/**
\brief Obtains the number of available filters of a DEMUX.CNcomment:��ȡDEMUX�豸���õĿ��й�����������CNend
\attention \n
The number of unallocated filters is returned. The filters that are allocated but not attached to channels are excluded.
CNcomment:���ص�ǰδ����Ĺ�������Ŀ���ѷ��䵫δ�󶨵�ͨ���ϵĹ�������ͳ�ơ�CNend
\param[in] u32DmxId   DEMUX ID. CNcomment: DEMUX�š�CNend
\param[out]  pu32FreeCount  Pointer to the number of allocated filters (output).CNcomment:ָ�����ͣ������ǰδ����Ĺ�������Ŀ��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_GetFreeFilterCount(HI_U32 u32DmxId ,	HI_U32 * pu32FreeCount);


/**
\brief Obtains the handles of all channels that receive new data.CNcomment:��ȡ�������ݵ��������ͨ���ľ����CNend
\attention \n
When you call this API, the parameter pu32ChNum serves as the input parameter and is used to specify the data length pointed by phChannel. pu32ChNum indicates the number of channels to be queried.\n
The number of channels must be initialized, and the initial value cannot be 0.\n
It is recommended to set the number of channels to the total number. For details about the total number of channels.\n
After you call this API successfully, the parameter pu32ChNum serves as the output parameter and is used to specify the valid data length pointed by phChannel.\n
The block time is configurable (in ms). If u32TimeOutMs is set to 0, it indicates that the block time is 0; if u32TimeOutMs is set to 0xFFFFFFFF, it indicates infinite wait.\n
If no data is received when the block time is exceeded, the error code HI_ERR_DMX_TIMEOUT is returned.\n
If the wait time is 0, and no data is received in any channel, ::HI_ERR_DMX_NOAVAILABLE_DATA is returned.
CNcomment:���øýӿ�ʱ��pu32ChNum��Ϊ�������������ָ��phChannelָ������ĳ��ȣ���ʾҪ��ѯ��ͨ��������\n
ͨ�����������ʼ�����ҳ�ʼֵ����Ϊ��0ֵ\n
���齫ͨ����������Ϊͨ�����ܸ���\n
���ýӿڵ��óɹ�ʱ��pu32ChNum��Ϊ���������ָ��phChannelָ���������Ч����\n
����ʱ��������ã�ʱ�䵥λΪ���룬����Ϊ0���ȴ�������Ϊ0xffffffffһֱ�ȴ���\n
����������ʱ�䣬����ͨ����û�����ݵ���򷵻صȴ���ʱ����\n
����ȴ�ʱ��Ϊ0������û���κ�ͨ���������򷵻�::HI_ERR_DMX_NOAVAILABLE_DATA��CNend
\param[out] phChannel	   Pointer to the number of channels. The number of channels depends on the value of pu32ChNum.CNcomment:ָ�����ͣ�ָ��ͨ��������顣���鳤����pu32ChNum������CNend
\param[in] pu32ChNum	Pointer type
			   Input: indicates the number of channel handles to which pChannelHandle points.
			   Output: indicates the number of lower-layer channels that receive new data. The maximum value cannot be greater than the input value.
			   CNcomment: ָ�����͡�ע��:�ò���ͬʱ��Ϊ����������CNend
			   CNcomment: ���룺pChannelHandleָ������ĳ��ȡ�CNend
			   CNcomment: ������ײ���������ͨ������Ŀ����಻�����������ֵ��CNend
\param[in] u32TimeOutMs	     Wait timeout, in ms.CNcomment:�ȴ���ʱʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA  No data is received in any channel.CNcomment:û���κ�ͨ�������ݵ��CNend
\retval ::HI_ERR_DMX_TIMEOUT  The wait times out.CNcomment:�ȴ���ʱ��CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_GetDataHandle(HI_HANDLE *phChannel, HI_U32 *pu32ChNum,
	    HI_U32 u32TimeOutMs);

/**
\brief Obtains whether data is received in some channels.CNcomment:��ѯ����ͨ���Ƿ������ݵ��CNend
\attention \n
This API is a supplementary interface of ::HI_UNF_DMX_GetDataHandle. You can call this API when you only want to check whether data is received in some channels.
The handles of the channels to be queried are specified by phWatchChannel, and the number of channels to be queried is specified by u32WatchNum.\n
If phWatchChannel is NULL, all channels are queried. The value of u32WatchNum cannot be 0.\n
The block time is configurable (in ms). If u32TimeOutMs is set to 0, it indicates that the block time is 0; if u32TimeOutMs is set to 0xFFFFFFFF, it indicates infinite wait.\n
If no data is received when the block time is exceeded, the error code HI_ERR_DMX_TIMEOUT is returned.\n
If the wait time is 0, and no data is received in any channel, ::HI_ERR_DMX_NOAVAILABLE_DATA is returned.
CNcomment:������Ϊ::HI_UNF_DMX_GetDataHandle�Ĳ��䣬��Ӧ����ֻ��ע����ͨ�������ݵ������ʱʹ�ô˽ӿ�\n
������ͨ���ľ����phWatchChannelָ����������u32WatchNumָ��\n
phWatchChannelΪNULL,��ѯ����ͨ�������ݵ��������u32WatchNum����Ϊ��0ֵ\n
����ʱ��������ã�ʱ�䵥λΪ���룬����Ϊ0���ȴ�������Ϊ0xffffffffһֱ�ȴ���\n
����������ʱ�䣬����ͨ����û�����ݵ���򷵻صȴ���ʱ����\n
����ȴ�ʱ��Ϊ0������û���κ�ͨ���������򷵻�::HI_ERR_DMX_NOAVAILABLE_DATA��CNend
\param[in] phWatchChannel   Pointer to the number of handles of the channels to be queried. The number depends on the value of u32WatchNum.CNcomment:ָ�����ͣ�ָ�򱻼���ͨ���ľ�����顣���鳤����u32WatchNum������CNend
\param[in] u32WatchNum	    Number of channels to be queried.CNcomment:����ͨ���ĸ�����CNend
\param[in] phDataChannel    Pointer to the number of handles of the channels that contain data The number depends on the value of pu32ChNum.CNcomment:ָ�����ͣ�ָ��������ݵ�ͨ���ľ�����顣���鳤����pu32ChNum������CNend
\param[out] pu32ChNum	    Pointer to the number of lower-layer channels that receive new data. The maximum value cannot be greater than the input value.CNcomment:ָ�����͡��ײ���������ͨ������Ŀ����಻���������ӵ�ͨ������ֵ��CNend
\param[in] u32TimeOutMs	    Wait timeout, in ms.CNcomment:�ȴ���ʱʱ�䣬��λms��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR	The pointer is null.CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA	No data is received in any channel.CNcomment:û���κ�ͨ�������ݵ��CNend
\retval ::HI_ERR_DMX_TIMEOUT   The wait times out.CNcomment:�ȴ���ʱ��CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_SelectDataHandle(HI_HANDLE *phWatchChannel, HI_U32 u32WatchNum,
	    HI_HANDLE *phDataChannel, HI_U32 *pu32ChNum, HI_U32 u32TimeOutMs);

/**
\brief Obtains the received data packets from a specific channel.CNcomment:��ָ��ͨ���л�ȡ��������ݰ���CNend
\attention \n
Before calling this API, you need to set the value of u32AcquireNum to specify the maximum number of buffers that can be queried. The number of buffers depends on the value of u32AcquireNum.\n
The value of pu32AcquiredNum is not greater than that of u32AcquireNum.\n
For the Section channel, ECM channel, or EMM channel, each data packet contains a complete Section.\n
For the PES channel, each data packet may contain a complete PES. If the PES is too large, it is divided into multiple PES packets to transfer.\n
The enDataType field determines whether a transferred data packet is complete.\n
For the post channel, each data packet may contain one or more complete TS packets. Each TS packet consists of 188 bytes.\n
For the audio/video channel, data cannot be obtained by calling this API. The audio data and video data are transferred to the decoder through internal interfaces.
You cannot call this API repeatedly, but you can call this API once and release buffers for several times. Note that you must release buffers in sequence, and the address and size of the buffer to be released must be consistent with those obtained by calling HI_UNF_DMX_AcquireBuf.
In addition, you can call HI_UNF_DMX_AcquireBuf again only after all data packets are released. Otherwise, the error code HI_ERR_DMX_REACQUIRE_BUF is returned.
CNcomment:�ڵ��ñ��ӿ�֮ǰ����u32AcquireNum��ֵ��ָ��������ѯ�Ļ�������Ϣ�����Ŀ����Ϣ����������ĳ�����u32AcquireNum����\n
ʵ�ʻ�ȡ�Ļ�������Ϣ��Ŀpu32AcquiredNum��ֵ���ᳬ��u32AcquireNum\n
����sectionͨ����ECM/EMMͨ����ÿ�����ݰ�����һ��������section\n
����PESͨ����ÿ�����ݰ���������������pes���������pes̫�󣬿���Ҫ�ֶ��pes�������\n
����������Ƿ�����ͨ�����ݰ��ṹ��enDataType�ֶ�ָ��\n
����POST���͵�ͨ����ÿ�����ݰ�����һ������������TS����TS����188�ֽ�\n
��������Ƶͨ���ǲ���ͨ���˽ӿڻ�ȡ���ݵģ�����Ƶ���ݻ�ͨ���ڲ��ӿ�ֱ���͸����������н���\n
�������ظ����ô˽ӿڣ�����һ���������ͷţ������ͷű��밴˳�򣬶����ͷŵĵ�ַ�ͳ��ȱ���������һ��\n
����ֻ���ͷ������е����ݰ������ٴ����󣬷��򷵻��ظ���������롣CNend
\param[in] hChannel	       Channel handle.CNcomment:ͨ�������CNend
\param[in] u32AcquireNum       Maximum number of obtained data packets.CNcomment:��������ݰ�����������CNend
\param[out] pu32AcquiredNum    Pointer to the actual number of obtained data packets.CNcomment:ָ�����ͣ����ʵ�����󵽵����ݰ�������CNend
\param[out] pstBuf	       Pointer to the number of data packets. The number depends on the value of pu32AcquiredNum.CNcomment:ָ�����ͣ�ָ�����ݰ���Ϣ���飬���������pu32AcquiredNum������CNend
\param[in] u32TimeOutMs	       Wait timeout, in ms.CNcomment:�ȴ���ʱʱ�䣬��λΪms��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA  There is no valid data in the channel.CNcomment:ͨ����û����Ч���ݡ�CNend
\retval ::HI_ERR_DMX_TIMEOUT  The wait times out.CNcomment:�ȴ���ʱ��CNend
\retval ::HI_ERR_DMX_REACQUIRE_BUF  The data packet has been obtained.CNcomment:�ظ��������ݰ���CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AcquireBuf(HI_HANDLE hChannel, HI_U32 u32AcquireNum,
	    HI_U32 * pu32AcquiredNum, HI_UNF_DMX_DATA_S *pstBuf,
	    HI_U32 u32TimeOutMs);


/**
\brief Releases the buffers for storing data packets after data packets are processed.CNcomment:���������ݰ������ݺ��ͷ����ݰ�ռ�õĻ���ռ䡣CNend
\attention \n
If you release buffers by calling this API, the buffers must be those obtained by calling ::HI_UNF_DMX_AcquireBuf, and the addresses and sizes of these buffers cannot be changed.\n
The number of released buffers can be less than the number of obtained buffers.
CNcomment:���ӿ��ͷŵĻ�����һ����ͨ��::HI_UNF_DMX_AcquireBuf��ȡ�Ļ��������������ĵ�ַ�ͳ��Ȳ��ܸ���\n
�ͷŵĻ�������������С�ڻ�ȡ�Ļ�����������CNend
\param[in] hChannel	   Channel handl.CNcomment:ͨ�������CNend
\param[in] u32ReleaseNum   Number of released buffers.CNcomment:�ͷ����ݰ�������CNend
\param[in] pstBuf	   Pointer to the number of released buffers. The number depends on the value of u32ReleaseNum.CNcomment:ָ�����ͣ�ָ���ͷŻ�������Ϣ���飬������u32ReleaseNum������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_ReleaseBuf(HI_HANDLE hChannel, HI_U32 u32ReleaseNum,
	    HI_UNF_DMX_DATA_S *pstBuf);

/**
\brief Obtains the received es data packets from a specific channel.CNcomment:��ָ��ͨ���л�ȡ�����es���ݰ���CNend
\attention \n
You can call this API to obtain video or audio es data.\n
It's allowed to call repeatedly and then release in the same order.
CNcomment:����Ƶͨ��ͨ���˽ӿڻ�ȡes����.\n
�����ظ����ô˽ӿڻ�ȡ��Ч���ݣ�Ȼ����ͬ˳���ͷš�CNend
\param[in] hChannel	       Channel handle.CNcomment:ͨ�������CNend
\param[out] pEsBuf	       Pointer to the es data packets.CNcomment:ָ�����ͣ�ָ��es���ݰ���CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA  There is no valid data in the channel��CNcomment:ͨ����û����Ч���ݡ�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_AcquireEs(HI_HANDLE hChannel, HI_UNF_ES_BUF_S *pEsBuf);

/**
\brief Releases the es buffers after processed.CNcomment:������es���ݰ������ݺ��ͷ����ݰ�����buffer��CNend
\attention \n
If you release buffers by calling this API, the buffers must be those obtained by calling ::HI_UNF_DMX_AcquireEs, and the addresses and sizes of these buffers cannot be changed.
CNcomment:���ӿ��ͷŵĻ�����һ����ͨ��::HI_UNF_DMX_AcquireEs��ȡ�Ļ��������������ĵ�ַ�ͳ��Ȳ��ܸ���.CNend
\param[in] hChannel	   Channel handl.CNcomment:ͨ�������CNend
\param[in] pEsBuf	   Pointer to the es data packets.CNcomment:ָ�����ͣ�ָ��es���ݰ���CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_ReleaseEs(HI_HANDLE hChannel, const HI_UNF_ES_BUF_S *pEsBuf);

/**
\brief Creates a record channel. CNcomment: ����һ��¼��ͨ����CNend
\attention \n
A demux can be set only one recording channe.
CNcomment: һ��DEMUX��ֻ�ܴ���һ��¼��ͨ����CNend
\param[in]  pstRecAttr	record attribute.   CNcomment: ¼�����ԡ�CNend
\param[out] phRecChn	record handle.	    CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment: �ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment: APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment: ��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment: ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOFREE_CHAN  There is no available channel. CNcomment: û�п��е�ͨ����CNend
\retval ::HI_ERR_DMX_ALLOC_MEM_FAILED  memory allocate failure. CNcomment: �ڴ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_MMAP_FAILED  memory map failed. CNcomment: �ڴ�ӳ��ʧ�ܡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_CreateRecChn(HI_UNF_DMX_REC_ATTR_S *pstRecAttr, HI_HANDLE *phRecChn);

/**
\brief Destroys an existing record channel. CNcomment: ���ٴ�����¼��ͨ����CNend
\attention \n
 N/A. CNcomment: �ޡ�CNend
\param[in] hRecChn  record handle. CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment: �ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment: APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment: ��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment: ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_DestroyRecChn(HI_HANDLE hRecChn);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_SELECT_PID, it would increase the recorded PID that we need. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_SELECT_PIDʱ������Ҫ¼�Ƶ�PID��CNend
\attention \n
 N/A. CNcomment: �ޡ�CNend
\param[in]  hRecChn	record handle.	CNcomment: ¼�ƾ����CNend
\param[in]  u32Pid	pid value.	CNcomment: PIDֵ��CNend
\param[out] phChannel	channel handle. CNcomment: ͨ�������CNend
\retval ::HI_SUCCESS  Success. CNcomment: �ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment: APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment: ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment: ��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment: ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AddRecPid(HI_HANDLE hRecChn, HI_U32 u32Pid, HI_HANDLE *phChannel);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_SELECT_PID, it would delete increase PID. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_SELECT_PIDʱɾ�������ӵ�PID��CNend
\attention \n
 N/A. CNcomment: �ޡ�CNend
\param[in]  hRecChn	record handle.	CNcomment: ¼�ƾ����CNend
\param[in]  hChannel	channel handle. CNcomment: ͨ�������CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_DelRecPid(HI_HANDLE hRecChn, HI_HANDLE hChannel);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_SELECT_PID, it would delete all increase PID. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_SELECT_PIDʱɾ�����������ӵ�PID��CNend
\attention \n
 N/A. CNcomment: �ޡ�CNend
\param[in] hRecChn  record handle. CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_DelAllRecPid(HI_HANDLE hRecChn);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_ALL_PID, it would remove the specified PID. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_ALL_PIDʱ�ų�ָ����PID��CNend
\attention \n
chips do not support the function.
CNcomment: оƬ��֧�ִ˹���ʱ���ز�֧�֡�CNend
\param[in]  hRecChn record handle.  CNcomment: ¼�ƾ����CNend
\param[in]  u32Pid  pid value.	    CNcomment: PIDֵ��CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AddExcludeRecPid(HI_HANDLE hRecChn, HI_U32 u32Pid);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_ALL_PID, it would cancel the PID that have been removed. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_ALL_PIDʱȡ�����ų���PID��CNend
\attention \n
chips do not support the function.
CNcomment: оƬ��֧�ִ˹���ʱ���ز�֧�֡�CNend
\param[in]  hRecChn record handle.  CNcomment: ¼�ƾ����CNend
\param[in]  u32Pid  pid value.	    CNcomment: PIDֵ��CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_DelExcludeRecPid(HI_HANDLE hRecChn, HI_U32 u32Pid);

/**
\brief if the type of record were the HI_UNF_DMX_REC_TYPE_ALL_PID, it would cancel all the PID that have been removed. CNcomment: ¼������ΪHI_UNF_DMX_REC_TYPE_ALL_PIDʱȡ���������ų���PID��CNend
\attention \n
chips do not support the function.
CNcomment: оƬ��֧�ִ˹���ʱ���ز�֧�֡�CNend
\param[in] hRecChn  record handle. CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_DelAllExcludeRecPid(HI_HANDLE hRecChn);

/**
\brief Starts a recording channel. CNcomment: ����¼��ͨ����CNend
\attention \n
when the recording channel has been activated, it should use the interface to come back success.
CNcomment: ��¼��ͨ����������״̬�µ��ñ��ӿڷ��سɹ���CNend
\param[in] hRecChn  record handle. CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_StartRecChn(HI_HANDLE hRecChn);

/**
\brief Stops a recording channel. CNcomment: ֹͣ¼��ͨ����CNend
\attention \n
when the recording channel has been stopped, it should use the interface to come back success.
CNcomment: ��¼��ͨ����ֹͣ��״̬�µ��ñ��ӿڷ��سɹ���CNend
\param[in] hRecChn  record handle. CNcomment: ¼�ƾ����CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_StopRecChn(HI_HANDLE hRecChn);

/**
\brief Obtains record data. CNcomment: ��ȡ¼�����ݡ�CNend
\attention \n
The obtained data must use the ::HI_UNF_DMX_ReleaseRecData function to release.
CNcomment: ���ñ��ӿڻ�ȡ�������ݱ���ʹ��::HI_UNF_DMX_ReleaseRecData�ӿڽ����ͷš�CNend
\param[in]  hRecChn	    record handle.	    CNcomment: ¼�ƾ����CNend
\param[out] pstRecData	    record data.	    CNcomment: ¼�����ݡ�CNend
\param[in]  u32TimeOutMs    Wait timeout, in ms.    CNcomment: �ȴ���ʱʱ�䣬��λΪ���롣CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AcquireRecData(HI_HANDLE hRecChn, HI_UNF_DMX_REC_DATA_S *pstRecData, HI_U32 u32TimeoutMs);

/**
\brief Releases record data. CNcomment: �ͷŻ�ȡ����¼�����ݡ�CNend
\attention \n
 N/A. CNcomment:�ޡ�CNend
\param[in] hRecChn	record handle.	CNcomment: ¼�ƾ����CNend
\param[in] pstRecData	record data.	CNcomment: ¼�����ݡ�CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_ReleaseRecData(HI_HANDLE hRecChn, const HI_UNF_DMX_REC_DATA_S *pstRecData);

/**
\brief Obtains index data. CNcomment: ��ȡ�������ݡ�CNend
\attention \n
when indexing video or audio, it would use the interface to gain indexing data, or it will not support if you return.
CNcomment: ��Ƶ����Ƶ����ʱ���ܻ�ȡ�������ݣ����򷵻ز�֧�֡�CNend
\param[in]  hRecChn	    record handle.	    CNcomment: ¼�ƾ����CNend
\param[out] pstRecIndex	    index data.		    CNcomment: �������ݡ�CNend
\param[in]  u32TimeOutMs    Wait timeout, in ms.    CNcomment: �ȴ���ʱʱ�䣬��λΪ���롣CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_START_REC_CHAN	 CNcomment: ¼��ͨ��δ������CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA  no data. CNcomment: �����ݡ�CNend
\retval ::HI_ERR_DMX_TIMEOUT  The wait times out. CNcomment:�ȴ���ʱ��CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AcquireRecIndex(HI_HANDLE hRecChn, HI_UNF_DMX_REC_INDEX_S *pstRecIndex, HI_U32 u32TimeoutMs);

/**
\brief Obtains index and rec data with synchronous. CNcomment: ͬ����ȡ������¼������ ��CNend
\attention \n
1. when indexing video or audio, it would use the interface to gain indexing data and record TS data with synchronous, \n
2. when recording all ts without index, .it would use the interface to gain only record TS data, as there is no index. \n
3. Length of each block of record data is Alligned with 188 and 16 if it is not 0.
CNcomment:
1. ��Ƶ����Ƶ����ʱ�����Ի�ȡ�������ݺ���֮��Ӧ��¼��TS����\n
2.�����allts ¼�ƣ���ֻ���Ի�ȡ¼�Ƶ�TS���ݣ���ʱ����������\n
3. ��ȡ������ÿһ�����ݿ�ĳ��������Ϊ0������188 �� 16 ����ġ�CNend
\param[in]  hRecChn	    record handle.	    CNcomment: ¼�ƾ����CNend
\param[out] pstRecDataIdx     index and record data.		 CNcomment: �������ݺ�¼��TS���ݡ�CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_DMX_NOT_START_REC_CHAN	 CNcomment: ¼��ͨ��δ������CNend
\retval ::HI_ERR_DMX_NOT_SUPPORT  This function is not supported. CNcomment: ��֧�ִ˹��ܡ�CNend
\retval ::HI_ERR_DMX_NOAVAILABLE_DATA  no data. CNcomment: �����ݡ�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_AcquireRecDataAndIndex(HI_HANDLE hRecChn, HI_UNF_DMX_REC_DATA_INDEX_S* pstRecDataIdx);

/**
\brief Releases record data. CNcomment: �ͷŻ�ȡ�����������ݺ�¼�����ݡ�CNend
\attention \n
 N/A. CNcomment:�ޡ�CNend
\param[in] hRecChn	record handle.	CNcomment: ¼�ƾ����CNend
\param[in] pstRecDataIdx   record data and index.    CNcomment: ¼�����ݺ��������ݡ�CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\retval ::HI_ERR_MDX_REC_BUFNOTMATCH  The param is not mattched . CNcomment:������ƥ�䣬�����ͷŵĵ�ַ���߳��ȷǷ���CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_ReleaseRecDataAndIndex(HI_HANDLE hRecChn, HI_UNF_DMX_REC_DATA_INDEX_S* pstRecDataIdx);
/**
\brief Obtains the status of a record buffer. CNcomment: ��ȡ¼�ƻ����״̬��CNend
\attention \n
 N/A. CNcomment:�ޡ�CNend
\param[in]  hRecChn	    record handle.	    CNcomment: ¼�ƾ����CNend
\param[out] pstBufStatus    record buffer status.   CNcomment: ¼�ƻ����״̬��CNend
\retval ::HI_SUCCESS  Success. CNcomment:�ɹ���CNend
\retval ::HI_FAILURE  Calling this API fails. CNcomment:APIϵͳ����ʧ�ܡ�CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized. CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
*/
HI_S32	HI_UNF_DMX_GetRecBufferStatus(HI_HANDLE hRecChn, HI_UNF_DMX_RECBUF_STATUS_S *pstBufStatus);

/**
\brief register channel callback .CNcomment:ע��ͨ���ص���CNend
\attention \n
 N/A. CNcomment:�ޡ�CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ��Handle��CNend
\param[out] pstCbDesc  Pointer to the descriptor of a specified cb. For details, see the description of HI_UNF_DMX_CB_DESC_S.CNcomment:ָ�����ͣ����ָ��ͨ�� �ص�������Ϣ����μ�::HI_UNF_DMX_CB_DESC_S��CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid.CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_RegisterCallback(HI_HANDLE hChannel, HI_UNF_DMX_CB_DESC_S *pstCbDesc);

/**
\brief unregister channel callback.CNcomment:ע��ͨ���ص���CNend
\attention \n
 N/A. CNcomment:�ޡ�CNend
\param[in] hChannel   Channel handle.CNcomment:ͨ�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ���CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ����CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ���CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ�ա�CNend
\see \n
 N/A.CNcomment:�ޡ�CNend
*/
HI_S32 HI_UNF_DMX_UnRegisterCallback(HI_HANDLE hChannel);

/**
\brief Set or get the extra attributes of a demux through the commands.CNcomment:ͨ���������û��ȡDMX��������CNend
\attention \n
Diffrent CMD use diffrent param, for details see the description of HI_UNF_DMX_INVOKE_TYPE_E.\n
CNcomment:��ͬ������ʹ�õĲ�����ͬ��������Ϣ��ο�����ö�ٵĶ���HI_UNF_DMX_INVOKE_TYPE_E\n CNend
\param[in] enCmd   Command type.CNcomment:�������͡�CNend
\param[in] pCmdPara    Pointer to command param.  CNcomment:�������CNend
\retval ::HI_SUCCESS Success.CNcomment:�ɹ�CNend
\retval ::HI_FAILURE  Calling this API fails.CNcomment:APIϵͳ����ʧ��CNend
\retval ::HI_ERR_DMX_NOT_INIT  The DEMUX module is not initialized.CNcomment:ģ��û�г�ʼ��CNend
\retval ::HI_ERR_DMX_INVALID_PARA  The input parameter is invalid. CNcomment:��������Ƿ�CNend
\retval ::HI_ERR_DMX_NULL_PTR  The pointer is null. CNcomment:ָ�����Ϊ��CNend
\see \n
 N/A. CNcomment:�ޡ�CNend
 */
HI_S32 HI_UNF_DMX_Invoke(HI_UNF_DMX_INVOKE_TYPE_E enCmd, const HI_VOID *pCmdPara);


/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif	/* __HI_UNF_DEMUX_H__ */
