#===============================================================================
# export variable
#===============================================================================
SDK_DIR ?= $(CURDIR)/../../..

include $(SDK_DIR)/base.mak

#=======================================
#	local varibale
#=======================================

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

#--------------- PQ ------------------

SRCS += pq/mpi_pq.c \
        pq/unf_pq.c


#--------------- AVPLAY ------------------

#SRCS += avplay/mpi_avplay.c \
        avplay/unf_avplay.c \
        avplay/avplay_frc.c \
        avplay/frame_detect.c \
        avplay/bitstream.c
        
#-------------------------------------

CFG_HI_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                 -I$(COMMON_API_INCLUDE) \
                 -I$(COMMON_DRV_INCLUDE) \
                 -I$(MSP_UNF_INCLUDE) \
                 -I$(MSP_API_INCLUDE) \
                 -I$(MSP_DRV_INCLUDE)

LIBS := libhi_msp

HEADER_FILES := $(wildcard $(MSP_UNF_INCLUDE)/*.h)

OBJS := $(SRCS:%.c=%.o) $(CPP_SRCS:%.cpp=%.o) $(ASM_SRCS:%.S=%.o)

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#	  rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

all : $(LIBS)

install: all
	$(AT)cp -f $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -f $(LIBS).a  $(STATIC_LIB_DIR)
	$(AT)cp -f $(LIBS).so $(SHARED_LIB_DIR)

$(LIBS): $(OBJS)
	$(AT)$(AR) -rcs $@.a $^
ifndef CFG_HI_STATIC_LIB_ONLY
	$(AT)$(CC) -shared -o $@.so $^
endif
	$(AT)echo "Build $@ has completed."

${OBJS}: %.o : %.c
	$(AT)echo "Compiling $@..."
	$(AT)$(CC) $(CFG_HI_CFLAGS) $(CFLAGS) -c $< -o $@

