#ifndef __DRV_VENC_EFL_H__
#define __DRV_VENC_EFL_H__

#include "hi_type.h"
#include "drv_venc_buf_mng.h"
#include "hi_unf_common.h"
#include "hi_drv_video.h"
#include "drv_venc_queue_mng.h"
#include "hi_drv_mmz.h"
#if defined VENC_96MV200_CONFIG
#include "hal_venc_96mv200.h"
#elif defined VENC_98MV200_CONFIG
#include "hal_venc.h"
#endif
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

//#define __VENC_DRV_DBG__
//#define __VENC_RC_DBG__
//#define __OMXVENC_ONE_IN_ONE_OUT__
#define VEDU_TR_STEP 1
/*************************************************************************************/

#define MAX_VEDU_CHN 8

#define MAX_VEDU_QUEUE_NUM 6
#define MAX_VEDU_STRM_QUEUE_NUM 20
#define MSG_QUEUE_NUM     100
#define INVAILD_CHN_FLAG   (-1)

#define OMX_OUTPUT_PORT_BUFFER_MAX (20)

#ifdef VENC_DPT_ONLY
#define VEDU_MMZ_ALIGN       (256)
#else
#define VEDU_MMZ_ALIGN       (64)
#endif


/*******************************************************************/

#define __VEDU_NEW_RC_ALG__

#define H264_NALU_TYPE_SPS     (7)
#define H264_NALU_TYPE_PPS     (8)
#define H264_NALU_TYPE_IDR     (5)
#define H264_NALU_TYPE_P       (1)

#define H265_NALU_TYPE_VPS     (32)
#define H265_NALU_TYPE_SPS     (33)
#define H265_NALU_TYPE_PPS     (34)
#define H265_NALU_TYPE_IDR     (5)   //(19)
#define H265_NALU_TYPE_P       (1)
#define H265_NALU_TYPE_SEI     (39)

#define D_VENC_ALIGN_UP(val, align) ( (val+((align)-1))&~((align)-1) )
typedef HI_S32 (*VE_IMAGE_FUNC)(HI_S32 handle, HI_DRV_VIDEO_FRAME_S* pstImage);
typedef HI_S32 (*VE_IMAGE_OMX_FUNC)(HI_S32 handle, venc_user_buf* pstImage);
typedef HI_S32 (*VE_CHANGE_INFO_FUNC)(HI_HANDLE handle, HI_U32 u32Width, HI_U32 u32Height, HI_U32 u32FrmRate);
typedef HI_S32 (*VE_DETACH_FUNC)(HI_HANDLE handle, HI_HANDLE hSrc);

typedef struct
{
    HI_U32 ProfileIDC;
    HI_U32 FrameWidthInMb;
    HI_U32 FrameHeightInMb;
    HI_U8  FrameCropLeft;
    HI_U8  FrameCropRight;
    HI_U8  FrameCropTop;
    HI_U8  FrameCropBottom;
} VeduEfl_H264e_SPS_S;

typedef struct
{
    HI_U32  ConstIntra;
    HI_S32  ChrQpOffset;
    HI_U32  H264HpEn;
    HI_U32  H264CabacEn;
    HI_S32* pScale8x8;
} VeduEfl_H264e_PPS_S;

typedef struct
{
    HI_U32 slice_type; /* 0-P, 2-I */
    HI_U32 frame_num;
    HI_U32 NumRefIndex; /* 0 or 1 */
} VeduEfl_H264e_SlcHdr_S;

typedef struct
{
    HI_BOOL general_progressive_source_flag;
    HI_BOOL general_interlaced_source_flag;
    HI_U32 uiMaxDecPicBufferMinus1[2];
} VeduEfl_H265e_VPS_S;

typedef struct
{
    HI_U32  ProfileIDC;
    HI_U32  uiPicWidthInLumaSamples;
    HI_U32  uiPicHeightInLumaSamples;
    HI_U32  bPicCroppingFlag;
    HI_U32  uiPicCropLeftOffset;
    HI_U32  uiPicCropRightOffset;
    HI_U32  uiPicCropTopOffset;
    HI_U32  uiPicCropBottomOffset;
    HI_U32  bPcmEnable;
    HI_U32  iPcmLog2MaxSize;
    HI_U32  bSAOEnabledFlag;
    HI_U32  iPcmLog2MinSize;
    HI_U32  sps_temporal_mvp_enable_flag;
    HI_U32  bStrongIntraSmoothingFlag;

} VeduEfl_H265e_SPS_S;

typedef struct
{
    HI_U32 bCUQpDeltaEnable;
    HI_S32 iCbQpOffset;
    HI_S32 iCrQpOffset;

    HI_U32 bPicDisableDBFilter;
    HI_S32 frm_qp_minus26;

}VeduEfl_H265e_PPS_S;

typedef struct
{
    HI_U32 bFirstSliceInPic;
    HI_U32 eSliceType; // 2->I, 1->P, 0->B
    HI_U32 uiPocLsb;
    HI_U32 bSpsTemporalMvpEnableFlag;
    HI_U32 bSAOEnabledFlag;
    HI_U32 bSliceSaoLuma;
    HI_U32 bSliceSaoChroma;
    HI_U32 five_minus_max_num_merge_cand;
    HI_S32 iSliceQPDelta;
    HI_U32 bDBFilterCtlPresent;
    HI_U32 bDBFilterOverrideEnabled;
    HI_U32 bDFOverrideFlag;
    HI_U32 bSliceHeaderDisableDF;
    HI_U32 bSliceLFAcrossSlice;
    HI_U32 frame_num;
    HI_U32 slice_type;
    HI_U32 collocated_from_l0_flag;
    HI_U32 num_ref_idx_l0_active_minus1;

}VeduEfl_H265e_SlcHdr_S;

typedef struct
{
    HI_U32 PacketLen;     /* 64 aligned */
    HI_U32 InvldByte;     /* InvalidByteNum */
    HI_U8  Type;
    HI_U8  bBotField;
    HI_U8  bField;
    HI_U8  bLastSlice;
    HI_U32 ChnID;
    HI_U32 PTS0;
    HI_U32 PTS1;
    HI_U32 Reserved[10];
} VeduEfl_NaluHdr_S;

typedef struct
{
    HI_U32              handle;
    VE_IMAGE_FUNC       pfGetImage;
    VE_IMAGE_OMX_FUNC   pfGetImage_OMX;
    VE_IMAGE_FUNC       pfPutImage;
    VE_CHANGE_INFO_FUNC pfChangeInfo;
    VE_DETACH_FUNC      pfDetachFunc;
} VeduEfl_SrcInfo_S;

typedef struct
{
    HI_BOOL bOMXChn;
    HI_BOOL bAutoRequestIfrm;
	HI_BOOL bPrependSpsPps;
	HI_BOOL bRCSkipFrmEn;
	
    HI_U32 Protocol;      /* VEDU_H264, VEDU_H263 or VEDU_MPEG4 */
    HI_U32 CapLevel;      /* VEDU buffer alloc*/
    HI_U32 Profile;       /* H264 Profile*/
    HI_U32 FrameWidth;    /* width	in pixel, 96 ~ 2048 */
    HI_U32 FrameHeight;   /* height in pixel, 96 ~ 2048 */

    HI_U32 RotationAngle; /* venc don't care */

    HI_U32 PackageSel;
    HI_U32 Priority;
    HI_U32 streamBufSize;

    HI_BOOL QuickEncode;
    HI_BOOL SlcSplitEn;    /* 0 or 1, slice split enable */
    HI_BOOL SlcSplitMod;   /* 0 or 1, 0:byte; 1:mb line */
    HI_U32 SplitSize;     /* <512 mb line @ H264, H263 don't care*/
    HI_U32 Gop;
    HI_U32 QLevel;        /* venc don't care */
	HI_U32 DriftRCThr;    /* the threshold of RC skip frame; vp default 20%*/
} VeduEfl_EncCfg_S;

typedef struct
{
    HI_U32 BitRate;       /* 32k ~ 20M, bits per second */
    HI_U32 OutFrmRate;    /* 1 ~ InFrmRate */
    HI_U32 InFrmRate;     /* 1 ~ 30  */

    HI_U32   MaxQp;         /* H264: 0 ~ 51, Mpeg4: 1 ~ 31 */
    HI_U32   MinQp;         /* MinQp <= MaxQp */
    HI_U32   Gop;         /* for new RC ALG*/
} VeduEfl_RcAttr_S;

typedef struct
{
    HI_VOID*   pVirtAddr[2];
    HI_U32     PhyAddr[2];
    HI_U32     SlcLen[2];  /* byte */
    HI_U32     PTS0;
    HI_U32     PTS1;
    HI_U32     bFrameEnd;
    HI_U32     NaluType;   /* 1(P),5(I),6(SEI),7(SPS) or 8(PPS), only used by H264	*/
    HI_U32     InvldByte;
} VeduEfl_NALU_S;

typedef struct
{
    HI_U32 osd_rgbfm;            /* 0 ~ 1 */
    HI_S32 osd_global_en   [8];
    HI_S32 osd_en          [8];
    HI_U32 osd_alpha0      [8];
    HI_U32 osd_alpha1      [8];
    HI_U32 osd_global_alpha[8];
    HI_U32 osd_x           [8]; /* pixel, 2 aligned */
    HI_U32 osd_y           [8]; /* pixel, 2 aligned */
    HI_U32 osd_w           [8]; /* pixel, 2 aligned */
    HI_U32 osd_h           [8]; /* pixel, 2 aligned */
    HI_U32 osd_addr        [8]; /* 16-byte aligned  */
    HI_U32 osd_stride      [8]; /* 64-byte aligned  */
    HI_U32 osd_layer_id    [8]; /* 0 ~ 7 */

    HI_S32 osd_absqp_en    [8]; /* only used at H264  */
    HI_S32 osd_qp          [8]; /* -26 ~ 25 or 0 ~ 51 */

    HI_U32 osd_invs_en     [8];
    HI_U32 osd_invs_w;          /* 1 ~ 4 */
    HI_U32 osd_invs_h;          /* 1 ~ 4 */
    HI_U32 osd_invs_thr;        /* 0 ~ 255 */
    HI_U32 osd_invs_mode;       /* 0 ~ 1 */

} VeduEfl_OsdAttr_S;

typedef struct
{
    HI_S32 ICatchEnable;
	HI_S32 PrependSpsPpsEnable;
	HI_S32 AutoSkipFrameEn;
	HI_U32 DriftRcSkipThr;
    HI_S32 FrmCnt;
    /* channel parameter */
    HI_U32 Protocol;
    HI_U32  H264CabacEn;
    HI_U32  H264HpEn;

    HI_U32 YuvStoreType;
    HI_U32 YuvSampleType;
    HI_U32 RotationAngle;
    //HI_U32 FixedQP;
    HI_U32  MaskIntEn;          /* 0: interrupt mode, 1: query mode */                         //                                                                     //32->8
    HI_U8  Priority;
    HI_BOOL QuickEncode;
    HI_BOOL OMXChn;

    /* stream buffer parameter */
    VENC_BUFFER_S StreamMMZBuf;

    HI_U32*         StrmBufRpVirAddr; /* phy addr for hardware */
    HI_U32*         StrmBufWpVirAddr;
    HI_U32          Vir2BusOffset; /* offset = vir - bus, @ stream buffer */
    VALG_CRCL_BUF_S stCycBuf;
    HI_VOID*        pStrmBufLock; /* lock stream buffer */

    /* header parameter */
    HI_U8  VpsStream[64],  tempVpsStream[64];
    HI_U8  SpsStream[64],  tempSpsStream[64];
    HI_U8  PpsStream[320], tempPpsStream[32];
    HI_U32 VpsBits;
    HI_U32 SpsBits;
    HI_U32 PpsBits;
    HI_BOOL IsProgressive;

    HI_U32 H263SrcFmt;         /* 1 ~ 6 */

    /*header for jpge*/
#ifdef VENC_SUPPORT_JPGE
    HI_U8   pJfifHdr[698];
    HI_U8   pJpgeYqt[64];
    HI_U8   pJpgeCqt[64];
    HI_U32  QLevel;
    volatile HI_U32  WaitingIsr_jpge;         /* to block STOP channel */
#endif

    /* other parameter */
    volatile HI_U32  WaitingIsr;         /* to block STOP channel */
    HI_BOOL bNeverEnc;
    HI_BOOL bFirstNal2Send;    /*for omx_venc send output buffer flags*/

    /* read back reg */
    HI_U32 PicBits;
    HI_U32 TotalMbhBits;
    HI_U32 TotalTxtBits;
    HI_U32 TotalTxtCost0;
    HI_U32 TotalTxtCost1;

    HI_U32  Timer;
    HI_U32  IdleTimer;

    HI_U32  CfgErrIndex;
    HI_U32  IntraCloseCnt;
    HI_U32  FracCloseCnt;
    HI_U32  IntpSearchCnt;
    /* sequence rate control in */
    HI_U32 Gop;
    HI_U32 VBRflag;    /* fixed now...todo */
    HI_U32 PicLevel;
    HI_U32  SkipFrameEn;                                                                      //
    //HI_U32 VBR_MinQp;
    HI_U32 MaxPPdelta;
    HI_U32 MaxIPdelta;

    /* frame rate control out */
    HI_U32      TrCount;
    HI_U32      LastTR;
    HI_U32      InterFrmCnt;

    Vedu_Hal_S stHal;
#if PARA_ADAPT_ENCODER
    Vedu_EncPara_Table_S stEncParaTable[2];
#endif
    /* rate control mid */
    VALG_FIFO_S stBitsFifo;
    HI_U32      MeanBit;
	HI_U32      BitsFifo[FrmRateCntBufNum];   
    VeduEfl_Rc_S stRc;        //add by ckf77439  new version

    /* frame rate control mid */
    HI_U32      LastFrmRate[6];	  /*from the struction of Image*/
    HI_U32      LastSecInputFrmRate[2];   /* from Timer stat.*/
    HI_S32  bMorePPS;
    HI_S32  ChrQpOffset;
    HI_S32  ConstIntra;
    HI_S32  CabacInitIdc;
    HI_S32  CabacStuffEn;

    HI_S32  DblkIdc;
    HI_S32  DblkAlpha;
    HI_S32  DblkBeta;

    HI_S32  IPCMPredEn;
    HI_S32  Intra4x4PredEn;
    HI_S32  Intra8x8PredEn;
    HI_S32  Intra16x16PredEn;
    HI_S32  I4ReducedModeEn;

    HI_S32  Inter8x8PredEn;
    HI_S32  Inter8x16PredEn;
    HI_S32  Inter16x8PredEn;
    HI_S32  Inter16x16PredEn;
    HI_S32  PskipEn;
    HI_S32  ExtedgeEn;
    HI_S32  TransMode;
    HI_S32  NumRefIndex;

    HI_S32  PixClipEn;
    HI_S32  LumaClipMin;
    HI_S32  LumaClipMax;
    HI_S32  ChrClipMin;
    HI_S32  ChrClipMax;


    HI_S32  HSWSize;
    HI_S32  VSWSize;
    HI_S32  RectMod   [6];
    HI_S32  RectWidth [6];
    HI_S32  RectHeight[6];
    HI_S32  RectHstep [6];
    HI_S32  RectVstep [6];
    HI_S32  StartThr1;
    HI_S32  StartThr2;
    HI_S32  IntraThr;
    HI_S32  LmdaOff16;
    HI_S32  LmdaOff1608;
    HI_S32  LmdaOff0816;
    HI_S32  LmdaOff8;
    HI_S32  CrefldBur8En;
    HI_S32  MdDelta;


#if ((defined VENC_98MV200_CONFIG)|(defined VENC_96MV200_CONFIG))
    //csc parameter
    HI_S32 csc_mode;  /*0: disable 1:601->709 2:709->601*/
    //HI_S32 csc_en;
    HI_S32 csc00;
    HI_S32 csc01;
    HI_S32 csc02;
    HI_S32 csc10;
    HI_S32 csc11;
    HI_S32 csc12;
    HI_S32 csc20;
    HI_S32 csc21;
    HI_S32 csc22;
    HI_S32 cscin0;
    HI_S32 cscin1;
    HI_S32 cscin2;
    HI_S32 cscout0;
    HI_S32 cscout1;
    HI_S32 cscout2;
    /****************************************  end  *****************************************/
#endif
#if (defined(VENC_98MV200_CONFIG) || defined(VENC_96MV200_CONFIG) )
   //add for smmu config
   HI_S32 ch00_rrmax;
   HI_S32 ch01_rrmax;
   HI_S32 ch02_rrmax;
   HI_S32 ch03_rrmax;
   HI_S32 ch04_rrmax;
   HI_S32 ch05_rrmax;
   HI_S32 ch06_rrmax;
   HI_S32 ch07_rrmax;
   HI_S32 ch08_rrmax;
   HI_S32 ch09_rrmax;
   HI_S32 ch10_rrmax;
   HI_S32 ch11_rrmax;
   HI_S32 ch12_rrmax;
   
   HI_S32 ch00_wrmax;
   HI_S32 ch01_wrmax;
   HI_S32 ch02_wrmax;
   HI_S32 ch03_wrmax;
   HI_S32 ch04_wrmax;
   HI_S32 ch05_wrmax;
   HI_S32 ch06_wrmax;
   HI_S32 ch07_wrmax;
   HI_S32 ch08_wrmax;
   HI_S32 ch09_wrmax;
   HI_S32 ch10_wrmax;
   HI_S32 ch11_wrmax;
   HI_S32 ch12_wrmax;
   HI_S32 ch13_wrmax;
   HI_S32 ch14_wrmax;   

   HI_S32 wtmax;   
   HI_S32 rtmax;   

   HI_S32 secure_en;

   HI_S32 vcpi_srcc_bypass;
   HI_S32 vcpi_rcny_bypass;
   HI_S32 vcpi_rcnc_bypass;

   //HI_S32 ptw_pf;
   
   HI_S32 auto_clk_gt_en;
#endif

    HI_S32  StartQpType;
    HI_S32  RcQpDelta;
    HI_S32  RcMadpDelta;
    HI_S32  RcQpDeltaThr[12];
    HI_S32  ModLambda[40];
    HI_S32  Scale8x8[128];

    HI_S32  IntraLowpowEn;   /* register of low power work mode */
    HI_S32  fracLowpowEn;
    HI_S32  intpLowpowEn;
    HI_S32  fracRealMvThr;

    HI_S32  RegLockEn;
    HI_S32  OutStdNum;
    
    HI_S32  IMbNum;
    HI_S32  StartMb;
    VeduEfl_OsdAttr_S OsdCfg;

    /* attach vi or vo ,backup for vpss*/
    VeduEfl_SrcInfo_S     stSrcInfo;
    HI_DRV_VIDEO_FRAME_S  stImage;
    venc_user_buf         stImage_OMX;

    /* statistic */
    VeduEfl_StatInfo_S stStat;

#if 0
    VALG_CRCL_QUE_BUF_S stCycQueBuf;      //add
#else
    queue_info_s *FrameDequeue;
    queue_info_s *FrameQueue;
#endif
    queue_info_s *MsgQueue_OMX;
    queue_info_s *StreamQueue_OMX;
    queue_info_s *FrameQueue_OMX;

    HI_U32 KernelVirAddr[6];
    VENC_BUFFER_S JpgMMZBuf;

    HI_S32 RcDbgPrint;
} VeduEfl_EncPara_S;

typedef struct
{
    HI_U32 BusViY;      /* 16-byte aligned  */
    HI_U32 BusViC;      /* 16-byte aligned  */
    HI_U32 BusViV;
    HI_U32 ViYStride;   /* 16-byte aligned  */
    HI_U32 ViCStride;   /* 16-byte aligned  */

    HI_U32 PTS0;
    HI_U32 PTS1;
    //ADD
    HI_U32   RStrideY;      /* 16-byte aligned  */
    HI_U32   RStrideC;      /* 16-byte aligned  */
    HI_U32   TunlCellAddr;
} VeduEfl_EncIn_S;

typedef struct
{
    VeduEfl_EncPara_S *EncHandle;
} VeduEfl_ChnCtx_S;

typedef struct
{
    HI_U32   IpFree;       /* for channel control */
    VeduEfl_EncPara_S *CurrHandle;   /* used in ISR */
    HI_U32  *pRegBase;
    HI_VOID *pChnLock;     /* lock ChnCtx[MAX_CHN] */
    //HI_VOID *pTask;

    HI_VOID *pTask_Frame;        //for both venc & omxvenc
    HI_VOID *pTask_Stream;       //juse for omxvenc
    HI_U32   StopTask;
    HI_U32   TaskRunning;  /* to block Close IP */
    HI_S32   CurrFreq;     /* for record the current frequency*/
} VeduEfl_IpCtx_S;

HI_S32	VENC_DRV_EflOpenVedu(HI_VOID);
HI_VOID	VENC_DRV_EflCloseVedu(HI_VOID);
HI_S32	VENC_DRV_EflCreateVenc(VeduEfl_EncPara_S **pEncHandle, VeduEfl_EncCfg_S *pEncCfg);
HI_S32	VENC_DRV_EflDestroyVenc(VeduEfl_EncPara_S *EncHandle );
HI_S32	VENC_DRV_EflAttachInput(VeduEfl_EncPara_S *EncHandle, VeduEfl_SrcInfo_S *pSrcInfo);
HI_S32	VENC_DRV_EflDetachInput(VeduEfl_EncPara_S *EncHandle, VeduEfl_SrcInfo_S *pSrcInfo);
HI_S32	VENC_DRV_EflStartVenc(VeduEfl_EncPara_S *EncHandle);
HI_S32	VENC_DRV_EflStopVenc(VeduEfl_EncPara_S *EncHandle);
HI_S32	VENC_DRV_EflRcGetAttr(VeduEfl_EncPara_S *EncHandle, VeduEfl_RcAttr_S *pRcAttr);
HI_S32	VENC_DRV_EflRcAttrInit(VeduEfl_EncPara_S *EncHandle, VeduEfl_RcAttr_S *pRcAttr);
HI_S32  VENC_DRV_EflRcSetAttr(VeduEfl_EncPara_S *EncHandle, VeduEfl_RcAttr_S *pRcAttr);
HI_S32	VENC_DRV_EflRcFrmRateCtrl(VeduEfl_EncPara_S *EncHandle, HI_U32 TR);
HI_S32	VENC_DRV_EflStartOneFrameVenc(VeduEfl_EncPara_S *EncHandle, VeduEfl_EncIn_S *pEncIn);
HI_S32	VENC_DRV_EflEndOneFrameVenc(VeduEfl_EncPara_S *EncHandle);
HI_VOID	VENC_DRV_EflRequestIframe(VeduEfl_EncPara_S *EncHandle);
HI_S32	VENC_DRV_EflSetResolution(VeduEfl_EncPara_S *EncHandle, HI_U32 FrameWidth, HI_U32 FrameHeight);
HI_S32	VENC_DRV_EflResumeVedu(HI_VOID);
HI_S32	VENC_DRV_EflGetBitStream(VeduEfl_EncPara_S *EncHandle, VeduEfl_NALU_S *pNalu );
HI_S32	VENC_DRV_EflSkpBitStream(VeduEfl_EncPara_S *EncHandle, VeduEfl_NALU_S *pNalu );
HI_S32	VENC_DRV_EflQueryStatInfo(VeduEfl_EncPara_S *EncHandle, VeduEfl_StatInfo_S *pStatInfo);
HI_U32	VENC_DRV_EflGetStreamLen(VeduEfl_EncPara_S *EncHandle );
HI_S32  VENC_DRV_EflQueueFrame(VeduEfl_EncPara_S *EncHandle, HI_DRV_VIDEO_FRAME_S * pstFrame);
HI_S32  VENC_DRV_EflDequeueFrame(VeduEfl_EncPara_S *EncHandle, HI_DRV_VIDEO_FRAME_S * pstFrame);
HI_S32  VENC_DRV_EflGetImage(HI_S32 EncUsrHandle, HI_DRV_VIDEO_FRAME_S *pstFrame);
HI_S32  VENC_DRV_EflGetImage_OMX(HI_S32 EncUsrHandle, venc_user_buf *pstFrame);
HI_S32  VENC_DRV_EflPutImage(HI_S32 EncUsrHandle, HI_DRV_VIDEO_FRAME_S *pstFrame);

HI_S32  VENC_DRV_EflCfgRegVenc(VeduEfl_EncPara_S *EncHandle);
HI_VOID VENC_DRV_EflSortPriority(HI_VOID);

HI_VOID VENC_DRV_EflWakeUpThread(HI_VOID);

HI_S32 VENC_DRV_EflQFrameByAttach(HI_U32 EncUsrHandle, HI_DRV_VIDEO_FRAME_S *pstFrame);
HI_S32 VENC_DRV_EflRlsAllFrame(VeduEfl_EncPara_S *EncHandle);

HI_S32 VENC_DRV_DbgWriteYUV(HI_DRV_VIDEO_FRAME_S *pstFrame,HI_CHAR *pFileName);
HI_VOID VENC_DRV_EflSuspendVedu(HI_VOID);
HI_S32 VENC_DRV_EflFlushStrmHeader(VeduEfl_EncPara_S  *pEncPara);

HI_S32 VENC_DRV_EflAllocBuf2Jpge(VeduEfl_EncPara_S *EncHandle, HI_U32 CapLevel);
HI_S32 VENC_DRV_EflFreeBuf2Jpge(VeduEfl_EncPara_S *EncHandle);
	
/*************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif //__DRV_VENC_EFL_H__
