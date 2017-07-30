/*--------------------------------------------------------------------------------------------------------------------------*/
/*****************************************************************************
*	      Copyright 2004 - 2014, Hisilicon Tech. Co., Ltd.
*			    ALL RIGHTS RESERVED
* FileName: hi_spdif.h
* Description:
*
* History:
* Version   Date	 Author	    DefectNum	 Description
* 0.01	    2006-11-01	 gz40717    NULL	 Create this file.
*
*****************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef _RESAMPLERS_CONFIG_H_
#define _RESAMPLERS_CONFIG_H_

#ifdef __cplusplus
extern "C" {
#endif

//#define ENA_QUALITY_LOW
#define ENA_QUALITY_MEDIUM
#define ENA_QUALITY_GOOD

/*
   quality defination
 */
enum
{
#ifdef ENA_QUALITY_LOW
    QUALITY_LOW = 0, // as low a quality as we dare
#endif

#ifdef ENA_QUALITY_MEDIUM
    QUALITY_MEDIUM = 1, // somewhat better
#endif

#ifdef ENA_QUALITY_GOOD
    QUALITY_GOOD = 2, // the default, probably sufficient for the player
#endif
};

#ifdef ENA_QUALITY_GOOD
/* 20Hz��20kHz	-20dBFs freqz (+1/-2)dB */
#define OPTIMIZE_44K_RES_48K
#endif

#define NBLOCK (MAXFRAMESIZE * 2)  /* 2058 */


/*
*   DSP AOE resampler:
*      1.Standard samplerate use:XA resamper
*      2.Nonstandard samplerate use: HI_QUALITY_LINEAR RESAMPLER (LINEAR Resampler less rom)
*   Soft AOE resample:
*      1.Standard samplerate use: NEW_RATE resampler
*      2.Nonstandard samplerate use: HI_QUALITY_LINEAR RESAMPLER
*/

#ifndef CONFIG_RES_GENERATE_TRIGTABS_FLOAT
 #define NEW_RATE_SUPPORT
#endif

#endif /* _RESAMPLERS_CONFIG_H_ */
