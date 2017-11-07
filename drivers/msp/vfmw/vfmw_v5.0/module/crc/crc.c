
#include "crc.h"
#include "public.h"
#include "vfmw_osal_ext.h"
#include "vfmw_linux_kernel_proc.h"
#include "vfmw_ctrl.h"


/*--------------------------------- MACRO ------------------------------------*/
#define MAX_FILE_PATH_LEN     (256)
#define MAX_GOLDEN_FRAME_NUM  (50*1024)	  // Max buffer golden frame num
#define MAX_LOG_LEN	      (5*1024*1024)
#define GOLDEN_TMP_SIZE	      (1024)
#define CRC_10BIT_EN	       10
#define CRC_2BIT_SIZE	       16	  //2 bit: Min num of bytes of per line


#define CRC_PROC_NAME	      "crc"
#define CRC_CMD_NUM	      (2)
#define CRC_CMD_LEN	      MAX_FILE_PATH_LEN

#define CRC_CMD_OFF	      "crc_off"
#define CRC_CMD_MANU_CHECK    "crc_manu"
#define CRC_CMD_AUTO_CHECK    "crc_auto"
#define CRC_CMD_GENERATE      "crc_gen"

#define CRC_OVERFLOW	      "\nLog Overflow!!!\n\n"

/*---------------------------- LOCAL DEFINITION ------------------------------*/
typedef enum
{
    CRC_EXT_2VIEW = 2,
    CRC_EXT_10BIT = 10,
    CRC_EXT_FLAG_BUTT,
} CRC_EXT_FLAG_E;

typedef enum
{
    CRC_IDLE_MODE = 0,		  //crc module not enable
    CRC_MANU_CHECK_MODE,	  //check crc without file record
    CRC_AUTO_CHECK_MODE,	  //check crc with file record
    CRC_GENERATE_MODE,		  //generate crc information
    CRC_MODE_BUTT,

} CRC_MODE_E;

typedef enum
{
    CRC_STATE_IDLE = 0,
    CRC_STATE_OPEN,
    CRC_STATE_BUTT,

} CRC_STATE_E;

typedef struct
{
    SINT32 FrameNum;
	UINT32 Frameoffset;
	UINT32 FrameSize;
	SINT32 FrameType;	      // frame coding type
	SINT32 TopFieldType;	      // top field coding type
	SINT32 BtmFieldType;	      // buttom field coding type
    UINT32 FrameStructure;	  // 0-frame ; 1-fieldpair
    UINT32 TopFieldCrc_8bit;
    UINT32 BtmFieldCrc_8bit;
    UINT32 TopFieldCrc_2bit;
    UINT32 BtmFieldCrc_2bit;
    UINT32 TopFieldCrc_8bit_1;
    UINT32 BtmFieldCrc_8bit_1;
    UINT32 NVOPFlag;
	UINT64 FramePts;

} CRC_FRAME_INFO_S;

typedef struct
{
    UINT32 GoldenFrameNum;
    UINT32 NvopFrameNum;
    UINT32 ErrorCountNum;
    UINT32 ErrorFrameNum_8bit;
    UINT32 ErrorFrameNum_2bit;
    UINT32 ErrorFrameNum_8bit_1;
    UINT64 FirstPtsOffset;
    OSAL_FILE *fpLogFile;
    OSAL_FILE *fpInGoldenFile;
	CRC_FRAME_INFO_S GoldenFrameInfo[MAX_GOLDEN_FRAME_NUM];

} CRC_CHECK_CTX_S;

typedef struct
{
    UINT32 OutGoldenFrameNum;
    OSAL_FILE *fpOutGoldenFile;

} CRC_GEN_CTX_S;

typedef struct
{
    UINT32 LogLen;
    UINT32 MaxLogLen;
    UINT8 *pLogBuffer;

} LOG_RECORD_S;

typedef struct
{
    SINT32 InstID;
    UINT32 ActualFrameNum;
    UINT32 BitDepth;
    UINT32 ViewNum;
    LOG_RECORD_S LogInfo;

    union
    {
	CRC_CHECK_CTX_S CheckMode;
	CRC_GEN_CTX_S	GenMode;
    }unCRC;

} CRC_INST_CTX_S;

typedef struct
{
    CRC_MODE_E WorkMode;
    CRC_STATE_E InstState;
    MEM_RECORD_S InstMem;
    UINT8 FilePath[MAX_FILE_PATH_LEN];
    CRC_INST_CTX_S *pInstCTX;

} CRC_INST_S;

typedef struct
{
    CRC_MODE_E WorkMode;
    UINT8 FilePath[MAX_FILE_PATH_LEN];

} CRC_CMD_S;

/*------------------------------INTERNAL VALUE--------------------------------*/
static VBOOL g_IsCrcInit = VDEC_FALSE;
static CRC_INST_S g_CrcInst[MAX_CHAN_NUM];
static CRC_CMD_S  g_CrcCmd;
static OSAL_SEMA  g_CrcSem;


/*----------------------------INTERNAL FUNCTION-------------------------------*/
static UINT8* CRC_ReadLine(UINT8 *pBuf, UINT32 BufLen, struct file *fpSrcFile)
{
    SINT32 Ret;
    SINT32 i = 0;
    mm_segment_t fs;

    fs = get_fs();
    set_fs(KERNEL_DS);

    Ret = vfs_read(fpSrcFile, pBuf, BufLen, &(fpSrcFile->f_pos));
    set_fs(fs);

    if (Ret <= 0)
    {
	return NULL;
    }

    while(pBuf[i++] != '\n' && i < Ret);

    if (i < Ret)
    {
	fpSrcFile->f_pos += i-Ret;
    }

    if (i < BufLen)
    {
	pBuf[i] = 0;
    }

    return pBuf;
}

static VOID CRC_HelpMessage(VOID)
{
    OSAL_FP_print("\n");
    OSAL_FP_print("------------------------- HELP INFO ---------------------------\n");
    OSAL_FP_print("you can run crc module with such commond:echo workmode filepath >/proc/vfmw/crc\n");
    OSAL_FP_print("\n");
    OSAL_FP_print("---------------------------------------------------------------\n");

    return;
}

static VOID CRC_ProcParseParam(UINT8 *pParam, UINT8 pCmd[CRC_CMD_NUM][CRC_CMD_LEN])
{
    UINT32 ParsePos = 0;
    UINT32 ParseNum = 0;
    UINT32 StrLen = 0;
    UINT8 *pCurStr = NULL;

    OSAL_FP_memset(pCmd, 0, CRC_CMD_NUM*CRC_CMD_LEN);
    do
    {
	StrLen = 0;
	pCurStr = pCmd[ParseNum];
	for (; ParsePos < OSAL_FP_strlen(pParam); ParsePos++)
	{
	    if (StrLen == 0 && pParam[ParsePos] == ' ')
	    {
		continue;
	    }
	    if (pParam[ParsePos] > ' ')
	    {
		pCurStr[StrLen++] = pParam[ParsePos];
	    }
	    if (StrLen > 0 && pParam[ParsePos] == ' ')
	    {
		break;
	    }
	}
	pCurStr[StrLen] = '\0';
	ParseNum++;

    }while (ParseNum < CRC_CMD_NUM);

    return;
}

static VOID CRC_ProcCommandHanlder(UINT8 pCmd[CRC_CMD_NUM][CRC_CMD_LEN])
{
    UINT32 CmdNum = 0;

    if (!OSAL_FP_strncmp(pCmd[CmdNum], CRC_CMD_OFF, CRC_CMD_LEN))
    {
	OSAL_FP_memset(&g_CrcCmd, 0, sizeof(g_CrcCmd));
	return;
    }

    //Parse WorkMode
    if (!OSAL_FP_strncmp(pCmd[CmdNum], CRC_CMD_MANU_CHECK, CRC_CMD_LEN))
    {
	g_CrcCmd.WorkMode = CRC_MANU_CHECK_MODE;
    }
    else if (!OSAL_FP_strncmp(pCmd[CmdNum], CRC_CMD_AUTO_CHECK, CRC_CMD_LEN))
    {
	g_CrcCmd.WorkMode = CRC_AUTO_CHECK_MODE;
    }
    else if (!OSAL_FP_strncmp(pCmd[CmdNum], CRC_CMD_GENERATE, CRC_CMD_LEN))
    {
	g_CrcCmd.WorkMode = CRC_GENERATE_MODE;
    }
    else
    {
	OSAL_FP_print("Unsupport work mode '%s'!\n", pCmd[CmdNum]);
	goto ERROR_EXIT;
    }
    CmdNum++;

    //Parse File Path
    if (pCmd[CmdNum] != NULL)
    {
	OSAL_FP_memcpy(g_CrcCmd.FilePath, pCmd[CmdNum], MAX_FILE_PATH_LEN);
	CmdNum++;
    }

    OSAL_FP_print("Enable CRC (work mode %d) with file %s\n", g_CrcCmd.WorkMode, g_CrcCmd.FilePath);

    return;

ERROR_EXIT:
    CRC_HelpMessage();

    return;
}

SINT32 CRC_Read_Proc(struct seq_file *p, VOID *v)
{
    UINT32 InstID;
    UINT32 InstNum = 0;
    CRC_INST_S *pInst = NULL;

    PROC_PRINT(p, "--------------------------- CRC INFO --------------------------\n");

    for (InstID = 0; InstID < MAX_CHAN_NUM; InstID++)
    {
	pInst = &g_CrcInst[InstID];
	if (pInst->WorkMode != CRC_IDLE_MODE)
	{
	    InstNum++;
	    PROC_PRINT(p, "  Inst: %-2d | State: %-2d | WokeMode: %-2d | FilePath: %-30s\n", InstID, pInst->InstState, g_CrcCmd.WorkMode, g_CrcCmd.FilePath);
	}
    }

    PROC_PRINT(p, "\n");
    PROC_PRINT(p, "  Total %d instance activated.\n", InstNum);
    PROC_PRINT(p, "  CRC command workmode : %d\n", g_CrcCmd.WorkMode);
    if (g_CrcCmd.WorkMode != CRC_IDLE_MODE)
    {
    PROC_PRINT(p, "  CRC command file path: %s\n", g_CrcCmd.FilePath);
    }
    PROC_PRINT(p, "\n");
    PROC_PRINT(p, "---------------------------------------------------------------\n");

    return VDEC_OK;
}

SINT32 CRC_Write_Proc(struct file *file, const char __user *buffer, size_t count, loff_t *data)
{
    UINT8 Param[CRC_CMD_LEN];
    UINT8 CmdStr[CRC_CMD_NUM][CRC_CMD_LEN];

    if (count < 1 || count >= sizeof(Param))
    {
	OSAL_FP_print("parameter string invalid!\n");

	return VDEC_ERR;
    }

    if (copy_from_user(Param, buffer, count))
    {
	OSAL_FP_print("copy_from_user failed!\n");

	return VDEC_ERR;
    }
    Param[count] = '\0';

    OSAL_FP_print("CMD: %s\n", Param);

    CRC_ProcParseParam(Param, CmdStr);

    CRC_ProcCommandHanlder(CmdStr);

    return count;
}

static VOID CRC_ResetGoldenInfo(CRC_FRAME_INFO_S *pGoldenInfo)
{
	UINT32 i;

	for (i = 0; i < MAX_GOLDEN_FRAME_NUM; i++)
	{
		OSAL_FP_memset(&(pGoldenInfo[i]), -1, sizeof(CRC_FRAME_INFO_S));
	}

    return;
}

static SINT32 CRC_FrameTypeChartoSINT32(UINT8 Type)
{
    SINT32 FrameType;

	if (Type == 'I')
	{
		FrameType = 0;
	}
	else if (Type == 'P')
	{
		FrameType = 1;
	}
	else if (Type == 'B')
	{
		FrameType = 2;
	}
	else
	{
		FrameType = -1;
	}

	return FrameType;
}

static SINT32 CRC_ReadGoldenInfo(CRC_CHECK_CTX_S *pModeCTX, UINT32 *pTotalLen)
{
    UINT32 i;
    SINT32 Ret = VDEC_OK;
    UINT32 TotalFrameNum = 0;
    UINT8 *pOutMem;
    UINT8 *pFrameInfo;
	UINT8  Type;
    UINT8  FieldType;
	UINT32 ExtFlag;
    MEM_RECORD_S ReadMem;

    *pTotalLen = 0;

    OSAL_FP_memset(&ReadMem, 0, sizeof(MEM_RECORD_S));

#ifdef HI_SMMU_SUPPORT
    ReadMem.eMode = MEM_MMU_MMU;
#else
    ReadMem.eMode = MEM_CMA_CMA;
#endif
    Ret = MEM_AllocMemBlock("CRC_Golden_Tmp", 0, GOLDEN_TMP_SIZE, &ReadMem, 1);
    if (Ret != MEM_MAN_OK)
    {
	OSAL_FP_print("Alloc golden tmp size %d failed!\n", GOLDEN_TMP_SIZE);

	return VDEC_ERR;
    }

    pOutMem = ReadMem.VirAddr;

    for (i = 0; i < MAX_GOLDEN_FRAME_NUM; i ++)
    {
	pOutMem = CRC_ReadLine(pOutMem, GOLDEN_TMP_SIZE, pModeCTX->fpInGoldenFile);
	if (pOutMem == NULL)
	{
	    break;
	}

	pFrameInfo = pOutMem;
	OSAL_FP_ssanf(pFrameInfo, "%d", &(pModeCTX->GoldenFrameInfo[i].FrameNum));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo, "%x", &(pModeCTX->GoldenFrameInfo[i].Frameoffset));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo, "%d", &(pModeCTX->GoldenFrameInfo[i].FrameSize));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%ld", (long *)&(pModeCTX->GoldenFrameInfo[i].FramePts));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%c", &Type);
	pModeCTX->GoldenFrameInfo[i].FrameType = CRC_FrameTypeChartoSINT32(Type);
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].FrameStructure));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%c", &FieldType);
	pModeCTX->GoldenFrameInfo[i].TopFieldType = CRC_FrameTypeChartoSINT32(FieldType);
	pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%c", &FieldType);
	pModeCTX->GoldenFrameInfo[i].BtmFieldType = CRC_FrameTypeChartoSINT32(FieldType);
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].TopFieldCrc_8bit));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].BtmFieldCrc_8bit));
	while(*pFrameInfo != ' ')pFrameInfo++;
	while(*pFrameInfo == ' ')pFrameInfo++;
	OSAL_FP_ssanf(pFrameInfo,"%d", &(pModeCTX->GoldenFrameInfo[i].NVOPFlag));

	if (pFrameInfo - pOutMem > OSAL_FP_strlen(pOutMem))
	{
	    OSAL_FP_print("ERROR: Frame %d UsedLen %d (pFrameInfo %p, pOutMem %p) > ActLen(pOutMem) %d\n", TotalFrameNum, pFrameInfo - pOutMem, pFrameInfo, pOutMem, OSAL_FP_strlen(pOutMem));
	    Ret = VDEC_ERR;
	    break;
	}

	if (OSAL_FP_strlen(pFrameInfo) > CRC_2BIT_SIZE)
	{
	    while(*pFrameInfo != ' ')pFrameInfo++;
	    while(*pFrameInfo == ' ')pFrameInfo++;
	    OSAL_FP_ssanf(pFrameInfo,"%d", &ExtFlag);
	    if (ExtFlag == CRC_EXT_10BIT)
	    {
		while(*pFrameInfo != ' ')pFrameInfo++;
		while(*pFrameInfo == ' ')pFrameInfo++;
		OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].TopFieldCrc_2bit));
		while(*pFrameInfo != ' ')pFrameInfo++;
		while(*pFrameInfo == ' ')pFrameInfo++;
		OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].BtmFieldCrc_2bit));
	    }
	    else if (ExtFlag == CRC_EXT_2VIEW)
	    {
		while(*pFrameInfo != ' ')pFrameInfo++;
		while(*pFrameInfo == ' ')pFrameInfo++;
		OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].TopFieldCrc_8bit_1));
		while(*pFrameInfo != ' ')pFrameInfo++;
		while(*pFrameInfo == ' ')pFrameInfo++;
		OSAL_FP_ssanf(pFrameInfo,"%x", &(pModeCTX->GoldenFrameInfo[i].BtmFieldCrc_8bit_1));
	    }
	}

	if (i == 0)
	{
	    pModeCTX->FirstPtsOffset = pModeCTX->GoldenFrameInfo[i].FramePts;
	}

	if (1 == pModeCTX->GoldenFrameInfo[i].NVOPFlag)
	{
	   pModeCTX->NvopFrameNum++;
	   pModeCTX->GoldenFrameInfo[i].FramePts = -1;
	}
	else
	{
	   pModeCTX->GoldenFrameInfo[i].FramePts -= pModeCTX->NvopFrameNum;
	   TotalFrameNum++;
	}
    }

    pModeCTX->GoldenFrameNum = TotalFrameNum - pModeCTX->FirstPtsOffset;

    MEM_ReleaseMemBlock(ReadMem.PhyAddr, ReadMem.VirAddr);

    return Ret;
}

static VOID CRC_DumpGoldenInfo(CRC_CHECK_CTX_S *pModeCTX)
{
    UINT32 i;
    CRC_FRAME_INFO_S *pFrameInfo = NULL;

    OSAL_FP_print("Golden frame info:\n");

    OSAL_FP_print("\n------------------------- GOLDEN INFO -------------------------\n\n");

    for (i=0; i<MAX_GOLDEN_FRAME_NUM; i++)
    {
	pFrameInfo = &(pModeCTX->GoldenFrameInfo[i]);
	if (pFrameInfo->FrameNum == -1)
	{
	    continue;
	}

	OSAL_FP_print("FrameNum = %d\n",  pFrameInfo->FrameNum);
	OSAL_FP_print("Frameoffset = %x\n",  pFrameInfo->Frameoffset);
	OSAL_FP_print("FrameSize = %d\n",  pFrameInfo->FrameSize);
	OSAL_FP_print("FramePts = %ld\n", pFrameInfo->FramePts);
	OSAL_FP_print("FrameType = %d\n",  pFrameInfo->FrameType);
	OSAL_FP_print("FrameStructure = %x\n",	pFrameInfo->FrameStructure);
	OSAL_FP_print("TopFieldType = %d\n",  pFrameInfo->TopFieldType);
	OSAL_FP_print("BtmFieldType = %d\n",  pFrameInfo->BtmFieldType);
	OSAL_FP_print("TopFieldCrc_8bit = %x\n",  pFrameInfo->TopFieldCrc_8bit);
	OSAL_FP_print("BtmFieldCrc_8bit = %x\n",  pFrameInfo->BtmFieldCrc_8bit);
	OSAL_FP_print("TopFieldCrc_2bit = %x\n",  pFrameInfo->TopFieldCrc_2bit);
	OSAL_FP_print("BtmFieldCrc_2bit = %x\n",  pFrameInfo->BtmFieldCrc_2bit);
	OSAL_FP_print("NVOPFlag = %d\n",  pFrameInfo->NVOPFlag);
	OSAL_FP_print("\n");
    }

    OSAL_FP_print("\n");
    OSAL_FP_print("NVOP Frame Num  : %d\n", pModeCTX->NvopFrameNum);
    OSAL_FP_print("Golden Frame Num: %d\n", pModeCTX->GoldenFrameNum);
    OSAL_FP_print("\n---------------------------------------------------------------\n");

    return;
}

static SINT32 CRC_PrepareGoldenInfo(CRC_CHECK_CTX_S *pModeCTX)
{
    SINT32 Ret;
    UINT32 TotalLen;

    CRC_ResetGoldenInfo(pModeCTX->GoldenFrameInfo);

    Ret = CRC_ReadGoldenInfo(pModeCTX, &TotalLen);
    if (Ret != VDEC_OK)
    {
	OSAL_FP_print("Read golden info failed, return: %d\n", Ret);
	CRC_DumpGoldenInfo(pModeCTX);
	return VDEC_ERR;
    }

    return VDEC_OK;
}

static VOID CRC_ShowToScreen(UINT8 *pErrlog)
{
    OSAL_FP_print("%s", pErrlog);

    return;
}

static VOID CRC_RecordToBuffer(CRC_INST_S *pInst, UINT8 *pErrlog)
{
    UINT8 ErrCase[256] = {0};
    UINT8 *pLogStart = NULL;
    UINT32 ReservedLogLen = sizeof(CRC_OVERFLOW);
    LOG_RECORD_S *pLogInfo = NULL;
    CRC_CHECK_CTX_S *pModeCTX = NULL;

    pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);
    pLogInfo = &(pInst->pInstCTX->LogInfo);

    if (pModeCTX->ErrorCountNum == 0)
    {
	pLogStart = pLogInfo->pLogBuffer + pLogInfo->LogLen;
	OSAL_FP_snprintf(ErrCase, sizeof(ErrCase), "\nError Case: %s\n", pInst->FilePath);
	OSAL_FP_memcpy(pLogStart, ErrCase, OSAL_FP_strlen(ErrCase));
	pLogInfo->LogLen += OSAL_FP_strlen(ErrCase);
    }
    pModeCTX->ErrorCountNum++;

    if (pLogInfo->LogLen >= (pLogInfo->MaxLogLen - ReservedLogLen))
    {
	pLogStart = pLogInfo->pLogBuffer + pLogInfo->LogLen;
	OSAL_FP_snprintf(ErrCase, sizeof(ErrCase), CRC_OVERFLOW);
	OSAL_FP_memcpy(pLogStart, ErrCase, OSAL_FP_strlen(ErrCase));
	pLogInfo->LogLen += OSAL_FP_strlen(ErrCase);
    }
    else
    {
	pLogStart = pLogInfo->pLogBuffer + pLogInfo->LogLen;
	OSAL_FP_memcpy(pLogStart, pErrlog, OSAL_FP_strlen(pErrlog));
	pLogInfo->LogLen += OSAL_FP_strlen(pErrlog);
    }

    return;
}

static VOID CRC_Record(CRC_INST_S *pInst, const UINT8 *Format, ...)
{
    va_list Args;
    SINT32 nTotalChar;
    UINT8 ErrLog[256];

    va_start(Args, Format);
    nTotalChar = vsnprintf(ErrLog, sizeof(ErrLog), Format, Args);
    va_end(Args);

    if ((nTotalChar <= 0) || (nTotalChar >= 256))
    {
	return;
    }

    CRC_ShowToScreen(ErrLog);

    if (pInst->WorkMode == CRC_AUTO_CHECK_MODE)
    {
	CRC_RecordToBuffer(pInst, ErrLog);
    }

    return;
}

static VOID CRC_DumpAndCloseLogFile(CRC_INST_S *pInst)
{
    CRC_CHECK_CTX_S *pModeCTX = NULL;
    SINT32 PassFrameNum, MissFrameNum;
    UINT32 PassRate_h, PassRate_l;
    UINT8  ResultLog_2bit[128];
    UINT8  ResultLog_8bit[128];
    UINT8  ResultLog_8bit_1[128];

    OSAL_FP_memset(ResultLog_2bit, 0, sizeof(ResultLog_2bit));
    OSAL_FP_memset(ResultLog_8bit, 0, sizeof(ResultLog_8bit));
    OSAL_FP_memset(ResultLog_8bit_1, 0, sizeof(ResultLog_8bit_1));
    pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);
    MissFrameNum = (pModeCTX->GoldenFrameNum >= pInst->pInstCTX->ActualFrameNum) ? pModeCTX->GoldenFrameNum-pInst->pInstCTX->ActualFrameNum : 0;


    if(pInst->pInstCTX->BitDepth == CRC_EXT_10BIT)
    {
	PassFrameNum = pModeCTX->GoldenFrameNum - pModeCTX->ErrorFrameNum_2bit- MissFrameNum;
	PassRate_h = PassFrameNum*100/pModeCTX->GoldenFrameNum;
	PassRate_l = PassFrameNum*10000/pModeCTX->GoldenFrameNum%100;

	OSAL_FP_snprintf(ResultLog_2bit, sizeof(ResultLog_2bit), "2bit	 PassRate	     : %d.%d%%\n2bit   Actual/Golden/Error : %d/%d/%d\n",\
			 PassRate_h, PassRate_l, pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum, pModeCTX->ErrorFrameNum_2bit);
	OSAL_FP_memcpy(ResultLog_2bit, ResultLog_2bit, OSAL_FP_strlen(ResultLog_2bit));
    }

    if(pInst->pInstCTX->ViewNum == CRC_EXT_2VIEW)
    {
	PassFrameNum = pModeCTX->GoldenFrameNum - pModeCTX->ErrorFrameNum_8bit_1 - MissFrameNum;
	PassRate_h = PassFrameNum*100/pModeCTX->GoldenFrameNum;
	PassRate_l = PassFrameNum*10000/pModeCTX->GoldenFrameNum%100;

	OSAL_FP_snprintf(ResultLog_8bit_1, sizeof(ResultLog_8bit_1), "8bit_1 PassRate		 : %d.%d%%\n8bit_1 Actual/Golden/Error : %d/%d/%d\n",\
			 PassRate_h, PassRate_l, pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum, pModeCTX->ErrorFrameNum_8bit_1);
	OSAL_FP_memcpy(ResultLog_8bit_1, ResultLog_8bit_1, OSAL_FP_strlen(ResultLog_8bit_1));
    }

    PassFrameNum = pModeCTX->GoldenFrameNum - pModeCTX->ErrorFrameNum_8bit- MissFrameNum;
    PassRate_h = PassFrameNum*100/pModeCTX->GoldenFrameNum;
    PassRate_l = PassFrameNum*10000/pModeCTX->GoldenFrameNum%100;

    OSAL_FP_snprintf(ResultLog_8bit, sizeof(ResultLog_8bit), "8bit   PassRate		 : %d.%d%%\n8bit   Actual/Golden/Error : %d/%d/%d\n",\
		     PassRate_h, PassRate_l, pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum, pModeCTX->ErrorFrameNum_8bit);
    OSAL_FP_memcpy(ResultLog_8bit, ResultLog_8bit, OSAL_FP_strlen(ResultLog_8bit));

    OSAL_FP_print("\n");
    if (pModeCTX->ErrorFrameNum_8bit == 0 && pModeCTX->ErrorFrameNum_2bit == 0 && pModeCTX->ErrorFrameNum_8bit_1 == 0)
    {
	OSAL_FP_print(" PassRate	    : %d.%d%% \n", PassRate_h, PassRate_l);
	OSAL_FP_print(" Actual/Golden/Error : %d/%d/%d\n", pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum, pModeCTX->ErrorFrameNum_8bit);
    }
    else
    {
	OSAL_FP_print("%s", ResultLog_2bit);
	OSAL_FP_print("%s", ResultLog_8bit);
	OSAL_FP_print("%s", ResultLog_8bit_1);
    }
    OSAL_FP_print("\n");

    if (pModeCTX->fpLogFile != NULL)
    {
	if(pInst->pInstCTX->LogInfo.pLogBuffer != NULL && pInst->pInstCTX->LogInfo.LogLen != 0)
	{
	    OSAL_FP_fwrite(pInst->pInstCTX->LogInfo.pLogBuffer, pInst->pInstCTX->LogInfo.LogLen, pModeCTX->fpLogFile);

	    OSAL_FP_fwrite(ResultLog_2bit, OSAL_FP_strlen(ResultLog_2bit), pModeCTX->fpLogFile);
	    OSAL_FP_fwrite(ResultLog_8bit, OSAL_FP_strlen(ResultLog_8bit), pModeCTX->fpLogFile);
	    OSAL_FP_fwrite(ResultLog_8bit_1, OSAL_FP_strlen(ResultLog_8bit_1), pModeCTX->fpLogFile);
	}

	OSAL_FP_fclose(pModeCTX->fpLogFile);
    }

    return;
}

static SINT32 CRC_InitCheckCTX(CRC_INST_S *pInst)
{
    SINT32 Ret;
    UINT8 NameStr[MAX_FILE_PATH_LEN + 10];

    CRC_CHECK_CTX_S *pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);

    OSAL_FP_snprintf(NameStr, sizeof(NameStr), "%s.gen.tidx", pInst->FilePath);
    pModeCTX->fpInGoldenFile = OSAL_FP_fopen(NameStr, VFMW_O_RDONLY, 0);
    if (pModeCTX->fpInGoldenFile == NULL)
    {
	OSAL_FP_snprintf(NameStr, sizeof(NameStr), "%s.tidx", pInst->FilePath);
	pModeCTX->fpInGoldenFile = OSAL_FP_fopen(NameStr, VFMW_O_RDONLY, 0);
	if (pModeCTX->fpInGoldenFile == NULL)
	{
	    OSAL_FP_print("Open file %s failed!\n", NameStr);
	    return VDEC_ERR;
	}
    }

    if (pInst->WorkMode == CRC_AUTO_CHECK_MODE)
    {
	OSAL_FP_snprintf(NameStr, sizeof(NameStr), "%s.text", "ErrorLog");
	pModeCTX->fpLogFile = OSAL_FP_fopen(NameStr, VFMW_O_WRONLY | VFMW_O_CREATE | VFMW_O_APPEND, 0);
	if (pModeCTX->fpLogFile == NULL)
	{
	    OSAL_FP_print("Open file %s failed!\n", NameStr);

	    return VDEC_ERR;
	}
    }

    Ret = CRC_PrepareGoldenInfo(pModeCTX);
    if (Ret != VDEC_OK)
    {
	CRC_Record(pInst, "Prepare file %s golden info failed!\n", pInst->FilePath);
	CRC_DumpAndCloseLogFile(pInst);
	OSAL_FP_fclose(pModeCTX->fpInGoldenFile);

	return VDEC_ERR;
    }

    return VDEC_OK;
}

static SINT32 CRC_ExitCheckCTX(CRC_INST_S *pInst)
{
    CRC_CHECK_CTX_S *pModeCTX = NULL;

    pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);
#if 0
    if (pInst->pInstCTX->ActualFrameNum > pModeCTX->GoldenFrameNum)
    {
	CRC_Record(pInst, "[Miss]: Actual: %d > Golden %d\n", pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum);
    }
#endif
    if (pInst->pInstCTX->ActualFrameNum < pModeCTX->GoldenFrameNum)
    {
	CRC_Record(pInst, "[Miss]: Actual: %d < Golden %d\n", pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum);
    }

    CRC_DumpAndCloseLogFile(pInst);

    OSAL_FP_fclose(pModeCTX->fpInGoldenFile);

    return VDEC_OK;
}

static SINT32 CRC_InitGenCTX(CRC_INST_S *pInst)
{
    UINT8 NameStr[MAX_FILE_PATH_LEN + 10];

    CRC_GEN_CTX_S *pGoldenCTX = &(pInst->pInstCTX->unCRC.GenMode);

    if (pInst->WorkMode == CRC_GENERATE_MODE)
    {
	OSAL_FP_snprintf(NameStr, sizeof(NameStr), "%s.gen.tidx", pInst->FilePath);
	pGoldenCTX->fpOutGoldenFile = OSAL_FP_fopen(NameStr, VFMW_O_WRONLY | VFMW_O_CREATE, 0);
	if (pGoldenCTX->fpOutGoldenFile == NULL)
	{
	    OSAL_FP_print("Open file %s failed!\n", NameStr);

	    return VDEC_ERR;
	}
	pGoldenCTX->OutGoldenFrameNum = 0;
    }

    return VDEC_OK;
}

static SINT32 CRC_ExitGenCTX(CRC_INST_S *pInst)
{
    CRC_GEN_CTX_S *pGoldenCTX = &(pInst->pInstCTX->unCRC.GenMode);

    if (pGoldenCTX->fpOutGoldenFile != NULL)
    {
	if(pInst->pInstCTX->LogInfo.pLogBuffer != NULL)
	{
	    OSAL_FP_fwrite(pInst->pInstCTX->LogInfo.pLogBuffer, pInst->pInstCTX->LogInfo.LogLen, pGoldenCTX->fpOutGoldenFile);
	}
	OSAL_FP_fclose(pGoldenCTX->fpOutGoldenFile);
    }

    return VDEC_OK;
}

static SINT32 CRC_InquireTheroCrc(UINT32 TargetFrame, CRC_CHECK_CTX_S *pModeCTX, UINT32 *pTheroCrc_8bit, UINT32 *pTheroCrc_2bit, UINT32 *pTheroCrc_8bit_1, UINT32 BitDepth, UINT32 ViewNum)
{
    UINT32 i;
    UINT32 LeadIgnor;
    UINT32 FixPts, Range;
    SINT32 Thero_pos = 0;

    if (TargetFrame >= MAX_GOLDEN_FRAME_NUM)
    {
	OSAL_FP_print("%s ERROR: TargetFrame %d >= MAX_GOLDEN_FRAME_NUM %d\n", __func__, TargetFrame, MAX_GOLDEN_FRAME_NUM);
	return VDEC_ERR;
    }

    Range = pModeCTX->GoldenFrameNum + pModeCTX->NvopFrameNum;
	LeadIgnor = pModeCTX->FirstPtsOffset;
    FixPts = TargetFrame + LeadIgnor;

    for (i = 0; i <= Range; i++)
    {
	Thero_pos = FixPts + i;
	if (Thero_pos < MAX_GOLDEN_FRAME_NUM)
	{
	    if (FixPts == (UINT32)pModeCTX->GoldenFrameInfo[Thero_pos].FramePts)
	    {
		if(BitDepth == 10)
		{
		    pTheroCrc_2bit[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_2bit;
		    pTheroCrc_2bit[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_2bit;
		}

		if (ViewNum == 2)
		{
		    pTheroCrc_8bit_1[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_8bit_1;
		    pTheroCrc_8bit_1[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_8bit_1;
		}

		pTheroCrc_8bit[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_8bit;
		pTheroCrc_8bit[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_8bit;

		return VDEC_OK;
	    }
	}

	Thero_pos = FixPts - i;
	if (Thero_pos >= 0)
	{
	    if (FixPts == (UINT32)pModeCTX->GoldenFrameInfo[Thero_pos].FramePts)
	    {
		if(BitDepth == 10)
		{
		    pTheroCrc_2bit[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_2bit;
		    pTheroCrc_2bit[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_2bit;
		}

		if (ViewNum == 2)
		{
		    pTheroCrc_8bit_1[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_8bit_1;
		    pTheroCrc_8bit_1[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_8bit_1;
		}

		pTheroCrc_8bit[0] = pModeCTX->GoldenFrameInfo[Thero_pos].TopFieldCrc_8bit;
		pTheroCrc_8bit[1] = pModeCTX->GoldenFrameInfo[Thero_pos].BtmFieldCrc_8bit;

		return VDEC_OK;
	    }
	}
    }

    return VDEC_ERR;
}

static SINT32 CRC_Inquire(CRC_INST_S *pInst, UINT32 *pTheroCrc_8bit, UINT32 *pTheroCrc_2bit, UINT32 *pTheroCrc_1_8bit)
{
    SINT32 Ret = VDEC_ERR;
    UINT32 BitDepth = pInst->pInstCTX->BitDepth;
    UINT32 ViewNum = pInst->pInstCTX->ViewNum;
    UINT32 TargetFrame = pInst->pInstCTX->ActualFrameNum;
    CRC_CHECK_CTX_S *pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);

    Ret = CRC_InquireTheroCrc(TargetFrame, pModeCTX, pTheroCrc_8bit, pTheroCrc_2bit, pTheroCrc_1_8bit, BitDepth, ViewNum);
    if (Ret != VDEC_OK)
    {
	OSAL_FP_print("Inquire TargetFrame %d TheroCrc failed!\n", TargetFrame);
	return VDEC_ERR;
    }

    return VDEC_OK;
}

static SINT32 CRC_Compare(SINT32 *pTheroCrc, SINT32 *pActulCrc, SINT32 Format)
{
    SINT32 Ret = VDEC_ERR;

    if (Format == 3) // top and bottom
    {
	if ((pTheroCrc[0] == pActulCrc[0]) && (pTheroCrc[1] == pActulCrc[1]))
	{
	    Ret = VDEC_OK;
	}
    }
    else if (Format == 2) // bottom field only
    {
	if ((pTheroCrc[1] == pActulCrc[1]))
	{
	    Ret = VDEC_OK;
	}
    }
    else if (Format == 1) // top field only
    {
	if ((pTheroCrc[0] == pActulCrc[0]))
	{
	    Ret = VDEC_OK;
	}
    }
    else
    {
	OSAL_FP_print("CompareCrc: Format %d invalid!\n", Format);
    }

    return Ret;

}

static SINT32 CRC_GenGoldenCrc(CRC_INST_S *pInst, IMAGE *pImage)
{
    UINT8 TidxInfo[256];
    UINT32 UsedLen;
    UINT8 *pGoldenFrame = NULL;
    UINT32 *ActulCrc_8bit = NULL;
    UINT32 *ActulCrc_2bit = NULL;
    UINT32 *ActulCrc_8bit_1 = NULL;
    CRC_GEN_CTX_S *pModeCTX = NULL;
    LOG_RECORD_S *pGoldenFrameInfo = NULL;
    UINT32 ReservedLogLen = sizeof(CRC_OVERFLOW);

    pModeCTX = &(pInst->pInstCTX->unCRC.GenMode);
    pGoldenFrameInfo = &(pInst->pInstCTX->LogInfo);

    if (pModeCTX->fpOutGoldenFile == NULL)
    {
	return VDEC_ERR;
    }

    ActulCrc_8bit = pImage->stCRCInfo.ActualCRC_8bit;
    ActulCrc_2bit = pImage->stCRCInfo.ActualCRC_2bit;
    ActulCrc_8bit_1 = pImage->stCRCInfo.ActualCRC_8bit_1;

    OSAL_FP_memset(TidxInfo, 0, sizeof(TidxInfo));

    if (pGoldenFrameInfo->LogLen >= (pGoldenFrameInfo->MaxLogLen - ReservedLogLen))
    {
	pGoldenFrame = pGoldenFrameInfo->pLogBuffer + pGoldenFrameInfo->LogLen;
	OSAL_FP_snprintf(TidxInfo, sizeof(TidxInfo), CRC_OVERFLOW);
	OSAL_FP_memcpy(pGoldenFrame, TidxInfo, OSAL_FP_strlen(TidxInfo));
	pGoldenFrameInfo->LogLen += OSAL_FP_strlen(TidxInfo);
    }
    else
    {
	pGoldenFrame = pGoldenFrameInfo->pLogBuffer + pGoldenFrameInfo->LogLen;

	OSAL_FP_snprintf(TidxInfo, sizeof(TidxInfo), "%-4d %-4d %-4d %-4d %-4d %-4d %-4d %-8x %-8x %-4d ",
	     pModeCTX->OutGoldenFrameNum, 0, 0, pModeCTX->OutGoldenFrameNum, 0, 0, 0, ActulCrc_8bit[0], ActulCrc_8bit[1], 0);
	UsedLen = OSAL_FP_strlen(TidxInfo);

	if (pInst->pInstCTX->BitDepth == CRC_EXT_10BIT)
	{
	    OSAL_FP_snprintf(TidxInfo+UsedLen, sizeof(TidxInfo)-UsedLen,  "%-4d %-8x %-8x ", 10, ActulCrc_2bit[0], ActulCrc_2bit[1]);
	    UsedLen = OSAL_FP_strlen(TidxInfo);
	}

	if (pInst->pInstCTX->ViewNum == CRC_EXT_2VIEW)
	{
	    OSAL_FP_snprintf(TidxInfo+UsedLen, sizeof(TidxInfo)-UsedLen,  "%-4d %-8x %-8x ", 2, ActulCrc_8bit_1[0], ActulCrc_8bit_1[1]);
	    UsedLen = OSAL_FP_strlen(TidxInfo);
	}

	OSAL_FP_snprintf(TidxInfo+UsedLen, sizeof(TidxInfo)-UsedLen,  "\n");

	OSAL_FP_memcpy(pGoldenFrame, TidxInfo, OSAL_FP_strlen(TidxInfo));
	pGoldenFrameInfo->LogLen += OSAL_FP_strlen(TidxInfo);
    }

    OSAL_FP_print("Generating golden crc info: frame %-5d\n", pModeCTX->OutGoldenFrameNum);

    pModeCTX->OutGoldenFrameNum++;

    return VDEC_OK;
}

static SINT32 CRC_CheckImageCrc(CRC_INST_S *pInst, IMAGE *pImage)
{
    SINT32 Ret;
    SINT32 Ret_2bit = VDEC_OK;
    SINT32 Ret_8bit = VDEC_OK;
    SINT32 Ret_8bit_1 = VDEC_OK;
    UINT32 CrcFormat;
    UINT32 TheroCrc_8bit[2];
    UINT32 TheroCrc_8bit_1[2];
    UINT32 TheroCrc_2bit[2];
    UINT32 *ActulCrc_8bit = NULL;
    UINT32 *ActulCrc_2bit = NULL;
    UINT32 *ActulCrc_8bit_1 = NULL;
    CRC_CHECK_CTX_S *pModeCTX = NULL;

    CrcFormat = pImage->format.field_valid_flag;
    ActulCrc_8bit = pImage->stCRCInfo.ActualCRC_8bit;
    ActulCrc_2bit = pImage->stCRCInfo.ActualCRC_2bit;
    ActulCrc_8bit_1 = pImage->stCRCInfo.ActualCRC_8bit_1;

    pModeCTX = &(pInst->pInstCTX->unCRC.CheckMode);
    if (pInst->pInstCTX->ActualFrameNum > pModeCTX->GoldenFrameNum)
    {
	OSAL_FP_print("[Wrong]: ActualFrameNum %d more than GoldenFrameNum %d!\n", pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum);
	return VDEC_ERR;
    }

    Ret = CRC_Inquire(pInst, TheroCrc_8bit, TheroCrc_2bit, TheroCrc_8bit_1);
    if (Ret != VDEC_OK)
    {
	return VDEC_ERR;
    }

    Ret_8bit = CRC_Compare(TheroCrc_8bit, ActulCrc_8bit, CrcFormat);
    if (Ret_8bit != VDEC_OK)
    {
	pModeCTX->ErrorFrameNum_8bit++;
	CRC_Record(pInst, "[Wrong]: No.%d/%d, ViewID = %d, Format = %d, 8bit Error(A:%9x,%9x | T:%9x,%9x)\n",\
	    pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum-1, pImage->view_id, CrcFormat, ActulCrc_8bit[0], ActulCrc_8bit[1], TheroCrc_8bit[0], TheroCrc_8bit[1]);
    }

    if(pInst->pInstCTX->BitDepth == CRC_EXT_10BIT)
    {
	Ret_2bit = CRC_Compare(TheroCrc_2bit, ActulCrc_2bit, CrcFormat);
	if (Ret_2bit != VDEC_OK)
	{
	    pModeCTX->ErrorFrameNum_2bit++;

	    CRC_Record(pInst, "[Wrong]: No.%d/%d, ViewID = %d, Format = %d, 2bit Error(A:%9x,%9x | T:%9x,%9x)\n",
		pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum-1, pImage->view_id, CrcFormat, ActulCrc_2bit[0], ActulCrc_2bit[1], TheroCrc_2bit[0], TheroCrc_2bit[1]);
	}
    }

    if(pInst->pInstCTX->ViewNum == CRC_EXT_2VIEW)
    {
	Ret_8bit_1 = CRC_Compare(TheroCrc_8bit_1, ActulCrc_8bit_1, CrcFormat);
	if (Ret_8bit_1 != VDEC_OK)
	{
	    pModeCTX->ErrorFrameNum_8bit_1++;

	    CRC_Record(pInst, "[Wrong]: No.%d/%d, ViewID = %d, Format = %d, 8bit_1 Error(A:%9x,%9x | T:%9x,%9x)\n",
		pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum-1, pImage->view_id, CrcFormat, ActulCrc_8bit_1[0], ActulCrc_8bit_1[1], TheroCrc_8bit_1[0], TheroCrc_8bit_1[1]);
	}
    }

    if (Ret_8bit != VDEC_OK || Ret_2bit != VDEC_OK || Ret_8bit_1 != VDEC_OK)
    {
	return VDEC_ERR;
    }
    else
    {
	OSAL_FP_print("[OK]: No.%d/%d\n", pInst->pInstCTX->ActualFrameNum, pModeCTX->GoldenFrameNum-1);

	return VDEC_OK;
    }
}


/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VOID CRC_Init(VOID)
{
    SINT32 Ret;

    if(g_IsCrcInit == VDEC_TRUE)
    {
	return;
    }

    OSAL_FP_memset(g_CrcInst, 0, MAX_CHAN_NUM*sizeof(CRC_INST_S));
    OSAL_FP_memset(&g_CrcCmd, 0, sizeof(CRC_CMD_S));

    Ret = OSAL_FP_proc_create(CRC_PROC_NAME, CRC_Read_Proc, CRC_Write_Proc);
    if (Ret != VDEC_OK)
    {
	OSAL_FP_print("%s create proc %s failed!\n", __func__, CRC_PROC_NAME);
	return;
    }

    Sema_Init_with_Option(&g_CrcSem);

    g_IsCrcInit = VDEC_TRUE;

    return;
}

VOID CRC_Exit(VOID)
{
    OSAL_FP_proc_destroy(CRC_PROC_NAME);

    g_IsCrcInit = VDEC_FALSE;

    return;
}

SINT32 CRC_CreateInst(SINT32 InstID)
{
    SINT32 Ret;
    UINT8 NameStr[20];
    CRC_INST_S *pInst = NULL;
    CRC_INST_CTX_S *pInstCTX = NULL;

    VFMW_ASSERT_RETURN(g_IsCrcInit == VDEC_TRUE, VDEC_ERR);
    VFMW_ASSERT_RETURN(InstID >= 0 && InstID < MAX_CHAN_NUM, VDEC_ERR);

    Down_Interruptible_with_Option(&g_CrcSem);

    pInst = &g_CrcInst[InstID];
    pInst->WorkMode = g_CrcCmd.WorkMode;
    OSAL_FP_memcpy(pInst->FilePath, g_CrcCmd.FilePath, MAX_FILE_PATH_LEN);

    if (pInst->WorkMode == CRC_IDLE_MODE)
    {
	Ret = VDEC_OK;
	goto EXIT;
    }

    if (pInst->InstState != CRC_STATE_IDLE)
    {
	OSAL_FP_print("Create inst %d failed for invalid state %d!\n", InstID, pInst->InstState);
	Ret = VDEC_ERR;
	goto EXIT;
    }

    OSAL_FP_snprintf(NameStr, sizeof(NameStr), "CRC_INST_%d", InstID);
#ifdef HI_SMMU_SUPPORT
    pInst->InstMem.eMode = MEM_MMU_MMU;
#else
    pInst->InstMem.eMode = MEM_CMA_CMA;
#endif
    Ret = MEM_AllocMemBlock(NameStr, 0, sizeof(CRC_INST_CTX_S) + MAX_LOG_LEN, &pInst->InstMem, 1);
    if (Ret != MEM_MAN_OK)
    {
	OSAL_FP_print("Inst %d alloc context(%d) failed!\n", InstID, sizeof(CRC_INST_CTX_S));
	Ret = VDEC_ERR;
	goto EXIT;
    }

    pInst->pInstCTX = (CRC_INST_CTX_S *)pInst->InstMem.VirAddr;
    pInstCTX = pInst->pInstCTX;
    OSAL_FP_memset(pInstCTX, 0, sizeof(CRC_INST_CTX_S));

    pInstCTX->InstID = InstID;
    pInstCTX->LogInfo.pLogBuffer = (pInst->InstMem.VirAddr + sizeof(CRC_INST_CTX_S));
    pInstCTX->LogInfo.MaxLogLen = MAX_LOG_LEN;
    pInstCTX->LogInfo.LogLen = 0;

    if (pInst->WorkMode == CRC_MANU_CHECK_MODE || pInst->WorkMode == CRC_AUTO_CHECK_MODE)
    {
	Ret = CRC_InitCheckCTX(pInst);
    }
    else if (pInst->WorkMode == CRC_GENERATE_MODE)
    {
	Ret = CRC_InitGenCTX(pInst);
    }
    else
    {
	OSAL_FP_print("%s inst %d not suppose to be here with work mode %d!\n", __func__, InstID, pInst->WorkMode);
	Ret = VDEC_ERR;
    }

    if (Ret == VDEC_OK)
    {
	pInst->InstState = CRC_STATE_OPEN;
    }
    else
    {
	MEM_ReleaseMemBlock(pInst->InstMem.PhyAddr, pInst->InstMem.VirAddr);
	OSAL_FP_memset(pInst, 0, sizeof(CRC_INST_S));
    }

EXIT:
    Up_Interruptible_with_Option(&g_CrcSem);

    return Ret;
}

SINT32 CRC_DestroyInst(SINT32 InstID)
{
    SINT32 Ret;
    CRC_INST_S *pInst = NULL;

    VFMW_ASSERT_RETURN(g_IsCrcInit == VDEC_TRUE, VDEC_ERR);
    VFMW_ASSERT_RETURN(InstID >= 0 && InstID < MAX_CHAN_NUM, VDEC_ERR);

    Down_Interruptible_with_Option(&g_CrcSem);

    pInst = &g_CrcInst[InstID];

    if (pInst->WorkMode == CRC_IDLE_MODE)
    {
	Ret = VDEC_OK;
	goto EXIT;
    }

    if (pInst->InstState == CRC_STATE_IDLE)
    {
	Ret = VDEC_OK;
	OSAL_FP_print("%s inst %d already destroyed.\n", __func__, InstID);
	goto EXIT;
    }

    if (pInst->WorkMode == CRC_MANU_CHECK_MODE || pInst->WorkMode == CRC_AUTO_CHECK_MODE)
    {
	Ret = CRC_ExitCheckCTX(pInst);
    }
    else if (pInst->WorkMode == CRC_GENERATE_MODE)
    {
	Ret = CRC_ExitGenCTX(pInst);
    }
    else
    {
	OSAL_FP_print("%s inst %d not suppose to be here with work mode %d!\n", __func__, InstID, pInst->WorkMode);
	Ret = VDEC_ERR;
    }

    if (pInst->InstMem.PhyAddr != 0 && pInst->InstMem.VirAddr != NULL)
    {
	MEM_ReleaseMemBlock(pInst->InstMem.PhyAddr, pInst->InstMem.VirAddr);
    }
    else
    {
	OSAL_FP_print("%s inst %d mem phy 0x%x/vir %p invalid!\n", __func__, pInst->InstMem.PhyAddr, pInst->InstMem.VirAddr);
	Ret = VDEC_ERR;
    }

    OSAL_FP_memset(pInst, 0, sizeof(CRC_INST_S));

EXIT:
    g_CrcCmd.WorkMode = CRC_IDLE_MODE;

    Up_Interruptible_with_Option(&g_CrcSem);

    return Ret;
}

SINT32 CRC_SetConfig(SINT32 InstID, VDEC_CHAN_CFG_S *pstCfg)
{
    CRC_INST_S *pInst = NULL;

    VFMW_ASSERT_RETURN(g_IsCrcInit == VDEC_TRUE, VDEC_ERR);
    VFMW_ASSERT_RETURN(InstID >= 0 && InstID < MAX_CHAN_NUM, VDEC_ERR);
    VFMW_ASSERT_RETURN(pstCfg != NULL, VDEC_ERR);

    pInst = &g_CrcInst[InstID];

    if (pInst->WorkMode != CRC_IDLE_MODE)
    {
	pstCfg->s32CrcMode = pInst->WorkMode;
	pstCfg->s32VcmpEn  = 2;	 // force not compress
    }

    return VDEC_OK;
}

SINT32 CRC_PutImage(SINT32 InstID, IMAGE *pImage)
{
    SINT32 Ret;
    CRC_INST_S *pInst = NULL;

    VFMW_ASSERT_RETURN(g_IsCrcInit == VDEC_TRUE, VDEC_ERR);
    VFMW_ASSERT_RETURN(InstID >= 0 && InstID < MAX_CHAN_NUM, VDEC_ERR);
    VFMW_ASSERT_RETURN(pImage != NULL, VDEC_ERR);

    pInst = &g_CrcInst[InstID];
    if (pInst->WorkMode == CRC_IDLE_MODE)
    {
	return VDEC_OK;
    }

    if (pInst->InstState == CRC_STATE_IDLE)
    {
	OSAL_FP_print("%s inst %d should not in idle state.\n", __func__, InstID, pInst->InstState);
	return VDEC_ERR;
    }

    pInst->pInstCTX->BitDepth = pImage->bit_depth_luma;
    pInst->pInstCTX->ViewNum = (pImage->is_3D == 1) ? 2 : 1;

    if (pInst->WorkMode == CRC_GENERATE_MODE)
    {
	Ret = CRC_GenGoldenCrc(pInst, pImage);
    }
    else
    {
	Ret = CRC_CheckImageCrc(pInst, pImage);
    }

    pInst->pInstCTX->ActualFrameNum++;

    return Ret;
}
