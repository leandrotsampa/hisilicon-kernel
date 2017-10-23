/*
 * drivers/usb/host/xhci-histb.h
 *
 * Copyright (C) 2017 HiSilicon Co., Ltd. http://www.hisilicon.com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 */

#ifndef _XHCI_HISTB_H
#define _XHCI_HISTB_H

#if IS_ENABLED(CONFIG_USB_XHCI_HISTB)
void xhci_histb_start(struct usb_hcd *hcd);
#else
static inline void xhci_histb_start(struct usb_hcd *hcd)
{
}
#endif
#endif /* _XHCI_HISTB_H */

