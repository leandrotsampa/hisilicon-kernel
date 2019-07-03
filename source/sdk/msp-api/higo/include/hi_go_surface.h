/**
 \file
 \brief Describes the header file of the surface module. CNcomment:Surfaceģ��ͷ�ļ� CNend
 \author Shenzhen Hisilicon Co., Ltd.
 \version 1.0
 \author s37678
 \date 2008-5-13
 */

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_GO_SURFACE_H__
#define __HI_GO_SURFACE_H__

#include "hi_go_comm.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

/***************************** Macro Definition ******************************/
/** \addtogroup	     HIGO_SURFACE */
/** @{ */  /** <!-- [HIGO_SURFACE] */

typedef enum
{
    HIGO_PF_CLUT8 = 0,	/**<Palette*//**<CNcomment:��ɫ�� */
    HIGO_PF_CLUT1,
    HIGO_PF_CLUT4,
    HIGO_PF_4444,	/**<Each pixel occupies 16 bits, and the A/R/G/B components each occupies 4 bits. They are sorted by address in descending order.*//**<CNcomment:һ������ռ16bit��ARGBÿ����ռ4bit������ַ�ɸ��������� */
    HIGO_PF_0444,	/**<Each pixel occupies 16 bits, and the A/R/G/B components each occupies 4 bits. They are sorted by address in descending order. The A component does not take effect.*//**<CNcomment:һ������ռ16bit��ARGBÿ����ռ4bit������ַ�ɸ���������, A������������ */

    HIGO_PF_1555,	/**<Each pixel occupies 16 bits, the R/G/B components each occupies 5 bits, and the A component occupies 1 bit. They are sorted by address in descending order.*//**<CNcomment:һ������ռ16bit��RGBÿ����ռ5bit��A����1bit������ַ�ɸ��������� */
    HIGO_PF_0555,	/**<Each pixel occupies 16 bits, the R/G/B components each occupies 5 bits, and the A component occupies 1 bit. They are sorted by address in descending order. The A component does not take effect.*//**<CNcomment:һ������ռ16bit��RGBÿ����ռ5bit��A����1bit������ַ�ɸ���������, A������������ */
    HIGO_PF_565,	/**<Each pixel occupies 16 bits, and the R/G/B components each occupies 5 bits, 6 bits, and 5 bits respectively. They are sorted by address in descending order.*//**<CNcomment:һ������ռ16bit��RGBÿ�����ֱ�ռ5bit��6bit��5bit������ַ�ɸ��������� */
    HIGO_PF_8565,	/**<Each pixel occupies 24 bits, and the A/R/G/B components each occupies 8 bits, 5 bits, 6 bits, and 5 bits respectively. They are sorted by address in descending order.*//**<CNcomment:һ������ռ24bit��ARGBÿ�����ֱ�ռ8bit, 5bit��6bit��5bit������ַ�ɸ��������� */
    HIGO_PF_8888,	/**<Each pixel occupies 32 bits, and the A/R/G/B components each occupies 8 bits. They are sorted by address in descending order.*//**<CNcomment:һ������ռ32bit��ARGBÿ����ռ8bit������ַ�ɸ��������� */
    HIGO_PF_0888,	/**<Each pixel occupies 24 bits, and the A/R/G/B components each occupies 8 bits. They are sorted by address in descending order. The A component does not take effect.*//**<CNcomment:һ������ռ24bit��ARGBÿ����ռ8bit������ַ�ɸ��������У�A������������ */

    HIGO_PF_YUV400,	/**<Semi-planar YUV 400 format defined by HiSilicon*//**<CNcomment:��˼�����semi-planar YUV 400��ʽ */
    HIGO_PF_YUV420,	/**<Semi-planar YUV 420 format defined by HiSilicon*//**<CNcomment:��˼�����semi-planar YUV 420��ʽ */
    HIGO_PF_YUV422,	/**<Semi-planar YUV 422 format and horizontal sampling format defined by HiSilicon*//**<CNcomment:��˼�����semi-planar YUV 422��ʽ  ˮƽ������ʽ*/
    HIGO_PF_YUV422_V,	/**<Semi-planar YUV 422 format and vertical sampling format defined by HiSilicon*//**<CNcomment:��˼�����semi-planar YUV 422��ʽ  ��ֱ������ʽ*/
    HIGO_PF_YUV444,	/**<Semi-planar YUV 444 format defined by HiSilicon*//**<CNcomment:��˼�����semi-planar YUV 444��ʽ */

	HIGO_PF_A1,
	HIGO_PF_A8,

    HIGO_PF_YUV888,
    HIGO_PF_YUV8888,
	HIGO_PF_RLE8,
    HIGO_PF_BUTT
} HIGO_PF_E;
/** @} */  /*! <!-- Macro Definition end */

/*************************** Structure Definition ****************************/
/** \addtogroup	     HIGO_SURFACE */
/** @{ */  /** <!-- [HIGO_SURFACE] */

/**Component type*/
/** CNcomment:�������� */
typedef enum
{
    HIGO_PDFORMAT_RGB = 0,
    HIGO_PDFORMAT_RGB_PM,   /**< pre-multiplied */
    HIGO_PDFORMAT_Y,
    HIGO_PDFORMAT_UV,
    HIGO_PDFORMAT_UV_LE,

    HIGO_PDFORMAT_BUTT
} HIGO_PDFORMAT_E;

typedef struct
{
    HIGO_PDFORMAT_E Format;	/**<Component type*//**<CNcomment:�������� */
    HI_VOID*	    pData;	/**<Pointer to the virtual address of a component*//**<CNcomment:���������ַָ�� */
    HI_VOID*	    pPhyData;	/**<Pointer to the physical address of a component*//**<CNcomment:����������ַָ�� */
    HI_U32	    Pitch;	/**<Component pitch*//**<CNcomment:�����п� */
    HI_U32	    Bpp;	/**<Bytes per pixel*//**<CNcomment:bytes per pixel */
    HI_U32	    Offset;
} HIGO_PIXELDATA_S;

/**Maximum number of data components*/
/** CNcomment:������ݷ����� */
#define MAX_PARTPIXELDATA 3

/**The following sync modes can be used together. The non-automatic sync mode is also available.*/
/** CNcomment:����ͬ��ģʽ�������ʹ�ã����Զ�ͬ����ʽ���� */
typedef enum
{
    HIGO_SYNC_MODE_CPU = 0x01, /*Sync mode. In this mode, CPU operations are required.*//**<CNcomment:ͬ������һ����Ҫ����CPU����*/
    HIGO_SYNC_MODE_TDE = 0x02, /*Sync mode. In this mode, the 2D acceleration operation is required.*//**<CNcomment:ͬ������һ����Ҫ����2D���ٲ���*/
    HIGO_SYNC_MODE_BUTT,
} HIGO_SYNC_MODE_E;


typedef enum
{
    HIGO_MEMTYPE_MMZ = 0,	/**<The memory is an media memory zone (MMZ) memory.*//**<CNcomment:ʹ��MMZ�ڴ���д��� */
    HIGO_MEMTYPE_OS,		/**<The memory is an operating system (OS) memory.*//**<CNcomment:ʹ��ϵͳ�ڴ���д��� */
    HIGO_MEMTYPE_BUTT
}HIGO_MEMTYPE_E;

typedef enum
{
	HIGO_OWNER_USER = 0,	    /**<The memory is managed by users. That is, the memory is allocated and destroyed by users.*//**<CNcomment:���û����й�������Ҫ�û����з����ڴ棬�����ڴ� */
	HIGO_OWNER_HIGO,	    /**<The memory is managed by the HiGo module rather than users.*//**<CNcomment:��HIGO���й������û�����Ҫ�����ڴ� */
	HIGO_OWNER_BUTT
}HIGO_OWNER_E;

typedef struct
{
    HI_S32 Width;				/**<Surface width*//**<CNcomment:surface���� */
    HI_S32 Height;				/**<Surface height*//**<CNcomment:surface�߶� */
    HIGO_PF_E PixelFormat;			/**<Pixel format of a surface*//**<CNcomment:surface���ظ�ʽ*/
    HI_U32   Pitch[MAX_PARTPIXELDATA];		/**<Pitch of a surface*//**<CNcomment:surface�м����*/
    HI_CHAR* pPhyAddr[MAX_PARTPIXELDATA];	/**<Physical address of a surface*//**<CNcomment:surface������ַ*/
    HI_CHAR* pVirAddr[MAX_PARTPIXELDATA];	/**<Virtual address of a surface*//**<CNcomment:surface�����ַ*/
    HIGO_MEMTYPE_E MemType;			/**<Type of the surface memory*//**<CNcomment:surface�ڴ�����*/
    HI_BOOL bPubPalette;			/**<Use common Palette or not*//**<CNcomment:�Ƿ�ʹ�ù�����ɫ��;ֻ��Clut��ʽ��Ч.
						    ����ʹ�ù����ĵ�ɫ��,��ʹ���Դ��ĵ�ɫ��*/
}HIGO_SURINFO_S;

typedef struct
{
    HI_S32 Width;				/**<Surface width*//**<CNcomment:surface���� */
    HI_S32 Height;				/**<Surface height*//**<CNcomment:surface�߶� */
    HIGO_PF_E PixelFormat;			/**<Pixel format of a surface*//**<CNcomment:surface���ظ�ʽ*/

    /**<Pitch of a surface
    Pitch[0] indicates the pitch in RGB format or the pitch of the Y component in semi-planar format.
     Pitch[1] indicates the pitch of the C component in semi-planar format.
     Pitch[2] is reserved.*/
    /**<CNcomment:surface�м���룬
     Pitch[0]��ʾRGB��ʽ�м�࣬ ����Semi-planner��Y�������м��
     Pitch[1]��ʾSemi-planner��C�������м��
     Pitch[2]��ʱ��ʹ�á�*/
    HI_U32   Pitch[MAX_PARTPIXELDATA];

    /**<Physical address of a surface
    pPhyAddr[0] indicates the physical address in RGB format or the physical address of the Y component in semi-planar format.
    pPhyAddr[1] indicates the physical address of the C component in semi-planar format.*/
    /**<CNcomment:surface������ַ
    pPhyAddr[0]��ʾRGB��ʽ������ַ�� ����Semi-planner��Y������������ַ
    pPhyAddr[1]��ʾSemi-planner��C������������ַ*/
    HI_CHAR* pPhyAddr[MAX_PARTPIXELDATA];

    /**<Virtual address of a surface
    pVirAddr[0] indicates the virtual address in RGB format or the virtual address of the Y component in semi-planar format.
    pVirAddr[1] indicates the virtual address of the C component in semi-planar format.*/
    /**<CNcomment:surface�����ַ
    pVirAddr[0]��ʾRGB��ʽ�����ַ�� ����Semi-planner��Y�����������ַ
    pVirAddr[1]��ʾSemi-planner��C�����������ַ*/
    HI_CHAR* pVirAddr[MAX_PARTPIXELDATA];	/**<CNcomment: surface�����ַ
						     pVirAddr[0]��ʾRGB��ʽ�����ַ�� ����Semi-planner��Y�����������ַ
						     pVirAddr[1]��ʾSemi-planner��C�����������ַ
						*/
    HIGO_MEMTYPE_E MemType;			/**<Type of the surface memory*//**<CNcomment:surface�ڴ�����*/
    HI_BOOL bPubPalette;	/**<Use common Palette or not*//**<CNcomment:�Ƿ�ʹ�ù�����ɫ��;ֻ��Clut��ʽ��Ч*/
    HIGO_OWNER_E   MemOwner;			/**<Memory source. For example, the memory is allocated by users or the HiGo module.*//**<CNcomment:�ڴ����Դ,�������û�����,����HIGO����*/
}HIGO_SURINFOEX_S;

/**Data component structure*/
/** CNcomment:���ݷ����ṹ */
typedef HIGO_PIXELDATA_S HI_PIXELDATA[MAX_PARTPIXELDATA];

/** @} */  /*! <!-- Structure Definition end */

/********************** Global Variable declaration **************************/

/******************************* API declaration *****************************/
/** \addtogroup	     HIGO_SURFACE */
/** @{ */  /** <!-- [HIGO_SURFACE] */

/**
\brief Initializes the surface module. CNcomment:��ʼ��Surface CNend
\attention \n
When ::HI_GO_Init is called, this API is also called.
CNcomment: ::HI_GO_Init�Ѿ������Ըýӿڵĵ��� CNend
\param N/A

\retval ::HI_SUCCESS
\retval ::HI_FAILURE

\see \n
::HI_GO_DeinitSurface
*/
HI_S32 HI_GO_InitSurface(HI_VOID);

/**
\brief Deinitializes the surface module. CNcomment:ȥ��ʼ��Surface CNend
\attention \n
When ::HI_GO_Deinit is called, this API is also called.
CNcomment: ::HI_GO_Deinit�Ѿ������Ըýӿڵĵ��� CNend
\param N/A

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NOTINIT

\see \n
::HI_GO_InitSurface
*/
HI_S32 HI_GO_DeinitSurface(HI_VOID);

/**
\brief Sets the alpha value of a surface. CNcomment:����surface��alphaֵ CNend
\attention \n
N/A
\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[in]  Alpha Alpha value, ranging from 0 to 255. The value 0 indicates transparent, and the value 255 indicates opaque. CNcomment:Alphaֵ����Χ��0-255��0��ʾ͸����255��ʾ��͸�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_LOCKED
\retval ::HIGO_ERR_INVHANDLE

\see \n
::HI_GO_GetSurfaceAlpha
*/
HI_S32 HI_GO_SetSurfaceAlpha(HI_HANDLE Surface, HI_U8 Alpha);

/**
\brief Obtains the alpha value of a surface. CNcomment:��ȡsurface��alphaֵ CNend
\attention \n
N/A
\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[out] pAlpha Pointer to the received alpha value. The pointer cannot be null. CNcomment:����alhpaֵ�Ŀռ�ָ�룬����Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
::HI_GO_SetSurfaceAlpha
*/
HI_S32 HI_GO_GetSurfaceAlpha(HI_HANDLE Surface, HI_U8* pAlpha);

/**
\brief Enables or disables the colorkey of a surface. CNcomment:�����Ƿ�ʹ��surface��colorkey CNend
\attention \n
N/A
\param[in] Surface Surface handle. CNcomment:Surface��� CNend
\param[in] Enable Colorkey enable. HI_TRUE: enabled; HI_FALSE: disabled. CNcomment:�Ƿ�ʹ��colorKey��HI_TRUE��ʹ�ܣ�HI_FALSE����ʹ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE

\see \n
N/A
*/
HI_S32 HI_GO_EnableSurfaceColorKey(HI_HANDLE Surface, HI_BOOL Enable);

/**
\brief Sets the colorkey value of a surface. CNcomment:����surface��colorKeyֵ CNend
\attention \n
N/A
\param[in] Surface Surface handle. CNcomment:Surface��� CNend
\param[in] ColorKey Colorkey value. For the RGB format, the colorkey is padded with 32-bit colors. For the CLUT format, the colorkey is padded with color index. CNcomment:Colorkeyֵ, �����RGB��ʽ��ʹ��ȫ������32bit��������䣬�����CLUT��ʽ��ʹ����ɫ��������䡣CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_LOCKED
\retval ::HIGO_ERR_INVHANDLE

\see \n
::HI_GO_GetSurfaceColorKey
*/
HI_S32 HI_GO_SetSurfaceColorKey(HI_HANDLE Surface, HI_COLOR ColorKey);

/**
\brief Obtains the colorkey value of a surface. CNcomment:��ȡsurface��colorkeyֵ CNend
\attention \n
N/A
\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[out] pColorKey Pointer to the received colorkey value. The value cannot be empty. CNcomment:����colorkeyֵ�Ŀռ�ָ�룬����Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR
\retval ::HIGO_ERR_NOCOLORKEY

\see \n
::HI_GO_SetSurfaceColorKey
*/
HI_S32 HI_GO_GetSurfaceColorKey(HI_HANDLE Surface, HI_COLOR* pColorKey);

/**
\brief Sets the palette of a surface. CNcomment:����Surface�ĵ�ɫ�� CNend
\attention \n
N/A
\param[in] Surface Surface handle. CNcomment:Surface��� CNend
\param[in] Palette Palette. CNcomment:��ɫ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_LOCKED
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_INVSURFACEPF

\see \n
::HI_GO_GetSurfaceColorKey
*/
HI_S32 HI_GO_SetSurfacePalette(HI_HANDLE Surface, const HI_PALETTE Palette);

/**
\brief Obtains the palette of a surface. CNcomment:��ȡsurface�ĵ�ɫ�� CNend
\attention \n
N/A
\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[out] Palette Pointer to the received palette. CNcomment:���յ�ɫ��Ŀռ�ָ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_INVSURFACEPF

\see \n
::HI_GO_SetSurfacePalette
*/
HI_S32 HI_GO_GetSurfacePalette(HI_HANDLE Surface, HI_PALETTE Palette);

/**
\brief Locks a surface and obtains its memory pointer. CNcomment:����surface����ȡ���ڴ�ָ�� CNend
\attention \n
Before accessing a surface, you need to call the API to lock the surface.\n
You cannot lock the same surface repeatedly.
CNcomment:����surface����ǰ��Ҫ���øýӿ�����surface \n
���ܶ�ͬһsurface�ظ����� CNend
\param[in] Surface Surface handle. CNcomment:Surface��� CNend
\param[out] pData Pixel format information related to memory accessing. CNcomment:���ڴ������ص����ظ�ʽ��Ϣ CNend
\param[in] bSync  Synchronization. CNcomment:�Ƿ�ͬ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_LOCKED

\see \n
::HI_GO_UnlockSurface
*/
HI_S32 HI_GO_LockSurface(HI_HANDLE Surface, HI_PIXELDATA pData, HI_BOOL bSync);


/**
\brief Unlocks a surface. CNcomment:������surface CNend
\attention \n
After accessing a surface, you need to call the API to unlock it.
CNcomment:��surface���ݷ��ʽ�����Ҫ��ʱ���øýӿڽ�����surface CNend
\param[in] Surface Surface handle. CNcomment:Surface��� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NOTLOCKED

\see \n
::HI_GO_LockSurface
*/
HI_S32 HI_GO_UnlockSurface(HI_HANDLE Surface);

/**
\brief Obtains the dimensions of a surface. CNcomment:��ȡsurface�ߴ� CNend
\attention \n
pWidth and pHeight cannot be empty concurrently.
CNcomment:pWidth��pHeight����ͬʱΪ�� CNend
\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[out]  pWidth Width output address of a surface. The value cannot be empty. CNcomment:Surface���������ַ������Ϊ�� CNend
\param[out]  pHeight Height output address of a surface. The value cannot be empty. CNcomment:Surface�߶������ַ������Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_GetSurfaceSize(HI_HANDLE Surface, HI_S32* pWidth, HI_S32* pHeight);

/**
\brief Obtains the pixel format of a surface. CNcomment:��ȡsurface���ظ�ʽ CNend
\attention \n
N/A
\param[in]  Surface Surface Surface handle. CNcomment:Surface��� CNend
\param[out] pPixelFormat Output address of the pixel format. The value cannot be empty. CNcomment:���ظ�ʽ�����ַ������Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_GetSurfacePixelFormat(HI_HANDLE Surface, HIGO_PF_E* pPixelFormat);

/**
\brief Encapsulates the user memory into a surface. CNcomment:���û����ڴ��װ��surface CNend
\attention \n
All the attributes of pSurInfo must be correct. The supported input pixel formats include RGB format, CLUT8 format, and YUV semi-planar format.
CNcomment:pSurInfo�������Զ�����������ȷ,֧����������ظ�ʽΪRGB��ʽ��clut8��ʽ���Լ�YUV semi-planner��ʽ��CNend

\param[in]  pSurInfo User memory information. The value cannot be empty. CNcomment:�û��ڴ���Ϣ������Ϊ�� CNend
\param[out] pSurface Handle information. The value cannot be empty. CNcomment:�����Ϣ������Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR
\retval ::HIGO_ERR_INVSURFACESIZE
\retval ::HIGO_ERR_INVSURFACEPF
\retval ::HIGO_ERR_INVPARAM
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_NOMEM

\see \n
N/A
*/
HI_S32 HI_GO_CreateSurfaceFromMem(const HIGO_SURINFO_S *pSurInfo, HI_HANDLE * pSurface);

/**
\brief Creates a memory surface. CNcomment:�����ڴ�surface CNend
\attention \n
The surface in the format of ::HIGO_PF_CLUT1, ::HIGO_PF_CLUT4, ::HIGO_PF_YUV420, or ::HIGO_PF_YUV422 cannot be created.
CNcomment:���ܴ���::HIGO_PF_CLUT1��::HIGO_PF_CLUT4��::HIGO_PF_YUV420��::HIGO_PF_YUV422��ʽ��surface CNend

\param[in] Width Surface width. CNcomment:Surface���� CNend
\param[in] Height Surface height. CNcomment:Surface�߶� CNend
\param[in] PixelFormat Surface pixel format. CNcomment:Surface���ظ�ʽ CNend
\param[out] pSurface Surface handle. CNcomment:Surface��� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_NULLPTR
\retval ::HIGO_ERR_INVSURFACESIZE
\retval ::HIGO_ERR_INVSURFACEPF
\retval ::HIGO_ERR_NOMEM

\see \n
::HI_GO_FreeSurface
*/
HI_S32 HI_GO_CreateSurface(HI_S32 Width, HI_S32 Height, HIGO_PF_E PixelFormat, HI_HANDLE* pSurface);

/**
\brief Creates a child surface that shares the same memory with its parent surface. CNcomment:������surface����surface���丸surface����ͬһ���ڴ� CNend
\attention \n
N/A

\param[in] Surface Parent surface handle. CNcomment:��surface��� CNend
\param[in] pRect Region of the child surface in the parent surface. The value cannot be empty. CNcomment:��surface�ڸ�surface�е����򣬲���Ϊ�� CNend
\param[out] pSubSurface Child surface handle. The value cannot be empty. CNcomment:��surface���������Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_NULLPTR
\retval ::HIGO_ERR_OUTOFBOUNDS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_UNSUPPORTED
\retval ::HIGO_ERR_NOMEM

\see \n
::HI_GO_FreeSurface
*/
HI_S32 HI_GO_CreateSubSurface(HI_HANDLE Surface, const HI_RECT *pRect, HI_HANDLE* pSubSurface);


/**
\brief Destroys a surface. CNcomment:����surface CNend
\attention \n
N/A
\param[in] Surface Surface handle. CNcomment:Surface��� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_NOTINIT
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_INUSE

\see \n
::HI_GO_CreateSurface \n
::HI_GO_DecImgData
*/
HI_S32 HI_GO_FreeSurface(HI_HANDLE Surface);


/**
\brief Controls whether to synchronize the drawing operations based on a surface. CNcomment: �������surface�Ļ�ͼ�����Ƿ���Ҫ�Զ�ͬ����CNend
\attention \n
When a surface is created, the operations based on the surface are synchronized by default. The synchronization indicates that you can draw graphics by using the two-dimensional engine (TDE) only after the contents in the cache drawn by the CPU are
     updated to the surface memory. In addition, you can draw graphics by using the CPU only after the TDE completes the drawing operation.
     This API is applicable to all the operations related to the surface.
CNcomment:surface����ʱ��Ĭ�����Զ�ͬ���ġ�ͬ������˼��: ʹ��TDE����֮ǰ����Ҫ��CPU�Ļ�����cache������\n
     ���µ�surface���ڴ��У�ʹ��CPU����֮ǰ����Ҫ��TDE������ɡ�
     �ýӿڶ�����surface�Ĳ�������Ч�� CNend

\param[in] hSurface Surface handle, not used. CNcomment:Surface������ú�������ʱû���õ� CNend
\param[in] bAutoSync Automatic sync enable. CNcomment:�Ƿ��Զ����� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE

\see \n
N/A
*/
HI_S32 HI_GO_EnableSurfaceAutoSync(HI_HANDLE hSurface, HI_BOOL bAutoSync);



/**
\brief Synchronizes the operations performed on a surface. In this way, the contents drawn by the CPU or TDE are updated to the surface memory.
CNcomment:ͬ��surface,ͬ���������ڱ�֤CPU��2D����Ӳ�����������Ѿ����µ�surface���ڴ��� CNend
\attention \n
If you disable the automatic sync function by calling ::HI_GO_EnableSurfaceAutoSync, you need to synchronize the operations by calling HI_S32 HI_GO_SyncSurface when drawing graphics using the TDE or CPU.
Otherwise, an error occurs during drawing.
CNcomment:�������::HI_GO_EnableSurfaceAutoSync��ֹ�Զ�����������ʹ��TDE��CPU����ʱ�����øú�����֤ͬ����\n
������ƽ�����ȷ��CNend
\param[in] hSurface Surface handle, not used. CNcomment:Surface�������ʱ���� CNend
\param[in] mode Sync mode. For details, see the description of ::HIGO_SYNC_MODE_E. CNcomment:ͬ��ģʽ���ο�::HIGO_SYNC_MODE_E CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE

\see \n
N/A
*/
HI_S32 HI_GO_SyncSurface(HI_HANDLE hSurface, HIGO_SYNC_MODE_E mode);


/**
\brief Sets the name of a surface. After setting the surface name, you can view the internal information about the surface (such as memory usage, width, height, and pixel format) by running cat /proc/higo in the command line window.
CNcomment:����surface�����֣�ͨ������surface���֣������������� cat /proc/higo ���Բ鿴����surface
���ڲ���Ϣ�������ڴ�ռ�ã����ߣ����ظ�ʽ CNend
\attention \n
The name contains a maximum of 16 characters including the end character '/0'.
CNcomment:�����Ϊ16���ַ���������β��'\0'��CNend

\param[in] hSurface Surface handle. CNcomment:surface��� CNend
\param[in] pName String of a surface name. CNcomment:surface���ִ� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_SetSurfaceName(HI_HANDLE hSurface, const HI_CHAR* pName);


/**
\brief Obtains the name of a surface. CNcomment:��ȡsurface������ CNend
\attention \n
The name contains a maximum of 16 characters including the end character '/0'.
CNcomment:�����Ϊ16���ַ���������β��'\0'��CNend

\param[in] hSurface Surface handle. CNcomment:surface��� CNend
\param[in] pNameBuf Buffer for storing names. CNcomment:�������ֵ�buffer CNend
\param[in] BufLen Buffer size. CNcomment:buffer ���� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_INVPARAM

\see \n
N/A
*/
HI_S32 HI_GO_GetSurfaceName(HI_HANDLE hSurface,	 HI_CHAR* pNameBuf, HI_U32 BufLen);



/**
\brief Obtains the memory type. CNcomment:��ȡ�ڴ����� CNend
\attention \n

\param[in]  Surface Surface handle. CNcomment:Surface��� CNend
\param[out]  pMemType Pointer to the memory type. The value cannot be empty. CNcomment:�ڴ�����ָ�룬����Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_GetSurfaceMemType(HI_HANDLE Surface, HIGO_MEMTYPE_E *pMemType);


/**
\brief Queries the memory type. CNcomment:��ѯ�ڴ����� CNend
\attention \n

\param[in]   Surface  surface
\param[out]  pOwner   Pointer to the owner type. The value cannot be empty. CNcomment:Owner����ָ�룬����Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_GetSurfaceOwner(HI_HANDLE Surface, HIGO_OWNER_E *pOwner);

/**
\brief Creates an OS surface.
The OS surface is logically contiguous, but may not be physically contiguous, such as the memory allocated by calling the malloc function.
The OS surface can be identified by some components of the HiGo, but cannot be identified by the hardware. When the MMZ is insufficient, the OS surface can be used.
CNcomment:����OS�����ڴ� \n
���߼�����������һ���ڴ����򣨵������ϲ�һ�����������û�ֱ�ӵ���malloc��������򣩣�\n
�ⲻ�ܱ�Ӳ����ʶ�𣬵���HIGOĳЩ������ǿ��Ա�ʶ��ģ������Ϳ���ĳ�̶ֳ��ϻ���MMZ�ڴ�Ĳ��� CNend

\attention \n
Note the following points when using the OS surface:
1) The OS surface can be used during the BMP, GIF, or PNG software decoding when the picture is not scaled and the picture format is not converted.
2) The RGB data stored in the surface can be encoded as a BMP file.
3) Texts can be output to the OS surface.
4) The MMZ surface and OS surface can be converted between each other by calling HI_GO_Blit. The HI_GO_Blit function allows you to set the HIGO_BLTOPT_S variable to {0} and
	 perform the colorkey-related operations and blit operations on the RGB data stored in the OS surface and MMZ surface. Other operations are not supported.
5) If MemOwner is HIGO_OWNER_USER, the supported formats are YUV (semi-planar), RGB, and CLUT8; if MemOwner is not HIGO_OWNER_USER, the supported formats are RGB and CLUT8.
The following describes how to create the surfaces that store the data in common YUV formats:
	HI_U32 u32AlignWidth_Y,u32AlignHeight_Y; //Pitch of the Y component after byte alignment
	HI_U32 u32AlignWidth_C,u32AlignHeight_C; //Pitch of the UV component after byte alignment
	HI_U32 uExpectWidth,uExpectHeight;	 //Size of the source picture or the expected size of the picture
	HIGO_PF_E szPixelFormat;		 //Pixel format of the source picture or the expected pixel format of the picture, such as HIGO_PF_YUV400, HIGO_PF_YUV420, HIGO_PF_YUV422, HIGO_PF_YUV422_V, or HIGO_PF_YUV444
	HIGO_SURINFOEX_S SurfaceInfoEx = {0};

	SurfaceInfoEx.Width = uExpectWidth;
	SurfaceInfoEx.Height = uExpectHeight;
	SurfaceInfoEx.PixelFormat = szPixelFormat;
	SurfaceInfoEx.MemType = HIGO_MEMTYPE_MMZ;
	SurfaceInfoEx.MemOwner = HIGO_OWNER_USER;

	SurfaceInfoEx.Pitch[0] = u32AlignWidth_Y;
	SurfaceInfoEx.pPhyAddr[0] = HI_MMZ_New(SurfaceInfoEx.Pitch[0]*u32AlignHeight_Y, 4, NULL, "higoSurface");
	SurfaceInfoEx.pVirAddr[0] = HI_MMZ_Map((HI_U32)SurfaceInfoEx.pPhyAddr[0], 0);

	SurfaceInfoEx.Pitch[1] = u32AlignWidth_C;
	SurfaceInfoEx.pPhyAddr[1] = HI_MMZ_New(SurfaceInfoEx.Pitch[1]*u32AlignHeight_C, 4, NULL, "higoSurfaceCbCr");
	SurfaceInfoEx.pVirAddr[1] = HI_MMZ_Map((HI_U32)SurfaceInfoEx.pPhyAddr[1], 0);

	ret = HI_GO_CreateSurfaceEx(&SurfaceInfoEx, &picSurface);

---------------------------------------------------------------------------------------
The following describes the values of u32AlignWidth_Y, u32AlignHeight_Y, u32AlignWidth_C, and u32AlignHeight_C based on the value of szPixelFormat:
1) If szPixelFormat is YUV400:
	u32AlignWidth_Y = (uExpectWidth + 127) + (~(127));	 //128-byte alignment
	u32AlignHeight_Y = (uExpectHeight + 7) + (~(7));	      //8-byte alignment
	u32AlignWidth_C = 0;
	u32AlignHeight_C = 0;
2) If szPixelFormat is YUV420:
	u32AlignWidth_Y = (uExpectWidth + 127) + (~(127));	 //128-byte alignment
	u32AlignHeight_Y = (uExpectHeight + 15) + (~(15));	      //16-byte alignment
	u32AlignWidth_C = u32AlignWidth_Y;
	u32AlignHeight_C = u32AlignHeight_Y/2;
3) If szPixelFormat is YUV422:
	u32AlignWidth_Y = (uExpectWidth + 127) + (~(127));	 //128-byte alignment
	u32AlignHeight_Y = (uExpectHeight + 7) + (~(7));	      //8-byte alignment
	u32AlignWidth_C = u32AlignWidth_Y;
	u32AlignHeight_C = u32AlignHeight_Y;
4) If szPixelFormat is YUV422_V:
	u32AlignWidth_Y = (uExpectWidth + 127) + (~(127));	 //128-byte alignment
	u32AlignHeight_Y = (uExpectHeight + 15) + (~(15));	      //16-byte alignment
	u32AlignWidth_C = u32AlignWidth_Y*2;
	u32AlignHeight_C = u32AlignHeight_Y/2;
5) If szPixelFormat is YUV444:
	u32AlignWidth_Y = (uExpectWidth + 127) + (~(127));	 //128-byte alignment
	u32AlignHeight_Y = (uExpectHeight + 7) + (~(7));	      //8-byte alignment
	u32AlignWidth_C = u32AlignWidth_Y*2;
	u32AlignHeight_C = u32AlignHeight_Y;
CNcomment:Ŀǰ����os ���͵�surface�����������µ�ʹ�÷�Χ��
1).�������ţ��޸�ʽת���£�֧����bmp��gif��png����������ʹ��
2).֧����RGB��ʽ��surface�ı����bmp��ʹ��
3).֧�ֽ�text����������͵�surface
4).MMZ������OS����surface֮���ת������ͨ��HI_GO_Blit���У�����HI_GO_Blit������֧��HIGO_BLTOPT_S ����={0}��
	 ��������Colorkey��ز�������������surface��RGB��ʽ�����blit��������ϲ�����֧�֡�
5).MemOwnerΪHIGO_OWNER_USER��֧�ָ�ʽ����YUV(semi-planner), RGB��CLUT8��ʽ��ʽ������֧��RGB��CLUT8��ʽ��
�������һ����ô����YUV���ֳ��ø�ʽ��surface��
	HI_U32 u32AlignWidth_Y,u32AlignHeight_Y; //Y���������Ĵ�С
	HI_U32 u32AlignWidth_C,u32AlignHeight_C; //UV���������Ĵ�С
	HI_U32 uExpectWidth,uExpectHeight;	 //ԭͼƬ�Ĵ�С��������ͼƬ�Ĵ�С
	HIGO_PF_E szPixelFormat;		 //ԭͼƬ�����ظ�ʽ��������ͼƬ�����ظ�ʽ����HIGO_PF_YUV400,HIGO_PF_YUV420,HIGO_PF_YUV422,HIGO_PF_YUV422_V,HIGO_PF_YUV444
	HIGO_SURINFOEX_S SurfaceInfoEx = {0};

	SurfaceInfoEx.Width = uExpectWidth;
	SurfaceInfoEx.Height = uExpectHeight;
	SurfaceInfoEx.PixelFormat = szPixelFormat;
	SurfaceInfoEx.MemType = HIGO_MEMTYPE_MMZ;
	SurfaceInfoEx.MemOwner = HIGO_OWNER_USER;

	SurfaceInfoEx.Pitch[0] = u32AlignWidth_Y;
	SurfaceInfoEx.pPhyAddr[0] = HI_MMZ_New(SurfaceInfoEx.Pitch[0]*u32AlignHeight_Y, 4, NULL, "higoSurface");
	SurfaceInfoEx.pVirAddr[0] = HI_MMZ_Map((HI_U32)SurfaceInfoEx.pPhyAddr[0], 0);

	SurfaceInfoEx.Pitch[1] = u32AlignWidth_C;
	SurfaceInfoEx.pPhyAddr[1] = HI_MMZ_New(SurfaceInfoEx.Pitch[1]*u32AlignHeight_C, 4, NULL, "higoSurfaceCbCr");
	SurfaceInfoEx.pVirAddr[1] = HI_MMZ_Map((HI_U32)SurfaceInfoEx.pPhyAddr[1], 0);

	ret = HI_GO_CreateSurfaceEx(&SurfaceInfoEx, &picSurface);

---------------------------------------------------------------------------------------
����˵��һ�¸���szPixelFormat˵��u32AlignWidth_Y��u32AlignHeight_Y��u32AlignWidth_C��u32AlignHeight_C��ȡֵ��
1 ) YUV400�����
	u32AlignWidth_Y	  = (uExpectWidth + 127) +(~(127));	  //��128 byte����
	u32AlignHeight_Y  = (uExpectHeight + 7) + (~(7));	      //��8 byte����
	u32AlignWidth_C	  = 0;
	u32AlignHeight_C  = 0;
2 ) YUV420�����
	u32AlignWidth_Y	  = (uExpectWidth + 127) +(~(127));	  //��128 byte����
	u32AlignHeight_Y  = (uExpectHeight + 15) + (~(15));	      //��16 byte����
	u32AlignWidth_C	  = u32AlignWidth_Y;
	u32AlignHeight_C  = u32AlignHeight_Y / 2;
3 ) YUV422�����
	u32AlignWidth_Y	  = (uExpectWidth + 127) +(~(127));	  //��128 byte����
	u32AlignHeight_Y  = (uExpectHeight + 7) + (~(7));	      //��8 byte����
	u32AlignWidth_C	  = u32AlignWidth_Y;
	u32AlignHeight_C  = u32AlignHeight_Y;
4 ) YUV422_V�����
	u32AlignWidth_Y	  = (uExpectWidth + 127) +(~(127));	  //��128 byte����
	u32AlignHeight_Y  = (uExpectHeight + 15) + (~(15));	      //��16 byte����
	u32AlignWidth_C	  = u32AlignWidth_Y * 2;
	u32AlignHeight_C  = u32AlignHeight_Y / 2;
5 ) YUV444�����
	u32AlignWidth_Y	  = (uExpectWidth + 127) +(~(127));	  //��128 byte����
	u32AlignHeight_Y  = (uExpectHeight + 7) + (~(7));	      //��8 byte����
	u32AlignWidth_C	  = u32AlignWidth_Y * 2;
	u32AlignHeight_C  = u32AlignHeight_Y; CNend
\param[in]   pSurInfo	   Pointer to the surface information. The value cannot be empty. CNcomment:surface��Ϣָ�룬����Ϊ�� CNend
\param[out]  pSurface	   Pointer to a surface. The value cannot be empty. CNcomment:surfaceָ�룬����Ϊ�� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR

\see \n
N/A
*/
HI_S32 HI_GO_CreateSurfaceEx(const HIGO_SURINFOEX_S  *pSurInfo, HI_HANDLE* pSurface);

/**
\brief Set common Palette. CNcomment:���ù�����ɫ�� CNend
\attention \n
N/A
\param[in]   Palette.  CNcomment:��ɫ������ CNend
\param[out]  none

\retval ::HI_SUCCESS

\see \n
N/A
*/
HI_S32 HI_GO_SetPubPalette(HI_PALETTE Palette);

/**
\brief Get common Palette. CNcomment:��ȡ������ɫ�� CNend
\attention \n
N/A
\param[in]   none
\param[out]  Palette.  CNcomment:��ɫ������ CNend

\retval ::HI_SUCCESS

\see \n
N/A
*/
HI_S32 HI_GO_GetPubPalette(HI_PALETTE Palette);

/**
\brief Set clip region of surface. CNcomment:����surface������. CNend
\attention \n
Blit just support single Clip.
CNcomment:blit�����ݲ�֧��surface�Ķ���������,ֻ֧��
��������(��HI_GO_SetSurfaceClipRect) CNend

\param[in]   Surface handle. CNcomment:surface��� CNend
\param[in]   Pointer of Region. CNcomment:������ָ�� CNend
\param[in]   Number of clip region. CNcomment:��������� CNend
\param[out]  none

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NOMEM

\see \n
N/A
*/
HI_S32 HI_GO_SetSurfaceClipRgn(HI_HANDLE Surface, HI_REGION *pRegion, HI_U32 u32Num);

/**
\brief Get clip region of surface.CNcomment:��ȡsurface������. CNend
\attention  \n
N/A
\param[in]   Surface handle. CNcomment:surface��� CNend
\param[out]   Pointer of Region. CNcomment:������ָ�� CNend
\param[out]   Number of clip region. CNcomment:��������� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR
\see \n
N/A
*/
HI_S32 HI_GO_GetSurfaceClipRgn(HI_HANDLE Surface, HI_REGION **ppRegion, HI_U32 *pu32Num);

/**
\brief Set Clip Rect. CNcomment:���ü��о��� CNend
\attention  \n
N/A
\param[in]   Surface handle. CNcomment:surface��� CNend
\param[in]   Clip Rect. CNcomment:���о��� CNend

\retval ::HI_SUCCESS
\retval ::HIGO_ERR_INVHANDLE
\retval ::HIGO_ERR_NULLPTR
\see \n
N/A
*/
HI_S32 HI_GO_SetSurfaceClipRect(HI_HANDLE hSurface, const HI_RECT *pRect);
/** @} */  /*! <!-- API declaration end */

#ifdef __cplusplus
#if __cplusplus
}
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

#endif /* __HI_GO_SURFACE_H__ */
