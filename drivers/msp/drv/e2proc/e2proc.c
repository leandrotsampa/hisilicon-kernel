/*
 * Description:
 *
 * progress
 *  |
 * bus
 *  |
 *  ----------- nim_sockets
 *  |
 * stb
 *  |
 *  ----------- audio
 *  |             |
 *  |             --------- ac3
 *  |             |
 *  |             --------- audio_delay_pcm
 *  |             |
 *  |             --------- audio_delay_bitstream
 *  |             |
 *  |             --------- ac3_choices
 *  |             |
 *  |             --------- digital_raw
 *  |
 *  ----------- video
 *  |             |
 *  |             --------- alpha
 *  |             |
 *  |             --------- aspect
 *  |             |
 *  |             --------- aspect_choices
 *  |             |
 *  |             --------- force_dvi
 *  |             |
 *  |             --------- policy
 *  |             |
 *  |             --------- policy2
 *  |             |
 *  |             --------- policy_choices
 *  |             |
 *  |             --------- videomode
 *  |             |
 *  |             --------- videomode_50hz
 *  |             |
 *  |             --------- videomode_60hz
 *  |             |
 *  |             --------- videomode_choices
 *  |             |
 *  |             --------- videomode_preferred
 *  |             |
 *  |             --------- pal_v_start
 *  |             |
 *  |             --------- pal_v_end
 *  |             |
 *  |             --------- pal_h_start
 *  |             |
 *  |             --------- pal_h_end
 *  |             |
 *  |             --------- hdmi_hdrtype
 *  |
 *  ---------- avs
 *  |           |
 *  |           --------- 0
 *  |               |
 *  |               --------- colorformat <-colorformat in generlell, hdmi and scart
 *  |               |
 *  |               --------- colorformat_choices
 *  |               |
 *  |               --------- fb <-fastblanking
 *  |               |
 *  |               --------- sb <-slowblanking
 *  |               |
 *  |               --------- volume
 *  |               |
 *  |               --------- input  <-Input, Scart VCR Input or Encoder
 *  |               |
 *  |               --------- input_choices
 *  |               |
 *  |               --------- standby
 *  |
 *  ---------- denc
 *  |           |
 *  |           --------- 0
 *  |               |
 *  |               --------- wss
 *  |               |
 *  |               ---------
 *  |               |
 *  |               ---------
 *  |
 *  ---------- fp (this is wrong used for e2 I think. on dm800 this is frontprocessor and there is another proc entry for frontend)
 *  |           |
 *  |           --------- lnb_sense1
 *  |           |
 *  |           --------- lnb_sense2
 *  |           |
 *  |           --------- led0_pattern
 *  |           |
 *  |           --------- led_pattern_speed
 *  |           |
 *  |           |
 *  |           --------- version
 *  |           |
 *  |           --------- wakeup_time <- dbox frontpanel wakeuptime
 *  |           |
 *  |           --------- was_timer_wakeup
 *  |
 *  |
 *  ---------- hdmi
 *  |           |
 *  |           --------- output
 *  |           |
 *  |           --------- bypass_edid_checking
 *  |           |
 *  |           --------- enable_hdmi_resets
 *  |           |
 *  |           --------- audio_source
 *  |           |
 *  |           ---------
 *  |
 *  ---------- info
 *  |           |
 *  |           --------- model <- Version String of out Box
 *  |           |
 *  |           --------- boxtype <- Type of your box
 *  |           |
 *  |           --------- chipset <- Version String of chipset
 *  |
 *  ---------- tsmux
 *  |           |
 *  |           --------- input0
 *  |           |
 *  |           --------- input1
 *  |           |
 *  |           --------- ci0_input
 *  |           |
 *  |           --------- ci1_input
 *  |           |
 *  |           --------- lnb_b_input
 *  |           |
 *  |           ---------
 *  |
 *  ---------- misc
 *  |           |
 *  |           --------- 12V_output
 *  |
 *  ---------- tuner (dagoberts tuner entry ;-) )
 *  |           |
 *  |           ---------
 *  |
 *  ---------- vmpeg
 *  |           |
 *  |           --------- 0/1
 *  |               |
 *  |               --------- dst_left   \
 *  |               |                     |
 *  |               --------- dst_top     |
 *  |               |                      >  PIG WINDOW SIZE AND POSITION
 *  |               --------- dst_width   |
 *  |               |                     |
 *  |               --------- dst_height /
 *  |               |
 *  |               --------- dst_all (Dagobert: Dont confuse player by setting value one after each other)
 *  |
 *  |               |TODO
 *  |               | v
 *  |               --------- yres
 *  |               |
 *  |               --------- xres
 *  |               |
 *  |               --------- framerate
 *  |               |
 *  |               --------- progressive
 *  |               |
 *  |               --------- aspect
 *
 */

#include <linux/module.h>	// included for all kernel modules
#include <linux/kernel.h>	// included for KERN_INFO
#include <linux/init.h>		// included for __init and __exit macros
#include <linux/cdev.h>
#include <linux/file.h>
#include <linux/fs.h>		// for basic filesystem
#include <linux/fcntl.h>
#include <linux/proc_fs.h>	// for the proc filesystem
#include <linux/seq_file.h>	// for sequence files
#include <linux/slab.h>
#include <linux/stat.h>		// for acces rights defines
#include <linux/string.h>
#include <linux/kallsyms.h>
#include <linux/kthread.h>
#include <linux/signal.h>
#include <linux/syscalls.h>
#include <linux/delay.h>
#include <linux/time.h>
#include <linux/types.h>
#include <linux/version.h>
#include <stdbool.h>

#include <hi_unf_disp.h>
#include <hi_drv_disp.h>
#include <hi_drv_win.h>
#include <drv_hdmi_intf.h>

#define TAGDEBUG "[e2proc] "
#define dprintk(x...) do { printk(TAGDEBUG x); } while (0)

#define cProcDir	1
#define cProcEntry	2

#define MAX_SIZE    512

struct s_proc;
typedef int (*proc_show_t)(struct seq_file *, void *);
typedef int (*proc_write_t)(struct s_proc *, const char *, size_t);

struct s_proc {
	int   type;
	char* name;
	struct proc_dir_entry* entry;
	proc_show_t show;
	proc_write_t write;
	char value[MAX_SIZE];
};

int default_proc_show(struct seq_file *m, void *v) {
	struct s_proc *sProc = (struct s_proc *)m->private;

	if (!sProc || !sProc->value)
		return -1;

	seq_printf(m, sProc->value);
	return 0;
}

int default_proc_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		temp[count] = '\0'; 

		if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		vfree(temp);
		return count;
	}

	vfree(temp);
	return -1;
}

int audio_out_mode_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		int (*HI_DRV_AO_SND_SetHdmiMode)(HI_UNF_SND_E enSound, HI_UNF_SND_OUTPUTPORT_E enOutPort, HI_UNF_SND_HDMI_MODE_E enMode);
		HI_UNF_SND_E enSound = HI_UNF_SND_0;
		HI_UNF_SND_HDMI_MODE_E enMode = HI_UNF_SND_HDMI_MODE_AUTO;
		HI_UNF_SND_OUTPUTPORT_E enOutPort = HI_UNF_SND_OUTPUTPORT_HDMI0;

		if (!(HI_DRV_AO_SND_SetHdmiMode = (void*)kallsyms_lookup_name("AO_SND_SetHdmiMode"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_AO_SND_SetHdmiMode function.\n", __FUNCTION__);
			goto out;
		}

		temp[count] = '\0';

		if (strcmp(temp, "downmix") == 0)
			enMode = HI_UNF_SND_HDMI_MODE_LPCM;
		else if (strcmp(temp, "passthrough") == 0)
			enMode = HI_UNF_SND_HDMI_MODE_RAW;
		else {
			printk("[ERROR] %s: Unknown option '%s'.\n", __FUNCTION__, temp);
			goto out;
		}

		if (HI_DRV_AO_SND_SetHdmiMode(enSound, enOutPort, enMode) != HI_SUCCESS) {
			printk("[ERROR] %s: Failed to Set HDMI Mode.\n", __FUNCTION__);
			goto out;
		}

		if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

int video_aspect_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		int (*HI_DRV_DISP_SetAspectRatio)(HI_DRV_DISPLAY_E enDisp, HI_U32 u32Ratio_h, HI_U32 u32Ratio_v);
		HI_U32 u32Ratio_h = 0;
		HI_U32 u32Ratio_v = 0;

		if (!(HI_DRV_DISP_SetAspectRatio = (void*)kallsyms_lookup_name("DISP_SetAspectRatio"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_DISP_SetAspectRatio function.\n", __FUNCTION__);
			goto out;
		}

		temp[count] = '\0';

		if (strcmp(temp, "4:3") == 0) {
			u32Ratio_h = 4;
			u32Ratio_v = 3;
		} else if (strcmp(temp, "16:9") == 0) {
			u32Ratio_h = 16;
			u32Ratio_v = 9;
		} else if (strcmp(temp, "221:1") == 0) {
			u32Ratio_h = 221;
			u32Ratio_v = 100;
		} else {
			printk("[ERROR] %s: Unknown option '%s'.\n", __FUNCTION__, temp);
			goto out;
		}

		if (HI_DRV_DISP_SetAspectRatio(HI_DRV_DISPLAY_1, u32Ratio_h, u32Ratio_v) != HI_SUCCESS) {
			printk("[ERROR] %s: Failed to Set Aspect Ratio.\n", __FUNCTION__);
			goto out;
		}

		if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

int video_mode_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		int (*HI_DRV_DISP_GetFormat)(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_STEREO_MODE_E* penStereo, HI_DRV_DISP_FMT_E* penEncFmt);
		int (*HI_DRV_DISP_SetFormat)(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_STEREO_MODE_E enStereo, HI_DRV_DISP_FMT_E enEncFmt);
		HI_DRV_DISP_FMT_E cmp;
		HI_DRV_DISP_FMT_E fmt;
		HI_DRV_DISP_STEREO_MODE_E enStereo;
		HI_DRV_DISP_FMT_E fmtsd = HI_DRV_DISP_FMT_PAL;

		if (!(HI_DRV_DISP_GetFormat = (void*)kallsyms_lookup_name("DISP_GetFormat"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_DISP_GetFormat function.\n", __FUNCTION__);
			goto out;
		}
		if (!(HI_DRV_DISP_SetFormat = (void*)kallsyms_lookup_name("DISP_SetFormat"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_DISP_SetFormat function.\n", __FUNCTION__);
			goto out;
		}

		temp[count] = '\0';

		if (strcmp("ntsc", temp) == 0) { /* NTSC */
			fmt = HI_DRV_DISP_FMT_NTSC;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("480p", temp) == 0 || strcmp("480p60", temp) == 0) { /* 480p 60 Hz */
			fmt = HI_DRV_DISP_FMT_480P_60;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("pal", temp) == 0) /* PAL */
			fmt = HI_DRV_DISP_FMT_PAL;
		else if (strcmp("576p", temp) == 0 || strcmp("576p50", temp) == 0) /* 576p 50 Hz */
			fmt = HI_DRV_DISP_FMT_576P_50;
		else if (strcmp("720p", temp) == 0 || strcmp("720p60", temp) == 0) { /* 720p 60 Hz */
			fmt = HI_DRV_DISP_FMT_720P_60;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("720p50", temp) == 0) /* 720p 50 Hz */
			fmt = HI_DRV_DISP_FMT_720P_50;
		else if (strcmp("720p59", temp) == 0) /* 720p 59.94 Hz */
			fmt = HI_DRV_DISP_FMT_720P_59_94;
		else if (strcmp("1080p", temp) == 0 || strcmp("1080p60", temp) == 0) { /* 1080p 60 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_60;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("1080p23", temp) == 0) /* 1080p 23.976 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_23_976;
		else if (strcmp("1080p24", temp) == 0) /* 1080p 24 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_24;
		else if (strcmp("1080p25", temp) == 0) /* 1080p 25 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_25;
		else if (strcmp("1080p29", temp) == 0) /* 1080p 29.97 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_29_97;
		else if (strcmp("1080p30", temp) == 0) { /* 1080p 30 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_30;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("1080p50", temp) == 0) /* 1080p 50 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_50;
		else if (strcmp("1080p59", temp) == 0) /* 1080p 59.94 Hz */
			fmt = HI_DRV_DISP_FMT_1080P_59_94;
		else if (strcmp("1080i", temp) == 0 || strcmp("1080i60", temp) == 0) { /* 1080i 60 Hz */
			fmt = HI_DRV_DISP_FMT_1080i_60;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("1080i50", temp) == 0) /* 1080i 50 Hz */
			fmt = HI_DRV_DISP_FMT_1080i_50;
		else if (strcmp("1080i59", temp) == 0) /* 1080i 59.94 Hz */
			fmt = HI_DRV_DISP_FMT_1080i_59_94;
		else if (strcmp("2160p", temp) == 0 || strcmp("2160p60", temp) == 0) { /* 2160p 60 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_60;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("2160p23", temp) == 0) /* 2160p 23.976 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_23_976;
		else if (strcmp("2160p24", temp) == 0) { /* 2160p 24 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_24;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("2160p25", temp) == 0) /* 2160p 25 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_25;
		else if (strcmp("2160p29", temp) == 0) /* 2160p 29.97 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_29_97;
		else if (strcmp("2160p30", temp) == 0) { /* 2160p 30 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_30;
			fmtsd = HI_DRV_DISP_FMT_NTSC;
		}
		else if (strcmp("2160p50", temp) == 0) /* 2160p 50 Hz */
			fmt = HI_DRV_DISP_FMT_3840X2160_50;
		else {
			printk("[ERROR] %s: Unknown option '%s'.\n", __FUNCTION__, temp);
			goto out;
		}

		/** HD **/
		if (HI_DRV_DISP_GetFormat(HI_DRV_DISPLAY_1, &enStereo, &cmp) == HI_SUCCESS) {
			if (cmp != fmt)
				if (HI_DRV_DISP_SetFormat(HI_DRV_DISPLAY_1, HI_DRV_DISP_STEREO_NONE, fmt) != HI_SUCCESS) {
					printk("[ERROR] %s: Failed to Set HD Format.\n", __FUNCTION__);
					goto out;
				}
		} else {
			printk("[ERROR] %s: Failed to Get HD Format.\n", __FUNCTION__);
			goto out;
		}

		/** SD **/
		if (HI_DRV_DISP_GetFormat(HI_DRV_DISPLAY_0, &enStereo, &cmp) == HI_SUCCESS) {
			if (cmp != fmtsd)
				if (HI_DRV_DISP_SetFormat(HI_DRV_DISPLAY_0, HI_DRV_DISP_STEREO_NONE, fmtsd) != HI_SUCCESS)
					printk("[ERROR] %s: Failed to Set SD Format.\n", __FUNCTION__);
		}
		else
			printk("[ERROR] %s: Failed to Get SD Format.\n", __FUNCTION__);

		if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		strcat(proc->value, "\n");
		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

static HI_UNF_EDID_BASE_INFO_S stSinkAttr;
int video_hdmi_hdrtype_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		HI_DRV_DISP_OUT_TYPE_E dType, oType = HI_DRV_DISP_TYPE_NORMAL;
		int (*HI_DRV_DISP_GetDispOutput)(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_OUT_TYPE_E *penDispType);
		int (*HI_DRV_DISP_SetDispOutput)(HI_DRV_DISPLAY_E enDisp, const HI_DRV_DISP_OUT_TYPE_E enDispType);

		if (!(HI_DRV_DISP_GetDispOutput = (void*)kallsyms_lookup_name("DISP_GetDispOutput"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_DISP_GetDispOutput function.\n", __FUNCTION__);
			goto out;
		}
		if (!(HI_DRV_DISP_SetDispOutput = (void*)kallsyms_lookup_name("DISP_SetDispOutput"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_DISP_SetDispOutput function.\n", __FUNCTION__);
			goto out;
		}

		temp[count] = '\0';

		if (strcmp(temp, "auto") == 0) {
			int (*HI_DRV_HDMI_GetSinkCapability)(HI_UNF_HDMI_ID_E enHdmi, HI_UNF_EDID_BASE_INFO_S *pstSinkCap);

			if (!(HI_DRV_HDMI_GetSinkCapability = (void*)kallsyms_lookup_name("HI_DRV_HDMI_GetSinkCapability"))) {
				printk("[ERROR] %s: Failed to load HI_DRV_HDMI_GetSinkCapability function.\n", __FUNCTION__);
				goto out;
			}

			memset(&stSinkAttr, 0, sizeof(HI_UNF_EDID_BASE_INFO_S));
			if (HI_DRV_HDMI_GetSinkCapability(HI_UNF_HDMI_ID_0, &stSinkAttr) == HI_SUCCESS) {
				if (stSinkAttr.bDolbySupport == HI_TRUE)
					oType = HI_DRV_DISP_TYPE_DOLBY;
				else if (stSinkAttr.bHdrSupport == HI_TRUE)
					oType = HI_DRV_DISP_TYPE_HDR10;
			} else {
				printk("[ERROR] %s: Failed to get HDMI attributes, keep current mode.\n", __FUNCTION__);
				goto out;
			}
		}
		else if (strcmp(temp, "dolby") == 0)
			oType = HI_DRV_DISP_TYPE_DOLBY;
		else if (strcmp(temp, "hdr10") == 0)
			oType = HI_DRV_DISP_TYPE_HDR10;

		if (HI_DRV_DISP_GetDispOutput(HI_DRV_DISPLAY_1, &dType) != HI_SUCCESS) {
			printk("[ERROR] %s: Failed to Get Display HDR Type %s.\n", __FUNCTION__, temp);
			goto out;
		}
		if (dType != oType)
			if (HI_DRV_DISP_SetDispOutput(HI_DRV_DISPLAY_1, oType) != HI_SUCCESS) {
				printk("[ERROR] %s: Failed to Set Display HDR Type %s.\n", __FUNCTION__, temp);
				goto out;
			}

		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

enum DISPLAY_SIDE {
	DISP_LEFT,
	DISP_TOP,
	DISP_WIDTH,
	DISP_HEIGHT,
	DISP_APPLY,
};

static struct t_vmpeg_config {
	HI_U32 X;
	HI_U32 Y;
	HI_U32 Width;
	HI_U32 Height;
} cvmpeg = {0, 0, 0, 0};

#define WINDOW_HANDLE (((HI_U32)HI_ID_VO << 16) | (HI_DRV_DISPLAY_1 << 8) | 0 /* WIN_ID */)

int vmpeg_0_write(struct s_proc *proc, enum DISPLAY_SIDE side, const char *buf, size_t count) {
	char *temp;
	HI_U32 value;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		temp[count] = '\0';
		value = (HI_U32)simple_strtol(temp, NULL, 10);

		switch (side) {
			case DISP_LEFT:
				cvmpeg.X = value;
			break;
			case DISP_TOP:
				cvmpeg.Y = value;
			break;
			case DISP_WIDTH:
				cvmpeg.Width = value;
			break;
			case DISP_HEIGHT:
				cvmpeg.Height = value;
			break;
			case DISP_APPLY:
			{
				HI_DRV_WIN_ATTR_S sWinAttr;
				int (*HI_MPI_WIN_GetAttr)(HI_HANDLE hWin, HI_DRV_WIN_ATTR_S *pWinAttr);
				int (*HI_MPI_WIN_SetAttr)(HI_HANDLE hWin, HI_DRV_WIN_ATTR_S *pWinAttr);

				if (cvmpeg.Width < 1 || cvmpeg.Height < 1)
					goto out;
				if (!(HI_MPI_WIN_GetAttr = (void*)kallsyms_lookup_name("HI_DRV_WIN_GetAttr"))) {
					printk("[ERROR] %s: Failed to load HI_MPI_WIN_GetAttr function.\n", __FUNCTION__);
					goto out;
				}
				if (!(HI_MPI_WIN_SetAttr = (void*)kallsyms_lookup_name("HI_DRV_WIN_SetAttr"))) {
					printk("[ERROR] %s: Failed to load HI_MPI_WIN_SetAttr function.\n", __FUNCTION__);
					goto out;
				}

				if (HI_MPI_WIN_GetAttr(WINDOW_HANDLE, &sWinAttr) == HI_SUCCESS) {
					if (value == 1) {
						sWinAttr.stOutRect.s32X     = cvmpeg.X * 1280 / 720;
						sWinAttr.stOutRect.s32Y     = cvmpeg.Y * 720 / 576;
						sWinAttr.stOutRect.s32Width = cvmpeg.Width * 1280 / 720;
						sWinAttr.stOutRect.s32Height= cvmpeg.Height * 720 / 576;

						if (sWinAttr.stOutRect.s32Width > 0 && sWinAttr.stOutRect.s32Height > 0) {
							if (HI_MPI_WIN_SetAttr(WINDOW_HANDLE, &sWinAttr) != HI_SUCCESS) {
								printk("[ERROR] %s: Failed to Set Window Attribute (%d, %d, %d, %d).\n", __FUNCTION__, sWinAttr.stOutRect.s32X, sWinAttr.stOutRect.s32Y, sWinAttr.stOutRect.s32Width, sWinAttr.stOutRect.s32Height);
								goto out;
							}
						}
					}
				} else {
					printk("[ERROR] %s: Failed to Get Window Attribute.\n", __FUNCTION__);
					goto out;
				}
			}
			break;
		};

		if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

int vmpeg_0_dst_apply_write(struct s_proc *proc, const char *buf, size_t count) {
	return vmpeg_0_write(proc, DISP_APPLY, buf, count);
}

int vmpeg_0_dst_left_write(struct s_proc *proc, const char *buf, size_t count) {
	return vmpeg_0_write(proc, DISP_LEFT, buf, count);
}

int vmpeg_0_dst_top_write(struct s_proc *proc, const char *buf, size_t count) {
	return vmpeg_0_write(proc, DISP_TOP, buf, count);
}

int vmpeg_0_dst_width_write(struct s_proc *proc, const char *buf, size_t count) {
	return vmpeg_0_write(proc, DISP_WIDTH, buf, count);
}

int vmpeg_0_dst_height_write(struct s_proc *proc, const char *buf, size_t count) {
	return vmpeg_0_write(proc, DISP_HEIGHT, buf, count);
}

int hdmi_output_write(struct s_proc *proc, const char *buf, size_t count) {
	char *temp;
	count= (count > MAX_SIZE ? MAX_SIZE : count);
	temp = vmalloc(count);

	if (!temp)
		return -1;

	if (!copy_from_user(temp, buf, count)) {
		int status;
		int (*HI_DRV_HDMI_Start)(HDMI_DEVICE_S* pstHdmiDev);
		int (*HI_DRV_HDMI_Stop) (HDMI_DEVICE_S* pstHdmiDev);
		HDMI_DEVICE_S *(*HI_DRV_HDMI_GetDevice)(HDMI_DEVICE_ID_E enHdmiID);
		HDMI_DEVICE_S *hDev;

		if (!(HI_DRV_HDMI_GetDevice = (void*)kallsyms_lookup_name("GetHdmiDevice"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_HDMI_GetDevice function.\n", __FUNCTION__);
			goto out;
		}
		if (!(HI_DRV_HDMI_Start = (void*)kallsyms_lookup_name("DRV_HDMI_Start"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_HDMI_Start function.\n", __FUNCTION__);
			goto out;
		}
		if (!(HI_DRV_HDMI_Stop = (void*)kallsyms_lookup_name("DRV_HDMI_Stop"))) {
			printk("[ERROR] %s: Failed to load HI_DRV_HDMI_Stop function.\n", __FUNCTION__);
			goto out;
		}

		temp[count] = '\0';
		hDev = HI_DRV_HDMI_GetDevice(HI_UNF_HDMI_ID_0);

		if (strcmp(temp, "on") == 0)
			status = HI_DRV_HDMI_Start(hDev);
		else if (strcmp(temp, "off") == 0)
			status = HI_DRV_HDMI_Stop(hDev);
		else {
			printk("[ERROR] %s: Unknown option '%s'.\n", __FUNCTION__, temp);
			goto out;
		}

		if (status != HI_SUCCESS)
			goto out;
		else if (strcmp(proc->value, temp) == 0) {
			vfree(temp);
			return count;
		}

		strcpy(proc->value, temp);
		vfree(temp);
		return count;
	}

out:
	vfree(temp);
	return -1;
}

struct s_proc e2Proc[] = {
	{cProcEntry, "progress"                                                         , NULL, default_proc_show, default_proc_write, ""},

	{cProcEntry, "bus/nim_sockets"                                                  , NULL, default_proc_show, NULL, ""},
	{cProcDir  , "stb"                                                              , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/audio"                                                        , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/audio/aac"                                                    , NULL, default_proc_show, audio_out_mode_write, "downmix"},
	{cProcEntry, "stb/audio/ac3"                                                    , NULL, default_proc_show, audio_out_mode_write, "downmix"},
	{cProcEntry, "stb/audio/audio_delay_pcm"                                        , NULL, default_proc_show, default_proc_write, "0"},
	{cProcEntry, "stb/audio/audio_delay_bitstream"                                  , NULL, default_proc_show, default_proc_write, "0"},
//	{cProcEntry, "stb/audio/j1_mute"                                                , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/audio/aac_choices"                                            , NULL, default_proc_show, NULL, "downmix passthrough\n"},
	{cProcEntry, "stb/audio/ac3_choices"                                            , NULL, default_proc_show, NULL, "downmix passthrough\n"},
	{cProcEntry, "stb/audio/digital_raw"                                            , NULL, default_proc_show, audio_out_mode_write, "downmix"},

	{cProcDir  , "stb/info"                                                         , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/info/model"                                                   , NULL, default_proc_show, NULL, "pixel\n"},
	{cProcEntry, "stb/info/boxtype"                                                 , NULL, default_proc_show, NULL, "hisilicon\n"},
	{cProcEntry, "stb/info/chipset"                                                 , NULL, default_proc_show, NULL, "hi3798cv200\n"},

	{cProcDir  , "stb/video"                                                        , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/video/alpha"                                                  , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/video/aspect"                                                 , NULL, default_proc_show, video_aspect_write, ""},
	{cProcEntry, "stb/video/aspect_choices"                                         , NULL, default_proc_show, NULL, "any 4:3 16:9 221:1\n"},
//	{cProcEntry, "stb/video/force_dvi"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/video/policy"                                                 , NULL, default_proc_show, default_proc_write, "bestfit"},
	{cProcEntry, "stb/video/policy2"                                                , NULL, default_proc_show, default_proc_write, "panscan"},
	{cProcEntry, "stb/video/policy_choices"                                         , NULL, default_proc_show, default_proc_write, "panscan letterbox bestfit\n"},
	{cProcEntry, "stb/video/videomode"                                              , NULL, default_proc_show, video_mode_write, "720p\n"},
//	{cProcEntry, "stb/video/videomode_50hz"                                         , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/video/videomode_60hz"                                         , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/video/videomode_choices"                                      , NULL, default_proc_show, NULL, "pal ntsc 480p 576p 720p50 720p59 720p 1080p23 1080p24 1080p25 1080p29 1080p30 1080p50 1080p59 1080p 1080i50 1080i59 1080i 2160p23 2160p24 2160p25 2160p29 2160p30 2160p50 2160p\n"},
	{cProcEntry, "stb/video/videomode_preferred"                                    , NULL, default_proc_show, default_proc_write, "720p"},
//	{cProcEntry, "stb/video/pal_v_start"                                            , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/video/pal_v_end"                                              , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/video/pal_h_start"                                            , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/video/pal_h_end"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/video/hdmi_hdrtype"                                           , NULL, default_proc_show, video_hdmi_hdrtype_write, "auto dolby hdr10 none\n"},

	{cProcDir  , "stb/avs"                                                          , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/avs/0"                                                        , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/avs/0/colorformat"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/avs/0/colorformat_choices"                                    , NULL, default_proc_show, NULL, "cvbs rgb yuv\n"},
//	{cProcEntry, "stb/avs/0/fb"                                                     , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/avs/0/input"                                                  , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/avs/0/sb"                                                     , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/avs/0/volume"                                                 , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/avs/0/input_choices"                                          , NULL, default_proc_show, NULL, "encoder aux\n"},
//	{cProcEntry, "stb/avs/0/standby"                                                , NULL, default_proc_show, default_proc_write, ""},

	{cProcDir  , "stb/denc"                                                         , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/denc/0"                                                       , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/denc/0/wss"                                                   , NULL, default_proc_show, default_proc_write, ""},

	{cProcDir  , "stb/encoder"                                                      , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/encoder/0"                                                    , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/encoder/0/decoder"                                            , NULL, default_proc_show, NULL, "0"},
	{cProcEntry, "stb/encoder/0/bitrate"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/width"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/height"                                             , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/framerate"                                          , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/interlaced"                                         , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/aspectratio"                                        , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/vcodec_choices"                                     , NULL, default_proc_show, NULL, "h264\n"},
	{cProcEntry, "stb/encoder/0/vcodec"                                             , NULL, default_proc_show, default_proc_write, "h264"},
	{cProcEntry, "stb/encoder/0/acodec_choices"                                     , NULL, default_proc_show, NULL, "aac\n"},
	{cProcEntry, "stb/encoder/0/acodec"                                             , NULL, default_proc_show, default_proc_write, "aac"},
	{cProcEntry, "stb/encoder/0/apply"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/display_format"                                     , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/0/profile"                                            , NULL, default_proc_show, default_proc_write, "baseline"},
	{cProcDir  , "stb/encoder/1"                                                    , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/encoder/1/decoder"                                            , NULL, default_proc_show, NULL, "1"},
	{cProcEntry, "stb/encoder/1/bitrate"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/width"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/height"                                             , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/framerate"                                          , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/interlaced"                                         , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/aspectratio"                                        , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/vcodec_choices"                                     , NULL, default_proc_show, NULL, "h264\n"},
	{cProcEntry, "stb/encoder/1/vcodec"                                             , NULL, default_proc_show, default_proc_write, "h264"},
	{cProcEntry, "stb/encoder/1/acodec_choices"                                     , NULL, default_proc_show, NULL, "aac\n"},
	{cProcEntry, "stb/encoder/1/acodec"                                             , NULL, default_proc_show, default_proc_write, "aac"},
	{cProcEntry, "stb/encoder/1/apply"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/display_format"                                     , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/1/profile"                                            , NULL, default_proc_show, default_proc_write, "baseline"},
	{cProcDir  , "stb/encoder/2"                                                    , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/encoder/2/decoder"                                            , NULL, default_proc_show, NULL, "2"},
	{cProcEntry, "stb/encoder/2/bitrate"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/width"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/height"                                             , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/framerate"                                          , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/interlaced"                                         , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/aspectratio"                                        , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/vcodec_choices"                                     , NULL, default_proc_show, NULL, "h264\n"},
	{cProcEntry, "stb/encoder/2/vcodec"                                             , NULL, default_proc_show, default_proc_write, "h264"},
	{cProcEntry, "stb/encoder/2/acodec_choices"                                     , NULL, default_proc_show, NULL, "aac\n"},
	{cProcEntry, "stb/encoder/2/acodec"                                             , NULL, default_proc_show, default_proc_write, "aac"},
	{cProcEntry, "stb/encoder/2/apply"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/display_format"                                     , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/encoder/2/profile"                                            , NULL, default_proc_show, default_proc_write, "baseline"},

//	{cProcDir  , "stb/fp"                                                           , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/fp/lnb_sense1"                                                , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/fp/lnb_sense2"                                                , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/fp/led0_pattern"                                              , NULL, NULL, default_proc_write, ""},
//	{cProcEntry, "stb/fp/led_pattern_speed"                                         , NULL, NULL, default_proc_write, ""},
//	{cProcEntry, "stb/fp/version"                                                   , NULL, default_proc_show, NULL, "0\n"},
//	{cProcEntry, "stb/fp/wakeup_time"                                               , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/fp/was_timer_wakeup"                                          , NULL, default_proc_show, NULL, ""},
//	{cProcEntry, "stb/fp/rtc"                                                       , NULL, default_proc_show, default_proc_write, "0"},

	{cProcDir  , "stb/frontend"                                                     , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/frontend/0"                                                   , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/frontend/0/active_antenna_power"                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/frontend/0/lnb_sense"                                         , NULL, default_proc_show, default_proc_write, ""},

	{cProcDir  , "stb/tsmux"                                                        , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/tsmux/input0"                                                 , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/tsmux/input1"                                                 , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/tsmux/ci0_input"                                              , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/tsmux/ci1_input"                                              , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/tsmux/lnb_b_input"                                            , NULL, default_proc_show, default_proc_write, ""},

//	{cProcDir  , "stb/misc"                                                         , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/misc/12V_output"                                              , NULL, NULL, NULL, ""},

	{cProcDir  , "stb/vmpeg"                                                        , NULL, NULL, NULL, ""},
	{cProcDir  , "stb/vmpeg/0"                                                      , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/vmpeg/0/dst_apply"                                            , NULL, default_proc_show, vmpeg_0_dst_apply_write, ""},
	{cProcEntry, "stb/vmpeg/0/dst_left"                                             , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},
	{cProcEntry, "stb/vmpeg/0/dst_top"                                              , NULL, default_proc_show, vmpeg_0_dst_top_write, ""},
	{cProcEntry, "stb/vmpeg/0/dst_width"                                            , NULL, default_proc_show, vmpeg_0_dst_width_write, ""},
	{cProcEntry, "stb/vmpeg/0/dst_height"                                           , NULL, default_proc_show, vmpeg_0_dst_height_write, ""},
//	{cProcEntry, "stb/vmpeg/0/dst_all"                                              , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},
//	{cProcEntry, "stb/vmpeg/0/yres"                                                 , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},
//	{cProcEntry, "stb/vmpeg/0/xres"                                                 , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},
//	{cProcEntry, "stb/vmpeg/0/aspect"                                               , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},
//	{cProcEntry, "stb/vmpeg/0/framerate"                                            , NULL, default_proc_show, vmpeg_0_dst_left_write, ""},

	{cProcDir  , "stb/vmpeg/1"                                                      , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/vmpeg/1/dst_apply"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/vmpeg/1/dst_left"                                             , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/vmpeg/1/dst_top"                                              , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/vmpeg/1/dst_width"                                            , NULL, default_proc_show, default_proc_write, ""},
	{cProcEntry, "stb/vmpeg/1/dst_height"                                           , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/vmpeg/1/dst_all"                                              , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/vmpeg/1/yres"                                                 , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/vmpeg/1/xres"                                                 , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/vmpeg/1/aspect"                                               , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/vmpeg/1/framerate"                                            , NULL, default_proc_show, default_proc_write, ""},

	{cProcDir  , "stb/hdmi"                                                         , NULL, NULL, NULL, ""},
	{cProcEntry, "stb/hdmi/output"                                                  , NULL, default_proc_show, hdmi_output_write, "on"},
//	{cProcEntry, "stb/hdmi/bypass_edid_checking"                                    , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/hdmi/enable_hdmi_resets"                                      , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/hdmi/audio_source"                                            , NULL, default_proc_show, default_proc_write, ""},
//	{cProcEntry, "stb/hdmi/audio_source_choices"                                    , NULL, default_proc_show, default_proc_write, ""},

//	{cProcDir,   "stb/stream"                                                       , NULL, NULL, NULL, ""},
//	{cProcDir,   "stb/stream/policy"                                                , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/stream/policy/AV_SYNC"                                        , NULL, default_proc_show, default_proc_write, "AV_SYNC"},
//	{cProcEntry, "stb/stream/policy/TRICK_MODE_AUDIO"                               , NULL, default_proc_show, default_proc_write, "TRICK_MODE_AUDIO"},
//	{cProcEntry, "stb/stream/policy/PLAY_24FPS_VIDEO_AT_25FPS"                      , NULL, default_proc_show, default_proc_write, "PLAY_24FPS_VIDEO_AT_25FPS"},
//	{cProcEntry, "stb/stream/policy/MASTER_CLOCK"                                   , NULL, default_proc_show, default_proc_write, "MASTER_CLOCK"},
//	{cProcEntry, "stb/stream/policy/EXTERNAL_TIME_MAPPING"                          , NULL, default_proc_show, default_proc_write, "EXTERNAL_TIME_MAPPING"},
//	{cProcEntry, "stb/stream/policy/DISPLAY_FIRST_FRAME_EARLY"                      , NULL, default_proc_show, default_proc_write, "DISPLAY_FIRST_FRAME_EARLY"},
//	{cProcEntry, "stb/stream/policy/STREAM_ONLY_KEY_FRAMES"                         , NULL, default_proc_show, default_proc_write, "STREAM_ONLY_KEY_FRAMES"},
//	{cProcEntry, "stb/stream/policy/STREAM_SINGLE_GROUP_BETWEEN_DISCONTINUITIES"    , NULL, default_proc_show, default_proc_write, "STREAM_SINGLE_GROUP_BETWEEN_DISCONTINUITIES"},
//	{cProcEntry, "stb/stream/policy/PLAYOUT_ON_TERMINATE"                           , NULL, default_proc_show, default_proc_write, "PLAYOUT_ON_TERMINATE"},
//	{cProcEntry, "stb/stream/policy/PLAYOUT_ON_SWITCH"                              , NULL, default_proc_show, default_proc_write, "PLAYOUT_ON_SWITCH"},
//	{cProcEntry, "stb/stream/policy/PLAYOUT_ON_DRAIN"                               , NULL, default_proc_show, default_proc_write, "PLAYOUT_ON_DRAIN"},
//	{cProcEntry, "stb/stream/policy/TRICK_MODE_DOMAIN"                              , NULL, default_proc_show, default_proc_write, "TRICK_MODE_DOMAIN"},
//	{cProcEntry, "stb/stream/policy/DISCARD_LATE_FRAMES"                            , NULL, default_proc_show, default_proc_write, "DISCARD_LATE_FRAMES"},
//	{cProcEntry, "stb/stream/policy/REBASE_ON_DATA_DELIVERY_LATE"                   , NULL, default_proc_show, default_proc_write, "REBASE_ON_DATA_DELIVERY_LATE"},
//	{cProcEntry, "stb/stream/policy/REBASE_ON_FRAME_DECODE_LATE"                    , NULL, default_proc_show, default_proc_write, "REBASE_ON_FRAME_DECODE_LATE"},
//	{cProcEntry, "stb/stream/policy/LOWER_CODEC_DECODE_LIMITS_ON_FRAME_DECODE_LATE" , NULL, default_proc_show, default_proc_write, "LOWER_CODEC_DECODE_LIMITS_ON_FRAME_DECODE_LATE"},
//	{cProcEntry, "stb/stream/policy/H264_ALLOW_NON_IDR_RESYNCHRONIZATION"           , NULL, default_proc_show, default_proc_write, "H264_ALLOW_NON_IDR_RESYNCHRONIZATION"},
//	{cProcEntry, "stb/stream/policy/MPEG2_IGNORE_PROGESSIVE_FRAME_FLAG"             , NULL, default_proc_show, default_proc_write, "MPEG2_IGNORE_PROGESSIVE_FRAME_FLAG"},

//	{cProcDir,   "stb/video/plane"   	           , NULL, NULL, NULL, ""},
//	{cProcEntry, "stb/video/plane/psi_brightness"  , NULL, default_proc_show, default_proc_write, "psi_brightness"},
//	{cProcEntry, "stb/video/plane/psi_saturation"  , NULL, default_proc_show, default_proc_write, "psi_saturation"},
//	{cProcEntry, "stb/video/plane/psi_contrast"    , NULL, default_proc_show, default_proc_write, "psi_saturation"},
//	{cProcEntry, "stb/video/plane/psi_tint"        , NULL, default_proc_show, default_proc_write, "psi_tint"}
};

struct proc_dir_entry *find_proc_dir(char *name) {
	int i;

	for (i = 0; i < sizeof(e2Proc) / sizeof(e2Proc[0]); i++) {
		if ((e2Proc[i].type == cProcDir) && (strcmp(name, e2Proc[i].name) == 0))
			return e2Proc[i].entry;
	}

	return NULL;
}

/* the function returns the directry name */
char *dirname(char *name) {
	int i = 0;
	int pos = 0;
	static char path[100];

	while ((name[i] != 0) && (i < sizeof(path))) {
		if (name[i] == '/')
			pos = i;
		path[i] = name[i];
		i++;
	}

	path[i] = 0;
	path[pos] = 0;

	return path;
}

/* the function returns the base name */
char *basename(char *name) {
	int i = 0;
	int pos = 0;

	while (name[i] != 0) {
		if (name[i] == '/')
			pos = i;
		i++;
	}

	if (name[pos] == '/')
		pos++;

	return name + pos;
}

int call_proc_open(struct inode *inode, struct file *file) {
#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
	struct s_proc *sProc = PDE(file->f_dentry->d_inode)->data;
#elif LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
	struct s_proc *sProc = PDE_DATA(file->f_dentry->d_inode);
#else
	struct s_proc *sProc = PDE_DATA(file->f_path.dentry->d_inode);
#endif

	if (!sProc || !sProc->show)
		return -1;

	return single_open(file, sProc->show, sProc);
}

int call_proc_write(struct file *file, const char *buf, size_t count, loff_t *offset) {
#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
	struct s_proc *sProc = PDE(file->f_dentry->d_inode)->data;
#elif LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
	struct s_proc *sProc = PDE_DATA(file->f_dentry->d_inode);
#else
	struct s_proc *sProc = PDE_DATA(file->f_path.dentry->d_inode);
#endif

	if (!sProc || !sProc->write)
		return -1;

	return sProc->write(sProc, buf, count);
}

static const struct file_operations operations = {
    .owner      = THIS_MODULE,
    .open       = call_proc_open,
    .read       = seq_read,
    .write      = call_proc_write, 
    .llseek     = seq_lseek,
    .release    = single_release,
};

bool e2proc_set_value(char *name, char *value) {
	int i;

	for (i = 0; i < sizeof(e2Proc) / sizeof(e2Proc[0]); i++) {
		if (strcmp(e2Proc[i].name, name) == 0) {
			strcpy(e2Proc[i].value, value);
			strcat(e2Proc[i].value, "\n");
			return true;
		}
	}

	return false;
}

static int __init e2proc_init(void) {
	int i;
	char *name;
	char *path;

	for (i = 0; i < sizeof(e2Proc) / sizeof(e2Proc[0]); i++) {
		path = dirname(e2Proc[i].name);
		name = basename(e2Proc[i].name);

		switch (e2Proc[i].type) {
			case cProcDir:
				e2Proc[i].entry = proc_mkdir(name, find_proc_dir(path));

				if (e2Proc[i].entry == NULL)
					printk("[ERROR] Could not create entry %s\n", e2Proc[i].name);
			break;
			case cProcEntry:
				e2Proc[i].entry = proc_create_data((strcmp(path, "bus") == 0) ? e2Proc[i].name : name, (S_IRUGO | S_IWUGO), find_proc_dir(path), &operations, &e2Proc[i]);

				if (e2Proc[i].entry == NULL)
					printk("[ERROR] Could not create entry %s\n", e2Proc[i].name);
			break;
			default:
				printk("[ERROR] Invalid type %d\n", e2Proc[i].type);
		}
	}

	if (!e2proc_set_value("stb/info/model", "hisilicon"))
		dprintk("[ERROR] Failed to set info model.\n");
	if (!e2proc_set_value("stb/info/chipset", HI_CHIP_TYPE))
		dprintk("[ERROR] Failed to set info chipset.\n");

	return 0;
}

static void __exit e2proc_exit(void) {
	int i;
	char *name;
	char *path;

	for (i = sizeof(e2Proc)/sizeof(e2Proc[0]) - 1; i >= 0; i--) {
		path = dirname(e2Proc[i].name);
		name = basename(e2Proc[i].name);
		remove_proc_entry((strcmp(path, "bus") == 0) ? e2Proc[i].name : name, find_proc_dir(path));
	}
}

late_initcall_sync(e2proc_init);
module_exit(e2proc_exit);

MODULE_DESCRIPTION("E2Proc module for HiSilicon STB hardware");
MODULE_AUTHOR("Leandro Tavares de Melo <leandrotsampa@yahoo.com.br>");
MODULE_LICENSE("GPL");