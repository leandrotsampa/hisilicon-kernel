EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include		\
		-I$(src)						\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/common/sys

EXTRA_CFLAGS += -Werror


MOD_NAME := hi_keyled

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	+=  drv_keyled_intf.o

EXTRA_CFLAGS += -I$(src)/keyled_std
$(MOD_NAME)-y  += keyled_std/drv_keyled_std.o

EXTRA_CFLAGS += -I$(src)/keyled_gpiokey
$(MOD_NAME)-y  += keyled_gpiokey/drv_keyled_gpiokey.o

EXTRA_CFLAGS += -I$(src)/keyled_fd650
$(MOD_NAME)-y  += keyled_fd650/drv_keyled_fd650.o

EXTRA_CFLAGS += -I$(src)/keyled_pt6961
$(MOD_NAME)-y  += keyled_pt6961/drv_keyled_pt6961.o

EXTRA_CFLAGS += -I$(src)/keyled_pt6964
$(MOD_NAME)-y += keyled_pt6964/drv_keyled_pt6964.o

EXTRA_CFLAGS += -I$(src)/keyled_ct1642
$(MOD_NAME)-y  += keyled_ct1642/drv_keyled_ct1642_inner.o
