#===============================================================================
# local variables
#===============================================================================
DEMUX_DRV_VER = demux_v2

EXTRA_CFLAGS += -Werror

EXTRA_CFLAGS += -I$(srctree)/drivers/sdk/common-include \
		-I$(srctree)/drivers/common/include \
		-I$(srctree)/drivers/sdk/msp-include \
		-I$(srctree)/drivers/sdk/msp-api/include \
		-I$(srctree)/drivers/msp/include \
		-I$(srctree)/drivers/sdk/msp-api/demux/$(DEMUX_DRV_VER) \
		-I$(srctree)/drivers/msp/demux/$(DEMUX_DRV_VER) \

EXTRA_CFLAGS += -DHI_DEMUX_PROC_SUPPORT
EXTRA_CFLAGS += -DDMX_MMU_SUPPORT

MOD_NAME := hi_demux

obj-y += $(MOD_NAME).o

$(MOD_NAME)-y	:=  $(DEMUX_DRV_VER)/drv_demux_intf.o	     \
		    $(DEMUX_DRV_VER)/drv_demux.o	     \
		    $(DEMUX_DRV_VER)/drv_demux_func.o	     \
		    $(DEMUX_DRV_VER)/hal_demux.o	     \
		    $(DEMUX_DRV_VER)/drv_demux_osal.o	     \
		    $(DEMUX_DRV_VER)/drv_demux_scd.o	     \
		    $(DEMUX_DRV_VER)/drv_demux_bitstream.o   \
		    $(DEMUX_DRV_VER)/drv_demux_index.o	     \
		    $(DEMUX_DRV_VER)/drv_demux_sw.o


ifeq ($(CFG_HI_DMX_DESCRAMBLER_SUPPORT),y)
EXTRA_CFLAGS += -I$(srctree)/drivers/msp/demux/$(DEMUX_DRV_VER)/descrambler
EXTRA_CFLAGS += -DDMX_DESCRAMBLER_SUPPORT
$(MOD_NAME)-y	+=  $(DEMUX_DRV_VER)/descrambler/drv_descrambler.o	 \
		    $(DEMUX_DRV_VER)/descrambler/drv_descrambler_func.o	 \
		    $(DEMUX_DRV_VER)/descrambler/hal_descrambler.o
endif
