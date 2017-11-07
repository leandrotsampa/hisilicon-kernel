#ifndef	 __USER_COM_DEV_EXT_H__
#define	 __USER_COM_DEV_EXT_H__

#ifdef ENV_ARMLINUX_USER
#include "vfmw_linux_user_osal.h"
#include <fcntl.h>
#include <sys/ioctl.h>
#else
#include "vfmw.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define VDEC_IOCTL_MAGIC 'v'

#define VDEC_IOCTL_VERSION_MATCH \
    _IO(VDEC_IOCTL_MAGIC, 23)

#define VDEC_IOCTL_GET_UCC_MSG	 \
    _IO(VDEC_IOCTL_MAGIC, 24)

#define VDEC_IOCTL_RET_UCC_MSG	 \
    _IO(VDEC_IOCTL_MAGIC, 25)


#ifdef __cplusplus
}
#endif

#endif
