/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#include <linux/string.h>
#include <linux/delay.h>
#include <asm/uaccess.h>
#include <asm/io.h>

/* Drv headers */
#include "drv_adsp_private.h"
#include "drv_adsp_ext.h"
#include "hi_audsp_common.h"
#include "hi_audsp_aoe.h"

#include "drv_adsp_hal.h"

static HI_VOID* g_pAoeRegAddr = HI_NULL;

static const HI_U32 ADSP_AOE_RateProc(HI_U32 u32Rate)
{
    HI_U32 g_u32RateTab[] =
    {
	8000,
	11025,
	12000,
	16000,
	22050,
	24000,
	32000,
	44100,
	48000,
	88200,
	96000,
	176400,
	192000,
    };

    if (u32Rate < sizeof(g_u32RateTab) / sizeof(g_u32RateTab[0]))
    {
	return g_u32RateTab[u32Rate];
    }

    return g_u32RateTab[0];
}

static const HI_U32 ADSP_AOE_ChProc(HI_U32 ch)
{
    switch (ch)
    {
	case 0x00:
	    return 1;
	case 0x01:
	    return 2;
	case 0x03:
	    return 8;
	default:
	    return 0;
    }
}

static const HI_U32 ADSP_AOE_WidthProc(HI_U32 width)
{
    switch (width)
    {
	case 0x00:
	    return 8;
	case 0x01:
	    return 16;
	case 0x02:
	    return 24;
	default:
	    return 0;
    }
}

static const HI_CHAR*	ADSP_AOE_StatusName(HI_U32 u32Cmd, HI_U32 u32Done)
{
    const HI_CHAR* apcName[4] =
    {
	"start",
	"stop",
	"pause",
	"flush",
    };

    if (u32Done == 0 || u32Cmd >= 4)
    {
	return "invalid";
    }

    return apcName[u32Cmd];
}

static const HI_U32 ADSP_BufUsedSizeProc(HI_U32 u32Size, HI_U32 u32ReadPtr, HI_U32 u32WritePtr)
{
    if (u32ReadPtr <= u32WritePtr)
    {
	return u32WritePtr - u32ReadPtr;
    }
    else
    {
	return u32Size - (u32ReadPtr - u32WritePtr);
    }
}

static const HI_U32 ADSP_BufUsedPercProc(HI_U32 u32Size, HI_U32 u32UsedSize)
{
    if (0 == u32Size)
    {
	return 0;
    }
    else
    {
	return u32UsedSize * 100 / u32Size;
    }
}

static const HI_U32 ADSP_BufLatencyMsProc(HI_U32 u32UsedSize, HI_U32 u32FrameSize, HI_U32 u32Rate)
{
    if (0 == u32FrameSize || 0 == u32Rate)
    {
	return 0;
    }
    else
    {
	return (u32UsedSize / u32FrameSize) * 1000 / u32Rate;
    }
}

static const HI_U32 ADSP_FrameSizeProc(HI_U32 u32BitWidth, HI_U32 u32Channel)
{
    if (16 == u32BitWidth)
    {
	return u32Channel * sizeof(HI_S16);
    }
    else
    {
	return u32Channel * sizeof(HI_S32);
    }
}

static HI_U32 ADSP_GetAefInBufDelayMs(S_MIXER_REGS_TYPE* pEneReg)
{
    HI_U32 u32SampleRate = 0;
    HI_U32 u32FrmLatency = 0;
    HI_U32 u32WriteWrap	 = pEneReg->ENGINE_AEF_INBUF_WRITEIDX.bits.periond_write_wrap;
    HI_U32 u32WriteIdx	 = pEneReg->ENGINE_AEF_INBUF_WRITEIDX.bits.periond_write_idx;
    HI_U32 u32ReadWrap	 = pEneReg->ENGINE_AEF_INBUF_READIDX.bits.periond_read_wrap;
    HI_U32 u32ReadIdx	 = pEneReg->ENGINE_AEF_INBUF_READIDX.bits.periond_read_idx;

    u32FrmLatency = ((u32WriteWrap == u32ReadWrap) ? (u32WriteIdx - u32ReadIdx) : (AOE_AEF_PERIODBUF_NUM - u32ReadIdx + u32WriteIdx));
    u32SampleRate = ADSP_AOE_RateProc(pEneReg->ENGINE_ATTR.bits.fs);

    return (u32FrmLatency * AOE_ENGINE_PROC_SAMPLES * 1000 / u32SampleRate);
}

static HI_U32 ADSP_GetAefOutBufDelayMs(S_MIXER_REGS_TYPE* pEneReg)
{
    HI_U32 u32SampleRate = 0;
    HI_U32 u32FrmLatency = 0;
    HI_U32 u32WriteWrap	 = pEneReg->ENGINE_AEF_OUTBUF_WRITEIDX.bits.periond_write_wrap;
    HI_U32 u32WriteIdx	 = pEneReg->ENGINE_AEF_OUTBUF_WRITEIDX.bits.periond_write_idx;
    HI_U32 u32ReadWrap	 = pEneReg->ENGINE_AEF_OUTBUF_READIDX.bits.periond_read_wrap;
    HI_U32 u32ReadIdx	 = pEneReg->ENGINE_AEF_OUTBUF_READIDX.bits.periond_read_idx;

    u32FrmLatency = ((u32WriteWrap == u32ReadWrap) ? (u32WriteIdx - u32ReadIdx) : (AOE_AEF_PERIODBUF_NUM - u32ReadIdx + u32WriteIdx));
    u32SampleRate = ADSP_AOE_RateProc(pEneReg->ENGINE_ATTR.bits.fs);

    return (u32FrmLatency * AOE_ENGINE_PROC_SAMPLES * 1000 / u32SampleRate);
}

static HI_VOID ADSP_AOE_Proc(struct seq_file* p, HI_VOID* v)
{
    HI_U32 i;
    HI_U32 j = 0;
    S_AOE_REGS_TYPE*   pComReg;
    S_MIXER_REGS_TYPE* pEneReg;
    S_AIP_REGS_TYPE*   pAipReg;
    S_AOP_REGS_TYPE*   pAopReg;
    HI_VOID* pRptr = HI_NULL;
    HI_VOID* pWptr = HI_NULL;
    HI_VOID* pTmpAddr  = HI_NULL;
    HI_U32 u32UsedSize = 0, u32FrameSize = 0, u32AipId = AOE_MAX_AIP_NUM, u32AopId = 0;

    S_CAST_REGS_TYPE*	pCastReg;
    HI_U32 tmp = 0;

    HI_U32   u32DupAopId = AOE_MAX_AOP_NUM;

    PROC_PRINT( p, "\n---------------------------------	 AOE Status  -------------------------------------------\n");

    pComReg =  (S_AOE_REGS_TYPE*)g_pAoeRegAddr;
    PROC_PRINT( p,
		"CommonStatus	:ExecuteTimeOutCnt(%d), ScheduleTimeOutCnt(%d)\n",
		pComReg->AOE_STATUS1.bits.excute_timeout_cnt, pComReg->AOE_STATUS1.bits.schedule_timeout_cnt);

    for (i = 0; i < AOE_MAX_ENGINE_NUM; i++)
    {
	pEneReg = (S_MIXER_REGS_TYPE*)(g_pAoeRegAddr + AOE_ENGINE_REG_OFFSET + i * sizeof(S_MIXER_REGS_TYPE));
	if ((pEneReg->ENGINE_CTRL.bits.cmd == 0 || pEneReg->ENGINE_CTRL.bits.cmd == 2) //when start or pause, proc
	    && pEneReg->ENGINE_CTRL.bits.cmd_done == 1)
	{
	    PROC_PRINT( p,
			"ENGINE(%d)   :Status(%s), Format(%s), Rate(%d), Ch(%d), Width(%d), AefMask(0x%x)",
			i,
			ADSP_AOE_StatusName(pEneReg->ENGINE_CTRL.bits.cmd, pEneReg->ENGINE_CTRL.bits.cmd_done),
			pEneReg->ENGINE_ATTR.bits.format == 0 ? "pcm" : "iec61937",
			ADSP_AOE_RateProc(pEneReg->ENGINE_ATTR.bits.fs),
			ADSP_AOE_ChProc(pEneReg->ENGINE_ATTR.bits.ch),
			ADSP_AOE_WidthProc(pEneReg->ENGINE_ATTR.bits.precision),
			pEneReg->ENGINE_ATT_AEF.bits.aef_att_ena);

	    if (pEneReg->ENGINE_ATT_AEF.bits.aef_att_ena & 0xf0)
	    {
		PROC_PRINT( p, ", FifoDelayNum(%d)\n", pEneReg->ENGINE_ATTR.bits.aef_delay);
	    }
	    else
	    {
		PROC_PRINT( p, "\n");
	    }

	    if (pEneReg->ENGINE_ATT_AEF.bits.aef_att_ena & 0xf0)
	    {
		ADSP_ReadAddr(pEneReg->ENGINE_AEF_INBUF_ADDR, pTmpAddr);
		PROC_PRINT( p,
			    "		 :AefInbufAddr(0x%p), AefInbufPeriodSize(0x%x), AefInbufPeriodNum(0x%x), AefInbufRidx/Widx/Latency(0x%x(%d)/0x%x(%d)/%dms)\n",
			    pTmpAddr,
			    pEneReg->ENGINE_AEF_INBUF_SIZE.bits.periond_size,
			    pEneReg->ENGINE_AEF_INBUF_SIZE.bits.periond_num,
			    pEneReg->ENGINE_AEF_INBUF_READIDX.bits.periond_read_idx,
			    pEneReg->ENGINE_AEF_INBUF_READIDX.bits.periond_read_wrap,
			    pEneReg->ENGINE_AEF_INBUF_WRITEIDX.bits.periond_write_idx,
			    pEneReg->ENGINE_AEF_INBUF_WRITEIDX.bits.periond_write_wrap,
			    ADSP_GetAefInBufDelayMs(pEneReg));

		ADSP_ReadAddr(pEneReg->ENGINE_AEF_OUTBUF_ADDR, pTmpAddr);
		PROC_PRINT( p,
			    "		 :AefOutbufAddr(0x%p), AefOutbufPeriodSize(0x%x), AefOutbufPeriodNum(0x%x), AefOutbufRidx/Widx/Latency(0x%x(%d)/0x%x(%d)/%dms)\n",
			    pTmpAddr,
			    pEneReg->ENGINE_AEF_OUTBUF_SIZE.bits.periond_size,
			    pEneReg->ENGINE_AEF_OUTBUF_SIZE.bits.periond_num,
			    pEneReg->ENGINE_AEF_OUTBUF_READIDX.bits.periond_read_idx,
			    pEneReg->ENGINE_AEF_OUTBUF_READIDX.bits.periond_read_wrap,
			    pEneReg->ENGINE_AEF_OUTBUF_WRITEIDX.bits.periond_write_idx,
			    pEneReg->ENGINE_AEF_OUTBUF_WRITEIDX.bits.periond_write_wrap,
			    ADSP_GetAefOutBufDelayMs(pEneReg));
	    }

	    u32DupAopId = AOE_MAX_AOP_NUM;
	    for (j = 0; j < AOE_MAX_AIP_NUM; j++)
	    {
		if ((pEneReg->ENGINE_MIX_SRC.bits.aip_fifo_ena) & (1L << j))
		{
		    pAipReg = (S_AIP_REGS_TYPE*)(g_pAoeRegAddr + AOE_AIP_REG_OFFSET + j * sizeof(S_AIP_REGS_TYPE));
		    PROC_PRINT( p,
				"Aip(%d)      :Status(%s), Mute(%s), Vol(%ddB/%ddB), Prescale(%s%d.%ddB), ChMode(%d), SpeedAdjCnt(%d)\n",
				j,
				ADSP_AOE_StatusName(pAipReg->AIP_CTRL.bits.cmd, pAipReg->AIP_CTRL.bits.cmd_done),
				(0 == pAipReg->AIP_EXT_CTRL.bits.mute) ? "Off" : "On",
				(HI_S32)(pAipReg->AIP_EXT_CTRL.bits.volume_l) - 0x79,
				(HI_S32)(pAipReg->AIP_EXT_CTRL.bits.volume_r) - 0x79,
				(0x79 == pAipReg->AIP_EXT2_CTRL.bits.prescale_int && 1 == pAipReg->AIP_EXT2_CTRL.bits.prescale_dec_dir) ? "-" : "",
				(HI_S32)(pAipReg->AIP_EXT2_CTRL.bits.prescale_int) - 0x79,
				pAipReg->AIP_EXT2_CTRL.bits.prescale_dec * 125,
				pAipReg->AIP_EXT_CTRL.bits.channel_mode,
				pAipReg->AIP_FSADJ_CNT);

		    if (pAipReg->AIP_FIFO_ATTR.bits.fifo_bypass == 1)
		    {
			u32AipId = j;
		    }

		    if (1 == pAipReg->AIP_BUF_SIZE.bits.buff_flag)
		    {
			ADSP_ReadAddr(pAipReg->AIP_BUF_WPTR, pRptr);
			ADSP_ReadAddr(pAipReg->AIP_BUF_RPTR, pWptr);
		    }
		    else
		    {
			pRptr = (HI_VOID*)(&pAipReg->AIP_BUF_RPTR.ADDR_LOW);
			pWptr = (HI_VOID*)(&pAipReg->AIP_BUF_WPTR.ADDR_LOW);
		    }
		    u32UsedSize	 = ADSP_BufUsedSizeProc(pAipReg->AIP_BUF_SIZE.bits.buff_size, *((HI_U32*)pRptr), *((HI_U32*)pWptr));
		    u32FrameSize = ADSP_FrameSizeProc(ADSP_AOE_WidthProc(pAipReg->AIP_BUFF_ATTR.bits.aip_precision), ADSP_AOE_ChProc(pAipReg->AIP_BUFF_ATTR.bits.aip_ch));
		    ADSP_ReadAddr(pAipReg->AIP_BUF_ADDR, pTmpAddr);
		    PROC_PRINT( p,
				"	     :Buff Format(%s), Rate(%.6d), Ch(%d), Width(%d), Addr(0x%p), Size/Used/Latency(0x%.6x/%d%%/%dms), Rptr/Wptr(0x%.6x/0x%.6x)\n",
				(0 == pAipReg->AIP_BUFF_ATTR.bits.aip_format) ? "pcm" : "iec61937",
				ADSP_AOE_RateProc(pAipReg->AIP_BUFF_ATTR.bits.aip_fs),
				ADSP_AOE_ChProc(pAipReg->AIP_BUFF_ATTR.bits.aip_ch),
				ADSP_AOE_WidthProc(pAipReg->AIP_BUFF_ATTR.bits.aip_precision),
				pTmpAddr,
				pAipReg->AIP_BUF_SIZE.bits.buff_size,
				ADSP_BufUsedPercProc(pAipReg->AIP_BUF_SIZE.bits.buff_size, u32UsedSize),
				ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAipReg->AIP_BUFF_ATTR.bits.aip_fs)),
				*((HI_U32*)pRptr),
				*((HI_U32*)pWptr));
		    if (pEneReg->ENGINE_ATTR.bits.format == 0)	// LPCM
		    {
			u32UsedSize = ADSP_BufUsedSizeProc(pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_size, pAipReg->AIP_FIFO_RPTR, pAipReg->AIP_FIFO_WPTR);
			u32FrameSize = ADSP_FrameSizeProc(ADSP_AOE_WidthProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_precision), ADSP_AOE_ChProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_ch));
			PROC_PRINT( p,
				    "		 :Fifo Format(%s), Rate(%.6d), Ch(%d), Width(%d), Addr(0x%.8x), Size/Used/Latency/Underflow(0x%.4x/%d%%/%dms/%d), Rptr/Wptr(0x%.4x/0x%.4x)\n",
				    (0 == pAipReg->AIP_FIFO_ATTR.bits.fifo_format) ? "pcm" : "iec61937",
				    ADSP_AOE_RateProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_fs),
				    ADSP_AOE_ChProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_ch),
				    ADSP_AOE_WidthProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_precision),
				    pAipReg->AIP_FIFO_ADDR,
				    pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_size,
				    ADSP_BufUsedPercProc(pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_size, u32UsedSize),
				    ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAipReg->AIP_FIFO_ATTR.bits.fifo_fs)),
				    pAipReg->AIP_FIFO_SIZE.bits.aip_fifo_underflow_cnt,
				    pAipReg->AIP_FIFO_RPTR,
				    pAipReg->AIP_FIFO_WPTR);
		    }

		    if(pAipReg->AIP_EXT2_CTRL.bits.is_duplicate)
		    {
			u32DupAopId = pAipReg->AIP_EXT2_CTRL.bits.dest_aop;
			PROC_PRINT( p, "	     DuplicateAop(%d)\n", u32DupAopId);
		    }
		}
	    }
	    for (j = 0; j < AOE_MAX_AOP_NUM; j++)
	    {
		if (((pEneReg->ENGINE_ROU_DST.bits.aop_buf_ena) & (1L << j)) || ((1L << u32DupAopId) & (1L << j)))
		{
		    pAopReg = (S_AOP_REGS_TYPE*)(g_pAoeRegAddr + AOE_AOP_REG_OFFSET + j * sizeof(S_AOP_REGS_TYPE));
		    if (pAopReg->AOP_CTRL.bits.cast_flag == 1) // aop is cast
		    {
			PROC_PRINT( p,
				    "Aop(%d,Cast) :Status(%s), AddMute(%s), AefBypass(%s), Vol(%ddB/%ddB), Mute(%s), Latency(%dms), DelayComps(%dms)\n",
				    j,
				    ADSP_AOE_StatusName(pAopReg->AOP_CTRL.bits.cmd, pAopReg->AOP_CTRL.bits.cmd_done),
				    (pAopReg->AOP_CTRL.bits.ena_add_mute == 1) ? "on" : "off",
				    (0 == pAopReg->AOP_CTRL.bits.ena_aef_bypass) ? "Off" : "On",
				    (HI_S32)(pAopReg->AOP_EXT_CTRL.bits.volume_l) - 0x79,
				    (HI_S32)(pAopReg->AOP_EXT_CTRL.bits.volume_l) - 0x79,
				    (0 == pAopReg->AOP_EXT_CTRL.bits.mute) ? "Off" : "On",
				    pAopReg->AOP_BUFF_ATTR.bits.buf_latency,
				    pAopReg->AOP_CTRL.bits.realdelayms);
		    }
		    else
		    {
			PROC_PRINT( p,
				    "Aop(%d)	  :Status(%s), AefBypass(%s), Vol(%s%d.%ddB/%s%d.%ddB), Balance(%d), mute(%s) , Latency(%dms), AD(%s), DelayComps(%dms)\n",
				    j,
				    ADSP_AOE_StatusName(pAopReg->AOP_CTRL.bits.cmd, pAopReg->AOP_CTRL.bits.cmd_done),
				    (0 == pAopReg->AOP_CTRL.bits.ena_aef_bypass) ? "Off" : "On",
				    (0x79 == pAopReg->AOP_EXT_CTRL.bits.volume_l && 1 == pAopReg->AOP_EXT_CTRL.bits.volumedec_dir_l) ? "-" : "",
				    (HI_S32)(pAopReg->AOP_EXT_CTRL.bits.volume_l) - 0x79,
				    pAopReg->AOP_EXT_CTRL.bits.volumedec_l * 125,
				    (0x79 == pAopReg->AOP_EXT_CTRL.bits.volume_r && 1 == pAopReg->AOP_EXT_CTRL.bits.volumedec_dir_r) ? "-" : "",
				    (HI_S32)(pAopReg->AOP_EXT_CTRL.bits.volume_r) - 0x79,
				    pAopReg->AOP_EXT_CTRL.bits.volumedec_r * 125,
				    (0 == pAopReg->AOP_EXT_CTRL.bits.balance_dir) ? pAopReg->AOP_EXT_CTRL.bits.balance_val : -pAopReg->AOP_EXT_CTRL.bits.balance_val,
				    (0 == pAopReg->AOP_EXT_CTRL.bits.mute) ? "Off" : "On",
				    pAopReg->AOP_BUFF_ATTR.bits.buf_latency,
				    (0 == pAopReg->AOP_CTRL.bits.ena_ad) ? "Off" : "On",
				    pAopReg->AOP_CTRL.bits.realdelayms);
		    }

		    if (1 == pAopReg->AOP_BUF_SIZE.bits.buff_flag)
		    {
			ADSP_ReadAddr(pAopReg->AOP_BUF_RPTR, pRptr);
			ADSP_ReadAddr(pAopReg->AOP_BUF_WPTR, pWptr);
		    }
		    else  //Aop is Cast
		    {
			pRptr = (HI_VOID*)(&pAopReg->AOP_BUF_RPTR);
			pWptr = (HI_VOID*)(&pAopReg->AOP_BUF_WPTR);
		    }

		    u32UsedSize = ADSP_BufUsedSizeProc(pAopReg->AOP_BUF_SIZE.bits.buff_size, *((HI_U32*)pRptr), *((HI_U32*)pWptr));
		    u32FrameSize = ADSP_FrameSizeProc(ADSP_AOE_WidthProc(pAopReg->AOP_BUFF_ATTR.bits.buf_precision), ADSP_AOE_ChProc(pAopReg->AOP_BUFF_ATTR.bits.buf_ch));
		    ADSP_ReadAddr(pAopReg->AOP_BUF_ADDR, pTmpAddr);
		    PROC_PRINT( p,
				"	     :Buff Format(%s), Rate(%.6d), Ch(%d), Width(%d), Addr(0x%p), Size/Used/Latency(0x%.4x/%d%%/%dms), Rptr/Wptr(0x%.4x/0x%.4x)\n",
				pAopReg->AOP_BUFF_ATTR.bits.buf_format == 0 ? "pcm" : "iec61937",
				ADSP_AOE_RateProc(pAopReg->AOP_BUFF_ATTR.bits.buf_fs),
				ADSP_AOE_ChProc(pAopReg->AOP_BUFF_ATTR.bits.buf_ch),
				ADSP_AOE_WidthProc(pAopReg->AOP_BUFF_ATTR.bits.buf_precision),
				pTmpAddr,
				pAopReg->AOP_BUF_SIZE.bits.buff_size,
				ADSP_BufUsedPercProc(pAopReg->AOP_BUF_SIZE.bits.buff_size, u32UsedSize),
				ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAopReg->AOP_BUFF_ATTR.bits.buf_fs)),
				*((HI_U32*)pRptr),
				*((HI_U32*)pWptr)
			      );
		    if (pAopReg->AOP_CTRL.bits.audiodelay)
		    {
			PROC_PRINT( p,
				    "		 :AddMuteCnt(%.6u)\n", pAopReg->AOP_ADDMUTE_CNT);
		    }
		    if (pAopReg->AOP_CTRL.bits.cast_flag == 1) //Aop is Cast
		    {
			for (tmp = 0; tmp < AOE_MAX_CAST_NUM; tmp++)
			{
			    pCastReg = (S_CAST_REGS_TYPE*)(g_pAoeRegAddr + AOE_CAST_REG_OFFSET + tmp * sizeof(S_CAST_REGS_TYPE));
			    if (pCastReg->CAST_AOP_ID == j)
			    {
				PROC_PRINT( p,
					    "		 :BuffWritCnt(Total/Nomal/AddMute)(%.6u/%.6u/%.6u), BuffOverWriteCnt(%.6u)\n",
					    pCastReg->CAST_BUF_WRITETOTAL_CNT,
					    pCastReg->CAST_BUF_WRITEOK_CNT,
					    pCastReg->CAST_BUF_WRITEMUTE_CNT,
					    pCastReg->CAST_BUF_OVERWRITE_CNT);

				u32UsedSize = ADSP_BufUsedSizeProc(pCastReg->CAST_FIFO_SIZE, pCastReg->CAST_FIFO_RPTR, pCastReg->CAST_FIFO_WPTR);
				PROC_PRINT( p,
					    "		 :FIFO Size/Used/Latency(0x%.4x/%d%%/%dms), Rptr/Wptr(0x%.4x/0x%.4x), FIFOWrite(Try/OK)(%.6u/%.6u), ForceFIFOReadCnt(%.6u)\n",
					    pCastReg->CAST_FIFO_SIZE,
					    ADSP_BufUsedPercProc(pCastReg->CAST_FIFO_SIZE, u32UsedSize),
					    ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAopReg->AOP_BUFF_ATTR.bits.buf_fs)),
					    pCastReg->CAST_FIFO_RPTR,
					    pCastReg->CAST_FIFO_WPTR,
					    pCastReg->CAST_FIFO_TRY_CNT,
					    pCastReg->CAST_FIFO_OK_CNT,
					    pCastReg->CAST_FIFO_FORCE_READ_CNT);
			    }

			}
		    }
		}
	    }
	    PROC_PRINT( p, "\n");
	}
    }
    if (u32AipId != AOE_MAX_AIP_NUM)
    {
	pAipReg = (S_AIP_REGS_TYPE*)(g_pAoeRegAddr + AOE_AIP_REG_OFFSET + u32AipId * sizeof(S_AIP_REGS_TYPE));
	if (1 == pAipReg->AIP_BUF_SIZE.bits.buff_flag)
	{
	    ADSP_ReadAddr(pAipReg->AIP_BUF_RPTR, pRptr);
	    ADSP_ReadAddr(pAipReg->AIP_BUF_WPTR, pWptr);
	}
	else
	{
	    pRptr = (HI_VOID*)(&pAipReg->AIP_BUF_RPTR.ADDR_LOW);
	    pWptr = (HI_VOID*)(&pAipReg->AIP_BUF_WPTR.ADDR_LOW);
	}
	u32UsedSize = ADSP_BufUsedSizeProc(pAipReg->AIP_BUF_SIZE.bits.buff_size, *(HI_U32*)pRptr, *(HI_U32*)pWptr);
	u32FrameSize = ADSP_FrameSizeProc(ADSP_AOE_WidthProc(pAipReg->AIP_BUFF_ATTR.bits.aip_precision), ADSP_AOE_ChProc(pAipReg->AIP_BUFF_ATTR.bits.aip_ch));
	PROC_PRINT( p,
		    "Karaoke	 :Aip(%d), Size/Used/Latency(0x%.6x/%d%%/%dms)\n",
		    u32AipId,
		    pAipReg->AIP_BUF_SIZE.bits.buff_size,
		    ADSP_BufUsedPercProc(pAipReg->AIP_BUF_SIZE.bits.buff_size, u32UsedSize),
		    ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAipReg->AIP_BUFF_ATTR.bits.aip_fs))
		  );
	pAopReg = (S_AOP_REGS_TYPE*)(g_pAoeRegAddr + AOE_AOP_REG_OFFSET + u32AopId * sizeof(S_AOP_REGS_TYPE));
	if (1 == pAopReg->AOP_BUF_SIZE.bits.buff_flag)
	{
	    ADSP_ReadAddr(pAopReg->AOP_BUF_RPTR, pRptr);
	    ADSP_ReadAddr(pAopReg->AOP_BUF_WPTR, pWptr);
	}
	else  //Aop is Cast
	{
	    pRptr = (HI_VOID*)(&pAopReg->AOP_BUF_RPTR);
	    pWptr = (HI_VOID*)(&pAopReg->AOP_BUF_WPTR);
	}
	u32UsedSize = ADSP_BufUsedSizeProc(pAopReg->AOP_BUF_SIZE.bits.buff_size, *(HI_U32*)pRptr, *(HI_U32*)pWptr);
	u32FrameSize = ADSP_FrameSizeProc(ADSP_AOE_WidthProc(pAopReg->AOP_BUFF_ATTR.bits.buf_precision), ADSP_AOE_ChProc(pAopReg->AOP_BUFF_ATTR.bits.buf_ch));
	PROC_PRINT( p,
		    "		 :Aop(%d), Size/Used/Latency(0x%.4x/%d%%/%dms)\n",
		    u32AopId,
		    pAopReg->AOP_BUF_SIZE.bits.buff_size,
		    ADSP_BufUsedPercProc(pAopReg->AOP_BUF_SIZE.bits.buff_size, u32UsedSize),
		    ADSP_BufLatencyMsProc(u32UsedSize, u32FrameSize, ADSP_AOE_RateProc(pAopReg->AOP_BUFF_ATTR.bits.buf_fs))
		  );
    }

    return;
}

HI_S32 ADSP_DRV_ReadProc(struct seq_file* file, HI_VOID* Param)
{
    if (HI_NULL == g_pAoeRegAddr)
    {
	PROC_PRINT(file, "\n-------------  ADSP NOT OPEN  -------------\n");
	return HI_SUCCESS;
    }

    ADSP_AOE_Proc(file, Param);

    return HI_SUCCESS;
}

HI_S32 ADSP_DRV_WriteProc(struct file* file,
			  const char __user* buf, size_t count, loff_t* ppos)
{
    return count;
}

HI_S32 ADSP_DRV_RegisterProc(ADSP_REGISTER_PARAM_S* pstParam)
{
    DRV_PROC_ITEM_S* pProcItem;

    /* Check parameters */
    if (HI_NULL == pstParam)
    {
	return HI_FAILURE;
    }

    pProcItem = HI_DRV_PROC_AddModule("*adsp", HI_NULL, HI_NULL);
    if (!pProcItem)
    {
	HI_FATAL_ADSP("Create adsp proc entry fail!\n");
	return HI_FAILURE;
    }

    /* Set functions */
    pProcItem->read  = pstParam->pfnReadProc;
    pProcItem->write = pstParam->pfnWriteProc;

    return HI_SUCCESS;
}

HI_VOID ADSP_DRV_UnregisterProc(HI_VOID)
{
    HI_DRV_PROC_RemoveModule("*adsp");
}

HI_VOID ADSP_ProcDeInit(HI_VOID)
{
    g_pAoeRegAddr = HI_NULL;
}

HI_S32 ADSP_ProcInit(HI_VOID)
{
    if (HI_NULL == g_pDspShareSRam)
    {
	HI_ERR_ADSP("DSP share sram ptr is NULL\n");
	return HI_FAILURE;
    }

    g_pAoeRegAddr = g_pDspShareSRam + DSP0_SHARESRAM_AOE_OFFSET;

    return HI_SUCCESS;
}
