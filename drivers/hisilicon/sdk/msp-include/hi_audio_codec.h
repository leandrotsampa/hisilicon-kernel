/******************************************************************************
Copyright (C), 2004-2014, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hi_audio_codec.h
Version	      : Initial Draft
Author	      : Hisilicon multimedia software group
Created	      : 2009/11/01
Last Modified :
Description   : define audio common data structure
  History	:
  1.Date	: 2009/11/10
    Author	: zgjie
    Modification: Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about the audio codec. CNcomment:�ṩAUDIO_CODEC�������Ϣ CNend
 */

#ifndef __HI_AUDIO_CODEC_H__
#define __HI_AUDIO_CODEC_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/**Define HA codec Print Level*/
/**CNcomment:����HA codec��ӡ����*/
#define HA_TRACE_LEVEL_FATAL	(0)
#define HA_TRACE_LEVEL_ERROR	(1)
#define HA_TRACE_LEVEL_WARN	(2)
#define HA_TRACE_LEVEL_INFO	(3)
#define HA_TRACE_LEVEL_DBG	(4)


#ifndef CFG_HA_LOG_LEVEL
#define CFG_HA_LOG_LEVEL	 (HA_TRACE_LEVEL_ERROR)
#endif

#if (CFG_HA_LOG_LEVEL == HA_TRACE_LEVEL_FATAL)
#define HA_FATAL_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_ERR_PRINT(fmt...)
#define HA_WARN_PRINT(fmt...)
#define HA_INFO_PRIN(fmt...)
#define HA_DBG_PRINT(fmt...)

#elif (CFG_HA_LOG_LEVEL == HA_TRACE_LEVEL_ERROR)
#define HA_FATAL_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_ERR_PRINT(fmt...)   do{printf(fmt);}while(0)
#define HA_WARN_PRIN(fmt...)
#define HA_INFO_PRIN(fmt...)
#define HA_DBG_PRINT(fmt...)

#elif(CFG_HA_LOG_LEVEL == HA_TRACE_LEVEL_WARN)
#define HA_FATAL_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_ERR_PRINT(fmt...)   do{printf(fmt);}while(0)
#define HA_WARN_PRINT(fmt...)	do{printf(fmt);}while(0)
#define HA_INFO_PRINT(fmt...)
#define HA_DBG_PRINT(fmt...)

#elif(CFG_HA_LOG_LEVEL == HA_TRACE_LEVEL_INFO)
#define HA_FATAL_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_ERR_PRINT(fmt...)   do{printf(fmt);}while(0)
#define HA_WARN_PRINT(fmt...)	do{printf(fmt);}while(0)
#define HA_INFO_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_DBG_PRINT(fmt...)

#elif(CFG_HA_LOG_LEVEL == HA_TRACE_LEVEL_DBG)

#define HA_FATAL_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_ERR_PRINT(fmt...)   do{printf(fmt);}while(0)
#define HA_WARN_PRINT(fmt...)	do{printf(fmt);}while(0)
#define HA_INFO_PRINT(fmt...)	 do{printf(fmt);}while(0)
#define HA_DBG_PRINT(fmt...)	 do{printf(fmt);}while(0)

#endif

/**Define software dual decode*/
/**CNcomment:��������˫·����*/
#define HA_SW_DUALDEC_SUPPORT

/**Define HA codec ID*/
/**CNcomment:����HA codec ID*/
/*
*		 HA CODEC_ID defination
*   |	   7bit		       9bit		   3bit			  13bit	 |
*   |---vendor---|---format---|---reserved---|---id---|
*/
#define VENDOR_HISI 0x040
#define VENDOR_NONE 0x010
#define HA_VENDOR_OFFSETK  25 /* (32-7) */
#define HA_VENDOR_MASK	   (0x007fUL << HA_VENDOR_OFFSETK)
#define HA_FORMAT_OFFSETK  16 /* (32-7-9) */
#define HA_FORMAT_MASK	   (0x01ffUL << HA_FORMAT_OFFSETK)
#define HA_RESERVED_OFFSET 13 /* (32-7-9-3) */
#define HA_RESERVED_MASK   (0x007UL << HA_RESERVED_OFFSET)
#define HA_ID_OFFSET	   0 /* (32-7-9-3-13) */
#define HA_ID_MASK	   (0x1fffUL<< HA_ID_OFFSET)

#define HA_BUILD_CODEC_ID(vendor, format, id) (((((HI_U32)vendor) << HA_VENDOR_OFFSETK) & HA_VENDOR_MASK) | ((((HI_U32)format) << HA_FORMAT_OFFSETK) & HA_FORMAT_MASK) | (((HI_U32)id) & HA_ID_MASK))
#define HA_GET_VENDOR(codec) ((HI_U32)(codec&HA_VENDOR_MASK)>>HA_VENDOR_OFFSETK)
#define HA_GET_FORMAT(codec) ((HI_U32)(codec&HA_FORMAT_MASK)>>HA_FORMAT_OFFSETK)
#define HA_GET_ID(codec)     ((HI_U32)(codec&HA_ID_MASK)>>HA_ID_OFFSET)

/********************************Macro Definition********************************/
/** \addtogroup	     ACODEC */
/** @{ */  /** <!-- ��ACODEC�� */

/**Define HA codec common command ID*/
/**CNcomment:����HA codec ����CMD ID*/
#define HA_COMMON_CMD_ID   0xffff

/**Define HA codec format query command ID*/
/**CNcomment:����HA codec ��ʽ��ѯCMD ID*/
#define HA_CODEC_FORMAT_QUERY_CMD	  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1000)

/**Define HA codec decoder open parameter command ID*/
/**CNcomment:����HA codec �������򿪲���CMD ID*/
#define HA_CODEC_GET_DECOPENPARAM_CMD	  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1001)

/**Define HA codec encoder open parameter command ID*/
/**CNcomment:����HA codec �������򿪲���CMD ID*/
#define HA_CODEC_GET_ENCOPENPARAM_CMD	  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1002)

/**Define HA codec packet query command ID*/
/**CNcomment:����HA codec packet����ģʽCMD ID*/
#define HA_CODEC_PACKETDECODER_QUERY_CMD  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1003)

/**Define HA codec hwdecode query command ID*/
/**CNcomment:����HA codec hwdecode����ģʽCMD ID*/
#define HA_CODEC_HARDWARECODEC_QUERY_CMD  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1004)

/**Define HA codec set outbuf addr command ID  only for hardware codec*/
/**CNcomment:�������Buffer��ַ����CMD ID*/
#define HA_CODEC_OUTBUFADDR_SET_CMD  ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1005)

/**Define dual decode capability support query command ID*/
/**CNcomment:����˫·����������ѯCMD ID*/
#define HA_CODEC_DUAL_DECODE_QUERY_CMD	((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1006)

/**Define dual decode set ad output mode command ID*/
/**CNcomment:����˫·����AD���ģʽ����CMD ID*/
#define HA_CODEC_AD_OUTPUTMODE_SET_CMD	((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1007)

/**Define AD Balance Setting command ID*/
/**CNcomment:����AD Ȩ������CMD ID*/
#define HA_CODEC_AD_BALANCE_SET_CMD	((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1008)

/**Define PTS Delay command ID*/
/**CNcomment:����PTS Delay CMD ID*/
#define HA_CODEC_PTS_DELAY_SET_CMD	((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x1009)

/**Define HA codec set whether work in compress mode command ID */
/**CNcomment:�����Ƿ���������ѹ��ģʽ����CMD ID*/
#define HA_CODEC_COMPRESSMODE_SET_CMD ((((HI_U32)HA_COMMON_CMD_ID) << 16) | 0x100A)

/**Define HA codec maximum audio channel*/
/**CNcomment:����HA codec �����Ƶͨ�� */
#define HA_AUDIO_MAXCHANNELS 8
/** @} */  /** <!-- ==== Macro Definition end ==== */

/*************************** Structure Definition ****************************/
/** \addtogroup	     ACODEC */
/** @{ */  /** <!--  ��ACODEC�� */

/**HA format definition*/
/**CNcomment:HA format ����*/
typedef enum hiHA_FORMAT_E
{
    FORMAT_MP2 = 0x000,	 /**<MPEG audio layer 1, 2.*/ /**<CNcomment:MPEG��Ƶ��һ�㡢�ڶ��� */
    FORMAT_MP3, /**<MPEG audio layer 1, 2, 3.*/ /**<CNcomment:MPEG��Ƶ��һ�㡢�ڶ��� ��������*/
    FORMAT_AAC,
    FORMAT_AC3,
    FORMAT_DTS,
    FORMAT_VORBIS,
    FORMAT_DVAUDIO,
    FORMAT_WMAV1,
    FORMAT_WMAV2,
    FORMAT_MACE3,
    FORMAT_MACE6,
    FORMAT_VMDAUDIO,
    FORMAT_SONIC,
    FORMAT_SONIC_LS,
    FORMAT_FLAC,
    FORMAT_MP3ADU,
    FORMAT_MP3ON4,
    FORMAT_SHORTEN,
    FORMAT_ALAC,
    FORMAT_WESTWOOD_SND1,
    FORMAT_GSM,
    FORMAT_QDM2,
    FORMAT_COOK,
    FORMAT_TRUESPEECH,
    FORMAT_TTA,
    FORMAT_SMACKAUDIO,
    FORMAT_QCELP,
    FORMAT_WAVPACK,
    FORMAT_DSICINAUDIO,
    FORMAT_IMC,
    FORMAT_MUSEPACK7,
    FORMAT_MLP,
    FORMAT_GSM_MS, /**<as found in WAV.*/ /**<CNcomment:����WAV��ʽ�� */
    FORMAT_ATRAC3,
    FORMAT_VOXWARE,
    FORMAT_APE,
    FORMAT_NELLYMOSER,
    FORMAT_MUSEPACK8,
    FORMAT_SPEEX,
    FORMAT_WMAVOICE,
    FORMAT_WMAPRO,
    FORMAT_WMALOSSLESS,
    FORMAT_ATRAC3P,
    FORMAT_EAC3,
    FORMAT_SIPR,
    FORMAT_MP1,
    FORMAT_TWINVQ,
    FORMAT_TRUEHD,
    FORMAT_MP4ALS,
    FORMAT_ATRAC1,
    FORMAT_BINKAUDIO_RDFT,
    FORMAT_BINKAUDIO_DCT,
    FORMAT_DRA,
    FORMAT_MS12_DDP,
    FORMAT_MS12_AAC,
    FORMAT_MS12_AC4,

    FORMAT_PCM = 0x100,/**<various PCM codecs.*/ /**<CNcomment:PCM��ʽ */
    FORMAT_PCM_BLURAY = 0x121,

    FORMAT_ADPCM = 0x130,/**<various ADPCM codecs.*/ /**<CNcomment:ADPCM��ʽ */

    FORMAT_AMR_NB = 0x160,/**<various AMR codecs.*/ /**<CNcomment:AMR��ʽ */
    FORMAT_AMR_WB,
    FORMAT_AMR_AWB,

    FORMAT_RA_144 = 0x170,/**<RealAudio codecs.*/ /**<CNcomment:RealAudio��ʽ */
    FORMAT_RA_288,

    FORMAT_DPCM = 0x180,/**<various DPCM codecs.*/ /**<CNcomment:DPCM��ʽ */

    FORMAT_G711 = 0x190,/**<various G.7xx codecs.*/ /**<CNcomment:G.7xx��ʽ */
    FORMAT_G722,
    FORMAT_G7231,
    FORMAT_G726,
    FORMAT_G728,
    FORMAT_G729AB,


    FORMAT_MULTI = 0x1f0,/**<support multi codecs.*/ /**<CNcomment:���ָ�ʽ */

    FORMAT_BUTT = 0x1ff,
} HA_FORMAT_E;

/**HA format definition*/
/**CNcomment:HA_Codec����*/
typedef enum hiHA_CODEC_ID_E
{
    /** HISI Codec*/
    HA_AUDIO_ID_PCM		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_PCM, 0x0000),
    HA_AUDIO_ID_MP2		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MP2, 0x0002),
    HA_AUDIO_ID_MP3		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MULTI, 0x0003),
    HA_AUDIO_ID_AAC		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_AAC, 0x001),
    HA_AUDIO_ID_BLYRAYLPCM	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_PCM_BLURAY, 0x021),
    HA_AUDIO_ID_COOK		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_COOK, 0x0009),
    HA_AUDIO_ID_DRA		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_DRA, 0x007),
    HA_AUDIO_ID_WMA9STD		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MULTI, 0x0006),
    HA_AUDIO_ID_AMRNB		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_AMR_NB, 0x0100),
    HA_AUDIO_ID_AMRWB		= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_AMR_WB, 0x0110),
    HA_AUDIO_ID_G711		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_G711, 0x0102),
    HA_AUDIO_ID_G722		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_G722, 0x0105),
    HA_AUDIO_ID_G726		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_G726, 0x0106),
    HA_AUDIO_ID_ADPCM		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_ADPCM, 0x0107),
    HA_AUDIO_ID_VOICE		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MULTI, 0x0108),
    HA_AUDIO_ID_TRUEHD		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_TRUEHD, 0x0008),
    HA_AUDIO_ID_AC3PASSTHROUGH	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_MULTI, 0x0055),
    HA_AUDIO_ID_DTSPASSTHROUGH	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_DTS, 0x1025),

    /** DOLBY/DTS IPR Codec*/
    HA_AUDIO_ID_DOLBY_PLUS	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_MULTI, 0x1010),
    HA_AUDIO_ID_DOLBY_TRUEHD	= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_TRUEHD, 0x1011),
    HA_AUDIO_ID_MS12_DDP	= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MS12_DDP, 0x1012),
    HA_AUDIO_ID_MS12_AAC	= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MS12_AAC, 0x1013),
    HA_AUDIO_ID_MS12_AC4	= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_MS12_AC4, 0x1014),
    HA_AUDIO_ID_DTSHD		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_DTS, 0x1020),
    HA_AUDIO_ID_DTSM6		= HA_BUILD_CODEC_ID(VENDOR_NONE, FORMAT_DTS, 0x1030),

    /** FFMPEG Codec*/
    HA_AUDIO_ID_FFMPEG_DECODE	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_MULTI,	0x03ff),
    HA_AUDIO_ID_FFMPEG_WMAPRO	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_WMAPRO, 0x041f),

    /** CUSTOMER Codec*/
    HA_AUDIO_ID_CUSTOM_0	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_MULTI, 0x0400),
    HA_AUDIO_ID_CUSTOM_1	= HA_BUILD_CODEC_ID(VENDOR_HISI, FORMAT_MULTI, 0x0401),
} HA_CODEC_ID_E;

/**HA Audio Output AD Mode definition*/
/**CNcomment:HA OUTPUT AD MODE ����*/
typedef enum
{
    HA_OUTPUT_AD_OFF = 0,
    HA_OUTPUT_AD_ON,
    HA_OUTPUT_AD_OFF_WITHASSOC,
    HA_OUTPUT_AD_BUTT
} HA_CODEC_OUTPUT_AD_MODE_E;

/**Define query parameter of an HA codec.*/
/**CNcomment:����HA codec ��ѯ����*/
typedef struct
{
    HI_U32  enCmd;
    HI_VOID *pPara;
} HA_CODEC_PARAMETER_QUERY_S;

/**Define format query parameter of an HA codec.*/
/**CNcomment:����HA codec ��ʽ��ѯ����*/
typedef struct
{
    HI_U32  enCmd;
    HA_FORMAT_E enFormat;
} HA_CODEC_FORMAT_QUERY_PARAM_S;

/**Define packet query parameter of an HA codec.*/
/**CNcomment:����HA codec packet����ģʽ��ѯ����*/
typedef struct
{
    HI_U32  enCmd;		/**<packet query command.*/ /**<CNcomment:packetģʽ��ѯ����*/
    HI_BOOL bPacketDecoder;	/**<Packet mode.In this mode, the decoder can decode the next packet only after processing an entire packet. */
				/**<CNcomment:packetģʽ.������ģʽ�£�ֻ�д����굱ǰ����packet����������ܴ�����һ��packet��*/
} HA_CODEC_PACKETDECODER_QUERY_PARAM_S;

/**Define hardware decode query parameter of an HA codec.*/
/**CNcomment:����HA codec hardware����ģʽ��ѯ����*/
typedef struct
{
    HI_U32  enCmd;	/**<hwdecode query command.*/ /**<CNcomment: hwdecodeģʽ��ѯ����*/
    HI_BOOL bHwCodec;	/**<HI_TRUE: hwdecode mode else swdecode mode. */ /**<CNcomment:hwdecodeģʽ*/
} HA_CODEC_HARDWARECODER_QUERY_PARAM_S;

/**Define query parameter of dual decode capability.*/
/**CNcomment:����˫·����������ѯ����*/
typedef struct
{
    HI_U32  enCmd;		    /**<query dual decode capability command.*/ /**<CNcomment: ��ѯ˫·������������*/
    HI_BOOL bDualDecSupport;	    /**<support dual decode or not. */	/**<CNcomment:�Ƿ�֧��˫·����*/
} HA_CODEC_DUALDECODE_QUERY_PARAM_S;

/**Define setting parameter of dual decode ad output mode.*/
/**CNcomment:����˫·����AD���ģʽ**/
typedef struct
{
    HI_U32		 enCmd;		    /**<set AD Output Mode command.*/ /**<CNcomment: ����AD���ģʽ����*/
    HA_CODEC_OUTPUT_AD_MODE_E  enAdMode;    /**<AD Output Mode. */  /**<CNcomment:AD���ģʽ*/
} HA_CODEC_ADMODE_SET_PARAM_S;

/**Define setting parameter of AD Balance.*/
/**CNcomment:����AD Ȩ��**/
typedef struct
{
    HI_U32  enCmd;			/**<set AD Balance command.*/ /**<CNcomment: ����ADȨ������*/
    HI_S16  s16ADBalance;		/**<set the value of AD Balance */  /**<CNcomment:����ADȨ��ֵ*/
} HA_CODEC_ADBALANCE_SET_PARAM_S;

/**Define set parameter of whether work in compress mode.*/
/**CNcomment:�����Ƿ���������ѹ��ģʽ���ò���*/
typedef struct
{
    HI_U32  enCmd;	    /**<set the compress mode command. */ /**<CNcomment:�����Ƿ�����ѹ��ģʽ����*/
    HI_BOOL bCompressMode;  /**<whether work in compress mode. */ /**<CNcomment:�Ƿ���������ѹ��ģʽ*/
} HA_CODEC_COMPRESSMODE_SET_PARAM_S;

/**Define the error codes of an HA codec.*/
/**CNcomment:����HA codec ������*/
typedef enum hiHA_ERRORTYPE_E
{
    HA_ErrorNone = 0, /**<None error.*/ /**<CNcomment:û�д��� */

    HA_ErrorInsufficientResources = (HI_S32) 0x80001000,/**<The device fails to be created due to insufficient resources.*/ /**<CNcomment:��Դ�����������豸ʧ�� */

    HA_ErrorInvalidParameter = (HI_S32) 0x80001001, /**<The input parameter is invalid.*/ /**<CNcomment:��������Ƿ� */

    HA_ErrorStreamCorrupt = (HI_S32) 0x80001002, /**<The decoding fails due to incorrect input streams.*/ /**<CNcomment:�����������󣬽���ʧ�� */

    HA_ErrorNotEnoughData = (HI_S32) 0x80001003,/**<The decoding ends due to insufficient streams.*/ /**<CNcomment:���������������˳����� */

    HA_ErrorDecodeMode = (HI_S32) 0x80001004,/**<The decoding mode is not supported.*/ /**<CNcomment:����ģʽ��֧�� */

    HA_ErrorNotSupportCodec = (HI_S32) 0x80001005,/**<The codec is not supported.*/ /**<CNcomment:��������֧�� */

    HA_ErrorInBufFull = (HI_S32) 0x80001006,/**<Input buffer is full.*/ /**<CNcomment:���뻺���� */

    HA_ErrorOutBufEmpty = (HI_S32) 0x80001007,/**<Output buffer is empty.*/ /**<CNcomment:�������� */

#ifdef HA_SW_DUALDEC_SUPPORT
    HA_ErrorNotEnoughADData = (HI_S32) 0x80001008,/**<The decoding ends due to insufficient ad streams.*/ /**<CNcomment:ad���������������˳����� */

    HA_ErrorADDecFailed = (HI_S32) 0x80001009,
#endif

    HA_ErrorMax = 0x9FFFFFFF
} HI_HA_ERRORTYPE_E;

/**Definition of the distribution mode of the channels of an HA codec.*/
/**CNcomment:����HA codec �����ֲ�ģʽ*/
typedef enum hiHA_CHANNELTYPE_E
{
    HA_AUDIO_ChannelNone = 0x0,	   /**< Unused or empty.*/ /**<CNcomment:δʹ�û�Ϊ��*/
    HA_AUDIO_ChannelLF	= 0x1,	   /**< Left front.*/ /**<CNcomment:��ǰ*/
    HA_AUDIO_ChannelRF	= 0x2,	   /**< Right front.*/ /**<CNcomment:��ǰ*/
    HA_AUDIO_ChannelCF	= 0x3,	   /**< Center front.*/ /**<CNcomment:����*/
    HA_AUDIO_ChannelLS	= 0x4,	   /**< Left surround.*/ /**<CNcomment:����*/
    HA_AUDIO_ChannelRS	= 0x5,	   /**< Right surround.*/ /**<CNcomment:�һ���*/
    HA_AUDIO_ChannelLFE = 0x6,	   /**< Low frequency effects.*/ /**<CNcomment:����*/
    HA_AUDIO_ChannelCS	= 0x7,	   /**< Back surround.*/ /**<CNcomment:����*/
    HA_AUDIO_ChannelLR	= 0x8,	   /**< Left rear.*/ /**<CNcomment:���*/
    HA_AUDIO_ChannelRR	= 0x9,	   /**< Right rear.*/ /**<CNcomment:�Һ�*/
    HA_AUDIO_ChannelMax = 0x7FFFFFFF
} HI_HA_CHANNELTYPE_E;

/**Definition of the decoding mode of an HA decoder.*/
/**CNcomment:����HA ����������ģʽ*/
typedef enum hiHA_DECODEMODE_E
{
    HD_DEC_MODE_RAWPCM = 0,	   /**<PCM decoding mode.*/ /**<CNcomment:PCM ����ģʽ*/
    HD_DEC_MODE_THRU,		   /**<SPIDF61937 passthrough decoding mode only, such as AC3/DTS.*/ /**<CNcomment:͸������ģʽ*/
    HD_DEC_MODE_SIMUL,		   /**<PCM and passthrough decoding mode.*/ /**<CNcomment:PCM + ͸������ģʽ*/
    HD_DEC_MODE_BUTT = 0x7FFFFFFF
} HI_HA_DECODEMODE_E;

/**Definition of the HA codec version.*/
/**CNcomment:HA codec �汾����*/
typedef union hiHI_HAAUDIO_VERSIONTYPE_U
{
    struct
    {
	HI_U8 u8VersionMajor;	   /**< Major version.*/ /**<CNcomment:���汾�� */
	HI_U8 u8VersionMinor;	   /**< Minor version.*/ /**<CNcomment:���汾�� */
	HI_U8 u8Revision;	   /**< Revision version.*/ /**<CNcomment:�޶��汾 */
	HI_U8 u8Step;		   /**< Step version.*/ /**<CNcomment:�׶��԰汾 */
    } s;
    HI_U32 u32Version;
} HI_HAAUDIO_VERSIONTYPE_U;

/**Definition of the data types of the PCM module in an HA codec HA codec.*/
/**CNcomment:pcm �������ͽṹ�嶨��*/
typedef struct hiHA_PCMMODETYPE_S
{
    HI_U32		u32DesiredOutChannels;/**<Input,number of expected output channels.If the number of original channels is not equal to the number of expected output channels,
						  the decoded automatically performs down-mixing or up-mixing,In this way,
						  the number of output channels is equal to the value of u32DesiredOutChannels,1: mono; 2 stereo. \n*/
					      /**<CNcomment:IN �������������Ŀ. �������ԭʼ����������
						  ��������������������Զ�����down-mix ��up-mix ������ʹ�����
						  ��������u32DesiredOutChannels.  1: mono, 2 for stereo*/
    HI_BOOL		bInterleaved;/**<Whether the PCM data is interleaved.
					 HI_TRUE: interleaved mode (L/R/L/R.. .L/R/L/R).
					 HI_FALSE: non-interleaved mode (L/L/L.../R/R/R...). \n*/
				     /**<CNcomment:IN PCM �����Ƿ�֯ģʽ
					 HI_TRUE:  ��֯ģʽ: L/R/L/R...L/R/L/R.
					 HI_FALSE: �ǽ�֯ģʽ: L/L/L......../R/R/R....... */
    HI_U32		u32BitPerSample;/**<Input Bit width of the PCM data.Only 16-bit or 24-bit width is supported.For the data of 16-bit width, 16-bit memory is used,
					    For the data of 24-bit width, 32-bit memory is used,The active bits of the 24-bit PCM data are upper bits, and the lower eight bits are padded with 0s. \n*/
					/**<CNcomment:IN PCM ����λ��,��֧��16 ��24 ����λ�� 16bit λ��ռ��16bit �ڴ�,
					    24bit λ��ռ��32�����ڴ�.24bit PCM������ЧΪ�ڸ�λ����8 λ��0*/
    HI_U32		u32DesiredSampleRate; /**<Input, expected output sampling rate.*/ /**<CNcomment:IN �����������Ƶ��*/
    HI_HA_CHANNELTYPE_E enChannelMapping[HA_AUDIO_MAXCHANNELS]; /**<Input, distribution mode of output channels.*/ /**<CNcomment:IN ��������ֲ�ģʽ*/
} HI_HA_PCMMODETYPE_S;

/**Configuration parameters required by an HA codec for creating devices.*/
/**CNcomment:HA �����������豸�����ò���*/
typedef struct hiHADECODE_OPENPARAM_S
{
    HI_HA_DECODEMODE_E	enDecMode;  /**<IN Decode Mode.*/ /**<CNcomment:����ģʽ*/
    HI_HA_PCMMODETYPE_S sPcmformat; /**<IN data types of pcm module.*/ /**<CNcomment:PCM�������ͽṹ��*/
    HI_VOID *		pCodecPrivateData;/**<Input, pointer to private data.If the decoder does not contain private data, this parameter is set to 0. */
					  /**<CNcomment:IN  ָ��˽�����ýṹ���ָ�룬���������û��˽�����ã�����Ϊ0*/
    HI_U32		u32CodecPrivateDataSize;/**<Input, size of the private data.If the decoder does not contain private data, this parameter is set to 0. */
						/**<CNcomment:IN ˽�нṹ���С, ���������û��˽�����ã�����Ϊ0*/
} HI_HADECODE_OPENPARAM_S;

/**Input streams of an HA decoder.*/
/**CNcomment:HA ���������������ṹ��*/
typedef struct hiHADECODE_INPACKET_S
{
    HI_U32  u32PtsMs;  /**<Input, presentation time stamp (PTS) (in ms).Note: The HA decoder must discard this information. */ /**<CNcomment:��ǰʱ���*/
    HI_U8  *pu8Data;   /**<Input/output, pointer to input streams.The decoder update this pointer after decoding. */ /**<CNcomment:IN/OUT ��������ָ�룬������ɺ���������¸�ָ��*/
    HI_S32  s32Size;   /**<Input, size (in byte) of input streams.*/ /**<CNcomment:IN ����������С. unit: Byte*/
    HI_BOOL bEndOfFrm; /**<Input, the last frame or not.*/ /**<CNcomment:IN �Ƿ����һ֡*/
} HI_HADECODE_INPACKET_S;

/**Get Open parameter of an HA decoder.*/
/**CNcomment:��ȡHA �������򿪲���*/
typedef struct
{
    HI_U32  enCmd;
    HI_HADECODE_OPENPARAM_S *pstDecodeParams;
} HA_CODEC_GET_DECOPENPARAM_PARAM_S;

/**Definition of the decoder output pts infomations.*/
/**CNcomment:pts�����Ϣ*/
typedef struct hiHI_HA_OUTPTSINFO_S
{
    union
    {
	HI_U32 u32SwDecoderBytesLeft;	/**<left bytes of software decoder.*/ /**<CNcomment:����ʣ���ֽ��� */
	HI_U32 u32HwDecoderPtsReadPos;	/**<pts read position of software decoder.*/ /**<CNcomment:Ӳ��pts��λ�� */
    } unPts;

    union
    {
	HI_U32 u32SwAdDecoderBytesLeft;	    /**<ad left bytes of software decoder.*/ /**<CNcomment:����adʣ���ֽ��� */
	HI_U32 u32HwAdDecoderPtsReadPos;    /**<ad pts read position of software decoder.*/ /**<CNcomment:Ӳ��ad pts��λ�� */
    } unAdPts;
} HI_HA_OUTPTSINFO_S;

/**Output structure of the HA decoder.*/
/**CNcomment:HA ����������ṹ��*/
typedef struct hiHI_HADECODE_OUTPUT_S
{
    HI_S32 *ps32PcmOutBuf;	 /**<Input, pointer to the decoded PCM data.
				     Note: 1) ps32PcmOutBuf must be 32-word aligned.
					   2) ps32PcmOutBuf is NULL when the decoder is working in HD_DEC_MODE_THRU mode.\n*/
				 /**<CNcomment:IN ָ��PCM ���������ָ��. */

    HI_U32  u32PcmOutBufSize;	 /**<Input, size (in byte) of the buffer for storing the decoded PCM data
				     Note: u32PcmOutBufSize is 0 when the decoder is working in HD_DEC_MODE_THRU mode.\n*/
				 /**<CNcomment:IN  PCM ���������������С. unit:Byte */

    HI_S32 *ps32BitsOutBuf;	 /**<Input, pointer to the decoded passthrough data.
				     Note: 1) ps32BitsOutBuf must be 32-word aligned.
					   2) ps32BitsOutBuf is NULL when the decoder is working in HD_DEC_MODE_RAWPCM mode.\n*/
				 /**<CNcomment:IN ָ��͸�����������ָ��. */

    HI_U32  u32BitsOutBufSize;	 /**<Input, size (in byte) of the buffer for storing the decoded passthrough data (IEC61937)
				     Note: u32BitsOutBufSize is 0 when the decoder is working in HD_DEC_MODE_RAWPCM mode.\n*/
				 /**<CNcomment:IN ͸��(IEC61937) ���������������С. unit:Byte */

    HI_U32  u32PcmOutSamplesPerFrame; /**<Output, number of output sampling points after the PCM data is decoded.*/ /**<CNcomment:OUT. ����Pcm ��������� */
    HI_BOOL bInterleaved;	      /**<Output, interleaved mode for PCM decoding.*/ /**<CNcomment:OUT PCM  ���뽻֯ģʽ*/
    HI_U32  u32BitPerSample;	      /**<Output, bit per sampling.*/ /**<CNcomment:OUT λ��*/
    HI_U32  u32BitsOutBytesPerFrame;  /**<Output, size (in byte) of the passthrough frame.*/ /**<CNcomment:OUT ͸�����֡��С. unit: Byte*/
    HI_U32  u32OutChannels;	      /**<Output, number of output channels.*/ /**<CNcomment:OUT ���������*/
    HI_U32  u32OutSampleRate;	      /**<Output, output sampling rate.*/ /**<CNcomment:OUT. �������Ƶ��*/
    HI_U32  u32OrgChannels;	      /**<Output, number of original channels.*/ /**<CNcomment:OUT ����ԭʼ������*/
    HI_U32  u32OrgSampleRate;	      /**<Output, original sampling rate.*/ /**<CNcomment:OUT ����ԭʼ����Ƶ��*/
    HI_U32  u32BitRate;		      /**<Output, bit rate (in bit/s) of the compressed streams.*/ /**<CNcomment:OUT ����ѹ����unit: bit/S*/
    HI_HA_OUTPTSINFO_S stPtsInfo;     /**<Output, pts information.*/ /**<CNcomment:OUT. pts��Ϣ*/
    HI_U32  u32FrameIndex;   /**<Output, output frame index.*/ /**<CNcomment:OUT. ���֡���*/
} HI_HADECODE_OUTPUT_S;

/**Definition of the HA decoder.*/
/**CNcomment:HA �������豸����*/
typedef struct hiHA_DECODE_S
{
    const HI_PCHAR szName;/**<Input, description information about a decoder, such as MP3 or AAC. */
			  /**<CNcomment:IN �������������֣���MP3,AAC*/

    const HI_U32 enCodecID;/**<Input, decoder ID.Note: This ID is the identifier of a decoder, and must be unique. */
			   /**<CNcomment:IN ��������ʶ��ע��: �˱�ʶ��Ϊ������Ψһ���ݱ�ʶ������Ψһ���������ظ�*/

    const HI_HAAUDIO_VERSIONTYPE_U uVersion;/**<Input, decoder version.*/ /**<CNcomment:IN �������汾����*/

    const HI_PCHAR pszDescription;/**<Input, detailed information about a decoder.*/ /**<CNcomment:IN ��������ϸ������Ϣ*/



    struct hiHA_DECODE_S *pstNext;/**<Output, pointer to the next decoder.This member variable is maintained by the client that calls the HA codec,
				      Therefore, the developers of the HA decoder can ignore this member variable. \n*/
				  /**<CNcomment:OUT  ָ���¸��������豸��ָ��.	�ó�Ա�����ɵ���HA Codec �Ŀͻ���ά��, HA �����������߿��Ժ��Ըó�Ա*/

    HI_VOID  * pDllModule;/**<Output, pointer to the dll symbol of an HA decoder,This member variable is maintained by the client that calls the HA codec,
			      Therefore, the developers of the HA decoder can ignore this member variable.\n*/
			  /**<CNcomment:OUT �ó�Ա�����ɵ���HA Codec �Ŀͻ���ά��, HA �����������߿��Ժ��Ըó�Ա*/

    /**
    \brief Initializes a decoder. CNcomment:��ʼ�������� CNend
    \attention \n
    \param[in] pstOpenParam pointer of the open params CNcomment:open�����ṹ��ָ�� CNend
    \param[out] phDecoder   pointer of the decoder handle CNcomment:���������ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecInit)(HI_VOID * *phDecoder,
				 const HI_HADECODE_OPENPARAM_S * pstOpenParam);

    /**
    \brief DeInitializes a decoder. CNcomment:ȥ��ʼ�������� CNend
    \attention \n
    \param[in] hDecoder	  pointer of the decoder handle CNcomment:���������ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecDeInit)(HI_VOID* hDecoder);

    /**
    \brief Configure a decoder dynamically. You can call this API when a decoder works.
    CNcomment:��������̬���÷������û������ڽ���������ʱ���øýӿ� CNend
    \attention \n
    \param[in] hDecoder	  the decoder handle CNcomment:��������� CNend
    \param[in] pstConfigStructure pointer to application allocated structure to be used for initialization by the decoder CNcomment:��������ʼ���ṹ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecSetConfig)(HI_VOID* hDecoder, HI_VOID* pstConfigStructure);

    /**
    \brief Maximum size of the buffer required for storing the PCM data decoded by the decoder,
    The memory needs to be allocated based on the size on the client.
    CNcomment:������PCM���������󻺳���size. �ͻ�����Ҫ���ݸ÷��������ڴ� CNend
    \attention \n
    \param[in] hDecoder	  the decoder handle CNcomment:��������� CNend
    \param[out] pu32OutSizes pointer to the max size of the pcm audio frame. unit:Byte CNcomment:���PCM�����������С CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecGetMaxPcmOutSize)(HI_VOID* hDecoder,
	    HI_U32* pu32OutSizes);

    /**
    \brief Maximum size of the buffer required for storing the passthrough data decoded by the decoder,
    The memory needs to be allocated based on the size on the client.
    CNcomment:������͸�����������󻺳���size.�ͻ�����Ҫ���ݸ÷��������ڴ� CNend
    \attention \n
    \param[in] hDecoder	  the decoder handle CNcomment:��������� CNend
    \param[out] pu32OutSizes pointer to the max size of the iec61937 audio frame. unit:Byte CNcomment:���͸�������������С CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecGetMaxBitsOutSize)(HI_VOID* hDecoder,
	    HI_U32* pu32OutSizes);

    /**
    \brief This method is used to decode a frame. CNcomment:����������һ֡���� CNend
    \attention \n
    \param[in] hDecoder	  the decoder handle CNcomment:��������� CNend
    \param[in] pstApkt pointer to audio stream packet CNcomment:��Ƶ������ָ�� CNend
    \param[out] pstAOut pointer to audio output CNcomment:��Ƶ�����ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecDecodeFrame)(HI_VOID* hDecoder,
					HI_HADECODE_INPACKET_S* pstApkt,
					HI_HADECODE_OUTPUT_S* pstAOut);

#ifdef HA_SW_DUALDEC_SUPPORT
    /**
    \brief This method is used to dual decode a frame. CNcomment:������˫·����һ֡���� CNend
    \attention \n
    \param[in] hDecoder	  the decoder handle CNcomment:��������� CNend
    \param[in] pstApkt pointer to audio stream packet CNcomment:��Ƶ������ָ�� CNend
    \param[in] pstADApkt pointer to AD audio stream packet CNcomment:AD��Ƶ������ָ�� CNend
    \param[out] pstAOut pointer to audio output CNcomment:��Ƶ�����ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*DecDualDecodeFrame)(HI_VOID* hDecoder,
					    HI_HADECODE_INPACKET_S* pstApkt,
					    HI_HADECODE_INPACKET_S* pstADApkt,
					    HI_HADECODE_OUTPUT_S* pstAOut);
#endif

} HI_HA_DECODE_S;

/**Parameters for creating an HA encoder.*/
/**CNcomment:HA �������������ò���*/
typedef struct hiHAENCODE_OPENPARAM_S
{
    HI_U32	u32DesiredOutChannels; /**<IN Number of channels (e.g 2 for stereo).*/ /**<CNcomment:������*/
    HI_BOOL	bInterleaved;	    /**<IN interleave or not.*/ /**<CNcomment:��֯ģʽ*/
    HI_S32	s32BitPerSample;    /**<IN bitwidth per sample.*/ /**<CNcomment:λ��*/
    HI_U32	u32DesiredSampleRate; /**<IN desired samplerate.*/ /**<CNcomment:����������*/
    HI_U32	u32SamplePerFrame;  /**<IN Pcm samples per frame for encoder.*/ /**<CNcomment:ÿ֡������*/
    HI_VOID*	pCodecPrivateData;  /**<IN Pointer of decoder private open parameters note: if there is none private parameters, pCodecPrivateData=0.*/
				    /**<CNcomment:˽�в���*/
    HI_U32	u32CodecPrivateDataSize;/**<IN Size of decoder private open parameters note: if there is none private parameters, u32CodecPrivateDataSize=0.*/
					/**<CNcomment:˽�в�����С*/
} HI_HAENCODE_OPENPARAM_S;

/**HA input pcm	 packet struct.*/
/**CNcomment:packetģʽ�ṹ��*/
typedef struct hiHAENCODE_INPACKET_S
{
    HI_U32  u32PtsMs;	    /**<IN  PTS (unit:MS) Note: HA encoder should discard this infomation.*/
			    /**<CNcomment:PTS����λ:����*/
    HI_U8*  pu8Data;	    /**<IN/OUT pointer to input auduo pcm data note: HA encoder would update pu8Data after encode.*/
			    /**<CNcomment:��������ָ��*/
    HI_U32  u32Size;	    /**<IN/OUT size of the input auduo data. unit: Byte.*/ /**<CNcomment:�������ݴ�С*/
} HI_HAENCODE_INPACKET_S;

/**HA encoder output struct.*/
/**CNcomment:����������ṹ��*/
typedef struct hiHAENCODE_OUTPUT_S
{
    HI_S32* ps32BitsOutBuf;	    /**<IN the pointer to encoded bitstream output buffer note: ps32BitsOutBuf must  be word32-aligned.*/
				    /**<CNcomment:�����������buffer*/
    HI_U32  u32BitsOutBufSize;	    /**<IN the buffer size of bitstream output buffer. unit:Byte.*/ /**<CNcomment:���������buffer��С*/
    HI_U32  u32BitsOutBytesPerFrame;/**<IN size of the encoded audio data frame ,unit: Byte.*/ /**<CNcomment:��������֡��С����λ:Byte*/
    HI_U32  u32BitRate;		    /**<IN compress bit rate of the audio stream.*/ /**<CNcomment:������*/
} HI_HAENCODE_OUTPUT_S;

/**HA encoder struct define.*/
/**CNcomment:����������ṹ��*/
typedef struct hiHA_ENCODE_S
{
    const HI_PCHAR szName;/**<Input, description information about audio encoder. */
    /**<CNcomment:IN ��������������*/

    const HI_U32 enCodecID;/**<Input, encoder ID.Note: This ID is the identifier of a encoder, and must be unique. */
    /**<CNcomment:IN ��������ʶ��ע��: �˱�ʶ��Ϊ������Ψһ���ݱ�ʶ������Ψһ���������ظ�*/

    const HI_HAAUDIO_VERSIONTYPE_U uVersion;/**<Input, encoder version.*/ /**<CNcomment:IN �������汾����*/

    const HI_PCHAR pszDescription;/**<Input, Description infomation of the audio encoder. */ /**<CNcomment:IN ��������ϸ������Ϣ*/

    struct hiHA_ENCODE_S* pstNext;/**<OUT pointer to next HA enocder.manager by client.client:The layer of software that invokes the methods of the HA encoder. */
    /**<CNcomment:OUT �¸��������ṹ��ָ�룬�ɿͻ����� */

    HI_VOID*   pDllModule;/**<Output, pointer to the dll symbol of an HA encoder.This member variable is maintained by the client that calls the HA codec
			      Therefore, the developers of the HA encoder can ignore this member variable. \n*/
    /**<CNcomment:OUT �ó�Ա�����ɵ���HA Codec �Ŀͻ���ά��, HA �����������߿��Ժ��Ըó�Ա*/

    /**
    \brief Initializes a encoder. CNcomment:��ʼ�������� CNend
    \attention \n
    \param[in] pstOpenParam pointer of the open params CNcomment:open�����ṹ��ָ�� CNend
    \param[out] phEncoder   pointer of the encoder handle CNcomment:���������ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*EncodeInit)(HI_VOID * *phEncoder,
				    const HI_HAENCODE_OPENPARAM_S* pstOpenParam);

    /**
    \brief DeInitializes a encoder. CNcomment:ȥ��ʼ�������� CNend
    \attention \n
    \param[in] hEncoder	  pointer of the encoder handle CNcomment:��������� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*EncodeDeInit)(HI_VOID* hEncoder);

    /**
    \brief Configure a encoder dynamically. It can be invoked anytime after the Encoder has been loaded.
    CNcomment:��������̬���÷������û������ڱ���������ʱ���øýӿ� CNend
    \attention \n
    \param[in] hEncoder	  the encoder handle CNcomment:��������� CNend
    \param[in] pstConfigStructure pointer to application allocated structure to be used for initialization by the encoder CNcomment:��������ʼ���ṹ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*EncodeSetConfig)(HI_VOID* hEncoder, HI_VOID* pstConfigStructure);

    /**
    \brief Maximum output size of an encoded bitstream CNcomment:���������������󻺳���size CNend
    \attention \n
    \param[in] hEncoder	  the decoder handle CNcomment:��������� CNend
    \param[out] pu32OutSizes pointer to the max size of the encoded audio frame. unit:Byte CNcomment:������֡�����������С CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*EncodeGetMaxBitsOutSize)(HI_VOID* hEncoder,
	    HI_U32* pu32OutSizes);

    /**
    \brief This method is used to encode a frame. CNcomment:����������һ֡���� CNend
    \attention \n
    \param[in] hEncoder	  the decoder handle CNcomment:��������� CNend
    \param[in] pstApkt pointer to audio stream packet CNcomment:��Ƶ������ָ�� CNend
    \param[out] pstAOut pointer to audio output CNcomment:��Ƶ�����ָ�� CNend
    \retval ::HA_ErrorNone  SUCCESS CNcomment:�ɹ� CNend
    \retval ::HI_HA_ERRORTYPE_E FAILURE CNcomment:ʧ�� CNend
    \see \n
    N/A
    */
    HI_HA_ERRORTYPE_E (*EncodeFrame)(HI_VOID* hEncoder,
				     HI_HAENCODE_INPACKET_S* pstApkt,
				     HI_HAENCODE_OUTPUT_S* pstAOut);
} HI_HA_ENCODE_S;

/** @} */  /** <!-- ==== Structure Definition end ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* #ifndef __HI_AUDIO_CODEC_H__ */
