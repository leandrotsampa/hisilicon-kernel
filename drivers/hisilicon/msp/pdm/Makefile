#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/hisilicon/sdk/common-include			\
		-I$(srctree)/drivers/hisilicon/common/include			\
		-I$(srctree)/drivers/hisilicon/sdk/msp-include			\
		-I$(srctree)/drivers/hisilicon/sdk/msp-api/include			\
		-I$(srctree)/drivers/hisilicon/msp/include			\
		-I$(srctree)/drivers/sdk/ha_codec-include	\
		-I$(srctree)/drivers/hisilicon/msp/pdm/db			\
		-I$(srctree)/drivers/hisilicon/sdk/msp-api/higo/include		\
		-I$(srctree)/drivers/common/sys			\
		-I$(srctree)/drivers/common/mmz

MOD_NAME := hi_pdm

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  drv_pdm_intf.o  \
		    drv_pdm.o	    \
		    db/hi_db.o
