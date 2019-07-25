#ifndef __VFMW_LOG_H__
#define __VFMW_LOG_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "vfmw.h"

/* debug message print control */
#define	 DEFAULT_PRINT_ENABLE	(0x3)
#define	 DEFAULT_PRINT_DEVICE	(DEV_SCREEN)   // 默认 'DEV_SCREEN'，即打印到屏幕

#define	 LOG_OK	      (0)
#define	 LOG_ERR     (-1)


/* type define */
typedef enum
{
    DEV_SCREEN = 1,
    DEV_SYSLOG,
    DEV_FILE,
    DEV_MEM
} PRINT_DEVICE_TYPE;

typedef enum
{
    PRN_FATAL = 0,	 // 0.	致命异常（fatal error），比如未知异常，VDM挂死等信息
    PRN_ERROR,		 // 1.	一般异常（error），比如语法错误
    PRN_CTRL,		 // 2.	控制信息, 比如状态灯，内部状态机跳转信息等
    PRN_VDMREG,		 // 3.	VDM寄存器，包括控制寄存器、状态寄存器

    PRN_DNMSG,		 // 4.	解码下行消息，各消息字的值打印
    PRN_RPMSG,		 // 5.	修补消息，修补消息各个消息字
    PRN_UPMSG,		 // 6.	上行消息，上行消息各个消息字
    PRN_STREAM,		 // 7.	码流信息，如每个码流包的信息（地址，长度等）

    PRN_STR_HEAD,	 // 8.	码流头字节，（前8字节，用于查找比对）
    PRN_STR_TAIL,	 // 9.	码流尾字节，（后8字节，用于查找比对）
    PRN_STR_BODY,	 // 10. 码流中部字节，（前后8字节之外的码流）
    PRN_IMAGE,		 // 11. 解码图像信息（图像的id，地址，属性等）

    PRN_QUEUE,		 // 12. 解码图队列信息（队列的图像个数，位置等）
    PRN_REF,		 // 13. 参考图信息（H264打印LIST相关信息，MPEG打印参考图及其维护的信息）
    PRN_DPB,		 // 14. DPB类信息（与dpb相关的各种信息）
    PRN_POC,		 // 15. POC类信息（POC的解码和计算）

    PRN_MARK_MMCO,	 // 16. MARK & MMCO操作信息（MARK和MMCO操作的信息，可表现执行的过程）
    PRN_SEQ,		 // 17. 序列级重要语法信息，H264打印SPS，MPEG2打印sequence信息，MPEG4打印VOL及以上层信息
    PRN_PIC,		 // 18. 图像级重要语法信息，H264打印PPS，MPEG2打印picture，MPEG4打印VOP/SHVOP头
    PRN_SLICE,		 // 19. slice级重要语法信息：仅H264有意义

    PRN_SEI,		 // 20. SEI信息，仅H264有意义
    PRN_SE,		 // 21. H264语法信息,仅H264有意义
    PRN_DBG,		 // 22. 调试信息
    PRN_BLOCK,		 // 23. 解码线程阻塞信息

    PRN_SCD_REGMSG,	 // 24.
    PRN_SCD_STREAM,	 // 25.
    PRN_SCD_INFO,	 // 26. 打印SCD一些运行状态的信息
    PRN_INT_TIME,	 // 27. VDH中断响应时间

    PRN_TEE,		 // 28. 打印安全性能相关信息
    PRN_PTS,		 // 29. 打印与PTS处理相关的信息
    PRN_DEC_MODE,	 // 30. 解码模式切换信息
    PRN_FS,		 // 31. 动态帧存打印
    PRN_ALWS = 32	 // 32. 不受控打印
} PRINT_MSG_TYPE;

/* state type */
typedef enum
{
    STATE_RCV_RAW = 0,		 //0. 接收RAW码流
    STATE_SCD_START,		 //1. 启动SCD
    STATE_SCD_INTERRUPT,	 //2. SCD中断

    STATE_DECSYNTAX_SEG,	 //3. 语法解析SEG码流
    STATE_GENERATE_DECPARAM,	 //4. 生成解码参数

    STATE_VDH_START,		 //5. 启动VDH
    STATE_VDH_INTERRUPT,	 //6. VDH中断
    STATE_VDH_REPAIR,		 //7. VDH修补
    STATE_1D_TO_QUEUE,		 //8. 1D图像输出到队列

    STATE_VO_RCV_IMG,		 //12. VO读取图像
    STATE_VO_REL_IMG		 //13. VO释放图像
} VFMW_STATE_TYPE_E;

typedef enum
{
    VFMW_STRING_VDH_IRQ = 0,
    VFMW_STRING_VDH_IRQ_SAFE,
    VFMW_STRING_VDH1_IRQ,
    VFMW_STRING_VDH2_IRQ,
    VFMW_STRING_SCD_IRQ,
    VFMW_STRING_SCD_IRQ_SAFE,
    VFMW_STRING_SCD1_IRQ,
    VFMW_STRING_CHAN_CTX,
    VFMW_STRING_CHAN_VDH,
    VFMW_STRING_CHAN_SCD,
    VFMW_STRING_DSPCTXMEM,
    VFMW_STRING_DNR_IRQ,
    VFMW_STRING_BTL_IRQ,
    VFMW_STRING_VDH_MMU_IRQ,
    VFMW_STRING_VDH_MMU_IRQ_SAFE,
    VFMW_STRING_VDH_HAL_MEM,
    VFMW_STRING_VP9_PROB_MEM,
    VFMW_STRING_SCD_MSG_MEM,
    VFMW_STRING_RAW_SAVE_PATH,
    VFMW_STRING_SEG_SAVE_PATH,
    VFMW_STRING_YUV_SAVE_PATH,
    VFMW_STRING_YUV_2D_SAVE_NAME,
    VFMW_STRING_YUV_1D_SAVE_NAME,
    VFMW_STRING_META_SAVE_NAME,
    VFMW_STRING_META_REORDER_SAVE_NAME,
    VFMW_STRING_HDR_EL_SAVE_NAME,
    VFMW_STRING_TRACER,
    VFMW_STRING_BIGTILE_ID_YUV,
    VFMW_STRING_BUTT
}VFMW_STRING_E;

#ifdef ENV_SOS_KERNEL
#define VDH_IRQ_NAME_INDEX     (VFMW_STRING_VDH_IRQ_SAFE)
#define SCD_IRQ_NAME_INDEX     (VFMW_STRING_SCD_IRQ_SAFE)
#define MMU_IRQ_NAME_INDEX     (VFMW_STRING_VDH_MMU_IRQ_SAFE)
#else
#define VDH_IRQ_NAME_INDEX     (VFMW_STRING_VDH_IRQ)
#define SCD_IRQ_NAME_INDEX     (VFMW_STRING_SCD_IRQ)
#define MMU_IRQ_NAME_INDEX     (VFMW_STRING_VDH_MMU_IRQ)
#endif

/* extern value */
extern	UINT32	 g_PrintEnable;
extern	UINT32	 g_PrintDevice;
extern	SINT32	 g_TraceCtrl;
extern	SINT32	 g_TraceBsPeriod;
extern	SINT32	 g_TraceFramePeriod;
extern	SINT32	 g_TraceImgPeriod;


/* assert define */
#define VFMW_ASSERT(Condition)						 \
do									 \
{									 \
    if (!(Condition))							 \
    {									 \
	dprint(PRN_ERROR, "[%s %d]assert warning\n",__func__,__LINE__);	 \
	return;								 \
    }									 \
}while(0)

#define VFMW_ASSERT_RETURN(Condition, Ret)				 \
do									 \
{									 \
    if (!(Condition))							 \
    {									 \
	dprint(PRN_ERROR, "[%s %d]assert warning\n",__func__,__LINE__);	 \
	return Ret;							 \
    }									 \
}while(0)

#define CHECK_NULL_PTR_ReturnValue(parPoint,ReturnValue)		 \
do									 \
{									 \
    if (NULL == parPoint)						 \
    {									 \
	dprint(PRN_FATAL, "NULL pointer: %s, L%d\n", __FILE__, __LINE__);\
	return ReturnValue;						 \
    }									 \
}while(0)

#define CHECK_NULL_PTR_Return(parPoint)					 \
do									 \
{									 \
    if (NULL == parPoint)						 \
    {									 \
	dprint(PRN_FATAL, "NULL pointer: %s, L%d\n", __FILE__, __LINE__);\
	return;								 \
    }									 \
}while(0)


/* macro define */
#ifndef HI_ADVCA_FUNCTION_RELEASE

#ifndef ENV_SOS_KERNEL
#define dprint(type, fmt, arg...)  LOG_Print(type, fmt, ##arg)

#else
#define dprint(type, fmt, arg...)					 \
do{									 \
    if ((((PRN_ALWS == type) || (0 != (g_PrintEnable & (1 << type))))	 \
       && (DEV_SCREEN == g_PrintDevice)))				 \
    {	OSAL_FP_print("S: [%d] ", __LINE__);				 \
	OSAL_FP_print(fmt, ##arg);					 \
    }									 \
}while(0)
#endif

#else

#define dprint(type, fmt, arg...) LOG_PrintNothing()
#endif

#define pos()  dprint(PRN_ALWS,"%s: L%d\n", __FUNCTION__, __LINE__)

#define dprint_dec(v)	   dprint(PRN_ALWS, "%s = %d\n",   #v, (v))
#define dprint_hex(v)	   dprint(PRN_ALWS, "%s = 0x%x\n", #v, (v))
#define dprint_str(v)	   dprint(PRN_ALWS, "%s = %s\n",   #v, (v))

#define LOG_FUNC_ENTRY()   dprint(PRN_ALWS, "[%s %d] entry!\n",__func__,__LINE__)
#define LOG_FUNC_EXIT()	   dprint(PRN_ALWS, "[%s %d] exit! \n",__func__,__LINE__)
#define LOG_NOT_SUPPORT()  dprint(PRN_ALWS, "[%s %d] not support now!\n",__func__,__LINE__)

#define REC_POS(Data)	   LOG_AddTrace((SINT8*)__FUNCTION__, __LINE__, (SINT32)Data)

/* function */
SINT32 LOG_IsPrintEnable(PRINT_MSG_TYPE Type);
VOID   LOG_PrintNothing(VOID);
SINT32 LOG_IsRecPosEnable(VFMW_STATE_TYPE_E Type);
VOID   LOG_RecPos(SINT32 SmID, VFMW_STATE_TYPE_E VfmwStateType, UINT32 *LastRecPosTimeInMs, SINT8 *FunctionName, SINT32 LineNumber);
CHAR  *LOG_GetString(VFMW_STRING_E enStringName);

#ifndef ENV_SOS_KERNEL
SINT32 LOG_Print(UINT32 type, const CHAR *format, ...);
SINT32 LOG_CreateTracer(VOID);
VOID   LOG_DestroyTracer(VOID);
VOID   LOG_AddTrace( SINT8 *pFuncName, SINT32 nLine, SINT32 Data );
VOID   LOG_PrintTracer( SINT32 TraceDepth );
#endif

#ifdef __cplusplus
}
#endif

#endif
