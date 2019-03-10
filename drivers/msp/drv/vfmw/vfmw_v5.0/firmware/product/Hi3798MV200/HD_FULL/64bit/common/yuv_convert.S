#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"yuv_convert.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	IMAGE_TileTo2D
	.type	IMAGE_TileTo2D, %function
IMAGE_TileTo2D:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	mov	w19, w1
	mov	x28, x3
	str	w2, [x29, 140]
	bl	_mcount
	add	w0, w19, 255
	ldr	w1, [x27, 40]
	and	w0, w0, 65280
	lsl	w0, w0, 2
	cmp	w1, 1
	str	w0, [x29, 136]
	ldr	w0, [x29, 140]
	beq	.L59
	cbz	w0, .L4
	uxtw	x0, w19
	mov	w24, 0
	str	x0, [x29, 144]
	mov	w21, 0
	lsr	w0, w19, 2
	ldr	x26, .LC0
	str	wzr, [x29, 156]
	str	w0, [x29, 152]
	b	.L6
	.p2align 3
.L8:
	ldr	w1, [x27, 44]
	ldp	w6, w3, [x29, 152]
	lsr	w1, w1, 4
	ldr	x5, [x27]
	ldr	x0, [x28]
	add	w3, w3, w6
	mul	w1, w1, w21
	ldr	x4, [x26, 104]
	add	x0, x0, x24, uxtw
	ldr	x2, [x29, 144]
	add	x1, x5, x1
	str	w3, [x29, 156]
	add	w21, w21, 1
	add	w24, w24, w19
	blr	x4
	ldr	w0, [x29, 140]
	cmp	w0, w21
	beq	.L60
.L6:
	ldr	w0, [x27, 32]
	cmp	w0, 10
	bne	.L8
	cbz	w19, .L8
	ldr	w0, [x29, 136]
	lsr	w20, w21, 4
	ldr	w23, [x29, 156]
	mov	w25, 0
	and	x22, x21, 15
	mul	w20, w20, w0
	.p2align 2
.L9:
	lsr	w4, w25, 6
	ldr	x3, .LC1
	ubfiz	x8, x4, 4, 2
	ubfx	x0, x25, 2, 30
	add	x8, x8, x22
	ldr	x1, [x27, 8]
	ldr	x10, [x28, 8]
	add	x0, x0, x23
	ldr	x9, [x26, 104]
	mov	x2, 16
	ldr	w8, [x3, x8, lsl 2]
	add	x0, x10, x0
	add	w25, w25, 64
	add	w4, w8, w4, lsl 4
	ubfiz	x4, x4, 4, 26
	add	x4, x4, x20
	add	x1, x1, x4
	blr	x9
	cmp	w19, w25
	bhi	.L9
	b	.L8
	.p2align 3
.L60:
	ldr	w3, [x29, 140]
	ldp	x1, x0, [x28]
	lsr	w2, w3, 1
	str	w2, [x29, 140]
	add	x1, x1, 9437184
	add	x0, x0, 9437184
	stp	x1, x0, [x28, 16]
	cbz	w2, .L1
	ldr	w1, [x29, 136]
	mov	w24, 0
	mov	w21, 0
	str	wzr, [x29, 156]
	lsr	w0, w1, 1
	str	w0, [x29, 128]
	b	.L12
	.p2align 3
.L13:
	ldr	w1, [x27, 44]
	ldp	w6, w3, [x29, 152]
	lsr	w1, w1, 4
	ldr	x5, [x27, 16]
	ldr	x0, [x28, 16]
	add	w3, w3, w6
	mul	w1, w1, w21
	ldr	x4, [x26, 104]
	add	x0, x0, x24, uxtw
	ldr	x2, [x29, 144]
	add	x1, x5, x1
	str	w3, [x29, 156]
	add	w21, w21, 1
	add	w24, w24, w19
	blr	x4
	ldr	w0, [x29, 140]
	cmp	w21, w0
	beq	.L1
.L12:
	ldr	w0, [x27, 32]
	cmp	w0, 10
	bne	.L13
	cbz	w19, .L13
	ldr	w0, [x29, 128]
	lsr	w20, w21, 3
	ldr	w23, [x29, 156]
	mov	w25, 0
	and	x22, x21, 7
	mul	w20, w20, w0
	.p2align 2
.L14:
	ldr	x0, .LC1
	lsr	w4, w25, 6
	ldr	x9, [x27, 24]
	mov	x2, 16
	add	x1, x0, 256
	ldr	x10, [x28, 24]
	ubfx	x0, x25, 2, 30
	ldr	x8, [x26, 104]
	add	x0, x0, x23
	add	w25, w25, 64
	ldr	w1, [x1, x22, lsl 2]
	add	x0, x10, x0
	add	w1, w1, w4, lsl 3
	ubfiz	x1, x1, 4, 26
	add	x1, x1, x20
	add	x1, x9, x1
	blr	x8
	cmp	w19, w25
	bhi	.L14
	b	.L13
.L4:
	ldp	x1, x0, [x28]
	add	x1, x1, 9437184
	add	x0, x0, 9437184
	stp	x1, x0, [x28, 16]
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L59:
	cbz	w0, .L4
	ldr	w0, [x27, 44]
	ldr	x26, .LC0
	ldr	x22, .LC1
	str	w0, [x29, 96]
	lsr	w0, w19, 2
	str	wzr, [x29, 144]
	stp	wzr, wzr, [x29, 152]
	str	w0, [x29, 100]
	.p2align 2
.L18:
	cbz	w19, .L20
	ldp	w24, w1, [x29, 152]
	ldr	w0, [x29, 144]
	mov	w25, 0
	str	x0, [x29, 112]
	lsr	w20, w1, 4
	ldr	w0, [x29, 136]
	and	x21, x1, 15
	ldr	w2, [x29, 96]
	mul	w0, w0, w20
	mul	w23, w2, w20
	str	x0, [x29, 104]
	ubfiz	x20, x20, 2, 1
	b	.L17
	.p2align 3
.L16:
	uxtw	x4, w0
	add	x10, x22, 288
	add	x4, x20, x4
	ldr	x1, [x27]
	ldr	x11, [x28]
	ubfiz	x5, x5, 10, 22
	add	x4, x21, x4, lsl 4
	add	x0, x24, x25, uxtw
	ldr	x9, [x26, 104]
	mov	x2, 64
	add	x0, x11, x0
	add	w25, w25, 64
	ldr	w4, [x10, x4, lsl 2]
	ubfiz	x4, x4, 6, 26
	add	x4, x4, x23
	add	x5, x4, x5
	add	x1, x1, x5
	blr	x9
	cmp	w19, w25
	bls	.L20
.L17:
	ldr	w1, [x27, 32]
	lsr	w5, w25, 6
	and	w0, w5, 3
	cmp	w1, 10
	bne	.L16
	mov	w4, w0
	ldr	x1, [x28, 8]
	ubfiz	x9, x4, 4, 2
	ubfx	x0, x25, 2, 30
	ldp	x3, x2, [x29, 104]
	add	x9, x9, x21
	ldr	x11, [x27, 8]
	add	x0, x0, x2
	ldr	x10, [x26, 104]
	add	x0, x1, x0
	mov	x2, 16
	ldr	w1, [x22, x9, lsl 2]
	str	w4, [x29, 120]
	add	w1, w1, w5, lsl 4
	str	w5, [x29, 128]
	ubfiz	x1, x1, 4, 26
	add	x1, x1, x3
	add	x1, x11, x1
	blr	x10
	ldr	w4, [x29, 120]
	ldr	w5, [x29, 128]
	mov	w0, w4
	b	.L16
	.p2align 3
.L20:
	ldp	w1, w0, [x29, 152]
	add	w1, w1, w19
	add	w0, w0, 1
	stp	w1, w0, [x29, 152]
	ldr	w1, [x29, 140]
	cmp	w1, w0
	ldr	w0, [x29, 144]
	ldr	w1, [x29, 100]
	add	w0, w0, w1
	str	w0, [x29, 144]
	bne	.L18
	ldp	x1, x0, [x28]
	ldr	w3, [x29, 140]
	add	x1, x1, 9437184
	add	x0, x0, 9437184
	lsr	w2, w3, 1
	str	w2, [x29, 112]
	stp	x1, x0, [x28, 16]
	cbz	w2, .L1
	ldr	w1, [x29, 96]
	ldr	x26, .LC0
	lsr	w0, w1, 1
	ldr	w1, [x29, 136]
	ldr	x22, .LC1
	str	w0, [x29, 96]
	lsr	w0, w1, 1
	str	wzr, [x29, 144]
	stp	wzr, wzr, [x29, 152]
	str	w0, [x29, 104]
	.p2align 2
.L25:
	cbz	w19, .L26
	ldp	w24, w1, [x29, 152]
	ldr	w0, [x29, 144]
	mov	w25, 0
	str	x0, [x29, 128]
	lsr	w20, w1, 3
	ldr	w0, [x29, 104]
	and	x21, x1, 7
	ldr	w2, [x29, 96]
	mul	w0, w0, w20
	mul	w23, w20, w2
	str	x0, [x29, 120]
	ubfiz	x20, x20, 2, 1
	b	.L24
	.p2align 3
.L23:
	and	x5, x4, 3
	add	x10, x22, 800
	add	x5, x20, x5
	ldr	x1, [x27, 16]
	ldr	x11, [x28, 16]
	ubfiz	x4, x4, 9, 23
	add	x5, x21, x5, lsl 3
	add	x0, x24, x25, uxtw
	ldr	x8, [x26, 104]
	mov	x2, 64
	add	x0, x11, x0
	add	w25, w25, 64
	ldr	w5, [x10, x5, lsl 2]
	ubfiz	x5, x5, 6, 26
	add	x5, x5, x23
	add	x4, x5, x4
	add	x1, x1, x4
	blr	x8
	cmp	w19, w25
	bls	.L26
.L24:
	ldr	w0, [x27, 32]
	lsr	w4, w25, 6
	cmp	w0, 10
	bne	.L23
	add	x1, x22, 256
	ldr	x8, [x27, 24]
	ldp	x3, x2, [x29, 120]
	ldr	x10, [x28, 24]
	ubfx	x0, x25, 2, 30
	ldr	w1, [x1, x21, lsl 2]
	add	x0, x0, x2
	ldr	x5, [x26, 104]
	mov	x2, 16
	add	w1, w1, w4, lsl 3
	add	x0, x10, x0
	ubfiz	x1, x1, 4, 26
	str	w4, [x29, 140]
	add	x1, x1, x3
	add	x1, x8, x1
	blr	x5
	ldr	w4, [x29, 140]
	b	.L23
	.p2align 3
.L26:
	ldp	w1, w0, [x29, 152]
	add	w1, w1, w19
	add	w0, w0, 1
	stp	w1, w0, [x29, 152]
	ldr	w1, [x29, 112]
	cmp	w0, w1
	ldr	w0, [x29, 144]
	ldr	w1, [x29, 100]
	add	w0, w0, w1
	str	w0, [x29, 144]
	bne	.L25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
	.size	IMAGE_TileTo2D, .-IMAGE_TileTo2D
	.align	3
.LC0:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC1:
	.xword	.LANCHOR0
	.global	g_RowMapTable_UV_2b
	.global	g_RowMapTable_Y_2b
	.global	g_RowMapTable_UV
	.global	g_RowMapTable_Y
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	g_RowMapTable_Y_2b, %object
	.size	g_RowMapTable_Y_2b, 256
g_RowMapTable_Y_2b:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.type	g_RowMapTable_UV_2b, %object
	.size	g_RowMapTable_UV_2b, 32
g_RowMapTable_UV_2b:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.type	g_RowMapTable_Y, %object
	.size	g_RowMapTable_Y, 512
g_RowMapTable_Y:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	8
	.word	9
	.word	10
	.word	11
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.type	g_RowMapTable_UV, %object
	.size	g_RowMapTable_UV, 256
g_RowMapTable_UV:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	4
	.word	5
	.word	6
	.word	7
	.word	0
	.word	1
	.word	2
	.word	3
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
