#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mpeg2.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	MP2_SearchStartCode.part.1, %function
MP2_SearchStartCode.part.1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x4, x20, x19, sxtw
	add	x2, x20, 2
	.p2align 2
.L12:
	cmp	x4, x2
	bls	.L2
.L15:
	ldrb	w3, [x2]
	cmp	w3, 1
	bls	.L14
.L8:
	add	x2, x2, 3
	cmp	x4, x2
	bhi	.L15
.L2:
	sub	w0, w19, #3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L14:
	cbnz	w3, .L5
	ldrb	w3, [x2, -1]
	cbnz	w3, .L6
	add	x2, x2, 1
	b	.L12
	.p2align 3
.L5:
	bne	.L12
	ldrb	w0, [x2, -2]
	cbnz	w0, .L8
	ldrb	w0, [x2, -1]
	cbnz	w0, .L8
	sub	x2, x2, x20
	sub	w0, w2, #2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L6:
	ldrb	w1, [x2, 1]
	add	x0, x2, 2
	add	x2, x2, 4
	cmp	w1, wzr
	csel	x2, x2, x0, ne
	b	.L12
	.size	MP2_SearchStartCode.part.1, .-MP2_SearchStartCode.part.1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_VerifyMemPara
	.type	MP2_VerifyMemPara, %function
MP2_VerifyMemPara:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	MP2_VerifyMemPara, .-MP2_VerifyMemPara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ArrangeVHBMem
	.type	MP2_ArrangeVHBMem, %function
MP2_ArrangeVHBMem:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 90112
	bl	_mcount
	ldr	x0, [x20, 232]
	ldp	w2, w3, [x0, 48]
	cmp	w2, 31
	bls	.L19
	mov	w1, 8160
	sub	w4, w3, #32
	mov	w0, 8192
	cmp	w4, w1
	ccmp	w2, w0, 2, ls
	bhi	.L19
	ldr	x0, [x19]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L49
	mov	w22, w2
	mov	w21, w3
	mov	w24, 5
	mov	w23, 2
	mov	w25, 3
.L28:
	ldr	x0, .LC5
	mov	w1, 0
	mov	x2, 32
	ldr	x3, [x0, 96]
	add	x0, x29, 96
	blr	x3
	strb	wzr, [x29, 97]
	ldr	x0, [x19]
	stp	w22, w21, [x29, 120]
	stp	w22, w21, [x29, 104]
	ldr	w1, [x0, 28]
	cmp	w1, 24
	beq	.L33
	strb	w25, [x29, 99]
	sxtb	w1, w23
	strb	w24, [x29, 101]
.L39:
	ldr	w2, [x0, 708]
	ldr	w3, [x0, 712]
	strb	w1, [x29, 102]
	mul	w0, w22, w21
	mul	w1, w2, w3
	strb	wzr, [x29, 98]
	cmp	w0, w1
	ble	.L34
	ldr	x1, .LC7
	mov	w4, w22
	mov	w5, w21
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, .LC8
	ldr	x4, [x0]
	cbz	x4, .L42
	ldr	w0, [x20, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
	b	.L43
	.p2align 3
.L19:
	ldr	x1, .LC2
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
.L43:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L34:
	ldr	w0, [x20, 856]
	add	x1, x29, 96
	bl	FSP_ConfigInstance
	cbnz	w0, .L35
	ldr	x1, [x19]
	add	x3, x29, 92
	ldr	w0, [x20, 856]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L50
	mov	w0, 1
	cbz	w1, .L43
.L37:
	ldr	x1, .LC10
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L43
	.p2align 3
.L49:
	ldr	w1, [x0, 748]
	cbz	w1, .L51
	ldr	w4, [x0, 708]
	ldr	w5, [x0, 712]
	cmp	w2, w4
	bhi	.L30
	cmp	w3, w5
	bhi	.L30
	ldr	w4, [x0, 736]
	mov	w22, w2
	ldr	w1, [x0, 732]
	mov	w21, w3
	mov	w23, 1
	add	w25, w1, 2
	cbz	w4, .L32
.L47:
	add	w1, w1, w23
	mov	w23, 17
	cmp	w1, w23
	csel	w23, w1, w23, le
.L32:
	ldrsb	w24, [x0, 756]
	b	.L28
	.p2align 3
.L35:
	ldr	x1, .LC12
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L43
	.p2align 3
.L51:
	ldr	w22, [x0, 708]
	cmp	w2, w22
	bhi	.L52
	ldr	w21, [x0, 712]
	cmp	w3, w21
	bhi	.L53
	ldr	w2, [x0, 736]
	mov	w23, 1
	ldr	w1, [x0, 732]
	add	w25, w1, 2
	cbnz	w2, .L47
	ldrsb	w24, [x0, 756]
	b	.L28
	.p2align 3
.L33:
	mov	w1, 1
	strb	w24, [x29, 101]
	strb	w1, [x29, 99]
	mov	w1, 1
	b	.L39
	.p2align 3
.L30:
	ldr	x1, .LC4
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L43
	.p2align 3
.L42:
	mov	w0, -1
	b	.L43
.L53:
	mov	w5, w21
.L25:
	ldr	x1, .LC4
	mov	w4, w22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L43
.L52:
	ldr	w5, [x0, 712]
	b	.L25
.L50:
	add	x0, x20, 248
	bl	ResetVoQueue
	b	.L37
	.size	MP2_ArrangeVHBMem, .-MP2_ArrangeVHBMem
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	g_event_report
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC12:
	.xword	.LC11
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecodingDecide
	.type	MP2_DecodingDecide, %function
MP2_DecodingDecide:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x19, x26, 45056
	mov	w20, -1
	bl	_mcount
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w3, [x0, 2636]
	tbnz	x3, 23, .L134
.L55:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L134:
	add	x21, x26, 90112
	ldr	x22, [x21, 232]
	ldrb	w1, [x22, 9]
	cmp	w1, 3
	beq	.L56
	ldr	w0, [x0, 2648]
	cmp	w0, 1
	beq	.L56
	ands	w20, w3, 255
	bne	.L135
.L58:
	add	x23, x19, 312
	add	x23, x23, 40960
	ldr	w0, [x23, 2704]
	cbz	w0, .L136
	ldr	w0, [x23, 2624]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x26]
	ldr	w2, [x0, 8]
	bls	.L137
.L62:
	add	x0, x19, 312
	sub	w1, w2, #1
	add	x0, x0, 40960
	cmp	w1, 3
	str	w2, [x0, 2624]
	bls	.L138
	ldrb	w28, [x22, 22]
	mov	w25, 1
	ldrb	w4, [x22, 9]
.L73:
	add	x23, x19, 312
	add	x24, x26, 86016
	add	x23, x23, 40960
	ldr	w0, [x23, 2568]
	ldr	w27, [x23, 2708]
	ldr	w2, [x23, 2644]
	add	w27, w27, w0
	add	x0, x24, 3224
	stp	w4, w2, [x29, 104]
	bl	BsPos
	add	w5, w27, w0, lsr 3
	ldr	x1, .LC22
	mov	w3, w28
	ldp	w4, w2, [x29, 104]
	mov	w0, 18
	bl	dprint_vfmw
	ldr	w1, [x23, 2636]
	mov	w0, -14155777
	and	w0, w1, w0
	str	w0, [x23, 2636]
	ldr	x0, [x26]
	ldr	w0, [x0, 652]
	cmp	w0, 1
	beq	.L139
	ldr	w0, [x23, 2696]
	cbz	w0, .L140
	cmp	w0, 1
	bls	.L141
.L84:
	add	x23, x19, 312
	ldr	w0, [x21, 856]
	add	x23, x23, 40960
	ldr	w1, [x23, 2732]
	bl	FSP_GetFsImagePtr
	mov	x27, x0
	ldr	w1, [x23, 2736]
	ldr	w0, [x21, 856]
	bl	FSP_GetFsImagePtr
	cmp	x27, xzr
	ccmp	x0, xzr, 4, ne
	beq	.L142
	ldrb	w1, [x22, 22]
	cmp	w1, 2
	beq	.L143
	cmp	w1, 3
	beq	.L144
.L92:
	cbnz	w25, .L106
	ldrb	w0, [x22, 9]
	cmp	w0, 3
	beq	.L98
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w0, [x0, 2648]
	cbnz	w0, .L55
.L98:
	ldrb	w0, [x22, 27]
	cmp	w0, 1
	beq	.L145
	ldrb	w0, [x22, 18]
	cmp	w0, 1
	beq	.L146
	add	x1, x19, 312
	add	x1, x1, 40960
	ldr	w0, [x1, 2820]
	add	w0, w0, 1
	str	w0, [x1, 2820]
	lsl	w0, w0, 1
	str	w0, [x1, 2816]
.L100:
	ldr	w0, [x24, 3124]
	add	x19, x19, 312
	add	x19, x19, 40960
	add	w0, w0, 1
	str	w0, [x24, 3124]
	ldr	w0, [x19, 2644]
	add	w0, w0, 1
	str	w0, [x19, 2644]
	b	.L55
	.p2align 3
.L135:
	ldr	x0, .LC13
	ldr	x4, [x0]
	cbz	x4, .L59
	ldr	w0, [x21, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 103
	blr	x4
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w3, [x0, 2636]
.L59:
	add	x19, x19, 312
	ldr	x1, .LC15
	add	x19, x19, 40960
	mov	w0, 22
	mov	w20, 0
	ldr	w2, [x19, 2644]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L56:
	ldr	w0, [x21, 860]
	ands	w20, w3, 255
	add	w0, w0, 1
	str	w0, [x21, 860]
	beq	.L58
	b	.L135
	.p2align 3
.L138:
	ldr	x0, .LC20
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx69
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx69:
	.section	.rodata
	.align	0
	.align	2
.L69:
	.byte	(.L68 - .Lrtx69) / 4
	.byte	(.L70 - .Lrtx69) / 4
	.byte	(.L71 - .Lrtx69) / 4
	.byte	(.L72 - .Lrtx69) / 4
	.text
	.p2align 3
.L140:
	ldrb	w1, [x22, 22]
	sub	w0, w1, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L147
.L87:
	cmp	w1, 3
	bne	.L84
	ldr	x1, .LC30
	mov	w0, 1
	mov	w25, 0
	bl	dprint_vfmw
	b	.L84
	.p2align 3
.L144:
	cbz	x27, .L148
	ldr	x1, [x26]
	ldr	w2, [x27, 184]
	ldr	w3, [x1]
	cmp	w2, w3
	bhi	.L94
	ldr	w2, [x0, 184]
	cbz	x0, .L97
	cmp	w3, w2
	bcs	.L92
.L97:
	ldr	x1, .LC41
	mov	w0, 1
	bl	dprint_vfmw
	b	.L55
	.p2align 3
.L71:
	ldrb	w28, [x22, 22]
	mov	w25, 0
	ldrb	w4, [x22, 9]
	b	.L73
	.p2align 3
.L70:
	ldrb	w28, [x22, 22]
	sub	w0, w28, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L149
.L131:
	ldrb	w4, [x22, 9]
	mov	w25, 1
	b	.L73
	.p2align 3
.L68:
	ldrb	w28, [x22, 22]
	cmp	w28, 3
	bne	.L131
	ldrb	w28, [x22, 9]
	cmp	w28, 3
	beq	.L150
.L79:
	add	x0, x19, 312
	mov	w25, 0
	add	x0, x0, 40960
	ldr	w1, [x0, 2648]
	cmp	w1, wzr
	cset	w1, eq
	str	w1, [x0, 2648]
	ldrb	w28, [x22, 22]
	ldrb	w4, [x22, 9]
	b	.L73
	.p2align 3
.L72:
	ldrb	w0, [x22, 22]
	cmp	w0, 1
	mov	w28, w0
	beq	.L151
	cmp	w0, 3
	beq	.L152
.L78:
	cmp	w0, 2
	beq	.L82
	mov	w28, w0
	b	.L131
	.p2align 3
.L139:
	ldr	w1, [x23, 2696]
	cbnz	w1, .L84
	ldrb	w1, [x22, 22]
	cmp	w1, 3
	beq	.L153
	cmp	w1, 2
	bne	.L84
	ldr	x1, .LC26
	bl	dprint_vfmw
	b	.L84
	.p2align 3
.L137:
	cmp	w2, 1
	ccmp	w2, 4, 4, hi
	bne	.L62
	ldr	x1, .LC19
	mov	w0, 2
	bl	dprint_vfmw
	ldrb	w0, [x22, 22]
	cmp	w0, 1
	beq	.L127
	ldr	w0, [x23, 2636]
	ldr	w1, [x23, 2736]
	orr	w0, w0, 128
	str	w0, [x23, 2636]
	ldr	w0, [x21, 856]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L65
	ldr	w0, [x21, 856]
	ldr	x1, [x24, 600]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x24, 608]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x24, 616]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x24, 624]
	bl	FreeUsdByDec
	add	x0, x24, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w0, [x21, 856]
	ldr	w1, [x23, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x21, 856]
	mov	w2, 1
	ldr	w1, [x23, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x23, 2732]
	str	wzr, [x23, 2736]
	ldr	w0, [x21, 856]
	bl	FSP_GetFspType
	cbnz	w0, .L154
.L65:
	add	x0, x19, 312
	add	x0, x0, 40960
	str	wzr, [x0, 2696]
.L127:
	ldr	x0, [x26]
	ldr	w2, [x0, 8]
	b	.L62
	.p2align 3
.L136:
	ldr	x1, .LC17
	mov	w0, 1
	ldr	w2, [x23, 2644]
	bl	dprint_vfmw
	b	.L55
	.p2align 3
.L143:
	cbz	x27, .L90
	ldr	x0, [x26]
	ldr	w2, [x27, 184]
	ldr	w3, [x0]
	cmp	w2, w3
	bls	.L92
	ldr	x1, .LC37
	mov	w0, 1
	bl	dprint_vfmw
	b	.L55
	.p2align 3
.L106:
	mov	w20, 1
	b	.L55
	.p2align 3
.L142:
	ldr	x2, .LC31
	mov	w3, 885
	ldr	x1, .LC33
	mov	w0, 1
	bl	dprint_vfmw
	b	.L55
.L145:
	add	x0, x19, 312
	ldrb	w1, [x22, 10]
	add	x0, x0, 40960
	ldrb	w2, [x22, 16]
	add	w2, w2, w1
	ldr	w1, [x0, 2820]
	add	w2, w2, 1
	add	w1, w2, w1
	str	w1, [x0, 2820]
	lsl	w1, w1, 1
	str	w1, [x0, 2816]
	b	.L100
.L148:
	ldr	x0, [x26]
	ldr	w2, [x27, 184]
	ldr	w3, [x0]
.L94:
	ldr	x1, .LC39
	mov	w0, 1
	bl	dprint_vfmw
	b	.L55
.L151:
	str	wzr, [x21, 868]
	ldrb	w0, [x22, 22]
	cmp	w0, 3
	bne	.L78
.L81:
	ldrb	w4, [x22, 9]
	cmp	w4, 3
	bne	.L79
	mov	w28, w4
	mov	w25, 0
	b	.L73
.L149:
	cmp	w28, 2
	beq	.L155
.L76:
	ldrb	w4, [x22, 9]
	cmp	w4, 3
	bne	.L79
	mov	w25, 0
	b	.L73
.L146:
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w2, [x0, 2820]
	ldr	w1, [x0, 2816]
	add	w2, w2, 1
	str	w2, [x0, 2820]
	ldrb	w2, [x22, 16]
	add	w2, w2, 2
	add	w1, w2, w1
	str	w1, [x0, 2816]
	b	.L100
.L82:
	mov	w25, 1
	str	w25, [x21, 868]
	ldrb	w28, [x22, 22]
	ldrb	w4, [x22, 9]
	b	.L73
.L147:
	ldr	x1, .LC28
	mov	w0, 1
	mov	w25, 0
	bl	dprint_vfmw
	b	.L84
.L152:
	ldr	w0, [x21, 868]
	cbnz	w0, .L131
	b	.L81
.L90:
	ldr	x2, .LC31
	mov	w3, 895
	ldr	x1, .LC35
	mov	w0, 1
	bl	dprint_vfmw
	b	.L55
.L153:
	ldr	x1, .LC24
	mov	w25, 0
	bl	dprint_vfmw
	b	.L84
.L155:
	ldrb	w0, [x19, 313]
	cmp	w0, 3
	beq	.L76
	ldrb	w25, [x19, 312]
	cmp	w25, 1
	bne	.L76
	ldrb	w4, [x22, 9]
	b	.L73
.L150:
	mov	w4, w28
	mov	w25, 0
	b	.L73
.L154:
	ldr	w0, [x21, 856]
	bl	FSP_GetNullLogicFs
	str	w0, [x23, 2732]
	str	w0, [x23, 2736]
	b	.L65
.L141:
	ldrb	w1, [x22, 22]
	b	.L87
	.size	MP2_DecodingDecide, .-MP2_DecodingDecide
	.align	3
.LC13:
	.xword	g_event_report
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	.L69
	.align	3
.LC22:
	.xword	.LC21
	.align	3
.LC24:
	.xword	.LC23
	.align	3
.LC26:
	.xword	.LC25
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC30:
	.xword	.LC29
	.align	3
.LC31:
	.xword	.LANCHOR0
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_EstimatePicQp
	.type	MP2_EstimatePicQp, %function
MP2_EstimatePicQp:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC42
	mov	x2, 128
	add	x0, x29, 32
	add	x1, x1, 24
	bl	memcpy
	add	x1, x19, 86016
	ldr	w0, [x19, 328]
	ldr	w1, [x1, 3004]
	cmp	w1, 1
	beq	.L157
	add	x19, x19, 90112
	ldr	x1, [x19, 232]
	ldrb	w1, [x1, 13]
	cbnz	w1, .L162
	lsl	w0, w0, 1
.L157:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L162:
	add	x1, x29, 160
	ldr	x19, [sp, 16]
	add	x0, x1, x0, sxtw 2
	ldr	w0, [x0, -128]
	ldp	x29, x30, [sp], 160
	ret
	.size	MP2_EstimatePicQp, .-MP2_EstimatePicQp
	.align	3
.LC42:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetSequenceInfo
	.type	MP2_GetSequenceInfo, %function
MP2_GetSequenceInfo:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x0
	mov	x0, x30
	add	x19, x24, 45056
	add	x20, x24, 90112
	bl	_mcount
	str	wzr, [x29, 100]
	add	x0, x19, 312
	add	x0, x0, 40960
	stp	wzr, wzr, [x29, 92]
	ldp	x21, x25, [x20, 232]
	ldr	w2, [x0, 2692]
	cmp	w2, 1
	beq	.L165
	cmp	w2, 2
	bne	.L232
	ldr	w1, [x0, 2636]
	mov	w0, 1769472
	and	w0, w1, w0
	cmp	w0, 589824
	beq	.L168
.L167:
	ldr	x1, .LC44
	mov	w0, 17
	bl	dprint_vfmw
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	beq	.L233
.L170:
	ldr	w0, [x21, 48]
	add	x2, x19, 312
	add	x2, x2, 40960
	add	w0, w0, 15
	lsr	w0, w0, 4
	str	w0, [x21, 56]
	ldr	w1, [x2, 2692]
	cmp	w1, 2
	beq	.L234
	ldr	w3, [x21, 52]
	add	w1, w3, 15
	lsr	w1, w1, 4
	stp	w1, wzr, [x21, 60]
	ldr	w2, [x2, 2692]
	cmp	w2, 2
	beq	.L235
.L173:
	add	x2, x19, 312
	add	x2, x2, 40960
	ldr	w2, [x2, 2704]
	cbz	w2, .L175
	ldr	w3, [x25, 56]
	cmp	w0, w3
	beq	.L236
.L175:
	add	x22, x19, 312
	ldr	w0, [x20, 856]
	add	x22, x22, 40960
	ldr	w1, [x22, 2736]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L178
	ldr	w0, [x20, 856]
	ldr	x1, [x23, 600]
	bl	FreeUsdByDec
	ldr	w0, [x20, 856]
	ldr	x1, [x23, 608]
	bl	FreeUsdByDec
	ldr	w0, [x20, 856]
	ldr	x1, [x23, 616]
	bl	FreeUsdByDec
	ldr	w0, [x20, 856]
	ldr	x1, [x23, 624]
	bl	FreeUsdByDec
	add	x0, x23, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w0, [x20, 856]
	ldr	w1, [x22, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 856]
	mov	w2, 1
	ldr	w1, [x22, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x22, 2732]
	str	wzr, [x22, 2736]
	ldr	w0, [x20, 856]
	bl	FSP_GetFspType
	cbnz	w0, .L237
.L178:
	add	x22, x19, 312
	add	x1, x20, 248
	add	x22, x22, 40960
	str	wzr, [x22, 2696]
	ldr	w0, [x20, 856]
	bl	FSP_ClearNotInVoQueue
	ldr	x0, [x24]
	ldr	w1, [x0, 748]
	cbnz	w1, .L180
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L238
.L180:
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2704]
	cbz	w1, .L182
	ldr	w1, [x25, 56]
	cbz	w1, .L182
	ldr	w1, [x25, 60]
	cbnz	w1, .L239
	.p2align 2
.L182:
	ldr	w0, [x20, 856]
	bl	FSP_GetFspType
	cbz	w0, .L223
	ldr	x23, .LC49
.L183:
	add	x22, x19, 312
	mov	w1, 0
	add	x22, x22, 40960
	mov	x0, x24
	str	wzr, [x22, 2704]
	str	wzr, [x22, 2720]
	bl	MP2_ArrangeVHBMem
	str	w0, [x22, 2704]
	ldr	x1, .LC51
	mov	w0, 1
	ldp	w2, w3, [x21, 56]
	lsl	w3, w3, 4
	lsl	w2, w2, 4
	bl	dprint_vfmw
.L181:
	ldr	x4, [x23]
	cbz	x4, .L230
	ldp	w2, w1, [x21, 56]
	ldp	w5, w3, [x25, 56]
	ldr	w0, [x20, 856]
	strh	w2, [x29, 108]
	add	x2, x29, 104
	strh	w1, [x29, 110]
	mov	w1, 2
	strh	w3, [x29, 106]
	mov	w3, 8
	strh	w5, [x29, 104]
	blr	x4
.L230:
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w2, [x0, 2704]
.L176:
	add	x19, x19, 312
	add	x19, x19, 40960
	str	w2, [x19, 2632]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L232:
	ldr	w1, [x0, 2636]
	mov	w2, 3538944
	tst	w1, w2
	beq	.L168
	mov	w2, 2
	str	w2, [x0, 2692]
	tbnz	x1, 17, .L169
	orr	w1, w1, w2
	str	w1, [x0, 2636]
.L169:
	mov	w2, 2
	tbnz	x1, 20, .L167
	add	x0, x19, 312
	orr	w1, w1, 16
	add	x0, x0, 40960
	str	w1, [x0, 2636]
	b	.L167
	.p2align 3
.L168:
	add	x0, x19, 312
	mov	w1, 1
	add	x0, x0, 40960
	mov	w2, w1
	str	w1, [x0, 2692]
	mov	w0, 17
	ldr	x1, .LC44
	bl	dprint_vfmw
	add	x0, x19, 312
	add	x0, x0, 40960
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	bne	.L170
.L233:
	mov	w2, 3
	mov	w1, 5
	strb	w0, [x21, 27]
	strb	w0, [x21, 18]
	strb	w2, [x21, 9]
	strb	w0, [x21, 11]
	strb	w0, [x21, 28]
	strb	wzr, [x21, 12]
	strb	wzr, [x21, 13]
	strb	wzr, [x21, 14]
	strb	wzr, [x21, 15]
	strb	wzr, [x21, 8]
	str	w1, [x21, 144]
	b	.L170
	.p2align 3
.L223:
	ldr	w0, [x20, 856]
	add	x2, x29, 96
	add	x3, x29, 100
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x24]
	ldr	w2, [x0, 748]
	cmp	w2, 1
	beq	.L240
.L228:
	ldr	x23, .LC49
.L185:
	strb	wzr, [x20, 873]
	b	.L183
	.p2align 3
.L165:
	mov	w1, 18
	ldr	w3, [x0, 2636]
	movk	w1, 0x12, lsl 16
	and	w1, w3, w1
	cmp	w1, 1179648
	bne	.L167
	mov	w2, 2
	str	w2, [x0, 2692]
	b	.L167
	.p2align 3
.L234:
	ldrb	w1, [x21, 27]
	cbnz	w1, .L172
	ldr	w3, [x21, 52]
	add	w1, w3, 31
	lsr	w1, w1, 5
	lsl	w1, w1, 1
	stp	w1, wzr, [x21, 60]
	ldr	w2, [x2, 2692]
	cmp	w2, 2
	bne	.L173
	add	w2, w3, 15
	mov	w3, w1
	lsr	w2, w2, 4
	b	.L174
	.p2align 3
.L235:
	ldrb	w2, [x21, 27]
	cbnz	w2, .L173
	add	w3, w3, 31
	mov	w2, w1
	lsr	w3, w3, 5
	lsl	w3, w3, 1
.L174:
	sub	w2, w3, w2
	str	w2, [x21, 64]
	b	.L173
	.p2align 3
.L172:
	ldr	w1, [x21, 52]
	add	w1, w1, 15
	lsr	w1, w1, 4
	stp	w1, wzr, [x21, 60]
	b	.L173
	.p2align 3
.L240:
	ldr	w0, [x29, 100]
	cmp	w0, wzr
	ble	.L241
.L186:
	mov	w0, 1
	strb	w0, [x20, 873]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L239:
	ldr	x1, .LC46
	str	wzr, [x0, 2704]
	mov	w0, 1
	bl	dprint_vfmw
	b	.L182
	.p2align 3
.L236:
	ldr	w0, [x25, 60]
	cmp	w0, w1
	bne	.L175
	b	.L176
	.p2align 3
.L237:
	ldr	w0, [x20, 856]
	bl	FSP_GetNullLogicFs
	str	w0, [x22, 2732]
	str	w0, [x22, 2736]
	b	.L178
	.p2align 3
.L238:
	ldr	w0, [x22, 2704]
	cbz	w0, .L242
	ldr	x23, .LC49
	b	.L181
	.p2align 3
.L242:
	mov	w1, 0
	mov	x0, x24
	bl	MP2_ArrangeVHBMem
	str	wzr, [x22, 2720]
	str	w0, [x22, 2704]
	ldr	x23, .LC49
	b	.L181
	.p2align 3
.L241:
	ldr	w0, [x29, 96]
	cmp	w0, 32
	bgt	.L186
	ldr	x0, [x24, 8]
	cbnz	x0, .L186
	ldr	w3, [x20, 860]
	cbz	w3, .L228
	ldr	w6, [x21, 56]
	cbz	w6, .L228
	ldr	w5, [x20, 880]
	ldr	w7, [x21, 60]
	cmp	w7, w5
	beq	.L228
	ldr	w4, [x20, 876]
	ldr	x23, .LC49
	cmp	w6, w4
	beq	.L185
	ldr	x1, .LC48
	mov	w0, w2
	bl	dprint_vfmw
	ldr	w0, [x21, 60]
	str	w0, [x20, 880]
	ldr	x4, [x23]
	ldr	w0, [x21, 56]
	str	w0, [x20, 876]
	cbz	x4, .L185
	ldr	w0, [x20, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	strb	wzr, [x20, 873]
	b	.L183
	.size	MP2_GetSequenceInfo, .-MP2_GetSequenceInfo
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC49:
	.xword	g_event_report
	.align	3
.LC51:
	.xword	.LC50
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_CalcRealEncFrameRate
	.type	MP2_CalcRealEncFrameRate, %function
MP2_CalcRealEncFrameRate:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 90112
	ldr	x3, [x0, 232]
	ldrb	w0, [x3, 22]
	cmp	w0, 1
	beq	.L248
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L248:
	add	x19, x19, 45056
	ldr	w5, [x3, 72]
	add	x2, x19, 312
	add	x2, x2, 40960
	ldr	w0, [x2, 2788]
	ldr	w1, [x2, 2800]
	ldr	w6, [x2, 2792]
	ldr	w4, [x2, 2804]
	add	w0, w0, w1
	cmp	w0, wzr
	add	w4, w6, w4
	ccmp	w5, wzr, 4, gt
	ccmp	w4, wzr, 4, gt
	ble	.L245
	ldrb	w1, [x3, 27]
	cmp	w1, 1
	beq	.L249
	lsl	w1, w0, 1
	mul	w0, w1, w5
	sdiv	w0, w0, w4
.L247:
	lsl	w2, w0, 2
	mov	w1, 19923
	sub	w2, w2, w0
	movk	w1, 0x1062, lsl 16
	lsl	w3, w2, 5
	add	x19, x19, 312
	add	w2, w2, w3
	add	x19, x19, 40960
	add	w0, w2, w0
	smull	x1, w0, w1
	asr	x1, x1, 38
	sub	w0, w1, w0, asr 31
	str	w0, [x19, 2824]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L245:
	str	wzr, [x2, 2824]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L249:
	ldr	w3, [x2, 2796]
	ldr	w1, [x2, 2808]
	mul	w0, w0, w5
	add	w1, w3, w1
	sdiv	w0, w0, w1
	b	.L247
	.size	MP2_CalcRealEncFrameRate, .-MP2_CalcRealEncFrameRate
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_CalcDar
	.type	MP2_CalcDar, %function
MP2_CalcDar:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 90112
	bl	_mcount
	ldr	x0, [x19, 232]
	ldr	w0, [x0, 84]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L252
	ldr	x1, .LC52
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x1, w0, uxtw 2]
	ret
	.p2align 3
.L252:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_CalcDar, .-MP2_CalcDar
	.align	3
.LC52:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SetImgFormat
	.type	MP2_SetImgFormat, %function
MP2_SetImgFormat:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 45056
	add	x23, x22, 90112
	bl	_mcount
	add	x1, x21, 312
	add	x1, x1, 40960
	ldr	w0, [x23, 856]
	ldr	x20, [x23, 232]
	ldr	w1, [x1, 2740]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L253
	ldrb	w0, [x20, 22]
	cmp	w0, 4
	beq	.L267
	sub	w0, w0, #1
	and	w0, w0, 3
	mov	w4, w0
	uxtb	w2, w0
.L255:
	ldrb	w0, [x20, 27]
	mov	w5, 1
	ldrb	w3, [x19, 125]
	ldrb	w1, [x20, 9]
	cmp	w0, wzr
	ubfx	x3, x3, 2, 2
	cset	w8, eq
	orr	w3, w1, w3
	ldr	w7, [x20, 128]
	cbnz	w0, .L256
	cmp	w1, 3
	beq	.L274
	add	x0, x21, 312
	cmp	w1, 1
	add	x0, x0, 40960
	cset	w5, eq
	ldr	w0, [x0, 2648]
	cbz	w0, .L256
	cset	w5, ne
.L256:
	ldr	x0, [x23, 232]
	ldr	w0, [x0, 84]
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L269
.L277:
	ldr	x1, .LC53
	ldr	w1, [x1, w0, uxtw 2]
	and	w6, w1, 7
.L259:
	ldrb	w0, [x19, 125]
	bfi	w0, w8, 0, 2
	bfi	w0, w3, 2, 2
	bfi	w0, w5, 4, 2
	strb	w0, [x19, 125]
	ldrb	w0, [x19, 124]
	bfi	w0, w2, 0, 2
	and	w0, w0, -29
	bfi	w0, w7, 5, 3
	strb	w0, [x19, 124]
	ldr	w0, [x19, 124]
	bfi	w0, w6, 14, 3
	str	w0, [x19, 124]
	ldr	w0, [x20, 56]
	lsl	w0, w0, 4
	cmp	w0, 1920
	ldrb	w0, [x19, 126]
	bhi	.L260
	orr	w0, w0, 2
	strb	w0, [x19, 126]
	ldr	x0, [x22]
	ldr	w0, [x0, 632]
	cmp	w0, 1
	beq	.L275
.L262:
	mov	x0, x19
	stp	w4, w4, [x19, 116]
	bl	SetAspectRatio
	mov	w0, 3
	str	w0, [x19, 412]
	mov	w0, 4
	mov	w2, 1
	ldrb	w1, [x20, 9]
	strb	w2, [x19, 407]
	cmp	w1, 3
	csel	w0, w0, wzr, ne
	strb	w0, [x19, 400]
	ldr	x0, [x22, 8]
	cbz	x0, .L264
	ldrb	w0, [x0, 144]
	str	w0, [x19, 416]
.L265:
	str	w0, [x19, 420]
	str	w0, [x19, 424]
	mov	w0, 1
	strb	w0, [x19, 405]
	ldr	w0, [x20, 72]
	str	w0, [x19, 160]
	ldr	w2, [x20, 48]
	str	w2, [x19, 128]
	ldr	w1, [x20, 52]
	str	w1, [x19, 132]
	ldr	x0, [x22]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L276
.L266:
	lsr	w3, w2, 1
	lsr	w0, w1, 1
	stp	w3, w0, [x19, 144]
	add	x21, x21, 312
	mov	x0, x22
	ldr	w3, [x20, 148]
	add	x21, x21, 40960
	str	w3, [x19, 152]
	ldr	w3, [x20, 152]
	str	w3, [x19, 156]
	stp	w2, w1, [x19, 136]
	ldrb	w1, [x20, 27]
	str	w1, [x19, 512]
	ldrb	w1, [x20, 18]
	str	w1, [x19, 516]
	ldr	w1, [x20, 144]
	str	w1, [x19, 524]
	bl	MP2_CalcRealEncFrameRate
	ldr	w0, [x21, 2824]
	str	w0, [x19, 520]
.L253:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L269:
	mov	w1, 0
	mov	w6, 0
	b	.L259
	.p2align 3
.L260:
	and	w0, w0, -3
	strb	w0, [x19, 126]
	ldr	x0, [x22]
	ldr	w0, [x0, 632]
	cmp	w0, 1
	bne	.L262
.L275:
	ldrb	w0, [x19, 126]
	tbnz	x0, 1, .L262
	orr	w0, w0, 4
	strb	w0, [x19, 126]
	b	.L262
	.p2align 3
.L267:
	mov	w4, 0
	mov	w2, 0
	b	.L255
	.p2align 3
.L264:
	mov	w0, 32
	strb	wzr, [x19, 407]
	str	w0, [x19, 416]
	b	.L265
	.p2align 3
.L274:
	ldr	x0, [x23, 232]
	ldrb	w5, [x20, 10]
	ldr	w0, [x0, 84]
	and	w5, w5, 1
	sub	w0, w0, #1
	cmp	w0, 2
	bhi	.L269
	b	.L277
	.p2align 3
.L276:
	ldr	w3, [x19, 164]
	add	w1, w1, 15
	lsr	w0, w1, 4
	ldr	w2, [x19, 44]
	lsl	w1, w3, 4
	ldr	x4, [x19, 544]
	str	w2, [x19, 60]
	mul	w1, w0, w1
	str	x4, [x19, 560]
	add	w0, w1, w2
	str	w0, [x19, 48]
	add	x1, x4, x1, sxtw
	str	x1, [x19, 552]
	stp	w2, w0, [x19, 28]
	add	w2, w3, w2
	add	w3, w3, w0
	stp	w2, w3, [x19, 36]
	bl	MEM_Phy2Vir
	str	x0, [x19, 568]
	ldr	w3, [x19, 32]
	ldp	w2, w1, [x19, 128]
	str	w3, [x19, 64]
	b	.L266
	.size	MP2_SetImgFormat, .-MP2_SetImgFormat
	.align	3
.LC53:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SearchStartCode
	.type	MP2_SearchStartCode, %function
MP2_SearchStartCode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 4
	mov	w0, 0
	ble	.L279
	mov	w1, w19
	mov	x0, x20
	bl	MP2_SearchStartCode.part.1
.L279:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_SearchStartCode, .-MP2_SearchStartCode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ProtocolPPSCheck
	.type	MP2_ProtocolPPSCheck, %function
MP2_ProtocolPPSCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 45056
	add	x19, x19, 90112
	bl	_mcount
	add	x1, x20, 312
	add	x1, x1, 40960
	ldr	x3, [x19, 232]
	ldr	w0, [x1, 2692]
	cmp	w0, 1
	beq	.L283
	cmp	w0, 2
	beq	.L284
	ldr	w0, [x1, 2636]
	orr	w0, w0, 63
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
.L290:
	tst	w0, 24
	beq	.L292
.L308:
	cmp	w2, 3
	bne	.L293
.L281:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L284:
	ldr	w0, [x1, 2636]
	tbnz	x0, 20, .L291
	orr	w0, w0, 16
	str	w0, [x1, 2636]
.L291:
	ldrb	w2, [x3, 22]
	sub	w1, w2, #1
	uxtb	w1, w1
	cmp	w1, 2
	bls	.L290
.L306:
	add	x1, x20, 312
	orr	w0, w0, 8
	add	x1, x1, 40960
	tst	w0, 24
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	bne	.L308
.L292:
	cmp	w2, 1
	bne	.L281
	add	x20, x20, 312
	and	w0, w0, -193
	add	x20, x20, 40960
	str	w0, [x20, 2636]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L283:
	ldrb	w2, [x3, 22]
	sub	w0, w2, #1
	uxtb	w0, w0
	cmp	w0, 3
	ldr	w0, [x1, 2636]
	bhi	.L309
.L286:
	sub	w1, w2, #2
	uxtb	w1, w1
	cmp	w1, 1
	bls	.L310
.L287:
	cmp	w2, 3
	beq	.L311
	tst	w0, 24
	beq	.L292
.L293:
	add	x21, x20, 312
	orr	w0, w0, 64
	add	x21, x21, 40960
	str	w0, [x21, 2636]
	ldr	w1, [x21, 2736]
	ldr	w0, [x19, 856]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L296
	ldr	w0, [x19, 856]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x22, 608]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x22, 616]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x22, 624]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w0, [x19, 856]
	ldr	w1, [x21, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 856]
	mov	w2, 1
	ldr	w1, [x21, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 2732]
	str	wzr, [x21, 2736]
	ldr	w0, [x19, 856]
	bl	FSP_GetFspType
	cbnz	w0, .L312
.L296:
	add	x20, x20, 312
	add	x20, x20, 40960
	str	wzr, [x20, 2696]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L309:
	orr	w0, w0, 8
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	b	.L286
	.p2align 3
.L312:
	ldr	w0, [x19, 856]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 2732]
	str	w0, [x21, 2736]
	b	.L296
	.p2align 3
.L311:
	ldrb	w1, [x3, 26]
	cbnz	w1, .L281
	b	.L306
	.p2align 3
.L310:
	ldrb	w1, [x3, 24]
	cbnz	w1, .L287
	add	x1, x20, 312
	orr	w0, w0, 8
	add	x1, x1, 40960
	str	w0, [x1, 2636]
	ldrb	w2, [x3, 22]
	b	.L287
	.size	MP2_ProtocolPPSCheck, .-MP2_ProtocolPPSCheck
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetImageBuffer
	.type	MP2_GetImageBuffer, %function
MP2_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x1, x0
	mov	x0, x30
	add	x21, x1, 90112
	add	x19, x1, 45056
	add	x20, x19, 312
	bl	_mcount
	add	x20, x20, 40960
	mov	w1, 1
	ldr	w0, [x21, 856]
	bl	FSP_NewLogicFs
	str	w0, [x20, 2740]
	mov	w1, w0
	tbnz	w0, #31, .L326
	ldr	w0, [x21, 856]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cbz	x0, .L327
	ldr	x1, .LC59
	mov	w0, 18
	ldr	w2, [x20, 2740]
	bl	dprint_vfmw
	ldr	x0, [x19, 680]
	cbz	x0, .L322
	ldr	x1, [x19, 688]
	cbz	x1, .L322
	ldr	x2, [x19, 696]
	cbz	x2, .L322
	ldr	w3, [x1, 16]
	ldr	w4, [x2, 16]
	ldr	x1, .LC61
	ldr	w2, [x0, 16]
	mov	w0, 18
	bl	dprint_vfmw
	mov	w0, 1
.L318:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L322:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L326:
	ldr	x1, .LC55
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 2736]
	ldr	w0, [x21, 856]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L316
	ldr	w0, [x21, 856]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x22, 608]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x22, 616]
	bl	FreeUsdByDec
	ldr	w0, [x21, 856]
	ldr	x1, [x22, 624]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w1, [x20, 2736]
	ldr	w0, [x21, 856]
	bl	FSP_ClearLogicFs
	ldr	w0, [x21, 856]
	mov	w2, 1
	ldr	w1, [x20, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 2732]
	str	wzr, [x20, 2736]
	ldr	w0, [x21, 856]
	bl	FSP_GetFspType
	cbnz	w0, .L328
.L316:
	add	x19, x19, 312
	add	x1, x21, 248
	add	x19, x19, 40960
	str	wzr, [x19, 2696]
	ldr	w0, [x21, 856]
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L328:
	ldr	w0, [x21, 856]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 2732]
	str	w0, [x20, 2736]
	b	.L316
	.p2align 3
.L327:
	ldr	x1, .LC57
	mov	w2, 1950
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L318
	.size	MP2_GetImageBuffer, .-MP2_GetImageBuffer
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetPictureInfo
	.type	MP2_GetPictureInfo, %function
MP2_GetPictureInfo:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 45056
	add	x23, x22, 90112
	bl	_mcount
	add	x0, x21, 312
	add	x0, x0, 40960
	ldp	x20, x24, [x23, 232]
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	beq	.L384
.L330:
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	beq	.L331
	add	x19, x21, 312
	add	x19, x19, 40960
	ldr	w0, [x19, 2648]
	ldr	w1, [x19, 2700]
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x19, 2648]
	ldr	w2, [x20, 156]
	cmp	w2, w1
	cset	w1, ne
	tst	w0, w1
	bne	.L385
.L333:
	ldrb	w2, [x20, 9]
	add	x0, x21, 312
	strb	w2, [x21, 313]
	add	x1, x0, 40960
	add	x19, x22, 16
	ldr	w0, [x20, 156]
	str	w0, [x1, 2700]
	ldr	w0, [x20, 56]
	strh	w0, [x19, 152]
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	ldr	w0, [x20, 60]
	beq	.L338
	lsr	w0, w0, 1
	strh	w0, [x19, 148]
	ldr	w0, [x20, 60]
	strh	w0, [x19, 150]
.L339:
	ldrb	w1, [x20, 11]
	add	x0, x21, 312
	strb	w1, [x19, 5]
	add	x0, x0, 40960
	ldrb	w1, [x20, 9]
	strb	w1, [x19, 3]
	ldr	w1, [x0, 2648]
	strb	w1, [x19, 4]
	ldrb	w2, [x20, 12]
	strb	w2, [x19, 7]
	ldrb	w2, [x20, 22]
	strb	w2, [x22, 16]
	ldr	w0, [x0, 2692]
	cmp	w0, 1
	cset	w2, eq
	str	w2, [x19, 180]
	beq	.L386
.L340:
	ldrb	w0, [x20, 4]
	strb	w0, [x19, 12]
	ldrb	w0, [x20, 5]
	strb	w0, [x19, 13]
	ldrb	w0, [x20, 6]
	strb	w0, [x19, 14]
	ldrb	w0, [x20, 7]
	strb	w0, [x19, 15]
	ldrb	w0, [x20, 10]
	strb	w0, [x19, 6]
	ldrb	w0, [x20, 8]
	strb	w0, [x19, 11]
	ldrb	w0, [x20, 13]
	strb	w0, [x19, 10]
	ldrb	w0, [x20, 14]
	strb	w0, [x19, 9]
	ldrb	w0, [x20, 15]
	strb	w0, [x19, 8]
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	ccmp	w1, wzr, 4, ne
	bne	.L342
	mov	x1, 0
	mov	x0, x22
	bl	MP2_GetImageBuffer
	mov	w24, w0
	cbz	w0, .L387
	add	x1, x21, 312
	ldr	w0, [x23, 856]
	add	x1, x1, 40960
	ldr	w1, [x1, 2740]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L345
	ldr	x2, [x22]
	mov	x3, -1
	ldr	x1, .LC72
	mov	w0, 29
	ldr	x2, [x2, 56]
	str	x2, [x24, 640]
	ldr	x2, [x22]
	ldr	x2, [x2, 72]
	str	x2, [x24, 648]
	ldr	x2, [x22]
	ldr	x2, [x2, 88]
	str	x2, [x24, 656]
	ldr	x2, [x22]
	ldr	w2, [x2, 104]
	str	w2, [x24, 8]
	ldr	x2, [x22]
	ldr	w2, [x2, 108]
	str	w2, [x24, 12]
	ldr	x2, [x22]
	ldr	w2, [x2, 112]
	str	w2, [x24, 16]
	ldr	x2, [x22]
	ldr	w2, [x2, 128]
	str	w2, [x24, 20]
	ldr	x2, [x22]
	str	x3, [x2, 56]
	ldr	x2, [x24, 640]
	ldr	x3, [x24, 648]
	bl	dprint_vfmw
	ldrb	w0, [x20, 9]
	cmp	w0, 3
	cset	w0, ne
	str	w0, [x24, 112]
.L345:
	ldrb	w0, [x20, 22]
	cmp	w0, 3
	beq	.L342
	add	x20, x21, 312
	mov	w0, 2
	add	x20, x20, 40960
	ldr	w1, [x20, 2696]
	ldr	w2, [x20, 2732]
	ldr	w3, [x20, 2736]
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x20, 2696]
	cmp	w2, w3
	beq	.L348
	ldr	x1, .LC74
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w1, [x20, 2732]
	mov	w2, 0
	ldr	w0, [x23, 856]
	bl	FSP_SetRef
	ldr	w3, [x20, 2736]
.L348:
	add	x20, x21, 312
	mov	w2, 1
	add	x20, x20, 40960
	ldr	w1, [x20, 2740]
	str	w3, [x20, 2732]
	str	w1, [x20, 2736]
	ldr	w0, [x23, 856]
	bl	FSP_SetRef
	ldr	w1, [x20, 2732]
	ldr	w0, [x23, 856]
	bl	FSP_RemovePmv
	ldr	x1, .LC76
	mov	w0, 13
	ldr	w2, [x20, 2740]
	bl	dprint_vfmw
.L342:
	add	x24, x21, 312
	ldr	w0, [x23, 856]
	add	x24, x24, 40960
	ldr	w1, [x24, 2740]
	bl	FSP_GetLogicFs
	mov	x20, x0
	ldr	w1, [x24, 2732]
	ldr	w0, [x23, 856]
	bl	FSP_GetLogicFs
	mov	x25, x0
	ldr	w1, [x24, 2736]
	ldr	w0, [x23, 856]
	bl	FSP_GetLogicFs
	mov	x26, x0
	cmp	x20, xzr
	ccmp	x25, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L388
	ldr	x1, [x20, 680]
	cbz	x1, .L350
	ldr	x0, [x20, 696]
	cbz	x0, .L350
	ldr	x0, [x20, 688]
	cbz	x0, .L350
	ldr	x0, [x26, 680]
	cbz	x0, .L352
	ldr	w5, [x0, 16]
.L353:
	str	w5, [x19, 192]
	ldr	x0, [x25, 680]
	cbz	x0, .L389
.L381:
	ldr	w4, [x0, 16]
	str	w4, [x19, 196]
	ldr	x0, [x20, 680]
	ldr	w2, [x0, 16]
	str	w2, [x19, 200]
	ldr	w6, [x20, 704]
	str	w6, [x19, 260]
	ldr	x0, [x20, 680]
	ldr	w0, [x0, 36]
	str	w0, [x19, 232]
	ldr	x0, [x20, 680]
	ldr	w0, [x0, 40]
	str	w0, [x19, 236]
	ldr	x0, [x26, 696]
	cbz	x0, .L390
.L382:
	ldr	w0, [x0, 16]
	str	w0, [x19, 212]
	ldr	x0, [x25, 696]
	cbz	x0, .L391
.L383:
	ldr	w0, [x0, 16]
	str	w0, [x19, 216]
	ldr	x0, [x20, 696]
	ldr	w0, [x0, 16]
	str	w0, [x19, 220]
	ldr	x0, [x20, 688]
	ldr	w3, [x0, 16]
	str	w3, [x19, 224]
	ldr	w0, [x26, 120]
	str	w0, [x19, 204]
	add	x0, x19, 45056
	ldr	w1, [x25, 120]
	str	w1, [x19, 208]
	ldr	x1, [x20, 696]
	ldr	w1, [x1, 16]
	str	w1, [x0, 276]
	mov	w0, 13
	ldr	x1, .LC82
	bl	dprint_vfmw
	ldr	x2, [x20, 688]
	add	x3, x22, 86016
	add	x0, x3, 3264
	add	x1, x22, 96
	add	x3, x3, 3520
	ldr	w2, [x2, 32]
	str	w2, [x19, 240]
	ldr	x2, [x20, 688]
	ldr	w2, [x2, 76]
	str	w2, [x19, 244]
	ldr	x2, [x20, 688]
	ldr	w2, [x2, 60]
	str	w2, [x19, 248]
	ldr	x2, [x20, 688]
	ldr	w2, [x2, 64]
	str	w2, [x19, 252]
	.p2align 2
.L360:
	ldr	w2, [x0]
	add	x0, x0, 4
	strb	w2, [x1]
	add	x1, x1, 1
	cmp	x0, x3
	ldr	w2, [x0, 252]
	strb	w2, [x1, -65]
	bne	.L360
	mov	x0, x22
	mov	w24, 1
	bl	MP2_EstimatePicQp
	strb	w0, [x19, 144]
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L387:
	add	x2, x21, 312
	ldr	x1, .LC70
	add	x2, x2, 40960
	ldr	w2, [x2, 2644]
	bl	dprint_vfmw
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L386:
	ldrb	w0, [x20, 25]
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 23]
	strb	w0, [x19, 2]
	b	.L340
	.p2align 3
.L338:
	ldr	w1, [x20, 64]
	sub	w0, w0, w1
	strh	w0, [x19, 148]
	ldr	w0, [x20, 60]
	strh	w0, [x19, 150]
	b	.L339
	.p2align 3
.L331:
	ldrb	w4, [x21, 313]
	add	x0, x21, 312
	cmp	w4, 3
	beq	.L336
	add	x19, x0, 40960
	ldr	w0, [x19, 2648]
	cbz	w0, .L392
.L336:
	add	x0, x21, 312
	mov	w1, 1
	add	x0, x0, 40960
	str	w1, [x0, 2648]
	b	.L333
	.p2align 3
.L384:
	ldrb	w1, [x20, 26]
	ldrb	w0, [x20, 24]
	strb	w1, [x20, 7]
	strb	w1, [x20, 6]
	strb	w0, [x20, 5]
	strb	w0, [x20, 4]
	b	.L330
.L388:
	ldr	w0, [x23, 856]
	mov	w2, 1
	ldr	w1, [x24, 2740]
	mov	w24, 0
	bl	FSP_ClearLogicFs
	ldr	x1, .LC78
	mov	x5, x26
	mov	x4, x25
	mov	x3, x20
	mov	w2, 1186
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L392:
	ldr	x1, .LC68
	mov	w3, 0
	ldr	w2, [x19, 2644]
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x23, 856]
	mov	w2, 1
	ldr	w1, [x19, 2740]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x24, 22]
	cmp	w0, 3
	beq	.L336
	ldr	w0, [x19, 2636]
	orr	w0, w0, 192
	str	w0, [x19, 2636]
	b	.L336
.L350:
	add	x19, x21, 312
	ldr	w0, [x23, 856]
	add	x19, x19, 40960
	mov	w2, 1
	mov	w24, 0
	ldr	w1, [x19, 2740]
	bl	FSP_ClearLogicFs
	ldr	w2, [x19, 2732]
	mov	w0, 0
	ldr	w4, [x19, 2736]
	ldr	w3, [x19, 2740]
	ldr	x5, [x20, 680]
	ldr	x7, [x20, 688]
	ldr	x6, [x20, 696]
	ldr	x1, .LC80
	bl	dprint_vfmw
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L385:
	ldr	x1, .LC66
	mov	w0, 1
	ldr	w2, [x19, 2644]
	bl	dprint_vfmw
	str	wzr, [x19, 2648]
	ldr	w1, [x19, 2740]
	mov	w2, 1
	ldr	w0, [x23, 856]
	bl	FSP_ClearLogicFs
	ldrb	w0, [x24, 22]
	cmp	w0, 3
	beq	.L333
	ldr	w0, [x19, 2636]
	orr	w0, w0, 192
	str	w0, [x19, 2636]
	b	.L333
.L391:
	ldr	x0, [x20, 696]
	b	.L383
.L352:
	ldr	w5, [x1, 16]
	b	.L353
.L390:
	ldr	x0, [x20, 696]
	b	.L382
.L389:
	ldr	x0, [x20, 680]
	b	.L381
	.size	MP2_GetPictureInfo, .-MP2_GetPictureInfo
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_SetVDMInf
	.type	MP2_SetVDMInf, %function
MP2_SetVDMInf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, 20792
	mov	x19, x0
	mov	x0, x30
	movk	x20, 0x1, lsl 16
	add	x20, x19, x20
	bl	_mcount
	add	x0, x19, 86016
	add	x0, x0, 3224
	ldrsb	w1, [x20, 2576]
	ldr	w3, [x20, 2568]
	cmp	w1, 1
	ldr	w4, [x0, 32]
	ldr	w1, [x20, 2580]
	lsr	w2, w4, 3
	beq	.L396
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 2568]
	add	w1, w4, w1, lsl 3
	ldr	w21, [x20, 2584]
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 172]
	str	w1, [x19, 180]
	and	w21, w21, -4
	bl	BsResidBits
	str	w21, [x19, 176]
	str	w0, [x19, 188]
	ldr	w0, [x20, 2584]
	ubfiz	w0, w0, 3, 2
	str	w0, [x19, 184]
	ldr	w0, [x20, 2592]
	lsl	w0, w0, 3
	str	w0, [x19, 192]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L396:
	add	w3, w3, w2
	add	w2, w1, w2
	str	w3, [x20, 2568]
	add	w1, w4, w1, lsl 3
	and	w2, w2, -4
	and	w1, w1, 31
	str	w2, [x19, 172]
	str	w1, [x19, 180]
	bl	BsResidBits
	str	wzr, [x19, 176]
	stp	wzr, w0, [x19, 184]
	str	wzr, [x19, 192]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_SetVDMInf, .-MP2_SetVDMInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecNewPic
	.type	MP2_DecNewPic, %function
MP2_DecNewPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MP2_SetVDMInf
	ldr	x0, [x19]
	add	x1, x19, 45056
	add	x3, x19, 90112
	ldr	w2, [x0, 632]
	str	w2, [x1, 296]
	ldr	w2, [x0, 672]
	str	w2, [x1, 300]
	ldr	w2, [x0, 636]
	str	w2, [x1, 304]
	ldr	x1, [x3, 232]
	ldrb	w2, [x1, 22]
	cmp	w2, 3
	beq	.L415
	cmp	w2, 2
	beq	.L416
.L399:
	add	x4, x19, 16
	str	x4, [x19, 8]
	ldr	w2, [x0, 904]
	cmp	w2, 1
	beq	.L417
.L401:
	cmp	w2, 2
	beq	.L418
.L402:
	add	x2, x19, 86016
	mov	w20, 1
	ldr	w0, [x2, 2948]
	and	w0, w0, -16252929
	str	w0, [x2, 2948]
	ldrb	w0, [x1, 22]
	cmp	w0, w20
	beq	.L419
.L400:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L416:
	mov	w2, 1
	str	w2, [x3, 868]
	add	x4, x19, 16
	str	x4, [x19, 8]
	ldr	w2, [x0, 904]
	cmp	w2, 1
	bne	.L401
.L417:
	cbz	x4, .L402
	ldrb	w0, [x1, 22]
	cmp	w0, 3
	bne	.L402
	mov	w20, 0
	str	xzr, [x19, 8]
	b	.L400
	.p2align 3
.L419:
	ldr	x0, .LC83
	ldr	x5, [x0]
	cbz	x5, .L400
	ldp	w4, w1, [x19, 188]
	add	x2, x29, 48
	ldr	w0, [x3, 856]
	add	w4, w4, w1
	mov	w3, 4
	cmp	w4, wzr
	add	w1, w4, 7
	csel	w4, w1, w4, lt
	mov	w1, 20
	asr	w4, w4, 3
	str	w4, [x2, -8]!
	blr	x5
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L415:
	ldr	w2, [x3, 868]
	cbnz	w2, .L399
	add	x2, x19, 86016
	ldr	w4, [x2, 3008]
	cmp	w4, 2
	beq	.L399
	ldrb	w0, [x1, 9]
	cmp	w0, 3
	beq	.L403
	ldr	w0, [x2, 2960]
	mov	w20, 0
	cmp	w0, wzr
	cset	w0, eq
	str	w0, [x2, 2960]
	b	.L400
	.p2align 3
.L418:
	ldr	w2, [x0, 908]
	cmp	w2, wzr
	ccmp	x4, xzr, 4, gt
	beq	.L402
	ldrb	w2, [x1, 22]
	cmp	w2, 3
	bne	.L402
	str	xzr, [x19, 8]
	mov	w20, 0
	ldr	w1, [x0, 908]
	sub	w1, w1, #1
	str	w1, [x0, 908]
	b	.L400
	.p2align 3
.L403:
	mov	w20, 0
	b	.L400
	.size	MP2_DecNewPic, .-MP2_DecNewPic
	.align	3
.LC83:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_RecordVFMWState
	.type	MP2_RecordVFMWState, %function
MP2_RecordVFMWState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 90112
	ldr	x2, [x19]
	ldr	x1, [x0, 232]
	ldr	w3, [x1, 40]
	str	w3, [x2, 608]
	ldr	x2, [x19]
	ldr	w1, [x1, 44]
	str	w1, [x2, 612]
	ldr	w2, [x0, 860]
	ldr	w1, [x0, 864]
	ldr	x3, [x19]
	sub	w0, w2, w1
	cmp	w2, w1
	csel	w0, w0, wzr, ge
	str	w0, [x3, 616]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_RecordVFMWState, .-MP2_RecordVFMWState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetUsrData
	.type	MP2_GetUsrData, %function
MP2_GetUsrData:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x24, x23, 86016
	bl	_mcount
	add	x20, x24, 3224
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w22, w1, w0, lt
	asr	w22, w22, 3
	cmp	w22, wzr
	ble	.L442
	ldr	x25, .LC86
	mov	w21, 0
	mov	w19, 0
	b	.L428
	.p2align 3
.L459:
	bl	BsGet
	add	w19, w19, 1
	strb	w0, [x25, w21, sxtw]
	cmp	w22, w19
	add	w21, w21, 1
	beq	.L424
.L428:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L443
	cmp	w21, 1023
	ble	.L459
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsGet
	cmp	w22, w19
	bne	.L428
.L424:
	add	x22, x23, 45056
	add	x25, x22, 312
	add	x25, x25, 40960
	ldrsb	w0, [x25, 2576]
	cbz	w0, .L441
.L458:
	mov	w19, 0
.L425:
	add	x0, x22, 312
	add	x0, x0, 40960
	ldr	w20, [x0, 2688]
	cmp	w20, 3
	bgt	.L432
	add	x24, x23, 90112
.L433:
	ldr	w0, [x24, 856]
	add	x20, x23, x20, uxtw 3
	add	x20, x20, 86016
	bl	GetUsd
	add	x3, x22, 312
	str	x0, [x20, 2968]
	add	x4, x3, 40960
	ldr	w2, [x4, 2688]
	sxtw	x1, w2
	add	x1, x1, 4096
	add	x1, x1, 1356
	ldr	x1, [x3, x1, lsl 3]
	cbz	x1, .L435
	ldr	x1, [x23]
	ldr	x1, [x1, 56]
	str	x1, [x0, 1056]
	ldr	x0, [x20, 2968]
	ldr	w1, [x4, 2640]
	str	w1, [x0, 1044]
	ldr	x0, [x20, 2968]
	str	w21, [x0, 1052]
	ldr	x1, [x24, 232]
	ldr	x0, [x20, 2968]
	ldrb	w1, [x1, 22]
	strb	w1, [x0, 1024]
	ldr	x0, [x20, 2968]
	ldr	w1, [x24, 860]
	str	w1, [x0, 1032]
	ldr	x1, [x24, 232]
	ldr	x0, [x20, 2968]
	ldrb	w1, [x1, 10]
	strb	w1, [x0, 1025]
	ldr	w0, [x4, 2636]
	tbz	x0, 19, .L436
	ldr	x0, [x20, 2968]
	mov	w1, 3
	str	w1, [x0, 1040]
.L437:
	ldr	x0, [x20, 2968]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L438
	mov	w1, 1024
	str	w1, [x0, 1052]
	ldr	x0, [x20, 2968]
	ldr	w2, [x0, 1052]
.L438:
	ldr	x3, .LC89
	sxtw	x2, w2
	ldr	x1, .LC86
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x0, .LC90
	ldr	x4, [x0]
	cbz	x4, .L439
	ldr	w0, [x24, 856]
	mov	w3, 1064
	ldr	x2, [x20, 2968]
	mov	w1, 6
	blr	x4
.L439:
	add	x22, x22, 312
	add	x22, x22, 40960
	ldr	w0, [x22, 2688]
	add	w0, w0, 1
	str	w0, [x22, 2688]
.L457:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L441:
	ldrsb	w0, [x25, 2577]
	mov	w19, 0
	cbz	w0, .L425
	ldr	w19, [x25, 2592]
	cbz	w19, .L425
	ldr	x1, .LC88
	mov	w0, 0
	mov	w19, 1
	bl	dprint_vfmw
	ldr	x2, .LC89
	ldrsw	x1, [x25, 2588]
	ldr	x3, [x25, 2608]
	ldr	x0, [x25, 2616]
	sub	x1, x1, #3
	add	x1, x3, x1
	ldr	x3, [x2, 104]
	sub	x0, x0, #3
	mov	x2, 3
	blr	x3
	strb	w19, [x25, 2576]
	add	x3, x25, 2560
	ldr	w0, [x25, 2584]
	ldr	w2, [x25, 2592]
	ldr	x1, [x25, 2616]
	sub	w0, w0, #3
	strb	wzr, [x25, 2577]
	add	w2, w2, 3
	stp	w0, wzr, [x3, 20]
	stp	w2, wzr, [x3, 28]
	sub	x1, x1, #3
	mov	x0, x20
	str	x1, [x25, 2608]
	str	xzr, [x25, 2616]
	bl	BsInit
	strb	w19, [x25, 2577]
	strb	wzr, [x25, 2576]
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w19, w1, w0, lt
	asr	w19, w19, 3
	sub	w19, w19, #3
	cmp	w19, wzr
	ble	.L458
	ldr	x26, .LC86
	mov	w25, 0
	b	.L431
	.p2align 3
.L460:
	bl	BsGet
	strb	w0, [x26, w21, sxtw]
	add	w21, w21, 1
.L430:
	add	w25, w25, 1
	cmp	w19, w25
	beq	.L458
.L431:
	mov	w1, 24
	mov	x0, x20
	bl	BsShow
	and	w2, w0, 16777215
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	beq	.L446
	cmp	w21, 1023
	ble	.L460
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	b	.L430
	.p2align 3
.L432:
	add	x20, x24, 2968
	add	x25, x24, 3000
	add	x24, x23, 90112
.L434:
	ldr	x1, [x20]
	ldr	w0, [x24, 856]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x25
	bne	.L434
	add	x0, x22, 312
	mov	w20, 0
	add	x0, x0, 40960
	str	wzr, [x0, 2688]
	b	.L433
	.p2align 3
.L443:
	mov	w19, w2
	add	x22, x23, 45056
	b	.L425
	.p2align 3
.L436:
	ldr	x0, [x20, 2968]
	mov	w1, 1
	str	w1, [x0, 1040]
	b	.L437
.L435:
	ldr	x1, .LC92
	mov	w0, 0
	bl	dprint_vfmw
	b	.L457
.L442:
	mov	w21, 0
	b	.L424
.L446:
	mov	w19, w2
	b	.L425
	.size	MP2_GetUsrData, .-MP2_GetUsrData
	.align	3
.LC86:
	.xword	.LANCHOR2
	.align	3
.LC88:
	.xword	.LC87
	.align	3
.LC89:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC90:
	.xword	g_event_report
	.align	3
.LC92:
	.xword	.LC91
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	next_start_code
	.type	next_start_code, %function
next_start_code:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 86016
	bl	_mcount
	add	x20, x20, 3224
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsGetNextBytePtr
	mov	x19, x0
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w2, w1, w0, lt
	mov	w1, 0
	asr	w2, w2, 3
	cmp	w2, 4
	bgt	.L487
.L462:
	mov	x0, x20
	mov	w19, 0
	bl	BsLongSkip
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L481
	b	.L469
	.p2align 3
.L466:
	bl	BsSkip
	cmp	w19, w21
	beq	.L469
.L481:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L466
.L471:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L469:
	mov	x0, 20792
	movk	x0, 0x1, lsl 16
	add	x22, x22, x0
	ldrsb	w0, [x22, 2576]
	cbnz	w0, .L465
	ldrsb	w0, [x22, 2577]
	cbz	w0, .L465
	ldr	w0, [x22, 2592]
	cbz	w0, .L465
	ldr	x1, .LC93
	mov	w0, 7
	mov	w19, 1
	bl	dprint_vfmw
	ldr	x3, .LC94
	mov	x2, 3
	ldrsw	x1, [x22, 2588]
	ldr	x4, [x22, 2608]
	ldr	x0, [x22, 2616]
	sub	x1, x1, #3
	ldr	x3, [x3, 104]
	add	x1, x4, x1
	sub	x0, x0, #3
	blr	x3
	strb	w19, [x22, 2576]
	add	x6, x22, 2560
	ldr	x4, [x22, 2616]
	ldr	w5, [x22, 2584]
	mov	x0, x20
	ldr	w3, [x22, 2592]
	sub	x4, x4, #3
	strb	wzr, [x22, 2577]
	sub	w5, w5, #3
	add	w3, w3, 3
	mov	x1, x4
	stp	w5, wzr, [x6, 20]
	stp	w3, wzr, [x6, 28]
	mov	w2, w3
	str	x4, [x22, 2608]
	str	xzr, [x22, 2616]
	bl	BsInit
	strb	w19, [x22, 2577]
	strb	wzr, [x22, 2576]
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsGetNextBytePtr
	mov	x19, x0
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w2, w1, w0, lt
	mov	w1, 0
	asr	w2, w2, 3
	cmp	w2, 4
	bgt	.L488
.L470:
	mov	x0, x20
	bl	BsLongSkip
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	ble	.L465
	mov	w19, 0
	b	.L472
	.p2align 3
.L489:
	bl	BsSkip
	cmp	w19, w21
	beq	.L465
.L472:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	cmp	w0, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L489
	b	.L471
	.p2align 3
.L465:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L487:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.1
	lsl	w1, w0, 3
	b	.L462
.L488:
	mov	w1, w2
	mov	x0, x19
	bl	MP2_SearchStartCode.part.1
	lsl	w1, w0, 3
	b	.L470
	.size	next_start_code, .-next_start_code
	.align	3
.LC93:
	.xword	.LC87
	.align	3
.LC94:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetSliceHdr
	.type	GetSliceHdr, %function
GetSliceHdr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, 20792
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 86016
	movk	x22, 0x1, lsl 16
	add	x20, x20, 3224
	bl	_mcount
	add	x22, x21, x22
	b	.L491
	.p2align 3
.L498:
	bl	BsShow
	mov	w19, w0
	mov	x0, x20
	sub	w19, w19, #257
	bl	BsPos
	str	w0, [x22, 2716]
	cmp	w19, 174
	mov	w1, 32
	mov	x0, x20
	bls	.L506
	bl	BsSkip
.L491:
	mov	x0, x21
	bl	next_start_code
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 32
	mov	x0, x20
	beq	.L498
	cmn	w2, #1
	mov	w19, w2
	beq	.L493
.L496:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L500:
	mov	w19, -1
.L493:
	ldr	x0, .LC95
	ldr	x4, [x0]
	cbz	x4, .L496
	add	x21, x21, 90112
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	ldr	w0, [x21, 856]
	blr	x4
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L506:
	bl	BsResidBits
	cmp	w0, 40
	ble	.L500
	ldr	w0, [x22, 2632]
	str	wzr, [x22, 2712]
	cbnz	w0, .L497
	mov	x0, x21
	mov	w19, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x22, 2704]
	cbz	w0, .L496
.L497:
	mov	x0, x21
	mov	w19, 1
	bl	MP2_ProtocolPPSCheck
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetSliceHdr, .-GetSliceHdr
	.align	3
.LC95:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_header
	.type	sequence_header, %function
sequence_header:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x19, 20792
	add	x23, x21, 86016
	bl	_mcount
	movk	x19, 0x1, lsl 16
	add	x3, x21, 90112
	add	x19, x21, x19
	add	x20, x23, 3224
	mov	w2, 65536
	mov	w1, 12
	mov	x0, x20
	ldr	x24, [x3, 232]
	str	w2, [x19, 2636]
	str	wzr, [x19, 2632]
	bl	BsGet
	str	w0, [x24, 48]
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 52]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 84]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 88]
	mov	w1, 18
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 92]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbnz	w0, .L508
	ldr	w0, [x19, 2636]
	orr	w0, w0, 1
	str	w0, [x19, 2636]
.L508:
	mov	w1, 10
	mov	x0, x20
	bl	BsGet
	str	w0, [x24, 96]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x24, 1]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 76]
	ldr	x22, .LC98
	beq	.L525
	add	x0, x22, 64
	add	x1, x23, 3264
	add	x3, x0, 64
	.p2align 2
.L513:
	ldrb	w2, [x0], 1
	str	w2, [x1], 4
	cmp	x0, x3
	bne	.L513
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	beq	.L526
.L522:
	add	x0, x23, 3520
	mov	w1, 16
	add	x23, x23, 3776
	.p2align 2
.L516:
	str	w1, [x0], 4
	cmp	x0, x23
	bne	.L516
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L525:
	mov	x26, x22
	add	x25, x22, 64
	.p2align 2
.L510:
	ldrb	w19, [x26], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1840
	bl	BsGet
	cmp	x26, x25
	str	w0, [x21, x19, lsl 2]
	bne	.L510
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	bne	.L522
.L526:
	add	x23, x22, 64
	.p2align 2
.L515:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1904
	bl	BsGet
	cmp	x22, x23
	str	w0, [x21, x19, lsl 2]
	bne	.L515
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	sequence_header, .-sequence_header
	.align	3
.LC98:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	group_of_pictures_header
	.type	group_of_pictures_header, %function
group_of_pictures_header:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 86016
	bl	_mcount
	add	x2, x20, 90112
	add	x20, x19, 3224
	mov	w1, 1
	mov	x0, x20
	ldr	x21, [x2, 232]
	bl	BsGet
	mov	w1, 5
	strb	w0, [x21, 2]
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 100]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 104]
	mov	w1, 1
	mov	x0, x20
	bl	BsSkip
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 108]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 112]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 116]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 120]
	add	x1, x19, 3100
	add	x2, x19, 3124
	ldr	x3, [x19, 3112]
	ldr	x4, [x1]
	str	x4, [x19, 3088]
	ldr	w4, [x19, 3108]
	str	w4, [x19, 3096]
	str	x3, [x1]
	ldr	w3, [x19, 3120]
	str	w3, [x19, 3108]
	ldr	x1, [x2]
	str	x1, [x19, 3112]
	ldr	w1, [x19, 3132]
	str	wzr, [x19, 3124]
	str	wzr, [x19, 3128]
	str	w1, [x19, 3120]
	str	wzr, [x19, 3132]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	group_of_pictures_header, .-group_of_pictures_header
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_extension
	.type	sequence_extension, %function
sequence_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 45056
	add	x23, x19, 90112
	add	x21, x22, 312
	bl	_mcount
	add	x21, x21, 40960
	add	x19, x19, 86016
	add	x19, x19, 3224
	ldr	x20, [x23, 232]
	mov	w1, 8
	mov	x0, x19
	ldr	w2, [x21, 2636]
	str	wzr, [x21, 2632]
	orr	w2, w2, 131072
	str	w2, [x21, 2636]
	bl	BsGet
	str	w0, [x20, 124]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 27]
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 28]
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	mov	w25, w0
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	mov	w26, w0
	mov	w1, 12
	mov	x0, x19
	bl	BsGet
	mov	w24, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L529
	ldr	w0, [x21, 2636]
	orr	w0, w0, 2
	str	w0, [x21, 2636]
.L528:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L529:
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w21, w0
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 29]
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 30]
	mov	w1, 5
	mov	x0, x19
	bl	BsGet
	and	w2, w0, 255
	ldrb	w1, [x20, 30]
	add	w2, w2, 1
	strb	w0, [x20, 31]
	add	w0, w1, 1
	ldr	x1, .LC101
	sdiv	w0, w0, w2
	add	x1, x1, 16
	ldr	w2, [x20, 88]
	ldr	w2, [x1, x2, lsl 2]
	ldr	w1, [x20, 124]
	mul	w0, w0, w2
	str	w0, [x20, 72]
	tbnz	x1, 7, .L552
	ubfx	x0, x1, 4, 3
	and	w1, w1, 15
	stp	w0, w1, [x20, 40]
.L532:
	ldp	w0, w1, [x20, 48]
	and	w1, w1, 4095
	and	w0, w0, 4095
	orr	w26, w1, w26, lsl 12
	orr	w25, w0, w25, lsl 12
	cmp	w26, wzr
	ccmp	w25, wzr, 4, ne
	stp	w25, w26, [x20, 48]
	bne	.L533
	add	x0, x22, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2636]
	orr	w1, w1, 1
	str	w1, [x0, 2636]
	ldr	w25, [x20, 48]
.L533:
	cmp	w25, 8192
	bhi	.L534
	ldr	w0, [x20, 52]
	cmp	w0, 8192
	bls	.L535
.L534:
	add	x22, x22, 312
	ldr	x0, .LC102
	add	x22, x22, 40960
	ldr	x4, [x0]
	ldr	w0, [x22, 2636]
	orr	w0, w0, 1
	str	w0, [x22, 2636]
	cbz	x4, .L535
	ldr	w0, [x23, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L535:
	ldp	w0, w3, [x20, 92]
	mov	w1, 400
	ldr	w2, [x20, 40]
	add	w24, w0, w24, lsl 18
	add	w21, w3, w21, lsl 10
	sub	w0, w2, #4
	stp	w24, w21, [x20, 92]
	mul	w24, w24, w1
	cmp	w0, 1
	str	w24, [x20, 68]
	bls	.L537
	ldr	x0, .LC102
	ldr	x4, [x0]
	cbz	x4, .L538
	ldr	w0, [x23, 856]
	mov	x2, 0
	mov	w3, 0
	mov	w1, 102
	blr	x4
	ldr	w2, [x20, 40]
.L538:
	ldr	x1, .LC104
	mov	w0, 1
	bl	dprint_vfmw
.L537:
	ldr	w2, [x20, 44]
	sub	w0, w2, #4
	cmp	w0, 6
	bls	.L528
	ldr	x0, .LC102
	ldr	x4, [x0]
	cbz	x4, .L539
	ldr	w0, [x23, 856]
	mov	x2, 0
	mov	w3, 0
	mov	w1, 102
	blr	x4
	ldr	w2, [x20, 44]
.L539:
	ldr	x1, .LC106
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L552:
	and	w1, w1, 15
	cmp	w1, 5
	bne	.L532
	mov	w1, 133
	mov	w0, 8
	stp	w1, w0, [x20, 40]
	b	.L532
	.size	sequence_extension, .-sequence_extension
	.align	3
.LC101:
	.xword	.LANCHOR1
	.align	3
.LC102:
	.xword	g_event_report
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_display_extension
	.type	sequence_display_extension, %function
sequence_display_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 45056
	bl	_mcount
	add	x0, x19, 90112
	add	x2, x21, 312
	add	x2, x2, 40960
	add	x19, x19, 86016
	add	x19, x19, 3224
	mov	w1, 3
	ldr	x20, [x0, 232]
	mov	x0, x19
	stp	wzr, wzr, [x20, 148]
	ldr	w3, [x2, 2636]
	orr	w3, w3, 262144
	str	w3, [x2, 2636]
	bl	BsGet
	str	w0, [x20, 128]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 132]
	cbnz	w0, .L560
.L554:
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 148]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L555
	add	x21, x21, 312
	add	x21, x21, 40960
	ldr	w0, [x21, 2636]
	orr	w0, w0, 4
	str	w0, [x21, 2636]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L555:
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 152]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L560:
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 136]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 140]
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 144]
	b	.L554
	.size	sequence_display_extension, .-sequence_display_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	quant_matrix_extension
	.type	quant_matrix_extension, %function
quant_matrix_extension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 86016
	bl	_mcount
	add	x20, x20, 3224
	add	x0, x21, 90112
	mov	w1, 1
	ldr	x24, [x0, 232]
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 76]
	beq	.L562
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	beq	.L580
.L564:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cbz	w0, .L568
	mov	w19, 64
	.p2align 2
.L572:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L572
.L568:
	mov	w1, 1
	mov	x0, x20
	mov	w19, 64
	bl	BsGet
	cbz	w0, .L561
	.p2align 2
.L574:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	subs	w19, w19, #1
	bne	.L574
.L561:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L562:
	ldr	x22, .LC108
	add	x23, x22, 64
	.p2align 2
.L565:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1840
	bl	BsGet
	cmp	x22, x23
	str	w0, [x21, x19, lsl 2]
	bne	.L565
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x24, 80]
	bne	.L564
.L580:
	ldr	x22, .LC108
	add	x23, x22, 64
	.p2align 2
.L569:
	ldrb	w19, [x22], 1
	mov	w1, 8
	mov	x0, x20
	add	x19, x19, 20480
	add	x19, x19, 1904
	bl	BsGet
	cmp	x23, x22
	str	w0, [x21, x19, lsl 2]
	bne	.L569
	b	.L564
	.size	quant_matrix_extension, .-quant_matrix_extension
	.align	3
.LC108:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_display_extension
	.type	picture_display_extension, %function
picture_display_extension:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 45056
	bl	_mcount
	add	x0, x23, 312
	add	x2, x19, 90112
	add	x0, x0, 40960
	add	x19, x19, 86016
	add	x19, x19, 3224
	ldr	x20, [x2, 232]
	ldr	w1, [x0, 2636]
	orr	w1, w1, 2097152
	str	w1, [x0, 2636]
	ldrb	w0, [x20, 27]
	cbz	w0, .L582
	ldrb	w0, [x20, 16]
	mov	w22, 1
	cbnz	w0, .L595
.L583:
	add	x20, x20, 164
	mov	w21, 0
	b	.L587
	.p2align 3
.L596:
	mov	w1, 16
	mov	x0, x19
	add	x20, x20, 4
	bl	BsGet
	mov	w1, 1
	str	w0, [x20, 8]
	mov	x0, x19
	bl	BsGet
	cbz	w0, .L594
	cmp	w21, w22
	bge	.L581
.L587:
	mov	w1, 16
	mov	x0, x19
	add	w21, w21, 1
	bl	BsGet
	str	w0, [x20]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L596
.L594:
	add	x0, x23, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2636]
	orr	w1, w1, 32
	str	w1, [x0, 2636]
.L581:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L582:
	ldrb	w0, [x20, 9]
	mov	w22, 1
	cmp	w0, 3
	bne	.L583
	ldrb	w1, [x20, 16]
	mov	w22, 2
	cmp	w1, wzr
	csel	w22, w22, w0, eq
	b	.L583
	.p2align 3
.L595:
	ldrb	w1, [x20, 10]
	mov	w0, 2
	mov	w22, 3
	cmp	w1, wzr
	csel	w22, w0, w22, eq
	b	.L583
	.size	picture_display_extension, .-picture_display_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_coding_extension
	.type	picture_coding_extension, %function
picture_coding_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 45056
	bl	_mcount
	add	x1, x22, 312
	add	x0, x20, 90112
	add	x1, x1, 40960
	add	x20, x20, 86016
	mov	x23, x1
	add	x20, x20, 3224
	ldr	x21, [x0, 232]
	ldr	w0, [x1, 2636]
	mov	x25, x21
	add	x24, x21, 4
	orr	w0, w0, 1048576
	str	w0, [x1, 2636]
.L598:
	mov	x19, 0
.L600:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	sub	w2, w0, #10
	add	x1, x25, x19
	add	x19, x19, 1
	uxtb	w2, w2
	cmp	w2, 4
	strb	w0, [x1, 4]
	ccmp	w0, wzr, 4, hi
	bne	.L599
	ldr	w0, [x23, 2636]
	orr	w0, w0, 16
	str	w0, [x23, 2636]
.L599:
	cmp	x19, 2
	bne	.L600
	add	x25, x25, 2
	cmp	x25, x24
	bne	.L598
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 8]
	mov	w1, w19
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 9]
	cbnz	w0, .L602
	add	x22, x22, 312
	add	x22, x22, 40960
	ldr	w0, [x22, 2636]
	orr	w0, w0, 16
	str	w0, [x22, 2636]
.L597:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L602:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 10]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 11]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 12]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 13]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 14]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 15]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 16]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 17]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 18]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x21, 3]
	cbz	w0, .L597
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 19]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 20]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 21]
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 32]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	str	w0, [x21, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	picture_coding_extension, .-picture_coding_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	extra_bit_information
	.type	extra_bit_information, %function
extra_bit_information:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 86016
	mov	w20, 0
	bl	_mcount
	add	x19, x19, 3224
	b	.L612
	.p2align 3
.L614:
	mov	w1, 8
	mov	x0, x19
	add	w20, w20, 1
	bl	BsSkip
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, 8
	ble	.L613
.L612:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	cbnz	w0, .L614
.L613:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	extra_bit_information, .-extra_bit_information
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_header
	.type	picture_header, %function
picture_header:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 86016
	bl	_mcount
	add	x19, x19, 3224
	mov	x3, 20792
	add	x0, x21, 90112
	movk	x3, 0x1, lsl 16
	mov	w1, 10
	add	x3, x21, x3
	ldr	x20, [x0, 232]
	mov	x0, x19
	ldr	w2, [x3, 2636]
	and	w2, w2, -3670073
	orr	w2, w2, 524288
	str	w2, [x3, 2636]
	bl	BsGet
	str	w0, [x20, 156]
	mov	w1, 3
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 22]
	mov	w1, 16
	mov	x0, x19
	bl	BsGet
	ldrb	w22, [x20, 22]
	str	w0, [x20, 160]
	sub	w0, w22, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L618
.L616:
	cmp	w22, 3
	beq	.L619
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L619:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 25]
	mov	w1, w22
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 26]
	mov	x0, x21
	bl	extra_bit_information
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L618:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 23]
	mov	w1, 3
	mov	x0, x19
	bl	BsGet
	ldrb	w22, [x20, 22]
	strb	w0, [x20, 24]
	b	.L616
	.size	picture_header, .-picture_header
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	copyright_extension
	.type	copyright_extension, %function
copyright_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 86016
	mov	w1, 32
	add	x0, x0, 3224
	bl	BsSkip
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	copyright_extension, .-copyright_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_temporal_scalable_extension
	.type	picture_temporal_scalable_extension, %function
picture_temporal_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	picture_temporal_scalable_extension, .-picture_temporal_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	picture_spatial_scalable_extension
	.type	picture_spatial_scalable_extension, %function
picture_spatial_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	picture_spatial_scalable_extension, .-picture_spatial_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	sequence_scalable_extension
	.type	sequence_scalable_extension, %function
sequence_scalable_extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	copyright_extension
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	sequence_scalable_extension, .-sequence_scalable_extension
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	extension
	.type	extension, %function
extension:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 86016
	bl	_mcount
	add	x19, x19, 3224
	add	x0, x20, 90112
	mov	w1, 4
	ldr	x2, [x0, 232]
	mov	x0, x19
	stp	wzr, wzr, [x2, 128]
	stp	wzr, wzr, [x2, 136]
	str	wzr, [x2, 144]
	bl	BsGet
	sub	w0, w0, #1
	cmp	w0, 9
	bhi	.L625
	ldr	x1, .LC110
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx627
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx627:
	.section	.rodata
	.align	0
	.align	2
.L627:
	.byte	(.L626 - .Lrtx627) / 4
	.byte	(.L628 - .Lrtx627) / 4
	.byte	(.L629 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.byte	(.L625 - .Lrtx627) / 4
	.byte	(.L632 - .Lrtx627) / 4
	.byte	(.L633 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.text
	.p2align 3
.L630:
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
.L625:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L629:
	mov	x0, x20
	bl	quant_matrix_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L633:
	mov	x0, x20
	bl	picture_coding_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L632:
	mov	x0, x20
	bl	picture_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L626:
	mov	x0, x20
	bl	sequence_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L628:
	mov	x0, x20
	bl	sequence_display_extension
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	extension, .-extension
	.align	3
.LC110:
	.xword	.L627
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Init
	.type	MPEG2DEC_Init, %function
MPEG2DEC_Init:
	sub	sp, sp, #896
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x27, .LC111
	ldr	w0, [x22, 648]
	cmp	w0, 1
	beq	.L642
	mov	w24, 0
	mov	w25, 0
	mov	w26, 0
	add	x21, x20, 45056
	add	x23, x20, 86016
	add	x19, x20, 90112
.L637:
	ldr	x3, [x27, 96]
	mov	x2, 25464
	mov	w1, 0
	movk	x2, 0x1, lsl 16
	mov	x0, x20
	ldr	w28, [x19, 848]
	blr	x3
	str	w28, [x19, 848]
	add	x0, x19, 248
	mov	w28, 1
	bl	ResetVoQueue
	str	x22, [x20]
	add	x1, x21, 312
	add	x0, x23, 3952
	add	x21, x1, 40960
	str	x0, [x19, 240]
	str	wzr, [x19, 868]
	add	x0, x19, 44
	str	x0, [x19, 232]
	mov	w2, 3
	str	w28, [x21, 2648]
	mov	x0, x20
	strb	w2, [x1, 1]
	str	wzr, [x21, 2712]
	ldr	w1, [x22, 8]
	str	w1, [x21, 2624]
	str	wzr, [x21, 2704]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 856]
	beq	.L643
	ldr	w20, [x22, 648]
	cmp	w20, 1
	beq	.L644
	mov	w20, w28
.L639:
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 896
	ret
	.p2align 3
.L644:
	ldr	w0, [x21, 2636]
	add	x1, x29, 480
	ldr	x3, [x27, 104]
	mov	x2, 256
	orr	w0, w0, 65536
	str	w24, [x21, 2632]
	str	w0, [x21, 2636]
	add	x0, x23, 3264
	str	w26, [x21, 2692]
	str	w25, [x21, 2704]
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 736
	mov	x2, 256
	add	x0, x23, 3520
	blr	x3
	ldr	x3, [x27, 104]
	add	x1, x29, 96
	ldr	x0, [x19, 232]
	mov	x2, 188
	blr	x3
	ldr	x0, [x19, 240]
	mov	x2, 188
	ldr	x3, [x27, 104]
	add	x1, x29, 288
	blr	x3
	b	.L639
	.p2align 3
.L642:
	add	x21, x20, 45056
	ldr	x4, [x27, 104]
	add	x3, x21, 312
	add	x23, x20, 86016
	add	x3, x3, 40960
	add	x1, x23, 3264
	mov	x2, 256
	add	x0, x29, 480
	add	x19, x20, 90112
	ldr	w24, [x3, 2632]
	ldr	w26, [x3, 2692]
	ldr	w25, [x3, 2704]
	blr	x4
	ldr	x3, [x27, 104]
	add	x1, x23, 3520
	mov	x2, 256
	add	x0, x29, 736
	blr	x3
	ldr	x1, [x19, 232]
	mov	x2, 188
	ldr	x3, [x27, 104]
	add	x0, x29, 96
	blr	x3
	ldr	x1, [x19, 240]
	mov	x2, 188
	ldr	x3, [x27, 104]
	add	x0, x29, 288
	blr	x3
	b	.L637
.L643:
	ldr	x1, .LC113
	mov	w0, 0
	mov	w20, -20
	bl	dprint_vfmw
	b	.L639
	.size	MPEG2DEC_Init, .-MPEG2DEC_Init
	.align	3
.LC111:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC113:
	.xword	.LC112
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Destroy
	.type	MPEG2DEC_Destroy, %function
MPEG2DEC_Destroy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, 20792
	ldr	x1, .LC115
	movk	x0, 0x1, lsl 16
	add	x2, x19, x0
	mov	w0, 2
	ldr	w2, [x2, 2644]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG2DEC_Destroy, .-MPEG2DEC_Destroy
	.align	3
.LC115:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_RecycleImage
	.type	MPEG2DEC_RecycleImage, %function
MPEG2DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbz	x20, .L651
	add	x20, x20, 90112
	mov	w1, w19
	mov	w2, 0
	ldr	w0, [x20, 856]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 856]
	mov	w1, w19
	bl	FSP_GetFsImagePtr
	add	x19, x0, 600
	add	x21, x0, 632
	cbz	x0, .L650
.L652:
	ldr	x1, [x19]
	ldr	w0, [x20, 856]
	bl	FreeUsdByDec
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L652
.L650:
	mov	w0, 1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L651:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MPEG2DEC_RecycleImage, .-MPEG2DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_GetRemainImg
	.type	MPEG2DEC_GetRemainImg, %function
MPEG2DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 90112
	bl	_mcount
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L655
	add	x23, x19, 45056
	add	x20, x19, 90112
	add	x21, x23, 312
	add	x21, x21, 40960
	ldr	w0, [x20, 856]
	ldr	w1, [x21, 2736]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L655
	ldr	w0, [x20, 856]
	ldr	w1, [x21, 2736]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L674
.L655:
	add	x21, x20, 248
.L661:
	mov	x0, x21
	bl	GetVoLastImageID
.L669:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L674:
	mov	x0, x19
	bl	MP2_SetImgFormat
	add	x1, x19, 86016
	add	x0, x22, 600
	add	x1, x1, 2968
	add	x3, x22, 632
.L657:
	ldr	x2, [x1]
	cbz	x2, .L656
	str	x2, [x0]
.L656:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x3
	bne	.L657
	add	x23, x23, 312
	mov	w0, 1
	add	x23, x23, 40960
	mov	w2, w0
	add	x21, x20, 248
	str	wzr, [x23, 2688]
	str	w0, [x22, 212]
	ldr	w1, [x22, 180]
	ldr	w0, [x20, 856]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 856]
	mov	x4, x22
	mov	x3, x21
	mov	x2, x19
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L658
	ldr	w1, [x22, 180]
	mov	x0, x19
	bl	MPEG2DEC_RecycleImage
	b	.L661
	.p2align 3
.L658:
	ldr	w0, [x22, 184]
	cmp	w0, 100
	bhi	.L655
	ldr	w0, [x22, 128]
	cmp	w0, 31
	bls	.L655
	ldr	w1, [x22, 132]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L669
	b	.L661
	.size	MPEG2DEC_GetRemainImg, .-MPEG2DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_GetImageBuffer
	.type	MPEG2DEC_GetImageBuffer, %function
MPEG2DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 45056
	add	x0, x0, 312
	ldrb	w1, [x0, 1]
	cmp	w1, 3
	beq	.L676
	add	x0, x0, 40960
	ldr	w0, [x0, 2648]
	cbz	w0, .L678
.L676:
	add	x19, x19, 90112
	ldr	w0, [x19, 856]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L678
	ldr	w0, [x19, 856]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	bne	.L677
	ldr	w0, [x19, 856]
	add	x1, x19, 248
	bl	FSP_ClearNotInVoQueue
	b	.L677
	.p2align 3
.L678:
	mov	w20, 1
.L677:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MPEG2DEC_GetImageBuffer, .-MPEG2DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ClearCurPacket
	.type	MP2_ClearCurPacket, %function
MP2_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 20]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrsb	w0, [x19]
	cmp	w0, 1
	beq	.L687
	ldr	w1, [x19, 24]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L687:
	ldr	x3, .LC116
	mov	x2, 48
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_ClearCurPacket, .-MP2_ClearCurPacket
	.align	3
.LC116:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ReceivePacket
	.type	MP2_ReceivePacket, %function
MP2_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	mov	w22, w2
	bl	_mcount
	cbz	x20, .L697
	add	x1, x19, 40960
	str	wzr, [x1, 2568]
	ldr	w0, [x20, 20]
	str	w0, [x1, 2628]
	ldr	w0, [x20, 16]
	str	w0, [x1, 2580]
	ldr	x0, [x20]
	str	x0, [x1, 2608]
	ldr	w0, [x20, 20]
	str	w0, [x1, 2588]
	ldrb	w0, [x20, 10]
	strb	w0, [x1, 2576]
	ldr	w0, [x20, 24]
	str	w0, [x1, 2596]
	ldrb	w21, [x20, 10]
	cmp	w21, 1
	beq	.L694
	ldr	w0, [x20, 104]
	mov	w21, 1
	str	w0, [x1, 2584]
	ldr	x0, [x20, 88]
	str	x0, [x1, 2616]
	ldr	w0, [x20, 108]
	str	w0, [x1, 2592]
	ldrb	w0, [x20, 98]
	strb	w0, [x1, 2577]
	ldr	w0, [x20, 112]
	str	w0, [x1, 2600]
	ldrb	w0, [x20, 98]
	cmp	w0, w21
	beq	.L693
	add	x1, x1, 2576
	mov	w0, w22
	bl	MP2_ClearCurPacket
	ldrb	w2, [x20, 98]
	mov	w0, w21
	ldr	x1, .LC120
	mov	w21, 0
	bl	dprint_vfmw
.L693:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L694:
	strb	wzr, [x1, 2577]
	mov	w0, w21
	str	wzr, [x1, 2584]
	str	wzr, [x1, 2592]
	str	wzr, [x1, 2600]
	str	xzr, [x1, 2616]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L697:
	add	x19, x19, 40960
	ldr	x1, .LC118
	mov	w0, 1
	mov	w21, 0
	ldr	w2, [x19, 2644]
	bl	dprint_vfmw
	b	.L693
	.size	MP2_ReceivePacket, .-MP2_ReceivePacket
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC120:
	.xword	.LC119
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ClearCurPic
	.type	MP2_ClearCurPic, %function
MP2_ClearCurPic:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 16
	mov	w20, 0
	bl	_mcount
	add	x21, x21, 90112
	add	x0, x22, 45056
	mov	x23, x0
	ldr	w0, [x0, 272]
	cbnz	w0, .L707
	b	.L702
	.p2align 3
.L700:
	ldr	w0, [x23, 272]
	cmp	w0, w20
	bls	.L702
.L707:
	sxtw	x19, w20
	ldr	w0, [x21, 856]
	lsl	x1, x19, 2
	add	w20, w20, 1
	sub	x1, x1, x19
	lsl	x1, x1, 2
	sub	x19, x1, x19
	add	x19, x22, x19, lsl 2
	ldr	w1, [x19, 296]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x19, 276]
	cbz	w0, .L700
	ldr	w0, [x19, 284]
	cbz	w0, .L700
	ldr	w1, [x19, 300]
	ldr	w0, [x21, 856]
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x23, 272]
	cmp	w0, w20
	bhi	.L707
.L702:
	add	x22, x22, 45056
	str	wzr, [x22, 272]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MP2_ClearCurPic, .-MP2_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_VDMPostProc
	.type	MPEG2DEC_VDMPostProc, %function
MPEG2DEC_VDMPostProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 45056
	add	x19, x20, 90112
	add	x21, x22, 312
	mov	w25, w1
	add	x21, x21, 40960
	bl	_mcount
	ldrb	w0, [x20, 160]
	mov	w2, w25
	ldr	x1, .LC122
	add	x23, x20, 16
	ldr	x24, [x19, 232]
	strb	w0, [x21, 2836]
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x0, [x19, 232]
	ldr	x1, [x20]
	ldr	w2, [x0, 40]
	str	w2, [x1, 608]
	ldr	x1, [x20]
	ldr	w0, [x0, 44]
	str	w0, [x1, 612]
	ldr	w1, [x19, 864]
	ldr	w0, [x19, 860]
	ldr	x2, [x20]
	cmp	w0, w1
	sub	w0, w0, w1
	csel	w1, w0, wzr, ge
	mov	x0, x20
	str	w1, [x2, 616]
	bl	MP2_ClearCurPic
	ldr	x3, .LC123
	mov	x2, 45348
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w1, [x21, 2740]
	ldr	w0, [x19, 856]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	ldr	w1, [x21, 2736]
	ldr	w0, [x19, 856]
	bl	FSP_GetFsImagePtr
	mov	x26, x0
	ldr	w1, [x21, 2732]
	ldr	w0, [x19, 856]
	bl	FSP_GetFsImagePtr
	cbz	x23, .L777
	ldrb	w0, [x24, 22]
	strb	w0, [x22, 312]
	str	w25, [x23, 184]
	tbnz	w25, #31, .L716
	cmp	w25, 100
	mov	w1, 100
	csel	w1, w25, w1, le
	str	w1, [x23, 184]
	ldrb	w0, [x24, 22]
	cmp	w0, 3
	beq	.L717
	ldr	x0, [x20]
	ldr	w0, [x0]
	cmp	w1, w0
	bhi	.L778
.L717:
	ldr	x1, .LC127
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP2_SetImgFormat
	ldr	x0, [x20]
	ldr	w0, [x0, 636]
	cmp	w0, 1
	beq	.L779
	stp	wzr, wzr, [x23, 96]
.L723:
	ldrb	w0, [x24, 9]
	cmp	w0, 3
	beq	.L724
	add	x1, x22, 312
	mov	w0, 1
	add	x1, x1, 40960
	ldr	w1, [x1, 2648]
	cmp	w1, w0
	beq	.L724
.L763:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L778:
	ldr	w0, [x19, 856]
	mov	w2, 1
	ldr	w1, [x21, 2740]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 856]
	ldr	w1, [x21, 2736]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L719
	ldr	w0, [x19, 856]
	ldr	x1, [x20, 600]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x20, 608]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x20, 616]
	bl	FreeUsdByDec
	ldr	w0, [x19, 856]
	ldr	x1, [x20, 624]
	bl	FreeUsdByDec
	add	x0, x20, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w0, [x19, 856]
	ldr	w1, [x21, 2736]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 856]
	mov	w2, 1
	ldr	w1, [x21, 2732]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 2732]
	str	wzr, [x21, 2736]
	ldr	w0, [x19, 856]
	bl	FSP_GetFspType
	cbz	w0, .L719
	ldr	w0, [x19, 856]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 2732]
	str	w0, [x21, 2736]
.L719:
	add	x22, x22, 312
	mov	w0, 1
	add	x22, x22, 40960
	str	wzr, [x22, 2696]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L724:
	add	x21, x20, 86016
	add	x0, x23, 600
	add	x1, x21, 2968
	add	x23, x23, 632
.L726:
	ldr	x2, [x1]
	cbz	x2, .L725
	str	x2, [x0]
.L725:
	add	x0, x0, 8
	str	xzr, [x1], 8
	cmp	x0, x23
	bne	.L726
	add	x0, x22, 312
	add	x0, x0, 40960
	str	wzr, [x0, 2688]
	ldr	x1, [x20]
	ldr	w1, [x1, 12]
	cmp	w1, 1
	beq	.L727
	ldrb	w1, [x24, 22]
	cmp	w1, 3
	beq	.L727
	ldr	w1, [x0, 2732]
	str	w1, [x0, 2744]
.L728:
	cmn	w1, #1
	beq	.L730
	ldr	w0, [x19, 856]
	bl	FSP_GetDisplay
	cmp	w0, 1
	beq	.L734
	add	x1, x22, 312
	ldr	w0, [x19, 856]
	add	x1, x1, 40960
	ldr	w1, [x1, 2744]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L734
.L730:
	ldrb	w0, [x24, 27]
	cmp	w0, 1
	beq	.L780
	ldrb	w0, [x24, 18]
	cmp	w0, 1
	beq	.L781
	add	x1, x22, 312
	add	x1, x1, 40960
	ldr	w0, [x1, 2820]
	add	w0, w0, 1
	str	w0, [x1, 2820]
	lsl	w0, w0, 1
	str	w0, [x1, 2816]
.L742:
	ldr	w1, [x21, 3124]
	add	x22, x22, 312
	mov	w0, 1
	add	x22, x22, 40960
	add	w1, w1, w0
	str	w1, [x21, 3124]
	ldr	w1, [x22, 2644]
	add	w1, w1, w0
	str	w1, [x22, 2644]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L716:
	str	wzr, [x23, 184]
	b	.L717
	.p2align 3
.L779:
	ldr	x1, .LC128
	ldr	x1, [x1]
	ldr	w2, [x1, 4180]
	ldr	w1, [x1, 4184]
	cmp	w1, wzr
	csinc	w1, w1, wzr, ne
	udiv	w1, w2, w1
	stp	w0, w1, [x23, 96]
	b	.L723
	.p2align 3
.L781:
	add	x0, x22, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2820]
	ldr	w2, [x0, 2816]
	add	w1, w1, 1
	str	w1, [x0, 2820]
	ldrb	w1, [x24, 16]
	add	w1, w1, 2
	add	w1, w1, w2
	str	w1, [x0, 2816]
	b	.L742
	.p2align 3
.L734:
	add	x1, x22, 312
	ldr	w0, [x19, 856]
	add	x1, x1, 40960
	ldr	w1, [x1, 2744]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L782
	ldr	w2, [x0, 184]
	cbz	w2, .L736
	ldr	x0, [x20]
	ldr	w3, [x0, 4]
	cmp	w2, w3
	bhi	.L737
.L736:
	add	x25, x22, 312
	ldr	w0, [x19, 856]
	add	x25, x25, 40960
	ldr	w26, [x25, 2744]
	mov	w1, w26
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC131
	mov	w2, w26
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w0, [x19, 856]
	mov	w2, 1
	ldr	w1, [x25, 2744]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 856]
	mov	x4, x23
	add	x3, x19, 248
	mov	x2, x20
	mov	w1, 3
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L738
	add	x20, x23, 600
	add	x23, x23, 632
.L739:
	ldr	x1, [x20]
	ldr	w0, [x19, 856]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x23
	bne	.L739
	add	x1, x22, 312
	ldr	w0, [x19, 856]
	add	x1, x1, 40960
	mov	w2, 0
	ldr	w1, [x1, 2744]
	bl	FSP_SetDisplay
	mov	w0, 0
	b	.L763
	.p2align 3
.L727:
	add	x0, x22, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2740]
	str	w1, [x0, 2744]
	b	.L728
	.p2align 3
.L780:
	add	x0, x22, 312
	ldrb	w2, [x24, 16]
	add	x0, x0, 40960
	ldrb	w1, [x24, 10]
	add	w1, w2, w1
	ldr	w2, [x0, 2820]
	add	w1, w1, 1
	add	w1, w1, w2
	str	w1, [x0, 2820]
	lsl	w1, w1, 1
	str	w1, [x0, 2816]
	b	.L742
	.p2align 3
.L737:
	ldr	x1, .LC133
	mov	w0, 1
	add	x20, x23, 600
	add	x23, x23, 632
	bl	dprint_vfmw
.L740:
	ldr	x1, [x20]
	ldr	w0, [x19, 856]
	bl	FreeUsdByDec
	str	xzr, [x20], 8
	cmp	x20, x23
	bne	.L740
	add	x1, x22, 312
	ldr	w0, [x19, 856]
	add	x1, x1, 40960
	mov	w2, 0
	ldr	w1, [x1, 2744]
	bl	FSP_SetDisplay
	b	.L730
	.p2align 3
.L777:
	ldr	x1, .LC125
	mov	x4, x0
	mov	x3, x26
	mov	x2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L763
	.p2align 3
.L738:
	ldr	w0, [x19, 864]
	add	w0, w0, 1
	str	w0, [x19, 864]
	b	.L730
.L782:
	ldr	x1, .LC129
	mov	w2, 3609
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L763
	.size	MPEG2DEC_VDMPostProc, .-MPEG2DEC_VDMPostProc
	.align	3
.LC122:
	.xword	.LC121
	.align	3
.LC123:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC128:
	.xword	g_HwMem
	.align	3
.LC129:
	.xword	.LC56
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC133:
	.xword	.LC132
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_u_v
	.type	MP2_u_v, %function
MP2_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x2
	mov	w21, w1
	bl	_mcount
	mov	w1, w21
	mov	x0, x20
	bl	BsShow
	mov	w19, w0
	mov	w1, w21
	mov	x0, x20
	bl	BsSkip
	ldr	x1, .LC135
	mov	w3, w19
	mov	x2, x22
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_u_v, .-MP2_u_v
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecSliceHeader
	.type	MP2_DecSliceHeader, %function
MP2_DecSliceHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 4]
	mov	w1, 1
	str	wzr, [x20, 24]
	mov	w4, 0
	cmp	w0, 175
	str	w1, [x20, 16]
	ldr	x19, [x20, 56]
	bls	.L785
	ldr	w0, [x20]
	cbz	w0, .L796
.L785:
	ldr	w3, [x20, 20]
	mov	w1, 5
	ldr	w5, [x20, 8]
	mov	x0, x19
	sub	w3, w3, #1
	ldr	x2, .LC139
	add	w4, w3, w4
	mul	w3, w4, w5
	cmp	w3, wzr
	cset	w4, ne
	sub	w3, w3, w4
	str	w3, [x20, 28]
	bl	MP2_u_v
	str	wzr, [x20, 32]
	str	w0, [x20, 44]
	mov	w1, 1
	mov	x0, x19
	bl	BsShow
	cbnz	w0, .L787
	ldr	x20, .LC141
.L789:
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L787:
	ldr	x2, .LC143
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	ldr	x2, .LC145
	mov	w1, 1
	mov	x0, x19
	bl	MP2_u_v
	str	w0, [x20, 32]
	ldr	x2, .LC147
	mov	w1, 7
	mov	x0, x19
	bl	MP2_u_v
	ldr	x20, .LC141
	ldr	x21, .LC149
	b	.L788
	.p2align 3
.L797:
	bl	BsShow
	cbz	w0, .L789
	mov	w1, 1
	mov	x2, x20
	mov	x0, x19
	bl	MP2_u_v
	mov	x2, x21
	mov	w1, 8
	mov	x0, x19
	bl	MP2_u_v
.L788:
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, wzr
	mov	w1, 1
	mov	x0, x19
	bgt	.L797
	b	.L789
	.p2align 3
.L796:
	ldr	x2, .LC137
	mov	w1, 3
	mov	x0, x19
	bl	MP2_u_v
	lsl	w4, w0, 7
	str	w0, [x20, 24]
	b	.L785
	.size	MP2_DecSliceHeader, .-MP2_DecSliceHeader
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_ExitMb
	.type	MP2_ExitMb, %function
MP2_ExitMb:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	wzr, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_ExitMb, .-MP2_ExitMb
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_WriteSliceInfo
	.type	MP2_WriteSliceInfo, %function
MP2_WriteSliceInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 16
	bl	_mcount
	add	x2, x21, 45056
	add	x0, x20, 86016
	ldr	w2, [x2, 272]
	ldr	w4, [x0, 3192]
	cmp	w2, 1023
	uxtw	x3, w2
	lsl	x19, x3, 2
	sub	x19, x19, x3
	lsl	x19, x19, 2
	sub	x19, x19, x3
	add	x19, x21, x19, lsl 2
	str	w4, [x19, 308]
	ldr	w3, [x0, 3204]
	str	w3, [x19, 312]
	ldr	w1, [x0, 3200]
	str	w1, [x19, 304]
	bhi	.L805
	mov	x1, 20792
	add	x0, x0, 3224
	movk	x1, 0x1, lsl 16
	add	x20, x20, x1
	ldr	w1, [x0, 32]
	ldr	w2, [x20, 2580]
	and	w3, w1, 7
	str	w3, [x19, 288]
	add	w1, w2, w1, lsr 3
	str	w1, [x19, 272]
	ldr	w1, [x20, 2596]
	str	w1, [x19, 296]
	bl	BsResidBits
	str	w0, [x19, 280]
	ldrsh	w0, [x20, 2576]
	cmp	w0, 1
	beq	.L806
	cmp	w0, 256
	bne	.L804
	ldr	w0, [x20, 2584]
	str	w0, [x19, 276]
	str	wzr, [x19, 292]
	ldr	w0, [x20, 2600]
	str	w0, [x19, 300]
	ldr	w0, [x20, 2592]
	lsl	w0, w0, 3
	str	w0, [x19, 284]
.L803:
	add	x21, x21, 45056
	mov	w0, 1
	ldr	w1, [x21, 272]
	add	w1, w1, w0
	str	w1, [x21, 272]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L805:
	ldr	x1, .LC151
	mov	w3, 1024
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	MP2_ClearCurPic
	mov	x0, 20792
	mov	w1, -5767169
	movk	x0, 0x1, lsl 16
	add	x20, x20, x0
	mov	w0, 0
	ldr	w2, [x20, 2636]
	str	wzr, [x20, 2712]
	and	w1, w2, w1
	str	w1, [x20, 2636]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L806:
	str	wzr, [x19, 276]
	str	wzr, [x19, 284]
	str	wzr, [x19, 292]
	str	wzr, [x19, 300]
	b	.L803
	.p2align 3
.L804:
	ldrsb	w3, [x20, 2577]
	mov	w0, 1
	ldrsb	w2, [x20, 2576]
	ldr	x1, .LC153
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_WriteSliceInfo, .-MP2_WriteSliceInfo
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_MbAddrInc
	.type	MP2_MbAddrInc, %function
MP2_MbAddrInc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 4
	mov	x0, x21
	bl	BsShow
	ldr	x20, .LC154
	ubfiz	x0, x0, 3, 32
	add	x1, x20, 80
	add	x2, x1, x0
	ldr	w19, [x1, x0]
	ldr	w1, [x2, 4]
	cmp	w19, 6
	bls	.L811
	cmp	w19, 9
	beq	.L812
	mov	w1, 11
	mov	x0, x21
	add	x20, x20, 208
	bl	BsShow
	and	w0, w0, 127
	sub	w1, w0, #24
	ldr	x2, .LC156
	lsl	x1, x1, 3
	mov	x0, x21
	add	x3, x20, x1
	ldr	w19, [x20, x1]
	ldr	w1, [x3, 4]
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L811:
	ldr	x2, .LC156
	mov	x0, x21
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L812:
	ldr	x2, .LC156
	mov	x0, x21
	bl	MP2_u_v
	ldr	x21, [sp, 32]
	sub	w0, w19, w0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_MbAddrInc, .-MP2_MbAddrInc
	.align	3
.LC154:
	.xword	.LANCHOR1
	.align	3
.LC156:
	.xword	.LC155
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_InitMb
	.type	MP2_InitMb, %function
MP2_InitMb:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x21, .LC162
	ldr	x19, [x22, 56]
	b	.L814
	.p2align 3
.L818:
	cmp	w0, 15
	beq	.L815
	cmp	w0, 8
	add	w20, w20, 33
	bne	.L826
.L815:
	mov	x2, x21
	mov	w1, 11
	mov	x0, x19
	bl	MP2_u_v
.L814:
	mov	w1, 11
	mov	x0, x19
	bl	BsShow
	cmp	w0, 23
	bls	.L818
	mov	x0, x19
	bl	MP2_MbAddrInc
	ldr	w1, [x22, 16]
	cbz	w1, .L819
	ldr	w2, [x22, 28]
	add	w0, w20, w0
	cbnz	w2, .L827
	sub	w2, w0, #1
.L821:
	ldr	w3, [x22, 12]
	mov	w0, 1
	str	w2, [x22, 40]
	sub	w3, w3, #1
	cmp	w2, w3
	bls	.L817
	ldr	x1, .LC164
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L826:
	ldr	x1, .LC160
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L817:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L827:
	add	w2, w0, w2
	b	.L821
	.p2align 3
.L819:
	ldr	x1, .LC166
	mov	w2, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MP2_InitMb, .-MP2_InitMb
	.align	3
.LC160:
	.xword	.LC159
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC166:
	.xword	.LC165
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetFirstMbInSlice
	.type	MP2_GetFirstMbInSlice, %function
MP2_GetFirstMbInSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MP2_DecSliceHeader
	mov	x0, x19
	bl	MP2_InitMb
	str	wzr, [x19, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_GetFirstMbInSlice, .-MP2_GetFirstMbInSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_DecSlice
	.type	MP2_DecSlice, %function
MP2_DecSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	add	x20, x21, 90112
	bl	_mcount
	and	w22, w22, 255
	mov	x2, 20792
	add	x1, x21, 86016
	movk	x2, 0x1, lsl 16
	ldr	x3, [x20, 232]
	add	x2, x21, x2
	add	x19, x1, 3160
	add	x4, x1, 3224
	mov	x0, x19
	ldr	x5, [x2, 2608]
	str	x5, [x1, 3208]
	ldr	w5, [x2, 2588]
	str	w5, [x1, 3196]
	ldr	w2, [x2, 2692]
	cmp	w2, 1
	cset	w2, eq
	str	w2, [x1, 3160]
	ldr	w1, [x3, 60]
	str	w1, [x19, 4]
	ldr	w1, [x3, 56]
	str	w1, [x19, 8]
	ldp	w2, w1, [x3, 48]
	str	w22, [x19, 20]
	add	w2, w2, 15
	add	w1, w1, 15
	lsr	w2, w2, 4
	lsr	w1, w1, 4
	str	x4, [x19, 56]
	mul	w1, w2, w1
	str	w1, [x19, 12]
	bl	MP2_DecSliceHeader
	mov	x0, x19
	bl	MP2_InitMb
	str	wzr, [x19, 16]
	cmp	w0, 1
	mov	w22, w0
	beq	.L830
	ldr	x1, .LC168
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC169
	ldr	x4, [x0]
	cbz	x4, .L840
.L841:
	ldr	w0, [x20, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L840:
	mov	w0, 0
.L832:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L830:
	mov	x0, x21
	bl	MP2_WriteSliceInfo
	cmp	w0, 1
	beq	.L832
	ldr	x1, .LC171
	mov	w0, w22
	bl	dprint_vfmw
	ldr	x0, .LC169
	ldr	x4, [x0]
	cbnz	x4, .L841
	b	.L840
	.size	MP2_DecSlice, .-MP2_DecSlice
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC169:
	.xword	g_event_report
	.align	3
.LC171:
	.xword	.LC170
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetHDR
	.type	MP2_GetHDR, %function
MP2_GetHDR:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 90112
	add	x19, x22, 86016
	bl	_mcount
	add	x19, x19, 3224
	mov	w1, 32
	add	x23, x22, 45056
	strb	wzr, [x24, 872]
	mov	x0, x19
	add	x21, x23, 312
	add	x21, x21, 40960
	ldp	x25, x26, [x24, 232]
	bl	BsShow
	mov	w20, w0
	mov	x0, x19
	ldr	w27, [x21, 2636]
	bl	BsPos
	str	w0, [x21, 2716]
	mov	w1, 32
	mov	x0, x19
	bl	BsSkip
	cmp	w20, 439
	beq	.L914
	mov	w0, 440
	cmp	w20, 435
	ccmp	w20, w0, 4, ne
	bne	.L849
.L845:
	add	x0, x23, 312
	add	x0, x0, 40960
	ldr	w1, [x0, 2712]
	cmp	w1, 1
	beq	.L915
.L846:
	cmp	w20, 435
	beq	.L851
.L918:
	ble	.L916
	cmp	w20, 437
	beq	.L855
	blt	.L872
	cmp	w20, 439
	beq	.L872
	cmp	w20, 440
	bne	.L850
	add	x20, x23, 312
	mov	x0, x19
	add	x20, x20, 40960
	ldr	w1, [x20, 2568]
	ldr	w21, [x20, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x1, .LC179
	add	w2, w21, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x22
	bl	group_of_pictures_header
	mov	x0, x19
	bl	BsResidBits
	tbnz	w0, #31, .L917
.L872:
	mov	w19, 0
.L848:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L849:
	mov	w0, 439
	cmp	w20, 256
	ccmp	w20, w0, 4, ne
	beq	.L845
	cmp	w20, 435
	bne	.L918
.L851:
	add	x20, x23, 312
	add	x20, x20, 40960
	ldr	w0, [x20, 2568]
	ldr	w21, [x20, 2708]
	add	w21, w21, w0
	mov	x0, x19
	bl	BsPos
	add	w2, w21, w0, lsr 3
	ldr	x1, .LC174
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x22
	bl	sequence_header
	mov	x0, x19
	bl	BsResidBits
	tbnz	w0, #31, .L919
	ldr	w0, [x20, 2636]
	and	w0, w0, 7
	cbnz	w0, .L860
	mov	w0, 1
	mov	x2, 188
	strb	w0, [x25]
	mov	x1, x25
	mov	x0, x26
	mov	w19, 0
	bl	memcpy
	ldr	w0, [x20, 2640]
	add	w0, w0, 1
	str	w0, [x20, 2640]
	b	.L848
	.p2align 3
.L916:
	cmp	w20, 256
	beq	.L853
	blt	.L850
	cmp	w20, 433
	blt	.L850
	add	x23, x23, 312
	mov	x0, x19
	add	x23, x23, 40960
	ldr	w1, [x23, 2568]
	ldr	w19, [x23, 2708]
	add	w19, w19, w1
	bl	BsPos
	ldr	x1, .LC187
	add	w2, w19, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x22
	bl	MP2_GetUsrData
	mov	w19, w0
	cbnz	w0, .L866
	ldr	w0, [x24, 856]
	add	x1, x23, 2576
	bl	MP2_ClearCurPacket
	ldr	x0, .LC175
	ldr	x4, [x0]
	cbz	x4, .L873
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w19, -1
	blr	x4
	b	.L848
	.p2align 3
.L853:
	add	x20, x23, 312
	mov	x0, x19
	add	x20, x20, 40960
	ldr	w1, [x20, 2568]
	ldr	w21, [x20, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x1, .LC183
	add	w2, w21, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x22
	bl	picture_header
	mov	x0, x19
	bl	BsResidBits
	tbz	w0, #31, .L872
	ldr	x0, .LC175
	str	w27, [x20, 2636]
	ldr	x4, [x0]
	cbz	x4, .L865
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L865:
	ldr	w0, [x24, 856]
	mov	x1, 43848
	add	x1, x23, x1
	mov	w19, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC185
	mov	w2, 256
	mov	w0, 1
	bl	dprint_vfmw
	b	.L848
	.p2align 3
.L915:
	ldr	w2, [x0, 2636]
	tbz	x2, 22, .L846
	strb	w1, [x24, 872]
	orr	w2, w2, 8388608
	str	wzr, [x0, 2712]
	mov	w19, w1
	str	w2, [x0, 2636]
	mov	x0, x22
	bl	MP2_ProtocolPPSCheck
	b	.L848
	.p2align 3
.L914:
	ldr	x0, .LC172
	mov	x2, 40
	mov	x1, x19
	ldr	x3, [x0, 104]
	add	x0, x29, 104
	blr	x3
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w28, w0
	mov	w1, 32
	add	x0, x29, 104
	bl	BsGet
	mov	w1, 20553
	movk	w1, 0x4853, lsl 16
	cmp	w28, w1
	mov	w1, 20036
	movk	w1, 0x4345, lsl 16
	ccmp	w0, w1, 0, eq
	bne	.L845
	ldr	w19, [x21, 2712]
	cmp	w19, 1
	beq	.L920
.L847:
	mov	w0, 1
	mov	w19, 0
	strb	w0, [x24, 874]
	b	.L848
	.p2align 3
.L850:
	sub	w0, w20, #257
	cmp	w0, 174
	bhi	.L868
	add	x21, x23, 312
	add	x21, x21, 40960
	ldr	w0, [x21, 2632]
	cbz	w0, .L869
.L871:
	add	x23, x23, 312
	mov	w1, 589824
	add	x23, x23, 40960
	ldr	w0, [x23, 2636]
	tst	w0, w1
	beq	.L872
	orr	w0, w0, 4194304
	mov	w21, 1
	str	w0, [x23, 2636]
	mov	w1, w20
	str	w21, [x23, 2712]
	mov	x0, x22
	bl	MP2_DecSlice
	cmp	w0, w21
	mov	w19, w0
	beq	.L848
	ldr	x1, .LC193
	mov	w2, w20
	mov	w0, w21
	mov	w19, 0
	bl	dprint_vfmw
	b	.L848
	.p2align 3
.L855:
	add	x20, x23, 312
	mov	x0, x19
	add	x20, x20, 40960
	ldr	w1, [x20, 2568]
	ldr	w21, [x20, 2708]
	add	w21, w21, w1
	bl	BsPos
	ldr	x1, .LC191
	add	w2, w21, w0, lsr 3
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x22
	bl	extension
	mov	x0, x19
	bl	BsResidBits
	tbz	w0, #31, .L872
	ldr	x0, .LC175
	str	w27, [x20, 2636]
	ldr	x4, [x0]
	cbz	x4, .L867
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L867:
	mov	x1, 43848
	ldr	w0, [x24, 856]
	add	x1, x23, x1
	mov	w19, -1
	bl	MP2_ClearCurPacket
	b	.L848
	.p2align 3
.L860:
	ldrb	w0, [x26]
	cmp	w0, 1
	beq	.L921
.L868:
	ldr	x0, .LC175
	ldr	x4, [x0]
	cbz	x4, .L872
.L910:
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w19, 0
	blr	x4
	b	.L848
	.p2align 3
.L866:
	ldr	x1, .LC189
	mov	w0, 1
	bl	dprint_vfmw
	b	.L848
	.p2align 3
.L920:
	ldr	w0, [x21, 2636]
	tbz	x0, 22, .L847
	strb	w19, [x24, 874]
	orr	w0, w0, 8388608
	strb	w19, [x24, 872]
	str	w0, [x21, 2636]
	mov	x0, x22
	str	wzr, [x21, 2712]
	bl	MP2_ProtocolPPSCheck
	b	.L848
	.p2align 3
.L873:
	mov	w19, -1
	b	.L848
	.p2align 3
.L869:
	mov	x0, x22
	mov	w19, 0
	bl	MP2_GetSequenceInfo
	ldr	w0, [x21, 2704]
	cbz	w0, .L848
	ldrb	w0, [x24, 873]
	cmp	w0, 1
	beq	.L848
	ldr	w0, [x21, 2632]
	cbnz	w0, .L871
	b	.L848
	.p2align 3
.L921:
	mov	x1, x26
	mov	x2, 188
	mov	x0, x25
	bl	memcpy
	ldr	x1, .LC175
	ldr	w0, [x20, 2636]
	ldr	x4, [x1]
	and	w0, w0, -8
	str	w0, [x20, 2636]
	cbnz	x4, .L910
	b	.L872
.L917:
	ldr	x0, .LC175
	str	w27, [x20, 2636]
	ldr	x4, [x0]
	cbz	x4, .L864
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L864:
	ldr	w0, [x24, 856]
	mov	x1, 43848
	add	x1, x23, x1
	mov	w19, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC181
	mov	w2, 440
	mov	w0, 1
	bl	dprint_vfmw
	b	.L848
.L919:
	ldr	x0, .LC175
	str	w27, [x20, 2636]
	ldr	x4, [x0]
	cbz	x4, .L859
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L859:
	ldr	w0, [x24, 856]
	mov	x1, 43848
	add	x1, x23, x1
	mov	w19, -1
	bl	MP2_ClearCurPacket
	ldr	x1, .LC177
	mov	w2, 435
	mov	w0, 1
	bl	dprint_vfmw
	b	.L848
	.size	MP2_GetHDR, .-MP2_GetHDR
	.align	3
.LC172:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC175:
	.xword	g_event_report
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC181:
	.xword	.LC180
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC187:
	.xword	.LC186
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MPEG2DEC_Decode
	.type	MPEG2DEC_Decode, %function
MPEG2DEC_Decode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	add	x21, x19, 86016
	bl	_mcount
	add	x22, x21, 3776
	ldr	x3, .LC194
	mov	x1, x20
	mov	x2, 176
	mov	x0, x22
	add	x24, x19, 90112
	add	x23, x19, 45056
	ldr	x3, [x3, 104]
	add	x20, x23, 312
	blr	x3
	ldr	w2, [x24, 856]
	mov	x1, x22
	mov	x0, x20
	bl	MP2_ReceivePacket
	cmp	w0, 1
	beq	.L923
	ldr	x1, .LC196
	mov	w0, 1
	mov	w20, 0
	bl	dprint_vfmw
.L924:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L923:
	add	x20, x20, 40960
	add	x0, x21, 3224
	ldr	x1, [x20, 2608]
	ldr	w2, [x20, 2588]
	bl	BsInit
	ldr	x0, [x19]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L954
.L925:
	ldr	w0, [x21, 2948]
	str	w0, [x21, 3152]
.L926:
	mov	x0, x19
	bl	MP2_GetHDR
	add	w0, w0, 1
	cmp	w0, 1
	bls	.L955
	mov	x0, x19
	bl	MP2_DecodingDecide
	cbz	w0, .L956
	cmn	w0, #1
	beq	.L929
	mov	x0, x19
	bl	MP2_GetPictureInfo
	cbnz	w0, .L932
	ldr	w0, [x24, 856]
	mov	x1, 43848
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC197
	ldr	x4, [x0]
	cbz	x4, .L933
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L933:
	ldr	x1, .LC201
	mov	w0, 1
	mov	w20, 0
	bl	dprint_vfmw
	b	.L924
	.p2align 3
.L955:
	ldr	x0, [x19]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L957
.L928:
	ldrb	w0, [x24, 873]
	cmp	w0, 1
	beq	.L929
	mov	x1, 43848
	ldr	w0, [x24, 856]
	add	x1, x23, x1
	mov	w20, 0
	bl	MP2_ClearCurPacket
	b	.L924
	.p2align 3
.L957:
	ldr	w0, [x0, 912]
	cbz	w0, .L928
.L929:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L954:
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L925
	ldr	w0, [x21, 3152]
	str	w0, [x21, 2948]
	b	.L926
	.p2align 3
.L956:
	ldr	w0, [x24, 856]
	mov	x1, 43848
	add	x1, x23, x1
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC197
	ldr	x4, [x0]
	cbz	x4, .L931
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L931:
	ldr	x1, .LC199
	mov	w0, 22
	mov	w20, 0
	bl	dprint_vfmw
	b	.L924
	.p2align 3
.L932:
	mov	x0, x19
	bl	MP2_DecNewPic
	mov	w20, w0
	cbz	w0, .L958
	add	x0, x23, 312
	add	x0, x0, 40960
	ldr	w2, [x0, 2708]
	ldr	w20, [x0, 2568]
	ldr	w1, [x0, 2588]
	lsl	w20, w20, 3
	add	w1, w2, w1
	str	w1, [x0, 2708]
	b	.L924
	.p2align 3
.L958:
	add	x21, x23, 312
	ldr	w0, [x24, 856]
	add	x21, x21, 40960
	mov	w2, 1
	ldr	w1, [x21, 2740]
	bl	FSP_ClearLogicFs
	ldr	w0, [x24, 856]
	add	x1, x21, 2576
	bl	MP2_ClearCurPacket
	mov	x0, x19
	bl	MP2_ClearCurPic
	ldr	x0, .LC197
	ldr	x4, [x0]
	cbz	x4, .L935
	ldr	w0, [x24, 856]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L935:
	ldr	x1, .LC203
	mov	w0, 1
	bl	dprint_vfmw
	b	.L924
	.size	MPEG2DEC_Decode, .-MPEG2DEC_Decode
	.align	3
.LC194:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC197:
	.xword	g_event_report
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC203:
	.xword	.LC202
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MP2_GetPacketState
	.type	MP2_GetPacketState, %function
MP2_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 90112
	bl	_mcount
	mov	w0, 2
	ldrb	w1, [x19, 872]
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csel	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MP2_GetPacketState, .-MP2_GetPacketState
	.global	g_tmpusd
	.global	zigzag
	.global	default_intra_quantizer_matrix
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__FUNCTION__.11919, %object
	.size	__FUNCTION__.11919, 19
__FUNCTION__.11919:
	.string	"MP2_DecodingDecide"
	.zero	5
.LC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	10
	.word	12
	.word	14
	.word	16
	.word	18
	.word	20
	.word	22
	.word	24
	.word	28
	.word	32
	.word	36
	.word	40
	.word	44
	.word	48
	.word	52
	.word	56
	.word	64
	.word	72
	.word	80
	.word	88
	.word	96
	.word	104
	.word	112
	.align	3
.LANCHOR1 = . + 0
	.type	CSWTCH.46, %object
	.size	CSWTCH.46, 12
CSWTCH.46:
	.word	5
	.word	1
	.word	2
	.zero	4
	.type	frame_rate_Table, %object
	.size	frame_rate_Table, 64
frame_rate_Table:
	.word	0
	.word	23976
	.word	24000
	.word	25000
	.word	29970
	.word	30000
	.word	50000
	.word	59940
	.word	60000
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.type	tab_for_first_4bit, %object
	.size	tab_for_first_4bit, 128
tab_for_first_4bit:
	.word	8
	.word	4
	.word	9
	.word	5
	.word	5
	.word	4
	.word	4
	.word	4
	.word	3
	.word	3
	.word	3
	.word	3
	.word	2
	.word	3
	.word	2
	.word	3
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.type	tab_for_last_7bit, %object
	.size	tab_for_last_7bit, 832
tab_for_last_7bit:
	.word	33
	.word	11
	.word	32
	.word	11
	.word	31
	.word	11
	.word	30
	.word	11
	.word	29
	.word	11
	.word	28
	.word	11
	.word	27
	.word	11
	.word	26
	.word	11
	.word	25
	.word	11
	.word	24
	.word	11
	.word	23
	.word	11
	.word	22
	.word	11
	.word	21
	.word	10
	.word	21
	.word	10
	.word	20
	.word	10
	.word	20
	.word	10
	.word	19
	.word	10
	.word	19
	.word	10
	.word	18
	.word	10
	.word	18
	.word	10
	.word	17
	.word	10
	.word	17
	.word	10
	.word	16
	.word	10
	.word	16
	.word	10
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	15
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	14
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	13
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	12
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	11
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	10
	.word	8
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	9
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.word	8
	.word	7
	.data
	.align	3
.LANCHOR3 = . + 0
	.type	zigzag, %object
	.size	zigzag, 64
zigzag:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.type	default_intra_quantizer_matrix, %object
	.size	default_intra_quantizer_matrix, 64
default_intra_quantizer_matrix:
	.byte	8
	.byte	16
	.byte	19
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	16
	.byte	16
	.byte	22
	.byte	24
	.byte	27
	.byte	29
	.byte	34
	.byte	37
	.byte	19
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	34
	.byte	38
	.byte	22
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	37
	.byte	40
	.byte	22
	.byte	26
	.byte	27
	.byte	29
	.byte	32
	.byte	35
	.byte	40
	.byte	48
	.byte	26
	.byte	27
	.byte	29
	.byte	32
	.byte	35
	.byte	40
	.byte	48
	.byte	58
	.byte	26
	.byte	27
	.byte	29
	.byte	34
	.byte	38
	.byte	46
	.byte	56
	.byte	69
	.byte	27
	.byte	29
	.byte	35
	.byte	38
	.byte	46
	.byte	56
	.byte	69
	.byte	83
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC3:
	ASCII(.string	"mp2 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	2
.LC6:
	ASCII(.string	"user set decode channel max resolution is (w=%d,h=%d), this stream (w=%d,h=%d) can NOT be decoded!\n" )
	.zero	4
.LC9:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC11:
	ASCII(.string	"FSP_ConfigInstance fail!\n" )
	.zero	6
.LC14:
	ASCII(.string	"ERROR: frm %d, integrality: %#x\n" )
	.zero	7
.LC16:
	ASCII(.string	"ERROR: frm %d, No Img buffer is allocated\n" )
	.zero	5
.LC18:
	ASCII(.string	"----------------- mp2 Imode -> %d ------------------\n" )
	.zero	2
.LC21:
	ASCII(.string	"frm %d pic type %d struct is %d total pos %#x\n" )
	.zero	1
.LC23:
	ASCII(.string	"NOTE: Drop non-I, cur is B\n" )
	.zero	4
.LC25:
	ASCII(.string	"NOTE: Drop non-I, cur is P\n" )
	.zero	4
.LC27:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC29:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC32:
	ASCII(.string	"%s %d pFwdImg = NULL,  pBwdImg = NULL!!\n" )
	.zero	7
.LC34:
	ASCII(.string	"fuction return value is null,%s %d !!\n" )
	.zero	1
.LC36:
	ASCII(.string	"dec P frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC38:
	ASCII(.string	"dec B frame, bwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC40:
	ASCII(.string	"dec B frame, fwd ref err(%d) > ref_thr(%d)\n" )
	.zero	4
.LC43:
	ASCII(.string	"Protocol %d\n" )
	.zero	3
.LC45:
	ASCII(.string	"seq size change, call vpss to release all frames.\n" )
	.zero	5
.LC47:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC50:
	ASCII(.string	"new seq size %dx%d\n" )
	.zero	4
.LC54:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC56:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC58:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC60:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC65:
	ASCII(.string	"ERROR: frm %d, lost one field\n" )
	.zero	1
.LC67:
	ASCII(.string	"ERROR: frm %d, lost one field flg = %d, last_struct = %d\n" )
	.zero	6
.LC69:
	ASCII(.string	"Fatal Error: frm%d, get image buffer failed\n" )
	.zero	3
.LC71:
	ASCII(.string	"dec_pts: %lld Usertag: %lld\n" )
	.zero	3
.LC73:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC75:
	ASCII(.string	"++++++++++ ref %d\n" )
	.zero	5
.LC77:
	ASCII(.string	"line: %d(pCur, pFwd, pBwd)(%p, %p, %p)\n" )
.LC79:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\n" )
	.zero	3
.LC81:
	ASCII(.string	"dec addr: cur,cur2d,fwd,bwd,pmv = %p,%p,%p,%p,%p\n" )
	.zero	6
.LC87:
	ASCII(.string	"\nmpeg2 copy last 3 bytes of the first packet!\n\n" )
.LC91:
	ASCII(.string	"pMp2CodecInfo->pUsrDatArray[%d] is null\n" )
	.zero	7
.LC103:
	ASCII(.string	"ERROR: unsupported profile %d\n" )
	.zero	1
.LC105:
	ASCII(.string	"ERROR: unsupported level %d\n" )
	.zero	3
.LC112:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC114:
	ASCII(.string	"Decoding quits at frm %d\n" )
	.zero	6
.LC117:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
.LC119:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC121:
	ASCII(.string	"ErrRatio = %d\n" )
	.zero	1
.LC124:
	ASCII(.string	"pImg is null, pCurImg %#x pBwdImg %#x pFwdImg %#x\n" )
	.zero	5
.LC126:
	ASCII(.string	"DEBUG: DEC over\n" )
	.zero	7
.LC130:
	ASCII(.string	"insert buf %d ref %d\n" )
	.zero	2
.LC132:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC134:
	ASCII(.string	"%-40s%20d\n" )
	.zero	5
.LC136:
	ASCII(.string	"slice_vertical_position" )
.LC138:
	ASCII(.string	"quantiser_scale_code" )
	.zero	3
.LC140:
	ASCII(.string	"extra_bit_slice" )
.LC142:
	ASCII(.string	"intra_slice_flag" )
	.zero	7
.LC144:
	ASCII(.string	"intra_slice" )
	.zero	4
.LC146:
	ASCII(.string	"reserved_bits" )
	.zero	2
.LC148:
	ASCII(.string	"extra_infrmation_slice" )
	.zero	1
.LC150:
	ASCII(.string	"Slice num = %d >= %d\n" )
	.zero	2
.LC152:
	ASCII(.string	"seg info is wrong! IsLastSeg[0] = %d, IsLastSeg[1] = %d\n" )
	.zero	7
.LC155:
	ASCII(.string	"macroblock_address_increment" )
	.zero	3
.LC159:
	ASCII(.string	"macroblock_escape ERROR\n" )
	.zero	7
.LC161:
	ASCII(.string	"macroblock_escape" )
	.zero	6
.LC163:
	ASCII(.string	"SlcStartMbNum = %d > PicEndMum = %d\n" )
	.zero	3
.LC165:
	ASCII(.string	"FirstMbInSliceFlag = %d\n" )
	.zero	7
.LC167:
	ASCII(.string	"MP2_GetFirstMbInSlice Failed!\n" )
	.zero	1
.LC170:
	ASCII(.string	"MP2_WriteSliceInfo Failed!\n" )
	.zero	4
.LC173:
	ASCII(.string	"found sh %#x\n" )
	.zero	2
.LC176:
	ASCII(.string	"SEQUENCE_HEADER_CODE Bitstream is not enough!\n" )
	.zero	1
.LC178:
	ASCII(.string	"found gh %#x\n" )
	.zero	2
.LC180:
	ASCII(.string	"GROUP_START_CODE Bitstream is not enough!\n" )
	.zero	5
.LC182:
	ASCII(.string	"found ph %#x\n" )
	.zero	2
.LC184:
	ASCII(.string	"PICTURE_START_CODE Bitstream is not enough!\n" )
	.zero	3
.LC186:
	ASCII(.string	"found ud %#x\n" )
	.zero	2
.LC188:
	ASCII(.string	"cann't get ud pointer\n" )
	.zero	1
.LC190:
	ASCII(.string	"found ext %#x\n" )
	.zero	1
.LC192:
	ASCII(.string	"MP2_DecSlice is wrong!\n" )
.LC195:
	ASCII(.string	"line %d, MP2_ReceivePacket receive packet failed!\n" )
	.zero	5
.LC198:
	ASCII(.string	"MP2 Decode Decide is wrong!\n" )
	.zero	3
.LC200:
	ASCII(.string	"MP2 get picture info is wrong!\n" )
.LC202:
	ASCII(.string	"MP2 dec new pic failed!\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
	.type	g_tmpusd, %object
	.size	g_tmpusd, 1024
g_tmpusd:
	.zero	1024
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
