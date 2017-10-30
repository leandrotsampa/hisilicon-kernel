#===============================================================================
# local variables
#===============================================================================
HDMI_DRV_DIR := $(srctree)/drivers/msp/hdmi/hdmi_2_0

EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/hdmi			\
		-I$(srctree)/drivers/msp/hdmi/hdmi_2_0	\
		-I$(srctree)/drivers/sdk/msp-api/sio			\
		-I$(srctree)/drivers/sdk/msp-api/higo/include		\
		-I$(srctree)/drivers/common/include/hi3798cv200

EXTRA_CFLAGS += -DCONFIG_HDMI_STB_SDK

EXTRA_CFLAGS += -DHDMI_DVI_SUPPORT
EXTRA_CFLAGS += -DHDMI_SCDC_SUPPORT

ifeq ($(CFG_HI_HDMI_SUPPORT_DVI), y)
EXTRA_CFLAGS += -DHDMI_DVI_SUPPORT
endif

ifeq ($(CFG_HI_HDMI_SUPPORT_3D), y)
EXTRA_CFLAGS += -DHDMI_3D_SUPPORT
endif

EXTRA_CFLAGS += -DHDMI_HDR_SUPPORT
EXTRA_CFLAGS += -DHDMI_DEBUG_SUPPORT

# If HDMI debugging is desired, un-comment the following line
# EXTRA_CFLAGS += -DHDMI_DEBUG

#open it when emi is enable default
#EXTRA_CFLAGS += -DHDMI_EMI_ENABLE


MOD_NAME := hi_hdmi

obj-y += $(MOD_NAME).o

####################################################################
# hi3798cv200 HAL start
####################################################################
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/osal/hisiv200
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/product/Hi3798CV200
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/common
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/cpi
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tpg
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/vtg
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/pll
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/cra
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx/hdcp
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx/scdc
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx/tx_hdmi
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx/videopath
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/driver/tx/tx_mhl
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/emi

#EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/edid
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/log
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/malloc
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/obj
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/seq
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/time
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/mtx
EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/library/video

EXTRA_CFLAGS += -I$(HDMI_DRV_DIR)/hal/ctrl/imagev200/platform

DRV_OBJS := hdmi_2_0/hal/ctrl/imagev200/driver/common/si_drv_common.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/cpi/si_drv_cpi.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/si_drv_tx.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/tx_hdmi/si_mod_tx_hdmi.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/scdc/si_mod_tx_scdc.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/videopath/si_mod_videopath.o   \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/videopath/si_mod_videopath_cra.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/hdcp/si_mod_tx_hdcp.o   \
	    hdmi_2_0/hal/ctrl/imagev200/driver/cra/si_drv_cra.o  \
	    hdmi_2_0/hal/ctrl/imagev200/library/log/si_lib_log.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/malloc/si_lib_malloc.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/obj/si_lib_obj.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/seq/si_lib_seq.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/time/si_lib_time.o \
	    hdmi_2_0/hal/ctrl/imagev200/platform/platform.o \
	    hdmi_2_0/hal/ctrl/imagev200/platform/sii_time.o

#DRV_OBJS += hdmi_2_0/hal/ctrl/imagev200/driver/tpg/si_drv_tpg.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/vtg/si_drv_vtg.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/pll/si_drv_pll_vo.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/pll/si_drv_pll_vo_cfg.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/video/si_lib_video.o \
	    hdmi_2_0/hal/ctrl/imagev200/library/mtx/si_lib_mtx.o

#DRV_OBJS += hdmi_2_0/hal/ctrl/imagev200/driver/pebbles/si_drv_pebbles.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/tx_mhl/si_mod_tx_mhl.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/tx_mhl/emsc/si_mod_tx_cbus_emsc.o \
	    hdmi_2_0/hal/ctrl/imagev200/driver/tx/tx_mhl/mdt/si_mod_tx_cbus_mdt.o

DRV_OBJS += hdmi_2_0/hal/ctrl/imagev200/hdmi_hal.o
DRV_OBJS += hdmi_2_0/hal/ctrl/imagev200/hal_cec.o

DRV_OBJS += hdmi_2_0/hal/emi/hdmi_emi.o

####################################################################
# hi3798cv200 HAL end
####################################################################

####################################################################
# common
####################################################################
DRV_OBJS += hdmi_2_0/product/Hi3798CV200/hdmi_product_define.o
DRV_OBJS += hdmi_2_0/osal/hisiv200/hdmi_osal.o

DRV_OBJS += hdmi_2_0/drv_hdmi_infoframe.o \
	    hdmi_2_0/drv_hdmi_event.o \
	    hdmi_2_0/drv_hdmi_edid.o \
	    hdmi_2_0/drv_hdmi_edid_test.o \
	    hdmi_2_0/drv_hdmi_intf.o \
	    hdmi_2_0/drv_hdmi_intf_k.o \
	    hdmi_2_0/drv_hdmi_common.o \
	    hdmi_2_0/drv_hdmi_compatibility.o \
	    hdmi_2_0/drv_hdmi_srm.o \
	    hdmi_2_0/drv_hdmi_debug.o \
	    hdmi_2_0/drv_hdmi_log.o \
	    hdmi_2_0/drv_hdmi_proc.o

$(MOD_NAME)-y := $(DRV_OBJS)
