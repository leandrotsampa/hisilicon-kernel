#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetHalMemSize
	.type	VDMHAL_V400R003_GetHalMemSize, %function
VDMHAL_V400R003_GetHalMemSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 6291456
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetHalMemSize, .-VDMHAL_V400R003_GetHalMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_OpenHAL
	.type	VDMHAL_V400R003_OpenHAL, %function
VDMHAL_V400R003_OpenHAL:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L15
	ldp	w23, w22, [x19]
	ldr	w19, [x19, 8]
	cbz	w23, .L16
	mov	w0, 6291455
	cmp	w22, w0
	ble	.L17
	cmp	w19, wzr
	bgt	.L18
	sxtw	x20, w19
	ldr	x25, .LC14
	ldr	x21, .LC15
	mov	x2, 268
	add	x0, x20, x20, lsl 4
	mov	w1, 0
	lsl	x0, x0, 2
	ldr	x3, [x25, 96]
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 2
	blr	x3
	ldr	x24, .LC0
	lsl	x0, x20, 6
	ldr	x3, [x25, 96]
	sub	x0, x0, x20
	mov	w1, 4
	lsl	x0, x0, 2
	str	w1, [x21]
	sub	x25, x0, x20
	mov	x2, 1256
	mov	w1, 0
	add	x25, x0, x25, lsl 2
	add	x21, x24, x25
	mov	x0, x21
	blr	x3
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	mov	x2, x0
	ldr	x1, .LC17
	str	x0, [x24, x25]
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 53248
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_Phy2Vir
	mov	x2, x0
	ldr	x1, .LC19
	str	x0, [x21, 16]
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 1256
	add	w4, w23, 1023
	and	w4, w4, -1024
	add	w1, w23, w22
	smull	x19, w19, w0
	sub	w1, w1, w4
	mov	w2, 1024
	add	x0, x19, 56
	add	x19, x19, 896
	stp	w4, w1, [x21, 32]
	str	w2, [x21, 40]
	add	x0, x24, x0
	add	x2, x24, x19
	mov	w1, w4
	.p2align 2
.L8:
	str	w1, [x0], 4
	add	w1, w1, 1280
	cmp	x0, x2
	bne	.L8
	lsl	x0, x20, 6
	add	w2, w4, 266240
	sub	x0, x0, x20
	add	w2, w2, 3072
	lsl	x0, x0, 2
	add	w3, w2, 4096
	sub	x20, x0, x20
	mov	w7, 210
	add	w3, w3, 1024
	add	x0, x0, x20, lsl 2
	add	w1, w3, 32768
	add	x0, x24, x0
	add	w1, w1, 1023
	and	w1, w1, -32768
	add	w4, w1, 4427776
	add	w5, w1, 4370432
	str	w7, [x0, 1080]
	add	x7, x0, 1024
	add	w4, w4, 1024
	add	w5, w5, 2048
	add	w6, w1, 589824
	add	w8, w1, 45056
	stp	w2, w1, [x7, 80]
	stp	w1, w1, [x7, 88]
	str	w3, [x0, 1124]
	add	w3, w1, 1773568
	add	w3, w3, 1152
	add	w7, w1, 1093632
	add	w2, w1, 4390912
	cmp	w4, w3
	add	w2, w2, 1024
	str	w7, [x0, 1164]
	add	w7, w1, 4423680
	str	w5, [x0, 1192]
	str	w3, [x0, 1152]
	add	w5, w1, 4374528
	str	w2, [x0, 1204]
	add	w5, w5, 1024
	str	w2, [x0, 1220]
	csel	w2, w4, w3, cs
	add	w3, w7, 1024
	str	w3, [x0, 1200]
	add	w3, w1, 1769472
	add	w4, w6, 2048
	add	w3, w3, 2048
	str	w5, [x0, 1196]
	sub	w2, w2, w23
	add	w5, w1, 1179648
	add	w5, w5, 2048
	str	w1, [x0, 1172]
	str	w4, [x0, 1132]
	cmp	w22, w2
	add	w4, w1, 2142208
	str	w3, [x0, 1144]
	str	w3, [x0, 1148]
	add	w3, w1, 3190784
	str	w6, [x0, 1120]
	add	w1, w1, 4239360
	str	w6, [x0, 1128]
	str	wzr, [x0, 1156]
	str	w8, [x0, 1160]
	str	wzr, [x0, 1184]
	str	w5, [x0, 1136]
	str	w5, [x0, 1140]
	str	w4, [x0, 1168]
	str	w3, [x0, 1176]
	str	w1, [x0, 1208]
	bcc	.L9
	mov	x0, x21
	bl	H264HAL_V400R003_InitHal
	cmp	w0, wzr
	mov	x0, x21
	csetm	w19, ne
	bl	HEVCHAL_V400R003_InitHal
	cmp	w0, wzr
	csinv	w19, w19, wzr, eq
.L4:
	mov	w0, w19
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L18:
	ldr	x1, .LC13
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L9:
	ldr	x1, .LC21
	mov	w3, w22
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L16:
	ldr	x3, .LC9
.L13:
	ldr	x2, .LC5
	mov	w0, 0
	ldr	x1, .LC7
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L17:
	ldr	x3, .LC11
	b	.L13
.L15:
	ldr	x3, .LC4
	b	.L13
	.size	VDMHAL_V400R003_OpenHAL, .-VDMHAL_V400R003_OpenHAL
	.align	3
.LC0:
	.xword	g_HwMem
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	.LANCHOR0
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC15:
	.xword	g_VdmExtParam
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CloseHAL
	.type	VDMHAL_V400R003_CloseHAL, %function
VDMHAL_V400R003_CloseHAL:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_CloseHAL, .-VDMHAL_V400R003_CloseHAL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CalcFsSize
	.type	VDMHAL_V400R003_CalcFsSize, %function
VDMHAL_V400R003_CalcFsSize:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w24, w0
	mov	x0, x30
	mov	w26, w1
	mov	w23, w2
	mov	w22, w3
	mov	w27, w4
	mov	x25, x5
	bl	_mcount
	sub	w1, w26, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L21
	sub	w1, w23, #32
	mov	w6, w23
	cmp	w1, w0
	bhi	.L21
	ldr	x1, .LC26
	add	w0, w26, 15
	asr	w0, w0, 4
	add	w13, w23, 15
	asr	w13, w13, 4
	cmp	w0, 45
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w13, w1, 0, le
	mov	w19, 32
	cset	w3, le
	mov	w1, 64
	cmp	w3, wzr
	lsl	w28, w0, 4
	csel	w19, w19, w1, eq
	cmp	w2, 1
	csel	w19, w19, w1, ne
	cmp	w27, 16
	beq	.L26
	cmp	w27, 17
	beq	.L54
	mul	w19, w0, w19
	ldr	x4, .LC28
	add	w28, w28, 255
	add	w6, w23, 31
	and	w28, w28, -256
	mul	w19, w19, w13
	ldr	x0, [x4, w24, sxtw 3]
	and	w6, w6, -32
	add	w19, w19, 143
	mov	w9, 0
	and	w19, w19, -128
	mov	w10, 0
.L29:
	ldr	w1, [x0, 1248]
	cmp	w1, 1
	beq	.L55
.L52:
	asr	w12, w19, 1
	mov	w11, 0
	mov	w8, 0
	mov	w5, 0
.L32:
	cmp	w27, 3
	sub	w7, w27, #16
	ccmp	w27, wzr, 4, ne
	mov	w20, 1024
	ccmp	w7, 1, 0, ne
	cset	w1, hi
	cbnz	w1, .L34
	adds	w20, w23, 63
	add	w23, w23, 126
	csel	w20, w23, w20, mi
	and	w20, w20, -64
	cmp	w20, wzr
	add	w3, w20, 7
	csel	w20, w3, w20, lt
	add	w3, w26, 510
	asr	w2, w20, 3
	adds	w20, w26, 255
	csel	w20, w3, w20, mi
	asr	w20, w20, 8
	lsl	w20, w20, 6
	mul	w20, w2, w20
	add	w20, w20, 1024
.L34:
	cmp	w22, 1
	mul	w22, w6, w28
	beq	.L56
	mul	w1, w9, w10
	lsl	w21, w22, 2
	lsl	w3, w5, 2
	lsl	w2, w1, 2
	sub	w21, w21, w22
	sub	w2, w2, w1
	lsr	w21, w21, 1
	sub	w3, w3, w5
	add	w1, w21, w2, lsr 1
	add	w21, w1, w3, lsr 1
.L36:
	add	x1, x0, 323584
	ldr	w1, [x1, 3944]
	cbz	w1, .L57
	add	x2, x0, 327680
	cmp	w27, 17
	str	w8, [x2, 3228]
	str	w11, [x2, 3232]
	str	w12, [x2, 3524]
	str	w21, [x2, 3552]
	beq	.L38
.L60:
	add	x3, x0, 323584
	mov	w6, 32
	ldr	w1, [x3, 3952]
	cmp	w1, w6
	csel	w1, w1, w6, le
	str	w1, [x2, 3528]
	ldr	w1, [x0, 628]
	cmp	w1, 2
	beq	.L58
.L39:
	lsl	w28, w28, 4
	add	w1, w5, w22
	cmp	w7, 1
	str	w28, [x2, 2184]
	str	w1, [x2, 3252]
	bls	.L59
.L40:
	ldr	x0, [x4, w24, sxtw 3]
	mov	w5, 1024
	add	w1, w21, w20
	add	x3, x0, 327680
	add	w1, w1, 32
	add	w2, w1, w19
	add	w6, w2, w5
	str	w19, [x3, 3556]
	str	w5, [x3, 3564]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	csel	w2, w6, w2, eq
	cbz	x25, .L48
	str	w1, [x25, 4]
	mov	w0, 0
	ldr	x3, [x4, w24, sxtw 3]
	add	x3, x3, 323584
	ldr	w3, [x3, 3952]
	stp	w3, w19, [x25, 8]
	ldr	x3, [x4, w24, sxtw 3]
	add	x3, x3, 327680
	ldr	w3, [x3, 3528]
	stp	w3, w5, [x25, 16]
	str	w2, [x25]
	ldr	x2, [x4, w24, sxtw 3]
	add	x2, x2, 327680
	str	w1, [x2, 3560]
.L50:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L57:
	ldr	x1, .LC27
	add	x0, x0, 327680
	mov	x2, 1384
	add	x0, x0, 2184
	str	x4, [x29, 104]
	ldr	x3, [x1, 96]
	mov	w1, 0
	stp	w12, w5, [x29, 112]
	stp	w8, w11, [x29, 120]
	stp	w10, w9, [x29, 128]
	str	w7, [x29, 136]
	blr	x3
	ldr	x4, [x29, 104]
	cmp	w27, 17
	ldp	w8, w11, [x29, 120]
	ldp	w12, w5, [x29, 112]
	ldr	x0, [x4, w24, sxtw 3]
	ldp	w10, w9, [x29, 128]
	add	x2, x0, 327680
	ldr	w7, [x29, 136]
	str	w8, [x2, 3228]
	str	w11, [x2, 3232]
	str	w12, [x2, 3524]
	str	w21, [x2, 3552]
	bne	.L60
.L38:
	mov	w1, 1
	lsl	w28, w28, 4
	str	w1, [x2, 3528]
	cmp	w7, 1
	add	w1, w5, w22
	str	w28, [x2, 2184]
	str	w1, [x2, 3252]
	bhi	.L40
.L59:
	ldr	w0, [x0, 1540]
	cmp	w0, 8
	ble	.L40
	lsl	w6, w22, 2
	ldr	x1, .LC30
	sub	w6, w6, w22
	lsl	w22, w5, 2
	sub	w22, w22, w5
	lsr	w5, w5, 1
	lsr	w22, w22, 1
	mov	w0, 31
	madd	w9, w9, w10, w5
	add	w6, w22, w6, lsr 1
	lsl	w10, w10, 4
	str	w6, [x2, 3244]
	str	w10, [x2, 3236]
	str	w9, [x2, 3248]
	str	x4, [x29, 136]
	bl	dprint_vfmw
	ldr	x4, [x29, 136]
	b	.L40
	.p2align 3
.L26:
	ldr	x4, .LC28
	mul	w19, w13, w28
	add	w28, w26, 255
	ldr	x0, [x4, w24, sxtw 3]
	add	w19, w19, 143
	and	w28, w28, -256
	and	w19, w19, -128
	ldr	w1, [x0, 1540]
	cmp	w1, 8
	ble	.L61
	ldr	w1, [x0, 1248]
	add	w9, w23, 31
	and	w9, w9, -32
	lsr	w10, w28, 2
	cmp	w1, 1
	bne	.L52
	.p2align 2
.L55:
	cmp	w27, 17
	mov	w1, 1920
	ccmp	w26, w1, 0, ne
	ble	.L52
	add	w2, w23, 63
	asr	w12, w19, 1
.L44:
	adds	w8, w26, 2047
	add	w1, w26, 4094
	csel	w1, w1, w8, mi
	add	w5, w2, 63
	and	w1, w1, -2048
	cmp	w1, wzr
	add	w8, w1, 127
	csel	w8, w8, w1, lt
	cmp	w2, wzr
	csel	w2, w5, w2, lt
	asr	w8, w8, 7
	asr	w2, w2, 6
	lsl	w5, w8, 5
	mul	w5, w2, w5
	mov	w11, w5
	b	.L32
	.p2align 3
.L56:
	lsl	w1, w13, 6
	sub	w1, w1, w13, lsl 4
	mul	w21, w1, w28
	b	.L36
	.p2align 3
.L54:
	ldr	x4, .LC28
	add	w28, w26, 255
	add	w2, w23, 63
	and	w28, w28, -256
	and	w6, w2, -64
	ldr	x0, [x4, w24, sxtw 3]
	ldr	w1, [x0, 1540]
	cmp	w1, 8
	bgt	.L42
	mov	w9, 0
	mov	w10, 0
.L30:
	ldr	w1, [x0, 1248]
	mov	w12, 64
	movk	w12, 0x12, lsl 16
	cmp	w1, 1
	beq	.L49
	mov	w19, 128
	mov	w11, 0
	mov	w8, 0
	movk	w19, 0x24, lsl 16
	mov	w5, 0
	b	.L32
	.p2align 3
.L61:
	mov	w9, 0
	mov	w10, 0
	b	.L29
	.p2align 3
.L58:
	ldr	w1, [x3, 3956]
	str	w1, [x2, 3528]
	b	.L39
	.p2align 3
.L48:
	mov	w0, 0
	b	.L50
	.p2align 3
.L42:
	add	w9, w6, 63
	lsr	w10, w28, 2
	and	w9, w9, -64
	b	.L30
	.p2align 3
.L21:
	ldr	x2, .LC24
	mov	w0, 0
	ldr	x3, .LC23
	ldr	x1, .LC25
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -1
	b	.L50
	.p2align 3
.L49:
	mov	w19, 128
	movk	w19, 0x24, lsl 16
	b	.L44
	.size	VDMHAL_V400R003_CalcFsSize, .-VDMHAL_V400R003_CalcFsSize
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC24:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC6
	.align	3
.LC26:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC27:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC28:
	.xword	s_pstVfmwChan
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetRpuSize
	.type	VDMHAL_V400R003_GetRpuSize, %function
VDMHAL_V400R003_GetRpuSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1024
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetRpuSize, .-VDMHAL_V400R003_GetRpuSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem_Normal
	.type	VDMHAL_V400R003_ArrangeMem_Normal, %function
VDMHAL_V400R003_ArrangeMem_Normal:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	mov	w23, w4
	mov	x24, x5
	bl	_mcount
	add	x0, x29, 104
	cmp	w20, 20
	str	xzr, [x29, 120]
	stp	xzr, xzr, [x0]
	bhi	.L111
	ldr	x25, .LC35
	mov	w3, w23
	add	x5, x29, 104
	mov	w4, w20
	mov	w2, w21
	mov	w1, w22
	ldr	x0, [x25, w19, sxtw 3]
	add	x0, x0, 323584
	ldr	w23, [x0, 3948]
	mov	w0, w19
	bl	VDMHAL_V400R003_CalcFsSize
	cbnz	w0, .L112
	ldr	x26, [x25, w19, sxtw 3]
	ldr	w27, [x29, 104]
	add	x1, x26, 323584
	cmp	w23, w27
	ldr	w5, [x1, 3968]
	ldr	w23, [x1, 3952]
	beq	.L113
.L68:
	ldr	x2, .LC33
	mov	w4, w23
	ldr	x1, .LC39
	mov	w3, w27
	add	x2, x2, 96
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x1, [x25, w19, sxtw 3]
	add	x1, x1, 323584
	ldr	w0, [x1, 3944]
	str	w27, [x1, 3948]
	cbz	w0, .L114
	ldr	x2, .LC42
	ldr	w0, [x29, 112]
	str	w0, [x1, 3956]
	ldr	x4, [x2]
	cbz	x4, .L110
	ldr	w1, [x29, 108]
	mov	w3, 28
	ldr	w2, [x29, 120]
	stp	w0, w1, [x29, 128]
	ldr	w1, [x29, 116]
	ldr	w0, [x29, 124]
	stp	w1, w0, [x29, 140]
	str	w2, [x29, 136]
	mov	w1, 122
	stp	w22, w21, [x29, 148]
	add	x2, x29, 128
	mov	w0, w19
	blr	x4
.L110:
	ldr	x21, .LC43
.L79:
	ldr	x4, [x25, w19, sxtw 3]
	mov	w3, w23
	ldr	x1, .LC46
	mov	w2, w27
	add	x4, x4, 323584
	mov	w0, 31
	ldr	w4, [x4, 3968]
	bl	dprint_vfmw
	ldr	x19, [x25, w19, sxtw 3]
	ldr	x0, [x21]
	add	x19, x19, 327680
	blr	x0
	mov	w1, 2
	str	w0, [x19, 3568]
.L65:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w1
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L113:
	cmp	w5, 1
	beq	.L68
	ldr	w1, [x1, 3944]
	cmp	w1, 1
	beq	.L68
	cbz	x24, .L115
	add	x27, x26, 327680
	mov	x0, x26
	add	x20, x27, 2184
	ldr	w22, [x27, 3552]
	cbz	w23, .L116
.L81:
	add	x0, x0, 323584
	ldr	w2, [x0, 3956]
	cmp	w2, 30
	bgt	.L117
.L82:
	ldr	x21, .LC43
	add	x23, x27, 2184
	mov	w0, 8
	str	w2, [x23, 1080]
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x8, [x25, w19, sxtw 3]
	add	x10, x8, 327680
	ldr	w0, [x10, 3592]
	cbz	w0, .L87
	ldr	w12, [x23, 1036]
	mov	x5, x23
	ldr	w11, [x23, 1344]
	mov	w6, 0
	ldr	w7, [x23, 1348]
	mov	w9, 1
	.p2align 2
.L86:
	uxtw	x1, w6
	uxtw	x0, w7
	lsl	x2, x1, 6
	lsl	x4, x0, 2
	add	x2, x2, x1, lsl 3
	sub	x0, x4, x0
	add	x2, x8, x2
	add	x4, x26, x4
	add	x2, x2, 323584
	add	x0, x26, x0, lsl 2
	add	x0, x0, 327680
	add	x4, x4, 327680
	add	w7, w7, 1
	add	w6, w6, 1
	ldr	w13, [x2, 4008]
	mov	x1, x2
	ldr	w14, [x2, 3988]
	add	w3, w13, 1023
	strb	w9, [x0, 2200]
	str	w14, [x0, 2196]
	and	w3, w3, -1024
	str	w3, [x0, 2192]
	sub	w0, w22, w13
	add	w0, w0, w3
	add	w3, w13, w12
	add	w13, w13, w0
	add	w0, w3, w0
	str	w13, [x4, 3088]
	str	w0, [x4, 2576]
	str	w7, [x5, 1348]
	ldr	w0, [x2, 3980]
	cmp	w0, 255
	beq	.L84
	ldr	w0, [x5, 1356]
	ldr	w4, [x2, 4024]
	add	w3, w0, 1
	uxtw	x2, w0
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x5, x0, lsl 2
	str	w4, [x0, 520]
	str	w3, [x5, 1356]
.L84:
	ldr	w0, [x5, 1352]
	cmp	w0, w11
	bcs	.L85
	ldr	w2, [x1, 4040]
	add	x1, x26, x0, uxtw 3
	add	x1, x1, 327680
	add	w0, w0, 1
	strb	w9, [x1, 3272]
	str	w2, [x1, 3268]
	str	w0, [x5, 1352]
.L85:
	ldr	w0, [x10, 3592]
	cmp	w6, w0
	bcc	.L86
.L87:
	ldr	x3, [x21, 104]
	mov	x2, 1368
	mov	x1, x20
	mov	x0, x24
	blr	x3
	ldr	x1, [x25, w19, sxtw 3]
	mov	w3, 1
	ldr	x2, [x21, 32]
	mov	w0, 8
	add	x1, x1, 327680
	str	w3, [x1, 3596]
	blr	x2
	mov	w1, 0
	b	.L65
	.p2align 3
.L114:
	add	x1, x1, 3976
	mov	w0, w19
	bl	DelAllFrameMemRecord
	cbnz	w0, .L118
.L71:
	ldr	x1, [x25, w19, sxtw 3]
	mov	w2, 255
	add	x0, x1, 323584
	add	x1, x1, 327680
	add	x0, x0, 3976
	add	x1, x1, 2184
	.p2align 2
.L72:
	str	w2, [x0], 72
	cmp	x1, x0
	bne	.L72
	mov	w0, 1088
	cmp	w22, 1920
	ccmp	w21, w0, 0, le
	ldr	x0, [x25, w19, sxtw 3]
	ble	.L119
.L109:
	ldr	w2, [x29, 112]
	add	x4, x0, 331776
.L74:
	add	x3, x0, 323584
	ldr	w1, [x0, 1496]
	add	w1, w2, w1
	str	w1, [x3, 3956]
	ldr	w5, [x0, 628]
	cmp	w5, 2
	ccmp	w20, 17, 4, eq
	beq	.L77
	str	w1, [x29, 120]
.L77:
	add	x0, x0, 327680
	ldr	x1, .LC42
	str	wzr, [x0, 3592]
	mov	w0, 1
	str	w0, [x3, 3928]
	str	w0, [x4, 20]
	ldr	x4, [x1]
	cbz	x4, .L78
	ldr	w0, [x29, 108]
	ldp	w1, w3, [x29, 116]
	stp	w2, w0, [x29, 128]
	ldr	w0, [x29, 124]
	add	x2, x29, 128
	stp	w3, w1, [x29, 136]
	str	w0, [x29, 144]
	mov	w3, 28
	stp	w22, w21, [x29, 148]
	mov	w1, 121
	mov	w0, w19
	blr	x4
.L78:
	ldr	x21, .LC43
	mov	x2, 512
	ldr	x0, [x25, w19, sxtw 3]
	mov	w1, 0
	ldr	x3, [x21, 96]
	add	x0, x0, 327680
	add	x0, x0, 3600
	blr	x3
	ldr	x1, [x25, w19, sxtw 3]
	ldr	x0, .LC44
	add	x1, x1, 331776
	ldr	x0, [x0, w19, sxtw 3]
	str	wzr, [x1, 16]
	bl	FSP_ClearContextAll
	b	.L79
	.p2align 3
.L119:
	ldr	w1, [x0, 36]
	cmp	w1, 24
	beq	.L109
	add	x4, x0, 331776
	ldr	w2, [x29, 112]
	ldr	w1, [x4, 64]
	cbnz	w1, .L74
	add	w2, w2, 4
	str	w2, [x29, 112]
	b	.L74
.L118:
	ldr	x1, .LC41
	mov	w0, 0
	bl	dprint_vfmw
	b	.L71
.L116:
	ldr	x1, .LC50
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x25, w19, sxtw 3]
	b	.L81
.L117:
	ldr	x1, .LC52
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x25, w19, sxtw 3]
	mov	w1, 30
	mov	w2, w1
	add	x0, x0, 323584
	str	w1, [x0, 3956]
	b	.L82
.L111:
	ldr	x2, .LC33
	mov	w0, 0
	ldr	x1, .LC34
	ldr	x3, .LC32
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w1, -1
	b	.L65
.L112:
	ldr	x1, .LC37
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L65
.L115:
	ldr	x2, .LC33
	ldr	x1, .LC34
	ldr	x3, .LC48
	add	x2, x2, 136
	bl	dprint_vfmw
	mov	w1, -1
	b	.L65
	.size	VDMHAL_V400R003_ArrangeMem_Normal, .-VDMHAL_V400R003_ArrangeMem_Normal
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	.LC6
	.align	3
.LC35:
	.xword	s_pstVfmwChan
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	g_event_report
	.align	3
.LC43:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC44:
	.xword	s_pFspInst
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem_Specific
	.type	VDMHAL_V400R003_ArrangeMem_Specific, %function
VDMHAL_V400R003_ArrangeMem_Specific:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w24, w0
	mov	w23, w2
	mov	x0, x30
	mov	w25, w1
	mov	w19, w3
	mov	w22, w4
	mov	w26, w5
	mov	w21, w6
	mov	w27, w7
	ldr	x20, [x29, 144]
	bl	_mcount
	cbz	w23, .L208
	sub	w1, w22, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L123
	sub	w1, w26, #32
	cmp	w1, w0
	bhi	.L123
	cbz	x20, .L209
	ldr	x0, .LC60
	cmp	w21, 20
	mov	x2, 1368
	mov	w1, 0
	mov	w6, 20
	ldr	x3, [x0, 96]
	mov	x0, x20
	csel	w28, w21, w6, le
	mov	w21, 32
	blr	x3
	ldr	x1, .LC61
	add	w0, w22, 15
	asr	w0, w0, 4
	add	w7, w26, 15
	cmp	w0, 45
	asr	w7, w7, 4
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w7, w1, 0, le
	mov	w1, 64
	cset	w3, le
	lsl	w4, w0, 4
	cmp	w3, wzr
	csel	w21, w21, w1, eq
	cmp	w2, 1
	csel	w21, w21, w1, ne
	cmp	w25, 16
	beq	.L210
	cmp	w25, 17
	beq	.L131
	mul	w21, w0, w21
	mul	w21, w21, w7
	add	w21, w21, 143
	and	w21, w21, -128
	mul	w3, w28, w21
	cmp	w19, w3
	ble	.L129
	add	w4, w4, 255
	sub	w3, w19, w3
	asr	w0, w21, 1
	add	w19, w23, 1023
	str	w28, [x20, 1344]
	and	w28, w4, -256
	and	w19, w19, -1024
	str	w0, [x20, 1340]
	lsl	w0, w28, 4
	str	w0, [x20]
	sub	w6, w19, w23
	add	w8, w26, 31
	sub	w3, w3, w6
	and	w8, w8, -32
	tbnz	w24, #31, .L211
	ldr	x1, .LC64
	add	w11, w26, 63
	add	w2, w22, 255
	mov	w9, 0
	mov	w10, 0
	ldr	x0, [x1, w24, sxtw 3]
	ldr	w0, [x0, 1248]
	cmp	w0, 1
	beq	.L136
.L219:
	cmp	w11, wzr
	add	w0, w11, 63
	csel	w0, w0, w11, lt
	mov	w1, 0
	asr	w0, w0, 6
	mov	w12, 0
	mov	w5, 0
.L135:
	cmp	w2, wzr
	str	w1, [x20, 1048]
	add	w1, w2, 255
	lsl	w0, w0, 6
	csel	w2, w1, w2, lt
	cmp	w0, wzr
	asr	w2, w2, 8
	str	w12, [x20, 1044]
	lsl	w1, w2, 6
	add	w2, w0, 7
	csel	w2, w2, w0, lt
	ldr	w0, [x29, 128]
	asr	w2, w2, 3
	str	w1, [x20, 1032]
	cmp	w0, 1
	mul	w26, w2, w1
	str	w26, [x20, 1036]
	beq	.L212
	mul	w1, w28, w8
	mul	w7, w10, w9
	lsl	w0, w1, 2
	lsl	w22, w5, 2
	sub	w1, w0, w1
	lsl	w0, w7, 2
	sub	w0, w0, w7
	sub	w22, w22, w5
	asr	w0, w0, 1
	add	w0, w0, w1, asr 1
	add	w22, w0, w22, lsr 1
.L139:
	ldr	w0, [x29, 136]
	tbnz	w0, #31, .L140
	stp	w3, w6, [x29, 100]
	stp	w9, w10, [x29, 108]
	stp	w8, w5, [x29, 116]
	bl	VCTRL_GetChanWidth
	mov	w24, w0
	ldr	w0, [x29, 136]
	bl	VCTRL_GetChanHeight
	cmn	w24, #1
	ccmn	w0, #1, 4, ne
	ldp	w3, w6, [x29, 100]
	ldp	w9, w10, [x29, 108]
	ldp	w8, w5, [x29, 116]
	beq	.L213
	ldr	w1, [x29, 128]
	add	w24, w24, 15
	and	w24, w24, -16
	add	w0, w0, 15
	cmp	w1, 1
	add	w11, w24, 255
	and	w0, w0, -16
	and	w11, w11, -256
	beq	.L214
	ldr	x1, .LC64
	ldr	w2, [x29, 136]
	ldr	x1, [x1, w2, sxtw 3]
	ldr	w1, [x1, 1248]
	cmp	w1, 1
	beq	.L144
	add	w1, w0, 126
	adds	w0, w0, 63
	csel	w0, w1, w0, mi
	mov	w1, 0
	asr	w0, w0, 6
.L145:
	mul	w0, w11, w0
	lsl	w7, w0, 2
	sub	w0, w7, w0
	lsl	w0, w0, 6
	add	w0, w1, w0, asr 1
.L143:
	cmp	w22, w0
	ldr	w24, [x29, 136]
	bgt	.L215
.L140:
	mul	w4, w28, w8
	sub	w0, w25, #16
	cmp	w0, 1
	add	w0, w4, w5
	str	w0, [x20, 1068]
	bls	.L216
	cbz	w27, .L149
	cmp	w25, wzr
	ccmp	w25, 3, 4, ne
	beq	.L147
	sdiv	w3, w3, w22
	cmp	w27, 32
	mov	w0, 32
	str	wzr, [x20, 1040]
	csel	w27, w27, w0, le
	cmp	w3, w27
	csel	w4, w3, w27, le
	str	w4, [x20, 1080]
.L150:
	cbz	w4, .L148
	sub	w3, w4, #1
	mov	w0, 12
	mov	x1, 20
	ldr	w7, [x20, 1348]
	mov	x5, x3
	umaddl	x1, w3, w0, x1
	add	x0, x20, 8
	add	x1, x20, x1
	.p2align 2
.L153:
	str	w19, [x0], 12
	add	w19, w19, w22
	cmp	x1, x0
	bne	.L153
	madd	w22, w22, w4, w6
	add	x3, x3, 99
	add	w7, w4, w7
	add	w1, w22, w23
	add	x0, x20, 392
	add	x3, x20, x3, lsl 2
	str	w7, [x20, 1348]
	.p2align 2
.L155:
	str	w1, [x0], 4
	add	w1, w1, 32
	cmp	x3, x0
	bne	.L155
	ldr	w6, [x20, 1040]
	add	w22, w22, w4, lsl 5
	add	w0, w23, w22
	cbz	w6, .L156
	sub	w3, w6, #1
	add	x1, x20, 904
	add	x3, x3, 227
	add	x3, x20, x3, lsl 2
	.p2align 2
.L157:
	str	w0, [x1], 4
	add	w0, w0, w26
	cmp	x1, x3
	bne	.L157
	mul	w6, w6, w26
.L156:
	ldr	w3, [x20, 1344]
	add	w22, w22, w6
	add	w23, w23, w22
	cbz	w3, .L162
	sub	w0, w3, #1
	mov	x2, 1092
	ldr	w6, [x20, 1352]
	add	x1, x20, 1084
	add	x2, x2, x0, uxtw 3
	mov	w0, w23
	add	x2, x20, x2
	.p2align 2
.L161:
	str	w0, [x1], 8
	add	w0, w0, w21
	cmp	x2, x1
	bne	.L161
	add	w0, w3, w6
	str	w0, [x20, 1352]
.L162:
	madd	w21, w3, w21, w22
	str	w21, [x20, 4]
	tbnz	w24, #31, .L160
	ldr	x0, .LC64
	ldr	x0, [x0, w24, sxtw 3]
	cbz	x0, .L160
	add	w0, w21, w23
	cbz	w4, .L160
	mov	w2, 12
	mov	x3, 532
	add	x1, x20, 520
	umaddl	x5, w5, w2, x3
	add	x5, x20, x5
	.p2align 2
.L163:
	str	w0, [x1], 12
	add	w0, w0, 1024
	cmp	x1, x5
	bne	.L163
.L160:
	add	w21, w21, w4, lsl 10
	mov	w0, 0
	str	w21, [x20, 4]
.L197:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L216:
	lsl	w0, w4, 2
	sub	w4, w0, w4
	lsl	w0, w5, 2
	sub	w0, w0, w5
	lsr	w5, w5, 1
	lsr	w0, w0, 1
	madd	w10, w10, w9, w5
	add	w0, w0, w4, asr 1
	lsl	w9, w9, 4
	str	w0, [x20, 1060]
	str	w9, [x20, 1052]
	str	w10, [x20, 1064]
	cbnz	w27, .L147
.L149:
	str	wzr, [x20, 1040]
	str	wzr, [x20, 1080]
.L148:
	ldr	x2, .LC55
	ldr	x3, .LC70
.L204:
	ldr	x1, .LC56
	add	x2, x2, 176
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L147:
	add	w4, w22, w26
	cmp	w27, 32
	mov	w0, 32
	sdiv	w3, w3, w4
	csel	w27, w27, w0, le
	cmp	w3, w27
	csel	w4, w3, w27, le
	str	w4, [x20, 1040]
	str	w4, [x20, 1080]
	b	.L150
	.p2align 3
.L210:
	mul	w21, w7, w4
	add	w21, w21, 143
	and	w21, w21, -128
	mul	w3, w28, w21
	cmp	w19, w3
	ble	.L129
	sub	w3, w19, w3
	add	w19, w23, 1023
	and	w19, w19, -1024
	asr	w0, w21, 1
	str	w28, [x20, 1344]
	sub	w6, w19, w23
	str	w0, [x20, 1340]
	add	w2, w22, 255
	sub	w3, w3, w6
	and	w28, w2, -256
	tbnz	w24, #31, .L217
	ldr	x1, .LC64
	stp	w3, w6, [x29, 104]
	stp	w2, w7, [x29, 112]
	ldr	x0, [x1, w24, sxtw 3]
	str	x1, [x29, 120]
	add	x0, x0, 331776
	add	x0, x0, 80
	bl	IsMain10Profile
	ldp	w3, w6, [x29, 104]
	ldp	w2, w7, [x29, 112]
	ldr	x1, [x29, 120]
	cbz	w0, .L133
	cmp	w28, wzr
	add	w9, w28, 3
	csel	w9, w9, w28, lt
	add	w10, w26, 31
	asr	w9, w9, 2
	and	w10, w10, -32
	add	w11, w26, 63
	mov	w8, w26
	b	.L134
	.p2align 3
.L212:
	lsl	w0, w7, 4
	mul	w0, w0, w28
	lsl	w22, w0, 2
	sub	w22, w22, w0
	b	.L139
	.p2align 3
.L131:
	lsl	w0, w28, 14
	add	w0, w0, w28, lsl 11
	add	w0, w0, w28
	lsl	w0, w0, 7
	cmp	w19, w0
	ble	.L129
	sub	w0, w19, w0
	mov	w1, 64
	add	w19, w23, 1023
	movk	w1, 0x12, lsl 16
	and	w19, w19, -1024
	str	w28, [x20, 1344]
	str	w1, [x20, 1340]
	add	w11, w26, 63
	sub	w6, w19, w23
	add	w2, w22, 255
	sub	w3, w0, w6
	and	w8, w11, -64
	and	w28, w2, -256
	tbnz	w24, #31, .L218
	ldr	x1, .LC64
	ldr	x0, [x1, w24, sxtw 3]
	ldr	w0, [x0, 1540]
	cmp	w0, 8
	ble	.L175
	cmp	w28, wzr
	add	w9, w28, 3
	csel	w9, w9, w28, lt
	add	w10, w8, 63
	mov	w21, 128
	asr	w9, w9, 2
	and	w10, w10, -64
	movk	w21, 0x24, lsl 16
.L134:
	lsl	w0, w28, 4
	str	w0, [x20]
	ldr	x0, [x1, w24, sxtw 3]
	ldr	w0, [x0, 1248]
	cmp	w0, 1
	bne	.L219
.L136:
	cmp	w25, 17
	mov	w0, 1920
	ccmp	w22, w0, 0, ne
	bgt	.L137
	add	w1, w11, 63
	cmp	w11, wzr
	csel	w0, w1, w11, lt
	mov	w12, 0
	asr	w0, w0, 6
	mov	w1, 0
	mov	w5, 0
	b	.L135
	.p2align 3
.L217:
	add	w11, w26, 63
	mov	w8, w26
.L169:
	add	w1, w11, 63
	cmp	w11, wzr
	csel	w0, w1, w11, lt
	lsl	w1, w28, 4
	asr	w0, w0, 6
	str	w1, [x20]
.L203:
	mov	w1, 0
	mov	w12, 0
	mov	w9, 0
	mov	w10, 0
	mov	w5, 0
	b	.L135
	.p2align 3
.L214:
	mul	w0, w0, w11
	lsl	w1, w0, 2
	sub	w0, w1, w0
	b	.L143
	.p2align 3
.L211:
	add	w0, w26, 126
	adds	w5, w26, 63
	csel	w0, w0, w5, mi
	add	w2, w22, 255
	asr	w0, w0, 6
	b	.L203
	.p2align 3
.L144:
	adds	w7, w0, 63
	add	w1, w0, 126
	csel	w1, w1, w7, mi
	adds	w7, w24, 2047
	add	w24, w24, 4094
	asr	w0, w1, 6
	csel	w7, w24, w7, mi
	and	w7, w7, -2048
	cmp	w7, wzr
	add	w1, w7, 127
	csel	w1, w1, w7, lt
	lsl	w7, w0, 2
	sub	w7, w7, w0
	asr	w1, w1, 7
	lsl	w7, w7, 5
	mul	w1, w1, w7
	lsr	w1, w1, 1
	b	.L145
	.p2align 3
.L137:
	adds	w12, w22, 2047
	add	w22, w22, 4094
	csel	w12, w22, w12, mi
	add	w1, w11, 63
	and	w12, w12, -2048
	cmp	w12, wzr
	add	w0, w12, 127
	csel	w12, w0, w12, lt
	cmp	w11, wzr
	csel	w0, w1, w11, lt
	asr	w12, w12, 7
	asr	w0, w0, 6
	lsl	w5, w12, 5
	mul	w5, w5, w0
	mov	w1, w5
	b	.L135
.L133:
	add	w11, w26, 63
	mov	w8, w26
	mov	w10, 0
	mov	w9, 0
	b	.L134
.L175:
	mov	w21, 128
	mov	w10, 0
	movk	w21, 0x24, lsl 16
	mov	w9, 0
	b	.L134
.L123:
	ldr	x2, .LC55
	ldr	x3, .LC57
	b	.L204
.L129:
	ldr	x2, .LC55
	ldr	x3, .LC63
	b	.L204
.L218:
	mov	w21, 128
	movk	w21, 0x24, lsl 16
	b	.L169
.L208:
	ldr	x2, .LC55
	ldr	x3, .LC54
	b	.L204
.L215:
	ldr	x2, .LC55
	ldr	x3, .LC68
	b	.L204
.L213:
	ldr	x1, .LC66
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L197
.L209:
	ldr	x2, .LC55
	ldr	x3, .LC59
	b	.L204
	.size	VDMHAL_V400R003_ArrangeMem_Specific, .-VDMHAL_V400R003_ArrangeMem_Specific
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	.LANCHOR0
	.align	3
.LC56:
	.xword	.LC6
	.align	3
.LC57:
	.xword	.LC22
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC60:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC61:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	s_pstVfmwChan
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem
	.type	VDMHAL_V400R003_ArrangeMem, %function
VDMHAL_V400R003_ArrangeMem:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w7
	mov	w24, w1
	mov	w20, w2
	mov	w21, w3
	mov	w25, w4
	mov	w26, w5
	mov	w22, w6
	bl	_mcount
	cmn	w19, #2
	beq	.L224
	tbnz	w19, #31, .L225
	mov	w0, w19
	bl	VCTRL_GetVidStd
	mov	w1, w0
	ldr	x0, .LC71
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 1488]
	cmp	w0, 1
	beq	.L227
.L222:
	ldr	x0, [x29, 80]
	mov	w7, w26
	str	x0, [sp, 16]
	mov	w6, w25
	mov	w5, w21
	mov	w4, w20
	mov	w3, w24
	mov	w2, w23
	str	w22, [sp]
	mov	w0, w19
	str	w19, [sp, 8]
	bl	VDMHAL_V400R003_ArrangeMem_Specific
.L226:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L225:
	mov	w1, 21
	b	.L222
	.p2align 3
.L224:
	mov	w1, 16
	b	.L222
	.p2align 3
.L227:
	ldr	x5, [x29, 80]
	mov	w4, w22
	mov	w3, w21
	mov	w2, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_ArrangeMem_Normal
	b	.L226
	.size	VDMHAL_V400R003_ArrangeMem, .-VDMHAL_V400R003_ArrangeMem
	.align	3
.LC71:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ResetVdm
	.type	VDMHAL_V400R003_ResetVdm, %function
VDMHAL_V400R003_ResetVdm:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	ble	.L229
	ldr	x2, .LC72
	mov	w4, 0
	ldr	x1, .LC74
	mov	w3, w21
	add	x2, x2, 216
	mov	w0, 0
	bl	dprint_vfmw
.L228:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L229:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L241
	sxtw	x22, w21
	ldr	x24, .LC77
	lsl	x0, x22, 6
	ldr	x20, .LC78
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	ldr	x2, [x20]
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	ldr	w25, [x0, 36]
	ldr	w23, [x2, 120]
	tbz	x23, 0, .L228
	ldr	x26, .LC79
	mov	w0, 2
	bfi	w23, w0, 8, 2
	str	w23, [x2, 120]
	mov	w19, 0
	orr	w23, w23, 64
	ldr	x0, [x26, 224]
	blr	x0
	ldr	x0, [x20]
	str	w23, [x0, 120]
	b	.L233
	.p2align 3
.L242:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L234
.L233:
	ldr	x1, [x26, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 2, .L242
	cmp	w19, 999
	bgt	.L234
	ldr	x2, .LC72
	mov	w3, w21
	ldr	x1, .LC83
	mov	w0, 0
	add	x2, x2, 216
	bl	dprint_vfmw
.L236:
	ldr	x0, [x20]
	and	w23, w23, -65
	str	w23, [x0, 120]
	and	w23, w23, -769
	ldr	x0, [x26, 224]
	blr	x0
	lsl	x0, x22, 6
	ldr	x1, [x20]
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x22, x0, x22
	str	w23, [x1, 120]
	add	x22, x0, x22, lsl 2
	ldr	x0, [x24, x22]
	str	w25, [x0, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L234:
	ldr	x2, .LC72
	mov	w3, w21
	ldr	x1, .LC81
	mov	w0, 0
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L236
.L241:
	ldr	x1, .LC76
	mov	x2, 0
	bl	dprint_vfmw
	b	.L228
	.size	VDMHAL_V400R003_ResetVdm, .-VDMHAL_V400R003_ResetVdm
	.align	3
.LC72:
	.xword	.LANCHOR0
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC77:
	.xword	g_HwMem
	.align	3
.LC78:
	.xword	g_pstRegCrg
	.align	3
.LC79:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC83:
	.xword	.LC82
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_SetSmmuPageTableAddr
	.type	VDMHAL_V400R003_SetSmmuPageTableAddr, %function
VDMHAL_V400R003_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC84
	ldr	x3, [x0, 360]
	cbz	x3, .L243
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L245
	ldr	x0, .LC85
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L243:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L245:
	ldr	x20, .LC86
	mov	w3, w19
	ldr	x21, .LC88
	mov	w4, 1
	add	x20, x20, 248
	mov	w0, 32
	mov	x1, x21
	mov	x2, x20
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMHAL_V400R003_SetSmmuPageTableAddr, .-VDMHAL_V400R003_SetSmmuPageTableAddr
	.align	3
.LC84:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC85:
	.xword	g_HwMem
	.align	3
.LC86:
	.xword	.LANCHOR0
	.align	3
.LC88:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_EnableSmmu
	.type	VDMHAL_V400R003_EnableSmmu, %function
VDMHAL_V400R003_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC90
	mov	w1, 8
	movk	w1, 0x3, lsl 16
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_EnableSmmu, .-VDMHAL_V400R003_EnableSmmu
	.align	3
.LC90:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GlbResetX
	.type	VDMHAL_V400R003_GlbResetX, %function
VDMHAL_V400R003_GlbResetX:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w23, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L262
	ldr	x20, .LC94
	ldr	x0, [x20]
	ldr	w22, [x0, 120]
	tbnz	x22, 0, .L263
.L250:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L263:
	ldr	x21, .LC95
	mov	w1, 2
	bfi	w22, w1, 8, 2
	str	w22, [x0, 120]
	mov	w19, 0
	orr	w22, w22, 16
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	b	.L254
	.p2align 3
.L264:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L255
.L254:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 0, .L264
	cmp	w19, 999
	bgt	.L255
	ldr	x2, .LC91
	mov	w3, w23
	ldr	x1, .LC99
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
.L257:
	ldr	x0, [x20]
	and	w22, w22, -17
	str	w22, [x0, 120]
	and	w22, w22, -769
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L255:
	ldr	x2, .LC91
	mov	w3, w23
	ldr	x1, .LC97
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L257
.L262:
	ldr	x2, .LC91
	mov	w3, -121438208
	ldr	x1, .LC93
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L250
	.size	VDMHAL_V400R003_GlbResetX, .-VDMHAL_V400R003_GlbResetX
	.align	3
.LC91:
	.xword	.LANCHOR0
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC94:
	.xword	g_pstRegCrg
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC99:
	.xword	.LC98
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GlbReset
	.type	VDMHAL_V400R003_GlbReset, %function
VDMHAL_V400R003_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L268
	mov	w0, 0
	bl	VDMHAL_V400R003_GlbResetX
.L265:
	ldp	x29, x30, [sp], 16
	ret
.L268:
	ldr	x2, .LC100
	mov	w3, -121438208
	ldr	x1, .LC101
	add	x2, x2, 320
	bl	dprint_vfmw
	b	.L265
	.size	VDMHAL_V400R003_GlbReset, .-VDMHAL_V400R003_GlbReset
	.align	3
.LC100:
	.xword	.LANCHOR0
	.align	3
.LC101:
	.xword	.LC92
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ClearIntState
	.type	VDMHAL_V400R003_ClearIntState, %function
VDMHAL_V400R003_ClearIntState:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x20, x19
	bl	_mcount
	ldr	x21, .LC103
	ldr	x0, .LC102
	add	x1, x21, x19, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x0, [x0, x1, lsl 3]
	cbz	x0, .L279
	ldr	w22, [x0, 1272]
.L270:
	cmp	w20, wzr
	bgt	.L281
	lsl	x0, x19, 6
	ldr	x23, .LC106
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x23, x20]
	cbz	x0, .L282
.L273:
	cmp	w22, 1
	bne	.L280
	add	x19, x21, x19, lsl 6
	ldr	w1, [x19, 44]
	cmp	w1, 1
	beq	.L280
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L283
	cmp	w1, 3
	bne	.L269
	mov	w1, -15
	str	w1, [x0, 32]
	b	.L269
	.p2align 3
.L281:
	ldr	x2, .LC104
	mov	w4, 0
	ldr	x1, .LC105
	mov	w3, w20
	add	x2, x2, 352
	mov	w0, 0
	bl	dprint_vfmw
.L269:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L280:
	mov	w1, -1
	str	w1, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L279:
	mov	w22, 0
	b	.L270
	.p2align 3
.L282:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L274
	str	x0, [x23, x20]
	b	.L273
	.p2align 3
.L283:
	mov	w1, -12
	str	w1, [x0, 32]
	b	.L269
.L274:
	ldr	x1, .LC108
	mov	w0, 0
	bl	dprint_vfmw
	b	.L269
	.size	VDMHAL_V400R003_ClearIntState, .-VDMHAL_V400R003_ClearIntState
	.align	3
.LC102:
	.xword	s_pstVfmwChan
	.align	3
.LC103:
	.xword	g_VdmDrvParam
	.align	3
.LC104:
	.xword	.LANCHOR0
	.align	3
.LC105:
	.xword	.LC73
	.align	3
.LC106:
	.xword	g_HwMem
	.align	3
.LC108:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ClearMMUIntState
	.type	VDMHAL_V400R003_ClearMMUIntState, %function
VDMHAL_V400R003_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L289
	lsl	x3, x19, 6
	ldr	x20, .LC111
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L290
.L287:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L284:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L289:
	ldr	x2, .LC109
	mov	w3, w19
	ldr	x1, .LC110
	mov	w4, 0
	add	x2, x2, 384
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L290:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L288
	str	x0, [x20, x19]
	b	.L287
.L288:
	ldr	x1, .LC112
	mov	w0, 0
	bl	dprint_vfmw
	b	.L284
	.size	VDMHAL_V400R003_ClearMMUIntState, .-VDMHAL_V400R003_ClearMMUIntState
	.align	3
.LC109:
	.xword	.LANCHOR0
	.align	3
.LC110:
	.xword	.LC73
	.align	3
.LC111:
	.xword	g_HwMem
	.align	3
.LC112:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_MaskInt
	.type	VDMHAL_V400R003_MaskInt, %function
VDMHAL_V400R003_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L296
	lsl	x3, x19, 6
	ldr	x20, .LC115
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L297
.L294:
	mov	w1, -1
	str	w1, [x0, 36]
.L291:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L296:
	ldr	x2, .LC113
	mov	w3, w19
	ldr	x1, .LC114
	mov	w4, 0
	add	x2, x2, 424
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L297:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L295
	str	x0, [x20, x19]
	b	.L294
.L295:
	ldr	x1, .LC116
	mov	w0, 0
	bl	dprint_vfmw
	b	.L291
	.size	VDMHAL_V400R003_MaskInt, .-VDMHAL_V400R003_MaskInt
	.align	3
.LC113:
	.xword	.LANCHOR0
	.align	3
.LC114:
	.xword	.LC73
	.align	3
.LC115:
	.xword	g_HwMem
	.align	3
.LC116:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetIntMaskCfg
	.type	VDMHAL_V400R003_GetIntMaskCfg, %function
VDMHAL_V400R003_GetIntMaskCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 1
	mov	w1, -6
	mov	w0, -2
	ldr	x19, [sp, 16]
	csel	w0, w1, w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_GetIntMaskCfg, .-VDMHAL_V400R003_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_EnableInt
	.type	VDMHAL_V400R003_EnableInt, %function
VDMHAL_V400R003_EnableInt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC118
	sxtw	x0, w19
	ldr	x2, .LC117
	add	x1, x1, x0, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x1, [x2, x1, lsl 3]
	cbz	x1, .L309
	ldr	w20, [x1, 1272]
.L302:
	cmp	w19, wzr
	bgt	.L310
	lsl	x19, x0, 6
	ldr	x21, .LC121
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	ldr	x0, [x21, x19]
	cbz	x0, .L311
.L305:
	mov	w1, -6
	mov	w2, -2
	cmp	w20, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 36]
.L301:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L310:
	ldr	x2, .LC119
	mov	w3, w19
	ldr	x1, .LC120
	mov	w4, 0
	add	x2, x2, 448
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L309:
	mov	w20, 0
	b	.L302
	.p2align 3
.L311:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L306
	str	x0, [x21, x19]
	b	.L305
.L306:
	ldr	x1, .LC122
	mov	w0, 0
	bl	dprint_vfmw
	b	.L301
	.size	VDMHAL_V400R003_EnableInt, .-VDMHAL_V400R003_EnableInt
	.align	3
.LC117:
	.xword	s_pstVfmwChan
	.align	3
.LC118:
	.xword	g_VdmDrvParam
	.align	3
.LC119:
	.xword	.LANCHOR0
	.align	3
.LC120:
	.xword	.LC73
	.align	3
.LC121:
	.xword	g_HwMem
	.align	3
.LC122:
	.xword	.LC107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CheckReg
	.type	VDMHAL_V400R003_CheckReg, %function
VDMHAL_V400R003_CheckReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L329
	lsl	x0, x19, 6
	ldr	x21, .LC126
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x21, x20]
	cbz	x0, .L330
.L315:
	sub	w0, w22, #1
	cmp	w0, 6
	bls	.L331
	ldr	x2, .LC123
	mov	w3, w22
	ldr	x1, .LC130
	mov	w0, 0
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, 0
.L328:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L331:
	ldr	x1, .LC131
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx322
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx322:
	.section	.rodata
	.align	0
	.align	2
.L322:
	.byte	(.L326 - .Lrtx322) / 4
	.byte	(.L323 - .Lrtx322) / 4
	.byte	(.L324 - .Lrtx322) / 4
	.byte	(.L325 - .Lrtx322) / 4
	.byte	(.L327 - .Lrtx322) / 4
	.byte	(.L317 - .Lrtx322) / 4
	.byte	(.L319 - .Lrtx322) / 4
	.text
	.p2align 3
.L327:
	mov	x1, 61480
.L321:
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x21, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	w0, [x0, x1]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L326:
	mov	x1, 28
	b	.L321
	.p2align 3
.L325:
	mov	x1, 40
	b	.L321
	.p2align 3
.L324:
	mov	x1, 36
	b	.L321
	.p2align 3
.L323:
	mov	x1, 32
	b	.L321
	.p2align 3
.L319:
	mov	x1, 62272
	b	.L321
	.p2align 3
.L317:
	mov	x1, 62304
	b	.L321
	.p2align 3
.L330:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L316
	str	x0, [x21, x20]
	b	.L315
	.p2align 3
.L329:
	ldr	x2, .LC123
	mov	w3, w19
	ldr	x1, .LC125
	mov	w0, 0
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, -1
	b	.L328
.L316:
	ldr	x2, .LC123
	mov	w0, 0
	ldr	x1, .LC128
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, 0
	b	.L328
	.size	VDMHAL_V400R003_CheckReg, .-VDMHAL_V400R003_CheckReg
	.align	3
.LC123:
	.xword	.LANCHOR0
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC126:
	.xword	g_HwMem
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	.L322
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ReadMMUMask
	.type	VDMHAL_V400R003_ReadMMUMask, %function
VDMHAL_V400R003_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L335
	ldr	x2, .LC133
	mov	w3, w19
	ldr	x1, .LC135
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L335:
	lsl	x0, x19, 6
	ldr	x1, .LC132
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	ldr	x19, [sp, 16]
	add	x0, x0, 61440
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 32]
	ret
	.size	VDMHAL_V400R003_ReadMMUMask, .-VDMHAL_V400R003_ReadMMUMask
	.align	3
.LC132:
	.xword	g_HwMem
	.align	3
.LC133:
	.xword	.LANCHOR1
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteMMUMask
	.type	VDMHAL_V400R003_WriteMMUMask, %function
VDMHAL_V400R003_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L339
	ldr	x2, .LC137
	mov	w3, w19
	ldr	x1, .LC138
	mov	w4, 1
	add	x2, x2, 32
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L339:
	lsl	x0, x19, 6
	ldr	x1, .LC136
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	add	x0, x0, 61440
	str	w20, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_WriteMMUMask, .-VDMHAL_V400R003_WriteMMUMask
	.align	3
.LC136:
	.xword	g_HwMem
	.align	3
.LC137:
	.xword	.LANCHOR1
	.align	3
.LC138:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_PrepareDec
	.type	VDMHAL_V400R003_PrepareDec, %function
VDMHAL_V400R003_PrepareDec:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x22, x1
	mov	x0, x30
	mov	w21, w2
	mov	x19, x3
	bl	_mcount
	cbz	x22, .L359
	cmp	w21, wzr
	bgt	.L360
	cmp	w20, 6
	mov	w2, 0
	cset	w1, eq
	mov	w0, 0
	mov	x3, x19
	bl	SCD_ConfigReg
	mov	x3, x19
	mov	w2, 0
	mov	w1, 1
	mov	w0, 8
	bl	SCD_ConfigReg
	cmp	w20, 17
	bls	.L361
.L358:
	mov	w0, -1
	b	.L342
	.p2align 3
.L361:
	ldr	x0, .LC143
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx345
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx345:
	.section	.rodata
	.align	0
	.align	2
.L345:
	.byte	(.L355 - .Lrtx345) / 4
	.byte	(.L346 - .Lrtx345) / 4
	.byte	(.L347 - .Lrtx345) / 4
	.byte	(.L348 - .Lrtx345) / 4
	.byte	(.L358 - .Lrtx345) / 4
	.byte	(.L349 - .Lrtx345) / 4
	.byte	(.L350 - .Lrtx345) / 4
	.byte	(.L358 - .Lrtx345) / 4
	.byte	(.L351 - .Lrtx345) / 4
	.byte	(.L352 - .Lrtx345) / 4
	.byte	(.L353 - .Lrtx345) / 4
	.byte	(.L353 - .Lrtx345) / 4
	.byte	(.L353 - .Lrtx345) / 4
	.byte	(.L354 - .Lrtx345) / 4
	.byte	(.L358 - .Lrtx345) / 4
	.byte	(.L355 - .Lrtx345) / 4
	.byte	(.L356 - .Lrtx345) / 4
	.byte	(.L357 - .Lrtx345) / 4
	.text
	.p2align 3
.L355:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	H264HAL_V400R003_StartDec
.L342:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L356:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	HEVCHAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L354:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP8HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L353:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP6HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L352:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV9HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L351:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV8HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L350:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	AVSHAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L349:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	DIVX3HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L348:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP2HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L347:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP4HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L346:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VC1HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L357:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP9HAL_V400R003_StartDec
	b	.L342
	.p2align 3
.L360:
	ldr	x2, .LC139
	mov	w3, w21
	ldr	x1, .LC142
	mov	w4, 0
	add	x2, x2, 64
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L359:
	ldr	x2, .LC139
	mov	x3, 0
	ldr	x1, .LC141
	mov	w0, 0
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -1
	b	.L342
	.size	VDMHAL_V400R003_PrepareDec, .-VDMHAL_V400R003_PrepareDec
	.align	3
.LC139:
	.xword	.LANCHOR1
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC142:
	.xword	.LC73
	.align	3
.LC143:
	.xword	.L345
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdmReady
	.type	VDMHAL_V400R003_IsVdmReady, %function
VDMHAL_V400R003_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC144
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L367
	cmp	w19, wzr
	ble	.L368
	ldr	x2, .LC147
	mov	w4, 1
	ldr	x1, .LC149
	mov	w3, w19
	add	x2, x2, 96
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 0
.L364:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L368:
	ldr	w0, [x0, 28]
	ldr	x19, [sp, 16]
	ubfx	x0, x0, 17, 1
	ldp	x29, x30, [sp], 32
	ret
.L367:
	ldr	x2, .LC147
	ldr	x3, .LC146
	ldr	x1, .LC148
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L364
	.size	VDMHAL_V400R003_IsVdmReady, .-VDMHAL_V400R003_IsVdmReady
	.align	3
.LC144:
	.xword	g_HwMem
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC147:
	.xword	.LANCHOR1
	.align	3
.LC148:
	.xword	.LC6
	.align	3
.LC149:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdmRun
	.type	VDMHAL_V400R003_IsVdmRun, %function
VDMHAL_V400R003_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC150
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L374
	cmp	w19, wzr
	ble	.L375
	ldr	x2, .LC153
	mov	w4, 1
	ldr	x1, .LC154
	mov	w3, w19
	add	x2, x2, 128
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
.L371:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L375:
	ldr	w0, [x0, 40]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L374:
	ldr	x1, .LC152
	bl	dprint_vfmw
	mov	w0, 0
	b	.L371
	.size	VDMHAL_V400R003_IsVdmRun, .-VDMHAL_V400R003_IsVdmRun
	.align	3
.LC150:
	.xword	g_HwMem
	.align	3
.LC152:
	.xword	.LC151
	.align	3
.LC153:
	.xword	.LANCHOR1
	.align	3
.LC154:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdhDecOver
	.type	VDMHAL_V400R003_IsVdhDecOver, %function
VDMHAL_V400R003_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC155
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L385
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_CheckReg
	cmp	w19, 1
	beq	.L380
	cmp	w19, 2
	and	w0, w0, 1
	bne	.L386
.L378:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L386:
	ldr	x2, .LC157
	mov	w3, w19
	ldr	x1, .LC159
	mov	w0, 0
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ubfx	x0, x0, 17, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L385:
	ldr	x2, .LC157
	ldr	x3, .LC156
	ldr	x1, .LC158
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
	b	.L378
	.size	VDMHAL_V400R003_IsVdhDecOver, .-VDMHAL_V400R003_IsVdhDecOver
	.align	3
.LC155:
	.xword	g_HwMem
	.align	3
.LC156:
	.xword	.LC145
	.align	3
.LC157:
	.xword	.LANCHOR1
	.align	3
.LC158:
	.xword	.LC6
	.align	3
.LC159:
	.xword	.LC129
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdhPartDecOver
	.type	VDMHAL_V400R003_IsVdhPartDecOver, %function
VDMHAL_V400R003_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC160
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L395
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_CheckReg
	cmp	w19, 1
	beq	.L391
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L396
.L389:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L396:
	ldr	x2, .LC162
	mov	w3, w19
	ldr	x1, .LC164
	mov	w0, 0
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L391:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L395:
	ldr	x2, .LC162
	ldr	x3, .LC161
	ldr	x1, .LC163
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, -1
	b	.L389
	.size	VDMHAL_V400R003_IsVdhPartDecOver, .-VDMHAL_V400R003_IsVdhPartDecOver
	.align	3
.LC160:
	.xword	g_HwMem
	.align	3
.LC161:
	.xword	.LC145
	.align	3
.LC162:
	.xword	.LANCHOR1
	.align	3
.LC163:
	.xword	.LC6
	.align	3
.LC164:
	.xword	.LC129
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_UpdateHardwareInfo
	.type	VDMHAL_V400R003_UpdateHardwareInfo, %function
VDMHAL_V400R003_UpdateHardwareInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	bl	_mcount
	cmp	w22, wzr
	bgt	.L398
	ldr	x4, .LC165
	add	x0, x4, 4
	add	x4, x4, 128
	ldr	w1, [x4, -128]
	cmp	w1, 1
	bne	.L402
	b	.L413
	.p2align 3
.L423:
	cmp	x0, x4
	beq	.L422
.L402:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L423
.L413:
	mov	w19, w1
.L399:
	sxtw	x20, w22
	ldr	x24, .LC170
	lsl	x0, x20, 6
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x21, x0, x20
	add	x21, x0, x21, lsl 2
	ldr	x1, [x24, x21]
	cbz	x1, .L424
.L403:
	lsl	x0, x20, 2
	ldr	x21, .LC172
	sub	x4, x0, x20
	ldr	x2, .LC176
	lsl	x0, x4, 4
	ldr	w3, [x1, 12]
	sub	x0, x0, x4
	lsl	x5, x20, 6
	lsl	x0, x0, 2
	add	x4, x21, x0
	str	w3, [x21, x0]
	add	x0, x2, x5
	ldr	w3, [x1, 28]
	ldr	w0, [x0, 56]
	str	w3, [x4, 4]
	cmp	w0, 1
	beq	.L425
	cmp	w19, 1
	beq	.L426
	ldr	w5, [x1, 4096]
	ldr	w3, [x1, 4108]
	ldr	w2, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w2, w0, [x4, 8]
	stp	w5, w3, [x4, 16]
	cbz	w19, .L427
.L408:
	mov	w0, 180
	add	x4, x1, 32768
	add	x1, x4, 256
	smull	x2, w22, w0
	add	x0, x2, 52
	add	x2, x2, 180
	add	x0, x21, x0
	add	x3, x21, x2
	.p2align 2
.L409:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L409
	mov	w0, 0
	cbnz	w19, .L416
	lsl	x1, x20, 2
	ldr	w3, [x4, 384]
	sub	x20, x1, x20
	ldr	w2, [x4, 388]
	lsl	x1, x20, 4
	sub	x1, x1, x20
	add	x21, x21, x1, lsl 2
	stp	w2, w3, [x21, 44]
.L416:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L427:
	ldr	w5, [x1, 176]
	ldr	w0, [x1, 180]
	stp	w5, w0, [x4, 24]
	ldr	w3, [x1, 184]
	ldr	w2, [x1, 188]
	ldr	w0, [x1, 192]
	stp	w3, w2, [x4, 32]
	str	w0, [x4, 40]
	b	.L408
	.p2align 3
.L422:
	mov	w19, 0
	b	.L399
.L425:
	ldr	w2, [x1, 4108]
	mov	w0, 0
	str	w2, [x4, 20]
	and	w2, w2, 1048575
	ldr	w1, [x1, 176]
	stp	w2, w1, [x4, 20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L426:
	sub	x0, x5, x20
	and	w23, w3, 131071
	lsl	x0, x0, 2
	sub	x1, x0, x20
	add	x0, x0, x1, lsl 2
	add	x0, x24, x0
	ldr	w0, [x0, 56]
	bl	MEM_Phy2Vir
	cbz	x0, .L428
	sub	w1, w23, #1
	cmp	w1, 199
	bhi	.L414
	lsl	w1, w23, 2
	sub	w1, w1, #4
	lsl	x1, x1, 2
	add	x3, x1, 8
.L407:
	lsl	x2, x20, 2
	ldr	w4, [x0, x1]
	sub	x2, x2, x20
	lsl	x1, x2, 4
	sub	x2, x1, x2
	lsl	x1, x20, 6
	sub	x1, x1, x20
	add	x2, x21, x2, lsl 2
	lsl	x1, x1, 2
	str	w4, [x2, 16]
	ldr	w3, [x0, x3]
	sub	x0, x1, x20
	str	w3, [x2, 20]
	add	x1, x1, x0, lsl 2
	ldr	x1, [x24, x1]
	ldr	w3, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w3, w0, [x2, 8]
	b	.L408
.L424:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L404
	str	x0, [x24, x21]
	mov	x1, x0
	b	.L403
.L414:
	mov	x3, 8
	mov	x1, 0
	b	.L407
.L398:
	ldr	x2, .LC166
	mov	w4, 0
	ldr	x1, .LC167
	mov	w3, w22
	add	x2, x2, 232
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
.L428:
	ldr	x2, .LC166
	ldr	x3, .LC174
	ldr	x1, .LC175
	add	x2, x2, 232
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
.L404:
	ldr	x1, .LC171
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
	.size	VDMHAL_V400R003_UpdateHardwareInfo, .-VDMHAL_V400R003_UpdateHardwareInfo
	.align	3
.LC165:
	.xword	g_DSPState
	.align	3
.LC166:
	.xword	.LANCHOR1
	.align	3
.LC167:
	.xword	.LC73
	.align	3
.LC170:
	.xword	g_HwMem
	.align	3
.LC171:
	.xword	.LC107
	.align	3
.LC172:
	.xword	g_BackUp
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC175:
	.xword	.LC6
	.align	3
.LC176:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ReadMsgSlot
	.type	VDMHAL_V400R003_ReadMsgSlot, %function
VDMHAL_V400R003_ReadMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	w19, w2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L433
	cmp	w19, 800
	bhi	.L434
	ldr	x3, .LC181
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L431:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L434:
	ldr	x1, .LC180
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L431
	.p2align 3
.L433:
	ldr	x1, .LC178
	mov	x3, x21
	mov	x2, x20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L431
	.size	VDMHAL_V400R003_ReadMsgSlot, .-VDMHAL_V400R003_ReadMsgSlot
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC180:
	.xword	.LC179
	.align	3
.LC181:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteMsgSlot
	.type	VDMHAL_V400R003_WriteMsgSlot, %function
VDMHAL_V400R003_WriteMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L436
	sub	w0, w21, #1
	cmp	w0, 255
	bhi	.L436
	ldr	x3, .LC184
	ubfiz	x2, x21, 2, 30
	mov	x1, x20
	mov	x0, x19
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L436:
	ldr	x1, .LC183
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_V400R003_WriteMsgSlot, .-VDMHAL_V400R003_WriteMsgSlot
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC184:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CfgRpMsg
	.type	VDMHAL_V400R003_CfgRpMsg, %function
VDMHAL_V400R003_CfgRpMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 64]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L486
	ldr	w2, [x19, 840]
	sub	w0, w2, #1
	cmp	w0, 199
	bhi	.L487
	ldr	w3, [x19, 864]
	ldp	w0, w2, [x19, 24]
	ldr	w6, [x19]
	lsl	w0, w0, w3
	lsl	w2, w2, w3
	add	w1, w0, 255
	cmp	w0, 1920
	and	w1, w1, -256
	lsl	w3, w1, 4
	bgt	.L444
	cmp	w6, 17
	beq	.L444
	mov	w0, 1
	mov	w4, 0
	str	wzr, [x19, 848]
	str	w0, [x19, 872]
.L445:
	cmp	w6, 16
	beq	.L446
.L491:
	add	w0, w2, 31
	mov	w23, 8
	and	w0, w0, -32
	madd	w0, w0, w1, w4
.L469:
	ldr	w2, [x19, 16]
	mov	w1, w3
	str	w2, [x20]
	ldr	w2, [x19, 16]
	add	w2, w0, w2
	str	w2, [x20, 4]
	ldr	w2, [x19, 4]
	str	w2, [x20, 8]
	ldr	w2, [x19, 4]
	add	w0, w0, w2
	str	w0, [x20, 12]
	ldr	w0, [x19, 872]
	cbnz	w0, .L488
.L448:
	str	w1, [x20, 16]
	mov	w3, 0
	str	w4, [x20, 20]
	mov	w2, 0
	ldp	w1, w0, [x19, 24]
	sub	w0, w0, #1
	sub	w1, w1, #1
	bfi	w2, w0, 0, 9
	bfi	w3, w1, 0, 9
	strh	w2, [x29, 74]
	strh	w3, [x29, 72]
	ldr	w0, [x29, 72]
	str	w0, [x20, 24]
	ldr	w0, [x19, 852]
	ldp	w21, w22, [x19, 24]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L489
.L450:
	ldr	w0, [x19, 856]
	mov	w11, 0
	cbz	w0, .L490
.L451:
	cmp	w0, 1
	beq	.L467
.L496:
	sub	w11, w11, #1
	uxth	w11, w11
.L468:
	ldr	w3, [x19, 864]
	ldr	w4, [x19, 848]
	ldr	w2, [x19, 852]
	sub	w3, w3, #4
	ldrb	w1, [x29, 74]
	ldrb	w0, [x29, 75]
	and	w2, w2, 3
	bfi	w1, w4, 0, 1
	strh	w11, [x29, 72]
	bfi	w0, w3, 0, 2
	ldr	w3, [x19, 872]
	bfi	w1, w2, 4, 2
	bfi	w0, w23, 2, 4
	bfi	w1, w2, 6, 2
	bfi	w0, w3, 6, 1
	strb	w1, [x29, 74]
	strb	w0, [x29, 75]
	mov	w0, 0
	ldr	w1, [x29, 72]
	str	w1, [x20, 28]
.L484:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L444:
	ldr	w5, [x19, 848]
	mov	w4, 0
	cmp	w5, 1
	bne	.L445
	adds	w4, w0, 2047
	add	w0, w0, 4094
	csel	w0, w0, w4, mi
	add	w5, w2, 126
	and	w0, w0, -2048
	cmp	w0, wzr
	add	w4, w0, 127
	csel	w0, w4, w0, lt
	adds	w7, w2, 63
	csel	w4, w5, w7, mi
	asr	w0, w0, 7
	asr	w4, w4, 6
	cmp	w6, 16
	lsl	w4, w4, 5
	mul	w4, w0, w4
	bne	.L491
.L446:
	madd	w0, w2, w1, w4
	mov	w23, 10
	b	.L469
	.p2align 3
.L488:
	add	w0, w3, 15
	cmp	w3, wzr
	csel	w1, w0, w3, lt
	asr	w1, w1, 4
	b	.L448
	.p2align 3
.L490:
	ldr	w0, [x19, 864]
	cmp	w0, 6
	beq	.L472
	cmp	w0, 5
	beq	.L473
	cmp	w0, 4
	mov	w2, 8
	beq	.L452
	ldr	x1, .LC192
	mov	w0, 1
	bl	dprint_vfmw
	mov	w2, 1
.L452:
	ldr	w8, [x19, 840]
	cmp	w8, wzr
	ble	.L485
	mul	w12, w22, w21
	mov	w4, 0
	mov	w6, 0
	sub	w13, w12, #1
	mov	w11, 0
	sub	w9, w2, #1
	b	.L455
	.p2align 3
.L494:
	ldrsh	w6, [x10, 38]
	sub	w6, w6, #1
	add	w6, w6, w2
	udiv	w6, w6, w2
	mul	w6, w6, w2
	cmp	w0, w6
	bgt	.L458
.L457:
	add	w4, w4, 1
	cmp	w4, w8
	bge	.L492
.L466:
	cmp	w4, 199
	bgt	.L493
.L455:
	add	x10, x19, x4, sxtw 2
	cmp	w4, wzr
	ldrsh	w1, [x10, 42]
	sub	w0, w1, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	bgt	.L494
	ccmp	w0, w6, 0, ne
	ble	.L457
.L460:
	ldrsh	w1, [x10, 40]
	cmp	w12, w0
	csel	w0, w0, w13, hi
	add	w5, w11, 1
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w5, 252
	bgt	.L495
	udiv	w7, w1, w21
	sxtw	x3, w11
	mov	w11, w5
	mov	w8, 0
	add	x3, x3, 6
	add	w4, w4, 1
	lsl	x3, x3, 3
	udiv	w5, w0, w21
	msub	w1, w7, w21, w1
	bfi	w8, w1, 0, 9
	mov	w1, 0
	bfi	w1, w7, 0, 9
	strh	w8, [x29, 76]
	strh	w1, [x29, 78]
	mov	w1, 0
	msub	w0, w5, w21, w0
	bfi	w1, w0, 0, 9
	mov	w0, 0
	bfi	w0, w5, 0, 9
	ldr	w5, [x29, 76]
	str	w5, [x20, x3]
	add	x3, x3, 4
	strh	w1, [x29, 76]
	strh	w0, [x29, 78]
	ldr	w0, [x29, 76]
	str	w0, [x20, x3]
	ldr	w8, [x19, 840]
	cmp	w4, w8
	blt	.L466
.L492:
	ldr	w0, [x19, 856]
	cmp	w0, 1
	bne	.L496
	.p2align 2
.L467:
	strh	wzr, [x29, 72]
	sub	w21, w21, #1
	strh	wzr, [x29, 74]
	mov	w2, 0
	sub	w22, w22, #1
	mov	w1, 0
	ldr	w3, [x29, 72]
	bfi	w2, w21, 0, 9
	bfi	w1, w22, 0, 9
	strh	w2, [x29, 72]
	strh	w1, [x29, 74]
	mov	w11, 0
	str	w0, [x19, 840]
	str	w3, [x20, 48]
	ldr	w0, [x29, 72]
	str	w0, [x20, 52]
	b	.L468
	.p2align 3
.L489:
	add	w22, w22, w22, lsr 31
	asr	w22, w22, 1
	b	.L450
	.p2align 3
.L461:
	udiv	w0, w0, w2
	ldrsh	w1, [x5, 44]
	udiv	w1, w1, w2
	mul	w0, w0, w2
	mul	w1, w1, w2
	cmp	w0, w1
	add	w14, w1, 1
	bhi	.L462
	sub	w1, w4, #1
	cmp	w0, w14
	add	x1, x19, x1, sxtw 2
	beq	.L462
	ldrsh	w1, [x1, 42]
	sub	w1, w1, #1
	add	w1, w1, w2
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w0, w1
	bhi	.L460
.L462:
	cmp	w7, 199
	mov	w4, w3
	bgt	.L497
	ldrsh	w1, [x5, 46]
.L458:
	add	w3, w4, 1
	add	x5, x19, x4, sxtw 2
	cmp	w8, w3
	add	w0, w9, w1
	add	w7, w3, 1
	bgt	.L461
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L460
.L473:
	mov	w2, 4
	b	.L452
	.p2align 3
.L497:
	add	x0, x19, x3, sxtw 2
	ldrsh	w0, [x0, 42]
	sub	w0, w0, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L460
.L493:
	ldr	x2, .LC187
	mov	w3, 2164
	ldr	x1, .LC194
	mov	w0, 0
	add	x2, x2, 304
	bl	dprint_vfmw
.L485:
	mov	w11, 0
	ldr	w0, [x19, 856]
	b	.L451
.L472:
	mov	w2, 2
	b	.L452
.L495:
	mov	w0, 1
	str	w0, [x19, 856]
	b	.L467
.L487:
	ldr	x1, .LC190
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L484
.L486:
	ldr	x2, .LC187
	mov	w0, 0
	ldr	x3, .LC186
	ldr	x1, .LC188
	add	x2, x2, 272
	bl	dprint_vfmw
	mov	w0, -1
	b	.L484
	.size	VDMHAL_V400R003_CfgRpMsg, .-VDMHAL_V400R003_CfgRpMsg
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC187:
	.xword	.LANCHOR1
	.align	3
.LC188:
	.xword	.LC6
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CfgRpReg
	.type	VDMHAL_V400R003_CfgRpReg, %function
VDMHAL_V400R003_CfgRpReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	x20, x4
	bl	_mcount
	str	wzr, [x29, 60]
	cmp	w21, wzr
	bgt	.L524
	ldr	x0, [x22]
	cbz	x0, .L525
.L501:
	ldr	x19, .LC198
	ldr	w3, [x22, 64]
	ldrb	w0, [x19]
	and	w3, w3, -16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L526
	mov	x0, x20
	mov	w2, 16
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	mov	w3, 53763
	movk	w3, 0x2000, lsl 16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L527
	mov	x0, x20
	mov	w2, 12
	mov	w1, 2
	mov	w22, 3075
	movk	w22, 0x30, lsl 16
	bl	VDH_Record_RegData
	str	w22, [x29, 60]
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L528
	mov	x0, x20
	mov	w3, w22
	mov	w2, 60
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L529
	mov	x0, x20
	mov	w3, w22
	mov	w2, 64
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L530
	mov	x0, x20
	mov	w3, w22
	mov	w2, 68
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L531
	mov	x0, x20
	mov	w3, w22
	mov	w2, 72
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L532
	mov	x0, x20
	mov	w3, w22
	mov	w2, 76
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L533
	mov	x0, x20
	mov	w3, w22
	mov	w2, 80
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L534
	mov	x0, x20
	mov	w3, w22
	mov	w2, 84
	mov	w1, 2
	bl	VDH_Record_RegData
	mov	w0, 0
.L521:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L526:
	sxtw	x1, w21
	ldr	x2, .LC199
	lsl	x0, x1, 6
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x4, x0, x1
	add	x0, x0, x4, lsl 2
	ldr	x0, [x2, x0]
	str	w3, [x0, 16]
.L504:
	lsl	x0, x1, 6
	mov	w4, 53763
	sub	x0, x0, x1
	movk	w4, 0x2000, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 12]
.L506:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 60]
.L508:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 64]
.L510:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 68]
.L512:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 72]
.L514:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 76]
.L516:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 80]
.L518:
	lsl	x3, x1, 6
	mov	w4, 3075
	sub	x3, x3, x1
	movk	w4, 0x30, lsl 16
	lsl	x3, x3, 2
	mov	w0, 0
	sub	x1, x3, x1
	add	x1, x3, x1, lsl 2
	ldr	x1, [x2, x1]
	str	w4, [x1, 84]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L525:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L502
	str	x0, [x22]
	b	.L501
	.p2align 3
.L524:
	ldr	x2, .LC195
	mov	w4, 0
	ldr	x1, .LC196
	mov	w3, w21
	add	x2, x2, 328
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L521
.L502:
	ldr	x1, .LC197
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L521
.L531:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L512
.L530:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L510
.L529:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L508
.L528:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L506
.L533:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L516
.L532:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L514
.L534:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L518
.L527:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L504
	.size	VDMHAL_V400R003_CfgRpReg, .-VDMHAL_V400R003_CfgRpReg
	.align	3
.LC195:
	.xword	.LANCHOR1
	.align	3
.LC196:
	.xword	.LC73
	.align	3
.LC197:
	.xword	.LC107
	.align	3
.LC198:
	.xword	g_HalDisable
	.align	3
.LC199:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_MakeDecReport
	.type	VDMHAL_V400R003_MakeDecReport, %function
VDMHAL_V400R003_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L565
	ldr	x23, [x19, 8]
	ldr	w21, [x19]
	ldr	w22, [x19, 16]
	cbz	x23, .L566
	sxtw	x22, w22
	ldr	x20, .LC208
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x20, x0]
	cbz	x0, .L539
	ldr	x2, .LC209
	add	x0, x2, 4
	add	x2, x2, 128
	ldr	w1, [x2, -128]
	cmp	w1, 1
	bne	.L542
	b	.L554
	.p2align 3
.L568:
	cmp	x0, x2
	beq	.L567
.L542:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L568
.L554:
	mov	w19, w1
.L540:
	ldr	x3, .LC213
	mov	x2, 816
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
	lsl	x0, x22, 6
	lsl	x1, x22, 2
	sub	x0, x0, x22
	sub	x1, x1, x22
	lsl	x0, x0, 2
	lsl	x2, x1, 4
	sub	x3, x0, x22
	sub	x1, x2, x1
	ldr	x4, .LC214
	add	x2, x0, x3, lsl 2
	add	x2, x20, x2
	add	x1, x4, x1, lsl 2
	ldr	w0, [x2, 40]
	str	w0, [x23, 4]
	ldr	w1, [x1, 4]
	ubfx	x0, x1, 17, 2
	cmp	w0, 1
	beq	.L555
	and	w1, w1, 131072
	cmp	w1, wzr
	ccmp	w21, 3, 0, ne
	cset	w1, ne
.L543:
	lsl	x0, x22, 2
	str	w1, [x23]
	sub	x0, x0, x22
	cmp	w21, wzr
	lsl	x1, x0, 4
	ccmp	w21, 15, 4, ne
	sub	x0, x1, x0
	add	x0, x4, x0, lsl 2
	ldr	w2, [x0, 4]
	and	w2, w2, 131071
	str	w2, [x23, 8]
	beq	.L569
.L544:
	cmp	w2, 200
	bhi	.L570
.L546:
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	add	x20, x20, x0
	ldr	w21, [x20, 56]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L571
	lsl	x3, x22, 2
	ldr	x19, .LC219
	sub	x3, x3, x22
	ldr	w2, [x23, 8]
	mov	x1, x0
	add	x20, x22, x3, lsl 3
	lsl	w2, w2, 2
	add	x0, x19, x20, lsl 7
	bl	VDMHAL_V400R003_ReadMsgSlot
	ldr	w0, [x23, 8]
	cbz	w0, .L551
	sub	w2, w0, #1
	mov	x5, 18
	add	x1, x23, 14
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x23, x5
	.p2align 2
.L550:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x5, x1
	bne	.L550
.L551:
	mov	w0, 6
	bl	IsDprintTypeEnable
	cbnz	w0, .L572
.L537:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L569:
	cmp	w19, 1
	beq	.L573
	ldr	x1, .LC215
	ldrb	w1, [x1]
	cbnz	w1, .L544
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L544
	mov	w0, 1
	strh	wzr, [x23, 12]
	str	w0, [x23, 8]
	mov	w0, 0
	strh	wzr, [x23, 14]
	b	.L537
	.p2align 3
.L567:
	mov	w19, 0
	b	.L540
	.p2align 3
.L572:
	ldr	x1, .LC221
	mov	w0, 6
	ldr	w2, [x23, 8]
	mov	w20, 0
	bl	dprint_vfmw
	mov	w2, w21
	ldr	x1, .LC223
	lsl	x21, x22, 2
	mov	w0, 6
	sub	x21, x21, x22
	bl	dprint_vfmw
	ldr	x24, .LC225
	add	x21, x22, x21, lsl 3
	lsl	x21, x21, 5
	.p2align 2
.L552:
	add	w1, w20, 3
	add	w3, w20, 2
	add	w0, w20, 1
	add	x7, x21, x20, uxtw
	add	x1, x21, x1
	add	x3, x21, x3
	add	x0, x21, x0
	mov	w2, w20
	add	w20, w20, 4
	ldr	w6, [x19, x1, lsl 2]
	mov	x1, x24
	ldr	w5, [x19, x3, lsl 2]
	ldr	w4, [x19, x0, lsl 2]
	mov	w0, 6
	ldr	w3, [x19, x7, lsl 2]
	bl	dprint_vfmw
	ldr	w0, [x23, 8]
	lsl	w0, w0, 2
	sub	w0, w0, #3
	cmp	w0, w20
	bhi	.L552
	ldr	x1, .LC227
	mov	w0, 6
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L555:
	mov	w1, 0
	b	.L543
	.p2align 3
.L570:
	ldr	x1, .LC217
	mov	w3, 200
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 8]
	b	.L546
	.p2align 3
.L573:
	ldr	w0, [x0, 16]
	ubfx	x0, x0, 21, 2
	cmp	w0, 2
	bne	.L544
	strh	wzr, [x23, 12]
	mov	w0, 0
	strh	wzr, [x23, 14]
	str	w19, [x23, 8]
	b	.L537
.L571:
	ldr	x2, .LC204
	ldr	x3, .LC218
	ldr	x1, .LC205
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L537
.L539:
	ldr	x2, .LC204
	ldr	x3, .LC210
.L563:
	ldr	x1, .LC205
	mov	w0, 0
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L537
.L566:
	ldr	x2, .LC204
	ldr	x3, .LC207
	b	.L563
.L565:
	ldr	x2, .LC204
	ldr	x3, .LC203
	b	.L563
	.size	VDMHAL_V400R003_MakeDecReport, .-VDMHAL_V400R003_MakeDecReport
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC204:
	.xword	.LANCHOR1
	.align	3
.LC205:
	.xword	.LC6
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC208:
	.xword	g_HwMem
	.align	3
.LC209:
	.xword	g_DSPState
	.align	3
.LC210:
	.xword	.LC145
	.align	3
.LC213:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC214:
	.xword	g_BackUp
	.align	3
.LC215:
	.xword	g_not_allow_H264FullPictureRepair_flag
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC218:
	.xword	.LC173
	.align	3
.LC219:
	.xword	g_UpMsg
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_PrepareRepair
	.type	VDMHAL_V400R003_PrepareRepair, %function
VDMHAL_V400R003_PrepareRepair:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w3
	mov	x23, x1
	mov	w26, w2
	mov	x24, x4
	bl	_mcount
	ldr	x25, .LC228
	lsl	x0, x19, 6
	cmp	w19, wzr
	sub	x0, x0, x19
	mov	x21, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	add	x27, x20, x25
	bgt	.L585
	ldr	x0, [x20, x25]
	cbz	x0, .L586
	cbz	w26, .L587
.L579:
	cmp	w26, 1
	mov	w20, 0
	beq	.L588
.L576:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L586:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L578
	str	x0, [x20, x25]
	cbnz	w26, .L579
	.p2align 2
.L587:
	lsl	x0, x19, 3
	ldr	x25, .LC233
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	ldr	w1, [x0, 840]
	cmp	w1, wzr
	ble	.L580
	cmp	w22, 6
	bne	.L581
	ldrb	w1, [x23, 17]
	mov	w2, 0
	cmp	w1, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 1728]
.L581:
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	mov	x1, x27
	mov	w0, w22
	mov	w20, 0
	bl	VDMHAL_V400R003_CfgRpReg
	lsl	x0, x19, 3
	mov	w2, w21
	sub	x0, x0, x19
	mov	x1, x27
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	bl	VDMHAL_V400R003_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L588:
	cmp	w22, 6
	bne	.L583
	ldrb	w0, [x23, 17]
	cmp	w0, 1
	bne	.L583
	lsl	x0, x19, 3
	ldr	x25, .LC233
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x0, x25, x19
	ldr	w1, [x0, 1716]
	cmp	w1, wzr
	ble	.L583
	mov	w1, 2
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	str	w1, [x0, 1728]
	mov	x1, x27
	mov	w0, w22
	bl	VDMHAL_V400R003_CfgRpReg
	add	x0, x19, 876
	mov	w2, w21
	mov	x1, x27
	add	x0, x25, x0
	bl	VDMHAL_V400R003_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L585:
	ldr	x2, .LC229
	mov	w4, 0
	ldr	x1, .LC230
	mov	w3, w19
	add	x2, x2, 392
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L576
	.p2align 3
.L583:
	ldr	x1, .LC237
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L576
.L580:
	ldr	x1, .LC235
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L576
.L578:
	ldr	x1, .LC232
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L576
	.size	VDMHAL_V400R003_PrepareRepair, .-VDMHAL_V400R003_PrepareRepair
	.align	3
.LC228:
	.xword	g_HwMem
	.align	3
.LC229:
	.xword	.LANCHOR1
	.align	3
.LC230:
	.xword	.LC73
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC233:
	.xword	g_RepairParam
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_StartHwRepair
	.type	VDMHAL_V400R003_StartHwRepair, %function
VDMHAL_V400R003_StartHwRepair:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC238
	ldrb	w4, [x21]
	cmp	w4, 1
	bne	.L613
	cmp	w20, wzr
	ble	.L614
	ldr	x22, .LC240
	mov	w3, w20
	ldr	x23, .LC241
	mov	w0, 32
	add	x2, x22, 424
	mov	x1, x23
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L597
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L610
.L592:
	cbz	x19, .L615
.L606:
	ldr	x1, .LC244
	sbfiz	x0, x20, 6, 32
	mov	w2, 1
	str	w2, [x19, 4]
	add	x1, x1, x0
	mov	x0, x19
	ldr	w1, [x1, 8]
	str	w1, [x19, 8]
	strb	w20, [x19]
	strb	w2, [x19, 2]
	bl	VDH_PostTask
.L589:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L614:
	sxtw	x0, w20
	ldr	x3, .LC239
	lsl	x1, x0, 6
	mov	w4, 67108864
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x2, x1, x0
	add	x1, x1, x2, lsl 2
	ldr	x1, [x3, x1]
	str	w4, [x1, 8]
.L595:
	lsl	x1, x0, 6
	mov	w2, -2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x3, x0]
	str	w2, [x0, 36]
.L593:
	ldr	x0, .LC245
	ldr	x0, [x0, 224]
	blr	x0
	cmp	w20, wzr
	ble	.L609
	ldr	x22, .LC240
	ldr	x23, .LC241
.L602:
	add	x22, x22, 440
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w4, 1
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	b	.L589
	.p2align 3
.L591:
	cmp	w20, wzr
	ble	.L607
	ldr	x22, .LC240
	ldr	x23, .LC241
.L597:
	mov	w4, 1
	mov	w3, w20
	add	x2, x22, 424
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L592
.L610:
	ldr	x0, .LC245
	ldr	x0, [x0, 224]
	blr	x0
	b	.L602
	.p2align 3
.L613:
	mov	x0, x19
	mov	w3, 67108864
	mov	w2, 8
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L591
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L593
	cbnz	x19, .L606
.L615:
	ldr	x2, .LC240
	mov	x3, 0
	ldr	x1, .LC243
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L609:
	lsl	x0, x20, 6
	ldr	x1, .LC239
	sub	x0, x0, x20
	mov	w3, 1
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x0, x0, x20, lsl 2
	ldr	x2, [x1, x0]
	str	wzr, [x2]
	ldr	x2, [x1, x0]
	str	w3, [x2]
	ldr	x0, [x1, x0]
	str	wzr, [x0]
	b	.L589
.L607:
	ldr	x3, .LC239
	sxtw	x0, w20
	b	.L595
	.size	VDMHAL_V400R003_StartHwRepair, .-VDMHAL_V400R003_StartHwRepair
	.align	3
.LC238:
	.xword	g_HalDisable
	.align	3
.LC239:
	.xword	g_HwMem
	.align	3
.LC240:
	.xword	.LANCHOR1
	.align	3
.LC241:
	.xword	.LC87
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC244:
	.xword	g_VdmDrvParam
	.align	3
.LC245:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CalVdhClkSkip
	.type	VDMHAL_V400R003_CalVdhClkSkip, %function
VDMHAL_V400R003_CalVdhClkSkip:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC247
	ldr	w28, [x21, 128]
	tbnz	w28, #31, .L644
	ldr	x24, .LC250
	add	x19, x21, 132
	ldr	x23, .LC253
	add	x21, x21, 256
	ldr	x22, .LC254
	mov	w20, 30
	ldr	x25, .LC255
	mov	w27, 0
	ldr	x26, .LC252
	add	x24, x24, 472
	.p2align 2
.L619:
	mov	w0, w28
	bl	VCTRL_IsChanActive
	cbnz	w0, .L645
	ldr	x2, [x23, w28, sxtw 3]
	mov	w0, w28
	ldr	x3, [x22, w28, sxtw 3]
	ldp	w1, w2, [x2, 28]
	ldr	w4, [x3, 1560]
	adds	w3, w1, 15
	add	w1, w1, 30
	csel	w1, w1, w3, mi
	add	w3, w2, 30
	adds	w2, w2, 15
	asr	w27, w1, 4
	csel	w2, w3, w2, mi
	cmp	w4, 31
	csel	w20, w20, w4, lt
	asr	w28, w2, 4
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	bls	.L646
.L640:
	cmp	x21, x19
	mov	w27, 0
	bne	.L637
.L647:
	lsl	w0, w27, 2
	mov	w3, 23813
	sub	w27, w0, w27
	movk	w3, 0xdb4f, lsl 16
	lsl	w1, w27, 6
	mov	w0, 32
	mov	w2, 25
	umull	x1, w1, w3
	ldp	x19, x20, [sp, 16]
	lsr	x1, x1, 53
	sub	w0, w0, w1
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L646:
	ldrb	w0, [x25,w0,uxtw]
	adr	x1, .Lrtx624
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx624:
	.section	.rodata
	.align	0
	.align	2
.L624:
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L640 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L640 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L640 - .Lrtx624) / 4
	.byte	(.L634 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.byte	(.L633 - .Lrtx624) / 4
	.text
	.p2align 3
.L633:
	mul	w27, w27, w28
	mul	w27, w27, w20
.L621:
	cmp	x21, x19
	beq	.L647
.L637:
	ldr	w28, [x19], 4
	tbz	w28, #31, .L619
	lsl	w1, w27, 2
	mov	w0, 23813
	sub	w27, w1, w27
	movk	w0, 0xdb4f, lsl 16
	lsl	w27, w27, 6
	mov	w1, 32
	mov	w2, 25
	umull	x0, w27, w0
	lsr	x0, x0, 53
	sub	w0, w1, w0
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
.L617:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L634:
	mul	w27, w27, w28
	mul	w27, w27, w20
	lsl	w27, w27, 1
	b	.L621
	.p2align 3
.L645:
	mov	w3, w28
	mov	x2, x24
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
	b	.L621
.L644:
	mov	w0, 25
	b	.L617
	.size	VDMHAL_V400R003_CalVdhClkSkip, .-VDMHAL_V400R003_CalVdhClkSkip
	.align	3
.LC247:
	.xword	g_ChanCtx
	.align	3
.LC250:
	.xword	.LANCHOR1
	.align	3
.LC252:
	.xword	.LC251
	.align	3
.LC253:
	.xword	s_pFspInst
	.align	3
.LC254:
	.xword	s_pstVfmwChan
	.align	3
.LC255:
	.xword	.L624
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetVdmClk
	.type	VDMHAL_V400R003_GetVdmClk, %function
VDMHAL_V400R003_GetVdmClk:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 3
	bls	.L656
.L649:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 500
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L656:
	ldr	x0, .LC257
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx651
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx651:
	.section	.rodata
	.align	0
	.align	2
.L651:
	.byte	(.L649 - .Lrtx651) / 4
	.byte	(.L652 - .Lrtx651) / 4
	.byte	(.L653 - .Lrtx651) / 4
	.byte	(.L654 - .Lrtx651) / 4
	.text
	.p2align 3
.L653:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 100
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L652:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 540
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L654:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 600
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_GetVdmClk, .-VDMHAL_V400R003_GetVdmClk
	.align	3
.LC257:
	.xword	.L651
	.align	3
.LC258:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_StartHwDecode
	.type	VDMHAL_V400R003_StartHwDecode, %function
VDMHAL_V400R003_StartHwDecode:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, wzr
	ble	.L658
	ldr	x2, .LC259
	mov	w4, 0
	ldr	x1, .LC260
	mov	w3, w20
	add	x2, x2, 504
	mov	w0, 0
	bl	dprint_vfmw
.L657:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L658:
	ldr	x21, .LC261
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L693
	ldr	x1, .LC264
	ldr	x2, [x1]
	ldr	w0, [x2, 120]
	ubfx	x3, x0, 8, 2
	cbz	w3, .L663
	and	w0, w0, -769
	str	w0, [x2, 120]
.L663:
	ldr	x25, .LC262
	sxtw	x22, w20
	ldr	x24, .LC263
	mov	w2, 500
	add	x0, x25, x22, lsl 6
	ldr	w23, [x0, 8]
	str	w2, [x0, 16]
	ldr	x0, [x24, w23, sxtw 3]
	ldr	w26, [x0, 1272]
.L662:
	ldr	x0, [x1]
	ldr	w1, [x0, 120]
	and	w1, w1, -258049
	str	w1, [x0, 120]
	ldr	w1, [x0, 120]
	orr	w1, w1, 131072
	str	w1, [x0, 120]
.L664:
	ldr	x0, [x24, w23, sxtw 3]
	mov	w1, 3
	mov	x3, x19
	mov	w2, w20
	ldr	w0, [x0, 608]
	cmp	w0, 16
	mov	w0, 12
	csel	w1, w1, wzr, ne
	bl	SCD_ConfigReg
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L688
	mov	w1, 2
	mov	x0, x19
	mov	w3, -1431655766
	mov	w2, 156
	bl	VDH_Record_RegData
	ldr	x1, .LC265
	ldrb	w0, [x21]
	ldr	w1, [x1]
	cmp	w1, 1
	beq	.L694
.L668:
	mov	w3, 0
.L667:
	cmp	w0, 1
	beq	.L695
	mov	x0, x19
	mov	w2, 61472
	mov	w1, 2
	bl	VDH_Record_RegData
	cmp	w26, 1
	ldrb	w0, [x21]
	beq	.L696
.L671:
	mov	w3, -2
.L670:
	cmp	w0, 1
	beq	.L697
	mov	x0, x19
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L698
	cbz	x19, .L699
	mov	w0, 1
	strb	w20, [x19]
	stp	w0, w23, [x19, 4]
	mov	x0, x19
	bl	VDH_PostTask
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L696:
	mov	w3, -6
	b	.L670
	.p2align 3
.L694:
	mov	w3, 15
	b	.L667
	.p2align 3
.L693:
	mov	w2, 0
	mov	w1, 0
	mov	x0, x19
	mov	w3, 0
	sxtw	x22, w20
	bl	VDH_Record_RegData
	ldr	x25, .LC262
	ldr	x24, .LC263
	mov	w1, 500
	add	x0, x25, x22, lsl 6
	ldrb	w2, [x21]
	cmp	w2, 1
	ldr	w23, [x0, 8]
	str	w1, [x0, 16]
	ldr	x0, [x24, w23, sxtw 3]
	ldr	w26, [x0, 1272]
	beq	.L700
	mov	w3, 0
	mov	w2, 1
	mov	w1, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	b	.L664
	.p2align 3
.L688:
	ldr	x2, .LC265
	lsl	x1, x22, 6
	sub	x1, x1, x22
	ldr	x24, .LC266
	lsl	x1, x1, 2
	ldr	w2, [x2]
	cmp	w2, 1
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	mov	w2, -1431655766
	ldr	x1, [x24, x1]
	str	w2, [x1, 156]
	bne	.L668
	mov	w3, 15
	b	.L669
	.p2align 3
.L695:
	ldr	x24, .LC266
.L669:
	lsl	x0, x22, 6
	cmp	w26, 1
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	add	x0, x0, 61440
	str	w3, [x0, 32]
	beq	.L684
	mov	w0, 1
	b	.L671
	.p2align 3
.L697:
	ldr	x24, .LC266
.L672:
	lsl	x1, x22, 6
	ldr	x19, .LC267
	sub	x1, x1, x22
	mov	x0, 30
	lsl	x1, x1, 2
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	ldr	x1, [x24, x1]
	str	w3, [x1, 36]
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
.L675:
	lsl	x0, x22, 6
	mov	w2, 1
	sub	x1, x0, x22
	add	x25, x25, x0
	lsl	x0, x1, 2
	ldr	x3, .LC269
	sub	x22, x0, x22
	mov	w1, 4
	add	x22, x0, x22, lsl 2
	ldr	x0, [x24, x22]
	str	wzr, [x0]
	ldr	x0, [x24, x22]
	str	w2, [x0]
	ldr	x0, [x24, x22]
	str	wzr, [x0]
	ldr	w2, [x25, 8]
	mov	w0, w2
	ldr	w2, [x3, w2, sxtw 2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L657
	.p2align 3
.L699:
	ldr	x2, .LC259
	mov	x3, 0
	ldr	x1, .LC268
	mov	w0, 0
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L657
	.p2align 3
.L684:
	mov	w3, -6
	b	.L672
.L700:
	ldr	x1, .LC264
	b	.L662
.L698:
	ldr	x19, .LC267
	mov	x0, 30
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
	ldr	x24, .LC266
	b	.L675
	.size	VDMHAL_V400R003_StartHwDecode, .-VDMHAL_V400R003_StartHwDecode
	.align	3
.LC259:
	.xword	.LANCHOR1
	.align	3
.LC260:
	.xword	.LC73
	.align	3
.LC261:
	.xword	g_HalDisable
	.align	3
.LC262:
	.xword	g_VdmDrvParam
	.align	3
.LC263:
	.xword	s_pstVfmwChan
	.align	3
.LC264:
	.xword	g_pstRegCrg
	.align	3
.LC265:
	.xword	mask_mmu_err_int
	.align	3
.LC266:
	.xword	g_HwMem
	.align	3
.LC267:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC268:
	.xword	.LC242
	.align	3
.LC269:
	.xword	g_LowDelaySeqIndex
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetCharacter
	.type	VDMHAL_V400R003_GetCharacter, %function
VDMHAL_V400R003_GetCharacter:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC270
	mov	w3, 15
	ldr	x0, .LC271
	mov	w1, 4
	str	w3, [x2]
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetCharacter, .-VDMHAL_V400R003_GetCharacter
	.align	3
.LC270:
	.xword	g_VdmCharacter
	.align	3
.LC271:
	.xword	g_eVdmVersion
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteBigTitle1DYuv
	.type	VDMHAL_V400R003_WriteBigTitle1DYuv, %function
VDMHAL_V400R003_WriteBigTitle1DYuv:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 112]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	w19, w2
	str	w4, [x29, 108]
	bl	_mcount
	ubfx	x0, x21, 29, 2
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	cmp	w0, 1
	beq	.L746
	mov	w20, 2
	cmp	w0, w20
	csinc	w20, w20, wzr, ne
.L703:
	ldr	x0, [x29, 112]
	cbz	x0, .L702
	ldr	x0, .LC273
	mov	w4, 0
	add	x3, x29, 144
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L706
	ldr	x0, .LC277
	mov	w4, 0
	add	x3, x29, 176
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L706
	add	w19, w19, 15
	add	w21, w21, 15
	and	w19, w19, -16
	and	w0, w21, -16
	add	w1, w19, 255
	mov	w3, w0
	and	w1, w1, -256
	add	w0, w0, 62
	lsl	w1, w1, 4
	ldr	x25, [x29, 184]
	mov	w2, w1
	adds	w1, w3, 31
	csel	w0, w0, w1, mi
	add	w21, w2, 15
	cmp	w2, wzr
	asr	w0, w0, 5
	csel	w21, w21, w2, lt
	cmp	w20, wzr
	asr	w21, w21, 4
	ccmp	w20, 3, 4, ne
	stp	w2, w3, [x29, 124]
	mul	w21, w0, w21
	add	x21, x22, x21, sxtw
	bne	.L707
	lsr	w1, w3, 1
	lsr	w0, w19, 1
	str	w1, [x29, 120]
	add	x1, x25, 2097152
	str	w0, [x29, 104]
	str	x1, [x29, 136]
	ldr	x28, .LC278
	ldr	x20, [x29, 152]
	cbz	w3, .L709
	mov	w27, 0
	str	wzr, [x29, 132]
	.p2align 2
.L708:
	cbz	w19, .L711
	ldr	w0, [x29, 124]
	lsr	w23, w27, 4
	ldr	w24, [x29, 132]
	mov	w26, 0
	mul	w0, w23, w0
	ubfiz	x23, x27, 8, 4
	add	x23, x0, x23
	.p2align 2
.L710:
	lsr	w1, w26, 8
	add	x0, x24, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x23
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L710
.L711:
	ldr	w0, [x29, 132]
	add	w27, w27, 1
	add	w0, w0, w19
	str	w0, [x29, 132]
	ldr	w0, [x29, 128]
	cmp	w0, w27
	bne	.L708
.L709:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	blr	x3
	ldr	w0, [x29, 120]
	cbz	w0, .L801
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 132]
	.p2align 2
.L715:
	cbz	w19, .L717
	ldr	w0, [x29, 132]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L714:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L714
.L717:
	ldr	w0, [x29, 120]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L715
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L802
.L743:
	ldr	w0, [x29, 108]
	cbnz	w0, .L720
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L720:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 120]
.L796:
	mul	w19, w0, w1
	ldr	x20, [x29, 112]
	mov	x0, x25
	ldr	x3, [x28, 88]
	mov	w1, w19
	mov	x2, x20
	blr	x3
	ldr	x3, [x28, 88]
	mov	x2, x20
	ldr	x0, [x29, 136]
	mov	w1, w19
	blr	x3
	ldr	w0, [x29, 160]
	ldr	x1, [x29, 152]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 144
	blr	x3
	ldr	w0, [x29, 192]
	ldr	x1, [x29, 184]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 176
	blr	x3
.L702:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L706:
	ldr	x1, .LC275
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L746:
	mov	w20, 0
	b	.L703
.L707:
	cmp	w20, 1
	ldr	w1, [x29, 128]
	cset	w0, ne
	str	w0, [x29, 120]
	cmp	w1, w0
	lsr	w0, w19, 1
	str	w0, [x29, 104]
	lsr	w0, w1, 1
	str	w0, [x29, 132]
	add	x0, x25, 2097152
	str	x0, [x29, 136]
	ldr	x28, .LC278
	ldr	x20, [x29, 152]
	bls	.L725
	ldr	w27, [x29, 120]
	.p2align 2
.L727:
	cbz	w19, .L728
	ldr	w0, [x29, 124]
	lsr	w24, w27, 4
	lsr	w23, w27, 1
	mov	w26, 0
	mul	w0, w24, w0
	mul	w23, w23, w19
	ubfiz	x24, x27, 8, 4
	add	x24, x0, x24
	.p2align 2
.L726:
	lsr	w1, w26, 8
	add	x0, x23, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x24
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L726
.L728:
	ldr	w0, [x29, 128]
	add	w27, w27, 2
	cmp	w0, w27
	bhi	.L727
.L725:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	lsr	w1, w1, 1
	blr	x3
	ldr	w0, [x29, 132]
	cbz	w0, .L803
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 128]
	.p2align 2
.L732:
	cbz	w19, .L734
	ldr	w0, [x29, 128]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L731:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L731
.L734:
	ldr	w0, [x29, 132]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L732
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L804
	ldr	w0, [x29, 108]
	cbnz	w0, .L737
	ldr	w1, [x29, 120]
	ldr	w0, [x29, 132]
	cmp	w0, w1
	bls	.L740
	.p2align 2
.L741:
	ldr	w0, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 2
	str	w0, [x29, 120]
	cmp	w1, w0
	bhi	.L741
.L740:
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L737:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 132]
	b	.L796
.L802:
	mov	w0, 0
	mov	w6, 0
	.p2align 2
.L719:
	ldr	w1, [x29, 104]
	mov	w5, w0
	cbz	w1, .L721
	ldr	w1, [x29, 104]
	add	w5, w1, w0
	mov	w1, 1
	.p2align 2
.L718:
	sub	w3, w1, #1
	uxtw	x2, w0
	ldr	x4, [x29, 136]
	add	w0, w0, 1
	cmp	w0, w5
	ldrb	w3, [x20, x3]
	strb	w3, [x4, x2]
	ldrb	w3, [x20, w1, uxtw]
	add	w1, w1, 2
	strb	w3, [x25, x2]
	bne	.L718
.L721:
	ldr	w0, [x29, 120]
	add	w6, w6, 1
	add	x20, x20, x19
	cmp	w0, w6
	mov	w0, w5
	bne	.L719
	b	.L720
.L804:
	ldr	w0, [x29, 120]
	mov	w7, 0
	mul	w1, w19, w0
	lsl	w0, w19, 1
	add	x20, x20, x1
	.p2align 2
.L736:
	ldr	w3, [x29, 104]
	cbz	w3, .L738
	lsr	w1, w7, 1
	mov	w2, 1
	mul	w1, w1, w3
	add	w6, w3, w1
	.p2align 2
.L735:
	sub	w5, w2, #1
	uxtw	x3, w1
	ldr	x4, [x29, 136]
	add	w1, w1, 1
	cmp	w6, w1
	ldrb	w5, [x20, x5]
	strb	w5, [x4, x3]
	ldrb	w5, [x20, w2, uxtw]
	add	w2, w2, 2
	strb	w5, [x25, x3]
	bne	.L735
.L738:
	ldr	w1, [x29, 132]
	add	w7, w7, 2
	add	x20, x20, x0
	cmp	w1, w7
	bhi	.L736
	b	.L737
.L803:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L737
	ldr	w0, [x29, 108]
	cbz	w0, .L740
	b	.L737
.L801:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L743
	b	.L720
	.size	VDMHAL_V400R003_WriteBigTitle1DYuv, .-VDMHAL_V400R003_WriteBigTitle1DYuv
	.align	3
.LC273:
	.xword	.LC272
	.align	3
.LC275:
	.xword	.LC274
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC278:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x0, .LC279
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L812
	cbnz	w19, .L808
	ldr	x0, .LC280
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w20, w2
	beq	.L805
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L808:
	cmp	w19, 1
	beq	.L813
.L805:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L812:
	mov	w3, w20
	mov	w2, w19
	mov	x0, x21
	mov	w1, 0
	bl	VDH_Record_RegData
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L813:
	ldr	x0, .LC280
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	b	.L805
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC279:
	.xword	g_HalDisable
	.align	3
.LC280:
	.xword	g_pstRegCrg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	uxtw	x20, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x19, w2
	mov	x22, x3
	bl	_mcount
	ldr	x0, .LC281
	ldrb	w4, [x0]
	cmp	w4, 1
	bne	.L818
	cmp	w19, wzr
	ble	.L819
	ldr	x2, .LC283
	mov	w3, w19
	ldr	x1, .LC284
	mov	w0, 32
	add	x2, x2, 424
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L819:
	lsl	x0, x19, 6
	ldr	x1, .LC282
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	str	w21, [x0, x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L818:
	mov	w3, w21
	mov	w2, w20
	mov	x0, x22
	mov	w1, 2
	bl	VDH_Record_RegData
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.align	3
.LC281:
	.xword	g_HalDisable
	.align	3
.LC282:
	.xword	g_HwMem
	.align	3
.LC283:
	.xword	.LANCHOR1
	.align	3
.LC284:
	.xword	.LC87
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.52451, %object
	.size	__func__.52451, 24
__func__.52451:
	.string	"VDMHAL_V400R003_OpenHAL"
	.type	__func__.52536, %object
	.size	__func__.52536, 27
__func__.52536:
	.string	"VDMHAL_V400R003_CalcFsSize"
	.zero	5
	.type	__func__.52571, %object
	.size	__func__.52571, 34
__func__.52571:
	.string	"VDMHAL_V400R003_ArrangeMem_Normal"
	.zero	6
	.type	__FUNCTION__.52572, %object
	.size	__FUNCTION__.52572, 34
__FUNCTION__.52572:
	.string	"VDMHAL_V400R003_ArrangeMem_Normal"
	.zero	6
	.type	__func__.52548, %object
	.size	__func__.52548, 35
__func__.52548:
	.string	"VDMHAL_V400R003_FillMemArrangeInfo"
	.zero	5
	.type	__func__.52666, %object
	.size	__func__.52666, 36
__func__.52666:
	.string	"VDMHAL_V400R003_ArrangeMem_Specific"
	.zero	4
	.type	__func__.52689, %object
	.size	__func__.52689, 25
__func__.52689:
	.string	"VDMHAL_V400R003_ResetVdm"
	.zero	7
	.type	__func__.52699, %object
	.size	__func__.52699, 37
__func__.52699:
	.string	"VDMHAL_V400R003_SetSmmuPageTableAddr"
	.zero	3
	.type	__func__.52720, %object
	.size	__func__.52720, 26
__func__.52720:
	.string	"VDMHAL_V400R003_GlbResetX"
	.zero	6
	.type	__func__.52709, %object
	.size	__func__.52709, 25
__func__.52709:
	.string	"VDMHAL_V400R003_GlbReset"
	.zero	7
	.type	__func__.52732, %object
	.size	__func__.52732, 30
__func__.52732:
	.string	"VDMHAL_V400R003_ClearIntState"
	.zero	2
	.type	__func__.52738, %object
	.size	__func__.52738, 33
__func__.52738:
	.string	"VDMHAL_V400R003_ClearMMUIntState"
	.zero	7
	.type	__func__.52744, %object
	.size	__func__.52744, 24
__func__.52744:
	.string	"VDMHAL_V400R003_MaskInt"
	.type	__func__.52757, %object
	.size	__func__.52757, 26
__func__.52757:
	.string	"VDMHAL_V400R003_EnableInt"
	.zero	6
	.type	__func__.52766, %object
	.size	__func__.52766, 25
__func__.52766:
	.string	"VDMHAL_V400R003_CheckReg"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.52780, %object
	.size	__func__.52780, 28
__func__.52780:
	.string	"VDMHAL_V400R003_ReadMMUMask"
	.zero	4
	.type	__func__.52785, %object
	.size	__func__.52785, 29
__func__.52785:
	.string	"VDMHAL_V400R003_WriteMMUMask"
	.zero	3
	.type	__func__.52816, %object
	.size	__func__.52816, 27
__func__.52816:
	.string	"VDMHAL_V400R003_PrepareDec"
	.zero	5
	.type	__func__.52821, %object
	.size	__func__.52821, 27
__func__.52821:
	.string	"VDMHAL_V400R003_IsVdmReady"
	.zero	5
	.type	__func__.52826, %object
	.size	__func__.52826, 25
__func__.52826:
	.string	"VDMHAL_V400R003_IsVdmRun"
	.zero	7
	.type	__func__.52832, %object
	.size	__func__.52832, 29
__func__.52832:
	.string	"VDMHAL_V400R003_IsVdhDecOver"
	.zero	3
	.type	__func__.52841, %object
	.size	__func__.52841, 33
__func__.52841:
	.string	"VDMHAL_V400R003_IsVdhPartDecOver"
	.zero	7
	.type	__func__.52856, %object
	.size	__func__.52856, 35
__func__.52856:
	.string	"VDMHAL_V400R003_UpdateHardwareInfo"
	.zero	5
	.type	__func__.52929, %object
	.size	__func__.52929, 25
__func__.52929:
	.string	"VDMHAL_V400R003_CfgRpMsg"
	.zero	7
	.type	__func__.52906, %object
	.size	__func__.52906, 24
__func__.52906:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.52940, %object
	.size	__func__.52940, 25
__func__.52940:
	.string	"VDMHAL_V400R003_CfgRpReg"
	.zero	7
	.type	__func__.52953, %object
	.size	__func__.52953, 30
__func__.52953:
	.string	"VDMHAL_V400R003_MakeDecReport"
	.zero	2
	.type	__func__.52992, %object
	.size	__func__.52992, 30
__func__.52992:
	.string	"VDMHAL_V400R003_PrepareRepair"
	.zero	2
	.type	__func__.53179, %object
	.size	__func__.53179, 15
__func__.53179:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.52999, %object
	.size	__func__.52999, 30
__func__.52999:
	.string	"VDMHAL_V400R003_StartHwRepair"
	.zero	2
	.type	__func__.53039, %object
	.size	__func__.53039, 30
__func__.53039:
	.string	"VDMHAL_V400R003_CalVdhClkSkip"
	.zero	2
	.type	__func__.53061, %object
	.size	__func__.53061, 30
__func__.53061:
	.string	"VDMHAL_V400R003_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC6:
	ASCII(.string	"%s: %s\n" )
.LC8:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC10:
	ASCII(.string	"VDMHAL_V400R003_OpenHAL: Size error!" )
	.zero	3
.LC12:
	ASCII(.string	"VdhId is wrong!!!\n" )
	.zero	5
.LC16:
	ASCII(.string	"g_VdmRegVirAddr, g_VdmResetVirAddr = %p\n" )
	.zero	7
.LC18:
	ASCII(.string	"BPDRegVirAddr %p\n" )
	.zero	6
.LC20:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC22:
	ASCII(.string	"image size out of range" )
.LC29:
	ASCII(.string	"VDMHAL ArrangeMem HEVC/VP9 10 bit\n" )
	.zero	5
.LC31:
	ASCII(.string	"VidStd Invalid" )
	.zero	1
.LC36:
	ASCII(.string	"VDMHAL_V400R003_CalcFsSize err!\n" )
	.zero	7
.LC38:
	ASCII(.string	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: %#x\n" )
.LC40:
	ASCII(.string	"DelAllFrameMemRecord err in VDMHAL_V400R003_ArrangeMem!\n" )
	.zero	7
.LC45:
	ASCII(.string	"DFS, report event. Size: 0x%x, Num: %d, RefChanged: %d\n" )
.LC47:
	ASCII(.string	"pVdmMemArrange is NULL" )
	.zero	1
.LC49:
	ASCII(.string	"DFS, no ref frame!\n" )
	.zero	4
.LC51:
	ASCII(.string	"DFS, Frame number = %d > 30, Then, Frame num = 30, \n" )
	.zero	3
.LC53:
	ASCII(.string	"VDMHAL_V400R003_ArrangeMem Mem addr is NULL" )
	.zero	4
.LC58:
	ASCII(.string	"'pVdmMemArrange' is NULL" )
	.zero	7
.LC62:
	ASCII(.string	"MemSize not enough for pmv slot" )
.LC65:
	ASCII(.string	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight failed!\n" )
	.zero	3
.LC67:
	ASCII(.string	"ImgSlotLen > ChanSlotLen" )
	.zero	7
.LC69:
	ASCII(.string	"cann't allocate img slot" )
	.zero	7
.LC73:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC75:
	ASCII(.string	"VDMHAL_V400R003_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
	.zero	6
.LC80:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC82:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC87:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC92:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
.LC96:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC98:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC107:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC124:
	ASCII(.string	"%s: VdhId(%d) Invalid!\n" )
.LC127:
	ASCII(.string	"%s: vdm register virtual address not mapped, reset failed!\n" )
	.zero	4
.LC129:
	ASCII(.string	"%s: unkown reg_id = %d\n" )
.LC134:
	ASCII(.string	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC140:
	ASCII(.string	"%s: pDecParam(%p) = NULL\n" )
	.zero	6
.LC145:
	ASCII(.string	"VDM register not mapped yet!" )
	.zero	3
.LC151:
	ASCII(.string	"VDM register not mapped yet!\n" )
	.zero	2
.LC173:
	ASCII(.string	"can NOT map vir addr for up-msg" )
.LC177:
	ASCII(.string	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\n" )
	.zero	1
.LC179:
	ASCII(.string	"ReadUpMsgSlot error! upmsg_size(%d) > 512\n" )
	.zero	5
.LC182:
	ASCII(.string	"WriteMsgSlot error!\n" )
	.zero	3
.LC185:
	ASCII(.string	"can not map repair msg virtual address!" )
.LC189:
	ASCII(.string	"ValidGroupNum=%d out of range!\n" )
.LC191:
	ASCII(.string	"align_mb error\n" )
.LC193:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
.LC202:
	ASCII(.string	"'pMakeDecReport' is NULL" )
	.zero	7
.LC206:
	ASCII(.string	"'pDecReport' is NULL" )
	.zero	3
.LC216:
	ASCII(.string	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full repair.\n" )
	.zero	3
.LC220:
	ASCII(.string	"\n***** UpMsg DecSliceNum=%d\n" )
	.zero	3
.LC222:
	ASCII(.string	"\n***** Up Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC224:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC226:
	ASCII(.string	"\n***** Up Msg print finished *****\n" )
	.zero	4
.LC231:
	ASCII(.string	"vdm register virtual address not mapped, VDMHAL_V200R003_PrepareRepair failed!\n" )
.LC234:
	ASCII(.string	"FIRST_REPAIR Parameter Error!\n" )
	.zero	1
.LC236:
	ASCII(.string	"SECOND_REPAIR Parameter Error!\n" )
.LC242:
	ASCII(.string	"%s: pMfdeTask(%p) = NULL\n" )
	.zero	6
.LC251:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC272:
	ASCII(.string	"BigTile1d_y" )
	.zero	4
.LC274:
	ASCII(.string	"failed mem_allocMemBlock BigTile_yuv save!\n" )
	.zero	4
.LC276:
	ASCII(.string	"BigTile1d_uv" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
