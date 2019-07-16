/******************************************************************************

  Copyright (C), 2011-2014, HiSilicon Technologies Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_pdm.h
  Version	: Initial Draft
  Author	: HiSilicon multimedia software group
  Created	: 2011-xx-xx
  Description	: hi_unf_pdm.h header file
  History	:
  1.Date	: 2011/xx/xx
    Author	:
    Modification: This file is created.

******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_UNF_PDM_H__
#define __HI_UNF_PDM_H__

#include "hi_unf_common.h"
#include "hi_unf_mce.h"
#include "hi_go_surface.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif	/* End of #ifdef __cplusplus */

/*************************** Structure Definition ****************************/
/** \addtogroup	     PDM */
/** @{ */  /** <!-- [PDM] */

/**Defines the base config parameter*/
/** CNcomment:�������ò����ṹ��*/
typedef struct hiUNF_PDM_DISP_PARAM_S
{
	HI_UNF_DISP_E				enSrcDisp;			/**<source display*//**<CNcomment: ͬԴdisplayö��*/
    HI_UNF_ENC_FMT_E		enFormat;	    /**<Format*//**<CNcomment: ��ʽ*/
    HI_U32			u32Brightness;	    /**<Brightness*//**<CNcomment: ����*/
    HI_U32			u32Contrast;	    /**<Contrast*//**<CNcomment: �Աȶ�*/
    HI_U32			u32Saturation;	    /**<Saturation*//**<CNcomment: ���Ͷ�*/
    HI_U32			u32HuePlus;	    /**<HuePlus*//**<CNcomment: ɫ��*/
    HI_BOOL			bGammaEnable;	    /**<Is Gamma enable*//**<CNcomment: �Ƿ�ʹ��gamma*/
    HI_UNF_DISP_BG_COLOR_S	stBgColor;	    /**<Background Color*//**<CNcomment: ����ɫ*/
    HI_UNF_DISP_INTF_S		stIntf[HI_UNF_DISP_INTF_TYPE_BUTT];	/**<configuration of display interface*//**<CNcomment: ��ʾ�ӿ�����*/
    HI_UNF_DISP_TIMING_S	stDispTiming;	    /**<Display timeing*//**<CNcomment: ��ʾʱ��*/

    HIGO_PF_E			enPixelFormat;	    /**<Pixel format*//**<CNcomment: ���ظ�ʽ*/
    HI_UNF_DISP_OFFSET_S	stDispOffset;		/**<Display margin info*//**<CNcomment: ��ʾ�հ�����*/
    HI_U32			u32VirtScreenWidth;	/**<Virtual screen width*//**<CNcomment: ������Ļ��*/
    HI_U32			u32VirtScreenHeight;	/**<Virtual screen height*//**<CNcomment: ������Ļ��*/

    HI_UNF_DISP_ASPECT_RATIO_S	stAspectRatio;	    /**<The device aspect ratio*//**<CNcomment: �豸���߱�*/
    HI_UNF_HDMI_VIDEO_MODE_E	enVidOutMode;	    /**<HDMI output vedio mode*//**<CNcomment:HDMI�����Ƶģʽ*/
    HI_UNF_HDMI_DEEP_COLOR_E	enDeepColorMode;    /**<Deep Color output mode*//**<CNcomment:DeepColor���ģʽ*/
}HI_UNF_PDM_DISP_PARAM_S;

typedef struct hiUNF_PDM_SOUND_PARAM_S
{
    HI_U32		      u32PortNum;  /**<Outport number attached sound*/ /**<CNcomment:�󶨵�Sound�豸������˿���*/
    HI_UNF_SND_OUTPORT_S stOutport[HI_UNF_SND_OUTPUTPORT_MAX];	/**<Outports attached sound*/ /**<CNcomment:�󶨵�Sound�豸������˿�*/
    HI_U32		 au32Volume[HI_UNF_SND_OUTPUTPORT_MAX];
}HI_UNF_PDM_SOUND_PARAM_S;

typedef enum hiUNF_PDM_BASEPARAM_TYPE_E
{
    HI_UNF_PDM_BASEPARAM_DISP0 = 0,	/*HI_UNF_PDM_DISP_PARAM_S * */
    HI_UNF_PDM_BASEPARAM_DISP1,		/*HI_UNF_PDM_DISP_PARAM_S * */
    HI_UNF_PDM_BASEPARAM_SOUND0 = 10,
    HI_UNF_PDM_BASEPARAM_SOUND1,
    HI_UNF_PDM_BASEPARAM_SOUND2,
    HI_UNF_PDM_BASEPARAM_HDMI = 20,

    HI_UNF_PDM_BASEPARAM_BUTT = 0xFFFF,
}HI_UNF_PDM_BASEPARAM_TYPE_E;

typedef struct hiUNF_PDM_HDMI_PARAM_S
{
	HI_U8	 *pu8EDID;
	HI_U32	 *pu32EDIDLen;
}HI_UNF_PDM_HDMI_PARAM_S;

/** @} */  /*! <!-- Structure Definition end */

/******************************* API declaration *****************************/
/** \addtogroup	     PDM */
/** @{ */  /** <!-- [PDM] */
/**
\brief Obtains the basic configuration information.  CNcomment:��ȡBASE��������Ϣ CNend
\attention \n
N/A
\param[in]  pstBaseParam   Pointer to the basic parameters.  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetBaseParam(HI_UNF_PDM_BASEPARAM_TYPE_E enType, HI_VOID *pData);


/**
\brief Modifies the basic configuration information.  CNcomment:����BASE��������Ϣ CNend
\attention \n
N/A
\param[in]  pstBaseParam Pointer to the basic parameters.  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdateBaseParam(HI_UNF_PDM_BASEPARAM_TYPE_E enType, HI_VOID *pData);

/**
\brief Obtains the basic configuration information from the flash memory.
CNcomment:��ȡLOGO��������Ϣ CNend
\attention \n
N/A
\param[in]  pstLogoParam   Pointer to the logo parameter  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetLogoParam(HI_UNF_MCE_LOGO_PARAM_S *pstLogoParam);

/**
\brief Modifies the configuration of the logo parameter.  CNcomment:����LOGO��������Ϣ CNend
\attention \n
Update logo parameter, you must invoke this function befor update data of logo
\CNcomment:����logo�������ڸ���logo����ǰ�����ȵ��ô˺��� CNend
\param[in]  pstLogoParam   Pointer to the logo parameter  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdateLogoParam(HI_UNF_MCE_LOGO_PARAM_S *pstLogoParam);


/**
\brief Obtains the logo data from the flash memory. CNcomment:��ȡLOGO��������Ϣ CNend
\attention \n
N/A
\param[in]  pu8Content Pointer to the logo data that is written from the flash memory CNcomment:����bufָ�� CNend
\param[in]  u32Size  Size of the logo data to be written  CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetLogoContent(HI_U8 *pu8Content, HI_U32 u32Size);


/**
\brief Modifies the logo data.	CNcomment:����LOGO��������Ϣ CNend
\attention \n
Update data in logo partition, You must invoke HI_UNF_PDM_UpdateLogoParam to update logo parameter before invoke this function
\CNcomment:����logo���ݣ��ڴ˺���֮ǰ�����ȵ���HI_UNF_PDM_UpdateLogoParam��������logo���� CNend
\param[in]  pu8Content	 Pointer to the logo data that is read from the flash memory  CNcomment:����bufָ�� CNend
\param[in]  u32Size   Size of the logo data to be read	CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdateLogoContent(HI_U8 *pu8Content, HI_U32 u32Size);

/**
\brief Obtains the playing configuration information.  CNcomment:��ȡPLAY��������Ϣ CNend
\attention \n
N/A
\param[in]  pstPlayParam   Playing configuration information  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetPlayParam(HI_UNF_MCE_PLAY_PARAM_S *pstPlayParam);

/**
\brief	 Modifies the playing configuration information.  CNcomment:����PLAY��������Ϣ CNend
\attention \n
Update play parameter, you must invoke this function befor update data of play
\CNcomment:����play�������ڸ���play����ǰ�����ȵ��ô˺��� CNend
\param[in]  pstPlayParam  Playing configuration information  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdatePlayParam(HI_UNF_MCE_PLAY_PARAM_S *pstPlayParam);

/**
\brief Obtains the data being playing from the flash memory.  CNcomment:��ȡPLAY��������Ϣ CNend
\attention \n
N/A
\param[in]  pu8Content Pointer to the data that is read from the flash memory  CNcomment:����bufָ�� CNend
\param[in]  u32Size  Size of the data being played that is read from the flash memory  CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetPlayContent(HI_U8 *pu8Content, HI_U32 u32Size);


/**
\brief Updates the playing data part. CNcomment:����PLAY��������Ϣ CNend
\attention \n
Update data in play partition, You must invoke HI_UNF_PDM_UpdatePlayParam to update plat parameter before invoke this function
\CNcomment:����play���ݣ��ڴ˺���֮ǰ�����ȵ���HI_UNF_PDM_UpdatePlayParam��������play���� CNend
\param[in]  pu8Content	Pointer to the data that is written to the flash memroy	 CNcomment:����bufָ�� CNend
\param[in]  u32Size  Size of the data being played  CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdatePlayContent(HI_U8 *pu8Content, HI_U32 u32Size);

/**
\brief Obtains the playing configuration information from backup partition.  CNcomment:�ӱ��ݷ�����ȡPLAY��������Ϣ CNend
\attention \n
N/A
\param[in]  pstPlayParam   Playing configuration information  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetPlayBakParam(HI_UNF_MCE_PLAY_PARAM_S *pstPlayParam);

/**
\brief	 Modifies the playing configuration information to backup partition.  CNcomment:����PLAY��������Ϣ CNend
\attention \n
Update play parameter, you must invoke this function befor update data of play
\CNcomment:����play�������ڸ���play����ǰ�����ȵ��ô˺��� CNend
\param[in]  pstPlayParam  Playing configuration information  CNcomment:����ָ�� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdatePlayBakParam(HI_UNF_MCE_PLAY_PARAM_S *pstPlayParam);

/**
\brief Obtains the playing content from backup partition.  CNcomment:�ӱ��ݷ�����ȡPLAY��������Ϣ CNend
\attention \n
N/A
\param[in]  pu8Content Pointer to the data that is read from the flash memory  CNcomment:����bufָ�� CNend
\param[in]  u32Size  Size of the data being played that is read from the flash memory  CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_GetPlayBakContent(HI_U8 *pu8Content, HI_U32 u32Size);


/**
\brief Updates the playing content to backup partition. CNcomment:����PLAY���ݵ����ݷ��� CNend
\attention \n
Update data in play partition, You must invoke HI_UNF_PDM_UpdatePlayBakParam to update plat parameter before invoke this function
\CNcomment:����play���ݣ��ڴ˺���֮ǰ�����ȵ���HI_UNF_PDM_UpdatePlayBakParam��������play���� CNend
\param[in]  pu8Content	Pointer to the data that is written to the flash memroy	 CNcomment:����bufָ�� CNend
\param[in]  u32Size  Size of the data being played  CNcomment:���ݳ��� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error. CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_WRITE	     Write flash pation error. CNcomment:дFlash����ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_ERASE	     Erase flash pation error. CNcomment:����Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_INVALID_OPT      The operation is invalid. CNcomment:��Ч���� CNend
\see \n
N/A
*/
HI_S32	HI_UNF_PDM_UpdatePlayBakContent(HI_U8 *pu8Content, HI_U32 u32Size);


/**
\brief Obtains the device cfg info.  CNcomment:��ȡ�豸��ص�������Ϣ CNend
\attention \n
N/A
\param[in]  pstrCfgName Pointer to the cfg name,for exampe,
"MAC" to get the MAC address,"SN" to get the SN number.
Other configure items can be refered from the Readme file and BurnConfig.ini in HiproInfo tool directory.
CNcomment:�������������,����"MAC"Ϊ��ȡMAC��ַ,"SN"Ϊ��ȡSN��,
������������ο�HiproInfo ����Ŀ¼��Readme�ļ��������ļ� CNend
\param[in]  pstrCfgValue Pointer to the cfg output buffer  CNcomment:���
buffer�ĵ�ַ�����buffer���Ա����ȡ����ֵ CNend
\param[in]  u32Size  Size of the output buffer	CNcomment:���buffer���� CNend
\retval ::HI_SUCCESS	   Success. CNcomment:�ɹ� CNend
\retval :: HI_ERR_PDM_PTR_NULL	    Pointer is null. CNcomment:��ָ�� CNend
\retval :: HI_ERR_PDM_GET_MTDINFO_ERR	   Get flash pation infomation error.
CNcomment:��ȡFlash������Ϣʧ�� CNend
\retval :: HI_ERR_PDM_MTD_OPEN	    Open flash pation error. CNcomment:��
Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_MEM_ALLC	    Alloc memory error. CNcomment
:�����ڴ�ʧ�� CNend
\retval :: HI_ERR_PDM_MTD_READ	    Read flash pation error. CNcomment:��ȡ
Flash����ʧ�� CNend
\retval :: HI_ERR_PDM_GET_DEVINFO_ERR	   Parse device info failed. CNcomment
:����device info����ʧ��  CNend
\see \n
N/A
*/
HI_S32 HI_UNF_PDM_GetDeviceInfo(HI_CHAR * pstrCfgName, HI_CHAR * pstrCfgValue, HI_U32 u32Size);

/** @} */  /*! <!-- API declaration end */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
