/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef	 __HI_DRV_PMOC_H__
#define	 __HI_DRV_PMOC_H__

#include "hi_unf_pmoc.h"
#include "hi_debug.h"

/* add register macro */
#define C51_BASE	     0xf8400000

#define C51_SIZE	     0x8000 //32K
#define C51_DATA	     0x7000 //28K
#define MCU_CODE_MAXSIZE     0x6000 //24K

#define DEFAULT_INIT_FREQ 1200000

#define HI_VDD_MPU_OPP1_UV 840
#define HI_VDD_MPU_OPP2_UV 840
#define HI_VDD_MPU_OPP3_UV 870
#define HI_VDD_MPU_OPP4_UV 950
#define HI_VDD_MPU_OPP5_UV 990
#define HI_VDD_MPU_OPP6_UV 1100
#define HI_VDD_MPU_OPP7_UV 1150
#define HI_VDD_MPU_OPP1_VMIN 840
#define HI_VDD_MPU_OPP2_VMIN 840
#define HI_VDD_MPU_OPP3_VMIN 840
#define HI_VDD_MPU_OPP4_VMIN 880
#define HI_VDD_MPU_OPP5_VMIN 880
#define HI_VDD_MPU_OPP6_VMIN 970
#define HI_VDD_MPU_OPP7_VMIN 1020
#define HI_VDD_MPU_OPP1_HPM 0xc9
#define HI_VDD_MPU_OPP1_HPM_FF 0xc9
#define HI_VDD_MPU_OPP1_HPM_TT 0xc9
#define HI_VDD_MPU_OPP1_HPM_SS 0xc9
#define HI_VDD_MPU_OPP2_HPM 0xc9
#define HI_VDD_MPU_OPP2_HPM_FF 0xc9
#define HI_VDD_MPU_OPP2_HPM_TT 0xc9
#define HI_VDD_MPU_OPP2_HPM_SS 0xc9
#define HI_VDD_MPU_OPP3_HPM 0x100
#define HI_VDD_MPU_OPP3_HPM_FF 0x100
#define HI_VDD_MPU_OPP3_HPM_TT 0xe5
#define HI_VDD_MPU_OPP3_HPM_SS 0xe8
#define HI_VDD_MPU_OPP4_HPM 0x110
#define HI_VDD_MPU_OPP4_HPM_FF 0x110
#define HI_VDD_MPU_OPP4_HPM_TT 0x110
#define HI_VDD_MPU_OPP4_HPM_SS 0x110
#define HI_VDD_MPU_OPP5_HPM 0x12a
#define HI_VDD_MPU_OPP5_HPM_FF 0x12a
#define HI_VDD_MPU_OPP5_HPM_TT 0x122
#define HI_VDD_MPU_OPP5_HPM_SS 0x11c
#define HI_VDD_MPU_OPP6_HPM 0x14b
#define HI_VDD_MPU_OPP6_HPM_FF 0x14b
#define HI_VDD_MPU_OPP6_HPM_TT 0x14b
#define HI_VDD_MPU_OPP6_HPM_SS 0x14b
#define HI_VDD_MPU_OPP7_HPM 0x16a
#define HI_VDD_MPU_OPP7_HPM_FF 0x16a
#define HI_VDD_MPU_OPP7_HPM_TT 0x165
#define HI_VDD_MPU_OPP7_HPM_SS 0x15a

#define CPU_VMAX    1150    /*mv*/
#define CPU_VMIN    650	    /*mv*/
#define CORE_VMAX   1150    /*mv*/
#define CORE_VMIN   650	    /*mv*/
#define PWM_STEP    5	    /*mv*/
#define PWM_CLASS   2
#define CPU_DEVICE  0
#define CORE_DEVICE 1

typedef struct hiCPU_VF_S
{
    unsigned int freq;		/* unit: kHz */
    unsigned int hpmrecord;	/* hpm record */
    unsigned int vmin;		/* the minimum voltage of AVS */
    unsigned int vsetting;	/* the setting voltage of DVFS */
} CPU_VF_S;

typedef struct hiCPU_HPM_S
{
    unsigned int freq;		/* unit: kHz */
    unsigned int hpmrecord[4];	 /* chip hpm record */
} CPU_HPM_S;


#define MAX_FREQ_NUM 7
extern CPU_VF_S cpu_freq_hpm_table[MAX_FREQ_NUM];

#define HI_FATAL_PM(fmt...) HI_FATAL_PRINT(HI_ID_PM, fmt)

#define HI_ERR_PM(fmt...)   HI_ERR_PRINT(HI_ID_PM, fmt)

#define HI_WARN_PM(fmt...)  HI_WARN_PRINT(HI_ID_PM, fmt)

#define HI_INFO_PM(fmt...)  HI_INFO_PRINT(HI_ID_PM, fmt)

HI_S32 HI_DRV_PMOC_Init(HI_VOID);
HI_S32 HI_DRV_PMOC_DeInit(HI_VOID);
HI_S32 HI_DRV_PMOC_SwitchSystemMode(HI_UNF_PMOC_MODE_E enSystemMode, HI_UNF_PMOC_ACTUAL_WKUP_E * penWakeUpStatus);
HI_S32 HI_DRV_PMOC_SetWakeUpAttr(HI_UNF_PMOC_WKUP_S_PTR pstAttr);
HI_S32 HI_DRV_PMOC_SetStandbyDispMode(HI_UNF_PMOC_STANDBY_MODE_S_PTR pstStandbyMode);
HI_S32 HI_DRV_PMOC_SetScene(HI_UNF_PMOC_SCENE_E eScene);
HI_S32 HI_DRV_PMOC_SetDevType(HI_UNF_PMOC_DEV_TYPE_S_PTR pdevType);

#endif	/*  __HI_DRV_PMOC_H__ */
