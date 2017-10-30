#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include

# The following should be removed occasionally to ensure no new
# *real* problems have been added.  All warnings of this type were
# checked at the time these flags were added.
EXTRA_CFLAGS += $(shell [ $(cc-version) -ge 0700 ] &&			\
				echo "-Wno-format-truncation")

MOD_NAME := hi_aenc

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_aenc.o
