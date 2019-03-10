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



#ifndef AVL_BSP_H
#define AVL_BSP_H
#include "linux/semaphore.h"
#include "drv_tuner_ioctl.h"

#ifdef AVL_CPLUSPLUS
extern "C" {
#endif

typedef  char AVL_char;     ///< 8 bits signed char data type.
typedef  unsigned char AVL_uchar;   ///< 8 bits unsigned char data type.

typedef  short AVL_int16;   ///< 16 bits signed char data type.
typedef  unsigned short AVL_uint16; ///< 16 bits unsigned char data type.

typedef  int AVL_int32;     ///< 32 bits signed char data type.
typedef  unsigned int AVL_uint32;   ///< 32 bits unsigned char data type.

typedef  char * AVL_pchar;  ///< pointer to a 8 bits signed char data type.
typedef  unsigned char * AVL_puchar; ///< pointer to a 8 bits unsigned char data type.

typedef  short * AVL_pint16;    ///< pointer to a 16 bits signed char data type.
typedef  unsigned short * AVL_puint16;  ///< pointer to a 16 bits unsigned char data type.

typedef  int * AVL_pint32;  ///< pointer to a 32 bits signed char data type.
typedef  unsigned int * AVL_puint32; ///< pointer to a 32 bits unsigned char data type.

typedef struct semaphore AVL_semaphore; 	///< the semaphore data type.
typedef struct semaphore * AVL_psemaphore;		///< the pointer to a semaphore data type.

// sky()
#define MAX_II2C_READ_SIZE  64	/* 64 */
#define MAX_II2C_WRITE_SIZE 64	/* 64 */


typedef AVL_uint16 AVL_ErrorCode;       // Defines the error code

// For this user defined function, Availink has a different implementation and the parameter list isn't 'avoid'.
#if defined(AVL_I2C_DEFINE)
AVL_uint32 AVL_IBSP_Initialize(System::String^ strServerName0, int iSocketPort0,System::String^ strServerName1, int iSocketPort1);
#else
AVL_uint32 AVL_IBSP_Initialize(void);
#endif

#if defined(AVL_INTERNAL)
AVL_uint32 AVL_IBSP_Reset(unsigned char SocketTag);
AVL_uint32 AVL_IBSP_SetPort( unsigned char SocketIndex);
#else
AVL_uint32 AVL_IBSP_Reset(void);
#endif

AVL_uint32 AVL_IBSP_Delay(AVL_uint32 uiDelay_ms);
// sky()
AVL_uint32 AVL_IBSP_I2C_Read (AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_puint16 puiSize);
AVL_uint32 AVL_IBSP_I2C_Write(AVL_uint16 uiSlaveBus, AVL_uint16 uiSlaveAddr, AVL_puchar pucBuff, AVL_puint16 puiSize);
AVL_uint32 AVL_IBSP_Dispose(void);
AVL_uint32 AVL_IBSP_InitSemaphore(AVL_psemaphore pSemaphore);
AVL_uint32 AVL_IBSP_ReleaseSemaphore(AVL_psemaphore pSemaphore);
AVL_uint32 AVL_IBSP_WaitSemaphore(AVL_psemaphore pSemaphore);
#ifdef AVL_CPLUSPLUS
}
#endif

#endif

