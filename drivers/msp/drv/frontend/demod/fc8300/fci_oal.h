/*****************************************************************************
	Copyright(c) 2013 FCI Inc. All Rights Reserved

	File name : fci_oal.h

	Description : header of OS adaptation layer

	History :
	----------------------------------------------------------------------
*******************************************************************************/
#ifndef __FCI_OAL_H__
#define __FCI_OAL_H__

#ifdef __cplusplus
extern "C" {
#endif

extern void PRINTF(HANDLE handle, s8 *fmt, ...);
extern void msWait(s32 ms);
extern void OAL_CREATE_SEMAPHORE(void);
extern void OAL_DELETE_SEMAPHORE(void);
extern void OAL_OBTAIN_SEMAPHORE(void);
extern void OAL_RELEASE_SEMAPHORE(void);

#ifdef __cplusplus
}
#endif

#endif /* __FCI_OAL_H__ */

