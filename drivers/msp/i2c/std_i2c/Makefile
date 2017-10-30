#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS := -Werror -DHI_GPIOI2C_SUPPORT
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/i2c			\
		-I$(srctree)/drivers/msp/i2c/std_i2c


MOD_NAME := hi_i2c

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y := drv_i2c_intf.o drv_i2c.o
