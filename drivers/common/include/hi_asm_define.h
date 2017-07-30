/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __HI_ASM_DEFINE_H__
#define __HI_ASM_DEFINE_H__

#ifdef __cplusplus
extern "C"{
#endif


#ifdef CONFIG_ARM_UNWIND
	#define UNWIND(code...) code
#else
	#define UNWIND(code...)
#endif

#define ASCII(code...) code

#ifdef __cplusplus
}
#endif

#endif /* __HI_ASM_DEFINE_H__ */
