/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : wmalloc.h
Version		    : Initial Draft
Author		    :
Created		    : 2014/06/20
Description	    :
Function List	    :
History		    :
Date			    Author		    Modification
2014/06/20		   y00181162	       Created file
******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef	 __WMALLOC_H__
#define	 __WMALLOC_H__

#include "hi_type.h"

/*CNcomment:*****************************************************************************
*Function: wmeminit
*Description: init memery pool. CNcomment:TDE�ڴ�س�ʼ��
*Input: none
*Output: none
*Return: success/error code. CNcomment:�ɹ�/������
others: none
*******************************************************************************/
HI_S32 wmeminit(void);

/******************************************************************************
*Function: wmemterm
*Description: Deinit memery pool. CNcomment:TDE�ڴ��ȥ��ʼ��
*Input: none
*Output: none
*Return: none
others: none
*******************************************************************************/
HI_VOID wmemterm(void);

/******************************************************************************
*Function: wgetphy
*Description: get the physics address of memery. CNcomment:��ȡ�ڴ��������ַ
*Input: ptr  the pointer of memery. CNcomment:ָ���ڴ��ָ��
*Output:  physics address. CNcomment:������ַ
*Return: none
others: none
*******************************************************************************/
HI_U32 wgetphy(HI_VOID *ptr);

/******************************************************************************
*Function: wgetphy
*Description: get the virtual address of memery. CNcomment:��ȡ�ڴ�������ַ
*Input: phyaddr	 physics address. CNcomment:������ַ
*Output: virtual address. CNcomment:�����ַ
*Return: none
others: none
*******************************************************************************/
HI_VOID * wgetvrt(HI_U32 phyaddr);

/******************************************************************************
*Function: wgetfreenum
*Description:get the number of the free unit. CNcomment:��ȡ�ڴ��ʣ���Unit��Ԫ��
*Input: none
*Output: none
*Return: the number of the free unit. CNcomment:ʣ��ĵ�Ԫ��
others: none
*******************************************************************************/
HI_U32 wgetfreenum(HI_VOID);
#ifndef TDE_BOOT
struct seq_file * wprintinfo(struct seq_file *page);
#endif

#endif /*__WMALLOC_H__ */
