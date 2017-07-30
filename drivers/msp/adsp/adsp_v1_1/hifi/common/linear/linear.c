/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name		      : linear_src.c
  Version		      : Initial Draft
  Author		      : Hisilicon multimedia software group
  Created		      : 2010/01/21
  Last Modified		      :
  Description		      :
  Function List		      :
  History		      :
  1.Date		      : 2010/01/21
    Author		      : z40717
    Modification	      : Created file

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#include "hi_dsp_debug.h"
#include "hi_dsp_mem.h"
#include "hi_dsp_basicop.h"
#include "hi_dsp_linear.h"
//for debug
#include "hi_dsp_debug.h"

#include "adsp_osal_ext.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* End of #ifdef __cplusplus */

#define LINEARSRC_FIXPOINT /* fast fix point linear */

typedef struct
{
    HI_S32 BitPerSample;
    HI_S32 Channels;
    HI_S32 AdjustInRate;
    HI_S32 InRate;
    HI_S32 OutRate;
    HI_S32 Remainder;
    HI_S32 DisContinuity;
    HI_S32 SpeedAdjust;
#ifdef	LINEARSRC_FIXPOINT
    HI_S32 IvtSFFactor;
#endif
    HI_S32 PreSample[LINEAR_MAX_CHANNELS];
} SRC_Linear;

#ifdef LINEARSRC_FIXPOINT

/* optimize: use high precison MUL32_30 to replace mult32(x,y)<<2 */

static HI_S32 g_s32SampleRateTab[] =
{
    8000,
    11025,
    12000,
    16000,
    22050,
    24000,
    32000,
    44100,
    48000,
    88200,
    96000,
    176400,
    192000,
};

static HI_S32 g_s32IvtSfTab[] =
{
    0x00041893 >> 1, /* (1.0/8k)*2^30 */
    0x0002f8df >> 1, /* (1.0/11k)*2^30 */
    0x0002bb0d >> 1, /* (1.0/12k)*2^30 */
    0x00020c4a >> 1, /* (1.0/16k)*2^30 */
    0x00017c70 >> 1, /* (1.0/22k)*2^30 */
    0x00015d86 >> 1, /* (1.0/24k)*2^30 */
    0x00010625 >> 1, /* (1.0/32k*2^30 */
    0x0000be38 >> 1, /* (1.0/44k)*2^30 */
    0x0000aec3 >> 1, /* (1.0/48k)*2^30 */
    0x00005f1c >> 1, /* (1.0/88k)*2^30 */
    0x00005762 >> 1, /* (1.0/96k)*2^30 */
    0x00002F8E >> 1, /* (1.0/176k)*2^30 */
    0x00002bb1 >> 1, /* (1.0/192k)*2^30 */
};
#endif

HI_VOID LSRC_Create(HI_VOID* *phLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
			 HI_S32 Channels)
{
    unsigned int n; //for pclint check
    SRC_Linear *pLinearSrc;

    *phLSRC = HI_NULL;

    if ((inRate <= 0) || (inRate > 192000))
    {
	HI_DSP_PRINT("invalid inRate(%d)\n", inRate);
	return;
    }

    if ((outRate <= 0) || (outRate > 192000))
    {
	HI_DSP_PRINT("invalid inRate(%d)\n", outRate);
	return;
    }

    if (outRate / inRate > 6)
    {
	HI_DSP_PRINT("inRate(%d),outRated(%d)\n", inRate, outRate);
	return;
    }

    pLinearSrc = (SRC_Linear *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(SRC_Linear));
    if (NULL == pLinearSrc)   //for fix moto
    {
	HI_DSP_PRINT("malloc SRC_linear failure!\n");
	return;
    }

    adsp_memset(pLinearSrc, 0, sizeof(SRC_Linear));

    //if(pLinearSrc)	for pclint check
    {
#ifdef LINEARSRC_FIXPOINT
	for (n = 0; n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32); n++)
	{
	    if (g_s32SampleRateTab[n] == outRate)
	    {
		break;
	    }
	}

	//for fix MOTO
	if (n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32))
	{
	    pLinearSrc->IvtSFFactor = g_s32IvtSfTab[n]; //size of array g_s32IvtSfTab is 12
	}
#endif

	for (n = 0; n < (unsigned int )Channels; n++) //for pclint check
	{
	    pLinearSrc->PreSample[n] = 0;
	}

	pLinearSrc->BitPerSample = BitPerSample;
	pLinearSrc->Channels = Channels;
	pLinearSrc->AdjustInRate = inRate;
	pLinearSrc->InRate  = inRate;
	pLinearSrc->OutRate = outRate;
	*phLSRC = (HI_VOID *)pLinearSrc;
    }
}

HI_VOID LSRC_Destroy(HI_VOID* hLSRC)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;

    if (pLinearSrc)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, pLinearSrc);
    }

}

HI_S32 LSRC_GetMaxOutputNum(HI_VOID* hLSRC, HI_S32 insamps)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_S32 outsamps;

    if (pLinearSrc == HI_NULL)
    {
	return -1;
    }

    outsamps = ((HI_S32)insamps * pLinearSrc->OutRate / pLinearSrc->AdjustInRate) + 1;	   // for pclint check

    return outsamps;
}

HI_S32	 LSRC_GetMinInputNum(HI_VOID* hLSRC, HI_S32 outsamps)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_S32 insamps;

    if (pLinearSrc == HI_NULL)
    {
	return -1;
    }

    insamps = ((HI_S32)outsamps * pLinearSrc->AdjustInRate / pLinearSrc->OutRate);     // for pclint check
    if(outsamps * pLinearSrc->AdjustInRate % pLinearSrc->OutRate)
    {
	insamps += 1;
    }

    return insamps;
}

HI_S32 LSRC_CheckUpdate(HI_VOID* hLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
			     HI_S32 Channels)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_S32 change = 0;

    change += (HI_S32)(pLinearSrc->BitPerSample != BitPerSample); //for pclint check
    change += (HI_S32)(pLinearSrc->Channels != Channels);
    change += (HI_S32)(pLinearSrc->InRate != inRate);
    change += (HI_S32)(pLinearSrc->OutRate != outRate);
    if (change == 0)
    {
	return HI_FALSE;
    }

    return HI_TRUE;
}


HI_VOID LSRC_UpdateChange(HI_VOID* hLSRC, HI_S32 inRate, HI_S32 outRate, HI_S32 BitPerSample,
			       HI_S32 Channels)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_U32 n; //for pclint check
    HI_S32 change = 0;

    change += (HI_S32)(pLinearSrc->BitPerSample != BitPerSample); //for pclint check
    change += (HI_S32)(pLinearSrc->Channels != Channels);
    change += (HI_S32)(pLinearSrc->InRate != inRate);
    change += (HI_S32)(pLinearSrc->OutRate != outRate);
    if (change == 0)
    {
	return;
    }

    /* reset state */
    pLinearSrc->BitPerSample = BitPerSample;
    pLinearSrc->Channels = Channels;
    pLinearSrc->AdjustInRate = inRate;
    pLinearSrc->InRate	  = inRate;
    pLinearSrc->OutRate	  = outRate;
    pLinearSrc->Remainder = 0;
    pLinearSrc->DisContinuity = 0;
    pLinearSrc->SpeedAdjust = 0;

#ifdef LINEARSRC_FIXPOINT
    for (n = 0; n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32); n++)
    {
	if (g_s32SampleRateTab[n] == pLinearSrc->OutRate)
	{
	    break;
	}
    }

    if (n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32))    //for fix moto
    {
	pLinearSrc->IvtSFFactor = g_s32IvtSfTab[n];
    }
#endif


    for (n = 0; n < (HI_U32)Channels; n++) //for pclint check
    {
	pLinearSrc->PreSample[n] = 0;
    }
}
HI_VOID LSRC_Flush(HI_VOID* hLSRC)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_U32 n; //for pclint check

    /* reset state */
    pLinearSrc->Remainder = 0;
    pLinearSrc->DisContinuity = 0;

#ifdef LINEARSRC_FIXPOINT
    for (n = 0; n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32); n++)
    {
	if (g_s32SampleRateTab[n] == pLinearSrc->OutRate)
	{
	    break;
	}
    }

    if (n < sizeof(g_s32SampleRateTab) / sizeof(HI_S32))    //for fix moto
    {
	pLinearSrc->IvtSFFactor = g_s32IvtSfTab[n];
    }
#endif


    for (n = 0; n < (HI_U32)pLinearSrc->Channels; n++) //for pclint check
    {
	pLinearSrc->PreSample[n] = 0;
    }
}

HI_S32 LSRC_CheckDoSRC(HI_VOID* hLSRC)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;

    /*
     * warning: can't compare s32SpeedAdjust and 0 only, you need to make fadetime useful to avoid nosize(baoyin)
     */
    if ((pLinearSrc->AdjustInRate == pLinearSrc->OutRate) && (pLinearSrc->DisContinuity == 0))
    {
	return 0;  /* dont do LinearSRC */
    }
    else
    {
	return 1;  /* do LinearSRC */
    }
}

HI_VOID LSRC_SetSpeedAdjust(HI_VOID* hLSRC, HI_S32 SpeedAdjust)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;

    if (pLinearSrc->SpeedAdjust == SpeedAdjust)
    {
	return;
    }

#if 1
    /* check SpeedAdjust at app */
    if (SpeedAdjust > LINEAR_MAX_SPEED_ADJUST)
    {
	return;
    }
    else if (SpeedAdjust < -LINEAR_MAX_SPEED_ADJUST)
    {
	return;
    }
#endif


    if ((0 == pLinearSrc->SpeedAdjust) && (0 != SpeedAdjust))
    {
	pLinearSrc->DisContinuity = 1;	/* not continuous */
    }

    if ((0 != pLinearSrc->SpeedAdjust) && (0 == SpeedAdjust))
    {
	pLinearSrc->DisContinuity = 1;	/* not continuous */
    }

    pLinearSrc->SpeedAdjust  = SpeedAdjust;
    pLinearSrc->AdjustInRate = (pLinearSrc->InRate * (1000 + SpeedAdjust)) / 1000;
    pLinearSrc->Remainder = 0;	//verify
}

static HI_S32 LinearSRC_32bitProcessFrame(SRC_Linear* pInst,
					  HI_S32 *    pInPcmBuf,
					  HI_S32 *    pOutpcmBuf,
					  HI_S32      InSamps)
{
    HI_S32 insamps, outsamps;
    HI_S32 sum, out = 0, in = 0, ch;
    HI_S32 *pcmbuf  = (HI_S32*)pInPcmBuf;
    HI_S32 Channels = pInst->Channels;

    insamps  = InSamps;
    outsamps = 0;

    if (pInst->DisContinuity && (insamps > 0))
    {
	if (pInst->AdjustInRate == pInst->OutRate) /* fade out */
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		pOutpcmBuf[Channels * out + ch] = (pInst->PreSample[ch]);
	    }

	    outsamps++;
	    out++;
	    pInst->DisContinuity = 0;
	}
	else  /* fade in */
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		(pInst->PreSample[ch]) = (HI_S32)(pcmbuf[Channels * in + ch]);
	    }

	    in++;
	    insamps--;
	    pInst->DisContinuity = 0;
	}
    }

    if (pInst->AdjustInRate == pInst->OutRate)
    {
	while (insamps > 0)
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		pOutpcmBuf[Channels * out + ch] = pcmbuf[Channels * in + ch];
	    }

	    outsamps++;
	    out++;
	    in++;
	    insamps--;
	}
    }
    else
    {
	if (insamps > 0)
	{
	    while (pInst->Remainder < pInst->OutRate)
	    {
		for (ch = 0; ch < Channels; ch++)
		{
#ifdef LINEARSRC_FIXPOINT
		    sum	 = mult32(pcmbuf[Channels * (in + 0) + ch], pInst->IvtSFFactor * pInst->Remainder);
		    sum += mult32(pInst->PreSample[ch], pInst->IvtSFFactor * (pInst->OutRate - pInst->Remainder));
		    sum = saturate_16bit(sum >> 14);/* IvtSFFactor is 2.30 format */
		    pOutpcmBuf[Channels * out + ch] = sum << 16;
#else
		    HI_S64 s64sample0, s64sample1;
		    s64sample0 = (HI_S64)(pcmbuf[Channels * in + ch]);
		    s64sample1 = (HI_S64)(pInst->PreSample[ch]);
		    pOutpcmBuf[Channels * out
			       + ch] = (HI_S32)((s64sample0 * pInst->Remainder + s64sample1
						 * (pInst->OutRate - pInst->Remainder)) / pInst->OutRate);
#endif
		}

		outsamps++;
		out++;
		pInst->Remainder += pInst->AdjustInRate;
	    }

	    pInst->Remainder -= pInst->OutRate;
	    insamps--;
	}

	while (insamps > 0)
	{
	    while (pInst->Remainder < pInst->OutRate)
	    {
		for (ch = 0; ch < Channels; ch++)
		{
#ifdef LINEARSRC_FIXPOINT
		    /* optimize: use high precison MUL32_30 to replace mult32(x,y)<<2 */
		    sum	 = mult32(pcmbuf[Channels * (in + 1) + ch], pInst->IvtSFFactor * pInst->Remainder);
		    sum += mult32(pcmbuf[Channels
					     * (in + 0) + ch], pInst->IvtSFFactor * (pInst->OutRate - pInst->Remainder));
		    sum = saturate_16bit(sum >> 14);/* IvtSFFactor is 2.30 format */
		    pOutpcmBuf[Channels * out + ch] = sum << 16;

#else
		    HI_S64 s64sample0, s64sample1;
		    s64sample0 = (HI_S64)(pcmbuf[Channels * (in + 1) + ch]);
		    s64sample1 = (HI_S64)(pcmbuf[Channels * (in + 0) + ch]);
		    pOutpcmBuf[Channels * out
			       + ch] = (HI_S32)((s64sample0 * pInst->Remainder + s64sample1
						 * (pInst->OutRate - pInst->Remainder)) / pInst->OutRate);
#endif
		}

		outsamps++;
		out++;
		pInst->Remainder += pInst->AdjustInRate;
	    }

	    pInst->Remainder -= pInst->OutRate;
	    in++;
	    insamps--;
	}

	for (ch = 0; ch < Channels; ch++)
	{
	    (pInst->PreSample[ch]) = (HI_S32)(pcmbuf[Channels * in + ch]);
	}
    }

    return outsamps;
}

static HI_S32 LinearSRC_16bitProcessFrame(SRC_Linear* pInst,
					  HI_S16 *    pInPcmBuf,
					  HI_S16 *    pOutpcmBuf,
					  HI_S32      InSamps)
{
    HI_S32 insamps, outsamps;
    HI_S32 sum, out = 0, in = 0, ch;
    HI_S16 *pcmbuf  = (HI_S16*)pInPcmBuf;
    HI_S32 Channels = pInst->Channels;

    insamps  = InSamps;
    outsamps = 0;

    if (pInst->DisContinuity && (insamps > 0))
    {
	if (pInst->AdjustInRate == pInst->OutRate) /* fade out */
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		pOutpcmBuf[Channels * out + ch] = (pInst->PreSample[ch]);
	    }

	    outsamps++;
	    out++;
	    pInst->DisContinuity = 0;
	}
	else  /* fade in */
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		(pInst->PreSample[ch]) = (HI_S32)(pcmbuf[Channels * in + ch]);
	    }

	    in++;
	    insamps--;
	    pInst->DisContinuity = 0;
	}
    }

    if (pInst->AdjustInRate == pInst->OutRate)
    {
	while (insamps > 0)
	{
	    for (ch = 0; ch < Channels; ch++)
	    {
		pOutpcmBuf[Channels * out + ch] = pcmbuf[Channels * in + ch];
	    }

	    outsamps++;
	    out++;
	    in++;
	    insamps--;
	}
    }
    else
    {
	if (insamps > 0)
	{
	    while (pInst->Remainder < pInst->OutRate)
	    {
		for (ch = 0; ch < Channels; ch++)
		{
#ifdef LINEARSRC_FIXPOINT

		    sum	 = mult32(pcmbuf[Channels * (in + 0) + ch], pInst->IvtSFFactor * pInst->Remainder);
		    sum += mult32(pInst->PreSample[ch], pInst->IvtSFFactor * (pInst->OutRate - pInst->Remainder));
		    pOutpcmBuf[Channels * out + ch] = saturate_16bit(sum << 2);/* IvtSFFactor is 2.30 format */
#else
		    pOutpcmBuf[Channels * out + ch] = ((pcmbuf[Channels * in
							       + ch] * pInst->Remainder + pInst->PreSample[ch]
							* (pInst->OutRate - pInst->Remainder)) / pInst->OutRate);
#endif
		}

		outsamps++;
		pInst->Remainder += pInst->AdjustInRate;
	    }

	    pInst->Remainder -= pInst->OutRate;
	    insamps--;
	}

	while (insamps > 0)
	{
	    while (pInst->Remainder < pInst->OutRate)
	    {
		for (ch = 0; ch < Channels; ch++)
		{
#ifdef LINEARSRC_FIXPOINT

		    sum	 = mult32(pcmbuf[Channels * (in + 1) + ch], pInst->IvtSFFactor * pInst->Remainder);
		    sum += mult32(pcmbuf[Channels
					     * (in + 0) + ch], pInst->IvtSFFactor * (pInst->OutRate - pInst->Remainder));
		    pOutpcmBuf[Channels * out + ch] = saturate_16bit(sum << 2);/* IvtSFFactor is 2.30 format */

#else
		    pOutpcmBuf[Channels * out
			       + ch] = ((pcmbuf[Channels
						* (in + 1) + ch] * pInst->Remainder + pcmbuf[Channels * in + ch]
					 * (pInst->OutRate - pInst->Remainder)) / pInst->OutRate);
#endif
		}

		outsamps++;
		pInst->Remainder += pInst->AdjustInRate;
	    }

	    pInst->Remainder -= pInst->OutRate;
	    in++;
	    insamps--;
	}

	for (ch = 0; ch < Channels; ch++)
	{
	    (pInst->PreSample[ch]) = (HI_S32)(pcmbuf[Channels * in + ch]);
	}
    }

    return outsamps;
}

HI_S32	LSRC_ProcessFrame(HI_VOID* hLSRC,
			       HI_S32 *	    pInPcmBuf,
			       HI_S32 *	    pOutpcmBuf,
			       HI_S32	    InSamps)
{
    SRC_Linear *pLinearSrc = (SRC_Linear *)hLSRC;
    HI_S32 outsampls;

    if (16 == pLinearSrc->BitPerSample)
    {
	outsampls = LinearSRC_16bitProcessFrame(pLinearSrc, (HI_S16*)pInPcmBuf, (HI_S16*)pOutpcmBuf, InSamps);
    }
    else
    {
	outsampls = LinearSRC_32bitProcessFrame(pLinearSrc, (HI_S32*)pInPcmBuf, (HI_S32*)pOutpcmBuf, InSamps);
    }

    return outsampls;
}


#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* End of #ifdef __cplusplus */
