#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			   \
		-I$(srctree)/drivers/common/include			   \
		-I$(srctree)/drivers/sdk/msp-include			   \
		-I$(srctree)/drivers/sdk/msp-api/include			   \
		-I$(srctree)/drivers/msp/include			   \
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0		   \
		-I$(srctree)/drivers/msp/vfmw/vfmw_v5.0/scene	   \
		-I$(srctree)/drivers/msp/vdec
EXTRA_CFLAGS += -DVFMW_COMPRESS_SUPPORT

MOD_NAME := hi_omxvdec

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y := omxvdec.o channel.o task.o message.o decoder_vfmw.o processor_vpss.o omxvdec_mem.o
