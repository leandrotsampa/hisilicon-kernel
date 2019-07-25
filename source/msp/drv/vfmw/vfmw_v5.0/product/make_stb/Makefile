#===============================================================================
# local variables
#===============================================================================
VFMW_DIR := $(SDK_DIR)/source/msp/drv/vfmw/vfmw_v5.0

EXTRA_CFLAGS += -fno-pic
EXTRA_CFLAGS += -DVFMW_HDR_SUPPORT
EXTRA_CFLAGS += -DVFMW_MMU_SUPPORT
EXTRA_CFLAGS += -DVFMW_STB_PRODUCT
EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE)

#================================================================================
# product specific varibles
#================================================================================
include $(VFMW_DIR)/product/Hi3798CV200/KNL_CFG/vfmw_make.cfg
EXTRA_CFLAGS += $(VFMW_CFLAGS)

MOD_NAME := hi_vfmw
obj-m += $(MOD_NAME).o
$(MOD_NAME)-y := $(VFMW_OBJS)
