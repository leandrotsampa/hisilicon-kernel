/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_spi.c

	Description : source of SPI interface

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#include "fci_types.h"
#include "fc8300_regs.h"
#include "fci_oal.h"

#define SPI_LEN             0x00 /* or 0x10 */
#define SPI_REG             0x20
#define SPI_THR             0x30
#define SPI_READ            0x40
#define SPI_WRITE           0x00
#define SPI_AINC            0x80

static s32 spi_bulkread(HANDLE handle, u8 devid,
		u16 addr, u8 command, u8 *data, u16 length)
{
	int res = BBM_OK;
	/*cmd[0] = addr & 0xff;
	cmd[1] = (addr >> 8) & 0xff;
	cmd[2] = command | devid;
	cmd[3] = length & 0xff;

	spi_cmd.pCmd = cmd;
	spi_cmd.cmdSize = 4;
	spi_cmd.pData = g_SpiData;
	spi_cmd.dataSize = length;*/

	/* Send Command and data through the SPI */

	return res;
}

static s32 spi_bulkwrite(HANDLE handle, u8 devid,
		u16 addr, u8 command, u8 *data, u16 length)
{
	int res = BBM_OK;
	/*cmd[0] = addr & 0xff;
	cmd[1] = (addr >> 8) & 0xff;
	cmd[2] = command | devid;
	cmd[3] = length & 0xff;

	spi_cmd.pCmd = cmd;
	spi_cmd.cmdSize = 4;
	spi_cmd.pData = g_SpiData;
	memcpy(g_SpiData, data, length);
	spi_cmd.dataSize = length;*/

	/* Send Command and data through the SPI */

	return res;
}

static s32 spi_dataread(HANDLE handle, u8 devid,
		u16 addr, u8 command, u8 *data, u32 length)
{
	int res = BBM_OK;
	/*cmd[0] = addr & 0xff;
	cmd[1] = (addr >> 8) & 0xff;
	cmd[2] = command | devid;
	cmd[3] = length & 0xff;

	spi_cmd.pCmd = cmd;
	spi_cmd.cmdSize = 4;
	spi_cmd.pData = data;
	spi_cmd.dataSize = length;*/

	/* Send Command and data through the SPI */

	return res;
}

s32 fc8300_spi_init(HANDLE handle, u16 param1, u16 param2)
{
	OAL_CREATE_SEMAPHORE();

	return BBM_OK;
}

s32 fc8300_spi_byteread(HANDLE handle, DEVICEID devid, u16 addr, u8 *data)
{
	s32 res;
	u8 command = SPI_READ;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkread(handle, (u8) (devid & 0x000f), addr, command,
				data, 1);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_wordread(HANDLE handle, DEVICEID devid, u16 addr, u16 *data)
{
	s32 res;
	u8 command = SPI_READ | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkread(handle, (u8) (devid & 0x000f), addr, command,
				(u8 *)data, 2);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_longread(HANDLE handle, DEVICEID devid, u16 addr, u32 *data)
{
	s32 res;
	u8 command = SPI_READ | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkread(handle, (u8) (devid & 0x000f), addr, command,
				(u8 *)data, 4);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_bulkread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length)
{
	s32 res;
	u8 command = SPI_READ | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkread(handle, (u8) (devid & 0x000f), addr, command,
				data, length);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_bytewrite(HANDLE handle, DEVICEID devid, u16 addr, u8 data)
{
	s32 res;
	u8 command = SPI_WRITE;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkwrite(handle, (u8) (devid & 0x000f), addr, command,
				(u8 *)&data, 1);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_wordwrite(HANDLE handle, DEVICEID devid, u16 addr, u16 data)
{
	s32 res;
	u8 command = SPI_WRITE | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkwrite(handle, (u8) (devid & 0x000f), addr, command,
				(u8 *)&data, 2);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_longwrite(HANDLE handle, DEVICEID devid, u16 addr, u32 data)
{
	s32 res;
	u8 command = SPI_WRITE | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkwrite(handle, (u8) (devid & 0x000f), addr, command,
				(u8 *) &data, 4);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_bulkwrite(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u16 length)
{
	s32 res;
	u8 command = SPI_WRITE | SPI_AINC;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_bulkwrite(handle, (u8) (devid & 0x000f), addr, command,
				data, length);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_dataread(HANDLE handle, DEVICEID devid,
		u16 addr, u8 *data, u32 length)
{
	s32 res;
	u8 command = SPI_READ | SPI_THR;

	OAL_OBTAIN_SEMAPHORE();
	res = spi_dataread(handle, (u8) (devid & 0x000f), addr, command,
				data, length);
	OAL_RELEASE_SEMAPHORE();

	return res;
}

s32 fc8300_spi_deinit(HANDLE handle)
{
	OAL_DELETE_SEMAPHORE();

	return BBM_OK;
}

