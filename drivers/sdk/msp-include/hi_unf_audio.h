/******************************************************************************

  Copyright (C), 2004-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_audio.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2009/12/17
  Description	:
  History	:
  1.Date	: 2009/12/17
    Author	: w58735
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_AUDIO_H__
#define __HI_UNF_AUDIO_H__


#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

#include "hi_common.h"
#include "hi_audio_codec.h"

/*************************** Structure Definition ****************************/
/** \addtogroup	     Audio_Common */
/** @{ */  /** <!-- [Audio_Common] */


/**CNcomment: ������Ƶ������ö��*/
typedef enum hiUNF_SAMPLE_RATE_E
{
    HI_UNF_SAMPLE_RATE_UNKNOWN=0,	/**<Unknown*/ /**<CNcomment: δ֪����Ƶ�� */
    HI_UNF_SAMPLE_RATE_8K    = 8000,	/**<8 kHz sampling rate*/ /**<CNcomment: 8K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_11K   = 11025,	/**<11.025 kHz sampling rate*/ /**<CNcomment: 11.025K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_12K   = 12000,	/**<12 kHz sampling rate*/ /**<CNcomment: 12K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_16K   = 16000,	/**<16 kHz sampling rate*/ /**<CNcomment: 16K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_22K   = 22050,	/**<22.050 kHz sampling rate*/ /**<CNcomment: 22.050K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_24K   = 24000,	/**<24 kHz sampling rate*/ /**<CNcomment: 24K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_32K   = 32000,	/**<32 kHz sampling rate*/ /**<CNcomment: 32K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_44K   = 44100,	/**<44.1 kHz sampling rate*/ /**<CNcomment: 44.1K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_48K   = 48000,	/**<48 kHz sampling rate*/ /**<CNcomment: 48K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_88K   = 88200,	/**<88.2 kHz sampling rate*/ /**<CNcomment: 88.2K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_96K   = 96000,	/**<96 kHz sampling rate*/ /**<CNcomment: 96K����Ƶ�� */
	HI_UNF_SAMPLE_RATE_176K	 = 176400,	/**<176 kHz sampling rate*/ /**<CNcomment: 176K����Ƶ�� */
    HI_UNF_SAMPLE_RATE_192K  = 192000,	/**<192 kHz sampling rate*/ /**<CNcomment: 192K����Ƶ�� */

    HI_UNF_SAMPLE_RATE_BUTT
}HI_UNF_SAMPLE_RATE_E;

/**Defines the bit depth during audio sampling.*/
/**CNcomment: ������Ƶ����λ��ö��*/
typedef enum hiUNF_BIT_DEPTH_E
{
    HI_UNF_BIT_DEPTH_UNKNOWN =0,/**<Unknown*/ /**<CNcomment: δ֪����λ��  */
    HI_UNF_BIT_DEPTH_8	= 8,	/**< 8-bit depth*/ /**<CNcomment: 8λ����λ��  */
    HI_UNF_BIT_DEPTH_16 = 16,	/**<16-bit depth*/ /**<CNcomment: 16λ����λ�� */
    HI_UNF_BIT_DEPTH_18 = 18,	/**<18-bit depth*/ /**<CNcomment: 18λ����λ�� */
    HI_UNF_BIT_DEPTH_20 = 20,	/**<20-bit depth*/ /**<CNcomment: 20λ����λ�� */
    HI_UNF_BIT_DEPTH_24 = 24,	/**<24-bit depth*/ /**<CNcomment: 24λ����λ�� */
    HI_UNF_BIT_DEPTH_32 = 32,	/**<32-bit depth*/ /**<CNcomment: 32λ����λ�� */

    HI_UNF_BIT_DEPTH_BUTT
}HI_UNF_BIT_DEPTH_E;

/**Defines the mode of audio channels.*/
/**CNcomment: ������Ƶ����ģʽö��*/
typedef enum hiUNF_TRACK_MODE_E
{
    HI_UNF_TRACK_MODE_STEREO = 0,	   /**<Stereo*/ /**<CNcomment: ������*/
    HI_UNF_TRACK_MODE_DOUBLE_MONO,	   /**<Data is output after being mixed in the audio-left channel and audio-right channel.*/ /**<CNcomment: ����������Ϻ����*/
    HI_UNF_TRACK_MODE_DOUBLE_LEFT,	   /**<The audio-left channel and audio-right channel output the data of the audio-left channel.*/ /**<CNcomment: ���������������������*/
    HI_UNF_TRACK_MODE_DOUBLE_RIGHT,	   /**<The audio-left channel and audio-right channel output the data of the audio-right channel.*/ /**<CNcomment: ���������������������*/
    HI_UNF_TRACK_MODE_EXCHANGE,		   /**<Data is output after being exchanged in the audio-left channel and audio-right channel.*/ /**<CNcomment: �����������ݽ������ */
    HI_UNF_TRACK_MODE_ONLY_RIGHT,	   /**<Only the data in the audio-right channel is output.*/ /**<CNcomment: ֻ�������������*/
    HI_UNF_TRACK_MODE_ONLY_LEFT,	   /**<Only the data in the audio-left channel is output.*/ /**<CNcomment: ֻ�������������*/
    HI_UNF_TRACK_MODE_MUTED,		   /**<Mute*/ /**<CNcomment: ����*/

    HI_UNF_TRACK_MODE_BUTT
} HI_UNF_TRACK_MODE_E;

/**Defines the attributes of the audio decoder.*/
/**CNcomment: ������Ƶ���������Խṹ*/
typedef struct hiUNF_ACODEC_ATTR_S{
    HA_CODEC_ID_E	 enType;		    /**<Audio decoder type*/ /**<CNcomment: ��Ƶ��������*/
    HI_HADECODE_OPENPARAM_S stDecodeParam;   /**<Audio decoder parameter*/ /**<CNcomment: ��Ƶ�������*/
}HI_UNF_ACODEC_ATTR_S;

/**Defines the attributes of audio encoder.*/
/**CNcomment: ������Ƶ���������Խṹ*/
typedef struct hiUNF_AENC_ATTR_S
{
    HI_U32	   enAencType;		    /**<Audio encoder type*/ /**<CNcomment: ��Ƶ��������*/
    HI_HAENCODE_OPENPARAM_S   sOpenParam;   /**<Audio encoder parameter*/ /**<CNcomment: ��Ƶ�������*/
}HI_UNF_AENC_ATTR_S;

/**Defines the information about audio streams.*/
/**CNcomment: ������Ƶ������Ϣ�ṹ*/
typedef struct hiUNF_ACODEC_STREAMINFO_S
{
    HI_U32   enACodecType;		   /**<Audio encoding type*/ /**<CNcomment: ��Ƶ��������*/
    HI_U32		 enSampleRate;	   /**<Audio sampling rate*/ /**<CNcomment: ��Ƶ������*/
    HI_UNF_BIT_DEPTH_E	 enBitDepth;	   /**<Bit depth during audio sampling*/ /**<CNcomment: ��Ƶ����λ��*/
	HI_U32		     u32Channel;       /**<Audio output channel*//**<CNcomment: ��Ƶ���������*/
}HI_UNF_ACODEC_STREAMINFO_S;

/**Defines the I2S(Inter-IC Sound) mode.*/
/**CNcomment: ������ƵI2S�ӿ�ģʽö��*/
typedef enum hiHI_UNF_I2S_MODE_E
{
    HI_UNF_I2S_STD_MODE = 0,	 /**<I2S standard mode*/ /**<CNcomment: I2S��׼ģʽ*/
    HI_UNF_I2S_PCM_MODE,	 /**<pcm mode*/ /**<CNcomment: PCMģʽ*/
    HI_UNF_I2S_MODE_BUTT
} HI_UNF_I2S_MODE_E;

/**Defines the I2S(Inter-IC Sound) master clock.*/
/**CNcomment: ������ƵI2S�ӿڹ���ʱ��ö��*/
typedef enum hiHI_UNF_I2S_MCLK_SEL_E
{
    HI_UNF_I2S_MCLK_128_FS = 0,	     /* mclk 128*fs  */
    HI_UNF_I2S_MCLK_256_FS,	     /* mclk 256*fs */
    HI_UNF_I2S_MCLK_384_FS,	     /* mclk 384*fs */
    HI_UNF_I2S_MCLK_512_FS,	     /* mclk 512*fs */
    HI_UNF_I2S_MCLK_768_FS,	     /* mclk 768*fs */
    HI_UNF_I2S_MCLK_1024_FS,	     /* mclk 1024*fs */
    HI_UNF_I2S_MCLK_BUTT
} HI_UNF_I2S_MCLK_SEL_E;

/**Defines the I2S(Inter-IC Sound) bclk clock.*/
typedef enum hiHI_UNF_I2S_BCLK_SEL_E
{
     HI_UNF_I2S_BCLK_1_DIV = 1,		  /* bclk=mclk/1  */
     HI_UNF_I2S_BCLK_2_DIV = 2,		  /* bclk=mclk/2  */
     HI_UNF_I2S_BCLK_3_DIV = 3,		  /* bclk=mclk/3  */
     HI_UNF_I2S_BCLK_4_DIV = 4,		  /* bclk=mclk/4  */
     HI_UNF_I2S_BCLK_6_DIV = 6,		  /* bclk=mclk/6  */
     HI_UNF_I2S_BCLK_8_DIV = 8 ,	  /* bclk=mclk/8  */
     HI_UNF_I2S_BCLK_12_DIV= 12,	  /* bclk=mclk/12 */
     HI_UNF_I2S_BCLK_24_DIV= 24,	  /* bclk=mclk/24 */
     HI_UNF_I2S_BCLK_32_DIV= 32,	  /* bclk=mclk/32 */
     HI_UNF_I2S_BCLK_48_DIV= 48,	  /* bclk=mclk/48 */
     HI_UNF_I2S_BCLK_64_DIV= 64,	  /* bclk=mclk/64 */
     HI_UNF_I2S_BCLK_BUTT
} HI_UNF_I2S_BCLK_SEL_E;

/**Defines the I2S(Inter-IC Sound) channels.*/
/**CNcomment: ������ƵI2S�ӿ���Ƶͨ��ö��*/
typedef enum hiHI_UNF_I2S_CHNUM_E
{
    HI_UNF_I2S_CHNUM_1	= 1,
    HI_UNF_I2S_CHNUM_2	= 2,		  /* only work for I2S mode */
    HI_UNF_I2S_CHNUM_8	= 8,		  /* only work for I2S mode */
    HI_UNF_I2S_BUTT,
} HI_UNF_I2S_CHNUM_E;

/**Defines the I2S(Inter-IC Sound) bit depth.*/
typedef enum hiHI_UNF_I2S_BITDEPTH_E
{
    HI_UNF_I2S_BIT_DEPTH_16 = 16,
    HI_UNF_I2S_BIT_DEPTH_24 = 24,	  /* only work for I2S mode */
} HI_UNF_I2S_BITDEPTH_E;

/**Defines the I2S(Inter-IC Sound) data valid after frame sync clock at PCM mode .*/
/**CNcomment: ������ƵI2S�ӿڣ�������Ч�ӳ����ڣ���PCMģʽ��Ч*/
typedef enum hiHI_UNF_I2S_PCMDELAY_E
{
    HI_UNF_I2S_PCM_0_DELAY = 0,		  /* 0	bclk cycles delay*/
    HI_UNF_I2S_PCM_1_DELAY = 1,		  /* 1	bclk cycles delay*/
    HI_UNF_I2S_PCM_8_DELAY = 8,		  /* 8	bclk cycles delay*/
    HI_UNF_I2S_PCM_16_DELAY = 16,	  /* 16 bclk cycles delay*/
    HI_UNF_I2S_PCM_17_DELAY = 17,	  /* 17 bclk cycles delay*/
    HI_UNF_I2S_PCM_24_DELAY = 24,	  /* 24 bclk cycles delay*/
    HI_UNF_I2S_PCM_32_DELAY = 32,	  /* 32 bclk cycles delay*/
    HI_UNF_I2S_PCM_DELAY_BUTT
} HI_UNF_I2S_PCMDELAY_E;


/**Defines the I2S(Inter-IC Sound) attribute .*/
/**CNcomment: ������ƵI2S�ӿ���������*/
typedef struct hiHI_UNF_I2S_ATTR_S
{
    HI_BOOL		  bMaster;	     /* HI_TRUE:master, HI_FALSE: slave */
    HI_UNF_I2S_MODE_E	  enI2sMode;
    HI_UNF_I2S_MCLK_SEL_E enMclkSel;
    HI_UNF_I2S_BCLK_SEL_E enBclkSel;
    HI_UNF_I2S_CHNUM_E	  enChannel;
    HI_UNF_I2S_BITDEPTH_E enBitDepth;
    HI_BOOL		  bPcmSampleRiseEdge; /* only work for PCM mode. HI_TRUE:sample data at positive edge of bclk, HI_FALSE: sample data at	 negative edge of bclk */
    HI_UNF_I2S_PCMDELAY_E enPcmDelayCycle;    /* only work for PCM mode.  */
} HI_UNF_I2S_ATTR_S;

/**Defines the information about audio frames.*/
/**CNcomment: ������Ƶ֡��Ϣ�ṹ*/
typedef struct hiUNF_AO_FRAMEINFO_S
{
    /** s32BitPerSample: (PCM) Data depth, and format of storing the output data
	  If the data depth is 16 bits, 16-bit word memory is used.
	  If the data depth is greater than 16 bits, 32-bit word memory is used, and data is stored as left-aligned data. That is, the valid data is at upper bits.
     */
    /**CNcomment: s32BitPerSample: (PCM) ����λ������. �����Ÿ�ʽ
	  ����16bit:   ռ��16bit word�ڴ�
	  ����16bit:   ռ��32bit word�ڴ�, ��������뷽ʽ���(��Ч�����ڸ�λ)
     */
    HI_S32  s32BitPerSample;	   /**<Data depth*/ /**<CNcomment: ����λ��*/
    HI_BOOL bInterleaved;	   /**<Whether the data is interleaved*/ /**<CNcomment: �����Ƿ�֯*/
    HI_U32  u32SampleRate;	   /**<Sampling rate*/ /**<CNcomment: ������*/
    HI_U32  u32Channels;	   /**<Number of channels*/ /**<CNcomment: ͨ������*/
    HI_U32  u32PtsMs;		   /**<Presentation time stamp (PTS)*/ /**<CNcomment: ʱ���*/
    HI_S32 *ps32PcmBuffer;	   /**<Pointer to the buffer for storing the pulse code modulation (PCM) data*/ /**<CNcomment: PCM���ݻ���ָ��*/
    HI_S32 *ps32BitsBuffer;	   /**<Pointer to the buffer for storing the stream data*/ /**<CNcomment: �������ݻ���ָ��*/
    HI_U32  u32PcmSamplesPerFrame; /**<Number of sampling points of the PCM data*/ /**<CNcomment: PCM���ݲ���������*/
    HI_U32  u32BitsBytesPerFrame;  /**<IEC61937 data size*/ /**<CNcomment: IEC61937���ݳ���*/
    HI_U32  u32FrameIndex;	   /**<Frame ID*/ /**<CNcomment: ֡��� */
	HI_U32	u32IEC61937DataType;	  /**<IEC61937 Data Type*/ /**<CNcomment: IEC61937�������ͱ�ʶ����8bitΪIEC�������� */
} HI_UNF_AO_FRAMEINFO_S;

/** @} */  /** <!-- ==== Structure Definition End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_AUDIO_ H*/
