/******************************************************************************
 * Copyright (C) 2014 Hisilicon Technologies CO.,LTD.
 * Create By Lai Yingjun 2014.1.26
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#define pr_fmt(fmt) "os_sem: " fmt

#include <linux/module.h>
#include <linux/miscdevice.h>
#include <linux/syscalls.h>
#include <linux/ipc.h>

/******************************************************************************/

long os_semctl(int semid, int semnum, int cmd, unsigned long arg)
{
	return sys_semctl(semid, semnum, cmd, arg);
}
EXPORT_SYMBOL(os_semctl);

/******************************************************************************/

long os_semget(key_t key, int nsems, int semflg)
{
	return sys_semget(key, nsems, semflg);
}
EXPORT_SYMBOL(os_semget);
