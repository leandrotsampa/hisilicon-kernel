#===============================================================================
# local variables
#===============================================================================
MP3DEC_DIR = $(srctree)/drivers/msp/adec/adec_v1_1/mp3dec

EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(MP3DEC_DIR)				\
		-I$(MP3DEC_DIR)/mp3dec_core/src		     \
		-I$(MP3DEC_DIR)/mp3dec_core/include	     \
		-I$(MP3DEC_DIR)/mp3dec_core/layer12	     \
		-I$(MP3DEC_DIR)/src			\
		-I$(MP3DEC_DIR)/include

EXTRA_CFLAGS += -DMPEG_LAYER12_SUPPORT
EXTRA_CFLAGS += -DINTERLEAVED_OUTPUT

# The following should be removed occasionally to ensure no new
# *real* problems have been added.  All warnings of this type were
# checked at the time these flags were added.
EXTRA_CFLAGS += $(shell [ $(cc-version) -ge 0700 ] &&			\
				echo "-Wno-format-truncation")

HI_DRV_DIR := $(srctree)/drivers/msp

MOD_NAME := hi_adec

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_adec.o drv_adec_k.o
