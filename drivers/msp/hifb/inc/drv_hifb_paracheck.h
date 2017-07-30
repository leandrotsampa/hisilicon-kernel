/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	: drv_hifb_paracheck.h
Version		 : Initial Draft
Author		 :
Created		: 2017/01/23
Description    : check framebuffer para that before be used
		      CNcomment: �ڲ���ʹ��֮ǰ�������Ϸ���CNend\n
Function List  :

History		:
Date				Author			   Modification
2017/01/23	      y00181162		     Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __DRV_HIFB_PARACHECK_H__
#define __DRV_HIFB_PARACHECK_H__


/*********************************add include here********************************/
#include "hi_type.h"

/*****************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ***********************************/

/** check whether array overstep the boundary, return ret if over **/
/** �ж������Ƿ�Խ�磬Ҫ��Խ���˷��ش����� **/
#define HIFB_CHECK_ARRAY_OVER_RETURN(CurIndex, MaxIndex, Ret) \
			    do{\
				if (CurIndex >= MaxIndex)\
				{\
				    return Ret;\
				}\
			    }while(0)

/** check whether array overstep the boundary, return if over **/
/** �ж������Ƿ�Խ�磬Ҫ��Խ����ֱ�ӷ���**/
#define HIFB_CHECK_ARRAY_OVER(CurIndex, MaxIndex) \
			    do{\
				if (CurIndex >= MaxIndex)\
				{\
				    return;\
				}\
			    }while(0)

#define HIFB_CHECK_NULLPOINTER_UNRETURN(Pointer) \
			    do{\
				if (NULL == Pointer)\
				{\
				    return;\
				}\
			    }while(0)

#define HIFB_CHECK_NULLPOINTER_RETURN(Pointer, Ret) \
			    do{\
				if (NULL == Pointer)\
				{\
				    HI_PRINT("=====%s %d failure\n",__FUNCTION__,__LINE__);\
				    return Ret;\
				}\
			    }while(0)


#define HIFB_CHECK_UNEQUAL_RETURN(para1, para2, Ret) \
			    do{\
				if (para1 != para2)\
				{\
				    return Ret;\
				}\
			    }while(0)

#define HIFB_CHECK_EQUAL_RETURN(para1, para2, Ret) \
			    do{\
				if (para1 == para2)\
				{\
				    return Ret;\
				}\
			    }while(0)

#define HIFB_CHECK_UNEQUAL_UNRETURN(para1, para2) \
			    do{\
				if (para1 != para2)\
				{\
				    return;\
				}\
			    }while(0)

#define HIFB_CHECK_EQUAL_UNRETURN(para1, para2) \
			    do{\
				if (para1 == para2)\
				{\
				    return;\
				}\
			    }while(0)
/*************************** Structure Definition **********************************/

/********************** Global Variable declaration **********************************/

/******************************* API declaration *********************************/

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/*__DRV_HIFB_PARACHECK_H__ */
