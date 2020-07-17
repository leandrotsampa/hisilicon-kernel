/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fci_oal.c

	Description : source of OS adaptation layer

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
#include <linux/delay.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <linux/time.h>
#include <linux/module.h>
#include <asm/io.h>
#include <linux/kthread.h>

#include "fci_types.h"

void PRINTF(HANDLE handle, s8 *fmt, ...)
{
	/* va_list ap;
	s8 str[256];

	memset(&str[0], 0, sizeof(str));
	va_start(ap, fmt);
	vsprintf(str, fmt, ap);
	printf("%s", str);
	va_end(ap); */
}

void msWait(s32 ms)
{
	msleep_interruptible(ms);
}

/* Write your own mutual exclusion method */
void OAL_CREATE_SEMAPHORE(void)
{
	/* called in driver initialization */
}

void OAL_DELETE_SEMAPHORE(void)
{
	/* called in driver deinitializaton */
}

void OAL_OBTAIN_SEMAPHORE(void)
{

}

void OAL_RELEASE_SEMAPHORE(void)
{

}


