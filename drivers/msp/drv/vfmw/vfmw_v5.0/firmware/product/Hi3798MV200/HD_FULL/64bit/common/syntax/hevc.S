#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"hevc.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 12]
	ldr	w2, [x2, 12]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_SetFrmRepeatCount.part.4, %function
HEVC_SetFrmRepeatCount.part.4:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w3, [x19, 308]
	ldr	w2, [x19, 2712]
	ldr	w0, [x19, 304]
	add	w2, w3, w2
	add	w3, w2, 1
	cmp	w0, w3
	bcc	.L5
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L6
	mov	w0, 2
	str	w0, [x20, 24]
	ldr	w0, [x19, 308]
	add	w0, w0, 2
	str	w0, [x19, 308]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L5:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L6:
	mov	w0, 1
	str	w0, [x20, 24]
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount.part.4, .-HEVC_SetFrmRepeatCount.part.4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	HEVC_Sei_Mastering_Display_Colour_Volume.part.12, %function
HEVC_Sei_Mastering_Display_Colour_Volume.part.12:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	add	x19, x1, 4
	add	x22, x1, 16
	bl	_mcount
.L10:
	add	x19, x19, 4
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	str	w0, [x19, -4]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 8]
	cmp	x19, x22
	bne	.L10
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	str	w0, [x21, 28]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x21, 32]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x21, 36]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x21, 40]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_Sei_Mastering_Display_Colour_Volume.part.12, .-HEVC_Sei_Mastering_Display_Colour_Volume.part.12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitSigLastScan
	.type	HEVC_InitSigLastScan, %function
HEVC_InitSigLastScan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w5
	mov	x20, x4
	bl	_mcount
	cmp	w21, 15
	bgt	.L13
	cmp	w21, 8
	mul	w10, w21, w21
	beq	.L48
	mov	x8, x20
	cbz	w10, .L13
.L19:
	mov	w7, 1
	mov	w1, 0
	mov	w9, 0
	sub	w7, w7, w21
.L23:
	cmp	w21, w9
	mov	w0, w9
	mov	w2, 0
	bgt	.L25
	.p2align 2
.L39:
	sub	w0, w0, #1
	add	w2, w2, 1
	cmp	w21, w0
	ble	.L39
.L25:
	cmp	w0, wzr
	ccmp	w21, w2, 4, ge
	ble	.L21
	madd	w3, w21, w0, w2
	sub	w2, w2, w1
	.p2align 2
.L22:
	str	w3, [x8, w1, uxtw 2]
	sub	w0, w0, #1
	add	w1, w1, 1
	cmp	w0, wzr
	add	w6, w2, w1
	add	w3, w3, w7
	ccmp	w21, w6, 4, ge
	bgt	.L22
.L21:
	cmp	w10, w1
	add	w9, w9, 1
	bhi	.L23
.L13:
	cmp	w21, 4
	ble	.L12
	asr	w14, w21, 2
	add	x0, x19, x14, uxtw
	mul	w16, w14, w14
	ldrsb	w0, [x0, 10]
	add	w0, w0, 1
	cbz	w16, .L12
.L17:
	ldr	x15, .LC3
	sbfiz	x0, x0, 16, 32
	mov	w9, 1
	add	x13, x19, 356
	add	x15, x15, x0
	mov	x12, 0
	sub	w9, w9, w21
.L34:
	cmp	w21, 32
	ldr	w3, [x15, x12, lsl 2]
	beq	.L49
.L27:
	udiv	w2, w3, w14
	lsl	w8, w12, 4
	mov	w10, 0
	mov	w0, 0
	mov	w7, 0
	mov	w1, 0
	madd	w3, w2, w21, w3
	msub	w2, w2, w14, w3
	lsl	w11, w2, 2
	.p2align 2
.L28:
	cmp	w1, wzr
	ccmp	w7, 3, 0, ge
	bgt	.L29
	madd	w2, w21, w1, w7
	sub	w7, w7, w0
	add	w2, w2, w11
	.p2align 2
.L30:
	add	w6, w0, w8
	sub	w1, w1, #1
	add	w0, w0, 1
	cmp	w1, wzr
	add	w3, w7, w0
	str	w2, [x20, w6, uxtw 2]
	ccmp	w3, 3, 0, ge
	add	w2, w2, w9
	ble	.L30
.L29:
	cmp	w0, 15
	add	w10, w10, 1
	bhi	.L31
	cmp	w10, 3
	ble	.L50
	sub	w7, w10, #3
	mov	w1, 3
	b	.L28
.L31:
	add	x12, x12, 1
	add	x13, x13, 4
	cmp	w16, w12
	bhi	.L34
.L12:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L49:
	ldr	w3, [x13]
	b	.L27
.L48:
	add	x8, x19, 356
	cbnz	w10, .L19
	ldrsb	w0, [x19, 12]
	mov	w14, 2
	mov	w16, 4
	add	w0, w0, 1
	b	.L17
.L50:
	mov	w1, w10
	mov	w7, 0
	b	.L28
	.size	HEVC_InitSigLastScan, .-HEVC_InitSigLastScan
	.align	3
.LC3:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitScalingOrderTable
	.type	HEVC_InitScalingOrderTable, %function
HEVC_InitScalingOrderTable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x22, 10
	add	x2, x22, 139
	mov	w1, -1
	.p2align 2
.L52:
	strb	w1, [x0], 1
	cmp	x2, x0
	bne	.L52
	ldr	x21, .LC6
	mov	w3, 1
	mov	w2, 2
	mov	w1, 3
	mov	w0, 4
	strb	wzr, [x22, 14]
	strb	w3, [x22, 18]
	mov	w20, 2
	strb	w2, [x22, 26]
	mov	w19, 0
	strb	w1, [x22, 42]
	strb	w0, [x22, 74]
	.p2align 2
.L53:
	mov	w7, w19
	mov	w6, w20
	mov	w5, w20
	mov	x4, x21
	mov	x3, 0
	mov	x2, 0
	mov	x1, 0
	mov	x0, x22
	add	w19, w19, 1
	lsl	w20, w20, 1
	bl	HEVC_InitSigLastScan
	add	x21, x21, 65536
	cmp	w19, 7
	bne	.L53
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_InitScalingOrderTable, .-HEVC_InitScalingOrderTable
	.align	3
.LC6:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCGetDar
	.type	HEVCGetDar, %function
HEVCGetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	mov	w23, w2
	mov	w22, w3
	mov	w24, w4
	mov	w20, 0
	bl	_mcount
	cbz	w19, .L57
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L57
	cmp	w21, wzr
	ccmp	w23, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L57
	cmp	w19, 1
	mov	w20, 5
	beq	.L57
	cmp	w19, w0
	beq	.L58
	ldr	x0, .LC7
	sbfiz	x19, x19, 3, 32
	add	x1, x0, x19
	ldr	w21, [x0, x19]
	ldr	w23, [x1, 4]
.L58:
	lsl	w4, w21, 10
	lsl	w22, w22, 10
	sdiv	w2, w4, w23
	sdiv	w4, w22, w24
	mul	w4, w2, w4
	cmp	w4, wzr
	add	w0, w4, 1023
	csel	w4, w0, w4, lt
	asr	w4, w4, 10
	subs	w1, w4, #2406
	bmi	.L80
.L59:
	subs	w0, w4, #2263
	bmi	.L81
	cmp	w1, w0
	mov	w20, 4
	bge	.L63
.L57:
	ldr	x1, .LC9
	mov	w2, w20
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L81:
	mov	w0, 2263
	mov	w20, 4
	sub	w0, w0, w4
	cmp	w1, w0
	blt	.L57
.L63:
	subs	w1, w4, #1820
	bmi	.L82
	cmp	w0, w1
	mov	w20, 3
	blt	.L57
.L64:
	subs	w0, w4, #1365
	bmi	.L83
.L62:
	mov	w20, 2
	cmp	w1, w0
	csinc	w20, w20, wzr, lt
	b	.L57
	.p2align 3
.L80:
	mov	w1, 2406
	sub	w1, w1, w4
	b	.L59
	.p2align 3
.L82:
	mov	w1, 1820
	mov	w20, 3
	sub	w1, w1, w4
	cmp	w0, w1
	blt	.L57
	b	.L64
.L83:
	mov	w0, 1365
	sub	w0, w0, w4
	b	.L62
	.size	HEVCGetDar, .-HEVCGetDar
	.align	3
.LC7:
	.xword	.LANCHOR1
	.align	3
.LC9:
	.xword	.LC8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintNaluArraySlot
	.type	HEVC_PrintNaluArraySlot, %function
HEVC_PrintNaluArraySlot:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC11
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x24, .LC13
	ldr	w0, [x20, 160]
	cmn	w0, #1
	beq	.L88
	mov	w21, 52429
	ldr	x23, .LC17
	mov	w19, 0
	add	x22, x20, 65536
	movk	w21, 0xcccc, lsl 16
	b	.L87
	.p2align 3
.L86:
	ldr	w0, [x20, 160]
	add	w0, w0, 1
	cmp	w0, w19
	bls	.L88
.L87:
	uxtw	x3, w19
	ldr	x4, [x22, 3896]
	lsl	x0, x3, 3
	mov	w2, w19
	sub	x3, x0, x3
	mov	x1, x23
	mov	w0, 1
	add	x4, x4, x3, lsl 4
	mov	x3, x4
	ldr	w4, [x4, 36]
	bl	dprint_vfmw
	umull	x0, w19, w21
	lsr	x0, x0, 32
	lsr	w0, w0, 3
	lsl	w1, w0, 3
	add	w0, w1, w0, lsl 1
	cmp	w19, w0
	add	w19, w19, 1
	bne	.L86
	mov	x1, x24
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 160]
	add	w0, w0, 1
	cmp	w0, w19
	bhi	.L87
.L88:
	mov	x1, x24
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC15
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	HEVC_PrintNaluArraySlot, .-HEVC_PrintNaluArraySlot
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintCurrSlicelistX
	.type	HEVC_PrintCurrSlicelistX, %function
HEVC_PrintCurrSlicelistX:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 53248
	bl	_mcount
	ldr	x1, .LC19
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC21
	mov	w0, 1
	ldr	w2, [x22, 2912]
	bl	dprint_vfmw
	ldr	w0, [x22, 2912]
	cbz	w0, .L99
	ldr	x25, .LC25
	mov	w19, 0
	ldr	x23, .LC30
	ldr	x24, .LC27
	ldr	x26, .LC29
	.p2align 2
.L98:
	add	x20, x21, x19, uxtw 3
	mov	w2, w19
	mov	x1, x25
	mov	w0, 1
	add	w19, w19, w0
	ldr	x3, [x20, 2400]
	bl	dprint_vfmw
	ldr	x2, [x20, 2400]
	mov	x1, x24
	mov	w0, 1
	cbz	x2, .L96
	ldr	x2, [x2, 40]
	bl	dprint_vfmw
	ldr	x0, [x20, 2400]
	ldr	x0, [x0, 40]
	cbz	x0, .L96
	ldr	w1, [x0, 32]
	ldr	w0, [x21, 276]
	bl	FSP_GetLogicFs
	mov	x2, x0
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
.L96:
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x22, 2912]
	cmp	w0, w19
	bhi	.L98
.L99:
	ldr	x1, .LC23
	mov	w0, 1
	ldr	w2, [x22, 2916]
	bl	dprint_vfmw
	ldr	w0, [x22, 2916]
	cbz	w0, .L94
	ldr	x23, .LC30
	mov	w19, 0
	ldr	x25, .LC34
	ldr	x24, .LC27
	ldr	x26, .LC29
	.p2align 2
.L103:
	add	x20, x21, x19, uxtw 3
	mov	w2, w19
	mov	x1, x25
	mov	w0, 1
	add	w19, w19, w0
	ldr	x3, [x20, 2536]
	bl	dprint_vfmw
	ldr	x2, [x20, 2536]
	mov	x1, x24
	mov	w0, 1
	cbz	x2, .L101
	ldr	x2, [x2, 40]
	bl	dprint_vfmw
	ldr	x0, [x20, 2536]
	ldr	x0, [x0, 40]
	cbz	x0, .L101
	ldr	w1, [x0, 32]
	ldr	w0, [x21, 276]
	bl	FSP_GetLogicFs
	mov	x2, x0
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
.L101:
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x22, 2916]
	cmp	w0, w19
	bhi	.L103
.L94:
	ldr	x1, .LC32
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_PrintCurrSlicelistX, .-HEVC_PrintCurrSlicelistX
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC29:
	.xword	.LC28
	.align	3
.LC30:
	.xword	.LC12
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintFrameStoreState
	.type	HEVC_PrintFrameStoreState, %function
HEVC_PrintFrameStoreState:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC38
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x21, 176]
	cbz	w0, .L117
	mov	x23, 5400
	ldr	x26, .LC42
	ldr	x22, .LC44
	mov	w20, 0
	ldr	x25, .LC45
	mov	w24, 760
	movk	x23, 0x1, lsl 16
	.p2align 2
.L116:
	uxtw	x4, w20
	mov	w2, w20
	lsl	x3, x4, 2
	mov	x1, x26
	sub	x3, x3, x4
	mov	w0, 1
	lsl	x3, x3, 5
	mov	w19, 0
	sub	x3, x3, x4
	lsl	x3, x3, 3
	add	x4, x21, x3
	add	x3, x3, 69632
	add	x4, x4, 69632
	add	x3, x21, x3
	umaddl	x27, w20, w24, x23
	add	x3, x3, 616
	ldrb	w6, [x4, 618]
	add	x27, x21, x27
	ldrb	w5, [x4, 617]
	ldr	w4, [x4, 620]
	bl	dprint_vfmw
.L115:
	ldr	x3, [x27], 8
	mov	w2, w19
	mov	w0, 1
	mov	x1, x22
	add	w19, w19, w0
	bl	dprint_vfmw
	cmp	w19, 4
	bne	.L115
	mov	w0, 1
	mov	x1, x25
	add	w20, w20, w0
	bl	dprint_vfmw
	ldr	w0, [x21, 176]
	cmp	w0, w20
	bhi	.L116
.L117:
	ldr	x1, .LC40
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.size	HEVC_PrintFrameStoreState, .-HEVC_PrintFrameStoreState
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC40:
	.xword	.LC39
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC45:
	.xword	.LC12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintAPCState
	.type	HEVC_PrintAPCState, %function
HEVC_PrintAPCState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 3288
	mov	w19, 0
	bl	_mcount
	ldr	x1, .LC47
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w3, [x21, 3280]
	mov	w0, 1
	ldr	w2, [x21, 3284]
	ldr	x1, .LC49
	bl	dprint_vfmw
	ldr	x21, .LC51
	.p2align 2
.L122:
	ldr	w4, [x20, 64]
	mov	w2, w19
	ldr	w5, [x20, 128]
	mov	w0, 1
	ldr	w3, [x20], 4
	mov	x1, x21
	add	w19, w19, w0
	bl	dprint_vfmw
	cmp	w19, 16
	bne	.L122
	ldr	x1, .LC53
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_PrintAPCState, .-HEVC_PrintAPCState
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintDPBState
	.type	HEVC_PrintDPBState, %function
HEVC_PrintDPBState:
	sub	sp, sp, #176
	stp	x29, x30, [sp, 64]
	add	x29, sp, 64
	stp	x19, x20, [sp, 80]
	stp	x21, x22, [sp, 96]
	stp	x23, x24, [sp, 112]
	stp	x25, x26, [sp, 128]
	stp	x27, x28, [sp, 144]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x1, .LC55
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC57
	mov	w0, 1
	ldr	w2, [x19, 2712]
	ldr	w3, [x19, 2716]
	ldr	w6, [x19, 2724]
	ldr	w4, [x19, 2728]
	ldr	w5, [x19, 2732]
	bl	dprint_vfmw
	ldr	w0, [x19, 2716]
	cbz	w0, .L129
	.p2align 2
.L128:
	add	x21, x19, x20, uxtw 3
	ldr	w0, [x19, 276]
	ldr	x2, [x21, 2736]
	ldrb	w7, [x2, 2]
	ldr	w1, [x2, 32]
	ldrb	w27, [x2]
	ldrb	w25, [x2, 1]
	ldr	w28, [x2, 4]
	ldr	w22, [x2, 12]
	ldr	w23, [x2, 56]
	str	w7, [x29, 108]
	bl	FSP_GetLogicFs
	ldr	x1, [x21, 2736]
	mov	x24, x0
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetRef
	mov	w26, w0
	ldr	x1, [x21, 2736]
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetDisplay
	ldr	x8, [x21, 2736]
	mov	w2, w20
	ldr	w7, [x29, 108]
	mov	w6, w25
	mov	x3, x8
	mov	w5, w28
	ldr	w1, [x8, 268]
	mov	w4, w27
	str	w1, [sp, 48]
	add	w20, w20, 1
	ldr	x1, .LC60
	ldr	w8, [x8, 32]
	str	w8, [sp, 40]
	str	w0, [sp, 32]
	mov	w0, 1
	str	w22, [sp]
	str	w23, [sp, 8]
	str	x24, [sp, 16]
	str	w26, [sp, 24]
	bl	dprint_vfmw
	ldr	w0, [x19, 2716]
	cmp	w0, w20
	bhi	.L128
.L129:
	ldr	x24, .LC58
	mov	w0, 1
	mov	x1, x24
	bl	dprint_vfmw
	ldr	w0, [x19, 2716]
	cbz	w0, .L127
	ldr	x26, .LC64
	mov	w21, 0
	ldr	x28, .LC66
	ldr	x27, .LC68
	ldr	x25, .LC76
	b	.L136
	.p2align 3
.L140:
	mov	x2, x20
	mov	x1, x28
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x20, 672]
	mov	x1, x27
	mov	w0, 1
	bl	dprint_vfmw
	ldrsb	w2, [x20]
	mov	w0, 1
	ldr	x1, .LC70
	bl	dprint_vfmw
	ldrsb	w2, [x20, 1]
	mov	w0, 1
	ldr	x1, .LC72
	bl	dprint_vfmw
	mov	x2, x23
	mov	x1, x25
	mov	w0, 1
	cbz	x23, .L132
.L141:
	bl	dprint_vfmw
	ldr	w2, [x23, 88]
	mov	w0, 1
	ldr	x1, .LC78
	bl	dprint_vfmw
	mov	x2, x22
	mov	w0, 1
	cbz	x22, .L134
.L142:
	ldr	x1, .LC82
	bl	dprint_vfmw
	ldr	x1, .LC84
	mov	w0, 1
	ldr	w2, [x22, 88]
	bl	dprint_vfmw
	mov	w0, 1
	mov	x1, x24
	add	w21, w21, w0
	bl	dprint_vfmw
	ldr	w0, [x19, 2716]
	cmp	w0, w21
	bls	.L127
.L136:
	add	x22, x19, x21, uxtw 3
	ldr	w0, [x19, 276]
	ldr	x1, [x22, 2736]
	ldr	w1, [x1, 32]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	x1, [x22, 2736]
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetDecPhyFs
	mov	x23, x0
	ldr	x1, [x22, 2736]
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetDispPhyFs
	mov	x22, x0
	mov	w2, w21
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
	cbnz	x20, .L140
	ldr	x1, .LC74
	mov	w0, 1
	bl	dprint_vfmw
	mov	x2, x23
	mov	x1, x25
	mov	w0, 1
	cbnz	x23, .L141
	.p2align 2
.L132:
	ldr	x1, .LC80
	mov	w0, 1
	bl	dprint_vfmw
	mov	x2, x22
	mov	w0, 1
	cbnz	x22, .L142
	.p2align 2
.L134:
	ldr	x1, .LC86
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
	mov	x1, x24
	add	w21, w21, w0
	bl	dprint_vfmw
	ldr	w0, [x19, 2716]
	cmp	w0, w21
	bhi	.L136
.L127:
	ldr	x1, .LC62
	mov	w0, 1
	bl	dprint_vfmw
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	HEVC_PrintDPBState, .-HEVC_PrintDPBState
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC58:
	.xword	.LC12
	.align	3
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
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
	.align	3
.LC74:
	.xword	.LC73
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsSliceUnit
	.type	HEVC_IsSliceUnit, %function
HEVC_IsSliceUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 9
	mov	w0, 1
	bls	.L144
	sub	w19, w19, #16
	cmp	w19, 5
	cset	w0, ls
.L144:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsSliceUnit, .-HEVC_IsSliceUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsIUnit
	.type	HEVC_IsIUnit, %function
HEVC_IsIUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sub	w19, w19, #16
	bl	_mcount
	cmp	w19, 5
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsIUnit, .-HEVC_IsIUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNonRefPic
	.type	HEVC_IsNonRefPic, %function
HEVC_IsNonRefPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ands	w19, w19, -7
	mov	w0, 1
	beq	.L148
	cmp	w19, 8
	cset	w0, eq
.L148:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsNonRefPic, .-HEVC_IsNonRefPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsFlushUnit
	.type	HEVC_IsFlushUnit, %function
HEVC_IsFlushUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sub	w19, w19, #16
	bl	_mcount
	cmp	w19, 4
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsFlushUnit, .-HEVC_IsFlushUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsPVRFlushPic
	.type	HEVC_IsPVRFlushPic, %function
HEVC_IsPVRFlushPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 53248
	ldr	w0, [x0, 2028]
	cbnz	w0, .L153
	ldr	x1, [x19, 2376]
	ldr	w2, [x1, 680]
	cmp	w2, 1
	beq	.L157
.L152:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L153:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L157:
	ldr	w2, [x1, 676]
	cbnz	w2, .L152
	ldr	w2, [x1, 684]
	cbnz	w2, .L152
	ldr	w0, [x1, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	cset	w0, hi
	b	.L152
	.size	HEVC_IsPVRFlushPic, .-HEVC_IsPVRFlushPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsEosNal
	.type	HEVC_IsEosNal, %function
HEVC_IsEosNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2344]
	mov	w1, 32
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2344]
	mov	w1, 32
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsEosNal, .-HEVC_IsEosNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsFrameEndNal
	.type	HEVC_IsFrameEndNal, %function
HEVC_IsFrameEndNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #32
	sub	w19, w19, #48
	cmp	w0, 2
	ccmp	w19, 1, 0, hi
	ldr	x19, [sp, 16]
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsFrameEndNal, .-HEVC_IsFrameEndNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_IsNeedSedOnly
	.type	HEVCDEC_IsNeedSedOnly, %function
HEVCDEC_IsNeedSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 208]
	cbz	w0, .L163
	ldr	x1, [x19, 2384]
	cbz	x1, .L168
.L163:
	mov	w0, 0
.L162:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L168:
	add	x1, x19, 61440
	ldr	w1, [x1, 2660]
	cmp	w1, 1
	bls	.L163
	ldr	w1, [x19, 236]
	cmp	w0, w1
	beq	.L163
	ldr	w0, [x19, 220]
	cmp	w0, 1
	beq	.L169
	cbnz	w0, .L163
	ldr	w0, [x19, 276]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L163
	ldr	w0, [x19, 276]
	bl	VCTRL_CheckFreshSeg
	cmp	w0, wzr
	cset	w0, ne
	b	.L162
	.p2align 3
.L169:
	ldr	x0, [x19, 2392]
	cmp	x0, xzr
	cset	w0, ne
	b	.L162
	.size	HEVCDEC_IsNeedSedOnly, .-HEVCDEC_IsNeedSedOnly
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcTileInfo
	.type	HEVC_CalcTileInfo, %function
HEVC_CalcTileInfo:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	mov	x21, x3
	bl	_mcount
	ldr	x0, [x22, 29088]
	ldr	x1, [x22, 29080]
	ldp	w23, w26, [x0, 68]
	ldr	w25, [x1, 148]
	sub	w0, w23, #1
	cmp	w0, 9
	bhi	.L198
	sub	w0, w26, #1
	cmp	w0, 10
	bhi	.L199
	ldr	x24, .LC92
	mov	x2, 512
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x24, 96]
	blr	x3
	ldr	x3, [x24, 96]
	mov	x2, 80
	mov	w1, 0
	mov	x0, x20
	blr	x3
	ldr	x3, [x24, 96]
	mov	x2, 88
	mov	w1, 0
	mov	x0, x21
	blr	x3
	cmp	w23, wzr
	ble	.L179
	sub	w7, w25, #4
	mov	x2, x20
	mov	w1, 0
	mov	w6, 0
.L178:
	str	w1, [x2]
	lsl	w3, w1, w7
	ldr	x0, [x22, 29088]
	add	x0, x0, x6, sxtw 1
	ldrsh	w5, [x0, 176]
	add	w5, w5, w1
	lsl	w1, w5, w7
	sub	w0, w5, #1
	cmp	w3, w1
	str	w0, [x2, 4]
	bge	.L184
	cmp	w3, 255
	bhi	.L180
	uxtb	w4, w6
	b	.L182
	.p2align 3
.L183:
	cmp	w3, 255
	bhi	.L180
.L182:
	strb	w4, [x19, w3, sxtw]
	add	w3, w3, 1
	cmp	w3, w1
	blt	.L183
.L184:
	add	w6, w6, 1
	add	x2, x2, 8
	cmp	w23, w6
	mov	w1, w5
	bne	.L178
.L179:
	cmp	w26, wzr
	ble	.L176
	sub	w25, w25, #4
	mov	w0, 0
	mov	w5, 0
.L186:
	str	w0, [x21]
	lsl	w3, w0, w25
	ldr	x1, [x22, 29088]
	add	x1, x1, x5, sxtw 1
	ldrsh	w4, [x1, 216]
	add	w4, w4, w0
	lsl	w0, w4, w25
	sub	w1, w4, #1
	cmp	w3, w0
	str	w1, [x21, 4]
	bge	.L191
	cmp	w3, 255
	bhi	.L187
	uxtb	w2, w5
	add	x1, x19, 256
	b	.L189
	.p2align 3
.L190:
	cmp	w3, 255
	bhi	.L187
.L189:
	strb	w2, [x1, w3, sxtw]
	add	w3, w3, 1
	cmp	w3, w0
	blt	.L190
.L191:
	add	w5, w5, 1
	add	x21, x21, 8
	cmp	w26, w5
	mov	w0, w4
	bne	.L186
.L176:
	mov	w0, 0
	b	.L172
	.p2align 3
.L180:
	ldr	x2, .LC87
	mov	w0, 1
	ldr	x1, .LC94
	add	x2, x2, 136
	bl	dprint_vfmw
	mov	w0, -1
.L172:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L187:
	ldr	x2, .LC87
	mov	w0, 1
	ldr	x1, .LC96
	add	x2, x2, 136
	bl	dprint_vfmw
	mov	w0, -1
	b	.L172
.L199:
	ldr	x2, .LC87
	mov	w4, 11
	ldr	x1, .LC91
	mov	w3, w26
	add	x2, x2, 136
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L172
.L198:
	ldr	x2, .LC87
	mov	w4, 10
	ldr	x1, .LC89
	mov	w3, w23
	add	x2, x2, 136
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L172
	.size	HEVC_CalcTileInfo, .-HEVC_CalcTileInfo
	.align	3
.LC87:
	.xword	.LANCHOR1
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC92:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC96:
	.xword	.LC95
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_VPSEqual
	.type	HEVC_VPSEqual, %function
HEVC_VPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L223
	cbz	x20, .L224
	ldp	w3, w1, [x19, 12]
	ldp	w2, w0, [x20, 12]
	ldrb	w5, [x19, 1]
	add	x6, x19, 12288
	cmp	w3, w2
	ldrb	w4, [x20, 1]
	ccmp	w1, w0, 0, eq
	ldr	w8, [x19, 20]
	ldr	w0, [x20, 20]
	cset	w2, eq
	cmp	w5, w4
	ldr	w4, [x19, 24]
	ccmp	w0, w8, 0, eq
	add	x7, x20, 12288
	cset	w0, eq
	ldr	w3, [x6, 424]
	and	w0, w2, w0
	ldr	w2, [x20, 24]
	ldrb	w5, [x6, 148]
	add	x1, x6, 149
	cmp	w4, w2
	ldr	w4, [x19, 8]
	ldr	w2, [x20, 8]
	ldr	w9, [x6, 420]
	ccmp	w4, w2, 0, eq
	ldr	w4, [x7, 420]
	cset	w2, eq
	and	w0, w2, w0
	ldr	w2, [x7, 424]
	cmp	w3, w2
	ldrb	w3, [x7, 148]
	add	x2, x7, 149
	ccmp	w5, w3, 0, eq
	add	x5, x6, 181
	cset	w3, eq
	cmp	w9, w4
	and	w0, w3, w0
	cset	w3, eq
	and	w0, w3, w0
	.p2align 2
.L204:
	ldrb	w4, [x1], 1
	ldrb	w3, [x2], 1
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L204
	ldrb	w4, [x6, 181]
	sub	w8, w8, #1
	ldrb	w2, [x7, 181]
	ldrb	w5, [x6, 182]
	ldrb	w3, [x7, 182]
	cmp	w4, w2
	ldrb	w4, [x6, 183]
	ldrb	w2, [x7, 183]
	ccmp	w5, w3, 0, eq
	ldrb	w1, [x7, 184]
	cset	w3, eq
	ldrb	w5, [x6, 184]
	cmp	w4, w2
	ldrb	w4, [x19, 7]
	ldrb	w2, [x20, 7]
	ccmp	w5, w1, 0, eq
	cset	w1, eq
	cmp	w4, w2
	and	w1, w3, w1
	cset	w3, eq
	mov	w4, 0
	and	w3, w3, w1
	and	w0, w3, w0
	.p2align 2
.L205:
	ubfiz	x1, x4, 2, 32
	add	w4, w4, 1
	add	x2, x19, x1
	add	x1, x20, x1
	ldr	w5, [x2, 52]
	ldr	w3, [x1, 52]
	ldr	w6, [x1, 84]
	ldr	w7, [x2, 84]
	cmp	w5, w3
	ldr	w3, [x1, 116]
	cset	w1, eq
	ldr	w5, [x2, 116]
	cmp	w7, w6
	cset	w2, eq
	cmp	w5, w3
	and	w1, w1, w2
	cset	w3, eq
	cmp	w4, w8
	and	w1, w3, w1
	and	w0, w0, w1
	bls	.L205
	ldp	w5, w7, [x19, 28]
	ldp	w2, w1, [x20, 28]
	cmp	w2, w5
	ccmp	w1, w7, 0, eq
	cset	w3, eq
	and	w3, w3, w0
	cbz	w7, .L206
	mov	w6, 1
	.p2align 2
.L207:
	mov	w2, 0
	uxtw	x1, w6
	.p2align 2
.L208:
	add	x0, x1, x2, uxtw
	add	w2, w2, 1
	add	x0, x0, 36
	lsl	x0, x0, 2
	add	x4, x19, x0
	add	x0, x20, x0
	ldr	w4, [x4, 4]
	ldr	w0, [x0, 4]
	cmp	w4, w0
	cset	w0, eq
	cmp	w2, w5
	and	w3, w3, w0
	bls	.L208
	add	w6, w6, 1
	cmp	w6, w7
	bls	.L207
.L206:
	ldrb	w1, [x20, 6]
	ldrb	w0, [x19, 6]
	cmp	w1, w0
	cset	w1, eq
	and	w3, w1, w3
	cbz	w0, .L209
	ldp	w1, w0, [x20, 36]
	ldp	w2, w5, [x19, 36]
	ldrb	w4, [x20, 5]
	cmp	w2, w1
	ldrb	w2, [x19, 5]
	cset	w1, eq
	cmp	w5, w0
	cset	w0, eq
	cmp	w4, w2
	and	w1, w1, w0
	cset	w0, eq
	and	w0, w1, w0
	and	w3, w0, w3
	cbnz	w2, .L225
.L210:
	ldr	w0, [x20, 48]
	ldr	w1, [x19, 48]
	cmp	w1, w0
	cset	w0, eq
	and	w3, w0, w3
.L209:
	eor	w3, w3, 1
	neg	w0, w3
.L202:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L225:
	ldr	w0, [x20, 44]
	ldr	w1, [x19, 44]
	cmp	w1, w0
	cset	w0, eq
	and	w3, w3, w0
	b	.L210
.L224:
	ldr	x2, .LC98
	mov	w3, 1899
	ldr	x1, .LC100
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L202
.L223:
	ldr	x2, .LC98
	mov	w3, 1898
	ldr	x1, .LC100
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L202
	.size	HEVC_VPSEqual, .-HEVC_VPSEqual
	.align	3
.LC98:
	.xword	.LC97
	.align	3
.LC100:
	.xword	.LC99
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_More_Data_In_Payload
	.type	HEVC_Sei_More_Data_In_Payload, %function
HEVC_Sei_More_Data_In_Payload:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	lsl	w20, w20, 3
	ldr	x1, [x19, 2344]
	mov	x0, x1
	ldp	w2, w19, [x1, 32]
	sub	w19, w2, w19
	bl	BsIsByteAligned
	cmp	w20, w19
	ccmp	w0, wzr, 4, ne
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_Sei_More_Data_In_Payload, .-HEVC_Sei_More_Data_In_Payload
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Payload_Extension_Present
	.type	HEVC_Sei_Payload_Extension_Present, %function
HEVC_Sei_Payload_Extension_Present:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	lsl	w20, w20, 3
	ldr	x3, .LC101
	mov	x2, 40
	ldr	x1, [x19, 2344]
	add	x0, x29, x2
	ldr	x3, [x3, 104]
	blr	x3
	ldp	w0, w1, [x29, 72]
	sub	w0, w0, w1
	mov	w1, 0
	cmp	w0, w20
	bcc	.L234
.L228:
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L234:
	mov	w1, 1
	add	x0, x29, 40
	bl	BsShow
	mov	w1, 1
	cbz	w0, .L228
	add	x0, x29, 40
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
	b	.L229
	.p2align 3
.L230:
	bl	BsSkip
	ldp	w0, w19, [x29, 72]
	sub	w19, w0, w19
.L229:
	mov	w1, 1
	add	x0, x29, 40
	bl	BsShow
	cmp	w19, w20
	mov	w1, 1
	cset	w2, cc
	cmp	w0, wzr
	cset	w3, eq
	add	x0, x29, 40
	tst	w2, w3
	bne	.L230
	mov	w1, w2
	ldp	x19, x20, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_Sei_Payload_Extension_Present, .-HEVC_Sei_Payload_Extension_Present
	.align	3
.LC101:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Decoded_Picture_Hash
	.type	HEVC_Sei_Decoded_Picture_Hash, %function
HEVC_Sei_Decoded_Picture_Hash:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	x21, xzr
	ccmp	x22, xzr, 4, ne
	beq	.L243
	ldr	x0, [x21, 2344]
	mov	w1, 8
	mov	x20, x22
	add	x23, x22, 48
	bl	BsGet
	mov	w1, w0
	stp	w0, w0, [x22, 48]
	cbnz	w1, .L237
.L246:
	mov	x19, 0
	.p2align 2
.L238:
	ldr	x0, [x21, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, x19]
	add	x19, x19, 1
	cmp	x19, 16
	bne	.L238
.L239:
	add	x20, x20, 16
	cmp	x20, x23
	beq	.L244
.L248:
	ldr	w1, [x22, 52]
	cbz	w1, .L246
.L237:
	cmp	w1, 1
	beq	.L247
	cmp	w1, 2
	bne	.L239
	ldr	x0, [x21, 2344]
	mov	w1, 32
	add	x20, x20, 16
	bl	BsGet
	strb	w0, [x20, -13]
	lsr	w3, w0, 24
	lsr	w2, w0, 16
	strb	w3, [x20, -16]
	lsr	w1, w0, 8
	strb	w2, [x20, -15]
	strb	w1, [x20, -14]
	cmp	x20, x23
	bne	.L248
	.p2align 2
.L244:
	mov	w0, 0
.L236:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L247:
	ldr	x0, [x21, 2344]
	mov	w1, 16
	bl	BsGet
	lsr	w1, w0, 8
	strb	w0, [x20, 1]
	strb	w1, [x20]
	b	.L239
.L243:
	mov	w0, -1
	b	.L236
	.size	HEVC_Sei_Decoded_Picture_Hash, .-HEVC_Sei_Decoded_Picture_Hash
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Region_Refresh_Info
	.type	HEVC_Sei_Region_Refresh_Info, %function
HEVC_Sei_Region_Refresh_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L251
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 0
.L250:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L251:
	mov	w1, -1
	b	.L250
	.size	HEVC_Sei_Region_Refresh_Info, .-HEVC_Sei_Region_Refresh_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Mastering_Display_Colour_Volume
	.type	HEVC_Sei_Mastering_Display_Colour_Volume, %function
HEVC_Sei_Mastering_Display_Colour_Volume:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L254
	mov	w0, 1
	mov	x1, x19
	strb	w0, [x19]
	mov	x0, x20
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.12
.L253:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L254:
	mov	w0, -1
	b	.L253
	.size	HEVC_Sei_Mastering_Display_Colour_Volume, .-HEVC_Sei_Mastering_Display_Colour_Volume
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Content_Light_Level_Information
	.type	HEVC_Sei_Content_Light_Level_Information, %function
HEVC_Sei_Content_Light_Level_Information:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L257
	mov	w0, 1
	strb	w0, [x19]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	strh	w0, [x19, 2]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	strh	w0, [x19, 4]
	mov	w1, 0
.L256:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L257:
	mov	w1, -1
	b	.L256
	.size	HEVC_Sei_Content_Light_Level_Information, .-HEVC_Sei_Content_Light_Level_Information
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_HLGHDR_Comapitibility_Info
	.type	HEVC_Sei_HLGHDR_Comapitibility_Info, %function
HEVC_Sei_HLGHDR_Comapitibility_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L260
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 0
.L259:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L260:
	mov	w1, -1
	b	.L259
	.size	HEVC_Sei_HLGHDR_Comapitibility_Info, .-HEVC_Sei_HLGHDR_Comapitibility_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.type	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, %function
HEVC_Sei_Temporal_Sub_Layer_Zero_Index:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L263
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x20]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 4]
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L262:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L263:
	mov	w0, -1
	b	.L262
	.size	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, .-HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Display_Orientation
	.type	HEVC_Sei_Display_Orientation, %function
HEVC_Sei_Display_Orientation:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L267
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 2]
	cbz	w0, .L268
.L266:
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L265:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L268:
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 1]
	mov	w1, 16
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 4]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 3]
	b	.L266
	.p2align 3
.L267:
	mov	w0, -1
	b	.L265
	.size	HEVC_Sei_Display_Orientation, .-HEVC_Sei_Display_Orientation
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_ParsePts_Init
	.type	HEVC_Sei_ParsePts_Init, %function
HEVC_Sei_ParsePts_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC102
	add	x0, x19, 28672
	mov	x2, 80
	mov	w1, 0
	add	x0, x0, 320
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 5260]
	str	wzr, [x19, 5264]
	str	wzr, [x19, 5268]
	str	wzr, [x19, 5272]
	str	xzr, [x19, 7360]
	str	xzr, [x19, 7368]
	str	xzr, [x19, 7376]
	str	xzr, [x19, 7384]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Get_Dpb_Output_Time
	.type	HEVC_Sei_Get_Dpb_Output_Time, %function
HEVC_Sei_Get_Dpb_Output_Time:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	add	x0, x19, 53248
	add	x3, x19, 28672
	ldr	x2, [x19, 2368]
	add	x5, x3, 320
	mov	w7, 2024
	ldr	w6, [x21, 12]
	ldr	w4, [x0, 2828]
	mov	w1, 26164
	ldr	x0, [x19, 2360]
	smaddl	x2, w4, w7, x2
	ldr	w4, [x5, 4]
	cmp	w4, 1
	ldr	w4, [x2, 32]
	str	w6, [x5, 24]
	ldr	w2, [x21, 16]
	str	w2, [x5, 28]
	smaddl	x0, w4, w1, x0
	ldr	w4, [x20, 76]
	str	w4, [x5, 48]
	ldr	w1, [x20, 80]
	str	w1, [x5, 52]
	ldr	w1, [x0, 56]
	add	x0, x0, x1, lsl 2
	ldrb	w2, [x0, 412]
	beq	.L278
	ldrb	w0, [x5, 73]
	add	x19, x19, 4096
	cbnz	w0, .L279
	ldr	w0, [x19, 1196]
	ldr	x1, [x19, 3264]
	add	x0, x0, x1
	str	x0, [x19, 3288]
.L272:
	add	x19, x19, 1184
	add	x3, x3, 320
	str	x0, [x19, 2096]
	strb	wzr, [x3, 73]
	ldrb	w1, [x20, 9]
	cbnz	w1, .L280
.L276:
	ldr	w1, [x19, 16]
	uxtw	x4, w4
	add	x0, x1, x0
	sub	x0, x0, x2, uxtb
	str	x0, [x3, 40]
	mul	x0, x4, x0
	str	x0, [x3, 32]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L279:
	ldrb	w0, [x19, 121]
	cbnz	w0, .L281
	ldr	x1, [x19, 3264]
	ldr	x6, [x19, 3272]
.L275:
	ldr	w7, [x19, 1196]
	add	x0, x7, x1
	str	x0, [x19, 3264]
	cmp	x0, x6
	str	x0, [x19, 3288]
	bge	.L272
	add	x0, x7, x6
	add	x19, x19, 1184
	str	x0, [x19, 2080]
	add	x3, x3, 320
	str	x0, [x19, 2104]
	str	x0, [x19, 2096]
	strb	wzr, [x3, 73]
	ldrb	w1, [x20, 9]
	cbz	w1, .L276
.L280:
	ldr	w1, [x19, 16]
	uxtw	x4, w4
	add	x1, x1, x0
	asr	x1, x1, 1
	sub	x0, x1, x2, uxtb
	str	x0, [x3, 40]
	mul	x0, x4, x0
	str	x0, [x3, 32]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L278:
	add	x19, x19, 4096
	ldrsw	x0, [x19, 1164]
	str	x0, [x19, 3264]
	str	x0, [x19, 3288]
	b	.L272
	.p2align 3
.L281:
	ldr	x6, [x19, 3272]
	mov	x1, x6
	b	.L275
	.size	HEVC_Sei_Get_Dpb_Output_Time, .-HEVC_Sei_Get_Dpb_Output_Time
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Get_Last_IDR_Frame_Info
	.type	HEVC_Get_Last_IDR_Frame_Info, %function
HEVC_Get_Last_IDR_Frame_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sub	w0, w20, #19
	cmp	w0, 1
	bls	.L289
.L283:
	sub	w20, w20, #6
	cmp	w20, 3
	bls	.L282
	ldr	x0, [x19, 7384]
	str	x0, [x19, 7368]
.L282:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L289:
	ldr	x0, [x19, 2376]
	ldr	x0, [x0, 56]
	cmn	x0, #1
	beq	.L284
	ldr	x1, [x19, 29032]
	str	x0, [x19, 29048]
	str	x1, [x19, 29056]
.L284:
	add	x0, x19, 28672
	mov	w1, 1
	strb	w1, [x0, 392]
	b	.L283
	.size	HEVC_Get_Last_IDR_Frame_Info, .-HEVC_Get_Last_IDR_Frame_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Get_Frame_Pts
	.type	HEVC_Sei_Get_Frame_Pts, %function
HEVC_Sei_Get_Frame_Pts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 28672
	ldr	x3, [x19, 29032]
	ldr	x6, [x19, 29048]
	ldr	x7, [x19, 29056]
	ldr	w4, [x1, 368]
	ldr	w5, [x1, 372]
	cbz	w4, .L293
	mov	w1, w4
	mov	w2, w5
	b	.L292
	.p2align 3
.L294:
	mov	w1, w0
.L292:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L294
.L291:
	udiv	w4, w4, w1
	sub	x0, x3, x7
	lsl	w2, w0, 6
	add	x19, x19, 53248
	sub	w2, w2, w0
	lsl	w2, w2, 1
	sub	w0, w2, w0
	lsl	w0, w0, 3
	udiv	w1, w5, w1
	mul	w0, w0, w4
	udiv	w1, w0, w1
	add	x1, x1, x6
	str	x1, [x19, 2728]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L293:
	mov	w1, w5
	b	.L291
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_TSI
	.type	HEVC_Sei_TSI, %function
HEVC_Sei_TSI:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L297
	ldr	x0, [x20, 2344]
	mov	w1, 4
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 4
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
.L296:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L297:
	mov	w0, -1
	b	.L296
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_User_Data_Unregistered
	.type	HEVC_Sei_User_Data_Unregistered, %function
HEVC_Sei_User_Data_Unregistered:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	w23, w2
	bl	_mcount
	add	x19, x22, 8
	cmp	w23, 15
	add	x21, x22, 24
	bls	.L308
	.p2align 2
.L305:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19], 1
	cmp	x21, x19
	bne	.L305
	sub	w23, w23, #16
	str	w23, [x22, 24]
	mov	w19, 0
	cbz	w23, .L309
	.p2align 2
.L304:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	ldr	w0, [x22, 24]
	cmp	w0, w19
	bhi	.L304
	mov	w0, 0
.L300:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L309:
	str	xzr, [x22]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L308:
	ldr	x1, .LC104
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L300
	.size	HEVC_Sei_User_Data_Unregistered, .-HEVC_Sei_User_Data_Unregistered
	.align	3
.LC104:
	.xword	.LC103
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsRefListWrong
	.type	HEVC_IsRefListWrong, %function
HEVC_IsRefListWrong:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 53248
	bl	_mcount
	ldr	w3, [x21, 2912]
	cbnz	w3, .L351
.L311:
	mov	w0, 0
.L349:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L351:
	ldr	x0, [x20, 2400]
	cbz	x0, .L333
	ldr	x0, [x0, 40]
	mov	w19, 0
	cbnz	x0, .L317
	b	.L313
	.p2align 3
.L353:
	ldr	x1, [x0, 680]
	cbz	x1, .L318
	ldr	w3, [x21, 2912]
	add	w19, w19, 1
	cmp	w3, w19
	add	x0, x20, x19, sxtw 3
	bls	.L352
	ldr	x0, [x0, 2400]
	cbz	x0, .L312
	ldr	x0, [x0, 40]
	cbz	x0, .L313
.L317:
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_GetLogicFs
	cbnz	x0, .L353
.L318:
	add	x20, x20, x19, sxtw 3
	ldr	x1, .LC110
	mov	x4, x0
	mov	w2, w19
	mov	w0, 1
	ldr	x3, [x20, 2400]
	ldr	x3, [x3, 40]
	bl	dprint_vfmw
	mov	w0, -1
.L357:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L352:
	cbz	w3, .L311
	ldr	w0, [x21, 2916]
	cbz	w0, .L311
	ldr	x0, [x20, 2536]
	cbz	x0, .L335
	ldr	x0, [x0, 40]
	mov	w19, 0
	cbnz	x0, .L328
	b	.L325
	.p2align 3
.L356:
	ldr	x1, [x0, 680]
	cbz	x1, .L329
	ldr	w0, [x21, 2916]
	add	w19, w19, 1
	cmp	w0, w19
	add	x1, x20, x19, sxtw 3
	bls	.L311
	ldr	x0, [x1, 2536]
	cbz	x0, .L354
	ldr	x0, [x0, 40]
	cbz	x0, .L355
.L328:
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_GetLogicFs
	cbnz	x0, .L356
.L329:
	ldr	x1, .LC116
	mov	x3, x0
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L349
.L333:
	mov	w19, 0
	.p2align 2
.L312:
	ldr	x1, .LC106
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L357
	.p2align 3
.L313:
	ldr	x1, .LC108
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L357
.L355:
	ldr	w3, [x21, 2912]
.L325:
	ldr	x1, .LC114
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L349
.L354:
	ldr	w3, [x21, 2912]
.L324:
	ldr	x1, .LC112
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L349
.L335:
	mov	w19, 0
	b	.L324
	.size	HEVC_IsRefListWrong, .-HEVC_IsRefListWrong
	.align	3
.LC106:
	.xword	.LC105
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC110:
	.xword	.LC109
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC116:
	.xword	.LC115
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetUnRefPicWithMinPoc
	.type	HEVC_GetUnRefPicWithMinPoc, %function
HEVC_GetUnRefPicWithMinPoc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, -1
	bl	_mcount
	str	w21, [x20]
	ldr	w3, [x19, 2716]
	cmp	w3, 16
	bhi	.L359
	mov	w4, 2147483647
	mov	w0, 0
	cbz	w3, .L364
	.p2align 2
.L367:
	add	x2, x19, x0, uxtw 3
	ldr	x2, [x2, 2736]
	ldr	w5, [x2, 12]
	cmp	w5, w4
	bge	.L362
	ldr	w2, [x2]
	tst	w2, 16776960
	bne	.L362
	str	w0, [x20]
	mov	w4, w5
	ldr	w3, [x19, 2716]
.L362:
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L367
	ldr	w3, [x20]
	cmn	w3, #1
	beq	.L364
	ldr	x2, .LC117
	mov	w0, 1
	ldr	x1, .LC123
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, 0
.L361:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L364:
	ldr	x2, .LC117
	mov	w0, 1
	ldr	x1, .LC119
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
	b	.L361
.L359:
	ldr	x2, .LC117
	mov	w0, 1
	ldr	x1, .LC121
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, w21
	b	.L361
	.size	HEVC_GetUnRefPicWithMinPoc, .-HEVC_GetUnRefPicWithMinPoc
	.align	3
.LC117:
	.xword	.LANCHOR1
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC123:
	.xword	.LC122
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IncreaseDPBSize
	.type	HEVC_IncreaseDPBSize, %function
HEVC_IncreaseDPBSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x20, 2712]
	cmp	w3, 16
	bhi	.L374
	ldr	w0, [x20, 276]
	bl	FSP_GetTotalValidFsNum
	mov	w19, w0
	add	x0, x20, 53248
	ldr	w2, [x20, 276]
	ldr	w1, [x0, 2036]
	ldr	w0, [x0, 2032]
	bl	FSP_GetOccupiedNum
	subs	w0, w19, w0
	csel	w0, w0, wzr, pl
	ldr	x2, .LC124
	cmp	w0, wzr
	ble	.L373
	ldr	w3, [x20, 2712]
	add	w3, w3, 1
	cmp	w3, w0
	bhi	.L373
	ldr	x1, .LC128
	add	x2, x2, 192
	mov	w0, 13
	str	w3, [x20, 2712]
	bl	dprint_vfmw
	mov	w0, 0
.L372:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L373:
	ldr	x1, .LC130
	mov	w3, w0
	add	x2, x2, 192
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L372
	.p2align 3
.L374:
	ldr	x2, .LC124
	mov	w4, 17
	ldr	x1, .LC126
	mov	w0, 1
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w1, 17
	mov	w0, -1
	str	w1, [x20, 2712]
	b	.L372
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
	.align	3
.LC124:
	.xword	.LANCHOR1
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PicTypeStatistic
	.type	HEVC_PicTypeStatistic, %function
HEVC_PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 53248
	ldr	w1, [x0, 2824]
	sub	w2, w1, #16
	cmp	w2, 5
	bhi	.L376
	str	w1, [x0, 2020]
	str	wzr, [x0, 2028]
.L375:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L376:
	ldr	w1, [x0, 2020]
	sub	w1, w1, #16
	cmp	w1, 5
	bls	.L375
	ldr	w1, [x0, 2812]
	cmp	w1, 1
	beq	.L378
	cmp	w1, 2
	beq	.L379
	cbnz	w1, .L375
	mov	w1, 2
	str	w1, [x0, 2028]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
	ldr	w2, [x0, 2028]
	cmp	w2, 2
	beq	.L375
	str	w1, [x0, 2028]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L379:
	ldr	w1, [x0, 2028]
	sub	w1, w1, #1
	cmp	w1, 1
	bls	.L375
	str	wzr, [x0, 2028]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_PicTypeStatistic, .-HEVC_PicTypeStatistic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsReferenceNalu
	.type	HEVC_IsReferenceNalu, %function
HEVC_IsReferenceNalu:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 53248
	bl	_mcount
	ldr	w1, [x19, 2824]
	cmp	w1, 15
	bhi	.L385
	mov	w0, 1
	tbnz	x1, 0, .L386
.L385:
	sub	w1, w1, #16
	cmp	w1, 7
	cset	w0, ls
.L386:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsReferenceNalu, .-HEVC_IsReferenceNalu
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_4x4
	.type	HEVC_WriteQmatrix_4x4, %function
HEVC_WriteQmatrix_4x4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	ubfiz	x20, x20, 6, 32
	bl	_mcount
	add	x1, x21, x20
	ldrb	w4, [x1, 616]
	ldr	w3, [x1, 624]
	ldr	w2, [x1, 620]
	ldrb	w0, [x1, 612]
	ubfiz	w2, w2, 8, 8
	orr	w2, w2, w4, lsl 16
	orr	w0, w0, w3, lsl 24
	orr	w0, w2, w0
	str	w0, [x19]
	ldrb	w4, [x1, 625]
	ldrb	w2, [x1, 617]
	ldr	w3, [x1, 620]
	ldrb	w0, [x1, 613]
	lsl	w2, w2, 16
	and	w3, w3, 65280
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 4]
	ldrb	w4, [x1, 626]
	ldrb	w2, [x1, 622]
	ldr	w3, [x1, 616]
	ldrb	w0, [x1, 614]
	lsl	w2, w2, 8
	and	w3, w3, 16711680
	orr	w2, w2, w4, lsl 24
	orr	w0, w0, w3
	orr	w0, w2, w0
	str	w0, [x19, 8]
	ldrb	w3, [x1, 619]
	ldrb	w2, [x1, 623]
	ldr	w0, [x1, 624]
	ldrb	w1, [x1, 615]
	lsl	w2, w2, 8
	and	w0, w0, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 12]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_4x4, .-HEVC_WriteQmatrix_4x4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_32x32
	.type	HEVC_WriteQmatrix_32x32, %function
HEVC_WriteQmatrix_32x32:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 18
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1780]
	ldr	w3, [x0, 1788]
	ldr	w4, [x0, 1772]
	ldrb	w2, [x1, 612]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1812]
	ldr	w3, [x0, 1820]
	ldr	w4, [x0, 1804]
	ldrb	w2, [x0, 1796]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1789]
	ldrb	w4, [x0, 1781]
	ldr	w3, [x0, 1772]
	ldrb	w2, [x1, 613]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1821]
	ldrb	w4, [x0, 1813]
	ldr	w3, [x0, 1804]
	ldrb	w2, [x0, 1797]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1790]
	ldrb	w4, [x0, 1774]
	ldr	w3, [x0, 1780]
	ldrb	w2, [x1, 614]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1822]
	ldrb	w4, [x0, 1806]
	ldr	w3, [x0, 1812]
	ldrb	w2, [x0, 1798]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1783]
	ldrb	w3, [x0, 1775]
	ldr	w5, [x0, 1788]
	ldrb	w2, [x1, 615]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1815]
	ldrb	w3, [x0, 1807]
	ldr	w1, [x0, 1820]
	ldrb	w2, [x0, 1799]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1784]
	ldr	w2, [x0, 1792]
	ldr	w3, [x0, 1776]
	ldrb	w1, [x0, 1768]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1816]
	ldr	w2, [x0, 1824]
	ldr	w3, [x0, 1808]
	ldrb	w1, [x0, 1800]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1793]
	ldrb	w3, [x0, 1785]
	ldr	w2, [x0, 1776]
	ldrb	w1, [x0, 1769]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1825]
	ldrb	w3, [x0, 1817]
	ldr	w2, [x0, 1808]
	ldrb	w1, [x0, 1801]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1794]
	ldrb	w3, [x0, 1778]
	ldr	w2, [x0, 1784]
	ldrb	w1, [x0, 1770]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1826]
	ldrb	w3, [x0, 1810]
	ldr	w2, [x0, 1816]
	ldrb	w1, [x0, 1802]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1787]
	ldrb	w3, [x0, 1779]
	ldr	w1, [x0, 1792]
	ldrb	w2, [x0, 1771]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1819]
	ldrb	w2, [x0, 1811]
	ldr	w4, [x0, 1824]
	ldrb	w1, [x0, 1803]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_32x32, .-HEVC_WriteQmatrix_32x32
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_8x8
	.type	HEVC_WriteQmatrix_8x8, %function
HEVC_WriteQmatrix_8x8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 6
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1028]
	ldr	w3, [x0, 1044]
	ldr	w4, [x0, 1012]
	ldrb	w2, [x1, 612]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1036]
	ldr	w3, [x0, 1052]
	ldr	w4, [x0, 1020]
	ldrb	w2, [x0, 1004]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1045]
	ldrb	w4, [x0, 1029]
	ldr	w3, [x0, 1012]
	ldrb	w2, [x1, 613]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1053]
	ldrb	w4, [x0, 1037]
	ldr	w3, [x0, 1020]
	ldrb	w2, [x0, 1005]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1046]
	ldrb	w4, [x0, 1014]
	ldr	w3, [x0, 1028]
	ldrb	w2, [x1, 614]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1054]
	ldrb	w4, [x0, 1022]
	ldr	w3, [x0, 1036]
	ldrb	w2, [x0, 1006]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1031]
	ldrb	w3, [x0, 1015]
	ldr	w5, [x0, 1044]
	ldrb	w2, [x1, 615]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1039]
	ldrb	w3, [x0, 1023]
	ldr	w1, [x0, 1052]
	ldrb	w2, [x0, 1007]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1032]
	ldr	w2, [x0, 1048]
	ldr	w3, [x0, 1016]
	ldrb	w1, [x0, 1000]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1040]
	ldr	w2, [x0, 1056]
	ldr	w3, [x0, 1024]
	ldrb	w1, [x0, 1008]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1049]
	ldrb	w3, [x0, 1033]
	ldr	w2, [x0, 1016]
	ldrb	w1, [x0, 1001]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1057]
	ldrb	w3, [x0, 1041]
	ldr	w2, [x0, 1024]
	ldrb	w1, [x0, 1009]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1050]
	ldrb	w3, [x0, 1018]
	ldr	w2, [x0, 1032]
	ldrb	w1, [x0, 1002]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1058]
	ldrb	w3, [x0, 1026]
	ldr	w2, [x0, 1040]
	ldrb	w1, [x0, 1010]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1035]
	ldrb	w3, [x0, 1019]
	ldr	w1, [x0, 1048]
	ldrb	w2, [x0, 1003]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1043]
	ldrb	w2, [x0, 1027]
	ldr	w4, [x0, 1056]
	ldrb	w1, [x0, 1011]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_8x8, .-HEVC_WriteQmatrix_8x8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteQmatrix_16x16
	.type	HEVC_WriteQmatrix_16x16, %function
HEVC_WriteQmatrix_16x16:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x2
	mov	x21, x1
	bl	_mcount
	uxtw	x0, w20
	add	x1, x0, 12
	add	x0, x21, x0, lsl 6
	add	x1, x21, x1, lsl 6
	ldrb	w5, [x0, 1396]
	ldr	w3, [x0, 1404]
	ldr	w4, [x0, 1388]
	ldrb	w2, [x1, 612]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19]
	ldrb	w5, [x0, 1428]
	ldr	w3, [x0, 1436]
	ldr	w4, [x0, 1420]
	ldrb	w2, [x0, 1412]
	ubfiz	w4, w4, 8, 8
	orr	w4, w4, w5, lsl 16
	orr	w2, w2, w3, lsl 24
	orr	w2, w4, w2
	str	w2, [x19, 4]
	ldrb	w5, [x0, 1405]
	ldrb	w4, [x0, 1397]
	ldr	w3, [x0, 1388]
	ldrb	w2, [x1, 613]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 8]
	ldrb	w5, [x0, 1437]
	ldrb	w4, [x0, 1429]
	ldr	w3, [x0, 1420]
	ldrb	w2, [x0, 1413]
	lsl	w4, w4, 16
	and	w3, w3, 65280
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 12]
	ldrb	w5, [x0, 1406]
	ldrb	w4, [x0, 1390]
	ldr	w3, [x0, 1396]
	ldrb	w2, [x1, 614]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 16]
	ldrb	w5, [x0, 1438]
	ldrb	w4, [x0, 1422]
	ldr	w3, [x0, 1428]
	ldrb	w2, [x0, 1414]
	lsl	w4, w4, 8
	and	w3, w3, 16711680
	orr	w4, w4, w5, lsl 24
	orr	w2, w2, w3
	orr	w2, w4, w2
	str	w2, [x19, 20]
	ldrb	w4, [x0, 1399]
	ldrb	w3, [x0, 1391]
	ldr	w5, [x0, 1404]
	ldrb	w2, [x1, 615]
	lsl	w3, w3, 8
	and	w1, w5, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 24]
	ldrb	w4, [x0, 1431]
	ldrb	w3, [x0, 1423]
	ldr	w1, [x0, 1436]
	ldrb	w2, [x0, 1415]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 28]
	ldrb	w4, [x0, 1400]
	ldr	w2, [x0, 1408]
	ldr	w3, [x0, 1392]
	ldrb	w1, [x0, 1384]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 32]
	ldrb	w4, [x0, 1432]
	ldr	w2, [x0, 1440]
	ldr	w3, [x0, 1424]
	ldrb	w1, [x0, 1416]
	ubfiz	w3, w3, 8, 8
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2, lsl 24
	orr	w1, w3, w1
	str	w1, [x19, 36]
	ldrb	w4, [x0, 1409]
	ldrb	w3, [x0, 1401]
	ldr	w2, [x0, 1392]
	ldrb	w1, [x0, 1385]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 40]
	ldrb	w4, [x0, 1441]
	ldrb	w3, [x0, 1433]
	ldr	w2, [x0, 1424]
	ldrb	w1, [x0, 1417]
	lsl	w3, w3, 16
	and	w2, w2, 65280
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 44]
	ldrb	w4, [x0, 1410]
	ldrb	w3, [x0, 1394]
	ldr	w2, [x0, 1400]
	ldrb	w1, [x0, 1386]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 48]
	ldrb	w4, [x0, 1442]
	ldrb	w3, [x0, 1426]
	ldr	w2, [x0, 1432]
	ldrb	w1, [x0, 1418]
	lsl	w3, w3, 8
	and	w2, w2, 16711680
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 52]
	ldrb	w4, [x0, 1403]
	ldrb	w3, [x0, 1395]
	ldr	w1, [x0, 1408]
	ldrb	w2, [x0, 1387]
	lsl	w3, w3, 8
	and	w1, w1, -16777216
	orr	w3, w3, w4, lsl 16
	orr	w1, w1, w2
	orr	w1, w3, w1
	str	w1, [x19, 56]
	ldrb	w3, [x0, 1435]
	ldrb	w2, [x0, 1427]
	ldr	w4, [x0, 1440]
	ldrb	w1, [x0, 1419]
	lsl	w2, w2, 8
	and	w0, w4, -16777216
	orr	w2, w2, w3, lsl 16
	orr	w0, w0, w1
	orr	w0, w2, w0
	str	w0, [x19, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_WriteQmatrix_16x16, .-HEVC_WriteQmatrix_16x16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CtbRsAddrToTsAddr
	.type	HEVC_CtbRsAddrToTsAddr, %function
HEVC_CtbRsAddrToTsAddr:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x3, [x20, 29088]
	ldrb	w0, [x3, 13]
	cbz	w0, .L426
	ldp	w6, w11, [x3, 68]
	ldr	x0, [x20, 29080]
	mov	w1, 0
	subs	w8, w11, #1
	ldrb	w7, [x3, 15]
	sub	w12, w6, #1
	ldr	w4, [x0, 72]
	ldr	w5, [x0, 148]
	bmi	.L398
	.p2align 2
.L429:
	sxtw	x0, w1
	add	x9, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x9, x0, lsl 2
	cmp	w11, w1
	ldrsh	w2, [x2, 216]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L429
.L398:
	mov	w1, 0
	tbnz	w12, #31, .L396
	.p2align 2
.L428:
	sxtw	x0, w1
	add	x9, x29, 224
	add	x2, x0, 88
	add	w1, w1, 1
	add	x0, x9, x0, lsl 2
	cmp	w6, w1
	ldrsh	w2, [x3, x2, lsl 1]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bne	.L428
.L396:
	mov	w1, 1
	lsl	w0, w1, w5
	sdiv	w5, w4, w0
	msub	w0, w5, w0, w4
	cmp	w0, wzr
	csinc	w5, w5, w5, eq
	sdiv	w9, w19, w5
	msub	w5, w9, w5, w19
	cbz	w7, .L441
	tbnz	w8, #31, .L438
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	.p2align 2
.L410:
	tbnz	w12, #31, .L421
	add	x0, x29, 224
	mov	w7, w4
	add	x0, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x0, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L407
	.p2align 3
.L419:
	mov	w7, w4
.L407:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L405
	cmp	w9, w10
	blt	.L413
.L405:
	cmp	w6, w2
	mov	w1, w3
	bne	.L419
.L411:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L420
	cmp	w9, w10
	blt	.L436
.L420:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	bne	.L410
.L437:
	sub	w9, w9, w10
	mov	w1, w3
	mul	w0, w9, w0
	.p2align 2
.L403:
	sub	w19, w5, w1
	add	w0, w19, w0
	add	w19, w0, w7
.L426:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L441:
	tbnz	w8, #31, .L438
	mov	w14, 0
	mov	w13, 0
	mov	w4, 0
	mov	w7, 0
	mov	w8, 0
	mov	w0, 0
	tbnz	w12, #31, .L424
	.p2align 2
.L442:
	add	x0, x29, 224
	mov	w7, w4
	add	x3, x0, x13, sxtw 2
	mov	w1, 0
	mov	w2, 0
	ldr	w8, [x3, -172]
	add	w8, w8, 1
	add	w10, w14, w8
	b	.L414
	.p2align 3
.L422:
	mov	w7, w4
.L414:
	add	x0, x29, 224
	add	x0, x0, x2, sxtw 2
	add	w2, w2, 1
	ldr	w0, [x0, -84]
	add	w0, w0, 1
	add	w3, w0, w1
	cmp	w5, w3
	madd	w4, w0, w8, w4
	bge	.L412
	cmp	w9, w10
	blt	.L413
.L412:
	cmp	w6, w2
	mov	w1, w3
	bne	.L422
.L418:
	add	w1, w0, w3
	cmp	w5, w1
	bge	.L423
	cmp	w9, w10
	blt	.L436
.L423:
	add	w13, w13, 1
	mov	w14, w10
	cmp	w11, w13
	beq	.L437
	tbz	w12, #31, .L442
.L424:
	mov	w3, 0
	add	w10, w14, w8
	b	.L418
	.p2align 3
.L413:
	sub	w9, w9, w14
	mul	w0, w9, w0
	b	.L403
.L421:
	mov	w3, 0
	add	w10, w14, w8
	b	.L411
.L438:
	mov	w0, 0
	mov	w1, 0
	mov	w7, 0
	b	.L403
.L436:
	sub	w9, w9, w14
	mov	w1, w3
	mul	w0, w9, w0
	b	.L403
	.size	HEVC_CtbRsAddrToTsAddr, .-HEVC_CtbRsAddrToTsAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CtbTsAddrToRsAddr
	.type	HEVC_CtbTsAddrToRsAddr, %function
HEVC_CtbTsAddrToRsAddr:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x3, [x20, 29088]
	ldrb	w0, [x3, 13]
	cbz	w0, .L461
	ldp	w8, w4, [x3, 68]
	ldr	x0, [x20, 29080]
	subs	w13, w4, #1
	sub	w12, w8, #1
	ldr	w5, [x0, 72]
	ldr	w6, [x0, 148]
	bmi	.L445
	mov	w1, 0
	.p2align 2
.L446:
	sxtw	x0, w1
	add	x7, x29, 224
	add	w1, w1, 1
	add	x2, x3, x0, lsl 1
	add	x0, x7, x0, lsl 2
	cmp	w4, w1
	ldrsh	w2, [x2, 216]
	sub	w2, w2, #1
	str	w2, [x0, -172]
	bne	.L446
	tbnz	w12, #31, .L478
.L448:
	mov	w1, 0
	.p2align 2
.L451:
	sxtw	x0, w1
	add	x4, x29, 224
	add	x2, x0, 88
	add	w1, w1, 1
	add	x0, x4, x0, lsl 2
	cmp	w12, w1
	ldrsh	w2, [x3, x2, lsl 1]
	sub	w2, w2, #1
	str	w2, [x0, -84]
	bge	.L451
	mov	w1, 1
	lsl	w0, w1, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	tbnz	w13, #31, .L449
.L450:
	ldr	w11, [x29, 140]
	mov	w10, 0
	mov	w9, 0
	mov	w4, 0
	mov	w1, 0
	mov	w7, 0
	mov	w2, 0
	add	w11, w11, 1
	.p2align 2
.L457:
	tbnz	w12, #31, .L463
	add	x1, x29, 224
	add	x1, x1, x9, sxtw 2
	ldr	w7, [x1, -172]
	add	w7, w7, 1
	madd	w5, w11, w7, w4
	cmp	w19, w5
	blt	.L464
	mov	w1, w4
	mov	w2, w11
	mov	w6, 0
	mov	w3, 0
	mov	w4, w5
	b	.L454
	.p2align 3
.L455:
	ldr	w2, [x5, -84]
	mov	w1, w4
	add	w2, w2, 1
	madd	w5, w2, w7, w4
	cmp	w5, w19
	bgt	.L456
	mov	w4, w5
.L454:
	add	w3, w3, 1
	add	x5, x29, 224
	cmp	w8, w3
	add	w6, w6, w2
	add	x5, x5, x3, sxtw 2
	bne	.L455
.L458:
	cmp	w4, w19
	bgt	.L462
	add	w9, w9, 1
	add	w10, w10, w7
	cmp	w13, w9
	bge	.L457
.L462:
	mov	w4, w1
	.p2align 2
.L456:
	cbz	w2, .L449
	sub	w4, w19, w4
	sdiv	w1, w4, w2
	add	w10, w1, w10
	msub	w4, w1, w2, w4
	add	w6, w4, w6
	madd	w0, w10, w0, w6
.L473:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L461:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 224
	ret
.L463:
	mov	w6, 0
	b	.L458
.L464:
	mov	w2, w11
	mov	w6, 0
	b	.L456
.L478:
	mov	w0, 1
	lsl	w0, w0, w6
	sdiv	w1, w5, w0
	msub	w0, w1, w0, w5
	cmp	w0, wzr
	csinc	w0, w1, w1, eq
	b	.L450
.L445:
	tbz	w12, #31, .L448
.L449:
	ldr	x1, .LC132
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L473
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	3
.LC132:
	.xword	.LC131
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcTileMap
	.type	HEVC_CalcTileMap, %function
HEVC_CalcTileMap:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 65536
	bl	_mcount
	ldr	x22, .LC133
	ldr	x20, .LC134
	mov	x2, 16384
	movk	x2, 0x2, lsl 16
	mov	w1, 0
	ldr	x3, [x22, 96]
	add	x0, x20, 1792
	blr	x3
	ldr	x0, .LC135
	mov	x2, 36864
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 1280
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 880
	mov	w1, 0
	add	x0, x21, 1396
	blr	x3
	str	wzr, [x21, 1392]
	ldr	x2, [x19, 29088]
	ldr	x1, [x19, 29080]
	ldr	w0, [x2, 72]
	ldr	w10, [x1, 240]
	cbz	w0, .L479
	mov	w14, 0
	mov	w16, 0
	mov	w4, 0
.L488:
	ldr	w0, [x2, 68]
	uxtw	x15, w14
	cbz	w0, .L489
	add	x9, x15, 104
	ldr	w1, [x21, 1392]
	mul	w13, w16, w10
	mov	w11, 0
	mov	w12, 0
	lsl	x9, x9, 1
.L487:
	uxtw	x0, w1
	add	x3, x2, x9
	add	x5, x0, 8192
	add	x5, x19, x5, lsl 3
	str	w4, [x5, 1396]
	uxtw	x5, w11
	ldrsh	w3, [x3, 8]
	cbz	w3, .L483
	add	w8, w12, w13
	mov	w7, 0
	uxtw	x5, w11
	.p2align 2
.L485:
	add	x1, x5, 88
	mov	w0, w4
	sub	w6, w8, w4
	ldrsh	w1, [x2, x1, lsl 1]
	cbz	w1, .L486
	.p2align 2
.L493:
	add	x2, x20, 1792
	add	w3, w6, w0
	add	x1, x5, 88
	str	w3, [x2, w0, sxtw 2]
	add	w0, w0, 1
	sub	w3, w0, w4
	ldr	x2, [x19, 29088]
	ldrsh	w1, [x2, x1, lsl 1]
	cmp	w1, w3
	bhi	.L493
	mov	w4, w0
.L486:
	add	x0, x2, x9
	add	w7, w7, 1
	add	w8, w8, w10
	ldrsh	w0, [x0, 8]
	cmp	w0, w7
	bhi	.L485
	ldr	w1, [x21, 1392]
	uxtw	x0, w1
.L483:
	add	x0, x19, x0, lsl 3
	sub	w3, w4, #1
	add	x0, x0, 65536
	add	w1, w1, 1
	add	x5, x5, 88
	add	w11, w11, 1
	str	w3, [x0, 1400]
	str	w1, [x21, 1392]
	ldr	w3, [x2, 68]
	ldrsh	w0, [x2, x5, lsl 1]
	cmp	w3, w11
	add	w12, w12, w0
	bhi	.L487
.L489:
	add	x15, x2, x15, lsl 1
	ldr	w0, [x2, 72]
	add	w14, w14, 1
	cmp	w0, w14
	ldrsh	w0, [x15, 216]
	add	w16, w16, w0
	bhi	.L488
.L479:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	3
.LC133:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC134:
	.xword	.LANCHOR2
	.align	3
.LC135:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WritePicMsg
	.type	HEVC_WritePicMsg, %function
HEVC_WritePicMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 53248
	add	x19, x20, 61440
	bl	_mcount
	add	x22, x20, 65536
	ldr	x1, .LC138
	mov	w0, 2
	ldr	w3, [x21, 2052]
	ldr	w2, [x21, 2268]
	bl	dprint_vfmw
	ldr	x1, .LC140
	mov	w0, 4
	bl	dprint_vfmw
	ldr	w0, [x21, 2252]
	mov	x2, 64
	str	w0, [x19, 3928]
	add	x1, x20, 3416
	add	x0, x19, 2760
	ldr	w3, [x21, 2132]
	ldr	w4, [x21, 2136]
	sub	w4, w4, w3
	str	w4, [x19, 3932]
	ldr	w4, [x21, 2268]
	str	w4, [x19, 3920]
	ldr	w4, [x21, 2052]
	str	w4, [x19, 3924]
	ldr	w4, [x21, 2256]
	str	w4, [x19, 3936]
	ldr	w4, [x21, 2260]
	str	w4, [x19, 3940]
	ldr	w4, [x21, 2264]
	str	w4, [x19, 3944]
	ldr	w4, [x21, 2156]
	sub	w3, w4, w3
	str	w3, [x19, 3948]
	ldr	w3, [x21, 2160]
	sub	w3, w3, w4
	str	w3, [x19, 3952]
	str	wzr, [x20, 208]
	ldr	x3, [x22, 3888]
	str	x3, [x22, 1160]
	ldr	x3, [x20, 29080]
	ldrb	w4, [x3, 12]
	strb	w4, [x19, 2640]
	ldrb	w4, [x3, 5]
	strb	w4, [x19, 2641]
	ldrb	w4, [x3, 9]
	strb	w4, [x19, 2642]
	ldrb	w4, [x3, 8]
	strb	w4, [x19, 2643]
	ldrb	w4, [x3, 7]
	strb	w4, [x19, 2644]
	ldr	w4, [x3, 64]
	str	w4, [x19, 2648]
	ldr	w4, [x3, 116]
	strb	w4, [x19, 2652]
	ldr	w4, [x3, 244]
	sub	w4, w4, #1
	str	w4, [x19, 2656]
	ldr	w4, [x3, 240]
	sub	w4, w4, #1
	str	w4, [x19, 2660]
	ldr	w4, [x21, 2024]
	str	w4, [x19, 2664]
	ldr	x4, [x20, 29088]
	ldr	w5, [x4, 84]
	sub	w5, w5, #2
	str	w5, [x19, 2668]
	ldrb	w5, [x4, 11]
	strb	w5, [x19, 2672]
	ldrb	w4, [x4, 10]
	strb	w4, [x19, 2673]
	ldr	w4, [x3, 200]
	str	w4, [x19, 2676]
	ldr	w4, [x3, 208]
	str	w4, [x19, 2680]
	ldr	w4, [x3, 188]
	str	w4, [x19, 2684]
	ldr	w4, [x3, 196]
	str	w4, [x19, 2688]
	ldr	w4, [x3, 172]
	str	w4, [x19, 2692]
	ldr	w4, [x3, 180]
	str	w4, [x19, 2696]
	ldr	w4, [x3, 216]
	str	w4, [x19, 2700]
	ldr	w4, [x3, 140]
	str	w4, [x19, 2704]
	ldr	w4, [x3, 148]
	str	w4, [x19, 2708]
	ldr	x4, .LC141
	ldr	w5, [x3, 112]
	str	w5, [x19, 2712]
	ldr	x4, [x4, 104]
	ldr	w5, [x3, 104]
	str	w5, [x19, 2716]
	ldr	w5, [x3, 124]
	str	w5, [x19, 2720]
	ldr	w5, [x3, 120]
	str	w5, [x19, 2724]
	ldr	w5, [x3, 108]
	str	w5, [x19, 2728]
	ldr	w3, [x3, 100]
	str	w3, [x19, 2732]
	blr	x4
	ldr	x4, [x20, 29080]
	add	x3, x22, 1000
	add	x2, x22, 920
	add	x1, x22, 408
	mov	x0, x20
	ldr	w5, [x4, 76]
	str	w5, [x19, 2824]
	ldr	w4, [x4, 72]
	str	w4, [x19, 2828]
	bl	HEVC_CalcTileInfo
	cbnz	w0, .L519
	ldr	x1, [x20, 29088]
	mov	w0, 0
	ldrb	w2, [x1, 16]
	strb	w2, [x19, 2852]
	ldrb	w2, [x1, 7]
	strb	w2, [x19, 2853]
	ldrb	w2, [x1, 3]
	strb	w2, [x19, 2854]
	ldrb	w2, [x1, 14]
	strb	w2, [x19, 2855]
	ldrb	w2, [x1, 15]
	strb	w2, [x19, 2856]
	ldrb	w2, [x1, 13]
	strb	w2, [x19, 2857]
	ldr	x2, [x20, 29080]
	ldr	w3, [x1, 56]
	ldr	w2, [x2, 148]
	sub	w2, w2, w3
	str	w2, [x1, 88]
	ldr	x1, [x20, 29088]
	ldr	w2, [x1, 88]
	str	w2, [x19, 2860]
	ldr	w2, [x1, 52]
	str	w2, [x19, 2864]
	ldrb	w2, [x1, 8]
	strb	w2, [x19, 2868]
	ldrb	w2, [x1, 12]
	strb	w2, [x19, 2869]
	ldrb	w2, [x1, 6]
	strb	w2, [x19, 2870]
	ldr	w2, [x1, 60]
	str	w2, [x19, 2872]
	ldr	w2, [x1, 64]
	str	w2, [x19, 2876]
	ldr	w2, [x1, 72]
	sub	w2, w2, #1
	str	w2, [x19, 2880]
	ldr	w2, [x1, 68]
	sub	w2, w2, #1
	str	w2, [x19, 2884]
	ldrb	w2, [x1, 10]
	strb	w2, [x19, 2673]
	ldrb	w1, [x1, 11]
	strb	w1, [x19, 2672]
	str	wzr, [x20, 236]
	ldr	w1, [x20, 220]
	cmp	w1, 1
	beq	.L501
	ldr	x1, [x21, 2080]
	ldr	w0, [x20, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L520
	ldr	x2, [x0, 680]
	ldr	x3, [x0, 688]
	cbz	x2, .L504
	cbz	x3, .L504
	ldr	w0, [x20, 276]
	add	x3, x22, 148
	add	x2, x19, 3976
	add	x1, x22, 8
	bl	FSP_GetDecFsAddrTab
	ldr	x0, [x23, 680]
	add	x1, x22, 140
	add	x2, x22, 12
	ldr	w0, [x0, 8]
	str	w0, [x19, 3920]
	ldr	w0, [x20, 276]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x21, 2052]
	str	w0, [x19, 3924]
	mov	w0, 0
	ldr	w1, [x23, 708]
	str	w1, [x22, 144]
	ldr	x1, [x23, 688]
	ldr	w1, [x1, 16]
	str	w1, [x22, 1384]
	ldr	x1, [x23, 688]
	ldr	w1, [x1, 76]
	str	w1, [x22, 1388]
	ldr	w3, [x20, 3280]
	str	w3, [x22, 1152]
	cbz	w3, .L509
	.p2align 2
.L513:
	add	x1, x20, x0, sxtw 2
	add	w0, w0, 1
	add	x2, x1, 65536
	cmp	w0, w3
	ldr	w1, [x1, 3352]
	str	w1, [x2, 1088]
	bne	.L513
.L509:
	add	x23, x19, 2892
	mov	w22, 0
.L507:
	mov	x2, x23
	mov	w0, w22
	mov	x1, x20
	add	w22, w22, 1
	add	x23, x23, 64
	bl	HEVC_WriteQmatrix_8x8
	cmp	w22, 4
	bne	.L507
	mov	w0, w22
	add	x2, x19, 3148
	mov	x1, x20
	add	x23, x19, 3404
	mov	w22, 2
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x19, 3212
	mov	x1, x20
	mov	w0, 5
	bl	HEVC_WriteQmatrix_8x8
	add	x2, x19, 3276
	mov	x1, x20
	mov	w0, 0
	bl	HEVC_WriteQmatrix_16x16
	add	x2, x19, 3340
	mov	x1, x20
	mov	w0, 1
	bl	HEVC_WriteQmatrix_16x16
.L510:
	mov	x2, x23
	mov	w0, w22
	mov	x1, x20
	add	w22, w22, 1
	add	x23, x23, 64
	bl	HEVC_WriteQmatrix_16x16
	cmp	w22, 6
	bne	.L510
	add	x2, x19, 3660
	mov	x1, x20
	mov	w0, 0
	add	x23, x19, 3788
	mov	w22, 0
	bl	HEVC_WriteQmatrix_32x32
	add	x2, x19, 3724
	mov	x1, x20
	mov	w0, 1
	bl	HEVC_WriteQmatrix_32x32
	.p2align 2
.L511:
	mov	x2, x23
	mov	w0, w22
	mov	x1, x20
	add	w22, w22, 1
	add	x23, x23, 16
	bl	HEVC_WriteQmatrix_4x4
	cmp	w22, 6
	bne	.L511
	add	x5, x20, 2048
	add	x6, x20, 2304
	mov	w0, 0
	ldp	w3, w4, [x5, 252]
	ldp	w1, w2, [x5, 244]
	lsl	w3, w3, 16
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2, lsl 8
	orr	w1, w3, w1
	str	w1, [x19, 3884]
	ldp	w3, w4, [x6, 12]
	ldp	w1, w2, [x6, 4]
	lsl	w3, w3, 16
	orr	w3, w3, w4, lsl 24
	orr	w1, w1, w2, lsl 8
	orr	w1, w3, w1
	str	w1, [x19, 3888]
	ldr	w1, [x21, 2052]
	str	w1, [x19, 3916]
.L501:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L519:
	ldr	x2, .LC142
	mov	w0, 1
	ldr	x1, .LC144
	add	x2, x2, 216
	bl	dprint_vfmw
	mov	w0, -1
	b	.L501
.L504:
	ldr	x1, .LC148
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L501
.L520:
	ldr	x2, [x21, 2080]
	mov	w0, 1
	ldr	x1, .LC146
	ldr	w2, [x2, 32]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L501
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC141:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC142:
	.xword	.LANCHOR1
	.align	3
.LC144:
	.xword	.LC143
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC148:
	.xword	.LC147
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckListX
	.type	HEVC_CheckListX, %function
HEVC_CheckListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 53248
	add	x0, x0, 2752
	ldrb	w1, [x0, 3]
	cbz	w1, .L523
	ldrsb	w1, [x19, 9]
	add	x0, x19, 57344
	add	x0, x0, 2388
	cbz	w1, .L555
.L523:
	ldp	w4, w5, [x0, 160]
	cmp	w4, 16
	bhi	.L556
	cmp	w5, 16
	bhi	.L527
	cbz	w4, .L528
	ldr	x0, [x19, 2400]
	cbz	x0, .L541
	ldr	x0, [x0, 40]
	cbz	x0, .L557
	add	x0, x19, 2408
	mov	w2, 0
	b	.L533
	.p2align 3
.L534:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L529
	ldr	x1, [x1, 40]
	cbz	x1, .L530
.L533:
	add	w2, w2, 1
	cmp	w4, w2
	bne	.L534
.L528:
	cbz	w5, .L543
	ldr	x0, [x19, 2536]
	cbz	x0, .L544
	ldr	x0, [x0, 40]
	cbz	x0, .L558
	add	x0, x19, 2544
	mov	w2, 0
	b	.L539
	.p2align 3
.L540:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L535
	ldr	x1, [x1, 40]
	cbz	x1, .L536
.L539:
	add	w2, w2, 1
	cmp	w5, w2
	bne	.L540
.L543:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L541:
	mov	w2, 0
	.p2align 2
.L529:
	ldr	x1, .LC157
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L525:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L557:
	mov	w2, 0
.L530:
	ldr	x1, .LC159
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L544:
	mov	w2, 0
.L535:
	ldr	x1, .LC161
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L558:
	mov	w2, 0
.L536:
	ldr	x1, .LC163
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L555:
	ldr	x2, .LC149
	mov	w0, 0
	ldr	x1, .LC151
	add	x2, x2, 240
	bl	dprint_vfmw
	mov	w0, -1
	b	.L525
.L527:
	ldr	x1, .LC155
	mov	w3, 17
	mov	w2, w5
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L525
.L556:
	ldr	x1, .LC153
	mov	w3, 17
	mov	w2, w4
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L525
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	3
.LC149:
	.xword	.LANCHOR1
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC163:
	.xword	.LC162
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_CheckListX
	mov	w23, w0
	cbnz	w0, .L601
	ldr	w3, [x19, 144]
	ldr	w20, [x19, 208]
	cmp	w20, w3
	bcs	.L641
	add	x24, x19, 65536
	mov	w21, 1368
	ldr	x22, .LC166
	mov	x2, 1368
	umull	x20, w20, w21
	ldr	x0, [x24, 3888]
	mov	w1, 0
	ldr	x3, [x22, 96]
	add	x20, x0, x20
	mov	x0, x20
	blr	x3
	ldr	x3, [x22, 96]
	mov	w1, 0
	mov	x2, 64
	add	x0, x29, 96
	blr	x3
	ldr	w0, [x19, 208]
	ldr	w1, [x19, 144]
	add	w0, w0, 1
	str	w0, [x19, 208]
	cmp	w0, w1
	bcc	.L642
	str	xzr, [x20, 1360]
.L563:
	ldr	w0, [x19, 248]
	add	x25, x19, 53248
	add	x26, x19, 69632
	add	w1, w0, 1
	uxtw	x0, w0
	ldr	w2, [x25, 2828]
	add	x0, x0, 16384
	add	x0, x0, 976
	str	w2, [x19, x0, lsl 2]
	str	w1, [x19, 248]
	ldr	w21, [x19, 172]
	add	w0, w21, 1
	str	w0, [x19, 172]
	lsl	x21, x0, 5
	ldr	x1, [x26, 608]
	add	x21, x21, x0, lsl 3
	ldr	w2, [x25, 2812]
	add	x0, x1, x21
	str	w2, [x0, 8]
	ldr	x3, [x19, 2392]
	ldrb	w1, [x3, 1]
	ldr	w0, [x3, 8]
	cmp	w1, 1
	ccmp	w1, w0, 2, ls
	bcs	.L564
	.p2align 2
.L565:
	uxtw	x2, w1
	add	x0, x2, 2
	lsl	x0, x0, 5
	add	x2, x20, x2, lsl 2
	add	x3, x3, x0
	ldr	w3, [x3, 4]
	str	w3, [x2, 8]
	ldr	x3, [x19, 2392]
	ldr	w3, [x3, x0]
	str	w3, [x20, w1, uxtw 2]
	add	w1, w1, 1
	ldr	x3, [x19, 2392]
	add	x0, x3, x0
	ldr	w0, [x0, 8]
	str	w0, [x2, 16]
	ldr	x3, [x19, 2392]
	ldr	w0, [x3, 8]
	cmp	w0, w1
	ccmp	w1, 1, 2, hi
	bls	.L565
.L564:
	cmp	w0, 1
	bhi	.L570
	.p2align 2
.L625:
	add	x1, x20, x0, uxtw 2
	str	wzr, [x1, 8]
	str	wzr, [x20, w0, uxtw 2]
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 16]
	bne	.L625
.L570:
	ldrb	w0, [x25, 2755]
	add	x27, x19, 57344
	cbz	w0, .L643
.L568:
	ldr	w0, [x27, 2548]
	cbz	w0, .L571
	mov	w2, 0
	.p2align 2
.L572:
	uxtw	x0, w2
	add	x6, x29, 160
	add	w2, w2, 1
	add	x4, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x5, [x4, 2400]
	ldr	x3, [x5, 40]
	ldp	w1, w3, [x3, 24]
	add	x1, x1, 16384
	add	x3, x6, x3, lsl 2
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 12]
	str	w1, [x3, -64]
	ldr	w1, [x5, 16]
	str	w1, [x0, 116]
	ldr	x1, [x4, 2400]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 28]
	str	w1, [x0, 372]
	ldr	w0, [x27, 2548]
	cmp	w0, w2
	bhi	.L572
	ldr	w3, [x27, 2552]
	cbz	w3, .L573
.L600:
	mov	w2, 0
	.p2align 2
.L574:
	uxtw	x0, w2
	add	x6, x29, 160
	add	w2, w2, 1
	add	x4, x19, x0, lsl 3
	add	x0, x20, x0, lsl 2
	ldr	x5, [x4, 2536]
	ldr	x3, [x5, 40]
	ldp	w1, w3, [x3, 24]
	add	x1, x1, 16384
	add	x3, x6, x3, lsl 2
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 12]
	str	w1, [x3, -64]
	ldr	w1, [x5, 16]
	str	w1, [x0, 180]
	ldr	x1, [x4, 2536]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 28]
	str	w1, [x0, 436]
	ldr	w3, [x27, 2552]
	cmp	w3, w2
	bhi	.L574
	ldr	w0, [x27, 2548]
.L573:
	cbz	w0, .L575
	ldr	w1, [x20, 372]
	ldr	w4, [x25, 2024]
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 3416]
	cmp	w4, w1
	blt	.L607
	sub	w0, w0, #1
	add	x2, x20, x0, lsl 2
	mov	x0, x20
	b	.L578
	.p2align 3
.L579:
	ldr	w1, [x0, 376]
	add	x0, x0, 4
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 3416]
	cmp	w1, w4
	bgt	.L607
.L578:
	cmp	x2, x0
	bne	.L579
.L575:
	ldr	w0, [x27, 2448]
	cbnz	w0, .L640
	mov	w0, 1
	cbz	w3, .L576
	ldr	w0, [x20, 436]
	ldr	w2, [x25, 2024]
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 3416]
	cmp	w2, w0
	blt	.L607
	sub	w3, w3, #1
	mov	x0, x20
	add	x3, x20, x3, lsl 2
	b	.L581
	.p2align 3
.L582:
	ldr	w1, [x0, 440]
	add	x0, x0, 4
	add	x1, x19, x1, lsl 2
	ldr	w1, [x1, 3416]
	cmp	w1, w2
	bgt	.L607
.L581:
	cmp	x3, x0
	bne	.L582
.L640:
	mov	w0, 1
.L576:
	strb	w0, [x20, 24]
	ldrb	w0, [x25, 2755]
	strb	w0, [x20, 25]
	ldr	w2, [x27, 2444]
	str	w2, [x20, 28]
	ldrb	w0, [x27, 2398]
	strb	w0, [x20, 32]
	ldr	w0, [x27, 2468]
	str	w0, [x20, 36]
	ldr	w0, [x19, 220]
	cbnz	w0, .L583
	ldr	x3, [x25, 2080]
	ldr	w4, [x19, 208]
	ldr	w0, [x3, 444]
	sub	w1, w4, #1
	madd	w0, w1, w0, w2
	udiv	w0, w0, w4
	str	w0, [x3, 72]
.L583:
	ldr	w0, [x27, 2448]
	cbz	w0, .L644
	cmp	w0, 1
	mov	w28, 0
	beq	.L585
.L586:
	str	w28, [x20, 40]
	ldr	w0, [x27, 2500]
	str	w0, [x20, 48]
	ldrb	w0, [x27, 2399]
	strb	w0, [x20, 52]
	ldr	w0, [x27, 2504]
	str	w0, [x20, 44]
	ldr	w0, [x27, 2556]
	cbz	w0, .L587
	sub	w0, w0, #1
	str	w0, [x20, 60]
.L588:
	ldr	w0, [x27, 2560]
	cbz	w0, .L589
	sub	w0, w0, #1
	str	w0, [x20, 56]
.L590:
	ldrb	w0, [x27, 2395]
	strb	w0, [x20, 64]
	mov	x0, x19
	ldrb	w1, [x27, 2397]
	strb	w1, [x20, 65]
	ldr	w1, [x27, 2548]
	str	w1, [x20, 68]
	ldr	w1, [x27, 2552]
	str	w1, [x20, 72]
	ldr	w1, [x27, 2448]
	str	w1, [x20, 76]
	ldr	w1, [x25, 2832]
	str	w1, [x20, 80]
	ldr	x1, [x19, 29080]
	ldr	w3, [x25, 2832]
	ldr	w1, [x1, 240]
	udiv	w2, w3, w1
	msub	w1, w2, w1, w3
	str	w1, [x20, 84]
	ldr	x1, [x19, 29080]
	ldr	w2, [x1, 240]
	ldr	w1, [x25, 2832]
	udiv	w1, w1, w2
	str	w1, [x20, 88]
	ldr	w1, [x25, 2832]
	bl	HEVC_CtbRsAddrToTsAddr
	str	w0, [x20, 92]
	ldr	w0, [x27, 2512]
	str	w0, [x20, 96]
	ldr	w0, [x27, 2516]
	str	w0, [x20, 100]
	ldr	w0, [x27, 2524]
	str	w0, [x20, 104]
	ldr	w0, [x27, 2520]
	str	w0, [x20, 108]
	ldrb	w0, [x27, 2394]
	strb	w0, [x20, 112]
	ldrb	w0, [x27, 2393]
	strb	w0, [x20, 113]
	ldrb	w0, [x27, 2401]
	strb	w0, [x20, 114]
	ldrb	w0, [x27, 2402]
	strb	w0, [x20, 115]
	ldr	x0, [x19, 29088]
	ldrb	w1, [x0, 10]
	cbz	w1, .L591
	ldr	w1, [x27, 2448]
	cmp	w1, 1
	beq	.L592
.L591:
	ldrb	w0, [x0, 11]
	cmp	w0, 1
	beq	.L593
	add	x25, x19, 61440
.L594:
	ldrb	w0, [x27, 2395]
	cbz	w0, .L596
	add	x0, x29, 160
	add	x28, x0, x28, sxtw 2
	ldr	w0, [x28, -64]
	str	w0, [x20, 564]
.L596:
	ldr	w0, [x19, 220]
	cbnz	w0, .L597
	ldr	x0, [x26, 608]
	ldr	x1, [x19, 2392]
	add	x21, x0, x21
	str	x1, [x21, 32]
	str	xzr, [x19, 2392]
.L597:
	ldrb	w0, [x25, 2857]
	cbz	w0, .L616
	ldr	w0, [x19, 248]
	cmp	w0, 1
	beq	.L645
	sub	w1, w0, #2
	sub	w0, w0, #1
	ldr	w3, [x20, 92]
	add	x2, x0, 8192
	add	x1, x19, x1, lsl 3
	add	x1, x1, 65536
	add	x2, x19, x2, lsl 3
	sub	w3, w3, #1
	str	w3, [x1, 2280]
	ldr	w1, [x20, 92]
	str	w1, [x2, 2276]
.L599:
	ldr	w1, [x25, 2656]
	add	x0, x19, x0, lsl 3
	ldr	w2, [x25, 2660]
	add	x0, x0, 65536
	mov	w3, 36863
	madd	w2, w1, w2, w2
	add	w1, w2, w1
	str	w1, [x0, 2280]
	ldr	w1, [x20, 92]
	sub	w1, w1, #1
	cmp	w1, w3
	bhi	.L616
	mov	x0, x19
	bl	HEVC_CtbTsAddrToRsAddr
	str	w0, [x20, 568]
.L616:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L642:
	ldr	x1, [x24, 3888]
	umull	x0, w0, w21
	add	x0, x1, x0
	str	x0, [x20, 1360]
	b	.L563
	.p2align 3
.L607:
	mov	w0, 0
	b	.L576
	.p2align 3
.L589:
	str	wzr, [x20, 56]
	b	.L590
	.p2align 3
.L587:
	str	wzr, [x20, 60]
	b	.L588
	.p2align 3
.L644:
	ldrb	w0, [x27, 2399]
	cbnz	w0, .L585
	ldrsw	x0, [x27, 2500]
	add	x0, x20, x0, lsl 2
	ldr	w28, [x0, 436]
	b	.L586
	.p2align 3
.L585:
	ldrsw	x0, [x27, 2500]
	add	x0, x20, x0, lsl 2
	ldr	w28, [x0, 372]
	b	.L586
	.p2align 3
.L643:
	ldr	x3, [x22, 104]
	mov	x2, 3732
	add	x1, x25, 2752
	add	x0, x27, 2388
	blr	x3
	mov	w0, 1
	strb	w0, [x19, 9]
	b	.L568
	.p2align 3
.L593:
	ldr	w0, [x27, 2448]
	add	x25, x19, 61440
	cbnz	w0, .L594
.L592:
	add	x25, x19, 61440
	ldr	w0, [x27, 3980]
	str	w0, [x20, 580]
	mov	x2, 64
	ldr	x3, [x22, 104]
	add	x1, x25, 920
	ldr	w4, [x25, 916]
	add	x0, x20, 588
	str	w4, [x20, 584]
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 64
	add	x1, x25, 84
	add	x0, x20, 716
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x25, 984
	add	x0, x20, 844
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x25, 1112
	add	x0, x20, 1100
	blr	x3
	ldr	w0, [x27, 2448]
	cbnz	w0, .L594
	ldr	x3, [x22, 104]
	add	x1, x25, 1240
	mov	x2, 64
	add	x0, x20, 652
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x25, 596
	mov	x2, 64
	add	x0, x20, 780
	blr	x3
	ldr	x3, [x22, 104]
	add	x1, x25, 1304
	mov	x2, 128
	add	x0, x20, 972
	blr	x3
	ldr	x3, [x22, 104]
	mov	x2, 128
	add	x1, x25, 1432
	add	x0, x20, 1228
	blr	x3
	b	.L594
	.p2align 3
.L645:
	ldr	w1, [x20, 92]
	mov	x0, 0
	str	w1, [x24, 2276]
	b	.L599
.L571:
	ldr	w0, [x27, 2552]
	cbnz	w0, .L600
	mov	w0, 1
	b	.L576
.L601:
	mov	w23, -1
	b	.L616
.L641:
	ldr	x1, .LC165
	mov	w2, w20
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L616
	.size	HEVC_WriteSliceMsg, .-HEVC_WriteSliceMsg
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC166:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetVirAddr
	.type	HEVC_GetVirAddr, %function
HEVC_GetVirAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x19, x20, uxtw 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetVirAddr, .-HEVC_GetVirAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetPhyAddr
	.type	HEVC_GetPhyAddr, %function
HEVC_GetPhyAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	w0, w19, w20, lsl 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetPhyAddr, .-HEVC_GetPhyAddr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CfgVDMReg
	.type	HEVC_CfgVDMReg, %function
HEVC_CfgVDMReg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 53248
	add	x1, x19, 61440
	add	x3, x19, 65536
	mov	w0, 0
	ldr	w4, [x2, 2044]
	cmp	w4, wzr
	cset	w4, eq
	str	w4, [x1, 3972]
	ldr	w2, [x2, 2048]
	str	w2, [x1, 3964]
	ldr	w1, [x19, 208]
	str	w1, [x3, 1156]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsRefForCurrPic
	.type	HEVC_IsRefForCurrPic, %function
HEVC_IsRefForCurrPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 53248
	bl	_mcount
	ldr	w4, [x19, 156]
	ldr	w3, [x21, 2828]
	tbnz	w3, #31, .L651
	cmp	w3, w4
	bge	.L651
	ldr	x0, [x19, 2368]
	mov	w1, 2024
	ldr	w4, [x19, 152]
	smaddl	x3, w3, w1, x0
	ldr	w3, [x3, 32]
	tbnz	w3, #31, .L655
	cmp	w3, w4
	bge	.L655
	add	x20, x19, 57344
	ldr	x2, [x19, 2360]
	mov	w4, 26164
	mov	w0, 1
	smaddl	x3, w3, w4, x2
	ldr	w5, [x20, 1940]
	ldr	w6, [x20, 1944]
	ldr	w9, [x20, 1948]
	add	w8, w5, w6
	ldr	w2, [x3, 128]
	cmp	w8, w9
	mov	w3, w8
	lsl	w2, w0, w2
	bcs	.L667
	cmp	w8, 15
	bgt	.L658
	ldr	w4, [x21, 2024]
	b	.L660
	.p2align 3
.L678:
	cmp	w9, w3
	bls	.L667
	cmp	w3, 16
	beq	.L658
.L660:
	add	x0, x19, x3, sxtw 2
	mov	w1, w4
	add	x0, x0, 57344
	add	w3, w3, 1
	ldr	w7, [x0, 180]
	ldr	w0, [x0, 2064]
	cbnz	w7, .L661
	sdiv	w1, w4, w2
	sdiv	w7, w0, w2
	msub	w1, w1, w2, w4
	msub	w0, w7, w2, w0
.L661:
	cmp	w1, w0
	bne	.L678
	mov	w19, 1
.L657:
	cbz	w8, .L653
	ldr	w0, [x20, 1996]
	add	x1, x20, 2000
	ldr	w3, [x21, 2800]
	mov	w4, 0
	ldr	w2, [x21, 2024]
	add	w0, w3, w0
	cmp	w2, w0
	bne	.L665
	b	.L671
	.p2align 3
.L664:
	ldr	w0, [x1], 4
	add	w0, w3, w0
	cmp	w0, w2
	beq	.L671
.L665:
	add	w4, w4, 1
	cmp	w4, w8
	beq	.L653
	cmp	w4, 17
	bne	.L664
	ldr	x1, .LC174
	mov	w3, w4
	mov	w2, 7110
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L655:
	ldr	x1, .LC170
	mov	w2, 7061
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
.L653:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L651:
	ldr	x1, .LC168
	mov	w2, 7049
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L667:
	mov	w19, 0
	b	.L657
	.p2align 3
.L658:
	ldr	x1, .LC172
	mov	w5, w9
	mov	w4, 16
	mov	w2, 7081
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w5, [x20, 1940]
	ldr	w6, [x20, 1944]
	add	w8, w5, w6
	b	.L657
	.p2align 3
.L671:
	mov	w19, 1
	b	.L653
	.size	HEVC_IsRefForCurrPic, .-HEVC_IsRefForCurrPic
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC174:
	.xword	.LC173
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RepairList
	.type	HEVC_RepairList, %function
HEVC_RepairList:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x25, x0
	mov	x0, x30
	add	x23, x25, 53248
	bl	_mcount
	ldr	w3, [x23, 2812]
	cmp	w3, 1
	beq	.L681
	cmp	w3, 2
	beq	.L697
	cbz	w3, .L696
	ldr	x2, .LC175
	mov	w0, 1
	ldr	x1, .LC177
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L684:
	ldr	x0, [x25, 2376]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L692
	mov	w0, 1
	str	w0, [x27]
	ldr	x0, [x23, 2080]
	add	x0, x0, 40
	str	x0, [x28, -8]
	.p2align 2
.L692:
	add	w26, w26, 1
	add	x27, x27, 4
	cmp	w26, w22
	add	x28, x28, 136
	bcc	.L694
.L697:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L696:
	mov	w22, 2
.L683:
	ldr	x21, .LC175
	add	x27, x23, 2912
	add	x28, x25, 2408
	mov	w26, 0
	add	x0, x21, 256
	str	x0, [x29, 96]
	.p2align 2
.L694:
	ldr	w1, [x27]
	cbz	w1, .L684
	ldr	x2, [x28, -8]
	cbnz	x2, .L698
	mov	x3, x28
	mov	w0, 0
	b	.L686
	.p2align 3
.L688:
	ldr	x24, [x3], 8
	cbnz	x24, .L703
.L686:
	add	w0, w0, 1
	cmp	w1, w0
	bne	.L688
	mov	w20, -1
.L687:
	ldr	x0, [x25, 2376]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L689
	ldr	x24, [x23, 2080]
	add	x24, x24, 40
.L685:
	mov	x0, x2
	uxtw	x8, w26
	mov	w19, 0
	lsl	x21, x8, 4
	cbz	x0, .L704
	.p2align 2
.L690:
	add	w19, w19, 1
	add	x0, x21, x8
	cmp	w1, w19
	add	x0, x0, x19, uxtw
	add	x0, x0, 300
	bls	.L692
	ldr	x0, [x25, x0, lsl 3]
	cbnz	x0, .L690
.L704:
	ldr	x1, .LC181
	mov	w4, w19
	ldr	x2, [x29, 96]
	mov	w5, w20
	mov	w3, w26
	mov	w0, 1
	str	x8, [x29, 104]
	bl	dprint_vfmw
	ldr	x8, [x29, 104]
	add	x0, x21, x8
	add	x0, x0, x19, uxtw
	add	x0, x0, 300
	str	x24, [x25, x0, lsl 3]
	ldr	w1, [x27]
	b	.L690
	.p2align 3
.L703:
	sxtb	w20, w0
	cmn	w20, #1
	ccmp	x24, xzr, 4, ne
	bne	.L685
	b	.L687
	.p2align 3
.L698:
	mov	x24, x2
	mov	w20, 0
	b	.L685
.L681:
	mov	w22, w3
	b	.L683
.L689:
	ldr	x2, .LC175
	mov	w3, w26
	ldr	x1, .LC179
	mov	w0, 1
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	HEVC_RepairList, .-HEVC_RepairList
	.align	3
.LC175:
	.xword	.LANCHOR1
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC181:
	.xword	.LC180
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitListX
	.type	HEVC_InitListX, %function
HEVC_InitListX:
	stp	x29, x30, [sp, -320]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L741
	ldr	x20, .LC183
	add	x21, x29, 48
	mov	x2, 272
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x20, 96]
	blr	x3
	ldr	w0, [x19, 2728]
	cbz	w0, .L742
	sub	w3, w0, #1
	mov	w5, 0
	add	x3, x3, 360
	add	x0, x19, 2872
	mov	x4, 4294967296
	add	x3, x19, x3, lsl 3
	b	.L709
	.p2align 3
.L708:
	cmp	x0, x3
	beq	.L707
.L709:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L708
	ldr	x2, [x1, 56]
	cmp	x2, x4
	bne	.L708
	add	x2, x29, 320
	add	x1, x1, 40
	add	x2, x2, x5, uxtw 3
	cmp	x0, x3
	sub	x2, x2, #4096
	add	w5, w5, 1
	str	x1, [x2, 3824]
	bne	.L709
	.p2align 2
.L707:
	ldr	w0, [x19, 2732]
	cbz	w0, .L743
	sub	w4, w0, #1
	mov	w3, w5
	add	x4, x4, 377
	add	x0, x19, 3008
	mov	x6, 4294967296
	add	x4, x19, x4, lsl 3
	b	.L712
	.p2align 3
.L711:
	cmp	x0, x4
	beq	.L770
.L712:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 1
	bne	.L711
	ldr	x2, [x1, 56]
	cmp	x2, x6
	bne	.L711
	add	x2, x29, 320
	add	x1, x1, 40
	add	x2, x2, x3, uxtw 3
	cmp	x0, x4
	sub	x2, x2, #4096
	add	w3, w3, 1
	str	x1, [x2, 3824]
	bne	.L712
	.p2align 2
.L770:
	sub	w6, w3, w5
.L710:
	ldr	w0, [x19, 2724]
	sub	w7, w3, #1
	cbz	w0, .L713
	sub	w2, w0, #1
	add	x0, x19, 3144
	add	x2, x2, 394
	add	x2, x19, x2, lsl 3
	b	.L715
	.p2align 3
.L714:
	cmp	x2, x0
	beq	.L771
.L715:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w4, [x1, 1]
	cmp	w4, 1
	bne	.L714
	ldr	x4, [x1, 56]
	cmp	x4, 1
	bne	.L714
	add	x4, x29, 320
	add	x1, x1, 40
	add	x4, x4, x3, uxtw 3
	cmp	x2, x0
	sub	x4, x4, #4096
	add	w3, w3, 1
	str	x1, [x4, 3824]
	bne	.L715
	.p2align 2
.L771:
	sub	w0, w3, w5
	sub	w0, w0, w6
.L713:
	cbz	w3, .L772
	add	x22, x19, 53248
	ldr	w8, [x22, 2812]
	cbnz	w8, .L773
	cbz	w6, .L721
	add	x4, x21, 136
	add	w9, w6, w5
	mov	w1, w5
	.p2align 2
.L722:
	add	x2, x29, 320
	add	x2, x2, x1, uxtw 3
	add	w1, w1, 1
	sub	x2, x2, #4096
	cmp	w9, w1
	ldr	x2, [x2, 3824]
	str	x2, [x4], 8
	bne	.L722
.L721:
	cbz	w5, .L723
	mov	x1, 0
	.p2align 2
.L724:
	add	w2, w6, w1
	add	x9, x29, 320
	ldr	x4, [x21, x1, lsl 3]
	add	x1, x1, 1
	add	x2, x9, x2, lsl 3
	cmp	w5, w1
	str	x4, [x2, -136]
	bhi	.L724
	add	w6, w6, w5
.L723:
	cbz	w0, .L725
	add	w1, w0, w6
	mov	w2, w6
	.p2align 2
.L726:
	add	w4, w2, 1
	add	x0, x29, 320
	add	x5, x0, x2, uxtw 3
	sub	w0, w4, w6
	add	w0, w0, w7
	mov	w2, w4
	cmp	w1, w4
	add	x4, x29, 320
	add	x0, x4, x0, lsl 3
	sub	x0, x0, #4096
	ldr	x0, [x0, 3824]
	str	x0, [x5, -136]
	bne	.L726
.L725:
	ldr	w5, [x22, 2920]
	ldr	w7, [x22, 2924]
	str	w5, [x22, 2912]
	str	w7, [x22, 2916]
	cbnz	w5, .L719
	.p2align 2
.L739:
	cbz	w7, .L731
	add	x0, x19, 57344
	add	x4, x19, 2536
	add	x2, x0, 2260
	mov	w1, 0
	ldrb	w6, [x0, 2129]
	.p2align 2
.L734:
	cbz	w6, .L732
	ldr	w0, [x2]
.L733:
	add	x8, x29, 320
	add	w1, w1, 1
	add	x0, x8, x0, uxtw 3
	cmp	w1, w7
	add	x2, x2, 4
	ldr	x0, [x0, -136]
	str	x0, [x4], 8
	bne	.L734
	mov	w0, w5
.L730:
	cmp	w0, 16
	bhi	.L744
	.p2align 2
.L736:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2400]
	add	w0, w0, 1
	cmp	w0, 16
	str	x2, [x1, 2400]
	bls	.L736
.L744:
	cmp	w7, 16
	mov	w0, w7
	bhi	.L737
	.p2align 2
.L738:
	add	x1, x19, x0, uxtw 3
	ldr	x2, [x19, 2536]
	add	w0, w0, 1
	cmp	w0, 17
	str	x2, [x1, 2536]
	bne	.L738
.L737:
	mov	w0, 0
.L767:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 320
	ret
	.p2align 3
.L773:
	ldr	w5, [x22, 2920]
	ldr	w7, [x22, 2924]
	str	w5, [x22, 2912]
	str	w7, [x22, 2916]
	cbz	w5, .L774
.L719:
	add	x0, x19, 57344
	add	x4, x19, 2400
	add	x2, x0, 2132
	ldrb	w6, [x0, 2128]
	mov	w0, 0
	.p2align 2
.L729:
	cbz	w6, .L727
	ldr	w1, [x2]
.L728:
	add	x9, x29, 320
	add	w0, w0, 1
	add	x1, x9, x1, uxtw 3
	cmp	w0, w5
	sub	x1, x1, #4096
	add	x2, x2, 4
	ldr	x1, [x1, 3824]
	str	x1, [x4], 8
	bne	.L729
	cbnz	w8, .L730
	b	.L739
	.p2align 3
.L727:
	udiv	w1, w0, w3
	msub	w1, w1, w3, w0
	b	.L728
	.p2align 3
.L732:
	udiv	w0, w1, w3
	msub	w0, w0, w3, w1
	b	.L733
	.p2align 3
.L772:
	add	x21, x19, 53248
	ldr	x3, [x20, 96]
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 2400
	str	wzr, [x21, 2912]
	str	wzr, [x21, 2916]
	blr	x3
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L737
	ldr	x1, [x21, 2080]
	mov	w0, 1
	str	w0, [x21, 2912]
	mov	w0, 0
	add	x1, x1, 40
	str	x1, [x19, 2400]
	b	.L767
.L731:
	ldr	x3, [x20, 104]
	mov	x2, 136
	add	x1, x19, 2400
	add	x0, x19, 2536
	blr	x3
	ldr	w7, [x22, 2912]
	str	w7, [x22, 2916]
	mov	w0, w7
	b	.L730
.L742:
	mov	w5, 0
	b	.L707
.L743:
	mov	w3, w5
	mov	w6, 0
	b	.L710
.L774:
	mov	w0, 0
	b	.L736
.L741:
	mov	w0, -1
	b	.L767
	.size	HEVC_InitListX, .-HEVC_InitListX
	.align	3
.LC183:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecList
	.type	HEVC_DecList, %function
HEVC_DecList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 53248
	ldr	w1, [x0, 2812]
	cmp	w1, 2
	beq	.L781
	mov	x0, x19
	bl	HEVC_InitListX
	cbnz	w0, .L782
	mov	x0, x19
	bl	HEVC_RepairList
	mov	w1, 0
	cbnz	w0, .L783
.L777:
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L781:
	str	wzr, [x0, 2912]
	mov	w1, 0
	str	wzr, [x0, 2916]
	mov	w0, w1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L782:
	ldr	x1, .LC185
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L777
.L783:
	ldr	x1, .LC187
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L777
	.size	HEVC_DecList, .-HEVC_DecList
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC187:
	.xword	.LC186
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveApcStore
	.type	HEVC_RemoveApcStore, %function
HEVC_RemoveApcStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, x1, uxtw 3
	bl	_mcount
	ldr	x2, [x20, 2736]
	ldr	w0, [x2, 28]
	cmp	w0, 16
	beq	.L784
	add	x3, x19, x0, uxtw 2
	ldr	x1, .LC189
	mov	w0, 13
	str	wzr, [x3, 3288]
	ldr	w3, [x2, 28]
	add	x3, x19, x3, lsl 2
	str	wzr, [x3, 3352]
	ldr	w3, [x2, 28]
	add	x3, x19, x3, lsl 2
	str	wzr, [x3, 3416]
	ldr	w3, [x2, 24]
	add	x3, x19, x3, lsl 2
	str	wzr, [x3, 2148]
	ldp	w3, w2, [x2, 24]
	bl	dprint_vfmw
	ldr	x0, [x20, 2736]
	mov	w1, 16
	str	w1, [x0, 28]
	ldr	w0, [x19, 3284]
	sub	w0, w0, #1
	str	w0, [x19, 3284]
.L784:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveApcStore, .-HEVC_RemoveApcStore
	.align	3
.LC189:
	.xword	.LC188
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveUnusedApcStore
	.type	HEVC_RemoveUnusedApcStore, %function
HEVC_RemoveUnusedApcStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w1, [x20, 2716]
	cbnz	w1, .L794
	b	.L789
	.p2align 3
.L791:
	add	w19, w19, 1
	cmp	w1, w19
	bls	.L789
.L794:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2736]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L791
	mov	w1, w19
	mov	x0, x20
	add	w19, w19, 1
	bl	HEVC_RemoveApcStore
	ldr	w1, [x20, 2716]
	cmp	w1, w19
	bhi	.L794
.L789:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_RemoveUnusedApcStore, .-HEVC_RemoveUnusedApcStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ApplyReferencePictureSet
	.type	HEVC_ApplyReferencePictureSet, %function
HEVC_ApplyReferencePictureSet:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x23, x26, 53248
	mov	w22, 1
	bl	_mcount
	mov	w27, 0
	ldr	x1, [x26, 2368]
	mov	w5, 2024
	ldr	w2, [x23, 2828]
	mov	w4, 26164
	ldr	x0, [x26, 2360]
	add	x19, x26, 57344
	ldr	w3, [x26, 2716]
	smaddl	x1, w2, w5, x1
	ldr	w1, [x1, 32]
	smaddl	x0, w1, w4, x0
	ldr	w25, [x0, 128]
	lsl	w25, w22, w25
	cbz	w3, .L796
	add	x19, x19, 1924
	mov	w24, w22
	.p2align 2
.L825:
	ldp	w2, w0, [x19, 16]
	ldr	w1, [x19, 24]
	sxtw	x21, w27
	add	w0, w2, w0
	cmp	w0, w1
	mov	w20, w0
	bcs	.L834
	add	x28, x26, x21, lsl 3
	mov	w4, 0
	ldr	x2, [x28, 2736]
	ldr	w1, [x2, 12]
	.p2align 2
.L805:
	add	x0, x26, x20, sxtw 2
	add	x0, x0, 57344
	ldr	w3, [x0, 180]
	cbz	w3, .L800
	ldr	w3, [x2, 56]
	cbz	w3, .L801
	ldr	w3, [x0, 2064]
	cmp	w3, w1
	beq	.L833
.L801:
	cbnz	w4, .L832
	ldrb	w4, [x2, 1]
	ldr	w3, [x0, 2064]
	mov	w0, w1
	cmp	w4, wzr
	ccmp	w0, w3, 0, ne
	beq	.L835
.L818:
	mov	w3, w1
	mov	w4, 0
.L804:
	ldr	w0, [x19, 24]
	add	w20, w20, 1
	mov	w1, w3
	cmp	w0, w20
	bhi	.L805
	ldp	w1, w0, [x19, 16]
	add	w0, w1, w0
.L799:
	ldr	w5, [x23, 2800]
	cbz	w0, .L807
	mov	w20, 0
	lsl	x6, x21, 3
	.p2align 2
.L809:
	ldr	w0, [x2, 56]
	add	x1, x19, x20, sxtw 2
	add	w20, w20, 1
	cbnz	w0, .L808
	ldr	w0, [x1, 72]
	add	w0, w5, w0
	cmp	w0, w3
	beq	.L836
.L808:
	ldp	w1, w0, [x19, 16]
	add	w0, w1, w0
	cmp	w0, w20
	bhi	.L809
.L807:
	cmp	w4, wzr
	ccmp	w3, w5, 4, eq
	beq	.L811
	add	x21, x26, x21, lsl 3
	strb	wzr, [x2, 1]
	ldr	x0, [x21, 2736]
	str	wzr, [x0, 56]
	ldr	x0, [x21, 2736]
	ldr	w1, [x0, 8]
	cmp	w1, 1
	beq	.L811
	ldr	w1, [x0, 32]
	mov	w2, 0
	ldr	w0, [x26, 276]
	bl	FSP_SetRef
.L811:
	ldr	w0, [x26, 2716]
	add	w27, w27, 1
	cmp	w0, w27
	bhi	.L825
.L796:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L800:
	ldr	w3, [x2, 56]
	cbz	w3, .L803
	sdiv	w3, w1, w25
	ldr	w6, [x0, 2064]
	sdiv	w5, w6, w25
	msub	w3, w3, w25, w1
	msub	w5, w5, w25, w6
	cmp	w3, w5
	bne	.L803
.L833:
	strb	w24, [x2, 1]
	mov	w2, 1
	ldr	x0, [x28, 2736]
	str	w22, [x0, 4]
	ldr	x1, [x28, 2736]
	ldr	w0, [x26, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
	ldr	x2, [x28, 2736]
	mov	w4, 1
	ldr	w3, [x2, 12]
	b	.L804
	.p2align 3
.L803:
	cbnz	w4, .L832
	ldr	w4, [x0, 2064]
	sdiv	w0, w1, w25
	sdiv	w3, w4, w25
	msub	w0, w0, w25, w1
	msub	w3, w3, w25, w4
	ldrb	w4, [x2, 1]
	cmp	w4, wzr
	ccmp	w0, w3, 0, ne
	bne	.L818
.L835:
	strb	w24, [x2, 1]
	mov	w2, 1
	ldr	x0, [x28, 2736]
	str	w22, [x0, 56]
	ldr	x0, [x28, 2736]
	str	w22, [x0, 4]
	ldr	x1, [x28, 2736]
	ldr	w0, [x26, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
	ldr	x2, [x28, 2736]
	mov	w4, 1
	ldr	w3, [x2, 12]
	b	.L804
	.p2align 3
.L832:
	mov	w3, w1
	b	.L804
	.p2align 3
.L836:
	add	x28, x26, x6
	strb	w24, [x2, 1]
	mov	w2, 1
	str	x6, [x29, 104]
	ldr	x0, [x28, 2736]
	str	w22, [x0, 4]
	ldr	x1, [x28, 2736]
	ldr	w0, [x26, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
	ldr	x2, [x28, 2736]
	mov	w4, 1
	ldr	w5, [x23, 2800]
	ldr	x6, [x29, 104]
	ldr	w3, [x2, 12]
	b	.L808
.L834:
	add	x1, x26, x21, lsl 3
	mov	w4, 0
	ldr	x2, [x1, 2736]
	ldr	w3, [x2, 12]
	b	.L799
	.size	HEVC_ApplyReferencePictureSet, .-HEVC_ApplyReferencePictureSet
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckThatAllRefPicsAreAvailable
	.type	HEVC_CheckThatAllRefPicsAreAvailable, %function
HEVC_CheckThatAllRefPicsAreAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x7, x19, 53248
	ldr	x0, [x19, 2368]
	mov	w4, 2024
	add	x17, x19, 57344
	add	x18, x17, 1924
	ldr	x1, [x19, 2360]
	ldr	w2, [x7, 2828]
	mov	w3, 26164
	ldr	w8, [x18, 16]
	ldr	w30, [x18, 24]
	smaddl	x0, w2, w4, x0
	ldr	w2, [x18, 20]
	ldr	w0, [x0, 32]
	add	w8, w8, w2
	cmp	w8, w30
	mov	w15, w8
	smaddl	x1, w0, w3, x1
	mov	w0, 1
	ldr	w5, [x1, 128]
	lsl	w5, w0, w5
	bcs	.L838
	ldr	w3, [x19, 2716]
	mov	w10, 0
	mov	w9, 0
	.p2align 2
.L839:
	sxtw	x16, w15
	cbz	w3, .L845
	add	x11, x19, x16, lsl 2
	mov	w14, 0
	add	x11, x11, 57344
	mov	w0, 0
	ldr	w4, [x11, 180]
	b	.L842
	.p2align 3
.L879:
	ldr	x1, [x2, 2736]
	ldr	w2, [x1, 56]
	cbz	w2, .L841
	ldr	w6, [x1, 12]
	ldr	w2, [x11, 2064]
	cmp	w6, w2
	beq	.L877
.L841:
	add	w0, w0, 1
	cmp	w0, w3
	beq	.L878
.L842:
	add	x2, x19, x0, sxtw 3
	cbnz	w4, .L879
	ldr	x1, [x2, 2736]
	ldr	w2, [x1, 56]
	cbz	w2, .L841
	ldr	w13, [x1, 12]
	ldr	w12, [x11, 2064]
	sdiv	w6, w13, w5
	sdiv	w2, w12, w5
	msub	w6, w6, w5, w13
	msub	w2, w2, w5, w12
	cmp	w6, w2
	bne	.L841
.L877:
	ldrb	w1, [x1, 1]
	add	w0, w0, 1
	cmp	w1, wzr
	csinc	w14, w14, wzr, eq
	cmp	w0, w3
	bne	.L842
	.p2align 2
.L878:
	cbz	w14, .L845
.L843:
	add	w15, w15, 1
	cmp	w30, w15
	bne	.L839
	cbz	w8, .L847
.L846:
	mov	w12, 0
	add	x17, x17, 1924
	.p2align 2
.L851:
	mov	w11, 0
	mov	w0, 0
	cbz	w3, .L853
	sxtw	x6, w12
	add	x6, x6, 16
	add	x6, x17, x6, lsl 2
	b	.L869
	.p2align 3
.L848:
	cmp	w0, w3
	beq	.L880
.L869:
	add	x2, x19, x0, sxtw 3
	add	w0, w0, 1
	ldr	x2, [x2, 2736]
	ldr	w4, [x2, 56]
	cbnz	w4, .L848
	ldr	w4, [x6, 8]
	ldr	w5, [x7, 2800]
	ldr	w1, [x2, 12]
	add	w4, w5, w4
	cmp	w1, w4
	bne	.L848
	ldrb	w1, [x2, 1]
	cmp	w1, wzr
	csinc	w11, w11, wzr, eq
	cmp	w0, w3
	bne	.L869
	.p2align 2
.L880:
	cbz	w11, .L853
.L850:
	add	w12, w12, 1
	cmp	w8, w12
	bhi	.L851
.L847:
	mov	w0, 1
	cbz	w9, .L868
	mov	w0, 0
	str	w10, [x20]
.L868:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L853:
	sxtw	x1, w12
	ldr	w4, [x7, 2800]
	ldr	w2, [x19, 200]
	add	x0, x17, x1, lsl 2
	ldr	w0, [x0, 72]
	add	w0, w4, w0
	cmp	w0, w2
	blt	.L850
	add	x1, x17, x1
	ldrb	w1, [x1, 53]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L850
	.p2align 3
.L845:
	add	x1, x18, x16, lsl 2
	ldr	w4, [x7, 2800]
	ldr	w2, [x19, 200]
	ldr	w0, [x1, 72]
	add	w0, w4, w0
	cmp	w0, w2
	blt	.L843
	add	x16, x18, x16
	ldrb	w1, [x16, 53]
	cmp	w1, wzr
	csel	w10, w10, w0, eq
	csinc	w9, w9, wzr, eq
	b	.L843
.L838:
	cbz	w8, .L868
	mov	w10, 0
	mov	w9, 0
	ldr	w3, [x19, 2716]
	b	.L846
	.size	HEVC_CheckThatAllRefPicsAreAvailable, .-HEVC_CheckThatAllRefPicsAreAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetFrmRepeatCount
	.type	HEVC_SetFrmRepeatCount, %function
HEVC_SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L882
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.4
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L882:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetFreeFrameStoreNum
	.type	HEVC_GetFreeFrameStoreNum, %function
HEVC_GetFreeFrameStoreNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 69632
	add	x5, x19, 81920
	add	x2, x2, 616
	add	x5, x5, 3528
	mov	w0, 0
	.p2align 2
.L889:
	ldr	w1, [x2, 4]
	cbnz	w1, .L885
	cbz	x2, .L886
	ldr	w4, [x19, 2716]
	cbz	w4, .L886
	ldr	x1, [x19, 2736]
	cmp	x1, x2
	beq	.L885
	sub	w4, w4, #1
	mov	x1, x19
	add	x4, x19, x4, lsl 3
	b	.L887
	.p2align 3
.L888:
	ldr	x3, [x1, 2736]
	cmp	x3, x2
	beq	.L885
.L887:
	cmp	x4, x1
	add	x1, x1, 8
	bne	.L888
.L886:
	add	w0, w0, 1
.L885:
	add	x2, x2, 760
	cmp	x2, x5
	bne	.L889
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetFreeFrameStoreNum, .-HEVC_GetFreeFrameStoreNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdateReflist
	.type	HEVC_UpdateReflist, %function
HEVC_UpdateReflist:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 57344
	mov	w23, 0
	add	x24, x22, 1924
	bl	_mcount
	mov	w20, 0
	ldr	w1, [x24, 16]
	cbz	w1, .L900
	add	x25, x21, 53248
	mov	w27, 1
	mov	w26, 1
	.p2align 2
.L907:
	uxtw	x0, w20
	add	x1, x24, x0
	ldrb	w1, [x1, 53]
	cbz	w1, .L901
	add	x0, x24, x0, lsl 2
	ldr	w5, [x21, 2716]
	ldr	w4, [x25, 2800]
	ldr	w0, [x0, 72]
	add	w4, w4, w0
	cbz	w5, .L901
	ldr	x1, [x21, 2736]
	ldr	w0, [x1, 12]
	cmp	w4, w0
	beq	.L957
	add	x2, x21, 2744
	mov	w0, 0
	b	.L904
	.p2align 3
.L906:
	ldr	x1, [x2], 8
	ldr	w3, [x1, 12]
	cmp	w4, w3
	beq	.L902
.L904:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L906
.L901:
	ldr	w1, [x24, 16]
	add	w20, w20, 1
	cmp	w1, w20
	bhi	.L907
.L900:
	ldr	w0, [x21, 2712]
	str	w23, [x21, 2728]
	cmp	w0, w23
	bls	.L912
	.p2align 2
.L940:
	add	x2, x21, x23, uxtw 3
	add	w23, w23, 1
	cmp	w23, w0
	str	xzr, [x2, 2872]
	bne	.L940
.L912:
	add	x23, x22, 1924
	ldr	w25, [x23, 20]
	mov	w22, 0
	add	w25, w1, w25
	cmp	w25, w20
	bls	.L910
	add	x24, x21, 53248
	mov	w27, 1
	mov	w26, 1
	.p2align 2
.L939:
	uxtw	x0, w20
	add	x1, x23, x0
	ldrb	w1, [x1, 53]
	cbz	w1, .L913
	add	x0, x23, x0, lsl 2
	ldr	w5, [x21, 2716]
	ldr	w4, [x24, 2800]
	ldr	w0, [x0, 72]
	add	w4, w4, w0
	cbz	w5, .L913
	ldr	x1, [x21, 2736]
	ldr	w0, [x1, 12]
	cmp	w4, w0
	beq	.L958
	add	x2, x21, 2744
	mov	w0, 0
	b	.L916
	.p2align 3
.L918:
	ldr	x1, [x2], 8
	ldr	w3, [x1, 12]
	cmp	w4, w3
	beq	.L914
.L916:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L918
.L913:
	add	w20, w20, 1
	cmp	w25, w20
	bhi	.L939
.L961:
	ldr	w0, [x21, 2712]
.L910:
	cmp	w0, w22
	str	w22, [x21, 2732]
	bls	.L899
	.p2align 2
.L938:
	add	x1, x21, x22, uxtw 3
	add	w22, w22, 1
	cmp	w0, w22
	str	xzr, [x1, 3008]
	bne	.L938
.L899:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L957:
	mov	w0, 0
	.p2align 2
.L902:
	add	x19, x21, x0, uxtw 3
	strb	w27, [x1, 1]
	ldr	x0, [x19, 2736]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L959
.L905:
	str	w26, [x0, 60]
	add	x0, x21, x23, uxtw 3
	add	w20, w20, 1
	add	w23, w23, 1
	ldr	x1, [x19, 2736]
	str	wzr, [x1, 56]
	ldr	x1, [x19, 2736]
	str	x1, [x0, 2872]
	ldr	w1, [x24, 16]
	cmp	w1, w20
	bhi	.L907
	b	.L900
.L958:
	mov	w0, 0
	.p2align 2
.L914:
	add	x19, x21, x0, uxtw 3
	strb	w27, [x1, 1]
	ldr	x0, [x19, 2736]
	ldrb	w1, [x0, 1]
	cbnz	w1, .L960
.L917:
	str	w26, [x0, 60]
	add	x0, x21, x22, uxtw 3
	add	w20, w20, 1
	add	w22, w22, 1
	ldr	x1, [x19, 2736]
	cmp	w25, w20
	str	wzr, [x1, 56]
	ldr	x1, [x19, 2736]
	str	x1, [x0, 3008]
	bhi	.L939
	b	.L961
	.p2align 3
.L959:
	ldr	w1, [x0, 32]
	mov	w2, 1
	ldr	w0, [x21, 276]
	bl	FSP_SetRef
	ldr	x0, [x19, 2736]
	b	.L905
	.p2align 3
.L960:
	ldr	w1, [x0, 32]
	mov	w2, 1
	ldr	w0, [x21, 276]
	bl	FSP_SetRef
	ldr	x0, [x19, 2736]
	b	.L917
	.size	HEVC_UpdateReflist, .-HEVC_UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UpdateLTReflist
	.type	HEVC_UpdateLTReflist, %function
HEVC_UpdateLTReflist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 53248
	ldr	x1, [x19, 2368]
	add	x11, x19, 57344
	mov	w2, 2024
	add	x11, x11, 1924
	ldr	x4, [x19, 2360]
	ldr	w3, [x0, 2828]
	mov	w5, 26164
	ldr	w10, [x11, 24]
	mov	w0, 1
	smaddl	x2, w3, w2, x1
	ldp	w3, w1, [x11, 16]
	sub	w10, w10, #1
	ldr	w2, [x2, 32]
	add	w1, w3, w1
	sub	w1, w1, #1
	cmp	w10, w1
	smaddl	x1, w2, w5, x4
	ldr	w1, [x1, 128]
	lsl	w1, w0, w1
	ble	.L972
	mov	w9, 0
	sub	w7, w1, #1
	mov	w13, w0
	mov	w12, w0
	.p2align 2
.L969:
	sxtw	x0, w10
	add	x1, x11, x0
	ldrb	w1, [x1, 53]
	cbz	w1, .L964
	add	x0, x19, x0, lsl 2
	ldr	w8, [x19, 2716]
	add	x0, x0, 57344
	ldrb	w6, [x0, 180]
	ldr	w5, [x0, 2064]
	cmp	w6, wzr
	and	w0, w5, w7
	csel	w5, w0, w5, eq
	cmp	w8, wzr
	ble	.L964
	add	x2, x19, 2736
	mov	w1, 0
	b	.L968
	.p2align 3
.L967:
	add	w1, w1, 1
	cmp	w1, w8
	beq	.L964
.L968:
	ldr	x3, [x2]
	cmp	w6, wzr
	add	x2, x2, 8
	ldr	w0, [x3, 12]
	and	w4, w0, w7
	csel	w0, w4, w0, eq
	cmp	w5, w0
	bne	.L967
	add	x1, x19, x1, sxtw 3
	strb	w13, [x3, 1]
	add	x0, x19, x9, sxtw 3
	add	w9, w9, 1
	ldr	x2, [x1, 2736]
	str	wzr, [x2, 60]
	ldr	x2, [x1, 2736]
	str	w12, [x2, 56]
	ldr	x1, [x1, 2736]
	str	x1, [x0, 3144]
.L964:
	ldp	w1, w0, [x11, 16]
	sub	w10, w10, #1
	add	w0, w1, w0
	sub	w0, w0, #1
	cmp	w0, w10
	blt	.L969
	mov	w0, w9
.L963:
	ldr	w1, [x19, 2712]
	str	w0, [x19, 2724]
	cmp	w1, w9
	ble	.L962
	.p2align 2
.L975:
	add	x0, x19, x9, sxtw 3
	add	w9, w9, 1
	cmp	w9, w1
	str	xzr, [x0, 3144]
	bne	.L975
.L962:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L972:
	mov	w0, 0
	mov	w9, 0
	b	.L963
	.size	HEVC_UpdateLTReflist, .-HEVC_UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetAPC
	.type	HEVC_GetAPC, %function
HEVC_GetAPC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L981
	ldr	w2, [x20, 3280]
	cbz	w2, .L990
	ldr	w0, [x20, 3288]
	cbz	w0, .L996
	add	x0, x20, 3292
	mov	w19, 0
	b	.L985
	.p2align 3
.L988:
	ldr	w1, [x0], 4
	cbz	w1, .L983
.L985:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L988
.L990:
	mov	w0, -7
.L994:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L996:
	mov	w19, 0
	.p2align 2
.L983:
	ldr	w0, [x20, 276]
	ldr	w1, [x21, 32]
	bl	FSP_GetLogicFs
	mov	x5, x0
	cbz	x0, .L986
	ldr	x0, [x0, 680]
	cbz	x0, .L986
	add	x2, x20, x19, uxtw 2
	mov	w4, 1
	ldr	x1, .LC193
	mov	w3, w19
	mov	w0, 13
	str	w4, [x2, 3288]
	ldr	x4, [x5, 680]
	ldr	w4, [x4, 8]
	str	w4, [x2, 3352]
	ldr	w4, [x21, 12]
	str	w4, [x2, 3416]
	ldr	w2, [x20, 3284]
	add	w2, w2, 1
	str	w2, [x20, 3284]
	ldr	w2, [x21, 268]
	bl	dprint_vfmw
	str	w19, [x21, 28]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L986:
	ldrb	w4, [x21, 1]
	mov	x6, 0
	ldr	x1, .LC195
	mov	w0, 0
	ldr	w3, [x21, 12]
	ldr	w2, [x21, 32]
	bl	dprint_vfmw
	mov	w0, -7
	b	.L994
.L981:
	ldr	x2, .LC190
	mov	w3, 9414
	ldr	x1, .LC191
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L994
	.size	HEVC_GetAPC, .-HEVC_GetAPC
	.align	3
.LC190:
	.xword	.LC97
	.align	3
.LC191:
	.xword	.LC99
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC195:
	.xword	.LC194
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckFrameStore
	.type	HEVC_CheckFrameStore, %function
HEVC_CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 32]
	ldr	w0, [x20, 276]
	bl	FSP_GetLogicFs
	cbz	x0, .L998
	ldrsb	w4, [x0, 1]
	cmp	w4, 3
	ccmp	w4, wzr, 4, ne
	beq	.L1018
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L1004
	ldr	w4, [x19, 4]
	ldrb	w5, [x19]
	cbz	w4, .L1003
	cmp	w5, 1
	mov	w0, 0
	beq	.L1003
.L1012:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1018:
	ldr	x2, .LC196
	mov	w0, 13
	ldr	x1, .LC198
	ldr	w3, [x19, 32]
	add	x2, x2, 272
	bl	dprint_vfmw
.L1000:
	ldr	w0, [x19, 8]
	cmp	w0, 1
	bne	.L1019
.L1004:
	mov	w1, 1
	mov	w0, 2
	strb	w1, [x19, 2]
	str	w0, [x19, 8]
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L998:
	ldr	x1, .LC200
	mov	x2, x19
	ldp	w4, w3, [x19, 8]
	ldr	w5, [x19, 32]
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1000
.L1019:
	ldr	x2, .LC196
	mov	w0, 1
	ldr	x1, .LC202
	ldr	w3, [x19, 12]
	add	x2, x2, 272
	bl	dprint_vfmw
	mov	w0, -3
	b	.L1012
	.p2align 3
.L1003:
	ldr	x2, .LC196
	mov	x3, x19
	ldr	x1, .LC204
	mov	w0, 1
	add	x2, x2, 272
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1012
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	3
.LC196:
	.xword	.LANCHOR1
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC202:
	.xword	.LC201
	.align	3
.LC204:
	.xword	.LC203
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetImagePara
	.type	HEVC_GetImagePara, %function
HEVC_GetImagePara:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 213]
	add	x2, x20, 86016
	ldrb	w1, [x19, 212]
	and	w0, w0, -64
	strb	w0, [x19, 213]
	and	w1, w1, -4
	strb	w1, [x19, 212]
	ldr	w5, [x19, 16]
	ldr	w2, [x2, 2928]
	str	w2, [x19, 248]
	ldr	x2, [x20, 29072]
	ldr	w2, [x2, 12468]
	and	w2, w2, 16776960
	cmp	w2, 256
	beq	.L1031
	mov	w3, 256
	movk	w3, 0x1, lsl 16
	cmp	w2, w3
	bne	.L1032
	ldr	w2, [x20, 5288]
	cmp	w2, 1
	cset	w4, ne
.L1021:
	ldr	x2, [x20, 29080]
	mov	w3, 3
	ldrb	w2, [x2, 2633]
	cbz	w2, .L1022
	ldr	w2, [x19, 752]
	mov	w3, 1
	cmp	w2, w3
	ccmp	w2, 11, 4, ne
	cset	w4, eq
	cbz	w4, .L1044
.L1023:
	ldr	w2, [x19, 756]
	cmp	w2, wzr
	cset	w4, eq
.L1022:
	mov	w2, 2
	bfi	w1, w5, 0, 2
	bfi	w0, w2, 4, 2
	add	x2, x20, 53248
	bfi	w0, w3, 2, 2
	strb	w1, [x19, 212]
	bfi	w0, w4, 0, 2
	strb	w0, [x19, 213]
	ldr	w0, [x2, 2032]
	cmp	w0, 1920
	ldrb	w0, [x19, 214]
	bhi	.L1024
	orr	w0, w0, 2
	strb	w0, [x19, 214]
	ldr	x1, [x20, 2376]
	ldr	w1, [x1, 632]
	cmp	w1, 1
	beq	.L1045
.L1026:
	and	w0, w0, -5
	strb	w0, [x19, 214]
.L1027:
	ldr	w0, [x19, 4]
	cbz	w0, .L1028
	ldr	w0, [x19, 20]
	str	w0, [x19, 272]
.L1028:
	ldr	w0, [x20, 276]
	ldr	w1, [x19, 32]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L1020
	ldr	x3, .LC205
	mov	x2, 664
	add	x1, x19, 88
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 16
	str	w0, [x20, 412]
	mov	w0, 4
	mov	w1, 1
	ldr	w2, [x19, 52]
	strb	w1, [x20, 407]
	cmp	w2, wzr
	strb	w1, [x20, 405]
	csel	w0, w0, wzr, ne
	strb	w0, [x20, 400]
	ldr	w0, [x19, 72]
	str	w0, [x20, 356]
.L1020:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1024:
	and	w0, w0, -3
	strb	w0, [x19, 214]
	ldr	x1, [x20, 2376]
	ldr	w1, [x1, 632]
	cmp	w1, 1
	bne	.L1026
.L1045:
	ldrb	w1, [x19, 214]
	tbnz	x1, 1, .L1026
	orr	w1, w1, 4
	strb	w1, [x19, 214]
	b	.L1027
	.p2align 3
.L1044:
	and	w4, w2, -9
	mov	w3, 2
	mov	w2, 3
	cmp	w4, w3
	csel	w3, w2, w3, ne
	b	.L1023
	.p2align 3
.L1031:
	mov	w4, 0
	b	.L1021
	.p2align 3
.L1032:
	mov	w4, 1
	b	.L1021
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	3
.LC205:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputCurrPic
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 53248
	add	x23, x22, 2016
	bl	_mcount
	mov	x2, 664
	add	x1, x22, 2088
	ldr	x20, [x22, 2080]
	ldr	w3, [x23, 40]
	add	x0, x20, 88
	str	w3, [x20, 20]
	bl	memcpy
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_GetImagePara
	ldr	w0, [x19, 276]
	ldr	w1, [x20, 32]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L1068
	ldr	w0, [x20, 20]
	str	w0, [x21, 184]
	cbnz	w0, .L1049
.L1054:
	ldrb	w0, [x22, 2016]
	cbnz	w0, .L1069
.L1051:
	ldr	w0, [x19, 276]
	mov	w2, 1
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	add	x3, x19, 61440
	ldr	w0, [x19, 276]
	mov	x4, x21
	add	x3, x3, 2024
	mov	x2, x19
	mov	w1, 16
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L1070
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L1071
	str	wzr, [x21, 24]
.L1058:
	ldr	w1, [x19, 308]
	mov	w0, 0
	ldr	w2, [x19, 316]
	add	w1, w1, 1
	str	w1, [x19, 308]
	add	w2, w2, 1
	str	w2, [x19, 316]
.L1048:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1049:
	ldr	w1, [x23, 12]
	cbz	w1, .L1072
.L1052:
	ldr	x1, [x19, 2376]
	ldr	w1, [x1, 4]
	cmp	w1, w0
	bcs	.L1054
	ldr	w0, [x19, 276]
	mov	w2, 0
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	ldr	x4, [x19, 2376]
	mov	w0, 1
	ldr	x2, .LC206
	ldr	x1, .LC215
	ldr	w3, [x21, 184]
	add	x2, x2, 296
	ldr	w4, [x4, 4]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1048
	.p2align 3
.L1069:
	ldr	w0, [x19, 276]
	mov	w2, 1
	ldr	w1, [x20, 32]
	bl	FSP_SetRef
	b	.L1051
	.p2align 3
.L1071:
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L1058
	.p2align 3
.L1072:
	ldr	x2, .LC206
	mov	w0, 1
	ldr	x1, .LC210
	add	x2, x2, 296
	bl	dprint_vfmw
	ldr	x0, .LC211
	ldr	x4, [x0]
	cbz	x4, .L1053
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L1053:
	ldr	w0, [x21, 184]
	cbnz	w0, .L1052
	b	.L1054
	.p2align 3
.L1070:
	ldr	x2, .LC206
	mov	w0, 1
	ldr	x1, .LC213
	add	x2, x2, 296
	bl	dprint_vfmw
	ldr	w0, [x19, 276]
	mov	w2, 0
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L1048
.L1068:
	ldr	x2, .LC206
	mov	w0, 0
	ldr	x1, .LC208
	add	x2, x2, 296
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1048
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
	.align	3
.LC206:
	.xword	.LANCHOR1
	.align	3
.LC208:
	.xword	.LC207
	.align	3
.LC210:
	.xword	.LC209
	.align	3
.LC211:
	.xword	g_event_report
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC215:
	.xword	.LC214
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FirstFrameFastOut
	.type	HEVC_FirstFrameFastOut, %function
HEVC_FirstFrameFastOut:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	mov	w20, w0
	cbnz	w0, .L1076
	add	x0, x19, 53248
	add	x2, x19, 61440
	mov	w4, 2
	mov	w1, 1
	ldr	x3, [x0, 2080]
	str	w4, [x3, 8]
	str	w1, [x2, 2632]
	ldr	w2, [x0, 2024]
	str	w2, [x19, 244]
	ldr	x0, [x0, 2080]
	strb	w1, [x0, 2]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1076:
	ldr	x2, .LC216
	mov	w0, 1
	ldr	x1, .LC218
	add	x2, x2, 320
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FirstFrameFastOut, .-HEVC_FirstFrameFastOut
	.align	3
.LC216:
	.xword	.LANCHOR1
	.align	3
.LC218:
	.xword	.LC217
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CheckOutputImage
	.type	HEVC_CheckOutputImage, %function
HEVC_CheckOutputImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 19
	bhi	.L1079
	uxtw	x1, w19
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x0, x0, 5
	sub	x0, x0, x1
	add	x0, x20, x0, lsl 3
	add	x0, x0, 69632
	ldrb	w0, [x0, 617]
	cmp	w0, wzr
	cset	w0, ne
.L1078:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1079:
	mov	w0, -1
	b	.L1078
	.size	HEVC_CheckOutputImage, .-HEVC_CheckOutputImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DECRecycleImage
	.type	HEVC_DECRecycleImage, %function
HEVC_DECRecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	ldr	w0, [x21, 276]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L1085
	ldrsb	w1, [x0, 1]
	add	x19, x0, 608
	add	x20, x0, 640
	cbz	w1, .L1091
.L1088:
	ldr	x1, [x19]
	cbnz	x1, .L1092
.L1083:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L1088
	ldr	w0, [x21, 276]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L1081:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1092:
	ldr	w0, [x21, 276]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1083
.L1091:
	ldr	x1, .LC220
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1081
.L1085:
	mov	w0, -1
	b	.L1081
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	3
.LC220:
	.xword	.LC219
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ArrangeVahbMem
	.type	HEVC_ArrangeVahbMem, %function
HEVC_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	mov	w20, w1
	mov	w22, w6
	bl	_mcount
	mov	w0, 8160
	sub	w2, w21, #32
	sub	w1, w20, #32
	cmp	w2, w0
	ccmp	w1, w0, 2, ls
	bhi	.L1094
	ldr	x3, .LC221
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	strb	wzr, [x29, 64]
	ldr	x0, [x19, 2376]
	stp	w20, w21, [x29, 88]
	strb	wzr, [x29, 65]
	ldr	w0, [x0, 28]
	stp	w20, w21, [x29, 72]
	stp	w20, w21, [x29, 80]
	cmp	w0, 24
	beq	.L1107
	ldr	w1, [x19, 2712]
	mov	w0, 5
	strb	wzr, [x29, 68]
	sxtb	w6, w22
	strb	w0, [x29, 69]
	strb	w1, [x29, 67]
.L1101:
	ldr	w0, [x19, 276]
	add	x1, x29, 64
	strb	w6, [x29, 70]
	strb	wzr, [x29, 66]
	bl	FSP_ConfigInstance
	cbnz	w0, .L1098
	ldr	x1, [x19, 2376]
	add	x3, x29, 60
	ldr	w0, [x19, 276]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L1108
	mov	w0, 1
	cbnz	w1, .L1100
.L1103:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1107:
	mov	w1, 1
	mov	w0, 5
	strb	w1, [x29, 67]
	mov	w6, 1
	strb	wzr, [x29, 68]
	strb	w0, [x29, 69]
	b	.L1101
	.p2align 3
.L1108:
	add	x0, x19, 61440
	add	x0, x0, 2024
	bl	ResetVoQueue
.L1100:
	ldr	x1, .LC225
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -20
	b	.L1103
	.p2align 3
.L1094:
	ldr	x1, .LC223
	mov	w3, w21
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1098:
	ldr	x1, .LC227
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -20
	b	.L1103
	.size	HEVC_ArrangeVahbMem, .-HEVC_ArrangeVahbMem
	.align	3
.LC221:
	.xword	vfmw_Osal_Func_Ptr_S
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
	.global	HEVC_GetSLHDR1MasteringDisplayInfo
	.type	HEVC_GetSLHDR1MasteringDisplayInfo, %function
HEVC_GetSLHDR1MasteringDisplayInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x1, x19, 4096
	mov	w2, 14999
	ldr	w0, [x1, 256]
	cmp	w0, w2
	bhi	.L1113
	sub	w2, w0, #8192
	mov	w3, 4749
	sub	w2, w2, #308
	cmp	w2, w3
	bhi	.L1112
	mov	w0, 1
	strb	w0, [x20, 3]
	b	.L1111
	.p2align 3
.L1112:
	sub	w0, w0, #12288
	sub	w0, w0, #962
	cmp	w0, 1749
	bls	.L1116
.L1113:
	strb	wzr, [x20, 3]
.L1111:
	ldr	w2, [x1, 288]
	mov	w0, 56963
	movk	w0, 0x431b, lsl 16
	mov	w3, 10000
	add	w2, w2, 249856
	mov	w5, 2063
	add	w2, w2, 144
	movk	w5, 0x5f6, lsl 16
	mov	w4, w3
	umull	x2, w2, w0
	lsr	x2, x2, 32
	lsr	w2, w2, 17
	lsl	w0, w2, 3
	sub	w0, w0, w2
	add	w2, w2, w0, lsl 3
	sub	w0, w2, w0
	cmp	w0, w3
	csel	w0, w0, w3, ls
	strh	w0, [x20, 4]
	ldr	w0, [x1, 292]
	cmp	w0, w5
	bhi	.L1114
	mov	w1, 5977
	movk	w1, 0xd1b7, lsl 16
	umull	x0, w0, w1
	ubfx	x4, x0, 45, 16
.L1114:
	strh	w4, [x20, 6]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1116:
	mov	w0, 2
	strb	w0, [x20, 3]
	b	.L1111
	.size	HEVC_GetSLHDR1MasteringDisplayInfo, .-HEVC_GetSLHDR1MasteringDisplayInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_PrintSLHDR1Info
	.type	HEVC_PrintSLHDR1Info, %function
HEVC_PrintSLHDR1Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x21]
	mov	w0, 32
	ldr	x1, .LC229
	bl	dprint_vfmw
	ldrb	w2, [x21, 1]
	mov	w0, 32
	ldr	x1, .LC231
	bl	dprint_vfmw
	ldrb	w2, [x21, 2]
	mov	w0, 32
	ldr	x1, .LC233
	bl	dprint_vfmw
	ldrb	w2, [x21, 3]
	mov	w0, 32
	ldr	x1, .LC235
	bl	dprint_vfmw
	ldrh	w2, [x21, 4]
	mov	w0, 32
	ldr	x1, .LC237
	bl	dprint_vfmw
	ldrh	w2, [x21, 6]
	mov	w0, 32
	ldr	x1, .LC239
	bl	dprint_vfmw
	ldrb	w2, [x21, 8]
	mov	w0, 32
	ldr	x1, .LC241
	bl	dprint_vfmw
	ldrb	w2, [x21, 9]
	mov	w0, 32
	ldr	x1, .LC243
	bl	dprint_vfmw
	ldrb	w0, [x21, 1]
	ldrb	w2, [x21, 10]
	cbnz	w0, .L1118
	ldr	x1, .LC245
	add	x19, x21, 10
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w2, [x19, 1]
	mov	w0, 32
	ldr	x1, .LC247
	bl	dprint_vfmw
	ldrb	w2, [x19, 2]
	mov	w0, 32
	ldr	x1, .LC249
	bl	dprint_vfmw
	ldrb	w2, [x19, 3]
	mov	w0, 32
	ldr	x1, .LC251
	bl	dprint_vfmw
	ldrb	w2, [x19, 4]
	mov	w0, 32
	ldr	x1, .LC253
	bl	dprint_vfmw
	ldrb	w2, [x19, 5]
	mov	w0, 32
	ldr	x1, .LC255
	bl	dprint_vfmw
	ldrb	w0, [x19, 5]
	cbz	w0, .L1123
	ldr	x23, .LC259
	mov	w20, 0
	ldr	x22, .LC261
	.p2align 2
.L1122:
	add	x21, x19, x20, uxtw
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	ldrb	w2, [x21, 6]
	bl	dprint_vfmw
	ldrb	w2, [x21, 17]
	mov	w3, w20
	mov	x1, x22
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 5]
	cmp	w0, w20
	bhi	.L1122
.L1123:
	ldrb	w2, [x19, 28]
	mov	w0, 32
	ldr	x1, .LC257
	bl	dprint_vfmw
	ldrb	w0, [x19, 28]
	cbz	w0, .L1124
	ldr	x23, .LC263
	mov	w20, 0
	ldr	x22, .LC265
	.p2align 2
.L1125:
	add	x21, x19, x20, uxtw
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	ldrb	w2, [x21, 29]
	bl	dprint_vfmw
	ldrb	w2, [x21, 36]
	mov	w3, w20
	mov	x1, x22
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 28]
	cmp	w0, w20
	bhi	.L1125
.L1124:
	ldr	x1, .LC283
	mov	x2, 290
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1118:
	ldr	x1, .LC267
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21, 10]
	cbz	w0, .L1136
	ldr	x24, .LC271
	mov	w20, 0
	ldr	x23, .LC273
	add	x19, x21, 10
	.p2align 2
.L1129:
	add	x22, x21, x20, uxtw 1
	mov	w2, w20
	mov	x1, x24
	mov	w0, 32
	ldrh	w3, [x22, 12]
	bl	dprint_vfmw
	ldrh	w3, [x22, 80]
	mov	w2, w20
	mov	x1, x23
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19]
	cmp	w0, w20
	bhi	.L1129
.L1130:
	ldrb	w2, [x19, 138]
	mov	w0, 32
	ldr	x1, .LC269
	bl	dprint_vfmw
	ldrb	w0, [x19, 138]
	cbz	w0, .L1128
	ldr	x24, .LC279
	mov	w20, 0
	ldr	x23, .LC281
	.p2align 2
.L1131:
	add	x22, x21, x20, uxtw 1
	mov	w3, w20
	mov	x1, x24
	mov	w0, 32
	ldrh	w2, [x22, 150]
	bl	dprint_vfmw
	ldrh	w2, [x22, 218]
	mov	w3, w20
	mov	x1, x23
	mov	w0, 32
	add	w20, w20, 1
	bl	dprint_vfmw
	ldrb	w0, [x19, 138]
	cmp	w0, w20
	bhi	.L1131
.L1128:
	ldrh	w2, [x19, 276]
	mov	w0, 32
	ldr	x1, .LC275
	bl	dprint_vfmw
	ldrh	w2, [x19, 278]
	mov	w0, 32
	ldr	x1, .LC277
	bl	dprint_vfmw
	b	.L1124
.L1136:
	add	x19, x21, 10
	b	.L1130
	.size	HEVC_PrintSLHDR1Info, .-HEVC_PrintSLHDR1Info
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC241:
	.xword	.LC240
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC245:
	.xword	.LC244
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC251:
	.xword	.LC250
	.align	3
.LC253:
	.xword	.LC252
	.align	3
.LC255:
	.xword	.LC254
	.align	3
.LC257:
	.xword	.LC256
	.align	3
.LC259:
	.xword	.LC258
	.align	3
.LC261:
	.xword	.LC260
	.align	3
.LC263:
	.xword	.LC262
	.align	3
.LC265:
	.xword	.LC264
	.align	3
.LC267:
	.xword	.LC266
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC271:
	.xword	.LC270
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
.LC279:
	.xword	.LC278
	.align	3
.LC281:
	.xword	.LC280
	.align	3
.LC283:
	.xword	.LC282
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetSLHDR1Info
	.type	HEVC_GetSLHDR1Info, %function
HEVC_GetSLHDR1Info:
	stp	x29, x30, [sp, -352]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	x19, x2
	bl	_mcount
	mov	x2, 290
	mov	w1, 0
	add	x0, x29, 56
	bl	memset
	ldrb	w3, [x21, 5]
	cbz	w3, .L1179
	ldrb	w4, [x19, 3206]
	add	x0, x19, 4096
	cbnz	w4, .L1140
	ldrb	w6, [x19, 3212]
	ldrb	w7, [x19, 3292]
	ldrb	w5, [x0, 252]
.L1139:
	ldr	x2, .LC286
	mov	w0, 22
	ldr	x1, .LC288
	add	x2, x2, 344
	bl	dprint_vfmw
	strb	wzr, [x20, 258]
.L1137:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 352
	ret
	.p2align 3
.L1140:
	ldrb	w5, [x0, 252]
	cbz	w5, .L1180
	ldrb	w0, [x19, 3212]
	cbnz	w0, .L1142
	ldrb	w7, [x19, 3292]
	cbz	w7, .L1181
.L1142:
	mov	w0, 1
	strb	w0, [x20, 258]
	ldr	w1, [x21, 40]
	ldrb	w3, [x19, 3207]
	ldrb	w2, [x19, 3208]
	cmp	w1, 9
	strb	w3, [x29, 56]
	strb	w2, [x29, 57]
	beq	.L1182
.L1144:
	ldrb	w0, [x19, 3223]
	cmp	w0, 1
	beq	.L1145
	ldrb	w1, [x19, 3304]
	cmp	w1, 1
	beq	.L1145
	cmp	w1, 9
	ccmp	w0, 9, 4, ne
	beq	.L1183
	ldrb	w0, [x29, 64]
	strb	w0, [x29, 58]
.L1145:
	mov	x1, x19
	add	x0, x29, 56
	bl	HEVC_GetSLHDR1MasteringDisplayInfo
	ldrb	w1, [x29, 64]
	ldrb	w0, [x29, 58]
	cmp	w1, w0
	beq	.L1184
	strb	wzr, [x29, 65]
.L1148:
	ldrb	w0, [x29, 57]
	cbnz	w0, .L1149
	add	x5, x19, 3212
	ldrb	w6, [x5, 13]
	ldrb	w4, [x5, 14]
	ldrb	w3, [x5, 15]
	ldrb	w2, [x5, 16]
	ldrb	w1, [x5, 17]
	ldrb	w0, [x5, 18]
	strb	w6, [x29, 66]
	strb	w4, [x29, 67]
	strb	w3, [x29, 68]
	strb	w2, [x29, 69]
	strb	w1, [x29, 70]
	strb	w0, [x29, 71]
	cbz	w0, .L1154
	sub	w4, w0, #1
	add	x2, x29, 56
	add	x4, x4, 17
	add	x0, x29, 72
	add	x1, x19, 3246
	add	x4, x2, x4
	.p2align 2
.L1153:
	ldrb	w3, [x1, -15]
	add	x0, x0, 1
	ldrb	w2, [x1], 1
	strb	w3, [x0, -1]
	strb	w2, [x0, 10]
	cmp	x0, x4
	bne	.L1153
.L1154:
	ldrb	w0, [x5, 49]
	strb	w0, [x29, 94]
	cbz	w0, .L1152
	sub	w3, w0, #1
	add	x1, x29, 56
	add	x3, x3, 40
	add	x0, x29, 95
	add	x19, x19, 3277
	add	x3, x1, x3
	.p2align 2
.L1157:
	ldrb	w2, [x19, -15]
	add	x0, x0, 1
	ldrb	w1, [x19], 1
	strb	w2, [x0, -1]
	strb	w1, [x0, 6]
	cmp	x0, x3
	bne	.L1157
.L1152:
	ldr	w0, [x20, 264]
	cbnz	w0, .L1185
	ldr	x2, .LC286
	mov	w0, 1
	ldr	x1, .LC290
	add	x2, x2, 344
	bl	dprint_vfmw
	b	.L1137
	.p2align 3
.L1179:
	add	x0, x19, 4096
	ldrb	w4, [x19, 3206]
	ldrb	w6, [x19, 3212]
	ldrb	w7, [x19, 3292]
	ldrb	w5, [x0, 252]
	b	.L1139
	.p2align 3
.L1180:
	ldrb	w6, [x19, 3212]
	ldrb	w7, [x19, 3292]
	b	.L1139
	.p2align 3
.L1149:
	add	x5, x19, 3292
	ldrb	w0, [x5, 456]
	ldr	w2, [x5, 424]
	add	w0, w0, 1
	ldr	w1, [x5, 428]
	strh	w2, [x29, 342]
	uxtb	w0, w0
	strh	w1, [x29, 344]
	strb	w0, [x29, 66]
	cbz	w0, .L1161
	sub	w2, w0, #1
	add	x1, x29, 68
	add	x2, x2, 1877
	add	x0, x19, 3752
	add	x2, x19, x2, lsl 1
	.p2align 2
.L1160:
	ldrh	w4, [x0]
	add	x0, x0, 2
	ldrh	w3, [x0, 196]
	cmp	x0, x2
	strh	w4, [x1]
	add	x1, x1, 2
	strh	w3, [x1, 66]
	bne	.L1160
.L1161:
	ldrb	w0, [x5, 457]
	add	w0, w0, 1
	uxtb	w0, w0
	strb	w0, [x29, 204]
	cbz	w0, .L1152
	sub	w2, w0, #1
	add	x1, x29, 206
	add	x2, x2, 1910
	add	x0, x19, 3818
	add	x19, x19, x2, lsl 1
	.p2align 2
.L1162:
	ldrh	w3, [x0]
	add	x0, x0, 2
	ldrh	w2, [x0, 196]
	cmp	x0, x19
	strh	w3, [x1]
	add	x1, x1, 2
	strh	w2, [x1, 66]
	bne	.L1162
	b	.L1152
	.p2align 3
.L1185:
	ldr	x3, .LC291
	mov	x2, 290
	ldr	x0, [x20, 272]
	add	x1, x29, 56
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 290
	str	w0, [x20, 260]
	b	.L1137
	.p2align 3
.L1181:
	mov	w6, 0
	b	.L1139
	.p2align 3
.L1183:
	mov	w0, 1
	strb	w0, [x29, 58]
	b	.L1145
	.p2align 3
.L1184:
	ldrb	w0, [x29, 59]
	strb	w0, [x29, 65]
	b	.L1148
	.p2align 3
.L1182:
	ldr	w1, [x21, 48]
	cmp	w1, 9
	bne	.L1144
	strb	w0, [x29, 64]
	b	.L1144
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	3
.LC286:
	.xword	.LANCHOR1
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC290:
	.xword	.LC289
	.align	3
.LC291:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ConvertHDRInfo
	.type	HEVC_ConvertHDRInfo, %function
HEVC_ConvertHDRInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	x19, x2
	bl	_mcount
	add	x3, x21, 256
	add	x4, x19, 4096
	ldrb	w1, [x20, 4]
	add	x2, x21, 288
	add	x0, x4, 256
	add	x5, x4, 268
	strb	w1, [x3, 24]
	ldr	w1, [x20, 40]
	strb	w1, [x3, 25]
	ldr	w1, [x20, 48]
	strb	w1, [x3, 26]
	ldr	w1, [x20, 44]
	str	w1, [x3, 28]
	ldrb	w1, [x4, 252]
	strb	w1, [x21, 256]
.L1187:
	ldr	w1, [x0]
	add	x0, x0, 4
	strh	w1, [x2]
	add	x2, x2, 2
	cmp	x0, x5
	ldr	w1, [x0, 8]
	strh	w1, [x2, 4]
	bne	.L1187
	ldr	w0, [x19, 4376]
	mov	x2, x19
	strh	w0, [x3, 44]
	mov	x1, x20
	mov	x0, x21
	ldr	w5, [x19, 4380]
	strh	w5, [x3, 46]
	ldr	w5, [x19, 4384]
	str	w5, [x3, 48]
	ldr	w5, [x19, 4388]
	str	w5, [x3, 52]
	ldrb	w5, [x4, 296]
	strb	w5, [x3, 1]
	ldrh	w5, [x19, 4394]
	str	w5, [x3, 56]
	ldrh	w5, [x19, 4396]
	str	w5, [x3, 60]
	ldrb	w4, [x4, 302]
	strb	w4, [x3, 64]
	bl	HEVC_GetSLHDR1Info
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ConvertHDRInfo, .-HEVC_ConvertHDRInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_AllocFrameStore
	.type	HEVC_AllocFrameStore, %function
HEVC_AllocFrameStore:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	add	x22, x23, 53248
	add	x19, x23, 69632
	bl	_mcount
	add	x19, x19, 616
	ldr	x0, [x23, 2368]
	mov	w5, 2024
	ldr	w1, [x22, 2828]
	mov	w4, 26164
	ldr	x2, [x23, 2360]
	mov	x3, 0
	smaddl	x0, w1, w5, x0
	ldr	w21, [x0, 32]
	strb	wzr, [x22, 2017]
	smaddl	x21, w21, w4, x2
	.p2align 2
.L1195:
	ldr	w0, [x19, 4]
	cbnz	w0, .L1190
	cbz	x19, .L1191
	ldr	w2, [x23, 2716]
	cbz	w2, .L1191
	ldr	x0, [x23, 2736]
	cmp	x0, x19
	beq	.L1190
	sub	w2, w2, #1
	mov	x0, x23
	add	x2, x23, x2, lsl 3
	b	.L1193
	.p2align 3
.L1194:
	ldr	x1, [x0, 2736]
	cmp	x1, x19
	beq	.L1190
.L1193:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L1194
.L1191:
	lsl	x20, x3, 2
	mov	w0, 101
	sub	x20, x20, x3
	str	w0, [x22, 2056]
	lsl	x20, x20, 5
	mov	w0, 1
	sub	x3, x20, x3
	strb	w0, [x22, 2017]
	mov	x2, 664
	add	x0, x22, 2088
	add	x20, x23, x3, lsl 3
	add	x20, x20, 69632
	add	x1, x20, 704
	bl	memcpy
	str	x19, [x22, 2080]
	str	wzr, [x22, 2272]
	strb	wzr, [x20, 618]
	str	wzr, [x20, 636]
	strb	wzr, [x19]
	ldr	x0, [x22, 2080]
	str	wzr, [x0, 56]
	ldr	x0, [x22, 2080]
	str	wzr, [x0, 60]
	ldr	x0, [x22, 2080]
	str	wzr, [x0, 8]
	ldrb	w1, [x22, 2017]
	cmp	w1, 1
	bne	.L1199
	ldr	w0, [x23, 276]
	bl	FSP_NewLogicFs
	mov	w24, w0
	mov	w1, w0
	ldr	w0, [x23, 276]
	bl	FSP_GetLogicFs
	mov	x20, x0
	cmp	w24, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L1197
	add	x2, x23, 4096
	add	x1, x21, 2624
	add	x2, x2, 96
	add	x19, x0, 8
	bl	HEVC_ConvertHDRInfo
	ldr	x0, [x23, 2376]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L1212
.L1198:
	ldr	x21, .LC294
	mov	x2, 664
	ldr	x0, [x22, 2080]
	mov	x1, x19
	ldr	x3, [x21, 104]
	add	x0, x0, 88
	blr	x3
	ldr	x1, [x22, 2080]
	mov	x2, 664
	ldr	x3, [x21, 104]
	add	x0, x22, 2088
	add	x1, x1, 88
	blr	x3
	ldr	x1, [x22, 2080]
	mov	w0, 0
	str	w24, [x1, 32]
	ldrsb	w1, [x20, 4]
	str	w1, [x22, 2052]
.L1210:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1190:
	add	w3, w3, 1
	add	x19, x19, 760
	cmp	w3, 20
	bne	.L1195
.L1199:
	ldr	x1, .LC293
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -4
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L1212:
	ldr	x2, [x23, 29080]
	ldr	w21, [x19, 164]
	ldr	w1, [x19, 44]
	ldr	w0, [x2, 76]
	ldr	w2, [x2, 72]
	stp	w2, w0, [x19, 128]
	mul	w21, w0, w21
	add	x0, x19, 256
	stp	wzr, wzr, [x0, 104]
	stp	wzr, wzr, [x0, 112]
	str	wzr, [x19, 376]
	add	w0, w21, w1
	str	w0, [x19, 48]
	bl	MEM_Phy2Vir
	str	x0, [x19, 552]
	ldr	w2, [x19, 28]
	ldr	w1, [x19, 60]
	ldr	w3, [x19, 164]
	add	w2, w21, w2
	add	w0, w21, w1
	str	w2, [x19, 32]
	add	w3, w3, w2
	str	w0, [x19, 64]
	str	w3, [x19, 40]
	bl	MEM_Phy2Vir
	str	x0, [x19, 568]
	b	.L1198
.L1197:
	ldr	x1, .LC296
	mov	w0, 0
	strb	wzr, [x22, 2017]
	bl	dprint_vfmw
	mov	w0, -4
	b	.L1210
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC294:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC296:
	.xword	.LC295
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsVoFinish
	.type	HEVC_IsVoFinish, %function
HEVC_IsVoFinish:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x20, 276]
	bl	FSP_GetFspType
	cmn	w0, #1
	mov	w21, w0
	bne	.L1219
	b	.L1221
	.p2align 3
.L1216:
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L1218
	cmp	w19, 32
	beq	.L1222
.L1219:
	ldr	w0, [x20, 276]
	mov	w1, w19
	add	w19, w19, 1
	bl	FSP_GetLogicFs
	cbnz	x0, .L1216
	ldr	x1, .LC300
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1221:
	ldr	x1, .LC298
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1218:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1222:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_IsVoFinish, .-HEVC_IsVoFinish
	.align	3
.LC298:
	.xword	.LC297
	.align	3
.LC300:
	.xword	.LC299
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetBackPicFromVOQueue
	.type	HEVC_GetBackPicFromVOQueue, %function
HEVC_GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x22, 276]
	bl	FSP_GetFspType
	cbz	w0, .L1237
.L1224:
	add	x20, x22, 69632
	add	x23, x22, 81920
	add	x20, x20, 617
	add	x23, x23, 3529
	.p2align 2
.L1227:
	strb	wzr, [x20]
	add	x19, x20, 687
	add	x21, x20, 719
	str	wzr, [x20, 3]
.L1226:
	ldr	x1, [x19]
	cbnz	x1, .L1238
.L1225:
	add	x19, x19, 8
	cmp	x19, x21
	bne	.L1226
	add	x20, x20, 760
	cmp	x20, x23
	bne	.L1227
	ldr	w0, [x22, 180]
	cbz	w0, .L1223
	sub	w1, w0, #1
	add	x0, x22, 2148
	add	x1, x1, 538
	add	x22, x22, x1, lsl 2
	.p2align 2
.L1229:
	str	wzr, [x0], 4
	cmp	x0, x22
	bne	.L1229
.L1223:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1238:
	ldr	w0, [x22, 276]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1225
.L1237:
	add	x0, x22, 61440
	add	x0, x0, 2024
	bl	ResetVoQueue
	b	.L1224
	.size	HEVC_GetBackPicFromVOQueue, .-HEVC_GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveFrameStoreOutDPB
	.type	HEVC_RemoveFrameStoreOutDPB, %function
HEVC_RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	uxtw	x21, w1
	mov	x20, x0
	mov	x0, x30
	mov	x19, x21
	add	x22, x20, x21, lsl 3
	bl	_mcount
	ldr	x0, [x22, 2736]
	str	wzr, [x0, 4]
	ldr	x1, [x22, 2736]
	ldr	w0, [x20, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetLogicFs
	cbz	x0, .L1240
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L1241
	ldr	x1, [x22, 2736]
	mov	w2, 0
	ldr	w0, [x20, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetDisplay
.L1241:
	ldr	x1, [x22, 2736]
	mov	w2, 0
	ldr	w0, [x20, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
.L1240:
	ldr	w2, [x20, 2716]
	sub	w2, w2, #1
	cmp	w19, w2
	bhi	.L1244
	.p2align 2
.L1250:
	add	w0, w19, 1
	add	x1, x20, x21, lsl 3
	mov	w19, w0
	cmp	w0, w2
	mov	x21, x0
	add	x0, x20, x0, lsl 3
	ldr	x0, [x0, 2736]
	str	x0, [x1, 2736]
	bls	.L1250
.L1244:
	add	x0, x20, x2, uxtw 3
	str	xzr, [x0, 2736]
	str	w2, [x20, 2716]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RemoveFrameStoreOutDPB, .-HEVC_RemoveFrameStoreOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveDummyFrame
	.type	HEVC_RemoveDummyFrame, %function
HEVC_RemoveDummyFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w21, 0
	mov	w19, 0
	bl	_mcount
	ldr	w2, [x20, 2716]
	cbnz	w2, .L1261
	b	.L1254
	.p2align 3
.L1256:
	add	w19, w19, 1
	cmp	w2, w19
	mov	w21, w19
	bls	.L1254
.L1261:
	add	x0, x20, x19, sxtw 3
	ldr	x0, [x0, 2736]
	ldrb	w1, [x0]
	cbz	w1, .L1256
	mov	w1, w21
	strb	wzr, [x0]
	mov	x0, x20
	sub	w19, w19, #1
	add	w19, w19, 1
	bl	HEVC_RemoveApcStore
	mov	w1, w21
	mov	x0, x20
	mov	w21, w19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w2, [x20, 2716]
	cmp	w2, w19
	bhi	.L1261
.L1254:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RemoveUnUsedFrameStore
	.type	HEVC_RemoveUnUsedFrameStore, %function
HEVC_RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	w25, 0
	bl	_mcount
	ldr	w22, [x21, 2716]
	cbz	w22, .L1265
	mov	w26, 0
	mov	w20, 0
	mov	w24, -1
	mov	w23, 1
	.p2align 2
.L1272:
	add	x19, x21, x26, uxtw 3
	ldr	w0, [x21, 276]
	ldr	x1, [x19, 2736]
	ldr	w1, [x1, 32]
	bl	FSP_GetLogicFs
	cbz	x0, .L1266
	ldrsb	w1, [x0]
	cbnz	w1, .L1281
	ldrsb	w0, [x0, 1]
	cmp	w0, wzr
	ccmp	w0, 3, 4, ne
	ldr	x0, [x19, 2736]
	bne	.L1268
.L1284:
	ldr	w1, [x0, 8]
	cmp	w1, 1
	beq	.L1268
	str	w24, [x0, 32]
	ldr	x0, [x19, 2736]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2736]
	strb	w23, [x0, 2]
.L1281:
	ldr	x0, [x19, 2736]
.L1268:
	ldr	w0, [x0]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L1285
	add	w26, w26, 1
.L1271:
	add	w20, w20, 1
	cmp	w22, w20
	bne	.L1272
.L1265:
	mov	w0, w25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1266:
	ldr	x0, [x19, 2736]
	b	.L1284
	.p2align 3
.L1285:
	mov	w1, w26
	mov	x0, x21
	mov	w25, 1
	bl	HEVC_RemoveFrameStoreOutDPB
	b	.L1271
	.size	HEVC_RemoveUnUsedFrameStore, .-HEVC_RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SimpleSlideDPB
	.type	HEVC_SimpleSlideDPB, %function
HEVC_SimpleSlideDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2712]
	ldr	w1, [x19, 2716]
	cmp	w1, w0
	bcc	.L1286
	cmp	w0, 15
	bls	.L1289
.L1290:
	ldr	x0, [x19, 2736]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	w1, [x0, 32]
	ldr	w0, [x19, 276]
	bl	FSP_SetRef
	mov	x0, x19
	mov	w1, 0
	bl	HEVC_RemoveApcStore
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L1286:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1289:
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L1290
	b	.L1286
	.size	HEVC_SimpleSlideDPB, .-HEVC_SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetMinPOC
	.type	HEVC_GetMinPOC, %function
HEVC_GetMinPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	str	wzr, [x21]
	mov	w0, 2147483647
	str	w0, [x20]
	ldr	w3, [x19, 2712]
	ldr	w2, [x19, 2716]
	cmp	w2, w3
	bhi	.L1300
.L1293:
	mov	w0, 0
	cbz	w2, .L1292
	.p2align 2
.L1298:
	add	x1, x19, x0, uxtw 3
	ldr	w2, [x20]
	ldr	x1, [x1, 2736]
	ldr	w1, [x1, 12]
	cmp	w2, w1
	ble	.L1295
	str	w1, [x20]
	str	w0, [x21]
.L1295:
	ldr	w1, [x19, 2716]
	add	w0, w0, 1
	cmp	w1, w0
	bhi	.L1298
.L1292:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1300:
	ldr	x1, .LC302
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x19, 2712]
	str	w2, [x19, 2716]
	b	.L1293
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	3
.LC302:
	.xword	.LC301
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetReRangeFlag
	.type	HEVC_GetReRangeFlag, %function
HEVC_GetReRangeFlag:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	mov	w20, w4
	mov	w22, w2
	bl	_mcount
	add	x4, x19, 53248
	ldr	x2, [x19, 2368]
	mov	w3, 2024
	ldr	x0, [x19, 2360]
	mov	w1, 26164
	ldr	w5, [x4, 2828]
	smaddl	x3, w5, w3, x2
	ldr	w3, [x3, 32]
	smaddl	x0, w3, w1, x0
	ldr	w1, [x0, 72]
	cmp	w1, w21
	ccmp	w20, wzr, 0, eq
	bne	.L1303
	ldr	w1, [x0, 76]
	mov	w0, 1
	cmp	w1, w22
	beq	.L1307
.L1302:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1303:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1307:
	ldr	w1, [x19, 168]
	cbz	w1, .L1302
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 928]
	cmp	w0, wzr
	cset	w0, ne
	b	.L1302
	.size	HEVC_GetReRangeFlag, .-HEVC_GetReRangeFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalcStreamBits
	.type	HEVC_CalcStreamBits, %function
HEVC_CalcStreamBits:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x5, [x19, 2392]
	ldr	x0, [x19, 2344]
	ldrb	w4, [x5, 1]
	ldr	w6, [x0, 32]
	cbz	w4, .L1319
	sub	w2, w4, #1
	mov	w7, 32
	mov	x3, 88
	add	x0, x5, 56
	mov	w1, 0
	umaddl	x3, w2, w7, x3
	add	x3, x5, x3
	.p2align 2
.L1310:
	ldr	w2, [x0], 32
	cmp	x0, x3
	add	w1, w1, w2
	bne	.L1310
.L1309:
	add	x4, x5, x4, lsl 5
	and	w0, w6, 7
	str	w0, [x4, 68]
	ldr	x3, [x19, 2392]
	ldr	x0, [x19, 2344]
	ldrb	w2, [x3, 1]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w3, [x4, 60]
	add	w0, w3, w0, lsr 3
	sub	w0, w0, w1
	str	w0, [x4, 72]
	ldr	x3, [x19, 2392]
	ldr	x0, [x19, 2344]
	ldrb	w2, [x3, 1]
	ldr	w0, [x0, 32]
	add	x4, x3, x2, lsl 5
	ldr	w2, [x4, 56]
	add	w1, w1, w2
	lsl	w1, w1, 3
	sub	w0, w1, w0
	str	w0, [x4, 64]
	ldr	x1, [x19, 2392]
	ldrb	w0, [x1, 1]
	add	x0, x1, x0, lsl 5
	ldp	w2, w1, [x0, 68]
	ubfiz	w1, w1, 3, 2
	add	w1, w2, w1
	str	w1, [x0, 68]
	ldr	x1, [x19, 2392]
	ldrb	w0, [x1, 1]
	add	x0, x1, x0, lsl 5
	ldr	w1, [x0, 72]
	and	w1, w1, -4
	str	w1, [x0, 72]
	ldr	x3, [x19, 2392]
	ldr	w2, [x3, 8]
	sub	w0, w2, #1
	cmp	w0, 1
	bhi	.L1327
	ldrb	w4, [x3, 1]
	add	w1, w4, 1
	cmp	w1, 1
	ccmp	w2, w1, 0, ls
	bls	.L1313
	add	w4, w4, 2
	.p2align 2
.L1314:
	sub	w0, w4, #1
	cmp	w4, 1
	add	x1, x0, 2
	lsl	x0, x0, 5
	lsl	x1, x1, 5
	cset	w5, ls
	add	x3, x3, x1
	str	wzr, [x3, 4]
	ldr	x2, [x19, 2392]
	add	x3, x2, x0
	add	x2, x2, x1
	ldr	w3, [x3, 60]
	str	w3, [x2, 8]
	ldr	x3, [x19, 2392]
	add	x2, x3, x0
	ldr	w2, [x2, 56]
	lsl	w2, w2, 3
	str	w2, [x3, x1]
	ldr	x1, [x19, 2392]
	add	x1, x1, x0
	ldp	w3, w2, [x1, 68]
	ubfiz	w2, w2, 3, 4
	add	w2, w3, w2
	str	w2, [x1, 68]
	ldr	x1, [x19, 2392]
	add	x0, x1, x0
	ldr	w1, [x0, 72]
	and	w1, w1, -16
	str	w1, [x0, 72]
	ldr	x3, [x19, 2392]
	ldr	w0, [x3, 8]
	cmp	w0, w4
	add	w4, w4, 1
	cset	w1, hi
	tst	w5, w1
	bne	.L1314
	sub	w0, w0, #1
.L1313:
	ubfiz	x0, x0, 5, 32
	ldr	w1, [x3, 12]
	add	x3, x3, x0
	add	x5, x19, 53248
	ldr	w0, [x3, 64]
	sub	w0, w0, w1
	str	w0, [x3, 64]
	ldr	x3, [x19, 2392]
	ldrb	w1, [x3, 1]
	ldr	w4, [x3, 8]
	cmp	w1, w4
	bcs	.L1308
	.p2align 2
.L1322:
	uxtw	x0, w1
	ldr	w2, [x5, 2048]
	add	w1, w1, 1
	add	x0, x3, x0, lsl 5
	ldr	w0, [x0, 72]
	cmp	w0, w2
	bcs	.L1316
	str	w0, [x5, 2048]
	ldr	w4, [x3, 8]
.L1316:
	cmp	w4, w1
	bhi	.L1322
.L1308:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1327:
	ldr	x1, .LC304
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1319:
	mov	w1, 0
	b	.L1309
	.size	HEVC_CalcStreamBits, .-HEVC_CalcStreamBits
	.align	3
.LC304:
	.xword	.LC303
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_VpsSpsPpsCheck
	.type	HEVC_VpsSpsPpsCheck, %function
HEVC_VpsSpsPpsCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 53248
	ldr	w0, [x19, 156]
	ldr	w2, [x1, 2828]
	cmp	w2, w0
	bge	.L1336
	mov	w0, 2024
	ldr	x1, [x19, 2368]
	smull	x0, w2, w0
	add	x3, x1, x0
	ldrb	w0, [x1, x0]
	cbz	w0, .L1337
	ldr	w2, [x3, 32]
	ldr	w0, [x19, 152]
	cmp	w2, w0
	bge	.L1338
	ldr	x1, [x19, 2360]
	mov	w0, 26164
	smaddl	x0, w2, w0, x1
	ldrb	w1, [x0, 1]
	cbz	w1, .L1339
	ldr	w2, [x0, 52]
	ldr	w0, [x19, 148]
	cmp	w2, w0
	bcs	.L1340
	mov	w1, 23196
	ldr	x3, [x19, 2352]
	mov	w0, 0
	umull	x1, w2, w1
	ldrb	w1, [x3, x1]
	cbz	w1, .L1341
.L1330:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1336:
	ldr	x1, .LC306
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.p2align 3
.L1337:
	ldr	x1, .LC308
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.p2align 3
.L1338:
	ldr	x1, .LC310
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.p2align 3
.L1339:
	ldr	x1, .LC312
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.p2align 3
.L1340:
	ldr	x1, .LC314
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.p2align 3
.L1341:
	ldr	x1, .LC316
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1330
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
	.align	3
.LC306:
	.xword	.LC305
	.align	3
.LC308:
	.xword	.LC307
	.align	3
.LC310:
	.xword	.LC309
	.align	3
.LC312:
	.xword	.LC311
	.align	3
.LC314:
	.xword	.LC313
	.align	3
.LC316:
	.xword	.LC315
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNewPic
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 2392]
	mov	w0, 2147483647
	ldr	w5, [x19, 200]
	cmp	w5, w0
	ldr	w0, [x1, 16]
	sub	w2, w0, #16
	beq	.L1369
	cmp	w2, 2
	ccmp	w0, 21, 4, hi
	beq	.L1347
.L1355:
	sub	w0, w0, #19
	cmp	w0, 1
	bls	.L1370
.L1347:
	add	x0, x19, 53248
	ldr	w4, [x0, 2800]
	cmp	w4, w5
	bge	.L1346
	ldr	w6, [x1, 16]
	sub	w2, w6, #8
	cmp	w2, 1
	bls	.L1371
.L1348:
	ldrb	w3, [x19, 8]
	cbz	w3, .L1349
	ldr	w6, [x19, 204]
	cmp	w6, w4
	bgt	.L1372
.L1349:
	ldrb	w2, [x0, 2755]
	cbnz	w2, .L1350
	ldr	w1, [x1, 16]
	sub	w2, w1, #19
	cmp	w2, 1
	bls	.L1367
	cmp	w1, 21
	beq	.L1367
	sub	w1, w1, #16
	cmp	w1, 2
	bhi	.L1350
	mov	w1, 1
	str	w4, [x19, 204]
	strb	w1, [x19, 8]
	.p2align 2
.L1350:
	ldr	w1, [x19, 248]
	ldrb	w3, [x0, 2753]
	cbnz	w1, .L1353
	ldr	w2, [x0, 2828]
	mov	w0, 1
	ldr	w1, [x19, 320]
	cmp	w1, w2
	beq	.L1373
.L1364:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1369:
	cmp	w2, 5
	bhi	.L1368
	cmp	w2, 2
	ccmp	w0, 21, 4, hi
	bne	.L1355
	add	x0, x19, 53248
	ldr	w4, [x0, 2800]
	str	w4, [x19, 200]
.L1346:
	ldrb	w5, [x19, 3]
	cbz	w5, .L1348
	ldr	w6, [x1, 16]
	sub	w2, w6, #8
	cmp	w2, 1
	bhi	.L1348
	ldr	x2, .LC317
	mov	w3, 10849
	ldr	x1, .LC321
	mov	w0, 1
	add	x2, x2, 368
	bl	dprint_vfmw
	mov	w0, 2
	b	.L1364
	.p2align 3
.L1353:
	sub	w1, w1, #1
	ldr	w2, [x0, 2828]
	add	x1, x1, 16384
	add	x1, x1, 976
	ldr	w0, [x19, x1, lsl 2]
	ldr	w1, [x19, 320]
	cmp	w2, w0
	mov	w0, 1
	csinc	w3, w3, wzr, eq
	cmp	w1, w2
	bne	.L1364
.L1373:
	ldr	w0, [x19, 284]
	ldr	x19, [sp, 16]
	cmp	w0, w4
	csinc	w0, w3, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1372:
	ldr	w7, [x1, 16]
	sub	w2, w7, #8
	cmp	w2, 1
	bhi	.L1349
	ldr	x2, .LC317
	mov	w5, w4
	ldr	x1, .LC323
	mov	w4, w3
	add	x2, x2, 368
	mov	w3, 10859
	mov	w0, 1
	bl	dprint_vfmw
.L1368:
	mov	w0, 2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1367:
	strb	wzr, [x19, 8]
	str	w4, [x19, 204]
	b	.L1350
	.p2align 3
.L1370:
	mov	w5, -2147483647
	str	w5, [x19, 200]
	b	.L1347
	.p2align 3
.L1371:
	ldr	x2, .LC317
	mov	w3, 10841
	ldr	x1, .LC319
	mov	w0, 1
	add	x2, x2, 368
	bl	dprint_vfmw
	mov	w0, 2
	b	.L1364
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	3
.LC317:
	.xword	.LANCHOR1
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC323:
	.xword	.LC322
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReadByteAlignment
	.type	HEVC_ReadByteAlignment, %function
HEVC_ReadByteAlignment:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	cbz	w0, .L1379
	ldr	x0, [x19, 2344]
	mov	w20, 0
	bl	BsBitsToNextByte
	mov	w1, w0
	cbz	w0, .L1376
	ldr	x0, [x19, 2344]
	bl	BsGet
	mov	w2, w0
	ldr	x1, .LC327
	mov	w0, 19
	bl	dprint_vfmw
.L1376:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1379:
	ldr	x1, .LC325
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1376
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	3
.LC325:
	.xword	.LC324
	.align	3
.LC327:
	.xword	.LC326
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetRapPicFlag
	.type	HEVC_GetRapPicFlag, %function
HEVC_GetRapPicFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 53248
	bl	_mcount
	ldr	w0, [x19, 2824]
	ldr	x19, [sp, 16]
	sub	w0, w0, #16
	cmp	w0, 5
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetRapPicFlag, .-HEVC_GetRapPicFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetIdrPicFlag
	.type	HEVC_GetIdrPicFlag, %function
HEVC_GetIdrPicFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 53248
	bl	_mcount
	ldr	w0, [x19, 2824]
	ldr	x19, [sp, 16]
	sub	w0, w0, #19
	cmp	w0, 1
	cset	w0, ls
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetIdrPicFlag, .-HEVC_GetIdrPicFlag
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPTL
	.type	HEVC_DecPTL, %function
HEVC_DecPTL:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	w23, w2
	mov	x19, x1
	mov	w24, w3
	bl	_mcount
	ldr	x0, [x20, 2344]
	cbnz	w23, .L1420
	mov	w1, 8
	bl	BsGet
	str	w0, [x19, 284]
	cmp	w24, wzr
	ble	.L1385
.L1398:
	sub	w25, w24, #1
	add	x22, x19, 43
	add	x25, x25, 44
	mov	x21, x22
	add	x25, x19, x25
	.p2align 2
.L1387:
	cbnz	w23, .L1421
.L1386:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21], 1
	cmp	x21, x25
	bne	.L1387
	cmp	w24, 7
	mov	w21, w24
	ble	.L1407
	b	.L1397
	.p2align 3
.L1390:
	cmp	w21, 8
	beq	.L1397
.L1407:
	ldr	x0, [x20, 2344]
	mov	w1, 2
	add	w21, w21, 1
	bl	BsGet
	cbz	w0, .L1390
	ldr	x1, .LC332
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1421:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21, -6]
	b	.L1386
.L1420:
	mov	w1, 2
	mov	x21, 0
	bl	BsGet
	str	w0, [x19, 276]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 5
	ldr	x0, [x20, 2344]
	bl	BsGet
	ldr	x25, .LC328
	ldr	x22, .LC330
	str	w0, [x19, 272]
	.p2align 2
.L1384:
	ldr	x4, [x25, 136]
	mov	w3, w21
	mov	x2, x22
	mov	x1, 100
	add	x0, x29, 88
	blr	x4
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x19, x21
	add	x21, x21, 1
	cmp	x21, 32
	strb	w0, [x1, 1]
	bne	.L1384
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 33]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 34]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 35]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 36]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2344]
	mov	w1, 12
	bl	BsGet
	add	x0, x20, 86016
	ldr	w2, [x19, 272]
	mov	w1, 8
	str	w2, [x0, 2904]
	ldrb	w2, [x19, 2]
	str	w2, [x0, 2908]
	ldrb	w2, [x19, 3]
	str	w2, [x0, 2912]
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 284]
	cmp	w24, wzr
	bgt	.L1398
.L1385:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L1397:
	add	x26, x19, 360
	mov	w25, 0
	add	x19, x19, 49
	b	.L1395
	.p2align 3
.L1394:
	add	w25, w25, 1
	add	x22, x22, 1
	cmp	w24, w25
	add	x26, x26, 4
	mov	x19, x21
	ble	.L1385
.L1395:
	add	x21, x19, 32
	cbz	w23, .L1392
	ldrb	w0, [x22, -6]
	cbnz	w0, .L1422
.L1392:
	ldrb	w0, [x22]
	cbz	w0, .L1394
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	str	w0, [x26]
	b	.L1394
	.p2align 3
.L1422:
	ldr	x0, [x20, 2344]
	mov	w1, 2
	bl	BsGet
	str	w0, [x26, -72]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 198]
	mov	w1, 5
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x26, -48]
	.p2align 2
.L1393:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19], 1
	cmp	x19, x21
	bne	.L1393
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22, 204]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 210]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 216]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 222]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	ldr	x0, [x20, 2344]
	mov	w1, 12
	bl	BsGet
	b	.L1392
	.size	HEVC_DecPTL, .-HEVC_DecPTL
	.align	3
.LC328:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC330:
	.xword	.LC329
	.align	3
.LC332:
	.xword	.LC331
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetDefaultScalingList
	.type	HEVC_SetDefaultScalingList, %function
HEVC_SetDefaultScalingList:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x26, x20, 2228
	mov	w25, 0
	bl	_mcount
	ldr	x21, .LC334
	ldr	x22, .LC333
	mov	w23, 16
	ldr	x24, .LC335
.L1424:
	ldr	w0, [x26]
	cbz	w0, .L1433
	uxtw	x0, w25
	mov	w27, 0
	lsl	x28, x0, 2
	sub	x28, x28, x0
	lsl	x28, x28, 1
	.p2align 2
.L1430:
	uxtw	x19, w27
	add	x1, x21, 384
	add	x0, x19, x28
	cmp	w25, 3
	mov	x2, 64
	cbz	w25, .L1437
	add	x0, x20, x0, lsl 6
	beq	.L1438
	cmp	w27, 3
	ldr	x4, [x24, 104]
	add	x0, x0, 612
	csel	x1, x22, x1, cc
	blr	x4
.L1426:
	add	x19, x28, x19
	add	w27, w27, 1
	add	x19, x20, x19, lsl 2
	str	w23, [x19, 2244]
	ldr	w0, [x26]
	cmp	w0, w27
	bhi	.L1430
.L1433:
	add	w25, w25, 1
	add	x26, x26, 4
	cmp	w25, 4
	bne	.L1424
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1437:
	add	x0, x20, x19, lsl 6
	ldr	x1, .LC336
	ldr	x4, [x24, 104]
	mov	x2, 16
	add	x0, x0, 612
	blr	x4
	b	.L1426
.L1438:
	ldr	x0, .LC334
	uxtw	x19, w27
	cmp	w27, wzr
	ldr	x4, [x24, 104]
	add	x1, x0, 384
	ldr	x0, .LC333
	mov	x2, 64
	csel	x1, x0, x1, eq
	add	x0, x20, x19, lsl 6
	add	x0, x0, 1764
	blr	x4
	b	.L1426
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	3
.LC333:
	.xword	.LANCHOR4
	.align	3
.LC334:
	.xword	.LANCHOR1
	.align	3
.LC335:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC336:
	.xword	.LANCHOR1+448
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SetScalingList
	.type	HEVC_SetScalingList, %function
HEVC_SetScalingList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 29080]
	ldrb	w1, [x0, 5]
	cbz	w1, .L1469
	ldrb	w0, [x0, 6]
	cbnz	w0, .L1441
	ldr	x0, [x19, 29088]
	ldrb	w0, [x0, 21]
	cbz	w0, .L1478
.L1442:
	ldr	x20, .LC337
	mov	x2, 1536
	mov	w1, 0
	add	x0, x19, 612
	ldr	x3, [x20, 96]
	blr	x3
	add	x16, x19, 324
	mov	x15, 310
	mov	w12, 0
	mov	w17, 64
	mov	w14, 6
.L1444:
	ldr	w13, [x16, 1904]
	cbz	w13, .L1453
	ldr	w8, [x16]
	mov	w11, 0
	ldr	x9, [x19, 29088]
	cmp	w8, 64
	csel	w8, w8, w17, ls
	add	x9, x9, x15
	lsr	w10, w8, 2
.L1451:
	uxtw	x7, w11
	mov	w4, 0
	umaddl	x7, w12, w14, x7
	lsl	x7, x7, 4
	.p2align 2
.L1445:
	cmp	w4, w10
	bcs	.L1448
	cbz	w8, .L1445
	add	x0, x7, x4, uxtw
	ldrb	w1, [x9, -1]
	mov	x6, x9
	mov	w3, 0
	add	x0, x19, x0, lsl 2
	ldr	w2, [x0, 612]
	orr	w1, w2, w1
	str	w1, [x0, 612]
	.p2align 2
.L1464:
	add	w3, w3, 1
	add	x0, x7, x4, uxtw
	cmp	w3, w8
	and	w5, w3, 3
	add	x0, x19, x0, lsl 2
	lsl	w1, w5, 3
	beq	.L1445
	ldrb	w2, [x6], 1
	cmp	w5, 3
	ldr	w5, [x0, 612]
	csinc	w4, w4, w4, ne
	lsl	w1, w2, w1
	orr	w1, w5, w1
	str	w1, [x0, 612]
	b	.L1464
.L1448:
	add	w11, w11, 1
	add	x9, x9, 64
	cmp	w11, w13
	bne	.L1451
.L1453:
	add	x15, x15, 384
	add	w12, w12, 1
	cmp	x15, 1846
	add	x16, x16, 4
	bne	.L1444
	ldr	x1, [x19, 29088]
	mov	x2, 96
	ldr	x3, [x20, 104]
	add	x0, x19, 2244
	add	x1, x1, 1928
	blr	x3
.L1469:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1441:
	ldr	x0, [x19, 29088]
	ldrb	w0, [x0, 21]
	cbnz	w0, .L1442
	ldr	x20, .LC337
	mov	w1, 0
	mov	x2, 1536
	add	x0, x19, 612
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x1, [x19, 29080]
	add	x16, x19, 324
	mov	w13, 0
	mov	w18, 64
	mov	w15, 6
	add	x17, x1, 910
.L1454:
	ldr	w14, [x16, 1904]
	cbz	w14, .L1463
	ldr	w9, [x16]
	mov	x10, x17
	mov	w12, 0
	cmp	w9, 64
	csel	w9, w9, w18, ls
	lsr	w11, w9, 2
.L1461:
	uxtw	x8, w12
	mov	w5, 0
	umaddl	x8, w13, w15, x8
	lsl	x8, x8, 4
	.p2align 2
.L1455:
	cmp	w5, w11
	bcs	.L1458
	cbz	w9, .L1455
	add	x0, x8, x5, uxtw
	ldrb	w2, [x10, -1]
	mov	x7, x10
	mov	w4, 0
	add	x0, x19, x0, lsl 2
	ldr	w3, [x0, 612]
	orr	w2, w3, w2
	str	w2, [x0, 612]
	.p2align 2
.L1465:
	add	w4, w4, 1
	add	x0, x8, x5, uxtw
	cmp	w4, w9
	and	w6, w4, 3
	add	x0, x19, x0, lsl 2
	lsl	w2, w6, 3
	beq	.L1455
	ldrb	w3, [x7], 1
	cmp	w6, 3
	ldr	w6, [x0, 612]
	csinc	w5, w5, w5, ne
	lsl	w2, w3, w2
	orr	w2, w6, w2
	str	w2, [x0, 612]
	b	.L1465
.L1458:
	add	w12, w12, 1
	add	x10, x10, 64
	cmp	w12, w14
	bne	.L1461
.L1463:
	add	w13, w13, 1
	add	x17, x17, 384
	cmp	w13, 4
	add	x16, x16, 4
	bne	.L1454
	ldr	x3, [x20, 104]
	mov	x2, 96
	add	x1, x1, 2528
	add	x0, x19, 2244
	blr	x3
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1478:
	mov	x0, x19
	bl	HEVC_SetDefaultScalingList
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_SetScalingList, .-HEVC_SetScalingList
	.align	3
.LC337:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CalScalingList
	.type	HEVC_CalScalingList, %function
HEVC_CalScalingList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	uxtw	x22, w3
	mov	x21, x1
	bl	_mcount
	add	x0, x20, x19, uxtw 2
	mov	w9, 6
	mov	w8, 64
	mov	w5, 0
	umaddl	x9, w19, w9, x22
	ldr	w0, [x0, 324]
	lsl	x9, x9, 4
	cmp	w0, w8
	csel	w8, w0, w8, ls
	lsr	w10, w8, 2
	.p2align 2
.L1480:
	cmp	w5, w10
	bcs	.L1479
	cbz	w8, .L1480
	add	x0, x9, x5, uxtw
	mov	x7, x21
	mov	w4, 0
	add	x0, x20, x0, lsl 2
	ldrb	w2, [x7], 1
	ldr	w3, [x0, 612]
	orr	w2, w3, w2
	str	w2, [x0, 612]
	.p2align 2
.L1486:
	add	w4, w4, 1
	add	x0, x9, x5, uxtw
	cmp	w8, w4
	and	w6, w4, 3
	add	x0, x20, x0, lsl 2
	lsl	w2, w6, 3
	beq	.L1480
	ldrb	w3, [x7], 1
	cmp	w6, 3
	ldr	w6, [x0, 612]
	csinc	w5, w5, w5, ne
	lsl	w2, w3, w2
	orr	w2, w6, w2
	str	w2, [x0, 612]
	b	.L1486
.L1479:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_CalScalingList, .-HEVC_CalScalingList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetScalingListDefaultAddress
	.type	HEVC_GetScalingListDefaultAddress, %function
HEVC_GetScalingListDefaultAddress:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 3
	bls	.L1500
	ldr	x1, .LC341
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1500:
	ldr	x0, .LC339
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1490
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1490:
	.section	.rodata
	.align	0
	.align	2
.L1490:
	.byte	(.L1494 - .Lrtx1490) / 4
	.byte	(.L1492 - .Lrtx1490) / 4
	.byte	(.L1492 - .Lrtx1490) / 4
	.byte	(.L1493 - .Lrtx1490) / 4
	.text
	.p2align 3
.L1492:
	cmp	w20, 2
	ldr	x0, .LC338
	bhi	.L1497
.L1498:
	add	x0, x0, 144
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1493:
	ldr	x0, .LC338
	cbz	w20, .L1498
.L1497:
	add	x0, x0, 80
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1494:
	ldr	x0, .LC338
	ldp	x19, x20, [sp, 16]
	add	x0, x0, 64
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	3
.LC338:
	.xword	.LANCHOR4
	.align	3
.LC339:
	.xword	.L1490
	.align	3
.LC341:
	.xword	.LC340
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecRefPicListsModification
	.type	HEVC_DecRefPicListsModification, %function
HEVC_DecRefPicListsModification:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	x23, x2
	mov	w20, w3
	bl	_mcount
	cmp	x21, xzr
	ccmp	x23, xzr, 4, ne
	ccmp	x22, xzr, 4, ne
	beq	.L1511
	sub	w0, w20, #1
	mov	w19, 1
	asr	w0, w0, 1
	cbz	w0, .L1503
	.p2align 2
.L1504:
	asr	w0, w0, 1
	add	w19, w19, 1
	cbnz	w0, .L1504
.L1503:
	ldr	x0, [x22, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w20, 1
	strb	w0, [x23]
	cset	w24, hi
	cmp	w0, wzr
	cset	w0, ne
	tst	w24, w0
	beq	.L1508
	ldr	w0, [x21, 168]
	cbz	w0, .L1508
	mov	w20, 0
	.p2align 2
.L1509:
	ldr	x0, [x22, 2344]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 4]
	ldr	w0, [x21, 168]
	cmp	w0, w20
	bhi	.L1509
.L1508:
	ldr	w0, [x21, 60]
	cbz	w0, .L1526
.L1507:
	mov	w0, 0
.L1502:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1526:
	ldr	x0, [x22, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, wzr
	strb	w0, [x23, 1]
	cset	w0, ne
	tst	w24, w0
	beq	.L1507
	ldr	w0, [x21, 172]
	cbz	w0, .L1507
	mov	w20, 0
	.p2align 2
.L1510:
	ldr	x0, [x22, 2344]
	mov	w1, w19
	bl	BsGet
	add	x1, x23, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 132]
	ldr	w0, [x21, 172]
	cmp	w0, w20
	bhi	.L1510
	b	.L1507
.L1511:
	mov	w0, -1
	b	.L1502
	.size	HEVC_DecRefPicListsModification, .-HEVC_DecRefPicListsModification
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_MoreRbspData
	.type	HEVC_MoreRbspData, %function
HEVC_MoreRbspData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1529
	ldr	x1, [x19, 2392]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	cset	w0, cc
	ret
	.p2align 3
.L1529:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_MoreRbspData, .-HEVC_MoreRbspData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_More_Rbsp_Data
	.type	HEVC_More_Rbsp_Data, %function
HEVC_More_Rbsp_Data:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2344]
	ldr	w2, [x0, 24]
	ldr	w3, [x0, 32]
	lsl	w2, w2, 3
	cmp	w2, w3
	bls	.L1533
	mov	w1, 8
	bl	BsShow
	cmp	w0, 128
	cset	w0, ne
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1533:
	ldr	x1, .LC343
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
	.align	3
.LC343:
	.xword	.LC342
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FindTrailZeros
	.type	HEVC_FindTrailZeros, %function
HEVC_FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
.L1547:
	ldr	x1, [x20, 2392]
	mov	w3, 0
	ldr	w5, [x1, 8]
	sub	w5, w5, #1
	add	x2, x1, x5, lsl 5
	ldr	w0, [x2, 56]
	ldr	x2, [x2, 48]
	sub	x0, x0, #1
	add	x0, x2, x0
	.p2align 2
.L1535:
	ldrb	w2, [x0]
	lsl	x19, x5, 5
	add	x4, x1, x19
	cbnz	w2, .L1548
	ldr	x2, [x1, 48]
	add	w3, w3, 1
	cmp	x0, x2
	beq	.L1549
	ldr	x2, [x4, 48]
	cmp	x0, x2
	sub	x0, x0, #1
	bne	.L1535
	add	x1, x1, x5, lsl 5
	ldr	w0, [x20, 276]
	ldr	w1, [x1, 76]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x20, 2392]
	add	x19, x0, x19
	str	xzr, [x19, 48]
	ldr	x1, [x20, 2392]
	ldr	w0, [x1, 8]
	sub	w0, w0, #1
	str	w0, [x1, 8]
	b	.L1547
	.p2align 3
.L1548:
	mov	w0, 1
	mov	w5, w0
	tbnz	x2, 0, .L1542
	.p2align 2
.L1545:
	lsl	w4, w5, w0
	add	w0, w0, 1
	tst	w4, w2
	bne	.L1542
	cmp	w0, 8
	bne	.L1545
	ldr	x1, .LC347
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1549:
	ldr	x1, .LC345
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1542:
	str	wzr, [x1, 4]
	add	w3, w0, w3, lsl 3
	mov	w0, 0
	ldr	x1, [x20, 2392]
	str	w3, [x1, 12]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FindTrailZeros, .-HEVC_FindTrailZeros
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC347:
	.xword	.LC346
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FindNaluArraySlot
	.type	HEVC_FindNaluArraySlot, %function
HEVC_FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 160]
	ldr	w0, [x19, 140]
	add	w3, w3, 1
	cmp	w3, wzr
	ble	.L1551
	udiv	w1, w0, w3
	add	x2, x19, 65536
	ldr	x5, [x2, 3896]
	mov	w2, 0
	msub	w4, w1, w3, w0
	lsl	x1, x4, 3
	mov	x0, x4
	sub	x1, x1, x4
	add	x1, x5, x1, lsl 4
	ldr	w1, [x1, 36]
	cbnz	w1, .L1554
	b	.L1552
	.p2align 3
.L1555:
	udiv	w0, w1, w3
	msub	w4, w0, w3, w1
	lsl	x1, x4, 3
	mov	x0, x4
	sub	x1, x1, x4
	add	x1, x5, x1, lsl 4
	ldr	w1, [x1, 36]
	cbz	w1, .L1552
.L1554:
	add	w2, w2, 1
	cmp	w3, w2
	add	w1, w2, w0
	bne	.L1555
.L1551:
	str	w0, [x19, 140]
.L1566:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1552:
	cmp	w0, w3
	str	w0, [x19, 140]
	bcs	.L1566
	lsl	x1, x4, 3
	mov	w2, 1
	sub	x4, x1, x4
	add	x5, x5, x4, lsl 4
	str	w2, [x5, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FindNaluArraySlot, .-HEVC_FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReleaseNAL
	.type	HEVC_ReleaseNAL, %function
HEVC_ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1576
	ldr	x24, .LC350
	add	x19, x20, 48
	ldr	x23, .LC352
	add	x22, x20, 112
	stp	wzr, wzr, [x20, 36]
.L1571:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L1570
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w4, [x19, 8]
	mov	x2, x24
	ldr	x3, [x19]
	mov	x1, x23
	mov	w0, 7
	bl	dprint_vfmw
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L1570:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L1571
	ldr	x3, .LC353
	mov	x2, 112
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
.L1567:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1576:
	ldr	x2, .LC348
	mov	w3, 12146
	ldr	x1, .LC349
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1567
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	3
.LC348:
	.xword	.LC97
	.align	3
.LC349:
	.xword	.LC99
	.align	3
.LC350:
	.xword	.LANCHOR5
	.align	3
.LC352:
	.xword	.LC351
	.align	3
.LC353:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Hevc_InitDecBuffers
	.type	Hevc_InitDecBuffers, %function
Hevc_InitDecBuffers:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x21, 29080]
	ldr	w0, [x0, 236]
	add	w0, w0, 1
	cmp	w0, 17
	bls	.L1609
	mov	w0, 17
.L1609:
	add	x2, x21, 2560
	add	x1, x21, 3008
	stp	w0, wzr, [x2, 152]
	stp	wzr, wzr, [x2, 160]
	str	wzr, [x21, 2728]
	add	x0, x21, 2872
	str	wzr, [x21, 2732]
	.p2align 2
.L1580:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x0, x1
	bne	.L1580
	add	x22, x21, 69632
	ldr	x23, .LC354
	add	x19, x22, 616
	mov	w20, 0
	mov	w26, 20
	mov	w25, 16
	.p2align 2
.L1581:
	ldr	x3, [x23, 96]
	add	x0, x19, 88
	mov	x2, 664
	mov	w1, 0
	mov	w24, 16
	blr	x3
	str	w20, [x19, 268]
	add	w20, w20, 1
	strb	wzr, [x19]
	strb	wzr, [x19, 1]
	cmp	w20, 20
	strb	wzr, [x19, 2]
	str	wzr, [x19, 4]
	str	wzr, [x19, 12]
	stp	w26, w25, [x19, 24]
	str	wzr, [x19, 52]
	str	x19, [x19, 80]
	add	x19, x19, 760
	bne	.L1581
	ldr	x3, [x23, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x21, 3280
	blr	x3
	str	w24, [x21, 3280]
	add	x1, x21, 2400
	add	x0, x21, 2536
	str	wzr, [x21, 3284]
	.p2align 2
.L1582:
	str	xzr, [x1], 8
	cmp	x0, x1
	bne	.L1582
	add	x2, x21, 53248
	add	x1, x21, 2672
	str	wzr, [x2, 2912]
	.p2align 2
.L1583:
	str	xzr, [x0], 8
	cmp	x0, x1
	bne	.L1583
	str	wzr, [x2, 2916]
	ldr	w0, [x21, 180]
	cbz	w0, .L1588
	sub	w1, w0, #1
	add	x0, x21, 2148
	add	x1, x1, 538
	add	x1, x21, x1, lsl 2
	.p2align 2
.L1587:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L1587
.L1588:
	ldr	w3, [x21, 160]
	mov	w20, 0
	cbz	w3, .L1577
	.p2align 2
.L1601:
	uxtw	x0, w20
	ldr	x1, [x22, 608]
	lsl	x19, x0, 5
	add	w20, w20, 1
	add	x19, x19, x0, lsl 3
	add	x0, x1, x19
	ldr	x0, [x0, 32]
	mov	x1, x0
	cbz	x0, .L1589
	ldr	x2, [x21, 2392]
	cmp	x0, x2
	beq	.L1589
	ldr	w0, [x21, 276]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x22, 608]
	mov	w2, 2
	add	x0, x0, x19
	str	xzr, [x0, 32]
	ldr	w1, [x21, 208]
	ldr	w0, [x21, 248]
	ldr	w4, [x21, 172]
	cmp	w1, wzr
	cset	w7, ne
	cmp	w0, wzr
	cset	w5, ne
	sub	w6, w4, #1
	cmp	w4, 3
	ldr	w3, [x21, 160]
	sub	w1, w1, w7
	csel	w2, w6, w2, cs
	sub	w0, w0, w5
	str	w2, [x21, 172]
	str	w1, [x21, 208]
	str	w0, [x21, 248]
.L1589:
	cmp	w3, w20
	bhi	.L1601
.L1577:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	Hevc_InitDecBuffers, .-Hevc_InitDecBuffers
	.align	3
.LC354:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_EmptyFrmFromDPB
	.type	HEVC_EmptyFrmFromDPB, %function
HEVC_EmptyFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1621
	ldr	w3, [x20, 2716]
	mov	w0, 0
	mov	w4, 1
	cbz	w3, .L1616
	.p2align 2
.L1630:
	add	x1, x20, x0, uxtw 3
	add	w0, w0, 1
	ldr	x1, [x1, 2736]
	ldrb	w2, [x1, 2]
	cbnz	w2, .L1614
	strb	w4, [x1, 2]
	ldr	w3, [x20, 2716]
.L1614:
	cmp	w3, w0
	bhi	.L1630
.L1616:
	mov	w0, -2147483647
	add	x19, x20, 2736
	add	x21, x20, 2872
	str	w0, [x20, 244]
	.p2align 2
.L1613:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L1617
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L1617:
	ldr	x0, [x19, 136]
	mov	w2, 1
	cbz	x0, .L1618
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L1618:
	ldr	x0, [x19, 272]
	mov	w2, 1
	cbz	x0, .L1619
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L1619:
	ldr	x0, [x19, 408]
	mov	w2, 1
	cbz	x0, .L1620
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L1620:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L1613
	mov	x0, x20
	bl	Hevc_InitDecBuffers
	mov	w0, 0
.L1611:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1621:
	mov	w0, -1
	b	.L1611
	.size	HEVC_EmptyFrmFromDPB, .-HEVC_EmptyFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CombinePacket
	.type	HEVC_CombinePacket, %function
HEVC_CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 2392]
	cbz	x0, .L1640
	ldr	w0, [x0, 56]
	cmp	w0, 4095
	bhi	.L1637
	ldr	x1, .LC358
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	ldr	x3, .LC359
	ldr	w2, [x1, 56]
	ldr	x0, [x1, 80]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 48]
	sub	x0, x0, x2
	blr	x3
	ldr	x0, [x19, 2392]
	mov	w3, 1
	ldr	w2, [x0, 108]
	ldr	w1, [x0, 76]
	str	w2, [x0, 76]
	ldr	x0, [x19, 2392]
	str	wzr, [x0, 68]
	ldr	x0, [x19, 2392]
	ldr	w4, [x0, 56]
	ldr	x2, [x0, 80]
	sub	x2, x2, x4
	str	x2, [x0, 48]
	ldr	x0, [x19, 2392]
	ldr	w4, [x0, 56]
	ldr	w2, [x0, 92]
	sub	w2, w2, w4
	str	w2, [x0, 60]
	ldr	x0, [x19, 2392]
	ldr	w4, [x0, 56]
	ldr	w2, [x0, 88]
	add	w2, w4, w2
	str	w2, [x0, 56]
	ldr	x0, [x19, 2392]
	str	w3, [x0, 8]
	ldr	w0, [x19, 276]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 2392]
	str	xzr, [x0, 80]
	ldr	x0, [x19, 2392]
	str	wzr, [x0, 100]
	ldr	x0, [x19, 2392]
	str	wzr, [x0, 88]
.L1637:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1640:
	ldr	x1, .LC356
	bl	dprint_vfmw
	b	.L1637
	.size	HEVC_CombinePacket, .-HEVC_CombinePacket
	.align	3
.LC356:
	.xword	.LC355
	.align	3
.LC358:
	.xword	.LC357
	.align	3
.LC359:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsOutDPB
	.type	HEVC_IsOutDPB, %function
HEVC_IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1646
	ldr	w3, [x19, 2716]
	cbz	w3, .L1646
	ldr	x0, [x19, 2736]
	cmp	x20, x0
	beq	.L1648
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1643
	.p2align 3
.L1644:
	ldr	x2, [x0, 2736]
	cmp	x20, x2
	beq	.L1648
.L1643:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1644
.L1646:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1648:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IsOutDPB, .-HEVC_IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IsNewPicNal
	.type	HEVC_IsNewPicNal, %function
HEVC_IsNewPicNal:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	HEVC_IsNewPicNal, .-HEVC_IsNewPicNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_u_v
	.type	HEVC_u_v, %function
HEVC_u_v:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_u_v, .-HEVC_u_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_f_v
	.type	HEVC_f_v, %function
HEVC_f_v:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_f_v, .-HEVC_f_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ue_v
	.type	HEVC_ue_v, %function
HEVC_ue_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L1655
	ldr	x1, .LC361
	mov	w2, w0
	mov	w3, -4370
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -4370
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1655:
	mov	w1, w0
	mov	x0, x19
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x19
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w21
	mov	x0, x19
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ue_v, .-HEVC_ue_v
	.align	3
.LC361:
	.xword	.LC360
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Tone_Mapping_Info
	.type	HEVC_Sei_Tone_Mapping_Info, %function
HEVC_Sei_Tone_Mapping_Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC363
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 4]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19]
	cbz	w0, .L1657
	ldr	w2, [x19, 16]
.L1658:
	cmp	w2, 4
	mov	w1, 0
	bls	.L1679
.L1660:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1679:
	ldr	x0, .LC366
	ldrb	w0, [x0,w2,uxtw]
	adr	x1, .Lrtx1662
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1662:
	.section	.rodata
	.align	0
	.align	2
.L1662:
	.byte	(.L1661 - .Lrtx1662) / 4
	.byte	(.L1663 - .Lrtx1662) / 4
	.byte	(.L1664 - .Lrtx1662) / 4
	.byte	(.L1665 - .Lrtx1662) / 4
	.byte	(.L1666 - .Lrtx1662) / 4
	.text
	.p2align 3
.L1657:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 8]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	cmp	w0, 8
	str	w0, [x19, 12]
	bhi	.L1680
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	mov	w2, w0
	str	w0, [x19, 16]
	b	.L1658
	.p2align 3
.L1665:
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	cmp	w0, 256
	str	w0, [x19, 80]
	bhi	.L1670
	mov	w21, 0
	cbz	w0, .L1673
	.p2align 2
.L1676:
	ldr	w1, [x19, 8]
	add	x22, x19, x21, uxtw 2
	ldr	x0, [x20, 2344]
	add	w21, w21, 1
	add	w1, w1, 7
	and	w1, w1, -8
	bl	BsGet
	str	w0, [x22, 84]
	ldr	w1, [x19, 12]
	ldr	x0, [x20, 2344]
	add	w1, w1, 7
	and	w1, w1, -8
	bl	BsGet
	str	w0, [x22, 1108]
	ldr	w0, [x19, 80]
	cmp	w0, w21
	bhi	.L1676
.L1673:
	mov	w1, 0
	ldr	x23, [sp, 48]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1664:
	ldr	w23, [x19, 12]
	mov	w0, 1
	lsl	w23, w0, w23
	cbz	w23, .L1669
	sub	w22, w23, #1
	add	x21, x19, 2132
	add	x22, x22, 534
	add	x22, x19, x22, lsl 2
	.p2align 2
.L1668:
	ldr	w1, [x19, 8]
	ldr	x0, [x20, 2344]
	add	w1, w1, 7
	and	w1, w1, -8
	bl	BsGet
	str	w0, [x21], 4
	cmp	x22, x21
	bne	.L1668
.L1669:
	add	x23, x19, x23, uxtw 2
	ldr	w2, [x19, 8]
	mov	w0, 1
	mov	w1, 0
	lsl	w0, w0, w2
	str	w0, [x23, 2132]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1663:
	ldr	x0, [x20, 2344]
	mov	w1, 32
	bl	BsGet
	str	w0, [x19, 28]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 32]
	mov	w1, 0
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1661:
	ldr	x0, [x20, 2344]
	mov	w1, 32
	bl	BsGet
	str	w0, [x19, 20]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 24]
	mov	w1, 0
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1666:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	str	w0, [x19, 36]
	beq	.L1681
.L1674:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 52]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 56]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 60]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 64]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 68]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 72]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 52]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 76]
	mov	w1, 0
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1681:
	ldr	x0, [x20, 2344]
	mov	w1, 32
	bl	BsGet
	str	w0, [x19, 40]
	b	.L1674
.L1680:
	ldr	x1, .LC365
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L1660
.L1670:
	ldr	x1, .LC368
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L1660
	.size	HEVC_Sei_Tone_Mapping_Info, .-HEVC_Sei_Tone_Mapping_Info
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.align	3
.LC366:
	.xword	.L1662
	.align	3
.LC368:
	.xword	.LC367
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Frame_Packing_Arrangement
	.type	HEVC_Sei_Frame_Packing_Arrangement, %function
HEVC_Sei_Frame_Packing_Arrangement:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC370
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 12]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L1683
	ldr	x0, [x19, 2344]
	mov	w1, 7
	bl	BsGet
	sub	w1, w0, #3
	cmp	w1, 2
	str	w0, [x20, 16]
	bhi	.L1690
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 1]
	mov	w1, 6
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 20]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 2]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 4]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 5]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 6]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 7]
	ldrb	w1, [x20, 1]
	cbnz	w1, .L1686
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L1686
	ldr	x0, [x19, 2344]
	mov	w1, 4
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 4
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 28]
	mov	w1, 4
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 32]
	mov	w1, 4
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 36]
.L1686:
	ldr	x0, [x19, 2344]
	mov	w1, 8
	bl	BsGet
	str	w0, [x20, 40]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 8]
.L1683:
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 9]
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L1685:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1690:
	ldr	x1, .LC372
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1685
	.size	HEVC_Sei_Frame_Packing_Arrangement, .-HEVC_Sei_Frame_Packing_Arrangement
	.align	3
.LC370:
	.xword	.LC369
	.align	3
.LC372:
	.xword	.LC371
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Dec_Unit_Info
	.type	HEVC_Sei_Dec_Unit_Info, %function
HEVC_Sei_Dec_Unit_Info:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	ccmp	x19, xzr, 4, ne
	beq	.L1696
	ldr	x1, .LC374
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 4]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L1700
	str	wzr, [x20, 8]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L1701
.L1695:
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L1692:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1700:
	ldr	w1, [x21, 8]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x20, 8]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20]
	cbz	w0, .L1695
.L1701:
	ldr	w1, [x21, 12]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x20, 12]
	b	.L1695
	.p2align 3
.L1696:
	mov	w0, -1
	b	.L1692
	.size	HEVC_Sei_Dec_Unit_Info, .-HEVC_Sei_Dec_Unit_Info
	.align	3
.LC374:
	.xword	.LC373
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Active_Param_sets
	.type	HEVC_Sei_Active_Param_sets, %function
HEVC_Sei_Active_Param_sets:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x21, 2344]
	mov	w1, 4
	bl	BsGet
	str	w0, [x20, 4]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 1]
	ldr	x1, .LC376
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 15
	str	w0, [x20, 8]
	bgt	.L1703
	tbnz	w0, #31, .L1707
	ldr	x22, .LC380
	mov	w19, 0
	.p2align 2
.L1706:
	ldr	x0, [x21, 2344]
	mov	x1, x22
	bl	HEVC_ue_v
	add	x1, x20, x19, sxtw 2
	add	w19, w19, 1
	str	w0, [x1, 12]
	ldr	w0, [x20, 8]
	cmp	w0, w19
	bge	.L1706
.L1707:
	ldr	x0, [x21, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L1705:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1703:
	ldr	x1, .LC378
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1705
	.size	HEVC_Sei_Active_Param_sets, .-HEVC_Sei_Active_Param_sets
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC378:
	.xword	.LC377
	.align	3
.LC380:
	.xword	.LC379
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Buf_Period
	.type	HEVC_Sei_Buf_Period, %function
HEVC_Sei_Buf_Period:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 28672
	mov	x22, x1
	mov	x23, x2
	bl	_mcount
	ldr	x1, .LC382
	ldr	w0, [x19, 320]
	ldr	w2, [x19, 328]
	add	w0, w0, 1
	str	wzr, [x19, 328]
	str	w0, [x19, 320]
	str	w2, [x19, 340]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 15
	str	w0, [x22, 4]
	bhi	.L1737
	mov	w0, 1
	strb	w0, [x19, 393]
	ldrb	w0, [x23, 2]
	cbz	w0, .L1712
	ldrb	w0, [x22]
	cbnz	w0, .L1738
.L1714:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x22, 1]
	ldr	w1, [x23, 32]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x22, 16]
	ldr	w2, [x23, 48]
	cmp	w2, 31
	bhi	.L1739
.L1715:
	mov	w21, 1
	mov	w19, 0
.L1716:
	cbz	w19, .L1740
	cmp	w19, 1
	beq	.L1741
.L1721:
	cmp	w21, 1
	bhi	.L1720
.L1719:
	add	w21, w21, 1
	add	w19, w19, 1
	b	.L1716
	.p2align 3
.L1720:
	ldr	x0, [x20, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L1736:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1712:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x22]
	cbz	w0, .L1714
.L1738:
	ldr	w1, [x23, 32]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x22, 8]
	ldr	w1, [x23, 36]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x22, 12]
	b	.L1714
	.p2align 3
.L1739:
	ldr	x1, .LC386
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 48]
	b	.L1715
.L1737:
	ldr	x1, .LC384
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1736
.L1740:
	ldrb	w0, [x23]
	cbz	w0, .L1721
	ldr	w0, [x23, 48]
	mov	w25, 0
	cmn	w0, #1
	beq	.L1719
.L1726:
	uxtw	x26, w19
.L1725:
	add	x24, x26, x25, uxtw 1
	ldr	w1, [x23, 28]
	ldr	x0, [x20, 2344]
	add	w25, w25, 1
	add	x24, x22, x24, lsl 4
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x24, 20]
	ldr	w1, [x23, 28]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x24, 24]
	ldrb	w0, [x23, 2]
	cbnz	w0, .L1723
	ldrb	w0, [x22]
	cbz	w0, .L1724
.L1723:
	ldr	w1, [x23, 28]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x24, 28]
	ldr	w1, [x23, 28]
	ldr	x0, [x20, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x24, 32]
.L1724:
	ldr	w0, [x23, 48]
	add	w0, w0, 1
	cmp	w0, w25
	bhi	.L1725
	b	.L1721
.L1741:
	ldrb	w0, [x23, 1]
	cbz	w0, .L1720
	ldr	w0, [x23, 48]
	cmn	w0, #1
	beq	.L1720
	mov	w25, 0
	b	.L1726
	.size	HEVC_Sei_Buf_Period, .-HEVC_Sei_Buf_Period
	.align	3
.LC382:
	.xword	.LC381
	.align	3
.LC384:
	.xword	.LC383
	.align	3
.LC386:
	.xword	.LC385
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Pic_Timming
	.type	HEVC_Sei_Pic_Timming, %function
HEVC_Sei_Pic_Timming:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x2
	mov	x20, x1
	bl	_mcount
	add	x0, x19, 28672
	ldr	w2, [x0, 324]
	ldr	w1, [x0, 328]
	add	w2, w2, 1
	str	w2, [x0, 324]
	add	w1, w1, 1
	str	w1, [x0, 328]
	ldrb	w0, [x21, 9]
	cbnz	w0, .L1769
.L1743:
	ldrh	w0, [x21, 108]
	add	x22, x21, 108
	cbz	w0, .L1745
	ldr	w1, [x22, 32]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x20, 12]
	ldr	w1, [x22, 36]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x20, 16]
	ldrb	w0, [x22, 2]
	cbnz	w0, .L1746
.L1749:
	ldrsw	x1, [x19, 276]
	ldr	x0, .LC387
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L1770
.L1745:
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L1752:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1769:
	ldr	x0, [x19, 2344]
	mov	w1, 4
	bl	BsGet
	str	w0, [x20, 4]
	mov	w1, 2
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x20, 8]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20]
	b	.L1743
	.p2align 3
.L1770:
	ldr	x1, [x0, 176]
	mov	x0, 4294967296
	cmp	x1, x0
	bne	.L1745
	mov	x2, x21
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1745
	.p2align 3
.L1746:
	ldr	w1, [x22, 12]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x20, 20]
	ldrb	w0, [x22, 2]
	cbz	w0, .L1749
	ldrb	w0, [x22, 3]
	cbz	w0, .L1749
	ldr	x1, .LC389
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 24]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L1771
.L1750:
	ldr	w0, [x20, 24]
	cmp	w0, 255
	bhi	.L1772
	ldr	x25, .LC393
	mov	w23, 0
	b	.L1754
	.p2align 3
.L1753:
	ldr	w0, [x20, 24]
	cmp	w0, w23
	bcc	.L1749
.L1754:
	add	x24, x20, x23, uxtw 2
	ldr	x0, [x19, 2344]
	mov	x1, x25
	add	w23, w23, 1
	bl	HEVC_ue_v
	str	w0, [x24, 32]
	ldrb	w0, [x20, 1]
	cbnz	w0, .L1753
	ldr	w1, [x22, 8]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x24, 1056]
	b	.L1753
	.p2align 3
.L1771:
	ldr	w1, [x22, 8]
	ldr	x0, [x19, 2344]
	add	w1, w1, 1
	bl	BsGet
	str	w0, [x20, 28]
	b	.L1750
.L1772:
	ldr	x1, .LC391
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1752
	.size	HEVC_Sei_Pic_Timming, .-HEVC_Sei_Pic_Timming
	.align	3
.LC387:
	.xword	s_pstVfmwChan
	.align	3
.LC389:
	.xword	.LC388
	.align	3
.LC391:
	.xword	.LC390
	.align	3
.LC393:
	.xword	.LC392
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Color_Volume_Reconstruction_Info
	.type	HEVC_Sei_Color_Volume_Reconstruction_Info, %function
HEVC_Sei_Color_Volume_Reconstruction_Info:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L1783
	ldr	x1, .LC395
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 4]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbz	w0, .L1775
.L1779:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x19]
.L1774:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1775:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 10]
	beq	.L1788
.L1776:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	mov	w21, 0
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 14]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 4
	ldr	x0, [x20, 2344]
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 18]
	cbz	w1, .L1781
	.p2align 2
.L1785:
	add	x22, x19, x21, uxtw
	ldr	x0, [x20, 2344]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 19]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 34]
	ldrb	w0, [x19, 18]
	cmp	w0, w21
	bhi	.L1785
.L1781:
	ldr	x0, [x20, 2344]
	mov	w1, 4
	mov	w21, 0
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 49]
	cbz	w1, .L1779
	.p2align 2
.L1784:
	add	x22, x19, x21, uxtw
	ldr	x0, [x20, 2344]
	mov	w1, 8
	add	w21, w21, 1
	bl	BsGet
	strb	w0, [x22, 50]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x22, 65]
	ldrb	w0, [x19, 49]
	cmp	w0, w21
	bhi	.L1784
	b	.L1779
	.p2align 3
.L1783:
	mov	w0, -1
	b	.L1774
	.p2align 3
.L1788:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19, 11]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L1776
	.size	HEVC_Sei_Color_Volume_Reconstruction_Info, .-HEVC_Sei_Color_Volume_Reconstruction_Info
	.align	3
.LC395:
	.xword	.LC394
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_User_Data_Registered_Itu_T_T35
	.type	HEVC_Sei_User_Data_Registered_Itu_T_T35, %function
HEVC_Sei_User_Data_Registered_Itu_T_T35:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	w21, w2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L1796
	cmp	w21, 3
	bls	.L1800
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x19]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	strh	w0, [x19, 2]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 2
	strb	w0, [x19, 4]
	beq	.L1801
	cmp	w0, 4
	beq	.L1802
	subs	w21, w21, #4
	mov	w19, 0
	beq	.L1795
	.p2align 2
.L1798:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	cmp	w21, w19
	bne	.L1798
.L1795:
	mov	w0, 0
.L1790:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1801:
	add	x1, x20, 4096
	mov	x0, x20
	add	x1, x1, 3302
	bl	HEVC_Sei_TSI
	cmn	w0, #1
	csetm	w0, eq
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1802:
	add	x1, x20, 4096
	mov	x0, x20
	add	x1, x1, 3308
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	w0, #1
	csetm	w0, eq
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1796:
	mov	w0, -1
	b	.L1790
.L1800:
	ldr	x1, .LC397
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1790
	.size	HEVC_Sei_User_Data_Registered_Itu_T_T35, .-HEVC_Sei_User_Data_Registered_Itu_T_T35
	.align	3
.LC397:
	.xword	.LC396
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecShortTermRefPicSet
	.type	HEVC_DecShortTermRefPicSet, %function
HEVC_DecShortTermRefPicSet:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	w20, w3
	mov	x0, x30
	mov	x23, x1
	mov	x19, x2
	bl	_mcount
	cbnz	w20, .L1849
	str	wzr, [x19]
.L1806:
	ldr	x1, .LC411
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19, 16]
	bhi	.L1850
	ldr	x1, .LC415
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 16
	str	w0, [x19, 20]
	bhi	.L1851
	ldr	w1, [x19, 16]
	add	w2, w0, w1
	str	w2, [x19, 24]
	cmp	w2, 16
	bhi	.L1832
	mov	w20, 0
	cbz	w1, .L1834
	ldr	x25, .LC421
	mov	w22, 0
	mov	w23, 0
	mov	w24, 32767
	b	.L1836
	.p2align 3
.L1835:
	str	w23, [x2, 72]
	add	x20, x19, x20
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 53]
	ldr	w20, [x19, 16]
	cmp	w20, w22
	bls	.L1852
.L1836:
	ldr	x0, [x21, 2344]
	mov	x1, x25
	uxtw	x20, w22
	add	w22, w22, 1
	bl	HEVC_ue_v
	cmp	w0, w24
	mvn	w1, w0
	add	x2, x19, x20, lsl 2
	add	w23, w23, w1
	mov	w1, 1
	bls	.L1835
	ldr	x1, .LC423
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1849:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19]
	cbz	w0, .L1806
	ldr	w0, [x23, 228]
	cmp	w20, w0
	beq	.L1853
	sub	w20, w20, #1
	str	wzr, [x19, 4]
.L1810:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19, 8]
	ldr	x1, .LC405
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	add	w26, w0, 1
	uxtw	x2, w20
	str	w26, [x19, 12]
	lsl	x1, x2, 2
	mov	w0, 1
	sub	x1, x1, x2
	ldr	w2, [x19, 8]
	add	x25, x1, x1, lsl 4
	lsl	x24, x25, 2
	sub	w1, w0, w2, lsl 1
	add	x3, x23, x24
	mul	w26, w1, w26
	ldr	w2, [x3, 13132]
	cmp	w2, 16
	bhi	.L1854
	mov	w28, 0
	mov	w27, 0
	mov	w20, 0
	mov	w22, 0
	b	.L1818
	.p2align 3
.L1813:
	sub	w2, w0, #1
	uxtw	x1, w28
	cmp	w2, 1
	bls	.L1855
.L1814:
	add	x1, x19, x1
	add	x2, x23, x24
	add	w28, w28, 1
	strb	w0, [x1, 36]
	ldr	w0, [x2, 13132]
	cmp	w0, w28
	bcc	.L1856
.L1818:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	cbnz	w0, .L1813
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	lsl	w0, w0, 1
	sub	w2, w0, #1
	uxtw	x1, w28
	cmp	w2, 1
	bhi	.L1814
.L1855:
	add	x5, x23, x24
	uxtw	x2, w22
	add	x3, x25, x1
	add	x6, x19, x2
	add	x2, x19, x2, lsl 2
	ldr	w5, [x5, 13132]
	add	x4, x23, x3, lsl 2
	mov	w3, 0
	cmp	w5, w28
	bls	.L1815
	ldr	w3, [x4, 13180]
.L1815:
	cmp	w0, 1
	add	w3, w3, w26
	str	w3, [x2, 72]
	cset	w2, eq
	strb	w2, [x6, 53]
	tbnz	w3, #31, .L1857
	add	w27, w27, 1
	add	w22, w22, 1
.L1858:
	add	x1, x19, x1
	add	x2, x23, x24
	add	w28, w28, 1
	strb	w0, [x1, 36]
	ldr	w0, [x2, 13132]
	cmp	w0, w28
	bcs	.L1818
.L1856:
	cmp	w22, 16
	add	w0, w0, 1
	ccmp	w20, 16, 2, ls
	ccmp	w27, 16, 2, ls
	stp	w20, w27, [x19, 16]
	stp	w22, w0, [x19, 24]
	bhi	.L1819
	cmp	w22, 1
	bls	.L1825
	sub	w10, w22, #2
	add	x9, x19, 76
	add	x10, x10, 1
	mov	x7, 0
	.p2align 2
.L1824:
	add	x0, x19, x7
	mov	w3, w7
	ldr	w5, [x9]
	ldrb	w8, [x0, 54]
	tbnz	w7, #31, .L1828
	.p2align 2
.L1840:
	sxtw	x1, w3
	add	w0, w3, 1
	add	x4, x19, x1
	add	x1, x19, x1, lsl 2
	sxtw	x0, w0
	add	x6, x19, x0
	add	x0, x19, x0, lsl 2
	ldr	w2, [x1, 72]
	cmp	w5, w2
	bge	.L1826
	str	w2, [x0, 72]
	ldrb	w0, [x4, 53]
	strb	w0, [x6, 53]
	str	w5, [x1, 72]
	strb	w8, [x4, 53]
.L1826:
	subs	w3, w3, #1
	bpl	.L1840
.L1828:
	add	x7, x7, 1
	add	x9, x9, 4
	cmp	x7, x10
	bne	.L1824
.L1825:
	lsr	w7, w20, 1
	sub	w20, w20, #1
	cbz	w7, .L1822
	add	x2, x19, 72
	add	x1, x19, 53
	sub	w7, w20, w7
	.p2align 2
.L1829:
	sxtw	x0, w20
	ldrb	w4, [x1]
	add	x3, x19, x0
	ldr	w5, [x2]
	add	x0, x19, x0, lsl 2
	sub	w20, w20, #1
	cmp	w20, w7
	ldr	w6, [x0, 72]
	str	w6, [x2], 4
	ldrb	w6, [x3, 53]
	strb	w6, [x1], 1
	str	w5, [x0, 72]
	strb	w4, [x3, 53]
	bne	.L1829
.L1822:
	mov	w0, 0
.L1811:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1857:
	add	w20, w20, 1
	add	w22, w22, 1
	b	.L1858
.L1852:
	ldr	w2, [x19, 24]
.L1834:
	cmp	w2, w20
	bls	.L1822
	ldr	x24, .LC425
	mov	w23, 0
	.p2align 2
.L1837:
	ldr	x0, [x21, 2344]
	mov	x1, x24
	uxtw	x22, w20
	add	w20, w20, 1
	bl	HEVC_ue_v
	add	w0, w0, 1
	add	x2, x19, x22, lsl 2
	add	w23, w23, w0
	add	x22, x19, x22
	mov	w1, 1
	str	w23, [x2, 72]
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x22, 53]
	ldr	w0, [x19, 24]
	cmp	w0, w20
	bhi	.L1837
	b	.L1822
.L1853:
	ldr	x1, .LC399
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w20, w2
	str	w2, [x19, 4]
	bcc	.L1859
	sub	w3, w20, #1
	sub	w20, w3, w0
	cmp	w20, w3
	bls	.L1810
	ldr	x1, .LC403
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1819:
	ldr	x1, .LC409
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1850:
	ldr	x1, .LC413
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1859:
	ldr	x1, .LC401
	mov	w3, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1854:
	ldr	x1, .LC407
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1832:
	ldr	x1, .LC419
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
.L1851:
	ldr	x1, .LC417
	mov	w0, 1
	ldr	w2, [x19, 16]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1811
	.size	HEVC_DecShortTermRefPicSet, .-HEVC_DecShortTermRefPicSet
	.align	3
.LC399:
	.xword	.LC398
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC403:
	.xword	.LC402
	.align	3
.LC405:
	.xword	.LC404
	.align	3
.LC407:
	.xword	.LC406
	.align	3
.LC409:
	.xword	.LC408
	.align	3
.LC411:
	.xword	.LC410
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC415:
	.xword	.LC414
	.align	3
.LC417:
	.xword	.LC416
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
	.align	3
.LC425:
	.xword	.LC424
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecHrdParam
	.type	HEVC_DecHrdParam, %function
HEVC_DecHrdParam:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	uxtb	w19, w2
	mov	w22, w3
	bl	_mcount
	cmp	x21, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L1884
	cbnz	w19, .L1905
.L1863:
	ldr	x23, .LC427
	mov	w19, 0
	ldr	x25, .LC429
	ldr	x24, .LC431
	ldr	x27, .LC433
	.p2align 2
.L1881:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	uxtw	x28, w19
	bl	BsGet
	uxtb	w0, w0
	add	x1, x28, x28, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x28
	add	x1, x1, x1, lsl 4
	add	x26, x20, x1, lsl 2
	strb	w0, [x26, 40]
	cbz	w0, .L1906
	mov	w0, 1
	strb	w0, [x26, 41]
.L1868:
	add	x2, x28, x28, lsl 2
	lsl	x2, x2, 2
	sub	x2, x2, x28
	add	x2, x2, x2, lsl 4
	add	x26, x20, x2, lsl 2
	ldrb	w0, [x26, 41]
	strb	wzr, [x26, 42]
	str	wzr, [x26, 48]
	cbz	w0, .L1869
	ldr	x0, [x21, 2344]
	mov	x1, x23
	bl	HEVC_ue_v
	str	w0, [x26, 44]
	ldrb	w1, [x26, 42]
	cbz	w1, .L1871
.L1909:
	add	x0, x28, x28, lsl 2
	lsl	x0, x0, 2
	sub	x0, x0, x28
	add	x0, x0, x0, lsl 4
	add	x0, x20, x0, lsl 2
	ldr	w0, [x0, 48]
	cmp	w0, 31
	bhi	.L1907
.L1873:
	add	x0, x28, x28, lsl 2
	mov	w2, 0
	lsl	x0, x0, 2
	sub	x3, x0, x28
	lsl	x4, x3, 4
.L1874:
	cbz	w2, .L1908
	cmp	w2, 1
	beq	.L1903
.L1880:
	add	w2, w2, 1
	cmp	w2, 2
	bne	.L1874
.L1879:
	add	w19, w19, 1
	cmp	w22, w19
	bcs	.L1881
	mov	w0, 0
.L1902:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1869:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x26, 42]
	cbnz	w1, .L1909
.L1871:
	ldr	x0, [x21, 2344]
	mov	x1, x25
	bl	HEVC_ue_v
	cmp	w0, 31
	add	x1, x28, x28, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x28
	add	x1, x1, x1, lsl 4
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 48]
	bls	.L1873
.L1907:
	mov	w2, w0
	mov	x1, x24
	mov	w0, 1
	bl	dprint_vfmw
	add	x0, x28, x28, lsl 2
	lsl	x0, x0, 2
	sub	x0, x0, x28
	add	x0, x0, x0, lsl 4
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 48]
	b	.L1873
	.p2align 3
.L1906:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x26, 41]
	b	.L1868
	.p2align 3
.L1905:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 1]
	ldrh	w0, [x20]
	cbz	w0, .L1863
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 2]
	cbnz	w0, .L1910
.L1865:
	ldr	x0, [x21, 2344]
	mov	w1, 4
	bl	BsGet
	str	w0, [x20, 16]
	mov	w1, 4
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 20]
	ldrb	w1, [x20, 2]
	cbnz	w1, .L1911
.L1866:
	ldr	x0, [x21, 2344]
	mov	w1, 5
	bl	BsGet
	str	w0, [x20, 28]
	mov	w1, 5
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 32]
	mov	w1, 5
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 36]
	b	.L1863
.L1884:
	mov	w0, -1
	b	.L1902
.L1911:
	ldr	x0, [x21, 2344]
	mov	w1, 4
	bl	BsGet
	str	w0, [x20, 24]
	b	.L1866
.L1910:
	ldr	x0, [x21, 2344]
	mov	w1, 8
	bl	BsGet
	str	w0, [x20, 4]
	mov	w1, 5
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 8]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 3]
	mov	w1, 5
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 36]
	b	.L1865
.L1908:
	ldrb	w0, [x20]
	cbnz	w0, .L1886
	mov	w2, 1
.L1903:
	ldrb	w0, [x20, 1]
	cbz	w0, .L1879
.L1886:
	add	x0, x3, x4
	uxtw	x1, w2
	mov	w26, 0
	stp	x0, x1, [x29, 104]
	add	x0, x20, x0, lsl 2
	str	x0, [x29, 96]
	b	.L1883
.L1882:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	stp	x4, x3, [x29, 120]
	str	w2, [x29, 140]
	bl	BsGet
	str	w0, [x28, 1076]
	ldr	x0, [x29, 96]
	ldr	w2, [x29, 140]
	ldp	x4, x3, [x29, 120]
	ldr	w0, [x0, 48]
	cmp	w0, w26
	bcc	.L1880
.L1883:
	ldr	x0, [x21, 2344]
	mov	x1, x27
	stp	x4, x3, [x29, 120]
	str	w2, [x29, 140]
	bl	HEVC_ue_v
	ldp	x1, x28, [x29, 104]
	add	x1, x1, x26, uxtw 1
	add	x1, x1, x28
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 52]
	ldr	x1, .LC435
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	add	x5, x28, x26, uxtw 1
	mov	w1, 323
	add	w26, w26, 1
	ldr	w2, [x29, 140]
	umaddl	x5, w19, w1, x5
	ldp	x4, x3, [x29, 120]
	add	x28, x20, x5, lsl 2
	str	w0, [x28, 308]
	ldrb	w0, [x20, 2]
	cbz	w0, .L1882
	ldr	x1, .LC437
	ldr	x0, [x21, 2344]
	str	w2, [x29, 140]
	bl	HEVC_ue_v
	str	w0, [x28, 564]
	ldr	x1, .LC439
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x28, 820]
	ldr	w2, [x29, 140]
	ldp	x4, x3, [x29, 120]
	b	.L1882
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	3
.LC427:
	.xword	.LC426
	.align	3
.LC429:
	.xword	.LC428
	.align	3
.LC431:
	.xword	.LC430
	.align	3
.LC433:
	.xword	.LC432
	.align	3
.LC435:
	.xword	.LC434
	.align	3
.LC437:
	.xword	.LC436
	.align	3
.LC439:
	.xword	.LC438
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessVPS
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x21, 2344]
	mov	w1, 2
	bl	BsGet
	cmp	w0, 3
	str	w0, [x20, 12]
	beq	.L1913
	ldr	x1, .LC441
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
.L1913:
	ldr	x0, [x21, 2344]
	mov	w1, 6
	bl	BsGet
	cmp	w0, 63
	str	w0, [x20, 16]
	bhi	.L1960
	ldr	x0, [x21, 2344]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 7
	mov	w25, w0
	bhi	.L1961
	add	w23, w0, 1
	str	w23, [x20, 20]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 1]
	mov	w1, 16
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 24]
	mov	w1, 65535
	cmp	w0, w1
	bne	.L1962
	add	x26, x20, 12288
	mov	w3, w25
	mov	w2, 1
	add	x1, x26, 148
	mov	x0, x21
	bl	HEVC_DecPTL
	cbnz	w0, .L1963
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 7]
	tbnz	w25, #31, .L1923
	ldr	x28, .LC453
	mov	w19, 0
	ldr	x27, .LC455
	ldr	x24, .LC457
	b	.L1925
	.p2align 3
.L1922:
	cmp	w23, w19
	beq	.L1923
.L1925:
	add	x22, x20, x19, sxtw 2
	ldr	x0, [x21, 2344]
	mov	x1, x28
	add	w19, w19, 1
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 52]
	mov	x1, x27
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x22, 84]
	mov	x1, x24
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x22, 116]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L1922
	cmp	w25, w19
	blt	.L1923
	.p2align 2
.L1948:
	add	x0, x20, x19, sxtw 2
	ldr	w1, [x20, 52]
	add	w19, w19, 1
	cmp	w23, w19
	str	w1, [x0, 52]
	ldr	w1, [x20, 84]
	str	w1, [x0, 84]
	ldr	w1, [x20, 116]
	str	w1, [x0, 116]
	bne	.L1948
.L1923:
	ldr	x0, [x21, 2344]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 28]
	ldr	x1, .LC451
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 1024
	str	w0, [x20, 32]
	bhi	.L1964
	cmp	w0, 1
	ble	.L1927
	ldr	x27, .LC460
	mov	w22, 1
	ldr	x24, .LC462
	ldr	w0, [x20, 28]
	.p2align 2
.L1929:
	cmp	w0, wzr
	mov	w19, 0
	sxtw	x23, w22
	ble	.L1931
	.p2align 2
.L1928:
	ldr	x5, [x27, 136]
	mov	w4, w19
	mov	w3, w22
	mov	x2, x24
	mov	x1, 100
	add	x0, x29, 104
	blr	x5
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x23, x19, sxtw
	add	w19, w19, 1
	add	x1, x20, x1, lsl 2
	str	w0, [x1, 148]
	ldr	w0, [x20, 28]
	cmp	w0, w19
	bgt	.L1928
.L1931:
	ldr	w1, [x20, 32]
	add	w22, w22, 1
	cmp	w1, w22
	bgt	.L1929
.L1927:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbz	w0, .L1937
	ldr	x0, [x21, 2344]
	mov	w1, 32
	bl	BsGet
	str	w0, [x20, 36]
	mov	w1, 32
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 40]
	mov	w1, 1
	ldr	x0, [x21, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbnz	w0, .L1965
.L1935:
	ldr	x1, .LC466
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 1023
	str	w0, [x20, 48]
	bhi	.L1966
	cmp	w0, wzr
	ble	.L1937
	mov	w0, 1
	str	w0, [x20, 8340]
	ldr	x23, .LC470
	add	x26, x26, 532
	ldr	x0, [x21, 2344]
	mov	w19, 0
	mov	x1, x23
	bl	HEVC_ue_v
	str	w0, [x20, 4244]
	ldr	w2, [x20, 8340]
	.p2align 2
.L1938:
	mov	w3, w25
	mov	x1, x26
	mov	x0, x21
	add	x22, x20, x19, sxtw 2
	add	w19, w19, 1
	bl	HEVC_DecHrdParam
	cbnz	w0, .L1967
.L1941:
	ldr	w0, [x20, 48]
	mov	x1, x23
	cmp	w0, w19
	ble	.L1937
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x22, 4248]
	cmp	w19, wzr
	mov	w1, 1
	ble	.L1968
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x22, 8344]
	mov	w2, w0
	mov	w3, w25
	mov	x1, x26
	mov	x0, x21
	add	x22, x20, x19, sxtw 2
	add	w19, w19, 1
	bl	HEVC_DecHrdParam
	cbz	w0, .L1941
.L1967:
	ldr	x1, .LC472
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
.L1937:
	ldr	x0, [x21, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbz	w0, .L1934
	.p2align 2
.L1955:
	ldr	x0, [x21, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L1934
	ldr	x2, [x21, 2392]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcc	.L1969
.L1934:
	mov	w0, 0
.L1956:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L1969:
	ldr	x0, [x21, 2344]
	bl	BsGet
	strb	w0, [x20, 4]
	b	.L1955
	.p2align 3
.L1968:
	ldr	w2, [x22, 8344]
	b	.L1938
.L1965:
	ldr	x1, .LC464
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 44]
	b	.L1935
.L1962:
	ldr	x1, .LC447
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1956
.L1960:
	ldr	x1, .LC443
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1956
.L1963:
	ldr	x1, .LC449
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1956
.L1961:
	ldr	x1, .LC445
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1956
.L1964:
	ldr	x1, .LC459
.L1958:
	mov	w2, w0
	mov	w3, 1024
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1956
.L1966:
	ldr	x1, .LC468
	b	.L1958
	.size	HEVC_ProcessVPS, .-HEVC_ProcessVPS
	.align	3
.LC441:
	.xword	.LC440
	.align	3
.LC443:
	.xword	.LC442
	.align	3
.LC445:
	.xword	.LC444
	.align	3
.LC447:
	.xword	.LC446
	.align	3
.LC449:
	.xword	.LC448
	.align	3
.LC451:
	.xword	.LC450
	.align	3
.LC453:
	.xword	.LC452
	.align	3
.LC455:
	.xword	.LC454
	.align	3
.LC457:
	.xword	.LC456
	.align	3
.LC459:
	.xword	.LC458
	.align	3
.LC460:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC462:
	.xword	.LC461
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC466:
	.xword	.LC465
	.align	3
.LC468:
	.xword	.LC467
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC472:
	.xword	.LC471
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVPS
	.type	HEVC_DecVPS, %function
HEVC_DecVPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x20, 2344]
	mov	w1, 4
	bl	BsGet
	cmp	w0, 15
	mov	w21, w0
	bhi	.L1976
	mov	w19, 23196
	umull	x19, w0, w19
	ldr	x0, [x20, 2352]
	add	x1, x0, x19
	ldrb	w0, [x0, x19]
	cbnz	w0, .L1977
	str	w21, [x1, 8]
	mov	x0, x20
	ldr	x1, [x20, 2352]
	add	x1, x1, x19
	bl	HEVC_ProcessVPS
	mov	w22, w0
	cbnz	w0, .L1978
	ldr	x0, [x20, 2352]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2352]
	strb	w1, [x0, x19]
.L1972:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1977:
	ldr	x24, .LC475
	mov	x0, x20
	add	x23, x24, 3328
	mov	x1, x23
	str	w21, [x23, 8]
	bl	HEVC_ProcessVPS
	mov	w22, w0
	cbnz	w0, .L1979
	ldr	x3, .LC478
	mov	w1, 1
	ldr	x0, [x20, 2352]
	mov	x2, 23196
	strb	w1, [x23, 2]
	ldr	x3, [x3, 112]
	add	x0, x0, x19
	strb	w1, [x24, 3328]
	mov	x1, x23
	blr	x3
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1979:
	ldr	x1, .LC477
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1972
	.p2align 3
.L1976:
	ldr	x1, .LC474
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1972
.L1978:
	ldr	x1, .LC480
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x0, [x20, 2352]
	mov	w1, 1
	add	x0, x0, x19
	strb	w1, [x0, 2]
	ldr	x0, [x20, 2352]
	strb	wzr, [x0, x19]
	b	.L1972
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	3
.LC474:
	.xword	.LC473
	.align	3
.LC475:
	.xword	.LANCHOR6
	.align	3
.LC477:
	.xword	.LC476
	.align	3
.LC478:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC480:
	.xword	.LC479
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVuiParam
	.type	HEVC_DecVuiParam, %function
HEVC_DecVuiParam:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	mov	w2, 1
	ldr	x0, [x20, 2344]
	mov	w3, 2
	mov	w1, w2
	stp	w2, w3, [x29, 48]
	stp	w3, w2, [x29, 56]
	stp	w2, w3, [x29, 64]
	stp	w2, w2, [x29, 72]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19]
	cbnz	w0, .L2025
.L1982:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 1]
	cbnz	w0, .L2026
.L1984:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 3]
	cbnz	w0, .L2027
.L1986:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 6]
	cbnz	w0, .L2028
.L1988:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 8]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 10]
	cbz	w0, .L1989
	ldr	x1, .LC487
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 60]
	ldr	w1, [x21, 64]
	cmp	w1, 3
	bhi	.L2029
	add	x2, x29, 80
	add	x2, x2, x1, uxtw 2
	ldr	x1, .LC491
	ldr	w2, [x2, -32]
	mul	w0, w2, w0
	str	w0, [x19, 60]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 64]
	add	x3, x29, 80
	ldr	x1, .LC493
	ldr	w2, [x21, 64]
	add	x2, x3, x2, lsl 2
	ldr	w2, [x2, -32]
	mul	w0, w2, w0
	str	w0, [x19, 64]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 68]
	add	x3, x29, 80
	ldr	x1, .LC495
	ldr	w2, [x21, 64]
	add	x2, x3, x2, lsl 2
	ldr	w2, [x2, -16]
	mul	w0, w2, w0
	str	w0, [x19, 68]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 72]
	add	x2, x29, 80
	ldr	w1, [x21, 64]
	add	x1, x2, x1, lsl 2
	ldr	w1, [x1, -16]
	mul	w0, w1, w0
	str	w0, [x19, 72]
.L1989:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 11]
	cbz	w0, .L1992
	ldr	x0, [x20, 2344]
	mov	w1, 32
	bl	BsGet
	str	w0, [x19, 76]
	mov	w1, 32
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 80]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	ldr	w1, [x19, 76]
	strb	w0, [x19, 12]
	cbz	w1, .L1993
	ldr	w2, [x19, 80]
	add	x3, x20, 86016
	lsl	w0, w2, 6
	sub	w0, w0, w2
	lsl	w0, w0, 1
	sub	w0, w0, w2
	lsl	w0, w0, 3
	udiv	w0, w0, w1
	str	w0, [x3, 2928]
	ldrb	w0, [x19, 12]
.L1993:
	cbnz	w0, .L2030
.L1994:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 13]
	cbnz	w0, .L2031
.L1992:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 14]
	mov	w1, 0
	cbnz	w0, .L2032
.L1991:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2032:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 17]
	ldr	x1, .LC501
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 4095
	str	w0, [x19, 88]
	bhi	.L2033
.L1995:
	ldr	x1, .LC505
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 92]
	ldr	x1, .LC507
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 96]
	ldr	x1, .LC509
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 100]
	ldr	x1, .LC511
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 104]
	mov	w1, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2028:
	ldr	x1, .LC483
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 52]
	ldr	x1, .LC485
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 56]
	b	.L1988
	.p2align 3
.L2025:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 255
	str	w0, [x19, 24]
	bne	.L1982
	ldr	x0, [x20, 2344]
	mov	w1, 16
	bl	BsGet
	str	w0, [x19, 28]
	mov	w1, 16
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 32]
	b	.L1982
	.p2align 3
.L2027:
	ldr	x0, [x20, 2344]
	mov	w1, 3
	bl	BsGet
	str	w0, [x19, 36]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	cbz	w0, .L1986
	ldr	x0, [x20, 2344]
	mov	w1, 8
	bl	BsGet
	str	w0, [x19, 40]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 44]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 48]
	b	.L1986
	.p2align 3
.L2026:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 2]
	b	.L1984
	.p2align 3
.L2031:
	ldr	w3, [x21, 56]
	mov	w2, 1
	add	x1, x19, 108
	mov	x0, x20
	bl	HEVC_DecHrdParam
	cbz	w0, .L1992
	ldr	x1, .LC499
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L1991
	.p2align 3
.L2030:
	ldr	x1, .LC497
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 84]
	b	.L1994
	.p2align 3
.L2033:
	ldr	x1, .LC503
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1995
	.p2align 3
.L2029:
	ldr	x1, .LC489
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L1991
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
	.align	3
.LC483:
	.xword	.LC482
	.align	3
.LC485:
	.xword	.LC484
	.align	3
.LC487:
	.xword	.LC486
	.align	3
.LC489:
	.xword	.LC488
	.align	3
.LC491:
	.xword	.LC490
	.align	3
.LC493:
	.xword	.LC492
	.align	3
.LC495:
	.xword	.LC494
	.align	3
.LC497:
	.xword	.LC496
	.align	3
.LC499:
	.xword	.LC498
	.align	3
.LC501:
	.xword	.LC500
	.align	3
.LC503:
	.xword	.LC502
	.align	3
.LC505:
	.xword	.LC504
	.align	3
.LC507:
	.xword	.LC506
	.align	3
.LC509:
	.xword	.LC508
	.align	3
.LC511:
	.xword	.LC510
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_se_v
	.type	HEVC_se_v, %function
HEVC_se_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	bls	.L2039
	mov	w0, 2147483647
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2039:
	mov	w1, w0
	mov	x0, x20
	add	w21, w1, 1
	bl	BsSkip
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	sub	w0, w0, #1
	asr	w2, w0, 1
	and	w0, w0, 1
	cmp	w0, wzr
	mov	w1, w21
	mov	x0, x20
	neg	w19, w2
	csinc	w19, w19, w2, eq
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_se_v, .-HEVC_se_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Structure_Of_Pictures_Info
	.type	HEVC_Sei_Structure_Of_Pictures_Info, %function
HEVC_Sei_Structure_Of_Pictures_Info:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	x1, .LC513
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x22]
	ldr	x1, .LC515
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	cmp	w0, 1024
	str	w0, [x22, 4]
	bhi	.L2041
	mov	w19, 0
	cbz	w0, .L2047
	ldr	x23, .LC519
	ldr	x24, .LC521
	.p2align 2
.L2050:
	add	x20, x22, x19, uxtw 2
	ldr	x0, [x21, 2344]
	mov	w1, 6
	bl	BsGet
	str	w0, [x20, 8]
	mov	w1, 3
	ldr	x0, [x21, 2344]
	bl	BsGet
	str	w0, [x20, 4104]
	ldr	w2, [x20, 8]
	mov	x1, x23
	sub	w2, w2, #19
	cmp	w2, 1
	bls	.L2044
	ldr	x0, [x21, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 8200]
.L2044:
	cbnz	w19, .L2053
.L2045:
	ldr	w0, [x22, 4]
	add	w19, w19, 1
	cmp	w0, w19
	bhi	.L2050
.L2047:
	ldr	x0, [x21, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L2043:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2053:
	ldr	x0, [x21, 2344]
	mov	x1, x24
	bl	HEVC_se_v
	str	w0, [x20, 12296]
	b	.L2045
.L2041:
	ldr	x1, .LC517
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2043
	.size	HEVC_Sei_Structure_Of_Pictures_Info, .-HEVC_Sei_Structure_Of_Pictures_Info
	.align	3
.LC513:
	.xword	.LC512
	.align	3
.LC515:
	.xword	.LC514
	.align	3
.LC517:
	.xword	.LC516
	.align	3
.LC519:
	.xword	.LC518
	.align	3
.LC521:
	.xword	.LC520
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Recovery_Point
	.type	HEVC_Sei_Recovery_Point, %function
HEVC_Sei_Recovery_Point:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L2056
	ldr	x1, .LC523
	ldr	x0, [x19, 2344]
	bl	HEVC_se_v
	str	w0, [x20, 4]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	strb	w0, [x20, 1]
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	mov	w0, 0
.L2055:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2056:
	mov	w0, -1
	b	.L2055
	.size	HEVC_Sei_Recovery_Point, .-HEVC_Sei_Recovery_Point
	.align	3
.LC523:
	.xword	.LC522
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Color_Remapping_Info
	.type	HEVC_Sei_Color_Remapping_Info, %function
HEVC_Sei_Color_Remapping_Info:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L2075
	ldr	x1, .LC525
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x21, 4]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 8]
	cbz	w0, .L2059
.L2072:
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x21]
.L2058:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2059:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21, 9]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	strb	w1, [x21, 10]
	beq	.L2083
.L2060:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	mov	x22, x21
	add	x23, x21, 3
	mov	x25, x21
	mov	w27, 33
	bl	BsGet
	strb	w0, [x21, 15]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 16]
.L2062:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	mov	w24, w21
	sub	w26, w25, w21
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x25, 17]
	cbz	w0, .L2065
	mov	w28, 0
	.p2align 2
.L2064:
	uxtw	x19, w28
	ldr	x0, [x20, 2344]
	mov	w1, 16
	add	w28, w28, 1
	umaddl	x19, w26, w27, x19
	bl	BsGet
	mov	w1, 16
	add	x19, x21, x19, lsl 1
	strh	w0, [x19, 20]
	ldr	x0, [x20, 2344]
	bl	BsGet
	strh	w0, [x19, 218]
	ldrb	w0, [x25, 17]
	add	w0, w0, 1
	cmp	w0, w28
	bhi	.L2064
.L2065:
	add	x25, x25, 1
	cmp	x25, x23
	bne	.L2062
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x21, 416]
	beq	.L2066
.L2070:
	mov	w26, 33
.L2067:
	ldr	x0, [x20, 2344]
	mov	w1, 8
	sub	w25, w22, w24
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x22, 456]
	cbz	w0, .L2074
	mov	w27, 0
	.p2align 2
.L2073:
	uxtw	x19, w27
	ldr	x0, [x20, 2344]
	mov	w1, 16
	add	w27, w27, 1
	umaddl	x19, w25, w26, x19
	bl	BsGet
	mov	w1, 16
	add	x19, x21, x19, lsl 1
	strh	w0, [x19, 460]
	ldr	x0, [x20, 2344]
	bl	BsGet
	strh	w0, [x19, 658]
	ldrb	w0, [x22, 456]
	add	w0, w0, 1
	cmp	w0, w27
	bhi	.L2073
.L2074:
	add	x22, x22, 1
	cmp	x22, x23
	bne	.L2067
	b	.L2072
	.p2align 3
.L2075:
	mov	w0, -1
	b	.L2058
.L2066:
	ldr	x0, [x20, 2344]
	mov	w1, 4
	add	x19, x21, 420
	add	x27, x21, 456
	bl	BsGet
	ldr	x26, .LC527
	strb	w0, [x21, 417]
.L2068:
	add	x25, x19, 12
.L2069:
	ldr	x0, [x20, 2344]
	mov	x1, x26
	bl	HEVC_se_v
	str	w0, [x19], 4
	cmp	x19, x25
	bne	.L2069
	cmp	x19, x27
	bne	.L2068
	b	.L2070
.L2083:
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 11]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 12]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 13]
	mov	w1, 8
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 14]
	b	.L2060
	.size	HEVC_Sei_Color_Remapping_Info, .-HEVC_Sei_Color_Remapping_Info
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC527:
	.xword	.LC526
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Payload
	.type	HEVC_Sei_Payload, %function
HEVC_Sei_Payload:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x23, x2
	mov	w20, w3
	mov	w22, w4
	bl	_mcount
	ldr	x0, [x19, 2392]
	ldr	w0, [x0, 16]
	cmp	w0, 39
	beq	.L2133
	cmp	w20, 5
	beq	.L2113
	cmp	w20, 132
	beq	.L2114
	mov	w20, 0
	cbz	w22, .L2107
	.p2align 2
.L2127:
	ldr	x0, [x19, 2344]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w22, w20
	bne	.L2127
	mov	w1, w22
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbnz	w0, .L2117
	.p2align 2
.L2121:
	mov	w0, 0
.L2109:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2113:
	add	x1, x21, 4096
	mov	w2, w22
	add	x1, x1, 56
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Unregistered
	cbnz	w0, .L2110
.L2107:
	mov	w1, w22
	mov	x0, x19
	bl	HEVC_Sei_More_Data_In_Payload
	cbz	w0, .L2121
.L2117:
	mov	w1, w22
	mov	x0, x19
	bl	HEVC_Sei_Payload_Extension_Present
	cbnz	w0, .L2134
.L2118:
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x21, 12]
	b	.L2119
	.p2align 3
.L2120:
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x21, 16]
.L2119:
	ldr	x0, [x19, 2344]
	bl	BsIsByteAligned
	cbz	w0, .L2120
	b	.L2121
	.p2align 3
.L2133:
	cmp	w20, 147
	bls	.L2135
.L2086:
	mov	w20, 0
	cbz	w22, .L2107
	.p2align 2
.L2126:
	ldr	x0, [x19, 2344]
	mov	w1, 8
	add	w20, w20, 1
	bl	BsGet
	cmp	w22, w20
	bne	.L2126
	b	.L2107
	.p2align 3
.L2114:
	add	x1, x21, 24576
	mov	x0, x19
	add	x1, x1, 164
	bl	HEVC_Sei_Decoded_Picture_Hash
	cbz	w0, .L2107
	.p2align 2
.L2110:
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2135:
	ldr	x0, .LC528
	ldrh	w0, [x0,w20,uxtw #1]
	adr	x1, .Lrtx2088
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2088:
	.section	.rodata
	.align	0
	.align	2
.L2088:
	.2byte	(.L2087 - .Lrtx2088) / 4
	.2byte	(.L2089 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2090 - .Lrtx2088) / 4
	.2byte	(.L2113 - .Lrtx2088) / 4
	.2byte	(.L2092 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2093 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2094 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2095 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2096 - .Lrtx2088) / 4
	.2byte	(.L2097 - .Lrtx2088) / 4
	.2byte	(.L2098 - .Lrtx2088) / 4
	.2byte	(.L2099 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2100 - .Lrtx2088) / 4
	.2byte	(.L2101 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2102 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2103 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2104 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2086 - .Lrtx2088) / 4
	.2byte	(.L2105 - .Lrtx2088) / 4
	.text
	.p2align 3
.L2134:
	ldr	x1, .LC530
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	str	w0, [x21, 8]
	b	.L2118
.L2105:
	add	x20, x21, 4096
	cmp	x19, xzr
	add	x0, x20, 302
	ccmp	x0, xzr, 4, ne
	beq	.L2110
	ldr	x0, [x19, 2344]
	mov	w1, 8
	bl	BsGet
	strb	w0, [x20, 302]
	b	.L2107
.L2104:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 296
	bl	HEVC_Sei_Content_Light_Level_Information
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2103:
	add	x1, x21, 3292
	mov	x0, x19
	bl	HEVC_Sei_Color_Remapping_Info
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2102:
	add	x0, x21, 4096
	cmp	x19, xzr
	add	x1, x0, 252
	ccmp	x1, xzr, 4, ne
	beq	.L2110
	mov	w2, 1
	strb	w2, [x0, 252]
	mov	x0, x19
	bl	HEVC_Sei_Mastering_Display_Colour_Volume.part.12
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2101:
	add	x20, x21, 4096
	cmp	x19, xzr
	add	x0, x20, 248
	ccmp	x0, xzr, 4, ne
	beq	.L2110
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x20, 248]
	b	.L2107
.L2100:
	mov	w3, w22
	mov	x2, x23
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_Sei_Scalable_Nesting
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2099:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 240
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2098:
	add	x1, x21, 4096
	add	x2, x23, 2732
	add	x1, x1, 164
	mov	x0, x19
	bl	HEVC_Sei_Dec_Unit_Info
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2097:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 88
	bl	HEVC_Sei_Active_Param_sets
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2096:
	add	x1, x21, 4096
	mov	w2, w22
	add	x1, x1, 3464
	mov	x0, x19
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2095:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 232
	bl	HEVC_Sei_Display_Orientation
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2094:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 188
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2093:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 304
	bl	HEVC_Sei_Tone_Mapping_Info
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2092:
	add	x1, x21, 4096
	mov	x0, x19
	add	x1, x1, 180
	bl	HEVC_Sei_Recovery_Point
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2090:
	mov	w2, w22
	add	x1, x21, 3200
	mov	x0, x19
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2089:
	add	x2, x23, 2624
	add	x1, x21, 1088
	mov	x0, x19
	bl	HEVC_Sei_Pic_Timming
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.p2align 3
.L2087:
	add	x2, x23, 2732
	add	x1, x21, 24
	mov	x0, x19
	bl	HEVC_Sei_Buf_Period
	cbz	w0, .L2107
	mov	w0, -1
	b	.L2109
	.size	HEVC_Sei_Payload, .-HEVC_Sei_Payload
	.align	3
.LC528:
	.xword	.L2088
	.align	3
.LC530:
	.xword	.LC529
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SeiMessage
	.type	HEVC_SeiMessage, %function
HEVC_SeiMessage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	x23, x2
	bl	_mcount
	mov	w20, 0
	ldr	x0, [x19, 2344]
	b	.L2137
	.p2align 3
.L2139:
	bl	BsSkip
	add	w20, w20, 255
	ldr	x0, [x19, 2344]
	ldr	w3, [x0, 32]
	ldr	w4, [x0, 24]
	add	w1, w3, 8
	cmp	w1, w4
	bhi	.L2146
.L2137:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2344]
	beq	.L2139
	bl	BsGet
	str	w0, [x22]
	mov	w24, w0
	mov	w21, 0
	ldr	x0, [x19, 2344]
	b	.L2140
	.p2align 3
.L2141:
	bl	BsSkip
	add	w21, w21, 255
	ldr	x0, [x19, 2344]
	ldr	w3, [x0, 32]
	ldr	w4, [x0, 24]
	add	w1, w3, 8
	cmp	w1, w4
	bhi	.L2147
.L2140:
	mov	w1, 8
	bl	BsShow
	cmp	w0, 255
	mov	w1, 8
	ldr	x0, [x19, 2344]
	beq	.L2141
	bl	BsGet
	add	w4, w21, w0
	mov	x1, x22
	str	w0, [x22, 4]
	add	w3, w20, w24
	mov	x2, x23
	mov	x0, x19
	bl	HEVC_Sei_Payload
	mov	w1, 0
	cbnz	w0, .L2148
.L2138:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2146:
	ldr	x1, .LC532
	mov	w2, 3056
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2147:
	ldr	x1, .LC532
	mov	w2, 3078
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L2148:
	ldr	x1, .LC534
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	b	.L2138
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	3
.LC532:
	.xword	.LC531
	.align	3
.LC534:
	.xword	.LC533
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSEI
	.type	HEVC_DecSEI, %function
HEVC_DecSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 4096
	add	x21, x19, 28672
	bl	_mcount
	add	x22, x22, 96
	add	x21, x21, 424
	b	.L2153
	.p2align 3
.L2150:
	ldr	x0, [x19, 2344]
	bl	BsIsByteAligned
	cbz	w0, .L2158
	mov	x0, x19
	bl	HEVC_More_Rbsp_Data
	mov	w20, w0
	cbz	w0, .L2159
.L2153:
	mov	x2, x21
	mov	x1, x22
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbz	w0, .L2150
	ldr	x1, .LC536
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
.L2151:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2158:
	ldr	x1, .LC538
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2159:
	ldr	x0, [x19, 2344]
	mov	w1, 8
	bl	BsGet
	cmp	w0, 128
	beq	.L2151
	ldr	x1, .LC540
	mov	w2, w0
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L2151
	.size	HEVC_DecSEI, .-HEVC_DecSEI
	.align	3
.LC536:
	.xword	.LC535
	.align	3
.LC538:
	.xword	.LC537
	.align	3
.LC540:
	.xword	.LC539
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_Sei_Scalable_Nesting
	.type	HEVC_Sei_Scalable_Nesting, %function
HEVC_Sei_Scalable_Nesting:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	mov	x23, x2
	bl	_mcount
	add	x24, x22, 20480
	ldr	x0, [x19, 2344]
	mov	w1, 1
	add	x21, x24, 3472
	bl	BsGet
	strb	w0, [x24, 3472]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 1]
	cbz	w0, .L2161
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x21, 2]
	ldr	x1, .LC542
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	cmp	w0, 63
	str	w0, [x21, 8]
	bhi	.L2176
	ldrb	w21, [x21, 2]
	cmp	w0, w21
	bcc	.L2167
	ldr	x25, .LC546
	.p2align 2
.L2166:
	add	x20, x22, x21, uxtw 2
	ldr	x0, [x19, 2344]
	add	x20, x20, 20480
	mov	w1, 3
	add	w21, w21, 1
	bl	BsGet
	str	w0, [x20, 3484]
	mov	x1, x25
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	str	w0, [x20, 3740]
	ldr	w0, [x24, 3480]
	cmp	w0, w21
	bcs	.L2166
.L2167:
	ldr	x0, [x19, 2344]
	bl	BsToNextByte
	strb	wzr, [x24, 3476]
.L2165:
	mov	x2, x23
	mov	x1, x22
	mov	x0, x19
	bl	HEVC_SeiMessage
	cbnz	w0, .L2177
	ldr	x0, [x19, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2171
	ldr	x1, [x19, 2392]
	ldr	w1, [x1, 12]
	add	w1, w1, 3
	cmp	w1, w0
	bcc	.L2165
.L2171:
	mov	w0, 0
.L2163:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2161:
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 3]
	cbnz	w0, .L2167
	ldr	x0, [x19, 2344]
	mov	w1, 3
	mov	w20, 0
	mov	x25, x21
	bl	BsGet
	str	w0, [x21, 524]
	ldr	x1, .LC548
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	cmp	w0, 63
	str	w0, [x21, 528]
	bhi	.L2178
	.p2align 2
.L2172:
	ldr	x0, [x19, 2344]
	mov	w1, 6
	bl	BsGet
	add	x1, x25, x20, uxtw 2
	add	w20, w20, 1
	str	w0, [x1, 532]
	ldr	w0, [x25, 528]
	cmp	w0, w20
	bcs	.L2172
	b	.L2167
	.p2align 3
.L2177:
	ldr	x1, .LC551
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L2176:
	ldr	x1, .LC544
	mov	w2, 64
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2163
.L2178:
	ldr	x1, .LC550
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2163
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
	.align	3
.LC542:
	.xword	.LC541
	.align	3
.LC544:
	.xword	.LC543
	.align	3
.LC546:
	.xword	.LC545
	.align	3
.LC548:
	.xword	.LC547
	.align	3
.LC550:
	.xword	.LC549
	.align	3
.LC551:
	.xword	.LC535
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	add	x28, x20, 324
	bl	_mcount
	mov	w26, 0
	ldr	x3, .LC553
	mov	x2, 64
	add	x1, x19, 1265
	add	x0, x19, 1393
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x22, .LC565
	ldr	x0, .LC552
	add	x0, x0, 65536
	str	x0, [x29, 104]
.L2180:
	ldr	w0, [x28, 1904]
	mov	w23, 0
	uxtw	x24, w26
	cbz	w0, .L2200
	lsl	x0, x24, 2
	sub	x24, x0, x24
	lsl	x0, x24, 1
	str	x0, [x29, 136]
	add	x0, x19, x0
	str	x0, [x29, 128]
.L2208:
	ldp	x1, x2, [x29, 128]
	uxtw	x24, w23
	ldr	x0, [x20, 2344]
	add	x27, x1, x24
	mov	w1, 1
	add	x25, x24, x2
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x27, 25]
	add	x21, x19, x25, lsl 6
	mov	w1, 64
	add	x21, x21, 49
	ldr	w2, [x28]
	cmp	w2, 64
	csel	w2, w2, w1, le
	cbz	w26, .L2181
	add	x3, x20, 356
	cbz	w0, .L2213
	cmp	w26, 1
	bls	.L2206
	ldr	x1, .LC561
	ldr	x0, [x20, 2344]
	str	w2, [x29, 116]
	str	x3, [x29, 120]
	bl	HEVC_se_v
	add	w1, w0, 7
	cmp	w1, 254
	str	w0, [x19, 1660]
	ldr	w2, [x29, 116]
	ldr	x3, [x29, 120]
	bhi	.L2214
	add	x25, x19, x25, lsl 2
	add	w27, w0, 8
	str	w27, [x25, 1668]
.L2192:
	cmp	w2, wzr
	ble	.L2191
	sub	w25, w2, #1
	mov	x24, x3
	add	x25, x25, 1
	add	x25, x3, x25, lsl 2
	b	.L2196
	.p2align 3
.L2195:
	ldr	w0, [x24], 4
	and	w1, w1, 255
	sub	w27, w1, w27
	cmp	x24, x25
	strb	w27, [x21, x0]
	beq	.L2191
.L2196:
	ldr	x0, [x20, 2344]
	mov	x1, x22
	bl	HEVC_se_v
	add	w27, w0, w27
	add	w1, w27, 256
	add	w2, w0, 128
	asr	w27, w1, 31
	cmp	w2, 255
	str	w0, [x19, 1664]
	lsr	w27, w27, 24
	add	w1, w1, w27
	bls	.L2195
	ldr	x1, .LC567
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2211:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2213:
	ldr	x1, .LC555
	ldr	x0, [x20, 2344]
	str	w2, [x29, 120]
	bl	HEVC_ue_v
	cmp	w0, w23
	ldr	w2, [x29, 120]
	bhi	.L2203
	uxtb	w0, w0
	strb	w0, [x27, 1585]
	sub	w0, w23, w0
	cmp	w26, 1
	uxtb	w0, w0
	strb	w0, [x27, 1609]
	bls	.L2186
	cmp	w0, w23
	beq	.L2205
	ldr	x1, [x29, 136]
	add	x1, x1, x0, uxtb
	add	x1, x19, x1, lsl 2
	ldr	w3, [x1, 1668]
.L2187:
	ldr	x1, [x29, 136]
	add	x1, x1, x24
	add	x1, x19, x1, lsl 2
	str	w3, [x1, 1668]
.L2186:
	cmp	w0, w23
	beq	.L2215
	ldr	x1, [x29, 136]
	add	x1, x1, x0, uxtb
	add	x1, x19, x1, lsl 6
	add	x1, x1, 49
.L2189:
	cbz	x1, .L2216
	ldr	x3, .LC553
	sxtw	x2, w2
	mov	x0, x21
	ldr	x3, [x3, 104]
	blr	x3
.L2191:
	ldr	w0, [x28, 1904]
	add	w23, w23, 1
	cmp	w0, w23
	bhi	.L2208
.L2200:
	add	w26, w26, 1
	add	x28, x28, 4
	cmp	w26, 4
	bne	.L2180
	mov	w0, 0
	b	.L2211
	.p2align 3
.L2206:
	mov	w27, 8
	b	.L2192
.L2205:
	mov	w3, 16
	b	.L2187
.L2215:
	mov	w1, w23
	mov	w0, w26
	str	w2, [x29, 120]
	bl	HEVC_GetScalingListDefaultAddress
	mov	x1, x0
	ldr	w2, [x29, 120]
	b	.L2189
.L2214:
	ldr	x1, .LC563
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2211
.L2216:
	ldr	x1, .LC559
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2211
.L2203:
	ldr	x1, .LC557
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2211
.L2181:
	cbz	w0, .L2201
	mov	w27, 8
	ldr	x3, [x29, 104]
	b	.L2192
.L2201:
	ldr	x1, .LC555
	ldr	x0, [x20, 2344]
	str	w2, [x29, 120]
	bl	HEVC_ue_v
	cmp	w23, w0
	ldr	w2, [x29, 120]
	bcc	.L2203
	add	x4, x19, x24
	uxtb	w0, w0
	strb	w0, [x4, 1585]
	sub	w0, w23, w0
	uxtb	w0, w0
	strb	w0, [x4, 1609]
	b	.L2186
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	3
.LC552:
	.xword	.LANCHOR0
	.align	3
.LC553:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC555:
	.xword	.LC554
	.align	3
.LC557:
	.xword	.LC556
	.align	3
.LC559:
	.xword	.LC558
	.align	3
.LC561:
	.xword	.LC560
	.align	3
.LC563:
	.xword	.LC562
	.align	3
.LC565:
	.xword	.LC564
	.align	3
.LC567:
	.xword	.LC566
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessSPS
	.type	HEVC_ProcessSPS, %function
HEVC_ProcessSPS:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC570
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 1
	str	w0, [x19, 64]
	mov	w23, w0
	beq	.L2218
	cmp	w0, 3
	bhi	.L2352
	ldr	x1, .LC574
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2348:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2352:
	ldr	x1, .LC572
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2218:
	ldr	x1, .LC576
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 8192
	str	w0, [x19, 72]
	bhi	.L2353
	ldr	x1, .LC580
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 4096
	str	w0, [x19, 76]
	bhi	.L2354
	ldr	w2, [x19, 760]
	ldr	w1, [x19, 72]
	cmp	w2, 120
	mul	w0, w0, w1
	beq	.L2224
	bgt	.L2225
	cmp	w2, 60
	beq	.L2288
	ble	.L2355
	cmp	w2, 90
	beq	.L2229
	cmp	w2, 93
	beq	.L2230
	cmp	w2, 63
	bne	.L2223
	mov	w1, 61440
	mov	w2, 245760
	b	.L2226
	.p2align 3
.L2225:
	cmp	w2, 156
	beq	.L2232
	bgt	.L2233
	cmp	w2, 150
	beq	.L2232
	cmp	w2, 153
	beq	.L2232
	cmp	w2, 123
	beq	.L2224
.L2223:
	ldr	x1, .LC584
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
	.p2align 3
.L2233:
	cmp	w2, 183
	beq	.L2234
	cmp	w2, 186
	beq	.L2234
	cmp	w2, 180
	bne	.L2223
.L2234:
	mov	w1, 8912896
	mov	w2, 35651584
	.p2align 2
.L2226:
	cmp	w0, w1
	bhi	.L2235
	mov	w0, 16
	str	w0, [x19, 236]
.L2236:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19, 80]
	cbz	w0, .L2239
	ldr	x1, .LC586
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	ldr	x21, .LC587
	ldr	w2, [x19, 64]
	ldr	x1, .LC589
	add	x2, x21, x2, lsl 2
	ldr	w2, [x2, 16]
	mul	w0, w2, w0
	str	w0, [x19, 84]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	ldr	w2, [x19, 64]
	ldr	w1, [x19, 72]
	ldr	w3, [x19, 84]
	add	x2, x21, x2, lsl 2
	sub	w1, w1, w3
	ldr	w2, [x2, 16]
	mul	w0, w0, w2
	str	w0, [x19, 88]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2356
	ldr	x1, .LC593
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	ldr	w2, [x19, 64]
	ldr	x1, .LC595
	add	x2, x21, x2, lsl 2
	ldr	w2, [x2, 32]
	mul	w0, w2, w0
	str	w0, [x19, 92]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	ldr	w2, [x19, 64]
	ldr	w1, [x19, 76]
	ldr	w3, [x19, 92]
	add	x21, x21, x2, lsl 2
	sub	w1, w1, w3
	ldr	w2, [x21, 32]
	mul	w0, w0, w2
	str	w0, [x19, 96]
	sub	w1, w1, w0
	tbnz	w1, #31, .L2357
.L2239:
	ldr	x1, .LC599
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 8
	cmp	w0, 6
	str	w2, [x19, 100]
	bhi	.L2358
	ldr	x1, .LC603
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 8
	cmp	w0, 6
	str	w2, [x19, 108]
	bhi	.L2359
	ldr	w0, [x19, 100]
	str	w0, [x20, 192]
	ldr	x1, .LC607
	ldr	w0, [x19, 108]
	str	w0, [x20, 196]
	ldr	w4, [x19, 100]
	ldr	w3, [x19, 108]
	lsl	w2, w4, 2
	lsl	w0, w3, 2
	sub	w2, w2, w4
	sub	w0, w0, w3
	lsl	w2, w2, 1
	lsl	w0, w0, 1
	sub	w2, w2, #48
	sub	w0, w0, #48
	str	w2, [x19, 104]
	str	w0, [x19, 112]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 12
	bhi	.L2360
	add	w0, w0, 4
	mov	w1, 1
	stp	w0, w0, [x19, 128]
	mov	w21, 0
	ldr	x0, [x20, 2344]
	bl	BsGet
	ldr	x28, .LC611
	ldr	x27, .LC613
	ldr	x26, .LC615
	strb	w0, [x19, 3]
	b	.L2250
	.p2align 3
.L2244:
	ldr	w0, [x19, 56]
	add	w21, w21, 1
	cmp	w21, w0
	bhi	.L2249
.L2250:
	add	x22, x19, x21, uxtw 2
	ldr	x0, [x20, 2344]
	mov	x1, x28
	bl	HEVC_ue_v
	add	w0, w0, 1
	str	w0, [x22, 380]
	mov	x1, x27
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x22, 412]
	mov	x1, x26
	ldr	w24, [x22, 380]
	ldr	x0, [x20, 2344]
	ldr	w25, [x19, 380]
	bl	HEVC_ue_v
	str	w0, [x22, 444]
	ldrb	w0, [x19, 3]
	cbnz	w0, .L2244
	ldr	w2, [x19, 56]
	add	w21, w21, 1
	cmp	w21, w2
	bhi	.L2249
	.p2align 2
.L2326:
	add	x0, x19, x21, uxtw 2
	ldr	w1, [x19, 380]
	add	w21, w21, 1
	cmp	w21, w2
	str	w1, [x0, 380]
	ldr	w1, [x19, 412]
	str	w1, [x0, 412]
	ldr	w1, [x19, 444]
	str	w1, [x0, 444]
	bls	.L2326
.L2249:
	ldr	w0, [x19, 236]
	cmp	w24, w25
	csel	w24, w24, w25, cs
	ldr	x1, .LC617
	cmp	w24, w0
	csel	w24, w24, w0, ls
	str	w24, [x19, 236]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 136]
	bhi	.L2361
	ldr	x1, .LC621
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 144]
	bhi	.L2362
	ldr	w1, [x19, 136]
	add	w1, w1, 3
	str	w1, [x19, 140]
	add	w0, w0, w1
	str	w0, [x19, 148]
	sub	w2, w0, #4
	cmp	w2, 2
	bhi	.L2363
	ldp	w4, w5, [x19, 72]
	mov	w21, 1
	lsl	w0, w21, w0
	lsl	w1, w21, w1
	stp	w0, w0, [x19, 160]
	udiv	w3, w4, w0
	stp	w1, w0, [x19, 152]
	ldr	x1, .LC627
	udiv	w2, w5, w0
	msub	w4, w3, w0, w4
	cmp	w4, wzr
	csinc	w3, w3, w3, eq
	str	w3, [x19, 240]
	msub	w0, w2, w0, w5
	cmp	w0, wzr
	csinc	w2, w2, w2, eq
	str	w2, [x19, 244]
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 168]
	bhi	.L2364
	ldr	x1, .LC631
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 176]
	bhi	.L2365
	ldr	w2, [x19, 168]
	ldr	w3, [x19, 140]
	add	w1, w2, 2
	str	w1, [x19, 172]
	cmp	w1, w3
	bcs	.L2366
	add	w1, w0, w1
	str	w1, [x19, 180]
	cmp	w1, 5
	bhi	.L2260
	ldr	w0, [x19, 148]
	cmp	w1, w0
	bhi	.L2260
	ldr	x1, .LC639
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 200]
	ldr	w1, [x19, 148]
	ldr	w2, [x19, 172]
	sub	w1, w1, w2
	cmp	w0, w1
	bhi	.L2367
	ldr	x1, .LC643
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 208]
	ldr	w1, [x19, 148]
	ldr	w2, [x19, 172]
	sub	w1, w1, w2
	cmp	w0, w1
	bhi	.L2368
	ldr	w1, [x19, 200]
	add	w0, w0, 1
	mov	w4, 1
	str	w0, [x19, 212]
	add	w0, w1, w4
	str	w0, [x19, 204]
	str	wzr, [x20, 260]
	ldr	w2, [x19, 144]
	ldr	w1, [x19, 160]
	ldr	w0, [x19, 172]
	lsr	w1, w1, w2
	lsl	w0, w4, w0
	cmp	w1, w0
	bhi	.L2265
	b	.L2369
	.p2align 3
.L2290:
	mov	w23, w3
.L2265:
	str	w23, [x20, 260]
	add	w3, w23, 1
	ldr	w0, [x19, 172]
	ldr	w2, [x19, 144]
	ldr	w1, [x19, 160]
	add	w0, w23, w0
	lsl	w0, w4, w0
	lsr	w1, w1, w2
	cmp	w1, w0
	bhi	.L2290
.L2264:
	add	w23, w23, w2
	mov	w21, 1
	stp	w23, wzr, [x19, 216]
	str	w21, [x19, 224]
	mov	w1, w21
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	cbz	w0, .L2266
	ldr	x0, [x20, 2344]
	mov	w1, w21
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 6]
	cbnz	w0, .L2370
.L2266:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbnz	w0, .L2267
	ldr	w2, [x19, 76]
	cmp	w2, 64
	bls	.L2371
.L2267:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	str	w0, [x19, 116]
	cbz	w0, .L2268
	ldr	x0, [x20, 2344]
	mov	w1, 4
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 120]
	mov	w1, 4
	ldr	x0, [x20, 2344]
	bl	BsGet
	add	w0, w0, 1
	str	w0, [x19, 124]
	ldr	x1, .LC652
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 2
	str	w0, [x19, 184]
	bhi	.L2372
.L2269:
	ldr	x1, .LC656
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 2
	str	w0, [x19, 192]
	bhi	.L2373
.L2270:
	ldr	w1, [x19, 184]
	add	w1, w1, 3
	str	w1, [x19, 188]
	add	w0, w1, w0
	str	w0, [x19, 196]
	cmp	w0, 5
	bhi	.L2271
	ldr	w1, [x19, 148]
	cmp	w0, w1
	bhi	.L2271
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
.L2268:
	ldr	x1, .LC662
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 64
	str	w0, [x19, 228]
	bhi	.L2273
	mov	w21, 0
	cbnz	w0, .L2325
	b	.L2279
	.p2align 3
.L2277:
	ldr	w0, [x19, 228]
	cmp	w21, w0
	bcs	.L2279
.L2325:
	uxtw	x2, w21
	mov	w3, w21
	lsl	x0, x2, 2
	mov	x1, x19
	sub	x2, x0, x2
	mov	x0, x20
	add	w21, w21, 1
	add	x2, x2, x2, lsl 4
	add	x2, x19, x2, lsl 2
	add	x2, x2, 12288
	add	x2, x2, 820
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2277
	ldr	x1, .LC666
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
	.p2align 3
.L2230:
	mov	w1, 245760
	mov	w2, 983040
	b	.L2226
	.p2align 3
.L2235:
	cmp	w0, w2, lsr 1
	bhi	.L2237
	mov	w0, 12
	str	w0, [x19, 236]
	b	.L2236
	.p2align 3
.L2279:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 10]
	cbz	w0, .L2276
	ldr	x1, .LC668
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 32
	str	w0, [x19, 232]
	bhi	.L2282
	mov	w22, 0
	cbz	w0, .L2276
	.p2align 2
.L2324:
	ldr	w1, [x19, 128]
	uxtw	x21, w22
	ldr	x0, [x20, 2344]
	add	w22, w22, 1
	bl	BsGet
	add	x2, x19, x21, lsl 2
	add	x21, x19, x21
	mov	w1, 1
	str	w0, [x2, 248]
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x21, 16]
	ldr	w0, [x19, 232]
	cmp	w22, w0
	bcc	.L2324
.L2276:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 11]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 13]
	cbz	w0, .L2281
	mov	x2, x19
	add	x1, x19, 2624
	mov	x0, x20
	bl	HEVC_DecVuiParam
	cbnz	w0, .L2374
.L2281:
	ldp	w3, w4, [x19, 72]
	ldr	w1, [x19, 2652]
	ldr	w2, [x19, 2656]
	ldr	w0, [x19, 2648]
	bl	HEVCGetDar
	str	w0, [x19, 2644]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 14]
	cbnz	w0, .L2347
.L2286:
	mov	w1, 1
	strb	w1, [x19]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2287:
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 15]
.L2347:
	ldr	x0, [x20, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2286
	ldr	x2, [x20, 2392]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcc	.L2287
	b	.L2286
	.p2align 3
.L2237:
	lsl	w1, w2, 2
	sub	w2, w1, w2
	cmp	w0, w2, lsr 2
	bhi	.L2238
	mov	w0, 8
	str	w0, [x19, 236]
	b	.L2236
	.p2align 3
.L2355:
	cbz	w2, .L2228
	cmp	w2, 30
	bne	.L2223
.L2228:
	mov	w1, 9216
	mov	w2, 36864
	b	.L2226
	.p2align 3
.L2371:
	ldr	x1, .LC649
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC650
	ldr	x4, [x0]
	cbz	x4, .L2291
	ldr	w0, [x20, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
	b	.L2348
	.p2align 3
.L2288:
	mov	w1, 30720
	mov	w2, 122880
	b	.L2226
	.p2align 3
.L2224:
	mov	w1, 32768
	mov	w2, 2228224
	movk	w1, 0x8, lsl 16
	b	.L2226
	.p2align 3
.L2229:
	mov	w1, 7168
	mov	w2, 28672
	movk	w1, 0x2, lsl 16
	movk	w2, 0x8, lsl 16
	b	.L2226
	.p2align 3
.L2238:
	mov	w0, 6
	str	w0, [x19, 236]
	b	.L2236
	.p2align 3
.L2232:
	mov	w1, 2228224
	mov	w2, 8912896
	b	.L2226
.L2370:
	add	x1, x19, 860
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbz	w0, .L2266
	ldr	x1, .LC647
	mov	w0, w21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
	.p2align 3
.L2260:
	ldr	x1, .LC637
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2373:
	ldr	x1, .LC658
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 192]
	b	.L2270
.L2372:
	ldr	x1, .LC654
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2269
.L2369:
	mov	w23, 0
	b	.L2264
.L2353:
	ldr	x1, .LC578
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2291:
	mov	w0, -1
	b	.L2348
.L2360:
	ldr	x1, .LC609
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2361:
	ldr	x1, .LC619
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2364:
	ldr	x1, .LC629
	mov	w0, w21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2271:
	ldr	x1, .LC660
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2367:
	ldr	x1, .LC641
	mov	w0, w21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2354:
	ldr	x1, .LC582
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2358:
	ldr	x1, .LC601
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2363:
	ldr	x1, .LC625
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2362:
	ldr	x1, .LC623
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2359:
	ldr	x1, .LC605
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2365:
	ldr	x1, .LC633
	mov	w0, w21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2366:
	ldr	x1, .LC635
	mov	w0, w21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2368:
	ldr	x1, .LC645
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2273:
	ldr	x1, .LC664
	mov	w2, 64
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2356:
	ldr	x1, .LC591
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2357:
	ldr	x1, .LC597
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2282:
	ldr	x1, .LC670
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
.L2374:
	ldr	x1, .LC672
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2348
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
	.align	3
.LC570:
	.xword	.LC569
	.align	3
.LC572:
	.xword	.LC571
	.align	3
.LC574:
	.xword	.LC573
	.align	3
.LC576:
	.xword	.LC575
	.align	3
.LC578:
	.xword	.LC577
	.align	3
.LC580:
	.xword	.LC579
	.align	3
.LC582:
	.xword	.LC581
	.align	3
.LC584:
	.xword	.LC583
	.align	3
.LC586:
	.xword	.LC585
	.align	3
.LC587:
	.xword	.LANCHOR5
	.align	3
.LC589:
	.xword	.LC588
	.align	3
.LC591:
	.xword	.LC590
	.align	3
.LC593:
	.xword	.LC592
	.align	3
.LC595:
	.xword	.LC594
	.align	3
.LC597:
	.xword	.LC596
	.align	3
.LC599:
	.xword	.LC598
	.align	3
.LC601:
	.xword	.LC600
	.align	3
.LC603:
	.xword	.LC602
	.align	3
.LC605:
	.xword	.LC604
	.align	3
.LC607:
	.xword	.LC606
	.align	3
.LC609:
	.xword	.LC608
	.align	3
.LC611:
	.xword	.LC610
	.align	3
.LC613:
	.xword	.LC612
	.align	3
.LC615:
	.xword	.LC614
	.align	3
.LC617:
	.xword	.LC616
	.align	3
.LC619:
	.xword	.LC618
	.align	3
.LC621:
	.xword	.LC620
	.align	3
.LC623:
	.xword	.LC622
	.align	3
.LC625:
	.xword	.LC624
	.align	3
.LC627:
	.xword	.LC626
	.align	3
.LC629:
	.xword	.LC628
	.align	3
.LC631:
	.xword	.LC630
	.align	3
.LC633:
	.xword	.LC632
	.align	3
.LC635:
	.xword	.LC634
	.align	3
.LC637:
	.xword	.LC636
	.align	3
.LC639:
	.xword	.LC638
	.align	3
.LC641:
	.xword	.LC640
	.align	3
.LC643:
	.xword	.LC642
	.align	3
.LC645:
	.xword	.LC644
	.align	3
.LC647:
	.xword	.LC646
	.align	3
.LC649:
	.xword	.LC648
	.align	3
.LC650:
	.xword	g_event_report
	.align	3
.LC652:
	.xword	.LC651
	.align	3
.LC654:
	.xword	.LC653
	.align	3
.LC656:
	.xword	.LC655
	.align	3
.LC658:
	.xword	.LC657
	.align	3
.LC660:
	.xword	.LC659
	.align	3
.LC662:
	.xword	.LC661
	.align	3
.LC664:
	.xword	.LC663
	.align	3
.LC666:
	.xword	.LC665
	.align	3
.LC668:
	.xword	.LC667
	.align	3
.LC670:
	.xword	.LC669
	.align	3
.LC672:
	.xword	.LC671
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
	stp	x29, x30, [sp, -496]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC673
	ldr	x26, .LC674
	mov	x2, 26164
	mov	w1, 0
	ldr	x3, [x21, 96]
	add	x22, x26, 3328
	mov	x0, x22
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 384
	mov	w1, 0
	add	x0, x29, 112
	blr	x3
	ldr	x0, [x19, 2344]
	mov	w1, 4
	bl	BsGet
	mov	w25, w0
	ldr	w2, [x19, 148]
	cmp	w2, w0
	bls	.L2386
	ldr	x0, [x19, 2344]
	mov	w1, 3
	bl	BsGet
	cmp	w0, 8
	mov	w24, w0
	bhi	.L2387
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsGet
	mov	w27, w0
	mov	w3, w24
	mov	w2, 1
	add	x1, x29, 112
	mov	x0, x19
	bl	HEVC_DecPTL
	cbnz	w0, .L2388
	ldr	x1, .LC682
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	mov	w23, w0
	ldr	w2, [x19, 152]
	cmp	w0, w2
	bcs	.L2389
	mov	w20, 26164
	ldr	x1, [x19, 2360]
	uxtb	w27, w27
	umull	x20, w0, w20
	add	x1, x1, x20
	ldrb	w0, [x1, 1]
	cbnz	w0, .L2390
	str	w25, [x1, 52]
	mov	x2, 384
	add	x1, x29, 112
	ldr	x0, [x19, 2360]
	add	x0, x0, x20
	str	w24, [x0, 56]
	ldr	x0, [x19, 2360]
	add	x0, x0, x20
	strb	w27, [x0, 2]
	ldr	x0, [x19, 2360]
	ldr	x3, [x21, 104]
	add	x0, x0, x20
	add	x0, x0, 476
	blr	x3
	ldr	x1, [x19, 2360]
	mov	x0, x19
	add	x1, x1, x20
	str	w23, [x1, 60]
	ldr	x1, [x19, 2360]
	add	x1, x1, x20
	bl	HEVC_ProcessSPS
	mov	w24, w0
	cbnz	w0, .L2391
	ldr	x1, [x19, 2360]
	mov	w3, 1
	add	x0, x19, 28672
	mov	x2, 26164
	add	x0, x0, 424
	strb	w3, [x1, x20]
	ldr	x1, [x19, 2360]
	add	x1, x1, x20
	strb	w3, [x1, 1]
	ldr	x1, [x19, 2360]
	ldr	x3, [x21, 104]
	add	x1, x1, x20
	blr	x3
.L2377:
	mov	w0, w24
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 496
	ret
	.p2align 3
.L2390:
	ldr	x3, [x21, 104]
	add	x1, x29, 112
	mov	x2, 384
	strb	w27, [x22, 2]
	stp	w25, w24, [x22, 52]
	add	x0, x26, 3804
	blr	x3
	str	w23, [x22, 60]
	mov	x1, x22
	mov	x0, x19
	bl	HEVC_ProcessSPS
	mov	w24, w0
	cbnz	w0, .L2392
	ldr	x0, [x19, 2360]
	mov	w2, 1
	ldr	x3, [x21, 112]
	mov	x1, x22
	strb	w2, [x26, 3328]
	add	x0, x0, x20
	strb	w2, [x22, 1]
	mov	x2, 26164
	blr	x3
	ldr	x1, [x19, 2360]
	add	x0, x19, 28672
	ldr	x3, [x21, 104]
	mov	x2, 26164
	add	x1, x1, x20
	add	x0, x0, 424
	blr	x3
	ldr	x27, [sp, 80]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 496
	ret
	.p2align 3
.L2389:
	ldr	x1, .LC684
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 152]
	cmp	w23, w1
	bcc	.L2385
	ldr	x0, .LC685
	ldr	x4, [x0]
	cbz	x4, .L2385
	ldr	w0, [x19, 276]
	add	x2, x29, 104
	stp	w23, w1, [x29, 104]
	mov	w3, 8
	mov	w1, 109
	mov	w24, -1
	blr	x4
	ldr	x27, [sp, 80]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 496
	ret
	.p2align 3
.L2385:
	mov	w24, -1
	b	.L2377
	.p2align 3
.L2386:
	ldr	x1, .LC676
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L2377
	.p2align 3
.L2387:
	ldr	x1, .LC678
	mov	w2, 8
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L2377
	.p2align 3
.L2388:
	ldr	x1, .LC680
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L2377
	.p2align 3
.L2391:
	ldr	x1, .LC689
	mov	w2, w23
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	ldr	x0, [x19, 2360]
	mov	w1, 1
	strb	w1, [x0, x20]
	ldr	x0, [x19, 2360]
	add	x20, x0, x20
	strb	wzr, [x20, 1]
	b	.L2377
	.p2align 3
.L2392:
	ldr	x1, [x19, 2360]
	add	x0, x19, 28672
	ldr	x3, [x21, 104]
	mov	x2, 26164
	add	x1, x1, x20
	add	x0, x0, 424
	mov	w24, -1
	blr	x3
	ldr	x1, .LC687
	mov	w2, w23
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2377
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	3
.LC673:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC674:
	.xword	.LANCHOR6
	.align	3
.LC676:
	.xword	.LC675
	.align	3
.LC678:
	.xword	.LC677
	.align	3
.LC680:
	.xword	.LC679
	.align	3
.LC682:
	.xword	.LC681
	.align	3
.LC684:
	.xword	.LC683
	.align	3
.LC685:
	.xword	g_event_report
	.align	3
.LC687:
	.xword	.LC686
	.align	3
.LC689:
	.xword	.LC688
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ProcessPPS
	.type	HEVC_ProcessPPS, %function
HEVC_ProcessPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	mov	w22, 1
	bl	_mcount
	mov	w0, 1
	strb	w0, [x19, 16]
	stp	w22, w22, [x19, 68]
	ldr	x1, .LC692
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	str	w0, [x19, 32]
	tbnz	w0, #31, .L2394
	ldr	w1, [x20, 152]
	cmp	w0, w1
	bge	.L2394
	ldr	x1, [x20, 2360]
	mov	w21, 26164
	smaddl	x21, w0, w21, x1
	ldrb	w1, [x21, 1]
	cbz	w1, .L2502
	ldr	x0, [x20, 2344]
	mov	w1, w22
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, w22
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 3
	ldr	x0, [x20, 2344]
	bl	BsGet
	str	w0, [x19, 36]
	mov	w1, w22
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, w22
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 5]
	ldr	x1, .LC698
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 40]
	bhi	.L2503
	ldr	x1, .LC702
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w0, w0, 1
	cmp	w0, 15
	str	w0, [x19, 44]
	bhi	.L2504
	ldr	x1, .LC706
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w2, w0, 26
	str	w2, [x19, 48]
	mov	w0, 51
	ldr	w3, [x21, 104]
	neg	w1, w3
	cmp	w2, w1
	ccmp	w2, w0, 0, ge
	bgt	.L2505
	ldr	x0, [x20, 2344]
	mov	w1, w22
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, w22
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, w22
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 8]
	cbnz	w0, .L2506
	mov	w0, 0
	str	wzr, [x19, 52]
.L2403:
	str	w0, [x19, 56]
	ldr	x1, .LC714
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 60]
	bhi	.L2507
	ldr	x1, .LC718
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x19, 64]
	bhi	.L2508
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 10]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 11]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 14]
	ldrb	w1, [x19, 13]
	cbnz	w1, .L2509
	ldr	w0, [x21, 240]
	strh	w0, [x19, 176]
	ldr	w0, [x21, 244]
	strh	w0, [x19, 216]
.L2440:
	ldr	w3, [x19, 68]
	cmp	w3, wzr
	ble	.L2445
.L2439:
	ldr	w4, [x21, 160]
	add	x0, x19, 176
	mov	w1, 0
	.p2align 2
.L2444:
	ldrsh	w2, [x0]
	add	w1, w1, 1
	add	x0, x0, 2
	mul	w2, w2, w4
	cmp	w2, 64
	bhi	.L2443
	ldr	w5, [x21, 72]
	cmp	w5, 64
	bhi	.L2510
.L2443:
	cmp	w1, w3
	blt	.L2444
.L2445:
	ldr	w1, [x19, 72]
	cmp	w1, wzr
	ble	.L2442
	ldrsh	w2, [x19, 216]
	ldr	w3, [x21, 160]
	mul	w2, w2, w3
	cmp	w2, 63
	bls	.L2446
	sub	w1, w1, #1
	mov	x0, x19
	add	x1, x19, x1, lsl 1
	b	.L2448
	.p2align 3
.L2449:
	ldrsh	w2, [x0, 218]
	add	x0, x0, 2
	mul	w2, w2, w3
	cmp	w2, 63
	bls	.L2446
.L2448:
	cmp	x1, x0
	bne	.L2449
.L2442:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 18]
	cbnz	w0, .L2511
.L2451:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 21]
	cbz	w0, .L2454
	add	x1, x19, 260
	mov	x0, x20
	bl	HEVC_DecScalingListData
	cbnz	w0, .L2512
.L2454:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 22]
	ldr	x1, .LC761
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 2
	cmp	w2, 1
	str	w2, [x19, 84]
	ble	.L2455
	ldr	w0, [x21, 148]
	cmp	w2, w0
	bhi	.L2455
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 24]
	cbz	w0, .L2458
	ldr	x0, [x20, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ble	.L2458
	.p2align 2
.L2513:
	ldr	x2, [x20, 2392]
	mov	w1, 1
	ldr	w2, [x2, 12]
	add	w2, w2, 3
	cmp	w2, w0
	bcs	.L2458
	ldr	x0, [x20, 2344]
	bl	BsGet
	strb	w0, [x19, 25]
	ldr	x0, [x20, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	bgt	.L2513
.L2458:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2506:
	ldr	x1, .LC710
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	cmp	w0, 3
	str	w0, [x19, 52]
	bls	.L2403
	ldr	x1, .LC712
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
	.p2align 3
.L2509:
	ldr	x1, .LC722
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w0, 19
	str	w2, [x19, 68]
	bhi	.L2514
	ldr	x1, .LC726
	ldr	x0, [x20, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w0, 21
	str	w2, [x19, 72]
	bhi	.L2515
	ldr	w3, [x19, 68]
	cmp	w3, 10
	bgt	.L2516
	cmp	w2, 11
	ble	.L2411
	ldr	x1, .LC733
	mov	w3, w2
	mov	w2, 11
.L2499:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC731
	ldr	x4, [x0]
	cbz	x4, .L2494
.L2496:
	ldr	w0, [x20, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L2490:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2446:
	ldr	x1, .LC749
.L2498:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC731
	ldr	x4, [x0]
	cbnz	x4, .L2496
.L2494:
	mov	w0, -1
.L2521:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2510:
	ldr	x1, .LC747
	b	.L2498
	.p2align 3
.L2505:
	ldr	x1, .LC708
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2411:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 15]
	cbnz	w0, .L2517
	ldr	w0, [x19, 68]
	sub	w1, w0, #1
	cmp	w1, wzr
	ble	.L2416
	ldr	x23, .LC735
	mov	w22, 0
	b	.L2420
	.p2align 3
.L2519:
	cmp	w3, w4
	bhi	.L2418
	ldr	w0, [x19, 68]
	add	w22, w22, 1
	sub	w1, w0, #1
	cmp	w1, w22
	ble	.L2518
.L2420:
	ldr	x0, [x20, 2344]
	mov	x1, x23
	bl	HEVC_ue_v
	add	w0, w0, 1
	add	x1, x19, x22, sxtw 1
	sxth	w3, w0
	strh	w3, [x1, 92]
	ldr	w4, [x21, 240]
	tbz	w3, #31, .L2519
.L2418:
	ldr	x1, .LC737
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2516:
	ldr	x1, .LC730
	mov	w2, 10
	b	.L2499
.L2511:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 19]
	mov	w1, 1
	ldr	x0, [x20, 2344]
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 20]
	cbnz	w0, .L2451
	ldr	x1, .LC751
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 76]
	bhi	.L2520
.L2453:
	ldr	x1, .LC755
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 80]
	bls	.L2451
	ldr	x1, .LC757
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 80]
	b	.L2451
.L2517:
	ldr	w0, [x19, 68]
.L2422:
	cmp	w0, wzr
	add	x5, x19, 176
	mov	w3, 0
	ble	.L2415
	.p2align 2
.L2474:
	add	w3, w3, 1
	ldr	w4, [x21, 240]
	sub	w2, w3, #1
	cmp	w3, w0
	mul	w1, w3, w4
	mul	w2, w2, w4
	udiv	w1, w1, w0
	udiv	w2, w2, w0
	sub	w1, w1, w2
	strh	w1, [x5], 2
	bne	.L2474
.L2415:
	ldr	w4, [x19, 72]
	add	x6, x19, 216
	mov	w3, 0
	cmp	w4, wzr
	ble	.L2430
	.p2align 2
.L2473:
	add	w3, w3, 1
	ldr	w5, [x21, 244]
	sub	w2, w3, #1
	cmp	w3, w4
	mul	w1, w3, w5
	mul	w2, w2, w5
	udiv	w1, w1, w4
	udiv	w2, w2, w4
	sub	w1, w1, w2
	strh	w1, [x6], 2
	bne	.L2473
.L2430:
	cmp	w0, 1
	bne	.L2438
	ldr	w3, [x19, 72]
	cmp	w3, 1
	beq	.L2439
.L2438:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L2440
.L2394:
	ldr	x1, .LC694
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2502:
	ldr	x1, .LC696
	mov	w2, w0
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2503:
	ldr	x1, .LC700
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2504:
	ldr	x1, .LC704
	mov	w0, w22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2507:
	ldr	x1, .LC716
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2508:
	ldr	x1, .LC720
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2455:
	ldr	x1, .LC763
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2521
.L2518:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	ble	.L2428
.L2421:
	ldr	x23, .LC739
	mov	w22, 0
	b	.L2427
	.p2align 3
.L2523:
	cmp	w3, w4
	bhi	.L2425
	ldr	w0, [x19, 72]
	add	w22, w22, 1
	sub	w0, w0, #1
	cmp	w0, w22
	ble	.L2522
.L2427:
	ldr	x0, [x20, 2344]
	mov	x1, x23
	bl	HEVC_ue_v
	add	w0, w0, 1
	add	x1, x19, x22, sxtw 1
	sxth	w3, w0
	strh	w3, [x1, 132]
	ldr	w4, [x21, 244]
	tbz	w3, #31, .L2523
.L2425:
	ldr	x1, .LC741
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2514:
	ldr	x1, .LC724
	mov	w3, 20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2520:
	ldr	x1, .LC753
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 76]
	b	.L2453
.L2522:
	ldr	w0, [x19, 68]
.L2428:
	ldrb	w1, [x19, 15]
	cbnz	w1, .L2422
	add	x5, x19, x0, sxtw 1
	sub	w2, w0, #1
	ldrsh	w3, [x21, 240]
	cmp	w2, wzr
	strh	w3, [x5, 174]
	ble	.L2433
	sub	w6, w0, #2
	add	x4, x19, 92
	add	x6, x6, 47
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2434:
	ldrsh	w3, [x4]
	add	x4, x4, 2
	strh	w3, [x4, 82]
	cmp	x4, x6
	ldrh	w1, [x5, 174]
	sub	w3, w1, w3
	sxth	w3, w3
	strh	w3, [x5, 174]
	bne	.L2434
.L2433:
	cmp	w3, wzr
	ble	.L2524
	ldr	w1, [x19, 72]
	ldrsh	w3, [x21, 244]
	sub	w2, w1, #1
	add	x5, x19, x1, sxtw 1
	cmp	w2, wzr
	strh	w3, [x5, 214]
	ble	.L2436
	sub	w6, w1, #2
	add	x4, x19, 132
	add	x6, x6, 67
	add	x6, x19, x6, lsl 1
	.p2align 2
.L2437:
	ldrsh	w3, [x4]
	add	x4, x4, 2
	strh	w3, [x4, 82]
	cmp	x6, x4
	ldrh	w1, [x5, 214]
	sub	w3, w1, w3
	sxth	w3, w3
	strh	w3, [x5, 214]
	bne	.L2437
.L2436:
	cmp	w3, wzr
	bgt	.L2430
	ldr	x1, .LC745
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
	.p2align 3
.L2515:
	ldr	x1, .LC728
	mov	w3, 22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2512:
	ldr	x1, .LC759
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
.L2416:
	ldr	w1, [x19, 72]
	sub	w1, w1, #1
	cmp	w1, wzr
	bgt	.L2421
	add	x1, x19, x0, sxtw 1
	ldrsh	w3, [x21, 240]
	sub	w2, w0, #1
	strh	w3, [x1, 174]
	b	.L2433
.L2524:
	ldr	x1, .LC743
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2490
	.size	HEVC_ProcessPPS, .-HEVC_ProcessPPS
	.align	3
.LC692:
	.xword	.LC691
	.align	3
.LC694:
	.xword	.LC693
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC698:
	.xword	.LC697
	.align	3
.LC700:
	.xword	.LC699
	.align	3
.LC702:
	.xword	.LC701
	.align	3
.LC704:
	.xword	.LC703
	.align	3
.LC706:
	.xword	.LC705
	.align	3
.LC708:
	.xword	.LC707
	.align	3
.LC710:
	.xword	.LC709
	.align	3
.LC712:
	.xword	.LC711
	.align	3
.LC714:
	.xword	.LC713
	.align	3
.LC716:
	.xword	.LC715
	.align	3
.LC718:
	.xword	.LC717
	.align	3
.LC720:
	.xword	.LC719
	.align	3
.LC722:
	.xword	.LC721
	.align	3
.LC724:
	.xword	.LC723
	.align	3
.LC726:
	.xword	.LC725
	.align	3
.LC728:
	.xword	.LC727
	.align	3
.LC730:
	.xword	.LC729
	.align	3
.LC731:
	.xword	g_event_report
	.align	3
.LC733:
	.xword	.LC732
	.align	3
.LC735:
	.xword	.LC734
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC739:
	.xword	.LC738
	.align	3
.LC741:
	.xword	.LC740
	.align	3
.LC743:
	.xword	.LC742
	.align	3
.LC745:
	.xword	.LC744
	.align	3
.LC747:
	.xword	.LC746
	.align	3
.LC749:
	.xword	.LC748
	.align	3
.LC751:
	.xword	.LC750
	.align	3
.LC753:
	.xword	.LC752
	.align	3
.LC755:
	.xword	.LC754
	.align	3
.LC757:
	.xword	.LC756
	.align	3
.LC759:
	.xword	.LC758
	.align	3
.LC761:
	.xword	.LC760
	.align	3
.LC763:
	.xword	.LC762
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPPS
	.type	HEVC_DecPPS, %function
HEVC_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC765
	ldr	x0, [x19, 2344]
	bl	HEVC_ue_v
	mov	w21, w0
	ldr	w3, [x19, 156]
	cmp	w0, w3
	bcs	.L2531
	mov	w20, 2024
	umull	x20, w0, w20
	ldr	x0, [x19, 2368]
	add	x1, x0, x20
	ldrb	w0, [x0, x20]
	cbnz	w0, .L2532
	str	w21, [x1, 28]
	mov	x0, x19
	ldr	x1, [x19, 2368]
	add	x1, x1, x20
	bl	HEVC_ProcessPPS
	mov	w22, w0
	cbnz	w0, .L2533
	ldr	x0, [x19, 2368]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2368]
	strb	w1, [x0, x20]
.L2527:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2532:
	ldr	x24, .LC768
	mov	x0, x19
	add	x23, x24, 3328
	mov	x1, x23
	str	w21, [x23, 28]
	bl	HEVC_ProcessPPS
	mov	w22, w0
	cbnz	w0, .L2534
	ldr	x3, .LC771
	mov	w1, 1
	ldr	x0, [x19, 2368]
	mov	x2, 2024
	strb	w1, [x23, 1]
	ldr	x3, [x3, 112]
	add	x0, x0, x20
	strb	w1, [x24, 3328]
	mov	x1, x23
	blr	x3
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2534:
	ldr	x1, .LC770
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2527
	.p2align 3
.L2531:
	ldr	x1, .LC767
	mov	w2, w0
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2527
.L2533:
	ldr	x1, .LC770
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x0, [x19, 2368]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 1]
	ldr	x0, [x19, 2368]
	strb	wzr, [x0, x20]
	b	.L2527
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	3
.LC765:
	.xword	.LC764
	.align	3
.LC767:
	.xword	.LC766
	.align	3
.LC768:
	.xword	.LANCHOR6
	.align	3
.LC770:
	.xword	.LC769
	.align	3
.LC771:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecPredWeightTable
	.type	HEVC_DecPredWeightTable, %function
HEVC_DecPredWeightTable:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 53248
	bl	_mcount
	ldr	x2, [x20, 2368]
	mov	w3, 2024
	ldr	w1, [x21, 2812]
	ldr	w0, [x21, 2828]
	cmp	w1, 1
	smaddl	x2, w0, w3, x2
	beq	.L2608
	cbnz	w1, .L2539
	ldrb	w0, [x2, 11]
	cbz	w0, .L2539
.L2537:
	add	x22, x20, 57344
	ldr	x1, .LC774
	ldr	x0, [x20, 2344]
	add	x25, x22, 248
	ldr	w23, [x2, 32]
	ldr	x19, [x20, 2360]
	bl	HEVC_ue_v
	cmp	w0, 7
	str	w0, [x22, 248]
	bhi	.L2609
	mov	w24, 26164
	smaddl	x24, w23, w24, x19
	ldr	w1, [x24, 64]
	cbnz	w1, .L2610
	ldr	w1, [x25, 4]
.L2543:
	add	x23, x22, 248
	add	w0, w0, w1
	cmp	w0, 7
	str	w0, [x23, 1032]
	bhi	.L2544
	ldr	w0, [x21, 2920]
	mov	w19, 0
	cbz	w0, .L2552
	.p2align 2
.L2594:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x23, x19, uxtw 2
	add	w19, w19, 1
	str	w0, [x1, 8]
	ldr	w0, [x21, 2920]
	cmp	w0, w19
	bhi	.L2594
	ldr	w1, [x24, 64]
	cbz	w1, .L2548
	mov	w19, 0
	add	x23, x22, 248
	cbz	w0, .L2552
	.p2align 2
.L2593:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x23, x19, uxtw 2
	add	w19, w19, 1
	str	w0, [x1, 72]
	ldr	w0, [x21, 2920]
	cmp	w0, w19
	bhi	.L2593
.L2548:
	mov	w28, 0
	mov	w23, 1
	cbnz	w0, .L2592
	b	.L2552
	.p2align 3
.L2554:
	ldr	w0, [x22, 248]
	str	wzr, [x25, 448]
	lsl	w0, w23, w0
	str	w0, [x25, 1284]
.L2556:
	ldr	w0, [x24, 64]
	cbz	w0, .L2558
	ldr	w0, [x25, 320]
	cbnz	w0, .L2559
	lsl	x0, x19, 3
	add	x1, x22, 248
	add	x2, x20, x0
	mov	x19, x1
	add	x2, x2, 57344
	add	x19, x19, x0
	ldr	w1, [x1, 1032]
	str	wzr, [x2, 1476]
	lsl	w0, w23, w1
	str	w0, [x2, 1348]
	str	w0, [x19, 1104]
	str	wzr, [x19, 1232]
.L2558:
	ldr	w0, [x21, 2920]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L2552
.L2592:
	uxtw	x19, w28
	add	x25, x20, x19, lsl 2
	add	x25, x25, 57344
	ldr	w0, [x25, 256]
	cbz	w0, .L2554
	ldr	x1, .LC784
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	str	w0, [x25, 384]
	bhi	.L2611
	ldr	w2, [x22, 248]
	ldr	x1, .LC788
	lsl	w2, w23, w2
	add	w0, w2, w0
	str	w0, [x25, 1284]
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	str	w0, [x25, 448]
	bls	.L2556
	ldr	x1, .LC790
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
	.p2align 3
.L2608:
	ldrb	w0, [x2, 10]
	cbnz	w0, .L2537
.L2539:
	mov	w0, 0
.L2538:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2559:
	add	x19, x19, 4096
	ldr	x1, .LC792
	add	x4, x19, 3136
	ldr	x0, [x20, 2344]
	add	x19, x19, 3137
	mov	w27, 128
	add	x25, x20, x4, lsl 3
	mov	w26, 127
	bl	HEVC_se_v
	add	w2, w0, 128
	cmp	w2, 255
	add	x19, x20, x19, lsl 3
	str	w0, [x25]
	ldr	x1, .LC796
	bhi	.L2612
.L2560:
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	str	w0, [x25, 128]
	bhi	.L2613
	ldr	w5, [x22, 1280]
	add	x25, x25, 4
	ldr	w2, [x25, -4]
	lsl	w1, w23, w5
	add	w1, w1, w2
	str	w1, [x25, 832]
	lsl	w1, w1, 7
	asr	w1, w1, w5
	sub	w1, w27, w1
	add	w0, w1, w0
	mov	w1, -128
	cmp	w0, 127
	csel	w0, w0, w26, le
	cmn	w0, #128
	csel	w0, w0, w1, ge
	cmp	x25, x19
	str	w0, [x25, 960]
	beq	.L2558
	ldr	x1, .LC792
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w2, w0, 128
	cmp	w2, 255
	str	w0, [x25]
	ldr	x1, .LC796
	bls	.L2560
.L2612:
	ldr	x1, .LC794
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2552:
	ldr	w0, [x21, 2812]
	cbnz	w0, .L2539
	ldr	w0, [x21, 2924]
	cbz	w0, .L2539
	mov	w19, 0
	add	x23, x22, 248
	.p2align 2
.L2566:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x23, x19, uxtw 2
	add	w19, w19, 1
	str	w0, [x1, 520]
	ldr	w0, [x21, 2924]
	cmp	w0, w19
	bhi	.L2566
	ldr	w1, [x24, 64]
	cbnz	w1, .L2614
.L2567:
	mov	w28, 0
	mov	w23, 1
	cbnz	w0, .L2590
	b	.L2539
	.p2align 3
.L2571:
	ldr	w0, [x22, 248]
	str	wzr, [x19, 960]
	lsl	w0, w23, w0
	str	w0, [x19, 1604]
.L2573:
	ldr	w0, [x24, 64]
	cbz	w0, .L2575
	ldr	w0, [x19, 832]
	cbnz	w0, .L2576
	lsl	x25, x25, 3
	add	x0, x22, 248
	add	x1, x20, x25
	add	x25, x0, x25
	add	x1, x1, 57344
	ldr	w0, [x22, 1280]
	lsl	w0, w23, w0
	str	wzr, [x1, 1796]
	str	w0, [x1, 1668]
	str	w0, [x25, 1424]
	str	wzr, [x25, 1552]
.L2575:
	ldr	w0, [x21, 2924]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L2539
.L2590:
	uxtw	x25, w28
	add	x19, x20, x25, lsl 2
	add	x19, x19, 57344
	ldr	w0, [x19, 768]
	cbz	w0, .L2571
	ldr	x1, .LC800
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 128
	cmp	w1, 255
	str	w0, [x19, 896]
	bhi	.L2615
	ldr	w1, [x22, 248]
	lsl	w1, w23, w1
	add	w0, w1, w0
	str	w0, [x19, 1604]
	ldr	x1, .LC804
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	str	w0, [x19, 960]
	add	w0, w0, 128
	cmp	w0, 255
	bls	.L2573
	ldr	x1, .LC806
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
	.p2align 3
.L2576:
	add	x25, x25, 4096
	mov	w27, 128
	add	x4, x25, 3200
	add	x25, x25, 3201
	mov	w26, 127
	add	x0, x20, x25, lsl 3
	add	x19, x20, x4, lsl 3
	mov	w25, -128
	str	x0, [x29, 104]
.L2579:
	ldr	x1, .LC808
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	str	w0, [x19]
	add	w0, w0, 128
	ldr	x1, .LC812
	cmp	w0, 255
	bhi	.L2616
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	add	w1, w0, 512
	cmp	w1, 1023
	str	w0, [x19, 128]
	bhi	.L2617
	ldr	w5, [x22, 1280]
	add	x19, x19, 4
	ldr	w3, [x19, -4]
	lsl	w1, w23, w5
	add	w1, w1, w3
	str	w1, [x19, 640]
	lsl	w1, w1, 7
	asr	w1, w1, w5
	sub	w1, w27, w1
	add	w0, w1, w0
	cmp	w0, 127
	csel	w0, w0, w26, le
	cmn	w0, #128
	csel	w0, w0, w25, ge
	str	w0, [x19, 768]
	ldr	x0, [x29, 104]
	cmp	x0, x19
	bne	.L2579
	b	.L2575
	.p2align 3
.L2610:
	ldr	x1, .LC778
	ldr	x0, [x20, 2344]
	bl	HEVC_se_v
	mov	w1, w0
	add	w0, w0, 7
	str	w1, [x25, 4]
	cmp	w0, 14
	bhi	.L2542
	ldr	w0, [x22, 248]
	b	.L2543
	.p2align 3
.L2613:
	ldr	x1, .LC798
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2614:
	mov	w19, 0
	add	x23, x22, 248
	cbz	w0, .L2539
	.p2align 2
.L2591:
	ldr	x0, [x20, 2344]
	mov	w1, 1
	bl	BsGet
	add	x1, x23, x19, uxtw 2
	add	w19, w19, 1
	str	w0, [x1, 584]
	ldr	w0, [x21, 2924]
	cmp	w0, w19
	bhi	.L2591
	b	.L2567
.L2611:
	ldr	x1, .LC786
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2616:
	ldr	x1, .LC810
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2617:
	ldr	x1, .LC814
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2615:
	ldr	x1, .LC802
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2544:
	ldr	x1, .LC782
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2609:
	ldr	x1, .LC776
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
.L2542:
	ldr	x1, .LC780
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2538
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
	.align	3
.LC774:
	.xword	.LC773
	.align	3
.LC776:
	.xword	.LC775
	.align	3
.LC778:
	.xword	.LC777
	.align	3
.LC780:
	.xword	.LC779
	.align	3
.LC782:
	.xword	.LC781
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC788:
	.xword	.LC787
	.align	3
.LC790:
	.xword	.LC789
	.align	3
.LC792:
	.xword	.LC791
	.align	3
.LC794:
	.xword	.LC793
	.align	3
.LC796:
	.xword	.LC795
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC802:
	.xword	.LC801
	.align	3
.LC804:
	.xword	.LC803
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC810:
	.xword	.LC809
	.align	3
.LC812:
	.xword	.LC811
	.align	3
.LC814:
	.xword	.LC813
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x27, x28, 53248
	bl	_mcount
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	ldr	w23, [x27, 2824]
	strb	w0, [x27, 2753]
	sub	w0, w23, #16
	str	w0, [x29, 132]
	cmp	w0, 5
	bls	.L2884
.L2619:
	ldr	x1, .LC816
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x27, 2828]
	ldr	w4, [x28, 156]
	tbnz	w0, #31, .L2621
	cmp	w0, w4
	bge	.L2621
	mov	x0, x28
	bl	HEVC_VpsSpsPpsCheck
	sxtw	x22, w0
	cbnz	w22, .L2885
	ldr	x0, [x28, 2368]
	mov	w3, 2024
	ldr	w20, [x27, 2828]
	mov	w2, 26164
	ldr	x1, [x28, 2360]
	smaddl	x20, w20, w3, x0
	ldr	w21, [x20, 32]
	ldrb	w0, [x20, 2]
	smaddl	x21, w21, w2, x1
	cbnz	w0, .L2886
.L2627:
	strb	wzr, [x27, 2755]
.L2628:
	ldp	w2, w3, [x21, 160]
	cbz	w2, .L2630
	cbz	w3, .L2630
	ldr	w0, [x21, 72]
	mov	w1, 0
	ldr	w24, [x21, 216]
	add	w0, w2, w0
	sub	w0, w0, #1
	lsl	w24, w24, 1
	udiv	w2, w0, w2
	ldr	w0, [x21, 76]
	add	w0, w3, w0
	sub	w0, w0, #1
	udiv	w19, w0, w3
	mul	w19, w2, w19
	mov	w2, 1
	cmp	w19, 1
	lsl	w24, w2, w24
	ble	.L2632
	.p2align 2
.L2633:
	add	w1, w1, 1
	lsl	w0, w2, w1
	cmp	w19, w0
	bgt	.L2633
.L2632:
	ldrb	w2, [x27, 2753]
	mov	w0, 0
	cbz	w2, .L2887
.L2634:
	mul	w19, w19, w24
	str	w0, [x27, 2904]
	str	w19, [x27, 2908]
	ldrb	w0, [x27, 2755]
	ldr	w1, [x28, 188]
	str	w1, [x27, 2800]
	cbz	w0, .L2888
.L2637:
	ldr	w0, [x20, 12]
	tst	w0, 16776960
	bne	.L2889
	str	wzr, [x27, 2892]
.L2745:
	ldrb	w0, [x20, 23]
	cbnz	w0, .L2749
.L2755:
	ldr	w0, [x27, 2904]
	cbnz	w0, .L2890
	ldrb	w0, [x28, 1]
	cbz	w0, .L2757
	ldr	w0, [x29, 132]
	cmp	w0, 5
	bhi	.L2758
	mov	w0, 1
	strb	w0, [x28, 3]
	ldr	w0, [x27, 2800]
	cmp	w0, wzr
	ldr	w0, [x29, 132]
	ccmp	w0, 5, 2, ne
	bhi	.L2758
.L2901:
	ldr	w0, [x27, 2824]
	cmp	w0, 21
	beq	.L2891
	.p2align 2
.L2758:
	strb	wzr, [x28, 2]
.L2761:
	mov	x0, x28
	bl	HEVC_IsNewPic
	add	x1, x28, 57344
	str	w0, [x1, 244]
	mov	x0, x28
	bl	HEVC_ReadByteAlignment
	cmp	w0, wzr
	csetm	w0, ne
.L2867:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2886:
	ldrb	w0, [x27, 2753]
	cbnz	w0, .L2627
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2755]
	b	.L2628
	.p2align 3
.L2888:
	ldr	w0, [x20, 36]
	cbz	w0, .L2642
	ldr	x24, .LC829
	mov	w19, 0
	.p2align 2
.L2641:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	add	w19, w19, w1
	bl	BsGet
	mov	w2, w0
	mov	x1, x24
	mov	w0, 19
	bl	dprint_vfmw
	ldr	w0, [x20, 36]
	cmp	w0, w19
	bhi	.L2641
.L2642:
	ldr	x1, .LC827
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	cmp	w0, 2
	str	w0, [x27, 2812]
	bhi	.L2892
	ldrb	w0, [x20, 4]
	cbnz	w0, .L2893
	mov	w0, 1
	strb	w0, [x27, 2752]
.L2644:
	sub	w23, w23, #19
	cmp	w23, 1
	bls	.L2645
	ldr	w1, [x21, 132]
	ldr	x0, [x28, 2344]
	bl	BsGet
	str	w0, [x27, 2840]
	mov	w4, w0
	mov	w2, 1
	ldr	w1, [x21, 128]
	ldr	w0, [x28, 184]
	lsl	w1, w2, w1
	mov	w3, w1
	udiv	w1, w0, w1
	stp	w3, w4, [x29, 112]
	msub	w1, w1, w3, w0
	cmp	w1, w4
	sub	w0, w0, w1
	bhi	.L2894
.L2646:
	ldr	w2, [x29, 116]
	cmp	w1, w2
	bcs	.L2647
	sub	w1, w2, w1
	ldr	w2, [x29, 112]
	cmp	w1, w2, lsr 1
	sub	w1, w0, w2
	csel	w0, w1, w0, hi
.L2647:
	ldr	w1, [x27, 2824]
	sub	w1, w1, #16
	cmp	w1, 2
	ldr	w1, [x29, 116]
	csel	w0, w0, wzr, hi
	add	w3, w0, w1
	str	w3, [x27, 2800]
	ldr	w2, [x28, 244]
	cmp	w3, w2
	bge	.L2649
	ldrb	w0, [x27, 2753]
	cmp	w0, 1
	beq	.L2895
.L2649:
	ldr	w0, [x28, 220]
	cbnz	w0, .L2650
	ldr	w0, [x27, 2800]
	str	w0, [x28, 188]
.L2650:
	ldr	w0, [x27, 2820]
	cbnz	w0, .L2651
	ldr	w0, [x27, 2824]
	cmp	w0, 15
	bhi	.L2652
	mov	w1, 1
	tbz	x0, 0, .L2652
.L2653:
	sub	w0, w0, #7
	tst	w0, -3
	cset	w0, ne
	tst	w1, w0
	beq	.L2651
	ldr	w0, [x27, 2800]
	str	w0, [x27, 2804]
	str	w0, [x28, 184]
	.p2align 2
.L2651:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x27, 2756]
	cbz	w0, .L2654
	ldr	w2, [x21, 228]
	mov	w1, 0
	mov	w3, 1
	cmp	w2, 1
	bls	.L2656
	.p2align 2
.L2832:
	add	w1, w1, 1
	lsl	w0, w3, w1
	cmp	w0, w2
	bcc	.L2832
	cbnz	w1, .L2896
.L2656:
	str	wzr, [x27, 2844]
.L2661:
	add	x0, x28, 57344
	str	x0, [x29, 104]
	add	x3, x0, 1924
	lsl	x0, x22, 2
	sub	x22, x0, x22
	mov	x2, 204
	mov	x0, x3
	add	x22, x22, x22, lsl 4
	add	x1, x21, x22, lsl 2
	add	x1, x1, 12288
	add	x1, x1, 820
	bl	memcpy
	str	x0, [x29, 120]
.L2657:
	ldrb	w0, [x21, 10]
	cbz	w0, .L2662
	ldr	x0, [x29, 104]
	ldr	w1, [x21, 232]
	add	x0, x0, 1924
	ldr	w2, [x0, 16]
	ldr	w0, [x0, 20]
	add	w0, w2, w0
	str	w0, [x29, 100]
	cbnz	w1, .L2663
.L2666:
	mov	w23, 0
.L2664:
	ldr	x1, .LC843
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x27, 2852]
	ldr	x1, [x29, 104]
	add	x24, x1, 1924
	ldr	w1, [x27, 2848]
	add	w4, w0, w1
	ldp	w2, w3, [x24, 16]
	str	w4, [x24, 32]
	add	w0, w2, w3
	add	w0, w0, w4
	cmp	w0, 16
	bhi	.L2897
	ldr	w0, [x29, 100]
	sub	w0, w0, #1
	str	w0, [x29, 96]
	add	w0, w4, w0
	str	w0, [x29, 136]
	cbz	w4, .L2669
	mov	w26, 0
	str	wzr, [x29, 140]
	b	.L2670
	.p2align 3
.L2900:
	ldr	w0, [x27, 2848]
	cmp	w0, w26
	ldr	w0, [x29, 140]
	csel	w0, w0, wzr, ne
	str	w0, [x29, 140]
.L2680:
	add	x19, x19, 12288
	add	x19, x28, x19, lsl 2
	str	wzr, [x19, 8372]
.L2679:
	ldr	w1, [x24, 32]
	add	w26, w26, 1
	cmp	w1, w26
	bls	.L2681
	ldr	w1, [x27, 2848]
.L2670:
	ldr	w0, [x29, 136]
	cmp	w26, w1
	sub	w19, w0, w26
	bcs	.L2672
	cbnz	w23, .L2898
	mov	w0, 0
	uxtw	x25, w26
.L2673:
	sxtw	x0, w0
	add	x1, x21, x0
	add	x0, x21, x0, lsl 2
	ldrb	w1, [x1, 16]
	ldr	w3, [x0, 248]
	add	x0, x24, x19
	strb	w1, [x0, 53]
.L2676:
	add	x22, x28, x25, lsl 2
	mov	w1, 1
	add	x0, x22, 57344
	str	w3, [x0, 52]
	ldr	x0, [x28, 2344]
	bl	BsGet
	uxtb	w0, w0
	add	x7, x28, x25
	add	x7, x7, 53248
	strb	w0, [x7, 2783]
	cbnz	w0, .L2899
	cbnz	w26, .L2900
	str	wzr, [x29, 140]
	b	.L2680
	.p2align 3
.L2890:
	ldrb	w0, [x28, 3]
	cbz	w0, .L2758
	ldr	w0, [x27, 2800]
	cmp	w0, wzr
	ldr	w0, [x29, 132]
	ccmp	w0, 5, 2, ne
	bls	.L2901
	b	.L2758
	.p2align 3
.L2884:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2754]
	b	.L2619
	.p2align 3
.L2887:
	ldr	x0, [x28, 2344]
	bl	BsGet
	str	w0, [x27, 2832]
	ldp	w1, w3, [x21, 240]
	mul	w3, w1, w3
	tbnz	w0, #31, .L2636
	cmp	w3, w0
	bls	.L2636
	mul	w0, w24, w0
	b	.L2634
	.p2align 3
.L2889:
	ldr	x1, .LC901
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x27, 2892]
	ldr	w1, [x20, 12]
	and	w1, w1, 16776960
	cmp	w1, 65536
	beq	.L2902
	cmp	w1, 256
	ldr	w1, [x20, 68]
	beq	.L2903
	ldr	w2, [x21, 244]
	mul	w1, w1, w2
	sub	w1, w1, #1
.L2741:
	cmp	w1, 255
	mov	w3, 255
	csel	w3, w1, w3, ls
	cmp	w0, w3
	bhi	.L2904
	cbz	w0, .L2745
	ldr	x1, .LC905
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w0, 31
	str	w2, [x27, 2816]
	bhi	.L2905
	ldr	w0, [x27, 2892]
	cbz	w0, .L2745
	mov	w19, 0
	b	.L2747
	.p2align 3
.L2906:
	ldr	w2, [x27, 2816]
.L2747:
	ldr	x0, [x28, 2344]
	mov	w1, w2
	bl	BsGet
	uxtw	x1, w19
	add	w19, w19, 1
	add	x1, x1, 12288
	add	x1, x28, x1, lsl 2
	str	w0, [x1, 7028]
	ldr	w0, [x27, 2892]
	cmp	w0, w19
	bhi	.L2906
	ldrb	w0, [x20, 23]
	cbz	w0, .L2755
.L2749:
	ldr	x1, .LC909
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	cmp	w0, 256
	str	w0, [x27, 2896]
	bhi	.L2907
	ldr	x0, [x28, 2344]
	bl	BsResidBits
	ldr	w3, [x27, 2896]
	cmp	w3, w0
	bhi	.L2753
	mov	w19, 0
	cbz	w3, .L2755
	.p2align 2
.L2831:
	ldr	x0, [x28, 2344]
	mov	w1, 8
	add	w19, w19, 1
	bl	BsGet
	str	w0, [x27, 2900]
	ldr	w1, [x27, 2896]
	cmp	w1, w19
	bhi	.L2831
	b	.L2755
	.p2align 3
.L2757:
	ldr	w0, [x29, 132]
	cmp	w0, 5
	bhi	.L2758
	strb	wzr, [x28, 3]
	b	.L2758
	.p2align 3
.L2894:
	sub	w2, w1, w4
	cmp	w2, w3, lsr 1
	bcc	.L2646
	add	w0, w0, w3
	b	.L2647
.L2902:
	ldr	w1, [x21, 244]
	sub	w1, w1, #1
	b	.L2741
.L2652:
	sub	w1, w0, #16
	cmp	w1, 7
	cset	w1, ls
	b	.L2653
	.p2align 3
.L2672:
	ldr	w1, [x21, 132]
	uxtw	x25, w26
	ldr	x0, [x28, 2344]
	bl	BsGet
	mov	w3, w0
	add	x0, x25, 12288
	mov	w1, 1
	str	w3, [x29, 128]
	add	x0, x28, x0, lsl 2
	str	w3, [x0, 8116]
	ldr	x0, [x28, 2344]
	bl	BsGet
	uxtb	w0, w0
	add	x1, x28, x25
	ldr	w3, [x29, 128]
	add	x1, x1, 53248
	strb	w0, [x1, 2767]
	add	x1, x24, x19
	strb	w0, [x1, 53]
	b	.L2676
	.p2align 3
.L2899:
	ldr	x1, .LC849
	add	x22, x22, 53248
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x22, 4084]
	cbz	w26, .L2678
	ldr	w1, [x29, 140]
	add	w25, w0, w1
	ldr	w1, [x27, 2848]
	cmp	w1, w26
	csel	w0, w25, w0, ne
.L2678:
	add	x19, x28, x19, lsl 2
	mov	w1, 1
	add	x19, x19, 57344
	str	w0, [x29, 140]
	str	w0, [x19, 116]
	str	w1, [x19, 180]
	b	.L2679
	.p2align 3
.L2898:
	ldr	x0, [x28, 2344]
	mov	w1, w23
	uxtw	x25, w26
	bl	BsGet
	add	x1, x25, 12288
	add	x1, x28, x1, lsl 2
	str	w0, [x1, 8052]
	ldr	w4, [x21, 232]
	sub	w4, w4, #1
	tbnz	w0, #31, .L2675
	cmp	w4, w0
	bcs	.L2673
.L2675:
	ldr	x1, .LC847
	mov	w3, w0
	mov	w2, w26
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2645:
	str	wzr, [x27, 2800]
	ldr	w0, [x28, 220]
	cbnz	w0, .L2687
	str	wzr, [x28, 188]
.L2687:
	ldr	w0, [x27, 2820]
	cbnz	w0, .L2688
	str	wzr, [x27, 2804]
	str	wzr, [x28, 184]
.L2688:
	ldrb	w0, [x21, 8]
	cbz	w0, .L2763
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2757]
	mov	w1, 1
	ldr	x0, [x28, 2344]
	bl	BsGet
	strb	w0, [x27, 2758]
.L2763:
	strb	wzr, [x27, 2759]
	str	xzr, [x29, 120]
.L2765:
	ldr	w0, [x27, 2812]
	cmp	w0, 2
	bne	.L2908
.L2689:
	ldrb	w0, [x27, 2759]
	cbnz	w0, .L2909
.L2710:
	mov	w1, 2
.L2720:
	ldrb	w0, [x20, 11]
	cbz	w0, .L2709
	cbnz	w1, .L2709
.L2723:
	mov	x0, x28
	bl	HEVC_DecPredWeightTable
	cbnz	w0, .L2910
	ldr	w1, [x27, 2812]
.L2709:
	cmp	w1, 2
	beq	.L2724
	ldr	x1, .LC873
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	mov	w3, 4
	mov	w1, 5
	sub	w3, w3, w0
	sub	w2, w1, w0
	cmp	w3, 4
	str	w2, [x27, 2868]
	bhi	.L2911
.L2724:
	ldr	x1, .LC877
	ldr	x0, [x28, 2344]
	bl	HEVC_se_v
	str	w0, [x27, 2872]
	mov	w4, 51
	ldr	w1, [x20, 48]
	add	w2, w0, w1
	str	w2, [x27, 2808]
	ldr	w3, [x21, 104]
	neg	w0, w3
	cmp	w2, w0
	ccmp	w2, w4, 0, ge
	bgt	.L2912
	ldrb	w0, [x20, 9]
	cbnz	w0, .L2913
.L2726:
	ldrb	w0, [x20, 18]
	cbz	w0, .L2874
	ldrb	w0, [x20, 19]
	cbnz	w0, .L2914
	strb	wzr, [x27, 2764]
.L2734:
	ldrb	w0, [x20, 20]
	strb	w0, [x27, 2765]
	ldr	w1, [x20, 76]
	str	w1, [x27, 2884]
	ldr	w1, [x20, 80]
	str	w1, [x27, 2888]
.L2731:
	ldrb	w2, [x21, 8]
	mov	w1, 0
	cbz	w2, .L2737
	ldr	w1, [x27, 2756]
	tst	w1, 16776960
	cset	w1, ne
.L2737:
	ldrb	w2, [x20, 17]
	cbz	w2, .L2738
	cmp	w0, wzr
	cset	w0, eq
	orr	w1, w0, w1
	cbnz	w1, .L2915
.L2738:
	strb	w2, [x27, 2766]
	b	.L2637
	.p2align 3
.L2908:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x27, 2760]
	cbnz	w0, .L2916
	ldr	w0, [x20, 40]
	ldr	w1, [x27, 2812]
	str	w0, [x27, 2920]
	cbnz	w1, .L2697
	ldr	w0, [x20, 44]
	str	w0, [x27, 2924]
.L2695:
	ldr	x0, [x29, 120]
	cbz	x0, .L2917
	ldr	x0, [x29, 120]
	ldr	w2, [x0, 24]
	cmp	w2, 16
	bhi	.L2699
	cbz	w2, .L2701
	ldr	x1, [x29, 120]
	sub	w2, w2, #1
	add	x2, x2, 54
	mov	w3, 0
	add	x0, x1, 53
	add	x2, x1, x2
	.p2align 2
.L2703:
	ldrb	w1, [x0], 1
	cmp	w1, wzr
	csinc	w3, w3, w3, eq
	cmp	x0, x2
	bne	.L2703
	ldrb	w0, [x20, 22]
	cmp	w0, wzr
	ccmp	w3, 1, 4, ne
	ble	.L2701
	add	x2, x28, 57344
	add	x1, x27, 2752
	add	x2, x2, 2128
	mov	x0, x28
	bl	HEVC_DecRefPicListsModification
	cbnz	w0, .L2918
.L2694:
	ldr	w1, [x27, 2812]
	cbnz	w1, .L2704
.L2766:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2761]
	ldr	w1, [x27, 2812]
.L2704:
	cmp	w1, 2
	beq	.L2689
.L2767:
	ldrb	w0, [x20, 5]
	cbnz	w0, .L2919
.L2705:
	ldrb	w0, [x27, 2759]
	cbz	w0, .L2706
	ldr	w0, [x27, 2812]
	cbz	w0, .L2920
	mov	w1, 1
	cmp	w0, 2
	strb	w1, [x27, 2763]
	beq	.L2710
.L2713:
	ldr	w0, [x27, 2920]
	cmp	w0, 1
	bls	.L2706
.L2711:
	ldr	x1, .LC867
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x27, 2864]
	ldrb	w2, [x27, 2763]
	cbnz	w2, .L2716
	ldr	w4, [x27, 2860]
	sub	w4, w4, #1
.L2718:
	cmp	w4, w0
	ccmp	w0, wzr, 1, cs
	bge	.L2706
	ldr	x1, .LC869
	mov	w3, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2706:
	ldr	w1, [x27, 2812]
.L2715:
	ldrb	w0, [x20, 10]
	cbz	w0, .L2720
	cmp	w1, 1
	bne	.L2720
	b	.L2723
.L2914:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x27, 2764]
	cbz	w0, .L2734
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x27, 2765]
	cbnz	w0, .L2731
	ldr	x1, .LC893
	ldr	x0, [x28, 2344]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x27, 2884]
	bhi	.L2921
.L2735:
	ldr	x1, .LC897
	ldr	x0, [x28, 2344]
	bl	HEVC_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x27, 2888]
	bls	.L2874
	ldr	x1, .LC899
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 80]
	str	w0, [x27, 2888]
	.p2align 2
.L2874:
	ldrb	w0, [x27, 2765]
	b	.L2731
.L2669:
	mov	w1, 0
.L2671:
	ldr	w0, [x29, 100]
	add	w2, w0, w1
	ldr	x0, [x29, 104]
	cmp	w2, 16
	str	w2, [x0, 1948]
	bhi	.L2922
.L2662:
	ldrb	w0, [x21, 11]
	cbnz	w0, .L2923
	strb	wzr, [x27, 2759]
.L2686:
	ldrb	w0, [x21, 8]
	cbz	w0, .L2765
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2757]
	mov	w1, 1
	ldr	x0, [x28, 2344]
	bl	BsGet
	strb	w0, [x27, 2758]
	b	.L2765
	.p2align 3
.L2701:
	ldr	w0, [x27, 2812]
	cbnz	w0, .L2767
	b	.L2766
	.p2align 3
.L2893:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2752]
	b	.L2644
	.p2align 3
.L2621:
	ldr	x2, .LC817
	mov	w3, w0
	ldr	x1, .LC819
	mov	w0, 1
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2913:
	ldr	x1, .LC881
	ldr	x0, [x28, 2344]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x27, 2876]
	bhi	.L2924
	ldr	w3, [x20, 60]
	add	w1, w0, w3
	add	w1, w1, 12
	cmp	w1, 24
	bhi	.L2925
	ldr	x1, .LC887
	ldr	x0, [x28, 2344]
	bl	HEVC_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x27, 2880]
	bhi	.L2926
	ldr	w1, [x20, 64]
	add	w2, w0, w1
	add	w0, w2, 12
	cmp	w0, 24
	bls	.L2726
	ldr	x1, .LC891
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2919:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2762]
	b	.L2705
.L2681:
	ldr	w0, [x29, 96]
	add	w9, w1, w0
	cbz	w1, .L2669
	ldr	x0, [x29, 104]
	mov	x3, 0
	add	x7, x0, 52
	b	.L2684
	.p2align 3
.L2927:
	ldr	w0, [x7]
	ldr	w2, [x4, 116]
	ldr	w5, [x29, 112]
	ldr	w10, [x27, 2800]
	msub	w8, w5, w2, w0
	ldr	w0, [x29, 116]
	sub	w2, w10, w0
	add	w0, w8, w2
	str	w0, [x4, 2064]
	sub	w0, w0, w10
	str	w0, [x4, 1996]
.L2683:
	add	x3, x3, 1
	add	x7, x7, 4
	cmp	w1, w3
	bls	.L2671
.L2684:
	add	x2, x3, 53248
	sub	w0, w9, w3
	add	x2, x2, 2783
	add	x4, x28, x0, uxtw 2
	add	x4, x4, 57344
	ldrb	w2, [x28, x2]
	mov	x0, x4
	cbnz	w2, .L2927
	ldr	w2, [x7]
	str	w2, [x4, 2064]
	ldr	w4, [x27, 2800]
	sub	w2, w2, w4
	str	w2, [x0, 1996]
	b	.L2683
.L2697:
	str	wzr, [x27, 2924]
.L2696:
	cmp	w1, 2
	bne	.L2695
	ldr	w1, [x27, 2812]
	b	.L2704
	.p2align 3
.L2654:
	add	x0, x28, 57344
	ldr	w3, [x21, 228]
	add	x2, x0, 1924
	str	x0, [x29, 104]
	mov	x1, x21
	mov	x0, x28
	str	x2, [x29, 120]
	bl	HEVC_DecShortTermRefPicSet
	cbz	w0, .L2657
	ldr	x1, .LC835
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2916:
	ldr	x1, .LC853
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w2, 16
	str	w2, [x27, 2856]
	bhi	.L2928
	ldr	w1, [x27, 2812]
	str	w2, [x27, 2920]
	cbz	w1, .L2929
	str	wzr, [x27, 2860]
	str	wzr, [x27, 2924]
	b	.L2696
.L2920:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	uxtb	w0, w0
	ldr	w1, [x27, 2812]
	strb	w0, [x27, 2763]
	cmp	w1, 2
	beq	.L2724
	cbnz	w0, .L2713
	ldr	w0, [x27, 2924]
	cmp	w0, 1
	bhi	.L2711
	b	.L2715
.L2909:
	mov	w0, 1
	mov	w1, 2
	strb	w0, [x27, 2763]
	b	.L2715
.L2915:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2766]
	b	.L2637
.L2896:
	ldr	x0, [x28, 2344]
	bl	BsGet
	sxtw	x22, w0
	str	w22, [x27, 2844]
	ldr	w3, [x21, 228]
	sub	w3, w3, #1
	tbnz	w22, #31, .L2660
	cmp	w3, w22
	bcs	.L2661
.L2660:
	ldr	x1, .LC837
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2716:
	ldr	w4, [x27, 2856]
	sub	w4, w4, #1
	b	.L2718
.L2663:
	ldr	x1, .LC839
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	str	w0, [x27, 2848]
	ldr	w3, [x21, 232]
	cmp	w0, w3
	bhi	.L2930
	cmp	w3, 1
	bls	.L2666
	mov	w23, 0
	mov	w1, 1
	.p2align 2
.L2667:
	add	w23, w23, 1
	lsl	w0, w1, w23
	cmp	w3, w0
	bhi	.L2667
	b	.L2664
.L2891:
	mov	w0, 1
	strb	w0, [x28, 2]
	b	.L2761
.L2929:
	ldr	x1, .LC857
	ldr	x0, [x28, 2344]
	bl	HEVC_ue_v
	add	w2, w0, 1
	cmp	w2, 16
	str	w2, [x27, 2860]
	bhi	.L2931
	ldr	w0, [x27, 2812]
	str	w2, [x27, 2924]
	cmp	w0, 2
	bne	.L2695
	b	.L2694
	.p2align 3
.L2907:
	ldr	x1, .LC911
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2922:
	ldr	x1, .LC851
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.p2align 3
.L2923:
	ldr	x0, [x28, 2344]
	mov	w1, 1
	bl	BsGet
	strb	w0, [x27, 2759]
	b	.L2686
.L2630:
	ldr	x1, .LC823
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2903:
	ldr	w2, [x20, 72]
	mul	w1, w1, w2
	sub	w1, w1, #1
	b	.L2741
.L2885:
	ldr	w0, [x28, 248]
	cbz	w0, .L2625
	ldr	w0, [x28, 188]
	str	w0, [x27, 2800]
.L2626:
	mov	x0, x28
	bl	HEVC_IsNewPic
	add	x5, x28, 57344
	ldr	x1, .LC821
	str	w0, [x5, 244]
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2912:
	ldr	x1, .LC879
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2625:
	str	wzr, [x27, 2800]
	b	.L2626
.L2895:
	ldr	x1, .LC833
	bl	dprint_vfmw
	b	.L2649
.L2636:
	ldr	x1, .LC825
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2892:
	ldr	x1, .LC831
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2699:
	ldr	x1, .LC863
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2911:
	ldr	x1, .LC875
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2904:
	ldr	x1, .LC903
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2921:
	ldr	x1, .LC895
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 76]
	str	w0, [x27, 2884]
	b	.L2735
.L2753:
	ldr	x1, .LC913
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2925:
	ldr	x1, .LC885
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2910:
	ldr	x1, .LC871
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2924:
	ldr	x1, .LC883
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2897:
	ldr	x1, .LC845
	mov	w5, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2926:
	ldr	x1, .LC889
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2905:
	ldr	x1, .LC907
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2928:
	ldr	x1, .LC855
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2917:
	ldr	x1, .LC861
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2918:
	ldr	x1, .LC865
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2930:
	ldr	x1, .LC841
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
.L2931:
	ldr	x1, .LC859
	mov	w3, 16
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2867
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	3
.LC816:
	.xword	.LC815
	.align	3
.LC817:
	.xword	.LANCHOR5
	.align	3
.LC819:
	.xword	.LC818
	.align	3
.LC821:
	.xword	.LC820
	.align	3
.LC823:
	.xword	.LC822
	.align	3
.LC825:
	.xword	.LC824
	.align	3
.LC827:
	.xword	.LC826
	.align	3
.LC829:
	.xword	.LC828
	.align	3
.LC831:
	.xword	.LC830
	.align	3
.LC833:
	.xword	.LC832
	.align	3
.LC835:
	.xword	.LC834
	.align	3
.LC837:
	.xword	.LC836
	.align	3
.LC839:
	.xword	.LC838
	.align	3
.LC841:
	.xword	.LC840
	.align	3
.LC843:
	.xword	.LC842
	.align	3
.LC845:
	.xword	.LC844
	.align	3
.LC847:
	.xword	.LC846
	.align	3
.LC849:
	.xword	.LC848
	.align	3
.LC851:
	.xword	.LC850
	.align	3
.LC853:
	.xword	.LC852
	.align	3
.LC855:
	.xword	.LC854
	.align	3
.LC857:
	.xword	.LC856
	.align	3
.LC859:
	.xword	.LC858
	.align	3
.LC861:
	.xword	.LC860
	.align	3
.LC863:
	.xword	.LC862
	.align	3
.LC865:
	.xword	.LC864
	.align	3
.LC867:
	.xword	.LC866
	.align	3
.LC869:
	.xword	.LC868
	.align	3
.LC871:
	.xword	.LC870
	.align	3
.LC873:
	.xword	.LC872
	.align	3
.LC875:
	.xword	.LC874
	.align	3
.LC877:
	.xword	.LC876
	.align	3
.LC879:
	.xword	.LC878
	.align	3
.LC881:
	.xword	.LC880
	.align	3
.LC883:
	.xword	.LC882
	.align	3
.LC885:
	.xword	.LC884
	.align	3
.LC887:
	.xword	.LC886
	.align	3
.LC889:
	.xword	.LC888
	.align	3
.LC891:
	.xword	.LC890
	.align	3
.LC893:
	.xword	.LC892
	.align	3
.LC895:
	.xword	.LC894
	.align	3
.LC897:
	.xword	.LC896
	.align	3
.LC899:
	.xword	.LC898
	.align	3
.LC901:
	.xword	.LC900
	.align	3
.LC903:
	.xword	.LC902
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC907:
	.xword	.LC906
	.align	3
.LC909:
	.xword	.LC908
	.align	3
.LC911:
	.xword	.LC910
	.align	3
.LC913:
	.xword	.LC912
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FrameStoreRefFlg
	.type	HEVC_FrameStoreRefFlg, %function
HEVC_FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_FrameStoreRefFlg, .-HEVC_FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrSlice
	.type	HEVC_ClearCurrSlice, %function
HEVC_ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 2392]
	cbz	x1, .L2934
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L2934:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrSlice, .-HEVC_ClearCurrSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrNal
	.type	HEVC_ClearCurrNal, %function
HEVC_ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_ClearCurrSlice
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrNal, .-HEVC_ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAllSlice
	.type	HEVC_ClearAllSlice, %function
HEVC_ClearAllSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, 0
	add	x22, x21, 69632
	bl	_mcount
	ldr	w2, [x21, 160]
	cbz	w2, .L2943
	.p2align 2
.L2946:
	uxtw	x0, w20
	ldr	x1, [x22, 608]
	lsl	x19, x0, 5
	add	w20, w20, 1
	add	x19, x19, x0, lsl 3
	add	x0, x1, x19
	ldr	x0, [x0, 32]
	mov	x1, x0
	cbz	x0, .L2941
	ldr	w0, [x21, 276]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x22, 608]
	add	x0, x0, x19
	str	xzr, [x0, 32]
	ldr	w2, [x21, 160]
.L2941:
	cmp	w2, w20
	bhi	.L2946
.L2943:
	strb	wzr, [x21, 9]
	mov	w0, 2
	str	wzr, [x21, 208]
	str	w0, [x21, 172]
	mov	w0, 0
	str	wzr, [x21, 248]
	str	wzr, [x21, 256]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w1
	add	x19, x20, 2736
	bl	_mcount
	add	x21, x20, 2872
	mov	x0, x20
	bl	HEVC_ClearAllSlice
	.p2align 2
.L2955:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L2951
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L2951:
	ldr	x0, [x19, 136]
	mov	w2, 1
	cbz	x0, .L2952
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L2952:
	ldr	x0, [x19, 272]
	mov	w2, 1
	cbz	x0, .L2953
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L2953:
	ldr	x0, [x19, 408]
	mov	w2, 1
	cbz	x0, .L2954
	ldr	w1, [x0, 32]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
.L2954:
	str	xzr, [x19, 136]
	str	xzr, [x19, 272]
	str	xzr, [x19, 408]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L2955
	ldr	x0, [x20, 29080]
	ldr	w0, [x0, 236]
	add	w0, w0, 1
	cmp	w0, 17
	bls	.L2995
	mov	w0, 17
.L2995:
	add	x3, x20, 2560
	mov	w1, 0
	mov	x2, 200
	stp	w0, wzr, [x3, 152]
	ldr	x0, .LC914
	stp	wzr, wzr, [x3, 160]
	str	wzr, [x20, 2728]
	ldr	x3, [x0, 96]
	add	x0, x20, 3280
	str	wzr, [x20, 2732]
	blr	x3
	str	wzr, [x20, 3284]
	mov	w0, 16
	add	x1, x20, 2400
	str	w0, [x20, 3280]
	add	x0, x20, 2536
	.p2align 2
.L2958:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L2958
	add	x2, x20, 53248
	add	x1, x20, 2672
	str	wzr, [x2, 2912]
	.p2align 2
.L2959:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L2959
	str	wzr, [x2, 2916]
	cbnz	w22, .L2960
	ldr	x0, [x20, 2376]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	beq	.L2960
.L2961:
	ldr	w0, [x20, 180]
	cbz	w0, .L2969
	sub	w1, w0, #1
	add	x0, x20, 2148
	add	x1, x1, 538
	add	x1, x20, x1, lsl 2
	.p2align 2
.L2968:
	str	wzr, [x0], 4
	cmp	x1, x0
	bne	.L2968
.L2969:
	ldr	w2, [x20, 160]
	mov	w21, 0
	add	x22, x20, 69632
	cbz	w2, .L2967
	.p2align 2
.L2984:
	uxtw	x0, w21
	ldr	x1, [x22, 608]
	lsl	x19, x0, 5
	add	w21, w21, 1
	add	x19, x19, x0, lsl 3
	add	x0, x1, x19
	ldr	x0, [x0, 32]
	mov	x1, x0
	cbz	x0, .L2970
	ldr	x3, [x20, 2392]
	cmp	x0, x3
	beq	.L2970
	ldr	w0, [x20, 276]
	bl	HEVC_ReleaseNAL
	ldr	x0, [x22, 608]
	add	x0, x0, x19
	str	xzr, [x0, 32]
	ldr	w2, [x20, 160]
.L2970:
	cmp	w2, w21
	bhi	.L2984
.L2967:
	mov	w0, 0
.L2962:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2960:
	ldr	x0, [x20, 29080]
	mov	w19, 20
	stp	w19, w19, [x20, 176]
	mov	w6, w19
	mov	w5, w19
	ldr	w1, [x0, 148]
	ldp	w3, w4, [x0, 240]
	mov	x0, x20
	lsl	w2, w4, w1
	lsl	w1, w3, w1
	bl	HEVC_ArrangeVahbMem
	ldr	x1, [x20, 2376]
	ldr	w1, [x1, 912]
	cmp	w1, 1
	beq	.L2972
	cmp	w0, 1
	bne	.L2996
	ldr	w0, [x20, 276]
	bl	FSP_GetTotalValidFsNum
	cmp	w0, 20
	mov	w0, w19
	ble	.L2997
	str	w0, [x20, 176]
	b	.L2961
.L2997:
	ldr	w0, [x20, 276]
	bl	FSP_GetTotalValidFsNum
	str	w0, [x20, 176]
	b	.L2961
.L2996:
	ldr	x2, .LC915
	mov	w0, 0
	ldr	x1, .LC917
	add	x2, x2, 80
	bl	dprint_vfmw
	mov	w0, -5
	b	.L2962
.L2972:
	mov	w0, -2
	b	.L2962
	.size	HEVC_InitDPB, .-HEVC_InitDPB
	.align	3
.LC914:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC915:
	.xword	.LANCHOR5
	.align	3
.LC917:
	.xword	.LC916
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAllNal
	.type	HEVC_ClearAllNal, %function
HEVC_ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, 0
	add	x20, x21, 65536
	bl	_mcount
	ldr	w3, [x21, 160]
	cmn	w3, #1
	bne	.L3003
	b	.L3002
	.p2align 3
.L3000:
	add	w0, w3, 1
	cmp	w0, w19
	bls	.L3002
.L3003:
	uxtw	x1, w19
	ldr	x2, [x20, 3896]
	lsl	x0, x1, 3
	add	w19, w19, 1
	sub	x0, x0, x1
	add	x1, x2, x0, lsl 4
	ldr	w0, [x1, 36]
	cmp	w0, 1
	bne	.L3000
	ldr	w0, [x21, 276]
	bl	HEVC_ReleaseNAL
	ldr	w3, [x21, 160]
	add	w0, w3, 1
	cmp	w0, w19
	bhi	.L3003
.L3002:
	strb	wzr, [x21, 5]
	mov	w0, 0
	str	wzr, [x21, 140]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_ClearAllNal, .-HEVC_ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitDecPara
	.type	HEVC_InitDecPara, %function
HEVC_InitDecPara:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 69632
	mov	w20, 0
	bl	_mcount
	add	x19, x22, 616
	ldr	x1, .LC919
	mov	w0, 22
	mov	w25, 20
	mov	w24, 16
	bl	dprint_vfmw
	mov	w1, -2147483647
	mov	x0, x21
	str	w1, [x21, 244]
	bl	HEVC_ClearAllNal
	add	x0, x21, 61440
	add	x0, x0, 2024
	bl	ResetVoQueue
	ldr	x23, .LC920
	.p2align 2
.L3007:
	strb	wzr, [x19]
	add	x0, x19, 88
	strb	wzr, [x19, 1]
	mov	x2, 664
	strb	wzr, [x19, 2]
	mov	w1, 0
	str	wzr, [x19, 4]
	str	wzr, [x19, 12]
	stp	w25, w24, [x19, 24]
	ldr	x3, [x23, 96]
	blr	x3
	str	w20, [x19, 268]
	add	w20, w20, 1
	str	wzr, [x19, 52]
	str	x19, [x19, 80]
	cmp	w20, 20
	add	x19, x19, 760
	bne	.L3007
	add	x0, x21, 2148
	add	x1, x21, 2228
	.p2align 2
.L3008:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L3008
	ldr	w0, [x21, 160]
	mov	w1, 0
	cbz	w0, .L3012
	.p2align 2
.L3014:
	uxtw	x0, w1
	ldr	x2, [x22, 608]
	lsl	x3, x0, 5
	add	w1, w1, 1
	add	x0, x3, x0, lsl 3
	str	wzr, [x2, x0]
	ldr	x2, [x22, 608]
	add	x2, x2, x0
	str	xzr, [x2, 24]
	ldr	x2, [x22, 608]
	add	x0, x2, x0
	str	xzr, [x0, 32]
	ldr	w0, [x21, 160]
	cmp	w0, w1
	bhi	.L3014
.L3012:
	ldr	x3, [x23, 96]
	mov	w1, 0
	mov	x2, 200
	add	x0, x21, 3280
	blr	x3
	mov	w1, 16
	add	x0, x21, 2872
	str	w1, [x21, 3280]
	add	x1, x21, 3008
	.p2align 2
.L3010:
	str	xzr, [x0, -136]
	add	x0, x0, 8
	str	xzr, [x0, -8]
	str	xzr, [x0, 128]
	str	xzr, [x0, 264]
	cmp	x1, x0
	bne	.L3010
	add	x2, x21, 2560
	mov	w0, 17
	add	x19, x21, 2536
	stp	w0, wzr, [x2, 152]
	stp	wzr, wzr, [x2, 160]
	str	wzr, [x21, 2728]
	add	x0, x21, 2672
	str	wzr, [x21, 2732]
	.p2align 2
.L3013:
	str	xzr, [x19, -136]
	add	x19, x19, 8
	str	xzr, [x19, -8]
	cmp	x19, x0
	bne	.L3013
	add	x22, x21, 53248
	ldr	x3, [x23, 96]
	mov	w20, 2
	mov	x2, 3732
	str	w20, [x21, 172]
	mov	w1, 0
	add	x0, x22, 2752
	str	wzr, [x21, 208]
	str	wzr, [x21, 248]
	str	wzr, [x21, 256]
	str	xzr, [x21, 2392]
	blr	x3
	str	w20, [x22, 2812]
	add	x3, x21, 57344
	mov	w2, 1
	mov	w1, 8
	mov	w5, 64
	mov	w0, 6
	str	w2, [x3, 244]
	mov	w3, 20
	stp	w1, w1, [x21, 192]
	str	w1, [x21, 344]
	add	x1, x21, 2048
	strb	w2, [x21, 1]
	strb	w2, [x21, 3]
	mov	w2, 16
	strb	wzr, [x21, 4]
	strb	wzr, [x21, 2]
	strb	wzr, [x21, 8]
	stp	w3, w3, [x21, 176]
	str	w2, [x21, 324]
	mov	w3, 2147483647
	str	w5, [x21, 328]
	mov	w5, 1025
	str	w2, [x21, 348]
	mov	x2, 40
	str	wzr, [x21, 168]
	ldr	x4, [x23, 96]
	stp	w0, w20, [x1, 188]
	stp	w0, w0, [x1, 180]
	str	w3, [x21, 200]
	mov	w1, 32
	mov	w3, 256
	str	w5, [x21, 336]
	str	w1, [x21, 352]
	mov	x0, x19
	str	w3, [x21, 332]
	mov	w1, 0
	mov	w3, 4
	str	w3, [x21, 340]
	blr	x4
	str	x19, [x21, 2344]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	3
.LC919:
	.xword	.LC918
	.align	3
.LC920:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	add	x21, x19, 61440
	bl	_mcount
	ldr	x20, .LC921
	mov	x2, 23416
	mov	w1, 0
	movk	x2, 0x1, lsl 16
	mov	x0, x19
	ldr	x3, [x20, 96]
	ldr	w23, [x21, 2624]
	blr	x3
	str	w23, [x21, 2624]
	str	x22, [x19, 2376]
	str	xzr, [x19, 2384]
	ldr	w0, [x22, 28]
	cmp	w0, 25
	beq	.L3028
	mov	w0, 17
	mov	w3, 65
	mov	w2, 200
	mov	w1, 210
	stp	w2, w0, [x19, 144]
	stp	w0, w3, [x19, 152]
	str	w1, [x19, 160]
.L3022:
	ldr	w0, [x22, 624]
	bl	MEM_Phy2Vir
	mov	x5, x0
	cbz	x0, .L3029
	ldr	x7, [x19, 2376]
	mov	w2, 23196
	ldr	w9, [x19, 148]
	mov	w25, 26164
	ldpsw	x4, x0, [x19, 152]
	ldr	w3, [x7, 620]
	add	x23, x19, 65536
	lsl	w1, w0, 7
	add	x24, x19, 69632
	sub	w1, w1, w0
	add	x8, x5, x3, uxtw
	lsl	w1, w1, 1
	madd	w3, w9, w2, w3
	sub	w1, w1, w0
	str	x8, [x19, 2352]
	madd	w4, w25, w4, w3
	add	x3, x5, x3, uxtw
	str	x3, [x19, 2360]
	add	w1, w4, w1, lsl 3
	mov	w3, 1368
	add	x4, x5, x4, uxtw
	str	x4, [x19, 2368]
	add	x0, x5, x1, uxtw
	str	x0, [x23, 3888]
	ldrsw	x6, [x19, 144]
	madd	w1, w3, w6, w1
	add	x3, x5, x1, uxtw
	str	x3, [x23, 3896]
	ldr	w3, [x19, 160]
	add	w10, w3, 1
	lsl	w4, w3, 5
	add	w3, w4, w3, lsl 3
	lsl	w4, w10, 3
	sub	w4, w4, w10
	add	w1, w1, w4, lsl 4
	add	w3, w3, w1
	add	x1, x5, x1, uxtw
	str	x1, [x24, 608]
	ldr	w4, [x7, 628]
	cmp	w3, w4
	bhi	.L3030
	ldr	w1, [x22, 648]
	cbz	w1, .L3031
.L3026:
	lsl	x2, x6, 2
	ldr	x3, [x20, 96]
	sub	x2, x2, x6
	mov	w1, 0
	lsl	x2, x2, 2
	mov	w22, 1
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 2
	sub	x2, x2, x6
	lsl	x2, x2, 3
	blr	x3
	ldr	w2, [x19, 160]
	mov	w1, 0
	ldr	x4, [x20, 96]
	add	w2, w2, 1
	ldr	x0, [x23, 3896]
	sxtw	x2, w2
	lsl	x3, x2, 3
	sub	x2, x3, x2
	lsl	x2, x2, 4
	blr	x4
	ldrsw	x2, [x19, 160]
	mov	w1, 0
	ldr	x3, [x20, 96]
	lsl	x4, x2, 5
	ldr	x0, [x24, 608]
	add	x2, x4, x2, lsl 3
	blr	x3
	ldp	w5, w2, [x19, 148]
	mov	w1, 23196
	mov	x0, -23196
	ldr	w4, [x19, 156]
	mov	w3, 2024
	smaddl	x0, w5, w1, x0
	mov	x1, -2024
	ldr	x6, [x19, 2352]
	smaddl	x3, w4, w3, x1
	mov	w4, 26164
	mov	x1, -26164
	add	x0, x6, x0
	ldr	x6, [x19, 2368]
	smaddl	x1, w2, w4, x1
	ldr	x4, [x19, 2360]
	add	x2, x6, x3
	str	x0, [x19, 29072]
	str	x2, [x19, 29088]
	add	x1, x4, x1
	str	x1, [x19, 29080]
	str	w5, [x0, 8]
	mov	x0, x19
	ldr	x1, [x19, 29088]
	ldr	w2, [x19, 152]
	str	w2, [x1, 28]
	ldr	x1, [x19, 29080]
	ldr	w2, [x19, 156]
	str	w2, [x1, 60]
	bl	HEVC_InitScalingOrderTable
	add	x1, x19, 86016
	mov	x0, x19
	str	w22, [x1, 2916]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 276]
	beq	.L3032
	mov	w1, -2147483647
	mov	x0, x19
	str	w1, [x19, 244]
	bl	HEVC_InitDecPara
	str	wzr, [x21, 2632]
	mov	w0, 9999
	strb	w22, [x19]
	ldr	w2, [x19, 156]
	ldr	x1, [x19, 2376]
	str	w0, [x19, 284]
	mov	w0, 0
	str	wzr, [x19, 240]
	str	w2, [x19, 320]
	ldr	w1, [x1, 664]
	str	w1, [x19, 212]
.L3024:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3031:
	smull	x2, w9, w2
	ldr	x3, [x20, 96]
	mov	x0, x8
	blr	x3
	ldr	w2, [x19, 152]
	mov	w1, 0
	ldr	x3, [x20, 96]
	ldr	x0, [x19, 2360]
	smull	x2, w2, w25
	blr	x3
	ldr	w4, [x19, 156]
	mov	w2, 2024
	ldr	x0, [x19, 2368]
	mov	w1, 0
	ldr	x3, [x20, 96]
	smull	x2, w4, w2
	blr	x3
	ldrsw	x6, [x19, 144]
	ldr	x0, [x23, 3888]
	b	.L3026
	.p2align 3
.L3028:
	ldr	w0, [x22, 720]
	str	w0, [x19, 148]
	ldr	w0, [x22, 724]
	str	w0, [x19, 152]
	ldr	w0, [x22, 728]
	str	w0, [x19, 156]
	ldr	w0, [x22, 716]
	str	w0, [x19, 144]
	add	w0, w0, 5
	str	w0, [x19, 160]
	b	.L3022
	.p2align 3
.L3030:
	ldr	x2, .LC922
	mov	w0, 0
	ldr	x1, .LC926
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3024
	.p2align 3
.L3032:
	ldr	x2, .LC922
	mov	w0, 0
	ldr	x1, .LC928
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3024
.L3029:
	ldr	x2, .LC922
	mov	w0, 0
	ldr	x1, .LC924
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3024
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	3
.LC921:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC922:
	.xword	.LANCHOR5
	.align	3
.LC924:
	.xword	.LC923
	.align	3
.LC926:
	.xword	.LC925
	.align	3
.LC928:
	.xword	.LC927
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearCurrPic
	.type	HEVC_ClearCurrPic, %function
HEVC_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 53248
	bl	_mcount
	mov	x0, x20
	bl	HEVC_ClearAllSlice
	ldr	x0, [x19, 2080]
	cbz	x0, .L3034
	ldr	w1, [x0, 32]
	mov	w2, 1
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 2080]
	str	wzr, [x0, 4]
	str	xzr, [x19, 2080]
.L3034:
	strb	wzr, [x19, 2017]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearCurrPic, .-HEVC_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearAll
	.type	HEVC_ClearAll, %function
HEVC_ClearAll:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_InitDPB
	cbnz	w20, .L3041
	add	x0, x19, 61440
	add	x0, x0, 2024
	bl	ResetVoQueue
	ldr	w0, [x19, 276]
	bl	FSP_EmptyInstance
	mov	x0, x19
	bl	HEVC_InitDecPara
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3041:
	add	x1, x19, 61440
	ldr	w0, [x19, 276]
	add	x1, x1, 2024
	bl	FSP_ClearNotInVoQueue
	mov	x0, x19
	bl	HEVC_InitDecPara
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 53248
	bl	_mcount
	ldr	w1, [x20, 2828]
	tbnz	w1, #31, .L3045
	ldr	w0, [x19, 156]
	cmp	w1, w0
	bge	.L3045
	ldr	x4, [x19, 2368]
	mov	w28, 2024
	mov	w2, 26164
	ldr	x0, [x19, 29080]
	ldr	x25, [x19, 2360]
	smaddl	x28, w1, w28, x4
	ldr	w3, [x19, 288]
	mov	w1, 23196
	ldr	x5, [x19, 2352]
	ldr	w21, [x28, 32]
	ldr	x4, [x19, 29072]
	ldr	w22, [x19, 292]
	smull	x21, w21, w2
	ldr	w2, [x19, 300]
	add	x26, x25, x21
	ldr	w4, [x4, 8]
	stp	w3, w2, [x29, 104]
	ldr	w2, [x0, 100]
	str	w2, [x29, 100]
	ldr	w2, [x0, 108]
	str	w2, [x29, 96]
	ldr	w2, [x26, 52]
	ldr	w23, [x19, 296]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w2, [x1, 8]
	cmp	w4, w2
	bne	.L3046
	ldrb	w2, [x1, 2]
	cbz	w2, .L3104
.L3046:
	ldr	x0, .LC929
	mov	w24, 23196
	strb	wzr, [x1, 2]
	mov	x27, -23196
	ldr	x7, [x0, 104]
	ldr	w0, [x19, 148]
	ldr	x2, [x19, 2352]
	smaddl	x0, w0, w24, x27
	add	x0, x2, x0
	mov	x2, 23196
	blr	x7
	ldr	w0, [x19, 148]
	ldr	x1, [x19, 2352]
	smaddl	x0, w0, w24, x27
	add	x0, x1, x0
	str	x0, [x19, 29072]
	ldr	x0, [x19, 29080]
.L3047:
	ldr	w2, [x0, 60]
	ldr	w1, [x26, 60]
	cmp	w2, w1
	beq	.L3105
.L3048:
	ldr	x0, .LC929
	mov	x27, -26164
	strb	wzr, [x25, x21]
	mov	w25, 26164
	ldr	x5, [x0, 104]
	ldr	x0, [x19, 29080]
	ldr	w1, [x26, 236]
	ldr	w2, [x0, 236]
	ldr	w0, [x19, 152]
	cmp	w2, w1
	ldr	x1, [x19, 2360]
	mov	x2, 26164
	cset	w21, ne
	smaddl	x0, w0, w25, x27
	add	x0, x1, x0
	mov	x1, x26
	blr	x5
	ldr	w0, [x19, 152]
	ldr	x1, [x19, 2360]
	smaddl	x0, w0, w25, x27
	add	x0, x1, x0
	str	x0, [x19, 29080]
	ldr	w1, [x0, 60]
	str	w1, [x19, 288]
	ldr	w1, [x0, 72]
	str	w1, [x19, 292]
	ldr	w1, [x0, 76]
	str	w1, [x19, 296]
	ldr	w1, [x0, 148]
	str	w1, [x19, 300]
.L3049:
	ldr	w1, [x0, 108]
	ldr	w0, [x0, 100]
	cmp	w0, w1
	csel	w0, w0, w1, cs
	ldr	x1, [x19, 2376]
	str	w0, [x1, 924]
	ldr	x0, [x19, 29088]
	ldr	w1, [x0, 28]
	ldr	w0, [x28, 28]
	cmp	w1, w0
	beq	.L3106
.L3050:
	ldrb	w0, [x28, 13]
	strb	wzr, [x28, 1]
	cbz	w0, .L3052
	ldrb	w0, [x28, 15]
	cbnz	w0, .L3107
	ldr	w0, [x28, 68]
	ldr	w1, [x26, 240]
	sub	w2, w0, #1
	add	x3, x28, x0, sxtw 1
	cmp	w2, wzr
	strh	w1, [x3, 174]
	ble	.L3064
	sub	w4, w0, #2
	add	x0, x28, 92
	add	x4, x4, 47
	add	x4, x28, x4, lsl 1
	.p2align 2
.L3063:
	ldrsh	w2, [x0]
	add	x0, x0, 2
	strh	w2, [x0, 82]
	cmp	x0, x4
	ldrh	w1, [x3, 174]
	sub	w1, w1, w2
	strh	w1, [x3, 174]
	bne	.L3063
.L3064:
	ldr	w0, [x28, 72]
	ldr	w1, [x26, 244]
	sub	w2, w0, #1
	add	x3, x28, x0, sxtw 1
	cmp	w2, wzr
	strh	w1, [x3, 214]
	ble	.L3059
	sub	w4, w0, #2
	add	x0, x28, 132
	add	x4, x4, 67
	add	x4, x28, x4, lsl 1
	.p2align 2
.L3065:
	ldrsh	w2, [x0]
	add	x0, x0, 2
	strh	w2, [x0, 82]
	cmp	x4, x0
	ldrh	w1, [x3, 214]
	sub	w1, w1, w2
	strh	w1, [x3, 214]
	bne	.L3065
	b	.L3059
	.p2align 3
.L3045:
	mov	w0, 0
.L3044:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3052:
	ldr	w0, [x26, 240]
	strh	w0, [x28, 176]
	ldr	w0, [x26, 244]
	strh	w0, [x28, 216]
.L3059:
	ldr	x2, .LC929
	mov	x1, x28
	ldr	w0, [x19, 156]
	mov	w27, 2024
	mov	x28, -2024
	ldr	x4, [x2, 104]
	smaddl	x0, w0, w27, x28
	ldr	x2, [x19, 2368]
	add	x0, x2, x0
	mov	x2, 2024
	blr	x4
	ldr	w0, [x19, 156]
	ldr	x1, [x19, 2368]
	smaddl	x0, w0, w27, x28
	add	x0, x1, x0
	str	x0, [x19, 29088]
.L3051:
	ldr	w2, [x19, 220]
	cbnz	w2, .L3066
	ldr	w0, [x26, 60]
	ldr	w1, [x29, 104]
	cmp	w0, w1
	ccmp	w21, wzr, 0, eq
	bne	.L3067
	ldr	w0, [x19, 168]
	cbz	w0, .L3067
	ldr	w0, [x26, 72]
	cmp	w22, w0
	bne	.L3067
	ldr	w0, [x26, 76]
	cmp	w23, w0
	bne	.L3067
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 912]
	cmp	w1, 1
	bne	.L3069
	b	.L3068
	.p2align 3
.L3067:
	ldr	w3, [x29, 108]
	mov	w4, w21
	mov	w2, w23
	mov	w1, w22
	mov	x0, x19
	bl	HEVC_GetReRangeFlag
	cbz	w0, .L3070
	ldr	x0, [x19, 2376]
.L3068:
	ldr	w0, [x0, 928]
	cmp	w0, 1
	beq	.L3108
.L3072:
	add	x0, x19, 86016
	ldr	w0, [x0, 2916]
	cmp	w0, 1
	beq	.L3109
.L3073:
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_InitDPB
	cmn	w0, #2
	beq	.L3044
	cbnz	w0, .L3074
	ldr	x0, [x19, 2376]
.L3071:
	str	wzr, [x0, 928]
.L3069:
	mov	x0, x19
	bl	HEVC_AllocFrameStore
	mov	w21, w0
	cbnz	w0, .L3075
	ldr	w2, [x19, 220]
.L3066:
	ldr	w0, [x20, 2800]
	ldr	w1, [x20, 2824]
	str	w1, [x20, 2020]
	mov	w1, 1
	str	w0, [x20, 2024]
	mov	w0, -1
	strb	w1, [x20, 2017]
	str	w0, [x20, 2048]
	ldr	x1, [x19, 29080]
	ldr	w0, [x1, 72]
	str	w0, [x20, 2032]
	ldr	w0, [x1, 76]
	str	w0, [x20, 2036]
	ldp	w3, w0, [x1, 240]
	str	wzr, [x20, 2044]
	mul	w0, w0, w3
	str	w0, [x20, 2040]
	cbnz	w2, .L3076
	ldr	x0, [x19, 2376]
	mov	x1, -1
	ldr	x2, [x0, 56]
	str	x2, [x20, 2728]
	ldr	x2, [x0, 72]
	str	x2, [x20, 2736]
	ldr	x2, [x0, 88]
	str	x2, [x20, 2744]
	ldr	w2, [x0, 104]
	str	w2, [x20, 2096]
	ldr	w2, [x0, 108]
	str	w2, [x20, 2100]
	ldr	w2, [x0, 112]
	str	w2, [x20, 2104]
	ldr	w2, [x0, 128]
	str	w2, [x20, 2108]
	str	x1, [x0, 56]
	ldr	x1, [x19, 29080]
.L3076:
	ldr	w0, [x1, 72]
	str	w0, [x20, 2216]
	add	x0, x20, 2088
	ldrb	w2, [x20, 2212]
	ldr	w3, [x1, 76]
	str	w3, [x20, 2220]
	ldr	w4, [x1, 64]
	ldr	w3, [x1, 2660]
	cmp	w4, 1
	bfi	w2, w3, 5, 3
	cset	w3, ne
	bfi	w2, w3, 2, 3
	strb	w2, [x20, 2212]
	ldr	w1, [x1, 2644]
	and	w1, w1, 7
	bl	SetAspectRatio
	str	wzr, [x20, 2200]
	ldr	w0, [x19, 220]
	cmp	w0, 1
	beq	.L3045
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2800]
	str	w1, [x0, 12]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2212]
	str	w1, [x0, 212]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2200]
	str	w1, [x0, 200]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2092]
	str	w1, [x0, 92]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2088]
	str	w1, [x0, 88]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2216]
	str	w1, [x0, 216]
	ldr	x0, [x20, 2080]
	ldr	w1, [x20, 2220]
	str	w1, [x0, 220]
	ldr	x1, [x20, 2080]
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_GetDispPhyFs
	cbz	x0, .L3077
	ldr	w3, [x20, 2200]
	mov	w1, 0
	ldr	w2, [x0, 8]
	cmp	w3, wzr
	ldr	w0, [x19, 276]
	cset	w3, ne
	bl	FSP_SetStoreType
.L3077:
	ldr	x1, [x19, 29080]
	mov	w0, 0
	ldr	x5, [x20, 2080]
	ldr	w2, [x1, 84]
	str	w2, [x20, 2428]
	ldr	w4, [x1, 88]
	str	w4, [x20, 2432]
	ldr	w7, [x1, 92]
	str	w7, [x20, 2436]
	ldr	w6, [x1, 96]
	str	w6, [x20, 2440]
	ldr	w3, [x1, 72]
	sub	w2, w3, w2
	sub	w2, w2, w4
	str	w2, [x20, 2224]
	ldr	w4, [x1, 76]
	sub	w3, w4, w7
	sub	w3, w3, w6
	str	w3, [x20, 2228]
	ldr	w3, [x1, 64]
	str	w3, [x20, 2284]
	ldr	w3, [x1, 100]
	str	w3, [x20, 2288]
	ldr	w1, [x1, 108]
	str	w1, [x20, 2292]
	ldr	w1, [x5, 232]
	str	w1, [x20, 2232]
	ldr	w1, [x5, 236]
	str	w1, [x20, 2236]
	str	w2, [x5, 224]
	ldr	x1, [x20, 2080]
	ldr	w2, [x20, 2228]
	str	w2, [x1, 228]
	ldr	x1, [x20, 2080]
	ldr	w2, [x20, 2232]
	str	w2, [x1, 232]
	ldr	x1, [x20, 2080]
	ldr	w2, [x20, 2236]
	str	w2, [x1, 236]
	ldr	x1, [x20, 2080]
	ldr	w2, [x20, 2288]
	str	w2, [x1, 288]
	ldr	x1, [x20, 2080]
	ldr	w2, [x20, 2292]
	str	w2, [x1, 292]
	str	wzr, [x20, 2028]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3107:
	ldr	w3, [x28, 68]
	add	x4, x28, 176
	mov	w2, 0
	cmp	w3, wzr
	ble	.L3058
	.p2align 2
.L3093:
	add	w2, w2, 1
	ldr	w0, [x26, 240]
	sub	w1, w2, #1
	cmp	w2, w3
	mul	w1, w1, w0
	mul	w0, w2, w0
	udiv	w1, w1, w3
	udiv	w0, w0, w3
	sub	w0, w0, w1
	strh	w0, [x4], 2
	bne	.L3093
.L3058:
	ldr	w3, [x28, 72]
	add	x4, x28, 216
	mov	w2, 0
	cmp	w3, wzr
	ble	.L3059
	.p2align 2
.L3092:
	add	w2, w2, 1
	ldr	w0, [x26, 244]
	sub	w1, w2, #1
	cmp	w2, w3
	mul	w1, w1, w0
	mul	w0, w2, w0
	udiv	w1, w1, w3
	udiv	w0, w0, w3
	sub	w0, w0, w1
	strh	w0, [x4], 2
	bne	.L3092
	b	.L3059
	.p2align 3
.L3070:
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 912]
	cmp	w1, 1
	bne	.L3071
	b	.L3068
	.p2align 3
.L3104:
	ldr	w2, [x19, 168]
	cbnz	w2, .L3047
	b	.L3046
	.p2align 3
.L3106:
	ldrb	w0, [x28, 1]
	cbnz	w0, .L3050
	ldr	w0, [x19, 168]
	cbz	w0, .L3050
	ldr	w0, [x26, 72]
	cmp	w22, w0
	bne	.L3050
	ldr	w0, [x26, 76]
	cmp	w23, w0
	bne	.L3050
	ldr	w0, [x26, 148]
	ldr	w1, [x29, 108]
	cmp	w1, w0
	bne	.L3050
	b	.L3051
	.p2align 3
.L3105:
	ldrb	w1, [x25, x21]
	cbnz	w1, .L3048
	ldr	w1, [x19, 168]
	cbz	w1, .L3048
	ldr	w1, [x26, 72]
	cmp	w22, w1
	bne	.L3048
	ldr	w1, [x26, 76]
	cmp	w23, w1
	bne	.L3048
	ldr	w1, [x26, 148]
	ldr	w2, [x29, 108]
	cmp	w2, w1
	bne	.L3048
	mov	w21, 0
	b	.L3049
	.p2align 3
.L3075:
	ldr	x1, .LC935
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	b	.L3044
	.p2align 3
.L3109:
	mov	x0, x19
	bl	HEVC_GetBackPicFromVOQueue
	b	.L3073
	.p2align 3
.L3108:
	ldr	x1, .LC931
	mov	w0, 31
	ldr	w3, [x26, 100]
	ldr	w5, [x26, 108]
	ldp	w4, w2, [x29, 96]
	bl	dprint_vfmw
	b	.L3072
.L3074:
	ldr	x1, .LC933
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3044
	.size	HEVC_InitPic, .-HEVC_InitPic
	.align	3
.LC929:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC931:
	.xword	.LC930
	.align	3
.LC933:
	.xword	.LC932
	.align	3
.LC935:
	.xword	.LC934
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputFrmToVO
	.type	HEVC_OutputFrmToVO, %function
HEVC_OutputFrmToVO:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	mov	w3, w0
	cbz	w0, .L3119
	cmn	w0, #3
	mov	w0, 0
	bne	.L3120
.L3113:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3119:
	ldr	w0, [x19, 276]
	mov	w2, 1
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 276]
	ldr	w1, [x20, 32]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L3121
	mov	x4, x0
	add	x3, x19, 61440
	ldr	w0, [x19, 276]
	add	x3, x3, 2024
	mov	x2, x19
	mov	w1, 16
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L3122
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3123
	str	wzr, [x21, 24]
.L3116:
	ldr	w1, [x19, 308]
	mov	w0, 0
	ldr	w2, [x19, 316]
	add	w1, w1, 1
	str	w1, [x19, 308]
	add	w2, w2, 1
	str	w2, [x19, 316]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3123:
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L3116
	.p2align 3
.L3120:
	ldr	x1, .LC942
	mov	w2, 9699
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x20, 268]
	mov	x0, x19
	bl	HEVC_DECRecycleImage
	mov	w0, -1
	b	.L3113
	.p2align 3
.L3122:
	ldr	x1, .LC940
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 276]
	mov	w2, 0
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, -1
	b	.L3113
.L3121:
	ldr	x2, .LC936
	mov	w0, 0
	ldr	x1, .LC938
	add	x2, x2, 112
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3113
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	3
.LC936:
	.xword	.LANCHOR5
	.align	3
.LC938:
	.xword	.LC937
	.align	3
.LC940:
	.xword	.LC939
	.align	3
.LC942:
	.xword	.LC941
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DirectOutput
	.type	HEVC_DirectOutput, %function
HEVC_DirectOutput:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 53248
	bl	_mcount
	mov	w4, 2
	mov	w3, 1
	ldr	x19, [x20, 2080]
	add	x1, x20, 2088
	mov	x2, 664
	add	x0, x19, 88
	str	w4, [x19, 4]
	strb	wzr, [x19, 1]
	strb	w3, [x19, 2]
	ldr	w3, [x20, 2028]
	str	w3, [x19, 16]
	ldr	w3, [x20, 2056]
	str	w3, [x19, 20]
	bl	memcpy
	str	wzr, [x19, 52]
	ldr	w1, [x19, 32]
	mov	w2, 0
	ldr	w0, [x20, 2056]
	str	w0, [x19, 44]
	ldr	w0, [x21, 276]
	bl	FSP_SetRef
	mov	x1, x19
	mov	x0, x21
	bl	HEVC_OutputFrmToVO
	str	wzr, [x19, 4]
	ldr	x3, .LC943
	mov	w21, w0
	mov	x2, 736
	mov	w1, 0
	add	x0, x20, 2016
	ldr	x3, [x3, 96]
	blr	x3
	mov	w0, w21
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_DirectOutput, .-HEVC_DirectOutput
	.align	3
.LC943:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_IModeProcess
	.type	HEVC_IModeProcess, %function
HEVC_IModeProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_DirectOutput
	add	x2, x19, 53248
	ldr	w3, [x19, 180]
	ldr	w1, [x2, 2052]
	cmp	w1, w3
	beq	.L3126
	add	x19, x19, x1, uxtw 2
	str	wzr, [x19, 2148]
	str	w3, [x2, 2052]
.L3126:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_IModeProcess, .-HEVC_IModeProcess
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w4, [x19, 2716]
	cbz	w4, .L3128
	sub	w3, w4, #1
	add	x0, x19, 2736
	add	x3, x3, 343
	mov	w28, 0
	add	x3, x19, x3, lsl 3
	.p2align 2
.L3130:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cbnz	w2, .L3129
	ldr	w2, [x1, 12]
	ldr	w1, [x19, 244]
	cmp	w2, w1
	csinc	w28, w28, w28, le
.L3129:
	cmp	x3, x0
	bne	.L3130
	ldr	w0, [x19, 228]
	cmp	w0, 1
	beq	.L3141
.L3131:
	add	x23, x19, 53248
	ldr	x1, [x19, 29080]
	ldr	w0, [x23, 2820]
	add	x0, x1, x0, lsl 2
	ldr	w22, [x0, 412]
.L3133:
	cbz	w4, .L3142
	ldr	x25, .LC946
	mov	w20, 0
	ldr	x24, .LC945
	mov	w27, 0
	ldr	x26, .LC948
	add	x23, x19, 53248
	add	x25, x25, 136
	.p2align 2
.L3140:
	add	x21, x19, x20, uxtw 3
	ldrb	w9, [x19, 2]
	ldr	w5, [x19, 244]
	mov	x1, x24
	ldr	w8, [x23, 2800]
	mov	w7, w22
	ldr	x3, [x21, 2736]
	mov	w6, w28
	mov	w2, w20
	mov	w0, 22
	ldr	w4, [x3, 12]
	ldrb	w3, [x3, 2]
	str	w8, [sp]
	str	w9, [sp, 8]
	bl	dprint_vfmw
	ldr	x0, [x21, 2736]
	ldrb	w1, [x0, 2]
	cbnz	w1, .L3135
	ldr	w2, [x0, 12]
	cmp	w22, w28
	ldr	w3, [x19, 244]
	ccmp	w2, w3, 4, cc
	ble	.L3136
	ldr	w4, [x23, 2800]
	cmp	w2, w4
	blt	.L3137
	ldrb	w2, [x19, 2]
	cbnz	w2, .L3137
	.p2align 2
.L3136:
	cbnz	w3, .L3138
	ldr	w4, [x0, 12]
	tbz	w4, #31, .L3138
	cbz	w1, .L3154
.L3139:
	mov	x2, x25
	mov	x1, x26
	mov	w0, 31
	bl	dprint_vfmw
.L3138:
	ldr	w0, [x19, 2716]
	add	w20, w20, 1
	cmp	w0, w20
	bhi	.L3140
.L3153:
	add	sp, x29, 0
	mov	w0, w27
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3137:
	mov	w1, 1
	strb	w1, [x0, 2]
	mov	x0, x19
	sub	w28, w28, #1
	ldr	x1, [x21, 2736]
	bl	HEVC_OutputFrmToVO
	mov	w27, w0
	ldr	x0, [x21, 2736]
	ldr	w0, [x0, 12]
	str	w0, [x19, 244]
	b	.L3138
	.p2align 3
.L3135:
	ldr	w3, [x19, 244]
	b	.L3136
	.p2align 3
.L3154:
	ldr	w1, [x0, 32]
	mov	w2, 0
	ldr	w0, [x19, 276]
	bl	FSP_SetDisplay
	ldr	x0, [x21, 2736]
	ldr	w3, [x19, 244]
	ldr	w4, [x0, 12]
	b	.L3139
.L3128:
	ldr	w0, [x19, 228]
	mov	w28, 0
	cmp	w0, 1
	bne	.L3131
	.p2align 2
.L3141:
	ldr	x2, [x19, 29080]
	mov	w22, 0
	add	x0, x2, 412
	add	x2, x2, 444
	.p2align 2
.L3132:
	ldr	w1, [x0], 4
	cmp	w22, w1
	csel	w22, w22, w1, cs
	cmp	x0, x2
	bne	.L3132
	b	.L3133
.L3142:
	mov	w27, 0
	b	.L3153
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
	.align	3
.LC945:
	.xword	.LC944
	.align	3
.LC946:
	.xword	.LANCHOR5
	.align	3
.LC948:
	.xword	.LC947
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputOneFrmFromDPB
	.type	HEVC_OutputOneFrmFromDPB, %function
HEVC_OutputOneFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w1
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, x21, uxtw 3
	bl	_mcount
	mov	w2, 1
	mov	x0, x19
	ldr	x1, [x20, 2736]
	strb	w2, [x1, 2]
	ldr	x1, [x20, 2736]
	bl	HEVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x20, 2736]
	ldr	w1, [x0, 12]
	str	w1, [x19, 244]
	ldrb	w0, [x0, 1]
	cbnz	w0, .L3156
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	mov	w1, w21
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
.L3156:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_OutputOneFrmFromDPB, .-HEVC_OutputOneFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_OutputUnRefPicWithMinPoc
	.type	HEVC_OutputUnRefPicWithMinPoc, %function
HEVC_OutputUnRefPicWithMinPoc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x29, 44
	mov	x0, x19
	bl	HEVC_GetUnRefPicWithMinPoc
	cbnz	w0, .L3162
	ldr	w1, [x29, 44]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	mov	w1, 0
	cbnz	w0, .L3163
.L3159:
	ldr	x19, [sp, 16]
	mov	w0, w1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3162:
	ldr	x2, .LC950
	mov	w0, 1
	ldr	x1, .LC952
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w1, -1
	b	.L3159
	.p2align 3
.L3163:
	ldr	x2, .LC950
	mov	w0, 1
	ldr	x1, .LC954
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w1, -1
	b	.L3159
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
	.align	3
.LC950:
	.xword	.LANCHOR5
	.align	3
.LC952:
	.xword	.LC951
	.align	3
.LC954:
	.xword	.LC953
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3173
	ldr	w0, [x19, 2716]
	mov	w20, 0
	mov	w22, 1
	cbnz	w0, .L3176
	b	.L3172
	.p2align 3
.L3180:
	strb	w22, [x1, 2]
	ldr	x1, [x21, 2736]
	bl	HEVC_OutputFrmToVO
	cmn	w0, #1
	mov	w21, w0
	beq	.L3179
.L3169:
	ldr	w0, [x19, 2716]
	cmp	w0, w20
	bls	.L3172
.L3176:
	add	x21, x19, x20, uxtw 3
	ldr	w0, [x19, 276]
	mov	w2, 0
	add	w20, w20, 1
	ldr	x1, [x21, 2736]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
	ldr	x1, [x21, 2736]
	mov	x0, x19
	ldrb	w2, [x1, 2]
	cbz	w2, .L3180
	ldr	w1, [x1, 32]
	ldr	w0, [x19, 276]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L3169
	ldr	x1, [x21, 2736]
	ldr	w0, [x19, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 2716]
	cmp	w0, w20
	bhi	.L3176
.L3172:
	mov	w1, -2147483647
	mov	x0, x19
	str	w1, [x19, 244]
	mov	w21, 0
	bl	Hevc_InitDecBuffers
.L3165:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3179:
	ldr	x2, .LC955
	mov	w0, 0
	ldr	x1, .LC957
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3173:
	mov	w21, -1
	b	.L3165
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	3
.LC955:
	.xword	.LANCHOR5
	.align	3
.LC957:
	.xword	.LC956
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ReceivePacket
	.type	HEVC_ReceivePacket, %function
HEVC_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 86016
	mov	x20, x1
	bl	_mcount
	str	wzr, [x21, 2888]
	ldr	x0, [x19, 2392]
	cbz	x0, .L3211
	ldrb	w1, [x20]
	str	w1, [x0, 40]
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L3212
.L3188:
	ldrb	w0, [x20]
	cmp	w0, 1
	bne	.L3189
	ldr	x1, [x19, 2392]
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bls	.L3190
	ldr	w2, [x1, 40]
	cmp	w2, 1
	beq	.L3189
.L3190:
	ldr	w2, [x20, 20]
	cmp	w2, wzr
	ble	.L3191
	ldr	x2, [x20, 8]
	cbz	x2, .L3191
	ldr	w3, [x20, 16]
	cbnz	w3, .L3213
.L3191:
	mov	w0, 1
	str	w0, [x1, 40]
	ldr	w0, [x19, 276]
	ldr	w1, [x20, 24]
	bl	SM_ReleaseStreamSeg
.L3187:
	ldr	x0, [x19, 2392]
	ldr	w0, [x0, 40]
	cmp	w0, wzr
	csetm	w0, eq
.L3185:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3213:
	ubfiz	x0, x0, 5, 32
	add	x0, x1, x0
	str	x2, [x0, 48]
	ldr	x1, [x19, 2392]
	ldr	w2, [x20, 20]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 56]
	ldr	x1, [x19, 2392]
	ldr	w2, [x20, 16]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 60]
	ldr	x1, [x19, 2392]
	ldr	w2, [x20, 24]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 76]
	ldr	x1, [x19, 2392]
	ldr	w0, [x1, 8]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 68]
	ldr	x1, [x19, 2392]
	ldr	w0, [x1, 8]
	add	w0, w0, 1
	str	w0, [x1, 8]
	ldr	x0, [x19, 2376]
	ldrb	w0, [x0, 940]
	cmp	w0, 1
	beq	.L3192
	add	x0, x19, 53248
	ldr	w2, [x20, 20]
	ldr	w1, [x0, 2068]
	ldr	w3, [x0, 2072]
	add	w2, w1, w2
	str	w2, [x0, 2068]
	ldr	w1, [x20, 20]
	add	w1, w3, w1
	str	w1, [x0, 2072]
.L3192:
	mov	x0, x19
	bl	HEVC_CombinePacket
	mov	w0, 1
	str	w0, [x21, 2888]
	b	.L3187
	.p2align 3
.L3212:
	ldr	w0, [x0, 912]
	cbnz	w0, .L3187
	b	.L3188
	.p2align 3
.L3211:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L3183
	ldr	x0, [x20, 8]
	cbz	x0, .L3183
	ldr	w0, [x20, 16]
	cbz	w0, .L3183
	mov	x0, x19
	bl	HEVC_FindNaluArraySlot
	cmn	w0, #1
	mov	w21, w0
	beq	.L3214
	add	x1, x19, 65536
	sxtw	x0, w0
	lsl	x21, x0, 3
	mov	w2, 1
	sub	x0, x21, x0
	ldr	x21, [x1, 3896]
	add	x0, x21, x0, lsl 4
	str	x0, [x19, 2392]
	ldr	x1, [x20, 8]
	str	x1, [x0, 48]
	ldr	x0, [x19, 2392]
	ldr	w1, [x20, 20]
	str	w1, [x0, 56]
	ldr	x0, [x19, 2392]
	ldr	w1, [x20, 24]
	str	w1, [x0, 76]
	ldr	x0, [x19, 2392]
	ldr	w1, [x20, 16]
	str	w1, [x0, 60]
	ldr	x0, [x19, 2392]
	str	wzr, [x0, 68]
	ldr	x0, [x19, 2392]
	str	w2, [x0, 8]
	ldr	x0, [x19, 2392]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 2392]
	ldrb	w1, [x20]
	str	w1, [x0, 40]
	ldr	x0, [x19, 2376]
	ldrb	w0, [x0, 940]
	cmp	w0, w2
	beq	.L3186
	add	x0, x19, 53248
	ldr	w2, [x20, 20]
	ldr	w1, [x0, 2068]
	ldr	w3, [x0, 2072]
	add	w2, w1, w2
	str	w2, [x0, 2068]
	ldr	w1, [x20, 20]
	add	w1, w3, w1
	str	w1, [x0, 2072]
.L3186:
	ldr	w0, [x20, 28]
	str	w0, [x19, 216]
	b	.L3187
	.p2align 3
.L3189:
	ldr	x1, .LC963
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3185
	.p2align 3
.L3183:
	ldr	x1, .LC961
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3185
.L3214:
	ldr	x1, .LC959
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_ClearAll
	mov	w0, w21
	b	.L3185
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
	.align	3
.LC959:
	.xword	.LC958
	.align	3
.LC961:
	.xword	.LC960
	.align	3
.LC963:
	.xword	.LC962
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 176]
	cbz	w0, .L3218
	add	x0, x19, 53248
	ldrb	w0, [x0, 2017]
	cmp	w0, 1
	beq	.L3218
	add	x1, x19, 69632
	add	x4, x19, 81920
	add	x1, x1, 616
	add	x4, x4, 3528
	.p2align 2
.L3224:
	ldr	w0, [x1, 4]
	cbnz	w0, .L3219
	cbz	x1, .L3220
	ldr	w3, [x19, 2716]
	cbz	w3, .L3220
	ldr	x0, [x19, 2736]
	cmp	x0, x1
	beq	.L3219
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L3221
	.p2align 3
.L3222:
	ldr	x2, [x0, 2736]
	cmp	x2, x1
	beq	.L3219
.L3221:
	cmp	x3, x0
	add	x0, x0, 8
	bne	.L3222
.L3220:
	ldr	w0, [x19, 276]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L3218
	cmn	w0, #1
	beq	.L3243
.L3242:
	mov	w0, 0
.L3244:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3218:
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3219:
	add	x1, x1, 760
	cmp	x1, x4
	bne	.L3224
	add	x0, x19, 61440
	add	x2, x29, 44
	add	x1, x29, 40
	add	x0, x0, 2024
	bl	GetQueueImgNum
	mov	x0, x19
	bl	HEVC_PrintFrameStoreState
	ldr	x1, .LC965
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_PrintDPBState
	ldr	w0, [x19, 176]
	ldr	w2, [x19, 2716]
	ldp	w3, w4, [x29, 40]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w4
	cmp	w1, w0
	bge	.L3242
	ldr	x2, .LC966
	mov	w0, 0
	ldr	x1, .LC968
	add	x2, x2, 224
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
.L3243:
	add	x1, x19, 61440
	ldr	w0, [x19, 276]
	add	x1, x1, 2024
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L3244
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
	.align	3
.LC965:
	.xword	.LC964
	.align	3
.LC966:
	.xword	.LANCHOR5
	.align	3
.LC968:
	.xword	.LC967
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_FlushDPB
	.type	HEVC_FlushDPB, %function
HEVC_FlushDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	w2, [x19, 2716]
	cbnz	w2, .L3257
	b	.L3247
	.p2align 3
.L3248:
	cmp	w2, w20
	bls	.L3247
.L3257:
	add	x0, x19, x20, uxtw 3
	add	w20, w20, 1
	ldr	x0, [x0, 2736]
	ldrb	w1, [x0, 1]
	cbz	w1, .L3248
	strb	wzr, [x0, 1]
	mov	w2, 0
	ldr	w1, [x0, 32]
	ldr	w0, [x19, 276]
	bl	FSP_SetRef
	ldr	w2, [x19, 2716]
	cmp	w2, w20
	bhi	.L3257
	.p2align 2
.L3247:
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbz	w0, .L3251
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cbnz	w0, .L3247
	b	.L3251
	.p2align 3
.L3253:
	bl	HEVC_GetMinPOC
	ldr	w1, [x29, 40]
	mov	x0, x19
	bl	HEVC_OutputOneFrmFromDPB
	cmn	w0, #1
	beq	.L3252
.L3251:
	ldr	w3, [x19, 2716]
	add	x2, x29, 40
	add	x1, x29, 44
	mov	x0, x19
	cbnz	w3, .L3253
	mov	w0, 0
.L3252:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_ClearDPB
	.type	HEVC_ClearDPB, %function
HEVC_ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_FlushDPB
	cbz	w0, .L3263
	ldr	x2, .LC969
	mov	w3, w0
	ldr	x1, .LC971
	mov	w0, 0
	add	x2, x2, 248
	bl	dprint_vfmw
.L3263:
	mov	w1, 0
	mov	x0, x19
	bl	HEVC_InitDPB
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	3
.LC969:
	.xword	.LANCHOR5
	.align	3
.LC971:
	.xword	.LC970
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RecoverDPBProcess
	.type	HEVC_RecoverDPBProcess, %function
HEVC_RecoverDPBProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC972
	ldr	x22, .LC974
	add	x21, x20, 264
	b	.L3268
	.p2align 3
.L3270:
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_IncreaseDPBSize
	cbnz	w0, .L3278
.L3268:
	ldr	w5, [x19, 2712]
	mov	x2, x21
	ldr	w6, [x19, 2716]
	mov	x1, x22
	mov	w0, 13
	mov	w4, w5
	cmp	w6, w5
	mov	w3, w6
	bcs	.L3270
.L3267:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3278:
	ldr	x1, .LC976
	mov	x2, x21
	mov	w0, 1
	add	x20, x20, 264
	bl	dprint_vfmw
	ldr	x21, .LC978
	.p2align 2
.L3269:
	ldr	w5, [x19, 2712]
	mov	x2, x20
	ldr	w6, [x19, 2716]
	mov	x1, x21
	mov	w0, 1
	mov	w4, w5
	cmp	w6, w5
	mov	w3, w6
	bcc	.L3267
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_OutputUnRefPicWithMinPoc
	cbz	w0, .L3269
	ldr	x1, .LC979
	mov	x2, x20
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_PrintDPBState
	mov	x0, x19
	bl	HEVC_ClearDPB
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RecoverDPBProcess, .-HEVC_RecoverDPBProcess
	.align	3
.LC972:
	.xword	.LANCHOR5
	.align	3
.LC974:
	.xword	.LC973
	.align	3
.LC976:
	.xword	.LC975
	.align	3
.LC978:
	.xword	.LC977
	.align	3
.LC979:
	.xword	.LC953
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	mov	x19, x2
	bl	_mcount
	cmp	w22, 16
	bhi	.L3283
	add	x20, x21, x22, uxtw 3
	ldr	x0, [x19, 64]
	mov	w1, 1
	mov	w2, w1
	str	x0, [x20, 2736]
	str	w1, [x0, 4]
	ldr	x1, [x20, 2736]
	ldr	w0, [x21, 276]
	ldr	w1, [x1, 32]
	bl	FSP_SetRef
	ldrb	w1, [x19]
	mov	x2, 664
	ldr	x0, [x20, 2736]
	cmp	w1, wzr
	add	x1, x19, 72
	cset	w3, ne
	strb	w3, [x0, 1]
	ldr	x0, [x20, 2736]
	ldr	w3, [x19, 36]
	str	w3, [x0, 24]
	ldr	x0, [x20, 2736]
	add	x0, x0, 88
	bl	memcpy
	ldr	x0, [x20, 2736]
	add	w1, w22, 1
	ldr	w2, [x19, 40]
	ldr	x3, .LC984
	str	w2, [x0, 20]
	str	w2, [x0, 44]
	mov	w2, 8
	ldr	x0, [x20, 2736]
	ldr	x4, [x19, 64]
	str	x4, [x0, 80]
	ldr	x0, [x20, 2736]
	ldr	w4, [x19, 12]
	str	w4, [x0, 16]
	str	w4, [x0, 48]
	add	x0, x21, 2736
	ldr	x4, [x20, 2736]
	ldr	w5, [x19, 8]
	str	w5, [x4, 12]
	ldr	x4, [x20, 2736]
	ldr	w5, [x19, 8]
	str	w5, [x4, 40]
	bl	qsort
	ldr	w1, [x21, 2716]
	mov	x0, x21
	add	w1, w1, 1
	str	w1, [x21, 2716]
	ldr	x1, [x19, 64]
	bl	HEVC_GetAPC
	cbnz	w0, .L3284
	strb	wzr, [x19, 1]
	mov	w0, 0
.L3281:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3283:
	ldr	x2, .LC981
	mov	w3, w22
	ldr	x1, .LC983
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	x0, x21
	bl	HEVC_ClearDPB
	mov	w0, -1
	b	.L3281
	.p2align 3
.L3284:
	ldr	x2, .LC981
	mov	w3, w0
	ldr	x1, .LC986
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	mov	x0, x21
	bl	HEVC_PrintDPBState
	mov	x0, x21
	bl	HEVC_ClearDPB
	mov	w0, -7
	b	.L3281
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	3
.LC981:
	.xword	.LANCHOR5
	.align	3
.LC983:
	.xword	.LC982
	.align	3
.LC984:
	.xword	compare_pic_by_poc_asc
	.align	3
.LC986:
	.xword	.LC985
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_SimpleDPBProcess
	.type	HEVC_SimpleDPBProcess, %function
HEVC_SimpleDPBProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 53248
	bl	_mcount
	ldrb	w0, [x19, 2016]
	cbnz	w0, .L3298
	ldr	x0, [x19, 2080]
	mov	w1, 2
	str	w1, [x0, 4]
.L3287:
	ldr	x1, [x19, 2080]
	mov	w2, 1
	mov	x0, x20
	strb	w2, [x1, 2]
	ldr	x1, [x19, 2080]
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w19, w0
	beq	.L3299
	cmn	w0, #3
	beq	.L3291
	mov	x0, x20
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3300
.L3291:
	mov	w0, 0
.L3288:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3298:
	mov	x0, x20
	bl	HEVC_SimpleSlideDPB
	ldr	w1, [x20, 2716]
	add	x2, x19, 2016
	mov	x0, x20
	bl	HEVC_InsertFrmInDPB
	cbz	w0, .L3287
	ldr	x2, .LC987
	mov	w4, w0
	ldr	x1, .LC989
	mov	w3, 8812
	add	x2, x2, 312
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -7
	b	.L3288
	.p2align 3
.L3300:
	ldr	x2, .LC987
	mov	w0, 0
	ldr	x1, .LC992
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3288
.L3299:
	ldr	x2, .LC987
	mov	w0, 0
	ldr	x1, .LC991
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, w19
	b	.L3288
	.size	HEVC_SimpleDPBProcess, .-HEVC_SimpleDPBProcess
	.align	3
.LC987:
	.xword	.LANCHOR5
	.align	3
.LC989:
	.xword	.LC988
	.align	3
.LC991:
	.xword	.LC990
	.align	3
.LC992:
	.xword	.LC217
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecOrderProcess
	.type	HEVC_DecOrderProcess, %function
HEVC_DecOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2712]
	ldr	w1, [x19, 2716]
	cmp	w1, w0
	bcs	.L3313
.L3302:
	add	x20, x19, 53248
	mov	x0, x19
	add	x2, x20, 2016
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3314
	ldr	x1, [x20, 2080]
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	cmn	w0, #1
	mov	w20, w0
	beq	.L3315
	cmn	w0, #3
	beq	.L3308
	mov	x0, x19
	bl	HEVC_OutputCurrPic
	cbnz	w0, .L3316
.L3308:
	mov	w0, 0
.L3305:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3313:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3312
	ldr	x2, .LC993
	mov	w0, 0
	ldr	x1, .LC995
	add	x2, x2, 336
	bl	dprint_vfmw
.L3312:
	ldr	w1, [x19, 2716]
	b	.L3302
.L3316:
	ldr	x2, .LC993
	mov	w0, 0
	ldr	x1, .LC999
	add	x2, x2, 336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3305
	.p2align 3
.L3314:
	ldr	x2, .LC993
	mov	w0, 0
	ldr	x1, .LC997
	add	x2, x2, 336
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3305
.L3315:
	ldr	x2, .LC993
	mov	w0, 0
	ldr	x1, .LC998
	add	x2, x2, 336
	bl	dprint_vfmw
	mov	w0, w20
	b	.L3305
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	3
.LC993:
	.xword	.LANCHOR5
	.align	3
.LC995:
	.xword	.LC994
	.align	3
.LC997:
	.xword	.LC996
	.align	3
.LC998:
	.xword	.LC990
	.align	3
.LC999:
	.xword	.LC217
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DispOrderProcess
	.type	HEVC_DispOrderProcess, %function
HEVC_DispOrderProcess:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 61440
	ldr	w0, [x0, 2632]
	cmp	w0, 1
	beq	.L3318
	mov	x0, x19
	bl	HEVC_FirstFrameFastOut
	cbnz	w0, .L3335
.L3318:
	ldr	w0, [x19, 2712]
	ldr	w1, [x19, 2716]
	cmp	w1, w0
	bcs	.L3336
.L3320:
	add	x2, x19, 53248
	mov	x0, x19
	add	x2, x2, 2016
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3337
	ldr	w0, [x19, 2716]
	cbnz	w0, .L3323
.L3324:
	mov	w0, 0
.L3319:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3323:
	mov	x0, x19
	bl	HEVC_OutputFrmFromDPB
	cbz	w0, .L3324
	ldr	x2, .LC1000
	mov	w0, 1
	ldr	x1, .LC1008
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3319
	.p2align 3
.L3336:
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	w0, 1
	beq	.L3334
	ldr	x1, .LC1004
	mov	w0, 0
	bl	dprint_vfmw
.L3334:
	ldr	w1, [x19, 2716]
	b	.L3320
	.p2align 3
.L3337:
	ldr	x1, .LC1006
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3319
.L3335:
	ldr	x2, .LC1000
	mov	w0, 0
	ldr	x1, .LC1002
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3319
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
	.align	3
.LC1000:
	.xword	.LANCHOR5
	.align	3
.LC1002:
	.xword	.LC1001
	.align	3
.LC1004:
	.xword	.LC1003
	.align	3
.LC1006:
	.xword	.LC1005
	.align	3
.LC1008:
	.xword	.LC1007
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_StorePicInDPB
	.type	HEVC_StorePicInDPB, %function
HEVC_StorePicInDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 53248
	bl	_mcount
	ldrsw	x1, [x19, 276]
	ldr	x0, .LC1009
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L3380
.L3339:
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 636]
	cmp	w0, 1
	beq	.L3381
	mov	x0, x19
	str	wzr, [x20, 2184]
	str	wzr, [x20, 2188]
	bl	HEVC_RemoveDummyFrame
	ldrb	w0, [x20, 2017]
	cbz	w0, .L3382
.L3345:
	ldr	x0, [x19, 2376]
	ldr	w1, [x20, 2056]
	ldr	w0, [x0, 4]
	cmp	w1, w0
	bhi	.L3383
	ldr	x1, [x19, 2384]
	ldr	x0, [x20, 2080]
	ldr	w1, [x1, 5336]
	str	w1, [x0, 752]
	ldr	x1, [x19, 2384]
	ldr	x0, [x20, 2080]
	ldr	w1, [x1, 5340]
	str	w1, [x0, 756]
	ldr	w0, [x19, 280]
	cmp	w0, 2
	beq	.L3384
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	beq	.L3385
	cmp	w0, 1
	beq	.L3386
	cbnz	w0, .L3360
.L3358:
	mov	x0, x19
	bl	HEVC_DispOrderProcess
	mov	w21, w0
	cbnz	w0, .L3356
.L3359:
	mov	w21, 0
.L3357:
	strb	wzr, [x20, 2017]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3381:
	ldr	x1, .LC1010
	ldr	x1, [x1]
	ldr	w2, [x1, 4180]
	ldr	w1, [x1, 4184]
	str	w0, [x20, 2184]
	mov	x0, x19
	cmp	w1, wzr
	csinc	w1, w1, wzr, ne
	udiv	w1, w2, w1
	str	w1, [x20, 2188]
	bl	HEVC_RemoveDummyFrame
	ldrb	w0, [x20, 2017]
	cbnz	w0, .L3345
.L3382:
	ldr	x2, .LC1011
	mov	w0, 1
	ldr	x1, .LC1013
	add	x2, x2, 384
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3380:
	ldr	x1, [x0, 176]
	mov	x0, 4294967296
	cmp	x1, x0
	bne	.L3339
	add	x0, x19, 28672
	ldrb	w1, [x0, 392]
	cmp	w1, 1
	bne	.L3339
	ldr	w4, [x0, 368]
	ldr	w5, [x0, 372]
	ldr	x3, [x19, 29032]
	ldr	x6, [x19, 29048]
	ldr	x7, [x19, 29056]
	cbz	w4, .L3361
	mov	w1, w4
	mov	w2, w5
	b	.L3341
	.p2align 3
.L3362:
	mov	w1, w0
.L3341:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L3362
.L3340:
	udiv	w0, w4, w1
	sub	x3, x3, x7
	lsl	w2, w3, 6
	add	x20, x19, 53248
	sub	w2, w2, w3
	lsl	w2, w2, 1
	sub	w2, w2, w3
	lsl	w2, w2, 3
	udiv	w1, w5, w1
	mul	w0, w2, w0
	udiv	w0, w0, w1
	add	x0, x0, x6
	str	x0, [x20, 2728]
	b	.L3339
	.p2align 3
.L3385:
	mov	x0, x19
	bl	HEVC_SimpleDPBProcess
	mov	w21, w0
	cbnz	w0, .L3387
.L3353:
	ldr	x1, .LC1019
	mov	w3, 9141
	mov	w2, w21
	mov	w0, 14
	bl	dprint_vfmw
.L3351:
	cmn	w21, #1
	bne	.L3357
	.p2align 2
.L3360:
	mov	x0, x19
	mov	w21, -1
	bl	HEVC_ClearCurrPic
	ldr	x2, .LC1011
	mov	w0, 1
	ldr	x1, .LC1027
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L3357
	.p2align 3
.L3383:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x3, [x19, 2376]
	mov	w0, 1
	ldr	w2, [x20, 2056]
	ldr	x1, .LC1015
	ldr	w3, [x3, 4]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3384:
	mov	x0, x19
	bl	HEVC_DirectOutput
	mov	w21, w0
	ldr	w1, [x19, 180]
	ldr	w0, [x20, 2052]
	cmp	w0, w1
	beq	.L3349
	add	x0, x19, x0, uxtw 2
	str	wzr, [x0, 2148]
	str	w1, [x20, 2052]
.L3349:
	cbnz	w21, .L3388
.L3350:
	ldr	x1, .LC1019
	mov	w3, 9126
	mov	w2, w21
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3351
	.p2align 3
.L3386:
	mov	x0, x19
	bl	HEVC_DecOrderProcess
	mov	w21, w0
	cbnz	w0, .L3389
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3359
	b	.L3358
	.p2align 3
.L3356:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1025
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L3351
	.p2align 3
.L3389:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1023
	add	x2, x2, 384
	bl	dprint_vfmw
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3351
	b	.L3358
	.p2align 3
.L3388:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1017
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L3350
	.p2align 3
.L3387:
	ldr	x2, .LC1011
	mov	w0, 0
	ldr	x1, .LC1021
	add	x2, x2, 384
	bl	dprint_vfmw
	b	.L3353
.L3361:
	mov	w1, w5
	b	.L3340
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
	.align	3
.LC1009:
	.xword	s_pstVfmwChan
	.align	3
.LC1010:
	.xword	g_HwMem
	.align	3
.LC1011:
	.xword	.LANCHOR5
	.align	3
.LC1013:
	.xword	.LC1012
	.align	3
.LC1015:
	.xword	.LC1014
	.align	3
.LC1017:
	.xword	.LC1016
	.align	3
.LC1019:
	.xword	.LC1018
	.align	3
.LC1021:
	.xword	.LC1020
	.align	3
.LC1023:
	.xword	.LC1022
	.align	3
.LC1025:
	.xword	.LC1024
	.align	3
.LC1027:
	.xword	.LC1026
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	sub	sp, sp, #736
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	w23, 0
	add	x19, x20, 69632
	mov	x0, x30
	add	x19, x19, 616
	mov	w22, w1
	bl	_mcount
	.p2align 2
.L3396:
	ldr	w0, [x19, 4]
	cbnz	w0, .L3391
	cbz	x19, .L3392
	ldr	w2, [x20, 2716]
	cbz	w2, .L3392
	ldr	x0, [x20, 2736]
	cmp	x19, x0
	beq	.L3391
	sub	w2, w2, #1
	mov	x0, x20
	add	x2, x20, x2, lsl 3
	b	.L3394
	.p2align 3
.L3395:
	ldr	x1, [x0, 2736]
	cmp	x19, x1
	beq	.L3391
.L3394:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L3395
.L3392:
	sxtw	x21, w23
	mov	w3, 101
	lsl	x1, x21, 2
	mov	x2, 664
	sub	x1, x1, x21
	add	x0, x29, 136
	lsl	x1, x1, 5
	mov	w24, 1
	sub	x21, x1, x21
	strb	w24, [x29, 65]
	strb	w24, [x29, 64]
	add	x21, x20, x21, lsl 3
	str	w22, [x29, 72]
	add	x21, x21, 69632
	str	w3, [x29, 104]
	add	x1, x21, 704
	bl	memcpy
	strb	w24, [x21, 618]
	strb	w24, [x21, 616]
	cmp	w23, 19
	str	wzr, [x21, 624]
	str	x19, [x29, 128]
	str	wzr, [x29, 320]
	bgt	.L3397
	ldr	w5, [x20, 2716]
	cbz	w5, .L3399
	mov	w6, 0
	mov	w3, 2147483647
	mov	w1, 0
	.p2align 2
.L3402:
	add	x0, x20, x1, sxtw 3
	add	w1, w1, 1
	ldr	x4, [x0, 2736]
	ldr	w0, [x4, 12]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w3
	bge	.L3401
	ldrb	w0, [x4, 1]
	cmp	w0, wzr
	csel	w3, w3, w2, eq
	csinc	w6, w6, wzr, eq
.L3401:
	cmp	w1, w5
	bne	.L3402
	cbz	w6, .L3399
	mov	w1, 0
	b	.L3403
	.p2align 3
.L3404:
	cmp	w5, w1
	beq	.L3405
.L3403:
	sxtw	x19, w1
	add	w1, w1, 1
	add	x19, x19, 340
	add	x19, x20, x19, lsl 3
	ldr	x2, [x19, 16]
	ldr	w0, [x2, 12]
	sub	w0, w0, w22
	sxtw	x0, w0
	eor	x4, x0, x0, asr 63
	sub	x4, x4, x0, asr 63
	cmp	w3, w4
	bne	.L3404
	ldrb	w0, [x2, 1]
	cbz	w0, .L3404
	ldr	w1, [x2, 32]
	ldr	w0, [x20, 276]
	bl	FSP_GetLogicFs
	mov	x21, x0
	ldr	x2, [x19, 16]
	mov	w3, w22
	ldr	x1, .LC1035
	mov	w0, 1
	ldr	w2, [x2, 12]
	bl	dprint_vfmw
	cbz	x21, .L3405
	ldr	x0, [x21, 680]
	cbz	x0, .L3438
	ldr	w0, [x20, 276]
	mov	w1, 0
	bl	FSP_NewLogicFs
	mov	w1, w0
	mov	w19, w0
	ldr	w0, [x20, 276]
	bl	FSP_GetLogicFs
	mov	x1, x0
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3408
	ldr	x3, [x29, 128]
	add	x2, x29, 64
	mov	x0, x20
	str	w19, [x3, 32]
	ldr	x3, [x21, 680]
	str	x3, [x1, 680]
	ldr	x3, [x21, 688]
	str	x3, [x1, 688]
	ldr	x3, [x21, 696]
	str	x3, [x1, 696]
	ldrsb	w3, [x21, 4]
	ldr	w1, [x20, 2716]
	str	w3, [x29, 100]
	bl	HEVC_InsertFrmInDPB
	cbnz	w0, .L3439
	ldr	w0, [x20, 276]
	mov	w2, 0
	mov	w1, w19
	bl	FSP_SetDisplay
	ldr	w2, [x20, 200]
	mov	w1, 2147483647
	mov	w0, 0
	cmp	w2, w1
	bne	.L3424
	str	w22, [x20, 200]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 736
	ret
	.p2align 3
.L3391:
	add	w23, w23, 1
	add	x19, x19, 760
	cmp	w23, 20
	bne	.L3396
.L3397:
	ldr	x1, .LC1029
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L3424:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 736
	ret
	.p2align 3
.L3405:
	ldr	x1, .LC1031
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	mov	w0, -4
	add	sp, sp, 736
	ret
.L3408:
	ldr	x2, [x29, 128]
	mov	w0, 0
	ldr	x1, .LC1039
	strb	wzr, [x2]
	bl	dprint_vfmw
	mov	w0, -4
	b	.L3424
.L3439:
	ldr	x0, [x29, 128]
	mov	w2, 1
	mov	w1, w19
	strb	wzr, [x0]
	ldr	w0, [x20, 276]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC1041
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3424
.L3399:
	ldr	x1, .LC1033
	mov	w0, 0
	strb	wzr, [x19]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3424
.L3438:
	ldr	x1, .LC1037
	bl	dprint_vfmw
	mov	x0, x20
	bl	HEVC_ClearDPB
	mov	w0, -4
	b	.L3424
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	3
.LC1029:
	.xword	.LC1028
	.align	3
.LC1031:
	.xword	.LC1030
	.align	3
.LC1033:
	.xword	.LC1032
	.align	3
.LC1035:
	.xword	.LC1034
	.align	3
.LC1037:
	.xword	.LC1036
	.align	3
.LC1039:
	.xword	.LC1038
	.align	3
.LC1041:
	.xword	.LC1040
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_RefPicProcess
	.type	HEVC_RefPicProcess, %function
HEVC_RefPicProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	mov	x0, x19
	bl	HEVC_ApplyReferencePictureSet
	mov	x0, x19
	bl	HEVC_RemoveUnusedApcStore
	mov	x0, x19
	bl	HEVC_RemoveUnUsedFrameStore
	ldr	x20, .LC1043
	b	.L3441
	.p2align 3
.L3444:
	ldr	w2, [x29, 44]
	mov	x1, x20
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2376]
	mov	x0, x19
	ldr	w1, [x1, 4]
	cbz	w1, .L3442
	ldr	w1, [x29, 44]
	bl	HEVC_CreateLostPicture
	cbnz	w0, .L3447
.L3441:
	add	x1, x29, 44
	mov	x0, x19
	bl	HEVC_CheckThatAllRefPicsAreAvailable
	cbz	w0, .L3444
	mov	x0, x19
	bl	HEVC_UpdateReflist
	mov	x0, x19
	bl	HEVC_UpdateLTReflist
	mov	x0, x19
	bl	HEVC_RecoverDPBProcess
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3442:
	add	x19, x19, 53248
	ldr	w4, [x29, 44]
	ldr	x1, .LC1045
	mov	w2, 0
	mov	w0, 1
	ldr	w3, [x19, 2800]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3447:
	mov	x0, x19
	bl	HEVC_RemoveDummyFrame
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
	.align	3
.LC1043:
	.xword	.LC1042
	.align	3
.LC1045:
	.xword	.LC1044
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecSlice
	.type	HEVC_DecSlice, %function
HEVC_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 53248
	bl	_mcount
	ldr	x0, [x19, 2392]
	ldr	x2, .LC1046
	ldr	w1, [x0, 16]
	str	w1, [x20, 2824]
	ldr	w3, [x0, 32]
	str	w3, [x20, 2820]
	strb	wzr, [x19, 1]
	ldrsw	x3, [x19, 276]
	ldr	x2, [x2, x3, lsl 3]
	ldrsb	w3, [x2, 44]
	cmp	w3, 1
	beq	.L3503
.L3450:
	add	x21, x19, 57344
	ldr	w0, [x21, 244]
	cmp	w0, 1
	beq	.L3504
.L3454:
	ldr	w0, [x19, 144]
	ldr	w2, [x19, 208]
	cmp	w2, w0
	bcs	.L3505
	ldrb	w0, [x20, 2017]
	cbz	w0, .L3506
	mov	x0, x19
	bl	HEVC_PicTypeStatistic
	mov	x0, x19
	bl	HEVC_CalcStreamBits
	ldr	w0, [x21, 244]
	cmp	w0, 2
	beq	.L3467
	ldr	w0, [x19, 220]
	cbnz	w0, .L3468
	ldrb	w0, [x20, 2755]
	cbz	w0, .L3507
.L3468:
	mov	x0, x19
	bl	HEVC_WriteSliceMsg
	cbnz	w0, .L3508
.L3471:
	ldr	w0, [x19, 220]
	cbz	w0, .L3509
.L3473:
	ldr	w1, [x19, 5284]
	mov	w0, 0
	str	w1, [x20, 2060]
	ldr	w1, [x19, 5288]
	str	w1, [x20, 2064]
.L3459:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3509:
	ldr	w0, [x20, 2828]
	mov	w1, 1
	str	w0, [x19, 320]
	ldr	w0, [x20, 2800]
	str	w0, [x19, 284]
	str	w1, [x19, 168]
	b	.L3473
	.p2align 3
.L3504:
	ldr	w0, [x19, 220]
	cbnz	w0, .L3456
	sub	w1, w1, #16
	cmp	w1, 4
	bls	.L3457
	ldr	w0, [x20, 2028]
	cbnz	w0, .L3458
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 680]
	cmp	w1, 1
	beq	.L3510
	.p2align 2
.L3458:
	ldrb	w22, [x19, 2]
	cmp	w22, 1
	beq	.L3511
.L3460:
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L3456
	ldr	w0, [x0, 12]
	cmp	w0, 2
	mov	x0, x19
	beq	.L3512
	bl	HEVC_RefPicProcess
	cbnz	w0, .L3474
.L3456:
	mov	x0, x19
	bl	HEVC_InitPic
	cmn	w0, #2
	beq	.L3459
	cbnz	w0, .L3513
	ldr	w1, [x19, 252]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x19, 252]
	bl	HEVC_SetScalingList
	mov	x0, x19
	bl	HEVC_WritePicMsg
	cbz	w0, .L3454
	ldr	x1, .LC1055
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3503:
	ldr	x3, [x2, 176]
	mov	x2, 4294967296
	cmp	x3, x2
	bne	.L3450
	ldr	w0, [x0, 16]
	sub	w2, w0, #19
	cmp	w2, 1
	bls	.L3514
.L3452:
	sub	w0, w0, #6
	cmp	w0, 3
	bls	.L3450
	ldr	x2, [x19, 7384]
	str	x2, [x19, 7368]
	b	.L3450
	.p2align 3
.L3467:
	ldr	x1, [x19, 2392]
	cbz	x1, .L3471
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	b	.L3471
	.p2align 3
.L3507:
	mov	x0, x19
	bl	HEVC_DecList
	cbnz	w0, .L3515
	mov	x0, x19
	bl	HEVC_IsRefListWrong
	cbz	w0, .L3468
	mov	x0, x19
	bl	HEVC_PrintDPBState
	ldr	x1, .LC1066
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3510:
	ldr	w1, [x0, 676]
	cbnz	w1, .L3458
	ldr	w1, [x0, 684]
	cbnz	w1, .L3458
	ldr	w0, [x0, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L3458
	.p2align 2
.L3457:
	mov	x0, x19
	bl	HEVC_FlushOutputFrmFromDPB
	cbz	w0, .L3458
	ldr	x2, .LC1047
	mov	w0, 1
	ldr	x1, .LC1049
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3511:
	ldr	w0, [x19, 2716]
	cbz	w0, .L3460
	mov	x0, x19
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L3460
	ldr	x2, .LC1047
	mov	w0, w22
	ldr	x1, .LC1051
	add	x2, x2, 408
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3474:
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3512:
	bl	HEVC_UpdateReflist
	mov	x0, x19
	bl	HEVC_UpdateLTReflist
	b	.L3456
	.p2align 3
.L3506:
	ldr	x1, .LC1062
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3514:
	ldr	x2, [x19, 2376]
	ldr	x2, [x2, 56]
	cmn	x2, #1
	beq	.L3453
	ldr	x3, [x19, 29032]
	str	x2, [x19, 29048]
	str	x3, [x19, 29056]
.L3453:
	add	x2, x19, 28672
	mov	w3, 1
	strb	w3, [x2, 392]
	b	.L3452
	.p2align 3
.L3505:
	ldr	x1, .LC1057
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x19, 144]
	ldr	w2, [x19, 208]
	cmp	w2, w1
	bcc	.L3465
	ldr	x0, .LC1058
	ldr	x4, [x0]
	cbz	x4, .L3465
	ldr	w0, [x19, 276]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 108
	blr	x4
.L3465:
	ldr	x1, .LC1060
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3508:
	ldr	x1, .LC1068
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.p2align 3
.L3513:
	ldr	x1, .LC1053
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
.L3515:
	ldr	x1, .LC1064
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3459
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	3
.LC1046:
	.xword	s_pstVfmwChan
	.align	3
.LC1047:
	.xword	.LANCHOR5
	.align	3
.LC1049:
	.xword	.LC1048
	.align	3
.LC1051:
	.xword	.LC1050
	.align	3
.LC1053:
	.xword	.LC1052
	.align	3
.LC1055:
	.xword	.LC1054
	.align	3
.LC1057:
	.xword	.LC1056
	.align	3
.LC1058:
	.xword	g_event_report
	.align	3
.LC1060:
	.xword	.LC1059
	.align	3
.LC1062:
	.xword	.LC1061
	.align	3
.LC1064:
	.xword	.LC1063
	.align	3
.LC1066:
	.xword	.LC1065
	.align	3
.LC1068:
	.xword	.LC1067
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w1
	mov	x21, x3
	mov	w22, w4
	mov	w20, w5
	bl	_mcount
	add	x2, x19, 53248
	str	w23, [x2, 2056]
	ldr	w0, [x19, 240]
	cmp	w0, 1
	bls	.L3517
.L3520:
	ldr	w0, [x2, 2032]
	cmp	w0, 1920
	bhi	.L3534
.L3518:
	ldr	x0, [x19, 2376]
.L3521:
	ldr	w0, [x0, 664]
	str	w0, [x19, 212]
	cbz	w22, .L3524
.L3537:
	ldr	x5, .LC1069
	sbfiz	x20, x20, 6, 32
	add	x20, x5, x20
	ldr	w0, [x20, 44]
	cmp	w0, 3
	beq	.L3535
	cmp	w0, 1
	beq	.L3524
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_StorePicInDPB
	cbnz	w0, .L3536
.L3528:
	mov	w1, 1
	mov	w0, 0
	str	w1, [x19, 168]
.L3526:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3534:
	ldr	x0, [x19, 2376]
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L3521
	str	wzr, [x19, 212]
	cbnz	w22, .L3537
.L3524:
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	mov	x1, x21
	mov	x0, x19
	bl	HEVC_StorePicInDPB
	cbz	w0, .L3528
.L3536:
	ldr	x1, .LC1071
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	ldr	x23, [sp, 48]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3517:
	add	w0, w0, 1
	str	w0, [x19, 240]
	cmp	w0, 1
	bls	.L3518
	b	.L3520
	.p2align 3
.L3535:
	mov	x0, x19
	bl	HEVC_ClearAllSlice
	mov	w0, 0
	b	.L3526
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	3
.LC1069:
	.xword	g_VdmDrvParam
	.align	3
.LC1071:
	.xword	.LC1070
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecVDM
	.type	HEVC_DecVDM, %function
HEVC_DecVDM:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 172]
	cmp	w0, 2
	bhi	.L3539
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x0, .LC1072
	ldr	x4, [x0]
	cbz	x4, .L3540
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3540:
	ldr	w0, [x19, 256]
	cmp	w0, 524288
	bhi	.L3600
	ldr	x1, .LC1076
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L3594:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3539:
	ldr	w0, [x19, 312]
	add	x20, x19, 53248
	ldr	w2, [x19, 316]
	add	w1, w0, 1
	ldr	x3, [x19, 2376]
	cmp	w1, w2
	mov	x0, x19
	csel	w1, w1, w2, ge
	str	w1, [x19, 312]
	sub	w1, w1, w2
	str	w1, [x3, 616]
	bl	HEVC_IsRefForCurrPic
	strb	w0, [x20, 2016]
	uxtb	w3, w0
	ldr	w21, [x19, 264]
	ldr	w2, [x19, 280]
	ubfx	x21, x21, 16, 3
	cmp	w21, w2
	beq	.L3543
	sub	w1, w2, #2
	cmp	w1, 1
	ccmp	w21, 2, 4, ls
	beq	.L3543
	cmp	w21, 1
	ccmp	w21, 4, 4, hi
	beq	.L3601
.L3543:
	cmp	w21, 2
	str	w21, [x19, 280]
	beq	.L3545
	cmp	w21, 3
	beq	.L3546
	cmp	w21, 1
	beq	.L3602
	ldr	w1, [x19, 248]
	cbz	w1, .L3598
	cmp	w21, 4
	bne	.L3552
	ldr	w1, [x20, 2028]
	cbnz	w1, .L3553
	mov	w0, 2
	strb	w0, [x19, 4]
	b	.L3554
	.p2align 3
.L3600:
	ldr	x1, .LC1074
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, -8
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3602:
	ldr	w1, [x20, 2028]
	cmp	w1, 2
	ccmp	w3, wzr, 0, eq
	beq	.L3549
.L3548:
	ldr	w1, [x19, 248]
	cbz	w1, .L3598
.L3552:
	ldr	w1, [x20, 2028]
.L3553:
	cmp	w1, 2
	beq	.L3603
	cmp	w1, 1
	bne	.L3554
	strb	w1, [x19, 4]
.L3554:
	ldr	w2, [x19, 252]
	mov	w0, 2
	ldr	x1, .LC1083
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	w2, [x19, 208]
	cbz	w2, .L3604
	ldr	w1, [x20, 2044]
	add	x0, x19, 61440
	add	x3, x19, 65536
	cmp	w1, wzr
	cset	w4, eq
	str	w4, [x0, 3972]
	ldr	w4, [x20, 2048]
	str	w4, [x0, 3964]
	str	w2, [x3, 1156]
	ldr	x2, [x19, 2376]
	ldr	w4, [x2, 632]
	str	w4, [x0, 3956]
	ldr	w2, [x2, 672]
	str	w2, [x0, 3960]
	ldr	w2, [x19, 252]
	cbz	w2, .L3560
	add	x0, x0, 2640
	str	x0, [x19, 2384]
	add	w1, w1, 1
	ldr	w2, [x20, 2060]
	str	w2, [x0, 5336]
	ldr	w2, [x20, 2064]
	str	w2, [x0, 5340]
	str	w1, [x20, 2044]
	str	wzr, [x0, 5332]
	ldr	w0, [x20, 2028]
	cbnz	w0, .L3560
	ldr	x1, [x3, 1160]
	mov	w4, 0
	cbz	x1, .L3562
	.p2align 2
.L3563:
	ldp	w2, w0, [x1]
	ldr	x1, [x1, 1360]
	add	w0, w2, w0
	add	w0, w0, 7
	add	w4, w4, w0, lsr 3
	cbnz	x1, .L3563
.L3562:
	ldr	x0, .LC1072
	ldr	x5, [x0]
	cbz	x5, .L3560
	add	x2, x29, 64
	ldr	w0, [x19, 276]
	mov	w3, 4
	mov	w1, 20
	str	w4, [x2, -8]!
	blr	x5
.L3560:
	ldr	w4, [x20, 2072]
	mov	w0, 0
	ldr	x3, [x20, 2080]
	ldr	w1, [x20, 2068]
	str	w4, [x20, 2068]
	sub	w1, w1, w4
	ldr	w2, [x3, 448]
	add	w2, w2, w1
	str	w2, [x3, 448]
	ldr	w2, [x20, 2448]
	add	w1, w2, w1
	str	w1, [x20, 2448]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3601:
	ldr	x1, .LC1078
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
	str	w21, [x19, 280]
.L3546:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	x0, x19
	bl	HEVC_ClearDPB
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3545:
	ldr	w1, [x20, 2028]
	cbz	w1, .L3548
	b	.L3549
	.p2align 3
.L3603:
	ldrb	w1, [x19, 4]
	cmp	w1, 2
	bne	.L3554
	ldr	x1, [x19, 2376]
	ldr	w1, [x1, 12]
	cbnz	w1, .L3554
	ldr	x1, .LC1079
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L3554
	ldr	x1, .LC1081
	mov	w0, 1
	ldr	w2, [x20, 2024]
	bl	dprint_vfmw
	.p2align 2
.L3598:
	ldr	x0, .LC1072
	ldr	x4, [x0]
	cbz	x4, .L3549
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3549:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, -1
	b	.L3594
	.p2align 3
.L3604:
	ldr	x0, .LC1072
	ldr	x4, [x0]
	cbz	x4, .L3558
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3558:
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	ldr	x2, .LC1084
	mov	w0, 0
	ldr	x1, .LC1086
	add	x2, x2, 424
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3594
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	3
.LC1072:
	.xword	g_event_report
	.align	3
.LC1074:
	.xword	.LC1073
	.align	3
.LC1076:
	.xword	.LC1075
	.align	3
.LC1078:
	.xword	.LC1077
	.align	3
.LC1079:
	.xword	g_allow_B_before_P
	.align	3
.LC1081:
	.xword	.LC1080
	.align	3
.LC1083:
	.xword	.LC1082
	.align	3
.LC1084:
	.xword	.LANCHOR5
	.align	3
.LC1086:
	.xword	.LC1085
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_VES_Splitter
	.type	HEVC_VES_Splitter, %function
HEVC_VES_Splitter:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w2
	mov	w25, w3
	mov	w20, w1
	bl	_mcount
	ldr	x0, [x19, 2344]
	mov	w1, 16
	str	xzr, [x29, 88]
	add	x22, x19, 53248
	bl	BsGet
	mov	w21, w0
	ldr	x0, [x19, 2344]
	mov	w1, 8
	bl	BsGet
	and	w24, w0, 31
	ldr	x0, [x19, 2344]
	mov	w1, 24
	bl	BsBack
	str	wzr, [x22, 2340]
	ldr	x1, [x22, 2352]
	str	x1, [x29, 88]
	cbz	w20, .L3607
	cmp	w20, 1
	beq	.L3608
	ldr	x1, .LC1105
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 1
.L3615:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3608:
	mov	w0, 31745
	cmp	w21, w0
	cbz	w23, .L3765
	ccmp	w24, 25, 0, eq
	bne	.L3636
	ldr	x20, .LC1087
	ldr	x4, [x20]
	cbz	x4, .L3637
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3637:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2392]
	cbz	w0, .L3766
.L3760:
	cbz	x1, .L3641
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3641:
	ldr	x4, [x20]
	cbz	x4, .L3740
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3740:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3607:
	cbnz	w23, .L3609
	mov	w0, 31745
	cmp	w21, w0
	ccmp	w24, 25, 0, eq
	bne	.L3610
	ldr	x20, .LC1087
	ldr	x4, [x20]
	cbz	x4, .L3611
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3611:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2392]
	cbnz	w0, .L3760
	ldr	w0, [x1, 56]
	add	x23, x22, 2336
	sub	w0, w0, #6
	add	x2, x0, 4
	str	w0, [x23, 4]
	cmp	x2, 1024
	bls	.L3616
	ldr	x1, .LC1089
	mov	w3, 775
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	b	.L3760
	.p2align 3
.L3609:
	mov	w0, 31745
	and	w21, w21, -513
	cmp	w21, w0
	mov	w0, 1
	bne	.L3615
	ldr	x2, .LC1090
	mov	w3, 862
	ldr	x1, .LC1099
.L3744:
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	cbz	x1, .L3740
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	mov	w0, -1
	b	.L3615
	.p2align 3
.L3765:
	ccmp	w25, 1, 0, eq
	ccmp	w24, 25, 0, eq
	beq	.L3767
	mov	w1, 32257
	cmp	w21, w1
	beq	.L3768
	cmp	w21, w0
	bne	.L3769
.L3648:
	ldr	x1, [x19, 2392]
.L3751:
	cbz	x1, .L3741
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3741:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3636:
	mov	w1, 32257
	mov	w0, w20
	cmp	w21, w1
	bne	.L3615
	ldr	x2, .LC1090
	mov	w3, 1007
	ldr	x1, .LC1103
	b	.L3744
	.p2align 3
.L3610:
	mov	w1, 32257
	mov	w0, 1
	cmp	w21, w1
	bne	.L3615
	b	.L3648
	.p2align 3
.L3766:
	ldr	w0, [x1, 56]
	add	x23, x22, 2336
	sub	w0, w0, #6
	add	x2, x0, 4
	str	w0, [x23, 4]
	cmp	x2, 1024
	bls	.L3640
	ldr	x1, .LC1089
	mov	w3, 940
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	b	.L3760
	.p2align 3
.L3769:
	ldr	x0, [x19, 2344]
	mov	w1, 8
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2344]
	mov	w1, 8
	ubfx	x20, x20, 1, 6
	bl	BsSkip
	cmp	w20, 49
	bne	.L3648
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3648
	ldr	x0, [x19, 2344]
	mov	w1, 16
	bl	BsBack
	ldr	x0, [x19, 2344]
	mov	w1, 32
	bl	BsBack
	ldr	x0, [x19, 2344]
	mov	w1, 32
	bl	BsBack
	mov	w0, 2
	b	.L3615
	.p2align 3
.L3767:
	ldr	x20, .LC1087
	ldr	x4, [x20]
	cbz	x4, .L3630
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3630:
	mov	x0, x19
	bl	HEVC_DecVDM
	ldr	x1, [x19, 2392]
	cbz	w0, .L3751
	b	.L3760
	.p2align 3
.L3640:
	ldr	w2, [x1, 88]
	ldr	w3, [x1, 56]
	ldr	w0, [x19, 276]
	add	w3, w3, w2
	ldr	w1, [x23, 8]
	add	x2, x29, 88
	sub	w3, w3, #2
	bl	MetadataMapToSec
	cbnz	w0, .L3770
	ldr	x21, .LC1093
	mov	x2, 4
	ldr	x1, .LC1094
	ldr	x0, [x29, 88]
	ldr	x3, [x21, 104]
	add	x1, x1, 208
	blr	x3
	ldr	x1, [x19, 2392]
	ldr	x0, [x29, 88]
	ldr	w2, [x23, 4]
	ldr	x1, [x1, 48]
	add	x0, x0, 4
	ldr	x3, [x21, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 4
	str	w0, [x23, 4]
	ldr	x1, [x19, 2392]
	ldr	w2, [x1, 88]
	cbz	w2, .L3643
	add	w3, w0, w2
	cmp	w3, 1024
	bls	.L3644
	uxtw	x2, w0
	ldr	x1, .LC1089
	mov	w3, 965
	add	x2, x2, 4
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	cbz	x1, .L3645
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3645:
	ldr	x4, [x20]
	cbz	x4, .L3646
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3646:
	ldr	w0, [x19, 276]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3740
	ldr	x2, .LC1090
	mov	w3, 972
	ldr	x1, .LC1096
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
	.p2align 3
.L3616:
	ldr	w2, [x1, 88]
	ldr	w3, [x1, 56]
	ldr	w0, [x19, 276]
	add	w3, w3, w2
	ldr	w1, [x23, 8]
	add	x2, x29, 88
	sub	w3, w3, #2
	bl	MetadataMapToSec
	cbnz	w0, .L3771
	ldr	x21, .LC1093
	mov	x2, 4
	ldr	x1, .LC1094
	ldr	x0, [x29, 88]
	ldr	x3, [x21, 104]
	add	x1, x1, 208
	blr	x3
	ldr	x1, [x19, 2392]
	ldr	x0, [x29, 88]
	ldr	w2, [x23, 4]
	ldr	x1, [x1, 48]
	add	x0, x0, 4
	ldr	x3, [x21, 104]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 4
	str	w0, [x23, 4]
	ldr	x1, [x19, 2392]
	ldr	w2, [x1, 88]
	cbz	w2, .L3620
	add	w3, w0, w2
	cmp	w3, 1024
	bls	.L3621
	uxtw	x2, w0
	ldr	x1, .LC1089
	mov	w3, 800
	add	x2, x2, 4
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	cbz	x1, .L3622
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3622:
	ldr	x4, [x20]
	cbz	x4, .L3623
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3623:
	ldr	w0, [x19, 276]
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3740
	ldr	x2, .LC1090
	mov	w3, 807
	ldr	x1, .LC1096
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
.L3621:
	ldr	x4, [x29, 88]
	uxtw	x2, w2
	ldr	x1, [x1, 80]
	ldr	x3, [x21, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x19, 2392]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 88]
	add	w0, w1, w0
	str	w0, [x23, 4]
.L3620:
	ldr	x20, .LC1097
	ldr	w0, [x19, 276]
	ldr	x1, [x20, w0, sxtw 3]
	cbz	x1, .L3624
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x19, 276]
	ldr	w1, [x22, 2340]
	ldr	x3, [x21, 88]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x29, 88]
	blr	x3
	ldr	x1, [x21, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x19, 276]
.L3624:
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3648
	ldr	x2, .LC1090
	mov	w3, 835
	ldr	x1, .LC1096
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
	.p2align 3
.L3644:
	ldr	x4, [x29, 88]
	uxtw	x2, w2
	ldr	x1, [x1, 80]
	ldr	x3, [x21, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x19, 2392]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 88]
	add	w0, w1, w0
	str	w0, [x23, 4]
.L3643:
	ldr	x20, .LC1097
	ldr	w0, [x19, 276]
	ldr	x1, [x20, w0, sxtw 3]
	cbz	x1, .L3647
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x19, 276]
	ldr	w1, [x22, 2340]
	ldr	x3, [x21, 88]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x29, 88]
	blr	x3
	ldr	x1, [x21, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x19, 276]
.L3647:
	ldr	x1, [x29, 88]
	bl	MetadataUnMapToSec
	cbz	w0, .L3648
	ldr	x2, .LC1090
	mov	w3, 995
	ldr	x1, .LC1096
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
	.p2align 3
.L3768:
	ldr	x0, [x19, 2344]
	mov	w1, 16
	bl	BsSkip
	mov	w0, w20
	b	.L3615
.L3770:
	ldr	x2, .LC1090
	mov	w0, 0
	ldr	x1, .LC1101
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
.L3771:
	ldr	x2, .LC1090
	mov	w3, 787
	ldr	x1, .LC1092
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3615
	.size	HEVC_VES_Splitter, .-HEVC_VES_Splitter
	.align	3
.LC1087:
	.xword	g_event_report
	.align	3
.LC1089:
	.xword	.LC1088
	.align	3
.LC1090:
	.xword	.LANCHOR5
	.align	3
.LC1092:
	.xword	.LC1091
	.align	3
.LC1093:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1094:
	.xword	.LANCHOR4
	.align	3
.LC1096:
	.xword	.LC1095
	.align	3
.LC1097:
	.xword	vfmw_save_metadata_file
	.align	3
.LC1099:
	.xword	.LC1098
	.align	3
.LC1101:
	.xword	.LC1100
	.align	3
.LC1103:
	.xword	.LC1102
	.align	3
.LC1105:
	.xword	.LC1104
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_CheckSedOnly
	.type	HEVCDEC_CheckSedOnly, %function
HEVCDEC_CheckSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 216]
	str	wzr, [x19, 220]
	cmp	w0, 2
	str	wzr, [x19, 228]
	beq	.L3802
	cmp	w0, 1
	mov	w0, 0
	beq	.L3803
.L3794:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3803:
	ldr	w1, [x19, 224]
	cmp	w1, 1
	bne	.L3794
	str	wzr, [x19, 224]
	.p2align 2
.L3800:
	mov	w0, -1
	b	.L3794
	.p2align 3
.L3802:
	ldr	w0, [x19, 212]
	cbz	w0, .L3800
	ldr	w1, [x19, 224]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3794
	ldr	w0, [x19, 276]
	bl	VCTRL_CheckFreshSeg
	cbz	w0, .L3800
	ldr	w0, [x19, 276]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L3800
	ldr	x1, [x19, 2392]
	ldr	x0, [x19, 2344]
	ldr	w2, [x1, 56]
	ldr	x1, [x1, 48]
	bl	BsInit
	ldr	x0, [x19, 2344]
	mov	w1, 24
	bl	BsSkip
	ldr	x0, [x19, 2344]
	bl	BsResidBits
	cmp	w0, 15
	ble	.L3800
	ldr	x0, [x19, 2344]
	mov	w1, 1
	bl	BsSkip
	ldr	x0, [x19, 2344]
	mov	w1, 6
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 2344]
	mov	w1, 9
	bl	BsSkip
	mov	w0, w20
	bl	HEVC_IsSliceUnit
	sxtb	w21, w0
	cmp	w21, 1
	beq	.L3804
	ldr	w0, [x19, 208]
	cbz	w0, .L3800
	sub	w0, w20, #32
	sub	w20, w20, #48
	cmp	w0, 2
	ccmp	w20, 1, 0, hi
	bhi	.L3800
.L3781:
	mov	x0, x19
	bl	HEVC_DecVDM
	cbnz	w0, .L3800
	add	x2, x19, 53248
	mov	w1, 1
	str	w1, [x19, 228]
	mov	w0, -1
	strb	w1, [x2, 2016]
	b	.L3794
	.p2align 3
.L3804:
	ldr	x0, [x19, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	mov	w0, 0
	ble	.L3778
	ldr	x0, [x19, 2344]
	mov	w1, w21
	bl	BsGet
.L3778:
	ldr	w1, [x19, 208]
	cbnz	w1, .L3805
.L3779:
	add	x1, x19, 53248
	mov	w0, 1
	stp	w0, wzr, [x19, 220]
	mov	w0, 0
	ldrb	w1, [x1, 2017]
	str	w1, [x19, 232]
	b	.L3794
.L3805:
	sub	w1, w20, #32
	sub	w20, w20, #48
	cmp	w1, 2
	ccmp	w20, 1, 0, hi
	ccmp	w0, wzr, 0, hi
	beq	.L3779
	b	.L3781
	.size	HEVCDEC_CheckSedOnly, .-HEVCDEC_CheckSedOnly
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_SetDecParam
	.type	HEVCDEC_SetDecParam, %function
HEVCDEC_SetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w20, [x19, 224]
	cmp	w20, 1
	beq	.L3822
.L3807:
	mov	x0, x19
	bl	HEVCDEC_IsNeedSedOnly
	cmp	w0, 1
	beq	.L3823
	ldr	w0, [x19, 220]
	cmp	w0, 1
	beq	.L3824
.L3806:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3824:
	ldr	w2, [x19, 172]
	add	x0, x19, 53248
	ldr	w3, [x19, 208]
	ldr	w1, [x19, 248]
	sub	w2, w2, #1
	sub	w3, w3, #1
	str	w2, [x19, 172]
	sub	w1, w1, #1
	str	w3, [x19, 208]
	str	w1, [x19, 248]
	ldr	w2, [x19, 232]
	strb	w2, [x0, 2017]
.L3821:
	ldr	x1, [x19, 2392]
	cbz	x1, .L3806
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3822:
	ldr	w0, [x19, 208]
	cbz	w0, .L3807
	ldr	x0, [x19, 2384]
	cbnz	x0, .L3807
	mov	x0, x19
	bl	HEVC_DecVDM
	cbnz	w0, .L3821
	add	x0, x19, 53248
	str	w20, [x19, 228]
	strb	w20, [x0, 2016]
	b	.L3806
	.p2align 3
.L3823:
	add	x2, x19, 65536
	add	x1, x19, 61440
	add	x3, x1, 2640
	str	w0, [x2, 3876]
	ldr	w0, [x19, 208]
	str	w0, [x19, 236]
	str	w0, [x2, 1156]
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 672]
	str	w0, [x1, 3960]
	str	wzr, [x19, 224]
	str	x3, [x19, 2384]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVCDEC_SetDecParam, .-HEVCDEC_SetDecParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_DecOneNal
	.type	HEVC_DecOneNal, %function
HEVC_DecOneNal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, [x19, 2392]
	ldr	w0, [x3, 8]
	cbz	w0, .L3830
	ldr	w2, [x19, 256]
	mov	w0, 0
	.p2align 2
.L3829:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 56]
	add	w2, w2, w1
	str	w2, [x19, 256]
	ldr	w1, [x3, 8]
	cmp	w1, w0
	bhi	.L3829
.L3830:
	strb	wzr, [x3, 1]
	ldr	x0, [x19, 2392]
	ldr	w1, [x0, 16]
	sub	w1, w1, #36
	cmp	w1, 1
	bls	.L3975
.L3828:
	ldr	w1, [x0, 4]
	add	w1, w1, 16
	str	w1, [x0, 4]
	ldr	x1, [x19, 2392]
	ldr	w2, [x1, 16]
	cmp	w2, 49
	bls	.L3976
.L3831:
	ldr	x1, .LC1117
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	ldr	w0, [x1, 16]
	cmp	w0, 63
	bhi	.L3859
	cbnz	x1, .L3961
	.p2align 2
.L3959:
	mov	w0, 0
.L3979:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3976:
	ldr	x0, .LC1106
	ldrb	w0, [x0,w2,uxtw]
	adr	x3, .Lrtx3833
	add	x0, x3, w0, sxtb #2
	br	x0
.Lrtx3833:
	.section	.rodata
	.align	0
	.align	2
.L3833:
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3832 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3834 - .Lrtx3833) / 4
	.byte	(.L3835 - .Lrtx3833) / 4
	.byte	(.L3836 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3837 - .Lrtx3833) / 4
	.byte	(.L3837 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3831 - .Lrtx3833) / 4
	.byte	(.L3838 - .Lrtx3833) / 4
	.byte	(.L3839 - .Lrtx3833) / 4
	.text
	.p2align 3
.L3975:
	mov	w1, 1
	strb	w1, [x19, 1]
	b	.L3828
.L3839:
	mov	x0, x19
	bl	HEVC_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	beq	.L3977
.L3855:
	ldr	x1, [x19, 2392]
	cbz	x1, .L3959
.L3961:
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	mov	w0, 0
.L3958:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3832:
	mov	x0, x19
	bl	HEVC_DecSlice
	cmn	w0, #2
	beq	.L3958
	cbz	w0, .L3959
	ldr	x1, [x19, 2392]
	cbz	x1, .L3973
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3973:
	ldr	x0, .LC1109
	ldr	x4, [x0]
	cbz	x4, .L3960
.L3962:
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3960:
	mov	w0, -1
.L3978:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3835:
	mov	x0, x19
	bl	HEVC_DecSPS
	mov	w20, w0
	ldr	x1, [x19, 2392]
	cbz	x1, .L3845
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3845:
	cbz	w20, .L3959
	ldr	x1, .LC1111
	b	.L3970
.L3836:
	mov	x0, x19
	bl	HEVC_DecPPS
	mov	w20, w0
	ldr	x1, [x19, 2392]
	cbz	x1, .L3847
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3847:
	cbz	w20, .L3959
	ldr	x1, .LC1113
	b	.L3970
.L3834:
	mov	x0, x19
	bl	HEVC_DecVPS
	mov	w20, w0
	ldr	x1, [x19, 2392]
	cbz	x1, .L3840
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3840:
	cbz	w20, .L3959
	ldr	x1, .LC1108
.L3970:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC1109
	ldr	x4, [x21]
	cbz	x4, .L3960
	add	x2, x29, 64
	ldr	w0, [x19, 276]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L3960
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
.L3837:
	mov	x0, x19
	bl	HEVC_DecSEI
	mov	w20, w0
	ldr	x1, [x19, 2392]
	cbz	x1, .L3848
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3848:
	cbz	w20, .L3959
	ldr	x1, .LC1115
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3973
.L3838:
	ldrb	w0, [x19, 6]
	cmp	w0, 1
	beq	.L3853
	cbz	x1, .L3852
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3852:
	add	x0, x19, 53248
	ldrb	w0, [x0, 2017]
	cbz	w0, .L3959
.L3853:
	add	x20, x19, 2672
	mov	w1, 32
	strb	wzr, [x19, 6]
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 32
	mov	x0, x20
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w21, w2
	ccmp	w0, w1, 0, eq
	bne	.L3959
	ldr	x20, .LC1109
	ldr	x4, [x20]
	cbz	x4, .L3854
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3854:
	add	x0, x19, 53248
	ldrb	w0, [x0, 2017]
	cbz	w0, .L3959
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3959
.L3858:
	ldr	x4, [x20]
	cbnz	x4, .L3962
	mov	w0, -1
	b	.L3978
	.p2align 3
.L3859:
	ldr	x20, .LC1109
	ldr	x4, [x20]
	cbz	x4, .L3860
	ldr	w0, [x19, 276]
	mov	w1, 102
	mov	w3, 0
	mov	x2, 0
	blr	x4
	ldr	x1, [x19, 2392]
	cbz	x1, .L3861
.L3862:
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L3861:
	ldr	x4, [x20]
	cbz	x4, .L3959
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, 0
	b	.L3979
.L3860:
	cbnz	x1, .L3862
	mov	w0, 0
	b	.L3979
.L3977:
	ldr	x20, .LC1109
	strb	w0, [x19, 7]
	ldr	x4, [x20]
	cbz	x4, .L3856
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L3856:
	add	x0, x19, 53248
	ldrb	w0, [x0, 2017]
	cbz	w0, .L3855
	mov	x0, x19
	bl	HEVC_DecVDM
	cbz	w0, .L3855
	ldr	x1, [x19, 2392]
	cbz	x1, .L3858
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	b	.L3858
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	3
.LC1106:
	.xword	.L3833
	.align	3
.LC1108:
	.xword	.LC1107
	.align	3
.LC1109:
	.xword	g_event_report
	.align	3
.LC1111:
	.xword	.LC1110
	.align	3
.LC1113:
	.xword	.LC1112
	.align	3
.LC1115:
	.xword	.LC1114
	.align	3
.LC1117:
	.xword	.LC1116
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_VDMProcSedOnly
	.type	HEVCDEC_VDMProcSedOnly, %function
HEVCDEC_VDMProcSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x3, w20
	ldr	x1, [x19, 2384]
	lsl	x0, x3, 2
	ldr	x20, .LC1119
	sub	x3, x0, x3
	ldr	x4, .LC1118
	lsl	x0, x3, 4
	ldrsw	x5, [x19, 276]
	ldp	w21, w2, [x1, 16]
	sub	x3, x0, x3
	ldr	x1, .LC1121
	mov	w0, 22
	ldr	x22, [x4, x5, lsl 3]
	add	x20, x20, x3, lsl 2
	madd	w21, w2, w21, w21
	ldr	w3, [x20, 20]
	add	w21, w21, w2
	mov	w2, w21
	bl	dprint_vfmw
	ldr	w0, [x20, 20]
	cmp	w21, w0
	ldr	w0, [x19, 220]
	beq	.L3990
	cmp	w0, 1
	beq	.L3991
.L3985:
	str	xzr, [x19, 2384]
.L3983:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3991:
	ldr	w2, [x19, 172]
	add	x0, x19, 53248
	ldr	w3, [x19, 208]
	ldr	w1, [x19, 248]
	sub	w2, w2, #1
	sub	w3, w3, #1
	str	w2, [x19, 172]
	sub	w1, w1, #1
	str	w3, [x19, 208]
	str	w1, [x19, 248]
	str	wzr, [x19, 224]
	ldr	w2, [x19, 232]
	strb	w2, [x0, 2017]
	ldr	x1, [x19, 2392]
	cbz	x1, .L3985
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	b	.L3985
	.p2align 3
.L3990:
	cmp	w0, 1
	beq	.L3982
	mov	x0, x19
	bl	HEVC_DecVDM
	cbnz	w0, .L3983
	add	x1, x19, 53248
	mov	w0, 1
	str	w0, [x19, 228]
	strb	w0, [x1, 2016]
	b	.L3983
	.p2align 3
.L3982:
	ldr	w2, [x19, 172]
	add	x4, x19, 53248
	ldr	w3, [x19, 208]
	ldr	w1, [x19, 248]
	sub	w2, w2, #1
	str	w0, [x19, 224]
	sub	w3, w3, #1
	str	w2, [x19, 172]
	sub	w1, w1, #1
	str	w3, [x19, 208]
	str	w1, [x19, 248]
	ldr	w5, [x19, 232]
	strb	w5, [x4, 2017]
	strb	w0, [x22, 753]
	strb	w0, [x19, 5]
	mov	w0, 0
	str	xzr, [x19, 2384]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	HEVCDEC_VDMProcSedOnly, .-HEVCDEC_VDMProcSedOnly
	.align	3
.LC1118:
	.xword	s_pstVfmwChan
	.align	3
.LC1119:
	.xword	g_BackUp
	.align	3
.LC1121:
	.xword	.LC1120
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_UnMarkFrameStoreRef
	.type	HEVC_UnMarkFrameStoreRef, %function
HEVC_UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	strb	wzr, [x19, 1]
	ldr	w1, [x19, 32]
	mov	w2, 0
	ldr	w0, [x20, 276]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_UnMarkFrameStoreRef, .-HEVC_UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_InquireSliceProperty
	.type	HEVC_InquireSliceProperty, %function
HEVC_InquireSliceProperty:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x21, x2
	mov	x0, x30
	mov	x22, x1
	add	x20, x19, 53248
	bl	_mcount
	str	wzr, [x21]
	ldr	x3, .LC1122
	mov	x2, 3732
	str	wzr, [x22]
	mov	w1, 0
	add	x0, x20, 2752
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x1, [x19, 2392]
	mov	x0, x19
	ldr	w2, [x1, 16]
	str	w2, [x20, 2824]
	ldr	w1, [x1, 32]
	str	w1, [x20, 2820]
	bl	HEVC_DecSliceSegmentHeader
	cbnz	w0, .L4010
	ldr	w1, [x20, 2828]
	mov	w3, 2024
	ldr	x0, [x19, 2368]
	mov	w20, 26164
	ldr	w23, [x19, 220]
	ldr	x2, [x19, 2360]
	smaddl	x0, w1, w3, x0
	cmp	w23, 1
	ldr	w0, [x0, 32]
	smaddl	x20, w0, w20, x2
	beq	.L4011
	add	x0, x19, 57344
	ldr	w0, [x0, 244]
	cmp	w0, 1
	cset	w0, eq
	str	w0, [x22]
	ldr	x0, [x19, 29080]
	ldr	x1, [x19, 2376]
	ldr	w2, [x20, 236]
	ldp	w5, w3, [x0, 72]
	ldr	w0, [x0, 236]
	ldp	w6, w4, [x20, 72]
	cmp	w2, w0
	ldr	w0, [x1, 872]
	cset	w2, ne
	cmp	w0, 1
	beq	.L4012
.L3999:
	cmp	w6, w5
	cset	w0, ne
	cmp	w4, w3
	orr	w0, w2, w0
	cset	w1, ne
	orr	w0, w1, w0
	cbz	w0, .L4002
	mov	w1, 1
	mov	w0, 0
	str	w1, [x21]
.L3995:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4011:
	ldr	x0, [x19, 2344]
	bl	BsResidBits
	cmp	w0, wzr
	ldp	w2, w1, [x20, 240]
	ldr	w3, [x19, 208]
	mul	w1, w1, w2
	add	w3, w3, 1
	udiv	w3, w1, w3
	ccmp	w0, w3, 1, ge
	blt	.L3997
.L4002:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4010:
	ldr	x1, .LC1124
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1125
	ldr	x4, [x0]
	cbz	x4, .L4003
	add	x2, x29, 80
	ldr	w0, [x19, 276]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4012:
	ldr	w7, [x20, 108]
	ldr	w0, [x20, 100]
	cmp	w0, w7
	csel	w0, w0, w7, cs
	str	w0, [x1, 924]
	ldr	x0, [x19, 29080]
	ldr	x7, [x19, 2376]
	ldr	w1, [x0, 108]
	ldr	w0, [x0, 100]
	cmp	w0, w1
	csel	w0, w0, w1, cs
	ldr	w1, [x7, 924]
	cmp	w0, 8
	ccmp	w1, 8, 0, hi
	bne	.L4013
.L4000:
	mov	w0, 1
	str	w0, [x7, 928]
	str	w0, [x21]
	b	.L3999
	.p2align 3
.L4003:
	mov	w0, -1
	b	.L3995
	.p2align 3
.L4013:
	cmp	w0, 8
	ccmp	w1, 8, 4, eq
	ble	.L3999
	b	.L4000
.L3997:
	ldr	x1, .LC1127
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3995
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	3
.LC1122:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1124:
	.xword	.LC1123
	.align	3
.LC1125:
	.xword	g_event_report
	.align	3
.LC1127:
	.xword	.LC1126
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 100]
	stp	wzr, wzr, [x29, 92]
	cbz	x20, .L4087
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L4088
	ldr	x0, [x19, 2376]
	ldrb	w1, [x19, 5]
	ldr	w2, [x0, 8]
	cmp	w1, 1
	ubfiz	w2, w2, 16, 3
	str	w2, [x19, 264]
	ldr	w1, [x0]
	str	w1, [x19, 268]
	ldr	w1, [x0, 4]
	str	w1, [x19, 272]
	beq	.L4018
	ldr	w1, [x0, 872]
	add	x21, x19, 86016
	cmp	w1, 1
	beq	.L4089
.L4019:
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_ReceivePacket
	mov	w20, w0
	ldr	x0, [x19, 2392]
	str	x0, [x21, 2896]
.L4020:
	strb	wzr, [x19, 5]
	cbz	w20, .L4021
.L4044:
	mov	w20, 0
.L4085:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4021:
	mov	x0, x19
	bl	HEVCDEC_CheckSedOnly
	mov	w20, w0
	cbz	w0, .L4022
	ldr	x1, [x19, 2392]
	cbz	x1, .L4040
	ldr	w0, [x19, 276]
	mov	w20, -1
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4089:
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L4019
	ldr	w0, [x21, 2888]
	cmp	w0, 1
	bne	.L4019
	ldr	x0, [x21, 2896]
	mov	w20, 0
	str	x0, [x19, 2392]
	str	wzr, [x21, 2888]
	strb	wzr, [x19, 5]
	b	.L4085
	.p2align 3
.L4018:
	ldr	x0, [x19, 2392]
	cmp	x0, xzr
	csetm	w20, eq
	cbz	w20, .L4020
	ldr	x1, .LC1133
	mov	w0, 0
	bl	dprint_vfmw
	b	.L4085
	.p2align 3
.L4040:
	mov	w20, -1
	b	.L4085
	.p2align 3
.L4022:
	ldr	x0, [x19, 2392]
	str	wzr, [x0, 4]
	ldr	x1, [x19, 2392]
	ldr	x0, [x19, 2344]
	ldr	w2, [x1, 56]
	ldr	x1, [x1, 48]
	bl	BsInit
	ldr	x0, [x19, 2344]
	mov	w1, 24
	bl	BsSkip
	ldr	x23, .LC1134
	ldrsw	x0, [x19, 276]
	ldr	x0, [x23, x0, lsl 3]
	ldrsb	w21, [x0, 44]
	cmp	w21, 1
	beq	.L4090
	mov	w22, 2
	mov	w25, 0
	mov	w24, w22
.L4024:
	ldr	x21, [x19, 2392]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 24]
	mov	w1, 6
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 16]
	mov	w1, 6
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 28]
	mov	w1, 3
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 32]
	ldr	x21, [x19, 2392]
	ldr	w0, [x21, 32]
	cbnz	w0, .L4091
.L4025:
	ldr	w0, [x21, 16]
	bl	HEVC_IsSliceUnit
	sxtb	w26, w0
	cmp	w26, 1
	beq	.L4092
.L4026:
	str	wzr, [x21, 4]
	add	x0, x19, 2672
	ldr	x1, [x19, 2392]
	ldr	w2, [x1, 56]
	ldr	x1, [x1, 48]
	bl	BsInit
	ldr	x0, [x19, 2344]
	mov	w1, 24
	bl	BsSkip
	cmp	w24, 1
	ccmp	w22, wzr, 0, eq
	ccmp	w25, 1, 4, eq
	beq	.L4042
	ldr	x0, [x19, 2344]
	mov	w1, 16
	bl	BsSkip
.L4042:
	ldr	x21, [x19, 2392]
	mov	w1, 1
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 24]
	mov	w1, 6
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 16]
	mov	w1, 6
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	str	w0, [x21, 28]
	mov	w1, 3
	ldr	x21, [x19, 2392]
	ldr	x0, [x19, 2344]
	bl	BsGet
	sub	w0, w0, #1
	str	w0, [x21, 32]
.L4041:
	mov	x0, x19
	bl	HEVC_DecOneNal
	cmn	w0, #2
	beq	.L4049
	cbnz	w0, .L4093
	add	x0, x19, 53248
	str	wzr, [x0, 2072]
	ldr	w0, [x19, 212]
	cmp	w0, 1
	bne	.L4044
	mov	x0, x19
	bl	HEVCDEC_SetDecParam
	b	.L4085
	.p2align 3
.L4091:
	sub	w0, w0, #1
	str	w0, [x21, 32]
	ldr	x21, [x19, 2392]
	b	.L4025
	.p2align 3
.L4088:
	ldr	x1, .LC1131
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L4085
	.p2align 3
.L4090:
	ldp	w24, w22, [x0, 172]
	ldr	w3, [x0, 180]
	mov	x0, x19
	mov	w2, w22
	mov	w1, w24
	bl	HEVC_VES_Splitter
	cmp	w0, 2
	beq	.L4047
	cmp	w0, 1
	mov	w25, 0
	beq	.L4024
.L4049:
	mov	w20, w0
	b	.L4085
	.p2align 3
.L4092:
	add	x2, x29, 108
	add	x1, x29, 104
	mov	x0, x19
	bl	HEVC_InquireSliceProperty
	cbnz	w0, .L4027
	ldr	w21, [x29, 104]
	cmp	w21, 1
	beq	.L4094
.L4028:
	ldr	w21, [x29, 108]
	cmp	w21, 1
	beq	.L4095
.L4037:
	ldr	x21, [x19, 2392]
	ldr	w0, [x21, 16]
	bl	HEVC_IsSliceUnit
	sxtb	w0, w0
	cmp	w0, 1
	beq	.L4041
	b	.L4026
	.p2align 3
.L4047:
	mov	w25, w21
	b	.L4024
.L4027:
	ldr	x1, .LC1144
	mov	w0, w26
	bl	dprint_vfmw
	ldr	x1, [x19, 2392]
	cbz	x1, .L4038
	ldr	w0, [x19, 276]
	bl	HEVC_ReleaseNAL
	str	xzr, [x19, 2392]
.L4038:
	ldr	x0, .LC1142
	ldr	x4, [x0]
	cbz	x4, .L4039
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4039:
	ldrsw	x0, [x19, 276]
	ldr	x0, [x23, x0, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	bne	.L4040
	ldr	x1, [x0, 176]
	mov	x0, 4294967296
	cmp	x1, x0
	bne	.L4040
	add	x0, x19, 28672
	ldrb	w1, [x0, 392]
	cbnz	w1, .L4040
	ldr	x3, .LC1145
	mov	x2, 80
	add	x0, x0, 320
	mov	w20, -1
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 5260]
	str	wzr, [x19, 5264]
	str	wzr, [x19, 5268]
	str	wzr, [x19, 5272]
	str	xzr, [x19, 7360]
	str	xzr, [x19, 7368]
	str	xzr, [x19, 7376]
	str	xzr, [x19, 7384]
	b	.L4085
.L4087:
	ldr	x1, .LC1129
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L4085
.L4094:
	ldr	w1, [x19, 208]
	cbnz	w1, .L4029
	add	x1, x19, 53248
	ldrb	w1, [x1, 2017]
	cbz	w1, .L4028
	ldr	x2, .LC1135
	ldr	x1, .LC1137
	add	x2, x2, 464
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	b	.L4028
.L4095:
	ldrb	w23, [x19, 2]
	mov	x0, x19
	cmp	w23, 1
	beq	.L4096
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L4097
.L4032:
	ldr	w0, [x19, 276]
	bl	FSP_GetFspType
	cbnz	w0, .L4037
	ldr	w0, [x19, 276]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 748]
	cmp	w0, 1
	bne	.L4037
	ldr	w1, [x29, 100]
	cmp	w1, wzr
	bgt	.L4035
	ldr	w2, [x29, 96]
	cmp	w2, 32
	bgt	.L4035
	ldr	x2, [x19, 2384]
	cbnz	x2, .L4035
	ldr	w2, [x29, 108]
	cbz	w2, .L4037
	ldr	w3, [x19, 252]
	cbz	w3, .L4037
	add	x21, x19, 86016
	ldr	x3, [x19, 29080]
	ldr	w4, [x21, 2920]
	ldr	w6, [x3, 76]
	cmp	w6, w4
	beq	.L4037
	ldr	w5, [x3, 72]
	ldr	w3, [x21, 2924]
	cmp	w5, w3
	ccmp	w1, wzr, 0, ne
	bne	.L4037
	ldr	x1, .LC1141
	bl	dprint_vfmw
	str	wzr, [x21, 2916]
	ldr	x1, .LC1142
	ldr	x0, [x19, 29080]
	ldr	x4, [x1]
	ldr	w1, [x0, 76]
	str	w1, [x21, 2920]
	ldr	w0, [x0, 72]
	str	w0, [x21, 2924]
	cbz	x4, .L4037
	ldr	w0, [x19, 276]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4037
	.p2align 3
.L4093:
	ldr	x1, .LC1147
	mov	w0, 22
	mov	w20, -1
	bl	dprint_vfmw
	b	.L4085
.L4029:
	ldr	x3, [x19, 2392]
	mov	w2, 13
	ldr	x1, .LC1135
	add	x0, x19, 2672
	mov	w20, -2
	str	wzr, [x3, 4]
	add	x1, x1, 512
	bl	BsInit
	ldr	x0, [x19, 2344]
	mov	w1, 40
	bl	BsSkip
	ldr	x1, [x19, 2392]
	mov	w2, 48
	mov	x0, x19
	str	w2, [x1, 16]
	strb	w21, [x19, 6]
	bl	HEVC_DecOneNal
	strb	w21, [x19, 5]
	ldr	w0, [x19, 304]
	add	w0, w0, 1
	str	w0, [x19, 304]
	b	.L4085
.L4096:
	bl	HEVC_EmptyFrmFromDPB
	cbz	w0, .L4032
	ldr	x2, .LC1135
	mov	w0, w23
	ldr	x1, .LC1138
	add	x2, x2, 488
	bl	dprint_vfmw
	b	.L4032
.L4097:
	ldr	x2, .LC1135
	mov	w0, w21
	ldr	x1, .LC1139
	add	x2, x2, 488
	bl	dprint_vfmw
	b	.L4032
.L4035:
	add	x1, x19, 86016
	mov	w0, 1
	mov	w20, -2
	str	wzr, [x1, 2916]
	strb	w0, [x19, 5]
	b	.L4085
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	3
.LC1129:
	.xword	.LC1128
	.align	3
.LC1131:
	.xword	.LC1130
	.align	3
.LC1133:
	.xword	.LC1132
	.align	3
.LC1134:
	.xword	s_pstVfmwChan
	.align	3
.LC1135:
	.xword	.LANCHOR5
	.align	3
.LC1137:
	.xword	.LC1136
	.align	3
.LC1138:
	.xword	.LC1050
	.align	3
.LC1139:
	.xword	.LC1048
	.align	3
.LC1141:
	.xword	.LC1140
	.align	3
.LC1142:
	.xword	g_event_report
	.align	3
.LC1144:
	.xword	.LC1143
	.align	3
.LC1145:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1147:
	.xword	.LC1146
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_HaveSliceToDec
	.type	HEVC_HaveSliceToDec, %function
HEVC_HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	w0, [x19, 208]
	cbnz	w0, .L4099
	add	x0, x19, 53248
	mov	w20, -1
	ldrb	w0, [x0, 2017]
	cbnz	w0, .L4103
.L4099:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L4103:
	ldr	x2, .LC1148
	mov	w0, 0
	ldr	x1, .LC1149
	add	x2, x2, 464
	bl	dprint_vfmw
	mov	x0, x19
	bl	HEVC_ClearCurrPic
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	3
.LC1148:
	.xword	.LANCHOR5
	.align	3
.LC1149:
	.xword	.LC1136
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVC_GetPicStreamSize
	.type	HEVC_GetPicStreamSize, %function
HEVC_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 65536
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 1160]
	cbz	x2, .L4105
	.p2align 2
.L4106:
	ldp	w3, w1, [x2]
	ldr	x2, [x2, 1360]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L4106
.L4105:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	HEVC_GetPicStreamSize, .-HEVC_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetRemainImg
	.type	HEVCDEC_GetRemainImg, %function
HEVCDEC_GetRemainImg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 2716]
	cbz	w0, .L4121
	ldr	x23, .LC1150
	add	x22, x19, 61440
	ldr	x24, .LC1154
	mov	w21, -1
	add	x23, x23, 528
	ldr	x26, .LC1152
	add	x22, x22, 2024
	mov	x25, x23
	b	.L4120
	.p2align 3
.L4112:
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	ldr	w1, [x29, 104]
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w0, [x19, 2716]
	cbz	w0, .L4130
.L4120:
	add	x1, x29, 108
	mov	x0, x19
	add	x2, x29, 104
	bl	HEVC_GetMinPOC
	ldr	w1, [x29, 104]
	add	x0, x19, x1, uxtw 3
	ldr	x20, [x0, 2736]
	cbz	x20, .L4112
	ldrb	w0, [x20, 2]
	cbnz	w0, .L4112
	mov	w0, 1
	mov	x1, x20
	strb	w0, [x20, 2]
	mov	x0, x19
	bl	HEVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	HEVC_CheckFrameStore
	mov	w21, w0
	cbz	w0, .L4131
	ldr	w1, [x29, 104]
.L4135:
	mov	x0, x19
	bl	HEVC_RemoveApcStore
	ldr	w1, [x29, 104]
	mov	x0, x19
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	w0, [x19, 2716]
	cbnz	w0, .L4120
	.p2align 2
.L4130:
	cbnz	w21, .L4121
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4131:
	ldr	w0, [x19, 276]
	mov	w2, 1
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 276]
	ldr	w1, [x20, 32]
	bl	FSP_GetFsImagePtr
	mov	x27, x0
	cbz	x0, .L4132
	ldr	w0, [x19, 2716]
	cmp	w0, 1
	beq	.L4133
.L4115:
	ldr	w0, [x19, 276]
	mov	x4, x27
	mov	x3, x22
	mov	x2, x19
	mov	w1, 16
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w28, w0
	beq	.L4116
	mov	w3, w0
	mov	x2, x23
	mov	x1, x24
	mov	w0, 0
	mov	w28, -1
	bl	dprint_vfmw
	ldr	w0, [x19, 276]
	mov	w2, 0
	ldr	w1, [x20, 32]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	HEVC_ClearAll
.L4116:
	ldr	x0, [x19, 2376]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L4134
	str	wzr, [x27, 24]
.L4118:
	ldr	w0, [x19, 316]
	ldr	w1, [x29, 104]
	add	w0, w0, 1
	str	w0, [x19, 316]
	ldr	w0, [x19, 308]
	add	w0, w0, 1
	str	w0, [x19, 308]
	ldr	w0, [x19, 2716]
	cmp	w0, 1
	beq	.L4112
	mov	w21, w28
	b	.L4112
	.p2align 3
.L4121:
	add	x0, x19, 61440
	add	x0, x0, 2024
	bl	GetVoLastImageID
	mov	w21, w0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4134:
	mov	x1, x27
	mov	x0, x19
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L4118
	.p2align 3
.L4133:
	str	w0, [x27, 212]
	b	.L4115
.L4132:
	mov	x1, x26
	mov	x2, x25
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	ldr	w1, [x29, 104]
	b	.L4135
	.size	HEVCDEC_GetRemainImg, .-HEVCDEC_GetRemainImg
	.align	3
.LC1150:
	.xword	.LANCHOR5
	.align	3
.LC1152:
	.xword	.LC1151
	.align	3
.LC1154:
	.xword	.LC1153
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageWidth
	.type	HEVCDEC_GetImageWidth, %function
HEVCDEC_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 29080]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w2, [x0, 152]
	ldr	w0, [x0, 72]
	add	w1, w2, w0
	neg	w2, w2
	sub	w0, w1, #1
	and	w0, w0, w2
	ret
	.size	HEVCDEC_GetImageWidth, .-HEVCDEC_GetImageWidth
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HEVCDEC_GetImageHeight
	.type	HEVCDEC_GetImageHeight, %function
HEVCDEC_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 29080]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w2, [x0, 152]
	ldr	w0, [x0, 76]
	add	w1, w2, w0
	neg	w2, w2
	sub	w0, w1, #1
	and	w0, w0, w2
	ret
	.size	HEVCDEC_GetImageHeight, .-HEVCDEC_GetImageHeight
	.global	g_IsDeced
	.global	g_TsToRsMap
	.global	s_TmpParam
	.global	RPU_START_CODE
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	SarTable.11835, %object
	.size	SarTable.11835, 136
SarTable.11835:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.word	4
	.word	3
	.word	3
	.word	2
	.word	2
	.word	1
	.type	__func__.12027, %object
	.size	__func__.12027, 18
__func__.12027:
	.string	"HEVC_CalcTileInfo"
	.zero	6
	.type	__func__.12518, %object
	.size	__func__.12518, 27
__func__.12518:
	.string	"HEVC_GetUnRefPicWithMinPoc"
	.zero	5
	.type	__func__.12527, %object
	.size	__func__.12527, 21
__func__.12527:
	.string	"HEVC_IncreaseDPBSize"
	.zero	3
	.type	__func__.12758, %object
	.size	__func__.12758, 17
__func__.12758:
	.string	"HEVC_WritePicMsg"
	.zero	7
	.type	__func__.12787, %object
	.size	__func__.12787, 16
__func__.12787:
	.string	"HEVC_CheckListX"
	.type	__func__.12912, %object
	.size	__func__.12912, 16
__func__.12912:
	.string	"HEVC_RepairList"
	.type	__func__.13285, %object
	.size	__func__.13285, 21
__func__.13285:
	.string	"HEVC_CheckFrameStore"
	.zero	3
	.type	__func__.13128, %object
	.size	__func__.13128, 19
__func__.13128:
	.string	"HEVC_OutputCurrPic"
	.zero	5
	.type	__func__.13133, %object
	.size	__func__.13133, 23
__func__.13133:
	.string	"HEVC_FirstFrameFastOut"
	.zero	1
	.type	__func__.13353, %object
	.size	__func__.13353, 19
__func__.13353:
	.string	"HEVC_GetSLHDR1Info"
	.zero	5
	.type	__func__.13479, %object
	.size	__func__.13479, 14
__func__.13479:
	.string	"HEVC_IsNewPic"
	.zero	2
	.type	quant8_inter_default, %object
	.size	quant8_inter_default, 64
quant8_inter_default:
	.word	269488144
	.word	403968529
	.word	286265360
	.word	421008402
	.word	303108112
	.word	471406612
	.word	336728336
	.word	555489560
	.word	403968529
	.word	690035737
	.word	421008402
	.word	908665116
	.word	471406612
	.word	1194731809
	.word	555489560
	.word	1531393577
	.type	quant_ts_default, %object
	.size	quant_ts_default, 16
quant_ts_default:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.align	3
.LANCHOR5 = . + 0
	.type	__func__.13760, %object
	.size	__func__.13760, 16
__func__.13760:
	.string	"HEVC_ReleaseNAL"
	.type	g_CropUnitX, %object
	.size	g_CropUnitX, 16
g_CropUnitX:
	.word	1
	.word	2
	.word	2
	.word	1
	.type	g_CropUnitY, %object
	.size	g_CropUnitY, 16
g_CropUnitY:
	.word	1
	.word	2
	.word	1
	.word	1
	.type	__func__.12609, %object
	.size	__func__.12609, 27
__func__.12609:
	.string	"HEVC_DecSliceSegmentHeader"
	.zero	5
	.type	__func__.12991, %object
	.size	__func__.12991, 13
__func__.12991:
	.string	"HEVC_InitDPB"
	.zero	3
	.type	__func__.13820, %object
	.size	__func__.13820, 13
__func__.13820:
	.string	"HEVCDEC_Init"
	.zero	3
	.type	__func__.13277, %object
	.size	__func__.13277, 19
__func__.13277:
	.string	"HEVC_OutputFrmToVO"
	.zero	5
	.type	__func__.13244, %object
	.size	__func__.13244, 22
__func__.13244:
	.string	"HEVC_OutputFrmFromDPB"
	.zero	2
	.type	__func__.12533, %object
	.size	__func__.12533, 30
__func__.12533:
	.string	"HEVC_OutputUnRefPicWithMinPoc"
	.zero	2
	.type	__func__.13257, %object
	.size	__func__.13257, 27
__func__.13257:
	.string	"HEVC_FlushOutputFrmFromDPB"
	.zero	5
	.type	__func__.13808, %object
	.size	__func__.13808, 23
__func__.13808:
	.string	"HEVCDEC_GetImageBuffer"
	.zero	1
	.type	__func__.13859, %object
	.size	__func__.13859, 14
__func__.13859:
	.string	"HEVC_ClearDPB"
	.zero	2
	.type	__func__.12538, %object
	.size	__func__.12538, 23
__func__.12538:
	.string	"HEVC_RecoverDPBProcess"
	.zero	1
	.type	__func__.13221, %object
	.size	__func__.13221, 20
__func__.13221:
	.string	"HEVC_InsertFrmInDPB"
	.zero	4
	.type	__func__.13138, %object
	.size	__func__.13138, 22
__func__.13138:
	.string	"HEVC_SimpleDPBProcess"
	.zero	2
	.type	__func__.13143, %object
	.size	__func__.13143, 21
__func__.13143:
	.string	"HEVC_DecOrderProcess"
	.zero	3
	.type	__func__.13148, %object
	.size	__func__.13148, 22
__func__.13148:
	.string	"HEVC_DispOrderProcess"
	.zero	2
	.type	__func__.13164, %object
	.size	__func__.13164, 19
__func__.13164:
	.string	"HEVC_StorePicInDPB"
	.zero	5
	.type	__func__.12565, %object
	.size	__func__.12565, 14
__func__.12565:
	.string	"HEVC_DecSlice"
	.zero	2
	.type	__func__.12865, %object
	.size	__func__.12865, 12
__func__.12865:
	.string	"HEVC_DecVDM"
	.zero	4
	.type	__func__.11940, %object
	.size	__func__.11940, 18
__func__.11940:
	.string	"HEVC_VES_Splitter"
	.zero	6
	.type	__func__.13923, %object
	.size	__func__.13923, 20
__func__.13923:
	.string	"HEVC_HaveSliceToDec"
	.zero	4
	.type	__func__.11974, %object
	.size	__func__.11974, 21
__func__.11974:
	.string	"HEVCDEC_DecodePacket"
	.zero	3
	.type	g_HEVCNalTypeEOPIC, %object
	.size	g_HEVCNalTypeEOPIC, 13
g_HEVCNalTypeEOPIC:
	.byte	0
	.byte	0
	.byte	1
	.byte	96
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.zero	3
	.type	__func__.13940, %object
	.size	__func__.13940, 21
__func__.13940:
	.string	"HEVCDEC_GetRemainImg"
	.data
	.align	3
.LANCHOR4 = . + 0
	.type	quant8_intra_default, %object
	.size	quant8_intra_default, 64
quant8_intra_default:
	.word	269488144
	.word	404034065
	.word	269488144
	.word	420877073
	.word	303108112
	.word	488183316
	.word	353505296
	.word	606018328
	.word	403968273
	.word	791225118
	.word	454431506
	.word	1094069283
	.word	521737749
	.word	1480996393
	.word	605886744
	.word	1935163695
	.type	g_quantTSDefault4x4, %object
	.size	g_quantTSDefault4x4, 16
g_quantTSDefault4x4:
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
	.type	g_quantInterDefault8x8, %object
	.size	g_quantInterDefault8x8, 64
g_quantInterDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	91
	.type	g_quantIntraDefault8x8, %object
	.size	g_quantIntraDefault8x8, 64
g_quantIntraDefault8x8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	21
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	19
	.byte	22
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	22
	.byte	25
	.byte	29
	.byte	16
	.byte	16
	.byte	18
	.byte	21
	.byte	24
	.byte	27
	.byte	31
	.byte	36
	.byte	17
	.byte	17
	.byte	20
	.byte	24
	.byte	30
	.byte	35
	.byte	41
	.byte	47
	.byte	18
	.byte	19
	.byte	22
	.byte	27
	.byte	35
	.byte	44
	.byte	54
	.byte	65
	.byte	21
	.byte	22
	.byte	25
	.byte	31
	.byte	41
	.byte	54
	.byte	70
	.byte	88
	.byte	24
	.byte	25
	.byte	29
	.byte	36
	.byte	47
	.byte	65
	.byte	88
	.byte	115
	.type	RPU_START_CODE, %object
	.size	RPU_START_CODE, 4
RPU_START_CODE:
	.byte	0
	.byte	0
	.byte	1
	.byte	25
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC8:
	ASCII(.string	"dar=%d\n" )
.LC10:
	ASCII(.string	"--------------- PrintNaluArraySlot START ---------------\n" )
	.zero	6
.LC12:
	ASCII(.string	"\n" )
	.zero	6
.LC14:
	ASCII(.string	"--------------- PrintNaluArraySlot END ---------------\n" )
.LC16:
	ASCII(.string	"NalArray[%d]=%p,is_valid=%d   " )
	.zero	1
.LC18:
	ASCII(.string	"--------------- PrintCurrSlicelistX START ---------------\n" )
	.zero	5
.LC20:
	ASCII(.string	"List0, size: %d\n" )
	.zero	7
.LC22:
	ASCII(.string	"List1, size: %d\n" )
	.zero	7
.LC24:
	ASCII(.string	"pListX[0][%d]:%p " )
	.zero	6
.LC26:
	ASCII(.string	"pFrameStore:%p " )
.LC28:
	ASCII(.string	"pLogicFs:%p " )
	.zero	3
.LC31:
	ASCII(.string	"--------------- PrintCurrSlicelistX END ---------------\n" )
	.zero	7
.LC33:
	ASCII(.string	"pListX[1][%d]: %p" )
	.zero	6
.LC37:
	ASCII(.string	"--------------- PrintFrameStoreState START ---------------\n" )
	.zero	4
.LC39:
	ASCII(.string	"--------------- PrintFrameStoreState END ---------------\n" )
	.zero	6
.LC41:
	ASCII(.string	"Fs=%d, pFs=%p, state=%d, is_reference=%d, is_displayed=%d " )
	.zero	5
.LC43:
	ASCII(.string	"p_usrdat[%d]=%p " )
	.zero	7
.LC46:
	ASCII(.string	"--------------- PrintAPCState START ---------------\n" )
	.zero	3
.LC48:
	ASCII(.string	"APC.used_size:%d, APC.size:%d\n" )
	.zero	1
.LC50:
	ASCII(.string	"%d: is_used=%d, idc=%d, poc=%d\n" )
.LC52:
	ASCII(.string	"--------------- PrintAPCState END ---------------\n" )
	.zero	5
.LC54:
	ASCII(.string	"--------------- PrintDPBState START ---------------\n" )
	.zero	3
.LC56:
	ASCII(.string	"DPB: size:%d, used_size:%d, negative:%d, positive:%d, longterm:%d\n" )
	.zero	5
.LC59:
	ASCII(.string	"fs[%d]:%p non_existing:%d state:%d is_ref:%d displayed:%d poc:%d long_term:%d LogicFs:%p, fsp_ref:%d fsp_disp:%d logic_id:%d img_id:%d\n" )
.LC61:
	ASCII(.string	"--------------- PrintDPBState END ---------------\n" )
	.zero	5
.LC63:
	ASCII(.string	"fs[%d]\t" )
.LC65:
	ASCII(.string	"LogicFs:%p\t" )
	.zero	4
.LC67:
	ASCII(.string	"LogicTick:%d\t" )
	.zero	2
.LC69:
	ASCII(.string	"IsRef:%d\t" )
	.zero	6
.LC71:
	ASCII(.string	"s32DispState:%d\t" )
	.zero	7
.LC73:
	ASCII(.string	"LogicFs:Null\t" )
	.zero	2
.LC75:
	ASCII(.string	"DecFs:%p\t" )
	.zero	6
.LC77:
	ASCII(.string	"DecTick:%d\t" )
	.zero	4
.LC79:
	ASCII(.string	"DecFs:Null\t" )
	.zero	4
.LC81:
	ASCII(.string	"DispFs:%p\t" )
	.zero	5
.LC83:
	ASCII(.string	"DispTick:%d\t" )
	.zero	3
.LC85:
	ASCII(.string	"DispFs:Null\t" )
	.zero	3
.LC88:
	ASCII(.string	"%s num_tile_columns(%d) out of range(0, %d].\n" )
	.zero	2
.LC90:
	ASCII(.string	"%s num_tile_rows(%d) out of range(0, %d].\n" )
	.zero	5
.LC93:
	ASCII(.string	"%s 0 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC95:
	ASCII(.string	"%s 1 idx(%d) out of range(0, 512).\n" )
	.zero	4
.LC97:
	ASCII(.string	"firmware/common/syntax/hevc.c" )
	.zero	2
.LC99:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC103:
	ASCII(.string	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\n" )
	.zero	6
.LC105:
	ASCII(.string	"pListX[0][%d] = NULL, listXsize[0] = %d\n" )
	.zero	7
.LC107:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %d\n" )
	.zero	2
.LC109:
	ASCII(.string	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) invalid\n" )
	.zero	1
.LC111:
	ASCII(.string	"pListX[1][%d] = NULL, listXsize[1] = %d\n" )
	.zero	7
.LC113:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %d\n" )
	.zero	2
.LC115:
	ASCII(.string	"pListX[i][%d] pstLogicFs(%p) invalid\n" )
	.zero	2
.LC118:
	ASCII(.string	"%s can't find such pic.\n" )
	.zero	7
.LC120:
	ASCII(.string	"%s DPB.used_size(%d) >= 17.\n" )
	.zero	3
.LC122:
	ASCII(.string	"%s find pos=%d, poc=%d.\n" )
	.zero	7
.LC125:
	ASCII(.string	"%s DPB.size(%d) already reached max(%d).\n" )
	.zero	6
.LC127:
	ASCII(.string	"%s increase DPB size to %d\n" )
	.zero	4
.LC129:
	ASCII(.string	"%s no enough fs(total_fs_num=%d) to increase DPB size.\n" )
.LC131:
	ASCII(.string	"TileWidthInCtb is 0\n" )
	.zero	3
.LC137:
	ASCII(.string	"image_id=%d, pmv_idc=%d\n" )
	.zero	7
.LC139:
	ASCII(.string	"pic msg burst0:\n" )
	.zero	7
.LC143:
	ASCII(.string	"%s call HEVC_CalcTileInfo failed.\n" )
	.zero	5
.LC145:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC147:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p\n" )
	.zero	3
.LC150:
	ASCII(.string	"%s ERROR: bHaveIndependentSlice = 0\n\n" )
	.zero	2
.LC152:
	ASCII(.string	"ListX ERROR: list0size >= %d\n" )
	.zero	2
.LC154:
	ASCII(.string	"ListX ERROR: list1size >= %d\n" )
	.zero	2
.LC156:
	ASCII(.string	"pListX[0][%d] = NULL\n" )
	.zero	2
.LC158:
	ASCII(.string	"pListX[0][%d]->frame_store = NULL\n" )
	.zero	5
.LC160:
	ASCII(.string	"pListX[1][%d] = NULL\n" )
	.zero	2
.LC162:
	ASCII(.string	"pListX[1][%d]->frame_store = NULL\n" )
	.zero	5
.LC164:
	ASCII(.string	"NumSlicePara(%d) >= MaxSliceNum(%d)\n" )
	.zero	3
.LC167:
	ASCII(.string	"line:%d pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	2
.LC169:
	ASCII(.string	"line:%d seq_parameter_set_id(%d) out of range[0,%d].\n" )
	.zero	2
.LC171:
	ASCII(.string	"line:%d, i(%d) > Max(%d) num_of_pics %d\n" )
	.zero	7
.LC173:
	ASCII(.string	"line:%d, i(%d) > Max(%d)(neg%d + pos%d)\n" )
	.zero	7
.LC176:
	ASCII(.string	"%s unkown slice type(%d).\n" )
	.zero	5
.LC178:
	ASCII(.string	"%s pListX[%d] no available pic to repair.\n" )
	.zero	5
.LC180:
	ASCII(.string	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\n" )
	.zero	4
.LC184:
	ASCII(.string	"HEVC_InitListX error.\n" )
	.zero	1
.LC186:
	ASCII(.string	"HEVC_RepairList error.\n" )
.LC188:
	ASCII(.string	"release(apc=%d, pmvIdc=%d)\t" )
	.zero	4
.LC192:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC194:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%d, logic_fs=%p, dec_fs=%p)\n" )
	.zero	1
.LC197:
	ASCII(.string	"%s frame logic_fs_id=%d, state=%d\n" )
	.zero	5
.LC199:
	ASCII(.string	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null, logic_fs_id = %d\n" )
	.zero	2
.LC201:
	ASCII(.string	"%s frame poc=%d, is already output\n" )
	.zero	4
.LC203:
	ASCII(.string	"%s frame(%p) invalid, state:%d, non_existing:%d\n" )
	.zero	7
.LC207:
	ASCII(.string	"%s: pImg is NULL!\n" )
	.zero	5
.LC209:
	ASCII(.string	"%s, REPORT_IFRAME_ERR\n" )
	.zero	1
.LC212:
	ASCII(.string	"%s: InsertImgToVoQueue failed!\n" )
.LC214:
	ASCII(.string	"%s: ImgErrorLevel = %d, OutErrThr:%d, discarded!\n" )
	.zero	6
.LC217:
	ASCII(.string	"%s output current picture failed\n" )
	.zero	6
.LC219:
	ASCII(.string	"HEVC_DECRecycleImage ERROR, DispState = FS_DISP_STATE_NOT_USED\n" )
.LC222:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC224:
	ASCII(.string	"hevc partition fs memory fail!\n" )
.LC226:
	ASCII(.string	"ERROR: HEVC FSP_ConfigInstance fail!\n" )
	.zero	2
.LC228:
	ASCII(.string	"%-5d   specVersion\n" )
	.zero	4
.LC230:
	ASCII(.string	"%-5d   payloadMode\n" )
	.zero	4
.LC232:
	ASCII(.string	"%-5d   hdrPicColourSpace\n" )
	.zero	6
.LC234:
	ASCII(.string	"%-5d   hdrMasterDisplayColourSpace\n" )
	.zero	4
.LC236:
	ASCII(.string	"%-5d   hdrMasterDisplayMaxLuminance\n" )
	.zero	3
.LC238:
	ASCII(.string	"%-5d   hdrMasterDisplayMinLuminance\n" )
	.zero	3
.LC240:
	ASCII(.string	"%-5d   sdrPicColourSpace\n" )
	.zero	6
.LC242:
	ASCII(.string	"%-5d   sdrMasterDisplayColourSpace\n" )
	.zero	4
.LC244:
	ASCII(.string	"%-5d   tmInputSignalBlackLevelOffset\n" )
	.zero	2
.LC246:
	ASCII(.string	"%-5d   tmInputSignalWhiteLevelOffset\n" )
	.zero	2
.LC248:
	ASCII(.string	"%-5d   shadowGain\n" )
	.zero	5
.LC250:
	ASCII(.string	"%-5d   highlightGain\n" )
	.zero	2
.LC252:
	ASCII(.string	"%-5d   midToneWidthAdjFactor\n" )
	.zero	2
.LC254:
	ASCII(.string	"%-5d   tmOutputFineTuningNumVal\n" )
	.zero	7
.LC256:
	ASCII(.string	"%-5d   saturationGainNumVal\n" )
	.zero	3
.LC258:
	ASCII(.string	"%-5d   tmOutputFineTuningX[%d]\n" )
.LC260:
	ASCII(.string	"%-5d   tmOutputFineTuningY[%d]\n" )
.LC262:
	ASCII(.string	"%-5d   saturationGainX[%d]\n" )
	.zero	4
.LC264:
	ASCII(.string	"%-5d   saturationGainY[%d]\n" )
	.zero	4
.LC266:
	ASCII(.string	"%-5d   luminanceMappingNumVal\n" )
	.zero	1
.LC268:
	ASCII(.string	"%-5d   colourCorrectionNumVal\n" )
	.zero	1
.LC270:
	ASCII(.string	"%-5d   luminanceMappingX[%d]\n" )
	.zero	2
.LC272:
	ASCII(.string	"%-5d   luminanceMappingY[%d]\n" )
	.zero	2
.LC274:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuA\n" )
	.zero	7
.LC276:
	ASCII(.string	"%-5d   chromaToLumaInjectionMuB\n" )
	.zero	7
.LC278:
	ASCII(.string	"%-5d   colourCorrectionX[%d]\n" )
	.zero	2
.LC280:
	ASCII(.string	"%-5d   colourCorrectionY[%d]\n" )
	.zero	2
.LC282:
	ASCII(.string	"======SL_HDR1_METADATA= %d=======\n" )
	.zero	5
.LC287:
	ASCII(.string	"%s, [%d %d %d %d %d]\n" )
	.zero	2
.LC289:
	ASCII(.string	"%s HDR_Metadata_phy_addr is invalid!!\n" )
	.zero	1
.LC292:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC295:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC297:
	ASCII(.string	"FSP_GetFspType -1\n" )
	.zero	5
.LC299:
	ASCII(.string	"FSP_GetLogicFs return NULL\n" )
	.zero	4
.LC301:
	ASCII(.string	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), error resilence.\n" )
	.zero	6
.LC303:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC305:
	ASCII(.string	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC307:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC309:
	ASCII(.string	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of range\n" )
	.zero	5
.LC311:
	ASCII(.string	"sps with this seq_parameter_set_id = %d havn't be decoded\n" )
	.zero	5
.LC313:
	ASCII(.string	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of range\n" )
	.zero	7
.LC315:
	ASCII(.string	"vps with this video_parameter_set_id = %d havn't be decoded\n" )
	.zero	3
.LC318:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, nal_unit_type = %d, should skip this frame\n" )
	.zero	2
.LC320:
	ASCII(.string	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d, nal_unit_type = %d, should skip this frame\n" )
.LC322:
	ASCII(.string	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocCRA = %d, nal_unit_type = %d, should skip this frame\n" )
.LC324:
	ASCII(.string	"HEVC_ReadByteAlignment: code should not be zero.\n" )
	.zero	6
.LC326:
	ASCII(.string	"HEVC_ReadByteAlignment: code:%d\n" )
	.zero	7
.LC329:
	ASCII(.string	"general_profile_compatibility_flag[][%d]" )
	.zero	7
.LC331:
	ASCII(.string	"reserved_zero_2bits not equal 0.\n" )
	.zero	6
.LC340:
	ASCII(.string	"HEVC_GetScalingListDefaultAddress NULL.\n" )
	.zero	7
.LC342:
	ASCII(.string	"Error, BsLen: 0x%x, TotalPos: 0x%x\n" )
	.zero	4
.LC344:
	ASCII(.string	"Panic: All zero data sequence in RBSP \n" )
.LC346:
	ASCII(.string	"nal_trail_zero_bit_num err\n" )
	.zero	4
.LC351:
	ASCII(.string	"%s release streambuff=%p, bitstream_length=%d\n" )
	.zero	1
.LC355:
	ASCII(.string	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\n" )
	.zero	6
.LC357:
	ASCII(.string	"END of the bit buffer, copy the first packet!\n" )
	.zero	1
.LC360:
	ASCII(.string	"HEVC_ue_v ERROR: LeadingZeros (%d) >= 32, return 0x%x\n" )
	.zero	1
.LC362:
	ASCII(.string	"tone_map_id" )
	.zero	4
.LC364:
	ASCII(.string	"Unsupport: target_bit_depth(%d) > 8\n" )
	.zero	3
.LC367:
	ASCII(.string	"pTon->num_pivots > 256\n" )
.LC369:
	ASCII(.string	"frame_packing_arrangement_id" )
	.zero	3
.LC371:
	ASCII(.string	"frame_packing_arrangement_type(%d) out of range\n" )
	.zero	7
.LC373:
	ASCII(.string	"decoding_unit_idx" )
	.zero	6
.LC375:
	ASCII(.string	"num_sps_ids_minus1" )
	.zero	5
.LC377:
	ASCII(.string	"pAct->num_sps_ids_minus1 > 15\n" )
	.zero	1
.LC379:
	ASCII(.string	"active_seq_parameter_set_id" )
	.zero	4
.LC381:
	ASCII(.string	"bp_seq_parameter_set_id" )
.LC383:
	ASCII(.string	"Wrong bp_seq_parameter_set_id = %d, should be 0 to 15!\n" )
.LC385:
	ASCII(.string	"HEVC_Sei_Buf_Period cpb_cnt_minus1(%d) out of range(0,31).\n" )
	.zero	4
.LC388:
	ASCII(.string	"num_decoding_units_minus1" )
	.zero	6
.LC390:
	ASCII(.string	"pPic->num_decoding_units_minus1 > 255\n" )
	.zero	1
.LC392:
	ASCII(.string	"num_nalus_in_du_minus1" )
	.zero	1
.LC394:
	ASCII(.string	"cv_rec_id" )
	.zero	6
.LC396:
	ASCII(.string	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize < 4!!\n" )
	.zero	5
.LC398:
	ASCII(.string	"delta_idx_minus1" )
	.zero	7
.LC400:
	ASCII(.string	"delta_idx(%d) > idx(%d).\n" )
	.zero	6
.LC402:
	ASCII(.string	"rIdx(%d) > (idx-1)(%d) or < 0).\n" )
	.zero	7
.LC404:
	ASCII(.string	"abs_delta_rps_minus1" )
	.zero	3
.LC406:
	ASCII(.string	"pTempRPset->num_of_pics(%d) out of range(0,15).\n" )
	.zero	7
.LC408:
	ASCII(.string	"num_of_pics out of range(0,15).\n" )
	.zero	7
.LC410:
	ASCII(.string	"num_negative_pics" )
	.zero	6
.LC412:
	ASCII(.string	"pTempRPset->num_negative_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC414:
	ASCII(.string	"num_positive_pics" )
	.zero	6
.LC416:
	ASCII(.string	"pTempRPset->num_positive_pics(%d) out of range(0,15).\n" )
	.zero	1
.LC418:
	ASCII(.string	"pShortTermRpset->num_of_pics(%d) out of range[0,%d].\n" )
	.zero	2
.LC420:
	ASCII(.string	"delta_poc_s0_minus1" )
	.zero	4
.LC422:
	ASCII(.string	"delta_poc_s0_minus1(%d) out of range.\n" )
	.zero	1
.LC424:
	ASCII(.string	"delta_poc_s1_minus1" )
	.zero	4
.LC426:
	ASCII(.string	"elemental_duration_in_tc_minus1" )
.LC428:
	ASCII(.string	"cpb_cnt_minus1" )
	.zero	1
.LC430:
	ASCII(.string	"cpb_cnt_minus1(%d) out of range(0,31).\n" )
.LC432:
	ASCII(.string	"bit_rate_value_minus1" )
	.zero	2
.LC434:
	ASCII(.string	"cpb_size_value_minus1" )
	.zero	2
.LC436:
	ASCII(.string	"cpb_size_du_value_minus1" )
	.zero	7
.LC438:
	ASCII(.string	"bit_rate_du_value_minus1" )
	.zero	7
.LC440:
	ASCII(.string	"vps_reserved_three_2bits(%d) not equal 0x3.\n" )
	.zero	3
.LC442:
	ASCII(.string	"vps_max_layers_minus1 out of range(0,63).\n" )
	.zero	5
.LC444:
	ASCII(.string	"vps_max_sub_layers_minus1=%d\n" )
	.zero	2
.LC446:
	ASCII(.string	"vps_reserved_0xffff_16bits not equal 0xffff.\n" )
	.zero	2
.LC448:
	ASCII(.string	"VPS HEVC_DecPTL error.\n" )
.LC450:
	ASCII(.string	"vps_num_layer_sets_minus1" )
	.zero	6
.LC452:
	ASCII(.string	"vps_max_dec_pic_buffering_minus1[i]" )
	.zero	4
.LC454:
	ASCII(.string	"vps_num_reorder_pics[i]" )
.LC456:
	ASCII(.string	"vps_max_latency_increase_plus1[i]" )
	.zero	6
.LC458:
	ASCII(.string	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\n" )
	.zero	5
.LC461:
	ASCII(.string	"layer_id_included_flag[%d][%d]" )
	.zero	1
.LC463:
	ASCII(.string	"vps_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC465:
	ASCII(.string	"vps_num_hrd_parameters" )
	.zero	1
.LC467:
	ASCII(.string	"vps_num_hrd_parameters(%d) out of range(0,%d).\n" )
.LC469:
	ASCII(.string	"hrd_layer_set_idx" )
	.zero	6
.LC471:
	ASCII(.string	"VPS HEVC_DecHrdParam error.\n" )
	.zero	3
.LC473:
	ASCII(.string	"pVPS->vps_video_parameter_set_id out of range(0,15).\n" )
	.zero	2
.LC476:
	ASCII(.string	"VPS[%d] decode error0.\n" )
.LC479:
	ASCII(.string	"VPS[%d] decode error1.\n" )
.LC482:
	ASCII(.string	"chroma_sample_loc_type_top_field" )
	.zero	7
.LC484:
	ASCII(.string	"chroma_sample_loc_type_bottom_field" )
	.zero	4
.LC486:
	ASCII(.string	"def_disp_win_left_offset" )
	.zero	7
.LC488:
	ASCII(.string	"VUI pSps->chroma_format_idc out of range(0,3).\n" )
.LC490:
	ASCII(.string	"def_disp_win_right_offset" )
	.zero	6
.LC492:
	ASCII(.string	"def_disp_win_top_offset" )
.LC494:
	ASCII(.string	"def_disp_win_bottom_offset" )
	.zero	5
.LC496:
	ASCII(.string	"vui_num_ticks_poc_diff_one_minus1" )
	.zero	6
.LC498:
	ASCII(.string	"VUI HEVC_DecHrdParam error.\n" )
	.zero	3
.LC500:
	ASCII(.string	"min_spatial_segmentation_idc" )
	.zero	3
.LC502:
	ASCII(.string	"VUI min_spatial_segmentation_idc out of range(0,4095).\n" )
.LC504:
	ASCII(.string	"max_bytes_per_pic_denom" )
.LC506:
	ASCII(.string	"max_bits_per_min_cu_denom" )
	.zero	6
.LC508:
	ASCII(.string	"log2_max_mv_length_horizontal" )
	.zero	2
.LC510:
	ASCII(.string	"log2_max_mv_length_vertical" )
	.zero	4
.LC512:
	ASCII(.string	"sop_seq_parameter_set_id" )
	.zero	7
.LC514:
	ASCII(.string	"num_entries_in_sop_minus1" )
	.zero	6
.LC516:
	ASCII(.string	"num_entries_in_sop_minus1 out of range(0,1024)\n" )
.LC518:
	ASCII(.string	"sop_short_term_rps_idx" )
	.zero	1
.LC520:
	ASCII(.string	"sop_poc_delta" )
	.zero	2
.LC522:
	ASCII(.string	"recovery_poc_cnt" )
	.zero	7
.LC524:
	ASCII(.string	"colour_remap_id" )
.LC526:
	ASCII(.string	"colour_remap_coeffs" )
	.zero	4
.LC529:
	ASCII(.string	"reserved_payload_extension_data" )
.LC531:
	ASCII(.string	"line:%d Cosume TotalPos(%d > %d)!!!\n" )
	.zero	3
.LC533:
	ASCII(.string	"HEVC_SeiMessage HEVC_Sei_Payload error.\n" )
	.zero	7
.LC535:
	ASCII(.string	"SEI HEVC_SeiMessage error.\n" )
	.zero	4
.LC537:
	ASCII(.string	"SEI BsIsByteAligned error.\n" )
	.zero	4
.LC539:
	ASCII(.string	"SEI rbsp_trailing_bits(%d) not equal 0x80.\n" )
	.zero	4
.LC541:
	ASCII(.string	"nesting_num_ops_minus1" )
	.zero	1
.LC543:
	ASCII(.string	"nesting_num_ops_minus1 out of range(0,%d)\n" )
	.zero	5
.LC545:
	ASCII(.string	"nesting_op_idx" )
	.zero	1
.LC547:
	ASCII(.string	"nesting_num_layers_minus1" )
	.zero	6
.LC549:
	ASCII(.string	"nesting_num_layers_minus1 out of range(0,63)\n" )
	.zero	2
.LC554:
	ASCII(.string	"scaling_list_pred_matrix_id_delta" )
	.zero	6
.LC556:
	ASCII(.string	"scaling_list_pred_matrix_id_delta out of range(0,matrixId).\n" )
	.zero	3
.LC558:
	ASCII(.string	"HEVC_DecScalingListData pMatrixAddress NULL.\n" )
	.zero	2
.LC560:
	ASCII(.string	"scaling_list_dc_coef_minus8" )
	.zero	4
.LC562:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-7,247).\n" )
	.zero	5
.LC564:
	ASCII(.string	"scaling_list_delta_coef" )
.LC566:
	ASCII(.string	"scaling_list_dc_coef_minus8 out of range(-128,127).\n" )
	.zero	3
.LC569:
	ASCII(.string	"chroma_format_idc" )
	.zero	6
.LC571:
	ASCII(.string	"pSPS->chroma_format_idc out of range(0,3).\n" )
	.zero	4
.LC573:
	ASCII(.string	"pSPS->chroma_format_idc not equal(%d) 1.\n" )
	.zero	6
.LC575:
	ASCII(.string	"pic_width_in_luma_samples" )
	.zero	6
.LC577:
	ASCII(.string	"pic_width_in_luma_samples out of range(0,8192).\n" )
	.zero	7
.LC579:
	ASCII(.string	"pic_height_in_luma_samples" )
	.zero	5
.LC581:
	ASCII(.string	"pic_height_in_luma_samples out of range(0,4096).\n" )
	.zero	6
.LC583:
	ASCII(.string	"ERROR Unkown level: %d\n" )
.LC585:
	ASCII(.string	"conf_win_left_offset" )
	.zero	3
.LC588:
	ASCII(.string	"conf_win_right_offset" )
	.zero	2
.LC590:
	ASCII(.string	"conf_win_left_offset+conf_win_right_offset out of range.\n" )
	.zero	6
.LC592:
	ASCII(.string	"conf_win_top_offset" )
	.zero	4
.LC594:
	ASCII(.string	"conf_win_bottom_offset" )
	.zero	1
.LC596:
	ASCII(.string	"conf_win_top_offset+conf_win_bottom_offset out of range.\n" )
	.zero	6
.LC598:
	ASCII(.string	"bit_depth_luma_minus8" )
	.zero	2
.LC600:
	ASCII(.string	"bit_depth_luma(%d) out of range(8,14).\n" )
.LC602:
	ASCII(.string	"bit_depth_chroma_minus8" )
.LC604:
	ASCII(.string	"bit_depth_chroma(%d) out of range[8,14].\n" )
	.zero	6
.LC606:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4" )
	.zero	6
.LC608:
	ASCII(.string	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12].\n" )
	.zero	1
.LC610:
	ASCII(.string	"sps_max_dec_pic_buffering_minus1" )
	.zero	7
.LC612:
	ASCII(.string	"sps_num_reorder_pics" )
	.zero	3
.LC614:
	ASCII(.string	"sps_max_latency_increase_plus1" )
	.zero	1
.LC616:
	ASCII(.string	"log2_min_coding_block_size_minus3" )
	.zero	6
.LC618:
	ASCII(.string	"log2_min_luma_coding_block_size_minus3 out of range(0,3).\n" )
	.zero	5
.LC620:
	ASCII(.string	"log2_diff_max_min_coding_block_size" )
	.zero	4
.LC622:
	ASCII(.string	"log2_diff_max_min_luma_coding_block_size out of range(0,3).\n" )
	.zero	3
.LC624:
	ASCII(.string	"log2_ctb_sizeY out of range(4,6).\n" )
	.zero	5
.LC626:
	ASCII(.string	"log2_min_transform_block_size_minus2" )
	.zero	3
.LC628:
	ASCII(.string	"log2_min_transform_block_size_minus2 out of range(0,3).\n" )
	.zero	7
.LC630:
	ASCII(.string	"log2_diff_max_min_transform_block_size" )
	.zero	1
.LC632:
	ASCII(.string	"log2_diff_max_min_transform_block_size out of range(0,3).\n" )
	.zero	5
.LC634:
	ASCII(.string	"quadtree_tu_log2_min_size not less than log2_min_cb_sizeY.\n" )
	.zero	4
.LC636:
	ASCII(.string	"quadtree_tu_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC638:
	ASCII(.string	"max_transform_hierarchy_depth_inter" )
	.zero	4
.LC640:
	ASCII(.string	"max_transform_hierarchy_depth_inter out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC642:
	ASCII(.string	"max_transform_hierarchy_depth_intra" )
	.zero	4
.LC644:
	ASCII(.string	"max_transform_hierarchy_depth_intra out of range(0,CtbLog2SizeY-Log2MinTrafoSize).\n" )
	.zero	4
.LC646:
	ASCII(.string	"SPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC648:
	ASCII(.string	"SPS sao is off and pic height(%d) is too small.(Logic Unsupported).\n" )
	.zero	3
.LC651:
	ASCII(.string	"log2_min_pcm_luma_coding_block_size_minus3" )
	.zero	5
.LC653:
	ASCII(.string	"log2_min_pcm_coding_block_size_minus3(%d) out of range[0,2].\n" )
	.zero	2
.LC655:
	ASCII(.string	"log2_diff_max_min_pcm_luma_coding_block_size" )
	.zero	3
.LC657:
	ASCII(.string	"log2_diff_max_min_pcm_coding_block_size(%d) out of range[0,2].\n" )
.LC659:
	ASCII(.string	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5 ).\n" )
.LC661:
	ASCII(.string	"num_short_term_ref_pic_sets" )
	.zero	4
.LC663:
	ASCII(.string	"num_short_term_ref_pic_sets out of range[0,%d].\n" )
	.zero	7
.LC665:
	ASCII(.string	"SPS HEVC_DecShortTermRefPicSet error.\n" )
	.zero	1
.LC667:
	ASCII(.string	"num_long_term_ref_pic_sps" )
	.zero	6
.LC669:
	ASCII(.string	"num_long_term_ref_pic_sps out of range[0,32].\n" )
	.zero	1
.LC671:
	ASCII(.string	"SPS HEVC_DecVuiParam error.\n" )
	.zero	3
.LC675:
	ASCII(.string	"sps_video_parameter_set_id out of range(0,%d).\n" )
.LC677:
	ASCII(.string	"sps_max_sub_layers_minus1 out of range(0,%d).\n" )
	.zero	1
.LC679:
	ASCII(.string	"SPS HEVC_DecPTL error.\n" )
.LC681:
	ASCII(.string	"sps_seq_parameter_set_id" )
	.zero	7
.LC683:
	ASCII(.string	"sps_seq_parameter_set_id out of range(0,%d).\n" )
	.zero	2
.LC686:
	ASCII(.string	"SPS[%d] decode error0.\n" )
.LC688:
	ASCII(.string	"SPS[%d] decode error.\n" )
	.zero	1
.LC691:
	ASCII(.string	"pps_seq_parameter_set_id" )
	.zero	7
.LC693:
	ASCII(.string	"pic_parameter_set_id(%d) out of range[0,15].\n" )
	.zero	2
.LC695:
	ASCII(.string	"SPS(%d) haven't decode.\n" )
	.zero	7
.LC697:
	ASCII(.string	"num_ref_idx_l0_default_active_minus1" )
	.zero	3
.LC699:
	ASCII(.string	"num_ref_idx_l0_default_active out of range[0,15].\n" )
	.zero	5
.LC701:
	ASCII(.string	"num_ref_idx_l1_default_active_minus1" )
	.zero	3
.LC703:
	ASCII(.string	"num_ref_idx_l1_default_active out of range[0,15].\n" )
	.zero	5
.LC705:
	ASCII(.string	"init_qp_minus26" )
.LC707:
	ASCII(.string	"pic_init_qp(%d) out of range[-%d,51].\n" )
	.zero	1
.LC709:
	ASCII(.string	"diff_cu_qp_delta_depth" )
	.zero	1
.LC711:
	ASCII(.string	"diff_cu_qp_delta_depth out of range[0,3].\n" )
	.zero	5
.LC713:
	ASCII(.string	"pps_cb_qp_offset" )
	.zero	7
.LC715:
	ASCII(.string	"pic_cb_qp_offset out of range[-12,12].\n" )
.LC717:
	ASCII(.string	"pps_cr_qp_offset" )
	.zero	7
.LC719:
	ASCII(.string	"pic_cr_qp_offset out of range[-12,12].\n" )
.LC721:
	ASCII(.string	"num_tile_columns_minus1" )
.LC723:
	ASCII(.string	"num_tile_columns(%d) out of range(0,%d).\n" )
	.zero	6
.LC725:
	ASCII(.string	"num_tile_rows_minus1" )
	.zero	3
.LC727:
	ASCII(.string	"num_tile_rows out(%d) of range(0,%d).\n" )
	.zero	1
.LC729:
	ASCII(.string	"Logic limit(%d), num_tile_columns(%d) exceed.\n" )
	.zero	1
.LC732:
	ASCII(.string	"Logic limit(%d), num_tile_rows(%d) exceed.\n" )
	.zero	4
.LC734:
	ASCII(.string	"column_width_minus1" )
	.zero	4
.LC736:
	ASCII(.string	"column_width[%d](%d) out of range (0 %d)\n" )
	.zero	6
.LC738:
	ASCII(.string	"row_height_minus1" )
	.zero	6
.LC740:
	ASCII(.string	"row_height[%d](%d) out of range (0 %d)\n" )
.LC742:
	ASCII(.string	"column_bd[%d](%d) <= 0, invalid!\n" )
	.zero	6
.LC744:
	ASCII(.string	"row_bd[%d](%d) <= 0, invalid!\n" )
	.zero	1
.LC746:
	ASCII(.string	"PPS tile width(%d) is too small.(Logic Unsupport)\n" )
	.zero	5
.LC748:
	ASCII(.string	"PPS tile height(%d) is too small.(Logic Unsupport)\n" )
	.zero	4
.LC750:
	ASCII(.string	"pps_beta_offset_div2" )
	.zero	3
.LC752:
	ASCII(.string	"pps_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	2
.LC754:
	ASCII(.string	"pps_tc_offset_div2" )
	.zero	5
.LC756:
	ASCII(.string	"pps_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	4
.LC758:
	ASCII(.string	"PPS HEVC_DecScalingListData error.\n" )
	.zero	4
.LC760:
	ASCII(.string	"log2_parallel_merge_level_minus2" )
	.zero	7
.LC762:
	ASCII(.string	"log2_parallel_merge_level(%d) out of range(2,log2_ctb_sizeY).\n" )
	.zero	1
.LC764:
	ASCII(.string	"pps_pic_parameter_set_id" )
	.zero	7
.LC766:
	ASCII(.string	"pic_parameter_set_id(%d) out of range(0,%d).\n" )
	.zero	2
.LC769:
	ASCII(.string	"PPS[%d] decode error.\n" )
	.zero	1
.LC773:
	ASCII(.string	"luma_log2_weight_denom" )
	.zero	1
.LC775:
	ASCII(.string	"luma_log2_weight_denom out of range(0,7).\n" )
	.zero	5
.LC777:
	ASCII(.string	"delta_chroma_log2_weight_denom" )
	.zero	1
.LC779:
	ASCII(.string	"delta_chroma_log2_weight_denom out of range(-7,7).\n" )
	.zero	4
.LC781:
	ASCII(.string	"chroma_log2_weight_denom out of range(0,7).\n" )
	.zero	3
.LC783:
	ASCII(.string	"delta_luma_weight_l0" )
	.zero	3
.LC785:
	ASCII(.string	"delta_luma_weight_l0(%d) out of range(-128,127).\n" )
	.zero	6
.LC787:
	ASCII(.string	"luma_offset_l0" )
	.zero	1
.LC789:
	ASCII(.string	"luma_offset_l0(%d) out of range(-128,127).\n" )
	.zero	4
.LC791:
	ASCII(.string	"delta_chroma_weight_l0" )
	.zero	1
.LC793:
	ASCII(.string	"delta_chroma_weight_l0 out of range(-128,127).\n" )
.LC795:
	ASCII(.string	"delta_chroma_offset_l0" )
	.zero	1
.LC797:
	ASCII(.string	"delta_chroma_offset_l0 out of range(-512,511).\n" )
.LC799:
	ASCII(.string	"delta_luma_weight_l1" )
	.zero	3
.LC801:
	ASCII(.string	"delta_luma_weight_l1 out of range(-128,127).\n" )
	.zero	2
.LC803:
	ASCII(.string	"luma_offset_l1" )
	.zero	1
.LC805:
	ASCII(.string	"luma_offset_l1 out of range(-128,127).\n" )
.LC807:
	ASCII(.string	"delta_chroma_weight_l1" )
	.zero	1
.LC809:
	ASCII(.string	"delta_chroma_weight_l1 out of range(-128,127).\n" )
.LC811:
	ASCII(.string	"delta_chroma_offset_l1" )
	.zero	1
.LC813:
	ASCII(.string	"delta_chroma_offset_l1 out of range(-512,511).\n" )
.LC815:
	ASCII(.string	"slice_pic_parameter_set_id" )
	.zero	5
.LC818:
	ASCII(.string	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\n" )
	.zero	6
.LC820:
	ASCII(.string	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\n" )
.LC822:
	ASCII(.string	"max_cu_width(%d)/max_cu_height(%d) = 0\n" )
.LC824:
	ASCII(.string	"slice_segment_address(%d) out of range(0,%d).\n" )
	.zero	1
.LC826:
	ASCII(.string	"slice_type" )
	.zero	5
.LC828:
	ASCII(.string	"slice_reserved_flag: %d\n" )
	.zero	7
.LC830:
	ASCII(.string	"slice_type(%d) out of range(0,2].\n" )
	.zero	5
.LC832:
	ASCII(.string	"HEVC_ClearDPB,LastDisplayPoc:%d poc:%d \n" )
	.zero	7
.LC834:
	ASCII(.string	"SH HEVC_DecShortTermRefPicSet error.\n" )
	.zero	2
.LC836:
	ASCII(.string	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\n" )
	.zero	4
.LC838:
	ASCII(.string	"num_long_term_sps" )
	.zero	6
.LC840:
	ASCII(.string	"num_long_term_sps(%d) out of range[0,%d].\n" )
	.zero	5
.LC842:
	ASCII(.string	"num_long_term_pics" )
	.zero	5
.LC844:
	ASCII(.string	"SH ERROR: (num_negative_pics(%d) + num_positive_pics(%d) + num_of_longterm_pics(%d)) > %d\n" )
	.zero	5
.LC846:
	ASCII(.string	"lt_idx_sps[%d] = %d, but out of range[0,%d].\n" )
	.zero	2
.LC848:
	ASCII(.string	"delta_poc_msb_cycle_lt" )
	.zero	1
.LC850:
	ASCII(.string	"ERROR: pRPS->num_of_pics(%d) > %d.\n" )
	.zero	4
.LC852:
	ASCII(.string	"num_ref_idx_l0_active_minus1" )
	.zero	3
.LC854:
	ASCII(.string	"num_ref_idx_l0_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC856:
	ASCII(.string	"num_ref_idx_l1_active_minus1" )
	.zero	3
.LC858:
	ASCII(.string	"num_ref_idx_l1_active(%d) out of range(0,%d).\n" )
	.zero	1
.LC860:
	ASCII(.string	"pRPS is null.\n" )
	.zero	1
.LC862:
	ASCII(.string	"pRPS->num_of_pics out(%d) of range(0,%d).\n" )
	.zero	5
.LC864:
	ASCII(.string	"SH HEVC_DecRefPicListsModification error.\n" )
	.zero	5
.LC866:
	ASCII(.string	"collocated_ref_idx" )
	.zero	5
.LC868:
	ASCII(.string	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) out of range(0,%d).\n" )
.LC870:
	ASCII(.string	"SH HEVC_DecPredWeightTable error.\n" )
	.zero	5
.LC872:
	ASCII(.string	"five_minus_max_num_merge_cand" )
	.zero	2
.LC874:
	ASCII(.string	"SH max_num_merge_cand(%d) out of range(1,5).\n" )
	.zero	2
.LC876:
	ASCII(.string	"slice_qp_delta" )
	.zero	1
.LC878:
	ASCII(.string	"SH slice_qp(%d) out of range [-%d,51].\n" )
.LC880:
	ASCII(.string	"slice_cb_qp_offset" )
	.zero	5
.LC882:
	ASCII(.string	"SH slice_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC884:
	ASCII(.string	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out of range[-12,12].\n" )
	.zero	2
.LC886:
	ASCII(.string	"slice_cr_qp_offset" )
	.zero	5
.LC888:
	ASCII(.string	"SH slice_cr_qp_offset(%d) out of range[-12,12].\n" )
	.zero	7
.LC890:
	ASCII(.string	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) out of range[-12,12].\n" )
.LC892:
	ASCII(.string	"slice_beta_offset_div2" )
	.zero	1
.LC894:
	ASCII(.string	"SH slice_beta_offset_div2(%d) out of range(-6,6).\n" )
	.zero	5
.LC896:
	ASCII(.string	"slice_tc_offset_div2" )
	.zero	3
.LC898:
	ASCII(.string	"SH slice_tc_offset_div2(%d) out of range(-6,6).\n" )
	.zero	7
.LC900:
	ASCII(.string	"num_entry_point_offsets" )
.LC902:
	ASCII(.string	"CurrSlice.num_entry_point_offsets(%d) out of range[0,%d].\n" )
	.zero	5
.LC904:
	ASCII(.string	"offset_len_minus1" )
	.zero	6
.LC906:
	ASCII(.string	"CurrSlice.offset_len(%d) out of range[1,32].\n" )
	.zero	2
.LC908:
	ASCII(.string	"slice_segment_header_extension_length" )
	.zero	2
.LC910:
	ASCII(.string	"slice_segment_header_extension_length(%d) out of range [0,256]\n" )
.LC912:
	ASCII(.string	"bitsLeft(%d) < slice_segment_header_extension_length(%d)\n" )
	.zero	6
.LC916:
	ASCII(.string	"%s arrange mem failed.\n" )
.LC918:
	ASCII(.string	"Init dec para\n" )
	.zero	1
.LC923:
	ASCII(.string	"%s: Get context addr failed!\n" )
	.zero	2
.LC925:
	ASCII(.string	"%s FATAL: MemOffset %d > ContextMemSize %d.\n" )
	.zero	3
.LC927:
	ASCII(.string	"%s: VCTRL_GetChanIDByCtx() return -1!\n" )
	.zero	1
.LC930:
	ASCII(.string	"BitDepthChange ReRange FS Luma(%d-->%d),Chroma(%d -->%d)\n" )
	.zero	6
.LC932:
	ASCII(.string	"HEVC_InitDPB error, return %d\n" )
	.zero	1
.LC934:
	ASCII(.string	"HEVC_AllocFrameStore error\n" )
	.zero	4
.LC937:
	ASCII(.string	"%s: pstLogicFsImage is NULL!\n" )
	.zero	2
.LC939:
	ASCII(.string	"HEVC InsertVO Failed return %d, ClearAll\n" )
	.zero	6
.LC941:
	ASCII(.string	"HEVC.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC944:
	ASCII(.string	"[%d]disp=%d,poc=%d,lpoc=%d,no=%d,pics=%d,cpoc=%d,flag=%d\n" )
	.zero	6
.LC947:
	ASCII(.string	"%s: FirstFrameFastOut LastPoc: %d, CurPos: %d!\n" )
.LC951:
	ASCII(.string	"%s call HEVC_GetUnRefPicWithMinPoc failed\n" )
	.zero	5
.LC953:
	ASCII(.string	"%s call HEVC_OutputOneFrmFromDPB failed\n" )
	.zero	7
.LC956:
	ASCII(.string	"%s: HEVC_OutputFrmToVO err!\n" )
	.zero	3
.LC958:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC960:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC962:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC964:
	ASCII(.string	"No frame store available!\n" )
	.zero	5
.LC967:
	ASCII(.string	"%s ReadImgNum = %d, NewImgNum = %d, FrameStore leak, ClearAll!\n" )
.LC970:
	ASCII(.string	"%s: flush dpb failed, return %d\n" )
	.zero	7
.LC973:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), need to increase DPB size.\n" )
	.zero	5
.LC975:
	ASCII(.string	"%s call HEVC_IncreaseDPBSize failed\n" )
	.zero	3
.LC977:
	ASCII(.string	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpoc frame.\n" )
	.zero	3
.LC982:
	ASCII(.string	"%s with invalid pos(%d)\n" )
	.zero	7
.LC985:
	ASCII(.string	"%s get APC error, ret %d\n" )
	.zero	6
.LC988:
	ASCII(.string	"%s %d: InsertFrmInDPB failed, return %d\n" )
	.zero	7
.LC990:
	ASCII(.string	"%s call HEVC_CheckFrameStore failed!\n" )
	.zero	2
.LC994:
	ASCII(.string	"%s call HEVC_RemoveUnUsedFrameStore Failed.\n" )
	.zero	3
.LC996:
	ASCII(.string	"%s call HEVC_InsertFrmInDPB Failed.\n" )
	.zero	3
.LC1001:
	ASCII(.string	"%s call HEVC_FirstFrameFastOut Failed\n" )
	.zero	1
.LC1003:
	ASCII(.string	"DPB.used_size may bigger than DPB.size\n" )
.LC1005:
	ASCII(.string	"HEVC_InsertFrmInDPB Failed, ret = %d\n" )
	.zero	2
.LC1007:
	ASCII(.string	"%s call HEVC_OutputFrmFromDPB failed\n" )
	.zero	2
.LC1012:
	ASCII(.string	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_NORMAL\n" )
	.zero	5
.LC1014:
	ASCII(.string	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\n" )
	.zero	1
.LC1016:
	ASCII(.string	"%s call HEVC_IModeProcess Failed\n" )
	.zero	6
.LC1018:
	ASCII(.string	"HEVC_StorePicInDpb return(%d) from L%d\n" )
.LC1020:
	ASCII(.string	"%s call HEVC_SimpleDPBProcess Failed\n" )
	.zero	2
.LC1022:
	ASCII(.string	"%s call HEVC_DecOrderProcess Failed\n" )
	.zero	3
.LC1024:
	ASCII(.string	"%s call HEVC_DispOrderProcess Failed\n" )
	.zero	2
.LC1026:
	ASCII(.string	"%s return HEVC_DEC_ERR\n" )
.LC1028:
	ASCII(.string	"No frame store for lost pic.\n" )
	.zero	2
.LC1030:
	ASCII(.string	"DPB ERROR: Can not get ref_fs!\n" )
.LC1032:
	ASCII(.string	"DPB no suited fs for lost pic.\n" )
.LC1034:
	ASCII(.string	"Take poc(%d) to creat lost poc(%d).\n" )
	.zero	3
.LC1036:
	ASCII(.string	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\n" )
	.zero	5
.LC1038:
	ASCII(.string	"ERROR: Can not new logic fs!\n" )
	.zero	2
.LC1040:
	ASCII(.string	"Lost pic insert in DPB Failed!\n" )
.LC1042:
	ASCII(.string	"Ref frame(poc %d) lost.\n" )
	.zero	7
.LC1044:
	ASCII(.string	"s32OutErrThr = %d,drop poc %d because lost ref frame(pod %d)\n" )
	.zero	2
.LC1048:
	ASCII(.string	"%s call HEVC_FlushOutputFrmFromDPB failed\n" )
	.zero	5
.LC1050:
	ASCII(.string	"%s call HEVC_EmptyFrmFromDPB failed\n" )
	.zero	3
.LC1052:
	ASCII(.string	"Init pic err, exit\n" )
	.zero	4
.LC1054:
	ASCII(.string	"HEVC_WritePicMsg failed!\n" )
	.zero	6
.LC1056:
	ASCII(.string	"Start Reason: SliceParaNum= %d\n" )
.LC1059:
	ASCII(.string	"Too many slice , err!\n" )
	.zero	1
.LC1061:
	ASCII(.string	"Cur pic not init yet, discard this slice!\n" )
	.zero	5
.LC1063:
	ASCII(.string	"Dec List error, ret=%d\n" )
.LC1065:
	ASCII(.string	"Ref List is Wrong!\n" )
	.zero	4
.LC1067:
	ASCII(.string	"HEVC_WriteSliceMsg err.\n" )
	.zero	7
.LC1070:
	ASCII(.string	"HEVC_StorePicInDPB failed, ret = %d\n" )
	.zero	3
.LC1073:
	ASCII(.string	"DecVDM no slice and needn't start VDM, but MaxBytesReceived exceed threshold!\n" )
	.zero	1
.LC1075:
	ASCII(.string	"DecVDM no slice and needn't start VDM\n" )
	.zero	1
.LC1077:
	ASCII(.string	"IPBDecMode Changed (%d -> %d)\n" )
	.zero	1
.LC1080:
	ASCII(.string	"Discard this B(poc=%d) before P, is_ref_idc=%d.\n" )
	.zero	7
.LC1082:
	ASCII(.string	"VDM start, TotalPicNum=%d.\n" )
	.zero	4
.LC1085:
	ASCII(.string	"%s no correct slice in the pic\n" )
.LC1088:
	ASCII(.string	"metadatasize is too large:%d at line:%d\n" )
	.zero	7
.LC1091:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC1095:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC1098:
	ASCII(.string	"*****[%s][%d],BL Codec can only dec BL stream!!*****\n" )
	.zero	2
.LC1100:
	ASCII(.string	"%s: Metadata map failed\n" )
	.zero	7
.LC1102:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC1104:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC1107:
	ASCII(.string	"VPS decode error.\n" )
	.zero	5
.LC1110:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1112:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC1114:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1116:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d\n" )
.LC1120:
	ASCII(.string	"CtbNumOneFrame=%d, SedEnd0=%d\n" )
	.zero	1
.LC1123:
	ASCII(.string	"HEVC_DecSliceSegmentHeader dec err\n" )
	.zero	4
.LC1126:
	ASCII(.string	"CurBitsLen = %d, MinBitsLen = %d\n" )
	.zero	6
.LC1128:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pPacket!\n" )
	.zero	1
.LC1130:
	ASCII(.string	"HevcCtx not init!\n" )
	.zero	5
.LC1132:
	ASCII(.string	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\n" )
	.zero	6
.LC1136:
	ASCII(.string	"%s last frame fs unrelease, fix it!\n" )
	.zero	3
.LC1140:
	ASCII(.string	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	4
.LC1143:
	ASCII(.string	"HEVC_InquireSliceProperty error.\n" )
	.zero	6
.LC1146:
	ASCII(.string	"HEVC_DecOneNal ERR\n" )
	.zero	4
.LC1151:
	ASCII(.string	"%s pstLogicFsImage is NULL!\n" )
	.zero	3
.LC1153:
	ASCII(.string	"%s InsertVO err:%d, ClearAll\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
.LANCHOR2 = . + 456960
.LANCHOR3 = . + 604928
.LANCHOR6 = . + 639744
	.type	s_auiSigLastScan, %object
	.size	s_auiSigLastScan, 458752
s_auiSigLastScan:
	.zero	458752
	.type	g_TsToRsMap, %object
	.size	g_TsToRsMap, 147456
g_TsToRsMap:
	.zero	147456
	.type	g_IsDeced, %object
	.size	g_IsDeced, 36864
g_IsDeced:
	.zero	36864
	.type	s_TmpParam, %object
	.size	s_TmpParam, 26164
s_TmpParam:
	.zero	26164
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
