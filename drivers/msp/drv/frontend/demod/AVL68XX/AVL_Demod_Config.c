/*
 *           Copyright 2007-2014 Availink, Inc.
 *
 *  This software contains Availink proprietary information and
 *  its use and disclosure are restricted solely to the terms in
 *  the corresponding written license agreement. It shall not be
 *  disclosed to anyone other than valid licensees without
 *  written permission of Availink, Inc.
 *
 */



#include "AVL_Demod.h"
// sky()
AVL_CommonConfig AVL_CommonConfigChip0 =
{
	0,
    0x28, /* 0x14 */
    Xtal_30M,

//  AVL_TS_PARALLEL,
    AVL_TS_SERIAL,
    AVL_MPCM_RISING,
    AVL_TS_CONTINUOUS_DISABLE
};

AVL_DVBTxConfig AVL_DVBTxConfigChip0 =
{
    AVL_IF_I,
    36*1000*1000,
    AVL_AGC_NORMAL
};

AVL_DVBSxConfig AVL_DVBSxConfigChip0 =
{
    AVL_AGC_INVERTED,
    AVL_DWM_Normal
};

AVL_ISDBTConfig AVL_ISDBTConfigChip0 =
{
    AVL_IF_I,
    AVL_ISDBT_BW_6M,
    36*1000*1000,
    AVL_AGC_NORMAL
};

AVL_DVBCConfig AVL_DVBCConfigChip0 =
{
    AVL_IF_I,
    36*1000*1000,
    6952000 /* 6875*1000 */,
    AVL_AGC_NORMAL,
    AVL_DVBC_J83A,
};

AVL_DTMBConfig AVL_DTMBConfigChip0 =
{
    AVL_IF_I,
    36*1000*1000,
    7560*1000,
    AVL_AGC_NORMAL
};


// sky()
AVL_CommonConfig AVL_CommonConfigChip1 =
{
	0,
    0x28, /* 0x14 */
    Xtal_30M,

//  AVL_TS_PARALLEL,
    AVL_TS_SERIAL,
    AVL_MPCM_RISING,
    AVL_TS_CONTINUOUS_DISABLE
};

AVL_DVBTxConfig AVL_DVBTxConfigChip1 =
{
    AVL_IF_I,
    36*1000*1000,
    AVL_AGC_NORMAL
};

AVL_DVBSxConfig AVL_DVBSxConfigChip1 =
{
    AVL_AGC_INVERTED,
    AVL_DWM_Normal
};

AVL_ISDBTConfig AVL_ISDBTConfigChip1 =
{
    AVL_IF_I,
    AVL_ISDBT_BW_6M,
    36*1000*1000,
    AVL_AGC_NORMAL
};

AVL_DVBCConfig AVL_DVBCConfigChip1 =
{
    AVL_IF_I,
    36*1000*1000,
    6952000 /* 6875*1000 */,
    AVL_AGC_NORMAL,
    AVL_DVBC_J83A
};

AVL_DTMBConfig AVL_DTMBConfigChip1 =
{
    AVL_IF_I,
    36*1000*1000,
    7560*1000,
    AVL_AGC_NORMAL
};

