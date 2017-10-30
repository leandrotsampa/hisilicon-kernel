#===============================================================================
# local variables
#===============================================================================

EXTRA_CFLAGS += -Werror -Wno-error=format-security

EXTRA_CFLAGS += \
	-I$(srctree)/drivers/sdk/common-include \
	-I$(srctree)/drivers/common/include \
	-I$(srctree)/drivers/sdk/msp-include	\
	-I$(srctree)/drivers/sdk/msp-api/include	\
	-I$(srctree)/drivers/msp/include

HIFIDIR := ./hifi

ADSP_DIR := $(srctree)/drivers/msp/adsp/adsp_v1_1

EXTRA_CFLAGS += \
	-I$(ADSP_DIR) \
	-I$(ADSP_DIR)/include \
	-I$(ADSP_DIR)/osal \
	-I$(ADSP_DIR)/$(HIFIDIR)/common/include \
	-I$(ADSP_DIR)/$(HIFIDIR)/aoe/include \
	-I$(ADSP_DIR)/$(HIFIDIR)/aoe/src/include

EXTRA_CFLAGS += -DHI_SOUND_SPDIF_COMPENSATION_SUPPORT

MOD_NAME := hi_adsp

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y := \
	drv_adsp_intf.o \
	drv_adsp.o \
	drv_adsp_hal.o \
	drv_adsp_proc.o

#===============================================================================
# SW AOE
$(MOD_NAME)-y += \
	osal/adsp_osal.o \
	$(HIFIDIR)/common/linear/linear.o \
	$(HIFIDIR)/common/mem/dsp_mem.o \
	$(HIFIDIR)/common/resampler/resample_rom.o \
	$(HIFIDIR)/common/resampler/resample.o \
	$(HIFIDIR)/common/util/dsp_util.o \
	$(HIFIDIR)/common/ringbuf/dsp_ringbuf.o \
	$(HIFIDIR)/common/basicop/basicop.o \
	$(HIFIDIR)/common/timer/system_timer.o \
	$(HIFIDIR)/sw_main.o \
	$(HIFIDIR)/aoe/src/aop/aoe_aop.o \
	$(HIFIDIR)/aoe/src/aop/aoe_cast.o \
	$(HIFIDIR)/aoe/src/aip/aoe_aip.o \
	$(HIFIDIR)/aoe/src/engine/aoe_engine.o \
	$(HIFIDIR)/aoe/src/aoe_main.o \
	$(HIFIDIR)/aoe/src/aoe_reg.o
