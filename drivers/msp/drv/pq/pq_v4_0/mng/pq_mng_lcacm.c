#include "hi_type.h"
#include "hi_debug.h"
#include "hi_drv_mem.h"
#include "hi_drv_file.h"
#include "hi_drv_pq.h"

#include "pq_hal_comm.h"
#include "pq_hal_lcacm.h"
#include "pq_mng_lcacm.h"


static HI_BOOL sg_bColorInitial = HI_FALSE;

static HI_BOOL sg_bColorEn      = HI_TRUE;
static HI_BOOL sg_bColorDemoEn  = HI_FALSE;
static PQ_DEMO_MODE_E sg_enMode = PQ_DEMO_ENABLE_R;

static LCACM_ENHANCE_E     sg_enLCAcmEnhance    = LCACM_ENHANCE_SPEC_COLOR_MODE;

static COLOR_SPEC_MODE_E sg_enColorSpecModeType = COLOR_MODE_RECOMMEND;

/* Init Color */
static HI_S32 PQ_MNG_LowCostACMParaInit(HI_VOID)
{
    PQ_HAL_ACM_PARA_S stAcmPara = {0};

    memset(&stAcmPara, 0x0, sizeof(stAcmPara));

    PQ_HAL_SetLowCostAcmPara(VDP_LAYER_VP0, &stAcmPara);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_EnableLowCostACM(HI_BOOL bOnOff)
{
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();

    sg_bColorEn = bOnOff;

    if ((enSourceMode < SOURCE_MODE_ALL)
        && (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_COLOR, enSourceMode)))
    {
        sg_bColorEn = HI_FALSE;
    }

    PQ_HAL_EnableACM(VDP_LAYER_VP0, sg_bColorEn);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetLowCostACMEnable(HI_U32 *pu32OnOff)
{
    PQ_CHECK_NULL_PTR(pu32OnOff);
    *pu32OnOff = sg_bColorEn;

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_InitLowCostACM(PQ_PARAM_S *pstPqParam, HI_BOOL bDefault)
{
    HI_S32 s32Ret = HI_FAILURE;


    if (sg_bColorInitial == HI_TRUE)
    {
        return HI_SUCCESS;
    }

    s32Ret = PQ_MNG_EnableLowCostACM(HI_TRUE);
    if (HI_FAILURE == s32Ret)
    {
        HI_ERR_PQ("LowCost ACM Enable Init failure\n");
        return HI_FAILURE;
    }

    s32Ret = PQ_MNG_LowCostACMParaInit();
    if (HI_FAILURE == s32Ret)
    {
        HI_ERR_PQ("LowCost ACM Para Init failure\n");
        return HI_FAILURE;
    }

    s32Ret = PQ_TABLE_InitPhyList(PQ_VDP_LAYER_VID0, HI_PQ_MODULE_COLOR, SOURCE_MODE_NO, SOURCE_MODE_NO);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("Low Cost ACM InitPhyList error\n");
        return HI_FAILURE;
    }

    sg_bColorInitial = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitLowCostACM(HI_VOID)
{
    if (sg_bColorInitial == HI_FALSE)
    {
        return HI_SUCCESS;
    }

    sg_bColorInitial = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_EnableLowCostACMDemo(HI_BOOL bOnOff)
{
    /* lcacm demo off for only support 50% pos */
    PQ_HAL_EnableACMDemo(VDP_LAYER_VP0, HI_FALSE);
    sg_bColorDemoEn = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetLowCostACMDemo(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR(pbOnOff);
    *pbOnOff = sg_bColorDemoEn;

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_SetLowCostACMDemoMode(PQ_DEMO_MODE_E enMode)
{
    PQ_HAL_LAYER_VP_E   u32ChId   = VDP_LAYER_VP0;
    HAL_ACM_DEMO_MODE_E enAcmMode = HAL_ACM_DEMO_ENABLE_L;

    sg_enMode = enMode;

    if (enMode == PQ_DEMO_ENABLE_L)
    {
        enAcmMode = HAL_ACM_DEMO_ENABLE_L;
    }
    else if (enMode == PQ_DEMO_ENABLE_R)
    {
        enAcmMode = HAL_ACM_DEMO_ENABLE_R;
    }

    PQ_HAL_SetACMDemoMode(u32ChId, enAcmMode);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetLowCostACMDemoMode(PQ_DEMO_MODE_E *penMode)
{
    PQ_CHECK_NULL_PTR(penMode);
    *penMode = sg_enMode;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetLowCostColorEnhanceMode(HI_U32 *pu32ColorEnhanceMode)
{
    PQ_CHECK_NULL_PTR(pu32ColorEnhanceMode);

    *pu32ColorEnhanceMode = sg_enColorSpecModeType;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetLowCostACMFleshToneLevel(HI_U32 *pu32FleshToneLevel)
{
    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetLowCostACMFleshToneLevel(HI_PQ_FLESHTONE_E enGainLevel)
{

    COLOR_SPEC_MODE_E ColorSpecMode = COLOR_MODE_RECOMMEND;
    PQ_HAL_ACM_PARA_S stAcmPara = {0};
    if (HI_PQ_FLESHTONE_GAIN_BUTT <= enGainLevel)
    {
        HI_ERR_PQ("[%d]Switch : Color enGainLevel Mode Set error!\n", enGainLevel);
        return HI_FAILURE;
    }

    if (enGainLevel == HI_PQ_FLESHTONE_GAIN_OFF)
    {
        sg_enLCAcmEnhance = LCACM_ENHANCE_SPEC_COLOR_MODE;
    }
    else
    {
        sg_enLCAcmEnhance = LCACM_ENHANCE_FLESHTONE;
    }

    if (sg_enLCAcmEnhance == LCACM_ENHANCE_FLESHTONE)
    {
        ColorSpecMode = COLOR_MODE_PORTRAIT;
    }

    memset(&stAcmPara, 0x0, sizeof(stAcmPara));

    stAcmPara.acm0_sec_blk = 9;
    stAcmPara.acm0_fir_blk = 7;

    stAcmPara.acm0_d_u_off = 0;
    stAcmPara.acm0_c_u_off = 0;
    stAcmPara.acm0_b_u_off = -2;
    stAcmPara.acm0_a_u_off = -2;
    stAcmPara.acm0_d_v_off = 0;
    stAcmPara.acm0_c_v_off = 2;
    stAcmPara.acm0_b_v_off = 3;
    stAcmPara.acm0_a_v_off = 4;

    PQ_HAL_SetLowCostAcmPara(VDP_LAYER_VP0, &stAcmPara);

    sg_enColorSpecModeType = ColorSpecMode;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SwitchEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E enColorSpecMode, COLOR_SPEC_MODE_E *pColorSpecMode)
{
    if (HI_PQ_COLOR_MODE_BUTT <= enColorSpecMode)
    {
        HI_ERR_PQ("[%d]Switch : Color Enhance Mode Set error!\n", enColorSpecMode);
        return HI_FAILURE;
    }

    switch (enColorSpecMode)
    {
        case HI_PQ_COLOR_MODE_RECOMMEND:
        {
            *pColorSpecMode = COLOR_MODE_RECOMMEND;
        }
        break;
        case HI_PQ_COLOR_MODE_BLUE:
        {
            *pColorSpecMode = COLOR_MODE_SKY;;
        }
        break;
        case HI_PQ_COLOR_MODE_GREEN:
        {
            *pColorSpecMode = COLOR_MODE_GRASS;
        }
        break;
        case HI_PQ_COLOR_MODE_BG:
        {
            *pColorSpecMode = COLOR_MODE_SCENERY;
        }
        break;
        case HI_PQ_COLOR_MODE_ORIGINAL:
        {
            *pColorSpecMode = COLOR_MODE_RECOMMEND;
        }
        break;
        default:
        {
            *pColorSpecMode = COLOR_MODE_RECOMMEND;
        }
        break;
    }

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_SetLowCostColorEnhanceMode(HI_PQ_COLOR_SPEC_MODE_E enColorSpecMode)
{
    COLOR_SPEC_MODE_E ColorSpecMode = COLOR_MODE_RECOMMEND;
    PQ_HAL_ACM_PARA_S stAcmPara = {0};

    PQ_MNG_SwitchEnhanceMode(enColorSpecMode, &ColorSpecMode);

    switch (ColorSpecMode)
    {
        case COLOR_MODE_RECOMMEND:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));
        }
        break;
        case COLOR_MODE_PORTRAIT:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));

            stAcmPara.acm0_sec_blk = 9;
            stAcmPara.acm0_fir_blk = 7;

            stAcmPara.acm0_d_u_off = 0;
            stAcmPara.acm0_c_u_off = 0;
            stAcmPara.acm0_b_u_off = -2;
            stAcmPara.acm0_a_u_off = -2;
            stAcmPara.acm0_d_v_off = 0;
            stAcmPara.acm0_c_v_off = 2;
            stAcmPara.acm0_b_v_off = 3;
            stAcmPara.acm0_a_v_off = 4;
        }
        break;
        case COLOR_MODE_SKY:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));

            stAcmPara.acm0_sec_blk = 7;
            stAcmPara.acm0_fir_blk = 9;

            stAcmPara.acm0_d_u_off = 5;
            stAcmPara.acm0_c_u_off = 2;
            stAcmPara.acm0_b_u_off = 0;
            stAcmPara.acm0_a_u_off = 3;
            stAcmPara.acm0_d_v_off = -5;
            stAcmPara.acm0_c_v_off = 0;
            stAcmPara.acm0_b_v_off = 0;
            stAcmPara.acm0_a_v_off = -3;
        }
        break;
        case COLOR_MODE_GRASS:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));

            stAcmPara.acm0_sec_blk = 7;
            stAcmPara.acm0_fir_blk = 6;

            stAcmPara.acm0_d_u_off = -1;
            stAcmPara.acm0_c_u_off = -2;
            stAcmPara.acm0_b_u_off = -4;
            stAcmPara.acm0_a_u_off = -4;
            stAcmPara.acm0_d_v_off = -1;
            stAcmPara.acm0_c_v_off = -5;
            stAcmPara.acm0_b_v_off = -6;
            stAcmPara.acm0_a_v_off = -8;
        }
        break;
        case COLOR_MODE_SCENERY:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));

            stAcmPara.acm0_sec_blk = 7;
            stAcmPara.acm0_fir_blk = 9;

            stAcmPara.acm0_d_u_off = 5;
            stAcmPara.acm0_c_u_off = 2;
            stAcmPara.acm0_b_u_off = 0;
            stAcmPara.acm0_a_u_off = 3;
            stAcmPara.acm0_d_v_off = -5;
            stAcmPara.acm0_c_v_off = 0;
            stAcmPara.acm0_b_v_off = 0;
            stAcmPara.acm0_a_v_off = -3;

            stAcmPara.acm1_sec_blk = 7;
            stAcmPara.acm1_fir_blk = 6;

            stAcmPara.acm1_d_u_off = -1;
            stAcmPara.acm1_c_u_off = -2;
            stAcmPara.acm1_b_u_off = -4;
            stAcmPara.acm1_a_u_off = -4;
            stAcmPara.acm1_d_v_off = -1;
            stAcmPara.acm1_c_v_off = -5;
            stAcmPara.acm1_b_v_off = -6;
            stAcmPara.acm1_a_v_off = -8;

            stAcmPara.acm2_sec_blk = 0;
            stAcmPara.acm2_fir_blk = 0;
        }
        break;
        default:
        {
            memset(&stAcmPara, 0x0, sizeof(stAcmPara));
        }
        break;
    }

    PQ_HAL_SetLowCostAcmPara(VDP_LAYER_VP0, &stAcmPara);

    sg_enColorSpecModeType = ColorSpecMode;

    return HI_SUCCESS;
}


static stPQAlgFuncs stLowCostACMFuncs =
{
    .Init                 = PQ_MNG_InitLowCostACM,
    .DeInit               = PQ_MNG_DeInitLowCostACM,
    .SetEnable            = PQ_MNG_EnableLowCostACM,
    .GetEnable            = PQ_MNG_GetLowCostACMEnable,
    .SetDemo              = PQ_MNG_EnableLowCostACMDemo,
    .GetDemo              = PQ_MNG_GetLowCostACMDemo,
    .SetDemoMode          = PQ_MNG_SetLowCostACMDemoMode,
    .GetDemoMode          = PQ_MNG_GetLowCostACMDemoMode,
    .SetFleshToneLevel    = PQ_MNG_SetLowCostACMFleshToneLevel,
    .GetFleshToneLevel    = PQ_MNG_GetLowCostACMFleshToneLevel,
    .SetColorEnhanceMode  = PQ_MNG_SetLowCostColorEnhanceMode,
    .GetColorEnhanceMode  = PQ_MNG_GetLowCostColorEnhanceMode,

};

HI_S32 PQ_MNG_RegisterLowCostACM(PQ_REG_TYPE_E enType)
{
    return PQ_COMM_AlgRegister(HI_PQ_MODULE_COLOR, enType, PQ_BIN_ADAPT_SINGLE, "acm", HI_NULL, &stLowCostACMFuncs);
}

HI_S32 PQ_MNG_UnRegisterLowCostACM(HI_VOID)
{
    return PQ_COMM_AlgUnRegister(HI_PQ_MODULE_COLOR);
}

