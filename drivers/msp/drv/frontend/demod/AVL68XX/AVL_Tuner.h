/*
 *           Copyright 2007-2014 Availink, Inc.
 *
 *  This software contains Availink proprietary information and
 *  its use and disclosure are restricted solely to the terms in
 *  the corresponding written license agreement. It shall not be
 *  disclosed to anyone other than valid licensees without
 *  written permission of Availink, Inc.
 *
 */



#ifndef AVL_TUNER_H
#define AVL_TUNER_H

#include "AVL_Bsp.h"

#ifdef AVL_CPLUSPLUS
extern "C" {
#endif

typedef enum AVL_Tuner_DTVMode
{
    DTVMode_DVBC  = 0,
    DTVMode_DVBSX = 1,
    DTVMode_DVBTX = 2,
    DTVMode_ISDBT = 3,
    DTVMode_DTMB  = 4,
    DTVMode_ISDBS = 5,
    DTVMode_ABSS  = 6,
    DTVMode_ATSC  = 7,
    DTVMode_DVBC2 = 8
} AVL_Tuner_DTVMode;

typedef struct AVL_Tuner_s
{
    AVL_uint16 uiTunerPort;  	// sky(A)
    AVL_uint16 uiTunerI2CBus;  	// sky(A)
    AVL_uint16 uiTunerI2CAddr;
    AVL_uchar  ucTunerLocked;

    AVL_Tuner_DTVMode eDTVMode;
    AVL_uint32 uiRFFrequencyHz;
    AVL_uint32 uiIFHz;//only valid for terrestrial or cable tuner
    AVL_uint32 uiBandwidthHz;//only valid for terrestrial or cable tuner
    AVL_uint32 uiLPFHz;//only valid for satellite tuner
    AVL_uint16 usClkOutEnable;	// sky(A)

    void *vpMorePara;

    AVL_uint32 (* fpInitializeFunc)(struct AVL_Tuner_s *);
    AVL_uint32 (* fpLockFunc)(struct AVL_Tuner_s *);
    AVL_uint32 (* fpGetLockStatusFunc)(struct AVL_Tuner_s *);
    AVL_uint32 (* fpGetRFStrength)(struct AVL_Tuner_s *, AVL_int32 *);

} AVL_Tuners;

#ifdef AVL_CPLUSPLUS
}
#endif

#endif

