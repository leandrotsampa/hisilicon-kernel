#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/msp/hifb/include		\
		-I$(srctree)/drivers/msp/hifb/inc		\
		-I$(srctree)/drivers/msp/hifb/adp/inc		\
		-I$(srctree)/drivers/msp/hifb/adp/alg		\
		-I$(srctree)/drivers/msp/tde/include		\
		-I$(srctree)/drivers/sdk/msp-api/tde/include		\
		-I$(srctree)/drivers/sdk/msp-api/higo/include		\
		-I$(srctree)/drivers/sdk/ha_codec-include	\
		-I$(srctree)/drivers/msp/jpeg/grc_cmm_inc

HAL_DIR	 := hifb_v2_0

EXTRA_CFLAGS += -I$(srctree)/drivers/hisilicon/hi_fence \
		-I$(srctree)/drivers/msp/hifb/adp/$(HAL_DIR)

EXTRA_CFLAGS += -DCFG_HIFB_FENCE_SUPPORT
EXTRA_CFLAGS += -DCFG_HIFB_ANDROID_SUPPORT

ifeq ($(CFG_HIFB_CURSOR_SUPPORT), y)
EXTRA_CFLAGS += -DCFG_HIFB_CURSOR_SUPPORT
endif

ifeq ($(CFG_HIFB_COMPRESSION_SUPPORT), y)
EXTRA_CFLAGS += -DCFG_HIFB_COMPRESSION_SUPPORT
endif

EXTRA_CFLAGS += -DCFG_HIFB_STEREO3D_HW_SUPPORT
EXTRA_CFLAGS += -DCFG_HI_HD0_FB_VRAM_SIZE=7200
EXTRA_CFLAGS += -DCFG_HI_HD1_FB_VRAM_SIZE=0
EXTRA_CFLAGS += -DCFG_HI_HD2_FB_VRAM_SIZE=0
EXTRA_CFLAGS += -DCFG_HI_SD0_FB_VRAM_SIZE=0
EXTRA_CFLAGS += -DHIFB_PROC_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_STB_SDK
EXTRA_CFLAGS += -DCFG_HIFB_LOGO_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_HI_FB1_SMMU_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_HI_FB2_SMMU_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_PQ

MOD_NAME := hi_fb

obj-y += $(MOD_NAME).o

EXTRA_CFLAGS += -Werror

DRIVER_PATH := $(srctree)/drivers/msp/hifb

COMMON_FILES := $(wildcard $(DRIVER_PATH)/src/*.c)
ADAPT_FILES  := $(wildcard $(DRIVER_PATH)/adp/src/*.c)
HAL_FILES    := $(wildcard $(DRIVER_PATH)/adp/$(HAL_DIR)/*.c)
ALG_FILES    := $(wildcard $(DRIVER_PATH)/adp/alg/*.c)

ifeq ($(findstring -DCONFIG_GFX_PQ, $(EXTRA_CFLAGS)), -DCONFIG_GFX_PQ)
FULL_PATH_DRV_FILES += $(HAL_FILES)    \
		       $(ADAPT_FILES)  \
		       $(COMMON_FILES)
else
FULL_PATH_DRV_FILES += $(HAL_FILES)    \
		       $(ALG_FILES)    \
		       $(ADAPT_FILES)  \
		       $(COMMON_FILES)
endif

DRV_SRCS := $(shell echo $(FULL_PATH_DRV_FILES) \
	    | awk '{for(i=1;i<=NF;i++)print $$i}' \
	    | sed "s:\(.*\)/\<hifb\>\(.*\):.\2:g")

DRV_SRCS_C := $(filter-out %.S, $(DRV_SRCS))
DRV_SRCS_A := $(filter-out %.c, $(DRV_SRCS))

DRV_OBJS := $(subst .c,.o,$(DRV_SRCS_C))
DRV_OBJS += $(subst .S,.o,$(DRV_SRCS_A))

$(MOD_NAME)-y := $(DRV_OBJS)
