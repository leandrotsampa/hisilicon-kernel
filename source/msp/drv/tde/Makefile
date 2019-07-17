#===============================================================================
# local variables
#===============================================================================
TARGET := tde

HAL_DIR := tde_v1_0

EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_DRV_INCLUDE) \
                -I$(MSP_DIR)/api/$(TARGET)/include \
                -I$(MSP_DIR)/drv/jpeg/grc_cmm_inc \
                -I$(MSP_DIR)/drv/tde/include \
                -I$(MSP_DIR)/drv/tde/adp/$(HAL_DIR)

		
EXTRA_CFLAGS += -DHI_TDE_MEMCOUNT_SUPPORT=0
EXTRA_CFLAGS += -DHI_TDE_BUFFER=0x20000
EXTRA_CFLAGS += -DCONFIG_GFX_STB_SDK
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_SUPPORT
EXTRA_CFLAGS += -DCONFIG_GFX_MMU_CLOCK

MOD_NAME := hi_$(TARGET)

obj-m += $(MOD_NAME).o

$(MOD_NAME)-y	:=  src/tde_osr.o	\
		    src/tde_osr_k.o	\
		    src/tde_handle_k.o	\
		    src/tde_osilist_k.o \
		    src/tde_proc_k.o	\
		    src/wmalloc_k.o	\
		    adp/$(HAL_DIR)/tde_hal_k.o	   \
		    adp/$(HAL_DIR)/tde_osictl_k.o  \
		    adp/$(HAL_DIR)/tde_adp.o

#===============================================================================
#   rules
#===============================================================================

all:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules
	
modules_install:
	$(AT)make -C $(KERNEL_SRC) M=$(CURDIR) modules_install
	
