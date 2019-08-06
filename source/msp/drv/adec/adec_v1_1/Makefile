#===============================================================================
# local variables
#===============================================================================
MP3DEC_DIR = $(MSP_DIR)/drv/adec/adec_v1_1/mp3dec

EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_API_INCLUDE) \
                -I$(MSP_DRV_INCLUDE)

EXTRA_CFLAGS += -DMPEG_LAYER12_SUPPORT
EXTRA_CFLAGS += -DINTERLEAVED_OUTPUT

# The following should be removed occasionally to ensure no new
# *real* problems have been added.  All warnings of this type were
# checked at the time these flags were added.
EXTRA_CFLAGS += $(shell [ $(cc-version) -ge 0700 ] &&			\
				echo "-Wno-format-truncation")

MOD_NAME := hi_adec

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_adec.o drv_adec_k.o
