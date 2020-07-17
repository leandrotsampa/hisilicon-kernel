/*****************************************************************************

 Copyright(c) 2013 FCI Inc. All Rights Reserved

*******************************************************************************/
#ifndef __FC8300_TSIF_H__
#define __FC8300_TSIF_H__

#ifdef __cplusplus
extern "C" {
#endif

enum AC_DATA_TYPE {
	AC_DEMOD_A,
	AC_DEMOD_B,
	AC_DEMOD_C,
	AC_DECODED
};

extern int fc8300_tsif_demux(u8 *data, u32 length);
extern void fc8300_tsif_ts_callback(u32 userdata,
		int (*ts_callback)(u32 userdata, u8 *data, int length));
extern void fc8300_tsif_ac_callback(u32 userdata,
		int (*ac_callback)(u32 userdata,
		enum AC_DATA_TYPE ac_type, u8 *data, int length));
extern void fc8300_tsif_reset();

#ifdef __cplusplus
}
#endif

#endif /* __FC8300_TSIF_H__ */
