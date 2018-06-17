/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
/*--------------------------------------------------------------------------------------------------------------------------*/
/**************************************************************************************
*
* statname.h - name mangling macros for static linking
**************************************************************************************/

#ifndef _RESAMPLE_STATNAME_H
#define _RESAMPLE_STATNAME_H

#define STAT_PREFIX SRC

#define STATCC1(x, y, z) STATCC2(x, y, z)
#define STATCC2(x, y, z) x ## y ## z

#ifdef STAT_PREFIX
 #define STATNAME(func) STATCC1(STAT_PREFIX, _, func)
#else
 #define STATNAME(func) func
#endif

/* global ROM tables */
#define res_32_48_low_nextphasetab STATNAME(res_32_48_low_nextphasetab	)
#define res_32_48_low_filttab STATNAME(res_32_48_low_filttab	   )
#define res_44_48_low_nextphasetab STATNAME(res_44_48_low_nextphasetab	)
#define res_44_48_low_filttab STATNAME(res_44_48_low_filttab	   )
#define res_32_48_mid_nextphasetab STATNAME(res_32_48_mid_nextphasetab	)
#define res_32_48_mid_filttab STATNAME(res_32_48_mid_filttab	   )
#define res_44_48_mid_nextphasetab STATNAME(res_44_48_mid_nextphasetab	)
#define res_44_48_mid_filttab STATNAME(res_44_48_mid_filttab	   )
#define res_8_11_mid_filttab STATNAME(res_8_11_mid_filttab	  )
#define res_8_22_mid_filttab STATNAME(res_8_22_mid_filttab	  )
#define res_8_44_mid_filttab STATNAME(res_8_44_mid_filttab	  )
#define res_11_12_mid_filttab STATNAME(res_11_12_mid_filttab	   )
#define res_11_16_mid_filttab STATNAME(res_11_16_mid_filttab	   )
#define res_11_24_mid_filttab STATNAME(res_11_24_mid_filttab	   )
#define res_11_32_mid_filttab STATNAME(res_11_32_mid_filttab	   )
#define res_11_48_mid_filttab STATNAME(res_11_48_mid_filttab	   )
#define res_12_22_mid_filttab STATNAME(res_12_22_mid_filttab	   )
#define res_12_44_mid_filttab STATNAME(res_12_44_mid_filttab	   )
#define res_8_11_good_nextphasetab STATNAME(res_8_11_good_nextphasetab	)
#define res_8_11_good_filttab STATNAME(res_8_11_good_filttab	   )
#define res_8_12_good_nextphasetab STATNAME(res_8_12_good_nextphasetab	)
#define res_8_12_good_filttab STATNAME(res_8_12_good_filttab	   )
#define res_8_16_good_nextphasetab STATNAME(res_8_16_good_nextphasetab	)
#define res_8_16_good_filttab STATNAME(res_8_16_good_filttab	   )
#define res_8_22_good_nextphasetab STATNAME(res_8_22_good_nextphasetab	)
#define res_8_24_good_nextphasetab STATNAME(res_8_24_good_nextphasetab	)
#define res_8_24_good_filttab STATNAME(res_8_24_good_filttab	   )
#define res_8_32_good_nextphasetab STATNAME(res_8_32_good_nextphasetab	)
#define res_8_32_good_filttab STATNAME(res_8_32_good_filttab	   )
#define res_8_44_good_nextphasetab STATNAME(res_8_44_good_nextphasetab	)
#define res_8_48_good_nextphasetab STATNAME(res_8_48_good_nextphasetab	)
#define res_8_48_good_filttab STATNAME(res_8_48_good_filttab	   )
#define res_11_12_good_nextphasetab STATNAME(res_11_12_good_nextphasetab )
#define res_11_12_good_filttab STATNAME(res_11_12_good_filttab	    )
#define res_11_16_good_nextphasetab STATNAME(res_11_16_good_nextphasetab )
#define res_11_24_good_nextphasetab STATNAME(res_11_24_good_nextphasetab )
#define res_11_32_good_nextphasetab STATNAME(res_11_32_good_nextphasetab )
#define res_11_44_good_nextphasetab STATNAME(res_11_44_good_nextphasetab )
#define res_11_44_good_filttab STATNAME(res_11_44_good_filttab	    )
#define res_11_48_good_nextphasetab STATNAME(res_11_48_good_nextphasetab )
#define res_12_16_good_nextphasetab STATNAME(res_12_16_good_nextphasetab )
#define res_12_16_good_filttab STATNAME(res_12_16_good_filttab	    )
#define res_12_22_good_nextphasetab STATNAME(res_12_22_good_nextphasetab )
#define res_12_32_good_nextphasetab STATNAME(res_12_32_good_nextphasetab )
#define res_12_32_good_filttab STATNAME(res_12_32_good_filttab	    )
#define res_12_44_good_nextphasetab STATNAME(res_12_44_good_nextphasetab )

#endif /* _RESAMPLE_STATNAME_H */
