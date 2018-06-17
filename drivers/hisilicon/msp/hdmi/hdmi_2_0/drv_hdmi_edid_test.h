/******************************************************************************

  Copyright (C), 2014-2016, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: drv_hdmi_edid_test.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2014/12/10
  Description	:
  History	:
  Date		: 2014/12/10
  Author	: t00273561
  Modification	:
*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_HDMI_EDID_TEST_H__
#define __DRV_HDMI_EDID_TEST_H__

#include "hi_type.h"
#include "drv_hdmi_edid.h"

#define HDMI_EDID_RAW_TEST				1

#if HDMI_EDID_RAW_TEST


/**
\brief	read EDID TEST raw data
\param[in]    @enMode			see HDMI_EDID_UPDATE_MODE_E
\param[in]	@u32Len		length in bytes[0~512]
\param[out]  @pau8Data		pointer to a destination data buffer
\retval	 read length[0~512] / HI_FALURE
*/
HI_S32 DRV_HDMI_EdidTestRawRead(HDMI_EDID_UPDATE_MODE_E enMode,
											HI_U8 *pau8Data,
											HI_U32 u32Len);

#endif

#endif	/* __DRV_HDMI_EDID_TEST_H__ */
