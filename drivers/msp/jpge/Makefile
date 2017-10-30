TARGET := jpge

#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/msp/tde/include		\
		-I$(srctree)/drivers/sdk/msp-api/tde/include		\
		-I$(srctree)/drivers/sdk/msp-api/$(TARGET)/include	\
		-I$(srctree)/drivers/msp/$(TARGET)/include	\
		-I$(srctree)/drivers/msp/$(TARGET)/src		\
		-I$(srctree)/drivers/msp/jpeg/grc_cmm_inc

EXTRA_CFLAGS += -Werror
EXTRA_CFLAGS += -DCONFIG_GFX_STB_SDK
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_SUPPORT

MOD_NAME := hi_$(TARGET)

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  src/jpge_osr.o  \
		    src/jpge_osal.o \
		    src/jpge_hal.o
