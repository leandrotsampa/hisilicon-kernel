/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
/*--------------------------------------------------------------------------------------------------------------------------*/
#ifndef __SYSTEM_TIMER_H__
#define __SYSTEM_TIMER_H__

typedef HI_VOID DSP_TimerIsrFunc (HI_VOID);

typedef struct
{
    DSP_TimerIsrFunc *fCastIsr;
} ADSP_TIMER_SOURCE_S;

HI_VOID TIMER_Init(HI_VOID);
HI_VOID TIMER_DeInit(HI_VOID);
HI_VOID TIMER_SetEnable(HI_VOID);
HI_VOID TIMER_SetDisable(HI_VOID);
HI_VOID TIMER_RegIsrFunc(HI_VOID* func);
HI_VOID TIMER_DelIsrFunc(HI_VOID);

#endif
