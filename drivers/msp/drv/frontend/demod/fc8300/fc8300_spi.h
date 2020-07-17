/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_spi.h

	Description : header of SPI interface

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_SPI__
#define __FC8300_SPI__

#ifdef __cplusplus
extern "C" {
#endif

extern s32 fc8300_spi_init(HANDLE handle, u16 param1, u16 param2);
extern s32 fc8300_spi_byteread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data);
extern s32 fc8300_spi_wordread(HANDLE handle, DEVICEID devid,
		u16 addr, u16 *data);
extern s32 fc8300_spi_longread(HANDLE handle, DEVICEID devid,
		u16 addr, u32 *data);
extern s32 fc8300_spi_bulkread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_spi_bytewrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 data);
extern s32 fc8300_spi_wordwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u16 data);
extern s32 fc8300_spi_longwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u32 data);
extern s32 fc8300_spi_bulkwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_spi_dataread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u32 length);
extern s32 fc8300_spi_deinit(HANDLE handle);

#ifdef __cplusplus
}
#endif

#endif /* __FC8300_SPI__ */

