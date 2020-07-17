/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_i2c.h

	Description : header of I2C interface

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_I2C_H__
#define __FC8300_I2C_H__

#ifdef __cplusplus
extern "C" {
#endif

extern s32 fc8300_i2c_init(HANDLE handle, u16 param1, u16 param2);
extern s32 fc8300_i2c_byteread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data);
extern s32 fc8300_i2c_wordread(HANDLE handle, DEVICEID devid,
		u16 addr, u16 *data);
extern s32 fc8300_i2c_longread(HANDLE handle, DEVICEID devid,
		u16 addr, u32 *data);
extern s32 fc8300_i2c_bulkread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_i2c_bytewrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 data);
extern s32 fc8300_i2c_wordwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u16 data);
extern s32 fc8300_i2c_longwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u32 data);
extern s32 fc8300_i2c_bulkwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_i2c_dataread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u32 length);
extern s32 fc8300_i2c_deinit(HANDLE handle);

#ifdef __cplusplus
}
#endif

#endif /* __FC8300_I2C_H__ */

