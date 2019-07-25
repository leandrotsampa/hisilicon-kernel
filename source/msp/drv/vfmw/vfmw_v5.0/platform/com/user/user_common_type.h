#ifndef __USER_COMMON_TYPE_H__
#define __USER_COMMON_TYPE_H__

#include "vfmw.h"

#ifdef __cplusplus
extern "C" {
#endif

#define DEBUG_SAVE_SUPPORT    (0)

#define MAX_RAW_NUM	      (512)
#define MAX_EVENT_NUM	      (512)
#define MAX_PARA_SIZE	      (1024)
#define MAX_PROC_SIZE	      (100*1024)

#define TRUSTED_CHAN_BEGIN    (0)

typedef enum
{
    READ_PROC_INFO   = 0x001,
    READ_PROC_CHAN   = 0x002,
    READ_PROC_FSP    = 0x003,
    READ_PROC_SCD    = 0x004,
    READ_PROC_VDH    = 0x005,
    READ_PROC_STATIS = 0x006,
    READ_PROC_DIFF   = 0x007,
    READ_PROC_BUTT
} READ_PROC_TYPE_E;

/* stream list address */
typedef struct hiSTREAM_LIST_S
{
    UADDR  stream_list_phy_addr;
} STREAM_LIST_S;

typedef struct
{
    SINT32	Head_NS;
    SINT32	Head_S;
    SINT32	Tail_S;
    SINT32	Tail_NS;
    STREAM_DATA_S RawPacket[MAX_RAW_NUM];
} RAW_ARRAY_NS;

typedef struct
{
    SINT32	Head;
    SINT32	Tail;
    SINT32	History;
    SINT32	FailedTime;
#ifdef CHIP_98MV200_ULTRAVMX
    IMAGE_SECURE StImage[MAX_QUEUE_IMAGE_NUM];
#else
    IMAGE      StImage[MAX_QUEUE_IMAGE_NUM];
#endif
} IMAGE_LIST_S;

typedef struct
{
    SINT32     IsUsed;
    UADDR      TopLumaPhyAddr;
} OUTPUT_IMAGE_RECORD_S;

typedef struct
{
    OUTPUT_IMAGE_RECORD_S   StOutputRec[MAX_QUEUE_IMAGE_NUM];
    IMAGE_LIST_S	    StOutputImg;
    IMAGE_LIST_S	    StReleaseImg;
} IMAGE_QUEUE_NS;

typedef struct
{
    SINT32	IsValid;
    SINT32	ChanID;
    SINT32	Type;
    UINT8	para[MAX_PARA_SIZE];
    VDEC_ADAPTER_TYPE_E eAdapterType;	       /* channel type vdec/omxvdec */
} MSG_DATA_S;

typedef struct
{
    SINT32	Head;
    SINT32	Tail;
    MSG_DATA_S	Message[MAX_EVENT_NUM];
} CALLBACK_ARRAY_NS;

typedef enum
{
    VFMW_HID_INIT		= 0x0,
    VFMW_HID_CONTROL		= 0x1,
    VFMW_HID_EXIT		= 0x2,
    VFMW_HID_SUSPEND		= 0x3,
    VFMW_HID_RESUME		= 0x4,
    VFMW_HID_GETIMAGE		= 0x5,
    VFMW_HID_RELEASEIMAGE	= 0x6,
    VFMW_HID_WRITE_PROC		= 0x7,
    VFMW_HID_READ_PROC		= 0x8,
    VFMW_HID_ISR		= 0x9
}VFMW_HID_E;

typedef enum
{
    PROC_SET_PRINT_LEVEL	= 0x000,
    PROC_SET_ERROR_THR		= 0x002,
    PROC_SET_DEC_ORDEER_OUTPUT	= 0x003,
    PROC_SET_DEF_OUTPUT_ORDER	= 0x004,
    PROC_SET_DEC_MODE		= 0x005,
    PROC_SET_DROP_STRM_THR	= 0x007,
    PROC_SET_VP9_DEC_FRAMENUM	= 0x008,

    PROC_SET_USE_FF_APT_EN	= 0x00b,
    PROC_SET_SAVE_FILE_AFTER_RESET = 0x00c,
    PROC_SET_CUR_PROC_CHAN	= 0x00d,

    PROC_PRINT_TRACER		= 0x100,
    PROC_SET_SCD_PRINT		= 0x101,

    PROC_SAVE_STREAM		= 0x200,
    PROC_SAVE_SEG		= 0x201,
    PROC_SAVE_YUV		= 0x202,
    PROC_SAVE_1D_YUV		= 0x204,
    PROC_SAVE_METADATA		= 0x210,
    PROC_SAVE_RECORDER_METADATA = 0x220,
    PROC_SAVE_EL		= 0x230,

    PROC_TEST_SUSPEND		= 0x300,
    PROC_TEST_RESUME		= 0x301,
    PROC_TEST_STOP_CHAN		= 0x380,
    PROC_TEST_RESET_CHAN	= 0x381,
    PROC_TEST_START_CHAN	= 0x382,
    PROC_TEST_RESTART_CHAN	= 0x383,

    PROC_TEST_TIME_SEQUENCE	= 0x400,
    PROC_TEST_STOP_DEC		= 0x402,

    PROC_SET_TRACE_CTRL		= 0x500,
    PROC_SET_TRACE_BS_PERIOD	= 0x501,
    PROC_SET_TRACE_FRAME_PERIOD = 0x502,
    PROC_SET_TRACE_IMG_PERIOD	= 0x503,
    PROC_SET_SAVE_YUV_BITWIDTH	= 0x505,

    PROC_OPEN_MODULE_LOWLY	= 0x600,
    PROC_CLOSE_MODULE_LOWLY	= 0x601,
    PROC_SET_TUNNEL_LINE_NUMBER = 0x602,
    PROC_OPEN_SCD_LOWLY		= 0x603,
    PROC_CLOSE_SCD_LOWLY	= 0x604,
    PROC_SET_SED_ONLY_EN	= 0x605,

    PROC_SET_SMMU_IRQ_EN	= 0x700,
    PROC_SET_COMPRESS_PARA	= 0x800,

    PROC_SET_CLK_SELECT		= 0x900,
    PROC_SET_STANDARD_OBEDIENCE = 0x901,
    PROC_BUTT,
}VFMW_PROC_CMD_E;

typedef enum
{
    ISR_SCD			= 0X000,
    ISR_VDH			= 0x001,
    ISR_BUTT,
}VFMW_ISR_CMD_E;

typedef struct UcsGetMsgData
{
   VFMW_HID_E HandleID;
   UINT32     CmdID;
   SINT32     ChanID;
   UINT32     Args[256];
   SINT32     RetValue;
   SINT32     MsgTime;
} UCS_MSG_DATA;

typedef enum SHARE_THREAD_STATE_E
{
    THREAD_STATE_INIT  = 0,
    THREAD_STATE_RUNNING,
    THREAD_STATE_VENDER_DEFINE_START,
    THREAD_STATE_VENDER_DEFINE_END = 50,
    THREAD_STATE_SLEEP,
    THREAD_STATE_EXIT,
    THREAD_STATE_BUTT,
}SHARE_THREAD_STATE_E;

typedef struct
{
    CALLBACK_ARRAY_NS  CallBackBuf;
#ifdef CHIP_98MV200_ULTRAVMX
    VDEC_SECURE_CHAN_OPTION_S ChanOption;
#else
    VDEC_CHAN_OPTION_S ChanOption;
#endif
    RAW_ARRAY_NS       StreamBuf[MAX_CHAN_NUM];
    VDEC_CHAN_STATE_S  ChanState[MAX_CHAN_NUM];
    IMAGE_QUEUE_NS     ImageQue[MAX_CHAN_NUM];
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    UINT8	       ProcBuf[MAX_PROC_SIZE];
#endif
#if (1 == DEBUG_SAVE_SUPPORT)
    UINT8	       SaveStreamBuf[3 * 1024 * 1024];
#endif
} MEMORY_NEEDED_SECVFMW_S;

#endif


#ifdef __cplusplus
}
#endif
