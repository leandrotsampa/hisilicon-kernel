#===============================================================================
# local variables
#===============================================================================
VPSS_DIR := $(srctree)/drivers/msp/vpss

EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include			\
		-I$(srctree)/drivers/common/include			\
		-I$(srctree)/drivers/sdk/msp-include			\
		-I$(srctree)/drivers/sdk/msp-api/include			\
		-I$(srctree)/drivers/msp/include


EXTRA_CFLAGS += -DHI_VPSS_SMMU_SUPPORT
MOD_NAME := hi_vpss

obj-y += $(MOD_NAME).o

EXTRA_CFLAGS += -I$(VPSS_DIR)/vpss_v4_0/			\
		    -I$(VPSS_DIR)/vpss_v4_0/hal			\
		    -I$(VPSS_DIR)/vpss_v4_0/vpss_in		\
		    -I$(VPSS_DIR)/vpss_v4_0/alg \
		    -I$(VPSS_DIR)/vpss_v4_0/vpss_in/hi3798cv200 \
		    -I$(VPSS_DIR)/vpss_v4_0/hal/hi3798cv200	\

$(MOD_NAME)-y	:=  vpss_v4_0/vpss_osal.o \
		    vpss_v4_0/vpss_info.o\
		    vpss_v4_0/vpss_fb.o \
		    vpss_v4_0/vpss_mcdei.o \
		    vpss_v4_0/vpss_stt_mcdei.o \
		    vpss_v4_0/vpss_wbc_mcdei.o \
		    vpss_v4_0/vpss_wbc.o \
		    vpss_v4_0/vpss_in/vpss_src.o \
		    vpss_v4_0/vpss_his.o \
		    vpss_v4_0/vpss_sttinf.o \
		    vpss_v4_0/vpss_in/vpss_img.o \
		    vpss_v4_0/alg/vpss_alg_ratio.o \
		    vpss_v4_0/alg/vpss_alg_rwzb.o \
		    vpss_v4_0/alg/vpss_alg_scd.o\
		    vpss_v4_0/vpss_rwzb.o \
		    vpss_v4_0/vpss_instance.o\
		    vpss_v4_0/vpss_ctrl.o \
		    vpss_v4_0/drv_vpss_intf_k.o \
		    vpss_v4_0/vpss_trans_fb.o

$(MOD_NAME)-y	+=  \
	    vpss_v4_0/vpss_in/hi3798cv200/vpss_in_3798cv200.o \
	    vpss_v4_0/hal/hi3798cv200/vpss_reg_3798cv200.o \
	    vpss_v4_0/hal/hi3798cv200/vpss_hal_3798cv200.o
