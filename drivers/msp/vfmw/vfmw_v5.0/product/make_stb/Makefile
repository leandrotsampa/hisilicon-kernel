#===============================================================================
# local variables
#===============================================================================
VFMW_DIR := $(srctree)/drivers/msp/vfmw/vfmw_v5.0

EXTRA_CFLAGS += -fno-pic
EXTRA_CFLAGS += -DVFMW_HDR_SUPPORT
EXTRA_CFLAGS += -DVFMW_MMU_SUPPORT
EXTRA_CFLAGS += -DVFMW_STB_PRODUCT
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include \
		-I$(srctree)/drivers/sdk/msp-include \
		-I$(srctree)/drivers/common/include \
		-I$(srctree)/drivers/common/include/hi3798cv200 \
		-I$(srctree)/drivers/msp/include
#================================================================================
# product specific varibles
#================================================================================
include $(VFMW_DIR)/product/Hi3798CV200/KNL_CFG/vfmw_make.cfg
EXTRA_CFLAGS += $(VFMW_CFLAGS)

MOD_NAME := hi_vfmw
obj-y += $(MOD_NAME).o
$(MOD_NAME)-y := $(VFMW_OBJS)
