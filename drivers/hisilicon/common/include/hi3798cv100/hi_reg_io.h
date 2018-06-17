//******************************************************************************
// Copyright     :  Copyright (C) 2013, Hisilicon Technologies Co., Ltd.
// File name     :  hi_reg_io.h
// Author        :
// Version       :  1.0
// Date          :  2013-09-04
// Description   :  The C union definition file for the module IO
// Others        :  Generated automatically by nManager V4.0
//******************************************************************************

#ifndef __HI_REG_IO_H__
#define __HI_REG_IO_H__

/* Define the union U_ioshare_reg0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_reg          : 32   ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_reg;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_ioshare_reg        ioshare_reg0             ; /* 0x0 */
    volatile U_ioshare_reg        ioshare_reg1             ; /* 0x4 */
    volatile U_ioshare_reg        ioshare_reg2             ; /* 0x8 */
    volatile U_ioshare_reg        ioshare_reg3             ; /* 0xc */
    volatile U_ioshare_reg        ioshare_reg4             ; /* 0x10 */
    volatile U_ioshare_reg        ioshare_reg5             ; /* 0x14 */
    volatile U_ioshare_reg        ioshare_reg6             ; /* 0x18 */
    volatile U_ioshare_reg        ioshare_reg7             ; /* 0x1c */
    volatile U_ioshare_reg        ioshare_reg8             ; /* 0x20 */
    volatile U_ioshare_reg        ioshare_reg9             ; /* 0x24 */
    volatile U_ioshare_reg        ioshare_reg10            ; /* 0x28 */
    volatile U_ioshare_reg        ioshare_reg11            ; /* 0x2c */
    volatile U_ioshare_reg        ioshare_reg12            ; /* 0x30 */
    volatile U_ioshare_reg        ioshare_reg13            ; /* 0x34 */
    volatile U_ioshare_reg        ioshare_reg14            ; /* 0x38 */
    volatile U_ioshare_reg        ioshare_reg15            ; /* 0x3c */
    volatile U_ioshare_reg        ioshare_reg16            ; /* 0x40 */
    volatile U_ioshare_reg        ioshare_reg17            ; /* 0x44 */
    volatile U_ioshare_reg        ioshare_reg18            ; /* 0x48 */
    volatile U_ioshare_reg        ioshare_reg19            ; /* 0x4c */
    volatile U_ioshare_reg        ioshare_reg20            ; /* 0x50 */
    volatile U_ioshare_reg        ioshare_reg21            ; /* 0x54 */
    volatile U_ioshare_reg        ioshare_reg22            ; /* 0x58 */
    volatile U_ioshare_reg        ioshare_reg23            ; /* 0x5c */
    volatile U_ioshare_reg        ioshare_reg24            ; /* 0x60 */
    volatile U_ioshare_reg        ioshare_reg25            ; /* 0x64 */
    volatile U_ioshare_reg        ioshare_reg26            ; /* 0x68 */
    volatile U_ioshare_reg        ioshare_reg27            ; /* 0x6c */
    volatile U_ioshare_reg        ioshare_reg28            ; /* 0x70 */
    volatile U_ioshare_reg        ioshare_reg29            ; /* 0x74 */
    volatile U_ioshare_reg        ioshare_reg30            ; /* 0x78 */
    volatile U_ioshare_reg        ioshare_reg31            ; /* 0x7c */
    volatile U_ioshare_reg        ioshare_reg32            ; /* 0x80 */
    volatile U_ioshare_reg        ioshare_reg33            ; /* 0x84 */
    volatile U_ioshare_reg        ioshare_reg34            ; /* 0x88 */
    volatile U_ioshare_reg        ioshare_reg35            ; /* 0x8c */
    volatile U_ioshare_reg        ioshare_reg36            ; /* 0x90 */
    volatile U_ioshare_reg        ioshare_reg37            ; /* 0x94 */
    volatile U_ioshare_reg        ioshare_reg38            ; /* 0x98 */
    volatile U_ioshare_reg        ioshare_reg39            ; /* 0x9c */
    volatile U_ioshare_reg        ioshare_reg40            ; /* 0xa0 */
    volatile U_ioshare_reg        ioshare_reg41            ; /* 0xa4 */
    volatile U_ioshare_reg        ioshare_reg42            ; /* 0xa8 */
    volatile U_ioshare_reg        ioshare_reg43            ; /* 0xac */
    volatile U_ioshare_reg        ioshare_reg44            ; /* 0xb0 */
    volatile U_ioshare_reg        ioshare_reg45            ; /* 0xb4 */
    volatile U_ioshare_reg        ioshare_reg46            ; /* 0xb8 */
    volatile U_ioshare_reg        ioshare_reg47            ; /* 0xbc */
    volatile U_ioshare_reg        ioshare_reg48            ; /* 0xc0 */
    volatile U_ioshare_reg        ioshare_reg49            ; /* 0xc4 */
    volatile U_ioshare_reg        ioshare_reg50            ; /* 0xc8 */
    volatile U_ioshare_reg        ioshare_reg51            ; /* 0xcc */
    volatile U_ioshare_reg        ioshare_reg52            ; /* 0xd0 */
    volatile U_ioshare_reg        ioshare_reg53            ; /* 0xd4 */
    volatile U_ioshare_reg        ioshare_reg54            ; /* 0xd8 */
    volatile U_ioshare_reg        ioshare_reg55            ; /* 0xdc */
    volatile U_ioshare_reg        ioshare_reg56            ; /* 0xe0 */
    volatile U_ioshare_reg        ioshare_reg57            ; /* 0xe4 */
    volatile U_ioshare_reg        ioshare_reg58            ; /* 0xe8 */
    volatile U_ioshare_reg        ioshare_reg59            ; /* 0xec */
    volatile U_ioshare_reg        ioshare_reg60            ; /* 0xf0 */
    volatile U_ioshare_reg        ioshare_reg61            ; /* 0xf4 */
    volatile U_ioshare_reg        ioshare_reg62            ; /* 0xf8 */
    volatile U_ioshare_reg        ioshare_reg63            ; /* 0xfc */
    volatile U_ioshare_reg        ioshare_reg64            ; /* 0x100 */
    volatile U_ioshare_reg        ioshare_reg65            ; /* 0x104 */
    volatile U_ioshare_reg        ioshare_reg66            ; /* 0x108 */
    volatile U_ioshare_reg        ioshare_reg67            ; /* 0x10c */
    volatile U_ioshare_reg        ioshare_reg68            ; /* 0x110 */
    volatile U_ioshare_reg        ioshare_reg69            ; /* 0x114 */
    volatile U_ioshare_reg        ioshare_reg70            ; /* 0x118 */
    volatile U_ioshare_reg        ioshare_reg71            ; /* 0x11c */
    volatile U_ioshare_reg        ioshare_reg72            ; /* 0x120 */
    volatile U_ioshare_reg        ioshare_reg73            ; /* 0x124 */
    volatile U_ioshare_reg        ioshare_reg74            ; /* 0x128 */
    volatile U_ioshare_reg        ioshare_reg75            ; /* 0x12c */
    volatile U_ioshare_reg        ioshare_reg76            ; /* 0x130 */
    volatile U_ioshare_reg        ioshare_reg77            ; /* 0x134 */
    volatile U_ioshare_reg        ioshare_reg78            ; /* 0x138 */
    volatile U_ioshare_reg        ioshare_reg79            ; /* 0x13c */
    volatile U_ioshare_reg        ioshare_reg80            ; /* 0x140 */
    volatile U_ioshare_reg        ioshare_reg81            ; /* 0x144 */
    volatile U_ioshare_reg        ioshare_reg82            ; /* 0x148 */
    volatile U_ioshare_reg        ioshare_reg83            ; /* 0x14c */
    volatile U_ioshare_reg        ioshare_reg84            ; /* 0x150 */
    volatile U_ioshare_reg        ioshare_reg85            ; /* 0x154 */
    volatile U_ioshare_reg        ioshare_reg86            ; /* 0x158 */
    volatile U_ioshare_reg        ioshare_reg87            ; /* 0x15c */
    volatile U_ioshare_reg        ioshare_reg88            ; /* 0x160 */
    volatile U_ioshare_reg        ioshare_reg89            ; /* 0x164 */
    volatile U_ioshare_reg        ioshare_reg90            ; /* 0x168 */
    volatile U_ioshare_reg        ioshare_reg91            ; /* 0x16c */
    volatile U_ioshare_reg        ioshare_reg92            ; /* 0x170 */
    volatile U_ioshare_reg        ioshare_reg93            ; /* 0x174 */
    volatile U_ioshare_reg        ioshare_reg94            ; /* 0x178 */
    volatile U_ioshare_reg        ioshare_reg95            ; /* 0x17c */
    volatile U_ioshare_reg        ioshare_reg96            ; /* 0x180 */
    volatile U_ioshare_reg        ioshare_reg97            ; /* 0x184 */
    volatile U_ioshare_reg        ioshare_reg98            ; /* 0x188 */
    volatile U_ioshare_reg        ioshare_reg99            ; /* 0x18c */
    volatile U_ioshare_reg        ioshare_reg100           ; /* 0x190 */
    volatile U_ioshare_reg        ioshare_reg101           ; /* 0x194 */
    volatile U_ioshare_reg        ioshare_reg102           ; /* 0x198 */
    volatile U_ioshare_reg        ioshare_reg103           ; /* 0x19c */
    volatile U_ioshare_reg        ioshare_reg104           ; /* 0x1a0 */
    volatile U_ioshare_reg        ioshare_reg105           ; /* 0x1a4 */
    volatile U_ioshare_reg        ioshare_reg106           ; /* 0x1a8 */
    volatile U_ioshare_reg        ioshare_reg107           ; /* 0x1ac */
    volatile U_ioshare_reg        ioshare_reg108           ; /* 0x1b0 */
    volatile U_ioshare_reg        ioshare_reg109           ; /* 0x1b4 */
    volatile U_ioshare_reg        ioshare_reg110           ; /* 0x1b8 */
    volatile U_ioshare_reg        ioshare_reg111           ; /* 0x1bc */
    volatile U_ioshare_reg        ioshare_reg112           ; /* 0x1c0 */
    volatile U_ioshare_reg        ioshare_reg113           ; /* 0x1c4 */
    volatile U_ioshare_reg        ioshare_reg114           ; /* 0x1c8 */
    volatile U_ioshare_reg        ioshare_reg115           ; /* 0x1cc */
    volatile U_ioshare_reg        ioshare_reg116           ; /* 0x1d0 */
    volatile U_ioshare_reg        ioshare_reg117           ; /* 0x1d4 */
    volatile U_ioshare_reg        ioshare_reg118           ; /* 0x1d8 */
    volatile U_ioshare_reg        ioshare_reg119           ; /* 0x1dc */
    volatile U_ioshare_reg        ioshare_reg120           ; /* 0x1e0 */
    volatile U_ioshare_reg        ioshare_reg121           ; /* 0x1e4 */
    volatile U_ioshare_reg        ioshare_reg122           ; /* 0x1e8 */
    volatile U_ioshare_reg        ioshare_reg123           ; /* 0x1ec */
    volatile U_ioshare_reg        ioshare_reg124           ; /* 0x1f0 */
    volatile U_ioshare_reg        ioshare_reg125           ; /* 0x1f4 */
    volatile U_ioshare_reg        ioshare_reg126           ; /* 0x1f8 */
    volatile U_ioshare_reg        ioshare_reg127           ; /* 0x1fc */
    volatile U_ioshare_reg        ioshare_reg128           ; /* 0x200 */
    volatile U_ioshare_reg        ioshare_reg129           ; /* 0x204 */
    volatile U_ioshare_reg        ioshare_reg130           ; /* 0x208 */
    volatile U_ioshare_reg        ioshare_reg131           ; /* 0x20c */
    volatile U_ioshare_reg        ioshare_reg132           ; /* 0x210 */
} S_IO_REGS_TYPE;

#endif /* __HI_REG_IO_H__ */

