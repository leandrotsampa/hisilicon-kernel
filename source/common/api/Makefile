#===============================================================================
# export variable
#===============================================================================
SDK_DIR ?= $(CURDIR)/../../..

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
#CFLAGS  += $(CFG_HI_CFLAGS)

CFG_HI_CFLAGS += -I$(COMMON_DIR)/include
CFG_HI_CFLAGS += -I$(COMMON_DIR)/api/include
CFG_HI_CFLAGS += -I$(COMMON_DIR)/drv/include
CFG_HI_CFLAGS += -I$(COMMON_DIR)/api/log
CFG_HI_CFLAGS += -I$(COMMON_DIR)/api/module

LIBS := libhi_common
        
OBJS := ./sys/hi_common.o

PUB_HEADERS  := $(COMMON_DIR)/include/hi_common.h \
                $(COMMON_DIR)/include/hi_debug.h \
                $(COMMON_DIR)/include/hi_module.h \
                $(COMMON_DIR)/include/hi_type.h
                
#===============================================================================
# rules
#===============================================================================

all: $(LIBS)


clean:


install:
	$(AT)cp -f $(PUB_HEADERS) $(INCLUDE_DIR)/
	$(AT)cp -f $(LIBS).a  $(STATIC_LIB_DIR)
	$(AT)-cp -f $(LIBS).so $(SHARED_LIB_DIR)


#################################################################################
## Building library
$(LIBS): $(OBJS)
	$(AT)$(AR) -rcs $@.a $^
ifndef CFG_HI_STATIC_LIB_ONLY
	$(AT)$(CC) -shared -o $@.so $^
endif
	$(AT)echo "Build $@ has completed."

## Building api objects
## using: -save-temps for temporary files
${OBJS}: %.o : %.c
	$(AT)echo "Compiling $@..."
	$(AT)$(CC) $(CFG_HI_CFLAGS) $(CFLAGS) -c $< -o $@

