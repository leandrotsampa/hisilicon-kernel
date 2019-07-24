#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
GPU_DIR := $(MSP_DIR)/api/gpu

HEADER_FILES += $(GPU_DIR)/include/KHR
HEADER_FILES += $(GPU_DIR)/include/EGL
HEADER_FILES += $(GPU_DIR)/include/GLES
HEADER_FILES += $(GPU_DIR)/include/GLES2
HEADER_FILES += $(GPU_DIR)/include/GLES3

MALI_VER := mali700
LIB_NAME := libmali.so

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean

all: 
	$(AT)cp -rf $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -rf $(GPU_DIR)/include/EGL/platform_fbdev/EGL/$(MALI_VER)/*.h $(INCLUDE_DIR)/EGL/
	$(AT)cp -rf $(GPU_DIR)/lib/platform_fbdev/$(CFG_HI_AARCH64_TOOLCHAINS_NAME)/$(MALI_VER)/*.so $(SHARED_LIB_DIR) 
	
	