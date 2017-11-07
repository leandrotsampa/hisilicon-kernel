#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/msp/vdec/vdec_v2.0		\
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0/adapter	\
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0 \
		-I$(srctree)/drivers/msp/omxvdec/omxvdec_v2.0

EXTRA_CFLAGS += -DANDROID

EXTRA_CFLAGS += -DHI_SMMU_SUPPORT
EXTRA_CFLAGS += -DHI_HDR_SUPPORT


#===============================================================================
# memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM=5
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM=4
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF=180


#===============================================================================
# memory config end
#===============================================================================
EXTRA_CFLAGS += -DHI_VDEC_MAX_INSTANCE=16
EXTRA_CFLAGS += -DHI_VDEC_SVDEC_SUPPORT=0
EXTRA_CFLAGS += -DHI_VDEC_HD_SIMPLE=0
EXTRA_CFLAGS += -DHI_VDEC_USERDATA_CC_SUPPORT=1

ifeq ($(CFG_HI_TEE_SUPPORT),y)
EXTRA_CFLAGS += -DHI_TEE_SUPPORT
endif

EXTRA_CFLAGS += -DPRE_ALLOC_VDEC_VDH_MMZ=0

MOD_NAME := hi_vdec

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_vdec_buf_mng.o	    \
		    drv_vdec_intf.o	    \
		    drv_vdec_intf_k.o

$(MOD_NAME)-y	+= drv_vdec_usrdata.o
