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
	.file	"hevc.c"
	.text
	.align	2
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	blt	.L3
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L3:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.align	2
	.type	HEVC_SetFrmRepeatCount.part.5, %function
HEVC_SetFrmRepeatCount.part.5:
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
	ldr	ip, [r0, #308]
	ldr	r2, [r0, #2536]
	ldr	r3, [r0, #304]
	add	r2, r2, ip
	add	ip, r2, #1
	cmp	r3, ip
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movhi	r3, #2
	movls	r3, #1
	strhi	r3, [r1, #24]
	strls	r3, [r1, #24]
	ldrhi	r3, [r0, #308]
	ldrls	r3, [r0, #308]
	addhi	r3, r3, #2
	addls	r3, r3, #1
	str	r3, [r0, #308]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount.part.5, .-HEVC_SetFrmRepeatCount.part.5
	.global	__aeabi_uidiv
	.align	2
	.global	HEVC_InitSigLastScan
	.type	HEVC_InitSigLastScan, %function
HEVC_InitSigLastScan:
	UNWIND(.fnstart)
	@ args = 16, pretend = 0, frame = 24
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
	ldr	r4, [fp, #8]
	str	r0, [fp, #-48]
	cmp	r4, #15
	ldr	r6, [fp, #4]
	bgt	.L10
	cmp	r4, #8
	mul	r9, r4, r4
	beq	.L43
	cmp	r9, #0
	movne	r10, r6
	beq	.L10
.L12:
	mov	r5, #0
	rsb	r7, r4, #1
	mov	r8, r5
.L18:
	cmp	r4, r8
	bgt	.L30
	rsb	lr, r4, r8
	sub	r2, r4, #1
	add	lr, lr, #1
.L19:
	cmp	r2, #0
	cmpge	r4, lr
	ble	.L16
	mla	r0, r2, r4, lr
	add	ip, r10, r5, lsl #2
	mov	r1, r5
.L17:
	add	r1, r1, #1
	sub	r2, r2, #1
	rsb	r3, r5, r1
	str	r0, [ip], #4
	add	r3, r3, lr
	add	r0, r0, r7
	cmp	r2, #0
	cmpge	r4, r3
	bgt	.L17
	mov	r5, r1
.L16:
	cmp	r9, r5
	add	r8, r8, #1
	bhi	.L18
.L10:
	cmp	r4, #4
	ble	.L9
	mov	r3, r4, asr #2
	ldr	r1, [fp, #-48]
	str	r3, [fp, #-64]
	mov	r2, r3
	add	r3, r1, r3
	mul	r2, r2, r2
	mov	r0, r2
	str	r2, [fp, #-60]
	cmp	r0, #0
	ldrsb	r2, [r3, #10]
	add	r2, r2, #1
	beq	.L9
	add	r3, r1, #356
.L14:
	ldr	r1, .L44
	rsb	r7, r4, #1
	str	r3, [fp, #-52]
	mov	r3, #0
	add	r2, r1, r2, lsl #16
	str	r3, [fp, #-48]
	sub	r3, r2, #4
	str	r3, [fp, #-56]
.L28:
	ldr	r3, [fp, #-56]
	cmp	r4, #32
	ldr	r9, [fp, #-64]
	mov	r8, #0
	ldr	r5, [r3, #4]!
	mov	r1, r9
	str	r3, [fp, #-56]
	ldreq	r3, [fp, #-52]
	ldreq	r5, [r3]
	mov	r0, r5
	bl	__aeabi_uidiv
	ldr	ip, [fp, #-48]
	mov	r3, r8
	mov	r2, r8
	mov	lr, r8
	mov	r10, ip, asl #4
	mla	r1, r4, r0, r5
	mls	r1, r9, r0, r1
	mov	r9, r1, asl #2
.L22:
	cmp	lr, #3
	mvn	r1, r2
	mov	r1, r1, lsr #31
	movgt	r1, #0
	cmp	r1, #0
	beq	.L23
	mla	r1, r2, r4, lr
	add	r0, r3, r10
	rsb	lr, r3, lr
	add	r0, r6, r0, lsl #2
	add	r1, r1, r9
.L24:
	add	r3, r3, #1
	sub	r2, r2, #1
	add	r5, lr, r3
	str	r1, [r0], #4
	cmp	r5, #3
	mvn	ip, r2
	mov	ip, ip, lsr #31
	add	r1, r1, r7
	movgt	ip, #0
	cmp	ip, #0
	bne	.L24
.L23:
	cmp	r3, #15
	add	r8, r8, #1
	bhi	.L25
	cmp	r8, #3
	movle	r2, r8
	movle	lr, #0
	subgt	lr, r8, #3
	movgt	r2, #3
	b	.L22
.L25:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	add	r2, r2, #4
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	cmp	r3, r2
	bne	.L28
.L9:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L30:
	mov	r2, r8
	mov	lr, #0
	b	.L19
.L43:
	add	r3, r0, #356
	cmp	r9, #0
	mov	r10, r3
	bne	.L12
	ldr	r2, [fp, #-48]
	mov	r1, #2
	str	r1, [fp, #-64]
	mov	r1, #4
	str	r1, [fp, #-60]
	ldrsb	r2, [r2, #12]
	add	r2, r2, #1
	b	.L14
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	HEVC_InitSigLastScan, .-HEVC_InitSigLastScan
	.align	2
	.global	HEVC_InitScalingOrderTable
	.type	HEVC_InitScalingOrderTable, %function
HEVC_InitScalingOrderTable:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	add	r3, r0, #9
	add	r1, r0, #138
	mov	r7, r0
	mvn	r2, #0
.L47:
	strb	r2, [r3, #1]!
	cmp	r3, r1
	bne	.L47
	ldr	r6, .L51
	mov	r2, #0
	mov	r3, #2
	mov	r5, r2
	mov	r4, r3
	strb	r2, [r7, #14]
	strb	r3, [r7, #26]
	mov	r2, #1
	mov	r3, #3
	strb	r2, [r7, #18]
	strb	r3, [r7, #42]
	mov	r3, #4
	strb	r3, [r7, #74]
.L48:
	mov	r3, #0
	str	r5, [sp, #12]
	str	r4, [sp, #8]
	add	r5, r5, #1
	str	r4, [sp, #4]
	mov	r2, r3
	str	r6, [sp]
	mov	r1, r3
	mov	r0, r7
	mov	r4, r4, asl #1
	bl	HEVC_InitSigLastScan
	cmp	r5, #7
	add	r6, r6, #65536
	bne	.L48
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	HEVC_InitScalingOrderTable, .-HEVC_InitScalingOrderTable
	.global	__aeabi_idiv
	.align	2
	.global	HEVCGetDar
	.type	HEVCGetDar, %function
HEVCGetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	cmp	r0, #0
	mov	ip, r1
	moveq	r4, r0
	beq	.L54
	subs	lr, r0, #255
	movne	lr, #1
	cmp	r0, #16
	movle	r4, #0
	andgt	r4, lr, #1
	cmp	r4, #0
	movne	r4, #0
	bne	.L54
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #255
	movne	r1, #0
	andeq	r1, r1, #1
	cmp	r1, #0
	bne	.L54
	cmp	r0, #1
	moveq	r4, #5
	beq	.L54
	cmp	lr, #0
	str	r3, [fp, #-24]
	ldrne	r2, .L76
	addne	r1, r2, r0, lsl #3
	ldrne	ip, [r2, r0, asl #3]
	ldrne	r2, [r1, #4]
	mov	r0, ip, asl #10
	mov	r1, r2
	bl	__aeabi_idiv
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r3, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r2, #2262
	mul	r0, r0, r4
	add	r4, r0, #1020
	cmp	r0, #0
	add	r4, r4, #3
	movlt	r0, r4
	mov	r0, r0, asr #10
	cmp	r0, r3
	rsble	r3, r0, #2400
	subgt	r3, r0, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r0, r2
	bgt	.L58
	rsb	r2, r0, #2256
	add	r2, r2, #7
	cmp	r3, r2
	bge	.L59
.L69:
	mov	r4, #4
.L54:
	mov	r2, r4
	ldr	r1, .L76+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L58:
	sub	r2, r0, #2256
	sub	r2, r2, #7
	cmp	r3, r2
	blt	.L69
.L59:
	movw	r3, #1819
	cmp	r0, r3
	bgt	.L60
	rsb	r3, r0, #1808
	add	r3, r3, #12
	cmp	r2, r3
	blt	.L71
.L61:
	movw	r2, #1364
	cmp	r0, r2
	rsble	r0, r0, #1360
	subgt	r0, r0, #1360
	addle	r0, r0, #5
	subgt	r0, r0, #5
	cmp	r3, r0
	movlt	r4, #2
	movge	r4, #1
	b	.L54
.L60:
	sub	r3, r0, #1808
	sub	r3, r3, #12
	cmp	r2, r3
	bge	.L61
.L71:
	mov	r4, #3
	b	.L54
.L77:
	.align	2
.L76:
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCGetDar, .-HEVCGetDar
	.align	2
	.global	HEVC_PrintNaluArraySlot
	.type	HEVC_PrintNaluArraySlot, %function
HEVC_PrintNaluArraySlot:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r1, .L84
	mov	r5, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #160]
	cmn	r3, #1
	beq	.L82
	mov	r8, #0
	movw	r6, #52429
	add	r7, r5, #65536
	mov	r4, r8
	movt	r6, 52428
	b	.L81
.L80:
	ldr	r3, [r5, #160]
	add	r3, r3, #1
	cmp	r3, r4
	bls	.L82
.L81:
	ldr	r3, [r7, #2876]
	mov	r2, r4
	ldr	r1, .L84+4
	mov	r0, #1
	add	r3, r3, r8
	add	r8, r8, #100
	ldr	ip, [r3, #36]
	str	ip, [sp]
	bl	dprint_vfmw
	umull	r2, r3, r4, r6
	mov	r2, r3, lsr #3
	mov	r3, r2, asl #3
	add	r3, r3, r2, lsl #1
	cmp	r4, r3
	add	r4, r4, #1
	bne	.L80
	ldr	r1, .L84+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #160]
	add	r3, r3, #1
	cmp	r3, r4
	bhi	.L81
.L82:
	ldr	r1, .L84+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, .L84+12
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L85:
	.align	2
.L84:
	.word	.LC3
	.word	.LC6
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	HEVC_PrintNaluArraySlot, .-HEVC_PrintNaluArraySlot
	.align	2
	.global	HEVC_PrintCurrSlicelistX
	.type	HEVC_PrintCurrSlicelistX, %function
HEVC_PrintCurrSlicelistX:
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
	add	r6, r0, #53248
	mov	r7, r0
	ldr	r1, .L107
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #2160]
	ldr	r1, .L107+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2160]
	cmp	r3, #0
	addne	r5, r7, #2352
	movne	r4, #0
	addne	r5, r5, #12
	beq	.L94
.L93:
	ldr	r3, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L107+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
	ldr	r3, [r5]
	add	r4, r4, r0
	ldr	r1, .L107+12
	cmp	r3, #0
	beq	.L91
	ldr	r2, [r3, #36]
	bl	dprint_vfmw
	ldr	r3, [r5]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L91
	ldr	r1, [r3, #32]
	ldr	r0, [r7, #276]
	bl	FSP_GetLogicFs
	ldr	r1, .L107+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L91:
	ldr	r1, .L107+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2160]
	cmp	r3, r4
	bhi	.L93
.L94:
	ldr	r2, [r6, #2164]
	mov	r0, #1
	ldr	r1, .L107+24
	bl	dprint_vfmw
	ldr	r3, [r6, #2164]
	cmp	r3, #0
	addne	r5, r7, #2432
	movne	r4, #0
	beq	.L89
.L98:
	ldr	r3, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L107+28
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
	ldr	r3, [r5]
	add	r4, r4, r0
	ldr	r1, .L107+12
	cmp	r3, #0
	beq	.L96
	ldr	r2, [r3, #36]
	bl	dprint_vfmw
	ldr	r3, [r5]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L96
	ldr	r1, [r3, #32]
	ldr	r0, [r7, #276]
	bl	FSP_GetLogicFs
	ldr	r1, .L107+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L96:
	ldr	r1, .L107+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2164]
	cmp	r3, r4
	bhi	.L98
.L89:
	ldr	r1, .L107+32
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L108:
	.align	2
.L107:
	.word	.LC7
	.word	.LC8
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC4
	.word	.LC9
	.word	.LC14
	.word	.LC13
	UNWIND(.fnend)
	.size	HEVC_PrintCurrSlicelistX, .-HEVC_PrintCurrSlicelistX
	.align	2
	.global	HEVC_PrintFrameStoreState
	.type	HEVC_PrintFrameStoreState, %function
HEVC_PrintFrameStoreState:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
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
	ldr	r1, .L116
	mov	r10, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #176]
	cmp	r3, #0
	addne	r8, r10, #68608
	movne	r9, #0
	addne	r8, r8, #616
	beq	.L113
.L112:
	ldrb	ip, [r8, #2]	@ zero_extendqisi2
	mov	r3, r8
	mov	r2, r9
	ldr	r1, .L116+4
	mov	r0, #1
	add	r5, r8, #672
	str	ip, [sp, #8]
	mov	r4, #0
	ldrb	ip, [r8, #1]	@ zero_extendqisi2
	str	ip, [sp, #4]
	ldr	ip, [r8, #4]
	str	ip, [sp]
	bl	dprint_vfmw
.L111:
	ldrd	r6, [r5, #8]!
	mov	r2, r4
	ldr	r1, .L116+8
	add	r4, r4, #1
	mov	r0, #1
	strd	r6, [sp]
	bl	dprint_vfmw
	cmp	r4, #4
	bne	.L111
	ldr	r1, .L116+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #176]
	add	r9, r9, #1
	add	r8, r8, #752
	cmp	r3, r9
	bhi	.L112
.L113:
	ldr	r1, .L116+16
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L117:
	.align	2
.L116:
	.word	.LC15
	.word	.LC17
	.word	.LC18
	.word	.LC4
	.word	.LC16
	UNWIND(.fnend)
	.size	HEVC_PrintFrameStoreState, .-HEVC_PrintFrameStoreState
	.align	2
	.global	HEVC_PrintAPCState
	.type	HEVC_PrintAPCState, %function
HEVC_PrintAPCState:
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
	ldr	r1, .L121
	mov	r5, r0
	mov	r7, r0
	mov	r0, #1
	add	r6, r5, #2896
	bl	dprint_vfmw
	ldr	r3, [r5, #2832]
	ldr	r2, [r7, #2836]!
	mov	r0, #1
	ldr	r1, .L121+4
	add	r5, r5, #2960
	bl	dprint_vfmw
	add	r6, r6, #4
	add	r5, r5, #4
	mov	r4, #0
.L119:
	ldr	lr, [r5, #4]!
	mov	r2, r4
	ldr	ip, [r6, #4]!
	add	r4, r4, #1
	ldr	r3, [r7, #4]!
	mov	r0, #1
	ldr	r1, .L121+8
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	cmp	r4, #16
	bne	.L119
	ldr	r1, .L121+12
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L122:
	.align	2
.L121:
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	UNWIND(.fnend)
	.size	HEVC_PrintAPCState, .-HEVC_PrintAPCState
	.align	2
	.global	HEVC_PrintDPBState
	.type	HEVC_PrintDPBState, %function
HEVC_PrintDPBState:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	r1, .L139
	mov	r9, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r9, #2552]
	ldr	lr, [r9, #2548]
	mov	r0, #1
	ldr	ip, [r9, #2556]
	ldr	r3, [r9, #2540]
	ldr	r2, [r9, #2536]
	stmia	sp, {r1, ip, lr}
	ldr	r1, .L139+4
	bl	dprint_vfmw
	ldr	r3, [r9, #2540]
	cmp	r3, #0
	addne	r4, r9, #2544
	movne	r5, #0
	addne	r4, r4, #12
	beq	.L128
.L127:
	ldr	r3, [r4, #4]!
	ldr	r0, [r9, #276]
	ldr	ip, [r3, #4]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	lr, [r3, #1]	@ zero_extendqisi2
	str	ip, [fp, #-52]
	ldr	ip, [r3, #52]
	ldr	r1, [r3, #32]
	str	r2, [fp, #-48]
	str	lr, [fp, #-56]
	str	ip, [fp, #-60]
	ldrb	r8, [r3, #2]	@ zero_extendqisi2
	ldr	r10, [r3, #12]
	bl	FSP_GetLogicFs
	ldr	r3, [r4]
	ldr	r1, [r3, #32]
	mov	r6, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetRef
	ldr	r3, [r4]
	ldr	r1, [r3, #32]
	mov	r7, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDisplay
	ldr	r1, [r4]
	ldr	ip, [fp, #-60]
	mov	r2, r5
	add	r5, r5, #1
	ldr	lr, [r1, #260]
	mov	r3, r1
	str	lr, [sp, #40]
	ldr	r1, [r1, #32]
	ldr	lr, [fp, #-56]
	str	ip, [sp, #20]
	str	r1, [sp, #36]
	ldr	ip, [fp, #-52]
	ldr	r1, [fp, #-48]
	str	r10, [sp, #16]
	str	r8, [sp, #12]
	str	r1, [sp]
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	str	r7, [sp, #28]
	str	r6, [sp, #24]
	ldr	r1, .L139+8
	str	r0, [sp, #32]
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #2540]
	cmp	r3, r5
	bhi	.L127
.L128:
	ldr	r1, .L139+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #2540]
	cmp	r3, #0
	addne	r5, r9, #2544
	movne	r6, #0
	addne	r5, r5, #12
	bne	.L135
	b	.L126
.L138:
	bl	dprint_vfmw
	ldr	r2, [r4, #672]
	ldr	r1, .L139+16
	mov	r0, #1
	bl	dprint_vfmw
	ldrsb	r2, [r4]
	ldr	r1, .L139+20
	mov	r0, #1
	bl	dprint_vfmw
	ldrsb	r2, [r4, #1]
	ldr	r1, .L139+24
	mov	r0, #1
	bl	dprint_vfmw
.L130:
	cmp	r8, #0
	mov	r2, r8
	ldr	r1, .L139+28
	mov	r0, #1
	beq	.L131
	bl	dprint_vfmw
	ldr	r2, [r8, #88]
	ldr	r1, .L139+32
	mov	r0, #1
	bl	dprint_vfmw
.L132:
	cmp	r7, #0
	mov	r2, r7
	ldr	r1, .L139+36
	mov	r0, #1
	beq	.L133
	bl	dprint_vfmw
	ldr	r2, [r7, #88]
	ldr	r1, .L139+40
	mov	r0, #1
	bl	dprint_vfmw
.L134:
	ldr	r1, .L139+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #2540]
	add	r6, r6, #1
	cmp	r3, r6
	bls	.L126
.L135:
	ldr	r3, [r5, #4]!
	ldr	r0, [r9, #276]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r4, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDecPhyFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r8, r0
	ldr	r0, [r9, #276]
	bl	FSP_GetDispPhyFs
	mov	r2, r6
	ldr	r1, .L139+44
	mov	r7, r0
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r4, #0
	mov	r2, r4
	ldr	r1, .L139+48
	mov	r0, #1
	bne	.L138
	ldr	r1, .L139+52
	mov	r0, #1
	bl	dprint_vfmw
	b	.L130
.L133:
	ldr	r1, .L139+56
	mov	r0, #1
	bl	dprint_vfmw
	b	.L134
.L131:
	ldr	r1, .L139+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L132
.L126:
	ldr	r1, .L139+64
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L140:
	.align	2
.L139:
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC4
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC33
	.word	.LC34
	.word	.LC36
	.word	.LC37
	.word	.LC27
	.word	.LC28
	.word	.LC32
	.word	.LC38
	.word	.LC35
	.word	.LC26
	UNWIND(.fnend)
	.size	HEVC_PrintDPBState, .-HEVC_PrintDPBState
	.align	2
	.global	HEVC_IsSliceUnit
	.type	HEVC_IsSliceUnit, %function
HEVC_IsSliceUnit:
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
	cmp	r0, #9
	bls	.L143
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L143:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsSliceUnit, .-HEVC_IsSliceUnit
	.align	2
	.global	HEVC_IsIUnit
	.type	HEVC_IsIUnit, %function
HEVC_IsIUnit:
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
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsIUnit, .-HEVC_IsIUnit
	.align	2
	.global	HEVC_IsNonRefPic
	.type	HEVC_IsNonRefPic, %function
HEVC_IsNonRefPic:
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
	bics	r0, r0, #6
	subne	r0, r0, #8
	clzne	r0, r0
	movne	r0, r0, lsr #5
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsNonRefPic, .-HEVC_IsNonRefPic
	.align	2
	.global	HEVC_IsFlushUnit
	.type	HEVC_IsFlushUnit, %function
HEVC_IsFlushUnit:
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
	sub	r0, r0, #16
	cmp	r0, #4
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsFlushUnit, .-HEVC_IsFlushUnit
	.align	2
	.global	HEVC_IsPVRFlushPic
	.type	HEVC_IsPVRFlushPic, %function
HEVC_IsPVRFlushPic:
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
	add	r3, r0, #53248
	ldr	r3, [r3, #1284]
	cmp	r3, #0
	bne	.L151
	ldr	r2, [r0, #2356]
	ldr	r1, [r2, #640]
	cmp	r1, #1
	beq	.L155
.L153:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L151:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L155:
	ldr	r0, [r2, #636]
	cmp	r0, #0
	bne	.L153
	ldr	r3, [r2, #644]
	cmp	r3, #0
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, [r2, #604]
	add	r3, r3, #1024
	cmp	r3, #2048
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsPVRFlushPic, .-HEVC_IsPVRFlushPic
	.align	2
	.global	HEVC_IsEosNal
	.type	HEVC_IsEosNal, %function
HEVC_IsEosNal:
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
	mov	r1, #32
	mov	r4, r0
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	ldr	r0, [r4, #2340]
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsEosNal, .-HEVC_IsEosNal
	.align	2
	.global	HEVC_IsFrameEndNal
	.type	HEVC_IsFrameEndNal, %function
HEVC_IsFrameEndNal:
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
	sub	r3, r0, #48
	sub	r0, r0, #32
	cmp	r0, #2
	cmphi	r3, #1
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsFrameEndNal, .-HEVC_IsFrameEndNal
	.align	2
	.global	HEVCDEC_IsNeedSedOnly
	.type	HEVCDEC_IsNeedSedOnly, %function
HEVCDEC_IsNeedSedOnly:
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
	ldr	r3, [r0, #208]
	mov	r4, r0
	cmp	r3, #0
	beq	.L161
	ldr	r2, [r0, #2360]
	cmp	r2, #0
	beq	.L166
.L161:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L166:
	add	r2, r0, #61440
	ldr	r2, [r2, #1648]
	cmp	r2, #1
	bls	.L161
	ldr	r2, [r0, #236]
	cmp	r3, r2
	beq	.L161
	ldr	r3, [r0, #220]
	cmp	r3, #1
	beq	.L167
	cmp	r3, #0
	bne	.L161
	ldr	r0, [r0, #276]
	bl	VCTRL_CheckFreshRaw
	cmp	r0, #0
	beq	.L161
	ldr	r0, [r4, #276]
	bl	VCTRL_CheckFreshSeg
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L167:
	ldr	r0, [r0, #2364]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_IsNeedSedOnly, .-HEVCDEC_IsNeedSedOnly
	.align	2
	.global	HEVC_CalcTileInfo
	.type	HEVC_CalcTileInfo, %function
HEVC_CalcTileInfo:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r5, r0, #24576
	str	r3, [fp, #-48]
	mov	r6, r2
	ldr	r3, [r5, #3776]
	mov	r8, r1
	ldr	r2, [r5, #3772]
	ldr	r7, [r3, #68]
	ldr	r9, [r3, #72]
	ldr	r2, [r2, #148]
	sub	r3, r7, #1
	cmp	r3, #9
	str	r2, [fp, #-52]
	bhi	.L196
	sub	r3, r9, #1
	cmp	r3, #10
	bhi	.L197
	ldr	r4, .L198
	mov	r2, #512
	mov	r1, #0
	mov	r0, r8
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #80
	mov	r1, #0
	mov	r0, r6
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #88
	mov	r1, #0
	ldr	r0, [fp, #-48]
	blx	r3
	cmp	r7, #0
	ble	.L177
	ldr	r3, [fp, #-52]
	mov	r2, #0
	mov	r1, r2
	mov	r0, r6
	sub	r10, r3, #4
.L176:
	str	r2, [r6, r1, asl #3]
	mov	r3, r2, asl r10
	ldr	ip, [r5, #3776]
	add	ip, ip, r1, lsl #1
	ldrsh	ip, [ip, #176]
	add	r2, ip, r2
	sub	ip, r2, #1
	str	ip, [r0, #4]
	mov	lr, r2, asl r10
	cmp	r3, lr
	bge	.L182
	cmp	r3, #255
	bhi	.L178
	uxtb	r4, r1
	add	ip, r8, r3
	b	.L180
.L181:
	cmp	r3, #256
	beq	.L178
.L180:
	add	r3, r3, #1
	strb	r4, [ip], #1
	cmp	r3, lr
	bne	.L181
.L182:
	add	r1, r1, #1
	add	r0, r0, #8
	cmp	r1, r7
	bne	.L176
.L177:
	cmp	r9, #0
	ble	.L174
	ldr	r3, [fp, #-52]
	mov	ip, #0
	ldr	r7, [fp, #-48]
	mov	lr, ip
	sub	r4, r3, #4
	mov	r6, r7
.L184:
	str	ip, [r7, lr, asl #3]
	mov	r3, ip, asl r4
	ldr	r2, [r5, #3776]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #216]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r6, #4]
	mov	r1, ip, asl r4
	cmp	r3, r1
	bge	.L189
	cmp	r3, #255
	bhi	.L185
	add	r2, r3, #255
	uxtb	r0, lr
	add	r2, r8, r2
	b	.L187
.L188:
	cmp	r3, #256
	beq	.L185
.L187:
	add	r3, r3, #1
	strb	r0, [r2, #1]!
	cmp	r3, r1
	bne	.L188
.L189:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, r9
	bne	.L184
.L174:
	mov	r0, #0
	b	.L170
.L178:
	ldr	r2, .L198+4
	mov	r0, #1
	ldr	r1, .L198+8
	bl	dprint_vfmw
	mvn	r0, #0
.L170:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L185:
	ldr	r2, .L198+4
	mov	r0, #1
	ldr	r1, .L198+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L170
.L197:
	mov	r1, #11
	mov	r3, r9
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L198+4
	ldr	r1, .L198+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L170
.L196:
	mov	r1, #10
	mov	r3, r7
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L198+4
	ldr	r1, .L198+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L170
.L199:
	.align	2
.L198:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+136
	.word	.LC41
	.word	.LC42
	.word	.LC40
	.word	.LC39
	UNWIND(.fnend)
	.size	HEVC_CalcTileInfo, .-HEVC_CalcTileInfo
	.align	2
	.global	HEVC_VPSEqual
	.type	HEVC_VPSEqual, %function
HEVC_VPSEqual:
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
	subs	r10, r0, #0
	beq	.L224
	cmp	r1, #0
	beq	.L225
	ldr	r4, [r10, #12]
	add	lr, r10, #12288
	ldr	r3, [r10, #16]
	add	ip, r1, #12288
	ldr	r6, [r1, #16]
	add	r2, r10, #12416
	ldr	r5, [r1, #12]
	add	r0, r1, #12416
	ldr	r9, [r1, #20]
	mov	r7, r2
	cmp	r3, r6
	cmpeq	r4, r5
	ldr	r8, [r10, #20]
	ldrb	r5, [r10, #1]	@ zero_extendqisi2
	add	r2, r2, #20
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	moveq	r4, #1
	movne	r4, #0
	cmp	r8, r9
	movne	r4, #0
	andeq	r4, r4, #1
	cmp	r5, r3
	movne	r9, #0
	andeq	r9, r4, #1
	ldr	r6, [r1, #24]
	ldr	r3, [r10, #24]
	add	r0, r0, #20
	ldr	r5, [r10, #8]
	add	r7, r7, #52
	ldr	r4, [r1, #8]
	cmp	r3, r6
	movne	r3, #0
	andeq	r3, r9, #1
	ldr	r9, [ip, #424]
	cmp	r5, r4
	movne	r6, #0
	andeq	r6, r3, #1
	ldr	r5, [lr, #424]
	ldrb	r3, [ip, #148]	@ zero_extendqisi2
	ldrb	r4, [lr, #148]	@ zero_extendqisi2
	cmp	r5, r9
	movne	r5, #0
	andeq	r5, r6, #1
	ldr	r9, [lr, #420]
	ldr	r6, [ip, #420]
	cmp	r4, r3
	movne	r4, #0
	andeq	r4, r5, #1
	cmp	r9, r6
	movne	r3, #0
	andeq	r3, r4, #1
.L204:
	ldrb	r5, [r2, #1]!	@ zero_extendqisi2
	ldrb	r4, [r0, #1]!	@ zero_extendqisi2
	cmp	r5, r4
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r7
	bne	.L204
	ldrb	r2, [lr, #182]	@ zero_extendqisi2
	add	r7, r10, #80
	ldrb	r6, [ip, #182]	@ zero_extendqisi2
	sub	r0, r8, #1
	ldrb	r5, [lr, #181]	@ zero_extendqisi2
	add	r9, r1, #48
	ldrb	r4, [ip, #181]	@ zero_extendqisi2
	add	r8, r1, #80
	str	r7, [fp, #-56]
	cmp	r2, r6
	cmpeq	r5, r4
	ldrb	r7, [lr, #183]	@ zero_extendqisi2
	ldrb	r4, [ip, #183]	@ zero_extendqisi2
	mov	r5, #0
	ldrb	lr, [lr, #184]	@ zero_extendqisi2
	moveq	r2, #1
	ldrb	ip, [ip, #184]	@ zero_extendqisi2
	movne	r2, #0
	ldrb	r6, [r10, #7]	@ zero_extendqisi2
	cmp	r7, r4
	movne	r2, #0
	andeq	r2, r2, #1
	add	r4, r10, #112
	str	r4, [fp, #-52]
	ldrb	r4, [r1, #7]	@ zero_extendqisi2
	cmp	lr, ip
	movne	ip, #0
	andeq	ip, r2, #1
	add	r7, r1, #112
	str	r1, [fp, #-60]
	cmp	r6, r4
	movne	ip, #0
	andeq	ip, ip, #1
	ldr	r1, [fp, #-56]
	str	r0, [fp, #-48]
	and	r6, r3, ip
	add	r0, r10, #48
	ldr	r2, [fp, #-52]
	str	r10, [fp, #-52]
.L205:
	ldr	r3, [r1, #4]!
	add	r5, r5, #1
	ldr	r10, [r8, #4]!
	ldr	r4, [r0, #4]!
	ldr	lr, [r9, #4]!
	ldr	ip, [r2, #4]!
	cmp	r3, r10
	cmpeq	r4, lr
	ldr	r10, [r7, #4]!
	moveq	r3, #1
	movne	r3, #0
	cmp	ip, r10
	movne	r3, #0
	andeq	r3, r3, #1
	ldr	ip, [fp, #-48]
	and	r6, r6, r3
	cmp	r5, ip
	bls	.L205
	ldr	r10, [fp, #-52]
	ldr	r1, [fp, #-60]
	ldr	r8, [r10, #32]
	ldr	r3, [r1, #32]
	ldr	r4, [r10, #28]
	ldr	r2, [r1, #28]
	cmp	r8, r3
	cmpeq	r4, r2
	moveq	r3, #1
	movne	r3, #0
	cmp	r8, #0
	and	r6, r6, r3
	beq	.L206
	add	r7, r10, #148
	add	r5, r1, #148
	mov	r9, #1
.L207:
	mov	r0, r5
	mov	r2, r7
	mov	r3, #0
.L208:
	ldr	lr, [r2, #4]!
	add	r3, r3, #1
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	movne	r6, #0
	andeq	r6, r6, #1
	cmp	r3, r4
	bls	.L208
	add	r9, r9, #1
	add	r7, r7, #4
	cmp	r9, r8
	add	r5, r5, #4
	bls	.L207
.L206:
	ldrb	r3, [r10, #6]	@ zero_extendqisi2
	ldrb	r2, [r1, #6]	@ zero_extendqisi2
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
	cmp	r3, #0
	beq	.L209
	ldr	r3, [r10, #36]
	ldr	r2, [r10, #40]
	ldr	r4, [r1, #40]
	ldr	lr, [r1, #36]
	ldrb	r0, [r10, #5]	@ zero_extendqisi2
	cmp	r2, r4
	cmpeq	r3, lr
	ldrb	ip, [r1, #5]	@ zero_extendqisi2
	moveq	r3, #1
	movne	r3, #0
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	and	r6, r6, r3
	bne	.L226
.L210:
	ldr	r2, [r10, #48]
	ldr	r3, [r1, #48]
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
.L209:
	eor	r6, r6, #1
	rsb	r0, r6, #0
.L202:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L226:
	ldr	r2, [r10, #44]
	ldr	r3, [r1, #44]
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
	b	.L210
.L225:
	mov	r0, r1
	movw	r3, #1899
	ldr	r2, .L227
	ldr	r1, .L227+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L202
.L224:
	movw	r3, #1898
	ldr	r2, .L227
	ldr	r1, .L227+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L202
.L228:
	.align	2
.L227:
	.word	.LC43
	.word	.LC44
	UNWIND(.fnend)
	.size	HEVC_VPSEqual, .-HEVC_VPSEqual
	.align	2
	.global	HEVC_Sei_More_Data_In_Payload
	.type	HEVC_Sei_More_Data_In_Payload, %function
HEVC_Sei_More_Data_In_Payload:
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
	ldr	r2, [r0, #2340]
	mov	r5, r1
	ldr	r3, [r2, #24]
	mov	r0, r2
	ldr	r4, [r2, #28]
	rsb	r4, r4, r3
	bl	BsIsByteAligned
	cmp	r4, r5, asl #3
	movne	r3, #1
	moveq	r3, #0
	cmp	r0, #0
	moveq	r0, #0
	andne	r0, r3, #1
	eor	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_More_Data_In_Payload, .-HEVC_Sei_More_Data_In_Payload
	.align	2
	.global	HEVC_Sei_Payload_Extension_Present
	.type	HEVC_Sei_Payload_Extension_Present, %function
HEVC_Sei_Payload_Extension_Present:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	r3, .L237
	mov	r5, r1
	mov	r2, #32
	ldr	r1, [r0, #2340]
	sub	r0, fp, #52
	ldr	r3, [r3, #52]
	mov	r5, r5, asl #3
	blx	r3
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	cmp	r3, r5
	movcs	r0, #0
	bcc	.L236
.L231:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L236:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r0, #0
	moveq	r0, #1
	beq	.L231
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
	b	.L232
.L233:
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
.L232:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r4, r5
	mov	r1, #1
	movcs	r3, #0
	movcc	r3, #1
	cmp	r0, #0
	movne	r2, #0
	andeq	r2, r3, #1
	sub	r0, fp, #52
	cmp	r2, #0
	bne	.L233
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L238:
	.align	2
.L237:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_Sei_Payload_Extension_Present, .-HEVC_Sei_Payload_Extension_Present
	.align	2
	.global	HEVC_Sei_Decoded_Picture_Hash
	.type	HEVC_Sei_Decoded_Picture_Hash, %function
HEVC_Sei_Decoded_Picture_Hash:
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
	cmpne	r0, #0
	mov	r6, r0
	mov	r7, r1
	beq	.L247
	mov	r1, #8
	ldr	r0, [r0, #2340]
	bl	BsGet
	sub	r4, r7, #1
	add	r8, r7, #47
	mov	r3, r0
	cmp	r3, #0
	str	r0, [r7, #48]
	str	r0, [r7, #52]
	bne	.L241
.L252:
	add	r5, r4, #16
.L242:
	mov	r1, #8
	ldr	r0, [r6, #2340]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r5
	bne	.L242
.L243:
	cmp	r5, r8
	mov	r4, r5
	beq	.L248
.L254:
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L252
.L241:
	cmp	r3, #1
	beq	.L253
	cmp	r3, #2
	addne	r5, r4, #16
	bne	.L243
	mov	r1, #32
	ldr	r0, [r6, #2340]
	bl	BsGet
	add	r5, r4, #16
	cmp	r5, r8
	strb	r0, [r4, #4]
	mov	r2, r0, lsr #24
	mov	r3, r0, lsr #16
	strb	r2, [r4, #1]
	mov	r0, r0, lsr #8
	strb	r3, [r4, #2]
	strb	r0, [r4, #3]
	mov	r4, r5
	bne	.L254
.L248:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L253:
	mov	r1, #16
	ldr	r0, [r6, #2340]
	bl	BsGet
	add	r5, r4, #16
	mov	r3, r0, lsr #8
	strb	r0, [r4, #2]
	strb	r3, [r4, #1]
	b	.L243
.L247:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Decoded_Picture_Hash, .-HEVC_Sei_Decoded_Picture_Hash
	.align	2
	.global	HEVC_Sei_Region_Refresh_Info
	.type	HEVC_Sei_Region_Refresh_Info, %function
HEVC_Sei_Region_Refresh_Info:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L257
	ldr	r0, [r0, #2340]
	mov	r1, #1
	bl	BsGet
	mov	r3, r4
	strb	r0, [r5]
.L256:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L257:
	mvn	r3, #0
	b	.L256
	UNWIND(.fnend)
	.size	HEVC_Sei_Region_Refresh_Info, .-HEVC_Sei_Region_Refresh_Info
	.align	2
	.global	HEVC_Sei_Mastering_Display_Colour_Volume
	.type	HEVC_Sei_Mastering_Display_Colour_Volume, %function
HEVC_Sei_Mastering_Display_Colour_Volume:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r6, r1
	beq	.L261
	add	r7, r1, #12
	mov	r4, r1
	mov	r3, #1
	strb	r3, [r1]
.L260:
	mov	r1, #16
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #4]!
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r4, r7
	str	r0, [r4, #12]
	bne	.L260
	mov	r1, #16
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #28]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #32]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r3, #0
	str	r0, [r6, #40]
.L259:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L261:
	mvn	r3, #0
	b	.L259
	UNWIND(.fnend)
	.size	HEVC_Sei_Mastering_Display_Colour_Volume, .-HEVC_Sei_Mastering_Display_Colour_Volume
	.align	2
	.global	HEVC_Sei_Content_Light_Level_Information
	.type	HEVC_Sei_Content_Light_Level_Information, %function
HEVC_Sei_Content_Light_Level_Information:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L265
	mov	r3, #1
	mov	r1, #16
	strb	r3, [r5]
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #2]	@ movhi
	ldr	r0, [r6, #2340]
	bl	BsGet
	mov	r3, r4
	strh	r0, [r5, #4]	@ movhi
.L264:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L265:
	mvn	r3, #0
	b	.L264
	UNWIND(.fnend)
	.size	HEVC_Sei_Content_Light_Level_Information, .-HEVC_Sei_Content_Light_Level_Information
	.align	2
	.global	HEVC_Sei_HLGHDR_Comapitibility_Info
	.type	HEVC_Sei_HLGHDR_Comapitibility_Info, %function
HEVC_Sei_HLGHDR_Comapitibility_Info:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L268
	ldr	r0, [r0, #2340]
	mov	r1, #8
	bl	BsGet
	mov	r3, r4
	strb	r0, [r5]
.L267:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L268:
	mvn	r3, #0
	b	.L267
	UNWIND(.fnend)
	.size	HEVC_Sei_HLGHDR_Comapitibility_Info, .-HEVC_Sei_HLGHDR_Comapitibility_Info
	.align	2
	.global	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.type	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, %function
HEVC_Sei_Temporal_Sub_Layer_Zero_Index:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r6, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L271
	mov	r1, #1
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6]
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r6, #4]
	ldr	r0, [r5, #2340]
	bl	BsToNextByte
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L271:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Temporal_Sub_Layer_Zero_Index, .-HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	.align	2
	.global	HEVC_Sei_Display_Orientation
	.type	HEVC_Sei_Display_Orientation, %function
HEVC_Sei_Display_Orientation:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	beq	.L275
	mov	r1, #1
	ldr	r0, [r0, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #2]
	cmp	r0, #0
	beq	.L276
.L274:
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L276:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r5, #3]
	b	.L274
.L275:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_Sei_Display_Orientation, .-HEVC_Sei_Display_Orientation
	.align	2
	.global	HEVC_Sei_ParsePts_Init
	.type	HEVC_Sei_ParsePts_Init, %function
HEVC_Sei_ParsePts_Init:
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
	ldr	r3, .L278
	mov	r4, r0
	add	r0, r0, #28160
	mov	r2, #80
	mov	r1, #0
	add	r0, r0, #104
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r4, #4096
	add	ip, r3, #2576
	add	r4, r4, #6656
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	strd	r0, [ip]
	strd	r0, [r4, #-8]
	strd	r0, [r4]
	strd	r0, [ip, #-8]
	str	r2, [r3, #460]
	str	r2, [r3, #464]
	str	r2, [r3, #452]
	str	r2, [r3, #456]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L279:
	.align	2
.L278:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	2
	.global	HEVC_Sei_Get_Dpb_Output_Time
	.type	HEVC_Sei_Get_Dpb_Output_Time, %function
HEVC_Sei_Get_Dpb_Output_Time:
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
	add	r3, r0, #53248
	ldr	r5, [r0, #2352]
	movw	r6, #2024
	ldr	ip, [r3, #2076]
	add	r3, r0, #24576
	ldr	lr, [r1, #12]
	ldr	r4, [r0, #2348]
	mla	ip, r6, ip, r5
	movw	r5, #26164
	ldr	r6, [r3, #3692]
	cmp	r6, #1
	ldr	ip, [ip, #32]
	str	lr, [r3, #3712]
	ldr	lr, [r1, #16]
	mla	r1, r5, ip, r4
	str	lr, [r3, #3716]
	ldr	lr, [r2, #76]
	str	lr, [r3, #3736]
	ldr	ip, [r2, #80]
	str	ip, [r3, #3740]
	ldr	ip, [r1, #56]
	add	r1, r1, ip, lsl #2
	ldrb	r8, [r1, #412]	@ zero_extendqisi2
	beq	.L288
	ldrb	r1, [r3, #3761]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L289
	add	ip, r0, #4096
	add	r0, r0, #6656
	add	r1, ip, #2576
	ldrd	r4, [r0, #-8]
	ldr	r6, [ip, #484]
	adds	r4, r4, r6
	adc	r5, r5, #0
	strd	r4, [r1]
.L282:
	add	r1, ip, #2576
	mov	r0, #0
	strd	r4, [r1, #-8]
	strb	r0, [r3, #3761]
	ldrb	r2, [r2, #9]	@ zero_extendqisi2
	cmp	r2, r0
	ldr	r2, [ip, #488]
	bne	.L290
	adds	r4, r4, r2
	add	r3, r3, #3696
	adc	r5, r5, #0
	subs	r4, r4, r8
	sbc	r5, r5, #0
	strd	r4, [r3, #32]
	umull	r0, r1, r4, lr
	mla	r1, lr, r5, r1
	strd	r0, [r3, #24]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L289:
	ldrb	r1, [r0, #3505]	@ zero_extendqisi2
	add	ip, r0, #4096
	cmp	r1, #0
	add	r1, r0, #6656
	bne	.L291
	ldrd	r4, [r1, #-8]
	ldrd	r6, [r1]
	strd	r4, [fp, #-52]
.L285:
	mov	r5, #0
	ldr	r0, [ip, #484]
	mov	r1, r5
	ldrd	r4, [fp, #-52]
	add	r9, ip, #2576
	add	r10, ip, #2560
	adds	r4, r4, r0
	strd	r0, [fp, #-60]
	adc	r5, r5, r1
	cmp	r4, r6
	sbcs	r1, r5, r7
	strd	r4, [r9]
	strd	r4, [r10, #-8]
	bge	.L282
	ldrd	r4, [fp, #-60]
	adds	r4, r4, r6
	adc	r5, r5, r7
	strd	r4, [r9]
	strd	r4, [r10, #-8]
	b	.L282
.L290:
	adds	r4, r4, r2
	add	r1, r3, #3696
	adc	r5, r5, #0
	movs	r5, r5, asr #1
	mov	r4, r4, rrx
	subs	r4, r4, r8
	sbc	r5, r5, #0
	strd	r4, [r1, #32]
	umull	r2, r3, r4, lr
	mla	r3, lr, r5, r3
	strd	r2, [r1, #24]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L288:
	add	ip, r0, #4096
	add	r0, r0, #6656
	add	r1, ip, #2576
	ldr	r4, [ip, #452]
	mov	r5, r4, asr #31
	strd	r4, [r1]
	strd	r4, [r0, #-8]
	b	.L282
.L291:
	ldrd	r0, [r1]
	strd	r0, [fp, #-52]
	mov	r6, r0
	mov	r7, r1
	b	.L285
	UNWIND(.fnend)
	.size	HEVC_Sei_Get_Dpb_Output_Time, .-HEVC_Sei_Get_Dpb_Output_Time
	.align	2
	.global	HEVC_Get_Last_IDR_Frame_Info
	.type	HEVC_Get_Last_IDR_Frame_Info, %function
HEVC_Get_Last_IDR_Frame_Info:
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
	sub	r3, r1, #19
	cmp	r3, #1
	bls	.L296
.L293:
	sub	r1, r1, #6
	cmp	r1, #3
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r3, r0, #6656
	mov	r0, r3
	add	r3, r3, #16
	ldrd	r2, [r3]
	strd	r2, [r0]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L296:
	ldr	ip, [r0, #2356]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [ip, #56]
	cmp	r5, r3
	cmpeq	r4, r2
	beq	.L294
	movw	r2, #28304
	add	r3, r0, #28160
	ldrd	r6, [r0, r2]
	movw	r2, #28320
	strd	r4, [r0, r2]
	strd	r6, [r3, #168]
.L294:
	add	r3, r0, #24576
	mov	r2, #1
	strb	r2, [r3, #3760]
	b	.L293
	UNWIND(.fnend)
	.size	HEVC_Get_Last_IDR_Frame_Info, .-HEVC_Get_Last_IDR_Frame_Info
	.global	__aeabi_uidivmod
	.align	2
	.global	HEVC_Sei_Get_Frame_Pts
	.type	HEVC_Sei_Get_Frame_Pts, %function
HEVC_Sei_Get_Frame_Pts:
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
	add	r3, r0, #28160
	add	r2, r0, #24576
	add	r3, r3, #176
	mov	r4, r0
	movw	r0, #28320
	ldr	r5, [r2, #3736]
	movw	r1, #28304
	ldr	r10, [r2, #3740]
	ldrd	r2, [r3, #-8]
	cmp	r5, #0
	ldrd	r6, [r4, r1]
	strd	r2, [fp, #-60]
	ldrd	r2, [r4, r0]
	strd	r2, [fp, #-52]
	beq	.L300
	mov	r9, r5
	mov	r0, r10
	b	.L299
.L301:
	mov	r9, r1
.L299:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L301
.L298:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	add	r4, r4, #55040
	mul	r6, r8, r2
	bl	__aeabi_uidiv
	mov	r1, r9
	mul	r6, r0, r6
	mov	r0, r10
	bl	__aeabi_uidiv
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_uidiv
	ldrd	r2, [fp, #-52]
	adds	r2, r2, r0
	adc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	strd	r0, [r4, #184]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L300:
	mov	r9, r10
	b	.L298
	UNWIND(.fnend)
	.size	HEVC_Sei_Get_Frame_Pts, .-HEVC_Sei_Get_Frame_Pts
	.align	2
	.global	HEVC_Sei_TSI
	.type	HEVC_Sei_TSI, %function
HEVC_Sei_TSI:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r0
	mov	r5, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L304
	mov	r1, #4
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #1]
	ldr	r0, [r6, #2340]
	bl	BsGet
	mov	r3, r4
	mov	r2, #1
	strb	r2, [r5]
	strb	r0, [r5, #2]
.L303:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L304:
	mvn	r3, #0
	b	.L303
	UNWIND(.fnend)
	.size	HEVC_Sei_TSI, .-HEVC_Sei_TSI
	.align	2
	.global	HEVC_Sei_User_Data_Unregistered
	.type	HEVC_Sei_User_Data_Unregistered, %function
HEVC_Sei_User_Data_Unregistered:
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
	cmp	r2, #15
	mov	r8, r2
	mov	r5, r0
	mov	r7, r1
	addhi	r4, r1, #3
	addhi	r6, r1, #19
	bls	.L313
.L308:
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r6
	bne	.L308
	sub	r0, r8, #16
	str	r0, [r7, #20]
	cmp	r0, #0
	movne	r4, #0
	beq	.L314
.L310:
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r3, [r7, #20]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L310
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L314:
	str	r0, [r7]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L313:
	ldr	r1, .L315
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L316:
	.align	2
.L315:
	.word	.LC45
	UNWIND(.fnend)
	.size	HEVC_Sei_User_Data_Unregistered, .-HEVC_Sei_User_Data_Unregistered
	.align	2
	.global	HEVC_IsRefListWrong
	.type	HEVC_IsRefListWrong, %function
HEVC_IsRefListWrong:
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
	add	r7, r0, #53248
	mov	r5, r0
	ldr	r3, [r7, #2160]
	cmp	r3, #0
	beq	.L318
	ldr	r4, [r0, #2368]
	cmp	r4, #0
	beq	.L319
	ldr	r2, [r4, #36]
	cmp	r2, #0
	addne	r6, r0, #2368
	movne	r4, #0
	bne	.L324
	b	.L362
.L325:
	ldr	r3, [ip, #680]
	cmp	r3, #0
	beq	.L326
	ldr	r3, [r7, #2160]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L363
	ldr	r2, [r6, #4]!
	cmp	r2, #0
	beq	.L319
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L320
.L324:
	ldr	r1, [r2, #32]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	bne	.L325
.L326:
	add	r3, r4, #592
	mov	r2, r4
	ldr	r1, .L367
	mov	r0, #1
	ldr	r3, [r5, r3, asl #2]
	ldr	r3, [r3, #36]
	str	ip, [sp]
	bl	dprint_vfmw
.L323:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L363:
	cmp	r3, #0
	beq	.L318
	ldr	r2, [r7, #2164]
	cmp	r2, #0
	beq	.L318
	ldr	r4, [r5, #2436]
	cmp	r4, #0
	beq	.L331
	ldr	r2, [r4, #36]
	cmp	r2, #0
	addne	r6, r5, #2432
	movne	r4, #0
	addne	r6, r6, #4
	bne	.L335
	b	.L364
.L336:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L337
	ldr	r3, [r7, #2164]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L318
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L365
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L366
.L335:
	ldr	r1, [r2, #32]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L336
.L337:
	mov	r3, r0
	mov	r2, r4
	ldr	r1, .L367+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L357
.L318:
	mov	r0, #0
.L357:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L319:
	mov	r2, r4
	ldr	r1, .L367+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L323
.L362:
	mov	r4, r2
.L320:
	mov	r2, r4
	ldr	r1, .L367+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L323
.L365:
	ldr	r3, [r7, #2160]
.L331:
	mov	r2, r4
	ldr	r1, .L367+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L357
.L366:
	ldr	r3, [r7, #2160]
.L332:
	mov	r2, r4
	ldr	r1, .L367+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L357
.L364:
	mov	r4, r2
	b	.L332
.L368:
	.align	2
.L367:
	.word	.LC48
	.word	.LC51
	.word	.LC46
	.word	.LC47
	.word	.LC49
	.word	.LC50
	UNWIND(.fnend)
	.size	HEVC_IsRefListWrong, .-HEVC_IsRefListWrong
	.align	2
	.global	HEVC_GetUnRefPicWithMinPoc
	.type	HEVC_GetUnRefPicWithMinPoc, %function
HEVC_GetUnRefPicWithMinPoc:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mvn	r4, #0
	str	r4, [r1]
	ldr	r3, [r0, #2540]
	cmp	r3, #16
	bhi	.L370
	cmp	r3, #0
	addne	ip, r0, #2544
	mvnne	r4, #-2147483648
	addne	ip, ip, #12
	movne	r3, #0
	beq	.L372
.L375:
	ldr	r2, [ip, #4]!
	ldr	lr, [r2, #12]
	cmp	lr, r4
	bge	.L374
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	streq	r3, [r1]
	moveq	r4, lr
.L374:
	ldr	r2, [r0, #2540]
	add	r3, r3, #1
	cmp	r2, r3
	bhi	.L375
	ldr	r3, [r1]
	cmn	r3, #1
	beq	.L372
	str	r4, [sp]
	mov	r0, #1
	ldr	r2, .L378
	ldr	r1, .L378+4
	bl	dprint_vfmw
	mov	r0, #0
.L373:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L370:
	ldr	r2, .L378
	mov	r0, #1
	ldr	r1, .L378+8
	bl	dprint_vfmw
	mov	r0, r4
	b	.L373
.L372:
	ldr	r2, .L378
	mov	r0, #1
	ldr	r1, .L378+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L373
.L379:
	.align	2
.L378:
	.word	.LANCHOR1+156
	.word	.LC54
	.word	.LC52
	.word	.LC53
	UNWIND(.fnend)
	.size	HEVC_GetUnRefPicWithMinPoc, .-HEVC_GetUnRefPicWithMinPoc
	.align	2
	.global	HEVC_IncreaseDPBSize
	.type	HEVC_IncreaseDPBSize, %function
HEVC_IncreaseDPBSize:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	ldr	r3, [r0, #2536]
	mov	r5, r0
	cmp	r3, #16
	bhi	.L384
	ldr	r0, [r0, #276]
	bl	FSP_GetTotalValidFsNum
	add	r3, r5, #53248
	ldr	r2, [r5, #276]
	ldr	r1, [r3, #1292]
	mov	r4, r0
	ldr	r0, [r3, #1288]
	bl	FSP_GetOccupiedNum
	rsb	r0, r0, r4
	bic	r2, r0, r0, asr #31
	cmp	r2, #0
	ble	.L383
	ldr	r3, [r5, #2536]
	add	r3, r3, #1
	cmp	r2, r3
	bcc	.L383
	str	r3, [r5, #2536]
	mov	r0, #13
	ldr	r2, .L385
	ldr	r1, .L385+4
	bl	dprint_vfmw
	mov	r0, #0
.L382:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L383:
	mov	r3, r2
	ldr	r1, .L385+8
	ldr	r2, .L385
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L382
.L384:
	mov	r4, #17
	ldr	r2, .L385
	mov	r0, #1
	str	r4, [sp]
	ldr	r1, .L385+12
	bl	dprint_vfmw
	str	r4, [r5, #2536]
	mvn	r0, #0
	b	.L382
.L386:
	.align	2
.L385:
	.word	.LANCHOR1+184
	.word	.LC56
	.word	.LC57
	.word	.LC55
	UNWIND(.fnend)
	.size	HEVC_IncreaseDPBSize, .-HEVC_IncreaseDPBSize
	.align	2
	.global	HEVC_PicTypeStatistic
	.type	HEVC_PicTypeStatistic, %function
HEVC_PicTypeStatistic:
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
	add	r0, r0, #53248
	ldr	r3, [r0, #2072]
	sub	r2, r3, #16
	cmp	r2, #5
	bls	.L388
	ldr	r3, [r0, #1276]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L399
	ldr	r3, [r0, #2060]
	cmp	r3, #1
	beq	.L391
	cmp	r3, #2
	beq	.L392
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r0, #1284]
	ldmfd	sp, {fp, sp, pc}
.L388:
	str	r3, [r0, #1276]
	mov	r3, #0
	str	r3, [r0, #1284]
	ldmfd	sp, {fp, sp, pc}
.L391:
	ldr	r2, [r0, #1284]
	cmp	r2, #2
	beq	.L400
	str	r3, [r0, #1284]
	ldmfd	sp, {fp, sp, pc}
.L392:
	ldr	r3, [r0, #1284]
	sub	r3, r3, #1
	cmp	r3, #1
	movhi	r3, #0
	strhi	r3, [r0, #1284]
	ldmfd	sp, {fp, sp, pc}
.L400:
	ldmfd	sp, {fp, sp, pc}
.L399:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_PicTypeStatistic, .-HEVC_PicTypeStatistic
	.align	2
	.global	HEVC_IsReferenceNalu
	.type	HEVC_IsReferenceNalu, %function
HEVC_IsReferenceNalu:
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
	add	r0, r0, #53248
	ldr	r0, [r0, #2072]
	cmp	r0, #15
	bhi	.L402
	tst	r0, #1
	bne	.L404
.L402:
	sub	r0, r0, #16
	cmp	r0, #7
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L404:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsReferenceNalu, .-HEVC_IsReferenceNalu
	.align	2
	.global	HEVC_WriteQmatrix_4x4
	.type	HEVC_WriteQmatrix_4x4, %function
HEVC_WriteQmatrix_4x4:
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
	add	r1, r1, r0, lsl #6
	ldr	r0, [r1, #620]
	ldr	r3, [r1, #624]
	ldrb	ip, [r1, #612]	@ zero_extendqisi2
	ldrb	lr, [r1, #616]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #620]
	ldrb	lr, [r1, #613]	@ zero_extendqisi2
	ldrb	r3, [r1, #625]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #617]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #4]
	ldr	r0, [r1, #616]
	ldrb	lr, [r1, #614]	@ zero_extendqisi2
	ldrb	r3, [r1, #626]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #622]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #8]
	ldr	r0, [r1, #624]
	ldrb	r3, [r1, #619]	@ zero_extendqisi2
	ldrb	lr, [r1, #615]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #623]	@ zero_extendqisi2
	orr	r1, lr, r0
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #12]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_4x4, .-HEVC_WriteQmatrix_4x4
	.align	2
	.global	HEVC_WriteQmatrix_32x32
	.type	HEVC_WriteQmatrix_32x32, %function
HEVC_WriteQmatrix_32x32:
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
	add	lr, r0, #18
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1772]
	ldr	r3, [r0, #1788]
	ldrb	ip, [lr, #612]	@ zero_extendqisi2
	ldrb	r4, [r0, #1780]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1804]
	ldr	r3, [r0, #1820]
	ldrb	ip, [r0, #1796]	@ zero_extendqisi2
	ldrb	r4, [r0, #1812]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1772]
	ldrb	r4, [lr, #613]	@ zero_extendqisi2
	ldrb	r3, [r0, #1789]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1781]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1804]
	ldrb	r4, [r0, #1797]	@ zero_extendqisi2
	ldrb	r3, [r0, #1821]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1813]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1780]
	ldrb	r4, [lr, #614]	@ zero_extendqisi2
	ldrb	r3, [r0, #1790]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1774]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1812]
	ldrb	r4, [r0, #1798]	@ zero_extendqisi2
	ldrb	r3, [r0, #1822]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1806]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1788]
	ldrb	lr, [lr, #615]	@ zero_extendqisi2
	ldrb	r3, [r0, #1783]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1775]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1820]
	ldrb	lr, [r0, #1799]	@ zero_extendqisi2
	ldrb	r3, [r0, #1815]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1807]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1776]
	ldr	r3, [r0, #1792]
	ldrb	ip, [r0, #1768]	@ zero_extendqisi2
	ldrb	lr, [r0, #1784]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1808]
	ldr	r3, [r0, #1824]
	ldrb	ip, [r0, #1800]	@ zero_extendqisi2
	ldrb	lr, [r0, #1816]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1776]
	ldrb	lr, [r0, #1769]	@ zero_extendqisi2
	ldrb	r3, [r0, #1793]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1785]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1808]
	ldrb	lr, [r0, #1801]	@ zero_extendqisi2
	ldrb	r3, [r0, #1825]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1817]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1784]
	ldrb	lr, [r0, #1770]	@ zero_extendqisi2
	ldrb	r3, [r0, #1794]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1778]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r0, #1802]	@ zero_extendqisi2
	ldr	r1, [r0, #1816]
	ldrb	r3, [r0, #1826]	@ zero_extendqisi2
	ldrb	ip, [r0, #1810]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1792]
	ldrb	lr, [r0, #1771]	@ zero_extendqisi2
	ldrb	r3, [r0, #1787]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1779]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1824]
	ldrb	ip, [r0, #1803]	@ zero_extendqisi2
	ldrb	r3, [r0, #1819]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1811]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_32x32, .-HEVC_WriteQmatrix_32x32
	.align	2
	.global	HEVC_WriteQmatrix_8x8
	.type	HEVC_WriteQmatrix_8x8, %function
HEVC_WriteQmatrix_8x8:
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
	add	lr, r0, #6
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1012]
	ldr	r3, [r0, #1044]
	ldrb	ip, [lr, #612]	@ zero_extendqisi2
	ldrb	r4, [r0, #1028]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1020]
	ldr	r3, [r0, #1052]
	ldrb	ip, [r0, #1004]	@ zero_extendqisi2
	ldrb	r4, [r0, #1036]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1012]
	ldrb	r4, [lr, #613]	@ zero_extendqisi2
	ldrb	r3, [r0, #1045]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1029]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1020]
	ldrb	r4, [r0, #1005]	@ zero_extendqisi2
	ldrb	r3, [r0, #1053]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1037]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1028]
	ldrb	r4, [lr, #614]	@ zero_extendqisi2
	ldrb	r3, [r0, #1046]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1014]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1036]
	ldrb	r4, [r0, #1006]	@ zero_extendqisi2
	ldrb	r3, [r0, #1054]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1022]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1044]
	ldrb	lr, [lr, #615]	@ zero_extendqisi2
	ldrb	r3, [r0, #1031]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1015]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1052]
	ldrb	lr, [r0, #1007]	@ zero_extendqisi2
	ldrb	r3, [r0, #1039]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1023]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1016]
	ldr	r3, [r0, #1048]
	ldrb	ip, [r0, #1000]	@ zero_extendqisi2
	ldrb	lr, [r0, #1032]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1024]
	ldr	r3, [r0, #1056]
	ldrb	ip, [r0, #1008]	@ zero_extendqisi2
	ldrb	lr, [r0, #1040]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1016]
	ldrb	lr, [r0, #1001]	@ zero_extendqisi2
	ldrb	r3, [r0, #1049]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1033]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1024]
	ldrb	lr, [r0, #1009]	@ zero_extendqisi2
	ldrb	r3, [r0, #1057]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1041]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1032]
	ldrb	lr, [r0, #1002]	@ zero_extendqisi2
	ldrb	r3, [r0, #1050]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1018]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r0, #1010]	@ zero_extendqisi2
	ldr	r1, [r0, #1040]
	ldrb	r3, [r0, #1058]	@ zero_extendqisi2
	ldrb	ip, [r0, #1026]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1048]
	ldrb	lr, [r0, #1003]	@ zero_extendqisi2
	ldrb	r3, [r0, #1035]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1019]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1056]
	ldrb	ip, [r0, #1011]	@ zero_extendqisi2
	ldrb	r3, [r0, #1043]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1027]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_8x8, .-HEVC_WriteQmatrix_8x8
	.align	2
	.global	HEVC_WriteQmatrix_16x16
	.type	HEVC_WriteQmatrix_16x16, %function
HEVC_WriteQmatrix_16x16:
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
	add	lr, r0, #12
	add	r0, r1, r0, lsl #6
	add	lr, r1, lr, lsl #6
	ldr	r1, [r0, #1388]
	ldr	r3, [r0, #1404]
	ldrb	ip, [lr, #612]	@ zero_extendqisi2
	ldrb	r4, [r0, #1396]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2]
	ldr	r1, [r0, #1420]
	ldr	r3, [r0, #1436]
	ldrb	ip, [r0, #1412]	@ zero_extendqisi2
	ldrb	r4, [r0, #1428]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, r4, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r0, #1388]
	ldrb	r4, [lr, #613]	@ zero_extendqisi2
	ldrb	r3, [r0, #1405]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1397]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r1, [r0, #1420]
	ldrb	r4, [r0, #1413]	@ zero_extendqisi2
	ldrb	r3, [r0, #1437]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1429]	@ zero_extendqisi2
	orr	r1, r4, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	ip, [r0, #1396]
	ldrb	r4, [lr, #614]	@ zero_extendqisi2
	ldrb	r3, [r0, #1406]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1390]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #16]
	ldr	ip, [r0, #1428]
	ldrb	r4, [r0, #1414]	@ zero_extendqisi2
	ldrb	r3, [r0, #1438]	@ zero_extendqisi2
	and	ip, ip, #16711680
	ldrb	r1, [r0, #1422]	@ zero_extendqisi2
	orr	ip, r4, ip
	orr	r3, ip, r3, asl #24
	orr	r3, r3, r1, asl #8
	str	r3, [r2, #20]
	ldr	r1, [r0, #1404]
	ldrb	lr, [lr, #615]	@ zero_extendqisi2
	ldrb	r3, [r0, #1399]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1391]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r1, [r0, #1436]
	ldrb	lr, [r0, #1415]	@ zero_extendqisi2
	ldrb	r3, [r0, #1431]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1423]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r1, [r0, #1392]
	ldr	r3, [r0, #1408]
	ldrb	ip, [r0, #1384]	@ zero_extendqisi2
	ldrb	lr, [r0, #1400]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #32]
	ldr	r1, [r0, #1424]
	ldr	r3, [r0, #1440]
	ldrb	ip, [r0, #1416]	@ zero_extendqisi2
	ldrb	lr, [r0, #1432]	@ zero_extendqisi2
	mov	r1, r1, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r1, r1
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r1
	str	r3, [r2, #36]
	ldr	r1, [r0, #1392]
	ldrb	lr, [r0, #1385]	@ zero_extendqisi2
	ldrb	r3, [r0, #1409]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1401]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r1, [r0, #1424]
	ldrb	lr, [r0, #1417]	@ zero_extendqisi2
	ldrb	r3, [r0, #1441]	@ zero_extendqisi2
	and	r1, r1, #65280
	ldrb	ip, [r0, #1433]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r1, [r0, #1400]
	ldrb	lr, [r0, #1386]	@ zero_extendqisi2
	ldrb	r3, [r0, #1410]	@ zero_extendqisi2
	and	r1, r1, #16711680
	ldrb	ip, [r0, #1394]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r0, #1418]	@ zero_extendqisi2
	ldr	r1, [r0, #1432]
	ldrb	r3, [r0, #1442]	@ zero_extendqisi2
	ldrb	ip, [r0, #1426]	@ zero_extendqisi2
	and	r1, r1, #16711680
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r1, [r0, #1408]
	ldrb	lr, [r0, #1387]	@ zero_extendqisi2
	ldrb	r3, [r0, #1403]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	ip, [r0, #1395]	@ zero_extendqisi2
	orr	r1, lr, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r1, [r0, #1440]
	ldrb	ip, [r0, #1419]	@ zero_extendqisi2
	ldrb	r3, [r0, #1435]	@ zero_extendqisi2
	and	r1, r1, #-16777216
	ldrb	r0, [r0, #1427]	@ zero_extendqisi2
	orr	r1, ip, r1
	orr	r3, r1, r3, asl #16
	orr	r3, r3, r0, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix_16x16, .-HEVC_WriteQmatrix_16x16
	.global	__aeabi_idivmod
	.align	2
	.global	HEVC_CtbRsAddrToTsAddr
	.type	HEVC_CtbRsAddrToTsAddr, %function
HEVC_CtbRsAddrToTsAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #204)
	sub	sp, sp, #204
	add	r0, r0, #24576
	mov	r6, r1
	ldr	ip, [r0, #3776]
	ldrb	r3, [ip, #13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L444
	ldr	r3, [ip, #72]
	ldr	r7, [ip, #68]
	ldrb	r4, [ip, #15]	@ zero_extendqisi2
	mov	r2, r3
	str	r3, [fp, #-236]
	ldr	r3, [r0, #3772]
	cmp	r2, #0
	sub	r8, r2, #1
	sub	r2, r7, #1
	str	r2, [fp, #-240]
	ldr	r5, [r3, #72]
	ldr	r1, [r3, #148]
	ble	.L415
	ldr	r3, [fp, #-236]
	add	r2, ip, #214
	sub	r0, fp, #216
	add	lr, r3, #107
	add	lr, ip, lr, lsl #1
.L414:
	ldrsh	r3, [r2, #2]!
	cmp	r2, lr
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L414
.L415:
	cmp	r7, #0
	ble	.L413
	add	r3, r7, #87
	add	r2, ip, #174
	sub	r0, fp, #128
	add	ip, ip, r3, lsl #1
.L418:
	ldrsh	r3, [r2, #2]!
	cmp	r2, ip
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L418
.L413:
	mov	r10, #1
	mov	r0, r5
	mov	r10, r10, asl r1
	mov	r1, r10
	bl	__aeabi_idiv
	mov	r1, r10
	mov	r9, r0
	mov	r0, r5
	bl	__aeabi_idivmod
	mov	r0, r6
	cmp	r1, #0
	addne	r9, r9, #1
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r0, r6
	mov	r5, r1
	mov	r1, r9
	bl	__aeabi_idiv
	cmp	r4, #0
	beq	.L456
	cmp	r8, #0
	mov	r3, #0
	blt	.L435
	sub	r10, fp, #212
	mov	r4, r3
	mov	r6, r3
	mov	r8, r3
	str	r3, [fp, #-232]
	str	r3, [fp, #-244]
.L421:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L438
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	r1, r2
	add	r8, r8, #1
	sub	lr, fp, #128
	mov	r6, r4
	add	r9, r3, r8
	b	.L424
.L436:
	mov	r6, r4
.L424:
	ldr	r3, [lr, #4]!
	add	r1, r1, #1
	add	r3, r3, #1
	add	ip, r2, r3
	cmp	r5, ip
	mla	r4, r8, r3, r4
	bge	.L422
	cmp	r0, r9
	blt	.L454
.L422:
	cmp	r1, r7
	mov	r2, ip
	bne	.L436
.L427:
	add	r2, ip, r3
	cmp	r5, r2
	bge	.L437
	cmp	r0, r9
	blt	.L457
.L437:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	r1, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, r1
	str	r2, [fp, #-244]
	bne	.L421
	rsb	r0, r9, r0
	mov	r2, ip
	rsb	r2, r2, r5
	mul	r3, r0, r3
	add	r3, r2, r3
	add	r6, r3, r6
.L444:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L456:
	cmp	r8, #0
	mov	r3, r4
	blt	.L435
	sub	r10, fp, #212
	mov	lr, r4
	mov	r6, r4
	mov	r8, r4
	str	r4, [fp, #-232]
	str	r4, [fp, #-244]
.L420:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L441
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r4, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L430
.L439:
	mov	r6, lr
.L430:
	ldr	r3, [r4, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r5, r1
	mla	lr, r8, r3, lr
	bge	.L428
	cmp	r0, r9
	blt	.L429
.L428:
	cmp	ip, r7
	mov	r2, r1
	bne	.L439
.L433:
	add	r2, r1, r3
	cmp	r5, r2
	bge	.L453
	cmp	r0, r9
	blt	.L458
.L453:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	bne	.L420
	rsb	r0, r9, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L419
.L454:
	ldr	r1, [fp, #-232]
	rsb	r0, r1, r0
	mul	r3, r0, r3
.L419:
	rsb	r2, r2, r5
	add	r3, r2, r3
	add	r6, r3, r6
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L429:
	cmp	r1, r5
	bgt	.L454
	mov	r1, r2
	b	.L453
.L438:
	ldr	r2, [fp, #-232]
	mov	ip, #0
	add	r9, r2, r8
	b	.L427
.L441:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L433
.L457:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, ip
	mul	r3, r0, r3
	b	.L419
.L458:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L419
.L435:
	mov	r2, r3
	mov	r6, r3
	b	.L419
	UNWIND(.fnend)
	.size	HEVC_CtbRsAddrToTsAddr, .-HEVC_CtbRsAddrToTsAddr
	.align	2
	.global	HEVC_CtbTsAddrToRsAddr
	.type	HEVC_CtbTsAddrToRsAddr, %function
HEVC_CtbTsAddrToRsAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #204)
	sub	sp, sp, #204
	add	r0, r0, #24576
	mov	r7, r1
	ldr	lr, [r0, #3776]
	ldrb	r3, [lr, #13]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r0, r1
	beq	.L483
	ldr	r3, [lr, #72]
	ldr	r8, [lr, #68]
	mov	r2, r3
	str	r3, [fp, #-232]
	ldr	r3, [r0, #3772]
	cmp	r2, #0
	ldr	r4, [r3, #72]
	ldr	ip, [r3, #148]
	ble	.L465
	ldr	r3, [fp, #-232]
	add	r2, lr, #214
	sub	r1, fp, #216
	add	r0, r3, #107
	add	r0, lr, r0, lsl #1
.L464:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L464
.L465:
	cmp	r8, #0
	ble	.L463
	add	r0, r8, #87
	add	r2, lr, #174
	sub	r1, fp, #128
	add	r0, lr, r0, lsl #1
.L468:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L468
.L463:
	mov	r5, #1
	mov	r0, r4
	mov	r5, r5, asl ip
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, r5
	mov	r6, r0
	mov	r0, r4
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-232]
	cmp	r1, #0
	addne	r6, r6, #1
	cmp	r3, #0
	str	r6, [fp, #-240]
	ble	.L467
	mov	r9, #0
	ldr	r2, [fp, #-124]
	sub	r0, fp, #212
	mov	r10, r9
	mov	r3, r9
	mov	r1, r9
	mov	r6, r9
	mov	r4, r9
	add	r2, r2, #1
	str	r2, [fp, #-236]
.L469:
	cmp	r8, #0
	ble	.L479
	ldr	r6, [r0]
	ldr	r4, [fp, #-236]
	add	r6, r6, #1
	mla	ip, r6, r4, r3
	cmp	r7, ip
	blt	.L480
	mov	r5, #0
	mov	r1, r3
	mov	r2, r5
	mov	r3, ip
	sub	lr, fp, #124
	b	.L474
.L471:
	ldr	r4, [lr, #4]!
	mov	r1, r3
	add	r4, r4, #1
	mla	ip, r6, r4, r3
	cmp	ip, r7
	bgt	.L472
	mov	r3, ip
.L474:
	add	r2, r2, #1
	add	r5, r5, r4
	cmp	r2, r8
	bne	.L471
.L473:
	cmp	r3, r7
	bgt	.L478
	ldr	r2, [fp, #-232]
	add	r10, r10, #1
	add	r9, r9, r6
	add	r0, r0, #4
	cmp	r10, r2
	bne	.L469
.L478:
	mov	r3, r1
.L472:
	cmp	r4, #0
	beq	.L467
	rsb	r7, r3, r7
	mov	r1, r4
	mov	r0, r7
	bl	__aeabi_idiv
	ldr	r3, [fp, #-240]
	mov	r1, r4
	add	r4, r0, r9
	mov	r0, r7
	mul	r4, r4, r3
	bl	__aeabi_idivmod
	add	r1, r1, r5
	add	r0, r4, r1
.L483:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L479:
	mov	r5, #0
	b	.L473
.L480:
	ldr	r4, [fp, #-236]
	mov	r5, #0
	b	.L472
.L467:
	ldr	r1, .L485
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L483
.L486:
	.align	2
.L485:
	.word	.LC58
	UNWIND(.fnend)
	.size	HEVC_CtbTsAddrToRsAddr, .-HEVC_CtbTsAddrToRsAddr
	.align	2
	.global	HEVC_CalcTileMap
	.type	HEVC_CalcTileMap, %function
HEVC_CalcTileMap:
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
	ldr	r4, .L510
	mov	r6, r0
	add	r3, r6, #65536
	str	r0, [fp, #-60]
	mov	r2, #147456
	mov	r5, r3
	mov	r1, #0
	str	r3, [fp, #-56]
	add	r10, r6, #24576
	ldr	r3, [r4, #48]
	ldr	r0, .L510+4
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #36864
	mov	r1, #0
	ldr	r0, .L510+8
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #880
	mov	r1, #0
	add	r0, r5, #380
	blx	r3
	mov	r3, #0
	str	r3, [r5, #376]
	ldr	r9, [r10, #3776]
	ldr	r1, [r10, #3772]
	ldr	r2, [r9, #72]
	ldr	r8, [r1, #240]
	cmp	r2, r3
	strne	r3, [fp, #-72]
	strne	r3, [fp, #-76]
	beq	.L487
.L495:
	ldr	r2, [r9, #68]
	cmp	r2, #0
	ldr	r2, [fp, #-72]
	add	r2, r2, #108
	streq	r2, [fp, #-80]
	beq	.L496
	mov	r1, r2
	str	r2, [fp, #-80]
	mov	r7, r1, asl #1
	ldr	r1, [fp, #-76]
	mov	r2, #0
	str	r2, [fp, #-48]
	str	r2, [fp, #-52]
	mul	r1, r8, r1
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #376]
	str	r1, [fp, #-68]
.L494:
	add	r1, r2, #8192
	ldr	r0, [fp, #-60]
	add	r1, r1, #47
	add	r1, r0, r1, lsl #3
	str	r3, [r1, #4]
	ldrsh	r1, [r9, r7]
	cmp	r1, #0
	ldreq	r1, [fp, #-48]
	addeq	r1, r1, #88
	streq	r1, [fp, #-64]
	beq	.L490
	ldr	r2, [fp, #-48]
	mov	r5, #0
	ldr	r1, [fp, #-52]
	add	r2, r2, #88
	ldr	r0, [fp, #-68]
	str	r2, [fp, #-64]
	add	r6, r1, r0
	mov	ip, r2, asl #1
.L491:
	ldrsh	r2, [r9, ip]
	cmp	r2, #0
	beq	.L493
	ldr	r2, .L510+4
	rsb	lr, r3, r6
	mov	r4, r3
	add	r2, r2, r3, lsl #2
.L492:
	add	r1, lr, r3
	str	r1, [r2], #4
	ldr	r9, [r10, #3776]
	add	r3, r3, #1
	rsb	r1, r4, r3
	ldrsh	r0, [r9, ip]
	cmp	r0, r1
	bhi	.L492
.L493:
	ldrsh	r2, [r9, r7]
	add	r5, r5, #1
	add	r6, r6, r8
	cmp	r2, r5
	bhi	.L491
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #376]
.L490:
	ldr	r1, [fp, #-60]
	sub	ip, r3, #1
	ldr	r0, [fp, #-64]
	add	r1, r1, r2, lsl #3
	ldr	lr, [fp, #-48]
	add	r1, r1, #65536
	add	r2, r2, #1
	mov	r0, r0, asl #1
	add	lr, lr, #1
	str	ip, [r1, #384]
	ldr	r1, [fp, #-56]
	str	lr, [fp, #-48]
	str	r2, [r1, #376]
	ldr	r1, [r9, #68]
	ldrsh	r0, [r9, r0]
	cmp	r1, lr
	ldr	r1, [fp, #-52]
	add	r1, r1, r0
	str	r1, [fp, #-52]
	bhi	.L494
.L496:
	ldr	r2, [fp, #-80]
	ldr	r0, [fp, #-72]
	ldr	r1, [r9, #72]
	mov	r2, r2, asl #1
	add	r0, r0, #1
	cmp	r1, r0
	ldr	r1, [fp, #-76]
	ldrsh	r2, [r9, r2]
	str	r0, [fp, #-72]
	add	r2, r1, r2
	str	r2, [fp, #-76]
	bhi	.L495
.L487:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L511:
	.align	2
.L510:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+448
	.word	.LANCHOR3+592
	UNWIND(.fnend)
	.size	HEVC_CalcTileMap, .-HEVC_CalcTileMap
	.align	2
	.global	HEVC_WritePicMsg
	.type	HEVC_WritePicMsg, %function
HEVC_WritePicMsg:
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
	add	r8, r0, #53248
	mov	r5, r0
	ldr	r1, .L535
	mov	r0, #2
	ldr	r3, [r8, #1308]
	add	r4, r5, #61440
	ldr	r2, [r8, #1516]
	add	r7, r5, #65536
	bl	dprint_vfmw
	ldr	r1, .L535+4
	mov	r0, #4
	add	r9, r5, #24576
	bl	dprint_vfmw
	ldr	r3, [r8, #1500]
	mov	ip, #0
	ldr	lr, .L535+8
	add	r1, r5, #2960
	add	r0, r5, #62976
	str	r3, [r4, #2916]
	add	r1, r1, #8
	ldr	r3, [r8, #1380]
	mov	r2, #64
	ldr	r6, [r8, #1384]
	add	r0, r0, #212
	rsb	r6, r3, r6
	str	r6, [r4, #2920]
	ldr	r6, [r8, #1516]
	str	r6, [r4, #2908]
	ldr	r6, [r8, #1308]
	str	r6, [r4, #2912]
	ldr	r6, [r8, #1504]
	str	r6, [r4, #2924]
	ldr	r6, [r8, #1508]
	str	r6, [r4, #2928]
	ldr	r6, [r8, #1512]
	str	r6, [r4, #2932]
	ldr	r6, [r8, #1404]
	rsb	r3, r3, r6
	str	r3, [r4, #2936]
	ldr	r3, [r8, #1408]
	rsb	r3, r6, r3
	str	r3, [r4, #2940]
	str	ip, [r5, #208]
	ldr	r3, [r7, #2872]
	str	r3, [r7, #148]
	ldr	r3, [r9, #3772]
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	strb	ip, [r4, #1628]
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	strb	ip, [r4, #1629]
	ldrb	ip, [r3, #9]	@ zero_extendqisi2
	strb	ip, [r4, #1630]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	strb	ip, [r4, #1631]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2
	strb	ip, [r4, #1632]
	ldr	ip, [r3, #64]
	str	ip, [r4, #1636]
	ldr	ip, [r3, #116]
	strb	ip, [r4, #1640]
	ldr	ip, [r3, #244]
	sub	ip, ip, #1
	str	ip, [r4, #1644]
	ldr	ip, [r3, #240]
	sub	ip, ip, #1
	str	ip, [r4, #1648]
	ldr	ip, [r8, #1280]
	str	ip, [r4, #1652]
	ldr	ip, [r9, #3776]
	ldr	r6, [ip, #84]
	sub	r6, r6, #2
	str	r6, [r4, #1656]
	ldrb	r6, [ip, #11]	@ zero_extendqisi2
	strb	r6, [r4, #1660]
	ldrb	ip, [ip, #10]	@ zero_extendqisi2
	strb	ip, [r4, #1661]
	ldr	ip, [r3, #200]
	str	ip, [r4, #1664]
	ldr	ip, [r3, #208]
	str	ip, [r4, #1668]
	ldr	ip, [r3, #188]
	str	ip, [r4, #1672]
	ldr	ip, [r3, #196]
	str	ip, [r4, #1676]
	ldr	ip, [r3, #172]
	str	ip, [r4, #1680]
	ldr	ip, [r3, #180]
	str	ip, [r4, #1684]
	ldr	ip, [r3, #216]
	str	ip, [r4, #1688]
	ldr	ip, [r3, #140]
	str	ip, [r4, #1692]
	ldr	r6, [r3, #148]
	ldr	ip, [lr, #52]
	str	r6, [r4, #1696]
	ldr	lr, [r3, #112]
	str	lr, [r4, #1700]
	ldr	lr, [r3, #104]
	str	lr, [r4, #1704]
	ldr	lr, [r3, #124]
	str	lr, [r4, #1708]
	ldr	lr, [r3, #120]
	str	lr, [r4, #1712]
	ldr	lr, [r3, #108]
	str	lr, [r4, #1716]
	ldr	r3, [r3, #100]
	str	r3, [r4, #1720]
	blx	ip
	ldr	ip, [r9, #3772]
	add	r3, r5, #65280
	add	r1, r5, #64768
	add	r1, r1, #164
	mov	r0, r5
	ldr	lr, [ip, #76]
	mov	r2, r3
	add	r3, r3, #244
	add	r2, r2, #164
	str	lr, [r4, #1812]
	ldr	ip, [ip, #72]
	str	ip, [r4, #1816]
	bl	HEVC_CalcTileInfo
	subs	r6, r0, #0
	bne	.L533
	ldr	r3, [r9, #3776]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	strb	r2, [r4, #1840]
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	strb	r2, [r4, #1841]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	strb	r2, [r4, #1842]
	ldrb	r2, [r3, #14]	@ zero_extendqisi2
	strb	r2, [r4, #1843]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	strb	r2, [r4, #1844]
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	strb	r2, [r4, #1845]
	ldr	r2, [r9, #3772]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #148]
	rsb	r2, r1, r2
	str	r2, [r3, #88]
	ldr	r3, [r9, #3776]
	ldr	r2, [r3, #88]
	str	r2, [r4, #1848]
	ldr	r2, [r3, #52]
	str	r2, [r4, #1852]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	strb	r2, [r4, #1856]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	strb	r2, [r4, #1857]
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	strb	r2, [r4, #1858]
	ldr	r2, [r3, #60]
	str	r2, [r4, #1860]
	ldr	r2, [r3, #64]
	str	r2, [r4, #1864]
	ldr	r2, [r3, #72]
	sub	r2, r2, #1
	str	r2, [r4, #1868]
	ldr	r2, [r3, #68]
	sub	r2, r2, #1
	str	r2, [r4, #1872]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	strb	r2, [r4, #1661]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	strb	r3, [r4, #1660]
	ldr	r3, [r5, #220]
	str	r6, [r5, #236]
	cmp	r3, #1
	beq	.L524
	ldr	r3, [r8, #1332]
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L534
	ldr	r2, [r9, #680]
	ldr	r3, [r9, #684]
	cmp	r2, #0
	beq	.L517
	cmp	r3, #0
	beq	.L517
	add	r3, r5, #64512
	add	r2, r5, #64256
	add	r2, r2, #148
	ldr	r0, [r5, #276]
	mov	r1, r3
	add	r3, r3, #160
	add	r1, r1, #20
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r9, #680]
	add	r2, r5, #64512
	ldr	r3, [r3, #8]
	mov	r1, r2
	add	r2, r2, #24
	add	r1, r1, #152
	str	r3, [r4, #2908]
	ldr	r0, [r5, #276]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r8, #1308]
	str	r3, [r4, #2912]
	ldr	r3, [r9, #696]
	str	r3, [r4, #3228]
	ldr	r3, [r9, #684]
	ldr	r3, [r3, #16]
	str	r3, [r7, #368]
	ldr	r3, [r9, #684]
	ldr	r3, [r3, #76]
	str	r3, [r7, #372]
	ldr	ip, [r5, #2832]
	cmp	ip, #0
	str	ip, [r7, #140]
	beq	.L519
	add	r2, r5, #2896
	add	r3, r7, #72
	add	r2, r2, #4
	mov	r0, r6
.L520:
	add	r0, r0, #1
	ldr	r1, [r2, #4]!
	cmp	r0, ip
	str	r1, [r3, #4]!
	bne	.L520
.L519:
	add	r7, r5, #63232
	mov	r6, #0
	add	r7, r7, #88
.L521:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_8x8
	cmp	r6, #4
	add	r7, r7, #64
	bne	.L521
	add	r2, r5, #63488
	mov	r0, r6
	add	r2, r2, #88
	mov	r1, r5
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #63488
	add	r2, r2, #152
	mov	r1, r5
	mov	r0, #5
	add	r7, r5, #63744
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #63488
	add	r2, r2, #216
	mov	r1, r5
	mov	r0, #0
	add	r7, r7, #88
	bl	HEVC_WriteQmatrix_16x16
	add	r2, r5, #63744
	add	r2, r2, #24
	mov	r1, r5
	mov	r0, #1
	mov	r6, #2
	bl	HEVC_WriteQmatrix_16x16
.L522:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_16x16
	cmp	r6, #6
	add	r7, r7, #64
	bne	.L522
	add	r2, r5, #64000
	mov	r1, r5
	add	r2, r2, #88
	mov	r0, #0
	bl	HEVC_WriteQmatrix_32x32
	add	r2, r5, #64000
	add	r2, r2, #152
	mov	r1, r5
	mov	r0, #1
	add	r7, r5, #64000
	bl	HEVC_WriteQmatrix_32x32
	add	r7, r7, #216
	mov	r6, #0
.L523:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_4x4
	cmp	r6, #6
	add	r7, r7, #16
	bne	.L523
	ldr	r1, [r5, #2300]
	mov	r0, #0
	ldr	r3, [r5, #2304]
	ldr	r2, [r5, #2292]
	ldr	ip, [r5, #2296]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #2872]
	ldr	r1, [r5, #2316]
	ldr	r3, [r5, #2320]
	ldr	r2, [r5, #2308]
	ldr	ip, [r5, #2312]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #2876]
	ldr	r3, [r8, #1308]
	str	r3, [r4, #2904]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L524:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L533:
	ldr	r2, .L535+12
	mov	r0, #1
	ldr	r1, .L535+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L517:
	ldr	r1, .L535+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L534:
	ldr	r3, [r8, #1332]
	mov	r0, #1
	ldr	r1, .L535+24
	ldr	r2, [r3, #32]
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L536:
	.align	2
.L535:
	.word	.LC59
	.word	.LC60
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+208
	.word	.LC61
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	HEVC_WritePicMsg, .-HEVC_WritePicMsg
	.align	2
	.global	HEVC_CheckListX
	.type	HEVC_CheckListX, %function
HEVC_CheckListX:
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
	add	r3, r0, #53248
	ldrb	r3, [r3, #2003]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, r0, #55040
	addeq	r3, r3, #208
	beq	.L539
	ldrsb	r3, [r0, #9]
	cmp	r3, #0
	addne	r3, r0, #58880
	addne	r3, r3, #100
	beq	.L572
.L539:
	ldr	ip, [r3, #160]
	ldr	lr, [r3, #164]
	cmp	ip, #16
	bhi	.L573
	cmp	lr, #16
	bhi	.L543
	cmp	ip, #0
	beq	.L544
	ldr	r3, [r0, #2368]
	cmp	r3, #0
	beq	.L557
	ldr	r3, [r3, #36]
	cmp	r3, #0
	addne	r1, r0, #2368
	movne	r2, #0
	bne	.L549
	b	.L574
.L550:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L545
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L546
.L549:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L550
.L544:
	cmp	lr, #0
	beq	.L569
	ldr	r3, [r0, #2436]
	cmp	r3, #0
	beq	.L560
	ldr	r3, [r3, #36]
	cmp	r3, #0
	addne	r0, r0, #2432
	movne	r2, #0
	addne	r0, r0, #4
	bne	.L555
	b	.L575
.L556:
	ldr	r3, [r0, #4]!
	cmp	r3, #0
	beq	.L551
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L552
.L555:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L556
.L569:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L557:
	mov	r2, r3
.L545:
	ldr	r1, .L576
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L574:
	mov	r2, r3
.L546:
	ldr	r1, .L576+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L560:
	mov	r2, r3
.L551:
	ldr	r1, .L576+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L575:
	mov	r2, r3
.L552:
	ldr	r1, .L576+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L572:
	mov	r0, r3
	ldr	r2, .L576+16
	ldr	r1, .L576+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L543:
	mov	r2, lr
	mov	r3, #17
	ldr	r1, .L576+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L573:
	mov	r2, ip
	mov	r3, #17
	ldr	r1, .L576+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L577:
	.align	2
.L576:
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LANCHOR1+228
	.word	.LC64
	.word	.LC66
	.word	.LC65
	UNWIND(.fnend)
	.size	HEVC_CheckListX, .-HEVC_CheckListX
	.align	2
	.global	HEVC_WriteSliceMsg
	.type	HEVC_WriteSliceMsg, %function
HEVC_WriteSliceMsg:
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
	UNWIND(.pad #76)
	sub	sp, sp, #76
	mov	r4, r0
	bl	HEVC_CheckListX
	subs	r3, r0, #0
	str	r3, [fp, #-112]
	bne	.L618
	ldr	r0, [r4, #208]
	ldr	r3, [r4, #144]
	cmp	r0, r3
	bcs	.L656
	add	r9, r4, #65536
	mov	r5, #1360
	ldr	r7, [fp, #-112]
	mov	r2, r5
	ldr	r6, [r9, #2872]
	add	r8, r4, #53248
	ldr	r3, .L660
	mov	r1, r7
	mla	r6, r5, r0, r6
	ldr	r3, [r3, #48]
	mov	r0, r6
	blx	r3
	ldr	r3, .L660
	mov	r2, #64
	mov	r1, r7
	sub	r0, fp, #108
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r4, #208]
	ldr	r2, [r4, #144]
	add	r3, r3, #1
	str	r3, [r4, #208]
	cmp	r3, r2
	ldrcc	r2, [r9, #2872]
	ldrcs	r3, [fp, #-112]
	mlacc	r3, r5, r3, r2
	str	r3, [r6, #1356]
	ldr	r3, [r4, #248]
	ldr	r0, [r8, #2076]
	add	r1, r3, #16896
	add	r2, r3, #1
	add	r1, r1, #208
	str	r0, [r4, r1, asl #2]
	ldr	r3, [r4, #172]
	str	r2, [r4, #248]
	add	r3, r3, #1
	str	r3, [r4, #172]
	ldr	r2, [r9, #3680]
	mov	r0, r3, asl #5
	ldr	r1, [r8, #2060]
	sub	r3, r0, r3, asl #2
	str	r3, [fp, #-116]
	add	r3, r2, r3
	str	r1, [r3, #8]
	ldr	r2, [r4, #2364]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	r1, #1
	cmpls	r1, r3
	bcs	.L583
	add	r0, r6, r1, lsl #2
.L584:
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r1, r1, #1
	add	r2, r2, r3
	ldr	r2, [r2, #60]
	str	r2, [r0, #8]
	ldr	r2, [r4, #2364]
	add	r2, r2, r3
	ldr	r2, [r2, #56]
	str	r2, [r0], #4
	ldr	r2, [r4, #2364]
	add	r3, r2, r3
	ldr	r3, [r3, #64]
	str	r3, [r0, #12]
	ldr	r2, [r4, #2364]
	ldr	r3, [r2, #8]
	cmp	r3, r1
	movhi	ip, #1
	movls	ip, #0
	cmp	r1, #1
	movhi	ip, #0
	cmp	ip, #0
	bne	.L584
.L583:
	cmp	r3, #1
	addls	r3, r6, r3, lsl #2
	addls	r1, r6, #8
	movls	r2, #0
	bhi	.L589
.L588:
	str	r2, [r3, #8]
	str	r2, [r3], #4
	cmp	r3, r1
	str	r2, [r3, #12]
	bne	.L588
.L589:
	ldrb	r3, [r8, #2003]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L657
.L587:
	add	r5, r4, #57344
	ldr	r3, [r5, #1796]
	cmp	r3, #0
	beq	.L590
	add	r0, r4, #2368
	add	r10, r6, #112
	add	lr, r6, #368
	mov	r1, #0
.L591:
	ldr	ip, [r0]
	sub	r7, fp, #44
	add	r1, r1, #1
	ldr	r2, [ip, #36]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #16128
	add	r3, r3, #4
	add	r2, r7, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	str	r3, [r2, #-64]
	ldr	r3, [ip, #16]
	str	r3, [r10, #4]!
	ldr	r3, [r0], #4
	ldr	r3, [r3, #36]
	ldr	r3, [r3, #28]
	str	r3, [lr, #4]!
	ldr	r3, [r5, #1796]
	cmp	r3, r1
	bhi	.L591
	ldr	r2, [r5, #1800]
	cmp	r2, #0
	beq	.L592
.L617:
	add	r1, r4, #2432
	add	r10, r6, #176
	add	r1, r1, #4
	add	lr, r6, #432
	mov	r0, #0
.L593:
	ldr	ip, [r1]
	sub	r7, fp, #44
	add	r0, r0, #1
	ldr	r2, [ip, #36]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #16128
	add	r3, r3, #4
	add	r2, r7, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	str	r3, [r2, #-64]
	ldr	r3, [ip, #16]
	str	r3, [r10, #4]!
	ldr	r3, [r1], #4
	ldr	r3, [r3, #36]
	ldr	r3, [r3, #28]
	str	r3, [lr, #4]!
	ldr	r2, [r5, #1800]
	cmp	r2, r0
	bhi	.L593
	ldr	r3, [r5, #1796]
.L592:
	cmp	r3, #0
	beq	.L594
	ldr	r1, [r6, #372]
	ldr	lr, [r8, #1280]
	add	r1, r1, #740
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	lr, r1
	blt	.L624
	add	ip, r6, #372
	mov	r0, #0
	b	.L596
.L597:
	ldr	r1, [ip, #4]!
	add	r1, r1, #740
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	r1, lr
	bgt	.L624
.L596:
	add	r0, r0, #1
	cmp	r0, r3
	bne	.L597
.L594:
	ldr	r1, [r5, #1696]
	cmp	r1, #0
	bne	.L653
	cmp	r2, #0
	beq	.L653
	ldr	r3, [r6, #436]
	ldr	ip, [r8, #1280]
	add	r3, r3, #740
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	ip, r3
	blt	.L595
	add	r0, r6, #436
	b	.L598
.L599:
	ldr	r3, [r0, #4]!
	add	r3, r3, #740
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	r3, ip
	bgt	.L624
.L598:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L599
.L653:
	mov	r1, #1
.L595:
	strb	r1, [r6, #24]
	ldrb	r3, [r8, #2003]	@ zero_extendqisi2
	strb	r3, [r6, #25]
	ldr	r3, [r5, #1692]
	str	r3, [r6, #28]
	ldrb	r2, [r5, #1646]	@ zero_extendqisi2
	strb	r2, [r6, #32]
	ldr	r2, [r5, #1716]
	str	r2, [r6, #36]
	ldr	r2, [r4, #220]
	cmp	r2, #0
	bne	.L600
	ldr	r10, [r8, #1332]
	ldr	r1, [r4, #208]
	ldr	r0, [r10, #436]
	sub	r2, r1, #1
	mla	r0, r0, r2, r3
	bl	__aeabi_uidiv
	str	r0, [r10, #68]
.L600:
	ldr	r3, [r5, #1696]
	cmp	r3, #0
	bne	.L601
	ldrb	r3, [r5, #1647]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L602
	ldr	r3, [r5, #1748]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #436]
	mov	r7, r3
.L603:
	str	r7, [r6, #40]
	add	r10, r4, #24576
	ldr	r3, [r5, #1748]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #1647]	@ zero_extendqisi2
	strb	r3, [r6, #52]
	ldr	r3, [r5, #1752]
	str	r3, [r6, #44]
	ldr	r3, [r5, #1804]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #60]
	ldr	r3, [r5, #1808]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #56]
	ldrb	r2, [r5, #1643]	@ zero_extendqisi2
	strb	r2, [r6, #64]
	ldrb	r2, [r5, #1645]	@ zero_extendqisi2
	strb	r2, [r6, #65]
	ldr	r2, [r5, #1796]
	str	r2, [r6, #68]
	ldr	r2, [r5, #1800]
	str	r2, [r6, #72]
	ldr	r2, [r5, #1696]
	str	r2, [r6, #76]
	ldr	r2, [r8, #2080]
	str	r2, [r6, #80]
	ldr	r2, [r10, #3772]
	ldr	r0, [r8, #2080]
	ldr	r1, [r2, #240]
	bl	__aeabi_uidivmod
	str	r1, [r6, #84]
	ldr	r2, [r10, #3772]
	ldr	r0, [r8, #2080]
	ldr	r1, [r2, #240]
	bl	__aeabi_uidiv
	str	r0, [r6, #88]
	mov	r0, r4
	ldr	r1, [r8, #2080]
	bl	HEVC_CtbRsAddrToTsAddr
	str	r0, [r6, #92]
	ldr	r2, [r5, #1760]
	str	r2, [r6, #96]
	ldr	r2, [r5, #1764]
	str	r2, [r6, #100]
	ldr	r2, [r5, #1772]
	str	r2, [r6, #104]
	ldr	r2, [r5, #1768]
	str	r2, [r6, #108]
	ldrb	r2, [r5, #1642]	@ zero_extendqisi2
	strb	r2, [r6, #112]
	ldrb	r2, [r5, #1641]	@ zero_extendqisi2
	strb	r2, [r6, #113]
	ldrb	r2, [r5, #1649]	@ zero_extendqisi2
	strb	r2, [r6, #114]
	ldrb	r2, [r5, #1650]	@ zero_extendqisi2
	strb	r2, [r6, #115]
	ldr	r3, [r10, #3776]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L608
	ldr	r2, [r5, #1696]
	cmp	r2, #1
	beq	.L609
.L608:
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L658
.L654:
	add	r8, r4, #61440
.L611:
	ldrb	r3, [r5, #1643]	@ zero_extendqisi2
	cmp	r3, #0
	subne	r3, fp, #44
	movne	r2, r7
	addne	r10, r3, r2, lsl #2
	ldrne	r3, [r10, #-64]
	strne	r3, [r6, #564]
	ldr	r3, [r4, #220]
	cmp	r3, #0
	bne	.L614
	ldr	r2, [r9, #3680]
	ldr	r0, [fp, #-116]
	ldr	r1, [r4, #2364]
	add	r2, r2, r0
	str	r1, [r2, #24]
	str	r3, [r4, #2364]
.L614:
	ldrb	r3, [r8, #1845]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L633
	ldr	r3, [r4, #248]
	cmp	r3, #1
	beq	.L659
	add	r1, r4, r3, lsl #3
	ldr	r0, [r6, #92]
	add	r1, r1, #66560
	add	r2, r3, #8320
	add	r2, r2, #28
	sub	r0, r0, #1
	str	r0, [r1, #224]
	sub	r3, r3, #1
	ldr	r1, [r6, #92]
	add	r2, r4, r2, lsl #3
	str	r1, [r2, #4]
.L616:
	ldr	r1, [r8, #1648]
	add	r3, r4, r3, lsl #3
	ldr	r2, [r8, #1644]
	add	r3, r3, #66560
	mla	r2, r1, r2, r2
	add	r2, r2, r1
	str	r2, [r3, #240]
	ldr	r1, [r6, #92]
	sub	r1, r1, #1
	cmp	r1, #36864
	bcs	.L633
	mov	r0, r4
	bl	HEVC_CtbTsAddrToRsAddr
	str	r0, [r6, #568]
.L633:
	ldr	r0, [fp, #-112]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L624:
	mov	r1, #0
	b	.L595
.L601:
	cmp	r3, #1
	movne	r3, #0
	movne	r7, r3
	bne	.L603
.L602:
	ldr	r3, [r5, #1748]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #372]
	mov	r7, r3
	b	.L603
.L657:
	ldr	r3, .L660
	add	r1, r4, #55040
	add	r0, r4, #58880
	add	r1, r1, #208
	add	r0, r0, #100
	movw	r2, #3732
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #1
	strb	r3, [r4, #9]
	b	.L587
.L658:
	ldr	r3, [r5, #1696]
	cmp	r3, #0
	bne	.L654
.L609:
	ldr	r0, [r5, #3228]
	add	r8, r4, #61440
	ldr	r3, .L660
	add	r1, r8, #168
	mov	r2, #64
	str	r0, [r6, #580]
	add	r0, r6, #588
	ldr	ip, [r8, #164]
	ldr	r3, [r3, #52]
	str	ip, [r6, #584]
	blx	r3
	ldr	r3, .L660
	add	r1, r4, #60672
	mov	r2, #64
	add	r1, r1, #100
	add	r0, r6, #716
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L660
	add	r1, r8, #232
	mov	r2, #128
	add	r0, r6, #844
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L660
	add	r1, r4, #61696
	add	r0, r6, #1088
	add	r1, r1, #104
	add	r0, r0, #12
	ldr	r3, [r3, #52]
	mov	r2, #128
	blx	r3
	ldr	r3, [r5, #1696]
	cmp	r3, #0
	bne	.L611
	ldr	r3, .L660
	add	r1, r4, #61696
	add	r1, r1, #232
	mov	r2, #64
	add	r0, r6, #652
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L660
	add	r1, r4, #61184
	mov	r2, #64
	add	r1, r1, #100
	add	r0, r6, #780
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L660
	add	r1, r4, #61952
	mov	r2, #128
	add	r1, r1, #40
	add	r0, r6, #972
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L660
	add	r1, r4, #61952
	add	r0, r6, #1216
	add	r1, r1, #168
	mov	r2, #128
	ldr	r3, [r3, #52]
	add	r0, r0, #12
	blx	r3
	b	.L611
.L659:
	ldr	r2, [r6, #92]
	mov	r3, #0
	str	r2, [r9, #1260]
	b	.L616
.L590:
	ldr	r3, [r5, #1800]
	cmp	r3, #0
	bne	.L617
	b	.L653
.L618:
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L633
.L656:
	mov	r2, r0
	ldr	r1, .L660+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L633
.L661:
	.align	2
.L660:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC71
	UNWIND(.fnend)
	.size	HEVC_WriteSliceMsg, .-HEVC_WriteSliceMsg
	.align	2
	.global	HEVC_GetVirAddr
	.type	HEVC_GetVirAddr, %function
HEVC_GetVirAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetVirAddr, .-HEVC_GetVirAddr
	.align	2
	.global	HEVC_GetPhyAddr
	.type	HEVC_GetPhyAddr, %function
HEVC_GetPhyAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetPhyAddr, .-HEVC_GetPhyAddr
	.align	2
	.global	HEVC_CfgVDMReg
	.type	HEVC_CfgVDMReg, %function
HEVC_CfgVDMReg:
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
	add	ip, r0, #53248
	add	r1, r0, #61440
	mov	r2, r0
	add	lr, r0, #65536
	ldr	r3, [ip, #1300]
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r1, #2960]
	ldr	r3, [ip, #1304]
	str	r3, [r1, #2952]
	ldr	r3, [r2, #208]
	str	r3, [lr, #144]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CfgVDMReg, .-HEVC_CfgVDMReg
	.align	2
	.global	HEVC_IsRefForCurrPic
	.type	HEVC_IsRefForCurrPic, %function
HEVC_IsRefForCurrPic:
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
	add	r3, r0, #53248
	str	r3, [fp, #-48]
	mov	r6, r0
	ldr	r3, [r3, #2076]
	ldr	r2, [r0, #156]
	cmp	r3, #0
	blt	.L667
	cmp	r3, r2
	bge	.L667
	ldr	r2, [r0, #2352]
	movw	r1, #2024
	mla	r3, r1, r3, r2
	ldr	r2, [r0, #152]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	blt	.L671
	cmp	r3, r2
	bge	.L671
	ldr	r2, [r0, #2348]
	movw	r1, #26164
	add	r0, r0, #57344
	mov	r9, #1
	str	r0, [fp, #-52]
	mla	r3, r1, r3, r2
	ldr	r2, [r0, #1188]
	ldr	r1, [r0, #1192]
	ldr	ip, [r0, #1196]
	add	r10, r1, r2
	str	r2, [fp, #-60]
	cmp	r10, ip
	str	r1, [fp, #-64]
	ldr	r3, [r3, #128]
	mov	r4, r10
	mov	r9, r9, asl r3
	bcs	.L682
	cmp	r10, #15
	bgt	.L674
	ldr	r3, [fp, #-48]
	add	r5, r10, #14656
	add	r5, r5, #7
	str	r10, [fp, #-68]
	str	r6, [fp, #-56]
	ldr	r3, [r3, #1280]
	add	r5, r6, r5, lsl #2
	mov	r6, ip
	mov	r10, r3
	b	.L676
.L694:
	cmp	r6, r4
	bls	.L692
	cmp	r4, #16
	beq	.L693
.L676:
	ldr	r7, [r5, #4]!
	mov	r1, r9
	mov	r0, r10
	mov	r8, r10
	ldr	r2, [r5, #-1884]
	cmp	r2, #0
	bne	.L677
	bl	__aeabi_idivmod
	mov	r0, r7
	mov	r8, r1
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r7, r1
.L677:
	cmp	r8, r7
	add	r4, r4, #1
	bne	.L694
	ldr	r10, [fp, #-68]
	mov	r4, #1
	ldr	r6, [fp, #-56]
.L673:
	cmp	r10, #0
	beq	.L669
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	ip, [r2, #2048]
	ldr	r3, [r3, #1244]
	ldr	r0, [r2, #1280]
	add	r3, ip, r3
	cmp	r0, r3
	beq	.L686
	add	r6, r6, #58368
	mov	r1, #0
	add	r6, r6, #220
	b	.L679
.L680:
	ldr	r3, [r6, #4]!
	add	r3, ip, r3
	cmp	r3, r0
	beq	.L686
.L679:
	add	r1, r1, #1
	cmp	r1, r10
	beq	.L669
	cmp	r1, #17
	bne	.L680
	ldr	r3, [fp, #-64]
	mov	r0, #0
	ldr	r2, [fp, #-60]
	str	r1, [sp]
	str	r3, [sp, #8]
	mov	r3, r1
	str	r2, [sp, #4]
	movw	r2, #7110
	ldr	r1, .L695
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L671:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #7061
	ldr	r1, .L695+4
	mov	r4, r0
	bl	dprint_vfmw
.L669:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L667:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #7049
	ldr	r1, .L695+8
	mov	r4, r0
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L693:
	mov	ip, r6
	ldr	r6, [fp, #-56]
.L674:
	mov	r3, r4
	mov	r1, #16
	movw	r2, #7081
	str	r1, [sp]
	mov	r0, #0
	str	ip, [sp, #4]
	ldr	r1, .L695+12
	mov	r4, r0
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	ldr	r2, [r3, #1188]
	ldr	r3, [r3, #1192]
	str	r2, [fp, #-60]
	add	r10, r3, r2
	str	r3, [fp, #-64]
	b	.L673
.L692:
	ldr	r10, [fp, #-68]
	mov	r4, #0
	ldr	r6, [fp, #-56]
	b	.L673
.L686:
	mov	r4, #1
	b	.L669
.L682:
	mov	r4, #0
	b	.L673
.L696:
	.align	2
.L695:
	.word	.LC75
	.word	.LC73
	.word	.LC72
	.word	.LC74
	UNWIND(.fnend)
	.size	HEVC_IsRefForCurrPic, .-HEVC_IsRefForCurrPic
	.align	2
	.global	HEVC_RepairList
	.type	HEVC_RepairList, %function
HEVC_RepairList:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r3, r0, #53248
	str	r3, [fp, #-56]
	mov	ip, r0
	ldr	r3, [r3, #2060]
	cmp	r3, #1
	beq	.L714
	cmp	r3, #2
	beq	.L715
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [fp, #-48]
	beq	.L699
	ldr	r2, .L724
	mov	r0, #1
	ldr	r1, .L724+4
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L714:
	str	r3, [fp, #-48]
.L699:
	add	r8, ip, #55296
	add	r9, ip, #2368
	add	r8, r8, #108
	mov	r10, #0
.L712:
	ldr	r1, [r8, #4]!
	cmp	r1, #0
	beq	.L702
	ldr	r3, [r9]
	cmp	r3, #0
	bne	.L716
	mov	r2, r9
	mov	r4, r3
	b	.L704
.L706:
	ldr	r6, [r2, #4]!
	cmp	r6, #0
	bne	.L722
.L704:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L706
	mov	r4, #255
.L705:
	ldr	r2, [ip, #2356]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L707
	ldr	r2, [fp, #-56]
	ldr	r6, [r2, #1332]
	add	r6, r6, #36
.L703:
	mov	r7, r9
	mov	r5, #0
	b	.L713
.L709:
	ldr	r3, [r7, #4]!
.L713:
	cmp	r3, #0
	beq	.L723
.L708:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L709
.L710:
	ldr	r3, [fp, #-48]
	add	r10, r10, #1
	add	r9, r9, #68
	cmp	r10, r3
	bcc	.L712
.L715:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L702:
	ldr	r3, [ip, #2356]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L710
	mov	r3, #1
	str	r3, [r8]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #1332]
	add	r3, r3, #36
	str	r3, [r9]
	b	.L710
.L723:
	sxtb	r2, r4
	str	r5, [sp]
	str	r2, [sp, #4]
	mov	r3, r10
	ldr	r2, .L724
	mov	r0, #1
	ldr	r1, .L724+8
	str	ip, [fp, #-52]
	bl	dprint_vfmw
	str	r6, [r7]
	ldr	ip, [fp, #-52]
	b	.L708
.L722:
	uxtb	r4, r4
	cmp	r4, #255
	bne	.L703
	b	.L705
.L716:
	mov	r6, r3
	mov	r4, #0
	b	.L703
.L707:
	mov	r3, r10
	ldr	r2, .L724
	ldr	r1, .L724+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L725:
	.align	2
.L724:
	.word	.LANCHOR1+244
	.word	.LC76
	.word	.LC78
	.word	.LC77
	UNWIND(.fnend)
	.size	HEVC_RepairList, .-HEVC_RepairList
	.align	2
	.global	HEVC_InitListX
	.type	HEVC_InitListX, %function
HEVC_InitListX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #156)
	sub	sp, sp, #156
	subs	r7, r0, #0
	beq	.L762
	ldr	r3, .L794
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #180
	ldr	r3, [r3, #48]
	blx	r3
	ldr	lr, [r7, #2552]
	cmp	lr, #0
	beq	.L763
	mov	r0, #0
	add	r1, r7, #2624
	mov	r3, r0
	b	.L730
.L729:
	cmp	r3, lr
	beq	.L728
.L730:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L729
	ldr	ip, [r2, #52]
	cmp	ip, #0
	bne	.L729
	ldr	ip, [r2, #56]
	cmp	ip, #1
	subeq	ip, fp, #44
	addeq	r2, r2, #36
	addeq	ip, ip, r0, lsl #2
	addeq	r0, r0, #1
	streq	r2, [ip, #-136]
	cmp	r3, lr
	bne	.L730
.L728:
	ldr	r4, [r7, #2556]
	cmp	r4, #0
	beq	.L764
	add	r1, r7, #2688
	mov	ip, r0
	add	r1, r1, #4
	mov	r3, #0
	b	.L733
.L732:
	cmp	r3, r4
	beq	.L790
.L733:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L732
	ldr	lr, [r2, #52]
	cmp	lr, #0
	bne	.L732
	ldr	lr, [r2, #56]
	cmp	lr, #1
	subeq	lr, fp, #44
	addeq	r2, r2, #36
	addeq	lr, lr, ip, lsl #2
	addeq	ip, ip, #1
	streq	r2, [lr, #-136]
	cmp	r3, r4
	bne	.L733
.L790:
	rsb	r4, r0, ip
.L731:
	ldr	r5, [r7, #2548]
	cmp	r5, #0
	beq	.L765
	add	lr, r7, #2752
	mov	r9, ip
	add	lr, lr, #8
	mov	r2, #0
	b	.L736
.L735:
	cmp	r2, r5
	beq	.L791
.L736:
	ldr	r3, [lr, #4]!
	add	r2, r2, #1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L735
	ldr	r1, [r3, #52]
	cmp	r1, #1
	bne	.L735
	ldr	r1, [r3, #56]
	sub	r6, fp, #44
	add	r6, r6, r9, lsl #2
	add	r3, r3, #36
	cmp	r1, #0
	addeq	r9, r9, #1
	streq	r3, [r6, #-136]
	cmp	r2, r5
	bne	.L736
.L791:
	rsb	r5, r0, r9
	rsb	r5, r4, r5
.L734:
	cmp	r9, #0
	beq	.L792
	add	r3, r7, #53248
	str	r3, [fp, #-184]
	ldr	r3, [r3, #2060]
	cmp	r3, #0
	str	r3, [fp, #-188]
	beq	.L793
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2168]
	ldr	r5, [r3, #2172]
	cmp	r4, #0
	str	r4, [r3, #2160]
	str	r5, [r3, #2164]
	beq	.L755
.L761:
	add	r1, r7, #57344
	add	r2, r7, #2352
	add	r8, r7, #58624
	add	r2, r2, #12
	ldrb	r10, [r1, #1376]	@ zero_extendqisi2
	add	r8, r8, #100
	str	r5, [fp, #-192]
	mov	r6, #0
	mov	r5, r10
	mov	r10, r4
	mov	r4, r2
.L748:
	cmp	r5, #0
	mov	r1, r9
	mov	r0, r6
	ldrne	r1, [r8]
	bne	.L747
	bl	__aeabi_uidivmod
.L747:
	sub	r3, fp, #44
	add	r6, r6, #1
	add	r3, r3, r1, lsl #2
	cmp	r10, r6
	add	r8, r8, #4
	ldr	r3, [r3, #-136]
	str	r3, [r4, #4]!
	bhi	.L748
	ldr	r3, [fp, #-188]
	ldr	r5, [fp, #-192]
	cmp	r3, #0
	bne	.L789
.L749:
	cmp	r5, #0
	beq	.L751
	add	r2, r7, #57344
	add	r6, r7, #58624
	add	r6, r6, #228
	add	r8, r7, #2432
	ldrb	r10, [r2, #1377]	@ zero_extendqisi2
	mov	r4, #0
.L754:
	cmp	r10, #0
	mov	r1, r9
	mov	r0, r4
	ldrne	r1, [r6]
	bne	.L753
	bl	__aeabi_uidivmod
.L753:
	sub	r3, fp, #44
	add	r4, r4, #1
	add	r3, r3, r1, lsl #2
	cmp	r4, r5
	add	r6, r6, #4
	ldr	r3, [r3, #-68]
	str	r3, [r8, #4]!
	bne	.L754
.L789:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2160]
	ldr	r5, [r3, #2164]
.L750:
	cmp	r4, #16
	bhi	.L759
.L755:
	add	r4, r4, #588
	add	r2, r7, #2432
	add	r4, r4, #3
	add	r4, r7, r4, lsl #2
.L758:
	ldr	r3, [r7, #2368]
	str	r3, [r4, #4]!
	cmp	r4, r2
	bne	.L758
.L759:
	cmp	r5, #16
	bhi	.L757
	add	r5, r5, #608
	add	r2, r7, #2496
	add	r2, r2, #4
	add	r5, r7, r5, lsl #2
.L760:
	ldr	r3, [r7, #2436]
	str	r3, [r5, #4]!
	cmp	r5, r2
	bne	.L760
.L757:
	mov	r0, #0
.L788:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L793:
	cmp	r4, #0
	beq	.L740
	sub	r3, fp, #180
	ldr	r2, [fp, #-188]
	add	lr, r3, r0, lsl #2
	sub	r1, fp, #116
.L741:
	add	r2, r2, #1
	ldr	r3, [lr], #4
	cmp	r2, r4
	str	r3, [r1, #4]!
	bne	.L741
.L740:
	cmp	r0, #0
	beq	.L742
	add	r1, r4, #16
	sub	lr, fp, #180
	mov	r2, #0
	add	r1, lr, r1, lsl #2
.L743:
	add	r2, r2, #1
	ldr	r3, [lr], #4
	cmp	r2, r0
	str	r3, [r1, #4]!
	bne	.L743
	add	r4, r4, r2
.L742:
	cmp	r5, #0
	beq	.L744
	add	r4, r4, #16
	sub	r3, fp, #180
	add	ip, r3, ip, lsl #2
	mov	r2, #0
	add	r4, r3, r4, lsl #2
.L745:
	add	r2, r2, #1
	ldr	r3, [ip], #4
	cmp	r2, r5
	str	r3, [r4, #4]!
	bne	.L745
.L744:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2168]
	ldr	r5, [r3, #2172]
	cmp	r4, #0
	str	r4, [r3, #2160]
	str	r5, [r3, #2164]
	bne	.L761
	b	.L749
.L792:
	ldr	r3, .L794
	add	r4, r7, #53248
	mov	r2, #136
	mov	r1, r9
	str	r9, [r4, #2160]
	add	r0, r7, #2368
	ldr	ip, [r3, #48]
	str	r9, [r4, #2164]
	blx	ip
	ldr	r2, [r7, #2356]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L757
	ldr	r2, [r4, #1332]
	mov	r3, #1
	mov	r0, r9
	str	r3, [r4, #2160]
	add	r3, r2, #36
	str	r3, [r7, #2368]
	b	.L788
.L763:
	mov	r0, lr
	b	.L728
.L764:
	mov	ip, r0
	b	.L731
.L765:
	mov	r9, ip
	b	.L734
.L751:
	ldr	r3, .L794
	add	r0, r7, #2432
	add	r0, r0, #4
	mov	r2, #68
	add	r1, r7, #2368
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2160]
	str	r4, [r3, #2164]
	mov	r5, r4
	b	.L750
.L762:
	mvn	r0, #0
	b	.L788
.L795:
	.align	2
.L794:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_InitListX, .-HEVC_InitListX
	.align	2
	.global	HEVC_DecList
	.type	HEVC_DecList, %function
HEVC_DecList:
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
	add	r3, r0, #53248
	mov	r4, r0
	ldr	r2, [r3, #2060]
	cmp	r2, #2
	beq	.L801
	bl	HEVC_InitListX
	cmp	r0, #0
	bne	.L802
	mov	r0, r4
	bl	HEVC_RepairList
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L803
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L801:
	mov	r0, #0
	str	r0, [r3, #2160]
	str	r0, [r3, #2164]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L802:
	ldr	r1, .L803+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L804:
	.align	2
.L803:
	.word	.LC80
	.word	.LC79
	UNWIND(.fnend)
	.size	HEVC_DecList, .-HEVC_DecList
	.align	2
	.global	HEVC_RemoveApcStore
	.type	HEVC_RemoveApcStore, %function
HEVC_RemoveApcStore:
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
	add	r5, r0, r1, lsl #2
	mov	r4, r0
	ldr	r2, [r5, #2560]
	ldr	r3, [r2, #28]
	cmp	r3, #16
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r3, r3, #708
	mov	ip, #0
	add	r3, r3, #2
	ldr	r1, .L810
	mov	r0, #13
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	add	r3, r3, #724
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	add	r3, r3, #740
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #24]
	add	r3, r3, #536
	add	r3, r4, r3, lsl #2
	str	ip, [r3, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	bl	dprint_vfmw
	ldr	r3, [r5, #2560]
	mov	r2, #16
	str	r2, [r3, #28]
	ldr	r3, [r4, #2836]
	sub	r3, r3, #1
	str	r3, [r4, #2836]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L811:
	.align	2
.L810:
	.word	.LC81
	UNWIND(.fnend)
	.size	HEVC_RemoveApcStore, .-HEVC_RemoveApcStore
	.align	2
	.global	HEVC_RemoveUnusedApcStore
	.type	HEVC_RemoveUnusedApcStore, %function
HEVC_RemoveUnusedApcStore:
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
	ldr	r3, [r0, #2540]
	mov	r6, r0
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #2544
	mov	r4, #0
	add	r5, r5, #12
	b	.L815
.L814:
	ldr	r3, [r6, #2540]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L818
.L815:
	ldr	r3, [r5, #4]!
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L814
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_RemoveApcStore
	ldr	r3, [r6, #2540]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L815
.L818:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveUnusedApcStore, .-HEVC_RemoveUnusedApcStore
	.align	2
	.global	HEVC_ApplyReferencePictureSet
	.type	HEVC_ApplyReferencePictureSet, %function
HEVC_ApplyReferencePictureSet:
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
	add	r3, r0, #53248
	ldr	r2, [r0, #2352]
	movw	r4, #2024
	ldr	r1, [r3, #2076]
	movw	ip, #26164
	str	r3, [fp, #-68]
	mov	r9, r0
	ldr	r3, [r0, #2348]
	mov	r0, #1
	mla	r2, r4, r1, r2
	ldr	lr, [r9, #2540]
	cmp	lr, #0
	ldr	r2, [r2, #32]
	mla	r3, ip, r2, r3
	ldr	r8, [r3, #128]
	mov	r3, r0, asl r8
	str	r3, [fp, #-48]
	beq	.L819
	add	r8, r9, #2560
	add	r3, r9, #58368
	add	r7, r9, #57344
	str	r9, [fp, #-56]
	mov	r9, r8
	mov	r2, #0
	add	r3, r3, #220
	str	r2, [fp, #-60]
	str	r3, [fp, #-72]
	str	r0, [fp, #-64]
.L836:
	ldr	r0, [r7, #1188]
	ldr	r2, [r7, #1192]
	ldr	r1, [r7, #1196]
	add	r2, r2, r0
	ldr	r5, [r9]
	cmp	r2, r1
	mov	r8, r2
	movcs	r4, #0
	ldrcs	r0, [r5, #12]
	bcs	.L822
	add	r6, r2, #14656
	ldr	r3, [fp, #-56]
	add	r6, r6, #8
	ldr	r10, [r5, #12]
	mov	r4, #0
	add	r6, r3, r6, lsl #2
.L828:
	ldr	r3, [r6, #-1884]
	cmp	r3, #0
	ldr	r3, [r5, #52]
	beq	.L823
	cmp	r3, #0
	beq	.L824
	ldr	r3, [r6]
	cmp	r3, r10
	beq	.L854
.L824:
	cmp	r4, #0
	bne	.L841
	ldr	r1, [r6]
	mov	r4, r10
	b	.L838
.L823:
	cmp	r3, #0
	beq	.L826
	ldr	r1, [fp, #-48]
	mov	r0, r10
	bl	__aeabi_idivmod
	ldr	r0, [r6]
	str	r1, [fp, #-52]
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	cmp	r3, r1
	beq	.L854
.L826:
	cmp	r4, #0
	bne	.L841
	ldr	r3, [r6]
	mov	r0, r10
	ldr	r1, [fp, #-48]
	str	r3, [fp, #-52]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	mov	r0, r3
	mov	r4, r1
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
.L838:
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	rsb	r4, r1, r4
	clz	r4, r4
	cmp	r0, #0
	mov	r4, r4, lsr #5
	moveq	r4, #0
	cmp	r4, #0
	bne	.L855
.L841:
	mov	r0, r10
.L827:
	ldr	r3, [r7, #1196]
	add	r8, r8, #1
	add	r6, r6, #4
	mov	r10, r0
	cmp	r8, r3
	bcc	.L828
	ldr	r2, [r7, #1192]
	ldr	r1, [r7, #1188]
	add	r2, r2, r1
.L822:
	ldr	r3, [fp, #-68]
	cmp	r2, #0
	ldrne	r8, [fp, #-72]
	movne	r6, #0
	ldr	ip, [r3, #2048]
	beq	.L830
.L832:
	ldr	r3, [r5, #52]
	add	r6, r6, #1
	cmp	r3, #0
	bne	.L831
	ldr	r3, [r8]
	add	r3, ip, r3
	cmp	r3, r0
	beq	.L856
.L831:
	ldr	r3, [r7, #1192]
	add	r8, r8, #4
	ldr	r2, [r7, #1188]
	add	r3, r3, r2
	cmp	r6, r3
	bcc	.L832
.L830:
	eor	r4, r4, #1
	cmp	r0, ip
	moveq	r0, #0
	andne	r0, r4, #1
	cmp	r0, #0
	beq	.L834
	mov	r3, #0
	strb	r3, [r5, #1]
	ldr	r2, [r9]
	str	r3, [r2, #52]
	ldr	r2, [r9]
	ldr	r1, [r2, #8]
	cmp	r1, #1
	beq	.L834
	ldr	r1, [r2, #32]
	mov	r2, r3
	ldr	r3, [fp, #-56]
	ldr	r0, [r3, #276]
	bl	FSP_SetRef
.L834:
	ldr	r3, [fp, #-56]
	add	r9, r9, #4
	ldr	r2, [r3, #2540]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	cmp	r3, r2
	bcc	.L836
.L819:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L855:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, r2
	strb	r1, [r5, #1]
	ldr	r3, [r9]
	str	r1, [r3, #52]
	ldr	r3, [r9]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r9]
	ldr	r0, [r1, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r0, [r5, #12]
	b	.L827
.L854:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, #1
	strb	r1, [r5, #1]
	ldr	r3, [r9]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r9]
	ldr	r0, [r1, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r0, [r5, #12]
	b	.L827
.L856:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, r2
	strb	r1, [r5, #1]
	ldr	r3, [r9]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r9]
	ldr	r0, [r1, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r3, [fp, #-68]
	ldr	r0, [r5, #12]
	ldr	ip, [r3, #2048]
	b	.L831
	UNWIND(.fnend)
	.size	HEVC_ApplyReferencePictureSet, .-HEVC_ApplyReferencePictureSet
	.align	2
	.global	HEVC_CheckThatAllRefPicsAreAvailable
	.type	HEVC_CheckThatAllRefPicsAreAvailable, %function
HEVC_CheckThatAllRefPicsAreAvailable:
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
	add	r3, r0, #53248
	ldr	ip, [r0, #2352]
	movw	r6, #2024
	ldr	r2, [r3, #2076]
	add	lr, r0, #57344
	str	r1, [fp, #-84]
	movw	r5, #26164
	ldr	r1, [lr, #1188]
	mov	r7, r0
	mla	ip, r6, r2, ip
	ldr	r6, [lr, #1192]
	ldr	r4, [r0, #2348]
	add	r1, r6, r1
	ldr	r2, [lr, #1196]
	str	r1, [fp, #-80]
	mov	lr, r1
	cmp	r1, r2
	ldr	ip, [ip, #32]
	str	r0, [fp, #-60]
	mov	r0, #1
	mla	r1, r5, ip, r4
	ldr	r10, [r1, #128]
	mov	r10, r0, asl r10
	bcs	.L858
	add	r9, lr, #14656
	ldr	r6, [r7, #2540]
	add	r9, r9, #8
	mov	r0, #0
	add	r2, r2, #58368
	add	r1, lr, #58368
	add	r9, r7, r9, lsl #2
	mov	ip, r0
	add	r2, r2, #201
	add	r1, r1, #201
	str	r0, [fp, #-64]
	mov	r0, r7
	add	r2, r7, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r2, r7, r1
	str	r3, [fp, #-76]
	str	r2, [fp, #-56]
.L859:
	cmp	r6, #0
	beq	.L865
	ldr	r3, [fp, #-60]
	mov	r2, #0
	ldr	r8, [r9, #-1884]
	mov	r5, r2
	add	r4, r3, #2560
	str	r2, [fp, #-52]
	b	.L862
.L902:
	ldr	r3, [r4]
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L861
	ldr	r0, [r3, #12]
	ldr	r1, [r9]
	cmp	r0, r1
	ldreqb	r3, [r3, #1]	@ zero_extendqisi2
	beq	.L900
.L861:
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	r5, r6
	beq	.L901
.L862:
	cmp	r8, #0
	bne	.L902
	ldr	r7, [r4]
	mov	r1, r10
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L861
	ldr	r0, [r7, #12]
	bl	__aeabi_idivmod
	ldr	r0, [r9]
	str	r1, [fp, #-48]
	mov	r1, r10
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-48]
	cmp	r3, r1
	bne	.L861
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
.L900:
	cmp	r3, #0
	add	r5, r5, #1
	ldr	r3, [fp, #-52]
	add	r4, r4, #4
	movne	r3, #1
	cmp	r5, r6
	str	r3, [fp, #-52]
	bne	.L862
.L901:
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	beq	.L865
.L863:
	ldr	r3, [fp, #-56]
	add	r9, r9, #4
	ldr	r2, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	cmp	r3, r2
	bne	.L859
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-76]
	cmp	r2, #0
	beq	.L867
.L866:
	ldr	r2, [fp, #-60]
	mov	r7, #0
	ldr	r0, [fp, #-72]
	add	r4, r2, #58368
	ldr	r10, [fp, #-80]
	mov	r9, r2
	mov	r8, r4
	add	r4, r4, #220
	add	r8, r8, #201
.L871:
	cmp	r6, #0
	beq	.L872
	add	lr, r9, #2544
	mov	r5, #0
	add	lr, lr, #12
	mov	r2, r5
	str	r0, [fp, #-48]
	b	.L869
.L868:
	cmp	r2, r6
	beq	.L903
.L869:
	ldr	r1, [lr, #4]!
	add	r2, r2, #1
	ldr	r0, [r1, #52]
	cmp	r0, #0
	bne	.L868
	ldr	ip, [r4]
	ldr	r0, [r3, #2048]
	add	r0, r0, ip
	ldr	ip, [r1, #12]
	cmp	ip, r0
	bne	.L868
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #0
	movne	r5, #1
	cmp	r2, r6
	bne	.L869
.L903:
	cmp	r5, #0
	ldr	r0, [fp, #-48]
	beq	.L872
.L870:
	add	r7, r7, #1
	add	r4, r4, #4
	cmp	r7, r10
	add	r8, r8, #1
	bcc	.L871
	str	r0, [fp, #-72]
.L867:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ldrne	r3, [fp, #-84]
	movne	r0, #0
	ldrne	r2, [fp, #-64]
	moveq	r0, #1
	strne	r2, [r3]
.L899:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L872:
	ldr	r2, [r3, #2048]
	ldr	ip, [r4]
	ldr	r1, [r9, #200]
	add	r2, r2, ip
	cmp	r2, r1
	blt	.L870
	ldrb	r1, [r8]	@ zero_extendqisi2
	cmp	r1, #0
	ldr	r1, [fp, #-64]
	movne	r0, #1
	movne	r1, r2
	str	r1, [fp, #-64]
	b	.L870
.L865:
	ldr	r3, [fp, #-76]
	ldr	r0, [r9, #-68]
	ldr	r2, [r3, #2048]
	ldr	r3, [fp, #-60]
	add	r2, r2, r0
	ldr	r1, [r3, #200]
	cmp	r2, r1
	blt	.L863
	ldr	r3, [fp, #-56]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-64]
	cmp	r1, #0
	movne	r3, r2
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	movne	r3, #1
	str	r3, [fp, #-72]
	b	.L863
.L858:
	ldr	r2, [fp, #-80]
	cmp	r2, #0
	beq	.L899
	ldr	r1, [fp, #-60]
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-72]
	ldr	r6, [r1, #2540]
	b	.L866
	UNWIND(.fnend)
	.size	HEVC_CheckThatAllRefPicsAreAvailable, .-HEVC_CheckThatAllRefPicsAreAvailable
	.align	2
	.global	HEVC_SetFrmRepeatCount
	.type	HEVC_SetFrmRepeatCount, %function
HEVC_SetFrmRepeatCount:
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
	ldr	r3, [r0, #2356]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_SetFrmRepeatCount.part.5
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount, .-HEVC_SetFrmRepeatCount
	.align	2
	.global	HEVC_GetFreeFrameStoreNum
	.type	HEVC_GetFreeFrameStoreNum, %function
HEVC_GetFreeFrameStoreNum:
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
	add	r2, r0, #68608
	add	r4, r0, #83968
	add	r2, r2, #616
	add	r4, r4, #296
	mov	r5, #0
.L911:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L907
	cmp	r2, #0
	beq	.L908
	ldr	lr, [r0, #2540]
	cmp	lr, #0
	beq	.L908
	ldr	r1, [r0, #2560]
	cmp	r1, r2
	beq	.L907
	add	r1, r0, #2560
	b	.L909
.L910:
	ldr	ip, [r1, #4]!
	cmp	ip, r2
	beq	.L907
.L909:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L910
.L908:
	add	r5, r5, #1
.L907:
	add	r2, r2, #752
	cmp	r2, r4
	bne	.L911
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetFreeFrameStoreNum, .-HEVC_GetFreeFrameStoreNum
	.align	2
	.global	HEVC_UpdateReflist
	.type	HEVC_UpdateReflist, %function
HEVC_UpdateReflist:
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
	add	r10, r0, #57344
	mov	r5, r0
	ldr	r1, [r10, #1188]
	cmp	r1, #0
	beq	.L945
	add	r9, r0, #58368
	mov	r7, #0
	add	ip, r0, #53248
	mov	r6, r7
	mov	r8, r9
	add	r9, r9, #200
	add	r8, r8, #220
.L929:
	ldrb	r3, [r9, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L923
	ldr	r4, [r5, #2540]
	ldr	lr, [ip, #2048]
	ldr	r3, [r8]
	cmp	r4, #0
	add	lr, lr, r3
	beq	.L923
	ldr	r1, [r5, #2560]
	ldr	r3, [r1, #12]
	cmp	r3, lr
	addne	r2, r5, #2560
	movne	r3, #0
	bne	.L926
	b	.L977
.L928:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, lr
	beq	.L924
.L926:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L928
.L923:
	ldr	r1, [r10, #1188]
	add	r6, r6, #1
	add	r8, r8, #4
	cmp	r1, r6
	bhi	.L929
.L922:
	ldr	r2, [r5, #2536]
	str	r7, [r5, #2552]
	cmp	r2, r7
	addhi	r3, r7, #656
	movhi	r0, #0
	addhi	r3, r5, r3, lsl #2
	bls	.L934
.L933:
	add	r7, r7, #1
	str	r0, [r3, #4]!
	cmp	r7, r2
	bne	.L933
.L934:
	ldr	r8, [r10, #1192]
	add	r8, r1, r8
	cmp	r8, r6
	movls	r7, #0
	bls	.L932
	add	r9, r6, #14592
	add	r10, r6, #58368
	add	r9, r9, #55
	add	r10, r10, #200
	add	r10, r5, r10
	add	ip, r5, #53248
	add	r9, r5, r9, lsl #2
	mov	r7, #0
.L941:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L935
	ldr	r4, [r5, #2540]
	ldr	lr, [ip, #2048]
	ldr	r3, [r9]
	cmp	r4, #0
	add	lr, lr, r3
	beq	.L935
	ldr	r1, [r5, #2560]
	ldr	r3, [r1, #12]
	cmp	r3, lr
	addne	r2, r5, #2560
	movne	r3, #0
	bne	.L938
	b	.L978
.L940:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, lr
	beq	.L936
.L938:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L940
.L935:
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r8, r6
	bhi	.L941
.L981:
	ldr	r2, [r5, #2536]
.L932:
	cmp	r2, r7
	str	r7, [r5, #2556]
	bls	.L921
	add	r1, r7, #672
	mov	r3, #0
	add	r1, r1, #1
	add	r5, r5, r1, lsl #2
.L943:
	add	r7, r7, #1
	str	r3, [r5, #4]!
	cmp	r7, r2
	bne	.L943
.L921:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L977:
	mov	r3, #0
.L924:
	add	r4, r5, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r3, [r4, #2560]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L979
.L927:
	mov	r2, #1
	str	r2, [r3, #56]
	ldr	r2, [r4, #2560]
	mov	r1, #0
	add	r3, r5, r7, lsl #2
	add	r7, r7, #1
	str	r1, [r2, #52]
	ldr	r2, [r4, #2560]
	str	r2, [r3, #2628]
	b	.L923
.L978:
	mov	r3, #0
.L936:
	add	r4, r5, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r3, [r4, #2560]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L980
.L939:
	mov	r2, #1
	str	r2, [r3, #56]
	ldr	r2, [r4, #2560]
	add	r3, r7, #672
	mov	r1, #0
	add	r6, r6, #1
	add	r3, r3, #2
	cmp	r8, r6
	str	r1, [r2, #52]
	add	r7, r7, #1
	ldr	r2, [r4, #2560]
	add	r9, r9, #4
	str	r2, [r5, r3, asl #2]
	bhi	.L941
	b	.L981
.L979:
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	str	ip, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [r4, #2560]
	ldr	ip, [fp, #-48]
	b	.L927
.L980:
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	str	ip, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [r4, #2560]
	ldr	ip, [fp, #-48]
	b	.L939
.L945:
	mov	r7, r1
	mov	r6, r1
	b	.L922
	UNWIND(.fnend)
	.size	HEVC_UpdateReflist, .-HEVC_UpdateReflist
	.align	2
	.global	HEVC_UpdateLTReflist
	.type	HEVC_UpdateLTReflist, %function
HEVC_UpdateLTReflist:
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
	add	r3, r0, #53248
	ldr	r2, [r0, #2352]
	movw	ip, #2024
	ldr	r3, [r3, #2076]
	add	r10, r0, #57344
	ldr	lr, [r0, #2348]
	movw	r4, #26164
	ldr	r5, [r10, #1192]
	mov	r1, #1
	mla	ip, ip, r3, r2
	ldr	r2, [r10, #1188]
	ldr	r3, [r10, #1196]
	add	r2, r2, r5
	sub	r2, r2, #1
	sub	r9, r3, #1
	cmp	r9, r2
	ldr	ip, [ip, #32]
	mla	r2, r4, ip, lr
	ldr	r8, [r2, #128]
	mov	r8, r1, asl r8
	ble	.L993
	add	r7, r3, #14656
	add	r3, r3, #58368
	add	r7, r7, #7
	add	r3, r3, #201
	add	r3, r0, r3
	sub	r8, r8, #1
	add	r7, r0, r7, lsl #2
	mov	r6, #0
	str	r6, [fp, #-48]
	mov	r6, r3
	str	r1, [fp, #-52]
.L989:
	ldrb	r3, [r6, #-1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L984
	ldrb	r4, [r7, #-1884]	@ zero_extendqisi2
	ldr	lr, [r7]
	ldr	r5, [r0, #2540]
	cmp	r4, #0
	andeq	lr, lr, r8
	cmp	r5, #0
	ble	.L984
	add	r1, r0, #2544
	mov	r3, #0
	add	r1, r1, #12
	b	.L988
.L987:
	add	r3, r3, #1
	cmp	r3, r5
	beq	.L984
.L988:
	ldr	ip, [r1, #4]!
	cmp	r4, #0
	ldr	r2, [ip, #12]
	andeq	r2, r2, r8
	cmp	lr, r2
	bne	.L987
	ldr	r1, [fp, #-48]
	add	r3, r0, r3, lsl #2
	ldr	lr, [fp, #-52]
	add	r2, r0, r1, lsl #2
	add	r1, r1, #1
	strb	lr, [ip, #1]
	mov	ip, #0
	str	r1, [fp, #-48]
	ldr	r1, [r3, #2560]
	str	ip, [r1, #56]
	ldr	r1, [r3, #2560]
	str	lr, [r1, #52]
	ldr	r3, [r3, #2560]
	str	r3, [r2, #2764]
.L984:
	ldr	r3, [r10, #1188]
	sub	r9, r9, #1
	ldr	r2, [r10, #1192]
	sub	r7, r7, #4
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r9
	blt	.L989
	ldr	r6, [fp, #-48]
	mov	r2, r6
.L983:
	ldr	r3, [r0, #2536]
	str	r2, [r0, #2548]
	cmp	r3, r6
	ble	.L982
	add	r1, r6, #688
	mov	r2, #0
	add	r1, r1, #2
	add	r0, r0, r1, lsl #2
.L991:
	add	r6, r6, #1
	str	r2, [r0, #4]!
	cmp	r6, r3
	bne	.L991
.L982:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L993:
	mov	r2, #0
	mov	r6, r2
	b	.L983
	UNWIND(.fnend)
	.size	HEVC_UpdateLTReflist, .-HEVC_UpdateLTReflist
	.align	2
	.global	HEVC_GetAPC
	.type	HEVC_GetAPC, %function
HEVC_GetAPC:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r6, r1, #0
	mov	r5, r0
	beq	.L1001
	ldr	ip, [r0, #2832]
	cmp	ip, #0
	beq	.L1010
	ldr	r4, [r0, #2840]
	cmp	r4, #0
	addne	r3, r0, #2832
	movne	r4, #0
	addne	r3, r3, #8
	bne	.L1005
	b	.L1003
.L1008:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1003
.L1005:
	add	r4, r4, #1
	cmp	r4, ip
	bne	.L1008
.L1010:
	mvn	r0, #6
.L1014:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1003:
	ldr	r1, [r6, #32]
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	beq	.L1006
	ldr	r3, [ip, #680]
	cmp	r3, #0
	beq	.L1006
	add	r2, r5, r4, lsl #2
	mov	r0, #1
	mov	r3, r4
	ldr	r1, .L1015
	str	r0, [r2, #2840]
	mov	r0, #13
	ldr	ip, [ip, #680]
	ldr	ip, [ip, #8]
	str	ip, [r2, #2904]
	ldr	ip, [r6, #12]
	str	ip, [r2, #2968]
	ldr	r2, [r5, #2836]
	add	r2, r2, #1
	str	r2, [r5, #2836]
	ldr	r2, [r6, #260]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r6, #28]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1006:
	ldrb	r1, [r6, #1]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r2, [r6, #32]
	ldr	r3, [r6, #12]
	stmia	sp, {r1, ip}
	str	r0, [sp, #8]
	ldr	r1, .L1015+4
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1014
.L1001:
	mov	r0, r6
	movw	r3, #9414
	ldr	r2, .L1015+8
	ldr	r1, .L1015+12
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1014
.L1016:
	.align	2
.L1015:
	.word	.LC82
	.word	.LC83
	.word	.LC43
	.word	.LC44
	UNWIND(.fnend)
	.size	HEVC_GetAPC, .-HEVC_GetAPC
	.align	2
	.global	HEVC_CheckFrameStore
	.type	HEVC_CheckFrameStore, %function
HEVC_CheckFrameStore:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r4, r1
	ldr	r0, [r0, #276]
	ldr	r1, [r1, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1018
	ldrsb	r2, [r0, #1]
	cmp	r2, #3
	cmpne	r2, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L1037
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1024
	ldr	r2, [r4, #4]
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1023
	cmp	r3, #1
	beq	.L1023
.L1034:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1037:
	ldr	r3, [r4, #32]
	mov	r0, #13
	str	r2, [sp]
	ldr	r1, .L1038
	ldr	r2, .L1038+4
	bl	dprint_vfmw
.L1020:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1024
	ldr	r3, [r4, #12]
	mov	r0, #1
	ldr	r2, .L1038+4
	ldr	r1, .L1038+8
	bl	dprint_vfmw
	mvn	r0, #2
	b	.L1034
.L1018:
	ldr	lr, [r4, #32]
	mov	r2, r4
	ldr	ip, [r4, #8]
	mov	r0, #1
	ldr	r3, [r4, #12]
	ldr	r1, .L1038+12
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	b	.L1020
.L1023:
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L1038+4
	ldr	r1, .L1038+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1034
.L1024:
	mov	r2, #1
	mov	r3, #2
	strb	r2, [r4, #2]
	mvn	r0, #2
	str	r3, [r4, #8]
	b	.L1034
.L1039:
	.align	2
.L1038:
	.word	.LC84
	.word	.LANCHOR1+260
	.word	.LC86
	.word	.LC85
	.word	.LC87
	UNWIND(.fnend)
	.size	HEVC_CheckFrameStore, .-HEVC_CheckFrameStore
	.align	2
	.global	HEVC_GetImagePara
	.type	HEVC_GetImagePara, %function
HEVC_GetImagePara:
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
	ldrb	r3, [r1, #205]	@ zero_extendqisi2
	add	ip, r0, #86016
	ldrb	r2, [r1, #204]	@ zero_extendqisi2
	mov	r4, r1
	and	r3, r3, #195
	add	r1, r0, #24576
	bfc	r3, #0, #2
	bfc	r2, #0, #2
	strb	r3, [r4, #205]
	strb	r2, [r4, #204]
	ldr	r3, [ip, #1736]
	ldr	lr, [r4, #16]
	str	r3, [r4, #240]
	ldr	r3, [r1, #3768]
	add	r3, r3, #12288
	ldr	r3, [r3, #180]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	moveq	r2, #0
	beq	.L1041
	mov	r2, #256
	movt	r2, 1
	cmp	r3, r2
	movne	r2, #1
	bne	.L1041
	add	r3, r0, #4096
	ldr	r2, [r3, #480]
	subs	r2, r2, #1
	movne	r2, #1
.L1041:
	ldr	r3, [r1, #3772]
	ldrb	r3, [r3, #2633]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r5, #3
	beq	.L1042
	ldr	r3, [r4, #744]
	cmp	r3, #1
	cmpne	r3, #11
	moveq	r5, #1
	bne	.L1063
.L1043:
	ldr	r2, [r4, #748]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L1042:
	ldrb	r3, [r4, #205]	@ zero_extendqisi2
	mov	r6, #2
	ldrb	ip, [r4, #204]	@ zero_extendqisi2
	add	r1, r0, #53248
	bfi	r3, r6, #4, #2
	bfi	r3, r5, #2, #2
	bfi	ip, lr, #0, #2
	bfi	r3, r2, #0, #2
	strb	ip, [r4, #204]
	strb	r3, [r4, #205]
	ldr	r3, [r1, #1288]
	cmp	r3, #1920
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	orrls	r3, r3, r6
	bfchi	r3, #1, #1
	strb	r3, [r4, #206]
	ldr	r3, [r0, #2356]
	ldr	r3, [r3, #592]
	cmp	r3, #1
	beq	.L1064
.L1046:
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r4, #206]
.L1047:
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #32]
	cmp	r3, #0
	ldrne	r3, [r4, #20]
	strne	r3, [r4, #264]
	ldr	r0, [r0, #276]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, .L1065
	mov	r2, #664
	add	r1, r4, #80
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #16
	str	r3, [r5, #412]
	mov	r3, #1
	ldr	r2, [r4, #48]
	strb	r3, [r5, #407]
	cmp	r2, #0
	strb	r3, [r5, #405]
	moveq	r3, #0
	movne	r3, #4
	strb	r3, [r5, #400]
	ldr	r3, [r4, #68]
	str	r3, [r5, #356]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1063:
	bic	r3, r3, #8
	cmp	r3, #2
	moveq	r5, #2
	movne	r5, #3
	b	.L1043
.L1064:
	ldrb	r3, [r4, #206]	@ zero_extendqisi2
	tst	r3, #2
	orreq	r3, r3, #4
	streqb	r3, [r4, #206]
	beq	.L1047
	b	.L1046
.L1066:
	.align	2
.L1065:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_GetImagePara, .-HEVC_GetImagePara
	.align	2
	.global	HEVC_OutputCurrPic
	.type	HEVC_OutputCurrPic, %function
HEVC_OutputCurrPic:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r6, r0, #53248
	add	r1, r0, #54528
	mov	r4, r0
	ldr	r5, [r6, #1332]
	mov	r2, #664
	ldr	r3, [r6, #1312]
	add	r1, r1, #56
	add	r0, r5, #80
	str	r3, [r5, #20]
	bl	memcpy
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_GetImagePara
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L1089
	ldr	r2, [r5, #20]
	cmp	r2, #0
	str	r2, [r7, #184]
	bne	.L1070
.L1075:
	ldrb	r3, [r6, #1272]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1090
.L1072:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	add	r3, r4, #62464
	ldr	r0, [r4, #276]
	add	r3, r3, #248
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L1091
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #24]
	bcs	.L1092
.L1079:
	ldr	r2, [r4, #316]
	mov	r0, #0
	ldr	r3, [r4, #308]
	add	r2, r2, #1
	str	r2, [r4, #316]
	add	r3, r3, #1
	str	r3, [r4, #308]
.L1069:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1070:
	ldr	r8, [r6, #1284]
	cmp	r8, #0
	beq	.L1093
.L1073:
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #4]
	cmp	r3, r2
	bcs	.L1075
	ldr	r1, [r5, #32]
	mov	r2, #0
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	ldr	r1, [r4, #2356]
	ldr	r3, [r7, #184]
	mov	r0, #1
	ldr	r2, .L1094
	ldr	ip, [r1, #4]
	ldr	r1, .L1094+4
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1069
.L1090:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetRef
	b	.L1072
.L1092:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.5
	b	.L1079
.L1093:
	ldr	r2, .L1094
	mov	r0, #1
	ldr	r1, .L1094+8
	bl	dprint_vfmw
	ldr	r3, .L1094+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1074
	mov	r3, r8
	mov	r2, r8
	mov	r1, #111
	ldr	r0, [r4, #276]
	blx	ip
.L1074:
	ldr	r2, [r7, #184]
	cmp	r2, #0
	bne	.L1073
	b	.L1075
.L1091:
	ldr	r2, .L1094
	mov	r0, #1
	ldr	r1, .L1094+16
	bl	dprint_vfmw
	ldr	r0, [r4, #276]
	ldr	r1, [r5, #32]
	mov	r2, #0
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L1069
.L1089:
	ldr	r2, .L1094
	ldr	r1, .L1094+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1069
.L1095:
	.align	2
.L1094:
	.word	.LANCHOR1+284
	.word	.LC91
	.word	.LC89
	.word	g_event_report
	.word	.LC90
	.word	.LC88
	UNWIND(.fnend)
	.size	HEVC_OutputCurrPic, .-HEVC_OutputCurrPic
	.align	2
	.global	HEVC_FirstFrameFastOut
	.type	HEVC_FirstFrameFastOut, %function
HEVC_FirstFrameFastOut:
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
	bl	HEVC_OutputCurrPic
	subs	r5, r0, #0
	bne	.L1099
	add	r3, r4, #53248
	add	r1, r4, #61440
	mov	r2, #1
	mov	ip, #2
	ldr	r0, [r3, #1332]
	str	ip, [r0, #8]
	mov	r0, r5
	str	r2, [r1, #1624]
	ldr	r1, [r3, #1280]
	str	r1, [r4, #244]
	ldr	r3, [r3, #1332]
	strb	r2, [r3, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1099:
	ldr	r2, .L1100
	mov	r0, #1
	ldr	r1, .L1100+4
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1101:
	.align	2
.L1100:
	.word	.LANCHOR1+304
	.word	.LC92
	UNWIND(.fnend)
	.size	HEVC_FirstFrameFastOut, .-HEVC_FirstFrameFastOut
	.align	2
	.global	HEVC_CheckOutputImage
	.type	HEVC_CheckOutputImage, %function
HEVC_CheckOutputImage:
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
	cmp	r1, #19
	bhi	.L1104
	mov	r3, #752
	mla	r1, r3, r1, r0
	add	r1, r1, #68608
	ldrb	r0, [r1, #617]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1104:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_CheckOutputImage, .-HEVC_CheckOutputImage
	.align	2
	.global	HEVC_DECRecycleImage
	.type	HEVC_DECRecycleImage, %function
HEVC_DECRecycleImage:
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
	mov	r5, r0
	ldr	r0, [r0, #276]
	mov	r8, r1
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1110
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	addne	r4, r0, #600
	addne	r9, r0, #632
	movne	r6, #0
	movne	r7, #0
	beq	.L1115
.L1109:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1116
.L1108:
	cmp	r4, r9
	bne	.L1109
	ldr	r0, [r5, #276]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1116:
	mov	r1, r2
	ldr	r0, [r5, #276]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1108
.L1115:
	ldr	r1, .L1117
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1110:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1118:
	.align	2
.L1117:
	.word	.LC93
	UNWIND(.fnend)
	.size	HEVC_DECRecycleImage, .-HEVC_DECRecycleImage
	.align	2
	.global	HEVC_ArrangeVahbMem
	.type	HEVC_ArrangeVahbMem, %function
HEVC_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	sub	r4, r1, #32
	sub	r3, r2, #32
	movw	ip, #8160
	cmp	r3, ip
	cmpls	r4, ip
	mov	r6, r1
	mov	r7, r2
	mov	r5, r0
	movhi	r4, #1
	movls	r4, #0
	bhi	.L1129
	ldr	r3, .L1131
	mov	r2, #32
	mov	r1, r4
	sub	r0, fp, #60
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5, #2356]
	str	r7, [fp, #-32]
	strb	r4, [fp, #-60]
	ldr	r3, [r3, #28]
	strb	r4, [fp, #-59]
	cmp	r3, #24
	str	r6, [fp, #-52]
	str	r7, [fp, #-48]
	str	r6, [fp, #-44]
	str	r7, [fp, #-40]
	str	r6, [fp, #-36]
	beq	.L1122
	ldr	r2, [r5, #2536]
	mov	r1, #5
	ldrb	r3, [fp, #12]	@ zero_extendqisi2
	strb	r4, [fp, #-56]
	strb	r1, [fp, #-55]
	strb	r2, [fp, #-57]
.L1126:
	sub	r1, fp, #60
	ldr	r0, [r5, #276]
	strb	r3, [fp, #-54]
	mov	r3, #0
	strb	r3, [fp, #-58]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L1123
	ldr	r1, [r5, #2356]
	sub	r3, fp, #64
	ldr	r0, [r5, #276]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L1130
	cmp	r0, #0
	moveq	r0, #1
	bne	.L1125
.L1128:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1122:
	mov	r3, #1
	mov	r2, #5
	strb	r4, [fp, #-56]
	strb	r3, [fp, #-57]
	strb	r2, [fp, #-55]
	b	.L1126
.L1130:
	add	r0, r5, #62464
	add	r0, r0, #248
	bl	ResetVoQueue
.L1125:
	ldr	r1, .L1131+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L1128
.L1129:
	mov	r3, r2
	mov	r0, #0
	mov	r2, r1
	ldr	r1, .L1131+8
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1123:
	ldr	r1, .L1131+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L1128
.L1132:
	.align	2
.L1131:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC95
	.word	.LC94
	.word	.LC96
	UNWIND(.fnend)
	.size	HEVC_ArrangeVahbMem, .-HEVC_ArrangeVahbMem
	.align	2
	.global	HEVC_GetSLHDR1MasteringDisplayInfo
	.type	HEVC_GetSLHDR1MasteringDisplayInfo, %function
HEVC_GetSLHDR1MasteringDisplayInfo:
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
	add	r1, r1, #4096
	movw	r2, #14999
	ldr	r3, [r1, #244]
	cmp	r3, r2
	bhi	.L1137
	sub	r2, r3, #8448
	movw	ip, #4749
	sub	r2, r2, #52
	cmp	r2, ip
	movls	r3, #1
	strlsb	r3, [r0, #3]
	bls	.L1135
	sub	r3, r3, #13248
	movw	r2, #1749
	sub	r3, r3, #2
	cmp	r3, r2
	bhi	.L1137
	mov	r3, #2
	strb	r3, [r0, #3]
.L1135:
	ldr	r3, [r1, #276]
	movw	r2, #56963
	movt	r2, 17179
	mov	ip, #50
	add	r3, r3, #249856
	movw	lr, #10000
	add	r3, r3, #144
	movw	r4, #2063
	movt	r4, 1526
	umull	r2, r3, r3, r2
	mov	r3, r3, lsr #17
	mul	r3, ip, r3
	cmp	r3, lr
	movcs	r3, lr
	strh	r3, [r0, #4]	@ movhi
	ldr	r3, [r1, #280]
	cmp	r3, r4
	movwls	r2, #5977
	movtls	r2, 53687
	umullls	r2, r3, r3, r2
	ubfxls	lr, r3, #13, #16
	strh	lr, [r0, #6]	@ movhi
	ldmfd	sp, {r4, fp, sp, pc}
.L1137:
	mov	r3, #0
	strb	r3, [r0, #3]
	b	.L1135
	UNWIND(.fnend)
	.size	HEVC_GetSLHDR1MasteringDisplayInfo, .-HEVC_GetSLHDR1MasteringDisplayInfo
	.align	2
	.global	HEVC_PrintSLHDR1Info
	.type	HEVC_PrintSLHDR1Info, %function
HEVC_PrintSLHDR1Info:
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
	ldr	r1, .L1159
	mov	r4, r0
	ldrb	r2, [r0]	@ zero_extendqisi2
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldr	r1, .L1159+4
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r1, .L1159+8
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	ldr	r1, .L1159+12
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #4]
	ldr	r1, .L1159+16
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #6]
	ldr	r1, .L1159+20
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ldr	r1, .L1159+24
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #9]	@ zero_extendqisi2
	ldr	r1, .L1159+28
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	mov	r0, #32
	cmp	r5, #0
	bne	.L1141
	ldr	r1, .L1159+32
	bl	dprint_vfmw
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	ldr	r1, .L1159+36
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	ldr	r1, .L1159+40
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #13]	@ zero_extendqisi2
	ldr	r1, .L1159+44
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #14]	@ zero_extendqisi2
	ldr	r1, .L1159+48
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #15]	@ zero_extendqisi2
	ldr	r1, .L1159+52
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #15
	addne	r6, r4, #26
	beq	.L1146
.L1145:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1159+56
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1159+60
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1145
.L1146:
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1159+64
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #38
	addne	r6, r4, #45
	movne	r5, #0
	beq	.L1147
.L1148:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1159+68
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1159+72
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1148
.L1147:
	movw	r2, #290
	ldr	r1, .L1159+76
	mov	r0, #32
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1141:
	ldr	r1, .L1159+80
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #10
	addne	r6, r4, #78
	movne	r5, #0
	beq	.L1153
.L1152:
	mov	r2, r5
	ldrh	r3, [r7, #2]!
	ldr	r1, .L1159+84
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r3, [r6, #2]!
	mov	r2, r5
	ldr	r1, .L1159+88
	mov	r0, #32
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1152
.L1153:
	ldrb	r2, [r4, #148]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1159+92
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #148
	addne	r6, r4, #216
	movne	r5, #0
	beq	.L1151
.L1154:
	mov	r3, r5
	ldrh	r2, [r7, #2]!
	ldr	r1, .L1159+96
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrh	r2, [r6, #2]!
	mov	r0, #32
	ldr	r1, .L1159+100
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1154
.L1151:
	movw	r3, #286
	ldr	r1, .L1159+104
	ldrh	r2, [r4, r3]
	add	r4, r4, #288
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r1, .L1159+108
	ldrh	r2, [r4]
	mov	r0, #32
	bl	dprint_vfmw
	b	.L1147
.L1160:
	.align	2
.L1159:
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC112
	.word	.LC113
	.word	.LC111
	.word	.LC114
	.word	.LC115
	.word	.LC124
	.word	.LC116
	.word	.LC118
	.word	.LC119
	.word	.LC117
	.word	.LC122
	.word	.LC123
	.word	.LC120
	.word	.LC121
	UNWIND(.fnend)
	.size	HEVC_PrintSLHDR1Info, .-HEVC_PrintSLHDR1Info
	.align	2
	.global	HEVC_GetSLHDR1Info
	.type	HEVC_GetSLHDR1Info, %function
HEVC_GetSLHDR1Info:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 296
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #312)
	sub	sp, sp, #312
	mov	r6, r1
	mov	r5, r0
	mov	r4, r2
	sub	r0, fp, #320
	movw	r2, #290
	mov	r1, #0
	bl	memset
	ldrb	r3, [r6, #5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1206
	ldrb	r2, [r4, #3206]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1208
.L1206:
	add	r0, r4, #4096
.L1164:
	ldrb	ip, [r0, #240]	@ zero_extendqisi2
	ldrb	r2, [r4, #3206]	@ zero_extendqisi2
	ldrb	r0, [r4, #3212]	@ zero_extendqisi2
	ldrb	r1, [r4, #3292]	@ zero_extendqisi2
.L1163:
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	mov	r0, #22
	stmia	sp, {r2, ip}
	ldr	r1, .L1211
	ldr	r2, .L1211+4
	bl	dprint_vfmw
	mov	r3, #0
	strb	r3, [r5, #258]
.L1161:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1208:
	add	r0, r4, #4096
	ldrb	ip, [r0, #240]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1164
	ldrb	r1, [r4, #3212]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1165
	ldrb	r1, [r4, #3292]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1209
.L1165:
	mov	r3, #1
	strb	r3, [r5, #258]
	ldr	r0, [r6, #40]
	ldrb	r1, [r4, #3207]	@ zero_extendqisi2
	ldrb	r2, [r4, #3208]	@ zero_extendqisi2
	cmp	r0, #9
	strb	r1, [fp, #-320]
	strb	r2, [fp, #-319]
	bne	.L1167
	ldr	r2, [r6, #48]
	cmp	r2, #9
	streqb	r3, [fp, #-312]
.L1167:
	ldrb	r3, [r4, #3223]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1168
	ldrb	r2, [r4, #3304]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1168
	cmp	r2, #9
	cmpne	r3, #9
	ldrneb	r3, [fp, #-312]	@ zero_extendqisi2
	moveq	r3, #1
	strb	r3, [fp, #-318]
.L1168:
	mov	r1, r4
	sub	r0, fp, #320
	bl	HEVC_GetSLHDR1MasteringDisplayInfo
	ldrb	r3, [fp, #-318]	@ zero_extendqisi2
	ldrb	r2, [fp, #-312]	@ zero_extendqisi2
	cmp	r2, r3
	ldreqb	r3, [fp, #-317]	@ zero_extendqisi2
	movne	r3, #0
	strb	r3, [fp, #-311]
	ldrb	r3, [fp, #-319]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1172
	ldrb	r7, [r4, #3230]	@ zero_extendqisi2
	ldrb	lr, [r4, #3225]	@ zero_extendqisi2
	ldrb	ip, [r4, #3226]	@ zero_extendqisi2
	cmp	r7, #0
	ldrb	r0, [r4, #3227]	@ zero_extendqisi2
	ldrb	r1, [r4, #3228]	@ zero_extendqisi2
	ldrb	r2, [r4, #3229]	@ zero_extendqisi2
	strb	r7, [fp, #-305]
	strb	lr, [fp, #-310]
	strb	ip, [fp, #-309]
	strb	r0, [fp, #-308]
	strb	r1, [fp, #-307]
	strb	r2, [fp, #-306]
	beq	.L1177
	sub	r0, fp, #320
	add	r1, r4, #3216
	add	r2, r4, #3232
	add	ip, r0, #15
	add	r1, r1, #14
	add	r2, r2, #13
	add	r0, r0, #26
.L1176:
	add	r3, r3, #1
	ldrb	r6, [r1, #1]!	@ zero_extendqisi2
	ldrb	lr, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, r7
	strb	r6, [ip, #1]!
	strb	lr, [r0, #1]!
	bne	.L1176
.L1177:
	ldrb	r6, [r4, #3261]	@ zero_extendqisi2
	cmp	r6, #0
	strb	r6, [fp, #-282]
	beq	.L1175
	add	r2, r4, #3248
	sub	r0, fp, #280
	add	r4, r4, #3264
	sub	r1, fp, #272
	add	r2, r2, #13
	add	r4, r4, #12
	sub	r0, r0, #2
	sub	r1, r1, #3
	mov	r3, #0
.L1180:
	add	r3, r3, #1
	ldrb	lr, [r2, #1]!	@ zero_extendqisi2
	ldrb	ip, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, r6
	strb	lr, [r0, #1]!
	strb	ip, [r1, #1]!
	bne	.L1180
.L1175:
	ldr	r3, [r5, #264]
	cmp	r3, #0
	bne	.L1210
	ldr	r2, .L1211+4
	mov	r0, #1
	ldr	r1, .L1211+8
	bl	dprint_vfmw
	b	.L1161
.L1172:
	ldrb	r6, [r4, #3748]	@ zero_extendqisi2
	ldr	r2, [r4, #3716]
	add	r6, r6, #1
	ldr	r3, [r4, #3720]
	uxtb	r6, r6
	strh	r2, [fp, #-34]	@ movhi
	cmp	r6, #0
	strb	r6, [fp, #-310]
	strh	r3, [fp, #-32]	@ movhi
	beq	.L1184
	add	r0, r4, #3744
	add	r1, r4, #3936
	add	r0, r0, #6
	add	r1, r1, #12
	sub	r3, fp, #320
	mov	r2, #0
.L1183:
	add	r2, r2, #1
	ldrh	lr, [r0, #2]!
	ldrh	ip, [r1, #2]!
	cmp	r2, r6
	add	r3, r3, #2
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #78]	@ movhi
	bcc	.L1183
.L1184:
	ldrb	lr, [r4, #3749]	@ zero_extendqisi2
	add	lr, lr, #1
	uxtb	lr, lr
	strb	lr, [fp, #-172]
	cmp	lr, #0
	beq	.L1175
	add	r1, r4, #3808
	add	r4, r4, #4000
	add	r1, r1, #8
	add	r4, r4, #14
	sub	r3, fp, #320
	mov	r2, #0
.L1185:
	add	r2, r2, #1
	ldrh	ip, [r1, #2]!
	ldrh	r0, [r4, #2]!
	cmp	r2, lr
	add	r3, r3, #2
	strh	ip, [r3, #148]	@ movhi
	strh	r0, [r3, #216]	@ movhi
	bcc	.L1185
	b	.L1175
.L1210:
	ldr	r3, .L1211+12
	sub	r1, fp, #320
	movw	r2, #290
	ldr	r0, [r5, #272]
	ldr	r3, [r3, #52]
	blx	r3
	movw	r3, #290
	str	r3, [r5, #260]
	b	.L1161
.L1209:
	mov	r0, r1
	b	.L1163
.L1212:
	.align	2
.L1211:
	.word	.LC125
	.word	.LANCHOR1+328
	.word	.LC126
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_GetSLHDR1Info, .-HEVC_GetSLHDR1Info
	.align	2
	.global	HEVC_ConvertHDRInfo
	.type	HEVC_ConvertHDRInfo, %function
HEVC_ConvertHDRInfo:
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
	mov	r3, r0
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	add	ip, r2, #4096
	add	r5, r2, #4288
	add	r4, r3, #284
	add	r6, r3, #292
	strb	r0, [r3, #280]
	mov	lr, r5
	ldr	r7, [r1, #40]
	add	r5, r5, #48
	add	r4, r4, #2
	add	lr, lr, #60
	mov	r0, #0
	strb	r7, [r3, #281]
	ldr	r7, [r1, #48]
	strb	r7, [r3, #282]
	ldr	r7, [r1, #44]
	str	r7, [r3, #284]
	ldrb	r7, [ip, #240]	@ zero_extendqisi2
	strb	r7, [r3, #256]
.L1214:
	ldr	r7, [r5, #4]!
	add	r0, r0, #1
	cmp	r0, #3
	strh	r7, [r4, #2]!	@ movhi
	ldr	r7, [lr, #4]!
	strh	r7, [r6, #2]!	@ movhi
	bne	.L1214
	ldr	r0, [ip, #268]
	add	lr, r3, #256
	movw	r5, #286
	add	r4, ip, #288
	strh	r0, [lr, #44]	@ movhi
	mov	r0, r3
	ldr	r6, [ip, #272]
	strh	r6, [lr, #46]	@ movhi
	ldr	lr, [ip, #276]
	str	lr, [r3, #304]
	ldr	lr, [ip, #280]
	str	lr, [r3, #308]
	ldrb	lr, [ip, #284]	@ zero_extendqisi2
	strb	lr, [r3, #257]
	ldrh	lr, [ip, r5]
	str	lr, [r3, #312]
	ldrh	lr, [r4]
	str	lr, [r3, #316]
	ldrb	ip, [ip, #290]	@ zero_extendqisi2
	strb	ip, [r3, #320]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVC_GetSLHDR1Info
	UNWIND(.fnend)
	.size	HEVC_ConvertHDRInfo, .-HEVC_ConvertHDRInfo
	.align	2
	.global	HEVC_AllocFrameStore
	.type	HEVC_AllocFrameStore, %function
HEVC_AllocFrameStore:
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
	add	r6, r0, #53248
	ldr	r3, [r0, #2352]
	movw	ip, #2024
	mov	r7, r0
	ldr	r2, [r6, #2076]
	movw	r5, #26164
	ldr	r0, [r0, #2348]
	add	lr, r7, #68608
	mov	r1, #0
	add	lr, lr, #616
	mla	r3, ip, r2, r3
	mov	r8, r1
	ldr	r3, [r3, #32]
	strb	r1, [r6, #1273]
	mla	r5, r5, r3, r0
.L1221:
	ldr	r3, [lr, #4]
	cmp	r3, #0
	bne	.L1217
	cmp	lr, #0
	beq	.L1228
	ldr	r1, [r7, #2540]
	cmp	r1, #0
	beq	.L1228
	ldr	r2, [r7, #2560]
	cmp	r2, lr
	beq	.L1217
	add	r2, r7, #2560
	b	.L1219
.L1220:
	ldr	ip, [r2, #4]!
	cmp	ip, lr
	beq	.L1217
.L1219:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L1220
.L1228:
	mov	r3, #752
	add	r0, r6, #1328
	mla	r8, r3, r8, r7
	mov	r4, lr
	mov	r3, #1
	mov	r2, #101
	strb	r3, [r6, #1273]
	add	r0, r0, #8
	add	r8, r8, #68608
	str	r2, [r6, #1312]
	add	r1, r8, #696
	mov	r2, #664
	bl	memcpy
	mov	r9, #0
	str	r4, [r6, #1332]
	str	r9, [r6, #1520]
	str	r9, [r8, #636]
	strb	r9, [r8, #618]
	strb	r9, [r4]
	ldr	r3, [r6, #1332]
	str	r9, [r3, #52]
	ldr	r3, [r6, #1332]
	str	r9, [r3, #56]
	ldr	r3, [r6, #1332]
	str	r9, [r3, #8]
	ldrb	r1, [r6, #1273]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1225
	ldr	r0, [r7, #276]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r7, #276]
	bl	FSP_GetLogicFs
	mvn	r3, r8
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r4, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1223
	add	r2, r7, #3472
	add	r1, r5, #2624
	add	r2, r2, #8
	bl	HEVC_ConvertHDRInfo
	ldr	r3, [r7, #2356]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L1232
.L1224:
	ldr	r5, .L1233
	add	r1, r4, #8
	ldr	r0, [r6, #1332]
	mov	r2, #664
	ldr	r3, [r5, #52]
	add	r0, r0, #80
	blx	r3
	ldr	r1, [r6, #1332]
	add	r0, r7, #54528
	ldr	r3, [r5, #52]
	add	r1, r1, #80
	mov	r2, #664
	add	r0, r0, #56
	blx	r3
	ldr	r3, [r6, #1332]
	mov	r0, #0
	str	r8, [r3, #32]
	ldrsb	r3, [r4, #4]
	str	r3, [r6, #1308]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1217:
	add	r8, r8, #1
	add	lr, lr, #752
	cmp	r8, #20
	bne	.L1221
.L1225:
	ldr	r1, .L1233+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1232:
	add	r2, r7, #24576
	ldr	r5, [r4, #172]
	ldr	r3, [r4, #52]
	ldr	r1, [r2, #3772]
	ldr	r2, [r1, #76]
	ldr	r1, [r1, #72]
	str	r9, [r4, #368]
	mul	r5, r5, r2
	str	r1, [r4, #136]
	str	r2, [r4, #140]
	str	r9, [r4, #372]
	add	r3, r5, r3
	str	r9, [r4, #376]
	str	r3, [r4, #56]
	mov	r0, r3
	str	r9, [r4, #380]
	str	r9, [r4, #384]
	bl	MEM_Phy2Vir
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #36]
	add	r3, r5, r3
	ldr	r2, [r4, #172]
	add	r5, r5, r1
	str	r9, [r4, #564]
	str	r5, [r4, #40]
	add	r5, r5, r2
	str	r3, [r4, #72]
	str	r5, [r4, #48]
	str	r0, [r4, #560]
	mov	r0, r3
	bl	MEM_Phy2Vir
	str	r9, [r4, #580]
	str	r0, [r4, #576]
	b	.L1224
.L1223:
	strb	r3, [r6, #1273]
	mov	r0, r3
	ldr	r1, .L1233+8
	bl	dprint_vfmw
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1234:
	.align	2
.L1233:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC127
	.word	.LC128
	UNWIND(.fnend)
	.size	HEVC_AllocFrameStore, .-HEVC_AllocFrameStore
	.align	2
	.global	HEVC_IsVoFinish
	.type	HEVC_IsVoFinish, %function
HEVC_IsVoFinish:
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
	mov	r5, r0
	ldr	r0, [r0, #276]
	bl	FSP_GetFspType
	cmn	r0, #1
	mov	r4, r0
	movne	r4, #0
	bne	.L1239
	b	.L1242
.L1238:
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1240
	cmp	r4, #32
	beq	.L1243
.L1239:
	mov	r1, r4
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	add	r4, r4, #1
	cmp	r0, #0
	bne	.L1238
	ldr	r1, .L1244
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1242:
	ldr	r1, .L1244+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1240:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1243:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1245:
	.align	2
.L1244:
	.word	.LC130
	.word	.LC129
	UNWIND(.fnend)
	.size	HEVC_IsVoFinish, .-HEVC_IsVoFinish
	.align	2
	.global	HEVC_GetBackPicFromVOQueue
	.type	HEVC_GetBackPicFromVOQueue, %function
HEVC_GetBackPicFromVOQueue:
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
	mov	r5, r0
	ldr	r0, [r0, #276]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1260
.L1247:
	add	r9, r5, #69632
	add	r8, r5, #83968
	add	r9, r9, #296
	add	r8, r8, #1000
	mov	r6, #0
	mov	r7, #0
.L1250:
	sub	r4, r9, #32
	mov	r3, #0
	strb	r3, [r9, #-703]
	str	r3, [r9, #-700]
.L1249:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1261
.L1248:
	cmp	r4, r9
	bne	.L1249
	add	r9, r4, #752
	cmp	r9, r8
	bne	.L1250
	ldr	r2, [r5, #180]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r3, #0
	add	r5, r5, #2144
	mov	r1, r3
.L1252:
	add	r3, r3, #1
	str	r1, [r5, #4]!
	cmp	r3, r2
	bne	.L1252
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1261:
	mov	r1, r2
	ldr	r0, [r5, #276]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1248
.L1260:
	add	r0, r5, #62464
	add	r0, r0, #248
	bl	ResetVoQueue
	b	.L1247
	UNWIND(.fnend)
	.size	HEVC_GetBackPicFromVOQueue, .-HEVC_GetBackPicFromVOQueue
	.align	2
	.global	HEVC_RemoveFrameStoreOutDPB
	.type	HEVC_RemoveFrameStoreOutDPB, %function
HEVC_RemoveFrameStoreOutDPB:
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
	add	r6, r0, r1, lsl #2
	mov	r7, #0
	mov	r4, r1
	mov	r5, r0
	ldr	r3, [r6, #2560]
	str	r7, [r3, #4]
	ldr	r3, [r6, #2560]
	ldr	r0, [r0, #276]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1263
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1264
	ldr	r3, [r6, #2560]
	mov	r2, r7
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
.L1264:
	ldr	r3, [r6, #2560]
	mov	r2, #0
	ldr	r0, [r5, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
.L1263:
	ldr	r1, [r5, #2540]
	sub	r1, r1, #1
	cmp	r4, r1
	addls	r3, r4, #640
	addls	r3, r5, r3, lsl #2
	bhi	.L1267
.L1266:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bls	.L1266
.L1267:
	add	r3, r1, #640
	mov	r2, #0
	str	r2, [r5, r3, asl #2]
	str	r1, [r5, #2540]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveFrameStoreOutDPB, .-HEVC_RemoveFrameStoreOutDPB
	.align	2
	.global	HEVC_RemoveDummyFrame
	.type	HEVC_RemoveDummyFrame, %function
HEVC_RemoveDummyFrame:
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
	ldr	r3, [r0, #2540]
	mov	r5, r0
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r7, #0
	mov	r4, r7
	mov	r6, r7
	b	.L1279
.L1278:
	ldr	r3, [r5, #2540]
	add	r4, r4, #1
	cmp	r4, r3
	mov	r7, r4
	bcs	.L1285
.L1279:
	add	r3, r4, #640
	ldr	r3, [r5, r3, asl #2]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1278
	mov	r1, r7
	mov	r0, r5
	strb	r6, [r3]
	sub	r4, r4, #1
	bl	HEVC_RemoveApcStore
	mov	r1, r7
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
	b	.L1278
.L1285:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_RemoveDummyFrame, .-HEVC_RemoveDummyFrame
	.align	2
	.global	HEVC_RemoveUnUsedFrameStore
	.type	HEVC_RemoveUnUsedFrameStore, %function
HEVC_RemoveUnUsedFrameStore:
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
	ldr	r5, [r0, #2540]
	mov	r7, r0
	cmp	r5, #0
	beq	.L1295
	mov	r6, #0
	mvn	r8, #0
	mov	r10, r6
	mov	r9, r6
	b	.L1294
.L1305:
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	cmpne	r3, #3
	ldr	r3, [r4, #2560]
	bne	.L1290
	ldr	r0, [r3, #8]
	cmp	r0, #1
	beq	.L1290
	str	r8, [r3, #32]
	mov	r2, #1
	ldr	r3, [r4, #2560]
	strb	r1, [r3, #1]
	ldr	r3, [r4, #2560]
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2560]
.L1290:
	ldr	r3, [r3]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	addne	r10, r10, #1
	beq	.L1304
	add	r9, r9, #1
	cmp	r9, r5
	beq	.L1287
.L1294:
	add	r4, r7, r10, lsl #2
	ldr	r0, [r7, #276]
	ldr	r3, [r4, #2560]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1288
	ldrsb	r1, [r0]
	cmp	r1, #0
	beq	.L1305
	ldr	r3, [r4, #2560]
	b	.L1290
.L1288:
	ldr	r3, [r4, #2560]
	ldr	r1, [r3, #8]
	cmp	r1, #1
	beq	.L1290
	str	r8, [r3, #32]
	mov	r2, #1
	ldr	r3, [r4, #2560]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #2560]
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2560]
	b	.L1290
.L1304:
	mov	r1, r10
	mov	r0, r7
	add	r9, r9, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	cmp	r9, r5
	mov	r6, #1
	bne	.L1294
.L1287:
	mov	r0, r6
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1295:
	mov	r6, r5
	b	.L1287
	UNWIND(.fnend)
	.size	HEVC_RemoveUnUsedFrameStore, .-HEVC_RemoveUnUsedFrameStore
	.align	2
	.global	HEVC_SimpleSlideDPB
	.type	HEVC_SimpleSlideDPB, %function
HEVC_SimpleSlideDPB:
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
	ldr	r3, [r0, #2536]
	mov	r4, r0
	ldr	r2, [r0, #2540]
	cmp	r2, r3
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	cmp	r3, #15
	bls	.L1309
.L1310:
	ldr	r3, [r4, #2560]
	mov	r5, #0
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetRef
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
.L1309:
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L1310
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SimpleSlideDPB, .-HEVC_SimpleSlideDPB
	.align	2
	.global	HEVC_GetMinPOC
	.type	HEVC_GetMinPOC, %function
HEVC_GetMinPOC:
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
	mov	r7, r2
	mvn	r3, #-2147483648
	mov	r2, #0
	str	r2, [r7]
	str	r3, [r1]
	mov	r5, r1
	ldr	r2, [r0, #2540]
	mov	r6, r0
	ldr	r3, [r0, #2536]
	cmp	r2, r3
	bhi	.L1319
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1320:
	add	lr, r6, #2544
	mov	r3, #0
	add	lr, lr, #12
.L1316:
	ldr	r2, [lr, #4]!
	ldr	r4, [r5]
	ldr	ip, [r2, #12]
	cmp	r4, ip
	strgt	ip, [r5]
	strgt	r3, [r7]
	add	r3, r3, #1
	ldr	ip, [r6, #2540]
	cmp	ip, r3
	bhi	.L1316
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1319:
	ldr	r1, .L1321
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #2536]
	cmp	r2, #0
	str	r2, [r6, #2540]
	bne	.L1320
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1322:
	.align	2
.L1321:
	.word	.LC131
	UNWIND(.fnend)
	.size	HEVC_GetMinPOC, .-HEVC_GetMinPOC
	.align	2
	.global	HEVC_GetReRangeFlag
	.type	HEVC_GetReRangeFlag, %function
HEVC_GetReRangeFlag:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r3, r0, #53248
	ldr	r5, [r0, #2352]
	movw	r6, #2024
	movw	r4, #26164
	ldr	ip, [r3, #2076]
	ldr	r3, [r0, #2348]
	ldr	lr, [fp, #4]
	mla	ip, r6, ip, r5
	ldr	ip, [ip, #32]
	mla	r3, r4, ip, r3
	ldr	ip, [r3, #72]
	ldr	r3, [r3, #76]
	cmp	r1, ip
	cmpeq	lr, #0
	bne	.L1327
	cmp	r2, r3
	beq	.L1328
.L1327:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1328:
	ldr	r3, [r0, #168]
	cmp	r3, #0
	beq	.L1327
	ldr	r3, [r0, #2356]
	ldr	r0, [r3, #888]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetReRangeFlag, .-HEVC_GetReRangeFlag
	.align	2
	.global	HEVC_CalcStreamBits
	.type	HEVC_CalcStreamBits, %function
HEVC_CalcStreamBits:
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
	ldr	r4, [r0, #2364]
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L1340
	mov	r3, #0
	mov	r2, r4
	mov	r1, r3
.L1331:
	add	r3, r3, #1
	ldr	ip, [r2, #48]
	cmp	r3, lr
	add	r2, r2, #28
	add	r1, r1, ip
	bne	.L1331
.L1330:
	ldr	r2, [r0, #2340]
	mov	r3, lr, asl #5
	sub	lr, r3, lr, asl #2
	add	r4, r4, lr
	ldr	r3, [r2, #24]
	and	r3, r3, #7
	str	r3, [r4, #60]
	ldr	r2, [r0, #2364]
	ldr	r3, [r0, #2340]
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	mov	r3, ip, asl #5
	sub	r3, r3, ip, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #52]
	add	r2, r2, lr, lsr #3
	rsb	r2, r1, r2
	str	r2, [r3, #64]
	ldr	ip, [r0, #2364]
	ldr	r3, [r0, #2340]
	ldrb	r2, [ip, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	mov	r3, r2, asl #5
	sub	r2, r3, r2, asl #2
	add	r2, ip, r2
	ldr	r3, [r2, #48]
	add	r3, r1, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [r2, #56]
	ldr	r2, [r0, #2364]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	ldr	r1, [r3, #60]
	and	r2, r2, #3
	add	r2, r1, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2364]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	bic	r2, r2, #3
	str	r2, [r3, #64]
	ldr	r3, [r0, #2364]
	ldr	r2, [r3, #8]
	sub	ip, r2, #1
	cmp	ip, #1
	bhi	.L1347
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	lr, r1, #1
	cmp	r2, lr
	movhi	r2, #1
	movls	r2, #0
	cmp	lr, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1333
	add	r1, r1, #2
	mov	ip, #0
.L1334:
	sub	r2, r1, #1
	mov	lr, r2, asl #5
	sub	lr, lr, r2, asl #2
	add	r3, r3, lr
	str	ip, [r3, #60]
	ldr	r2, [r0, #2364]
	add	r2, r2, lr
	ldr	r3, [r2, #52]
	str	r3, [r2, #64]
	ldr	r2, [r0, #2364]
	add	r2, r2, lr
	ldr	r3, [r2, #48]
	mov	r3, r3, asl #3
	str	r3, [r2, #56]
	ldr	r3, [r0, #2364]
	add	r3, r3, lr
	ldr	r2, [r3, #64]
	ldr	r4, [r3, #60]
	and	r2, r2, #15
	add	r2, r4, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2364]
	add	r3, r2, lr
	ldr	r2, [r3, #64]
	bic	r2, r2, #15
	str	r2, [r3, #64]
	ldr	r3, [r0, #2364]
	ldr	r2, [r3, #8]
	cmp	r1, #1
	cmpls	r1, r2
	add	r1, r1, #1
	movcc	lr, #1
	movcs	lr, #0
	cmp	lr, #0
	bne	.L1334
	sub	ip, r2, #1
.L1333:
	mov	r1, ip, asl #5
	ldr	lr, [r3, #12]
	sub	ip, r1, ip, asl #2
	add	r3, r3, ip
	ldr	r2, [r3, #56]
	rsb	r2, lr, r2
	str	r2, [r3, #56]
	ldr	lr, [r0, #2364]
	ldrb	r1, [lr, #1]	@ zero_extendqisi2
	ldr	r3, [lr, #8]
	cmp	r1, r3
	ldmcsfd	sp, {r4, fp, sp, pc}
	sxth	r3, r1
	add	r0, r0, #53248
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1338:
	ldr	r2, [r3, #64]
	add	r1, r1, #1
	ldr	ip, [r0, #1304]
	add	r3, r3, #28
	cmp	r2, ip
	strcc	r2, [r0, #1304]
	ldr	r2, [lr, #8]
	cmp	r2, r1
	bhi	.L1338
	ldmfd	sp, {r4, fp, sp, pc}
.L1347:
	ldr	r1, .L1348
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L1340:
	mov	r1, lr
	b	.L1330
.L1349:
	.align	2
.L1348:
	.word	.LC132
	UNWIND(.fnend)
	.size	HEVC_CalcStreamBits, .-HEVC_CalcStreamBits
	.align	2
	.global	HEVC_VpsSpsPpsCheck
	.type	HEVC_VpsSpsPpsCheck, %function
HEVC_VpsSpsPpsCheck:
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
	add	r2, r0, #53248
	ldr	r3, [r0, #156]
	ldr	r2, [r2, #2076]
	cmp	r2, r3
	bge	.L1358
	movw	r3, #2024
	ldr	r1, [r0, #2352]
	mul	r3, r3, r2
	add	ip, r1, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1359
	ldr	r2, [ip, #32]
	ldr	r3, [r0, #152]
	cmp	r2, r3
	bge	.L1360
	ldr	r1, [r0, #2348]
	movw	r3, #26164
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1361
	ldr	r2, [r3, #52]
	ldr	r3, [r0, #148]
	cmp	r2, r3
	bcs	.L1362
	movw	r3, #23196
	ldr	r1, [r0, #2344]
	mul	r3, r3, r2
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1363
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1358:
	ldr	r1, .L1364
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1359:
	ldr	r1, .L1364+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1360:
	ldr	r1, .L1364+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1361:
	ldr	r1, .L1364+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1362:
	ldr	r1, .L1364+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1363:
	ldr	r1, .L1364+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1365:
	.align	2
.L1364:
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	UNWIND(.fnend)
	.size	HEVC_VpsSpsPpsCheck, .-HEVC_VpsSpsPpsCheck
	.align	2
	.global	HEVC_IsNewPic
	.type	HEVC_IsNewPic, %function
HEVC_IsNewPic:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r2, [r0, #2364]
	ldr	r1, [r0, #200]
	ldr	r3, [r2, #16]
	cmn	r1, #-2147483647
	sub	ip, r3, #16
	beq	.L1398
	cmp	r3, #21
	cmpne	ip, #2
	addls	ip, r0, #53248
	ldrls	lr, [ip, #2048]
	bls	.L1372
.L1380:
	sub	r3, r3, #19
	add	ip, r0, #53248
	cmp	r3, #1
	movls	r1, #-2147483647
	strls	r1, [r0, #200]
	ldr	lr, [ip, #2048]
.L1372:
	cmp	lr, r1
	bge	.L1370
	ldr	r3, [r2, #16]
	sub	r4, r3, #8
	cmp	r4, #1
	bls	.L1399
.L1373:
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1374
	ldr	r4, [r0, #204]
	cmp	lr, r4
	bge	.L1374
	ldr	r3, [r2, #16]
	sub	r5, r3, #8
	cmp	r5, #1
	bls	.L1400
.L1374:
	ldrb	r3, [ip, #2003]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1375
	ldr	r2, [r2, #16]
	sub	r1, r2, #19
	cmp	r1, #1
	bls	.L1395
	cmp	r2, #21
	beq	.L1395
	sub	r2, r2, #16
	cmp	r2, #2
	strls	lr, [r0, #204]
	movls	r3, #1
	strlsb	r3, [r0, #8]
.L1375:
	ldr	r2, [r0, #248]
	ldrb	r3, [ip, #2001]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r1, [ip, #2076]
	bne	.L1401
	ldr	r2, [r0, #320]
	cmp	r2, r1
	movne	r0, #1
	beq	.L1402
.L1393:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1398:
	cmp	ip, #5
	bhi	.L1396
	cmp	r3, #21
	cmpne	ip, #2
	bhi	.L1380
	add	ip, r0, #53248
	ldr	lr, [ip, #2048]
	str	lr, [r0, #200]
.L1370:
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1373
	ldr	r3, [r2, #16]
	sub	r4, r3, #8
	cmp	r4, #1
	bhi	.L1373
	str	r3, [sp, #8]
	mov	r0, #1
	str	r1, [sp, #4]
	movw	r3, #10849
	str	lr, [sp]
	ldr	r2, .L1403
	ldr	r1, .L1403+4
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1393
.L1401:
	add	r2, r2, #16896
	ldr	r1, [ip, #2076]
	add	r2, r2, #207
	ldr	r2, [r0, r2, asl #2]
	cmp	r1, r2
	ldr	r2, [r0, #320]
	movne	r3, #1
	cmp	r2, r1
	movne	r0, #1
	bne	.L1393
	b	.L1402
.L1400:
	str	r3, [sp, #12]
	mov	r0, #1
	stmia	sp, {r1, lr}
	movw	r3, #10859
	str	r4, [sp, #8]
	ldr	r2, .L1403
	ldr	r1, .L1403+8
	bl	dprint_vfmw
.L1396:
	mov	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1402:
	ldr	r0, [r0, #284]
	cmp	r0, lr
	moveq	r0, r3
	movne	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1399:
	str	r3, [sp, #8]
	mov	r0, #1
	str	r1, [sp, #4]
	movw	r3, #10841
	str	lr, [sp]
	ldr	r2, .L1403
	ldr	r1, .L1403+12
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1393
.L1395:
	str	lr, [r0, #204]
	strb	r3, [r0, #8]
	b	.L1375
.L1404:
	.align	2
.L1403:
	.word	.LANCHOR1+348
	.word	.LC140
	.word	.LC141
	.word	.LC139
	UNWIND(.fnend)
	.size	HEVC_IsNewPic, .-HEVC_IsNewPic
	.align	2
	.global	HEVC_ReadByteAlignment
	.type	HEVC_ReadByteAlignment, %function
HEVC_ReadByteAlignment:
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
	mov	r4, r0
	ldr	r0, [r0, #2340]
	bl	BsGet
	cmp	r0, #0
	beq	.L1410
	ldr	r0, [r4, #2340]
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	beq	.L1409
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r1, .L1411
	mov	r2, r0
	mov	r0, #19
	bl	dprint_vfmw
.L1409:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1410:
	ldr	r1, .L1411+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1412:
	.align	2
.L1411:
	.word	.LC143
	.word	.LC142
	UNWIND(.fnend)
	.size	HEVC_ReadByteAlignment, .-HEVC_ReadByteAlignment
	.align	2
	.global	HEVC_GetRapPicFlag
	.type	HEVC_GetRapPicFlag, %function
HEVC_GetRapPicFlag:
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
	add	r0, r0, #53248
	ldr	r0, [r0, #2072]
	sub	r0, r0, #16
	cmp	r0, #5
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetRapPicFlag, .-HEVC_GetRapPicFlag
	.align	2
	.global	HEVC_GetIdrPicFlag
	.type	HEVC_GetIdrPicFlag, %function
HEVC_GetIdrPicFlag:
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
	add	r0, r0, #53248
	ldr	r0, [r0, #2072]
	sub	r0, r0, #19
	cmp	r0, #1
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetIdrPicFlag, .-HEVC_GetIdrPicFlag
	.align	2
	.global	HEVC_DecPTL
	.type	HEVC_DecPTL, %function
HEVC_DecPTL:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	subs	r8, r2, #0
	mov	r5, r1
	mov	r4, r0
	str	r3, [fp, #-152]
	moveq	r1, #8
	bne	.L1454
.L1451:
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	str	r0, [r5, #284]
	ble	.L1418
	ldr	r3, [fp, #-152]
	add	r6, r5, #42
	add	r9, r3, #42
	mov	r7, r6
	add	r9, r5, r9
	b	.L1420
.L1419:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r7, #1]!
	cmp	r7, r9
	beq	.L1455
.L1420:
	cmp	r8, #0
	beq	.L1419
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r7, #-5]
	b	.L1419
.L1455:
	ldr	r3, [fp, #-152]
	cmp	r3, #7
	ldrle	r7, [fp, #-152]
	ble	.L1424
	b	.L1430
.L1423:
	cmp	r7, #8
	beq	.L1430
.L1424:
	mov	r1, #2
	ldr	r0, [r4, #2340]
	bl	BsGet
	add	r7, r7, #1
	cmp	r0, #0
	beq	.L1423
	ldr	r1, .L1456
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1418:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1430:
	add	r9, r5, #360
	add	r3, r5, #48
	mov	r7, #0
	b	.L1428
.L1427:
	ldr	r3, [fp, #-152]
	add	r7, r7, #1
	add	r9, r9, #4
	cmp	r3, r7
	mov	r3, r5
	ble	.L1418
.L1428:
	cmp	r8, #0
	beq	.L1452
	ldrb	r2, [r6, #-5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1450
.L1452:
	add	r5, r3, #32
.L1425:
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1427
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r9]
	b	.L1427
.L1450:
	mov	r1, #2
	ldr	r0, [r4, #2340]
	str	r3, [fp, #-156]
	bl	BsGet
	ldr	r3, [fp, #-156]
	mov	r1, #1
	add	r5, r3, #32
	mov	r10, r3
	str	r0, [r9, #-72]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #199]
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r9, #-48]
.L1426:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #1]!
	cmp	r10, r5
	bne	.L1426
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #205]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #211]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #217]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #223]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2340]
	bl	BsGet
	b	.L1425
.L1454:
	mov	r1, #2
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #1
	ldr	r9, .L1456+4
	mov	r7, r5
	mov	r6, #0
	str	r0, [r5, #276]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r5]
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r5, #272]
.L1417:
	mov	r3, r6
	ldr	ip, [r9, #68]
	ldr	r2, .L1456+8
	mov	r1, #100
	sub	r0, fp, #144
	add	r6, r6, #1
	blx	ip
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	cmp	r6, #32
	strb	r0, [r7, #1]!
	bne	.L1417
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #33]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #34]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #35]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #36]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r2, [r5, #272]
	add	r3, r4, #86016
	mov	r1, #8
	str	r2, [r3, #1712]
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	str	r2, [r3, #1716]
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	str	r2, [r3, #1720]
	b	.L1451
.L1457:
	.align	2
.L1456:
	.word	.LC145
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC144
	UNWIND(.fnend)
	.size	HEVC_DecPTL, .-HEVC_DecPTL
	.align	2
	.global	HEVC_SetDefaultScalingList
	.type	HEVC_SetDefaultScalingList, %function
HEVC_SetDefaultScalingList:
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
	ldr	r9, .L1476
	add	r10, r0, #2224
	mov	r6, #0
	add	r3, r0, #2240
	str	r0, [fp, #-52]
	str	r3, [fp, #-48]
.L1459:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L1467
	ldr	r3, [fp, #-52]
	mov	r8, r6, asl #9
	ldr	r7, [fp, #-48]
	sub	r8, r8, r6, asl #7
	add	r5, r3, #612
	mov	r4, #0
.L1465:
	cmp	r6, #0
	add	r0, r5, r8
	mov	r2, #64
	ldr	r3, [r9, #52]
	beq	.L1474
	cmp	r6, #3
	beq	.L1475
	ldr	ip, .L1476+4
	cmp	r4, #2
	ldr	r1, .L1476+8
	movhi	r1, ip
	blx	r3
.L1461:
	mov	r3, #16
	str	r3, [r7, #4]!
	ldr	r3, [r10]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1465
.L1467:
	add	r6, r6, #1
	ldr	r3, [fp, #-48]
	cmp	r6, #4
	add	r3, r3, #24
	str	r3, [fp, #-48]
	bne	.L1459
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1474:
	mov	r2, #16
	ldr	r1, .L1476+12
	mov	r0, r5
	blx	r3
	b	.L1461
.L1475:
	ldr	r0, .L1476+4
	cmp	r4, #0
	ldr	r1, .L1476+8
	mov	r2, #64
	movne	r1, r0
	add	r0, r5, #1152
	blx	r3
	b	.L1461
.L1477:
	.align	2
.L1476:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+364
	.word	.LANCHOR4
	.word	.LANCHOR1+428
	UNWIND(.fnend)
	.size	HEVC_SetDefaultScalingList, .-HEVC_SetDefaultScalingList
	.align	2
	.global	HEVC_CalScalingList
	.type	HEVC_CalScalingList, %function
HEVC_CalScalingList:
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
	add	lr, r0, r2, lsl #2
	mov	ip, r2, asl #3
	sub	r2, ip, r2, asl #1
	mov	r5, #0
	ldr	r7, [lr, #324]
	add	r3, r3, r2
	cmp	r7, #64
	mov	r6, r3, asl #4
	movcs	r7, #64
	mov	r8, r7, lsr #2
.L1479:
	cmp	r5, r8
	ldmcsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r7, #0
	beq	.L1479
	add	r3, r5, r6
	ldrb	ip, [r1]	@ zero_extendqisi2
	mov	r4, r1
	mov	r2, #0
	add	r3, r0, r3, lsl #2
	ldr	lr, [r3, #612]
	orr	ip, lr, ip
	str	ip, [r3, #612]
.L1485:
	add	r2, r2, #1
	add	r3, r5, r6
	and	lr, r2, #3
	cmp	r2, r7
	add	r3, r0, r3, lsl #2
	mov	ip, lr, asl #3
	beq	.L1479
	ldrb	r9, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #3
	ldr	lr, [r3, #612]
	addeq	r5, r5, #1
	orr	ip, lr, r9, asl ip
	str	ip, [r3, #612]
	b	.L1485
	UNWIND(.fnend)
	.size	HEVC_CalScalingList, .-HEVC_CalScalingList
	.align	2
	.global	HEVC_SetScalingList
	.type	HEVC_SetScalingList, %function
HEVC_SetScalingList:
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
	add	r6, r0, #24576
	mov	r5, r0
	ldr	r3, [r6, #3772]
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1487
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r6, #3776]
	bne	.L1488
	ldrb	r3, [r3, #21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1506
.L1489:
	ldr	r8, .L1507
	mov	r1, #0
	mov	r2, #1536
	add	r0, r5, #612
	add	r10, r5, #2224
	mov	r7, r1
	ldr	r3, [r8, #48]
	blx	r3
.L1491:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r9, r7, asl #3
	movne	r4, #0
	subne	r9, r9, r7, asl #1
	beq	.L1495
.L1492:
	add	r0, r9, r4
	ldr	r1, [r6, #3776]
	mov	r3, r4
	mov	r2, r7
	add	r1, r1, r0, lsl #6
	mov	r0, r5
	add	r1, r1, #308
	add	r4, r4, #1
	add	r1, r1, #1
	bl	HEVC_CalScalingList
	ldr	r3, [r10]
	cmp	r4, r3
	bcc	.L1492
.L1495:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1491
	ldr	r1, [r6, #3776]
	add	r0, r5, #2240
	add	r0, r0, #4
	ldr	r3, [r8, #52]
	add	r1, r1, #1920
	mov	r2, #96
	add	r1, r1, #8
	blx	r3
.L1487:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1488:
	ldrb	r1, [r3, #21]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1489
	ldr	r8, .L1507
	mov	r2, #1536
	add	r0, r0, #612
	mov	r7, r1
	add	r10, r5, #2224
	ldr	r3, [r8, #48]
	blx	r3
.L1496:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r9, r7, asl #3
	movne	r4, #0
	subne	r9, r9, r7, asl #1
	beq	.L1500
.L1497:
	add	r0, r9, r4
	ldr	r1, [r6, #3772]
	mov	r3, r4
	mov	r2, r7
	add	r1, r1, r0, lsl #6
	mov	r0, r5
	add	r1, r1, #908
	add	r4, r4, #1
	add	r1, r1, #1
	bl	HEVC_CalScalingList
	ldr	r3, [r10]
	cmp	r4, r3
	bcc	.L1497
.L1500:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1496
	ldr	r1, [r6, #3772]
	add	r0, r5, #2240
	ldr	r3, [r8, #52]
	mov	r2, #96
	add	r1, r1, #2528
	add	r0, r0, #4
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1506:
	bl	HEVC_SetDefaultScalingList
	b	.L1487
.L1508:
	.align	2
.L1507:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_SetScalingList, .-HEVC_SetScalingList
	.align	2
	.global	HEVC_GetScalingListDefaultAddress
	.type	HEVC_GetScalingListDefaultAddress, %function
HEVC_GetScalingListDefaultAddress:
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
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L1510
.L1512:
	.word	.L1516
	.word	.L1514
	.word	.L1514
	.word	.L1515
.L1514:
	ldr	r3, .L1520
	cmp	r1, #2
	add	r0, r3, #64
	movhi	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1516:
	ldr	r0, .L1520+4
	ldmfd	sp, {fp, sp, pc}
.L1515:
	ldr	r3, .L1520
	cmp	r1, #0
	add	r0, r3, #64
	movne	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1510:
	ldr	r1, .L1520+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1521:
	.align	2
.L1520:
	.word	.LANCHOR4+80
	.word	.LANCHOR4+64
	.word	.LC146
	UNWIND(.fnend)
	.size	HEVC_GetScalingListDefaultAddress, .-HEVC_GetScalingListDefaultAddress
	.align	2
	.global	HEVC_DecRefPicListsModification
	.type	HEVC_DecRefPicListsModification, %function
HEVC_DecRefPicListsModification:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r5, r3
	mov	r7, r1
	mov	r8, r2
	moveq	ip, #1
	movne	ip, #0
	cmp	r0, #0
	orreq	ip, ip, #1
	mov	r6, r0
	cmp	ip, #0
	bne	.L1532
	sub	ip, r3, #1
	mov	r4, #1
	movs	ip, ip, asr #1
	beq	.L1524
.L1525:
	movs	ip, ip, asr #1
	add	r4, r4, #1
	bne	.L1525
.L1524:
	mov	r1, #1
	ldr	r0, [r6, #2340]
	bl	BsGet
	cmp	r5, #1
	movls	r10, #0
	movhi	r10, #1
	uxtb	r0, r0
	strb	r0, [r8]
	cmp	r0, #0
	cmpne	r5, #1
	bls	.L1529
	ldr	r3, [r7, #168]
	cmp	r3, #0
	beq	.L1529
	mov	r9, r8
	mov	r5, #0
.L1530:
	mov	r1, r4
	ldr	r0, [r6, #2340]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7, #168]
	cmp	r3, r5
	bhi	.L1530
.L1529:
	ldr	r5, [r7, #60]
	cmp	r5, #0
	beq	.L1547
.L1528:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1547:
	mov	r1, #1
	ldr	r0, [r6, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #1]
	cmp	r0, #0
	moveq	r10, #0
	andne	r10, r10, #1
	cmp	r10, #0
	beq	.L1528
	ldr	r3, [r7, #172]
	cmp	r3, #0
	beq	.L1528
	add	r8, r8, #128
.L1531:
	mov	r1, r4
	ldr	r0, [r6, #2340]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r8, #4]!
	ldr	r3, [r7, #172]
	cmp	r3, r5
	bhi	.L1531
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1532:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_DecRefPicListsModification, .-HEVC_DecRefPicListsModification
	.align	2
	.global	HEVC_MoreRbspData
	.type	HEVC_MoreRbspData, %function
HEVC_MoreRbspData:
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
	ldr	r0, [r0, #2340]
	bl	BsResidBits
	subs	r3, r0, #0
	ble	.L1550
	ldr	r2, [r4, #2364]
	ldr	r0, [r2, #12]
	add	r0, r0, #3
	cmp	r3, r0
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1550:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_MoreRbspData, .-HEVC_MoreRbspData
	.align	2
	.global	HEVC_More_Rbsp_Data
	.type	HEVC_More_Rbsp_Data, %function
HEVC_More_Rbsp_Data:
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
	ldr	r0, [r0, #2340]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #24]
	mov	r2, r2, asl #3
	cmp	r2, r3
	bls	.L1554
	mov	r1, #8
	bl	BsShow
	subs	r0, r0, #128
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1554:
	ldr	r1, .L1555
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1556:
	.align	2
.L1555:
	.word	.LC147
	UNWIND(.fnend)
	.size	HEVC_More_Rbsp_Data, .-HEVC_More_Rbsp_Data
	.align	2
	.global	HEVC_FindTrailZeros
	.type	HEVC_FindTrailZeros, %function
HEVC_FindTrailZeros:
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
	mov	r1, #0
	mov	r6, r0
.L1569:
	ldr	r3, [r6, #2364]
	ldr	ip, [r3, #8]
	sub	ip, ip, #1
	mov	r0, ip, asl #2
	mov	ip, ip, asl #5
	rsb	r2, r0, ip
	add	r2, r3, r2
	add	r2, r2, #40
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #4]
	sub	r3, r3, #1
	add	r3, r2, r3
.L1558:
	ldrb	r4, [r3]	@ zero_extendqisi2
	rsb	r5, r0, ip
	cmp	r4, #0
	bne	.L1570
	ldr	r2, [r6, #2364]
	add	r1, r1, #1
	add	lr, r2, r5
	ldr	r2, [r2, #44]
	cmp	r2, r3
	beq	.L1571
	ldr	r2, [lr, #44]
	cmp	r2, r3
	sub	r3, r3, #1
	bne	.L1558
	ldr	r1, [lr, #68]
	ldr	r0, [r6, #276]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r6, #2364]
	mov	r1, r4
	add	r5, r3, r5
	str	r4, [r5, #44]
	ldr	r2, [r6, #2364]
	ldr	r3, [r2, #8]
	sub	r3, r3, #1
	str	r3, [r2, #8]
	b	.L1569
.L1570:
	tst	r4, #1
	mov	r3, #1
	moveq	r2, r3
	bne	.L1565
.L1566:
	ands	r0, r4, r2, asl r3
	add	r3, r3, #1
	bne	.L1565
	cmp	r3, #8
	bne	.L1566
	ldr	r1, .L1572
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1571:
	ldr	r1, .L1572+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1565:
	ldr	ip, [r6, #2364]
	mov	r2, #0
	add	r1, r3, r1, lsl #3
	mov	r0, r2
	str	r2, [ip, #4]
	ldr	r3, [r6, #2364]
	str	r1, [r3, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1573:
	.align	2
.L1572:
	.word	.LC149
	.word	.LC148
	UNWIND(.fnend)
	.size	HEVC_FindTrailZeros, .-HEVC_FindTrailZeros
	.align	2
	.global	HEVC_FindNaluArraySlot
	.type	HEVC_FindNaluArraySlot, %function
HEVC_FindNaluArraySlot:
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
	ldr	r6, [r0, #160]
	mov	r9, r0
	ldr	r3, [r0, #140]
	cmp	r6, #0
	blt	.L1575
	add	r7, r6, #1
	mov	r0, r3
	mov	r5, #100
	mov	r1, r7
	bl	__aeabi_uidivmod
	add	r2, r9, #65536
	ldr	r8, [r2, #2876]
	mla	r2, r5, r1, r8
	mov	r3, r1
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L1576
	mov	r4, #0
	b	.L1578
.L1579:
	bl	__aeabi_uidivmod
	mla	r2, r5, r1, r8
	mov	r3, r1
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L1576
.L1578:
	add	r4, r4, #1
	mov	r1, r7
	cmp	r4, r6
	add	r0, r3, r4
	ble	.L1579
.L1575:
	mvn	r0, #0
	str	r3, [r9, #140]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1576:
	cmp	r3, r7
	mov	r0, r3
	str	r3, [r9, #140]
	bcs	.L1589
	mov	r3, #100
	mov	r2, #1
	mla	r8, r3, r0, r8
	str	r2, [r8, #36]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1589:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FindNaluArraySlot, .-HEVC_FindNaluArraySlot
	.align	2
	.global	HEVC_ReleaseNAL
	.type	HEVC_ReleaseNAL, %function
HEVC_ReleaseNAL:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L1598
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	str	r3, [r5, #36]
	str	r3, [r5, #40]
.L1593:
	ldr	r3, [r4, #44]
	mov	r0, r6
	cmp	r3, #0
	beq	.L1592
	ldr	r1, [r4, #68]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #48]
	ldr	r3, [r4, #44]
	mov	r0, #7
	ldr	r2, .L1599
	ldr	r1, .L1599+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #44]
	str	r3, [r4, #60]
	str	r3, [r4, #48]
.L1592:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L1593
	ldr	r3, .L1599+8
	mov	r0, r5
	mov	r2, #100
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1598:
	mov	r0, r5
	movw	r3, #12146
	ldr	r2, .L1599+12
	ldr	r1, .L1599+16
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1600:
	.align	2
.L1599:
	.word	.LANCHOR1+444
	.word	.LC150
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC43
	.word	.LC44
	UNWIND(.fnend)
	.size	HEVC_ReleaseNAL, .-HEVC_ReleaseNAL
	.align	2
	.global	Hevc_InitDecBuffers
	.type	Hevc_InitDecBuffers, %function
Hevc_InitDecBuffers:
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
	add	r3, r0, #24576
	mov	r7, r0
	add	r0, r0, #2752
	add	r1, r7, #2688
	ldr	r3, [r3, #3772]
	add	r2, r7, #2544
	mov	lr, #0
	add	r1, r1, #4
	add	r2, r2, #12
	add	ip, r7, #2624
	ldr	r3, [r3, #236]
	mov	r6, #17
	add	r3, r3, #1
	cmp	r3, #17
	movhi	r3, #17
	str	r3, [r0, #-216]
	add	r0, r0, #8
	mov	r3, lr
	str	lr, [r7, #2540]
	str	lr, [r7, #2552]
	str	lr, [r7, #2556]
	str	lr, [r7, #2548]
	str	lr, [r7, #2544]
.L1604:
	subs	r6, r6, #1
	str	r3, [r0, #4]!
	str	r3, [ip, #4]!
	str	r3, [r1, #4]!
	str	r3, [r2, #4]!
	bne	.L1604
	add	r4, r7, #68608
	ldr	r10, .L1637
	add	r4, r4, #696
	mov	r8, r6
.L1605:
	ldr	r3, [r10, #48]
	mov	r2, #664
	mov	r0, r4
	mov	r1, #0
	blx	r3
	str	r8, [r4, #180]
	add	r8, r8, #1
	mov	r5, #0
	cmp	r8, #20
	sub	r3, r4, #80
	strb	r5, [r4, #-80]
	mov	r2, #20
	str	r3, [r4, #-8]
	mov	r9, #16
	str	r5, [r4, #-76]
	add	r4, r4, #752
	strb	r5, [r4, #-831]
	str	r5, [r4, #-820]
	strb	r5, [r4, #-830]
	str	r5, [r4, #-784]
	str	r2, [r4, #-808]
	str	r9, [r4, #-804]
	ldr	r3, .L1637
	bne	.L1605
	ldr	r3, [r3, #48]
	mov	r2, #200
	mov	r1, r5
	add	r0, r7, #2832
	blx	r3
	add	r2, r7, #2352
	add	r2, r2, #12
	add	r3, r7, #2432
	mov	r1, r5
	str	r9, [r7, #2832]
	str	r5, [r7, #2836]
.L1606:
	str	r1, [r2, #4]!
	cmp	r2, r3
	mov	r0, #0
	bne	.L1606
	add	r1, r7, #2496
	add	lr, r7, #53248
	add	r1, r1, #4
	mov	ip, r0
	str	r0, [lr, #2160]
.L1607:
	str	ip, [r3, #4]!
	cmp	r3, r1
	mov	r2, #0
	bne	.L1607
	str	r2, [lr, #2164]
	ldr	r1, [r7, #180]
	cmp	r1, r2
	movne	r3, r2
	addne	r2, r7, #2144
	movne	r0, r3
	beq	.L1612
.L1611:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L1611
.L1612:
	ldr	r3, [r7, #160]
	cmp	r3, #0
	beq	.L1636
	mov	r4, #0
	add	r8, r7, #65536
	mov	r5, r4
.L1617:
	ldr	r3, [r8, #3680]
	add	r3, r3, r6
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L1613
	ldr	r3, [r7, #2364]
	cmp	r1, r3
	beq	.L1613
	ldr	r0, [r7, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3680]
	add	r3, r3, r6
	str	r5, [r3, #24]
	ldr	r3, [r7, #208]
	ldr	r2, [r7, #248]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r7, #208]
	ldr	r3, [r7, #172]
	cmp	r2, #0
	subne	r2, r2, #1
	str	r2, [r7, #248]
	cmp	r3, #2
	subhi	r3, r3, #1
	movls	r3, #2
	str	r3, [r7, #172]
.L1613:
	ldr	r3, [r7, #160]
	add	r4, r4, #1
	add	r6, r6, #28
	cmp	r3, r4
	bhi	.L1617
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1636:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1638:
	.align	2
.L1637:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Hevc_InitDecBuffers, .-Hevc_InitDecBuffers
	.align	2
	.global	HEVC_EmptyFrmFromDPB
	.type	HEVC_EmptyFrmFromDPB, %function
HEVC_EmptyFrmFromDPB:
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
	subs	r6, r0, #0
	beq	.L1650
	ldr	r3, [r6, #2540]
	add	r8, r6, #2544
	cmp	r3, #0
	addne	r8, r8, #12
	movne	r3, #0
	movne	ip, #1
	movne	r1, r8
	beq	.L1665
.L1644:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	streqb	ip, [r2, #2]
	ldr	r2, [r6, #2540]
	cmp	r2, r3
	bhi	.L1644
.L1645:
	mov	r4, r6
	mov	r7, #17
	mov	r5, #0
	mov	r3, #-2147483647
	str	r3, [r6, #244]
.L1642:
	ldr	r3, [r8, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L1646
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1646:
	ldr	r3, [r4, #2628]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1647
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1647:
	ldr	r3, [r4, #2696]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1648
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1648:
	ldr	r3, [r4, #2764]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1649
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #276]
	bl	FSP_ClearLogicFs
.L1649:
	subs	r7, r7, #1
	str	r5, [r4, #2764]
	str	r5, [r4, #2696]
	add	r4, r4, #4
	str	r5, [r4, #2624]
	str	r5, [r4, #2556]
	bne	.L1642
	mov	r0, r6
	bl	Hevc_InitDecBuffers
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1665:
	add	r8, r8, #12
	b	.L1645
.L1650:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_EmptyFrmFromDPB, .-HEVC_EmptyFrmFromDPB
	.align	2
	.global	HEVC_CombinePacket
	.type	HEVC_CombinePacket, %function
HEVC_CombinePacket:
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
	ldr	r0, [r0, #2364]
	cmp	r0, #0
	beq	.L1669
	ldr	r3, [r0, #48]
	cmp	r3, #4096
	ldmcsfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L1670
	mov	r0, #7
	bl	dprint_vfmw
	ldr	r3, [r4, #2364]
	ldr	ip, .L1670+4
	mov	r5, #0
	ldr	r2, [r3, #48]
	ldr	r0, [r3, #72]
	ldr	r1, [r3, #44]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #2364]
	mov	r0, #1
	ldr	r2, [r3, #96]
	ldr	r1, [r3, #68]
	str	r2, [r3, #68]
	ldr	r3, [r4, #2364]
	str	r5, [r3, #60]
	ldr	r3, [r4, #2364]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #72]
	rsb	r2, ip, r2
	str	r2, [r3, #44]
	ldr	r3, [r4, #2364]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #80]
	rsb	r2, ip, r2
	str	r2, [r3, #52]
	ldr	r3, [r4, #2364]
	ldr	r2, [r3, #48]
	ldr	ip, [r3, #76]
	add	r2, r2, ip
	str	r2, [r3, #48]
	ldr	r3, [r4, #2364]
	str	r0, [r3, #8]
	ldr	r0, [r4, #276]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #2364]
	str	r5, [r3, #72]
	ldr	r3, [r4, #2364]
	str	r5, [r3, #88]
	ldr	r3, [r4, #2364]
	str	r5, [r3, #76]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1669:
	ldr	r1, .L1670+8
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1671:
	.align	2
.L1670:
	.word	.LC152
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC151
	UNWIND(.fnend)
	.size	HEVC_CombinePacket, .-HEVC_CombinePacket
	.align	2
	.global	HEVC_IsOutDPB
	.type	HEVC_IsOutDPB, %function
HEVC_IsOutDPB:
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
	cmp	r1, #0
	beq	.L1677
	ldr	ip, [r0, #2540]
	cmp	ip, #0
	beq	.L1677
	ldr	r3, [r0, #2560]
	cmp	r3, r1
	beq	.L1679
	add	r0, r0, #2560
	mov	r3, #0
	b	.L1674
.L1675:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1679
.L1674:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1675
.L1677:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1679:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsOutDPB, .-HEVC_IsOutDPB
	.align	2
	.global	HEVC_IsNewPicNal
	.type	HEVC_IsNewPicNal, %function
HEVC_IsNewPicNal:
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
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IsNewPicNal, .-HEVC_IsNewPicNal
	.align	2
	.global	HEVC_u_v
	.type	HEVC_u_v, %function
HEVC_u_v:
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
	.size	HEVC_u_v, .-HEVC_u_v
	.align	2
	.global	HEVC_f_v
	.type	HEVC_f_v, %function
HEVC_f_v:
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
	.size	HEVC_f_v, .-HEVC_f_v
	.align	2
	.global	HEVC_ue_v
	.type	HEVC_ue_v, %function
HEVC_ue_v:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L1686
	movw	r3, #61166
	mov	r2, r0
	movt	r3, 65535
	ldr	r1, .L1687
	mov	r0, #1
	bl	dprint_vfmw
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1686:
	add	r4, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r4
	mov	r0, r5
	bl	BsShow
	mov	r1, r4
	sub	r4, r0, #1
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1688:
	.align	2
.L1687:
	.word	.LC153
	UNWIND(.fnend)
	.size	HEVC_ue_v, .-HEVC_ue_v
	.align	2
	.global	HEVC_Sei_Tone_Mapping_Info
	.type	HEVC_Sei_Tone_Mapping_Info, %function
HEVC_Sei_Tone_Mapping_Info:
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
	mov	r4, r1
	mov	r5, r0
	ldr	r1, .L1713
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r4, #4]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	beq	.L1690
	ldr	r3, [r4, #16]
.L1691:
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L1708
.L1695:
	.word	.L1694
	.word	.L1696
	.word	.L1697
	.word	.L1698
	.word	.L1699
.L1690:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #1]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #8]
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #8
	str	r0, [r4, #12]
	bhi	.L1711
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r3, r0
	str	r0, [r4, #16]
	b	.L1691
.L1699:
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r4, #36]
	beq	.L1712
.L1707:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #52]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #56]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #60]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #64]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #68]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #72]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #52]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #76]
.L1693:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1694:
	mov	r1, #32
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #20]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #24]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1696:
	mov	r1, #32
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #28]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #32]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1697:
	ldr	r8, [r4, #12]
	mov	r3, #1
	movs	r8, r3, asl r8
	addne	r7, r4, #2128
	movne	r6, #0
	beq	.L1702
.L1701:
	ldr	r1, [r4, #8]
	add	r6, r6, #1
	ldr	r0, [r5, #2340]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	cmp	r8, r6
	str	r0, [r7, #4]!
	bne	.L1701
.L1702:
	ldr	r1, [r4, #8]
	add	r8, r4, r8, lsl #2
	mov	r3, #0
	mov	r2, #1
	mov	r2, r2, asl r1
	mov	r0, r3
	str	r2, [r8, #2132]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1698:
	mov	r1, #16
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #256
	str	r0, [r4, #80]
	bhi	.L1703
	cmp	r0, #0
	addne	r6, r4, #80
	movne	r7, #0
	beq	.L1708
.L1705:
	ldr	r1, [r4, #8]
	add	r7, r7, #1
	ldr	r0, [r5, #2340]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r6, #4]!
	ldr	r1, [r4, #12]
	ldr	r0, [r5, #2340]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r6, #1024]
	ldr	r3, [r4, #80]
	cmp	r3, r7
	bhi	.L1705
.L1708:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1712:
	mov	r1, #32
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r4, #40]
	b	.L1707
.L1711:
	mov	r2, r0
	ldr	r1, .L1713+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L1693
.L1703:
	ldr	r1, .L1713+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L1693
.L1714:
	.align	2
.L1713:
	.word	.LC154
	.word	.LC155
	.word	.LC156
	UNWIND(.fnend)
	.size	HEVC_Sei_Tone_Mapping_Info, .-HEVC_Sei_Tone_Mapping_Info
	.align	2
	.global	HEVC_Sei_Frame_Packing_Arrangement
	.type	HEVC_Sei_Frame_Packing_Arrangement, %function
HEVC_Sei_Frame_Packing_Arrangement:
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
	mov	r5, r1
	mov	r4, r0
	ldr	r1, .L1724
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r5, #12]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	bne	.L1716
	mov	r1, #7
	ldr	r0, [r4, #2340]
	bl	BsGet
	sub	r3, r0, #3
	str	r0, [r5, #16]
	cmp	r3, #2
	bhi	.L1723
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #6
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #20]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #5]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #6]
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r5, #7]
	bne	.L1719
	ldr	r3, [r5, #16]
	cmp	r3, #5
	beq	.L1719
	mov	r1, #4
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #24]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #28]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #32]
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r5, #36]
.L1719:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #40]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r5, #8]
.L1716:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r5, #9]
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1723:
	mov	r2, r0
	ldr	r1, .L1724+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1725:
	.align	2
.L1724:
	.word	.LC157
	.word	.LC158
	UNWIND(.fnend)
	.size	HEVC_Sei_Frame_Packing_Arrangement, .-HEVC_Sei_Frame_Packing_Arrangement
	.align	2
	.global	HEVC_Sei_Dec_Unit_Info
	.type	HEVC_Sei_Dec_Unit_Info, %function
HEVC_Sei_Dec_Unit_Info:
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
	cmp	r2, #0
	cmpne	r1, #0
	mov	r5, r1
	mov	r6, r2
	mov	r4, r0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L1731
	ldr	r1, .L1737
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	str	r0, [r5, #4]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r5, #8]
	bne	.L1735
.L1729:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	bne	.L1736
.L1730:
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1735:
	ldr	r1, [r6, #8]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #8]
	b	.L1729
.L1736:
	ldr	r1, [r6, #12]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #12]
	b	.L1730
.L1731:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1738:
	.align	2
.L1737:
	.word	.LC159
	UNWIND(.fnend)
	.size	HEVC_Sei_Dec_Unit_Info, .-HEVC_Sei_Dec_Unit_Info
	.align	2
	.global	HEVC_Sei_Active_Param_sets
	.type	HEVC_Sei_Active_Param_sets, %function
HEVC_Sei_Active_Param_sets:
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
	mov	r7, r1
	mov	r6, r0
	mov	r1, #4
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r7, #4]
	ldr	r0, [r6, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7]
	ldr	r0, [r6, #2340]
	bl	BsGet
	ldr	r1, .L1746
	strb	r0, [r7, #1]
	ldr	r0, [r6, #2340]
	bl	HEVC_ue_v
	cmp	r0, #15
	str	r0, [r7, #8]
	bgt	.L1740
	cmp	r0, #0
	addge	r5, r7, #8
	movge	r4, #0
	blt	.L1744
.L1743:
	ldr	r1, .L1746+4
	add	r4, r4, #1
	ldr	r0, [r6, #2340]
	bl	HEVC_ue_v
	str	r0, [r5, #4]!
	ldr	r3, [r7, #8]
	cmp	r3, r4
	bge	.L1743
.L1744:
	ldr	r0, [r6, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1740:
	ldr	r1, .L1746+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1747:
	.align	2
.L1746:
	.word	.LC160
	.word	.LC162
	.word	.LC161
	UNWIND(.fnend)
	.size	HEVC_Sei_Active_Param_sets, .-HEVC_Sei_Active_Param_sets
	.align	2
	.global	HEVC_Sei_Buf_Period
	.type	HEVC_Sei_Buf_Period, %function
HEVC_Sei_Buf_Period:
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
	add	r4, r0, #24576
	mov	r5, r1
	mov	r6, r0
	ldr	r1, [r4, #3696]
	mov	r0, #0
	ldr	r3, [r4, #3688]
	mov	r8, r2
	str	r0, [r4, #3696]
	str	r1, [r4, #3708]
	add	r3, r3, #1
	ldr	r1, .L1781
	str	r3, [r4, #3688]
	ldr	r0, [r6, #2340]
	bl	HEVC_ue_v
	cmp	r0, #15
	str	r0, [r5, #4]
	bhi	.L1776
	mov	r1, #1
	strb	r1, [r4, #3761]
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1751
	ldrb	r0, [r5]	@ zero_extendqisi2
.L1752:
	cmp	r0, #0
	bne	.L1777
.L1753:
	mov	r1, #1
	ldr	r0, [r6, #2340]
	bl	BsGet
	strb	r0, [r5, #1]
	ldr	r1, [r8, #32]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r5, #16]
	ldr	r2, [r8, #48]
	cmp	r2, #31
	bhi	.L1778
.L1754:
	mov	r4, #0
	cmp	r4, #0
	mov	r9, r5
	mov	r7, #1
	beq	.L1779
.L1755:
	cmp	r4, #1
	beq	.L1780
.L1759:
	cmp	r7, #1
	bhi	.L1758
.L1757:
	add	r4, r4, #1
	add	r7, r7, #1
	cmp	r4, #0
	add	r9, r9, #16
	bne	.L1755
.L1779:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1759
	ldr	r3, [r8, #48]
	cmn	r3, #1
	movne	r10, r9
	movne	r3, r4
	beq	.L1757
.L1771:
	ldr	r1, [r8, #28]
	add	r3, r3, #1
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	str	r3, [fp, #-48]
	str	r3, [fp, #-52]
	bl	BsGet
	str	r0, [r10, #20]
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	bl	BsGet
	ldr	r3, [fp, #-48]
	str	r0, [r10, #24]
	ldrb	r2, [r8, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1761
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1762
.L1761:
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	str	r3, [fp, #-48]
	bl	BsGet
	str	r0, [r10, #28]
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	bl	BsGet
	ldr	r3, [fp, #-48]
	str	r0, [r10, #32]
.L1762:
	ldr	r2, [r8, #48]
	add	r10, r10, #32
	add	r2, r2, #1
	cmp	r2, r3
	bhi	.L1771
	b	.L1759
.L1758:
	ldr	r0, [r6, #2340]
	bl	BsToNextByte
	mov	r0, #0
.L1775:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1778:
	ldr	r1, .L1781+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r8, #48]
	b	.L1754
.L1777:
	ldr	r1, [r8, #32]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #8]
	ldr	r1, [r8, #36]
	ldr	r0, [r6, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #12]
	b	.L1753
.L1751:
	ldr	r0, [r6, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	b	.L1752
.L1776:
	mov	r2, r0
	ldr	r1, .L1781+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1775
.L1780:
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1758
	ldr	r3, [r8, #48]
	cmn	r3, #1
	beq	.L1758
	mov	r10, r9
	mov	r3, #0
	b	.L1771
.L1782:
	.align	2
.L1781:
	.word	.LC163
	.word	.LC165
	.word	.LC164
	UNWIND(.fnend)
	.size	HEVC_Sei_Buf_Period, .-HEVC_Sei_Buf_Period
	.align	2
	.global	HEVC_Sei_Pic_Timming
	.type	HEVC_Sei_Pic_Timming, %function
HEVC_Sei_Pic_Timming:
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
	add	r3, r0, #24576
	mov	r5, r2
	mov	r6, r1
	mov	r4, r0
	ldr	r1, [r3, #3692]
	ldr	r2, [r3, #3696]
	add	r1, r1, #1
	str	r1, [r3, #3692]
	add	r2, r2, #1
	str	r2, [r3, #3696]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1811
.L1784:
	ldrh	r3, [r5, #108]
	cmp	r3, #0
	beq	.L1786
	ldr	r1, [r5, #140]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r6, #12]
	ldr	r1, [r5, #144]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #16]
	ldrb	r3, [r5, #110]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1787
.L1790:
	ldr	r2, [r4, #276]
	ldr	r3, .L1814
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L1812
.L1786:
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1811:
	mov	r1, #4
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #2
	str	r0, [r6, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #8]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r6]
	b	.L1784
.L1812:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L1786
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L1786
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1786
.L1787:
	ldr	r1, [r5, #120]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #20]
	ldrb	r3, [r5, #110]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1790
	ldrb	r3, [r5, #111]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1790
	ldr	r1, .L1814+4
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r6, #24]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #1]
	cmp	r0, #0
	bne	.L1813
.L1791:
	ldr	r3, [r6, #24]
	cmp	r3, #255
	bhi	.L1795
	add	r8, r6, #28
	mov	r7, #0
	b	.L1794
.L1793:
	ldr	r3, [r6, #24]
	cmp	r3, r7
	bcc	.L1790
.L1794:
	ldr	r1, .L1814+8
	add	r7, r7, #1
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	str	r0, [r8, #4]!
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1793
	ldr	r1, [r5, #116]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r8, #1024]
	b	.L1793
.L1813:
	ldr	r1, [r5, #116]
	ldr	r0, [r4, #2340]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #28]
	b	.L1791
.L1795:
	ldr	r1, .L1814+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1815:
	.align	2
.L1814:
	.word	s_pstVfmwChan
	.word	.LC166
	.word	.LC168
	.word	.LC167
	UNWIND(.fnend)
	.size	HEVC_Sei_Pic_Timming, .-HEVC_Sei_Pic_Timming
	.align	2
	.global	HEVC_Sei_Color_Volume_Reconstruction_Info
	.type	HEVC_Sei_Color_Volume_Reconstruction_Info, %function
HEVC_Sei_Color_Volume_Reconstruction_Info:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r5, r1
	beq	.L1826
	ldr	r1, .L1830
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r5, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	beq	.L1818
.L1822:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1818:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #9]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #1
	beq	.L1829
.L1819:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #13]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #14]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #15]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #16]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #17]
	ldr	r0, [r4, #2340]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #18]
	addne	r7, r5, #18
	movne	r6, #0
	beq	.L1824
.L1823:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1823
.L1824:
	mov	r1, #4
	ldr	r0, [r4, #2340]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #49]
	addne	r7, r5, #49
	movne	r6, #0
	beq	.L1822
.L1825:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #49]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1825
	b	.L1822
.L1826:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1829:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #11]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r5, #12]
	b	.L1819
.L1831:
	.align	2
.L1830:
	.word	.LC169
	UNWIND(.fnend)
	.size	HEVC_Sei_Color_Volume_Reconstruction_Info, .-HEVC_Sei_Color_Volume_Reconstruction_Info
	.align	2
	.global	HEVC_Sei_User_Data_Registered_Itu_T_T35
	.type	HEVC_Sei_User_Data_Registered_Itu_T_T35, %function
HEVC_Sei_User_Data_Registered_Itu_T_T35:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r6, r2
	mov	r5, r0
	mov	r7, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L1839
	cmp	r2, #3
	bls	.L1842
	mov	r1, #8
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r7]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #8
	strh	r0, [r7, #2]	@ movhi
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #4]
	cmp	r0, #2
	beq	.L1843
	cmp	r0, #4
	beq	.L1844
	subs	r6, r6, #4
	beq	.L1838
.L1837:
	add	r4, r4, #1
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r6, r4
	bne	.L1837
.L1838:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1843:
	add	r1, r5, #6656
	mov	r0, r5
	add	r1, r1, #30
	bl	HEVC_Sei_TSI
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1844:
	add	r1, r5, #6656
	mov	r0, r5
	add	r1, r1, #36
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1839:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1842:
	ldr	r1, .L1845
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1846:
	.align	2
.L1845:
	.word	.LC170
	UNWIND(.fnend)
	.size	HEVC_Sei_User_Data_Registered_Itu_T_T35, .-HEVC_Sei_User_Data_Registered_Itu_T_T35
	.align	2
	.global	HEVC_DecShortTermRefPicSet
	.type	HEVC_DecShortTermRefPicSet, %function
HEVC_DecShortTermRefPicSet:
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
	subs	r7, r3, #0
	mov	r5, r0
	mov	r6, r1
	mov	r4, r2
	streq	r7, [r2]
	bne	.L1889
.L1850:
	ldr	r1, .L1898
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #16]
	bhi	.L1890
	ldr	r1, .L1898+4
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #20]
	bhi	.L1891
	ldr	r6, [r4, #16]
	add	r2, r0, r6
	str	r2, [r4, #24]
	cmp	r2, #16
	bhi	.L1875
	cmp	r6, #0
	addne	r10, r4, #68
	addne	r9, r4, #52
	movne	r7, #0
	movne	r8, r7
	bne	.L1879
	b	.L1877
.L1878:
	str	r8, [r10, #4]!
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r6, [r4, #16]
	cmp	r6, r7
	bls	.L1892
.L1879:
	ldr	r1, .L1898+8
	add	r7, r7, #1
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	cmp	r0, #32768
	mvn	r3, r0
	add	r8, r8, r3
	bcc	.L1878
	mov	r2, r0
	ldr	r1, .L1898+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1889:
	mov	r1, #1
	ldr	r0, [r0, #2340]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4]
	beq	.L1850
	ldr	r8, [r6, #228]
	cmp	r8, r7
	movne	r0, #0
	strne	r0, [r4, #4]
	beq	.L1893
.L1853:
	sub	r3, r7, #1
	rsb	r7, r0, r3
	cmp	r7, r3
	bhi	.L1894
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L1898+16
	str	r0, [r4, #8]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	mov	r3, #204
	mul	r3, r3, r7
	ldr	r1, [r4, #8]
	mov	r1, r1, asl #1
	add	r9, r6, r3
	rsb	r1, r1, #1
	add	r9, r9, #13120
	add	r9, r9, #8
	add	r0, r0, #1
	str	r0, [r4, #12]
	ldr	r2, [r9, #4]
	mul	r1, r1, r0
	cmp	r2, #16
	str	r1, [fp, #-56]
	bhi	.L1895
	add	r2, r3, #13120
	mov	r10, #0
	add	r2, r2, #60
	add	r8, r4, #35
	add	r6, r6, r2
	str	r10, [fp, #-48]
	str	r10, [fp, #-52]
	mov	r7, r10
	b	.L1862
.L1857:
	sub	r2, r0, #1
	cmp	r2, #1
	bls	.L1896
.L1858:
	strb	r0, [r8, #1]!
	add	r10, r10, #1
	ldr	r2, [r9, #4]
	add	r6, r6, #4
	cmp	r2, r10
	bcc	.L1897
.L1862:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #0
	bne	.L1857
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r0, r0, asl #1
	sub	r2, r0, #1
	cmp	r2, #1
	bhi	.L1858
.L1896:
	ldr	r2, [r9, #4]
	add	r1, r7, #18
	ldr	r3, [fp, #-56]
	sub	ip, r0, #1
	cmp	r2, r10
	clz	ip, ip
	ldrhi	r2, [r6]
	movls	r2, #0
	mov	ip, ip, lsr #5
	add	r2, r2, r3
	str	r2, [r4, r1, asl #2]
	cmp	r2, #0
	add	r2, r4, r7
	add	r7, r7, #1
	ldrlt	r3, [fp, #-52]
	ldrge	r3, [fp, #-48]
	addlt	r3, r3, #1
	strb	ip, [r2, #53]
	addge	r3, r3, #1
	strlt	r3, [fp, #-52]
	strge	r3, [fp, #-48]
	b	.L1858
.L1897:
	add	r2, r2, #1
	ldr	r3, [fp, #-52]
	str	r2, [r4, #28]
	cmp	r7, #16
	ldr	r2, [fp, #-48]
	str	r7, [r4, #24]
	str	r3, [r4, #16]
	str	r2, [r4, #20]
	bhi	.L1863
	cmp	r3, #16
	bhi	.L1863
	cmp	r2, #16
	bhi	.L1863
	cmp	r7, #1
	subhi	r7, r7, #1
	addhi	r8, r4, #72
	addhi	r6, r4, #53
	movhi	r5, #0
	bls	.L1869
.L1868:
	ldr	ip, [r8, #4]!
	cmp	r5, #0
	ldrb	lr, [r6, #1]!	@ zero_extendqisi2
	mov	r2, r5
	movge	r1, r8
	movge	r3, r6
	blt	.L1871
.L1867:
	ldr	r0, [r1, #-4]!
	sub	r3, r3, #1
	cmp	ip, r0
	strlt	r0, [r1, #4]
	ldrltb	r0, [r3]	@ zero_extendqisi2
	strltb	r0, [r3, #1]
	strlt	ip, [r1]
	strltb	lr, [r3]
	subs	r2, r2, #1
	bpl	.L1867
.L1871:
	add	r5, r5, #1
	cmp	r5, r7
	bne	.L1868
.L1869:
	ldr	r3, [fp, #-52]
	movs	r6, r3, lsr #1
	beq	.L1866
	ldr	r3, [fp, #-52]
	add	r0, r4, #72
	mov	r1, #0
	add	r2, r3, #17
	add	r3, r3, #52
	add	r3, r4, r3
	add	r2, r4, r2, lsl #2
	add	r4, r4, #53
.L1872:
	ldr	r5, [r2]
	add	r1, r1, #1
	ldr	lr, [r0]
	cmp	r1, r6
	ldrb	ip, [r4]	@ zero_extendqisi2
	str	r5, [r0], #4
	ldrb	r5, [r3]	@ zero_extendqisi2
	strb	r5, [r4], #1
	str	lr, [r2], #-4
	strb	ip, [r3], #-1
	bne	.L1872
.L1866:
	mov	r0, #0
.L1854:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1892:
	ldr	r2, [r4, #24]
.L1877:
	cmp	r2, r6
	bls	.L1866
	add	r8, r6, #17
	add	r9, r6, #52
	add	r9, r4, r9
	mov	r7, #0
	add	r8, r4, r8, lsl #2
.L1880:
	ldr	r1, .L1898+20
	add	r6, r6, #1
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	add	r0, r0, r1
	add	r7, r7, r0
	str	r7, [r8, #4]!
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r3, [r4, #24]
	cmp	r3, r6
	bhi	.L1880
	b	.L1866
.L1893:
	ldr	r1, .L1898+24
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r4, #4]
	cmp	r8, r2
	bcs	.L1853
	mov	r3, r8
	ldr	r1, .L1898+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1863:
	ldr	r1, .L1898+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1890:
	mov	r2, r0
	ldr	r1, .L1898+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1894:
	mov	r2, r7
	ldr	r1, .L1898+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1895:
	ldr	r1, .L1898+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1891:
	ldr	r2, [r4, #16]
	mov	r0, #1
	ldr	r1, .L1898+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1875:
	mov	r3, #16
	ldr	r1, .L1898+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1854
.L1899:
	.align	2
.L1898:
	.word	.LC177
	.word	.LC179
	.word	.LC182
	.word	.LC183
	.word	.LC174
	.word	.LC184
	.word	.LC171
	.word	.LC172
	.word	.LC176
	.word	.LC178
	.word	.LC173
	.word	.LC175
	.word	.LC180
	.word	.LC181
	UNWIND(.fnend)
	.size	HEVC_DecShortTermRefPicSet, .-HEVC_DecShortTermRefPicSet
	.align	2
	.global	HEVC_DecHrdParam
	.type	HEVC_DecHrdParam, %function
HEVC_DecHrdParam:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r7, r3
	mov	r5, r0
	mov	r8, r1
	beq	.L1922
	cmp	r2, #0
	bne	.L1947
.L1905:
	mov	r4, r8
	mov	r6, #0
.L1919:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #0
	movne	r3, #1
	strneb	r3, [r4, #41]
	beq	.L1948
.L1907:
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	mov	r3, #0
	strb	r3, [r4, #42]
	cmp	r2, r3
	str	r3, [r4, #48]
	beq	.L1908
	ldr	r1, .L1955
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #44]
	beq	.L1910
.L1951:
	ldr	r2, [r4, #48]
	cmp	r2, #31
	bhi	.L1949
.L1912:
	mov	r2, r4
	mov	r10, #0
.L1921:
	cmp	r10, #0
	beq	.L1950
	cmp	r10, #1
	beq	.L1945
.L1918:
	add	r10, r10, #1
	add	r2, r2, #4
	cmp	r10, #2
	bne	.L1921
.L1917:
	add	r6, r6, #1
	add	r4, r4, #1280
	cmp	r7, r6
	add	r4, r4, #12
	bcs	.L1919
	mov	r0, #0
.L1944:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1908:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r3, r0
	strb	r3, [r4, #42]
	cmp	r3, #0
	bne	.L1951
.L1910:
	ldr	r1, .L1955+4
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	mov	r2, r0
	cmp	r2, #31
	str	r0, [r4, #48]
	bls	.L1912
.L1949:
	ldr	r1, .L1955+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #48]
	b	.L1912
.L1948:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #41]
	b	.L1907
.L1947:
	mov	r1, #1
	ldr	r0, [r0, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8]
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r8, #1]
	ldrh	r3, [r8]
	cmp	r3, #0
	beq	.L1905
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #2]
	cmp	r0, #0
	bne	.L1952
.L1903:
	mov	r1, #4
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #16]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r8, #20]
	bne	.L1953
.L1904:
	mov	r1, #5
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #28]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #32]
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r8, #36]
	b	.L1905
.L1922:
	mvn	r0, #0
	b	.L1944
.L1953:
	mov	r1, #4
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r8, #24]
	b	.L1904
.L1952:
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #4]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #8]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r8, #3]
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r8, #36]
	b	.L1903
.L1950:
	ldrb	r1, [r8]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1954
	mov	r9, r2
	str	r10, [fp, #-48]
	b	.L1935
.L1920:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	str	r2, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-48]
	add	r9, r9, #8
	ldr	r2, [fp, #-52]
	str	r0, [r9, #1068]
	ldr	r1, [r4, #48]
	cmp	r1, r3
	bcc	.L1918
.L1935:
	ldr	r3, [fp, #-48]
	ldr	r1, .L1955+12
	ldr	r0, [r5, #2340]
	add	r3, r3, #1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	bl	HEVC_ue_v
	ldr	r1, .L1955+16
	str	r0, [r9, #52]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r2, [fp, #-52]
	str	r0, [r9, #308]
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1920
	ldr	r1, .L1955+20
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L1955+24
	str	r0, [r9, #564]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r2, [fp, #-52]
	str	r0, [r9, #820]
	b	.L1920
.L1954:
	add	r2, r2, #4
	mov	r10, #1
.L1945:
	ldrb	r1, [r8, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1917
	mov	r3, #0
	mov	r9, r2
	str	r3, [fp, #-48]
	b	.L1935
.L1956:
	.align	2
.L1955:
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	UNWIND(.fnend)
	.size	HEVC_DecHrdParam, .-HEVC_DecHrdParam
	.align	2
	.global	HEVC_ProcessVPS
	.type	HEVC_ProcessVPS, %function
HEVC_ProcessVPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #124)
	sub	sp, sp, #124
	mov	r6, r1
	mov	r7, r0
	mov	r1, #2
	ldr	r0, [r0, #2340]
	bl	BsGet
	cmp	r0, #3
	str	r0, [r6, #12]
	beq	.L1958
	mov	r2, r0
	ldr	r1, .L2010
	mov	r0, #1
	bl	dprint_vfmw
.L1958:
	mov	r1, #6
	ldr	r0, [r7, #2340]
	bl	BsGet
	cmp	r0, #63
	str	r0, [r6, #16]
	bhi	.L2002
	mov	r1, #3
	ldr	r0, [r7, #2340]
	bl	BsGet
	cmp	r0, #7
	str	r0, [fp, #-152]
	bhi	.L2003
	ldr	r3, [fp, #-152]
	mov	r1, #1
	add	r5, r3, #1
	str	r5, [r6, #20]
	ldr	r0, [r7, #2340]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #1]
	ldr	r0, [r7, #2340]
	bl	BsGet
	movw	r3, #65535
	cmp	r0, r3
	str	r0, [r6, #24]
	bne	.L2004
	add	r1, r6, #12416
	ldr	r3, [fp, #-152]
	add	r1, r1, #20
	mov	r2, #1
	mov	r0, r7
	bl	HEVC_DecPTL
	subs	r4, r0, #0
	bne	.L2005
	mov	r1, #1
	ldr	r0, [r7, #2340]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	addge	r8, r6, #48
	strb	r0, [r6, #7]
	bge	.L1970
	b	.L1968
.L1967:
	add	r4, r4, #1
	cmp	r4, r5
	beq	.L1968
.L1970:
	ldr	r1, .L2010+4
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2010+8
	add	r0, r0, #1
	str	r0, [r8, #4]!
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2010+12
	str	r0, [r8, #32]
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	str	r0, [r8, #64]
	ldrb	r3, [r6, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1967
	ldr	r3, [fp, #-152]
	add	r2, r4, #1
	cmp	r3, r2
	blt	.L1968
	add	r3, r4, #13
	add	r3, r6, r3, lsl #2
.L1969:
	ldr	r1, [r6, #52]
	add	r2, r2, #1
	cmp	r2, r5
	str	r1, [r3, #4]!
	ldr	r1, [r6, #84]
	str	r1, [r3, #32]
	ldr	r1, [r6, #116]
	str	r1, [r3, #64]
	bne	.L1969
.L1968:
	mov	r1, #6
	ldr	r0, [r7, #2340]
	bl	BsGet
	ldr	r1, .L2010+16
	str	r0, [r6, #28]
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #32]
	bhi	.L2006
	cmp	r0, #1
	ble	.L1971
	ldr	r10, .L2010+20
	add	r9, r6, #148
	mov	r8, #1
.L1972:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	movgt	r5, r9
	movgt	r4, #0
	ble	.L1974
.L1973:
	ldr	r2, .L2010+24
	mov	r3, r8
	str	r4, [sp]
	mov	r1, #100
	ldr	ip, [r10, #68]
	sub	r0, fp, #144
	blx	ip
	mov	r1, #1
	ldr	r0, [r7, #2340]
	add	r4, r4, r1
	bl	BsGet
	str	r0, [r5, #4]!
	ldr	r2, [r6, #28]
	cmp	r2, r4
	bgt	.L1973
.L1974:
	ldr	r3, [r6, #32]
	add	r8, r8, #1
	add	r9, r9, #4
	cmp	r3, r8
	bgt	.L1972
.L1971:
	mov	r1, #1
	ldr	r0, [r7, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #6]
	cmp	r0, #0
	beq	.L1980
	mov	r1, #32
	ldr	r0, [r7, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r7, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #40]
	ldr	r0, [r7, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #5]
	cmp	r0, #0
	bne	.L2007
.L1978:
	ldr	r1, .L2010+28
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #48]
	bcs	.L2008
	cmp	r0, #0
	ble	.L1980
	add	r9, r6, #8192
	mov	r3, #1
	ldr	r1, .L2010+32
	add	r8, r6, #12800
	str	r3, [r9, #148]
	add	r5, r6, #4224
	ldr	r0, [r7, #2340]
	add	r8, r8, #20
	bl	HEVC_ue_v
	add	r3, r6, #4096
	add	r5, r5, #24
	mov	r4, #0
	str	r0, [r3, #148]
	ldr	r0, [r9, #148]
	ldr	r9, [fp, #-152]
.L1981:
	uxtb	r2, r0
	mov	r1, r8
	mov	r3, r9
	mov	r0, r7
	bl	HEVC_DecHrdParam
	add	r4, r4, #1
	ldr	r1, .L2010+32
	cmp	r0, #0
	bne	.L2009
	ldr	r3, [r6, #48]
	cmp	r3, r4
	ble	.L1980
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	cmp	r4, #0
	mov	r1, #1
	str	r0, [r5], #4
	ldrle	r0, [r5, #4092]
	ble	.L1981
	ldr	r0, [r7, #2340]
	bl	BsGet
	str	r0, [r5, #4092]
	b	.L1981
.L1980:
	mov	r1, #1
	ldr	r0, [r7, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3]
	cmp	r0, #0
	bne	.L1997
.L1977:
	mov	r0, #0
.L1960:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1986:
	ldr	r0, [r7, #2340]
	bl	BsGet
	strb	r0, [r6, #4]
.L1997:
	mov	r0, r7
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1986
	b	.L1977
.L2009:
	ldr	r1, .L2010+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2007:
	ldr	r1, .L2010+40
	ldr	r0, [r7, #2340]
	bl	HEVC_ue_v
	str	r0, [r6, #44]
	b	.L1978
.L2004:
	ldr	r1, .L2010+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2002:
	ldr	r1, .L2010+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2005:
	ldr	r1, .L2010+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2003:
	mov	r2, r0
	ldr	r1, .L2010+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2006:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L2010+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2008:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L2010+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1960
.L2011:
	.align	2
.L2010:
	.word	.LC192
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC197
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC202
	.word	.LC204
	.word	.LC206
	.word	.LC207
	.word	.LC203
	.word	.LC195
	.word	.LC193
	.word	.LC196
	.word	.LC194
	.word	.LC201
	.word	.LC205
	UNWIND(.fnend)
	.size	HEVC_ProcessVPS, .-HEVC_ProcessVPS
	.align	2
	.global	HEVC_DecVPS
	.type	HEVC_DecVPS, %function
HEVC_DecVPS:
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
	mov	r1, #4
	mov	r4, r0
	ldr	r0, [r0, #2340]
	bl	BsGet
	cmp	r0, #15
	mov	r6, r0
	bhi	.L2018
	movw	r7, #23196
	ldr	r3, [r4, #2344]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2019
	str	r0, [r2, #8]
	mov	r0, r4
	ldr	r1, [r4, #2344]
	add	r1, r1, r5
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L2020
	ldr	r3, [r4, #2344]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2344]
	strb	r2, [r3, r5]
.L2014:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2019:
	ldr	r9, .L2022
	mov	r0, r4
	ldr	r1, .L2022+4
	str	r6, [r9, #-3456]
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L2021
	ldr	ip, .L2022+8
	mov	r3, #1
	ldr	r0, [r4, #2344]
	mov	r2, r7
	ldr	r1, .L2022+4
	add	r0, r0, r5
	ldr	ip, [ip, #56]
	strb	r3, [r9, #-3462]
	strb	r3, [r9, #-3464]
	blx	ip
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2021:
	mov	r2, r6
	ldr	r1, .L2022+12
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2014
.L2018:
	ldr	r1, .L2022+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L2014
.L2020:
	mov	r2, r6
	ldr	r1, .L2022+20
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2344]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2344]
	strb	r9, [r3, r5]
	b	.L2014
.L2023:
	.align	2
.L2022:
	.word	.LANCHOR5
	.word	.LANCHOR5-3464
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC209
	.word	.LC208
	.word	.LC210
	UNWIND(.fnend)
	.size	HEVC_DecVPS, .-HEVC_DecVPS
	.align	2
	.global	HEVC_DecVuiParam
	.type	HEVC_DecVuiParam, %function
HEVC_DecVuiParam:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	ldr	r3, .L2077
	mov	r5, r0
	mov	r4, r1
	add	ip, r3, #16
	mov	r6, r2
	ldmia	r3, {r0, r1, r2, r3}
	sub	lr, fp, #60
	stmia	lr, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	sub	ip, fp, #28
	stmdb	ip, {r0, r1, r2, r3}
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	bne	.L2068
.L2026:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #1]
	cmp	r0, #0
	bne	.L2069
.L2028:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3]
	cmp	r0, #0
	bne	.L2070
.L2030:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L2071
.L2032:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #8]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L2033
	ldr	r1, .L2077+4
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	str	r0, [r4, #60]
	ldr	r3, [r6, #64]
	cmp	r3, #3
	bhi	.L2072
	sub	r2, fp, #28
	ldr	r1, .L2077+8
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #60]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	ldr	r1, .L2077+12
	str	r0, [r4, #64]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #64]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	ldr	r1, .L2077+16
	str	r0, [r4, #68]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #68]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	str	r0, [r4, #72]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #72]
.L2033:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #11]
	cmp	r0, #0
	beq	.L2036
	mov	r1, #32
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #76]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #80]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, [r4, #76]
	cmp	r1, #0
	uxtb	r0, r0
	strb	r0, [r4, #12]
	beq	.L2037
	ldr	r3, [r4, #80]
	mov	r0, #1000
	add	r7, r5, #86016
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r7, #1736]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
.L2037:
	cmp	r0, #0
	bne	.L2073
.L2038:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	bne	.L2074
.L2036:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	moveq	r3, r0
	bne	.L2075
.L2035:
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2075:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #15]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #16]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L2077+20
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #88]
	bcs	.L2076
.L2039:
	ldr	r1, .L2077+24
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2077+28
	str	r0, [r4, #92]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2077+32
	str	r0, [r4, #96]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2077+36
	str	r0, [r4, #100]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	mov	r3, #0
	str	r0, [r4, #104]
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2071:
	ldr	r1, .L2077+40
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2077+44
	str	r0, [r4, #52]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	str	r0, [r4, #56]
	b	.L2032
.L2068:
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r4, #24]
	bne	.L2026
	mov	r1, #16
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #28]
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r4, #32]
	b	.L2026
.L2070:
	mov	r1, #3
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #36]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L2030
	mov	r1, #8
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #40]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #44]
	ldr	r0, [r5, #2340]
	bl	BsGet
	str	r0, [r4, #48]
	b	.L2030
.L2069:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #2]
	b	.L2028
.L2074:
	ldr	r3, [r6, #56]
	mov	r2, #1
	add	r1, r4, #108
	mov	r0, r5
	bl	HEVC_DecHrdParam
	cmp	r0, #0
	beq	.L2036
	ldr	r1, .L2077+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L2035
.L2073:
	ldr	r1, .L2077+52
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	str	r0, [r4, #84]
	b	.L2038
.L2076:
	ldr	r1, .L2077+56
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2039
.L2072:
	ldr	r1, .L2077+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L2035
.L2078:
	.align	2
.L2077:
	.word	.LANCHOR1+460
	.word	.LC213
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC220
	.word	.LC222
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.word	.LC211
	.word	.LC212
	.word	.LC219
	.word	.LC218
	.word	.LC221
	.word	.LC214
	UNWIND(.fnend)
	.size	HEVC_DecVuiParam, .-HEVC_DecVuiParam
	.align	2
	.global	HEVC_se_v
	.type	HEVC_se_v, %function
HEVC_se_v:
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
	mov	r1, #32
	mov	r5, r0
	bl	BsShow
	bl	ZerosMS_32
	cmp	r0, #31
	bls	.L2084
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2084:
	add	r6, r0, #1
	mov	r1, r0
	mov	r0, r5
	bl	BsSkip
	mov	r1, r6
	mov	r0, r5
	bl	BsShow
	mov	r1, r6
	sub	r0, r0, #1
	tst	r0, #1
	mov	r3, r0, asr #1
	mov	r0, r5
	addne	r4, r3, #1
	rsbeq	r4, r3, #0
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_se_v, .-HEVC_se_v
	.align	2
	.global	HEVC_Sei_Structure_Of_Pictures_Info
	.type	HEVC_Sei_Structure_Of_Pictures_Info, %function
HEVC_Sei_Structure_Of_Pictures_Info:
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
	mov	r9, r1
	mov	r5, r0
	ldr	r1, .L2097
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2097+4
	str	r0, [r9]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r9, #4]
	bhi	.L2086
	cmp	r0, #0
	beq	.L2092
	add	r7, r9, #4096
	add	r8, r9, #12288
	add	r7, r7, #8
	add	r8, r8, #8
	add	r6, r9, #4
	mov	r4, #0
	b	.L2091
.L2090:
	ldr	r3, [r9, #4]
	add	r8, r8, #4
	cmp	r3, r4
	bls	.L2092
.L2091:
	mov	r1, #6
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #3
	str	r0, [r6, #4]!
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L2097+8
	str	r0, [r7], #4
	ldr	r3, [r6]
	sub	r3, r3, #19
	cmp	r3, #1
	bls	.L2089
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	str	r0, [r7, #4092]
.L2089:
	cmp	r4, #0
	add	r4, r4, #1
	beq	.L2090
	ldr	r1, .L2097+12
	add	r8, r8, #4
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	str	r0, [r8, #-4]
	ldr	r3, [r9, #4]
	cmp	r3, r4
	bhi	.L2091
.L2092:
	ldr	r0, [r5, #2340]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2086:
	ldr	r1, .L2097+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2098:
	.align	2
.L2097:
	.word	.LC226
	.word	.LC227
	.word	.LC229
	.word	.LC230
	.word	.LC228
	UNWIND(.fnend)
	.size	HEVC_Sei_Structure_Of_Pictures_Info, .-HEVC_Sei_Structure_Of_Pictures_Info
	.align	2
	.global	HEVC_Sei_Recovery_Point
	.type	HEVC_Sei_Recovery_Point, %function
HEVC_Sei_Recovery_Point:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r6, r1
	moveq	r5, #1
	movne	r5, #0
	beq	.L2101
	ldr	r1, .L2102
	ldr	r0, [r0, #2340]
	bl	HEVC_se_v
	mov	r1, #1
	str	r0, [r6, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r6, #1]
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2101:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2103:
	.align	2
.L2102:
	.word	.LC231
	UNWIND(.fnend)
	.size	HEVC_Sei_Recovery_Point, .-HEVC_Sei_Recovery_Point
	.align	2
	.global	HEVC_Sei_Color_Remapping_Info
	.type	HEVC_Sei_Color_Remapping_Info, %function
HEVC_Sei_Color_Remapping_Info:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r4, r0
	mov	r8, r1
	beq	.L2119
	ldr	r1, .L2132
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r8, #4]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #8]
	cmp	r0, #0
	beq	.L2106
.L2117:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2106:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #9]
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r8, #10]
	cmp	r1, #1
	beq	.L2130
.L2107:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	add	r9, r8, #18
	add	r10, r8, #19
	mov	r7, r8
	strb	r0, [r8, #15]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r7, #16]!
.L2109:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #0
	beq	.L2111
	mov	r6, r9
	mov	r5, #0
.L2108:
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2340]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2108
.L2111:
	cmp	r7, r10
	add	r9, r9, #66
	bne	.L2109
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #416]
	cmp	r0, #1
	beq	.L2131
.L2112:
	add	r10, r8, #456
	add	r7, r8, #452
	add	r10, r10, #2
	add	r7, r7, #3
	mov	r9, r10
.L2116:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #0
	beq	.L2118
	mov	r6, r9
	mov	r5, #0
.L2115:
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2340]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2115
.L2118:
	cmp	r7, r10
	add	r9, r9, #66
	bne	.L2116
	b	.L2117
.L2119:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2131:
	mov	r1, #4
	ldr	r0, [r4, #2340]
	bl	BsGet
	add	r5, r8, #416
	add	r7, r8, #452
	strb	r0, [r8, #417]
.L2113:
	add	r6, r5, #12
.L2114:
	ldr	r1, .L2132+4
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	str	r0, [r5, #4]!
	cmp	r5, r6
	bne	.L2114
	cmp	r7, r5
	bne	.L2113
	b	.L2112
.L2130:
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #11]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #12]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #13]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r8, #14]
	b	.L2107
.L2133:
	.align	2
.L2132:
	.word	.LC232
	.word	.LC233
	UNWIND(.fnend)
	.size	HEVC_Sei_Color_Remapping_Info, .-HEVC_Sei_Color_Remapping_Info
	.align	2
	.global	HEVC_Sei_Payload
	.type	HEVC_Sei_Payload, %function
HEVC_Sei_Payload:
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
	mov	r6, r1
	ldr	r1, [r0, #2364]
	mov	r4, r0
	ldr	r7, [fp, #4]
	ldr	r1, [r1, #16]
	cmp	r1, #39
	beq	.L2180
	cmp	r3, #5
	beq	.L2164
	cmp	r3, #132
	beq	.L2165
	cmp	r7, #0
	movne	r5, #0
	beq	.L2159
.L2167:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	cmp	r5, r7
	bne	.L2167
	b	.L2159
.L2164:
	add	r1, r6, #4096
	mov	r2, r7
	add	r1, r1, #52
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	bne	.L2161
.L2159:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_Sei_More_Data_In_Payload
	cmp	r0, #0
	bne	.L2181
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2181:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_Sei_Payload_Extension_Present
	cmp	r0, #0
	bne	.L2182
.L2168:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r6, #12]
	b	.L2169
.L2170:
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r6, #16]
.L2169:
	ldr	r0, [r4, #2340]
	bl	BsIsByteAligned
	mov	r1, #1
	cmp	r0, #0
	beq	.L2170
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2180:
	cmp	r3, #147
	ldrls	pc, [pc, r3, asl #2]
	b	.L2136
.L2138:
	.word	.L2137
	.word	.L2139
	.word	.L2136
	.word	.L2136
	.word	.L2140
	.word	.L2141
	.word	.L2142
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2143
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2144
	.word	.L2136
	.word	.L2145
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2146
	.word	.L2147
	.word	.L2148
	.word	.L2149
	.word	.L2136
	.word	.L2150
	.word	.L2151
	.word	.L2136
	.word	.L2136
	.word	.L2152
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2136
	.word	.L2153
	.word	.L2136
	.word	.L2154
	.word	.L2136
	.word	.L2136
	.word	.L2155
.L2165:
	add	r1, r6, #24576
	add	r1, r1, #152
	bl	HEVC_Sei_Decoded_Picture_Hash
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2182:
	ldr	r1, .L2183
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	str	r0, [r6, #8]
	b	.L2168
.L2155:
	add	r1, r6, #4352
	add	r1, r1, #34
	bl	HEVC_Sei_HLGHDR_Comapitibility_Info
	cmp	r0, #0
	beq	.L2159
.L2161:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2137:
	add	r2, r2, #2720
	add	r1, r6, #24
	add	r2, r2, #12
	bl	HEVC_Sei_Buf_Period
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2139:
	add	r2, r2, #2624
	add	r1, r6, #1088
	bl	HEVC_Sei_Pic_Timming
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2140:
	mov	r2, r7
	add	r1, r6, #3200
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2141:
	add	r1, r6, #4096
	mov	r2, r7
	add	r1, r1, #52
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2142:
	add	r1, r6, #4224
	add	r1, r1, #40
	bl	HEVC_Sei_Recovery_Point
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2143:
	add	r1, r6, #4352
	add	r1, r1, #36
	bl	HEVC_Sei_Tone_Mapping_Info
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2144:
	add	r1, r6, #4224
	add	r1, r1, #48
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2145:
	add	r1, r6, #4288
	add	r1, r1, #28
	bl	HEVC_Sei_Display_Orientation
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2146:
	add	r1, r6, #7488
	mov	r2, r7
	add	r1, r1, #60
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2147:
	add	r1, r6, #4160
	add	r1, r1, #12
	bl	HEVC_Sei_Active_Param_sets
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2148:
	add	r2, r2, #2720
	add	r1, r6, #4224
	add	r2, r2, #12
	add	r1, r1, #24
	bl	HEVC_Sei_Dec_Unit_Info
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2149:
	add	r1, r6, #4288
	add	r1, r1, #36
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2150:
	mov	r3, r7
	mov	r1, r6
	bl	HEVC_Sei_Scalable_Nesting
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2151:
	add	r1, r6, #4288
	add	r1, r1, #44
	bl	HEVC_Sei_Region_Refresh_Info
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2152:
	add	r1, r6, #4288
	add	r1, r1, #48
	bl	HEVC_Sei_Mastering_Display_Colour_Volume
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2153:
	add	r1, r6, #3280
	add	r1, r1, #12
	bl	HEVC_Sei_Color_Remapping_Info
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2154:
	add	r1, r6, #4352
	add	r1, r1, #28
	bl	HEVC_Sei_Content_Light_Level_Information
	cmp	r0, #0
	beq	.L2159
	b	.L2161
.L2136:
	cmp	r7, #0
	movne	r5, #0
	beq	.L2159
.L2162:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	cmp	r5, r7
	bne	.L2162
	b	.L2159
.L2184:
	.align	2
.L2183:
	.word	.LC234
	UNWIND(.fnend)
	.size	HEVC_Sei_Payload, .-HEVC_Sei_Payload
	.align	2
	.global	HEVC_SeiMessage
	.type	HEVC_SeiMessage, %function
HEVC_SeiMessage:
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
	mov	r5, #0
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	ldr	r0, [r0, #2340]
	b	.L2186
.L2188:
	bl	BsSkip
	ldr	r0, [r4, #2340]
	add	r5, r5, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2
	bhi	.L2194
.L2186:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2340]
	beq	.L2188
	bl	BsGet
	mov	r8, #0
	mov	r9, r0
	str	r0, [r6]
	ldr	r0, [r4, #2340]
	b	.L2189
.L2190:
	bl	BsSkip
	ldr	r0, [r4, #2340]
	add	r8, r8, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2
	bhi	.L2195
.L2189:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2340]
	beq	.L2190
	bl	BsGet
	add	r3, r9, r5
	mov	r2, r7
	mov	r1, r6
	str	r0, [r6, #4]
	add	r8, r0, r8
	mov	r0, r4
	str	r8, [sp]
	bl	HEVC_Sei_Payload
	cmp	r0, #0
	bne	.L2196
.L2187:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2194:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, #3056
	ldr	r1, .L2197
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2195:
	str	r2, [sp]
	mov	r0, #1
	movw	r2, #3078
	ldr	r1, .L2197
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2196:
	ldr	r1, .L2197+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2187
.L2198:
	.align	2
.L2197:
	.word	.LC235
	.word	.LC236
	UNWIND(.fnend)
	.size	HEVC_SeiMessage, .-HEVC_SeiMessage
	.align	2
	.global	HEVC_DecSEI
	.type	HEVC_DecSEI, %function
HEVC_DecSEI:
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
	add	r6, r0, #3472
	add	r5, r0, #28160
	mov	r4, r0
	add	r6, r6, #8
	add	r5, r5, #196
	b	.L2203
.L2200:
	ldr	r0, [r4, #2340]
	bl	BsIsByteAligned
	cmp	r0, #0
	mov	r0, r4
	beq	.L2208
	bl	HEVC_More_Rbsp_Data
	subs	r7, r0, #0
	beq	.L2209
.L2203:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	beq	.L2200
	ldr	r1, .L2210
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
.L2201:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2208:
	ldr	r1, .L2210+4
	mvn	r7, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2209:
	ldr	r0, [r4, #2340]
	mov	r1, #8
	bl	BsGet
	cmp	r0, #128
	beq	.L2201
	mov	r2, r0
	ldr	r1, .L2210+8
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2201
.L2211:
	.align	2
.L2210:
	.word	.LC237
	.word	.LC238
	.word	.LC239
	UNWIND(.fnend)
	.size	HEVC_DecSEI, .-HEVC_DecSEI
	.align	2
	.global	HEVC_Sei_Scalable_Nesting
	.type	HEVC_Sei_Scalable_Nesting, %function
HEVC_Sei_Scalable_Nesting:
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
	mov	r4, r0
	mov	r7, r1
	ldr	r0, [r0, #2340]
	mov	r1, #1
	mov	r9, r2
	bl	BsGet
	add	r8, r7, #20480
	mov	r1, #1
	strb	r0, [r8, #3460]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	uxtb	r0, r0
	strb	r0, [r8, #3461]
	cmp	r0, #0
	ldr	r0, [r4, #2340]
	beq	.L2213
	bl	BsGet
	ldr	r1, .L2229
	strb	r0, [r8, #3462]
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #63
	str	r0, [r8, #3468]
	bhi	.L2226
	ldrb	r6, [r8, #3462]	@ zero_extendqisi2
	cmp	r0, r6
	addcs	r5, r6, #5952
	addcs	r5, r5, #35
	addcs	r5, r7, r5, lsl #2
	bcc	.L2219
.L2218:
	mov	r1, #3
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r1, .L2229+4
	add	r6, r6, #1
	str	r0, [r5, #4]!
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	str	r0, [r5, #256]
	ldr	r3, [r8, #3468]
	cmp	r3, r6
	bcs	.L2218
.L2219:
	ldr	r0, [r4, #2340]
	bl	BsToNextByte
	mov	r3, #0
	strb	r3, [r8, #3464]
	b	.L2217
.L2222:
	bl	HEVC_MoreRbspData
	cmp	r0, #0
	beq	.L2227
.L2217:
	mov	r2, r9
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	mov	r0, r4
	beq	.L2222
	ldr	r1, .L2229+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2213:
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r8, #3463]
	cmp	r5, #0
	bne	.L2219
	mov	r1, #3
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r1, .L2229+12
	str	r0, [r8, #3984]
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #63
	str	r0, [r8, #3988]
	addls	r6, r7, #24320
	addls	r6, r6, #148
	bhi	.L2228
.L2221:
	mov	r1, #6
	ldr	r0, [r4, #2340]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r6, #4]!
	ldr	r3, [r8, #3988]
	cmp	r3, r5
	bcs	.L2221
	b	.L2219
.L2227:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2226:
	mov	r2, #64
	ldr	r1, .L2229+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2228:
	ldr	r1, .L2229+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2230:
	.align	2
.L2229:
	.word	.LC240
	.word	.LC242
	.word	.LC237
	.word	.LC243
	.word	.LC241
	.word	.LC244
	UNWIND(.fnend)
	.size	HEVC_Sei_Scalable_Nesting, .-HEVC_Sei_Scalable_Nesting
	.align	2
	.global	HEVC_DecScalingListData
	.type	HEVC_DecScalingListData, %function
HEVC_DecScalingListData:
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
	ldr	r3, .L2268
	mov	r9, r1
	mov	r6, r0
	add	ip, r9, #1664
	add	r1, r1, #1264
	add	r0, r9, #1392
	ldr	r3, [r3, #52]
	add	r1, r1, #1
	add	r0, r0, #1
	mov	r2, #64
	mov	r4, ip
	blx	r3
	add	r3, r4, #4
	str	r3, [fp, #-76]
	add	r3, r6, #2224
	str	r3, [fp, #-48]
	add	r3, r9, #24
	str	r3, [fp, #-68]
	add	r3, r9, #49
	str	r3, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-52]
.L2232:
	ldr	r2, [fp, #-48]
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	str	r2, [fp, #-48]
	beq	.L2251
	ldr	r3, [fp, #-76]
	ldr	r7, [fp, #-72]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-60]
.L2250:
	mov	r1, #1
	ldr	r0, [r6, #2340]
	bl	BsGet
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-48]
	ldr	r5, [r3, #-1904]
	ldr	r3, [fp, #-52]
	cmp	r5, #64
	movge	r5, #64
	cmp	r3, #0
	beq	.L2233
	cmp	r0, #0
	add	r4, r6, #356
	beq	.L2264
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	bls	.L2257
	ldr	r1, .L2268+4
	ldr	r0, [r6, #2340]
	bl	HEVC_se_v
	add	r3, r0, #7
	str	r0, [r9, #1660]
	cmp	r3, #254
	bhi	.L2265
	ldr	r3, [fp, #-64]
	add	r8, r0, #8
	str	r8, [r3]
.L2244:
	cmp	r5, #0
	ble	.L2243
	sub	r4, r4, #4
	mov	r10, #0
	b	.L2248
.L2247:
	mov	r8, r8, lsr #24
	ldr	r2, [r4, #4]!
	add	r3, r3, r8
	cmp	r10, r5
	uxtb	r3, r3
	rsb	r8, r8, r3
	strb	r8, [r7, r2]
	beq	.L2243
.L2248:
	ldr	r1, .L2268+8
	add	r10, r10, #1
	ldr	r0, [r6, #2340]
	bl	HEVC_se_v
	add	r3, r8, r0
	add	r2, r0, #128
	add	r3, r3, #256
	cmp	r2, #255
	str	r0, [r9, #1664]
	mov	r8, r3, asr #31
	bls	.L2247
	ldr	r1, .L2268+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2262:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2252:
	ldr	r1, .L2268+16
	ldr	r0, [r6, #2340]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L2254
	ldr	r2, [fp, #-60]
	uxtb	r0, r0
	ldr	r3, [fp, #-56]
	rsb	r1, r0, r2
	strb	r0, [r3, #1560]
	uxtb	r1, r1
	strb	r1, [r3, #1584]
.L2238:
	ldr	r3, [fp, #-60]
	cmp	r1, r3
	beq	.L2266
	ldr	r2, [fp, #-52]
	mov	r3, r2, asl #3
	sub	r3, r3, r2, asl #1
	add	r1, r3, r1
	add	r1, r9, r1, lsl #6
	add	r1, r1, #49
.L2241:
	cmp	r1, #0
	beq	.L2267
	ldr	r3, .L2268
	mov	r2, r5
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
.L2243:
	ldr	r3, [fp, #-48]
	add	r7, r7, #64
	ldr	r2, [fp, #-60]
	ldr	r1, [fp, #-64]
	ldr	r3, [r3]
	add	r2, r2, #1
	add	r1, r1, #4
	str	r2, [fp, #-60]
	cmp	r3, r2
	str	r1, [fp, #-64]
	bhi	.L2250
.L2251:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	cmp	r3, #4
	ldr	r3, [fp, #-72]
	add	r2, r2, #6
	str	r2, [fp, #-68]
	add	r3, r3, #384
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r3, r3, #24
	str	r3, [fp, #-76]
	bne	.L2232
	mov	r0, #0
	b	.L2262
.L2257:
	mov	r8, #8
	b	.L2244
.L2264:
	ldr	r1, .L2268+16
	ldr	r0, [r6, #2340]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L2254
	ldr	r3, [fp, #-52]
	uxtb	r0, r0
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-56]
	cmp	r3, #1
	rsb	r1, r0, ip
	strb	r0, [r2, #1560]
	uxtb	r1, r1
	strb	r1, [r2, #1584]
	bls	.L2238
	cmp	ip, r1
	mov	r2, ip
	movne	r2, r3
	movne	r3, r3, asl #3
	subne	r3, r3, r2, asl #1
	ldr	r2, [fp, #-64]
	addne	r3, r3, r1
	moveq	r3, #16
	addne	r3, r9, r3, lsl #2
	ldrne	r3, [r3, #1668]
	str	r3, [r2]
	b	.L2238
.L2266:
	mov	r1, r3
	ldr	r0, [fp, #-52]
	bl	HEVC_GetScalingListDefaultAddress
	mov	r1, r0
	b	.L2241
.L2265:
	ldr	r1, .L2268+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2262
.L2267:
	ldr	r1, .L2268+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2262
.L2254:
	ldr	r1, .L2268+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2262
.L2233:
	cmp	r0, #0
	beq	.L2252
	ldr	r4, .L2268+32
	mov	r8, #8
	b	.L2244
.L2269:
	.align	2
.L2268:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC248
	.word	.LC250
	.word	.LC251
	.word	.LC245
	.word	.LC249
	.word	.LC247
	.word	.LC246
	.word	.LANCHOR0+65536
	UNWIND(.fnend)
	.size	HEVC_DecScalingListData, .-HEVC_DecScalingListData
	.align	2
	.global	HEVC_ProcessSPS
	.type	HEVC_ProcessSPS, %function
HEVC_ProcessSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 0
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
	mov	r4, r1
	mov	r5, r0
	ldr	r1, .L2424
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	cmp	r0, #1
	mov	r8, r0
	str	r0, [r4, #64]
	beq	.L2271
	cmp	r0, #3
	bhi	.L2401
	mov	r2, r0
	ldr	r1, .L2424+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2273:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2401:
	ldr	r1, .L2424+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2271:
	ldr	r1, .L2424+12
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #8192
	str	r0, [r4, #72]
	bhi	.L2402
	ldr	r1, .L2424+16
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #76]
	bhi	.L2403
	ldr	r2, [r4, #760]
	ldr	r3, [r4, #72]
	cmp	r2, #120
	mul	r0, r3, r0
	beq	.L2277
	bgt	.L2278
	cmp	r2, #60
	beq	.L2279
	ble	.L2404
	cmp	r2, #90
	beq	.L2282
	cmp	r2, #93
	beq	.L2283
	cmp	r2, #63
	bne	.L2276
	mov	r2, #61440
	mov	r3, #245760
	b	.L2284
.L2278:
	cmp	r2, #156
	beq	.L2285
	bgt	.L2286
	cmp	r2, #150
	beq	.L2285
	cmp	r2, #153
	beq	.L2285
	cmp	r2, #123
	beq	.L2277
.L2276:
	ldr	r1, .L2424+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2286:
	cmp	r2, #183
	beq	.L2287
	cmp	r2, #186
	beq	.L2287
	cmp	r2, #180
	bne	.L2276
.L2287:
	mov	r2, #8912896
	mov	r3, #35651584
.L2284:
	cmp	r0, r2
	movls	r3, #16
	strls	r3, [r4, #236]
	bls	.L2289
	cmp	r0, r3, lsr #1
	movls	r3, #12
	strls	r3, [r4, #236]
	bls	.L2289
	add	r3, r3, r3, lsl #1
	cmp	r0, r3, lsr #2
	movls	r3, #8
	movhi	r3, #6
	str	r3, [r4, #236]
.L2289:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #80]
	beq	.L2292
	ldr	r1, .L2424+24
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r3, [r4, #64]
	ldr	r6, .L2424+28
	ldr	r1, .L2424+32
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #492]
	mul	r0, r3, r0
	str	r0, [r4, #84]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #72]
	ldr	r1, [r4, #84]
	add	r2, r6, r2, lsl #2
	rsb	r3, r1, r3
	ldr	r2, [r2, #492]
	mul	r0, r2, r0
	rsb	r3, r0, r3
	cmp	r3, #0
	str	r0, [r4, #88]
	blt	.L2405
	ldr	r1, .L2424+36
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r3, [r4, #64]
	ldr	r1, .L2424+40
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #508]
	mul	r0, r3, r0
	str	r0, [r4, #92]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, [r4, #64]
	ldr	r2, [r4, #92]
	ldr	r3, [r4, #76]
	add	r6, r6, r1, lsl #2
	rsb	r3, r2, r3
	ldr	r2, [r6, #508]
	mul	r0, r2, r0
	rsb	r3, r0, r3
	cmp	r3, #0
	str	r0, [r4, #96]
	blt	.L2406
.L2292:
	ldr	r1, .L2424+44
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r2, r0, #8
	str	r2, [r4, #100]
	bhi	.L2407
	ldr	r1, .L2424+48
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r2, r0, #8
	str	r2, [r4, #108]
	bhi	.L2408
	ldr	r3, [r4, #100]
	ldr	r1, .L2424+52
	str	r3, [r5, #192]
	ldr	r3, [r4, #108]
	str	r3, [r5, #196]
	ldr	r0, [r4, #108]
	ldr	ip, [r4, #100]
	mov	r3, r0, asl #3
	mov	r2, ip, asl #3
	sub	r3, r3, r0, asl #1
	sub	r2, r2, ip, asl #1
	sub	r3, r3, #48
	sub	r2, r2, #48
	str	r3, [r4, #112]
	str	r2, [r4, #104]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #12
	bhi	.L2409
	add	r0, r0, #4
	mov	r1, #1
	str	r0, [r4, #128]
	mov	r6, r4
	str	r0, [r4, #132]
	mov	r7, #0
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #3]
	b	.L2303
.L2297:
	ldr	r3, [r4, #56]
	add	r7, r7, #1
	cmp	r7, r3
	bhi	.L2302
.L2303:
	ldr	r1, .L2424+56
	add	r6, r6, #4
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2424+60
	add	r0, r0, #1
	str	r0, [r6, #376]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r1, .L2424+64
	ldr	r9, [r6, #376]
	str	r0, [r6, #408]
	ldr	r0, [r5, #2340]
	ldr	r10, [r4, #380]
	bl	HEVC_ue_v
	str	r0, [r6, #440]
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2297
	ldr	r1, [r4, #56]
	add	r3, r7, #1
	cmp	r3, r1
	addls	r7, r7, #95
	addls	r7, r4, r7, lsl #2
	bhi	.L2302
.L2301:
	ldr	r2, [r4, #380]
	add	r3, r3, #1
	cmp	r3, r1
	str	r2, [r7, #4]!
	ldr	r2, [r4, #412]
	str	r2, [r7, #32]
	ldr	r2, [r4, #444]
	str	r2, [r7, #64]
	bls	.L2301
.L2302:
	ldr	r3, [r4, #236]
	cmp	r9, r10
	ldr	r1, .L2424+68
	movcc	r9, r10
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r4, #236]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #136]
	bhi	.L2410
	ldr	r1, .L2424+72
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #144]
	bhi	.L2411
	ldr	r3, [r4, #136]
	add	r3, r3, #3
	str	r3, [r4, #140]
	add	r6, r0, r3
	str	r6, [r4, #148]
	sub	r2, r6, #4
	cmp	r2, #2
	bhi	.L2412
	mov	r2, #1
	ldr	r7, [r4, #72]
	mov	r6, r2, asl r6
	mov	r3, r2, asl r3
	str	r6, [r4, #156]
	str	r6, [r4, #160]
	mov	r1, r6
	str	r6, [r4, #164]
	mov	r0, r7
	str	r3, [r4, #152]
	bl	__aeabi_uidivmod
	mov	r0, r7
	cmp	r1, #0
	mov	r1, r6
	beq	.L2306
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2307:
	ldr	r7, [r4, #76]
	mov	r1, r6
	str	r0, [r4, #240]
	mov	r0, r7
	bl	__aeabi_uidivmod
	mov	r0, r7
	cmp	r1, #0
	mov	r1, r6
	beq	.L2308
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2309:
	str	r0, [r4, #244]
	ldr	r1, .L2424+76
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #168]
	bhi	.L2413
	ldr	r1, .L2424+80
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #176]
	bhi	.L2414
	ldr	r3, [r4, #168]
	ldr	r2, [r4, #140]
	add	r3, r3, #2
	str	r3, [r4, #172]
	cmp	r3, r2
	bcs	.L2415
	add	r0, r0, r3
	str	r0, [r4, #180]
	cmp	r0, #5
	bhi	.L2313
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L2313
	ldr	r1, .L2424+84
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #200]
	bhi	.L2416
	ldr	r1, .L2424+88
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #208]
	bhi	.L2417
	ldr	r3, [r4, #200]
	add	r0, r0, #1
	mov	r1, #0
	str	r0, [r4, #212]
	add	r3, r3, #1
	str	r3, [r4, #204]
	str	r1, [r5, #260]
	mov	ip, #1
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #160]
	ldr	r2, [r4, #144]
	mov	r3, ip, asl r3
	cmp	r3, r0, lsr r2
	bcc	.L2318
	b	.L2418
.L2343:
	mov	r8, r0
.L2318:
	str	r8, [r5, #260]
	add	r0, r8, #1
	ldr	r3, [r4, #172]
	ldr	r1, [r4, #160]
	add	r3, r8, r3
	ldr	r2, [r4, #144]
	mov	r3, ip, asl r3
	cmp	r3, r1, lsr r2
	bcc	.L2343
.L2317:
	mov	r6, #1
	add	r8, r2, r8
	str	r6, [r4, #224]
	mov	r3, #0
	str	r8, [r4, #216]
	mov	r1, r6
	str	r3, [r4, #220]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L2319
	mov	r1, r6
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L2419
.L2319:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #8]
	cmp	r6, #0
	bne	.L2320
	ldr	r2, [r4, #76]
	cmp	r2, #64
	bls	.L2420
.L2320:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #116]
	beq	.L2321
	mov	r1, #4
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #4
	add	r0, r0, #1
	str	r0, [r4, #120]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L2424+92
	add	r0, r0, #1
	str	r0, [r4, #124]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r4, #184]
	bhi	.L2421
.L2322:
	ldr	r1, .L2424+96
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r4, #192]
	bhi	.L2422
.L2323:
	ldr	r2, [r4, #184]
	add	r2, r2, #3
	str	r2, [r4, #188]
	add	r0, r0, r2
	str	r0, [r4, #196]
	cmp	r0, #5
	bhi	.L2324
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L2324
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #9]
.L2321:
	ldr	r1, .L2424+100
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #64
	str	r0, [r4, #228]
	bhi	.L2326
	cmp	r0, #0
	addne	r7, r4, #13056
	movne	r6, #0
	addne	r7, r7, #52
	bne	.L2331
	b	.L2332
.L2330:
	ldr	r3, [r4, #228]
	cmp	r6, r3
	bcs	.L2332
.L2331:
	mov	r3, r6
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	HEVC_DecShortTermRefPicSet
	add	r6, r6, #1
	add	r7, r7, #204
	cmp	r0, #0
	beq	.L2330
	ldr	r1, .L2424+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2283:
	mov	r2, #245760
	mov	r3, #983040
	b	.L2284
.L2308:
	bl	__aeabi_uidiv
	b	.L2309
.L2306:
	bl	__aeabi_uidiv
	b	.L2307
.L2332:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L2329
	ldr	r1, .L2424+108
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #32
	str	r0, [r4, #232]
	bhi	.L2335
	cmp	r0, #0
	addne	r8, r4, #244
	addne	r7, r4, #15
	movne	r6, #0
	beq	.L2329
.L2337:
	ldr	r1, [r4, #128]
	add	r6, r6, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #4]!
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r7, #1]!
	ldr	r3, [r4, #232]
	cmp	r6, r3
	bcc	.L2337
.L2329:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	beq	.L2334
	mov	r2, r4
	add	r1, r4, #2624
	mov	r0, r5
	bl	HEVC_DecVuiParam
	cmp	r0, #0
	bne	.L2423
.L2334:
	ldr	ip, [r4, #76]
	ldr	r3, [r4, #72]
	ldr	r2, [r4, #2656]
	ldr	r1, [r4, #2652]
	ldr	r0, [r4, #2648]
	str	ip, [sp]
	bl	HEVCGetDar
	mov	r1, #1
	str	r0, [r4, #2644]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	bne	.L2397
.L2340:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r4]
	b	.L2273
.L2339:
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #15]
.L2397:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2339
	b	.L2340
.L2404:
	cmp	r2, #0
	beq	.L2281
	cmp	r2, #30
	bne	.L2276
.L2281:
	mov	r2, #9216
	mov	r3, #36864
	b	.L2284
.L2420:
	ldr	r1, .L2424+112
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2424+116
	ldr	ip, [r3]
	cmp	ip, #0
	mvneq	r0, #0
	beq	.L2273
	ldr	r0, [r5, #276]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #102
	blx	ip
	mvn	r0, #0
	b	.L2273
.L2279:
	mov	r2, #30720
	mov	r3, #122880
	b	.L2284
.L2277:
	mov	r2, #557056
	mov	r3, #2228224
	b	.L2284
.L2285:
	mov	r2, #2228224
	mov	r3, #8912896
	b	.L2284
.L2282:
	mov	r2, #138240
	mov	r3, #552960
	b	.L2284
.L2419:
	add	r1, r4, #860
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	beq	.L2319
	mov	r0, r6
	ldr	r1, .L2424+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2313:
	ldr	r1, .L2424+124
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2422:
	mov	r2, r0
	ldr	r1, .L2424+128
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r0, [r4, #192]
	b	.L2323
.L2421:
	mov	r2, r0
	ldr	r1, .L2424+132
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2322
.L2418:
	mov	r8, r1
	b	.L2317
.L2402:
	mov	r0, r8
	ldr	r1, .L2424+136
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2409:
	ldr	r1, .L2424+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2410:
	ldr	r1, .L2424+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2413:
	ldr	r1, .L2424+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2324:
	ldr	r1, .L2424+152
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2416:
	ldr	r1, .L2424+156
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2403:
	mov	r0, r8
	ldr	r1, .L2424+160
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2412:
	ldr	r1, .L2424+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2411:
	ldr	r1, .L2424+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2407:
	ldr	r1, .L2424+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2408:
	ldr	r1, .L2424+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2415:
	ldr	r1, .L2424+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2414:
	ldr	r1, .L2424+184
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2417:
	ldr	r1, .L2424+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2326:
	mov	r2, #64
	ldr	r1, .L2424+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2405:
	ldr	r1, .L2424+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2406:
	ldr	r1, .L2424+200
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2335:
	ldr	r1, .L2424+204
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2423:
	ldr	r1, .L2424+208
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2273
.L2425:
	.align	2
.L2424:
	.word	.LC252
	.word	.LC254
	.word	.LC253
	.word	.LC255
	.word	.LC257
	.word	.LC259
	.word	.LC260
	.word	.LANCHOR1
	.word	.LC261
	.word	.LC263
	.word	.LC264
	.word	.LC266
	.word	.LC268
	.word	.LC270
	.word	.LC272
	.word	.LC273
	.word	.LC274
	.word	.LC275
	.word	.LC277
	.word	.LC280
	.word	.LC282
	.word	.LC286
	.word	.LC288
	.word	.LC292
	.word	.LC294
	.word	.LC297
	.word	.LC299
	.word	.LC300
	.word	.LC291
	.word	g_event_report
	.word	.LC290
	.word	.LC285
	.word	.LC295
	.word	.LC293
	.word	.LC256
	.word	.LC271
	.word	.LC276
	.word	.LC281
	.word	.LC296
	.word	.LC287
	.word	.LC258
	.word	.LC279
	.word	.LC278
	.word	.LC267
	.word	.LC269
	.word	.LC284
	.word	.LC283
	.word	.LC289
	.word	.LC298
	.word	.LC262
	.word	.LC265
	.word	.LC301
	.word	.LC302
	UNWIND(.fnend)
	.size	HEVC_ProcessSPS, .-HEVC_ProcessSPS
	.align	2
	.global	HEVC_DecSPS
	.type	HEVC_DecSPS, %function
HEVC_DecSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 400
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #404)
	sub	sp, sp, #404
	ldr	r5, .L2444
	mov	r4, r0
	movw	r2, #26164
	mov	r1, #0
	ldr	r0, .L2444+4
	ldr	r3, [r5, #48]
	blx	r3
	mov	r2, #384
	ldr	r3, [r5, #48]
	mov	r1, #0
	sub	r0, fp, #428
	ldr	r8, .L2444+8
	blx	r3
	ldr	r0, [r4, #2340]
	mov	r1, #4
	bl	BsGet
	ldr	r2, [r4, #148]
	cmp	r2, r0
	str	r0, [fp, #-440]
	bls	.L2437
	mov	r1, #3
	ldr	r0, [r4, #2340]
	bl	BsGet
	cmp	r0, #8
	mov	r7, r0
	bhi	.L2438
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r3, r7
	mov	r2, #1
	sub	r1, fp, #428
	mov	r9, r0
	mov	r0, r4
	bl	HEVC_DecPTL
	cmp	r0, #0
	bne	.L2439
	ldr	r1, .L2444+12
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	ldr	r2, [r4, #152]
	cmp	r0, r2
	mov	r10, r0
	bcs	.L2440
	movw	ip, #26164
	ldr	r2, [r4, #2348]
	mul	r6, ip, r0
	uxtb	r0, r9
	str	ip, [fp, #-444]
	ldr	r3, [fp, #-440]
	add	r2, r2, r6
	ldrb	r9, [r2, #1]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2441
	str	r3, [r2, #52]
	sub	r1, fp, #428
	ldr	lr, [r4, #2348]
	mov	r2, #384
	add	lr, lr, r6
	str	r7, [lr, #56]
	ldr	lr, [r4, #2348]
	add	lr, lr, r6
	strb	r0, [lr, #2]
	ldr	r0, [r4, #2348]
	ldr	r7, [r5, #52]
	add	r0, r0, r6
	add	r0, r0, #476
	blx	r7
	ldr	r2, [r4, #2348]
	mov	r0, r4
	add	r2, r2, r6
	str	r10, [r2, #60]
	ldr	r1, [r4, #2348]
	add	r1, r1, r6
	bl	HEVC_ProcessSPS
	ldr	ip, [fp, #-444]
	subs	r7, r0, #0
	bne	.L2442
	ldr	r3, [r4, #2348]
	mov	r1, #1
	add	r0, r4, #28160
	mov	r2, ip
	add	r0, r0, #196
	strb	r1, [r3, r6]
	ldr	r3, [r4, #2348]
	add	r3, r3, r6
	strb	r1, [r3, #1]
	ldr	r1, [r4, #2348]
	ldr	r3, [r5, #52]
	add	r1, r1, r6
	blx	r3
.L2428:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2441:
	str	r3, [r8, #-3412]
	sub	r1, fp, #428
	str	r7, [r8, #-3408]
	mov	r2, #384
	strb	r0, [r8, #-3462]
	ldr	r7, [r5, #52]
	ldr	r0, .L2444+16
	blx	r7
	ldr	r1, .L2444+4
	mov	r0, r4
	str	r10, [r8, #-3404]
	bl	HEVC_ProcessSPS
	ldr	ip, [fp, #-444]
	subs	r7, r0, #0
	bne	.L2443
	ldr	r0, [r4, #2348]
	mov	r3, #1
	mov	r2, ip
	strb	r3, [r8, #-3464]
	strb	r3, [r8, #-3463]
	add	r0, r0, r6
	ldr	r9, [r5, #56]
	ldr	r1, .L2444+4
	str	ip, [fp, #-440]
	blx	r9
	ldr	ip, [fp, #-440]
	add	r0, r4, #28160
	ldr	r1, [r4, #2348]
	add	r0, r0, #196
	ldr	r3, [r5, #52]
	mov	r2, ip
	add	r1, r1, r6
	blx	r3
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2440:
	ldr	r1, .L2444+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #152]
	cmp	r10, r2
	bcc	.L2436
	ldr	r1, .L2444+24
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L2436
	str	r2, [fp, #-432]
	mov	r3, #8
	str	r10, [fp, #-436]
	sub	r2, fp, #436
	ldr	r0, [r4, #276]
	mov	r1, #109
	blx	ip
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2436:
	mvn	r7, #0
	b	.L2428
.L2437:
	ldr	r1, .L2444+28
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2428
.L2438:
	mov	r2, #8
	ldr	r1, .L2444+32
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2428
.L2439:
	ldr	r1, .L2444+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2428
.L2442:
	mov	r2, r10
	ldr	r1, .L2444+40
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2348]
	mov	r2, #1
	strb	r2, [r3, r6]
	ldr	r3, [r4, #2348]
	add	r6, r3, r6
	strb	r9, [r6, #1]
	b	.L2428
.L2443:
	ldr	r1, [r4, #2348]
	add	r0, r4, #28160
	mov	r2, ip
	ldr	r4, [r5, #52]
	add	r1, r1, r6
	add	r0, r0, #196
	blx	r4
	mov	r2, r10
	ldr	r1, .L2444+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2428
.L2445:
	.align	2
.L2444:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR5-3464
	.word	.LANCHOR5
	.word	.LC306
	.word	.LANCHOR5-2988
	.word	.LC307
	.word	g_event_report
	.word	.LC303
	.word	.LC304
	.word	.LC305
	.word	.LC309
	.word	.LC308
	UNWIND(.fnend)
	.size	HEVC_DecSPS, .-HEVC_DecSPS
	.align	2
	.global	HEVC_ProcessPPS
	.type	HEVC_ProcessPPS, %function
HEVC_ProcessPPS:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r4, r1
	mov	r7, #1
	mov	r5, r0
	strb	r7, [r4, #16]
	str	r7, [r4, #68]
	str	r7, [r4, #72]
	ldr	r1, .L2574
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L2447
	ldr	r3, [r5, #152]
	cmp	r0, r3
	bge	.L2447
	ldr	r3, [r5, #2348]
	movw	r6, #26164
	mla	r6, r6, r0, r3
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2554
	mov	r1, r7
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, r7
	str	r0, [r4, #36]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #3]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L2574+4
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #40]
	cmp	r0, #15
	bhi	.L2555
	ldr	r1, .L2574+8
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #44]
	cmp	r0, #15
	bhi	.L2556
	ldr	r1, .L2574+12
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r2, r0, #26
	str	r2, [r4, #48]
	ldr	r3, [r6, #104]
	cmp	r2, #51
	rsb	r0, r3, #0
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	bne	.L2557
	mov	r1, r7
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #6]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	streq	r0, [r4, #52]
	bne	.L2558
.L2456:
	str	r0, [r4, #56]
	ldr	r1, .L2574+16
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #60]
	cmp	r3, #24
	bhi	.L2559
	ldr	r1, .L2574+20
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #64]
	cmp	r3, #24
	bhi	.L2560
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #13]
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #14]
	bne	.L2561
	ldr	r3, [r6, #240]
	strh	r3, [r4, #176]	@ movhi
	ldr	r3, [r6, #244]
	strh	r3, [r4, #216]	@ movhi
.L2495:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	ble	.L2500
.L2494:
	ldr	ip, [r6, #160]
	add	r1, r4, #174
	mov	r3, #0
.L2499:
	ldrsh	r2, [r1, #2]!
	add	r3, r3, #1
	mul	r2, ip, r2
	cmp	r2, #64
	bhi	.L2498
	ldr	lr, [r6, #72]
	cmp	lr, #64
	bhi	.L2562
.L2498:
	cmp	r3, r0
	blt	.L2499
.L2500:
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ble	.L2497
	ldr	r0, [r6, #160]
	ldrsh	r2, [r4, #216]
	mul	r2, r0, r2
	cmp	r2, #63
	addhi	r1, r1, #107
	addhi	r3, r4, #216
	addhi	r1, r4, r1, lsl #1
	bhi	.L2503
	b	.L2501
.L2504:
	ldrsh	r2, [r3, #2]!
	mul	r2, r0, r2
	cmp	r2, #63
	bls	.L2501
.L2503:
	cmp	r3, r1
	bne	.L2504
.L2497:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #0
	bne	.L2563
.L2506:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #21]
	cmp	r0, #0
	beq	.L2509
	add	r1, r4, #260
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	bne	.L2564
.L2509:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	ldr	r1, .L2574+24
	strb	r0, [r4, #22]
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r2, r0, #2
	str	r2, [r4, #84]
	cmp	r2, #1
	ble	.L2510
	ldr	r3, [r6, #148]
	cmp	r2, r3
	bhi	.L2510
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #24]
	cmp	r0, #0
	bne	.L2541
	b	.L2514
.L2513:
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #25]
.L2541:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2513
.L2514:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2558:
	ldr	r1, .L2574+28
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #52]
	bls	.L2456
	mov	r0, r7
	ldr	r1, .L2574+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2561:
	ldr	r1, .L2574+36
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #19
	add	r2, r0, #1
	str	r2, [r4, #68]
	bhi	.L2565
	ldr	r1, .L2574+40
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #21
	add	r3, r0, #1
	str	r3, [r4, #72]
	bhi	.L2566
	ldr	r2, [r4, #68]
	cmp	r2, #10
	bgt	.L2567
	cmp	r3, #11
	ble	.L2464
	ldr	r1, .L2574+44
	mov	r2, #11
.L2551:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2574+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2546
.L2548:
	mov	r3, #0
	ldr	r0, [r5, #276]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	mvn	r0, #0
.L2542:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2501:
	ldr	r1, .L2574+52
.L2550:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2574+48
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L2548
.L2546:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2562:
	ldr	r1, .L2574+56
	b	.L2550
.L2557:
	mov	r0, r7
	ldr	r1, .L2574+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2464:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #15]
	cmp	r0, #0
	bne	.L2478
	ldr	r3, [r4, #68]
	cmp	r3, #1
	addgt	r8, r4, #90
	movgt	r7, r0
	bgt	.L2476
	b	.L2568
.L2570:
	cmp	r3, r2
	bhi	.L2474
	ldr	r3, [r4, #68]
	add	r7, r7, #1
	sub	r3, r3, #1
	cmp	r3, r7
	ble	.L2569
.L2476:
	ldr	r1, .L2574+64
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r8, #2]!	@ movhi
	ldr	r2, [r6, #240]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2570
.L2474:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r7
	ldr	r1, .L2574+68
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2567:
	mov	r3, r2
	ldr	r1, .L2574+72
	mov	r2, #10
	b	.L2551
.L2563:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	ldr	r0, [r5, #2340]
	bl	BsGet
	uxtb	r7, r0
	strb	r7, [r4, #20]
	cmp	r7, #0
	bne	.L2506
	ldr	r1, .L2574+76
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #76]
	bhi	.L2571
.L2508:
	ldr	r1, .L2574+80
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #80]
	bls	.L2506
	ldr	r1, .L2574+84
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #80]
	b	.L2506
.L2478:
	ldr	r7, [r4, #68]
	cmp	r7, #0
	addgt	r3, r4, #174
	movgt	r8, #0
	ble	.L2468
.L2486:
	ldr	r10, [r6, #240]
	add	r8, r8, #1
	mov	r1, r7
	str	r3, [fp, #-48]
	mul	r0, r10, r8
	bl	__aeabi_uidiv
	mov	r1, r7
	mov	r9, r0
	sub	r0, r8, #1
	mul	r0, r10, r0
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-48]
	cmp	r8, r7
	rsb	r0, r0, r9
	strh	r0, [r3, #2]!	@ movhi
	bne	.L2486
.L2468:
	ldr	r10, [r4, #72]
	cmp	r10, #0
	addgt	r2, r4, #214
	movgt	r8, #0
	ble	.L2485
.L2487:
	ldr	r3, [r6, #244]
	add	r8, r8, #1
	mov	r1, r10
	str	r2, [fp, #-52]
	mul	r0, r3, r8
	str	r3, [fp, #-48]
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-48]
	mov	r1, r10
	mov	r9, r0
	sub	r0, r8, #1
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-52]
	cmp	r8, r10
	rsb	r0, r0, r9
	strh	r0, [r2, #2]!	@ movhi
	bne	.L2487
.L2485:
	cmp	r7, #1
	bne	.L2493
	ldr	r0, [r4, #72]
	cmp	r0, #1
	beq	.L2494
.L2493:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	strb	r0, [r4, #16]
	b	.L2495
.L2447:
	mov	r2, r0
	ldr	r1, .L2574+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2554:
	mov	r2, r0
	ldr	r1, .L2574+92
	mov	r0, r7
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2555:
	mov	r0, r7
	ldr	r1, .L2574+96
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2556:
	mov	r0, r7
	ldr	r1, .L2574+100
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2559:
	ldr	r1, .L2574+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2560:
	ldr	r1, .L2574+108
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2510:
	ldr	r1, .L2574+112
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2546
.L2569:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	ble	.L2472
.L2471:
	add	r8, r4, #130
	mov	r7, #0
	b	.L2483
.L2572:
	cmp	r3, r2
	bhi	.L2481
	ldr	r3, [r4, #72]
	add	r7, r7, #1
	sub	r3, r3, #1
	cmp	r3, r7
	ble	.L2472
.L2483:
	ldr	r1, .L2574+116
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r8, #2]!	@ movhi
	ldr	r2, [r6, #244]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2572
.L2481:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r7
	ldr	r1, .L2574+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2565:
	mov	r3, #20
	ldr	r1, .L2574+124
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2571:
	ldr	r1, .L2574+128
	mov	r0, #1
	bl	dprint_vfmw
	str	r7, [r4, #76]
	b	.L2508
.L2472:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2478
.L2479:
	ldr	r7, [r4, #68]
	ldrh	r3, [r6, #240]
	sub	r2, r7, #1
	add	ip, r4, r7, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #174]	@ movhi
	ble	.L2488
	add	r8, r7, #44
	add	r1, r4, #90
	add	lr, r4, #174
	add	r8, r4, r8, lsl #1
.L2489:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #174]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #174]	@ movhi
	bne	.L2489
.L2488:
	sxth	r3, r3
	cmp	r3, #0
	ble	.L2573
	ldr	r1, [r4, #72]
	ldrh	r3, [r6, #244]
	sub	r2, r1, #1
	add	ip, r4, r1, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #214]	@ movhi
	ble	.L2491
	add	r8, r1, #64
	add	lr, r4, #214
	add	r1, r4, #130
	add	r8, r4, r8, lsl #1
.L2492:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #214]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #214]	@ movhi
	bne	.L2492
.L2491:
	sxth	r3, r3
	cmp	r3, #0
	bgt	.L2485
	ldr	r1, .L2574+132
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2566:
	mov	r2, r3
	ldr	r1, .L2574+136
	mov	r3, #22
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2564:
	ldr	r1, .L2574+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2568:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	bgt	.L2471
	b	.L2479
.L2573:
	ldr	r1, .L2574+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2542
.L2575:
	.align	2
.L2574:
	.word	.LC310
	.word	.LC313
	.word	.LC315
	.word	.LC317
	.word	.LC321
	.word	.LC323
	.word	.LC344
	.word	.LC319
	.word	.LC320
	.word	.LC325
	.word	.LC327
	.word	.LC330
	.word	g_event_report
	.word	.LC338
	.word	.LC337
	.word	.LC318
	.word	.LC331
	.word	.LC332
	.word	.LC329
	.word	.LC339
	.word	.LC341
	.word	.LC342
	.word	.LC311
	.word	.LC312
	.word	.LC314
	.word	.LC316
	.word	.LC322
	.word	.LC324
	.word	.LC345
	.word	.LC333
	.word	.LC334
	.word	.LC326
	.word	.LC340
	.word	.LC336
	.word	.LC328
	.word	.LC343
	.word	.LC335
	UNWIND(.fnend)
	.size	HEVC_ProcessPPS, .-HEVC_ProcessPPS
	.align	2
	.global	HEVC_DecPPS
	.type	HEVC_DecPPS, %function
HEVC_DecPPS:
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
	ldr	r1, .L2586
	mov	r4, r0
	ldr	r0, [r0, #2340]
	bl	HEVC_ue_v
	ldr	r3, [r4, #156]
	cmp	r0, r3
	mov	r6, r0
	bcs	.L2582
	movw	r7, #2024
	ldr	r3, [r4, #2352]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2583
	str	r0, [r2, #28]
	mov	r0, r4
	ldr	r1, [r4, #2352]
	add	r1, r1, r5
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2584
	ldr	r3, [r4, #2352]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2352]
	strb	r2, [r3, r5]
.L2578:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2583:
	ldr	r9, .L2586+4
	mov	r0, r4
	ldr	r1, .L2586+8
	str	r6, [r9, #-3436]
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2585
	ldr	ip, .L2586+12
	mov	r3, #1
	ldr	r0, [r4, #2352]
	mov	r2, r7
	ldr	r1, .L2586+8
	add	r0, r0, r5
	ldr	ip, [ip, #56]
	strb	r3, [r9, #-3463]
	strb	r3, [r9, #-3464]
	blx	ip
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2585:
	mov	r2, r6
	ldr	r1, .L2586+16
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2578
.L2582:
	mov	r2, r0
	ldr	r1, .L2586+20
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2578
.L2584:
	mov	r2, r6
	ldr	r1, .L2586+16
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2352]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2352]
	strb	r9, [r3, r5]
	b	.L2578
.L2587:
	.align	2
.L2586:
	.word	.LC346
	.word	.LANCHOR5
	.word	.LANCHOR5-3464
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC348
	.word	.LC347
	UNWIND(.fnend)
	.size	HEVC_DecPPS, .-HEVC_DecPPS
	.align	2
	.global	HEVC_DecPredWeightTable
	.type	HEVC_DecPredWeightTable, %function
HEVC_DecPredWeightTable:
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
	add	r4, r0, #53248
	ldr	r3, [r0, #2352]
	mov	r5, r0
	ldr	r2, [r4, #2076]
	movw	r0, #2024
	ldr	r1, [r4, #2060]
	ldr	r6, [r5, #2348]
	mla	r3, r0, r2, r3
	cmp	r1, #1
	ldr	r7, [r3, #32]
	beq	.L2653
	cmp	r1, #0
	bne	.L2592
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2592
.L2590:
	ldr	r1, .L2664
	ldr	r0, [r5, #2340]
	bl	HEVC_ue_v
	cmp	r0, #7
	str	r0, [r4, #3592]
	bhi	.L2654
	movw	r3, #26164
	mla	r9, r3, r7, r6
	ldr	r3, [r9, #64]
	cmp	r3, #0
	ldreq	r3, [r4, #3596]
	bne	.L2655
.L2596:
	add	r0, r0, r3
	add	r3, r5, #57344
	cmp	r0, #7
	str	r3, [fp, #-52]
	str	r0, [r3, #528]
	bhi	.L2597
	ldr	r3, [r4, #2168]
	cmp	r3, #0
	addne	r6, r5, #56832
	addne	r6, r6, #12
	movne	r7, #0
	movne	r8, r6
	beq	.L2599
.L2600:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r2, [r4, #2168]
	cmp	r2, r7
	bhi	.L2600
	ldr	r3, [r9, #64]
	cmp	r3, #0
	beq	.L2601
	cmp	r2, #0
	addne	r8, r5, #56832
	movne	r7, #0
	addne	r8, r8, #76
	beq	.L2599
.L2605:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r2, [r4, #2168]
	cmp	r2, r7
	bhi	.L2605
.L2601:
	cmp	r2, #0
	beq	.L2599
	add	r7, r5, #57088
	mov	r8, #0
	add	r7, r7, #16
	mov	r3, r4
	str	r5, [fp, #-48]
	mov	r4, r8
	mov	r10, #1
	mov	r5, r7
	mov	r8, r3
	b	.L2616
.L2606:
	ldr	r1, [r8, #3592]
	str	r0, [r6, #192]
	mov	r1, r10, asl r1
	str	r1, [r6, #1028]
.L2608:
	ldr	r1, [r9, #64]
	cmp	r1, #0
	beq	.L2610
	ldr	r1, [r6, #64]
	cmp	r1, #0
	bne	.L2611
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #528]
	str	r1, [r5, #964]
	mov	r0, r10, asl r0
	str	r1, [r5, #968]
	str	r0, [r5, #836]
	str	r0, [r5, #840]
.L2610:
	ldr	r1, [r8, #2168]
	add	r4, r4, #1
	add	r5, r5, #8
	cmp	r1, r4
	bls	.L2656
.L2616:
	ldr	r0, [r6, #4]!
	cmp	r0, #0
	beq	.L2606
	ldr	r3, [fp, #-48]
	ldr	r1, .L2664+4
	ldr	r0, [r3, #2340]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r6, #128]
	cmp	r1, #255
	bhi	.L2657
	ldr	r3, [fp, #-48]
	ldr	lr, [r8, #3592]
	ldr	r1, .L2664+8
	add	r0, r0, r10, asl lr
	str	r0, [r6, #1028]
	ldr	r0, [r3, #2340]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r6, #192]
	cmp	r1, #255
	bls	.L2608
	mov	r2, r0
	ldr	r1, .L2664+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2653:
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2590
.L2592:
	mov	r0, #0
.L2591:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2611:
	add	r2, r5, #960
	add	r1, r5, #128
	add	r3, r5, #832
	str	r9, [fp, #-56]
	ldr	r9, [fp, #-48]
	mov	r7, #0
	str	r6, [fp, #-60]
	mov	r6, r2
	str	r4, [fp, #-64]
	mov	r4, r5
	str	r5, [fp, #-68]
	mov	r5, r3
	str	r8, [fp, #-72]
	mov	r8, r1
.L2614:
	ldr	r1, .L2664+16
	add	r7, r7, #1
	ldr	r0, [r9, #2340]
	bl	HEVC_se_v
	ldr	r1, .L2664+20
	add	r3, r0, #128
	str	r0, [r4]
	cmp	r3, #255
	bhi	.L2658
	ldr	r0, [r9, #2340]
	bl	HEVC_se_v
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L2659
	ldr	r3, [fp, #-52]
	cmp	r7, #2
	ldr	r2, [r4], #4
	ldr	r1, [r3, #528]
	add	r3, r2, r10, asl r1
	str	r3, [r5, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r6, #4]!
	bne	.L2614
	sub	r4, fp, #64
	ldr	r5, [fp, #-68]
	ldr	r8, [fp, #-72]
	ldmia	r4, {r4, r6, r9}
	b	.L2610
.L2656:
	ldr	r5, [fp, #-48]
	mov	r4, r8
.L2599:
	ldr	r6, [r4, #2060]
	cmp	r6, #0
	bne	.L2592
	ldr	r3, [r4, #2172]
	cmp	r3, #0
	beq	.L2592
	add	r7, r5, #57344
	add	r7, r7, #12
	mov	r8, r7
.L2617:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2172]
	cmp	r3, r6
	bhi	.L2617
	ldr	r2, [r9, #64]
	cmp	r2, #0
	bne	.L2660
.L2618:
	cmp	r3, #0
	beq	.L2592
	add	r8, r5, #57600
	mov	r10, #0
	add	r8, r8, #16
	mov	r3, r9
	str	r5, [fp, #-48]
	mov	r5, r4
	mov	r9, r8
	mov	r8, r10
	mov	r10, r3
	b	.L2632
.L2622:
	ldr	r1, [r5, #3592]
	mov	r3, #1
	str	r0, [r7, #192]
	mov	r1, r3, asl r1
	str	r1, [r7, #836]
.L2624:
	ldr	r1, [r10, #64]
	cmp	r1, #0
	beq	.L2626
	ldr	r1, [r7, #64]
	cmp	r1, #0
	bne	.L2627
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #528]
	mov	r3, #1
	str	r1, [r9, #772]
	mov	r0, r3, asl r0
	str	r1, [r9, #776]
	str	r0, [r9, #644]
	str	r0, [r9, #648]
.L2626:
	ldr	r1, [r5, #2172]
	add	r8, r8, #1
	add	r9, r9, #8
	cmp	r1, r8
	bls	.L2592
.L2632:
	ldr	r0, [r7, #4]!
	cmp	r0, #0
	beq	.L2622
	ldr	r3, [fp, #-48]
	ldr	r1, .L2664+24
	ldr	r0, [r3, #2340]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r7, #128]
	cmp	r1, #255
	bhi	.L2661
	ldr	lr, [r5, #3592]
	mov	r3, #1
	ldr	r1, .L2664+28
	add	r0, r0, r3, asl lr
	ldr	r3, [fp, #-48]
	str	r0, [r7, #836]
	ldr	r0, [r3, #2340]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r7, #192]
	cmp	r1, #255
	bls	.L2624
	ldr	r1, .L2664+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2627:
	add	r3, r9, #640
	add	r2, r9, #768
	add	r1, r9, #128
	mov	r4, r9
	str	r9, [fp, #-56]
	mov	r6, #0
	ldr	r9, [fp, #-48]
	str	r8, [fp, #-60]
	mov	r8, r1
	str	r7, [fp, #-64]
	mov	r7, r3
	str	r5, [fp, #-68]
	mov	r5, r2
.L2630:
	ldr	r1, .L2664+36
	add	r6, r6, #1
	ldr	r0, [r9, #2340]
	bl	HEVC_se_v
	ldr	r1, .L2664+40
	add	r3, r0, #128
	str	r0, [r4]
	cmp	r3, #255
	bhi	.L2662
	ldr	r0, [r9, #2340]
	bl	HEVC_se_v
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L2663
	ldr	r3, [fp, #-52]
	cmp	r6, #2
	ldr	r2, [r4], #4
	ldr	r1, [r3, #528]
	mov	r3, #1
	add	r3, r2, r3, asl r1
	str	r3, [r7, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r5, #4]!
	bne	.L2630
	sub	r5, fp, #68
	ldmia	r5, {r5, r7, r8, r9}
	b	.L2626
.L2655:
	ldr	r1, .L2664+44
	ldr	r0, [r5, #2340]
	bl	HEVC_se_v
	add	r3, r0, #7
	str	r0, [r4, #3596]
	cmp	r3, #14
	bhi	.L2595
	mov	r3, r0
	ldr	r0, [r4, #3592]
	b	.L2596
.L2658:
	ldr	r1, .L2664+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2659:
	ldr	r1, .L2664+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2660:
	cmp	r3, #0
	addne	r8, r5, #57344
	movne	r6, #0
	addne	r8, r8, #76
	beq	.L2592
.L2621:
	mov	r1, #1
	ldr	r0, [r5, #2340]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2172]
	cmp	r3, r6
	bhi	.L2621
	b	.L2618
.L2657:
	mov	r2, r0
	ldr	r1, .L2664+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2662:
	ldr	r1, .L2664+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2663:
	ldr	r1, .L2664+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2661:
	ldr	r1, .L2664+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2597:
	ldr	r1, .L2664+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2654:
	ldr	r1, .L2664+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2595:
	ldr	r1, .L2664+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2591
.L2665:
	.align	2
.L2664:
	.word	.LC349
	.word	.LC354
	.word	.LC356
	.word	.LC357
	.word	.LC358
	.word	.LC360
	.word	.LC362
	.word	.LC364
	.word	.LC365
	.word	.LC366
	.word	.LC368
	.word	.LC351
	.word	.LC359
	.word	.LC361
	.word	.LC355
	.word	.LC367
	.word	.LC369
	.word	.LC363
	.word	.LC353
	.word	.LC350
	.word	.LC352
	UNWIND(.fnend)
	.size	HEVC_DecPredWeightTable, .-HEVC_DecPredWeightTable
	.align	2
	.global	HEVC_DecSliceSegmentHeader
	.type	HEVC_DecSliceSegmentHeader, %function
HEVC_DecSliceSegmentHeader:
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
	UNWIND(.pad #84)
	sub	sp, sp, #84
	mov	r1, #1
	mov	r4, r0
	ldr	r0, [r0, #2340]
	bl	BsGet
	add	r10, r4, #53248
	ldr	r7, [r10, #2072]
	sub	r3, r7, #16
	cmp	r3, #5
	movhi	r3, #0
	movls	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-72]
	strb	r0, [r10, #2001]
	bne	.L2933
.L2667:
	ldr	r1, .L2976
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r10, #2076]
	ldr	r3, [r4, #156]
	blt	.L2669
	cmp	r0, r3
	bge	.L2669
	mov	r0, r4
	bl	HEVC_VpsSpsPpsCheck
	subs	r3, r0, #0
	str	r3, [fp, #-88]
	bne	.L2934
	ldr	r1, [r10, #2076]
	movw	r5, #2024
	ldr	r2, [r4, #2352]
	movw	r6, #26164
	ldr	r3, [r4, #2348]
	mla	r5, r5, r1, r2
	ldrb	r1, [r5, #2]	@ zero_extendqisi2
	ldr	r2, [r5, #32]
	cmp	r1, #0
	mla	r6, r6, r2, r3
	bne	.L2935
.L2675:
	mov	r3, #0
	strb	r3, [r10, #2003]
.L2676:
	ldr	r9, [r6, #160]
	ldr	r3, [r6, #164]
	cmp	r9, #0
	beq	.L2678
	cmp	r3, #0
	beq	.L2678
	ldr	r0, [r6, #76]
	mov	r1, r3
	add	r0, r3, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	mov	r1, r9
	mov	r8, r0
	ldr	r0, [r6, #72]
	add	r0, r9, r0
	sub	r0, r0, #1
	bl	__aeabi_uidiv
	ldr	r9, [r6, #216]
	mov	r3, #1
	mov	r1, #0
	mov	r9, r9, asl r3
	mov	r9, r3, asl r9
	mul	r8, r0, r8
	cmp	r8, r3
	ble	.L2680
.L2681:
	add	r1, r1, #1
	cmp	r8, r3, asl r1
	bgt	.L2681
.L2680:
	ldrb	r3, [r10, #2001]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r2, #0
	beq	.L2936
.L2682:
	mul	r9, r9, r8
	ldrb	r8, [r10, #2003]	@ zero_extendqisi2
	str	r2, [r10, #2152]
	cmp	r8, #0
	str	r9, [r10, #2156]
	ldr	r3, [r4, #188]
	str	r3, [r10, #2048]
	beq	.L2937
.L2685:
	ldr	r3, [r5, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	streq	r3, [r10, #2140]
	bne	.L2938
.L2794:
	ldrb	r3, [r5, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2799
.L2805:
	ldr	r3, [r10, #2152]
	cmp	r3, #0
	bne	.L2939
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2807
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	movne	r3, #1
	strneb	r3, [r4, #3]
	bne	.L2809
.L2810:
	mov	r3, #0
	strb	r3, [r4, #2]
.L2811:
	mov	r0, r4
	bl	HEVC_IsNewPic
	str	r0, [r10, #3588]
	mov	r0, r4
	bl	HEVC_ReadByteAlignment
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L2913:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2939:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2810
.L2809:
	ldr	r3, [r10, #2048]
	ldr	r2, [fp, #-72]
	cmp	r3, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	beq	.L2810
	ldr	r3, [r10, #2072]
	cmp	r3, #21
	moveq	r3, #1
	streqb	r3, [r4, #2]
	bne	.L2810
	b	.L2811
.L2935:
	ldrb	r3, [r10, #2001]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2675
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2003]
	b	.L2676
.L2937:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L2690
.L2689:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r1, .L2976+4
	add	r8, r8, #1
	mov	r2, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r3, [r5, #36]
	cmp	r3, r8
	bhi	.L2689
.L2690:
	ldr	r1, .L2976+8
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r10, #2060]
	bhi	.L2940
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	streqb	r3, [r10, #2000]
	bne	.L2941
.L2692:
	sub	r7, r7, #19
	cmp	r7, #1
	bhi	.L2942
	mov	r3, #0
	str	r3, [r10, #2048]
	ldr	r3, [r4, #220]
	cmp	r3, #0
	streq	r3, [r4, #188]
	ldr	r3, [r10, #2068]
	cmp	r3, #0
	streq	r3, [r10, #2052]
	streq	r3, [r4, #184]
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2924
.L2813:
	mov	r3, #0
	strb	r3, [r10, #2007]
	str	r3, [fp, #-92]
.L2815:
	ldr	r3, [r10, #2060]
	cmp	r3, #2
	beq	.L2738
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #2008]
	cmp	r0, #0
	bne	.L2943
	ldr	r3, [r10, #2060]
	ldr	r2, [r5, #40]
	cmp	r3, #0
	str	r2, [r10, #2168]
	bne	.L2744
	ldr	r3, [r5, #44]
	str	r3, [r10, #2172]
.L2745:
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L2944
	ldr	r3, [fp, #-92]
	ldr	r2, [r3, #24]
	cmp	r2, #16
	bhi	.L2748
	cmp	r2, #0
	moveq	r3, r2
	beq	.L2750
	ldr	r3, [fp, #-92]
	add	r2, r2, #52
	add	r1, r3, #52
	add	r2, r3, r2
	mov	r3, #0
.L2752:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	addne	r3, r3, #1
	cmp	r1, r2
	bne	.L2752
	cmp	r3, #1
	movle	r2, #0
	movgt	r2, #1
.L2750:
	ldrb	r1, [r5, #22]	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	beq	.L2945
	add	r2, r4, #58624
	add	r1, r4, #55040
	add	r2, r2, #96
	add	r1, r1, #208
	mov	r0, r4
	bl	HEVC_DecRefPicListsModification
	cmp	r0, #0
	bne	.L2946
.L2746:
	ldr	r3, [r10, #2060]
	cmp	r3, #0
	beq	.L2817
.L2753:
	cmp	r3, #2
	beq	.L2738
.L2818:
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2947
.L2754:
	ldrb	r3, [r10, #2007]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #2060]
	beq	.L2764
	cmp	r3, #0
	beq	.L2948
	cmp	r3, #2
	mov	r3, #1
	strb	r3, [r10, #2011]
	beq	.L2759
.L2762:
	ldr	r3, [r10, #2168]
	cmp	r3, #1
	bls	.L2921
.L2760:
	ldr	r1, .L2976+12
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	ldrb	r2, [r10, #2011]	@ zero_extendqisi2
	cmp	r2, #0
	str	r0, [r10, #2112]
	bne	.L2765
	ldr	r3, [r10, #2108]
	sub	r3, r3, #1
.L2767:
	cmp	r3, r0
	movcs	r1, #0
	movcc	r1, #1
	orrs	r1, r1, r0, lsr #31
	beq	.L2921
	str	r3, [sp]
	mov	r3, r0
	ldr	r1, .L2976+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2933:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2002]
	b	.L2667
.L2936:
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r10, #2080]
	cmp	r0, #0
	ldr	r2, [r6, #244]
	ldr	r3, [r6, #240]
	mul	r3, r3, r2
	blt	.L2684
	cmp	r3, r0
	bls	.L2684
	mul	r2, r9, r0
	b	.L2682
.L2938:
	ldr	r1, .L2976+20
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	str	r0, [r10, #2140]
	ldr	r3, [r5, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	ldreq	r3, [r6, #244]
	subeq	r3, r3, #1
	beq	.L2790
	cmp	r3, #256
	ldreq	r2, [r5, #68]
	ldreq	r3, [r5, #72]
	ldrne	r3, [r6, #244]
	ldrne	r2, [r5, #68]
	mul	r3, r3, r2
	sub	r3, r3, #1
.L2790:
	cmp	r3, #255
	movcs	r3, #255
	cmp	r0, r3
	bhi	.L2949
	cmp	r0, #0
	beq	.L2794
	ldr	r1, .L2976+24
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #31
	add	r1, r0, #1
	str	r1, [r10, #2064]
	bhi	.L2950
	ldr	r3, [r10, #2140]
	cmp	r3, #0
	addne	r7, r4, #55296
	movne	r6, #0
	addne	r7, r7, #128
	bne	.L2798
	b	.L2794
.L2951:
	ldr	r1, [r10, #2064]
.L2798:
	ldr	r0, [r4, #2340]
	add	r6, r6, #1
	bl	BsGet
	str	r0, [r7, #4]!
	ldr	r3, [r10, #2140]
	cmp	r3, r6
	bhi	.L2951
	ldrb	r3, [r5, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2805
.L2799:
	ldr	r1, .L2976+28
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	cmp	r0, #256
	str	r0, [r10, #2144]
	bhi	.L2952
	ldr	r0, [r4, #2340]
	bl	BsResidBits
	ldr	r3, [r10, #2144]
	cmp	r0, r3
	bcc	.L2803
	cmp	r3, #0
	movne	r5, #0
	beq	.L2805
.L2806:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r3, [r10, #2144]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r10, #2148]
	bhi	.L2806
	b	.L2805
.L2738:
	ldrb	r3, [r10, #2007]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2759
	mov	r3, #2
	mov	r2, #1
	strb	r2, [r10, #2011]
.L2764:
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2769
	cmp	r3, #1
	beq	.L2772
.L2769:
	ldrb	r2, [r5, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2758
	cmp	r3, #0
	bne	.L2758
.L2772:
	mov	r0, r4
	bl	HEVC_DecPredWeightTable
	cmp	r0, #0
	ldreq	r3, [r10, #2060]
	bne	.L2953
.L2758:
	cmp	r3, #2
	beq	.L2773
	ldr	r1, .L2976+32
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	rsb	r3, r0, #4
	rsb	r2, r0, #5
	cmp	r3, #4
	str	r2, [r10, #2116]
	bhi	.L2954
.L2773:
	ldr	r1, .L2976+36
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	str	r0, [r10, #2120]
	ldr	r2, [r5, #48]
	add	r2, r0, r2
	str	r2, [r10, #2056]
	ldr	r3, [r6, #104]
	cmp	r2, #51
	rsb	r0, r3, #0
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	bne	.L2955
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2956
.L2775:
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2922
	ldrb	r3, [r5, #19]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r10, #2012]
	bne	.L2957
.L2783:
	ldrb	r0, [r5, #20]	@ zero_extendqisi2
	strb	r0, [r10, #2013]
	ldr	r3, [r5, #76]
	str	r3, [r10, #2132]
	ldr	r3, [r5, #80]
	str	r3, [r10, #2136]
.L2780:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2786
	ldr	r2, [r10, #2004]
	bic	r3, r2, #-16777216
	bic	r3, r3, #255
	adds	r3, r3, #0
	movne	r3, #1
.L2786:
	ldrb	r2, [r5, #17]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2787
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L2958
.L2787:
	strb	r2, [r10, #2014]
	b	.L2685
.L2807:
	ldr	r2, [fp, #-72]
	cmp	r2, #0
	strneb	r3, [r4, #3]
	b	.L2810
.L2945:
	ldr	r3, [r10, #2060]
	cmp	r3, #0
	bne	.L2818
.L2817:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r3, [r10, #2060]
	strb	r0, [r10, #2009]
	b	.L2753
.L2922:
	ldrb	r0, [r10, #2013]	@ zero_extendqisi2
	b	.L2780
.L2942:
	ldr	r1, [r6, #132]
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r2, #1
	str	r0, [r10, #2088]
	mov	r8, r0
	ldr	r3, [r6, #128]
	ldr	r7, [r4, #184]
	mov	r3, r2, asl r3
	str	r0, [fp, #-100]
	str	r3, [fp, #-104]
	mov	r1, r3
	mov	r0, r7
	bl	__aeabi_uidivmod
	cmp	r1, r8
	rsb	r3, r1, r7
	bls	.L2694
	ldr	r0, [fp, #-104]
	ldr	r2, [fp, #-100]
	rsb	r2, r2, r1
	cmp	r2, r0, lsr #1
	movcs	r2, r0
	addcs	r3, r3, r2
	bcc	.L2694
.L2695:
	ldr	r2, [r10, #2072]
	sub	r2, r2, #16
	cmp	r2, #2
	ldr	r2, [fp, #-100]
	movls	r3, #0
	add	r3, r3, r2
	str	r3, [r10, #2048]
	ldr	r2, [r4, #244]
	cmp	r3, r2
	bge	.L2697
	ldrb	r0, [r10, #2001]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L2959
.L2697:
	ldr	r3, [r4, #220]
	cmp	r3, #0
	ldreq	r3, [r10, #2048]
	streq	r3, [r4, #188]
	ldr	r3, [r10, #2068]
	cmp	r3, #0
	bne	.L2699
	ldr	r3, [r10, #2072]
	cmp	r3, #15
	bls	.L2960
.L2700:
	sub	r2, r3, #16
	cmp	r2, #7
	movhi	r2, #0
	movls	r2, #1
.L2701:
	sub	r3, r3, #7
	bics	r3, r3, #2
	andne	r3, r2, #1
	moveq	r3, #0
	cmp	r3, #0
	ldrne	r3, [r10, #2048]
	strne	r3, [r10, #2052]
	strne	r3, [r4, #184]
.L2699:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #2004]
	cmp	r0, #0
	beq	.L2702
	ldr	r3, [r6, #228]
	cmp	r3, #1
	movhi	r1, #0
	movhi	r2, #1
	bls	.L2704
.L2706:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L2706
	cmp	r1, #0
	bne	.L2961
.L2704:
	mov	r1, #0
	str	r1, [r10, #2092]
.L2709:
	mov	r2, #204
	add	r0, r4, #58368
	mla	r1, r2, r1, r6
	add	r0, r0, #148
	str	r0, [fp, #-92]
	add	r1, r1, #13056
	add	r1, r1, #52
	bl	memcpy
.L2705:
	ldrb	r3, [r6, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2710
	add	r3, r4, #57344
	str	r3, [fp, #-84]
	mov	r1, r3
	ldr	r3, [r6, #232]
	ldr	r2, [r1, #1192]
	cmp	r3, #0
	ldr	r3, [r1, #1188]
	add	r3, r2, r3
	str	r3, [fp, #-108]
	bne	.L2711
.L2714:
	mov	r9, #0
.L2712:
	ldr	r1, .L2976+40
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	ldr	ip, [fp, #-84]
	ldr	r1, [r10, #2096]
	str	r0, [r10, #2100]
	add	r0, r0, r1
	ldr	r2, [ip, #1188]
	ldr	r3, [ip, #1192]
	str	r0, [ip, #1204]
	add	lr, r3, r2
	add	lr, lr, r0
	cmp	lr, #16
	bhi	.L2962
	ldr	r3, [fp, #-108]
	cmp	r0, #0
	sub	r7, r3, #1
	add	r7, r0, r7
	beq	.L2730
	add	r3, r7, #14144
	add	r7, r7, #58368
	add	r3, r3, #33
	add	r7, r7, #201
	add	r7, r4, r7
	str	r7, [fp, #-64]
	mov	r3, r3, asl #2
	add	r0, r4, #56576
	add	ip, r3, #64
	str	ip, [fp, #-56]
	ldr	r7, [fp, #-56]
	add	ip, r4, #56320
	str	ip, [fp, #-48]
	add	lr, r4, #55040
	add	r8, r4, r7
	add	r7, r4, r3
	ldr	r3, [fp, #-48]
	add	r2, r4, #55040
	str	r0, [fp, #-52]
	add	r0, r0, #64
	str	r0, [fp, #-60]
	add	r0, ip, #196
	add	ip, lr, #223
	add	lr, r3, #132
	ldr	r3, [fp, #-52]
	add	r2, r2, #238
	str	r7, [fp, #-96]
	add	r3, r3, #4
	str	lr, [fp, #-48]
	str	r5, [fp, #-112]
	mov	lr, r3
	mov	r3, #0
	str	r6, [fp, #-76]
	mov	r7, lr
	str	r9, [fp, #-80]
	mov	r9, ip
	ldr	r5, [fp, #-64]
	str	r4, [fp, #-52]
	mov	r4, r3
	str	r10, [fp, #-64]
	mov	r10, r0
	str	r2, [fp, #-116]
	str	r3, [fp, #-68]
	str	r2, [fp, #-56]
	ldr	r6, [fp, #-96]
	b	.L2729
.L2965:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	ldreq	r0, [fp, #-80]
	bne	.L2963
.L2720:
	ldr	r2, [fp, #-76]
	add	r3, r2, r0
	add	r0, r0, #62
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	ldr	r3, [r2, r0, asl #2]
	strb	r1, [r5]
.L2723:
	ldr	r2, [fp, #-60]
	mov	r1, #1
	str	r3, [r2, #4]!
	ldr	r3, [fp, #-52]
	str	r2, [fp, #-60]
	ldr	r0, [r3, #2340]
	bl	BsGet
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-56]
	bne	.L2964
	cmp	r4, #0
	streq	r4, [fp, #-68]
	beq	.L2727
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-68]
	ldr	r3, [r3, #2096]
	cmp	r3, r4
	moveq	r2, #0
	str	r2, [fp, #-68]
.L2727:
	mov	r3, #0
	str	r3, [r8]
.L2726:
	ldr	r3, [fp, #-84]
	add	r4, r4, #1
	ldr	r2, [fp, #-48]
	sub	r6, r6, #4
	sub	r8, r8, #4
	sub	r5, r5, #1
	ldr	r3, [r3, #1204]
	add	r2, r2, #4
	add	r10, r10, #4
	add	r9, r9, #1
	cmp	r3, r4
	str	r2, [fp, #-48]
	add	r7, r7, #4
	bls	.L2728
	ldr	r3, [fp, #-64]
	ldr	r1, [r3, #2096]
.L2729:
	cmp	r1, r4
	bhi	.L2965
	ldr	r3, [fp, #-76]
	ldr	r1, [r3, #132]
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #2340]
	bl	BsGet
	ldr	r3, [fp, #-52]
	mov	r1, #1
	str	r0, [r10]
	str	r0, [fp, #-96]
	ldr	r0, [r3, #2340]
	bl	BsGet
	ldr	r3, [fp, #-96]
	uxtb	r0, r0
	strb	r0, [r9]
	strb	r0, [r5]
	b	.L2723
.L2694:
	ldr	r2, [fp, #-100]
	cmp	r1, r2
	bcs	.L2695
	rsb	r1, r1, r2
	ldr	r2, [fp, #-104]
	cmp	r1, r2, lsr #1
	rsbhi	r3, r2, r3
	b	.L2695
.L2941:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2000]
	b	.L2692
.L2956:
	ldr	r1, .L2976+44
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r10, #2124]
	cmp	r3, #24
	bhi	.L2966
	ldr	r3, [r5, #60]
	add	r2, r0, r3
	add	r2, r2, #12
	cmp	r2, #24
	bhi	.L2967
	ldr	r1, .L2976+48
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r10, #2128]
	cmp	r3, #24
	bhi	.L2968
	ldr	r2, [r5, #64]
	add	r2, r0, r2
	add	r3, r2, #12
	cmp	r3, #24
	bls	.L2775
	ldr	r1, .L2976+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2669:
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L2976+56
	mov	r0, #1
	ldr	r1, .L2976+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2921:
	ldr	r3, [r10, #2060]
	b	.L2764
.L2710:
	ldrb	r3, [r6, #11]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r10, #2007]
	bne	.L2969
.L2735:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2815
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10, #2005]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2006]
	b	.L2815
.L2924:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10, #2005]
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2006]
	b	.L2813
.L2947:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2010]
	b	.L2754
.L2744:
	str	r0, [r10, #2172]
.L2743:
	cmp	r3, #2
	bne	.L2745
	b	.L2746
.L2943:
	ldr	r1, .L2976+64
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r10, #2104]
	cmp	r2, #16
	bhi	.L2970
	ldr	r3, [r10, #2060]
	str	r2, [r10, #2168]
	cmp	r3, #0
	movne	r2, #0
	strne	r2, [r10, #2108]
	strne	r2, [r10, #2172]
	bne	.L2743
	ldr	r1, .L2976+68
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r10, #2108]
	cmp	r2, #16
	strls	r2, [r10, #2172]
	ldrls	r3, [r10, #2060]
	bls	.L2743
	mov	r3, #16
	ldr	r1, .L2976+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2948:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	ldr	r3, [r10, #2060]
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r10, #2011]
	beq	.L2773
	cmp	r0, #0
	bne	.L2762
	ldr	r2, [r10, #2172]
	cmp	r2, #1
	bhi	.L2760
	b	.L2764
.L2759:
	mov	r3, #2
	b	.L2769
.L2765:
	ldr	r3, [r10, #2104]
	sub	r3, r3, #1
	b	.L2767
.L2960:
	tst	r3, #1
	movne	r2, #1
	bne	.L2701
	b	.L2700
.L2711:
	ldr	r1, .L2976+76
	ldr	r0, [r4, #2340]
	bl	HEVC_ue_v
	str	r0, [r10, #2096]
	mov	r2, r0
	ldr	r3, [r6, #232]
	cmp	r0, r3
	bhi	.L2971
	cmp	r3, #1
	bls	.L2714
	mov	r9, #0
	mov	r2, #1
.L2715:
	add	r9, r9, #1
	cmp	r3, r2, asl r9
	bhi	.L2715
	str	r9, [fp, #-88]
	b	.L2712
.L2959:
	ldr	r1, .L2976+80
	bl	dprint_vfmw
	b	.L2697
.L2803:
	mov	r2, r0
	ldr	r1, .L2976+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2964:
	ldr	r3, [fp, #-52]
	ldr	r1, .L2976+88
	ldr	r0, [r3, #2340]
	bl	HEVC_ue_v
	cmp	r4, #0
	str	r0, [r7]
	beq	.L2725
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #2096]
	cmp	r3, r4
	ldrne	r3, [fp, #-68]
	addne	r0, r0, r3
.L2725:
	str	r0, [r6]
	mov	r3, #1
	str	r0, [fp, #-68]
	str	r3, [r8]
	b	.L2726
.L2963:
	ldr	r3, [fp, #-52]
	ldr	r1, [fp, #-88]
	ldr	r0, [r3, #2340]
	bl	BsGet
	ldr	r3, [fp, #-48]
	cmp	r0, #0
	str	r0, [r3]
	blt	.L2972
	ldr	r3, [fp, #-76]
	ldr	r3, [r3, #232]
	sub	r3, r3, #1
	cmp	r3, r0
	bcs	.L2720
	mov	r7, r4
.L2722:
	str	r3, [sp]
	mov	r2, r7
	mov	r3, r0
	ldr	r1, .L2976+92
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2678:
	mov	r2, r9
	ldr	r1, .L2976+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2958:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2014]
	b	.L2685
.L2957:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #2012]
	cmp	r0, #0
	beq	.L2783
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #2013]
	cmp	r0, #0
	bne	.L2780
	ldr	r1, .L2976+100
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r10, #2132]
	bhi	.L2973
.L2784:
	ldr	r1, .L2976+104
	ldr	r0, [r4, #2340]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r10, #2136]
	bls	.L2922
	ldr	r1, .L2976+108
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #80]
	ldrb	r0, [r10, #2013]	@ zero_extendqisi2
	str	r3, [r10, #2136]
	b	.L2780
.L2728:
	ldr	r2, [fp, #-108]
	cmp	r3, #0
	ldr	r5, [fp, #-112]
	add	r2, r2, #14656
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-52]
	add	r2, r2, #7
	ldr	r10, [fp, #-64]
	beq	.L2730
	add	r2, r2, r3
	add	lr, r4, #56576
	add	lr, lr, #68
	mov	r7, #0
	add	r2, r4, r2, lsl #2
	ldr	r8, [fp, #-104]
	ldr	ip, [fp, #-116]
	ldr	r9, [fp, #-100]
	str	r4, [fp, #-48]
	b	.L2733
.L2975:
	ldr	r0, [r10, #2048]
	ldr	r4, [lr]
	rsb	r1, r9, r0
	add	r1, r1, r4
	ldr	r4, [r2, #-1948]
	mls	r1, r4, r8, r1
	rsb	r0, r0, r1
	str	r0, [r2, #-68]
	str	r1, [r2]
.L2732:
	add	r7, r7, #1
	add	lr, lr, #4
	cmp	r3, r7
	sub	r2, r2, #4
	bls	.L2974
.L2733:
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2975
	ldr	r1, [lr]
	str	r1, [r2]
	ldr	r0, [r10, #2048]
	rsb	r1, r0, r1
	str	r1, [r2, #-68]
	b	.L2732
.L2934:
	ldr	r3, [r4, #248]
	mov	r0, r4
	cmp	r3, #0
	ldrne	r3, [r4, #188]
	str	r3, [r10, #2048]
	bl	HEVC_IsNewPic
	ldr	r1, .L2976+112
	str	r0, [r10, #3588]
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2974:
	ldr	r4, [fp, #-48]
.L2718:
	ldr	r2, [fp, #-108]
	add	r2, r3, r2
	ldr	r3, [fp, #-84]
	cmp	r2, #16
	str	r2, [r3, #1196]
	bls	.L2710
	mov	r3, #16
	ldr	r1, .L2976+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2702:
	add	r7, r4, #58368
	ldr	r3, [r6, #228]
	add	r7, r7, #148
	mov	r1, r6
	mov	r0, r4
	mov	r2, r7
	bl	HEVC_DecShortTermRefPicSet
	cmp	r0, #0
	streq	r7, [fp, #-92]
	beq	.L2705
	ldr	r1, .L2976+120
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2969:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsGet
	strb	r0, [r10, #2007]
	b	.L2735
.L2977:
	.align	2
.L2976:
	.word	.LC370
	.word	.LC376
	.word	.LC375
	.word	.LC395
	.word	.LC396
	.word	.LC412
	.word	.LC414
	.word	.LC416
	.word	.LC398
	.word	.LC400
	.word	.LC383
	.word	.LC402
	.word	.LC405
	.word	.LC407
	.word	.LANCHOR1+524
	.word	.LC371
	.word	.LC388
	.word	.LC390
	.word	.LC391
	.word	.LC381
	.word	.LC378
	.word	.LC418
	.word	.LC386
	.word	.LC385
	.word	.LC373
	.word	.LC408
	.word	.LC410
	.word	.LC411
	.word	.LC372
	.word	.LC387
	.word	.LC379
	.word	.LC380
	.word	.LC401
	.word	.LC374
	.word	.LC417
	.word	.LC377
	.word	.LC393
	.word	.LC399
	.word	.LC413
	.word	.LC409
	.word	.LC404
	.word	.LC397
	.word	.LC406
	.word	.LC403
	.word	.LC384
	.word	.LC394
	.word	.LC389
	.word	.LC392
	.word	.LC415
	.word	.LC382
.L2961:
	ldr	r0, [r4, #2340]
	bl	BsGet
	str	r0, [r10, #2092]
	cmp	r0, #0
	ldr	r3, [r6, #228]
	mov	r1, r0
	sub	r3, r3, #1
	blt	.L2708
	cmp	r3, r0
	bcs	.L2709
.L2708:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L2976+124
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2955:
	ldr	r1, .L2976+128
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2684:
	mov	r2, r0
	ldr	r1, .L2976+132
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2952:
	mov	r2, r0
	ldr	r1, .L2976+136
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2972:
	ldr	r6, [fp, #-76]
	mov	r7, r4
	ldr	r3, [r6, #232]
	sub	r3, r3, #1
	b	.L2722
.L2940:
	mov	r2, r0
	ldr	r1, .L2976+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2748:
	mov	r3, #16
	ldr	r1, .L2976+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2954:
	ldr	r1, .L2976+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2949:
	mov	r2, r0
	ldr	r1, .L2976+152
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2973:
	ldr	r1, .L2976+156
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #76]
	str	r3, [r10, #2132]
	b	.L2784
.L2967:
	mov	r2, r0
	ldr	r1, .L2976+160
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2730:
	mov	r3, #0
	b	.L2718
.L2953:
	ldr	r1, .L2976+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2968:
	mov	r2, r0
	ldr	r1, .L2976+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2966:
	mov	r2, r0
	ldr	r1, .L2976+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2962:
	str	r0, [sp]
	mov	ip, #16
	ldr	r1, .L2976+176
	mov	r0, #1
	str	ip, [sp, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2946:
	ldr	r1, .L2976+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2970:
	mov	r3, #16
	ldr	r1, .L2976+184
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2944:
	ldr	r1, .L2976+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2950:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L2976+192
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
.L2971:
	ldr	r1, .L2976+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2913
	UNWIND(.fnend)
	.size	HEVC_DecSliceSegmentHeader, .-HEVC_DecSliceSegmentHeader
	.align	2
	.global	HEVC_ClearCurrNal
	.type	HEVC_ClearCurrNal, %function
HEVC_ClearCurrNal:
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
	ldr	r1, [r0, #2364]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2979
	ldr	r0, [r0, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L2979:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrNal, .-HEVC_ClearCurrNal
	.align	2
	.global	HEVC_FrameStoreRefFlg
	.type	HEVC_FrameStoreRefFlg, %function
HEVC_FrameStoreRefFlg:
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
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FrameStoreRefFlg, .-HEVC_FrameStoreRefFlg
	.align	2
	.global	HEVC_ClearCurrSlice
	.type	HEVC_ClearCurrSlice, %function
HEVC_ClearCurrSlice:
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
	ldr	r1, [r0, #2364]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2985
	ldr	r0, [r0, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L2985:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrSlice, .-HEVC_ClearCurrSlice
	.align	2
	.global	HEVC_ClearAllSlice
	.type	HEVC_ClearAllSlice, %function
HEVC_ClearAllSlice:
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
	ldr	r3, [r0, #160]
	mov	r7, r0
	cmp	r3, #0
	beq	.L2993
	mov	r4, #0
	add	r8, r0, #65536
	mov	r5, r4
	mov	r6, r4
.L2992:
	ldr	r3, [r8, #3680]
	add	r5, r5, #1
	add	r3, r3, r4
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L2991
	ldr	r0, [r7, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3680]
	add	r3, r3, r4
	str	r6, [r3, #24]
.L2991:
	ldr	r3, [r7, #160]
	add	r4, r4, #28
	cmp	r3, r5
	bhi	.L2992
.L2993:
	mov	r0, #0
	mov	r3, #2
	str	r0, [r7, #208]
	str	r0, [r7, #256]
	str	r0, [r7, #248]
	strb	r0, [r7, #9]
	str	r3, [r7, #172]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearAllSlice, .-HEVC_ClearAllSlice
	.align	2
	.global	HEVC_InitDPB
	.type	HEVC_InitDPB, %function
HEVC_InitDPB:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	mov	r5, r0
	mov	r8, r1
	bl	HEVC_ClearAllSlice
	add	r9, r5, #2544
	mov	r4, r5
	add	r9, r9, #12
	mov	r6, #17
	mov	r7, #0
.L3004:
	ldr	r3, [r9, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L3000
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
.L3000:
	ldr	r3, [r4, #2628]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3001
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
.L3001:
	ldr	r3, [r4, #2696]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3002
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
.L3002:
	ldr	r3, [r4, #2764]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3003
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
.L3003:
	subs	r6, r6, #1
	str	r7, [r4, #2764]
	str	r7, [r4, #2696]
	add	r4, r4, #4
	str	r7, [r4, #2624]
	str	r7, [r4, #2556]
	bne	.L3004
	add	r4, r5, #24576
	mov	r7, #0
	mov	r1, r7
	mov	r2, #200
	ldr	r3, [r4, #3772]
	add	r0, r5, #2832
	ldr	r3, [r3, #236]
	str	r7, [r5, #2540]
	add	r3, r3, #1
	str	r7, [r5, #2552]
	cmp	r3, #17
	str	r7, [r5, #2556]
	str	r7, [r5, #2548]
	movhi	r3, #17
	str	r3, [r5, #2536]
	ldr	r3, .L3046
	str	r7, [r5, #2544]
	ldr	r3, [r3, #48]
	blx	r3
	add	r2, r5, #2352
	add	r2, r2, #12
	add	r3, r5, #2432
	mov	r0, r7
	mov	r1, #16
	str	r7, [r5, #2836]
	str	r1, [r5, #2832]
.L3007:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L3007
	add	r2, r5, #2496
	add	ip, r5, #53248
	add	r2, r2, #4
	mov	r0, r1
	str	r1, [ip, #2160]
.L3008:
	str	r0, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L3008
	cmp	r8, r1
	str	r1, [ip, #2164]
	bne	.L3009
	ldr	r3, [r5, #2356]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L3009
.L3010:
	ldr	r1, [r5, #180]
	cmp	r1, #0
	addne	r2, r5, #2144
	movne	r3, #0
	movne	r0, r3
	beq	.L3018
.L3017:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L3017
.L3018:
	ldr	r3, [r5, #160]
	cmp	r3, #0
	addne	r8, r5, #65536
	movne	r4, #0
	movne	r7, r4
	beq	.L3016
.L3020:
	ldr	r3, [r8, #3680]
	add	r4, r4, #1
	add	r3, r3, r6
	ldr	r3, [r3, #24]
	cmp	r3, #0
	mov	r1, r3
	beq	.L3019
	ldr	r2, [r5, #2364]
	cmp	r3, r2
	beq	.L3019
	ldr	r0, [r5, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3680]
	add	r3, r3, r6
	str	r7, [r3, #24]
.L3019:
	ldr	r3, [r5, #160]
	add	r6, r6, #28
	cmp	r3, r4
	bhi	.L3020
.L3016:
	mov	r0, #0
.L3011:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3009:
	mov	r7, #20
	str	r7, [r5, #176]
	str	r7, [r5, #180]
	mov	r0, r5
	ldr	r1, [r4, #3772]
	ldr	r3, [r1, #240]
	ldr	ip, [r1, #244]
	ldr	r2, [r1, #148]
	str	r7, [sp, #8]
	mov	r1, r3, asl r2
	str	ip, [sp]
	mov	r2, ip, asl r2
	str	r7, [sp, #4]
	bl	HEVC_ArrangeVahbMem
	ldr	r3, [r5, #2356]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L3021
	cmp	r0, #1
	bne	.L3044
	ldr	r0, [r5, #276]
	bl	FSP_GetTotalValidFsNum
	cmp	r0, #20
	movgt	r0, r7
	ble	.L3045
.L3013:
	str	r0, [r5, #176]
	b	.L3010
.L3045:
	ldr	r0, [r5, #276]
	bl	FSP_GetTotalValidFsNum
	b	.L3013
.L3044:
	ldr	r2, .L3046+4
	mov	r0, #0
	ldr	r1, .L3046+8
	bl	dprint_vfmw
	mvn	r0, #4
	b	.L3011
.L3021:
	mvn	r0, #1
	b	.L3011
.L3047:
	.align	2
.L3046:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+552
	.word	.LC419
	UNWIND(.fnend)
	.size	HEVC_InitDPB, .-HEVC_InitDPB
	.align	2
	.global	HEVC_ClearAllNal
	.type	HEVC_ClearAllNal, %function
HEVC_ClearAllNal:
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
	ldr	r3, [r0, #160]
	mov	r6, r0
	cmn	r3, #1
	beq	.L3052
	mov	r4, #0
	add	r7, r0, #65536
	mov	r5, r4
	b	.L3051
.L3050:
	ldr	r3, [r6, #160]
	add	r3, r3, #1
	cmp	r3, r5
	bls	.L3052
.L3051:
	ldr	r1, [r7, #2876]
	add	r5, r5, #1
	add	r1, r1, r4
	add	r4, r4, #100
	ldr	r3, [r1, #36]
	cmp	r3, #1
	bne	.L3050
	ldr	r0, [r6, #276]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r6, #160]
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L3051
.L3052:
	mov	r0, #0
	strb	r0, [r6, #5]
	str	r0, [r6, #140]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearAllNal, .-HEVC_ClearAllNal
	.align	2
	.global	HEVC_InitDecPara
	.type	HEVC_InitDecPara, %function
HEVC_InitDecPara:
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
	ldr	r1, .L3068
	mov	r4, r0
	mov	r0, #22
	add	r5, r4, #68608
	bl	dprint_vfmw
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #244]
	bl	HEVC_ClearAllNal
	add	r0, r4, #62464
	add	r0, r0, #248
	ldr	r6, .L3068+4
	bl	ResetVoQueue
	mov	r8, #0
	add	r5, r5, #696
	mov	r9, #20
	mov	r7, r8
.L3056:
	strb	r7, [r5, #-80]
	mov	r3, #16
	str	r7, [r5, #-76]
	mov	r0, r5
	strb	r7, [r5, #-79]
	mov	r2, #664
	str	r7, [r5, #-68]
	mov	r1, #0
	strb	r7, [r5, #-78]
	str	r9, [r5, #-56]
	str	r3, [r5, #-52]
	ldr	r3, [r6, #48]
	blx	r3
	str	r8, [r5, #180]
	add	r8, r8, #1
	sub	r3, r5, #80
	cmp	r8, #20
	str	r7, [r5, #-32]
	str	r3, [r5, #-8]
	add	r5, r5, #752
	bne	.L3056
	add	r3, r4, #2144
	add	r1, r4, #2224
	mov	r2, #0
.L3057:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L3057
	ldr	r3, [r4, #160]
	cmp	r3, #0
	addne	ip, r4, #65536
	movne	r3, #0
	movne	r0, r3
	movne	r1, r3
	beq	.L3061
.L3060:
	ldr	r2, [ip, #3680]
	add	r0, r0, #1
	str	r1, [r2, r3]
	ldr	r2, [ip, #3680]
	add	r2, r2, r3
	str	r1, [r2, #20]
	ldr	r2, [ip, #3680]
	add	r2, r2, r3
	add	r3, r3, #28
	str	r1, [r2, #24]
	ldr	r2, [r4, #160]
	cmp	r2, r0
	bhi	.L3060
.L3061:
	ldr	r3, [r6, #48]
	mov	r2, #200
	mov	r1, #0
	add	r0, r4, #2832
	blx	r3
	add	ip, r4, #2752
	add	r0, r4, #2688
	add	r1, r4, #2544
	add	ip, ip, #8
	add	r0, r0, #4
	add	r1, r1, #12
	add	lr, r4, #2624
	mov	r3, #16
	mov	r2, #17
	str	r3, [r4, #2832]
	mov	r3, #0
.L3059:
	subs	r2, r2, #1
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [lr, #4]!
	str	r3, [r1, #4]!
	bne	.L3059
	add	r1, r4, #2352
	add	ip, r4, #2496
	add	r1, r1, #12
	add	ip, ip, #4
	add	r3, r4, #2432
	mov	r0, r2
	mov	lr, #17
	str	r2, [r4, #2540]
	str	r2, [r4, #2544]
	str	r2, [r4, #2548]
	str	r2, [r4, #2552]
	str	r2, [r4, #2556]
	str	lr, [r4, #2536]
.L3062:
	str	r0, [r3, #4]!
	cmp	r3, ip
	str	r0, [r1, #4]!
	mov	r5, #0
	bne	.L3062
	add	r0, r4, #55040
	mov	r9, #2
	mov	r1, r5
	ldr	r3, [r6, #48]
	str	r5, [r4, #2364]
	movw	r2, #3732
	str	r5, [r4, #208]
	add	r0, r0, #208
	str	r5, [r4, #256]
	add	r7, r4, #2496
	str	r5, [r4, #248]
	add	r7, r7, #8
	str	r9, [r4, #172]
	mov	r8, #32
	blx	r3
	add	r2, r4, #53248
	mov	r3, #1
	mov	lr, #20
	str	r9, [r2, #2060]
	mov	ip, #16
	str	r3, [r2, #3588]
	mov	r1, r5
	strb	r3, [r4, #1]
	mov	r2, r8
	strb	r3, [r4, #3]
	mov	r0, r7
	mov	r3, #8
	strb	r5, [r4, #4]
	strb	r5, [r4, #2]
	mov	r10, #64
	strb	r5, [r4, #8]
	str	r9, [r4, #2240]
	mvn	r9, #-2147483648
	str	r5, [r4, #168]
	movw	r5, #1025
	str	r8, [r4, #352]
	mov	r8, #4
	str	lr, [r4, #176]
	str	lr, [r4, #180]
	mov	lr, #6
	str	r3, [r4, #192]
	str	r3, [r4, #196]
	str	r3, [r4, #344]
	mov	r3, #256
	ldr	r6, [r6, #48]
	str	r9, [r4, #200]
	str	ip, [r4, #324]
	str	ip, [r4, #348]
	str	r10, [r4, #328]
	str	r3, [r4, #332]
	str	r5, [r4, #336]
	str	r8, [r4, #340]
	str	lr, [r4, #2228]
	str	lr, [r4, #2232]
	str	lr, [r4, #2236]
	blx	r6
	str	r7, [r4, #2340]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3069:
	.align	2
.L3068:
	.word	.LC420
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_InitDecPara, .-HEVC_InitDecPara
	.align	2
	.global	HEVCDEC_Init
	.type	HEVCDEC_Init, %function
HEVCDEC_Init:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	add	r8, r0, #61440
	ldr	r7, .L3083
	movw	r2, #22224
	ldr	r5, [r8, #1616]
	mov	r4, r0
	mov	r9, r1
	movt	r2, 1
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	str	r5, [r8, #1616]
	mov	r3, #0
	str	r9, [r4, #2356]
	str	r3, [r4, #2360]
	ldr	r3, [r9, #28]
	cmp	r3, #25
	beq	.L3078
	mov	r3, #17
	mov	r1, #65
	str	r3, [r4, #148]
	mov	r2, #200
	str	r3, [r4, #152]
	mov	r3, #210
	str	r1, [r4, #156]
	str	r2, [r4, #144]
	str	r3, [r4, #160]
.L3072:
	ldr	r0, [r9, #584]
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L3079
	ldr	r3, [r4, #148]
	movw	r2, #23196
	ldr	r10, [r4, #2356]
	add	r6, r4, #65536
	ldr	r0, [r4, #152]
	mov	lr, #100
	mul	r3, r2, r3
	ldr	ip, [r10, #580]
	ldr	r2, [r4, #156]
	add	r1, r5, ip
	str	r1, [r4, #2344]
	add	ip, r3, ip
	str	r3, [fp, #-52]
	add	r3, r5, ip
	str	r3, [r4, #2348]
	movw	r3, #26164
	mla	ip, r3, r0, ip
	add	r3, r5, ip
	str	r3, [r4, #2352]
	movw	r3, #2024
	mla	ip, r3, r2, ip
	mov	r3, #1360
	add	r0, r5, ip
	str	r0, [r6, #2872]
	ldr	r2, [r4, #144]
	mul	r2, r3, r2
	add	ip, ip, r2
	add	r3, r5, ip
	str	r3, [r6, #2876]
	ldr	r3, [r4, #160]
	mla	lr, r3, lr, lr
	mov	r3, r3, asl #5
	str	lr, [fp, #-48]
	ldr	lr, [r4, #160]
	sub	r3, r3, lr, asl #2
	ldr	lr, [fp, #-48]
	add	ip, ip, lr
	add	r5, r5, ip
	str	r5, [r6, #3680]
	ldr	r5, [r10, #588]
	add	r3, ip, r3
	cmp	r3, r5
	bhi	.L3080
	ldr	r5, [r9, #608]
	cmp	r5, #0
	beq	.L3081
.L3076:
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	ldr	ip, [r4, #160]
	mov	r2, #100
	ldr	r3, [r7, #48]
	mov	r1, #0
	ldr	r0, [r6, #2876]
	mla	r2, ip, r2, r2
	blx	r3
	ldr	r3, [r4, #160]
	ldr	ip, [r7, #48]
	mov	r1, #0
	ldr	r0, [r6, #3680]
	mov	r5, #1
	mov	r2, r3, asl #5
	sub	r2, r2, r3, asl #2
	blx	ip
	ldr	lr, [r4, #148]
	movw	r3, #23196
	ldr	r6, [r4, #2344]
	add	ip, r4, #24576
	movw	r1, #2024
	mul	r3, r3, lr
	movw	r2, #26164
	mov	r0, r4
	sub	r3, r3, #23040
	sub	r3, r3, #156
	add	r6, r6, r3
	str	r6, [ip, #3768]
	ldr	r3, [r4, #156]
	ldr	r7, [r4, #2352]
	mul	r3, r1, r3
	sub	r3, r3, #2016
	sub	r3, r3, #8
	add	r3, r7, r3
	str	r3, [ip, #3776]
	ldr	r3, [r4, #152]
	ldr	r1, [r4, #2348]
	mul	r3, r2, r3
	sub	r3, r3, #26112
	sub	r3, r3, #52
	add	r3, r1, r3
	str	r3, [ip, #3772]
	str	lr, [r6, #8]
	ldr	r3, [ip, #3776]
	ldr	r2, [r4, #152]
	str	r2, [r3, #28]
	ldr	r3, [ip, #3772]
	ldr	r2, [r4, #156]
	str	r2, [r3, #60]
	bl	HEVC_InitScalingOrderTable
	add	r3, r4, #86016
	mov	r0, r4
	str	r5, [r3, #1724]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #276]
	beq	.L3082
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #244]
	bl	HEVC_InitDecPara
	mov	r3, #0
	str	r3, [r8, #1624]
	movw	r1, #9999
	ldr	ip, [r4, #156]
	mov	r0, r3
	ldr	r2, [r4, #2356]
	str	r3, [r4, #240]
	strb	r5, [r4]
	str	ip, [r4, #320]
	str	r1, [r4, #284]
	ldr	r3, [r2, #624]
	str	r3, [r4, #212]
.L3074:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3081:
	ldr	r2, [fp, #-52]
	mov	r0, r1
	ldr	r3, [r7, #48]
	mov	r1, r5
	blx	r3
	ldr	r2, [r4, #152]
	movw	ip, #26164
	ldr	r3, [r7, #48]
	mov	r1, r5
	ldr	r0, [r4, #2348]
	mul	r2, ip, r2
	blx	r3
	ldr	r2, [r4, #156]
	movw	ip, #2024
	ldr	r3, [r7, #48]
	mov	r1, r5
	ldr	r0, [r4, #2352]
	mul	r2, ip, r2
	blx	r3
	ldr	r2, [r4, #144]
	mov	r3, #1360
	ldr	r0, [r6, #2872]
	mul	r2, r3, r2
	b	.L3076
.L3078:
	ldr	r3, [r9, #680]
	str	r3, [r4, #148]
	ldr	r3, [r9, #684]
	str	r3, [r4, #152]
	ldr	r3, [r9, #688]
	str	r3, [r4, #156]
	ldr	r3, [r9, #676]
	add	r2, r3, #5
	str	r2, [r4, #160]
	str	r3, [r4, #144]
	b	.L3072
.L3080:
	str	r5, [sp]
	mov	r0, #0
	ldr	r2, .L3083+4
	ldr	r1, .L3083+8
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3074
.L3082:
	ldr	r2, .L3083+4
	mov	r0, #0
	ldr	r1, .L3083+12
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3074
.L3079:
	ldr	r2, .L3083+4
	ldr	r1, .L3083+16
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3074
.L3084:
	.align	2
.L3083:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+568
	.word	.LC422
	.word	.LC423
	.word	.LC421
	UNWIND(.fnend)
	.size	HEVCDEC_Init, .-HEVCDEC_Init
	.align	2
	.global	HEVC_ClearCurrPic
	.type	HEVC_ClearCurrPic, %function
HEVC_ClearCurrPic:
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
	add	r4, r0, #53248
	mov	r5, r0
	bl	HEVC_ClearAllSlice
	ldr	r3, [r4, #1332]
	cmp	r3, #0
	beq	.L3086
	ldr	r1, [r3, #32]
	mov	r2, #1
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #1332]
	mov	r3, #0
	str	r3, [r2, #4]
	str	r3, [r4, #1332]
.L3086:
	mov	r0, #0
	strb	r0, [r4, #1273]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_ClearCurrPic, .-HEVC_ClearCurrPic
	.align	2
	.global	HEVC_ClearAll
	.type	HEVC_ClearAll, %function
HEVC_ClearAll:
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
	mov	r5, r1
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	cmp	r5, #0
	bne	.L3093
	add	r0, r4, #62464
	add	r0, r0, #248
	bl	ResetVoQueue
	ldr	r0, [r4, #276]
	bl	FSP_EmptyInstance
.L3092:
	mov	r0, r4
	bl	HEVC_InitDecPara
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3093:
	add	r1, r4, #62464
	ldr	r0, [r4, #276]
	add	r1, r1, #248
	bl	FSP_ClearNotInVoQueue
	b	.L3092
	UNWIND(.fnend)
	.size	HEVC_ClearAll, .-HEVC_ClearAll
	.align	2
	.global	HEVC_InitPic
	.type	HEVC_InitPic, %function
HEVC_InitPic:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	ldr	r3, [r0, #288]
	mov	r4, r0
	add	r8, r0, #24576
	add	r5, r0, #53248
	str	r3, [fp, #-60]
	ldr	r3, [r4, #292]
	ldr	r2, [r8, #3772]
	ldr	r0, [r5, #2076]
	str	r3, [fp, #-48]
	ldr	r3, [r4, #296]
	cmp	r0, #0
	str	r3, [fp, #-52]
	ldr	r3, [r2, #100]
	str	r3, [fp, #-64]
	ldr	r3, [r2, #108]
	str	r3, [fp, #-68]
	ldr	r3, [r4, #300]
	str	r3, [fp, #-56]
	blt	.L3097
	ldr	r3, [r4, #156]
	cmp	r0, r3
	bge	.L3097
	ldr	lr, [r4, #2352]
	movw	r6, #2024
	movw	ip, #26164
	ldr	r3, [r4, #2348]
	ldr	r7, [r4, #2344]
	movw	r1, #23196
	mla	r6, r6, r0, lr
	ldr	r0, [r8, #3768]
	ldr	r0, [r0, #8]
	ldr	r10, [r6, #32]
	mul	r10, ip, r10
	add	r9, r3, r10
	ldr	ip, [r9, #52]
	mla	r1, r1, ip, r7
	ldr	ip, [r1, #8]
	cmp	r0, ip
	bne	.L3098
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3154
.L3098:
	mov	r2, #0
	strb	r2, [r1, #2]
	ldr	r0, [r4, #148]
	movw	r7, #23196
	ldr	ip, .L3159
	mov	r2, r7
	ldr	lr, [r4, #2344]
	mul	r0, r7, r0
	ldr	ip, [ip, #52]
	str	r3, [fp, #-72]
	sub	r0, r0, #23040
	sub	r0, r0, #156
	add	r0, lr, r0
	blx	ip
	ldr	r0, [r4, #148]
	ldr	r2, [r8, #3772]
	ldr	r3, [fp, #-72]
	mul	r7, r7, r0
	ldr	r1, [r4, #2344]
	sub	r7, r7, #23040
	sub	r7, r7, #156
	add	r7, r1, r7
	str	r7, [r8, #3768]
.L3099:
	ldr	r0, [r2, #60]
	ldr	r1, [r9, #60]
	cmp	r0, r1
	beq	.L3155
.L3100:
	mov	r2, #0
	strb	r2, [r3, r10]
	ldr	r0, [r4, #152]
	movw	r7, #26164
	ldr	ip, [r8, #3772]
	mov	r2, r7
	ldr	lr, [r9, #236]
	mov	r1, r9
	mul	r0, r7, r0
	ldr	ip, [ip, #236]
	ldr	r3, .L3159
	ldr	r10, [r4, #2348]
	subs	ip, lr, ip
	sub	r0, r0, #26112
	sub	r0, r0, #52
	ldr	r3, [r3, #52]
	add	r0, r10, r0
	movne	ip, #1
	str	ip, [fp, #-72]
	blx	r3
	ldr	r3, [r4, #152]
	ldr	r2, [r4, #2348]
	mul	r7, r7, r3
	sub	r7, r7, #26112
	sub	r7, r7, #52
	add	r2, r2, r7
	str	r2, [r8, #3772]
	ldr	r3, [r2, #60]
	str	r3, [r4, #288]
	ldr	r3, [r2, #72]
	str	r3, [r4, #292]
	ldr	r3, [r2, #76]
	str	r3, [r4, #296]
	ldr	r3, [r2, #148]
	str	r3, [r4, #300]
.L3101:
	ldr	r3, [r2, #108]
	ldr	r2, [r2, #100]
	ldr	r1, [r4, #2356]
	cmp	r3, r2
	movcc	r3, r2
	str	r3, [r1, #884]
	ldr	r2, [r8, #3776]
	ldr	r3, [r6, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	beq	.L3156
.L3102:
	ldrb	r3, [r6, #13]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r6, #1]
	cmp	r3, r7
	beq	.L3104
	ldrb	r3, [r6, #15]	@ zero_extendqisi2
	cmp	r3, r7
	beq	.L3105
	ldr	r10, [r6, #68]
	cmp	r10, r7
	ble	.L3110
	add	ip, r6, #174
	str	r4, [fp, #-80]
	str	r6, [fp, #-76]
	mov	r4, ip
	str	r5, [fp, #-84]
.L3109:
	ldr	r6, [r9, #240]
	add	r7, r7, #1
	mov	r1, r10
	mul	r0, r6, r7
	bl	__aeabi_uidiv
	mov	r1, r10
	mov	r5, r0
	sub	r0, r7, #1
	mul	r0, r0, r6
	bl	__aeabi_uidiv
	cmp	r7, r10
	rsb	r0, r0, r5
	strh	r0, [r4, #2]!	@ movhi
	bne	.L3109
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-80]
	ldr	r5, [fp, #-84]
.L3110:
	ldr	r10, [r6, #72]
	cmp	r10, #0
	ble	.L3111
	add	ip, r6, #214
	str	r4, [fp, #-80]
	mov	r7, #0
	str	r6, [fp, #-76]
	mov	r4, ip
	str	r5, [fp, #-84]
.L3112:
	ldr	r6, [r9, #244]
	add	r7, r7, #1
	mov	r1, r10
	mul	r0, r6, r7
	bl	__aeabi_uidiv
	mov	r1, r10
	mov	r5, r0
	sub	r0, r7, #1
	mul	r0, r6, r0
	bl	__aeabi_uidiv
	cmp	r7, r10
	rsb	r0, r0, r5
	strh	r0, [r4, #2]!	@ movhi
	bne	.L3112
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-80]
	ldr	r5, [fp, #-84]
	b	.L3111
.L3097:
	mov	r0, #0
.L3096:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3104:
	ldr	r3, [r9, #240]
	strh	r3, [r6, #176]	@ movhi
	ldr	r3, [r9, #244]
	strh	r3, [r6, #216]	@ movhi
.L3111:
	ldr	r0, [r4, #156]
	movw	r7, #2024
	ldr	r3, .L3159
	mov	r2, r7
	ldr	ip, [r4, #2352]
	mov	r1, r6
	mul	r0, r7, r0
	ldr	r3, [r3, #52]
	sub	r0, r0, #2016
	sub	r0, r0, #8
	add	r0, ip, r0
	blx	r3
	ldr	r2, [r4, #156]
	ldr	r3, [r4, #2352]
	mul	r7, r7, r2
	sub	r7, r7, #2016
	sub	r7, r7, #8
	add	r7, r3, r7
	str	r7, [r8, #3776]
.L3103:
	ldr	r3, [r4, #220]
	cmp	r3, #0
	bne	.L3118
	ldr	r3, [r9, #60]
	ldr	r2, [fp, #-72]
	ldr	r1, [fp, #-60]
	cmp	r1, r3
	cmpeq	r2, #0
	bne	.L3119
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L3119
	ldr	r3, [r9, #72]
	ldr	r2, [fp, #-48]
	cmp	r2, r3
	bne	.L3119
	ldr	r3, [r9, #76]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L3119
	ldr	r3, [r4, #2356]
	ldr	r2, [r3, #872]
	cmp	r2, #1
	bne	.L3121
.L3120:
	ldr	r3, [r3, #888]
	cmp	r3, #1
	beq	.L3157
.L3124:
	add	r3, r4, #86016
	ldr	r3, [r3, #1724]
	cmp	r3, #1
	beq	.L3158
.L3125:
	mov	r1, #1
	mov	r0, r4
	bl	HEVC_InitDPB
	cmn	r0, #2
	beq	.L3096
	cmp	r0, #0
	bne	.L3126
	ldr	r3, [r4, #2356]
.L3123:
	mov	r2, #0
	str	r2, [r3, #888]
.L3121:
	mov	r0, r4
	bl	HEVC_AllocFrameStore
	subs	r6, r0, #0
	bne	.L3127
	ldr	r3, [r4, #220]
.L3118:
	ldr	r0, [r5, #2072]
	mvn	r2, #0
	ldr	r1, [r5, #2048]
	mov	ip, #1
	str	r2, [r5, #1304]
	cmp	r3, #0
	str	r0, [r5, #1276]
	mov	r0, #0
	strb	ip, [r5, #1273]
	str	r1, [r5, #1280]
	ldr	r3, [r8, #3772]
	ldr	r2, [r3, #72]
	str	r2, [r5, #1288]
	ldr	r2, [r3, #76]
	str	r2, [r5, #1292]
	ldr	r1, [r3, #240]
	ldr	r2, [r3, #244]
	str	r0, [r5, #1300]
	mul	r2, r2, r1
	str	r2, [r5, #1296]
	bne	.L3128
	ldr	ip, [r4, #2356]
	add	r6, r4, #55040
	movw	r7, #55232
	mvn	r0, #0
	mvn	r1, #0
	ldrd	r2, [ip, #56]
	strd	r2, [r6, #184]
	ldrd	r2, [ip, #72]
	strd	r2, [r4, r7]
	ldrd	r2, [ip, #88]
	strd	r2, [r6, #200]
	ldr	r3, [ip, #104]
	str	r3, [r5, #1344]
	ldr	r3, [ip, #108]
	str	r3, [r5, #1348]
	ldr	r3, [ip, #112]
	str	r3, [r5, #1352]
	ldr	r3, [ip, #128]
	str	r3, [r5, #1356]
	strd	r0, [ip, #56]
	ldr	r3, [r8, #3772]
.L3128:
	ldr	r1, [r3, #72]
	add	r0, r4, #54528
	ldrb	r2, [r5, #1460]	@ zero_extendqisi2
	add	r0, r0, #56
	mov	r6, #0
	str	r1, [r5, #1464]
	ldr	r1, [r3, #76]
	str	r1, [r5, #1468]
	ldr	r1, [r3, #64]
	ldr	ip, [r3, #2660]
	subs	r1, r1, #1
	bfi	r2, ip, #5, #3
	movne	r1, #1
	bfi	r2, r1, #2, #3
	strb	r2, [r5, #1460]
	ldr	r1, [r3, #2644]
	and	r1, r1, #7
	bl	SetAspectRatio
	str	r6, [r5, #1448]
	ldr	r3, [r4, #220]
	cmp	r3, #1
	beq	.L3097
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #2048]
	str	r2, [r3, #12]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1460]
	str	r2, [r3, #204]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1448]
	str	r2, [r3, #192]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1340]
	str	r2, [r3, #84]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1336]
	str	r2, [r3, #80]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1464]
	str	r2, [r3, #208]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1468]
	str	r2, [r3, #212]
	ldr	r3, [r5, #1332]
	ldr	r0, [r4, #276]
	ldr	r1, [r3, #32]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L3129
	ldr	r3, [r5, #1448]
	mov	r1, r6
	ldr	r2, [r0, #8]
	subs	r3, r3, r6
	ldr	r0, [r4, #276]
	movne	r3, #1
	bl	FSP_SetStoreType
.L3129:
	ldr	r3, [r8, #3772]
	mov	r4, #0
	ldr	lr, [r5, #1332]
	mov	r0, r4
	ldr	r2, [r3, #84]
	str	r2, [r5, #1676]
	ldr	r7, [r3, #88]
	str	r7, [r5, #1680]
	ldr	r1, [r3, #92]
	str	r1, [r5, #1684]
	ldr	r6, [r3, #96]
	str	r6, [r5, #1688]
	ldr	ip, [r3, #72]
	rsb	r2, r2, ip
	rsb	r2, r7, r2
	str	r2, [r5, #1472]
	ldr	ip, [r3, #76]
	rsb	r1, r1, ip
	rsb	r1, r6, r1
	str	r1, [r5, #1476]
	ldr	r1, [r3, #64]
	str	r1, [r5, #1532]
	ldr	r1, [r3, #100]
	str	r1, [r5, #1536]
	ldr	r3, [r3, #108]
	str	r3, [r5, #1540]
	ldr	r3, [lr, #224]
	str	r3, [r5, #1480]
	ldr	r3, [lr, #228]
	str	r3, [r5, #1484]
	str	r2, [lr, #216]
	ldr	r2, [r5, #1476]
	ldr	r3, [r5, #1332]
	str	r2, [r3, #220]
	ldr	r2, [r5, #1480]
	ldr	r3, [r5, #1332]
	str	r2, [r3, #224]
	ldr	r2, [r5, #1484]
	ldr	r3, [r5, #1332]
	str	r2, [r3, #228]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1536]
	str	r2, [r3, #280]
	ldr	r3, [r5, #1332]
	ldr	r2, [r5, #1540]
	str	r2, [r3, #284]
	str	r4, [r5, #1284]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3119:
	ldr	r3, [fp, #-72]
	mov	r0, r4
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	str	r3, [sp]
	ldr	r3, [fp, #-56]
	bl	HEVC_GetReRangeFlag
	ldr	r3, [r4, #2356]
	cmp	r0, #0
	bne	.L3120
	ldr	r2, [r3, #872]
	cmp	r2, #1
	bne	.L3123
	b	.L3120
.L3105:
	ldr	lr, [r6, #68]
	ldr	r3, [r9, #240]
	cmp	lr, #1
	add	r0, r6, lr, lsl #1
	strh	r3, [r0, #174]	@ movhi
	ble	.L3116
	add	lr, lr, #44
	add	r1, r6, #90
	add	ip, r6, #174
	add	lr, r6, lr, lsl #1
.L3115:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #174]
	rsb	r3, r2, r3
	strh	r3, [r0, #174]	@ movhi
	bne	.L3115
.L3116:
	ldr	lr, [r6, #72]
	ldr	r3, [r9, #244]
	cmp	lr, #1
	add	r0, r6, lr, lsl #1
	strh	r3, [r0, #214]	@ movhi
	ble	.L3111
	add	lr, lr, #64
	add	r1, r6, #130
	add	ip, r6, #214
	add	lr, r6, lr, lsl #1
.L3117:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #214]
	rsb	r3, r2, r3
	strh	r3, [r0, #214]	@ movhi
	bne	.L3117
	b	.L3111
.L3154:
	ldr	r0, [r4, #168]
	cmp	r0, #0
	bne	.L3099
	b	.L3098
.L3156:
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3102
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L3102
	ldr	r3, [r9, #72]
	ldr	r2, [fp, #-48]
	cmp	r2, r3
	bne	.L3102
	ldr	r3, [r9, #76]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L3102
	ldr	r3, [r9, #148]
	ldr	r2, [fp, #-56]
	cmp	r2, r3
	bne	.L3102
	b	.L3103
.L3155:
	ldrb	r1, [r3, r10]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3100
	ldr	r0, [r4, #168]
	cmp	r0, #0
	beq	.L3100
	ldr	r0, [r9, #72]
	ldr	ip, [fp, #-48]
	cmp	ip, r0
	bne	.L3100
	ldr	r0, [r9, #76]
	ldr	ip, [fp, #-52]
	cmp	ip, r0
	bne	.L3100
	ldr	r0, [r9, #148]
	ldr	ip, [fp, #-56]
	cmp	ip, r0
	streq	r1, [fp, #-72]
	bne	.L3100
	b	.L3101
.L3127:
	ldr	r1, .L3159+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r6
	b	.L3096
.L3158:
	mov	r0, r4
	bl	HEVC_GetBackPicFromVOQueue
	b	.L3125
.L3157:
	ldr	ip, [r9, #108]
	mov	r0, #31
	ldr	r1, [fp, #-68]
	ldr	r3, [r9, #100]
	ldr	r2, [fp, #-64]
	str	r1, [sp]
	str	ip, [sp, #4]
	ldr	r1, .L3159+8
	bl	dprint_vfmw
	b	.L3124
.L3126:
	mov	r2, r0
	ldr	r1, .L3159+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3096
.L3160:
	.align	2
.L3159:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC426
	.word	.LC424
	.word	.LC425
	UNWIND(.fnend)
	.size	HEVC_InitPic, .-HEVC_InitPic
	.align	2
	.global	HEVC_OutputFrmToVO
	.type	HEVC_OutputFrmToVO, %function
HEVC_OutputFrmToVO:
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
	mov	r4, r0
	mov	r5, r1
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L3169
	cmn	r6, #3
	moveq	r0, #0
	bne	.L3170
.L3164:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3169:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3171
	add	r3, r4, #62464
	ldr	r0, [r4, #276]
	add	r3, r3, #248
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3172
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	strcc	r6, [r7, #24]
	bcs	.L3173
.L3167:
	ldr	r2, [r4, #316]
	mov	r0, #0
	ldr	r3, [r4, #308]
	add	r2, r2, #1
	str	r2, [r4, #316]
	add	r3, r3, #1
	str	r3, [r4, #308]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3173:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.5
	b	.L3167
.L3170:
	mov	r3, r6
	movw	r2, #9699
	ldr	r1, .L3174
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #260]
	mov	r0, r4
	bl	HEVC_DECRecycleImage
	mvn	r0, #0
	b	.L3164
.L3172:
	mov	r2, r0
	ldr	r1, .L3174+4
	mov	r0, r6
	bl	dprint_vfmw
	mov	r2, r6
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3164
.L3171:
	ldr	r2, .L3174+8
	ldr	r1, .L3174+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3164
.L3175:
	.align	2
.L3174:
	.word	.LC429
	.word	.LC428
	.word	.LANCHOR1+584
	.word	.LC427
	UNWIND(.fnend)
	.size	HEVC_OutputFrmToVO, .-HEVC_OutputFrmToVO
	.align	2
	.global	HEVC_DirectOutput
	.type	HEVC_DirectOutput, %function
HEVC_DirectOutput:
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
	add	r6, r0, #53248
	mov	ip, #2
	mov	r5, #0
	mov	r3, #1
	ldr	r4, [r6, #1332]
	add	r1, r6, #1328
	mov	r7, r0
	mov	r2, #664
	add	r0, r4, #80
	add	r1, r1, #8
	str	ip, [r4, #4]
	strb	r3, [r4, #2]
	strb	r5, [r4, #1]
	ldr	r3, [r6, #1284]
	str	r3, [r4, #16]
	ldr	r3, [r6, #1312]
	str	r3, [r4, #20]
	bl	memcpy
	str	r5, [r4, #48]
	ldr	r3, [r6, #1312]
	mov	r2, r5
	ldr	r1, [r4, #32]
	str	r3, [r4, #40]
	ldr	r0, [r7, #276]
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r7
	bl	HEVC_OutputFrmToVO
	ldr	r3, .L3177
	str	r5, [r4, #4]
	mov	r1, r5
	mov	r2, #728
	ldr	r3, [r3, #48]
	mov	r6, r0
	add	r0, r7, #54272
	add	r0, r0, #248
	blx	r3
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3178:
	.align	2
.L3177:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_DirectOutput, .-HEVC_DirectOutput
	.align	2
	.global	HEVC_IModeProcess
	.type	HEVC_IModeProcess, %function
HEVC_IModeProcess:
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
	bl	HEVC_DirectOutput
	add	r2, r4, #53248
	ldr	r1, [r4, #180]
	ldr	r3, [r2, #1308]
	cmp	r3, r1
	addne	r3, r3, #536
	movne	ip, #0
	addne	r4, r4, r3, lsl #2
	strne	ip, [r4, #4]
	strne	r1, [r2, #1308]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_IModeProcess, .-HEVC_IModeProcess
	.align	2
	.global	HEVC_OutputFrmFromDPB
	.type	HEVC_OutputFrmFromDPB, %function
HEVC_OutputFrmFromDPB:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	ip, [r0, #2540]
	mov	r4, r0
	cmp	ip, #0
	beq	.L3195
	add	r1, r0, #2544
	mov	r7, #0
	add	r1, r1, #12
	mov	r3, r7
.L3184:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3183
	ldr	r0, [r2, #12]
	ldr	r2, [r4, #244]
	cmp	r0, r2
	addgt	r7, r7, #1
.L3183:
	cmp	r3, ip
	bne	.L3184
.L3182:
	ldr	r3, [r4, #228]
	cmp	r3, #1
	beq	.L3207
	add	r9, r4, #53248
	add	r2, r4, #24576
	ldr	r1, [r9, #2068]
	ldr	r3, [r2, #3772]
	add	r3, r3, r1, lsl #2
	ldr	r8, [r3, #412]
.L3186:
	cmp	ip, #0
	beq	.L3196
	add	r6, r4, #2544
	add	r9, r4, #53248
	add	r6, r6, #12
	mov	r5, #0
	str	r5, [fp, #-48]
.L3193:
	ldr	r1, [r6, #4]!
	mov	r2, r5
	ldr	ip, [r4, #244]
	mov	r0, #22
	ldrb	r10, [r4, #2]	@ zero_extendqisi2
	ldr	lr, [r9, #2048]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	str	r8, [sp, #12]
	str	r7, [sp, #8]
	str	r10, [sp, #20]
	str	lr, [sp, #16]
	str	ip, [sp, #4]
	ldr	ip, [r1, #12]
	ldr	r1, .L3209
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r1, [r6]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3188
	cmp	r7, r8
	ldr	r0, [r1, #12]
	ldr	r3, [r4, #244]
	movls	ip, #0
	movhi	ip, #1
	cmp	r0, r3
	movle	ip, #0
	cmp	ip, #0
	beq	.L3189
	ldr	ip, [r9, #2048]
	cmp	r0, ip
	blt	.L3190
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3190
.L3189:
	cmp	r3, #0
	bne	.L3191
	ldr	r0, [r1, #12]
	cmp	r0, #0
	bge	.L3191
	cmp	r2, #0
	beq	.L3208
.L3192:
	str	r0, [sp]
	mov	r0, #31
	ldr	r2, .L3209+4
	ldr	r1, .L3209+8
	bl	dprint_vfmw
.L3191:
	ldr	r3, [r4, #2540]
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L3193
.L3206:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3190:
	mov	r3, #1
	mov	r0, r4
	strb	r3, [r1, #2]
	sub	r7, r7, #1
	ldr	r1, [r6]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r6]
	ldr	r3, [r3, #12]
	str	r3, [r4, #244]
	str	r0, [fp, #-48]
	b	.L3191
.L3188:
	ldr	r3, [r4, #244]
	b	.L3189
.L3208:
	mov	r2, r3
	ldr	r0, [r4, #276]
	ldr	r1, [r1, #32]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	ldr	r3, [r4, #244]
	ldr	r0, [r2, #12]
	b	.L3192
.L3207:
	add	r3, r4, #24576
	mov	r8, #0
	ldr	r1, [r3, #3772]
	add	r3, r1, #408
	add	r1, r1, #440
.L3185:
	ldr	r2, [r3, #4]!
	cmp	r8, r2
	movcc	r8, r2
	cmp	r3, r1
	bne	.L3185
	b	.L3186
.L3195:
	mov	r7, ip
	b	.L3182
.L3196:
	str	ip, [fp, #-48]
	b	.L3206
.L3210:
	.align	2
.L3209:
	.word	.LC430
	.word	.LANCHOR1+604
	.word	.LC431
	UNWIND(.fnend)
	.size	HEVC_OutputFrmFromDPB, .-HEVC_OutputFrmFromDPB
	.align	2
	.global	HEVC_OutputOneFrmFromDPB
	.type	HEVC_OutputOneFrmFromDPB, %function
HEVC_OutputOneFrmFromDPB:
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
	add	r4, r0, r1, lsl #2
	mov	r2, #1
	mov	r6, r1
	mov	r5, r0
	ldr	r3, [r4, #2560]
	strb	r2, [r3, #2]
	ldr	r1, [r4, #2560]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r4, #2560]
	ldr	r2, [r3, #12]
	str	r2, [r5, #244]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L3212
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
.L3212:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_OutputOneFrmFromDPB, .-HEVC_OutputOneFrmFromDPB
	.align	2
	.global	HEVC_OutputUnRefPicWithMinPoc
	.type	HEVC_OutputUnRefPicWithMinPoc, %function
HEVC_OutputUnRefPicWithMinPoc:
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
	sub	r1, fp, #24
	mov	r4, r0
	bl	HEVC_GetUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L3217
	mov	r0, r4
	ldr	r1, [fp, #-24]
	bl	HEVC_OutputOneFrmFromDPB
	cmp	r0, #0
	bne	.L3218
.L3215:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3217:
	ldr	r2, .L3219
	mov	r0, #1
	ldr	r1, .L3219+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3215
.L3218:
	ldr	r2, .L3219
	mov	r0, #1
	ldr	r1, .L3219+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3215
.L3220:
	.align	2
.L3219:
	.word	.LANCHOR1+628
	.word	.LC432
	.word	.LC433
	UNWIND(.fnend)
	.size	HEVC_OutputUnRefPicWithMinPoc, .-HEVC_OutputUnRefPicWithMinPoc
	.align	2
	.global	HEVC_FlushOutputFrmFromDPB
	.type	HEVC_FlushOutputFrmFromDPB, %function
HEVC_FlushOutputFrmFromDPB:
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
	subs	r4, r0, #0
	beq	.L3230
	ldr	r3, [r4, #2540]
	cmp	r3, #0
	addne	r5, r4, #2544
	movne	r6, #0
	addne	r5, r5, #12
	movne	r8, #1
	bne	.L3228
	b	.L3229
.L3236:
	strb	r8, [r3, #2]
	ldr	r1, [r5]
	bl	HEVC_OutputFrmToVO
	cmn	r0, #1
	mov	r9, r0
	beq	.L3235
.L3226:
	ldr	r3, [r4, #2540]
	cmp	r3, r6
	bls	.L3229
.L3228:
	ldr	r3, [r5, #4]!
	mov	r2, #0
	ldr	r0, [r4, #276]
	add	r6, r6, #1
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r3, [r5]
	mov	r0, r4
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3236
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #276]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L3226
	ldr	r3, [r5]
	ldr	r0, [r4, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #2540]
	cmp	r3, r6
	bhi	.L3228
.L3229:
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #244]
	mov	r9, #0
	bl	Hevc_InitDecBuffers
.L3222:
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3235:
	mov	r0, r7
	ldr	r2, .L3237
	ldr	r1, .L3237+4
	bl	dprint_vfmw
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3230:
	mvn	r9, #0
	b	.L3222
.L3238:
	.align	2
.L3237:
	.word	.LANCHOR1+660
	.word	.LC434
	UNWIND(.fnend)
	.size	HEVC_FlushOutputFrmFromDPB, .-HEVC_FlushOutputFrmFromDPB
	.align	2
	.global	HEVC_ReceivePacket
	.type	HEVC_ReceivePacket, %function
HEVC_ReceivePacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	add	r5, r0, #86016
	mov	r3, #0
	mov	r4, r0
	str	r3, [r5, #1704]
	ldr	r6, [r0, #2364]
	cmp	r6, r3
	beq	.L3269
	ldrb	r3, [r1]	@ zero_extendqisi2
	str	r3, [r6, #40]
	ldr	r3, [r0, #2356]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3270
.L3246:
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3247
	ldr	r3, [r4, #2364]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bls	.L3248
	ldr	r0, [r3, #40]
	cmp	r0, #1
	beq	.L3247
.L3248:
	ldr	r0, [r1, #12]
	cmp	r0, #0
	ble	.L3249
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L3249
	ldr	ip, [r1, #8]
	cmp	ip, #0
	bne	.L3271
.L3249:
	mov	r2, #1
	str	r2, [r3, #40]
	ldr	r1, [r1, #16]
	ldr	r0, [r4, #276]
	bl	SM_ReleaseStreamSeg
.L3245:
	ldr	r3, [r4, #2364]
	ldr	r0, [r3, #40]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
.L3243:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3271:
	mov	lr, r2, asl #5
	mov	ip, #0
	sub	r2, lr, r2, asl #2
	add	r3, r3, r2
	str	r0, [r3, #44]
	ldr	r3, [r4, #2364]
	ldr	lr, [r1, #12]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #48]
	ldr	r3, [r4, #2364]
	ldr	lr, [r1, #8]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #52]
	ldr	r3, [r4, #2364]
	ldr	lr, [r1, #16]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #68]
	ldr	r3, [r4, #2364]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	ip, [r3, #60]
	ldr	r2, [r4, #2364]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	ldr	r3, [r4, #2356]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3250
	add	r3, r4, #53248
	ldr	r0, [r1, #12]
	ldr	r2, [r3, #1324]
	ldr	ip, [r3, #1328]
	add	r0, r0, r2
	str	r0, [r3, #1324]
	ldr	r2, [r1, #12]
	add	r2, r2, ip
	str	r2, [r3, #1328]
.L3250:
	mov	r0, r4
	bl	HEVC_CombinePacket
	mov	r3, #1
	str	r3, [r5, #1704]
	b	.L3245
.L3270:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	bne	.L3245
	b	.L3246
.L3269:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	ble	.L3241
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L3241
	ldr	r3, [r1, #8]
	str	r1, [fp, #-32]
	cmp	r3, #0
	beq	.L3241
	bl	HEVC_FindNaluArraySlot
	ldr	r1, [fp, #-32]
	cmn	r0, #1
	mov	r5, r0
	beq	.L3272
	add	r3, r4, #65536
	mov	r0, #100
	mov	r2, #1
	ldr	r3, [r3, #2876]
	mla	r0, r0, r5, r3
	str	r0, [r4, #2364]
	ldr	r3, [r1, #4]
	str	r3, [r0, #44]
	ldr	r3, [r4, #2364]
	ldr	r0, [r1, #12]
	str	r0, [r3, #48]
	ldr	r3, [r4, #2364]
	ldr	r0, [r1, #16]
	str	r0, [r3, #68]
	ldr	r3, [r4, #2364]
	ldr	r0, [r1, #8]
	str	r0, [r3, #52]
	ldr	r3, [r4, #2364]
	str	r6, [r3, #60]
	ldr	r3, [r4, #2364]
	str	r2, [r3, #8]
	ldr	r3, [r4, #2364]
	strb	r6, [r3, #1]
	ldr	r3, [r4, #2364]
	ldrb	r2, [r1]	@ zero_extendqisi2
	str	r2, [r3, #40]
	ldr	r3, [r4, #2356]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3244
	add	r3, r4, #53248
	ldr	r0, [r1, #12]
	ldr	r2, [r3, #1324]
	ldr	ip, [r3, #1328]
	add	r0, r0, r2
	str	r0, [r3, #1324]
	ldr	r2, [r1, #12]
	add	r2, r2, ip
	str	r2, [r3, #1328]
.L3244:
	ldr	r3, [r1, #20]
	str	r3, [r4, #216]
	b	.L3245
.L3247:
	ldr	r1, .L3273
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3243
.L3241:
	ldr	r1, .L3273+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3243
.L3272:
	ldr	r1, .L3273+8
	mov	r0, r6
	bl	dprint_vfmw
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	mov	r0, r5
	b	.L3243
.L3274:
	.align	2
.L3273:
	.word	.LC437
	.word	.LC436
	.word	.LC435
	UNWIND(.fnend)
	.size	HEVC_ReceivePacket, .-HEVC_ReceivePacket
	.align	2
	.global	HEVCDEC_GetImageBuffer
	.type	HEVCDEC_GetImageBuffer, %function
HEVCDEC_GetImageBuffer:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, [r0, #176]
	mov	r4, r0
	cmp	r3, #0
	beq	.L3278
	add	r3, r0, #53248
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3278
	add	r2, r0, #68608
	add	r0, r0, #83968
	add	r2, r2, #616
	add	r0, r0, #296
.L3284:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L3279
	cmp	r2, #0
	beq	.L3280
	ldr	lr, [r4, #2540]
	cmp	lr, #0
	beq	.L3280
	ldr	r1, [r4, #2560]
	cmp	r1, r2
	beq	.L3279
	add	r1, r4, #2560
	b	.L3281
.L3282:
	ldr	ip, [r1, #4]!
	cmp	ip, r2
	beq	.L3279
.L3281:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L3282
.L3280:
	ldr	r0, [r4, #276]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L3278
	cmn	r0, #1
	beq	.L3303
.L3302:
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3278:
	mov	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3279:
	add	r2, r2, #752
	cmp	r2, r0
	bne	.L3284
	add	r0, r4, #62464
	sub	r2, fp, #24
	sub	r1, fp, #28
	add	r0, r0, #248
	bl	GetQueueImgNum
	mov	r0, r4
	bl	HEVC_PrintFrameStoreState
	ldr	r1, .L3304
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r2, [r4, #176]
	ldr	r0, [r4, #2540]
	ldr	r3, [fp, #-28]
	sub	r2, r2, #2
	ldr	r1, [fp, #-24]
	rsb	r2, r0, r2
	add	r0, r3, r1
	cmp	r0, r2
	bge	.L3302
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L3304+4
	ldr	r1, .L3304+8
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3303:
	add	r1, r4, #62464
	ldr	r0, [r4, #276]
	add	r1, r1, #248
	bl	FSP_ClearNotInVoQueue
	b	.L3302
.L3305:
	.align	2
.L3304:
	.word	.LC438
	.word	.LANCHOR1+688
	.word	.LC439
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageBuffer, .-HEVCDEC_GetImageBuffer
	.align	2
	.global	HEVC_FlushDPB
	.type	HEVC_FlushDPB, %function
HEVC_FlushDPB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r3, [r0, #2540]
	mov	r4, r0
	cmp	r3, #0
	beq	.L3308
	add	r6, r0, #2544
	mov	r5, #0
	add	r6, r6, #12
	mov	r7, r5
	b	.L3310
.L3309:
	ldr	r3, [r4, #2540]
	cmp	r3, r5
	bls	.L3308
.L3310:
	ldr	r3, [r6, #4]!
	add	r5, r5, #1
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3309
	strb	r7, [r3, #1]
	mov	r2, #0
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetRef
	ldr	r3, [r4, #2540]
	cmp	r3, r5
	bhi	.L3310
.L3308:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L3312
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3308
	b	.L3312
.L3314:
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	beq	.L3313
.L3312:
	ldr	r3, [r4, #2540]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L3314
	mov	r0, r3
.L3313:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_FlushDPB, .-HEVC_FlushDPB
	.align	2
	.global	HEVC_ClearDPB
	.type	HEVC_ClearDPB, %function
HEVC_ClearDPB:
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
	bl	HEVC_FlushDPB
	subs	r3, r0, #0
	beq	.L3323
	ldr	r2, .L3327
	mov	r0, #0
	ldr	r1, .L3327+4
	bl	dprint_vfmw
.L3323:
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3328:
	.align	2
.L3327:
	.word	.LANCHOR1+712
	.word	.LC440
	UNWIND(.fnend)
	.size	HEVC_ClearDPB, .-HEVC_ClearDPB
	.align	2
	.global	HEVC_RecoverDPBProcess
	.type	HEVC_RecoverDPBProcess, %function
HEVC_RecoverDPBProcess:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	mov	r4, r0
	b	.L3330
.L3332:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L3338
.L3330:
	ldr	ip, [r4, #2540]
	mov	r0, #13
	ldr	lr, [r4, #2536]
	ldr	r2, .L3339
	cmp	ip, lr
	ldr	r1, .L3339+4
	mov	r3, ip
	bcs	.L3332
	b	.L3334
.L3335:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_OutputUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L3333
	ldr	ip, [r4, #2540]
	ldr	lr, [r4, #2536]
.L3334:
	cmp	ip, lr
	mov	r3, ip
	ldr	r2, .L3339
	mov	r0, #1
	ldr	r1, .L3339+8
	bcs	.L3335
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3338:
	ldr	r2, .L3339
	mov	r0, #1
	ldr	r1, .L3339+12
	bl	dprint_vfmw
	ldr	ip, [r4, #2540]
	ldr	lr, [r4, #2536]
	b	.L3334
.L3333:
	ldr	r2, .L3339
	mov	r0, #1
	ldr	r1, .L3339+16
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	mov	r0, r4
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	HEVC_ClearDPB
.L3340:
	.align	2
.L3339:
	.word	.LANCHOR1+728
	.word	.LC441
	.word	.LC443
	.word	.LC442
	.word	.LC433
	UNWIND(.fnend)
	.size	HEVC_RecoverDPBProcess, .-HEVC_RecoverDPBProcess
	.align	2
	.global	HEVC_InsertFrmInDPB
	.type	HEVC_InsertFrmInDPB, %function
HEVC_InsertFrmInDPB:
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
	cmp	r1, #16
	mov	r7, r1
	mov	r6, r0
	mov	r4, r2
	bhi	.L3345
	ldr	r3, [r2, #60]
	add	r5, r0, r1, lsl #2
	mov	r1, #1
	mov	r2, r1
	str	r3, [r5, #2560]
	str	r1, [r3, #4]
	ldr	r3, [r5, #2560]
	ldr	r0, [r0, #276]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r0, [r5, #2560]
	mov	r2, #664
	adds	r3, r3, #0
	add	r1, r4, #64
	movne	r3, #1
	strb	r3, [r0, #1]
	ldr	r3, [r5, #2560]
	ldr	r0, [r4, #36]
	str	r0, [r3, #24]
	ldr	r0, [r5, #2560]
	add	r0, r0, #80
	bl	memcpy
	ldr	ip, [r5, #2560]
	ldr	lr, [r4, #40]
	add	r1, r7, #1
	ldr	r3, .L3347
	mov	r2, #4
	add	r0, r6, #2560
	str	lr, [ip, #40]
	str	lr, [ip, #20]
	ldr	ip, [r5, #2560]
	ldr	lr, [r4, #60]
	str	lr, [ip, #72]
	ldr	ip, [r5, #2560]
	ldr	lr, [r4, #12]
	str	lr, [ip, #44]
	str	lr, [ip, #16]
	ldr	ip, [r5, #2560]
	ldr	lr, [r4, #8]
	str	lr, [ip, #12]
	ldr	ip, [r5, #2560]
	ldr	lr, [r4, #8]
	str	lr, [ip, #36]
	bl	qsort
	ldr	r3, [r6, #2540]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r6, #2540]
	ldr	r1, [r4, #60]
	bl	HEVC_GetAPC
	subs	r3, r0, #0
	bne	.L3346
	mov	r0, r3
	strb	r3, [r4, #1]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3345:
	mov	r3, r1
	ldr	r2, .L3347+4
	ldr	r1, .L3347+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3346:
	ldr	r2, .L3347+4
	mov	r0, #0
	ldr	r1, .L3347+12
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_PrintDPBState
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3348:
	.align	2
.L3347:
	.word	compare_pic_by_poc_asc
	.word	.LANCHOR1+752
	.word	.LC444
	.word	.LC445
	UNWIND(.fnend)
	.size	HEVC_InsertFrmInDPB, .-HEVC_InsertFrmInDPB
	.align	2
	.global	HEVC_SimpleDPBProcess
	.type	HEVC_SimpleDPBProcess, %function
HEVC_SimpleDPBProcess:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	add	r4, r0, #53248
	mov	r5, r0
	ldrb	r3, [r4, #1272]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3362
	ldr	r3, [r4, #1332]
	mov	r2, #2
	str	r2, [r3, #4]
.L3351:
	ldr	r3, [r4, #1332]
	mov	r2, #1
	mov	r0, r5
	strb	r2, [r3, #2]
	ldr	r1, [r4, #1332]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r4, r0
	beq	.L3363
	cmn	r0, #3
	beq	.L3355
	mov	r0, r5
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3364
.L3355:
	mov	r0, #0
.L3352:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3362:
	bl	HEVC_SimpleSlideDPB
	add	r2, r5, #54272
	add	r2, r2, #248
	ldr	r1, [r5, #2540]
	mov	r0, r5
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	beq	.L3351
	str	r0, [sp]
	movw	r3, #8812
	ldr	r2, .L3365
	mov	r0, #0
	ldr	r1, .L3365+4
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L3352
.L3364:
	ldr	r2, .L3365
	mov	r0, #0
	ldr	r1, .L3365+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3352
.L3363:
	ldr	r2, .L3365
	mov	r0, #0
	ldr	r1, .L3365+12
	bl	dprint_vfmw
	mov	r0, r4
	b	.L3352
.L3366:
	.align	2
.L3365:
	.word	.LANCHOR1+772
	.word	.LC446
	.word	.LC92
	.word	.LC447
	UNWIND(.fnend)
	.size	HEVC_SimpleDPBProcess, .-HEVC_SimpleDPBProcess
	.align	2
	.global	HEVC_DecOrderProcess
	.type	HEVC_DecOrderProcess, %function
HEVC_DecOrderProcess:
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
	ldr	r1, [r0, #2540]
	mov	r4, r0
	ldr	r3, [r0, #2536]
	cmp	r1, r3
	bcs	.L3379
.L3368:
	add	r2, r4, #54272
	mov	r0, r4
	add	r2, r2, #248
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L3380
	add	r3, r4, #53248
	mov	r0, r4
	ldr	r1, [r3, #1332]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r5, r0
	beq	.L3381
	cmn	r0, #3
	beq	.L3374
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3382
.L3374:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3379:
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3378
	ldr	r2, .L3383
	mov	r0, #0
	ldr	r1, .L3383+4
	bl	dprint_vfmw
.L3378:
	ldr	r1, [r4, #2540]
	b	.L3368
.L3380:
	ldr	r2, .L3383
	mov	r0, #0
	ldr	r1, .L3383+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3382:
	mov	r0, r6
	ldr	r2, .L3383
	ldr	r1, .L3383+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3381:
	mov	r0, r6
	ldr	r2, .L3383
	ldr	r1, .L3383+16
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3384:
	.align	2
.L3383:
	.word	.LANCHOR1+796
	.word	.LC448
	.word	.LC449
	.word	.LC92
	.word	.LC447
	UNWIND(.fnend)
	.size	HEVC_DecOrderProcess, .-HEVC_DecOrderProcess
	.align	2
	.global	HEVC_DispOrderProcess
	.type	HEVC_DispOrderProcess, %function
HEVC_DispOrderProcess:
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
	add	r3, r0, #61440
	mov	r4, r0
	ldr	r3, [r3, #1624]
	cmp	r3, #1
	beq	.L3386
	bl	HEVC_FirstFrameFastOut
	cmp	r0, #0
	bne	.L3403
.L3386:
	ldr	r1, [r4, #2540]
	ldr	r3, [r4, #2536]
	cmp	r1, r3
	bcs	.L3404
.L3388:
	add	r2, r4, #54272
	mov	r0, r4
	add	r2, r2, #248
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L3405
	ldr	r3, [r4, #2540]
	cmp	r3, #0
	bne	.L3391
.L3392:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3391:
	mov	r0, r4
	bl	HEVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3392
	ldr	r2, .L3406
	mov	r0, #1
	ldr	r1, .L3406+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3404:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3402
	ldr	r1, .L3406+8
	mov	r0, #0
	bl	dprint_vfmw
.L3402:
	ldr	r1, [r4, #2540]
	b	.L3388
.L3405:
	mov	r2, r0
	ldr	r1, .L3406+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3403:
	ldr	r2, .L3406
	mov	r0, #0
	ldr	r1, .L3406+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3407:
	.align	2
.L3406:
	.word	.LANCHOR1+820
	.word	.LC453
	.word	.LC451
	.word	.LC452
	.word	.LC450
	UNWIND(.fnend)
	.size	HEVC_DispOrderProcess, .-HEVC_DispOrderProcess
	.align	2
	.global	HEVC_StorePicInDPB
	.type	HEVC_StorePicInDPB, %function
HEVC_StorePicInDPB:
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
	ldr	r3, .L3451
	mov	r4, r0
	ldr	r2, [r0, #276]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L3442
.L3409:
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #596]
	cmp	r3, #1
	beq	.L3443
	add	r5, r4, #53248
	mov	r3, #0
	str	r3, [r5, #1432]
	str	r3, [r5, #1436]
.L3412:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	ldrb	r6, [r5, #1273]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L3444
	ldr	r3, [r4, #2356]
	ldr	r2, [r5, #1312]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L3445
	ldr	r3, [r4, #2360]
	ldr	r2, [r5, #1332]
	add	r3, r3, #4096
	ldr	r3, [r3, #1236]
	str	r3, [r2, #744]
	ldr	r3, [r4, #2360]
	ldr	r2, [r5, #1332]
	add	r3, r3, #4096
	ldr	r3, [r3, #1240]
	str	r3, [r2, #748]
	ldr	r3, [r4, #280]
	cmp	r3, #2
	beq	.L3446
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	beq	.L3447
	cmp	r3, #1
	beq	.L3448
	cmp	r3, #0
	beq	.L3426
.L3427:
	mov	r0, r4
	mvn	r6, #0
	bl	HEVC_ClearCurrPic
	ldr	r2, .L3451+4
	ldr	r1, .L3451+8
	mov	r0, #1
	bl	dprint_vfmw
.L3425:
	mov	r3, #0
	mov	r0, r6
	strb	r3, [r5, #1273]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3443:
	ldr	r2, .L3451+12
	add	r5, r4, #53248
	ldr	r2, [r2]
	add	r2, r2, #4096
	ldr	r0, [r2, #84]
	ldr	r1, [r2, #88]
	str	r3, [r5, #1432]
	cmp	r1, #0
	moveq	r1, #1
	bl	__aeabi_uidiv
	str	r0, [r5, #1436]
	b	.L3412
.L3442:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L3409
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L3409
	add	r3, r0, #24576
	ldrb	r3, [r3, #3760]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3409
	bl	HEVC_Sei_Get_Frame_Pts
	b	.L3409
.L3444:
	ldr	r2, .L3451+4
	mov	r0, #1
	ldr	r1, .L3451+16
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3447:
	mov	r0, r4
	bl	HEVC_SimpleDPBProcess
	subs	r6, r0, #0
	bne	.L3449
.L3421:
	movw	r3, #9141
	mov	r2, r6
	ldr	r1, .L3451+20
	mov	r0, #14
	bl	dprint_vfmw
.L3419:
	cmn	r6, #1
	bne	.L3425
	b	.L3427
.L3445:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, [r4, #2356]
	ldr	r2, [r5, #1312]
	mov	r0, #1
	ldr	r1, .L3451+24
	ldr	r3, [r3, #4]
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3448:
	mov	r0, r4
	bl	HEVC_DecOrderProcess
	subs	r6, r0, #0
	beq	.L3423
	ldr	r2, .L3451+4
	mov	r0, #0
	ldr	r1, .L3451+28
	bl	dprint_vfmw
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3419
.L3426:
	mov	r0, r4
	bl	HEVC_DispOrderProcess
	subs	r6, r0, #0
	bne	.L3424
.L3428:
	mov	r6, #0
	b	.L3425
.L3446:
	mov	r0, r4
	bl	HEVC_DirectOutput
	ldr	r3, [r5, #1308]
	ldr	r2, [r4, #180]
	cmp	r3, r2
	addne	r3, r3, #536
	movne	r1, #0
	addne	r3, r4, r3, lsl #2
	strne	r1, [r3, #4]
	mov	r6, r0
	strne	r2, [r5, #1308]
	cmp	r0, #0
	bne	.L3450
.L3418:
	movw	r3, #9126
	mov	r2, r6
	ldr	r1, .L3451+20
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3419
.L3423:
	ldr	r3, [r4, #2356]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3428
	b	.L3426
.L3424:
	ldr	r2, .L3451+4
	mov	r0, #0
	ldr	r1, .L3451+32
	bl	dprint_vfmw
	b	.L3419
.L3450:
	ldr	r2, .L3451+4
	mov	r0, #0
	ldr	r1, .L3451+36
	bl	dprint_vfmw
	b	.L3418
.L3449:
	ldr	r2, .L3451+4
	mov	r0, #0
	ldr	r1, .L3451+40
	bl	dprint_vfmw
	b	.L3421
.L3452:
	.align	2
.L3451:
	.word	s_pstVfmwChan
	.word	.LANCHOR1+844
	.word	.LC461
	.word	g_HwMem
	.word	.LC454
	.word	.LC457
	.word	.LC455
	.word	.LC459
	.word	.LC460
	.word	.LC456
	.word	.LC458
	UNWIND(.fnend)
	.size	HEVC_StorePicInDPB, .-HEVC_StorePicInDPB
	.align	2
	.global	HEVC_CreateLostPicture
	.type	HEVC_CreateLostPicture, %function
HEVC_CreateLostPicture:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 728
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #728)
	sub	sp, sp, #728
	add	r4, r0, #68608
	add	r4, r4, #616
	mov	r5, r0
	mov	r6, r1
	mov	r7, #0
.L3458:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bne	.L3454
	cmp	r4, #0
	beq	.L3455
	ldr	r3, [r5, #2540]
	cmp	r3, #0
	beq	.L3455
	ldr	r1, [r5, #2560]
	cmp	r4, r1
	beq	.L3454
	add	ip, r5, #2560
	b	.L3456
.L3457:
	ldr	lr, [ip, #4]!
	cmp	lr, r4
	beq	.L3454
.L3456:
	add	r2, r2, #1
	cmp	r2, r3
	bne	.L3457
.L3455:
	mov	r8, #752
	mov	r2, #664
	mla	r8, r8, r7, r5
	sub	r0, fp, #700
	mov	r9, #1
	mov	r3, #101
	str	r6, [fp, #-756]
	add	r8, r8, #68608
	str	r3, [fp, #-724]
	add	r1, r8, #696
	strb	r9, [fp, #-763]
	strb	r9, [fp, #-764]
	bl	memcpy
	cmp	r7, #19
	strb	r9, [r8, #618]
	mov	r7, #0
	strb	r9, [r8, #616]
	str	r4, [fp, #-704]
	str	r7, [r8, #624]
	str	r7, [fp, #-516]
	bgt	.L3459
	ldr	r0, [r5, #2540]
	cmp	r0, #0
	beq	.L3461
	add	r1, r5, #2544
	mov	ip, r7
	add	r1, r1, #12
	mvn	r2, #-2147483648
	mov	r8, r1
.L3464:
	ldr	lr, [r8, #4]!
	add	ip, ip, #1
	ldr	r3, [lr, #12]
	rsb	r3, r6, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bge	.L3463
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	r2, r3
	movne	r7, #1
.L3463:
	cmp	ip, r0
	bne	.L3464
	cmp	r7, #0
	beq	.L3461
	mov	r4, #0
	b	.L3465
.L3466:
	add	r4, r4, #1
	cmp	r4, r0
	beq	.L3467
.L3465:
	ldr	ip, [r1, #4]!
	ldr	r3, [ip, #12]
	rsb	r3, r6, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bne	.L3466
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3466
	ldr	r1, [ip, #32]
	add	r4, r4, #640
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	ldr	r2, [r5, r4, asl #2]
	mov	r3, r6
	ldr	r1, .L3498
	ldr	r2, [r2, #12]
	mov	r7, r0
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r7, #0
	beq	.L3467
	ldr	r0, [r7, #680]
	cmp	r0, #0
	beq	.L3496
	mov	r1, #0
	ldr	r0, [r5, #276]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r5, #276]
	bl	FSP_GetLogicFs
	mvn	r2, r8
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3470
	ldr	r1, [fp, #-704]
	sub	r2, fp, #764
	mov	r0, r5
	str	r8, [r1, #32]
	ldr	r1, [r7, #680]
	str	r1, [r3, #680]
	ldr	r1, [r7, #684]
	str	r1, [r3, #684]
	ldr	r1, [r7, #688]
	str	r1, [r3, #688]
	ldrsb	r3, [r7, #4]
	ldr	r1, [r5, #2540]
	str	r3, [fp, #-728]
	bl	HEVC_InsertFrmInDPB
	subs	r4, r0, #0
	bne	.L3497
	ldr	r0, [r5, #276]
	mov	r1, r8
	mov	r2, r4
	bl	FSP_SetDisplay
	ldr	r3, [r5, #200]
	mov	r0, r4
	cmn	r3, #-2147483647
	streq	r6, [r5, #200]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3454:
	add	r7, r7, #1
	add	r4, r4, #752
	cmp	r7, #20
	bne	.L3458
.L3459:
	ldr	r1, .L3498+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L3491:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3467:
	ldr	r1, .L3498+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3470:
	ldr	r3, [fp, #-704]
	mov	r0, r2
	ldr	r1, .L3498+12
	strb	r2, [r3]
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L3491
.L3497:
	ldr	r3, [fp, #-704]
	mov	r1, r8
	mov	r4, #0
	mov	r2, #1
	strb	r4, [r3]
	ldr	r0, [r5, #276]
	bl	FSP_ClearLogicFs
	mov	r0, r4
	ldr	r1, .L3498+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3491
.L3461:
	mov	r0, #0
	ldr	r1, .L3498+20
	strb	r0, [r4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3491
.L3496:
	ldr	r1, .L3498+24
	bl	dprint_vfmw
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #3
	b	.L3491
.L3499:
	.align	2
.L3498:
	.word	.LC465
	.word	.LC462
	.word	.LC463
	.word	.LC467
	.word	.LC468
	.word	.LC464
	.word	.LC466
	UNWIND(.fnend)
	.size	HEVC_CreateLostPicture, .-HEVC_CreateLostPicture
	.align	2
	.global	HEVC_RefPicProcess
	.type	HEVC_RefPicProcess, %function
HEVC_RefPicProcess:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r4, r0
	bl	HEVC_RemoveDummyFrame
	mov	r0, r4
	bl	HEVC_ApplyReferencePictureSet
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	b	.L3501
.L3504:
	ldr	r2, [fp, #-24]
	bl	dprint_vfmw
	ldr	r3, [r4, #2356]
	mov	r0, r4
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L3502
	ldr	r1, [fp, #-24]
	bl	HEVC_CreateLostPicture
	cmp	r0, #0
	bne	.L3507
.L3501:
	sub	r1, fp, #24
	mov	r0, r4
	bl	HEVC_CheckThatAllRefPicsAreAvailable
	ldr	r1, .L3508
	cmp	r0, #0
	mov	r0, #1
	beq	.L3504
	mov	r0, r4
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	mov	r0, r4
	bl	HEVC_RecoverDPBProcess
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3502:
	ldr	ip, [fp, #-24]
	add	r4, r4, #53248
	ldr	r1, .L3508+4
	mov	r0, #1
	ldr	r3, [r4, #2048]
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3507:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3509:
	.align	2
.L3508:
	.word	.LC469
	.word	.LC470
	UNWIND(.fnend)
	.size	HEVC_RefPicProcess, .-HEVC_RefPicProcess
	.align	2
	.global	HEVC_DecSlice
	.type	HEVC_DecSlice, %function
HEVC_DecSlice:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r3, [r0, #2364]
	add	r5, r0, #53248
	ldr	r2, .L3573
	mov	ip, #0
	mov	r4, r0
	ldr	r1, [r3, #16]
	str	r1, [r5, #2072]
	ldr	r1, [r3, #32]
	str	r1, [r5, #2068]
	ldr	r1, [r0, #276]
	strb	ip, [r0, #1]
	ldr	r2, [r2, r1, asl #2]
	ldrsb	r1, [r2, #44]
	cmp	r1, #1
	beq	.L3561
.L3511:
	ldr	r3, [r5, #3588]
	cmp	r3, #1
	beq	.L3562
.L3512:
	ldr	r2, [r4, #208]
	ldr	r3, [r4, #144]
	cmp	r2, r3
	bcs	.L3563
	ldrb	r3, [r5, #1273]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3564
	mov	r0, r4
	bl	HEVC_PicTypeStatistic
	mov	r0, r4
	bl	HEVC_CalcStreamBits
	ldr	r3, [r5, #3588]
	cmp	r3, #2
	beq	.L3525
	ldr	r3, [r4, #220]
	cmp	r3, #0
	bne	.L3526
	ldrb	r3, [r5, #2003]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3565
.L3526:
	mov	r0, r4
	bl	HEVC_WriteSliceMsg
	cmp	r0, #0
	bne	.L3566
.L3529:
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L3567
.L3531:
	add	r4, r4, #4096
	mov	r0, #0
	ldr	r3, [r4, #476]
	str	r3, [r5, #1316]
	ldr	r3, [r4, #480]
	str	r3, [r5, #1320]
.L3517:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3567:
	ldr	r3, [r5, #2076]
	mov	r2, #1
	str	r3, [r4, #320]
	ldr	r3, [r5, #2048]
	str	r2, [r4, #168]
	str	r3, [r4, #284]
	b	.L3531
.L3562:
	ldr	r3, [r4, #220]
	cmp	r3, #0
	bne	.L3514
	ldr	r3, [r5, #2072]
	sub	r3, r3, #16
	cmp	r3, #4
	bls	.L3515
	mov	r0, r4
	bl	HEVC_IsPVRFlushPic
	cmp	r0, #0
	beq	.L3516
.L3515:
	mov	r0, r4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L3568
.L3516:
	ldrb	r6, [r4, #2]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3569
.L3518:
	ldr	r3, [r4, #2356]
	ldr	r2, [r3, #8]
	cmp	r2, #2
	beq	.L3514
	ldr	r3, [r3, #12]
	mov	r0, r4
	cmp	r3, #2
	beq	.L3570
	bl	HEVC_RefPicProcess
	cmp	r0, #0
	bne	.L3532
.L3514:
	mov	r0, r4
	bl	HEVC_InitPic
	cmn	r0, #2
	beq	.L3517
	cmp	r0, #0
	bne	.L3571
	ldr	r3, [r4, #252]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #252]
	bl	HEVC_SetScalingList
	mov	r0, r4
	bl	HEVC_WritePicMsg
	cmp	r0, #0
	beq	.L3512
	ldr	r1, .L3573+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3561:
	ldr	r1, [r2, #176]
	cmp	r1, ip
	bne	.L3511
	ldr	r2, [r2, #180]
	cmp	r2, #1
	bne	.L3511
	ldr	r1, [r3, #16]
	bl	HEVC_Get_Last_IDR_Frame_Info
	b	.L3511
.L3525:
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3529
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
	b	.L3529
.L3565:
	mov	r0, r4
	bl	HEVC_DecList
	cmp	r0, #0
	bne	.L3572
	mov	r0, r4
	bl	HEVC_IsRefListWrong
	cmp	r0, #0
	beq	.L3526
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r1, .L3573+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3569:
	ldr	r3, [r4, #2540]
	cmp	r3, #0
	beq	.L3518
	mov	r0, r4
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L3518
	mov	r0, r6
	ldr	r2, .L3573+12
	ldr	r1, .L3573+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3532:
	mvn	r0, #0
	b	.L3517
.L3570:
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	b	.L3514
.L3564:
	ldr	r1, .L3573+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3563:
	ldr	r1, .L3573+24
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #208]
	ldr	r2, [r4, #144]
	cmp	r3, r2
	bcc	.L3523
	ldr	r1, .L3573+28
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L3523
	str	r3, [fp, #-36]
	mov	r1, #108
	str	r2, [fp, #-32]
	mov	r3, #8
	sub	r2, fp, #36
	ldr	r0, [r4, #276]
	blx	ip
.L3523:
	ldr	r1, .L3573+32
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3517
.L3566:
	ldr	r1, .L3573+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3571:
	ldr	r1, .L3573+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3572:
	mov	r2, r0
	ldr	r1, .L3573+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3568:
	ldr	r2, .L3573+12
	mov	r0, #1
	ldr	r1, .L3573+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3517
.L3574:
	.align	2
.L3573:
	.word	s_pstVfmwChan
	.word	.LC474
	.word	.LC479
	.word	.LANCHOR1+864
	.word	.LC472
	.word	.LC477
	.word	.LC475
	.word	g_event_report
	.word	.LC476
	.word	.LC480
	.word	.LC473
	.word	.LC478
	.word	.LC471
	UNWIND(.fnend)
	.size	HEVC_DecSlice, .-HEVC_DecSlice
	.align	2
	.global	HEVCDEC_VDMPostProc
	.type	HEVCDEC_VDMPostProc, %function
HEVCDEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	ip, r0, #53248
	mov	r4, r0
	mov	r5, r3
	ldr	r2, [fp, #8]
	str	r1, [ip, #1312]
	ldr	r0, [r0, #240]
	ldr	r3, [fp, #4]
	cmp	r0, #1
	bls	.L3576
.L3579:
	ldr	r1, [ip, #1288]
	cmp	r1, #1920
	bhi	.L3594
.L3577:
	ldr	r0, [r4, #2356]
.L3580:
	ldr	r1, [r0, #624]
	cmp	r3, #0
	str	r1, [r4, #212]
	beq	.L3583
.L3597:
	ldr	r3, .L3598
	mov	r0, r2, asl #6
	sub	r2, r0, r2, asl #3
	add	r2, r2, r3
	ldr	r3, [r2, #4]
	cmp	r3, #3
	beq	.L3595
	cmp	r3, #1
	beq	.L3583
.L3586:
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_StorePicInDPB
	subs	r2, r0, #0
	bne	.L3596
	mov	r3, #1
	mov	r0, r2
	str	r3, [r4, #168]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3594:
	ldr	r0, [r4, #2356]
	ldr	r1, [r0, #8]
	cmp	r1, #2
	movne	r1, #0
	strne	r1, [r4, #212]
	beq	.L3580
	cmp	r3, #0
	bne	.L3597
.L3583:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	b	.L3586
.L3596:
	ldr	r1, .L3598+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3576:
	add	r0, r0, #1
	str	r0, [r4, #240]
	cmp	r0, #1
	bls	.L3577
	b	.L3579
.L3595:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3599:
	.align	2
.L3598:
	.word	g_VdmDrvParam+40
	.word	.LC481
	UNWIND(.fnend)
	.size	HEVCDEC_VDMPostProc, .-HEVCDEC_VDMPostProc
	.align	2
	.global	HEVC_DecVDM
	.type	HEVC_DecVDM, %function
HEVC_DecVDM:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	r3, [r0, #172]
	mov	r4, r0
	cmp	r3, #2
	bhi	.L3601
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3669
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3602
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
.L3602:
	ldr	r3, [r4, #256]
	cmp	r3, #524288
	bhi	.L3663
	ldr	r1, .L3669+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L3659:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3601:
	ldr	r3, [r0, #312]
	add	r5, r0, #53248
	ldr	r2, [r0, #316]
	add	r3, r3, #1
	ldr	r1, [r0, #2356]
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r0, #312]
	rsb	r3, r2, r3
	str	r3, [r1, #576]
	bl	HEVC_IsRefForCurrPic
	strb	r0, [r5, #1272]
	ldr	r6, [r4, #264]
	ldr	r2, [r4, #280]
	ubfx	r6, r6, #16, #3
	cmp	r6, r2
	beq	.L3605
	sub	r1, r2, #2
	cmp	r1, #1
	movhi	r1, #0
	movls	r1, #1
	cmp	r6, #2
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3605
	cmp	r6, #4
	cmpne	r6, #1
	bls	.L3664
.L3605:
	cmp	r6, #2
	str	r6, [r4, #280]
	beq	.L3607
	cmp	r6, #3
	beq	.L3608
	cmp	r6, #1
	beq	.L3665
	ldr	r3, [r4, #248]
	cmp	r3, #0
	beq	.L3629
	cmp	r6, #4
	beq	.L3666
.L3614:
	ldr	r2, [r5, #1284]
.L3615:
	cmp	r2, #2
	beq	.L3667
	cmp	r2, #1
	streqb	r2, [r4, #4]
.L3620:
	ldr	r2, [r4, #252]
	mov	r0, #2
	ldr	r1, .L3669+8
	sub	r2, r2, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #208]
	cmp	r3, #0
	beq	.L3668
	ldr	ip, [r5, #1300]
	add	r2, r4, #61440
	add	r0, r4, #65536
	clz	r1, ip
	mov	r1, r1, lsr #5
	str	r1, [r2, #2960]
	ldr	r1, [r5, #1304]
	str	r1, [r2, #2952]
	str	r3, [r0, #144]
	ldr	r3, [r4, #2356]
	ldr	r1, [r3, #592]
	str	r1, [r2, #2944]
	ldr	r3, [r3, #632]
	str	r3, [r2, #2948]
	ldr	r3, [r4, #252]
	cmp	r3, #0
	beq	.L3625
	add	r3, r4, #62976
	add	ip, ip, #1
	add	r3, r3, #92
	str	r3, [r4, #2360]
	ldr	r2, [r5, #1316]
	mov	r3, #0
	str	r2, [r0, #2864]
	ldr	r2, [r5, #1320]
	str	r2, [r0, #2868]
	str	ip, [r5, #1300]
	str	r3, [r0, #2860]
	ldr	r1, [r5, #1284]
	cmp	r1, r3
	bne	.L3625
	ldr	r2, [r0, #148]
	cmp	r2, r3
	beq	.L3630
.L3628:
	ldr	r3, [r2]
	ldr	r0, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3628
.L3627:
	ldr	r3, .L3669
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3625
	sub	r2, fp, #28
	ldr	r0, [r4, #276]
	mov	r3, #4
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	ip
.L3625:
	ldr	ip, [r5, #1328]
	mov	r0, #0
	ldr	r1, [r5, #1332]
	ldr	r3, [r5, #1324]
	str	ip, [r5, #1324]
	ldr	r2, [r1, #440]
	rsb	r3, ip, r3
	add	r2, r2, r3
	str	r2, [r1, #440]
	ldr	r2, [r5, #1696]
	add	r3, r3, r2
	str	r3, [r5, #1696]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3663:
	ldr	r1, .L3669+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3665:
	ldr	r3, [r5, #1284]
	cmp	r0, #0
	cmpeq	r3, #2
	beq	.L3611
.L3610:
	ldr	r3, [r4, #248]
	cmp	r3, #0
	bne	.L3614
.L3629:
	ldr	r3, .L3669
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3611
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
	b	.L3611
.L3664:
	mov	r3, r6
	ldr	r1, .L3669+16
	mov	r0, #1
	bl	dprint_vfmw
	str	r6, [r4, #280]
.L3608:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3607:
	ldr	r3, [r5, #1284]
	cmp	r3, #0
	beq	.L3610
	b	.L3611
.L3667:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3620
	ldr	r3, [r4, #2356]
	ldr	r6, [r3, #12]
	cmp	r6, #0
	bne	.L3620
	ldr	r3, .L3669+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3620
	mov	r3, r0
	ldr	r2, [r5, #1280]
	ldr	r1, .L3669+24
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3669
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3611
	mov	r3, r6
	mov	r2, r6
	mov	r1, #127
	ldr	r0, [r4, #276]
	blx	ip
.L3611:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3659
.L3666:
	ldr	r2, [r5, #1284]
	cmp	r2, #0
	moveq	r3, #2
	streqb	r3, [r4, #4]
	beq	.L3620
	b	.L3615
.L3668:
	ldr	r2, .L3669
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L3623
	mov	r2, r3
	mov	r1, #127
	ldr	r0, [r4, #276]
	blx	ip
.L3623:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r2, .L3669+28
	ldr	r1, .L3669+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3659
.L3630:
	mov	r1, r2
	b	.L3627
.L3670:
	.align	2
.L3669:
	.word	g_event_report
	.word	.LC483
	.word	.LC486
	.word	.LC482
	.word	.LC484
	.word	g_allow_B_before_P
	.word	.LC485
	.word	.LANCHOR1+880
	.word	.LC487
	UNWIND(.fnend)
	.size	HEVC_DecVDM, .-HEVC_DecVDM
	.align	2
	.global	HEVC_VES_Splitter
	.type	HEVC_VES_Splitter, %function
HEVC_VES_Splitter:
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
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r0, #2340]
	mov	r1, #16
	mov	r9, r2
	str	r3, [fp, #-56]
	mov	r7, #0
	str	r7, [fp, #-48]
	bl	BsGet
	mov	r1, #8
	add	r6, r4, #53248
	mov	r10, r0
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #24
	and	r8, r0, #31
	ldr	r0, [r4, #2340]
	bl	BsBack
	ldr	r2, [r6, #1600]
	cmp	r5, r7
	str	r7, [r6, #1588]
	str	r2, [fp, #-48]
	beq	.L3673
	cmp	r5, #1
	beq	.L3674
	mov	r2, r5
	ldr	r1, .L3828
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
.L3681:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3674:
	cmp	r9, #0
	bne	.L3694
	ldr	r3, [fp, #-56]
	movw	r2, #31745
	cmp	r10, r2
	cmpeq	r3, #1
	moveq	r0, #1
	movne	r0, #0
	cmp	r8, #25
	movne	r8, #0
	andeq	r8, r0, #1
	cmp	r8, #0
	bne	.L3820
	movw	r1, #32257
	cmp	r10, r1
	beq	.L3821
	cmp	r10, r2
	bne	.L3822
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3693
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2364]
	mov	r0, r8
	b	.L3681
.L3673:
	cmp	r9, #0
	bne	.L3675
	movw	r1, #31745
	cmp	r8, #25
	cmpeq	r10, r1
	moveq	r5, #1
	movne	r5, #0
	bne	.L3676
	ldr	r8, .L3828+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3677
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	ip
.L3677:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2364]
	subs	r5, r0, #0
	bne	.L3823
	ldr	r3, [r1, #48]
	sub	r2, r3, #2
	sub	r3, r3, #6
	cmp	r2, #1024
	str	r3, [r6, #1588]
	bls	.L3682
	ldr	r1, .L3828+8
	movw	r3, #775
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3683
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
.L3683:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3809
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3809:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3675:
	bic	r3, r10, #512
	movw	r2, #31745
	cmp	r3, r2
	beq	.L3824
.L3716:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3694:
	movw	r1, #31745
	cmp	r8, #25
	cmpeq	r10, r1
	moveq	r8, #1
	movne	r8, #0
	bne	.L3702
	ldr	r8, .L3828+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3703
	mov	r3, r7
	mov	r2, r7
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	ip
.L3703:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2364]
	subs	r5, r0, #0
	bne	.L3817
	ldr	r3, [r1, #48]
	sub	r2, r3, #2
	sub	r3, r3, #6
	cmp	r2, #1024
	str	r3, [r6, #1588]
	bls	.L3706
	ldr	r1, .L3828+8
	mov	r3, #940
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3707
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
.L3707:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3809
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L3681
.L3820:
	ldr	r8, .L3828+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3696
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	ip
.L3696:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2364]
	subs	r5, r0, #0
	beq	.L3812
.L3817:
	cmp	r1, #0
	beq	.L3707
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
	b	.L3707
.L3676:
	movw	r2, #32257
	cmp	r10, r2
	bne	.L3716
.L3691:
	ldr	r1, [r4, #2364]
.L3812:
	cmp	r1, #0
	beq	.L3693
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
	mov	r0, r5
	b	.L3681
.L3702:
	movw	r2, #32257
	cmp	r10, r2
	movne	r0, r5
	bne	.L3681
	ldr	r1, .L3828+12
	movw	r3, #1007
	ldr	r2, .L3828+16
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3809
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2364]
	mvn	r0, #0
	b	.L3681
.L3824:
	ldr	r1, .L3828+20
	movw	r3, #862
	ldr	r2, .L3828+16
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3809
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
	mvn	r0, #0
	b	.L3681
.L3693:
	mov	r0, #0
	b	.L3681
.L3823:
	cmp	r1, #0
	beq	.L3683
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
	b	.L3683
.L3822:
	mov	r1, #8
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	ldr	r0, [r4, #2340]
	ubfx	r5, r5, #1, #6
	bl	BsSkip
	cmp	r5, #49
	beq	.L3825
.L3701:
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3693
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2364]
	b	.L3681
.L3706:
	ldr	r0, [r1, #76]
	sub	r2, fp, #48
	ldr	r3, [r1, #48]
	ldr	r1, [r6, #1592]
	add	r3, r3, r0
	ldr	r0, [r4, #276]
	sub	r3, r3, #2
	bl	MetadataMapToSec
	subs	r7, r0, #0
	bne	.L3826
	ldr	r5, .L3828+24
	mov	r2, #4
	ldr	r1, .L3828+28
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2364]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #44]
	add	r0, r0, #4
	ldr	r2, [r6, #1588]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #1588]
	add	r3, r0, #4
	str	r3, [r6, #1588]
	ldr	r1, [r4, #2364]
	ldr	r2, [r1, #76]
	cmp	r2, #0
	beq	.L3709
	add	ip, r3, r2
	cmp	ip, #1024
	bls	.L3710
	add	r2, r0, #8
	ldr	r1, .L3828+8
	movw	r3, #965
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3711
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r7, [r4, #2364]
.L3711:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3712
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
.L3712:
	ldr	r0, [r4, #276]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movne	r3, #972
	beq	.L3809
.L3808:
	ldr	r2, .L3828+16
	mov	r0, #0
	ldr	r1, .L3828+32
	bl	dprint_vfmw
	b	.L3809
.L3682:
	ldr	r0, [r1, #76]
	sub	r2, fp, #48
	ldr	r3, [r1, #48]
	ldr	r1, [r6, #1592]
	add	r3, r3, r0
	ldr	r0, [r4, #276]
	sub	r3, r3, #2
	bl	MetadataMapToSec
	subs	r7, r0, #0
	bne	.L3827
	ldr	r5, .L3828+24
	mov	r2, #4
	ldr	r1, .L3828+28
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2364]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #44]
	add	r0, r0, #4
	ldr	r2, [r6, #1588]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #1588]
	add	r3, r0, #4
	str	r3, [r6, #1588]
	ldr	r1, [r4, #2364]
	ldr	r2, [r1, #76]
	cmp	r2, #0
	beq	.L3686
	add	ip, r3, r2
	cmp	ip, #1024
	bls	.L3687
	add	r2, r0, #8
	ldr	r1, .L3828+8
	mov	r3, #800
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3688
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r7, [r4, #2364]
.L3688:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3689
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
.L3689:
	ldr	r0, [r4, #276]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r3, #807
	beq	.L3809
	b	.L3808
.L3687:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #72]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2364]
	ldr	r2, [r6, #1588]
	ldr	r3, [r3, #76]
	add	r3, r3, r2
	str	r3, [r6, #1588]
.L3686:
	ldr	r0, [r4, #276]
	ldr	r7, .L3828+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L3690
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #276]
	ldr	r1, [r6, #1588]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #276]
.L3690:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	beq	.L3691
	movw	r3, #835
	b	.L3808
.L3710:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #72]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2364]
	ldr	r2, [r6, #1588]
	ldr	r3, [r3, #76]
	add	r3, r3, r2
	str	r3, [r6, #1588]
.L3709:
	ldr	r0, [r4, #276]
	ldr	r7, .L3828+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L3713
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #276]
	ldr	r1, [r6, #1588]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #276]
.L3713:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	movwne	r3, #995
	beq	.L3691
	b	.L3808
.L3821:
	ldr	r0, [r4, #2340]
	mov	r1, #16
	bl	BsSkip
	mov	r0, r5
	b	.L3681
.L3825:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	bne	.L3701
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsBack
	mov	r1, #32
	ldr	r0, [r4, #2340]
	bl	BsBack
	ldr	r0, [r4, #2340]
	mov	r1, #32
	bl	BsBack
	mov	r0, #2
	b	.L3681
.L3826:
	mov	r0, r5
	ldr	r2, .L3828+16
	ldr	r1, .L3828+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3681
.L3827:
	mov	r0, r5
	movw	r3, #787
	ldr	r2, .L3828+16
	ldr	r1, .L3828+44
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3681
.L3829:
	.align	2
.L3828:
	.word	.LC494
	.word	g_event_report
	.word	.LC488
	.word	.LC493
	.word	.LANCHOR1+892
	.word	.LC491
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR4+208
	.word	.LC490
	.word	vfmw_save_metadata_file
	.word	.LC492
	.word	.LC489
	UNWIND(.fnend)
	.size	HEVC_VES_Splitter, .-HEVC_VES_Splitter
	.align	2
	.global	HEVCDEC_CheckSedOnly
	.type	HEVCDEC_CheckSedOnly, %function
HEVCDEC_CheckSedOnly:
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
	ldr	r3, [r0, #216]
	mov	r5, #0
	mov	r4, r0
	str	r5, [r0, #220]
	cmp	r3, #2
	str	r5, [r0, #228]
	beq	.L3858
	cmp	r3, #1
	beq	.L3859
.L3843:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3859:
	ldr	r3, [r0, #224]
	cmp	r3, #1
	bne	.L3843
	str	r5, [r0, #224]
.L3857:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3858:
	ldr	r3, [r0, #212]
	cmp	r3, r5
	beq	.L3857
	ldr	r3, [r0, #224]
	cmp	r3, #1
	beq	.L3843
	ldr	r0, [r0, #276]
	bl	VCTRL_CheckFreshSeg
	cmp	r0, #0
	beq	.L3857
	ldr	r0, [r4, #276]
	bl	VCTRL_CheckFreshRaw
	cmp	r0, #0
	beq	.L3857
	ldr	r3, [r4, #2364]
	ldr	r0, [r4, #2340]
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2340]
	bl	BsSkip
	ldr	r0, [r4, #2340]
	bl	BsResidBits
	cmp	r0, #15
	ble	.L3857
	mov	r1, #1
	ldr	r0, [r4, #2340]
	bl	BsSkip
	mov	r1, #6
	ldr	r0, [r4, #2340]
	bl	BsGet
	mov	r1, #9
	mov	r6, r0
	ldr	r0, [r4, #2340]
	bl	BsSkip
	mov	r0, r6
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r7, r0
	beq	.L3860
	ldr	r3, [r4, #208]
	cmp	r3, #0
	beq	.L3857
	sub	r3, r6, #48
	sub	r6, r6, #32
	cmp	r6, #2
	cmphi	r3, #1
	bhi	.L3857
.L3839:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	bne	.L3857
	add	r2, r4, #53248
	mov	r3, #1
	mvn	r0, #0
	str	r3, [r4, #228]
	strb	r3, [r2, #1272]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3860:
	ldr	r0, [r4, #2340]
	bl	BsResidBits
	cmp	r0, #0
	movle	r0, r5
	ble	.L3836
	mov	r1, r7
	ldr	r0, [r4, #2340]
	bl	BsGet
.L3836:
	ldr	r3, [r4, #208]
	cmp	r3, #0
	beq	.L3837
	sub	r3, r6, #48
	sub	r6, r6, #32
	cmp	r6, #2
	cmphi	r3, #1
	movls	r3, #1
	movhi	r3, #0
	cmp	r0, #0
	moveq	r5, r3
	orrne	r5, r3, #1
	cmp	r5, #0
	bne	.L3839
.L3837:
	add	r3, r4, #53248
	mov	r5, #0
	mov	r2, #1
	str	r5, [r4, #224]
	str	r2, [r4, #220]
	mov	r0, r5
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	str	r3, [r4, #232]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_CheckSedOnly, .-HEVCDEC_CheckSedOnly
	.align	2
	.global	HEVCDEC_SetDecParam
	.type	HEVCDEC_SetDecParam, %function
HEVCDEC_SetDecParam:
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
	ldr	r5, [r0, #224]
	mov	r4, r0
	cmp	r5, #1
	beq	.L3874
.L3862:
	mov	r0, r4
	bl	HEVCDEC_IsNeedSedOnly
	cmp	r0, #1
	beq	.L3875
	ldr	r3, [r4, #220]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	ip, [r4, #232]
	add	r3, r4, #53248
	ldr	r0, [r4, #208]
	ldr	r1, [r4, #172]
	ldr	r2, [r4, #248]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r0, [r4, #208]
	str	r1, [r4, #172]
	sub	r2, r2, #1
	str	r2, [r4, #248]
	strb	ip, [r3, #1273]
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3874:
	ldr	r3, [r0, #208]
	cmp	r3, #0
	beq	.L3862
	ldr	r6, [r0, #2360]
	cmp	r6, #0
	bne	.L3862
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3876
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r6, [r4, #2364]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3875:
	add	r2, r4, #65536
	add	lr, r4, #61440
	add	r3, r4, #62976
	mov	ip, #0
	str	r0, [r2, #2860]
	add	r3, r3, #92
	ldr	r1, [r4, #208]
	str	r1, [r4, #236]
	str	r1, [r2, #144]
	ldr	r2, [r4, #2356]
	ldr	r2, [r2, #632]
	str	r2, [lr, #2948]
	str	r3, [r4, #2360]
	str	ip, [r4, #224]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3876:
	add	r3, r4, #53248
	str	r5, [r4, #228]
	strb	r5, [r3, #1272]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_SetDecParam, .-HEVCDEC_SetDecParam
	.align	2
	.global	HEVC_DecOneNal
	.type	HEVC_DecOneNal, %function
HEVC_DecOneNal:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r4, r0
	ldr	r0, [r0, #2364]
	ldr	r3, [r0, #8]
	cmp	r3, #0
	ldrne	r1, [r4, #256]
	movne	r2, r0
	movne	r3, #0
	beq	.L3882
.L3881:
	ldr	ip, [r2, #48]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, ip
	str	r1, [r4, #256]
	ldr	ip, [r0, #8]
	cmp	ip, r3
	bhi	.L3881
.L3882:
	mov	r3, #0
	strb	r3, [r0, #1]
	ldr	r3, [r4, #2364]
	ldr	r2, [r3, #16]
	sub	r2, r2, #36
	cmp	r2, #1
	bls	.L4024
.L3880:
	ldr	r2, [r3, #4]
	add	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r1, [r4, #2364]
	ldr	r2, [r1, #16]
	cmp	r2, #49
	ldrls	pc, [pc, r2, asl #2]
	b	.L3883
.L3885:
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3884
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3886
	.word	.L3887
	.word	.L3888
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3889
	.word	.L3889
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3883
	.word	.L3890
	.word	.L3891
.L4024:
	mov	r2, #1
	strb	r2, [r4, #1]
	b	.L3880
.L3891:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	beq	.L4025
.L3907:
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L4011
.L4013:
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2364]
.L4010:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3884:
	mov	r0, r4
	bl	HEVC_DecSlice
	cmn	r0, #2
	beq	.L4010
	cmp	r0, #0
	beq	.L4011
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L4022
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L4022:
	ldr	r3, .L4027
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4012
.L4014:
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L4012:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3886:
	mov	r0, r4
	bl	HEVC_DecVPS
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3892
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3892:
	cmp	r5, #0
	bne	.L4026
.L4011:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3887:
	mov	r0, r4
	bl	HEVC_DecSPS
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3897
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3897:
	cmp	r5, #0
	beq	.L4011
	ldr	r6, .L4027
	mov	r0, #1
	ldr	r1, .L4027+4
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L4018
	b	.L4012
.L3888:
	mov	r0, r4
	bl	HEVC_DecPPS
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3899
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3899:
	cmp	r5, #0
	beq	.L4011
	ldr	r6, .L4027
	mov	r0, #1
	ldr	r1, .L4027+8
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L4012
.L4018:
	sub	r2, fp, #28
	mvn	r5, #0
	mov	r3, #4
	mov	r1, #100
	str	r5, [r2, #-4]!
	ldr	r0, [r4, #276]
	blx	ip
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L4012
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3889:
	mov	r0, r4
	bl	HEVC_DecSEI
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3900
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3900:
	cmp	r5, #0
	beq	.L4011
	ldr	r1, .L4027+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4022
.L3890:
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3905
	cmp	r1, #0
	beq	.L3904
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3904:
	add	r3, r4, #53248
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4011
.L3905:
	add	r5, r4, #2496
	mov	r1, #32
	add	r5, r5, #8
	mov	r7, #0
	strb	r7, [r4, #6]
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	movw	r1, #20036
	movw	r2, #20553
	movt	r1, 17221
	movt	r2, 18515
	cmp	r0, r1
	cmpeq	r6, r2
	bne	.L4011
	ldr	r6, .L4027
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3906
	mov	r3, r7
	mov	r2, r7
	mov	r1, #112
	ldr	r0, [r4, #276]
	blx	ip
.L3906:
	add	r3, r4, #53248
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4011
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L4011
.L3910:
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L4014
	b	.L4012
.L3883:
	ldr	r1, .L4027+16
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	ldr	r3, [r1, #16]
	cmp	r3, #63
	bhi	.L3911
	cmp	r1, #0
	bne	.L4013
	b	.L4011
.L3911:
	ldr	r6, .L4027
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3912
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3913
.L3914:
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L3913:
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L4011
	mov	r3, #0
	ldr	r0, [r4, #276]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	b	.L4011
.L3912:
	cmp	r1, #0
	bne	.L3914
	b	.L4011
.L4026:
	ldr	r6, .L4027
	mov	r0, #1
	ldr	r1, .L4027+20
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L4018
	b	.L4012
.L4025:
	ldr	r6, .L4027
	strb	r0, [r4, #7]
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3908
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
.L3908:
	add	r3, r4, #53248
	ldrb	r5, [r3, #1273]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L3909
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L4011
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
	mov	r0, r5
	b	.L4010
.L3909:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3907
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L3910
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
	b	.L3910
.L4028:
	.align	2
.L4027:
	.word	g_event_report
	.word	.LC496
	.word	.LC497
	.word	.LC498
	.word	.LC499
	.word	.LC495
	UNWIND(.fnend)
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
	.align	2
	.global	HEVCDEC_VDMProcSedOnly
	.type	HEVCDEC_VDMProcSedOnly, %function
HEVCDEC_VDMProcSedOnly:
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
	ldr	r6, .L4041
	mov	r3, #180
	ldr	r2, [r0, #2360]
	mov	r4, r0
	ldr	lr, [r0, #276]
	mov	r0, #22
	mla	r1, r3, r1, r6
	ldr	r3, [r2, #20]
	ldr	r2, [r2, #16]
	ldr	ip, .L4041+4
	add	r6, r1, #16
	ldr	r1, .L4041+8
	mla	r5, r2, r3, r3
	ldr	r3, [r6, #4]
	ldr	r7, [ip, lr, asl #2]
	add	r5, r5, r2
	mov	r2, r5
	bl	dprint_vfmw
	ldr	r3, [r6, #4]
	cmp	r3, r5
	ldr	r3, [r4, #220]
	beq	.L4039
	cmp	r3, #1
	beq	.L4040
.L4034:
	mov	r3, #0
	str	r3, [r4, #2360]
.L4032:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4039:
	cmp	r3, #1
	beq	.L4031
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	addeq	r2, r4, #53248
	moveq	r3, #1
	streq	r3, [r4, #228]
	streqb	r3, [r2, #1272]
	b	.L4032
.L4040:
	ldr	ip, [r4, #232]
	add	r3, r4, #53248
	ldr	r0, [r4, #208]
	mov	r5, #0
	ldr	r1, [r4, #172]
	ldr	r2, [r4, #248]
	sub	r0, r0, #1
	sub	r1, r1, #1
	str	r0, [r4, #208]
	str	r1, [r4, #172]
	sub	r2, r2, #1
	str	r5, [r4, #224]
	str	r2, [r4, #248]
	strb	ip, [r3, #1273]
	ldr	r1, [r4, #2364]
	cmp	r1, r5
	beq	.L4034
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2364]
	b	.L4034
.L4031:
	ldr	r5, [r4, #232]
	add	lr, r4, #53248
	ldr	r0, [r4, #208]
	mov	ip, #0
	ldr	r1, [r4, #172]
	ldr	r2, [r4, #248]
	sub	r0, r0, #1
	str	r3, [r4, #224]
	sub	r1, r1, #1
	str	r0, [r4, #208]
	sub	r2, r2, #1
	str	r1, [r4, #172]
	mov	r0, #0
	str	r2, [r4, #248]
	strb	r5, [lr, #1273]
	strb	r3, [r7, #689]
	strb	r3, [r4, #5]
	str	ip, [r4, #2360]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4042:
	.align	2
.L4041:
	.word	g_BackUp
	.word	s_pstVfmwChan
	.word	.LC500
	UNWIND(.fnend)
	.size	HEVCDEC_VDMProcSedOnly, .-HEVCDEC_VDMProcSedOnly
	.align	2
	.global	HEVC_UnMarkFrameStoreRef
	.type	HEVC_UnMarkFrameStoreRef, %function
HEVC_UnMarkFrameStoreRef:
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
	strb	r3, [r1, #1]
	mov	r2, r3
	ldr	r1, [r1, #32]
	ldr	r0, [r0, #276]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	HEVC_UnMarkFrameStoreRef, .-HEVC_UnMarkFrameStoreRef
	.align	2
	.global	HEVC_InquireSliceProperty
	.type	HEVC_InquireSliceProperty, %function
HEVC_InquireSliceProperty:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	ip, .L4065
	mov	r4, r0
	mov	r3, #0
	mov	r8, r1
	add	r0, r0, #55040
	str	r3, [r2]
	mov	r1, r3
	str	r3, [r8]
	mov	r7, r2
	ldr	r3, [ip, #48]
	movw	r2, #3732
	add	r0, r0, #208
	add	r6, r4, #53248
	blx	r3
	ldr	r3, [r4, #2364]
	mov	r0, r4
	ldr	r2, [r3, #16]
	str	r2, [r6, #2072]
	ldr	r3, [r3, #32]
	str	r3, [r6, #2068]
	bl	HEVC_DecSliceSegmentHeader
	cmp	r0, #0
	bne	.L4061
	ldr	r2, [r6, #2076]
	movw	r0, #2024
	ldr	r3, [r4, #2352]
	movw	r5, #26164
	ldr	r9, [r4, #220]
	ldr	r1, [r4, #2348]
	mla	r3, r0, r2, r3
	cmp	r9, #1
	ldr	r3, [r3, #32]
	mla	r5, r5, r3, r1
	beq	.L4062
	ldr	r3, [r6, #3588]
	add	ip, r4, #24576
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r8]
	ldr	r2, [ip, #3772]
	ldr	r6, [r4, #2356]
	ldr	r1, [r5, #236]
	ldr	r3, [r2, #236]
	ldr	lr, [r6, #832]
	subs	r0, r1, r3
	ldr	r1, [r2, #72]
	ldr	r3, [r5, #72]
	movne	r0, #1
	cmp	lr, #1
	ldr	r2, [r2, #76]
	ldr	lr, [r5, #76]
	beq	.L4063
.L4050:
	cmp	r3, r1
	moveq	r1, r0
	orrne	r1, r0, #1
	cmp	lr, r2
	moveq	r3, r1
	orrne	r3, r1, #1
	cmp	r3, #0
	beq	.L4053
	mov	r0, #0
	mov	r3, #1
	str	r3, [r7]
.L4046:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4062:
	ldr	r0, [r4, #2340]
	bl	BsResidBits
	ldr	r3, [r5, #240]
	ldr	r1, [r4, #208]
	add	r1, r1, #1
	mov	r6, r0
	ldr	r0, [r5, #244]
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	cmp	r6, r0
	movge	r3, #0
	movlt	r3, #1
	orrs	r3, r3, r6, lsr #31
	bne	.L4048
.L4053:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4061:
	ldr	r1, .L4065+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4065+8
	ldr	ip, [r3]
	cmp	ip, #0
	mvneq	r0, #0
	beq	.L4046
	sub	r2, fp, #36
	ldr	r0, [r4, #276]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	ip
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4063:
	ldr	r8, [r5, #108]
	ldr	r5, [r5, #100]
	cmp	r8, r5
	movcc	r8, r5
	str	r8, [r6, #884]
	ldr	r5, [ip, #3772]
	ldr	r6, [r4, #2356]
	ldr	ip, [r5, #108]
	ldr	r4, [r5, #100]
	ldr	r5, [r6, #884]
	cmp	ip, r4
	movcc	ip, r4
	cmp	ip, #8
	movls	r4, #0
	movhi	r4, #1
	cmp	r5, #8
	movne	r4, #0
	cmp	r4, #0
	beq	.L4064
.L4051:
	mov	ip, #1
	str	ip, [r6, #888]
	str	ip, [r7]
	b	.L4050
.L4064:
	sub	ip, ip, #8
	cmp	r5, #8
	clz	ip, ip
	mov	ip, ip, lsr #5
	movle	ip, #0
	cmp	ip, #0
	beq	.L4050
	b	.L4051
.L4048:
	mov	r3, r0
	mov	r2, r6
	mov	r0, r9
	ldr	r1, .L4065+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4046
.L4066:
	.align	2
.L4065:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC501
	.word	g_event_report
	.word	.LC502
	UNWIND(.fnend)
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	2
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
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
	UNWIND(.pad #60)
	sub	sp, sp, #60
	cmp	r1, #0
	mov	r4, r0
	mov	r0, #0
	str	r0, [fp, #-64]
	str	r0, [fp, #-60]
	str	r0, [fp, #-56]
	beq	.L4142
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4143
	ldr	r2, [r4, #2356]
	ldrb	lr, [r4, #5]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	lr, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #264]
	ldr	r3, [r2]
	str	r3, [r4, #268]
	ldr	r3, [r2, #4]
	str	r3, [r4, #272]
	beq	.L4071
	ldr	r3, [r2, #832]
	cmp	r3, #1
	addne	r7, r4, #86016
	beq	.L4144
.L4072:
	mov	r0, r4
	bl	HEVC_ReceivePacket
	ldr	r3, [r4, #2364]
	str	r3, [r7, #1708]
	mov	r5, r0
.L4073:
	cmp	r5, #0
	mov	r3, #0
	strb	r3, [r4, #5]
	beq	.L4074
.L4098:
	mov	r6, #0
.L4138:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4144:
	ldr	r3, [r2, #872]
	add	r7, r4, #86016
	cmp	r3, #1
	bne	.L4072
	ldr	r3, [r7, #1704]
	cmp	r3, #1
	bne	.L4072
	ldr	r3, [r7, #1708]
	mov	r6, r0
	str	r3, [r4, #2364]
	str	r0, [r7, #1704]
	strb	r0, [r4, #5]
	b	.L4138
.L4074:
	mov	r0, r4
	bl	HEVCDEC_CheckSedOnly
	subs	r6, r0, #0
	beq	.L4075
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L4141
	ldr	r0, [r4, #276]
	mvn	r6, #0
	bl	HEVC_ReleaseNAL
	mov	r0, r6
	str	r5, [r4, #2364]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4071:
	ldr	r3, [r4, #2364]
	cmp	r3, #0
	movne	r5, #0
	mvneq	r5, #0
	cmp	r3, #0
	bne	.L4073
	ldr	r1, .L4152
	mov	r6, r5
	bl	dprint_vfmw
	b	.L4138
.L4147:
	ldr	r1, .L4152+4
	mov	r0, #22
	bl	dprint_vfmw
.L4141:
	mvn	r6, #0
	b	.L4138
.L4075:
	ldr	r3, [r4, #2364]
	ldr	r9, .L4152+8
	str	r5, [r3, #4]
	ldr	r3, [r4, #2364]
	ldr	r0, [r4, #2340]
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2340]
	bl	BsSkip
	ldr	r3, [r4, #276]
	ldr	r3, [r9, r3, asl #2]
	ldrsb	r10, [r3, #44]
	cmp	r10, #1
	movne	r7, #2
	movne	r8, r7
	beq	.L4145
.L4077:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	ldr	r10, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	str	r0, [r10, #24]
	ldr	r0, [r4, #2340]
	ldr	r10, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	str	r0, [r10, #16]
	ldr	r0, [r4, #2340]
	ldr	r10, [r4, #2364]
	bl	BsGet
	mov	r1, #3
	str	r0, [r10, #28]
	ldr	r0, [r4, #2340]
	ldr	r10, [r4, #2364]
	bl	BsGet
	str	r0, [r10, #32]
	ldr	r10, [r4, #2364]
	ldr	r3, [r10, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r10, #32]
	ldrne	r10, [r4, #2364]
	ldr	r0, [r10, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	beq	.L4146
.L4079:
	mov	r3, #0
	str	r3, [r10, #4]
	ldr	r3, [r4, #2364]
	add	r0, r4, #2496
	add	r0, r0, #8
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2340]
	bl	BsSkip
	cmp	r7, #0
	cmpeq	r8, #1
	moveq	r7, #1
	movne	r7, #0
	cmp	r5, #1
	moveq	r5, #0
	andne	r5, r7, #1
	cmp	r5, #0
	beq	.L4096
	mov	r1, #16
	ldr	r0, [r4, #2340]
	bl	BsSkip
.L4096:
	mov	r1, #1
	ldr	r0, [r4, #2340]
	ldr	r5, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #24]
	ldr	r0, [r4, #2340]
	ldr	r5, [r4, #2364]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #16]
	ldr	r0, [r4, #2340]
	ldr	r5, [r4, #2364]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #28]
	ldr	r0, [r4, #2340]
	ldr	r5, [r4, #2364]
	bl	BsGet
	sub	r0, r0, #1
	str	r0, [r5, #32]
.L4095:
	mov	r0, r4
	bl	HEVC_DecOneNal
	cmn	r0, #2
	beq	.L4102
	cmp	r0, #0
	bne	.L4147
	add	r3, r4, #53248
	str	r0, [r3, #1328]
	ldr	r3, [r4, #212]
	cmp	r3, #1
	bne	.L4098
	mov	r0, r4
	bl	HEVCDEC_SetDecParam
	b	.L4138
.L4143:
	ldr	r1, .L4152+12
	mvn	r6, #0
	bl	dprint_vfmw
	b	.L4138
.L4145:
	ldr	r8, [r3, #172]
	mov	r0, r4
	ldr	r7, [r3, #176]
	ldr	r3, [r3, #180]
	mov	r1, r8
	mov	r2, r7
	bl	HEVC_VES_Splitter
	cmp	r0, #2
	beq	.L4100
	cmp	r0, #1
	beq	.L4077
.L4102:
	mov	r6, r0
	b	.L4138
.L4146:
	str	r0, [fp, #-72]
	sub	r2, fp, #48
	sub	r1, fp, #52
	mov	r0, r4
	bl	HEVC_InquireSliceProperty
	ldr	r3, [fp, #-72]
	subs	ip, r0, #0
	bne	.L4080
	ldr	r9, [fp, #-52]
	cmp	r9, #1
	beq	.L4148
.L4081:
	ldr	r9, [fp, #-48]
	cmp	r9, #1
	beq	.L4149
.L4091:
	ldr	r10, [r4, #2364]
	ldr	r0, [r10, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	beq	.L4095
	b	.L4079
.L4100:
	mov	r5, r10
	b	.L4077
.L4080:
	ldr	r1, .L4152+16
	mov	r0, r3
	bl	dprint_vfmw
	ldr	r1, [r4, #2364]
	cmp	r1, #0
	beq	.L4092
	ldr	r0, [r4, #276]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2364]
.L4092:
	ldr	r3, .L4152+20
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4093
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
.L4093:
	ldr	r3, [r4, #276]
	ldr	r3, [r9, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	bne	.L4141
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L4141
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L4141
	add	r3, r4, #24576
	ldrb	r5, [r3, #3760]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L4141
	ldr	r3, .L4152+24
	add	r0, r4, #28160
	mov	r2, #80
	mov	r1, r5
	add	r0, r0, #104
	mvn	r6, #0
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r4, #4096
	add	r2, r3, #2576
	add	r4, r4, #6656
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r2]
	strd	r0, [r4, #-8]
	strd	r0, [r4]
	strd	r0, [r2, #-8]
	str	r5, [r3, #460]
	str	r5, [r3, #464]
	str	r5, [r3, #452]
	str	r5, [r3, #456]
	b	.L4138
.L4142:
	mov	r0, r1
	ldr	r1, .L4152+28
	bl	dprint_vfmw
	mvn	r6, #0
	b	.L4138
.L4148:
	ldr	r3, [r4, #208]
	cmp	r3, #0
	bne	.L4082
	add	r3, r4, #53248
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4081
	ldr	r2, .L4152+32
	ldr	r1, .L4152+36
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	b	.L4081
.L4149:
	ldrb	r10, [r4, #2]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r10, #1
	beq	.L4150
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L4151
.L4087:
	ldr	r0, [r4, #276]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4091
	sub	r3, fp, #56
	ldr	r0, [r4, #276]
	sub	r2, fp, #60
	sub	r1, fp, #64
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #2356]
	ldr	r0, [r3, #708]
	cmp	r0, #1
	bne	.L4091
	ldr	r10, [fp, #-56]
	cmp	r10, #0
	bgt	.L4089
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L4089
	ldr	r3, [r4, #2360]
	cmp	r3, #0
	str	r3, [fp, #-76]
	bne	.L4089
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	str	r3, [fp, #-72]
	beq	.L4091
	ldr	r3, [r4, #252]
	cmp	r3, #0
	beq	.L4091
	add	r3, r4, #24576
	str	r3, [fp, #-80]
	add	r9, r4, #86016
	ldr	r3, [r3, #3772]
	ldr	r1, [r9, #1728]
	ldr	lr, [r3, #76]
	cmp	lr, r1
	beq	.L4091
	ldr	ip, [r3, #72]
	ldr	r3, [r9, #1732]
	subs	r2, ip, r3
	movne	r2, #1
	cmp	r10, #0
	movne	r2, #0
	cmp	r2, #0
	beq	.L4091
	stmib	sp, {ip, lr}
	ldr	r2, [fp, #-72]
	str	r1, [sp]
	ldr	r1, .L4152+40
	bl	dprint_vfmw
	ldr	r3, [fp, #-76]
	ldr	r1, .L4152+20
	str	r3, [r9, #1724]
	ldr	r3, [fp, #-80]
	ldr	ip, [r1]
	ldr	r3, [r3, #3772]
	cmp	ip, #0
	ldr	r2, [r3, #76]
	str	r2, [r9, #1728]
	ldr	r3, [r3, #72]
	str	r3, [r9, #1732]
	beq	.L4091
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #276]
	blx	ip
	b	.L4091
.L4082:
	ldr	r3, [r4, #2364]
	add	r0, r4, #2496
	mov	r2, #13
	add	r0, r0, #8
	ldr	r1, .L4152+44
	mvn	r6, #1
	str	ip, [r3, #4]
	bl	BsInit
	mov	r1, #40
	ldr	r0, [r4, #2340]
	bl	BsSkip
	ldr	r3, [r4, #2364]
	mov	r2, #48
	mov	r0, r4
	str	r2, [r3, #16]
	strb	r9, [r4, #6]
	bl	HEVC_DecOneNal
	ldr	r3, [r4, #304]
	strb	r9, [r4, #5]
	add	r3, r3, #1
	str	r3, [r4, #304]
	b	.L4138
.L4150:
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L4087
	mov	r0, r10
	ldr	r2, .L4152+48
	ldr	r1, .L4152+52
	bl	dprint_vfmw
	b	.L4087
.L4151:
	mov	r0, r9
	ldr	r2, .L4152+48
	ldr	r1, .L4152+56
	bl	dprint_vfmw
	b	.L4087
.L4089:
	add	r2, r4, #86016
	mov	r1, #0
	mov	r3, #1
	mvn	r6, #1
	str	r1, [r2, #1724]
	strb	r3, [r4, #5]
	b	.L4138
.L4153:
	.align	2
.L4152:
	.word	.LC505
	.word	.LC509
	.word	s_pstVfmwChan
	.word	.LC504
	.word	.LC508
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC503
	.word	.LANCHOR1+912
	.word	.LC506
	.word	.LC507
	.word	.LANCHOR1+956
	.word	.LANCHOR1+932
	.word	.LC472
	.word	.LC471
	UNWIND(.fnend)
	.size	HEVCDEC_DecodePacket, .-HEVCDEC_DecodePacket
	.align	2
	.global	HEVC_HaveSliceToDec
	.type	HEVC_HaveSliceToDec, %function
HEVC_HaveSliceToDec:
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
	ldr	r0, [r0, #208]
	cmp	r0, #0
	bne	.L4156
	add	r3, r4, #53248
	ldrb	r3, [r3, #1273]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4158
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4156:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4158:
	ldr	r2, .L4159
	ldr	r1, .L4159+4
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4160:
	.align	2
.L4159:
	.word	.LANCHOR1+912
	.word	.LC506
	UNWIND(.fnend)
	.size	HEVC_HaveSliceToDec, .-HEVC_HaveSliceToDec
	.align	2
	.global	HEVC_GetPicStreamSize
	.type	HEVC_GetPicStreamSize, %function
HEVC_GetPicStreamSize:
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
	add	r0, r0, #65536
	ldr	r2, [r0, #148]
	cmp	r2, #0
	beq	.L4164
	mov	r0, #0
.L4163:
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L4163
	ldmfd	sp, {fp, sp, pc}
.L4164:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_GetPicStreamSize, .-HEVC_GetPicStreamSize
	.align	2
	.global	HEVCDEC_GetRemainImg
	.type	HEVCDEC_GetRemainImg, %function
HEVCDEC_GetRemainImg:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r3, [r0, #2540]
	mov	r4, r0
	cmp	r3, #0
	addne	r8, r0, #62464
	addne	r8, r8, #248
	mvnne	r6, #0
	movne	r7, #1
	bne	.L4177
	b	.L4178
.L4169:
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	ldr	r1, [fp, #-52]
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r2, [r4, #2540]
	cmp	r2, #0
	beq	.L4186
.L4177:
	sub	r1, fp, #48
	sub	r2, fp, #52
	mov	r0, r4
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-52]
	add	r3, r1, #640
	ldr	r5, [r4, r3, asl #2]
	cmp	r5, #0
	beq	.L4169
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4169
	mov	r1, r5
	mov	r0, r4
	strb	r7, [r5, #2]
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L4187
.L4176:
	ldr	r1, [fp, #-52]
	b	.L4169
.L4186:
	cmp	r6, #0
	bne	.L4178
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4187:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L4188
	ldr	r3, [r4, #2540]
	mov	r2, r4
	mov	r1, #16
	cmp	r3, #1
	streq	r3, [r9, #212]
	mov	r3, r8
	ldr	r0, [r4, #276]
	str	r9, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r10, r0
	beq	.L4173
	mov	r3, r0
	ldr	r2, .L4190
	ldr	r1, .L4190+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #276]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r1, #1
	mov	r0, r4
	mvn	r10, #0
	bl	HEVC_ClearAll
.L4173:
	ldr	r3, [r4, #2356]
	ldr	r2, [r3, #604]
	add	r2, r2, #2032
	add	r2, r2, #15
	cmp	r2, #4096
	movcc	r3, #0
	strcc	r3, [r9, #24]
	bcs	.L4189
.L4175:
	ldr	r1, [r4, #2540]
	ldr	r3, [r4, #316]
	ldr	r2, [r4, #308]
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #316]
	add	r2, r2, #1
	str	r2, [r4, #308]
	beq	.L4176
	mov	r6, r10
	ldr	r1, [fp, #-52]
	b	.L4169
.L4178:
	add	r0, r4, #62464
	add	r0, r0, #248
	bl	GetVoLastImageID
	mov	r6, r0
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4189:
	mov	r1, r9
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.5
	b	.L4175
.L4188:
	ldr	r1, .L4190+8
	mvn	r6, #0
	ldr	r2, .L4190
	bl	dprint_vfmw
	ldr	r1, [fp, #-52]
	b	.L4169
.L4191:
	.align	2
.L4190:
	.word	.LANCHOR1+972
	.word	.LC511
	.word	.LC510
	UNWIND(.fnend)
	.size	HEVCDEC_GetRemainImg, .-HEVCDEC_GetRemainImg
	.align	2
	.global	HEVCDEC_GetImageWidth
	.type	HEVCDEC_GetImageWidth, %function
HEVCDEC_GetImageWidth:
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
	add	r0, r0, #24576
	ldr	r2, [r0, #3772]
	ldr	r3, [r2, #152]
	ldr	r2, [r2, #72]
	rsb	r0, r3, #0
	add	r3, r3, r2
	sub	r3, r3, #1
	and	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageWidth, .-HEVCDEC_GetImageWidth
	.align	2
	.global	HEVCDEC_GetImageHeight
	.type	HEVCDEC_GetImageHeight, %function
HEVCDEC_GetImageHeight:
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
	add	r0, r0, #24576
	ldr	r2, [r0, #3772]
	ldr	r3, [r2, #152]
	ldr	r2, [r2, #76]
	rsb	r0, r3, #0
	add	r3, r3, r2
	sub	r3, r3, #1
	and	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCDEC_GetImageHeight, .-HEVCDEC_GetImageHeight
	.global	g_IsDeced
	.global	g_TsToRsMap
	.global	s_TmpParam
	.global	RPU_START_CODE
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	SarTable.14504, %object
	.size	SarTable.14504, 136
SarTable.14504:
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
	.type	__func__.14696, %object
	.size	__func__.14696, 18
__func__.14696:
	.ascii	"HEVC_CalcTileInfo\000"
	.space	2
	.type	__func__.15187, %object
	.size	__func__.15187, 27
__func__.15187:
	.ascii	"HEVC_GetUnRefPicWithMinPoc\000"
	.space	1
	.type	__func__.15196, %object
	.size	__func__.15196, 21
__func__.15196:
	.ascii	"HEVC_IncreaseDPBSize\000"
	.space	3
	.type	__func__.15427, %object
	.size	__func__.15427, 17
__func__.15427:
	.ascii	"HEVC_WritePicMsg\000"
	.space	3
	.type	__func__.15456, %object
	.size	__func__.15456, 16
__func__.15456:
	.ascii	"HEVC_CheckListX\000"
	.type	__func__.15581, %object
	.size	__func__.15581, 16
__func__.15581:
	.ascii	"HEVC_RepairList\000"
	.type	__func__.15954, %object
	.size	__func__.15954, 21
__func__.15954:
	.ascii	"HEVC_CheckFrameStore\000"
	.space	3
	.type	__func__.15797, %object
	.size	__func__.15797, 19
__func__.15797:
	.ascii	"HEVC_OutputCurrPic\000"
	.space	1
	.type	__func__.15802, %object
	.size	__func__.15802, 23
__func__.15802:
	.ascii	"HEVC_FirstFrameFastOut\000"
	.space	1
	.type	__func__.16022, %object
	.size	__func__.16022, 19
__func__.16022:
	.ascii	"HEVC_GetSLHDR1Info\000"
	.space	1
	.type	__func__.16148, %object
	.size	__func__.16148, 14
__func__.16148:
	.ascii	"HEVC_IsNewPic\000"
	.space	2
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
	.type	__func__.16429, %object
	.size	__func__.16429, 16
__func__.16429:
	.ascii	"HEVC_ReleaseNAL\000"
.LC0:
	.word	1
	.word	2
	.word	2
	.word	1
.LC1:
	.word	1
	.word	2
	.word	1
	.word	1
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
	.type	__func__.15278, %object
	.size	__func__.15278, 27
__func__.15278:
	.ascii	"HEVC_DecSliceSegmentHeader\000"
	.space	1
	.type	__func__.15660, %object
	.size	__func__.15660, 13
__func__.15660:
	.ascii	"HEVC_InitDPB\000"
	.space	3
	.type	__func__.16489, %object
	.size	__func__.16489, 13
__func__.16489:
	.ascii	"HEVCDEC_Init\000"
	.space	3
	.type	__func__.15946, %object
	.size	__func__.15946, 19
__func__.15946:
	.ascii	"HEVC_OutputFrmToVO\000"
	.space	1
	.type	__func__.15913, %object
	.size	__func__.15913, 22
__func__.15913:
	.ascii	"HEVC_OutputFrmFromDPB\000"
	.space	2
	.type	__func__.15202, %object
	.size	__func__.15202, 30
__func__.15202:
	.ascii	"HEVC_OutputUnRefPicWithMinPoc\000"
	.space	2
	.type	__func__.15926, %object
	.size	__func__.15926, 27
__func__.15926:
	.ascii	"HEVC_FlushOutputFrmFromDPB\000"
	.space	1
	.type	__func__.16477, %object
	.size	__func__.16477, 23
__func__.16477:
	.ascii	"HEVCDEC_GetImageBuffer\000"
	.space	1
	.type	__func__.16528, %object
	.size	__func__.16528, 14
__func__.16528:
	.ascii	"HEVC_ClearDPB\000"
	.space	2
	.type	__func__.15207, %object
	.size	__func__.15207, 23
__func__.15207:
	.ascii	"HEVC_RecoverDPBProcess\000"
	.space	1
	.type	__func__.15890, %object
	.size	__func__.15890, 20
__func__.15890:
	.ascii	"HEVC_InsertFrmInDPB\000"
	.type	__func__.15807, %object
	.size	__func__.15807, 22
__func__.15807:
	.ascii	"HEVC_SimpleDPBProcess\000"
	.space	2
	.type	__func__.15812, %object
	.size	__func__.15812, 21
__func__.15812:
	.ascii	"HEVC_DecOrderProcess\000"
	.space	3
	.type	__func__.15817, %object
	.size	__func__.15817, 22
__func__.15817:
	.ascii	"HEVC_DispOrderProcess\000"
	.space	2
	.type	__func__.15833, %object
	.size	__func__.15833, 19
__func__.15833:
	.ascii	"HEVC_StorePicInDPB\000"
	.space	1
	.type	__func__.15234, %object
	.size	__func__.15234, 14
__func__.15234:
	.ascii	"HEVC_DecSlice\000"
	.space	2
	.type	__func__.15534, %object
	.size	__func__.15534, 12
__func__.15534:
	.ascii	"HEVC_DecVDM\000"
	.type	__func__.14609, %object
	.size	__func__.14609, 18
__func__.14609:
	.ascii	"HEVC_VES_Splitter\000"
	.space	2
	.type	__func__.16592, %object
	.size	__func__.16592, 20
__func__.16592:
	.ascii	"HEVC_HaveSliceToDec\000"
	.type	__func__.14643, %object
	.size	__func__.14643, 21
__func__.14643:
	.ascii	"HEVCDEC_DecodePacket\000"
	.space	3
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
	.space	3
	.type	__func__.16609, %object
	.size	__func__.16609, 21
__func__.16609:
	.ascii	"HEVCDEC_GetRemainImg\000"
	.data
	.align	2
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	ASCII(.ascii	"dar=%d\012\000" )
.LC3:
	ASCII(.ascii	"--------------- PrintNaluArraySlot START ----------" )
	ASCII(.ascii	"-----\012\000" )
	.space	2
.LC4:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC5:
	ASCII(.ascii	"--------------- PrintNaluArraySlot END ------------" )
	ASCII(.ascii	"---\012\000" )
.LC6:
	ASCII(.ascii	"NalArray[%d]=%p,is_valid=%d   \000" )
	.space	1
.LC7:
	ASCII(.ascii	"--------------- PrintCurrSlicelistX START ---------" )
	ASCII(.ascii	"------\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"List0, size: %d\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"List1, size: %d\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"pListX[0][%d]:%p \000" )
	.space	2
.LC11:
	ASCII(.ascii	"pFrameStore:%p \000" )
.LC12:
	ASCII(.ascii	"pLogicFs:%p \000" )
	.space	3
.LC13:
	ASCII(.ascii	"--------------- PrintCurrSlicelistX END -----------" )
	ASCII(.ascii	"----\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"pListX[1][%d]: %p\000" )
	.space	2
.LC15:
	ASCII(.ascii	"--------------- PrintFrameStoreState START --------" )
	ASCII(.ascii	"-------\012\000" )
.LC16:
	ASCII(.ascii	"--------------- PrintFrameStoreState END ----------" )
	ASCII(.ascii	"-----\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"Fs=%d, pFs=%p, state=%d, is_reference=%d, is_displa" )
	ASCII(.ascii	"yed=%d \000" )
	.space	1
.LC18:
	ASCII(.ascii	"p_usrdat[%d]=%p \000" )
	.space	3
.LC19:
	ASCII(.ascii	"--------------- PrintAPCState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"APC.used_size:%d, APC.size:%d\012\000" )
	.space	1
.LC21:
	ASCII(.ascii	"%d: is_used=%d, idc=%d, poc=%d\012\000" )
.LC22:
	ASCII(.ascii	"--------------- PrintAPCState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC23:
	ASCII(.ascii	"--------------- PrintDPBState START ---------------" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"DPB: size:%d, used_size:%d, negative:%d, positive:%" )
	ASCII(.ascii	"d, longterm:%d\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"fs[%d]:%p non_existing:%d state:%d is_ref:%d displa" )
	ASCII(.ascii	"yed:%d poc:%d long_term:%d LogicFs:%p, fsp_ref:%d f" )
	ASCII(.ascii	"sp_disp:%d logic_id:%d img_id:%d\012\000" )
.LC26:
	ASCII(.ascii	"--------------- PrintDPBState END ---------------\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC27:
	ASCII(.ascii	"fs[%d]\011\000" )
.LC28:
	ASCII(.ascii	"LogicFs:%p\011\000" )
.LC29:
	ASCII(.ascii	"LogicTick:%d\011\000" )
	.space	2
.LC30:
	ASCII(.ascii	"IsRef:%d\011\000" )
	.space	2
.LC31:
	ASCII(.ascii	"s32DispState:%d\011\000" )
	.space	3
.LC32:
	ASCII(.ascii	"LogicFs:Null\011\000" )
	.space	2
.LC33:
	ASCII(.ascii	"DecFs:%p\011\000" )
	.space	2
.LC34:
	ASCII(.ascii	"DecTick:%d\011\000" )
.LC35:
	ASCII(.ascii	"DecFs:Null\011\000" )
.LC36:
	ASCII(.ascii	"DispFs:%p\011\000" )
	.space	1
.LC37:
	ASCII(.ascii	"DispTick:%d\011\000" )
	.space	3
.LC38:
	ASCII(.ascii	"DispFs:Null\011\000" )
	.space	3
.LC39:
	ASCII(.ascii	"%s num_tile_columns(%d) out of range(0, %d].\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"%s num_tile_rows(%d) out of range(0, %d].\012\000" )
	.space	1
.LC41:
	ASCII(.ascii	"%s 0 idx(%d) out of range(0, 512).\012\000" )
.LC42:
	ASCII(.ascii	"%s 1 idx(%d) out of range(0, 512).\012\000" )
.LC43:
	ASCII(.ascii	"firmware/common/syntax/hevc.c\000" )
	.space	2
.LC44:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"HEVC_Sei_User_Data_Unregistered payloadSize < 16\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC46:
	ASCII(.ascii	"pListX[0][%d] = NULL, listXsize[0] = %d\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL, listXsize[0] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"pListX[0][%d] frame_store(%p), pstLogicFs(%p) inval" )
	ASCII(.ascii	"id\012\000" )
	.space	1
.LC49:
	ASCII(.ascii	"pListX[1][%d] = NULL, listXsize[1] = %d\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL, listXsize[1] = %" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"pListX[i][%d] pstLogicFs(%p) invalid\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"%s DPB.used_size(%d) >= 17.\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"%s can't find such pic.\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"%s find pos=%d, poc=%d.\012\000" )
	.space	3
.LC55:
	ASCII(.ascii	"%s DPB.size(%d) already reached max(%d).\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"%s increase DPB size to %d\012\000" )
.LC57:
	ASCII(.ascii	"%s no enough fs(total_fs_num=%d) to increase DPB si" )
	ASCII(.ascii	"ze.\012\000" )
.LC58:
	ASCII(.ascii	"TileWidthInCtb is 0\012\000" )
	.space	3
.LC59:
	ASCII(.ascii	"image_id=%d, pmv_idc=%d\012\000" )
	.space	3
.LC60:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC61:
	ASCII(.ascii	"%s call HEVC_CalcTileInfo failed.\012\000" )
	.space	1
.LC62:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"%s ERROR: bHaveIndependentSlice = 0\012\012\000" )
	.space	2
.LC65:
	ASCII(.ascii	"ListX ERROR: list0size >= %d\012\000" )
	.space	2
.LC66:
	ASCII(.ascii	"ListX ERROR: list1size >= %d\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"pListX[0][%d] = NULL\012\000" )
	.space	2
.LC68:
	ASCII(.ascii	"pListX[0][%d]->frame_store = NULL\012\000" )
	.space	1
.LC69:
	ASCII(.ascii	"pListX[1][%d] = NULL\012\000" )
	.space	2
.LC70:
	ASCII(.ascii	"pListX[1][%d]->frame_store = NULL\012\000" )
	.space	1
.LC71:
	ASCII(.ascii	"NumSlicePara(%d) >= MaxSliceNum(%d)\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"line:%d pic_parameter_set_id(%d) out of range(0,%d)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC73:
	ASCII(.ascii	"line:%d seq_parameter_set_id(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC74:
	ASCII(.ascii	"line:%d, i(%d) > Max(%d) num_of_pics %d\012\000" )
	.space	3
.LC75:
	ASCII(.ascii	"line:%d, i(%d) > Max(%d)(neg%d + pos%d)\012\000" )
	.space	3
.LC76:
	ASCII(.ascii	"%s unkown slice type(%d).\012\000" )
	.space	1
.LC77:
	ASCII(.ascii	"%s pListX[%d] no available pic to repair.\012\000" )
	.space	1
.LC78:
	ASCII(.ascii	"%s: pListX[%d][%d] = NULL, repair it with pos(%d).\012" )
	ASCII(.ascii	"\000" )
.LC79:
	ASCII(.ascii	"HEVC_InitListX error.\012\000" )
	.space	1
.LC80:
	ASCII(.ascii	"HEVC_RepairList error.\012\000" )
.LC81:
	ASCII(.ascii	"release(apc=%d, pmvIdc=%d)\011\000" )
.LC82:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC83:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(poc=%d, ref=%" )
	ASCII(.ascii	"d, logic_fs=%p, dec_fs=%p)\012\000" )
	.space	1
.LC84:
	ASCII(.ascii	"%s frame logic_fs_id=%d, state=%d\012\000" )
	.space	1
.LC85:
	ASCII(.ascii	"LogicFs(fs=%p, poc=%d, FirstFrameState=%d) is null," )
	ASCII(.ascii	" logic_fs_id = %d\012\000" )
	.space	2
.LC86:
	ASCII(.ascii	"%s frame poc=%d, is already output\012\000" )
.LC87:
	ASCII(.ascii	"%s frame(%p) invalid, state:%d, non_existing:%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC88:
	ASCII(.ascii	"%s: pImg is NULL!\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"%s, REPORT_IFRAME_ERR\012\000" )
	.space	1
.LC90:
	ASCII(.ascii	"%s: InsertImgToVoQueue failed!\012\000" )
.LC91:
	ASCII(.ascii	"%s: ImgErrorLevel = %d, OutErrThr:%d, discarded!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC92:
	ASCII(.ascii	"%s output current picture failed\012\000" )
	.space	2
.LC93:
	ASCII(.ascii	"HEVC_DECRecycleImage ERROR, DispState = FS_DISP_STA" )
	ASCII(.ascii	"TE_NOT_USED\012\000" )
.LC94:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC95:
	ASCII(.ascii	"hevc partition fs memory fail!\012\000" )
.LC96:
	ASCII(.ascii	"ERROR: HEVC FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC97:
	ASCII(.ascii	"%-5d   specVersion\012\000" )
.LC98:
	ASCII(.ascii	"%-5d   payloadMode\012\000" )
.LC99:
	ASCII(.ascii	"%-5d   hdrPicColourSpace\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"%-5d   hdrMasterDisplayColourSpace\012\000" )
.LC101:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMaxLuminance\012\000" )
	.space	3
.LC102:
	ASCII(.ascii	"%-5d   hdrMasterDisplayMinLuminance\012\000" )
	.space	3
.LC103:
	ASCII(.ascii	"%-5d   sdrPicColourSpace\012\000" )
	.space	2
.LC104:
	ASCII(.ascii	"%-5d   sdrMasterDisplayColourSpace\012\000" )
.LC105:
	ASCII(.ascii	"%-5d   tmInputSignalBlackLevelOffset\012\000" )
	.space	2
.LC106:
	ASCII(.ascii	"%-5d   tmInputSignalWhiteLevelOffset\012\000" )
	.space	2
.LC107:
	ASCII(.ascii	"%-5d   shadowGain\012\000" )
	.space	1
.LC108:
	ASCII(.ascii	"%-5d   highlightGain\012\000" )
	.space	2
.LC109:
	ASCII(.ascii	"%-5d   midToneWidthAdjFactor\012\000" )
	.space	2
.LC110:
	ASCII(.ascii	"%-5d   tmOutputFineTuningNumVal\012\000" )
	.space	3
.LC111:
	ASCII(.ascii	"%-5d   saturationGainNumVal\012\000" )
	.space	3
.LC112:
	ASCII(.ascii	"%-5d   tmOutputFineTuningX[%d]\012\000" )
.LC113:
	ASCII(.ascii	"%-5d   tmOutputFineTuningY[%d]\012\000" )
.LC114:
	ASCII(.ascii	"%-5d   saturationGainX[%d]\012\000" )
.LC115:
	ASCII(.ascii	"%-5d   saturationGainY[%d]\012\000" )
.LC116:
	ASCII(.ascii	"%-5d   luminanceMappingNumVal\012\000" )
	.space	1
.LC117:
	ASCII(.ascii	"%-5d   colourCorrectionNumVal\012\000" )
	.space	1
.LC118:
	ASCII(.ascii	"%-5d   luminanceMappingX[%d]\012\000" )
	.space	2
.LC119:
	ASCII(.ascii	"%-5d   luminanceMappingY[%d]\012\000" )
	.space	2
.LC120:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuA\012\000" )
	.space	3
.LC121:
	ASCII(.ascii	"%-5d   chromaToLumaInjectionMuB\012\000" )
	.space	3
.LC122:
	ASCII(.ascii	"%-5d   colourCorrectionX[%d]\012\000" )
	.space	2
.LC123:
	ASCII(.ascii	"%-5d   colourCorrectionY[%d]\012\000" )
	.space	2
.LC124:
	ASCII(.ascii	"======SL_HDR1_METADATA= %d=======\012\000" )
	.space	1
.LC125:
	ASCII(.ascii	"%s, [%d %d %d %d %d]\012\000" )
	.space	2
.LC126:
	ASCII(.ascii	"%s HDR_Metadata_phy_addr is invalid!!\012\000" )
	.space	1
.LC127:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC128:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC129:
	ASCII(.ascii	"FSP_GetFspType -1\012\000" )
	.space	1
.LC130:
	ASCII(.ascii	"FSP_GetLogicFs return NULL\012\000" )
.LC131:
	ASCII(.ascii	"%s: pHevcCtx->DPB.used_size(%d) > DPB.size(%d), err" )
	ASCII(.ascii	"or resilence.\012\000" )
	.space	2
.LC132:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC133:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck pic_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC134:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC135:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck seq_parameter_set_id(%d) out of" )
	ASCII(.ascii	" range\012\000" )
	.space	1
.LC136:
	ASCII(.ascii	"sps with this seq_parameter_set_id = %d havn't be d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC137:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck video_parameter_set_id out of r" )
	ASCII(.ascii	"ange\012\000" )
	.space	3
.LC138:
	ASCII(.ascii	"vps with this video_parameter_set_id = %d havn't be" )
	ASCII(.ascii	" decoded\012\000" )
	.space	3
.LC139:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, PocRandomAccess = %d, n" )
	ASCII(.ascii	"al_unit_type = %d, should skip this frame\012\000" )
	.space	2
.LC140:
	ASCII(.ascii	"%s, %d, CurrSlice.poc = %d, bNoRaslOutputFlag = %d," )
	ASCII(.ascii	" nal_unit_type = %d, should skip this frame\012\000" )
.LC141:
	ASCII(.ascii	"%s, %d, PrevRAPIsBLA = %d, CurrSlice.poc = %d, PocC" )
	ASCII(.ascii	"RA = %d, nal_unit_type = %d, should skip this frame" )
	ASCII(.ascii	"\012\000" )
.LC142:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code should not be zero.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC143:
	ASCII(.ascii	"HEVC_ReadByteAlignment: code:%d\012\000" )
	.space	3
.LC144:
	ASCII(.ascii	"general_profile_compatibility_flag[][%d]\000" )
	.space	3
.LC145:
	ASCII(.ascii	"reserved_zero_2bits not equal 0.\012\000" )
	.space	2
.LC146:
	ASCII(.ascii	"HEVC_GetScalingListDefaultAddress NULL.\012\000" )
	.space	3
.LC147:
	ASCII(.ascii	"Error, BsLen: 0x%x, TotalPos: 0x%x\012\000" )
.LC148:
	ASCII(.ascii	"Panic: All zero data sequence in RBSP \012\000" )
.LC149:
	ASCII(.ascii	"nal_trail_zero_bit_num err\012\000" )
.LC150:
	ASCII(.ascii	"%s release streambuff=%p, bitstream_length=%d\012\000" )
	.space	1
.LC151:
	ASCII(.ascii	"HEVC_CombinePacket FATAL: pCurrNal=NULL!\012\000" )
	.space	2
.LC152:
	ASCII(.ascii	"END of the bit buffer, copy the first packet!\012\000" )
	.space	1
.LC153:
	ASCII(.ascii	"HEVC_ue_v ERROR: LeadingZeros (%d) >= 32, return 0x" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC154:
	ASCII(.ascii	"tone_map_id\000" )
.LC155:
	ASCII(.ascii	"Unsupport: target_bit_depth(%d) > 8\012\000" )
	.space	3
.LC156:
	ASCII(.ascii	"pTon->num_pivots > 256\012\000" )
.LC157:
	ASCII(.ascii	"frame_packing_arrangement_id\000" )
	.space	3
.LC158:
	ASCII(.ascii	"frame_packing_arrangement_type(%d) out of range\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC159:
	ASCII(.ascii	"decoding_unit_idx\000" )
	.space	2
.LC160:
	ASCII(.ascii	"num_sps_ids_minus1\000" )
	.space	1
.LC161:
	ASCII(.ascii	"pAct->num_sps_ids_minus1 > 15\012\000" )
	.space	1
.LC162:
	ASCII(.ascii	"active_seq_parameter_set_id\000" )
.LC163:
	ASCII(.ascii	"bp_seq_parameter_set_id\000" )
.LC164:
	ASCII(.ascii	"Wrong bp_seq_parameter_set_id = %d, should be 0 to " )
	ASCII(.ascii	"15!\012\000" )
.LC165:
	ASCII(.ascii	"HEVC_Sei_Buf_Period cpb_cnt_minus1(%d) out of range" )
	ASCII(.ascii	"(0,31).\012\000" )
.LC166:
	ASCII(.ascii	"num_decoding_units_minus1\000" )
	.space	2
.LC167:
	ASCII(.ascii	"pPic->num_decoding_units_minus1 > 255\012\000" )
	.space	1
.LC168:
	ASCII(.ascii	"num_nalus_in_du_minus1\000" )
	.space	1
.LC169:
	ASCII(.ascii	"cv_rec_id\000" )
	.space	2
.LC170:
	ASCII(.ascii	"HEVC_Sei_User_Data_Registered_Itu_T_T35 payloadSize" )
	ASCII(.ascii	" < 4!!\012\000" )
	.space	1
.LC171:
	ASCII(.ascii	"delta_idx_minus1\000" )
	.space	3
.LC172:
	ASCII(.ascii	"delta_idx(%d) > idx(%d).\012\000" )
	.space	2
.LC173:
	ASCII(.ascii	"rIdx(%d) > (idx-1)(%d) or < 0).\012\000" )
	.space	3
.LC174:
	ASCII(.ascii	"abs_delta_rps_minus1\000" )
	.space	3
.LC175:
	ASCII(.ascii	"pTempRPset->num_of_pics(%d) out of range(0,15).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC176:
	ASCII(.ascii	"num_of_pics out of range(0,15).\012\000" )
	.space	3
.LC177:
	ASCII(.ascii	"num_negative_pics\000" )
	.space	2
.LC178:
	ASCII(.ascii	"pTempRPset->num_negative_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC179:
	ASCII(.ascii	"num_positive_pics\000" )
	.space	2
.LC180:
	ASCII(.ascii	"pTempRPset->num_positive_pics(%d) out of range(0,15" )
	ASCII(.ascii	").\012\000" )
	.space	1
.LC181:
	ASCII(.ascii	"pShortTermRpset->num_of_pics(%d) out of range[0,%d]" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC182:
	ASCII(.ascii	"delta_poc_s0_minus1\000" )
.LC183:
	ASCII(.ascii	"delta_poc_s0_minus1(%d) out of range.\012\000" )
	.space	1
.LC184:
	ASCII(.ascii	"delta_poc_s1_minus1\000" )
.LC185:
	ASCII(.ascii	"elemental_duration_in_tc_minus1\000" )
.LC186:
	ASCII(.ascii	"cpb_cnt_minus1\000" )
	.space	1
.LC187:
	ASCII(.ascii	"cpb_cnt_minus1(%d) out of range(0,31).\012\000" )
.LC188:
	ASCII(.ascii	"bit_rate_value_minus1\000" )
	.space	2
.LC189:
	ASCII(.ascii	"cpb_size_value_minus1\000" )
	.space	2
.LC190:
	ASCII(.ascii	"cpb_size_du_value_minus1\000" )
	.space	3
.LC191:
	ASCII(.ascii	"bit_rate_du_value_minus1\000" )
	.space	3
.LC192:
	ASCII(.ascii	"vps_reserved_three_2bits(%d) not equal 0x3.\012\000" )
	.space	3
.LC193:
	ASCII(.ascii	"vps_max_layers_minus1 out of range(0,63).\012\000" )
	.space	1
.LC194:
	ASCII(.ascii	"vps_max_sub_layers_minus1=%d\012\000" )
	.space	2
.LC195:
	ASCII(.ascii	"vps_reserved_0xffff_16bits not equal 0xffff.\012\000" )
	.space	2
.LC196:
	ASCII(.ascii	"VPS HEVC_DecPTL error.\012\000" )
.LC197:
	ASCII(.ascii	"vps_num_layer_sets_minus1\000" )
	.space	2
.LC198:
	ASCII(.ascii	"vps_max_dec_pic_buffering_minus1[i]\000" )
.LC199:
	ASCII(.ascii	"vps_num_reorder_pics[i]\000" )
.LC200:
	ASCII(.ascii	"vps_max_latency_increase_plus1[i]\000" )
	.space	2
.LC201:
	ASCII(.ascii	"vps_num_layer_sets_minus1(%d) out of range(0,%d).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC202:
	ASCII(.ascii	"layer_id_included_flag[%d][%d]\000" )
	.space	1
.LC203:
	ASCII(.ascii	"vps_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC204:
	ASCII(.ascii	"vps_num_hrd_parameters\000" )
	.space	1
.LC205:
	ASCII(.ascii	"vps_num_hrd_parameters(%d) out of range(0,%d).\012\000" )
.LC206:
	ASCII(.ascii	"hrd_layer_set_idx\000" )
	.space	2
.LC207:
	ASCII(.ascii	"VPS HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC208:
	ASCII(.ascii	"pVPS->vps_video_parameter_set_id out of range(0,15)" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC209:
	ASCII(.ascii	"VPS[%d] decode error0.\012\000" )
.LC210:
	ASCII(.ascii	"VPS[%d] decode error1.\012\000" )
.LC211:
	ASCII(.ascii	"chroma_sample_loc_type_top_field\000" )
	.space	3
.LC212:
	ASCII(.ascii	"chroma_sample_loc_type_bottom_field\000" )
.LC213:
	ASCII(.ascii	"def_disp_win_left_offset\000" )
	.space	3
.LC214:
	ASCII(.ascii	"VUI pSps->chroma_format_idc out of range(0,3).\012\000" )
.LC215:
	ASCII(.ascii	"def_disp_win_right_offset\000" )
	.space	2
.LC216:
	ASCII(.ascii	"def_disp_win_top_offset\000" )
.LC217:
	ASCII(.ascii	"def_disp_win_bottom_offset\000" )
	.space	1
.LC218:
	ASCII(.ascii	"vui_num_ticks_poc_diff_one_minus1\000" )
	.space	2
.LC219:
	ASCII(.ascii	"VUI HEVC_DecHrdParam error.\012\000" )
	.space	3
.LC220:
	ASCII(.ascii	"min_spatial_segmentation_idc\000" )
	.space	3
.LC221:
	ASCII(.ascii	"VUI min_spatial_segmentation_idc out of range(0,409" )
	ASCII(.ascii	"5).\012\000" )
.LC222:
	ASCII(.ascii	"max_bytes_per_pic_denom\000" )
.LC223:
	ASCII(.ascii	"max_bits_per_min_cu_denom\000" )
	.space	2
.LC224:
	ASCII(.ascii	"log2_max_mv_length_horizontal\000" )
	.space	2
.LC225:
	ASCII(.ascii	"log2_max_mv_length_vertical\000" )
.LC226:
	ASCII(.ascii	"sop_seq_parameter_set_id\000" )
	.space	3
.LC227:
	ASCII(.ascii	"num_entries_in_sop_minus1\000" )
	.space	2
.LC228:
	ASCII(.ascii	"num_entries_in_sop_minus1 out of range(0,1024)\012\000" )
.LC229:
	ASCII(.ascii	"sop_short_term_rps_idx\000" )
	.space	1
.LC230:
	ASCII(.ascii	"sop_poc_delta\000" )
	.space	2
.LC231:
	ASCII(.ascii	"recovery_poc_cnt\000" )
	.space	3
.LC232:
	ASCII(.ascii	"colour_remap_id\000" )
.LC233:
	ASCII(.ascii	"colour_remap_coeffs\000" )
.LC234:
	ASCII(.ascii	"reserved_payload_extension_data\000" )
.LC235:
	ASCII(.ascii	"line:%d Cosume TotalPos(%d > %d)!!!\012\000" )
	.space	3
.LC236:
	ASCII(.ascii	"HEVC_SeiMessage HEVC_Sei_Payload error.\012\000" )
	.space	3
.LC237:
	ASCII(.ascii	"SEI HEVC_SeiMessage error.\012\000" )
.LC238:
	ASCII(.ascii	"SEI BsIsByteAligned error.\012\000" )
.LC239:
	ASCII(.ascii	"SEI rbsp_trailing_bits(%d) not equal 0x80.\012\000" )
.LC240:
	ASCII(.ascii	"nesting_num_ops_minus1\000" )
	.space	1
.LC241:
	ASCII(.ascii	"nesting_num_ops_minus1 out of range(0,%d)\012\000" )
	.space	1
.LC242:
	ASCII(.ascii	"nesting_op_idx\000" )
	.space	1
.LC243:
	ASCII(.ascii	"nesting_num_layers_minus1\000" )
	.space	2
.LC244:
	ASCII(.ascii	"nesting_num_layers_minus1 out of range(0,63)\012\000" )
	.space	2
.LC245:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta\000" )
	.space	2
.LC246:
	ASCII(.ascii	"scaling_list_pred_matrix_id_delta out of range(0,ma" )
	ASCII(.ascii	"trixId).\012\000" )
	.space	3
.LC247:
	ASCII(.ascii	"HEVC_DecScalingListData pMatrixAddress NULL.\012\000" )
	.space	2
.LC248:
	ASCII(.ascii	"scaling_list_dc_coef_minus8\000" )
.LC249:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-7,247).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC250:
	ASCII(.ascii	"scaling_list_delta_coef\000" )
.LC251:
	ASCII(.ascii	"scaling_list_dc_coef_minus8 out of range(-128,127)." )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC252:
	ASCII(.ascii	"chroma_format_idc\000" )
	.space	2
.LC253:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range(0,3).\012\000" )
.LC254:
	ASCII(.ascii	"pSPS->chroma_format_idc not equal(%d) 1.\012\000" )
	.space	2
.LC255:
	ASCII(.ascii	"pic_width_in_luma_samples\000" )
	.space	2
.LC256:
	ASCII(.ascii	"pic_width_in_luma_samples out of range(0,8192).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC257:
	ASCII(.ascii	"pic_height_in_luma_samples\000" )
	.space	1
.LC258:
	ASCII(.ascii	"pic_height_in_luma_samples out of range(0,4096).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC259:
	ASCII(.ascii	"ERROR Unkown level: %d\012\000" )
.LC260:
	ASCII(.ascii	"conf_win_left_offset\000" )
	.space	3
.LC261:
	ASCII(.ascii	"conf_win_right_offset\000" )
	.space	2
.LC262:
	ASCII(.ascii	"conf_win_left_offset+conf_win_right_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC263:
	ASCII(.ascii	"conf_win_top_offset\000" )
.LC264:
	ASCII(.ascii	"conf_win_bottom_offset\000" )
	.space	1
.LC265:
	ASCII(.ascii	"conf_win_top_offset+conf_win_bottom_offset out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC266:
	ASCII(.ascii	"bit_depth_luma_minus8\000" )
	.space	2
.LC267:
	ASCII(.ascii	"bit_depth_luma(%d) out of range(8,14).\012\000" )
.LC268:
	ASCII(.ascii	"bit_depth_chroma_minus8\000" )
.LC269:
	ASCII(.ascii	"bit_depth_chroma(%d) out of range[8,14].\012\000" )
	.space	2
.LC270:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	2
.LC271:
	ASCII(.ascii	"log2_max_pic_order_cnt_lsb_minus4 out of range[0,12" )
	ASCII(.ascii	"].\012\000" )
	.space	1
.LC272:
	ASCII(.ascii	"sps_max_dec_pic_buffering_minus1\000" )
	.space	3
.LC273:
	ASCII(.ascii	"sps_num_reorder_pics\000" )
	.space	3
.LC274:
	ASCII(.ascii	"sps_max_latency_increase_plus1\000" )
	.space	1
.LC275:
	ASCII(.ascii	"log2_min_coding_block_size_minus3\000" )
	.space	2
.LC276:
	ASCII(.ascii	"log2_min_luma_coding_block_size_minus3 out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC277:
	ASCII(.ascii	"log2_diff_max_min_coding_block_size\000" )
.LC278:
	ASCII(.ascii	"log2_diff_max_min_luma_coding_block_size out of ran" )
	ASCII(.ascii	"ge(0,3).\012\000" )
	.space	3
.LC279:
	ASCII(.ascii	"log2_ctb_sizeY out of range(4,6).\012\000" )
	.space	1
.LC280:
	ASCII(.ascii	"log2_min_transform_block_size_minus2\000" )
	.space	3
.LC281:
	ASCII(.ascii	"log2_min_transform_block_size_minus2 out of range(0" )
	ASCII(.ascii	",3).\012\000" )
	.space	3
.LC282:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size\000" )
	.space	1
.LC283:
	ASCII(.ascii	"log2_diff_max_min_transform_block_size out of range" )
	ASCII(.ascii	"(0,3).\012\000" )
	.space	1
.LC284:
	ASCII(.ascii	"quadtree_tu_log2_min_size not less than log2_min_cb" )
	ASCII(.ascii	"_sizeY.\012\000" )
.LC285:
	ASCII(.ascii	"quadtree_tu_log2_max_size greater than Min( CtbLog2" )
	ASCII(.ascii	"SizeY, 5 ).\012\000" )
.LC286:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter\000" )
.LC287:
	ASCII(.ascii	"max_transform_hierarchy_depth_inter out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC288:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra\000" )
.LC289:
	ASCII(.ascii	"max_transform_hierarchy_depth_intra out of range(0," )
	ASCII(.ascii	"CtbLog2SizeY-Log2MinTrafoSize).\012\000" )
.LC290:
	ASCII(.ascii	"SPS HEVC_DecScalingListData error.\012\000" )
.LC291:
	ASCII(.ascii	"SPS sao is off and pic height(%d) is too small.(Log" )
	ASCII(.ascii	"ic Unsupported).\012\000" )
	.space	3
.LC292:
	ASCII(.ascii	"log2_min_pcm_luma_coding_block_size_minus3\000" )
	.space	1
.LC293:
	ASCII(.ascii	"log2_min_pcm_coding_block_size_minus3(%d) out of ra" )
	ASCII(.ascii	"nge[0,2].\012\000" )
	.space	2
.LC294:
	ASCII(.ascii	"log2_diff_max_min_pcm_luma_coding_block_size\000" )
	.space	3
.LC295:
	ASCII(.ascii	"log2_diff_max_min_pcm_coding_block_size(%d) out of " )
	ASCII(.ascii	"range[0,2].\012\000" )
.LC296:
	ASCII(.ascii	"pcm_log2_max_size greater than Min( CtbLog2SizeY, 5" )
	ASCII(.ascii	" ).\012\000" )
.LC297:
	ASCII(.ascii	"num_short_term_ref_pic_sets\000" )
.LC298:
	ASCII(.ascii	"num_short_term_ref_pic_sets out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC299:
	ASCII(.ascii	"SPS HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	1
.LC300:
	ASCII(.ascii	"num_long_term_ref_pic_sps\000" )
	.space	2
.LC301:
	ASCII(.ascii	"num_long_term_ref_pic_sps out of range[0,32].\012\000" )
	.space	1
.LC302:
	ASCII(.ascii	"SPS HEVC_DecVuiParam error.\012\000" )
	.space	3
.LC303:
	ASCII(.ascii	"sps_video_parameter_set_id out of range(0,%d).\012\000" )
.LC304:
	ASCII(.ascii	"sps_max_sub_layers_minus1 out of range(0,%d).\012\000" )
	.space	1
.LC305:
	ASCII(.ascii	"SPS HEVC_DecPTL error.\012\000" )
.LC306:
	ASCII(.ascii	"sps_seq_parameter_set_id\000" )
	.space	3
.LC307:
	ASCII(.ascii	"sps_seq_parameter_set_id out of range(0,%d).\012\000" )
	.space	2
.LC308:
	ASCII(.ascii	"SPS[%d] decode error0.\012\000" )
.LC309:
	ASCII(.ascii	"SPS[%d] decode error.\012\000" )
	.space	1
.LC310:
	ASCII(.ascii	"pps_seq_parameter_set_id\000" )
	.space	3
.LC311:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range[0,15].\012\000" )
	.space	2
.LC312:
	ASCII(.ascii	"SPS(%d) haven't decode.\012\000" )
	.space	3
.LC313:
	ASCII(.ascii	"num_ref_idx_l0_default_active_minus1\000" )
	.space	3
.LC314:
	ASCII(.ascii	"num_ref_idx_l0_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC315:
	ASCII(.ascii	"num_ref_idx_l1_default_active_minus1\000" )
	.space	3
.LC316:
	ASCII(.ascii	"num_ref_idx_l1_default_active out of range[0,15].\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC317:
	ASCII(.ascii	"init_qp_minus26\000" )
.LC318:
	ASCII(.ascii	"pic_init_qp(%d) out of range[-%d,51].\012\000" )
	.space	1
.LC319:
	ASCII(.ascii	"diff_cu_qp_delta_depth\000" )
	.space	1
.LC320:
	ASCII(.ascii	"diff_cu_qp_delta_depth out of range[0,3].\012\000" )
	.space	1
.LC321:
	ASCII(.ascii	"pps_cb_qp_offset\000" )
	.space	3
.LC322:
	ASCII(.ascii	"pic_cb_qp_offset out of range[-12,12].\012\000" )
.LC323:
	ASCII(.ascii	"pps_cr_qp_offset\000" )
	.space	3
.LC324:
	ASCII(.ascii	"pic_cr_qp_offset out of range[-12,12].\012\000" )
.LC325:
	ASCII(.ascii	"num_tile_columns_minus1\000" )
.LC326:
	ASCII(.ascii	"num_tile_columns(%d) out of range(0,%d).\012\000" )
	.space	2
.LC327:
	ASCII(.ascii	"num_tile_rows_minus1\000" )
	.space	3
.LC328:
	ASCII(.ascii	"num_tile_rows out(%d) of range(0,%d).\012\000" )
	.space	1
.LC329:
	ASCII(.ascii	"Logic limit(%d), num_tile_columns(%d) exceed.\012\000" )
	.space	1
.LC330:
	ASCII(.ascii	"Logic limit(%d), num_tile_rows(%d) exceed.\012\000" )
.LC331:
	ASCII(.ascii	"column_width_minus1\000" )
.LC332:
	ASCII(.ascii	"column_width[%d](%d) out of range (0 %d)\012\000" )
	.space	2
.LC333:
	ASCII(.ascii	"row_height_minus1\000" )
	.space	2
.LC334:
	ASCII(.ascii	"row_height[%d](%d) out of range (0 %d)\012\000" )
.LC335:
	ASCII(.ascii	"column_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	2
.LC336:
	ASCII(.ascii	"row_bd[%d](%d) <= 0, invalid!\012\000" )
	.space	1
.LC337:
	ASCII(.ascii	"PPS tile width(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC338:
	ASCII(.ascii	"PPS tile height(%d) is too small.(Logic Unsupport)\012" )
	ASCII(.ascii	"\000" )
.LC339:
	ASCII(.ascii	"pps_beta_offset_div2\000" )
	.space	3
.LC340:
	ASCII(.ascii	"pps_beta_offset_div2(%d) out of range(-6,6).\012\000" )
	.space	2
.LC341:
	ASCII(.ascii	"pps_tc_offset_div2\000" )
	.space	1
.LC342:
	ASCII(.ascii	"pps_tc_offset_div2(%d) out of range(-6,6).\012\000" )
.LC343:
	ASCII(.ascii	"PPS HEVC_DecScalingListData error.\012\000" )
.LC344:
	ASCII(.ascii	"log2_parallel_merge_level_minus2\000" )
	.space	3
.LC345:
	ASCII(.ascii	"log2_parallel_merge_level(%d) out of range(2,log2_c" )
	ASCII(.ascii	"tb_sizeY).\012\000" )
	.space	1
.LC346:
	ASCII(.ascii	"pps_pic_parameter_set_id\000" )
	.space	3
.LC347:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range(0,%d).\012\000" )
	.space	2
.LC348:
	ASCII(.ascii	"PPS[%d] decode error.\012\000" )
	.space	1
.LC349:
	ASCII(.ascii	"luma_log2_weight_denom\000" )
	.space	1
.LC350:
	ASCII(.ascii	"luma_log2_weight_denom out of range(0,7).\012\000" )
	.space	1
.LC351:
	ASCII(.ascii	"delta_chroma_log2_weight_denom\000" )
	.space	1
.LC352:
	ASCII(.ascii	"delta_chroma_log2_weight_denom out of range(-7,7).\012" )
	ASCII(.ascii	"\000" )
.LC353:
	ASCII(.ascii	"chroma_log2_weight_denom out of range(0,7).\012\000" )
	.space	3
.LC354:
	ASCII(.ascii	"delta_luma_weight_l0\000" )
	.space	3
.LC355:
	ASCII(.ascii	"delta_luma_weight_l0(%d) out of range(-128,127).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC356:
	ASCII(.ascii	"luma_offset_l0\000" )
	.space	1
.LC357:
	ASCII(.ascii	"luma_offset_l0(%d) out of range(-128,127).\012\000" )
.LC358:
	ASCII(.ascii	"delta_chroma_weight_l0\000" )
	.space	1
.LC359:
	ASCII(.ascii	"delta_chroma_weight_l0 out of range(-128,127).\012\000" )
.LC360:
	ASCII(.ascii	"delta_chroma_offset_l0\000" )
	.space	1
.LC361:
	ASCII(.ascii	"delta_chroma_offset_l0 out of range(-512,511).\012\000" )
.LC362:
	ASCII(.ascii	"delta_luma_weight_l1\000" )
	.space	3
.LC363:
	ASCII(.ascii	"delta_luma_weight_l1 out of range(-128,127).\012\000" )
	.space	2
.LC364:
	ASCII(.ascii	"luma_offset_l1\000" )
	.space	1
.LC365:
	ASCII(.ascii	"luma_offset_l1 out of range(-128,127).\012\000" )
.LC366:
	ASCII(.ascii	"delta_chroma_weight_l1\000" )
	.space	1
.LC367:
	ASCII(.ascii	"delta_chroma_weight_l1 out of range(-128,127).\012\000" )
.LC368:
	ASCII(.ascii	"delta_chroma_offset_l1\000" )
	.space	1
.LC369:
	ASCII(.ascii	"delta_chroma_offset_l1 out of range(-512,511).\012\000" )
.LC370:
	ASCII(.ascii	"slice_pic_parameter_set_id\000" )
	.space	1
.LC371:
	ASCII(.ascii	"%s: pic_parameter_set_id(%d) out of range(0 %d)!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC372:
	ASCII(.ascii	"HEVC_VpsSpsPpsCheck != HEVC_DEC_NORMAL\012\000" )
.LC373:
	ASCII(.ascii	"max_cu_width(%d)/max_cu_height(%d) = 0\012\000" )
.LC374:
	ASCII(.ascii	"slice_segment_address(%d) out of range(0,%d).\012\000" )
	.space	1
.LC375:
	ASCII(.ascii	"slice_type\000" )
	.space	1
.LC376:
	ASCII(.ascii	"slice_reserved_flag: %d\012\000" )
	.space	3
.LC377:
	ASCII(.ascii	"slice_type(%d) out of range(0,2].\012\000" )
	.space	1
.LC378:
	ASCII(.ascii	"HEVC_ClearDPB,LastDisplayPoc:%d poc:%d \012\000" )
	.space	3
.LC379:
	ASCII(.ascii	"SH HEVC_DecShortTermRefPicSet error.\012\000" )
	.space	2
.LC380:
	ASCII(.ascii	"short_term_ref_pic_set_idx(%d) out of range[0,%d].\012" )
	ASCII(.ascii	"\000" )
.LC381:
	ASCII(.ascii	"num_long_term_sps\000" )
	.space	2
.LC382:
	ASCII(.ascii	"num_long_term_sps(%d) out of range[0,%d].\012\000" )
	.space	1
.LC383:
	ASCII(.ascii	"num_long_term_pics\000" )
	.space	1
.LC384:
	ASCII(.ascii	"SH ERROR: (num_negative_pics(%d) + num_positive_pic" )
	ASCII(.ascii	"s(%d) + num_of_longterm_pics(%d)) > %d\012\000" )
	.space	1
.LC385:
	ASCII(.ascii	"lt_idx_sps[%d] = %d, but out of range[0,%d].\012\000" )
	.space	2
.LC386:
	ASCII(.ascii	"delta_poc_msb_cycle_lt\000" )
	.space	1
.LC387:
	ASCII(.ascii	"ERROR: pRPS->num_of_pics(%d) > %d.\012\000" )
.LC388:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC389:
	ASCII(.ascii	"num_ref_idx_l0_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC390:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC391:
	ASCII(.ascii	"num_ref_idx_l1_active(%d) out of range(0,%d).\012\000" )
	.space	1
.LC392:
	ASCII(.ascii	"pRPS is null.\012\000" )
	.space	1
.LC393:
	ASCII(.ascii	"pRPS->num_of_pics out(%d) of range(0,%d).\012\000" )
	.space	1
.LC394:
	ASCII(.ascii	"SH HEVC_DecRefPicListsModification error.\012\000" )
	.space	1
.LC395:
	ASCII(.ascii	"collocated_ref_idx\000" )
	.space	1
.LC396:
	ASCII(.ascii	"collocated_from_l0_flag=%d, collocated_ref_idx(%d) " )
	ASCII(.ascii	"out of range(0,%d).\012\000" )
.LC397:
	ASCII(.ascii	"SH HEVC_DecPredWeightTable error.\012\000" )
	.space	1
.LC398:
	ASCII(.ascii	"five_minus_max_num_merge_cand\000" )
	.space	2
.LC399:
	ASCII(.ascii	"SH max_num_merge_cand(%d) out of range(1,5).\012\000" )
	.space	2
.LC400:
	ASCII(.ascii	"slice_qp_delta\000" )
	.space	1
.LC401:
	ASCII(.ascii	"SH slice_qp(%d) out of range [-%d,51].\012\000" )
.LC402:
	ASCII(.ascii	"slice_cb_qp_offset\000" )
	.space	1
.LC403:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC404:
	ASCII(.ascii	"SH slice_cb_qp_offset(%d)+pic_cb_qp_offset(%d) out " )
	ASCII(.ascii	"of range[-12,12].\012\000" )
	.space	2
.LC405:
	ASCII(.ascii	"slice_cr_qp_offset\000" )
	.space	1
.LC406:
	ASCII(.ascii	"SH slice_cr_qp_offset(%d) out of range[-12,12].\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC407:
	ASCII(.ascii	"SH slice_cr_qp_offset+pPPS->pic_cr_qp_offset(%d) ou" )
	ASCII(.ascii	"t of range[-12,12].\012\000" )
.LC408:
	ASCII(.ascii	"slice_beta_offset_div2\000" )
	.space	1
.LC409:
	ASCII(.ascii	"SH slice_beta_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC410:
	ASCII(.ascii	"slice_tc_offset_div2\000" )
	.space	3
.LC411:
	ASCII(.ascii	"SH slice_tc_offset_div2(%d) out of range(-6,6).\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC412:
	ASCII(.ascii	"num_entry_point_offsets\000" )
.LC413:
	ASCII(.ascii	"CurrSlice.num_entry_point_offsets(%d) out of range[" )
	ASCII(.ascii	"0,%d].\012\000" )
	.space	1
.LC414:
	ASCII(.ascii	"offset_len_minus1\000" )
	.space	2
.LC415:
	ASCII(.ascii	"CurrSlice.offset_len(%d) out of range[1,32].\012\000" )
	.space	2
.LC416:
	ASCII(.ascii	"slice_segment_header_extension_length\000" )
	.space	2
.LC417:
	ASCII(.ascii	"slice_segment_header_extension_length(%d) out of ra" )
	ASCII(.ascii	"nge [0,256]\012\000" )
.LC418:
	ASCII(.ascii	"bitsLeft(%d) < slice_segment_header_extension_lengt" )
	ASCII(.ascii	"h(%d)\012\000" )
	.space	2
.LC419:
	ASCII(.ascii	"%s arrange mem failed.\012\000" )
.LC420:
	ASCII(.ascii	"Init dec para\012\000" )
	.space	1
.LC421:
	ASCII(.ascii	"%s: Get context addr failed!\012\000" )
	.space	2
.LC422:
	ASCII(.ascii	"%s FATAL: MemOffset %d > ContextMemSize %d.\012\000" )
	.space	3
.LC423:
	ASCII(.ascii	"%s: VCTRL_GetChanIDByCtx() return -1!\012\000" )
	.space	1
.LC424:
	ASCII(.ascii	"BitDepthChange ReRange FS Luma(%d-->%d),Chroma(%d -" )
	ASCII(.ascii	"->%d)\012\000" )
	.space	2
.LC425:
	ASCII(.ascii	"HEVC_InitDPB error, return %d\012\000" )
	.space	1
.LC426:
	ASCII(.ascii	"HEVC_AllocFrameStore error\012\000" )
.LC427:
	ASCII(.ascii	"%s: pstLogicFsImage is NULL!\012\000" )
	.space	2
.LC428:
	ASCII(.ascii	"HEVC InsertVO Failed return %d, ClearAll\012\000" )
	.space	2
.LC429:
	ASCII(.ascii	"HEVC.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC430:
	ASCII(.ascii	"[%d]disp=%d,poc=%d,lpoc=%d,no=%d,pics=%d,cpoc=%d,fl" )
	ASCII(.ascii	"ag=%d\012\000" )
	.space	2
.LC431:
	ASCII(.ascii	"%s: FirstFrameFastOut LastPoc: %d, CurPos: %d!\012\000" )
.LC432:
	ASCII(.ascii	"%s call HEVC_GetUnRefPicWithMinPoc failed\012\000" )
	.space	1
.LC433:
	ASCII(.ascii	"%s call HEVC_OutputOneFrmFromDPB failed\012\000" )
	.space	3
.LC434:
	ASCII(.ascii	"%s: HEVC_OutputFrmToVO err!\012\000" )
	.space	3
.LC435:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC436:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC437:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC438:
	ASCII(.ascii	"No frame store available!\012\000" )
	.space	1
.LC439:
	ASCII(.ascii	"%s ReadImgNum = %d, NewImgNum = %d, FrameStore leak" )
	ASCII(.ascii	", ClearAll!\012\000" )
.LC440:
	ASCII(.ascii	"%s: flush dpb failed, return %d\012\000" )
	.space	3
.LC441:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), need to incr" )
	ASCII(.ascii	"ease DPB size.\012\000" )
	.space	1
.LC442:
	ASCII(.ascii	"%s call HEVC_IncreaseDPBSize failed\012\000" )
	.space	3
.LC443:
	ASCII(.ascii	"%s: DPB.used_size(%d) >= DPB.size(%d), output minpo" )
	ASCII(.ascii	"c frame.\012\000" )
	.space	3
.LC444:
	ASCII(.ascii	"%s with invalid pos(%d)\012\000" )
	.space	3
.LC445:
	ASCII(.ascii	"%s get APC error, ret %d\012\000" )
	.space	2
.LC446:
	ASCII(.ascii	"%s %d: InsertFrmInDPB failed, return %d\012\000" )
	.space	3
.LC447:
	ASCII(.ascii	"%s call HEVC_CheckFrameStore failed!\012\000" )
	.space	2
.LC448:
	ASCII(.ascii	"%s call HEVC_RemoveUnUsedFrameStore Failed.\012\000" )
	.space	3
.LC449:
	ASCII(.ascii	"%s call HEVC_InsertFrmInDPB Failed.\012\000" )
	.space	3
.LC450:
	ASCII(.ascii	"%s call HEVC_FirstFrameFastOut Failed\012\000" )
	.space	1
.LC451:
	ASCII(.ascii	"DPB.used_size may bigger than DPB.size\012\000" )
.LC452:
	ASCII(.ascii	"HEVC_InsertFrmInDPB Failed, ret = %d\012\000" )
	.space	2
.LC453:
	ASCII(.ascii	"%s call HEVC_OutputFrmFromDPB failed\012\000" )
	.space	2
.LC454:
	ASCII(.ascii	"%s CurrPic.state = HEVC_PIC_EMPTY, return HEVC_DEC_" )
	ASCII(.ascii	"NORMAL\012\000" )
	.space	1
.LC455:
	ASCII(.ascii	"Discard cur pic, ErrLevel(%d) > OutErrThr(%d)\012\000" )
	.space	1
.LC456:
	ASCII(.ascii	"%s call HEVC_IModeProcess Failed\012\000" )
	.space	2
.LC457:
	ASCII(.ascii	"HEVC_StorePicInDpb return(%d) from L%d\012\000" )
.LC458:
	ASCII(.ascii	"%s call HEVC_SimpleDPBProcess Failed\012\000" )
	.space	2
.LC459:
	ASCII(.ascii	"%s call HEVC_DecOrderProcess Failed\012\000" )
	.space	3
.LC460:
	ASCII(.ascii	"%s call HEVC_DispOrderProcess Failed\012\000" )
	.space	2
.LC461:
	ASCII(.ascii	"%s return HEVC_DEC_ERR\012\000" )
.LC462:
	ASCII(.ascii	"No frame store for lost pic.\012\000" )
	.space	2
.LC463:
	ASCII(.ascii	"DPB ERROR: Can not get ref_fs!\012\000" )
.LC464:
	ASCII(.ascii	"DPB no suited fs for lost pic.\012\000" )
.LC465:
	ASCII(.ascii	"Take poc(%d) to creat lost poc(%d).\012\000" )
	.space	3
.LC466:
	ASCII(.ascii	"DPB ERROR: Ref DecodeFs = NULL, ClearDPB!\012\000" )
	.space	1
.LC467:
	ASCII(.ascii	"ERROR: Can not new logic fs!\012\000" )
	.space	2
.LC468:
	ASCII(.ascii	"Lost pic insert in DPB Failed!\012\000" )
.LC469:
	ASCII(.ascii	"Ref frame(poc %d) lost.\012\000" )
	.space	3
.LC470:
	ASCII(.ascii	"s32OutErrThr = %d,drop poc %d because lost ref fram" )
	ASCII(.ascii	"e(pod %d)\012\000" )
	.space	2
.LC471:
	ASCII(.ascii	"%s call HEVC_FlushOutputFrmFromDPB failed\012\000" )
	.space	1
.LC472:
	ASCII(.ascii	"%s call HEVC_EmptyFrmFromDPB failed\012\000" )
	.space	3
.LC473:
	ASCII(.ascii	"Init pic err, exit\012\000" )
.LC474:
	ASCII(.ascii	"HEVC_WritePicMsg failed!\012\000" )
	.space	2
.LC475:
	ASCII(.ascii	"Start Reason: SliceParaNum= %d\012\000" )
.LC476:
	ASCII(.ascii	"Too many slice , err!\012\000" )
	.space	1
.LC477:
	ASCII(.ascii	"Cur pic not init yet, discard this slice!\012\000" )
	.space	1
.LC478:
	ASCII(.ascii	"Dec List error, ret=%d\012\000" )
.LC479:
	ASCII(.ascii	"Ref List is Wrong!\012\000" )
.LC480:
	ASCII(.ascii	"HEVC_WriteSliceMsg err.\012\000" )
	.space	3
.LC481:
	ASCII(.ascii	"HEVC_StorePicInDPB failed, ret = %d\012\000" )
	.space	3
.LC482:
	ASCII(.ascii	"DecVDM no slice and needn't start VDM, but MaxBytes" )
	ASCII(.ascii	"Received exceed threshold!\012\000" )
	.space	1
.LC483:
	ASCII(.ascii	"DecVDM no slice and needn't start VDM\012\000" )
	.space	1
.LC484:
	ASCII(.ascii	"IPBDecMode Changed (%d -> %d)\012\000" )
	.space	1
.LC485:
	ASCII(.ascii	"Discard this B(poc=%d) before P, is_ref_idc=%d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC486:
	ASCII(.ascii	"VDM start, TotalPicNum=%d.\012\000" )
.LC487:
	ASCII(.ascii	"%s no correct slice in the pic\012\000" )
.LC488:
	ASCII(.ascii	"metadatasize is too large:%d at line:%d\012\000" )
	.space	3
.LC489:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC490:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC491:
	ASCII(.ascii	"*****[%s][%d],BL Codec can only dec BL stream!!****" )
	ASCII(.ascii	"*\012\000" )
	.space	2
.LC492:
	ASCII(.ascii	"%s: Metadata map failed\012\000" )
	.space	3
.LC493:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC494:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC495:
	ASCII(.ascii	"VPS decode error.\012\000" )
	.space	1
.LC496:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC497:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC498:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC499:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d\012\000" )
.LC500:
	ASCII(.ascii	"CtbNumOneFrame=%d, SedEnd0=%d\012\000" )
	.space	1
.LC501:
	ASCII(.ascii	"HEVC_DecSliceSegmentHeader dec err\012\000" )
.LC502:
	ASCII(.ascii	"CurBitsLen = %d, MinBitsLen = %d\012\000" )
	.space	2
.LC503:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pPacket!\012\000" )
	.space	1
.LC504:
	ASCII(.ascii	"HevcCtx not init!\012\000" )
	.space	1
.LC505:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC506:
	ASCII(.ascii	"%s last frame fs unrelease, fix it!\012\000" )
	.space	3
.LC507:
	ASCII(.ascii	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\012" )
	ASCII(.ascii	"\000" )
.LC508:
	ASCII(.ascii	"HEVC_InquireSliceProperty error.\012\000" )
	.space	2
.LC509:
	ASCII(.ascii	"HEVC_DecOneNal ERR\012\000" )
.LC510:
	ASCII(.ascii	"%s pstLogicFsImage is NULL!\012\000" )
	.space	3
.LC511:
	ASCII(.ascii	"%s InsertVO err:%d, ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
.LANCHOR2 = . + 458304
.LANCHOR3 = . + 605616
.LANCHOR5 = . + 646536
	.type	s_auiSigLastScan, %object
	.size	s_auiSigLastScan, 458752
s_auiSigLastScan:
	.space	458752
	.type	g_TsToRsMap, %object
	.size	g_TsToRsMap, 147456
g_TsToRsMap:
	.space	147456
	.type	g_IsDeced, %object
	.size	g_IsDeced, 36864
g_IsDeced:
	.space	36864
	.type	s_TmpParam, %object
	.size	s_TmpParam, 26164
s_TmpParam:
	.space	26164
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
