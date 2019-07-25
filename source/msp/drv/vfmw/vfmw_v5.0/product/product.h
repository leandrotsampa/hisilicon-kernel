
#ifndef __VDEC_PRODUCT_H__
#define __VDEC_PRODUCT_H__

#include "vfmw.h"
#ifdef ENV_ARMLINUX_USER
#include "vdm_hal.h"
#endif
#define PDT_OK	 0
#define PDT_ERR	 1

typedef enum
{
    ATTR_VDEC_CAP,
    ATTR_OUT_FMT,
    ATTR_BUTT,
}ATTR_ID;

SINT32 PDT_GetAttribute(ATTR_ID eAttrID, VOID *pArgs);
SINT32 PDT_Init(VOID *pFuncPtr);

#endif
