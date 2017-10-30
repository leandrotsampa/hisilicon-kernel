/******************************************************************************

  Copyright (C), 2012-2014, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_video_codec.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2012/07/31
  Description	: Common definitions of HI_CODEC(video).
		  The codec wants to register to HI_CODEC need to adapt to HI_CODEC_S.
  History	:
  1.Date	: 2012/07/31
    Author	: l00185424
    Modification: Created file

*******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_VIDEO_CODEC_H__
#define __HI_VIDEO_CODEC_H__

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

#include "hi_type.h"

/*************************** Structure Definition ****************************/
/** \addtogroup	 VCODEC	 */
/** @{ */  /** <!--[VCODEC]  */

/*Codec error defination */
/**Operate fail due to insufficient resources(eg. no enough memory) */
/**CNcomment: ��Դ���㣬(��)����ʧ��*/
#define HI_ERR_CODEC_NOENOUGHRES    (HI_S32)(0x80510001)
/**Parameter invalid */
/**CNcomment: ������Ч*/
#define HI_ERR_CODEC_INVALIDPARAM   (HI_S32)(0x80510002)
/**The (en)decoding fails due to incorrect input(streams or frames) */
/**CNcomment: ������������(��)�������*/
#define HI_ERR_CODEC_INPUTCORRUPT   (HI_S32)(0x80510003)
/**The (en)decoding ends due to insufficient input data(streams or frames) */
/**CNcomment: �������ݲ��㣬(��)�������*/
#define HI_ERR_CODEC_NOENOUGHDATA   (HI_S32)(0x80510004)
/**The (en)decoding mode is not supported */
/**CNcomment: ��֧�ֵ�(��)��������*/
#define HI_ERR_CODEC_INVALIDMODE    (HI_S32)(0x80510005)
/**Operate fail */
/**CNcomment: ����ʧ��*/
#define HI_ERR_CODEC_OPERATEFAIL    (HI_S32)(0x80510006)
/**Version unmatch*/
/**CNcomment: �汾��ƥ��*/
#define HI_ERR_CODEC_VERSIONUNMATCH (HI_S32)(0x80510007)
/**Unsupport operation */
/**CNcomment: ��֧�ֵĲ���*/
#define HI_ERR_CODEC_UNSUPPORT	    (HI_S32)(0x80510008)
/**Decorder busy */
/**CNcomment: ������æ*/
#define HI_ERR_CODEC_BUSY	    (HI_S32)(0x80510009)
/**Unknown error */
/**CNcomment: δ֪����*/
#define HI_ERR_CODEC_UNKNOWN	    (HI_S32)(0x80510010)

/**Codec ID */
/**CNcomment: Э������ */
typedef enum hiCODEC_ID_E
{
    HI_CODEC_ID_NONE = 0,

    HI_CODEC_ID_VIDEO_MPEG1,
    HI_CODEC_ID_VIDEO_MPEG2,
    HI_CODEC_ID_VIDEO_MPEG2_XVMC,
    HI_CODEC_ID_VIDEO_MPEG4,	  /**<MPEG4 DIVX4 DIVX5*/
    HI_CODEC_ID_VIDEO_MSMPEG4V1,
    HI_CODEC_ID_VIDEO_MSMPEG4V2,
    HI_CODEC_ID_VIDEO_MSMPEG4V3,

    HI_CODEC_ID_VIDEO_DIVX3,
    HI_CODEC_ID_VIDEO_XVID,

    HI_CODEC_ID_VIDEO_H261,
    HI_CODEC_ID_VIDEO_H263,
    HI_CODEC_ID_VIDEO_H263P,
    HI_CODEC_ID_VIDEO_H263I,
    HI_CODEC_ID_VIDEO_H264,
    HI_CODEC_ID_VIDEO_FFH264,

    HI_CODEC_ID_VIDEO_AVS,

    HI_CODEC_ID_VIDEO_REAL8,
    HI_CODEC_ID_VIDEO_REAL9,

    HI_CODEC_ID_VIDEO_VC1,
    HI_CODEC_ID_VIDEO_WMV1,
    HI_CODEC_ID_VIDEO_WMV2,
    HI_CODEC_ID_VIDEO_WMV3,

    HI_CODEC_ID_VIDEO_MSVIDEO1,

    HI_CODEC_ID_VIDEO_VP3,
    HI_CODEC_ID_VIDEO_VP5,
    HI_CODEC_ID_VIDEO_VP6,
    HI_CODEC_ID_VIDEO_VP6F,
    HI_CODEC_ID_VIDEO_VP6A,
    HI_CODEC_ID_VIDEO_VP8,
    HI_CODEC_ID_VIDEO_VP9,
    HI_CODEC_ID_VIDEO_AVS2,
    HI_CODEC_ID_VIDEO_RAW,
    HI_CODEC_ID_VIDEO_SORENSON,	  /**<SORENSON SPARK*/

	HI_CODEC_ID_VIDEO_HEVC,
    HI_CODEC_ID_VIDEO_RV10,
    HI_CODEC_ID_VIDEO_RV20,
    HI_CODEC_ID_VIDEO_RV30,
    HI_CODEC_ID_VIDEO_RV40,

    HI_CODEC_ID_VIDEO_SVQ1,
    HI_CODEC_ID_VIDEO_SVQ3,

    HI_CODEC_ID_VIDEO_CINEPAK,
    HI_CODEC_ID_VIDEO_INDEO2,
    HI_CODEC_ID_VIDEO_INDEO3,
    HI_CODEC_ID_VIDEO_INDEO4,
    HI_CODEC_ID_VIDEO_INDEO5,

    HI_CODEC_ID_VIDEO_JPEG,
    HI_CODEC_ID_VIDEO_JPEGLS,
    HI_CODEC_ID_VIDEO_JPEG2000,
    HI_CODEC_ID_VIDEO_MJPEG,
    HI_CODEC_ID_VIDEO_MJPEGB,
    HI_CODEC_ID_VIDEO_LJPEG,

    HI_CODEC_ID_VIDEO_TIFF,
    HI_CODEC_ID_VIDEO_GIF,
    HI_CODEC_ID_VIDEO_PNG,

    HI_CODEC_ID_VIDEO_SP5X,

    HI_CODEC_ID_VIDEO_FLV1,
    HI_CODEC_ID_VIDEO_HUFFYUV,
    HI_CODEC_ID_VIDEO_CYUV,
    HI_CODEC_ID_VIDEO_THEORA,
    HI_CODEC_ID_VIDEO_ASV1,
    HI_CODEC_ID_VIDEO_ASV2,
    HI_CODEC_ID_VIDEO_FFV1,
    HI_CODEC_ID_VIDEO_4XM,
    HI_CODEC_ID_VIDEO_VCR1,
    HI_CODEC_ID_VIDEO_CLJR,
    HI_CODEC_ID_VIDEO_MDEC,
    HI_CODEC_ID_VIDEO_ROQ,
    HI_CODEC_ID_VIDEO_INTERPLAY_VIDEO,
    HI_CODEC_ID_VIDEO_XAN_WC3,
    HI_CODEC_ID_VIDEO_XAN_WC4,
    HI_CODEC_ID_VIDEO_RPZA,
    HI_CODEC_ID_VIDEO_WS_VQA,
    HI_CODEC_ID_VIDEO_MSRLE,
    HI_CODEC_ID_VIDEO_IDCIN,
    HI_CODEC_ID_VIDEO_8BPS,
    HI_CODEC_ID_VIDEO_SMC,
    HI_CODEC_ID_VIDEO_FLIC,
    HI_CODEC_ID_VIDEO_TRUEMOTION1,
    HI_CODEC_ID_VIDEO_VMDVIDEO,
    HI_CODEC_ID_VIDEO_MSZH,
    HI_CODEC_ID_VIDEO_ZLIB,
    HI_CODEC_ID_VIDEO_QTRLE,
    HI_CODEC_ID_VIDEO_SNOW,
    HI_CODEC_ID_VIDEO_TSCC,
    HI_CODEC_ID_VIDEO_ULTI,
    HI_CODEC_ID_VIDEO_QDRAW,
    HI_CODEC_ID_VIDEO_VIXL,
    HI_CODEC_ID_VIDEO_QPEG,
    HI_CODEC_ID_VIDEO_PPM,
    HI_CODEC_ID_VIDEO_PBM,
    HI_CODEC_ID_VIDEO_PGM,
    HI_CODEC_ID_VIDEO_PGMYUV,
    HI_CODEC_ID_VIDEO_PAM,
    HI_CODEC_ID_VIDEO_FFVHUFF,

    HI_CODEC_ID_VIDEO_LOCO,
    HI_CODEC_ID_VIDEO_WNV1,
    HI_CODEC_ID_VIDEO_AASC,
    HI_CODEC_ID_VIDEO_FRAPS,
    HI_CODEC_ID_VIDEO_TRUEMOTION2,
    HI_CODEC_ID_VIDEO_BMP,
    HI_CODEC_ID_VIDEO_CSCD,
    HI_CODEC_ID_VIDEO_MMVIDEO,
    HI_CODEC_ID_VIDEO_ZMBV,
    HI_CODEC_ID_VIDEO_SMACKVIDEO,
    HI_CODEC_ID_VIDEO_NUV,
    HI_CODEC_ID_VIDEO_KMVC,
    HI_CODEC_ID_VIDEO_FLASHSV,
    HI_CODEC_ID_VIDEO_CAVS,

    HI_CODEC_ID_VIDEO_VMNC,

    HI_CODEC_ID_VIDEO_TARGA,
    HI_CODEC_ID_VIDEO_DSICINVIDEO,
    HI_CODEC_ID_VIDEO_TIERTEXSEQVIDEO,

    HI_CODEC_ID_VIDEO_DXA,
    HI_CODEC_ID_VIDEO_DNXHD,
    HI_CODEC_ID_VIDEO_THP,
    HI_CODEC_ID_VIDEO_SGI,
    HI_CODEC_ID_VIDEO_C93,
    HI_CODEC_ID_VIDEO_BETHSOFTVID,
    HI_CODEC_ID_VIDEO_PTX,
    HI_CODEC_ID_VIDEO_TXD,
    HI_CODEC_ID_VIDEO_AMV,
    HI_CODEC_ID_VIDEO_VB,
    HI_CODEC_ID_VIDEO_PCX,
    HI_CODEC_ID_VIDEO_SUNRAST,
    HI_CODEC_ID_VIDEO_MIMIC,
    HI_CODEC_ID_VIDEO_RL2,
    HI_CODEC_ID_VIDEO_8SVX_EXP,
    HI_CODEC_ID_VIDEO_8SVX_FIB,
    HI_CODEC_ID_VIDEO_ESCAPE124,
    HI_CODEC_ID_VIDEO_DIRAC,
    HI_CODEC_ID_VIDEO_BFI,
    HI_CODEC_ID_VIDEO_CMV,
    HI_CODEC_ID_VIDEO_MOTIONPIXELS,
    HI_CODEC_ID_VIDEO_TGV,
    HI_CODEC_ID_VIDEO_TGQ,
    HI_CODEC_ID_VIDEO_TQI,
    HI_CODEC_ID_VIDEO_AURA,
    HI_CODEC_ID_VIDEO_AURA2,
    HI_CODEC_ID_VIDEO_V210X,
    HI_CODEC_ID_VIDEO_TMV,
    HI_CODEC_ID_VIDEO_V210,
    HI_CODEC_ID_VIDEO_DPX,
    HI_CODEC_ID_VIDEO_MAD,
    HI_CODEC_ID_VIDEO_FRWU,
    HI_CODEC_ID_VIDEO_FLASHSV2,
    HI_CODEC_ID_VIDEO_CDGRAPHICS,
    HI_CODEC_ID_VIDEO_R210,
    HI_CODEC_ID_VIDEO_ANM,
    HI_CODEC_ID_VIDEO_BINKVIDEO,
    HI_CODEC_ID_VIDEO_IFF_ILBM,
    HI_CODEC_ID_VIDEO_IFF_BYTERUN1,
    HI_CODEC_ID_VIDEO_KGV1,
    HI_CODEC_ID_VIDEO_YOP,
    HI_CODEC_ID_VIDEO_DV,
    HI_CODEC_ID_BUTT
}HI_CODEC_ID_E;

/*BIT0 of HI_CODEC_SUPPORT_S.u32Type: Driven type */
/**Need be driven by codec manager. Like FFMPEG. */ /**CNcomment:���������Ҫ���������� */
#define HI_CODEC_CAP_DRIVENOUTSIDE	(0x00000000)
/**Self-driven, only need call Start()/Stop(). Like VFMW. */ /**CNcomment:������������������� */
#define HI_CODEC_CAP_DRIVENSELF		(0x00000001)

/*BIT1 of HI_CODEC_SUPPORT_S.u32Type: Output type */
/**Codec outputs frame or stream to specified address directly.	 */ /**CNcomment:�������֧�ֽ�֡���ݻ������������ָ����ַ */
#define HI_CODEC_CAP_OUTPUT2SELFADDR	(0x00000000)
/**Codec outputs frame or stream to the address self allocated . */ /**CNcomment:���������֡���ݻ������������������ַ����Ҫ�ⲿ���� */
#define HI_CODEC_CAP_OUTPUT2SPECADDR	(0x00000002)

/**Defines codec type: encoder or decoder  */
/**CNcomment:Codec����:��������*/
typedef enum hiCODEC_TYPE_E
{
    HI_CODEC_TYPE_DEC = 0x01,	    /**<decoder, value is b00000001*/ /**< CNcomment:������ */
    HI_CODEC_TYPE_ENC = 0x02,	    /**<encoder, value is b00000010*/ /**< CNcomment:������ */

    HI_CODEC_TYPE_BUTT
}HI_CODEC_TYPE_E;

/**Defines codec types and formats */
/**CNcomment:Codec������֧�ֵ�Э��*/
typedef struct hiCODEC_SUPPORT_S
{
    HI_U32	    u32Type;		/**< Codec type, OR value of HI_CODEC_TYPE_E */ /**< CNcomment:Codec���ͣ�HI_CODEC_TYPE_E�Ļ�ֵ */
    HI_CODEC_ID_E   enID;		/**< Codec ID*/ /**< CNcomment:Codec֧�ֵ�Э������ */
    struct hiCODEC_SUPPORT_S* pstNext;	/**< Pointer to next node*/ /**< CNcomment:ָ����һ����������ָ�� */
}HI_CODEC_SUPPORT_S;

/**Defines codec capability */
/**CNcomment:Codec����*/
typedef struct hiCODEC_CAP_S
{
    HI_U32		u32CapNumber;	/**< Codec capability index, OR value of several HI_CODEC_CAP_XXX */ /**< CNcomment:Codec����ָʾֵ��HI_CODEC_CAP_XXX�Ļ�ֵ */
    HI_CODEC_SUPPORT_S* pstSupport;	/**< Pointer to the support type and formats*/ /**< CNcomment:Codec�����ṹ��ָ�� */
}HI_CODEC_CAP_S;

/**Defines the codec version*/
/**CNcomment:�汾����*/
typedef union hiCODEC_VERSION_U
{
    struct
    {
	HI_U8 u8VersionMajor;		/**< Major version */ /**< CNcomment:���汾�� */
	HI_U8 u8VersionMinor;		/**< Minor version */ /**< CNcomment:�ΰ汾�� */
	HI_U8 u8Revision;		/**< Revision version */ /**< CNcomment:�޶��汾�� */
	HI_U8 u8Step;			/**< Step version */ /**< CNcomment:�����汾�� */
    } stVersion;
    HI_U32 u32Version;
} HI_CODEC_VERSION_U;

/**Defines video decoder open parameter*/
/**CNcomment:��Ƶ�������򿪲���*/
typedef struct hiCODEC_VDEC_OPENPARAM_S
{
    HI_U32 u32Reserve;
    HI_VOID* pPlatformPriv;	    /**< Special parameter for platform hardware codec */ /**< CNcomment:Ӳ������˽�в��� */
}HI_CODEC_VDEC_OPENPARAM_S;

/**Defines video encoder open parameter*/
/**CNcomment:��Ƶ�������򿪲���*/
typedef struct hiCODEC_VENC_OPENPARAM_S
{
    HI_U32 u32Reserve;
}HI_CODEC_VENC_OPENPARAM_S;

/**Defines the codec open parameters*/
/**CNcomment:ʵ����������*/
typedef struct hiCODEC_OPENPARAM_S
{
    HI_CODEC_TYPE_E enType;	  /** Encode or Decode */ /**< CNcomment:�������������ǽ����� */
    HI_CODEC_ID_E enID;		  /** Format */ /**< CNcomment:��Ҫ���������Э������ */
    union {
	HI_CODEC_VDEC_OPENPARAM_S stVdec; /** Open parameters of video decoder */ /**< CNcomment:��Ƶ�������������� */
	HI_CODEC_VENC_OPENPARAM_S stVenc; /** Open parameters of video encoder */ /**< CNcomment:��Ƶ�������������� */
    }unParam;
} HI_CODEC_OPENPARAM_S;

/**Defines the codec max priority */
/**CNcomment:�������������ȼ�����*/
#define HI_CODEC_MAX_PRIORITY (16)

/**Defines attribute of video decoder */
/**CNcomment:��Ƶ������ʵ������*/
typedef struct hiCODEC_VDEC_ATTR_S
{
    HI_VOID*		    pCodecContext;  /**< Codec context */ /**< CNcomment:������������ģ����Դ��ݽ������ض����� */
    HI_VOID*		    pPlatformPriv;  /**< Only used by platform */ /**< CNcomment:Ӳ������˽�в��� */
} HI_CODEC_VDEC_ATTR_S;

/**Defines attribute of codec instance */
/**CNcomment:ʵ������*/
typedef struct hiCODEC_ATTR_S
{
    HI_CODEC_ID_E	    enID;   /**< Codec ID*/ /**< CNcomment:���������Э������*/
    union {
	HI_CODEC_VDEC_ATTR_S stVdec;/**< Instance attribute*/ /**< CNcomment:��Ƶ���������Բ���*/
    } unAttr;
} HI_CODEC_ATTR_S;

/**Defines video sub standard */
/**CNcomment: ��ƵЭ���֧��׼ */
typedef enum hiCODEC_VIDEO_SUB_STANDARD_E
{
    HI_CODEC_VIDEO_SUB_STANDARD_UNKNOWN,       /**<Unknown*/ /**<CNcomment: δ֪Э���֧*/
    HI_CODEC_VIDEO_SUB_STANDARD_MPEG2_MPEG1,   /**<The MPEG2 protocol family is compatible with MPEG1.*/ /**<CNcomment: MPEG2Э������Լ���MPEG1 */
    HI_CODEC_VIDEO_SUB_STANDARD_MPEG4_SHV,     /**<The MPEG4 protocol family is compatible with SHV.*/ /**<CNcomment: MPEG4Э������Լ���SHV*/
    HI_CODEC_VIDEO_SUB_STANDARD_MPEG4_XVID,    /**<The MPEG4 protocol family includes the sub protocol XVID.*/ /**<CNcomment: MPEG4Э�����XVID��֧*/
    HI_CODEC_VIDEO_SUB_STANDARD_MPEG4_DIVX,    /**<The MPEG4 protocol family includes the sub protocol DIVX.*/ /**<CNcomment: MPEG4Э�����DIVX��֧*/

    HI_CODEC_VIDEO_SUB_STANDARD_BUTT
}HI_CODEC_VIDEO_SUB_STANDARD_E;

/**Defines the video norm*/
/**CNcomment: ������Ƶ��ʽö��*/
typedef enum hiCODEC_ENC_FMT_E
{
    HI_CODEC_ENC_FMT_1080P_60 = 0,     /**<1080p 60 Hz*/ /**< CNcomment:1080p 60����*/
    HI_CODEC_ENC_FMT_1080P_50,	       /**<1080p 50 Hz*/ /**< CNcomment:1080p 50����*/
    HI_CODEC_ENC_FMT_1080P_30,	       /**<1080p 30 Hz*/ /**< CNcomment:1080p 30����*/
    HI_CODEC_ENC_FMT_1080P_25,	       /**<1080p 25 Hz*/ /**< CNcomment:1080p 25����*/
    HI_CODEC_ENC_FMT_1080P_24,	       /**<1080p 24 Hz*/ /**< CNcomment:1080p 24����*/

    HI_CODEC_ENC_FMT_1080i_60,	       /**<1080i 60 Hz*/ /**< CNcomment:1080i 60����*/
    HI_CODEC_ENC_FMT_1080i_50,	       /**<1080i 50 Hz*/ /**< CNcomment:1080i 50����*/

    HI_CODEC_ENC_FMT_720P_60,	       /**<720p 60 Hz*/	 /**< CNcomment:720p 60����*/
    HI_CODEC_ENC_FMT_720P_50,	       /**<720p 50 Hz */ /**< CNcomment:720p 50����*/

    HI_CODEC_ENC_FMT_576P_50,	       /**<576p 50 Hz*/	 /**< CNcomment:576p 50����*/
    HI_CODEC_ENC_FMT_480P_60,	       /**<480p 60 Hz*/	 /**< CNcomment:480p 60����*/

    HI_CODEC_ENC_FMT_PAL,	       /**<B D G H I PAL */ /**< CNcomment:B D G H I PAL��ʽ*/
    HI_CODEC_ENC_FMT_PAL_N,	       /**<(N)PAL	 */ /**< CNcomment:(N)PAL��ʽ*/
    HI_CODEC_ENC_FMT_PAL_Nc,	       /**<(Nc)PAL	 */ /**< CNcomment:(Nc)PAL��ʽ*/

    HI_CODEC_ENC_FMT_NTSC,	       /**<(M)NTSC	 */ /**< CNcomment:(M)NTSC��ʽ*/
    HI_CODEC_ENC_FMT_NTSC_J,	       /**<NTSC-J	 */ /**< CNcomment:NTSC-J��ʽ*/
    HI_CODEC_ENC_FMT_NTSC_PAL_M,       /**<(M)PAL	 */ /**< CNcomment:(M)PAL��ʽ*/

    HI_CODEC_ENC_FMT_SECAM_SIN,	       /**< SECAM_SIN*/ /**< CNcomment:SECAM_SIN��ʽ*/
    HI_CODEC_ENC_FMT_SECAM_COS,	       /**< SECAM_COS*/ /**< CNcomment:SECAM_COS��ʽ*/

    HI_CODEC_ENC_FMT_1080P_24_FRAME_PACKING,
    HI_CODEC_ENC_FMT_720P_60_FRAME_PACKING,
    HI_CODEC_ENC_FMT_720P_50_FRAME_PACKING,

    HI_CODEC_ENC_FMT_861D_640X480_60,
    HI_CODEC_ENC_FMT_VESA_800X600_60,
    HI_CODEC_ENC_FMT_VESA_1024X768_60,
    HI_CODEC_ENC_FMT_VESA_1280X720_60,
    HI_CODEC_ENC_FMT_VESA_1280X800_60,
    HI_CODEC_ENC_FMT_VESA_1280X1024_60,
    HI_CODEC_ENC_FMT_VESA_1360X768_60,
    HI_CODEC_ENC_FMT_VESA_1366X768_60,
    HI_CODEC_ENC_FMT_VESA_1400X1050_60,
    HI_CODEC_ENC_FMT_VESA_1440X900_60,
    HI_CODEC_ENC_FMT_VESA_1440X900_60_RB,
    HI_CODEC_ENC_FMT_VESA_1600X900_60_RB,
    HI_CODEC_ENC_FMT_VESA_1600X1200_60,
    HI_CODEC_ENC_FMT_VESA_1680X1050_60,
    HI_CODEC_ENC_FMT_VESA_1920X1080_60,
    HI_CODEC_ENC_FMT_VESA_1920X1200_60,
    HI_CODEC_ENC_FMT_VESA_2048X1152_60,

    HI_CODEC_ENC_FMT_BUTT
}HI_CODEC_ENC_FMT_E;

/**Defines the video YUV format*/
/**CNcomment: YUV��ʽö��*/
typedef enum hiCODEC_COLOR_FORMAT_E
{
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_400 = 0,   /**<The YUV spatial sampling format is SEMIPLANAR 4:0:0.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:0:0*/
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_411,	    /**<The YUV spatial sampling format is SEMIPLANAR 4:1:1.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:1:1*/
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_420,	    /**<The YUV spatial sampling format is SEMIPLANAR 4:2:0.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:2:0*/
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_422_1X2,   /**<The YUV spatial sampling format is SEMIPLANAR 4:2:2,two Y correspond to one U and V at vertical direction.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:2:2����ֱ�����������Ȳ����㹲��һ��ɫ�Ȳ�����*/
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_422_2X1,   /**<The YUV spatial sampling format is SEMIPLANAR 4:2:2,two Y correspond to one U and V at horizontal direction.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:2:2��ˮƽ�����������Ȳ����㹲��һ��ɫ�Ȳ�����*/
    HI_CODEC_COLOR_FORMAT_YUV_SEMIPLANAR_444,	    /**<The YUV spatial sampling format is SEMIPLANAR 4:4:4.*/ /**<CNcomment: YUV�ռ������ʽΪSEMIPLANAR 4:4:4*/

    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_400 = 0x10,    /**<The YUV spatial sampling format is PLANAR 4:0:0.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:0:0*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_411,	    /**<The YUV spatial sampling format is PLANAR 4:1:1.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:1:1*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_420,	    /**<The YUV spatial sampling format is PLANAR 4:2:0.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:2:0*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_422_1X2,	    /**<The YUV spatial sampling format is PLANAR 4:2:2,two Y correspond to one U and V at vertical direction.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:2:2����ֱ�����������Ȳ����㹲��һ��ɫ�Ȳ�����*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_422_2X1,	    /**<The YUV spatial sampling format is PLANAR 4:2:2,two Y correspond to one U and V at horizontal direction.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:2:2��ˮƽ�����������Ȳ����㹲��һ��ɫ�Ȳ�����*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_444,	    /**<The YUV spatial sampling format is PLANAR 4:4:4.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:4:4*/
    HI_CODEC_COLOR_FORMAT_YUV_PLANAR_410,	    /**<The YUV spatial sampling format is PLANAR 4:1:0.*/ /**<CNcomment: YUV�ռ������ʽΪPLANAR 4:1:0*/

    HI_CODEC_COLOR_FORMAT_YUV_PACKAGE_UYVY422 = 0x20,	/**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is UYVY.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪUYVY*/
    HI_CODEC_COLOR_FORMAT_YUV_PACKAGE_YUYV422,		/**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is YUYV.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪYUYV*/
    HI_CODEC_COLOR_FORMAT_YUV_PACKAGE_YVYU422,		/**<The YUV spatial sampling format is package, and the pixel arrangement sequence in the memory is YVYU.*/ /**<CNcomment: YUV�ռ������ʽΪpackage,�ڴ�����ΪYVYU*/
    HI_CODEC_COLOR_FORMAT_YUV_BUTT
}HI_CODEC_COLOR_FORMAT_E;

/**Defines the type of the video frame*/
/**CNcomment: ������Ƶ֡������ö��*/
typedef enum hiCODEC_VIDEO_FRAME_TYPE_E
{
    HI_CODEC_VIDEO_FRAME_TYPE_UNKNOWN,	 /**<Unknown*/ /**<CNcomment: δ֪��֡����*/
    HI_CODEC_VIDEO_FRAME_TYPE_I,	 /**<I frame*/ /**<CNcomment: I֡*/
    HI_CODEC_VIDEO_FRAME_TYPE_P,	 /**<P frame*/ /**<CNcomment: P֡*/
    HI_CODEC_VIDEO_FRAME_TYPE_B,	 /**<B frame*/ /**<CNcomment: B֡*/
    HI_CODEC_VIDEO_FRAME_TYPE_BUTT
}HI_CODEC_VIDEO_FRAME_TYPE_E;

/**Defines the video frame/field mode*/
/**CNcomment: ������Ƶ֡��ģʽö��*/
typedef enum hiCODEC_VIDEO_FIELD_MODE_E
{
    HI_CODEC_VIDEO_FIELD_ALL,	     /**<Frame mode*/ /**<CNcomment: ֡ģʽ*/
    HI_CODEC_VIDEO_FIELD_TOP,	     /**<Top field mode*/ /**<CNcomment: ����ģʽ*/
    HI_CODEC_VIDEO_FIELD_BOTTOM,     /**<Bottom field mode*/ /**<CNcomment: �׳�ģʽ*/
    HI_CODEC_VIDEO_FIELD_BUTT
}HI_CODEC_VIDEO_FIELD_MODE_E;

/**Defines 3D frame packing type*/
/**CNcomment: 3D֡�����ʽ */
typedef enum hiCODEC_VIDEO_FRAME_PACKING_TYPE_E
{
    HI_CODEC_VIDEO_FRAME_PACKING_NONE,		    /**< normal frame, not a 3D frame */ /**<CNcomment: ��3D֡*/
    HI_CODEC_VIDEO_FRAME_PACKING_SIDE_BY_SIDE,	    /**< side by side */ /**<CNcomment:����ģʽ3D֡ */
    HI_CODEC_VIDEO_FRAME_PACKING_TOP_AND_BOTTOM,    /**< top and bottom */ /**<CNcomment:����ģʽ3D֡ */
    HI_CODEC_VIDEO_FRAME_PACKING_TIME_INTERLACED,   /**< time interlaced: one frame for left eye, the next frame for right eye */ /**<CNcomment:ʱ���ģʽ3D֡ */
    HI_CODEC_VIDEO_FRAME_PACKING_BUTT
}HI_CODEC_VIDEO_FRAME_PACKING_TYPE_E;

/**Defines address information*/
/**CNcomment: ��ַ�����ṹ��*/
typedef struct hiCODEC_ADDRESS_S
{
    HI_U8   *pu8Vir;		 /**<Virtual address of (frame or stream) buffer */ /**<CNcomment: ֡�������ݵ������ַ */
    HI_U32  u32Phy;		/**<Physical address of (frame or stream) buffer */ /**<CNcomment: ֡�������ݵ�������ַ */
    HI_U32  u32Size;		/**<Size of (frame or stream) buffer*/ /**<CNcomment: ֡�������ݵĴ�С */
}HI_CODEC_ADDRESS_S;

/**Defines video stream info */
/** CNcomment: ��Ƶ����Ϣ�ṹ��*/
typedef struct hiCODEC_VIDEO_STREAMINFO_S
{
    HI_CODEC_ID_E		    enCodecID;	    /**<Stream type*/ /**<CNcomment: �������� */
    HI_CODEC_VIDEO_SUB_STANDARD_E   enSubStandard;  /**<Sub stream protocol*/ /**<CNcomment: ������Э���֧ */
    HI_U32			    u32SubVersion;  /**<Version of the sub stream protocol*/ /**<CNcomment: ������Э��汾�� */
    HI_U32			    u32Profile;	    /**<Stream profile*/ /**<CNcomment: ������profile */
    HI_U32			    u32Level;	    /**<Stream level*/ /**<CNcomment: ������level */
    HI_CODEC_ENC_FMT_E		    enDisplayNorm;  /**<Display norm*/ /**<CNcomment: ��ʾ��׼ */
    HI_BOOL			    bProgressive;   /**<Sampling type (progressive or interlaced)*/ /**<CNcomment: ������ʽ(����/����) */

    HI_U32			    u32AspectWidth; /**<Aspect width*/ /**<CNcomment: �����ʾ���ͱ�֮���ȱ�ֵ*/
    HI_U32			    u32AspectHeight;/**<Aspect height*/ /**<CNcomment: �����ʾ���ͱ�֮�߶ȱ�ֵ*/

    HI_U32 u32bps;	      /**<Bit rate, in kbit/s*/ /**<CNcomment: ����������, Kbps */
    HI_U32 u32FrameRateInt;   /**<Integral part of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ���������, fps */
    HI_U32 u32FrameRateDec;   /**<Fractional part (calculated to three decimal places) of the frame rate (in frame/s)*/ /**<CNcomment: ������֡�ʵ�С�����֣�����3λ��, fps */
    HI_U32 u32Width;	      /**<Width of the decoded picture*/ /**<CNcomment: ����ͼ��� */
    HI_U32 u32Height;	      /**<Height of the decoded picture*/ /**<CNcomment: ����ͼ��� */
    HI_U32 u32DisplayWidth;   /**<Width of the displayed picture*/ /**<CNcomment: ��ʾͼ��� */
    HI_U32 u32DisplayHeight;  /**<Height of the displayed picture*/ /**<CNcomment: ��ʾͼ��� */
    HI_U32 u32DisplayCenterX; /**<Horizontal coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/
			      /**<CNcomment: ��ʾͼ�����ĺ����꣬��ԭʼͼ������Ͻ�Ϊ����ԭ�� */
    HI_U32 u32DisplayCenterY; /**<Vertical coordinate of the center of the displayed picture (the upper left point of the source picture serves as the coordinate origin)*/
			      /**<CNcomment: ��ʾͼ�����������꣬��ԭʼͼ������Ͻ�Ϊ����ԭ�� */
}HI_CODEC_VIDEO_STREAMINFO_S;

/**Defines stream information */
/**CNcomment: ������Ϣ�ṹ��*/
typedef union hiCODEC_STREAMINFO_S
{
    HI_CODEC_VIDEO_STREAMINFO_S stVideo;    /**<video stream information*/ /**<CNcomment: ��Ƶ����Ϣ*/
}HI_CODEC_STREAMINFO_S;

typedef struct hiCODEC_FRAME_BUF_S
{
	HI_U32 u32PhyAddr;
	HI_U32 u32Size;
}HI_CODEC_FRAME_BUF_S;

/**Defines stream descriptor */
/**CNcomment: �������ݽṹ��*/
typedef struct hiCODEC_STREAM_S
{
    HI_U8* pu8Addr;	/**<Stream buffer address*/ /**<CNcomment: �����ݵ�ַ*/
	HI_U32 u32PhyAddr;  /**<Stream buffer address*/ /**<CNcomment: ������������ַ*/
    HI_U32 u32Size;	/**<Stream buffer size*/ /**<CNcomment: �����ݴ�С*/
    HI_S64 s64PtsMs;	/**<PTS(ms)*/ /**<CNcomment: �����ݶ�ӦPTS������Ϊ��λ*/
}HI_CODEC_STREAM_S;

/**Defines video codec comonds */
/**CNcomment: ��Ƶ���������������ṹ��*/
typedef struct hiCODEC_VIDEO_CMD_S
{
    HI_U32	u32CmdID;   /**<Commond ID*/ /**<CNcomment: ����ID*/
    HI_VOID	*pPara;	    /**<Control parameter*/ /**<CNcomment: ����Я������*/
}HI_CODEC_VIDEO_CMD_S;

/**Defines video frame information*/
/**CNcomment: ��Ƶ֡��Ϣ�ṹ��*/
typedef struct hiCODEC_VIDEO_FRAME_S
{
    HI_CODEC_COLOR_FORMAT_E		enColorFormat;	      /**<Video format*/ /**<CNcomment: ��Ƶ��ʽ*/
    HI_CODEC_VIDEO_FRAME_TYPE_E		enFrameType;	      /**<Frame type*/ /**<CNcomment: ֡����*/
    HI_BOOL				bProgressive;	      /**<Sampling type*/ /**<CNcomment: ��������*/

    HI_CODEC_VIDEO_FIELD_MODE_E		enFieldMode;	      /**<Frame or field encoding mode*/ /**<CNcomment: ֡�򳡱���ģʽ*/
    HI_BOOL				bTopFieldFirst;	      /**<Top field first flag*/ /**<CNcomment: �������ȱ�־*/

    HI_CODEC_VIDEO_FRAME_PACKING_TYPE_E enFramePackingType;   /**<3D frame packing type*/ /**<CNcomment: 3D֡�����ʽ*/

    HI_U32				u32FrameRate;	      /**<Frame rate*//**<CNcomment: ֡��*/

    HI_U32				u32Width;	      /**<Width of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32Height;	      /**<Height of the source picture*/ /**<CNcomment: ԭʼͼ���*/
    HI_U32				u32AspectWidth;	      /**<Aspect width*/ /**<CNcomment: �����ʾ����*/
    HI_U32				u32AspectHeight;      /**<Aspect height*/ /**<CNcomment: �����ʾ�߶�*/

    HI_U32				u32YAddr;	      /**<Address of the Y component in the current frame*/ /**<CNcomment: ��ǰ֡Y�������ݵĵ�ַ*/
    HI_U32				u32UAddr;	      /**<Address of the U component in the current frame*/ /**<CNcomment: ��ǰ֡U�������ݵĵ�ַ*/
    HI_U32				u32VAddr;	      /**<Address of the V component in the current frame*/ /**<CNcomment: ��ǰ֡V�������ݵĵ�ַ*/
    HI_U32				u32YStride;	      /**<Stride of the Y component*/ /**<CNcomment: Y�������ݵĿ��*/
    HI_U32				u32UStride;	      /**<Stride of the U component*/ /**<CNcomment: C�������ݵĿ��*/
    HI_U32				u32VStride;	      /**<Stride of the V component*/ /**<CNcomment: C�������ݵĿ��*/

    HI_U8*				pu8UserData;	      /**<User data *//**<CNcomment: �û�����*/
    HI_U32				u32UserDataSize;      /**<User data size *//**<CNcomment: �û����ݳ���*/
}HI_CODEC_VIDEO_FRAME_S;

/**Defines frame descriptor */
/**CNcomment: ֡�����ṹ��*/
typedef struct hiCODEC_FRAME_S
{
    HI_CODEC_ADDRESS_S		stOutputAddr;	/**< Always [in], only used by the codecs which support HI_CODEC_OUTPUT_TOSPECADDR, Only used by decoder  */
						/**< CNcomment: ֡�����ַ��һֱ�������������������֧��HI_CODEC_OUTPUT_TOSPECADDR�Ľ����� */
    HI_S64			s64SrcPtsMs;	/**< Decoder [out], encoder [in], The source pts(ms) */
						/**< CNcomment: ֡ԴPTS������Ϊ��λ���Խ�������˵������������Ա�������˵���������*/
    HI_S64			s64PtsMs;	/**< Decoder [out], encoder [in], The pts(ms)*/
						/**< CNcomment: ֡PTS������Ϊ��λ���Խ�������˵������������Ա�������˵���������*/
    union{
	HI_CODEC_VIDEO_FRAME_S	stVideo;	/**< Decoder [out], encoder [in], The video frame information*/
						/**< CNcomment: ��Ƶ֡��Ϣ���Խ�������˵������������Ա�������˵���������*/
    }unInfo;
}HI_CODEC_FRAME_S;

/**Defines codec*/
/**CNcomment: CODEC�ṹ�嶨��*/
typedef struct hiCODEC_S
{
    /**<Description information about a codec */
    /**<CNcomment: ��������������� */
    const HI_CHAR *pszName;

    /**<Codec version */
    /**<CNcomment: ��������汾���� */
    const HI_CODEC_VERSION_U unVersion;

    /**<Detailed information about a codec */
    /**<CNcomment: ���������ϸ������Ϣ */
    const HI_CHAR *pszDescription;

    /**
    \brief Get codec capability. CNcomment:��ȡ����������� CNend
    \attention \n
    N/A
    \param [out] pstCodecCap, Pointer of the codec capability. CNcomment:ָ�����ͣ�ָ������������ CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*GetCap)(HI_CODEC_CAP_S *pstCodecCap);

    /**
    \brief Create a codec instance. CNcomment:�����������ʵ�� CNend
    \attention \n
    N/A
    \param [in] pstParam, Pointer of the open params. CNcomment:ָ�����ͣ�ָ��ʵ���򿪲��� CNend
    \param [out] phInst, Pointer to instance handle. CNcomment:ָ�����ͣ�ָ��ʵ����� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Create)(HI_HANDLE* phInst, const HI_CODEC_OPENPARAM_S * pstParam);

    /**
    \brief Destroy a codec instance. CNcomment:���ٱ������ʵ�� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Destroy)(HI_HANDLE hInst);

    /**
    \brief Start a codec instance. CNcomment:�����������ʵ�� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Start)(HI_HANDLE hInst);

    /**
    \brief Stop a codec instance. CNcomment:ֹͣ�������ʵ�� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Stop)(HI_HANDLE hInst);

    /**
    \brief Reset a codec instance. CNcomment:��λ�������ʵ�� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Reset)(HI_HANDLE hInst);

    /**
    \brief Set attribute to a codec instance. CNcomment:���ñ���������� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [in] pstAttr, Pointer to the instance attribute. CNcomment:ָ�����ͣ�ָ��ʵ������ CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*SetAttr)(HI_HANDLE hInst, const HI_CODEC_ATTR_S * pstAttr);

    /**
    \brief Get attribute to a codec instance. CNcomment:��ȡ����������� CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [out] pstAttr, Pointer to the instance attribute. CNcomment:ָ�����ͣ�ָ��ʵ������ CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*GetAttr)(HI_HANDLE hInst, HI_CODEC_ATTR_S * pstAttr);

    /**
    \brief Decode a frame.. CNcomment:����һ֡ CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [in] pstIn, Pointer to stream data descriptor. CNcomment:ָ�����ͣ�ָ������������Ϣ�ṹ�� CNend
    \param [out] pstOut, Pointer to frame data descriptor. CNcomment:ָ�����ͣ�ָ��֡������Ϣ�ṹ�� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*DecodeFrame)(HI_HANDLE hInst, HI_CODEC_STREAM_S * pstIn, HI_CODEC_FRAME_S * pstOut);

    /**
    \brief Encode a frame. CNcomment:����һ֡ CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [in] pstIn, Pointer to stream data descriptor. CNcomment:ָ�����ͣ�ָ������������Ϣ�ṹ�� CNend
    \param [out] pstOut, Pointer to frame data descriptor. CNcomment:ָ�����ͣ�ָ��֡������Ϣ�ṹ�� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*EncodeFrame)(HI_HANDLE hInst, HI_CODEC_FRAME_S * pstIn, HI_CODEC_STREAM_S * pstOut);

    /**
    \brief Get stream information. CNcomment:��ȡ������Ϣ CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [out] pstAttr, Pointer to stream information. CNcomment:ָ�����ͣ�ָ��������Ϣ�ṹ�� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*GetStreamInfo)(HI_HANDLE hInst, HI_CODEC_STREAMINFO_S * pstAttr);

	HI_S32 (*RegFrameBuffer)(HI_HANDLE hInst, HI_CODEC_STREAM_S *pstRawPacket);
    /**
    \brief Other control, can be extended. CNcomment:��������ѡ�����չ CNend
    \attention \n
    N/A
    \param [in] hInst, Instance handle. CNcomment:ʵ����� CNend
    \param [out] u32CMD, The commond ID. CNcomment:����ID CNend
    \param [out] pParam, Pointer to control parameter. CNcomment:ָ�����ͣ�ָ����Ʋ��� CNend
    \retval ::HI_SUCCESS CNcomment:�����ɹ� CNend
    \retval ::HI_FAILURE CNcomment:����ʧ�� CNend
    \see \n
    N/A
    */
    HI_S32 (*Control)(HI_HANDLE hInst, HI_U32 u32CMD, HI_VOID * pParam);
}HI_CODEC_S;

/** @} */  /** <!-- ==== Structure Definition End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_VIDEO_CODEC_H__ */
