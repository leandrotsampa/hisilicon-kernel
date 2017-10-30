/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __DRV_I2C_H__
#define __DRV_I2C_H__

#include "hi_type.h"

#define I2C_DFT_SYSCLK	  (100000000)  // 3716H 3716M 3716L
#define I2C_DFT_RATE	  (400000)

HI_S32 I2C_DRV_SetRate(HI_U32 I2cNum, HI_U32 I2cRate);

#endif
