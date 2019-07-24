#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
ifeq ($(CFG_LIB_JPEG_VERSION_6B),y)
JPEG_VER := 6b
else ifeq ($(CFG_LIB_JPEG_VERSION_9A),y)
JPEG_VER := 9a
endif

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean

all:
	$(AT)cd src && make -f Makefile-$(JPEG_VER) all
ifeq ($(HI_USER_SPACE_LIB),y)
	$(AT)cd $(HI_STATIC_LIB_DIR) && ln -sf libjpeg$(JPEG_VER).a libjpeg.a
	$(AT)cd $(HI_SHARED_LIB_DIR) && ln -sf libjpeg$(JPEG_VER).so libjpeg.so
endif
ifeq ($(HI_USER_SPACE_LIB64),y)
	$(AT)cd $(HI_STATIC_LIB64_DIR) && ln -sf libjpeg$(JPEG_VER).a libjpeg.a
	$(AT)cd $(HI_SHARED_LIB64_DIR) && ln -sf libjpeg$(JPEG_VER).so libjpeg.so
endif

clean:
	$(AT)cd src && make -f Makefile-$(JPEG_VER) clean
	$(AT)rm -rf $(HI_STATIC_LIB_DIR)/libjpeg*.a $(HI_SHARED_LIB_DIR)/libjpeg*.so
	$(AT)rm -rf $(HI_STATIC_LIB64_DIR)/libjpeg*.a $(HI_SHARED_LIB64_DIR)/libjpeg*.so
