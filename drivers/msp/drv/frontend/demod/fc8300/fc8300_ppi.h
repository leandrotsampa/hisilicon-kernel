/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_ppi.h

	Description : header of EBI2/LCD interface

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_PPI_H__
#define __FC8300_PPI_H__

#ifdef __cplusplus
extern "C" {
#endif

extern s32 fc8300_ppi_init(HANDLE handle, u16 param1, u16 param2);
extern s32 fc8300_ppi_byteread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data);
extern s32 fc8300_ppi_wordread(HANDLE handle, DEVICEID devid,
		u16 addr, u16 *data);
extern s32 fc8300_ppi_longread(HANDLE handle, DEVICEID devid,
		u16 addr, u32 *data);
extern s32 fc8300_ppi_bulkread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_ppi_bytewrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 data);
extern s32 fc8300_ppi_wordwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u16 data);
extern s32 fc8300_ppi_longwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u32 data);
extern s32 fc8300_ppi_bulkwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length);
extern s32 fc8300_ppi_dataread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u32 length);
extern s32 fc8300_ppi_deinit(HANDLE handle);

#ifdef __cplusplus
}
#endif

#endif /* __FC8300_PPI_H__ */

