/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __OMXVDEC_PTS_RECV_H__
#define __OMXVDEC_PTS_RECV_H__

/******************************* Include Files *******************************/

/* add include here */
#include "hi_type.h"
#include "omxvdec.h"

//#include "hi_unf_common.h"
//#include "hi_unf_avplay.h"
#include "vfmw.h"

/*************************** Enum Definition ****************************/
/**Defines the source of frame rate.*/
/**CNcomment: ����֡����Դ���͵�ö�� */
typedef enum hi_FRMRATE_TYPE_E
{
    HI_FRMRATE_TYPE_PTS,	 /**<Use the frame rate calculates from PTS*//**<CNcomment: ����PTS����֡�� */
    HI_FRMRATE_TYPE_STREAM,	 /**<Use the frame rate comes from stream*//**<CNcomment: ����������Ϣ�е�֡�� */
    HI_FRMRATE_TYPE_USER,	 /**<Use the frame rate set by user*//**<CNcomment: �����û����õ�֡�� */
    HI_FRMRATE_TYPE_USER_PTS,	 /**<Use the frame rate set by user until the 2nd I frame comes, then use the frame rate calculates from PTS*//**<CNcomment: �ڶ���I֡��֮ǰ�����û����õ�֡�ʣ�֮�����PTS����֡�� */
    HI_FRMRATE_TYPE_BUTT
}HI_FRMRATE_TYPE_E;

/*************************** Structure Definition ****************************/

typedef struct hi_VCODEC_FRMRATE_S
{
    HI_U32 u32fpsInteger;     /**<Integral part of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ���������, fps */
    HI_U32 u32fpsDecimal;     /**<Fractional part (calculated to three decimal places) of the frame rate (in frame/s)*/
			      /**<CNcomment: ������֡�ʵ�С�����֣�����3λ��, fps */
}HI_VCODEC_FRMRATE_S;

/**Defines the parameter of frame rate.*/
/**CNcomment: ����֡�����Բ����Ľṹ�� */
typedef struct hi_FRMRATE_PARAM_S
{
    HI_FRMRATE_TYPE_E	   enFrmRateType;  /**<The source of frame rate*//**<CNcomment: ֡����Դ���� */
    HI_VCODEC_FRMRATE_S	   stSetFrmRate;   /**<Setting frame rate*//**<CNcomment: ���õ�֡�� */
}HI_FRMRATE_PARAM_S;

/********************** Global Variable declaration **************************/

/******************************* API declaration *****************************/
HI_S32 OMX_PTSREC_Init(HI_VOID);
HI_S32 OMX_PTSREC_DeInit(HI_VOID);
HI_S32 OMX_PTSREC_Alloc(HI_HANDLE hHandle);
HI_S32 OMX_PTSREC_Free(HI_HANDLE hHandle);
HI_S32 OMX_PTSREC_Start(HI_HANDLE hHandle);
HI_S32 OMX_PTSREC_Stop(HI_HANDLE hHandle);
HI_S32 OMX_PTSREC_Reset(HI_HANDLE hHandle);
HI_S32 OMX_PTSREC_SetFrmRate(HI_HANDLE hHandle, HI_FRMRATE_PARAM_S *pstFrmRate);
HI_S32 OMX_PTSREC_GetFrmRate(HI_HANDLE hHandle, HI_FRMRATE_PARAM_S *pstFrmRate);
HI_U32 OMX_PTSREC_CalcStamp(HI_HANDLE hHandle, IMAGE *pstImage);
HI_U32 OMX_PTSREC_GetInterPtsDelta(HI_HANDLE hHandle);

#endif /* __PTS_RECV_H__ */
