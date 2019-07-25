
#ifndef ENV_SOS_KERNEL
#include "stdarg.h"
#endif

#include "mem_manage.h"
#include "vfmw_log.h"
#include "vfmw_osal_ext.h"

#ifdef ENV_ARMLINUX_KERNEL
#include "vfmw_linux_kernel_osal.h"
#endif
#ifdef ENV_ARMLINUX_USER
#include "vfmw_linux_user_osal.h"
#endif


/******************************************************
    常数&数据结构&枚举
*******************************************************/
#define	 TRACE_MEM_SIZE	  (16*1024*2)
#define	 MAX_FUNC_NAME_LEN  15

/* 内存跟踪单元 */
typedef struct hiTRACE_OBJ_S
{
    CHAR     s8FuncName[MAX_FUNC_NAME_LEN + 1];
    SINT32   s32LineNum;
    SINT32   s32Data;
    UINT32   u32Time;
} TRACE_OBJ_S;

/* 内存跟踪器 */
typedef struct	hiTRACE_DESC_S
{
    /* 标识串 */
    UINT32   u32ValidFlag[4];

    /* 基准地址 */
    TRACE_OBJ_S	 *pstTraceBaseObj;
    UADDR	s32TraceBasePhyAddr;

    /* 内部索引 */
    SINT32   s32MaxTraceNumMinus4;
    SINT32   s32CurrTraceNum;
} TRACE_DESC_S;

/******************************************************
   共享数据
*******************************************************/
TRACE_DESC_S  *s_pstTracer = 0;
UADDR	 TracerPhyAddr = 0;

VOID	*g_fpLog    = NULL;

/* 受控打印的控制变量 */
UINT32	 g_PrintEnable = DEFAULT_PRINT_ENABLE;	  /* 打印使能开关 */
UINT32	 g_PrintDevice = DEFAULT_PRINT_DEVICE;	  /* 打印设备选择开关 */
CHAR	 g_TmpMsg[1024];			/* 打印中间结果的暂存区域 */

SINT32	 g_TraceCtrl = 0xffffffff;   /* vfmw代码运行状态控制参数 */
SINT32	 g_TraceBsPeriod = 200;	   /* 码流相关打印和调试信息的周期控制参数 */
SINT32	 g_TraceFramePeriod = 0;  /* 帧级相关打印和调试信息的周期控制参数 */
SINT32	 g_TraceImgPeriod = 500;    /* 图像相关打印和调试信息的周期控制参数 */
SINT32	 g_TunnelLineNumber = 10; /*模块间低延时行号水线控制参数*/
SINT32	 g_SecProcSelect = 0;	  /*安全proc控制选项*/

CHAR *g_strDefine[] =
{
    "vdec_vdh",
    "vdec_vdh_safe",
    "vdec_vdh1",
    "vdec_vdh2",
    "vdec_scd",
    "vdec_scd_safe",
    "vdec_scd1",
    "VFMW_Chan_Ctx",
    "VFMW_Chan_Vdh",
    "VFMW_Chan_Scd",
    "VFMW_DspCtxMem",
    "NULL",
    "NULL",
    "mmu_vdh",
    "mmu_vdh_safe",
    "VFMW_Hal_%d",
    "VFMW_VP9Prob_%d",
    "VFMW_ScdMsg_%d",
    "%s/vfmw_raw_save_%d.dat",
    "%s/vfmw_seg_save_%d.dat",
    "%s/vfmw_yuv_save_%d.yuv",
    "%s/2d_0x%x.yuv",
    "%s/1d_0x%x.yuv",
    "%s/vfmw_metadata_save_%d.dat",
    "%s/vfmw_metadata_reorder_save_%d.dat",
    "%s/vfmw_el_save_%d.dat",
    "VFMW_Tracer",
    "VFMW_BigTile1d_YUV"
};

CHAR *LOG_GetString(VFMW_STRING_E enStringName)
{
    if (enStringName >= VFMW_STRING_BUTT)
    {
	dprint(PRN_FATAL, "___________invalid parm= %d ____________\n", enStringName);
	return "";
    }

    return g_strDefine[enStringName];
}

/*################################################################################################
    内存trace
#################################################################################################*/
/* 创建tracer */
#define VF0  0x1a2a3a4a
#define VF1  0x55657585
#define VF2  0x0f152f35
#define VF3  0x4a5f6a7f

SINT32 LOG_CreateTracer(VOID)
{
    SINT32 ret = LOG_ERR;
    MEM_RECORD_S MemRecord;

    if ( s_pstTracer )
    {
	return LOG_OK;
    }

#ifdef HI_SMMU_SUPPORT
    MemRecord.eMode = MEM_MMU_MMU;
#endif
    if (MEM_AllocMemBlock(LOG_GetString(VFMW_STRING_TRACER), 0, TRACE_MEM_SIZE, &MemRecord, 0) == MEM_MAN_OK)
    {
	MEM_AddMemRecord(MemRecord.PhyAddr, MemRecord.VirAddr, MemRecord.Length);

	/* 上下文 */
	s_pstTracer = (TRACE_DESC_S *)MemRecord.VirAddr;
	TracerPhyAddr = MemRecord.PhyAddr;

	/* 清除tracer的内部数据 */
	//memset( MemRecord.VirAddr, 0, TRACE_MEM_SIZE );
	vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(MemRecord.VirAddr, 0, TRACE_MEM_SIZE);

	/* 基准地址 */
	s_pstTracer->pstTraceBaseObj = (TRACE_OBJ_S *)(MemRecord.VirAddr + sizeof(TRACE_DESC_S));
	s_pstTracer->s32TraceBasePhyAddr = (MemRecord.PhyAddr + sizeof(TRACE_DESC_S));

	/* 索引 */
	s_pstTracer->s32MaxTraceNumMinus4 = (MemRecord.Length - sizeof(TRACE_DESC_S)) / sizeof(TRACE_OBJ_S) - 4;
	s_pstTracer->s32CurrTraceNum = 0;

	/* 标识tracer有效 */
	s_pstTracer->u32ValidFlag[0] = VF0;
	s_pstTracer->u32ValidFlag[1] = VF1;
	s_pstTracer->u32ValidFlag[2] = VF2;
	s_pstTracer->u32ValidFlag[3] = VF3;

	dprint(PRN_DBG, "________________ mem_phy, trace_phy,trace_max = 0x%x, 0x%x,%d _________________\n", MemRecord.PhyAddr,
	       (MemRecord.PhyAddr + sizeof(TRACE_DESC_S)), s_pstTracer->s32MaxTraceNumMinus4 );

	ret = LOG_OK;
    }


    return ret;
}

VOID LOG_DestroyTracer(VOID)
{
    if ( NULL != s_pstTracer )
    {
	UADDR  PhyAddr;
	PhyAddr = MEM_Vir2Phy((UINT8 *)s_pstTracer);
	MEM_ReleaseMemBlock(PhyAddr, (UINT8 *)s_pstTracer);
	dprint(PRN_DBG, "=============== destroy tracer: phy,vir = 0x%x,%p ===================\n", PhyAddr, s_pstTracer);
	s_pstTracer = NULL;
    }

    return;
}

VOID LOG_AddTrace(SINT8 *pFuncName, SINT32 nLine, SINT32 Data)
{
    if (NULL != s_pstTracer)
    {
	SINT32	s32CurrTraceNum = s_pstTracer->s32CurrTraceNum;
	TRACE_OBJ_S *pstTraceObj;

	s_pstTracer->s32CurrTraceNum = (s32CurrTraceNum < s_pstTracer->s32MaxTraceNumMinus4) ? (s32CurrTraceNum + 1) : 0;
	pstTraceObj = s_pstTracer->pstTraceBaseObj + s32CurrTraceNum;

	pstTraceObj->s32LineNum = nLine;
	pstTraceObj->s32Data = Data;

	pstTraceObj->u32Time = vfmw_Osal_Func_Ptr_S.pfun_Osal_GetTimeInUs();

	vfmw_Osal_Func_Ptr_S.pfun_Osal_strlcpy( pstTraceObj->s8FuncName, (CHAR*)pFuncName, MAX_FUNC_NAME_LEN );
    }

    return;
}

VOID LOG_PrintTracer(SINT32 TracerMemroy)
{
    TRACE_DESC_S *pstThisTracer;
    UINT32 *pv;
    SINT32  s32CurrTraceNum;
    SINT32  i;
    TRACE_OBJ_S *pstTraceObj;

    if ( NULL == s_pstTracer )
    {
	//pstThisTracer = (TRACE_DESC_S*)ioremap( TracerMemroy, 1024 * 1024 );
	pstThisTracer = (TRACE_DESC_S *)vfmw_Osal_Func_Ptr_S.pfun_Osal_ioremap( TracerMemroy, 1024 * 1024 );

	if (NULL == pstThisTracer)
	{
	    dprint(PRN_ALWS, "map vir address for '%x' failed!!!\n", TracerMemroy);
	    return;
	}

	pstThisTracer->pstTraceBaseObj = (TRACE_OBJ_S *)((UINT8*)pstThisTracer + sizeof(TRACE_DESC_S));

	dprint(PRN_ALWS, "tracer memory '0x%x' is mapped to '%p'\n", TracerMemroy, pstThisTracer);
    }
    else
    {
	pstThisTracer = s_pstTracer;
    }

    if (NULL == pstThisTracer)
    {
	dprint(PRN_ALWS, "map vir address for '%x' failed!!!\n", TracerMemroy);
	return;
    }

    pv = &pstThisTracer->u32ValidFlag[0];

    if (pv[0] != VF0 || pv[1] != VF1 || pv[2] != VF2 || pv[3] != VF3)
    {
	dprint(PRN_ALWS, "no valid trace info stored in '%x'!!!\n", TracerMemroy);
	return;
    }

    dprint(PRN_ALWS, "====================== tracer context =====================\n");
    dprint(PRN_ALWS, "%-25s :%x\n", "pstTraceBaseObj", pstThisTracer->pstTraceBaseObj);
    dprint(PRN_ALWS, "%-25s :%p\n", "s32TraceBasePhyAddr", pstThisTracer->s32TraceBasePhyAddr);
    dprint(PRN_ALWS, "%-25s :%d\n", "s32MaxTraceNumMinus4", pstThisTracer->s32MaxTraceNumMinus4);
    dprint(PRN_ALWS, "%-25s :%d\n", "s32CurrTraceNum", pstThisTracer->s32CurrTraceNum);

    /* 内部索引 */
    s32CurrTraceNum = pstThisTracer->s32CurrTraceNum;

    for (i = 0; i < pstThisTracer->s32MaxTraceNumMinus4; i++)
    {
	s32CurrTraceNum = (s32CurrTraceNum == 0) ? pstThisTracer->s32MaxTraceNumMinus4 : (s32CurrTraceNum - 1);
	pstTraceObj = pstThisTracer->pstTraceBaseObj + s32CurrTraceNum;

	dprint(PRN_ALWS, "-%05d-", i);
	dprint(PRN_ALWS, "func:%-15s;", pstTraceObj->s8FuncName);
	dprint(PRN_ALWS, " line:%5d;", pstTraceObj->s32LineNum);
	dprint(PRN_ALWS, " data:0x%08x(%-10d);", pstTraceObj->s32Data, pstTraceObj->s32Data);
	dprint(PRN_ALWS, " time:%u\n", pstTraceObj->u32Time);
    }

    if (NULL == s_pstTracer)
    {
	//iounmap(pstThisTracer);
	vfmw_Osal_Func_Ptr_S.pfun_Osal_iounmap(pstThisTracer);
    }

    return;
}

SINT32 LOG_IsPrintEnable(PRINT_MSG_TYPE Type)
{
    if ((PRN_ALWS != Type) && (0 == (g_PrintEnable & (1 << Type)))) /* 该类别打印没有打开 */
    {
	return 0;
    }

    return 1;
}

VOID LOG_PrintNothing(VOID)
{
    return;
}

#ifndef ENV_SOS_KERNEL
SINT32 LOG_Print(UINT32 type, const CHAR *format, ...)
{
    va_list args;
    SINT32  nTotalChar = 0;

    /* 信息类型过滤 */
    if ((PRN_ALWS != type) && (0 == (g_PrintEnable & (1 << type)))) /* 该类别打印没有打开 */
    {
	return -1;
    }

    /* 将信息打印成字符串 */
    va_start( args, format );
    nTotalChar = vsnprintf( g_TmpMsg, sizeof(g_TmpMsg), format, args );
    va_end( args );

    if ((nTotalChar <= 0) || (nTotalChar >= 1023))
    {
	return -1;
    }

    /* 将字符串输出到设备 */
    if ( DEV_SCREEN == g_PrintDevice )	    /* 设备0: 屏幕(串口) */
    {
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
#ifdef ENV_ARMLINUX_USER
	return ( OSAL_FP_print("U: %s", g_TmpMsg) );
#else
	return ( OSAL_FP_print("N: %s", g_TmpMsg) );
#endif

#else
	return 0;
#endif
    }
    else if ( DEV_SYSLOG == g_PrintDevice ) /* 设备1: 系统日志 */
    {
#ifdef ENV_ARMLINUX_KERNEL
	// 消息(g_TmpMsg, nTotalChar)如何在系统日志打印......
#endif
    }
    else if ( DEV_FILE == g_PrintDevice )   /* 设备2: 文件 */
    {
	if ( g_fpLog )
	{
	    return ( vfmw_Osal_Func_Ptr_S.pfun_Osal_FileWrite(g_TmpMsg, nTotalChar, g_fpLog) );
	 }
    }
    else if ( DEV_MEM == g_PrintDevice )    /* 设备3: 内存 */
    {
	// 如何打印到内存......
    }

    return -1;
}
#endif

SINT32 LOG_IsRecPosEnable(VFMW_STATE_TYPE_E type)
{
    if ((g_TraceCtrl & (1 << type)) != 0)
    {
	return 1;
    }
    else
    {
	return 0;
    }
}

VOID LOG_RecPos(SINT32 SmID, VFMW_STATE_TYPE_E VfmwStateType, UINT32 *LastRecPosTimeInMs, SINT8 *FunctionName, SINT32 LineNumber)
{
    SINT32 data = 0;
    UINT32 CurTimeInMs = 0;

    if (LOG_IsRecPosEnable(VfmwStateType))
    {
	CurTimeInMs = vfmw_Osal_Func_Ptr_S.pfun_Osal_GetTimeInMs();

	if ((CurTimeInMs - *LastRecPosTimeInMs) > g_TraceBsPeriod)
	{
	    *LastRecPosTimeInMs = CurTimeInMs;
	    data = (SmID << 24) + (VfmwStateType << 16);
	    LOG_AddTrace(FunctionName, LineNumber, data);
	}
    }
}
