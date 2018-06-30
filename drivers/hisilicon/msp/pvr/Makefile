#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/pvr/include		\
		-I$(srctree)/drivers/sdk/ha_codec-include


MOD_NAME := hi_pvr

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_pvr_intf.o
