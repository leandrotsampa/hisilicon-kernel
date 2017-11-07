
#include "vfmw_log.h"
#include "row_map_table.h"
#include "yuv_convert.h"
#include "vfmw_osal_ext.h"


/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VOID IMAGE_TileTo2D(YUV_PARAM_S *pYuvParam, UINT32 Width, UINT32 Height, YUV_ADDR_S *pYuvAddr)
{
    UINT32 i = 0, j = 0;
    UINT8 *dst, *src;
    UINT32 Stride = 0;
    UINT32 srcIdx, dstIdx;
    UINT32 tileX, tileY;
    UINT8* src2b, *dst2b;
    UINT32 Stride_2b;
    UINT8 TileHeight_2b;

    Stride = pYuvParam->Stride;
    Stride_2b = pYuvParam->Stride_nbit;

    TileHeight_2b = 32;

    for (i = 0; i < Height; i++)
    {
	for (j = 0; j < Width; j += 64)
	{
	    if (pYuvParam->RealBitDepth == 10)
	    {
		dst2b = (unsigned char*)(pYuvAddr->pYAddr_nbit + (Width / 4) * i + (j / 4));
		tileX = (j / 64) % 4;
		srcIdx = i % TileHeight_2b;
		dstIdx = g_RowMapTable_Y_2b[tileX][srcIdx];
		src2b = pYuvParam->Yaddress_nbit + Stride_2b * (i / TileHeight_2b) + (dstIdx * 64 + (j / 64) * 64 * TileHeight_2b) / 4;
		OSAL_FP_memcpy(dst2b, src2b, 64 / 4);

	    }

	    dst	 = (unsigned char*)(pYuvAddr->pYAddr_8bit + Width * i + j);
	    tileY = (i / 16) % 2;
	    tileX = (j / 64) % 4;
	    srcIdx = i % 16;
	    dstIdx = g_RowMapTable_Y[tileY][tileX][srcIdx];
	    src =  pYuvParam->Yaddress_8bit + Stride * (i / 16) + dstIdx * 64 + (j / 64) * 64 * 16;
	    OSAL_FP_memcpy(dst, src, 64);

	}
    }

    /* restore uv data */
    for (i = 0; i < Height / 2; i++)
    {
	for (j = 0; j < Width; j += 64)
	{
	    if (pYuvParam->RealBitDepth == 10)
	    {
		dst2b = (unsigned char*)(pYuvAddr->pCAddr_nbit + (Width / 4) * i + (j / 4));
		srcIdx = i % (TileHeight_2b / 2);
		dstIdx = g_RowMapTable_UV_2b[srcIdx];
		src2b = pYuvParam->Caddress_nbit + (Stride_2b / 2) * (i / (TileHeight_2b / 2)) + (dstIdx * 64 + (j / 64) * 64 * (TileHeight_2b / 2)) / 4;
		OSAL_FP_memcpy(dst2b, src2b, 64 / 4);
	    }

	    dst	 = (unsigned char*)(pYuvAddr->pCAddr_8bit + Width * i + j);
	    tileY = (i / 8) % 2;
	    tileX = (j / 64) % 4;
	    srcIdx = i % 8;
	    dstIdx = g_RowMapTable_UV[tileY][tileX][srcIdx];
	    src =  pYuvParam->Caddress_8bit + (Stride / 2) * (i / 8) + dstIdx * 64 + (j / 64) * 64 * 8;
	    OSAL_FP_memcpy(dst, src, 64);

	}
    }

    return;
}

VOID IMAGE_LinearTo2D(YUV_PARAM_S *pYuvParam, UINT32 Width, UINT32 Height, YUV_ADDR_S *pYuvAddr)
{
    UINT32 i = 0, j = 0;
    UINT8 *dst, *src;
    UINT32 Stride = 0;
    UINT32 srcIdx, dstIdx;
    UINT32 tileX;
    UINT8* src2b, *dst2b;
    UINT32 Stride_2b;
    UINT8 TileHeight_2b;

    Stride = pYuvParam->Stride;
    Stride_2b = pYuvParam->Stride_nbit;

    TileHeight_2b = 32;

    for (i = 0; i < Height; i++)
    {
	if (pYuvParam->RealBitDepth == 10)
	{
	    for (j = 0; j < Width; j += 64)
	    {
		dst2b = (unsigned char*)(pYuvAddr->pYAddr_nbit + (Width / 4) * i + (j / 4));
		tileX = (j / 64) % 4;
		srcIdx = i % TileHeight_2b;
		dstIdx = g_RowMapTable_Y_2b[tileX][srcIdx];
		src2b = pYuvParam->Yaddress_nbit + Stride_2b * (i / TileHeight_2b) + (dstIdx * 64 + (j / 64) * 64 * TileHeight_2b) / 4;
		OSAL_FP_memcpy(dst2b, src2b, 64 / 4);
	    }
	}

	dst  = (unsigned char*)(pYuvAddr->pYAddr_8bit + Width * i);
	src =  pYuvParam->Yaddress_8bit + (pYuvParam->Stride / 16) * i;
	OSAL_FP_memcpy(dst, src, Width);
    }

    for (i = 0; i < Height / 2; i++)
    {
	if (pYuvParam->RealBitDepth == 10)
	{
	    for (j = 0; j < Width; j += 64)
	    {
		dst2b = (unsigned char*)(pYuvAddr->pCAddr_nbit + (Width / 4) * i + (j / 4));
		srcIdx = i % (TileHeight_2b / 2);
		dstIdx = g_RowMapTable_UV_2b[srcIdx];
		src2b = pYuvParam->Caddress_nbit + (Stride_2b / 2) * (i / (TileHeight_2b / 2)) + (dstIdx * 64 + (j / 64) * 64 * (TileHeight_2b / 2)) / 4;
		OSAL_FP_memcpy(dst2b, src2b, 64 / 4);
	    }
	}
	dst  = (unsigned char*)(pYuvAddr->pCAddr_8bit + Width * i);
	src =  pYuvParam->Caddress_8bit + (pYuvParam->Stride / 16) * i;
	OSAL_FP_memcpy(dst, src, Width);
    }

    return;
}

/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VOID IMAGE_ConvertTo2D(YUV_PARAM_S *pYuvParam, UINT32 Width, UINT32 Height, YUV_ADDR_S *pYuvAddr)
{
    if(pYuvParam->Is1D == 1)
    {
	IMAGE_TileTo2D(pYuvParam, Width, Height, pYuvAddr);
    }
    else
    {
	IMAGE_LinearTo2D(pYuvParam, Width, Height, pYuvAddr);
    }

    return;
}
