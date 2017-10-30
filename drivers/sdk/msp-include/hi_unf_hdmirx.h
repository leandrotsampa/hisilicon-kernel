/******************************************************************************

  Copyright (C), 2012-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_hdmirx.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2013/09/27
  Description	:
  History	:
  1.Date	: 2013/09/27
    Author	: t00202585
    Modification: Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_HDMIRX_H__
#define __HI_UNF_HDMIRX_H__

/* add include here */
//#include <linux/ioctl.h>
//#include "hi_sdk_comm.h"
//#include "hi_module.h"
#include "hi_unf_common.h"
#include "hi_unf_ai.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     HDMI */
/** @{ */  /** <!-- [HDMI] */

/**the config parameter of HDMI interface*/
/**CNcomment:HDMI �ӿڲ������� */
typedef struct hiUNF_HDMIRX_TIMING_INFO_S
{
    HI_U32					u32Width;	    /**<HDMIRX Hactive*//**<CNcomment:HDMIRX ����Чֵ */
    HI_U32					u32Height;	    /**<HDMIRX Vactive*//**<CNcomment:HDMIRX ����Чֵ */
    HI_U32					u32FrameRate;	    /**<HDMIRX frequency of vsync*//**<CNcomment:HDMIRX ��Ƶ�� */
    HI_UNF_COLOR_SPACE_E			enColorSpace;	    /**<HDMIRX color space*//**<CNcomment:HDMIRX ɫ�ȿռ� */
    HI_UNF_VIDEO_FORMAT_E			enPixelFmt;	    /**<HDMIRX video formate*//**<CNcomment:HDMIRX ��Ƶ��ʽ */
    HI_UNF_PIXEL_BITWIDTH_E			enBitWidth;	    /**<HDMIRX video BitWidth*//**<CNcomment:HDMIRX ��Ƶλ�� */
    HI_BOOL					bInterlace;	    /**<HDMIRX video interlace or progressive*//**<CNcomment:HDMIRX HDMIRX��Ƶɨ�跽ʽ�����л��Ǹ��� */
    HI_UNF_OVERSAMPLE_MODE_E			enOversample;	    /**<HDMIRX video Oversample*//**<CNcomment:HDMIRX ��Ƶ��������С */
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E	en3dFmt;	    /**<HDMIRX video 3D formate*//**<CNcomment:HDMIRX ��Ƶ3D��ʽ */
    HI_BOOL				bHdmiMode;	    /**<HDMIRX video HDMI or DVI*//**<CNcomment:HDMIRX��Ƶģʽ��HDMI����DVI */
    HI_U32					u32Vblank;	    /**<HDMIRX video Vblank��the value must set when the 3D formate is Frame PACKING*//**<CNcomment:HDMIRX Vblankֵ��������Ƶ��ʽΪ3D Frame PACKINGʱ��Ч */
    HI_BOOL						    bPcMode;	    /**<HDMIRX PC Timing Mode flag*//**<CNcomment:HDMIRX PC Timing��־λ*/
    HI_UNF_RGB_RANGE_E			enRGBRange;	    /**<HDMIRX RGB Quantization Range*//**<CNcomment:HDMIRX RGB ������Χ*/
    HI_U32				u32TimingIdx;	    /**<HDMIRX Timing Inedex Table*//**<CNcomment:HDMIRX Timing ��Ӧ��Index*/
    HI_BOOL				bMHL;		    /**<HDMIRX MHL flag*//**<CNcomment:HDMIRX MHL��־λ*/
}HI_UNF_HDMIRX_TIMING_INFO_S;

/**HDMI port ID *//**CNcomment:HDMI port ID  */
typedef enum hiUNF_HDMIRX_PORT_E
{
    HI_UNF_HDMIRX_PORT0,					       /**<HDMIRX port 0*/ /**<CNcomment:HDMIRX port0 */
    HI_UNF_HDMIRX_PORT1,					       /**<HDMIRX port 1*/ /**<CNcomment:HDMIRX port1 */
    HI_UNF_HDMIRX_PORT2,					       /**<HDMIRX port 2*/ /**<CNcomment:HDMIRX port2 */
    HI_UNF_HDMIRX_PORT3,					       /**<HDMIRX port 3*/ /**<CNcomment:HDMIRX port3 */
    HI_UNF_HDMIRX_PORT_BUTT
} HI_UNF_HDMIRX_PORT_E;

/**the config parameter of EDID interface*/
/**CNcomment:EDID �ӿڲ������� */
typedef struct hiUNF_HDMIRX_EDID_S
{
    HI_U32					au32Edid[256];	     /**<HDMIRX EDID Value*//**<CNcomment:HDMIRX EDID ֵ */
    HI_U32					au32Addr[4];	     /**<HDMIRX EDID port Address*//**<CNcomment:HDMIRX EDID ��Ӧport�ڵ�ַ*/
}HI_UNF_HDMIRX_EDID_S;

/**the config parameter of HDCP interface*/
/**CNcomment:HDCP �ӿڲ������� */
typedef struct hiUNF_HDMIRX_HDCP_S
{
    HI_U8					au32Hdcp[332];	      /**<HDMIRX HDCP Value*//**<CNcomment:HDMIRX HDCP ֵ */
}HI_UNF_HDMIRX_HDCP_S;

/**the config parameter of OffLineDetect Status interface*/
/**CNcomment:���߼�� �ӿڲ������� */
typedef struct hiUNF_HDMIRX_OFF_LINE_DET_S
{
    HI_UNF_HDMIRX_PORT_E			enPort;			/**<HDMIRX port ID */ /**<CNcomment:HDMIRX port ID */
    HI_BOOL					bConnected;		/**<HDMIRX OffLineDetect Status for callback*/ /**<CNcomment:HDMIRX ���߼��״̬�����ڷ���ֵ */
}HI_UNF_HDMIRX_OFF_LINE_DET_S;

/**
\brief the whole initialization of the hdmirx. CNcomment:HDMIRX�ӿ�����������ʼ�� CNend
\attention  this func should be called before vo_init and after disp_init. CNcomment:������DISP����Setup֮���VO����Setup֮ǰ�� CNend
\param CNcomment:�� CNend
\retval HI_SUCCESS  success. CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_Init(HI_VOID);

/**
\brief deinit the hdmirx. CNcomment:HDMIRX�ӿ�ȥ��ʼ�� CNend
\attention  this must be called after vo exited and before disp	 exited . CNcomment:������VO����Exit֮���DISP����Exit֮ǰ�� CNend
\param CNcomment:�� CNend
\retval HI_SUCCESS	success.CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_DeInit(HI_VOID);

/**
\brief create hdmirx device.Select the input port. CNcomment:����HDMIRX�豸,ѡ������port�� CNend
\attention \n
\param[in] HI_UNF_HDMIRX_PORT_E	 hdmirx device id. CNcomment:Ҫ�򿪵�HDMIRX port�� ID CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_Connect(HI_UNF_HDMIRX_PORT_E enPort);

/**
\brief disConnect the handler created by  HI_UNF_HDMIRX_Connect. CNcomment:������HI_UNF_HDMIRX_Connect�����ľ�� CNend
\attention \n
\param CNcomment:�� CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_DisConnect(HI_VOID);

/**
\brief Get the current HDCP authentication Status. CNcomment:��ѯ��ǰHDCP״̬
\attention \n
\param[in] *HI_BOOL  callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetHdcpStatus(HI_BOOL *pbHdcpSta);

/**
\brief Get the current timing information. CNcomment:��ȡ��ǰTiming��Ϣ
\attention \n
\param[in] *HI_UNF_HDMIRX_TIMING_INFO_S	 callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetTimingInfo(HI_UNF_HDMIRX_TIMING_INFO_S *pstTimingInfo);

/* Get the Timing hdcp authentication status */
/**
\brief Get the current Audio information. CNcomment:��ȡ��ǰ��Ƶ��Ϣ
\attention \n
\param[in] *HI_UNF_AI_HDMI_ATTR_S  callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetAudioInfo(HI_UNF_AI_HDMI_ATTR_S *pstAudioInfo);

/**
\brief Get the signal status like no signal/unstable/support . CNcomment:��ѯ��ǰ��Ƶ�ź�״̬�����źš����ȶ����ȶ�
\attention \n
\param[in] *HI_UNF_SIG_STATUS_E	 callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetSignalStatus(HI_UNF_SIG_STATUS_E *penStatus);

/**
\brief Get the Audio status like no signal/unstable/support . CNcomment:��ѯ��ǰ��Ƶ�ź�״̬�����źš����ȶ����ȶ�
\attention \n
\param[in] *HI_UNF_SIG_STATUS_E	 callback function CNcomment:�ص����� CNend
\retval HI_SUCCESS   success.	CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetAudioStatus(HI_UNF_SIG_STATUS_E *penStatus);

/**
\brief Update the EDID in SRAM. CNcomment:����EDID ��SRAM�� CNend
\attention \n
\param[in] *HI_UNF_HDMIRX_EDID_S  key struct point CNcomment: key�Ľṹָ��
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_UpdateEdid(HI_UNF_HDMIRX_EDID_S *pstEdid);

/**
\brief Load HDCP key. CNcomment:����hdcpkey CNend
\attention \n
\param[in] *HI_UNF_HDMIRX_HDCP_S  key struct point CNcomment: key�Ľṹָ��
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_LoadHdcp(HI_UNF_HDMIRX_HDCP_S *pstHdcp);

/**
\brief	Enable the main thread of hdmirx or not CNcomment:HDMIRX ���߳�ʹ�� CNend
\attention \n
\param[in] HI_BOOL  Enable  main thread or no CNcomment: HDMIRX ���߳��Ƿ�ʹ��
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
//HI_S32 HI_UNF_HDMIRX_EnMainThread(HI_BOOL bEn);

/**
\brief	Get the port OffLineDetect Status CNcomment:��ȡport�����߼��״̬ CNend
\attention \n
\param[in] HI_UNF_HDMIRX_PORT_E	 The port ID  CNcomment: HDMIRX port��ID
\param[in] *HI_BOOL  callback the port OffLineDetect Status CNcomment:�ص����������ص�ǰ�����߼��״̬ CNend
\retval HI_SUCCESS     success.	 CNcomment:�ɹ� CNend
\retval please refer to the err code definitino of mpi.CNcomment:��ο�MPI������ CNend
\see \n
CNcomment:�� CNend
*/
HI_S32 HI_UNF_HDMIRX_GetOffLineDetStatus(HI_UNF_HDMIRX_PORT_E enPort, HI_BOOL *pbConnected);

/** @} */  /** <!-- ==== API declaration end ==== */
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
