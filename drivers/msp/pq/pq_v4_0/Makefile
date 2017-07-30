#===============================================================================
# local variables
#===============================================================================
VERSION := pq_v4_0
MOD_NAME := hi_pq

HAL_DIR := hal
MNG_DIR := mng

obj-y += $(MOD_NAME).o

ASM_DST_DIR := mng/64bit

CHIP := 3798cv200
module :=  comm table zme csc gfxzme gfxcsc

EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include			\
		-I$(MSP_DRV_REG_INCLUDE)		\
		-I$(srctree)/drivers/sdk/msp-api/pq/include		\
		-I$(srctree)/drivers/sdk/msp-api/higo/include		\
		-I$(srctree)/drivers/msp/pq/$(VERSION)/mng	\
		-I$(srctree)/drivers/msp/pq/$(VERSION)/mng/$(CHIP) \
		-I$(srctree)/drivers/msp/pq/$(VERSION)/hal/$(CHIP) \
		-I$(srctree)/drivers/msp/pq/$(VERSION)/hal/common  \
		-I$(srctree)/drivers/msp/pq/$(VERSION)

KBUILD_EXTRA_SYMBOLS += $(srctree)/drivers/common/Module.symvers

EXTRA_CFLAGS += -DHI_PQ_SMMU_SUPPORT
#EXTRA_CFLAGS += -DHI_PQ_4K_TNR_SUPPORT

$(MOD_NAME)-y +=    drv_pq.o			    \
		    drv_pq_intf.o		    \
		    drv_pq_comm.o		    \
		    drv_pq_table.o		    \
		    drv_pq_proc.o		    \
		    $(HAL_DIR)/common/pq_hal_comm.o

$(MOD_NAME)-y +=  $(HAL_DIR)/$(CHIP)/pq_hal_table_default.o
EXTRA_CFLAGS += -DPQ_ALG_TABLE

$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_csc.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_csc.o
EXTRA_CFLAGS += -DPQ_ALG_CSC

$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_zme.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_zme.o
EXTRA_CFLAGS += -DPQ_ALG_ZME

$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxcsc.o
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxbt2020.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_gfxcsc.o
EXTRA_CFLAGS += -DPQ_ALG_GFXCSC

$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxzme.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_gfxzme.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_gfxzme_coef.o
EXTRA_CFLAGS += -DPQ_ALG_GFXZME

asflags-y := -I$(srctree)/drivers/common/include
