/*
 * Copyright (C) 2017, Hisilicon Tech. Co., Ltd.
 * SPDX-License-Identifier: GPL-2.0
 */

#include "drv_disp_alg_service.h"
#include <linux/vmalloc.h>
#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/errno.h>
#include <linux/fcntl.h>
#include <linux/mm.h>
#include <linux/miscdevice.h>
#include <linux/proc_fs.h>
#include <linux/fs.h>
#include <linux/slab.h>
#if (LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 36))
#include <linux/smp_lock.h>
#endif
#include <linux/init.h>
#include <linux/delay.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0))
#include <asm/system.h>
#endif
#include <linux/interrupt.h>
#include <linux/ioport.h>
#include <linux/string.h>

#define	 MAX_ALG_SUPPORT_NUM  20

HI_BOOL CheckWindowOverlap(WindowInfor_S stWindowBase,WindowInfor_S stWindowIn)
{
    //�ж��������ң����ص������������������¶����ص���
    if((stWindowIn.y_end <= stWindowBase.y_start) || (stWindowIn.y_start >= stWindowBase.y_end)
	|| (stWindowIn.x_end <= stWindowBase.x_start) || (stWindowIn.x_start >= stWindowBase.x_end))
    {
	return HI_FALSE;
    }
    else
    {
	return HI_TRUE;
    }
}

HI_VOID RegisterWindowOverlap(WindowMappingResult_S *winMappingResult,
			     HI_U32 *calcWindowNum,
			     HI_U32 numofWindow)
{
    HI_U32 i = 0;

    for (i = 0; i < numofWindow; i++)
    {
	winMappingResult[i].u32OverlapCnt = calcWindowNum[i];
    }

    return;
}

HI_S32 judgeWhetherZorderMatch(WindowMappingResult_S *winMappingResult,
			     HI_U32 numofWindow,
			     WindowInfor_S *winCoordinate)
{
    HI_U32 i = 0, v0_zorder = 0;
    HI_BOOL blarger = HI_FALSE;
    HI_BOOL bless = HI_FALSE;

    for (i = 0; i < numofWindow; i++)
    {
	if (winMappingResult[i].videoLayer == V0)
	{
	    v0_zorder = winCoordinate[i].zorder;
	    break;
	}
    }

    for (i = 0; i < numofWindow; i++)
    {
	if (winMappingResult[i].u32OverlapCnt != 0)
	{
	    if (winCoordinate[i].zorder > v0_zorder)
		blarger = HI_TRUE;
	    else if (winCoordinate[i].zorder < v0_zorder)
		bless = HI_TRUE;
	}
    }

    if ((blarger) && (bless))
	return HI_FAILURE;

    return HI_SUCCESS;
}




HI_VOID CalcWindowOverlapNum(WindowInfor_S *winCoordinate,HI_U32 *calcWindowNum,HI_U32	numofWindow)
{
    HI_U32 u32X;
    HI_U32 u32Y;

    for(u32X = 0; u32X < numofWindow; u32X++)
    {
	for(u32Y = 0; u32Y < numofWindow; u32Y++)
	{
	    if(u32X != u32Y)
	    {
		calcWindowNum[u32X] += CheckWindowOverlap(winCoordinate[u32X],winCoordinate[u32Y]);
	    }
	}
    }
}

HI_VOID GetMaxWindowOverlapPos(HI_U32 *calcWindowNum,HI_U32 numofWindow,HI_U32 *maxOverlapValue,HI_U32 *maxOverlapWindow)
{
    HI_U32 u32X;

    *maxOverlapValue = calcWindowNum[0];
    *maxOverlapWindow = 0;
    for(u32X = 1; u32X < numofWindow; u32X++)
    {
	if(calcWindowNum[u32X] > *maxOverlapValue)
	{
	    *maxOverlapValue = calcWindowNum[u32X];
	    *maxOverlapWindow = u32X;
	}
    }
}

HI_U32 GetWindowArea(WindowInfor_S stWindowInfo)
{
    return ((HI_U32)(stWindowInfo.x_end - stWindowInfo.x_start))*((HI_U32)(stWindowInfo.y_end - stWindowInfo.y_start));

}
HI_VOID GetMaxWindowAreaPos(WindowInfor_S *winCoordinate,HI_U32 numofWindow,HI_U32 *maxAreaWindow)
{
    HI_U32 u32X;
    HI_U32 u32MaxArea;
    HI_U32 u32MaxZorder;
    HI_U32 i = 0, j = 0;
    HI_U32 zorder[MAX_ALG_SUPPORT_NUM][2] = {{0}};

    *maxAreaWindow = 0;
    u32MaxArea= GetWindowArea(winCoordinate[0]);
    for(u32X = 1; u32X < numofWindow; u32X++)
    {
	if(GetWindowArea(winCoordinate[u32X]) > u32MaxArea)
	{
	    u32MaxArea = GetWindowArea(winCoordinate[u32X]);
	    *maxAreaWindow = u32X;
	}
    }


    j = 0;
    for (i = 0; i < numofWindow; i++)
    {
	if (GetWindowArea(winCoordinate[i]) == u32MaxArea)
	{
	    zorder[j][0] = i;
	    zorder[j][1] = winCoordinate[i].zorder;
	    j ++;
	}
    }

    *maxAreaWindow = zorder[0][0];
    u32MaxZorder = zorder[0][1];

    for (i = 1; i < j; i++)
    {
	if (zorder[i][1] > u32MaxZorder)
	{
	    *maxAreaWindow = zorder[i][0];
	    u32MaxZorder = zorder[i][1];
	}
    }

    return ;
}

HI_S32 GetMaxZorderByOverlapWindow(WindowInfor_S *winCoordinate,
				    HI_U32  numofWindow,
				    HI_U32 FindOverlapWindow,
				    HI_U32 * GetMaxZorderWindow,
				    WindowMappingResult_S *winMappingResult_tmp)
{
    HI_U32 u32X;
    HI_S32  s32Ret = 0, s32Ret1 = 0;
    *GetMaxZorderWindow = 0;

    for(u32X = 0; u32X < numofWindow; u32X++)
    {
	if((FindOverlapWindow != u32X) && CheckWindowOverlap(winCoordinate[FindOverlapWindow],winCoordinate[u32X]))
	{
	    if (GetWindowArea(winCoordinate[FindOverlapWindow]) > GetWindowArea(winCoordinate[u32X]))
		*GetMaxZorderWindow = FindOverlapWindow;
	    else if (GetWindowArea(winCoordinate[FindOverlapWindow]) < GetWindowArea(winCoordinate[u32X]))
		*GetMaxZorderWindow = u32X;
	    else
		*GetMaxZorderWindow = (winCoordinate[FindOverlapWindow].zorder > winCoordinate[u32X].zorder ?  FindOverlapWindow:u32X);
	    break;
	}
    }


    ClacLayerMapping(winCoordinate,winMappingResult_tmp,numofWindow,FindOverlapWindow);
    s32Ret = judgeWhetherZorderMatch(winMappingResult_tmp, numofWindow, winCoordinate);

    ClacLayerMapping(winCoordinate,winMappingResult_tmp,numofWindow,u32X);
    s32Ret1 = judgeWhetherZorderMatch(winMappingResult_tmp, numofWindow, winCoordinate);

    if (s32Ret && s32Ret1)
    {
	return HI_FAILURE;
    }
    else if (!s32Ret && s32Ret1)
    {
	*GetMaxZorderWindow = FindOverlapWindow;
    }
    else if (s32Ret && !s32Ret1)
    {
	*GetMaxZorderWindow = u32X;
    }

    return HI_SUCCESS;
}
HI_VOID ClacLayerMapping(WindowInfor_S *winCoordinate,WindowMappingResult_S *winMappingResult,HI_U32  numofWindow,HI_U32 u32VoWinPos)
{
    //�Ѿ�֪���ĸ�windowӦ�÷��õ�v0,���ڽ�ʣ���window����
    HI_U32 u32X;
    HI_U32 u32Y;
    HI_U32 u32ArrCount;
    AlgInfor_s *winOrderArr;
    AlgInfor_s tmpAlgInfo;
    AlgInfor_s	  stAlgInfor_s[MAX_ALG_SUPPORT_NUM] = {{0}};

    winOrderArr = stAlgInfor_s;
    u32Y = 0;

    for(u32X = 0; u32X < numofWindow; u32X++)
    {
	if(u32X == u32VoWinPos)
	{
	    continue;
	}
	winOrderArr[u32Y].x_start = winCoordinate[u32X].x_start;
	winOrderArr[u32Y].u32OrigPos = u32X;
	u32Y++;
    }

    //X��������,ð�����򣬴��ں�
    u32ArrCount = (numofWindow-1);
    for(u32X = 0; u32X < u32ArrCount; u32X++)
    {
	for(u32Y = u32X + 1; u32Y < u32ArrCount; u32Y++)
	{
	    if(winOrderArr[u32Y].x_start <  winOrderArr[u32X].x_start)
	    {
		tmpAlgInfo = winOrderArr[u32X];
		winOrderArr[u32X] = winOrderArr[u32Y];
		winOrderArr[u32Y] = tmpAlgInfo;
	    }
	}
    }

    //��ʼ����������
    for(u32X = 0; u32X < u32ArrCount; u32X++)
    {
	winMappingResult[winOrderArr[u32X].u32OrigPos].regionNo = u32X;
	winMappingResult[winOrderArr[u32X].u32OrigPos].videoLayer = V1;
    }

    winMappingResult[u32VoWinPos].regionNo = 0;
    winMappingResult[u32VoWinPos].videoLayer = V0;

    return ;
}


/*
˵���� ʵ��һ��n�����ڵ�V0,V1 2��ͨ����ӳ���㷨�����У�V0��ֻ�ܷ���һ�����ڣ�
       V1�ϣ����Է���n-1�����ڡ� ���ڵ�ͨ��ӳ����Ϻ󣬷��䵽V1�ϵ�N-1�����ڣ�
       ����Ҫ����xֵ��С�������� ���������ı�š�����xֵ��С�ı��Ϊ0��
       xֵ����Ϊn-2��

ʹ�ü�Լ����
   1�� ��n�����ڣ� ֻ����1������λ�ò������ƣ��������������ص���ʣ��N-1�����ڱ˴�֮�䲻�����ص���
	����������������ʱ�����ɱ�����
   2�� V0/V1��������ͬ�� V0�ϵĴ��ڿ������������ⴰ���ص��� V1�ϵĴ��ڣ��˴�֮�䲻���ص���

   3�� V0���ܳ��ֿ�ȱ�����޴��ڵ������

   4�� ������ڻ����ص���
       a�� �����������ߣ����ȷ��䵽V0ͨ���ϣ�
       b)  ����������2�����򴰿ڵ�zorder���ȼ����ߣ����䵽V0�ϣ�

   5�� ������ִ����ص���V0�ϵķ������ȼ����������ȼ�����
	  a�������ĳ�����ڷ��䵽V0�ϣ����಻�ٳ��ֱ˴��ص��������Ĵ�������ֻ��1����
	     ����Ҫ�Ѵ˴��ڷ��䵽V0�ϣ�
	  b) �����ĳ�����ڷ��䵽V0�ϣ����಻�ٳ��ֱ˴��ص��������Ĵ����ж���һ����
	     ���ա�4��������ڻ����ص��������ȼ�����
	  c) ����κ�һ�����ڷ��䵽V0�ϣ�ʣ��Ĵ�����Ȼ�˴��ص�������Ҫ������
   6�� ������䵽�֣��ϵĴ���winv0�������һ���Ĵ����ص�����winv0��zorder��Ҫ����
       ����С�������������ص��Ĵ��ڵ� zorder�� ���ܽ�����Щ�ص�����zorder֮�䣻

   7�� ���㷨ֻ�������ڵ�ͨ����ӳ�䣬�Լ�V1�ϴ���xֵ��С��������������ţ�
       ���ܸı䴰�ڵ�λ�ã�
*/

HI_S32 WindowAndLayerMapping( WindowInfor_S *winCoordinate,
			      WindowMappingResult_S *winMappingResult,
			      HI_U32  numofWindow)
{
    HI_U32 u32FirstMaxOverlapValue;
    HI_U32 u32SecondMaxOverlapValue;
    HI_U32 u32FirstMaxOverlapWindow;
    HI_U32 u32SecondMaxOverlapWindow;
    HI_U32 u32VoWinPos;
    WindowInfor_S *winTmpCoordinate;
    HI_U32 *calcWindowNumArr;
    WindowInfor_S stWinInfor[MAX_ALG_SUPPORT_NUM] = {{0}};
    HI_U32	  u32calcWindowNumArr[MAX_ALG_SUPPORT_NUM] = {0};
    WindowMappingResult_S winMappingResult_tmp[MAX_ALG_SUPPORT_NUM];
    HI_S32 s32Ret = HI_SUCCESS;

    memset((void*)winMappingResult_tmp, 0, sizeof(WindowMappingResult_S) * MAX_ALG_SUPPORT_NUM);
    if (1 == numofWindow)
    {
	winMappingResult[0].videoLayer = V0;
	winMappingResult[0].regionNo = 0;
	return HI_SUCCESS;
    }
    else if (0 == numofWindow)
    {
       return HI_FAILURE;
    }
    else if (numofWindow > MAX_ALG_SUPPORT_NUM)
    {
	return HI_FAILURE;
    }

    winTmpCoordinate = stWinInfor;
    memcpy((HI_VOID*)winTmpCoordinate,(HI_VOID*)winCoordinate,numofWindow*sizeof(WindowInfor_S));

    calcWindowNumArr = u32calcWindowNumArr;
    memset((HI_VOID*)calcWindowNumArr,0,numofWindow * sizeof(HI_U32));

    /*calculate the overlap count for every window.*/
    CalcWindowOverlapNum(winTmpCoordinate,calcWindowNumArr,numofWindow);
    /*register every window's overlap cnt to final winMappingResult.*/
    RegisterWindowOverlap(winMappingResult,calcWindowNumArr,numofWindow);

    GetMaxWindowOverlapPos(calcWindowNumArr,
			   numofWindow,
			   &u32FirstMaxOverlapValue,
			   &u32FirstMaxOverlapWindow);

    /*no overlap*/
    if(0 == u32FirstMaxOverlapValue)
    {
	GetMaxWindowAreaPos(winTmpCoordinate,numofWindow,&u32VoWinPos);
	ClacLayerMapping(winTmpCoordinate,winMappingResult,numofWindow,u32VoWinPos);
    }
    else
    {
	//ȥ���ص��������Ĵ��ڣ��ٴ��ж��Ƿ����ص�
	winTmpCoordinate[u32FirstMaxOverlapWindow].x_start = 0;
	winTmpCoordinate[u32FirstMaxOverlapWindow].x_end = 0;
	winTmpCoordinate[u32FirstMaxOverlapWindow].y_start = 0;
	winTmpCoordinate[u32FirstMaxOverlapWindow].y_end = 0;

	memset((HI_VOID*)calcWindowNumArr,0,numofWindow * sizeof(HI_U32));
	CalcWindowOverlapNum(winTmpCoordinate,calcWindowNumArr,numofWindow);
	GetMaxWindowOverlapPos(calcWindowNumArr,numofWindow,&u32SecondMaxOverlapValue,&u32SecondMaxOverlapWindow);

	//�������ص����޷����������ش���
	if(0 < u32SecondMaxOverlapValue)
	{
	    s32Ret =  HI_FAILURE;
	    if (s32Ret)
		goto ALG_EXIT;
	}

	memcpy((HI_VOID*)winTmpCoordinate,(HI_VOID*)winCoordinate,numofWindow*sizeof(WindowInfor_S));

	//ֻһ���������������ص�
	if(2 <= u32FirstMaxOverlapValue)
	{
	    u32VoWinPos = u32FirstMaxOverlapWindow;
	    ClacLayerMapping(winTmpCoordinate,winMappingResult,numofWindow,u32VoWinPos);
	}
	else//���������໥�ص�
	{
	    //�ж������������order˳��
	    memcpy((void*)winMappingResult_tmp, (void*)winMappingResult, numofWindow*sizeof(WindowMappingResult_S));
	    s32Ret = GetMaxZorderByOverlapWindow(winTmpCoordinate,
					numofWindow,
					u32FirstMaxOverlapWindow,
					&u32VoWinPos,
					winMappingResult_tmp);
	     if (s32Ret)
		goto ALG_EXIT;

	    ClacLayerMapping(winTmpCoordinate,winMappingResult,numofWindow,u32VoWinPos);
	}

	/*if some window overlaps, the zorder in the window  which located in v0,  should
	  be less than all the overlaps window ,or be larger than all the overlaps window.*/
	s32Ret = judgeWhetherZorderMatch(winMappingResult, numofWindow, winTmpCoordinate);
	if (s32Ret)
	    goto ALG_EXIT;
    }

ALG_EXIT:
	return s32Ret;
}


HI_S32 layerZorderMatch( WindowZorderInfor_S *winZorderInfor,
				 HI_U32	 numofWindow)
{
    HI_U32 i = 0, win_zorder = 0, k = 0;
    HI_U32 layerV0Zorder = 0;
    HI_U32 layerV1Zorder = 0;

    HI_BOOL blarger = HI_FALSE;
    HI_BOOL bless = HI_FALSE;

    for (i = 0; i < numofWindow; i++)
    {
	if ((winZorderInfor[i].layerNumber == V0)
	    || (winZorderInfor[i].layerNumber == (V0 +3)))
	{
	    win_zorder = winZorderInfor[i].winZorder;
	    layerV0Zorder = winZorderInfor[i].layerZorder;
	    k = i;
	}
	else
	{
	    layerV1Zorder = winZorderInfor[i].layerZorder;
	}

	winZorderInfor[i].matchOperation = HI_DRV_DISP_ZORDER_BUTT;
    }

    for (i = 0; i < numofWindow; i++)
    {
	if (winZorderInfor[i].winZorder > win_zorder)
	    bless = HI_TRUE;
	else if (winZorderInfor[i].winZorder < win_zorder)
	    blarger = HI_TRUE;
    }

    if ((blarger) && (bless))
	return HI_FAILURE;

    if (blarger)
    {
	if (layerV0Zorder > layerV1Zorder)
	    winZorderInfor[k].matchOperation = HI_DRV_DISP_ZORDER_BUTT;
	else if (layerV0Zorder < layerV1Zorder)
	    winZorderInfor[k].matchOperation = HI_DRV_DISP_ZORDER_MOVETOP;
    }
    else if (bless)
    {
	if (layerV0Zorder <  layerV1Zorder)
	    winZorderInfor[k].matchOperation = HI_DRV_DISP_ZORDER_BUTT;
	else if (layerV0Zorder > layerV1Zorder)
	    winZorderInfor[k].matchOperation = HI_DRV_DISP_ZORDER_MOVEBOTTOM;
    }

	return HI_SUCCESS;
}
