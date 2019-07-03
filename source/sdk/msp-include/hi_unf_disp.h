/******************************************************************************

   Copyright (C), 2001-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
   File Name	 : hi_unf_disp.h
   Version	 : Initial Draft
   Author	 : Hisilicon multimedia software group
   Created	 : 2009/12/15
   Description	 :
   History	 :
   1.Date	 : 2009/12/15
    Author	: w58735
    Modification: Created file

 *******************************************************************************/


/* SPDX-License-Identifier: GPL-2.0 */

/**
 * \file
 **\brief : define DISPLAY module information
 * \brief supply infor about display.
 */

#ifndef	 __HI_UNF_DISP_H__
#define	 __HI_UNF_DISP_H__

#include "hi_unf_common.h"
#include "hi_unf_hdmi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*************************** Structure Definition ****************************/
/** \addtogroup	     DISPLAY */
/** @{ */  /** <!-- [DISPLAY] */

/**enum define about DISPLAY channel*/
/**CNcomment:����DISPLAYͨ��ö��*/
typedef enum hiUNF_DISP_E
{
    HI_UNF_DISPLAY0 = 0x0,  /**< DISPLAY0,Compatible with SD */ /**<CNcomment:����DISPLAY0�����ݱ��� */
    HI_UNF_DISPLAY1,	    /**< DISPLAY1 *//**<CNcomment: ����DISPLAY1 */
    HI_UNF_DISPLAY2,	    /**< DISPLAY2 *//**<CNcomment: ����DISPLAY2 */
    HI_UNF_DISPLAY_BUTT
}HI_UNF_DISP_E;

/**max DAC count*/
/**CNcomment:����DAC��Ŀ*/
#define MAX_DAC_NUM ( 6 )

/**define the LCD data format*/
/**CNcomment:����LCD�����ݸ�ʽ*/
typedef enum hiHI_UNF_DISP_INTF_DATA_FMT
{
    HI_UNF_DISP_INTF_DATA_FMT_YUV422   = 0,	    /**<YUV422,data width is 16*//**<CNcomment:YUV422��λ��Ϊ16*/
    HI_UNF_DISP_INTF_DATA_FMT_RGB565   = 0x8,	    /**<RGB565,data width is 16*//**<CNcomment:RGB565��λ��Ϊ16*/
    HI_UNF_DISP_INTF_DATA_FMT_RGB444   = 0xa,	    /**<RGB444,data width is 16*//**<CNcomment:RGB444��λ��Ϊ16*/
    HI_UNF_DISP_INTF_DATA_FMT_RGB666   = 0xb,	    /**<RGB666,data width is 24*//**<CNcomment:RGB666��λ��Ϊ24*/
    HI_UNF_DISP_INTF_DATA_FMT_RGB888   = 0xc,	    /**<RGB888,data widht is 24*//**<CNcomment:RGB888��λ��Ϊ24*/
    HI_UNF_DISP_INTF_DATA_FMT_BUTT
}HI_UNF_DISP_INTF_DATA_FMT_E;

/**define LCD output data width*/
/**CNcomment:����LCD���������λ��*/
typedef enum hiUNF_DISP_INTF_DATA_WIDTH_E
{
    HI_UNF_DISP_INTF_DATA_WIDTH8 = 0,	    /**<8 bits*//**<CNcomment:8λ*/
    HI_UNF_DISP_INTF_DATA_WIDTH16,	    /**<16 bits*//**<CNcomment:16λ*/
    HI_UNF_DISP_INTF_DATA_WIDTH24,	    /**<24 bits*//**<CNcomment:24λ*/
    HI_UNF_DISP_INTF_DATA_WIDTH_BUTT
}HI_UNF_DISP_INTF_DATA_WIDTH_E;

/**define LCD timing */
/**CNcomment:����LCD��ʱ�����*/
typedef struct hiUNF_DISP_TIMING_S
{
    HI_U32			  VFB;		  /**<vertical front blank*//**<CNcomment:��ֱǰ����*/
    HI_U32			  VBB;		  /**<vertical back blank*//**<CNcomment:��ֱ������*/
    HI_U32			  VACT;		  /**<vertical active area*//**<CNcomment:��ֱ��Ч��*/
    HI_U32			  HFB;		  /**<horizonal front blank*//**<CNcomment:ˮƽǰ����*/
    HI_U32			  HBB;		  /**<horizonal back blank*//**<CNcomment:ˮƽ������*/
    HI_U32			  HACT;		  /**<horizonal active area*/ /**<CNcomment:ˮƽ��Ч��*/
    HI_U32			  VPW;		  /**<vertical sync pluse width*//**<CNcomment:��ֱ�������*/
    HI_U32			  HPW;		  /**<horizonal sync pluse width*/ /**<CNcomment:ˮƽ�������*/
    HI_BOOL			  IDV;		  /**< flag of data valid signal is needed flip*//**<CNcomment:��Ч�����ź��Ƿ�ת*/
    HI_BOOL			  IHS;		  /**<flag of horizonal sync pluse is needed flip*//**<CNcomment:ˮƽͬ�������ź��Ƿ�ת*/
    HI_BOOL			  IVS;		  /**<flag of vertical sync pluse is needed flip*//**<CNcomment:��ֱͬ�������ź��Ƿ�ת*/
    HI_BOOL			  ClockReversal;  /**<flag of clock is needed flip*//**<CNcomment:ʱ���Ƿ�ת*/
    HI_UNF_DISP_INTF_DATA_WIDTH_E DataWidth;	  /**<data width*/ /**<CNcomment:����λ��*/
    HI_UNF_DISP_INTF_DATA_FMT_E	  ItfFormat;	  /**<data format.*//**<CNcomment:���ݸ�ʽ.*/

    HI_BOOL DitherEnable;			    /**< flag of is enable Dither*//**<CNcomment:���ݸ�ʽ.*/
    HI_U32  ClkPara0;				    /**<PLL  register SC_VPLL1FREQCTRL0	 value *//**<CNcomment:PLL  SC_VPLL1FREQCTRL0  �Ĵ���*/
    HI_U32  ClkPara1;				    /**<PLL  register SC_VPLL1FREQCTRL1 value*//**<CNcomment:PLL   SC_VPLL1FREQCTRL1�Ĵ���*/

    HI_BOOL bInterlace;				    /**<progressive or interlace*//**<CNcomment:���л��߸���*/
    HI_U32  PixFreq;				    /**<pixel clock*//**<CNcomment:����ʱ��*/
    HI_U32  VertFreq;				    /**<display rate*//**<CNcomment:ˢ����*/
    HI_U32  AspectRatioW;			    /**<width of screen*//**<CNcomment:��Ļ����*/
    HI_U32  AspectRatioH;			    /**<height of screen*//**<CNcomment:��Ļ�߶�*/
    HI_BOOL bUseGamma;				    /**<gamma modulation*//**<CNcomment:٤������*/
    HI_U32  Reserve0;				    /**<reserved byte*//**<CNcomment:����λ*/
    HI_U32  Reserve1;				    /**<reserved byte*//**<CNcomment:����λ*/
} HI_UNF_DISP_TIMING_S;

/**define video and graphics layers */
/**CNcomment:��Ƶ��ͼ�β�*/
typedef enum hiUNF_DISP_LAYER_E
{
    HI_UNF_DISP_LAYER_VIDEO = 0,		   /**<video layer *//**<CNcomment:��Ƶ��*/
    HI_UNF_DISP_LAYER_GFX,		    /**<graphics layer *//**<CNcomment:ͼ�β�*/
    HI_UNF_DISP_LAYER_BUTT
}HI_UNF_DISP_LAYER_E;

/**bt1120 interface ID */
/**CNcomment:bt1120 �ӿ�ID  */
typedef enum hiUNF_DISP_BT1120_E
{
    HI_UNF_DISP_BT1120_0,    /**<BT1120 interface 0 *//**<CNcomment:BT1120�ӿ�0 */
    HI_UNF_DISP_BT1120_BUTT,
}HI_UNF_DISP_BT1120_E;

/**BT656 interface ID */
/**CNcomment:BT656 �ӿ�ID  */
typedef enum hiUNF_DISP_BT656_E
{
    HI_UNF_DISP_BT656_0,    /**<BT656 interface 0 *//**<CNcomment:BT656�ӿ�0 */
    HI_UNF_DISP_BT656_BUTT,
}HI_UNF_DISP_BT656_E;

/**LCD interface ID */
/**CNcomment:LCD �ӿ�ID	 */
typedef enum hiUNF_LCD_E
{
    HI_UNF_DISP_LCD_0,	  /**<LCD interface 0 *//**<CNcomment:LCD�ӿ�0 */
    HI_UNF_DISP_LCD_BUTT,
}HI_UNF_DISP_LCD_E;

/**define the type of interface*/
/**CNcomment:����ӿ�����*/
typedef enum  hiUNF_DISP_INTF_TYPE_E
{
    HI_UNF_DISP_INTF_TYPE_HDMI,	    /**<HDMI interface type *//**<CNcomment:HDMI�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_LCD,	    /**<LCD interface type *//**<CNcomment:LCD�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_BT1120,   /**<bt1120 digital interface type *//**<CNcomment:BT1120���ֽӿ�����*/
    HI_UNF_DISP_INTF_TYPE_BT656,    /**<bt656 digital interface type*//**<CNcomment:BT656���ֽӿ�����*/
    HI_UNF_DISP_INTF_TYPE_YPBPR,    /**<YPBPR interface type*//**<CNcomment:YPBPR�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_RGB,	    /**<RGB interface type*//**<CNcomment:RGB�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_CVBS,	    /**<CVBS interface type*//**<CNcomment:CVBS�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_SVIDEO,   /**<SVIDEO interface type*//**<CNcomment:SVIDEO�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_VGA,	    /**<VGA interface type*//**<CNcomment:VGA�ӿ�����*/
    HI_UNF_DISP_INTF_TYPE_BUTT
}HI_UNF_DISP_INTF_TYPE_E;

/**define the YPBPR type struct of interface*/
/**CNcomment:����YPBPR�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_YPBPR_S
{
    HI_U8 u8DacY;	      /**<DAC num of Y	*//**<CNcomment:Y����dac�˿ں�*/
    HI_U8 u8DacPb;	      /**<DAC num of Pb	 *//**<CNcomment:Pb����dac�˿ں�*/
    HI_U8 u8DacPr;	      /**<DAC num of Pr	 *//**<CNcomment:Pr����dac�˿ں�*/
}HI_UNF_DISP_INTF_YPBPR_S;

/**define the RGB type struct of interface*/
/**CNcomment:����RGB�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_RGB_S
{
    HI_U8  u8DacR;	      /**<DAC num of R	*//**<CNcomment:R����dac�˿ں�*/
    HI_U8  u8DacG;	      /**<DAC num of G	*//**<CNcomment:G����dac�˿ں�*/
    HI_U8  u8DacB;	      /**<DAC num of B	*//**<CNcomment:B����dac�˿ں�*/
    HI_BOOL bDacSync;	      /**<G without sync signal	 *//**<CNcomment:G��������ͬ���ź�*/
}HI_UNF_DISP_INTF_RGB_S;

/**define the VGA type struct of interface*/
/**CNcomment:����VGA�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_VGA_S
{
    HI_U8  u8DacR;	      /**<DAC num of R	*//**<CNcomment:R����dac�˿ں�*/
    HI_U8  u8DacG;	      /**<DAC num of G	*//**<CNcomment:G����dac�˿ں�*/
    HI_U8  u8DacB;	      /**<DAC num of B	*//**<CNcomment:B����dac�˿ں�*/
}HI_UNF_DISP_INTF_VGA_S;

/**define the CVBS type struct of interface*/
/**CNcomment:����CVBS�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_CVBS_S
{
    HI_U8 u8Dac;	      /**<DAC num of CVBS  *//**<CNcomment:CVBS����dac�˿ں�*/
}HI_UNF_DISP_INTF_CVBS_S;

/**define the SVIDEO type struct of interface*/
/**CNcomment:����SVIDEO�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_SVIDEO_S
{
    HI_U8 u8DacY;	      /**<DAC num of Y	*//**<CNcomment:Y����dac�˿ں�*/
    HI_U8 u8DacC;	      /**<DAC num of C	 *//**<CNcomment:C����dac�˿ں�*/
}HI_UNF_DISP_INTF_SVIDEO_S;

/**define display interface struct*/
/**CNcomment:������ʾ�ӿڽṹ*/
typedef struct	hiUNF_DISP_INTF_S
{
    HI_UNF_DISP_INTF_TYPE_E enIntfType;		/**<interface type *//**<CNcomment:�ӿ�����*/
    union
    {
	HI_UNF_HDMI_ID_E	enHdmi;		/**<hdmi id *//**<CNcomment:HDMI ���*/
	HI_UNF_DISP_BT1120_E	enBT1120;	/**<bt1120 id *//**<CNcomment:BT1120���*/
	HI_UNF_DISP_BT656_E	enBT656;	/**<bt656 id *//**<CNcomment:BT656���*/
	HI_UNF_DISP_LCD_E	enLcd;		/**<lcd id *//**<CNcomment:LCD���*/

	HI_UNF_DISP_INTF_YPBPR_S    stYPbPr;	/**<intf config of YPBPR  *//**<CNcomment:YPBPR�ӿ�����*/
	HI_UNF_DISP_INTF_RGB_S	    stRGB;	/**<intf config of RGB	*//**<CNcomment:RGB�ӿ�����*/
	HI_UNF_DISP_INTF_VGA_S	    stVGA;	/**<intf config of VGA	*//**<CNcomment:VGA�ӿ�����*/
	HI_UNF_DISP_INTF_CVBS_S	    stCVBS;	/**<intf config of CVBS	 *//**<CNcomment:CVBS�ӿ�����*/
	HI_UNF_DISP_INTF_SVIDEO_S   stSVideo;	/**<intf config of SVIDEO  *//**<CNcomment:SVIDEO�ӿ�����*/
    }unIntf;
}HI_UNF_DISP_INTF_S;


/**Defines the device aspect ratio.*/
/**CNcomment: �����豸���߱�ö��*/
typedef enum hiUNF_DISP_ASPECT_RATIO_E
{
    HI_UNF_DISP_ASPECT_RATIO_AUTO,		/**<aspect ratio as device Resolution*//**<CNcomment: ���߱����豸�ֱ���һ��*/
    HI_UNF_DISP_ASPECT_RATIO_4TO3,		/**<4:3*//**<CNcomment: 4��3*/
    HI_UNF_DISP_ASPECT_RATIO_16TO9,		/**<16:9*//**<CNcomment: 16��9*/
    HI_UNF_DISP_ASPECT_RATIO_221TO1,		/**<221:100*//**<CNcomment: 221��100*/
    HI_UNF_DISP_ASPECT_RATIO_USER,		/**<user define*//**<CNcomment: �û�����*/

    HI_UNF_DISP_ASPECT_RATIO_BUTT
}HI_UNF_DISP_ASPECT_RATIO_E;

/**Defines the device aspect ratio struct.*/
/**CNcomment: �����豸���߱Ƚṹ*/
typedef struct hiUNF_DISP_ASPECT_RATIO_S
{
    HI_UNF_DISP_ASPECT_RATIO_E enDispAspectRatio;   /**<aspect ratio type of device*//**<CNcomment: �豸���߱�����*/
    HI_U32		       u32UserAspectWidth;  /**<user define width of device*//**<CNcomment: �û������豸����*/
    HI_U32		       u32UserAspectHeight; /**<user define height of device*//**<CNcomment: �û������豸�߶�*/
}HI_UNF_DISP_ASPECT_RATIO_S;

/**Defines algorithmic	control struct of display device.*/
/**CNcomment: ������ʾ�豸�㷨���ƽṹ*/
typedef struct hiUNF_DISP_ALG_CFG_S
{
    HI_BOOL bAccEnable;				    /**<acc alg*//**<CNcomment: acc�㷨*/
    HI_BOOL bSharpEnable;			    /**<sharp alg*//**<CNcomment: sharp�㷨*/
}HI_UNF_DISP_ALG_CFG_S;

/**Defines VBI type.*/
/**CNcomment: ����VBI��������*/
typedef enum hiUNF_DISP_VBI_TYPE_E
{
    HI_UNF_DISP_VBI_TYPE_TTX = 0,		    /**<Teltext type*//**<CNcomment:teltext����*/
    HI_UNF_DISP_VBI_TYPE_CC,			    /**<Closed caption/V-Chip type *//**<CNcomment: ������Ļ/V-Chip����*/
    HI_UNF_DISP_VBI_TYPE_WSS,			    /**<Wide screen signal*//**<CNcomment:��������*/
    HI_UNF_DISP_VBI_TYPE_BUTT
} HI_UNF_DISP_VBI_TYPE_E;

/**Defines VBI config struct.*/
/**CNcomment: ����VBI���ýṹ*/
typedef struct hiUNF_DISP_VBI_CFG_S
{
    HI_UNF_DISP_VBI_TYPE_E  enType;		     /**<VBI type*//**<CNcomment: VBI ����*/
    HI_U32		    u32InBufferSize;	    /**<VBI data(pes) buffer size,more than 4K,suggest 4K*//**<CNcomment:VBI pes �������뻺���С,��С��4K���Ƽ�ֵ4K*/
    HI_U32		    u32WorkBufferSize;	    /**<VBI data buffer size used in driver,more than 2K,suggest 2K*//**<CNcomment:VBI�����������������н��ջ����С��С��2K���Ƽ�ֵ2K*/
} HI_UNF_DISP_VBI_CFG_S;

/** define VBI information structure*/
/**CNcomment: ����VBI��Ϣ���ݽṹ*/
typedef struct hiUNF_DISP_VBI_DATA_S
{
    HI_UNF_DISP_VBI_TYPE_E  enType;		     /**<VBI type*//**<CNcomment: VBI ����*/
    HI_U8		    *pu8DataAddr;	    /**<Vbi data buffer virtual address*//**<CNcomment:Vbi�����û������ַ*/
    HI_U32		    u32DataLen;		    /**<Vbi data lenght*//**<CNcomment:Vbi���ݳ���*/
} HI_UNF_DISP_VBI_DATA_S;

/**Defines the MAX buffer number.*/
/** CNcomment:��������buffer ������*/
#define HI_DISP_CAST_BUFFER_MAX_NUMBER ( 16 )

/**define CAST config */
/**CNcomment:������ĻͶӰ����*/
typedef struct hiUNF_DISP_CAST_ATTR_S
{
    HI_UNF_VIDEO_FORMAT_E enFormat;					   /**<the output video format.*//**<CNcomment:���������Ƶ��ʽ*/
    HI_U32		  u32Width;					  /**<the output video width.*//**<CNcomment:���������Ƶ�Ŀ�*/
    HI_U32		  u32Height;					  /**<the output video height.*//**<CNcomment:���������Ƶ�ĸ�*/
    HI_BOOL		  bLowDelay;					  /**<work at low delay mode.*//**<CNcomment:���õ��ӳ�ģʽ*/
    HI_U32		  u32BufNum;					  /**<the buffer number.*//**<CNcomment:�������buffer ��*/
    HI_BOOL		  bUserAlloc;					  /**<whether is user alloc memory*//**<CNcomment:�����Ƿ��û������ڴ�*/
    HI_U32		  u32BufSize;					  /**<each the buffer size.*//**<CNcomment:�����û�����ÿ��buffer ��С*/
    HI_U32		  u32BufStride;					  /**<the horizonal stride.*//**<CNcomment:�����ж���*/
    HI_U32		  u32BufPhyAddr[HI_DISP_CAST_BUFFER_MAX_NUMBER];  /**<the buffer physics address.*//**<CNcomment:�����ڴ�buffer ��Ա��������ַ*/
    HI_BOOL		  bCrop;					  /**<whether enable crop .*//**<CNcomment:�����Ƿ����crop*/
    HI_UNF_CROP_RECT_S	  stCropRect;					  /**<the crop wise .*//**<CNcomment:����crop ��Χ*/
} HI_UNF_DISP_CAST_ATTR_S;

/**define color setting */
/**CNcomment:����ɫ������*/
typedef struct hiUNF_DISP_COLOR_SETTING_S
{
    HI_BOOL bGammaEnable;	  /**<whether Gamma enable.*//**<CNcomment:����Gamma ʹ��*/
    HI_BOOL bUseCustGammaTable;	  /**<whether use custom GammaTable.*//**<CNcomment:�Ƿ�ʹ���û�Gamma��*/
    HI_BOOL bColorCorrectEnable;  /**<whether Color Correct.*//**<CNcomment:�Ƿ�ɫ��У��*/
    HI_S32  s32ColorTemp;	  /**<color Temp.*//**<CNcomment:ɫ��*/
    HI_U32  u32Reserve;		  /**<Reserve.*//**<CNcomment:����*/
    HI_VOID *pPrivate;		  /**<Private.*//**<CNcomment:˽����ָ��*/
}HI_UNF_DISP_COLOR_SETTING_S;

/**define the struct about color */
/**CNcomment:������ʾ��ɫ�Ľṹ�� */
typedef struct	hiUNF_DISP_BG_COLOR_S
{
    HI_U8 u8Red;		  /**<red *//**<CNcomment:��ɫ����*/
    HI_U8 u8Green;		  /**<green*//**<CNcomment:��ɫ����*/
    HI_U8 u8Blue;		  /**<blue*//**<CNcomment:��ɫ����*/
} HI_UNF_DISP_BG_COLOR_S;

/**define the struct about isogeny attributes */
/**CNcomment:����ͬԴ���� */
typedef struct	hiUNF_DISP_ISOGENY_ATTR_S
{
    HI_UNF_DISP_E	   enDisp; /**<channel id*//**<CNcomment: ͨ����*/
    HI_UNF_ENC_FMT_E	   enFormat;/**<format type*//**<CNcomment:��ʽ����*/
}HI_UNF_DISP_ISOGENY_ATTR_S ;


/********************************ENCODER STRUCT********************************/
/** define the enum of Macrovision output type*/
/** CNcomment:��ʾ���Macrovisionģʽö�ٶ���*/
typedef enum hiUNF_DISP_MACROVISION_MODE_E
{
    HI_UNF_DISP_MACROVISION_MODE_TYPE0,	    /**<type 0 *//**<CNcomment:��������0 */
    HI_UNF_DISP_MACROVISION_MODE_TYPE1,	    /**<type 1 *//**<CNcomment:��������1 */
    HI_UNF_DISP_MACROVISION_MODE_TYPE2,	    /**<type 2 *//**<CNcomment:��������2 */
    HI_UNF_DISP_MACROVISION_MODE_TYPE3,	    /**<type 3 *//**<CNcomment:��������3 */
    HI_UNF_DISP_MACROVISION_MODE_CUSTOM,    /**<type of configure by user *//**<CNcomment:�û��Զ������� */
    HI_UNF_DISP_MACROVISION_MODE_BUTT
} HI_UNF_DISP_MACROVISION_MODE_E;

/** CGMS type select */
/**CNcomment:CGMS ����ѡ��*/
typedef enum hiUNF_DISP_CGMS_TYPE_E
{
    HI_UNF_DISP_CGMS_TYPE_A = 0x00,	/**<CGMS type  A*//**<CNcomment:CGMS ����A*/
    HI_UNF_DISP_CGMS_TYPE_B,		/**<CGMS type  B*//**<CNcomment:CGMS ����B*/

    HI_UNF_DISP_CGMS_TYPE_BUTT
}HI_UNF_DISP_CGMS_TYPE_E;

/** definition of CGMS mode */
/**CNcomment:����CGMS ģʽ*/
typedef enum hiUNF_DISP_CGMS_MODE_E
{
    HI_UNF_DISP_CGMS_MODE_COPY_FREELY  = 0,	/**<copying is permitted without restriction *//**<CNcomment:�����ƿ���*/
    HI_UNF_DISP_CGMS_MODE_COPY_NO_MORE = 0x01,	/**<No more copies are allowed (one generation copy has been made)*//**<CNcomment:����һ�κ������ٱ�����*/
    HI_UNF_DISP_CGMS_MODE_COPY_ONCE    = 0x02,	/**<One generation of copies may be made *//**<CNcomment:����������һ��*/
    HI_UNF_DISP_CGMS_MODE_COPY_NEVER   = 0x03,	/**<No copying is permitted *//**<CNcomment:����������*/

    HI_UNF_DISP_CGMS_MODE_BUTT
}HI_UNF_DISP_CGMS_MODE_E;

/** definition of CGMS configuration */
typedef struct hiUNF_DISP_CGMS_CFG_S
{
    HI_BOOL		    bEnable;		/**<HI_TRUE:CGMS is enabled; HI_FALSE:CGMS is disabled *//**<CNcomment:CGMS ʹ��ѡ��*/
    HI_UNF_DISP_CGMS_TYPE_E enType;		/**<type-A or type-B or None(BUTT) *//**<CNcomment:CGMS ����*/
    HI_UNF_DISP_CGMS_MODE_E enMode;		/**<CGMS mode. *//**<CNcomment:CGMS ģʽ*/
}HI_UNF_DISP_CGMS_CFG_S;

/**define WSS information structure*/
/**CNcomment:����ͼ����Ϣ���ݽṹ */
typedef struct hiUNF_DISP_WSS_DATA_S
{
    HI_BOOL bEnable;				/**<WSS configure enable HI_TRUE: enable,HI_FALSE: disnable*//**<CNcomment:WSS����ʹ�ܡ�HI_TRUE��ʹ�ܣ�HI_FALSE����ֹ*/
    HI_U16  u16Data;				/**<Wss data */ /**<CNcomment:Wss����*/
}HI_UNF_DISP_WSS_DATA_S;


/**define display 3D mode stucture*/
/**CNcomment:������ʾģʽ�ṹ�� */
typedef enum hiUNF_DISP_3D_E
{
    HI_UNF_DISP_3D_NONE = 0,
    HI_UNF_DISP_3D_FRAME_PACKING,		    /**<3d type:Frame Packing*//**<CNcomment:3d ģʽ:֡��װ*/
    HI_UNF_DISP_3D_SIDE_BY_SIDE_HALF,		    /**<3d type:Side by side half*//**<CNcomment:3d ģʽ:����ʽ ���Ұ��*/
    HI_UNF_DISP_3D_TOP_AND_BOTTOM,		    /**<3d type:Top and Bottom*//**<CNcomment:3d ģʽ:����ģʽ*/
    HI_UNF_DISP_3D_FIELD_ALTERNATIVE,		    /**<3d type:Field alternative*//**<CNcomment:3d ģʽ:������*/
    HI_UNF_DISP_3D_LINE_ALTERNATIVE,		    /**<3d type:Field alternative*//**<CNcomment:3d ģʽ:�н���*/
    HI_UNF_DISP_3D_SIDE_BY_SIDE_FULL,		    /**<3d type:Side by side full*//**<CNcomment:3d ģʽ:����ʽ ����ȫ��*/
    HI_UNF_DISP_3D_L_DEPTH,			    /**<3d type:L+depth*//**<CNcomment:3d ģʽ:L+DEPTH*/
    HI_UNF_DISP_3D_L_DEPTH_GRAPHICS_GRAPHICS_DEPTH, /**<3d type:L+depth+Graphics+Graphics-depth*//**<CNcomment:3d ģʽ:L+depth+Graphics+Graphics-depth*/
    HI_UNF_DISP_3D_BUTT
}HI_UNF_DISP_3D_E;

/**define display margin stucture*/
/**CNcomment:������ʾ�հ�����ṹ�� */
typedef struct hiUNF_DISP_OFFSET_S
{
    HI_U32 u32Left;    /**<left offset *//**<CNcomment:���ƫ��*/
    HI_U32 u32Top;     /**<top offset *//**<CNcomment:�Ϸ�ƫ��*/
    HI_U32 u32Right;   /**<right offset *//**<CNcomment:�Ҳ�ƫ��*/
    HI_U32 u32Bottom;  /**<bottom offset *//**<CNcomment:�·�ƫ��*/
}HI_UNF_DISP_OFFSET_S;

typedef enum hiUNF_DISP_HDR_TYPE_E
{
    HI_UNF_DISP_HDR_TYPE_NONE = 0,	/* ��ͨ�ź���ʾBT601 BT709 */
    HI_UNF_DISP_HDR_TYPE_DOLBY,		/* DolbyVision�ź���ʾ */
    HI_UNF_DISP_HDR_TYPE_HDR10,		/* ��׼HDR�ź���ʾ */
    HI_UNF_DISP_HDR_TYPE_BUTT
} HI_UNF_DISP_HDR_TYPE_E;


/** @} */  /** <!-- ==== Structure Definition end ==== */

/******************************* API declaration *****************************/
/** \addtogroup	     DISPLAY */
/** @{ */  /** <!-- [DISPLAY] */


/**
   \brief Initiallization DISP module.CNcomment:��ʼ��DISPģ�� CNend
   \attention \n
   Please call this API function, before call anyother API of DISP module.
   CNcomment:����DISPģ�������ӿ�ǰҪ�����ȵ��ñ��ӿ� CNend
   \param  none.CNcomment:�� CNend
   \retval ::HI_SUCCESS	 operation success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_DEV_NOT_EXIST DISP device not exist.CNcomment:�豸������ CNend
   \retval ::HI_ERR_DISP_NOT_DEV_FILE  DISP  not device file .CNcomment:���豸 CNend
   \retval ::HI_ERR_DISP_DEV_OPEN_ERR  DISP  open fail.CNcomment:��ʧ�� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Init( HI_VOID );


/**
   \brief deinital.CNcomment:ȥ��ʼ��DISPģ�� CNend
   \attention \n
   please call API HI_UNF_DISP_Close and open all the DISP device, before call this API.
   CNcomment:�ڵ���::HI_UNF_DISP_Close�ӿڹر����д򿪵�DISP����ñ��ӿ� CNend
   \param none.CNcomment:�� CNend
   \retval ::HI_SUCCESS success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_DEV_CLOSE_ERR	DISP close fail.CNcomment:�ر�ʧ�� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_DeInit( HI_VOID );


/**
   \brief Attach one DISP channel to anoter.CNcomment:������DISPͨ���� CNend
   \attention \n
   Please finish the attach operation before the DISP channel has been open, and currently we only support HD channel attach to SD channel.
   CNcomment:Ŀǰ֧�ֽ�����DISP�󶨵�����DISPͨ���ϣ����ڴ�DISPͨ��ǰ������ɰ󶨲����� CNend
   \param[in] enDstDisp	  Destination DISP channel.CNcomment:Ŀ��DISPͨ���� CNend
   \param[in] enSrcDisp	  source DISP channel.CNcomment:  ԴDISPͨ���� CNend
   \retval ::HI_SUCCESS	 operation success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT  display not be initialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA  invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT   invalid opeation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Attach( HI_UNF_DISP_E enDstDisp, HI_UNF_DISP_E enSrcDisp );


/**
   \brief dettach DISP.CNcomment:������DISPͨ����� CNend
   \attention \n
   should  close the DISP channels, before do detach operation.
   CNcomment:ֻ���ڹر�����DISPͨ������ܽ��н�󶨲����� CNend
   \param[in] enDstDisp	  Destination DISP channel.CNcomment:Ŀ��DISPͨ���� CNend
   \param[in] enSrcDisp	   source DISP channel.CNcomment: ԴDISPͨ���� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT   DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA  invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT   invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Detach( HI_UNF_DISP_E enDstDisp, HI_UNF_DISP_E enSrcDisp );


/**
   \brief open DISP channel.CNcomment:��ָ��DISPͨ�� CNend
   \attention \n
   Please config the valid parameters before open DISP.
   CNcomment:�ڴ�DISP֮ǰ������ɶ���Ĳ������ã����⻭����˸ CNend
   \param[in] enDisp   DISP channel ID, please reference the define of HI_UNF_DISP_E.CNcomment:DISPͨ���ţ���μ�::HI_UNF_DISP_E CNend
   \retval ::HI_SUCCESS success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT   DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA  invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_CREATE_ERR    DISP create fail.CNcomment:DISP����ʧ�� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Open( HI_UNF_DISP_E enDisp );


/**
   \brief  coase DISP channel.CNcomment:�ر�ָ��DISP CNend
   \attention \n
   none.
   CNcomment:�� CNend
   \param[in] enDisp DISP channel ID.CNcomment:DISPͨ���� CNend
   \retval ::HI_SUCCESS success. CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Close( HI_UNF_DISP_E enDisp );


/**
   \brief  set DISP interface parameter.CNcomment:����DISP�Ľӿڲ��� CNend
   \attention \n
   The API is uesed for set  interface attach .If the interface has been attached,must be detach it ,or return HI_ERR_DISP_INVALID_OPT;\n
   There are 4 DAC provided by SOC 3712 v300. suggest, DAC 0/1/2 used by HD channel, DAC3 used by SD channel CVBS. \n
   There are 6 DAC provided by SOC 3716 v100/v200/v300. suggest, DAC 0/1/2 used by HD channel, DAC3/4/5 used by SD channel.
   CNcomment:��API ������������ӿڵİ󶨹�ϵ����������ѱ��󶨹��Ľӿڣ�����Ҫ�Ƚ���Detach����\n
   ����󶨹�ϵ�����򷵻ش���HI_ERR_DISP_INVALID_OPT;\n
   3712 v300 оƬ����4��DAC���Ƽ�0��1��2�������������3��������CVBS�����\n
   3716 v100/v200/v300 оƬ����6��DAC���Ƽ�0��1��2�������������3��4��5�������������CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32IntfNum  DISP intf num of DISP channel.CNcomment:DISPͨ���ϵĽӿ���Ŀ CNend
   \param[in] pstIntf  DISP intf para.CNcomment:DISP�ӿڲ��� CNend
   \retval ::HI_SUCCESS	  success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT   DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR      Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA  invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT   invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_AttachIntf( HI_UNF_DISP_E enDisp, HI_UNF_DISP_INTF_S *pstIntf, HI_U32 u32IntfNum );


/**
   \brief cancel DISP interface parameter.CNcomment:ȡ��DISP�Ľӿڲ��� CNend
   \attention \n
   The API is uesed to	detach	interface.
   CNcomment:���API ��������ӿڵİ󶨹�ϵ�� CNend
   \param[in] enDisp	    DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32IntfNum  DISP interface number of DISP channel.CNcomment:DISPͨ���ϵĽӿ���Ŀ CNend
   \param[in] pstIntf  DISP interface para.CNcomment:DISP�ӿڲ��� CNend
   \retval ::HI_SUCCESS	  success. CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT   DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	 Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA  invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT   invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_DetachIntf( HI_UNF_DISP_E enDisp, HI_UNF_DISP_INTF_S *pstIntf, HI_U32 u32IntfNum );


/**
   \brief set DISP output format.CNcomment:����DISP����ʽ CNend
   \attention \n
   for HD DISP channel please set HD display format, and for SD DISP channel please set SD display format.\n
   for scenario of HD,SD use same source, only support format which frame rate is 50Hz or 60Hz.
   CNcomment:�Ը����DISP��ֻ�����ø������ʽ���Ա����DISP��ֻ�����ñ������ʽ��\n
   ��ͬԴ��ʾ�����£��ݲ�֧��ˢ���ʷ�50Hz/60Hz����ʽ���磺�ݲ�֧��1080P24/1080P25/1080P30 CNend
   \param[in] enDisp		   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] enEncodingFormat	  DISP format.CNcomment:DISP����ʽ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetFormat( HI_UNF_DISP_E enDisp, HI_UNF_ENC_FMT_E enEncodingFormat );


/**
   \brief get DISP format.CNcomment:��ȡDISP����ʽ CNend
   \attention \n
   none.CNcomment:�� CNend
   \param[in] enDisp		   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] penEncodingFormat	   poiner of DISP format.DCNcomment:ISP����ʽָ�� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetFormat( HI_UNF_DISP_E enDisp, HI_UNF_ENC_FMT_E *penEncodingFormat );


/**
   \brief set user define LCD clock parameter.CNcomment:�����û������LCDʱ����� CNend
   \attention \n
   only 3716 v100 v200 is  supported LCD.
   CNcomment:ֻ��3716 v100 v200 ֧��LCD CNend
   \param[in] enDisp		   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstTiming	   poiner of DISP format.CNcomment:LCDʱ����� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetCustomTiming( HI_UNF_DISP_E enDisp, HI_UNF_DISP_TIMING_S *pstTiming );


/**
   \brief  get LCD parameter which had been config.CNcomment:��ȡDISP��LCD���� CNend
   \attention \n
   only 3716 v100 v200 is  supported LCD.
   CNcomment:ֻ��3716 v100 v200 ֧��LCD CNend
   \param[in] enDisp	      DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstTiming	     pointer of LCD paramter.CNcomment:ָ�����ͣ�LCD���� CNend
   \retval ::HI_SUCCESS success.CNcomment: �ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetCustomTiming( HI_UNF_DISP_E enDisp, HI_UNF_DISP_TIMING_S *pstTiming );


/**
   \brief   set DISP layers Z order.CNcomment:����DISP�ϵ��Ӳ��Z�� CNend
   \attention \n
   only 3716 v100 v200 is  supported LCD.
   CNcomment:ֻ��3716 v100 v200 ֧��LCD CNend
   \param[in] enDisp	      DISP channel ID.CNcomment: DISPͨ���� CNend
   \param[in] enLayer	     layer ID which needed overlay to the DISP channel.CNcomment: DISP�ϵĵ��Ӳ� CNend
   \param[in] enZFlag	     the way of overlay.CNcomment:Z����ڷ�ʽ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetLayerZorder( HI_UNF_DISP_E enDisp, HI_UNF_DISP_LAYER_E enLayer, HI_LAYER_ZORDER_E enZFlag );


/**
   \brief  get DISP overlay z order.CNcomment:��ȡDISP�ϵ��Ӳ��Z�� CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.
   CNcomment:�ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp		DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] enLayer		CNcomment:DISP�ϵĵ��Ӳ� CNend
   \param[in] pu32Zorder	CNcomment:���Ӳ�Z����ֵ����ֵԽ�����ȼ�Խ�� CNend
   \retval ::HI_SUCCESS success.CNcomment: �ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation.CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetLayerZorder( HI_UNF_DISP_E enDisp, HI_UNF_DISP_LAYER_E enLayer, HI_U32 *pu32Zorder );


/**
   \brief set DISP back ground color.CNcomment:����DISP����ɫ CNend
   \attention \n
   none.
   CNcomment:�� CNend
   \param[in] enDisp	   CNcomment:DISPͨ���� CNend
   \param[in] pstBgColor   CNcomment:ָ�����ͣ������õ���ʾ�������ɫ����μ�::HI_UNF_BG_COLOR_S CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetBgColor( HI_UNF_DISP_E enDisp, const HI_UNF_DISP_BG_COLOR_S *pstBgColor );


/**
   \brief  set DISP back ground color.CNcomment:��ȡDISP����ɫ CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.
   CNcomment:�ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp	      DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pstBgColor   pointer of back ground color.CNcomment: ָ�����ͣ���ʾ�������ɫ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetBgColor( HI_UNF_DISP_E enDisp, HI_UNF_DISP_BG_COLOR_S *pstBgColor );


/**
   \brief  set DISP brightness.CNcomment:����DISP���� CNend
   \attention \n
   if the value seted more than 100, we clip it to 100.CNcomment:����100��ֵ��100���� CNend
   \param[in] enDisp		DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32Brightness   brightness value. the range is 0~100, 0 means the min brightness value.
   CNcomment:�����õ���ʾ�������ֵ��ȡֵ��ΧΪ0��100��0����С���ȣ�100��������� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetBrightness( HI_UNF_DISP_E enDisp, HI_U32 u32Brightness );


/**
   \brief   get the DISP brightness.CNcomment:��ȡDISP���� CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.
   CNcomment:��ѯ��Ĭ������ֵΪ50��\n
   �ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp		  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pu32Brightness	 pointer of brightness. CNcomment:ָ�����ͣ���ʾ�������ֵ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetBrightness( HI_UNF_DISP_E enDisp, HI_U32 *pu32Brightness );


/**
   \brief  set DISP contrast value.CNcomment:����DISP�Աȶ� CNend
   \attention \n
   If the value is more than 100, we clip it to 100.
   CNcomment:����100��ֵ��100���� CNend
   \param[in] enDisp	      DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32Contrast    contrast value. the range is 0~100, 0 means the min contrast value. \n
   CNcomment:�����õ���ʾ����Աȶ�ֵ��ȡֵ��ΧΪ0��100��0����С�Աȶȣ�100�����Աȶ� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetContrast( HI_UNF_DISP_E enDisp, HI_U32 u32Contrast );


/**
   \brief  get DISP contrast value.CNcomment:��ȡDISP�Աȶ� CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.\n
   CNcomment:��ѯ��Ĭ�϶Աȶ�ֵΪ50��\n
   �ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp	       DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pu32Contrast   pointer of contrast. CNcomment:ָ�����ͣ���ʾ����Աȶ�ֵ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetContrast( HI_UNF_DISP_E enDisp, HI_U32 *pu32Contrast );


/**
   \brief   set DISP saturation.CNcomment:����DISP���Ͷ� CNend
   \attention \n
   If the value is more than 100, we clip it to 100.
   CNcomment:����100��ֵ��100���� CNend
   \param[in] enDisp		 DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32Saturation	 saturation value. the range is 0~100, 0 means the min saturation value. \n
   CNcomment:�����õ���ʾ������Ͷ�ֵ��ȡֵ��ΧΪ0��100��0����С���Ͷȣ�100����󱥺Ͷ� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
*/
HI_S32 HI_UNF_DISP_SetSaturation( HI_UNF_DISP_E enDisp, HI_U32 u32Saturation );


/**
   \brief   get DISP saturation.CNcomment:��ȡDISP���Ͷ� CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.\n
   CNcomment:��ѯ��Ĭ�ϱ��Ͷ�ֵΪ50��\n
   �ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp		     DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pu32Saturation	 pointer of saturation. CNcomment:ָ�����ͣ���ʾ������Ͷ�ֵ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetSaturation( HI_UNF_DISP_E enDisp, HI_U32 *pu32Saturation );


/**
   \brief  set DISP hueplus.CNcomment:����DISPɫ�� CNend
   \attention \n
   none.CNcomment:�� CNend
   \param[in] enDisp		  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32HuePlus       hueplus value. the range is 0~100, 0 means the min hueplus value. \n
   CNcomment:��ʾ���ɫ������ֵ����ΧΪ0��100��0����ʾ��Сɫ�����棻100����ʾ���ɫ������ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetHuePlus( HI_UNF_DISP_E enDisp, HI_U32 u32HuePlus );


/**
   \brief get DISP hueplus.CNcomment:��ȡDISPɫ�� CNend
   \attention \n
   In the case of HD atach to SD. the Z order configuration of HD will auto sync to SD, also the configuration of SD will auto sync to HD.\n
   CNcomment:��ѯ��Ĭ��ɫ��ֵΪ50��\n
   �ڸ߱��������£�����DISP�����û��Զ�ͬ��������DISP������DISP�����û��Զ�ͬ��������DISP�� CNend
   \param[in] enDisp	      DISP channel ID.CNcomment: DISPͨ���� CNend
   \param[out] pu32HuePlus     pointer of hueplus. CNcomment:ָ�����ͣ���ʾ���ɫ������ֵ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetHuePlus( HI_UNF_DISP_E enDisp, HI_U32 *pu32HuePlus );


/**
   \brief  set Wss.CNcomment:ֱ������WSS��Wide Screen Singnalling������ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	       DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstWssData	pointer of Wss data description structure.CNcomment:ָ�����ͣ�ָ��WSS���ݵ�ָ�� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetWss( HI_UNF_DISP_E enDisp, const HI_UNF_DISP_WSS_DATA_S *pstWssData );


/**
   \brief  set Macrovision mode.CNcomment:����Macrovisionģʽ CNend
   \attention \n
   none.CNcomment:�� CNend
   \param[in] enDisp	      DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] enMode	    Macrovision mode.  CNcomment:Macrovisionģʽ����μ�::HI_UNF_MACROVISION_MODE_E CNend
   \param[in] pData	     pointer of Macrovision control data CNcomment: ָ�����ͣ��Զ����Macrovision�������� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetMacrovision( HI_UNF_DISP_E enDisp, HI_UNF_DISP_MACROVISION_MODE_E enMode, const HI_VOID *pData );


/**
   \brief get Macrovision mode.CNcomment: ��ȡMacrovisionģʽ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] penMode	  pointer of Macrovision mode. CNcomment:ָ�����ͣ�MACROVISIONģʽ CNend
   \param[out] pData	  a data pointer only valid whenpenMode=HI_MACROVISION_MODE_CUSTOM.\n
   CNcomment:ָ�����ͣ�����penMode=HI_MACROVISION_MODE_CUSTOMʱ��Ч CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetMacrovision( HI_UNF_DISP_E enDisp, HI_UNF_DISP_MACROVISION_MODE_E *penMode, const HI_VOID *pData );


/**
   \brief   set CGMS data.CNcomment:����CGMS��Copy Generation Management System������ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp		       DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstCgmsCfg	     pointer of CGMS configuration  CNcomment:ָ�����ͣ�ָ��CGMS�������ݵ�ָ�� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetCgms( HI_UNF_DISP_E enDisp, const HI_UNF_DISP_CGMS_CFG_S *pstCgmsCfg );


/**
   \brief chip do or not support Macrovision.CNcomment: ��ȡоƬ�Ƿ�֧��Macrovision CNend
   \attention \n
   none.CNcomment:�� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pbSupport    pointer of Macrovision flag. CNcomment:ָ�����ͣ�Macrovision ��־ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetMacrovisionSupport( HI_UNF_DISP_E enDisp, HI_BOOL *pbSupport );

/**
   \brief set aspect ratio attribute of display device.CNcomment: �����豸���߱� CNend
   \attention \n
   If set AspectRatio USER mode ,must be set u32UserAspectWidth and u32UserAspectHeight \n
   (theWidth/Height range is 1/64~64,if set zero means using current screen AspectRatio.) \n
   If not AspectRatio USER mode ,it will be set value by enumeration means;In this mode u32UserAspectWidth and u32UserAspectHeight are invalid ;\n
   If set AspectRatio AUTO mode , use current screen AspectRatio;
   CNcomment:�������USERģʽ��������u32UserAspectWidth ��u32UserAspectHeight��ֵ��\n
   ��ֵ��ΧΪ���߱�ֵ1/64~64,�������0���ʾʹ�õ�ǰ��Ļ�Ŀ��߱ȣ�\n
   ��USERģʽ���ն�Ӧ�ı�ֵ��Чu32UserAspectWidth ��u32UserAspectHeight��ֵ��Ч\n
   ��������AUTOģʽ���豸���߱�ֵ�Զ�����Ϊ��ǰ��Ļ�Ŀ��߱ȡ� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstDispAspectRatio    pointer of aspect ratio attribute of display device . CNcomment:ָ�����ͣ���ʾ�豸���߱���Ϣ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetAspectRatio( HI_UNF_DISP_E enDisp, HI_UNF_DISP_ASPECT_RATIO_S *pstDispAspectRatio );


/**
   \brief get aspect ratio attribute of display device.CNcomment: ����豸���߱����� CNend
   \attention \n
   none.
   CNcomment:�� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pstDispAspectRatio    pointer of aspect ratio attribute of display device . CNcomment:ָ�����ͣ���ʾ�豸���߱���Ϣ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetAspectRatio( HI_UNF_DISP_E enDisp, HI_UNF_DISP_ASPECT_RATIO_S *pstDispAspectRatio );


/**
   \brief set algorithmic attribute of display device.CNcomment: �����豸�㷨���� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstAlg	pointer of algorithmic attribute of display device . CNcomment:ָ�����ͣ���ʾ�豸�㷨���� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetAlgCfg( HI_UNF_DISP_E enDisp, HI_UNF_DISP_ALG_CFG_S *pstAlg );


/**
   \brief get algorithmic status of display device.CNcomment: ��ȡ�豸�㷨���� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pstAlg	 pointer of algorithmic attribute of display device . CNcomment:ָ�����ͣ���ʾ�豸�㷨���� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetAlgCfg( HI_UNF_DISP_E enDisp, HI_UNF_DISP_ALG_CFG_S *pstAlg );


/**
   \brief create VBI data channel.CNcomment: ����VBI����ͨ�� CNend
   \attention \n
   Each VBI type can not  created  repeatedly,if created more than one time,it will be return HI_ERR_DISP_CREATE_ERR;
   CNcomment:ÿ��VBI����ֻ�ܴ���һ�Σ���δ����򷵻�HI_ERR_DISP_CREATE_ERR CNend
   \param[in] enDisp	  DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstCfg	pointer of parameter of VBI channel . CNcomment:ָ�����ͣ�VBIͨ������ CNend
   \param[out] phVbi	pointer of VBI handle . CNcomment:ָ�����ͣ�VBIͨ����� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \retval ::HI_ERR_DISP_CREATE_ERR    invalid operation. CNcomment:����ʧ�� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_CreateVBI( HI_UNF_DISP_E enDisp, HI_UNF_DISP_VBI_CFG_S *pstCfg, HI_HANDLE *phVbi );


/**
   \brief destroy VBI data channel.CNcomment: ����VBI����ͨ�� CNend
   \attention \n
   none.
   CNcomment:�� CNend
   \param[in] hVbi	VBI handle ID.CNcomment:VBI ͨ����� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_DestroyVBI( HI_HANDLE hVbi );


/**
   \brief send data to vbi channel.CNcomment: �������ݵ�VBIͨ�� CNend
   \attention \n
   After  call HI_UNF_DISP_CreateVBI creat VBI handle sucess,you can call API HI_UNF_DISP_SendVBIData send VBI data .
   CNcomment:����HI_UNF_DISP_CreateVBI ����VBIͨ���ɹ��󣬲��ܵ���HI_UNF_DISP_SendVBIData  �������� CNend
   \param[in] hVbi	VBI handle ID.CNcomment:VBI ͨ·��� CNend
   \param[in] pstVbiData      pointer of VBI data.CNcomment:VBI����ָ�� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SendVBIData( HI_HANDLE hVbi, HI_UNF_DISP_VBI_DATA_S *pstVbiData );

/**
   \brief Get default attributes of screen share channel.CNcomment: ��ȡ��ĻͶӰͨ����Ĭ������ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[out]pstAttr	  pointer of parameter .CNcomment:ָ��,���ò��� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetDefaultCastAttr(HI_UNF_DISP_E enDisp,HI_UNF_DISP_CAST_ATTR_S *pstAttr);


/**
   \brief create screen share channel.CNcomment: ������ĻͶӰͨ�� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[in] pstAttr	   pointer of parameter .CNcomment:ָ��,���ò��� CNend
   \param[out] phCast	   handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_CreateCast( HI_UNF_DISP_E enDisp, HI_UNF_DISP_CAST_ATTR_S * pstAttr, HI_HANDLE *phCast );


/**
   \brief destroy screen share channel.CNcomment: ������ĻͶӰͨ�� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] phCast	  handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_DestroyCast( HI_HANDLE hCast );


/**
   \brief enable screen share.CNcomment: ʹ����ĻͶӰ���� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] phCast	  handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \param[in] bEnable	   enable screen share .CNcomment:ʹ����ĻͶӰ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetCastEnable( HI_HANDLE hCast, HI_BOOL bEnable );


/**
   \brief get enable flag of screen share.CNcomment: ��ȡ��ĻͶӰ�Ƿ�ʹ�� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] phCast	  handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \param[out] bEnable	   flag .CNcomment:��־ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetCastEnable( HI_HANDLE hCast, HI_BOOL *pbEnable );


/**
   \brief get frame info of screen share.CNcomment: ��ȡ��ĻͶӰ֡��Ϣ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] hCast	 handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \param[out] pstFrameInfo	   frame info.CNcomment:֡��Ϣ CNend
   \param[in] u32TimeoutMs wait time in ms.CNcomment:�ȴ�ʱ�䣬����Ϊ��λ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_AcquireCastFrame(HI_HANDLE hCast, HI_UNF_VIDEO_FRAME_INFO_S *pstFrameInfo, HI_U32 u32TimeoutMs);


/**
   \brief release frame info of screen share.CNcomment: �ͷ���ĻͶӰ֡��Ϣ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] hCast	 handle of screen share .CNcomment:��ĻͶӰ��� CNend
   \param[in] pstFrameInfo     frame info.CNcomment:֡��Ϣ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_ReleaseCastFrame( HI_HANDLE hCast, HI_UNF_VIDEO_FRAME_INFO_S *pstFrameInfo );


/**
   \brief professional color modulation.CNcomment: רҵɫ�ʵ��� CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[in] pstCS	 struct of color modulation.CNcomment:ɫ�ʵ��ڽṹ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetColor( HI_UNF_DISP_E enDisp, HI_UNF_DISP_COLOR_SETTING_S *pstCS );


/**
   \brief get color modulation parameter.CNcomment: ��ȡɫ�ʵ�����Ϣ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[in] pstCS	 struct of color modulation.CNcomment:ɫ�ʵ��ڽṹ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetColor( HI_UNF_DISP_E enDisp, HI_UNF_DISP_COLOR_SETTING_S *pstCS );


/**
   \Snapshot truncation screen connection, intercepts the screen complete picture;CNcomment:��ȡ��Ļ��������; CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[in] pstFrameInfo     frame info.CNcomment:֡��Ϣ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_AcquireSnapshot(HI_UNF_DISP_E enDisp, HI_UNF_VIDEO_FRAME_INFO_S * pstFrameInfo);

/**
   \Release Snapshot picture;CNcomment:�ͷŽ�������; CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \param[in] pstFrameInfo     frame info.CNcomment:֡��Ϣ CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_ReleaseSnapshot(HI_UNF_DISP_E enDisp, HI_UNF_VIDEO_FRAME_INFO_S * pstFrameInfo);


/**
   \brief get color modulation parameter.CNcomment:����DISP��Ĭ������ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	  display channel.CNcomment:��ʾͨ· CNend
   \retval ::HI_SUCCESS CNcomment: success.�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_NULL_PTR	   Input pointer is NULL.CNcomment:����ָ��Ϊ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \retval ::HI_ERR_DISP_INVALID_OPT	invalid operation. CNcomment:�����Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetDefaultPara( HI_UNF_DISP_E enDisp);


/**
   \brief set DISP 3D format.CNcomment:����DISP��3D��ʽ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	       DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] en3D	       DISP 3D mode.CNcomment:DISP 3Dģʽ CNend
   \param[in] enEncodingFormat DISP format.CNcomment:DISP����ʽ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Set3DMode(HI_UNF_DISP_E enDisp, HI_UNF_DISP_3D_E en3D, HI_UNF_ENC_FMT_E enEncFormat);

/**
   \brief get DISP 3D format.CNcomment:��ѯDISP��3D��ʽ CNend
   \attention \n
   none. CNcomment:�� CNend
   \param[in] enDisp	       DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pen3D	       DISP 3D mode.CNcomment:DISP 3Dģʽ CNend
   \param[out] penEncFormat    DISP format.CNcomment:DISP����ʽ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_Get3DMode(HI_UNF_DISP_E enDisp, HI_UNF_DISP_3D_E *pen3D, HI_UNF_ENC_FMT_E *penEncFormat);

/**
   \brief set right eye first for 3D output.CNcomment:����3D����������� CNend
   \attention \n
   Only take effect in 3D output mode. CNcomment: ����3D���ʱ��Ч CNend
   \param[in] enDisp	 DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] bEnable	Right-Eye-First.CNcomment:�������� CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetRightEyeFirst(HI_UNF_DISP_E enDisp, HI_BOOL bEnable);

/**
   \brief set virtual screen size of display.CNcomment:������ʾͨ����������Ļ��С CNend
   \attention \n
   if not set ,default value is 1280*720. CNcomment: ��������ô˺�����Ĭ�ϵ�������Ļ��С��720p. CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] u32Width	virtual screen width, the range is [480, 3840].CNcomment:������Ļ���ȣ�ȡֵ��ΧΪ[480, 3840]. CNend
   \param[in] u32Height	 virtual screen height, the range is [480, 3840].CNcomment:������Ļ�߶ȣ�ȡֵ��ΧΪ[480, 3840]. CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetVirtualScreen(HI_UNF_DISP_E enDisp, HI_U32 u32Width, HI_U32 u32Height);

/**
   \brief get virtual screen size of display.CNcomment:��ȡ��ʾͨ����������Ļ��С CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] u32Width	 virtual screen width, the range is [480, 3840].CNcomment:������Ļ���ȣ�ȡֵ��ΧΪ[480, 3840]. CNend
   \param[out] u32Height  virtual screen height, the range is [480, 3840].CNcomment:������Ļ�߶ȣ�ȡֵ��ΧΪ[480, 3840]. CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetVirtualScreen(HI_UNF_DISP_E enDisp, HI_U32 *u32Width, HI_U32 *u32Height);


/**
   \brief set offset of display area in real screen.CNcomment:������ʾ������ʵ����Ļ�ϵ�ƫ����,Ϊ�������ص� CNend
   \attention \n
   must be 4 pixels aligned,if not set, the default value is 0. CNcomment: offset ֵ������4����,���������Ĭ�ϵ�ֵΪ0. CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pstOffset	 offset in pixel, the range is [0, 200].CNcomment:ƫ��������Ŀ��ȡֵ��ΧΪ[0, 200]. CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetScreenOffset(HI_UNF_DISP_E enDisp, HI_UNF_DISP_OFFSET_S *pstOffset);

/**
   \brief get offset of display area in real screen.CNcomment:��ȡ��ʾ������ʵ����Ļ�ϵ�ƫ����,Ϊ�������ص� CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[out] pstOffset  offset in pixel, the range is [0, 200].CNcomment:ƫ��������Ŀ��ȡֵ��ΧΪ[0, 200]. CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetScreenOffset(HI_UNF_DISP_E enDisp, HI_UNF_DISP_OFFSET_S *pstOffset);

/**
   \brief set isogeny attributes.CNcomment: ����ͬԴ���� CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] pstIsogeny isogenous attributes.CNcomment:ͬԴģʽ�£�Ҫ���õ�������Ϣ CNend
   \param[in] u32ChannelNum  channel counts to be set in isogenous mode.CNcomment:ͬԴģʽ�£�Ҫ�������Ե�ͨ������ CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetIsogenyAttr(const HI_UNF_DISP_ISOGENY_ATTR_S *pstIsogeny, const HI_U32 u32ChannelNum);

/**
   \brief set display output type.CNcomment: ������ʾ������� CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] enHDRType	  DISP type.CNcomment:DISP����CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetHDRType(HI_UNF_DISP_E enDisp, const HI_UNF_DISP_HDR_TYPE_E enHDRType);

/**
   \brief Get display output type.CNcomment: ��ȡ��ʾ������� CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] penHDRType   DISP type.CNcomment:DISP����CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetHDRType(HI_UNF_DISP_E enDisp, HI_UNF_DISP_HDR_TYPE_E *penHDRType);

/**
   \brief set display output type.CNcomment: ������ʾ����Ƿ�֧��BT2020 CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] bEnable	BT2020	support.CNcomment:DISP����CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_SetBT2020Enable(HI_UNF_DISP_E enDisp, HI_BOOL bEnable);

/**
   \brief Get display output type.CNcomment: ��ȡ��ʾ����Ƿ�֧��BT2020 CNend
   \attention \n
   none. CNcomment: �� CNend
   \param[in] enDisp   DISP channel ID.CNcomment:DISPͨ���� CNend
   \param[in] pbEnable	 BT2020	 support.CNcomment:DISP����CNend
   \retval ::HI_SUCCESS	 success.CNcomment:�ɹ� CNend
   \retval ::HI_ERR_DISP_NO_INIT    DISP uninitialization.CNcomment:DISPδ��ʼ�� CNend
   \retval ::HI_ERR_DISP_INVALID_PARA	invalid input parameter.CNcomment:��������Ƿ� CNend
   \see \n
   none.CNcomment:�� CNend
 */
HI_S32 HI_UNF_DISP_GetBT2020Enable(HI_UNF_DISP_E enDisp, HI_BOOL *pbEnable);


/** @} */  /** <!-- ==== API declaration end ==== */
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
#endif
/************************************** The End Of File **************************************/
