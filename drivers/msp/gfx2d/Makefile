#===============================================================================
# local variables
#===============================================================================

TARGET := gfx2d

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/$(TARGET)/include	\
		-I$(srctree)/drivers/msp/$(TARGET)		\
		-I$(srctree)/drivers/msp/$(TARGET)/hwc		\
		-I$(srctree)/drivers/common/mmz			\
		-I$(srctree)/drivers/msp/jpeg/grc_cmm_inc

EXTRA_CFLAGS += -Werror
EXTRA_CFLAGS += -DCONFIG_GFX_STB_SDK
EXTRA_CFLAGS += -I$(srctree)/drivers/hisilicon/hi_fence
#EXTRA_CFLAGS += -DGFX2D_FENCE_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_SUPPORT

MOD_NAME := hi_$(TARGET)

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y :=    gfx2d_os.o \
		    gfx2d_ctl.o \
		    gfx2d_list.o \
		    gfx2d_hal.o \
		    gfx2d_mem.o\
		    hwc/v1/gfx2d_hal_hwc.o \
		    hwc/v1/gfx2d_hal_hwc_adp.o \
		    gfx2d_config.o \
		    gfx2d_fence.o
