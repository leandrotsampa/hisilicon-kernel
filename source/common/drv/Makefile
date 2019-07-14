###############################################################################
# local variables
###############################################################################

## header search path

EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(SDK_DIR)/source/common/include \
                -I$(SDK_DIR)/source/common/drv/include \
                -I$(SDK_DIR)/source/common/drv/log \
                -I$(SDK_DIR)/source/common/drv/mem
EXTRA_CFLAGS += -DCFG_HI_LOG_LEVEL=4

MOD_NAME_CMN   := hi_common
MOD_NAME_MMZ   := hi_mmz
MOD_NAME_MEDIA := hi_media

$(MOD_NAME_CMN)-y := sys/drv_base_ext_k.o  \
	       sys/drv_sys_ext_k.o   \
	       dev/drv_dev_ext_k.o   \
	       stat/drv_stat_ext_k.o \
	       proc/drv_proc_ext_k.o \
	       log/drv_log_ext_k.o

$(MOD_NAME_CMN)-y +=	sys/drv_base_ext.o	    \
			sys/drv_sys_ext.o	    \
			sys/drv_reg_common.o	    \
			stat/drv_stat_ext.o	    \
			mem/drv_mutils.o	    \
			module/drv_module_ext.o	    \
			file/drv_file_ext.o	    \
			proc/drv_proc_ext.o	    \
			log/drv_log_ext.o	    \
			memdev/drv_memdev.o	    \
			userproc/drv_userproc.o	    \
			osal/drv_osal.o

$(MOD_NAME_MEDIA)-y :=	himedia/himedia_base.o	\
			himedia/himedia.o

$(MOD_NAME_MMZ)-y := mmz/drv_mmz_ext_k.o \
    mmz/drv_mmz_intf.o \
    mmz/drv_tzsmmu.o

ifdef CONFIG_COMPAT
$(MOD_NAME_MMZ)-y += mmz/drv_mmz_compat.o
endif

$(MOD_NAME_MMZ)-y += mmz/drv_mmz_userdev.o mmz/drv_media_mem.o

###############################################################################
obj-m += $(MOD_NAME_MEDIA).o $(MOD_NAME_MMZ).o $(MOD_NAME_CMN).o

###############################################################################
#   rules
###############################################################################

all:
	make -C $(KERNEL_SRC) M=`pwd` modules
	
clean:
	rm -f *.o .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	
modules_install:
	make -C $(KERNEL_SRC) M=`pwd` modules_install
	
