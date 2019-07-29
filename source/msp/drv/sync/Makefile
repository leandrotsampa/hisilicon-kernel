#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_DRV_INCLUDE)

MOD_NAME := hi_sync

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_sync.o		 \
		    drv_sync_intf.o	 \
		    drv_sync_intf_k.o	 \
		    drv_sync_stc.o

#===============================================================================
#   rules
#===============================================================================

all:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules
	
modules_install:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules_install
	
