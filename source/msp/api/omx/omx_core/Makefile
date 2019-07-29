#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
CFLAGS  +=  -I$(CURDIR)/../include/

ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
CFLAGS  += -DHI_ADVCA_FUNCTION_RELEASE
endif

SRCS := omx_core.c

LIB_NAME := libOMX_Core

OBJS := $(SRCS:%.c=%.o)

OBJ_DIR := $(CURDIR)/obj

OBJS64 += $(addprefix $(OBJ_DIR)/,$(OBJS))

TARGETS := $(OBJ_DIR)/$(LIB_NAME)

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#	  rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

all : $(TARGETS)
	$(AT)cp -f $(OBJ_DIR)/$(LIB_NAME).a $(STATIC_LIB_DIR)
	$(AT)cp -f $(OBJ_DIR)/$(LIB_NAME).so $(SHARED_LIB_DIR)

$(OBJ_DIR)/%.o : %.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CC) $(CFLAGS) -o $@ -c $^

$(OBJ_DIR)/$(LIB_NAME): $(OBJS64)
	$(AT)$(AR) -rcs $@.a $(OBJS64)
	$(AT)$(CC) -shared -o $@.so $(OBJS64)

