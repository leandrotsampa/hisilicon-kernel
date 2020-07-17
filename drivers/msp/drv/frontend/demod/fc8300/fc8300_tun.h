/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_tun.h

	Description : header of FC8300 tuner driver

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_TUN__
#define __FC8300_TUN__

#ifdef __cplusplus
extern "C" {
#endif

s32 fc8300_tuner_init(HANDLE handle, DEVICEID devid,
				enum BROADCAST_TYPE broadcast);
s32 fc8300_set_freq(HANDLE handle, DEVICEID devid, u32 freq);
s32 fc8300_get_rssi(HANDLE handle, DEVICEID devid, s32 *rssi);
s32 fc8300_tuner_deinit(HANDLE handle, DEVICEID devid);

#ifdef __cplusplus
}
#endif

#endif /* __FC8300_TUN__ */

