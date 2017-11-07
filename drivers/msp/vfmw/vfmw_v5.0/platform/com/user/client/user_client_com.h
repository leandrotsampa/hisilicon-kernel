#ifndef	 __USER_CLIENT_COM_API_H__
#define	 __USER_CLIENT_COM_API_H__

#include "vfmw.h"
#include "user_common_type.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct vfmwUccData
{
   SINT32 ChanID;
   VFMW_HID_E eHandleID;
   UINT32     CmdID;
   VOID *pArgs;
   UINT32 ArgsLen;
   SINT32 Level;
   SINT32 IsBlock;
} VFMW_UCC_DATA;

SINT32 VFMW_UC_Com_Init(VOID);

SINT32 VFMW_UC_Com_DeInit(VOID);

VOID   VFMW_UC_Com_PrepareData(VFMW_UCC_DATA *pUccData, VFMW_HID_E eHandleID, UINT32 CmdID, VOID *pData, UINT32 DataLen, SINT32 ChanID);

SINT32 VFMW_UC_Com_Process(VFMW_UCC_DATA *pUccData);

SINT32 VFMW_UC_Com_GetMsg(UCS_MSG_DATA *pMsgData);

SINT32 VFMW_UC_Com_RetMsg(UCS_MSG_DATA *pMsgData);

#ifdef __cplusplus
}
#endif

#endif
