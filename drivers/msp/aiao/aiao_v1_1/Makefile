#===============================================================================
# local variables
#===============================================================================
ADSP_DRV_INCLUDE := $(srctree)/drivers/msp/adsp/adsp_v1_1/include

EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += \
		-I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/higo/include		\
		-I$(ADSP_DRV_INCLUDE)

#COMMON include
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/aiao/aiao_v1_1/common/include
#AO include
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/aiao/aiao_v1_1/ao

#===============================================================================
# HI_SND_DRV_SUSPEND_SUPPORT : suspend & resume driver
#===============================================================================
EXTRA_CFLAGS += -DHI_SND_DRV_SUSPEND_SUPPORT
#===============================================================================
MOD_NAME := hi_aiao

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y := drv_aiao_module.o

# COMMON SUPPORT
$(MOD_NAME)-y += \
		common/src/audio_util.o \
		common/src/hal_aiao.o \
		common/src/hal_aiao_func.o \
		common/src/hal_aiao_priv.o

# AO SUPPORT (default)
$(MOD_NAME)-y += \
		ao/drv_ao.o \
		ao/drv_ao_op.o \
		ao/drv_ao_track.o \
		ao/hal_aoe_func.o \
		ao/hal_aoe.o \
		ao/drv_ao_intf.o \
		ao/drv_ao_cast.o \
		ao/hal_cast.o
#===============================================================================
$(MOD_NAME)-y += common/src/hal_tianlai_adac_v600.o
EXTRA_CFLAGS += -DHI_TIANLAI_V600

#===============================================================================
ifeq ($(CFG_HI_AIAO_VERIFICATION_SUPPORT),y)
EXTRA_CFLAGS += -DHI_AIAO_VERIFICATION_SUPPORT
$(MOD_NAME)-y += common/src/drv_aiao_veri.o
endif
#===============================================================================

EXTRA_CFLAGS += -DHI_AIAO_TIMER_SUPPORT
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/aiao/aiao_v1_1/timer
$(MOD_NAME)-y += timer/drv_timer.o
#===============================================================================
# AI SUPPORT(optional)
EXTRA_CFLAGS += -DHI_AUDIO_AI_SUPPORT
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/aiao/aiao_v1_1/ai
$(MOD_NAME)-y += \
		ai/drv_ai_intf.o \
		ai/drv_ai.o
#===============================================================================
# ALSA SUPPORT(optional)
EXTRA_CFLAGS += -DHI_ALSA_AO_SUPPORT
EXTRA_CFLAGS += -DHI_ALSA_HRTIMER_SUPPORT
ALSA_DIR = alsa/dsp_mix_v2
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/aiao/aiao_v1_1/$(ALSA_DIR)
$(MOD_NAME)-y += \
		$(ALSA_DIR)/hiaiao_card.o \
		$(ALSA_DIR)/hiaiao_dma.o \
		$(ALSA_DIR)/hiaiao_codec.o \
		$(ALSA_DIR)/hiaiao_i2s.o \
		$(ALSA_DIR)/alsa_aiao_proc_func.o \
		$(ALSA_DIR)/drv_ao_func.o \
		$(ALSA_DIR)/alsa_aiao_volume_func.o
#===============================================================================
#EXTRA_CFLAGS += -DHI_ALSA_AI_SUPPORT
#$(MOD_NAME)-y += $(ALSA_DIR)/drv_ai_func.o
#===============================================================================
#I2S SUPPORT
EXTRA_CFLAGS += -DHI_I2S0_SUPPORT
# EXTRA_CFLAGS += -DHI_I2S1_SUPPORT
