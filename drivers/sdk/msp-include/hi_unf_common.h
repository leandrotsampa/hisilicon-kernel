/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_common.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2009/12/17
  Description	:
  History	:
  1.Date	: 2009/12/17
    Author	: w58735
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_COMMON_H__
#define __HI_UNF_COMMON_H__


#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

#include "hi_common.h"
#include "hi_unf_audio.h"
#include "hi_unf_video.h"

/*************************** Structure Definition ****************************/
/** \addtogroup	     Media_Common */
/** @{ */  /** <!-- [Media_Common] */

/**Defines the stream buffer.*/
/**CNcomment: ������������ṹ�� */
typedef struct hiUNF_STREAM_BUF_S
{
    HI_U8   *pu8Data;	     /**<Data pointer*/ /**<CNcomment: ����ָ�� */
    HI_U32  u32Size;	     /**<Data size*/ /**<CNcomment: ���ݳ��� */
} HI_UNF_STREAM_BUF_S;

/**Defines the structure of the ES buffer.*/
/**CNcomment: ����ES��������ṹ�� */
typedef struct hiUNF_ES_BUF_S
{
    HI_U8 * pu8Buf;    /**<User-state virtual address of the buffer*/ /**<CNcomment: buffer���û�̬���ַ*/
    HI_U32 u32BufLen;  /**<Buffer length*/ /**<CNcomment: buffer�ĳ���*/
    HI_U32 u32PtsMs;   /**<Presentation time stamp (PTS) value corresponding to the start of the stream. The invalid value is 0xFFFFFFFF.*/
		       /**<CNcomment: ������ʼ����Ӧ��PTSֵ����ЧΪ0xffffffff*/
}HI_UNF_ES_BUF_S;

/* Crop parameter */
typedef struct hiUNF_CROP_RECT_S
{
    HI_U32 u32LeftOffset;
    HI_U32 u32TopOffset;
    HI_U32 u32RightOffset;
    HI_U32 u32BottomOffset;
}HI_UNF_CROP_RECT_S;

/**Defines the signal status of the input source.*/
/**CNcomment: ��������Դ���ź�״̬ */
typedef enum hiUNF_SIG_STATUS_E
{
    HI_UNF_SIG_SUPPORT = 0,  /**<Stable signal*/	    /**<CNcomment:ʶ���ȶ��ź� */
    HI_UNF_SIG_NO_SIGNAL,    /**<No signal*/		    /**<CNcomment:���ź� */
    HI_UNF_SIG_NOT_SUPPORT,  /**<Not support the signal*/   /**<CNcomment:�źŲ�֧�� */
    HI_UNF_SIG_UNSTABLE,     /**<Unstable signal*/	    /**<CNcomment:�źŲ��ȶ� */
    HI_UNF_SIG_BUTT	     /**<Invalid value*/	    /**<CNcomment:�Ƿ��߽�ֵ */
} HI_UNF_SIG_STATUS_E;

/** @} */  /** <!-- ==== Structure Definition End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_UNF_COMMON_ H*/
