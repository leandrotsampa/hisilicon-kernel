/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fci_hpi.h

	Description : header of internal hpi driver

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FCI_HPI_H__
#define __FCI_HPI_H__

#ifdef __cplusplus
extern "C" {
#endif

extern s32 fci_hpi_init(HANDLE handle, DEVICEID devid,
		s32 speed, s32 slaveaddr);
extern s32 fci_hpi_read(HANDLE handle, DEVICEID devid,
		u8 chip, u8 addr, u8 alen, u8 *data, u8 len);
extern s32 fci_hpi_write(HANDLE handle, DEVICEID devid,
		u8 chip, u8 addr, u8 alen, u8 *data, u8 len);
extern s32 fci_hpi_deinit(HANDLE handle, DEVICEID devid);

#ifdef __cplusplus
}
#endif

#endif /* __FCI_HPI_H__ */

