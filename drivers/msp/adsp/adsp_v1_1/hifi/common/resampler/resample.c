/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include "hi_dsp_mem.h"
#include "hi_dsp_basicop.h"
#include "hi_dsp_linear.h"
#include "hi_dsp_resampler.h"
#include "resample_cfg.h"
#ifndef HI_RESAMPLER_QUALITY_LINEAR
#include "resample_rom.h"
#endif

#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
 #include "kaiser.h"
#endif


#include "adsp_osal_ext.h"

/* filter state */
typedef struct
{
    int	     up;
    int	     dn;
    int	     inrate;
    int	     outrate;
    int	     nchans;
    int	     nwing;
    int	     nhist;
    int	     phase;
    int	     offset;
    int	     isCloned;
    int	     bitwidth;	// indicate bit width
    short   *histbuf;	// for 24bit width
    short   *pcmbuf;	// for 24bit width
    int	  *  histbuf32; // for 24bit width
    int	  *  pcmbuf32;	// for 24bit width
    short *  lwingptr;
    short *  rwingptr;
    short *  filter;
    int	  *  nextphase;
    HI_S32   isForec2Out32bit;
    int	     isLinearMode;
    HI_VOID* hLSRC;

} state_t;

#ifndef HI_RESAMPLER_QUALITY_LINEAR

#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
typedef struct
{
    int			inrate;
    int			outrate;
    int			quality;
    int			nwing;
    const signed int   *nextphase;
    const signed short *filter;
} SRC_Info;

static SRC_Info resampler_info[] = {
 #ifdef ENA_QUALITY_LOW
    { 32000, 48000, QUALITY_LOW,     4, res_32_48_low_nextphasetab,  res_32_48_low_filttab },
    { 44100, 48000, QUALITY_LOW,     4, res_44_48_low_nextphasetab,  res_44_48_low_filttab },
    { 48000, 48000, QUALITY_LOW,     8, res_48_48_nextphasetab,	     res_48_48_good_filttab },
 #endif

 #ifdef ENA_QUALITY_MEDIUM
    { 32000, 48000, QUALITY_MEDIUM,  8, res_32_48_mid_nextphasetab,  res_32_48_mid_filttab },
    { 44100, 48000, QUALITY_MEDIUM,  8, res_44_48_mid_nextphasetab,  res_44_48_mid_filttab },
    { 48000, 48000, QUALITY_MEDIUM,  8, res_48_48_nextphasetab,	     res_48_48_good_filttab },

    /* no good quality, actully quality mid, 8000->11025, mid_nextphasetab equals to good_nextphasetab*/
    {  8000, 11025, QUALITY_GOOD,    8, res_8_11_good_nextphasetab,  res_8_11_mid_filttab },

    /* no good quality, actully quality mid, 16000->22050, mid_nextphasetab equals to good_nextphasetab */
    { 16000, 22050, QUALITY_GOOD,    8, res_8_11_good_nextphasetab,  res_8_11_mid_filttab },

    /* no good quality, actully quality mid, 8000->22050, mid_nextphasetab equals to good_nextphasetab */
    {  8000, 22050, QUALITY_GOOD,    8, res_8_22_good_nextphasetab,  res_8_22_mid_filttab },

    /* no good quality, actully quality mid, 16000->44100, mid_nextphasetab equals to good_nextphasetab*/
    { 16000, 44100, QUALITY_GOOD,    8, res_8_22_good_nextphasetab,  res_8_22_mid_filttab },

    /* no good quality, actully quality mid, 8000->44100, mid_nextphasetab equals to good_nextphasetab */
    {  8000, 44100, QUALITY_GOOD,    8, res_8_44_good_nextphasetab,  res_8_44_mid_filttab },

    /* no good quality, actully quality mid, 11025->12000, mid_nextphasetab equals to good_nextphasetab */
    { 11025, 12000, QUALITY_GOOD,    8, res_11_12_good_nextphasetab, res_11_12_mid_filttab },

    /* no good quality, actully quality mid, 22050->24000, mid_nextphasetab equals to good_nextphasetab */
    { 22050, 24000, QUALITY_GOOD,    8, res_11_12_good_nextphasetab, res_11_12_mid_filttab },

    /* no good quality, actully quality mid 11025->16000, mid_nextphasetab equals to good_nextphasetab */
    { 11025, 16000, QUALITY_GOOD,    8, res_11_16_good_nextphasetab, res_11_16_mid_filttab },

    /* no good quality, actully quality mid 22050->32000, mid_nextphasetab equals to good_nextphasetab */
    { 22050, 32000, QUALITY_GOOD,    8, res_11_16_good_nextphasetab, res_11_16_mid_filttab },

    /* no good quality, actully quality mid 11025->24000, mid_nextphasetab equals to good_nextphasetab */
    { 11025, 24000, QUALITY_GOOD,    8, res_11_24_good_nextphasetab, res_11_24_mid_filttab },

    /* no good quality, actully quality mid 22050->48000, mid_nextphasetab equals to good_nextphasetab */
    { 22050, 48000, QUALITY_GOOD,    8, res_11_24_good_nextphasetab, res_11_24_mid_filttab },

    /* no good quality, actully quality mid 11025->32000, mid_nextphasetab equals to good_nextphasetab */
    { 11025, 32000, QUALITY_GOOD,    8, res_11_32_good_nextphasetab, res_11_32_mid_filttab },

    /* no good quality, actully quality mid 11025->48000, mid_nextphasetab equals to good_nextphasetab */
    { 11025, 48000, QUALITY_GOOD,    8, res_11_48_good_nextphasetab, res_11_48_mid_filttab },

    /* no good quality, actully quality mid 12000->22050, mid_nextphasetab equals to good_nextphasetab */
    { 12000, 22050, QUALITY_GOOD,    8, res_12_22_good_nextphasetab, res_12_22_mid_filttab },

    /* no good quality, actully quality mid 24000->44100, mid_nextphasetab equals to good_nextphasetab */
    { 24000, 44100, QUALITY_GOOD,    8, res_12_22_good_nextphasetab, res_12_22_mid_filttab },

    /* no good quality, actully quality mid 12000->44100, mid_nextphasetab equals to good_nextphasetab */
    { 12000, 44100, QUALITY_GOOD,    8, res_12_44_good_nextphasetab, res_12_44_mid_filttab },
 #endif

 #ifdef ENA_QUALITY_GOOD
    {  8000, 12000, QUALITY_GOOD,    16, res_8_12_good_nextphasetab,  res_8_12_good_filttab },
    {  8000, 16000, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },
    {  8000, 24000, QUALITY_GOOD,    16, res_8_24_good_nextphasetab,  res_8_24_good_filttab },
    {  8000, 32000, QUALITY_GOOD,    16, res_8_32_good_nextphasetab,  res_8_32_good_filttab },
    {  8000, 48000, QUALITY_GOOD,    16, res_8_48_good_nextphasetab,  res_8_48_good_filttab },

    { 11025, 22050, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },
    { 11025, 44100, QUALITY_GOOD,    16, res_8_32_good_nextphasetab,  res_8_32_good_filttab },

    { 12000, 16000, QUALITY_GOOD,    16, res_12_16_good_nextphasetab, res_12_16_good_filttab },

    { 12000, 24000, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },
    { 12000, 32000, QUALITY_GOOD,    16, res_12_32_good_nextphasetab, res_12_32_good_filttab },
    { 12000, 48000, QUALITY_GOOD,    16, res_8_32_good_nextphasetab,  res_8_32_good_filttab },

    { 16000, 24000, QUALITY_GOOD,    16, res_8_12_good_nextphasetab,  res_8_12_good_filttab },
    { 16000, 32000, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },
    { 16000, 48000, QUALITY_GOOD,    16, res_8_24_good_nextphasetab,  res_8_24_good_filttab },

    { 22050, 44100, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },
    { 24000, 32000, QUALITY_GOOD,    16, res_12_16_good_nextphasetab, res_12_16_good_filttab },
    { 24000, 48000, QUALITY_GOOD,    16, res_8_16_good_nextphasetab,  res_8_16_good_filttab },

    { 32000, 44100, QUALITY_GOOD,    16, res_8_11_good_nextphasetab,  res_8_11_good_filttab },
    { 32000, 48000, QUALITY_GOOD,    16, res_8_12_good_nextphasetab,  res_8_12_good_filttab },
#if defined(OPTIMIZE_44K_RES_48K)
    { 44100, 48000, QUALITY_GOOD,    36, res_11_12_good_nextphasetab, res_11_12_good_filttab },
#else
    { 44100, 48000, QUALITY_GOOD,    16, res_11_12_good_nextphasetab, res_11_12_good_filttab },
#endif
    { 48000, 48000, QUALITY_GOOD,    8, res_48_48_nextphasetab,	     res_48_48_good_filttab },
 #endif
};
#endif

#ifndef ASSERT
 #if defined (_WIN32) && defined (_M_IX86) && (defined (_DEBUG) || defined (REL_ENABLE_ASSERTS))
  #define ASSERT(x) if (!(x)) __asm int 3;
 #else
  #define ASSERT(x)/* do nothing */
 #endif
#endif

static HI_S32 ResamplerStereoProcess24(HI_VOID* inst, HI_S32 *inbuf, HI_S32 insamps, HI_S32 *outbuf,
				       HI_S32 bInterleaved);

/* defaults */

#define DEF_ATTEN 90.0f

#define DEF_PASSBAND 0.88f
#define DEF_STOPBAND 1.0f
#define DEF_DCGAIN 1.0f

/*
 * Compute greatest common divisor.
 */
static int gcd(int a, int b)
{
    while (a != b)
    {
	if (a > b)
	{
	    a -= b;
	}
	else
	{
	    b -= a;
	}
    }

    return a;
}

#define M2_30 1073741824.0
#define M2_31 2147483648.0

#define MAX_DBL 2147483647.0
#define MIN_DBL -2147483648.0

#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
static short NormAndRound(double x, double q)
{
    if (x >= 0.0)
    {
	x = (x * q + 0.5);
    }
    else
    {
	x = (x * q - 0.5);
    }

    /* clip */
    if (x > MAX_DBL)
    {
	x = MAX_DBL;
    }

    if (x < MIN_DBL)
    {
	x = MIN_DBL;
    }

    return (short)(((int)x) >> 16);
}

#endif

static int cvtShortShort(void *d, const void *s, int n, int bInterleaved, int chans )
{
    short* dst = (short *)d;

    /* 16bit process */
    if ((HI_FALSE == bInterleaved) && (RESAMPLER_STEREO == chans))
    {
	const short* src = (const short *)s;
	const short* srcEnd = src + n;
	const short* src_R = srcEnd;
	while (src != srcEnd)
	{
	    *dst = *src;
	    src += 1;
	    dst	  += 1;
	    *dst   = *src_R;
	    src_R += 1;
	    dst += 1;
	}
    }
    else
    {
	const short* src = (const short *)s;
	const short* srcEnd;
	if (chans == 2)
	{
	    n *= 2;
	}

	srcEnd = src + n;

	while (src != srcEnd)
	{
	    *dst = *src;
	    src += 1;
	    dst += 1;
	}
    }
    return (dst - (short *)d);
}

static int cvt2int(void *d, const void *s, int n, int bitdepth, int bInterleaved, int chans )
{
    int* dst = (int *)d;

    /* 16bit by 32 bit unified treatment */
    if ((HI_FALSE == bInterleaved) && (RESAMPLER_STEREO == chans))
    {
	if (bitdepth == 16)
	{
	    const short* src = (const short *)s;
	    const short* srcEnd = src + n;
	    const short* src_R = srcEnd;
	    while (src != srcEnd)
	    {
		*dst = *src << 16;
		src += 1;
		dst   += 1;
		*dst   = *src_R << 16;
		src_R += 1;
		dst += 1;
	    }
	}
	else
	{
	    const int* src = (const int *)s;
	    const int* srcEnd = src + n;
	    const int* src_R = srcEnd;
	    while (src != srcEnd)
	    {
		*dst = *src;
		src += 1;
		dst   += 1;
		*dst   = *src_R;
		src_R += 1;
		dst += 1;
	    }
	}
    }
    else
    {
	if (chans == 2)
	{
	    n *= 2;
	}

	if (bitdepth == 16)
	{
	    const short* src = (const short *)s;
	    const short* srcEnd = src + n;
	    while (src != srcEnd)
	    {
		*dst = *src << 16;
		src += 1;
		dst += 1;
	    }
	}
	else
	{
	    const int* src = (const int *)s;
	    const int* srcEnd = src + n;
	    while (src != srcEnd)
	    {
		*dst = *src;
		src += 1;
		dst += 1;
	    }
	}
    }

    return dst - (int *)d;
}

static HI_VOID* RAInitResamplerRat(int inrate, int outrate, int nchans,
#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
				     int atten, int passband, int stopband, int dcgain, int quality, int bitwidth,
				     int isForec2Out32bit)
#else
				     float atten, float passband, float stopband, float dcgain, int quality,
				     int bitwidth)
#endif
{
    state_t *s;
    int divisor, up, dn, nhist;
    int i, nwing, ntaps;

#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
    int phase, nfilter;
    float beta, fpass, fstop;
    double *lpfilt;
#endif

    if ((nchans < 1) || (nchans > 2))
    {
	return HI_NULL;
    }

    if (passband >= stopband)
    {
	return HI_NULL;
    }

    /* reduce to smallest fraction */
    divisor = gcd(inrate, outrate);
    up = outrate / divisor;
    dn = inrate / divisor;
    if (up > 1280)
    {
	return HI_NULL;
    }			/* supports standard rates to 96000Hz */

    if (nchans * ((dn + up - 1) / up) > 255)
    {
	return HI_NULL;
    }			/* pcmstep exceeds short */

#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
    /* use defaults for values <= 0 */
    if (atten <= 0.0f)
    {
	atten = DEF_ATTEN;
    }

    if (passband <= 0.0f)
    {
	passband = DEF_PASSBAND;
    }

    if (stopband <= 0.0f)
    {
	stopband = DEF_STOPBAND;
    }

    if (dcgain <= 0.0f)
    {
	dcgain = DEF_DCGAIN;
    }

    /* compute the filter specs */
    fstop = 1.0f / MAX(up, dn);
    fpass = passband * fstop;
    fstop = stopband * fstop;

    KaiserEstim(fpass, fstop, atten, &nfilter, &beta);

    ntaps   = (nfilter + up - 1) / up;/* length of each filter phase */
    nwing   = (ntaps + 1) / 2;
    ntaps   = nwing * 2;	    /* update ntaps */
    nfilter = nwing * up;	    /* update nfilter */
    nhist = nchans * ntaps;
    s = (state_t *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(state_t));
    s->isCloned = 0;
    s->bitwidth = bitwidth;


    if (s->bitwidth == IN_PCM_16BIT_RAW)
    {
	if (isForec2Out32bit)
	{
	    s->histbuf32 = (int *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + nhist) * sizeof(int));
	    s->pcmbuf32 = s->histbuf32 + nhist;
	}
	else
	{
	    s->histbuf = (short *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + nhist) * sizeof(short));
	    s->pcmbuf = s->histbuf + nhist;
	}
    }
    else if (s->bitwidth == IN_PCM_24BIT_RAW)
    {
	s->histbuf32 = (int *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + nhist) * sizeof(int));
	s->pcmbuf32 = s->histbuf32 + nhist;
    }

    /* malloc buffers */
    lpfilt = (double *) HI_ADSP_MALLOC(ADSP_ID_AOE, nfilter * sizeof(double));

    /* create the lowpass filter */
    KaiserLowpass(nfilter, 0.5f * (fpass + fstop), beta, (dcgain * up), lpfilt);

    /* deinterleave into phases */
    s->filter = (short *) HI_ADSP_MALLOC(ADSP_ID_AOE, nfilter * sizeof(short));
    for (phase = 0; phase < up; phase++)
    {
	for (i = 0; i < nwing; i++)
	{
	    s->filter[phase * nwing + i] = NormAndRound(lpfilt[i * up + phase], M2_31);
	}
    }

    HI_ADSP_FREE(ADSP_ID_AOE,lpfilt);

    s->nextphase = (int *) HI_ADSP_MALLOC(ADSP_ID_AOE, up * sizeof(int));

    /* lookup tables, driven by phase */
    for (i = 0; i < up; i++)
    {
	int pcmstep;
	phase	= (i * dn) % up;
	pcmstep = nchans * ((((i + 1) * dn) / up) - ((i * dn) / up));
	s->nextphase[phase] = (pcmstep & 0xff) | ((((up - 1 - (((i + 1) * dn) % up))) << 8) & 0xfff00L) \
			      | (((((i + 1) * dn) % up) << 20) & 0xfff00000L);
    }

#else
    {
	SRC_Info *srcinfoptr = resampler_info;
	int size = sizeof(resampler_info) / sizeof(SRC_Info);
 #ifdef NEW_RATE_SUPPORT
	for (i = 0; i < size; i++)
	{
	    if ((srcinfoptr->inrate == inrate) && (srcinfoptr->outrate == outrate) \
		&& (srcinfoptr->quality == quality))
	    {
		break;
	    }

	    if ((srcinfoptr->inrate == inrate / 2) && (srcinfoptr->outrate == outrate / 2) \
		&& (srcinfoptr->quality == quality))
	    {
		break;
	    }

	    if ((srcinfoptr->inrate == inrate / 4) && (srcinfoptr->outrate == outrate / 4) \
		&& (srcinfoptr->quality == quality))
	    {
		break;
	    }

	    srcinfoptr++;
	}

 #else
	for (i = 0; i < size; i++)
	{
	    if ((srcinfoptr->inrate == inrate) && (srcinfoptr->outrate == outrate) \
		&& (srcinfoptr->quality == quality))
	    {
		break;
	    }

	    srcinfoptr++;
	}
 #endif


	if (i == size)
	{
	    return HI_NULL;
	}

	nwing = srcinfoptr->nwing;
	ntaps = nwing * 2;	    /* update ntaps */
	nhist = nchans * ntaps;
	s = (state_t *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(state_t));
	if (HI_NULL == s)
	{
	    return HI_NULL; //for fix MOTO
	}
	s->filter = (short*)srcinfoptr->filter;
	s->nextphase = (int*)srcinfoptr->nextphase;
	s->isCloned = 0;
	s->bitwidth = bitwidth; // save bit width info

	/* 16bit by 32 bit unified treatment */
	if (s->bitwidth == IN_PCM_16BIT_RAW)
	{
	    if (isForec2Out32bit)
	    {
		s->histbuf32 = (int *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + 64) * sizeof(int));
		if (HI_NULL == s->histbuf32)
		{
		    HI_ADSP_FREE(ADSP_ID_AOE,s);
		    return HI_NULL; //for fix
		}
		adsp_memset(s->histbuf32,0,nhist*sizeof(int));
		s->pcmbuf32 = s->histbuf32 + nhist;
	    }
	    else
	    {
		s->histbuf = (short *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + nhist) * sizeof(short));
		if (HI_NULL == s->histbuf)
		{
		    HI_ADSP_FREE(ADSP_ID_AOE,s);
		    return HI_NULL; //for fix
		}
		adsp_memset(s->histbuf,0,nhist*sizeof(short));
		s->pcmbuf = s->histbuf + nhist;
	    }
	}
	else if ((s->bitwidth == IN_PCM_24BIT_RAW)
		 || (s->bitwidth == IN_PCM_20BIT_RAW)
		 || (s->bitwidth == IN_PCM_18BIT_RAW))
	{
	    s->histbuf32 = (int *) HI_ADSP_MALLOC(ADSP_ID_AOE, (NBLOCK + 64) * sizeof(int));
	    if (HI_NULL == s->histbuf32)
	    {
		HI_ADSP_FREE(ADSP_ID_AOE,s);
		return HI_NULL; //for fix
	    }
	    adsp_memset(s->histbuf32,0,nhist*sizeof(int));
	    s->pcmbuf32 = s->histbuf32 + nhist;
	}
    }
#endif	/* CONFIG_RES_GENERATE_TRIGTABS_FLOAT */

    /* filter init */
    s->inrate  = inrate;
    s->outrate = outrate;
    s->up = up;
    s->dn = dn;
    s->nchans = nchans;
    s->nwing	= nwing;
    s->nhist	= nhist;
    s->phase	= 0;
    s->offset	= 0;
    s->rwingptr = (short*)(&s->filter[s->phase]);
    s->lwingptr = (short*)(&s->filter[nwing * (up - 1 - s->phase)]);
    s->isForec2Out32bit = isForec2Out32bit;

    s->isLinearMode = 0;
    s->hLSRC = HI_NULL;
    return (HI_VOID *) s;
}


static void ResampleFlush_Core(HI_VOID* inst)
{
    state_t *s = (state_t *)inst;

    if (s != HI_NULL)
    {
	s->phase    = 0;
	s->offset   = 0;
	s->rwingptr = (short*)(&s->filter[s->phase]);
	s->lwingptr = (short*)(&s->filter[s->nwing * (s->up - 1 - s->phase)]);
	s->isCloned = 0;
	if (s->bitwidth == IN_PCM_16BIT_RAW)
	{
	    if (s->isForec2Out32bit)
	    {
		adsp_memset(s->histbuf32, 0, (NBLOCK + s->nhist) * sizeof(int));
		s->pcmbuf32 = s->histbuf32 + s->nhist;
	    }
	    else
	    {
		adsp_memset(s->histbuf, 0, (NBLOCK + s->nhist) * sizeof(short));
		s->pcmbuf = s->histbuf + s->nhist;
	    }
	}
	else if ((s->bitwidth == IN_PCM_24BIT_RAW)
		 || (s->bitwidth == IN_PCM_20BIT_RAW)
		 || (s->bitwidth == IN_PCM_18BIT_RAW))
	{
	    adsp_memset(s->histbuf32, 0, (NBLOCK + s->nhist) * sizeof(int));
	    s->pcmbuf32 = s->histbuf32 + s->nhist;
	}
    }
}

static void ResamplerFree_Core(HI_VOID* inst)
{
    state_t *s = (state_t *)inst;

    if (s != HI_NULL)
    {
	if (!s->isCloned)
	{
#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
	    if (s->filter)
	    {
		HI_ADSP_FREE(ADSP_ID_AOE,s->filter);
	    }

	    if (s->nextphase)
	    {
	       HI_ADSP_FREE(ADSP_ID_AOE,s->nextphase);
	    }
#endif

	}

	if (s->bitwidth == IN_PCM_16BIT_RAW)
	{
	    if (s->isForec2Out32bit)
	    {
		if (s->histbuf32)
		{
		    HI_ADSP_FREE(ADSP_ID_AOE,s->histbuf32);
		}
	    }
	    else
	    {
		if (s->histbuf)
		{
		    HI_ADSP_FREE(ADSP_ID_AOE,s->histbuf);
		}
	    }
	}
	else if ((s->bitwidth == IN_PCM_24BIT_RAW)
		 || (s->bitwidth == IN_PCM_20BIT_RAW)
		 || (s->bitwidth == IN_PCM_18BIT_RAW))
	{
	    if (s->histbuf32)
	    {
		HI_ADSP_FREE(ADSP_ID_AOE,s->histbuf32);
	    }
	}

	HI_ADSP_FREE(ADSP_ID_AOE,s);
    }
}

static int ResamplerStereoProcess16(HI_VOID* inst, int *inbuf, int insamps, short *outbuf, HI_S32 bInterleaved)
{
    state_t *s = (state_t *)inst;
    short *pcmptr, *pcmend;
    int	  *rwingptr, *lwingptr;
    short *outptr;
    int *xptr, *yptr;
    int acc0, acc1;
    int i;
    //int up = s->up;
    int phase = s->phase;
    int nwing = s->nwing;
    short pcmstep;
    int	  *nextphase = s->nextphase;

    ASSERT(!(insamps & 0x1));	       /* stereo must be even */
    ASSERT(!((int)s->filter & 0x3));	/* filter addr must be even */
    ASSERT(s->offset == 0);

    /* convert input to float */
    insamps = cvtShortShort(s->pcmbuf, (short*)inbuf, insamps, bInterleaved, RESAMPLER_STEREO);

    /* restore filter state */
    pcmptr  = ((short*)s->pcmbuf) - RESAMPLER_STEREO * (nwing - 1);
    pcmend  = pcmptr + insamps;
    pcmptr += s->offset;
    outptr   = (short *)outbuf;
    rwingptr = (int*)s->rwingptr;
    lwingptr = (int*)s->lwingptr;

    /* filter */
    while (pcmptr < pcmend)
    {
	int x, y, cx, cy;

	xptr = (int*)(pcmptr - 2);
	yptr = (int*)(pcmptr + 0);
	acc0 = acc1 = 0;

	for (i = 0; i < nwing; i += 2)
	{
	    cx = *rwingptr++;
	    cy = *lwingptr++;
	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA16BB(acc0, x, cx);
	    acc1 = MLA16TB(acc1, x, cx);
	    acc0 = MLA16BB(acc0, y, cy);
	    acc1 = MLA16TB(acc1, y, cy);

	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA16BT(acc0, x, cx);
	    acc1 = MLA16TT(acc1, x, cx);
	    acc0 = MLA16BT(acc0, y, cy);
	    acc1 = MLA16TT(acc1, y, cy);
	}

	*outptr++ = saturate_16bit((int)((acc0 + 0x4000) >> 15));
	*outptr++ = saturate_16bit((int)((acc1 + 0x4000) >> 15));

	phase	= nextphase[phase];
	pcmstep = (phase & 0xff);
	pcmptr += pcmstep;

	lwingptr = (int*)(s->filter + nwing * ((phase >> 8) & 0xfff));
	rwingptr = (int*)(s->filter + nwing * ((phase >> 20) & 0xfff));
	phase >>= 20;
    }

    /* save filter state */
    s->phase	= phase;
    s->offset	= pcmptr - pcmend;
    s->rwingptr = (short*)rwingptr;
    s->lwingptr = (short*)lwingptr;
    adsp_memmove(s->histbuf, s->histbuf + insamps, s->nhist * sizeof(short));

    return (outptr - outbuf) / RESAMPLER_STEREO;
}

static int ResamplerMonoProcess16(HI_VOID* inst, short *inbuf, int insamps, short *outbuf, HI_S32 bInterleaved)
{
    state_t *s = (state_t *)inst;
    short *pcmptr, *pcmend;
    int	  *rwingptr, *lwingptr;
    short *outptr;
    short *xptr, *yptr;
    int acc0, acc1;
    int i;
    //int up = s->up;
    int phase = s->phase;
    int nwing = s->nwing;
    int pcmstep;
    int *nextphase = s->nextphase;

    /* convert input to delayline */
    insamps = cvtShortShort(s->pcmbuf, inbuf, insamps, bInterleaved, RESAMPLER_MONO);

    /* restore filter state */
    pcmptr  = ((short*)s->pcmbuf) - (nwing - 1);
    pcmend  = pcmptr + insamps;
    pcmptr += s->offset;
    outptr   = (short *)outbuf;
    rwingptr = (int*)s->rwingptr;
    lwingptr = (int*)s->lwingptr;

    /* filter */
    while (pcmptr < pcmend)
    {
	int x, y, cx, cy;
	xptr = (pcmptr - 1);
	yptr = (pcmptr + 0);

	acc0 = acc1 = 0;

	for (i = 0; i < nwing; i += 2)
	{
	    cx = *rwingptr++;
	    cy = *lwingptr++;
	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA16BB(acc0, x, cx);
	    acc1 = MLA16BB(acc1, y, cy);

	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA16BT(acc0, x, cx);
	    acc1 = MLA16BT(acc1, y, cy);
	}

	acc0 += acc1;
	*outptr++ = saturate_16bit((int)((acc0 + 0x4000) >> 15));

	phase = nextphase[phase];
#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
	pcmstep = (phase & 0xff);
#else
	pcmstep = ((phase & 0xff) >> 1);     /* use same table of stereo */
#endif
	pcmptr	+= pcmstep;
	lwingptr = (int*)(s->filter + nwing * ((phase >> 8) & 0xfff));
	rwingptr = (int*)(s->filter + nwing * ((phase >> 20) & 0xfff));
	phase >>= 20;
    }

    /* save filter state */
    s->phase	= phase;
    s->offset	= pcmptr - pcmend;
    s->rwingptr = (short*)rwingptr;
    s->lwingptr = (short*)lwingptr;
    adsp_memmove(s->histbuf, s->histbuf + insamps, s->nhist * sizeof(short));

    return (outptr - outbuf);
}


#if 1

static void x5_filter_nobypass(int *pcmptr32, int *pcmend32, int nwing, int **prwingptr, int **plwingptr,
			       int *inbuf, int **poutptr, short *filter, int *nextphase, int *pphase,
			       int insamps, int bitwidth)
{
    int *xptr, *yptr;
    int i;
    int acc0, acc1;
    int pcmstep;
    int *rwingptr = *prwingptr;
    int *lwingptr = *plwingptr;
    int *outptr = *poutptr;
    int phase = *pphase;

    /* filter */
    while (pcmptr32 < pcmend32)
    {
	int x, y, cx, cy;
	xptr = (int*)(pcmptr32 - 1);
	yptr = (int*)(pcmptr32 + 0);

	acc0 = acc1 = 0;
	for (i = 0; i < nwing; i += 2)
	{
	    cx = *rwingptr++;
	    cy = *lwingptr++;
	    x = *xptr--;
	    y = *yptr++;
	    acc1 = MLA32_16B(acc1, x, cx);
	    acc0 = MLA32_16B(acc0, y, cy);

	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA32_16B(acc0, x, cx);
	    acc1 = MLA32_16B(acc1, y, cy);

	    x = *xptr--;
	    y = *yptr++;
	    acc1 = MLA32_16T(acc1, x, cx);
	    acc0 = MLA32_16T(acc0, y, cy);

	    x = *xptr--;
	    y = *yptr++;
	    acc0 = MLA32_16T(acc0, x, cx);
	    acc1 = MLA32_16T(acc1, y, cy);
	}

	// conever to IN_PCM_24BIT_RAW
	{
	    int sign;

	    //acc0 >>= 7;
	    acc0 = (acc0 + 0x40) >> 7;
	    sign = acc0 >> 31;
	    if ((acc0 >> 23) != sign)
	    {
		acc0 = sign ^ ((1 << 23) - 1);
	    }
	    else
	    {
		acc0 &= 0xffffff;
	    }

	    *outptr++ = acc0 << 8;

	    //acc1 >>= 7;
	    acc1 = (acc1 + 0x40) >> 7;
	    sign = acc1 >> 31;
	    if ((acc1 >> 23) != sign)
	    {
		acc1 = sign ^ ((1 << 23) - 1);
	    }
	    else
	    {
		acc1 &= 0xffffff;
	    }

	    *outptr++ = acc1 << 8;
	}
	phase = nextphase[phase];
	lwingptr = (int*)(filter + nwing * ((phase >> 8) & 0xfff));
	rwingptr = (int*)(filter + nwing * ((phase >> 20) & 0xfff));
	pcmstep	  = (phase & 0xff);
	pcmptr32 += pcmstep;
	phase >>= 20;
    }

    *prwingptr = rwingptr;
    *plwingptr = lwingptr;
    *poutptr = outptr;
    *pphase = phase;
}

#else
extern	x5_filter_nobypass(HI_S32 *pcmptr32, HI_S32 *pcmend32, HI_S32 nwing, HI_S32 **prwingptr, HI_S32 **plwingptr,
			   HI_S32 *inbuf, HI_S32 **poutptr, short *filter, HI_S32 *nextphase, HI_S32 *pphase,
			   HI_S32 insamps, HI_S32 bitwidth);
#endif

static HI_S32 ResamplerStereoProcess24(HI_VOID* inst, HI_S32 *inbuf, HI_S32 insamps, HI_S32 *outbuf,
				       HI_S32 bInterleaved)
{
    state_t *s = (state_t *)inst;
    HI_S32 *pcmptr32, *pcmend32;
    HI_S32 *rwingptr, *lwingptr;
    HI_S32 *outptr;
    HI_S32 phase = s->phase;
    HI_S32 nwing = s->nwing;
    HI_S32   *nextphase = s->nextphase;

    ASSERT(!(insamps & 0x1));	       /* stereo must be even */
    ASSERT(!((HI_S32)s->filter & 0x3)); /* filter addr must be even */
    ASSERT(s->offset == 0);

    /* convert input to float */
    insamps = cvt2int(s->pcmbuf32, inbuf, insamps, s->bitwidth, bInterleaved, RESAMPLER_STEREO);

    /* restore filter state */
    pcmptr32  = s->pcmbuf32 - RESAMPLER_STEREO * (nwing - 1);
    pcmend32  = pcmptr32 + insamps;
    pcmptr32 += s->offset;

    outptr   = outbuf;
    rwingptr = (HI_S32*)s->rwingptr;
    lwingptr = (HI_S32*)s->lwingptr;

    x5_filter_nobypass(pcmptr32, pcmend32, nwing, &rwingptr, &lwingptr,
		       inbuf, &outptr, s->filter, nextphase, &phase, insamps, s->bitwidth);

    /* save filter state */
    s->phase	= phase;
    s->offset	= 0;
    s->rwingptr = (short*)rwingptr;
    s->lwingptr = (short*)lwingptr;

    adsp_memmove(s->histbuf32, s->histbuf32 + insamps, s->nhist * sizeof(HI_S32));

    return (outptr - outbuf) / RESAMPLER_STEREO;
}

static int ResamplerMonoProcess24(HI_VOID* inst, int *inbuf, int insamps, int *outbuf)
{
    state_t *s = (state_t *)inst;
    int *pcmptr32, *pcmend32;
    int	  *rwingptr, *lwingptr;
    int *outptr;
    int *xptr32, *yptr32;
    int acc0, acc1;
    int i;
    int phase = s->phase;
    int nwing = s->nwing;
    int pcmstep;
    int *nextphase = s->nextphase;

    /* convert input to delayline */
    insamps = cvt2int(s->pcmbuf32, inbuf, insamps, s->bitwidth, HI_TRUE, RESAMPLER_MONO);

    pcmptr32  = s->pcmbuf32 - (nwing - 1);
    pcmend32  = pcmptr32 + insamps;
    pcmptr32 += s->offset;

    outptr   = outbuf;
    rwingptr = (int*)s->rwingptr;
    lwingptr = (int*)s->lwingptr;

    {
	/* filter */
	while (pcmptr32 < pcmend32)
	{
	    int x, y, cx, cy;
	    xptr32 = pcmptr32 - 1;
	    yptr32 = pcmptr32 + 0;
	    acc0 = acc1 = 0;

	    for (i = 0; i < nwing; i += 2)
	    {
		cx = *rwingptr++;
		cy = *lwingptr++;
		x = *xptr32--;
		y = *yptr32++;
		acc0 = MLA32_16B(acc0, x, cx);
		acc1 = MLA32_16B(acc1, y, cy);

		x = *xptr32--;
		y = *yptr32++;
		acc0 = MLA32_16T(acc0, x, cx);
		acc1 = MLA32_16T(acc1, y, cy);
	    }

	    acc0 += acc1;
	    if (s->bitwidth == IN_PCM_16BIT_RAW)
	    {
		*outptr++ = saturate_16bit((int)((acc0 + 0x4000) >> 15));
	    }
	    else if (s->bitwidth == IN_PCM_18BIT_RAW)
	    {
		int sign;

		//acc0 >>= 13;
		acc0 = (acc0 + 0x1000) >> 13;
		sign = acc0 >> 31;
		if ((acc0 >> 17) != sign)
		{
		    acc0 = sign ^ ((1 << 17) - 1);
		}
		else
		{
		    acc0 &= 0x3ffff;
		}

		*outptr++ = acc0;
	    }
	    else if (s->bitwidth == IN_PCM_20BIT_RAW)
	    {
		int sign;

		//acc0 >>= 13;
		acc0 = (acc0 + 0x400) >> 11;
		sign = acc0 >> 31;
		if ((acc0 >> 19) != sign)
		{
		    acc0 = sign ^ ((1 << 19) - 1);
		}
		else
		{
		    acc0 &= 0xfffff;
		}

		*outptr++ = acc0;
	    }
	    else
	    {
		int sign;
		acc0 += 0x40;
		acc0 >>= 7;
		sign = acc0 >> 31;
		if ((acc0 >> 23) != sign)
		{
		    acc0 = sign ^ ((1 << 23) - 1);
		}
		else
		{
		    acc0 &= 0xffffff;
		}

		*outptr++ = acc0;
	    }

	    //outsamps++;  //for pclint check

	    phase = nextphase[phase];
#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
	    pcmstep = (phase & 0xff);
#else
	    pcmstep = ((phase & 0xff) >> 1);	 /* use same table of stereo */
#endif
	    pcmptr32 += pcmstep;

	    lwingptr = (int*)(s->filter + nwing * ((phase >> 8) & 0xfff));
	    rwingptr = (int*)(s->filter + nwing * ((phase >> 20) & 0xfff));
	    phase >>= 20;
	}
    }

    /* save filter state */
    s->phase	= phase;
    s->offset	= pcmptr32 - pcmend32;
    s->rwingptr = (short*)rwingptr;
    s->lwingptr = (short*)lwingptr;
    adsp_memmove(s->histbuf32, s->histbuf32 + insamps, s->nhist * sizeof(int));

    return (outptr - outbuf);
}

#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
HI_S32 ResampleConfig(state_t *s, HI_S32 inrate, HI_S32 outrate)
{
    int divisor, up, dn, nhist;
    int i, nwing, ntaps;
    SRC_Info *srcinfoptr = resampler_info;
    int size = sizeof(resampler_info) / sizeof(SRC_Info);

    /* reduce to smallest fraction */
    divisor = gcd(inrate, outrate);
    up = outrate / divisor;
    dn = inrate / divisor;

    if (up > 1280)
    {
	return -1;
    }		    /* supports standard rates to 96000Hz */

    if (s->nchans * ((dn + up - 1) / up) > 255)
    {
	return -1;
    }		    /* pcmstep exceeds short */

    for (i = 0; i < size; i++)
    {
 #ifdef NEW_RATE_SUPPORT
	if ((srcinfoptr->inrate == inrate) && (srcinfoptr->outrate == outrate))
	{
	    break;
	}
	else if ((srcinfoptr->inrate == inrate / 2) && (srcinfoptr->outrate == outrate / 2))
	{
	    break;
	}
	else if ((srcinfoptr->inrate == inrate / 4) && (srcinfoptr->outrate == outrate / 4))
	{
	    break;
	}

 #else
	if ((srcinfoptr->inrate == inrate) && (srcinfoptr->outrate == outrate))
	{
	    break;
	}
 #endif


	srcinfoptr++;
    }

    if (i == size)
    {
	return -1;
    }

    nwing = srcinfoptr->nwing;
    ntaps = nwing * 2;		    /* update ntaps */
    nhist = s->nchans * ntaps;

    s->filter = (short*)srcinfoptr->filter;
    s->nextphase = (int*)srcinfoptr->nextphase;
    s->isCloned = 0;

    if (s->bitwidth == IN_PCM_16BIT_RAW)
    {
	s->pcmbuf32 = s->histbuf32 + nhist;
    }
    else if ((s->bitwidth == IN_PCM_24BIT_RAW)
	     || (s->bitwidth == IN_PCM_20BIT_RAW)
	     || (s->bitwidth == IN_PCM_18BIT_RAW))
    {
	s->pcmbuf32 = s->histbuf32 + nhist;
    }

    /* filter init */
    s->inrate  = inrate;
    s->outrate = outrate;
    s->up = up;
    s->dn = dn;
    s->nwing	= nwing;
    s->nhist	= nhist;
    s->phase	= 0;
    s->offset	= 0;
    s->rwingptr = (short*)(&s->filter[s->phase]);
    s->lwingptr = (short*)(&s->filter[nwing * (up - 1 - s->phase)]);
    return 0;
}

#endif

static HI_S32 ResamplerProcessFrame_Core(HI_VOID* inst,
				 HI_S32 *   inbuf,
				 HI_S32 *   pOutpcm,
				 HI_S32	    insamps,
				 HI_S32	    inrate,
				 HI_S32	    outrate,
				 HI_S32	    bInterleaved)
{
    state_t *s = (state_t *)inst;
    int nsamps;
    int maxout;
    HI_U32 u32Ret;//for pclint check

    if (s == HI_NULL)
    {
	 u32Ret = HI_ERR_RESAMPLE_HANDLE;
	 return (HI_S32)u32Ret;
    }

    if (inbuf == HI_NULL)
    {
	 u32Ret = HI_ERR_RESAMPLE_PCMBUF;
	return (HI_S32)u32Ret;
    }

    if ((insamps > MAXFRAMESIZE) || ((insamps & 0x1) != 0))
    {
	u32Ret = HI_ERR_RESAMPLE_SAMPLE_NUMBER;
	return (HI_S32)u32Ret;
    }

    if (pOutpcm == HI_NULL)
    {
	u32Ret = HI_ERR_RESAMPLE_PCMBUF;
	return (HI_S32)u32Ret;
    }

    if ((s->inrate != inrate) || (s->outrate != outrate))
    {
#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
	ResampleConfig(s, inrate, outrate);
#endif
    }

    maxout = ResamplerGetMaxOutputNum(inst, insamps);
    if (maxout < 0)
    {
	if ((HI_U32)maxout == HI_ERR_RESAMPLE_HANDLE)//for pclint check
	{
	    u32Ret = HI_ERR_RESAMPLE_HANDLE;
	    return (HI_S32)u32Ret;
	}
	else if ((HI_U32)maxout == HI_ERR_RESAMPLE_SAMPLE_NUMBER)
	{
	    u32Ret = HI_ERR_RESAMPLE_SAMPLE_NUMBER;
	    return (HI_S32)u32Ret;
	}
	else
	{
	    u32Ret = HI_ERR_UNKNOWN;
	    return (HI_S32)u32Ret;
	}
    }

    if (s->nchans == 2)
    {
	if (s->bitwidth == IN_PCM_16BIT_RAW)
	{
	    if (s->isForec2Out32bit == 0)
	    {
		nsamps = ResamplerStereoProcess16(inst, inbuf, insamps, (short *)pOutpcm, bInterleaved);
	    }
	    else
	    {
		nsamps = ResamplerStereoProcess24(inst, inbuf, insamps, pOutpcm, bInterleaved);
	    }
	}
	else if ((s->bitwidth == IN_PCM_24BIT_RAW)
		 || (s->bitwidth == IN_PCM_20BIT_RAW)
		 || (s->bitwidth == IN_PCM_18BIT_RAW))
	{
	    nsamps = ResamplerStereoProcess24(inst, inbuf, insamps, pOutpcm, bInterleaved);
	}
	else
	{
	    u32Ret = HI_ERR_PCM_FORMAT;
	    return (HI_S32)u32Ret;
	}
    }
    else if (s->nchans == 1)
    {
	if (s->bitwidth == IN_PCM_16BIT_RAW)
	{
	    if (s->isForec2Out32bit == 0)
	    {
		nsamps = ResamplerMonoProcess16(inst, (short *)inbuf, insamps, (short *)pOutpcm, bInterleaved);
	    }
	    else
	    {
		nsamps = ResamplerMonoProcess24(inst, inbuf, insamps, pOutpcm);
	    }
	}
	else if ((s->bitwidth == IN_PCM_24BIT_RAW)
		 || (s->bitwidth == IN_PCM_20BIT_RAW)
		 || (s->bitwidth == IN_PCM_18BIT_RAW))
	{
	    nsamps = ResamplerMonoProcess24(inst, inbuf, insamps, pOutpcm);
	}
	else
	{
	    u32Ret = HI_ERR_PCM_FORMAT;
	    return (HI_S32)u32Ret;
	}
    }
    else
    {
	u32Ret = HI_ERR_PCM_CHANNEL;
	return (HI_S32)u32Ret;
    }

    return nsamps;
}

static HI_S32 ResamplerGetMaxOutputNum_Core(HI_VOID* inst, HI_S32 insamps)
{
    state_t *s = (state_t *)inst;
    HI_S32 inframes, outframes, outsamps;
    HI_U32 u32Ret;//for pclint check

    if (s == HI_NULL)
    {
	u32Ret = HI_ERR_RESAMPLE_HANDLE;
	return (HI_S32)u32Ret;
    }

    if ((insamps > MAXFRAMESIZE) || ((insamps & 0x1) != 0))
    {
	u32Ret = HI_ERR_RESAMPLE_SAMPLE_NUMBER;
	return (HI_S32)u32Ret;
    }

    inframes = (insamps + (s->nchans - 1));

    //outframes = (int) ((double)inframes * s->outrate / s->inrate) + 1;  /* add 1 avoid 0.9 */
#if 1
    outframes = ((HI_S32)inframes * s->outrate / s->inrate) + 1; // use int to calculate instead float	***for pclint check
#else
    outframes = (inframes * s->outrate * 17 / s->inrate) / 16; // use int to calculate instead float
#endif
    outsamps = outframes;

    return outsamps;
}

static HI_S32 ResamplerGetMinInputNum_Core(HI_VOID* inst, HI_S32 outsamps)
{
    state_t *s = (state_t *)inst;
    HI_S32 insamps;
    HI_U32 u32Ret;//for pclint check

    if (s == HI_NULL)
    {
	u32Ret = HI_ERR_RESAMPLE_HANDLE;
	return (HI_S32)u32Ret;
    }

    insamps = ((HI_S32)outsamps * s->inrate / s->outrate);
    if(((HI_S32)outsamps * s->inrate) % s->outrate)
    {
	insamps +=1;
    }

    if((insamps*s->nchans) & 0x1)
    {
	 insamps +=1;
    }

    if ((insamps > MAXFRAMESIZE))
    {
	u32Ret = HI_ERR_RESAMPLE_SAMPLE_NUMBER;
	return (HI_S32)u32Ret;
    }

    return insamps;
}

static HI_VOID* ResamplerCreate_Core(HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat,
			       HI_S32 isForec2Out32bit)
{
#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
    int dcgain = 1;
    int atten;
    int passband;
    int stopband;
#else
    float dcgain = DEF_DCGAIN;
    float atten;
    float passband;
    float stopband;
#endif

    int quality;

#ifdef ENA_QUALITY_LOW
	 quality = QUALITY_LOW;
#endif


#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT

#ifdef ENA_QUALITY_MEDIUM
    quality = QUALITY_MEDIUM;
#endif

#else

#ifdef ENA_QUALITY_GOOD
    quality = QUALITY_GOOD; // enforce quality = QUALITY_GOOD, even if quality is actually ENA_QUALITY_MEDIUM
#endif

#endif


    //#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
    switch (inrate)
    {
    case IN_RATE_08K:
    case IN_RATE_11K:
    case IN_RATE_12K:
    case IN_RATE_16K:
    case IN_RATE_22K:
    case IN_RATE_24K:
    case IN_RATE_32K:
    case IN_RATE_44K:
    case IN_RATE_48K:
    case IN_RATE_88K:
    case IN_RATE_96K:
    case IN_RATE_176K:
    case IN_RATE_192K:
	break;
    default:
	return HI_NULL;
    }

    switch (outrate)
    {
    case OUT_RATE_08K:
    case OUT_RATE_11K:
    case OUT_RATE_12K:
    case OUT_RATE_16K:
    case OUT_RATE_22K:
    case OUT_RATE_24K:
    case OUT_RATE_32K:
    case OUT_RATE_44K:
    case OUT_RATE_48K:
    case OUT_RATE_88K:
    case OUT_RATE_96K:
    case OUT_RATE_176K:
    case OUT_RATE_192K:
	break;
    default:
	return HI_NULL;
    }

    if (inrate >= outrate)
    {
	return HI_NULL;
    }

    if ((chans != RESAMPLER_MONO) && (chans != RESAMPLER_STEREO))
    {
	return HI_NULL;
    }

    if ((SampleFormat != IN_PCM_16BIT_RAW) && (SampleFormat != IN_PCM_24BIT_RAW)
	&& (SampleFormat != IN_PCM_20BIT_RAW) && (SampleFormat != IN_PCM_18BIT_RAW))
    {
	return HI_NULL;
    }

    switch (quality)
    {
#ifdef ENA_QUALITY_LOW
    case QUALITY_LOW:
	passband = 0.50f;  // 8 tap, 7Mhz ARM9E
	stopband = 1.50f; //for pclint check
	atten = 60.0f;
	break;
#endif

#ifdef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
#ifdef ENA_QUALITY_MEDIUM
    case QUALITY_MEDIUM:
	passband = 0.70f;  // 16 tap, 10Mhz ARM9E
	stopband = 1.27f;
	atten = 70.0f;
	break;
#endif
#endif

#ifdef ENA_QUALITY_GOOD
    case QUALITY_GOOD:
	passband = (HI_S32)0.77f;  // 32 tap, 15Mhz ARM9E
	stopband = (HI_S32)1.09f; //for pclint check
	atten = (HI_S32)80.0f;
	break;
#endif

    }

    return RAInitResamplerRat(inrate, outrate, chans, atten, passband, stopband, dcgain, quality, SampleFormat,
			      isForec2Out32bit);
}



static HI_S32 ResamplerCheck(HI_VOID* inst, HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat)
{
    state_t *s = (state_t *)inst;

    if(s->inrate!=inrate)
	return HI_TRUE;
    if(s->outrate!=outrate)
	return HI_TRUE;
    if(s->nchans!=chans)
	return HI_TRUE;
    if(s->bitwidth!=SampleFormat)
	return HI_TRUE;

    return HI_FALSE;
}

HI_VOID* ResamplerCreate(HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat,
			       HI_S32 isForec2Out32bit)
{
    HI_VOID* inst;
    inst =  ResamplerCreate_Core(inrate, outrate, chans, SampleFormat,isForec2Out32bit);
    if(inst)
    {
	return inst;
    }
    else
    {
	state_t *s;
	HI_VOID* hLSRC;
	LSRC_Create(&hLSRC,inrate, outrate, SampleFormat,chans);
	if(hLSRC)
	{
	    s = (state_t *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(state_t));
	    if(!s)
	    {
		LSRC_Destroy(hLSRC);
		return HI_NULL;
	    }
	    s->isLinearMode = 1;
	    s->hLSRC = hLSRC;
	    return (HI_VOID*) s;
	}
    }
    return HI_NULL;
}

void ResamplerFree(HI_VOID* inst)
{
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    ResamplerFree_Core(inst);
	}
	else
	{
	    LSRC_Destroy(s->hLSRC);
	    HI_ADSP_FREE(ADSP_ID_AOE,s);
	}
    }
}

void ResampleFlush(HI_VOID* inst)
{

    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    ResampleFlush_Core(inst);
	}
	else
	{

	}
    }

}


HI_S32 NEW_ResamplerCheck(HI_VOID* inst, HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    return ResamplerCheck(inst,inrate, outrate, chans, SampleFormat);
	}
	else
	{
	    return LSRC_CheckUpdate(s->hLSRC, (HI_S32)inrate, (HI_S32)outrate,
				   SampleFormat, (HI_S32)chans);
	}
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;//for pclint check
    return (HI_S32)u32Ret;
}

HI_S32 ResamplerGetMaxOutputNum(HI_VOID* inst, HI_S32 insamps)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    return ResamplerGetMaxOutputNum_Core(inst,insamps);
	}
	else
	{
	    return LSRC_GetMaxOutputNum(s->hLSRC,insamps);
	}
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;
    return (HI_S32)u32Ret;
}

HI_S32 ResamplerGetMinInputNum(HI_VOID* inst, HI_S32 OutSamps)
{
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    return ResamplerGetMinInputNum_Core(inst,OutSamps);
	}
	else
	{
	    return LSRC_GetMinInputNum(s->hLSRC,OutSamps);
	}
    }

    return OutSamps;
}

HI_S32 ResamplerProcessFrame(HI_VOID* inst,
				 HI_S32 *   inbuf,
				 HI_S32 *   pOutpcm,
				 HI_S32	    insamps,
				 HI_S32	    inrate,
				 HI_S32	    outrate,
				 HI_S32	    bInterleaved)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	if(0==s->isLinearMode)
	{
	    return ResamplerProcessFrame_Core(inst,inbuf,pOutpcm,insamps,inrate,outrate,bInterleaved);
	}
	else
	{
	    return LSRC_ProcessFrame(s->hLSRC,inbuf,pOutpcm,insamps);
	}
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;
    return (HI_S32)u32Ret;
}

#else
HI_VOID* ResamplerCreate(HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat,
			       HI_S32 isForec2Out32bit)
{
    state_t *s;
    HI_VOID* hLSRC;
    LSRC_Create(&hLSRC,inrate, outrate, SampleFormat,chans);
    if(hLSRC)
    {
	s = (state_t *) HI_ADSP_MALLOC(ADSP_ID_AOE, sizeof(state_t));
	if(!s)
	{
	    LSRC_Destroy(hLSRC);
	    return HI_NULL;
	}
	s->isLinearMode = 1;
	s->hLSRC = hLSRC;
	return (HI_VOID*) s;
    }
    return HI_NULL;
}

void ResamplerFree(HI_VOID* inst)
{
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	LSRC_Destroy((HI_VOID *)s->hLSRC);
	HI_ADSP_FREE(ADSP_ID_AOE,s);
    }
    return;
}

void ResampleFlush(HI_VOID* inst)
{
    return;
}


HI_S32 NEW_ResamplerCheck(HI_VOID* inst, HI_S32 inrate, HI_S32 outrate, HI_S32 chans, HI_S32 SampleFormat)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	return LSRC_CheckUpdate(s->hLSRC, (HI_S32)inrate, (HI_S32)outrate,
				   SampleFormat, (HI_S32)chans);
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;
    return (HI_S32)u32Ret;
}

HI_S32 ResamplerGetMaxOutputNum(HI_VOID* inst, HI_S32 insamps)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	return LSRC_GetMaxOutputNum(s->hLSRC,insamps);
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;
    return (HI_S32)u32Ret;
}

HI_S32 ResamplerGetMinInputNum(HI_VOID* inst, HI_S32 OutSamps)
{
    //HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	return LSRC_GetMinInputNum(s->hLSRC,OutSamps);
    }

    return OutSamps;
}

HI_S32 ResamplerProcessFrame(HI_VOID* inst,
				 HI_S32 *   inbuf,
				 HI_S32 *   pOutpcm,
				 HI_S32	    insamps,
				 HI_S32	    inrate,
				 HI_S32	    outrate,
				 HI_S32	    bInterleaved)
{
    HI_U32 u32Ret;
    if (inst != HI_NULL)
    {
	state_t *s = (state_t *)inst;
	return LSRC_ProcessFrame(s->hLSRC,inbuf,pOutpcm,insamps);
    }
    u32Ret = HI_ERR_RESAMPLE_HANDLE;
    return (HI_S32)u32Ret;

}
#endif
