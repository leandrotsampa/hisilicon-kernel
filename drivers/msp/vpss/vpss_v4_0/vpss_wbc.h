/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __VPSS_WBC_H__
#define __VPSS_WBC_H__

#include "hi_drv_mmz.h"
#include "vpss_common.h"
#include "hi_drv_vpss.h"
#include <linux/list.h>

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define VPSS_WBC_MAX_NODE 5

typedef struct hiVPSS_WBC_DATA_S
{
    HI_DRV_VIDEO_FRAME_S stWbcFrame;  //֡��Ϣ
    LIST node;			      //�����ڵ�
} VPSS_WBC_DATA_S;

typedef enum hiVPSS_WBC_MODE_E
{
    VPSS_WBC_MODE_NORMAL = 2,	     //��д֡ģʽ����д���п���2��֡��ڵ�
    VPSS_WBC_MODE_3FIELD = 3,	     //��д����ģʽ����д���п���3��֡��ڵ�
    VPSS_WBC_MODE_4FIELD = 4,	     //��д�ĳ�ģʽ����д���п���4��֡��ڵ�
    VPSS_WBC_MODE_5FIELD = 5,	     //��д�峡ģʽ����д���п���5��֡��ڵ�
    VPSS_WBC_MODE_BUTT
} VPSS_WBC_MODE_E;

typedef enum hiVPSS_WBC_REF_MODE_E
{
    VPSS_WBC_REF_MODE_INIT = 1,	       //��ȡ�ο�֡ʱ������д֡��������ʱ��δ��д�Ĳο�֡��ֵΪ��ʼֵ����д�Ĳο�֡������ֵ
    VPSS_WBC_REF_MODE_NULL = 2,	       //��ȡ�ο�֡ʱ������д֡��������ʱ��δ��д�Ĳο�֡��ֵΪ��Ч����д�Ĳο�֡������ֵ
    VPSS_WBC_REF_MODE_BUTT
} VPSS_WBC_REF_MODE_E;

typedef struct hiVPSS_WBC_ATTR_S
{
    VPSS_WBC_MODE_E enMode;		  //��д���й���ģʽ
    VPSS_WBC_REF_MODE_E enRefMode;	  //ģʽֵʹ��ģʽ
    HI_U32    u32Width;			  //֡��Ϣ��
    HI_U32    u32Height;		  //֡��Ϣ��
    HI_DRV_PIX_FORMAT_E ePixFormat;	   //֡��Ϣ���ظ�ʽ
    HI_DRV_PIXEL_BITWIDTH_E  enBitWidth;  //֡��Ϣͼ��bitλ,10 bit or 8 bit
    HI_U32		     u32FrameIndex; //��һ֡INDEXֵ
    HI_U32		     u32Pts;	    //��һ֡PTSֵ
    HI_S64		     s64OmxPts;
    HI_BOOL   bSecure;
} VPSS_WBC_ATTR_S;

typedef struct hiVPSS_WBC_S
{
    HI_BOOL bInit;		       //��ʼ����ʶ
    HI_U32 u32CompleteCount;	       //��д������ת����
    VPSS_WBC_DATA_S stDataList[VPSS_WBC_MAX_NODE];     //��д�����ṹ
    VPSS_WBC_ATTR_S stWbcAttr;	       //��д��������
    SMMU_BUFFER_S stMMUBuf;	       //֡����Ϣ

    SMMU_BUFFER_S stTEEBuf;	       //֡����Ϣ

    LIST *pstFirstRef;			//ָ��������һ���ο�֡
} VPSS_WBC_S;


HI_S32 VPSS_WBC_Init(VPSS_WBC_S *pstWbc, VPSS_WBC_ATTR_S *pstAttr);

HI_S32 VPSS_WBC_DeInit(VPSS_WBC_S *pstWbc);

HI_S32 VPSS_WBC_GetRefInfo(VPSS_WBC_S *pstWbc,
			   HI_DRV_VIDEO_FRAME_S **pstDataList
			  );

HI_S32 VPSS_WBC_GetWbcInfo(VPSS_WBC_S *pstWbc, HI_DRV_VIDEO_FRAME_S **pstData);

HI_S32 VPSS_WBC_Complete(VPSS_WBC_S *pstWbc);

HI_S32 VPSS_WBC_Reset(VPSS_WBC_S *pstWbc);

HI_S32 VPSS_WBC_GetCurInfo(VPSS_WBC_S *pstWbc, HI_DRV_VIDEO_FRAME_S **ppstCurImage);

HI_S32 VPSS_WBC_InitFrame(HI_DRV_VIDEO_FRAME_S *pstWbcFrame, VPSS_WBC_ATTR_S *pstAttr, HI_U32 u32PhyAddr, HI_U8* pu8VirAddr);
HI_S32 VPSS_WBC_CalBufSize(HI_U32 *pSize, HI_U32 *pStride,
			   VPSS_WBC_ATTR_S *pstAttr);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /*__VPSS_WBC_H__*/
