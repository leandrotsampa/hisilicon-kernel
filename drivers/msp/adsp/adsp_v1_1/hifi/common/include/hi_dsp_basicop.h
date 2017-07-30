/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name	: hi_dsp_basicop.h
  Version	: Initial Draft
  Author	: Hisilicon multimedia software group
  Created	: 2012/10/08
  Description	:
  History	:
  1.Date	: 2013/02/28
    Author	: zgjie
    Modification: Created file

 *******************************************************************************/

/* SPDX-License-Identifier: GPL-2.0 */

#ifndef __HI_DSP_BASICOP__H__
#define __HI_DSP_BASICOP__H__

#include "hi_type.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C"
{
 #endif
#endif

#ifndef MAX_32
 #define MAX_32 (HI_S32)0x7fffffffL
#endif

#ifndef MIN_32
 #define MIN_32 (HI_S32)0x80000000L
#endif

#ifndef MAX_24
 #define MAX_24 ((HI_S32)0x007fffffL)
#endif

#ifndef MIN_24
 #define MIN_24 ((HI_S32)0xff800000L)
#endif

#ifndef MAX_16
 #define MAX_16 (HI_S16)0x7fff
#endif

#ifndef MIN_16
 #define MIN_16 (HI_S16)0x8000
#endif

#ifndef __GNUC__
#define __GNUC__
#endif
#ifndef __arm__
#define __arm__
#endif

#define saturate_16bit CLIPTOSHORT
static __inline	 HI_S32	 saturate_24bit(HI_S32 x)
{
    HI_S32 sign;

    /* clip to [0x7fffff, 0x800000] */
    sign = x >> 31;
    if (sign != (x >> 23))
    {
	x = sign ^ ((1 << 23) - 1);
    }

    return (HI_S32)x;
}

static __inline HI_S32 MULT16_32_Q23(HI_S16 x16, HI_S32 y)
{
    return (HI_S32)(((HI_S64)(x16) * y) >> 23);
}

static __inline HI_S32 MULT32_32_Q23(HI_S32 x32, HI_S32 y)
{
    return (HI_S32)(((HI_S64)(x32) * y) >> 23);
}

/*
 * target architecture: x86/arm64
 */
#if defined (__aarch64__) || defined (_WIN32) || defined (WIN32)


static __inline HI_S32 mult32(HI_S32 x, HI_S32 y)
{
#ifdef __aarch64__
    y = (HI_S32)((((HI_S64) x) * y) >> 32);

    return y;
#elif defined (_WIN32) || defined (WIN32)
    __asm {
	mov eax, x
	imul y
	mov eax, edx
    }
#endif
}

static __inline HI_S32 Integer_Mult(HI_S32 x, HI_S32 y)
{
    return x * y;
}

static __inline HI_S32 MUL32_16T(HI_S32 x, HI_S32 y)
{
    return mult32(x, y & 0xffff0000L);
}

static __inline HI_S32 MUL32_16B(HI_S32 x, HI_S32 y)
{
    return mult32(x, y << 16);
}

static __inline HI_S32 MULF32_16T(HI_S32 x, HI_S32 y)
{
    return mult32(x, y & 0xffff0000L) << 1;
}

static __inline HI_S32 MULF32_16B(HI_S32 x, HI_S32 y)
{
    return mult32(x, y << 16) << 1;
}

static __inline HI_S32 MLA32_16T(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL32_16T(x, y);
}

static __inline HI_S32 MLA32_16B(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL32_16B(x, y);
}

static __inline HI_S32 MUL16BB(HI_S32 x, HI_S32 y)
{
    return mult32(x << 16, y << 16);
}

static __inline HI_S32 MUL16BT( HI_S32 x, HI_S32 y)
{
    return mult32(x << 16, y & 0xffff0000L);
}

static __inline HI_S32 MUL16TB( HI_S32 x, HI_S32 y)
{
    return mult32(x & 0xffff0000L, y << 16);
}

static __inline HI_S32 MUL16TT( HI_S32 x, HI_S32 y)
{
    return mult32(x & 0xffff0000L, y & 0xffff0000L);
}

static __inline HI_S32 MLA16BB(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL16BB(x, y);
}

static __inline HI_S32 MLA16BT(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL16BT(x, y);
}

static __inline HI_S32 MLA16TB(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL16TB(x, y);
}

static __inline HI_S32 MLA16TT(HI_S32 ret, HI_S32 x, HI_S32 y)
{
    return ret + MUL16TT(x, y);
}

static __inline HI_S32 QADD(HI_S32 x, HI_S32 y)
{
    HI_S32 out;

    out = x + y;
    if (((x ^ y) & MIN_32) == 0)
    {
	if ((out ^ x) & MIN_32)
	{
	    out = (x < 0) ? MIN_32 : MAX_32;
	}
    }

    return (out);
}

static __inline HI_S32 QSUB (HI_S32 x, HI_S32 y)
{
    HI_S32 out;

    out = x - y;
    if (((x ^ y) & MIN_32) != 0)
    {
	if ((out ^ x) & MIN_32)
	{
	    out = (x < 0L) ? MIN_32 : MAX_32;
	}
    }

    return (out);
}

static __inline HI_S32 QDADD(HI_S32 x, HI_S32 y)
{
    return QADD(x, QADD(y, y));
}

static __inline HI_S32 QDSUB(HI_S32 x, HI_S32 y)
{
    return QSUB(x, QADD(y, y));
}

static __inline HI_S16 CLIPTOSHORT(HI_S32 x)
{
    HI_S32 sign;

    /* clip to [-32768, 32767] */
    sign = x >> 31;
    if (sign != (x >> 15))
    {
	x = sign ^ ((1 << 15) - 1);
    }

    return (HI_S16)x;
}

static __inline HI_S32 FASTABS(HI_S32 x)
{
    HI_S32 y;

    y  = x - (((HI_U32)x) >> 31);
    y ^= (y >> 31);
    return y;
}

static __inline HI_S32 CLZ(HI_S32 x)
{
    HI_S32 Num;
    HI_S16 numZeros;

    Num = x;

    if (Num == 0)
    {
	return 32;
    }
    else if (Num < 0)
    {
	Num = ~Num;
    }

    /* count leading zeros with binary search */
    numZeros = 1;
    if (!((unsigned int)Num >> 16))  { numZeros += 16; Num <<= 16; }
    if (!((unsigned int)Num >> 24))  { numZeros +=  8; Num <<=	8; }
    if (!((unsigned int)Num >> 28))  { numZeros +=  4; Num <<=	4; }
    if (!((unsigned int)Num >> 30))  { numZeros +=  2; Num <<=	2; }

    numZeros -= ((unsigned int)Num >> 31);

    return (HI_S32)(numZeros);
}

#elif defined (__GNUC__) && defined (__arm__)

static __inline__ HI_S32 mult32(HI_S32 x, HI_S32 y)
{
    HI_S32 zlow;
#if !defined(PCLINT)
    __asm__ volatile ("smull %0,%1,%2,%3" : "=&r" (zlow), "=r" (y) : "r" (x), "1" (y) : "cc");
#endif
    return y;
}

static __inline__ HI_S32 Integer_Mult(HI_S32 x, HI_S32 y)
{
    HI_S32 zlow=0;
#if !defined(PCLINT)
    __asm__ volatile ("smull %0,%1,%2,%3" : "=&r" (zlow), "=r" (y) : "r" (x), "1" (y) : "cc");
#endif
    return zlow;
}

static __inline HI_S32 MUL32_16T(HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)
    __asm__ volatile ("smulwt %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MUL32_16B(HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smulwb %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MULF32_16T(HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smulwt  %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x),   [y] "r" (y));
    __asm__ volatile ("qadd    %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (ret), [y] "r" (ret));
#endif
    return ret;
}

static __inline HI_S32 MULF32_16B(HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smulwb  %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x),   [y] "r" (y));
    __asm__ volatile ("qadd    %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (ret), [y] "r" (ret));
#endif
    return ret;
}

static __inline HI_S32 MLA32_16T(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlawt %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MLA32_16B(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlawb %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 QDADD(HI_S32 Lvar1, HI_S32 Lvar2)
{
#if !defined(PCLINT)

    __asm__ volatile ("qdadd %[Result], %[x], %[y]" : [Result] "=r" (Lvar1) : [x] "r" (Lvar1), [y] "r" (Lvar2));

#endif
    return Lvar1;
}

static __inline HI_S32 QDSUB(HI_S32 Lvar1, HI_S32 Lvar2)
{
#if !defined(PCLINT)

    __asm__ volatile ("qdsub %[Result], %[x], %[y]" : [Result] "=r" (Lvar1) : [x] "r" (Lvar1), [y] "r" (Lvar2));

#endif
    return Lvar1;
}

static __inline HI_S32 QADD(HI_S32 Lvar1, HI_S32 Lvar2)
{
#if !defined(PCLINT)

    __asm__ volatile ("qadd %[Result], %[x], %[y]" : [Result] "=r" (Lvar1) : [x] "r" (Lvar1), [y] "r" (Lvar2));

#endif
    return Lvar1;
}

static __inline HI_S32 QSUB(HI_S32 Lvar1, HI_S32 Lvar2)
{
#if !defined(PCLINT)

    __asm__ volatile ("qsub %[Result], %[x], %[y]" : [Result] "=r" (Lvar1) : [x] "r" (Lvar1), [y] "r" (Lvar2));

#endif
    return Lvar1;
}

static __inline HI_S32 MUL16BB(HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smulbb %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MUL16BT( HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smulbt %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MUL16TB( HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smultb %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MUL16TT( HI_S32 x, HI_S32 y)
{
    HI_S32 ret=0;

#if !defined(PCLINT)

    __asm__ volatile ("smultt %[Result], %[x], %[y]" : [Result] "=r" (ret) : [x] "r" (x), [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MLA16BB(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlabb %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MLA16BT(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlabt %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MLA16TB(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlatb %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

static __inline HI_S32 MLA16TT(HI_S32 ret, HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smlatt %[Result], %[x], %[y], %[ret]" : [Result] "=r" (ret) : [ret] "r" (ret),[x] "r" (x),
		      [y] "r" (y));
#endif
    return ret;
}

 #ifdef FASK_MULSHIFT32
static __inline HI_S32 MULSHIFT32_FASK(HI_S32 x, HI_S32 y)
{
#if !defined(PCLINT)

    __asm__ volatile ("smulwt %[Result], %[x], %[y]" : [Result] "=r" (x) : [x] "r" (x), [y] "r" (y));

#endif
    return x;
}

 #else
  #define MULSHIFT32_FASK mult32
 #endif

static __inline HI_S16 CLIPTOSHORT(HI_S32 x)
{
    HI_S32 sign;

    /* clip to [-32768, 32767] */
    sign = x >> 31;
    if (sign != (x >> 15))
    {
	x = sign ^ ((1 << 15) - 1);
    }

    return (HI_S16)x;
}

static __inline HI_S32 FASTABS(HI_S32 x)
{
    HI_S32 y=0;
#if !defined(PCLINT)


    __asm__ volatile ("SUB    %[y], %[x], %[x2], LSR#31" : [y] "=r" (y) : [x] "r" (x), [x2] "r" (x));
    __asm__ volatile ("EOR    %[y], %[x], %[x2], ASR#31" : [y] "=r" (y) : [x] "r" (y), [x2] "r" (y));
#endif
    return y;
}

static __inline HI_S32 CLZ(HI_S32 x)
{
    HI_S32 numZeros=0;

#if !defined(PCLINT)

    __asm__ volatile ("CLZ    %[numZeros], %[x]" : [numZeros] "=r" (numZeros) : [x] "r" (x));
#endif
    return numZeros;
}

static __inline HI_U32 SWAP_QUAD_BYTE(HI_U32 v)
{
    //return (((HI_U32)(v) << 24) | ((((HI_U32)(v)&0x0000ff00) << 16)>>8) | ((((HI_U32)(v)&0x00ff0000) << 8)>>16) | (((HI_U32)(v))>>24));
    HI_S32 t;
#if !defined(PCLINT)


    __asm__ volatile ("EOR %[Ret], %[x], %[y], ROR#16" :  [Ret] "=r" (t) : [x] "r" (v), [y] "r" (v));
    __asm__ volatile ("LSR %[Ret], %[x],       #8" :	 [Ret] "=r" (t) : [x] "r" (t));
    __asm__ volatile ("BIC %[Ret], %[x],       #0xFF00" :[Ret] "=r" (t) : [x] "r" (t));
    __asm__ volatile ("EOR %[Ret], %[x], %[y], ROR#8" :	 [Ret] "=r" (v) : [x] "r" (t), [y] "r" (v));
#endif
    return v;
}

typedef long long Word64;

typedef union _U64
{
    Word64 w64;
    struct
    {
	/* ARM ADS = little endian */
	HI_U32 lo32;
	HI_S32 hi32;
    } r;
} U64;

 #if 1
static __inline Word64 MADD64(Word64 sum64, HI_S32 x, HI_S32 y)
{
    U64 u;
    HI_U32 lo32;
    HI_S32 hi32;

    u.w64 = sum64;
    lo32 = u.r.lo32;
    hi32 = u.r.hi32;
#if !defined(PCLINT)

    __asm__ ("smlal	%0, %1, %2, %3"	 : "+r" (lo32), "+r" (hi32)  : "%r" (x), "r" (y));
#endif
    u.r.lo32 = lo32;
    u.r.hi32 = hi32;
    return u.w64;
}

#else
static __inline Word64 MADD64(Word64 sum64, HI_S32 x, HI_S32 y)
{
    U64 u;

    u.w64 = sum64;

    __asm__ volatile ("smlal %0,%1,%2,%3" : "+&r" (u.r.lo32), "+&r" (u.r.hi32) : "r" (x), "r" (y) : "cc");

    return u.w64;
}
#endif

#else

#error "Unsupported platform in hi_dsp_basicop.h"

#endif	/* platforms */

#ifndef MAX
 #define MAX(a, b) ((a) > (b) ? (a) : (b))
#endif

#ifndef MIN
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
#endif

#define APPLY_SIGN(v, s) {(v) ^= (( HI_S32)(s) >> 31); (v) -= (( HI_S32)(s) >> 31);}

/* do y <<= n, clipping to range [-2^31, 2^31 - 1] (i.e. output has one guard bit) */
#define CLIP_MAX(y, n) {		   \
	HI_S32 sign = (y) >> 31;		   \
	if (sign != (y) >> (31 - (n)))	{	\
	    (y) = sign ^ (0x7fffffff);		\
	} else {				\
	    (y) = (y) << (n);			\
	}					\
    }

/* do y <<= n, clipping to range [-2^30, 2^30 - 1] (i.e. output has one guard bit) */
#define CLIP_2N_SHIFT(y, n) {			\
	HI_S32 sign = (y) >> 31;		   \
	if (sign != (y) >> (30 - (n)))	{	\
	    (y) = sign ^ (0x3fffffff);		\
	} else {				\
	    (y) = (y) << (n);			\
	}					\
    }

static __inline HI_S16 FASTABS_S(HI_S16 x)
{
    return (HI_S16)(FASTABS((HI_S32)(x << 16)) >> 16);
}

static __inline HI_U32 NormU32(HI_U32 a)
{
    return (HI_S16) (CLZ((HI_S32)a) - 1);
}

#define MUL32 mult32
#endif /* __HI_DSP_BASICOP__H__ */
