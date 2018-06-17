/******************************************************************************
Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hi_debug.h
Version	      : Initial Draft
Author	      : Hisilicon multimedia software group
Created	      : 2005/4/23
Last Modified :
Description   : Common debugging macro definition
Function List :
History	      :
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_DEBUG_H__
#define __HI_DEBUG_H__

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

#include "hi_type.h"
#include "hi_module.h"

#define HI_DEBUG

#ifdef __OS_LINUX__
#ifdef __KERNEL__
    #define HI_PRINT printk
#else
#include <stdio.h>
    #define HI_PRINT printf
#endif /* end of __KERNEL__ */
#else  /* __OS_ECOS__ */
#define HI_PRINT printf
#endif /* end of __OS_LINUX__ */

#ifdef __KERNEL__
    #define HI_PANIC printk
#else
    #define HI_PANIC printf
#endif

/*************************** Structure Definition ****************************/
/** \addtogroup	    HI_DEBUG */
/** @{ */  /** <!-- [HI_DEBUG] */


/**Default level of the output debugging information*/
/**CNcomment: Ĭ�ϵĵ�����Ϣ�������*/
#define HI_LOG_LEVEL_DEFAULT HI_LOG_LEVEL_ERROR

/**Level of the output debugging information*/
/**CNcomment: ������Ϣ�������*/
typedef enum hiLOG_LEVEL_E
{
    HI_LOG_LEVEL_FATAL	 = 0,	  /**<Fatal error. It indicates that a critical problem occurs in the system. Therefore, you must pay attention to it.*/
				  /**<CNcomment: ��������, ���������Ҫ�ر��ע��һ����ִ���������ϵͳ�������ش����� */
    HI_LOG_LEVEL_ERROR	 = 1,	  /**<Major error. It indicates that a major problem occurs in the system and the system cannot run.*/
				  /**<CNcomment: һ�����, һ����ִ���������ϵͳ�����˱Ƚϴ�����⣬�������������� */
    HI_LOG_LEVEL_WARNING = 2,	  /**<Warning. It indicates that a minor problem occurs in the system, but the system still can run properly.*/
				  /**<CNcomment: �澯��Ϣ, һ����ִ�����Ϣ����ϵͳ���ܳ������⣬���ǻ��ܼ������� */
    HI_LOG_LEVEL_INFO	 = 3,	  /**<Message. It is used to prompt users. Users can open the message when locating problems. It is recommended to disable this message in general.*/
				  /**<CNcomment: ��ʾ��Ϣ, һ����Ϊ�����û���������ڶ�λ�����ʱ����Դ򿪣�һ������½���ر� */
    HI_LOG_LEVEL_DBG	 = 4,	  /**<Debug. It is used to prompt developers. Developers can open the message when locating problems. It is recommended to disable this message in general.*/
				  /**<CNcomment: ��ʾ��Ϣ, һ����Ϊ������Ա����������趨�Ĵ�ӡ����һ������½���ر� */

    HI_LOG_LEVEL_BUTT
} HI_LOG_LEVEL_E;

/** @} */

/**Just only for fatal level print.   */   /**CNcomment: Ϊ�˴�ӡ������Ϣ���ƶ��ĺ��ӡ���� */
#define HI_TRACE_LEVEL_FATAL	(0)
/**Just only for error level print.   */   /**CNcomment: Ϊ�˴�ӡ������Ϣ���ƶ��ĺ��ӡ���� */
#define HI_TRACE_LEVEL_ERROR	(1)
/**Just only for warning level print. */   /**CNcomment: Ϊ�˴�ӡ������Ϣ���ƶ��ĺ��ӡ���� */
#define HI_TRACE_LEVEL_WARN	(2)
/**Just only for info level print.    */   /**CNcomment: Ϊ�˴�ӡ��Ϣ������ƶ��ĺ��ӡ���� */
#define HI_TRACE_LEVEL_INFO	(3)
/**Just only for debug level print.   */   /**CNcomment: Ϊ�˴�ӡ������Ϣ���ƶ��ĺ��ӡ���� */
#define HI_TRACE_LEVEL_DBG	(4)

#ifndef HI_LOG_LEVEL
#define HI_LOG_LEVEL	     (HI_TRACE_LEVEL_INFO)
#endif


/**Just only debug output,MUST BE NOT calling it. */
/**CNcomment: ���������Ϣ�ӿڣ����Ƽ�ֱ�ӵ��ô˽ӿ� */
extern HI_VOID HI_LogOut(HI_U32 u32Level, HI_MOD_ID_E enModId,
	    HI_U8 *pFuncName, HI_U32 u32LineNum, const char *format, ...);

#ifdef HI_DEBUG

#define HI_TRACE(level, module_id, fmt...)			\
    do{								\
	HI_LogOut(level, module_id, (HI_U8*)__FUNCTION__,__LINE__,fmt);	 \
    }while(0)

#define HI_ASSERT(expr)					    \
    do{							    \
	if (!(expr)) {					    \
	    HI_PANIC("\nASSERT failed at:\n  >File name: %s\n  >Function : %s\n	 >Line No. : %d\n  >Condition: %s\n", \
		__FILE__,__FUNCTION__, __LINE__, #expr);    \
	}						    \
    }while(0)


#define HI_ASSERT_RET(expr)					\
    do{								\
	if (!(expr)) {						\
	    HI_PRINT("\n<%s %d>: ASSERT Failure{" #expr "}\n",	\
			  __FUNCTION__, __LINE__);		\
	    return HI_FAILURE;					\
	}							\
    }while(0)

#else
# define HI_TRACE(level, module_id, fmt...)
# define HI_ASSERT(expr)
# define HI_ASSERT_RET(expr)
#endif /* endif HI_DEBUG */

/* Debug level dependent print macros */

#if defined(HI_DEBUG)
# define HI_FATAL_PRINT(module_id, fmt...) \
		HI_TRACE(HI_TRACE_LEVEL_FATAL, module_id, fmt)
#else
# define HI_FATAL_PRINT(module_id, fmt...)
#endif

#if (defined(HI_DEBUG) && HI_LOG_LEVEL <= HI_TRACE_LEVEL_ERROR)
# define HI_ERR_PRINT(module_id, fmt...) \
		HI_TRACE(HI_TRACE_LEVEL_ERR, module_id, fmt)
#else
# define HI_ERR_PRINT(module_id, fmt...)
#endif

#if (defined(HI_DEBUG) && HI_LOG_LEVEL <= HI_TRACE_LEVEL_WARN)
# define HI_WARN_PRINT(module_id, fmt...) \
		HI_TRACE(HI_TRACE_LEVEL_WARN, module_id, fmt)
#else
# define HI_WARN_PRINT(module_id, fmt...)
#endif

#if (defined(HI_DEBUG) && HI_LOG_LEVEL <= HI_TRACE_LEVEL_INFO)
# define HI_INFO_PRINT(module_id, fmt...) \
		HI_TRACE(HI_TRACE_LEVEL_INFO, module_id, fmt)
#else
# define HI_INFO_PRINT(module_id, fmt...)
#endif

#if (defined(HI_DEBUG) && HI_LOG_LEVEL <= HI_TRACE_LEVEL_DBG)
# define HI_DBG_PRINT(module_id, fmt...) \
		HI_TRACE(HI_TRACE_LEVEL_DBG, module_id, fmt)
#else
# define HI_DBG_PRINT(module_id, fmt...)
#endif

/** @} */  /** <!-- ==== Structure Definition End ==== */


#define MKSTR(exp) # exp
#define MKMARCOTOSTR(exp) MKSTR(exp)
#define VERSION_STRING ("Build Time:[" __DATE__ ", " __TIME__ "]")
#define USER_VERSION_STRING ("")

/**Initialize a user module.*/
/**CNcomment: �û�ģ���ʼ�� */
#define HI_MODULE_DECLARE(MODULE_NAME)	\
	static HI_U32 g_u32ModuleId = HI_INVALID_MODULE_ID;	\
	static HI_S32 __attribute__((constructor(200))) init_module_id() \
	{	 \
		return HI_MODULE_RegisterByName(MODULE_NAME, &g_u32ModuleId); \
	} \
    static HI_S32 __attribute__((destructor(200))) deinit_module_id() \
    { \
	return HI_MODULE_UnRegister(g_u32ModuleId); \
    }

/**Defines a user module ID.*/
/**CNcomment: �û�ģ��ID�궨�� */
#define MODULE_ID (g_u32ModuleId)

/**Defines the command of the user module different level log print.*/
/**CNcomment: �û�ģ����־����궨�� */
#define HI_MODULE_FATAL(pszFormat...)  HI_FATAL_PRINT(MODULE_ID,pszFormat)
#define HI_MODULE_ERROR(pszFormat...)  HI_ERR_PRINT(MODULE_ID,pszFormat)
#define HI_MODULE_WARN(pszFormat...)   HI_WARN_PRINT(MODULE_ID,pszFormat)
#define HI_MODULE_DEBUG(pszFormat...)  HI_DBG_PRINT(MODULE_ID,pszFormat)
#define HI_MODULE_INFO(pszFormat...)   HI_INFO_PRINT(MODULE_ID,pszFormat)

/**Defines the memory allocate and free command used by user module.*/
/**CNcomment: �û�ģ���ڴ����궨�� */
#define HI_MODULE_MALLOC(u32Size)		HI_MEM_Malloc(MODULE_ID, u32Size)
#define HI_MODULE_FREE(pMemAddr)		HI_MEM_Free(MODULE_ID, pMemAddr)
#define HI_MODULE_CALLOC(u32MemBlock, u32Size)	HI_MEM_Calloc(MODULE_ID, u32MemBlock, u32Size)


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_DEBUG_H__ */
