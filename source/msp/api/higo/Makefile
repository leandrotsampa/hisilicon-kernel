#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
HIGO_DIR := $(shell pwd)

HIGO_LIB_VER = libjpeg6b_libpng1.4.16
#HIGO_LIB_VER = libjpeg9a_libpng1.6.16

HIGO_GHFP_DIR64 := $(HIGO_DIR)/lib/$(HIGO_LIB_VER)/$(CFG_HI_AARCH64_TOOLCHAINS_NAME)

HEADER_FILES := $(HIGO_DIR)/include/hi_go_winc.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_text.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_surface.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_gdev.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_errno.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_encoder.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_decoder.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_cursor.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_comm.h
HEADER_FILES += $(HIGO_DIR)/include/hi_go_bliter.h
HEADER_FILES += $(HIGO_DIR)/include/hi_effect.h

#===============================================================================
# rules
#===============================================================================


all:
	$(AT)cp -rf $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -rf $(HIGO_GHFP_DIR64)/nca_lib/*.so     $(SHARED_LIB_DIR)/
	$(AT)cp -rf $(HIGO_GHFP_DIR64)/higo-adp         $(EXTERN_LIB_DIR)/
	$(AT)cp -rf $(HIGO_GHFP_DIR64)/nca_lib/*.a      $(STATIC_LIB_DIR)/
 
