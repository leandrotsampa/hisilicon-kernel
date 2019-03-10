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
	.file	"vp9.c"
	.global	__aeabi_uidiv
	.text
	.align	2
	.type	Vp9_ModeMvMergeProbs, %function
Vp9_ModeMvMergeProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r0
	ldmia	r1, {r0, r1}
	adds	r3, r0, r1
	beq	.L3
	cmp	r3, #20
	ldr	r2, .L5
	mov	r0, r0, asl #8
	mov	r1, r3
	add	r0, r0, r3, lsr #1
	movcs	r3, #20
	ldrb	r5, [r2, r3]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	rsb	r3, r5, #256
	mul	r4, r4, r3
	add	r3, r4, #128
	cmp	r0, #1
	movlt	r0, #1
	cmp	r0, #255
	movge	r0, #255
	uxtb	r0, r0
	mla	r0, r5, r0, r3
	ubfx	r0, r0, #8, #8
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_ModeMvMergeProbs, .-Vp9_ModeMvMergeProbs
	.align	2
	.global	VP9_u_v_x
	.type	VP9_u_v_x, %function
VP9_u_v_x:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsGet
	UNWIND(.fnend)
	.size	VP9_u_v_x, .-VP9_u_v_x
	.align	2
	.global	VP9_s_v
	.type	VP9_s_v, %function
VP9_s_v:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r1, #1
	bl	BsGet
	tst	r0, #1
	mov	r0, r0, asr #1
	rsbne	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_s_v, .-VP9_s_v
	.align	2
	.global	Vp9_Cabac_ReadIsValid
	.type	Vp9_Cabac_ReadIsValid, %function
Vp9_Cabac_ReadIsValid:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r2, #0
	cmpne	r0, #0
	moveq	r3, #1
	movne	r3, #0
	beq	.L13
	cmp	r1, #0
	ble	.L14
	add	r0, r0, r1
	cmp	r2, r0
	movcc	r0, #0
	movcs	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L13:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L14:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Cabac_ReadIsValid, .-Vp9_Cabac_ReadIsValid
	.align	2
	.global	Vp9_Cabac_ReaderFill
	.type	Vp9_Cabac_ReaderFill, %function
Vp9_Cabac_ReaderFill:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, [r0, #32]
	mov	r7, r0
	ldr	r8, [r0, #28]
	rsb	r6, r5, #24
	rsb	r4, r5, #16
	bic	r6, r6, #7
	rsb	r4, r6, r4
	add	r5, r5, r6
	mov	r1, r6
	and	r4, r4, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r8, r0, asl r4
	str	r0, [r7, #28]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Cabac_ReaderFill, .-Vp9_Cabac_ReaderFill
	.align	2
	.global	Vp9_Cabac_Read
	.type	Vp9_Cabac_Read, %function
Vp9_Cabac_Read:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r0, #36]
	mov	r5, r0
	ldr	r7, [r0, #32]
	sub	r4, r4, #1
	cmp	r7, #0
	mul	r1, r4, r1
	mov	r4, r1, lsr #8
	add	r4, r4, #1
	blt	.L17
	ldr	r3, [r0, #28]
.L18:
	mov	r2, r4, asl #24
	cmp	r2, r3
	rsbls	r3, r2, r3
	ldr	r2, .L21
	ldrls	r1, [r5, #36]
	movls	r0, #1
	movhi	r0, #0
	rsbls	r4, r4, r1
	add	r2, r2, r4
	ldrb	r1, [r2, #24]	@ zero_extendqisi2
	mov	r3, r3, asl r1
	rsb	r7, r1, r7
	mov	r4, r4, asl r1
	str	r3, [r5, #28]
	str	r7, [r5, #32]
	str	r4, [r5, #36]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L17:
	rsb	r1, r7, #24
	rsb	r8, r7, #16
	bic	r1, r1, #7
	ldr	r6, [r0, #28]
	rsb	r8, r1, r8
	add	r7, r7, r1
	bl	BsGet
	and	r3, r8, #7
	orr	r3, r6, r0, asl r3
	b	.L18
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_Cabac_Read, .-Vp9_Cabac_Read
	.align	2
	.global	Vp9_Cabac_ReadLiteral
	.type	Vp9_Cabac_ReadLiteral, %function
Vp9_Cabac_ReadLiteral:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r7, r1, #1
	mov	r6, r0
	bmi	.L28
	ldr	r8, [r0, #28]
	mov	r9, #0
	ldr	r4, [r0, #36]
	mov	r3, #1
	ldr	r5, [r0, #32]
	ldr	r10, .L32
	b	.L27
.L25:
	mov	r2, r4, asl #24
	mov	r1, r3, asl r7
	cmp	r2, r0
	sub	r7, r7, #1
	rsbls	r0, r2, r0
	ldrls	ip, [r6, #36]
	movhi	r1, #0
	orr	r9, r9, r1
	rsbls	r4, r4, ip
	cmn	r7, #1
	add	r2, r10, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L24
.L27:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L25
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	r3, [fp, #-52]
	str	r2, [fp, #-48]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L25
.L28:
	mov	r9, #0
.L24:
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_Cabac_ReadLiteral, .-Vp9_Cabac_ReadLiteral
	.align	2
	.global	Vp9_Cabac_ReaderInit
	.type	Vp9_Cabac_ReaderInit, %function
Vp9_Cabac_ReaderInit:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mvn	r2, #7
	mov	r3, #255
	mov	r5, #0
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	mov	r1, #32
	str	r5, [r0, #28]
	mov	r4, r0
	bl	BsGet
	mov	r2, r0
	ldr	r0, [r4, #36]
	sub	r3, r0, #1
	ubfx	r3, r3, #1, #24
	add	r3, r3, #1
	mov	r1, r3, asl #24
	cmp	r2, r1
	rsbcs	r2, r1, r2
	ldr	r1, .L37
	rsbcs	r3, r3, r0
	movcc	r0, r5
	add	r1, r1, r3
	movcs	r0, #1
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r1
	mov	r3, r3, asl r1
	str	r2, [r4, #28]
	rsb	r1, r1, #24
	str	r3, [r4, #36]
	str	r1, [r4, #32]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_Cabac_ReaderInit, .-Vp9_Cabac_ReaderInit
	.align	2
	.global	Vp9_ReadTxMode
	.type	Vp9_ReadTxMode, %function
Vp9_ReadTxMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r7, #1
	mov	r6, r0
	ldr	r10, .L53
	ldr	r4, [r0, #36]
	mov	r3, r7
	ldr	r5, [r0, #32]
	mov	r9, #0
	ldr	r8, [r0, #28]
	b	.L42
.L40:
	mov	r2, r4, asl #24
	mov	r1, r3, asl r7
	cmp	r2, r0
	sub	r7, r7, #1
	rsbls	r0, r2, r0
	ldrls	ip, [r6, #36]
	movhi	r1, #0
	orr	r9, r9, r1
	rsbls	r4, r4, ip
	cmn	r7, #1
	add	r2, r10, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L50
.L42:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L40
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	r3, [fp, #-52]
	str	r2, [fp, #-48]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L40
.L50:
	cmp	r9, #3
	beq	.L51
	mov	r0, r9
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L51:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	add	r4, r4, #1
	movge	r0, r8
	blt	.L52
.L44:
	mov	r3, r4, asl #24
	cmp	r3, r0
	rsbls	r0, r3, r0
	ldrls	r2, [r6, #36]
	movls	r9, #4
	rsbls	r4, r4, r2
	add	r10, r10, r4
	ldrb	r3, [r10, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	mov	r0, r9
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L52:
	rsb	r1, r5, #24
	rsb	r7, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r7, r1, r7
	add	r5, r1, r5
	bl	BsGet
	and	r7, r7, #7
	orr	r0, r8, r0, asl r7
	b	.L44
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_ReadTxMode, .-Vp9_ReadTxMode
	.align	2
	.global	Vp9_ReaderHasError
	.type	Vp9_ReaderHasError, %function
Vp9_ReaderHasError:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r0, #32]
	sub	r0, r0, #33
	cmn	r0, #-1073741790
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_ReaderHasError, .-Vp9_ReaderHasError
	.align	2
	.global	Vp9_DiffUpdateProb
	.type	Vp9_DiffUpdateProb, %function
Vp9_DiffUpdateProb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r4, [r0, #36]
	ldr	r5, [r0, #32]
	mov	r6, r0
	sub	r4, r4, #1
	mov	r9, r1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	add	r4, r4, #1
	blt	.L57
	ldr	r8, [r0, #28]
.L58:
	mov	r3, r4, asl #24
	cmp	r3, r8
	bhi	.L59
	ldr	r2, [r6, #36]
	rsb	r8, r3, r8
	ldr	r3, .L112
	rsb	r4, r4, r2
	add	r2, r3, r4
	ldrb	r1, [r2, #24]	@ zero_extendqisi2
	mov	r2, r4, asl r1
	rsb	r4, r1, r5
	cmp	r4, #0
	sub	r5, r2, #1
	ubfx	r5, r5, #1, #24
	mov	r8, r8, asl r1
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r8, [r6, #28]
	blt	.L106
.L61:
	mov	r1, r5, asl #24
	cmp	r1, r8
	bhi	.L66
	ldr	r2, [r6, #36]
	rsb	r8, r1, r8
	rsb	r5, r5, r2
	add	r2, r3, r5
	ldrb	ip, [r2, #24]	@ zero_extendqisi2
	mov	r2, r5, asl ip
	rsb	r5, ip, r4
	sub	r1, r2, #1
	cmp	r5, #0
	ubfx	r1, r1, #1, #24
	mov	r8, r8, asl ip
	str	r2, [r6, #36]
	add	r4, r1, #1
	str	r5, [r6, #32]
	str	r8, [r6, #28]
	blt	.L107
.L68:
	mov	r1, r4, asl #24
	cmp	r1, r8
	bhi	.L72
	ldr	r2, [r6, #36]
	rsb	r8, r1, r8
	mov	r7, #0
	mov	r10, #6
	rsb	r1, r4, r2
	mov	r2, #1
	add	r0, r3, r1
	ldrb	r4, [r0, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r4
	rsb	r5, r4, r5
	str	r8, [r6, #28]
	mov	r4, r1, asl r4
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	b	.L73
.L77:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r10
	cmp	r1, r0
	sub	r10, r10, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r10, #1
	add	r1, r3, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L108
.L73:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L77
	rsb	r1, r5, #24
	rsb	ip, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	add	r5, r1, r5
	str	ip, [fp, #-48]
	bl	BsGet
	ldr	ip, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	ip, ip, #7
	ldr	r2, [fp, #-56]
	orr	r0, r8, r0, asl ip
	b	.L77
.L66:
	add	r1, r3, r5
	mov	r7, #0
	mov	r10, #3
	mov	r2, #1
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r1
	rsb	r4, r1, r4
	mov	r5, r5, asl r1
	str	r8, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	b	.L71
.L69:
	mov	r1, r5, asl #24
	mov	ip, r2, asl r10
	cmp	r1, r0
	sub	r10, r10, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r5, r5, lr
	cmn	r10, #1
	add	r1, r3, r5
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r1
	rsb	r4, r1, r4
	mov	r5, r5, asl r1
	str	r8, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L109
.L71:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r8
	add	r5, r5, #1
	bge	.L69
	rsb	r1, r4, #24
	rsb	ip, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	add	r4, r1, r4
	str	ip, [fp, #-48]
	bl	BsGet
	ldr	ip, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	ip, ip, #7
	ldr	r2, [fp, #-56]
	orr	r0, r8, r0, asl ip
	b	.L69
.L59:
	ldr	r3, .L112
	mov	r7, #0
	mov	r10, #3
	mov	r2, #1
	add	r1, r3, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	b	.L64
.L62:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r10
	cmp	r1, r0
	sub	r10, r10, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r10, #1
	add	r1, r3, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L65
.L64:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L62
	rsb	r1, r5, #24
	rsb	ip, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	add	r5, r1, r5
	str	ip, [fp, #-48]
	bl	BsGet
	ldr	ip, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	ip, ip, #7
	ldr	r2, [fp, #-56]
	orr	r0, r8, r0, asl ip
	b	.L62
.L108:
	cmp	r7, #64
	ble	.L79
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r7, r7, asl #1
	add	r4, r4, #1
	sub	r7, r7, #65
	movge	r0, r8
	blt	.L110
.L80:
	mov	r2, r4, asl #24
	cmp	r2, r0
	rsbls	r0, r2, r0
	ldrls	ip, [r6, #36]
	movls	r1, #1
	movhi	r1, #0
	add	r7, r7, r1
	rsbls	r4, r4, ip
	add	r2, r3, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
.L79:
	add	r7, r7, #64
.L65:
	ldrb	r2, [r9]	@ zero_extendqisi2
	add	r3, r3, r7
	sub	ip, r2, #1
	ldrb	r1, [r3, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L82
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L83
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L83:
	add	r3, r3, #1
	strb	r3, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L82:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L86
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L86:
	rsb	r3, r3, #255
	strb	r3, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L109:
	add	r7, r7, #16
	b	.L65
.L72:
	add	r1, r3, r4
	mov	r7, #0
	mov	r10, #4
	mov	r2, #1
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r1
	rsb	r5, r1, r5
	str	r8, [r6, #28]
	mov	r1, r4, asl r1
	str	r5, [r6, #32]
	str	r1, [r6, #36]
	b	.L76
.L74:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r10
	cmp	r1, r0
	sub	r10, r10, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r10, #1
	add	r1, r3, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r1
	rsb	r5, r1, r5
	str	r8, [r6, #28]
	mov	r1, r4, asl r1
	str	r5, [r6, #32]
	str	r1, [r6, #36]
	beq	.L111
.L76:
	sub	r1, r1, #1
	cmp	r5, #0
	ubfx	r1, r1, #1, #24
	mov	r0, r8
	add	r4, r1, #1
	bge	.L74
	rsb	r1, r5, #24
	rsb	ip, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	add	r5, r1, r5
	str	ip, [fp, #-48]
	bl	BsGet
	ldr	ip, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	ip, ip, #7
	ldr	r2, [fp, #-56]
	orr	r0, r8, r0, asl ip
	b	.L74
.L111:
	add	r7, r7, #32
	b	.L65
.L57:
	rsb	r10, r5, #24
	ldr	r7, [r0, #28]
	bic	r10, r10, #7
	rsb	r8, r5, #16
	rsb	r8, r10, r8
	add	r5, r5, r10
	mov	r1, r10
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r6, #32]
	orr	r0, r7, r0, asl r8
	str	r0, [r6, #28]
	mov	r8, r0
	b	.L58
.L106:
	rsb	r10, r4, #24
	mov	r0, r6
	bic	r10, r10, #7
	str	r3, [fp, #-48]
	rsb	r7, r4, #16
	add	r4, r4, r10
	mov	r1, r10
	rsb	r7, r10, r7
	bl	BsGet
	and	r7, r7, #7
	str	r4, [r6, #32]
	ldr	r3, [fp, #-48]
	orr	r0, r8, r0, asl r7
	str	r0, [r6, #28]
	mov	r8, r0
	b	.L61
.L107:
	rsb	r10, r5, #24
	mov	r0, r6
	bic	r10, r10, #7
	str	r3, [fp, #-48]
	rsb	r7, r5, #16
	add	r5, r5, r10
	mov	r1, r10
	rsb	r7, r10, r7
	bl	BsGet
	and	r7, r7, #7
	str	r5, [r6, #32]
	ldr	r3, [fp, #-48]
	orr	r0, r8, r0, asl r7
	str	r0, [r6, #28]
	mov	r8, r0
	b	.L68
.L110:
	rsb	r1, r5, #24
	rsb	r10, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	str	r3, [fp, #-48]
	rsb	r10, r1, r10
	add	r5, r1, r5
	bl	BsGet
	and	r10, r10, #7
	ldr	r3, [fp, #-48]
	orr	r0, r8, r0, asl r10
	b	.L80
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_DiffUpdateProb, .-Vp9_DiffUpdateProb
	.align	2
	.global	Vp9_ReadTxProbs
	.type	Vp9_ReadTxProbs, %function
Vp9_ReadTxProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r7, .L400
	ldr	r4, [r1, #28]
	add	r8, r0, #10
	ldr	r3, [r1, #36]
	mov	r6, r1
	ldr	r5, [r1, #32]
	add	r2, r0, #12
	str	r0, [fp, #-52]
	str	r2, [fp, #-48]
.L145:
	sub	r10, r3, #1
	cmp	r5, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L354
.L115:
	mov	r9, r10, asl #24
	cmp	r9, r4
	bhi	.L116
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r5, r3, r5
	sub	r4, r10, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r4, r4, #1
	str	r5, [r6, #32]
	str	r9, [r6, #28]
	blt	.L355
.L117:
	mov	r3, r4, asl #24
	cmp	r3, r9
	bhi	.L118
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r4, r4, r2
	add	r3, r7, r4
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r4, asl r0
	rsb	r4, r0, r5
	cmp	r4, #0
	sub	r5, r2, #1
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L356
.L120:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L125
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r1, r5, asl r2
	rsb	r5, r2, r4
	sub	r9, r1, #1
	cmp	r5, #0
	ubfx	r9, r9, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r9, r9, #1
	str	r5, [r6, #32]
	str	r4, [r6, #28]
	blt	.L357
.L127:
	mov	r3, r9, asl #24
	cmp	r3, r4
	bhi	.L131
	ldr	r1, [r6, #36]
	rsb	r0, r3, r4
	mov	r2, #6
	mov	r3, #0
	rsb	r4, r9, r1
	str	r8, [fp, #-64]
	add	r1, r7, r4
	mov	ip, #1
	mov	r8, r3
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	rsb	r10, r1, r5
	mov	r9, r0, asl r1
	mov	r4, r4, asl r1
	str	r9, [r6, #28]
	str	r10, [r6, #32]
	mov	r5, r2
	str	r4, [r6, #36]
	b	.L132
.L136:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r2
	rsb	r10, r2, r10
	mov	r4, r4, asl r2
	str	r9, [r6, #28]
	str	r10, [r6, #32]
	str	r4, [r6, #36]
	beq	.L358
.L132:
	sub	r4, r4, #1
	cmp	r10, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r9
	add	r4, r4, #1
	bge	.L136
	rsb	r1, r10, #24
	rsb	r2, r10, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-60]
	str	r2, [fp, #-56]
	add	r10, r1, r10
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-60]
	and	r2, r2, #7
	orr	r0, r9, r0, asl r2
	b	.L136
.L116:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	str	r4, [r6, #28]
	mov	r3, r10, asl r3
	str	r5, [r6, #32]
	str	r3, [r6, #36]
.L271:
	ldr	r2, [fp, #-48]
	add	r8, r8, #1
	cmp	r8, r2
	bne	.L145
	ldr	r2, [fp, #-52]
	add	r1, r2, #4
	str	r1, [fp, #-48]
	mov	r8, r2
	str	r2, [fp, #-56]
.L206:
	sub	r10, r3, #1
	cmp	r5, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L359
.L146:
	mov	r9, r10, asl #24
	cmp	r9, r4
	bhi	.L147
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	rsb	r4, r3, r5
	mov	r10, r10, asl r3
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L360
.L148:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L149
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L361
.L151:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L156
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L362
.L158:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L162
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r5, r5, r1
	str	r8, [fp, #-68]
	add	r1, r7, r5
	mov	r8, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L163
.L167:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L363
.L163:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L167
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L167
.L147:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	mov	r10, r10, asl r3
	str	r4, [r6, #28]
	str	r5, [r6, #32]
	str	r10, [r6, #36]
.L272:
	sub	r10, r10, #1
	cmp	r5, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L364
.L176:
	mov	r9, r10, asl #24
	cmp	r9, r4
	bhi	.L177
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	rsb	r4, r3, r5
	mov	r10, r10, asl r3
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L365
.L178:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L179
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L366
.L181:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L186
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L367
.L188:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L192
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r5, r5, r1
	str	r8, [fp, #-68]
	add	r1, r7, r5
	mov	r8, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L193
.L197:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L368
.L193:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L197
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L197
.L177:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	str	r4, [r6, #28]
	mov	r3, r10, asl r3
	str	r5, [r6, #32]
	str	r3, [r6, #36]
.L273:
	ldr	r2, [fp, #-48]
	add	r8, r8, #2
	cmp	r8, r2
	bne	.L206
	ldr	r2, [fp, #-52]
	mov	r10, r3
	add	r8, r2, #6
	str	r8, [fp, #-48]
	ldr	r8, [fp, #-56]
.L270:
	sub	r10, r10, #1
	cmp	r5, #0
	mov	r2, r10, asl #8
	sub	r10, r2, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L369
.L207:
	mov	r9, r10, asl #24
	cmp	r9, r4
	bhi	.L208
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	mov	r1, r8
	mov	r0, r6
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r9, r9, asl r3
	rsb	r4, r3, r5
	mov	r10, r10, asl r3
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
	bl	Vp9_DiffUpdateProb
	ldr	r9, [r6, #28]
	ldr	r10, [r6, #36]
	ldr	r4, [r6, #32]
.L274:
	sub	r10, r10, #1
	cmp	r4, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L370
.L209:
	mov	r5, r10, asl #24
	cmp	r5, r9
	bhi	.L210
	ldr	r3, [r6, #36]
	rsb	r9, r5, r9
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L371
.L211:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L212
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L372
.L214:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L219
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L373
.L221:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L225
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r5, r5, r1
	str	r8, [fp, #-60]
	add	r1, r7, r5
	mov	r8, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L226
.L230:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L374
.L226:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L230
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L230
.L208:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r9, r4, asl r3
	mov	r10, r10, asl r3
	rsb	r4, r3, r5
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
	b	.L274
.L210:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r5, r9, asl r3
	rsb	r4, r3, r4
	mov	r10, r10, asl r3
	str	r5, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
.L275:
	sub	r10, r10, #1
	cmp	r4, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L375
.L239:
	mov	r9, r10, asl #24
	cmp	r9, r5
	bhi	.L240
	ldr	r3, [r6, #36]
	rsb	r9, r9, r5
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L376
.L241:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L242
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L377
.L244:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L249
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L378
.L251:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L255
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r5, r5, r1
	str	r8, [fp, #-60]
	add	r1, r7, r5
	mov	r8, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L256
.L260:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L379
.L256:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L260
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L260
.L240:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r5, r5, asl r3
	rsb	r4, r3, r4
	mov	r10, r10, asl r3
	str	r5, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
.L276:
	ldr	r3, [fp, #-48]
	add	r8, r8, #3
	cmp	r8, r3
	addne	r4, r6, #28
	ldmneia	r4, {r4, r5, r10}
	bne	.L270
.L114:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L212:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L217
.L215:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L380
.L217:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L215
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L215
.L179:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L184
.L182:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L381
.L184:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L182
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L182
.L149:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L154
.L152:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L382
.L154:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L152
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L152
.L118:
	add	r3, r7, r4
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-64]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #28]
	mov	r4, r4, asl r1
	mov	r10, r9
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	mov	r9, r2
	b	.L123
.L121:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L383
.L123:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L121
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-60]
	str	r2, [fp, #-56]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-60]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L121
.L242:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L247
.L245:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L384
.L247:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L245
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L245
.L401:
	.align	2
.L400:
	.word	.LANCHOR0
.L364:
	rsb	r2, r5, #24
	rsb	r9, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r9, r2, r9
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-60]
	add	r5, r2, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L176
.L369:
	rsb	r3, r5, #24
	rsb	r9, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r9, r9, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r5, r3, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L207
.L370:
	rsb	r3, r4, #24
	rsb	r5, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r5, r3, r5
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r5, r5, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r3, r4
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r5
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L209
.L375:
	rsb	r2, r4, #24
	rsb	r9, r4, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r9, r2, r9
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-52]
	add	r4, r2, r4
	str	r4, [r6, #32]
	orr	r0, r5, r0, asl r3
	str	r0, [r6, #28]
	mov	r5, r0
	b	.L239
.L359:
	rsb	r3, r5, #24
	rsb	r9, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r9, r9, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r5, r3, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L146
.L354:
	rsb	r3, r5, #24
	rsb	r9, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-56]
	mov	r1, r3
	and	r9, r9, #7
	bl	BsGet
	ldr	r3, [fp, #-56]
	add	r5, r3, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L115
.L382:
	mov	r10, r8
	ldr	r8, [fp, #-68]
.L155:
	ldrb	r2, [r8, #6]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L170
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L171
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L171:
	add	r3, r3, #1
.L173:
	add	r4, r6, #28
	strb	r3, [r8, #6]
	ldmia	r4, {r4, r5, r10}
	b	.L272
.L170:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	ble	.L385
	rsb	r3, r3, #255
	b	.L173
.L383:
	mov	r10, r8
	ldr	r8, [fp, #-64]
.L124:
	ldrb	r2, [r8]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L139
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L140
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L140:
	add	r3, r3, #1
.L142:
	strb	r3, [r8]
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r5, [r6, #32]
	b	.L271
.L139:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	ble	.L386
	rsb	r3, r3, #255
	b	.L142
.L384:
	mov	r10, r8
	ldr	r8, [fp, #-60]
.L248:
	ldrb	r2, [r8, #2]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L263
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L264
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L264:
	add	r3, r3, #1
.L266:
	strb	r3, [r8, #2]
	b	.L276
.L263:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	ble	.L387
	rsb	r3, r3, #255
	b	.L266
.L381:
	mov	r10, r8
	ldr	r8, [fp, #-68]
.L185:
	ldrb	r2, [r8, #7]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L200
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L201
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L201:
	add	r3, r3, #1
.L203:
	strb	r3, [r8, #7]
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r5, [r6, #32]
	b	.L273
.L200:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	ble	.L388
	rsb	r3, r3, #255
	b	.L203
.L380:
	mov	r10, r8
	ldr	r8, [fp, #-60]
.L218:
	ldrb	r2, [r8, #1]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L233
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L234
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L234:
	add	r3, r3, #1
.L236:
	strb	r3, [r8, #1]
	ldr	r5, [r6, #28]
	ldr	r10, [r6, #36]
	ldr	r4, [r6, #32]
	b	.L275
.L233:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	ble	.L389
	rsb	r3, r3, #255
	b	.L236
.L386:
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
	rsb	r3, r3, #255
	b	.L142
.L385:
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
	rsb	r3, r3, #255
	b	.L173
.L388:
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
	rsb	r3, r3, #255
	b	.L203
.L387:
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
	rsb	r3, r3, #255
	b	.L266
.L389:
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
	rsb	r3, r3, #255
	b	.L236
.L162:
	add	r3, r7, r5
	mov	r10, #0
	mov	ip, #4
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r5, ip
	b	.L166
.L164:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r8, r8, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r7, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L390
.L166:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L164
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L164
.L192:
	add	r3, r7, r5
	mov	r10, #0
	mov	ip, #4
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r5, ip
	b	.L196
.L194:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r8, r8, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r7, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L391
.L196:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L194
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L194
.L255:
	add	r3, r7, r5
	mov	r10, #0
	mov	ip, #4
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r5, ip
	b	.L259
.L257:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r8, r8, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r7, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L392
.L259:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L257
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L257
.L131:
	add	r3, r7, r9
	mov	r10, #0
	mov	r2, #4
	str	r8, [fp, #-64]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r3, r4, asl r1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #36]
	mov	r4, r9
	str	r3, [r6, #28]
	str	r5, [r6, #32]
	mov	r10, r3
	mov	r9, r2
	b	.L135
.L133:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L393
.L135:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L133
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-60]
	str	r2, [fp, #-56]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-60]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L133
.L225:
	add	r3, r7, r5
	mov	r10, #0
	mov	ip, #4
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r5, ip
	b	.L229
.L227:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r8, r8, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r7, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L394
.L229:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L227
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L227
.L156:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L161
.L159:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L395
.L161:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L159
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L159
.L125:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-64]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L130
.L128:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L396
.L130:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L128
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-60]
	str	r2, [fp, #-56]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-60]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L128
.L186:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L191
.L189:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L397
.L191:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L189
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L189
.L219:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L224
.L222:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L398
.L224:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L222
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L222
.L249:
	add	r3, r7, r5
	mov	r10, #0
	mov	r2, #3
	str	r8, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r10, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L254
.L252:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r8, r8, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L399
.L254:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r10
	add	r5, r5, #1
	bge	.L252
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L252
.L399:
	mov	r10, r8
	ldr	r8, [fp, #-60]
	add	r10, r10, #16
	b	.L248
.L395:
	mov	r10, r8
	ldr	r8, [fp, #-68]
	add	r10, r10, #16
	b	.L155
.L398:
	mov	r10, r8
	ldr	r8, [fp, #-60]
	add	r10, r10, #16
	b	.L218
.L397:
	mov	r10, r8
	ldr	r8, [fp, #-68]
	add	r10, r10, #16
	b	.L185
.L396:
	mov	r10, r8
	ldr	r8, [fp, #-64]
	add	r10, r10, #16
	b	.L124
.L358:
	mov	r3, r8
	cmp	r3, #64
	ldr	r8, [fp, #-64]
	movle	r10, r3
	ble	.L138
	mov	r1, #128
	mov	r0, r6
	str	r3, [fp, #-56]
	bl	Vp9_Cabac_Read
	ldr	r3, [fp, #-56]
	add	r0, r0, r3, lsl #1
	sub	r10, r0, #65
.L138:
	add	r10, r10, #64
	b	.L124
.L374:
	mov	r10, r8
	cmp	r10, #64
	ldr	r8, [fp, #-60]
	ble	.L232
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L232:
	add	r10, r10, #64
	b	.L218
.L379:
	mov	r10, r8
	cmp	r10, #64
	ldr	r8, [fp, #-60]
	ble	.L262
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L262:
	add	r10, r10, #64
	b	.L248
.L368:
	mov	r10, r8
	cmp	r10, #64
	ldr	r8, [fp, #-68]
	ble	.L199
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L199:
	add	r10, r10, #64
	b	.L185
.L363:
	mov	r10, r8
	cmp	r10, #64
	ldr	r8, [fp, #-68]
	ble	.L169
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L169:
	add	r10, r10, #64
	b	.L155
.L393:
	mov	r10, r8
	ldr	r8, [fp, #-64]
	add	r10, r10, #32
	b	.L124
.L390:
	mov	r10, r8
	ldr	r8, [fp, #-68]
	add	r10, r10, #32
	b	.L155
.L394:
	mov	r10, r8
	ldr	r8, [fp, #-60]
	add	r10, r10, #32
	b	.L218
.L392:
	mov	r10, r8
	ldr	r8, [fp, #-60]
	add	r10, r10, #32
	b	.L248
.L391:
	mov	r10, r8
	ldr	r8, [fp, #-68]
	add	r10, r10, #32
	b	.L185
.L365:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L178
.L360:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L148
.L355:
	rsb	r2, r5, #24
	rsb	r10, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-56]
	add	r5, r5, r2
	str	r5, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L117
.L376:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L241
.L371:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L211
.L357:
	rsb	r2, r5, #24
	rsb	r10, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	ldr	r2, [fp, #-56]
	and	r3, r10, #7
	add	r10, r5, r2
	str	r10, [r6, #32]
	mov	r5, r10
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L127
.L378:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L251
.L373:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L221
.L367:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L188
.L362:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L158
.L377:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L244
.L356:
	rsb	r2, r4, #24
	rsb	r10, r4, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-56]
	add	r4, r4, r2
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L120
.L366:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L181
.L361:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L151
.L372:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L214
	UNWIND(.fnend)
	.size	Vp9_ReadTxProbs, .-Vp9_ReadTxProbs
	.align	2
	.global	Vp9_ReadCoefProbsCommon
	.type	Vp9_ReadCoefProbsCommon, %function
Vp9_ReadCoefProbsCommon:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r4, [r1, #36]
	ldr	ip, [r1, #32]
	mov	r6, r1
	sub	r4, r4, #1
	mov	r7, r0
	cmp	ip, #0
	ubfx	r4, r4, #1, #24
	add	r4, r4, #1
	blt	.L403
	ldr	r3, [r1, #28]
.L404:
	mov	r1, r4, asl #24
	cmp	r1, r3
	bhi	.L405
	ldr	r2, [r6, #36]
	rsb	r3, r1, r3
	ldr	r5, .L591
	add	r1, r7, #648
	rsb	r4, r4, r2
	add	r2, r1, #2
	str	r2, [fp, #-80]
	add	r2, r5, r4
	mov	r10, r6
	add	r1, r7, #218
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	str	r1, [fp, #-76]
	mov	r3, r3, asl r2
	rsb	r1, r2, ip
	mov	r4, r4, asl r2
	str	r3, [r6, #28]
	str	r1, [r6, #32]
	str	r4, [r6, #36]
.L406:
	ldr	r3, [fp, #-76]
	mov	r6, r10
	sub	r3, r3, #216
	str	r3, [fp, #-72]
.L509:
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-52]
.L507:
	ldr	r7, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-48]
.L505:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	cmp	r3, #0
	moveq	r3, #3
	movne	r3, #6
	cmp	r2, r3
	bge	.L563
	ldr	r8, [r6, #36]
	ldr	r4, [r6, #32]
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L407
	ldr	r10, [r6, #28]
.L408:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L409
	ldr	r3, [r6, #36]
	rsb	r10, r9, r10
	rsb	r8, r8, r3
	add	r3, r5, r8
	ldrb	r9, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r9
	rsb	r4, r9, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r10, asl r9
	str	r3, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L564
.L410:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L411
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r8, r8, r2
	add	r3, r5, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, r2, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L565
.L413:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L418
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r8, asl r2
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r8, r8, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L566
.L420:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L424
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-68]
	add	r1, r5, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r8, asl r4
	str	r9, [r6, #32]
	mov	r8, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L425
.L429:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r5, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L567
.L425:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L429
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L429
.L409:
	add	r3, r5, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
.L510:
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L568
.L438:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L439
	ldr	r3, [r6, #36]
	rsb	r10, r9, r10
	rsb	r8, r8, r3
	add	r3, r5, r8
	ldrb	r9, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r9
	rsb	r4, r9, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r10, r10, asl r9
	str	r3, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r10, [r6, #28]
	blt	.L569
.L440:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L441
	ldr	r2, [r6, #36]
	rsb	r9, r9, r10
	rsb	r8, r8, r2
	add	r3, r5, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, r2, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L570
.L443:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L448
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r8, asl r2
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r8, r8, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L571
.L450:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L454
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-68]
	add	r1, r5, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r8, asl r4
	str	r9, [r6, #32]
	mov	r8, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L455
.L459:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r5, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L572
.L455:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L459
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L459
.L439:
	add	r3, r5, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
.L511:
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L573
.L470:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L471
	ldr	r3, [r6, #36]
	rsb	r10, r9, r10
	rsb	r8, r8, r3
	add	r3, r5, r8
	ldrb	r9, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r9
	rsb	r4, r9, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r10, r10, asl r9
	str	r3, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r10, [r6, #28]
	blt	.L574
.L472:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L473
	ldr	r2, [r6, #36]
	rsb	r9, r9, r10
	rsb	r8, r8, r2
	add	r3, r5, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, r2, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r8, r8, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L575
.L475:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L480
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r8, asl r2
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r8, r8, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L576
.L482:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L486
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-68]
	add	r1, r5, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r8, asl r4
	str	r9, [r6, #32]
	mov	r8, r3
	str	r4, [r6, #36]
	mov	r10, r2
	b	.L487
.L491:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r5, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L577
.L487:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L491
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L491
.L471:
	add	r3, r5, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
.L512:
	ldr	r3, [fp, #-48]
	add	r7, r7, #3
	add	r3, r3, #1
	str	r3, [fp, #-48]
	b	.L505
.L573:
	rsb	r3, r4, #24
	rsb	r9, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	BsGet
	and	r2, r9, #7
	ldr	r3, [fp, #-60]
	add	r4, r3, r4
	str	r4, [r6, #32]
	orr	r0, r10, r0, asl r2
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L470
.L568:
	rsb	r3, r4, #24
	rsb	r9, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	BsGet
	and	r2, r9, #7
	ldr	r3, [fp, #-60]
	add	r4, r3, r4
	str	r4, [r6, #32]
	orr	r0, r10, r0, asl r2
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L438
.L407:
	rsb	r9, r4, #24
	rsb	r3, r4, #16
	bic	r9, r9, #7
	mov	r0, r6
	rsb	r3, r9, r3
	ldr	r10, [r6, #28]
	mov	r1, r9
	str	r3, [fp, #-60]
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r9
	str	r4, [r6, #32]
	and	r3, r3, #7
	orr	r0, r10, r0, asl r3
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L408
.L473:
	add	r1, r5, r8
	mov	r3, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	ip, #1
	mov	r7, r3
	mov	r9, r10, asl r1
	rsb	r4, r1, r4
	mov	r8, r8, asl r1
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	mov	r10, r2
	str	r8, [r6, #36]
	b	.L478
.L476:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r10
	cmp	r2, r0
	sub	r10, r10, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r10, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L578
.L478:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r9
	add	r8, r8, #1
	bge	.L476
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r9, r0, asl r2
	b	.L476
.L441:
	add	r1, r5, r8
	mov	r3, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	ip, #1
	mov	r7, r3
	mov	r9, r10, asl r1
	rsb	r4, r1, r4
	mov	r8, r8, asl r1
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	mov	r10, r2
	str	r8, [r6, #36]
	b	.L446
.L444:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r10
	cmp	r2, r0
	sub	r10, r10, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r10, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L579
.L446:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r9
	add	r8, r8, #1
	bge	.L444
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r9, r0, asl r2
	b	.L444
.L411:
	add	r3, r5, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r3
	rsb	r4, r3, r4
	str	r9, [r6, #28]
	mov	r8, r8, asl r3
	mov	r10, r9
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	mov	r9, r2
	b	.L416
.L414:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L580
.L416:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L414
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L414
.L580:
	mov	r10, r7
	ldr	r7, [fp, #-68]
.L417:
	ldrb	r2, [r7, #-2]	@ zero_extendqisi2
	add	r10, r5, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L432
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L433
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L433:
	add	r3, r3, #1
.L435:
	strb	r3, [r7, #-2]
	ldr	r8, [r6, #36]
	ldr	r4, [r6, #32]
	ldr	r10, [r6, #28]
	b	.L510
.L432:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L436
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L436:
	rsb	r3, r3, #255
	b	.L435
.L579:
	mov	r3, r7
	ldr	r7, [fp, #-68]
.L447:
	ldrb	r2, [r7, #-1]	@ zero_extendqisi2
	add	r10, r5, r3
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L464
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L465
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L465:
	add	r3, r3, #1
.L467:
	strb	r3, [r7, #-1]
	ldr	r8, [r6, #36]
	ldr	r4, [r6, #32]
	ldr	r10, [r6, #28]
	b	.L511
.L464:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L468
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L468:
	rsb	r3, r3, #255
	b	.L467
.L578:
	mov	r3, r7
	ldr	r7, [fp, #-68]
.L479:
	ldrb	r2, [r7]	@ zero_extendqisi2
	add	r10, r5, r3
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L496
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L497
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L497:
	add	r3, r3, #1
.L499:
	strb	r3, [r7]
	b	.L512
.L496:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L500
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L500:
	rsb	r3, r3, #255
	b	.L499
.L563:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	cmp	r3, #6
	add	r2, r2, #18
	str	r2, [fp, #-56]
	bne	.L507
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-76]
	add	r3, r3, #108
	str	r3, [fp, #-72]
	cmp	r3, r2
	bne	.L509
	ldr	r3, [fp, #-76]
	mov	r10, r6
	ldr	r2, [fp, #-80]
	add	r3, r3, #216
	str	r3, [fp, #-76]
	cmp	r3, r2
	bne	.L406
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L448:
	add	r3, r5, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r3
	rsb	r4, r3, r4
	str	r9, [r6, #28]
	mov	r8, r8, asl r3
	mov	r10, r9
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	mov	r9, r2
	b	.L453
.L451:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L581
.L453:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L451
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L451
.L418:
	add	r3, r5, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r3
	rsb	r4, r3, r4
	str	r9, [r6, #28]
	mov	r8, r8, asl r3
	mov	r10, r9
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	mov	r9, r2
	b	.L423
.L421:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L582
.L423:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L421
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L421
.L480:
	add	r3, r5, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-68]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r3
	rsb	r4, r3, r4
	str	r9, [r6, #28]
	mov	r8, r8, asl r3
	mov	r10, r9
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	mov	r9, r2
	b	.L485
.L483:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r5, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r6, #28]
	str	r4, [r6, #32]
	str	r8, [r6, #36]
	beq	.L583
.L485:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L483
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L483
.L583:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r3, r10, #16
	b	.L479
.L582:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r10, r10, #16
	b	.L417
.L581:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r3, r10, #16
	b	.L447
.L567:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-68]
	ble	.L431
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L431:
	add	r10, r10, #64
	b	.L417
.L577:
	mov	r2, r10
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-68]
	bgt	.L584
.L493:
	add	r3, r10, #64
	b	.L479
.L572:
	mov	r2, r10
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-68]
	bgt	.L585
.L461:
	add	r3, r10, #64
	b	.L447
.L424:
	add	r3, r5, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r6, #36]
	mov	r4, r8
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L428
.L592:
	.align	2
.L591:
	.word	.LANCHOR0
.L426:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r5, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L586
.L428:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L426
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L426
.L454:
	add	r3, r5, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r6, #36]
	mov	r4, r8
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L458
.L456:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r5, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L587
.L458:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L456
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L456
.L486:
	add	r3, r5, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r6, #36]
	mov	r4, r8
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L490
.L488:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r5, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L588
.L490:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L488
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L488
.L588:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r3, r10, #32
	b	.L479
.L587:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r3, r10, #32
	b	.L447
.L586:
	mov	r10, r7
	ldr	r7, [fp, #-68]
	add	r10, r10, #32
	b	.L417
.L564:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L410
.L569:
	rsb	r3, r4, #24
	rsb	r9, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	BsGet
	and	r2, r9, #7
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r10, r0, asl r2
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L440
.L574:
	rsb	r3, r4, #24
	rsb	r9, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	BsGet
	and	r2, r9, #7
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r10, r0, asl r2
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L472
.L584:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r10, r10, asl #1
	add	r4, r4, #1
	sub	r10, r10, #65
	movge	r0, r2
	blt	.L589
.L494:
	mov	r3, r4, asl #24
	cmp	r3, r0
	rsbls	r0, r3, r0
	ldrls	r1, [r6, #36]
	movls	r3, #1
	movhi	r3, #0
	add	r10, r10, r3
	rsbls	r4, r4, r1
	add	r1, r5, r4
	ldrb	r3, [r1, #24]	@ zero_extendqisi2
	mov	r2, r0, asl r3
	rsb	r9, r3, r9
	mov	r4, r4, asl r3
	str	r2, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	b	.L493
.L585:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r10, r10, asl #1
	add	r4, r4, #1
	sub	r10, r10, #65
	movge	r0, r2
	blt	.L590
.L462:
	mov	r3, r4, asl #24
	cmp	r3, r0
	rsbls	r0, r3, r0
	ldrls	r1, [r6, #36]
	movls	r3, #1
	movhi	r3, #0
	add	r10, r10, r3
	rsbls	r4, r4, r1
	add	r1, r5, r4
	ldrb	r3, [r1, #24]	@ zero_extendqisi2
	mov	r2, r0, asl r3
	rsb	r9, r3, r9
	mov	r4, r4, asl r3
	str	r2, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	b	.L461
.L570:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L443
.L575:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L475
.L565:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L413
.L566:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L420
.L576:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L482
.L571:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L450
.L590:
	rsb	r1, r9, #24
	rsb	r8, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	str	r2, [fp, #-60]
	rsb	r8, r1, r8
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	and	r8, r8, #7
	orr	r0, r2, r0, asl r8
	b	.L462
.L589:
	rsb	r1, r9, #24
	rsb	r8, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	str	r2, [fp, #-60]
	rsb	r8, r1, r8
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	and	r8, r8, #7
	orr	r0, r2, r0, asl r8
	b	.L494
.L405:
	ldr	r2, .L591
	add	r2, r2, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r3, r3, asl r2
	rsb	r5, r2, ip
	mov	r4, r4, asl r2
	str	r3, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L403:
	rsb	r8, ip, #24
	ldr	r10, [r1, #28]
	bic	r8, r8, #7
	mov	r0, r1
	rsb	r9, ip, #16
	str	ip, [fp, #-48]
	mov	r1, r8
	rsb	r9, r8, r9
	bl	BsGet
	ldr	ip, [fp, #-48]
	and	r3, r9, #7
	add	r5, ip, r8
	str	r5, [r6, #32]
	mov	ip, r5
	orr	r0, r10, r0, asl r3
	str	r0, [r6, #28]
	mov	r3, r0
	b	.L404
	UNWIND(.fnend)
	.size	Vp9_ReadCoefProbsCommon, .-Vp9_ReadCoefProbsCommon
	.align	2
	.global	Vp9_ReadCoefProbs
	.type	Vp9_ReadCoefProbs, %function
Vp9_ReadCoefProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	mov	r1, r2
	mov	r5, r2
	mov	r6, r0
	bl	Vp9_ReadCoefProbsCommon
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, r5
	add	r0, r6, #432
	bl	Vp9_ReadCoefProbsCommon
	cmp	r4, #1
	bls	.L595
	mov	r1, r5
	add	r0, r6, #864
	bl	Vp9_ReadCoefProbsCommon
.L595:
	cmp	r4, #2
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, r5
	add	r0, r6, #1296
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	Vp9_ReadCoefProbsCommon
	UNWIND(.fnend)
	.size	Vp9_ReadCoefProbs, .-Vp9_ReadCoefProbs
	.align	2
	.global	Vp9_ReadInterModeProbs
	.type	Vp9_ReadInterModeProbs, %function
Vp9_ReadInterModeProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r6, .L765
	mov	r7, r0
	mov	r5, r1
	add	r3, r0, #21
	str	r3, [fp, #-48]
.L690:
	ldr	r3, [r5, #36]
	ldr	r4, [r5, #32]
	sub	r3, r3, #1
	cmp	r4, #0
	mov	r2, r3, asl #8
	sub	r3, r2, r3, asl #2
	mov	r3, r3, lsr #8
	add	r8, r3, #1
	blt	.L599
	ldr	r10, [r5, #28]
.L600:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L601
	ldr	r3, [r5, #36]
	rsb	r10, r9, r10
	rsb	r3, r8, r3
	add	r2, r6, r3
	ldrb	r9, [r2, #24]	@ zero_extendqisi2
	mov	r3, r3, asl r9
	rsb	r4, r9, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r10, asl r9
	str	r3, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L742
.L602:
	mov	r10, r8, asl #24
	cmp	r10, r9
	bhi	.L603
	ldr	r2, [r5, #36]
	rsb	r9, r10, r9
	rsb	r8, r8, r2
	add	r3, r6, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, r2, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L743
.L605:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L610
	ldr	r1, [r5, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r8, asl r2
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r5, #36]
	add	r8, r8, #1
	str	r9, [r5, #32]
	str	r4, [r5, #28]
	blt	.L744
.L612:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L616
	ldr	r1, [r5, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-60]
	add	r1, r6, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r5, #28]
	mov	r4, r8, asl r4
	str	r9, [r5, #32]
	mov	r8, r3
	str	r4, [r5, #36]
	mov	r10, r2
	b	.L617
.L621:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r6, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L745
.L617:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L621
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L621
.L601:
	add	r3, r6, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	str	r10, [r5, #28]
	mov	r3, r8, asl r3
	str	r4, [r5, #32]
	str	r3, [r5, #36]
.L691:
	sub	r3, r3, #1
	cmp	r4, #0
	mov	r8, r3, asl #8
	sub	r8, r8, r3, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L746
.L630:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L631
	ldr	r3, [r5, #36]
	rsb	r9, r9, r10
	rsb	r8, r8, r3
	add	r3, r6, r8
	ldrb	r2, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r2
	rsb	r4, r2, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r2
	str	r3, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L747
.L632:
	mov	r2, r8, asl #24
	cmp	r2, r9
	bhi	.L633
	ldr	ip, [r5, #36]
	rsb	r9, r2, r9
	rsb	r8, r8, ip
	add	r3, r6, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	ip, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, ip, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	ip, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L748
.L635:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L640
	ldr	r1, [r5, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r6, r8
	ldrb	ip, [r2, #24]	@ zero_extendqisi2
	rsb	r9, ip, r4
	mov	r1, r8, asl ip
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl ip
	str	r1, [r5, #36]
	add	r8, r8, #1
	str	r9, [r5, #32]
	str	r4, [r5, #28]
	blt	.L749
.L642:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L646
	ldr	r1, [r5, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-60]
	add	r1, r6, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r5, #28]
	mov	r4, r8, asl r4
	str	r9, [r5, #32]
	mov	r8, r3
	str	r4, [r5, #36]
	mov	r10, r2
	b	.L647
.L651:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r6, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L750
.L647:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L651
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L651
.L631:
	add	r3, r6, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
.L692:
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L751
.L660:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L661
	ldr	r3, [r5, #36]
	rsb	r9, r9, r10
	rsb	r8, r8, r3
	add	r3, r6, r8
	ldrb	r2, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r2
	rsb	r4, r2, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r2
	str	r3, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L752
.L662:
	mov	r2, r8, asl #24
	cmp	r2, r9
	bhi	.L663
	ldr	ip, [r5, #36]
	rsb	r9, r2, r9
	rsb	r8, r8, ip
	add	r3, r6, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	ip, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, ip, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	ip, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L753
.L665:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L670
	ldr	r1, [r5, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r6, r8
	ldrb	ip, [r2, #24]	@ zero_extendqisi2
	rsb	r9, ip, r4
	mov	r1, r8, asl ip
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl ip
	str	r1, [r5, #36]
	add	r8, r8, #1
	str	r9, [r5, #32]
	str	r4, [r5, #28]
	blt	.L754
.L672:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L676
	ldr	r1, [r5, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-60]
	add	r1, r6, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r5, #28]
	mov	r4, r8, asl r4
	str	r9, [r5, #32]
	mov	r8, r3
	str	r4, [r5, #36]
	mov	r10, r2
	b	.L677
.L681:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r6, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L755
.L677:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L681
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L681
.L661:
	add	r3, r6, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
.L693:
	ldr	r3, [fp, #-48]
	add	r7, r7, #3
	cmp	r7, r3
	bne	.L690
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L751:
	rsb	r2, r4, #24
	rsb	r9, r4, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r9, r2, r9
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-52]
	add	r4, r2, r4
	str	r4, [r5, #32]
	orr	r0, r10, r0, asl r3
	str	r0, [r5, #28]
	mov	r10, r0
	b	.L660
.L746:
	rsb	r2, r4, #24
	rsb	r9, r4, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r9, r2, r9
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-52]
	add	r4, r2, r4
	str	r4, [r5, #32]
	orr	r0, r10, r0, asl r3
	str	r0, [r5, #28]
	mov	r10, r0
	b	.L630
.L599:
	rsb	r9, r4, #24
	rsb	r3, r4, #16
	bic	r9, r9, #7
	mov	r0, r5
	rsb	r3, r9, r3
	ldr	r10, [r5, #28]
	mov	r1, r9
	str	r3, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r9
	str	r4, [r5, #32]
	and	r3, r3, #7
	orr	r0, r10, r0, asl r3
	str	r0, [r5, #28]
	mov	r10, r0
	b	.L600
.L603:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L608
.L606:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L756
.L608:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L606
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L606
.L663:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L668
.L666:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L757
.L668:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L666
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L666
.L633:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L638
.L636:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L758
.L638:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L636
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L636
.L758:
	mov	r10, r7
	ldr	r7, [fp, #-60]
.L639:
	ldrb	r2, [r7, #1959]	@ zero_extendqisi2
	add	r10, r6, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L654
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L655
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L655:
	add	r3, r3, #1
.L657:
	strb	r3, [r7, #1959]
	ldr	r10, [r5, #28]
	ldr	r8, [r5, #36]
	ldr	r4, [r5, #32]
	b	.L692
.L654:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L658
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L658:
	rsb	r3, r3, #255
	b	.L657
.L757:
	mov	r10, r7
	ldr	r7, [fp, #-60]
.L669:
	ldrb	r2, [r7, #1960]	@ zero_extendqisi2
	add	r10, r6, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L684
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L685
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L685:
	add	r3, r3, #1
.L687:
	strb	r3, [r7, #1960]
	b	.L693
.L684:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L688
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L688:
	rsb	r3, r3, #255
	b	.L687
.L756:
	mov	r10, r7
	ldr	r7, [fp, #-60]
.L609:
	ldrb	r2, [r7, #1958]	@ zero_extendqisi2
	add	r10, r6, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L624
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L625
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L625:
	add	r3, r3, #1
.L627:
	strb	r3, [r7, #1958]
	ldr	r10, [r5, #28]
	ldr	r3, [r5, #36]
	ldr	r4, [r5, #32]
	b	.L691
.L624:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L628
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L628:
	rsb	r3, r3, #255
	b	.L627
.L616:
	add	r3, r6, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r5, #36]
	mov	r4, r8
	str	r3, [r5, #28]
	str	r9, [r5, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L620
.L618:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r5, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r6, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L759
.L620:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L618
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L618
.L676:
	add	r3, r6, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r5, #36]
	mov	r4, r8
	str	r3, [r5, #28]
	str	r9, [r5, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L680
.L678:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r5, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r6, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L760
.L680:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L678
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L678
.L646:
	add	r3, r6, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r5, #36]
	mov	r4, r8
	str	r3, [r5, #28]
	str	r9, [r5, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L650
.L648:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r5, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r6, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L761
.L650:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L648
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L648
.L670:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L675
.L673:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L762
.L675:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L673
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L673
.L640:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L645
.L643:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L763
.L645:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L643
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L643
.L610:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L615
.L766:
	.align	2
.L765:
	.word	.LANCHOR0
.L613:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L764
.L615:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L613
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L613
.L764:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #16
	b	.L609
.L763:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #16
	b	.L639
.L762:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #16
	b	.L669
.L755:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-60]
	ble	.L683
	mov	r1, #128
	mov	r0, r5
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L683:
	add	r10, r10, #64
	b	.L669
.L745:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-60]
	ble	.L623
	mov	r1, #128
	mov	r0, r5
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L623:
	add	r10, r10, #64
	b	.L609
.L750:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-60]
	ble	.L653
	mov	r1, #128
	mov	r0, r5
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
.L653:
	add	r10, r10, #64
	b	.L639
.L761:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #32
	b	.L639
.L760:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #32
	b	.L669
.L759:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #32
	b	.L609
.L747:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L632
.L752:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L662
.L742:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L602
.L743:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L605
.L753:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L665
.L748:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L635
.L749:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r5, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r5, #28]
	mov	r4, r0
	b	.L642
.L744:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r5, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r5, #28]
	mov	r4, r0
	b	.L612
.L754:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r5, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r5, #28]
	mov	r4, r0
	b	.L672
	UNWIND(.fnend)
	.size	Vp9_ReadInterModeProbs, .-Vp9_ReadInterModeProbs
	.align	2
	.global	Vp9_ReadSwitchableInterpProbs
	.type	Vp9_ReadSwitchableInterpProbs, %function
Vp9_ReadSwitchableInterpProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r6, .L882
	mov	r7, r0
	mov	r5, r1
	add	r3, r0, #8
	str	r3, [fp, #-48]
.L829:
	ldr	r8, [r5, #36]
	ldr	r4, [r5, #32]
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L768
	ldr	r0, [r5, #28]
.L769:
	mov	r10, r8, asl #24
	cmp	r10, r0
	bhi	.L770
	ldr	r3, [r5, #36]
	rsb	r0, r10, r0
	rsb	r8, r8, r3
	add	r3, r6, r8
	ldrb	r9, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r9
	rsb	r4, r9, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r0, asl r9
	str	r3, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L865
.L771:
	mov	r0, r8, asl #24
	cmp	r0, r9
	bhi	.L772
	ldr	r2, [r5, #36]
	rsb	r9, r0, r9
	rsb	r8, r8, r2
	add	r3, r6, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, r2, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L866
.L774:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L779
	ldr	r1, [r5, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r8, asl r2
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r5, #36]
	add	r8, r8, #1
	str	r9, [r5, #32]
	str	r4, [r5, #28]
	blt	.L867
.L781:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L785
	ldr	r1, [r5, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-60]
	add	r1, r6, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r5, #28]
	mov	r4, r8, asl r4
	str	r9, [r5, #32]
	mov	r8, r3
	str	r4, [r5, #36]
	mov	r10, r2
	b	.L786
.L790:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r6, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L868
.L786:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L790
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L790
.L770:
	add	r3, r6, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
.L830:
	sub	r8, r8, #1
	cmp	r4, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L869
.L799:
	mov	r9, r8, asl #24
	cmp	r9, r10
	bhi	.L800
	ldr	r3, [r5, #36]
	rsb	r9, r9, r10
	rsb	r8, r8, r3
	add	r3, r6, r8
	ldrb	r2, [r3, #24]	@ zero_extendqisi2
	mov	r3, r8, asl r2
	rsb	r4, r2, r4
	sub	r8, r3, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r2
	str	r3, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L870
.L801:
	mov	r2, r8, asl #24
	cmp	r2, r9
	bhi	.L802
	ldr	ip, [r5, #36]
	rsb	r9, r2, r9
	rsb	r8, r8, ip
	add	r3, r6, r8
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	ip, r8, asl r0
	rsb	r4, r0, r4
	sub	r8, ip, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r9, r9, asl r0
	str	ip, [r5, #36]
	add	r8, r8, #1
	str	r4, [r5, #32]
	str	r9, [r5, #28]
	blt	.L871
.L804:
	mov	r3, r8, asl #24
	cmp	r3, r9
	bhi	.L809
	ldr	r1, [r5, #36]
	rsb	r3, r3, r9
	rsb	r8, r8, r1
	add	r2, r6, r8
	ldrb	ip, [r2, #24]	@ zero_extendqisi2
	rsb	r9, ip, r4
	mov	r1, r8, asl ip
	sub	r8, r1, #1
	cmp	r9, #0
	ubfx	r8, r8, #1, #24
	mov	r4, r3, asl ip
	str	r1, [r5, #36]
	add	r8, r8, #1
	str	r9, [r5, #32]
	str	r4, [r5, #28]
	blt	.L872
.L811:
	mov	r2, r8, asl #24
	cmp	r2, r4
	bhi	.L815
	ldr	r1, [r5, #36]
	rsb	r2, r2, r4
	mov	r10, #0
	mov	r3, #6
	rsb	r8, r8, r1
	str	r7, [fp, #-60]
	add	r1, r6, r8
	mov	r7, r10
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r5, #28]
	mov	r4, r8, asl r4
	str	r9, [r5, #32]
	mov	r8, r3
	str	r4, [r5, #36]
	mov	r10, r2
	b	.L816
.L820:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r8
	cmp	r2, r0
	sub	r8, r8, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r2, r6, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L873
.L816:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L820
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L820
.L800:
	add	r3, r6, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	mov	r8, r8, asl r3
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
.L831:
	ldr	r3, [fp, #-48]
	add	r7, r7, #2
	cmp	r7, r3
	bne	.L829
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L869:
	rsb	r2, r4, #24
	rsb	r9, r4, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r9, r2, r9
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-52]
	add	r4, r2, r4
	str	r4, [r5, #32]
	orr	r0, r10, r0, asl r3
	str	r0, [r5, #28]
	mov	r10, r0
	b	.L799
.L768:
	rsb	r9, r4, #24
	rsb	r3, r4, #16
	bic	r9, r9, #7
	mov	r0, r5
	rsb	r3, r9, r3
	ldr	r10, [r5, #28]
	mov	r1, r9
	str	r3, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r9
	str	r4, [r5, #32]
	and	r3, r3, #7
	orr	r0, r10, r0, asl r3
	str	r0, [r5, #28]
	b	.L769
.L779:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L784
.L782:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L874
.L784:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L782
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L782
.L809:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L814
.L812:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L875
.L814:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L812
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L812
.L772:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L777
.L775:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L876
.L777:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L775
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L775
.L802:
	add	r3, r6, r8
	mov	r10, #0
	mov	r2, #3
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r5, #28]
	mov	r8, r8, asl r1
	mov	r10, r9
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	mov	r9, r2
	b	.L807
.L805:
	mov	r2, r8, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r5, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r8, r8, lr
	cmn	r9, #1
	add	r2, r6, r8
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r2
	rsb	r4, r2, r4
	mov	r8, r8, asl r2
	str	r10, [r5, #28]
	str	r4, [r5, #32]
	str	r8, [r5, #36]
	beq	.L877
.L807:
	sub	r8, r8, #1
	cmp	r4, #0
	ubfx	r8, r8, #1, #24
	mov	r0, r10
	add	r8, r8, #1
	bge	.L805
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	r2, r1, r2
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-56]
	and	r2, r2, #7
	orr	r0, r10, r0, asl r2
	b	.L805
.L877:
	mov	r10, r7
	ldr	r7, [fp, #-60]
.L808:
	ldrb	r2, [r7, #1951]	@ zero_extendqisi2
	add	r10, r6, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L823
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L824
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L824:
	add	r3, r3, #1
.L826:
	strb	r3, [r7, #1951]
	b	.L831
.L823:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L827
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L827:
	rsb	r3, r3, #255
	b	.L826
.L876:
	mov	r10, r7
	ldr	r7, [fp, #-60]
.L778:
	ldrb	r2, [r7, #1950]	@ zero_extendqisi2
	add	r10, r6, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L793
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L794
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L794:
	add	r3, r3, #1
.L796:
	strb	r3, [r7, #1950]
	ldr	r10, [r5, #28]
	ldr	r8, [r5, #36]
	ldr	r4, [r5, #32]
	b	.L830
.L793:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L797
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L797:
	rsb	r3, r3, #255
	b	.L796
.L875:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #16
	b	.L808
.L874:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #16
	b	.L778
.L868:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-60]
	bgt	.L878
	add	r10, r10, #64
	b	.L778
.L873:
	mov	r10, r7
	cmp	r10, #64
	ldr	r7, [fp, #-60]
	addle	r10, r10, #64
	ble	.L808
.L879:
	mov	r1, #128
	mov	r0, r5
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
	add	r10, r10, #64
	b	.L808
.L878:
	mov	r1, #128
	mov	r0, r5
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
	add	r10, r10, #64
	b	.L778
.L785:
	add	r3, r6, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r5, #36]
	mov	r4, r8
	str	r3, [r5, #28]
	str	r9, [r5, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L789
.L787:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r5, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r6, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L880
.L789:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L787
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L787
.L815:
	add	r3, r6, r8
	mov	r10, #0
	mov	ip, #4
	str	r7, [fp, #-60]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r7, r10
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r8, r8, asl r1
	rsb	r9, r1, r9
	str	r8, [r5, #36]
	mov	r4, r8
	str	r3, [r5, #28]
	str	r9, [r5, #32]
	mov	r10, r3
	mov	r8, ip
	b	.L819
.L817:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r8
	cmp	r1, r0
	sub	r8, r8, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r5, #36]
	movhi	ip, #0
	orr	r7, r7, ip
	rsbls	r4, r4, lr
	cmn	r8, #1
	add	r1, r6, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r10, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r10, [r5, #28]
	str	r9, [r5, #32]
	str	r4, [r5, #36]
	beq	.L881
.L819:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r10
	add	r4, r4, #1
	bge	.L817
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r5
	rsb	ip, r1, ip
	str	r2, [fp, #-56]
	str	ip, [fp, #-52]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	and	ip, ip, #7
	orr	r0, r10, r0, asl ip
	b	.L817
.L880:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #32
	b	.L778
.L881:
	mov	r10, r7
	ldr	r7, [fp, #-60]
	add	r10, r10, #32
	b	.L808
.L870:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L801
.L865:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L771
.L866:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L774
.L871:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r5
	rsb	r10, r3, r10
	str	r3, [fp, #-52]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-52]
	add	r4, r4, r3
	str	r4, [r5, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r5, #28]
	mov	r9, r0
	b	.L804
.L867:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r5, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r5, #28]
	mov	r4, r0
	b	.L781
.L872:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r5
	rsb	r10, r2, r10
	str	r2, [fp, #-52]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-52]
	add	r9, r9, r2
	str	r9, [r5, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r5, #28]
	mov	r4, r0
	b	.L811
.L883:
	.align	2
.L882:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_ReadSwitchableInterpProbs, .-Vp9_ReadSwitchableInterpProbs
	.align	2
	.global	Vp9_ReadCompPred
	.type	Vp9_ReadCompPred, %function
Vp9_ReadCompPred:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	cmp	r2, #0
	str	r0, [fp, #-56]
	mov	r6, r1
	str	r3, [fp, #-60]
	bne	.L1047
	ldr	r4, [r1, #28]
	ldr	r3, [r1, #36]
	ldr	r5, [r1, #32]
	ldr	r7, .L1077
	str	r2, [fp, #-52]
.L893:
	ldr	r2, [fp, #-56]
	mov	r9, r4
	mov	r10, r3
	add	r1, r2, #10
	str	r1, [fp, #-48]
	mov	r8, r2
.L956:
	sub	r10, r10, #1
	cmp	r5, #0
	mov	r2, r10, asl #8
	sub	r10, r2, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L1048
.L895:
	mov	r0, r10, asl #24
	cmp	r0, r9
	bhi	.L896
	ldr	r3, [r6, #36]
	rsb	r9, r0, r9
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	rsb	r4, r3, r5
	mov	r10, r10, asl r3
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1049
.L897:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L898
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1050
.L900:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L905
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L1051
.L907:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L911
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r3, #6
	str	r8, [fp, #-72]
	rsb	r5, r5, r1
	mov	r8, r7
	add	r1, r7, r5
	mov	r10, #0
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r7, r2
	b	.L912
.L916:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r8, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r7, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1052
.L912:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L916
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L916
.L896:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r9, r9, asl r3
	rsb	r4, r3, r5
	mov	r10, r10, asl r3
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
.L991:
	sub	r10, r10, #1
	cmp	r4, #0
	mov	r3, r10, asl #8
	sub	r10, r3, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L1053
.L925:
	mov	r0, r10, asl #24
	cmp	r0, r9
	bhi	.L926
	ldr	r3, [r6, #36]
	rsb	r9, r0, r9
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r4, r3, r4
	sub	r5, r10, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1054
.L927:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L928
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r5, r5, r2
	add	r3, r7, r5
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r5, asl r0
	rsb	r4, r0, r4
	sub	r5, r2, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1055
.L930:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L935
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L1056
.L937:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L941
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r3, #6
	str	r8, [fp, #-72]
	rsb	r5, r5, r1
	mov	r8, r7
	add	r1, r7, r5
	mov	r10, #0
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r7, r2
	b	.L942
.L946:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r8, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r7, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1057
.L942:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L946
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L946
.L926:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r9, r9, asl r3
	rsb	r4, r3, r4
	mov	r10, r10, asl r3
	str	r9, [r6, #28]
	str	r4, [r6, #32]
	str	r10, [r6, #36]
.L992:
	ldr	r3, [fp, #-48]
	add	r8, r8, #2
	cmp	r8, r3
	ldrne	r9, [r6, #28]
	ldrne	r10, [r6, #36]
	ldrne	r5, [r6, #32]
	bne	.L956
.L955:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L1058
.L987:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-52]
	str	r2, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1058:
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r5, [r6, #32]
.L894:
	ldr	r2, [fp, #-56]
	mov	r10, r3
	add	r8, r2, #1984
	add	r2, r2, #2000
	add	r8, r8, #14
	add	r2, r2, #3
	str	r2, [fp, #-48]
.L988:
	sub	r10, r10, #1
	cmp	r5, #0
	mov	r2, r10, asl #8
	sub	r10, r2, r10, asl #2
	mov	r10, r10, lsr #8
	add	r10, r10, #1
	blt	.L1059
.L957:
	mov	r9, r10, asl #24
	cmp	r9, r4
	bhi	.L958
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	rsb	r10, r10, r3
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r3
	rsb	r5, r3, r5
	sub	r4, r10, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r9, r9, asl r3
	str	r10, [r6, #36]
	add	r4, r4, #1
	str	r5, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1060
.L959:
	mov	r3, r4, asl #24
	cmp	r3, r9
	bhi	.L960
	ldr	r2, [r6, #36]
	rsb	r9, r3, r9
	rsb	r4, r4, r2
	add	r3, r7, r4
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r2, r4, asl r0
	rsb	r4, r0, r5
	cmp	r4, #0
	sub	r5, r2, #1
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r2, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1061
.L962:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L967
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r1, r5, asl r2
	rsb	r5, r2, r4
	sub	r9, r1, #1
	cmp	r5, #0
	ubfx	r9, r9, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r9, r9, #1
	str	r5, [r6, #32]
	str	r4, [r6, #28]
	blt	.L1062
.L969:
	mov	r3, r9, asl #24
	cmp	r3, r4
	bhi	.L973
	ldr	r1, [r6, #36]
	rsb	r0, r3, r4
	mov	r2, #6
	mov	r3, #0
	rsb	r4, r9, r1
	str	r8, [fp, #-68]
	add	r1, r7, r4
	mov	r8, r7
	mov	ip, #1
	mov	r7, r3
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	rsb	r10, r1, r5
	mov	r9, r0, asl r1
	mov	r4, r4, asl r1
	str	r9, [r6, #28]
	str	r10, [r6, #32]
	mov	r5, r2
	str	r4, [r6, #36]
	b	.L974
.L978:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r7, r7, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r8, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r2
	rsb	r10, r2, r10
	mov	r4, r4, asl r2
	str	r9, [r6, #28]
	str	r10, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1063
.L974:
	sub	r4, r4, #1
	cmp	r10, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r9
	add	r4, r4, #1
	bge	.L978
	rsb	r1, r10, #24
	rsb	r2, r10, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-56]
	add	r10, r1, r10
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r9, r0, asl r2
	b	.L978
.L935:
	add	r3, r7, r5
	mov	r2, #3
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r7, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L940
.L938:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r8, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r7, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1064
.L940:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r7
	add	r5, r5, #1
	bge	.L938
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L938
.L905:
	add	r3, r7, r5
	mov	r2, #3
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r7, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L910
.L908:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r8, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r7, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1065
.L910:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r7
	add	r5, r5, #1
	bge	.L908
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L908
.L958:
	add	r3, r7, r10
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	mov	r10, r10, asl r3
	str	r4, [r6, #28]
	str	r5, [r6, #32]
	str	r10, [r6, #36]
.L993:
	ldr	r3, [fp, #-48]
	add	r8, r8, #1
	cmp	r8, r3
	beq	.L987
	add	r4, r6, #28
	ldmia	r4, {r4, r5, r10}
	b	.L988
.L1053:
	rsb	r3, r4, #24
	rsb	r5, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r5, r3, r5
	str	r3, [fp, #-64]
	mov	r1, r3
	and	r5, r5, #7
	bl	BsGet
	ldr	r3, [fp, #-64]
	add	r4, r3, r4
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r5
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L925
.L1048:
	rsb	r2, r5, #24
	rsb	r4, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r4, r2, r4
	str	r2, [fp, #-64]
	mov	r1, r2
	bl	BsGet
	ldr	r2, [fp, #-64]
	and	r3, r4, #7
	add	r4, r2, r5
	str	r4, [r6, #32]
	mov	r5, r4
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L895
.L928:
	add	r3, r7, r5
	mov	r2, #3
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r7, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L933
.L931:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r8, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r7, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1066
.L933:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r7
	add	r5, r5, #1
	bge	.L931
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L931
.L898:
	add	r3, r7, r5
	mov	r2, #3
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r7, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L903
.L901:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r8, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r7, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1067
.L903:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r7
	add	r5, r5, #1
	bge	.L901
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-68]
	str	r2, [fp, #-64]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-68]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L901
.L1059:
	rsb	r3, r5, #24
	rsb	r9, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-56]
	mov	r1, r3
	and	r9, r9, #7
	bl	BsGet
	ldr	r3, [fp, #-56]
	add	r5, r3, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L957
.L1067:
	mov	r7, r8
	ldr	r8, [fp, #-72]
.L904:
	ldrb	r2, [r8, #1988]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L919
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L920
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L920:
	add	r3, r3, #1
.L922:
	strb	r3, [r8, #1988]
	ldr	r9, [r6, #28]
	ldr	r10, [r6, #36]
	ldr	r4, [r6, #32]
	b	.L991
.L919:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L923
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L923:
	rsb	r3, r3, #255
	b	.L922
.L1066:
	mov	r7, r8
	ldr	r8, [fp, #-72]
.L934:
	ldrb	r2, [r8, #1989]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L949
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L950
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L950:
	add	r3, r3, #1
.L952:
	strb	r3, [r8, #1989]
	b	.L992
.L949:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L953
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L953:
	rsb	r3, r3, #255
	b	.L952
.L960:
	add	r3, r7, r4
	mov	r2, #3
	str	r8, [fp, #-68]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #28]
	mov	r4, r4, asl r1
	mov	r7, r9
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	mov	r9, r2
	b	.L965
.L963:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r8, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r7, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1068
.L965:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L963
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-56]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L963
.L1068:
	mov	r7, r8
	ldr	r8, [fp, #-68]
.L966:
	ldrb	r2, [r8]	@ zero_extendqisi2
	add	r10, r7, r10
	sub	ip, r2, #1
	ldrb	r1, [r10, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L981
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L982
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L982:
	add	r3, r3, #1
.L984:
	strb	r3, [r8]
	b	.L993
.L981:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L985
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L985:
	rsb	r3, r3, #255
	b	.L984
.L1047:
	ldr	r8, [r1, #36]
	ldr	r5, [r1, #32]
	sub	r8, r8, #1
	cmp	r5, #0
	ubfx	r8, r8, #1, #24
	add	r8, r8, #1
	blt	.L886
	ldr	r0, [r1, #28]
.L887:
	mov	r4, r8, asl #24
	cmp	r4, r0
	bhi	.L888
	ldr	r3, [r6, #36]
	rsb	r4, r4, r0
	ldr	r7, .L1077
	mov	r1, #128
	rsb	r8, r8, r3
	mov	r0, r6
	add	r3, r7, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	mov	r8, r8, asl r3
	str	r4, [r6, #28]
	str	r5, [r6, #32]
	str	r8, [r6, #36]
	bl	Vp9_Cabac_Read
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r5, [r6, #32]
	add	r2, r0, #1
	str	r2, [fp, #-52]
	cmp	r2, #2
	bne	.L889
	ldr	r2, [fp, #-56]
	add	r10, r2, #1968
	add	r9, r2, #1984
	add	r10, r10, #15
	add	r9, r9, #4
	b	.L892
.L1070:
	ldr	r3, [r6, #36]
	rsb	r8, r8, r3
	add	r3, r7, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	rsb	r5, r3, r5
	mov	r2, r2, asl r3
	mov	r8, r8, asl r3
	str	r5, [r6, #32]
	str	r2, [r6, #28]
	str	r8, [r6, #36]
	bl	Vp9_DiffUpdateProb
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r5, [r6, #32]
.L990:
	add	r10, r10, #1
	cmp	r10, r9
	beq	.L893
.L892:
	sub	r8, r3, #1
	cmp	r5, #0
	mov	r3, r8, asl #8
	sub	r8, r3, r8, asl #2
	mov	r8, r8, lsr #8
	add	r8, r8, #1
	blt	.L1069
.L890:
	mov	r3, r8, asl #24
	mov	r1, r10
	cmp	r3, r4
	mov	r0, r6
	rsb	r2, r3, r4
	bls	.L1070
	add	r3, r7, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r5
	str	r4, [r6, #28]
	mov	r3, r8, asl r3
	str	r5, [r6, #32]
	str	r3, [r6, #36]
	b	.L990
.L1064:
	mov	r7, r8
	add	r10, r10, #16
	ldr	r8, [fp, #-72]
	b	.L934
.L1065:
	mov	r7, r8
	add	r10, r10, #16
	ldr	r8, [fp, #-72]
	b	.L904
.L1057:
	cmp	r10, #64
	mov	r7, r8
	ldr	r8, [fp, #-72]
	bgt	.L1071
.L948:
	add	r10, r10, #64
	b	.L934
.L1052:
	cmp	r10, #64
	mov	r7, r8
	ldr	r8, [fp, #-72]
	bgt	.L1072
.L918:
	add	r10, r10, #64
	b	.L904
.L967:
	add	r3, r7, r5
	mov	r2, #3
	str	r8, [fp, #-68]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r7, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L972
.L970:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r8, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r7, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1073
.L972:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r7
	add	r5, r5, #1
	bge	.L970
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-56]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L970
.L1078:
	.align	2
.L1077:
	.word	.LANCHOR0
.L888:
	ldr	r7, .L1077
	mov	r3, #0
	str	r3, [fp, #-52]
	add	r3, r7, r8
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r0, asl r3
	rsb	r5, r3, r5
	str	r4, [r6, #28]
	mov	r3, r8, asl r3
	str	r5, [r6, #32]
	str	r3, [r6, #36]
	b	.L893
.L1071:
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
	b	.L948
.L1072:
	mov	r1, #128
	mov	r0, r6
	bl	Vp9_Cabac_Read
	add	r0, r0, r10, lsl #1
	sub	r10, r0, #65
	b	.L918
.L1073:
	mov	r7, r8
	add	r10, r10, #16
	ldr	r8, [fp, #-68]
	b	.L966
.L1069:
	rsb	r2, r5, #24
	rsb	r3, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r3, r2, r3
	str	r2, [fp, #-48]
	mov	r1, r2
	str	r3, [fp, #-64]
	bl	BsGet
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-48]
	and	r3, r3, #7
	add	r5, r2, r5
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L890
.L1063:
	mov	r3, r7
	cmp	r3, #64
	mov	r7, r8
	ldr	r8, [fp, #-68]
	movle	r10, r3
	ble	.L980
	mov	r1, #128
	mov	r0, r6
	str	r3, [fp, #-56]
	bl	Vp9_Cabac_Read
	ldr	r3, [fp, #-56]
	add	r0, r0, r3, lsl #1
	sub	r10, r0, #65
.L980:
	add	r10, r10, #64
	b	.L966
.L911:
	add	r3, r7, r5
	mov	ip, #4
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r5, ip
	mov	r7, r3
	b	.L915
.L913:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r10, r10, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r8, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r7, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1074
.L915:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L913
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-68]
	str	ip, [fp, #-64]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-64]
	ldr	r2, [fp, #-68]
	and	ip, ip, #7
	orr	r0, r7, r0, asl ip
	b	.L913
.L941:
	add	r3, r7, r5
	mov	ip, #4
	str	r8, [fp, #-72]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	r2, #1
	mov	r3, r4, asl r1
	mov	r5, r5, asl r1
	rsb	r9, r1, r9
	str	r5, [r6, #36]
	mov	r4, r5
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r5, ip
	mov	r7, r3
	b	.L945
.L943:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r10, r10, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r8, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r7, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1075
.L945:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L943
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-68]
	str	ip, [fp, #-64]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-64]
	ldr	r2, [fp, #-68]
	and	ip, ip, #7
	orr	r0, r7, r0, asl ip
	b	.L943
.L1075:
	mov	r7, r8
	add	r10, r10, #32
	ldr	r8, [fp, #-72]
	b	.L934
.L1074:
	mov	r7, r8
	add	r10, r10, #32
	ldr	r8, [fp, #-72]
	b	.L904
.L1054:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-64]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-64]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L927
.L1049:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-64]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-64]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L897
.L973:
	add	r3, r7, r9
	mov	r2, #4
	str	r8, [fp, #-68]
	mov	r10, #0
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r8, r7
	mov	ip, #1
	mov	r3, r4, asl r1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #36]
	mov	r4, r9
	str	r3, [r6, #28]
	str	r5, [r6, #32]
	mov	r9, r2
	mov	r7, r3
	b	.L977
.L975:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r8, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r7, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r7, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1076
.L977:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r7
	add	r4, r4, #1
	bge	.L975
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-56]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r7, r0, asl r2
	b	.L975
.L1076:
	mov	r7, r8
	add	r10, r10, #32
	ldr	r8, [fp, #-68]
	b	.L966
.L1060:
	rsb	r2, r5, #24
	rsb	r10, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-56]
	add	r5, r5, r2
	str	r5, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L959
.L1050:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-64]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-64]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L900
.L1055:
	rsb	r3, r4, #24
	rsb	r10, r4, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r10, r3, r10
	str	r3, [fp, #-64]
	mov	r1, r3
	and	r10, r10, #7
	bl	BsGet
	ldr	r3, [fp, #-64]
	add	r4, r4, r3
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r10
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L930
.L1061:
	rsb	r2, r4, #24
	rsb	r10, r4, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-56]
	add	r4, r4, r2
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L962
.L1056:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-64]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-64]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L937
.L1051:
	rsb	r2, r9, #24
	rsb	r10, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-64]
	mov	r1, r2
	bl	BsGet
	and	r3, r10, #7
	ldr	r2, [fp, #-64]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L907
.L1062:
	rsb	r2, r5, #24
	rsb	r10, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r10, r2, r10
	str	r2, [fp, #-56]
	mov	r1, r2
	bl	BsGet
	ldr	r2, [fp, #-56]
	and	r3, r10, #7
	add	r10, r5, r2
	str	r10, [r6, #32]
	mov	r5, r10
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L969
.L886:
	rsb	r7, r5, #24
	ldr	r4, [r1, #28]
	bic	r7, r7, #7
	mov	r0, r1
	rsb	r9, r5, #16
	add	r5, r5, r7
	mov	r1, r7
	rsb	r9, r7, r9
	bl	BsGet
	and	r9, r9, #7
	str	r5, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	b	.L887
.L889:
	ldr	r2, [fp, #-52]
	cmp	r2, #1
	beq	.L894
	b	.L893
	UNWIND(.fnend)
	.size	Vp9_ReadCompPred, .-Vp9_ReadCompPred
	.align	2
	.global	Vp9_ReadMvProbs
	.type	Vp9_ReadMvProbs, %function
Vp9_ReadMvProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	ldr	r4, [r0, #36]
	ldr	r5, [r0, #32]
	mov	r3, r1
	ldr	r6, [r0, #28]
	mov	ip, r0
	mov	r9, r3
	mov	r7, r0
	str	r1, [fp, #-76]
	add	r1, r1, #3
	str	r2, [fp, #-80]
	str	r1, [fp, #-48]
	str	r3, [fp, #-84]
.L1085:
	sub	r3, r4, #1
	cmp	r5, #0
	mov	r4, r3, asl #8
	sub	r3, r4, r3, asl #2
	mov	r3, r3, lsr #8
	add	r4, r3, #1
	blt	.L1184
.L1080:
	mov	r2, r4, asl #24
	cmp	r2, r6
	bhi	.L1081
	ldr	r3, [r7, #36]
	rsb	r6, r2, r6
	ldr	r1, .L1202
	mov	r10, #0
	rsb	r3, r4, r3
	mov	r8, #6
	add	r1, r1, r3
	mov	r2, #1
	str	r9, [fp, #-56]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r4
	rsb	r5, r4, r5
	str	r6, [r7, #28]
	mov	r4, r3, asl r4
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1084
.L1082:
	mov	r3, r4, asl #24
	mov	r1, r2, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, ip
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1185
.L1084:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r6
	add	r4, r4, #1
	bge	.L1082
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	str	r2, [fp, #-52]
	rsb	r9, r1, r3
	add	r5, r1, r5
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-52]
	orr	r0, r6, r0, asl r3
	b	.L1082
.L1081:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1138:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	cmp	r9, r3
	bne	.L1085
	ldr	r3, [fp, #-76]
	mov	ip, r7
	add	r2, r3, #25
	add	r3, r3, #91
	str	r2, [fp, #-48]
	str	r3, [fp, #-64]
.L1108:
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1186
.L1086:
	mov	r2, r4, asl #24
	cmp	r2, r6
	bhi	.L1087
	ldr	r3, [r7, #36]
	rsb	r6, r2, r6
	mov	r9, #0
	mov	r8, #6
	rsb	r4, r4, r3
	ldr	r3, .L1202
	mov	r10, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1090
.L1088:
	mov	r3, r4, asl #24
	mov	r2, r10, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	r1, [r7, #36]
	movhi	r2, #0
	orr	r9, r9, r2
	rsbls	r4, r4, r1
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1187
.L1090:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r6
	add	r4, r4, #1
	bge	.L1088
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	rsb	r3, r1, r3
	add	r5, r1, r5
	str	r3, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-52]
	and	r3, r3, #7
	orr	r0, r6, r0, asl r3
	b	.L1088
.L1185:
	ldr	r9, [fp, #-56]
	mov	r3, r10, asl #1
	orr	r3, r3, #1
	strb	r3, [r9]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1138
.L1087:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1139:
	ldr	r3, [fp, #-48]
	sub	r10, r3, #21
	sub	r3, r3, #11
	str	r3, [fp, #-52]
	mov	r9, r10
.L1096:
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1188
.L1091:
	mov	r2, r4, asl #24
	cmp	r2, r6
	bhi	.L1092
	ldr	r3, [r7, #36]
	rsb	r6, r2, r6
	ldr	r1, .L1202
	mov	r10, #0
	rsb	r3, r4, r3
	mov	r8, #6
	add	r1, r1, r3
	mov	r2, #1
	str	r9, [fp, #-60]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r4
	rsb	r5, r4, r5
	str	r6, [r7, #28]
	mov	r4, r3, asl r4
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1095
.L1093:
	mov	r3, r4, asl #24
	mov	r1, r2, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, ip
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1189
.L1095:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r6
	add	r4, r4, #1
	bge	.L1093
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	str	r2, [fp, #-56]
	rsb	r9, r1, r3
	add	r5, r1, r5
	bl	BsGet
	and	r3, r9, #7
	ldr	r2, [fp, #-56]
	orr	r0, r6, r0, asl r3
	b	.L1093
.L1092:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1140:
	ldr	r3, [fp, #-52]
	add	r9, r9, #1
	cmp	r9, r3
	bne	.L1096
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1190
.L1097:
	mov	r2, r4, asl #24
	cmp	r2, r6
	bhi	.L1098
	ldr	r3, [r7, #36]
	rsb	r6, r2, r6
	mov	r9, #0
	mov	r8, #6
	rsb	r4, r4, r3
	ldr	r3, .L1202
	mov	r10, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1101
.L1099:
	mov	r3, r4, asl #24
	mov	r2, r10, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	r1, [r7, #36]
	movhi	r2, #0
	orr	r9, r9, r2
	rsbls	r4, r4, r1
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1191
.L1101:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r6
	add	r4, r4, #1
	bge	.L1099
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	rsb	r3, r1, r3
	add	r5, r1, r5
	str	r3, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-52]
	and	r3, r3, #7
	orr	r0, r6, r0, asl r3
	b	.L1099
.L1189:
	ldr	r9, [fp, #-60]
	mov	r10, r10, asl #1
	orr	r10, r10, #1
	strb	r10, [r9]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1140
.L1188:
	rsb	r10, r5, #24
	mov	r0, r7
	bic	r10, r10, #7
	rsb	r8, r5, #16
	rsb	r8, r10, r8
	add	r5, r10, r5
	mov	r1, r10
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1091
.L1098:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1141:
	ldr	r3, [fp, #-48]
	sub	r2, r3, #10
	mov	r9, r2
.L1107:
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1192
.L1102:
	mov	r1, r4, asl #24
	cmp	r1, r6
	bhi	.L1103
	ldr	r3, [r7, #36]
	rsb	r6, r1, r6
	ldr	r2, .L1202
	mov	r10, #0
	rsb	r3, r4, r3
	mov	r8, #6
	add	r1, r2, r3
	mov	ip, #1
	str	r9, [fp, #-56]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r4
	rsb	r5, r4, r5
	str	r6, [r7, #28]
	mov	r4, r3, asl r4
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1106
.L1104:
	mov	r3, r4, asl #24
	mov	r2, ip, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	r1, [r7, #36]
	movhi	r2, #0
	orr	r10, r10, r2
	rsbls	r4, r4, r1
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1193
.L1106:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r6
	add	r4, r4, #1
	bge	.L1104
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	str	ip, [fp, #-52]
	rsb	r9, r1, r3
	add	r5, r1, r5
	bl	BsGet
	and	r3, r9, #7
	ldr	ip, [fp, #-52]
	orr	r0, r6, r0, asl r3
	b	.L1104
.L1103:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1142:
	ldr	r3, [fp, #-48]
	add	r9, r9, #1
	cmp	r9, r3
	bne	.L1107
	ldr	r2, [fp, #-64]
	add	r3, r9, #33
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L1108
	ldr	r3, [fp, #-76]
	mov	r10, #1
	add	r2, r3, #31
	add	r3, r3, #97
	str	r2, [fp, #-68]
	str	r3, [fp, #-72]
.L1109:
	ldr	r3, [fp, #-68]
	sub	r3, r3, #6
	str	r3, [fp, #-48]
	mov	r3, #2
	str	r3, [fp, #-64]
.L1124:
	ldr	ip, [fp, #-48]
	mov	r2, #0
.L1115:
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1194
.L1110:
	mov	r1, r4, asl #24
	cmp	r1, r6
	bhi	.L1111
	ldr	r3, [r7, #36]
	rsb	r6, r1, r6
	ldr	r1, .L1202
	mov	r9, #0
	rsb	r3, r4, r3
	mov	r8, #6
	add	r1, r1, r3
	str	r2, [fp, #-56]
	str	ip, [fp, #-60]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r4
	rsb	r5, r4, r5
	mov	r4, r3, asl r4
	str	r6, [r7, #28]
	mov	r3, r6
	str	r5, [r7, #32]
	mov	r6, r9
	str	r4, [r7, #36]
	mov	r9, r3
	b	.L1114
.L1112:
	mov	r3, r4, asl #24
	mov	r1, r10, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r6, r6, r1
	rsbls	r4, r4, ip
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r9, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1195
.L1114:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r9
	add	r4, r4, #1
	bge	.L1112
	rsb	r1, r5, #24
	rsb	ip, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	rsb	ip, r1, ip
	add	r5, r1, r5
	str	ip, [fp, #-52]
	bl	BsGet
	ldr	ip, [fp, #-52]
	and	ip, ip, #7
	orr	r0, r9, r0, asl ip
	b	.L1112
.L1193:
	ldr	r9, [fp, #-56]
	mov	r10, r10, asl #1
	orr	r10, r10, #1
	strb	r10, [r9]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1142
.L1111:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
.L1143:
	add	r2, r2, #1
	add	ip, ip, #1
	cmp	r2, #3
	bne	.L1115
	ldr	r3, [fp, #-64]
	subs	r3, r3, #1
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-48]
	add	r3, r3, #3
	str	r3, [fp, #-48]
	bne	.L1124
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-68]
.L1116:
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r1, r4, asl #8
	sub	r4, r1, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1196
.L1117:
	mov	r0, r4, asl #24
	cmp	r0, r6
	bhi	.L1118
	ldr	r1, [r7, #36]
	rsb	r6, r0, r6
	ldr	r0, .L1202
	mov	r9, #0
	rsb	r1, r4, r1
	str	r3, [fp, #-52]
	add	r0, r0, r1
	mov	r8, #6
	str	r2, [fp, #-56]
	ldrb	r4, [r0, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r4
	rsb	r5, r4, r5
	str	r6, [r7, #28]
	mov	r4, r1, asl r4
	mov	r3, r6
	str	r5, [r7, #32]
	mov	r6, r9
	str	r4, [r7, #36]
	mov	r9, r3
	b	.L1121
.L1119:
	mov	r3, r4, asl #24
	mov	r1, r10, asl r8
	cmp	r3, r0
	sub	r8, r8, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r6, r6, r1
	rsbls	r4, r4, ip
	cmn	r8, #1
	add	r3, r3, r4
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r9, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1197
.L1121:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r9
	add	r4, r4, #1
	bge	.L1119
	rsb	r1, r5, #24
	rsb	ip, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	rsb	ip, r1, ip
	add	r5, r1, r5
	str	ip, [fp, #-48]
	bl	BsGet
	ldr	ip, [fp, #-48]
	and	ip, ip, #7
	orr	r0, r9, r0, asl ip
	b	.L1119
.L1195:
	ldr	ip, [fp, #-60]
	mov	r9, r6, asl #1
	orr	r9, r9, #1
	ldr	r2, [fp, #-56]
	strb	r9, [ip]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1143
.L1192:
	rsb	r10, r5, #24
	mov	r0, r7
	bic	r10, r10, #7
	rsb	r8, r5, #16
	rsb	r8, r10, r8
	add	r5, r10, r5
	mov	r1, r10
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1102
.L1118:
	ldr	r1, .L1202
	add	r3, r3, #1
	cmp	r3, #3
	add	r2, r2, #1
	add	r1, r1, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r6, r6, asl r1
	rsb	r5, r1, r5
	mov	r4, r4, asl r1
	str	r6, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1122
.L1198:
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1116
.L1197:
	ldr	r3, [fp, #-52]
	mov	r9, r6, asl #1
	ldr	r2, [fp, #-56]
	orr	r9, r9, #1
	add	r3, r3, #1
	cmp	r3, #3
	add	r2, r2, #1
	strb	r9, [r2, #-1]
	bne	.L1198
.L1122:
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-72]
	add	r3, r3, #33
	str	r3, [fp, #-68]
	cmp	r3, r2
	beq	.L1123
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1109
.L1194:
	rsb	r9, r5, #24
	mov	r0, r7
	bic	r9, r9, #7
	str	ip, [fp, #-56]
	str	r2, [fp, #-52]
	rsb	r8, r5, #16
	mov	r1, r9
	rsb	r8, r9, r8
	bl	BsGet
	and	r8, r8, #7
	add	r5, r9, r5
	ldr	ip, [fp, #-56]
	str	r5, [r7, #32]
	ldr	r2, [fp, #-52]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1110
.L1196:
	rsb	r9, r5, #24
	mov	r0, r7
	bic	r9, r9, #7
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	rsb	r8, r5, #16
	mov	r1, r9
	rsb	r8, r9, r8
	bl	BsGet
	and	r8, r8, #7
	add	r5, r9, r5
	ldr	r2, [fp, #-52]
	str	r5, [r7, #32]
	ldr	r3, [fp, #-48]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1117
.L1191:
	ldr	r2, [fp, #-48]
	mov	r3, r9, asl #1
	orr	r3, r3, #1
	strb	r3, [r2, #-11]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1141
.L1187:
	ldr	r2, [fp, #-48]
	mov	r3, r9, asl #1
	orr	r3, r3, #1
	strb	r3, [r2, #-22]
	ldr	r4, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r6, [r7, #28]
	b	.L1139
.L1123:
	ldr	r3, [fp, #-80]
	mov	ip, r7
	cmp	r3, #0
	beq	.L1079
	ldr	r3, [fp, #-76]
	add	r6, r3, #66
	str	r6, [fp, #-48]
	ldr	r6, [fp, #-84]
.L1136:
	ldr	r3, [r7, #36]
	ldr	r5, [r7, #32]
	sub	r2, r3, #1
	cmp	r5, #0
	mov	r3, r2, asl #8
	sub	r3, r3, r2, asl #2
	mov	r3, r3, lsr #8
	add	r4, r3, #1
	blt	.L1125
	ldr	r8, [r7, #28]
.L1126:
	mov	r2, r4, asl #24
	cmp	r2, r8
	bhi	.L1127
	ldr	r3, [r7, #36]
	rsb	r8, r2, r8
	ldr	r1, .L1202
	mov	r10, #0
	rsb	r3, r4, r3
	mov	r9, #6
	add	r1, r1, r3
	mov	r2, #1
	str	r6, [fp, #-56]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r4
	rsb	r5, r4, r5
	str	r8, [r7, #28]
	mov	r4, r3, asl r4
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1130
.L1128:
	mov	r3, r4, asl #24
	mov	r1, r2, asl r9
	cmp	r3, r0
	sub	r9, r9, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, ip
	cmn	r9, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r8, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1199
.L1130:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1128
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	str	r2, [fp, #-52]
	rsb	r6, r1, r3
	add	r5, r1, r5
	bl	BsGet
	and	r3, r6, #7
	ldr	r2, [fp, #-52]
	orr	r0, r8, r0, asl r3
	b	.L1128
.L1132:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r3
	rsb	r5, r3, r5
	str	r8, [r7, #28]
	mov	r3, r4, asl r3
	str	r5, [r7, #32]
	str	r3, [r7, #36]
.L1146:
	ldr	r3, [fp, #-48]
	add	r6, r6, #33
	cmp	r6, r3
	bne	.L1136
.L1079:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1127:
	ldr	r3, .L1202
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r3
	rsb	r5, r3, r5
	str	r8, [r7, #28]
	mov	r3, r4, asl r3
	str	r5, [r7, #32]
	str	r3, [r7, #36]
.L1145:
	sub	r3, r3, #1
	cmp	r5, #0
	mov	r2, r3, asl #8
	sub	r3, r2, r3, asl #2
	mov	r3, r3, lsr #8
	add	r4, r3, #1
	blt	.L1200
.L1131:
	mov	r2, r4, asl #24
	cmp	r2, r8
	bhi	.L1132
	ldr	r3, [r7, #36]
	rsb	r8, r2, r8
	ldr	r1, .L1202
	mov	r10, #0
	rsb	r3, r4, r3
	mov	r9, #6
	add	r1, r1, r3
	mov	r2, #1
	str	r6, [fp, #-56]
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r8, r8, asl r4
	rsb	r5, r4, r5
	str	r8, [r7, #28]
	mov	r4, r3, asl r4
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	b	.L1135
.L1133:
	mov	r3, r4, asl #24
	mov	r1, r2, asl r9
	cmp	r3, r0
	sub	r9, r9, #1
	rsbls	r0, r3, r0
	ldr	r3, .L1202
	ldrls	ip, [r7, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, ip
	cmn	r9, #1
	add	r3, r3, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r3
	rsb	r5, r3, r5
	mov	r4, r4, asl r3
	str	r8, [r7, #28]
	str	r5, [r7, #32]
	str	r4, [r7, #36]
	beq	.L1201
.L1135:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1133
	rsb	r1, r5, #24
	rsb	r3, r5, #16
	bic	r1, r1, #7
	mov	r0, r7
	str	r2, [fp, #-52]
	rsb	r6, r1, r3
	add	r5, r1, r5
	bl	BsGet
	and	r3, r6, #7
	ldr	r2, [fp, #-52]
	orr	r0, r8, r0, asl r3
	b	.L1133
.L1201:
	ldr	r6, [fp, #-56]
	mov	r3, r10, asl #1
	orr	r3, r3, #1
	strb	r3, [r6, #35]
	b	.L1146
.L1199:
	ldr	r6, [fp, #-56]
	mov	r3, r10, asl #1
	orr	r3, r3, #1
	strb	r3, [r6, #34]
	ldr	r3, [r7, #36]
	ldr	r5, [r7, #32]
	ldr	r8, [r7, #28]
	b	.L1145
.L1184:
	rsb	r10, r5, #24
	mov	r0, r7
	bic	r10, r10, #7
	rsb	r8, r5, #16
	rsb	r8, r10, r8
	add	r5, r10, r5
	mov	r1, r10
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1080
.L1190:
	rsb	r9, r5, #24
	mov	r0, r7
	bic	r9, r9, #7
	rsb	r8, r5, #16
	rsb	r8, r9, r8
	add	r5, r9, r5
	mov	r1, r9
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1097
.L1186:
	rsb	r9, r5, #24
	mov	r0, r7
	bic	r9, r9, #7
	rsb	r8, r5, #16
	rsb	r8, r9, r8
	add	r5, r9, r5
	mov	r1, r9
	and	r8, r8, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r6, r0, asl r8
	str	r0, [r7, #28]
	mov	r6, r0
	b	.L1086
.L1125:
	rsb	r9, r5, #24
	mov	r0, r7
	bic	r9, r9, #7
	ldr	r8, [r7, #28]
	rsb	r10, r5, #16
	add	r5, r5, r9
	mov	r1, r9
	rsb	r10, r9, r10
	bl	BsGet
	and	r10, r10, #7
	str	r5, [r7, #32]
	orr	r0, r8, r0, asl r10
	str	r0, [r7, #28]
	mov	r8, r0
	b	.L1126
.L1200:
	rsb	r10, r5, #24
	mov	r0, r7
	bic	r10, r10, #7
	rsb	r9, r5, #16
	rsb	r9, r10, r9
	add	r5, r10, r5
	mov	r1, r10
	and	r9, r9, #7
	bl	BsGet
	str	r5, [r7, #32]
	orr	r0, r8, r0, asl r9
	str	r0, [r7, #28]
	mov	r8, r0
	b	.L1131
.L1203:
	.align	2
.L1202:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Vp9_ReadMvProbs, .-Vp9_ReadMvProbs
	.align	2
	.global	Vp9_PrepareReadModeInfo
	.type	Vp9_PrepareReadModeInfo, %function
Vp9_PrepareReadModeInfo:
	UNWIND(.fnstart)
	@ args = 16, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	add	r10, r0, #2000
	add	r10, r10, #15
	ldr	r7, .L1354
	str	r0, [fp, #-72]
	mov	r6, r1
	add	r0, r0, #2016
	mov	r8, r10
	add	r0, r0, #2
	mov	r9, r3
	str	r0, [fp, #-76]
	mov	r3, #0
	str	r2, [fp, #-56]
	str	r3, [fp, #-48]
.L1208:
	ldr	r4, [r6, #36]
	ldr	r5, [r6, #32]
	sub	r4, r4, #1
	cmp	r5, #0
	mov	r2, r4, asl #8
	sub	r4, r2, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1205
	ldr	r10, [r6, #28]
.L1206:
	mov	ip, r4, asl #24
	mov	r1, r8
	cmp	ip, r10
	mov	r0, r6
	rsb	r2, ip, r10
	bhi	.L1207
	ldr	ip, [r6, #36]
	rsb	r4, r4, ip
	add	ip, r7, r4
	ldrb	ip, [ip, #24]	@ zero_extendqisi2
	mov	r2, r2, asl ip
	rsb	r5, ip, r5
	mov	r4, r4, asl ip
	str	r2, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	bl	Vp9_DiffUpdateProb
.L1285:
	ldr	r3, [fp, #-76]
	add	r8, r8, #1
	cmp	r8, r3
	bne	.L1208
	ldr	r8, [fp, #-56]
	adds	r8, r8, #0
	movne	r8, #1
	cmp	r9, #0
	movne	r8, #0
	cmp	r8, #0
	bne	.L1331
.L1209:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #16]
	str	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1207:
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r10, r10, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r10, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	b	.L1285
.L1205:
	rsb	r2, r5, #24
	rsb	ip, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	ip, r2, ip
	ldr	r10, [r6, #28]
	mov	r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	bl	BsGet
	ldr	ip, [fp, #-64]
	ldr	r2, [fp, #-60]
	and	ip, ip, #7
	add	r5, r5, r2
	str	r5, [r6, #32]
	orr	r0, r10, r0, asl ip
	str	r0, [r6, #28]
	mov	r10, r0
	b	.L1206
.L1331:
	mov	r1, r6
	ldr	r0, [fp, #-72]
	bl	Vp9_ReadInterModeProbs
	ldr	r3, [fp, #4]
	cmp	r3, #4
	beq	.L1332
.L1210:
	ldr	r3, [fp, #-72]
	add	r10, r3, #1968
	mov	r3, r10
	add	r3, r3, #15
	add	r10, r10, #11
	mov	r5, r3
.L1214:
	ldr	r4, [r6, #36]
	ldr	r8, [r6, #32]
	sub	r4, r4, #1
	cmp	r8, #0
	mov	r3, r4, asl #8
	sub	r4, r3, r4, asl #2
	mov	r4, r4, lsr #8
	add	r4, r4, #1
	blt	.L1211
	ldr	r3, [r6, #28]
.L1212:
	mov	r2, r4, asl #24
	mov	r1, r10
	cmp	r2, r3
	mov	r0, r6
	rsb	ip, r2, r3
	bhi	.L1213
	ldr	r3, [r6, #36]
	rsb	r4, r4, r3
	add	r3, r7, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	ip, ip, asl r3
	rsb	r8, r3, r8
	mov	r4, r4, asl r3
	str	ip, [r6, #28]
	str	r8, [r6, #32]
	str	r4, [r6, #36]
	bl	Vp9_DiffUpdateProb
.L1286:
	add	r10, r10, #1
	cmp	r10, r5
	bne	.L1214
	ldr	ip, [fp, #-72]
	sub	r3, fp, #48
	ldr	r2, [fp, #8]
	mov	r1, r6
	add	lr, ip, #1728
	mov	r0, ip
	add	ip, ip, #1760
	mov	r4, lr
	mov	r5, ip
	bl	Vp9_ReadCompPred
	add	r3, r4, #9
	mov	lr, r4
	add	r4, r6, #28
	str	r3, [fp, #-56]
	add	r3, r5, #13
	str	r3, [fp, #-80]
	ldmia	r4, {r4, r5, r9}
	mov	r8, r5
.L1215:
	ldr	r3, [fp, #-56]
	sub	r10, r3, #9
.L1248:
	sub	r5, r9, #1
	cmp	r8, #0
	mov	r3, r5, asl #8
	sub	r5, r3, r5, asl #2
	mov	r5, r5, lsr #8
	add	r5, r5, #1
	blt	.L1333
.L1216:
	mov	r9, r5, asl #24
	cmp	r9, r4
	bhi	.L1217
	ldr	r3, [r6, #36]
	rsb	r9, r9, r4
	rsb	r5, r5, r3
	add	r3, r7, r5
	ldrb	r2, [r3, #24]	@ zero_extendqisi2
	mov	r3, r5, asl r2
	rsb	r5, r2, r8
	sub	r4, r3, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r9, r9, asl r2
	str	r3, [r6, #36]
	add	r4, r4, #1
	str	r5, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1334
.L1218:
	mov	r2, r4, asl #24
	cmp	r2, r9
	bhi	.L1219
	ldr	r3, [r6, #36]
	rsb	r9, r2, r9
	rsb	r4, r4, r3
	add	r3, r7, r4
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	r3, r4, asl r0
	rsb	r4, r0, r5
	cmp	r4, #0
	sub	r5, r3, #1
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	r3, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1335
.L1221:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L1226
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	rsb	r9, r2, r4
	mov	r1, r5, asl r2
	sub	r5, r1, #1
	cmp	r9, #0
	ubfx	r5, r5, #1, #24
	mov	r4, r3, asl r2
	str	r1, [r6, #36]
	add	r5, r5, #1
	str	r9, [r6, #32]
	str	r4, [r6, #28]
	blt	.L1336
.L1228:
	mov	r2, r5, asl #24
	cmp	r2, r4
	bhi	.L1232
	ldr	r1, [r6, #36]
	rsb	r2, r2, r4
	mov	r8, #0
	mov	r3, #6
	rsb	r5, r5, r1
	str	r10, [fp, #-68]
	add	r1, r7, r5
	mov	r10, r8
	mov	ip, #1
	ldrb	r4, [r1, #24]	@ zero_extendqisi2
	mov	r2, r2, asl r4
	rsb	r9, r4, r9
	str	r2, [r6, #28]
	mov	r4, r5, asl r4
	str	r9, [r6, #32]
	mov	r5, r3
	str	r4, [r6, #36]
	mov	r8, r2
	b	.L1233
.L1237:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r9, r2, r9
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1337
.L1233:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1237
	rsb	r1, r9, #24
	rsb	r2, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1237
.L1217:
	add	r3, r7, r5
	ldrb	r9, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r9
	rsb	r8, r9, r8
	str	r4, [r6, #28]
	mov	r9, r5, asl r9
	str	r8, [r6, #32]
	str	r9, [r6, #36]
.L1287:
	ldr	r3, [fp, #-56]
	add	r10, r10, #1
	cmp	r10, r3
	bne	.L1248
	ldr	r2, [fp, #-80]
	add	r3, r10, #9
	str	r3, [fp, #-56]
	cmp	r3, r2
	bne	.L1215
	ldr	r3, [fp, #-72]
	add	r2, r3, #1888
	add	r3, r3, #1936
	add	r3, r3, #14
	str	r3, [fp, #-64]
	mov	r3, r9
	add	r2, r2, #14
	str	r2, [fp, #-60]
.L1249:
	ldr	r2, [fp, #-60]
	mov	r10, #0
	mov	r9, r3
	str	r2, [fp, #-56]
.L1284:
	sub	r9, r9, #1
	cmp	r8, #0
	mov	r2, r9, asl #8
	sub	r9, r2, r9, asl #2
	mov	r9, r9, lsr #8
	add	r9, r9, #1
	blt	.L1338
.L1250:
	mov	r0, r9, asl #24
	cmp	r0, r4
	bhi	.L1251
	ldr	r3, [r6, #36]
	rsb	r0, r0, r4
	rsb	r3, r9, r3
	add	r2, r7, r3
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r3, r3, asl r2
	rsb	r5, r2, r8
	sub	r4, r3, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r9, r0, asl r2
	str	r3, [r6, #36]
	add	r4, r4, #1
	str	r5, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1339
.L1252:
	mov	r2, r4, asl #24
	cmp	r2, r9
	bhi	.L1253
	ldr	ip, [r6, #36]
	rsb	r9, r2, r9
	rsb	r4, r4, ip
	add	r3, r7, r4
	ldrb	r0, [r3, #24]	@ zero_extendqisi2
	mov	ip, r4, asl r0
	rsb	r4, r0, r5
	cmp	r4, #0
	sub	r5, ip, #1
	ubfx	r5, r5, #1, #24
	mov	r9, r9, asl r0
	str	ip, [r6, #36]
	add	r5, r5, #1
	str	r4, [r6, #32]
	str	r9, [r6, #28]
	blt	.L1340
.L1255:
	mov	r3, r5, asl #24
	cmp	r3, r9
	bhi	.L1260
	ldr	r1, [r6, #36]
	rsb	r3, r3, r9
	rsb	r5, r5, r1
	add	r2, r7, r5
	ldrb	ip, [r2, #24]	@ zero_extendqisi2
	mov	r1, r5, asl ip
	rsb	r5, ip, r4
	sub	r9, r1, #1
	cmp	r5, #0
	ubfx	r9, r9, #1, #24
	mov	r4, r3, asl ip
	str	r1, [r6, #36]
	add	r9, r9, #1
	str	r5, [r6, #32]
	str	r4, [r6, #28]
	blt	.L1341
.L1262:
	mov	r3, r9, asl #24
	cmp	r3, r4
	bhi	.L1266
	ldr	r1, [r6, #36]
	rsb	r0, r3, r4
	mov	r2, #6
	mov	r3, #0
	rsb	r4, r9, r1
	str	r10, [fp, #-80]
	add	r1, r7, r4
	mov	ip, #1
	mov	r10, r3
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	rsb	r8, r1, r5
	mov	r9, r0, asl r1
	mov	r4, r4, asl r1
	str	r9, [r6, #28]
	str	r8, [r6, #32]
	mov	r5, r2
	str	r4, [r6, #36]
	b	.L1267
.L1271:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r5
	cmp	r2, r0
	sub	r5, r5, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r2
	rsb	r8, r2, r8
	mov	r4, r4, asl r2
	str	r9, [r6, #28]
	str	r8, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1342
.L1267:
	sub	r4, r4, #1
	cmp	r8, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r9
	add	r4, r4, #1
	bge	.L1271
	rsb	r1, r8, #24
	rsb	r2, r8, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r8, r1, r8
	bl	BsGet
	ldr	r2, [fp, #-68]
	ldr	ip, [fp, #-72]
	and	r2, r2, #7
	orr	r0, r9, r0, asl r2
	b	.L1271
.L1251:
	add	r3, r7, r9
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r4, r4, asl r3
	rsb	r5, r3, r8
	mov	r9, r9, asl r3
	str	r4, [r6, #28]
	str	r5, [r6, #32]
	str	r9, [r6, #36]
.L1288:
	add	r10, r10, #1
	ldr	r3, [fp, #-56]
	cmp	r10, #3
	add	r3, r3, #1
	str	r3, [fp, #-56]
	addne	r4, r6, #28
	ldmneia	r4, {r4, r8, r9}
	bne	.L1284
.L1343:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-64]
	add	r3, r3, #3
	str	r3, [fp, #-60]
	cmp	r3, r2
	beq	.L1283
	ldr	r4, [r6, #28]
	ldr	r3, [r6, #36]
	ldr	r8, [r6, #32]
	b	.L1249
.L1338:
	rsb	r2, r8, #24
	rsb	r5, r8, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r5, r2, r5
	str	r2, [fp, #-68]
	mov	r1, r2
	bl	BsGet
	ldr	r2, [fp, #-68]
	and	r3, r5, #7
	add	r5, r2, r8
	str	r5, [r6, #32]
	mov	r8, r5
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L1250
.L1253:
	add	r3, r7, r4
	mov	r8, #0
	mov	r2, #3
	str	r10, [fp, #-80]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #28]
	mov	r4, r4, asl r1
	mov	r8, r9
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	mov	r9, r2
	b	.L1258
.L1256:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1344
.L1258:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1256
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-68]
	ldr	ip, [fp, #-72]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1256
.L1344:
	mov	r8, r10
	ldr	r10, [fp, #-80]
.L1259:
	ldr	r3, [fp, #-56]
	add	r8, r7, r8
	ldrb	r1, [r8, #280]	@ zero_extendqisi2
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	ip, r2, #1
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L1276
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L1277
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L1277:
	add	r3, r3, #1
.L1279:
	ldr	r2, [fp, #-56]
	strb	r3, [r2]
	b	.L1288
.L1276:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L1280
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L1280:
	rsb	r3, r3, #255
	b	.L1279
.L1333:
	rsb	r3, r8, #24
	rsb	r9, r8, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r9, r3, r9
	str	r3, [fp, #-60]
	mov	r1, r3
	and	r9, r9, #7
	bl	BsGet
	ldr	r3, [fp, #-60]
	add	r8, r3, r8
	str	r8, [r6, #32]
	orr	r0, r4, r0, asl r9
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L1216
.L1219:
	add	r3, r7, r4
	mov	r8, #0
	mov	r2, #3
	str	r10, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #28]
	mov	r4, r4, asl r1
	mov	r8, r9
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	mov	r9, r2
	b	.L1224
.L1222:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1345
.L1224:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1222
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1222
.L1345:
	mov	r8, r10
	ldr	r10, [fp, #-68]
.L1225:
	ldrb	r2, [r10]	@ zero_extendqisi2
	add	r8, r7, r8
	sub	ip, r2, #1
	ldrb	r1, [r8, #280]	@ zero_extendqisi2
	mov	r0, ip, asl #1
	cmp	r0, #255
	bgt	.L1242
	add	r3, r1, #1
	cmp	r3, r0
	bgt	.L1243
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, ip, r3, asr #1
	addeq	r3, ip, r3, asr #1
.L1243:
	add	r3, r3, #1
.L1245:
	add	r4, r6, #28
	strb	r3, [r10]
	ldmia	r4, {r4, r8, r9}
	b	.L1287
.L1242:
	rsb	r2, r2, #255
	add	r3, r1, #1
	cmp	r3, r2, asl #1
	bgt	.L1246
	tst	r3, #1
	addne	r3, r1, #2
	addeq	r3, r3, r3, lsr #31
	subne	r3, r2, r3, asr #1
	addeq	r3, r2, r3, asr #1
.L1246:
	rsb	r3, r3, #255
	b	.L1245
.L1260:
	add	r3, r7, r5
	mov	r8, #0
	mov	r2, #3
	str	r10, [fp, #-80]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r8, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L1265
.L1263:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r8, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1346
.L1265:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r8
	add	r5, r5, #1
	bge	.L1263
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-68]
	ldr	ip, [fp, #-72]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1263
.L1346:
	mov	r8, r10
	ldr	r10, [fp, #-80]
	add	r8, r8, #16
	b	.L1259
.L1342:
	mov	r3, r10
	cmp	r3, #64
	ldr	r10, [fp, #-80]
	bgt	.L1347
.L1273:
	add	r8, r3, #64
	b	.L1259
.L1226:
	add	r3, r7, r5
	mov	r8, #0
	mov	r2, #3
	str	r10, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	ip, #1
	mov	r9, r9, asl r1
	rsb	r4, r1, r4
	str	r9, [r6, #28]
	mov	r5, r5, asl r1
	mov	r8, r9
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	mov	r9, r2
	b	.L1231
.L1229:
	mov	r2, r5, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r5, r5, lr
	cmn	r9, #1
	add	r2, r7, r5
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r4, r2, r4
	mov	r5, r5, asl r2
	str	r8, [r6, #28]
	str	r4, [r6, #32]
	str	r5, [r6, #36]
	beq	.L1348
.L1231:
	sub	r5, r5, #1
	cmp	r4, #0
	ubfx	r5, r5, #1, #24
	mov	r0, r8
	add	r5, r5, #1
	bge	.L1229
	rsb	r1, r4, #24
	rsb	r2, r4, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-64]
	str	r2, [fp, #-60]
	add	r4, r1, r4
	bl	BsGet
	ldr	r2, [fp, #-60]
	ldr	ip, [fp, #-64]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1229
.L1348:
	mov	r8, r10
	ldr	r10, [fp, #-68]
	add	r8, r8, #16
	b	.L1225
.L1337:
	mov	r2, r8
	mov	r8, r10
	cmp	r8, #64
	ldr	r10, [fp, #-68]
	bgt	.L1349
.L1239:
	add	r8, r8, #64
	b	.L1225
.L1266:
	add	r3, r7, r9
	mov	r8, #0
	mov	r2, #4
	str	r10, [fp, #-80]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	ip, #1
	mov	r3, r4, asl r1
	mov	r9, r9, asl r1
	rsb	r5, r1, r5
	str	r9, [r6, #36]
	mov	r4, r9
	str	r3, [r6, #28]
	str	r5, [r6, #32]
	mov	r8, r3
	mov	r9, r2
	b	.L1270
.L1268:
	mov	r2, r4, asl #24
	mov	r1, ip, asl r9
	cmp	r2, r0
	sub	r9, r9, #1
	rsbls	r0, r2, r0
	ldrls	lr, [r6, #36]
	movhi	r1, #0
	orr	r10, r10, r1
	rsbls	r4, r4, lr
	cmn	r9, #1
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r2
	rsb	r5, r2, r5
	mov	r4, r4, asl r2
	str	r8, [r6, #28]
	str	r5, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1350
.L1270:
	sub	r4, r4, #1
	cmp	r5, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1268
	rsb	r1, r5, #24
	rsb	r2, r5, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r2, r1, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r5, r1, r5
	bl	BsGet
	ldr	r2, [fp, #-68]
	ldr	ip, [fp, #-72]
	and	r2, r2, #7
	orr	r0, r8, r0, asl r2
	b	.L1268
.L1350:
	mov	r8, r10
	ldr	r10, [fp, #-80]
	add	r8, r8, #32
	b	.L1259
.L1339:
	rsb	r3, r5, #24
	rsb	r8, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r8, r3, r8
	str	r3, [fp, #-68]
	mov	r1, r3
	bl	BsGet
	and	r2, r8, #7
	ldr	r3, [fp, #-68]
	add	r5, r5, r3
	str	r5, [r6, #32]
	orr	r0, r9, r0, asl r2
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L1252
.L1213:
	add	r2, r7, r4
	ldrb	r2, [r2, #24]	@ zero_extendqisi2
	mov	r3, r3, asl r2
	rsb	r8, r2, r8
	mov	r4, r4, asl r2
	str	r3, [r6, #28]
	str	r8, [r6, #32]
	str	r4, [r6, #36]
	b	.L1286
.L1232:
	add	r3, r7, r5
	mov	r8, #0
	mov	ip, #4
	str	r10, [fp, #-68]
	ldrb	r1, [r3, #24]	@ zero_extendqisi2
	mov	r10, r8
	mov	r2, #1
	mov	r3, r4, asl r1
	rsb	r9, r1, r9
	mov	r4, r5, asl r1
	str	r3, [r6, #28]
	str	r9, [r6, #32]
	mov	r5, ip
	str	r4, [r6, #36]
	mov	r8, r3
	b	.L1236
.L1234:
	mov	r1, r4, asl #24
	mov	ip, r2, asl r5
	cmp	r1, r0
	sub	r5, r5, #1
	rsbls	r0, r1, r0
	ldrls	lr, [r6, #36]
	movhi	ip, #0
	orr	r10, r10, ip
	rsbls	r4, r4, lr
	cmn	r5, #1
	add	r1, r7, r4
	ldrb	r1, [r1, #24]	@ zero_extendqisi2
	mov	r8, r0, asl r1
	rsb	r9, r1, r9
	mov	r4, r4, asl r1
	str	r8, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	beq	.L1351
.L1236:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r0, r8
	add	r4, r4, #1
	bge	.L1234
	rsb	r1, r9, #24
	rsb	ip, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	ip, r1, ip
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	add	r9, r1, r9
	bl	BsGet
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-64]
	and	ip, ip, #7
	orr	r0, r8, r0, asl ip
	b	.L1234
.L1351:
	mov	r8, r10
	ldr	r10, [fp, #-68]
	add	r8, r8, #32
	b	.L1225
.L1334:
	rsb	r3, r5, #24
	rsb	r8, r5, #16
	bic	r3, r3, #7
	mov	r0, r6
	rsb	r8, r3, r8
	str	r3, [fp, #-60]
	mov	r1, r3
	bl	BsGet
	and	r2, r8, #7
	ldr	r3, [fp, #-60]
	add	r5, r5, r3
	str	r5, [r6, #32]
	orr	r0, r9, r0, asl r2
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L1218
.L1347:
	sub	r4, r4, #1
	cmp	r8, #0
	ubfx	r4, r4, #1, #24
	mov	r3, r3, asl #1
	add	r4, r4, #1
	sub	r5, r3, #65
	movge	r0, r9
	blt	.L1352
.L1274:
	mov	r3, r4, asl #24
	cmp	r3, r0
	rsbls	r0, r3, r0
	ldrls	r2, [r6, #36]
	movls	r3, #1
	movhi	r3, #0
	add	r3, r5, r3
	rsbls	r4, r4, r2
	add	r2, r7, r4
	ldrb	r1, [r2, #24]	@ zero_extendqisi2
	mov	r9, r0, asl r1
	rsb	r2, r1, r8
	mov	r4, r4, asl r1
	str	r9, [r6, #28]
	str	r2, [r6, #32]
	str	r4, [r6, #36]
	b	.L1273
.L1340:
	rsb	r2, r4, #24
	rsb	r8, r4, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r8, r2, r8
	str	r2, [fp, #-68]
	mov	r1, r2
	bl	BsGet
	and	r3, r8, #7
	ldr	r2, [fp, #-68]
	add	r4, r4, r2
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L1255
.L1283:
	ldr	r1, [fp, #-76]
	mov	r0, r6
	ldr	r2, [fp, #12]
	bl	Vp9_ReadMvProbs
	b	.L1209
.L1349:
	sub	r4, r4, #1
	cmp	r9, #0
	ubfx	r4, r4, #1, #24
	mov	r8, r8, asl #1
	add	r4, r4, #1
	sub	r5, r8, #65
	movge	r0, r2
	blt	.L1353
.L1240:
	mov	r3, r4, asl #24
	cmp	r3, r0
	rsbls	r0, r3, r0
	ldrls	r1, [r6, #36]
	movls	r8, #1
	movhi	r8, #0
	add	r8, r5, r8
	rsbls	r4, r4, r1
	add	r3, r7, r4
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	mov	r2, r0, asl r3
	rsb	r9, r3, r9
	mov	r4, r4, asl r3
	str	r2, [r6, #28]
	str	r9, [r6, #32]
	str	r4, [r6, #36]
	b	.L1239
.L1355:
	.align	2
.L1354:
	.word	.LANCHOR0
.L1335:
	rsb	r2, r4, #24
	rsb	r8, r4, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r8, r2, r8
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r8, #7
	ldr	r2, [fp, #-60]
	add	r4, r4, r2
	str	r4, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r9, r0
	b	.L1221
.L1341:
	rsb	r2, r5, #24
	rsb	r8, r5, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r8, r2, r8
	str	r2, [fp, #-68]
	mov	r1, r2
	bl	BsGet
	ldr	r2, [fp, #-68]
	and	r3, r8, #7
	add	r8, r5, r2
	str	r8, [r6, #32]
	mov	r5, r8
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L1262
.L1211:
	rsb	r2, r8, #24
	rsb	r3, r8, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r3, r2, r3
	ldr	r9, [r6, #28]
	mov	r1, r2
	str	r3, [fp, #-60]
	str	r2, [fp, #-56]
	bl	BsGet
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	and	r3, r3, #7
	add	r8, r8, r2
	str	r8, [r6, #32]
	orr	r0, r9, r0, asl r3
	str	r0, [r6, #28]
	mov	r3, r0
	b	.L1212
.L1336:
	rsb	r2, r9, #24
	rsb	r8, r9, #16
	bic	r2, r2, #7
	mov	r0, r6
	rsb	r8, r2, r8
	str	r2, [fp, #-60]
	mov	r1, r2
	bl	BsGet
	and	r3, r8, #7
	ldr	r2, [fp, #-60]
	add	r9, r9, r2
	str	r9, [r6, #32]
	orr	r0, r4, r0, asl r3
	str	r0, [r6, #28]
	mov	r4, r0
	b	.L1228
.L1352:
	rsb	r1, r8, #24
	rsb	r3, r8, #16
	bic	r1, r1, #7
	mov	r0, r6
	rsb	r3, r1, r3
	add	r8, r1, r8
	str	r3, [fp, #-68]
	bl	BsGet
	ldr	r3, [fp, #-68]
	and	r3, r3, #7
	orr	r0, r9, r0, asl r3
	b	.L1274
.L1332:
	mov	r1, r6
	ldr	r0, [fp, #-72]
	bl	Vp9_ReadSwitchableInterpProbs
	b	.L1210
.L1353:
	rsb	r1, r9, #24
	rsb	r8, r9, #16
	bic	r1, r1, #7
	mov	r0, r6
	str	r2, [fp, #-60]
	rsb	r8, r1, r8
	add	r9, r1, r9
	bl	BsGet
	ldr	r2, [fp, #-60]
	and	r8, r8, #7
	orr	r0, r2, r0, asl r8
	b	.L1240
	UNWIND(.fnend)
	.size	Vp9_PrepareReadModeInfo, .-Vp9_PrepareReadModeInfo
	.global	__aeabi_idiv
	.align	2
	.global	Vp9_AdaptCoefProbs
	.type	Vp9_AdaptCoefProbs, %function
Vp9_AdaptCoefProbs:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	mov	lr, #432
	mul	lr, lr, r3
	mov	ip, r3, asl #9
	add	ip, ip, r3, lsl #6
	ldr	r9, [fp, #4]
	mov	r4, r3, asl #11
	add	ip, ip, #9216
	add	r3, r4, r3, lsl #8
	add	ip, ip, #8
	add	r0, r0, lr
	add	r3, r2, r3
	str	r0, [fp, #-92]
	add	r0, r2, ip
	str	r3, [fp, #-116]
	add	r3, r1, lr
	str	r0, [fp, #-112]
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-84]
.L1357:
	ldr	r3, [fp, #-112]
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-116]
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-104]
.L1368:
	mov	r3, #0
	str	r3, [fp, #-72]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-108]
	ldr	r2, [fp, #-100]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-104]
	str	r2, [fp, #-80]
	add	r3, r3, #2
	str	r3, [fp, #-88]
.L1366:
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-88]
	ldr	r7, [fp, #-76]
	add	r3, r3, r2
	ldr	r2, [fp, #-80]
	str	r2, [fp, #-56]
	ldr	r2, [fp, #-84]
	add	r3, r3, r2
	ldr	r2, [fp, #-92]
	add	r10, r2, r3
	ldr	r2, [fp, #-96]
	str	r10, [fp, #-48]
	add	r8, r2, r3
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L1364
.L1362:
	ldr	r2, [fp, #-56]
	ldr	r4, [r7, #8]
	ldr	r6, [r7]
	ldr	r3, [r2, #4]!
	ldrb	r10, [r8, #-2]	@ zero_extendqisi2
	subs	r1, r3, #0
	str	r2, [fp, #-56]
	ldr	r2, [r7, #4]
	moveq	r5, #128
	add	r4, r2, r4
	str	r2, [fp, #-60]
	ldr	r2, [r7, #12]
	beq	.L1358
	mov	r0, r1, asr #1
	str	r3, [fp, #-68]
	add	r0, r0, r2, lsl #8
	bl	__aeabi_idiv
	ldr	r3, [fp, #-68]
	cmp	r0, #1
	movlt	r0, #1
	cmp	r0, #255
	movge	r0, #255
	uxtb	r5, r0
.L1358:
	cmp	r9, r3
	mov	r1, r9
	movcs	r0, r3
	ldr	r3, [fp, #8]
	movcc	r0, r9
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	adds	r3, r4, r6
	moveq	r6, #128
	rsb	r2, r0, #256
	mul	r10, r2, r10
	ldr	r2, [fp, #-48]
	add	r10, r10, #128
	mla	r10, r0, r5, r10
	mov	r10, r10, lsr #8
	strb	r10, [r2, #-2]
	ldrb	r5, [r8, #-1]	@ zero_extendqisi2
	beq	.L1359
	mov	r0, r3, asr #1
	mov	r1, r3
	add	r0, r0, r6, lsl #8
	str	r3, [fp, #-68]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-68]
	cmp	r0, #1
	movlt	r0, #1
	cmp	r0, #255
	movge	r0, #255
	uxtb	r6, r0
.L1359:
	cmp	r3, r9
	mov	r1, r9
	movcc	r0, r3
	ldr	r3, [fp, #8]
	movcs	r0, r9
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	cmp	r4, #0
	rsb	r3, r0, #256
	mul	r5, r5, r3
	ldr	r3, [fp, #-48]
	add	r5, r5, #128
	mla	r6, r0, r6, r5
	mov	r6, r6, lsr #8
	strb	r6, [r3, #-1]
	moveq	r6, #128
	ldrb	r5, [r8]	@ zero_extendqisi2
	beq	.L1360
	ldr	r3, [fp, #-60]
	mov	r0, r4, asr #1
	mov	r1, r4
	add	r0, r0, r3, lsl #8
	bl	__aeabi_idiv
	cmp	r0, #1
	movlt	r0, #1
	cmp	r0, #255
	movge	r0, #255
	uxtb	r6, r0
.L1360:
	ldr	r3, [fp, #-52]
	cmp	r4, r9
	mov	r1, r9
	add	r8, r8, #3
	add	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #8]
	movcc	r0, r4
	movcs	r0, r9
	add	r7, r7, #16
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	rsb	r3, r0, #256
	mul	r5, r5, r3
	ldr	r3, [fp, #-48]
	add	r5, r5, #128
	mla	r6, r0, r6, r5
	ubfx	r6, r6, #8, #8
	strb	r6, [r3], #3
	str	r3, [fp, #-48]
.L1364:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #3
	movne	r3, #6
	cmp	r2, r3
	blt	.L1362
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-64]
	cmp	r3, #6
	ldr	r3, [fp, #-76]
	add	r2, r2, #18
	str	r2, [fp, #-72]
	add	r3, r3, #96
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r3, r3, #24
	str	r3, [fp, #-80]
	bne	.L1366
	ldr	r3, [fp, #-104]
	ldr	r2, [fp, #-108]
	add	r3, r3, #108
	str	r3, [fp, #-104]
	cmp	r3, #216
	ldr	r3, [fp, #-100]
	add	r2, r2, #576
	str	r2, [fp, #-108]
	add	r3, r3, #144
	str	r3, [fp, #-100]
	bne	.L1368
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-116]
	add	r3, r3, #216
	str	r3, [fp, #-84]
	cmp	r3, #432
	ldr	r3, [fp, #-112]
	add	r2, r2, #1152
	str	r2, [fp, #-116]
	add	r3, r3, #288
	str	r3, [fp, #-112]
	bne	.L1357
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_AdaptCoefProbs, .-Vp9_AdaptCoefProbs
	.align	2
	.global	Vp9_AdaptResidualProbs
	.type	Vp9_AdaptResidualProbs, %function
Vp9_AdaptResidualProbs:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r5, [fp, #12]
	ldr	ip, [fp, #8]
	mov	r7, r0
	clz	r3, r5
	ldr	r5, [fp, #4]
	adds	ip, ip, #0
	mov	r6, r1
	mov	r3, r3, lsr #5
	mov	r8, r2
	movne	ip, #1
	cmp	r5, #0
	orreq	ip, ip, #1
	cmp	r3, ip
	mov	r4, #0
	mov	r9, #24
	movhi	r5, #128
	movls	r5, #112
.L1375:
	mov	r3, r4
	str	r5, [sp, #4]
	str	r9, [sp]
	add	r4, r4, #1
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	bl	Vp9_AdaptCoefProbs
	cmp	r4, #4
	bne	.L1375
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_AdaptResidualProbs, .-Vp9_AdaptResidualProbs
	.align	2
	.global	Vp9_AdaptProbs
	.type	Vp9_AdaptProbs, %function
Vp9_AdaptProbs:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	mov	r4, r0
	ldrsb	r0, [r1, r0]
	mov	r5, r1
	mov	r7, r2
	mov	r8, r3
	cmp	r0, #0
	ldr	r6, [fp, #4]
	ble	.L1383
	str	r6, [sp]
	bl	Vp9_AdaptProbs
	add	r3, r5, r4
	mov	r9, r0
	ldrsb	r0, [r3, #1]
	cmp	r0, #0
	ble	.L1384
.L1381:
	mov	r1, r5
	str	r6, [sp]
	mov	r3, r8
	mov	r2, r7
	bl	Vp9_AdaptProbs
	mov	r5, r0
.L1382:
	ldrb	r0, [r8, r4, lsr #1]	@ zero_extendqisi2
	sub	r1, fp, #44
	str	r9, [fp, #-44]
	str	r5, [fp, #-40]
	bl	Vp9_ModeMvMergeProbs
	strb	r0, [r7, r4, lsr #1]
	add	r0, r5, r9
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1383:
	mov	r0, r0, asl #2
	add	r3, r5, r4
	rsb	r0, r0, #0
	ldr	r9, [r6, r0]
	ldrsb	r0, [r3, #1]
	cmp	r0, #0
	bgt	.L1381
.L1384:
	mov	r0, r0, asl #2
	rsb	r0, r0, #0
	ldr	r5, [r6, r0]
	b	.L1382
	UNWIND(.fnend)
	.size	Vp9_AdaptProbs, .-Vp9_AdaptProbs
	.align	2
	.global	Vp9_AdaptModeProbs
	.type	Vp9_AdaptModeProbs, %function
Vp9_AdaptModeProbs:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	add	r10, r0, #1968
	add	r8, r1, #1968
	add	r4, r2, #8192
	add	r8, r8, #10
	add	r10, r10, #10
	mov	r6, r0
	mov	r7, r1
	mov	r9, r3
	mov	r5, #0
.L1386:
	ldr	r1, [r4, #3348]
	ldrb	r0, [r8, #1]!	@ zero_extendqisi2
	add	r1, r1, r5, lsl #3
	add	r5, r5, #1
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #4
	strb	r0, [r10, #1]!
	bne	.L1386
	add	r8, r7, #1968
	add	r10, r6, #1968
	add	r8, r8, #14
	add	r10, r10, #14
	mov	r5, #0
.L1387:
	ldr	r1, [r4, #3352]
	ldrb	r0, [r8, #1]!	@ zero_extendqisi2
	add	r1, r1, r5, lsl #3
	add	r5, r5, #1
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #5
	strb	r0, [r10, #1]!
	bne	.L1387
	add	r8, r7, #1984
	add	r10, r6, #1984
	add	r8, r8, #13
	add	r10, r10, #13
	mov	r5, #0
.L1388:
	ldr	r1, [r4, #3360]
	ldrb	r0, [r8, #1]!	@ zero_extendqisi2
	add	r1, r1, r5, lsl #3
	add	r5, r5, #1
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #5
	strb	r0, [r10, #1]!
	bne	.L1388
	mov	r10, r6
	mov	r8, r7
	mov	r5, #8
	str	r7, [fp, #-100]
	str	r6, [fp, #-96]
.L1389:
	ldr	r1, [r4, #3356]
	sub	r3, r5, #8
	ldrb	r0, [r8, #1988]	@ zero_extendqisi2
	add	r10, r10, #2
	add	r1, r1, r3
	add	r8, r8, #2
	bl	Vp9_ModeMvMergeProbs
	strb	r0, [r10, #1986]
	ldr	r1, [r4, #3356]
	ldrb	r0, [r8, #1987]	@ zero_extendqisi2
	add	r1, r1, r5
	add	r5, r5, #16
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #88
	strb	r0, [r10, #1987]
	bne	.L1389
	mov	r8, #0
	mov	r5, r8
.L1390:
	ldr	r0, [r4, #3344]
	add	r2, r8, #1952
	add	r2, r2, #6
	ldr	r1, .L1430
	add	r0, r0, r5
	add	r3, r7, r2
	str	r0, [sp]
	add	r2, r6, r2
	add	r5, r5, #16
	mov	r0, #0
	bl	Vp9_AdaptProbs
	cmp	r5, #112
	add	r8, r8, #3
	bne	.L1390
	mov	r8, #0
	mov	r5, r8
.L1391:
	ldr	r0, [r4, #1024]
	add	r2, r8, #1728
	add	r3, r7, r2
	ldr	r1, .L1430+4
	add	r0, r0, r5
	add	r2, r6, r2
	str	r0, [sp]
	add	r5, r5, #40
	mov	r0, #0
	add	r8, r8, #9
	bl	Vp9_AdaptProbs
	cmp	r5, #160
	bne	.L1391
	mov	r8, #0
	mov	r5, r8
.L1392:
	ldr	r0, [r4, #1028]
	add	r2, r8, #1760
	add	r2, r2, #4
	ldr	r1, .L1430+4
	add	r0, r0, r5
	add	r3, r7, r2
	str	r0, [sp]
	add	r2, r6, r2
	add	r5, r5, #40
	mov	r0, #0
	bl	Vp9_AdaptProbs
	cmp	r5, #400
	add	r8, r8, #9
	bne	.L1392
	mov	r8, #0
	mov	r5, r8
.L1393:
	ldr	r0, [r4, #1032]
	add	r2, r8, #1888
	add	r2, r2, #14
	ldr	r1, .L1430+8
	add	r0, r0, r5
	add	r3, r7, r2
	str	r0, [sp]
	add	r2, r6, r2
	add	r5, r5, #16
	mov	r0, #0
	bl	Vp9_AdaptProbs
	cmp	r5, #256
	add	r8, r8, #3
	bne	.L1393
	cmp	r9, #4
	beq	.L1428
	ldr	r3, [fp, #4]
	cmp	r3, #4
	beq	.L1429
.L1404:
	add	r7, r7, #2000
	add	r6, r6, #2000
	add	r7, r7, #14
	add	r6, r6, #14
	mov	r5, #0
.L1400:
	ldr	r1, [r4, #3376]
	ldrb	r0, [r7, #1]!	@ zero_extendqisi2
	add	r1, r1, r5, lsl #3
	add	r5, r5, #1
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #3
	strb	r0, [r6, #1]!
	bne	.L1400
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1428:
	mov	r9, #0
	mov	r5, r9
.L1395:
	ldr	ip, [r4, #3340]
	add	r2, r9, #1936
	add	r2, r2, #14
	ldr	r1, .L1430+12
	add	ip, ip, r5
	add	r3, r7, r2
	mov	r0, #0
	add	r2, r6, r2
	str	ip, [sp]
	add	r5, r5, #12
	bl	Vp9_AdaptProbs
	cmp	r5, #48
	add	r9, r9, #2
	bne	.L1395
	ldr	r3, [fp, #4]
	cmp	r3, #4
	bne	.L1404
.L1429:
	mov	r8, #0
	add	r3, r7, #2000
	add	r2, r6, #2000
	str	r6, [fp, #-120]
	str	r7, [fp, #-124]
	mov	r7, r8
	ldr	r6, [fp, #-96]
	mov	r1, r3
	ldr	r8, [fp, #-100]
	add	r3, r3, #12
	str	r3, [fp, #-116]
	add	r3, r2, #12
	str	r3, [fp, #-112]
	add	r3, r1, #2
	str	r3, [fp, #-108]
	add	r3, r2, #2
	str	r3, [fp, #-104]
.L1399:
	ldr	r3, [fp, #-116]
	sub	r1, fp, #92
	ldr	ip, [r4, #3372]
	mov	r5, r7, asl #4
	ldr	r10, [fp, #-104]
	ldrb	r0, [r3, #1]!	@ zero_extendqisi2
	ldr	r9, [fp, #-108]
	str	r3, [fp, #-116]
	ldr	r3, [ip, r7, asl #3]
	add	ip, ip, r7, lsl #3
	str	r3, [fp, #-92]
	ldr	r3, [ip, #4]
	str	r3, [fp, #-88]
	bl	Vp9_ModeMvMergeProbs
	ldr	r3, [fp, #-112]
	sub	ip, r5, r7, asl #2
	sub	r1, fp, #84
	str	r5, [fp, #-96]
	mov	r5, #0
	strb	r0, [r3, #1]!
	ldr	r0, [r4, #3368]
	str	r3, [fp, #-112]
	ldr	lr, [r0, ip]
	add	r0, r0, ip
	str	lr, [fp, #-84]
	ldmib	r0, {ip, lr}
	add	ip, ip, lr
	str	ip, [fp, #-80]
	ldr	ip, [r0, #4]
	str	ip, [fp, #-76]
	ldr	ip, [r0, #8]
	ldrb	r0, [r8, #2009]	@ zero_extendqisi2
	str	ip, [fp, #-72]
	bl	Vp9_ModeMvMergeProbs
	sub	r1, fp, #76
	strb	r0, [r6, #2009]
	ldrb	r0, [r8, #2010]	@ zero_extendqisi2
	bl	Vp9_ModeMvMergeProbs
	ldr	r3, [fp, #-96]
	strb	r0, [r6, #2010]
	ldr	r1, [r4, #3364]
	add	r3, r1, r3
	ldr	r1, [r1, r7, asl #4]
	str	r1, [fp, #-68]
	ldmib	r3, {r0, r1}
	add	r1, r1, r0
	ldr	r0, [r3, #12]
	add	r1, r1, r0
	str	r1, [fp, #-64]
	ldr	r1, [r3, #4]
	str	r1, [fp, #-60]
	ldr	r1, [r3, #8]
	add	r1, r1, r0
	str	r1, [fp, #-56]
	ldr	r1, [r3, #8]
	str	r1, [fp, #-52]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-48]
.L1398:
	sub	r3, fp, #68
	ldrb	r0, [r9, #1]!	@ zero_extendqisi2
	add	r1, r3, r5
	add	r5, r5, #8
	bl	Vp9_ModeMvMergeProbs
	cmp	r5, #24
	strb	r0, [r10, #1]!
	bne	.L1398
	ldr	r3, [fp, #-108]
	add	r7, r7, #1
	cmp	r7, #2
	add	r8, r8, #2
	add	r3, r3, #3
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-104]
	add	r6, r6, #2
	add	r3, r3, #3
	str	r3, [fp, #-104]
	bne	.L1399
	ldr	r6, [fp, #-120]
	ldr	r7, [fp, #-124]
	b	.L1404
.L1431:
	.align	2
.L1430:
	.word	.LANCHOR0+536
	.word	.LANCHOR0+544
	.word	.LANCHOR0+564
	.word	.LANCHOR0+572
	UNWIND(.fnend)
	.size	Vp9_AdaptModeProbs, .-Vp9_AdaptModeProbs
	.align	2
	.global	Vp9_AdaptMvProbs
	.type	Vp9_AdaptMvProbs, %function
Vp9_AdaptMvProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	mov	r7, r0
	mov	r8, r1
	mov	r4, r2
	str	r2, [fp, #-100]
	sub	r0, fp, #88
	mov	r2, #6
	ldr	r1, .L1441
	str	r3, [fp, #-104]
	bl	memcpy
	mov	r2, #20
	ldr	r1, .L1441+4
	sub	r0, fp, #64
	bl	memcpy
	mov	r2, #6
	ldr	r1, .L1441
	sub	r0, fp, #80
	bl	memcpy
	add	r1, r4, #8192
	add	r3, r8, #2016
	add	r2, r7, #2016
	ldr	ip, [r1, #3380]
	add	r3, r3, #2
	sub	r1, fp, #88
	add	r2, r2, #2
	mov	r0, #0
	str	ip, [sp]
	bl	Vp9_AdaptProbs
	mov	r3, #0
	str	r3, [fp, #-96]
.L1435:
	ldr	r2, [fp, #-96]
	mov	r4, #0
	ldr	r3, [fp, #-100]
	mov	r6, r8
	ldrb	r0, [r8, #2021]	@ zero_extendqisi2
	mov	r5, r7
	add	r9, r3, r2, lsl #5
	add	r3, r9, #11520
	add	r10, r9, #11584
	add	r10, r10, #4
	ldr	r1, [r3, #56]
	bl	Vp9_ModeMvMergeProbs
	add	lr, r9, #11520
	add	lr, lr, #60
	add	r3, r8, #2016
	add	r2, r7, #2016
	add	r3, r3, #6
	add	r2, r2, #6
	sub	r1, fp, #64
	strb	r0, [r7, #2021]
	mov	r0, r4
	ldr	lr, [lr]
	str	lr, [sp]
	bl	Vp9_AdaptProbs
	add	r3, r9, #11584
	ldrb	r0, [r6, #2032]!	@ zero_extendqisi2
	sub	r1, fp, #72
	ldr	r3, [r3]
	ldmia	r3, {r2, r3}
	str	r2, [fp, #-72]
	str	r3, [fp, #-68]
	bl	Vp9_ModeMvMergeProbs
	strb	r0, [r5, #2032]!
.L1433:
	ldr	r1, [r10]
	ldrb	r0, [r6, #1]!	@ zero_extendqisi2
	add	r1, r1, r4, lsl #3
	add	r4, r4, #1
	bl	Vp9_ModeMvMergeProbs
	cmp	r4, #10
	strb	r0, [r5, #1]!
	bne	.L1433
	add	r4, r9, #11584
	add	r3, r8, #2032
	add	r2, r7, #2032
	add	r3, r3, #11
	ldr	ip, [r4, #8]
	add	r2, r2, #11
	sub	r1, fp, #80
	mov	r0, #0
	str	ip, [sp]
	bl	Vp9_AdaptProbs
	ldr	r1, [r4, #8]
	add	r3, r8, #2032
	add	r2, r7, #2032
	add	r1, r1, #16
	add	r3, r3, #14
	str	r1, [sp]
	add	r2, r2, #14
	sub	r1, fp, #80
	mov	r0, #0
	bl	Vp9_AdaptProbs
	add	r1, r9, #11584
	add	r3, r8, #2048
	add	r2, r7, #2048
	ldr	ip, [r1, #12]
	add	r3, r3, #1
	add	r2, r2, #1
	sub	r1, fp, #80
	mov	r0, #0
	str	ip, [sp]
	bl	Vp9_AdaptProbs
	ldr	r3, [fp, #-104]
	cmp	r3, #0
	beq	.L1434
	add	r3, r9, #11584
	ldrb	r0, [r8, #2052]	@ zero_extendqisi2
	add	r9, r9, #11584
	ldr	r1, [r3, #16]
	bl	Vp9_ModeMvMergeProbs
	strb	r0, [r7, #2052]
	ldr	r1, [r9, #20]
	ldrb	r0, [r8, #2053]	@ zero_extendqisi2
	bl	Vp9_ModeMvMergeProbs
	strb	r0, [r7, #2053]
.L1434:
	ldr	r3, [fp, #-96]
	add	r8, r8, #33
	add	r7, r7, #33
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, #2
	bne	.L1435
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1442:
	.align	2
.L1441:
	.word	.LANCHOR0+576
	.word	.LANCHOR0+584
	UNWIND(.fnend)
	.size	Vp9_AdaptMvProbs, .-Vp9_AdaptMvProbs
	.align	2
	.global	Lf_Init_Lut
	.type	Lf_Init_Lut, %function
Lf_Init_Lut:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r3, #0
	mov	r2, #1
	strb	r3, [r0, #64]
	strb	r3, [r0, #67]
	strb	r3, [r0, #68]
	strb	r3, [r0, #69]
	strb	r3, [r0, #70]
	strb	r3, [r0, #71]
	strb	r3, [r0, #72]
	strb	r3, [r0, #65]
	strb	r3, [r0, #66]
	strb	r3, [r0, #73]
	strb	r3, [r0, #76]
	strb	r2, [r0, #74]
	strb	r2, [r0, #75]
	strb	r2, [r0, #77]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Lf_Init_Lut, .-Lf_Init_Lut
	.align	2
	.global	VP9_Loop_Filter_Init
	.type	VP9_Loop_Filter_Init, %function
VP9_Loop_Filter_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r3, #0
	mov	r2, #1
	strb	r3, [r1, #64]
	strb	r3, [r1, #67]
	strb	r3, [r1, #68]
	strb	r3, [r1, #69]
	strb	r3, [r1, #70]
	strb	r3, [r1, #71]
	strb	r3, [r1, #72]
	strb	r3, [r1, #65]
	strb	r3, [r1, #66]
	strb	r3, [r1, #73]
	strb	r3, [r1, #76]
	strb	r2, [r1, #74]
	strb	r2, [r1, #75]
	strb	r2, [r1, #77]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_Loop_Filter_Init, .-VP9_Loop_Filter_Init
	.align	2
	.global	VP9_InitDecPara
	.type	VP9_InitDecPara, %function
VP9_InitDecPara:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, .L1446
	movw	r6, #10804
	movt	r6, 4
	add	r6, r0, r6
	mov	r5, r0
	add	r4, r5, #270336
	add	r5, r5, #274432
	movw	r2, #2860
	mov	r1, #0
	ldr	r3, [r7, #48]
	mov	r0, r6
	blx	r3
	mov	r3, #3
	add	r0, r5, #1376
	str	r3, [r5, #956]
	mov	r5, #0
	bl	ResetVoQueue
	ldr	r3, [r7, #48]
	mov	r2, #2
	add	r0, r6, #56
	str	r2, [r4, #2840]
	str	r5, [r4, #2836]
	mov	r1, r5
	mov	r2, #16
	blx	r3
	mov	r3, #1
	strb	r5, [r4, #2924]
	strb	r5, [r4, #2927]
	strb	r5, [r4, #2928]
	strb	r5, [r4, #2929]
	strb	r5, [r4, #2930]
	strb	r5, [r4, #2931]
	strb	r5, [r4, #2932]
	strb	r5, [r4, #2925]
	strb	r5, [r4, #2926]
	strb	r5, [r4, #2933]
	strb	r5, [r4, #2936]
	strb	r3, [r4, #2934]
	strb	r3, [r4, #2935]
	strb	r3, [r4, #2937]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1447:
	.align	2
.L1446:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP9_InitDecPara, .-VP9_InitDecPara
	.align	2
	.global	VP9DEC_Init
	.type	VP9DEC_Init, %function
VP9DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r5, r0
	mov	r8, r1
	mov	r0, #2
	ldr	r1, .L1462
	add	r4, r5, #274432
	bl	dprint_vfmw
	ldr	r3, [r8, #608]
	ldr	r10, .L1462+4
	mov	r1, #0
	cmp	r3, #1
	ldr	r6, [r4, #1720]
	addeq	r7, r5, #294912
	addeq	r3, r5, #270336
	ldr	ip, [r10, #48]
	mov	r0, r5
	ldreq	r2, [r7, #3356]
	movne	r9, #0
	addne	r7, r5, #294912
	ldreq	r9, [r3, #2552]
	strne	r9, [fp, #-48]
	streq	r2, [fp, #-48]
	movw	r2, #36280
	movt	r2, 4
	blx	ip
	add	r0, r4, #1376
	str	r6, [r4, #1720]
	bl	ResetVoQueue
	str	r8, [r5]
	mov	r0, r5
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r7, #3492]
	beq	.L1461
	ldr	r2, [r5]
	add	r4, r5, #270336
	mov	r6, #0
	mov	r1, #3
	ldr	r0, [r2, #8]
	str	r1, [r4, #2608]
	str	r1, [r4, #2556]
	str	r0, [r4, #2548]
	str	r6, [r4, #2560]
	ldr	r0, [r2, #48]
	str	r0, [r4, #2564]
	ldr	r2, [r2, #52]
	str	r2, [r4, #2568]
	bl	MEM_Phy2Vir
	mov	r2, #2048
	str	r2, [r4, #2576]
	mov	r1, #0
	str	r0, [r4, #2572]
	movw	r0, #36172
	str	r6, [r7, #3368]
	movt	r0, 4
	str	r6, [r7, #3372]
	add	r0, r5, r0
	str	r6, [r7, #3396]
	str	r6, [r7, #3400]
	str	r6, [r7, #3436]
	str	r6, [r7, #3440]
	ldr	r2, [r8, #608]
	cmp	r2, #1
	mov	r2, #32
	strne	r6, [r7, #3356]
	ldreq	r3, [fp, #-48]
	strne	r6, [r4, #2552]
	streq	r3, [r7, #3356]
	ldr	r3, [r10, #48]
	streq	r9, [r4, #2552]
	blx	r3
	mov	r0, r5
	bl	VP9_InitDecPara
	movw	r1, #10872
	movw	lr, #10908
	movt	r1, 4
	movt	lr, 4
	add	r1, r5, r1
	add	lr, r5, lr
	mov	ip, #0
	mov	r3, r1
	mov	r2, lr
.L1454:
	str	ip, [r3, #4]!
	cmp	r3, lr
	str	ip, [r2, #4]!
	bne	.L1454
	movw	r3, #10988
	add	r0, r4, #2832
	movt	r3, 4
	add	r3, r5, r3
	mvn	r2, #0
.L1455:
	str	r2, [r3, #4]!
	cmp	r3, r0
	bne	.L1455
	add	r2, r4, #2752
	mov	r3, #0
	mov	r0, #1
.L1456:
	str	r3, [r2, #4]!
	add	r3, r3, #1
	cmp	r3, #8
	str	r0, [r1, #4]!
	bne	.L1456
	mov	r0, #0
.L1451:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1461:
	ldr	r1, .L1462+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L1451
.L1463:
	.align	2
.L1462:
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	UNWIND(.fnend)
	.size	VP9DEC_Init, .-VP9DEC_Init
	.align	2
	.global	Vp9_ParseSuperFrameIndex
	.type	Vp9_ParseSuperFrameIndex, %function
Vp9_ParseSuperFrameIndex:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #0
	ble	.L1476
	add	ip, r0, r1
	mov	r5, #0
	ldrb	ip, [ip, #-1]	@ zero_extendqisi2
	str	r5, [r3]
	and	lr, ip, #224
	cmp	lr, #192
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	and	r6, ip, #7
	ubfx	r8, ip, #3, #2
	add	r6, r6, #1
	add	r7, r8, #1
	mul	r4, r6, r7
	add	r4, r4, #2
	cmp	r1, r4
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	rsb	lr, r4, r1
	ldrb	lr, [r0, lr]	@ zero_extendqisi2
	cmp	lr, ip
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r1, r1, #1
	cmp	r6, r5
	rsb	r1, r4, r1
	add	r4, r0, r1
	beq	.L1467
	sub	r9, r2, #4
.L1468:
	cmp	r7, #0
	beq	.L1471
	mov	r2, #0
	sub	r1, r4, #1
	add	lr, r4, r8
	mov	r0, r2
.L1469:
	ldrb	ip, [r1, #1]!	@ zero_extendqisi2
	cmp	r1, lr
	orr	r0, r0, ip, asl r2
	add	r2, r2, #8
	bne	.L1469
	add	r4, r4, r7
.L1470:
	add	r5, r5, #1
	str	r0, [r9, #4]!
	cmp	r6, r5
	bhi	.L1468
.L1467:
	str	r6, [r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1476:
	ldr	r1, .L1477
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1471:
	mov	r0, r7
	b	.L1470
.L1478:
	.align	2
.L1477:
	.word	.LC5
	UNWIND(.fnend)
	.size	Vp9_ParseSuperFrameIndex, .-Vp9_ParseSuperFrameIndex
	.align	2
	.global	VP9_GetImageBuffer
	.type	VP9_GetImageBuffer, %function
VP9_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r5, r0, #274432
	add	r4, r0, #294912
	add	r6, r0, #270336
	ldr	r3, [r5, #976]
	ldr	r0, [r4, #3492]
	cmp	r3, #1
	moveq	r1, #0
	movne	r1, #1
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r6, #2596]
	blt	.L1501
	mov	r1, r0
	ldr	r0, [r4, #3492]
	bl	FSP_GetLogicFs
	subs	r7, r0, #0
	beq	.L1502
	ldr	r2, [r6, #2596]
	mov	r0, #18
	ldr	r1, .L1505
	bl	dprint_vfmw
	ldr	r2, [r7, #680]
	cmp	r2, #0
	beq	.L1485
	ldr	r3, [r7, #684]
	cmp	r3, #0
	beq	.L1485
	ldr	r1, [r7, #688]
	cmp	r1, #0
	beq	.L1485
	ldr	ip, [r1, #16]
	mov	r0, #18
	ldr	r3, [r3, #16]
	ldr	r2, [r2, #16]
	ldr	r1, .L1505+4
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5, #976]
	cmp	r3, #1
	beq	.L1503
	ldr	r2, [r7, #680]
	mov	r3, #0
	mov	r0, r3
	str	r3, [r2, #4]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1485:
	movw	r2, #2255
	ldr	r1, .L1505+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L1483:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1501:
	ldr	r1, .L1505+12
	mov	r0, #0
	bl	dprint_vfmw
	add	r1, r5, #1376
	ldr	r0, [r4, #3492]
	bl	FSP_ClearNotInVoQueue
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1502:
	movw	r2, #2243
	ldr	r1, .L1505+16
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1503:
	ldr	r3, [r5, #980]
	cmp	r3, #8
	bls	.L1488
	ldr	r2, .L1505+20
	mov	r0, #0
	ldr	r1, .L1505+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1483
.L1488:
	add	r6, r6, r3, lsl #2
	ldr	r0, [r4, #3492]
	ldr	r1, [r6, #2800]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1504
	ldr	ip, [r3, #680]
	add	r1, r3, #8
	mov	r2, #664
	add	r0, r7, #8
	str	ip, [r7, #680]
	ldr	lr, [r3, #680]
	str	lr, [r7, #684]
	ldr	r3, [r3, #688]
	str	r3, [r7, #688]
	ldr	r3, [ip, #88]
	str	r3, [r7, #672]
	bl	memcpy
	ldrsb	r3, [r7, #3]
	mov	r0, #0
	strb	r0, [r7, #2]
	str	r3, [r7, #188]
	b	.L1483
.L1504:
	ldr	r3, .L1505+28
	mov	r2, #2272
	ldr	r1, .L1505+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1483
.L1506:
	.align	2
.L1505:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC6
	.word	.LC7
	.word	.LANCHOR0+604
	.word	.LC11
	.word	.LC12
	.word	.LC13
	UNWIND(.fnend)
	.size	VP9_GetImageBuffer, .-VP9_GetImageBuffer
	.align	2
	.global	VP9_FreeCurFb
	.type	VP9_FreeCurFb, %function
VP9_FreeCurFb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r5, r0, #270336
	add	r4, r0, #294912
	ldr	r1, [r5, #2596]
	cmp	r1, #0
	blt	.L1508
	mov	r2, #1
	ldr	r0, [r4, #3492]
	bl	FSP_ClearLogicFs
.L1508:
	ldr	r3, [r4, #3392]
	cmp	r3, #8
	addls	r3, r3, #18
	movls	r2, #0
	addls	r5, r5, r3, lsl #2
	strls	r2, [r5, #2612]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_FreeCurFb, .-VP9_FreeCurFb
	.align	2
	.global	VP9_SetImgFormat
	.type	VP9_SetImgFormat, %function
VP9_SetImgFormat:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r5, r0, #0
	beq	.L1512
	add	r2, r5, #270336
	add	r3, r5, #294912
	str	r2, [fp, #-48]
	ldr	r1, [r2, #2596]
	mov	r8, r2
	ldr	r0, [r3, #3492]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1512
	ldr	r6, [r5]
	add	r9, r4, #640
	mvn	r2, #0
	mvn	r3, #0
	mov	ip, #1
	mov	lr, #5
	ldrd	r6, [r6, #56]
	mov	r1, #0
	strd	r6, [r9]
	ldr	r6, [r5]
	strd	r2, [r6, #56]
	ldr	r6, [r8, #2604]
	ldrb	r3, [r4, #124]	@ zero_extendqisi2
	ldrb	r2, [r4, #125]	@ zero_extendqisi2
	bfi	r3, r6, #0, #2
	and	r3, r3, #227
	orr	r2, r2, #12
	bfi	r3, lr, #5, #3
	bfi	r2, ip, #4, #2
	strb	r3, [r4, #124]
	strb	r2, [r4, #125]
	ldr	r3, [r4, #124]
	bfc	r3, #14, #3
	str	r3, [r4, #124]
	mov	r3, r3, lsr #16
	bfc	r3, #1, #1
	strb	r3, [r4, #126]
	ldr	r3, [r5]
	ldrb	r2, [r4, #126]	@ zero_extendqisi2
	ldr	r3, [r3, #592]
	rsb	r3, ip, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #126]
	ldr	r3, [r8, #2604]
	and	r3, r3, #3
	str	r3, [r4, #116]
	ldr	r3, [r8, #2604]
	and	r3, r3, #3
	str	r3, [r4, #120]
	bl	SetAspectRatio
	ldr	r0, [r8, #2624]
	str	r0, [r4, #128]
	ldr	r2, [r8, #2628]
	str	r2, [r4, #132]
	ldr	r3, [r5]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L1523
	add	r3, r4, #544
	str	r3, [fp, #-56]
	add	r3, r4, #560
	str	r3, [fp, #-52]
.L1516:
	add	r3, r0, #255
	add	r6, r2, #63
	bic	r3, r3, #255
	bic	r10, r6, #63
	mov	r1, r3, asl #4
	str	r1, [r4, #164]
	ldr	r1, [fp, #-48]
	ldr	ip, [r1, #2468]
	mul	r1, r10, r3
	cmp	ip, #1
	movne	r6, #0
	movne	r8, r6
	beq	.L1524
.L1517:
	ldr	lr, [r5]
	add	ip, r3, #3
	cmp	r3, #0
	ldr	r7, [r4, #44]
	ldr	lr, [lr, #884]
	movlt	r3, ip
	add	ip, r1, r1, lsl #1
	mov	r3, r3, asr #2
	str	lr, [r4, #200]
	add	ip, r7, ip, asr #1
	ldr	r9, [r5]
	add	r7, r1, r7
	mla	r5, r3, r10, ip
	mov	lr, r0, lsr #1
	ldr	r9, [r9, #884]
	mov	r3, r3, asl #4
	str	r6, [r4, #172]
	ldr	r6, [fp, #-56]
	str	r8, [r4, #168]
	mov	r8, r2, lsr #1
	str	r9, [r4, #204]
	str	r7, [r4, #48]
	ldrd	r6, [r6]
	adds	r6, r6, r1
	adc	r7, r7, r1, asr #31
	ldr	r1, [fp, #-52]
	strd	r6, [r1, #-8]
	str	ip, [r4, #68]
	str	r0, [r4, #136]
	str	lr, [r4, #144]
	str	r2, [r4, #140]
	str	r8, [r4, #148]
	str	r5, [r4, #72]
	str	r3, [r4, #176]
.L1512:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1524:
	add	r8, r0, #2032
	mov	r6, r6, lsr #6
	add	r8, r8, #15
	bic	r8, r8, #2032
	mov	r6, r6, asl #5
	bic	r8, r8, #15
	mov	r8, r8, lsr #7
	mul	r6, r8, r6
	add	r1, r1, r6
	b	.L1517
.L1523:
	ldr	r3, [r4, #164]
	add	r2, r2, #15
	ldr	r1, [r4, #44]
	add	r6, r4, #544
	mov	r2, r2, lsr #4
	add	r9, r4, #560
	mov	r0, r3, asl #4
	str	r6, [fp, #-56]
	mov	r10, r9
	add	lr, r1, r3
	mul	r2, r2, r0
	str	r9, [fp, #-52]
	add	ip, r2, r1
	str	ip, [r4, #48]
	ldrd	r6, [r6]
	add	r3, ip, r3
	mov	r0, ip
	adds	r8, r6, r2
	adc	r9, r7, r2, asr #31
	strd	r8, [r10, #-8]
	str	r3, [r4, #40]
	str	ip, [r4, #32]
	str	r1, [r4, #28]
	str	lr, [r4, #36]
	strd	r6, [r10]
	str	r1, [r4, #60]
	bl	MEM_Phy2Vir
	ldr	r3, [r4, #32]
	mov	r2, #0
	str	r2, [r4, #572]
	ldr	r2, [r4, #132]
	str	r3, [r4, #64]
	str	r0, [r4, #568]
	ldr	r0, [r4, #128]
	b	.L1516
	UNWIND(.fnend)
	.size	VP9_SetImgFormat, .-VP9_SetImgFormat
	.align	2
	.global	VP9DEC_RecycleImage
	.type	VP9DEC_RecycleImage, %function
VP9DEC_RecycleImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r4, r0, #294912
	mov	r5, r1
	mov	r2, #0
	ldr	r0, [r4, #3492]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #3492]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L1526
	add	r5, r6, #608
	ldr	r0, [r4, #3492]
	ldr	r1, [r6, #600]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	strd	r8, [r5, #-8]
	ldr	r1, [r6, #608]
	ldr	r0, [r4, #3492]
	bl	FreeUsdByDec
	strd	r8, [r5]
.L1526:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9DEC_RecycleImage, .-VP9DEC_RecycleImage
	.align	2
	.global	VP9DEC_GetRemainImg
	.type	VP9DEC_GetRemainImg, %function
VP9DEC_GetRemainImg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #274432
	add	r0, r0, #1376
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetVoLastImageID
	UNWIND(.fnend)
	.size	VP9DEC_GetRemainImg, .-VP9DEC_GetRemainImg
	.align	2
	.global	VP9DEC_GetImageBuffer
	.type	VP9DEC_GetImageBuffer, %function
VP9DEC_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r4, r0, #294912
	mov	r5, r0
	ldr	r0, [r4, #3492]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #3492]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L1537
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1537:
	add	r1, r5, #274432
	ldr	r0, [r4, #3492]
	add	r1, r1, #1376
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9DEC_GetImageBuffer, .-VP9DEC_GetImageBuffer
	.align	2
	.global	Check_Sync_Code
	.type	Check_Sync_Code, %function
Check_Sync_Code:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #8
	mov	r4, r0
	bl	BsGet
	cmp	r0, #73
	beq	.L1539
.L1540:
	ldr	r1, .L1541
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1539:
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	cmp	r0, #131
	bne	.L1540
	mov	r0, r4
	mov	r1, #8
	bl	BsGet
	cmp	r0, #66
	bne	.L1540
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1542:
	.align	2
.L1541:
	.word	.LC14
	UNWIND(.fnend)
	.size	Check_Sync_Code, .-Check_Sync_Code
	.align	2
	.global	Read_Frame_Size
	.type	Read_Frame_Size, %function
Read_Frame_Size:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r1
	mov	r1, #16
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	mov	r1, #16
	add	r3, r0, #1
	mov	r0, r6
	str	r3, [r5]
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Read_Frame_Size, .-Read_Frame_Size
	.align	2
	.global	get_free_fb
	.type	get_free_fb, %function
get_free_fb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r0, [r1, #72]
	cmp	r0, #0
	beq	.L1545
	add	r3, r1, #72
	mov	r0, #1
.L1546:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1545
	add	r0, r0, #1
	cmp	r0, #9
	bne	.L1546
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1545:
	add	r3, r0, #18
	mov	r2, #1
	str	r2, [r1, r3, asl #2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	get_free_fb, .-get_free_fb
	.align	2
	.global	Setup_Display_Size
	.type	Setup_Display_Size, %function
Setup_Display_Size:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r3, r1
	ldr	lr, [r3, #52]
	mov	r1, #1
	ldr	ip, [r3, #56]
	mov	r2, #0
	mov	r4, r0
	str	r2, [fp, #-28]
	str	lr, [r3, #60]
	str	ip, [r3, #64]
	str	r2, [fp, #-24]
	bl	BsGet
	cmp	r0, #0
	beq	.L1554
	mov	r0, r4
	sub	r2, fp, #24
	sub	r1, fp, #28
	bl	Read_Frame_Size
.L1554:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	Setup_Display_Size, .-Setup_Display_Size
	.align	2
	.global	VP9_Update_CP_Size
	.type	VP9_Update_CP_Size, %function
VP9_Update_CP_Size:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	lr, [r0, #2484]
	ldr	ip, [r0, #2488]
	ldr	r3, [r0, #2432]
	add	r1, lr, #7
	add	r2, ip, #7
	bic	r1, r1, #7
	bic	r2, r2, #7
	add	r3, r0, r3, lsl #4
	mov	r5, r1, asr #3
	mov	r4, r2, asr #3
	str	r5, [r0, #2524]
	str	r4, [r0, #2528]
	str	r1, [r3, #2668]
	str	r2, [r3, #2672]
	str	lr, [r3, #2676]
	str	ip, [r3, #2680]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_Update_CP_Size, .-VP9_Update_CP_Size
	.align	2
	.global	Setup_Frame_Size
	.type	Setup_Frame_Size, %function
Setup_Frame_Size:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r1, #2484]
	mov	r4, r1
	ldr	r3, [r1, #2488]
	add	r5, r1, #2432
	add	r2, r5, #56
	add	r1, r5, #52
	str	ip, [r4, #2504]
	mov	r6, r0
	str	r3, [r4, #2508]
	bl	Read_Frame_Size
	ldr	r7, [r4, #2484]
	ldr	lr, [r4, #2488]
	mov	r1, r5
	ldr	r3, [r4, #2432]
	add	ip, r7, #7
	add	r2, lr, #7
	bic	ip, ip, #7
	bic	r2, r2, #7
	mov	r0, r6
	add	r3, r4, r3, lsl #4
	mov	r6, ip, asr #3
	mov	r5, r2, asr #3
	str	r6, [r4, #2524]
	str	r5, [r4, #2528]
	str	ip, [r3, #2668]
	str	r2, [r3, #2672]
	str	r7, [r3, #2676]
	str	lr, [r3, #2680]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	Setup_Display_Size
	UNWIND(.fnend)
	.size	Setup_Frame_Size, .-Setup_Frame_Size
	.align	2
	.global	setup_frame_size_with_refs
	.type	setup_frame_size_with_refs, %function
setup_frame_size_with_refs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r7, r1, #2432
	mov	r4, r1
	mov	r6, r0
	mov	r5, #0
.L1564:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	bne	.L1569
	add	r5, r5, #1
	cmp	r5, #3
	bne	.L1564
	ldr	ip, [r4, #2484]
	add	r2, r7, #56
	ldr	r3, [r4, #2488]
	add	r1, r7, #52
	mov	r0, r6
	str	ip, [r4, #2504]
	str	r3, [r4, #2508]
	bl	Read_Frame_Size
	ldr	r5, [r4, #2484]
	ldr	lr, [r4, #2488]
.L1563:
	ldr	r3, [r4, #2432]
	add	ip, r5, #7
	add	r2, lr, #7
	bic	ip, ip, #7
	bic	r2, r2, #7
	mov	r1, r7
	add	r3, r4, r3, lsl #4
	mov	r0, r6
	mov	r7, ip, asr #3
	mov	r6, r2, asr #3
	str	r7, [r4, #2524]
	str	r6, [r4, #2528]
	str	ip, [r3, #2668]
	str	r5, [r3, #2676]
	str	lr, [r3, #2680]
	str	r2, [r3, #2672]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	Setup_Display_Size
.L1569:
	add	r5, r5, #44
	ldr	r1, [r4, #2484]
	ldr	r2, [r4, #2488]
	ldr	r3, [r4, r5, asl #2]
	str	r1, [r4, #2504]
	str	r2, [r4, #2508]
	add	r3, r4, r3, lsl #4
	ldr	r5, [r3, #2676]
	str	r5, [r4, #2484]
	ldr	lr, [r3, #2680]
	str	lr, [r4, #2488]
	b	.L1563
	UNWIND(.fnend)
	.size	setup_frame_size_with_refs, .-setup_frame_size_with_refs
	.align	2
	.global	Set_Default_Lf_Deltas
	.type	Set_Default_Lf_Deltas, %function
Set_Default_Lf_Deltas:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r2, #1
	mov	r3, #0
	mvn	r1, #0
	strb	r2, [r0]
	strb	r2, [r0, #1]
	strb	r2, [r0, #2]
	strb	r3, [r0, #3]
	strb	r3, [r0, #6]
	strb	r3, [r0, #7]
	strb	r1, [r0, #4]
	strb	r1, [r0, #5]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Set_Default_Lf_Deltas, .-Set_Default_Lf_Deltas
	.align	2
	.global	VP9_Clearall_Segfeatures
	.type	VP9_Clearall_Segfeatures, %function
VP9_Clearall_Segfeatures:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1572
	mov	r4, r0
	mov	r2, #64
	mov	r1, #0
	add	r0, r0, #16
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r3, [r5, #48]
	add	r0, r4, #80
	mov	r2, #32
	mov	r1, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1573:
	.align	2
.L1572:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP9_Clearall_Segfeatures, .-VP9_Clearall_Segfeatures
	.align	2
	.global	VP9_Setup_Past_Independence
	.type	VP9_Setup_Past_Independence, %function
VP9_Setup_Past_Independence:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1575
	mov	r4, r0
	add	r0, r0, #2624
	mov	r2, #32
	mov	r1, #0
	add	r0, r0, #12
	ldr	r3, [r5, #48]
	blx	r3
	ldr	r5, [r5, #48]
	mov	r3, #0
	mov	ip, #1
	mvn	lr, #0
	mov	r1, r3
	strb	r3, [r4, #2559]
	add	r0, r4, #56
	strb	r3, [r4, #331]
	mov	r2, #16
	strb	r3, [r4, #334]
	strb	r3, [r4, #335]
	mov	r3, r5
	strb	ip, [r4, #328]
	strb	ip, [r4, #329]
	strb	ip, [r4, #330]
	strb	lr, [r4, #332]
	strb	lr, [r4, #333]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1576:
	.align	2
.L1575:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP9_Setup_Past_Independence, .-VP9_Setup_Past_Independence
	.align	2
	.global	Setup_LoopFilter
	.type	Setup_LoopFilter, %function
Setup_LoopFilter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	mov	r1, #6
	mov	r5, r0
	bl	BsGet
	mov	r1, #3
	str	r0, [r4, #8]
	mov	r0, r5
	bl	BsGet
	mov	r3, #0
	mov	r1, #1
	strb	r3, [r4, #1]
	str	r0, [r4, #12]
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #1]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r6, r4, #2
	add	r7, r4, #6
.L1581:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L1595
.L1580:
	add	r6, r6, #1
	cmp	r6, r7
	bne	.L1581
	add	r4, r4, #8
.L1583:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L1596
.L1582:
	add	r7, r7, #1
	cmp	r7, r4
	bne	.L1583
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1595:
	ldr	r2, .L1597
	mov	r1, #6
	mov	r0, r5
	bl	VP9_s_v
	strb	r0, [r6]
	b	.L1580
.L1596:
	ldr	r2, .L1597+4
	mov	r1, #6
	mov	r0, r5
	bl	VP9_s_v
	strb	r0, [r7]
	b	.L1582
.L1598:
	.align	2
.L1597:
	.word	.LC15
	.word	.LC16
	UNWIND(.fnend)
	.size	Setup_LoopFilter, .-Setup_LoopFilter
	.align	2
	.global	Read_Delta_Q
	.type	Read_Delta_Q, %function
Read_Delta_Q:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	mov	r1, #1
	ldr	r5, [r4]
	mov	r6, r0
	bl	BsGet
	cmp	r0, #0
	beq	.L1600
	mov	r0, r6
	ldr	r2, .L1604
	mov	r1, #4
	bl	VP9_s_v
.L1600:
	str	r0, [r4]
	subs	r0, r0, r5
	movne	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1605:
	.align	2
.L1604:
	.word	.LC17
	UNWIND(.fnend)
	.size	Read_Delta_Q, .-Read_Delta_Q
	.align	2
	.global	Setup_Quantization
	.type	Setup_Quantization, %function
Setup_Quantization:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r4, r1
	mov	r1, #8
	mov	r5, r0
	bl	BsGet
	add	r1, r4, #236
	str	r0, [r4, #232]
	mov	r0, r5
	bl	Read_Delta_Q
	add	r1, r4, #240
	mov	r0, r5
	bl	Read_Delta_Q
	mov	r0, r5
	add	r1, r4, #244
	bl	Read_Delta_Q
	ldr	r3, [r4, #232]
	cmp	r3, #0
	movne	r3, #0
	bne	.L1607
	ldr	r2, [r4, #236]
	cmp	r2, #0
	bne	.L1607
	ldr	r2, [r4, #240]
	cmp	r2, #0
	ldreq	r3, [r4, #244]
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
.L1607:
	str	r3, [r4, #44]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	Setup_Quantization, .-Setup_Quantization
	.align	2
	.global	VP9_Enable_Segfeature
	.type	VP9_Enable_Segfeature, %function
VP9_Enable_Segfeature:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r0, r1, lsl #2
	mov	r0, #1
	ldr	r3, [r1, #80]
	orr	r2, r3, r0, asl r2
	str	r2, [r1, #80]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_Enable_Segfeature, .-VP9_Enable_Segfeature
	.align	2
	.global	VP9_Seg_Feature_Data_Max
	.type	VP9_Seg_Feature_Data_Max, %function
VP9_Seg_Feature_Data_Max:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L1612
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #624]
	ldmfd	sp, {fp, sp, pc}
.L1613:
	.align	2
.L1612:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VP9_Seg_Feature_Data_Max, .-VP9_Seg_Feature_Data_Max
	.align	2
	.global	Get_Unsigned_Bits
	.type	Get_Unsigned_Bits, %function
Get_Unsigned_Bits:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #1
	bls	.L1618
	subs	r3, r0, #1
	beq	.L1619
	mov	r0, #0
.L1617:
	movs	r3, r3, lsr #1
	add	r0, r0, #1
	bne	.L1617
	ldmfd	sp, {fp, sp, pc}
.L1618:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1619:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Get_Unsigned_Bits, .-Get_Unsigned_Bits
	.align	2
	.global	Decode_Unsigned_Max
	.type	Decode_Unsigned_Max, %function
Decode_Unsigned_Max:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r1, #1
	mov	r4, r1
	movls	r1, #0
	bls	.L1622
	subs	r3, r4, #1
	beq	.L1626
	mov	r2, #0
.L1624:
	movs	r3, r3, lsr #1
	add	r2, r2, #1
	bne	.L1624
.L1623:
	mov	r1, r2
.L1622:
	bl	BsGet
	cmp	r0, r4
	movge	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1626:
	mov	r2, r3
	b	.L1623
	UNWIND(.fnend)
	.size	Decode_Unsigned_Max, .-Decode_Unsigned_Max
	.align	2
	.global	VP9_Is_Segfeature_Signed
	.type	VP9_Is_Segfeature_Signed, %function
VP9_Is_Segfeature_Signed:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, .L1629
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #640]
	ldmfd	sp, {fp, sp, pc}
.L1630:
	.align	2
.L1629:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VP9_Is_Segfeature_Signed, .-VP9_Is_Segfeature_Signed
	.align	2
	.global	VP9_Set_Segdata
	.type	VP9_Set_Segdata, %function
VP9_Set_Segdata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, .L1640
	mov	r9, r2, asl #2
	mov	r5, r3
	mov	r4, r2
	add	r3, r7, r9
	mov	r6, r0
	mov	r10, r1
	ldr	r8, [r3, #624]
	cmp	r8, r5
	blt	.L1637
.L1632:
	cmp	r5, #0
	blt	.L1638
.L1634:
	add	r4, r4, r10, lsl #2
	add	r4, r6, r4, lsl #1
	strh	r5, [r4, #16]	@ movhi
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1638:
	add	r7, r7, r9
	ldr	r0, [r7, #640]
	cmp	r0, #0
	beq	.L1639
.L1635:
	rsb	r3, r5, #0
	cmp	r8, r3
	bge	.L1634
	mov	r3, #3056
	ldr	r2, .L1640+4
	ldr	r1, .L1640+8
	mov	r0, #0
	bl	dprint_vfmw
	b	.L1634
.L1637:
	movw	r3, #3044
	add	r2, r7, #656
	ldr	r1, .L1640+8
	mov	r0, #0
	bl	dprint_vfmw
	b	.L1632
.L1639:
	movw	r3, #3051
	ldr	r2, .L1640+4
	ldr	r1, .L1640+8
	bl	dprint_vfmw
	b	.L1635
.L1641:
	.align	2
.L1640:
	.word	.LANCHOR0
	.word	.LANCHOR0+656
	.word	.LC18
	UNWIND(.fnend)
	.size	VP9_Set_Segdata, .-VP9_Set_Segdata
	.align	2
	.global	Mi_Cols_Aligned_To_Sb
	.type	Mi_Cols_Aligned_To_Sb, %function
Mi_Cols_Aligned_To_Sb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #7
	bic	r0, r0, #7
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Mi_Cols_Aligned_To_Sb, .-Mi_Cols_Aligned_To_Sb
	.align	2
	.global	To_Sbs
	.type	To_Sbs, %function
To_Sbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #7
	mov	r0, r0, asr #3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	To_Sbs, .-To_Sbs
	.align	2
	.global	VP9_Get_Tile_N_Bits
	.type	VP9_Get_Tile_N_Bits, %function
VP9_Get_Tile_N_Bits:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #7
	mov	r3, #0
	mov	r0, r0, asr #3
	cmp	r0, #3
	ble	.L1645
.L1646:
	add	r3, r3, #1
	mov	ip, r0, asr r3
	cmp	ip, #3
	bgt	.L1646
	sub	r3, r3, #1
	bic	r3, r3, r3, asr #31
.L1645:
	cmp	r0, #64
	mov	ip, #0
	ble	.L1647
	mov	lr, #64
.L1648:
	add	ip, ip, #1
	cmp	r0, lr, asl ip
	bgt	.L1648
.L1647:
	str	ip, [r1]
	str	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_Get_Tile_N_Bits, .-VP9_Get_Tile_N_Bits
	.align	2
	.global	Setup_Tile_Info
	.type	Setup_Tile_Info, %function
Setup_Tile_Info:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, [r1, #92]
	mov	r6, r1
	mov	r5, r0
	add	r2, r2, #7
	mov	r2, r2, asr #3
	cmp	r2, #3
	ble	.L1654
	mov	r4, #0
	b	.L1655
.L1666:
	mov	r4, r3
.L1655:
	add	r3, r4, #1
	mov	r1, r2, asr r3
	cmp	r1, #3
	bgt	.L1666
	cmp	r2, #64
	bic	r4, r4, r4, asr #31
	ble	.L1677
.L1664:
	mov	r3, #0
	mov	r1, #64
.L1657:
	add	r3, r3, #1
	cmp	r2, r1, asl r3
	bgt	.L1657
.L1656:
	subs	r4, r4, r3
	str	r3, [r6, #100]
	bne	.L1660
	b	.L1659
.L1662:
	ldr	r3, [r6, #100]
	subs	r4, r4, #1
	add	r3, r3, #1
	str	r3, [r6, #100]
	beq	.L1659
.L1660:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L1662
.L1659:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	str	r0, [r6, #104]
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r5
	mov	r1, #1
	bl	BsGet
	ldr	r3, [r6, #104]
	add	r0, r3, r0
	str	r0, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1654:
	cmp	r2, #64
	movgt	r4, #0
	bgt	.L1664
	mov	r3, #0
	str	r3, [r6, #100]
	b	.L1659
.L1677:
	mov	r3, #0
	b	.L1656
	UNWIND(.fnend)
	.size	Setup_Tile_Info, .-Setup_Tile_Info
	.align	2
	.global	Setup_Segmentation
	.type	Setup_Segmentation, %function
Setup_Segmentation:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r5, r1
	mov	r3, #0
	mov	r1, #1
	strb	r3, [r5, #1]
	mov	r6, r0
	strb	r3, [r5, #2]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	bne	.L1715
.L1679:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1715:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	beq	.L1682
	add	r4, r5, #4
	add	r7, r5, #11
	b	.L1684
.L1683:
	strb	r3, [r4, #1]!
	cmp	r4, r7
	beq	.L1716
.L1684:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r3, #255
	cmp	r0, #0
	beq	.L1683
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	uxtb	r3, r0
	strb	r3, [r4, #1]!
	cmp	r4, r7
	bne	.L1684
.L1716:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #4]
	cmp	r0, #0
	addne	r4, r5, #14
	bne	.L1687
	mvn	r3, #0
	strb	r3, [r5, #12]
	strb	r3, [r5, #13]
	strb	r3, [r5, #14]
.L1682:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #2]
	cmp	r0, #0
	beq	.L1679
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	add	r8, r5, #80
	mov	r7, #0
	ldr	r10, .L1719
	strb	r0, [r5, #3]
	mov	r0, r5
	bl	VP9_Clearall_Segfeatures
.L1689:
	mov	r4, #0
	mov	r9, #1
.L1692:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	cmp	r0, #0
	moveq	r3, r0
	bne	.L1717
.L1691:
	mov	r2, r4
	mov	r1, r7
	add	r4, r4, #1
	mov	r0, r5
	bl	VP9_Set_Segdata
	cmp	r4, #4
	bne	.L1692
	add	r7, r7, #1
	add	r8, r8, #4
	cmp	r7, #8
	bne	.L1689
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1717:
	ldr	r3, [r8]
	mov	r0, r6
	ldr	r1, [r10, r4, asl #2]
	orr	r3, r3, r9, asl r4
	str	r3, [r8]
	bl	Decode_Unsigned_Max
	ldr	r2, .L1719+4
	ldr	r2, [r2, r4, asl #2]
	cmp	r2, #0
	mov	r3, r0
	beq	.L1691
	str	r0, [fp, #-48]
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldr	r3, [fp, #-48]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r2, r0, #0
	eor	r3, r3, r2
	add	r3, r3, r0
	b	.L1691
.L1687:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r3, #255
	cmp	r0, #0
	bne	.L1718
.L1686:
	strb	r3, [r7, #1]!
	cmp	r7, r4
	bne	.L1687
	b	.L1682
.L1718:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	uxtb	r3, r0
	b	.L1686
.L1720:
	.align	2
.L1719:
	.word	.LANCHOR0+624
	.word	.LANCHOR0+640
	UNWIND(.fnend)
	.size	Setup_Segmentation, .-Setup_Segmentation
	.align	2
	.global	read_interp_filter_type
	.type	read_interp_filter_type, %function
read_interp_filter_type:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, .L1725
	mov	r4, r0
	sub	ip, fp, #20
	ldmia	r3, {r0, r1, r2, r3}
	stmdb	ip, {r0, r1, r2, r3}
	mov	r0, r4
	mov	r1, #1
	bl	BsGet
	cmp	r0, #0
	movne	r0, #4
	beq	.L1724
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1724:
	mov	r0, r4
	mov	r1, #2
	bl	BsGet
	sub	r3, fp, #20
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #-16]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1726:
	.align	2
.L1725:
	.word	.LANCHOR0+672
	UNWIND(.fnend)
	.size	read_interp_filter_type, .-read_interp_filter_type
	.align	2
	.global	setup_inter_inter
	.type	setup_inter_inter, %function
setup_inter_inter:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #60]
	ldr	r1, [r0, #68]
	ldr	r2, [r0, #64]
	cmp	r2, r3
	cmpeq	r3, r1
	movne	r3, #1
	moveq	r3, #0
	str	r3, [r0, #52]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	setup_inter_inter, .-setup_inter_inter
	.align	2
	.global	ref_cnt_fb
	.type	ref_cnt_fb, %function
ref_cnt_fb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r1]
	ldr	r3, [r0, ip, asl #2]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, ip, asl #2]
	str	r2, [r1]
	ldr	r3, [r0, r2, asl #2]
	add	r3, r3, #1
	str	r3, [r0, r2, asl #2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ref_cnt_fb, .-ref_cnt_fb
	.align	2
	.global	VP9_get_fixed_point_scale_factor
	.type	VP9_get_fixed_point_scale_factor, %function
VP9_get_fixed_point_scale_factor:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	subs	r3, r1, #0
	beq	.L1733
	mov	r0, r0, asl #14
	bl	__aeabi_idiv
.L1732:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1733:
	str	r3, [sp]
	mov	r0, #1
	movw	r3, #3249
	ldr	r2, .L1734
	ldr	r1, .L1734+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1732
.L1735:
	.align	2
.L1734:
	.word	.LANCHOR0+688
	.word	.LC19
	UNWIND(.fnend)
	.size	VP9_get_fixed_point_scale_factor, .-VP9_get_fixed_point_scale_factor
	.align	2
	.global	check_scale_factors
	.type	check_scale_factors, %function
check_scale_factors:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, r2, asl #1
	bgt	.L1740
	cmp	r1, r3, asl #1
	bgt	.L1740
	cmp	r2, r0, asl #4
	bgt	.L1740
	cmp	r3, r1, asl #4
	movle	r0, #1
	movgt	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1740:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	check_scale_factors, .-check_scale_factors
	.align	2
	.global	VP9_scaled_val
	.type	VP9_scaled_val, %function
VP9_scaled_val:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	smull	r2, r3, r0, r1
	mov	r0, r2, lsr #14
	orr	r0, r0, r3, asl #18
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VP9_scaled_val, .-VP9_scaled_val
	.align	2
	.global	vp9_setup_scale_factors
	.type	vp9_setup_scale_factors, %function
vp9_setup_scale_factors:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r1, r3, asl #1
	mov	ip, r1
	mov	r4, r0
	mov	r7, r2
	ldr	r6, [fp, #4]
	bgt	.L1743
	cmp	r2, r6, asl #1
	ble	.L1753
.L1743:
	mvn	r2, #0
	mov	r3, #16
	str	r2, [r4]
	stmib	r4, {r2, r3}
	str	r3, [r4, #12]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1753:
	cmp	r3, r1, asl #4
	bgt	.L1743
	cmp	r6, r2, asl #4
	bgt	.L1743
	cmp	r3, #0
	beq	.L1754
	mov	r1, r3
	mov	r0, ip, asl #14
	bl	__aeabi_idiv
	cmp	r6, #0
	mov	r5, r0
	str	r5, [r4]
	beq	.L1755
.L1746:
	mov	r1, r6
	mov	r0, r7, asl #14
	bl	__aeabi_idiv
	mov	r7, r0, asr #31
	ubfx	r3, r0, #10, #18
	mov	r1, r7, asl #4
	orr	r1, r1, r0, lsr #28
	orr	r1, r3, r1, asl #18
.L1747:
	mov	r7, r5, asr #31
	ubfx	r3, r5, #10, #18
	str	r0, [r4, #4]
	mov	r2, r7, asl #4
	str	r1, [r4, #12]
	orr	r2, r2, r5, lsr #28
	orr	r3, r3, r2, asl #18
	str	r3, [r4, #8]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1754:
	str	r3, [sp]
	mov	r0, #1
	movw	r3, #3249
	ldr	r2, .L1756
	ldr	r1, .L1756+4
	mvn	r5, #0
	bl	dprint_vfmw
	cmp	r6, #0
	str	r5, [r4]
	bne	.L1746
.L1755:
	ldr	r1, .L1756+4
	movw	r3, #3249
	str	r6, [sp]
	mov	r0, #1
	ldr	r2, .L1756
	bl	dprint_vfmw
	mvn	r1, #0
	mov	r0, r1
	ldr	r5, [r4]
	b	.L1747
.L1757:
	.align	2
.L1756:
	.word	.LANCHOR0+688
	.word	.LC19
	UNWIND(.fnend)
	.size	vp9_setup_scale_factors, .-vp9_setup_scale_factors
	.align	2
	.global	Vp9_Vfmw_ReadProfile
	.type	Vp9_Vfmw_ReadProfile, %function
Vp9_Vfmw_ReadProfile:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r1, #1
	mov	r5, r0
	bl	BsGet
	mov	r1, #1
	mov	r4, r0
	mov	r0, r5
	bl	BsGet
	orr	r4, r4, r0, asl #1
	cmp	r4, #2
	ble	.L1759
	mov	r0, r5
	mov	r1, #1
	bl	BsGet
	add	r4, r0, r4
.L1759:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Vfmw_ReadProfile, .-Vp9_Vfmw_ReadProfile
	.align	2
	.global	Vp9_ReadBitDepthColorSpaceSampling
	.type	Vp9_ReadBitDepthColorSpaceSampling, %function
Vp9_ReadBitDepthColorSpaceSampling:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r1, #2444]
	mov	r2, #8
	mov	r4, r1
	mov	r5, r0
	cmp	r3, #1
	str	r2, [r1, #2500]
	bls	.L1761
	mov	r1, #1
	bl	BsGet
	cmp	r0, #0
	movne	r3, #12
	moveq	r3, #10
	str	r3, [r4, #2500]
.L1761:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	cmp	r0, #7
	str	r0, [r4, #2448]
	beq	.L1763
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldr	r6, [r4, #2444]
	bic	r6, r6, #2
	cmp	r6, #1
	movne	r3, #1
	str	r0, [r4, #2452]
	strne	r3, [r4, #2480]
	strne	r3, [r4, #2476]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	str	r0, [r4, #2476]
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	str	r0, [r4, #2480]
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	BsGet
.L1763:
	ldr	r1, [r4, #2444]
	bic	r1, r1, #2
	cmp	r1, #1
	beq	.L1769
	movw	r3, #3352
	ldr	r2, .L1770
	ldr	r1, .L1770+4
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1769:
	mov	r3, #0
	mov	r0, r5
	str	r3, [r4, #2480]
	str	r3, [r4, #2476]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	BsGet
.L1771:
	.align	2
.L1770:
	.word	.LANCHOR0+724
	.word	.LC20
	UNWIND(.fnend)
	.size	Vp9_ReadBitDepthColorSpaceSampling, .-Vp9_ReadBitDepthColorSpaceSampling
	.align	2
	.global	Vp9_ReadCompressedHeader
	.type	Vp9_ReadCompressedHeader, %function
Vp9_ReadCompressedHeader:
	UNWIND(.fnstart)
	@ args = 24, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	lr, [fp, #16]
	mov	r4, #0
	mov	r7, r1
	cmp	lr, #0
	mov	r6, r2
	mov	r8, r3
	mov	r5, r0
	str	r4, [fp, #-48]
	ldr	r10, [fp, #8]
	ldr	r9, [fp, #12]
	beq	.L1777
.L1773:
	mov	r2, r5
	mov	r1, r4
	mov	r0, r7
	bl	Vp9_ReadCoefProbs
	ldr	r2, [fp, #4]
	mov	r0, r7
	mov	r3, r8
	sub	ip, fp, #48
	stmib	sp, {r9, r10}
	str	r2, [sp]
	mov	r1, r5
	mov	r2, r6
	str	ip, [sp, #12]
	bl	Vp9_PrepareReadModeInfo
	ldr	r3, [r5, #32]
	sub	r3, r3, #33
	cmn	r3, #-1073741790
	ldrhi	r3, [fp, #-48]
	movhi	r0, #0
	ldrhi	r2, [fp, #20]
	mvnls	r0, #0
	strhi	r3, [r2]
	ldrhi	r3, [fp, #24]
	strhi	r4, [r3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1777:
	bl	Vp9_ReadTxMode
	cmp	r0, #4
	mov	r4, r0
	bne	.L1773
	add	r0, r7, #2000
	mov	r1, r5
	add	r0, r0, #3
	bl	Vp9_ReadTxProbs
	b	.L1773
	UNWIND(.fnend)
	.size	Vp9_ReadCompressedHeader, .-Vp9_ReadCompressedHeader
	.align	2
	.global	Read_UnCompressed_Header
	.type	Read_UnCompressed_Header, %function
Read_UnCompressed_Header:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	mov	r4, r1
	ldr	r3, [r4, #2440]
	mov	r1, #2
	mov	r5, r0
	str	r3, [r4, #2436]
	bl	BsGet
	cmp	r0, #2
	beq	.L1779
	ldr	r1, .L1813
	mov	r0, #1
	bl	dprint_vfmw
.L1779:
	mov	r0, r5
	bl	Vp9_Vfmw_ReadProfile
	mov	r1, #1
	str	r0, [r4, #2444]
	mov	r0, r5
	bl	BsGet
	subs	r6, r0, #0
	bne	.L1809
	mov	r1, #1
	str	r6, [r4, #2460]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #2440]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #2456]
	mov	r0, r5
	bl	BsGet
	ldr	r2, [r4, #2440]
	cmp	r2, #0
	mov	r3, r0
	str	r0, [r4, #2472]
	beq	.L1810
	ldr	r2, [r4, #2456]
	cmp	r2, #0
	strne	r6, [r4, #2540]
	beq	.L1811
.L1785:
	cmp	r3, #0
	beq	.L1786
	mov	r3, #0
	str	r3, [r4, #2544]
.L1787:
	ldr	r3, [r4, #2540]
	cmp	r3, #0
	beq	.L1788
	mov	r0, r5
	bl	Check_Sync_Code
	ldr	r3, [r4, #2444]
	cmp	r3, #1
	bls	.L1789
	mov	r1, r4
	mov	r0, r5
	bl	Vp9_ReadBitDepthColorSpaceSampling
.L1790:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, r4
	str	r0, [r4, #2548]
	mov	r0, r5
	bl	Setup_Frame_Size
	b	.L1783
.L1809:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r3, #0
	mov	r6, r3
	mov	r2, #1
	add	r0, r0, #36
	ldr	r1, [r4, r0, asl #2]
	str	r3, [r4, #2548]
	str	r3, [r4, #336]
	str	r1, [r4, #2464]
	str	r2, [r4, #2460]
	str	r2, [r4, #2456]
.L1781:
	mov	r0, r6
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1788:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	add	r7, r4, #172
	add	r8, r4, #184
	mov	r9, r7
	str	r0, [r4, #2548]
.L1791:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	add	r3, r0, #36
	mov	r0, r5
	ldr	r3, [r4, r3, asl #2]
	str	r3, [r9, #4]!
	bl	BsGet
	cmp	r9, r8
	str	r0, [r9, #-116]
	bne	.L1791
	mov	r1, r4
	mov	r0, r5
	bl	setup_frame_size_with_refs
	ldr	r2, [r4, #2484]
	sub	r3, r2, #1
	cmp	r3, #4096
	ldr	r3, [r4, #2488]
	bcs	.L1793
	sub	r1, r3, #1
	cmp	r1, #4096
	bcs	.L1793
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	add	r9, r4, #2800
	add	r9, r9, #12
	str	r0, [r4, #48]
	mov	r0, r5
	bl	read_interp_filter_type
	str	r0, [r4, #2552]
.L1795:
	ldr	r1, [r7, #4]!
	mov	r0, r9
	ldr	ip, [r4, #2488]
	add	r9, r9, #16
	ldr	r3, [r4, #2484]
	add	r1, r4, r1, lsl #4
	add	r1, r1, #2656
	ldr	r2, [r1, #24]
	add	r1, r1, #12
	ldr	r1, [r1, #8]
	str	ip, [sp]
	bl	vp9_setup_scale_factors
	cmp	r8, r7
	bne	.L1795
	ldr	r3, [r4, #60]
	ldr	r1, [r4, #68]
	ldr	r2, [r4, #64]
	cmp	r2, r3
	cmpeq	r3, r1
	movne	r3, #1
	moveq	r3, #0
	str	r3, [r4, #52]
	b	.L1783
.L1810:
	mov	r0, r5
	bl	Check_Sync_Code
	mov	r1, r4
	mov	r0, r5
	bl	Vp9_ReadBitDepthColorSpaceSampling
	ldr	r3, [r4, #2432]
	mov	r2, #255
	mov	r1, r4
	str	r2, [r4, #2548]
	mov	r0, r5
	str	r3, [r4, #176]
	str	r3, [r4, #180]
	str	r3, [r4, #184]
	bl	Setup_Frame_Size
.L1783:
	ldr	r3, [r4, #2472]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #2512]
	strne	r3, [r4, #2516]
	beq	.L1812
.L1797:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #2440]
	cmp	r3, #0
	str	r0, [r4, #2520]
	beq	.L1798
	ldr	r3, [r4, #2472]
	cmp	r3, #0
	bne	.L1798
	ldr	r3, [r4, #2540]
	cmp	r3, #0
	bne	.L1798
.L1800:
	ldr	r3, [r4, #60]
	ldr	r1, [r4, #68]
	ldr	r2, [r4, #64]
	cmp	r2, r3
	cmpeq	r3, r1
	movne	r3, #1
	moveq	r3, #0
	str	r3, [r4, #52]
.L1799:
	add	r1, r4, #328
	mov	r0, r5
	bl	Setup_LoopFilter
	mov	r1, r4
	mov	r0, r5
	bl	Setup_Quantization
	add	r1, r4, #2544
	mov	r0, r5
	add	r1, r1, #12
	bl	Setup_Segmentation
	add	r1, r4, #2432
	mov	r0, r5
	bl	Setup_Tile_Info
	mov	r0, r5
	mov	r1, #16
	bl	BsGet
	str	r0, [r4]
	mov	r0, r6
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1789:
	mov	r3, #1
	mov	r2, #8
	str	r3, [r4, #2476]
	str	r2, [r4, #2500]
	str	r3, [r4, #2480]
	str	r3, [r4, #2448]
	b	.L1790
.L1798:
	mov	r0, r4
	bl	VP9_Setup_Past_Independence
	ldr	r3, [r4, #2440]
	cmp	r3, #0
	beq	.L1799
	b	.L1800
.L1812:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #2512]
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #2516]
	b	.L1797
.L1786:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #2544]
	b	.L1787
.L1811:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #2472]
	str	r0, [r4, #2540]
	b	.L1785
.L1793:
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	movw	r3, #3505
	ldr	r2, .L1813+4
	mvn	r6, #0
	ldr	r1, .L1813+8
	bl	dprint_vfmw
	b	.L1781
.L1814:
	.align	2
.L1813:
	.word	.LC21
	.word	.LANCHOR0+760
	.word	.LC22
	UNWIND(.fnend)
	.size	Read_UnCompressed_Header, .-Read_UnCompressed_Header
	.align	2
	.global	swap_frame_buffers
	.type	swap_frame_buffers, %function
swap_frame_buffers:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #2548]
	cmp	r3, #0
	addne	r2, r0, #144
	addne	lr, r0, #72
	beq	.L1820
.L1819:
	tst	r3, #1
	beq	.L1817
	ldr	r4, [r2]
	ldr	ip, [r0, #2432]
	ldr	r1, [lr, r4, asl #2]
	cmp	r1, #0
	sub	r1, r1, #1
	strgt	r1, [lr, r4, asl #2]
	str	ip, [r2]
	ldr	r1, [lr, ip, asl #2]
	add	r1, r1, #1
	str	r1, [lr, ip, asl #2]
.L1817:
	movs	r3, r3, asr #1
	add	r2, r2, #4
	bne	.L1819
.L1820:
	ldr	r3, [r0, #2432]
	mvn	r2, #-2147483648
	add	r3, r0, r3, lsl #2
	ldr	r1, [r3, #72]
	sub	r1, r1, #1
	str	r1, [r3, #72]
	str	r2, [r0, #176]
	str	r2, [r0, #180]
	str	r2, [r0, #184]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	swap_frame_buffers, .-swap_frame_buffers
	.align	2
	.global	VP9_Set_DecParam
	.type	VP9_Set_DecParam, %function
VP9_Set_DecParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r9, r0, #274432
	mov	r5, r0
	add	r4, r0, #270336
	ldr	r6, [r9, #976]
	cmp	r6, #1
	beq	.L1862
	add	r7, r0, #262144
	mov	r3, #0
	strb	r3, [r7, #1036]
	ldr	r3, [r9, #956]
	ldr	ip, [r4, #2608]
	ldr	r0, [r4, #2616]
	ldr	r1, [r4, #2620]
	ldr	r2, [r4, #2540]
	str	ip, [r4, #2116]
	str	r0, [r4, #2096]
	bic	r2, r2, #15
	str	r3, [r4, #2604]
	str	r2, [r4, #2128]
	str	r3, [r4, #2112]
	str	r1, [r4, #2100]
	ldr	r1, [r5]
	ldr	r2, [r4, #2796]
	ldr	ip, [r4, #2564]
	ldr	lr, [r1, #592]
	cmp	r2, #8
	ldr	r0, [r4, #2576]
	addgt	r6, r5, #294912
	addle	r2, r4, r2, lsl #2
	addle	r6, r5, #294912
	str	lr, [r4, #2468]
	ldr	r1, [r1, #632]
	str	ip, [r4, #2460]
	str	r0, [r4, #2464]
	str	r1, [r4, #2472]
	ldrgt	r2, [r6, #3392]
	addgt	r2, r4, r2, lsl #2
	ldr	r2, [r2, #2800]
	str	r2, [r4, #2588]
	ldr	r2, [r4, #2792]
	cmp	r2, #8
	ldrgt	r2, [r6, #3392]
	add	r2, r4, r2, lsl #2
	ldr	r2, [r2, #2800]
	str	r2, [r4, #2584]
	ldr	r2, [r4, #2788]
	cmp	r2, #8
	ldrgt	r2, [r6, #3392]
	cmp	r3, #0
	add	r2, r4, r2, lsl #2
	ldr	r2, [r2, #2800]
	str	r2, [r4, #2592]
	bne	.L1863
.L1839:
	ldr	r1, [r4, #2596]
	str	r1, [r4, #2588]
	str	r1, [r4, #2584]
	str	r1, [r4, #2592]
.L1840:
	ldr	r0, [r6, #3492]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #2588]
	mov	r8, r0
	ldr	r0, [r6, #3492]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #2584]
	str	r0, [fp, #-48]
	ldr	r0, [r6, #3492]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #2592]
	mov	r10, r0
	ldr	r0, [r6, #3492]
	bl	FSP_GetLogicFs
	cmp	r10, #0
	cmpne	r8, #0
	beq	.L1841
	ldr	r2, [fp, #-48]
	cmp	r0, #0
	cmpne	r2, #0
	beq	.L1841
	ldr	r1, [r8, #680]
	cmp	r1, #0
	beq	.L1864
	ldr	r1, [r8, #692]
	str	r1, [r4, #2456]
	ldr	r1, [r8, #680]
	ldr	r1, [r1, #28]
	str	r1, [r4, #2480]
	ldr	r1, [r8, #680]
	ldr	r1, [r1, #16]
	str	r1, [r4, #2440]
	ldr	r2, [r2, #680]
	cmp	r2, #0
	ldreq	r2, [r8, #680]
	ldr	r2, [r2, #16]
	str	r2, [r4, #2444]
	ldr	r2, [r10, #680]
	cmp	r2, #0
	ldreq	r2, [r8, #680]
	ldr	r2, [r2, #16]
	str	r2, [r4, #2448]
	ldr	r3, [r0, #680]
	ldr	r2, [r4, #2468]
	cmp	r3, #0
	ldreq	r3, [r8, #680]
	cmp	r2, #1
	ldr	r3, [r3, #16]
	str	r3, [r4, #2452]
	ldr	r3, [r8, #680]
	ldr	r3, [r3, #36]
	str	r3, [r4, #2492]
	ldr	r3, [r8, #680]
	ldr	r3, [r3, #40]
	str	r3, [r4, #2496]
	ldr	lr, [r9, #1000]
	add	r3, lr, #255
	bic	r3, r3, #255
	mov	r2, r3, asl #4
	str	r2, [r4, #2104]
	ldr	r8, [r9, #1004]
	add	r0, r8, #63
	bic	r1, r0, #63
	mul	r2, r1, r3
	str	r2, [r4, #2108]
	beq	.L1865
.L1849:
	add	r0, r3, #3
	cmp	r3, #0
	add	r2, r2, r2, lsl #1
	movlt	r3, r0
	mov	r0, #0
	mov	r3, r3, asr #2
	mov	r2, r2, lsr #1
	str	r2, [r4, #2504]
	add	r2, r5, #8
	mov	r3, r3, asl #4
	str	r3, [r4, #2500]
	mov	r3, r3, lsr #4
	mul	r3, r1, r3
	str	r3, [r4, #2508]
	ldr	r3, [r6, #3500]
	str	r3, [r6, #3496]
	str	r3, [r7, #1032]
	str	r2, [r5, #4]
.L1829:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1863:
	ldr	r3, [r9, #1056]
	cmp	r3, #1
	beq	.L1839
	ldr	r1, [r4, #2596]
	b	.L1840
.L1865:
	add	ip, lr, #2032
	add	lr, lr, #4080
	add	ip, ip, #15
	add	lr, lr, #14
	cmp	ip, #0
	movlt	ip, lr
	cmp	r0, #0
	addlt	r0, r8, #126
	mov	ip, ip, asr #11
	mov	r0, r0, asr #6
	mov	ip, ip, asl #4
	str	ip, [r4, #2484]
	mov	r0, r0, asl #5
	mul	r0, ip, r0
	add	r2, r2, r0
	str	r2, [r4, #2108]
	str	r0, [r4, #2488]
	b	.L1849
.L1862:
	add	r3, r0, #262144
	add	r7, r0, #294912
	strb	r6, [r3, #1036]
	ldr	r3, [r0]
	ldr	r1, [r4, #2596]
	ldr	r2, [r3, #592]
	str	r2, [r4, #2468]
	ldr	r3, [r3, #632]
	str	r3, [r4, #2472]
	ldr	r0, [r7, #3492]
	bl	FSP_GetLogicFs
	ldr	r3, [r9, #980]
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #2800]
	mov	r8, r0
	ldr	r0, [r7, #3492]
	bl	FSP_GetLogicFs
	ldr	r3, [r9, #980]
	add	r3, r4, r3, lsl #2
	ldr	r1, [r3, #2800]
	mov	r10, r0
	ldr	r0, [r7, #3492]
	bl	FSP_GetFsImagePtr
	cmp	r8, #0
	cmpne	r10, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	r2, r0
	cmp	r3, #0
	bne	.L1841
	ldr	r3, [r8, #680]
	cmp	r3, #0
	beq	.L1866
	ldr	r3, [r3, #16]
	mov	r1, #0
	mov	r0, r1
	str	r3, [r4, #2440]
	ldr	r3, [r10, #680]
	cmp	r3, #0
	ldreq	r3, [r8, #680]
	ldr	r3, [r3, #16]
	str	r3, [r4, #2448]
	ldr	r3, [r8, #680]
	ldr	r3, [r3, #28]
	str	r3, [r4, #2480]
	ldr	r3, [r2, #128]
	add	r3, r3, #63
	mov	r3, r3, lsr #6
	str	r3, [r4, #2096]
	ldr	r3, [r2, #132]
	add	r3, r3, #63
	mov	r3, r3, lsr #6
	str	r3, [r4, #2100]
	str	r1, [r5, #4]
	ldr	r3, [r2, #128]
	str	r3, [r4, #2624]
	ldr	r3, [r2, #132]
	str	r3, [r4, #2628]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1841:
	ldr	r1, .L1867
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1829
.L1864:
	ldr	r1, .L1867+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1829
.L1866:
	mov	r0, r6
	ldr	r1, .L1867+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1829
.L1868:
	.align	2
.L1867:
	.word	.LC23
	.word	.LC25
	.word	.LC24
	UNWIND(.fnend)
	.size	VP9_Set_DecParam, .-VP9_Set_DecParam
	.align	2
	.global	VP9_ArrangeVHBMem
	.type	VP9_ArrangeVHBMem, %function
VP9_ArrangeVHBMem:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #48)
	sub	sp, sp, #48
	add	r4, r0, #270336
	mov	r5, r0
	ldr	r3, [r4, #2628]
	ldr	r2, [r4, #2624]
	cmp	r3, #31
	bls	.L1871
	sub	r0, r2, #32
	movw	r1, #8160
	cmp	r3, #8192
	cmpls	r0, r1
	bls	.L1872
.L1871:
	ldr	r1, .L1898
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L1873:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1872:
	ldr	r1, .L1898+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, [r5]
	ldr	r3, [r1, #708]
	cmp	r3, #0
	bne	.L1874
	ldr	r2, [r1, #28]
	cmp	r2, #25
	beq	.L1895
.L1887:
	mov	r8, #5
.L1875:
	ldr	r6, [r4, #2552]
	cmp	r6, #0
	bne	.L1880
	add	r7, r5, #294912
	ldr	r3, .L1898+8
	ldr	ip, .L1898+12
	mov	r1, r6
	ldr	lr, [r7, #3492]
	mov	r2, #32
	sub	r0, fp, #68
	ldr	ip, [ip, #48]
	ldr	r3, [r3, lr, asl #2]
	add	r3, r3, #307200
	str	r6, [r3, #3288]
	blx	ip
	ldr	ip, [r4, #2624]
	ldr	r2, [r4, #2628]
	sub	r1, fp, #68
	ldr	r0, [r7, #3492]
	mov	r3, #1
	strb	r6, [fp, #-67]
	strb	r6, [fp, #-66]
	strb	r8, [fp, #-63]
	str	ip, [fp, #-60]
	str	ip, [fp, #-44]
	str	r2, [fp, #-56]
	str	r2, [fp, #-40]
	strb	r3, [fp, #-65]
	strb	r3, [fp, #-62]
	bl	FSP_ConfigInstance
	subs	r6, r0, #0
	beq	.L1896
.L1881:
	ldr	r1, .L1898+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1873
.L1874:
	ldr	r3, [r1, #28]
	cmp	r3, #25
	bne	.L1887
	ldr	r2, [r4, #2624]
	ldr	ip, [r1, #668]
	cmp	r2, ip
	bhi	.L1878
	ldr	r0, [r4, #2628]
	ldr	r3, [r1, #672]
	cmp	r0, r3
	bls	.L1879
.L1878:
	ldr	lr, [r1, #672]
	mov	r0, #0
	ldr	r3, [r4, #2628]
	ldr	r1, .L1898+20
	str	ip, [sp]
	str	lr, [sp, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1873
.L1880:
	add	r6, r5, #294912
	ldr	r8, .L1898+8
	ldr	r2, .L1898+12
	mov	r7, #1
	ldr	r3, [r6, #3492]
	mov	r1, #0
	ldr	r9, [r6, #3364]
	sub	r0, fp, #68
	ldr	ip, [r2, #48]
	mov	r2, #32
	ldr	r3, [r8, r3, asl #2]
	add	r3, r3, #307200
	str	r7, [r3, #3288]
	blx	ip
	ldr	r2, [r4, #2628]
	ldr	r0, [r5]
	mov	r1, #0
	ldr	r3, [r4, #2624]
	str	r2, [fp, #-40]
	ldr	r0, [r0, #28]
	strb	r1, [fp, #-67]
	sub	r1, fp, #68
	cmp	r0, #24
	ldr	r0, [r6, #3492]
	uxtbne	r7, r9
	str	r3, [fp, #-60]
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r2, [fp, #-56]
	strb	r7, [fp, #-65]
	strb	r3, [fp, #-63]
	strb	r3, [fp, #-62]
	strb	r3, [fp, #-66]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L1881
	ldr	r1, [r5]
	sub	r3, fp, #72
	ldr	r0, [r6, #3492]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #0
	bne	.L1897
.L1884:
	ldr	r3, [r6, #3492]
	mov	r2, #0
	ldr	r3, [r8, r3, asl #2]
	str	r2, [r3, #1424]
.L1882:
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #2552]
	b	.L1873
.L1895:
	ldr	r2, [r4, #2624]
	ldr	ip, [r1, #668]
	cmp	r2, ip
	bhi	.L1878
	ldr	lr, [r4, #2628]
	ldr	r0, [r1, #672]
	cmp	lr, r0
	bhi	.L1878
	ldr	r2, [r4, #2552]
	cmp	r2, #1
	moveq	r0, r3
	beq	.L1873
.L1879:
	ldr	r8, [r1, #716]
	b	.L1875
.L1896:
	ldr	r1, [r5]
	sub	r3, fp, #72
	ldr	r0, [r7, #3492]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #0
	beq	.L1882
	mov	r0, r6
	ldr	r1, .L1898+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1873
.L1897:
	ldr	r1, .L1898+28
	mov	r0, #2
	bl	dprint_vfmw
	b	.L1884
.L1899:
	.align	2
.L1898:
	.word	.LC26
	.word	.LC27
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	.LC28
	.word	.LC29
	.word	.LC31
	UNWIND(.fnend)
	.size	VP9_ArrangeVHBMem, .-VP9_ArrangeVHBMem
	.align	2
	.global	VP9_GetRefNum
	.type	VP9_GetRefNum, %function
VP9_GetRefNum:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #76)
	sub	sp, sp, #76
	ldr	r8, .L1919
	movw	r6, #10804
	sub	r4, fp, #72
	add	r7, r0, #274432
	movt	r6, 4
	add	r6, r0, r6
	ldr	r3, [r8, #52]
	add	r1, r6, #72
	mov	r2, #36
	mov	r0, r4
	ldr	r5, [r7, #948]
	blx	r3
	ldr	r3, [r8, #52]
	add	r1, r6, #144
	sub	r0, fp, #104
	mov	r2, #32
	blx	r3
	ldr	r3, [r7, #976]
	cmp	r3, #1
	beq	.L1918
.L1901:
	ldr	r3, [r7, #1064]
	mov	lr, r5, asl #2
	cmp	r3, #0
	subne	r2, fp, #104
	addne	r0, r4, lr
	beq	.L1908
.L1907:
	tst	r3, #1
	beq	.L1905
	ldr	ip, [r2]
	str	r5, [r2]
	ldr	r1, [r4, ip, asl #2]
	cmp	r1, #0
	sub	r1, r1, #1
	strgt	r1, [r4, ip, asl #2]
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r1, [r0]
.L1905:
	movs	r3, r3, asr #1
	add	r2, r2, #4
	bne	.L1907
.L1908:
	sub	r3, fp, #36
	sub	r1, fp, #40
	add	r2, r3, lr
	sub	r3, fp, #76
	mov	r0, #0
	ldr	ip, [r2, #-36]
	sub	ip, ip, #1
	str	ip, [r2, #-36]
.L1904:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	addne	r0, r0, #1
	cmp	r3, r1
	bne	.L1904
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1918:
	ldr	r3, [r4, r5, asl #2]
	ldr	r2, [r7, #980]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, r5, asl #2]
	ldr	r3, [r4, r2, asl #2]
	mov	r5, r2
	add	r3, r3, #1
	str	r3, [r4, r2, asl #2]
	b	.L1901
.L1920:
	.align	2
.L1919:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP9_GetRefNum, .-VP9_GetRefNum
	.align	2
	.global	Vp9_DefaultCoefProbs
	.type	Vp9_DefaultCoefProbs, %function
Vp9_DefaultCoefProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1922
	mov	r2, #432
	ldr	r4, .L1922+4
	mov	r6, r0
	ldr	r3, [r5, #52]
	mov	r1, r4
	blx	r3
	ldr	r3, [r5, #52]
	add	r1, r4, #432
	add	r0, r6, #432
	mov	r2, #432
	blx	r3
	ldr	r3, [r5, #52]
	add	r1, r4, #864
	add	r0, r6, #864
	mov	r2, #432
	blx	r3
	ldr	r3, [r5, #52]
	add	r1, r4, #1296
	add	r0, r6, #1296
	mov	r2, #432
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1923:
	.align	2
.L1922:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	Vp9_DefaultCoefProbs, .-Vp9_DefaultCoefProbs
	.align	2
	.global	Vp9_InitMbmodeProbs
	.type	Vp9_InitMbmodeProbs, %function
Vp9_InitMbmodeProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, .L1925
	mov	r4, r0
	ldr	r6, .L1925+4
	add	r0, r0, #1760
	mov	r2, #90
	add	r0, r0, #4
	ldr	r3, [r5, #52]
	add	r1, r6, #1728
	blx	r3
	add	r1, r6, #1808
	ldr	r3, [r5, #52]
	add	r1, r1, #12
	add	r0, r4, #1728
	mov	r2, #36
	blx	r3
	add	r0, r4, #1936
	ldr	r3, [r5, #52]
	add	r1, r6, #1856
	mov	r2, #8
	add	r0, r0, #14
	blx	r3
	add	r1, r6, #1856
	add	r0, r4, #1840
	ldr	r3, [r5, #52]
	add	r1, r1, #8
	mov	r2, #96
	add	r0, r0, #14
	blx	r3
	add	r1, r6, #1952
	add	r0, r4, #1968
	ldr	r3, [r5, #52]
	add	r1, r1, #8
	mov	r2, #4
	add	r0, r0, #11
	blx	r3
	add	r1, r6, #1952
	add	r0, r4, #1968
	ldr	r3, [r5, #52]
	add	r1, r1, #12
	mov	r2, #5
	add	r0, r0, #15
	blx	r3
	add	r1, r6, #1968
	add	r0, r4, #1984
	ldr	r3, [r5, #52]
	add	r1, r1, #4
	mov	r2, #5
	add	r0, r0, #14
	blx	r3
	add	r1, r6, #1968
	add	r0, r4, #1984
	ldr	r3, [r5, #52]
	add	r1, r1, #12
	mov	r2, #10
	add	r0, r0, #4
	blx	r3
	add	r0, r4, #2000
	mov	r2, #12
	ldr	r1, .L1925+8
	add	r0, r0, #3
	bl	memcpy
	add	r1, r6, #1984
	add	r0, r4, #2000
	add	r1, r1, #8
	add	r0, r0, #15
	ldr	r3, [r5, #52]
	mov	r2, #3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1926:
	.align	2
.L1925:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR0+788
	UNWIND(.fnend)
	.size	Vp9_InitMbmodeProbs, .-Vp9_InitMbmodeProbs
	.align	2
	.global	Vp9_InitMvProbs
	.type	Vp9_InitMvProbs, %function
Vp9_InitMvProbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #2016
	mov	r2, #69
	ldr	r1, .L1928
	add	r0, r0, #2
	bl	memcpy
	ldmfd	sp, {fp, sp, pc}
.L1929:
	.align	2
.L1928:
	.word	.LANCHOR0+800
	UNWIND(.fnend)
	.size	Vp9_InitMvProbs, .-Vp9_InitMvProbs
	.align	2
	.global	Vp9_SetupPastIndependence
	.type	Vp9_SetupPastIndependence, %function
Vp9_SetupPastIndependence:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	mov	r4, r3
	mov	r6, r1
	mov	r7, r2
	ldr	r9, [fp, #4]
	ldr	r8, [fp, #8]
	bl	Vp9_DefaultCoefProbs
	mov	r0, r5
	bl	Vp9_InitMbmodeProbs
	add	r0, r5, #2016
	mov	r2, #69
	ldr	r1, .L1938
	add	r0, r0, #2
	bl	memcpy
	ldr	r3, .L1938+4
	add	r0, r5, #1952
	mov	r2, #21
	add	r0, r0, #6
	ldr	r1, .L1938+8
	ldr	r3, [r3, #52]
	blx	r3
	sub	lr, r4, #3
	clz	lr, lr
	mov	lr, lr, lsr #5
	cmp	r9, #0
	moveq	ip, lr
	orrne	ip, lr, #1
	cmp	r8, #0
	orreq	ip, ip, #1
	cmp	ip, #0
	bne	.L1936
	cmp	r4, #2
	beq	.L1937
.L1933:
	mov	r3, #0
	str	r3, [r7]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1936:
	mov	r4, #0
	movw	r8, #8348
.L1932:
	add	r0, r6, r4
	add	r4, r4, #2080
	add	r4, r4, #7
	movw	r2, #2087
	mov	r1, r5
	bl	memcpy
	cmp	r4, r8
	bne	.L1932
	b	.L1933
.L1937:
	ldr	r0, [r7]
	movw	r2, #2087
	mov	r1, r5
	mla	r0, r2, r0, r6
	bl	memcpy
	b	.L1933
.L1939:
	.align	2
.L1938:
	.word	.LANCHOR0+800
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+1996
	UNWIND(.fnend)
	.size	Vp9_SetupPastIndependence, .-Vp9_SetupPastIndependence
	.align	2
	.global	Vp9_Vfmw_SegfeatureActive
	.type	Vp9_Vfmw_SegfeatureActive, %function
Vp9_Vfmw_SegfeatureActive:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1942
	add	r1, r1, #20
	mov	ip, #1
	ldr	r3, [r0, r1, asl #2]
	ands	r3, r3, ip, asl r2
	movne	r0, ip
	moveq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1942:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Vfmw_SegfeatureActive, .-Vp9_Vfmw_SegfeatureActive
	.align	2
	.global	Vp9_Vfmw_GetSegdata
	.type	Vp9_Vfmw_GetSegdata, %function
Vp9_Vfmw_GetSegdata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r2, r2, r1, lsl #2
	add	r0, r0, r2, lsl #1
	ldrsh	r0, [r0, #16]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Vfmw_GetSegdata, .-Vp9_Vfmw_GetSegdata
	.align	2
	.global	Vp9_Vfmw_Clamp
	.type	Vp9_Vfmw_Clamp, %function
Vp9_Vfmw_Clamp:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, r1
	movlt	r0, r1
	cmp	r0, r2
	movge	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Vfmw_Clamp, .-Vp9_Vfmw_Clamp
	.align	2
	.global	Vp9_Vfmw_LoopFilterFrameInit
	.type	Vp9_Vfmw_LoopFilterFrameInit, %function
Vp9_Vfmw_LoopFilterFrameInit:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r7, r2, #80
	mov	r9, r2
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r10, r3
	mov	r4, r3, asr #5
	add	r3, r2, #112
	str	r3, [fp, #-48]
.L1951:
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1954
	ldr	r3, [r7]
	tst	r3, #2
	beq	.L1954
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	ldrsh	r1, [r8, #18]
	cmp	r3, #1
	ldrb	r3, [r5]	@ zero_extendqisi2
	addne	r1, r1, r10
	cmp	r3, #0
	usat	r1, #6, r1
	beq	.L1959
.L1948:
	mov	r0, r5
	add	lr, r5, #5
	ldrsb	r3, [r0, #2]!
	mov	ip, r6
	add	r3, r1, r3, asl r4
	usat	r3, #6, r3
	strb	r3, [r6]
.L1950:
	ldrsb	r3, [r0, #1]!
	add	ip, ip, #2
	ldrsb	r2, [r5, #6]
	cmp	r0, lr
	add	r3, r1, r3, asl r4
	add	r3, r3, r2, asl r4
	usat	r3, #6, r3
	strb	r3, [ip]
	ldrsb	r3, [r0]
	ldrsb	r2, [r5, #7]
	add	r3, r1, r3, asl r4
	add	r3, r3, r2, asl r4
	usat	r3, #6, r3
	strb	r3, [ip, #1]
	bne	.L1950
.L1949:
	ldr	r3, [fp, #-48]
	add	r7, r7, #4
	add	r6, r6, #8
	add	r8, r8, #8
	cmp	r7, r3
	bne	.L1951
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1954:
	ldrb	r3, [r5]	@ zero_extendqisi2
	mov	r1, r10
	cmp	r3, #0
	bne	.L1948
.L1959:
	ldr	r3, .L1960
	mov	r2, #8
	mov	r0, r6
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1949
.L1961:
	.align	2
.L1960:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Vp9_Vfmw_LoopFilterFrameInit, .-Vp9_Vfmw_LoopFilterFrameInit
	.align	2
	.global	Vp9_MiColsAlignedToSb
	.type	Vp9_MiColsAlignedToSb, %function
Vp9_MiColsAlignedToSb:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #7
	bic	r0, r0, #7
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_MiColsAlignedToSb, .-Vp9_MiColsAlignedToSb
	.align	2
	.global	Vp9_ToSbs
	.type	Vp9_ToSbs, %function
Vp9_ToSbs:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r0, r0, #7
	mov	r0, r0, asr #3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_ToSbs, .-Vp9_ToSbs
	.align	2
	.global	Vp9_GetTileOffsets
	.type	Vp9_GetTileOffsets, %function
Vp9_GetTileOffsets:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	lr, [fp, #4]
	add	ip, lr, #7
	mov	ip, ip, asr #3
	mul	r2, ip, r2
	add	ip, r2, ip
	mov	r2, r2, asr r3
	mov	r3, ip, asr r3
	mov	r2, r2, asl #3
	mov	r3, r3, asl #3
	cmp	r2, lr
	movge	r2, lr
	cmp	r3, lr
	str	r2, [r0]
	movge	r3, lr
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_GetTileOffsets, .-Vp9_GetTileOffsets
	.align	2
	.global	Vp9_GetTileRowOffsets
	.type	Vp9_GetTileRowOffsets, %function
Vp9_GetTileRowOffsets:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	ip, r1, #7
	ldr	lr, [fp, #4]
	mov	ip, ip, asr #3
	mul	r0, ip, r0
	add	ip, r0, ip
	mov	r0, r0, asr r2
	mov	r2, ip, asr r2
	mov	r0, r0, asl #3
	mov	r2, r2, asl #3
	cmp	r0, r1
	movge	r0, r1
	cmp	r2, r1
	str	r0, [r3]
	movge	r2, r1
	str	r2, [lr]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_GetTileRowOffsets, .-Vp9_GetTileRowOffsets
	.align	2
	.global	Vp9_Vfmw_GetTileColOffsets
	.type	Vp9_Vfmw_GetTileColOffsets, %function
Vp9_Vfmw_GetTileColOffsets:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	ip, r1, #7
	ldr	lr, [fp, #4]
	mov	ip, ip, asr #3
	mul	r0, ip, r0
	add	ip, r0, ip
	mov	r0, r0, asr r2
	mov	r2, ip, asr r2
	mov	r0, r0, asl #3
	mov	r2, r2, asl #3
	cmp	r0, r1
	movge	r0, r1
	cmp	r2, r1
	str	r0, [r3]
	movge	r2, r1
	str	r2, [lr]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_Vfmw_GetTileColOffsets, .-Vp9_Vfmw_GetTileColOffsets
	.align	2
	.global	Vp9_SetPoolInfoFrame
	.type	Vp9_SetPoolInfoFrame, %function
Vp9_SetPoolInfoFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r3, r0, #270336
	add	ip, r0, #274432
	add	r9, r0, #294912
	ldr	r2, [r3, #2836]
	ldr	r6, [r3, #2840]
	and	r4, r2, #7
	ldr	lr, [ip, #956]
	ldr	r2, [ip, #952]
	and	r6, r6, #3
	ldr	r7, [ip, #1016]
	mov	r4, r4, asl #10
	orr	r6, r4, r6, asl #13
	ldr	r8, [ip, #1032]
	ldr	r4, [ip, #1056]
	and	lr, lr, #1
	and	r2, r2, #3
	orr	lr, r6, lr
	and	r5, r7, #15
	ldr	r7, [ip, #1028]
	orr	r2, lr, r2, asl #1
	and	r8, r8, #1
	orr	r2, r2, r5, asl #15
	ldr	lr, [ip, #996]
	and	r7, r7, #1
	mov	r4, r4, asl #7
	orr	r5, r2, r8, asl #9
	ldr	r6, [ip, #992]
	orr	r5, r5, r7, asl #8
	ldr	r2, [ip, #988]
	uxtb	r4, r4
	and	lr, lr, #1
	orr	r4, r5, r4
	and	r6, r6, #1
	ldr	r5, [ip, #984]
	orr	lr, r4, lr, asl #6
	and	r2, r2, #1
	orr	lr, lr, r6, asl #5
	and	r4, r5, #1
	orr	r2, lr, r2, asl #4
	orr	r2, r2, r4, asl #3
	str	r2, [r1]
	ldr	lr, [ip, #1000]
	ldr	r2, [r9, #3384]
	cmp	lr, r2
	movne	r6, #1048576
	beq	.L2004
.L1968:
	ldr	r2, [r3, #2792]
	mov	r7, #0
	ldr	lr, [r3, #2796]
	ldr	r5, [r3, #2680]
	mov	r2, r2, asl #12
	ldr	r8, [ip, #1068]
	ldr	r4, [r3, #2788]
	and	lr, lr, #15
	uxth	r2, r2
	and	r8, r8, #7
	orr	r2, r2, lr, asl #16
	and	r4, r4, #15
	ldr	lr, [r3, #2676]
	mov	r5, r5, asl #7
	ldr	r10, [r3, #2672]
	orr	r2, r2, r8
	orr	r4, r2, r4, asl #8
	ldr	r8, [r3, #2668]
	uxtb	r5, r5
	and	lr, lr, #1
	orr	r4, r4, r5
	and	r10, r10, #1
	ldr	r5, [r3, #2660]
	orr	r4, r4, lr, asl #6
	and	r2, r8, #1
	orr	lr, r4, r10, asl #5
	and	r4, r5, #1
	orr	lr, lr, r2, asl #4
	orr	r2, lr, r4, asl #3
	orr	r2, r2, r6
	str	r2, [r1, #4]
	ldr	lr, [ip, #1004]
	ldr	r2, [ip, #1000]
	add	lr, lr, #7
	add	r2, r2, #7
	mov	lr, lr, asr #3
	sub	lr, lr, #1
	mov	r2, r2, asr #3
	sub	r2, r2, #1
	orr	r2, r2, lr, asl #16
	str	r2, [r1, #8]
	ldr	lr, [r3, #2948]
	ldr	r2, [r3, #2952]
	and	lr, lr, #63
	and	r2, r2, #7
	orr	r2, r2, lr, asl #8
	str	r2, [r1, #12]
.L1969:
	add	r5, r1, r7, lsl #3
	mov	r8, r7, asl #2
	add	r5, r5, #12
	mov	r6, #0
.L1970:
	mov	lr, r6, asl #1
	add	r6, r6, #1
	add	r4, lr, #1
	add	lr, r8, lr
	add	r4, r8, r4
	cmp	r6, #2
	add	r10, r3, lr, lsl #1
	add	r2, r3, r4, lsl #1
	mov	lr, r10
	ldrb	r10, [r10, #2860]	@ zero_extendqisi2
	mov	r4, r2
	ldrb	r2, [r2, #2860]	@ zero_extendqisi2
	ldrb	r4, [r4, #2861]	@ zero_extendqisi2
	and	r10, r10, #63
	and	r2, r2, #63
	ldrb	lr, [lr, #2861]	@ zero_extendqisi2
	and	r4, r4, #63
	mov	r2, r2, asl #16
	and	lr, lr, #63
	orr	r2, r2, r4, asl #24
	orr	r10, r2, r10
	orr	r2, r10, lr, asl #8
	str	r2, [r5, #4]!
	bne	.L1970
	add	r7, r7, #1
	cmp	r7, #8
	bne	.L1969
	ldr	r7, [r3, #2856]
	movw	lr, #13436
	ldr	r5, [r3, #2852]
	movt	lr, 4
	cmp	r7, #0
	ldr	r6, [r3, #2848]
	ldrb	r8, [r3, #2844]	@ zero_extendqisi2
	add	lr, r0, lr
	movlt	r2, #268435456
	movge	r2, #0
	cmp	r7, #0
	str	r2, [fp, #-48]
	rsblt	r7, r7, #0
	cmp	r5, #0
	mov	r2, #0
	and	r7, r7, #15
	movlt	r4, #1048576
	movge	r4, r2
	cmp	r5, #0
	str	r4, [fp, #-52]
	rsblt	r5, r5, #0
	cmp	r6, r2
	and	r5, r5, #15
	mov	r4, r2
	movlt	r10, #4096
	movge	r10, r2
	cmp	r6, #0
	mov	r5, r5, asl #16
	rsblt	r6, r6, #0
	orr	r5, r5, r7, asl #24
	and	r6, r6, #15
	orr	r5, r5, r8
	orr	r6, r5, r6, asl #8
	ldr	r5, [fp, #-48]
	orr	r6, r6, r5
	ldr	r5, [fp, #-52]
	orr	r6, r6, r5
	orr	r10, r6, r10
	str	r10, [r1, #80]
	ldrb	r6, [ip, #1075]	@ zero_extendqisi2
	ldrb	r5, [ip, #1076]	@ zero_extendqisi2
	and	r6, r6, #1
	ldrb	r7, [ip, #1072]	@ zero_extendqisi2
	ldrb	r8, [ip, #1073]	@ zero_extendqisi2
	and	r10, r5, #1
	mov	r6, r6, asl #2
	and	r7, r7, #1
	orr	r5, r6, r10, asl #3
	and	r6, r8, #1
	orr	r5, r5, r7
	orr	r5, r5, r6, asl #1
	str	r5, [r1, #84]
.L1975:
	ldr	r5, [lr, #4]!
	and	r5, r5, #15
	orr	r4, r4, r5, asl r2
	add	r2, r2, #4
	cmp	r2, #32
	bne	.L1975
	add	lr, r3, #2608
	movw	r5, #2580
	add	lr, lr, #4
	str	r4, [r1, #88]
	movw	r2, #2588
	add	r6, r3, #5184
	ldrh	r4, [lr, r5]
	movw	r5, #2604
	ldrh	r8, [lr, r2]
	movw	r10, #2612
	ubfx	r4, r4, #0, #9
	ldrh	r6, [r6]
	ubfx	r8, r8, #0, #9
	movw	r7, #2596
	mov	r4, r4, asl #9
	ubfx	r6, r6, #0, #9
	orr	r2, r4, r8, asl #18
	movw	r8, #2628
	orr	r2, r2, r6
	str	r2, [r1, #92]
	ldrh	r5, [lr, r5]
	movw	r6, #2620
	ldrh	r10, [lr, r10]
	mov	r2, #0
	ubfx	r5, r5, #0, #9
	ldrh	r7, [lr, r7]
	ubfx	r10, r10, #0, #9
	mov	r4, r2
	mov	r5, r5, asl #9
	ubfx	r7, r7, #0, #9
	orr	r5, r5, r10, asl #18
	orr	r5, r5, r7
	str	r5, [r1, #96]
	ldrh	r5, [lr, r8]
	ldrh	lr, [lr, r6]
	ubfx	r5, r5, #0, #9
	ubfx	lr, lr, #0, #9
	orr	lr, lr, r5, asl #9
	str	lr, [r1, #100]
.L1976:
	movw	lr, #13378
	movt	lr, 4
	add	lr, r2, lr
	ldrb	lr, [r0, lr]	@ zero_extendqisi2
	orr	r4, r4, lr, asl r2
	add	r2, r2, #8
	cmp	r2, #32
	bne	.L1976
	mov	r2, #0
	str	r4, [r1, #104]
	mov	r4, r2
.L1977:
	movw	lr, #13410
	movt	lr, 4
	add	lr, r2, lr
	ldrb	lr, [r0, lr]	@ zero_extendqisi2
	orr	r4, r4, lr, asl r2
	add	r2, r2, #8
	cmp	r2, #32
	bne	.L1977
	movw	r8, #13380
	mov	r7, #0
	movt	r8, 4
	add	r8, r0, r8
	mov	r10, r7
	str	r4, [r1, #108]
.L1978:
	ldrh	r4, [r8, #2]
	mov	r2, r7, asl #1
	ldrh	lr, [r8], #8
	add	r5, r7, #16
	and	r4, r4, #1
	add	r7, r7, #1
	and	lr, lr, #3
	cmp	r7, #8
	mov	lr, lr, asl r2
	orr	r2, lr, r4, asl r5
	orr	r10, r10, r2
	bne	.L1978
	str	r10, [r1, #112]
	ldr	r2, [r3, #2564]
	str	r2, [r1, #116]
	ldr	r2, [r3, #2576]
	str	r2, [r1, #120]
	ldr	r2, [r3, #2640]
	str	r2, [r1, #128]
	ldr	r2, [r3, #2644]
	str	r2, [r1, #132]
	ldr	r2, [r3, #2648]
	str	r2, [r1, #136]
	ldr	r2, [r3, #2652]
	str	r2, [r1, #140]
	ldr	r2, [ip, #1332]
	ldr	lr, [ip, #1328]
	uxth	r2, r2
	orr	r2, r2, lr, asl #16
	str	r2, [r1, #180]
	ldr	r2, [ip, #1348]
	ldr	lr, [ip, #1344]
	uxth	r2, r2
	orr	r2, r2, lr, asl #16
	str	r2, [r1, #184]
	ldr	r2, [ip, #1364]
	ldr	lr, [ip, #1360]
	uxth	r2, r2
	orr	r2, r2, lr, asl #16
	str	r2, [r1, #188]
	ldr	lr, [ip, #1356]
	ldr	r2, [ip, #1372]
	and	lr, lr, #63
	ldr	r4, [ip, #1340]
	and	r2, r2, #63
	mov	lr, lr, asl #8
	and	r4, r4, #63
	orr	r2, lr, r2, asl #16
	orr	r2, r2, r4
	str	r2, [r1, #192]
	ldr	r2, [ip, #1352]
	ldr	r4, [ip, #1368]
	and	r2, r2, #63
	ldr	lr, [ip, #1336]
	and	r4, r4, #63
	mov	ip, r2, asl #8
	and	lr, lr, #63
	orr	r2, ip, r4, asl #16
	orr	r2, r2, lr
	str	r2, [r1, #196]
	ldr	r2, [r3, #2788]
	cmp	r2, #8
	movhi	r2, #0
	strhi	r2, [r1, #200]
	bls	.L2005
.L1980:
	ldr	r2, [r3, #2792]
	cmp	r2, #8
	movhi	r2, #0
	strhi	r2, [r1, #204]
	bhi	.L1982
	add	r2, r0, r2, lsl #4
	add	r2, r2, #274432
	ldr	ip, [r2, #1192]
	str	ip, [r3, #2516]
	uxth	ip, ip
	ldr	r2, [r2, #1196]
	str	r2, [r3, #2528]
	orr	ip, ip, r2, asl #16
	str	ip, [r1, #204]
.L1982:
	ldr	r2, [r3, #2796]
	cmp	r2, #8
	movhi	r2, #0
	strhi	r2, [r1, #208]
	bhi	.L1984
	add	r2, r0, r2, lsl #4
	add	r2, r2, #274432
	ldr	ip, [r2, #1192]
	str	ip, [r3, #2520]
	uxth	ip, ip
	ldr	r2, [r2, #1196]
	str	r2, [r3, #2532]
	orr	ip, ip, r2, asl #16
	str	ip, [r1, #208]
.L1984:
	ldr	r2, [r9, #3384]
	ldr	ip, [r9, #3388]
	uxth	r2, r2
	orr	r2, r2, ip, asl #16
	str	r2, [r1, #212]
	ldr	ip, [r3, #2788]
	cmp	ip, #8
	bls	.L1985
	mov	r2, #0
	str	r2, [r1, #216]
	str	r2, [r1, #220]
	str	r2, [r1, #224]
.L1986:
	ldr	ip, [r3, #2792]
	cmp	ip, #8
	bls	.L1988
	mov	r2, #0
	str	r2, [r1, #228]
	str	r2, [r1, #232]
	str	r2, [r1, #236]
	ldr	r2, [r3, #2796]
	cmp	r2, #8
	bhi	.L2006
.L1991:
	add	r0, r0, r2, lsl #4
	add	r0, r0, #274432
	ldr	r2, [r0, #1192]
	add	r2, r2, #255
	bic	r2, r2, #255
	mov	r2, r2, asl #4
	str	r2, [r1, #240]
	ldr	ip, [r0, #1192]
	ldr	r4, [r0, #1196]
	ldr	lr, [r3, #2468]
	add	r3, ip, #255
	add	r2, r4, #63
	bic	r3, r3, #255
	cmp	lr, #1
	bic	lr, r2, #63
	mul	r3, lr, r3
	beq	.L2007
.L1993:
	str	r3, [r1, #244]
	ldr	r2, [r0, #1192]
	ldr	ip, [r0, #1196]
	add	r3, r2, #2032
	add	r0, r2, #4080
	add	r3, r3, #15
	adds	r2, ip, #63
	addmi	r2, ip, #126
	add	r0, r0, #14
	cmp	r3, #0
	mov	r2, r2, asr #6
	movlt	r3, r0
	mov	r3, r3, asr #11
	mov	r2, r2, asl #5
	mov	r3, r3, asl #4
	mul	r3, r3, r2
	str	r3, [r1, #248]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2005:
	add	r2, r0, r2, lsl #4
	add	r2, r2, #274432
	ldr	ip, [r2, #1192]
	str	ip, [r3, #2512]
	uxth	ip, ip
	ldr	r2, [r2, #1196]
	str	r2, [r3, #2524]
	orr	ip, ip, r2, asl #16
	str	ip, [r1, #200]
	b	.L1980
.L1988:
	add	ip, r0, ip, lsl #4
	add	ip, ip, #274432
	ldr	r2, [ip, #1192]
	add	r2, r2, #255
	bic	r2, r2, #255
	mov	r2, r2, asl #4
	str	r2, [r1, #228]
	ldr	r4, [ip, #1192]
	ldr	r6, [ip, #1196]
	ldr	r7, [r3, #2468]
	add	r2, r4, #255
	add	lr, r6, #63
	bic	r2, r2, #255
	bic	r5, lr, #63
	cmp	r7, #1
	mul	r2, r5, r2
	beq	.L2008
.L1990:
	str	r2, [r1, #232]
	ldr	lr, [ip, #1192]
	ldr	r4, [ip, #1196]
	add	r2, lr, #2032
	add	lr, lr, #4080
	add	r2, r2, #15
	adds	ip, r4, #63
	addmi	ip, r4, #126
	add	lr, lr, #14
	cmp	r2, #0
	mov	ip, ip, asr #6
	movlt	r2, lr
	mov	r2, r2, asr #11
	mov	ip, ip, asl #5
	mov	r2, r2, asl #4
	mul	r2, r2, ip
	str	r2, [r1, #236]
	ldr	r2, [r3, #2796]
	cmp	r2, #8
	bls	.L1991
.L2006:
	mov	r3, #0
	str	r3, [r1, #240]
	str	r3, [r1, #244]
	str	r3, [r1, #248]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1985:
	add	ip, r0, ip, lsl #4
	add	ip, ip, #274432
	ldr	r2, [ip, #1192]
	add	r2, r2, #255
	bic	r2, r2, #255
	mov	r2, r2, asl #4
	str	r2, [r1, #216]
	ldr	r4, [ip, #1192]
	ldr	r6, [ip, #1196]
	ldr	r7, [r3, #2468]
	add	r2, r4, #255
	add	lr, r6, #63
	bic	r2, r2, #255
	bic	r5, lr, #63
	cmp	r7, #1
	mul	r2, r5, r2
	beq	.L2009
.L1987:
	str	r2, [r1, #220]
	ldr	lr, [ip, #1192]
	ldr	r4, [ip, #1196]
	add	r2, lr, #2032
	add	lr, lr, #4080
	add	r2, r2, #15
	adds	ip, r4, #63
	addmi	ip, r4, #126
	add	lr, lr, #14
	cmp	r2, #0
	mov	ip, ip, asr #6
	movlt	r2, lr
	mov	r2, r2, asr #11
	mov	ip, ip, asl #5
	mov	r2, r2, asl #4
	mul	r2, r2, ip
	str	r2, [r1, #224]
	b	.L1986
.L2004:
	ldr	r6, [ip, #1004]
	ldr	r2, [r9, #3388]
	cmp	r6, r2
	movne	r6, #1048576
	moveq	r6, #0
	b	.L1968
.L2007:
	add	lr, ip, #2032
	cmp	r2, #0
	add	lr, lr, #15
	addlt	r2, r4, #126
	add	ip, ip, #4080
	cmp	lr, #0
	add	ip, ip, #14
	mov	r2, r2, asr #6
	movge	ip, lr
	mov	ip, ip, asr #11
	mov	r2, r2, asl #5
	mov	ip, ip, asl #4
	mla	r3, ip, r2, r3
	b	.L1993
.L2008:
	add	r5, r4, #2032
	cmp	lr, #0
	add	r5, r5, #15
	addlt	lr, r6, #126
	add	r4, r4, #4080
	cmp	r5, #0
	add	r4, r4, #14
	mov	lr, lr, asr #6
	movge	r4, r5
	mov	r4, r4, asr #11
	mov	lr, lr, asl #5
	mov	r4, r4, asl #4
	mla	r2, r4, lr, r2
	b	.L1990
.L2009:
	add	r5, r4, #2032
	cmp	lr, #0
	add	r5, r5, #15
	addlt	lr, r6, #126
	add	r4, r4, #4080
	cmp	r5, #0
	add	r4, r4, #14
	mov	lr, lr, asr #6
	movge	r4, r5
	mov	r4, r4, asr #11
	mov	lr, lr, asl #5
	mov	r4, r4, asl #4
	mla	r2, r4, lr, r2
	b	.L1987
	UNWIND(.fnend)
	.size	Vp9_SetPoolInfoFrame, .-Vp9_SetPoolInfoFrame
	.align	2
	.global	Vp9_SetPoolInfoTile
	.type	Vp9_SetPoolInfoTile, %function
Vp9_SetPoolInfoTile:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, [r3]
	str	r2, [r1]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	and	r2, r2, #127
	str	r2, [r1, #4]
	ldr	r2, [r3, #8]
	add	r2, r2, #128
	str	r2, [r1, #8]
	ldr	r2, [r3, #12]
	str	r2, [r1, #12]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	and	r2, r2, #127
	str	r2, [r1, #16]
	ldr	r2, [r3, #20]
	str	r2, [r1, #20]
	ldrh	r2, [r3, #26]
	ldrh	ip, [r3, #24]
	cmp	ip, r2
	add	r0, ip, #7
	addne	r2, r2, #7
	ubfx	r0, r0, #3, #7
	movne	r2, r2, asr #3
	mov	r0, r0, asl #16
	subne	r2, r2, #1
	orreq	r2, r0, #255
	andne	r2, r2, #127
	orrne	r2, r2, r0
	str	r2, [r1, #24]
	ldrh	r0, [r3, #30]
	ldrh	ip, [r3, #28]
	cmp	ip, r0
	add	r2, ip, #7
	addne	r0, r0, #7
	ubfx	r2, r2, #3, #7
	movne	r0, r0, asr #3
	mov	r2, r2, asl #16
	subne	r0, r0, #1
	orreq	r2, r2, #255
	andne	r0, r0, #127
	orrne	r2, r0, r2
	str	r2, [r1, #28]
	ldr	r2, [r3, #32]
	mov	r0, #0
	ubfx	r2, r2, #0, #17
	str	r2, [r1, #32]
	ldr	r2, [r3, #36]
	ubfx	r2, r2, #0, #17
	str	r2, [r1, #36]
	ldr	r2, [r3, #40]
	ubfx	r2, r2, #0, #17
	str	r2, [r1, #40]
	ldr	r3, [r3, #44]
	str	r0, [r1, #252]
	ubfx	r3, r3, #0, #17
	str	r3, [r1, #44]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_SetPoolInfoTile, .-Vp9_SetPoolInfoTile
	.align	2
	.global	Vp9_DecodeTilesCtrl
	.type	Vp9_DecodeTilesCtrl, %function
Vp9_DecodeTilesCtrl:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 168
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #180)
	sub	sp, sp, #180
	add	r3, r0, #274432
	add	ip, r0, #294912
	mov	r10, r1
	mov	r2, r3
	str	ip, [fp, #-168]
	ldr	r1, [r2, #1052]
	mov	r5, ip
	mov	ip, r2
	ldr	r2, [r2, #1048]
	str	r3, [fp, #-164]
	mov	r3, #1
	mov	lr, r1
	add	r4, r0, #270336
	mov	r6, r2
	str	r2, [fp, #-148]
	mov	r2, r3, asl lr
	mov	r3, r3, asl r6
	str	r3, [fp, #-120]
	ldr	r3, [ip, #1044]
	mov	r9, r2
	ldr	r8, [r10]
	str	r2, [fp, #-196]
	ldr	r2, [r10, #16]
	str	r1, [fp, #-200]
	add	r1, r0, #8
	str	r3, [fp, #-192]
	add	r3, r8, r2
	str	r0, [fp, #-180]
	str	r3, [fp, #-116]
	ldr	r7, [ip, #1040]
	bl	Vp9_SetPoolInfoFrame
	mov	r1, #0
	str	r1, [r5, #3500]
	ldr	r2, [r4, #2536]
	cmp	r9, #0
	ldr	r3, [r4, #2540]
	str	r2, [fp, #-160]
	and	r3, r3, #15
	str	r3, [fp, #-156]
	ble	.L2026
	ldr	r2, [fp, #-192]
	add	r3, r7, #7
	str	r1, [fp, #-184]
	add	r2, r2, #7
	mov	r0, r3, asr #3
	str	r1, [fp, #-172]
	mov	r3, r2, asr #3
	str	r0, [fp, #-152]
	str	r0, [fp, #-208]
	str	r3, [fp, #-204]
	str	r1, [fp, #-112]
	str	r1, [fp, #-188]
.L2025:
	ldr	r3, [fp, #-184]
	ldr	r2, [fp, #-204]
	ldr	r0, [fp, #-200]
	add	r3, r3, r2
	str	r3, [fp, #-184]
	ldr	r2, [fp, #-192]
	mov	r1, r3
	ldr	r3, [fp, #-188]
	mov	r1, r1, asr r0
	str	r1, [fp, #-188]
	ldr	ip, [fp, #-120]
	mov	r3, r3, asl #3
	mov	r0, r1
	cmp	r3, r2
	movge	r3, r2
	str	r3, [fp, #-132]
	mov	r1, r3
	mov	r3, r0, asl #3
	cmp	r3, r2
	movge	r3, r2
	str	r3, [fp, #-136]
	mov	r0, r3
	rsb	r3, r1, r0
	add	r3, r3, #7
	cmp	ip, #0
	mov	r2, r1
	mov	r3, r3, asr #3
	str	r3, [fp, #-128]
	ble	.L2018
	add	r3, r0, #7
	ldr	r0, [fp, #-208]
	add	r1, r2, #7
	mov	r9, #0
	mov	r3, r3, asr #3
	ldr	r2, [r10, #16]
	sub	r3, r3, #1
	mov	r1, r1, asr #3
	mov	r6, r9
	str	r9, [fp, #-104]
	mul	r3, r0, r3
	mul	r1, r0, r1
	str	r3, [fp, #-140]
	sub	r3, ip, #1
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-196]
	str	r1, [fp, #-144]
	sub	r3, r3, #1
	str	r3, [fp, #-176]
	mov	r3, r10
	mov	r10, r9
	mov	r9, r3
	b	.L2024
.L2037:
	ldr	r2, [fp, #-176]
	ldr	r1, [fp, #-172]
	cmp	r2, r1
	ldrle	r2, [fp, #-116]
	rsble	r5, r8, r2
	bgt	.L2019
.L2021:
	ldrh	r1, [fp, #-132]
	rsb	r2, r3, r4
	add	r2, r2, #7
	strh	r4, [fp, #-66]	@ movhi
	add	r4, r4, #7
	mov	ip, #0
	strh	r1, [fp, #-72]	@ movhi
	mov	r0, r2, asr #3
	ldrh	r1, [fp, #-136]
	mov	r2, #0
	str	r2, [fp, #-84]
	ldr	r2, [fp, #-128]
	strh	r1, [fp, #-70]	@ movhi
	ldr	r1, [fp, #-160]
	mul	r2, r2, r0
	rsb	r0, r1, r8
	ldr	r1, [fp, #-156]
	strb	ip, [fp, #-80]
	sub	ip, fp, #44
	add	r0, r0, r1
	ldr	r1, [fp, #-140]
	str	ip, [fp, #-48]
	and	lr, r0, #15
	ldr	ip, [fp, #-112]
	add	r1, r1, r4, asr #3
	strh	r3, [fp, #-68]	@ movhi
	cmp	r2, #0
	add	r4, ip, r2
	add	r3, r3, #7
	mov	r2, #0
	str	r2, [fp, #-76]
	sub	r2, r1, #1
	ldr	r1, [fp, #-144]
	str	r2, [fp, #-64]
	bic	r0, r0, #15
	add	r3, r1, r3, asr #3
	sub	r2, r4, #1
	str	r3, [fp, #-56]
	mov	r3, lr, asl #3
	str	ip, [fp, #-52]
	strb	r3, [fp, #-92]
	mov	r3, r5, asl #3
	str	r2, [fp, #-60]
	str	r0, [fp, #-96]
	str	r3, [fp, #-88]
	bne	.L2034
	ldr	r3, [fp, #-164]
	ldr	r3, [r3, #1744]
	cmp	r5, r3
	bgt	.L2035
.L2023:
	ldr	r3, [fp, #-120]
	add	r6, r6, #1
	ldr	r2, [r9, #16]
	add	r8, r8, r5
	cmp	r6, r3
	rsb	r2, r5, r2
	str	r2, [r9, #16]
	beq	.L2036
	str	r4, [fp, #-112]
.L2024:
	ldr	r3, [fp, #-152]
	mov	r0, r9
	ldr	r1, [fp, #-148]
	add	r10, r10, r3
	ldr	r3, [fp, #-104]
	mov	r1, r10, asr r1
	str	r1, [fp, #-104]
	mov	r3, r3, asl #3
	cmp	r3, r7
	mov	ip, r1
	mov	r4, ip, asl #3
	mov	r1, r8
	movge	r3, r7
	cmp	r4, r7
	str	r3, [fp, #-108]
	movge	r4, r7
	bl	BsInit
	ldr	r3, [fp, #-124]
	cmp	r6, r3
	ldr	r3, [fp, #-108]
	bge	.L2037
.L2019:
	ldr	r2, [fp, #-116]
	cmp	r2, #0
	cmpne	r8, #0
	beq	.L2028
	add	r8, r8, #4
	str	r3, [fp, #-108]
	cmp	r2, r8
	bcc	.L2028
	mov	r1, #32
	mov	r0, r9
	bl	BsGet
	ldr	r3, [fp, #-108]
	mov	r5, r0
	b	.L2021
.L2034:
	ldr	r3, [fp, #-168]
	sub	r1, fp, #96
	ldr	r2, [r3, #3500]
	mov	r3, r1
	ldr	r1, [fp, #-180]
	mov	r0, r1
	add	r1, r1, r2, lsl #8
	add	r1, r1, #1024
	add	r1, r1, #8
	bl	Vp9_SetPoolInfoTile
	ldr	r2, [fp, #-168]
	ldr	r3, [r2, #3500]
	add	r3, r3, #1
	str	r3, [r2, #3500]
	ldr	r3, [fp, #-164]
	ldr	r3, [r3, #1744]
	cmp	r5, r3
	ble	.L2023
.L2035:
	str	r3, [sp, #4]
	mov	r0, #0
	movw	r3, #4605
	str	r5, [sp]
	ldr	r2, .L2038
	ldr	r1, .L2038+4
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2028:
	mvn	r0, #0
.L2017:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2036:
	mov	r10, r9
	str	r4, [fp, #-112]
.L2018:
	ldr	r3, [fp, #-172]
	ldr	r2, [fp, #-196]
	add	r3, r3, #1
	str	r3, [fp, #-172]
	cmp	r3, r2
	bne	.L2025
.L2026:
	mov	r0, #0
	b	.L2017
.L2039:
	.align	2
.L2038:
	.word	.LANCHOR0+872
	.word	.LC32
	UNWIND(.fnend)
	.size	Vp9_DecodeTilesCtrl, .-Vp9_DecodeTilesCtrl
	.align	2
	.global	Vp9_TxCoefProbConvert2
	.type	Vp9_TxCoefProbConvert2, %function
Vp9_TxCoefProbConvert2:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, .L2041
	mov	r2, #18
	mov	r5, r0
	mov	r6, r1
	add	r7, r1, #108
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #18
	add	r0, r5, #32
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #36
	add	r0, r5, #64
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #54
	add	r0, r5, #96
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #72
	add	r0, r5, #128
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #90
	add	r0, r5, #160
	mov	r2, #18
	blx	r3
	mov	r1, r7
	ldr	r3, [r4, #52]
	add	r0, r5, #192
	mov	r2, #18
	blx	r3
	mov	r1, r7
	ldr	r3, [r4, #52]
	add	r0, r5, #256
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #126
	add	r0, r5, #288
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #144
	add	r0, r5, #320
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #162
	add	r0, r5, #352
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #180
	add	r0, r5, #384
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #198
	add	r0, r5, #416
	mov	r2, #18
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r6, #216
	add	r0, r5, #448
	mov	r2, #18
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L2042:
	.align	2
.L2041:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Vp9_TxCoefProbConvert2, .-Vp9_TxCoefProbConvert2
	.align	2
	.global	Vp9_ProbBurstConvert
	.type	Vp9_ProbBurstConvert, %function
Vp9_ProbBurstConvert:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r1
	mov	r9, r3
	mov	r6, r0
	mov	r8, r2
	ldr	r7, [fp, #4]
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #216
	add	r0, r6, #512
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #432
	add	r0, r6, #1024
	add	r4, r5, #1728
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #648
	add	r0, r6, #1536
	add	r10, r5, #1760
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #864
	add	r0, r6, #2048
	add	r4, r4, #8
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #1072
	add	r1, r1, #8
	add	r0, r6, #2560
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #1296
	add	r0, r6, #3072
	add	r10, r10, #12
	bl	Vp9_TxCoefProbConvert2
	add	r1, r5, #1504
	add	r0, r6, #3584
	add	r1, r1, #8
	bl	Vp9_TxCoefProbConvert2
	add	r0, r6, #4096
	mov	r3, #0
.L2044:
	mov	r1, r4
	mov	r2, #8
	ldrb	ip, [r1, #-8]!	@ zero_extendqisi2
	b	.L2048
.L2046:
	ldrb	lr, [r1, #1]!	@ zero_extendqisi2
	orr	ip, ip, lr, asl r2
	add	r2, r2, #8
	cmp	r2, #32
	streq	ip, [r0, r3, asl #2]
	addeq	r3, r3, #1
	moveq	ip, #0
	moveq	r2, ip
.L2048:
	cmp	r4, r1
	bne	.L2046
	add	r4, r4, #9
	str	ip, [r0, r3, asl #2]
	cmp	r4, r10
	add	r3, r3, #2
	bne	.L2044
	add	r2, r5, #1856
	add	r2, r2, #6
.L2047:
	mov	lr, r10
	mov	ip, #8
	ldrb	r4, [lr, #-8]!	@ zero_extendqisi2
	b	.L2052
.L2050:
	ldrb	r1, [lr, #1]!	@ zero_extendqisi2
	orr	r4, r4, r1, asl ip
	add	ip, ip, #8
	cmp	ip, #32
	streq	r4, [r0, r3, asl #2]
	addeq	r3, r3, #1
	moveq	r4, #0
	moveq	ip, r4
.L2052:
	cmp	r10, lr
	bne	.L2050
	add	r10, r10, #9
	str	r4, [r0, r3, asl #2]
	cmp	r10, r2
	add	r3, r3, #2
	bne	.L2047
	ldrb	r1, [r8, #7]	@ zero_extendqisi2
	cmp	r7, #0
	ldrb	r3, [r8, #8]	@ zero_extendqisi2
	mov	ip, #0
	ldrb	r2, [r8, #5]	@ zero_extendqisi2
	movne	r9, ip
	ldrb	lr, [r8, #6]	@ zero_extendqisi2
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	mov	r7, r9, asl #6
	orr	r3, r3, r2
	sub	r7, r7, r9, asl #4
	orr	r3, r3, lr, asl #8
	str	r3, [r0, #256]
	ldrb	r3, [r8, #10]	@ zero_extendqisi2
	add	lr, r7, #1840
	ldrb	r1, [r8, #11]	@ zero_extendqisi2
	add	r7, r7, #1888
	ldrb	r2, [r8, #9]	@ zero_extendqisi2
	add	lr, lr, #13
	mov	r3, r3, asl #8
	add	r7, r7, #13
	orr	r3, r3, r1, asl #16
	add	r6, r6, #4352
	orr	r3, r3, r2
	str	r3, [r0, #260]
	ldrb	r3, [r8, #13]	@ zero_extendqisi2
	add	lr, r5, lr
	ldrb	r1, [r8, #14]	@ zero_extendqisi2
	add	r7, r5, r7
	ldrb	r8, [r8, #12]	@ zero_extendqisi2
	mov	r2, ip
	mov	r3, r3, asl #8
	mov	r4, #3
	orr	r3, r3, r1, asl #16
	orr	r3, r3, r8
	str	r3, [r0, #264]
.L2054:
	mov	r1, lr
	mov	r3, #0
.L2056:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	orr	r2, r2, r0, asl ip
	add	ip, ip, #8
	cmp	ip, #32
	streq	r2, [r6, r4, asl #2]
	addeq	r4, r4, #1
	moveq	r2, #0
	moveq	ip, r2
	cmp	r3, #3
	bne	.L2056
	add	lr, lr, #3
	cmp	lr, r7
	bne	.L2054
	ldrb	r2, [r5, #2016]	@ zero_extendqisi2
	add	r1, r6, r4, lsl #2
	ldrb	r0, [r5, #2017]	@ zero_extendqisi2
	add	lr, r4, #11
	ldrb	ip, [r5, #2015]	@ zero_extendqisi2
	mov	r7, #0
	mov	r2, r2, asl #8
	mov	r3, r7
	orr	r2, r2, r0, asl #16
	mov	r0, r7
	orr	r2, r2, ip
	str	r2, [r6, r4, asl #2]
	ldrb	r8, [r5, #2009]	@ zero_extendqisi2
	mov	r2, #1
	ldrb	ip, [r5, #2010]	@ zero_extendqisi2
	ldrb	r4, [r5, #2013]	@ zero_extendqisi2
	ldrb	r9, [r5, #2014]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #4]
	ldrb	r8, [r5, #2003]	@ zero_extendqisi2
	ldrb	ip, [r5, #2004]	@ zero_extendqisi2
	ldrb	r4, [r5, #2011]	@ zero_extendqisi2
	ldrb	r9, [r5, #2012]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #8]
	ldrb	r8, [r5, #2007]	@ zero_extendqisi2
	ldrb	ip, [r5, #2008]	@ zero_extendqisi2
	ldrb	r4, [r5, #2005]	@ zero_extendqisi2
	ldrb	r9, [r5, #2006]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #12]
	ldrb	r8, [r5, #1981]	@ zero_extendqisi2
	ldrb	ip, [r5, #1982]	@ zero_extendqisi2
	ldrb	r4, [r5, #1979]	@ zero_extendqisi2
	ldrb	r9, [r5, #1980]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #16]
	ldrb	r8, [r5, #1985]	@ zero_extendqisi2
	ldrb	ip, [r5, #1986]	@ zero_extendqisi2
	ldrb	r4, [r5, #1983]	@ zero_extendqisi2
	ldrb	r9, [r5, #1984]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #20]
	ldrb	r8, [r5, #1999]	@ zero_extendqisi2
	ldrb	ip, [r5, #2000]	@ zero_extendqisi2
	ldrb	r4, [r5, #1987]	@ zero_extendqisi2
	ldrb	r9, [r5, #1998]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #24]
	ldrb	r4, [r5, #2002]	@ zero_extendqisi2
	ldrb	ip, [r5, #2001]	@ zero_extendqisi2
	orr	ip, ip, r4, asl #8
	str	ip, [r1, #28]
	ldrb	r8, [r5, #1990]	@ zero_extendqisi2
	ldrb	ip, [r5, #1991]	@ zero_extendqisi2
	ldrb	r4, [r5, #1988]	@ zero_extendqisi2
	ldrb	r9, [r5, #1989]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #32]
	ldrb	r8, [r5, #1994]	@ zero_extendqisi2
	ldrb	ip, [r5, #1995]	@ zero_extendqisi2
	ldrb	r4, [r5, #1992]	@ zero_extendqisi2
	ldrb	r9, [r5, #1993]	@ zero_extendqisi2
	mov	r8, r8, asl #16
	orr	ip, r8, ip, asl #24
	orr	ip, ip, r4
	orr	ip, ip, r9, asl #8
	str	ip, [r1, #36]
	ldrb	ip, [r5, #1997]	@ zero_extendqisi2
	ldrb	r8, [r5, #1958]	@ zero_extendqisi2
	ldrb	r4, [r5, #1996]	@ zero_extendqisi2
	mov	ip, ip, asl #8
	orr	ip, ip, r8, asl #16
	orr	ip, ip, r4
	str	ip, [r1, #40]
.L2058:
	add	ip, r2, r7
	add	ip, ip, #1952
	add	ip, ip, #5
	add	ip, r5, ip
.L2060:
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	orr	r0, r0, r1, asl r3
	add	r3, r3, #8
	cmp	r3, #32
	streq	r0, [r6, lr, asl #2]
	addeq	lr, lr, #1
	moveq	r0, #0
	moveq	r3, r0
	cmp	r2, #2
	ble	.L2060
	add	r7, r7, #3
	mov	r2, #0
	cmp	r7, #21
	bne	.L2058
	add	r4, r5, #8
	mov	r3, r5
	mov	r1, r2
.L2061:
	add	r0, r2, #8
	ldrb	ip, [r3, #1950]	@ zero_extendqisi2
	cmp	r0, #32
	orr	r1, r1, ip, asl r2
	add	r2, r2, #16
	beq	.L2091
	ldrb	ip, [r3, #1951]	@ zero_extendqisi2
	cmp	r2, #32
	orr	r1, r1, ip, asl r0
	streq	r1, [r6, lr, asl #2]
	moveq	r1, #0
	addeq	lr, lr, #1
	moveq	r2, r1
.L2064:
	add	r3, r3, #2
	cmp	r3, r4
	bne	.L2061
	ldrb	r1, [r5, #2054]	@ zero_extendqisi2
	add	ip, r5, #2016
	ldrb	r2, [r5, #2021]	@ zero_extendqisi2
	add	r4, r5, #2096
	add	r0, r6, lr, lsl #2
	mov	r3, #0
	orr	r2, r2, r1, asl #8
	str	r2, [r6, lr, asl #2]
	ldrb	r2, [r5, #2019]	@ zero_extendqisi2
	add	lr, lr, #2
	ldrb	r8, [r5, #2020]	@ zero_extendqisi2
	add	ip, ip, #15
	ldrb	r7, [r5, #2018]	@ zero_extendqisi2
	add	r4, r4, #1
	mov	r2, r2, asl #8
	mov	r1, r3
	orr	r2, r2, r8, asl #16
	orr	r2, r2, r7
	str	r2, [r0, #4]
.L2066:
	sub	r2, ip, #10
.L2068:
	ldrb	r0, [r2, #1]!	@ zero_extendqisi2
	orr	r1, r1, r0, asl r3
	add	r3, r3, #8
	cmp	r3, #32
	streq	r1, [r6, lr, asl #2]
	addeq	lr, lr, #1
	moveq	r1, #0
	moveq	r3, r1
	cmp	ip, r2
	bne	.L2068
	add	ip, ip, #33
	cmp	ip, r4
	bne	.L2066
	ldrb	r1, [r5, #2065]	@ zero_extendqisi2
	add	r4, r5, #2032
	ldrb	r2, [r5, #2032]	@ zero_extendqisi2
	add	r4, r4, #10
	add	r7, r5, #2096
	mov	r3, #0
	add	r7, r7, #12
	orr	r2, r2, r1, asl #8
	add	ip, lr, #1
	str	r2, [r6, lr, asl #2]
	mov	r1, r3
	mov	lr, r4
.L2070:
	sub	r2, lr, #10
.L2072:
	ldrb	r0, [r2, #1]!	@ zero_extendqisi2
	orr	r1, r1, r0, asl r3
	add	r3, r3, #8
	cmp	r3, #32
	streq	r1, [r6, ip, asl #2]
	addeq	ip, ip, #1
	moveq	r1, #0
	moveq	r3, r1
	cmp	r2, lr
	bne	.L2072
	add	lr, r2, #33
	cmp	lr, r7
	bne	.L2070
	mov	r3, #0
	mov	r1, r3
.L2073:
	mov	r8, r4
	mov	r9, #2
.L2078:
	mov	r0, r8
	mov	r2, #0
.L2075:
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	orr	r1, r1, lr, asl r3
	add	r3, r3, #8
	cmp	r3, #32
	streq	r1, [r6, ip, asl #2]
	addeq	ip, ip, #1
	moveq	r1, #0
	moveq	r3, r1
	cmp	r2, #3
	bne	.L2075
	subs	r9, r9, #1
	add	r8, r8, #3
	bne	.L2078
	add	r4, r4, #33
	cmp	r4, r7
	bne	.L2073
	ldrb	r3, [r5, #2050]	@ zero_extendqisi2
	add	r0, r6, ip, lsl #2
	ldrb	r1, [r5, #2051]	@ zero_extendqisi2
	ldrb	r2, [r5, #2049]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	orr	r3, r3, r1, asl #16
	orr	r3, r3, r2
	str	r3, [r6, ip, asl #2]
	ldrb	r3, [r5, #2083]	@ zero_extendqisi2
	ldrb	r1, [r5, #2084]	@ zero_extendqisi2
	ldrb	r2, [r5, #2082]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	orr	r3, r3, r1, asl #16
	orr	r3, r3, r2
	str	r3, [r0, #4]
	ldrb	r1, [r5, #2053]	@ zero_extendqisi2
	ldrb	r3, [r5, #2086]	@ zero_extendqisi2
	ldrb	r2, [r5, #2052]	@ zero_extendqisi2
	ldrb	ip, [r5, #2085]	@ zero_extendqisi2
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r0, #8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2091:
	str	r1, [r6, lr, asl #2]
	mov	r2, #8
	add	lr, lr, #1
	ldrb	r1, [r3, #1951]	@ zero_extendqisi2
	b	.L2064
	UNWIND(.fnend)
	.size	Vp9_ProbBurstConvert, .-Vp9_ProbBurstConvert
	.align	2
	.global	Vp9_DecodeTiles
	.type	Vp9_DecodeTiles, %function
Vp9_DecodeTiles:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	add	r5, r0, #274432
	add	r9, r0, #270336
	add	r4, r0, #294912
	ldr	r3, [r5, #1060]
	mov	lr, #0
	ldr	r7, [r5, #956]
	mov	r6, r0
	ldr	r10, [r5, #1036]
	sub	r0, fp, #84
	str	r3, [fp, #-112]
	clz	r8, r7
	ldr	r3, [r9, #2664]
	mov	r8, r8, lsr #5
	str	r10, [fp, #-96]
	str	lr, [fp, #-92]
	str	r3, [fp, #-104]
	ldr	r3, [r9, #2656]
	str	r8, [r4, #3456]
	str	r7, [r4, #3468]
	ldr	r8, [r5, #988]
	str	lr, [fp, #-88]
	str	r3, [fp, #-108]
	str	r8, [r4, #3476]
	mov	r8, r2
	ldr	r10, [r5, #1056]
	str	r1, [fp, #-116]
	str	r10, [r4, #3460]
	add	r10, r5, #1760
	ldr	lr, [r5, #1032]
	str	lr, [r4, #3480]
	ldr	lr, [r9, #2660]
	str	lr, [r4, #3484]
	ldr	lr, [r5, #1068]
	str	lr, [r4, #3488]
	ldr	lr, [r5, #952]
	str	lr, [r4, #3472]
	bl	BsInit
	ldr	r2, [r4, #3456]
	ldr	r3, [fp, #-112]
	cmp	r2, #0
	ldr	r2, [r4, #3476]
	bne	.L2094
	cmp	r2, #0
	beq	.L2103
.L2094:
	movw	r1, #16135
	stmia	sp, {r2, r7}
	mov	r0, r10
	sub	r2, fp, #96
	movt	r1, 4
	add	r1, r6, r1
	bl	Vp9_SetupPastIndependence
	ldr	r3, .L2106
	movw	r0, #10860
	mov	r2, #16
	movt	r0, 4
	mov	r1, #0
	add	r0, r6, r0
	ldr	r3, [r3, #48]
	blx	r3
.L2095:
	ldr	r3, [fp, #-96]
	movw	r0, #2087
	movw	r1, #16135
	mov	r2, r0
	movt	r1, 4
	mla	r3, r0, r3, r6
	add	r0, r5, #1760
	add	r1, r3, r1
	bl	memcpy
	sub	r0, fp, #84
	bl	Vp9_Cabac_ReaderInit
	ldr	ip, [fp, #-108]
	ldr	r1, [r4, #3484]
	mov	r2, r7
	ldr	r0, [r4, #3488]
	sub	lr, fp, #88
	ldr	r3, [r4, #3460]
	sub	r7, fp, #92
	str	ip, [sp, #12]
	ldr	ip, [fp, #-104]
	str	r1, [sp, #4]
	mov	r1, r10
	str	r0, [sp]
	sub	r0, fp, #84
	str	ip, [sp, #8]
	str	lr, [sp, #20]
	str	r7, [sp, #16]
	bl	Vp9_ReadCompressedHeader
	cmp	r0, #0
	bne	.L2104
	ldr	r3, [fp, #-88]
	add	r7, r6, #274432
	ldr	r2, [fp, #-92]
	str	r3, [r9, #2836]
	str	r3, [r4, #3464]
	ldr	r3, [r9, #2948]
	str	r2, [r9, #2840]
	cmp	r3, #0
	addeq	r7, r7, #1072
	bne	.L2105
.L2099:
	ldr	lr, [r4, #3460]
	movw	r0, #1037
	ldr	r3, [r5, #956]
	mov	r2, r7
	mov	r1, r10
	movt	r0, 4
	str	lr, [sp]
	add	r0, r6, r0
	bl	Vp9_ProbBurstConvert
	ldr	r3, [r9, #2612]
	ldr	r2, [fp, #-116]
	sub	r1, fp, #84
	mov	r0, r6
	rsb	r8, r3, r8
	add	r9, r2, r3
	str	r8, [fp, #-68]
	str	r9, [fp, #-84]
	bl	Vp9_DecodeTilesCtrl
	mov	r0, #0
.L2097:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2103:
	ldr	r1, [r4, #3460]
	cmp	r1, #0
	beq	.L2095
	b	.L2094
.L2105:
	add	r7, r7, #1072
	movw	r0, #10804
	movt	r0, 4
	add	r0, r6, r0
	add	r1, r0, #328
	mov	r2, r7
	add	r0, r0, #248
	bl	Vp9_Vfmw_LoopFilterFrameInit
	b	.L2099
.L2104:
	ldr	r1, .L2106+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2097
.L2107:
	.align	2
.L2106:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	UNWIND(.fnend)
	.size	Vp9_DecodeTiles, .-Vp9_DecodeTiles
	.align	2
	.global	Vp9_CoefCountRestore
	.type	Vp9_CoefCountRestore, %function
Vp9_CoefCountRestore:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r7, r1, #1152
	add	r7, r7, #4
	add	r3, r1, #3456
	add	r3, r3, #4
	str	r0, [fp, #-52]
	str	r2, [fp, #-48]
	str	r3, [fp, #-56]
.L2109:
	ldr	r9, [fp, #-48]
	sub	r8, r7, #1152
	ldr	r4, [fp, #-52]
.L2115:
	add	r6, r4, #576
	mov	r5, r8
	mov	ip, r9
.L2113:
	add	lr, ip, #24
	mov	r0, r5
	mov	r1, r4
.L2110:
	ldr	r3, [r1]
	add	r0, r0, #16
	add	r1, r1, #16
	bic	r2, r3, #-67108864
	str	r2, [ip], #4
	ldr	r2, [r1, #-12]
	mov	r3, r3, lsr #26
	cmp	lr, ip
	ubfx	r10, r2, #0, #20
	mov	r2, r2, lsr #20
	orr	r3, r3, r10, asl #6
	str	r3, [r0, #-20]
	ldr	r3, [r1, #-8]
	ubfx	r10, r3, #0, #14
	mov	r3, r3, lsr #14
	orr	r2, r2, r10, asl #12
	str	r2, [r0, #-16]
	ldr	r2, [r1, #-4]
	uxtb	r10, r2
	mov	r2, r2, lsr #8
	str	r2, [r0, #-8]
	orr	r3, r3, r10, asl #18
	str	r3, [r0, #-12]
	bne	.L2110
	add	r4, r4, #96
	add	r5, r5, #96
	cmp	r6, r4
	mov	ip, lr
	bne	.L2113
	add	r8, r8, #576
	add	r9, r9, #144
	cmp	r7, r8
	mov	r4, r6
	bne	.L2115
	ldr	r3, [fp, #-52]
	add	r7, r7, #1152
	add	r3, r3, #1152
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	cmp	r7, r3
	ldr	r3, [fp, #-48]
	add	r3, r3, #288
	str	r3, [fp, #-48]
	bne	.L2109
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_CoefCountRestore, .-Vp9_CoefCountRestore
	.align	2
	.global	Vp9_RestoreCounts
	.type	Vp9_RestoreCounts, %function
Vp9_RestoreCounts:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r5, r2
	mov	r4, r1
	add	r2, r2, #9216
	mov	r6, r0
	add	r2, r2, #12
	mov	r1, r5
	mov	r0, r4
	bl	Vp9_CoefCountRestore
	add	r2, r5, #9792
	add	r2, r2, #12
	add	r1, r5, #2304
	add	r0, r4, #2304
	bl	Vp9_CoefCountRestore
	add	r2, r5, #10368
	add	r2, r2, #12
	add	r1, r5, #4608
	add	r0, r4, #4608
	bl	Vp9_CoefCountRestore
	add	r2, r5, #10944
	add	r0, r4, #6912
	add	r2, r2, #12
	add	r1, r5, #6912
	bl	Vp9_CoefCountRestore
	add	r0, r6, #294912
	ldr	r3, [r0, #3456]
	cmp	r3, #0
	bne	.L2117
	ldr	r3, [r0, #3460]
	cmp	r3, #0
	bne	.L2117
	add	r2, r5, #8192
	add	r0, r4, #10368
	add	r6, r4, #10176
	add	r9, r4, #9600
	add	r10, r4, #9216
	add	r9, r9, #32
	add	r7, r4, #10048
	str	r10, [r2, #1032]
	str	r9, [r2, #1028]
	add	r10, r4, #9472
	add	r9, r4, #10432
	str	r10, [r2, #1024]
	add	r10, r4, #10496
	str	r10, [fp, #-52]
	mov	r5, r6
	mov	r1, r0
	mov	r3, r0
	add	r7, r7, #32
	add	r6, r6, #16
	add	r0, r0, #16
	add	r3, r3, #56
	add	ip, r4, #10304
	str	r7, [r2, #3344]
	add	r7, r9, #24
	str	r6, [r2, #3348]
	add	r9, r9, #48
	add	r6, r4, #10560
	str	r0, [r2, #3372]
	str	r3, [r2, #3364]
	add	r0, r4, #10752
	add	r3, r4, #10816
	str	r7, [r2, #3376]
	str	r9, [r2, #3380]
	add	r9, r4, #10880
	ldr	r7, [fp, #-52]
	add	ip, ip, #40
	add	r8, r4, #9984
	add	lr, r4, #10240
	str	ip, [r2, #3360]
	add	ip, r4, #10688
	add	r8, r8, #48
	add	r5, r5, #48
	add	lr, lr, #24
	add	r1, r1, #32
	str	r8, [r2, #3340]
	add	r7, r7, #60
	mov	r8, r10
	str	r5, [r2, #3352]
	add	r10, r10, #8
	mov	r5, r6
	str	lr, [r2, #3356]
	add	r5, r5, #48
	mov	lr, r6
	str	r1, [r2, #3368]
	str	r10, [r2, #3416]
	mov	r1, r0
	mov	r10, r3
	add	r1, r1, #56
	str	r8, [r2, #3384]
	add	r6, r6, #40
	add	r8, r8, #16
	add	lr, lr, #56
	str	r8, [r2, #3388]
	add	ip, ip, #8
	mov	r8, r9
	add	r0, r0, #24
	str	r1, [r2, #3432]
	add	r3, r3, #24
	add	r1, r10, #40
	str	r9, [r2, #3440]
	add	r10, r10, #56
	add	r9, r9, #8
	add	r8, r8, #16
	str	r7, [r2, #3420]
	str	r6, [r2, #3392]
	str	r5, [r2, #3424]
	str	lr, [r2, #3396]
	str	ip, [r2, #3428]
	str	r0, [r2, #3400]
	str	r3, [r2, #3404]
	str	r1, [r2, #3436]
	str	r10, [r2, #3408]
	str	r9, [r2, #3412]
	str	r8, [r2, #3444]
.L2117:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	Vp9_RestoreCounts, .-Vp9_RestoreCounts
	.align	2
	.global	VP9DEC_VDMPostProc
	.type	VP9DEC_VDMPostProc, %function
VP9DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r2, #0
	str	r2, [fp, #-56]
	add	r2, r0, #274432
	str	r3, [fp, #-52]
	mov	r7, r0
	mov	r3, r2
	str	r2, [fp, #-48]
	ldr	r3, [r3, #1028]
	mov	r4, r1
	ldr	r2, [r2, #1036]
	str	r3, [fp, #-60]
	str	r2, [fp, #-64]
	beq	.L2120
	ldr	r1, [fp, #-52]
	ldr	r2, .L2186
	mov	r3, r1, asl #6
	sub	r3, r3, r1, asl #3
	add	r3, r3, r2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L2142
.L2120:
	add	r6, r7, #294912
	ldr	r3, [r6, #3400]
	cmp	r3, #0
	beq	.L2123
	ldr	r2, [r6, #3440]
	ldr	r3, [r6, #3436]
	cmp	r2, r3
	beq	.L2123
.L2124:
	add	r8, r7, #270336
	ldr	r0, [r6, #3492]
	ldr	r1, [r8, #2596]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L2174
	cmp	r4, #0
	blt	.L2127
	cmp	r4, #100
	movlt	r2, r4
	movge	r2, #100
	str	r2, [r5, #184]
	ldr	r3, [r7]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L2175
.L2128:
	mov	r0, r7
	bl	VP9_SetImgFormat
	ldr	r3, [r7]
	ldr	r3, [r3, #596]
	cmp	r3, #1
	beq	.L2176
.L2129:
	mov	r3, #0
	str	r3, [r5, #96]
	str	r3, [r5, #100]
.L2132:
	movw	r4, #10908
	movw	r9, #10872
	movw	r5, #10988
	movt	r4, 4
	movt	r9, 4
	movt	r5, 4
	add	r4, r7, r4
	add	r9, r7, r9
	add	r10, r8, #2752
	add	r5, r7, r5
	b	.L2135
.L2133:
	clz	r3, r3
	cmp	r0, #0
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L2177
.L2134:
	cmp	r4, r10
	beq	.L2178
.L2135:
	ldr	r3, [r9, #4]!
	ldr	r0, [r4, #4]!
	adds	r2, r3, #0
	ldr	r1, [r5, #4]!
	movne	r2, #1
	cmp	r0, #0
	movne	r2, #0
	cmp	r2, #0
	beq	.L2133
	mov	r2, #1
	ldr	r0, [r6, #3492]
	bl	FSP_SetRef
	cmp	r4, r10
	bne	.L2135
.L2178:
	ldr	r3, .L2186+4
	movw	r0, #10804
	movt	r0, 4
	add	r0, r7, r0
	add	r1, r0, #72
	mov	r2, #36
	ldr	r3, [r3, #52]
	add	r0, r0, #108
	blx	r3
	ldr	r3, [r8, #2548]
	cmp	r3, #2
	beq	.L2179
.L2136:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #972]
	cmp	r3, #0
	bne	.L2138
.L2137:
	mvn	r3, #0
	ldr	r1, [r8, #2596]
	str	r3, [r8, #2600]
	mov	r2, #0
	ldr	r0, [r6, #3492]
	bl	FSP_SetDisplay
	ldr	r1, [r8, #2600]
.L2139:
	cmn	r1, #1
	beq	.L2140
	ldr	r0, [r6, #3492]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L2180
	mov	r2, #1
	ldr	r1, [r8, #2600]
	ldr	r0, [r6, #3492]
	bl	FSP_SetDisplay
	ldr	r3, [fp, #-48]
	ldr	r0, [r6, #3492]
	mov	r2, r7
	str	r4, [sp]
	add	r3, r3, #1376
	mov	r1, #17
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r5, r0
	bne	.L2181
.L2140:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L2142
	ldr	r1, [fp, #-52]
	ldr	r2, .L2186
	mov	r3, r1, asl #6
	sub	r10, r3, r1, asl #3
	add	r10, r10, r2
	ldr	r3, [r10, #4]
	cmp	r3, #2
	beq	.L2122
.L2142:
	ldr	r3, [fp, #-48]
	ldr	r5, [r3, #976]
	cmp	r5, #0
	beq	.L2182
.L2122:
	mov	r5, #0
.L2172:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2177:
	ldr	r0, [r6, #3492]
	bl	FSP_SetRef
	b	.L2134
.L2138:
	ldr	r1, [r8, #2596]
	str	r1, [r8, #2600]
	b	.L2139
.L2182:
	add	r8, r7, #270336
	ldr	r0, [r8, #2356]
	bl	MEM_Phy2Vir
	subs	r10, r0, #0
	beq	.L2183
	add	r6, r7, #294912
	ldr	r3, [r6, #3456]
	cmp	r3, #0
	ldr	r3, [r6, #3476]
	bne	.L2184
	cmp	r3, #0
	movne	r4, r5
	bne	.L2146
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	ldr	r3, [fp, #-64]
	movne	r4, #0
	moveq	r4, r3
.L2145:
	ldr	r3, [r6, #3480]
	cmp	r3, #0
	beq	.L2185
.L2146:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L2122
	movw	r2, #2087
	ldr	r3, [fp, #-48]
	mla	r7, r2, r4, r7
	movw	r0, #16135
	add	r1, r3, #1760
	movt	r0, 4
	add	r0, r7, r0
	bl	memcpy
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2123:
	mov	r1, r7
	mov	r0, #17
	bl	ReleasePacket
	mov	r3, #0
	str	r3, [r6, #3400]
	b	.L2124
.L2127:
	mov	r3, #0
	str	r3, [r5, #184]
	b	.L2128
.L2179:
	ldr	r3, [r8, #2604]
	cmp	r3, #0
	bne	.L2137
	b	.L2136
.L2176:
	ldr	r2, [fp, #-48]
	ldr	r2, [r2, #976]
	cmp	r2, #0
	bne	.L2129
	ldr	r2, .L2186+8
	ldr	r2, [r2]
	add	r2, r2, #4096
	ldr	r0, [r2, #84]
	ldr	r1, [r2, #88]
	str	r3, [r5, #96]
	cmp	r1, #0
	moveq	r1, #1
	bl	__aeabi_uidiv
	str	r0, [r5, #100]
	b	.L2132
.L2184:
	cmp	r3, #0
	mov	r4, r5
	bne	.L2146
	b	.L2145
.L2181:
	add	r7, r4, #608
	ldr	r0, [r6, #3492]
	ldr	r1, [r4, #600]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #-8]
	ldr	r1, [r4, #608]
	ldr	r0, [r6, #3492]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7]
	ldr	r1, [r8, #2600]
	ldr	r0, [r6, #3492]
	bl	FSP_SetDisplay
	ldr	r1, .L2186+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2185:
	ldr	r2, [fp, #-64]
	movw	lr, #2087
	ldr	r3, .L2186+4
	movw	r9, #24484
	movt	r9, 4
	add	r9, r7, r9
	mla	lr, lr, r2, r7
	ldr	r1, [r8, #2356]
	ldr	r3, [r3, #140]
	mov	r0, r10
	mov	r2, #11264
	movw	r8, #16135
	movt	r8, 4
	add	r8, lr, r8
	blx	r3
	mov	r1, r10
	mov	r2, r9
	mov	r0, r7
	bl	Vp9_RestoreCounts
	ldr	r3, [fp, #-48]
	ldr	r0, [r6, #3460]
	mov	r2, r9
	ldr	lr, [r6, #3472]
	add	r10, r3, #1760
	ldr	r3, [r6, #3468]
	mov	r1, r8
	stmib	sp, {r0, lr}
	mov	r0, r10
	str	r3, [sp]
	mov	r3, r4
	bl	Vp9_AdaptResidualProbs
	ldr	r3, [r6, #3456]
	cmp	r3, #0
	bne	.L2146
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2146
	ldr	lr, [r6, #3464]
	mov	r2, r9
	ldr	r3, [r6, #3488]
	mov	r1, r8
	mov	r0, r10
	str	lr, [sp]
	bl	Vp9_AdaptModeProbs
	ldr	r3, [r6, #3484]
	mov	r2, r9
	mov	r1, r8
	mov	r0, r10
	bl	Vp9_AdaptMvProbs
	b	.L2146
.L2175:
	ldr	r1, .L2186+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r5, #0
	b	.L2172
.L2180:
	movw	r2, #2650
	ldr	r1, .L2186+20
	bl	dprint_vfmw
	mvn	r5, #0
	b	.L2172
.L2174:
	ldr	r1, .L2186+24
	mvn	r5, #0
	bl	dprint_vfmw
	b	.L2172
.L2183:
	ldr	r1, .L2186+28
	mvn	r5, #0
	bl	dprint_vfmw
	b	.L2172
.L2187:
	.align	2
.L2186:
	.word	g_VdmDrvParam+40
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LC37
	.word	.LC35
	.word	.LC36
	.word	.LC34
	.word	.LC38
	UNWIND(.fnend)
	.size	VP9DEC_VDMPostProc, .-VP9DEC_VDMPostProc
	.align	2
	.global	VP9DEC_DecodeFame
	.type	VP9DEC_DecodeFame, %function
VP9DEC_DecodeFame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r4, r0, #294912
	add	r5, r0, #274432
	movw	r7, #10804
	ldr	r3, [r4, #3396]
	movt	r7, 4
	mov	r6, r0
	str	r1, [fp, #-56]
	cmp	r3, #0
	add	r8, r5, #1728
	add	r7, r0, r7
	beq	.L2189
	ldr	r3, [r5, #948]
	cmp	r3, #0
	blt	.L2189
.L2190:
	str	r3, [r4, #3392]
	mov	r1, r7
	mov	r0, r8
	bl	Read_UnCompressed_Header
	subs	r10, r0, #0
	bne	.L2266
	ldr	r2, [r5, #1016]
	ldr	r3, [r6]
	str	r2, [r3, #884]
	ldr	r2, [r5, #1016]
	cmp	r2, #10
	bgt	.L2269
.L2197:
	ldr	r3, [r5, #976]
	add	r9, r6, #270336
	cmp	r3, #0
	bne	.L2199
	ldr	r2, [r9, #2544]
	cmp	r2, #7
	ble	.L2270
.L2199:
	ldr	r3, [r5, #1000]
	sub	r2, r3, #128
	cmp	r2, #3968
	bls	.L2271
.L2200:
	ldr	r3, .L2285
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2266
	mov	r3, #0
	ldr	r0, [r4, #3492]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	mvn	r0, #0
.L2263:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2189:
	add	r9, r6, #270336
	ldr	r3, [r9, #2684]
	cmp	r3, #0
	beq	.L2191
	movw	r2, #10876
	mov	r3, #1
	movt	r2, 4
	add	r2, r6, r2
.L2192:
	ldr	r1, [r2, #4]!
	cmp	r1, #0
	beq	.L2191
	add	r3, r3, #1
	cmp	r3, #9
	bne	.L2192
	mvn	r3, #0
	str	r3, [r5, #948]
.L2231:
	ldr	r1, .L2285+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2263
.L2271:
	ldr	r2, [r5, #1004]
	sub	r1, r2, #128
	cmp	r1, #3968
	bhi	.L2200
	adds	r1, r3, #63
	str	r3, [r9, #2624]
	addmi	r1, r3, #126
	adds	r3, r2, #63
	addmi	r3, r2, #126
	str	r2, [r9, #2628]
	mov	r0, r6
	mov	r2, r1, asr #6
	mov	r3, r3, asr #6
	str	r2, [r9, #2616]
	str	r3, [r9, #2620]
	bl	VP9_GetRefNum
	str	r0, [r4, #3368]
	ldr	r0, [r4, #3492]
	ldr	r2, [r9, #2628]
	ldr	r1, [r9, #2624]
	bl	VCTRL_GetFsSize
	mov	r1, r0
	str	r0, [r4, #3356]
	ldr	r0, [r4, #3492]
	bl	FSP_GetPhyFsNum
	ldr	r3, .L2285+8
	ldr	r1, [r4, #3492]
	ldr	r2, [r3, r1, asl #2]
	str	r0, [r4, #3360]
	ldr	r3, [r2, #1392]
	str	r3, [r4, #3364]
	ldr	r0, [r9, #2624]
	cmp	r0, #1920
	bhi	.L2203
	ldr	lr, [r9, #2628]
	cmp	lr, #1088
	bhi	.L2203
	ldr	r2, [r2, #36]
	cmp	r2, #24
	addne	r3, r3, #4
.L2203:
	ldr	lr, [r4, #3372]
	ldr	r2, [r4, #3368]
	ldr	r10, [r4, #3376]
	cmp	r2, lr
	movge	lr, r2
	cmp	r0, r10
	add	r3, lr, r3
	str	r3, [r4, #3364]
	beq	.L2272
.L2204:
	str	r2, [r4, #3372]
.L2206:
	mov	r0, r1
	mov	r1, #0
	bl	FSP_GetPhyFsNum
	ldr	r2, [r4, #3360]
	cmp	r0, r2
	str	r0, [fp, #-60]
	ble	.L2207
	rsb	r3, r2, r0
	cmp	r3, #0
	ble	.L2207
	mov	r10, #0
	b	.L2209
.L2273:
	ldr	r3, [fp, #-60]
	rsb	r1, r2, r3
	cmp	r1, r10
	ble	.L2207
.L2209:
	ldr	r1, [r4, #3356]
	add	r10, r10, #1
	ldr	r0, [r4, #3492]
	bl	FSP_RelsePhyFs
	ldr	r2, [r4, #3360]
	cmp	r0, #0
	beq	.L2273
.L2207:
	ldr	r3, [r4, #3364]
	cmp	r3, r2
	bge	.L2212
	rsb	r2, r3, r2
	cmp	r2, #0
	ble	.L2212
	mov	r10, #0
	b	.L2213
.L2274:
	ldr	r3, [r4, #3360]
	ldr	r2, [r4, #3364]
	rsb	r3, r2, r3
	cmp	r3, r10
	ble	.L2212
.L2213:
	mov	r1, #0
	ldr	r0, [r4, #3492]
	bl	FSP_RelsePhyFs
	add	r10, r10, #1
	cmp	r0, #0
	beq	.L2274
.L2212:
	mov	r1, #0
	ldr	r0, [r4, #3492]
	bl	FSP_GetPhyFsNum
	ldr	r3, [r4, #3364]
	add	r3, r3, #4
	cmp	r0, r3
	mov	r10, r0
	bgt	.L2275
	ldr	r1, [r4, #3356]
	ldr	r0, [r4, #3492]
	bl	FSP_GetPhyFsNum
	ldr	r1, [r4, #3364]
	mov	r3, r0
	ldr	r0, [r4, #3368]
	str	r3, [r4, #3360]
	add	r2, r0, #1
	str	r3, [sp, #4]
	cmp	r3, r2
	rsb	r2, r10, r3
	addgt	lr, r0, #2
	addle	lr, r3, #1
	add	r2, r2, r1
	str	r0, [sp, #8]
	cmp	lr, r2
	str	r10, [sp]
	mov	r0, #2
	ldr	r1, .L2285+12
	movlt	lr, r2
	str	lr, [r4, #3364]
	ldr	r3, [r9, #2628]
	ldr	r2, [r9, #2624]
	str	lr, [sp, #12]
	bl	dprint_vfmw
	ldr	r3, [r9, #2552]
	cmp	r3, #0
	beq	.L2216
	ldr	r2, [r4, #3376]
	ldr	r3, [r9, #2624]
	cmp	r2, r3
	bne	.L2216
	ldr	r2, [r4, #3380]
	ldr	r3, [r9, #2628]
	cmp	r2, r3
	bne	.L2216
	ldr	r2, [r4, #3360]
	ldr	r3, [r4, #3364]
	cmp	r2, r3
	bge	.L2217
.L2216:
	mov	r0, r6
	bl	VP9_ArrangeVHBMem
	ldr	r3, [r9, #2552]
	cmp	r3, #0
	beq	.L2276
.L2217:
	ldr	r3, [r5, #976]
	ldr	r0, [r4, #3492]
	cmp	r3, #0
	ldreq	r3, [r9, #2624]
	streq	r3, [r4, #3376]
	ldreq	r3, [r9, #2628]
	streq	r3, [r4, #3380]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	bne	.L2277
	mov	r0, r8
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	bne	.L2278
.L2220:
	ldr	r3, [r5, #976]
	cmp	r3, #0
	beq	.L2279
.L2221:
	mov	r0, r6
	bl	VP9_GetImageBuffer
	cmp	r0, #0
	bne	.L2280
	ldr	r3, [r4, #3392]
	mov	r0, r6
	ldr	r2, [r9, #2596]
	add	r3, r9, r3, lsl #2
	str	r2, [r3, #2800]
	bl	VP9_Set_DecParam
	cmp	r0, #0
	bne	.L2281
	ldr	r3, [r5, #976]
	cmp	r3, #1
	beq	.L2282
	ldr	r3, [r9, #2624]
	str	r3, [r4, #3384]
	ldr	r3, [r9, #2628]
	str	r3, [r4, #3388]
.L2226:
	mov	r0, r7
	bl	swap_frame_buffers
	ldr	r2, [r4, #3444]
	ldr	r0, [r4, #3448]
	cmp	r2, r0
	bcs	.L2227
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2227
	add	r3, r2, #1
	b	.L2228
.L2283:
	ldrb	r1, [r2]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2227
.L2228:
	cmp	r3, r0
	str	r3, [r4, #3444]
	mov	r2, r3
	add	r3, r3, #1
	bne	.L2283
.L2227:
	ldr	r3, [r4, #3400]
	cmp	r3, #1
	beq	.L2284
.L2229:
	mov	r7, #0
	str	r7, [r4, #3396]
	ldr	r0, [r5, #976]
	cmp	r0, r7
	bne	.L2230
	ldr	r3, [r5, #972]
	str	r3, [r5, #984]
	b	.L2263
.L2270:
	ldr	r1, .L2285+16
	mov	r0, #1
	bl	dprint_vfmw
.L2266:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2269:
	ldr	r1, .L2285+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2285
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2197
	ldr	lr, [r5, #1016]
	mov	r3, #8
	str	r10, [fp, #-52]
	sub	r2, fp, #52
	mov	r1, #119
	ldr	r0, [r4, #3492]
	str	lr, [fp, #-48]
	blx	ip
	b	.L2197
.L2191:
	add	ip, r9, r3, lsl #2
	cmp	r3, #0
	mov	r2, #1
	str	r2, [ip, #2684]
	str	r3, [r5, #948]
	bge	.L2190
	b	.L2231
.L2272:
	ldr	r3, [r9, #2628]
	ldr	r0, [r4, #3380]
	cmp	r0, r3
	streq	lr, [r4, #3372]
	bne	.L2204
	b	.L2206
.L2279:
	ldr	r3, [r5, #1752]
	mov	r0, r6
	ldr	r2, [r5, #1744]
	add	r3, r3, #7
	ldr	r1, [fp, #-56]
	mov	r3, r3, lsr #3
	add	r1, r1, r3
	rsb	r2, r3, r2
	bl	Vp9_DecodeTiles
	b	.L2221
.L2278:
	mov	r0, r8
	bl	BsGet
	b	.L2220
.L2282:
	ldr	r0, [r5, #948]
	movw	r3, #10876
	movt	r3, 4
	add	r3, r6, r3
	ldr	r2, [r5, #980]
	ldr	r1, [r3, r0, asl #2]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r3, r0, asl #2]
	str	r2, [r5, #948]
	ldr	r1, [r3, r2, asl #2]
	add	r1, r1, #1
	str	r1, [r3, r2, asl #2]
	b	.L2226
.L2230:
	mov	r0, r6
	mov	r3, r7
	mov	r2, r7
	mov	r1, r7
	bl	VP9DEC_VDMPostProc
	mov	r0, r7
	b	.L2263
.L2284:
	ldr	r1, [r4, #3440]
	movw	r3, #9042
	movt	r3, 1
	add	r3, r1, r3
	add	r1, r1, #1
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r1, [r4, #3440]
	add	r2, r2, r3
	str	r2, [r4, #3444]
	b	.L2229
.L2275:
	mvn	r0, #1
	b	.L2263
.L2277:
	movw	r3, #4122
	ldr	r2, .L2285+24
	ldr	r1, .L2285+28
	mov	r0, #23
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L2263
.L2280:
	ldr	r1, .L2285+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L2263
.L2276:
	ldr	r1, .L2285+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L2263
.L2281:
	ldr	r1, .L2285+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2263
.L2286:
	.align	2
.L2285:
	.word	g_event_report
	.word	.LC39
	.word	s_pstVfmwChan
	.word	.LC42
	.word	.LC41
	.word	.LC40
	.word	.LANCHOR0+892
	.word	.LC44
	.word	.LC45
	.word	.LC43
	.word	.LC46
	UNWIND(.fnend)
	.size	VP9DEC_DecodeFame, .-VP9DEC_DecodeFame
	.align	2
	.global	VP9DEC_DecodePacket
	.type	VP9DEC_DecodePacket, %function
VP9DEC_DecodePacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r1, #0
	cmpne	r0, #0
	mov	r3, #0
	mov	r4, r0
	str	r3, [fp, #-72]
	beq	.L2299
	ldr	r0, [r1]
	add	r8, r4, #270336
	add	r5, r4, #294912
	str	r0, [r8, #2536]
	ldr	r3, [r1, #12]
	str	r3, [r8, #2540]
	ldr	r1, [r1, #16]
	str	r1, [r8, #2544]
	ldr	r6, [r5, #3400]
	cmp	r6, #0
	beq	.L2308
	ldr	r2, [r5, #3452]
	ldr	r7, [r5, #3444]
	b	.L2292
.L2310:
	ldrb	ip, [r7]	@ zero_extendqisi2
	and	r3, ip, #7
	and	r0, ip, #224
	ubfx	r1, ip, #3, #2
	add	r3, r3, #1
	cmp	r0, #192
	mla	r3, r1, r3, r3
	bne	.L2295
	add	r1, r3, #2
	cmp	r1, r2
	bls	.L2309
.L2292:
	cmp	r2, #0
	bne	.L2310
.L2295:
	cmp	r6, #1
	beq	.L2311
.L2297:
	add	r0, r4, #274432
	mov	r1, r7
	add	r0, r0, #1728
	bl	BsInit
	mov	r1, r7
	mov	r0, r4
	bl	VP9DEC_DecodeFame
	cmn	r0, #2
	mov	r6, r0
	moveq	r3, #1
	streq	r3, [r5, #3396]
	beq	.L2288
	cmp	r6, #0
	moveq	r0, r6
	bne	.L2312
.L2288:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2312:
	mov	r0, r4
	bl	VP9_FreeCurFb
	mov	r3, #0
	mov	r1, r4
	str	r3, [r5, #3400]
	mov	r0, #17
	bl	ReleasePacket
	ldr	r1, .L2314
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2309:
	add	r3, r7, r3
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, ip
	bne	.L2292
	ldr	r3, [r5, #3448]
	add	r7, r7, r1
	rsb	r2, r1, r2
	str	r7, [r5, #3444]
	cmp	r7, r3
	str	r2, [r5, #3452]
	bcc	.L2292
	b	.L2295
.L2308:
	sub	r3, fp, #72
	sub	r2, fp, #68
	bl	Vp9_ParseSuperFrameIndex
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L2313
.L2290:
	ldr	r7, [r8, #2536]
	ldr	r6, [r5, #3400]
	str	r7, [r5, #3444]
	ldr	r2, [r8, #2544]
	add	r3, r7, r2
	str	r3, [r5, #3448]
	str	r2, [r5, #3452]
	b	.L2292
.L2311:
	ldr	r2, [r5, #3440]
	movw	r3, #9042
	movt	r3, 1
	add	r3, r2, r3
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #4]
	b	.L2297
.L2313:
	ldr	r2, .L2314+4
	movw	r0, #36172
	str	r3, [r5, #3436]
	mov	ip, #1
	str	r6, [r5, #3440]
	sub	r1, fp, #68
	ldr	r3, [r2, #52]
	movt	r0, 4
	mov	r2, #32
	add	r0, r4, r0
	str	ip, [r5, #3400]
	blx	r3
	b	.L2290
.L2299:
	mvn	r0, #0
	b	.L2288
.L2315:
	.align	2
.L2314:
	.word	.LC47
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VP9DEC_DecodePacket, .-VP9DEC_DecodePacket
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	count_to_update_factor, %object
	.size	count_to_update_factor, 21
count_to_update_factor:
	.byte	0
	.byte	6
	.byte	12
	.byte	19
	.byte	25
	.byte	32
	.byte	38
	.byte	44
	.byte	51
	.byte	57
	.byte	64
	.byte	70
	.byte	76
	.byte	83
	.byte	89
	.byte	96
	.byte	102
	.byte	108
	.byte	115
	.byte	121
	.byte	-128
	.space	3
	.type	vp9_cabac_norm, %object
	.size	vp9_cabac_norm, 256
vp9_cabac_norm:
	.byte	0
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	vp9_inv_map_table, %object
	.size	vp9_inv_map_table, 254
vp9_inv_map_table:
	.byte	6
	.byte	19
	.byte	32
	.byte	45
	.byte	58
	.byte	71
	.byte	84
	.byte	97
	.byte	110
	.byte	123
	.byte	-120
	.byte	-107
	.byte	-94
	.byte	-81
	.byte	-68
	.byte	-55
	.byte	-42
	.byte	-29
	.byte	-16
	.byte	-3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	59
	.byte	60
	.byte	61
	.byte	62
	.byte	63
	.byte	64
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	72
	.byte	73
	.byte	74
	.byte	75
	.byte	76
	.byte	77
	.byte	78
	.byte	79
	.byte	80
	.byte	81
	.byte	82
	.byte	83
	.byte	85
	.byte	86
	.byte	87
	.byte	88
	.byte	89
	.byte	90
	.byte	91
	.byte	92
	.byte	93
	.byte	94
	.byte	95
	.byte	96
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	107
	.byte	108
	.byte	109
	.byte	111
	.byte	112
	.byte	113
	.byte	114
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	124
	.byte	125
	.byte	126
	.byte	127
	.byte	-128
	.byte	-127
	.byte	-126
	.byte	-125
	.byte	-124
	.byte	-123
	.byte	-122
	.byte	-121
	.byte	-119
	.byte	-118
	.byte	-117
	.byte	-116
	.byte	-115
	.byte	-114
	.byte	-113
	.byte	-112
	.byte	-111
	.byte	-110
	.byte	-109
	.byte	-108
	.byte	-106
	.byte	-105
	.byte	-104
	.byte	-103
	.byte	-102
	.byte	-101
	.byte	-100
	.byte	-99
	.byte	-98
	.byte	-97
	.byte	-96
	.byte	-95
	.byte	-93
	.byte	-92
	.byte	-91
	.byte	-90
	.byte	-89
	.byte	-88
	.byte	-87
	.byte	-86
	.byte	-85
	.byte	-84
	.byte	-83
	.byte	-82
	.byte	-80
	.byte	-79
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.byte	-72
	.byte	-71
	.byte	-70
	.byte	-69
	.byte	-67
	.byte	-66
	.byte	-65
	.byte	-64
	.byte	-63
	.byte	-62
	.byte	-61
	.byte	-60
	.byte	-59
	.byte	-58
	.byte	-57
	.byte	-56
	.byte	-54
	.byte	-53
	.byte	-52
	.byte	-51
	.byte	-50
	.byte	-49
	.byte	-48
	.byte	-47
	.byte	-46
	.byte	-45
	.byte	-44
	.byte	-43
	.byte	-41
	.byte	-40
	.byte	-39
	.byte	-38
	.byte	-37
	.byte	-36
	.byte	-35
	.byte	-34
	.byte	-33
	.byte	-32
	.byte	-31
	.byte	-30
	.byte	-28
	.byte	-27
	.byte	-26
	.byte	-25
	.byte	-24
	.byte	-23
	.byte	-22
	.byte	-21
	.byte	-20
	.byte	-19
	.byte	-18
	.byte	-17
	.byte	-15
	.byte	-14
	.byte	-13
	.byte	-12
	.byte	-11
	.byte	-10
	.byte	-9
	.byte	-8
	.byte	-7
	.byte	-6
	.byte	-5
	.byte	-4
	.space	2
	.type	vp9_inter_mode_tree, %object
	.size	vp9_inter_mode_tree, 6
vp9_inter_mode_tree:
	.byte	-2
	.byte	2
	.byte	0
	.byte	4
	.byte	-1
	.byte	-3
	.space	2
	.type	vp9_intra_mode_tree, %object
	.size	vp9_intra_mode_tree, 18
vp9_intra_mode_tree:
	.byte	0
	.byte	2
	.byte	-9
	.byte	4
	.byte	-1
	.byte	6
	.byte	8
	.byte	12
	.byte	-2
	.byte	10
	.byte	-4
	.byte	-5
	.byte	-3
	.byte	14
	.byte	-8
	.byte	16
	.byte	-6
	.byte	-7
	.space	2
	.type	vp9_partition_tree, %object
	.size	vp9_partition_tree, 6
vp9_partition_tree:
	.byte	0
	.byte	2
	.byte	-1
	.byte	4
	.byte	-2
	.byte	-3
	.space	2
	.type	vp9_switchable_interp_tree, %object
	.size	vp9_switchable_interp_tree, 4
vp9_switchable_interp_tree:
	.byte	0
	.byte	2
	.byte	-1
	.byte	-2
.LC0:
	.byte	0
	.byte	2
	.byte	-1
	.byte	4
	.byte	-2
	.byte	-3
	.space	2
.LC1:
	.byte	0
	.byte	2
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	-2
	.byte	-3
	.byte	10
	.byte	12
	.byte	-4
	.byte	-5
	.byte	-6
	.byte	14
	.byte	16
	.byte	18
	.byte	-7
	.byte	-8
	.byte	-9
	.byte	-10
	.type	__func__.14931, %object
	.size	__func__.14931, 19
__func__.14931:
	.ascii	"VP9_GetImageBuffer\000"
	.space	1
	.type	seg_feature_data_max, %object
	.size	seg_feature_data_max, 16
seg_feature_data_max:
	.word	255
	.word	63
	.word	3
	.word	0
	.type	seg_feature_data_signed, %object
	.size	seg_feature_data_signed, 16
seg_feature_data_signed:
	.word	1
	.word	1
	.word	0
	.word	0
	.type	__func__.15113, %object
	.size	__func__.15113, 16
__func__.15113:
	.ascii	"VP9_Set_Segdata\000"
.LC2:
	.word	1
	.word	0
	.word	2
	.word	3
	.type	__FUNCTION__.15189, %object
	.size	__FUNCTION__.15189, 33
__FUNCTION__.15189:
	.ascii	"VP9_get_fixed_point_scale_factor\000"
	.space	3
	.type	__FUNCTION__.15218, %object
	.size	__FUNCTION__.15218, 35
__FUNCTION__.15218:
	.ascii	"Vp9_ReadBitDepthColorSpaceSampling\000"
	.space	1
	.type	__FUNCTION__.15248, %object
	.size	__FUNCTION__.15248, 25
__FUNCTION__.15248:
	.ascii	"Read_UnCompressed_Header\000"
	.space	3
	.type	vp9_default_tx_probs, %object
	.size	vp9_default_tx_probs, 12
vp9_default_tx_probs:
	.byte	3
	.byte	-120
	.byte	37
	.byte	5
	.byte	52
	.byte	13
	.byte	20
	.byte	-104
	.byte	15
	.byte	101
	.byte	100
	.byte	66
	.type	vp9_default_nmv_context, %object
	.size	vp9_default_nmv_context, 69
vp9_default_nmv_context:
	.byte	32
	.byte	64
	.byte	96
	.byte	-128
	.byte	-32
	.byte	-112
	.byte	-64
	.byte	-88
	.byte	-64
	.byte	-80
	.byte	-64
	.byte	-58
	.byte	-58
	.byte	-11
	.byte	-40
	.byte	-120
	.byte	-116
	.byte	-108
	.byte	-96
	.byte	-80
	.byte	-64
	.byte	-32
	.byte	-22
	.byte	-22
	.byte	-16
	.byte	-128
	.byte	-128
	.byte	64
	.byte	96
	.byte	112
	.byte	64
	.byte	64
	.byte	96
	.byte	64
	.byte	-96
	.byte	-128
	.byte	-128
	.byte	-40
	.byte	-128
	.byte	-80
	.byte	-96
	.byte	-80
	.byte	-80
	.byte	-64
	.byte	-58
	.byte	-58
	.byte	-48
	.byte	-48
	.byte	-120
	.byte	-116
	.byte	-108
	.byte	-96
	.byte	-80
	.byte	-64
	.byte	-32
	.byte	-22
	.byte	-22
	.byte	-16
	.byte	-128
	.byte	-128
	.byte	64
	.byte	96
	.byte	112
	.byte	64
	.byte	64
	.byte	96
	.byte	64
	.byte	-96
	.byte	-128
	.space	3
	.type	__func__.15470, %object
	.size	__func__.15470, 20
__func__.15470:
	.ascii	"Vp9_DecodeTilesCtrl\000"
	.type	__func__.15330, %object
	.size	__func__.15330, 18
__func__.15330:
	.ascii	"VP9DEC_DecodeFame\000"
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	vp9_default_coef_probs_4x4, %object
	.size	vp9_default_coef_probs_4x4, 432
vp9_default_coef_probs_4x4:
	.byte	-61
	.byte	29
	.byte	-73
	.byte	84
	.byte	49
	.byte	-120
	.byte	8
	.byte	42
	.byte	71
	.space	9
	.byte	31
	.byte	107
	.byte	-87
	.byte	35
	.byte	99
	.byte	-97
	.byte	17
	.byte	82
	.byte	-116
	.byte	8
	.byte	66
	.byte	114
	.byte	2
	.byte	44
	.byte	76
	.byte	1
	.byte	19
	.byte	32
	.byte	40
	.byte	-124
	.byte	-55
	.byte	29
	.byte	114
	.byte	-69
	.byte	13
	.byte	91
	.byte	-99
	.byte	7
	.byte	75
	.byte	127
	.byte	3
	.byte	58
	.byte	95
	.byte	1
	.byte	28
	.byte	47
	.byte	69
	.byte	-114
	.byte	-35
	.byte	42
	.byte	122
	.byte	-55
	.byte	15
	.byte	91
	.byte	-97
	.byte	6
	.byte	67
	.byte	121
	.byte	1
	.byte	42
	.byte	77
	.byte	1
	.byte	17
	.byte	31
	.byte	102
	.byte	-108
	.byte	-28
	.byte	67
	.byte	117
	.byte	-52
	.byte	17
	.byte	82
	.byte	-102
	.byte	6
	.byte	59
	.byte	114
	.byte	2
	.byte	39
	.byte	75
	.byte	1
	.byte	15
	.byte	29
	.byte	-100
	.byte	57
	.byte	-23
	.byte	119
	.byte	57
	.byte	-44
	.byte	58
	.byte	48
	.byte	-93
	.byte	29
	.byte	40
	.byte	124
	.byte	12
	.byte	30
	.byte	81
	.byte	3
	.byte	12
	.byte	31
	.byte	-65
	.byte	107
	.byte	-30
	.byte	124
	.byte	117
	.byte	-52
	.byte	25
	.byte	99
	.byte	-101
	.space	9
	.byte	29
	.byte	-108
	.byte	-46
	.byte	37
	.byte	126
	.byte	-62
	.byte	8
	.byte	93
	.byte	-99
	.byte	2
	.byte	68
	.byte	118
	.byte	1
	.byte	39
	.byte	69
	.byte	1
	.byte	17
	.byte	33
	.byte	41
	.byte	-105
	.byte	-43
	.byte	27
	.byte	123
	.byte	-63
	.byte	3
	.byte	82
	.byte	-112
	.byte	1
	.byte	58
	.byte	105
	.byte	1
	.byte	32
	.byte	60
	.byte	1
	.byte	13
	.byte	26
	.byte	59
	.byte	-97
	.byte	-36
	.byte	23
	.byte	126
	.byte	-58
	.byte	4
	.byte	88
	.byte	-105
	.byte	1
	.byte	66
	.byte	114
	.byte	1
	.byte	38
	.byte	71
	.byte	1
	.byte	18
	.byte	34
	.byte	114
	.byte	-120
	.byte	-24
	.byte	51
	.byte	114
	.byte	-49
	.byte	11
	.byte	83
	.byte	-101
	.byte	3
	.byte	56
	.byte	105
	.byte	1
	.byte	33
	.byte	65
	.byte	1
	.byte	17
	.byte	34
	.byte	-107
	.byte	65
	.byte	-22
	.byte	121
	.byte	57
	.byte	-41
	.byte	61
	.byte	49
	.byte	-90
	.byte	28
	.byte	36
	.byte	114
	.byte	12
	.byte	25
	.byte	76
	.byte	3
	.byte	16
	.byte	42
	.byte	-42
	.byte	49
	.byte	-36
	.byte	-124
	.byte	63
	.byte	-68
	.byte	42
	.byte	65
	.byte	-119
	.space	9
	.byte	85
	.byte	-119
	.byte	-35
	.byte	104
	.byte	-125
	.byte	-40
	.byte	49
	.byte	111
	.byte	-64
	.byte	21
	.byte	87
	.byte	-101
	.byte	2
	.byte	49
	.byte	87
	.byte	1
	.byte	16
	.byte	28
	.byte	89
	.byte	-93
	.byte	-26
	.byte	90
	.byte	-119
	.byte	-36
	.byte	29
	.byte	100
	.byte	-73
	.byte	10
	.byte	70
	.byte	-121
	.byte	2
	.byte	42
	.byte	81
	.byte	1
	.byte	17
	.byte	33
	.byte	108
	.byte	-89
	.byte	-19
	.byte	55
	.byte	-123
	.byte	-34
	.byte	15
	.byte	97
	.byte	-77
	.byte	4
	.byte	72
	.byte	-121
	.byte	1
	.byte	45
	.byte	85
	.byte	1
	.byte	19
	.byte	38
	.byte	124
	.byte	-110
	.byte	-16
	.byte	66
	.byte	124
	.byte	-32
	.byte	17
	.byte	88
	.byte	-81
	.byte	4
	.byte	58
	.byte	122
	.byte	1
	.byte	36
	.byte	75
	.byte	1
	.byte	18
	.byte	37
	.byte	-115
	.byte	79
	.byte	-15
	.byte	126
	.byte	70
	.byte	-29
	.byte	66
	.byte	58
	.byte	-74
	.byte	30
	.byte	44
	.byte	-120
	.byte	12
	.byte	34
	.byte	96
	.byte	2
	.byte	20
	.byte	47
	.byte	-27
	.byte	99
	.byte	-7
	.byte	-113
	.byte	111
	.byte	-21
	.byte	46
	.byte	109
	.byte	-64
	.space	9
	.byte	82
	.byte	-98
	.byte	-20
	.byte	94
	.byte	-110
	.byte	-32
	.byte	25
	.byte	117
	.byte	-65
	.byte	9
	.byte	87
	.byte	-107
	.byte	3
	.byte	56
	.byte	99
	.byte	1
	.byte	33
	.byte	57
	.byte	83
	.byte	-89
	.byte	-19
	.byte	68
	.byte	-111
	.byte	-34
	.byte	10
	.byte	103
	.byte	-79
	.byte	2
	.byte	72
	.byte	-125
	.byte	1
	.byte	41
	.byte	79
	.byte	1
	.byte	20
	.byte	39
	.byte	99
	.byte	-89
	.byte	-17
	.byte	47
	.byte	-115
	.byte	-32
	.byte	10
	.byte	104
	.byte	-78
	.byte	2
	.byte	73
	.byte	-123
	.byte	1
	.byte	44
	.byte	85
	.byte	1
	.byte	22
	.byte	47
	.byte	127
	.byte	-111
	.byte	-13
	.byte	71
	.byte	-127
	.byte	-28
	.byte	17
	.byte	93
	.byte	-79
	.byte	3
	.byte	61
	.byte	124
	.byte	1
	.byte	41
	.byte	84
	.byte	1
	.byte	21
	.byte	52
	.byte	-99
	.byte	78
	.byte	-12
	.byte	-116
	.byte	72
	.byte	-25
	.byte	69
	.byte	58
	.byte	-72
	.byte	31
	.byte	44
	.byte	-119
	.byte	14
	.byte	38
	.byte	105
	.byte	8
	.byte	23
	.byte	61
	.type	vp9_default_coef_probs_8x8, %object
	.size	vp9_default_coef_probs_8x8, 432
vp9_default_coef_probs_8x8:
	.byte	125
	.byte	34
	.byte	-69
	.byte	52
	.byte	41
	.byte	-123
	.byte	6
	.byte	31
	.byte	56
	.space	9
	.byte	37
	.byte	109
	.byte	-103
	.byte	51
	.byte	102
	.byte	-109
	.byte	23
	.byte	87
	.byte	-128
	.byte	8
	.byte	67
	.byte	101
	.byte	1
	.byte	41
	.byte	63
	.byte	1
	.byte	19
	.byte	29
	.byte	31
	.byte	-102
	.byte	-71
	.byte	17
	.byte	127
	.byte	-81
	.byte	6
	.byte	96
	.byte	-111
	.byte	2
	.byte	73
	.byte	114
	.byte	1
	.byte	51
	.byte	82
	.byte	1
	.byte	28
	.byte	45
	.byte	23
	.byte	-93
	.byte	-56
	.byte	10
	.byte	-125
	.byte	-71
	.byte	2
	.byte	93
	.byte	-108
	.byte	1
	.byte	67
	.byte	111
	.byte	1
	.byte	41
	.byte	69
	.byte	1
	.byte	14
	.byte	24
	.byte	29
	.byte	-80
	.byte	-39
	.byte	12
	.byte	-111
	.byte	-55
	.byte	3
	.byte	101
	.byte	-100
	.byte	1
	.byte	69
	.byte	111
	.byte	1
	.byte	39
	.byte	63
	.byte	1
	.byte	14
	.byte	23
	.byte	57
	.byte	-64
	.byte	-23
	.byte	25
	.byte	-102
	.byte	-41
	.byte	6
	.byte	109
	.byte	-89
	.byte	3
	.byte	78
	.byte	118
	.byte	1
	.byte	48
	.byte	69
	.byte	1
	.byte	21
	.byte	29
	.byte	-54
	.byte	105
	.byte	-11
	.byte	108
	.byte	106
	.byte	-40
	.byte	18
	.byte	90
	.byte	-112
	.space	9
	.byte	33
	.byte	-84
	.byte	-37
	.byte	64
	.byte	-107
	.byte	-50
	.byte	14
	.byte	117
	.byte	-79
	.byte	5
	.byte	90
	.byte	-115
	.byte	2
	.byte	61
	.byte	95
	.byte	1
	.byte	37
	.byte	57
	.byte	33
	.byte	-77
	.byte	-36
	.byte	11
	.byte	-116
	.byte	-58
	.byte	1
	.byte	89
	.byte	-108
	.byte	1
	.byte	60
	.byte	104
	.byte	1
	.byte	33
	.byte	57
	.byte	1
	.byte	12
	.byte	21
	.byte	30
	.byte	-75
	.byte	-35
	.byte	8
	.byte	-115
	.byte	-58
	.byte	1
	.byte	87
	.byte	-111
	.byte	1
	.byte	58
	.byte	100
	.byte	1
	.byte	31
	.byte	55
	.byte	1
	.byte	12
	.byte	20
	.byte	32
	.byte	-70
	.byte	-32
	.byte	7
	.byte	-114
	.byte	-58
	.byte	1
	.byte	86
	.byte	-113
	.byte	1
	.byte	58
	.byte	100
	.byte	1
	.byte	31
	.byte	55
	.byte	1
	.byte	12
	.byte	22
	.byte	57
	.byte	-64
	.byte	-29
	.byte	20
	.byte	-113
	.byte	-52
	.byte	3
	.byte	96
	.byte	-102
	.byte	1
	.byte	68
	.byte	112
	.byte	1
	.byte	42
	.byte	69
	.byte	1
	.byte	19
	.byte	32
	.byte	-44
	.byte	35
	.byte	-41
	.byte	113
	.byte	47
	.byte	-87
	.byte	29
	.byte	48
	.byte	105
	.space	9
	.byte	74
	.byte	-127
	.byte	-53
	.byte	106
	.byte	120
	.byte	-53
	.byte	49
	.byte	107
	.byte	-78
	.byte	19
	.byte	84
	.byte	-112
	.byte	4
	.byte	50
	.byte	84
	.byte	1
	.byte	15
	.byte	25
	.byte	71
	.byte	-84
	.byte	-39
	.byte	44
	.byte	-115
	.byte	-47
	.byte	15
	.byte	102
	.byte	-83
	.byte	6
	.byte	76
	.byte	-123
	.byte	2
	.byte	51
	.byte	89
	.byte	1
	.byte	24
	.byte	42
	.byte	64
	.byte	-71
	.byte	-25
	.byte	31
	.byte	-108
	.byte	-40
	.byte	8
	.byte	103
	.byte	-81
	.byte	3
	.byte	74
	.byte	-125
	.byte	1
	.byte	46
	.byte	81
	.byte	1
	.byte	18
	.byte	30
	.byte	65
	.byte	-60
	.byte	-21
	.byte	25
	.byte	-99
	.byte	-35
	.byte	5
	.byte	105
	.byte	-82
	.byte	1
	.byte	67
	.byte	120
	.byte	1
	.byte	38
	.byte	69
	.byte	1
	.byte	15
	.byte	30
	.byte	65
	.byte	-52
	.byte	-18
	.byte	30
	.byte	-100
	.byte	-32
	.byte	7
	.byte	107
	.byte	-79
	.byte	2
	.byte	70
	.byte	124
	.byte	1
	.byte	42
	.byte	73
	.byte	1
	.byte	18
	.byte	34
	.byte	-31
	.byte	86
	.byte	-5
	.byte	-112
	.byte	104
	.byte	-21
	.byte	42
	.byte	99
	.byte	-75
	.space	9
	.byte	85
	.byte	-81
	.byte	-17
	.byte	112
	.byte	-91
	.byte	-27
	.byte	29
	.byte	-120
	.byte	-56
	.byte	12
	.byte	103
	.byte	-94
	.byte	6
	.byte	77
	.byte	123
	.byte	2
	.byte	53
	.byte	84
	.byte	75
	.byte	-73
	.byte	-17
	.byte	30
	.byte	-101
	.byte	-35
	.byte	3
	.byte	106
	.byte	-85
	.byte	1
	.byte	74
	.byte	-128
	.byte	1
	.byte	44
	.byte	76
	.byte	1
	.byte	17
	.byte	28
	.byte	73
	.byte	-71
	.byte	-16
	.byte	27
	.byte	-97
	.byte	-34
	.byte	2
	.byte	107
	.byte	-84
	.byte	1
	.byte	75
	.byte	127
	.byte	1
	.byte	42
	.byte	73
	.byte	1
	.byte	17
	.byte	29
	.byte	62
	.byte	-66
	.byte	-18
	.byte	21
	.byte	-97
	.byte	-34
	.byte	2
	.byte	107
	.byte	-84
	.byte	1
	.byte	72
	.byte	122
	.byte	1
	.byte	40
	.byte	71
	.byte	1
	.byte	18
	.byte	32
	.byte	61
	.byte	-57
	.byte	-16
	.byte	27
	.byte	-95
	.byte	-30
	.byte	4
	.byte	113
	.byte	-76
	.byte	1
	.byte	76
	.byte	-127
	.byte	1
	.byte	46
	.byte	80
	.byte	1
	.byte	23
	.byte	41
	.type	vp9_default_coef_probs_16x16, %object
	.size	vp9_default_coef_probs_16x16, 432
vp9_default_coef_probs_16x16:
	.byte	7
	.byte	27
	.byte	-103
	.byte	5
	.byte	30
	.byte	95
	.byte	1
	.byte	16
	.byte	30
	.space	9
	.byte	50
	.byte	75
	.byte	127
	.byte	57
	.byte	75
	.byte	124
	.byte	27
	.byte	67
	.byte	108
	.byte	10
	.byte	54
	.byte	86
	.byte	1
	.byte	33
	.byte	52
	.byte	1
	.byte	12
	.byte	18
	.byte	43
	.byte	125
	.byte	-105
	.byte	26
	.byte	108
	.byte	-108
	.byte	7
	.byte	83
	.byte	122
	.byte	2
	.byte	59
	.byte	89
	.byte	1
	.byte	38
	.byte	60
	.byte	1
	.byte	17
	.byte	27
	.byte	23
	.byte	-112
	.byte	-93
	.byte	13
	.byte	112
	.byte	-102
	.byte	2
	.byte	75
	.byte	117
	.byte	1
	.byte	50
	.byte	81
	.byte	1
	.byte	31
	.byte	51
	.byte	1
	.byte	14
	.byte	23
	.byte	18
	.byte	-94
	.byte	-71
	.byte	6
	.byte	123
	.byte	-85
	.byte	1
	.byte	78
	.byte	125
	.byte	1
	.byte	51
	.byte	86
	.byte	1
	.byte	31
	.byte	54
	.byte	1
	.byte	14
	.byte	23
	.byte	15
	.byte	-57
	.byte	-29
	.byte	3
	.byte	-106
	.byte	-52
	.byte	1
	.byte	91
	.byte	-110
	.byte	1
	.byte	55
	.byte	95
	.byte	1
	.byte	30
	.byte	53
	.byte	1
	.byte	11
	.byte	20
	.byte	19
	.byte	55
	.byte	-16
	.byte	19
	.byte	59
	.byte	-60
	.byte	3
	.byte	52
	.byte	105
	.space	9
	.byte	41
	.byte	-90
	.byte	-49
	.byte	104
	.byte	-103
	.byte	-57
	.byte	31
	.byte	123
	.byte	-75
	.byte	14
	.byte	101
	.byte	-104
	.byte	5
	.byte	72
	.byte	106
	.byte	1
	.byte	36
	.byte	52
	.byte	35
	.byte	-80
	.byte	-45
	.byte	12
	.byte	-125
	.byte	-66
	.byte	2
	.byte	88
	.byte	-112
	.byte	1
	.byte	60
	.byte	101
	.byte	1
	.byte	36
	.byte	60
	.byte	1
	.byte	16
	.byte	28
	.byte	28
	.byte	-73
	.byte	-43
	.byte	8
	.byte	-122
	.byte	-65
	.byte	1
	.byte	86
	.byte	-114
	.byte	1
	.byte	56
	.byte	96
	.byte	1
	.byte	30
	.byte	53
	.byte	1
	.byte	12
	.byte	20
	.byte	20
	.byte	-66
	.byte	-41
	.byte	4
	.byte	-121
	.byte	-64
	.byte	1
	.byte	84
	.byte	-117
	.byte	1
	.byte	53
	.byte	91
	.byte	1
	.byte	28
	.byte	49
	.byte	1
	.byte	11
	.byte	20
	.byte	13
	.byte	-60
	.byte	-40
	.byte	2
	.byte	-119
	.byte	-64
	.byte	1
	.byte	86
	.byte	-113
	.byte	1
	.byte	57
	.byte	99
	.byte	1
	.byte	32
	.byte	56
	.byte	1
	.byte	13
	.byte	24
	.byte	-45
	.byte	29
	.byte	-39
	.byte	96
	.byte	47
	.byte	-100
	.byte	22
	.byte	43
	.byte	87
	.space	9
	.byte	78
	.byte	120
	.byte	-63
	.byte	111
	.byte	116
	.byte	-70
	.byte	46
	.byte	102
	.byte	-92
	.byte	15
	.byte	80
	.byte	-128
	.byte	2
	.byte	49
	.byte	76
	.byte	1
	.byte	18
	.byte	28
	.byte	71
	.byte	-95
	.byte	-53
	.byte	42
	.byte	-124
	.byte	-64
	.byte	10
	.byte	98
	.byte	-106
	.byte	3
	.byte	69
	.byte	109
	.byte	1
	.byte	44
	.byte	70
	.byte	1
	.byte	18
	.byte	29
	.byte	57
	.byte	-70
	.byte	-45
	.byte	30
	.byte	-116
	.byte	-60
	.byte	4
	.byte	93
	.byte	-110
	.byte	1
	.byte	62
	.byte	102
	.byte	1
	.byte	38
	.byte	65
	.byte	1
	.byte	16
	.byte	27
	.byte	47
	.byte	-57
	.byte	-39
	.byte	14
	.byte	-111
	.byte	-60
	.byte	1
	.byte	88
	.byte	-114
	.byte	1
	.byte	57
	.byte	98
	.byte	1
	.byte	36
	.byte	62
	.byte	1
	.byte	15
	.byte	26
	.byte	26
	.byte	-37
	.byte	-27
	.byte	5
	.byte	-101
	.byte	-49
	.byte	1
	.byte	94
	.byte	-105
	.byte	1
	.byte	60
	.byte	104
	.byte	1
	.byte	36
	.byte	62
	.byte	1
	.byte	16
	.byte	28
	.byte	-23
	.byte	29
	.byte	-8
	.byte	-110
	.byte	47
	.byte	-36
	.byte	43
	.byte	52
	.byte	-116
	.space	9
	.byte	100
	.byte	-93
	.byte	-24
	.byte	-77
	.byte	-95
	.byte	-34
	.byte	63
	.byte	-114
	.byte	-52
	.byte	37
	.byte	113
	.byte	-82
	.byte	26
	.byte	89
	.byte	-119
	.byte	18
	.byte	68
	.byte	97
	.byte	85
	.byte	-75
	.byte	-26
	.byte	32
	.byte	-110
	.byte	-47
	.byte	7
	.byte	100
	.byte	-92
	.byte	3
	.byte	71
	.byte	121
	.byte	1
	.byte	45
	.byte	77
	.byte	1
	.byte	18
	.byte	30
	.byte	65
	.byte	-69
	.byte	-26
	.byte	20
	.byte	-108
	.byte	-49
	.byte	2
	.byte	97
	.byte	-97
	.byte	1
	.byte	68
	.byte	116
	.byte	1
	.byte	40
	.byte	70
	.byte	1
	.byte	14
	.byte	29
	.byte	40
	.byte	-62
	.byte	-29
	.byte	8
	.byte	-109
	.byte	-52
	.byte	1
	.byte	94
	.byte	-101
	.byte	1
	.byte	65
	.byte	112
	.byte	1
	.byte	39
	.byte	66
	.byte	1
	.byte	14
	.byte	26
	.byte	16
	.byte	-48
	.byte	-28
	.byte	3
	.byte	-105
	.byte	-49
	.byte	1
	.byte	98
	.byte	-96
	.byte	1
	.byte	67
	.byte	117
	.byte	1
	.byte	41
	.byte	74
	.byte	1
	.byte	17
	.byte	31
	.type	vp9_default_coef_probs_32x32, %object
	.size	vp9_default_coef_probs_32x32, 432
vp9_default_coef_probs_32x32:
	.byte	17
	.byte	38
	.byte	-116
	.byte	7
	.byte	34
	.byte	80
	.byte	1
	.byte	17
	.byte	29
	.space	9
	.byte	37
	.byte	75
	.byte	-128
	.byte	41
	.byte	76
	.byte	-128
	.byte	26
	.byte	66
	.byte	116
	.byte	12
	.byte	52
	.byte	94
	.byte	2
	.byte	32
	.byte	55
	.byte	1
	.byte	10
	.byte	16
	.byte	50
	.byte	127
	.byte	-102
	.byte	37
	.byte	109
	.byte	-104
	.byte	16
	.byte	82
	.byte	121
	.byte	5
	.byte	59
	.byte	85
	.byte	1
	.byte	35
	.byte	54
	.byte	1
	.byte	13
	.byte	20
	.byte	40
	.byte	-114
	.byte	-89
	.byte	17
	.byte	110
	.byte	-99
	.byte	2
	.byte	71
	.byte	112
	.byte	1
	.byte	44
	.byte	72
	.byte	1
	.byte	27
	.byte	45
	.byte	1
	.byte	11
	.byte	17
	.byte	30
	.byte	-81
	.byte	-68
	.byte	9
	.byte	124
	.byte	-87
	.byte	1
	.byte	74
	.byte	116
	.byte	1
	.byte	48
	.byte	78
	.byte	1
	.byte	30
	.byte	49
	.byte	1
	.byte	11
	.byte	18
	.byte	10
	.byte	-34
	.byte	-33
	.byte	2
	.byte	-106
	.byte	-62
	.byte	1
	.byte	83
	.byte	-128
	.byte	1
	.byte	48
	.byte	79
	.byte	1
	.byte	27
	.byte	45
	.byte	1
	.byte	11
	.byte	17
	.byte	36
	.byte	41
	.byte	-21
	.byte	29
	.byte	36
	.byte	-63
	.byte	10
	.byte	27
	.byte	111
	.space	9
	.byte	85
	.byte	-91
	.byte	-34
	.byte	-79
	.byte	-94
	.byte	-41
	.byte	110
	.byte	-121
	.byte	-61
	.byte	57
	.byte	113
	.byte	-88
	.byte	23
	.byte	83
	.byte	120
	.byte	10
	.byte	49
	.byte	61
	.byte	85
	.byte	-66
	.byte	-33
	.byte	36
	.byte	-117
	.byte	-56
	.byte	5
	.byte	90
	.byte	-110
	.byte	1
	.byte	60
	.byte	103
	.byte	1
	.byte	38
	.byte	65
	.byte	1
	.byte	18
	.byte	30
	.byte	72
	.byte	-54
	.byte	-33
	.byte	23
	.byte	-115
	.byte	-57
	.byte	2
	.byte	86
	.byte	-116
	.byte	1
	.byte	56
	.byte	97
	.byte	1
	.byte	36
	.byte	61
	.byte	1
	.byte	16
	.byte	27
	.byte	55
	.byte	-38
	.byte	-31
	.byte	13
	.byte	-111
	.byte	-56
	.byte	1
	.byte	86
	.byte	-115
	.byte	1
	.byte	57
	.byte	99
	.byte	1
	.byte	35
	.byte	61
	.byte	1
	.byte	13
	.byte	22
	.byte	15
	.byte	-21
	.byte	-44
	.byte	1
	.byte	-124
	.byte	-72
	.byte	1
	.byte	84
	.byte	-117
	.byte	1
	.byte	57
	.byte	97
	.byte	1
	.byte	34
	.byte	56
	.byte	1
	.byte	14
	.byte	23
	.byte	-75
	.byte	21
	.byte	-55
	.byte	61
	.byte	37
	.byte	123
	.byte	10
	.byte	38
	.byte	71
	.space	9
	.byte	47
	.byte	106
	.byte	-84
	.byte	95
	.byte	104
	.byte	-83
	.byte	42
	.byte	93
	.byte	-97
	.byte	18
	.byte	77
	.byte	-125
	.byte	4
	.byte	50
	.byte	81
	.byte	1
	.byte	17
	.byte	23
	.byte	62
	.byte	-109
	.byte	-57
	.byte	44
	.byte	-126
	.byte	-67
	.byte	28
	.byte	102
	.byte	-102
	.byte	18
	.byte	75
	.byte	115
	.byte	2
	.byte	44
	.byte	65
	.byte	1
	.byte	12
	.byte	19
	.byte	55
	.byte	-103
	.byte	-46
	.byte	24
	.byte	-126
	.byte	-62
	.byte	3
	.byte	93
	.byte	-110
	.byte	1
	.byte	61
	.byte	97
	.byte	1
	.byte	31
	.byte	50
	.byte	1
	.byte	10
	.byte	16
	.byte	49
	.byte	-70
	.byte	-33
	.byte	17
	.byte	-108
	.byte	-52
	.byte	1
	.byte	96
	.byte	-114
	.byte	1
	.byte	53
	.byte	83
	.byte	1
	.byte	26
	.byte	44
	.byte	1
	.byte	11
	.byte	17
	.byte	13
	.byte	-39
	.byte	-44
	.byte	2
	.byte	-120
	.byte	-76
	.byte	1
	.byte	78
	.byte	124
	.byte	1
	.byte	50
	.byte	83
	.byte	1
	.byte	29
	.byte	49
	.byte	1
	.byte	14
	.byte	23
	.byte	-59
	.byte	13
	.byte	-9
	.byte	82
	.byte	17
	.byte	-34
	.byte	25
	.byte	17
	.byte	-94
	.space	9
	.byte	126
	.byte	-70
	.byte	-9
	.byte	-22
	.byte	-65
	.byte	-13
	.byte	-80
	.byte	-79
	.byte	-22
	.byte	104
	.byte	-98
	.byte	-36
	.byte	66
	.byte	-128
	.byte	-70
	.byte	55
	.byte	90
	.byte	-119
	.byte	111
	.byte	-59
	.byte	-14
	.byte	46
	.byte	-98
	.byte	-37
	.byte	9
	.byte	104
	.byte	-85
	.byte	2
	.byte	65
	.byte	125
	.byte	1
	.byte	44
	.byte	80
	.byte	1
	.byte	17
	.byte	91
	.byte	104
	.byte	-48
	.byte	-11
	.byte	39
	.byte	-88
	.byte	-32
	.byte	3
	.byte	109
	.byte	-94
	.byte	1
	.byte	79
	.byte	124
	.byte	1
	.byte	50
	.byte	102
	.byte	1
	.byte	43
	.byte	102
	.byte	84
	.byte	-36
	.byte	-10
	.byte	31
	.byte	-79
	.byte	-25
	.byte	2
	.byte	115
	.byte	-76
	.byte	1
	.byte	79
	.byte	-122
	.byte	1
	.byte	55
	.byte	77
	.byte	1
	.byte	60
	.byte	79
	.byte	43
	.byte	-13
	.byte	-16
	.byte	8
	.byte	-76
	.byte	-39
	.byte	1
	.byte	115
	.byte	-90
	.byte	1
	.byte	84
	.byte	121
	.byte	1
	.byte	51
	.byte	67
	.byte	1
	.byte	16
	.byte	6
	.type	vp9_default_if_uv_probs, %object
	.size	vp9_default_if_uv_probs, 90
vp9_default_if_uv_probs:
	.byte	120
	.byte	7
	.byte	76
	.byte	-80
	.byte	-48
	.byte	126
	.byte	28
	.byte	54
	.byte	103
	.byte	48
	.byte	12
	.byte	-102
	.byte	-101
	.byte	-117
	.byte	90
	.byte	34
	.byte	117
	.byte	119
	.byte	67
	.byte	6
	.byte	25
	.byte	-52
	.byte	-13
	.byte	-98
	.byte	13
	.byte	21
	.byte	96
	.byte	97
	.byte	5
	.byte	44
	.byte	-125
	.byte	-80
	.byte	-117
	.byte	48
	.byte	68
	.byte	97
	.byte	83
	.byte	5
	.byte	42
	.byte	-100
	.byte	111
	.byte	-104
	.byte	26
	.byte	49
	.byte	-104
	.byte	80
	.byte	5
	.byte	58
	.byte	-78
	.byte	74
	.byte	83
	.byte	33
	.byte	62
	.byte	-111
	.byte	86
	.byte	5
	.byte	32
	.byte	-102
	.byte	-64
	.byte	-88
	.byte	14
	.byte	22
	.byte	-93
	.byte	85
	.byte	5
	.byte	32
	.byte	-100
	.byte	-40
	.byte	-108
	.byte	19
	.byte	29
	.byte	73
	.byte	77
	.byte	7
	.byte	64
	.byte	116
	.byte	-124
	.byte	122
	.byte	37
	.byte	126
	.byte	120
	.byte	101
	.byte	21
	.byte	107
	.byte	-75
	.byte	-64
	.byte	103
	.byte	19
	.byte	67
	.byte	125
	.space	2
	.type	vp9_default_if_y_probs, %object
	.size	vp9_default_if_y_probs, 36
vp9_default_if_y_probs:
	.byte	65
	.byte	32
	.byte	18
	.byte	-112
	.byte	-94
	.byte	-62
	.byte	41
	.byte	51
	.byte	98
	.byte	-124
	.byte	68
	.byte	18
	.byte	-91
	.byte	-39
	.byte	-60
	.byte	45
	.byte	40
	.byte	78
	.byte	-83
	.byte	80
	.byte	19
	.byte	-80
	.byte	-16
	.byte	-63
	.byte	64
	.byte	35
	.byte	46
	.byte	-35
	.byte	-121
	.byte	38
	.byte	-62
	.byte	-8
	.byte	121
	.byte	96
	.byte	85
	.byte	29
	.type	vp9_default_switchable_interp_prob, %object
	.size	vp9_default_switchable_interp_prob, 8
vp9_default_switchable_interp_prob:
	.byte	-21
	.byte	-94
	.byte	36
	.byte	-1
	.byte	34
	.byte	3
	.byte	-107
	.byte	-112
	.type	vp9_default_partition_probs, %object
	.size	vp9_default_partition_probs, 96
vp9_default_partition_probs:
	.byte	-98
	.byte	97
	.byte	94
	.byte	93
	.byte	24
	.byte	99
	.byte	85
	.byte	119
	.byte	44
	.byte	62
	.byte	59
	.byte	67
	.byte	-107
	.byte	53
	.byte	53
	.byte	94
	.byte	20
	.byte	48
	.byte	83
	.byte	53
	.byte	24
	.byte	52
	.byte	18
	.byte	18
	.byte	-106
	.byte	40
	.byte	39
	.byte	78
	.byte	12
	.byte	26
	.byte	67
	.byte	33
	.byte	11
	.byte	24
	.byte	7
	.byte	5
	.byte	-82
	.byte	35
	.byte	49
	.byte	68
	.byte	11
	.byte	27
	.byte	57
	.byte	15
	.byte	9
	.byte	12
	.byte	3
	.byte	3
	.byte	-57
	.byte	122
	.byte	-115
	.byte	-109
	.byte	63
	.byte	-97
	.byte	-108
	.byte	-123
	.byte	118
	.byte	121
	.byte	104
	.byte	114
	.byte	-82
	.byte	73
	.byte	87
	.byte	92
	.byte	41
	.byte	83
	.byte	82
	.byte	99
	.byte	50
	.byte	53
	.byte	39
	.byte	39
	.byte	-79
	.byte	58
	.byte	59
	.byte	68
	.byte	26
	.byte	63
	.byte	52
	.byte	79
	.byte	25
	.byte	17
	.byte	14
	.byte	12
	.byte	-34
	.byte	34
	.byte	30
	.byte	72
	.byte	16
	.byte	44
	.byte	58
	.byte	32
	.byte	12
	.byte	10
	.byte	7
	.byte	6
	.type	vp9_default_intra_inter_p, %object
	.size	vp9_default_intra_inter_p, 4
vp9_default_intra_inter_p:
	.byte	9
	.byte	102
	.byte	-69
	.byte	-31
	.type	vp9_default_comp_inter_p, %object
	.size	vp9_default_comp_inter_p, 5
vp9_default_comp_inter_p:
	.byte	-17
	.byte	-73
	.byte	119
	.byte	96
	.byte	41
	.space	3
	.type	vp9_default_comp_ref_p, %object
	.size	vp9_default_comp_ref_p, 5
vp9_default_comp_ref_p:
	.byte	50
	.byte	126
	.byte	123
	.byte	-35
	.byte	-30
	.space	3
	.type	vp9_default_single_ref_p, %object
	.size	vp9_default_single_ref_p, 10
vp9_default_single_ref_p:
	.byte	33
	.byte	16
	.byte	77
	.byte	74
	.byte	-114
	.byte	-114
	.byte	-84
	.byte	-86
	.byte	-18
	.byte	-9
	.space	2
	.type	vp9_default_mbskip_probs, %object
	.size	vp9_default_mbskip_probs, 3
vp9_default_mbskip_probs:
	.byte	-64
	.byte	-128
	.byte	64
	.space	1
	.type	vp9_default_inter_mode_probs, %object
	.size	vp9_default_inter_mode_probs, 21
vp9_default_inter_mode_probs:
	.byte	2
	.byte	-83
	.byte	34
	.byte	7
	.byte	-111
	.byte	85
	.byte	7
	.byte	-90
	.byte	63
	.byte	7
	.byte	94
	.byte	66
	.byte	8
	.byte	64
	.byte	46
	.byte	17
	.byte	81
	.byte	31
	.byte	25
	.byte	29
	.byte	30
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC3:
	ASCII(.ascii	"IN VP9DEC_Init\012\000" )
.LC4:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC5:
	ASCII(.ascii	"data_sz == 0\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"line: %d, fs is NULL!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"%s  idx=%d\012\000" )
.LC12:
	ASCII(.ascii	"FSP_GetLogicFs err\000" )
	.space	1
.LC13:
	ASCII(.ascii	"fsp.c,L%d: %s\012\000" )
	.space	1
.LC14:
	ASCII(.ascii	"Invalid frame sync code\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"ref_deltas\000" )
	.space	1
.LC16:
	ASCII(.ascii	"mode_deltas\000" )
.LC17:
	ASCII(.ascii	"delta_q\000" )
.LC18:
	ASCII(.ascii	"%s  %d ERR\012\000" )
.LC19:
	ASCII(.ascii	"%s:%d this_size:%d is invalid!\012\000" )
.LC20:
	ASCII(.ascii	"4:4:4 color is not supported in profile 0 or 2 (%s " )
	ASCII(.ascii	": %d)\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"Invalid frame marker\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"%s:%d w&h=%dx%d is invalid!\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"VP9_Set_DecParam but logic fs is null!\012\000" )
.LC24:
	ASCII(.ascii	"Decord FS is NULL!\012\000" )
.LC25:
	ASCII(.ascii	"VP9_Set_DecParam but cur logic pstDecodeFs is null!" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC27:
	ASCII(.ascii	"pic_width_in_pix:%d, pic_height_in_pix:%d\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"vp9 actual frame size(%dx%d) exeed max config(%dx%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"vp9 alloc frame only\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"%s:%d size is invalid  size:%d bslen:%d\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"ERROR:Vp9_ReadCompressedHeader\012\000" )
.LC34:
	ASCII(.ascii	"pCurImg is null\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"err_level(%d) over ref_thr(%d)\012\000" )
.LC36:
	ASCII(.ascii	"line: %d pToQueImg is null\012\000" )
.LC37:
	ASCII(.ascii	"insert img to Voqueue failed!\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"pu8ProbCntVir == NULL\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"get_free_fb failed!\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"bit_depth(%d) > 10.\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"ERROR: pCtx->StreamParam.Length(%d) < 8\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"%dx%d, all=%d,cur=%d,ref=%d,ned=%d\012\000" )
.LC43:
	ASCII(.ascii	"ERROR: No Img buffer is allocated\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"%s %d, no fsp\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"VP9_GetImageBuffer From Queue err\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"ERROR: VP9_Set_DecParam\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"VP9_DecOneNal ERR\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
