
#ifndef __VDH_NORMAL_H__
#define __VDH_NORMAL_H__

#include "vdh_common.h"

#ifdef __cplusplus
extern "C" {
#endif

/******************************************
 Initialize VDH hardware abstract layer
******************************************/
SINT32 VDH_Normal_Init(VOID);

/******************************************
 Deinitialize VDH hardware abstract layer
******************************************/
SINT32 VDH_Exit(VOID);

/******************************************
 Create vdh distributor proc
******************************************/
VOID  VDH_Init_Proc (VOID);

/******************************************
 Destroy vdh distributor proc
******************************************/
VOID   VDH_Exit_Proc(VOID);

/******************************************
 Suspend vdh distributor
******************************************/
VOID   VDH_Suspend(VOID);

/******************************************
 Resume vdh distributor
******************************************/
VOID   VDH_Resume(VOID);

/******************************************
 Get VDH Hal common Context
******************************************/
SINT32 VDH_Get_ShareData(VDH_SHARE_DATA_S *pShareData);

#ifdef HI_TEE_SUPPORT
/******************************************
 Check if secure need to wake up distributor thread
******************************************/
VOID VDH_Secure_WakeUp_Distributor(VOID);
#endif

#ifdef VFMW_USER_DRIVER
/******************************************
 Check if user need to wake up distributor thread
******************************************/
VOID VDH_User_WakeUpDistributor(VOID);

SINT32 VDH_GetUserTask_To_Process(MODULE_TYPE_E Type, SINT32 ModuleID, TASK_PARAM_S *pTaskParam);
#endif

#ifdef __cplusplus
}
#endif

#endif
