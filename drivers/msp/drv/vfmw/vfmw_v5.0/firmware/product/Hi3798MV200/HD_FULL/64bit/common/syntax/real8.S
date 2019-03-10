#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"real8.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetBits
	.type	Real8_CB_GetBits, %function
Real8_CB_GetBits:
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
	.size	Real8_CB_GetBits, .-Real8_CB_GetBits
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_Get1Bit
	.type	Real8_CB_Get1Bit, %function
Real8_CB_Get1Bit:
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
	.size	Real8_CB_Get1Bit, .-Real8_CB_Get1Bit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetVLCBits
	.type	Real8_CB_GetVLCBits, %function
Real8_CB_GetVLCBits:
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
	ldr	x22, .LC3
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
	.size	Real8_CB_GetVLCBits, .-Real8_CB_GetVLCBits
	.align	3
.LC3:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_GetImageBuffer
	.type	Real8_GetImageBuffer, %function
Real8_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 53248
	add	x19, x19, 8192
	bl	_mcount
	add	x19, x19, 3192
	add	x20, x19, 45056
	mov	w1, 1
	ldr	w0, [x21, 3864]
	bl	FSP_NewLogicFs
	str	w0, [x20, 8]
	mov	w1, w0
	tbnz	w0, #31, .L15
	ldr	w0, [x21, 3864]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cbz	x0, .L16
	ldr	x1, .LC9
	mov	w0, 18
	ldr	w2, [x20, 8]
	bl	dprint_vfmw
	ldr	x0, [x19, 680]
	cbz	x0, .L14
	ldr	x1, [x19, 688]
	cbz	x1, .L14
	ldr	x2, [x19, 696]
	cbz	x2, .L14
	ldr	w3, [x1, 16]
	ldr	w4, [x2, 16]
	ldr	x1, .LC11
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
	ldr	x1, .LC5
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 4]
	mov	w2, 1
	ldr	w0, [x21, 3864]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20]
	mov	w2, 1
	ldr	w0, [x21, 3864]
	bl	FSP_ClearLogicFs
	stp	wzr, wzr, [x20]
	ldr	w0, [x21, 3864]
	bl	FSP_GetNullLogicFs
	stp	w0, w0, [x20]
	strb	wzr, [x19, 23]
	add	x1, x21, 3256
	ldr	w0, [x21, 3864]
	bl	FSP_ClearNotInVoQueue
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L16:
	ldr	x1, .LC7
	mov	w2, 513
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L10
	.size	Real8_GetImageBuffer, .-Real8_GetImageBuffer
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_ArrangeVHBMem
	.type	Real8_ArrangeVHBMem, %function
Real8_ArrangeVHBMem:
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
	ldp	w3, w2, [x19, 104]
	cmp	w2, 1
	bls	.L19
	sub	w1, w3, #2
	mov	w0, 512
	cmp	w1, 510
	ccmp	w2, w0, 2, ls
	bhi	.L19
	ldr	x0, [x20]
	ldr	w1, [x0, 748]
	cbnz	w1, .L22
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L49
.L23:
	ldp	w23, w22, [x19, 96]
	mov	w25, 5
	mov	w21, 2
	mov	w24, 4
.L29:
	ldr	x0, .LC16
	mov	w1, 0
	mov	x2, 32
	ldr	x3, [x0, 96]
	add	x0, x29, 96
	blr	x3
	strb	wzr, [x29, 97]
	ldr	w1, [x19, 96]
	ldr	x0, [x20]
	str	w1, [x29, 124]
	ldr	w1, [x19, 100]
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
	ldr	w0, [x19, 3864]
	bl	FSP_ConfigInstance
	mov	w2, 0
	cbnz	w0, .L44
	ldr	x1, [x20]
	add	x3, x29, 92
	ldr	w0, [x19, 3864]
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
	ldr	x1, .LC13
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
	ldr	w4, [x0, 708]
	ldp	w3, w2, [x19, 96]
	ldr	w5, [x0, 712]
	cmp	w2, w4
	bhi	.L32
	cmp	w3, w5
	bhi	.L32
	ldr	w4, [x0, 736]
	mov	w22, w2
	ldr	w1, [x0, 732]
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
	ldrsb	w25, [x0, 756]
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
	ldr	x1, .LC15
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
	.p2align 3
.L49:
	ldr	w22, [x0, 708]
	ldp	w3, w2, [x19, 96]
	cmp	w2, w22
	bhi	.L51
	ldr	w23, [x0, 712]
	cmp	w3, w23
	bhi	.L52
	add	x1, x20, 8192
	ldrb	w2, [x1, 3212]
	cmp	w2, 1
	beq	.L44
	ldr	w2, [x0, 736]
	mov	w21, 1
	ldr	w1, [x0, 732]
	add	w24, w1, 2
	cbnz	w2, .L47
	ldrsb	w25, [x0, 756]
	b	.L29
	.p2align 3
.L50:
	add	x0, x19, 3256
	bl	ResetVoQueue
.L37:
	ldr	x1, .LC18
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
	.p2align 3
.L52:
	mov	w5, w23
.L25:
	ldr	x1, .LC15
	mov	w4, w22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w2, 0
	b	.L44
.L51:
	ldr	w5, [x0, 712]
	b	.L25
	.size	Real8_ArrangeVHBMem, .-Real8_ArrangeVHBMem
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC18:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetCPFMT
	.type	Real8_CB_GetCPFMT, %function
Real8_CB_GetCPFMT:
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
	str	w20, [x21, 100]
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
	str	w22, [x21, 96]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	Real8_CB_GetCPFMT, .-Real8_CB_GetCPFMT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_SetDimensions
	.type	Real8_CB_SetDimensions, %function
Real8_CB_SetDimensions:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x1, 96
	ldr	x0, [x19, 96]
	movk	x1, 0x80, lsl 32
	cmp	x0, x1
	beq	.L73
	mov	x1, 144
	movk	x1, 0xb0, lsl 32
	cmp	x0, x1
	beq	.L74
	mov	x1, 288
	movk	x1, 0x160, lsl 32
	cmp	x0, x1
	beq	.L75
	mov	x1, 576
	movk	x1, 0x2c0, lsl 32
	cmp	x0, x1
	beq	.L76
	mov	x1, 1152
	movk	x1, 0x580, lsl 32
	cmp	x0, x1
	beq	.L77
	ldr	w0, [x19, 100]
	add	x1, x19, 8
	mov	w2, 6
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x1, 28]
	ldr	w3, [x19, 96]
	add	w3, w3, 15
	lsr	w3, w3, 4
	str	w3, [x1, 24]
	mul	w0, w0, w3
	sub	w0, w0, #1
	cmp	w0, 47
	bls	.L59
	cmp	w0, 98
	bls	.L68
	cmp	w0, 395
	bls	.L69
	cmp	w0, 1583
	bls	.L70
.L72:
	mov	w3, 6335
	mov	w2, 14
	cmp	w0, w3
	bhi	.L59
	mov	w2, 4
	b	.L61
	.p2align 3
.L73:
	add	x1, x19, 8
	mov	w0, 6
	mov	w3, 8
	mov	w2, w0
	stp	w0, w3, [x1, 24]
.L59:
	str	w2, [x1, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L74:
	add	x1, x19, 8
	mov	w3, 11
	mov	w0, 9
	mov	w2, 1
	stp	w0, w3, [x1, 24]
.L61:
	ldr	x0, .LC19
	add	x0, x0, 256
	ldr	w2, [x0, w2, uxtw 2]
	str	w2, [x1, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L75:
	add	x1, x19, 8
	mov	w2, 22
	mov	w0, 18
	stp	w0, w2, [x1, 24]
.L69:
	mov	w2, 2
	b	.L61
	.p2align 3
.L77:
	add	x1, x19, 8
	mov	w3, 88
	mov	w2, 72
	mov	w0, 6335
	stp	w2, w3, [x1, 24]
	b	.L72
	.p2align 3
.L76:
	add	x1, x19, 8
	mov	w2, 44
	mov	w0, 36
	stp	w0, w2, [x1, 24]
.L70:
	mov	w2, 3
	b	.L61
.L68:
	mov	w2, 1
	b	.L61
	.size	Real8_CB_SetDimensions, .-Real8_CB_SetDimensions
	.align	3
.LC19:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetPicSize
	.type	Real8_CB_GetPicSize, %function
Real8_CB_GetPicSize:
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
	ldr	x0, .LC21
	mov	w3, 180
	ldr	w1, [x20, 36]
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
	ldr	w0, [x20, 68]
	str	w0, [x24]
	ldr	w0, [x20, 72]
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
	.size	Real8_CB_GetPicSize, .-Real8_CB_GetPicSize
	.align	3
.LC21:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_FindNextSliceStartCode
	.type	Real8_CB_FindNextSliceStartCode, %function
Real8_CB_FindNextSliceStartCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
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
	bgt	.L101
	b	.L98
	.p2align 3
.L104:
	bl	BsSkip
	cmp	w19, w21
	beq	.L98
.L101:
	mov	w1, 17
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L104
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L98:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	Real8_CB_FindNextSliceStartCode, .-Real8_CB_FindNextSliceStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_SearchBits_IgnoreOnly0
	.type	Real8_CB_SearchBits_IgnoreOnly0, %function
Real8_CB_SearchBits_IgnoreOnly0:
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
	beq	.L106
	tst	w22, w19
	bne	.L106
	ldr	x0, .LC24
	mov	w20, 0
	add	x0, x0, 344
	ldr	w25, [x0, w25, uxtw 2]
	b	.L107
	.p2align 3
.L108:
	tst	w22, w19
	bne	.L106
.L107:
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
	bhi	.L108
.L106:
	cmp	w23, w19
	ldr	x25, [sp, 64]
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	Real8_CB_SearchBits_IgnoreOnly0, .-Real8_CB_SearchBits_IgnoreOnly0
	.align	3
.LC24:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_SetRPRSizes
	.type	Real8_CB_SetRPRSizes, %function
Real8_CB_SetRPRSizes:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x0, .LC26
	add	x6, x29, 56
	add	x1, x29, 96
	str	x21, [x19, 16]
	add	x0, x0, 448
	add	x1, x1, x20, uxtw 2
	str	w20, [x19, 24]
	ldp	x4, x5, [x0]
	stp	x4, x5, [x6]
	add	x4, x29, 72
	ldp	x2, x3, [x0, 16]
	ldr	w0, [x0, 32]
	stp	x2, x3, [x4]
	str	w0, [x29, 88]
	ldr	w0, [x1, -40]
	str	w0, [x19, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.size	Real8_CB_SetRPRSizes, .-Real8_CB_SetRPRSizes
	.align	3
.LC26:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetSSC
	.type	Real8_CB_GetSSC, %function
Real8_CB_GetSSC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 88]
	cmp	w0, 1
	beq	.L115
	mov	x0, x20
	bl	Real8_CB_FindNextSliceStartCode
	cmp	w0, wzr
	cset	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L115:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real8_CB_GetSSC, .-Real8_CB_GetSSC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetSliceHeader
	.type	Real8_CB_GetSliceHeader, %function
Real8_CB_GetSliceHeader:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x5
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	mov	x22, x2
	mov	x24, x3
	mov	x23, x4
	bl	_mcount
	ldr	w0, [x19, 88]
	cmp	w0, 1
	beq	.L151
	cbz	w21, .L152
	str	wzr, [x22]
	mov	w0, -1
	mov	w19, 1
	str	w0, [x23]
.L142:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L151:
	cbnz	w21, .L153
	add	x21, x19, 8
	mov	w1, 3
	mov	x0, x20
	ldr	w26, [x21, 40]
	bl	BsShow
	mov	w25, w0
	mov	w1, 3
	mov	x0, x20
	bl	BsSkip
	cmp	w25, 7
	bhi	.L122
	ldr	x0, .LC28
	add	x0, x0, 488
	ldr	w0, [x0, w25, uxtw 2]
	cmp	w0, 2
	bhi	.L122
	cmn	w26, #1
	mov	w1, 2
	mov	x0, x20
	beq	.L154
	bl	BsShow
	mov	w25, w0
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	ldr	w0, [x21, 36]
	cmp	w0, w25
	bne	.L122
.L124:
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w25, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	cbnz	w25, .L122
	mov	w1, 5
	mov	x0, x20
	bl	BsShow
	mov	w25, w0
	mov	w1, 5
	mov	x0, x20
	bl	BsSkip
	uxtb	w0, w25
	strb	w0, [x21, 2]
	cmp	w0, 31
	bhi	.L122
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w25, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	cmp	w25, wzr
	mov	w1, 13
	cset	w0, ne
	cmn	w26, #1
	strb	w0, [x21, 1]
	mov	x0, x20
	bne	.L125
	bl	BsShow
	mov	w26, w0
	mov	w1, 13
	mov	x0, x20
	bl	BsSkip
	ldr	w25, [x21, 4]
	str	w26, [x21, 44]
	cbz	w25, .L143
	mov	w1, w25
	mov	x0, x20
	bl	BsShow
	mov	w26, w0
	mov	w1, w25
	mov	x0, x20
	bl	BsSkip
	str	w26, [x21, 56]
	ldr	x1, [x21, 8]
	cbz	x1, .L122
	lsl	w26, w26, 1
	mov	x0, x19
	add	w3, w26, 1
	ldr	w2, [x1, w26, uxtw 2]
	ldr	w1, [x1, w3, uxtw 2]
	stp	w2, w1, [x21, 60]
	stp	w1, w2, [x19, 96]
	bl	Real8_CB_SetDimensions
.L143:
	ldr	w25, [x21, 32]
	mov	x0, x20
	mov	w1, w25
	bl	BsShow
	mov	w26, w0
	mov	w1, w25
	mov	x0, x20
	bl	BsSkip
	str	w26, [x21, 40]
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w25, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	strb	w25, [x19, 8]
	b	.L119
	.p2align 3
.L152:
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w21, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 1
	beq	.L155
.L122:
	mov	w19, 0
.L156:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L153:
	add	x21, x19, 8
.L119:
	ldr	w0, [x21, 40]
	mov	w19, 1
	str	w0, [x22]
	ldrb	w0, [x21, 2]
	str	w0, [x23]
	mov	w0, w19
	str	wzr, [x24]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L155:
	ldr	w25, [x19, 40]
	mov	x0, x20
	mov	w1, w25
	bl	BsShow
	mov	w26, w0
	mov	w1, w25
	mov	x0, x20
	bl	BsSkip
	str	w26, [x22]
	ldr	w0, [x19, 40]
	cmp	w0, 11
	bls	.L135
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	mov	w19, w0
	mov	w1, w21
	mov	x0, x20
	bl	BsSkip
	cmp	w19, 1
	bne	.L122
.L135:
	mov	w1, 5
	mov	x0, x20
	bl	BsShow
	mov	w19, w0
	mov	w1, 5
	mov	x0, x20
	bl	BsSkip
	str	w19, [x23]
	cmp	w19, 31
	bgt	.L122
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w19, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	cmp	w19, 1
	bne	.L122
	mov	w1, 2
	mov	x0, x20
	bl	BsShow
	mov	w21, w0
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	str	w21, [x24]
	b	.L142
	.p2align 3
.L154:
	bl	BsShow
	mov	w25, w0
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	str	w25, [x21, 36]
	b	.L124
.L125:
	bl	BsShow
	mov	w25, w0
	mov	w1, 13
	mov	x0, x20
	bl	BsSkip
	ldr	w0, [x21, 44]
	cmp	w0, w25
	bne	.L122
	ldr	w25, [x21, 4]
	cbz	w25, .L147
	mov	w1, w25
	mov	x0, x20
	bl	BsShow
	mov	w26, w0
	mov	w1, w25
	mov	x0, x20
	bl	BsSkip
	ldr	w0, [x21, 56]
	cmp	w0, w26
	bne	.L122
.L147:
	ldr	w25, [x21, 32]
	mov	x0, x20
	mov	w1, w25
	bl	BsShow
	mov	w26, w0
	mov	w1, w25
	mov	x0, x20
	bl	BsSkip
	str	w26, [x21, 40]
	mov	w1, 1
	mov	x0, x20
	bl	BsShow
	mov	w25, w0
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	ldrb	w0, [x19, 8]
	cmp	w0, w25
	beq	.L119
	mov	w19, 0
	b	.L156
	.size	Real8_CB_GetSliceHeader, .-Real8_CB_GetSliceHeader
	.align	3
.LC28:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_CB_GetPictureHeader
	.type	Real8_CB_GetPictureHeader, %function
Real8_CB_GetPictureHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 88]
	cmp	w0, 1
	beq	.L184
	ldr	x3, .LC31
	mov	x2, 152
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	mov	w21, w0
	mov	w1, 24
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 1
	bne	.L176
	mov	x0, x20
	add	x1, x29, 60
	bl	Real8_CB_GetVLCBits
	cmp	w0, 30
	bls	.L176
	ldr	w0, [x29, 60]
	tbnz	x0, 0, .L176
	tbz	x0, 1, .L185
	stp	wzr, wzr, [x19, 96]
.L169:
	ubfx	x1, x0, 2, 5
	ubfx	x0, x0, 7, 8
	str	w1, [x19, 132]
	add	x1, x29, 60
	str	w0, [x19, 120]
	mov	x0, x20
	bl	Real8_CB_GetVLCBits
	cmp	w0, 1
	beq	.L180
	cmp	w0, 3
	beq	.L186
	cmp	w0, 5
	bne	.L176
	ldr	w0, [x29, 60]
	cbnz	w0, .L176
	mov	w0, 2
.L180:
	str	w0, [x19, 92]
.L171:
	ldr	w0, [x19, 100]
	cbz	w0, .L187
.L173:
	sub	w0, w0, #48
	mov	w1, 8144
	cmp	w0, w1
	bhi	.L176
.L183:
	ldr	w0, [x19, 96]
	sub	w0, w0, #48
	cmp	w0, w1
	bhi	.L176
	mov	x0, x19
	bl	Real8_CB_SetDimensions
	mov	w0, 1
.L159:
	ldp	w2, w1, [x19, 96]
	add	w1, w1, 15
	add	w2, w2, 15
	lsr	w2, w2, 4
	lsr	w1, w1, 4
	stp	w2, w1, [x19, 104]
	mul	w1, w1, w2
	str	w1, [x19, 112]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L185:
	mov	w2, 176
	mov	w1, 144
	stp	w1, w2, [x19, 96]
	b	.L169
	.p2align 3
.L186:
	ldr	w0, [x29, 60]
	cmp	w0, 1
	beq	.L188
.L176:
	mov	w0, -2
.L190:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L184:
	add	x21, x19, 8
	mov	w0, -1
	mov	x5, x19
	add	x4, x29, 60
	add	x3, x29, 52
	add	x2, x29, 56
	str	w0, [x21, 40]
	mov	w1, 0
	mov	x0, x20
	bl	Real8_CB_GetSliceHeader
	cmp	w0, 1
	mov	w0, -2
	bne	.L159
	ldr	w0, [x21, 36]
	cmp	w0, 3
	bls	.L189
.L160:
	ldrb	w1, [x19, 8]
	str	w1, [x19, 124]
	mov	w1, 8144
	ldr	w0, [x19, 100]
	ldrb	w2, [x21, 1]
	str	w2, [x19, 128]
	sub	w0, w0, #48
	cmp	w0, w1
	ldrb	w0, [x21, 2]
	str	w0, [x19, 132]
	ldr	w0, [x21, 44]
	str	w0, [x19, 120]
	ldr	w0, [x21, 48]
	str	w0, [x19, 140]
	ldr	w0, [x21, 52]
	str	w0, [x19, 144]
	bls	.L183
	mov	w0, -2
	b	.L190
	.p2align 3
.L187:
	mov	x1, x19
	mov	x0, x20
	bl	Real8_CB_GetCPFMT
	cbz	w0, .L176
	ldr	w0, [x19, 100]
	b	.L173
	.p2align 3
.L189:
	ldr	x1, .LC30
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx162
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx162:
	.section	.rodata
	.align	0
	.align	2
.L162:
	.byte	(.L161 - .Lrtx162) / 4
	.byte	(.L163 - .Lrtx162) / 4
	.byte	(.L164 - .Lrtx162) / 4
	.byte	(.L165 - .Lrtx162) / 4
	.text
	.p2align 3
.L188:
	str	wzr, [x19, 92]
	b	.L171
.L164:
	mov	w0, 1
	str	w0, [x19, 92]
	b	.L160
.L163:
	str	wzr, [x19, 92]
	str	wzr, [x21, 20]
	b	.L160
.L161:
	str	wzr, [x19, 92]
	mov	w0, 1
	str	w0, [x21, 20]
	b	.L160
.L165:
	mov	w0, 2
	str	w0, [x19, 92]
	b	.L160
	.size	Real8_CB_GetPictureHeader, .-Real8_CB_GetPictureHeader
	.align	3
.LC30:
	.xword	.L162
	.align	3
.LC31:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_SetImgFormat
	.type	Real8_SetImgFormat, %function
Real8_SetImgFormat:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 53248
	bl	_mcount
	mov	x1, 56440
	add	x1, x21, x1
	ldr	w0, [x20, 3864]
	ldr	w1, [x1, 8]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L191
	ldrb	w2, [x0, 124]
	mov	w5, 5
	ldrb	w0, [x0, 125]
	mov	w4, 1
	ldr	w1, [x20, 1916]
	and	w0, w0, -4
	bfi	w2, w1, 0, 2
	orr	w0, w0, 12
	and	w2, w2, -29
	bfi	w0, w4, 4, 2
	bfi	w2, w5, 5, 3
	strb	w0, [x19, 125]
	strb	w2, [x19, 124]
	ldr	w0, [x19, 124]
	and	w0, w0, -114689
	str	w0, [x19, 124]
	ldr	w0, [x20, 1924]
	cmp	w0, 1920
	ldrb	w0, [x19, 126]
	bls	.L201
	and	w0, w0, -3
	strb	w0, [x19, 126]
	ldr	x2, [x21]
	ldr	w2, [x2, 632]
	cmp	w2, 1
	beq	.L202
.L195:
	and	w0, w0, -5
	strb	w0, [x19, 126]
.L196:
	and	w0, w1, 3
	str	w0, [x19, 120]
	stp	wzr, w0, [x19, 112]
	mov	w1, 0
	mov	x0, x19
	ldr	w2, [x20, 1924]
	str	w2, [x19, 128]
	ldr	w2, [x20, 1920]
	str	w2, [x19, 132]
	bl	SetAspectRatio
	ldr	x0, [x21]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L203
.L197:
	mov	w1, 1
	strb	w1, [x19, 407]
	strb	w1, [x19, 405]
	add	x1, x19, 256
	strb	wzr, [x19, 400]
	mov	w0, 8
	stp	w0, w0, [x1, 156]
	stp	w0, w0, [x1, 164]
.L191:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L201:
	orr	w0, w0, 2
	strb	w0, [x19, 126]
	ldr	x2, [x21]
	ldr	w2, [x2, 632]
	cmp	w2, 1
	bne	.L195
.L202:
	ldrb	w2, [x19, 126]
	tbnz	x2, 1, .L195
	orr	w2, w2, 4
	strb	w2, [x19, 126]
	b	.L196
	.p2align 3
.L203:
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
	b	.L197
	.size	Real8_SetImgFormat, .-Real8_SetImgFormat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RV8_RecordVFMWState
	.type	RV8_RecordVFMWState, %function
RV8_RecordVFMWState:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	RV8_RecordVFMWState, .-RV8_RecordVFMWState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_WriteSliceMsg
	.type	Real8_WriteSliceMsg, %function
Real8_WriteSliceMsg:
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
	ldr	w0, [x1, 2004]
	add	x2, x19, x2, lsl 2
	str	w0, [x2, 100]
	ldr	w0, [x1, 1996]
	str	w0, [x2, 108]
	ldr	w0, [x1, 2000]
	str	w0, [x2, 116]
	ldr	w0, [x1, 2016]
	str	w0, [x2, 104]
	ldr	w0, [x1, 2008]
	str	w0, [x2, 112]
	ldr	w0, [x1, 2012]
	str	w0, [x2, 120]
	ldr	w0, [x1, 1984]
	str	w0, [x2, 124]
	ldr	w0, [x1, 1980]
	str	w0, [x2, 128]
	ldr	w0, [x1, 1976]
	str	w0, [x2, 132]
	ldr	w0, [x1, 1988]
	str	w0, [x2, 136]
	str	w20, [x19, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real8_WriteSliceMsg, .-Real8_WriteSliceMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_WritePicMsg
	.type	Real8_WritePicMsg, %function
Real8_WritePicMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 53248
	mov	x0, 52344
	add	x0, x19, x0
	add	x2, x2, 1824
	ldr	w3, [x2, 92]
	strb	w3, [x19, 28]
	cmp	w3, 2
	ldr	w3, [x2, 108]
	str	w3, [x19, 20]
	ldr	w3, [x2, 104]
	str	w3, [x19, 24]
	ldr	w3, [x0, 4020]
	str	w3, [x19, 32]
	ldr	w3, [x0, 4024]
	str	w3, [x19, 36]
	ldr	w2, [x2, 132]
	str	w2, [x19, 40]
	ldr	w3, [x0, 2924]
	str	w3, [x19, 44]
	ldr	w3, [x0, 2928]
	str	w3, [x19, 48]
	beq	.L206
	str	w2, [x0, 2924]
.L206:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real8_WritePicMsg, .-Real8_WritePicMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_WriteReg
	.type	Real8_WriteReg, %function
Real8_WriteReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	str	w20, [x19, 56]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Real8_WriteReg, .-Real8_WriteReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Real8_ModifySliceMsg
	.type	Real8_ModifySliceMsg, %function
Real8_ModifySliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16
	ldr	w1, [x0, 136]
	cbnz	w1, .L216
	ldp	w1, w4, [x0, 4]
	ldr	w5, [x0, 36]
	mul	w4, w1, w4
	cmp	w5, 2
	sub	w4, w4, #1
	bhi	.L238
.L215:
	cmp	w5, 1
	bls	.L220
	sub	w7, w5, #1
	mov	w3, 0
	b	.L221
	.p2align 3
.L222:
	add	w3, w3, 1
	lsl	x1, x1, 2
	sub	x1, x1, x2
	sxtw	x6, w3
	lsl	x2, x6, 2
	add	x1, x0, x1, lsl 2
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	ldr	w6, [x1, 136]
	add	x1, x0, x2, lsl 2
	ldr	w1, [x1, 136]
	cmp	w6, w1
	bge	.L216
.L221:
	sxtw	x2, w3
	cmp	w3, w7
	lsl	x1, x2, 2
	sub	x1, x1, x2
	bne	.L222
	uxtw	x3, w3
	lsl	x1, x3, 2
	sub	x1, x1, x3
	lsl	x1, x1, 2
	sub	x3, x1, x3
	add	x3, x0, x3, lsl 2
	ldr	w1, [x3, 136]
	cmp	w4, w1
	ccmp	w1, wzr, 4, ge
	ble	.L216
.L220:
	cbz	w5, .L223
	sub	w9, w5, #1
	mov	w8, 0
	mov	x10, 44
	b	.L226
	.p2align 3
.L241:
	beq	.L239
.L226:
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
	beq	.L240
	sub	x3, x3, x6
	add	x2, x0, x2, lsl 2
	add	x3, x0, x3, lsl 2
	ldr	w3, [x3, 136]
	sub	w3, w3, #1
	str	w3, [x2, 140]
.L225:
	lsl	x1, x7, 2
	add	w8, w8, 1
	sub	x1, x1, x7
	lsl	x1, x1, 2
	sub	x1, x1, x7
	add	x1, x0, x1, lsl 2
	ldr	w2, [x1, 136]
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
	cbz	w1, .L241
	.p2align 2
.L216:
	mov	w0, 0
.L236:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L238:
	ldr	w1, [x0, 180]
	sub	w6, w5, #1
	mov	w2, 1
	cmp	w4, w1
	ccmp	w1, wzr, 4, gt
	bgt	.L218
	b	.L216
	.p2align 3
.L219:
	sub	x1, x1, x3
	lsl	x1, x1, 2
	sub	x1, x1, x3
	add	x1, x0, x1, lsl 2
	ldr	w1, [x1, 136]
	cmp	w1, wzr
	ccmp	w4, w1, 4, gt
	ble	.L216
.L218:
	add	w2, w2, 1
	cmp	w2, w6
	sxtw	x3, w2
	lsl	x1, x3, 2
	bne	.L219
	b	.L215
.L239:
	ldr	w3, [x0, 100]
	mov	w6, 0
	mov	x4, 0
	mov	w2, w3
	b	.L229
	.p2align 3
.L242:
	ldr	w2, [x2, 100]
.L229:
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
	ldr	w7, [x1, 104]
	add	x2, x0, x2, lsl 2
	cmp	w7, w3
	bcs	.L227
	ldr	w1, [x1, 120]
	cmp	w1, wzr
	csel	w3, w3, w7, eq
.L227:
	cmp	w6, w5
	bne	.L242
	and	w3, w3, -16
	mov	w6, 0
	str	w3, [x0, 44]
	b	.L233
	.p2align 3
.L243:
	ldr	w2, [x1, 108]
	ldr	w7, [x1, 100]
	mov	x4, x2
	add	w2, w7, w2, lsr 3
	and	w4, w4, 7
	sub	w3, w2, w3
	ubfiz	w2, w3, 3, 4
	and	w3, w3, -16
	add	w2, w2, w4
	str	w3, [x1, 100]
	str	w2, [x1, 108]
.L231:
	add	w6, w6, 1
	cmp	w5, w6
	bls	.L232
	ldr	w3, [x0, 44]
.L233:
	sxtw	x2, w6
	lsl	x1, x2, 2
	sub	x1, x1, x2
	lsl	x1, x1, 2
	sub	x1, x1, x2
	add	x1, x0, x1, lsl 2
	ldr	w2, [x1, 104]
	cbz	w2, .L243
	ldp	w4, w2, [x1, 108]
	ldp	w10, w9, [x1, 100]
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
	stp	w4, w3, [x1, 100]
	stp	w7, w2, [x1, 108]
	b	.L231
.L223:
	ldr	w1, [x0, 100]
	and	w1, w1, -16
	str	w1, [x0, 44]
.L232:
	mov	w0, 1
	b	.L236
.L240:
	madd	x1, x7, x10, x0
	mov	w3, w4
	str	w4, [x1, 140]
	b	.L225
	.size	Real8_ModifySliceMsg, .-Real8_ModifySliceMsg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_Init
	.type	REAL8DEC_Init, %function
REAL8DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	add	x19, x20, 53248
	bl	_mcount
	ldr	x3, .LC32
	mov	x2, 57128
	mov	w1, 0
	mov	x0, x20
	ldr	w22, [x19, 3856]
	ldr	x3, [x3, 96]
	blr	x3
	str	w22, [x19, 3856]
	add	x0, x19, 3256
	bl	ResetVoQueue
	str	x21, [x20]
	add	x1, x20, 8192
	mov	w5, 15
	add	x1, x1, 3192
	mov	w2, 1
	add	x4, x1, 40960
	mov	w6, 8192
	mov	x0, x20
	str	w5, [x4, 2924]
	str	w5, [x4, 2928]
	ldr	w4, [x21, 8]
	strb	w4, [x1, 18]
	strb	wzr, [x1, 20]
	strb	w2, [x19, 1824]
	str	w2, [x19, 1912]
	str	w6, [x19, 1940]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 3864]
	beq	.L247
	mov	w0, 0
.L245:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L247:
	ldr	x1, .LC34
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L245
	.size	REAL8DEC_Init, .-REAL8DEC_Init
	.align	3
.LC32:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_Destroy
	.type	REAL8DEC_Destroy, %function
REAL8DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, 52344
	ldr	x1, .LC36
	add	x2, x19, x0
	mov	w0, 2
	ldr	w2, [x2, 3996]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL8DEC_Destroy, .-REAL8DEC_Destroy
	.align	3
.LC36:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_Decode
	.type	REAL8DEC_Decode, %function
REAL8DEC_Decode:
	stp	x29, x30, [sp, -416]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	add	x22, x20, 53248
	bl	_mcount
	add	x24, x20, 16
	add	x5, x29, 264
	add	x0, x29, 328
	add	x8, x29, 256
	ldr	w3, [x22, 1892]
	ldr	w2, [x22, 1896]
	mov	w4, 8192
	stp	xzr, xzr, [x5]
	add	x5, x29, 280
	str	w3, [x22, 1900]
	stp	xzr, xzr, [x0]
	add	x0, x29, 344
	str	w2, [x22, 1904]
	stp	xzr, xzr, [x5]
	add	x5, x29, 296
	str	w4, [x22, 1940]
	stp	xzr, xzr, [x0]
	add	x0, x29, 376
	stp	xzr, xzr, [x5]
	add	x5, x29, 312
	stp	xzr, xzr, [x0]
	mov	w0, 1
	str	w0, [x22, 1912]
	stp	xzr, xzr, [x5]
	add	x5, x29, 360
	stp	xzr, xzr, [x5]
	add	x5, x29, 392
	stp	xzr, xzr, [x5]
	add	x5, x29, 200
	stp	xzr, xzr, [x5]
	add	x5, x29, 216
	stp	xzr, xzr, [x5]
	add	x5, x29, 232
	stp	xzr, xzr, [x5]
	add	x5, x29, 248
	stp	xzr, xzr, [x5]
	stp	w3, w2, [x8, 76]
	stp	w3, w2, [x8, 84]
	str	w0, [x29, 352]
	str	w4, [x29, 380]
	str	xzr, [x29, 408]
	cbz	x19, .L380
	ldr	x26, .LC41
	mov	w1, 0
	mov	x2, 11364
	mov	x0, x24
	add	x23, x20, 8192
	ldr	x3, [x26, 96]
	blr	x3
	add	x1, x23, 3192
	add	x0, x1, 40960
	str	wzr, [x0, 3960]
	ldr	w2, [x19, 20]
	str	w2, [x0, 3980]
	ldr	w2, [x19, 16]
	str	w2, [x0, 3964]
	ldr	x2, [x19]
	str	x2, [x20, 11384]
	ldr	w2, [x19, 20]
	str	w2, [x0, 3968]
	ldrb	w3, [x19, 10]
	strb	w3, [x1, 16]
	ldrb	w3, [x19, 10]
	cmp	w3, 1
	beq	.L252
	ldr	w3, [x19, 104]
	str	w3, [x0, 3972]
	ldr	x3, [x19, 88]
	str	x3, [x1, 8]
	ldr	w3, [x19, 108]
	str	w3, [x0, 3976]
	ldrb	w0, [x19, 98]
	strb	w0, [x1, 17]
	ldrb	w0, [x19, 98]
	cmp	w0, 1
	bne	.L381
	mov	w0, 65460
	sub	w1, w2, #75
	movk	w0, 0x2f, lsl 16
	cmp	w1, w0
	bhi	.L255
.L254:
	ldr	x1, [x20, 11384]
	cbz	x1, .L255
	add	x19, x22, 3216
	mov	x0, x19
	bl	BsInit
	mov	w1, 8
	mov	x0, x19
	bl	BsShow
	mov	w21, w0
	mov	w1, 8
	mov	x0, x19
	str	w21, [x29, 120]
	bl	BsSkip
	cmp	w21, 8
	bhi	.L255
	mov	x25, 0
	add	x21, x29, 200
	.p2align 2
.L256:
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	mov	w27, w0
	mov	w1, 32
	mov	x0, x19
	rev	w27, w27
	bl	BsSkip
	str	w27, [x21, x25]
	add	x25, x25, 4
	cmp	x25, 64
	bne	.L256
	mov	w1, 8
	mov	x0, x19
	bl	BsShow
	mov	w25, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	add	w0, w25, 1
	cmp	w25, 255
	add	x25, x23, 3192
	mov	w2, w0
	add	x27, x25, 40960
	str	w0, [x27, 2932]
	bhi	.L255
	cbz	w0, .L257
	stp	x27, x25, [x29, 128]
	mov	w28, 3145727
	mov	w27, 0
	b	.L258
	.p2align 3
.L382:
	ldr	x0, [x29, 128]
	ldr	w2, [x0, 2932]
	cmp	w2, w27
	bls	.L257
.L258:
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	mov	w25, w0
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
	uxtw	x1, w27
	ldr	x2, [x29, 136]
	add	x1, x1, 8192
	rev	w0, w25
	cmp	w0, w28
	add	w27, w27, 1
	add	x1, x2, x1, lsl 2
	str	w0, [x1, 11128]
	ble	.L382
	.p2align 2
.L255:
	mov	w25, 0
.L369:
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L381:
	ldr	w1, [x19, 24]
	mov	w25, 0
	ldr	w0, [x22, 3864]
	bl	SM_ReleaseStreamSeg
	ldr	w1, [x19, 112]
	ldr	w0, [x22, 3864]
	bl	SM_ReleaseStreamSeg
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L252:
	str	wzr, [x0, 3972]
	str	xzr, [x1, 8]
	str	wzr, [x0, 3976]
	mov	w0, 65460
	strb	wzr, [x1, 17]
	movk	w0, 0x2f, lsl 16
	sub	w1, w2, #75
	cmp	w1, w0
	bls	.L254
	b	.L255
	.p2align 3
.L380:
	mov	x2, 52344
	ldr	x1, .LC40
	add	x20, x20, x2
	mov	w25, 0
	ldr	w2, [x20, 3996]
	bl	dprint_vfmw
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
	ret
	.p2align 3
.L257:
	add	x3, x22, 2032
	sub	w5, w2, #1
	mov	w1, 0
	add	x6, x23, 3192
	b	.L259
	.p2align 3
.L260:
	add	x0, x0, 8192
	ldr	w4, [x3], 4
	add	x0, x6, x0, lsl 2
	ldr	w0, [x0, 11128]
	cmp	w0, w4
	ble	.L255
.L259:
	cmp	w1, w5
	add	w0, w1, 1
	mov	x1, x0
	bne	.L260
	lsl	w2, w2, 3
	add	x28, x23, 3192
	add	w0, w2, 66
	mov	w2, 65461
	mov	w4, w0
	add	x0, x28, 40960
	movk	w2, 0x2f, lsl 16
	mov	w1, 3145727
	str	w4, [x29, 136]
	ldr	w27, [x0, 2936]
	add	w27, w4, w27
	sub	w3, w27, #74
	cmp	w3, w2
	ccmp	w4, w1, 0, ls
	bgt	.L255
	ldr	w2, [x0, 3968]
	sub	w2, w2, w27
	cmp	w2, wzr
	ble	.L255
	ldr	x1, [x20, 11384]
	mov	x0, x19
	add	x1, x1, x27, sxtw
	bl	BsInit
	str	x21, [x29, 280]
	ldr	w0, [x29, 120]
	add	x1, x29, 416
	ldr	x3, .LC42
	str	w0, [x29, 288]
	add	x2, x1, x0, uxtw 2
	add	x3, x3, 448
	ldr	w0, [x3, 32]
	add	x1, x29, 264
	str	w0, [x29, 192]
	mov	x0, x19
	ldp	x4, x5, [x3]
	stp	x4, x5, [x29, 160]
	ldp	x4, x5, [x3, 16]
	stp	x4, x5, [x29, 176]
	ldr	w2, [x2, -256]
	str	w2, [x29, 276]
	bl	Real8_CB_GetPictureHeader
	cmp	w0, 1
	mov	w25, w0
	bne	.L383
	ldrb	w0, [x28, 20]
	cbnz	w0, .L262
	ldr	x21, .LC45
	ldr	x4, [x21]
	cbz	x4, .L263
	ldr	w0, [x22, 1928]
	mov	w3, 8
	ldr	w1, [x29, 372]
	add	x2, x29, 160
	strh	w0, [x29, 162]
	ldr	w0, [x29, 368]
	strh	w1, [x29, 164]
	strh	w0, [x29, 166]
	ldr	w1, [x22, 1932]
	ldr	w0, [x22, 3864]
	strh	w1, [x29, 160]
	mov	w1, 2
	blr	x4
.L263:
	ldr	w0, [x22, 3864]
	bl	FSP_GetFspType
	cbnz	w0, .L264
	ldr	w0, [x22, 3864]
	add	x2, x29, 156
	add	x3, x29, 160
	add	x1, x29, 152
	stp	wzr, wzr, [x29, 152]
	str	wzr, [x29, 160]
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x20]
	ldr	w2, [x0, 748]
	cmp	w2, 1
	beq	.L384
.L264:
	add	x4, x23, 3192
	ldr	w0, [x22, 3864]
	add	x28, x4, 45056
	mov	w2, 1
	str	x4, [x29, 128]
	add	x21, x22, 3256
	ldr	w1, [x28, 4]
	bl	FSP_ClearLogicFs
	ldr	w1, [x28]
	mov	w2, 1
	ldr	w0, [x22, 3864]
	bl	FSP_ClearLogicFs
	stp	wzr, wzr, [x28]
	ldr	w0, [x22, 3864]
	bl	FSP_GetNullLogicFs
	ldr	x4, [x29, 128]
	mov	x1, x21
	stp	w0, w0, [x28]
	strb	wzr, [x4, 23]
	ldr	w0, [x22, 3864]
	bl	FSP_ClearNotInVoQueue
	ldr	w2, [x29, 372]
	ldr	w3, [x29, 368]
	cmp	w2, 512
	ldr	x4, [x29, 128]
	bhi	.L271
	ldr	w0, [x29, 368]
	cmp	w0, 512
	mov	w3, w0
	bhi	.L271
	ldr	x1, [x20]
	ldr	w3, [x1, 748]
	cbnz	w3, .L273
	ldr	w1, [x1, 28]
	cmp	w1, 25
	beq	.L385
.L273:
	ldr	w0, [x22, 3864]
	bl	FSP_GetFspType
	cbz	w0, .L370
.L373:
	ldr	w0, [x29, 368]
	ldr	w2, [x29, 372]
.L275:
	ldr	x1, .LC51
	mov	w3, w0
	mov	w0, 1
	bl	dprint_vfmw
	add	x2, x29, 264
	mov	x1, x20
	mov	w0, 6
	bl	Real8_ArrangeVHBMem
	cbz	w0, .L386
.L262:
	ldr	x3, [x26, 104]
	add	x0, x22, 1824
	add	x1, x29, 264
	mov	x2, 152
	str	x0, [x29, 120]
	add	x21, x23, 3192
	blr	x3
	ldr	x0, [x20]
	ldr	w0, [x0, 8]
	strb	w0, [x23, 3210]
	mov	x0, x20
	bl	Real8_GetImageBuffer
	cbz	w0, .L387
	add	x26, x21, 45056
	ldr	w0, [x22, 3864]
	ldr	w1, [x26, 8]
	bl	FSP_GetFsImagePtr
	mov	x2, x0
	cbz	x0, .L278
	ldr	x0, [x20]
	mov	x4, -1
	ldr	x1, .LC57
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
	ldr	x0, [x29, 120]
	ldr	w0, [x0, 92]
	cmp	w0, 2
	beq	.L388
	cmp	w0, 1
	beq	.L389
	ldrb	w0, [x21, 23]
	cmp	w0, wzr
	mov	w0, 2
	csinc	w0, w0, wzr, ne
.L282:
	add	x21, x23, 3192
	strb	w0, [x23, 3215]
	add	x21, x21, 45056
	ldp	w2, w0, [x21]
	cmp	w2, w0
	beq	.L283
	ldr	x1, .LC59
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w1, [x21]
	mov	w2, 0
	ldr	w0, [x22, 3864]
	bl	FSP_SetRef
.L283:
	add	x26, x23, 3192
	mov	w2, 1
	add	x21, x26, 45056
	ldp	w0, w1, [x21, 4]
	stp	w0, w1, [x21]
	ldr	w0, [x22, 3864]
	bl	FSP_SetRef
	ldr	w1, [x21]
	ldr	w0, [x22, 3864]
	bl	FSP_RemovePmv
	ldr	x1, .LC61
	mov	w0, 13
	ldr	w2, [x21, 8]
	bl	dprint_vfmw
	ldrb	w0, [x23, 3210]
	cmp	w0, 4
	bne	.L285
	ldr	w0, [x22, 1916]
	cbnz	w0, .L288
	str	wzr, [x21, 16]
.L285:
	add	x26, x23, 3192
	ldr	w0, [x22, 3864]
	add	x26, x26, 45056
	ldr	w1, [x26, 8]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	w1, [x26]
	ldr	w0, [x22, 3864]
	bl	FSP_GetLogicFs
	mov	x28, x0
	ldr	w1, [x26, 4]
	ldr	w0, [x22, 3864]
	bl	FSP_GetLogicFs
	mov	x26, x0
	cmp	x21, xzr
	ccmp	x28, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L390
	ldr	x0, [x21, 680]
	cbz	x0, .L292
	ldr	x1, [x21, 696]
	cbz	x1, .L292
	ldr	x1, [x21, 688]
	cbz	x1, .L292
	ldr	x1, [x26, 680]
	cbz	x1, .L294
	ldr	w5, [x1, 16]
.L295:
	str	w5, [x24, 48]
	ldr	x0, [x28, 680]
	cbz	x0, .L391
.L374:
	ldr	w4, [x0, 16]
	str	w4, [x24, 52]
	ldr	x1, .LC68
	ldr	x0, [x21, 680]
	ldr	w2, [x0, 16]
	mov	w0, 13
	str	w2, [x24, 56]
	ldr	w6, [x21, 704]
	str	w6, [x24, 72]
	ldr	w7, [x26, 704]
	str	w7, [x24, 76]
	ldr	x3, [x21, 688]
	ldr	w3, [x3, 16]
	str	w3, [x24, 60]
	bl	dprint_vfmw
	ldr	x0, [x21, 688]
	ldr	w0, [x0, 32]
	str	w0, [x24, 64]
	ldr	x0, [x21, 688]
	ldr	w0, [x0, 76]
	str	w0, [x24, 88]
	ldr	x0, [x21, 688]
	ldr	w0, [x0, 60]
	str	w0, [x24, 92]
	ldr	x0, [x21, 688]
	ldr	w0, [x0, 64]
	str	w0, [x24, 96]
	ldr	w0, [x22, 1916]
	cmp	w0, 2
	beq	.L392
.L298:
	ldr	w0, [x22, 1944]
	str	w0, [x21, 712]
	add	x0, x23, 3192
	add	x0, x0, 40960
	ldr	w2, [x22, 1916]
	ldr	w3, [x22, 1956]
	strb	w2, [x24, 12]
	cmp	w2, 2
	str	w3, [x29, 128]
	ldr	w2, [x22, 1932]
	str	w2, [x24, 4]
	ldr	w1, [x22, 1928]
	str	w1, [x24, 8]
	ldr	w1, [x0, 4020]
	str	w1, [x24, 16]
	ldr	w1, [x0, 4024]
	stp	w1, w3, [x24, 20]
	ldr	w1, [x0, 2924]
	str	w1, [x24, 28]
	ldr	w1, [x0, 2928]
	str	w1, [x24, 32]
	beq	.L303
	str	w3, [x0, 2924]
.L303:
	mov	x0, x19
	bl	BsPos
	and	w1, w0, -2147483641
	add	x2, x22, 1976
	tbnz	w0, #31, .L393
.L304:
	str	w1, [x2, 20]
	add	x1, x23, 3192
	add	x1, x1, 40960
	ldr	w0, [x1, 2932]
	cmp	w0, 1
	beq	.L394
	ldr	w21, [x1, 2936]
	ldr	w0, [x1, 2940]
.L375:
	sub	w21, w0, w21
	mov	x0, x19
	lsl	w21, w21, 3
	bl	BsPos
	sub	w0, w21, w0
	add	x21, x23, 3192
	str	w0, [x22, 2000]
	add	x26, x21, 40960
	mov	x0, x19
	ldr	w1, [x26, 3964]
	add	w27, w27, w1
	bl	BsPos
	add	x5, x22, 1792
	mov	w1, 8
	add	x6, x22, 1792
	ldr	w2, [x22, 1952]
	ldr	w3, [x22, 1960]
	mov	w7, 1
	sdiv	w0, w0, w1
	ldr	w4, [x29, 128]
	stp	w4, w3, [x5, 184]
	stp	w2, wzr, [x5, 192]
	stp	wzr, wzr, [x6, 220]
	add	w0, w0, w27
	stp	w0, wzr, [x6, 212]
	str	w0, [x24, 100]
	ldr	w0, [x22, 1996]
	str	w0, [x24, 108]
	ldr	w0, [x22, 2000]
	stp	wzr, w0, [x24, 112]
	str	w7, [x24, 36]
	str	wzr, [x24, 104]
	stp	wzr, w2, [x24, 120]
	stp	w3, w4, [x24, 128]
	str	wzr, [x24, 136]
	ldr	w0, [x26, 2932]
	cmp	w0, w7
	bls	.L326
	ldr	w0, [x29, 136]
	ldr	w6, [x26, 2940]
	add	w28, w0, w6
	mov	w0, 3145727
	cmp	w28, w0
	bgt	.L312
	cmp	w28, 73
	ble	.L312
	ldr	w2, [x26, 3968]
	sub	w2, w2, w28
	cmp	w2, wzr
	ble	.L312
	mov	w27, w7
	stp	w0, w7, [x29, 112]
	b	.L315
	.p2align 3
.L316:
	ldr	w0, [x26, 2932]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L326
	uxtw	x0, w27
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 2
	ldr	w6, [x0, 11128]
	ldr	w0, [x29, 136]
	add	w28, w0, w6
	ldr	w0, [x29, 112]
	cmp	w28, w0
	bgt	.L312
	cmp	w28, 73
	ble	.L312
	ldr	w2, [x26, 3968]
	sub	w2, w2, w28
	cmp	w2, wzr
	ble	.L312
.L315:
	ldr	x1, [x21]
	mov	x0, x19
	add	x1, x1, x28, sxtw
	bl	BsInit
	ldr	x5, [x29, 120]
	add	x2, x29, 152
	add	x4, x29, 160
	add	x3, x29, 156
	mov	w1, 0
	mov	x0, x19
	bl	Real8_CB_GetSliceHeader
	cmp	w0, 1
	mov	w2, w0
	bne	.L316
	ldr	w1, [x29, 152]
	ldr	w0, [x22, 1932]
	str	w1, [x29, 108]
	cbz	w0, .L395
	ldr	w0, [x29, 160]
	ldr	w1, [x29, 128]
	cmp	w0, wzr
	csel	w0, w1, w0, lt
	str	w0, [x29, 128]
	mov	x0, x19
	bl	BsPos
	asr	w1, w0, 31
	lsr	w1, w1, 29
	add	w0, w0, w1
	and	w0, w0, 7
	sub	w0, w0, w1
	str	w0, [x22, 1996]
	add	x0, x22, 1976
	str	x0, [x29, 96]
	ldr	w0, [x26, 2932]
	sub	w0, w0, #1
	cmp	w0, w27
	beq	.L396
	cmp	w27, 254
	bhi	.L397
	add	w0, w27, 1
	uxtw	x1, w27
	add	x0, x0, 8192
	add	x1, x1, 8192
	add	x0, x21, x0, lsl 2
	add	x1, x21, x1, lsl 2
	ldr	w0, [x0, 11128]
	ldr	w1, [x1, 11128]
.L376:
	sub	w1, w0, w1
	mov	x0, x19
	lsl	w1, w1, 3
	str	w1, [x29, 96]
	bl	BsPos
	ldr	w1, [x29, 96]
	sub	w0, w1, w0
	str	w0, [x22, 2000]
	mov	x0, x19
	ldr	w2, [x26, 3964]
	add	w28, w28, w2
	bl	BsPos
	cmp	w0, wzr
	add	w3, w0, 7
	ldr	w4, [x29, 108]
	csel	w0, w3, w0, lt
	str	w4, [x22, 1988]
	add	w2, w28, w0, asr 3
	ldr	w0, [x29, 128]
	str	w0, [x22, 1976]
	add	x0, x22, 1792
	stp	w2, wzr, [x0, 212]
	stp	wzr, wzr, [x0, 220]
	ldr	w0, [x29, 116]
	sxtw	x3, w0
	add	w0, w0, 1
	mov	w5, w0
	cmp	w0, 131
	lsl	x0, x3, 2
	str	w5, [x29, 116]
	sub	x0, x0, x3
	lsl	x0, x0, 2
	sub	x0, x0, x3
	ldr	w3, [x22, 1960]
	str	w3, [x22, 1980]
	add	x0, x24, x0, lsl 2
	ldr	w3, [x22, 1952]
	str	w3, [x22, 1984]
	str	w2, [x0, 100]
	ldr	w2, [x22, 1996]
	str	w2, [x0, 108]
	ldr	w2, [x22, 2000]
	str	w2, [x0, 116]
	ldr	w2, [x22, 2016]
	str	w2, [x0, 104]
	ldr	w2, [x22, 2008]
	str	w2, [x0, 112]
	ldr	w2, [x22, 2012]
	str	w2, [x0, 120]
	ldr	w2, [x22, 1984]
	str	w2, [x0, 124]
	ldr	w2, [x22, 1980]
	str	w2, [x0, 128]
	ldr	w2, [x22, 1976]
	str	w2, [x0, 132]
	ldr	w1, [x22, 1988]
	str	w1, [x0, 136]
	str	w5, [x24, 36]
	ble	.L316
	mov	x0, x20
	bl	Real8_ModifySliceMsg
	cmp	w0, 1
	bne	.L398
	str	x24, [x20, 8]
	cbz	x24, .L399
	ldr	x0, [x20]
	ldr	w1, [x0, 904]
	cmp	w1, 1
	beq	.L400
	cmp	w1, 2
	bne	.L316
	ldr	w0, [x0, 908]
	cmp	w0, wzr
	ble	.L316
	ldrb	w0, [x24, 12]
	cmp	w0, 2
	bne	.L316
	str	xzr, [x20, 8]
	mov	w2, 0
	mov	w25, 0
	ldr	w1, [x22, 3200]
	ldr	w0, [x22, 3864]
	bl	FSP_SetDisplay
	ldr	x3, [x20]
	mov	x1, x20
	mov	w0, 8
	ldr	w2, [x3, 908]
	sub	w2, w2, #1
	str	w2, [x3, 908]
	bl	ReleasePacket
	b	.L369
	.p2align 3
.L383:
	ldr	x1, .LC44
	mov	w0, 1
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L271:
	ldr	x1, .LC49
	mov	w0, 18
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L387:
	add	x21, x21, 40960
	ldr	x1, .LC55
	mov	w25, 0
	ldr	w2, [x21, 3996]
	bl	dprint_vfmw
	b	.L369
.L386:
	ldr	x1, .LC53
	mov	w0, 1
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L388:
	ldrb	w0, [x21, 23]
	cmp	w0, 1
	bls	.L312
	ldrb	w0, [x21, 18]
	cmp	w0, 4
	bne	.L285
.L328:
	add	x0, x23, 3192
	add	x0, x0, 45056
	ldr	w1, [x0, 16]
	cbnz	w1, .L285
	ldr	w1, [x0, 8]
	mov	w2, 1
	ldr	w0, [x22, 3864]
	mov	w25, 0
	bl	FSP_ClearLogicFs
	b	.L369
.L389:
	ldrb	w1, [x21, 23]
	mov	w0, 2
	cbnz	w1, .L282
.L312:
	add	x1, x23, 3192
	ldr	w0, [x22, 3864]
	add	x1, x1, 45056
	mov	w2, 1
	mov	w25, 0
	ldr	w1, [x1, 8]
	bl	FSP_ClearLogicFs
	b	.L369
.L385:
	ldrb	w1, [x4, 20]
	cbnz	w1, .L275
.L370:
	mov	x0, x21
	bl	ResetVoQueue
	b	.L373
.L394:
	ldr	w0, [x1, 3968]
	ldr	w21, [x1, 2936]
	ldr	w1, [x29, 136]
	sub	w0, w0, w1
	b	.L375
.L392:
	ldr	w3, [x28, 712]
	ldr	w1, [x22, 1944]
	ldr	w0, [x26, 712]
	subs	w1, w1, w3
	sub	w0, w0, w3
	bmi	.L401
.L299:
	tbnz	w0, #31, .L402
.L300:
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w0, wzr
	ble	.L332
	sub	w3, w0, w1
	lsl	w4, w1, 14
	lsl	w3, w3, 14
	sdiv	w4, w4, w0
	sdiv	w3, w3, w0
.L302:
	add	x2, x23, 3192
	add	x2, x2, 40960
	add	x7, x2, 3840
	stp	w1, w0, [x7, 172]
	stp	w4, w3, [x7, 180]
	b	.L298
.L292:
	add	x1, x23, 3192
	ldr	w0, [x22, 3864]
	add	x1, x1, 45056
	mov	w2, 1
	mov	w25, 0
	ldr	w1, [x1, 8]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC66
	mov	w0, 0
	bl	dprint_vfmw
	b	.L369
.L390:
	ldr	x2, .LC62
	mov	w3, 2060
	ldr	x1, .LC64
	mov	w0, 22
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L384:
	ldr	w0, [x29, 160]
	cmp	w0, wzr
	bgt	.L267
	ldr	w0, [x29, 156]
	cmp	w0, 32
	bgt	.L267
	ldr	x0, [x20, 8]
	cbnz	x0, .L267
	ldr	w3, [x22, 3088]
	cbz	w3, .L264
	ldr	w4, [x22, 1932]
	cbz	w4, .L264
	ldr	w1, [x22, 3868]
	ldr	w7, [x29, 368]
	cmp	w7, w1
	beq	.L264
	ldr	w1, [x22, 3872]
	ldr	w6, [x29, 372]
	cmp	w6, w1
	beq	.L264
	ldr	x1, .LC47
	mov	w0, w2
	ldr	w5, [x22, 1928]
	bl	dprint_vfmw
	ldr	w0, [x29, 368]
	str	w0, [x22, 3868]
	ldr	x4, [x21]
	ldr	w0, [x29, 372]
	str	w0, [x22, 3872]
	cbz	x4, .L264
	ldr	w0, [x22, 3864]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L264
.L396:
	uxtw	x0, w27
	ldr	w2, [x29, 136]
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 2
	ldr	w1, [x0, 11128]
	ldr	w0, [x26, 3968]
	sub	w0, w0, w2
	b	.L376
.L288:
	cmp	w0, 2
	beq	.L328
	cmp	w0, 1
	bne	.L285
	str	w0, [x21, 16]
	b	.L285
.L332:
	mov	w3, 0
	mov	w4, 0
	b	.L302
.L402:
	ldr	w2, [x22, 1940]
	add	w0, w0, w2
	b	.L300
.L278:
	ldr	w0, [x22, 3864]
	mov	w2, 1
	ldr	w1, [x26, 8]
	mov	w25, 0
	bl	FSP_ClearLogicFs
	b	.L369
.L326:
	mov	w19, 1
	str	w19, [x24, 40]
	ldr	x0, [x20, 8]
	cbz	x0, .L403
.L309:
	ldr	x0, [x20]
	ldr	w1, [x0, 632]
	str	w1, [x20, 96]
	ldr	w0, [x0, 672]
	str	w0, [x20, 100]
	b	.L369
.L391:
	ldr	x0, [x21, 680]
	b	.L374
.L294:
	ldr	w5, [x0, 16]
	b	.L295
.L403:
	mov	x0, x20
	bl	Real8_ModifySliceMsg
	cmp	w0, 1
	bne	.L404
	str	x24, [x20, 8]
	b	.L309
.L267:
	mov	w25, -2
	b	.L369
.L401:
	ldr	w2, [x22, 1940]
	add	w1, w1, w2
	b	.L299
.L393:
	sub	w1, w1, #1
	orr	w1, w1, -8
	add	w1, w1, 1
	b	.L304
.L400:
	ldrb	w0, [x24, 12]
	cmp	w0, 2
	bne	.L316
	str	xzr, [x20, 8]
	mov	w2, 0
	mov	w25, 0
	ldr	w1, [x22, 3200]
	ldr	w0, [x22, 3864]
	bl	FSP_SetDisplay
	mov	x1, x20
	mov	w0, 8
	bl	ReleasePacket
	b	.L369
.L399:
	ldr	x2, .LC62
	mov	w3, 2260
	ldr	x1, .LC72
	mov	w0, 22
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L398:
	add	x21, x21, 45056
	ldr	w0, [x22, 3864]
	mov	w2, 1
	mov	w25, 0
	ldr	w1, [x21, 8]
	bl	FSP_ClearLogicFs
	b	.L369
.L397:
	ldr	x1, .LC70
	mov	w2, 2227
	mov	w0, 22
	mov	w25, 0
	bl	dprint_vfmw
	b	.L369
.L395:
	add	x21, x21, 45056
	ldr	w0, [x22, 3864]
	mov	w25, 0
	ldr	w1, [x21, 8]
	bl	FSP_ClearLogicFs
	b	.L369
.L404:
	add	x1, x23, 3192
	ldr	w0, [x22, 3864]
	add	x1, x1, 45056
	mov	w2, w19
	mov	w25, 0
	ldr	w1, [x1, 8]
	bl	FSP_ClearLogicFs
	b	.L369
	.size	REAL8DEC_Decode, .-REAL8DEC_Decode
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC41:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC42:
	.xword	.LANCHOR0
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	g_event_report
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
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC62:
	.xword	.LANCHOR1
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.align	3
.LC72:
	.xword	.LC71
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_RecycleImage
	.type	REAL8DEC_RecycleImage, %function
REAL8DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L407
	add	x19, x19, 53248
	mov	w2, 0
	mov	w1, w20
	ldr	w0, [x19, 3864]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 3864]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL8DEC_RecycleImage, .-REAL8DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_GetRemainImg
	.type	REAL8DEC_GetRemainImg, %function
REAL8DEC_GetRemainImg:
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
	beq	.L409
	mov	x21, 56440
	add	x20, x19, 53248
	add	x21, x19, x21
	ldr	w0, [x20, 3864]
	ldr	w1, [x21, 4]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L409
	ldr	w0, [x20, 3864]
	ldr	w1, [x21, 4]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L422
.L409:
	add	x22, x20, 3256
.L413:
	mov	x0, x22
	bl	GetVoLastImageID
.L419:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L422:
	mov	x0, x19
	add	x22, x20, 3256
	bl	Real8_SetImgFormat
	mov	w2, 1
	str	w2, [x23, 212]
	ldr	w0, [x20, 3864]
	ldr	w1, [x21, 4]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 3864]
	mov	x4, x23
	mov	x3, x22
	mov	x2, x19
	mov	w1, 8
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L410
	ldr	w0, [x20, 3864]
	mov	w2, 0
	ldr	w1, [x21, 4]
	bl	FSP_SetDisplay
	b	.L413
	.p2align 3
.L410:
	ldr	w0, [x23, 184]
	cmp	w0, 100
	bhi	.L409
	ldr	w0, [x23, 128]
	cmp	w0, 31
	bls	.L409
	ldr	w1, [x23, 132]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L419
	b	.L413
	.size	REAL8DEC_GetRemainImg, .-REAL8DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_VDMPostProc
	.type	REAL8DEC_VDMPostProc, %function
REAL8DEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	w24, w2
	bl	_mcount
	add	x19, x21, 8192
	ldr	x1, .LC75
	mov	w2, w20
	mov	w0, 22
	add	x23, x19, 3192
	add	x22, x21, 53248
	bl	dprint_vfmw
	mov	x1, x21
	mov	w0, 8
	bl	ReleasePacket
	add	x1, x23, 45056
	ldr	w0, [x22, 3864]
	ldr	w1, [x1, 8]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L432
	add	x2, x23, 40960
	ldr	w1, [x2, 2820]
	strb	w1, [x19, 3213]
	cmp	w1, 2
	beq	.L425
	and	w24, w24, 31
	str	w24, [x2, 2928]
.L425:
	tbnz	w20, #31, .L433
	mov	w1, 100
	cmp	w20, w1
	csel	w20, w20, w1, le
.L426:
	ldr	x1, .LC77
	str	w20, [x0, 184]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x21
	bl	Real8_SetImgFormat
	ldrb	w1, [x19, 3210]
	add	x0, x19, 3192
	cmp	w1, 2
	beq	.L429
	ldr	x1, [x21]
	ldr	w1, [x1, 12]
	cmp	w1, 1
	beq	.L429
	add	x1, x0, 40960
	ldr	w1, [x1, 2820]
	cmp	w1, 2
	beq	.L429
	ldrb	w1, [x0, 23]
	cmp	w1, 1
	bls	.L434
	add	x0, x0, 45056
	ldr	w1, [x0]
.L430:
	add	x0, x19, 3192
	cmn	w1, #1
	add	x0, x0, 45056
	str	w1, [x0, 12]
	beq	.L431
.L451:
	add	x20, x19, 3192
	ldr	w0, [x22, 3864]
	add	x20, x20, 45056
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w23, [x20, 12]
	ldr	w0, [x22, 3864]
	mov	w1, w23
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC79
	mov	w2, w23
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w1, [x20, 12]
	mov	w2, 1
	ldr	w0, [x22, 3864]
	bl	FSP_SetDisplay
	ldr	w0, [x22, 3864]
	mov	x4, x24
	add	x3, x22, 3256
	mov	x2, x21
	mov	w1, 8
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L450
.L431:
	add	x19, x19, 3192
	mov	w0, 1
	add	x19, x19, 40960
	ldr	w1, [x19, 3996]
	add	w1, w1, w0
	str	w1, [x19, 3996]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L429:
	add	x0, x19, 3192
	add	x0, x0, 45056
	ldr	w1, [x0, 8]
	str	w1, [x0, 12]
	cmn	w1, #1
	bne	.L451
	b	.L431
	.p2align 3
.L433:
	mov	w20, 0
	b	.L426
	.p2align 3
.L450:
	ldr	w1, [x20, 12]
	mov	w2, 0
	ldr	w0, [x22, 3864]
	bl	FSP_SetDisplay
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L432:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L434:
	mov	w1, -1
	b	.L430
	.size	REAL8DEC_VDMPostProc, .-REAL8DEC_VDMPostProc
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_GetImageBuffer
	.type	REAL8DEC_GetImageBuffer, %function
REAL8DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 53248
	bl	_mcount
	ldr	w0, [x19, 3864]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	mov	w20, w0
	beq	.L453
	ldr	w0, [x19, 3864]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L458
.L453:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L458:
	ldr	w0, [x19, 3864]
	add	x1, x19, 3256
	bl	FSP_ClearNotInVoQueue
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	REAL8DEC_GetImageBuffer, .-REAL8DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	REAL8DEC_Support
	.type	REAL8DEC_Support, %function
REAL8DEC_Support:
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
	.size	REAL8DEC_Support, .-REAL8DEC_Support
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
	.zero	4
.LC2:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
	.word	3
	.zero	4
	.type	s_RVVersionEncodingToMinorVersion, %object
	.size	s_RVVersionEncodingToMinorVersion, 32
s_RVVersionEncodingToMinorVersion:
	.word	2
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.align	3
.LANCHOR1 = . + 0
	.type	__FUNCTION__.12057, %object
	.size	__FUNCTION__.12057, 16
__FUNCTION__.12057:
	.string	"REAL8DEC_Decode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC4:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC6:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC8:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC10:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC12:
	ASCII(.string	"image size abnormal (%dx%d) in MB\n" )
	.zero	5
.LC14:
	ASCII(.string	"real8 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
.LC17:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC33:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC35:
	ASCII(.string	"Decoding quits at frm %d\n" )
	.zero	6
.LC39:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
.LC43:
	ASCII(.string	"Real8_CB_GetPictureHeader Error!\n" )
	.zero	6
.LC46:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC48:
	ASCII(.string	"pic width/height to large,MbWidth = %d, MbHeight = %d" )
	.zero	2
.LC50:
	ASCII(.string	"new seq size %d * %d\n" )
	.zero	2
.LC52:
	ASCII(.string	"Real8_ArrangeVHBMem err\n" )
	.zero	7
.LC54:
	ASCII(.string	"Fatal Error: frm%d, get image buffer failed\n" )
	.zero	3
.LC56:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC58:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC60:
	ASCII(.string	"++++++++++ ref %d\n" )
	.zero	5
.LC63:
	ASCII(.string	"%s %d unknow error!!\n" )
	.zero	2
.LC65:
	ASCII(.string	"CurFsID abnormal!\n" )
	.zero	5
.LC67:
	ASCII(.string	"dec addr: cur,cur2d,fwd,bwd,currpmv,colpmv = %p,%p,%p,%p,%p,%p\n" )
.LC69:
	ASCII(.string	"line:%d! i > (RV8_MAX_SLC_PARAM_NUM - 2)\n" )
	.zero	6
.LC71:
	ASCII(.string	"%s %d NULL == pCtx->pRv8DecParam!!\n" )
	.zero	4
.LC74:
	ASCII(.string	"ErrRatio = %d\n" )
	.zero	1
.LC76:
	ASCII(.string	"DEBUG: DEC over\n" )
	.zero	7
.LC78:
	ASCII(.string	"insert buf %d ref %d\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
