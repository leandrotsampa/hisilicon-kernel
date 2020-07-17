/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fc8300_isr.h

	Description : header of interrupt service routine

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FC8300_ISR__
#define __FC8300_ISR__

#ifdef __cplusplus
extern "C" {
#endif

extern u32 fc8300_ac_user_data;
extern u32 fc8300_ts_user_data;

extern s32 (*fc8300_ac_callback)(u32 userdata, u8 bufid, u8 *data, s32 length);
extern s32 (*fc8300_ts_callback)(u32 userdata, u8 bufid, u8 *data, s32 length);

extern void fc8300_isr(HANDLE handle);

#ifdef __cplusplus
}
#endif
#endif /* __FC8300_ISR__ */

