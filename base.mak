
.EXPORT_ALL_VARIABLES:

SDK_CFGFILE=cfg.mak

include $(SDK_DIR)/$(SDK_CFGFILE)

#=============SDK_DIR======================================================================
SOURCE_DIR=${SDK_DIR}/source
#=============SRC_DIR======================================================================
MSP_DIR=${SOURCE_DIR}/msp
COMMON_DIR=${SOURCE_DIR}/common
#=============INCLUDE_DIR==================================================================
MSP_UNF_INCLUDE=${MSP_DIR}/include
MSP_API_INCLUDE=${MSP_DIR}/api/include
MSP_DRV_INCLUDE=${MSP_DIR}/drv/include
COMMON_UNF_INCLUDE=${COMMON_DIR}/include
COMMON_API_INCLUDE=${COMMON_DIR}/api/include
COMMON_DRV_INCLUDE=${COMMON_DIR}/drv/include

CFG_HI_AARCH64_TOOLCHAINS_NAME := aarch64-histbv100-linux

ifeq ($(CFG_HI_MSP_BUILDIN),y)
CFG_MSP_BUILDTYPE := y
else
CFG_MSP_BUILDTYPE := m
endif

CFG_HI_CFLAGS += -DHI_SMMU_SUPPORT

