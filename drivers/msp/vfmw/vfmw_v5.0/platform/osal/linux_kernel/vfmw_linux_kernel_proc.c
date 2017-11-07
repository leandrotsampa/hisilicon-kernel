#include "vfmw_linux_kernel_proc.h"
#include "vfmw_log.h"
#include "vfmw_write_yuv.h"
#include "simple_core.h"
#include "user_client.h"
#include "user_client_com.h"

#ifdef ENV_ARMLINUX_KERNEL

#ifdef HI_ADVCA_FUNCTION_RELEASE
#undef	HI_VFMW_PROC_SUPPORT
#else
#define HI_VFMW_PROC_SUPPORT
#endif

#ifdef HI_VFMW_PROC_SUPPORT

#define MAX_VID_PROTOCOL_NAME 20

#define VFMW_PROC_NAME_INFO	"info"
#define VFMW_PROC_NAME_HELP	"help"
#define VFMW_PROC_NAME_SCD	"scd"
#define VFMW_PROC_NAME_VDH	"vdh"
#define VFMW_PROC_NAME_CHN	"channel"
#define VFMW_PROC_NAME_FSP	"fsp"
#define VFMW_PROC_NAME_LWD	"lowdelay"
#define VFMW_PROC_NAME_STATIS	"vfmw_statis"
#define VFMW_PROC_NAME_DIFF	"vfmw_diff"

struct proc_dir_entry *g_pVfmwProc = NULL;

SINT32 vfmw_proc_open(struct inode *inode, struct file *file);
ssize_t vfmw_proc_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos);


#ifndef	 HI_ADVCA_FUNCTION_RELEASE
typedef VOID (*VFMW_PROC_CMD_HANDLER)(UINT32 *p_args);
typedef struct
{
    UINT32 CmdName;
    VFMW_PROC_CMD_HANDLER pHandler;
}VFMW_PROC_COMMAND_NODE;
#endif

static const struct file_operations vfmw_proc_fops =
{
    .owner   = THIS_MODULE,
    .open    = vfmw_proc_open,
    .read    = seq_read,
    .write   = vfmw_proc_write,
    .llseek  = seq_lseek,
    .release = single_release,
};

UINT32	g_ResetCreateNewSave = 0;
VOID *vfmw_save_str_file[32] = {0};
UINT32 save_str_chan_num = 0;
VOID *vfmw_save_seg_file[32] = {0};
UINT32 save_seg_chan_num = 0;
VOID *vfmw_save_yuv_file[32] = {0};
SINT32 save_yuv_chan_num = -1;
SINT32 save_yuv_with_crop = 0;
VOID *vfmw_save_metadata_reorder_file[32] = {0};
SINT8  s_VfmwSavePath[64] = {'/', 'm', 'n', 't', 0};
MEM_RECORD_S MemRecord_YUV;
UINT16 *pPixelArray;
UINT8  *pY, *pUl, *pVl, *pY_2bit, *pUl_2bit, *pVl_2bit;
UINT32 g_SaveYUVBitWidth = 8; //default to save 8bit YUV

extern UINT32 g_ResetCreateNewSave;
extern SINT32 g_CurProcChan;
extern UINT32 g_PrintEnable;
extern UINT8  *g_pProcBuf;

VOID show_standard(VID_STD_E eVidStd, char *strVidStd)
{
    char *strVidstdTemp = NULL;

    switch (eVidStd)
    {
	case VFMW_H264:
	    strVidstdTemp = "H264";
	    break;

	case VFMW_VC1:
	    strVidstdTemp = "VC1";
	    break;

	case VFMW_MPEG4:
	    strVidstdTemp = "MPEG4";
	    break;

	case VFMW_MPEG2:
	    strVidstdTemp = "MPEG2";
	    break;

	case VFMW_H263:
	    strVidstdTemp = "H263";
	    break;

	case VFMW_DIVX3:
	    strVidstdTemp = "DIVX3";
	    break;

	case VFMW_AVS:
	    strVidstdTemp = "AVS";
	    break;

	case VFMW_JPEG:
	    strVidstdTemp = "JPEG";
	    break;

	case VFMW_REAL8:
	    strVidstdTemp = "REAL8";
	    break;

	case VFMW_REAL9:
	    strVidstdTemp = "REAL9";
	    break;

	case VFMW_VP6:
	    strVidstdTemp = "VP6";
	    break;

	case VFMW_VP6F:
	    strVidstdTemp = "VP6F";
	    break;

	case VFMW_VP6A:
	    strVidstdTemp = "VP6A";
	    break;

	case VFMW_VP8:
	    strVidstdTemp = "VP8";
	    break;

	case VFMW_VP9:
	    strVidstdTemp = "VP9";
	    break;

	case VFMW_SORENSON:
	    strVidstdTemp = "SORENSON";
	    break;

	case VFMW_MVC:
	    strVidstdTemp = "MVC";
	    break;

	case VFMW_HEVC:
	    strVidstdTemp = "HEVC";
	    break;

	case VFMW_RAW:
	    strVidstdTemp = "RAW";
	    break;

	case VFMW_USER:
	    strVidstdTemp = "USER";
	    break;

	case VFMW_AVS2:
	    strVidstdTemp = "AVS2.0";
	    break;

	case VFMW_END_RESERVED:
	    strVidstdTemp = "RESERVED";
	    break;

	default:
	    *strVidStd = '\0';
	    break;
    }

    if (strVidstdTemp)
    {
	strncpy(strVidStd, strVidstdTemp, strlen(strVidstdTemp));
	strVidStd[strlen(strVidstdTemp)] = '\0';
    }

    return;
}


SINT32 string_to_value(char *str, UINT32 *data)
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
	if (str[i] < 0x20) { break; }
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

SINT32 vfmw_read_proc_help(struct seq_file *p, VOID *v)
{
    seq_printf(p, "\n");
    seq_printf(p, "------------------------- HELP INFO ---------------------------\n");
    seq_printf(p, "you can perform vfmw debug with such commond:\n");
    seq_printf(p, "echo [arg1] [arg2] > /proc/vfmw\n");
    seq_printf(p, "\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "debug action			   arg1	      arg2\n");
    seq_printf(p, "------------------------------  --------  ---------------------\n");
    seq_printf(p, "set print enable		   0x0	     print_enable_word\n");
    seq_printf(p, "set err_thr			   0x2	     (chan_id<<24)|err_thr\n");
    seq_printf(p, "set dec order output		   0x4	     (chan_id<<24)|dec_order_output_enable\n");
    seq_printf(p, "set dec_mode(0/1/2=IPB/IP/I)	   0x5	     (chan_id<<24)|dec_mode\n");
    seq_printf(p, "set discard_before_dec_thr	   0x7	     (chan_id<<24)|stream_size_thr\n");
    seq_printf(p, "set postprocess options	   0xa	     (dc<<8)|(db<<4)|dr, 0000=auto,0001=on,0010=off\n");
    seq_printf(p, "set frame/adaptive storage	   0xb	     0:frame only, 1:adaptive\n");
    seq_printf(p, "pay attention to the channel	   0xd	     channel number\n");
    seq_printf(p, "channel vcmp config		   0xe	     chanId: arg2>>27,\n%42smirror_en: (arg2>>26)&1,\n%42svcmp_en: (arg2>>25)&1,\n%42swm_en: (arg2>>24)&1,\n%42swm_start: (arg2>>12)&0xfff,\n%42swm_end: (arg2)&0xfff\n", " ", " ", " ", " ", " ");
    seq_printf(p, "print tracer			   0x100     tracer address. do not care if vfmw still running\n");
    seq_printf(p, "start/stop raw stream saving	   0x200     chan_id\n");
    seq_printf(p, "start/stop stream seg saving	   0x201     chan_id\n");
    seq_printf(p, "start/stop 2D yuv saving	   0x202     (chan_id<<24)|crop_enable\n");
    seq_printf(p, "save a single 2D frame	   0x203     frame phy addr\n");
    seq_printf(p, "save a single 1D frame	   0x204     frame phy addr width height=(height+PicStructure)\n");
    seq_printf(p, "set dec_task_schedule_delay	   0x400     schedual_delay_time(ms)\n");
    seq_printf(p, "stop/start syntax dec	   0x402     do not care\n");
    seq_printf(p, "set trace controller		   0x500     vfmw_state_word in /proc/vfmw_prn\n");
    seq_printf(p, "set bitstream control period	   0x501     period (ms)\n");
    seq_printf(p, "set frame control period	   0x502     period (ms)\n");
    seq_printf(p, "set rcv/rls img control period  0x503     period (ms)\n");
    seq_printf(p, "set no stream report period	   0x504     period (ms)\n");
    seq_printf(p, "set save YUV bitWidth	   0x505     set save yuv bit width (must be 8 or 10)\n");
    seq_printf(p, "set module lowdelay start	   0x600     channel number\n");
    seq_printf(p, "set module lowdelay stop	   0x601     channel number\n");
    seq_printf(p, "set tunnel line number	   0x602     channel number\n");
    seq_printf(p, "set scd lowdelay start	   0x603     channel number\n");
    seq_printf(p, "set scd lowdelay stop	   0x604     channel number\n");
    seq_printf(p, "set mmu add_err int switch	   0x700     vdh number\n");
    seq_printf(p, "set vdh work clock		   0x900     clock Config\n");
    seq_printf(p, "set vdh work clock		   0x901     standard obedience\n");
    seq_printf(p, "\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "'print_enable_word' definition, from bit31 to bit0:\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "<not used>  DEC_MODE	   PTS	       DNR\n");
    seq_printf(p, "FOD	       SCD_INFO	   SCD_STREAM  SCD_REGMSG\n");
    seq_printf(p, "BLOCK       DBG	   SE	       SEI\n");
    seq_printf(p, "SLICE       PIC	   SEQ	       MARK_MMCO\n");
    seq_printf(p, "POC	       DPB	   REF	       QUEUE\n");
    seq_printf(p, "IMAGE       STR_BODY	   STR_TAIL    STR_HEAD\n");
    seq_printf(p, "STREAM      UPMSG	   RPMSG       DNMSG\n");
    seq_printf(p, "VDMREG      CTRL	   ERROR       FATAL\n");
    seq_printf(p, "\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "'vfmw_state' definition, from bit31 to bit0:\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <VO_REL_IMG>  <VO_RCV_IMG>\n");
    seq_printf(p, "<2D_TO_QUEUE>    <DNR_INTERRUPT>  <DNR_START>   <1D_TO_QUEUE>\n");
    seq_printf(p, "<VDH_REPAIR>	    <VDH_INTERRUPT>  <VDH_START>   <GENERATE_DECPARAM>\n");
    seq_printf(p, "<DECSYNTAX_SEG>  <SCD_INTERRUPT>  <SCD_START>   <RCV_RAW>\n");
    seq_printf(p, "\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "'extra_cmd' definition, from bit31 to bit0:\n");
    seq_printf(p, "---------------------------------------------------------------\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <not used>	   <not used>\n");
    seq_printf(p, "<not used>	    <not used>	     <direct 8x8>  <B before P>\n");
    seq_printf(p, "\n");
    seq_printf(p, "---------------------------------------------------------------\n");

    return 0;
}

SINT32 vfmw_read_proc_info(struct seq_file *p, VOID *v)
{
    SINT32 ret;
    VFMW_UCC_DATA UccData;

    seq_printf(p, "------------------------- VFMW INFO ---------------------------\n");

    seq_printf(p, "%-40s :%s\n",   "VFMW_MATCH_VERSION",    VFMW_MATCH_VERSION);
    seq_printf(p, "%-40s :%s\n",   "VFMW_MODIFICATION_DATE_KERNEL",    VFMW_MODIFICATION_DATE);


    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_INFO, NULL, 0, -1);
    ret = VFMW_UC_Com_Process(&UccData);
    if (ret <= 0)
    {
	dprint(PRN_ALWS, "%s return %d failed!\n", __func__, ret);
	return -1;
    }

    return 0;
}

SINT32 vfmw_read_proc_scd(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_SCD, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}

SINT32 vfmw_read_proc_vdh(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_VDH, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}

SINT32 vfmw_read_proc_chn(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_CHAN, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}

SINT32 vfmw_read_proc_fsp(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_FSP, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}

SINT32 vfmw_read_proc_statis(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_STATIS, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}


SINT32 vfmw_read_proc_diff(struct seq_file *p, VOID *v)
{
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_READ_PROC, READ_PROC_DIFF, NULL, 0, -1);

    if (VFMW_UC_Com_Process(&UccData) <= 0)
    {
	dprint(PRN_ALWS, "%s failed!\n", __func__);
	return -1;
    }

    return 0;
}

static void GetStrFromCmd(char *cmd, UINT32 count, SINT32 *index, char *str)
{
    SINT32 i, j;

    i = *index;
    j = 0;
    for (; i < count; i++)
    {
	if (j == 0 && cmd[i] == ' ') { continue; }

	if (cmd[i] > ' ') { str[j++] = cmd[i]; }

	if (j > 0 && cmd[i] == ' ') { break; }
    }
    str[j] = 0;

    *index = i;
}


SINT32 vfmw_proc_open(struct inode *inode, struct file *file)
{
    vfmw_proc_func *proc;

#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
    proc = PDE(inode)->data;
#else
    proc = PDE_DATA(inode);
#endif

    if (NULL == proc)
    {
	return -ENOSYS;
    }

    if (proc->read)
    {
	return single_open(file, proc->read, proc);
    }

    return -ENOSYS;
}

ssize_t vfmw_proc_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
{
    struct seq_file *s	    = file->private_data;
    vfmw_proc_func  *proc   = s->private;

    if (proc->write)
    {
	return proc->write(file, buf, count, ppos);
    }

    return -ENOSYS;
}

static vfmw_proc_func  vfmw_proc[32];

SINT32 vfmw_proc_create(HI_CHAR *proc_name, vfmw_proc_read_fn read, vfmw_proc_write_fn write)
{
    struct proc_dir_entry  *entry;
    vfmw_proc_func	   *proc = NULL;
    UINT32 i;
    UINT32 count = sizeof(vfmw_proc) / sizeof(vfmw_proc[0]);

    for (i = 0; i < count; i++)
    {
	if ((NULL == vfmw_proc[i].read) && (NULL == vfmw_proc[i].write))
	{
	    proc = &vfmw_proc[i];

	    strncpy(proc->proc_name, proc_name, sizeof(proc->proc_name));
	    proc->proc_name[sizeof(proc->proc_name) - 1] = 0;

	    proc->read	= read;
	    proc->write = write;

	    break;
	}
    }

    if (i >= count)
    {
	return -1;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
    entry = create_proc_entry(proc_name, 0644, g_pVfmwProc);

    if (!entry)
    {
	return -1;
    }

    entry->proc_fops	= &vfmw_proc_fops;
    entry->data		= proc;
#else
    entry = proc_create_data(proc_name, 0644, g_pVfmwProc, &vfmw_proc_fops, (VOID *)proc);

    if (!entry)
    {
	return -1;
    }

#endif

    return 0;
}

VOID vfmw_proc_destroy(HI_CHAR *proc_name)
{
    UINT32  i;
    UINT32  count = sizeof(vfmw_proc) / sizeof(vfmw_proc[0]);

    for (i = 0; i < count; i++)
    {
	vfmw_proc_func *proc = &vfmw_proc[i];

	if (0 == strncmp(proc_name, proc->proc_name, sizeof(proc->proc_name)))
	{
	    remove_proc_entry(proc_name, g_pVfmwProc);

	    memset(proc->proc_name, 0, sizeof(proc->proc_name));

	    proc->read	= NULL;
	    proc->write = NULL;

	    break;
	}
    }
}

VOID vfmw_proc_destroy_all(VOID)
{
    UINT32 i;
    UINT32 count = sizeof(vfmw_proc) / sizeof(vfmw_proc[0]);

    for (i = 0; i < count; i++)
    {
	vfmw_proc_func *proc = &vfmw_proc[i];

	if (proc->read != NULL)
	{
	    remove_proc_entry(proc->proc_name, g_pVfmwProc);

	    memset(proc->proc_name, 0, sizeof(proc->proc_name));

	    proc->read	= NULL;
	    proc->write = NULL;
	}
    }
}

#endif

/*********************************************************************************
    设置VDM的调试选项
*********************************************************************************/
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
/* 设置打印使能 */
static VOID VfmwProc_SetPrintLevel(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    dprint(PRN_ALWS, "g_PrintEnable(%d) set to 0x%x\n",g_PrintEnable, dat);

    g_PrintEnable = dat;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_PRINT_LEVEL, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }
}

/* 设置error_thr */
static VOID VfmwProc_SetErrorThr(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;
    SINT32 ChanID, Thr;

    ChanID = dat >> 24;
    Thr = dat & 0x00ffffff;
    dprint(PRN_ALWS, "chan %d: new ChanErrThr = %d\n", ChanID, Thr);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_ERROR_THR, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 设置是否解码序输出 */
static VOID VfmwProc_SetDecOrderOutput(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;
    SINT32 ChanID, DecOrderOutput;

    ChanID = dat >> 24;
    DecOrderOutput = dat & 3;
    dprint(PRN_ALWS, "chan %d: new DecOrderOutput = %d\n", ChanID, DecOrderOutput);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_DEC_ORDEER_OUTPUT, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 设置是否解码序输出 */
static VOID VfmwProc_SetDefaultOutputOrder(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    OUTPUT_ORDER_E OutputOrder;
    VFMW_UCC_DATA UccData;

    OutputOrder = dat;
    if (OutputOrder > OUTPUT_ORDER_BUTT)
    {
	dprint(PRN_ALWS, "Invalid output order %d\n", OutputOrder);
	return;
    }

    dprint(PRN_ALWS, "set default output order %d\n", OutputOrder);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_DEF_OUTPUT_ORDER, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 设置 I/IP/IPB模式 */
static VOID VfmwProc_SetDecMode(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;
    SINT32 ChanID, Mode;

    ChanID = dat >> 24;
    Mode = dat & 7;
    dprint(PRN_ALWS, "chan %d: new DecMode = %d\n", ChanID, Mode);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_DEC_MODE, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 修改码流丢帧阈值 */
static VOID VfmwProc_SetDropStreamThr(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;
    SINT32 ChanID, Thr;

    ChanID = dat >> 24;
    Thr = dat & 0x00ffffff;
    dprint(PRN_ALWS, "chan %d: new StrmOFThr = %d\n", ChanID, Thr);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_DROP_STRM_THR, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}


/* 设置是否打开帧场自适应存储 */
static VOID VfmwProc_SetUSE_FF_APT_EN(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat != 0 && dat != 1)
    {
	dprint(PRN_ALWS, "USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\n", dat);

	return;
    }

    dprint(PRN_ALWS, "USE_FF_APT_EN = %d\n", dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_USE_FF_APT_EN, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetSaveFileAfterReset(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat != 0 && dat != 1)
    {
	dprint(PRN_ALWS, "ResetCreateNewSave can NOT be set to %d, must be 0 or 1\n", dat);

	return;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_SAVE_FILE_AFTER_RESET, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetCurProcChan(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat > MAX_CHAN_NUM)
    {
	dprint(PRN_ALWS, "NO SUCH CHANNEL : %d\n", dat);
    }
    else
    {
	g_CurProcChan = dat;
	dprint(PRN_ALWS, "Pay attention to  CHANNEL : %d\n", dat);
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_CUR_PROC_CHAN, &dat, sizeof(UINT32), -1);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}


/* 内存跟踪 */
static VOID VfmwProc_PrintTracer(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    dprint(PRN_ALWS, "print memory tracer...\n");

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_PRINT_TRACER, &dat, sizeof(UINT32), -1);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetScdPrint(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    dprint(PRN_ALWS, "SetScdPrint enable once! Scd channel = %d\n",dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_SCD_PRINT, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 码流存盘 */
static VOID VfmwProc_Savestream(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    if ( dat >= MAX_CHAN_NUM)
    {
	return;
    }

#if defined(ENV_ARMLINUX_KERNEL)
    if (NULL == vfmw_save_str_file[dat])
    {
	SINT8 str[50];
	static UINT32 save_file_cnt = 0;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_snprintf(str, 50, LOG_GetString(VFMW_STRING_RAW_SAVE_PATH), (char *)s_VfmwSavePath, save_file_cnt++);

	vfmw_save_str_file[dat] = vfmw_Osal_Func_Ptr_S.pfun_Osal_FileOpen(str, VFMW_O_RDWR | VFMW_O_CREATE, 0);
	save_str_chan_num = dat;

	if (NULL != vfmw_save_str_file[dat])
	{
	    dprint(PRN_ALWS, "OK create file '%s' for channel %d raw stream save\n", str, save_str_chan_num);
	}
	else
	{
	    dprint(PRN_ALWS, "failed create file '%s' for raw stream save!\n", str);
	}
    }
    else
    {
	dprint(PRN_ALWS, ">>>> close raw stream saving >>>>\n");
	vfmw_Osal_Func_Ptr_S.pfun_Osal_FileClose(vfmw_save_str_file[dat]);
	vfmw_save_str_file[dat] = NULL;
    }
#endif

    return;
}

/* seg码流存盘 */
static VOID VfmwProc_SaveSeg(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    if (dat >= MAX_CHAN_NUM)
    {
	return;
    }

#if defined(ENV_ARMLINUX_KERNEL)
    if (NULL == vfmw_save_seg_file[dat])
    {
	SINT8 str[50];
	static UINT32 save_file_cnt = 0;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_snprintf(str, 50, LOG_GetString(VFMW_STRING_SEG_SAVE_PATH), (char *)s_VfmwSavePath, save_file_cnt++);
	vfmw_save_seg_file[dat] = vfmw_Osal_Func_Ptr_S.pfun_Osal_FileOpen(str, VFMW_O_RDWR | VFMW_O_CREATE, 0);
	save_seg_chan_num = dat;

	if (NULL != vfmw_save_seg_file[dat])
	{
	    dprint(PRN_ALWS, "OK create file '%s' for channel %d seg stream save\n", str, save_seg_chan_num);
	}
	else
	{
	    dprint(PRN_ALWS, "failed create file '%s' for seg stream save!\n", str);
	}
    }
    else
    {
	dprint(PRN_ALWS, ">>>> close seg stream saving >>>>\n");
	vfmw_Osal_Func_Ptr_S.pfun_Osal_FileClose(vfmw_save_seg_file[dat]);
	vfmw_save_seg_file[dat] = NULL;
    }
#endif

    return;
}

/* YUV序列存盘 */
static VOID VfmwProc_SaveYUV(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    if (dat >= MAX_CHAN_NUM)
    {
	return;
    }

#if defined(ENV_ARMLINUX_KERNEL)
    vfmw_Osal_Func_Ptr_S.pfun_Osal_SemaInit(G_SAVEYUV_SEM, dat);
    vfmw_Osal_Func_Ptr_S.pfun_Osal_SemaDown(G_SAVEYUV_SEM,dat);
    if (NULL == vfmw_save_yuv_file[dat])
    {
	SINT8 str[100];
	UINT32 tmp_mem_size;
	static UINT32 save_file_cnt = 0;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_snprintf(str, sizeof(str), LOG_GetString(VFMW_STRING_YUV_SAVE_PATH), (char *)s_VfmwSavePath, save_file_cnt++);
	vfmw_save_yuv_file[dat] = vfmw_Osal_Func_Ptr_S.pfun_Osal_FileOpen(str, VFMW_O_RDWR | VFMW_O_CREATE | VFMW_O_TRUNC, 0);

	if (NULL != vfmw_save_yuv_file[dat])
	{
	    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(&MemRecord_YUV, 0, sizeof(MEM_RECORD_S));
#ifdef HI_SMMU_SUPPORT
	    MemRecord_YUV.eMode =  MEM_MMU_MMU;
#else
	    MemRecord_YUV.eMode =  MEM_CMA_CMA;
#endif
	    tmp_mem_size = MAX_DUMP_FRAME_SIZE * 2 + MAX_DUMP_PIXEL_ARRAY_SIZE;
	    if ( MEM_MAN_OK != MEM_AllocMemBlock(LOG_GetString(VFMW_STRING_BIGTILE_ID_YUV), 0, tmp_mem_size, &MemRecord_YUV, 0) )
	    {
		dprint(PRN_ERROR, "Failed to alloc VFMW_DumpImageTmp size %d!\n");

		vfmw_Osal_Func_Ptr_S.pfun_Osal_FileClose(vfmw_save_yuv_file[dat]);
		vfmw_save_yuv_file[dat] = NULL;
		pY = pUl = pVl = NULL;
		pY_2bit = pUl_2bit = pVl_2bit = NULL;
		save_yuv_chan_num = -1;
		save_yuv_with_crop = 0;
	    }
	    else
	    {
		MEM_AddMemRecord(MemRecord_YUV.PhyAddr, MemRecord_YUV.VirAddr, MemRecord_YUV.Length);
		pY  = MemRecord_YUV.VirAddr;
		pUl = pY + (MAX_DUMP_FRAME_SIZE * 2 / 3);
		pVl = pUl + (MAX_DUMP_FRAME_SIZE * 1 / 6);
		pY_2bit	 = pY + MAX_DUMP_FRAME_SIZE;
		pUl_2bit = pY_2bit + (MAX_DUMP_FRAME_SIZE * 2 / 3);
		pVl_2bit = pUl_2bit + (MAX_DUMP_FRAME_SIZE * 1 / 6);
		pPixelArray = (UINT16 *)(pY_2bit + MAX_DUMP_FRAME_SIZE);
		save_yuv_chan_num = (dat >> 24);
		save_yuv_with_crop = dat & 0x03;
		dprint(PRN_ALWS, "OK create file '%s' for chan %d yuv save.(crop %d)\n", str, save_yuv_chan_num, save_yuv_with_crop);
	    }
	}
	else
	{
	    dprint(PRN_ALWS, "failed create file '%s' for yuv save!\n", str);
	}
    }
    else
    {
	dprint(PRN_ALWS, "OK close yuv save.\n");

	vfmw_Osal_Func_Ptr_S.pfun_Osal_FileClose(vfmw_save_yuv_file[dat]);

	vfmw_save_yuv_file[dat] = NULL;
	pY = pUl = pVl = NULL;
	pY_2bit = pUl_2bit = pVl_2bit = NULL;
	pPixelArray = NULL;
	save_yuv_chan_num = -1;
	save_yuv_with_crop = 0;

	if (MemRecord_YUV.PhyAddr != 0)
	{
	    MEM_ReleaseMemBlock(MemRecord_YUV.PhyAddr, MemRecord_YUV.VirAddr);
	    MEM_DelMemRecord(MemRecord_YUV.PhyAddr, MemRecord_YUV.VirAddr, MemRecord_YUV.Length);

	    vfmw_Osal_Func_Ptr_S.pfun_Osal_MemSet(&MemRecord_YUV, 0, sizeof(MEM_RECORD_S));
	}
    }
    vfmw_Osal_Func_Ptr_S.pfun_Osal_SemaUp(G_SAVEYUV_SEM,dat);
#endif
    return;
}

/* 1d YUV存盘 */
static VOID VfmwProc_Save1DYUV(UINT32 *p_args)
{
    dprint(PRN_ALWS, "NOT SUPORT!!FIX ME\n");

    return;
}

/* metadata码流存盘 */
static VOID VfmwProc_SaveMetadata(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if ( dat >= MAX_CHAN_NUM)
    {
	return;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SAVE_METADATA, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* 送往后级模块的metadata码流存盘 */
static VOID VfmwProc_SaveReorderMetadata(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    if ( dat >= MAX_CHAN_NUM)
    {
	return;
    }

#if defined(ENV_ARMLINUX_KERNEL)
    if (NULL == vfmw_save_metadata_reorder_file[dat])
    {
	SINT8 str[50];
	static UINT32 save_file_cnt = 0;

	vfmw_Osal_Func_Ptr_S.pfun_Osal_snprintf(str, 50, LOG_GetString(VFMW_STRING_META_REORDER_SAVE_NAME), (char *)s_VfmwSavePath, save_file_cnt++);
	vfmw_save_metadata_reorder_file[dat] = vfmw_Osal_Func_Ptr_S.pfun_Osal_FileOpen(str, VFMW_O_RDWR | VFMW_O_CREATE, 0);

	if (NULL != vfmw_save_metadata_reorder_file[dat])
	{
	    dprint(PRN_ALWS, "OK create file '%s' for metadata_reorder stream save\n", str);
	}
	else
	{
	    dprint(PRN_ALWS, "failed create file '%s' for metadata_reorder stream save!\n", str);
	}
    }
    else
    {
	dprint(PRN_ALWS, ">>>> close metadata stream saving >>>>\n");
	vfmw_Osal_Func_Ptr_S.pfun_Osal_FileClose(vfmw_save_metadata_reorder_file[dat]);
	vfmw_save_metadata_reorder_file[dat] = NULL;
    }
#endif

    return;
}

/* EL码流存盘 */
static VOID VfmwProc_SaveEL(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if ( dat >= MAX_CHAN_NUM)
    {
	return;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SAVE_EL, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_TestSuspend(UINT32 *p_args)
{
    dprint(PRN_DBG, "proc cmd need no param:%p\n", p_args);

    VFMW_UC_EXT_Suspend();

    return;
}

static VOID VfmwProc_TestResume(UINT32 *p_args)
{
    dprint(PRN_DBG, "proc cmd need no param:%p\n", p_args);

    VFMW_UC_EXT_Resume();

    return;
}

static VOID VfmwProc_TestStopChan(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;
    SINT32 ret;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_STOP_CHAN, &dat, sizeof(UINT32), -1);

    ret = VFMW_UC_Com_Process(&UccData); //stop

    dprint(PRN_ALWS, "stop chan %d: VCTRL_StopChan return %d\n", dat, ret);

    return;
}

static VOID VfmwProc_TestResetChan(UINT32 *p_args)
{
    SINT32 ret;
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_RESET_CHAN, &dat, sizeof(UINT32), -1);

    ret = VFMW_UC_Com_Process(&UccData);  //reset

    dprint(PRN_ALWS, "reset chan %d: VCTRL_ResetChan return %d\n", dat, ret);

    return;
}

static VOID VfmwProc_TestStartChan(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    SINT32 ret;
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_START_CHAN, &dat, sizeof(UINT32), -1);

    ret = VFMW_UC_Com_Process(&UccData);  //start

    dprint(PRN_ALWS, "start chan %d: VCTRL_StartChan return %d\n", dat, ret);

    return;
}

static VOID VfmwProc_TestRestartChan(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    SINT32 ret;
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_RESTART_CHAN, &dat, sizeof(UINT32), -1);

    ret = VFMW_UC_Com_Process(&UccData);

    dprint(PRN_ALWS, "start chan %d: RestartChan return %d\n", dat, ret);

    return;
}

/* %%%%%% 时序测试(0x400) %%%%% */
static VOID VfmwProc_TestTimeSequence(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_TIME_SEQUENCE, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ dec task delay %d ms ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_TestStopDec(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_TEST_STOP_DEC, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ dec stop = %d ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

/* %%%% 调试信息控制参数(0x500) %%%%% */
static VOID VfmwProc_SetTraceCtrl(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_TRACE_CTRL, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ g_TraceCtrl = %x ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetTraceBSPeriod(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_TRACE_BS_PERIOD, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ g_TraceBsPeriod = %x ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetTraceFramePeriod(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_TRACE_FRAME_PERIOD, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ g_TraceFramePeriod = %x ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetTraceImgPeriod(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_TRACE_IMG_PERIOD, &dat, sizeof(UINT32), -1);

    dprint(PRN_ALWS, "------ g_TraceImgPeriod = %x ------\n", dat);
    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetSaveYuvBitWidth(UINT32 *p_args)
{
    UINT32 dat = p_args[0];

    if ((dat != 8) && (dat != 10))
    {
       dprint(PRN_ALWS, "ERROR: g_SaveYUVBitWidth should be 8 or 10! (not to be %d)\n", dat);
    }
    else
    {
	g_SaveYUVBitWidth = dat;
	dprint(PRN_ALWS, "------ g_SaveYUVBitWidth = %d ------\n", g_SaveYUVBitWidth);
    }

    return;
}

//打开指定通道的模块间低延时功能
static VOID VfmwProc_OpenModuleLowly(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat >= MAX_CHAN_NUM)
    {
	dprint(PRN_FATAL, "The channel number is to Large.\n");
	return;
    }
    dprint(PRN_ALWS, "------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 1 ------\n", dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_OPEN_MODULE_LOWLY, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

//关闭指定通道的模块间低延时功能
static VOID VfmwProc_CloseModuleLowly(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat >= MAX_CHAN_NUM)
    {
	dprint(PRN_FATAL, "The channel number is to Large.\n");
	return;
    }

    dprint(PRN_ALWS, "------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 0 ------\n", dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_CLOSE_MODULE_LOWLY, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

#ifdef VFMW_MODULE_LOWDLY_SUPPORT
//模块间低延时行号设置
static VOID VfmwProc_SetTunnelLineNumber(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    dprint(PRN_ALWS, "------ g_TunnelLineNumber = %d ------\n", dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_TUNNEL_LINE_NUMBER, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}
#endif

//指定通道scd低延时打开
static VOID VfmwProc_OpenScdLowdly(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_OPEN_SCD_LOWLY, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

//指定通道scd低延时关闭
static VOID VfmwProc_CloseScdLowdly(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_CLOSE_SCD_LOWLY, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

//开关SedOnly低延迟功能
static VOID VfmwProc_SetSedOnlyEnable(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat == 0)
    {
	dprint(PRN_ALWS, "Disable SedOnly Func\n");
    }
    else
    {
	dprint(PRN_ALWS, "Enable SedOnly Func\n");
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_SED_ONLY_EN, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

#ifdef HI_SMMU_SUPPORT
static VOID VfmwProc_SetSmmuIrqEnable(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat < MAX_VDH_NUM)
    {
	VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_SMMU_IRQ_EN, &dat, sizeof(UINT32), -1);

	if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
	{
	    dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
	}
    }

    return;
}
#endif

static VOID VfmwProc_SetCompressPara(UINT32 *p_args)
{
    UINT32 dat[5] = {p_args[0], p_args[1], p_args[2], p_args[3], p_args[4]};
    VFMW_UCC_DATA UccData;

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_COMPRESS_PARA, dat, sizeof(dat), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetClkSelect(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    if (dat >= 5)
    {
	dprint(PRN_ALWS, "g_ClkSelect set error! dat = %d not support\n", dat);
	return;
    }

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_CLK_SELECT, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static VOID VfmwProc_SetStandardObedience(UINT32 *p_args)
{
    UINT32 dat = p_args[0];
    VFMW_UCC_DATA UccData;

    dprint(PRN_ALWS, "Set standard obedience: %d\n", dat);

    VFMW_UC_Com_PrepareData(&UccData, VFMW_HID_WRITE_PROC, PROC_SET_STANDARD_OBEDIENCE, &dat, sizeof(UINT32), -1);

    if (VFMW_UC_Com_Process(&UccData) != VDEC_OK)
    {
	dprint(PRN_ALWS, "%s %d UCC Process Failed!\n", __func__, __LINE__);
    }

    return;
}

static const VFMW_PROC_COMMAND_NODE s_ProcCommandTable[] =
{
    {0X000, VfmwProc_SetPrintLevel},
    {0x002, VfmwProc_SetErrorThr},
    {0x003, VfmwProc_SetDefaultOutputOrder},
    {0x004, VfmwProc_SetDecOrderOutput},
    {0x005, VfmwProc_SetDecMode},
    {0x007, VfmwProc_SetDropStreamThr},

    {0x00b, VfmwProc_SetUSE_FF_APT_EN},
    {0x00c, VfmwProc_SetSaveFileAfterReset},
    {0X00d, VfmwProc_SetCurProcChan},

    {0x100, VfmwProc_PrintTracer},
    {0x101, VfmwProc_SetScdPrint},

    {0x200, VfmwProc_Savestream},
    {0x201, VfmwProc_SaveSeg},
    {0x202, VfmwProc_SaveYUV},
    {0x204, VfmwProc_Save1DYUV},
    {0x210, VfmwProc_SaveMetadata},
    {0x220, VfmwProc_SaveReorderMetadata},
    {0x230, VfmwProc_SaveEL},

    {0x300, VfmwProc_TestSuspend},
    {0x301, VfmwProc_TestResume},
    {0x380, VfmwProc_TestStopChan},
    {0x381, VfmwProc_TestResetChan},
    {0x382, VfmwProc_TestStartChan},
    {0x383, VfmwProc_TestRestartChan},

    {0x400, VfmwProc_TestTimeSequence},
    {0x402, VfmwProc_TestStopDec},

    {0x500, VfmwProc_SetTraceCtrl},
    {0x501, VfmwProc_SetTraceBSPeriod},
    {0x502, VfmwProc_SetTraceFramePeriod},
    {0x503, VfmwProc_SetTraceImgPeriod},
    {0x505, VfmwProc_SetSaveYuvBitWidth},

    {0x600, VfmwProc_OpenModuleLowly},
    {0x601, VfmwProc_CloseModuleLowly},
#ifdef VFMW_MODULE_LOWDLY_SUPPORT
    {0x602, VfmwProc_SetTunnelLineNumber},
#endif
    {0x603, VfmwProc_OpenScdLowdly},
    {0x604, VfmwProc_CloseScdLowdly},
    {0x605, VfmwProc_SetSedOnlyEnable},

#ifdef HI_SMMU_SUPPORT
    {0x700, VfmwProc_SetSmmuIrqEnable},
#endif
    {0x800, VfmwProc_SetCompressPara},

    {0x900, VfmwProc_SetClkSelect},
    {0x901, VfmwProc_SetStandardObedience},

    {0xffff,  NULL}, //terminal element
};


static VFMW_PROC_CMD_HANDLER VfmwProcGetHandler(UINT32 cmd)
{
    UINT32 Index = 0;
    VFMW_PROC_CMD_HANDLER pTargetHandler = NULL;

    while(1)
    {
	if (s_ProcCommandTable[Index].pHandler == NULL)
	{
	    break;
	}

	if (s_ProcCommandTable[Index].CmdName == cmd)
	{
	    pTargetHandler = s_ProcCommandTable[Index].pHandler;
	    break;
	}

	Index++;
    }

    return pTargetHandler;
}
#endif

static SINT32 VCTRL_SetDbgOption(UINT32 opt, UINT8 *p_args)
{
#ifndef	 HI_ADVCA_FUNCTION_RELEASE
    UINT32 *p32Args;
    VFMW_PROC_CMD_HANDLER pCommandHandler = NULL;

    if (p_args == NULL)
    {
	return VF_ERR_PARAM;
    }

    p32Args = (UINT32 *)p_args;

    pCommandHandler = VfmwProcGetHandler(opt);
    if (pCommandHandler == NULL)
    {
	dprint(PRN_ALWS, "Command \"%d\" not registerd!\n", opt);
	return VF_ERR_PARAM;
    }

    pCommandHandler(p32Args);

    return VF_OK;
#else
    return VF_ERR_SYS;
#endif
}

#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
SINT32 vfmw_write_proc(struct file *file, const char __user *buffer, unsigned long count, VOID *data)
#else
SINT32 vfmw_write_proc(struct file *file, const char __user *buffer, size_t count, loff_t *pos)
#endif
{
    static char cmd[256], str[256];
    SINT32 i, j;
    UINT32 dat1, dat2, dat3, dat4, dat5, dat6;
    UINT32 args[8];

    dat1 = dat2 = dat3 = dat4 = dat5 = dat6 = 0;

    if (count >= sizeof(cmd))
    {
	dprint(PRN_ALWS, "MMZ: your parameter string is too long!\n");
	return -EIO;
    }

    memset(cmd, 0, sizeof(cmd));

    if (copy_from_user(cmd, buffer, count))
    {
	dprint(PRN_ALWS, "MMZ: copy_from_user failed!\n");
	return -EIO;
    }
    cmd[count] = 0;

    /* dat1 */
    i = 0;

    GetStrFromCmd(cmd, count, &i, str);

    if (string_to_value(str, &dat1) != 0)
    {
	dprint(PRN_ALWS, "error echo cmd '%s'!\n", cmd);
	return -1;
    }

    /* dat2 */
    GetStrFromCmd(cmd, count, &i, str);

    if (string_to_value(str, &dat2) != 0)
    {
	dprint(PRN_ALWS, "error echo cmd '%s'!\n", cmd);
	return -1;
    }

    /* extra arguments */
    if (dat1 >= 0x200 && dat1 < 0x300)
    {
	if (dat1 == 0x204)
	{
	    GetStrFromCmd(cmd, count, &i, str);

	    if (string_to_value(str, &dat3) != 0)
	    {
		dprint(PRN_ALWS, "error echo cmd '%s'!\n", cmd);
		return -1;
	    }

	    GetStrFromCmd(cmd, count, &i, str);

	    if (string_to_value(str, &dat4) != 0)
	    {
		dprint(PRN_ALWS, "error echo cmd '%s'!\n", cmd);
		return -1;
	    }
	}

	j = 0;

	for (; i < count; i++)
	{
	    if (j == 0 && cmd[i] == ' ') { continue; }

	    if (cmd[i] > ' ') { str[j++] = cmd[i]; }

	    if (j > 0 && cmd[i] <= ' ') { break; }
	}

	str[j] = 0;

	if (str[0] == '/')
	{
	    if (j >= 1)
	    {
		if (str[j - 1] == '/')
		{
		    str[j - 1] = 0;
		}

		dprint(PRN_ALWS, "******* vfmw save path: %s ********\n", str);
		strncpy(s_VfmwSavePath, str, sizeof(s_VfmwSavePath));
		s_VfmwSavePath[sizeof(s_VfmwSavePath) - 1] = '\0';
	    }
	    else
	    {
		dprint(PRN_ALWS, "%s %d j < 1!!\n", __FUNCTION__, __LINE__);
		return -1;
	    }
	}
    }

    if (dat1 == 0x800)
    {
	/* dat3 */
	GetStrFromCmd(cmd, count, &i, str);

	if (string_to_value(str, &dat3) != 0)
	{
	    dprint(PRN_ALWS, "%s,%d, error echo cmd '%s'!\n", __func__, __LINE__, cmd);
	    return -1;
	}

	 /* dat4 */
	GetStrFromCmd(cmd, count, &i, str);

	if (string_to_value(str, &dat4) != 0)
	{
	    dprint(PRN_ALWS, "%s,%d, error echo cmd '%s'!\n", __func__, __LINE__, cmd);
	    return -1;
	}

	 /* dat5 */
	GetStrFromCmd(cmd, count, &i, str);

	if (string_to_value(str, &dat5) != 0)
	{
	    dprint(PRN_ALWS, "%s,%d, error echo cmd '%s'!\n", __func__, __LINE__, cmd);
	    return -1;
	}

	 /* dat6 */
	GetStrFromCmd(cmd, count, &i, str);

	if (string_to_value(str, &dat6) != 0)
	{
	    dprint(PRN_ALWS, "%s,%d, error echo cmd '%s'!\n", __func__, __LINE__, cmd);
	    return -1;
	}
    }

    dprint(PRN_ALWS, "\nvfmw debug: arg1=%#x, arg2=%#x, dat3=%#x, dat4=%#x, dat5=%#x, dat6=%#x\n", dat1, dat2, dat3, dat4, dat5, dat6);

    args[0] = dat2;
    args[1] = dat3;
    args[2] = dat4;
    args[3] = dat5;
    args[4] = dat6;
    VCTRL_SetDbgOption(dat1, (UINT8 *)args);

    return count;
}

SINT32 vfmw_proc_init(VOID)
{
#ifdef HI_VFMW_PROC_SUPPORT
    SINT32  ret;

    g_pVfmwProc = proc_mkdir("vfmw", NULL);

    ret = vfmw_proc_create(VFMW_PROC_NAME_INFO, vfmw_read_proc_info, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_HELP, vfmw_read_proc_help, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_SCD, vfmw_read_proc_scd, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_VDH, vfmw_read_proc_vdh, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_CHN, vfmw_read_proc_chn, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_STATIS, vfmw_read_proc_statis, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_DIFF, vfmw_read_proc_diff, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }

    ret = vfmw_proc_create(VFMW_PROC_NAME_FSP, vfmw_read_proc_fsp, vfmw_write_proc);
    if (0 != ret)
    {
	return -1;
    }
#endif

    return 0;
}

VOID vfmw_proc_exit(VOID)
{
#ifdef HI_VFMW_PROC_SUPPORT
    vfmw_proc_destroy_all();

    remove_proc_entry("vfmw", NULL);
#endif
}


#endif
