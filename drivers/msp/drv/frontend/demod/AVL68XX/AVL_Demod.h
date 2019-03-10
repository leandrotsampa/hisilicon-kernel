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


#ifndef AVL_Demod_H
#define AVL_Demod_H
#ifndef _AVL68XX_
#define _AVL68XX_
#endif

#include "AVL_Bsp.h"

#include "AVL_Demod_CommonInternal.h"

#if defined(_AVL68XX_)
#include "AVL_Demod_DVBSx.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_DVBTx.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_DVBC.h"
#endif

#if defined(_AVL68XX_)
#include "AVL_Demod_ISDBT.h"
#endif

#if defined(_AVL63XX_)
#include "AVL_Demod_DTMB.h"
#endif

#ifdef AVL_CPLUSPLUS
extern "C" {
#endif

#define AVL_EC_OK                   0           // There is no error.
#define AVL_EC_WARNING              1           // There is warning.
#define AVL_EC_GENERAL_FAIL         2           // A general failure has occurred.
#define AVL_EC_I2C_FAIL             4           // An I2C operation failed during communication with the AVLEM61 through the BSP.
#define AVL_EC_I2C_REPEATER_FAIL    8           // An error ocurred during communication between AVLEM61 I2C master and tuner. This error code is defined by enum AVLEM61_MessageType_II2C_Repeater_Status.
#define AVL_EC_RUNNING              16          // The AVLEM61 device is busy processing a previous receiver/i2c repeater command.
#define AVL_EC_TIMEOUT              32          // Operation failed in a given time period
#define AVL_EC_SLEEP                64          // Demod in sleep mode
#define AVL_EC_NOT_SUPPORTED        128         // Specified operation isn't support in current senario
#define AVL_EC_BSP_ERROR1           256         // BSP Error 1, if it's used, need to be customized
#define AVL_EC_BSP_ERROR2           512         // BSP Error 2, if it's used, need to be customized

#define AVL_CONSTANT_10_TO_THE_9TH      1000000000  //10e9



#define AVL_min(x,y) (((x) < (y)) ? (x) : (y))
#define AVL_max(x,y) (((x) < (y)) ? (y) : (x))
#define AVL_floor(a) (((a) == (int)(a))? ((int)(a)) : (((a) < 0)? ((int)((a)-1)) : ((int)(a))))
#define AVL_ceil(a)  (((a) == (int)(a))? ((int)(a)) : (((a) < 0)? ((int)(a)) : ((int)((a)+1))))
#define AVL_abs(a)  (((a)>0) ? (a) : (-(a)))


/// Chunk two bytes uidata in to pBuff.
///
/// @param uidata The input 2 bytes data.
/// @param pBuff The destination buffer, at least 2 bytes length.
///
/// @remarks This function is used to eliminates the big endian and little endian problem.
void Chunk16_Demod(AVL_uint16 uidata, AVL_puchar pBuff);

/// Composes a ::AVL_uint16 from two bytes in a AVL_uchar array.
///
/// @param pBuff  The buffer has at least 2 bytes data.
///
/// @return AVL_uint16
/// @remarks This function is used to eliminates the big endian and little endian problem.
AVL_uint16 DeChunk16_Demod(const AVL_puchar pBuff);

/// Chunk four bytes \a uidata in to \a pBuff.
///
/// @param uidata The input 3 bytes data.
/// @param pBuff The destination buffer, at least 3 bytes length.
///
/// @remarks This function is used to eliminates the big endian and little endian problem.
void Chunk32_Demod(AVL_uint32 uidata, AVL_puchar pBuff);

/// Composes a ::AVL_uint16 from four bytes in a AVL_uchar array.
///
/// @param pBuff  The buffer has at least 4 bytes data.
///
/// @return AVL_uint32
/// @remarks This function is used to eliminates the big endian and little endian problem.
AVL_uint32 DeChunk32_Demod(const AVL_puchar pBuff);

/// Chunk 3 byte of \a uiaddr into the \a pBuff
///
/// @param uiaddr The address. Only the three LSB bytes will be used.
/// @param pBuff The destination buffer, at lease three bytes length.
///
/// @remarks This function is used to eliminates the big endian and little endian problem.
void ChunkAddr_Demod(AVL_uint32 uiaddr, AVL_puchar pBuff);

/// Adds a 32-bit unsigned integer to a 64-bit unsigned integer.  Stores the result in a 64-bit unsigned integer.
///
/// @param pSum Contains the 64-bit addend.  Also carries back the resulting sum.
/// @param uiAddend Contains the 32-bit addend.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
void Add32To64_Demod(AVLuint64 *pSum, AVL_uint32 uiAddend);

/// Divides two 64-bit unsigned integers.  Stores the result in a 64-bit unsigned integer.
///
/// @param y Contains the 64-bit divisor.  Also carries back the result.
/// @param x Contains the 64-bit dividend.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
AVL_uint32 Divide64_Demod(AVLuint64 y, AVLuint64 x);


/// Compares two 64-bit unsigned integers to determine whether the first integer is greater than or equal to the second integer.
///
/// @param a Number which is compared.
/// @param b Number against which the comparison takes place.
///
/// @return :: Returns 1 if a >= b, 0 otherwise.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
AVL_uint32 GreaterThanOrEqual64_Demod(AVLuint64 a, AVLuint64 b);

/// Subtracts a 64-bit unsigned integer (the subtrahend) from another 64-bit unsigned integer (the minuend).  Stores the result in a 64-bit unsigned integer.
///
/// @param pA Contains the 64-bit minuend.  This is the number from which the other input is subtracted.  The contents of pA must be larger than b.
/// @param b Contains the 64-bit subtrahend.  Also stores the result of the subtraction operation.  This is the number which is subtracted from the other input.  Must be smaller than the contents of pA.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
void Subtract64_Demod(AVLuint64 *pA, AVLuint64 b);


/// Multiplies two 32-bit unsigned integers.  Stores the result in a 64-bit unsigned integer.
///
/// @param pDst Carries back the 64-bit product of the multiplication.
/// @param m1 Contains one of the 32-bit factors to be used in the multiplication.
/// @param m2 Contains the other 32-bit factor to be used in the multiplication.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
void Multiply32_Demod(AVLuint64 *pDst, AVL_uint32 m1, AVL_uint32 m2);

/// Shifts a 32-bit unsigned integer left by 16 bits and then adds the result to a 64-bit unsigned integer.  Stores the sum in a 64-bit unsigned integer.
///
/// @param pDst Contains the 64-bit addend.  Also carries back the resulting sum.
/// @param a Contains the 32-bit input which is shifted and added to the other addend.
///
/// @remarks This function is an 'internal' function. Availink does not recommend that the user call it directly.
void AddScaled32To64_Demod(AVLuint64 *pDst, AVL_uint32 a);

AVL_ErrorCode AVL_Demod_Initialize(AVL_DemodMode eStartupMode, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetChipID(AVL_puint32 puiChipID,AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetLockStatus(AVL_puchar pucDemodLocked, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetSNR (AVL_puint32 puiSNRx100, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetSQI (AVL_puint16 pusSQI, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetSSI(AVL_puint16 pusSSI, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetPER(AVL_uint32 *puiPERxe9, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_SetMode(AVL_DemodMode eDemodMode,AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_Sleep(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_Wakeup(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_I2CBypassOn(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_I2CBypassOff(AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetVersion(AVL_DemodVersion *pstDemodVersion, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_SetGPIO(AVL_GPIOPinNumber ePinNumber, AVL_GPIOPinValue ePinValue, AVL_uint32 uiChipNo);
AVL_ErrorCode AVL_Demod_GetGPIOValue(AVL_GPIOPinNumber ePinNumber, AVL_GPIOPinValue *pePinValue, AVL_uint32 uiChipNo);

#ifdef AVL_CPLUSPLUS
}
#endif

#endif
