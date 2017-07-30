/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_venc.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2010/04/07
  Description	:
  History	:
  1.Date	: 2010/04/07
    Author	: j00131665
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about video encoding (VENC). CNcomment: �ṩVENC�������Ϣ CNend
 */

#ifndef	 __HI_UNF_VENC_H__
#define	 __HI_UNF_VENC_H__

#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif

/********************************Struct Definition********************************/
/** \addtogroup	     VENC */
/** @{ */  /** <!-- ��VENC�� */

/**H.264 NALU type*/
/**CNcomment: H.264NALU���� */
typedef enum hiUNF_H264E_NALU_TYPE_E
{
    HI_UNF_H264E_NALU_PSLICE = 1,	/**<P slice NALU*/
    HI_UNF_H264E_NALU_ISLICE = 5,	/**<I slice NALU*/
    HI_UNF_H264E_NALU_SEI = 6,		/**<SEI NALU*/
    HI_UNF_H264E_NALU_SPS = 7,		/**<SPS NALU*/
    HI_UNF_H264E_NALU_PPS = 8,		/**<PPS NALU*/
    HI_UNF_H264E_NALU_BUTT
} HI_UNF_H264E_NALU_TYPE_E;

/**H.263 NALU type*/
/**CNcomment: H.263NALU���� */
typedef enum hiUNF_H263E_PACK_TYPE_E
{
    HI_UNF_H263E_NALU_PSLICE = 1,	/**<P slice NALU*/
    HI_UNF_H263E_NALU_ISLICE = 5,	/**<I slice NALU*/
    HI_UNF_H263E_NALU_SEI = 6,		/**<SEI NALU*/
    HI_UNF_H263E_NALU_SPS = 7,		/**<SPS NALU*/
    HI_UNF_H263E_NALU_PPS = 8,		/**<PPS NALU*/
    HI_UNF_H263E_NALU_BUTT
} HI_UNF_H263E_PACK_TYPE_E;

/**MPEG4 package type*/
/**CNcomment: MPEG4������� */
typedef enum hiUNF_MPEG4E_PACK_TYPE_E
{
    HI_UNF_MPEG4E_PACK_VO    = 1,	   /**<VO package*/ /**<CNcomment: VO ��*/
    HI_UNF_MPEG4E_PACK_VOS   = 2,	  /**<VOS package*/ /**<CNcomment: VOS ��*/
    HI_UNF_MPEG4E_PACK_VOL   = 3,	  /**<VOL package*/ /**<CNcomment: VOL ��*/
    HI_UNF_MPEG4E_PACK_VOP   = 4,	  /**<VOP package*/ /**<CNcomment: VOP ��*/
    HI_UNF_MPEG4E_PACK_SLICE = 5	/**<Slice package*/ /**<CNcomment: SLICE ��*/
} HI_UNF_MPEG4E_PACK_TYPE_E;

/**HEVC NALU type*/
/**CNcomment: HEVC NALU���� */
typedef enum hiUNF_HEVCE_NALU_TYPE_E
{
    HI_UNF_HEVCE_NALU_PSLICE = 1,    /**<P slice NALU*/
    HI_UNF_HEVCE_NALU_ISLICE,	     /**<I slice NALU*/
    HI_UNF_HEVCE_NALU_VPS,	     /**<VPS NALU*/
    HI_UNF_HEVCE_NALU_SPS,	     /**<SPS NALU*/
    HI_UNF_HEVCE_NALU_PPS,	     /**<PPS NALU*/
    HI_UNF_HEVCE_NALU_SEI,	     /**<SEI NALU*/
    HI_UNF_HEVCE_NALU_BUTT
} HI_UNF_HEVCE_NALU_TYPE_E;

/**Data type of the Encoder*/
/**CNcomment: �������������� */
typedef union hiUNF_VENC_DATA_TYPE_U
{
    HI_UNF_H264E_NALU_TYPE_E   enH264EType;	/**<H.264 encoding data*/ /**<CNcomment: h264��������*/
    HI_UNF_H263E_PACK_TYPE_E   enH263EType;	/**<H.263 encoding data*/ /**<CNcomment: h263��������*/
    HI_UNF_MPEG4E_PACK_TYPE_E  enMPEG4EType;	/**<MPEG4 encoding data*/ /**<CNcomment: MPEG4��������*/
    HI_UNF_HEVCE_NALU_TYPE_E   enHEVCEType;	/**<HEVC encoding data*/ /**<CNcomment: HEVC��������*/
}HI_UNF_VENC_DATA_TYPE_U;

/*Output stream attributes structure*/
/**CNcomment: ����������Խṹ�� */
typedef struct hiVENC_STREAM_S
{
    HI_U8		    *pu8Addr ;	     /**<Stream virtual address*/ /**<CNcomment: ���������ַ*/
    HI_U32		    u32SlcLen;	    /**<Stream length*/ /**<CNcomment: ��������*/
    HI_U32		    u32PtsMs;	     /**<Presentation time stamp (PTS), in ms*/ /**<CNcomment: ʱ�������λ�Ǻ���*/
    HI_BOOL		    bFrameEnd;	     /**<Frame end or not*/ /**<CNcomment: ��ʶ�Ƿ�Ϊ֡����*/
    HI_UNF_VENC_DATA_TYPE_U enDataType;	     /**Encoding data type*/ /**<CNcomment: ������������*/
}HI_UNF_VENC_STREAM_S;

/*Coding channal attributes structure*/
/**CNcomment: ����ͨ�����Խṹ�� */
typedef struct hiUNF_VENC_CHN_ATTR_S
{
    HI_UNF_VCODEC_TYPE_E	enVencType;	      /**<Encoder type*/ /**<CNcomment: ���������� */
    HI_UNF_VCODEC_CAP_LEVEL_E	enCapLevel;	  /**<Encoder level*/ /**<CNcomment: �������������� */
	HI_UNF_H264_PROFILE_E	    enVencProfile;    /**<H264 Profile of Encoder,it is just valid for H264 Encoder*/ /**<CNcomment: ����H264�ĵ��Σ�ֻ�ڶ�����H264Э�����������²���Ч*/
    HI_U32			u32Width;	  /**<Width, 4-byte aligned. The width can be configured dynamically in the limit of encoder level.*/
						  /**<CNcomment: ����,4����,������������Χ�ڿ�֧�ֶ�̬���� */
    HI_U32			u32Height;	  /**<Height, 4-byte aligned.The height can be configured dynamically in the limit of encoder level.*/
						  /**<CNcomment: �߶�,4����,������������Χ�ڿ�֧�ֶ�̬���� */
    HI_U32			u32StrmBufSize;	  /**<Stream buffer size, should be larger than width*height*2 of the encoder level's resolving power.You'd better set larger streamBufferSize if you set larger target bitrate or Qlevel.*/
						  /**<CNcomment: ����buffer��С,���õ�����buffer��СҪ>=�����������ֱ��ʵĿ�*��*2����������˽ϸߵ����ʻ�JPEGͼ�����������������ʵ���������buffer��С��*/
    HI_U32			u32RotationAngle; /**<Rotation angle. This parameter cannot be set.It must be set to 0.*/ /**<CNcomment: ��ת�Ƕ�,��Ч����,�����ó�0*/
    HI_BOOL			bSlcSplitEn;	  /**<Slice split enable,it is just valid for H264 Encoder*/ /**<CNcomment: �Ƿ�ʹ�ָܷ�slice,ֻ�ڶ�����H264Э�����������²���Ч*/
						  /**<CNcomment: �ָ�Ĵ�С��JPGE����MCUΪ��λ,H264����MP4���ֽ�Ϊ��λ, H263������ */
    HI_U32			u32TargetBitRate; /**<RC parameter for the VENC,it is just valid for H264 Encoder. It can be set dynamically.Some reference values as follows:above 5M for 1080P,above 3M for 720P, about 2M for D1*/
						   /**<CNcomment: Venc����RC����,���ڱ���H264Э����Ч���ɶ�̬����.���ֲο�ֵ����:1080P��5M���ϣ�720P��3M���ϣ�D1��2M����*/
    HI_U32			u32TargetFrmRate; /**<Target frame rate. It can be set dynamically.*/	      /**<CNcomment: Ŀ��֡��,�ɶ�̬���� */
    HI_U32			u32InputFrmRate;  /**<Input frame rate. It can be set dynamically. The value of u32TargetFrmRate is less than or equal to the value of u32InputFrmRate.
						       ** Attention the if in the mode of attach source to encode the InputFrmRate which set by user is in vain.*/
						  /**<CNcomment: ����֡��,�ɶ�̬����,u32TargetFrmRate <= u32InputFrmRate ,ע���ڰ�ģʽ����������û����õ�����֡�ʽ�ʧЧ*/
    HI_U32			u32Gop;			  /**<GOP size,it is just valid for H264 Encoder. It can be set dynamically.*/ /**<CNcomment: GOP��С,���ڱ���H264Э����Ч���ɶ�̬���� */
    HI_U32			u32MaxQp;	  /**<The maximum quantization parameter,it is just valid for H264 Encoder. It can be set dynamically.*/    /**<CNcomment: �����������,���ڱ���H264Э����Ч���ɶ�̬����*/
    HI_U32			u32MinQp;	  /**<The minimum quantization parameter,it is just valid for H264 Encoder. It can be set dynamically.*/    /**<CNcomment: ��С��������,���ڱ���H264Э����Ч���ɶ�̬����*/
    HI_BOOL				    bQuickEncode;     /**<Quick Encode Mode enable*/ /**<CNcomment:�Ƿ�ʹ�ܿ��ٱ���ģʽ*/
    HI_U8			u8Priority;	  /**<the Priority Level of the channal,should between 0 to the max num of channel minus 1.It can be set dynamically.*/
						  /**<CNcomment: ����ͨ�������ȼ����ԣ�ȡֵ��ΧΪ0~���ͨ����-1,�ɶ�̬����*/
    HI_U32			u32Qlevel;	  /**<The value ranges from 1 to 99 for the JPGE, it is just valid for JPEG Encoder.*/ /**<CNcomment: JPGEȡֵ��Χ1-99��ֻ�ڶ�����JPEG����������²���Ч */
    HI_U32			u32DriftRateThr;  /**<Encoder bitrate fluctuation threshold.If u32DriftRateThr = 20 means the fluctuation of threshold is 20%*/
						  /**<CNcomment: ���������ʲ�����ֵ�������ó�20����ʾ������ֵΪ20%*/

    HI_U32			u32SplitSize;	  /**<Split size. The size is in the unit of minimum coded unit (MCU) for the JPEG format and byte for the MP4 format. The split size can be ignored in H.263 format.*/
}HI_UNF_VENC_CHN_ATTR_S;

/** @} */  /** <!-- ==== Struct Definition End ==== */


/********************************API declaration********************************/
/** \addtogroup	     VENC */
/** @{ */  /** <!-- ��VENC�� */

/**
\brief Initializes the video encoder. CNcomment: ��ʼ����Ƶ������ CNend
\attention \n
Before using the VENC, you must call this API. CNcomment: ����VENCģ��Ҫ�����ȵ��øýӿ� CNend
\param[in] N/A CNcomment: �� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_DEV_NOT_EXIST No VENC device exists. CNcomment: �豸������ CNend
\retval ::HI_ERR_VENC_NOT_DEV_FILE The file is not a VENC file. CNcomment: �ļ����豸 CNend
\retval ::HI_ERR_VENC_DEV_OPEN_ERR The VENC device fails to start. CNcomment: ���豸ʧ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_Init(HI_VOID);


/**
\brief Deinitializes the video encoder. CNcomment: ȥ��ʼ����Ƶ������ CNend
\attention \n
N/A CNcomment: �� CNend
\param[in] N/A CNcomment: �� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_DEV_CLOSE_ERR The video encoder fails to stop. CNcomment: �رձ�����ʧ�� CNend
\see \n
N/A CNcomment: ��  CNend
*/
HI_S32 HI_UNF_VENC_DeInit(HI_VOID);


/**
\brief Obtains the default attributes of a VENC channel. CNcomment: ��ȡ����ͨ��Ĭ������ CNend
\attention \n
By default, the encoding size is D1, encoding format is H.264, and a frame is a slice.
CNcomment: Ĭ��D1���룬H.264��ʽ��һ֡Ϊһ��Slice CNend
\param[out] pstAttr Pointer to the attributes of a VENC channel. CNcomment: pstAttr ָ�����ͨ�����Ե�ָ�� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_NULL_PTR The input pointer parameter is null. CNcomment: ����ָ�����Ϊ��ָ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_GetDefaultAttr(HI_UNF_VENC_CHN_ATTR_S *pstAttr);


/**
\brief Creates a VENC channel. CNcomment: ������Ƶ����ͨ�� CNend
\attention \n
You must create a VENC channel before video encoding.
CNcomment: ������Ƶ����Ҫ�����ȴ�������ͨ�� CNend
\param[in] pstAttr Pointer to the attributes of a VENC channel. CNcomment: pstAttr ָ�����ͨ�����Ե�ָ�� CNend
\param[out] phVenc Pointer to the handle of a VENC channel. CNcomment: phVenc ָ�����ͨ�������ָ�� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ�  CNend
\retval ::HI_ERR_VENC_NULL_PTR The input pointer parameter is null. CNcomment: ����ָ������п�ָ�� CNend
\retval ::HI_ERR_VENC_CREATE_ERR The number of VENC channels exceeds the limit. CNcomment: ����ͨ�������� CNend
\retval ::HI_ERR_VENC_INVALID_PARA The channel attributes are incorrect. CNcomment: ͨ���������ô��� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A
CNcomment: ��  CNend
*/
HI_S32 HI_UNF_VENC_Create(HI_HANDLE *phVenc,const HI_UNF_VENC_CHN_ATTR_S *pstAttr);


/**
\brief Destroys a VENC channel. CNcomment: ������Ƶ����ͨ�� CNend
\attention \n
\param[in] hVenc Handle of a VENC channel. CNcomment: CNcomment: hVenc ����ͨ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No handle exists. CNcomment: ��������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A CNcomment: ��  CNend
*/
HI_S32 HI_UNF_VENC_Destroy(HI_HANDLE hVenc);


/**
\brief Attaches a VENC channel to the video source. CNcomment: �󶨱���ͨ������ƵԴ CNend
\attention \n
You must call this API before performing encoding and obtaining streams. CNcomment: ��ʼ����ͻ�ȡ����֮ǰ��Ҫ���ȵ��øýӿ� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[in] hSrc Data source handle CNcomment: hSrc ��ƵԴ��� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_INVALID_PARA The video source is invalid. CNcomment: ��ƵԴ����  CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_AttachInput(HI_HANDLE hVenc,HI_HANDLE hSrc);


/**
\brief Detaches a VENC channel from the video source. CNcomment: �����ƵԴ CNend
\attention \n
You must stop encoding before calling this API.
CNcomment: ���øýӿ���Ҫ����ֹͣ���� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ�  CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_INVALID_PARA The video source is invalid. CNcomment: ��ƵԴ���� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_CHN_INVALID_STAT Invalid state which the video encoder does not stop encoding. CNcomment: �쳣״̬,������δֹͣ���� CNend
\retval ::HI_ERR_VENC_CHN_NO_ATTACH The VENC channel doesn't attach any source. CNcomment: ����ͨ��û�а��κ�Դ CNend
\see \n
N/A CNcomment: ��  CNend
*/
HI_S32 HI_UNF_VENC_DetachInput(HI_HANDLE hVencChn);


/**
\brief Starts to perform encoding. CNcomment: ��ʼ���� CNend
\attention \n
You must initialize the video encoder, create a VENC channel, and attach the channel to the video source before calling this API.
CNcomment: ���øýӿ���Ҫ���ȳ�ʼ������������������ͨ��������ƵԴ CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_Start(HI_HANDLE hVenc);


/**
\brief Stops encoding. CNcomment: ֹͣ���� CNend
\attention \n
You must initialize the video encoder, create a VENC channel, attach the channel to the video source, and start to perform encoding before calling this API.
CNcomment: ���øýӿ���Ҫ���ȳ�ʼ������������������ͨ��������ƵԴ���Ѿ���ʼ���� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_Stop(HI_HANDLE hVenc);

/**
\brief Obtains VENC streams. CNcomment: ��ȡ��Ƶ�������� CNend
\attention \n
You must attach a VENC channel to the video source and start to perform encoding before calling this API.
The block time (in ms) is configurable. If u32TimeOutMs is set to 0, the block time is 0; if u32TimeOutMs is set to 0xFFFFFFFF, it indicates infinite wait. \n
If the block time is reached but no data is received, ::HI_ERR_VENC_BUF_EMPTY is returned.\n
If the wait time is 0 and there is no data, ::HI_ERR_VENC_BUF_EMPTY is returned.
CNcomment: ���øýӿ���Ҫ���Ȱ���ƵԴ����ʼ����
����ʱ��������ã�ʱ�䵥λΪ���룬����Ϊ0���ȴ�������Ϊ0xffffffffһֱ�ȴ���\n
����������ʱ�䣬��û�����ݵ���򷵻�::HI_ERR_VENC_BUF_EMPTY\n
����ȴ�ʱ��Ϊ0����û���������ݣ��򷵻�::HI_ERR_VENC_BUF_EMPTY\n CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[out] pstStream Pointer to the structure for storing streams CNcomment: pstStream ��������ṹ��ָ�� CNend
\param[in] u32TimeoutMs: Wait timeout, count in ms CNcomment: u32TimeoutMs���ȴ���ʱʱ�䣬��λms CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_NULL_PTR The stream pointer is null. CNcomment: ����ָ��Ϊ�� CNend
\retval ::HI_ERR_VENC_BUF_EMPTY Streams fail to be obtained. CNcomment: ��ȡ����ʧ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_AcquireStream(HI_HANDLE hVenc,HI_UNF_VENC_STREAM_S *pstStream, HI_U32 u32TimeoutMs);


/**
\brief Releases VENC streams. CNcomment: �ͷ���Ƶ�������� CNend
\attention \n
You must obtain streams and keep the streams unchanged before calling this API.
The stream which you get first should be release first.
CNcomment: ���øýӿ���Ҫ���Ȼ�ȡ�������Ҳ��ܸı��������ݡ�
�Ȼ�ȡ��������Ҫ���ͷš� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[in] pstStream Pointer to the structure for storing streams CNcomment: pstStream ��������ṹ��ָ�� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_NULL_PTR The stream pointer is null. CNcomment: ����ָ��Ϊ�� CNend
\retval ::HI_ERR_VENC_CHN_RELEASE_ERR Streams fail to be released. CNcomment: �ͷ�����ʧ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_ReleaseStream(HI_HANDLE hVenc, const HI_UNF_VENC_STREAM_S *pstStream);


/**
\brief Sets the encoding channel attributes dynamically. CNcomment: ��̬���ñ���ͨ������ CNend
\attention \n
You must create a VENC channel before calling this API.
This API just can change these attributes as follows:input framerate,target output framerate,target output bitrate,gop,
max/min QP,channel priority, whether use QuickEncode mode and even the encode width and height within the limits of the encoder level.
Moreover,even though you can't change the attributes of encoder level,encoder type,Stream buffer size,Rotation angle,Slice split enable and so on,
you should still assign the real value to them at that time.
It's better that you should call HI_UNF_VENC_GetAttr() to obtain the attributes of a VENC channel before calling this API.
CNcomment: ���øýӿ���Ҫ���ȴ�������ͨ�� .�ýӽӿ�ֻ�ܶ�̬����������ͨ������:����֡�ʣ�Ŀ�����֡�ʣ�Ŀ��������ʣ�GOPֵ�����/��С����������
ͨ�����ȼ��� ���ٱ���ʹ�ܣ������ڱ�����������Χ�¶�̬�ı������ߡ����⣬��ʹ�ýӿڲ��ܶ�̬�ı����������������Э�飬����buffer��С��
��ת�Ƕȣ��ָ����ʹ�ܵ����ԣ��ڵ��øýӿ�ʱ�㻹��Ҫ����Щͨ�����Ը��ϵ�ʱ��ʵ��ֵ������ڵ��øýӿ�֮ǰ����HI_UNF_VENC_GetAttr()�ӿڻ�ȡ����ʱ��ͨ������ CNend
\param[in] Venc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[in] pstAttr Pointer to the attributes of a VENC channel CNcomment: pstAttr ��ű���ͨ�����Ե�ָ�� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_INVALID_PARA The channel attributes are incorrect. CNcomment: ͨ���������ô��� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_NULL_PTR The pointer is null. CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_VENC_NOT_SUPPORT This change of attributes dosen't be supported. CNcomment: ��֧�ָ����Զ�̬���� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_SetAttr(HI_HANDLE hVenc,const HI_UNF_VENC_CHN_ATTR_S *pstAttr);


/**
\brief Obtains the attributes of a VENC channel. CNcomment: ��ȡ����ͨ������ CNend
\attention \n
You must create a VENC channel before calling this API.
CNcomment: ���øýӿ���Ҫ���ȴ�������ͨ�� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[out] pstAttr Encoding channel attribute CNcomment: pstAttr ����ͨ������ CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_NULL_PTR The pointer is null. CNcomment: ָ��Ϊ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_GetAttr(HI_HANDLE hVenc, HI_UNF_VENC_CHN_ATTR_S *pstAttr);


/**
\brief Applies for I frames. CNcomment: ����I֡ CNend
\attention \n
The video encoder encodes an I frame as soon as possible after you call this API.\n
You can call this API when you set up a video call or fix errors.\n
If you call this API repeatedly in a short period, I frames may be not generated each time.\n
CNcomment: ���øýӿں󣬱������ᾡ������һ��I֡��.\n
�˽ӿ�һ�����ڿ��ӵ绰������ͨ�������ʹ���ָ�.\n
�˽ӿ�ֻ��"���������"��������һ��I֡��������ڶ�ʱ���ڶ�ε��ô˽ӿڣ���ô���ܱ�֤ÿ�ε��ö��ܶ�Ӧ�����һ��I֡��.\n CNend
\param[in] hVencChn Handle of a VENC channel CNcomment: hVencChn ����ͨ����� CNend
\retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NO_INIT The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_RequestIFrame(HI_HANDLE hVencChn);


/**
\brief Input frame to VENC. CNcomment: ���������֡ CNend
\attention \n
You must create a VENC channel before calling this API.
If the venc channel has already attach the source,::HI_ERR_VENC_CHN_INVALID_STAT is returned.
This API should be matched with the API: HI_UNF_VENC_DequeueFrame.
HI_UNF_VENC_QueueFrame is used to send frame data to Encoder for user and HI_UNF_VENC_DequeueFrame is used to call the Encoder
to receive the frame data which has already be processed.
CNcomment: ���øýӿ���Ҫ���ȴ�������ͨ��.
�������ͨ���Ѿ���Դ���᷵��HI_ERR_VENC_CHN_INVALID_STAT ��Ч����
�ýӿ���Ҫ�� HI_UNF_VENC_DequeueFrame �ӿ����ʹ�á�
HI_UNF_VENC_QueueFrame�ӿ�����Ϊ�û��ṩһ���ӿ����������֡�����룬HI_UNF_VENC_DequeueFrame�ӿ��Ǳ������黹�Ѿ�������֡ CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[in] pstFrameinfo Frame information struct CNcomment: ֡��Ϣ���� CNend
\retval ::HI_SUCCESS			  Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST	  No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NULL_PTR		  The pointer is null. CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_VENC_NO_INIT		  The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_CHN_INVALID_STAT	  Invalid state which the VENC channel has already attach source. CNcomment: �쳣״̬��������ͨ���Ѿ���Դ CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_QueueFrame(HI_HANDLE hVenc, HI_UNF_VIDEO_FRAME_INFO_S *pstFrameinfo);


/**
\brief release frame from VENC. CNcomment: ���������֡ CNend
\attention \n
You must create a VENC channel before calling this API.
If the venc channel has already attach the source,::HI_ERR_VENC_CHN_INVALID_STAT is returned.
Refer to the attention of the API: HI_UNF_VENC_QueueFrame.
If HI_UNF_VENC_DequeueFrame return HI_SUCCESS, it means the corresponding frame buffer could be set free by user.
CNcomment: ���øýӿ���Ҫ���ȴ�������ͨ��.
�������ͨ���Ѿ���Դ���᷵��HI_ERR_VENC_CHN_INVALID_STAT ��Ч����
ע��������� HI_UNF_VENC_QueueFrame�ӿڡ����HI_UNF_VENC_DequeueFrame�ӿڷ��سɹ�����ζ�Ŷ�Ӧ��֡���û������ͷ� CNend
\param[in] hVenc Handle of a VENC channel CNcomment: hVenc ����ͨ����� CNend
\param[out] pstFrameinfo Frame information struct CNcomment: ֡��Ϣ���� CNend
\retval ::HI_SUCCESS			   Success CNcomment: �ɹ� CNend
\retval ::HI_ERR_VENC_CHN_NOT_EXIST	   No VENC channel handle exists. CNcomment: ����ͨ����������� CNend
\retval ::HI_ERR_VENC_NULL_PTR		   The pointer is null. CNcomment: ָ��Ϊ�� CNend
\retval ::HI_ERR_VENC_NO_INIT		   The video encoder is not initialized. CNcomment: ������δ��ʼ�� CNend
\retval ::HI_ERR_VENC_CHN_INVALID_STAT	   Invalid state which the VENC channel has already attach source. CNcomment: �쳣״̬��������ͨ���Ѿ���Դ CNend
\see \n
N/A CNcomment: �� CNend
*/
HI_S32 HI_UNF_VENC_DequeueFrame(HI_HANDLE hVenc, HI_UNF_VIDEO_FRAME_INFO_S *pstFrameinfo);

/** @} */  /** <!-- ==== API Declaration End ==== */
#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif

#endif//__HI_UNF_VENC_H__
