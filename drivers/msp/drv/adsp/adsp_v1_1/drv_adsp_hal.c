#include <asm/cacheflush.h>

#include "hi_reg_common.h"

#include "hi_audsp_common.h"
#include "drv_adsp_private.h"
#include "drv_adsp_hal.h"

HI_VOID* g_pDspShareSRam = HI_NULL;

static HI_S32 DSPMapShareSRam(HI_VOID)
{
    g_pDspShareSRam = (HI_VOID*)adsp_ioremap(DSP0_SHARESRAM_BASEADDR, DSP0_SHARESRAM_MAXSIZE);
    if (HI_NULL == g_pDspShareSRam)
    {
        HI_ERR_ADSP("Map DSP share Sram failed\n");
        return HI_FAILURE;
    }

    HI_INFO_ADSP("g_pDspShareSRam = %p\n", g_pDspShareSRam);

    memset(g_pDspShareSRam, 0, DSP0_SHARESRAM_MAXSIZE);

    return HI_SUCCESS;
}

static HI_VOID DSPUnMapShareSRam(HI_VOID)
{
    if (HI_NULL != g_pDspShareSRam)
    {
        adsp_iounmap(g_pDspShareSRam);
        g_pDspShareSRam = HI_NULL;
    }
}

#ifdef HI_SND_DSP_SUPPORT

#include "dsp_elf_func.h"
#include "kfile_ops_func.h"

static const HI_UCHAR dsp_elf_array[] =
{
#include "firmware/hififw.dat"
};

#define ADSP_ELF_USE_ARRAY

#define ELF_MAXLENGTH (2 * 1024 * 1024)

static volatile S_AIAO_DSP_REGS_TYPE* g_DspCtrlReg = HI_NULL;
static volatile HI_DRV_ADSP_STATUS_REG_S* g_pstStatusReg = HI_NULL;

static HI_S32 DSPMapCtrlReg(HI_VOID)
{
    g_DspCtrlReg = (volatile S_AIAO_DSP_REGS_TYPE*)adsp_ioremap(DSP0_CTRL_REG_ADDR, sizeof(S_AIAO_DSP_REGS_TYPE));
    if (HI_NULL == g_DspCtrlReg)
    {
        HI_ERR_ADSP("adsp_ioremap S_AIAO_DSP_REGS_TYPE failed!\n");
        return HI_FAILURE;
    }

    /* use AIAO_DSP_START_04 as status reg */
    g_pstStatusReg = (volatile HI_DRV_ADSP_STATUS_REG_S*)(&g_DspCtrlReg->AIAO_DSP_START_04);

    return HI_SUCCESS;
}

static HI_VOID DSPUnMapCtrlReg(HI_VOID)
{
    if (HI_NULL != g_DspCtrlReg)
    {
        adsp_iounmap(g_DspCtrlReg);
        g_DspCtrlReg = HI_NULL;
        g_pstStatusReg = HI_NULL;
    }
}

static int mem_is_reserved(u32 phyaddr, u32 size)
{
    u32  pfn_start;
    u32  pfn_end;

    pfn_start = __phys_to_pfn(phyaddr);
    pfn_end = __phys_to_pfn(phyaddr + size);

    for (; pfn_start < pfn_end; pfn_start++)
    {
        struct page* page = pfn_to_page(pfn_start);
        if (!PageReserved(page))
        {
            return -ENOMEM;
        }
    }

    return 0;
}

static HI_S32 DSPLoadElf(HI_VOID)
{
    HI_S32 s32Ret;
    HI_UCHAR* pcELFBuf = HI_NULL;

    pcELFBuf = HI_VMALLOC(ADSP_ID_AOE, ELF_MAXLENGTH);
    if (HI_NULL == pcELFBuf)
    {
        HI_FATAL_ADSP("pcELFBuf HI_VMALLOC fail\n");
        return HI_FAILURE;
    }
    memset((HI_VOID*)pcELFBuf, 0, ELF_MAXLENGTH);

#if defined(ADSP_ELF_USE_FILE)
    //1. read elf file
    struct file* fpELF;
    HI_U32 u32readsize = 0;
    fpELF = kfile_open(ADSP_ELFNAME, O_RDONLY, 0);
    if (HI_NULL == fpELF)
    {
        HI_FATAL_ADSP("ELF file %s open fail\n", ADSP_ELFNAME);
        HI_VFREE(ADSP_ID_AOE, pcELFBuf);
        return HI_FAILURE;
    }

    u32readsize = kfile_read(pcELFBuf, ELF_MAXLENGTH, fpELF);
    if (u32readsize <= 0)
    {
        HI_FATAL_ADSP("ELF file  read fail\n");
        kfile_close(fpELF);
        HI_VFREE(ADSP_ID_AOE, pcELFBuf);
        return -EACCES;
    }

    kfile_close(fpELF);
    HI_INFO_ADSP("Read ELF file size 0x%x \n", u32readsize);

#elif defined(ADSP_ELF_USE_ARRAY)
    memcpy(pcELFBuf, dsp_elf_array, sizeof(dsp_elf_array));
    HI_INFO_ADSP("Read ELF array size 0x%x \n", sizeof(dsp_elf_array));
#endif

    //judge whether the addr for adsp is reserve
    s32Ret = mem_is_reserved(DSP_DDR_CODE_BASEADDR, DSP_DDR_CODE_MAXSIZE);
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("mem_is_reserved return : %d !\n", s32Ret);
        HI_FATAL_ADSP(" Memory is not reserved, adsp addr = 0x%x, size = 0x%x\n", DSP_DDR_CODE_BASEADDR, DSP_DDR_CODE_MAXSIZE);
        HI_VFREE(ADSP_ID_AOE, pcELFBuf);
        return s32Ret;
    }

    //2. load elf file
    //flush ddr memory
    HI_INFO_ADSP("ResetELFSection\n");
    ResetELFSection(DSP_DDR_CODE_BASEADDR, DSP_DDR_CODE_MAXSIZE);

    //copy elf to reg and ddr
    CopyELFSection(pcELFBuf);

    //flush cache to ddr (all size)
#ifdef __aarch64__
    __flush_dcache_area(phys_to_virt(DSP_DDR_CODE_BASEADDR), DSP_DDR_CODE_MAXSIZE);
#else
    __cpuc_flush_dcache_area(phys_to_virt(DSP_DDR_CODE_BASEADDR), DSP_DDR_CODE_MAXSIZE);
    outer_flush_range(DSP_DDR_CODE_BASEADDR, DSP_DDR_CODE_MAXSIZE);
#endif

    //check elf copyed right
    if (CheckELFPaser(pcELFBuf) == HI_FAILURE)
    {
        HI_FATAL_ADSP("ELF Load fail\n");
        HI_VFREE(ADSP_ID_AOE, pcELFBuf);
        return HI_FAILURE;
    }

    HI_VFREE(ADSP_ID_AOE, pcELFBuf);

    return HI_SUCCESS;
}

static HI_VOID DSPReset(HI_VOID)
{
    volatile U_PERI_CRG249 u32CrgVal;

    u32CrgVal.u32 = g_pstRegCrg->PERI_CRG249.u32;
    u32CrgVal.bits.dsp_srst_req = 1;
    u32CrgVal.bits.dsp_debug_srst_req = 1;
    g_pstRegCrg->PERI_CRG249.u32 = u32CrgVal.u32;
}

static HI_S32 DSPBootUp(HI_VOID)
{
    volatile U_PERI_CRG249 u32CrgVal;
    volatile U_AIAO_DSP_CTRL u32DspCtrl;

    u32DspCtrl.u32 = g_DspCtrlReg->AIAO_DSP_CTRL.u32;
    u32DspCtrl.bits.wdg1_en_dsp0 = 0;
    u32DspCtrl.bits.ocdhaltonreset_dsp0 = 0;
    u32DspCtrl.bits.statvectorsel_dsp0 = 0;
    u32DspCtrl.bits.runstall_dsp0 = 0;
    g_DspCtrlReg->AIAO_DSP_CTRL.u32 = u32DspCtrl.u32;

    /* DSP CRG */
    DSPReset();
    msleep(1);

    u32CrgVal.u32 = g_pstRegCrg->PERI_CRG249.u32;
    u32CrgVal.bits.dsp_clk_sel = 0;
    g_pstRegCrg->PERI_CRG249.u32 = u32CrgVal.u32;
    msleep(1);

    u32CrgVal.u32 = g_pstRegCrg->PERI_CRG249.u32;
    u32CrgVal.bits.dsp_cken = 1;
    g_pstRegCrg->PERI_CRG249.u32 = u32CrgVal.u32;
    msleep(1);

    u32CrgVal.u32 = g_pstRegCrg->PERI_CRG249.u32;
    u32CrgVal.bits.dsp_srst_req = 0;
    u32CrgVal.bits.dsp_debug_srst_req = 0;
    g_pstRegCrg->PERI_CRG249.u32 = u32CrgVal.u32;

    return HI_SUCCESS;
}

HI_S32 DSPCheckRunning(HI_VOID)
{
    volatile HI_U32 loop = 0;

    for (loop = 0; loop < DSP_ACK_TIME; loop++)
    {
        if (1 == g_pstStatusReg->bits.dsp_ready)
        {
            return HI_SUCCESS;
        }
        msleep(1);
    }

    return HI_FAILURE;
}

HI_VOID DSPStop(HI_VOID)
{
    DSPReset();
    DSPUnMapCtrlReg();
}

HI_S32 DSPStart(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = DSPMapCtrlReg();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPMapCtrlReg failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = DSPLoadElf();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPLoadElf failed(0x%x)\n", s32Ret);
        goto ERR_EXIT;
    }

    g_pstStatusReg->u32 = 0;

    s32Ret = DSPBootUp();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPBootUp failed(0x%x)\n", s32Ret);
        goto ERR_EXIT;
    }

    s32Ret = DSPCheckRunning();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPCheckRunning failed(0x%x)\n", s32Ret);
        goto ERR_EXIT;
    }

    return s32Ret;

ERR_EXIT:
    DSPStop();
    return s32Ret;
}

static HI_VOID DSPSetArmReady(HI_VOID)
{
    if (HI_NULL != g_pstStatusReg)
    {
        g_pstStatusReg->bits.arm_ready = 1;
    }
}

HI_VOID HAL_ADSP_DeInit(HI_VOID)
{
    DSPUnMapShareSRam();
    DSPStop();
}

HI_S32 HAL_ADSP_Init(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = DSPStart();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPStart failed(0x%x)\n", s32Ret);
        return s32Ret;
    }

    s32Ret = DSPMapShareSRam();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPMapShareSRam failed(0x%x)\n", s32Ret);
        DSPStop();
        return s32Ret;
    }

    DSPSetArmReady();
    HI_INFO_ADSP("g_pstStatusReg->u32 = 0x%x\n", g_pstStatusReg->u32);

    return s32Ret;
}

#else

HI_VOID HAL_ADSP_DeInit(HI_VOID)
{
    DSPUnMapShareSRam();
}

HI_S32 HAL_ADSP_Init(HI_VOID)
{
    HI_S32 s32Ret;

    s32Ret = DSPMapShareSRam();
    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_ADSP("call DSPMapShareSRam failed(0x%x)\n", s32Ret);
    }

    return s32Ret;
}

#endif
