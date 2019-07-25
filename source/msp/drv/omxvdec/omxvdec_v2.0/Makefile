#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_API_INCLUDE) \
                -I$(MSP_DRV_INCLUDE) \
                -I$(MSP_DIR)/drv/vfmw/vfmw_v5.0/adapter

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

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y := omxvdec.o channel.o task.o message.o decoder_vfmw.o processor_vpss.o omxvdec_mem.o
