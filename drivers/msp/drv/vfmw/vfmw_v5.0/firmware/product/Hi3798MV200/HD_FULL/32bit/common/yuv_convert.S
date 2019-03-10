#include "hi_asm_define.h"
	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"yuv_convert.c"
	.text
	.align	2
	.global	IMAGE_TileTo2D
	.type	IMAGE_TileTo2D, %function
IMAGE_TileTo2D:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	mov	r6, r1
	add	r1, r1, #255
	mov	r5, r0
	and	r1, r1, #65280
	ldr	r0, [r0, #24]
	mov	r7, r3
	str	r2, [fp, #-64]
	mov	r3, r1, asl #2
	str	r3, [fp, #-80]
	ldr	r3, [r5, #28]
	cmp	r0, #1
	str	r3, [fp, #-88]
	beq	.L61
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L3
	mov	r4, #0
	mov	r3, r6, lsr #2
	str	r3, [fp, #-60]
	mov	r3, r7
	ldr	r10, .L65
	mov	r7, r5
	str	r4, [fp, #-52]
	mov	r8, r4
	mov	r5, r3
	b	.L6
.L8:
	ldr	r1, [r7, #28]
	mov	r2, r6
	ldr	lr, [r7]
	ldr	ip, [fp, #-52]
	ldr	r3, [fp, #-60]
	mov	r1, r1, lsr #4
	ldr	r0, [r5]
	mla	r1, r1, r8, lr
	add	r0, r0, ip
	add	r4, r4, r3
	ldr	r3, [r10, #52]
	add	ip, ip, r6
	str	ip, [fp, #-52]
	blx	r3
	ldr	r3, [fp, #-64]
	add	r8, r8, #1
	cmp	r8, r3
	beq	.L62
.L6:
	ldr	r2, [r7, #16]
	cmp	r2, #10
	bne	.L8
	cmp	r6, #0
	beq	.L8
	and	r2, r8, #15
	str	r2, [fp, #-48]
	ldr	r2, [fp, #-80]
	mov	r3, r8, lsr #4
	str	r8, [fp, #-56]
	mov	r9, #0
	mov	r8, r7
	mov	r7, r6
	mul	r3, r2, r3
	mov	r6, r3
.L9:
	mov	lr, r9, lsr #6
	ldr	r3, [fp, #-48]
	and	r2, lr, #3
	ldr	r0, [r5, #4]
	add	r1, r4, r9, lsr #2
	add	r9, r9, #64
	add	r2, r3, r2, lsl #4
	ldr	r3, .L65+4
	add	r0, r0, r1
	ldr	r1, [r3, r2, asl #2]
	mov	r2, #16
	ldr	r3, [r8, #4]
	add	r1, r1, lr, lsl #4
	mov	r1, r1, asl #6
	add	r1, r6, r1, lsr #2
	add	r1, r3, r1
	ldr	r3, [r10, #52]
	blx	r3
	cmp	r7, r9
	bhi	.L9
	mov	r6, r7
	mov	r7, r8
	ldr	r8, [fp, #-56]
	b	.L8
.L62:
	mov	r3, r5
	mov	r5, r7
	mov	r7, r3
	movs	r3, r8, lsr #1
	ldmia	r7, {r1, r2}
	str	r3, [fp, #-64]
	add	r1, r1, #9437184
	add	r2, r2, #9437184
	str	r1, [r7, #8]
	str	r2, [r7, #12]
	beq	.L1
	ldr	r3, [fp, #-80]
	mov	r4, #0
	str	r4, [fp, #-56]
	str	r4, [fp, #-52]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-68]
	b	.L12
.L13:
	ldr	ip, [fp, #-56]
	mov	r2, r6
	ldr	r1, [r5, #28]
	ldr	r0, [r7, #8]
	ldr	lr, [r5, #8]
	add	r0, r0, ip
	add	ip, ip, r6
	str	ip, [fp, #-56]
	mov	r1, r1, lsr #4
	ldr	ip, [fp, #-52]
	ldr	r3, [fp, #-60]
	mla	r1, r1, ip, lr
	add	ip, ip, #1
	add	r4, r4, r3
	ldr	r3, [r10, #52]
	mov	r8, ip
	str	ip, [fp, #-52]
	blx	r3
	ldr	r3, [fp, #-64]
	cmp	r8, r3
	beq	.L1
.L12:
	ldr	r3, [r5, #16]
	cmp	r3, #10
	bne	.L13
	cmp	r6, #0
	beq	.L13
	ldr	r3, [fp, #-52]
	mov	r8, #0
	ldr	r1, [fp, #-68]
	mov	r2, r3, lsr #3
	and	r3, r3, #7
	mul	r2, r1, r2
	str	r2, [fp, #-48]
	ldr	r2, .L65+4
	add	r9, r2, r3, lsl #2
.L14:
	ldr	r3, [r9, #256]
	mov	r1, r8, lsr #6
	ldr	ip, [fp, #-48]
	add	r2, r4, r8, lsr #2
	add	r1, r3, r1, lsl #3
	ldr	lr, [r5, #12]
	ldr	r0, [r7, #12]
	add	r8, r8, #64
	mov	r1, r1, asl #6
	ldr	r3, [r10, #52]
	add	r0, r0, r2
	mov	r2, #16
	add	r1, ip, r1, lsr #2
	add	r1, lr, r1
	blx	r3
	cmp	r6, r8
	bhi	.L14
	b	.L13
.L3:
	ldmia	r7, {r1, r2}
	add	r1, r1, #9437184
	add	r2, r2, #9437184
	str	r1, [r7, #8]
	str	r2, [r7, #12]
.L1:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L61:
	cmp	r2, #0
	beq	.L3
	ldr	r8, .L65
	mov	r2, r6, lsr #2
	str	r6, [fp, #-52]
	mov	r6, r7
	mov	r7, r5
	mov	r3, #0
	str	r2, [fp, #-84]
	str	r3, [fp, #-68]
	str	r3, [fp, #-56]
	str	r3, [fp, #-72]
.L4:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [fp, #-72]
	mov	r10, #0
	mov	r2, r3, lsr #4
	and	r3, r3, #15
	str	r3, [fp, #-48]
	and	r5, r2, #1
	ldr	r3, [fp, #-88]
	mov	r5, r5, asl #2
	mul	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-80]
	mul	r3, r3, r2
	str	r3, [fp, #-76]
	mov	r3, r5
	mov	r5, r6
	mov	r6, r7
	mov	r7, r3
	b	.L17
.L16:
	ldr	r3, [fp, #-56]
	add	r4, r7, r4
	ldr	r1, [r6]
	add	r2, r3, r10
	ldr	r3, [fp, #-48]
	ldr	r0, [r5]
	add	r10, r10, #64
	add	r4, r3, r4, lsl #4
	ldr	r3, .L65+4
	add	r0, r0, r2
	mov	r2, #64
	add	r4, r3, r4, lsl #2
	ldr	r3, [fp, #-60]
	ldr	lr, [r4, #288]
	add	lr, r3, lr, lsl #6
	ldr	r3, [r8, #52]
	add	r9, lr, r9, lsl #10
	add	r1, r1, r9
	blx	r3
	ldr	r3, [fp, #-52]
	cmp	r3, r10
	bls	.L63
.L17:
	ldr	r2, [r6, #16]
	mov	r9, r10, lsr #6
	and	r4, r9, #3
	cmp	r2, #10
	bne	.L16
	ldr	r3, [fp, #-68]
	ldr	r2, [r5, #4]
	add	r0, r3, r10, lsr #2
	ldr	r3, [fp, #-48]
	ldr	lr, [r6, #4]
	add	r0, r2, r0
	add	r1, r3, r4, lsl #4
	ldr	r3, .L65+4
	mov	r2, #16
	ldr	r1, [r3, r1, asl #2]
	ldr	r3, [fp, #-76]
	add	r1, r1, r9, lsl #4
	mov	r1, r1, asl #6
	add	r1, r3, r1, lsr #2
	ldr	r3, [r8, #52]
	add	r1, lr, r1
	blx	r3
	b	.L16
.L63:
	mov	r7, r6
	mov	r6, r5
.L19:
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-72]
	add	r2, r2, r1
	str	r2, [fp, #-56]
	ldr	r2, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	cmp	r3, r2
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-84]
	add	r3, r3, r2
	str	r3, [fp, #-68]
	bne	.L4
	ldr	r3, [fp, #-72]
	mov	r5, r7
	mov	r7, r6
	ldr	r6, [fp, #-52]
	ldmia	r7, {r1, r2}
	movs	r3, r3, lsr #1
	str	r3, [fp, #-76]
	add	r1, r1, #9437184
	add	r2, r2, #9437184
	str	r1, [r7, #8]
	str	r2, [r7, #12]
	beq	.L1
	ldr	r2, [fp, #-88]
	mov	r3, #0
	ldr	r9, .L65
	mov	r8, r3
	str	r6, [fp, #-48]
	mov	r6, r7
	mov	r2, r2, lsr #1
	str	r2, [fp, #-88]
	ldr	r2, [fp, #-80]
	mov	r7, r5
	str	r3, [fp, #-60]
	str	r3, [fp, #-64]
	mov	r2, r2, lsr #1
	str	r2, [fp, #-80]
.L20:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L24
	ldr	r3, [fp, #-64]
	mov	r10, #0
	ldr	r1, [fp, #-88]
	mov	r2, r3, lsr #3
	and	r3, r3, #7
	and	r5, r2, #1
	str	r3, [fp, #-52]
	mul	r1, r1, r2
	mov	r5, r5, asl #2
	str	r1, [fp, #-56]
	ldr	r1, [fp, #-80]
	mul	r2, r1, r2
	str	r2, [fp, #-68]
	ldr	r2, .L65+4
	add	r3, r2, r3, lsl #2
	str	r3, [fp, #-72]
	mov	r3, r5
	mov	r5, r7
	mov	r7, r3
	b	.L23
.L22:
	and	lr, r4, #3
	ldr	r3, [fp, #-52]
	add	lr, r7, lr
	ldr	r1, [r5, #8]
	ldr	r0, [r6, #8]
	add	r2, r8, r10
	add	lr, r3, lr, lsl #3
	ldr	r3, .L65+4
	add	r0, r0, r2
	mov	r2, #64
	add	lr, r3, lr, lsl #2
	ldr	r3, [fp, #-56]
	add	r10, r10, #64
	ldr	lr, [lr, #800]
	add	lr, r3, lr, lsl #6
	ldr	r3, [r9, #52]
	add	r4, lr, r4, lsl #9
	add	r1, r1, r4
	blx	r3
	ldr	r3, [fp, #-48]
	cmp	r3, r10
	bls	.L64
.L23:
	ldr	r2, [r5, #16]
	mov	r4, r10, lsr #6
	cmp	r2, #10
	bne	.L22
	ldr	r3, [fp, #-72]
	ldr	r2, [r6, #12]
	ldr	lr, [r5, #12]
	ldr	r1, [r3, #256]
	ldr	r3, [fp, #-60]
	add	r1, r1, r4, lsl #3
	add	r0, r3, r10, lsr #2
	ldr	r3, [fp, #-68]
	mov	r1, r1, asl #6
	add	r0, r2, r0
	mov	r2, #16
	add	r1, r3, r1, lsr #2
	ldr	r3, [r9, #52]
	add	r1, lr, r1
	blx	r3
	b	.L22
.L64:
	mov	r7, r5
.L24:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-64]
	add	r8, r8, r2
	ldr	r2, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-64]
	cmp	r3, r2
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-84]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	bne	.L20
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	IMAGE_TileTo2D, .-IMAGE_TileTo2D
	.global	g_RowMapTable_UV_2b
	.global	g_RowMapTable_Y_2b
	.global	g_RowMapTable_UV
	.global	g_RowMapTable_Y
	.data
	.align	2
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
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
