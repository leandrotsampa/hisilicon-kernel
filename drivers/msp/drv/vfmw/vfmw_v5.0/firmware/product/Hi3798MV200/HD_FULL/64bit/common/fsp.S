#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"fsp.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	FSP_IsSpecialFrm.part.2, %function
FSP_IsSpecialFrm.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC0
	ldr	x3, [x0, w20, sxtw 3]
	cbz	x3, .L5
	sub	w1, w19, #1
	mov	w0, 0
	cmn	w1, #3
	bhi	.L2
	add	x1, x3, 331776
	ldr	w1, [x1, 16]
	cbz	w1, .L2
	add	x0, x3, 327680
	ldr	w0, [x0, 3604]
	cmp	w19, w0
	beq	.L9
	mov	w2, 0
	b	.L3
	.p2align 3
.L4:
	add	x0, x3, x0, lsl 4
	ldr	w0, [x0, 3604]
	cmp	w19, w0
	beq	.L9
.L3:
	add	w2, w2, 1
	cmp	w2, w1
	sxtw	x0, w2
	add	x0, x0, 20480
	bne	.L4
.L5:
	mov	w0, 0
.L2:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L9:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsSpecialFrm.part.2, .-FSP_IsSpecialFrm.part.2
	.align	3
.LC0:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	FSP_IsDecFsAvailable.part.5, %function
FSP_IsDecFsAvailable.part.5:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	mov	w0, 1
	ble	.L14
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L14:
	ldr	w1, [x20, 16]
	mov	w0, w19
	bl	FSP_IsSpecialFrm.part.2
	cmp	w0, wzr
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsDecFsAvailable.part.5, .-FSP_IsDecFsAvailable.part.5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsSpecialFrm
	.type	FSP_IsSpecialFrm, %function
FSP_IsSpecialFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	mov	w0, 0
	bgt	.L16
	mov	w1, w20
	mov	w0, w19
	bl	FSP_IsSpecialFrm.part.2
.L16:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsSpecialFrm, .-FSP_IsSpecialFrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC3
	ldr	x19, .LC4
	mov	x2, 256
	mov	w1, 0
	ldr	x3, [x21, 96]
	mov	x0, x19
	add	x20, x19, x2
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 8448
	mov	w1, 0
	mov	x0, x20
	blr	x3
	add	x1, x20, 8192
	add	x0, x19, 258
	add	x1, x1, 258
	mov	w2, -1
	.p2align 2
.L19:
	strh	w2, [x0]
	add	x0, x0, 264
	cmp	x0, x1
	bne	.L19
	ldr	x0, .LC5
	mov	x2, 32
	ldr	x3, [x21, 96]
	mov	w1, 0
	str	wzr, [x0], 8
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_Init, .-FSP_Init
	.align	3
.LC3:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC4:
	.xword	.LANCHOR0
	.align	3
.LC5:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigAttribute
	.type	FSP_ConfigAttribute, %function
FSP_ConfigAttribute:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L25
	ldr	x0, .LC11
	ldr	x2, [x0, w19, sxtw 3]
	ldr	w0, [x2, 4]
	cmp	w0, 1
	bne	.L26
	ldrsb	w1, [x20]
	mov	w0, 0
	strb	w1, [x2, 1]
.L23:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L26:
	ldr	x3, .LC13
	mov	w2, 236
	ldr	x1, .LC10
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L23
	.p2align 3
.L25:
	ldr	x3, .LC8
	mov	w2, 235
	ldr	x1, .LC10
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L23
	.size	FSP_ConfigAttribute, .-FSP_ConfigAttribute
	.align	3
.LC8:
	.xword	.LC7
	.align	3
.LC10:
	.xword	.LC9
	.align	3
.LC11:
	.xword	.LANCHOR0
	.align	3
.LC13:
	.xword	.LC12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearContext
	.type	FSP_ClearContext, %function
FSP_ClearContext:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L30
	ldr	x21, .LC17
	add	x20, x19, 28672
	add	x4, x20, 1536
	strb	wzr, [x19, 8]
	strb	wzr, [x19, 9]
	mov	x2, 32
	strb	wzr, [x19, 11]
	mov	w1, 0
	strb	wzr, [x19, 12]
	add	x0, x19, 20
	strb	wzr, [x19, 13]
	add	x22, x19, 20480
	strb	wzr, [x19, 10]
	strb	wzr, [x19, 14]
	str	wzr, [x19, 16]
	str	wzr, [x20, 1508]
	ldr	x3, [x21, 96]
	stp	wzr, wzr, [x4, 232]
	stp	wzr, wzr, [x4, 240]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 100
	mov	w1, 0
	add	x0, x22, 2616
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 3200
	mov	w1, 0
	add	x0, x22, 2716
	blr	x3
	ldr	x3, [x21, 96]
	add	x0, x19, 24576
	mov	x2, 3200
	mov	w1, 0
	add	x0, x0, 1820
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 200
	mov	w1, 0
	add	x0, x20, 924
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 384
	mov	w1, 0
	add	x0, x20, 1124
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 256
	mov	w1, 0
	add	x0, x20, 1512
	blr	x3
	mov	w0, 0
.L29:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L30:
	ldr	x3, .LC15
	mov	w2, 252
	ldr	x1, .LC16
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L29
	.size	FSP_ClearContext, .-FSP_ClearContext
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC16:
	.xword	.LC9
	.align	3
.LC17:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearContextAll
	.type	FSP_ClearContextAll, %function
FSP_ClearContextAll:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L34
	ldr	x3, .LC20
	add	x20, x19, 28672
	mov	x2, 30456
	mov	w1, 0
	mov	x0, x19
	ldrsb	w23, [x19, 10]
	ldr	x3, [x3, 96]
	ldrsb	w22, [x19, 13]
	ldrsb	w26, [x19]
	ldrsb	w25, [x19, 1]
	ldr	w24, [x19, 4]
	ldr	w21, [x20, 1768]
	blr	x3
	strb	w26, [x19]
	mov	w0, 0
	strb	w25, [x19, 1]
	strb	w23, [x19, 10]
	strb	w22, [x19, 13]
	str	w24, [x19, 4]
	str	w21, [x20, 1768]
.L33:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L34:
	ldr	x3, .LC18
	mov	w2, 292
	ldr	x1, .LC19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L33
	.size	FSP_ClearContextAll, .-FSP_ClearContextAll
	.align	3
.LC18:
	.xword	.LC14
	.align	3
.LC19:
	.xword	.LC9
	.align	3
.LC20:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 31
	bhi	.L40
	ldr	x0, .LC23
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L41
	ldr	w0, [x19, 4]
	cbnz	w0, .L39
	ldr	x3, .LC26
	mov	w1, 0
	mov	x2, 30456
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	strb	w20, [x19]
	add	x1, x19, 28672
	mov	w0, 1
	str	w0, [x19, 4]
	mov	w0, 0
	str	wzr, [x1, 1768]
.L37:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L39:
	mov	w0, -1
	b	.L37
	.p2align 3
.L40:
	ldr	x3, .LC21
	mov	w2, 320
	ldr	x1, .LC22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L37
.L41:
	ldr	x3, .LC25
	mov	w2, 321
	ldr	x1, .LC22
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L37
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	3
.LC21:
	.xword	.LC7
	.align	3
.LC22:
	.xword	.LC9
	.align	3
.LC23:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC26:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L46
	ldr	x0, .LC29
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L47
	ldr	w1, [x0, 4]
	cmp	w1, 1
	beq	.L48
.L42:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L48:
	str	wzr, [x0, 4]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L46:
	ldr	x3, .LC27
	mov	w2, 343
	ldr	x1, .LC28
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L47:
	ldr	x3, .LC30
	mov	w2, 344
	ldr	x1, .LC28
	bl	dprint_vfmw
	b	.L42
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	3
.LC27:
	.xword	.LC7
	.align	3
.LC28:
	.xword	.LC9
	.align	3
.LC29:
	.xword	.LANCHOR0
	.align	3
.LC30:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x0, x30
	mov	x19, 0
	bl	_mcount
	ldr	x20, .LC33
	b	.L51
	.p2align 3
.L50:
	add	x19, x19, 1
	cmp	x19, 32
	beq	.L59
.L51:
	ldr	x0, [x20, x19, lsl 3]
	cbz	x0, .L50
	ldr	w0, [x0, 4]
	cbz	w0, .L50
	mov	w0, w19
	add	x19, x19, 1
	bl	FSP_DisableInstance
	cmp	x19, 32
	bne	.L51
.L59:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_Exit, .-FSP_Exit
	.align	3
.LC33:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 31
	bhi	.L81
	ldr	x0, .LC39
	ldr	x22, [x0, w21, sxtw 3]
	cbz	x22, .L82
	add	x19, x22, 20480
	add	x20, x22, 24576
	ldr	x25, .LC41
	add	x19, x19, 2732
	ldr	x24, .LC45
	add	x20, x20, 1836
	ldr	x23, .LC43
	b	.L70
	.p2align 3
.L67:
	ldrsb	w0, [x19, -14]
	cbnz	w0, .L83
	.p2align 2
.L65:
	add	x19, x19, 100
	cmp	x20, x19
	beq	.L84
.L70:
	ldr	w1, [x19]
	cbz	w1, .L65
	ldr	w0, [x25]
	cbz	w0, .L65
	ldrsb	w0, [x19, -16]
	cbz	w0, .L67
	ldr	x3, [x25, 32]
	cbz	x3, .L85
	mov	w2, 0
	mov	w0, w21
	blr	x3
	ldrsb	w0, [x19, -14]
	cbz	w0, .L65
.L83:
	ldr	x2, [x25, 24]
	ldr	w1, [x19]
	cbz	x2, .L86
	mov	w0, w21
	add	x19, x19, 100
	blr	x2
	cmp	x20, x19
	bne	.L70
	.p2align 2
.L84:
	mov	x0, x22
	bl	FSP_ClearContext
	mov	w0, 0
.L62:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L81:
	ldr	x3, .LC37
	mov	w2, 364
	ldr	x1, .LC38
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L62
.L86:
	mov	x1, x24
	mov	w0, 0
	bl	dprint_vfmw
	b	.L65
.L85:
	mov	x1, x23
	mov	w0, 0
	bl	dprint_vfmw
	b	.L67
.L82:
	ldr	x3, .LC40
	mov	w2, 365
	ldr	x1, .LC38
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L62
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	3
.LC37:
	.xword	.LC7
	.align	3
.LC38:
	.xword	.LC9
	.align	3
.LC39:
	.xword	.LANCHOR0
	.align	3
.LC40:
	.xword	.LC24
	.align	3
.LC41:
	.xword	.LANCHOR1
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC45:
	.xword	.LC44
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_EmptyInstance
	.type	FSP_EmptyInstance, %function
FSP_EmptyInstance:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w25, w0
	mov	x0, x30
	bl	_mcount
	cmp	w25, 31
	bhi	.L124
	ldr	x0, .LC48
	ldr	x24, [x0, w25, sxtw 3]
	cbz	x24, .L125
	ldr	x3, .LC50
	mov	x2, 23040
	mov	w1, 0
	add	x0, x24, 56
	mov	w26, 0
	ldr	x3, [x3, 96]
	blr	x3
	ldrsb	w0, [x24, 10]
	cmp	w0, wzr
	ble	.L101
	ldr	x27, .LC51
	mov	w21, 4
	ldr	x23, .LC53
	ldr	x22, .LC52
	b	.L116
	.p2align 3
.L98:
	lsl	x0, x19, 2
	sub	x1, x0, x19
	lsl	x0, x1, 5
	add	x0, x1, x0
	add	x0, x0, x19
	add	x0, x24, x0
	add	x0, x0, 20480
	strb	wzr, [x0, 2718]
.L99:
	lsl	x0, x19, 2
	add	w26, w26, 1
	sub	x0, x0, x19
	lsl	x1, x0, 5
	add	x0, x0, x1
	add	x19, x0, x19
	add	x19, x24, x19
	add	x19, x19, 20480
	strb	wzr, [x19, 2716]
	strb	wzr, [x19, 2808]
	str	wzr, [x19, 2804]
	ldrsb	w0, [x24, 10]
	cmp	w0, w26
	ble	.L101
.L116:
	sxtw	x19, w26
	lsl	x20, x19, 2
	sub	x20, x20, x19
	lsl	x0, x20, 5
	add	x20, x20, x0
	add	x20, x20, x19
	add	x20, x24, x20
	add	x20, x20, 20480
	ldr	w1, [x20, 2732]
	cbz	w1, .L94
	ldr	w0, [x27]
	cbz	w0, .L94
	ldrsb	w0, [x20, 2716]
	cbnz	w0, .L126
.L95:
	lsl	x20, x19, 2
	sub	x20, x20, x19
	lsl	x0, x20, 5
	add	x20, x20, x0
	add	x20, x20, x19
	add	x20, x24, x20
	add	x20, x20, 20480
	ldrsb	w0, [x20, 2718]
	cbnz	w0, .L127
	.p2align 2
.L94:
	cmp	w25, 31
	bgt	.L98
	mov	w0, w25
	bl	FSP_IsSpecialFrm.part.2
	cmp	w0, 1
	bne	.L98
	lsl	x0, x19, 2
	sub	x1, x0, x19
	lsl	x0, x1, 5
	add	x0, x1, x0
	add	x0, x0, x19
	add	x0, x24, x0
	add	x0, x0, 20480
	strb	w21, [x0, 2718]
	b	.L99
	.p2align 3
.L101:
	ldrsb	w0, [x24, 11]
	cmp	w0, wzr
	ble	.L93
	sub	w0, w0, #1
	mov	w20, 100
	mov	x1, 26498
	add	x19, x24, 24576
	add	x19, x19, 1822
	mov	w21, 4
	umaddl	x20, w0, w20, x1
	add	x20, x24, x20
	.p2align 2
.L106:
	cmp	w25, 31
	ble	.L128
.L104:
	strb	wzr, [x19]
.L105:
	strb	wzr, [x19, -2]
	add	x19, x19, 100
	strb	wzr, [x19, -10]
	str	wzr, [x19, -14]
	cmp	x19, x20
	bne	.L106
.L93:
	ldrsb	w0, [x24, 13]
	cmp	w0, wzr
	ble	.L103
	sub	w1, w0, #1
	mov	x3, 30196
	add	x0, x24, 28672
	mov	w2, 1
	add	x1, x3, x1, uxtw 3
	add	x0, x0, 1516
	add	x1, x24, x1
	.p2align 2
.L107:
	strb	w2, [x0]
	add	x0, x0, 8
	strb	wzr, [x0, -7]
	cmp	x1, x0
	bne	.L107
.L103:
	mov	w0, 0
	str	wzr, [x24, 16]
.L89:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L128:
	ldr	w1, [x19, 14]
	mov	w0, w25
	bl	FSP_IsSpecialFrm.part.2
	cmp	w0, 1
	bne	.L104
	strb	w21, [x19]
	b	.L105
	.p2align 3
.L127:
	ldr	x2, [x27, 24]
	cbz	x2, .L129
	mov	w0, w25
	blr	x2
	ldr	w1, [x20, 2732]
	b	.L94
	.p2align 3
.L126:
	ldr	x3, [x27, 32]
	cbz	x3, .L130
	mov	w2, 0
	mov	w0, w25
	blr	x3
	ldr	w1, [x20, 2732]
	b	.L95
.L124:
	ldr	x3, .LC46
	mov	w2, 419
	ldr	x1, .LC47
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L89
.L125:
	ldr	x3, .LC49
	mov	w2, 420
	ldr	x1, .LC47
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L89
.L130:
	mov	x1, x22
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 2732]
	b	.L95
.L129:
	mov	x1, x23
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 2732]
	b	.L94
	.size	FSP_EmptyInstance, .-FSP_EmptyInstance
	.align	3
.LC46:
	.xword	.LC7
	.align	3
.LC47:
	.xword	.LC9
	.align	3
.LC48:
	.xword	.LANCHOR0
	.align	3
.LC49:
	.xword	.LC24
	.align	3
.LC50:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC51:
	.xword	.LANCHOR1
	.align	3
.LC52:
	.xword	.LC42
	.align	3
.LC53:
	.xword	.LC44
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetUsedBufferNum
	.type	FSP_GetUsedBufferNum, %function
FSP_GetUsedBufferNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC54
	ldr	x5, [x0, w19, sxtw 3]
	add	x0, x5, 294912
	ldrsb	w0, [x0, 2170]
	cmp	w0, wzr
	ble	.L135
	mov	x2, 58226
	sub	w4, w0, #1
	mov	w3, 100
	movk	x2, 0x4, lsl 16
	add	x1, x5, 319488
	mov	w0, 0
	umaddl	x2, w4, w3, x2
	add	x1, x1, 782
	add	x3, x5, x2
	.p2align 2
.L134:
	ldrsb	w2, [x1], 100
	cmp	w2, 3
	csinc	w0, w0, w0, ne
	cmp	x1, x3
	bne	.L134
.L132:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L135:
	mov	w0, 0
	b	.L132
	.size	FSP_GetUsedBufferNum, .-FSP_GetUsedBufferNum
	.align	3
.LC54:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigInstance
	.type	FSP_ConfigInstance, %function
FSP_ConfigInstance:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L147
	cbz	x21, .L148
	ldr	x0, .LC59
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L141
	ldr	w0, [x19, 4]
	cmp	w0, 1
	bne	.L141
	ldr	x0, .LC62
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 323584
	ldr	w0, [x0, 3944]
	cbz	w0, .L149
.L143:
	ldr	x3, .LC63
	mov	x2, 32
	mov	x1, x21
	add	x0, x19, 20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L139:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L149:
	mov	x0, x19
	bl	FSP_ClearContext
	b	.L143
	.p2align 3
.L141:
	ldr	x3, .LC61
	mov	w2, 547
	ldr	x1, .LC56
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L139
	.p2align 3
.L147:
	ldr	x3, .LC55
	mov	w2, 544
	ldr	x1, .LC56
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L139
.L148:
	ldr	x3, .LC58
	mov	w2, 545
	ldr	x1, .LC56
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L139
	.size	FSP_ConfigInstance, .-FSP_ConfigInstance
	.align	3
.LC55:
	.xword	.LC7
	.align	3
.LC56:
	.xword	.LC9
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC59:
	.xword	.LANCHOR0
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC62:
	.xword	s_pstVfmwChan
	.align	3
.LC63:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_CheckCapLevel
	.type	FSP_CheckCapLevel, %function
FSP_CheckCapLevel:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC64
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 331776
	ldr	w0, [x0, 28]
	cbz	w0, .L151
.L155:
	mov	w0, 0
.L159:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L151:
	ldr	x1, .LC65
	mov	w0, w19
	ldr	x19, [x1, w19, sxtw 3]
	bl	VCTRL_GetChanCapLevel
	cmp	w0, 32
	bhi	.L153
	uxtw	x4, w0
	ldr	x3, .LC66
	lsl	x1, x4, 3
	add	x2, x19, 20
	sub	x1, x1, x4
	lsl	x1, x1, 2
	add	x4, x3, x1
	ldp	w5, w6, [x2, 8]
	ldr	w3, [x3, x1]
	ldr	w4, [x4, 4]
	mul	w7, w5, w6
	mul	w1, w3, w4
	cmp	w7, w1
	ccmp	w0, 25, 4, gt
	beq	.L155
	ldrsb	w1, [x2, 2]
	cmp	w1, 1
	beq	.L155
	ldr	x1, .LC70
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	b	.L156
	.p2align 3
.L153:
	ldrsb	w1, [x19, 22]
	cmp	w1, 1
	beq	.L155
	ldr	x1, .LC68
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
.L156:
	strb	wzr, [x19, 9]
	mov	w0, -1
	b	.L159
	.size	FSP_CheckCapLevel, .-FSP_CheckCapLevel
	.align	3
.LC64:
	.xword	s_pstVfmwChan
	.align	3
.LC65:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	CapItem
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC70:
	.xword	.LC69
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RecordSpecialFrame
	.type	FSP_RecordSpecialFrame, %function
FSP_RecordSpecialFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC71
	ldr	x3, [x0, w19, sxtw 3]
	add	x2, x3, 331776
	ldr	w0, [x2, 20]
	cbnz	w0, .L162
	ldr	w0, [x2, 16]
	cbz	w0, .L162
	ldr	x0, .LC72
	mov	w1, 0
	mov	w7, 4
	ldr	x4, [x0, w19, sxtw 3]
	add	x0, x4, 28672
	ldr	w0, [x0, 1772]
	lsl	x5, x0, 2
	sub	x5, x5, x0
	lsl	x6, x5, 5
	add	x5, x5, x6
	add	x0, x5, x0
	add	x4, x4, x0
	add	x0, x4, 20480
	ldr	w5, [x0, 2732]
	b	.L166
	.p2align 3
.L165:
	ldr	w0, [x2, 16]
	cmp	w0, w1
	bls	.L162
.L166:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 20480
	add	x0, x3, x0, lsl 4
	ldr	w0, [x0, 3604]
	cmp	w5, w0
	bne	.L165
	add	x0, x4, 20480
	strb	w7, [x0, 2718]
	ldr	w0, [x2, 16]
	cmp	w0, w1
	bhi	.L166
.L162:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_RecordSpecialFrame, .-FSP_RecordSpecialFrame
	.align	3
.LC71:
	.xword	s_pstVfmwChan
	.align	3
.LC72:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ConfigFrameBuf
	.type	FSP_ConfigFrameBuf, %function
FSP_ConfigFrameBuf:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	w19, w0
	mov	x0, x30
	mov	w22, w1
	mov	w27, w2
	str	x3, [x29, 104]
	bl	_mcount
	ldr	x23, .LC73
	mov	x2, 1368
	ldr	x20, .LC74
	mov	w1, 0
	ldr	x3, [x23, 96]
	add	x0, x20, 40
	blr	x3
	cmp	w19, 31
	bhi	.L220
	ldr	x0, .LC77
	ldr	x25, [x0, w19, sxtw 3]
	cbz	x25, .L221
	mov	w0, w19
	bl	FSP_CheckCapLevel
	mov	w21, w0
	cbnz	w0, .L177
	ldr	x28, .LC79
	add	x26, x25, 20
	ldr	x1, [x28, w19, sxtw 3]
	ldp	w4, w5, [x26, 8]
	ldp	w2, w3, [x1, 164]
	mul	w7, w4, w5
	mul	w6, w2, w3
	cmp	w7, w6
	bgt	.L222
	ldr	w0, [x1, 1488]
	ldrsb	w24, [x26, 3]
	cmp	w0, 1
	add	x0, x1, 323584
	beq	.L223
.L178:
	ldr	w2, [x0, 3952]
	cmp	w24, w2
	beq	.L180
	mov	w2, 1
	str	w2, [x0, 3968]
	ldr	x2, .LC83
	ldr	x9, [x2, 128]
	ldrsb	w2, [x26, 3]
	str	w2, [x0, 3952]
	cbz	x9, .L182
.L227:
	ldp	w2, w3, [x26, 8]
	ldrsb	w6, [x26, 2]
	mov	w1, w27
	ldrsb	w4, [x26, 6]
	mov	w0, w22
	mov	w7, w19
	add	x22, x20, 40
	mov	w5, 32
	str	x22, [sp]
	blr	x9
	ldr	x1, [x28, w19, sxtw 3]
	mov	w2, 32
	add	x1, x1, 327680
	ldr	w1, [x1, 3528]
	cmp	w1, 32
	csel	w1, w1, w2, le
	cmp	w0, 2
	strb	w1, [x25, 13]
	beq	.L224
	cbnz	w0, .L185
	ldr	w0, [x22, 1080]
	strb	w0, [x25, 9]
	mov	w0, 31
	ldr	x1, .LC87
	ldr	x2, [x28, w19, sxtw 3]
	strb	wzr, [x2, 1556]
	str	wzr, [x2, 1528]
	bl	dprint_vfmw
	ldr	w4, [x22, 1080]
	cmp	w24, w4
	bgt	.L225
	ldrsb	w0, [x25, 1]
	strb	wzr, [x25, 11]
	strb	wzr, [x25, 12]
	cbnz	w0, .L226
.L188:
	ldr	w0, [x20, 1120]
	mov	w1, 32
	cmp	w0, w1
	csel	w0, w0, w1, le
	strb	w0, [x25, 10]
.L189:
	ldr	x1, [x23, 24]
	mov	w0, 8
	add	x27, x20, 40
	add	x28, x25, 28672
	blr	x1
	ldr	w0, [x27, 1348]
	cbz	w0, .L194
	ldr	w5, [x28, 1772]
	mov	w24, 0
	mov	w22, 1
	.p2align 2
.L193:
	uxtw	x0, w5
	uxtw	x2, w24
	lsl	x1, x0, 2
	lsl	x3, x2, 2
	sub	x1, x1, x0
	sub	x3, x3, x2
	lsl	x6, x1, 5
	add	x7, x27, x2, lsl 2
	add	x1, x1, x6
	add	x3, x27, x3, lsl 2
	add	x1, x1, x0
	ldr	w2, [x27, 1032]
	add	x1, x25, x1
	ldr	w12, [x7, 392]
	add	x1, x1, 20480
	ldr	w6, [x27, 1048]
	ldp	w0, w13, [x3, 8]
	ldr	w3, [x7, 904]
	add	w24, w24, 1
	str	w0, [x1, 2732]
	add	x0, x1, 2560
	str	w5, [x1, 2724]
	str	w13, [x1, 2736]
	ldr	w11, [x27]
	ldr	w7, [x27, 1044]
	ldr	w10, [x27, 1052]
	ldr	w9, [x27, 1060]
	ldr	w8, [x27, 1064]
	stp	w3, w2, [x0, 192]
	add	x2, x1, 2560
	stp	w12, w11, [x0, 184]
	stp	w10, w9, [x2, 204]
	stp	w8, w7, [x2, 212]
	str	w6, [x1, 2780]
	ldr	w0, [x27, 1036]
	str	w0, [x1, 2760]
	mov	w0, w19
	ldr	w5, [x27, 1068]
	ldr	w3, [x26, 8]
	str	w3, [x1, 2784]
	ldr	w2, [x27, 1072]
	ldr	w3, [x26, 12]
	str	w3, [x1, 2788]
	str	w5, [x1, 2792]
	str	w2, [x1, 2796]
	ldr	w2, [x27, 1076]
	str	w2, [x1, 2800]
	strb	wzr, [x1, 2716]
	strb	wzr, [x1, 2717]
	strb	wzr, [x1, 2718]
	bl	FSP_RecordSpecialFrame
	ldr	w0, [x28, 1772]
	ldr	w1, [x27, 1348]
	add	w5, w0, 1
	uxtw	x0, w0
	cmp	w1, w24
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x25, x0
	add	x0, x0, 20480
	str	w22, [x0, 2812]
	str	w5, [x28, 1772]
	bhi	.L193
.L194:
	ldr	w6, [x20, 1396]
	cbz	w6, .L192
	ldr	w2, [x28, 1780]
	add	x4, x20, 560
	add	w6, w2, w6
	.p2align 2
.L197:
	uxtw	x0, w2
	ldr	w5, [x4], 12
	lsl	x1, x0, 2
	add	w2, w2, 1
	sub	x1, x1, x0
	cmp	w6, w2
	lsl	x3, x1, 5
	add	x1, x1, x3
	add	x0, x1, x0
	add	x0, x25, x0
	add	x0, x0, 20480
	str	w5, [x0, 2740]
	bne	.L197
	str	w6, [x28, 1780]
.L192:
	mov	w0, 1
	strb	w0, [x25, 12]
	str	wzr, [x28, 932]
	mov	w2, 31
	add	x0, x20, 40
	ldr	w6, [x20, 40]
	ldrsb	w1, [x25, 10]
	mov	w5, 1
	cmp	w1, 31
	ldrb	w1, [x25, 10]
	str	w6, [x28, 956]
	csel	w1, w1, w2, le
	sxtb	w1, w1
	uxtw	x1, w1
	lsl	x2, x1, 2
	sub	x1, x2, x1
	ldr	w2, [x20, 1092]
	str	w2, [x28, 972]
	add	x1, x0, x1, lsl 2
	ldr	w2, [x20, 1108]
	ldr	w1, [x1, 8]
	str	w1, [x28, 940]
	ldr	w1, [x20, 1100]
	str	w1, [x28, 976]
	ldr	w1, [x20, 1104]
	str	w1, [x28, 980]
	ldr	w1, [x20, 1384]
	ldr	w7, [x26, 8]
	str	w7, [x28, 992]
	cmp	w1, 32
	ldr	w8, [x26, 12]
	str	w2, [x28, 1000]
	ldr	w2, [x20, 1112]
	str	w2, [x28, 1004]
	ldr	w2, [x20, 1116]
	str	w2, [x28, 1008]
	mov	w2, 32
	strb	wzr, [x28, 924]
	csel	w1, w1, w2, le
	strb	wzr, [x28, 925]
	strb	wzr, [x28, 926]
	str	w8, [x28, 996]
	str	w5, [x28, 1020]
	strb	w1, [x25, 13]
	ldr	w4, [x20, 1392]
	cbz	w4, .L196
	ldr	w1, [x28, 1776]
	add	x2, x20, 1124
	add	w4, w1, w4
	.p2align 2
.L198:
	add	x0, x25, x1, uxtw 3
	ldr	w3, [x2], 8
	add	x0, x0, 28672
	add	w1, w1, 1
	cmp	w1, w4
	strb	wzr, [x0, 1517]
	strb	w5, [x0, 1516]
	str	w3, [x0, 1512]
	bne	.L198
	str	w1, [x28, 1776]
.L196:
	add	x25, x25, 20480
	ldr	w0, [x20, 1380]
	str	w0, [x28, 1508]
	ldr	w2, [x20, 1092]
	ldr	w0, [x25, 2732]
	str	w2, [x25, 2664]
	ldr	w2, [x20, 1108]
	ldr	w1, [x20, 1100]
	str	w0, [x25, 2632]
	str	w2, [x25, 2692]
	ldr	w0, [x20, 1104]
	ldr	x2, [x29, 104]
	str	w1, [x25, 2668]
	str	w0, [x25, 2672]
	ldr	w1, [x20, 1112]
	ldr	w0, [x20, 1116]
	str	w1, [x25, 2696]
	str	w0, [x25, 2700]
	mov	w0, 1
	ldr	w1, [x20, 44]
	str	w0, [x25, 2712]
	mov	w0, 8
	strb	wzr, [x25, 2616]
	strb	wzr, [x25, 2617]
	strb	wzr, [x25, 2618]
	str	wzr, [x25, 2624]
	str	w6, [x25, 2648]
	str	w7, [x25, 2684]
	str	w8, [x25, 2688]
	str	w1, [x2]
	ldr	x1, [x23, 32]
	blr	x1
	b	.L203
	.p2align 3
.L222:
	ldr	x1, .LC81
	bl	dprint_vfmw
	ldr	x0, .LC82
	ldr	x4, [x0]
	cbz	x4, .L177
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w19
	mov	w21, -1
	blr	x4
	b	.L203
	.p2align 3
.L224:
	ldr	w2, [x22, 1080]
	mov	w21, w0
	strb	w2, [x25, 9]
	mov	w1, 1
	ldr	x0, [x28, w19, sxtw 3]
	strb	w1, [x0, 1556]
	str	w1, [x0, 1528]
.L203:
	add	sp, x29, 0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L223:
	ldr	w2, [x0, 3928]
	tst	w2, -3
	beq	.L178
	cmp	w2, 1
	beq	.L203
	strb	wzr, [x25, 9]
	mov	w0, 31
	ldr	x1, .LC85
	mov	w21, -1
	ldr	x2, [x28, w19, sxtw 3]
	add	x2, x2, 323584
	ldr	w2, [x2, 3928]
	bl	dprint_vfmw
	b	.L203
	.p2align 3
.L180:
	ldr	x2, .LC83
	str	wzr, [x0, 3968]
	ldr	x9, [x2, 128]
	ldrsb	w2, [x26, 3]
	str	w2, [x0, 3952]
	cbnz	x9, .L227
.L182:
	add	x1, x1, 327680
	mov	w2, 32
	mov	w0, -1
	ldr	w1, [x1, 3528]
	cmp	w1, w2
	csel	w1, w1, w2, le
	strb	w1, [x25, 13]
.L185:
	strb	wzr, [x25, 9]
	mov	w2, w0
	ldr	x1, .LC89
	mov	w0, 0
	ldr	x3, [x28, w19, sxtw 3]
	mov	w21, -1
	strb	wzr, [x3, 1556]
	str	wzr, [x3, 1528]
	bl	dprint_vfmw
	b	.L203
	.p2align 3
.L226:
	ldr	x0, [x28, w19, sxtw 3]
	ldr	w0, [x0, 1488]
	cmp	w0, 1
	beq	.L188
	ldrsb	w1, [x26, 3]
	ldr	w2, [x22, 1080]
	add	w0, w1, 7
	cmp	w0, w2
	csel	w0, w0, w2, le
	strb	w0, [x25, 10]
	b	.L189
	.p2align 3
.L177:
	mov	w21, -1
	b	.L203
.L220:
	ldr	x3, .LC75
	mov	w2, 661
	ldr	x1, .LC76
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L203
.L221:
	ldr	x3, .LC78
	mov	w2, 662
	ldr	x1, .LC76
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L203
.L225:
	ldr	x1, .LC91
	mov	w3, w24
	mov	w2, 0
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	ldr	x1, [x23, 32]
	mov	w0, 8
	blr	x1
	b	.L203
	.size	FSP_ConfigFrameBuf, .-FSP_ConfigFrameBuf
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC74:
	.xword	.LANCHOR1
	.align	3
.LC75:
	.xword	.LC7
	.align	3
.LC76:
	.xword	.LC9
	.align	3
.LC77:
	.xword	.LANCHOR0
	.align	3
.LC78:
	.xword	.LC24
	.align	3
.LC79:
	.xword	s_pstVfmwChan
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	g_event_report
	.align	3
.LC83:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC91:
	.xword	.LC90
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecodeFrameTable
	.type	FSP_GetDecodeFrameTable, %function
FSP_GetDecodeFrameTable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	cmp	w20, 31
	bhi	.L239
	cbz	x19, .L240
	cbz	x21, .L241
	ldr	x0, .LC99
	ldr	x5, [x0, w20, sxtw 3]
	cbz	x5, .L242
	ldrsb	w0, [x5, 10]
	mov	w3, 0
	str	w0, [x21]
	ldrsb	w0, [x5, 10]
	cmp	w0, wzr
	ble	.L228
	.p2align 2
.L237:
	sxtw	x0, w3
	lsl	x2, x0, 2
	sub	x2, x2, x0
	lsl	x4, x2, 5
	add	x2, x2, x4
	add	x0, x2, x0
	add	x0, x5, x0
	add	x0, x0, 20480
	ldr	w0, [x0, 2732]
	str	w0, [x19, w3, sxtw 2]
	add	w3, w3, 1
	ldrsb	w0, [x5, 10]
	cmp	w0, w3
	bgt	.L237
.L228:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L239:
	ldr	x3, .LC93
	mov	w2, 890
	ldr	x1, .LC94
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L240:
	ldr	x3, .LC96
	mov	w2, 891
	ldr	x1, .LC94
	mov	w0, 0
	bl	dprint_vfmw
	b	.L228
.L241:
	ldr	x3, .LC98
	mov	w2, 892
	ldr	x1, .LC94
	mov	w0, 0
	bl	dprint_vfmw
	b	.L228
.L242:
	ldr	x3, .LC100
	mov	w2, 893
	ldr	x1, .LC94
	mov	w0, 0
	bl	dprint_vfmw
	b	.L228
	.size	FSP_GetDecodeFrameTable, .-FSP_GetDecodeFrameTable
	.align	3
.LC93:
	.xword	.LC7
	.align	3
.LC94:
	.xword	.LC9
	.align	3
.LC96:
	.xword	.LC95
	.align	3
.LC98:
	.xword	.LC97
	.align	3
.LC99:
	.xword	.LANCHOR0
	.align	3
.LC100:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecodePmvTable
	.type	FSP_GetDecodePmvTable, %function
FSP_GetDecodePmvTable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	mov	x21, x2
	bl	_mcount
	cmp	w20, 31
	bhi	.L254
	cbz	x19, .L255
	cbz	x21, .L256
	ldr	x0, .LC105
	ldr	x4, [x0, w20, sxtw 3]
	cbz	x4, .L257
	ldrsb	w0, [x4, 13]
	mov	w3, 0
	str	w0, [x21]
	ldrsb	w0, [x4, 13]
	cmp	w0, wzr
	ble	.L243
	.p2align 2
.L252:
	sxtw	x0, w3
	add	x0, x0, 3772
	add	x0, x4, x0, lsl 3
	ldr	w0, [x0, 8]
	str	w0, [x19, w3, sxtw 2]
	add	w3, w3, 1
	ldrsb	w0, [x4, 13]
	cmp	w0, w3
	bgt	.L252
.L243:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L254:
	ldr	x3, .LC101
	mov	w2, 916
	ldr	x1, .LC102
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L255:
	ldr	x3, .LC103
	mov	w2, 917
	ldr	x1, .LC102
	mov	w0, 0
	bl	dprint_vfmw
	b	.L243
.L256:
	ldr	x3, .LC104
	mov	w2, 918
	ldr	x1, .LC102
	mov	w0, 0
	bl	dprint_vfmw
	b	.L243
.L257:
	ldr	x3, .LC106
	mov	w2, 919
	ldr	x1, .LC102
	mov	w0, 0
	bl	dprint_vfmw
	b	.L243
	.size	FSP_GetDecodePmvTable, .-FSP_GetDecodePmvTable
	.align	3
.LC101:
	.xword	.LC7
	.align	3
.LC102:
	.xword	.LC9
	.align	3
.LC103:
	.xword	.LC95
	.align	3
.LC104:
	.xword	.LC97
	.align	3
.LC105:
	.xword	.LANCHOR0
	.align	3
.LC106:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsFsLeak
	.type	FSP_IsFsLeak, %function
FSP_IsFsLeak:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC107
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L259
	mov	w0, 0
.L260:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L259:
	ldr	x1, .LC109
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L260
	.size	FSP_IsFsLeak, .-FSP_IsFsLeak
	.align	3
.LC107:
	.xword	.LANCHOR0
	.align	3
.LC109:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cmp	w19, 1088
	mov	w0, 1
	bgt	.L262
	ldr	x1, .LC110
	mov	w0, 4
	ldr	x1, [x1, w20, sxtw 3]
	add	x1, x1, 331776
	ldr	w1, [x1, 64]
	cmp	w1, wzr
	csinc	w0, w0, wzr, eq
.L262:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	3
.LC110:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 96]
	cmp	w0, 1
	beq	.L269
	mov	w0, 0
.L266:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L269:
	ldr	w1, [x19]
	mov	w0, 0
	tst	w1, 16711935
	bne	.L266
	mov	x1, x19
	mov	w0, w20
	bl	FSP_IsDecFsAvailable.part.5
	uxtb	w0, w0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w0, [x19, 4]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindLeastTickPhyFs
	.type	FindLeastTickPhyFs, %function
FindLeastTickPhyFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, wzr
	ble	.L275
	mov	w4, -1
	mov	w0, 0
	mov	w2, 0
	.p2align 2
.L274:
	ldr	w3, [x19, 88]
	add	x19, x19, 96
	cmp	w3, w4
	bcs	.L273
	mov	w0, w2
	mov	w4, w3
.L273:
	add	w2, w2, 1
	cmp	w20, w2
	bne	.L274
.L272:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L275:
	mov	w0, 0
	b	.L272
	.size	FindLeastTickPhyFs, .-FindLeastTickPhyFs
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_FindEmptyLogicFs
	.type	FSP_FindEmptyLogicFs, %function
FSP_FindEmptyLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 56
	mov	w1, 0
	.p2align 2
.L280:
	ldrsb	w2, [x0]
	cbnz	w2, .L278
	ldrsb	w2, [x0, 1]
	cbz	w2, .L282
.L278:
	add	w1, w1, 1
	add	x0, x0, 720
	cmp	w1, 32
	bne	.L280
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L282:
	sxtw	x2, w1
	lsl	x0, x2, 2
	sub	x2, x0, x2
	lsl	x0, x2, 4
	sub	x0, x0, x2
	lsl	x0, x0, 4
	add	x2, x19, x0
	add	x0, x2, 56
	strb	w1, [x2, 59]
	strb	wzr, [x2, 58]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_FindEmptyLogicFs, .-FSP_FindEmptyLogicFs
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_FindEmptyDecodeFs
	.type	FSP_FindEmptyDecodeFs, %function
FSP_FindEmptyDecodeFs:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	x1, .LC111
	mov	w0, w21
	ldr	x24, [x1, w21, sxtw 3]
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L284
	ldrsb	w23, [x24, 10]
	cmp	w23, wzr
	ble	.L283
	add	x19, x24, 20480
	mov	w20, 0
	add	x19, x19, 2716
	b	.L287
	.p2align 3
.L286:
	add	w20, w20, 1
	add	x19, x19, 100
	cmp	w20, w23
	beq	.L283
.L287:
	ldr	w0, [x19, 96]
	cmp	w0, 1
	bne	.L286
	sxtw	x0, w20
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x24, x0
	add	x0, x0, 20480
	ldr	w0, [x0, 2716]
	tst	w0, 16711935
	bne	.L286
	mov	x1, x19
	mov	w0, w21
	bl	FSP_IsDecFsAvailable.part.5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L286
	str	x19, [x22, 680]
.L283:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L284:
	ldr	x0, .LC112
	add	x19, x24, 20480
	add	x19, x19, 2716
	mov	w20, 0
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 626688
	ldr	w23, [x0, 3840]
	b	.L289
	.p2align 3
.L288:
	add	w20, w20, 1
	add	x19, x19, 100
	cmp	w20, 32
	beq	.L283
.L289:
	ldr	w0, [x19, 96]
	cmp	w0, 1
	bne	.L288
	sxtw	x0, w20
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x24, x0
	add	x0, x0, 20480
	ldr	w0, [x0, 2716]
	tst	w0, 16711935
	bne	.L288
	mov	x1, x19
	mov	w0, w21
	bl	FSP_IsDecFsAvailable.part.5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L288
	ldr	w0, [x19, 20]
	cmp	w23, w0
	bne	.L288
	str	x19, [x22, 680]
	b	.L283
	.size	FSP_FindEmptyDecodeFs, .-FSP_FindEmptyDecodeFs
	.align	3
.LC111:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w25, w0
	mov	x0, x30
	mov	w24, w1
	bl	_mcount
	cmp	w25, 31
	bhi	.L326
	ldr	x19, .LC115
	ldr	x0, [x19, w25, sxtw 3]
	cbz	x0, .L327
	ldr	x23, .LC117
	mov	w0, 3
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x21, [x19, w25, sxtw 3]
	mov	w1, 0
	add	x0, x21, 56
	.p2align 2
.L299:
	ldrsb	w2, [x0]
	cbnz	w2, .L297
	ldrsb	w2, [x0, 1]
	cbz	w2, .L328
.L297:
	add	w1, w1, 1
	add	x0, x0, 720
	cmp	w1, 32
	bne	.L299
.L300:
	ldr	x1, .LC119
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
.L325:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L328:
	sxtw	x26, w1
	lsl	x22, x26, 2
	sub	x22, x22, x26
	lsl	x0, x22, 4
	sub	x22, x0, x22
	lsl	x22, x22, 4
	add	x20, x21, x22
	adds	x22, x20, 56
	strb	w1, [x20, 59]
	strb	wzr, [x20, 58]
	beq	.L300
	mov	w19, 720
	smaddl	x19, w1, w19, x21
	str	xzr, [x19, 736]
	str	xzr, [x20, 744]
	str	xzr, [x20, 752]
	str	wzr, [x20, 760]
	cbnz	w24, .L301
	add	x0, x21, 20480
	add	x1, x21, 28672
	add	x0, x0, 2616
	str	x0, [x19, 736]
	str	x0, [x20, 744]
	mov	w2, 1
	str	x0, [x20, 752]
	ldr	w0, [x1, 1512]
	str	w0, [x20, 760]
	ldrb	w0, [x21, 13]
	strb	w2, [x20, 58]
	sub	w0, w0, #1
	strb	w0, [x20, 60]
.L302:
	lsl	x0, x26, 2
	add	x20, x22, 8
	sub	x1, x0, x26
	mov	w2, 1
	lsl	x0, x1, 4
	mov	w3, 1
	sub	x0, x0, x1
	lsl	x0, x0, 4
	add	x22, x21, x0
	add	x0, x22, 64
	ldr	x1, [x22, 744]
	strb	w2, [x22, 57]
	strb	w2, [x1, 2]
	str	w3, [x19, 732]
	ldr	x2, [x19, 736]
	ldr	w1, [x21, 16]
	str	w1, [x19, 728]
	str	w1, [x2, 88]
	ldr	x1, [x22, 744]
	ldr	w2, [x19, 728]
	str	w2, [x1, 88]
	mov	x2, 664
	ldr	w1, [x21, 16]
	add	w1, w1, w3
	str	w1, [x21, 16]
	mov	w1, 0
	ldr	x3, [x23, 96]
	ldr	x19, [x19, 736]
	ldr	x21, [x22, 744]
	ldr	x24, [x22, 752]
	blr	x3
	ldrsb	w0, [x22, 59]
	str	w0, [x20, 180]
	ldr	w0, [x19, 68]
	str	w0, [x20, 128]
	ldr	w0, [x19, 72]
	str	w0, [x20, 132]
	ldr	w0, [x21, 32]
	str	w0, [x20, 164]
	ldr	w0, [x21, 60]
	str	w0, [x20, 168]
	ldr	w0, [x21, 64]
	str	w0, [x20, 172]
	ldr	w1, [x19, 16]
	str	w1, [x20, 44]
	mov	w0, w1
	ldr	w2, [x19, 76]
	add	w1, w2, w1
	str	w1, [x20, 48]
	bl	MEM_Phy2Vir
	str	x0, [x20, 544]
	ldr	w0, [x20, 48]
	bl	MEM_Phy2Vir
	str	x0, [x20, 552]
	ldr	w0, [x19, 24]
	str	w0, [x20, 256]
	bl	MEM_Phy2Vir
	str	x0, [x20, 264]
	ldr	w1, [x21, 16]
	str	w1, [x20, 28]
	ldr	w0, [x21, 76]
	add	w0, w1, w0
	str	w0, [x20, 32]
	ldr	w2, [x21, 32]
	add	w1, w2, w1
	str	w1, [x20, 36]
	ldr	w1, [x21, 32]
	add	w0, w1, w0
	str	w0, [x20, 40]
	ldr	w1, [x21, 16]
	str	w1, [x20, 60]
	mov	w0, w1
	ldr	w2, [x21, 76]
	add	w1, w2, w1
	str	w1, [x20, 64]
	bl	MEM_Phy2Vir
	str	x0, [x20, 560]
	ldr	w0, [x20, 64]
	bl	MEM_Phy2Vir
	str	x0, [x20, 568]
	ldr	w1, [x20, 44]
	ldr	w2, [x24, 16]
	str	w2, [x20, 52]
	ldr	x0, [x20, 544]
	ldr	w3, [x19, 76]
	add	w2, w3, w2
	str	w2, [x20, 56]
	ldr	w2, [x19, 48]
	str	w2, [x20, 176]
	ldr	w2, [x19, 52]
	add	w2, w2, w1
	str	w2, [x20, 68]
	ldp	w3, w2, [x19, 52]
	add	w2, w3, w2
	add	w1, w2, w1
	str	w1, [x20, 72]
	ldrsw	x1, [x19, 52]
	add	x1, x1, x0
	str	x1, [x20, 584]
	ldpsw	x2, x1, [x19, 52]
	add	x1, x2, x1
	add	x0, x1, x0
	str	x0, [x20, 592]
	ldr	w0, [x19, 28]
	str	w0, [x20, 244]
	ldr	w0, [x19, 28]
	bl	MEM_Phy2Vir
	str	x0, [x20, 576]
	ldr	w0, [x21, 40]
	str	w0, [x20, 104]
	ldr	w0, [x21, 44]
	str	w0, [x20, 108]
	ldr	w0, [x19, 36]
	str	w0, [x20, 92]
	ldr	w0, [x19, 36]
	bl	MEM_Phy2Vir
	str	x0, [x20, 536]
	ldr	x1, [x23, 32]
	mov	w0, 3
	stp	wzr, wzr, [x20, 96]
	blr	x1
	ldr	x27, [sp, 80]
	ldrsb	w0, [x22, 59]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L301:
	mov	w0, w25
	mov	x1, x22
	bl	FSP_FindEmptyDecodeFs
	ldr	x0, [x19, 736]
	cbz	x0, .L329
	add	x24, x21, 28672
	add	x0, x24, 924
	str	x0, [x20, 752]
	ldrsb	w0, [x21, 13]
	cmp	w0, wzr
	ble	.L305
	mov	w0, w25
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L308
	ldrsb	w2, [x21, 13]
	cmp	w2, wzr
	ble	.L307
	ldrh	w0, [x24, 1516]
	cmp	w0, 1
	beq	.L308
	mov	w1, 0
	b	.L309
	.p2align 3
.L312:
	add	x0, x21, x0, lsl 3
	ldrh	w3, [x0, 12]
	cmp	w3, 1
	beq	.L330
.L309:
	add	w1, w1, 1
	cmp	w1, w2
	sxtw	x0, w1
	add	x0, x0, 3772
	bne	.L312
.L307:
	cmp	w2, wzr
	ldr	w4, [x24, 1508]
	ble	.L314
.L310:
	sub	w2, w2, #1
	mov	x0, 30197
	add	x1, x24, 1517
	add	x0, x0, x2, uxtw 3
	add	x0, x21, x0
	.p2align 2
.L313:
	strb	wzr, [x1], 8
	cmp	x0, x1
	bne	.L313
.L314:
	lsl	x0, x26, 2
	sub	x1, x0, x26
	lsl	x0, x1, 4
	sub	x0, x0, x1
	ldr	x1, .LC124
	add	x0, x21, x0, lsl 4
	strb	wzr, [x0, 60]
	ldr	w2, [x24, 1512]
	str	w2, [x0, 760]
	str	w4, [x0, 764]
	mov	w0, 0
	bl	dprint_vfmw
	.p2align 2
.L305:
	lsl	x0, x26, 2
	ldr	x24, .LC125
	sub	x0, x0, x26
	ldr	x2, [x19, 736]
	lsl	x20, x0, 4
	sub	x0, x20, x0
	ldr	w1, [x24]
	add	x20, x21, x0, lsl 4
	str	x2, [x20, 744]
	cbz	w1, .L302
	mov	w0, w25
	bl	VCTRL_GetImageWidth
	mov	w27, w0
	mov	w0, w25
	bl	VCTRL_GetImageHeight
	ldr	x4, [x24, 16]
	cbz	x4, .L331
	mov	w3, w0
	mov	w2, w27
	mov	w0, w25
	add	x1, x29, 104
	blr	x4
	cbnz	w0, .L316
	ldr	w0, [x29, 112]
	cbz	w0, .L332
	ldr	x1, [x19, 736]
	str	w0, [x1, 16]
	ldrsb	x0, [x20, 60]
	ldr	w1, [x29, 136]
	add	x0, x0, 3772
	str	w1, [x20, 760]
	add	x0, x21, x0, lsl 3
	str	w1, [x0, 8]
	b	.L302
.L330:
	lsl	x3, x26, 2
	cmp	w1, w2
	sub	x4, x3, x26
	lsl	x3, x4, 4
	sub	x3, x3, x4
	add	x3, x21, x3, lsl 4
	strb	w1, [x3, 60]
	ldr	w0, [x0, 8]
	str	w0, [x3, 760]
	ldr	w4, [x24, 1508]
	str	w4, [x3, 764]
	blt	.L305
	b	.L310
	.p2align 3
.L308:
	strb	wzr, [x20, 60]
	ldr	w0, [x24, 1512]
	str	w0, [x20, 760]
	ldr	w0, [x24, 1508]
	str	w0, [x20, 764]
	b	.L305
.L326:
	ldr	x3, .LC113
	mov	w2, 1307
	ldr	x1, .LC114
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L325
.L327:
	ldr	x3, .LC116
	mov	w2, 1308
	ldr	x1, .LC114
	bl	dprint_vfmw
	mov	w0, -1
	b	.L325
.L332:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	ldr	x1, .LC130
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L325
.L331:
	ldr	x1, .LC126
	mov	w0, 0
	bl	dprint_vfmw
.L316:
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	ldr	x1, .LC128
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L325
.L329:
	ldr	x2, .LC120
	ldr	x1, .LC122
	bl	dprint_vfmw
	ldr	x1, [x23, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
	b	.L325
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	3
.LC113:
	.xword	.LC7
	.align	3
.LC114:
	.xword	.LC9
	.align	3
.LC115:
	.xword	.LANCHOR0
	.align	3
.LC116:
	.xword	.LC24
	.align	3
.LC117:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC120:
	.xword	.LANCHOR2
	.align	3
.LC122:
	.xword	.LC121
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	.LANCHOR1
	.align	3
.LC126:
	.xword	.LC42
	.align	3
.LC128:
	.xword	.LC127
	.align	3
.LC130:
	.xword	.LC129
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPhyFsNum
	.type	FSP_GetPhyFsNum, %function
FSP_GetPhyFsNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	w20, w1
	mov	w19, 0
	bl	_mcount
	ldr	x21, .LC131
	mov	w0, 3
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x0, .LC132
	ldr	x2, [x0, w22, sxtw 3]
	add	x0, x2, 20480
	add	x2, x2, 24576
	add	x0, x0, 2812
	add	x3, x2, 1916
	b	.L335
	.p2align 3
.L334:
	add	x0, x0, 100
	cmp	x0, x3
	beq	.L339
.L335:
	ldr	w2, [x0]
	cmp	w2, 1
	bne	.L334
	ldr	w1, [x0, -76]
	add	x0, x0, 100
	cmp	w1, w20
	ccmp	w20, wzr, 4, ne
	csinc	w19, w19, w19, ne
	cmp	x0, x3
	bne	.L335
.L339:
	ldr	x1, [x21, 32]
	mov	w0, 3
	blr	x1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_GetPhyFsNum, .-FSP_GetPhyFsNum
	.align	3
.LC131:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC132:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RelsePMVRecod
	.type	FSP_RelsePMVRecod, %function
FSP_RelsePMVRecod:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x20, .LC133
	uxtw	x1, w19
	lsl	x19, x1, 6
	ldr	x0, [x20, w21, sxtw 3]
	add	x19, x19, x1, lsl 3
	add	x0, x0, x19
	add	x0, x0, 323584
	ldr	w1, [x0, 3984]
	cmp	w1, 255
	beq	.L340
	ldr	w22, [x0, 4040]
	mov	w0, w22
	bl	MEM_Phy2Vir
	mov	x1, x0
	ldr	x2, [x20, w21, sxtw 3]
	mov	w0, w22
	add	x19, x2, x19
	add	x19, x19, 323584
	ldr	w2, [x19, 3996]
	bl	MEM_DelMemRecord
.L340:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_RelsePMVRecod, .-FSP_RelsePMVRecod
	.align	3
.LC133:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RelsePhyFs
	.type	FSP_RelsePhyFs, %function
FSP_RelsePhyFs:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	mov	w22, w1
	mov	w19, 0
	bl	_mcount
	ldr	x20, .LC134
	mov	w0, 3
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x0, .LC135
	ldr	x24, [x0, w21, sxtw 3]
	add	x0, x24, 20480
	add	x0, x0, 2812
	b	.L349
	.p2align 3
.L346:
	add	w19, w19, 1
	add	x0, x0, 100
	cmp	w19, 32
	beq	.L369
.L349:
	ldr	w2, [x0]
	cmp	w2, 1
	bne	.L346
	ldrsb	w2, [x0, -96]
	cbnz	w2, .L346
	ldrsb	w2, [x0, -94]
	cbnz	w2, .L346
	ldr	w2, [x0, -76]
	cmp	w2, w22
	beq	.L346
	sxtw	x0, w19
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x24, x24, x0
	add	x24, x24, 20480
	ldr	w23, [x24, 2732]
	mov	w0, w23
	bl	MEM_Phy2Vir
	mov	x22, x0
	cmp	w19, 31
	ldr	w2, [x24, 2736]
	bgt	.L369
	mov	x1, x0
	str	wzr, [x24, 2812]
	mov	w0, w23
	bl	MEM_DelMemRecord
	mov	w1, w19
	mov	w0, w21
	bl	FSP_RelsePMVRecod
	ldr	x1, [x20, 32]
	mov	w0, 3
	blr	x1
	ldr	x1, [x20, 24]
	mov	w0, 8
	blr	x1
	ldr	x0, .LC136
	mov	w1, 0
	ldr	x3, [x0, w21, sxtw 3]
	add	x4, x3, 327680
	add	x0, x4, 2200
	b	.L351
	.p2align 3
.L353:
	add	w1, w1, 1
	add	x0, x0, 12
	cmp	w1, 32
	beq	.L355
.L351:
	ldrb	w2, [x0]
	cmp	w2, 1
	bne	.L353
	ldr	w2, [x0, -8]
	cmp	w23, w2
	bne	.L353
	cmp	w1, 31
	bgt	.L355
	sxtw	x1, w1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	add	x0, x4, x1, lsl 2
	strb	wzr, [x0, 2200]
.L355:
	add	x0, x3, 323584
	mov	w19, 0
	add	x0, x0, 3976
	b	.L358
	.p2align 3
.L356:
	add	w19, w19, 1
	add	x0, x0, 72
	cmp	w19, 32
	beq	.L359
.L358:
	ldr	w1, [x0]
	cmp	w1, 255
	beq	.L356
	ldr	w1, [x0, 32]
	cmp	w23, w1
	bne	.L356
	cmp	w19, 31
	bgt	.L359
	sxtw	x0, w19
	ldr	x2, .LC137
	lsl	x4, x0, 6
	mov	w1, 255
	add	x0, x4, x0, lsl 3
	add	x0, x3, x0
	ldr	x4, [x2]
	add	x0, x0, 323584
	str	w1, [x0, 3976]
	cbz	x4, .L359
	uxtw	x23, w23
	mov	w3, 16
	add	x2, x29, 64
	mov	w1, 123
	mov	w0, w21
	stp	x23, x22, [x29, 64]
	blr	x4
.L359:
	ldr	x1, [x20, 32]
	mov	w0, 8
	blr	x1
	cmp	w19, 31
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	csetm	w0, gt
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L369:
	ldr	x1, [x20, 32]
	mov	w0, 3
	blr	x1
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	FSP_RelsePhyFs, .-FSP_RelsePhyFs
	.align	3
.LC134:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC135:
	.xword	.LANCHOR0
	.align	3
.LC136:
	.xword	s_pstVfmwChan
	.align	3
.LC137:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_RemovePmv
	.type	FSP_RemovePmv, %function
FSP_RemovePmv:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L378
	cmp	w19, 31
	bhi	.L379
	ldr	x0, .LC142
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L380
	mov	w0, 720
	smaddl	x0, w19, w0, x2
	ldr	w1, [x0, 732]
	cmp	w1, 2
	beq	.L381
.L372:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L381:
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x3, x19, 4
	sub	x19, x3, x19
	add	x19, x2, x19, lsl 4
	ldrsb	w1, [x19, 60]
	uxtb	w3, w1
	cmp	w3, 31
	bhi	.L377
	sxtw	x1, w1
	add	x1, x1, 3772
	add	x2, x2, x1, lsl 3
	strb	wzr, [x2, 13]
.L377:
	str	wzr, [x0, 732]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
	ldr	x3, .LC138
	mov	w2, 1639
	ldr	x1, .LC139
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L379:
	ldr	x3, .LC141
	mov	w2, 1640
	ldr	x1, .LC139
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L380:
	ldr	x3, .LC143
	mov	w2, 1641
	ldr	x1, .LC139
	mov	w0, 0
	bl	dprint_vfmw
	b	.L372
	.size	FSP_RemovePmv, .-FSP_RemovePmv
	.align	3
.LC138:
	.xword	.LC7
	.align	3
.LC139:
	.xword	.LC9
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC142:
	.xword	.LANCHOR0
	.align	3
.LC143:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w1
	mov	w22, w2
	bl	_mcount
	cmp	w23, 31
	bhi	.L415
	cmp	w19, 31
	bhi	.L416
	ldr	x0, .LC147
	ldr	x21, [x0, w23, sxtw 3]
	cbz	x21, .L417
	sxtw	x20, w19
	sxtb	w24, w22
	lsl	x0, x20, 2
	sub	x2, x0, x20
	lsl	x0, x2, 4
	sub	x0, x0, x2
	add	x0, x21, x0, lsl 4
	ldrsb	w1, [x0, 58]
	strb	w24, [x0, 56]
	cbnz	w1, .L382
	mov	w1, 720
	smaddl	x19, w19, w1, x21
	ldr	x0, [x19, 736]
	cbz	x0, .L388
	ldr	w2, [x0, 88]
	ldr	w1, [x19, 728]
	cmp	w2, w1
	beq	.L418
.L388:
	lsl	x0, x20, 2
	sub	x1, x0, x20
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x0, x21, x0, lsl 4
	ldrsb	w3, [x0, 60]
	uxtb	w1, w3
	cmp	w1, 31
	bhi	.L391
	cmp	w22, 1
	beq	.L419
	cbnz	w22, .L394
	ldr	w1, [x19, 732]
	cmp	w1, 2
	beq	.L420
.L395:
	lsl	x0, x20, 2
	sub	x20, x0, x20
	lsl	x0, x20, 4
	sub	x20, x0, x20
	add	x21, x21, x20, lsl 4
	ldr	x0, [x21, 744]
	cbz	x0, .L405
	ldrsb	w1, [x0, 2]
	cmp	w1, 1
	beq	.L421
.L405:
	str	xzr, [x19, 736]
.L382:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L415:
	ldr	x3, .LC144
	mov	w2, 1669
	ldr	x1, .LC145
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L419:
	ldr	w0, [x19, 732]
	cmp	w0, 1
	beq	.L422
.L393:
	lsl	x0, x20, 2
	sub	x1, x0, x20
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x0, x21, x0, lsl 4
	ldr	x0, [x0, 744]
	cbz	x0, .L382
.L400:
	ldr	w2, [x0, 88]
	ldr	w1, [x19, 728]
	cmp	w2, w1
	ccmp	w22, 1, 0, eq
	beq	.L423
.L396:
	cbnz	w22, .L382
.L424:
	str	xzr, [x19, 736]
	b	.L382
	.p2align 3
.L416:
	ldr	x3, .LC146
	mov	w2, 1670
	ldr	x1, .LC145
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L391:
	ldr	x1, .LC152
	mov	w2, 1722
	mov	w0, 0
	bl	dprint_vfmw
	cbz	w22, .L395
	b	.L393
	.p2align 3
.L422:
	sxtw	x0, w3
	mov	w1, 2
	add	x0, x0, 3772
	add	x0, x21, x0, lsl 3
	strb	w22, [x0, 13]
	str	w1, [x19, 732]
.L394:
	lsl	x0, x20, 2
	sub	x1, x0, x20
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x0, x21, x0, lsl 4
	ldr	x0, [x0, 744]
	cbnz	x0, .L400
	cbz	w22, .L424
	b	.L382
	.p2align 3
.L418:
	ldrsb	w1, [x0]
	cmp	w22, w1
	beq	.L389
	ldr	x1, .LC149
	ldr	w2, [x1]
	cbnz	w2, .L425
.L389:
	strb	w24, [x0]
	b	.L388
	.p2align 3
.L423:
	ldrsb	w1, [x0, 2]
	cmp	w1, 1
	bne	.L396
	lsl	x1, x20, 2
	mov	w2, 2
	sub	x20, x1, x20
	strb	w2, [x0, 2]
	lsl	x0, x20, 4
	sub	x0, x0, x20
	add	x21, x21, x0, lsl 4
	strb	w2, [x21, 57]
	cbz	w22, .L424
	b	.L382
	.p2align 3
.L421:
	strb	wzr, [x0, 2]
	str	xzr, [x19, 736]
	b	.L382
	.p2align 3
.L425:
	ldr	x3, [x1, 32]
	ldr	w1, [x0, 16]
	cbz	x3, .L426
	mov	w2, w22
	mov	w0, w23
	blr	x3
	ldr	x0, [x19, 736]
	strb	w24, [x0]
	b	.L388
	.p2align 3
.L420:
	sxtw	x1, w3
	add	x1, x1, 3772
	add	x1, x21, x1, lsl 3
	strb	wzr, [x1, 13]
	str	wzr, [x0, 760]
	str	wzr, [x19, 732]
	b	.L395
	.p2align 3
.L417:
	ldr	x3, .LC148
	mov	w2, 1671
	ldr	x1, .LC145
	mov	w0, 0
	bl	dprint_vfmw
	b	.L382
.L426:
	ldr	x1, .LC150
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x19, 736]
	strb	w24, [x0]
	b	.L388
	.size	FSP_SetRef, .-FSP_SetRef
	.align	3
.LC144:
	.xword	.LC7
	.align	3
.LC145:
	.xword	.LC9
	.align	3
.LC146:
	.xword	.LC140
	.align	3
.LC147:
	.xword	.LANCHOR0
	.align	3
.LC148:
	.xword	.LC24
	.align	3
.LC149:
	.xword	.LANCHOR1
	.align	3
.LC150:
	.xword	.LC42
	.align	3
.LC152:
	.xword	.LC151
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L432
	cmp	w19, 31
	bhi	.L433
	ldr	x0, .LC158
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L434
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x19, x2, x19, lsl 4
	ldrsb	w0, [x19, 56]
.L429:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L432:
	ldr	x3, .LC154
	mov	w2, 1761
	ldr	x1, .LC155
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L429
	.p2align 3
.L433:
	ldr	x3, .LC157
	mov	w2, 1762
	ldr	x1, .LC155
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L429
.L434:
	ldr	x3, .LC160
	mov	w2, 1763
	ldr	x1, .LC155
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L429
	.size	FSP_GetRef, .-FSP_GetRef
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC155:
	.xword	.LC9
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC158:
	.xword	.LANCHOR0
	.align	3
.LC160:
	.xword	.LC159
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	mov	w21, w2
	bl	_mcount
	cmp	w22, 31
	bhi	.L476
	cmp	w19, 31
	bhi	.L477
	ldr	x20, .LC164
	ldr	x0, [x20, w22, sxtw 3]
	cbz	x0, .L478
	ldr	x24, .LC166
	mov	w0, 3
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x23, [x20, w22, sxtw 3]
	lsl	x0, x19, 2
	sub	x1, x0, x19
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x0, x23, x0, lsl 4
	ldrsb	w1, [x0, 58]
	cmp	w1, wzr
	ccmp	w21, wzr, 0, eq
	bne	.L440
	ldr	x1, [x0, 744]
	cbz	x1, .L440
	ldrsb	w0, [x0, 57]
	cbz	w0, .L440
	ldr	x0, .LC167
	ldr	w2, [x0]
	cbnz	w2, .L479
	.p2align 2
.L440:
	lsl	x20, x19, 2
	mov	w25, 3
	sub	x20, x20, x19
	cmp	w21, wzr
	lsl	x0, x20, 4
	csel	w1, wzr, w25, eq
	sub	x20, x0, x20
	add	x20, x23, x20, lsl 4
	ldrsb	w0, [x20, 58]
	strb	w1, [x20, 57]
	cbnz	w0, .L450
	ldr	x4, [x20, 744]
	cbz	x4, .L450
	add	x1, x19, 1
	ldr	w3, [x4, 88]
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 4
	sub	x0, x0, x1
	add	x0, x23, x0, lsl 4
	ldr	w2, [x0, 8]
	cmp	w3, w2
	bne	.L480
	cbnz	w21, .L446
	strb	wzr, [x20, 57]
	mov	w0, w22
	strb	wzr, [x4, 2]
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L481
.L448:
	lsl	x0, x19, 2
	sub	x19, x0, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x23, x23, x19, lsl 4
	str	xzr, [x23, 744]
.L450:
	ldr	x1, [x24, 32]
	mov	w0, 3
	blr	x1
.L435:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L476:
	ldr	x3, .LC161
	mov	w2, 1780
	ldr	x1, .LC162
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L446:
	mov	w0, w22
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L482
.L449:
	lsl	x0, x19, 2
	mov	w1, 3
	sub	x19, x0, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x23, x23, x19, lsl 4
	ldr	x0, [x23, 744]
	strb	w1, [x23, 57]
	strb	w1, [x0, 2]
	b	.L450
	.p2align 3
.L477:
	ldr	x3, .LC163
	mov	w2, 1781
	ldr	x1, .LC162
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L480:
	ldr	x1, .LC170
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x24, 32]
	mov	w0, w25
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L478:
	ldr	x3, .LC165
	mov	w2, 1782
	ldr	x1, .LC162
	bl	dprint_vfmw
	b	.L435
	.p2align 3
.L479:
	ldr	x2, [x0, 24]
	ldr	w1, [x1, 16]
	cbz	x2, .L483
	mov	w0, w22
	blr	x2
	b	.L440
	.p2align 3
.L481:
	ldr	x0, [x20, 744]
	cbz	x0, .L448
	ldr	w1, [x0, 4]
	cbz	w1, .L448
	sub	w1, w1, #1
	str	w1, [x0, 4]
	ldr	x0, [x20, 744]
	ldr	w1, [x0, 4]
	cbz	w1, .L448
	strb	w25, [x0, 2]
	b	.L448
	.p2align 3
.L482:
	ldr	x0, [x20, 744]
	cbz	x0, .L449
	ldr	w1, [x0, 4]
	add	w1, w1, 1
	str	w1, [x0, 4]
	b	.L449
.L483:
	ldr	x1, .LC168
	mov	w0, 0
	bl	dprint_vfmw
	b	.L440
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	3
.LC161:
	.xword	.LC7
	.align	3
.LC162:
	.xword	.LC9
	.align	3
.LC163:
	.xword	.LC140
	.align	3
.LC164:
	.xword	.LANCHOR0
	.align	3
.LC165:
	.xword	.LC24
	.align	3
.LC166:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC167:
	.xword	.LANCHOR1
	.align	3
.LC168:
	.xword	.LC44
	.align	3
.LC170:
	.xword	.LC169
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L495
	cbz	x22, .L496
	ldr	x0, .LC175
	ldr	x19, [x0, w20, sxtw 3]
	cbz	x19, .L497
	add	x21, x19, 20480
	add	x19, x19, 64
	add	x21, x21, 2624
	b	.L490
	.p2align 3
.L489:
	add	x19, x19, 720
	cmp	x19, x21
	beq	.L498
.L490:
	ldr	w1, [x19, 180]
	mov	w0, w20
	mov	w2, 0
	bl	FSP_SetRef
	mov	x1, x19
	mov	x0, x22
	bl	IsImageInVoQueue
	cbz	w0, .L489
	ldr	w1, [x19, 180]
	mov	w2, 0
	mov	w0, w20
	add	x19, x19, 720
	bl	FSP_SetDisplay
	cmp	x19, x21
	bne	.L490
.L498:
	mov	w0, 0
.L486:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L495:
	ldr	x3, .LC171
	mov	w2, 516
	ldr	x1, .LC172
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L486
.L497:
	ldr	x3, .LC176
	mov	w2, 518
	ldr	x1, .LC172
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L486
.L496:
	ldr	x3, .LC174
	mov	w2, 517
	ldr	x1, .LC172
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L486
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	3
.LC171:
	.xword	.LC7
	.align	3
.LC172:
	.xword	.LC9
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC175:
	.xword	.LANCHOR0
	.align	3
.LC176:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC177
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L502
	sxtw	x1, w19
	lsl	x2, x1, 2
	sub	x1, x2, x1
	lsl	x2, x1, 4
	sub	x1, x2, x1
	add	x0, x0, x1, lsl 4
	ldrsb	w0, [x0, 57]
.L501:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L502:
	ldr	x3, .LC178
	mov	w2, 1873
	ldr	x1, .LC179
	bl	dprint_vfmw
	mov	w0, -1
	b	.L501
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	3
.LC177:
	.xword	.LANCHOR0
	.align	3
.LC178:
	.xword	.LC24
	.align	3
.LC179:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w22, w1
	sxtw	x19, w2
	mov	w20, w3
	bl	_mcount
	cmp	w21, 31
	bhi	.L511
	ldr	x0, .LC182
	ldr	x4, [x0, w21, sxtw 3]
	cbz	x4, .L512
	cbz	w22, .L513
	cmp	w22, 1
	bne	.L510
	ldrsb	w0, [x4, 11]
	cmp	w19, w0
	bge	.L510
	lsl	x1, x19, 2
	mov	w0, 0
	sub	x1, x1, x19
	lsl	x2, x1, 5
	add	x2, x1, x2
	add	x2, x2, x19
	add	x19, x4, x2
	add	x19, x19, 24576
	str	w20, [x19, 1832]
.L505:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L513:
	ldrsb	w0, [x4, 10]
	cmp	w0, w19
	ble	.L510
	lsl	x1, x19, 2
	mov	w0, 0
	sub	x1, x1, x19
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x19, x1, x19
	add	x19, x4, x19
	add	x19, x19, 20480
	str	w20, [x19, 2728]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L510:
	mov	w0, -1
	b	.L505
	.p2align 3
.L511:
	ldr	x3, .LC180
	mov	w2, 1889
	ldr	x1, .LC181
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L505
.L512:
	ldr	x3, .LC183
	mov	w2, 1890
	ldr	x1, .LC181
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L505
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	3
.LC180:
	.xword	.LC7
	.align	3
.LC181:
	.xword	.LC9
	.align	3
.LC182:
	.xword	.LANCHOR0
	.align	3
.LC183:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 31
	bhi	.L522
	ldr	x0, .LC186
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L523
	cbnz	w21, .L518
	ldrsb	w1, [x2, 10]
	mov	w0, 2
	cmp	w1, w20
	bgt	.L524
.L516:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L522:
	ldr	x3, .LC184
	mov	w2, 1922
	ldr	x1, .LC185
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L518:
	cmp	w21, 1
	mov	w0, 2
	bne	.L516
	ldrsb	w1, [x2, 11]
	cmp	w20, w1
	bge	.L516
	sxtw	x1, w20
	lsl	x0, x1, 2
	sub	x0, x0, x1
	lsl	x3, x0, 5
	add	x0, x0, x3
	add	x1, x0, x1
	add	x0, x2, x1
	add	x0, x0, 24576
	ldr	w0, [x0, 1832]
	b	.L516
	.p2align 3
.L524:
	lsl	x0, x20, 2
	sub	x0, x0, x20
	lsl	x1, x0, 5
	add	x0, x0, x1
	add	x20, x0, x20
	add	x0, x2, x20
	add	x0, x0, 20480
	ldr	w0, [x0, 2728]
	b	.L516
	.p2align 3
.L523:
	ldr	x3, .LC187
	mov	w2, 1923
	ldr	x1, .LC185
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L516
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	3
.LC184:
	.xword	.LC7
	.align	3
.LC185:
	.xword	.LC9
	.align	3
.LC186:
	.xword	.LANCHOR0
	.align	3
.LC187:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	ccmp	w20, 31, 2, ls
	bhi	.L525
	ldr	x21, .LC188
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L525
	mov	w2, 0
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetRef
	sxtw	x0, w20
	ldr	x2, [x21, w19, sxtw 3]
	lsl	x1, x0, 2
	sub	x0, x1, x0
	lsl	x1, x0, 4
	sub	x0, x1, x0
	add	x0, x2, x0, lsl 4
	ldrsb	w0, [x0, 57]
	cmp	w0, 3
	beq	.L525
	mov	w2, 0
	mov	w1, w20
	mov	w0, w19
	bl	FSP_SetDisplay
.L525:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	3
.LC188:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L538
	ldr	x0, .LC189
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L538
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x2, x19, 4
	sub	x1, x2, x19
	ldp	x19, x20, [sp, 16]
	add	x0, x0, x1, lsl 4
	add	x0, x0, 56
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L538:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	3
.LC189:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L542
	ldr	x0, .LC190
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L542
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x2, x19, 4
	sub	x1, x2, x19
	ldp	x19, x20, [sp, 16]
	add	x0, x0, x1, lsl 4
	add	x0, x0, 64
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L542:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	3
.LC190:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecPhyFs
	.type	FSP_GetDecPhyFs, %function
FSP_GetDecPhyFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L546
	ldr	x0, .LC191
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L546
	add	x19, x19, 1
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x19, x2, x19, lsl 4
	ldr	x0, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L546:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetDecPhyFs, .-FSP_GetDecPhyFs
	.align	3
.LC191:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDispPhyFs
	.type	FSP_GetDispPhyFs, %function
FSP_GetDispPhyFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L550
	ldr	x0, .LC192
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L550
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x19, x2, x19, lsl 4
	ldr	x0, [x19, 744]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L550:
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetDispPhyFs, .-FSP_GetDispPhyFs
	.align	3
.LC192:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w20, 31
	ccmp	w19, 31, 2, ls
	bhi	.L554
	ldr	x0, .LC193
	ldr	x2, [x0, w20, sxtw 3]
	cbz	x2, .L554
	lsl	x1, x19, 2
	sub	x19, x1, x19
	lsl	x0, x19, 4
	sub	x19, x0, x19
	add	x19, x2, x19, lsl 4
	ldr	w0, [x19, 760]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L554:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	3
.LC193:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	mov	x21, x3
	bl	_mcount
	cmp	w22, 31
	bhi	.L566
	cbz	x20, .L567
	cbz	x19, .L568
	ldr	x2, .LC200
	ldr	x0, [x2, w22, sxtw 3]
	cbz	x0, .L569
	str	wzr, [x19]
	mov	w0, 0
	mov	w1, 100
	ldr	x3, [x2, w22, sxtw 3]
	ldrsb	w3, [x3, 10]
	str	w3, [x19]
	cmp	w3, wzr
	ldr	x6, [x2, w22, sxtw 3]
	add	x6, x6, 20480
	add	x6, x6, 2716
	ble	.L555
	.p2align 2
.L564:
	smaddl	x4, w0, w1, x6
	ldr	w5, [x4, 16]
	str	w5, [x20, w0, sxtw 2]
	ldr	w4, [x4, 28]
	str	w4, [x21, w0, sxtw 2]
	add	w0, w0, 1
	ldr	w4, [x19]
	cmp	w4, w0
	bgt	.L564
.L555:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L566:
	ldr	x3, .LC194
	mov	w2, 2069
	ldr	x1, .LC195
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L567:
	ldr	x3, .LC197
	mov	w2, 2070
	ldr	x1, .LC195
	mov	w0, 0
	bl	dprint_vfmw
	b	.L555
.L568:
	ldr	x3, .LC199
	mov	w2, 2071
	ldr	x1, .LC195
	mov	w0, 0
	bl	dprint_vfmw
	b	.L555
.L569:
	ldr	x3, .LC201
	mov	w2, 2072
	ldr	x1, .LC195
	bl	dprint_vfmw
	b	.L555
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	3
.LC194:
	.xword	.LC7
	.align	3
.LC195:
	.xword	.LC9
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC200:
	.xword	.LANCHOR0
	.align	3
.LC201:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 31
	bhi	.L581
	cbz	x19, .L582
	cbz	x21, .L583
	ldr	x0, .LC208
	ldr	x1, [x0, w20, sxtw 3]
	cbz	x1, .L584
	str	wzr, [x21]
	mov	w3, 0
	ldr	x4, [x0, w20, sxtw 3]
	ldrsb	w0, [x4, 13]
	str	w0, [x21]
	ldrsb	w0, [x4, 13]
	cmp	w0, wzr
	ble	.L570
	.p2align 2
.L579:
	sxtw	x0, w3
	add	x0, x0, 3772
	add	x0, x4, x0, lsl 3
	ldr	w0, [x0, 8]
	str	w0, [x19, w3, sxtw 2]
	add	w3, w3, 1
	ldrsb	w0, [x4, 13]
	cmp	w0, w3
	bgt	.L579
.L570:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L581:
	ldr	x3, .LC202
	mov	w2, 2102
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L582:
	ldr	x3, .LC205
	mov	w2, 2103
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	b	.L570
.L583:
	ldr	x3, .LC207
	mov	w2, 2104
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	b	.L570
.L584:
	ldr	x3, .LC209
	mov	w2, 2105
	ldr	x1, .LC203
	mov	w0, 0
	bl	dprint_vfmw
	b	.L570
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	3
.LC202:
	.xword	.LC7
	.align	3
.LC203:
	.xword	.LC9
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC208:
	.xword	.LANCHOR0
	.align	3
.LC209:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetInstInfo
	.type	FSP_GetInstInfo, %function
FSP_GetInstInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC210
	ldr	x3, [x0, w20, sxtw 3]
	cbz	x3, .L588
	ldrsb	w0, [x3, 10]
	add	x1, x3, 20480
	strb	w0, [x19, 1]
	mov	x0, x19
	ldr	x5, .LC213
	mov	x2, 3200
	ldr	w6, [x1, 2732]
	add	x1, x1, 2716
	ldr	w4, [x1, 116]
	sub	w4, w4, w6
	str	w4, [x19, 3208]
	ldrsb	w4, [x3, 11]
	strb	w4, [x19, 2]
	ldrsb	w4, [x3, 12]
	strb	w4, [x19, 3]
	ldrsb	w4, [x3]
	strb	w4, [x19, 4]
	ldrsb	w3, [x3, 13]
	strb	w3, [x0], 8
	ldr	x3, [x5, 104]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L588:
	ldr	x3, .LC211
	mov	w2, 2123
	ldr	x1, .LC212
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetInstInfo, .-FSP_GetInstInfo
	.align	3
.LC210:
	.xword	.LANCHOR0
	.align	3
.LC211:
	.xword	.LC24
	.align	3
.LC212:
	.xword	.LC9
	.align	3
.LC213:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetLogicIdByPhyAddr
	.type	FSP_GetLogicIdByPhyAddr, %function
FSP_GetLogicIdByPhyAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w20, 31
	bhi	.L601
	ldr	x1, .LC216
	mov	w0, 0
	ldr	x1, [x1, w20, sxtw 3]
	add	x2, x1, 736
	cbnz	x1, .L598
	b	.L602
	.p2align 3
.L593:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L603
.L598:
	ldr	x3, [x2]
	add	x2, x2, 720
	cbz	x3, .L593
	ldr	w3, [x3, 16]
	cmp	w3, w19
	bne	.L593
.L591:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L603:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L601:
	ldr	x3, .LC214
	mov	w2, 2146
	ldr	x1, .LC215
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L591
.L602:
	ldr	x3, .LC217
	mov	w2, 2147
	ldr	x1, .LC215
	bl	dprint_vfmw
	mov	w0, -1
	b	.L591
	.size	FSP_GetLogicIdByPhyAddr, .-FSP_GetLogicIdByPhyAddr
	.align	3
.LC214:
	.xword	.LC7
	.align	3
.LC215:
	.xword	.LC9
	.align	3
.LC216:
	.xword	.LANCHOR0
	.align	3
.LC217:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_PrintContext
	.type	FSP_PrintContext, %function
FSP_PrintContext:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L633
	ldr	x0, .LC220
	ldr	x21, [x0, w19, sxtw 3]
	cbz	x21, .L634
	ldr	x1, .LC223
	mov	w0, 0
	add	x19, x21, 56
	mov	w23, 1
	mov	w20, 0
	bl	dprint_vfmw
	ldr	x22, .LC227
	ldr	x2, .LC225
	mov	w0, 0
	ldr	w3, [x21, 4]
	mov	x1, x22
	bl	dprint_vfmw
	ldr	x2, .LC229
	mov	x1, x22
	ldr	w3, [x21, 28]
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x2, .LC231
	mov	x1, x22
	ldr	w3, [x21, 32]
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x2, .LC233
	mov	x1, x22
	ldr	w3, [x21, 44]
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x2, .LC235
	mov	x1, x22
	ldr	w3, [x21, 48]
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 23]
	mov	x1, x22
	ldr	x2, .LC237
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 25]
	mov	x1, x22
	ldr	x2, .LC239
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 26]
	mov	x1, x22
	ldr	x2, .LC241
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 10]
	mov	x1, x22
	ldr	x2, .LC243
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 11]
	mov	x1, x22
	ldr	x2, .LC245
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w3, [x21, 13]
	mov	x1, x22
	ldr	x2, .LC247
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC249
	mov	w2, 32
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x22, .LC253
	ldr	x24, .LC251
	b	.L608
	.p2align 3
.L610:
	ldrsb	w3, [x19, 1]
	mov	x1, x22
	ldrsb	w2, [x19]
	mov	w0, 0
	bl	dprint_vfmw
	cmp	w23, 31
	bgt	.L635
.L611:
	add	w20, w20, 1
	add	w23, w23, 1
	add	x19, x19, 720
.L608:
	and	w0, w20, 7
	cbz	w20, .L609
	cbnz	w0, .L610
	mov	x1, x24
	bl	dprint_vfmw
	ldrsb	w3, [x19, 1]
	mov	x1, x22
	ldrsb	w2, [x19]
	mov	w0, 0
	bl	dprint_vfmw
	cmp	w23, 31
	ble	.L611
.L635:
	ldrsb	w2, [x21, 10]
	mov	w0, 0
	ldr	x1, .LC255
	bl	dprint_vfmw
	ldrsb	w0, [x21, 10]
	cmp	w0, wzr
	ble	.L612
	ldr	x20, .LC251
	mov	w19, 0
	.p2align 2
.L613:
	sxtw	x2, w19
	mov	x1, x22
	lsl	x3, x2, 2
	mov	w0, 0
	sub	x3, x3, x2
	add	w19, w19, 1
	lsl	x4, x3, 5
	add	x3, x3, x4
	add	x2, x3, x2
	add	x2, x21, x2
	add	x2, x2, 20480
	ldrsb	w3, [x2, 2718]
	ldrsb	w2, [x2, 2716]
	bl	dprint_vfmw
	ldrsb	w0, [x21, 10]
	and	w1, w19, 7
	cmp	w0, w19
	ble	.L612
	cbz	w19, .L613
	cbnz	w1, .L613
	mov	x1, x20
	mov	w0, 0
	bl	dprint_vfmw
	b	.L613
	.p2align 3
.L612:
	ldrsb	w2, [x21, 11]
	mov	w0, 0
	ldr	x1, .LC257
	bl	dprint_vfmw
	ldrsb	w0, [x21, 11]
	cmp	w0, wzr
	ble	.L614
	ldr	x20, .LC251
	mov	w19, 0
	.p2align 2
.L615:
	sxtw	x2, w19
	mov	x1, x22
	lsl	x3, x2, 2
	mov	w0, 0
	sub	x3, x3, x2
	add	w19, w19, 1
	lsl	x4, x3, 5
	add	x3, x3, x4
	add	x2, x3, x2
	add	x2, x21, x2
	add	x2, x2, 24576
	ldrsb	w3, [x2, 1822]
	ldrsb	w2, [x2, 1820]
	bl	dprint_vfmw
	ldrsb	w0, [x21, 11]
	and	w1, w19, 7
	cmp	w0, w19
	ble	.L614
	cbz	w19, .L615
	cbnz	w1, .L615
	mov	x1, x20
	mov	w0, 0
	bl	dprint_vfmw
	b	.L615
	.p2align 3
.L614:
	ldrsb	w2, [x21, 13]
	mov	w0, 0
	ldr	x1, .LC259
	bl	dprint_vfmw
	ldrsb	w0, [x21, 13]
	cmp	w0, wzr
	ble	.L618
	ldr	x20, .LC263
	mov	w19, 0
	ldr	x22, .LC251
	.p2align 2
.L619:
	sxtw	x2, w19
	mov	x1, x20
	add	x2, x2, 3772
	mov	w0, 0
	add	w19, w19, 1
	add	x2, x21, x2, lsl 3
	ldrb	w2, [x2, 13]
	bl	dprint_vfmw
	ldrsb	w0, [x21, 13]
	and	w1, w19, 15
	cmp	w0, w19
	ble	.L618
	cbz	w19, .L619
	cbnz	w1, .L619
	mov	x1, x22
	mov	w0, 0
	bl	dprint_vfmw
	b	.L619
	.p2align 3
.L618:
	ldr	x1, .LC261
	mov	w0, 0
	bl	dprint_vfmw
.L604:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L633:
	ldr	x3, .LC218
	mov	w2, 2178
	ldr	x1, .LC219
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L634:
	ldr	x3, .LC221
	mov	w2, 2179
	ldr	x1, .LC219
	mov	w0, 0
	bl	dprint_vfmw
	b	.L604
.L609:
	ldrsb	w3, [x19, 1]
	mov	x1, x22
	ldrsb	w2, [x19]
	mov	w0, 0
	bl	dprint_vfmw
	b	.L611
	.size	FSP_PrintContext, .-FSP_PrintContext
	.align	3
.LC218:
	.xword	.LC7
	.align	3
.LC219:
	.xword	.LC9
	.align	3
.LC220:
	.xword	.LANCHOR0
	.align	3
.LC221:
	.xword	.LC24
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsRefLeak
	.type	FSP_IsRefLeak, %function
FSP_IsRefLeak:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	w19, 1
	bl	_mcount
	str	wzr, [x29, 76]
	ldr	w0, [x21, 28]
	stp	wzr, wzr, [x29, 68]
	cmp	w0, 1088
	bgt	.L637
	ldr	x0, .LC264
	mov	w19, 4
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 331776
	ldr	w0, [x0, 64]
	cmp	w0, wzr
	csinc	w19, w19, wzr, eq
.L637:
	ldrsb	w0, [x21, 10]
	cmp	w0, wzr
	ble	.L646
	sub	w1, w0, #1
	mov	w3, 100
	mov	x2, 23392
	add	x0, x21, 20480
	add	x0, x0, 2812
	mov	w22, 0
	umaddl	x2, w1, w3, x2
	mov	w23, 0
	add	x2, x21, x2
	b	.L641
	.p2align 3
.L639:
	add	x0, x0, 100
	cmp	x0, x2
	beq	.L638
.L641:
	ldr	w1, [x0]
	cmp	w1, 1
	bne	.L639
	ldrsb	w1, [x0, -96]
	cmp	w1, 1
	beq	.L654
	ldrsb	w3, [x0, -94]
	cmp	w3, 2
	bne	.L639
	cmp	w1, wzr
	add	x0, x0, 100
	csinc	w22, w22, w22, ne
	cmp	x0, x2
	bne	.L641
	.p2align 2
.L638:
	add	x2, x29, 76
	add	x1, x29, 68
	mov	w0, w20
	add	x3, x29, 72
	bl	VCTRL_GetChanImgNum
	ldr	w1, [x29, 68]
	mov	w0, 0
	ldrsb	w2, [x21, 10]
	add	w1, w19, w1
	cmp	w1, w2
	bcc	.L650
	add	w22, w23, w22
	add	w19, w22, w19
	cmp	w2, w19
	bhi	.L650
	ldr	x1, .LC264
	ldr	x1, [x1, w20, sxtw 3]
	ldr	w1, [x1, 628]
	cmp	w1, 2
	beq	.L650
	mov	w0, w20
	bl	FSP_PrintContext
	mov	w0, 1
.L650:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L654:
	add	w23, w23, 1
	b	.L639
.L646:
	mov	w22, 0
	mov	w23, 0
	b	.L638
	.size	FSP_IsRefLeak, .-FSP_IsRefLeak
	.align	3
.LC264:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsNewFsAvalible
	.type	FSP_IsNewFsAvalible, %function
FSP_IsNewFsAvalible:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 31
	bhi	.L707
	ldr	x22, .LC267
	ldr	x23, [x22, w21, sxtw 3]
	cbz	x23, .L708
	ldr	x0, .LC269
	ldr	w1, [x0]
	cbnz	w1, .L659
.L663:
	ldrsb	w0, [x23, 10]
	cbnz	w0, .L709
.L660:
	mov	w1, 1
.L695:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L709:
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L664
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 16
	beq	.L665
.L669:
	ldrsb	w24, [x23, 10]
	cmp	w24, wzr
	ble	.L673
	add	x19, x23, 20480
	mov	w20, 0
	add	x19, x19, 2716
	b	.L672
	.p2align 3
.L670:
	add	w20, w20, 1
	add	x19, x19, 100
	cmp	w20, w24
	beq	.L673
.L672:
	ldr	w0, [x19, 96]
	cmp	w0, 1
	bne	.L670
	sxtw	x0, w20
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x23, x0
	add	x0, x0, 20480
	ldr	w0, [x0, 2716]
	tst	w0, 16711935
	bne	.L670
	mov	x1, x19
	mov	w0, w21
	bl	FSP_IsDecFsAvailable.part.5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L670
	cmp	w24, w20
	ble	.L673
.L678:
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	beq	.L660
	ldrsb	w2, [x23, 13]
	cmp	w2, wzr
	ble	.L679
	add	x0, x23, 28672
	ldrh	w0, [x0, 1516]
	cmp	w0, 1
	beq	.L660
	mov	w1, 0
	b	.L680
	.p2align 3
.L681:
	add	x0, x23, x0, lsl 3
	ldrh	w0, [x0, 12]
	cmp	w0, 1
	beq	.L660
.L680:
	add	w1, w1, 1
	cmp	w1, w2
	sxtw	x0, w1
	add	x0, x0, 3772
	bne	.L681
.L682:
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cbz	w0, .L660
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 16
	beq	.L660
	mov	w0, w21
	bl	VCTRL_GetVidStd
	cmp	w0, 15
	beq	.L660
	.p2align 2
.L673:
	ldr	x0, [x22, w21, sxtw 3]
	cbz	x0, .L710
	mov	w1, 0
.L712:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L659:
	ldr	x1, [x0, 8]
	cbz	x1, .L711
	mov	w0, w21
	blr	x1
	mov	w1, 0
	cbz	w0, .L663
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L664:
	ldr	x0, .LC271
	add	x19, x23, 20480
	add	x19, x19, 2716
	mov	w20, 0
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 626688
	ldr	w24, [x0, 3840]
	b	.L677
	.p2align 3
.L675:
	add	w20, w20, 1
	add	x19, x19, 100
	cmp	w20, 32
	beq	.L673
.L677:
	ldr	w0, [x19, 96]
	cmp	w0, 1
	bne	.L675
	sxtw	x0, w20
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x2, x1, 5
	add	x1, x1, x2
	add	x0, x1, x0
	add	x0, x23, x0
	add	x0, x0, 20480
	ldr	w0, [x0, 2716]
	tst	w0, 16711935
	bne	.L675
	mov	x1, x19
	mov	w0, w21
	bl	FSP_IsDecFsAvailable.part.5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L675
	ldr	w0, [x19, 20]
	cmp	w24, w0
	bne	.L675
	cmp	w20, 31
	ble	.L678
	b	.L673
	.p2align 3
.L710:
	ldr	x1, .LC272
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, 0
	b	.L712
.L665:
	mov	w1, w21
	mov	x0, x23
	bl	FSP_IsRefLeak
	cbz	w0, .L669
	mov	w1, -1
	b	.L695
	.p2align 3
.L679:
	bne	.L673
	b	.L682
	.p2align 3
.L707:
	ldr	x1, .LC266
	mov	w2, 1094
	ldr	x3, .LC265
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L695
.L708:
	ldr	x1, .LC266
	mov	w2, 1095
	ldr	x3, .LC268
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L695
.L711:
	ldr	x1, .LC270
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 0
	b	.L695
	.size	FSP_IsNewFsAvalible, .-FSP_IsNewFsAvalible
	.align	3
.LC265:
	.xword	.LC7
	.align	3
.LC266:
	.xword	.LC9
	.align	3
.LC267:
	.xword	.LANCHOR0
	.align	3
.LC268:
	.xword	.LC24
	.align	3
.LC269:
	.xword	.LANCHOR1
	.align	3
.LC270:
	.xword	.LC42
	.align	3
.LC271:
	.xword	s_pstVfmwChan
	.align	3
.LC272:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetQueSwitchFlag
	.type	FSP_GetQueSwitchFlag, %function
FSP_GetQueSwitchFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L716
	ldr	x0, .LC275
	lsl	x1, x19, 8
	add	x19, x1, x19, lsl 3
	add	x0, x0, 256
	ldrb	w0, [x0, x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L716:
	ldr	x3, .LC273
	mov	w2, 2267
	ldr	x1, .LC274
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 255
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_GetQueSwitchFlag, .-FSP_GetQueSwitchFlag
	.align	3
.LC273:
	.xword	.LC7
	.align	3
.LC274:
	.xword	.LC9
	.align	3
.LC275:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_SetQueSwitchFlag
	.type	FSP_SetQueSwitchFlag, %function
FSP_SetQueSwitchFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L720
	ldr	x0, .LC279
	lsl	x2, x19, 8
	add	x19, x2, x19, lsl 3
	mov	w1, 1
	add	x0, x0, 256
	strb	w1, [x0, x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L720:
	ldr	x3, .LC277
	mov	w2, 2277
	ldr	x1, .LC278
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FSP_SetQueSwitchFlag, .-FSP_SetQueSwitchFlag
	.align	3
.LC277:
	.xword	.LC7
	.align	3
.LC278:
	.xword	.LC9
	.align	3
.LC279:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_IsFsInVO
	.type	FSP_IsFsInVO, %function
FSP_IsFsInVO:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x2, .LC281
	sxtw	x4, w20
	ldr	x1, [x2, w20, sxtw 3]
	cbz	x1, .L728
	lsl	x0, x4, 8
	add	x3, x2, 256
	add	x0, x0, x4, lsl 3
	add	x0, x3, x0
	ldrsh	w5, [x0, 2]
	cmn	w5, #1
	beq	.L728
	ldrh	w2, [x0, 4]
	cmp	w2, w5
	beq	.L728
	ldr	w1, [x1, 4]
	mov	w0, 0
	cmp	w1, 1
	beq	.L735
.L722:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L725:
	add	x0, x3, x0, lsl 2
	ldr	w0, [x0, 8]
	cmp	w0, w19
	beq	.L732
.L724:
	add	w2, w2, 1
	and	w2, w2, 63
	cmp	w5, w2
	add	x0, x4, x2, sxtw
	bne	.L725
.L728:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L735:
	and	w2, w2, 63
	cmp	w5, w2
	beq	.L722
	lsl	x0, x4, 6
	add	x4, x0, x4, lsl 1
	add	x0, x4, x2, sxtw
	add	x0, x3, x0, lsl 2
	ldr	w0, [x0, 8]
	cmp	w19, w0
	bne	.L724
	mov	w0, w1
	b	.L722
	.p2align 3
.L732:
	mov	w0, 1
	b	.L722
	.size	FSP_IsFsInVO, .-FSP_IsFsInVO
	.align	3
.LC281:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_ProcFspQue
	.type	FSP_ProcFspQue, %function
FSP_ProcFspQue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	cbz	x19, .L755
	cmp	w21, 1
	bhi	.L756
	sxtw	x10, w20
	beq	.L757
	ldr	x11, .LC288
	lsl	x9, x10, 8
	add	x9, x9, x10, lsl 3
	add	x5, x11, 256
	add	x9, x5, x9
	ldrh	w7, [x9, 4]
	ldrh	w1, [x9, 6]
	and	w3, w7, 63
	cmp	w3, w1
	beq	.L741
	lsl	x4, x10, 6
	add	x4, x4, x10, lsl 1
	.p2align 2
.L746:
	uxtw	x0, w3
	ldr	w6, [x19, 28]
	add	x2, x4, x0
	add	x2, x5, x2, lsl 2
	ldr	w2, [x2, 8]
	cmp	w6, w2
	beq	.L747
	mov	w8, w3
	cbnz	w2, .L743
	mov	w12, 2
.L742:
	mov	w8, w7
	.p2align 2
.L745:
	cmp	w3, wzr
	sub	w6, w3, #1
	mov	w2, 63
	add	x0, x4, x0
	csel	w2, w6, w2, ne
	cmp	w3, w7
	add	x6, x5, x0, lsl 2
	mov	w3, w2
	uxtw	x0, w2
	add	x2, x4, x0
	add	x2, x5, x2, lsl 2
	ldr	w2, [x2, 8]
	str	w2, [x6, 8]
	bne	.L745
	add	w7, w7, 1
	cmp	w12, 1
	and	w7, w7, 63
	strh	w7, [x9, 4]
	beq	.L741
.L743:
	add	w3, w8, 1
	and	w3, w3, 63
	cmp	w3, w1
	bne	.L746
.L741:
	lsl	x0, x10, 8
	add	x11, x11, 256
	add	x10, x0, x10, lsl 3
	add	x0, x11, x10
	ldrsh	w1, [x0, 2]
	cmp	w7, w1
	bne	.L736
	mov	w1, -1
	strb	wzr, [x11, x10]
	strh	w1, [x0, 2]
.L736:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L747:
	mov	w12, 1
	b	.L742
	.p2align 3
.L756:
	ldr	x3, .LC287
	mov	w2, 2338
	ldr	x1, .LC285
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L757:
	ldr	x0, .LC288
	lsl	x1, x10, 8
	add	x1, x1, x10, lsl 3
	lsl	x3, x10, 6
	add	x2, x0, 256
	add	x10, x3, x10, lsl 1
	add	x1, x2, x1
	ldr	w4, [x19, 28]
	ldrh	w0, [x1, 6]
	add	w3, w0, 1
	add	x10, x10, x0, sxtw
	and	w0, w3, 63
	strh	w0, [x1, 6]
	add	x0, x2, x10, lsl 2
	str	w4, [x0, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L755:
	ldr	x3, .LC284
	mov	w2, 2337
	ldr	x1, .LC285
	mov	w0, 0
	bl	dprint_vfmw
	b	.L736
	.size	FSP_ProcFspQue, .-FSP_ProcFspQue
	.align	3
.LC284:
	.xword	.LC283
	.align	3
.LC285:
	.xword	.LC9
	.align	3
.LC287:
	.xword	.LC286
	.align	3
.LC288:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC290
	ldr	x5, [x0, w19, sxtw 3]
	add	x1, x5, 20480
	ldrsb	w0, [x1, 1897]
	cbz	w0, .L761
	add	x1, x1, 1177
	mov	w0, 30
	b	.L760
	.p2align 3
.L767:
	sub	w0, w0, #1
	cmn	w0, #1
	beq	.L766
.L760:
	ldrsb	w2, [x1]
	sub	x1, x1, #720
	cbnz	w2, .L767
.L759:
	sxtw	x4, w0
	add	x2, x4, 1
	lsl	x1, x4, 2
	lsl	x3, x2, 2
	sub	x4, x1, x4
	sub	x2, x3, x2
	lsl	x1, x4, 4
	lsl	x3, x2, 4
	sub	x1, x1, x4
	sub	x2, x3, x2
	add	x1, x5, x1, lsl 4
	add	x2, x5, x2, lsl 4
	str	xzr, [x2, 16]
	str	xzr, [x1, 744]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L766:
	mov	w0, 0
	b	.L759
.L761:
	mov	w0, 31
	b	.L759
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	3
.LC290:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetFspType
	.type	FSP_GetFspType, %function
FSP_GetFspType:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L772
	ldr	x0, .LC293
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L773
	ldr	w0, [x0, 4]
	cmp	w0, 1
	csetm	w0, ne
.L770:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L772:
	ldr	x3, .LC291
	mov	w2, 2446
	ldr	x1, .LC292
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L770
.L773:
	ldr	x3, .LC294
	mov	w2, 2447
	ldr	x1, .LC292
	bl	dprint_vfmw
	mov	w0, -1
	b	.L770
	.size	FSP_GetFspType, .-FSP_GetFspType
	.align	3
.LC291:
	.xword	.LC7
	.align	3
.LC292:
	.xword	.LC9
	.align	3
.LC293:
	.xword	.LANCHOR0
	.align	3
.LC294:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FSP_GetTotalValidFsNum
	.type	FSP_GetTotalValidFsNum, %function
FSP_GetTotalValidFsNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L778
	ldr	x0, .LC297
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L779
	ldrsb	w0, [x0, 9]
.L776:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L778:
	ldr	x3, .LC295
	mov	w2, 2464
	ldr	x1, .LC296
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
.L779:
	ldr	x3, .LC298
	mov	w2, 2465
	ldr	x1, .LC296
	bl	dprint_vfmw
	mov	w0, -1
	b	.L776
	.size	FSP_GetTotalValidFsNum, .-FSP_GetTotalValidFsNum
	.align	3
.LC295:
	.xword	.LC7
	.align	3
.LC296:
	.xword	.LC9
	.align	3
.LC297:
	.xword	.LANCHOR0
	.align	3
.LC298:
	.xword	.LC24
	.global	s_FspVoQue
	.global	s_pFspInst
	.section	.rodata
	.align	3
.LANCHOR2 = . + 0
	.type	__func__.12010, %object
	.size	__func__.12010, 15
__func__.12010:
	.string	"FSP_NewLogicFs"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC7:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC9:
	ASCII(.string	"fsp.c,L%d: %s\n" )
	.zero	1
.LC12:
	ASCII(.string	"fsp instance not in used" )
	.zero	7
.LC14:
	ASCII(.string	"pFspInst = NULL" )
.LC24:
	ASCII(.string	"fsp is not inited" )
	.zero	6
.LC42:
	ASCII(.string	"%s : AllocFrame func null\n" )
	.zero	5
.LC44:
	ASCII(.string	"%s : RleaseFrame func null\n" )
	.zero	4
.LC57:
	ASCII(.string	"pstFspInstCfg = NULL" )
	.zero	3
.LC60:
	ASCII(.string	"This inst is not active" )
.LC67:
	ASCII(.string	"eChanCapLevel = %d is not expected!\n" )
	.zero	3
.LC69:
	ASCII(.string	"decode channel CapLevel is %d(w=%d,h=%d), this stream (w=%d,h=%d) can NOT be decoded!\n" )
	.zero	1
.LC80:
	ASCII(.string	"user set decode channel max resolution is (w=%d,h=%d), this stream (w=%d,h=%d) can NOT be decoded!\n" )
	.zero	4
.LC84:
	ASCII(.string	"DFS, Wrong Partition State. State: 0x%x\n" )
	.zero	7
.LC86:
	ASCII(.string	"DFS, Mem Element Fill Successed! Ready to Decode!\n" )
	.zero	5
.LC88:
	ASCII(.string	"Fsp arrange failed, return %d\n" )
	.zero	1
.LC90:
	ASCII(.string	"arrange ret %d, min = %d, actual = %d\n" )
	.zero	1
.LC95:
	ASCII(.string	"PhyAddr is NULL\n" )
	.zero	7
.LC97:
	ASCII(.string	"pFsNum is NULL\n" )
.LC108:
	ASCII(.string	"FSP_IsFsLeak: fsp is not inited \n" )
	.zero	6
.LC118:
	ASCII(.string	"no logic frame store!!!\n" )
	.zero	7
.LC121:
	ASCII(.string	"%s no decode phy fs\n" )
	.zero	3
.LC123:
	ASCII(.string	"no pmv memory\n" )
	.zero	1
.LC127:
	ASCII(.string	"FSP_AllocFrame failed\n" )
	.zero	1
.LC129:
	ASCII(.string	"invalid stFrameInfo PhyAddr\n" )
	.zero	3
.LC140:
	ASCII(.string	"LogicFrameID out of range" )
	.zero	6
.LC151:
	ASCII(.string	"fsp.c, line %d: pstLogicFs->PmvIdc out of range(=%d)\n" )
	.zero	2
.LC153:
	ASCII(.string	"FSP_GetRef: InstID out of range" )
.LC156:
	ASCII(.string	"FSP_GetRef: LogicFrameID out of range" )
	.zero	2
.LC159:
	ASCII(.string	"FSP_GetRef: Fsp is not inited" )
	.zero	2
.LC169:
	ASCII(.string	"FSP_SetDisplay: LogicTick=%d, DispTick=%d!\n" )
	.zero	4
.LC173:
	ASCII(.string	"pstVoQue is NULL" )
	.zero	7
.LC196:
	ASCII(.string	"DecFsAddrTab is NULL\n" )
	.zero	2
.LC198:
	ASCII(.string	"DecFsNum is NULL\n" )
	.zero	6
.LC204:
	ASCII(.string	"PmvAddrTab is NULL\n" )
	.zero	4
.LC206:
	ASCII(.string	"PmvNum is NULL\n" )
.LC222:
	ASCII(.string	"FSP CONTEXT:\n" )
	.zero	2
.LC224:
	ASCII(.string	"FspInstState" )
	.zero	3
.LC226:
	ASCII(.string	"%-35s :%d\n" )
	.zero	5
.LC228:
	ASCII(.string	"DecFsWidth" )
	.zero	5
.LC230:
	ASCII(.string	"DecFsHeight" )
	.zero	4
.LC232:
	ASCII(.string	"DispFsWidth" )
	.zero	4
.LC234:
	ASCII(.string	"DispFsHeight" )
	.zero	3
.LC236:
	ASCII(.string	"ExpectedDecFsNum" )
	.zero	7
.LC238:
	ASCII(.string	"ExpectedDispFsNum" )
	.zero	6
.LC240:
	ASCII(.string	"ExpectedPmvNum" )
	.zero	1
.LC242:
	ASCII(.string	"DecFsNum" )
	.zero	7
.LC244:
	ASCII(.string	"DispFsNum" )
	.zero	6
.LC246:
	ASCII(.string	"PmvNum" )
	.zero	1
.LC248:
	ASCII(.string	"logic fs: %d\n" )
	.zero	2
.LC250:
	ASCII(.string	"\n" )
	.zero	6
.LC252:
	ASCII(.string	"%d%d " )
	.zero	2
.LC254:
	ASCII(.string	"\ndec fs: %d\n" )
	.zero	3
.LC256:
	ASCII(.string	"\ndisp fs: %d\n" )
	.zero	2
.LC258:
	ASCII(.string	"\npmv: %d\n" )
	.zero	6
.LC260:
	ASCII(.string	"\n\n" )
	.zero	5
.LC262:
	ASCII(.string	"%d " )
	.zero	4
.LC283:
	ASCII(.string	"p_image NULL" )
	.zero	3
.LC286:
	ASCII(.string	"Flag Invalid" )
	.bss
	.align	3
.LANCHOR0 = . + 0
.LANCHOR1 = . + 8704
	.type	s_pFspInst, %object
	.size	s_pFspInst, 256
s_pFspInst:
	.zero	256
	.type	s_FspVoQue, %object
	.size	s_FspVoQue, 8448
s_FspVoQue:
	.zero	8448
	.type	g_IsFrameIntfValid, %object
	.size	g_IsFrameIntfValid, 4
g_IsFrameIntfValid:
	.zero	4
	.zero	4
	.type	g_FspFrameIntf, %object
	.size	g_FspFrameIntf, 32
g_FspFrameIntf:
	.zero	32
	.type	MemArrange.11882, %object
	.size	MemArrange.11882, 1368
MemArrange.11882:
	.zero	1368
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
