/*****************************************************************************

 Copyright(c) 2013 FCI Inc. All Rights Reserved

*******************************************************************************/
#include "fci_types.h"
#include "fc8300_tsif.h"
#include <string.h>

#define TS_PACKET_SIZE      188
#define PACKET_PAYLOAD_SIZE (TS_PACKET_SIZE - 4)

#define BUF_TS_SIZE         (320 * 188)
#define BUF_AC_A_SIZE       (204)
#define BUF_AC_B_SIZE       (2040)
#define BUF_AC_C_SIZE       (408)
#define BUF_AC_D_SIZE       (28)

#define SYNC_BYTE_TS        0x47
/*#define SYNC_BYTE_TS_A      0x4a
#define SYNC_BYTE_TS_B      0x4b
#define SYNC_BYTE_TS_C      0x4c*/
#define SYNC_BYTE_AC_A      0xa0
#define SYNC_BYTE_AC_B      0xb0
#define SYNC_BYTE_AC_C      0xc0
#define SYNC_BYTE_AC_D      0xd0

#define AC_IND_NONE         0x00
#define AC_IND_END          0x20
#define AC_IND_CONTINUE     0x40
#define AC_IND_START        0x80

struct tsif_data {
	u8	ind;
	u32	length;
	u8  *buffer;
};

struct tsif_header {
	u8  sync;
	u8	ind;
	u16	length;
};

static s32 (*fc8300_ac_callback)(u32 userdata,
		enum AC_DATA_TYPE ac_type, u8 *data, s32 length) = NULL;
static s32 (*fc8300_ts_callback)(u32 userdata,
		u8 *data, s32 length) = NULL;
static u32 fc8300_ac_user_data;
static u32 fc8300_ts_user_data;

static u8  buf_ac_a[BUF_AC_A_SIZE];
static u8  buf_ac_b[BUF_AC_B_SIZE];
static u8  buf_ac_c[BUF_AC_C_SIZE];
static u8  buf_ac_d[BUF_AC_D_SIZE];
static u8  buf_ts[BUF_TS_SIZE];

static struct tsif_data ac_data[] = {
	{0, 0, (u8 *) &buf_ac_a[0]},
	{0, 0, (u8 *) &buf_ac_b[0]},
	{0, 0, (u8 *) &buf_ac_c[0]},
	{0, 0, (u8 *) &buf_ac_d[0]}
};

static struct tsif_data ts_data[] = {
	{0, 0, (u8 *) &buf_ts[0]}
};

static int gather_ac(u8 *data)
{
	struct tsif_data *p;
	u8  sync = data[0];
	u8	ind = data[1];
	u16	length = (data[2] << 8) + data[3];
	u32 len;
	enum AC_DATA_TYPE ac_type;

	switch (sync) {
	case SYNC_BYTE_AC_A:
		p = &ac_data[0];
		ac_type = AC_DEMOD_A;
		break;
	case SYNC_BYTE_AC_B:
		p = &ac_data[1];
		ac_type = AC_DEMOD_B;
		break;
	case SYNC_BYTE_AC_C:
		p = &ac_data[2];
		ac_type = AC_DEMOD_C;
		break;
	case SYNC_BYTE_AC_D:
		p = &ac_data[3];
		ac_type = AC_DECODED;
		break;
	default:
		return BBM_NOK;
	}

	switch (ind) {
	case AC_IND_START:
		p->length = 0;
		break;
	case AC_IND_CONTINUE:
	case AC_IND_END:
		if (p->ind == AC_IND_END || p->ind == AC_IND_NONE)
			return BBM_NOK;
		break;
	default:
		return BBM_NOK;
	}

	len = (length >= PACKET_PAYLOAD_SIZE) ? PACKET_PAYLOAD_SIZE : length;
	memcpy((void *) &p->buffer[p->length], data + 4, len);
	p->length += len;
	p->ind = ind;

	if ((ind == AC_IND_END) || (ind == AC_IND_START && 184 >= length)) {
		if (fc8300_ac_callback)
			(*fc8300_ac_callback)(fc8300_ac_user_data,
					ac_type, p->buffer, p->length);

		p->length = 0;
		p->ind = AC_IND_NONE;
	}

	return BBM_OK;
}

static int gather_ts(u8 *data)
{
	memcpy((void *) (ts_data->buffer + ts_data->length),
			data, TS_PACKET_SIZE);
	ts_data->length += TS_PACKET_SIZE;

	if (ts_data->length < BUF_TS_SIZE)
		return BBM_OK;

	if (fc8300_ts_callback)
		(*fc8300_ts_callback)(fc8300_ts_user_data,
				ts_data->buffer, ts_data->length);

	ts_data->length = 0;

	return BBM_OK;
}

int fc8300_tsif_demux(u8 *data, u32 length)
{
	u32 i;

	for (i = 0; i < length; i += TS_PACKET_SIZE)  {
		if (data[i] == SYNC_BYTE_TS)
			gather_ts(&data[i]);
		else
			gather_ac(&data[i]);
	}

	return BBM_OK;
}

void fc8300_tsif_ts_callback(u32 userdata,
		int (*ts_callback)(u32 userdata, u8 *data, int length))
{
	fc8300_ts_user_data = userdata;
	fc8300_ts_callback = ts_callback;
}

void fc8300_tsif_ac_callback(u32 userdata, int (*ac_callback)(u32 userdata,
		enum AC_DATA_TYPE ac_type, u8 *data, int length))
{
	fc8300_ac_user_data = userdata;
	fc8300_ac_callback = ac_callback;
}

void fc8300_tsif_reset()
{
	ts_data[0].length = 0;

	ac_data[AC_DEMOD_A].length = 0;
	ac_data[AC_DEMOD_A].ind = AC_IND_NONE;
	ac_data[AC_DEMOD_B].length = 0;
	ac_data[AC_DEMOD_B].ind = AC_IND_NONE;
	ac_data[AC_DEMOD_C].length = 0;
	ac_data[AC_DEMOD_C].ind = AC_IND_NONE;
	ac_data[AC_DECODED].length = 0;
	ac_data[AC_DECODED].ind = AC_IND_NONE;
}
