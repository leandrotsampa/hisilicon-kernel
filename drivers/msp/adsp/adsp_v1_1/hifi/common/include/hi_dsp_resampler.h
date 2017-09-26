/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_DSP_RESAMPLERS_H_
#define __HI_DSP_RESAMPLERS_H_

#include "hi_type.h"

/* Max input sample number per-channel */
#define MAXFRAMESIZE 2048

/*
   input sample rate defination
 */
enum
{
    IN_RATE_08K	 = 8000,
    IN_RATE_11K	 = 11025,
    IN_RATE_12K	 = 12000,
    IN_RATE_16K	 = 16000,
    IN_RATE_22K	 = 22050,
    IN_RATE_24K	 = 24000,
    IN_RATE_32K	 = 32000,
    IN_RATE_44K	 = 44100,
    IN_RATE_48K	 = 48000,
    IN_RATE_88K	 = 88200,
    IN_RATE_96K	 = 96000,
    IN_RATE_176K = 176400,
    IN_RATE_192K = 192000
};

/*
   output sample rate defination
 */
enum
{
    OUT_RATE_08K  = 8000,
    OUT_RATE_11K  = 11025,
    OUT_RATE_12K  = 12000,
    OUT_RATE_16K  = 16000,
    OUT_RATE_22K  = 22050,
    OUT_RATE_24K  = 24000,
    OUT_RATE_32K  = 32000,
    OUT_RATE_44K  = 44100,
    OUT_RATE_48K  = 48000,
    OUT_RATE_88K  = 88200,
    OUT_RATE_96K  = 96000,
    OUT_RATE_176K = 176400,
    OUT_RATE_192K = 192000
};

/*
   channel number defination
 */
enum
{
    RESAMPLER_MONO   = 1,
    RESAMPLER_STEREO = 2
};

/*
   Mono or Stereo input pcm sample format defination
	  =16bit:   fill 16bit word memory
	  >16bit:   fill 32bit word memory, left alignment(valid data in high)

 */
enum
{
    IN_PCM_16BIT_RAW = 16,
    IN_PCM_18BIT_RAW = 18,
    IN_PCM_20BIT_RAW = 20,
    IN_PCM_24BIT_RAW = 24
};


#ifndef HI_ERR_RESAMPLE_PREFIX
 #define HI_ERR_RESAMPLE_PREFIX 0x80000000
#endif

/* input handle is invalid */
#define HI_ERR_RESAMPLE_HANDLE (HI_ERR_RESAMPLE_PREFIX | 0x0001)

/* pcm circ buffer state is invalid */
#define HI_ERR_RESAMPLE_PCMBUF (HI_ERR_RESAMPLE_PREFIX | 0x0002)

/* input sample number is more than MAXFRAMESIZE or input buffer size
   , or input sample number is not even*/
#define HI_ERR_RESAMPLE_SAMPLE_NUMBER (HI_ERR_RESAMPLE_PREFIX | 0x0003)

/* output pcm buffer space is not enough */
#define HI_ERR_RESAMPLE_OUTPCM_SPACE (HI_ERR_RESAMPLE_PREFIX | 0x0004)

/* the channels of input pcm is invalid */
#define HI_ERR_PCM_CHANNEL (HI_ERR_RESAMPLE_PREFIX | 0x0005)

/* the bit width of input pcm is invalid */
#define HI_ERR_PCM_FORMAT (HI_ERR_RESAMPLE_PREFIX | 0x0006)

/* invalid bypass flag */
#define HI_ERR_INVALID_BYPASSFLAG (HI_ERR_RESAMPLE_PREFIX | 0x0007)

/* error unknown */
#define HI_ERR_UNKNOWN (HI_ERR_RESAMPLE_PREFIX | 0x0008)

/*******************************************************************************
 * Function:	ResamplerCreate
 *
 * Description: allocate memory for platform-specific data
 *		clear all the user-accessible fields
 *
 * Inputs:	InRate:	      8000  ~ 44100
 *		OutRate:      11025 ~ 48000
 *		Chans:	      RESAMPLER_MONO or RESAMPLER_STEREO
 *		SampleFormat: IN_PCM_16BIT_RAW or
 *			      IN_PCM_18BIT_RAW	or
 *			      IN_PCM_20BIT_RAW	or
 *			      IN_PCM_24BIT_RAW
 * Outputs:	none
 * Notes:	InRate must be less than OutRate
 * Return:	handle to Resampler instance, 0 if malloc fails
 ******************************************************************************/
HI_VOID* ResamplerCreate(HI_S32 InRate,
			       HI_S32 OutRate,
			       HI_S32 Chans,
			       HI_S32 SampleFormat,
			       HI_S32 isForec2Out32bit);

/*******************************************************************************
 * Function:	ResampleFlush
 *
 * Description: flush internal resampler state (after seeking, for example)
 *
 * Inputs:	valid Resampler instance pointer (HI_VOID*)
 * Outputs:	none
 *
 * Return:	none
 ******************************************************************************/
void	   ResampleFlush(HI_VOID* pInst);

/*******************************************************************************
 * Function:	ResamplerFree
 *
 * Description: free platform-specific data allocated by ResamplerCreate
 *
 * Inputs:	valid Resampler instance pointer (HI_VOID*)
 * Outputs:	none
 *
 * Return:	none
 ******************************************************************************/
void	   ResamplerFree(HI_VOID* pInst);

/*******************************************************************************
 * Function:	ResamplerGetMaxOutputNum
 *
 * Description: Caculate max output number at specific input number
 *
 * Inputs:	pInst:	  valid Resampler instance pointer (HI_VOID*)
 *		InSamps:  input data number per-channel, insamps must be even
 * Outputs:	none
 * Return:	>=0:	  Success, return the max output number per-channel
 *		other:	  Fail, return error code
 ******************************************************************************/
HI_S32	   ResamplerGetMaxOutputNum(HI_VOID* pInst,
					HI_S32	   InSamps);
HI_S32	   ResamplerGetMinInputNum(HI_VOID* pInst,
				       HI_S32	  OutSamps);

/*******************************************************************************
 * Function:	ResamplerProcessFrame
 *
 * Description: Resample one frame pcm data
 * Inputs:	pInst	  :   valid Resampler instance pointer (HI_VOID*)
 *		pInPcmBuf :   pointer to input linear pcmbuf
 *		pOutpcmBuf:   pointer to input linear pcmbuf
 *		InSamps	  :   input pcm sample number per-channel, must be even.
 *		InRate	  :   input  sample rate
 *		OutRate	  :   Output sample rate
 * Outputs:	outbuf	  :   pointer to outputbuf.
 *
 * Return:	>= 0  : Success, return output pcm sample number per-channel
 *		other : Fail, return error code.
 ******************************************************************************/
HI_S32	   ResamplerProcessFrame(HI_VOID*     pInst,
				     HI_S32 *	    pInPcmBuf,
				     HI_S32 *	    pOutpcmBuf,
				     HI_S32	    InSamps,
				     HI_S32	    InRate,
				     HI_S32	    OutRate,
				     HI_S32	    bInterleaved);

#endif /* __HI_DSP_RESAMPLERS_H_ */
