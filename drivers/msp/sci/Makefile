#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(srctree)/drivers/sdk/msp-api/sci			\
		-I$(srctree)/drivers/msp/sci

MOD_NAME := hi_sci

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_sci_intf.o  \
		    drv_sci.o	    \
		    hal_sci.o
