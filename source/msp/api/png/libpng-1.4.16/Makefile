# makefile for libpng.a and libpng14.so on Linux ELF with gcc
# Copyright (C) 1998, 1999, 2002, 2006, 2008, 2010 Greg Roelofs and
# Glenn Randers-Pehrson
# Copyright (C) 1996, 1997 Andreas Dilger
#
# This code is released under the libpng license.
# For conditions of distribution and use, see the disclaimer
# and license in png.h

#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
PNG_CURDIR = $(shell pwd)
SRC_CURDIR :=

CFLAGS  := $(subst -Werror,,$(CFG_HI_CFLAGS))

#������ػ����ӿ�ı����С
#CFLAGS +=  -funroll-loops

CFLAGS  +=  -I$(MSP_DIR)/api/png/include            \
            -I$(MSP_DIR)/drv/png/include            \
            -I$(MSP_DIR)/api/jpeg/grc_cmm_inc       \
            -I$(MSP_DIR)/drv/include                \
            -I$(COMMON_DIR)/api/include             \
            -I$(COMPONENT_DIR)/zlib/include         \
            -I$(COMPONENT_DIR)/freetype/include

ifeq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv310 hi3716mv320 hi3110ev500),)
CFLAGS += -DHIPNG_ACCELERATE
CFLAGS += -DPNG_WRITE_SUPPORTED
else
CFLAGS += -DPNG_NO_WRITE_SUPPORTED
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200),)
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

ifneq ($(CFG_HI_PROC_SUPPORT),y)
CFLAGS += -DCONFIG_PNG_PROC_DISABLE
endif

ifdef CFG_HI_STATIC_LIB_ONLY
#directfb needed
CFLAGS += -fPIC
endif

ZLIBLIB = $(COMPONENT_DIR)/zlib/release/lib
ZLIBINC = $(COMPONENT_DIR)/zlib/include

#=====================================================================================
#the chip env version
#=====================================================================================
LIBNAME :=
LIBPATH := -L$(COMMON_DIR)/api -L$(MSP_DIR)/api
DEPEND_LIB := $(LIBPATH) $(LIBNAME)

#===============================================================================
# whether debug and add googlefunction
#===============================================================================

#===============================================================================
# complie
#===============================================================================
CPPFLAGS = 
LDFLAGS  =

#===============================================================================
#compile lib src
#===============================================================================
SOURCES :=  png.c  pngset.c  pngget.c  pngrutil.c        \
            pngtrans.c  pngwutil.c  pngread.c            \
            pngrio.c  pngwio.c  pngwrite.c  pngrtran.c   \
            pngwtran.c pngmem.c pngerror.c pngpread.c    \
            hi_png_api.c png_accelerate.c

SRCS := $(SOURCES)

#===============================================================================
#compile
#===============================================================================
LIB_NAME := libpng1.4.16

HEADER_FILES := $(MSP_DIR)/api/png/include/hi_png_config.h
HEADER_FILES += $(MSP_DIR)/api/png/libpng-1.4.16/png.h
HEADER_FILES += $(MSP_DIR)/api/png/libpng-1.4.16/pngconf.h

OBJS := $(SRCS:%.c=%.o)

OBJ_DIR := $(CURDIR)/obj

OBJS64 += $(addprefix $(OBJ_DIR)/,$(OBJS))

TARGETS += $(OBJ_DIR)/$(LIB_NAME)

CFLAGS += -I$(COMMON_UNF_INCLUDE)
          
CFLAGS += -fPIC

#===============================================================================
# rules
#===============================================================================

all : $(TARGETS)
	$(AT)cp -f $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -f $(OBJ_DIR)/$(LIB_NAME).a $(STATIC_LIB_DIR)
	$(AT)cp -f $(OBJ_DIR)/$(LIB_NAME).so $(SHARED_LIB_DIR)/libpng.so

$(OBJ_DIR)/%.o : %.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CC) $(CFLAGS) $(FLOAT_OPTIONS) -o $@ -c $^
	
$(OBJ_DIR)/$(LIB_NAME): $(OBJS64)
	$(AT)$(AR) -rcs $@.a $(OBJS64)
	$(AT)$(CC) -shared -o $@.so $(OBJS64)





