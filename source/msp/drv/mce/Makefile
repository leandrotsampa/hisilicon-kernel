#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_API_INCLUDE) \
                -I$(MSP_DRV_INCLUDE) \
                -I$(COMMON_DIR)/drv/mmz \
                -I$(MSP_DIR)/api/higo/include

#EXTRA_CFLAGS += -DANDROID

MOD_NAME := hi_mce

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_mce_intf.o

#===============================================================================
#   rules
#===============================================================================

all:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules
	
modules_install:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules_install
	
