obj-y += vfmw_v5.0/product/make_stb/

#===============================================================================
#   rules
#===============================================================================

all:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules
	
modules_install:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules_install
