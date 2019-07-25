#include "user_client.h"
#include "user_client_com.h"
#include "user_common_type.h"
#include "vfmw_linux_kernel_osal.h"
#include "vfmw_osal_ext.h"
#include "product.h"
#include "vdm_drv_nonkey.h"
#include "vdm_hal_local.h"

#include "simple_core.h"
#include "vfmw_linux_kernel_proc.h"

#include "vdh_distributor.h"

/*=============== LOCAL DEFINITION =============*/
typedef enum
{
    CHAN_INVALID = 0,
    CHAN_START,
    CHAN_STOP,
    CHAN_BUTT,
} CHAN_STATE_E;

typedef enum
{
    THREAD_INVALID = 0,
    THREAD_SLEEP,
    THREAD_RUN,
    THREAD_EXIT,
    THREAD_BUTT,
} THREAD_STATE_E;

typedef enum
{
    SMC_CMD_ID_INVALID = 0x0,
    SMC_CMD_ID_INIT,
    SMC_CMD_ID_EXIT,
    SMC_CMD_ID_RESUME,
    SMC_CMD_ID_SUSPEND,
    SMC_CMD_ID_CONTROL,
    SMC_CMD_ID_THREAD,
    SMC_CMD_ID_GET_IMAGE,
    SMC_CMD_ID_RELEASE_IMAGE,
    SMC_CMD_ID_READ_PROC,
    SMC_CMD_ID_WRITE_PROC,
} VFMW_SMC_CMD_ID;

typedef struct
{
    VBOOL	       IsUserMode;
    SINT32	       OutputImgEn;
    SINT32	       ChanID;
    CHAN_STATE_E       ChanState;
    OSAL_SEMA	       ChanSema;
    OSAL_FILE	      *pRawFile;
} USER_CHAN_CONTEXT_S;

typedef struct
{
    SINT32	  (*event_report_vdec)(SINT32 ChanID, SINT32 type, VOID *p_args);
    SINT32	  (*event_report_omxvdec)(SINT32 ChanID, SINT32 type, VOID *p_args);
}VFMW_CALLBACK_S;

/*================= LOCAL MACRO ================*/
#define PATH_LEN	      (64)
#define PROC_CMD_LEN	      (16)

#ifdef VFMW_STB_PRODUCT
#define SECURE_NOTIFY_IRQ_NUM (146+32)
#else
#define SECURE_NOTIFY_IRQ_NUM (21+32)
#endif
#define VFMW_SMC_PROC_NAME    "smc_secure"
#define PROC_CMD_HELP	      "help"
#define PROC_CMD_SUSPEND      "suspend"
#define PROC_CMD_RESUME	      "resume"
#define PROC_CMD_SAVERAW      "saveraw"
#define PROC_CMD_SAVEYUV      "saveyuv"
#define PROC_CMD_START	      "start"
#define PROC_CMD_STOP	      "stop"
#define PROC_CMD_PRINTTIME    "printtime"
#define PROC_CMD_SETPRINT     (0x000)
#define PROC_CMD_SELECT	      (0x900)

#define INVALID_HANDLE	      (-1)


/* Global pointer */
MEMORY_NEEDED_SECVFMW_S *g_pUserVfmwMem = NULL;
CALLBACK_ARRAY_NS	*g_pCallbackBuf = NULL;
RAW_ARRAY_NS		*g_pStreamBuf	= NULL;
IMAGE_QUEUE_NS		*g_pImageQue	= NULL;
#if (1 == DEBUG_SAVE_SUPPORT)
UINT8			*g_pSaveStreamBuf = NULL;
#endif
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
UINT8			*g_pProcBuf	= NULL;
#endif

DEFINE_SEMAPHORE(g_VfmwInitMutex);

/*================= LOCAL VALUE ================*/
/*静态全局变量*/
static SINT32		 s_VfmwInitCount	= 0;
static MEM_DESC_S	 g_UserVfmwMem;
static SINT32		 g_UserPrintEnable	= 0x0;
static SINT32		 g_UserProcSelect	= 0x0;
static SINT32		 g_UserInstNum		= 0;
static SINT32		 g_UserDecoderInitCnt	= 0;
static HI_BOOL		 g_bUserEnvSetUp	= HI_FALSE;
static THREAD_STATE_E	 g_THREAD_STATE		= THREAD_INVALID;
static OSAL_SEMA	 g_stSem_s;
static VFMW_CALLBACK_S	 g_CallBack;
OSAL_EVENT		 g_UserThreadEvent;
#if (1 == DEBUG_SAVE_SUPPORT)
static HI_BOOL		 g_RawSaveEnable	= HI_FALSE;
static HI_CHAR		 g_SavePath[PATH_LEN]	= {'/', 'm', 'n', 't', '\0'};
#endif
static HI_BOOL		 g_bPrintTime		= HI_FALSE;

/*通道相关全局变量*/
static STREAM_INTF_S	 g_StreamIntf[MAX_CHAN_NUM];
static USER_CHAN_CONTEXT_S    g_ChanContext[MAX_CHAN_NUM];


/*================ GLOBAL VALUE ================*/
VDMDRV_FUN_PTR_S g_vdm_drv_fun_ptr;


/*============== INTERNAL FUNCTION =============*/
static SINT32 VFMW_UC_SetCallBack(VDEC_ADAPTER_TYPE_E eType, SINT32 (*event_report)(SINT32 ChanID, SINT32 type, VOID *p_args))
{
    CHECK_NULL_PTR_ReturnValue(event_report, VDEC_ERR_NULL_PRT);

    switch (eType)
    {
	case ADAPTER_TYPE_VDEC:
	    g_CallBack.event_report_vdec = event_report;
	    break;

	case ADAPTER_TYPE_OMXVDEC:
	    g_CallBack.event_report_omxvdec = event_report;
	    break;

	default:
	    dprint(PRN_FATAL, "%s Unkown Adapter Type: %d\n", __func__, eType);
	    return VDEC_ERR;
    }

    return VDEC_OK;
}

static SINT32 VFMW_UC_ProcessCallBack(VOID)
{
    SINT32		ret = VDEC_OK;
    SINT32		ChanID;
    SINT32		Type;
    VDEC_ADAPTER_TYPE_E eAdapterType;
    UINT8		*pPara;

    while (g_pCallbackBuf->Tail != g_pCallbackBuf->Head)
    {
	if (g_pCallbackBuf->Message[g_pCallbackBuf->Tail].IsValid)
	{
	    ChanID = g_pCallbackBuf->Message[g_pCallbackBuf->Tail].ChanID;
	    Type   = g_pCallbackBuf->Message[g_pCallbackBuf->Tail].Type;
	    pPara  = (HI_U8 *)g_pCallbackBuf->Message[g_pCallbackBuf->Tail].para;
	    eAdapterType = g_pCallbackBuf->Message[g_pCallbackBuf->Tail].eAdapterType;

	    switch (eAdapterType)
	    {
		case ADAPTER_TYPE_VDEC:
		    if (NULL == g_CallBack.event_report_vdec)
		    {
			dprint(PRN_FATAL, "s_VfmwCTrl.event_report_vdec = NULL\n");
		    }
		    else
		    {
			ret = (g_CallBack.event_report_vdec)(ChanID, Type, pPara);
		    }
		    break;

		case ADAPTER_TYPE_OMXVDEC:
		    if (NULL == g_CallBack.event_report_omxvdec)
		    {
			dprint(PRN_FATAL, "s_VfmwCTrl.event_report_omxvdec = NULL\n");
		    }
		    else
		    {
			ret = (g_CallBack.event_report_omxvdec)(ChanID, Type, pPara);
		    }
		    break;

		default:
		    dprint(PRN_FATAL, "%s Unkown Adapter Type: %d\n", __func__, eAdapterType);
		    break;
	    }
	}

	g_pCallbackBuf->Tail = (g_pCallbackBuf->Tail + 1) % MAX_EVENT_NUM;
    }

    return ret;
}

static SINT32 VFMW_UC_FindOccupiedFrame(SINT32 ChanID, VDEC_SPECIAL_FRM_S *pSpecialFrmInfo)
{
    SINT32 i = 0, j = 0;
    SINT32 ret = VDEC_ERR;
    OUTPUT_IMAGE_RECORD_S *pOutputRec;

    if (NULL != g_pImageQue)
    {
	pOutputRec = g_pImageQue[ChanID].StOutputRec;
	for (i = 0; i < MAX_QUEUE_IMAGE_NUM; i++)
	{
	    if (1 == pOutputRec[i].IsUsed)
	    {
		pSpecialFrmInfo->specialFrmRec[j++].PhyAddr = pOutputRec[i].TopLumaPhyAddr;

		pOutputRec[i].IsUsed = 0;

	    }
	}

	pSpecialFrmInfo->specialFrameNum = j;
	OSAL_FP_memset(&g_pImageQue[ChanID], 0, sizeof(IMAGE_QUEUE_NS));
	ret = VDEC_OK;

    }

    return ret;
}

static VOID VFMW_UC_GetChanStream(SINT32 ChanID)
{
    STREAM_DATA_S *pStrRawPacket = NULL;

    if (g_StreamIntf[ChanID].read_stream == NULL
	|| g_ChanContext[ChanID].ChanState != CHAN_START)
    {
	dprint(PRN_DBG, "%s:%d chan:%d param is invalid state:%d\n", __func__, __LINE__, ChanID, g_ChanContext[ChanID].ChanState);

	return;
    }

    Down_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);

    while (1)
    {
	if (((g_pStreamBuf[ChanID].Head_NS + 1) % MAX_RAW_NUM) != g_pStreamBuf[ChanID].Tail_NS)
	{
	    pStrRawPacket = &(g_pStreamBuf[ChanID].RawPacket[g_pStreamBuf[ChanID].Head_NS]);

	    if (0 == g_StreamIntf[ChanID].read_stream(g_StreamIntf[ChanID].stream_provider_inst_id, pStrRawPacket))
	    {
		g_pStreamBuf[ChanID].Head_NS = (g_pStreamBuf[ChanID].Head_NS + 1) % MAX_RAW_NUM;

	    #if (1 == DEBUG_SAVE_SUPPORT)
		TVP_VDEC_SaveStream(ChanID, g_RawSaveEnable, pStrRawPacket->PhyAddr, pStrRawPacket->Length);   //fix me!
	    #endif
	    }
	    else
	    {
		break;
	    }
	}
	else
	{
	    break;
	}
    }

    Up_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);

    return;
}

static VOID VFMW_UC_ReleaseChanStream(SINT32 ChanID)
{
    STREAM_DATA_S *pStrRawPacket = NULL;

    if (g_StreamIntf[ChanID].release_stream == NULL)
    {
	dprint(PRN_DBG, "%s:%d ChanID:%d param is invalid\n", __func__, __LINE__, ChanID);

	return;
    }

    Down_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);

    while (1)
    {
	if (g_pStreamBuf[ChanID].Tail_NS != g_pStreamBuf[ChanID].Tail_S)
	{
	    pStrRawPacket = &(g_pStreamBuf[ChanID].RawPacket[g_pStreamBuf[ChanID].Tail_NS]);

	    if (0 == g_StreamIntf[ChanID].release_stream(g_StreamIntf[ChanID].stream_provider_inst_id, pStrRawPacket))
	    {
		g_pStreamBuf[ChanID].Tail_NS = (g_pStreamBuf[ChanID].Tail_NS + 1) % MAX_RAW_NUM;
	    }
	    else
	    {
		break;
	    }
	}
	else
	{
	    break;
	}
    }

    Up_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);

    return;
}

/************reset chan release_stream*******************/
static SINT32 VFMW_UC_ClearStream(SINT32 ChanID)
{
    STREAM_DATA_S *pStrRawPacket;

    /*清还未被安全侧读取的码流*/
    if (NULL != g_StreamIntf[ChanID].release_stream)
    {
	while (1)
	{
	    if (g_pStreamBuf[ChanID].Tail_NS != g_pStreamBuf[ChanID].Head_NS)
	    {
		pStrRawPacket = &(g_pStreamBuf[ChanID].RawPacket[g_pStreamBuf[ChanID].Tail_NS]);

		if (0 == g_StreamIntf[ChanID].release_stream(g_StreamIntf[ChanID].stream_provider_inst_id, pStrRawPacket))
		{
		    g_pStreamBuf[ChanID].Tail_NS = (g_pStreamBuf[ChanID].Tail_NS + 1) % MAX_RAW_NUM;
		}
		else
		{
		    break;
		}
	    }
	    else
	    {
		break;
	    }
	}
    }

    OSAL_FP_memset(&g_pStreamBuf[ChanID], 0, sizeof(RAW_ARRAY_NS));

    return VDEC_OK;
}

/********清相应通道的callback信息******/
static SINT32 VFMW_UC_ClearCallback(SINT32 ChanID)
{
    SINT32 Tail;

    Tail = g_pCallbackBuf->Tail;

    while (Tail != g_pCallbackBuf->Head)
    {
	if (ChanID == g_pCallbackBuf->Message[Tail].ChanID)
	{
	    g_pCallbackBuf->Message[Tail].IsValid = 0;
	}

	Tail = (Tail + 1) % MAX_EVENT_NUM;
    }

    return VDEC_OK;
}

/************************************************************************
   非安全侧线程，管理码流和callback信息
 ************************************************************************/
static SINT32 VFMW_UC_Thread_Process(VOID *pArgs)
{
    SINT32 NextInstID;
    static UINT32 BeginTime = 0;
    static UINT32 StartTime = 0;
    static UINT32 EndTime = 0;
    static UINT32 TotalTime = 0;
    static UINT32 Count = 0;

    UINT32 LastStartTime = OSAL_GetTimeInUs();
    UINT32 CurrentTime = 0;

    while (1)
    {
	if (g_bPrintTime)
	{
	    CurrentTime = OSAL_GetTimeInUs();

	    if (CurrentTime - LastStartTime > 1000 * 15)
	    {
		dprint(PRN_DBG, "NS: last time sleep exceed cost:   %d	 us\n", CurrentTime - LastStartTime);
	    }
	}

	switch (g_THREAD_STATE)
	{
	    case THREAD_RUN:
		break;

	    case THREAD_SLEEP:
		goto sleep;

	    case THREAD_EXIT:
		goto exit;

	    default:
		;
	}

	/*读码流*/
	for ( NextInstID = TRUSTED_CHAN_BEGIN; NextInstID < MAX_CHAN_NUM; NextInstID++ )
	{
	    VFMW_UC_GetChanStream(NextInstID);
	}

	if (g_bPrintTime)
	{
	    StartTime = OSAL_GetTimeInUs();
	    if (Count == 0)
	    {
		BeginTime = StartTime;
	    }
	}

	if (g_bPrintTime)
	{
	    EndTime = OSAL_GetTimeInUs();
	    TotalTime += EndTime - StartTime;
	    Count++;

	    if (EndTime - BeginTime >= 1000000)
	    {
		dprint(PRN_DBG, "Invoke Total:	 %d   Count: %d	 Avg:	 %d	us\n", TotalTime, Count, TotalTime / Count);
		TotalTime = BeginTime = StartTime = EndTime = 0;
		Count = 0;
	    }

	    if (EndTime - StartTime >= 1000*10)
	    {
		dprint(PRN_DBG, "Invoke exceed cost:  %d  start:  %d   end:   %d   us\n", \
				    EndTime - StartTime, StartTime, EndTime);
	    }
	}

	/*上报callback信息*/
	VFMW_UC_ProcessCallBack();

	/*释放码流*/
	for ( NextInstID = TRUSTED_CHAN_BEGIN; NextInstID < MAX_CHAN_NUM; NextInstID++ )
	{
	    VFMW_UC_ReleaseChanStream(NextInstID);
	}

sleep:
	LastStartTime = OSAL_GetTimeInUs();

	if (g_bPrintTime)
	{
	    if (LastStartTime - CurrentTime >= 1000*10)
	    {
		dprint(PRN_TEE, "NS: run NS thread exceed cost:	 %d \n", LastStartTime - CurrentTime);
	    }
	}

	OSAL_WaitEvent(&g_UserThreadEvent, 10);
    }

exit:
    g_THREAD_STATE = THREAD_INVALID;
    return VDEC_OK;
}

/************create thread*******************/
static SINT32 VFMW_UC_Thread_Init(VOID)
{
    OSAL_TASK pTask;
    OSAL_InitEvent_s(&g_UserThreadEvent, 0);

    OSAL_CreateTask((VOID *)&pTask, "VfmwSmcProc", VFMW_UC_Thread_Process);

    if ( NULL == pTask)
    {
	dprint(PRN_FATAL, "Create thread VfmwSmcProc Failed!\n");
	return VDEC_ERR;
    }

    g_THREAD_STATE = THREAD_SLEEP;

    return VDEC_OK;
}

#ifndef	 HI_ADVCA_FUNCTION_RELEASE
static inline SINT32 VFMW_UC_String2Value(HI_PCHAR str, UINT32 *data)
{
    UINT32 i, d, dat, weight;

    dat = 0;

    if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X'))
    {
	i = 2;
	weight = 16;
    }
    else
    {
	i = 0;
	weight = 10;
    }

    for (; i < 10; i++)
    {
	if (str[i] < 0x20)
	{
	    break;
	}
	else if (weight == 16 && str[i] >= 'a' && str[i] <= 'f')
	{
	    d = str[i] - 'a' + 10;
	}
	else if (weight == 16 && str[i] >= 'A' && str[i] <= 'F')
	{
	    d = str[i] - 'A' + 10;
	}
	else if (str[i] >= '0' && str[i] <= '9')
	{
	    d = str[i] - '0';
	}
	else
	{
	    return -1;
	}

	dat = dat * weight + d;
    }

    *data = dat;

    return 0;
}

static VOID VFMW_UC_HelpProc(VOID)
{
    dprint(PRN_ALWS, "\n");
    dprint(PRN_ALWS, "================= SEC_VFMW HELP =================\n");
    dprint(PRN_ALWS, "USAGE:echo [cmd] [para] >/proc/sec_vfmw\n");
    dprint(PRN_ALWS, "	help,	  [not_care]	:read help infomation\n");
    dprint(PRN_ALWS, "	saveraw,  [start/stop]	:enable/disable raw save,debug only\n");
    dprint(PRN_ALWS, "	saveyuv,  [start/stop]	:enable/disable yuv save,debug only\n");
    dprint(PRN_ALWS, "	printtime		:enable/disable print time\n");
    dprint(PRN_ALWS, "\n");
    dprint(PRN_ALWS, "Further command avalible in trusted decoder:\n");
    dprint(PRN_ALWS, "	0x0,	  [print_word]	:set print enable word\n");
    dprint(PRN_ALWS, "	0x2,	  [0~100]	:set err thr\n");
    dprint(PRN_ALWS, "	0x4,	  [0/1]		:set output order(0/1=DISP/DEC)\n");
    dprint(PRN_ALWS, "	0x5,	  [0/1/2]	:set dec mode(0/1/2=IPB/IP/I)\n");
    dprint(PRN_ALWS, "	0x7,	  [0~100]	:set discard before dec thr\n");
    dprint(PRN_ALWS, "	0xb,	  [0/1]		:set frame/adaptive(0/1) storage\n");
    dprint(PRN_ALWS, "	0xd,	  [8~15]	:set to abserve specify channel\n");
    dprint(PRN_ALWS, "	0x400,	  [ms]		:set dec task schedule delay\n");
    dprint(PRN_ALWS, "	0x402,	  [0/1]		:start/stop syntax proccess\n");
    dprint(PRN_ALWS, "	0x501,	  [ms]		:set scd state period\n");
    dprint(PRN_ALWS, "	0x502,	  [ms]		:set vdh state period\n");
    dprint(PRN_ALWS, "	0x503,	  [ms]		:set rcv/rls frame period\n");
    dprint(PRN_ALWS, "=================================================\n");
    dprint(PRN_ALWS, "\n");

    return;
}

static SINT32 VFMW_UC_ParamProccess(const SINT8 __user *buffer, size_t count, UINT32 *p_option, UINT32 *p_value)
{
    SINT32  i, j;
    SINT32  ret = HI_FAILURE;
    HI_CHAR buf[PROC_CMD_LEN * 2];
    HI_CHAR str1[PROC_CMD_LEN];
    HI_CHAR str2[PROC_CMD_LEN];

    if (count < 1 || count >= sizeof(buf))
    {
	dprint(PRN_ALWS, "Parameter Invalid!\n");

	return HI_FAILURE;
    }

    OSAL_FP_memset(buf, 0, sizeof(buf));

    if (copy_from_user(buf, buffer, count))
    {
	dprint(PRN_ALWS, "Copy from user Failed!\n");

	return HI_FAILURE;
    }

    buf[count] = 0;

    /* 1.读取参数1 */
    i = 0;
    j = 0;

    for (; i < count; i++)
    {
	if (j == 0 && buf[i] == ' ')
	{
	    continue;
	}

	if (buf[i] > ' ')
	{
	    str1[j++] = buf[i];
	}

	if (j > 0 && buf[i] == ' ')
	{
	    break;
	}
    }

    str1[j] = 0;

    /* 2.读取参数2 */
    j = 0;

    for (; i < count; i++)
    {
	if (j == 0 && buf[i] == ' ')
	{
	    continue;
	}

	if (buf[i] > ' ')
	{
	    str2[j++] = buf[i];
	}

	if (j > 0 && buf[i] == ' ')
	{
	    break;
	}
    }

    str2[j] = 0;

    /* 3.参数判断 */
    if (!OSAL_FP_strncmp(str1, PROC_CMD_HELP, PROC_CMD_LEN))
    {
	VFMW_UC_HelpProc();
    }

#if (1 == DEBUG_SAVE_SUPPORT)
    else if (!OSAL_FP_strncmp(str1, PROC_CMD_SAVERAW, PROC_CMD_LEN))
    {
	if (!OSAL_FP_strncmp(str2, PROC_CMD_START, PROC_CMD_LEN))
	{
	    dprint(PRN_ALWS, "Enable Raw Stream Save.\n");
	    g_RawSaveEnable = HI_TRUE;
	}
	else if (!OSAL_FP_strncmp(str2, PROC_CMD_STOP, PROC_CMD_LEN))
	{
	    dprint(PRN_ALWS, "Disable Raw Stream Save.\n");
	    g_RawSaveEnable = HI_FALSE;
	}
    }

#endif
    else if (!OSAL_FP_strncmp(str1, PROC_CMD_SUSPEND, PROC_CMD_LEN))
    {
	LOG_NOT_SUPPORT();
    }
    else if (!OSAL_FP_strncmp(str1, PROC_CMD_PRINTTIME, PROC_CMD_LEN))
    {
	g_bPrintTime = !g_bPrintTime;

	dprint(PRN_ALWS, "enable print time:%d\n", g_bPrintTime);
    }
    else if (!OSAL_FP_strncmp(str1, PROC_CMD_RESUME, PROC_CMD_LEN))
    {
	LOG_NOT_SUPPORT();
    }
    else
    {
	/*转化参数1*/
	if (VFMW_UC_String2Value(str1, p_option) != 0)
	{
	    dprint(PRN_ALWS, "Unknown param %s\n", str1);
	}
	/*转化参数2*/
	else if (VFMW_UC_String2Value(str2, p_value) != 0)
	{
	    dprint(PRN_ALWS, "Unknown param %s\n", str2);
	}
	/*两个参数都有效*/
	else
	{
	    switch (*p_option)
	    {
		case PROC_CMD_SETPRINT:
		    g_UserPrintEnable = *p_value;
		    dprint(PRN_ALWS, "Set SecPrintEnable = 0x%x\n", g_UserPrintEnable);
		    break;

		case PROC_CMD_SELECT:
		    g_UserProcSelect = *p_value;
		    dprint(PRN_ALWS, "Set g_UserProcSelect = 0x%x\n", g_UserProcSelect);
		    break;

		default: /*默认参数必需通过TEE传递*/
		    if (HI_FALSE == g_bUserEnvSetUp)
		    {
			dprint(PRN_ALWS, "Trusted decoder NOT create yet!\n");
		    }

		    break;
	    }

	    /*安全解码器有效时才返回HI_SUCCESS*/
	    if (HI_TRUE == g_bUserEnvSetUp)
	    {
		ret = HI_SUCCESS;
	    }
	}
    }

    return ret;
}

static SINT32 VFMW_UC_SendProcCommand(UINT32 option, UINT32 value)
{
    LOG_NOT_SUPPORT();

    return VDEC_ERR;
}

static SINT32 VFMW_UC_ReadProc(struct seq_file *p, VOID *v)
{
    LOG_NOT_SUPPORT();

    PROC_PRINT(p, " NOT SUPPORT!!!!!\n");

    return 0;
}


static SINT32 VFMW_UC_WriteProc(struct file *file, const char __user *buffer, size_t count, loff_t *data)
{
    UINT32 option, value;
    SINT32 ret;

    ret = VFMW_UC_ParamProccess(buffer, count, &option, &value);

    Down_Interruptible_with_Option(&g_stSem_s);

    if (HI_SUCCESS != ret)
    {
	Up_Interruptible_with_Option(&g_stSem_s);
	return count;
    }

    if (HI_TRUE == g_bUserEnvSetUp)
    {
	ret = VFMW_UC_SendProcCommand(option, value);

	if (HI_SUCCESS != ret)
	{
	    dprint(PRN_ALWS, "Invalid CMD(%d %d), refer to help.\n", option, value);
	    VFMW_UC_HelpProc();
	}
    }

    Up_Interruptible_with_Option(&g_stSem_s);

    return count;
}
#endif

static VOID VFMW_UC_ContextInit(VOID)
{
    /*全局指针初始化*/
    g_pUserVfmwMem	   = NULL;
    g_pCallbackBuf	  = NULL;
    g_pStreamBuf	  = NULL;

    g_pImageQue		  = NULL;
#if (1 == DEBUG_SAVE_SUPPORT)
    g_pSaveStreamBuf	  = NULL;
#endif
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    g_pProcBuf		  = NULL;
#endif

    /*静态全局变量初始化*/
    g_UserInstNum	  = 0;
    g_UserDecoderInitCnt  = 0;
    g_bUserEnvSetUp	  = HI_FALSE;
    g_THREAD_STATE	  = THREAD_INVALID;

    /*全局结构体初始化*/
    OSAL_FP_memset(&g_UserVfmwMem, 0, sizeof(MEM_DESC_S));
    OSAL_FP_memset(g_StreamIntf,  0, sizeof(STREAM_INTF_S)*MAX_CHAN_NUM);
    OSAL_FP_memset(&g_CallBack, 0, sizeof(VFMW_CALLBACK_S));

    //因为这个结构体和非安通道相关，不应该放在这里初始化
    //OSAL_FP_memset(g_ChanContext, 0, sizeof(USER_CHAN_CONTEXT_S)*TOTAL_MAX_CHAN_NUM);
}

static VOID VFMW_UC_InitProc(VOID)
{
    SINT32 ret;

    ret = OSAL_FP_proc_create(VFMW_SMC_PROC_NAME, VFMW_UC_ReadProc, VFMW_UC_WriteProc);
    if (0 != ret)
    {
	dprint(PRN_ERROR, "%s create proc %s failed!\n", __func__, VFMW_SMC_PROC_NAME);

	return;
    }

    return;
}

static VOID VFMW_UC_ExitProc(VOID)
{
    OSAL_FP_proc_destroy(VFMW_SMC_PROC_NAME);

    return;
}



static VBOOL VFMW_UC_IsLocalComand(VDEC_CID_E eCmdID)
{
    if ( eCmdID == VDEC_CID_GET_CHAN_STATE
      || eCmdID == VDEC_CID_SET_STREAM_INTF)
    {
	return VDEC_TRUE;
    }

    if ( eCmdID == VDEC_CID_SET_IMG_OUTPUT_INFO
      || eCmdID == VDEC_CID_REPORT_OCCUQIED_FRM)
    {
	return VDEC_TRUE;
    }

    return VDEC_FALSE;
}

VOID VFMW_UC_GlobalInit(VOID)
{
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    VFMW_UC_InitProc();
#endif

    Sema_Init_with_Option(&g_stSem_s);

    OSAL_FP_memset(g_ChanContext, 0, sizeof(USER_CHAN_CONTEXT_S)*MAX_CHAN_NUM);

    return;

}

VOID VFMW_UC_GlobalDeInit(VOID)
{
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    VFMW_UC_ExitProc();
#endif

    return;
}

SINT32 VFMW_UC_Init(VDEC_OPERATION_S *pArgs)
{
    SINT32 ret;

    Down_Interruptible_with_Option(&g_stSem_s);

    if ((NULL == pArgs)||(NULL == pArgs->VdecCallback))
    {
	dprint(PRN_FATAL, "%s: Param Invalid!\n", __func__);
	Up_Interruptible_with_Option(&g_stSem_s);
	return VDEC_ERR;
    }

    /* 初始化全局信息*/
    VFMW_UC_ContextInit();

    /* 申请内存，全局信息赋值*/
    if (HI_SUCCESS != OSAL_FP_mem_alloc("VFMW_Share_Buf", sizeof(MEMORY_NEEDED_SECVFMW_S), 4, 0, &g_UserVfmwMem))
    {
	dprint(PRN_FATAL, "Alloc Sec Vfmw Buffer Failed!\n");
	goto InitWithfree_0;
    }

#ifdef HI_SMMU_SUPPORT
    g_UserVfmwMem.PhyAddr = g_UserVfmwMem.MmuAddr;
#endif
    g_pUserVfmwMem = (MEMORY_NEEDED_SECVFMW_S *)(ULONG)(g_UserVfmwMem.VirAddr);
    OSAL_FP_memset(g_pUserVfmwMem, 0, sizeof(MEMORY_NEEDED_SECVFMW_S));
    g_pCallbackBuf   = (CALLBACK_ARRAY_NS *)(&g_pUserVfmwMem->CallBackBuf);
    g_pStreamBuf     = (RAW_ARRAY_NS *)(g_pUserVfmwMem->StreamBuf);
    g_pImageQue	     = (IMAGE_QUEUE_NS *)(g_pUserVfmwMem->ImageQue);
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    g_pProcBuf	     = (UINT8 *)(g_pUserVfmwMem->ProcBuf);
#endif
#if (1 == DEBUG_SAVE_SUPPORT)
    g_pSaveStreamBuf = (UINT8 *)(g_pUserVfmwMem->SaveStreamBuf);
#endif

    OSAL_FP_memset(&pArgs->stExtHalMem, 0, sizeof(MEM_DESC_S));
    pArgs->ShareData.share_mem_addr = g_UserVfmwMem.PhyAddr;

#ifdef VDH_DISTRIBUTOR_ENABLE
    if (g_HalDisable != 1)
    {
	ret = VDH_Get_ShareData(&pArgs->ShareData);
	if (ret != VDH_OK)
	{
	    dprint(PRN_FATAL, "%s VDH_Get_ContextData failed\n", __func__);
	}
    }
    /* 同步硬件抽象层控制字*/
    pArgs->ShareData.hal_disable = g_HalDisable;
#endif
    /* 4. 同步安全打印控制字*/
    pArgs->ShareData.sec_print_word = g_UserPrintEnable;

    /* 6. 建立安全解码线程*/
    ret = VFMW_UC_Thread_Init();
    if (ret != VDEC_OK)
    {
	dprint(PRN_FATAL, "Call VFMW_UC_Thread_Init() Failed!\n");
	goto InitWithfree_2;
    }

    Up_Interruptible_with_Option(&g_stSem_s);

    return VDEC_OK;

InitWithfree_2:
    KernelMemFree(&g_UserVfmwMem);
    VFMW_UC_ContextInit();

InitWithfree_0:
    Up_Interruptible_with_Option(&g_stSem_s);

    return VDEC_ERR;
}

SINT32 VFMW_UC_Exit(VOID)
{
    UINT32 i = 0;

    Down_Interruptible_with_Option(&g_stSem_s);

    if (HI_FALSE == g_bUserEnvSetUp)
    {
	dprint(PRN_ERROR, "UserDecoder not init, return OK.\n");
	Up_Interruptible_with_Option(&g_stSem_s);
	return VDEC_OK;
    }

    if (g_UserInstNum > 0)
    {
	dprint(PRN_ERROR, "UserInstNum(%d) > 0, return OK.\n", g_UserInstNum);
	Up_Interruptible_with_Option(&g_stSem_s);
	return VDEC_OK;
    }

    g_THREAD_STATE = THREAD_EXIT;

    for (i = 0; i < 50; i++)
    {
	if (THREAD_INVALID == g_THREAD_STATE)
	{
	    break;
	}
	else
	{
	    OSAL_MSLEEP(10);
	}
    }

    KernelMemFree(&g_UserVfmwMem);
    g_UserDecoderInitCnt = 0;
    g_bUserEnvSetUp = HI_FALSE;

    Up_Interruptible_with_Option(&g_stSem_s);

    return VDEC_OK;
}

static SINT32 VFMW_UC_OutReordOneImage(SINT32 ChanID, IMAGE_LIST_S *pOutImgList, IMAGE *pImage)
{
    SINT32 i;
    OUTPUT_IMAGE_RECORD_S *pOutputRec;

    pOutputRec = g_pImageQue[ChanID].StOutputRec;

    for (i=0; i<MAX_QUEUE_IMAGE_NUM; i++)
    {
	if (pOutputRec[i].IsUsed == 0)
	{
	    pOutputRec[i].TopLumaPhyAddr = pImage->top_luma_phy_addr;
	    pOutputRec[i].IsUsed = 1;
	    break;
	}
    }

    if (i >= MAX_QUEUE_IMAGE_NUM)
    {
	dprint(PRN_ERROR, "%s no free output record slot\n", __func__);
	return VDEC_ERR;
    }

    pOutImgList->Head = (pOutImgList->Head + 1) % MAX_QUEUE_IMAGE_NUM;

    return VDEC_OK;
}

static SINT32 VFMW_UC_InReleaseOneImage(SINT32 ChanID, IMAGE_LIST_S *pRelImgList, IMAGE *pImage)
{
    SINT32 i;
    OUTPUT_IMAGE_RECORD_S *pOutputRec;

    pRelImgList->StImage[pRelImgList->Tail].image_id = pImage->image_id;
    pRelImgList->StImage[pRelImgList->Tail].image_id_1 = pImage->image_id_1;
    pRelImgList->StImage[pRelImgList->Tail].top_luma_phy_addr = pImage->top_luma_phy_addr;

    pOutputRec = g_pImageQue[ChanID].StOutputRec;
    for (i=0; i<MAX_QUEUE_IMAGE_NUM; i++)
    {
	if ((pOutputRec[i].IsUsed == 1) && (pImage->top_luma_phy_addr == pOutputRec[i].TopLumaPhyAddr))
	{
	    pOutputRec[i].TopLumaPhyAddr = 0;
	    pOutputRec[i].IsUsed = 0;
	    break;
	}
    }

    if (i >= MAX_QUEUE_IMAGE_NUM)
    {
	dprint(PRN_ERROR, "%s not found output record slot\n", __func__);
	return VDEC_ERR;
    }

    pRelImgList->Tail = (pRelImgList->Tail + 1) % MAX_QUEUE_IMAGE_NUM;

    return VDEC_OK;
}

static SINT32 VFMW_UC_GetPairImage(SINT32 ChanID, IMAGE_LIST_S *pImgList, IMAGE *pImage_0)
{
    IMAGE *pImage_1 = NULL;
    UINT32 last_frame_flag = 0;
    UINT32 NextPos;

    pImage_0->image_id_1 = -1;

    /* image 0 is last frame */
    if (pImage_0->last_frame)
    {
	last_frame_flag = 1;
	pImage_0->top_chrom_phy_addr_1 = pImage_0->top_chrom_phy_addr;
	pImage_0->top_luma_phy_addr_1 = pImage_0->top_luma_phy_addr;
	pImage_0->image_id_1 = -1;
	pImage_0->eFramePackingType = FRAME_PACKING_TYPE_TIME_INTERLACED;
	pImage_0->last_frame = 1;

	return VDEC_OK;
    }

    NextPos = (pImgList->Head + 1) % MAX_QUEUE_IMAGE_NUM;
    if (NextPos == pImgList->Tail) // no next frame
    {
	return VDEC_ERR;
    }

    // get next frame
    pImage_1 = &(pImgList->StImage[NextPos]);
    if (pImage_0->view_id < pImage_1->view_id)
    {
	pImage_0->top_chrom_phy_addr_1 = pImage_1->top_chrom_phy_addr;
	pImage_0->top_luma_phy_addr_1  = pImage_1->top_luma_phy_addr;
	pImage_0->btm_luma_phy_addr_1  = pImage_1->btm_luma_phy_addr;
	pImage_0->btm_chrom_phy_addr_1 = pImage_1->btm_chrom_phy_addr;
	pImage_0->image_id_1 = pImage_1->image_id;
	pImage_0->eFramePackingType = FRAME_PACKING_TYPE_TIME_INTERLACED;

	if (pImage_1->last_frame)
	{
	    pImage_0->last_frame = 1;
	}

	VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_1);

	return VDEC_OK;
    }

    if (pImage_0->view_id > pImage_1->view_id)
    {
	//return frame 1;
	//release frame 0;
	VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_0);
	VFMW_UC_InReleaseOneImage(ChanID, pImgList, pImage_0);

	dprint(PRN_ERROR, "%s: view_0 id(%d) > view_1 id(%d), error!\n", __func__, pImage_0->view_id, pImage_1->view_id);
	return VDEC_ERR;
    }

    if (pImage_0->view_id == 0)
    {
	//return frame 1;
	//release frame 0;
	VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_0);
	VFMW_UC_InReleaseOneImage(ChanID, pImgList, pImage_0);

	dprint(PRN_ERROR, "%s: continuous view0 id(%d)!\n", __func__, pImage_0->view_id);
	return VDEC_ERR;
    }

    //release frame 0;
    VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_0);
    VFMW_UC_InReleaseOneImage(ChanID, pImgList, pImage_0);

    dprint(PRN_ERROR, "%s: continuous view1 id(%d)!\n", __func__, pImage_0->view_id);

    if (pImage_1->last_frame == 0)
    {
	//release frame 1;
	VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_1);
	VFMW_UC_InReleaseOneImage(ChanID, pImgList, pImage_1);

	return VDEC_ERR;
    }

    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemCpy(pImage_0, pImage_1, sizeof(IMAGE));
    pImage_0->top_chrom_phy_addr_1 = pImage_1->top_chrom_phy_addr;
    pImage_0->top_luma_phy_addr_1 = pImage_1->top_luma_phy_addr;
    pImage_0->image_id_1 = -1;
    pImage_0->eFramePackingType = FRAME_PACKING_TYPE_TIME_INTERLACED;
    pImage_0->last_frame = 1;

    VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage_1);

    return VDEC_OK;
}

SINT32 VFMW_UC_GetImage(SINT32 ChanID, IMAGE *pImage)
{
    SINT32 ret = VDEC_ERR;
    UINT64 pOutFrame;
    IMAGE *pImageHead;
    IMAGE_LIST_S *pImgList;

    if (!g_bUserEnvSetUp)
    {
	dprint(PRN_ERROR, "%s: UserDecoder not creat yet!\n", __func__);
	return VDEC_ERR;
    }

    if (g_ChanContext[ChanID].OutputImgEn == 0)
    {
	return VDEC_ERR;
    }

    if (g_pImageQue == NULL)
    {
	dprint(PRN_ERROR, "%s: g_pImageQue = null!\n", __func__);
	return VDEC_ERR;
    }

    if (pImage == NULL)
    {
	dprint(PRN_ERROR, "%s: pImage = null!\n", __func__);
	return VDEC_ERR;
    }

    if (ChanID < TRUSTED_CHAN_BEGIN || ChanID >= MAX_CHAN_NUM)
    {
	dprint(PRN_ERROR, "%s: ChanID invalid!\n", __func__, ChanID);
	return VDEC_ERR;
    }

    pImgList = &(g_pImageQue[ChanID].StOutputImg);
    if (pImgList->Head == pImgList->Tail)
    {
	return VDEC_ERR;
    }

    pOutFrame = pImage->pOutFrame;

    pImageHead = &(pImgList->StImage[pImgList->Head]);
    if (pImageHead->is_3D)
    {
	if (VFMW_UC_GetPairImage(ChanID, pImgList, pImageHead) != VDEC_OK)
	{
	    return VDEC_ERR;
	}
    }

    OSAL_FP_memcpy(pImage, pImageHead, sizeof(IMAGE));

    pImage->pOutFrame = pOutFrame;

    ret = VFMW_UC_OutReordOneImage(ChanID, pImgList, pImage);

    return ret;
}

SINT32 VFMW_UC_ReleaseImage(SINT32 ChanID, IMAGE *pImage)
{
    SINT32 ret = VDEC_ERR;
    IMAGE_LIST_S *pImgList;
    IMAGE Image_1 = {0};

    if (!g_bUserEnvSetUp)
    {
	dprint(PRN_ERROR, "%s: UserDecoder not creat yet!\n", __func__);
	return VDEC_ERR;
    }

    if (g_pImageQue == NULL)
    {
	dprint(PRN_ERROR, "%s: g_pImageQue = null!\n", __func__);
	return VDEC_ERR;
    }

    if (pImage == NULL)
    {
	dprint(PRN_ERROR, "%s: pImage = null!\n", __func__);
	return VDEC_ERR;
    }

    if (ChanID < TRUSTED_CHAN_BEGIN || ChanID >= MAX_CHAN_NUM)
    {
	dprint(PRN_ERROR, "%s: ChanID invalid!\n", __func__, ChanID);
	return VDEC_ERR;
    }

    pImgList = &g_pImageQue[ChanID].StReleaseImg;

    ret = VFMW_UC_InReleaseOneImage(ChanID, pImgList, pImage);

    if (pImage->image_id_1 != -1)
    {
	Image_1.image_id = pImage->image_id_1;
	Image_1.top_luma_phy_addr = pImage->top_luma_phy_addr_1;
	ret = VFMW_UC_InReleaseOneImage(ChanID, pImgList, &Image_1);
    }

    return ret;
}

SINT32 VFMW_UC_Control(SINT32 ChanID, VDEC_CID_E eCmdID, VOID *pArgs, UINT32 ParamLength)
{
    SINT32 ret = VDEC_ERR;

    switch (eCmdID)
    {
	case VDEC_CID_SET_IMG_OUTPUT_INFO:
	    if ((NULL != pArgs) && (ChanID >= TRUSTED_CHAN_BEGIN) && (ChanID < MAX_CHAN_NUM))
	    {
		g_ChanContext[ChanID].OutputImgEn = *(SINT32*)pArgs;
		ret = VDEC_OK;
	    }
	    break;

	case VDEC_CID_REPORT_OCCUQIED_FRM:
	    if ((NULL != pArgs) && (ChanID >= TRUSTED_CHAN_BEGIN) && (ChanID < MAX_CHAN_NUM))
	    {
		ret = VFMW_UC_FindOccupiedFrame(ChanID, pArgs);
	    }
	    break;
	case VDEC_CID_GET_CHAN_STATE:
	    if ((NULL != pArgs) && (NULL != g_pUserVfmwMem) &&
		(ChanID >=TRUSTED_CHAN_BEGIN) && (ChanID < MAX_CHAN_NUM))
	    {
		OSAL_FP_memcpy(pArgs, &(g_pUserVfmwMem->ChanState[ChanID]), sizeof(VDEC_CHAN_STATE_S));
		ret = VDEC_OK;
	    }
	    else
	    {
		dprint(PRN_FATAL, "VDEC_CID_GET_CHAN_STATE Invalid Param\n");
	    }
	    break;

	case VDEC_CID_SET_STREAM_INTF:
	    if (NULL != pArgs)
	    {
		OSAL_FP_memcpy(&g_StreamIntf[ChanID], (STREAM_INTF_S *)pArgs, sizeof(STREAM_INTF_S));
		ret = VDEC_OK;
	    }
	    else
	    {
		dprint(PRN_FATAL, "VDEC_CID_SET_STREAM_INTF Invalid Param\n");
	    }
	    break;

	default:
	    dprint(PRN_ERROR, "%s: unsupport command %d, param length %d.\n", __func__, eCmdID, ParamLength);
	    break;
    }

    return ret;
}

VOID VFMW_UC_ProcessRemoteResult(SINT32 ChanID, VDEC_CID_E eCmdID, VOID *pArgs, SINT32 RemoteResult)
{
    VDEC_CHAN_RESET_OPTION_S *pResetOption = NULL;

    switch (eCmdID)
    {
	case VDEC_CID_CREATE_CHAN:
	    if (RemoteResult == VDEC_OK)
	    {
		SINT32 *p32Array = (SINT32 *)pArgs;
		SINT32 RetChanID = p32Array[0];

		g_ChanContext[RetChanID].ChanID = RetChanID;
		g_ChanContext[RetChanID].IsUserMode = VDEC_TRUE;

		Sema_Init_with_Option(&g_ChanContext[RetChanID].ChanSema);
		g_UserInstNum++;
	    }
	    break;

	case VDEC_CID_START_CHAN:
	    g_ChanContext[ChanID].ChanState = CHAN_START;
	    g_ChanContext[ChanID].OutputImgEn = 1;
	    g_THREAD_STATE = THREAD_RUN;
	    break;

	case VDEC_CID_STOP_CHAN:
	    g_ChanContext[ChanID].ChanState = CHAN_STOP;
	    break;

	case VDEC_CID_DESTROY_CHAN:
	    Down_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);
	    VFMW_UC_ClearCallback(ChanID);
	    VFMW_UC_ClearStream(ChanID);
	    OSAL_FP_memset(&g_pImageQue[ChanID], 0, sizeof(IMAGE_QUEUE_NS));

	    g_UserInstNum--;

	    if (g_UserInstNum <= 0)
	    {
		g_UserInstNum = 0;
		g_THREAD_STATE = THREAD_SLEEP;
	    }

	    if (g_ChanContext[ChanID].pRawFile != NULL)
	    {
		OSAL_FP_fclose(g_ChanContext[ChanID].pRawFile);
		g_ChanContext[ChanID].pRawFile = NULL;
	    }

	    g_ChanContext[ChanID].ChanState = CHAN_INVALID;

	    Up_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);
	    break;

	case VDEC_CID_RESET_CHAN:
	    Down_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);
	    VFMW_UC_ClearCallback(ChanID);
	    VFMW_UC_ClearStream(ChanID);

	    OSAL_FP_memset(&(g_pImageQue[ChanID].StOutputImg), 0, sizeof(IMAGE_LIST_S));
	    Up_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);
	    break;

	case VDEC_CID_RESET_CHAN_WITH_OPTION:
	    pResetOption = (VDEC_CHAN_RESET_OPTION_S *)pArgs;

	    if (pResetOption->s32KeepBS == 0)
	    {
		Down_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);

		VFMW_UC_ClearStream(ChanID);
		VFMW_UC_ClearCallback(ChanID);
		OSAL_FP_memset(&(g_pImageQue[ChanID].StOutputImg), 0, sizeof(IMAGE_LIST_S));

		Up_Interruptible_with_Option(&g_ChanContext[ChanID].ChanSema);
	    }
	    break;

	default:
	    break;
    }

    return;
}

/*------------------------- EXTERNAL FUNCTION -------------------------*/
VOID VFMW_UC_EXT_OpenModule(VOID)
{
    OSAL_InitVfmwInterface();

    OSAL_FP_proc_init();

    VFMW_SCore_InitGlobalResource();

    PDT_Init(&g_vdm_drv_fun_ptr);

    VFMW_UC_GlobalInit();

    return;
}

VOID VFMW_UC_EXT_CloseModule(VOID)
{
    VFMW_UC_GlobalDeInit();

    OSAL_FP_proc_exit();

    return;
}

SINT32 VFMW_UC_EXT_Init(VDEC_OPERATION_S *pArgs)
{
    SINT32 Ret;
    VFMW_UCC_DATA UccData;

    CHECK_NULL_PTR_ReturnValue(pArgs, VDEC_ERR);

    Ret = down_interruptible(&g_VfmwInitMutex);
    if (VDEC_OK != Ret)
    {
        dprint(PRN_ERROR, "Get g_VfmwInitMutex failed!\n");
        return VDEC_ERR;
    }

    if (s_VfmwInitCount >= 1)
    {
        goto OK_EXIT;
    }

    VFMW_SCore_InitStaticResource();

    MEM_ManagerWithOperation(pArgs);

    Ret = VFMW_SCore_OpenVfmw(pArgs);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: OpenVfmw failed!\n",__func__);
    goto ERR_EXIT0;
    }

    Ret = VFMW_SCore_InitHardware(pArgs);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: VFMW_SCore_InitHardware failed!\n",__func__);
    goto ERR_EXIT1;
    }

    Ret = VFMW_UC_Init(pArgs);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: VFMW_UC_Init failed!\n",__func__);
    goto ERR_EXIT2;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_INIT, -1, pArgs, sizeof(VDEC_OPERATION_S), -1);

    Ret = VFMW_UC_Com_Process(&UccData);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: VFMW_UC_Com_Process VFMW_HID_INIT failed!\n",__func__);
    goto ERR_EXIT3;
    }

    s_VfmwInitCount = 1;
OK_EXIT:
    if (HI_TRUE == g_bUserEnvSetUp)
    {
        dprint(PRN_DBG, "UserDecoder already init(%d), return OK.\n", g_UserDecoderInitCnt);
        g_UserDecoderInitCnt++;
        if (s_VfmwInitCount < 0x7FFFFFFF)
        {
            s_VfmwInitCount++;
            Ret = VFMW_UC_SetCallBack(pArgs->eAdapterType, pArgs->VdecCallback);
            if (VDEC_OK != Ret)
            {
		dprint(PRN_ERROR, "Set CallBack Failed!\n");
            }
        }
        else
        {
            dprint(PRN_ERROR, "init count:%d is overflow\n", s_VfmwInitCount);
        }
    }
    else
    {
        Ret = VFMW_UC_SetCallBack(pArgs->eAdapterType, pArgs->VdecCallback);
        if (VDEC_OK != Ret)
        {
            dprint(PRN_ERROR, "Set CallBack Failed!\n");
            goto ERR_EXIT3;
        }
        g_UserDecoderInitCnt = 1;
        g_bUserEnvSetUp = HI_TRUE;
    }
    up(&g_VfmwInitMutex);

    return VDEC_OK;
ERR_EXIT3:
    VFMW_UC_Exit();
ERR_EXIT2:
	VFMW_SCore_ExitHardware();
ERR_EXIT1:
	VFMW_SCore_CloseVfmw();
ERR_EXIT0:
	MEM_ManagerClearOperation();
    up(&g_VfmwInitMutex);

    return VDEC_ERR;
}

SINT32 VFMW_UC_EXT_Exit(VOID)
{
    SINT32 Ret;
    VFMW_UCC_DATA UccData;

    Ret = down_interruptible(&g_VfmwInitMutex);
    if (VDEC_OK != Ret)
    {
        dprint(PRN_ERROR, "Get g_VfmwInitMutex failed!\n");
        return VDEC_ERR;
    }

    if (s_VfmwInitCount == 0)
    {
	//todo: 以前内核态的时候 会在此处跳过以下一些操作，重新设置以下回调函数而已
        goto OK_EXIT;
    }
    else if (s_VfmwInitCount > 1)
    {
        s_VfmwInitCount--;
        goto OK_EXIT;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_EXIT, -1, NULL, 0, -1);

    Ret = VFMW_UC_Com_Process(&UccData);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: VFMW_UC_Com_Process VFMW_HID_EXIT failed!\n", __func__);
    }

    Ret = VFMW_UC_Exit();
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s: VFMW_UC_Exit failed!\n", __func__);
    }

    VFMW_SCore_ExitHardware();

    VFMW_SCore_CloseVfmw();

    MEM_ManagerClearOperation();

    s_VfmwInitCount = 0;

OK_EXIT:
    up(&g_VfmwInitMutex);

    return VDEC_OK;
}

SINT32 VFMW_UC_EXT_Control(SINT32 ChanID, VDEC_CID_E eCmdID, VOID *pArgs, UINT32 ParamLength)
{
    SINT32 Ret = VDEC_OK;
    VFMW_UCC_DATA UccData;

    if (s_VfmwInitCount == 0)
    {
	dprint(PRN_ERROR, "Error: Vfmw Not Init!\n");
	return VDEC_ERR;
    }

    if (VFMW_UC_IsLocalComand(eCmdID) == VDEC_TRUE)
    {
	Ret = VFMW_UC_Control(ChanID, eCmdID, pArgs, ParamLength);
    }
    else
    {
	VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_CONTROL, eCmdID, pArgs, ParamLength, ChanID);
	Ret = VFMW_UC_Com_Process(&UccData);	//should make sure!
	VFMW_UC_ProcessRemoteResult(ChanID, eCmdID, pArgs, Ret);
    }

    return Ret;
}

SINT32 VFMW_UC_EXT_Suspend(VOID)
{
#ifdef VDH_DISTRIBUTOR_ENABLE
    if (g_HalDisable != 1)
    {
	// 有开分发时，后续会调用分发的Suspend函数，VDH_Suspend
	VDH_Suspend();
    }
    else
#endif
    {
	UINT32 i;

	// 5. 休眠完成后处理
	BPDDRV_CloseHardware(0);

	for (i = 0; i < MAX_SCD_NUM; i++)
	{
	    SCDDRV_CloseHardware(i);
	}

	for (i = 0; i < MAX_VDH_NUM; i++)
	{
	    VDMDRV_CloseHardware(i);
	}

    #ifdef HI_SMMU_SUPPORT
	MMUDRV_CloseHardware(0);
    #endif
    }

    return VDEC_OK;
}

SINT32 VFMW_UC_EXT_Resume(VOID)
{
#ifdef VDH_DISTRIBUTOR_ENABLE
    if (g_HalDisable != 1)
    {
	// 有开分发时，调用此函数之前会调用分发的Resume函数，VDH_Resume
	VDH_Resume();
    }
    else
#endif
    {
	UINT32 i;
	// 1. 硬件上电
	for (i = 0; i < MAX_VDH_NUM; i++)
	{
	    VDMDRV_OpenHardware(i);
	}

	for (i = 0; i < MAX_SCD_NUM; i++)
	{
	    SCDDRV_OpenHardware(i);
	}

	BPDDRV_OpenHardware(0);

#ifdef HI_SMMU_SUPPORT
	MMUDRV_OpenHardware(0);
	VDMDRV_SetSmmuPageTableAddr(0);
	VDMDRV_EnableSmmu();
#endif
    }
    return VDEC_OK;
}

SINT32 VFMW_UC_EXT_GetImage(SINT32 ChanID, IMAGE *pImage)
{
    SINT32 Ret = VDEC_ERR;

    Ret = VFMW_UC_GetImage(ChanID, pImage);

    return Ret;
}

SINT32 VFMW_UC_EXT_ReleaseImage(SINT32 ChanID, IMAGE *pImage)
{
    SINT32 Ret = VDEC_ERR;

    Ret = VFMW_UC_ReleaseImage(ChanID, pImage);

    return Ret;
}
