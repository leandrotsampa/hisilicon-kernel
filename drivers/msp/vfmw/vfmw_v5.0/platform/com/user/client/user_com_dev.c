
#include "hi_drv_dev.h"

#include "vfmw_log.h"
#include "user_com_dev.h"
#include "user_com_dev_ext.h"
#include "user_common_type.h"
#include "user_client_com.h"
#include "vfmw_linux_kernel_osal.h"

#define MAX_VERSION_STR 50

static long VFMW_DRV_Ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
static SINT32 VFMW_DRV_Open(struct inode* inode, struct file* filp);
static SINT32 VFMW_DRV_Close(struct inode* inode, struct file* filp);
static UINT32 g_VfmwOpenCount = 0;
DEFINE_SEMAPHORE(g_OpenCountMutex);

static UMAP_DEVICE_S	VfmwDev;
static struct file_operations VfmwFileOpts =
{
    .owner	    = THIS_MODULE,
    .open	    = VFMW_DRV_Open,
    .unlocked_ioctl = VFMW_DRV_Ioctl,/*user space and kernel space same with 32 bit or 64 bit run this function*/
#ifdef CONFIG_COMPAT
    .compat_ioctl   = VFMW_DRV_Ioctl,/*user space 32bit and kernel space 64 bit run this function*/
#endif
    .release	    = VFMW_DRV_Close,
};

static PM_BASEOPS_S VfmwOps =
{
    .probe	    = NULL,
    .remove	    = NULL,
    .shutdown	    = NULL,
    .prepare	    = NULL,
    .complete	    = NULL,
    .suspend	    = NULL,    //suspend from vdec
    .suspend_late   = NULL,
    .resume_early   = NULL,
    .resume	    = NULL,    //resume from vdec
};

VOID VFMW_Register_Dev(VOID)
{
    strncpy(VfmwDev.devfs_name, UMAP_DEVNAME_VFMW, sizeof(VfmwDev.devfs_name) - 1);
    VfmwDev.fops   = &VfmwFileOpts;
    VfmwDev.minor  = UMAP_MIN_MINOR_VFMW;
    VfmwDev.owner  = THIS_MODULE;
    VfmwDev.drvops = &VfmwOps;

    if (HI_DRV_DEV_Register(&VfmwDev) < 0)
    {
	dprint(PRN_ERROR,"%s,%d Reg dev %s failed\n", __func__,__LINE__,UMAP_DEVNAME_VFMW);

	return;
    }
}

VOID VFMW_UnRegister_Dev(VOID)
{
    HI_DRV_DEV_UnRegister(&VfmwDev);
}

static long VFMW_DRV_Ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
    VOID *pArgs = (VOID*)arg;

    if (pArgs == NULL)
    {
	dprint(PRN_ERROR,"%s,%d Null Prt arg! CMD = 0x%x\n",__func__,__LINE__,cmd);

	return VDEC_ERR_NULL_PRT;
    }

    switch (cmd)
    {
    case VDEC_IOCTL_VERSION_MATCH:
	{
	SINT8 VerStr[MAX_VERSION_STR];

	if (copy_from_user(VerStr, pArgs, sizeof(VerStr)))
		{
		    dprint(PRN_ERROR, "%s %d call copy_from_user failed! \n", __func__,__LINE__);
		    return -EIO;
		}

	if (OSAL_FP_strncmp(VFMW_MATCH_VERSION, (CHAR *)VerStr, sizeof(VFMW_MATCH_VERSION)))
	{
	    dprint(PRN_ERROR, "%s %d libhi_vfmw.so not match the kernel\n", __func__,__LINE__);
	    return -EFAULT;
	}
	}

	break;

	case VDEC_IOCTL_GET_UCC_MSG:
	    {
		UCS_MSG_DATA GetMsg;
		memset(&GetMsg, 0, sizeof(UCS_MSG_DATA));

		if (VFMW_UC_Com_GetMsg(&GetMsg) != VDEC_OK)
		{
		    dprint(PRN_DBG, "%s %d call VFMW_UC_Com_GetMsg failed! \n", __func__,__LINE__);
		    return -EFAULT;
		}

		if (copy_to_user(pArgs, &GetMsg, sizeof(UCS_MSG_DATA)))
		{
		    dprint(PRN_ERROR, "%s %d call copy_to_user failed! \n", __func__,__LINE__);
		    return -EIO;
		}
	    }
	    break;

	case VDEC_IOCTL_RET_UCC_MSG:
	    {
		UCS_MSG_DATA RetMsg;
		memset(&RetMsg, 0, sizeof(UCS_MSG_DATA));

		if (copy_from_user(&RetMsg, pArgs, sizeof(UCS_MSG_DATA)))
		{
		    dprint(PRN_ERROR, "%s %d call copy_from_user failed! \n", __func__,__LINE__);
		    return -EFAULT;
		}

		if (VFMW_UC_Com_RetMsg(&RetMsg) != VDEC_OK)
		{
		    dprint(PRN_ERROR, "%s %d call VFMW_UC_Com_RetMsg failed! \n", __func__,__LINE__);
		    return -EFAULT;
		}
	    }
	    break;

	default:
	    {
		dprint(PRN_ERROR, "%s,%d,CMD = 0x%x, not support!\n",__func__,__LINE__,cmd);
	    }
	    break;
    }

    return 0;
}

static SINT32 VFMW_DRV_Open(struct inode* inode, struct file* filp)
{
    SINT32 ret;

    ret = down_interruptible(&g_OpenCountMutex);
    if (HI_SUCCESS != ret)
    {
        dprint(PRN_ERROR, "Get g_OpenCountMutex failed!\n");
        return HI_FAILURE;
    }
    ret = (g_VfmwOpenCount == 0)? HI_SUCCESS: -EAGAIN;

    g_VfmwOpenCount = (g_VfmwOpenCount+1 == 0)? 0xffffffff: g_VfmwOpenCount+1;

    dprint(PRN_DBG,"%s (count %d) success.\n", __func__, g_VfmwOpenCount);
    up(&g_OpenCountMutex);

    return ret;
}

static SINT32 VFMW_DRV_Close(struct inode* inode, struct file* filp)
{
    SINT32 ret;

    ret = down_interruptible(&g_OpenCountMutex);
    if (HI_SUCCESS != ret)
    {
        dprint(PRN_ERROR, "Get g_OpenCountMutex failed!\n");
        return HI_FAILURE;
    }
    g_VfmwOpenCount = (g_VfmwOpenCount == 0)? 0: g_VfmwOpenCount-1;

    dprint(PRN_DBG,"%s (count %d) success.\n", __func__, g_VfmwOpenCount);
    up(&g_OpenCountMutex);

    return HI_SUCCESS;
}
