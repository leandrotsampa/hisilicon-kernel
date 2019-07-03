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
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0/scene	\
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0 \
		-I$(srctree)/drivers/msp/omxvdec/omxvdec_v2.0

EXTRA_CFLAGS += -DANDROID

#===============================================================================
# 256M ddr memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM_IN_256=7
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM_IN_256=2
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF_IN_256=110

#===============================================================================
# 512M ddr memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM_IN_512=7
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM_IN_512=2
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF_IN_512=110

#===============================================================================
# 768M ddr memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM_IN_768=5
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM_IN_768=4
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF_IN_768=180

#===============================================================================
# 1024M ddr memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM_IN_1024=5
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM_IN_1024=4
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF_IN_1024=180

#===============================================================================
# 2048M ddr memory config flags
#===============================================================================
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM_IN_2048=6
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM_IN_2048=6
EXTRA_CFLAGS += -DHI_VIDEO_MAX_VDH_BUF_IN_2048=250

#===============================================================================
# memory config end
#===============================================================================

MOD_NAME := hi_vdec

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_vdec_buf_mng.o	    \
		    drv_vdec_intf.o	    \
		    drv_vdec_intf_k.o

$(MOD_NAME)-y	+= drv_vdec_usrdata.o
