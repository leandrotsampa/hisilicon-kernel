/*--------------------------------------------------------------------------------------------------------------------------*/
/*!!Warning: This is a key information asset of Huawei Tech Co.,Ltd                                                         */
/*CODEMARK:kOyQZYzjDpyGdBAEC2GaWinjiDDUykL9e8pckESWBbMVmSWkBuyJO01cTiy3TdzKxGk0oBQa
mSMf7J4FkTpfv2bO4a86Ra1cP5w/R608AW9MyvBFsCSDo8GzQMC4Jhtu/zShyENpjFzntvB+
qu9VLVfiymwG7fnplCA6Fl/SkNk8QCfaDWEYQFuh1otobaWBGw+QwNBpSIu3GlY73mvsy+2E
KyET5RtZivvqGs/qTHlFhta7FysPmmPf6kbIUYnweu8H+9XOrW6Mp/Tdvf9fTw==*/

#ifndef __DSP_ELF_H__
#define __DSP_ELF_H__

#include "hi_type.h"

HI_S32 CopyELFSection(HI_UCHAR* pElfAddr);
HI_S32 CheckELFPaser(HI_UCHAR* pElfAddr);
HI_S32 ResetELFSection(HI_U32 u32BaseAddr, HI_U32 u32Size);

#endif
