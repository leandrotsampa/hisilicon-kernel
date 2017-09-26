/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name	: hi_ao.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2006/02/13
  Description	:
  History	:
  1.Date	: 2006/02/13
    Author	:
    Modification: Created file

  2.Date	 : 2006/2/13
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_DRV_ADEC_H__
#define __HI_DRV_ADEC_H__

#include "hi_type.h"
#include "hi_mpi_adec.h"
#include "hi_drv_ao.h"

HI_S32		HI_DRV_ADEC_Init(HI_VOID);
HI_VOID		HI_DRV_ADEC_DeInit(HI_VOID);

HI_S32		ADEC_DRV_ModInit(HI_VOID);
HI_VOID		ADEC_DRV_ModExit(HI_VOID);

#endif //__HI_DRV_ADEC_H__
