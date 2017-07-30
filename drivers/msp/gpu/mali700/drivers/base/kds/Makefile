#
# (C) COPYRIGHT 2012 ARM Limited. All rights reserved.
#
# This program is free software and is provided to you under the terms of the
# GNU General Public License version 2 as published by the Free Software
# Foundation, and any use by you of this program is subject to the terms
# of such GNU licence.
#
# A copy of the licence is included with the program, and can also be obtained
# from Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA  02110-1301, USA.

export ccflags-y += -Werror
include $(srctree)/drivers/msp/gpu/mali700/kbuild_flags

ccflags-y += -I$(srctree)/drivers/msp/gpu/mali700/drivers/base/kds \
		-I$(srctree)/drivers/msp/gpu/mali700/include

$(warning "ccflags-y = $(ccflags-y)...")
obj-$(CONFIG_KDS) += kds.o
obj-$(CONFIG_KDS_TEST) += kds_test.o
