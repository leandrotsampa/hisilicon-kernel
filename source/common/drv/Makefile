###############################################################################
# local variables
###############################################################################
KERNEL := $(KERNEL_SRC)

## header search path

EXTRA_CFLAGS += -I$(COMMON_DIR)/include \
                -I$(COMMON_DIR)/drv/include \
                -I$(COMMON_DIR)/drv/log \


MOD_NAME_CMN   := hi_common
MOD_NAME_MMZ   := hi_mmz
MOD_NAME_MEDIA := hi_media

$(MOD_NAME_CMN)-y := sys/drv_base_ext_k.o

               
$(MOD_NAME_CMN)-y +=    sys/drv_base_ext.o


###############################################################################
obj-$(CFG_MSP_BUILDTYPE) += $(MOD_NAME_CMN).o
###############################################################################

###############################################################################
#   rules
###############################################################################

all:
	make -C $(KERNEL) M=`pwd` modules
	
clean:
	
modules_install:


