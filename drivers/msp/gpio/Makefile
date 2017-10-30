#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/gpio			\
		-I$(srctree)/drivers/msp/gpio

EXTRA_CFLAGS += -Werror

MOD_NAME := hi_gpio

$(MOD_NAME)-y := drv_gpio_intf.o	\
		 drv_gpio.o

obj-y += $(MOD_NAME).o
