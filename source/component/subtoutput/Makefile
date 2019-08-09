#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
CFLAGS := -I$(CURDIR)/include

SRCS := src/hi_unf_so.c \
        src/so_queue.c

LIB_NAME := libhi_so

HEADER_FILES := $(CURDIR)/include/hi_unf_so.h

OBJS := $(SRCS:%.c=%.o)

TARGETS += $(LIB_NAME)

CFLAGS += -I$(COMMON_UNF_INCLUDE)

#===============================================================================
# rules
#===============================================================================

all : $(TARGETS)
	$(AT)cp -f $(HEADER_FILES) $(INCLUDE_DIR)/
	$(AT)cp -f $(LIB_NAME).a $(STATIC_LIB_DIR)
	$(AT)cp -f $(LIB_NAME).so $(SHARED_LIB_DIR)
	
%.o : %.c
	$(AT)$(CC) $(CFLAGS) -o $@ -c $^
 
$(LIB_NAME): $(OBJS)
	$(AT)$(AR) -rcs $@.a $(OBJS)
	$(AT)$(CC) -shared -o $@.so $(OBJS)