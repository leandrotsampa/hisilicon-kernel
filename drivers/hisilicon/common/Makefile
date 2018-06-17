###############################################################################
# local variables
###############################################################################

## header search path

EXTRA_CFLAGS := -Werror
EXTRA_CFLAGS += -I$(srctree)/drivers/hisilicon/sdk/common-include \
		-I$(srctree)/drivers/hisilicon/common/include \
		-I$(srctree)/drivers/hisilicon/common \
		-I$(srctree)/drivers/common/mmz \
		-I$(srctree)/drivers/msp/include \
		-I$(srctree)/drivers/sdk/msp-api/include \
		-I$(srctree)/drivers/sdk/msp-api/tde/include \
		-I$(srctree)/drivers/sdk/msp-include
EXTRA_CFLAGS += -DCFG_HI_LOG_LEVEL=4

MOD_NAME_CMN   := hi_common
MOD_NAME_MMZ   := hi_mmz
MOD_NAME_MEDIA := hi_media

$(MOD_NAME_CMN)-y := sys/drv_base_ext_k.o  \
	       sys/drv_sys_ext_k.o   \
	       drv_dev_ext_k.o   \
	       drv_stat_ext_k.o \
	       drv_proc_ext_k.o \
	       drv_log_ext_k.o

$(MOD_NAME_CMN)-y +=	sys/drv_base_ext.o	    \
			sys/drv_sys_ext.o	    \
			sys/drv_reg_common.o	    \
			drv_stat_ext.o	    \
			drv_mutils.o	    \
			drv_module_ext.o	    \
			drv_file_ext.o	    \
			drv_proc_ext.o	    \
			drv_log_ext.o	    \
			drv_memdev.o	    \
			drv_userproc.o	    \
			drv_osal.o

$(MOD_NAME_MEDIA)-y :=	himedia_base.o	\
			himedia.o

$(MOD_NAME_MMZ)-y := mmz/drv_mmz_ext_k.o \
    mmz/drv_mmz_intf.o \
    mmz/drv_tzsmmu.o

ifdef CONFIG_COMPAT
$(MOD_NAME_MMZ)-y += mmz/drv_mmz_compat.o
endif

$(MOD_NAME_MMZ)-y += mmz/drv_mmz_userdev.o mmz/drv_media_mem.o

###############################################################################
obj-y += $(MOD_NAME_MEDIA).o $(MOD_NAME_MMZ).o $(MOD_NAME_CMN).o
