/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300b_tun.h

	Description : header of FC8300B tuner driver

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300B_TUN_H__
#define __FC8300B_TUN_H__

#ifdef __cplusplus
extern "C" {
#endif

extern s32 fc8300b_tuner_init(HANDLE handle, DEVICEID devid,
				enum BROADCAST_TYPE broadcast);
extern s32 fc8300b_set_freq(HANDLE handle, DEVICEID devid, u32 freq);
extern s32 fc8300b_get_rssi(HANDLE handle, DEVICEID devid, s32 *rssi);
extern s32 fc8300b_tuner_deinit(HANDLE handle, DEVICEID devid);

#ifdef __cplusplus
}
#endif

#endif /* __FC8300B_TUN_H__ */

