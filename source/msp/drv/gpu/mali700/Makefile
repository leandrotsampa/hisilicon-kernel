##########################################################################################
#	prepare param
##########################################################################################
export KDIR=$(KERNEL_SRC)

include kbuild_flags

##########################################################################################
#	set task
##########################################################################################
all:
	@rm -f $(CURDIR)/drivers/base/kds/kds.ko
	@rm -f $(CURDIR)/drivers/gpu/arm/midgard/mali_kbase.ko
	make -C $(CURDIR)/drivers/base/kds
	make -C $(CURDIR)/drivers/gpu/arm/midgard

modules_install:
	make -C $(KDIR) M=$(CURDIR)/drivers/base/kds modules_install
	make -C $(KDIR) M=$(CURDIR)/drivers/gpu/arm/midgard modules_install

clean:
	make -C $(CURDIR)/drivers/base/kds/ clean
	make -C $(CURDIR)/drivers/gpu/arm/midgard/ clean
