#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/higo/include

EXTRA_CFLAGS += -DHI_DISP_BUILD_FULL  -D__DISP_PLATFORM_SDK__ -D__DISP_D0_FOLLOW_D1__ -D__DISP_SELF_START__

ifeq ($(CFG_HIFB_CURSOR_SUPPORT), y)
EXTRA_CFLAGS += -DHI_GFX_USE_G3
endif

ifeq ($(CFG_HI_DISP_TTX_SUPPORT), y)
EXTRA_CFLAGS += -DHI_DISP_TTX_SUPPORT
endif

#ifeq ($(CFG_HI_DISP_CC_SUPPORT), y)
#EXTRA_CFLAGS += -DHI_DISP_CC_SUPPORT
#endif

#ifeq ($(CFG_HI_DISP_WSS_SUPPORT), y)
#EXTRA_CFLAGS += -DHI_DISP_WSS_SUPPORT
#endif

ifeq ($(CFG_HI_DISP_G1_ATTACH_HD_SUPPORT), y)
EXTRA_CFLAGS += -DHI_DISP_ATTACH_OSD_SUPPORT
endif

ifeq ($(CFG_HI_DISP_CSC_MODE_RGB), y)
EXTRA_CFLAGS += -DHI_DISP_MODE_TC
endif

ifeq ($(CFG_HI_VO_WRAP_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_WRAP_SUPPORT
endif

ifeq ($(CFG_HI_DISP_CGMS_SUPPORT), y)
EXTRA_CFLAGS += -DHI_DISP_CGMS_SUPPORT
endif

ifeq ($(CFG_HI_DISP_LCD_SUPPORT), y)
EXTRA_CFLAGS += -DHI_DISP_LCD_SUPPORT
endif

ifeq ($(CFG_HI_VO_MOSAIC_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_MOSAIC_SUPPORT
endif

ifeq ($(CFG_HI_VO_SINGLE_VIDEO_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_SINGLE_VIDEO_SUPPORT
endif

ifeq ($(CFG_HI_VO_STILLFRAME_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_STILLFRAME_SUPPORT
endif

ifeq ($(CFG_HI_VO_DUMPFRAME_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_DUMPFRAME_SUPPORT
endif

ifeq ($(CFG_HI_VO_MOSAIC_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_MOSAIC_SUPPORT
endif

EXTRA_CFLAGS += -DHI_VO_SHARPNESS_SUPPORT

ifeq ($(CFG_HI_VDEC_DEINTERLACE_SUPPORT), y)
EXTRA_CFLAGS += -DHI_VO_HD_VIDEO_DO_DEI
endif

ifeq ($(CFG_HI_VIDEO_BUFF_TYPE0), y)
EXTRA_CFLAGS += -DHI_VIDEO_BUFF_TYPE0
endif

#EXTRA_CFLAGS += -Os

MOD_NAME := hi_vou

obj-y += $(MOD_NAME).o

VO_DIR := $(shell cd $(srctree)/drivers/msp/vo && pwd)

EXTRA_CFLAGS += -DFPGA_98CV200
EXTRA_CFLAGS += -DCFG_VDP_MMU_SUPPORT
EXTRA_CFLAGS += -DCFG_VDP_MMU_DEBUG_SUPPORT
#EXTRA_CFLAGS += -DHI_VDP_WATERMARK
EXTRA_CFLAGS += -I$(srctree)/drivers/hisilicon/hi_fence
EXTRA_CFLAGS += -DHI_VO_WIN_SYNC_SUPPORT
EXTRA_CFLAGS += -DHI_VO_DISP_ISOLATED_FMT_SUPPORT

EXTRA_CFLAGS += -I$(VO_DIR)/vdp_v4_0			\
		-I$(VO_DIR)/vdp_v4_0/include		\
		-I$(VO_DIR)/vdp_v4_0/alg		\
		-I$(VO_DIR)/vdp_v4_0/alg/decompress	\
		-I$(VO_DIR)/vdp_v4_0/com		\
		-I$(VO_DIR)/vdp_v4_0/component		\
		-I$(VO_DIR)/vdp_v4_0/drv		\
		-I$(VO_DIR)/vdp_v4_0/hal/common	\
		-I$(VO_DIR)/vdp_v4_0/hal/98cv200	\
		-I$(VO_DIR)/vdp_v4_0/hal/98cv200/inc

VO_SRCS := $(wildcard $(VO_DIR)/vdp_v4_0/hal/common/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/hal/98cv200/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/alg/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/alg/decompress/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/com/*.c)
VO_SRCS += $(wildcard $(VO_DIR)/vdp_v4_0/drv/*.c)

VO_SRCS := $(filter-out %.mod.c, $(VO_SRCS))

VO_SRCS := $(filter-out %win_hdr.c, $(VO_SRCS))
VO_SRCS := $(filter-out %disp_hdr.c, $(VO_SRCS))
VO_SRCS := $(filter-out %_hdr_com.c, $(VO_SRCS))
VO_SRCS := $(filter-out %hdr_transfer.c, $(VO_SRCS))

VO_OBJS := $(patsubst $(VO_DIR)/%.c, %.o, $(VO_SRCS))

$(MOD_NAME)-y = $(VO_OBJS)
