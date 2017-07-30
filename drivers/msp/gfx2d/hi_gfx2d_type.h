/******************************************************************************
*	       Copyright 2004 - 2014, Hisilicon Tech. Co., Ltd.
*			    ALL RIGHTS RESERVED
* FileName: hi_gfx2d_type.h
* Description: Describe graphic 2D engine data type.
*
* History:
* Version   Date	 Author	    DefectNum	 Description
* main\1    2013-10-23		    NULL	 Create this file.
*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef _HI_GFX_TYPE_H_
#define _HI_GFX_TYPE_H_

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

/******************************** Macro Definition ******************************/
#define HI_GFX_SURFACE_ADDR_CNT 3
#define HI_GFX_SURFACE_STRIDE_CNT 3
#define HI_GFX_FILTERPARAM_ADDR_CNT 2

/*************************** Structure Definition ****************************/

/** \addtogroup	     GFX TYPE */
/** @{ */  /** <!-- ��GFX TYPE�� */

typedef enum hiGFX2D_DEV_ID_E
{
    HI_GFX2D_DEV_ID_0 = 0x0,
    HI_GFX2D_DEV_ID_BUTT
} HI_GFX2D_DEV_ID_E;

/** enum of the color format */
/** CNcomment:ͼ���ʽö�� */
typedef enum hiGFX2D_FMT_E
{
    HI_GFX2D_FMT_RGB444 = 0,	      /**< RGB444��ʽ, Redռ4bits Greenռ4bits, Blueռ4bits,�����ʽ�������� */
    HI_GFX2D_FMT_BGR444,	      /**< BGR444��ʽ */
    HI_GFX2D_FMT_RGB555,	      /**< RGB555��ʽ */
    HI_GFX2D_FMT_BGR555,	      /**< BGR555��ʽ */
    HI_GFX2D_FMT_RGB565,	      /**< RGB565��ʽ */
    HI_GFX2D_FMT_BGR565,	      /**< BGR565��ʽ */
    HI_GFX2D_FMT_RGB888,	      /**< RGB888��ʽ */
    HI_GFX2D_FMT_BGR888,	      /**< BGR888��ʽ */
    HI_GFX2D_FMT_KRGB888,
    HI_GFX2D_FMT_KBGR888,
    HI_GFX2D_FMT_ARGB4444,	      /**< ARGB4444��ʽ */
    HI_GFX2D_FMT_ABGR4444,	      /**< ABGR4444��ʽ */
    HI_GFX2D_FMT_RGBA4444,	      /**< RGBA4444��ʽ */
    HI_GFX2D_FMT_BGRA4444,	      /**< BGRA4444��ʽ */
    HI_GFX2D_FMT_ARGB1555,	      /**< ARGB1555��ʽ */
    HI_GFX2D_FMT_ABGR1555,	      /**< ABGR1555��ʽ */
    HI_GFX2D_FMT_RGBA1555,	      /**< RGBA1555��ʽ */
    HI_GFX2D_FMT_BGRA1555,	      /**< BGRA1555��ʽ */
    HI_GFX2D_FMT_ARGB8565,	      /**< ARGB8565��ʽ */
    HI_GFX2D_FMT_ABGR8565,	      /**< ABGR8565��ʽ */
    HI_GFX2D_FMT_RGBA8565,	      /**< RGBA8565��ʽ */
    HI_GFX2D_FMT_BGRA8565,	      /**< BGRA8565��ʽ */
    HI_GFX2D_FMT_ARGB8888,	      /**< ARGB8888��ʽ */
    HI_GFX2D_FMT_ABGR8888,	      /**< ABGR8888��ʽ */
    HI_GFX2D_FMT_RGBA8888,	      /**< RGBA8888��ʽ */
    HI_GFX2D_FMT_BGRA8888,	      /**< BGRA8888��ʽ */
    HI_GFX2D_FMT_CLUT1,		      /**<��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    HI_GFX2D_FMT_CLUT2,		      /**<��Alpha����,��ɫ��2bit��ʽ,ÿ������2��bit��ʾ */
    HI_GFX2D_FMT_CLUT4,		      /**<��Alpha����,��ɫ��4bit��ʽ,ÿ������4��bit��ʾ */
    HI_GFX2D_FMT_CLUT8,		      /**<��Alpha����,��ɫ��8bit��ʽ,ÿ������8��bit��ʾ */
    HI_GFX2D_FMT_ACLUT44,	      /**<��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    HI_GFX2D_FMT_ACLUT88,	      /**<��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    HI_GFX2D_FMT_YUV888,	    /**<YUV packet��ʽ����alpha����*/
    HI_GFX2D_FMT_AYUV8888,	    /**<YUV packet��ʽ����alpha����*/
    HI_GFX2D_FMT_YUYV422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_YVYU422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_UYVY422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_YYUV422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_VYUY422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_VUYY422, /**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    HI_GFX2D_FMT_SEMIPLANAR400,	    /**<Semi-planar YUV400��ʽ ,��Ӧ��JPG����*/
    HI_GFX2D_FMT_SEMIPLANAR420UV,     /**<Semi-planar YUV420��ʽ */
    HI_GFX2D_FMT_SEMIPLANAR420VU,     /**<Semi-planar YUV420��ʽ */
    HI_GFX2D_FMT_SEMIPLANAR422UV_H,    /**<Semi-planar YUV422��ʽ,ˮƽ�����������Ӧ��JPG���� */
    HI_GFX2D_FMT_SEMIPLANAR422VU_H,    /**<Semi-planar YUV422��ʽ,ˮƽ�����������Ӧ��JPG���� */
    HI_GFX2D_FMT_SEMIPLANAR422UV_V,    /**<Semi-planar YUV422��ʽ,��ֱ�����������Ӧ��JPG���� */
    HI_GFX2D_FMT_SEMIPLANAR422VU_V,    /**<Semi-planar YUV422��ʽ,��ֱ�����������Ӧ��JPG���� */
    HI_GFX2D_FMT_SEMIPLANAR444UV,     /**<Semi-planar YUV444��ʽ */
    HI_GFX2D_FMT_SEMIPLANAR444VU,
    HI_GFX2D_FMT_PLANAR400,
    HI_GFX2D_FMT_PLANAR420,
    HI_GFX2D_FMT_PLANAR411,
    HI_GFX2D_FMT_PLANAR410,
    HI_GFX2D_FMT_PLANAR422H,
    HI_GFX2D_FMT_PLANAR422V,
    HI_GFX2D_FMT_PLANAR444,
} HI_GFX2D_FMT_E;

/** enum of the compress type */
/** CNcomment:ͼ��ѹ������ö�� */
typedef enum hiGFX2D_COMPRESS_TYPE_E
{
    HI_GFX2D_COMPRESS_NONE = 0x0,     /**<CNcomment:��ѹ��*/
    HI_GFX2D_COMPRESS_NOLOSS,	       /**<CNcomment:����ѹ��*/
} HI_GFX2D_COMPRESS_TYPE_E;

/** enum of the surface type */
/** CNcomment:surface����ö�� */
typedef enum hiGFX2D_SURFACE_TYPE_E
{
    HI_GFX2D_SURFACE_TYPE_MEM = 0x0,  /**<CNcomment:�ڴ�����surface */
    HI_GFX2D_SURFACE_TYPE_COLOR,       /**<CNcomment:��ɫ����surface */
} HI_GFX2D_SURFACE_TYPE_E;

/** enum of the filter mode */
/** CNcomment:�˲�ģʽö�� */
typedef enum hiGFX2D_FILTER_MODE_E
{
    HI_GFX2D_FILTER_ALL = 0x0,	    /**<CNcomment:����ɫ��alphaͨ��ͬʱ�˲�*/
    HI_GFX2D_FILTER_COLOR,	      /**<CNcomment:����ɫ�����˲�*/
    HI_GFX2D_FILTER_ALPHA,     /**<CNcomment:��alphaͨ���˲�*/
    HI_GFX2D_FILTER_NONE,	/**<CNcomment:�������˲�*/
} HI_GFX2D_FILTER_MODE_E;

/** enum of the clip mode */
/** CNcomment:����ģʽö�� */
typedef enum hiGFX2D_CLIP_MODE_E
{
    HI_GFX2D_CLIP_NONE = 0x0,
    HI_GFX2D_CLIP_INSIDE,
    HI_GFX2D_CLIP_OUTSIDE,
} HI_GFX2D_CLIP_MODE_E;

/** enum of the rop mode */
/** CNcomment:ROPģʽö�� */
typedef enum hiGFX2D_ROP_MODE_E
{
    HI_GFX2D_ROP_BLACK = 0x0,	  /**<Blackness*/
    HI_GFX2D_ROP_NOTMERGEPEN,	/**<~(S2 | S1)*/
    HI_GFX2D_ROP_MASKNOTPEN,	/**<~S2&S1*/
    HI_GFX2D_ROP_NOTCOPYPEN,	/**< ~S2*/
    HI_GFX2D_ROP_MASKPENNOT,	/**< S2&~S1 */
    HI_GFX2D_ROP_NOT,		/**< ~S1 */
    HI_GFX2D_ROP_XORPEN,	/**< S2^S1 */
    HI_GFX2D_ROP_NOTMASKPEN,	/**< ~(S2 & S1) */
    HI_GFX2D_ROP_MASKPEN,	/**< S2&S1 */
    HI_GFX2D_ROP_NOTXORPEN,	/**< ~(S2^S1) */
    HI_GFX2D_ROP_NOP,		/**< S1 */
    HI_GFX2D_ROP_MERGENOTPEN,	/**< ~S2|S1 */
    HI_GFX2D_ROP_COPYPEN,	/**< S2 */
    HI_GFX2D_ROP_MERGEPENNOT,	/**< S2|~S1 */
    HI_GFX2D_ROP_MERGEPEN,	/**< S2|S1 */
    HI_GFX2D_ROP_WHITE,		/**< Whiteness */
} HI_GFX2D_ROP_MODE_E;

/** structure of rect */
/** CNcomment:���νṹ�� */
typedef struct hiGFX2D_REST_S
{
    HI_S32 s32XPos;		/**<CNcomment:���ε����ϵ������*/
    HI_S32 s32YPos;		 /**<CNcomment:���ε����ϵ�������*/
    HI_U32 u32Width;		 /**<CNcomment:���εĿ�*/
    HI_U32 u32Height;		/**<CNcomment:���εĸ�*/
} HI_GFX2D_RECT_S;

/** structure of compress info */
/** CNcomment:ѹ����Ϣ�ṹ�� */
typedef struct hiGFX2D_COMPRESS_S
{
    HI_GFX2D_COMPRESS_TYPE_E enCompressType;  /**<CNcomment:ѹ������*/
} HI_GFX2D_COMPRESS_S;

/** structure of alpha expand info */
/** CNcomment:ARGB1555��ʽalpha��չ��Ϣ�ṹ��*/
typedef struct hiGFX2D_ALPHAEXT_S
{
    HI_BOOL bExtAlpha;		/**<CNcomment:�Ƿ������չalpha.*/
    HI_U8   u8Alpha0;		    /**<CNcomment:������չalphaʱ,0��Ӧ��alphaֵ.*/
    HI_U8   u8Alpha1;		    /**<CNcomment:������չalphaʱ,1��Ӧ��alphaֵ.*/
} HI_GFX2D_ALPHAEXT_S;

/** structure of memory surface */
/** CNcomment:�ڴ�����surface��Ϣ�ṹ�� */
typedef struct hiGFX2D_SURFACE_S
{
    HI_GFX2D_SURFACE_TYPE_E enType; /**<CNcomment:surface����*/
    HI_GFX2D_FMT_E enFmt;	  /**<CNcomment:���ظ�ʽ,ֻ��MEM����surface��Ч*/
    HI_U32 u32Width;	      /**<CNcomment:����*/
    HI_U32 u32Height;	      /**<CNcomment:�߶�*/
    HI_U32 u32Color;	/**<CNcomment:surface��ɫֵ,ֻ��COLOR����surface��Ч*/

    /**<CNcomment:�ڴ��ַ��Ϣ,ֻ��mem���͵�surface��Ч
    package��ʽ:u32Phyaddr[0]��ʾ���ݵ�ַ
    semi-planar��ʽ:u32Phyaddr[0]��ʾY������ַ,u32Phyaddr[1]��ʾCbCr������ַ
    planar��ʽ:u32Phyaddr[0]��ʾY������ַ,u32Phyaddr[1]��ʾCb������ַ,
    u32Phyaddr[2]��ʾCr������ַ*/
    HI_U32 u32Phyaddr[HI_GFX_SURFACE_ADDR_CNT];

    /**<CNcomment:�п��,ֻ��mem���͵�surface��Ч
    package��ʽ:u32Stride[0]��ʾ���ݿ��
    semi-planar��ʽ:u32Stride[0]��ʾY�����п��,u32Stride[1]��ʾCbCr�����п��
    planar��ʽ:u32Stride[0]��ʾY�����п��,u32Stride[1]��ʾCb�����п��,
    u32Stride[2]��ʾCr�����п��*/
    HI_U32 u32Stride[HI_GFX_SURFACE_STRIDE_CNT];

    HI_BOOL bPremulti;	 /**<CNcomment:�Ƿ�ΪԤ������*/
    HI_GFX2D_COMPRESS_S stCompressInfo;	     /**<CNcomment:ѹ����Ϣ��ֻ��MEM����surface��Ч*/
    HI_U32  u32HistogramPhyaddr;     /**<CNcomment:ֱ��ͼ������ַ��ֻ��MEM����surface��Ч*/
    HI_GFX2D_ALPHAEXT_S stAlphaExt; /**<CNcomment:alpha��չ��Ϣ,ֻ��MEM����surface��ARGB1555��ʽ��Ч*/
    HI_U32  u32PalettePhyaddr; /**<CNcomment:��ɫ���ַ,ֻ��MEM����surface�ĵ�ɫ���ʽ��Ч*/

    HI_S32 s32AcquireFenceFd;
    HI_S32 s32ReleaseFenceFd;
} HI_GFX2D_SURFACE_S;

/** structure of surface */
/** CNcomment:RGB��ʽcolorkey��Ϣ�ṹ��*/
typedef struct hiGFX2D_COLORKEY_RGB_S
{
    HI_BOOL bAEnable;
    HI_BOOL bAOut;
    HI_U8   u8AMin;
    HI_U8   u8AMax;
    HI_U8   u8AMask;

    HI_BOOL bREnable;
    HI_BOOL bROut;
    HI_U8   u8RMin;
    HI_U8   u8RMax;
    HI_U8   u8RMask;

    HI_BOOL bGEnable;
    HI_BOOL bGOut;
    HI_U8   u8GMin;
    HI_U8   u8GMax;
    HI_U8   u8GMask;

    HI_BOOL bBEnable;
    HI_BOOL bBOut;
    HI_U8   u8BMin;
    HI_U8   u8BMax;
    HI_U8   u8BMask;
} HI_GFX2D_COLORKEY_RGB_S;

/** structure of surface */
/** CNcomment:clut��ʽ colorkey��Ϣ�ṹ��*/
typedef struct hiGFX2D_COLORKEY_CLUT_S
{
    HI_BOOL bAEnable;
    HI_BOOL bAOut;
    HI_U8   u8AMin;
    HI_U8   u8AMax;
    HI_U8   u8AMask;

    HI_BOOL bClutEnable;
    HI_BOOL bClutOut;
    HI_U8   u8ClutMin;
    HI_U8   u8ClutMax;
    HI_U8   u8ClutMask;
} HI_GFX2D_COLORKEY_CLUT_S;

typedef union hiGFX2D_COLORKEY_U
{
    HI_GFX2D_COLORKEY_RGB_S stRgb;
    HI_GFX2D_COLORKEY_CLUT_S stClut;
} HI_GFX2D_COLORKEY_U;

/** structure of color space */
/** CNcomment:��ɫ�ռ�ת����Ϣ�ṹ��*/
typedef struct hiGFX2D_CSC_S
{
    HI_BOOL bUserParamEnable;	    /**<CNcomment:�Ƿ�ʹ���û��Զ���ϵ��*/
    HI_U32  u32UserParamPhyaddr;    /**<CNcomment:�û��Զ���ϵ��������ַ*/
} HI_GFX2D_CSC_S;

/** structure of filter info */
/** CNcomment:�˲���Ϣ�ṹ��*/
typedef struct hiGFX2D_FILTER_S
{
    HI_GFX2D_FILTER_MODE_E enFilterMode;      /**<CNcomment:�˲�ģʽ*/
} HI_GFX2D_FILTER_S;

/** structure of clip info */
/** CNcomment:��������Ϣ�ṹ��*/
typedef struct hiGFX2D_CLIP_S
{
    HI_GFX2D_CLIP_MODE_E enClipMode;	  /**<CNcomment:����ģʽ*/
    HI_GFX2D_RECT_S	 stClipRect;		  /**<CNcomment:���о���*/
} HI_GFX2D_CLIP_S;

/** structure of resize info */
/** CNcomment:������Ϣ�ṹ��*/
typedef struct hiGFX2D_RESIZE_S
{
    HI_BOOL	    bResizeEnable; /**<CNcomment:�Ƿ�ʹ������.*/
    HI_GFX2D_FILTER_S stFilter;	      /**<CNcomment:�˲���Ϣ.*/
} HI_GFX2D_RESIZE_S;

/** structure of alpha blend info */
/** CNcomment:������Ϣ�ṹ��*/
typedef struct hiGFX2D_COMPOSE_BLEND_S
{
    HI_BOOL bCovBlend;
    HI_BOOL bPixelAlphaEnable;	/**<CNcomment:�Ƿ�ʹ������alpha.*/
    HI_BOOL bGlobalAlphaEnable; /**<CNcomment:�Ƿ�ʹ��ȫ��alpha.*/
    HI_U8   u8GlobalAlpha;	     /**<CNcomment:ȫ��alphaֵ.*/
} HI_GFX2D_COMPOSE_BLEND_S;

/** structure of rop info */
/** CNcomment:rop��Ϣ�ṹ��*/
typedef struct hiGFX2D_ROP_S
{
    HI_BOOL	      bEnable;
    HI_GFX2D_ROP_MODE_E enAlphaRopMode;
    HI_GFX2D_ROP_MODE_E enRGBRopMode;
} HI_GFX2D_ROP_S;

/** structure of key info */
/** CNcomment:colorkey��Ϣ�ṹ��*/
typedef struct hiGFX2D_COLORKEY_S
{
    HI_BOOL	      bEnable;
    HI_GFX2D_COLORKEY_U enKeyValue;
} HI_GFX2D_COLORKEY_S;

/** structure of operation info */
/** CNcomment:����ѡ����Ϣ�ṹ��*/
typedef struct hiGFX2D_COMPOSE_OPT_S
{
    HI_GFX2D_COMPOSE_BLEND_S stBlend;	 /**<CNcomment:alpha������Ϣ.*/
    HI_GFX2D_RESIZE_S	     stResize; /**<CNcomment:������Ϣ.*/
    HI_GFX2D_CLIP_S	     stClip;  /**<CNcomment:��������Ϣ.*/
    HI_GFX2D_ROP_S	     stRop;/**<CNcomment:ROP��Ϣ.*/
    HI_GFX2D_COLORKEY_S	     stKey; /**<CNcomment:key��Ϣ.*/
} HI_GFX2D_COMPOSE_OPT_S;

/** structure of composed surface and operation info */
/** CNcomment:������surface������ѡ��ṹ��*/
typedef struct hiGFX2D_COMPOSE_S
{
    HI_GFX2D_SURFACE_S	   stSurface; /**<CNcomment:surface��Ϣ.*/
    HI_GFX2D_RECT_S	   stInRect;	  /**<CNcomment:�����������.*/
    HI_GFX2D_RECT_S	   stOutRect;	  /**<CNcomment:�������.*/
    HI_GFX2D_COMPOSE_OPT_S stOpt;     /**<CNcomment:����ѡ��.*/
} HI_GFX2D_COMPOSE_S;

/* composed surface list */
typedef struct hiGFX2D_COMPOSE_LIST_S
{
    HI_GFX2D_COMPOSE_S *pstCompose;	 /**<CNcomment:.���Ӳ�����,�������µ��ϵ�˳������*/
    HI_U32	       u32ComposeCnt;	/**<CNcomment:.���Ӳ�����*/
    HI_U32	       u32BgColor;	/**<CNcomment:���ӱ���ɫ.*/
} HI_GFX2D_COMPOSE_LIST_S;

/** @} */  /*! <!-- Structure Definition end */

#ifdef __cplusplus
#if __cplusplus
}
#endif	/*__cplusplus*/
#endif	/*__cplusplus*/

#endif	/*_HI_GFX_TYPE_H_*/
