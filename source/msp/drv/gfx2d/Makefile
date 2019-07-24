#===============================================================================
# local variables
#===============================================================================

TARGET := gfx2d

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_DIR)/drv/$(TARGET)/hwc \
                -I$(COMMON_DIR)/drv/mmz \
                -I$(MSP_DIR)/drv/jpeg/grc_cmm_inc

EXTRA_CFLAGS += -Werror
EXTRA_CFLAGS += -DCONFIG_GFX_STB_SDK
#EXTRA_CFLAGS += -I$(srctree)/drivers/staging/android
#EXTRA_CFLAGS += -DGFX2D_FENCE_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_SUPPORT

MOD_NAME := hi_$(TARGET)

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y :=    gfx2d_os.o \
		    gfx2d_ctl.o \
		    gfx2d_list.o \
		    gfx2d_hal.o \
		    gfx2d_mem.o\
		    hwc/v1/gfx2d_hal_hwc.o \
		    hwc/v1/gfx2d_hal_hwc_adp.o \
		    gfx2d_config.o \
		    gfx2d_fence.o

#===============================================================================
#   rules
#===============================================================================

all:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules
	
modules_install:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules_install
	
		    