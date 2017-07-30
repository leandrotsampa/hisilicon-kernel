/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.5.28
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef HIMCI_DBG_H
#define HIMCI_DBG_H

int himci_dbg_init(int devid);

int himci_dbg_rw(int devid, int is_write, u32 ofblk, u32 nrblk);

#endif
