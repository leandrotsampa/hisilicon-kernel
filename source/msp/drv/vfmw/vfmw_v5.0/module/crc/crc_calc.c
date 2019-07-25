
#include "public.h"
#include "crc_calc.h"
#include "vfmw_osal_ext.h"
#include "yuv_convert.h"

/*--------------------------- INTERNAL VALUE --------------------------*/
#define MAX_CRC_YUV_SIZE    (4096*2304*3/2)
#define CALC_BUF_SIZE	    (MAX_CRC_YUV_SIZE*2)

static MEM_RECORD_S g_CalcMem;
static VBOOL g_IsCrcCalcInit = VDEC_FALSE;

typedef struct
{
    UINT8 *pCrcYAddr_8bit;
    UINT8 *pCrcYAddr_nbit;
    UINT8 *pCrcCAddr_8bit;
    UINT8 *pCrcCAddr_nbit;
    UINT32 CrcWidth;
    UINT32 CrcHeight;
    UINT32 CrcStride;

}CRC_CALC_PARAM_S;


/*------------------------- INTERNAL FUNCTION -------------------------*/
static VOID CRC_GetVirAddr(UADDR LumaPhy, UADDR ChromaPhy, UINT8 **ppLumaVir, UINT8 **ppChromaVir)
{

#ifdef ENV_SOS_KERNEL
    MEM_RECORD_S MemRec = {0};

    MemRec.eMode = MEM_MMU_MMU;
    MemRec.PhyAddr = LumaPhy;
    MemRec.Length  = (ChromaPhy - LumaPhy) * 3 / 2;;

    *ppLumaVir = OSAL_FP_mmap(&MemRec);
#else

    *ppLumaVir = (UINT8 *)MEM_Phy2Vir(LumaPhy);

#endif

    *ppChromaVir = *ppLumaVir + (ChromaPhy - LumaPhy);

    return;
}

static VOID CRC_RelseVirAddr(UADDR LumaPhy, UADDR ChromaPhy, UINT8 *pLumaVir, UINT8 *pChromaVir)
{
#ifdef ENV_SOS_KERNEL
    OSAL_FP_unmap(pLumaVir);
#endif

    return;
}

static UINT8* CRC_GetLinePointer(UINT32 i, UINT8 *pYAddr, UINT32 Stride, UINT8 BtmField)
{
    UINT8 *pPtr = NULL;

    if (BtmField == 0)
    {
	pPtr = pYAddr + (2 * i) * Stride;
    }
    else if (BtmField == 1)
    {
	pPtr = (pYAddr + Stride) + (2 * i) * Stride;
    }
    else
    {
	OSAL_FP_print("%s BtmField = %d err!!\n", __func__, BtmField);
    }

    return pPtr;
}

static SINT32 CRC_GetU32Crc(UINT32 j, UINT8 *LPointer)
{
    UINT32 u32Crc = 0;

    u32Crc = *((UINT32 *)(LPointer + j));

    return u32Crc;
}

static UINT32 CRC_CalcFieldCrc(UINT8 *pYAddr, UINT8 *pCAddr, UINT32 Width, UINT32 Height, UINT32 Stride, UINT8 BtmField)
{
    UINT32 i, j;
    UINT32 FrameCrc = 0;
    UINT32 ChromWidth = Width / 2;
    UINT32 ChromHeight = Height / 2;
    UINT32 Y_WidthDistance = Width / 8;
    UINT32 Y_HeightDistance = Height / 4;
    UINT32 ChromWidthDistance = Y_WidthDistance / 2;
    UINT32 ChromHeightDistance = Y_HeightDistance / 2;
    UINT8 *LPointer = NULL;

    while ((Y_WidthDistance % 8) != 0)
    {
	Y_WidthDistance--;
    }

    ChromWidthDistance = Y_WidthDistance / 2;
    ChromHeightDistance = Y_HeightDistance / 2;

    Y_WidthDistance = (Y_WidthDistance < 4) ? 4 : Y_WidthDistance;
    ChromWidthDistance = (ChromWidthDistance < 4) ? 4 : ChromWidthDistance;

    for (i = 0; i < Height ; i += Y_HeightDistance)
    {
	LPointer = CRC_GetLinePointer(i, pYAddr, Stride, BtmField);
	if (LPointer != NULL)
	{
	    for (j = 0; j < Width - 4; j += Y_WidthDistance)
	    {
		FrameCrc += CRC_GetU32Crc(j, LPointer);
	    }
	}
    }

    for (i = 0; i < ChromHeight; i += ChromHeightDistance)
    {
	LPointer = CRC_GetLinePointer(i, pCAddr, Stride, BtmField);
	if (LPointer != NULL)
	{
	    for (j = 0; j < 2 * ChromWidth - 4; j += ChromWidthDistance)
	    {
		FrameCrc += CRC_GetU32Crc(j, LPointer);
	    }
	}
    }

    return FrameCrc;
}

static VOID CRC_GetYuvParam(YUV_PARAM_S *pYuvParam, UINT8 *pYAddr, UINT8 *pCAddr, UINT8 *pYAddr_2bit, UINT8 *pCAddr_2bit, IMAGE *pImage, YUV_ADDR_S *pYuvAddr)
{
    pYuvAddr->pYAddr_8bit = g_CalcMem.VirAddr;
    pYuvAddr->pCAddr_8bit = pYuvAddr->pYAddr_8bit + (MAX_CRC_YUV_SIZE * 2 / 3);
    pYuvAddr->pYAddr_nbit = pYuvAddr->pYAddr_8bit + (CALC_BUF_SIZE / 2);
    pYuvAddr->pCAddr_nbit = pYuvAddr->pYAddr_nbit + (MAX_CRC_YUV_SIZE * 2 / 3);
    pYuvParam->Yaddress_8bit = pYAddr;
    pYuvParam->Caddress_8bit = pCAddr;
    pYuvParam->Yaddress_nbit = pYAddr_2bit;
    pYuvParam->Caddress_nbit = pCAddr_2bit;
    pYuvParam->Stride = pImage->y_stride;
    pYuvParam->Stride_nbit = pImage->image_stride_2bit;
    pYuvParam->RealBitDepth = (pImage->bit_depth_luma != 0)? pImage->bit_depth_luma: 8;
    pYuvParam->Is1D = (pImage->format.linear_en) ? 0 : 1;

    return;
}


static VOID CRC_GetCalcParam(UINT8 *pInYAddr, UINT8 *pInCAddr, UINT32 Width, UINT32 Height, CRC_CALC_PARAM_S *pCalcParam, YUV_ADDR_S *pYuvAddr)
{
    pCalcParam->pCrcYAddr_8bit= pYuvAddr->pYAddr_8bit;
    pCalcParam->pCrcYAddr_nbit= pYuvAddr->pYAddr_nbit;
    pCalcParam->pCrcCAddr_8bit= pYuvAddr->pCAddr_8bit;
    pCalcParam->pCrcCAddr_nbit= pYuvAddr->pCAddr_nbit;
    pCalcParam->CrcWidth  = Width;
    pCalcParam->CrcHeight = Height;
    pCalcParam->CrcStride = Width;

    return;
}

static VOID CRC_ConvertNV21toNV12(IMAGE *pImage, UINT8 *pCAddr)
{
    UINT32 i, j;
    UINT8 *pTmp;
    UINT8  TmpData;
    UINT32 Width, Height;

    Width  = ((pImage->image_width  + 15) / 16) * 16;
    Height = ((pImage->image_height + 15) / 16) * 16;

    pTmp = pCAddr;

    for (i=0; i < Height/2; i++)
    {
	for (j=0; j < Width/2; j++)
	{
	    TmpData = pTmp[2 * j];
	    pTmp[2 * j] = pTmp[2 * j + 1];
	    pTmp[2 * j + 1] =  TmpData;
	}

	pTmp += Width;
    }

    return;
}

static VOID CRC_AdjustParam(IMAGE *pImage, CRC_CALC_PARAM_S *pCalcParam)
{
    UINT32 DecWidth, DecHeight, DspWidth, DspHeight, OffsetY, OffsetC;

    DecWidth  = ((pImage->image_width  + 15) / 16) * 16;
    DecHeight = ((pImage->image_height + 15) / 16) * 16;
    OffsetY = pImage->top_offset * DecWidth + pImage->left_offset;
    OffsetC = (pImage->top_offset >> 1) * DecWidth + pImage->left_offset;

    DspWidth  = ((pImage->disp_width  + 15) / 16) * 16;
    DspHeight = ((pImage->disp_height + 15) / 16) * 16;

    pCalcParam->pCrcYAddr_8bit = pCalcParam->pCrcYAddr_8bit+ OffsetY;
    pCalcParam->pCrcCAddr_8bit = pCalcParam->pCrcCAddr_8bit+ OffsetC;
    pCalcParam->CrcWidth  = DspWidth;
    pCalcParam->CrcHeight = DspHeight;
    pCalcParam->CrcStride = DecWidth;

    return;
}

static VOID CRC_CalcYuvCrc_2bit(CRC_CALC_PARAM_S *pParam, UINT32 *pActCRC)
{
    pActCRC[0] = CRC_CalcFieldCrc(pParam->pCrcYAddr_nbit, pParam->pCrcCAddr_nbit, pParam->CrcWidth/4, pParam->CrcHeight/2, pParam->CrcStride/4, 0);
    pActCRC[1] = CRC_CalcFieldCrc(pParam->pCrcYAddr_nbit, pParam->pCrcCAddr_nbit, pParam->CrcWidth/4, pParam->CrcHeight/2, pParam->CrcStride/4, 1);

    return;
}


static VOID CRC_CalcYuvCrc_8bit(CRC_CALC_PARAM_S *pParam, UINT32 *pActCRC)
{
    pActCRC[0] = CRC_CalcFieldCrc(pParam->pCrcYAddr_8bit, pParam->pCrcCAddr_8bit, pParam->CrcWidth, pParam->CrcHeight/2, pParam->CrcStride, 0);
    pActCRC[1] = CRC_CalcFieldCrc(pParam->pCrcYAddr_8bit, pParam->pCrcCAddr_8bit, pParam->CrcWidth, pParam->CrcHeight/2, pParam->CrcStride, 1);

    return;
}

static VOID CRC_CalcActualCrc(IMAGE *pImage, UINT8 *pYAddr, UINT8 *pCAddr, UINT8 *pYAddr_2bit, UINT8 *pCAddr_2bit, UINT32 *pActCRC_8bit, UINT32 *pActCRC_2bit)
{
    UINT32 Width, Height;
    CRC_CALC_PARAM_S CalcParam = {0};
    YUV_ADDR_S YuvAddr = {0};
    YUV_PARAM_S YuvParam = {0};

    if (pImage->bit_depth_luma == 10)
    {
	Width  = ((pImage->image_width*2 + 15) / 16) * 16 / 2;
	Height = ((pImage->image_height + 15) / 16) * 16;
    }
    else
    {
	Width  = ((pImage->image_width	+ 15) / 16) * 16;
	Height = ((pImage->image_height + 15) / 16) * 16;
    }

    CRC_GetYuvParam(&YuvParam, pYAddr, pCAddr, pYAddr_2bit, pCAddr_2bit, pImage, &YuvAddr);

    IMAGE_ConvertTo2D(&YuvParam, Width, Height, &YuvAddr);

    CRC_GetCalcParam(pYAddr, pCAddr, Width, Height, &CalcParam, &YuvAddr);

    if (pImage->eVidStd == VFMW_HEVC)
    {
	/* 1 HEVC : According to NV12 format images
	    OTHER : According to NV21 format images */
	CRC_ConvertNV21toNV12(pImage, CalcParam.pCrcCAddr_8bit);

	/* 2 HEVC : According to display width and height
	    OTHER : According to decode	 width and height */
	CRC_AdjustParam(pImage, &CalcParam);
    }

    CRC_CalcYuvCrc_8bit(&CalcParam, pActCRC_8bit);

    if (pImage->bit_depth_luma == 10)
    {
	CRC_CalcYuvCrc_2bit(&CalcParam, pActCRC_2bit);
    }

    return;
}

SINT32 CRC_CalcViewCrc(IMAGE *pImage, UADDR LumaPhy, UADDR ChromaPhy, UADDR LumaPhy_2bit, UADDR ChromaPhy_2bit, UINT32 *pActCRC_8bit, UINT32 *pActCRC_2bit)
{
    UINT8 *pYAddr = NULL, *pCAddr = NULL;
    UINT8 *pYAddr_2bit = NULL, *pCAddr_2bit = NULL;

    CRC_GetVirAddr(LumaPhy, ChromaPhy, &pYAddr, &pCAddr);
    if (pYAddr == NULL || pCAddr == NULL)
    {
	OSAL_FP_print("%s get viraddr failed YPhy = 0x%x, CPhy = 0x%x\n", __func__, LumaPhy, ChromaPhy);
	return VDEC_ERR;
    }

    if (LumaPhy_2bit != 0)
    {
	CRC_GetVirAddr(LumaPhy_2bit, ChromaPhy_2bit, &pYAddr_2bit, &pCAddr_2bit);
	if (pYAddr_2bit == NULL || pCAddr_2bit == NULL)
	{
	    OSAL_FP_print("%s get 2bit viraddr failed YPhy = 0x%x, CPhy = 0x%x\n", __func__, LumaPhy_2bit, ChromaPhy_2bit);
	    return VDEC_ERR;
	}
    }

    CRC_CalcActualCrc(pImage, pYAddr, pCAddr, pYAddr_2bit, pCAddr_2bit, pActCRC_8bit, pActCRC_2bit);

    if (pYAddr_2bit != NULL)
    {
	CRC_RelseVirAddr(LumaPhy_2bit, ChromaPhy_2bit, pYAddr_2bit, pCAddr_2bit);
    }

    CRC_RelseVirAddr(LumaPhy, ChromaPhy, pYAddr, pCAddr);

#if 0
    OSAL_FP_print("Calc: ActualCRC_8bit = %x, %x\n", pActCRC_8bit[0], pActCRC_8bit[1]);

    if (pActCRC_2bit != NULL && LumaPhy_2bit != 0)
    {
	OSAL_FP_print("Calc: ActualCRC_2bit = %x, %x\n", pActCRC_2bit[0], pActCRC_2bit[1]);
    }
#endif

    return VDEC_OK;
}


/*------------------------- EXTERNAL FUNCTION -------------------------*/
SINT32 CRC_InitCalcEnvironment(VOID)
{
    VFMW_ASSERT_RETURN(g_IsCrcCalcInit == VDEC_FALSE, VDEC_ERR);

    OSAL_FP_memset(&g_CalcMem, 0, sizeof(g_CalcMem));

#ifdef HI_SMMU_SUPPORT
    g_CalcMem.eMode = MEM_MMU_MMU;
#else
    g_CalcMem.eMode = MEM_CMA_CMA;
#endif

    if (MEM_AllocMemBlock("CRC_CALC", 0, CALC_BUF_SIZE, &g_CalcMem, 1) != MEM_MAN_OK)
    {
	OSAL_FP_print("%s alloc calc mem size %d failed!\n", __func__, CALC_BUF_SIZE);
	return VDEC_ERR;
    }

    g_IsCrcCalcInit = VDEC_TRUE;

    return VDEC_OK;
}

SINT32 CRC_ExitCalcEnvironment(VOID)
{
    VFMW_ASSERT_RETURN(g_IsCrcCalcInit == VDEC_TRUE, VDEC_ERR);

    if (g_CalcMem.PhyAddr != 0)
    {
	MEM_ReleaseMemBlock(g_CalcMem.PhyAddr, g_CalcMem.VirAddr);
    }

    g_IsCrcCalcInit = VDEC_FALSE;

    return VDEC_OK;
}

SINT32 CRC_CalcImageCrc(IMAGE *pImage)
{
    SINT32 ret;

    VFMW_ASSERT_RETURN(g_IsCrcCalcInit == VDEC_TRUE, VDEC_ERR);
    VFMW_ASSERT_RETURN(pImage != NULL, VDEC_ERR);

    ret = CRC_CalcViewCrc(pImage, pImage->top_luma_phy_addr, pImage->top_chrom_phy_addr, pImage->luma_2bit_phy_addr, pImage->chrom_2bit_phy_addr, pImage->stCRCInfo.ActualCRC_8bit, pImage->stCRCInfo.ActualCRC_2bit);
    if (ret != VDEC_OK)
    {
	return VDEC_ERR;
    }

    if (pImage->is_3D == 1)
    {
	ret = CRC_CalcViewCrc(pImage, pImage->top_luma_phy_addr_1, pImage->top_chrom_phy_addr_1, 0, 0, pImage->stCRCInfo.ActualCRC_8bit_1, NULL);
	if (ret != VDEC_OK)
	{
	    return VDEC_ERR;
	}
    }

    return VDEC_OK;
}
