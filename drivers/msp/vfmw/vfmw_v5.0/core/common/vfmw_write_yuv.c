
#include "vfmw_log.h"
#include "vfmw_write_yuv.h"
#include "mem_manage.h"
#include "yuv_convert.h"
#include "vfmw_osal_ext.h"


/*------------------------------EXTERNAL VALUE--------------------------------*/
extern UINT32 g_SaveYUVBitWidth;//default to save 8bit YUV
extern UINT8  *pY, *pUl, *pVl, *pY_2bit, *pUl_2bit, *pVl_2bit;
extern UINT16 *pPixelArray;
extern VOID *vfmw_save_yuv_file[32];
extern VOID *vfmw_save_metadata_reorder_file[32];


/*----------------------------INTERNAL FUNCTION-------------------------------*/
VOID  YUV_DumpFrame_Cmp(VOID *fpYuv, UINT8 *Yaddress, UINT8 *Caddress, UINT32 Width, UINT32 Height, UINT32 PicStructure,
		    UINT32 y_stride, UINT32 uv_stride, UINT32 y_comp_ratio , UINT32 uv_comp_ratio, UINT32 chroma_idc, UINT32 bit_depth_luma, UINT32 bit_depth_chroma, UINT32 loss_compress_en, SINT32 StdType)
{
    dprint(PRN_ALWS, "%s not support now.\n", __func__);

    return;
}

static SINT32 YUV_WriteFile(VOID *fpYuv, UINT32 Width, UINT32 Height, YUV_PARAM_S *pYuvParam, YUV_ADDR_S *pYuvAddr)
{
    UINT32 i ,j;
    UINT8 *tmp;

    /* Y */
    if (pYuvParam->SaveBitDepth == 10)
    {
	for (i = 0; i < Width * Height; i += 4)
	{
	    pPixelArray[i + 0] = (((UINT16)(pYuvAddr->pYAddr_8bit[i + 0])) << 2) + (((pYuvAddr->pYAddr_nbit[i >> 2]) >> 0) & 0x03);
	    pPixelArray[i + 1] = (((UINT16)(pYuvAddr->pYAddr_8bit[i + 1])) << 2) + (((pYuvAddr->pYAddr_nbit[i >> 2]) >> 2) & 0x03);
	    pPixelArray[i + 2] = (((UINT16)(pYuvAddr->pYAddr_8bit[i + 2])) << 2) + (((pYuvAddr->pYAddr_nbit[i >> 2]) >> 4) & 0x03);
	    pPixelArray[i + 3] = (((UINT16)(pYuvAddr->pYAddr_8bit[i + 3])) << 2) + (((pYuvAddr->pYAddr_nbit[i >> 2]) >> 6) & 0x03);
	}
	tmp = (UINT8 *)pPixelArray;
    }
    else
    {
	tmp = pYuvAddr->pYAddr_8bit;
    }

    /* Write file */
    if (pYuvParam->SaveBitDepth == 10)
    {
	OSAL_FP_fwrite(tmp, Width * Height * 2, fpYuv);
    }
    else
    {
	OSAL_FP_fwrite(tmp, Width * Height, fpYuv);
    }

    /* UV */
    if (pYuvParam->SaveBitDepth == 10)
    {
	for (i = 0; i < Width * Height; i += 4)
	{
	    pPixelArray[i + 0] = (((UINT16)(pYuvAddr->pCAddr_8bit[i + 0])) << 2) + (((pYuvAddr->pCAddr_nbit[i >> 2]) >> 0) & 0x03);
	    pPixelArray[i + 1] = (((UINT16)(pYuvAddr->pCAddr_8bit[i + 1])) << 2) + (((pYuvAddr->pCAddr_nbit[i >> 2]) >> 2) & 0x03);
	    pPixelArray[i + 2] = (((UINT16)(pYuvAddr->pCAddr_8bit[i + 2])) << 2) + (((pYuvAddr->pCAddr_nbit[i >> 2]) >> 4) & 0x03);
	    pPixelArray[i + 3] = (((UINT16)(pYuvAddr->pCAddr_8bit[i + 3])) << 2) + (((pYuvAddr->pCAddr_nbit[i >> 2]) >> 6) & 0x03);
	}

	tmp = (UINT8 *)pPixelArray;
    }
    else
    {
	tmp = pYuvAddr->pCAddr_8bit;
    }

    for (i = 0; i < Height / 2; i++)
    {
	if (pYuvParam->SaveBitDepth == 10)
	{
	    for (j = 0; j < Width / 2; j++)
	    {
		*(UINT16*)(pVl+ (i * Width / 2 + j) * 2) = *(UINT16*)(tmp + (2 * j) * 2);
		*(UINT16*)(pUl+ (i * Width / 2 + j) * 2) = *(UINT16*)(tmp + (2 * j + 1) * 2);
	    }

	    tmp += Width * 2;

	}
	else
	{
	    for (j = 0; j < Width / 2; j++)
	    {
		pVl[i * Width / 2 + j] = tmp[2 * j];
		pUl[i * Width / 2 + j] = tmp[2 * j + 1];

	    }

	    tmp += Width;
	}
    }

    /* Write file */
    if (pYuvParam->SaveBitDepth == 10)
    {
	OSAL_FP_fwrite(pUl, Width * Height / 2, fpYuv);
	OSAL_FP_fwrite(pVl, Width * Height / 2, fpYuv);
    }
    else
    {
	OSAL_FP_fwrite(pUl, Width * Height / 4, fpYuv);
	OSAL_FP_fwrite(pVl, Width * Height / 4, fpYuv);
    }

    return VDEC_OK;
}

VOID YUV_DumpFrame_Tile(VOID *fpYuv, UINT8 *Yaddress, UINT8 *Caddress, UINT32 Width, UINT32 Height, UINT32 PicStructure, UINT32 Stride, UINT32 ChromaIDC,
			SINT32 StdType, SINT32 RealBitDepth, SINT32 SaveBitDepth, IMAGE *pImage)
{
    SINT32 SlotWidth = 0;
    SINT32 SlotHeight = 0;
    SINT32 SlotWidth_nbit = 0;
    SINT32 SlotHeight_nbit = 0;
    UINT8 *Yaddress_2bit, *Caddress_2bit;
    YUV_ADDR_S YuvAddr = {0};
    YUV_PARAM_S YuvParam = {0};

    if (fpYuv == NULL)
    {
	return;
    }

    switch (StdType)
    {
	case STD_VP6:
	case STD_VP6A:
	case STD_VP6F:
	case STD_VP8:
	case STD_VC1:
	case STD_MPEG4:
	    Width = (Width + 15) / 16 * 16;
	    Height = (Height + 15) / 16 * 16;
	    break;
	case STD_VP9:
	    Width = (Width + 7) / 8 * 8;
	    Height = (Height + 7) / 8 * 8;
	    break;
	default:
	    break;
    }

    SlotWidth = (Width + ((4 * 64) - 1)) & (~((4 * 64) - 1));

    if (StdType == STD_HEVC)
    {
	SlotHeight = Height;

	if (RealBitDepth > 8)
	{
	    SlotWidth_nbit = SlotWidth / 4;
	    SlotHeight_nbit = (SlotHeight + 31) & (~31);
	}
    }
    else if (StdType == STD_VP9 || StdType == STD_AVS2)
    {
	SlotHeight = (Height + 63) & (~63);

	if (RealBitDepth > 8)
	{
	    SlotWidth_nbit = SlotWidth / 4;
	    SlotHeight_nbit = (SlotHeight + 63) & (~(63));
	}
    }
    else
    {
	SlotHeight = (Height + 31) & (~31);
    }

    if (pImage->bit_depth_luma == 10)
    {
	Yaddress_2bit = Yaddress + SlotWidth * SlotHeight * 3 / 2;
	Caddress_2bit = Yaddress_2bit + SlotWidth_nbit * SlotHeight_nbit;
    }
    else
    {
	Yaddress_2bit = NULL;
	Caddress_2bit = NULL;
    }

    YuvAddr.pYAddr_8bit= pY;
    YuvAddr.pCAddr_8bit = YuvAddr.pYAddr_8bit + (MAX_DUMP_FRAME_SIZE * 2 / 3);
    YuvAddr.pYAddr_nbit = pY_2bit;
    YuvAddr.pCAddr_nbit = YuvAddr.pYAddr_nbit + (MAX_DUMP_FRAME_SIZE * 2 / 3);
    YuvParam.Yaddress_8bit = Yaddress;
    YuvParam.Yaddress_nbit = Yaddress_2bit;
    YuvParam.Caddress_8bit = Caddress;
    YuvParam.Caddress_nbit = Caddress_2bit;
    YuvParam.Stride = pImage->y_stride;

    YuvParam.Stride_nbit = pImage->image_stride_2bit;
    YuvParam.RealBitDepth = (pImage->bit_depth_luma != 0)? pImage->bit_depth_luma: 8;
    YuvParam.Is1D = (pImage->format.linear_en) ? 0 : 1;
    YuvParam.SaveBitDepth = (SaveBitDepth > YuvParam.RealBitDepth)? 8: SaveBitDepth;

    IMAGE_ConvertTo2D(&YuvParam, Width, Height, &YuvAddr);

    if (YUV_WriteFile(fpYuv, Width, Height, &YuvParam, &YuvAddr) == VDEC_OK)
    {
	OSAL_FP_print("%s: Width=%d, Height=%d, Stride=%d, PicStructure=%d, ChromaIDC=%d, RealBitDepth=%d, SaveBitDepth=%d\n",
		      __func__, Width, Height, Stride, PicStructure, ChromaIDC, YuvParam.RealBitDepth, YuvParam.SaveBitDepth);
    }

    return;
}

/*------------------------- EXTERNAL FUNCTION -------------------------*/
SINT32 YUV_DumpImage(SINT32 ChanID, IMAGE *pImage)
{
    UINT32 chroma_idc;
    UINT8  *luma_vir_addr = NULL;
    UINT8  *chrom_vir_addr = NULL;
    MEM_RECORD_S stMemBuf = {0};

    if (vfmw_save_yuv_file[ChanID])
    {
	chroma_idc = (pImage->format.sample_type == 0) ? 1 : 0;

	if ((NULL == pImage->luma_vir_addr) || (NULL == pImage->chrom_vir_addr))
	{
	    stMemBuf.PhyAddr = pImage->top_luma_phy_addr;
	    luma_vir_addr = OSAL_FP_mmap(&stMemBuf);
	    if (luma_vir_addr == NULL)
	    {
		dprint(PRN_ALWS," luma_vir_addr MAP return error\n");
	    }
	    else
	    {
		chrom_vir_addr = luma_vir_addr + (pImage->top_chrom_phy_addr - pImage->top_luma_phy_addr);
	    }
	}
	else
	{
	    luma_vir_addr =  (UINT8 *)((ULONG)pImage->luma_vir_addr);
	    chrom_vir_addr = (UINT8 *)((ULONG)pImage->chrom_vir_addr);
	}

	if ((luma_vir_addr != NULL) && (chrom_vir_addr != NULL))
	{
	    if (pImage->CompressEn)
	    {
		dprint(PRN_ALWS, "Not support compress yuv dump\n");
	    }
	    else
	    {
		YUV_DumpFrame_Tile(vfmw_save_yuv_file[ChanID], luma_vir_addr, chrom_vir_addr,
		pImage->image_width,   pImage->image_height, 0,
		pImage->y_stride,  chroma_idc,
		pImage->eVidStd,
		pImage->bit_depth_luma,g_SaveYUVBitWidth, pImage);
	    }
	    OSAL_FP_unmap(luma_vir_addr);
	}
    }

#ifdef DOLBY_VISION_HDR_SUPPORT
    if ( vfmw_save_metadata_reorder_file[ChanID])
    {
	if (HI_NULL != pImage->stHDRInput.HDR_Metadata_vir_addr && pImage->stHDRInput.HDR_Metadata_size > 0)
	{
	    OSAL_FP_fwrite(UINT64_PTR(pImage->stHDRInput.HDR_Metadata_vir_addr), pImage->stHDRInput.HDR_Metadata_size, vfmw_save_metadata_reorder_file[ChanID]);
	}
    }
#endif

    return VDEC_OK;
}
