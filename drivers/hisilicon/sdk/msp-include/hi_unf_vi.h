/******************************************************************************

  Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_unf_vi.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2010/03/26
  Description	:
  History	:
  1.Date	: 2010/03/26
    Author	: j00131665
    Modification: Created file

 *******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 * \brief Describes the information about video input (VI). CNcomment: �ṩVI�������Ϣ CNend
 */

#ifndef	 __HI_UNF_VI_H__
#define	 __HI_UNF_VI_H__

#include "hi_type.h"
#include "hi_unf_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif

/********************************Macro Definition********************************/
/** \addtogroup	     VI */
/** @{ */  /** <!-- ��VI�� */
/**Maximum external buffer number*/
/**CNcomment: VI�����ⲿ������������*/
#define MAX_VI_EXT_BUF_NUM (16)

/** @} */  /** <!-- ==== Macro Definition end ==== */

/********************************Struct Definition********************************/
/** \addtogroup	     VI */
/** @{ */  /** <!-- ��VI�� */

/**Input port */
/**CNcomment: ����˿� */
typedef enum hiUNF_VI_E
{
    HI_UNF_VI_PORT0 = 0,      /**<Port 0 *//**<CNcomment: �˿�0*/
    HI_UNF_VI_PORT1,	      /**<Port 1 *//**<CNcomment: �˿�1*/
    HI_UNF_VI_BUTT
} HI_UNF_VI_E;

/**Input interface mode */
/**CNcomment: ����ӿ�ģʽ */
typedef enum hiUNF_VI_INPUT_MODE_E
{
    HI_UNF_VI_MODE_BT656_576I = 0,  /**<ITU-R BT.656 YUV4:2:2 standard, 576I *//**<CNcomment: ITU-R BT.656 YUV4:2:2 ��׼��576I */
    HI_UNF_VI_MODE_BT656_480I,	    /**<ITU-R BT.656 YUV4:2:2 standard, 480I *//**<CNcomment: ITU-R BT.656 YUV4:2:2 ��׼��480I */
    HI_UNF_VI_MODE_BT601_576I,	    /**<ITU-R BT.601 YUV4:2:2 standard, 576I *//**<CNcomment: ITU-R BT.601 YUV4:2:2 ��׼ */
    HI_UNF_VI_MODE_BT601_480I,	    /**<ITU-R BT.601 YUV4:2:2 standard, 480I *//**<CNcomment: ITU-R BT.601 YUV4:2:2 ��׼ */
    HI_UNF_VI_MODE_BT1120_640X480P, /**<ITU-R BT.1120 YUV4:2:2 standard, 480P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��640x480P */
    HI_UNF_VI_MODE_BT1120_480P,	    /**<ITU-R BT.1120 YUV4:2:2 standard, 480P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��720x480P */
    HI_UNF_VI_MODE_BT1120_576P,	    /**<ITU-R BT.1120 YUV4:2:2 standard, 576P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��720x576P */
    HI_UNF_VI_MODE_BT1120_720P_50,  /**<ITU-R BT.1120 YUV4:2:2 standard, 720P_50 *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��720P_50 */
    HI_UNF_VI_MODE_BT1120_720P_60,  /**<ITU-R BT.1120 YUV4:2:2 standard, 720P_60 *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��720P_60 */
    HI_UNF_VI_MODE_BT1120_1080I_50, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080I_50 *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080I_50 */
    HI_UNF_VI_MODE_BT1120_1080I_60, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080I_60 *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080I_60 */
    HI_UNF_VI_MODE_BT1120_1080P_25, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080P_25 */
    HI_UNF_VI_MODE_BT1120_1080P_30, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080P_30 */
    HI_UNF_VI_MODE_BT1120_1080P_50, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080P_50 */
    HI_UNF_VI_MODE_BT1120_1080P_60, /**<ITU-R BT.1120 YUV4:2:2 standard, 1080P *//**<CNcomment: ITU-R BT.1120 YUV4:2:2 ��׼��1080P_60 */
    HI_UNF_VI_MODE_DIGITAL_CAMERA_480P_30,    /**<Digital camera. The data format can be RGB or YCbCr,480P_30*//**<CNcomment:��������ͷ�����ݿ�����RGB����YCbCr��480P_30 */
    HI_UNF_VI_MODE_DIGITAL_CAMERA_576P_30,    /**<Digital camera. The data format can be RGB or YCbCr,576P_30 *//**<CNcomment:��������ͷ�����ݿ�����RGB����YCbCr��576P_30*/
    HI_UNF_VI_MODE_DIGITAL_CAMERA_720P_30,    /**<Digital camera. The data format can be RGB or YCbCr,720P_30 *//**<CNcomment:��������ͷ�����ݿ�����RGB����YCbCr��720P_30 */
    HI_UNF_VI_MODE_DIGITAL_CAMERA_1080P_30,   /**<Digital camera. The data format can be RGB or YCbCr,1080P_30 *//**<CNcomment:��������ͷ�����ݿ�����RGB����YCbCr ��1080P_30*/
    HI_UNF_VI_MODE_HDMIRX,		/**HDMI INPUT *//**<CNcomment: ITU-R YUV4:4:4 ��׼ �����ź�*/
    HI_UNF_VI_MODE_BUTT
} HI_UNF_VI_INPUT_MODE_E;

/**VI frame buffer management mode */
/**CNcomment: VI֡���������ʽ */
typedef enum hiUNF_VI_BUF_MGMT_E
{
    HI_UNF_VI_BUF_ALLOC = 0,  /**<VI alloc buffer *//**<CNcomment: VI����֡BUF */
    HI_UNF_VI_BUF_MMAP,	      /**<User alloc frame buffer, then maps it to VI *//**<CNcomment: �û�����֡BUF����ӳ���VI */
    HI_UNF_VI_BUF_BUTT
} HI_UNF_VI_BUF_MGMT_E;

/**VI frame buffer struct */
/**CNcomment: VI֡����ṹ�� */
typedef struct hiUNF_VI_BUFF_ATTR_S
{
    HI_VOID *pUsrVirAddr[MAX_VI_EXT_BUF_NUM];  /**<User virtual address *//**<CNcomment: �û�̬�����ַ*/
    HI_U32 u32PhyAddr[MAX_VI_EXT_BUF_NUM];     /**<Physical address *//**<CNcomment: ������ַ*/
    HI_U32 u32BufNum;			       /**<Buffer number *//**<CNcomment: ����������*/
    HI_U32 u32Stride;			       /**<Stride of external frame buffer *//**<CNcomment:�ⲿ֡���stride*/
} HI_UNF_VI_BUFFER_ATTR_S;


/**Vvideo 3D to 2D transfer mode */
/**CNcomment: 3D����ģʽ */
typedef enum hiUNF_VI_3DT2D_MODE_E
{
    HI_UNF_VI_3DT2D_OFF = 0,	    /**< Keep normal left and right eye 3D format *//**<CNcomment: ����3D��ʽ����������������ͼ�� */
    HI_UNF_VI_3DT2D_L,		    /**< Keep normal left eye 3D format*//**<CNcomment: ����3D��ʽ������ͼ�� */
    HI_UNF_VI_3DT2D_R,		    /**< Keep normal right eye 3D format*//**<CNcomment: ����3D��ʽ������ͼ�� */

    HI_UNF_VI_3DT2D_BUTT,
} HI_UNF_VI_3DT2D_MODE_E;


/**VI attributes */
/**CNcomment: VI���� */
typedef struct hiUNF_VI_ATTR_S
{
    HI_BOOL			      bVirtual;		    /**<Whether to create virtual VI, only u32BufNum is valid in virtual VI mode *//**<CNcomment: �Ƿ񴴽�����VI������VI��ֻ��u32BufNum������Ч*/
    HI_UNF_VI_INPUT_MODE_E	      enInputMode;	    /**<Video input mode *//**<CNcomment: ��Ƶ����ģʽ */
    HI_RECT_S			      stInputRect;	    /**<Crop region of a window *//**<CNcomment: ���ڵĲü����� */
    HI_UNF_VIDEO_FORMAT_E	      enVideoFormat;	    /**<Output Video format *//**<CNcomment: ��Ƶ��ʽ */
    HI_UNF_VI_BUF_MGMT_E	      enBufMgmtMode;	    /**<VI frame buffer management mode *//**<CNcomment: VI֡���������ʽ */
    HI_U32			      u32BufNum;	    /**<Number of available buffers *//**<CNcomment: ���õ�֡buf�ĸ��� */

    HI_BOOL			      bInterlace;	    /**<Intput video interlace or progressive *//**<CNcomment: ���и�����Ϣ */
    HI_U32			      u32Width;		    /**<Intput video width *//**<CNcomment: Դͼ��һ֡�Ŀ���,3D��ʽΪ���ۿ��� */
    HI_U32			      u32Height;	    /**<Intput video feight *//**<CNcomment: Դͼ��һ֡�ĸ߶ȣ��������ź��������ĸ߶ȣ������ź���һ֡�ĸ߶ȣ�3D��ʽΪ���ۿ��� */
    HI_U32			      u32Vblank;		/**<Intput video field blanking width, used 3d FB*//**<CNcomment: �����������ȣ����ڴ���3D��ʽFP */
    HI_U32			      u32FrameRate;	    /**<Intput video intput frequency *//**<CNcomment: ����֡�� [24Hz,85] */
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E en3dFmt;		    /**<Intput video format 2D or3D *//**<CNcomment: 2D/3D ��ʽ */
    HI_UNF_VIDEO_FORMAT_E	      enPixFmt;		    /**<Intput pixel format *//**<CNcomment: �������ظ�ʽ RGB444,YUV444/422 */
    HI_UNF_PIXEL_BITWIDTH_E	      enSrcBitWidth;	    /**<Intput pixel Width *//**<CNcomment: ����λ�� 8/10/12BIT */
    HI_UNF_OVERSAMPLE_MODE_E	      enOverSample;	    /**<Intput Over Sample format *//**<CNcomment: ������ģʽ */
    HI_UNF_COLOR_SPACE_E	      enColorSpace;	    /**<Intput Color Space *//**<CNcomment: ɫ�ʿռ� */
    HI_UNF_VI_3DT2D_MODE_E	      enDst3DT2DMode;	    /**<video 3D to 2D mode *//**<CNcomment: ��̬,3D����ģʽ���ɰ�ģ��(VENC/VDP)ȷ�� */
    HI_UNF_PIXEL_BITWIDTH_E	      enDstBitWidth;	    /**<output pixel Width *//**<CNcomment: ��̬,����Ϊ����λ��Ϊ8bit��8bit���������8bit��10bit����������ɰ�ģ��ȷ�����֡�� */
} HI_UNF_VI_ATTR_S;
/** @} */  /** <!-- ==== Struct Definition End ==== */

/********************************API Declaration********************************/
/** \addtogroup	     VI */
/** @{ */  /** <!-- ��VI�� */

/**
 \brief Initializes the video input unit (VIU). CNcomment: ��ʼ��VI CNend
 \attention \n
Before calling the VIU, you must call this application programming interface (API).
CNcomment: ����VIģ��Ҫ�����ȵ��øýӿ� CNend
 \param[in] N/A CNcomment: �� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_DEV_NOT_EXIST No VI device exists. CNcomment: �豸������ CNend
 \retval ::HI_ERR_VI_NOT_DEV_FILE The file is not a VI file. CNcomment: �ļ����豸 CNend
 \retval ::HI_ERR_VI_DEV_OPENED The VI device fails to be started. CNcomment: ���豸ʧ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_Init(HI_VOID);

/**
 \brief Deinitializes the VIU. CNcomment: ȥ��ʼ��VI CNend
 \attention \n
 \param[in] N/A CNcomment: �� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_DeInit(HI_VOID);

/**
 \brief Obtains the attributes of a VI port. CNcomment: ��ȡVI�˿�Ĭ������ CNend
 \attention \n
By default, port 0 is used, half D1 and BT656 formats are used, the data of the odd field is collected, and the semi-planar YUV4:2:0 data is output.
CNcomment: Ĭ��Port=0, HALF-D1, BT656���ɼ�ż�������SemiPlanner YUV4:2:0��ʽ���� CNend
 \param[out] pstAttr Pointer to VI attributes CNcomment: VI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_GetDefaultAttr(HI_UNF_VI_ATTR_S *pstAttr);

/**
 \brief Set the attributes of a VI port. CNcomment: ����VI Port���� CNend
 \attention \n
This reserved API is combined with HI_UNF_VI_Create, and cannot be called dynamically.
CNcomment: Ԥ���ӿڣ���Create��һ�����ɶ�̬���� CNend
 \param[in] hVi VI handle CNcomment: VI��� CNend
 \param[in] pstAttr  Pointer to VI attributes CNcomment: VI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \retval ::HI_ERR_VI_CHN_INIT_BUF_ERR An error occurs when the buffer is initialized. CNcomment: ��ʼ��buffer���� CNend
 \retval ::HI_ERR_VI_INVALID_PARA The attribute parameters are incorrect. CNcomment: ���Բ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_SetAttr(HI_HANDLE hVI, HI_UNF_VI_ATTR_S *pstAttr);

/**
 \brief Obtains the attributes of a VI port. CNcomment: ��ȡVI Port���� CNend
 \attention \n
 \param[in] hVi VI handle CNcomment: VI��� CNend
 \param[out] pstAttr Pointer to VI attributes CNcomment: VI����ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_GetAttr(HI_HANDLE hVI, HI_UNF_VI_ATTR_S *pstAttr);

/**
 \brief Enables a VI port to create a VI handle. CNcomment: ��VI Port������Vi��� CNend
 \attention \n
Before calling the VIU, you must call this API.\n
Unless the virtual VI is used, the port ID must correspond to the hardware. That is, the hardware and software must use the same port\n
CNcomment: ����VI ģ����Ҫ���ȵ��øýӿ�\n
	   ����ʹ������VI, ����PortID��Ҫ��Ӳ����Ӧ,Ӳ����ʹ�����ĸ�Port,��ô����Ҳ����ʹ���ĸ�Port.\n CNend
 \param[in] enViPort VI port CNcomment: VI�˿� CNend
 \param[in] pstAttr Pointer to VI attributes CNcomment: VI����ָ�� CNend
 \param[out] phandle hVi Pointer to the VI handle CNcomment: VI���ָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \retval ::HI_ERR_VI_CHN_INIT_BUF_ERR An error occurs when the buffer is initialized. CNcomment: ��ʼ��buffer���� CNend
 \retval ::HI_ERR_VI_INVALID_PARA The attribute parameters are incorrect. CNcomment: ���Բ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */

HI_S32 HI_UNF_VI_Create(HI_UNF_VI_E enViPort, HI_UNF_VI_ATTR_S *pstAttr, HI_HANDLE *phandle);

/**
 \brief Disable a VI port to destroy the handle. CNcomment: �ر�VI Port�����پ�� CNend
 \attention \n
 \param[in] hVi VI handle CNcomment: VI��� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_Destroy(HI_HANDLE hVI);

/**
 \brief Start VI. CNcomment: ����VI�����پ�� CNend
 \attention \n
 \param[in] hVI VI handle CNcomment: VI��� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_Start(HI_HANDLE hVI);

/**
 \brief Stop VI. CNcomment: ֹͣVI�����پ�� CNend
 \attention \n
 \param[in] hVI VI handle CNcomment: VI��� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_Stop(HI_HANDLE hVI);

/**
 \brief Set external buffer which will be managed by VI. CNcomment: �����ⲿ����������VI���� CNend
 \attention \n
 The interface is only valid in real VI scene, and ::HI_UNF_VI_BUF_MMAP mode should be set.
 CNcomment: �û�ֻ����ʵ��VI�����£�����Ϊ::HI_UNF_VI_BUF_MMAPģʽʱ������ʹ�ô˽ӿ�\n CNend
 \param[in] hVI VI handle CNcomment: VI��� CNend
 \param[in] pstBufAttr Buffer attributes CNcomment: ���������� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_SetExternBuffer(HI_HANDLE hVI, HI_UNF_VI_BUFFER_ATTR_S* pstBufAttr);

/**
 \brief Obtains the address of a frame buffer over a VI port.
 CNcomment:��ȡ����VI Port һ֡ͼ��Buffer CNend
 \attention \n
 The interface can only be used in virual VI scene\n
CNcomment: ֻ��������VI�����£��ſ�ʹ�ô˽ӿڻ�֡\n CNend
 \param[in] hVI VI handle CNcomment: VI��� CNend
 \param[out] pViBuf Pointer to the VI buffer CNcomment: VI bufferָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_DequeueFrame(HI_HANDLE hVI, HI_UNF_VIDEO_FRAME_INFO_S *pFrameInfo);

/**
 \brief Releases the VI frame buffer for the driver.
 CNcomment: ��������VI Port һ֡ͼ��Buffer����������Port���� CNend
 \attention
 The interface can only be used in virual VI scene\n
CNcomment: ֻ��������VI�����£��ſ�ʹ�ô˽ӿ���֡\n CNend
 \param[in] hVI VI handle CNcomment: VI��� CNend
 \param[in] pViBuf Pointer to the VI buffer CNcomment: VI bufferָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_QueueFrame(HI_HANDLE hVI, HI_UNF_VIDEO_FRAME_INFO_S *pFrameInfo);

/**
 \brief Obtains the address of a YUV picture. CNcomment: ��ȡһ֡YUV ͼ���ַ CNend
 \attention \n
You do not need to call this API generally. It is recommended that you bind the VIU to the video encoder (VENC) or video output unit (VOU) to implement the encoding function or VIVO loopback function.
CNcomment: һ������£��û�����Ҫ���ô˽ӿڣ��Ƽ�ֱ�ӽ�VI��VENC����VO���а��Ա�ʵ�ֱ������VIVO���ع��ܡ� CNend
 \param[in] hVi VI handle CNcomment: VI��� CNend
 \param[out] pViBuf Pointer to the VI buffer CNcomment: VI bufferָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_AcquireFrame(HI_HANDLE hVI, HI_UNF_VIDEO_FRAME_INFO_S *pFrameInfo, HI_U32 u32TimeoutMs);

/**
 \brief Releases the frame buffer for the VIU after the VENC or VOU obtains a YUV picture.
CNcomment: �û��黹һ֡YUV ͼ���ַ CNend
 \attention \n
You do not need to call this API generally. It is recommended that you bind the VIU to the VENC or VOU to implement the encoding function or VIVO loopback function.
CNcomment: һ������£��û�����Ҫ���ô˽ӿڣ��Ƽ�ֱ�ӽ�VI��VENC����VO���а��Ա�ʵ�ֱ������VIVO���ع��ܡ� CNend
 \param[in] hVi VI handle CNcomment: VI��� CNend
 \param[in] pViBuf Pointer to the VI buffer CNcomment: VI bufferָ�� CNend
 \retval ::HI_SUCCESS Success CNcomment: �ɹ� CNend
 \retval ::HI_ERR_VI_CHN_NOT_EXIST The handle is incorrect. CNcomment: ������� CNend
 \retval ::HI_ERR_VI_NULL_PTR The pointer is null. CNcomment: ��ָ�� CNend
 \see \n
N/A CNcomment: �� CNend
 */
HI_S32 HI_UNF_VI_ReleaseFrame(HI_HANDLE hVI, const HI_UNF_VIDEO_FRAME_INFO_S *pFrameInfo);

/** @} */  /** <!-- ====API Declaration End ==== */

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif
#endif
