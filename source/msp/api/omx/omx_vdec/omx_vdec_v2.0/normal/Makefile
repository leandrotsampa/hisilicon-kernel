#===============================================================================
# export variable
#===============================================================================

include $(SDK_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
CFLAGS += -Werror
CFLAGS  +=  -I$(COMMON_UNF_INCLUDE) \
            -I$(COMMON_API_INCLUDE) \
            -I$(COMMON_DRV_INCLUDE) \
            -I$(MSP_UNF_INCLUDE) \
            -I$(MSP_API_INCLUDE) \
            -I$(MSP_DRV_INCLUDE) \
            -I$(MSP_DIR)/api/omx/include            \
            -I$(MSP_DIR)/drv/omxvdec/omxvdec_v2.0   \
            -I$(MSP_DIR)/drv/vfmw/vfmw_v5.0/adapter

SRCS := omx_event_queue.c omx_vdec.c omx_drv_ctx.c

LIB_NAME := libOMX.hisi.video.decoder

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
	$(CC) $(CFLAGS) -o $@ -c $^

$(OBJ_DIR)/$(LIB_NAME): $(OBJS64)
	$(AT)$(AR) -rcs $@.a $(OBJS64)
	$(AT)$(CC) -shared -o $@.so $(OBJS64)

