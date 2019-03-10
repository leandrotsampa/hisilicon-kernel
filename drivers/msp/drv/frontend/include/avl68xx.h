#ifndef AVL68XX_H
#define AVL68XX_H

#ifdef __cplusplus
extern "C"
{
#endif

#include "drv_demod.h"


HI_S32 AVL68XX_Init(HI_U32 u32TunerPort, HI_U8 enI2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerDevType);

HI_S32 AVL68XX_SetAttr(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_ATTR_S *pstTerTunerAttr);

HI_S32 AVL68XX_SetTsType(HI_U32 u32TunerPort, HI_UNF_TUNER_OUPUT_MODE_E enTsType);

HI_S32 AVL68XX_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);

HI_VOID AVL68XX_SetWaitTimes(HI_U32 u32ConnectTimeout);

HI_S32 AVL68XX_AntennaPower(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_ANTENNA_POWER_E enAntennaPower);

HI_S32 AVL68XX_GetLockStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penLockStatus);

HI_S32 AVL68XX_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32ber);

HI_S32 AVL68XX_GetQuality(HI_U32 u32TunerPort, HI_U32 *pu32Quality);

HI_S32 AVL68XX_GetSnr(HI_U32 u32TunerPort, HI_U32 *pu32SNR);

HI_S32 AVL68XX_GetStrength(HI_U32 u32TunerPort, HI_U32 *pu32Strength);

HI_S32 AVL68XX_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo);

HI_S32 AVL68XX_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum);

HI_S32 AVL68XX_GetPlpId(HI_U32 u32TunerPort, HI_U8 *pu8PlpId);

/*only used in DVB-T2*/
HI_S32 AVL68XX_GetCurrentPlpType(HI_U32 u32TunerPort, HI_UNF_TUNER_T2_PLP_TYPE_E *penPLPType);
/*only used in DVB-T2*/
HI_S32 AVL68XX_SetPlpId(HI_U32 u32TunerPort, HI_U8 u8PLPID, HI_U32 u32Mode);

HI_S32 AVL68XX_GetFreqOffset(HI_U32 u32TunerPort, HI_U32 *pu32Freq, HI_U32 *pu32Symb);

HI_S32 AVL68XX_SetCommonPlpId(HI_U32 u32TunerPort, HI_U8 u8PLpId);

HI_S32 AVL68XX_SetCommonPlpCombination(HI_U32 u32TunerPort, HI_U8 u8ComPlpEna);

HI_S32 AVL68XX_GetPlpGroupId(HI_U32 u32TunerPort, HI_U8 *u8GrpPlpId);

#ifdef __cplusplus
}
#endif
#endif // AVL68XX_H
