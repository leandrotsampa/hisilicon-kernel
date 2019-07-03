
.EXPORT_ALL_VARIABLES:

SDK_CFGFILE=cfg.mak

include $(SDK_DIR)/$(SDK_CFGFILE)

#=============SDK_DIR======================================================================
SOURCE_DIR=${SDK_DIR}/source
#=============SRC_DIR======================================================================
COMMON_DIR=${SOURCE_DIR}/common


ifeq ($(CFG_HI_MSP_BUILDIN),y)
CFG_MSP_BUILDTYPE := y
else
CFG_MSP_BUILDTYPE := m
endif

