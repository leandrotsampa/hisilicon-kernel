/**
 \file
 \brief Describes the header file that contains the common contents of the HiGo.CNcomment:HiGo��������ͷ�ļ� CNend
 \author Shenzhen Hisilicon Co., Ltd.
 \version 1.0
 \author s37678
 \date 2008-5-16
 */

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_GO_COMM_H__
#define __HI_GO_COMM_H__

/* add include here */
#include "hi_type.h"
#include "hi_go_errno.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

/***************************** Macro Definition ******************************/
/*************************** Structure Definition ****************************/
/** \addtogroup	     HIGO_COMMON */
/** @{ */  /**<!��[HIGO_COMMON] */

/**Maximum number of colors in the palette*//** CNcomment: ��ɫ�������ɫ�� */
#define MAX_PALETTE_COLOR_SIZE 256

/**Color value*//** CNcomment: ��ɫֵ */
typedef HI_U32 HI_COLOR;

/**Palette*//** CNcomment: ��ɫ�� */
typedef HI_COLOR HI_PALETTE[MAX_PALETTE_COLOR_SIZE];

typedef enum
{
    HIGO_IMGTYPE_JPEG = 0, /**<.jpeg picture*//**<CNcomment: JPEG��ʽͼƬ*/
    HIGO_IMGTYPE_GIF,	   /**<.gif picture*//**<CNcomment: GIF��ʽͼƬ*/
    HIGO_IMGTYPE_BMP,	    /**<.bmp picture*//**<CNcomment: BMP��ʽͼƬ */
    HIGO_IMGTYPE_PNG,	   /**<.png picture*//**<CNcomment: PNG��ʽͼƬ */
    HIGO_IMGTYPE_RLE,	   /**<.rle picture*//**<CNcomment: RLE��ʽͼƬ */
    HIGO_IMGTPYE_BUTT
} HIGO_IMGTYPE_E;


/**Rectangle*//** CNcomment: ���� */
typedef struct
{
    HI_S32 x, y;

    HI_S32 w, h;
} HI_RECT;

typedef HI_RECT HI_POINT;

/**Region*//** CNcomment: ���� */
typedef struct
{
    HI_S32 l;
    HI_S32 t;
    HI_S32 r;
    HI_S32 b;
} HI_REGION;

/**Mode of adjusting the window z-order*//**CNcomment:Z�������ʽ*/
typedef enum
{
    HIGO_ZORDER_MOVETOP = 0,  /**<Move to the top*//**<CNcomment:�Ƶ����*/
    HIGO_ZORDER_MOVEUP,	      /**<Move upwards*//**<CNcomment:������*/
    HIGO_ZORDER_MOVEBOTTOM,   /**<Move to the bottom*//**<CNcomment:�Ƶ���ײ�*/
    HIGO_ZORDER_MOVEDOWN,     /**<Move downwards*//**<CNcomment:������*/
    HIGO_ZORDER_BUTT
} HIGO_ZORDER_E;

#define HIGO_INVALID_HANDLE 0x0

/**Stream position*//** CNcomment: ��ʽλ��*/


/** @} */  /*! <!-- Structure Definition end */

/********************** Global Variable declaration **************************/

/******************************* API declaration *****************************/
/** \addtogroup	     HIGO_COMMON */
/** @{ */  /** <!��[HIGO_COMMON] */


/**
\brief Initializes the HiGo.CNcomment:HiGo��ʼ�� CNend
\attention \n
Before using the HiGo, you must call this application programming interface (API) to initialize the HiGo. The HiGo
includes the graphic device (Gdev) module, decoder, Winc module, bit block transfer (Bliter) module, and surface
module.
CNcomment:ʹ��HiGo���ܱ����ȵ��øýӿڣ����HiGo�ĳ�ʼ������Ҫ����gdev, decoder, winc, blit, surfaceģ�� CNend
\param N/A.CNcomment:�� CNend

\retval ::HI_SUCCESS
\retval ::HI_FAILURE
\retval ::HIGO_ERR_DEPEND_TDE
\retval ::HIGO_ERR_INITFAILED

\see \n
::HI_GO_Deinit
*/
HI_S32	HI_GO_Init(HI_VOID);

/**
\brief Deinitializes the HiGo.CNcomment: HiGoȥ��ʼ�� CNend
\attention \n
If the HiGo is not used, you need to call this API to release resources.CNcomment: ����ʹ��HiGo����ʱ��Ҫ���øýӿڣ��ͷ���Դ CNend
\param N/A.CNcomment: �� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_DEINITFAILED

\see \n
::HI_GO_Init
*/
HI_S32	HI_GO_Deinit(HI_VOID);

/**
\brief Initializes the extended library of the HiGo.CNcomment:HiGo ��չ���ʼ�� CNend
\attention \n
If the extended library of the HiGo is not used, you need to call this API to release resources, especially the
resources of the cursor and text modules.
CNcomment:��Ҫ��CURSOR��TEXTģ�顣CNend
\param N/A.CNcomment:�� CNend

\retval ::HI_SUCCESS
\retval ::HI_FAILURE
\retval ::HIGO_ERR_DEPEND_TDE
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_DEINITFAILED

\see \n
::HI_GO_DeInitExt
*/
HI_S32 HI_GO_InitExt(HI_VOID);

/**
\brief Deinitializes the extended library of the HiGo.CNcomment: HiGo��չ��ȥ��ʼ�� CNend
\attention \n
If the HiGo is not used, you need to call this API to release resources.CNcomment: ����ʹ��HiGo��չ�⹦��ʱ��Ҫ���øýӿڣ��ͷ���Դ����Ҫ��CURSOR��TEXTģ�顣CNend
\param N/A.CNcomment: �� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_DEINITFAILED

\see \n
::HI_GO_InitExt
*/
HI_S32 HI_GO_DeInitExt(HI_VOID);

/**
\brief Obtains the version information.CNcomment:��ȡ�汾��Ϣ CNend
\attention \n
N/A.CNcomment:�� CNend
\param[out] ppVersion Output address of the version information string. The value cannot be empty.CNcomment: �汾��Ϣ�ַ��������ַ������Ϊ�� CNend
\param[out] ppBuildTime Build Output address of the time string. The value cannot be empty.CNcomment:Buildʱ���ַ��������ַ������Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A.CNcomment:�� CNend
*/
HI_S32 HI_GO_GetVersion(HI_CHAR ** ppVersion, HI_CHAR **ppBuildTime);

/**
\brief Converts the data on a surface into a .bmp picture for output.CNcomment: ��Surface�е�����ת����BMP��ʽͼ�������CNend
\attention \n
The output file is [year]-[date]-[hour]-[min]-[second]-[ms].bmp.CNcomment: ����ļ���Ϊ[year]-[date]-[hour]-[min]-[second]-[ms].bmp CNend
The output picture must be a 16-bit bitmap.CNcomment: ���ͼƬ�̶�Ϊ16λͼ��CNend
It is recommended that you call HI_GO_EncodeToFile rather than HI_GO_Surface2Bmp.CNcomment: ����ʹ��HI_GO_EncodeToFile�ӿ�������˽ӿ� CNend

\param[in] Surface Data to be captured.CNcomment: ��Ҫ���н��������ݡ�CNend
\param[in] pRect Pointer to a rectangle. If this parameter is not set, it indicates the entire surface.CNcomment: ����ָ��,Ϊ�ձ�ʾ����surface��CNend


\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NULLPTR
\retval ::HIGO_ERR_INVPARAM
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_INVSURFACESIZE
\retval ::HIGO_ERR_INVSURFACEPF
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_NOMEM

*/
HI_S32	HI_GO_Surface2Bmp(HI_HANDLE Surface, const HI_RECT *pRect);

/**
\brief Enables the memory management module.CNcomment:ʹ���ڴ����ģ�� CNend
\attention \n
The memory management module is disabled by default. Before using the memory statistics function, you must call this
API to enable the memory management module.
CNcomment:Ĭ��������ڷ�ʹ��״̬��ֻ�иýӿڴ򿪺����ʹ���ڴ�ͳ�ƹ��� CNend

\param[in] bEnable Whether to enable the memory statistics function.CNcomment:�Ƿ����ڴ�ͳ�ƹ��� CNend

\retval ::HI_SUCCESS

*/
HI_S32 HI_GO_EnableMemMng(HI_BOOL bEnable);



/**
\brief Obtains the enable status of the memory management module.CNcomment:��ȡ�ڴ����ģ��ʹ��״̬ CNend
\attention \n
\param[out] pbEnable Whether to obtain the enable status of the memory statistics function.CNcomment:��ȡ�ڴ�ͳ�ƹ����Ƿ��� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NULLPTR

*/
HI_S32 HI_GO_GetMemMngStatus(HI_BOOL *pbEnable);

/**
\brief Outputs the general information about the system memory.CNcomment:���ϵͳ�ڴ��������Ϣ CNend
\attention \n
\param N/A.CNcomment:�� CNend

\retval ::HI_SUCCESS
*/
HI_S32 HI_GO_SysMemQuene(HI_VOID);

/**
\brief Outputs the general information about the media memory zone (MMZ).CNcomment: ���MMZ�ڴ��������Ϣ��CNend
\attention \n
\param N/A.CNcomment:�� CNend

\retval ::HI_SUCCESS

*/
HI_S32 HI_GO_MMZMemQuene(HI_VOID);

/** @} */  /*! <!-- API declaration end */


#ifdef __cplusplus
#if __cplusplus
}
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

#endif /* __HI_GO_COMM_H__ */
