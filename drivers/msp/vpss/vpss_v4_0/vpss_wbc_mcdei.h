/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __VPSS_WBC_MCDEI_H__
#define __VPSS_WBC_MCDEI_H__

#include "hi_drv_mmz.h"
#include "vpss_common.h"
#include "hi_drv_vpss.h"
#include <linux/list.h>


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define VPSS_RGME_WBC_MAX_NODE 4

typedef struct hiVPSS_WBC_MCDEI_DATA_S
{
    HI_DRV_VIDEO_FRAME_S stWbcFrame;  //֡��Ϣ
    LIST node;			      //�����ڵ�
} VPSS_WBC_MCDEI_DATA_S;
typedef enum hiVPSS_RGME_MODE_E
{
    VPSS_RGME_MODE_4FIELD = 4,	      //MCDEIĿǰ�̶�4��ģʽ����д���п���4��֡��ڵ�
    VPSS_RGME_MODE_BUTT
} VPSS_RGME_MODE_E;

typedef enum hiVPSS_RGME_PREIMG_MODE_E
{
    VPSS_RGME_PREIMG_MODE_INIT = 1,	   //��ȡ�ο�֡ʱ������д֡��������ʱ���ο�֡ȫ����ֵΪ��Ч
    VPSS_RGME_PREIMG_MODE_WORK = 2,	   //��ȡ�ο�֡ʱ������д֡��������ʱ��δ��д�Ĳο�֡��ֵΪ��Ч����д�Ĳο�֡������ֵ
    VPSS_RGME_PREIMG_MODE_BUTT
} VPSS_RGME_PREIMG_MODE_E;

typedef struct hiVPSS_RGME_ATTR_S
{
    HI_U32    u32Width;		       //֡��Ϣ��
    HI_U32    u32Height;	       //֡��Ϣ��
    HI_DRV_PIX_FORMAT_E ePixFormat;	   //֡��Ϣ���ظ�ʽ
    HI_DRV_PIXEL_BITWIDTH_E  enBitWidth;  //֡��Ϣͼ��bitλ,10 bit or 8 bit
    VPSS_RGME_MODE_E enMode;			   //��д���й���ģʽ
    VPSS_RGME_PREIMG_MODE_E enRefMode;	      //ģʽֵʹ��ģʽ
    HI_BOOL bSecure;
} VPSS_RGME_ATTR_S;

typedef struct hiVPSS_RGME_S
{
    HI_BOOL bInit;		       //��ʼ����ʶ
    HI_U32 u32CompleteCount;	       //��д������ת����
    VPSS_WBC_MCDEI_DATA_S stDataList[VPSS_RGME_WBC_MAX_NODE];	   //��д�����ṹ
    VPSS_RGME_ATTR_S stRgmeAttr;	 //��д��������
    SMMU_BUFFER_S stMMUBuf;	       //֡����Ϣ

    SMMU_BUFFER_S stTEEBuf;


    LIST *pstFirstRef;			//ָ��������һ���ο�֡
} VPSS_RGME_S;

HI_S32 VPSS_RGME_Init(VPSS_RGME_S *pstRgme, VPSS_RGME_ATTR_S *pstAttr);
HI_S32 VPSS_RGME_DeInit(VPSS_RGME_S *pstRgme);
//��ȡ��д�����еĲο�֡
HI_S32 VPSS_RGME_GetRefInfo(VPSS_RGME_S *pstRgme,
			    HI_DRV_VIDEO_FRAME_S **pstDataList);

//��ȡ��д�����еĻ�д֡
HI_S32 VPSS_RGME_GetWbcInfo(VPSS_RGME_S *pstRgme, HI_DRV_VIDEO_FRAME_S **pstData);
//���û�д������ת
HI_S32 VPSS_RGME_CompleteImage(VPSS_RGME_S *pstRgme);
HI_S32 VPSS_RGME_Reset(VPSS_RGME_S *pstRgme);

//////////////////////////////////////////////////////////////////////

#define VPSS_BLEND_WBC_MAX_NODE 2

typedef enum hiVPSS_BLEND_MODE_E
{
    VPSS_BLEND_MODE_4FIELD = 4,	       //MCDEIĿǰ�̶�4��ģʽ
    VPSS_BLEND_MODE_BUTT
} VPSS_BLEND_MODE_E;

typedef enum hiVPSS_BLEND_BUFMODE_E
{
    VPSS_BLEND_BUFMODE_LOWMEM = 1,	 //��ʡ�ڴ�ģʽ������һ����ַ�ռ�
    VPSS_BLEND_BUFMODE_NORMAL = 2,	  //����ʹ��ģʽ������������ַ�ռ�
    VPSS_BLEND_BUFMODE_BUTT
} VPSS_BLEND_BUFMODE_E;

typedef struct hiVPSS_BLEND_ATTR_S
{
    HI_U32    u32Width;		       //֡��Ϣ��
    HI_U32    u32Height;	       //֡��Ϣ��
    HI_DRV_PIX_FORMAT_E ePixFormat;	   //֡��Ϣ���ظ�ʽ
    HI_DRV_PIXEL_BITWIDTH_E  enBitWidth;  //֡��Ϣͼ��bitλ,10 bit or 8 bit
    VPSS_BLEND_MODE_E enMode;			    //��д���й���ģʽ
    VPSS_BLEND_BUFMODE_E enBufMode;	   //ʹ��ģʽ
    HI_BOOL bSecure;	    //��ȫģʽ
} VPSS_BLEND_ATTR_S;

typedef struct hiVPSS_BLEND_S
{
    HI_BOOL bInit;		       //��ʼ����ʶ
    HI_U32 u32CompleteCount;	       //��д������ת����
    VPSS_WBC_MCDEI_DATA_S stDataList[VPSS_BLEND_WBC_MAX_NODE];	    //��д�����ṹ
    VPSS_BLEND_ATTR_S stBlendAttr;	   //��д��������
    SMMU_BUFFER_S stMMUBuf;	       //֡����Ϣ

    SMMU_BUFFER_S stTEEBuf;

    LIST *pstFirstRef;			//ָ��������һ���ο�֡
} VPSS_BLEND_S;

HI_S32 VPSS_BLEND_Init(VPSS_BLEND_S *pstBlend, VPSS_BLEND_ATTR_S *pstAttr);

HI_S32 VPSS_BLEND_DeInit(VPSS_BLEND_S *pstBlend);

//��ȡ��д�����еĲο�֡
HI_S32 VPSS_BLEND_GetRefInfo(VPSS_BLEND_S *pstBlend,
			     HI_DRV_VIDEO_FRAME_S **pstDataList);
//��ȡ��д�����еĻ�д֡
HI_S32 VPSS_BLEND_GetWbcInfo(VPSS_BLEND_S *pstBlend, HI_DRV_VIDEO_FRAME_S **pstData);
//���û�д������ת
HI_S32 VPSS_BLEND_CompleteImage(VPSS_BLEND_S *pstBlend);
HI_S32 VPSS_BLEND_Reset(VPSS_BLEND_S *pstBlend);

///////////////////////////////////////////////////////////////////



#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /*__VPSS_WBC_MCDEI_H__*/
