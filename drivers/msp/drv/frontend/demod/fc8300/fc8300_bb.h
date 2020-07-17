/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_bb.h

	Description : header of baseband driver

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_BB__
#define __FC8300_BB__

extern s32 fc8300_reset(HANDLE handle, DEVICEID devid);
extern s32 fc8300_probe(HANDLE handle, DEVICEID devid);
extern s32 fc8300_init(HANDLE handle, DEVICEID devid);
extern s32 fc8300_deinit(HANDLE handle, DEVICEID devid);
extern s32 fc8300_scan_status(HANDLE handle, DEVICEID devid);
extern s32 fc8300_set_broadcast_mode(HANDLE handle, DEVICEID devid,
		enum BROADCAST_TYPE broadcast);
extern s32 fc8300_set_core_clk(HANDLE handle, DEVICEID devid,
		enum BROADCAST_TYPE broadcast, u32 freq);

#endif /* __FC8300_BB__ */

