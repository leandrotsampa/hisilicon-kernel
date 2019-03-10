#ifndef __AVL68XX_API_H__
#define __AVL68XX_API_H__

#include "AVL_Demod.h"

typedef struct s_DVBTx_Channel_TS
{
    // number, example 474*1000 is RF frequency 474MHz.
    int channel_freq_khz;
    // number, example 8000 is 8MHz bandwith channel.
    int channel_bandwith_khz;

    AVL_DVBTx_Standard channel_type;
    // 0 - Low priority layer, 1 - High priority layer
    unsigned char dvbt_hierarchy_layer;
    // data PLP id, 0 to 255; for single PLP DVBT2 channel, this ID is 0; for DVBT channel, this ID isn't used.
    unsigned char data_plp_id;
    AVL_DVBT2_PROFILE channel_profile;
} s_DVBTx_Channel_TS;




#define MAX_CHANNEL_INFO 256
//static s_DVBTx_Channel_TS global_channel_ts_table[MAX_CHANNEL_INFO];
//static AVL_uint16 g_nChannel_ts_total = 0;


typedef struct s_DVBTx_Channel_TSinfo
{
    s_DVBTx_Channel_TS  global_channel_ts_table[MAX_CHANNEL_INFO];
    AVL_uint16 g_nChannel_ts_total;
} s_DVBTx_Channel_TSinfo;

#endif