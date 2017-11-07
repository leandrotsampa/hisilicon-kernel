#ifndef __USER_CLIENT_H_
#define __USER_CLIENT_H_

#include "vfmw.h"

#ifdef __cplusplus
extern "C" {
#endif

#define	 REG_EMAR_ID	    0x0004

VOID   VFMW_UC_EXT_OpenModule(VOID);
VOID   VFMW_UC_EXT_CloseModule(VOID);
SINT32 VFMW_UC_EXT_Init(VDEC_OPERATION_S *pArgs);
SINT32 VFMW_UC_EXT_Exit(VOID);
SINT32 VFMW_UC_EXT_Control(SINT32 ChanID, VDEC_CID_E eCmdID, VOID *pArgs, UINT32 ParamLength);
SINT32 VFMW_UC_EXT_Suspend(VOID);
SINT32 VFMW_UC_EXT_Resume(VOID);
SINT32 VFMW_UC_EXT_GetImage(SINT32 ChanID, IMAGE *pImage);
SINT32 VFMW_UC_EXT_ReleaseImage(SINT32 ChanID, IMAGE *pImage);

#ifdef __cplusplus
}
#endif


#endif
