#===============================================================================
# export variable
#===============================================================================
SDK_DIR ?= $(CURDIR)/../../..

include $(SDK_DIR)/base.mak

#=======================================
#	local varibale
#=======================================

CFLAGS += -I$(MSP_DIR)/api/tde/include

#--------------- HDMI ------------------
HDMI_VER := hdmi_2_0

CFLAGS += -I$(MSP_DIR)/drv/hdmi/$(HDMI_VER) \
          -DCONFIG_HDMI_STB_SDK

SRCS := hdmi/$(HDMI_VER)/mpi_hdmi.c \
        hdmi/$(HDMI_VER)/unf_hdmi.c

#--------------- VO ------------------

SRCS += vo/unf_vo.c \
        vo/unf_display.c \
        vo/unf_edid.c \
        vo/mpi_win.c \
        vo/mpi_disp_tran.c \
        vo/mpi_disp.c \
        vo/win_ratio.c \
        vo/mpi_edid.c

#--------------- DEMUX ------------------

DEMUX_VER := demux_v2

CFLAGS += -I$(MSP_DIR)/drv/demux/$(DEMUX_VER)

SRCS += demux/$(DEMUX_VER)/mpi_demux.c \
        demux/$(DEMUX_VER)/unf_demux.c \
        demux/$(DEMUX_VER)/mpi_descrambler.c \
        demux/$(DEMUX_VER)/unf_descrambler.c
        
#--------------- TDE ------------------

SRCS += tde/unf_tde.c

#--------------- PQ ------------------

SRCS += pq/mpi_pq.c \
        pq/unf_pq.c


#--------------- AVPLAY ------------------

SRCS += avplay/mpi_avplay.c \
        avplay/unf_avplay.c \
        avplay/avplay_frc.c \
        avplay/frame_detect.c \
        avplay/bitstream.c
        
        
#--------------- SYNC ------------------
SRCS += sync/mpi_sync.c

#--------------- ADEC ------------------

SRCS += adec/mpi_adec.c \
        adec/mpi_adec_core.c
        
ADEC_IMPLE_OBJ := adec/mpi_adec_imple.o
        
ADEC_IMPLE_LIBNAME := libhi_adecimple.a

ADEC_IMPLE64_LIB := $(MSP_DIR)/api/adec/lib/$(CFG_HI_AARCH64_TOOLCHAINS_NAME)/$(ADEC_IMPLE_LIBNAME)
                
#--------------- AO ------------------
CFLAGS += -I$(MSP_DIR)/drv/adsp/adsp_v1_1/include

ifeq ($(CFG_HI_AI_SUPPORT),y)
CFLAGS += -DHI_SOUND_AI_SUPPORT
endif

ifeq ($(CFG_HI_SND_SPDIF_DELAY_SUPPORT),y)
CFLAGS += -DHI_SOUND_SPDIF_COMPENSATION_SUPPORT
endif

SRCS += ao/unf_sound.c \
        ao/mpi_ao.c \
        ao/mpi_vir.c \
        ao/mpi_lowlatency.c

#--------------- VDEC ------------------
VDEC_VER := vdec_v2.0
VFMW_VER := vfmw_v5.0

CFLAGS += -I$(MSP_DIR)/drv/vfmw/$(VFMW_VER)/adapter

CFLAGS += -DHI_VIDEO_PRE_CAP_1080P_IN_256=1
CFLAGS += -DHI_VIDEO_PRE_CAP_MVC_IN_256=0
CFLAGS += -DHI_VIDEO_PRE_CAP_2160P_IN_256=0
CFLAGS += -DHI_VIDEO_PRE_CAP_4K_IN_256=0

CFLAGS += -DHI_VIDEO_PRE_CAP_1080P_IN_512=0
CFLAGS += -DHI_VIDEO_PRE_CAP_MVC_IN_512=1
CFLAGS += -DHI_VIDEO_PRE_CAP_2160P_IN_512=0
CFLAGS += -DHI_VIDEO_PRE_CAP_4K_IN_512=0

CFLAGS += -DHI_VIDEO_PRE_CAP_1080P_IN_768=0
CFLAGS += -DHI_VIDEO_PRE_CAP_MVC_IN_768=0
CFLAGS += -DHI_VIDEO_PRE_CAP_2160P_IN_768=0
CFLAGS += -DHI_VIDEO_PRE_CAP_4K_IN_768=1

CFLAGS += -DHI_VIDEO_PRE_CAP_1080P_IN_1024=0
CFLAGS += -DHI_VIDEO_PRE_CAP_MVC_IN_1024=0
CFLAGS += -DHI_VIDEO_PRE_CAP_2160P_IN_1024=0
CFLAGS += -DHI_VIDEO_PRE_CAP_4K_IN_1024=1

CFLAGS += -DHI_VIDEO_PRE_CAP_1080P_IN_2048=0
CFLAGS += -DHI_VIDEO_PRE_CAP_MVC_IN_2048=0
CFLAGS += -DHI_VIDEO_PRE_CAP_2160P_IN_2048=0
CFLAGS += -DHI_VIDEO_PRE_CAP_4K_IN_2048=1

SRCS += vdec/$(VDEC_VER)/hi_codec.c \
        vdec/$(VDEC_VER)/mpi_vdec_adapter.c \
        vdec/$(VDEC_VER)/mpi_vdec.c
        
#-------------------------------------

CFG_HI_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                 -I$(COMMON_API_INCLUDE) \
                 -I$(COMMON_DRV_INCLUDE) \
                 -I$(MSP_UNF_INCLUDE) \
                 -I$(MSP_API_INCLUDE) \
                 -I$(MSP_DRV_INCLUDE)
                 
CFLAGS += -fPIC

LIBS := libhi_msp

HEADER_FILES := $(wildcard $(MSP_UNF_INCLUDE)/*.h) \
                $(MSP_DIR)/api/tde/include/hi_tde_api.h \
                $(MSP_DIR)/api/tde/include/hi_tde_errcode.h \
                $(MSP_DIR)/api/tde/include/hi_tde_type.h \
                $(MSP_DIR)/drv/hifb/include/hifb.h

OBJS := $(SRCS:%.c=%.o) $(CPP_SRCS:%.cpp=%.o) $(ASM_SRCS:%.S=%.o)

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#	  rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

all : $(LIBS)

install: all
	$(AT)cp -f $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -f $(LIBS).a  $(STATIC_LIB_DIR)
	$(AT)cp -f $(LIBS).so $(SHARED_LIB_DIR)
	$(AT)make -C gpu all 

$(LIBS): $(OBJS) $(ADEC_IMPLE_OBJ)
	$(AT)$(AR) -rcs $@.a $^
ifndef CFG_HI_STATIC_LIB_ONLY
	$(AT)$(CC) -shared -o $@.so $^
endif
	$(AT)echo "Build $@ has completed."

${OBJS}: %.o : %.c
	$(AT)echo "Compiling $@..."
	$(AT)$(CC) $(CFG_HI_CFLAGS) $(CFLAGS) -c $< -o $@

$(ADEC_IMPLE_OBJ): $(ADEC_IMPLE64_LIB)
	cd adec; $(AR) -x $(ADEC_IMPLE64_LIB)

	
	