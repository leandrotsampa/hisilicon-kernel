#ifndef __SIMPLE_CORE_H__
#define __SIMPLE_CORE_H__

#include "vfmw.h"
#include "sysconfig.h"
#include "vfmw_log.h"
#include "mem_manage.h"

#ifdef __cplusplus
extern "C" {
#endif

extern UADDR s_ScdRegPhyBaseAddr[MAX_SCD_NUM];
#define WR_SCDREG(Id, Reg, Data32)  MEM_WritePhyWord((s_ScdRegPhyBaseAddr[Id] + Reg),Data32)
#define RD_SCDREG(Id, Reg)	    MEM_ReadPhyWord((s_ScdRegPhyBaseAddr[Id] + Reg))


VOID   VFMW_SCore_InitGlobalResource(VOID);
VOID   VFMW_SCore_InitStaticResource(VOID);
SINT32 VFMW_SCore_OpenVfmw(VDEC_OPERATION_S *pArgs);
VOID   VFMW_SCore_CloseVfmw(VOID);
SINT32 VFMW_SCore_InitHardware(VDEC_OPERATION_S *pArgs);
VOID   VFMW_SCore_ExitHardware(VOID);
VOID   VFMW_SCore_SetSmmuPageTableAddr(UINT32 VdhId);
VOID   VFMW_SCore_EnableSmmu( VOID );
VOID   VFMW_SCore_LoadDspCode(SINT32 ScdId, DSP_REQUIRE_E Require);

#ifdef __cplusplus
}
#endif

#endif
