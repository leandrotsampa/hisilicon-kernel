/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef _AOE_ENGINE_H_
#define _AOE_ENGINE_H_

#include "hi_type.h"

#ifdef __cplusplus
extern "C" {
#endif

/******************************* API Declaration *****************************/
HI_VOID ENGINE_Init(HI_VOID* pEngineRegBase);
HI_VOID ENGINE_DeInit(HI_VOID);
HI_VOID ENGINE_Process(HI_VOID);

/** @}*/  /** <!-- ==== API Declaration End ====*/

#ifdef __cplusplus
}
#endif

#endif
