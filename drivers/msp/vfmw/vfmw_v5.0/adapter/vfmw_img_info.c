
#include "vfmw_log.h"
#include "hdr_info.h"
#include "pts_info.h"

/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VOID IMG_Info_Convert(SINT32 ChanID, IMAGE *pstImage)
{
    SINT32 Ret;

    Ret = HDR_Info_Convert(ChanID, pstImage);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s convert hdr info failed!\n", __func__);
    }

    Ret = PTS_Info_Convert(ChanID, pstImage);
    if (Ret != VDEC_OK)
    {
	dprint(PRN_ERROR, "%s convert pts info failed!\n", __func__);
    }

    return;
}

VOID IMG_Info_Init(VOID)
{
    HDR_Info_Init();
    PTS_Info_Init();

    return;
}

VOID IMG_Info_Exit(VOID)
{
    HDR_Info_Exit();
    PTS_Info_Exit();

    return;
}
