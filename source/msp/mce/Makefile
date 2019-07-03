#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/ha_codec-include	\
		-I$(srctree)/drivers/sdk/msp-api/higo/include		\
		-I$(srctree)/drivers/common/sys			\
		-I$(srctree)/drivers/common/mmz			\
		-I$(srctree)/drivers/sdk/msp-api/tde/include		\
		-I$(srctree)/drivers/msp/adsp/adsp_v1_1/include

EXTRA_CFLAGS += -DANDROID

MOD_NAME := hi_mce

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_mce_intf.o
