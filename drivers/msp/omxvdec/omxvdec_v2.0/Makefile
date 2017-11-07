#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			   \
		-I$(srctree)/drivers/common/include			   \
		-I$(srctree)/drivers/common/mmz				   \
		-I$(srctree)/drivers/sdk/msp-include			   \
		-I$(srctree)/drivers/sdk/msp-api/include			   \
		-I$(srctree)/drivers/msp/include			   \
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0		   \
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0/adapter	   \
		-I$(srctree)/drivers/msp/vdec
EXTRA_CFLAGS += -DHI_SMMU_SUPPORT

EXTRA_CFLAGS += -DVFMW_COMPRESS_SUPPORT

EXTRA_CFLAGS += -DHI_PROC_SUPPORT=1
EXTRA_CFLAGS += -DCHIP_TYPE_hi3798cv200

ifeq (y,$(CFG_HI_VDEC_PRE_ALLOC_VDHMMZ_SUPPORT))
EXTRA_CFLAGS += -DPRE_ALLOC_VDEC_VDH_MMZ=1
else
EXTRA_CFLAGS += -DPRE_ALLOC_VDEC_VDH_MMZ=0
endif

ifeq ($(CFG_ANDROID_TVOS),y)
EXTRA_CFLAGS += -DHI_TVOS_SUPPORT
endif

MOD_NAME := hi_omxvdec

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y := omxvdec.o channel.o task.o message.o decoder_vfmw.o processor_vpss.o omxvdec_mem.o
