

#ifndef _VDM_DRV_NONKEY_HEADER_
#define _VDM_DRV_NONKEY_HEADER_

#ifdef __cplusplus
extern "C" {
#endif

#include "vfmw.h"
#include "simple_core.h"

#define	 VDMDRV_NULL_FUN_PTR		 -1


#define RD_VREG( reg, dat, VdhId )		 \
    do {		    \
	if (VdhId < MAX_VDH_NUM)		\
	{		     \
	    dat = *((volatile SINT32*)((SINT8*)g_HwMem[VdhId].pVdmRegVirAddr + reg)); \
	}		     \
	else		     \
	{		     \
	    dprint(PRN_ALWS,"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n", __func__, VdhId, MAX_VDH_NUM); \
	}		     \
    } while(0)

#define WR_VREG( reg, dat, VdhId )		 \
    do {		     \
	if (VdhId < MAX_VDH_NUM)		\
	{		     \
	    *((volatile SINT32*)((SINT8*)g_HwMem[VdhId].pVdmRegVirAddr + reg)) = dat; \
	}		     \
	else		     \
	{		     \
	    dprint(PRN_ALWS,"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n", __func__, VdhId, MAX_VDH_NUM); \
	}		     \
    } while(0)


/* VDM自用内存地址 */
typedef struct
{
    // vdm register base vir addr
    SINT32    *pVdmRegVirAddr;
    //SINT32	*pVdmResetVirAddr;
} VDMDRV_HWMEM_S;

typedef struct hiVDMDRV_FUN_PTR_S
{
    /*VDM_DRV*/
    VOID (*pfun_VDMDRV_SetClockSkip)(UINT32 SkipValue);
    VOID (*pfun_VDMDRV_OpenHardware)(SINT32 VdhId);
    VOID (*pfun_VDMDRV_CloseHardware)(SINT32 VdhId);

    VOID (*pfun_DSPDRV_OpenHardware)(SINT32 VdhId);
    VOID (*pfun_DSPDRV_CloseHardware)(SINT32 VdhId);
    VOID (*pfun_DSPDRV_LoadDspCode)(SINT32 ScdId, DSP_REQUIRE_E Require);

    VOID (*pfun_SCDDRV_OpenHardware)(SINT32 ScdId);
    VOID (*pfun_SCDDRV_CloseHardware)(SINT32 ScdId);
    VOID (*pfun_BPDDRV_OpenHardware)(SINT32 BpdId);
    VOID (*pfun_BPDDRV_CloseHardware)(SINT32 BpdId);
    VOID (*pfun_MMUDRV_OpenHardware)(SINT32 MmuId);
    VOID (*pfun_MMUDRV_CloseHardware)(SINT32 MmuId);
    VOID (*pfun_VDMDRV_GlbResetX)( SINT32 VdhId );
    VOID (*pfun_VDMDRV_SetSmmuPageTableAddr)( UINT32 VdhId );
    VOID (*pfun_VDMDRV_EnableSmmu)( VOID );

    SINT32 (*pfun_SCDDRV_Reset) (SINT32 ScdId);
    VOID   (*pfun_VDMDRV_ResetX)(SINT32 VdhId);
    VOID   (*pfun_VDMDRV_Reset) (VOID);
} VDMDRV_FUN_PTR_S;

extern VDMDRV_FUN_PTR_S g_vdm_drv_fun_ptr;
extern VDMDRV_HWMEM_S  g_HwMem[MAX_VDH_NUM];

#define	 VDMDRV_NULL_FUN_PRINT	 dprint(PRN_FATAL,"%s,%d,VDMDRV_NULL_FUN_PRINT\n",__func__, __LINE__)


#define VDMDRV_SetClockSkip(SkipValue) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_SetClockSkip)	\
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_SetClockSkip(SkipValue); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_OpenHardware(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_OpenHardware)	\
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_OpenHardware(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_CloseHardware(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_CloseHardware)	 \
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_CloseHardware(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define DSPDRV_OpenHardware(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_DSPDRV_OpenHardware)	\
	{ \
	    g_vdm_drv_fun_ptr.pfun_DSPDRV_OpenHardware(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define DSPDRV_CloseHardware(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_DSPDRV_CloseHardware)	 \
	{ \
	    g_vdm_drv_fun_ptr.pfun_DSPDRV_CloseHardware(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define DSPDRV_LoadDspCode(ModuleID, Require) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_DSPDRV_LoadDspCode)  \
	{ \
	    g_vdm_drv_fun_ptr.pfun_DSPDRV_LoadDspCode(ModuleID, Require); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)


#define SCDDRV_OpenHardware(ScdId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_SCDDRV_OpenHardware)	\
	{ \
	    g_vdm_drv_fun_ptr.pfun_SCDDRV_OpenHardware(ScdId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define SCDDRV_CloseHardware(ScdId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_SCDDRV_CloseHardware)	 \
	{ \
	    g_vdm_drv_fun_ptr.pfun_SCDDRV_CloseHardware(ScdId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_SetSmmuPageTableAddr(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_SetSmmuPageTableAddr)	\
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_SetSmmuPageTableAddr(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_EnableSmmu() \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_EnableSmmu)  \
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_EnableSmmu(); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_Reset() \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_Reset)	 \
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_Reset(); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define VDMDRV_ResetX(VdhId) \
    do \
    { \
	if(NULL != g_vdm_drv_fun_ptr.pfun_VDMDRV_ResetX)  \
	{ \
	    g_vdm_drv_fun_ptr.pfun_VDMDRV_ResetX(VdhId); \
	}  \
	else  \
	{  \
	    VDMDRV_NULL_FUN_PRINT;  \
	}  \
    }while(0)

#define SCDDRV_Reset(ScdId) \
    (g_vdm_drv_fun_ptr.pfun_SCDDRV_Reset? \
     g_vdm_drv_fun_ptr.pfun_SCDDRV_Reset(ScdId): \
     VDMDRV_NULL_FUN_PTR)

#define MMUDRV_OpenHardware(MmuId) \
    (g_vdm_drv_fun_ptr.pfun_MMUDRV_OpenHardware? \
     g_vdm_drv_fun_ptr.pfun_MMUDRV_OpenHardware(MmuId): \
     VDMDRV_NULL_FUN_PTR)

#define MMUDRV_CloseHardware(MmuId) \
    (g_vdm_drv_fun_ptr.pfun_MMUDRV_CloseHardware? \
     g_vdm_drv_fun_ptr.pfun_MMUDRV_CloseHardware(MmuId): \
     VDMDRV_NULL_FUN_PTR)

#define BPDDRV_OpenHardware(BpdId) \
    (g_vdm_drv_fun_ptr.pfun_BPDDRV_OpenHardware? \
     g_vdm_drv_fun_ptr.pfun_BPDDRV_OpenHardware(BpdId): \
     VDMDRV_NULL_FUN_PTR)

#define BPDDRV_CloseHardware(BpdId) \
    (g_vdm_drv_fun_ptr.pfun_BPDDRV_CloseHardware? \
     g_vdm_drv_fun_ptr.pfun_BPDDRV_CloseHardware(BpdId): \
     VDMDRV_NULL_FUN_PTR)

#ifdef __cplusplus
}
#endif


#endif
