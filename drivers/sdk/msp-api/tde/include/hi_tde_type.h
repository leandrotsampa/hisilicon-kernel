/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
******************************************************************************
File Name	    : hi_tde_type.h
Version		    : Initial Draft
Author		    :
Created		    : 2014/06/20
Description	    :
Function List	    :
History		    :
Date			    Author		    Modification
2014/06/20		    y00181162		    Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __HI_TDE_TYPE_H__
#define	 __HI_TDE_TYPE_H__


#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* End of #ifdef __cplusplus */

#include "hi_tde_errcode.h"

/****************************************************************************/
/*			       TDE2 types define			     */
/****************************************************************************/

/*************************** Structure Definition ****************************/
/** \addtogroup	     TDE */
/** @{ */  /** <!-- �� TDE�� */


/**Definition of the TDE handle*/
/**CNcomment:TDE������� */
typedef HI_S32 TDE_HANDLE;

/**TDE callback functions*/
/**CNcomment:TDE�жϻص����� */
typedef HI_VOID (* TDE_FUNC_CB) (HI_VOID *pParaml, HI_VOID *pParamr);

typedef HI_VOID (* TDE_TRIG_SEL)(HI_U32);

/**RGB and packet YUV formats*/
/**CNcomment:RGB��Packet YUV ��ɫ��ʽ */
typedef enum hiTDE2_COLOR_FMT_E
{
    TDE2_COLOR_FMT_RGB444 = 0,		/**<For the RGB444 format, red occupies four bits, green occupies four bits, and blue occupies four bits. Other formats may be deduced by analogy.*//**<CNcomment:RGB444��ʽ, Redռ4bits Greenռ4bits, Blueռ4bits,�����ʽ�������� */
    TDE2_COLOR_FMT_BGR444,		/**<BGR444 format*//**<CNcomment:BGR444��ʽ */
    TDE2_COLOR_FMT_RGB555,		/**<RGB555 format*//**<CNcomment:RGB555��ʽ */
    TDE2_COLOR_FMT_BGR555,		/**<BGR555 format*//**<CNcomment:BGR555��ʽ */
    TDE2_COLOR_FMT_RGB565,		/**<RGB565 format*//**<CNcomment:RGB565��ʽ */
    TDE2_COLOR_FMT_BGR565,		/**<BGR565 format*//**<CNcomment:BGR565��ʽ */
    TDE2_COLOR_FMT_RGB888,		/**<RGB888 format*//**<CNcomment:RGB888��ʽ */
    TDE2_COLOR_FMT_BGR888,		/**<BGR888 format*//**<CNcomment:BGR888��ʽ */
    TDE2_COLOR_FMT_ARGB4444,	      /**<ARGB4444 format*//**<CNcomment:ARGB4444��ʽ */
    TDE2_COLOR_FMT_ABGR4444,	       /**<ABGR4444 format*//**<CNcomment:ABGR4444��ʽ */
    TDE2_COLOR_FMT_RGBA4444,		/**<RGBA4444 format*//**<CNcomment:RGBA4444��ʽ */
    TDE2_COLOR_FMT_BGRA4444,		/**<BGRA4444 format*//**<CNcomment:BGRA4444��ʽ */
    TDE2_COLOR_FMT_ARGB1555,		/**<ARGB1555 format*//**<CNcomment:ARGB1555��ʽ */
    TDE2_COLOR_FMT_ABGR1555,		/**<ABGR1555 format*//**<CNcomment:ABGR1555��ʽ */
    TDE2_COLOR_FMT_RGBA1555,		/**<RGBA1555 format*//**<CNcomment:RGBA1555��ʽ */
    TDE2_COLOR_FMT_BGRA1555,		/**<BGRA1555 format*//**<CNcomment:BGRA1555��ʽ */
    TDE2_COLOR_FMT_ARGB8565,		/**<ARGB8565 format*//**<CNcomment:ARGB8565��ʽ */
    TDE2_COLOR_FMT_ABGR8565,		/**<ABGR8565 format*//**<CNcomment:ABGR8565��ʽ */
    TDE2_COLOR_FMT_RGBA8565,		/**<RGBA8565 format*//**<CNcomment:RGBA8565��ʽ */
    TDE2_COLOR_FMT_BGRA8565,		/**<BGRA8565 format*//**<CNcomment:BGRA8565��ʽ */
    TDE2_COLOR_FMT_ARGB8888,		/**<ARGB8888 format*//**<CNcomment:ARGB8888��ʽ */
    TDE2_COLOR_FMT_ABGR8888,		/**<ABGR8888 format*//**<CNcomment:ABGR8888��ʽ */
    TDE2_COLOR_FMT_RGBA8888,		/**<RGBA8888 format*//**<CNcomment:RGBA8888��ʽ */
    TDE2_COLOR_FMT_BGRA8888,		/**<BGRA8888 format*//**<CNcomment:BGRA8888��ʽ */
    TDE2_COLOR_FMT_RABG8888,		/**<RABG8888 format*//**<CNcomment:RABG8888��ʽ */
    TDE2_COLOR_FMT_CLUT1,		/**<1-bit palette format without alpha component. Each pixel occupies one bit.*//**<CNcomment:��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    TDE2_COLOR_FMT_CLUT2,		/**<2-bit palette format without alpha component. Each pixel occupies two bits.*//**<CNcomment:��Alpha����,��ɫ��2bit��ʽ,ÿ������2��bit��ʾ */
    TDE2_COLOR_FMT_CLUT4,		/**<4-bit palette format without alpha component. Each pixel occupies four bits.*//**<CNcomment:��Alpha����,��ɫ��4bit��ʽ,ÿ������4��bit��ʾ */
    TDE2_COLOR_FMT_CLUT8,		/**<8-bit palette format without alpha component. Each pixel occupies eight bits.*//**<CNcomment:��Alpha����,��ɫ��8bit��ʽ,ÿ������8��bit��ʾ */
    TDE2_COLOR_FMT_ACLUT44,		/**<1-bit palette format with alpha component. Each pixel occupies one bit.*//**<CNcomment:��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    TDE2_COLOR_FMT_ACLUT88,		/**<1-bit palette format with alpha component. Each pixel occupies one bit.*//**<CNcomment:��Alpha����,��ɫ��1bit��ʽ,ÿ������1��bit��ʾ */
    TDE2_COLOR_FMT_A1,			/**<Alpha format. Each pixel occupies one bit.*//**<CNcomment:alpha��ʽ��ÿ������1bit */
    TDE2_COLOR_FMT_A8,			/**<Alpha format. Each pixel occupies eight bits.*//**<CNcomment:alpha��ʽ��ÿ������8bit */
    TDE2_COLOR_FMT_YCbCr888,		/**<YUV packet format without alpha component*//**<CNcomment:YUV packet��ʽ����alpha����*/
    TDE2_COLOR_FMT_AYCbCr8888,		/**<YUV packet format with alpha component*//**<CNcomment:YUV packet��ʽ����alpha����*/
    TDE2_COLOR_FMT_YCbCr422,		/**<YUV packet422 format*//**<CNcomment:YUV packet422��ʽ */
    TDE2_COLOR_FMT_byte,		/**<Only for fast copy*//**<CNcomment:���������ݿ���copy*/
    TDE2_COLOR_FMT_halfword,		/**<Only for fast copy*//**<CNcomment:���������ݿ���copy*/
    TDE2_COLOR_FMT_JPG_YCbCr400MBP,	/**<Semi-planar YUV400 format, for JPG decoding*//**<CNcomment:Semi-planar YUV400��ʽ ,��Ӧ��JPG����*/
    TDE2_COLOR_FMT_JPG_YCbCr422MBHP,	/**<Semi-planar YUV422 format, horizontal sampling, for JPG decoding*//**<CNcomment:Semi-planar YUV422��ʽ,ˮƽ�����������Ӧ��JPG���� */
    TDE2_COLOR_FMT_JPG_YCbCr422MBVP,	/**<Semi-planar YUV422 format, vertical sampling, for JPG decoding*//**<CNcomment:Semi-planar YUV422��ʽ,��ֱ�����������Ӧ��JPG���� */
    TDE2_COLOR_FMT_MP1_YCbCr420MBP,	/**<Semi-planar YUV420 format*//**<CNcomment:Semi-planar YUV420��ʽ */
    TDE2_COLOR_FMT_MP2_YCbCr420MBP,	/**<Semi-planar YUV420 format*//**<CNcomment:Semi-planar YUV420��ʽ */
    TDE2_COLOR_FMT_MP2_YCbCr420MBI,	/**<Semi-planar YUV400 format*//**<CNcomment:Semi-planar YUV400��ʽ */
    TDE2_COLOR_FMT_JPG_YCbCr420MBP,	/**<Semi-planar YUV400 format, for JPG decoding*//**<CNcomment:Semi-planar YUV400��ʽ,����Ӧ��JPG */
    TDE2_COLOR_FMT_JPG_YCbCr444MBP,	/**<Semi-planar YUV444 format*//**<CNcomment:Semi-planar YUV444��ʽ */
    TDE2_COLOR_FMT_BUTT			/**<End of enumeration*//**<CNcomment: ö��������*/
} TDE2_COLOR_FMT_E;

/**Definition of the semi-planar YUV format*/
/**CNcomment:Semi-planar YUV ��ʽ���� */
typedef enum hiTDE2_MB_COLORFMT_E
{
    TDE2_MB_COLOR_FMT_JPG_YCbCr400MBP = 0,/**<Semi-planar YUV400 format, for JPG decoding*//**<CNcomment:Semi-planar YUV400��ʽ ,��Ӧ��JPG����*/
    TDE2_MB_COLOR_FMT_JPG_YCbCr422MBHP,	  /**<Semi-planar YUV422 format, horizontal sampling, for JPG decoding*//**<CNcomment:Semi-planar YUV422��ʽ,ˮƽ�����������Ӧ��JPG���� */
    TDE2_MB_COLOR_FMT_JPG_YCbCr422MBVP,	  /**<Semi-planar YUV422 format, vertical sampling, for JPG decoding*//**<CNcomment:Semi-planar YUV422��ʽ,��ֱ�����������Ӧ��JPG���� */
    TDE2_MB_COLOR_FMT_MP1_YCbCr420MBP,	  /**<Semi-planar YUV420 format*//**<CNcomment:Semi-planar YUV420��ʽ */
    TDE2_MB_COLOR_FMT_MP2_YCbCr420MBP,	  /**<Semi-planar YUV420 format*//**<CNcomment:Semi-planar YUV420��ʽ */
    TDE2_MB_COLOR_FMT_MP2_YCbCr420MBI,	  /**<Semi-planar YUV400 format*//**<CNcomment:Semi-planar YUV400��ʽ */
    TDE2_MB_COLOR_FMT_JPG_YCbCr420MBP,	  /**<Semi-planar YUV400 format, for JPG pictures*//**<CNcomment:Semi-planar YUV400��ʽ,����Ӧ��JPG */
    TDE2_MB_COLOR_FMT_JPG_YCbCr444MBP,	  /**<Semi-planar YUV444 format, for JPG pictures*//**<CNcomment:Semi-planar YUV444��ʽ,����Ӧ��JPG */
    TDE2_MB_COLOR_FMT_BUTT
} TDE2_MB_COLOR_FMT_E;

/**Structure of the bitmap information set by customers*/
/**CNcomment:�û����õ�λͼ��Ϣ�ṹ */
typedef struct hiTDE2_SURFACE_S
{
    HI_U32 u32PhyAddr;		    /**<Header address of a bitmap or the Y component*//**<CNcomment:λͼ�׵�ַ��Y������ַ */

    TDE2_COLOR_FMT_E enColorFmt;    /**<Color format*//**<CNcomment:��ɫ��ʽ */

    HI_U32 u32Height;		    /**<Bitmap height*//**<CNcomment:λͼ�߶� */

    HI_U32 u32Width;		    /**<Bitmap width*//**<CNcomment:λͼ���� */

    HI_U32 u32Stride;		    /**<Stride of a bitmap or the Y component*//**<CNcomment:λͼ��Ȼ�Y������� */
    HI_U8* pu8ClutPhyAddr;	    /**<Address of the color look-up table (CLUT), for color extension or color correction*//**<CNcomment:Clut����ַ,������ɫ��չ����ɫУ��*/

    HI_BOOL bYCbCrClut;		    /**<Whether the CLUT is in the YCbCr space.*//**<CNcomment:Clut���Ƿ�λ��YCbCr�ռ� */

    HI_BOOL bAlphaMax255;	    /**<The maximum alpha value of a bitmap is 255 or 128.*//**<CNcomment:λͼalpha���ֵΪ255����128 */

    HI_BOOL bAlphaExt1555;	    /*<Whether to enable the alpha extension of an ARGB1555 bitmap.*//**<CNcomment:�Ƿ�ʹ��1555��Alpha��չ */
    HI_U8 u8Alpha0;		    /**<Values of alpha0 and alpha1, used as the ARGB1555 format*//**<CNcomment:Alpha0��Alpha1ֵ������ARGB1555��ʽ */
    HI_U8 u8Alpha1;		    /**<Values of alpha0 and alpha1, used as the ARGB1555 format*//**<CNcomment:Alpha0��Alpha1ֵ������ARGB1555��ʽ */
    HI_U32 u32CbCrPhyAddr;	    /**<Address of the CbCr component, pilot*//**<CNcomment:CbCr������ַ,pilot */
    HI_U32 u32CbCrStride;	    /**<Stride of the CbCr component, pilot*//**<CNcomment:CbCr�������,pilot */
} TDE2_SURFACE_S;

/**Definition of the semi-planar YUV data*/
/**CNcomment:Semi-planar YUV��ʽ���ݶ��� */
typedef struct hiTDE2_MB_S
{
    TDE2_MB_COLOR_FMT_E enMbFmt;	/**<YUV format*//**<CNcomment:YUV��ʽ */
    HI_U32		u32YPhyAddr;	/**<Physical address of the Y component*//**<CNcomment:Y����������ַ */
    HI_U32		u32YWidth;	/**<Width of the Y component*//**<CNcomment:Y�������� */
    HI_U32		u32YHeight;	/**<Height of the Y component*//**<CNcomment:Y�����߶� */
    HI_U32		u32YStride;	/**< Stride of the Y component, indicating bytes in each row*//**<CNcomment:Y������ȣ�ÿ���ֽ��� */
    HI_U32		u32CbCrPhyAddr; /**<Width of the UV component*//**<CNcomment:UV�������� */
    HI_U32		u32CbCrStride;	/**<Stride of the UV component, indicating the bytes in each row*//**<CNcomment:UV�������,ÿ���ֽ��� */
} TDE2_MB_S;

/**Definition of the TDE rectangle*/
/**CNcomment:TDE���ζ���*/
typedef struct hiTDE2_RECT_S
{
    HI_S32 s32Xpos;	/**<Horizontal coordinate*//**<CNcomment:x���� */
    HI_S32 s32Ypos;	/**<Vertical coordinate*//**<CNcomment:y���� */
    HI_U32 u32Width;	/**<Width*//**<CNcomment:���� */
    HI_U32 u32Height;	/**<Height*//**<CNcomment:�߶� */
} TDE2_RECT_S;

/**Logical operation type*/
/**CNcomment:�߼����㷽ʽ */
typedef enum hiTDE2_ALUCMD_E
{
    TDE2_ALUCMD_NONE = 0x0,	    /**<No alpha and raster of operation (ROP) blending*//**<CNcomment:������alpha��rop���� */
    TDE2_ALUCMD_BLEND = 0x1,	    /**<Alpha blending*//**<CNcomment:Alpha���*/
    TDE2_ALUCMD_ROP = 0x2,	    /**<ROP blending*//**<CNcomment:����rop���� */
    TDE2_ALUCMD_COLORIZE = 0x4,	    /**<Colorize operation*//**<CNcomment:����Colorize���� */
    TDE2_ALUCMD_BUTT = 0x8	    /**<End of enumeration*//**<CNcomment:ö�ٽ��� */
} TDE2_ALUCMD_E;

/**Definition of ROP codes*/
/**CNcomment:ROP�����붨�� */
typedef enum hiTDE2_ROP_CODE_E
{
    TDE2_ROP_BLACK = 0,	    /**<Blackness*/
    TDE2_ROP_NOTMERGEPEN,   /**<~(S2 | S1)*/
    TDE2_ROP_MASKNOTPEN,    /**<~S2&S1*/
    TDE2_ROP_NOTCOPYPEN,    /**< ~S2*/
    TDE2_ROP_MASKPENNOT,    /**< S2&~S1 */
    TDE2_ROP_NOT,	    /**< ~S1 */
    TDE2_ROP_XORPEN,	    /**< S2^S1 */
    TDE2_ROP_NOTMASKPEN,    /**< ~(S2 & S1) */
    TDE2_ROP_MASKPEN,	    /**< S2&S1 */
    TDE2_ROP_NOTXORPEN,	    /**< ~(S2^S1) */
    TDE2_ROP_NOP,	    /**< S1 */
    TDE2_ROP_MERGENOTPEN,   /**< ~S2|S1 */
    TDE2_ROP_COPYPEN,	    /**< S2 */
    TDE2_ROP_MERGEPENNOT,   /**< S2|~S1 */
    TDE2_ROP_MERGEPEN,	    /**< S2|S1 */
    TDE2_ROP_WHITE,	    /**< Whiteness */
    TDE2_ROP_BUTT
} TDE2_ROP_CODE_E;

/**Definition of the blit mirror*/
/**CNcomment:blit������ */
typedef enum hiTDE2_MIRROR_E
{
    TDE2_MIRROR_NONE = 0,	/**<No mirror*//**<CNcomment:�����о��� */
    TDE2_MIRROR_HORIZONTAL,	/**<Horizontal mirror*//**<CNcomment:ˮƽ���� */
    TDE2_MIRROR_VERTICAL,	/**<Vertical mirror*//**<CNcomment:��ֱ���� */
    TDE2_MIRROR_BOTH,		/**<Horizontal and vertical mirror*//**<CNcomment:��ֱ��ˮƽ���� */
    TDE2_MIRROR_BUTT
} TDE2_MIRROR_E;

/**Clip operation type*/
/**CNcomment:Clip��������*/
typedef enum hiTDE2_CLIPMODE_E
{
    TDE2_CLIPMODE_NONE = 0, /**<No clip*//**<CNcomment:��clip���� */
    TDE2_CLIPMODE_INSIDE,   /**<Clip the data within the rectangle to output and discard others*//**<CNcomment:���о��η�Χ�ڵ��������,�����ӵ�*/
    TDE2_CLIPMODE_OUTSIDE,  /**<Clip the data outside the rectangle to output and discard others*//**<CNcomment:���о��η�Χ�����������������ӵ�*/
    TDE2_CLIPMODE_BUTT
} TDE2_CLIPMODE_E;

/**Scaling mode for the macroblock*/
/**CNcomment:����ʽ��������*/
typedef enum hiTDE2_MBRESIZE_E
{
    TDE2_MBRESIZE_NONE = 0,	    /**<No scaling*//**<CNcomment:�������� */
    TDE2_MBRESIZE_QUALITY_LOW,	    /**<Low-quality scaling*//**<CNcomment:���������� */
    TDE2_MBRESIZE_QUALITY_MIDDLE,   /**<Medium-quality scaling*//**<CNcomment:���������� */
    TDE2_MBRESIZE_QUALITY_HIGH,	    /**<High-quality scaling*//**<CNcomment:���������� */
    TDE2_MBRESIZE_BUTT
} TDE2_MBRESIZE_E;

/**Definition of fill colors*/
/**CNcomment:���ɫ���� */
typedef struct hiTDE2_FILLCOLOR_S
{
    TDE2_COLOR_FMT_E enColorFmt;    /**<TDE pixel format*//**<CNcomment:TDE���ظ�ʽ */
    HI_U32	     u32FillColor;  /**<Fill colors that vary according to pixel formats*//**<CNcomment:�����ɫ���������ظ�ʽ����ͬ */
} TDE2_FILLCOLOR_S;

/**Definition of colorkey modes*/
/**CNcomment:colorkeyѡ������ */
typedef enum hiTDE2_COLORKEY_MODE_E
{
    TDE2_COLORKEY_MODE_NONE = 0,     /**<No colorkey*//**<CNcomment:����color key */
    TDE2_COLORKEY_MODE_FOREGROUND,   /**<When performing the colorkey operation on the foreground bitmap, you need to perform this operation before the CLUT for color extension and perform this operation after the CLUT for color correction.*//**<CNcomment:��ǰ��λͼ����color key��˵��:������ɫ��չ����CLUTǰ��color key��������ɫУ��:��CLUT����color key */
    TDE2_COLORKEY_MODE_BACKGROUND,   /**<Perform the colorkey operation on the background bitmap*//**<CNcomment:�Ա���λͼ����color key*/
    TDE2_COLORKEY_MODE_BUTT
} TDE2_COLORKEY_MODE_E;

/**Definition of colorkey range*/
/**CNcomment:colorkey��Χ���� */
typedef struct hiTDE2_COLORKEY_COMP_S
{
    HI_U8 u8CompMin;	       /**<Minimum value of a component*//**<CNcomment:������Сֵ*/
    HI_U8 u8CompMax;	       /**<Maximum value of a component*//**<CNcomment:�������ֵ*/
    HI_U8 bCompOut;	       /**<The colorkey of a component is within or beyond the range.*//**<CNcomment:�����ؼ�ɫ�ڷ�Χ��/��Χ��*/
    HI_U8 bCompIgnore;	       /**<Whether to ignore a component.*//**<CNcomment:�����Ƿ����*/
    HI_U8 u8CompMask;	       /**<Component mask*//**<CNcomment:��������*/
    HI_U8 u8Reserved;
    HI_U8 u8Reserved1;
    HI_U8 u8Reserved2;
} TDE2_COLORKEY_COMP_S;

/**Definition of colorkey values*/
/**CNcomment:colorkeyֵ���� */
typedef union hiTDE2_COLORKEY_U
{
    struct
    {
	TDE2_COLORKEY_COMP_S stAlpha;	/**<Alpha component*//**<CNcomment:alpha ������Ϣ */
	TDE2_COLORKEY_COMP_S stRed;	/**<Red component*//**<CNcomment:��ɫ������Ϣ */
	TDE2_COLORKEY_COMP_S stGreen;	/**<Green component*//**<CNcomment:��ɫ������Ϣ */
	TDE2_COLORKEY_COMP_S stBlue;	/**<Blue component*//**<CNcomment:��ɫ������Ϣ */
    } struCkARGB;
    struct
    {
	TDE2_COLORKEY_COMP_S stAlpha;	/**<Alpha component*//**<CNcomment:alpha ������Ϣ */
	TDE2_COLORKEY_COMP_S stY;	/**<Y component*//**<CNcomment:Y������Ϣ */
	TDE2_COLORKEY_COMP_S stCb;	/**<Cb component*//**<CNcomment:Cb������Ϣ */
	TDE2_COLORKEY_COMP_S stCr;	/**<Cr component*//**<CNcomment:Cr������Ϣ */
    } struCkYCbCr;
    struct
    {
	TDE2_COLORKEY_COMP_S stAlpha;	/**<Alpha component*//**<CNcomment:alpha ������Ϣ */
	TDE2_COLORKEY_COMP_S stClut;	/**<Palette component*//**<CNcomment:��ɫ�������Ϣ */
    } struCkClut;
} TDE2_COLORKEY_U;

/*Definition of alpha output sources*/
/**CNcomment:���alpha���� */
typedef enum hiTDE2_OUTALPHA_FROM_E
{
    TDE2_OUTALPHA_FROM_NORM = 0,    /**<Output from the result of alpha blending or anti-flicker*//**<CNcomment:��Դ��alpha blending�Ľ�����߿���˸�Ľ�� */
    TDE2_OUTALPHA_FROM_BACKGROUND,  /**<Output from the background bitmap*//**<CNcomment:��Դ�ڱ���λͼ */
    TDE2_OUTALPHA_FROM_FOREGROUND,  /**<Output from the foreground bitmap*//**<CNcomment:��Դ��ǰ��λͼ */
    TDE2_OUTALPHA_FROM_GLOBALALPHA, /**<Output from the global alpha*//**<CNcomment:��Դ��ȫ��alpha */
    TDE2_OUTALPHA_FROM_BUTT
} TDE2_OUTALPHA_FROM_E;

/**Definition of filtering*/
/**CNcomment:�����˲����� */
typedef enum hiTDE2_FILTER_MODE_E
{
    TDE2_FILTER_MODE_COLOR = 0, /**<Filter the color*//**<CNcomment:����ɫ�����˲� */
    TDE2_FILTER_MODE_ALPHA,	/**<Filter the alpha channel*//**<CNcomment:��alphaͨ���˲� */
    TDE2_FILTER_MODE_BOTH,	/**<Filter the color and alpha channel*//**<CNcomment:����ɫ��alphaͨ��ͬʱ�˲� */
    TDE2_FILTER_MODE_NONE,	/**<No filter *//**<CNcomment:�������˲� */
    TDE2_FILTER_MODE_BUTT
} TDE2_FILTER_MODE_E;

/**Configuration of the anti-flicker channel*/
/**CNcomment:����˸����ͨ������ */
typedef enum hiTDE2_DEFLICKER_MODE_E
{
    TDE2_DEFLICKER_MODE_NONE = 0,   /*<No anti-flicker*//**<CNcomment:�������� */
    TDE2_DEFLICKER_MODE_RGB,	    /**<Perform anti-flicker on the RGB component*//**<CNcomment:RGB�������� */
    TDE2_DEFLICKER_MODE_BOTH,	    /**<Perform anti-flicker on the alpha component*//**<CNcomment:alpha�������� */
    TDE2_DEFLICKER_MODE_BUTT
}TDE2_DEFLICKER_MODE_E;

/* blend mode */
typedef enum hiTDE2_BLEND_MODE_E
{
    TDE2_BLEND_ZERO = 0x0,
    TDE2_BLEND_ONE,
    TDE2_BLEND_SRC2COLOR,
    TDE2_BLEND_INVSRC2COLOR,
    TDE2_BLEND_SRC2ALPHA,
    TDE2_BLEND_INVSRC2ALPHA,
    TDE2_BLEND_SRC1COLOR,
    TDE2_BLEND_INVSRC1COLOR,
    TDE2_BLEND_SRC1ALPHA,
    TDE2_BLEND_INVSRC1ALPHA,
    TDE2_BLEND_SRC2ALPHASAT,
    TDE2_BLEND_BUTT
}TDE2_BLEND_MODE_E;

/**Alpha blending command. You can set parameters or select Porter or Duff.*/
/**CNcomment:alpha�������,����ѡ���Լ����ò�����Ҳ����ѡ��Porter/Duff�е�һ�� */
/* pixel = (source * fs + destination * fd),
   sa = source alpha,
   da = destination alpha */
typedef enum hiTDE2_BLENDCMD_E
{
    TDE2_BLENDCMD_NONE = 0x0,	  /**< fs: sa	   fd: 1.0-sa */
    TDE2_BLENDCMD_CLEAR,    /**< fs: 0.0     fd: 0.0 */
    TDE2_BLENDCMD_SRC,	    /**< fs: 1.0     fd: 0.0 */
    TDE2_BLENDCMD_SRCOVER,  /**< fs: 1.0     fd: 1.0-sa */
    TDE2_BLENDCMD_DSTOVER,  /**< fs: 1.0-da  fd: 1.0 */
    TDE2_BLENDCMD_SRCIN,    /**< fs: da	     fd: 0.0 */
    TDE2_BLENDCMD_DSTIN,    /**< fs: 0.0     fd: sa */
    TDE2_BLENDCMD_SRCOUT,   /**< fs: 1.0-da  fd: 0.0 */
    TDE2_BLENDCMD_DSTOUT,   /**< fs: 0.0     fd: 1.0-sa */
    TDE2_BLENDCMD_SRCATOP,  /**< fs: da	     fd: 1.0-sa */
    TDE2_BLENDCMD_DSTATOP,  /**< fs: 1.0-da  fd: sa */
    TDE2_BLENDCMD_ADD,	    /**< fs: 1.0     fd: 1.0 */
    TDE2_BLENDCMD_XOR,	    /**< fs: 1.0-da  fd: 1.0-sa */
    TDE2_BLENDCMD_DST,	    /**< fs: 0.0     fd: 1.0 */
    TDE2_BLENDCMD_CONFIG,   /**<You can set the parameteres.*//**<CNcomment:�û��Լ����ò���*/
    TDE2_BLENDCMD_BUTT
}TDE2_BLENDCMD_E;

/**Options for the alpha blending operation*/
/**CNcomment:alpha��ϲ���ѡ�� */
typedef struct hiTDE2_BLEND_OPT_S
{
    HI_BOOL  bGlobalAlphaEnable;	/**<Global alpha enable*//**<CNcomment:�Ƿ�ʹ��ȫ��alpha */
    HI_BOOL  bPixelAlphaEnable;		/**<Pixel alpha enable*//**<CNcomment:�Ƿ�ʹ������alpha */
    HI_BOOL bSrc1AlphaPremulti;		/**<Src1 alpha premultiply enable*//**<CNcomment:�Ƿ�ʹ��Src1 alphaԤ�� */
    HI_BOOL bSrc2AlphaPremulti;		/**<Src2 alpha premultiply enable*//**<CNcomment:�Ƿ�ʹ��Src2 alphaԤ�� */
    TDE2_BLENDCMD_E eBlendCmd;		/**<Alpha blending command*//**<CNcomment:alpha�������*/
    TDE2_BLEND_MODE_E eSrc1BlendMode;	/**<Src1 blending mode select. It is valid when eBlendCmd is set to TDE2_BLENDCMD_CONFIG.*//**<CNcomment:Src1 blendģʽѡ��,��eBlendCmd = TDE2_BLENDCMD_CONFIGʱ��Ч */
    TDE2_BLEND_MODE_E eSrc2BlendMode;	/**<Src2 blending mode select. It is valid when eBlendCmd is set to TDE2_BLENDCMD_CONFIG.*//**<CNcomment:Src2 blendģʽѡ��,��eBlendCmd = TDE2_BLENDCMD_CONFIGʱ��Ч */
}TDE2_BLEND_OPT_S;

/**CSC parameter option*/
/**CNcomment:CSC����ѡ��*/
typedef struct hiTDE2_CSC_OPT_S
{
    HI_BOOL bICSCUserEnable;		/**User-defined ICSC parameter enable*//**CNcomment:�û��Զ���ICSC����ʹ��*/
    HI_BOOL bICSCParamReload;	/**User-defined ICSC parameter reload enable*//**CNcomment:���¼����û��Զ���ICSC����ʹ��*/
    HI_BOOL bOCSCUserEnable;		/**User-defined OCSC parameter enable*//**CNcomment:�û��Զ���OCSC����ʹ��*/
    HI_BOOL bOCSCParamReload;	/**User-defined OCSC parameter reload enable*//**CNcomment:���¼����û��Զ���OCSC����ʹ��*/
    HI_U32 u32ICSCParamAddr;		/**ICSC parameter address. The address must be 128-bit aligned.*//**CNcomment:ICSC������ַ��Ҫ��128bit����*/
    HI_U32 u32OCSCParamAddr;	/**OCSC parameter address. The address must be 128-bit aligned.*//**CNcomment:OCSC������ַ��Ҫ��128bit����*/
}TDE2_CSC_OPT_S;

/**Definition of blit operation options*/
/**CNcomment:blit����ѡ��� */
typedef struct hiTDE2_OPT_S
{
    TDE2_ALUCMD_E enAluCmd;		    /**<Logical operation type*//**<CNcomment:�߼���������*/

    TDE2_ROP_CODE_E enRopCode_Color;	    /**<ROP type of the color space*//**<CNcomment:��ɫ�ռ�ROP����*/

    TDE2_ROP_CODE_E enRopCode_Alpha;	    /**<ROP type of the alpha component*//**<CNcomment:Alpha��ROP����*/

    TDE2_COLORKEY_MODE_E enColorKeyMode;    /**<Colorkey mode*//**<CNcomment:color key��ʽ*/

    TDE2_COLORKEY_U unColorKeyValue;	    /**<Colorkey value*//**<CNcomment:color key����ֵ*/

    TDE2_CLIPMODE_E enClipMode;		    /**<Perform the clip operation within or beyond the area*//**<CNcomment:��������clip������������clip*/

    TDE2_RECT_S stClipRect;		    /**<Definition of the clipping area*//**<CNcomment:clip������*/

    TDE2_DEFLICKER_MODE_E enDeflickerMode;  /**<Anti-flicker mode*//**<CNcomment:����˸ģʽ*/

    HI_BOOL bResize;			    /**<Whether to scale*//**<CNcomment:�Ƿ�����*/

    TDE2_FILTER_MODE_E enFilterMode;	    /**<Filtering mode during scaling*//**< CNcomment:����ʱʹ�õ��˲�ģʽ */

    TDE2_MIRROR_E enMirror;		    /**<Mirror type*//**<CNcomment:��������*/

    HI_BOOL bClutReload;		    /**<Whether to reload the CLUT*//**<CNcomment:�Ƿ����¼���Clut��*/

    HI_U8   u8GlobalAlpha;		    /**<Global alpha value*//**<CNcomment:ȫ��Alphaֵ*/

    TDE2_OUTALPHA_FROM_E enOutAlphaFrom;    /**<Source of the output alpha*//**<CNcomment:���alpha��Դ*/

    HI_U32 u32Colorize;			    /**<Colorize value*//**<CNcomment:Colorizeֵ */

    TDE2_BLEND_OPT_S stBlendOpt;

    TDE2_CSC_OPT_S stCscOpt;
} TDE2_OPT_S;

/**Definition of macroblock operation options*/
/**CNcomment:������ѡ��� */
typedef struct hiTDE2_MBOPT_S
{
    TDE2_CLIPMODE_E enClipMode;	    /**<Clip mode*//**<CNcomment:Clipģʽѡ��*/

    TDE2_RECT_S stClipRect;	    /**<Definition of the clipping area*//**<CNcomment:clip������*/

    HI_BOOL bDeflicker;		    /**<Whether to perform anti-flicker*//**<CNcomment:�Ƿ���˸*/

    TDE2_MBRESIZE_E enResize;	    /**<Scaling information*//**<CNcomment:������Ϣ*/

    HI_BOOL bSetOutAlpha;	    /**<If the alpha value is not set, the maximum alpha value is output by default.*//**<CNcomment:���������Alpha,��Ĭ��������Alphaֵ*/

    HI_U8   u8OutAlpha;		    /**<Global alpha for operation*//**<CNcomment:�μ������ȫ��alpha */
} TDE2_MBOPT_S;

/**Definition of the pattern filling operation*/
/**CNcomment:ģʽ��������Ϣ���� */
typedef struct hiTDE2_PATTERN_FILL_OPT_S
{
    TDE2_ALUCMD_E enAluCmd;		    /**<Logical operation type*//**<CNcomment:�߼���������*/

    TDE2_ROP_CODE_E enRopCode_Color;	    /**<ROP type of the color space*//**<CNcomment:��ɫ�ռ�ROP����*/

    TDE2_ROP_CODE_E enRopCode_Alpha;	    /**<ROP type of the alpha component*//**<CNcomment:alpha��ROP����*/

    TDE2_COLORKEY_MODE_E enColorKeyMode;    /**<Colorkey mode*//**<CNcomment:color key��ʽ*/

    TDE2_COLORKEY_U unColorKeyValue;	    /**<Colorkey value*//**<CNcomment:color keyֵ*/

    TDE2_CLIPMODE_E enClipMode;		    /**<Clip mode*//**<CNcomment:clipģʽ*/

    TDE2_RECT_S stClipRect;		    /**<Clipping area*//**<CNcomment:clip����*/

    HI_BOOL bClutReload;		    /**<Whether to reload the CLUT*//**<CNcomment:�Ƿ�����clut��*/

    HI_U8 u8GlobalAlpha;		    /**<Global alpha*//**<CNcomment:ȫ��alpha*/

    TDE2_OUTALPHA_FROM_E enOutAlphaFrom;    /**<Source of the output alpha*//**<CNcomment:���alpha��Դ*/

    HI_U32 u32Colorize;			    /**<Colorize value*//**<CNcomment:Colorizeֵ*/

    TDE2_BLEND_OPT_S stBlendOpt;	   /**<Options of the blending operation*//**<CNcomment:Blend����ѡ�� */

    TDE2_CSC_OPT_S stCscOpt;		/**<CSC parameter option*//**<CNcomment:Csc����ѡ��*/

}TDE2_PATTERN_FILL_OPT_S;

/**Definition of rotation directions*/
/**CNcomment:��ת������ */
typedef enum hiTDE_ROTATE_ANGLE_E
{
    TDE_ROTATE_CLOCKWISE_90 = 0,    /**<Rotate 90�� clockwise*//**< CNcomment:˳ʱ����ת90�� */
    TDE_ROTATE_CLOCKWISE_180,	    /**<Rotate 180�� clockwise*//**< CNcomment:˳ʱ����ת180�� */
    TDE_ROTATE_CLOCKWISE_270,	    /**<Rotate 270�� clockwise*//**< CNcomment:˳ʱ����ת270�� */
    TDE_ROTATE_BUTT
} TDE_ROTATE_ANGLE_E;

/**Definition of anti-flicker levels*/
/**CNcomment:����˸������ */
typedef enum hiTDE_DEFLICKER_LEVEL_E
{
    TDE_DEFLICKER_AUTO = 0, /**<Adaptation. The anti-flicker coefficient is selected by the TDE.*//**<CNcomment:����Ӧ����TDEѡ����˸ϵ��*/
    TDE_DEFLICKER_LOW,	    /**<Low-level anti-flicker*//**<CNcomment:�ͼ�����˸*/
    TDE_DEFLICKER_MIDDLE,   /**<Medium-level anti-flicker*//**CNcomment:�м�����˸*/
    TDE_DEFLICKER_HIGH,	    /**High-level anti-flicker*//**CNcomment:�߼�����˸*/
    TDE_DEFLICKER_BUTT
}TDE_DEFLICKER_LEVEL_E;

/* composed surface info */
typedef struct hiTDE_COMPOSOR_S
{
    TDE2_SURFACE_S stSrcSurface;
    TDE2_RECT_S stInRect;
    TDE2_RECT_S stOutRect;
    TDE2_OPT_S stOpt;
}TDE_COMPOSOR_S;

/* composed surface list */
typedef struct hiTDE_SURFACE_LIST_S
{
	HI_U32 u32SurfaceNum;
	TDE2_SURFACE_S *pDstSurface;
	TDE_COMPOSOR_S *pstComposor;
}TDE_SURFACE_LIST_S;


#ifdef __cplusplus
	#if __cplusplus
}
	#endif
   #endif /* __cplusplus */
#endif /*__HI_TDE_TYPE_H__ */
