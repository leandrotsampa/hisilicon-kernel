/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 * Create By Cai Zhiyong 2015.6.12
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef HIOTG_H
#define HIOTG_H

#ifdef CONFIG_USB_OTG_HISI

/* if defined struct usb_hcd, then define the function */
#ifdef __USB_CORE_HCD_H
void set_usbhost_connect(struct usb_hcd *hcd,
			u32 port_index, u32 online, u32 host_type);
#endif
void set_usbdev_connect(u32 index, u32 online);

#else /* CONFIG_USB_OTG_HISI */

#ifdef __USB_CORE_HCD_H
static void inline set_usbhost_connect(struct usb_hcd *hcd,
				       u32 port_index, u32 online, u32 host_type)
{
}
#endif
static void inline set_usbdev_connect(u32 index, u32 online)
{
}

#endif /* CONFIG_USB_OTG_HISI */

#endif /* HIOTG_H */
