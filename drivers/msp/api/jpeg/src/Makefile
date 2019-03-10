#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR ?= $(shell cd $(CURDIR)/../../../../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

JPEG_CURDIR = $(shell pwd)
SRC_CURDIR := .

#CFG_HI_ENC_CFLAGS = CONFIG_GFX_JPGE_ENC_ENABLE
CFG_HI_JPEG_SOFT_ENCODE_SUPPORT=y
#===============================================================================
# standard jpeg dir
#===============================================================================
SRC_SOFT     := $(SRC_CURDIR)/src_soft
SRC_HARD     := $(SRC_CURDIR)/src_hard
SRC_HARD_ENC := $(SRC_CURDIR)/src_hard_enc

#===============================================================================
# local variable
#===============================================================================
CFLAGS  +=  -I$(JPEG_CURDIR)                       \
            -I$(SRC_SOFT)                          \
            -I$(SRC_HARD)                          \
            -I$(SRC_HARD_ENC)                      \
            -I$(JPEG_CURDIR)/../inc/inc_soft       \
            -I$(JPEG_CURDIR)/../inc/inc_hard       \
            -I$(JPEG_CURDIR)/../inc/inc_test       \
            -I$(JPEG_CURDIR)/../grc_cmm_inc        \
            -I$(MSP_DIR)/api/tde/include           \
            -I$(MSP_DIR)/api/jpge/include          \
            -I$(MSP_DIR)/drv/include/              \
            -I$(COMMON_DIR)/api/include            \
            -I$(MSP_DIR)/drv/jpeg/include

CFLAGS  +=  -DCFG_HI_JPEG6B_STREAMBUFFER_SIZE=$(CFG_HI_JPEG6B_STREAMBUFFER_SIZE)

#=====================================================================================
#the jpeg use version
#=====================================================================================
CFLAGS += -DCONFIG_HI_SDK_JPEG_VERSION
#CFLAGS += -DCONFIG_HI_FPGA_JPEG_VERSION

#=====================================================================================
#the platform version
#=====================================================================================
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3796mv200 hi3798mv200_a),)
CFLAGS += -DCONFIG_GFX_MEM_ION
else
CFLAGS += -DCONFIG_GFX_MEM_MMZ
endif

ifeq ($(CFG_HI_SMMU_SUPPORT),y)
CFLAGS += -DCONFIG_GFX_MMU_SUPPORT
endif

ifeq ($(CFG_HI_GFX_DEBUG_LOG_SUPPORT), y)
CFLAGS += -DCFG_HI_GFX_DEBUG_LOG_SUPPORT
endif

ifeq ($(CFG_HI_JPEG_SOFT_ENCODE_SUPPORT),y)
CFLAGS += -DCONFIG_GFX_JPGE_SOFT_ENC_ENABLE
endif

ifdef CFG_HI_STATIC_LIB_ONLY
#directfb needed
CFLAGS += -fPIC
endif

#=====================================================================================
#use signal£¬not use mutex
#=====================================================================================
#CFLAGS += -DCONFIG_JPEG_USE_KERNEL_SIGNAL

#=====================================================================================
#the jpge enc var
#=====================================================================================
ifneq ($(findstring $(CFG_HI_ENC_CFLAGS), CONFIG_GFX_JPGE_ENC_ENABLE),)
CFLAGS += -D$(CFG_HI_ENC_CFLAGS)
endif

#=====================================================================================
#the chip env version
#=====================================================================================
LIBNAME :=
LIBPATH := -L$(COMMON_DIR)/api -L$(MSP_DIR)/api
DEPEND_LIB := $(LIBPATH) $(LIBNAME)

#===============================================================================
# whether debug and add googlefunction
#===============================================================================
#CFLAGS += -DCONFIG_JPEG_DEBUG_INFO
#CFLAGS += -DCONFIG_JPEG_ADD_GOOGLEFUNCTION

#===============================================================================
# complie
#===============================================================================
CPPFLAGS = 
LDFLAGS  =


#===============================================================================
#compile encode lib src
#===============================================================================
LIB_ENC_SOURCES = $(SRC_SOFT)/jcapimin.c   $(SRC_SOFT)/jcapistd.c   $(SRC_SOFT)/jcarith.c  \
	          $(SRC_SOFT)/jccoefct.c   $(SRC_SOFT)/jccolor.c    $(SRC_SOFT)/jcdctmgr.c \
	          $(SRC_SOFT)/jchuff.c     $(SRC_SOFT)/jcinit.c     $(SRC_SOFT)/jcmainct.c \
		  $(SRC_SOFT)/jcmarker.c   $(SRC_SOFT)/jcmaster.c   $(SRC_SOFT)/jcparam.c  \
		  $(SRC_SOFT)/jcprepct.c   $(SRC_SOFT)/jcsample.c   $(SRC_SOFT)/jctrans.c  \
		  $(SRC_SOFT)/jfdctflt.c   $(SRC_SOFT)/jfdctfst.c   $(SRC_SOFT)/jfdctint.c

ifneq ($(findstring $(CFG_HI_ENC_CFLAGS), CONFIG_GFX_JPGE_ENC_ENABLE),)
LIB_ENC_SOURCES += $(SRC_HARD_ENC)/jpge_henc_api.c
endif

#===============================================================================
#compile decode lib src
#===============================================================================
LIB_DEC_SOURCES = $(SRC_SOFT)/jdapimin.c   $(SRC_SOFT)/jdapistd.c  $(SRC_SOFT)/jdarith.c  \
		  $(SRC_SOFT)/jdatadst.c   $(SRC_SOFT)/jdatasrc.c  $(SRC_SOFT)/jdcoefct.c \
		  $(SRC_SOFT)/jdcolor.c    $(SRC_SOFT)/jddctmgr.c  $(SRC_SOFT)/jdhuff.c   \
		  $(SRC_SOFT)/jdinput.c    $(SRC_SOFT)/jdmainct.c  $(SRC_SOFT)/jdmarker.c \
		  $(SRC_SOFT)/jdmaster.c   $(SRC_SOFT)/jdmerge.c   $(SRC_SOFT)/jdpostct.c \
		  $(SRC_SOFT)/jdsample.c   $(SRC_SOFT)/jdtrans.c   $(SRC_SOFT)/jidctflt.c \
		  $(SRC_SOFT)/jidctfst.c   $(SRC_SOFT)/jidctint.c  $(SRC_SOFT)/jquant1.c  \
	          $(SRC_SOFT)/jquant2.c    $(SRC_SOFT)/jdcolor_userbuf.c

LIB_DEC_SOURCES += $(SRC_SOFT)/transupp.c

LIB_DEC_SOURCES += $(SRC_HARD)/hi_jpeg_hdec_api.c  $(SRC_HARD)/jpeg_hdec_parse.c      \
                   $(SRC_HARD)/jpeg_hdec_api.c     $(SRC_HARD)/jpeg_hdec_mem.c        \
                   $(SRC_HARD)/jpeg_hdec_rwreg.c   $(SRC_HARD)/jpeg_hdec_setpara.c    \
                   $(SRC_HARD)/jpeg_hdec_suspend.c $(SRC_HARD)/jpeg_hdec_table.c      \
                   $(SRC_HARD)/jpeg_hdec_csc.c     $(SRC_HARD)/jpeg_hdec_sentstream.c \
                   $(SRC_HARD)/hi_jpeg_hdec_test.c $(SRC_HARD)/jpeg_hdec_support.c    \
                   $(SRC_HARD)/jpeg_hdec_proc.c    $(SRC_HARD)/jpeg_hdec_savestream.c \
                   ${SRC_HARD}/jpeg_sdec_exif.c

#===============================================================================
#compile encode and decode lib src
#===============================================================================
LIB_COM_SOURCES = $(SRC_SOFT)/jaricom.c  $(SRC_SOFT)/jcomapi.c \
		  $(SRC_SOFT)/jerror.c   $(SRC_SOFT)/jutils.c  \
	          $(SRC_SOFT)/jmemmgr.c
#===============================================================================
#compile lib need mem src
#===============================================================================
LIB_SYSDEPMEMSRC = $(SRC_SOFT)/jmemnobs.c

#===============================================================================
#compile lib need all src
#===============================================================================
ifneq ($(CFG_HI_JPEG_SOFT_ENCODE_SUPPORT),y)
SOURCES = $(LIB_DEC_SOURCES) $(LIB_COM_SOURCES) $(LIB_SYSDEPMEMSRC) $(LIB_SIMD_SRC)
else
SOURCES = $(LIB_ENC_SOURCES) $(LIB_DEC_SOURCES) $(LIB_COM_SOURCES) $(LIB_SYSDEPMEMSRC) $(LIB_SIMD_SRC)
endif

SRCS := $(SOURCES)

#===============================================================================
#compile lib need include
#===============================================================================
INCLUDES = jpeglib.h jerror.h   jmorecfg.h  jconfig.h  transupp.h  \
	   jdct.h    jinclude.h jmemsys.h   jpegint.h  jversion.h

#===============================================================================
#compile
#===============================================================================
LIB_NAME := libjpeg9b

HEADER_FILES := $(MSP_DIR)/api/jpeg/inc/inc_soft/jpeglib.h
HEADER_FILES += $(MSP_DIR)/api/jpeg/inc/inc_soft/jmorecfg.h
HEADER_FILES += $(MSP_DIR)/api/jpeg/inc/inc_soft/jerror.h
HEADER_FILES += $(MSP_DIR)/api/jpeg/inc/inc_soft/jconfig.h
HEADER_FILES += $(MSP_DIR)/api/jpeg/inc/inc_hard/hi_jpeg_api.h

include $(SDK_DIR)/hi_rules.mak
