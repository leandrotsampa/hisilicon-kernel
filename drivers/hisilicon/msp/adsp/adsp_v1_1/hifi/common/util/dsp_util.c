/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_mem.h"
#include "hi_dsp_common.h"
#include "hi_dsp_basicop.h"
#include "hi_dsp_util.h"
#include "hi_dsp_debug.h"

#include "adsp_osal_ext.h"

/*-81dB~18dB*/
static HI_U32 g_u32VolCoef[] =
{
    0x03f8bd79, 0x038a2bac, 0x0327a01a, 0x02cfcc01, 0x02818508, 0x023bc147,
    0x01fd93c1, 0x01c62940, 0x0194c583, 0x0168c0c5, 0x0141857e, 0x011e8e6a,
    0x00ff64c1, 0x00e39ea8, 0x00caddc7, 0x00b4ce07, 0x00a12477, 0x008f9e4c,
    0x00800000, 0x00721482, 0x0065ac8c, 0x005a9df7, 0x0050c335, 0x0047facc,
    0x004026e7, 0x00392ced, 0x0032f52c, 0x002d6a86, 0x00287a26, 0x00241346,
    0x002026f3, 0x001ca7d7, 0x00198a13, 0x0016c310, 0x00144960, 0x0012149a,
    0x00101d3f, 0x000e5ca1, 0x000ccccc, 0x000b6873, 0x000a2ada, 0x00090fcb,
    0x00081385, 0x000732ae, 0x00066a4a, 0x0005b7b1, 0x00051884, 0x00048aa7,
    0x00040c37, 0x00039b87, 0x00033718, 0x0002dd95, 0x00028dce, 0x000246b4,
    0x00020756, 0x0001cedc, 0x00019c86, 0x00016fa9, 0x000147ae, 0x0001240b,
    0x00010449, 0x0000e7fa, 0x0000cec0, 0x0000b844, 0x0000a43a, 0x0000925e,
    0x00008273, 0x00007443, 0x0000679f, 0x00005c5a, 0x0000524f, 0x0000495b,
    0x00004161, 0x00003a45, 0x000033ef, 0x00002e49, 0x00002940, 0x000024c4,
    0x000020c4, 0x00001d34, 0x00001a07, 0x00001732, 0x000014ac, 0x0000126d,
    0x0000106c, 0x00000ea3, 0x00000d0b, 0x00000ba0, 0x00000a5c, 0x0000093c,
    0x0000083b, 0x00000755, 0x00000689, 0x000005d3, 0x00000531, 0x000004a0,
    0x00000420, 0x000003ad, 0x00000346, 0x00000000,
};

static const int Log2Tab[] __attribute__((aligned(8))) =
{
    0x0000fa51, 0x05affa7d, 0x0b32faa6, 0x108cfacc, 0x15c0faf1,
    0x1acffb13, 0x1fbcfb34, 0x2488fb53, 0x2935fb71, 0x2dc4fb8d,
    0x3237fba8, 0x368ffbc1, 0x3acefbd9, 0x3ef5fbf1, 0x4304fc08,
    0x46fcfc1d, 0x4adffc31, 0x4eaefc45, 0x5269fc58, 0x5611fc6a,
    0x59a7fc7b, 0x5d2cfc8d, 0x609ffc9c, 0x6403fcac, 0x6757fcbc,
    0x6a9bfcca, 0x6dd1fcd7, 0x70fafce6, 0x7414fcf3, 0x7721fcff,
    0x7a22fd0b, 0x7d17fd18
};

static HI_S16 AOE_FMUL_16_Q15(HI_S32 var, HI_U32 coef)
{
    if(0 == coef)
    {
	return 0;
    }
    var = MULT16_32_Q23(var, (HI_S32)coef);
    if(coef <= AOE_VOL_0DB_COEF)
    {
	return (HI_S16)var;
    }
    else
    {
	return saturate_16bit(var);
    }
}

static HI_S32 AOE_FMUL_24_Q15(HI_S32 var, HI_U32 coef)
{
    if(0 == coef)
    {
	return 0;
    }
    if(coef <= AOE_VOL_0DB_COEF)
    {
	var = MULT32_32_Q23(var, (HI_S32)coef);
	return var;
    }
    else
    {
	var = MULT32_32_Q23(var >> 8, (HI_S32)coef);
	return (saturate_24bit(var) << 8);
    }
}


HI_U32 UTIL_CalcFrameSize(HI_U32 uCh, HI_U32 uBitDepth)
{
    HI_U32 uFrameSize = 0;

    if (16 == uBitDepth)
    {
	uFrameSize = ((HI_U32)uCh) * sizeof(HI_U16);
    }
    else
    {
	uFrameSize = ((HI_U32)uCh) * sizeof(HI_U32);
    }

    return uFrameSize;
}

HI_U32 UTIL_LatencyMs2ByteSize(HI_U32 u32LatencyMs, HI_U32 u32FrameSize, HI_U32 u32SampleRate)
{
    return (u32SampleRate * u32LatencyMs * u32FrameSize / 1000);
}

HI_U32 UTIL_LatencyMs(HI_U32 u32DataBytes, HI_U32 u32FrameSize, HI_U32 u32SampleRate)
{
    return (u32DataBytes * 1000) / (u32FrameSize * u32SampleRate);
}


static HI_VOID	VolumeLR16BitPro_Linear(HI_S16 *     pPcmBuf,
				      HI_S32	   InSamps,
				      HI_S16	   s16VolumeL,
				      HI_S16	   s16VolumeR)
{
    HI_S32 sum, n;

    if (s16VolumeL == s16VolumeR)  //for efficiency
    {
	for (n = 0; n < (InSamps); n++)
	{
	    sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeL);
	    pPcmBuf[n] = (HI_S16)sum;
	}
    }
    else
    {
	for (n = 0; n < (InSamps); n++)
	{
	    if(n%2)		 //n= 2*X
		sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeR);
	    else
		sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeL);

	    pPcmBuf[n] = (HI_S16)sum;
	}
    }
}

HI_VOID	 UTIL_LRLinearGainProcess(HI_S16 *     pSrcPcmBuf,
				      HI_S16 *	   pDestPcmBuf,
				      HI_S32	   InSamps,
				      HI_S16	   s16VolumeL,
				      HI_S16	   s16VolumeR)
{
    HI_S32 sum, n;

    if (s16VolumeL == s16VolumeR)  //for efficiency
    {
	for (n = 0; n < (InSamps); n++)
	{
	    sum = MULF32_16B((HI_S32)pSrcPcmBuf[n], s16VolumeL);
	    pDestPcmBuf[n] = (HI_S16)sum;
	}
    }
    else
    {
	for (n = 0; n < (InSamps); n++)
	{
	    if(n%2)		 //n= 2*X
		sum = MULF32_16B((HI_S32)pSrcPcmBuf[n], s16VolumeR);
	    else
		sum = MULF32_16B((HI_S32)pSrcPcmBuf[n], s16VolumeL);

	    pDestPcmBuf[n] = (HI_S16)sum;
	}
    }
}


static HI_VOID	VolumeLR24BitPro_Linear(HI_S32 *     pPcmBuf,
				      HI_S32	   InSamps,
				      HI_S16	   s16VolumeL,
				      HI_S16	   s16VolumeR)
{
    HI_S32 sum, n;

    if (s16VolumeL == s16VolumeR)
    {
	for (n = 0; n < (InSamps); n++)
	{
	    sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeL);
	    pPcmBuf[n] = (HI_S32)sum;
	}
    }
    else
    {
	for (n = 0; n < (InSamps); n++)
	{
	   if(n%2)
		sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeR);
	    else
		sum = MULF32_16B((HI_S32)pPcmBuf[n], s16VolumeL);

	    pPcmBuf[n] = (HI_S32)sum;
	}
    }
}


// optimize,

HI_VOID UTIL_UpmixPcmData(HI_U32 dstCh, HI_VOID* WkBuf, HI_DSP_AUDFRAME_S *pstFrame)
{
    HI_U32 i, ch;

    // optimize, Upmix
    if (24 == pstFrame->u32BitPerSample)
    {
	HI_U32 *pu32Src = (HI_U32*)(pstFrame->pDataBuf);
	HI_U32 *pu32Dst = (HI_U32*)WkBuf;
	HI_U32 Data = 0;

	for (i = 0; i < pstFrame->u32SamplesPerFrame; i++)
	{
	    for (ch = 0; ch < dstCh; ch++)
	    {
		if (ch < pstFrame->u32Channels)
		{
		    Data = *pu32Src;
		    *pu32Dst = Data;
		    pu32Src++;
		    pu32Dst++;
		}
		else
		{
		    *pu32Dst = Data;
		    pu32Dst++;
		}
	    }
	}

	pstFrame->pDataBuf = (HI_VOID*)WkBuf;
	pstFrame->u32Channels  = dstCh;
	pstFrame->u32DataBytes = UTIL_CalcFrameSize(dstCh, pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;
    }
    else if (16 == pstFrame->u32BitPerSample)
    {
	HI_U16 *pu16Src = (HI_U16*)(pstFrame->pDataBuf);
	HI_U16 *pu16Dst = (HI_U16*)WkBuf;
	HI_U16 Data = 0;

	for (i = 0; i < pstFrame->u32SamplesPerFrame; i++)
	{
	    for (ch = 0; ch < dstCh; ch++)
	    {
		if (ch < pstFrame->u32Channels)
		{
		    Data = *pu16Src;
		    *pu16Dst = Data;
		    pu16Src++;
		    pu16Dst++;
		}
		else
		{
		    *pu16Dst = Data;
		    pu16Dst++;
		}
	    }
	}

	pstFrame->pDataBuf = (HI_VOID*)WkBuf;
	pstFrame->u32Channels  = dstCh;
	pstFrame->u32DataBytes = UTIL_CalcFrameSize(dstCh, pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;
    }

    return;
}

HI_VOID UTIL_DownmixPcmData(HI_U32 dstCh, HI_VOID* WkBuf, HI_DSP_AUDFRAME_S *pstFrame)
{
    HI_U32 i, ch;

    // optimize, Downmix

    if (24 == pstFrame->u32BitPerSample)
    {
	HI_U32 *pu32Src = (HI_U32*)(pstFrame->pDataBuf);
	HI_U32 *pu32Dst = (HI_U32*)WkBuf;
	HI_U32 Data;

	for (i = 0; i < pstFrame->u32SamplesPerFrame; i++)
	{
	    for (ch = 0; ch < dstCh; ch++)
	    {
		if (ch < dstCh)
		{
		    Data = *pu32Src;
		    *pu32Dst = Data;
		    pu32Src++;
		    pu32Dst++;
		}
		else
		{
		    pu32Src++;
		}
	    }
	}

	pstFrame->pDataBuf = (HI_VOID*)WkBuf;
	pstFrame->u32Channels  = dstCh;
	pstFrame->u32DataBytes = UTIL_CalcFrameSize(dstCh, pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;
    }
    else if (16 == pstFrame->u32BitPerSample)
    {
	HI_U16 *pu16Src = (HI_U16*)(pstFrame->pDataBuf);
	HI_U16 *pu16Dst = (HI_U16*)WkBuf;
	HI_U16 Data;

	for (i = 0; i < pstFrame->u32SamplesPerFrame; i++)
	{
	    for (ch = 0; ch < dstCh; ch++)
	    {
		if (ch < dstCh)
		{
		    Data = *pu16Src;
		    *pu16Dst = Data;
		    pu16Src++;
		    pu16Dst++;
		}
		else
		{
		    // discard data
		    pu16Src++;
		}
	    }
	}

	pstFrame->pDataBuf = (HI_VOID*)WkBuf;
	pstFrame->u32Channels  = dstCh;
	pstFrame->u32DataBytes = UTIL_CalcFrameSize(dstCh, pstFrame->u32BitPerSample) * pstFrame->u32SamplesPerFrame;
    }

    return;
}

HI_VOID UTIL_UnifyBitDepthPcmData(HI_U32 dstBitDepth, HI_VOID* WkBuf, HI_DSP_AUDFRAME_S *pstFrame)
{
    HI_U32 i;
    HI_U32 Samples = pstFrame->u32SamplesPerFrame * pstFrame->u32Channels;

    if ((16 == dstBitDepth) && (24 == pstFrame->u32BitPerSample))
    {
	HI_U32 *pu32Src;
	HI_U16 *pu16Data;
	HI_U16 *pu16Dst = (HI_U16 *)WkBuf;
	HI_U32 Data;

	pu32Src	 = (HI_U32*)(pstFrame->pDataBuf);
	pu16Data = pu16Dst;

	for (i = 0; i < Samples; i++)
	{
	    Data   = *pu32Src;
	    Data >>= 16;
	    *pu16Data = (HI_U16)Data;
	    pu16Data++;
	    pu32Src++;
	}

	pstFrame->pDataBuf = (HI_VOID*)pu16Dst;
	pstFrame->u32BitPerSample = dstBitDepth;
	pstFrame->u32DataBytes >>= 1;
    }
    else if ((24 == dstBitDepth) && (16 == pstFrame->u32BitPerSample))
    {
	HI_U16 *pu16Src;
	HI_U32 *pu32Data;
	HI_U32 *pu32Dst = (HI_U32 *)WkBuf;
	HI_U32 Data;

	pu16Src	 = (HI_U16*)(pstFrame->pDataBuf);
	pu32Data = pu32Dst;

	for (i = 0; i < Samples; i++)
	{
	    Data   = *pu16Src;
	    Data <<= 16;
	    *pu32Data = Data;
	    pu32Data++;
	    pu16Src++;
	}

	pstFrame->pDataBuf = (HI_VOID*)pu32Dst;
	pstFrame->u32BitPerSample = dstBitDepth;
	pstFrame->u32DataBytes *= 2;
    }

    return;
}


static HI_U32 VolumedB2Coef(HI_U32 u32VolumeInt, HI_S32 s32VolumeDec)
{
    HI_U32 idx;

    u32VolumeInt &= 0xff;
    if((u32VolumeInt > AOE_VOL_BASE_VALUE) &&
	(u32VolumeInt - AOE_VOL_BASE_VALUE >= AOE_VOL_MAX_VALUE))
    {
	return g_u32VolCoef[0];
    }

    idx = AOE_VOL_0DB_COEF_IDX + AOE_VOL_BASE_VALUE - u32VolumeInt;   //AOE_VOL_0DB_COEF_IDX - (vol_reg - AOE_VOL_BASE_VALUE)
    if (idx >= AOE_VOL_INF_COEF_IDX)
    {
	return g_u32VolCoef[AOE_VOL_INF_COEF_IDX];
    }

    /* Grab fractional portion */
    /* Linearly interpolate between the two levels */
    if(0 == s32VolumeDec)
    {
	return g_u32VolCoef[idx];
    }
    if(s32VolumeDec > 0)
    {
	return g_u32VolCoef[idx] + (g_u32VolCoef[idx - 1] - g_u32VolCoef[idx]) * (HI_U32)s32VolumeDec / 8;
    }
    else
    {
	return g_u32VolCoef[idx] - (g_u32VolCoef[idx] - g_u32VolCoef[idx + 1]) * (HI_U32)(-s32VolumeDec) / 8;
    }
}

static HI_VOID Volume16BitPro_Coef(HI_VOID* pcm, HI_S32 samples, HI_U32 u32Coef)
{
    HI_S16 *s16src = (HI_S16 *)pcm;
    HI_S32 data;

    while (samples--)
    {
	data = (HI_S32)(*s16src);
	*s16src = AOE_FMUL_16_Q15(data, u32Coef);
	s16src++;
    }
}

static HI_VOID VolumeLR16BitPro_Coef(HI_VOID* pcm, HI_S32 samples, HI_U32 u32CoefL, HI_U32 u32CoefR)
{
    HI_S16 *s16src = (HI_S16 *)pcm;
    HI_S32 data;

     while (samples--)
	{
	    data = (HI_S32)(*s16src);
	    if(samples%2)		    //samples= 2*n
		*s16src = AOE_FMUL_16_Q15(data, u32CoefL);
	    else
		*s16src = AOE_FMUL_16_Q15(data, u32CoefR);
	    s16src++;
	}
}

static HI_VOID VolumeLR16BitPro(HI_VOID* pcm, HI_S32 samples, HI_U32 realVolL, HI_U32 realVolR)
{
    if(realVolL == realVolR)	//for efficiency
    {
	Volume16BitPro_Coef(pcm, samples, realVolL);
    }
    else
    {
	VolumeLR16BitPro_Coef(pcm, samples, realVolL, realVolR);
    }
}

static HI_VOID Volume24BitPro_Coef(HI_VOID* pcm, HI_S32 samples, HI_U32 u32Coef)
{
    HI_S32 *s32src = (HI_S32 *)pcm;
    HI_S32 data;

    while (samples--)
    {
	data = *s32src;
	*s32src = AOE_FMUL_24_Q15(data, u32Coef);
	s32src++;
    }
}

static HI_VOID VolumeLR24BitPro_Coef(HI_VOID* pcm, HI_S32 samples, HI_U32 u32CoefL, HI_U32 u32CoefR)
{
    HI_S32 *s32src = (HI_S32 *)pcm;
    HI_S32 data;

    while (samples--)
    {
	data = *s32src;

	if(samples%2)
	    *s32src = AOE_FMUL_24_Q15(data, u32CoefL);
	else
	    *s32src = AOE_FMUL_24_Q15(data, u32CoefR);
	s32src++;
    }
}

static HI_VOID VolumeLR24BitPro(HI_VOID* pcm, HI_S32 samples, HI_U32 realVolL, HI_U32 realVolR)
{
    if(realVolL == realVolR)
    {
	Volume24BitPro_Coef(pcm, samples, realVolL);
    }
    else
    {
	VolumeLR24BitPro_Coef(pcm, samples, realVolL, realVolR);
    }
}


HI_VOID UTILS_GainBalanceCoef(HI_U32 *pu32CoefL, HI_U32 *pu32CoefR, HI_S32 s32Balance)
{
    HI_U32 u32Coef;

    if (s32Balance == 0)
    {}
    else if (s32Balance < 0)
    {
	u32Coef = *pu32CoefR;
	u32Coef = u32Coef * (HI_U32)(s32Balance + 50) / 50;
	*pu32CoefR = u32Coef;
    }
    else
    {
	u32Coef = *pu32CoefL;
	u32Coef = u32Coef * (HI_U32)(50 - s32Balance) / 50;
	*pu32CoefL = u32Coef;
    }

    return;
}

HI_VOID UTIL_LRGainProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_S32 s32Balance, UTIL_GAIN_ATTR_S *pstGain)
{
    HI_U32 realVolL, realVolR;
    HI_S32 samples = pstFrame->u32SamplesPerFrame * pstFrame->u32Channels;

    if (HI_TRUE == pstGain->bLinearMode)
    {
	switch (pstFrame->u32BitPerSample)
	{
	case 16:
	    VolumeLR16BitPro_Linear(pstFrame->pDataBuf, samples, (HI_S16)pstGain->u32LGain, (HI_S16)pstGain->u32RGain);
	    break;
	case 24:
	    VolumeLR24BitPro_Linear(pstFrame->pDataBuf, samples, (HI_S16)pstGain->u32LGain, (HI_S16)pstGain->u32RGain);
	    break;
	}
    }
    else
    {
	realVolL = VolumedB2Coef(pstGain->u32LGain, pstGain->s32LDecGain);
	realVolR = VolumedB2Coef(pstGain->u32RGain, pstGain->s32RDecGain);
	UTILS_GainBalanceCoef(&realVolL, &realVolR, s32Balance);
	if((g_u32VolCoef[AOE_VOL_0DB_COEF_IDX] == realVolL) && (g_u32VolCoef[AOE_VOL_0DB_COEF_IDX] == realVolR))
	{
	    return;
	}

	switch (pstFrame->u32BitPerSample)
	{
	case 16:
	    VolumeLR16BitPro(pstFrame->pDataBuf, samples, realVolL, realVolR);
	    break;
	case 24:
	    VolumeLR24BitPro(pstFrame->pDataBuf, samples, realVolL, realVolR);
	    break;
	}
    }
}

HI_VOID UTIL_LRFadeGainProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_S32 s32Balance, UTIL_GAIN_ATTR_S *pstCurrentGain, UTIL_GAIN_ATTR_S *pstTargetGain)
{
    HI_U32 i;
    HI_S32 s32Inc;
    HI_U32 u32Coef, u32CoefL, u32CoefR, u32CurCoef, u32TarCoef;
    HI_S32 s32Data;
    HI_S16 *s16src = (HI_S16 *)pstFrame->pDataBuf;
    HI_S32 *s32src = (HI_S32 *)pstFrame->pDataBuf;

    u32CurCoef = VolumedB2Coef(pstCurrentGain->u32LGain, pstCurrentGain->s32LDecGain);
    u32TarCoef = VolumedB2Coef(pstTargetGain->u32LGain, pstTargetGain->s32LDecGain);
    s32Inc = ((HI_S32)u32TarCoef - (HI_S32)u32CurCoef) / (HI_S32)pstFrame->u32SamplesPerFrame;
    u32Coef  = u32CurCoef;
    u32CoefL = u32Coef;
    u32CoefR = u32Coef;

    for(i = 0; i < pstFrame->u32SamplesPerFrame; i++)
    {
	UTILS_GainBalanceCoef(&u32CoefL, &u32CoefR, s32Balance);

	if(16 == pstFrame->u32BitPerSample)
	{
	    s32Data = (HI_S32)(*s16src);
	    *s16src = AOE_FMUL_16_Q15(s32Data, u32CoefL);
	    s16src++;
	    s32Data = (HI_S32)(*s16src);
	    *s16src = AOE_FMUL_16_Q15(s32Data, u32CoefR);
	    s16src++;
	}
	else if(24 == pstFrame->u32BitPerSample)
	{
	    s32Data = *s32src;
	    *s32src = AOE_FMUL_24_Q15(s32Data, u32CoefL);
	    s32src++;
	    s32Data = *s32src;
	    *s32src = AOE_FMUL_24_Q15(s32Data, u32CoefR);
	    s32src++;
	}
	u32Coef = (HI_U32)((HI_S32)u32Coef + s32Inc);
	u32CoefL = u32Coef;
	u32CoefR = u32Coef;
    }
}

HI_VOID UTIL_MixerPro (HI_VOID *pMixBuf, HI_VOID *pInBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;

    if (!samples)
    {
	return;
    }

    if (16 == uBitDepth)
    {
	HI_S16 mix, data;
	HI_S16 *ps16In, *ps16Out;
	ps16In	= (HI_S16 *)pInBuf;
	ps16Out = (HI_S16 *)pMixBuf;
	for (i = 0; i < samples; i++)
	{
	    data = *ps16In;
	    mix	 = *ps16Out;
	    *ps16Out = CLIPTOSHORT((HI_S32)mix + data);
	    ps16Out++;
	    ps16In++;
	}

	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 mix, data;
	HI_S32 *ps32In, *ps32Out;
	ps32In	= (HI_S32 *)pInBuf;
	ps32Out = (HI_S32 *)pMixBuf;
	for (i = 0; i < samples; i++)
	{
	    mix	 = *ps32Out;
	    data = *ps32In;
	    *ps32Out = QADD(mix, data);
	    ps32Out++;
	    ps32In++;
	}

	return;
    }
}

static HI_VOID	ChannelModeDoubleMono(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 dataL, dataR, mix;
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    dataL = *ps16In;
	    dataR = *(ps16In + 1);
	    mix = CLIPTOSHORT((HI_S32)dataL + dataR);
	    *ps16In = mix;
	    *(ps16In + 1) = mix;
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 dataL, dataR, mix;
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    dataL = *ps32In;
	    dataR = *(ps32In + 1);
	    mix = QADD(dataL, dataR);
	    *ps32In = mix;
	    *(ps32In + 1) = mix;
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeDoubleLeft(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *(ps16In + 1) = *ps16In;
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *(ps32In + 1) = *ps32In;
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeDoubleRight(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *ps16In = *(ps16In + 1);
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *ps32In = *(ps32In + 1);
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeExchange(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 data;
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    data = *ps16In;
	    *ps16In = *(ps16In + 1);
	    *(ps16In + 1) = data;
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 data;
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    data = *ps32In;
	    *ps32In = *(ps32In + 1);
	    *(ps32In + 1) = data;
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeOnlyRight(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *ps16In = 0;
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *ps32In = 0;
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeOnlyLeft(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *(ps16In + 1) = 0;
	    ps16In += 2;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples/2; i++)
	{
	    *(ps32In + 1) = 0;
	    ps32In += 2;
	}
	return;
    }
}
static HI_VOID	ChannelModeMute(HI_VOID *pPcmBuf, HI_U32 samples, HI_U32 uBitDepth)
{
    HI_U32 i;
    if (!samples)
    {
	return;
    }
    if (16 == uBitDepth)
    {
	HI_S16 *ps16In;
	ps16In	= (HI_S16 *)pPcmBuf;
	for (i = 0; i < samples; i++)
	{
	    *ps16In = 0;
	    ps16In++;
	}
	return;
    }
    else if (24 == uBitDepth)
    {
	HI_S32 *ps32In;
	ps32In	= (HI_S32 *)pPcmBuf;
	for (i = 0; i < samples; i++)
	{
	    *ps32In = 0;
	    ps32In++;
	}
	return;
    }
}
HI_VOID UTIL_ChannelModeProcess(HI_DSP_AUDFRAME_S *pstFrame, HI_U32 u32ChannelMode, HI_U32 dstBitDepth)
{
    HI_S32 samples = pstFrame->u32SamplesPerFrame * pstFrame->u32Channels;
    switch(u32ChannelMode)
    {
    case 1:    //AIP_CHANNEL_MODE_DOUBLE_MONO
	ChannelModeDoubleMono(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 2: //AIP_CHANNEL_MODE_DOUBLE_LEFT
	ChannelModeDoubleLeft(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 3: //AIP_CHANNEL_MODE_DOUBLE_RIGHT
	ChannelModeDoubleRight(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 4: //AIP_CHANNEL_MODE_EXCHANGE
	ChannelModeExchange(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 5: //AIP_CHANNEL_MODE_ONLY_RIGHT
	ChannelModeOnlyRight(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 6: //AIP_CHANNEL_MODE_ONLY_LEFT
	ChannelModeOnlyLeft(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 7: //AIP_CHANNEL_MODE_MUTED
	ChannelModeMute(pstFrame->pDataBuf, samples, dstBitDepth);
	break;
    case 0: //AIP_CHANNEL_MODE_STEREO	    //default do Nothing
	break;
    default:
	break;
    }
}

typedef struct
{
    HI_U32	  u32BitPerSample;
    HI_U32	  u32Channels;
    HI_U32	  u32InRate;
    HI_U32	  u32FadeMs;
    HI_U32	  u32FadeCurnCoefIdx;
    HI_U32	  u32FadeCnt;
    HI_U32	  u32FadeStep;
    HI_BOOL	  bStartFade;
    FADE_STATUS_E enCurnFadeStauts;
} FADE_STATE_S;

static HI_VOID	   FADEStartCheck(FADE_STATE_S *state, HI_VOID *pInBuf)
{
    if(HI_FALSE == state->bStartFade)
    {
	HI_U32 i;
	for(i = 0; i < state->u32Channels; i++)
	{
	    if(((16 == state->u32BitPerSample) && (0 != *((HI_S16 *)pInBuf))) ||
	       ((24 == state->u32BitPerSample) && (0 != *((HI_S32 *)pInBuf))))
	    {
		state->bStartFade = HI_TRUE;
		break;
	    }
	}
    }
    return;
}
HI_VOID FADE_Create(HI_VOID* *phFade, HI_U32 inRate, HI_U32 BitPerSample,
		    HI_S32 Channels)
{
    FADE_STATE_S *hFade;

    *phFade = HI_NULL;

    if ((inRate <= 0) || (inRate > 192000))
    {
	return;
    }

    if ((BitPerSample != 16) && (BitPerSample != 24))
    {
	return;
    }

    if ((Channels != 1) && (Channels != 2) && (Channels != 8))
    {
	return;
    }

    hFade = (FADE_STATE_S *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(FADE_STATE_S));
    if (NULL == hFade)
    {
	return;
    }

    adsp_memset(hFade, 0, sizeof(FADE_STATE_S));

    hFade->u32BitPerSample = BitPerSample;
    hFade->u32Channels = Channels;
    hFade->u32InRate = inRate;
    hFade->enCurnFadeStauts = FADE_STATUS_NOTE;
    *phFade = (HI_VOID *)hFade;
}

HI_VOID FADE_Flush(HI_VOID* hFade, HI_U32 inRate, HI_U32 BitPerSample,
		   HI_S32 Channels)
{
    FADE_STATE_S *state = (FADE_STATE_S *)hFade;
    HI_S32 isChange = 0;

    if ((inRate <= 0) || (inRate > 192000))
    {
	return;
    }

    if ((BitPerSample != 16) && (BitPerSample != 24))
    {
	return;
    }

    if ((Channels != 1) && (Channels != 2) && (Channels != 8))
    {
	return;
    }

    if (state)
    {
	if (state->u32BitPerSample != BitPerSample)
	{
	    isChange = 1;
	}

	if (state->u32Channels != Channels)
	{
	    isChange = 1;
	}

	if (state->u32InRate != inRate)
	{
	    isChange = 1;
	}

	if (isChange)
	{
	    state->u32BitPerSample = BitPerSample;
	    state->u32Channels = Channels;
	    state->u32InRate = inRate;
	    FADE_Active((HI_VOID *)state, state->enCurnFadeStauts, state->u32FadeMs);
	}
    }
}

HI_VOID FADE_Destroy(HI_VOID* hFade)
{
    if (hFade)
    {
	HI_ADSP_FREE(ADSP_ID_AOE, (HI_VOID*)hFade);
    }
}

HI_VOID FADE_Active(HI_VOID* hFade, FADE_STATUS_E enUserFadeStauts, HI_U32 u32FadeMs)
{
    FADE_STATE_S *state = (FADE_STATE_S *)hFade;

    if (state)
    {
	state->u32FadeMs = u32FadeMs;
	state->enCurnFadeStauts = enUserFadeStauts;
	state->u32FadeCnt  = 0;
	if(0 == u32FadeMs)
	{
	    state->u32FadeStep = 0;
	}
	else
	{
	    state->u32FadeStep = (u32FadeMs * state->u32InRate) / (1000 * (AOE_VOL_INF_COEF_IDX - AOE_VOL_0DB_COEF_IDX)) + 1 ;
	}
	if (FADE_STATUS_IN == enUserFadeStauts)
	{
	    state->u32FadeCurnCoefIdx = AOE_VOL_INF_COEF_IDX;
	    state->bStartFade = HI_FALSE;
	}
	else if (FADE_STATUS_OUT == enUserFadeStauts)
	{
	    state->u32FadeCurnCoefIdx = AOE_VOL_0DB_COEF_IDX;
	}
    }
}

HI_VOID FADE_InProcess(HI_VOID* hFade, HI_VOID *pInBuf, HI_U32 samples)
{
    FADE_STATE_S *state = (FADE_STATE_S *)hFade;
    HI_S32 samples_per_ch;
    HI_U32 Volume;

    if (HI_NULL == state)
    {
	return;
    }

    if (FADE_STATUS_NOTE == state->enCurnFadeStauts)
    {
	return;
    }

    samples_per_ch = state->u32Channels;
    while (samples)
    {
	FADEStartCheck(state, pInBuf);
	if(HI_FALSE == state->bStartFade)
	{
	    switch (state->u32BitPerSample)
	    {
	    case 16:
		pInBuf = (HI_VOID *)((HI_S16 *)pInBuf + samples_per_ch);
		break;
	    case 24:
		pInBuf = (HI_VOID *)((HI_S32 *)pInBuf + samples_per_ch);
		break;
	    }
	    samples--;
	    continue;
	}

	Volume = g_u32VolCoef[state->u32FadeCurnCoefIdx];
	switch (state->u32BitPerSample)
	{
	case 16:
	    Volume16BitPro_Coef(pInBuf, samples_per_ch, Volume);
	    pInBuf = (HI_VOID *)((HI_S16 *)pInBuf + samples_per_ch);
	    break;
	case 24:
	    Volume24BitPro_Coef(pInBuf, samples_per_ch, Volume);
	    pInBuf = (HI_VOID *)((HI_S32 *)pInBuf + samples_per_ch);
	    break;
	}

	state->u32FadeCnt++;
	samples--;
	if (state->u32FadeCnt == state->u32FadeStep)
	{
	    state->u32FadeCnt = 0;
	    if (FADE_STATUS_IN == state->enCurnFadeStauts)
	    {
		state->u32FadeCurnCoefIdx--;
		if (AOE_VOL_0DB_COEF_IDX == state->u32FadeCurnCoefIdx)
		{
		    state->enCurnFadeStauts = FADE_STATUS_NOTE;
		}
	    }
	}
    }
}

HI_VOID FADE_OutProcess(HI_VOID* hFade, HI_VOID *pInBuf, HI_U32 samples)
{
    FADE_STATE_S *state = (FADE_STATE_S *)hFade;
    HI_S32 samples_per_ch;
    HI_U32 Volume;

    if (HI_NULL == state)
    {
	return;
    }

    samples_per_ch = state->u32Channels;
    while (samples)
    {
	Volume = g_u32VolCoef[state->u32FadeCurnCoefIdx];
	switch (state->u32BitPerSample)
	{
	case 16:
	    Volume16BitPro_Coef(pInBuf, samples_per_ch, Volume);
	    pInBuf = (HI_VOID *)((HI_S16 *)pInBuf + samples_per_ch);
	    break;
	case 24:
	    Volume24BitPro_Coef(pInBuf, samples_per_ch, Volume);
	    pInBuf = (HI_VOID *)((HI_S32 *)pInBuf + samples_per_ch);
	    break;
	}

	state->u32FadeCnt++;
	samples--;
	if (state->u32FadeCnt == state->u32FadeStep)
	{
	    state->u32FadeCnt = 0;
	    if (FADE_STATUS_OUT == state->enCurnFadeStauts)
	    {
		state->u32FadeCurnCoefIdx++;
		if (AOE_VOL_INF_COEF_IDX == state->u32FadeCurnCoefIdx)
		{
		    state->enCurnFadeStauts = FADE_STATUS_NOTE;
		}
	    }
	}
    }
}

/* 32-bit pseudo-random number generator */
static inline HI_U32 Prng(HI_U32 u32Random)
{
    return (u32Random * 0x0019660dL + 0x3c6ef35fL) & 0xffffffffL;
}

/* dither routine derived from MAD winamp plugin */
static inline HI_S32 DitherLinear(HI_U32 u32Scalebits, HI_S32 s32Data, UTIL_DITHER_STATE_S *pstDither)
{
    HI_S32 s32Output, s32Mask, s32Random;

    /* noise shape */
    s32Data += pstDither->as32Error[0] - pstDither->as32Error[1] + pstDither->as32Error[2];

    pstDither->as32Error[2] = pstDither->as32Error[1];
    pstDither->as32Error[1] = pstDither->as32Error[0] / 2;

    /* bias */
    s32Output = s32Data + (1L << (u32Scalebits - 1));
    s32Mask = (1L << u32Scalebits) - 1;

    /* dither */
    s32Random = (HI_S32)Prng(pstDither->s32Random);

    s32Output += (s32Random >> (32 - u32Scalebits)) - (pstDither->s32Random >> (32 - u32Scalebits));

    pstDither->s32Random = s32Random;

    /* quantize */
    s32Output &= ~s32Mask;

    /* error feedback */
    pstDither->as32Error[0] = s32Data - s32Output;

    /* scale */
    return s32Output >> u32Scalebits;
}

HI_U32 Util_sqrt(HI_U32 u32Value)
{
    HI_U32 j;
    HI_U32 tmp = u32Value;

    HI_U32 aim = 1;

    if(u32Value ==0)
	return 0;

    for(j =0; j<16; j++)
    {
	tmp = u32Value>>j;
	if(tmp&1)
	    break;
    }
    j = j>>1;

    aim = tmp<<j;
    j = u32Value/aim;
    while((aim<j?(j-aim):(aim-j))>1)
    {
	aim = (aim+j)>>1;
	j = u32Value/aim ;
    }
    return aim;
}


HI_VOID UTIL_DRE_16BIT_Process(HI_DSP_AUDFRAME_S *pstFrame, UTIL_DRE_FILTER_STATE *pstDreState)
{
    HI_S32 j;
    HI_S32 LeftDC = 0, RightDC = 0;
    HI_S32 DcMoved = 0;
    HI_U32 SumL = 0, SumR = 0;
    HI_U32 u32LevelThd = pstDreState->s32DreThrhd;
    HI_U32 u32NrSamples = pstFrame->u32SamplesPerFrame;
    HI_S16 *ps16DataInOrg = (HI_S16 *)pstFrame->pDataBuf;
    HI_S16 *ps16DataIn = ps16DataInOrg;
    HI_S16 data = 0;
    HI_U32 u32Sourcebps = 0;
    HI_U32 u32NoiseCnt	= pstFrame->u32SampleRate * UTIL_DRE_NOISE_TIMEMS_THD / 1000;

    LeftDC  = pstDreState->s32LeftDC;
    RightDC = pstDreState->s32RightDC;
    for (j = u32NrSamples - 1; j >= 0; j--)
    {
	/* Subtract DC an saturate */
	DcMoved = *(ps16DataIn) - (LeftDC >> 16);
	if (DcMoved > 32767)
	{
	    DcMoved = 32767;
	}
	else if (DcMoved < -32768)
	{
	    DcMoved = -32768;
	}
	ps16DataIn++;
	if (DcMoved < 0)
	{
	    LeftDC -= UTIL_DRE_DC_D16_STEP;
	}
	else
	{
	    LeftDC += UTIL_DRE_DC_D16_STEP;
	}
	SumL += (DcMoved * DcMoved);

	/* Subtract DC an saturate */
	DcMoved = *(ps16DataIn) - (RightDC >> 16);
	if (DcMoved > 32767)
	{
	    DcMoved = 32767;
	}
	else if (DcMoved < -32768)
	{
	    DcMoved = -32768;
	}
	ps16DataIn++;
	if (DcMoved < 0)
	{
	    RightDC -= UTIL_DRE_DC_D16_STEP;
	}
	else
	{
	    RightDC += UTIL_DRE_DC_D16_STEP;
	}
	SumR += (DcMoved * DcMoved);
    }

    pstDreState->s32LeftDC  = LeftDC;
    pstDreState->s32RightDC = RightDC;
    if ((SumL / u32NrSamples) < u32LevelThd)
    {
	if (pstDreState->u32EnergyCntL < u32NoiseCnt)
	{
	    pstDreState->u32EnergyCntL += u32NrSamples;
	}
    }
    else
    {
	pstDreState->u32EnergyCntL = 0;
    }

    if ((SumR / u32NrSamples) < u32LevelThd)
    {
	if (pstDreState->u32EnergyCntR < u32NoiseCnt)
	{
	    pstDreState->u32EnergyCntR += u32NrSamples;
	}
    }
    else
    {
	pstDreState->u32EnergyCntR = 0;
    }

    u32Sourcebps = pstFrame->u32BitPerSample;
    if(pstDreState->u32Decbps >= u32Sourcebps)
	return;

    if (pstDreState->u32EnergyCntL >= u32NoiseCnt)
    {
	ps16DataIn = ps16DataInOrg;
	for (j = u32NrSamples - 1; j >= 0; j--)
	{
	    data = *(ps16DataIn);
	    data = (HI_S16)DitherLinear(pstDreState->u32Decbps, (HI_S32)data, &pstDreState->stDither);
	    *(ps16DataIn) = data;
	    ps16DataIn += 2;
	}
    }

    if (pstDreState->u32EnergyCntR >= u32NoiseCnt)
    {
	ps16DataIn = ps16DataInOrg + 1;
	for (j = u32NrSamples - 1; j >= 0; j--)
	{
	    data = *(ps16DataIn);
	    data = (HI_S16)DitherLinear(pstDreState->u32Decbps, (HI_S32)data, &pstDreState->stDither);
	    *(ps16DataIn) = data;
	    ps16DataIn += 2;
	}
    }
}
