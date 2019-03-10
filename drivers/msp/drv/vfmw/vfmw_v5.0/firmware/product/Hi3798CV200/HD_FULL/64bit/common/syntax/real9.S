#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"real9.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetBits
	.type	Real9_CB_GetBits, %function
Real9_CB_GetBits:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsShow
	mov	w21, w0
	mov	w1, w20
	mov	x0, x19
	bl	BsSkip
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	Real9_CB_GetBits, .-Real9_CB_GetBits
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_Get1Bit
	.type	Real9_CB_Get1Bit, %function
Real9_CB_Get1Bit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real9_CB_Get1Bit, .-Real9_CB_Get1Bit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetVLCBits
	.type	Real9_CB_GetVLCBits, %function
Real9_CB_GetVLCBits:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x23, x1
	mov	w20, 0
	bl	_mcount
	ldr	x22, .LC2
	mov	w19, 0
	.p2align 2
.L4:
	mov	w1, 8
	mov	x0, x21
	bl	BsShow
	ldrb	w2, [x22, w0, uxtw]
	mov	x0, x21
	lsr	w1, w2, 4
	lsr	w3, w2, 5
	add	w20, w20, w1
	and	w2, w2, 15
	lsl	w19, w19, w3
	orr	w19, w2, w19
	bl	BsSkip
	tbz	x20, 0, .L4
	str	w19, [x23]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	Real9_CB_GetVLCBits, .-Real9_CB_GetVLCBits
	.align	3
.LC2:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_GetImageBuffer
	.type	Real9_GetImageBuffer, %function
Real9_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 53248
	add	x19, x19, 8192
	bl	_mcount
	add	x19, x19, 3184
	add	x20, x19, 40960
	mov	w1, 1
	ldr	w0, [x21, 3832]
	bl	FSP_NewLogicFs
	str	w0, [x20, 4080]
	mov	w1, w0
	tbnz	w0, #31, .L15
	ldr	w0, [x21, 3832]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cbz	x0, .L16
	ldr	x1, .LC8
	mov	w0, 18
	ldr	w2, [x20, 4080]
	bl	dprint_vfmw
	ldr	x0, [x19, 680]
	cbz	x0, .L14
	ldr	x1, [x19, 688]
	cbz	x1, .L14
	ldr	x2, [x19, 696]
	cbz	x2, .L14
	ldr	w3, [x1, 16]
	ldr	w4, [x2, 16]
	ldr	x1, .LC10
	ldr	w2, [x0, 16]
	mov	w0, 18
	bl	dprint_vfmw
	mov	w0, 1
.L10:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L14:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L15:
	ldr	x1, .LC4
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 4076]
	mov	w2, 1
	ldr	w0, [x21, 3832]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20, 4072]
	mov	w2, 1
	ldr	w0, [x21, 3832]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 4072]
	str	wzr, [x20, 4076]
	ldr	w0, [x21, 3832]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 4072]
	str	w0, [x20, 4076]
	add	x1, x21, 3224
	strb	wzr, [x19, 25]
	ldr	w0, [x21, 3832]
	bl	FSP_ClearNotInVoQueue
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L16:
	ldr	x1, .LC6
	mov	w2, 512
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L10
	.size	Real9_GetImageBuffer, .-Real9_GetImageBuffer
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC10:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_ArrangeVHBMem
	.type	Real9_ArrangeVHBMem, %function
Real9_ArrangeVHBMem:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x2
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldp	w3, w2, [x19, 20]
	cmp	w2, 1
	bls	.L19
	sub	w1, w3, #2
	mov	w0, 512
	cmp	w1, 510
	ccmp	w2, w0, 2, ls
	bhi	.L19
	ldr	x0, [x20]
	ldr	w1, [x0, 708]
	cbnz	w1, .L22
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L49
.L23:
	ldp	w23, w22, [x19, 12]
	mov	w25, 5
	mov	w21, 2
	mov	w24, 4
.L29:
	ldr	x0, .LC15
	mov	w1, 0
	mov	x2, 32
	ldr	x3, [x0, 96]
	add	x0, x29, 96
	blr	x3
	strb	wzr, [x29, 97]
	ldr	w1, [x19, 12]
	ldr	x0, [x20]
	str	w1, [x29, 124]
	ldr	w1, [x19, 16]
	ldr	w0, [x0, 28]
	stp	w22, w23, [x29, 104]
	cmp	w0, 24
	str	w1, [x29, 120]
	beq	.L35
	strb	w24, [x29, 99]
	sxtb	w0, w21
	strb	w25, [x29, 101]
.L39:
	add	x19, x20, 53248
	strb	w0, [x29, 102]
	add	x1, x29, 96
	strb	wzr, [x29, 98]
	ldr	w0, [x19, 3832]
	bl	FSP_ConfigInstance
	mov	w2, 0
	cbnz	w0, .L44
	ldr	x1, [x20]
	add	x3, x29, 92
	ldr	w0, [x19, 3832]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L50
	cbnz	w0, .L37
	add	x20, x20, 8192
	mov	w0, 1
	mov	w2, 1
	strb	w0, [x20, 3212]
	b	.L44
	.p2align 3
.L19:
	ldr	x1, .LC12
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
.L44:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, w2
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L22:
	ldr	w1, [x0, 28]
	cmp	w1, 25
	bne	.L23
	ldr	w4, [x0, 668]
	ldp	w3, w2, [x19, 12]
	ldr	w5, [x0, 672]
	cmp	w2, w4
	bhi	.L32
	cmp	w3, w5
	bhi	.L32
	ldr	w4, [x0, 696]
	mov	w22, w2
	ldr	w1, [x0, 692]
	mov	w23, w3
	mov	w21, 1
	add	w24, w1, 2
	cbz	w4, .L34
.L47:
	add	w1, w1, w21
	mov	w21, 17
	cmp	w1, w21
	csel	w21, w1, w21, le
.L34:
	ldrsb	w25, [x0, 716]
	b	.L29
	.p2align 3
.L35:
	mov	w0, 1
	strb	w25, [x29, 101]
	strb	w0, [x29, 99]
	mov	w0, 1
	b	.L39
	.p2align 3
.L32:
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
	.p2align 3
.L49:
	ldr	w22, [x0, 668]
	ldp	w3, w2, [x19, 12]
	cmp	w2, w22
	bhi	.L51
	ldr	w23, [x0, 672]
	cmp	w3, w23
	bhi	.L52
	add	x1, x20, 8192
	ldrb	w2, [x1, 3212]
	cmp	w2, 1
	beq	.L44
	ldr	w2, [x0, 696]
	mov	w21, 1
	ldr	w1, [x0, 692]
	add	w24, w1, 2
	cbnz	w2, .L47
	ldrsb	w25, [x0, 716]
	b	.L29
	.p2align 3
.L50:
	add	x0, x19, 3224
	bl	ResetVoQueue
.L37:
	ldr	x1, .LC17
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
	.p2align 3
.L52:
	mov	w5, w23
.L25:
	ldr	x1, .LC14
	mov	w4, w22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
.L51:
	ldr	w5, [x0, 672]
	b	.L25
	.size	Real9_ArrangeVHBMem, .-Real9_ArrangeVHBMem
	.align	3
.LC12:
	.xword	.LC11
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC15:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC17:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetCPFMT
	.type	Real9_CB_GetCPFMT, %function
Real9_CB_GetCPFMT:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 4
	mov	x0, x19
	bl	BsSkip
	strb	w20, [x21]
	mov	w1, 9
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 9
	mov	x0, x19
	add	w20, w20, 1
	bl	BsSkip
	lsl	w20, w20, 2
	mov	w1, 1
	str	w20, [x21, 16]
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cmp	w20, 1
	beq	.L56
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L56:
	mov	w1, 9
	mov	x0, x19
	bl	BsShow
	mov	w22, w0
	mov	w1, 9
	mov	x0, x19
	lsl	w22, w22, 2
	bl	BsSkip
	str	w22, [x21, 12]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Real9_CB_GetCPFMT, .-Real9_CB_GetCPFMT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_SetDimensions
	.type	Real9_CB_SetDimensions, %function
Real9_CB_SetDimensions:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldp	w2, w0, [x19, 12]
	cmp	w0, 128
	beq	.L74
	cmp	w0, 176
	beq	.L75
	cmp	w0, 352
	bne	.L63
	cmp	w2, 288
	beq	.L76
	.p2align 2
.L59:
	add	w1, w0, 15
	add	w2, w2, 15
	add	x19, x19, 64
	lsr	w1, w1, 4
	lsr	w2, w2, 4
	mov	w0, 6
	stp	w2, w1, [x19, 8]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w1, 47
	bls	.L60
	cmp	w1, 98
	bls	.L69
	cmp	w1, 395
	bls	.L70
	cmp	w1, 1583
	bls	.L71
.L73:
	mov	w2, 6335
	mov	w0, 14
	cmp	w1, w2
	bls	.L77
.L60:
	str	w0, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L75:
	cmp	w2, 144
	bne	.L59
	add	x19, x19, 64
	mov	w2, 11
	mov	w0, 9
	mov	w1, 1
	stp	w0, w2, [x19, 8]
.L62:
	ldr	x0, .LC18
	add	x0, x0, 256
	ldr	w0, [x0, w1, uxtw 2]
	str	w0, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L74:
	cmp	w2, 96
	bne	.L59
	add	x19, x19, 64
	mov	w1, 6
	mov	w2, 8
	mov	w0, w1
	stp	w1, w2, [x19, 8]
	b	.L60
	.p2align 3
.L63:
	cmp	w0, 704
	bne	.L65
	cmp	w2, 576
	bne	.L59
	add	x19, x19, 64
	mov	w1, 44
	mov	w0, 36
	stp	w0, w1, [x19, 8]
.L71:
	mov	w1, 3
	b	.L62
	.p2align 3
.L76:
	add	x19, x19, 64
	mov	w1, 22
	mov	w0, 18
	stp	w0, w1, [x19, 8]
.L70:
	mov	w1, 2
	b	.L62
	.p2align 3
.L65:
	cmp	w0, 1408
	bne	.L59
	cmp	w2, 1152
	bne	.L59
	add	x19, x19, 64
	mov	w2, 88
	mov	w0, 72
	mov	w1, 6335
	stp	w0, w2, [x19, 8]
	b	.L73
	.p2align 3
.L77:
	mov	w1, 4
	b	.L62
.L69:
	mov	w1, 1
	b	.L62
	.size	Real9_CB_SetDimensions, .-Real9_CB_SetDimensions
	.align	3
.LC18:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetPicSize
	.type	Real9_CB_GetPicSize, %function
Real9_CB_GetPicSize:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x24, x2
	mov	x23, x3
	bl	_mcount
	ldr	x0, .LC20
	mov	w3, 180
	ldr	w1, [x20, 20]
	add	x2, x0, 280
	add	x0, x0, 312
	sub	w1, w1, #2
	str	w3, [x29, 64]
	cmp	w1, 1
	ldp	x4, x5, [x2]
	stp	x4, x5, [x29, 80]
	ldp	x4, x5, [x0]
	ldp	x2, x3, [x2, 16]
	stp	x4, x5, [x29, 112]
	ldp	x4, x5, [x0, 16]
	stp	x2, x3, [x29, 96]
	mov	w0, 576
	mov	w2, 360
	stp	x4, x5, [x29, 128]
	stp	w0, wzr, [x29, 72]
	str	w2, [x29, 68]
	bls	.L92
.L79:
	mov	w1, 3
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 3
	mov	x0, x19
	bl	BsSkip
	add	x0, x29, 144
	add	x20, x0, x20, uxtw 2
	ldr	w21, [x20, -64]
	cbz	w21, .L82
.L81:
	mov	w1, 3
	mov	x0, x19
	bl	BsShow
	mov	w22, w0
	mov	w1, 3
	mov	x0, x19
	bl	BsSkip
	add	x0, x29, 144
	add	x0, x0, x22, uxtw 2
	ldr	w20, [x0, -32]
	cbz	w20, .L93
.L83:
	str	w21, [x24]
	str	w20, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L82:
	mov	w1, 8
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	add	w21, w21, w20, lsl 2
	bl	BsSkip
	cmp	w20, 255
	beq	.L82
	b	.L81
	.p2align 3
.L92:
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w21, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cbz	w21, .L79
	ldr	w0, [x20, 52]
	str	w0, [x24]
	ldr	w0, [x20, 56]
	str	w0, [x23]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L93:
	mov	w1, 1
	mov	x0, x19
	lsl	w22, w22, 1
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	orr	w0, w20, w22
	add	x1, x29, 144
	ubfiz	x0, x0, 2, 2
	add	x0, x1, x0
	ldr	w20, [x0, -80]
	cbnz	w20, .L83
	.p2align 2
.L84:
	mov	w1, 8
	mov	x0, x19
	bl	BsShow
	mov	w22, w0
	mov	w1, 8
	mov	x0, x19
	add	w20, w20, w22, lsl 2
	bl	BsSkip
	cmp	w22, 255
	beq	.L84
	b	.L83
	.size	Real9_CB_GetPicSize, .-Real9_CB_GetPicSize
	.align	3
.LC20:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_FindNextSliceStartCode
	.type	Real9_CB_FindNextSliceStartCode, %function
Real9_CB_FindNextSliceStartCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, 7184
	mov	w19, 0
	bl	_mcount
	movk	w22, 0x1d, lsl 16
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #2
	cmp	w21, wzr
	bgt	.L100
	b	.L98
	.p2align 3
.L102:
	bl	BsSkip
	cmp	w19, w21
	beq	.L98
.L100:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, w22
	mov	w1, 8
	mov	x0, x20
	bne	.L102
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L98:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Real9_CB_FindNextSliceStartCode, .-Real9_CB_FindNextSliceStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_SearchBits_IgnoreOnly0
	.type	Real9_CB_SearchBits_IgnoreOnly0, %function
Real9_CB_SearchBits_IgnoreOnly0:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w25, w1
	mov	w24, w3
	mov	w23, w2
	bl	_mcount
	sub	w2, w25, #1
	mov	w1, w25
	mov	x0, x21
	mov	w22, 1
	lsl	w22, w22, w2
	bl	BsShow
	mov	w19, w0
	mov	w1, w25
	mov	x0, x21
	bl	BsSkip
	cmp	w23, w19
	ccmp	w24, wzr, 4, ne
	beq	.L104
	tst	w22, w19
	bne	.L104
	ldr	x0, .LC23
	mov	w20, 0
	add	x0, x0, 344
	ldr	w25, [x0, w25, uxtw 2]
	b	.L105
	.p2align 3
.L106:
	tst	w22, w19
	bne	.L104
.L105:
	mov	w1, 1
	mov	x0, x21
	add	w20, w20, w1
	and	w19, w25, w19, lsl 1
	bl	BsShow
	mov	w2, w0
	mov	w1, 1
	mov	x0, x21
	orr	w19, w2, w19
	bl	BsSkip
	cmp	w23, w19
	ccmp	w24, w20, 0, ne
	bhi	.L106
.L104:
	cmp	w23, w19
	ldr	x25, [sp, 64]
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	Real9_CB_SearchBits_IgnoreOnly0, .-Real9_CB_SearchBits_IgnoreOnly0
	.align	3
.LC23:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetSSC
	.type	Real9_CB_GetSSC, %function
Real9_CB_GetSSC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L112
	mov	x0, x20
	bl	Real9_CB_FindNextSliceStartCode
	cmp	w0, wzr
	cset	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L112:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real9_CB_GetSSC, .-Real9_CB_GetSSC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetSliceHeader
	.type	Real9_CB_GetSliceHeader, %function
Real9_CB_GetSliceHeader:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x5
	mov	x19, x0
	mov	x0, x30
	mov	w22, w1
	mov	x23, x2
	mov	x25, x3
	mov	x24, x4
	bl	_mcount
	ldr	w20, [x21, 4]
	cmp	w20, 1
	beq	.L151
	cbz	w22, .L152
	str	wzr, [x23]
	mov	w0, -1
	mov	w20, 1
	str	w0, [x24]
.L137:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L151:
	add	x26, x21, 64
	cbnz	w22, .L115
	ldr	w0, [x26, 24]
	cmn	w0, #1
	beq	.L153
	mov	w1, w20
	mov	x0, x19
	bl	BsShow
	mov	w27, w0
	mov	w1, w20
	mov	x0, x19
	bl	BsSkip
	cbnz	w27, .L120
	mov	w1, 2
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsSkip
	ldr	w0, [x26, 20]
	cmp	w0, w20
	beq	.L118
.L120:
	mov	w20, 0
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L152:
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cmp	w20, 1
	bne	.L120
	ldr	w26, [x21, 80]
	mov	x0, x19
	mov	w1, w26
	bl	BsShow
	mov	w27, w0
	mov	w1, w26
	mov	x0, x19
	bl	BsSkip
	str	w27, [x23]
	ldr	w0, [x21, 80]
	cmp	w0, 11
	bls	.L133
	mov	w1, w20
	mov	x0, x19
	bl	BsShow
	mov	w22, w0
	mov	w1, w20
	mov	x0, x19
	bl	BsSkip
	cmp	w22, 1
	bne	.L120
.L133:
	mov	w1, 5
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 5
	mov	x0, x19
	bl	BsSkip
	str	w20, [x24]
	cmp	w20, 31
	bgt	.L120
	mov	w1, 2
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsSkip
	str	w20, [x21, 52]
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cmp	w20, 1
	bne	.L120
	mov	w1, 2
	mov	x0, x19
	bl	BsShow
	mov	w21, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsSkip
	str	w21, [x25]
	b	.L137
	.p2align 3
.L153:
	mov	w1, w20
	mov	x0, x19
	bl	BsShow
	mov	w22, w0
	mov	w1, w20
	mov	x0, x19
	bl	BsSkip
	cbnz	w22, .L120
	mov	w1, 2
	mov	x0, x19
	mov	w22, w20
	bl	BsShow
	mov	w20, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsSkip
	str	w20, [x26, 20]
.L118:
	mov	w1, 5
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 5
	mov	x0, x19
	bl	BsSkip
	uxtb	w0, w20
	strb	w0, [x26, 2]
	cmp	w0, 31
	bhi	.L120
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cbnz	w20, .L120
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w20, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cbnz	w20, .L120
	mov	w1, 2
	mov	x0, x19
	bl	BsShow
	mov	w27, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsSkip
	str	w27, [x21, 52]
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	mov	w27, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	cmp	w27, wzr
	mov	w1, 13
	cset	w0, ne
	strb	w0, [x26, 1]
	mov	x0, x19
	cbz	w22, .L121
	bl	BsShow
	mov	w22, w0
	mov	w1, 13
	mov	x0, x19
	bl	BsSkip
	str	w22, [x26, 28]
	ldr	w0, [x26, 20]
	cmp	w0, 1
	bls	.L123
	cmp	w0, 2
	bne	.L141
	ldp	w1, w0, [x26, 44]
	stp	w1, w0, [x26, 52]
.L141:
	add	x2, x29, 104
	mov	x1, x26
	mov	x0, x19
	add	x3, x29, 108
	bl	Real9_CB_GetPicSize
	ldp	w1, w0, [x29, 104]
	stp	w1, w0, [x26, 44]
	sub	w2, w1, #48
	stp	w0, w1, [x21, 12]
	mov	w1, 8144
	cmp	w2, w1
	bhi	.L137
	sub	w0, w0, #48
	cmp	w0, w1
	bhi	.L137
	mov	x0, x21
	bl	Real9_CB_SetDimensions
.L129:
	ldr	w20, [x26, 16]
	mov	x0, x19
	mov	w1, w20
	bl	BsShow
	mov	w21, w0
	mov	w1, w20
	mov	x0, x19
	bl	BsSkip
	str	w21, [x26, 24]
.L115:
	ldr	w0, [x26, 24]
	mov	w20, 1
	str	w0, [x23]
	ldrb	w0, [x26, 2]
	str	w0, [x24]
	mov	w0, w20
	str	wzr, [x25]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L121:
	bl	BsShow
	mov	w21, w0
	mov	w1, 13
	mov	x0, x19
	bl	BsSkip
	ldr	w0, [x26, 28]
	cmp	w0, w21
	bne	.L120
	mov	x1, x26
	mov	x0, x19
	add	x3, x29, 108
	add	x2, x29, 104
	bl	Real9_CB_GetPicSize
	ldr	w1, [x26, 44]
	ldr	w0, [x29, 104]
	cmp	w1, w0
	bne	.L137
	ldr	w1, [x26, 48]
	ldr	w0, [x29, 108]
	cmp	w1, w0
	bne	.L137
	b	.L129
.L123:
	stp	wzr, wzr, [x26, 52]
	b	.L141
	.size	Real9_CB_GetSliceHeader, .-Real9_CB_GetSliceHeader
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_CB_GetPictureHeader
	.type	Real9_CB_GetPictureHeader, %function
Real9_CB_GetPictureHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L179
	ldr	x3, .LC26
	mov	x2, 128
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 16
	mov	x0, x20
	bl	BsShow
	mov	w21, w0
	mov	w1, 16
	mov	x0, x20
	bl	BsSkip
	mov	w0, 21845
	cmp	w21, w0
	bne	.L174
	mov	w1, 16
	mov	x0, x20
	bl	BsShow
	mov	w22, w0
	mov	w1, 16
	mov	x0, x20
	bl	BsSkip
	cmp	w22, w21
	bne	.L174
	mov	x0, x20
	add	x1, x29, 60
	bl	Real9_CB_GetVLCBits
	cmp	w0, 30
	bls	.L174
	ldr	w0, [x29, 60]
	tbnz	x0, 0, .L174
	tbnz	x0, 1, .L165
	mov	w2, 176
	mov	w1, 144
	stp	w1, w2, [x19, 12]
.L166:
	ubfx	x1, x0, 2, 5
	ubfx	x0, x0, 7, 8
	str	w1, [x19, 48]
	add	x1, x29, 60
	str	w0, [x19, 36]
	mov	x0, x20
	bl	Real9_CB_GetVLCBits
	cmp	w0, 1
	beq	.L178
	cmp	w0, 3
	beq	.L180
	cmp	w0, 5
	bne	.L174
	ldr	w0, [x29, 60]
	cbnz	w0, .L174
	mov	w0, 2
.L178:
	str	w0, [x19, 8]
.L168:
	ldr	w0, [x19, 16]
	cbz	w0, .L181
.L170:
	sub	w0, w0, #48
	mov	w1, 8144
	cmp	w0, w1
	bhi	.L174
	ldr	w0, [x19, 12]
	sub	w0, w0, #48
	cmp	w0, w1
	bhi	.L174
	mov	x0, x19
	mov	w21, 1
	bl	Real9_CB_SetDimensions
	mov	w1, 2
	mov	x0, x20
	bl	BsShow
	mov	w22, w0
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	str	w22, [x19, 52]
.L156:
	ldp	w2, w1, [x19, 12]
	mov	w0, w21
	add	w1, w1, 15
	add	w2, w2, 15
	lsr	w2, w2, 4
	lsr	w1, w1, 4
	stp	w2, w1, [x19, 20]
	mul	w1, w1, w2
	str	w1, [x19, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L180:
	ldr	w0, [x29, 60]
	cmp	w0, 1
	beq	.L182
.L174:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -2
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L179:
	add	x22, x19, 64
	mov	w0, -1
	mov	x5, x19
	add	x4, x29, 60
	add	x3, x29, 52
	add	x2, x29, 56
	str	w0, [x22, 24]
	mov	w1, 0
	mov	x0, x20
	mov	w21, -2
	bl	Real9_CB_GetSliceHeader
	cmp	w0, 1
	bne	.L156
	ldr	w0, [x22, 20]
	cmp	w0, 3
	bls	.L183
.L157:
	ldrb	w1, [x22, 1]
	str	w1, [x19, 44]
	mov	w1, 8144
	ldr	w0, [x19, 16]
	ldrb	w2, [x22, 2]
	str	w2, [x19, 48]
	sub	w0, w0, #48
	cmp	w0, w1
	ldr	w0, [x22, 28]
	str	w0, [x19, 36]
	ldr	w0, [x22, 32]
	str	w0, [x19, 56]
	ldr	w0, [x22, 36]
	str	w0, [x19, 60]
	bhi	.L174
	ldr	w0, [x19, 12]
	sub	w0, w0, #48
	cmp	w0, w1
	bhi	.L174
	mov	x0, x19
	bl	Real9_CB_SetDimensions
	b	.L156
	.p2align 3
.L165:
	stp	wzr, wzr, [x19, 12]
	b	.L166
	.p2align 3
.L181:
	mov	x1, x19
	mov	x0, x20
	bl	Real9_CB_GetCPFMT
	cbz	w0, .L174
	ldr	w0, [x19, 16]
	b	.L170
	.p2align 3
.L183:
	ldr	x1, .LC25
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx159
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx159:
	.section	.rodata
	.align	0
	.align	2
.L159:
	.byte	(.L158 - .Lrtx159) / 4
	.byte	(.L160 - .Lrtx159) / 4
	.byte	(.L161 - .Lrtx159) / 4
	.byte	(.L162 - .Lrtx159) / 4
	.text
	.p2align 3
.L182:
	str	wzr, [x19, 8]
	b	.L168
.L161:
	mov	w0, 1
	str	w0, [x19, 8]
	mov	w21, w0
	b	.L157
.L160:
	str	wzr, [x19, 8]
	mov	w21, 1
	str	wzr, [x22, 4]
	b	.L157
.L158:
	mov	w0, 1
	str	wzr, [x19, 8]
	mov	w21, w0
	str	w0, [x22, 4]
	b	.L157
.L162:
	mov	w0, 2
	mov	w21, 1
	str	w0, [x19, 8]
	b	.L157
	.size	Real9_CB_GetPictureHeader, .-Real9_CB_GetPictureHeader
	.align	3
.LC25:
	.xword	.L159
	.align	3
.LC26:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_SetImgFormat
	.type	Real9_SetImgFormat, %function
Real9_SetImgFormat:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 53248
	bl	_mcount
	mov	x1, 52336
	add	x1, x21, x1
	ldr	w0, [x20, 3832]
	ldr	w1, [x1, 4080]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L184
	ldr	w4, [x20, 1824]
	mov	w6, 5
	ldrb	w2, [x0, 124]
	mov	w5, 1
	ldrb	w1, [x0, 125]
	bfi	w2, w4, 0, 2
	and	w4, w4, 3
	and	w1, w1, -4
	and	w2, w2, -29
	orr	w1, w1, 12
	bfi	w2, w6, 5, 3
	bfi	w1, w5, 4, 2
	strb	w2, [x0, 124]
	strb	w1, [x0, 125]
	mov	w1, 0
	ldr	w2, [x0, 124]
	and	w2, w2, -114689
	str	w2, [x0, 124]
	lsr	w2, w2, 16
	and	w2, w2, -3
	strb	w2, [x0, 126]
	ldr	x5, [x21]
	ldr	w5, [x5, 592]
	stp	wzr, w4, [x0, 112]
	cmp	w5, 1
	str	w4, [x0, 120]
	cset	w4, eq
	bfi	w2, w4, 2, 1
	strb	w2, [x0, 126]
	ldr	w2, [x20, 1832]
	str	w2, [x0, 128]
	ldr	w2, [x20, 1828]
	str	w2, [x0, 132]
	bl	SetAspectRatio
	ldr	x0, [x21]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L190
.L186:
	mov	w1, 1
	strb	w1, [x19, 407]
	strb	w1, [x19, 405]
	add	x1, x19, 256
	strb	wzr, [x19, 400]
	mov	w0, 8
	mov	w2, 9
	stp	w0, w0, [x1, 164]
	stp	w2, w0, [x1, 156]
.L184:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L190:
	ldr	w2, [x19, 132]
	ldr	w3, [x19, 164]
	add	w2, w2, 15
	ldr	w0, [x19, 44]
	lsl	w1, w3, 4
	lsr	w2, w2, 4
	ldr	x4, [x19, 544]
	add	w5, w3, w0
	mul	w1, w2, w1
	str	w0, [x19, 28]
	str	w0, [x19, 60]
	add	w0, w1, w0
	add	w3, w3, w0
	add	x1, x4, x1, sxtw
	str	w5, [x19, 36]
	str	x1, [x19, 552]
	str	x4, [x19, 560]
	str	w0, [x19, 32]
	str	w3, [x19, 40]
	str	w0, [x19, 48]
	bl	MEM_Phy2Vir
	str	x0, [x19, 568]
	ldr	w1, [x19, 32]
	str	w1, [x19, 64]
	b	.L186
	.size	Real9_SetImgFormat, .-Real9_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RV9_RecordVFMWState
	.type	RV9_RecordVFMWState, %function
RV9_RecordVFMWState:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	RV9_RecordVFMWState, .-RV9_RecordVFMWState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_WriteSliceMsg
	.type	Real9_WriteSliceMsg, %function
Real9_WriteSliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	add	x1, x19, 53248
	lsl	x2, x0, 2
	add	x19, x19, 16
	sub	x2, x2, x0
	add	w20, w20, 1
	lsl	x2, x2, 2
	sub	x2, x2, x0
	ldr	w0, [x1, 1972]
	add	x2, x19, x2, lsl 2
	str	w0, [x2, 96]
	ldr	w0, [x1, 1964]
	str	w0, [x2, 104]
	ldr	w0, [x1, 1968]
	str	w0, [x2, 112]
	ldr	w0, [x1, 1984]
	str	w0, [x2, 100]
	ldr	w0, [x1, 1976]
	str	w0, [x2, 108]
	ldr	w0, [x1, 1980]
	str	w0, [x2, 116]
	ldr	w0, [x1, 1952]
	str	w0, [x2, 120]
	ldr	w0, [x1, 1948]
	str	w0, [x2, 124]
	ldr	w0, [x1, 1944]
	str	w0, [x2, 128]
	ldr	w0, [x1, 1956]
	str	w0, [x2, 132]
	str	w20, [x19, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real9_WriteSliceMsg, .-Real9_WriteSliceMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_WritePicMsg
	.type	Real9_WritePicMsg, %function
Real9_WritePicMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 53248
	mov	x0, 52336
	add	x0, x19, x0
	add	x2, x2, 1816
	ldr	w3, [x2, 8]
	strb	w3, [x19, 17]
	cmp	w3, 2
	ldr	w3, [x2, 24]
	str	w3, [x19, 20]
	ldr	w3, [x2, 20]
	str	w3, [x19, 24]
	ldr	w3, [x0, 3996]
	str	w3, [x19, 28]
	ldr	w3, [x0, 4000]
	str	w3, [x19, 32]
	ldr	w2, [x2, 48]
	str	w2, [x19, 36]
	ldr	w3, [x0, 2900]
	str	w3, [x19, 40]
	ldr	w3, [x0, 2904]
	str	w3, [x19, 44]
	beq	.L193
	str	w2, [x0, 2900]
.L193:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real9_WritePicMsg, .-Real9_WritePicMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_WriteReg
	.type	Real9_WriteReg, %function
Real9_WriteReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	str	w20, [x19, 52]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real9_WriteReg, .-Real9_WriteReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real9_ModifySliceMsg
	.type	Real9_ModifySliceMsg, %function
Real9_ModifySliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16
	ldr	w1, [x0, 132]
	cbnz	w1, .L203
	ldp	w1, w4, [x0, 4]
	ldr	w5, [x0, 32]
	mul	w4, w1, w4
	cmp	w5, 2
	sub	w4, w4, #1
	bhi	.L225
.L202:
	cmp	w5, 1
	bls	.L207
	sub	w7, w5, #1
	mov	w3, 0
	b	.L208
	.p2align 3
.L209:
	add	w3, w3, 1
	lsl	x1, x1, 2
	sub	x1, x1, x2
	sxtw	x6, w3
	lsl	x2, x6, 2
	add	x1, x0, x1, lsl 2
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	ldr	w6, [x1, 132]
	add	x1, x0, x2, lsl 2
	ldr	w1, [x1, 132]
	cmp	w6, w1
	bge	.L203
.L208:
	sxtw	x2, w3
	cmp	w3, w7
	lsl	x1, x2, 2
	sub	x1, x1, x2
	bne	.L209
	uxtw	x3, w3
	lsl	x1, x3, 2
	sub	x1, x1, x3
	lsl	x1, x1, 2
	sub	x3, x1, x3
	add	x3, x0, x3, lsl 2
	ldr	w1, [x3, 132]
	cmp	w4, w1
	ccmp	w1, wzr, 4, ge
	ble	.L203
.L207:
	cbz	w5, .L210
	sub	w9, w5, #1
	mov	w8, 0
	mov	x10, 44
	b	.L213
	.p2align 3
.L228:
	beq	.L226
.L213:
	add	w3, w8, 1
	sxtw	x7, w8
	lsl	x2, x7, 2
	cmp	w8, w9
	sxtw	x6, w3
	sub	x2, x2, x7
	lsl	x3, x6, 2
	lsl	x2, x2, 2
	sub	x3, x3, x6
	sub	x2, x2, x7
	lsl	x3, x3, 2
	beq	.L227
	sub	x3, x3, x6
	add	x2, x0, x2, lsl 2
	add	x3, x0, x3, lsl 2
	ldr	w3, [x3, 132]
	sub	w3, w3, #1
	str	w3, [x2, 136]
.L212:
	lsl	x1, x7, 2
	add	w8, w8, 1
	sub	x1, x1, x7
	lsl	x1, x1, 2
	sub	x1, x1, x7
	add	x1, x0, x1, lsl 2
	ldr	w2, [x1, 132]
	cmp	w2, w3
	ccmp	w3, wzr, 1, le
	cset	w1, lt
	cmp	w2, wzr
	ccmp	w4, w2, 1, ge
	cset	w2, lt
	cmp	w4, w3
	cset	w3, lt
	orr	w1, w1, w2
	orr	w1, w3, w1
	cmp	w8, w5
	cbz	w1, .L228
	.p2align 2
.L203:
	mov	w0, 0
.L223:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L225:
	ldr	w1, [x0, 176]
	sub	w6, w5, #1
	mov	w2, 1
	cmp	w4, w1
	ccmp	w1, wzr, 4, gt
	bgt	.L205
	b	.L203
	.p2align 3
.L206:
	sub	x1, x1, x3
	lsl	x1, x1, 2
	sub	x1, x1, x3
	add	x1, x0, x1, lsl 2
	ldr	w1, [x1, 132]
	cmp	w1, wzr
	ccmp	w4, w1, 4, gt
	ble	.L203
.L205:
	add	w2, w2, 1
	cmp	w2, w6
	sxtw	x3, w2
	lsl	x1, x3, 2
	bne	.L206
	b	.L202
.L226:
	ldr	w3, [x0, 96]
	mov	w6, 0
	mov	x4, 0
	mov	w2, w3
	b	.L216
	.p2align 3
.L229:
	ldr	w2, [x2, 96]
.L216:
	lsl	x1, x4, 2
	add	w6, w6, 1
	sub	x1, x1, x4
	cmp	w3, w2
	lsl	x1, x1, 2
	csel	w3, w3, w2, ls
	sub	x1, x1, x4
	sxtw	x4, w6
	lsl	x2, x4, 2
	add	x1, x0, x1, lsl 2
	sub	x2, x2, x4
	lsl	x2, x2, 2
	sub	x2, x2, x4
	ldr	w7, [x1, 100]
	add	x2, x0, x2, lsl 2
	cmp	w7, w3
	bcs	.L214
	ldr	w1, [x1, 116]
	cmp	w1, wzr
	csel	w3, w3, w7, eq
.L214:
	cmp	w6, w5
	bne	.L229
	and	w3, w3, -16
	mov	w6, 0
	str	w3, [x0, 40]
	b	.L220
	.p2align 3
.L230:
	ldr	w2, [x1, 104]
	ldr	w7, [x1, 96]
	mov	x4, x2
	add	w2, w7, w2, lsr 3
	and	w4, w4, 7
	sub	w3, w2, w3
	ubfiz	w2, w3, 3, 4
	and	w3, w3, -16
	add	w2, w2, w4
	str	w3, [x1, 96]
	str	w2, [x1, 104]
.L218:
	add	w6, w6, 1
	cmp	w5, w6
	bls	.L219
	ldr	w3, [x0, 40]
.L220:
	sxtw	x2, w6
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 2
	sub	x1, x1, x2
	add	x1, x0, x1, lsl 2
	ldr	w2, [x1, 100]
	cbz	w2, .L230
	ldp	w4, w2, [x1, 104]
	ldp	w10, w9, [x1, 96]
	mov	x7, x2
	mov	x8, x4
	add	w2, w9, w2, lsr 3
	add	w4, w10, w4, lsr 3
	sub	w4, w4, w3
	sub	w3, w2, w3
	ubfiz	w10, w4, 3, 4
	ubfiz	w9, w3, 3, 4
	and	w2, w7, 7
	and	w8, w8, 7
	and	w4, w4, -16
	add	w7, w10, w8
	and	w3, w3, -16
	add	w2, w9, w2
	stp	w4, w3, [x1, 96]
	stp	w7, w2, [x1, 104]
	b	.L218
.L210:
	ldr	w1, [x0, 96]
	and	w1, w1, -16
	str	w1, [x0, 40]
.L219:
	mov	w0, 1
	b	.L223
.L227:
	madd	x1, x7, x10, x0
	mov	w3, w4
	str	w4, [x1, 136]
	b	.L212
	.size	Real9_ModifySliceMsg, .-Real9_ModifySliceMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_Init
	.type	REAL9DEC_Init, %function
REAL9DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	add	x20, x19, 53248
	bl	_mcount
	ldr	x3, .LC27
	mov	x2, 57096
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	add	x0, x20, 3224
	bl	ResetVoQueue
	str	x21, [x19]
	add	x1, x19, 8192
	mov	w5, 15
	add	x1, x1, 3184
	mov	w2, 1
	add	x4, x1, 40960
	mov	w6, 8192
	mov	x0, x19
	str	w5, [x4, 2900]
	str	w5, [x4, 2904]
	ldr	w4, [x21, 8]
	strb	w4, [x1, 24]
	strb	wzr, [x1, 28]
	strb	w2, [x20, 1816]
	str	w2, [x20, 1820]
	str	w6, [x20, 1848]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 3832]
	beq	.L234
	mov	w0, 0
.L232:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L234:
	ldr	x1, .LC29
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L232
	.size	REAL9DEC_Init, .-REAL9DEC_Init
	.align	3
.LC27:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC29:
	.xword	.LC28
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_Destroy
	.type	REAL9DEC_Destroy, %function
REAL9DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, 52336
	ldr	x1, .LC31
	add	x2, x19, x0
	mov	w0, 2
	ldr	w2, [x2, 3972]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL9DEC_Destroy, .-REAL9DEC_Destroy
	.align	3
.LC31:
	.xword	.LC30
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_Decode
	.type	REAL9DEC_Decode, %function
REAL9DEC_Decode:
	stp	x29, x30, [sp, -288]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	add	x23, x20, 53248
	bl	_mcount
	add	x0, x29, 272
	add	x6, x29, 256
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 192]
	stp	xzr, xzr, [x0]
	add	x0, x29, 256
	ldr	w3, [x23, 1924]
	ldr	w2, [x23, 1928]
	mov	w4, 8192
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x0]
	stp	xzr, xzr, [x29, 208]
	mov	w0, 1
	str	w4, [x23, 1848]
	stp	xzr, xzr, [x29, 224]
	stp	xzr, xzr, [x29, 240]
	str	w0, [x23, 1820]
	add	x1, x20, 16
	str	w3, [x23, 1932]
	str	w2, [x23, 1936]
	str	x1, [x29, 136]
	str	w0, [x29, 164]
	str	w4, [x29, 192]
	stp	w3, w2, [x6, 12]
	stp	w3, w2, [x6, 20]
	cbz	x19, .L381
	ldr	x27, .LC36
	mov	w1, 0
	mov	x2, 11360
	add	x0, x20, 16
	add	x22, x20, 8192
	ldr	x3, [x27, 96]
	blr	x3
	add	x1, x22, 3184
	add	x0, x1, 40960
	str	wzr, [x0, 3936]
	ldr	w2, [x19, 16]
	str	w2, [x0, 3956]
	ldr	w2, [x19, 12]
	str	w2, [x0, 3940]
	ldr	x2, [x19]
	str	x2, [x20, 11376]
	ldr	w2, [x19, 16]
	str	w2, [x0, 3944]
	ldrb	w3, [x19, 9]
	strb	w3, [x1, 8]
	ldrb	w3, [x19, 9]
	cmp	w3, 1
	beq	.L239
	ldr	w3, [x19, 92]
	str	w3, [x0, 3948]
	ldr	x3, [x19, 80]
	str	x3, [x1, 16]
	ldr	w3, [x19, 96]
	str	w3, [x0, 3952]
	ldrb	w0, [x19, 89]
	strb	w0, [x1, 9]
	ldrb	w0, [x19, 89]
	cmp	w0, 1
	bne	.L382
	mov	w0, 65525
	sub	w1, w2, #10
	movk	w0, 0x2f, lsl 16
	cmp	w1, w0
	bhi	.L242
.L241:
	ldr	x1, [x20, 11376]
	add	x21, x22, 3184
	cbz	x1, .L242
	add	x19, x23, 3184
	mov	x0, x19
	bl	BsInit
	mov	w1, 8
	mov	x0, x19
	bl	BsShow
	mov	w25, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	add	w0, w25, 1
	cmp	w25, 255
	add	x25, x21, 40960
	mov	w3, w0
	str	w0, [x25, 2908]
	bhi	.L242
	cbz	w0, .L243
	mov	w24, 0
	mov	w26, 3145727
	b	.L244
	.p2align 3
.L383:
	ldr	w3, [x25, 2908]
	cmp	w3, w24
	bls	.L243
.L244:
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	mov	w28, w0
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
	uxtw	x1, w24
	rev	w0, w28
	add	x1, x1, 8192
	cmp	w0, w26
	add	x1, x1, 2776
	add	w24, w24, 1
	str	w0, [x21, x1, lsl 2]
	ble	.L383
	.p2align 2
.L242:
	mov	w28, 0
.L368:
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 288
	ret
	.p2align 3
.L382:
	ldr	w1, [x19, 20]
	mov	w28, 0
	ldr	w0, [x23, 3832]
	bl	SM_ReleaseStreamSeg
	ldr	w1, [x19, 100]
	ldr	w0, [x23, 3832]
	bl	SM_ReleaseStreamSeg
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 288
	ret
	.p2align 3
.L239:
	str	wzr, [x0, 3948]
	str	xzr, [x1, 16]
	str	wzr, [x0, 3952]
	mov	w0, 65525
	strb	wzr, [x1, 9]
	movk	w0, 0x2f, lsl 16
	sub	w1, w2, #10
	cmp	w1, w0
	bls	.L241
	b	.L242
	.p2align 3
.L381:
	mov	x2, 52336
	ldr	x1, .LC35
	add	x20, x20, x2
	mov	w28, 0
	ldr	w2, [x20, 3972]
	bl	dprint_vfmw
	mov	w0, w28
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 288
	ret
	.p2align 3
.L243:
	add	x2, x23, 2000
	sub	w5, w3, #1
	mov	w1, 0
	b	.L245
	.p2align 3
.L246:
	add	x0, x0, 8192
	ldr	w4, [x2], 4
	add	x0, x22, x0, lsl 2
	ldr	w0, [x0, 14288]
	cmp	w0, w4
	ble	.L242
.L245:
	cmp	w1, w5
	add	w0, w1, 1
	mov	x1, x0
	bne	.L246
	add	x26, x22, 3184
	lsl	w3, w3, 3
	add	x0, x26, 40960
	add	w21, w3, 1
	mov	w1, 65534
	movk	w1, 0x2f, lsl 16
	ldr	w25, [x0, 2912]
	add	w25, w21, w25
	sub	w2, w25, #1
	cmp	w2, w1
	mov	w1, 3145727
	ccmp	w21, w1, 0, ls
	bgt	.L242
	ldr	w2, [x0, 3944]
	sub	w2, w2, w25
	cmp	w2, wzr
	ble	.L242
	ldr	x1, [x20, 11376]
	mov	x0, x19
	add	x1, x1, x25, sxtw
	bl	BsInit
	add	x1, x29, 160
	mov	x0, x19
	bl	Real9_CB_GetPictureHeader
	cmp	w0, 1
	mov	w28, w0
	bne	.L384
	ldrb	w0, [x26, 28]
	cbz	w0, .L248
	ldr	w1, [x23, 1840]
	ldr	w2, [x29, 184]
	cmp	w2, w1
	beq	.L385
.L248:
	ldr	x24, .LC39
	ldr	x4, [x24]
	cbz	x4, .L250
	ldr	w0, [x23, 1836]
	mov	w3, 8
	strh	w0, [x29, 154]
	add	x2, x29, 152
	ldp	w0, w1, [x29, 180]
	strh	w1, [x29, 156]
	strh	w0, [x29, 158]
	ldr	w1, [x23, 1840]
	ldr	w0, [x23, 3832]
	strh	w1, [x29, 152]
	mov	w1, 2
	blr	x4
.L250:
	ldr	w0, [x23, 3832]
	bl	FSP_GetFspType
	cbnz	w0, .L251
	add	x26, x29, 288
	ldr	w0, [x23, 3832]
	add	x2, x29, 148
	add	x1, x29, 144
	stp	wzr, wzr, [x29, 144]
	str	wzr, [x26, -136]!
	mov	x3, x26
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x20]
	ldr	w2, [x0, 708]
	cmp	w2, 1
	beq	.L386
.L251:
	add	x0, x22, 3184
	mov	w2, 1
	add	x26, x0, 40960
	mov	x1, x0
	ldr	w0, [x23, 3832]
	add	x24, x23, 3224
	str	x1, [x29, 128]
	ldr	w1, [x26, 4076]
	bl	FSP_ClearLogicFs
	ldr	w1, [x26, 4072]
	mov	w2, 1
	ldr	w0, [x23, 3832]
	bl	FSP_ClearLogicFs
	str	wzr, [x26, 4072]
	str	wzr, [x26, 4076]
	ldr	w0, [x23, 3832]
	bl	FSP_GetNullLogicFs
	str	w0, [x26, 4072]
	ldr	x1, [x29, 128]
	str	w0, [x26, 4076]
	strb	wzr, [x1, 25]
	mov	x1, x24
	ldr	w0, [x23, 3832]
	bl	FSP_ClearNotInVoQueue
	ldr	w2, [x29, 184]
	cmp	w2, 512
	bhi	.L387
	ldr	w0, [x29, 180]
	cmp	w0, 512
	mov	w3, w0
	bhi	.L258
	ldr	x1, [x20]
	ldr	w3, [x1, 708]
	cbnz	w3, .L260
	ldr	w1, [x1, 28]
	cmp	w1, 25
	beq	.L388
.L260:
	ldr	w0, [x23, 3832]
	bl	FSP_GetFspType
	cbz	w0, .L369
.L372:
	ldp	w0, w2, [x29, 180]
.L262:
	ldr	x1, .LC45
	mov	w3, w0
	mov	w0, 1
	bl	dprint_vfmw
	add	x2, x29, 160
	mov	x1, x20
	mov	w0, 6
	bl	Real9_ArrangeVHBMem
	cbz	w0, .L389
.L249:
	ldr	x3, [x27, 104]
	add	x0, x23, 1816
	add	x1, x29, 160
	mov	x2, 128
	str	x0, [x29, 112]
	add	x26, x22, 3184
	blr	x3
	ldr	x0, [x20]
	ldr	w0, [x0, 8]
	strb	w0, [x26, 24]
	mov	x0, x20
	bl	Real9_GetImageBuffer
	cbz	w0, .L390
	add	x27, x26, 40960
	ldr	w0, [x23, 3832]
	ldr	w1, [x27, 4080]
	bl	FSP_GetFsImagePtr
	mov	x2, x0
	cbz	x0, .L377
	ldr	x0, [x20]
	mov	x4, -1
	ldr	x1, .LC51
	ldr	x0, [x0, 56]
	str	x0, [x2, 640]
	mov	w0, 29
	ldr	x3, [x20]
	ldr	x3, [x3, 72]
	str	x3, [x2, 648]
	ldr	x3, [x20]
	ldr	x3, [x3, 88]
	str	x3, [x2, 656]
	ldr	x3, [x20]
	ldr	w3, [x3, 104]
	str	w3, [x2, 8]
	ldr	x3, [x20]
	ldr	w3, [x3, 108]
	str	w3, [x2, 12]
	ldr	x3, [x20]
	ldr	w3, [x3, 112]
	str	w3, [x2, 16]
	ldr	x3, [x20]
	ldr	w3, [x3, 128]
	str	w3, [x2, 20]
	ldr	x3, [x20]
	str	x4, [x3, 56]
	ldr	x3, [x2, 648]
	ldr	x2, [x2, 640]
	bl	dprint_vfmw
	ldr	x0, [x29, 112]
	ldr	w0, [x0, 8]
	cmp	w0, 2
	beq	.L378
	cmp	w0, 1
	ldrb	w0, [x26, 25]
	beq	.L391
	cmp	w0, wzr
	mov	w0, 2
	csinc	w0, w0, wzr, ne
.L269:
	add	x26, x22, 3184
	strb	w0, [x22, 3209]
	add	x26, x26, 40960
	ldr	w2, [x26, 4072]
	ldr	w0, [x26, 4076]
	cmp	w2, w0
	beq	.L270
	ldr	x1, .LC53
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x23, 3832]
	mov	w2, 0
	ldr	w1, [x26, 4072]
	bl	FSP_SetRef
.L270:
	add	x27, x22, 3184
	mov	w2, 1
	add	x26, x27, 40960
	ldr	w0, [x26, 4076]
	ldr	w1, [x26, 4080]
	str	w1, [x26, 4076]
	str	w0, [x26, 4072]
	ldr	w0, [x23, 3832]
	bl	FSP_SetRef
	ldr	w0, [x23, 3832]
	ldr	w1, [x26, 4072]
	bl	FSP_RemovePmv
	ldr	x1, .LC55
	mov	w0, 13
	ldr	w2, [x26, 4080]
	bl	dprint_vfmw
	ldrb	w0, [x22, 3208]
	cmp	w0, 4
	bne	.L272
	ldr	w0, [x23, 1824]
	cbnz	w0, .L274
	str	wzr, [x26, 4088]
.L272:
	add	x27, x22, 3184
	ldr	w0, [x23, 3832]
	add	x27, x27, 40960
	ldr	w1, [x27, 4080]
	bl	FSP_GetLogicFs
	mov	x26, x0
	ldr	w1, [x27, 4072]
	ldr	w0, [x23, 3832]
	bl	FSP_GetLogicFs
	mov	x9, x0
	ldr	w1, [x27, 4076]
	ldr	w0, [x23, 3832]
	str	x9, [x29, 128]
	bl	FSP_GetLogicFs
	mov	x27, x0
	ldr	x9, [x29, 128]
	cmp	x26, xzr
	ccmp	x9, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L392
	ldr	x0, [x26, 680]
	cbz	x0, .L278
	ldr	x1, [x26, 696]
	cbz	x1, .L278
	ldr	x1, [x26, 688]
	cbz	x1, .L278
	ldr	x1, [x27, 680]
	cbz	x1, .L280
	ldr	w5, [x1, 16]
.L281:
	ldr	x0, [x29, 136]
	str	w5, [x0, 44]
	ldr	x0, [x9, 680]
	cbz	x0, .L393
.L373:
	ldr	x24, [x29, 136]
	ldr	w4, [x0, 16]
	ldr	x1, .LC62
	str	w4, [x24, 48]
	str	x9, [x29, 128]
	ldr	x0, [x26, 680]
	ldr	w2, [x0, 16]
	mov	w0, 13
	str	w2, [x24, 52]
	ldr	w6, [x26, 704]
	str	w6, [x24, 68]
	ldr	w7, [x27, 704]
	str	w7, [x24, 72]
	ldr	x3, [x26, 688]
	ldr	w3, [x3, 16]
	str	w3, [x24, 56]
	bl	dprint_vfmw
	ldr	x0, [x26, 688]
	ldr	x9, [x29, 128]
	ldr	w0, [x0, 32]
	str	w0, [x24, 60]
	add	x0, x22, 3184
	add	x0, x0, 40960
	ldr	x1, [x26, 688]
	ldr	w1, [x1, 32]
	str	w1, [x0, 4044]
	ldr	x0, [x26, 688]
	ldr	w0, [x0, 76]
	str	w0, [x24, 84]
	ldr	x0, [x26, 688]
	ldr	w0, [x0, 60]
	str	w0, [x24, 88]
	ldr	x0, [x26, 688]
	ldr	w0, [x0, 64]
	str	w0, [x24, 92]
	ldr	w0, [x23, 1824]
	cmp	w0, 2
	beq	.L394
.L284:
	ldr	w0, [x23, 1852]
	str	w0, [x26, 712]
	add	x0, x22, 3184
	add	x0, x0, 40960
	ldr	w3, [x23, 1864]
	ldr	w2, [x23, 1824]
	mov	w4, w3
	ldr	x3, [x29, 136]
	cmp	w2, 2
	str	w4, [x29, 120]
	strb	w2, [x3, 1]
	ldr	w2, [x23, 1840]
	str	w2, [x3, 4]
	ldr	w1, [x23, 1836]
	str	w1, [x3, 8]
	ldr	w1, [x0, 3996]
	str	w1, [x3, 12]
	ldr	w1, [x0, 4000]
	str	w1, [x3, 16]
	str	w4, [x3, 20]
	ldr	w1, [x0, 2900]
	str	w1, [x3, 24]
	ldr	w1, [x0, 2904]
	str	w1, [x3, 28]
	beq	.L289
	str	w4, [x0, 2900]
.L289:
	mov	x0, x19
	add	x26, x23, 1944
	bl	BsPos
	asr	w1, w0, 31
	lsr	w1, w1, 29
	add	w0, w0, w1
	and	w0, w0, 7
	sub	w0, w0, w1
	add	x1, x22, 3184
	add	x1, x1, 40960
	str	w0, [x23, 1964]
	ldr	w0, [x1, 2908]
	cmp	w0, 1
	beq	.L395
	ldr	w0, [x1, 2916]
	ldr	w1, [x1, 2912]
.L374:
	sub	w1, w0, w1
	mov	x0, x19
	lsl	w27, w1, 3
	bl	BsPos
	sub	w0, w27, w0
	add	x27, x22, 3184
	str	w0, [x26, 24]
	add	x26, x27, 40960
	mov	x0, x19
	ldr	w1, [x26, 3940]
	add	w25, w25, w1
	bl	BsPos
	cmp	w0, wzr
	add	w2, w0, 7
	add	x1, x23, 1792
	ldr	w4, [x23, 1868]
	csel	w0, w2, w0, lt
	ldr	w5, [x29, 120]
	mov	w7, 1
	str	w5, [x23, 1944]
	add	w0, w25, w0, asr 3
	str	w4, [x23, 1948]
	str	wzr, [x23, 1956]
	ldr	x3, [x29, 136]
	stp	w0, wzr, [x1, 180]
	stp	wzr, wzr, [x1, 188]
	ldr	w2, [x23, 1860]
	str	w2, [x23, 1952]
	str	w0, [x3, 96]
	ldr	w0, [x23, 1964]
	str	w0, [x3, 104]
	ldr	w0, [x23, 1968]
	stp	wzr, w0, [x3, 108]
	str	w7, [x3, 32]
	str	wzr, [x3, 100]
	stp	wzr, w2, [x3, 116]
	str	w4, [x3, 124]
	str	wzr, [x3, 132]
	str	w5, [x3, 128]
	ldr	w0, [x26, 2908]
	cmp	w0, w7
	bls	.L309
	ldr	w6, [x26, 2916]
	mov	w0, 3145727
	add	w6, w21, w6
	cmp	w6, w0
	bgt	.L297
	cmp	w6, wzr
	ble	.L297
	ldr	w2, [x26, 3944]
	sub	w2, w2, w6
	cmp	w2, wzr
	ble	.L297
	str	x27, [x29, 128]
	mov	w25, w7
	mov	x27, x26
	add	x26, x29, 152
	stp	w7, w0, [x29, 104]
	b	.L300
	.p2align 3
.L301:
	ldr	w0, [x27, 2908]
	add	w25, w25, 1
	cmp	w0, w25
	bls	.L309
	uxtw	x0, w25
	ldr	x1, [x29, 128]
	add	x0, x0, 8192
	add	x0, x0, 2776
	ldr	w6, [x1, x0, lsl 2]
	ldr	w0, [x29, 108]
	add	w6, w21, w6
	cmp	w6, w0
	bgt	.L297
	cmp	w6, wzr
	ble	.L297
	ldr	w2, [x27, 3944]
	sub	w2, w2, w6
	cmp	w2, wzr
	ble	.L297
.L300:
	ldr	x0, [x29, 128]
	str	w6, [x29, 124]
	ldr	x1, [x0]
	mov	x0, x19
	add	x1, x1, x6, sxtw
	bl	BsInit
	ldr	x5, [x29, 112]
	add	x2, x29, 144
	mov	x4, x26
	add	x3, x29, 148
	mov	w1, 0
	mov	x0, x19
	bl	Real9_CB_GetSliceHeader
	cmp	w0, 1
	mov	w2, w0
	ldr	w6, [x29, 124]
	bne	.L301
	ldr	w1, [x29, 144]
	ldr	w0, [x23, 1840]
	str	w1, [x29, 124]
	cbz	w0, .L396
	ldr	w0, [x29, 152]
	add	x24, x23, 1944
	ldr	w1, [x29, 120]
	cmp	w0, wzr
	str	w6, [x29, 100]
	csel	w0, w1, w0, lt
	str	w0, [x29, 120]
	mov	x0, x19
	bl	BsPos
	asr	w1, w0, 31
	lsr	w1, w1, 29
	ldr	w6, [x29, 100]
	add	w0, w0, w1
	and	w0, w0, 7
	sub	w0, w0, w1
	str	w0, [x23, 1964]
	ldr	w0, [x27, 2908]
	sub	w0, w0, #1
	cmp	w0, w25
	beq	.L397
	cmp	w25, 254
	bhi	.L398
	add	w0, w25, 1
	uxtw	x1, w25
	add	x0, x0, 8192
	add	x1, x1, 8192
	ldr	x2, [x29, 128]
	add	x0, x0, 2776
	add	x1, x1, 2776
	str	w6, [x29, 96]
	ldr	w0, [x2, x0, lsl 2]
	ldr	w1, [x2, x1, lsl 2]
.L375:
	sub	w1, w0, w1
	mov	x0, x19
	lsl	w1, w1, 3
	str	w1, [x29, 100]
	bl	BsPos
	ldp	w6, w1, [x29, 96]
	sub	w0, w1, w0
	str	w0, [x24, 24]
	mov	x0, x19
	ldr	w2, [x27, 3940]
	add	w6, w6, w2
	str	w6, [x29, 100]
	bl	BsPos
	cmp	w0, wzr
	add	w3, w0, 7
	ldr	w6, [x29, 100]
	csel	w0, w3, w0, lt
	ldr	w4, [x29, 124]
	str	w4, [x23, 1956]
	add	w2, w6, w0, asr 3
	ldr	w0, [x29, 120]
	str	w0, [x23, 1944]
	add	x0, x23, 1792
	ldr	x6, [x29, 136]
	stp	w2, wzr, [x0, 180]
	stp	wzr, wzr, [x0, 188]
	ldr	w0, [x29, 104]
	sxtw	x3, w0
	add	w0, w0, 1
	mov	w5, w0
	cmp	w0, 131
	lsl	x0, x3, 2
	str	w5, [x29, 104]
	sub	x0, x0, x3
	lsl	x0, x0, 2
	sub	x0, x0, x3
	ldr	w3, [x23, 1868]
	str	w3, [x23, 1948]
	add	x0, x6, x0, lsl 2
	ldr	w3, [x23, 1860]
	str	w3, [x23, 1952]
	mov	x3, x6
	str	w2, [x0, 96]
	ldr	w2, [x23, 1964]
	str	w2, [x0, 104]
	ldr	w2, [x23, 1968]
	str	w2, [x0, 112]
	ldr	w2, [x23, 1984]
	str	w2, [x0, 100]
	ldr	w2, [x23, 1976]
	str	w2, [x0, 108]
	ldr	w2, [x23, 1980]
	str	w2, [x0, 116]
	ldr	w2, [x23, 1952]
	str	w2, [x0, 120]
	ldr	w2, [x23, 1948]
	str	w2, [x0, 124]
	ldr	w2, [x23, 1944]
	str	w2, [x0, 128]
	ldr	w1, [x23, 1956]
	str	w1, [x0, 132]
	str	w5, [x3, 32]
	ble	.L301
	mov	x0, x20
	bl	Real9_ModifySliceMsg
	cmp	w0, 1
	bne	.L377
	ldr	x0, [x29, 136]
	str	x0, [x20, 8]
	b	.L301
.L388:
	ldr	x1, [x29, 128]
	ldrb	w1, [x1, 28]
	cbnz	w1, .L262
.L369:
	mov	x0, x24
	bl	ResetVoQueue
	b	.L372
.L384:
	ldr	x1, .LC38
	mov	w0, 1
	mov	w28, 0
	bl	dprint_vfmw
	b	.L368
.L387:
	ldr	w3, [x29, 180]
.L258:
	ldr	x1, .LC43
	mov	w0, 18
	mov	w28, 0
	bl	dprint_vfmw
	b	.L368
.L390:
	add	x26, x26, 40960
	ldr	x1, .LC49
	mov	w28, 0
	ldr	w2, [x26, 3972]
	bl	dprint_vfmw
	b	.L368
.L385:
	ldr	w0, [x23, 1836]
	ldr	w1, [x29, 180]
	cmp	w1, w0
	bne	.L248
	b	.L249
.L386:
	ldr	w0, [x29, 152]
	cmp	w0, wzr
	bgt	.L254
	ldr	w0, [x29, 148]
	cmp	w0, 32
	bgt	.L254
	ldr	x0, [x20, 8]
	cbnz	x0, .L254
	ldr	w3, [x23, 3056]
	cbz	w3, .L251
	ldr	w4, [x23, 1840]
	cbz	w4, .L251
	ldr	w1, [x23, 3836]
	ldr	w7, [x29, 180]
	cmp	w7, w1
	beq	.L251
	ldr	w1, [x23, 3840]
	ldr	w6, [x29, 184]
	cmp	w6, w1
	beq	.L251
	ldr	x1, .LC41
	mov	w0, w2
	ldr	w5, [x23, 1836]
	bl	dprint_vfmw
	ldr	w0, [x29, 180]
	str	w0, [x23, 3836]
	ldr	x4, [x24]
	ldr	w0, [x29, 184]
	str	w0, [x23, 3840]
	cbz	x4, .L251
	ldr	w0, [x23, 3832]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L251
	.p2align 3
.L389:
	ldr	x1, .LC47
	mov	w0, 1
	mov	w28, 0
	bl	dprint_vfmw
	b	.L368
.L378:
	ldrb	w0, [x26, 25]
	cmp	w0, 1
	bls	.L377
	ldrb	w0, [x26, 24]
	cmp	w0, 4
	bne	.L272
.L313:
	add	x0, x22, 3184
	add	x0, x0, 40960
	ldr	w1, [x0, 4088]
	cbnz	w1, .L272
	ldr	w1, [x0, 4080]
	mov	w2, 1
	ldr	w0, [x23, 3832]
	mov	w28, 0
	bl	FSP_ClearLogicFs
	b	.L368
.L297:
	add	x1, x22, 3184
	ldr	w0, [x23, 3832]
	add	x1, x1, 40960
	mov	w2, 1
	mov	w28, 0
	ldr	w1, [x1, 4080]
	bl	FSP_ClearLogicFs
	b	.L368
.L391:
	cbz	w0, .L242
	mov	w0, 2
	b	.L269
.L254:
	mov	w28, -2
	b	.L368
.L397:
	uxtw	x0, w25
	ldr	x1, [x29, 128]
	add	x0, x0, 8192
	str	w6, [x29, 96]
	add	x0, x0, 2776
	ldr	w1, [x1, x0, lsl 2]
	ldr	w0, [x27, 3944]
	sub	w0, w0, w21
	b	.L375
.L392:
	ldr	x2, .LC56
	mov	w3, 2034
	ldr	x1, .LC58
	mov	w0, 0
	mov	w28, 0
	bl	dprint_vfmw
	b	.L368
.L377:
	ldr	w0, [x23, 3832]
	mov	w2, 1
	ldr	w1, [x27, 4080]
	mov	w28, 0
	bl	FSP_ClearLogicFs
	b	.L368
.L274:
	cmp	w0, 2
	beq	.L313
	cmp	w0, 1
	bne	.L272
	str	w0, [x26, 4088]
	b	.L272
.L280:
	ldr	w5, [x0, 16]
	b	.L281
.L278:
	add	x1, x22, 3184
	ldr	w0, [x23, 3832]
	add	x1, x1, 40960
	mov	w2, 1
	mov	w28, 0
	ldr	w1, [x1, 4080]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC60
	mov	w0, 0
	bl	dprint_vfmw
	b	.L368
.L309:
	ldr	x0, [x29, 136]
	mov	w19, 1
	str	w19, [x0, 36]
	ldr	x3, [x20, 8]
	cbz	x3, .L399
	ldr	x0, [x20]
	ldr	w1, [x0, 864]
	cmp	w1, 1
	beq	.L314
.L311:
	cmp	w1, 2
	beq	.L400
.L312:
	ldr	w1, [x0, 592]
	str	w1, [x20, 92]
	ldr	w0, [x0, 632]
	str	w0, [x20, 96]
	b	.L368
.L395:
	ldr	w0, [x1, 3944]
	ldr	w1, [x1, 2912]
	sub	w0, w0, w21
	b	.L374
.L394:
	ldr	w3, [x9, 712]
	ldr	w1, [x23, 1852]
	ldr	w0, [x27, 712]
	subs	w1, w1, w3
	sub	w0, w0, w3
	bmi	.L401
.L285:
	tbnz	w0, #31, .L402
.L286:
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w0, wzr
	ble	.L317
	sub	w3, w0, w1
	lsl	w4, w1, 14
	lsl	w3, w3, 14
	sdiv	w4, w4, w0
	sdiv	w3, w3, w0
.L288:
	add	x2, x22, 3184
	add	x2, x2, 40960
	add	x5, x2, 3840
	stp	w1, w0, [x5, 148]
	stp	w4, w3, [x5, 156]
	b	.L284
.L393:
	ldr	x0, [x26, 680]
	b	.L373
.L399:
	mov	x0, x20
	bl	Real9_ModifySliceMsg
	cmp	w0, 1
	bne	.L403
	ldr	x0, [x20]
	ldr	x2, [x29, 136]
	str	x2, [x20, 8]
	ldr	w1, [x0, 864]
	cmp	w1, 1
	bne	.L311
	cbz	x2, .L312
	mov	x3, x2
.L314:
	ldrb	w1, [x3, 1]
	cmp	w1, 2
	bne	.L312
	str	xzr, [x20, 8]
	mov	w2, 0
	mov	w28, 0
	ldr	w1, [x23, 3168]
	ldr	w0, [x23, 3832]
	bl	FSP_SetDisplay
	mov	x1, x20
	mov	w0, 9
	bl	ReleasePacket
	b	.L368
.L401:
	ldr	w2, [x23, 1848]
	add	w1, w1, w2
	b	.L285
.L400:
	ldr	w1, [x0, 868]
	cmp	w1, wzr
	ble	.L312
	ldr	x1, [x20, 8]
	cbz	x1, .L312
	ldrb	w1, [x1, 1]
	cmp	w1, 2
	bne	.L312
	str	xzr, [x20, 8]
	mov	w2, 0
	mov	w28, 0
	ldr	w1, [x23, 3168]
	ldr	w0, [x23, 3832]
	bl	FSP_SetDisplay
	ldr	x3, [x20]
	mov	x1, x20
	mov	w0, 9
	ldr	w2, [x3, 868]
	sub	w2, w2, #1
	str	w2, [x3, 868]
	bl	ReleasePacket
	b	.L368
.L403:
	add	x1, x22, 3184
	ldr	w0, [x23, 3832]
	add	x1, x1, 40960
	mov	w2, w19
	mov	w28, 0
	ldr	w1, [x1, 4080]
	bl	FSP_ClearLogicFs
	b	.L368
.L398:
	ldr	x1, .LC64
	mov	w2, 2266
	mov	w0, 22
	mov	w28, 0
	bl	dprint_vfmw
	b	.L368
.L396:
	ldr	x0, [x29, 128]
	mov	w28, 0
	add	x25, x0, 40960
	ldr	w0, [x23, 3832]
	ldr	w1, [x25, 4080]
	bl	FSP_ClearLogicFs
	b	.L368
.L317:
	mov	w3, 0
	mov	w4, 0
	b	.L288
.L402:
	ldr	w2, [x23, 1848]
	add	w0, w0, w2
	b	.L286
	.size	REAL9DEC_Decode, .-REAL9DEC_Decode
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC36:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC39:
	.xword	g_event_report
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC56:
	.xword	.LANCHOR1
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_RecycleImage
	.type	REAL9DEC_RecycleImage, %function
REAL9DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L406
	add	x19, x19, 53248
	mov	w2, 0
	mov	w1, w20
	ldr	w0, [x19, 3832]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 3832]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L406:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL9DEC_RecycleImage, .-REAL9DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_GetRemainImg
	.type	REAL9DEC_GetRemainImg, %function
REAL9DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 53248
	bl	_mcount
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L408
	mov	x21, 52336
	add	x20, x19, 53248
	add	x21, x19, x21
	ldr	w0, [x20, 3832]
	ldr	w1, [x21, 4076]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L408
	ldr	w0, [x20, 3832]
	ldr	w1, [x21, 4076]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L421
.L408:
	add	x22, x20, 3224
.L412:
	mov	x0, x22
	bl	GetVoLastImageID
.L418:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L421:
	mov	x0, x19
	add	x22, x20, 3224
	bl	Real9_SetImgFormat
	mov	w2, 1
	str	w2, [x23, 212]
	ldr	w0, [x20, 3832]
	ldr	w1, [x21, 4076]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 3832]
	mov	x4, x23
	mov	x3, x22
	mov	x2, x19
	mov	w1, 9
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L409
	ldr	w0, [x20, 3832]
	mov	w2, 0
	ldr	w1, [x21, 4076]
	bl	FSP_SetDisplay
	b	.L412
	.p2align 3
.L409:
	ldr	w0, [x23, 184]
	cmp	w0, 100
	bhi	.L408
	ldr	w0, [x23, 128]
	cmp	w0, 31
	bls	.L408
	ldr	w1, [x23, 132]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L418
	b	.L412
	.size	REAL9DEC_GetRemainImg, .-REAL9DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_VDMPostProc
	.type	REAL9DEC_VDMPostProc, %function
REAL9DEC_VDMPostProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	w24, w2
	bl	_mcount
	add	x19, x21, 8192
	ldr	x1, .LC66
	mov	w2, w20
	mov	w0, 22
	add	x25, x19, 3184
	add	x22, x21, 53248
	add	x23, x25, 40960
	bl	dprint_vfmw
	mov	x1, x21
	mov	w0, 9
	bl	ReleasePacket
	ldr	w0, [x22, 3832]
	ldr	w1, [x23, 4080]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L431
	ldr	w1, [x23, 2736]
	strb	w1, [x19, 3210]
	cmp	w1, 2
	beq	.L424
	and	w24, w24, 31
	str	w24, [x23, 2904]
.L424:
	tbnz	w20, #31, .L432
	mov	w1, 100
	cmp	w20, w1
	csel	w20, w20, w1, le
.L425:
	ldr	x1, .LC68
	str	w20, [x0, 184]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x21
	bl	Real9_SetImgFormat
	ldrb	w1, [x19, 3208]
	add	x0, x19, 3184
	cmp	w1, 2
	beq	.L428
	ldr	x1, [x21]
	ldr	w1, [x1, 12]
	cmp	w1, 1
	beq	.L428
	add	x1, x0, 40960
	ldr	w2, [x1, 2736]
	cmp	w2, 2
	beq	.L428
	ldrb	w0, [x0, 25]
	cmp	w0, 1
	bls	.L433
	ldr	w1, [x1, 4072]
.L429:
	add	x0, x19, 3184
	cmn	w1, #1
	add	x0, x0, 40960
	str	w1, [x0, 4084]
	beq	.L430
.L450:
	add	x20, x19, 3184
	ldr	w0, [x22, 3832]
	add	x20, x20, 40960
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w23, [x20, 4084]
	ldr	w0, [x22, 3832]
	mov	w1, w23
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC70
	mov	w2, w23
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w1, [x20, 4084]
	mov	w2, 1
	ldr	w0, [x22, 3832]
	bl	FSP_SetDisplay
	ldr	w0, [x22, 3832]
	mov	x4, x24
	add	x3, x22, 3224
	mov	x2, x21
	mov	w1, 9
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L449
.L430:
	add	x19, x19, 3184
	mov	w0, 1
	add	x19, x19, 40960
	ldr	w1, [x19, 3972]
	add	w1, w1, w0
	str	w1, [x19, 3972]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L428:
	add	x0, x19, 3184
	add	x0, x0, 40960
	ldr	w1, [x0, 4080]
	str	w1, [x0, 4084]
	cmn	w1, #1
	bne	.L450
	b	.L430
	.p2align 3
.L432:
	mov	w20, 0
	b	.L425
	.p2align 3
.L449:
	ldr	w1, [x20, 4084]
	mov	w2, 0
	ldr	w0, [x22, 3832]
	bl	FSP_SetDisplay
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L431:
	mov	w0, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L433:
	mov	w1, -1
	b	.L429
	.size	REAL9DEC_VDMPostProc, .-REAL9DEC_VDMPostProc
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
	.global	REAL9DEC_GetImageBuffer
	.type	REAL9DEC_GetImageBuffer, %function
REAL9DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 53248
	bl	_mcount
	ldr	w0, [x19, 3832]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	mov	w20, w0
	beq	.L452
	ldr	w0, [x19, 3832]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L457
.L452:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L457:
	ldr	w0, [x19, 3832]
	add	x1, x19, 3224
	bl	FSP_ClearNotInVoQueue
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL9DEC_GetImageBuffer, .-REAL9DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL9DEC_Support
	.type	REAL9DEC_Support, %function
REAL9DEC_Support:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	str	w0, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL9DEC_Support, .-REAL9DEC_Support
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	gs_VLCDecodeTable, %object
	.size	gs_VLCDecodeTable, 256
gs_VLCDecodeTable:
	.byte	-128
	.byte	-127
	.byte	112
	.byte	112
	.byte	-126
	.byte	-125
	.byte	113
	.byte	113
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	-124
	.byte	-123
	.byte	114
	.byte	114
	.byte	-122
	.byte	-121
	.byte	115
	.byte	115
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	-120
	.byte	-119
	.byte	116
	.byte	116
	.byte	-118
	.byte	-117
	.byte	117
	.byte	117
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	-116
	.byte	-115
	.byte	118
	.byte	118
	.byte	-114
	.byte	-113
	.byte	119
	.byte	119
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.type	MBA_FieldWidth, %object
	.size	MBA_FieldWidth, 24
MBA_FieldWidth:
	.word	6
	.word	7
	.word	9
	.word	11
	.word	13
	.word	14
.LC0:
	.word	160
	.word	176
	.word	240
	.word	320
	.word	352
	.word	640
	.word	704
	.word	0
.LC1:
	.word	120
	.word	132
	.word	144
	.word	240
	.word	288
	.word	480
	.word	0
	.word	0
	.type	GetBitsMask, %object
	.size	GetBitsMask, 100
GetBitsMask:
	.word	0
	.word	1
	.word	3
	.word	7
	.word	15
	.word	31
	.word	63
	.word	127
	.word	255
	.word	511
	.word	1023
	.word	2047
	.word	4095
	.word	8191
	.word	16383
	.word	32767
	.word	65535
	.word	131071
	.word	262143
	.word	524287
	.word	1048575
	.word	2097151
	.word	4194303
	.word	8388607
	.word	16777215
	.align	3
.LANCHOR1 = . + 0
	.type	__FUNCTION__.12031, %object
	.size	__FUNCTION__.12031, 16
__FUNCTION__.12031:
	.string	"REAL9DEC_Decode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC5:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC7:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC9:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC11:
	ASCII(.string	"image size abnormal (%dx%d) in MB\n" )
	.zero	5
.LC13:
	ASCII(.string	"real9 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
.LC16:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC28:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC30:
	ASCII(.string	"Decoding quits at frm %d\n" )
	.zero	6
.LC34:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
.LC37:
	ASCII(.string	"Real9_CB_GetPictureHeader Error!\n" )
	.zero	6
.LC40:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC42:
	ASCII(.string	"pic width/height to large,MbWidth = %d, MbHeight = %d" )
	.zero	2
.LC44:
	ASCII(.string	"new seq size %d * %d\n" )
	.zero	2
.LC46:
	ASCII(.string	"Real9_ArrangeVHBMem err\n" )
	.zero	7
.LC48:
	ASCII(.string	"Fatal Error: frm%d, get image buffer failed\n" )
	.zero	3
.LC50:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC52:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC54:
	ASCII(.string	"++++++++++ ref %d\n" )
	.zero	5
.LC57:
	ASCII(.string	"CurFsID abnormal!,%s %d (NULL == pCur) || (NULL == pFwd) || (NULL == pBwd)!!\n" )
	.zero	2
.LC59:
	ASCII(.string	"CurFsID abnormal!\n" )
	.zero	5
.LC61:
	ASCII(.string	"dec addr: cur,cur2d,fwd,bwd,currpmv,colpmv = %p,%p,%p,%p,%p,%p\n" )
.LC63:
	ASCII(.string	"line:%d! i > (RV9_MAX_SLC_PARAM_NUM - 2)\n" )
	.zero	6
.LC65:
	ASCII(.string	"ErrRatio = %d\n" )
	.zero	1
.LC67:
	ASCII(.string	"DEBUG: DEC over\n" )
	.zero	7
.LC69:
	ASCII(.string	"insert buf %d ref %d\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
