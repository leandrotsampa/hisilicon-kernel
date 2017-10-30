TARGET := png

#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/tde/include		\
		-I$(srctree)/drivers/msp/tde/include		\
		-I$(srctree)/drivers/sdk/msp-api/$(TARGET)/include	\
		-I$(srctree)/drivers/msp/$(TARGET)/include	\
		-I$(srctree)/drivers/msp/$(TARGET)/src	    \
		-I$(srctree)/drivers/msp/jpeg/grc_cmm_inc

EXTRA_CFLAGS += -Werror

MOD_NAME := hi_$(TARGET)

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  src/png_osr.o	\
		    src/png_hal.o	\
		    src/png_osi.o	\
		    src/png_osires.o	\
		    src/png_proc.o
