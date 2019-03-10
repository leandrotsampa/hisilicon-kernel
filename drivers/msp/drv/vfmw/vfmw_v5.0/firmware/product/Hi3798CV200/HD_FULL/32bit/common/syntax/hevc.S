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
	.type	HEVC_SetFrmRepeatCount.part.4, %function
HEVC_SetFrmRepeatCount.part.4:
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
	ldr	ip, [r0, #276]
	ldr	r2, [r0, #2504]
	ldr	r3, [r0, #272]
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
	ldrhi	r3, [r0, #276]
	ldrls	r3, [r0, #276]
	addhi	r3, r3, #2
	addls	r3, r3, #1
	str	r3, [r0, #276]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVC_SetFrmRepeatCount.part.4, .-HEVC_SetFrmRepeatCount.part.4
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
	add	r3, r1, #324
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
	add	r3, r0, #324
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
	ldr	r3, [r7, #2840]
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
	ldr	r2, [r6, #2128]
	ldr	r1, .L107+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2128]
	cmp	r3, #0
	addne	r5, r7, #2320
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
	ldr	r0, [r7, #244]
	bl	FSP_GetLogicFs
	ldr	r1, .L107+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L91:
	ldr	r1, .L107+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2128]
	cmp	r3, r4
	bhi	.L93
.L94:
	ldr	r2, [r6, #2132]
	mov	r0, #1
	ldr	r1, .L107+24
	bl	dprint_vfmw
	ldr	r3, [r6, #2132]
	cmp	r3, #0
	addne	r5, r7, #2400
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
	ldr	r0, [r7, #244]
	bl	FSP_GetLogicFs
	ldr	r1, .L107+16
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
.L96:
	ldr	r1, .L107+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #2132]
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
	addne	r8, r8, #576
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
	add	r6, r5, #2864
	bl	dprint_vfmw
	ldr	r3, [r5, #2800]
	ldr	r2, [r7, #2804]!
	mov	r0, #1
	ldr	r1, .L121+4
	add	r5, r5, #2928
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
	ldr	r1, [r9, #2520]
	ldr	lr, [r9, #2516]
	mov	r0, #1
	ldr	ip, [r9, #2524]
	ldr	r3, [r9, #2508]
	ldr	r2, [r9, #2504]
	stmia	sp, {r1, ip, lr}
	ldr	r1, .L139+4
	bl	dprint_vfmw
	ldr	r3, [r9, #2508]
	cmp	r3, #0
	addne	r4, r9, #2512
	movne	r5, #0
	addne	r4, r4, #12
	beq	.L128
.L127:
	ldr	r3, [r4, #4]!
	ldr	r0, [r9, #244]
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
	ldr	r0, [r9, #244]
	bl	FSP_GetRef
	ldr	r3, [r4]
	ldr	r1, [r3, #32]
	mov	r7, r0
	ldr	r0, [r9, #244]
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
	ldr	r3, [r9, #2508]
	cmp	r3, r5
	bhi	.L127
.L128:
	ldr	r1, .L139+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #2508]
	cmp	r3, #0
	addne	r5, r9, #2512
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
	ldr	r3, [r9, #2508]
	add	r6, r6, #1
	cmp	r3, r6
	bls	.L126
.L135:
	ldr	r3, [r5, #4]!
	ldr	r0, [r9, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r4, r0
	ldr	r0, [r9, #244]
	bl	FSP_GetDecPhyFs
	ldr	r3, [r5]
	ldr	r1, [r3, #32]
	mov	r8, r0
	ldr	r0, [r9, #244]
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
	ldr	r3, [r3, #1252]
	cmp	r3, #0
	bne	.L151
	ldr	r2, [r0, #2324]
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	ldr	r0, [r4, #2308]
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
	ldr	r3, [r5, #3744]
	mov	r8, r1
	ldr	r2, [r5, #3740]
	ldr	r7, [r3, #68]
	ldr	r9, [r3, #72]
	ldr	r2, [r2, #148]
	sub	r3, r7, #1
	cmp	r3, #9
	str	r2, [fp, #-52]
	bhi	.L185
	sub	r3, r9, #1
	cmp	r3, #10
	bhi	.L186
	ldr	r4, .L187
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
	ble	.L166
	ldr	r3, [fp, #-52]
	mov	r2, #0
	mov	r1, r2
	mov	r0, r6
	sub	r10, r3, #4
.L165:
	str	r2, [r6, r1, asl #3]
	mov	r3, r2, asl r10
	ldr	ip, [r5, #3744]
	add	ip, ip, r1, lsl #1
	ldrsh	ip, [ip, #176]
	add	r2, ip, r2
	sub	ip, r2, #1
	str	ip, [r0, #4]
	mov	lr, r2, asl r10
	cmp	r3, lr
	bge	.L171
	cmp	r3, #255
	bhi	.L167
	uxtb	r4, r1
	add	ip, r8, r3
	b	.L169
.L170:
	cmp	r3, #256
	beq	.L167
.L169:
	add	r3, r3, #1
	strb	r4, [ip], #1
	cmp	r3, lr
	bne	.L170
.L171:
	add	r1, r1, #1
	add	r0, r0, #8
	cmp	r1, r7
	bne	.L165
.L166:
	cmp	r9, #0
	ble	.L163
	ldr	r3, [fp, #-52]
	mov	ip, #0
	ldr	r7, [fp, #-48]
	mov	lr, ip
	sub	r4, r3, #4
	mov	r6, r7
.L173:
	str	ip, [r7, lr, asl #3]
	mov	r3, ip, asl r4
	ldr	r2, [r5, #3744]
	add	r2, r2, lr, lsl #1
	ldrsh	r2, [r2, #216]
	add	ip, r2, ip
	sub	r2, ip, #1
	str	r2, [r6, #4]
	mov	r1, ip, asl r4
	cmp	r3, r1
	bge	.L178
	cmp	r3, #255
	bhi	.L174
	add	r2, r3, #255
	uxtb	r0, lr
	add	r2, r8, r2
	b	.L176
.L177:
	cmp	r3, #256
	beq	.L174
.L176:
	add	r3, r3, #1
	strb	r0, [r2, #1]!
	cmp	r3, r1
	bne	.L177
.L178:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, r9
	bne	.L173
.L163:
	mov	r0, #0
	b	.L159
.L167:
	ldr	r2, .L187+4
	mov	r0, #1
	ldr	r1, .L187+8
	bl	dprint_vfmw
	mvn	r0, #0
.L159:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L174:
	ldr	r2, .L187+4
	mov	r0, #1
	ldr	r1, .L187+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L159
.L186:
	mov	r1, #11
	mov	r3, r9
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L187+4
	ldr	r1, .L187+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L159
.L185:
	mov	r1, #10
	mov	r3, r7
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L187+4
	ldr	r1, .L187+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L159
.L188:
	.align	2
.L187:
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
	beq	.L213
	cmp	r1, #0
	beq	.L214
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
.L193:
	ldrb	r5, [r2, #1]!	@ zero_extendqisi2
	ldrb	r4, [r0, #1]!	@ zero_extendqisi2
	cmp	r5, r4
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r7
	bne	.L193
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
.L194:
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
	bls	.L194
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
	beq	.L195
	add	r7, r10, #148
	add	r5, r1, #148
	mov	r9, #1
.L196:
	mov	r0, r5
	mov	r2, r7
	mov	r3, #0
.L197:
	ldr	lr, [r2, #4]!
	add	r3, r3, #1
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	movne	r6, #0
	andeq	r6, r6, #1
	cmp	r3, r4
	bls	.L197
	add	r9, r9, #1
	add	r7, r7, #4
	cmp	r9, r8
	add	r5, r5, #4
	bls	.L196
.L195:
	ldrb	r3, [r10, #6]	@ zero_extendqisi2
	ldrb	r2, [r1, #6]	@ zero_extendqisi2
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
	cmp	r3, #0
	beq	.L198
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
	bne	.L215
.L199:
	ldr	r2, [r10, #48]
	ldr	r3, [r1, #48]
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
.L198:
	eor	r6, r6, #1
	rsb	r0, r6, #0
.L191:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L215:
	ldr	r2, [r10, #44]
	ldr	r3, [r1, #44]
	cmp	r2, r3
	movne	r6, #0
	andeq	r6, r6, #1
	b	.L199
.L214:
	mov	r0, r1
	movw	r3, #1899
	ldr	r2, .L216
	ldr	r1, .L216+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L191
.L213:
	movw	r3, #1898
	ldr	r2, .L216
	ldr	r1, .L216+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L191
.L217:
	.align	2
.L216:
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
	ldr	r2, [r0, #2308]
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
	ldr	r3, .L226
	mov	r5, r1
	mov	r2, #32
	ldr	r1, [r0, #2308]
	sub	r0, fp, #52
	ldr	r3, [r3, #52]
	mov	r5, r5, asl #3
	blx	r3
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	cmp	r3, r5
	movcs	r0, #0
	bcc	.L225
.L220:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L225:
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsShow
	cmp	r0, #0
	moveq	r0, #1
	beq	.L220
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
	b	.L221
.L222:
	bl	BsSkip
	ldr	r3, [fp, #-28]
	ldr	r4, [fp, #-24]
	rsb	r4, r4, r3
.L221:
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
	bne	.L222
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L227:
	.align	2
.L226:
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
	beq	.L236
	mov	r1, #8
	ldr	r0, [r0, #2308]
	bl	BsGet
	sub	r4, r7, #1
	add	r8, r7, #47
	mov	r3, r0
	cmp	r3, #0
	str	r0, [r7, #48]
	str	r0, [r7, #52]
	bne	.L230
.L241:
	add	r5, r4, #16
.L231:
	mov	r1, #8
	ldr	r0, [r6, #2308]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r5
	bne	.L231
.L232:
	cmp	r5, r8
	mov	r4, r5
	beq	.L237
.L243:
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L241
.L230:
	cmp	r3, #1
	beq	.L242
	cmp	r3, #2
	addne	r5, r4, #16
	bne	.L232
	mov	r1, #32
	ldr	r0, [r6, #2308]
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
	bne	.L243
.L237:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L242:
	mov	r1, #16
	ldr	r0, [r6, #2308]
	bl	BsGet
	add	r5, r4, #16
	mov	r3, r0, lsr #8
	strb	r0, [r4, #2]
	strb	r3, [r4, #1]
	b	.L232
.L236:
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
	beq	.L246
	ldr	r0, [r0, #2308]
	mov	r1, #1
	bl	BsGet
	mov	r3, r4
	strb	r0, [r5]
.L245:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L246:
	mvn	r3, #0
	b	.L245
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
	beq	.L250
	add	r7, r1, #12
	mov	r4, r1
	mov	r3, #1
	strb	r3, [r1]
.L249:
	mov	r1, #16
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #4]!
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r4, r7
	str	r0, [r4, #12]
	bne	.L249
	mov	r1, #16
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r6, #28]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #32]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r3, #0
	str	r0, [r6, #40]
.L248:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L250:
	mvn	r3, #0
	b	.L248
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
	beq	.L254
	mov	r3, #1
	mov	r1, #16
	strb	r3, [r5]
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #16
	strh	r0, [r5, #2]	@ movhi
	ldr	r0, [r6, #2308]
	bl	BsGet
	mov	r3, r4
	strh	r0, [r5, #4]	@ movhi
.L253:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L254:
	mvn	r3, #0
	b	.L253
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
	beq	.L257
	ldr	r0, [r0, #2308]
	mov	r1, #8
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
	beq	.L260
	mov	r1, #1
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6]
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r6, #4]
	ldr	r0, [r5, #2308]
	bl	BsToNextByte
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L260:
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
	beq	.L264
	mov	r1, #1
	ldr	r0, [r0, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #2]
	cmp	r0, #0
	beq	.L265
.L263:
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L265:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r5, #3]
	b	.L263
.L264:
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
	ldr	r3, .L267
	mov	r4, r0
	add	r0, r0, #28160
	mov	r2, #80
	mov	r1, #0
	add	r0, r0, #72
	ldr	r3, [r3, #48]
	mov	r5, #0
	blx	r3
	add	r3, r4, #4544
	add	r0, r4, #4096
	add	r1, r3, #2096
	add	r3, r3, #2080
	mov	r4, #0
	mov	r2, #0
	strd	r4, [r1]
	strd	r4, [r3, #-8]
	strd	r4, [r3]
	strd	r4, [r1, #-8]
	str	r2, [r0, #428]
	str	r2, [r0, #432]
	str	r2, [r0, #420]
	str	r2, [r0, #424]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L268:
	.align	2
.L267:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	HEVC_Sei_ParsePts_Init, .-HEVC_Sei_ParsePts_Init
	.align	2
	.global	HEVC_Sei_Get_Dpb_Output_Time
	.type	HEVC_Sei_Get_Dpb_Output_Time, %function
HEVC_Sei_Get_Dpb_Output_Time:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	add	r3, r0, #53248
	ldr	r5, [r0, #2320]
	movw	r6, #2024
	ldr	ip, [r3, #2044]
	add	r3, r0, #24576
	ldr	lr, [r1, #12]
	ldr	r4, [r0, #2316]
	mla	ip, r6, ip, r5
	movw	r5, #26164
	ldr	r6, [r3, #3660]
	cmp	r6, #1
	ldr	ip, [ip, #32]
	str	lr, [r3, #3680]
	ldr	lr, [r1, #16]
	mla	r1, r5, ip, r4
	str	lr, [r3, #3684]
	ldr	lr, [r2, #76]
	str	lr, [r3, #3704]
	ldr	ip, [r2, #80]
	str	ip, [r3, #3708]
	ldr	ip, [r1, #56]
	add	r1, r1, ip, lsl #2
	ldrb	r7, [r1, #412]	@ zero_extendqisi2
	beq	.L277
	ldrb	r1, [r3, #3729]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L278
	add	ip, r0, #4544
	add	r6, r0, #4096
	add	r1, ip, #2080
	add	r4, ip, #2096
	ldr	r5, [r6, #452]
	ldrd	r0, [r1, #-8]
	adds	r0, r0, r5
	adc	r1, r1, #0
	strd	r0, [r4]
.L271:
	add	ip, ip, #2096
	mov	r4, #0
	strd	r0, [ip, #-8]
	strb	r4, [r3, #3729]
	ldrb	r2, [r2, #9]	@ zero_extendqisi2
	cmp	r2, r4
	ldr	r2, [r6, #456]
	bne	.L279
	adds	r0, r0, r2
	add	r3, r3, #3664
	adc	r1, r1, #0
	subs	r0, r0, r7
	sbc	r1, r1, #0
	strd	r0, [r3, #32]
	umull	r4, r5, r0, lr
	mla	r5, lr, r1, r5
	strd	r4, [r3, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L278:
	ldrb	r1, [r0, #3473]	@ zero_extendqisi2
	add	ip, r0, #4544
	cmp	r1, #0
	add	r1, ip, #2080
	bne	.L280
	ldrd	r4, [r1, #-8]
	strd	r4, [fp, #-52]
	ldrd	r4, [r1]
	strd	r4, [fp, #-44]
.L274:
	add	r6, r0, #4096
	mov	r5, #0
	add	r9, ip, #2096
	add	r8, ip, #2080
	ldr	r1, [r6, #452]
	mov	r0, r1
	mov	r1, r5
	ldrd	r4, [fp, #-52]
	strd	r0, [fp, #-60]
	adds	r4, r4, r0
	adc	r5, r5, r1
	mov	r0, r4
	mov	r1, r5
	ldrd	r4, [fp, #-44]
	strd	r0, [r9]
	cmp	r0, r4
	strd	r0, [r8, #-8]
	sbcs	r4, r1, r5
	bge	.L271
	ldrd	r0, [fp, #-60]
	ldrd	r4, [fp, #-44]
	adds	r0, r0, r4
	adc	r1, r1, r5
	strd	r0, [r9]
	strd	r0, [r8, #-8]
	b	.L271
.L279:
	adds	r0, r0, r2
	add	ip, r3, #3664
	adc	r1, r1, #0
	movs	r1, r1, asr #1
	mov	r0, r0, rrx
	subs	r0, r0, r7
	sbc	r1, r1, #0
	strd	r0, [ip, #32]
	umull	r2, r3, r0, lr
	mla	r3, lr, r1, r3
	strd	r2, [ip, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L277:
	add	r6, r0, #4096
	add	ip, r0, #4544
	add	r5, ip, #2096
	add	r4, ip, #2080
	ldr	r0, [r6, #420]
	mov	r1, r0, asr #31
	strd	r0, [r5]
	strd	r0, [r4, #-8]
	b	.L271
.L280:
	ldrd	r4, [r1]
	strd	r4, [fp, #-52]
	strd	r4, [fp, #-44]
	b	.L274
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
	bls	.L285
.L282:
	sub	r1, r1, #6
	cmp	r1, #3
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r0, r0, #4544
	add	r3, r0, #2096
	add	r0, r0, #2080
	ldrd	r2, [r3]
	strd	r2, [r0]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L285:
	ldr	ip, [r0, #2324]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [ip, #56]
	cmp	r5, r3
	cmpeq	r4, r2
	beq	.L283
	movw	r2, #28272
	add	r3, r0, #28160
	ldrd	r6, [r0, r2]
	movw	r2, #28288
	strd	r4, [r0, r2]
	strd	r6, [r3, #136]
.L283:
	add	r3, r0, #24576
	mov	r2, #1
	strb	r2, [r3, #3728]
	b	.L282
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
	add	r3, r3, #144
	mov	r4, r0
	movw	r0, #28288
	ldr	r5, [r2, #3704]
	movw	r1, #28272
	ldr	r10, [r2, #3708]
	ldrd	r2, [r3, #-8]
	cmp	r5, #0
	ldrd	r6, [r4, r1]
	strd	r2, [fp, #-60]
	ldrd	r2, [r4, r0]
	strd	r2, [fp, #-52]
	beq	.L289
	mov	r9, r5
	mov	r0, r10
	b	.L288
.L290:
	mov	r9, r1
.L288:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L290
.L287:
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
	strd	r0, [r4, #152]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L289:
	mov	r9, r10
	b	.L287
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
	beq	.L293
	mov	r1, #4
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #1]
	ldr	r0, [r6, #2308]
	bl	BsGet
	mov	r3, r4
	mov	r2, #1
	strb	r2, [r5]
	strb	r0, [r5, #2]
.L292:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L293:
	mvn	r3, #0
	b	.L292
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
	bls	.L302
.L297:
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #1]!
	cmp	r4, r6
	bne	.L297
	sub	r0, r8, #16
	str	r0, [r7, #20]
	cmp	r0, #0
	movne	r4, #0
	beq	.L303
.L299:
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r3, [r7, #20]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L299
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L303:
	str	r0, [r7]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L302:
	ldr	r1, .L304
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L305:
	.align	2
.L304:
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
	ldr	r3, [r7, #2128]
	cmp	r3, #0
	beq	.L307
	ldr	r4, [r0, #2336]
	cmp	r4, #0
	beq	.L308
	ldr	r2, [r4, #36]
	cmp	r2, #0
	addne	r6, r0, #2336
	movne	r4, #0
	bne	.L313
	b	.L351
.L314:
	ldr	r3, [ip, #680]
	cmp	r3, #0
	beq	.L315
	ldr	r3, [r7, #2128]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L352
	ldr	r2, [r6, #4]!
	cmp	r2, #0
	beq	.L308
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L309
.L313:
	ldr	r1, [r2, #32]
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	bne	.L314
.L315:
	add	r3, r4, #584
	mov	r2, r4
	ldr	r1, .L356
	mov	r0, #1
	ldr	r3, [r5, r3, asl #2]
	ldr	r3, [r3, #36]
	str	ip, [sp]
	bl	dprint_vfmw
.L312:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L352:
	cmp	r3, #0
	beq	.L307
	ldr	r2, [r7, #2132]
	cmp	r2, #0
	beq	.L307
	ldr	r4, [r5, #2404]
	cmp	r4, #0
	beq	.L320
	ldr	r2, [r4, #36]
	cmp	r2, #0
	addne	r6, r5, #2400
	movne	r4, #0
	addne	r6, r6, #4
	bne	.L324
	b	.L353
.L325:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L326
	ldr	r3, [r7, #2132]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L307
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L354
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L355
.L324:
	ldr	r1, [r2, #32]
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L325
.L326:
	mov	r3, r0
	mov	r2, r4
	ldr	r1, .L356+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L346
.L307:
	mov	r0, #0
.L346:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L308:
	mov	r2, r4
	ldr	r1, .L356+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L312
.L351:
	mov	r4, r2
.L309:
	mov	r2, r4
	ldr	r1, .L356+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L312
.L354:
	ldr	r3, [r7, #2128]
.L320:
	mov	r2, r4
	ldr	r1, .L356+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L346
.L355:
	ldr	r3, [r7, #2128]
.L321:
	mov	r2, r4
	ldr	r1, .L356+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L346
.L353:
	mov	r4, r2
	b	.L321
.L357:
	.align	2
.L356:
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
	ldr	r3, [r0, #2508]
	cmp	r3, #16
	bhi	.L359
	cmp	r3, #0
	addne	ip, r0, #2512
	mvnne	r4, #-2147483648
	addne	ip, ip, #12
	movne	r3, #0
	beq	.L361
.L364:
	ldr	r2, [ip, #4]!
	ldr	lr, [r2, #12]
	cmp	lr, r4
	bge	.L363
	ldr	r2, [r2]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	streq	r3, [r1]
	moveq	r4, lr
.L363:
	ldr	r2, [r0, #2508]
	add	r3, r3, #1
	cmp	r2, r3
	bhi	.L364
	ldr	r3, [r1]
	cmn	r3, #1
	beq	.L361
	str	r4, [sp]
	mov	r0, #1
	ldr	r2, .L367
	ldr	r1, .L367+4
	bl	dprint_vfmw
	mov	r0, #0
.L362:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L359:
	ldr	r2, .L367
	mov	r0, #1
	ldr	r1, .L367+8
	bl	dprint_vfmw
	mov	r0, r4
	b	.L362
.L361:
	ldr	r2, .L367
	mov	r0, #1
	ldr	r1, .L367+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L362
.L368:
	.align	2
.L367:
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
	ldr	r3, [r0, #2504]
	mov	r5, r0
	cmp	r3, #16
	bhi	.L373
	ldr	r0, [r0, #244]
	bl	FSP_GetTotalValidFsNum
	add	r3, r5, #53248
	ldr	r2, [r5, #244]
	ldr	r1, [r3, #1260]
	mov	r4, r0
	ldr	r0, [r3, #1256]
	bl	FSP_GetOccupiedNum
	rsb	r0, r0, r4
	bic	r2, r0, r0, asr #31
	cmp	r2, #0
	ble	.L372
	ldr	r3, [r5, #2504]
	add	r3, r3, #1
	cmp	r2, r3
	bcc	.L372
	str	r3, [r5, #2504]
	mov	r0, #13
	ldr	r2, .L374
	ldr	r1, .L374+4
	bl	dprint_vfmw
	mov	r0, #0
.L371:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L372:
	mov	r3, r2
	ldr	r1, .L374+8
	ldr	r2, .L374
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L371
.L373:
	mov	r4, #17
	ldr	r2, .L374
	mov	r0, #1
	str	r4, [sp]
	ldr	r1, .L374+12
	bl	dprint_vfmw
	str	r4, [r5, #2504]
	mvn	r0, #0
	b	.L371
.L375:
	.align	2
.L374:
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
	ldr	r3, [r0, #2040]
	sub	r2, r3, #16
	cmp	r2, #5
	bls	.L377
	ldr	r3, [r0, #1244]
	sub	r3, r3, #16
	cmp	r3, #5
	bls	.L388
	ldr	r3, [r0, #2028]
	cmp	r3, #1
	beq	.L380
	cmp	r3, #2
	beq	.L381
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r0, #1252]
	ldmfd	sp, {fp, sp, pc}
.L377:
	str	r3, [r0, #1244]
	mov	r3, #0
	str	r3, [r0, #1252]
	ldmfd	sp, {fp, sp, pc}
.L380:
	ldr	r2, [r0, #1252]
	cmp	r2, #2
	beq	.L389
	str	r3, [r0, #1252]
	ldmfd	sp, {fp, sp, pc}
.L381:
	ldr	r3, [r0, #1252]
	sub	r3, r3, #1
	cmp	r3, #1
	movhi	r3, #0
	strhi	r3, [r0, #1252]
	ldmfd	sp, {fp, sp, pc}
.L389:
	ldmfd	sp, {fp, sp, pc}
.L388:
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
	ldr	r0, [r0, #2040]
	cmp	r0, #15
	bhi	.L391
	tst	r0, #1
	bne	.L393
.L391:
	sub	r0, r0, #16
	cmp	r0, #7
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L393:
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
	ldr	r0, [r1, #588]
	ldr	r3, [r1, #592]
	ldrb	ip, [r1, #580]	@ zero_extendqisi2
	ldrb	lr, [r1, #584]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #588]
	ldrb	lr, [r1, #581]	@ zero_extendqisi2
	ldrb	r3, [r1, #593]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #585]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #4]
	ldr	r0, [r1, #584]
	ldrb	lr, [r1, #582]	@ zero_extendqisi2
	ldrb	r3, [r1, #594]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #590]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #8]
	ldr	r0, [r1, #592]
	ldrb	r3, [r1, #587]	@ zero_extendqisi2
	ldrb	lr, [r1, #583]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #591]	@ zero_extendqisi2
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r1, r0, lsl #6
	ldr	r0, [r1, #1740]
	ldr	r3, [r1, #1756]
	ldrb	ip, [r1, #1732]	@ zero_extendqisi2
	ldrb	lr, [r1, #1748]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #1772]
	ldr	r3, [r1, #1788]
	ldrb	ip, [r1, #1764]	@ zero_extendqisi2
	ldrb	lr, [r1, #1780]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #4]
	ldr	r0, [r1, #1740]
	ldrb	lr, [r1, #1733]	@ zero_extendqisi2
	ldrb	r3, [r1, #1757]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1749]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r0, [r1, #1772]
	ldrb	lr, [r1, #1765]	@ zero_extendqisi2
	ldrb	r3, [r1, #1789]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1781]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	r0, [r1, #1748]
	ldrb	lr, [r1, #1734]	@ zero_extendqisi2
	ldrb	r3, [r1, #1758]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1742]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #16]
	ldr	r0, [r1, #1780]
	ldrb	lr, [r1, #1766]	@ zero_extendqisi2
	ldrb	r3, [r1, #1790]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1774]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #20]
	ldr	r0, [r1, #1756]
	ldrb	lr, [r1, #1735]	@ zero_extendqisi2
	ldrb	r3, [r1, #1751]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1743]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r0, [r1, #1788]
	ldrb	lr, [r1, #1767]	@ zero_extendqisi2
	ldrb	r3, [r1, #1783]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1775]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r0, [r1, #1744]
	ldr	r3, [r1, #1760]
	ldrb	ip, [r1, #1736]	@ zero_extendqisi2
	ldrb	lr, [r1, #1752]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #32]
	ldr	r0, [r1, #1776]
	ldr	r3, [r1, #1792]
	ldrb	ip, [r1, #1768]	@ zero_extendqisi2
	ldrb	lr, [r1, #1784]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #36]
	ldr	r0, [r1, #1744]
	ldrb	lr, [r1, #1737]	@ zero_extendqisi2
	ldrb	r3, [r1, #1761]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1753]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r0, [r1, #1776]
	ldrb	lr, [r1, #1769]	@ zero_extendqisi2
	ldrb	r3, [r1, #1793]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1785]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r0, [r1, #1752]
	ldrb	lr, [r1, #1738]	@ zero_extendqisi2
	ldrb	r3, [r1, #1762]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1746]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r1, #1770]	@ zero_extendqisi2
	ldr	r0, [r1, #1784]
	ldrb	r3, [r1, #1794]	@ zero_extendqisi2
	ldrb	ip, [r1, #1778]	@ zero_extendqisi2
	and	r0, r0, #16711680
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r0, [r1, #1760]
	ldrb	lr, [r1, #1739]	@ zero_extendqisi2
	ldrb	r3, [r1, #1755]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1747]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r0, [r1, #1792]
	ldrb	r3, [r1, #1787]	@ zero_extendqisi2
	ldrb	lr, [r1, #1771]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1779]	@ zero_extendqisi2
	orr	r1, lr, r0
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {fp, sp, pc}
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r1, r0, lsl #6
	ldr	r0, [r1, #980]
	ldr	r3, [r1, #1012]
	ldrb	ip, [r1, #964]	@ zero_extendqisi2
	ldrb	lr, [r1, #996]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #988]
	ldr	r3, [r1, #1020]
	ldrb	ip, [r1, #972]	@ zero_extendqisi2
	ldrb	lr, [r1, #1004]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #4]
	ldr	r0, [r1, #980]
	ldrb	lr, [r1, #965]	@ zero_extendqisi2
	ldrb	r3, [r1, #1013]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #997]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r0, [r1, #988]
	ldrb	lr, [r1, #973]	@ zero_extendqisi2
	ldrb	r3, [r1, #1021]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1005]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	r0, [r1, #996]
	ldrb	lr, [r1, #966]	@ zero_extendqisi2
	ldrb	r3, [r1, #1014]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #982]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #16]
	ldr	r0, [r1, #1004]
	ldrb	lr, [r1, #974]	@ zero_extendqisi2
	ldrb	r3, [r1, #1022]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #990]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #20]
	ldr	r0, [r1, #1012]
	ldrb	lr, [r1, #967]	@ zero_extendqisi2
	ldrb	r3, [r1, #999]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #983]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r0, [r1, #1020]
	ldrb	lr, [r1, #975]	@ zero_extendqisi2
	ldrb	r3, [r1, #1007]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #991]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r0, [r1, #984]
	ldr	r3, [r1, #1016]
	ldrb	ip, [r1, #968]	@ zero_extendqisi2
	ldrb	lr, [r1, #1000]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #32]
	ldr	r0, [r1, #992]
	ldr	r3, [r1, #1024]
	ldrb	ip, [r1, #976]	@ zero_extendqisi2
	ldrb	lr, [r1, #1008]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #36]
	ldr	r0, [r1, #984]
	ldrb	lr, [r1, #969]	@ zero_extendqisi2
	ldrb	r3, [r1, #1017]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1001]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r0, [r1, #992]
	ldrb	lr, [r1, #977]	@ zero_extendqisi2
	ldrb	r3, [r1, #1025]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1009]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r0, [r1, #1000]
	ldrb	lr, [r1, #970]	@ zero_extendqisi2
	ldrb	r3, [r1, #1018]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #986]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r1, #978]	@ zero_extendqisi2
	ldr	r0, [r1, #1008]
	ldrb	r3, [r1, #1026]	@ zero_extendqisi2
	ldrb	ip, [r1, #994]	@ zero_extendqisi2
	and	r0, r0, #16711680
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r0, [r1, #1016]
	ldrb	lr, [r1, #971]	@ zero_extendqisi2
	ldrb	r3, [r1, #1003]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #987]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r0, [r1, #1024]
	ldrb	r3, [r1, #1011]	@ zero_extendqisi2
	ldrb	lr, [r1, #979]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #995]	@ zero_extendqisi2
	orr	r1, lr, r0
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {fp, sp, pc}
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
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	add	r1, r1, r0, lsl #6
	ldr	r0, [r1, #1356]
	ldr	r3, [r1, #1372]
	ldrb	ip, [r1, #1348]	@ zero_extendqisi2
	ldrb	lr, [r1, #1364]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2]
	ldr	r0, [r1, #1388]
	ldr	r3, [r1, #1404]
	ldrb	ip, [r1, #1380]	@ zero_extendqisi2
	ldrb	lr, [r1, #1396]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #4]
	ldr	r0, [r1, #1356]
	ldrb	lr, [r1, #1349]	@ zero_extendqisi2
	ldrb	r3, [r1, #1373]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1365]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #8]
	ldr	r0, [r1, #1388]
	ldrb	lr, [r1, #1381]	@ zero_extendqisi2
	ldrb	r3, [r1, #1405]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1397]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #12]
	ldr	r0, [r1, #1364]
	ldrb	lr, [r1, #1350]	@ zero_extendqisi2
	ldrb	r3, [r1, #1374]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1358]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #16]
	ldr	r0, [r1, #1396]
	ldrb	lr, [r1, #1382]	@ zero_extendqisi2
	ldrb	r3, [r1, #1406]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1390]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #20]
	ldr	r0, [r1, #1372]
	ldrb	lr, [r1, #1351]	@ zero_extendqisi2
	ldrb	r3, [r1, #1367]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1359]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #24]
	ldr	r0, [r1, #1404]
	ldrb	lr, [r1, #1383]	@ zero_extendqisi2
	ldrb	r3, [r1, #1399]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1391]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #28]
	ldr	r0, [r1, #1360]
	ldr	r3, [r1, #1376]
	ldrb	ip, [r1, #1352]	@ zero_extendqisi2
	ldrb	lr, [r1, #1368]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #32]
	ldr	r0, [r1, #1392]
	ldr	r3, [r1, #1408]
	ldrb	ip, [r1, #1384]	@ zero_extendqisi2
	ldrb	lr, [r1, #1400]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	orr	r3, ip, r3, asl #24
	uxth	r0, r0
	orr	r3, r3, lr, asl #16
	orr	r3, r3, r0
	str	r3, [r2, #36]
	ldr	r0, [r1, #1360]
	ldrb	lr, [r1, #1353]	@ zero_extendqisi2
	ldrb	r3, [r1, #1377]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1369]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #40]
	ldr	r0, [r1, #1392]
	ldrb	lr, [r1, #1385]	@ zero_extendqisi2
	ldrb	r3, [r1, #1409]	@ zero_extendqisi2
	and	r0, r0, #65280
	ldrb	ip, [r1, #1401]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #16
	str	r3, [r2, #44]
	ldr	r0, [r1, #1368]
	ldrb	lr, [r1, #1354]	@ zero_extendqisi2
	ldrb	r3, [r1, #1378]	@ zero_extendqisi2
	and	r0, r0, #16711680
	ldrb	ip, [r1, #1362]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #48]
	ldrb	lr, [r1, #1386]	@ zero_extendqisi2
	ldr	r0, [r1, #1400]
	ldrb	r3, [r1, #1410]	@ zero_extendqisi2
	ldrb	ip, [r1, #1394]	@ zero_extendqisi2
	and	r0, r0, #16711680
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #24
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #52]
	ldr	r0, [r1, #1376]
	ldrb	lr, [r1, #1355]	@ zero_extendqisi2
	ldrb	r3, [r1, #1371]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1363]	@ zero_extendqisi2
	orr	r0, lr, r0
	orr	r3, r0, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #56]
	ldr	r0, [r1, #1408]
	ldrb	r3, [r1, #1403]	@ zero_extendqisi2
	ldrb	lr, [r1, #1387]	@ zero_extendqisi2
	and	r0, r0, #-16777216
	ldrb	ip, [r1, #1395]	@ zero_extendqisi2
	orr	r1, lr, r0
	orr	r3, r1, r3, asl #16
	orr	r3, r3, ip, asl #8
	str	r3, [r2, #60]
	ldmfd	sp, {fp, sp, pc}
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
	ldr	ip, [r0, #3744]
	ldrb	r3, [ip, #13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L433
	ldr	r3, [ip, #72]
	ldr	r7, [ip, #68]
	ldrb	r4, [ip, #15]	@ zero_extendqisi2
	mov	r2, r3
	str	r3, [fp, #-236]
	ldr	r3, [r0, #3740]
	cmp	r2, #0
	sub	r8, r2, #1
	sub	r2, r7, #1
	str	r2, [fp, #-240]
	ldr	r5, [r3, #72]
	ldr	r1, [r3, #148]
	ble	.L404
	ldr	r3, [fp, #-236]
	add	r2, ip, #214
	sub	r0, fp, #216
	add	lr, r3, #107
	add	lr, ip, lr, lsl #1
.L403:
	ldrsh	r3, [r2, #2]!
	cmp	r2, lr
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L403
.L404:
	cmp	r7, #0
	ble	.L402
	add	r3, r7, #87
	add	r2, ip, #174
	sub	r0, fp, #128
	add	ip, ip, r3, lsl #1
.L407:
	ldrsh	r3, [r2, #2]!
	cmp	r2, ip
	sub	r3, r3, #1
	str	r3, [r0, #4]!
	bne	.L407
.L402:
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
	beq	.L445
	cmp	r8, #0
	mov	r3, #0
	blt	.L424
	sub	r10, fp, #212
	mov	r4, r3
	mov	r6, r3
	mov	r8, r3
	str	r3, [fp, #-232]
	str	r3, [fp, #-244]
.L410:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L427
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	r1, r2
	add	r8, r8, #1
	sub	lr, fp, #128
	mov	r6, r4
	add	r9, r3, r8
	b	.L413
.L425:
	mov	r6, r4
.L413:
	ldr	r3, [lr, #4]!
	add	r1, r1, #1
	add	r3, r3, #1
	add	ip, r2, r3
	cmp	r5, ip
	mla	r4, r8, r3, r4
	bge	.L411
	cmp	r0, r9
	blt	.L443
.L411:
	cmp	r1, r7
	mov	r2, ip
	bne	.L425
.L416:
	add	r2, ip, r3
	cmp	r5, r2
	bge	.L426
	cmp	r0, r9
	blt	.L446
.L426:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	r1, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, r1
	str	r2, [fp, #-244]
	bne	.L410
	rsb	r0, r9, r0
	mov	r2, ip
	rsb	r2, r2, r5
	mul	r3, r0, r3
	add	r3, r2, r3
	add	r6, r3, r6
.L433:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L445:
	cmp	r8, #0
	mov	r3, r4
	blt	.L424
	sub	r10, fp, #212
	mov	lr, r4
	mov	r6, r4
	mov	r8, r4
	str	r4, [fp, #-232]
	str	r4, [fp, #-244]
.L409:
	ldr	r2, [fp, #-240]
	cmp	r2, #0
	blt	.L430
	ldr	r8, [r10]
	mov	r2, #0
	ldr	r3, [fp, #-232]
	mov	ip, r2
	add	r8, r8, #1
	sub	r4, fp, #128
	mov	r6, lr
	add	r9, r3, r8
	b	.L419
.L428:
	mov	r6, lr
.L419:
	ldr	r3, [r4, #4]!
	add	ip, ip, #1
	add	r3, r3, #1
	add	r1, r2, r3
	cmp	r5, r1
	mla	lr, r8, r3, lr
	bge	.L417
	cmp	r0, r9
	blt	.L418
.L417:
	cmp	ip, r7
	mov	r2, r1
	bne	.L428
.L422:
	add	r2, r1, r3
	cmp	r5, r2
	bge	.L442
	cmp	r0, r9
	blt	.L447
.L442:
	ldr	r2, [fp, #-244]
	add	r10, r10, #4
	ldr	ip, [fp, #-236]
	add	r2, r2, #1
	str	r9, [fp, #-232]
	cmp	r2, ip
	str	r2, [fp, #-244]
	bne	.L409
	rsb	r0, r9, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L408
.L443:
	ldr	r1, [fp, #-232]
	rsb	r0, r1, r0
	mul	r3, r0, r3
.L408:
	rsb	r2, r2, r5
	add	r3, r2, r3
	add	r6, r3, r6
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L418:
	cmp	r1, r5
	bgt	.L443
	mov	r1, r2
	b	.L442
.L427:
	ldr	r2, [fp, #-232]
	mov	ip, #0
	add	r9, r2, r8
	b	.L416
.L430:
	ldr	r2, [fp, #-232]
	mov	r1, #0
	add	r9, r2, r8
	b	.L422
.L446:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, ip
	mul	r3, r0, r3
	b	.L408
.L447:
	ldr	r2, [fp, #-232]
	rsb	r0, r2, r0
	mov	r2, r1
	mul	r3, r0, r3
	b	.L408
.L424:
	mov	r2, r3
	mov	r6, r3
	b	.L408
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
	ldr	lr, [r0, #3744]
	ldrb	r3, [lr, #13]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r0, r1
	beq	.L472
	ldr	r3, [lr, #72]
	ldr	r8, [lr, #68]
	mov	r2, r3
	str	r3, [fp, #-232]
	ldr	r3, [r0, #3740]
	cmp	r2, #0
	ldr	r4, [r3, #72]
	ldr	ip, [r3, #148]
	ble	.L454
	ldr	r3, [fp, #-232]
	add	r2, lr, #214
	sub	r1, fp, #216
	add	r0, r3, #107
	add	r0, lr, r0, lsl #1
.L453:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L453
.L454:
	cmp	r8, #0
	ble	.L452
	add	r0, r8, #87
	add	r2, lr, #174
	sub	r1, fp, #128
	add	r0, lr, r0, lsl #1
.L457:
	ldrsh	r3, [r2, #2]!
	cmp	r2, r0
	sub	r3, r3, #1
	str	r3, [r1, #4]!
	bne	.L457
.L452:
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
	ble	.L456
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
.L458:
	cmp	r8, #0
	ble	.L468
	ldr	r6, [r0]
	ldr	r4, [fp, #-236]
	add	r6, r6, #1
	mla	ip, r6, r4, r3
	cmp	r7, ip
	blt	.L469
	mov	r5, #0
	mov	r1, r3
	mov	r2, r5
	mov	r3, ip
	sub	lr, fp, #124
	b	.L463
.L460:
	ldr	r4, [lr, #4]!
	mov	r1, r3
	add	r4, r4, #1
	mla	ip, r6, r4, r3
	cmp	ip, r7
	bgt	.L461
	mov	r3, ip
.L463:
	add	r2, r2, #1
	add	r5, r5, r4
	cmp	r2, r8
	bne	.L460
.L462:
	cmp	r3, r7
	bgt	.L467
	ldr	r2, [fp, #-232]
	add	r10, r10, #1
	add	r9, r9, r6
	add	r0, r0, #4
	cmp	r10, r2
	bne	.L458
.L467:
	mov	r3, r1
.L461:
	cmp	r4, #0
	beq	.L456
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
.L472:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L468:
	mov	r5, #0
	b	.L462
.L469:
	ldr	r4, [fp, #-236]
	mov	r5, #0
	b	.L461
.L456:
	ldr	r1, .L474
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L472
.L475:
	.align	2
.L474:
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
	ldr	r4, .L499
	mov	r6, r0
	add	r3, r6, #65536
	str	r0, [fp, #-60]
	mov	r2, #147456
	mov	r5, r3
	mov	r1, #0
	str	r3, [fp, #-56]
	add	r10, r6, #24576
	ldr	r3, [r4, #48]
	ldr	r0, .L499+4
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #36864
	mov	r1, #0
	ldr	r0, .L499+8
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #880
	mov	r1, #0
	add	r0, r5, #348
	blx	r3
	mov	r3, #0
	str	r3, [r5, #344]
	ldr	r9, [r10, #3744]
	ldr	r1, [r10, #3740]
	ldr	r2, [r9, #72]
	ldr	r8, [r1, #240]
	cmp	r2, r3
	strne	r3, [fp, #-72]
	strne	r3, [fp, #-76]
	beq	.L476
.L484:
	ldr	r2, [r9, #68]
	cmp	r2, #0
	ldr	r2, [fp, #-72]
	add	r2, r2, #108
	streq	r2, [fp, #-80]
	beq	.L485
	mov	r1, r2
	str	r2, [fp, #-80]
	mov	r7, r1, asl #1
	ldr	r1, [fp, #-76]
	mov	r2, #0
	str	r2, [fp, #-48]
	str	r2, [fp, #-52]
	mul	r1, r8, r1
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #344]
	str	r1, [fp, #-68]
.L483:
	add	r1, r2, #8192
	ldr	r0, [fp, #-60]
	add	r1, r1, #43
	add	r1, r0, r1, lsl #3
	str	r3, [r1, #4]
	ldrsh	r1, [r9, r7]
	cmp	r1, #0
	ldreq	r1, [fp, #-48]
	addeq	r1, r1, #88
	streq	r1, [fp, #-64]
	beq	.L479
	ldr	r2, [fp, #-48]
	mov	r5, #0
	ldr	r1, [fp, #-52]
	add	r2, r2, #88
	ldr	r0, [fp, #-68]
	str	r2, [fp, #-64]
	add	r6, r1, r0
	mov	ip, r2, asl #1
.L480:
	ldrsh	r2, [r9, ip]
	cmp	r2, #0
	beq	.L482
	ldr	r2, .L499+4
	rsb	lr, r3, r6
	mov	r4, r3
	add	r2, r2, r3, lsl #2
.L481:
	add	r1, lr, r3
	str	r1, [r2], #4
	ldr	r9, [r10, #3744]
	add	r3, r3, #1
	rsb	r1, r4, r3
	ldrsh	r0, [r9, ip]
	cmp	r0, r1
	bhi	.L481
.L482:
	ldrsh	r2, [r9, r7]
	add	r5, r5, #1
	add	r6, r6, r8
	cmp	r2, r5
	bhi	.L480
	ldr	r2, [fp, #-56]
	ldr	r2, [r2, #344]
.L479:
	ldr	r1, [fp, #-60]
	sub	ip, r3, #1
	ldr	r0, [fp, #-64]
	add	r1, r1, r2, lsl #3
	ldr	lr, [fp, #-48]
	add	r1, r1, #65536
	add	r2, r2, #1
	mov	r0, r0, asl #1
	add	lr, lr, #1
	str	ip, [r1, #352]
	ldr	r1, [fp, #-56]
	str	lr, [fp, #-48]
	str	r2, [r1, #344]
	ldr	r1, [r9, #68]
	ldrsh	r0, [r9, r0]
	cmp	r1, lr
	ldr	r1, [fp, #-52]
	add	r1, r1, r0
	str	r1, [fp, #-52]
	bhi	.L483
.L485:
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
	bhi	.L484
.L476:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L500:
	.align	2
.L499:
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
	ldr	r1, .L523
	mov	r0, #2
	ldr	r3, [r8, #1276]
	add	r4, r5, #61440
	ldr	r2, [r8, #1484]
	add	r7, r5, #65536
	bl	dprint_vfmw
	ldr	r1, .L523+4
	mov	r0, #4
	add	r9, r5, #24576
	bl	dprint_vfmw
	ldr	r3, [r8, #1468]
	mov	ip, #0
	ldr	lr, .L523+8
	add	r1, r5, #2928
	add	r0, r5, #62976
	str	r3, [r4, #2884]
	add	r1, r1, #8
	ldr	r3, [r8, #1348]
	mov	r2, #64
	ldr	r6, [r8, #1352]
	add	r0, r0, #180
	rsb	r6, r3, r6
	str	r6, [r4, #2888]
	ldr	r6, [r8, #1484]
	str	r6, [r4, #2876]
	ldr	r6, [r8, #1276]
	str	r6, [r4, #2880]
	ldr	r6, [r8, #1472]
	str	r6, [r4, #2892]
	ldr	r6, [r8, #1476]
	str	r6, [r4, #2896]
	ldr	r6, [r8, #1480]
	str	r6, [r4, #2900]
	ldr	r6, [r8, #1372]
	rsb	r3, r3, r6
	str	r3, [r4, #2904]
	ldr	r3, [r8, #1376]
	rsb	r3, r6, r3
	str	r3, [r4, #2908]
	str	ip, [r5, #208]
	ldr	r3, [r7, #2836]
	str	r3, [r7, #116]
	ldr	r3, [r9, #3740]
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	strb	ip, [r4, #1596]
	ldrb	ip, [r3, #5]	@ zero_extendqisi2
	strb	ip, [r4, #1597]
	ldrb	ip, [r3, #9]	@ zero_extendqisi2
	strb	ip, [r4, #1598]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	strb	ip, [r4, #1599]
	ldrb	ip, [r3, #7]	@ zero_extendqisi2
	strb	ip, [r4, #1600]
	ldr	ip, [r3, #64]
	str	ip, [r4, #1604]
	ldr	ip, [r3, #116]
	strb	ip, [r4, #1608]
	ldr	ip, [r3, #244]
	sub	ip, ip, #1
	str	ip, [r4, #1612]
	ldr	ip, [r3, #240]
	sub	ip, ip, #1
	str	ip, [r4, #1616]
	ldr	ip, [r8, #1248]
	str	ip, [r4, #1620]
	ldr	ip, [r9, #3744]
	ldr	r6, [ip, #84]
	sub	r6, r6, #2
	str	r6, [r4, #1624]
	ldrb	r6, [ip, #11]	@ zero_extendqisi2
	strb	r6, [r4, #1628]
	ldrb	ip, [ip, #10]	@ zero_extendqisi2
	strb	ip, [r4, #1629]
	ldr	ip, [r3, #200]
	str	ip, [r4, #1632]
	ldr	ip, [r3, #208]
	str	ip, [r4, #1636]
	ldr	ip, [r3, #188]
	str	ip, [r4, #1640]
	ldr	ip, [r3, #196]
	str	ip, [r4, #1644]
	ldr	ip, [r3, #172]
	str	ip, [r4, #1648]
	ldr	ip, [r3, #180]
	str	ip, [r4, #1652]
	ldr	ip, [r3, #216]
	str	ip, [r4, #1656]
	ldr	ip, [r3, #140]
	str	ip, [r4, #1660]
	ldr	r6, [r3, #148]
	ldr	ip, [lr, #52]
	str	r6, [r4, #1664]
	ldr	lr, [r3, #112]
	str	lr, [r4, #1668]
	ldr	lr, [r3, #104]
	str	lr, [r4, #1672]
	ldr	lr, [r3, #124]
	str	lr, [r4, #1676]
	ldr	lr, [r3, #120]
	str	lr, [r4, #1680]
	ldr	lr, [r3, #108]
	str	lr, [r4, #1684]
	ldr	r3, [r3, #100]
	str	r3, [r4, #1688]
	blx	ip
	ldr	ip, [r9, #3740]
	add	r3, r5, #65280
	add	r1, r5, #64768
	add	r1, r1, #132
	mov	r0, r5
	ldr	lr, [ip, #76]
	mov	r2, r3
	add	r3, r3, #212
	add	r2, r2, #132
	str	lr, [r4, #1780]
	ldr	ip, [ip, #72]
	str	ip, [r4, #1784]
	bl	HEVC_CalcTileInfo
	subs	r6, r0, #0
	bne	.L521
	ldr	r3, [r9, #3744]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	strb	r2, [r4, #1808]
	ldrb	r2, [r3, #7]	@ zero_extendqisi2
	strb	r2, [r4, #1809]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	strb	r2, [r4, #1810]
	ldrb	r2, [r3, #14]	@ zero_extendqisi2
	strb	r2, [r4, #1811]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	strb	r2, [r4, #1812]
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	strb	r2, [r4, #1813]
	ldr	r2, [r9, #3740]
	ldr	r1, [r3, #56]
	ldr	r2, [r2, #148]
	rsb	r2, r1, r2
	str	r2, [r3, #88]
	ldr	r3, [r9, #3744]
	ldr	r2, [r3, #88]
	str	r2, [r4, #1816]
	ldr	r2, [r3, #52]
	str	r2, [r4, #1820]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	strb	r2, [r4, #1824]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	strb	r2, [r4, #1825]
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	strb	r2, [r4, #1826]
	ldr	r2, [r3, #60]
	str	r2, [r4, #1828]
	ldr	r2, [r3, #64]
	str	r2, [r4, #1832]
	ldr	r2, [r3, #72]
	sub	r2, r2, #1
	str	r2, [r4, #1836]
	ldr	r2, [r3, #68]
	sub	r2, r2, #1
	str	r2, [r4, #1840]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	strb	r2, [r4, #1629]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	strb	r3, [r4, #1628]
	ldr	r3, [r8, #1300]
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	subs	r9, r0, #0
	beq	.L522
	ldr	r2, [r9, #680]
	ldr	r3, [r9, #684]
	cmp	r2, #0
	beq	.L506
	cmp	r3, #0
	beq	.L506
	add	r2, r5, #64256
	add	r3, r5, #64512
	add	r3, r3, #128
	ldr	r0, [r5, #244]
	mov	r1, r2
	add	r2, r2, #116
	add	r1, r1, #244
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r9, #680]
	add	r2, r5, #64256
	add	r1, r5, #64512
	add	r2, r2, #248
	add	r1, r1, #120
	ldr	r3, [r3, #8]
	str	r3, [r4, #2876]
	ldr	r0, [r5, #244]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r8, #1276]
	str	r3, [r4, #2880]
	ldr	r3, [r9, #696]
	str	r3, [r4, #3196]
	ldr	r3, [r9, #684]
	ldr	r3, [r3, #16]
	str	r3, [r7, #336]
	ldr	r3, [r9, #684]
	ldr	r3, [r3, #76]
	str	r3, [r7, #340]
	ldr	ip, [r5, #2800]
	cmp	ip, #0
	str	ip, [r7, #108]
	beq	.L508
	add	r2, r5, #2864
	add	r3, r7, #40
	add	r2, r2, #4
	mov	r0, r6
.L509:
	add	r0, r0, #1
	ldr	r1, [r2, #4]!
	cmp	r0, ip
	str	r1, [r3, #4]!
	bne	.L509
.L508:
	add	r7, r5, #63232
	mov	r6, #0
	add	r7, r7, #56
.L510:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_8x8
	cmp	r6, #4
	add	r7, r7, #64
	bne	.L510
	add	r2, r5, #63488
	mov	r0, r6
	add	r2, r2, #56
	mov	r1, r5
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #63488
	add	r2, r2, #120
	mov	r1, r5
	mov	r0, #5
	add	r7, r5, #63744
	bl	HEVC_WriteQmatrix_8x8
	add	r2, r5, #63488
	add	r2, r2, #184
	mov	r1, r5
	mov	r0, #0
	add	r7, r7, #56
	bl	HEVC_WriteQmatrix_16x16
	add	r2, r5, #63488
	add	r2, r2, #248
	mov	r1, r5
	mov	r0, #1
	mov	r6, #2
	bl	HEVC_WriteQmatrix_16x16
.L511:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_16x16
	cmp	r6, #6
	add	r7, r7, #64
	bne	.L511
	add	r2, r5, #64000
	mov	r1, r5
	add	r2, r2, #56
	mov	r0, #0
	bl	HEVC_WriteQmatrix_32x32
	add	r2, r5, #64000
	add	r2, r2, #120
	mov	r1, r5
	mov	r0, #1
	add	r7, r5, #64000
	bl	HEVC_WriteQmatrix_32x32
	add	r7, r7, #184
	mov	r6, #0
.L512:
	mov	r2, r7
	mov	r0, r6
	mov	r1, r5
	add	r6, r6, #1
	bl	HEVC_WriteQmatrix_4x4
	cmp	r6, #6
	add	r7, r7, #16
	bne	.L512
	ldr	r1, [r5, #2268]
	mov	r0, #0
	ldr	r3, [r5, #2272]
	ldr	r2, [r5, #2260]
	ldr	ip, [r5, #2264]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #2840]
	ldr	r1, [r5, #2284]
	ldr	r3, [r5, #2288]
	ldr	r2, [r5, #2276]
	ldr	ip, [r5, #2280]
	mov	r1, r1, asl #16
	orr	r3, r1, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, ip, asl #8
	str	r3, [r4, #2844]
	ldr	r3, [r8, #1276]
	str	r3, [r4, #2872]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L521:
	ldr	r2, .L523+12
	mov	r0, #1
	ldr	r1, .L523+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L506:
	ldr	r1, .L523+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L522:
	ldr	r3, [r8, #1300]
	mov	r0, #1
	ldr	r1, .L523+24
	ldr	r2, [r3, #32]
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L524:
	.align	2
.L523:
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
	ldrb	r3, [r3, #1971]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, r0, #55040
	addeq	r3, r3, #176
	beq	.L527
	ldrsb	r3, [r0, #9]
	cmp	r3, #0
	addne	r3, r0, #58880
	addne	r3, r3, #68
	beq	.L560
.L527:
	ldr	ip, [r3, #160]
	ldr	lr, [r3, #164]
	cmp	ip, #16
	bhi	.L561
	cmp	lr, #16
	bhi	.L531
	cmp	ip, #0
	beq	.L532
	ldr	r3, [r0, #2336]
	cmp	r3, #0
	beq	.L545
	ldr	r3, [r3, #36]
	cmp	r3, #0
	addne	r1, r0, #2336
	movne	r2, #0
	bne	.L537
	b	.L562
.L538:
	ldr	r3, [r1, #4]!
	cmp	r3, #0
	beq	.L533
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L534
.L537:
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L538
.L532:
	cmp	lr, #0
	beq	.L557
	ldr	r3, [r0, #2404]
	cmp	r3, #0
	beq	.L548
	ldr	r3, [r3, #36]
	cmp	r3, #0
	addne	r0, r0, #2400
	movne	r2, #0
	addne	r0, r0, #4
	bne	.L543
	b	.L563
.L544:
	ldr	r3, [r0, #4]!
	cmp	r3, #0
	beq	.L539
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L540
.L543:
	add	r2, r2, #1
	cmp	r2, lr
	bne	.L544
.L557:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L545:
	mov	r2, r3
.L533:
	ldr	r1, .L564
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L562:
	mov	r2, r3
.L534:
	ldr	r1, .L564+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L548:
	mov	r2, r3
.L539:
	ldr	r1, .L564+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L563:
	mov	r2, r3
.L540:
	ldr	r1, .L564+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L560:
	mov	r0, r3
	ldr	r2, .L564+16
	ldr	r1, .L564+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L531:
	mov	r2, lr
	mov	r3, #17
	ldr	r1, .L564+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L561:
	mov	r2, ip
	mov	r3, #17
	ldr	r1, .L564+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L565:
	.align	2
.L564:
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
	bne	.L604
	ldr	r0, [r4, #208]
	ldr	r3, [r4, #144]
	cmp	r0, r3
	bcs	.L642
	add	r9, r4, #65536
	mov	r5, #1360
	ldr	r7, [fp, #-112]
	mov	r2, r5
	ldr	r6, [r9, #2836]
	add	r8, r4, #53248
	ldr	r3, .L645
	mov	r1, r7
	mla	r6, r5, r0, r6
	ldr	r3, [r3, #48]
	mov	r0, r6
	blx	r3
	ldr	r3, .L645
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
	ldrcc	r2, [r9, #2836]
	ldrcs	r3, [fp, #-112]
	mlacc	r3, r5, r3, r2
	str	r3, [r6, #1356]
	ldr	r2, [r4, #216]
	ldr	r1, [r8, #2044]
	add	r3, r2, #16896
	add	r2, r2, #1
	add	r3, r3, #198
	add	r3, r4, r3, lsl #2
	str	r1, [r3, #4]
	ldr	r3, [r4, #172]
	str	r2, [r4, #216]
	add	r3, r3, #1
	str	r3, [r4, #172]
	ldr	r2, [r9, #3644]
	mov	r0, r3, asl #5
	ldr	r1, [r8, #2028]
	sub	r3, r0, r3, asl #2
	str	r3, [fp, #-116]
	add	r3, r2, r3
	str	r1, [r3, #8]
	ldr	r2, [r4, #2332]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	r1, #1
	cmpls	r1, r3
	bcs	.L571
	add	r0, r6, r1, lsl #2
.L572:
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r1, r1, #1
	add	r2, r2, r3
	ldr	r2, [r2, #60]
	str	r2, [r0, #8]
	ldr	r2, [r4, #2332]
	add	r2, r2, r3
	ldr	r2, [r2, #56]
	str	r2, [r0], #4
	ldr	r2, [r4, #2332]
	add	r3, r2, r3
	ldr	r3, [r3, #64]
	str	r3, [r0, #12]
	ldr	r2, [r4, #2332]
	ldr	r3, [r2, #8]
	cmp	r3, r1
	movhi	ip, #1
	movls	ip, #0
	cmp	r1, #1
	movhi	ip, #0
	cmp	ip, #0
	bne	.L572
.L571:
	cmp	r3, #1
	addls	r3, r6, r3, lsl #2
	addls	r1, r6, #8
	movls	r2, #0
	bhi	.L577
.L576:
	str	r2, [r3, #8]
	str	r2, [r3], #4
	cmp	r3, r1
	str	r2, [r3, #12]
	bne	.L576
.L577:
	ldrb	r3, [r8, #1971]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L643
.L575:
	add	r5, r4, #57344
	ldr	r3, [r5, #1764]
	cmp	r3, #0
	beq	.L578
	add	r0, r4, #2336
	add	r10, r6, #112
	add	lr, r6, #368
	mov	r1, #0
.L579:
	ldr	ip, [r0]
	sub	r7, fp, #44
	add	r1, r1, #1
	ldr	r2, [ip, #36]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #16064
	add	r3, r3, #60
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
	ldr	r3, [r5, #1764]
	cmp	r3, r1
	bhi	.L579
	ldr	r2, [r5, #1768]
	cmp	r2, #0
	beq	.L580
.L603:
	add	r1, r4, #2400
	add	r10, r6, #176
	add	r1, r1, #4
	add	lr, r6, #432
	mov	r0, #0
.L581:
	ldr	ip, [r1]
	sub	r7, fp, #44
	add	r0, r0, #1
	ldr	r2, [ip, #36]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	add	r3, r3, #16064
	add	r3, r3, #60
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
	ldr	r2, [r5, #1768]
	cmp	r2, r0
	bhi	.L581
	ldr	r3, [r5, #1764]
.L580:
	cmp	r3, #0
	beq	.L582
	ldr	r1, [r6, #372]
	ldr	lr, [r8, #1248]
	add	r1, r1, #732
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	lr, r1
	blt	.L610
	add	ip, r6, #372
	mov	r0, #0
	b	.L584
.L585:
	ldr	r1, [ip, #4]!
	add	r1, r1, #732
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	cmp	r1, lr
	bgt	.L610
.L584:
	add	r0, r0, #1
	cmp	r0, r3
	bne	.L585
.L582:
	ldr	r1, [r5, #1664]
	cmp	r1, #0
	bne	.L639
	cmp	r2, #0
	beq	.L639
	ldr	r3, [r6, #436]
	ldr	ip, [r8, #1248]
	add	r3, r3, #732
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	ip, r3
	blt	.L583
	add	r0, r6, #436
	b	.L586
.L587:
	ldr	r3, [r0, #4]!
	add	r3, r3, #732
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	cmp	r3, ip
	bgt	.L610
.L586:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L587
.L639:
	mov	r1, #1
.L583:
	strb	r1, [r6, #24]
	ldrb	r3, [r8, #1971]	@ zero_extendqisi2
	strb	r3, [r6, #25]
	ldr	r3, [r5, #1660]
	str	r3, [r6, #28]
	ldrb	r2, [r5, #1614]	@ zero_extendqisi2
	strb	r2, [r6, #32]
	ldr	r2, [r5, #1684]
	str	r2, [r6, #36]
	ldr	r10, [r8, #1300]
	ldr	r1, [r4, #208]
	ldr	r0, [r10, #436]
	sub	r2, r1, #1
	mla	r0, r0, r2, r3
	bl	__aeabi_uidiv
	str	r0, [r10, #68]
	ldr	r3, [r5, #1664]
	cmp	r3, #0
	bne	.L588
	ldrb	r3, [r5, #1615]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L589
	ldr	r3, [r5, #1716]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #436]
	mov	r7, r3
.L590:
	str	r7, [r6, #40]
	add	r10, r4, #24576
	ldr	r3, [r5, #1716]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #1615]	@ zero_extendqisi2
	strb	r3, [r6, #52]
	ldr	r3, [r5, #1720]
	str	r3, [r6, #44]
	ldr	r3, [r5, #1772]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #60]
	ldr	r3, [r5, #1776]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r6, #56]
	ldrb	r2, [r5, #1611]	@ zero_extendqisi2
	strb	r2, [r6, #64]
	ldrb	r2, [r5, #1613]	@ zero_extendqisi2
	strb	r2, [r6, #65]
	ldr	r2, [r5, #1764]
	str	r2, [r6, #68]
	ldr	r2, [r5, #1768]
	str	r2, [r6, #72]
	ldr	r2, [r5, #1664]
	str	r2, [r6, #76]
	ldr	r2, [r8, #2048]
	str	r2, [r6, #80]
	ldr	r2, [r10, #3740]
	ldr	r0, [r8, #2048]
	ldr	r1, [r2, #240]
	bl	__aeabi_uidivmod
	str	r1, [r6, #84]
	ldr	r2, [r10, #3740]
	ldr	r0, [r8, #2048]
	ldr	r1, [r2, #240]
	bl	__aeabi_uidiv
	str	r0, [r6, #88]
	mov	r0, r4
	ldr	r1, [r8, #2048]
	bl	HEVC_CtbRsAddrToTsAddr
	str	r0, [r6, #92]
	ldr	r2, [r5, #1728]
	str	r2, [r6, #96]
	ldr	r2, [r5, #1732]
	str	r2, [r6, #100]
	ldr	r2, [r5, #1740]
	str	r2, [r6, #104]
	ldr	r2, [r5, #1736]
	str	r2, [r6, #108]
	ldrb	r2, [r5, #1610]	@ zero_extendqisi2
	strb	r2, [r6, #112]
	ldrb	r2, [r5, #1609]	@ zero_extendqisi2
	strb	r2, [r6, #113]
	ldrb	r2, [r5, #1617]	@ zero_extendqisi2
	strb	r2, [r6, #114]
	ldrb	r2, [r5, #1618]	@ zero_extendqisi2
	strb	r2, [r6, #115]
	ldr	r3, [r10, #3744]
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L595
	ldr	r2, [r5, #1664]
	cmp	r2, #1
	beq	.L596
.L595:
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L644
.L640:
	add	r8, r4, #61440
.L598:
	ldrb	r3, [r5, #1611]	@ zero_extendqisi2
	ldr	r0, [fp, #-116]
	cmp	r3, #0
	subne	r3, fp, #44
	movne	r2, r7
	addne	r10, r3, r2, lsl #2
	ldrne	r3, [r10, #-64]
	strne	r3, [r6, #564]
	mov	r3, #0
	ldr	r2, [r9, #3644]
	ldr	r1, [r4, #2332]
	add	r2, r2, r0
	str	r1, [r2, #24]
	str	r3, [r4, #2332]
	ldrb	r2, [r8, #1813]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L619
	ldr	r0, [r4, #216]
	cmp	r0, #1
	ldreq	r2, [r6, #92]
	streq	r2, [r9, #1228]
	beq	.L602
	add	r1, r4, r0, lsl #3
	ldr	ip, [r6, #92]
	add	r1, r1, #66560
	add	r2, r0, #8320
	add	r2, r2, #24
	sub	ip, ip, #1
	str	ip, [r1, #192]
	sub	r3, r0, #1
	ldr	r1, [r6, #92]
	add	r2, r4, r2, lsl #3
	str	r1, [r2, #4]
.L602:
	ldr	r1, [r8, #1616]
	add	r3, r4, r3, lsl #3
	ldr	r2, [r8, #1612]
	add	r3, r3, #66560
	mla	r2, r1, r2, r2
	add	r2, r2, r1
	str	r2, [r3, #208]
	ldr	r1, [r6, #92]
	sub	r1, r1, #1
	cmp	r1, #36864
	bcs	.L619
	mov	r0, r4
	bl	HEVC_CtbTsAddrToRsAddr
	str	r0, [r6, #568]
.L619:
	ldr	r0, [fp, #-112]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L610:
	mov	r1, #0
	b	.L583
.L588:
	cmp	r3, #1
	movne	r3, #0
	movne	r7, r3
	bne	.L590
.L589:
	ldr	r3, [r5, #1716]
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #372]
	mov	r7, r3
	b	.L590
.L643:
	ldr	r3, .L645
	add	r1, r4, #55040
	add	r0, r4, #58880
	add	r1, r1, #176
	add	r0, r0, #68
	movw	r2, #3732
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #1
	strb	r3, [r4, #9]
	b	.L575
.L644:
	ldr	r3, [r5, #1664]
	cmp	r3, #0
	bne	.L640
.L596:
	ldr	r0, [r5, #3196]
	add	r8, r4, #61440
	ldr	r3, .L645
	add	r1, r8, #136
	mov	r2, #64
	str	r0, [r6, #580]
	add	r0, r6, #588
	ldr	ip, [r8, #132]
	ldr	r3, [r3, #52]
	str	ip, [r6, #584]
	blx	r3
	ldr	r3, .L645
	add	r1, r4, #60672
	mov	r2, #64
	add	r1, r1, #68
	add	r0, r6, #716
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L645
	add	r1, r8, #200
	mov	r2, #128
	add	r0, r6, #844
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L645
	add	r1, r4, #61696
	add	r0, r6, #1088
	add	r1, r1, #72
	add	r0, r0, #12
	ldr	r3, [r3, #52]
	mov	r2, #128
	blx	r3
	ldr	r3, [r5, #1664]
	cmp	r3, #0
	bne	.L598
	ldr	r3, .L645
	add	r1, r4, #61696
	add	r1, r1, #200
	mov	r2, #64
	add	r0, r6, #652
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L645
	add	r1, r4, #61184
	mov	r2, #64
	add	r1, r1, #68
	add	r0, r6, #780
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L645
	add	r1, r4, #61952
	mov	r2, #128
	add	r1, r1, #8
	add	r0, r6, #972
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, .L645
	add	r1, r4, #61952
	add	r0, r6, #1216
	add	r1, r1, #136
	mov	r2, #128
	ldr	r3, [r3, #52]
	add	r0, r0, #12
	blx	r3
	b	.L598
.L578:
	ldr	r3, [r5, #1768]
	cmp	r3, #0
	bne	.L603
	b	.L639
.L604:
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L619
.L642:
	mov	r2, r0
	ldr	r1, .L645+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	str	r3, [fp, #-112]
	b	.L619
.L646:
	.align	2
.L645:
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
	ldr	r3, [ip, #1268]
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r1, #2928]
	ldr	r3, [ip, #1272]
	str	r3, [r1, #2920]
	ldr	r3, [r2, #208]
	str	r3, [lr, #112]
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
	ldr	r3, [r3, #2044]
	ldr	r2, [r0, #156]
	cmp	r3, #0
	blt	.L652
	cmp	r3, r2
	bge	.L652
	ldr	r2, [r0, #2320]
	movw	r1, #2024
	mla	r3, r1, r3, r2
	ldr	r2, [r0, #152]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	blt	.L656
	cmp	r3, r2
	bge	.L656
	ldr	r2, [r0, #2316]
	movw	r1, #26164
	add	r0, r0, #57344
	mov	r9, #1
	str	r0, [fp, #-52]
	mla	r3, r1, r3, r2
	ldr	r2, [r0, #1156]
	ldr	r1, [r0, #1160]
	ldr	ip, [r0, #1164]
	add	r10, r1, r2
	str	r2, [fp, #-60]
	cmp	r10, ip
	str	r1, [fp, #-64]
	ldr	r3, [r3, #128]
	mov	r4, r10
	mov	r9, r9, asl r3
	bcs	.L667
	cmp	r10, #15
	bgt	.L659
	ldr	r3, [fp, #-48]
	add	r5, r10, #14592
	add	r5, r5, #63
	str	r10, [fp, #-68]
	str	r6, [fp, #-56]
	ldr	r3, [r3, #1248]
	add	r5, r6, r5, lsl #2
	mov	r6, ip
	mov	r10, r3
	b	.L661
.L679:
	cmp	r6, r4
	bls	.L677
	cmp	r4, #16
	beq	.L678
.L661:
	ldr	r7, [r5, #4]!
	mov	r1, r9
	mov	r0, r10
	mov	r8, r10
	ldr	r2, [r5, #-1884]
	cmp	r2, #0
	bne	.L662
	bl	__aeabi_idivmod
	mov	r0, r7
	mov	r8, r1
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r7, r1
.L662:
	cmp	r8, r7
	add	r4, r4, #1
	bne	.L679
	ldr	r10, [fp, #-68]
	mov	r4, #1
	ldr	r6, [fp, #-56]
.L658:
	cmp	r10, #0
	beq	.L654
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	ip, [r2, #2016]
	ldr	r3, [r3, #1212]
	ldr	r0, [r2, #1248]
	add	r3, ip, r3
	cmp	r0, r3
	beq	.L671
	add	r6, r6, #58368
	mov	r1, #0
	add	r6, r6, #188
	b	.L664
.L665:
	ldr	r3, [r6, #4]!
	add	r3, ip, r3
	cmp	r3, r0
	beq	.L671
.L664:
	add	r1, r1, #1
	cmp	r1, r10
	beq	.L654
	cmp	r1, #17
	bne	.L665
	ldr	r3, [fp, #-64]
	mov	r0, #0
	ldr	r2, [fp, #-60]
	str	r1, [sp]
	str	r3, [sp, #8]
	mov	r3, r1
	str	r2, [sp, #4]
	movw	r2, #7110
	ldr	r1, .L680
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L656:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #7061
	ldr	r1, .L680+4
	mov	r4, r0
	bl	dprint_vfmw
.L654:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L652:
	str	r2, [sp]
	mov	r0, #0
	movw	r2, #7049
	ldr	r1, .L680+8
	mov	r4, r0
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L678:
	mov	ip, r6
	ldr	r6, [fp, #-56]
.L659:
	mov	r3, r4
	mov	r1, #16
	movw	r2, #7081
	str	r1, [sp]
	mov	r0, #0
	str	ip, [sp, #4]
	ldr	r1, .L680+12
	mov	r4, r0
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	ldr	r2, [r3, #1156]
	ldr	r3, [r3, #1160]
	str	r2, [fp, #-60]
	add	r10, r3, r2
	str	r3, [fp, #-64]
	b	.L658
.L677:
	ldr	r10, [fp, #-68]
	mov	r4, #0
	ldr	r6, [fp, #-56]
	b	.L658
.L671:
	mov	r4, #1
	b	.L654
.L667:
	mov	r4, #0
	b	.L658
.L681:
	.align	2
.L680:
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
	ldr	r3, [r3, #2028]
	cmp	r3, #1
	beq	.L699
	cmp	r3, #2
	beq	.L700
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [fp, #-48]
	beq	.L684
	ldr	r2, .L709
	mov	r0, #1
	ldr	r1, .L709+4
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L699:
	str	r3, [fp, #-48]
.L684:
	add	r8, ip, #55296
	add	r9, ip, #2336
	add	r8, r8, #76
	mov	r10, #0
.L697:
	ldr	r1, [r8, #4]!
	cmp	r1, #0
	beq	.L687
	ldr	r3, [r9]
	cmp	r3, #0
	bne	.L701
	mov	r2, r9
	mov	r4, r3
	b	.L689
.L691:
	ldr	r6, [r2, #4]!
	cmp	r6, #0
	bne	.L707
.L689:
	add	r4, r4, #1
	cmp	r4, r1
	bne	.L691
	mov	r4, #255
.L690:
	ldr	r2, [ip, #2324]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L692
	ldr	r2, [fp, #-56]
	ldr	r6, [r2, #1300]
	add	r6, r6, #36
.L688:
	mov	r7, r9
	mov	r5, #0
	b	.L698
.L694:
	ldr	r3, [r7, #4]!
.L698:
	cmp	r3, #0
	beq	.L708
.L693:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	bhi	.L694
.L695:
	ldr	r3, [fp, #-48]
	add	r10, r10, #1
	add	r9, r9, #68
	cmp	r10, r3
	bcc	.L697
.L700:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L687:
	ldr	r3, [ip, #2324]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L695
	mov	r3, #1
	str	r3, [r8]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #1300]
	add	r3, r3, #36
	str	r3, [r9]
	b	.L695
.L708:
	sxtb	r2, r4
	str	r5, [sp]
	str	r2, [sp, #4]
	mov	r3, r10
	ldr	r2, .L709
	mov	r0, #1
	ldr	r1, .L709+8
	str	ip, [fp, #-52]
	bl	dprint_vfmw
	str	r6, [r7]
	ldr	ip, [fp, #-52]
	b	.L693
.L707:
	uxtb	r4, r4
	cmp	r4, #255
	bne	.L688
	b	.L690
.L701:
	mov	r6, r3
	mov	r4, #0
	b	.L688
.L692:
	mov	r3, r10
	ldr	r2, .L709
	ldr	r1, .L709+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L710:
	.align	2
.L709:
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
	beq	.L747
	ldr	r3, .L779
	mov	r2, #136
	mov	r1, #0
	sub	r0, fp, #180
	ldr	r3, [r3, #48]
	blx	r3
	ldr	lr, [r7, #2520]
	cmp	lr, #0
	beq	.L748
	mov	r0, #0
	add	r1, r7, #2592
	mov	r3, r0
	b	.L715
.L714:
	cmp	r3, lr
	beq	.L713
.L715:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L714
	ldr	ip, [r2, #52]
	cmp	ip, #0
	bne	.L714
	ldr	ip, [r2, #56]
	cmp	ip, #1
	subeq	ip, fp, #44
	addeq	r2, r2, #36
	addeq	ip, ip, r0, lsl #2
	addeq	r0, r0, #1
	streq	r2, [ip, #-136]
	cmp	r3, lr
	bne	.L715
.L713:
	ldr	r4, [r7, #2524]
	cmp	r4, #0
	beq	.L749
	add	r1, r7, #2656
	mov	ip, r0
	add	r1, r1, #4
	mov	r3, #0
	b	.L718
.L717:
	cmp	r3, r4
	beq	.L775
.L718:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L717
	ldr	lr, [r2, #52]
	cmp	lr, #0
	bne	.L717
	ldr	lr, [r2, #56]
	cmp	lr, #1
	subeq	lr, fp, #44
	addeq	r2, r2, #36
	addeq	lr, lr, ip, lsl #2
	addeq	ip, ip, #1
	streq	r2, [lr, #-136]
	cmp	r3, r4
	bne	.L718
.L775:
	rsb	r4, r0, ip
.L716:
	ldr	r5, [r7, #2516]
	cmp	r5, #0
	beq	.L750
	add	lr, r7, #2720
	mov	r9, ip
	add	lr, lr, #8
	mov	r2, #0
	b	.L721
.L720:
	cmp	r2, r5
	beq	.L776
.L721:
	ldr	r3, [lr, #4]!
	add	r2, r2, #1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L720
	ldr	r1, [r3, #52]
	cmp	r1, #1
	bne	.L720
	ldr	r1, [r3, #56]
	sub	r6, fp, #44
	add	r6, r6, r9, lsl #2
	add	r3, r3, #36
	cmp	r1, #0
	addeq	r9, r9, #1
	streq	r3, [r6, #-136]
	cmp	r2, r5
	bne	.L721
.L776:
	rsb	r5, r0, r9
	rsb	r5, r4, r5
.L719:
	cmp	r9, #0
	beq	.L777
	add	r3, r7, #53248
	str	r3, [fp, #-184]
	ldr	r3, [r3, #2028]
	cmp	r3, #0
	str	r3, [fp, #-188]
	beq	.L778
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2136]
	ldr	r5, [r3, #2140]
	cmp	r4, #0
	str	r4, [r3, #2128]
	str	r5, [r3, #2132]
	beq	.L740
.L746:
	add	r1, r7, #57344
	add	r2, r7, #2320
	add	r8, r7, #58624
	add	r2, r2, #12
	ldrb	r10, [r1, #1344]	@ zero_extendqisi2
	add	r8, r8, #68
	str	r5, [fp, #-192]
	mov	r6, #0
	mov	r5, r10
	mov	r10, r4
	mov	r4, r2
.L733:
	cmp	r5, #0
	mov	r1, r9
	mov	r0, r6
	ldrne	r1, [r8]
	bne	.L732
	bl	__aeabi_uidivmod
.L732:
	sub	r3, fp, #44
	add	r6, r6, #1
	add	r3, r3, r1, lsl #2
	cmp	r10, r6
	add	r8, r8, #4
	ldr	r3, [r3, #-136]
	str	r3, [r4, #4]!
	bhi	.L733
	ldr	r3, [fp, #-188]
	ldr	r5, [fp, #-192]
	cmp	r3, #0
	bne	.L774
.L734:
	cmp	r5, #0
	beq	.L736
	add	r2, r7, #57344
	add	r6, r7, #58624
	add	r6, r6, #196
	add	r8, r7, #2400
	ldrb	r10, [r2, #1345]	@ zero_extendqisi2
	mov	r4, #0
.L739:
	cmp	r10, #0
	mov	r1, r9
	mov	r0, r4
	ldrne	r1, [r6]
	bne	.L738
	bl	__aeabi_uidivmod
.L738:
	sub	r3, fp, #44
	add	r4, r4, #1
	add	r3, r3, r1, lsl #2
	cmp	r4, r5
	add	r6, r6, #4
	ldr	r3, [r3, #-68]
	str	r3, [r8, #4]!
	bne	.L739
.L774:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2128]
	ldr	r5, [r3, #2132]
.L735:
	cmp	r4, #16
	bhi	.L744
.L740:
	add	r4, r4, #580
	add	r2, r7, #2400
	add	r4, r4, #3
	add	r4, r7, r4, lsl #2
.L743:
	ldr	r3, [r7, #2336]
	str	r3, [r4, #4]!
	cmp	r4, r2
	bne	.L743
.L744:
	cmp	r5, #16
	bhi	.L742
	add	r5, r5, #600
	add	r2, r7, #2464
	add	r2, r2, #4
	add	r5, r7, r5, lsl #2
.L745:
	ldr	r3, [r7, #2404]
	str	r3, [r5, #4]!
	cmp	r5, r2
	bne	.L745
.L742:
	mov	r0, #0
.L773:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L778:
	cmp	r4, #0
	beq	.L725
	sub	r3, fp, #180
	ldr	r2, [fp, #-188]
	add	lr, r3, r0, lsl #2
	sub	r1, fp, #116
.L726:
	add	r2, r2, #1
	ldr	r3, [lr], #4
	cmp	r2, r4
	str	r3, [r1, #4]!
	bne	.L726
.L725:
	cmp	r0, #0
	beq	.L727
	add	r1, r4, #16
	sub	lr, fp, #180
	mov	r2, #0
	add	r1, lr, r1, lsl #2
.L728:
	add	r2, r2, #1
	ldr	r3, [lr], #4
	cmp	r2, r0
	str	r3, [r1, #4]!
	bne	.L728
	add	r4, r4, r2
.L727:
	cmp	r5, #0
	beq	.L729
	add	r4, r4, #16
	sub	r3, fp, #180
	add	ip, r3, ip, lsl #2
	mov	r2, #0
	add	r4, r3, r4, lsl #2
.L730:
	add	r2, r2, #1
	ldr	r3, [ip], #4
	cmp	r2, r5
	str	r3, [r4, #4]!
	bne	.L730
.L729:
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2136]
	ldr	r5, [r3, #2140]
	cmp	r4, #0
	str	r4, [r3, #2128]
	str	r5, [r3, #2132]
	bne	.L746
	b	.L734
.L777:
	ldr	r3, .L779
	add	r4, r7, #53248
	mov	r2, #136
	mov	r1, r9
	str	r9, [r4, #2128]
	add	r0, r7, #2336
	ldr	ip, [r3, #48]
	str	r9, [r4, #2132]
	blx	ip
	ldr	r2, [r7, #2324]
	ldr	r2, [r2, #12]
	cmp	r2, #2
	bne	.L742
	ldr	r2, [r4, #1300]
	mov	r3, #1
	mov	r0, r9
	str	r3, [r4, #2128]
	add	r3, r2, #36
	str	r3, [r7, #2336]
	b	.L773
.L748:
	mov	r0, lr
	b	.L713
.L749:
	mov	ip, r0
	b	.L716
.L750:
	mov	r9, ip
	b	.L719
.L736:
	ldr	r3, .L779
	add	r0, r7, #2400
	add	r0, r0, #4
	mov	r2, #68
	add	r1, r7, #2336
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [fp, #-184]
	ldr	r4, [r3, #2128]
	str	r4, [r3, #2132]
	mov	r5, r4
	b	.L735
.L747:
	mvn	r0, #0
	b	.L773
.L780:
	.align	2
.L779:
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
	ldr	r2, [r3, #2028]
	cmp	r2, #2
	beq	.L786
	bl	HEVC_InitListX
	cmp	r0, #0
	bne	.L787
	mov	r0, r4
	bl	HEVC_RepairList
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L788
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L786:
	mov	r0, #0
	str	r0, [r3, #2128]
	str	r0, [r3, #2132]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L787:
	ldr	r1, .L788+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L789:
	.align	2
.L788:
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
	ldr	r2, [r5, #2528]
	ldr	r3, [r2, #28]
	cmp	r3, #16
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r3, r3, #700
	mov	ip, #0
	add	r3, r3, #2
	ldr	r1, .L795
	mov	r0, #13
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	add	r3, r3, #716
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #28]
	add	r3, r3, #732
	add	r3, r3, #2
	str	ip, [r4, r3, asl #2]
	ldr	r3, [r2, #24]
	add	r3, r3, #528
	add	r3, r4, r3, lsl #2
	str	ip, [r3, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #28]
	bl	dprint_vfmw
	ldr	r3, [r5, #2528]
	mov	r2, #16
	str	r2, [r3, #28]
	ldr	r3, [r4, #2804]
	sub	r3, r3, #1
	str	r3, [r4, #2804]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L796:
	.align	2
.L795:
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
	ldr	r3, [r0, #2508]
	mov	r6, r0
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #2512
	mov	r4, #0
	add	r5, r5, #12
	b	.L800
.L799:
	ldr	r3, [r6, #2508]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L803
.L800:
	ldr	r3, [r5, #4]!
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L799
	mov	r1, r4
	mov	r0, r6
	bl	HEVC_RemoveApcStore
	ldr	r3, [r6, #2508]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L800
.L803:
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
	ldr	r2, [r0, #2320]
	movw	r4, #2024
	ldr	r1, [r3, #2044]
	movw	ip, #26164
	str	r3, [fp, #-68]
	mov	r9, r0
	ldr	r3, [r0, #2316]
	mov	r0, #1
	mla	r2, r4, r1, r2
	ldr	lr, [r9, #2508]
	cmp	lr, #0
	ldr	r2, [r2, #32]
	mla	r3, ip, r2, r3
	ldr	r8, [r3, #128]
	mov	r3, r0, asl r8
	str	r3, [fp, #-48]
	beq	.L804
	add	r8, r9, #2528
	add	r3, r9, #58368
	add	r7, r9, #57344
	str	r9, [fp, #-56]
	mov	r9, r8
	mov	r2, #0
	add	r3, r3, #188
	str	r2, [fp, #-60]
	str	r3, [fp, #-72]
	str	r0, [fp, #-64]
.L821:
	ldr	r0, [r7, #1156]
	ldr	r2, [r7, #1160]
	ldr	r1, [r7, #1164]
	add	r2, r2, r0
	ldr	r5, [r9]
	cmp	r2, r1
	mov	r8, r2
	movcs	r4, #0
	ldrcs	r0, [r5, #12]
	bcs	.L807
	add	r6, r2, #14656
	ldr	r3, [fp, #-56]
	ldr	r10, [r5, #12]
	mov	r4, #0
	add	r6, r3, r6, lsl #2
.L813:
	ldr	r3, [r6, #-1884]
	cmp	r3, #0
	ldr	r3, [r5, #52]
	beq	.L808
	cmp	r3, #0
	beq	.L809
	ldr	r3, [r6]
	cmp	r3, r10
	beq	.L839
.L809:
	cmp	r4, #0
	bne	.L826
	ldr	r1, [r6]
	mov	r4, r10
	b	.L823
.L808:
	cmp	r3, #0
	beq	.L811
	ldr	r1, [fp, #-48]
	mov	r0, r10
	bl	__aeabi_idivmod
	ldr	r0, [r6]
	str	r1, [fp, #-52]
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-52]
	cmp	r3, r1
	beq	.L839
.L811:
	cmp	r4, #0
	bne	.L826
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
.L823:
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	rsb	r4, r1, r4
	clz	r4, r4
	cmp	r0, #0
	mov	r4, r4, lsr #5
	moveq	r4, #0
	cmp	r4, #0
	bne	.L840
.L826:
	mov	r0, r10
.L812:
	ldr	r3, [r7, #1164]
	add	r8, r8, #1
	add	r6, r6, #4
	mov	r10, r0
	cmp	r8, r3
	bcc	.L813
	ldr	r2, [r7, #1160]
	ldr	r1, [r7, #1156]
	add	r2, r2, r1
.L807:
	ldr	r3, [fp, #-68]
	cmp	r2, #0
	ldrne	r8, [fp, #-72]
	movne	r6, #0
	ldr	ip, [r3, #2016]
	beq	.L815
.L817:
	ldr	r3, [r5, #52]
	add	r6, r6, #1
	cmp	r3, #0
	bne	.L816
	ldr	r3, [r8]
	add	r3, ip, r3
	cmp	r3, r0
	beq	.L841
.L816:
	ldr	r3, [r7, #1160]
	add	r8, r8, #4
	ldr	r2, [r7, #1156]
	add	r3, r3, r2
	cmp	r6, r3
	bcc	.L817
.L815:
	eor	r4, r4, #1
	cmp	r0, ip
	moveq	r0, #0
	andne	r0, r4, #1
	cmp	r0, #0
	beq	.L819
	mov	r3, #0
	strb	r3, [r5, #1]
	ldr	r2, [r9]
	str	r3, [r2, #52]
	ldr	r2, [r9]
	ldr	r1, [r2, #8]
	cmp	r1, #1
	beq	.L819
	ldr	r1, [r2, #32]
	mov	r2, r3
	ldr	r3, [fp, #-56]
	ldr	r0, [r3, #244]
	bl	FSP_SetRef
.L819:
	ldr	r3, [fp, #-56]
	add	r9, r9, #4
	ldr	r2, [r3, #2508]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	cmp	r3, r2
	bcc	.L821
.L804:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L840:
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
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r0, [r5, #12]
	b	.L812
.L839:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, #1
	strb	r1, [r5, #1]
	ldr	r3, [r9]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r9]
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r0, [r5, #12]
	b	.L812
.L841:
	ldr	r1, [fp, #-64]
	mov	r2, #1
	mov	r4, r2
	strb	r1, [r5, #1]
	ldr	r3, [r9]
	str	r1, [r3, #4]
	ldr	r1, [fp, #-56]
	ldr	r3, [r9]
	ldr	r0, [r1, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r5, [r9]
	ldr	r3, [fp, #-68]
	ldr	r0, [r5, #12]
	ldr	ip, [r3, #2016]
	b	.L816
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
	ldr	ip, [r0, #2320]
	movw	r6, #2024
	ldr	r2, [r3, #2044]
	add	lr, r0, #57344
	str	r1, [fp, #-84]
	movw	r5, #26164
	ldr	r1, [lr, #1156]
	mov	r7, r0
	mla	ip, r6, r2, ip
	ldr	r6, [lr, #1160]
	ldr	r4, [r0, #2316]
	add	r1, r6, r1
	ldr	r2, [lr, #1164]
	str	r1, [fp, #-80]
	mov	lr, r1
	cmp	r1, r2
	ldr	ip, [ip, #32]
	str	r0, [fp, #-60]
	mov	r0, #1
	mla	r1, r5, ip, r4
	ldr	r10, [r1, #128]
	mov	r10, r0, asl r10
	bcs	.L843
	add	r9, lr, #14656
	ldr	r6, [r7, #2508]
	mov	r0, #0
	add	r2, r2, #58368
	add	r1, lr, #58368
	add	r9, r7, r9, lsl #2
	mov	ip, r0
	add	r2, r2, #169
	add	r1, r1, #169
	str	r0, [fp, #-64]
	mov	r0, r7
	add	r2, r7, r2
	str	ip, [fp, #-72]
	str	r2, [fp, #-68]
	add	r2, r7, r1
	str	r3, [fp, #-76]
	str	r2, [fp, #-56]
.L844:
	cmp	r6, #0
	beq	.L850
	ldr	r3, [fp, #-60]
	mov	r2, #0
	ldr	r8, [r9, #-1884]
	mov	r5, r2
	add	r4, r3, #2528
	str	r2, [fp, #-52]
	b	.L847
.L887:
	ldr	r3, [r4]
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L846
	ldr	r0, [r3, #12]
	ldr	r1, [r9]
	cmp	r0, r1
	ldreqb	r3, [r3, #1]	@ zero_extendqisi2
	beq	.L885
.L846:
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	r5, r6
	beq	.L886
.L847:
	cmp	r8, #0
	bne	.L887
	ldr	r7, [r4]
	mov	r1, r10
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L846
	ldr	r0, [r7, #12]
	bl	__aeabi_idivmod
	ldr	r0, [r9]
	str	r1, [fp, #-48]
	mov	r1, r10
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-48]
	cmp	r3, r1
	bne	.L846
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
.L885:
	cmp	r3, #0
	add	r5, r5, #1
	ldr	r3, [fp, #-52]
	add	r4, r4, #4
	movne	r3, #1
	cmp	r5, r6
	str	r3, [fp, #-52]
	bne	.L847
.L886:
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	beq	.L850
.L848:
	ldr	r3, [fp, #-56]
	add	r9, r9, #4
	ldr	r2, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	cmp	r3, r2
	bne	.L844
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-76]
	cmp	r2, #0
	beq	.L852
.L851:
	ldr	r2, [fp, #-60]
	mov	r7, #0
	ldr	r0, [fp, #-72]
	add	r4, r2, #58368
	ldr	r10, [fp, #-80]
	mov	r9, r2
	mov	r8, r4
	add	r4, r4, #188
	add	r8, r8, #169
.L856:
	cmp	r6, #0
	beq	.L857
	add	lr, r9, #2512
	mov	r5, #0
	add	lr, lr, #12
	mov	r2, r5
	str	r0, [fp, #-48]
	b	.L854
.L853:
	cmp	r2, r6
	beq	.L888
.L854:
	ldr	r1, [lr, #4]!
	add	r2, r2, #1
	ldr	r0, [r1, #52]
	cmp	r0, #0
	bne	.L853
	ldr	ip, [r4]
	ldr	r0, [r3, #2016]
	add	r0, r0, ip
	ldr	ip, [r1, #12]
	cmp	ip, r0
	bne	.L853
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #0
	movne	r5, #1
	cmp	r2, r6
	bne	.L854
.L888:
	cmp	r5, #0
	ldr	r0, [fp, #-48]
	beq	.L857
.L855:
	add	r7, r7, #1
	add	r4, r4, #4
	cmp	r7, r10
	add	r8, r8, #1
	bcc	.L856
	str	r0, [fp, #-72]
.L852:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ldrne	r3, [fp, #-84]
	movne	r0, #0
	ldrne	r2, [fp, #-64]
	moveq	r0, #1
	strne	r2, [r3]
.L884:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L857:
	ldr	r2, [r3, #2016]
	ldr	ip, [r4]
	ldr	r1, [r9, #200]
	add	r2, r2, ip
	cmp	r2, r1
	blt	.L855
	ldrb	r1, [r8]	@ zero_extendqisi2
	cmp	r1, #0
	ldr	r1, [fp, #-64]
	movne	r0, #1
	movne	r1, r2
	str	r1, [fp, #-64]
	b	.L855
.L850:
	ldr	r3, [fp, #-76]
	ldr	r0, [r9, #-68]
	ldr	r2, [r3, #2016]
	ldr	r3, [fp, #-60]
	add	r2, r2, r0
	ldr	r1, [r3, #200]
	cmp	r2, r1
	blt	.L848
	ldr	r3, [fp, #-56]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-64]
	cmp	r1, #0
	movne	r3, r2
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	movne	r3, #1
	str	r3, [fp, #-72]
	b	.L848
.L843:
	ldr	r2, [fp, #-80]
	cmp	r2, #0
	beq	.L884
	ldr	r1, [fp, #-60]
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-72]
	ldr	r6, [r1, #2508]
	b	.L851
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
	ldr	r3, [r0, #2324]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_SetFrmRepeatCount.part.4
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
	add	r2, r2, #576
	add	r4, r4, #256
	mov	r5, #0
.L896:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L892
	cmp	r2, #0
	beq	.L893
	ldr	lr, [r0, #2508]
	cmp	lr, #0
	beq	.L893
	ldr	r1, [r0, #2528]
	cmp	r1, r2
	beq	.L892
	add	r1, r0, #2528
	b	.L894
.L895:
	ldr	ip, [r1, #4]!
	cmp	ip, r2
	beq	.L892
.L894:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L895
.L893:
	add	r5, r5, #1
.L892:
	add	r2, r2, #752
	cmp	r2, r4
	bne	.L896
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
	ldr	r1, [r10, #1156]
	cmp	r1, #0
	beq	.L930
	add	r9, r0, #58368
	mov	r7, #0
	add	ip, r0, #53248
	mov	r6, r7
	mov	r8, r9
	add	r9, r9, #168
	add	r8, r8, #188
.L914:
	ldrb	r3, [r9, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L908
	ldr	r4, [r5, #2508]
	ldr	lr, [ip, #2016]
	ldr	r3, [r8]
	cmp	r4, #0
	add	lr, lr, r3
	beq	.L908
	ldr	r1, [r5, #2528]
	ldr	r3, [r1, #12]
	cmp	r3, lr
	addne	r2, r5, #2528
	movne	r3, #0
	bne	.L911
	b	.L962
.L913:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, lr
	beq	.L909
.L911:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L913
.L908:
	ldr	r1, [r10, #1156]
	add	r6, r6, #1
	add	r8, r8, #4
	cmp	r1, r6
	bhi	.L914
.L907:
	ldr	r2, [r5, #2504]
	str	r7, [r5, #2520]
	cmp	r2, r7
	addhi	r3, r7, #648
	movhi	r0, #0
	addhi	r3, r5, r3, lsl #2
	bls	.L919
.L918:
	add	r7, r7, #1
	str	r0, [r3, #4]!
	cmp	r7, r2
	bne	.L918
.L919:
	ldr	r8, [r10, #1160]
	add	r8, r1, r8
	cmp	r8, r6
	movls	r7, #0
	bls	.L917
	add	r9, r6, #14592
	add	r10, r6, #58368
	add	r9, r9, #47
	add	r10, r10, #168
	add	r10, r5, r10
	add	ip, r5, #53248
	add	r9, r5, r9, lsl #2
	mov	r7, #0
.L926:
	ldrb	r3, [r10, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L920
	ldr	r4, [r5, #2508]
	ldr	lr, [ip, #2016]
	ldr	r3, [r9]
	cmp	r4, #0
	add	lr, lr, r3
	beq	.L920
	ldr	r1, [r5, #2528]
	ldr	r3, [r1, #12]
	cmp	r3, lr
	addne	r2, r5, #2528
	movne	r3, #0
	bne	.L923
	b	.L963
.L925:
	ldr	r1, [r2, #4]!
	ldr	r0, [r1, #12]
	cmp	r0, lr
	beq	.L921
.L923:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L925
.L920:
	add	r6, r6, #1
	add	r9, r9, #4
	cmp	r8, r6
	bhi	.L926
.L966:
	ldr	r2, [r5, #2504]
.L917:
	cmp	r2, r7
	str	r7, [r5, #2524]
	bls	.L906
	add	r1, r7, #664
	mov	r3, #0
	add	r1, r1, #1
	add	r5, r5, r1, lsl #2
.L928:
	add	r7, r7, #1
	str	r3, [r5, #4]!
	cmp	r7, r2
	bne	.L928
.L906:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L962:
	mov	r3, #0
.L909:
	add	r4, r5, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r3, [r4, #2528]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L964
.L912:
	mov	r2, #1
	str	r2, [r3, #56]
	ldr	r2, [r4, #2528]
	mov	r1, #0
	add	r3, r5, r7, lsl #2
	add	r7, r7, #1
	str	r1, [r2, #52]
	ldr	r2, [r4, #2528]
	str	r2, [r3, #2596]
	b	.L908
.L963:
	mov	r3, #0
.L921:
	add	r4, r5, r3, lsl #2
	mov	r2, #1
	strb	r2, [r1, #1]
	ldr	r3, [r4, #2528]
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L965
.L924:
	mov	r2, #1
	str	r2, [r3, #56]
	ldr	r2, [r4, #2528]
	add	r3, r7, #664
	mov	r1, #0
	add	r6, r6, #1
	add	r3, r3, #2
	cmp	r8, r6
	str	r1, [r2, #52]
	add	r7, r7, #1
	ldr	r2, [r4, #2528]
	add	r9, r9, #4
	str	r2, [r5, r3, asl #2]
	bhi	.L926
	b	.L966
.L964:
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	str	ip, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [r4, #2528]
	ldr	ip, [fp, #-48]
	b	.L912
.L965:
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	str	ip, [fp, #-48]
	bl	FSP_SetRef
	ldr	r3, [r4, #2528]
	ldr	ip, [fp, #-48]
	b	.L924
.L930:
	mov	r7, r1
	mov	r6, r1
	b	.L907
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
	ldr	r2, [r0, #2320]
	movw	ip, #2024
	ldr	r3, [r3, #2044]
	add	r10, r0, #57344
	ldr	lr, [r0, #2316]
	movw	r4, #26164
	ldr	r5, [r10, #1160]
	mov	r1, #1
	mla	ip, ip, r3, r2
	ldr	r2, [r10, #1156]
	ldr	r3, [r10, #1164]
	add	r2, r2, r5
	sub	r2, r2, #1
	sub	r9, r3, #1
	cmp	r9, r2
	ldr	ip, [ip, #32]
	mla	r2, r4, ip, lr
	ldr	r8, [r2, #128]
	mov	r8, r1, asl r8
	ble	.L978
	add	r7, r3, #14592
	add	r3, r3, #58368
	add	r7, r7, #63
	add	r3, r3, #169
	add	r3, r0, r3
	sub	r8, r8, #1
	add	r7, r0, r7, lsl #2
	mov	r6, #0
	str	r6, [fp, #-48]
	mov	r6, r3
	str	r1, [fp, #-52]
.L974:
	ldrb	r3, [r6, #-1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L969
	ldrb	r4, [r7, #-1884]	@ zero_extendqisi2
	ldr	lr, [r7]
	ldr	r5, [r0, #2508]
	cmp	r4, #0
	andeq	lr, lr, r8
	cmp	r5, #0
	ble	.L969
	add	r1, r0, #2512
	mov	r3, #0
	add	r1, r1, #12
	b	.L973
.L972:
	add	r3, r3, #1
	cmp	r3, r5
	beq	.L969
.L973:
	ldr	ip, [r1, #4]!
	cmp	r4, #0
	ldr	r2, [ip, #12]
	andeq	r2, r2, r8
	cmp	lr, r2
	bne	.L972
	ldr	r1, [fp, #-48]
	add	r3, r0, r3, lsl #2
	ldr	lr, [fp, #-52]
	add	r2, r0, r1, lsl #2
	add	r1, r1, #1
	strb	lr, [ip, #1]
	mov	ip, #0
	str	r1, [fp, #-48]
	ldr	r1, [r3, #2528]
	str	ip, [r1, #56]
	ldr	r1, [r3, #2528]
	str	lr, [r1, #52]
	ldr	r3, [r3, #2528]
	str	r3, [r2, #2732]
.L969:
	ldr	r3, [r10, #1156]
	sub	r9, r9, #1
	ldr	r2, [r10, #1160]
	sub	r7, r7, #4
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r9
	blt	.L974
	ldr	r6, [fp, #-48]
	mov	r2, r6
.L968:
	ldr	r3, [r0, #2504]
	str	r2, [r0, #2516]
	cmp	r3, r6
	ble	.L967
	add	r1, r6, #680
	mov	r2, #0
	add	r1, r1, #2
	add	r0, r0, r1, lsl #2
.L976:
	add	r6, r6, #1
	str	r2, [r0, #4]!
	cmp	r6, r3
	bne	.L976
.L967:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L978:
	mov	r2, #0
	mov	r6, r2
	b	.L968
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
	beq	.L986
	ldr	ip, [r0, #2800]
	cmp	ip, #0
	beq	.L995
	ldr	r4, [r0, #2808]
	cmp	r4, #0
	addne	r3, r0, #2800
	movne	r4, #0
	addne	r3, r3, #8
	bne	.L990
	b	.L988
.L993:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L988
.L990:
	add	r4, r4, #1
	cmp	r4, ip
	bne	.L993
.L995:
	mvn	r0, #6
.L999:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L988:
	ldr	r1, [r6, #32]
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	subs	ip, r0, #0
	beq	.L991
	ldr	r3, [ip, #680]
	cmp	r3, #0
	beq	.L991
	add	r2, r5, r4, lsl #2
	mov	r0, #1
	mov	r3, r4
	ldr	r1, .L1000
	str	r0, [r2, #2808]
	mov	r0, #13
	ldr	ip, [ip, #680]
	ldr	ip, [ip, #8]
	str	ip, [r2, #2872]
	ldr	ip, [r6, #12]
	str	ip, [r2, #2936]
	ldr	r2, [r5, #2804]
	add	r2, r2, #1
	str	r2, [r5, #2804]
	ldr	r2, [r6, #260]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r6, #28]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L991:
	ldrb	r1, [r6, #1]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r2, [r6, #32]
	ldr	r3, [r6, #12]
	stmia	sp, {r1, ip}
	str	r0, [sp, #8]
	ldr	r1, .L1000+4
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L999
.L986:
	mov	r0, r6
	movw	r3, #9414
	ldr	r2, .L1000+8
	ldr	r1, .L1000+12
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L999
.L1001:
	.align	2
.L1000:
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
	ldr	r0, [r0, #244]
	ldr	r1, [r1, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1003
	ldrsb	r2, [r0, #1]
	cmp	r2, #3
	cmpne	r2, #0
	moveq	r0, #1
	movne	r0, #0
	beq	.L1022
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1009
	ldr	r2, [r4, #4]
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1008
	cmp	r3, #1
	beq	.L1008
.L1019:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1022:
	ldr	r3, [r4, #32]
	mov	r0, #13
	str	r2, [sp]
	ldr	r1, .L1023
	ldr	r2, .L1023+4
	bl	dprint_vfmw
.L1005:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1009
	ldr	r3, [r4, #12]
	mov	r0, #1
	ldr	r2, .L1023+4
	ldr	r1, .L1023+8
	bl	dprint_vfmw
	mvn	r0, #2
	b	.L1019
.L1003:
	ldr	lr, [r4, #32]
	mov	r2, r4
	ldr	ip, [r4, #8]
	mov	r0, #1
	ldr	r3, [r4, #12]
	ldr	r1, .L1023+12
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	b	.L1005
.L1008:
	str	r3, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	mov	r3, r4
	ldr	r2, .L1023+4
	ldr	r1, .L1023+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1019
.L1009:
	mov	r2, #1
	mov	r3, #2
	strb	r2, [r4, #2]
	mvn	r0, #2
	str	r3, [r4, #8]
	b	.L1019
.L1024:
	.align	2
.L1023:
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
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
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
	ldr	r3, [ip, #1696]
	ldr	lr, [r4, #16]
	str	r3, [r4, #240]
	ldr	r3, [r1, #3736]
	add	r3, r3, #12288
	ldr	r3, [r3, #180]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	moveq	r2, #0
	beq	.L1026
	mov	r2, #256
	movt	r2, 1
	cmp	r3, r2
	movne	r2, #1
	bne	.L1026
	add	r3, r0, #4096
	ldr	r2, [r3, #448]
	subs	r2, r2, #1
	movne	r2, #1
.L1026:
	ldr	r3, [r1, #3740]
	ldrb	r3, [r3, #2633]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r5, #3
	beq	.L1027
	ldr	r3, [r4, #744]
	cmp	r3, #1
	cmpne	r3, #11
	moveq	r5, #1
	bne	.L1044
.L1028:
	ldr	r2, [r4, #748]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L1027:
	ldrb	r3, [r4, #205]	@ zero_extendqisi2
	mov	r1, #2
	ldrb	ip, [r4, #204]	@ zero_extendqisi2
	bfi	r3, r1, #4, #2
	ldrb	r1, [r4, #206]	@ zero_extendqisi2
	bfi	r3, r5, #2, #2
	bfi	ip, lr, #0, #2
	bfi	r3, r2, #0, #2
	strb	ip, [r4, #204]
	strb	r3, [r4, #205]
	bfc	r1, #1, #1
	strb	r1, [r4, #206]
	ldr	r3, [r0, #2324]
	ldr	r1, [r4, #4]
	ldrb	r2, [r4, #206]	@ zero_extendqisi2
	ldr	r3, [r3, #592]
	cmp	r1, #0
	ldr	r1, [r4, #32]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	bfi	r2, r3, #2, #1
	ldrne	r3, [r4, #20]
	strb	r2, [r4, #206]
	strne	r3, [r4, #264]
	ldr	r0, [r0, #244]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L1045
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
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1044:
	bic	r3, r3, #8
	cmp	r3, #2
	moveq	r5, #2
	movne	r5, #3
	b	.L1028
.L1046:
	.align	2
.L1045:
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
	ldr	r5, [r6, #1300]
	mov	r2, #664
	ldr	r3, [r6, #1280]
	add	r1, r1, #24
	add	r0, r5, #80
	str	r3, [r5, #20]
	bl	memcpy
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_GetImagePara
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L1069
	ldr	r2, [r5, #20]
	cmp	r2, #0
	str	r2, [r7, #184]
	bne	.L1050
.L1055:
	ldrb	r3, [r6, #1240]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1070
.L1052:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	add	r3, r4, #62464
	ldr	r0, [r4, #244]
	add	r3, r3, #216
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L1071
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #24]
	bcs	.L1072
.L1059:
	ldr	r2, [r4, #284]
	mov	r0, #0
	ldr	r3, [r4, #276]
	add	r2, r2, #1
	str	r2, [r4, #284]
	add	r3, r3, #1
	str	r3, [r4, #276]
.L1049:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1050:
	ldr	r8, [r6, #1252]
	cmp	r8, #0
	beq	.L1073
.L1053:
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #4]
	cmp	r3, r2
	bcs	.L1055
	ldr	r1, [r5, #32]
	mov	r2, #0
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	ldr	r1, [r4, #2324]
	ldr	r3, [r7, #184]
	mov	r0, #1
	ldr	r2, .L1074
	ldr	ip, [r1, #4]
	ldr	r1, .L1074+4
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1049
.L1070:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetRef
	b	.L1052
.L1072:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L1059
.L1073:
	ldr	r2, .L1074
	mov	r0, #1
	ldr	r1, .L1074+8
	bl	dprint_vfmw
	ldr	r3, .L1074+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1054
	mov	r3, r8
	mov	r2, r8
	mov	r1, #111
	ldr	r0, [r4, #244]
	blx	ip
.L1054:
	ldr	r2, [r7, #184]
	cmp	r2, #0
	bne	.L1053
	b	.L1055
.L1071:
	ldr	r2, .L1074
	mov	r0, #1
	ldr	r1, .L1074+16
	bl	dprint_vfmw
	ldr	r0, [r4, #244]
	ldr	r1, [r5, #32]
	mov	r2, #0
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L1049
.L1069:
	ldr	r2, .L1074
	ldr	r1, .L1074+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1049
.L1075:
	.align	2
.L1074:
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
	bne	.L1079
	add	r3, r4, #53248
	add	r1, r4, #61440
	mov	r2, #1
	mov	ip, #2
	ldr	r0, [r3, #1300]
	str	ip, [r0, #8]
	mov	r0, r5
	str	r2, [r1, #1592]
	ldr	r1, [r3, #1248]
	str	r1, [r4, #212]
	ldr	r3, [r3, #1300]
	strb	r2, [r3, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1079:
	ldr	r2, .L1080
	mov	r0, #1
	ldr	r1, .L1080+4
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1081:
	.align	2
.L1080:
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
	bhi	.L1084
	mov	r3, #752
	mla	r1, r3, r1, r0
	add	r1, r1, #68608
	ldrb	r0, [r1, #577]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1084:
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
	ldr	r0, [r0, #244]
	mov	r8, r1
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1090
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	addne	r4, r0, #600
	addne	r9, r0, #632
	movne	r6, #0
	movne	r7, #0
	beq	.L1095
.L1089:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1096
.L1088:
	cmp	r4, r9
	bne	.L1089
	ldr	r0, [r5, #244]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1096:
	mov	r1, r2
	ldr	r0, [r5, #244]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1088
.L1095:
	ldr	r1, .L1097
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1090:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1098:
	.align	2
.L1097:
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
	bhi	.L1109
	ldr	r3, .L1111
	mov	r2, #32
	mov	r1, r4
	sub	r0, fp, #60
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5, #2324]
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
	beq	.L1102
	ldr	r2, [r5, #2504]
	mov	r1, #5
	ldrb	r3, [fp, #12]	@ zero_extendqisi2
	strb	r4, [fp, #-56]
	strb	r1, [fp, #-55]
	strb	r2, [fp, #-57]
.L1106:
	sub	r1, fp, #60
	ldr	r0, [r5, #244]
	strb	r3, [fp, #-54]
	mov	r3, #0
	strb	r3, [fp, #-58]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L1103
	ldr	r1, [r5, #2324]
	sub	r3, fp, #64
	ldr	r0, [r5, #244]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L1110
	cmp	r0, #0
	moveq	r0, #1
	bne	.L1105
.L1108:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1102:
	mov	r3, #1
	mov	r2, #5
	strb	r4, [fp, #-56]
	strb	r3, [fp, #-57]
	strb	r2, [fp, #-55]
	b	.L1106
.L1110:
	add	r0, r5, #62464
	add	r0, r0, #216
	bl	ResetVoQueue
.L1105:
	ldr	r1, .L1111+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L1108
.L1109:
	mov	r3, r2
	mov	r0, #0
	mov	r2, r1
	ldr	r1, .L1111+8
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1103:
	ldr	r1, .L1111+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L1108
.L1112:
	.align	2
.L1111:
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
	bhi	.L1117
	sub	r2, r3, #8448
	movw	ip, #4749
	sub	r2, r2, #52
	cmp	r2, ip
	movls	r3, #1
	strlsb	r3, [r0, #3]
	bls	.L1115
	sub	r3, r3, #13248
	movw	r2, #1749
	sub	r3, r3, #2
	cmp	r3, r2
	bhi	.L1117
	mov	r3, #2
	strb	r3, [r0, #3]
.L1115:
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
.L1117:
	mov	r3, #0
	strb	r3, [r0, #3]
	b	.L1115
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
	ldr	r1, .L1139
	mov	r4, r0
	ldrb	r2, [r0]	@ zero_extendqisi2
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldr	r1, .L1139+4
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r1, .L1139+8
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	ldr	r1, .L1139+12
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #4]
	ldr	r1, .L1139+16
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r2, [r4, #6]
	ldr	r1, .L1139+20
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ldr	r1, .L1139+24
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #9]	@ zero_extendqisi2
	ldr	r1, .L1139+28
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	mov	r0, #32
	cmp	r5, #0
	bne	.L1121
	ldr	r1, .L1139+32
	bl	dprint_vfmw
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	ldr	r1, .L1139+36
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	ldr	r1, .L1139+40
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #13]	@ zero_extendqisi2
	ldr	r1, .L1139+44
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #14]	@ zero_extendqisi2
	ldr	r1, .L1139+48
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r2, [r4, #15]	@ zero_extendqisi2
	ldr	r1, .L1139+52
	mov	r0, #32
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #15
	addne	r6, r4, #26
	beq	.L1126
.L1125:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1139+56
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1139+60
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1125
.L1126:
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1139+64
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #38
	addne	r6, r4, #45
	movne	r5, #0
	beq	.L1127
.L1128:
	mov	r3, r5
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	ldr	r1, .L1139+68
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1139+72
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1128
.L1127:
	movw	r2, #290
	ldr	r1, .L1139+76
	mov	r0, #32
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1121:
	ldr	r1, .L1139+80
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #10
	addne	r6, r4, #78
	movne	r5, #0
	beq	.L1133
.L1132:
	mov	r2, r5
	ldrh	r3, [r7, #2]!
	ldr	r1, .L1139+84
	mov	r0, #32
	bl	dprint_vfmw
	ldrh	r3, [r6, #2]!
	mov	r2, r5
	ldr	r1, .L1139+88
	mov	r0, #32
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1132
.L1133:
	ldrb	r2, [r4, #148]	@ zero_extendqisi2
	mov	r0, #32
	ldr	r1, .L1139+92
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r7, r4, #148
	addne	r6, r4, #216
	movne	r5, #0
	beq	.L1131
.L1134:
	mov	r3, r5
	ldrh	r2, [r7, #2]!
	ldr	r1, .L1139+96
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, r5
	ldrh	r2, [r6, #2]!
	mov	r0, #32
	ldr	r1, .L1139+100
	add	r5, r5, #1
	bl	dprint_vfmw
	ldrb	r3, [r4, #148]	@ zero_extendqisi2
	cmp	r3, r5
	bhi	.L1134
.L1131:
	movw	r3, #286
	ldr	r1, .L1139+104
	ldrh	r2, [r4, r3]
	add	r4, r4, #288
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r1, .L1139+108
	ldrh	r2, [r4]
	mov	r0, #32
	bl	dprint_vfmw
	b	.L1127
.L1140:
	.align	2
.L1139:
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
	beq	.L1186
	ldrb	r2, [r4, #3206]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1188
.L1186:
	add	r0, r4, #4096
.L1144:
	ldrb	ip, [r0, #240]	@ zero_extendqisi2
	ldrb	r2, [r4, #3206]	@ zero_extendqisi2
	ldrb	r0, [r4, #3212]	@ zero_extendqisi2
	ldrb	r1, [r4, #3292]	@ zero_extendqisi2
.L1143:
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	mov	r0, #22
	stmia	sp, {r2, ip}
	ldr	r1, .L1191
	ldr	r2, .L1191+4
	bl	dprint_vfmw
	mov	r3, #0
	strb	r3, [r5, #258]
.L1141:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1188:
	add	r0, r4, #4096
	ldrb	ip, [r0, #240]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1144
	ldrb	r1, [r4, #3212]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1145
	ldrb	r1, [r4, #3292]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1189
.L1145:
	mov	r3, #1
	strb	r3, [r5, #258]
	ldr	r0, [r6, #40]
	ldrb	r1, [r4, #3207]	@ zero_extendqisi2
	ldrb	r2, [r4, #3208]	@ zero_extendqisi2
	cmp	r0, #9
	strb	r1, [fp, #-320]
	strb	r2, [fp, #-319]
	bne	.L1147
	ldr	r2, [r6, #48]
	cmp	r2, #9
	streqb	r3, [fp, #-312]
.L1147:
	ldrb	r3, [r4, #3223]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1148
	ldrb	r2, [r4, #3304]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1148
	cmp	r2, #9
	cmpne	r3, #9
	ldrneb	r3, [fp, #-312]	@ zero_extendqisi2
	moveq	r3, #1
	strb	r3, [fp, #-318]
.L1148:
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
	bne	.L1152
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
	beq	.L1157
	sub	r0, fp, #320
	add	r1, r4, #3216
	add	r2, r4, #3232
	add	ip, r0, #15
	add	r1, r1, #14
	add	r2, r2, #13
	add	r0, r0, #26
.L1156:
	add	r3, r3, #1
	ldrb	r6, [r1, #1]!	@ zero_extendqisi2
	ldrb	lr, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, r7
	strb	r6, [ip, #1]!
	strb	lr, [r0, #1]!
	bne	.L1156
.L1157:
	ldrb	r6, [r4, #3261]	@ zero_extendqisi2
	cmp	r6, #0
	strb	r6, [fp, #-282]
	beq	.L1155
	add	r2, r4, #3248
	sub	r0, fp, #280
	add	r4, r4, #3264
	sub	r1, fp, #272
	add	r2, r2, #13
	add	r4, r4, #12
	sub	r0, r0, #2
	sub	r1, r1, #3
	mov	r3, #0
.L1160:
	add	r3, r3, #1
	ldrb	lr, [r2, #1]!	@ zero_extendqisi2
	ldrb	ip, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, r6
	strb	lr, [r0, #1]!
	strb	ip, [r1, #1]!
	bne	.L1160
.L1155:
	ldr	r3, [r5, #264]
	cmp	r3, #0
	bne	.L1190
	ldr	r2, .L1191+4
	mov	r0, #1
	ldr	r1, .L1191+8
	bl	dprint_vfmw
	b	.L1141
.L1152:
	ldrb	r6, [r4, #3748]	@ zero_extendqisi2
	ldr	r2, [r4, #3716]
	add	r6, r6, #1
	ldr	r3, [r4, #3720]
	uxtb	r6, r6
	strh	r2, [fp, #-34]	@ movhi
	cmp	r6, #0
	strb	r6, [fp, #-310]
	strh	r3, [fp, #-32]	@ movhi
	beq	.L1164
	add	r0, r4, #3744
	add	r1, r4, #3936
	add	r0, r0, #6
	add	r1, r1, #12
	sub	r3, fp, #320
	mov	r2, #0
.L1163:
	add	r2, r2, #1
	ldrh	lr, [r0, #2]!
	ldrh	ip, [r1, #2]!
	cmp	r2, r6
	add	r3, r3, #2
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #78]	@ movhi
	bcc	.L1163
.L1164:
	ldrb	lr, [r4, #3749]	@ zero_extendqisi2
	add	lr, lr, #1
	uxtb	lr, lr
	strb	lr, [fp, #-172]
	cmp	lr, #0
	beq	.L1155
	add	r1, r4, #3808
	add	r4, r4, #4000
	add	r1, r1, #8
	add	r4, r4, #14
	sub	r3, fp, #320
	mov	r2, #0
.L1165:
	add	r2, r2, #1
	ldrh	ip, [r1, #2]!
	ldrh	r0, [r4, #2]!
	cmp	r2, lr
	add	r3, r3, #2
	strh	ip, [r3, #148]	@ movhi
	strh	r0, [r3, #216]	@ movhi
	bcc	.L1165
	b	.L1155
.L1190:
	ldr	r3, .L1191+12
	sub	r1, fp, #320
	movw	r2, #290
	ldr	r0, [r5, #272]
	ldr	r3, [r3, #52]
	blx	r3
	movw	r3, #290
	str	r3, [r5, #260]
	b	.L1141
.L1189:
	mov	r0, r1
	b	.L1143
.L1192:
	.align	2
.L1191:
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
.L1194:
	ldr	r7, [r5, #4]!
	add	r0, r0, #1
	cmp	r0, #3
	strh	r7, [r4, #2]!	@ movhi
	ldr	r7, [lr, #4]!
	strh	r7, [r6, #2]!	@ movhi
	bne	.L1194
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
	ldr	r3, [r0, #2320]
	movw	ip, #2024
	mov	r7, r0
	ldr	r2, [r6, #2044]
	movw	r5, #26164
	ldr	r0, [r0, #2316]
	add	lr, r7, #68608
	mov	r1, #0
	add	lr, lr, #576
	mla	r3, ip, r2, r3
	mov	r8, r1
	ldr	r3, [r3, #32]
	strb	r1, [r6, #1241]
	mla	r5, r5, r3, r0
.L1201:
	ldr	r3, [lr, #4]
	cmp	r3, #0
	bne	.L1197
	cmp	lr, #0
	beq	.L1208
	ldr	r1, [r7, #2508]
	cmp	r1, #0
	beq	.L1208
	ldr	r2, [r7, #2528]
	cmp	r2, lr
	beq	.L1197
	add	r2, r7, #2528
	b	.L1199
.L1200:
	ldr	ip, [r2, #4]!
	cmp	ip, lr
	beq	.L1197
.L1199:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L1200
.L1208:
	mov	r3, #752
	add	r0, r6, #1296
	mla	r8, r3, r8, r7
	mov	r4, lr
	mov	r3, #1
	mov	r2, #101
	strb	r3, [r6, #1241]
	add	r0, r0, #8
	add	r8, r8, #68608
	str	r2, [r6, #1280]
	add	r1, r8, #656
	mov	r2, #664
	bl	memcpy
	mov	r9, #0
	str	r4, [r6, #1300]
	str	r9, [r6, #1488]
	str	r9, [r8, #596]
	strb	r9, [r8, #578]
	strb	r9, [r4]
	ldr	r3, [r6, #1300]
	str	r9, [r3, #52]
	ldr	r3, [r6, #1300]
	str	r9, [r3, #56]
	ldr	r3, [r6, #1300]
	str	r9, [r3, #8]
	ldrb	r1, [r6, #1241]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1205
	ldr	r0, [r7, #244]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r7, #244]
	bl	FSP_GetLogicFs
	mvn	r3, r8
	mov	r3, r3, lsr #31
	cmp	r0, #0
	mov	r4, r0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1203
	add	r2, r7, #3440
	add	r1, r5, #2624
	add	r2, r2, #8
	bl	HEVC_ConvertHDRInfo
	ldr	r3, [r7, #2324]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L1212
.L1204:
	ldr	r5, .L1213
	add	r1, r4, #8
	ldr	r0, [r6, #1300]
	mov	r2, #664
	ldr	r3, [r5, #52]
	add	r0, r0, #80
	blx	r3
	ldr	r1, [r6, #1300]
	add	r0, r7, #54528
	ldr	r3, [r5, #52]
	add	r1, r1, #80
	mov	r2, #664
	add	r0, r0, #24
	blx	r3
	ldr	r3, [r6, #1300]
	mov	r0, #0
	str	r8, [r3, #32]
	ldrsb	r3, [r4, #4]
	str	r3, [r6, #1276]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1197:
	add	r8, r8, #1
	add	lr, lr, #752
	cmp	r8, #20
	bne	.L1201
.L1205:
	ldr	r1, .L1213+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1212:
	add	r2, r7, #24576
	ldr	r5, [r4, #172]
	ldr	r3, [r4, #52]
	ldr	r1, [r2, #3740]
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
	b	.L1204
.L1203:
	strb	r3, [r6, #1241]
	mov	r0, r3
	ldr	r1, .L1213+8
	bl	dprint_vfmw
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1214:
	.align	2
.L1213:
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
	ldr	r0, [r0, #244]
	bl	FSP_GetFspType
	cmn	r0, #1
	mov	r4, r0
	movne	r4, #0
	bne	.L1219
	b	.L1222
.L1218:
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1220
	cmp	r4, #32
	beq	.L1223
.L1219:
	mov	r1, r4
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	add	r4, r4, #1
	cmp	r0, #0
	bne	.L1218
	ldr	r1, .L1224
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1222:
	ldr	r1, .L1224+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1220:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1223:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1225:
	.align	2
.L1224:
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
	ldr	r0, [r0, #244]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1240
.L1227:
	add	r9, r5, #69632
	add	r8, r5, #83968
	add	r9, r9, #256
	add	r8, r8, #960
	mov	r6, #0
	mov	r7, #0
.L1230:
	sub	r4, r9, #32
	mov	r3, #0
	strb	r3, [r9, #-703]
	str	r3, [r9, #-700]
.L1229:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1241
.L1228:
	cmp	r4, r9
	bne	.L1229
	add	r9, r4, #752
	cmp	r9, r8
	bne	.L1230
	ldr	r2, [r5, #180]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r3, #0
	add	r5, r5, #2112
	mov	r1, r3
.L1232:
	add	r3, r3, #1
	str	r1, [r5, #4]!
	cmp	r3, r2
	bne	.L1232
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1241:
	mov	r1, r2
	ldr	r0, [r5, #244]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1228
.L1240:
	add	r0, r5, #62464
	add	r0, r0, #216
	bl	ResetVoQueue
	b	.L1227
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
	ldr	r3, [r6, #2528]
	str	r7, [r3, #4]
	ldr	r3, [r6, #2528]
	ldr	r0, [r0, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1243
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L1244
	ldr	r3, [r6, #2528]
	mov	r2, r7
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
.L1244:
	ldr	r3, [r6, #2528]
	mov	r2, #0
	ldr	r0, [r5, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
.L1243:
	ldr	r1, [r5, #2508]
	sub	r1, r1, #1
	cmp	r4, r1
	addls	r3, r4, #632
	addls	r3, r5, r3, lsl #2
	bhi	.L1247
.L1246:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bls	.L1246
.L1247:
	add	r3, r1, #632
	mov	r2, #0
	str	r2, [r5, r3, asl #2]
	str	r1, [r5, #2508]
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
	ldr	r3, [r0, #2508]
	mov	r5, r0
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r7, #0
	mov	r4, r7
	mov	r6, r7
	b	.L1259
.L1258:
	ldr	r3, [r5, #2508]
	add	r4, r4, #1
	cmp	r4, r3
	mov	r7, r4
	bcs	.L1265
.L1259:
	add	r3, r4, #632
	ldr	r3, [r5, r3, asl #2]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1258
	mov	r1, r7
	mov	r0, r5
	strb	r6, [r3]
	sub	r4, r4, #1
	bl	HEVC_RemoveApcStore
	mov	r1, r7
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
	b	.L1258
.L1265:
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
	ldr	r5, [r0, #2508]
	mov	r7, r0
	cmp	r5, #0
	beq	.L1275
	mov	r6, #0
	mvn	r8, #0
	mov	r10, r6
	mov	r9, r6
	b	.L1274
.L1285:
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	cmpne	r3, #3
	ldr	r3, [r4, #2528]
	bne	.L1270
	ldr	r0, [r3, #8]
	cmp	r0, #1
	beq	.L1270
	str	r8, [r3, #32]
	mov	r2, #1
	ldr	r3, [r4, #2528]
	strb	r1, [r3, #1]
	ldr	r3, [r4, #2528]
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2528]
.L1270:
	ldr	r3, [r3]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	addne	r10, r10, #1
	beq	.L1284
	add	r9, r9, #1
	cmp	r9, r5
	beq	.L1267
.L1274:
	add	r4, r7, r10, lsl #2
	ldr	r0, [r7, #244]
	ldr	r3, [r4, #2528]
	ldr	r1, [r3, #32]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L1268
	ldrsb	r1, [r0]
	cmp	r1, #0
	beq	.L1285
	ldr	r3, [r4, #2528]
	b	.L1270
.L1268:
	ldr	r3, [r4, #2528]
	ldr	r1, [r3, #8]
	cmp	r1, #1
	beq	.L1270
	str	r8, [r3, #32]
	mov	r2, #1
	ldr	r3, [r4, #2528]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #2528]
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2528]
	b	.L1270
.L1284:
	mov	r1, r10
	mov	r0, r7
	add	r9, r9, #1
	bl	HEVC_RemoveFrameStoreOutDPB
	cmp	r9, r5
	mov	r6, #1
	bne	.L1274
.L1267:
	mov	r0, r6
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1275:
	mov	r6, r5
	b	.L1267
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
	ldr	r3, [r0, #2504]
	mov	r4, r0
	ldr	r2, [r0, #2508]
	cmp	r2, r3
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	cmp	r3, #15
	bls	.L1289
.L1290:
	ldr	r3, [r4, #2528]
	mov	r5, #0
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetRef
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	HEVC_RemoveFrameStoreOutDPB
.L1289:
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L1290
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
	ldr	r2, [r0, #2508]
	mov	r6, r0
	ldr	r3, [r0, #2504]
	cmp	r2, r3
	bhi	.L1299
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1300:
	add	lr, r6, #2512
	mov	r3, #0
	add	lr, lr, #12
.L1296:
	ldr	r2, [lr, #4]!
	ldr	r4, [r5]
	ldr	ip, [r2, #12]
	cmp	r4, ip
	strgt	ip, [r5]
	strgt	r3, [r7]
	add	r3, r3, #1
	ldr	ip, [r6, #2508]
	cmp	ip, r3
	bhi	.L1296
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1299:
	ldr	r1, .L1301
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #2504]
	cmp	r2, #0
	str	r2, [r6, #2508]
	bne	.L1300
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1302:
	.align	2
.L1301:
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
	ldr	r5, [r0, #2320]
	movw	r6, #2024
	movw	r4, #26164
	ldr	ip, [r3, #2044]
	ldr	r3, [r0, #2316]
	ldr	lr, [fp, #4]
	mla	ip, r6, ip, r5
	ldr	ip, [ip, #32]
	mla	r3, r4, ip, r3
	ldr	ip, [r3, #72]
	ldr	r3, [r3, #76]
	cmp	r1, ip
	cmpeq	lr, #0
	bne	.L1307
	cmp	r2, r3
	beq	.L1308
.L1307:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1308:
	ldr	r3, [r0, #168]
	cmp	r3, #0
	beq	.L1307
	ldr	r3, [r0, #2324]
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
	ldr	r4, [r0, #2332]
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L1320
	mov	r3, #0
	mov	r2, r4
	mov	r1, r3
.L1311:
	add	r3, r3, #1
	ldr	ip, [r2, #48]
	cmp	r3, lr
	add	r2, r2, #28
	add	r1, r1, ip
	bne	.L1311
.L1310:
	ldr	r2, [r0, #2308]
	mov	r3, lr, asl #5
	sub	lr, r3, lr, asl #2
	add	r4, r4, lr
	ldr	r3, [r2, #24]
	and	r3, r3, #7
	str	r3, [r4, #60]
	ldr	r2, [r0, #2332]
	ldr	r3, [r0, #2308]
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	mov	r3, ip, asl #5
	sub	r3, r3, ip, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #52]
	add	r2, r2, lr, lsr #3
	rsb	r2, r1, r2
	str	r2, [r3, #64]
	ldr	ip, [r0, #2332]
	ldr	r3, [r0, #2308]
	ldrb	r2, [ip, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	mov	r3, r2, asl #5
	sub	r2, r3, r2, asl #2
	add	r2, ip, r2
	ldr	r3, [r2, #48]
	add	r3, r1, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [r2, #56]
	ldr	r2, [r0, #2332]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	ldr	r1, [r3, #60]
	and	r2, r2, #3
	add	r2, r1, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2332]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #5
	sub	r3, r3, r1, asl #2
	add	r3, r2, r3
	ldr	r2, [r3, #64]
	bic	r2, r2, #3
	str	r2, [r3, #64]
	ldr	r3, [r0, #2332]
	ldr	r2, [r3, #8]
	sub	ip, r2, #1
	cmp	ip, #1
	bhi	.L1327
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	lr, r1, #1
	cmp	r2, lr
	movhi	r2, #1
	movls	r2, #0
	cmp	lr, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1313
	add	r1, r1, #2
	mov	ip, #0
.L1314:
	sub	r2, r1, #1
	mov	lr, r2, asl #5
	sub	lr, lr, r2, asl #2
	add	r3, r3, lr
	str	ip, [r3, #60]
	ldr	r2, [r0, #2332]
	add	r2, r2, lr
	ldr	r3, [r2, #52]
	str	r3, [r2, #64]
	ldr	r2, [r0, #2332]
	add	r2, r2, lr
	ldr	r3, [r2, #48]
	mov	r3, r3, asl #3
	str	r3, [r2, #56]
	ldr	r3, [r0, #2332]
	add	r3, r3, lr
	ldr	r2, [r3, #64]
	ldr	r4, [r3, #60]
	and	r2, r2, #15
	add	r2, r4, r2, lsl #3
	str	r2, [r3, #60]
	ldr	r2, [r0, #2332]
	add	r3, r2, lr
	ldr	r2, [r3, #64]
	bic	r2, r2, #15
	str	r2, [r3, #64]
	ldr	r3, [r0, #2332]
	ldr	r2, [r3, #8]
	cmp	r1, #1
	cmpls	r1, r2
	add	r1, r1, #1
	movcc	lr, #1
	movcs	lr, #0
	cmp	lr, #0
	bne	.L1314
	sub	ip, r2, #1
.L1313:
	mov	r1, ip, asl #5
	ldr	lr, [r3, #12]
	sub	ip, r1, ip, asl #2
	add	r3, r3, ip
	ldr	r2, [r3, #56]
	rsb	r2, lr, r2
	str	r2, [r3, #56]
	ldr	lr, [r0, #2332]
	ldrb	r1, [lr, #1]	@ zero_extendqisi2
	ldr	r3, [lr, #8]
	cmp	r1, r3
	ldmcsfd	sp, {r4, fp, sp, pc}
	sxth	r3, r1
	add	r0, r0, #53248
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, lr, r3
.L1318:
	ldr	r2, [r3, #64]
	add	r1, r1, #1
	ldr	ip, [r0, #1272]
	add	r3, r3, #28
	cmp	r2, ip
	strcc	r2, [r0, #1272]
	ldr	r2, [lr, #8]
	cmp	r2, r1
	bhi	.L1318
	ldmfd	sp, {r4, fp, sp, pc}
.L1327:
	ldr	r1, .L1328
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L1320:
	mov	r1, lr
	b	.L1310
.L1329:
	.align	2
.L1328:
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
	ldr	r2, [r2, #2044]
	cmp	r2, r3
	bge	.L1338
	movw	r3, #2024
	ldr	r1, [r0, #2320]
	mul	r3, r3, r2
	add	ip, r1, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1339
	ldr	r2, [ip, #32]
	ldr	r3, [r0, #152]
	cmp	r2, r3
	bge	.L1340
	ldr	r1, [r0, #2316]
	movw	r3, #26164
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1341
	ldr	r2, [r3, #52]
	ldr	r3, [r0, #148]
	cmp	r2, r3
	bcs	.L1342
	movw	r3, #23196
	ldr	r1, [r0, #2312]
	mul	r3, r3, r2
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1343
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1338:
	ldr	r1, .L1344
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1339:
	ldr	r1, .L1344+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1340:
	ldr	r1, .L1344+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1341:
	ldr	r1, .L1344+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1342:
	ldr	r1, .L1344+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1343:
	ldr	r1, .L1344+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1345:
	.align	2
.L1344:
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
	ldr	r2, [r0, #2332]
	ldr	r1, [r0, #200]
	ldr	r3, [r2, #16]
	cmn	r1, #-2147483647
	sub	ip, r3, #16
	beq	.L1378
	cmp	r3, #21
	cmpne	ip, #2
	addls	ip, r0, #53248
	ldrls	lr, [ip, #2016]
	bls	.L1352
.L1360:
	sub	r3, r3, #19
	add	ip, r0, #53248
	cmp	r3, #1
	movls	r1, #-2147483647
	strls	r1, [r0, #200]
	ldr	lr, [ip, #2016]
.L1352:
	cmp	lr, r1
	bge	.L1350
	ldr	r3, [r2, #16]
	sub	r4, r3, #8
	cmp	r4, #1
	bls	.L1379
.L1353:
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1354
	ldr	r4, [r0, #204]
	cmp	lr, r4
	bge	.L1354
	ldr	r3, [r2, #16]
	sub	r5, r3, #8
	cmp	r5, #1
	bls	.L1380
.L1354:
	ldrb	r3, [ip, #1971]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1355
	ldr	r2, [r2, #16]
	sub	r1, r2, #19
	cmp	r1, #1
	bls	.L1375
	cmp	r2, #21
	beq	.L1375
	sub	r2, r2, #16
	cmp	r2, #2
	strls	lr, [r0, #204]
	movls	r3, #1
	strlsb	r3, [r0, #8]
.L1355:
	ldr	r2, [r0, #216]
	ldrb	r3, [ip, #1969]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r1, [ip, #2044]
	bne	.L1381
	ldr	r2, [r0, #288]
	cmp	r2, r1
	movne	r0, #1
	beq	.L1382
.L1373:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1378:
	cmp	ip, #5
	bhi	.L1376
	cmp	r3, #21
	cmpne	ip, #2
	bhi	.L1360
	add	ip, r0, #53248
	ldr	lr, [ip, #2016]
	str	lr, [r0, #200]
.L1350:
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1353
	ldr	r3, [r2, #16]
	sub	r4, r3, #8
	cmp	r4, #1
	bhi	.L1353
	str	r3, [sp, #8]
	mov	r0, #1
	str	r1, [sp, #4]
	movw	r3, #10849
	str	lr, [sp]
	ldr	r2, .L1383
	ldr	r1, .L1383+4
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1373
.L1381:
	add	r2, r2, #16896
	ldr	r1, [ip, #2044]
	add	r2, r2, #197
	add	r2, r0, r2, lsl #2
	ldr	r2, [r2, #4]
	cmp	r1, r2
	ldr	r2, [r0, #288]
	movne	r3, #1
	cmp	r2, r1
	movne	r0, #1
	bne	.L1373
	b	.L1382
.L1380:
	str	r3, [sp, #12]
	mov	r0, #1
	stmia	sp, {r1, lr}
	movw	r3, #10859
	str	r4, [sp, #8]
	ldr	r2, .L1383
	ldr	r1, .L1383+8
	bl	dprint_vfmw
.L1376:
	mov	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1382:
	ldr	r0, [r0, #252]
	cmp	r0, lr
	moveq	r0, r3
	movne	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1379:
	str	r3, [sp, #8]
	mov	r0, #1
	str	r1, [sp, #4]
	movw	r3, #10841
	str	lr, [sp]
	ldr	r2, .L1383
	ldr	r1, .L1383+12
	bl	dprint_vfmw
	mov	r0, #2
	b	.L1373
.L1375:
	str	lr, [r0, #204]
	strb	r3, [r0, #8]
	b	.L1355
.L1384:
	.align	2
.L1383:
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	cmp	r0, #0
	beq	.L1390
	ldr	r0, [r4, #2308]
	bl	BsBitsToNextByte
	subs	r1, r0, #0
	beq	.L1389
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r1, .L1391
	mov	r2, r0
	mov	r0, #19
	bl	dprint_vfmw
.L1389:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1390:
	ldr	r1, .L1391+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1392:
	.align	2
.L1391:
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
	ldr	r0, [r0, #2040]
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
	ldr	r0, [r0, #2040]
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
	bne	.L1434
.L1431:
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	str	r0, [r5, #284]
	ble	.L1398
	ldr	r3, [fp, #-152]
	add	r6, r5, #42
	add	r9, r3, #42
	mov	r7, r6
	add	r9, r5, r9
	b	.L1400
.L1399:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r7, #1]!
	cmp	r7, r9
	beq	.L1435
.L1400:
	cmp	r8, #0
	beq	.L1399
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r7, #-5]
	b	.L1399
.L1435:
	ldr	r3, [fp, #-152]
	cmp	r3, #7
	ldrle	r7, [fp, #-152]
	ble	.L1404
	b	.L1410
.L1403:
	cmp	r7, #8
	beq	.L1410
.L1404:
	mov	r1, #2
	ldr	r0, [r4, #2308]
	bl	BsGet
	add	r7, r7, #1
	cmp	r0, #0
	beq	.L1403
	ldr	r1, .L1436
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1398:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1410:
	add	r9, r5, #360
	add	r3, r5, #48
	mov	r7, #0
	b	.L1408
.L1407:
	ldr	r3, [fp, #-152]
	add	r7, r7, #1
	add	r9, r9, #4
	cmp	r3, r7
	mov	r3, r5
	ble	.L1398
.L1408:
	cmp	r8, #0
	beq	.L1432
	ldrb	r2, [r6, #-5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1430
.L1432:
	add	r5, r3, #32
.L1405:
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1407
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r9]
	b	.L1407
.L1430:
	mov	r1, #2
	ldr	r0, [r4, #2308]
	str	r3, [fp, #-156]
	bl	BsGet
	ldr	r3, [fp, #-156]
	mov	r1, #1
	add	r5, r3, #32
	mov	r10, r3
	str	r0, [r9, #-72]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #199]
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r9, #-48]
.L1406:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1]!
	cmp	r10, r5
	bne	.L1406
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #205]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #211]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6, #217]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #223]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2308]
	bl	BsGet
	b	.L1405
.L1434:
	mov	r1, #2
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #1
	ldr	r9, .L1436+4
	mov	r7, r5
	mov	r6, #0
	str	r0, [r5, #276]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r5]
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r5, #272]
.L1397:
	mov	r3, r6
	ldr	ip, [r9, #68]
	ldr	r2, .L1436+8
	mov	r1, #100
	sub	r0, fp, #144
	add	r6, r6, #1
	blx	ip
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	cmp	r6, #32
	strb	r0, [r7, #1]!
	bne	.L1397
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #33]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #34]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #35]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #36]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #12
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r2, [r5, #272]
	add	r3, r4, #86016
	mov	r1, #8
	str	r2, [r3, #1672]
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	str	r2, [r3, #1676]
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	str	r2, [r3, #1680]
	b	.L1431
.L1437:
	.align	2
.L1436:
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
	ldr	r9, .L1456
	add	r10, r0, #2192
	mov	r6, #0
	add	r3, r0, #2208
	str	r0, [fp, #-52]
	str	r3, [fp, #-48]
.L1439:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L1447
	ldr	r3, [fp, #-52]
	mov	r8, r6, asl #9
	ldr	r7, [fp, #-48]
	sub	r8, r8, r6, asl #7
	add	r5, r3, #580
	mov	r4, #0
.L1445:
	cmp	r6, #0
	add	r0, r5, r8
	mov	r2, #64
	ldr	r3, [r9, #52]
	beq	.L1454
	cmp	r6, #3
	beq	.L1455
	ldr	ip, .L1456+4
	cmp	r4, #2
	ldr	r1, .L1456+8
	movhi	r1, ip
	blx	r3
.L1441:
	mov	r3, #16
	str	r3, [r7, #4]!
	ldr	r3, [r10]
	add	r4, r4, #1
	add	r5, r5, #64
	cmp	r3, r4
	bhi	.L1445
.L1447:
	add	r6, r6, #1
	ldr	r3, [fp, #-48]
	cmp	r6, #4
	add	r3, r3, #24
	str	r3, [fp, #-48]
	bne	.L1439
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1454:
	mov	r2, #16
	ldr	r1, .L1456+12
	mov	r0, r5
	blx	r3
	b	.L1441
.L1455:
	ldr	r0, .L1456+4
	cmp	r4, #0
	ldr	r1, .L1456+8
	mov	r2, #64
	movne	r1, r0
	add	r0, r5, #1152
	blx	r3
	b	.L1441
.L1457:
	.align	2
.L1456:
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
	ldr	r7, [lr, #292]
	add	r3, r3, r2
	cmp	r7, #64
	mov	r6, r3, asl #4
	movcs	r7, #64
	mov	r8, r7, lsr #2
.L1459:
	cmp	r5, r8
	ldmcsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r7, #0
	beq	.L1459
	add	r3, r5, r6
	ldrb	ip, [r1]	@ zero_extendqisi2
	mov	r4, r1
	mov	r2, #0
	add	r3, r0, r3, lsl #2
	ldr	lr, [r3, #580]
	orr	ip, lr, ip
	str	ip, [r3, #580]
.L1465:
	add	r2, r2, #1
	add	r3, r5, r6
	and	lr, r2, #3
	cmp	r2, r7
	add	r3, r0, r3, lsl #2
	mov	ip, lr, asl #3
	beq	.L1459
	ldrb	r9, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #3
	ldr	lr, [r3, #580]
	addeq	r5, r5, #1
	orr	ip, lr, r9, asl ip
	str	ip, [r3, #580]
	b	.L1465
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
	ldr	r3, [r6, #3740]
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1467
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r6, #3744]
	bne	.L1468
	ldrb	r3, [r3, #21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1486
.L1469:
	ldr	r8, .L1487
	mov	r1, #0
	mov	r2, #1536
	add	r0, r5, #580
	add	r10, r5, #2192
	mov	r7, r1
	ldr	r3, [r8, #48]
	blx	r3
.L1471:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r9, r7, asl #3
	movne	r4, #0
	subne	r9, r9, r7, asl #1
	beq	.L1475
.L1472:
	add	r0, r9, r4
	ldr	r1, [r6, #3744]
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
	bcc	.L1472
.L1475:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1471
	ldr	r1, [r6, #3744]
	add	r0, r5, #2208
	add	r0, r0, #4
	ldr	r3, [r8, #52]
	add	r1, r1, #1920
	mov	r2, #96
	add	r1, r1, #8
	blx	r3
.L1467:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1468:
	ldrb	r1, [r3, #21]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1469
	ldr	r8, .L1487
	mov	r2, #1536
	add	r0, r0, #580
	mov	r7, r1
	add	r10, r5, #2192
	ldr	r3, [r8, #48]
	blx	r3
.L1476:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r9, r7, asl #3
	movne	r4, #0
	subne	r9, r9, r7, asl #1
	beq	.L1480
.L1477:
	add	r0, r9, r4
	ldr	r1, [r6, #3740]
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
	bcc	.L1477
.L1480:
	add	r7, r7, #1
	cmp	r7, #4
	bne	.L1476
	ldr	r1, [r6, #3740]
	add	r0, r5, #2208
	ldr	r3, [r8, #52]
	mov	r2, #96
	add	r1, r1, #2528
	add	r0, r0, #4
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1486:
	bl	HEVC_SetDefaultScalingList
	b	.L1467
.L1488:
	.align	2
.L1487:
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
	b	.L1490
.L1492:
	.word	.L1496
	.word	.L1494
	.word	.L1494
	.word	.L1495
.L1494:
	ldr	r3, .L1500
	cmp	r1, #2
	add	r0, r3, #64
	movhi	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1496:
	ldr	r0, .L1500+4
	ldmfd	sp, {fp, sp, pc}
.L1495:
	ldr	r3, .L1500
	cmp	r1, #0
	add	r0, r3, #64
	movne	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1490:
	ldr	r1, .L1500+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1501:
	.align	2
.L1500:
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
	bne	.L1512
	sub	ip, r3, #1
	mov	r4, #1
	movs	ip, ip, asr #1
	beq	.L1504
.L1505:
	movs	ip, ip, asr #1
	add	r4, r4, #1
	bne	.L1505
.L1504:
	mov	r1, #1
	ldr	r0, [r6, #2308]
	bl	BsGet
	cmp	r5, #1
	movls	r10, #0
	movhi	r10, #1
	uxtb	r0, r0
	strb	r0, [r8]
	cmp	r0, #0
	cmpne	r5, #1
	bls	.L1509
	ldr	r3, [r7, #168]
	cmp	r3, #0
	beq	.L1509
	mov	r9, r8
	mov	r5, #0
.L1510:
	mov	r1, r4
	ldr	r0, [r6, #2308]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7, #168]
	cmp	r3, r5
	bhi	.L1510
.L1509:
	ldr	r5, [r7, #60]
	cmp	r5, #0
	beq	.L1527
.L1508:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1527:
	mov	r1, #1
	ldr	r0, [r6, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #1]
	cmp	r0, #0
	moveq	r10, #0
	andne	r10, r10, #1
	cmp	r10, #0
	beq	.L1508
	ldr	r3, [r7, #172]
	cmp	r3, #0
	beq	.L1508
	add	r8, r8, #128
.L1511:
	mov	r1, r4
	ldr	r0, [r6, #2308]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r8, #4]!
	ldr	r3, [r7, #172]
	cmp	r3, r5
	bhi	.L1511
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1512:
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
	ldr	r0, [r0, #2308]
	bl	BsResidBits
	subs	r3, r0, #0
	ble	.L1530
	ldr	r2, [r4, #2332]
	ldr	r0, [r2, #12]
	add	r0, r0, #3
	cmp	r3, r0
	movls	r0, #0
	movhi	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1530:
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
	ldr	r0, [r0, #2308]
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #24]
	mov	r2, r2, asl #3
	cmp	r2, r3
	bls	.L1534
	mov	r1, #8
	bl	BsShow
	subs	r0, r0, #128
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1534:
	ldr	r1, .L1535
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1536:
	.align	2
.L1535:
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
.L1549:
	ldr	r3, [r6, #2332]
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
.L1538:
	ldrb	r4, [r3]	@ zero_extendqisi2
	rsb	r5, r0, ip
	cmp	r4, #0
	bne	.L1550
	ldr	r2, [r6, #2332]
	add	r1, r1, #1
	add	lr, r2, r5
	ldr	r2, [r2, #44]
	cmp	r2, r3
	beq	.L1551
	ldr	r2, [lr, #44]
	cmp	r2, r3
	sub	r3, r3, #1
	bne	.L1538
	ldr	r1, [lr, #68]
	ldr	r0, [r6, #244]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r6, #2332]
	mov	r1, r4
	add	r5, r3, r5
	str	r4, [r5, #44]
	ldr	r2, [r6, #2332]
	ldr	r3, [r2, #8]
	sub	r3, r3, #1
	str	r3, [r2, #8]
	b	.L1549
.L1550:
	tst	r4, #1
	mov	r3, #1
	moveq	r2, r3
	bne	.L1545
.L1546:
	ands	r0, r4, r2, asl r3
	add	r3, r3, #1
	bne	.L1545
	cmp	r3, #8
	bne	.L1546
	ldr	r1, .L1552
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1551:
	ldr	r1, .L1552+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1545:
	ldr	ip, [r6, #2332]
	mov	r2, #0
	add	r1, r3, r1, lsl #3
	mov	r0, r2
	str	r2, [ip, #4]
	ldr	r3, [r6, #2332]
	str	r1, [r3, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1553:
	.align	2
.L1552:
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
	blt	.L1555
	add	r7, r6, #1
	mov	r0, r3
	mov	r5, #100
	mov	r1, r7
	bl	__aeabi_uidivmod
	add	r2, r9, #65536
	ldr	r8, [r2, #2840]
	mla	r2, r5, r1, r8
	mov	r3, r1
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L1556
	mov	r4, #0
	b	.L1558
.L1559:
	bl	__aeabi_uidivmod
	mla	r2, r5, r1, r8
	mov	r3, r1
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L1556
.L1558:
	add	r4, r4, #1
	mov	r1, r7
	cmp	r4, r6
	add	r0, r3, r4
	ble	.L1559
.L1555:
	mvn	r0, #0
	str	r3, [r9, #140]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1556:
	cmp	r3, r7
	mov	r0, r3
	str	r3, [r9, #140]
	bcs	.L1569
	mov	r3, #100
	mov	r2, #1
	mla	r8, r3, r0, r8
	str	r2, [r8, #36]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1569:
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
	beq	.L1578
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	str	r3, [r5, #36]
	str	r3, [r5, #40]
.L1573:
	ldr	r3, [r4, #44]
	mov	r0, r6
	cmp	r3, #0
	beq	.L1572
	ldr	r1, [r4, #68]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #48]
	ldr	r3, [r4, #44]
	mov	r0, #7
	ldr	r2, .L1579
	ldr	r1, .L1579+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #44]
	str	r3, [r4, #60]
	str	r3, [r4, #48]
.L1572:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L1573
	ldr	r3, .L1579+8
	mov	r0, r5
	mov	r2, #100
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L1578:
	mov	r0, r5
	movw	r3, #12146
	ldr	r2, .L1579+12
	ldr	r1, .L1579+16
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1580:
	.align	2
.L1579:
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
	add	r0, r0, #2720
	add	r1, r7, #2656
	ldr	r3, [r3, #3740]
	add	r2, r7, #2512
	mov	lr, #0
	add	r1, r1, #4
	add	r2, r2, #12
	add	ip, r7, #2592
	ldr	r3, [r3, #236]
	mov	r6, #17
	add	r3, r3, #1
	cmp	r3, #17
	movhi	r3, #17
	str	r3, [r0, #-216]
	add	r0, r0, #8
	mov	r3, lr
	str	lr, [r7, #2508]
	str	lr, [r7, #2520]
	str	lr, [r7, #2524]
	str	lr, [r7, #2516]
	str	lr, [r7, #2512]
.L1584:
	subs	r6, r6, #1
	str	r3, [r0, #4]!
	str	r3, [ip, #4]!
	str	r3, [r1, #4]!
	str	r3, [r2, #4]!
	bne	.L1584
	add	r4, r7, #68608
	ldr	r10, .L1617
	add	r4, r4, #656
	mov	r8, r6
.L1585:
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
	ldr	r3, .L1617
	bne	.L1585
	ldr	r3, [r3, #48]
	mov	r2, #200
	mov	r1, r5
	add	r0, r7, #2800
	blx	r3
	add	r2, r7, #2320
	add	r2, r2, #12
	add	r3, r7, #2400
	mov	r1, r5
	str	r9, [r7, #2800]
	str	r5, [r7, #2804]
.L1586:
	str	r1, [r2, #4]!
	cmp	r2, r3
	mov	r0, #0
	bne	.L1586
	add	r1, r7, #2464
	add	lr, r7, #53248
	add	r1, r1, #4
	mov	ip, r0
	str	r0, [lr, #2128]
.L1587:
	str	ip, [r3, #4]!
	cmp	r3, r1
	mov	r2, #0
	bne	.L1587
	str	r2, [lr, #2132]
	ldr	r1, [r7, #180]
	cmp	r1, r2
	movne	r3, r2
	addne	r2, r7, #2112
	movne	r0, r3
	beq	.L1592
.L1591:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L1591
.L1592:
	ldr	r3, [r7, #160]
	cmp	r3, #0
	beq	.L1616
	mov	r4, #0
	add	r8, r7, #65536
	mov	r5, r4
.L1597:
	ldr	r3, [r8, #3644]
	add	r3, r3, r6
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L1593
	ldr	r3, [r7, #2332]
	cmp	r1, r3
	beq	.L1593
	ldr	r0, [r7, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3644]
	add	r3, r3, r6
	str	r5, [r3, #24]
	ldr	r3, [r7, #208]
	ldr	r2, [r7, #216]
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r7, #208]
	ldr	r3, [r7, #172]
	cmp	r2, #0
	subne	r2, r2, #1
	str	r2, [r7, #216]
	cmp	r3, #2
	subhi	r3, r3, #1
	movls	r3, #2
	str	r3, [r7, #172]
.L1593:
	ldr	r3, [r7, #160]
	add	r4, r4, #1
	add	r6, r6, #28
	cmp	r3, r4
	bhi	.L1597
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1616:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1618:
	.align	2
.L1617:
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
	beq	.L1630
	ldr	r3, [r6, #2508]
	add	r8, r6, #2512
	cmp	r3, #0
	addne	r8, r8, #12
	movne	r3, #0
	movne	ip, #1
	movne	r1, r8
	beq	.L1645
.L1624:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	streqb	ip, [r2, #2]
	ldr	r2, [r6, #2508]
	cmp	r2, r3
	bhi	.L1624
.L1625:
	mov	r4, r6
	mov	r7, #17
	mov	r5, #0
	mov	r3, #-2147483647
	str	r3, [r6, #212]
.L1622:
	ldr	r3, [r8, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L1626
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L1626:
	ldr	r3, [r4, #2596]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1627
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L1627:
	ldr	r3, [r4, #2664]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1628
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L1628:
	ldr	r3, [r4, #2732]
	mov	r2, #1
	cmp	r3, #0
	beq	.L1629
	ldr	r1, [r3, #32]
	ldr	r0, [r6, #244]
	bl	FSP_ClearLogicFs
.L1629:
	subs	r7, r7, #1
	str	r5, [r4, #2732]
	str	r5, [r4, #2664]
	add	r4, r4, #4
	str	r5, [r4, #2592]
	str	r5, [r4, #2524]
	bne	.L1622
	mov	r0, r6
	bl	Hevc_InitDecBuffers
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1645:
	add	r8, r8, #12
	b	.L1625
.L1630:
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
	ldr	r0, [r0, #2332]
	cmp	r0, #0
	beq	.L1649
	ldr	r3, [r0, #48]
	cmp	r3, #4096
	ldmcsfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L1650
	mov	r0, #7
	bl	dprint_vfmw
	ldr	r3, [r4, #2332]
	ldr	ip, .L1650+4
	mov	r5, #0
	ldr	r2, [r3, #48]
	ldr	r0, [r3, #72]
	ldr	r1, [r3, #44]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #2332]
	mov	r0, #1
	ldr	r2, [r3, #96]
	ldr	r1, [r3, #68]
	str	r2, [r3, #68]
	ldr	r3, [r4, #2332]
	str	r5, [r3, #60]
	ldr	r3, [r4, #2332]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #72]
	rsb	r2, ip, r2
	str	r2, [r3, #44]
	ldr	r3, [r4, #2332]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #80]
	rsb	r2, ip, r2
	str	r2, [r3, #52]
	ldr	r3, [r4, #2332]
	ldr	r2, [r3, #48]
	ldr	ip, [r3, #76]
	add	r2, r2, ip
	str	r2, [r3, #48]
	ldr	r3, [r4, #2332]
	str	r0, [r3, #8]
	ldr	r0, [r4, #244]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #2332]
	str	r5, [r3, #72]
	ldr	r3, [r4, #2332]
	str	r5, [r3, #88]
	ldr	r3, [r4, #2332]
	str	r5, [r3, #76]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1649:
	ldr	r1, .L1650+8
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1651:
	.align	2
.L1650:
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
	beq	.L1657
	ldr	ip, [r0, #2508]
	cmp	ip, #0
	beq	.L1657
	ldr	r3, [r0, #2528]
	cmp	r3, r1
	beq	.L1659
	add	r0, r0, #2528
	mov	r3, #0
	b	.L1654
.L1655:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1659
.L1654:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1655
.L1657:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1659:
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
	bls	.L1666
	movw	r3, #61166
	mov	r2, r0
	movt	r3, 65535
	ldr	r1, .L1667
	mov	r0, #1
	bl	dprint_vfmw
	movw	r0, #61166
	movt	r0, 65535
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1666:
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
.L1668:
	.align	2
.L1667:
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
	ldr	r1, .L1693
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r4, #4]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	beq	.L1670
	ldr	r3, [r4, #16]
.L1671:
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L1688
.L1675:
	.word	.L1674
	.word	.L1676
	.word	.L1677
	.word	.L1678
	.word	.L1679
.L1670:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #1]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #8]
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #8
	str	r0, [r4, #12]
	bhi	.L1691
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r3, r0
	str	r0, [r4, #16]
	b	.L1671
.L1679:
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r4, #36]
	beq	.L1692
.L1687:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #52]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #56]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #60]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #64]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #68]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #72]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #52]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #76]
.L1673:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1674:
	mov	r1, #32
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #20]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #24]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1676:
	mov	r1, #32
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #28]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r3, #0
	str	r0, [r4, #32]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1677:
	ldr	r8, [r4, #12]
	mov	r3, #1
	movs	r8, r3, asl r8
	addne	r7, r4, #2128
	movne	r6, #0
	beq	.L1682
.L1681:
	ldr	r1, [r4, #8]
	add	r6, r6, #1
	ldr	r0, [r5, #2308]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	cmp	r8, r6
	str	r0, [r7, #4]!
	bne	.L1681
.L1682:
	ldr	r1, [r4, #8]
	add	r8, r4, r8, lsl #2
	mov	r3, #0
	mov	r2, #1
	mov	r2, r2, asl r1
	mov	r0, r3
	str	r2, [r8, #2132]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1678:
	mov	r1, #16
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #256
	str	r0, [r4, #80]
	bhi	.L1683
	cmp	r0, #0
	addne	r6, r4, #80
	movne	r7, #0
	beq	.L1688
.L1685:
	ldr	r1, [r4, #8]
	add	r7, r7, #1
	ldr	r0, [r5, #2308]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r6, #4]!
	ldr	r1, [r4, #12]
	ldr	r0, [r5, #2308]
	add	r1, r1, #7
	bic	r1, r1, #7
	bl	BsGet
	str	r0, [r6, #1024]
	ldr	r3, [r4, #80]
	cmp	r3, r7
	bhi	.L1685
.L1688:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1692:
	mov	r1, #32
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r4, #40]
	b	.L1687
.L1691:
	mov	r2, r0
	ldr	r1, .L1693+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L1673
.L1683:
	ldr	r1, .L1693+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L1673
.L1694:
	.align	2
.L1693:
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
	ldr	r1, .L1704
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r5, #12]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	bne	.L1696
	mov	r1, #7
	ldr	r0, [r4, #2308]
	bl	BsGet
	sub	r3, r0, #3
	str	r0, [r5, #16]
	cmp	r3, #2
	bhi	.L1703
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #6
	strb	r0, [r5, #1]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #20]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #2]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #3]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #5]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #6]
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r5, #7]
	bne	.L1699
	ldr	r3, [r5, #16]
	cmp	r3, #5
	beq	.L1699
	mov	r1, #4
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #24]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #28]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #4
	str	r0, [r5, #32]
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r5, #36]
.L1699:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #40]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r5, #8]
.L1696:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r5, #9]
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1703:
	mov	r2, r0
	ldr	r1, .L1704+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1705:
	.align	2
.L1704:
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
	bne	.L1711
	ldr	r1, .L1717
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	str	r0, [r5, #4]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r5, #8]
	bne	.L1715
.L1709:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	bne	.L1716
.L1710:
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1715:
	ldr	r1, [r6, #8]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #8]
	b	.L1709
.L1716:
	ldr	r1, [r6, #12]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #12]
	b	.L1710
.L1711:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1718:
	.align	2
.L1717:
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r7, #4]
	ldr	r0, [r6, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7]
	ldr	r0, [r6, #2308]
	bl	BsGet
	ldr	r1, .L1726
	strb	r0, [r7, #1]
	ldr	r0, [r6, #2308]
	bl	HEVC_ue_v
	cmp	r0, #15
	str	r0, [r7, #8]
	bgt	.L1720
	cmp	r0, #0
	addge	r5, r7, #8
	movge	r4, #0
	blt	.L1724
.L1723:
	ldr	r1, .L1726+4
	add	r4, r4, #1
	ldr	r0, [r6, #2308]
	bl	HEVC_ue_v
	str	r0, [r5, #4]!
	ldr	r3, [r7, #8]
	cmp	r3, r4
	bge	.L1723
.L1724:
	ldr	r0, [r6, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1720:
	ldr	r1, .L1726+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1727:
	.align	2
.L1726:
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
	ldr	r1, [r4, #3664]
	mov	r0, #0
	ldr	r3, [r4, #3656]
	mov	r8, r2
	str	r0, [r4, #3664]
	str	r1, [r4, #3676]
	add	r3, r3, #1
	ldr	r1, .L1761
	str	r3, [r4, #3656]
	ldr	r0, [r6, #2308]
	bl	HEVC_ue_v
	cmp	r0, #15
	str	r0, [r5, #4]
	bhi	.L1756
	mov	r1, #1
	strb	r1, [r4, #3729]
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1731
	ldrb	r0, [r5]	@ zero_extendqisi2
.L1732:
	cmp	r0, #0
	bne	.L1757
.L1733:
	mov	r1, #1
	ldr	r0, [r6, #2308]
	bl	BsGet
	strb	r0, [r5, #1]
	ldr	r1, [r8, #32]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r5, #16]
	ldr	r2, [r8, #48]
	cmp	r2, #31
	bhi	.L1758
.L1734:
	mov	r4, #0
	cmp	r4, #0
	mov	r9, r5
	mov	r7, #1
	beq	.L1759
.L1735:
	cmp	r4, #1
	beq	.L1760
.L1739:
	cmp	r7, #1
	bhi	.L1738
.L1737:
	add	r4, r4, #1
	add	r7, r7, #1
	cmp	r4, #0
	add	r9, r9, #16
	bne	.L1735
.L1759:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1739
	ldr	r3, [r8, #48]
	cmn	r3, #1
	movne	r10, r9
	movne	r3, r4
	beq	.L1737
.L1751:
	ldr	r1, [r8, #28]
	add	r3, r3, #1
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	str	r3, [fp, #-48]
	str	r3, [fp, #-52]
	bl	BsGet
	str	r0, [r10, #20]
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	bl	BsGet
	ldr	r3, [fp, #-48]
	str	r0, [r10, #24]
	ldrb	r2, [r8, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1741
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1742
.L1741:
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	str	r3, [fp, #-48]
	bl	BsGet
	str	r0, [r10, #28]
	ldr	r1, [r8, #28]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	bl	BsGet
	ldr	r3, [fp, #-48]
	str	r0, [r10, #32]
.L1742:
	ldr	r2, [r8, #48]
	add	r10, r10, #32
	add	r2, r2, #1
	cmp	r2, r3
	bhi	.L1751
	b	.L1739
.L1738:
	ldr	r0, [r6, #2308]
	bl	BsToNextByte
	mov	r0, #0
.L1755:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1758:
	ldr	r1, .L1761+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r8, #48]
	b	.L1734
.L1757:
	ldr	r1, [r8, #32]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #8]
	ldr	r1, [r8, #36]
	ldr	r0, [r6, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r5, #12]
	b	.L1733
.L1731:
	ldr	r0, [r6, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5]
	b	.L1732
.L1756:
	mov	r2, r0
	ldr	r1, .L1761+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1755
.L1760:
	ldrb	r3, [r8, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1738
	ldr	r3, [r8, #48]
	cmn	r3, #1
	beq	.L1738
	mov	r10, r9
	mov	r3, #0
	b	.L1751
.L1762:
	.align	2
.L1761:
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
	ldr	r1, [r3, #3660]
	ldr	r2, [r3, #3664]
	add	r1, r1, #1
	str	r1, [r3, #3660]
	add	r2, r2, #1
	str	r2, [r3, #3664]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1791
.L1764:
	ldrh	r3, [r5, #108]
	cmp	r3, #0
	beq	.L1766
	ldr	r1, [r5, #140]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	add	r0, r0, #1
	str	r0, [r6, #12]
	ldr	r1, [r5, #144]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #16]
	ldrb	r3, [r5, #110]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1767
.L1770:
	ldr	r2, [r4, #244]
	ldr	r3, .L1794
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L1792
.L1766:
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1791:
	mov	r1, #4
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #2
	str	r0, [r6, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #8]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r6]
	b	.L1764
.L1792:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L1766
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L1766
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_Sei_Get_Dpb_Output_Time
	b	.L1766
.L1767:
	ldr	r1, [r5, #120]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #20]
	ldrb	r3, [r5, #110]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1770
	ldrb	r3, [r5, #111]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1770
	ldr	r1, .L1794+4
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r6, #24]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #1]
	cmp	r0, #0
	bne	.L1793
.L1771:
	ldr	r3, [r6, #24]
	cmp	r3, #255
	bhi	.L1775
	add	r8, r6, #28
	mov	r7, #0
	b	.L1774
.L1773:
	ldr	r3, [r6, #24]
	cmp	r3, r7
	bcc	.L1770
.L1774:
	ldr	r1, .L1794+8
	add	r7, r7, #1
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	str	r0, [r8, #4]!
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1773
	ldr	r1, [r5, #116]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r8, #1024]
	b	.L1773
.L1793:
	ldr	r1, [r5, #116]
	ldr	r0, [r4, #2308]
	add	r1, r1, #1
	bl	BsGet
	str	r0, [r6, #28]
	b	.L1771
.L1775:
	ldr	r1, .L1794+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1795:
	.align	2
.L1794:
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
	beq	.L1806
	ldr	r1, .L1810
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r5, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	beq	.L1798
.L1802:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r5]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1798:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r5, #9]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #1
	beq	.L1809
.L1799:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #13]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #14]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #15]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #16]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #4
	strb	r0, [r5, #17]
	ldr	r0, [r4, #2308]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #18]
	addne	r7, r5, #18
	movne	r6, #0
	beq	.L1804
.L1803:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1803
.L1804:
	mov	r1, #4
	ldr	r0, [r4, #2308]
	bl	BsGet
	tst	r0, #255
	strb	r0, [r5, #49]
	addne	r7, r5, #49
	movne	r6, #0
	beq	.L1802
.L1805:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r7, #15]
	ldrb	r3, [r5, #49]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L1805
	b	.L1802
.L1806:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1809:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r5, #11]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r5, #12]
	b	.L1799
.L1811:
	.align	2
.L1810:
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
	beq	.L1819
	cmp	r2, #3
	bls	.L1822
	mov	r1, #8
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r7]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #8
	strh	r0, [r7, #2]	@ movhi
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #4]
	cmp	r0, #2
	beq	.L1823
	cmp	r0, #4
	beq	.L1824
	subs	r6, r6, #4
	beq	.L1818
.L1817:
	add	r4, r4, #1
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r6, r4
	bne	.L1817
.L1818:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1823:
	add	r1, r5, #6592
	mov	r0, r5
	add	r1, r1, #62
	bl	HEVC_Sei_TSI
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1824:
	add	r1, r5, #6656
	mov	r0, r5
	add	r1, r1, #4
	bl	HEVC_Sei_Color_Volume_Reconstruction_Info
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1819:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1822:
	ldr	r1, .L1825
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1826:
	.align	2
.L1825:
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
	bne	.L1869
.L1830:
	ldr	r1, .L1878
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #16]
	bhi	.L1870
	ldr	r1, .L1878+4
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #16
	str	r0, [r4, #20]
	bhi	.L1871
	ldr	r6, [r4, #16]
	add	r2, r0, r6
	str	r2, [r4, #24]
	cmp	r2, #16
	bhi	.L1855
	cmp	r6, #0
	addne	r10, r4, #68
	addne	r9, r4, #52
	movne	r7, #0
	movne	r8, r7
	bne	.L1859
	b	.L1857
.L1858:
	str	r8, [r10, #4]!
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r6, [r4, #16]
	cmp	r6, r7
	bls	.L1872
.L1859:
	ldr	r1, .L1878+8
	add	r7, r7, #1
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	cmp	r0, #32768
	mvn	r3, r0
	add	r8, r8, r3
	bcc	.L1858
	mov	r2, r0
	ldr	r1, .L1878+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1869:
	mov	r1, #1
	ldr	r0, [r0, #2308]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4]
	beq	.L1830
	ldr	r8, [r6, #228]
	cmp	r8, r7
	movne	r0, #0
	strne	r0, [r4, #4]
	beq	.L1873
.L1833:
	sub	r3, r7, #1
	rsb	r7, r0, r3
	cmp	r7, r3
	bhi	.L1874
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L1878+16
	str	r0, [r4, #8]
	ldr	r0, [r5, #2308]
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
	bhi	.L1875
	add	r2, r3, #13120
	mov	r10, #0
	add	r2, r2, #60
	add	r8, r4, #35
	add	r6, r6, r2
	str	r10, [fp, #-48]
	str	r10, [fp, #-52]
	mov	r7, r10
	b	.L1842
.L1837:
	sub	r2, r0, #1
	cmp	r2, #1
	bls	.L1876
.L1838:
	strb	r0, [r8, #1]!
	add	r10, r10, #1
	ldr	r2, [r9, #4]
	add	r6, r6, #4
	cmp	r2, r10
	bcc	.L1877
.L1842:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #0
	bne	.L1837
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r0, r0, asl #1
	sub	r2, r0, #1
	cmp	r2, #1
	bhi	.L1838
.L1876:
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
	b	.L1838
.L1877:
	add	r2, r2, #1
	ldr	r3, [fp, #-52]
	str	r2, [r4, #28]
	cmp	r7, #16
	ldr	r2, [fp, #-48]
	str	r7, [r4, #24]
	str	r3, [r4, #16]
	str	r2, [r4, #20]
	bhi	.L1843
	cmp	r3, #16
	bhi	.L1843
	cmp	r2, #16
	bhi	.L1843
	cmp	r7, #1
	subhi	r7, r7, #1
	addhi	r8, r4, #72
	addhi	r6, r4, #53
	movhi	r5, #0
	bls	.L1849
.L1848:
	ldr	ip, [r8, #4]!
	cmp	r5, #0
	ldrb	lr, [r6, #1]!	@ zero_extendqisi2
	mov	r2, r5
	movge	r1, r8
	movge	r3, r6
	blt	.L1851
.L1847:
	ldr	r0, [r1, #-4]!
	sub	r3, r3, #1
	cmp	ip, r0
	strlt	r0, [r1, #4]
	ldrltb	r0, [r3]	@ zero_extendqisi2
	strltb	r0, [r3, #1]
	strlt	ip, [r1]
	strltb	lr, [r3]
	subs	r2, r2, #1
	bpl	.L1847
.L1851:
	add	r5, r5, #1
	cmp	r5, r7
	bne	.L1848
.L1849:
	ldr	r3, [fp, #-52]
	movs	r6, r3, lsr #1
	beq	.L1846
	ldr	r3, [fp, #-52]
	add	r0, r4, #72
	mov	r1, #0
	add	r2, r3, #17
	add	r3, r3, #52
	add	r3, r4, r3
	add	r2, r4, r2, lsl #2
	add	r4, r4, #53
.L1852:
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
	bne	.L1852
.L1846:
	mov	r0, #0
.L1834:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1872:
	ldr	r2, [r4, #24]
.L1857:
	cmp	r2, r6
	bls	.L1846
	add	r8, r6, #17
	add	r9, r6, #52
	add	r9, r4, r9
	mov	r7, #0
	add	r8, r4, r8, lsl #2
.L1860:
	ldr	r1, .L1878+20
	add	r6, r6, #1
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	add	r0, r0, r1
	add	r7, r7, r0
	str	r7, [r8, #4]!
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r9, #1]!
	ldr	r3, [r4, #24]
	cmp	r3, r6
	bhi	.L1860
	b	.L1846
.L1873:
	ldr	r1, .L1878+24
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r4, #4]
	cmp	r8, r2
	bcs	.L1833
	mov	r3, r8
	ldr	r1, .L1878+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1843:
	ldr	r1, .L1878+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1870:
	mov	r2, r0
	ldr	r1, .L1878+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1874:
	mov	r2, r7
	ldr	r1, .L1878+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1875:
	ldr	r1, .L1878+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1871:
	ldr	r2, [r4, #16]
	mov	r0, #1
	ldr	r1, .L1878+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1855:
	mov	r3, #16
	ldr	r1, .L1878+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1834
.L1879:
	.align	2
.L1878:
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
	beq	.L1902
	cmp	r2, #0
	bne	.L1927
.L1885:
	mov	r4, r8
	mov	r6, #0
.L1899:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #0
	movne	r3, #1
	strneb	r3, [r4, #41]
	beq	.L1928
.L1887:
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	mov	r3, #0
	strb	r3, [r4, #42]
	cmp	r2, r3
	str	r3, [r4, #48]
	beq	.L1888
	ldr	r1, .L1935
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #44]
	beq	.L1890
.L1931:
	ldr	r2, [r4, #48]
	cmp	r2, #31
	bhi	.L1929
.L1892:
	mov	r2, r4
	mov	r10, #0
.L1901:
	cmp	r10, #0
	beq	.L1930
	cmp	r10, #1
	beq	.L1925
.L1898:
	add	r10, r10, #1
	add	r2, r2, #4
	cmp	r10, #2
	bne	.L1901
.L1897:
	add	r6, r6, #1
	add	r4, r4, #1280
	cmp	r7, r6
	add	r4, r4, #12
	bcs	.L1899
	mov	r0, #0
.L1924:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1888:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r3, r0
	strb	r3, [r4, #42]
	cmp	r3, #0
	bne	.L1931
.L1890:
	ldr	r1, .L1935+4
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	mov	r2, r0
	cmp	r2, #31
	str	r0, [r4, #48]
	bls	.L1892
.L1929:
	ldr	r1, .L1935+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #48]
	b	.L1892
.L1928:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #41]
	b	.L1887
.L1927:
	mov	r1, #1
	ldr	r0, [r0, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8]
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r8, #1]
	ldrh	r3, [r8]
	cmp	r3, #0
	beq	.L1885
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #2]
	cmp	r0, #0
	bne	.L1932
.L1883:
	mov	r1, #4
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #16]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldrb	r3, [r8, #2]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r8, #20]
	bne	.L1933
.L1884:
	mov	r1, #5
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #28]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #32]
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r8, #36]
	b	.L1885
.L1902:
	mvn	r0, #0
	b	.L1924
.L1933:
	mov	r1, #4
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r8, #24]
	b	.L1884
.L1932:
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #5
	str	r0, [r8, #4]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #8]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #5
	strb	r0, [r8, #3]
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r8, #36]
	b	.L1883
.L1930:
	ldrb	r1, [r8]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1934
	mov	r9, r2
	str	r10, [fp, #-48]
	b	.L1915
.L1900:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	str	r2, [fp, #-52]
	bl	BsGet
	ldr	r3, [fp, #-48]
	add	r9, r9, #8
	ldr	r2, [fp, #-52]
	str	r0, [r9, #1068]
	ldr	r1, [r4, #48]
	cmp	r1, r3
	bcc	.L1898
.L1915:
	ldr	r3, [fp, #-48]
	ldr	r1, .L1935+12
	ldr	r0, [r5, #2308]
	add	r3, r3, #1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	bl	HEVC_ue_v
	ldr	r1, .L1935+16
	str	r0, [r9, #52]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r2, [fp, #-52]
	str	r0, [r9, #308]
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1900
	ldr	r1, .L1935+20
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L1935+24
	str	r0, [r9, #564]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r2, [fp, #-52]
	str	r0, [r9, #820]
	b	.L1900
.L1934:
	add	r2, r2, #4
	mov	r10, #1
.L1925:
	ldrb	r1, [r8, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1897
	mov	r3, #0
	mov	r9, r2
	str	r3, [fp, #-48]
	b	.L1915
.L1936:
	.align	2
.L1935:
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	cmp	r0, #3
	str	r0, [r6, #12]
	beq	.L1938
	mov	r2, r0
	ldr	r1, .L1990
	mov	r0, #1
	bl	dprint_vfmw
.L1938:
	mov	r1, #6
	ldr	r0, [r7, #2308]
	bl	BsGet
	cmp	r0, #63
	str	r0, [r6, #16]
	bhi	.L1982
	mov	r1, #3
	ldr	r0, [r7, #2308]
	bl	BsGet
	cmp	r0, #7
	str	r0, [fp, #-152]
	bhi	.L1983
	ldr	r3, [fp, #-152]
	mov	r1, #1
	add	r5, r3, #1
	str	r5, [r6, #20]
	ldr	r0, [r7, #2308]
	bl	BsGet
	mov	r1, #16
	strb	r0, [r6, #1]
	ldr	r0, [r7, #2308]
	bl	BsGet
	movw	r3, #65535
	cmp	r0, r3
	str	r0, [r6, #24]
	bne	.L1984
	add	r1, r6, #12416
	ldr	r3, [fp, #-152]
	add	r1, r1, #20
	mov	r2, #1
	mov	r0, r7
	bl	HEVC_DecPTL
	subs	r4, r0, #0
	bne	.L1985
	mov	r1, #1
	ldr	r0, [r7, #2308]
	bl	BsGet
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	addge	r8, r6, #48
	strb	r0, [r6, #7]
	bge	.L1950
	b	.L1948
.L1947:
	add	r4, r4, #1
	cmp	r4, r5
	beq	.L1948
.L1950:
	ldr	r1, .L1990+4
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L1990+8
	add	r0, r0, #1
	str	r0, [r8, #4]!
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L1990+12
	str	r0, [r8, #32]
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	str	r0, [r8, #64]
	ldrb	r3, [r6, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1947
	ldr	r3, [fp, #-152]
	add	r2, r4, #1
	cmp	r3, r2
	blt	.L1948
	add	r3, r4, #13
	add	r3, r6, r3, lsl #2
.L1949:
	ldr	r1, [r6, #52]
	add	r2, r2, #1
	cmp	r2, r5
	str	r1, [r3, #4]!
	ldr	r1, [r6, #84]
	str	r1, [r3, #32]
	ldr	r1, [r6, #116]
	str	r1, [r3, #64]
	bne	.L1949
.L1948:
	mov	r1, #6
	ldr	r0, [r7, #2308]
	bl	BsGet
	ldr	r1, .L1990+16
	str	r0, [r6, #28]
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #32]
	bhi	.L1986
	cmp	r0, #1
	ble	.L1951
	ldr	r10, .L1990+20
	add	r9, r6, #148
	mov	r8, #1
.L1952:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	movgt	r5, r9
	movgt	r4, #0
	ble	.L1954
.L1953:
	ldr	r2, .L1990+24
	mov	r3, r8
	str	r4, [sp]
	mov	r1, #100
	ldr	ip, [r10, #68]
	sub	r0, fp, #144
	blx	ip
	mov	r1, #1
	ldr	r0, [r7, #2308]
	add	r4, r4, r1
	bl	BsGet
	str	r0, [r5, #4]!
	ldr	r2, [r6, #28]
	cmp	r2, r4
	bgt	.L1953
.L1954:
	ldr	r3, [r6, #32]
	add	r8, r8, #1
	add	r9, r9, #4
	cmp	r3, r8
	bgt	.L1952
.L1951:
	mov	r1, #1
	ldr	r0, [r7, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #6]
	cmp	r0, #0
	beq	.L1960
	mov	r1, #32
	ldr	r0, [r7, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r6, #36]
	ldr	r0, [r7, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #40]
	ldr	r0, [r7, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #5]
	cmp	r0, #0
	bne	.L1987
.L1958:
	ldr	r1, .L1990+28
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r6, #48]
	bcs	.L1988
	cmp	r0, #0
	ble	.L1960
	add	r9, r6, #8192
	mov	r3, #1
	ldr	r1, .L1990+32
	add	r8, r6, #12800
	str	r3, [r9, #148]
	add	r5, r6, #4224
	ldr	r0, [r7, #2308]
	add	r8, r8, #20
	bl	HEVC_ue_v
	add	r3, r6, #4096
	add	r5, r5, #24
	mov	r4, #0
	str	r0, [r3, #148]
	ldr	r0, [r9, #148]
	ldr	r9, [fp, #-152]
.L1961:
	uxtb	r2, r0
	mov	r1, r8
	mov	r3, r9
	mov	r0, r7
	bl	HEVC_DecHrdParam
	add	r4, r4, #1
	ldr	r1, .L1990+32
	cmp	r0, #0
	bne	.L1989
	ldr	r3, [r6, #48]
	cmp	r3, r4
	ble	.L1960
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	cmp	r4, #0
	mov	r1, #1
	str	r0, [r5], #4
	ldrle	r0, [r5, #4092]
	ble	.L1961
	ldr	r0, [r7, #2308]
	bl	BsGet
	str	r0, [r5, #4092]
	b	.L1961
.L1960:
	mov	r1, #1
	ldr	r0, [r7, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r6, #3]
	cmp	r0, #0
	bne	.L1977
.L1957:
	mov	r0, #0
.L1940:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1966:
	ldr	r0, [r7, #2308]
	bl	BsGet
	strb	r0, [r6, #4]
.L1977:
	mov	r0, r7
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L1966
	b	.L1957
.L1989:
	ldr	r1, .L1990+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1987:
	ldr	r1, .L1990+40
	ldr	r0, [r7, #2308]
	bl	HEVC_ue_v
	str	r0, [r6, #44]
	b	.L1958
.L1984:
	ldr	r1, .L1990+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1982:
	ldr	r1, .L1990+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1985:
	ldr	r1, .L1990+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1983:
	mov	r2, r0
	ldr	r1, .L1990+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1986:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L1990+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1988:
	mov	r2, r0
	mov	r3, #1024
	ldr	r1, .L1990+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1940
.L1991:
	.align	2
.L1990:
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	cmp	r0, #15
	mov	r6, r0
	bhi	.L1998
	movw	r7, #23196
	ldr	r3, [r4, #2312]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L1999
	str	r0, [r2, #8]
	mov	r0, r4
	ldr	r1, [r4, #2312]
	add	r1, r1, r5
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L2000
	ldr	r3, [r4, #2312]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2312]
	strb	r2, [r3, r5]
.L1994:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1999:
	ldr	r9, .L2002
	mov	r0, r4
	ldr	r1, .L2002+4
	str	r6, [r9, #-3456]
	bl	HEVC_ProcessVPS
	subs	r8, r0, #0
	bne	.L2001
	ldr	ip, .L2002+8
	mov	r3, #1
	ldr	r0, [r4, #2312]
	mov	r2, r7
	ldr	r1, .L2002+4
	add	r0, r0, r5
	ldr	ip, [ip, #56]
	strb	r3, [r9, #-3462]
	strb	r3, [r9, #-3464]
	blx	ip
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2001:
	mov	r2, r6
	ldr	r1, .L2002+12
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L1994
.L1998:
	ldr	r1, .L2002+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1994
.L2000:
	mov	r2, r6
	ldr	r1, .L2002+20
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2312]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #2312]
	strb	r9, [r3, r5]
	b	.L1994
.L2003:
	.align	2
.L2002:
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
	ldr	r3, .L2057
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
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4]
	cmp	r0, #0
	bne	.L2048
.L2006:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #1]
	cmp	r0, #0
	bne	.L2049
.L2008:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #3]
	cmp	r0, #0
	bne	.L2050
.L2010:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L2051
.L2012:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #8]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L2013
	ldr	r1, .L2057+4
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	str	r0, [r4, #60]
	ldr	r3, [r6, #64]
	cmp	r3, #3
	bhi	.L2052
	sub	r2, fp, #28
	ldr	r1, .L2057+8
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #60]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	ldr	r1, .L2057+12
	str	r0, [r4, #64]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-32]
	mul	r0, r3, r0
	str	r0, [r4, #64]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	ldr	r1, .L2057+16
	str	r0, [r4, #68]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #68]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	sub	r2, fp, #28
	str	r0, [r4, #72]
	ldr	r3, [r6, #64]
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-16]
	mul	r0, r3, r0
	str	r0, [r4, #72]
.L2013:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #11]
	cmp	r0, #0
	beq	.L2016
	mov	r1, #32
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #32
	str	r0, [r4, #76]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #80]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, [r4, #76]
	cmp	r1, #0
	uxtb	r0, r0
	strb	r0, [r4, #12]
	beq	.L2017
	ldr	r3, [r4, #80]
	mov	r0, #1000
	add	r7, r5, #86016
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r7, #1696]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
.L2017:
	cmp	r0, #0
	bne	.L2053
.L2018:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	bne	.L2054
.L2016:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	moveq	r3, r0
	bne	.L2055
.L2015:
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2055:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #15]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #16]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L2057+20
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #88]
	bcs	.L2056
.L2019:
	ldr	r1, .L2057+24
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2057+28
	str	r0, [r4, #92]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2057+32
	str	r0, [r4, #96]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2057+36
	str	r0, [r4, #100]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	mov	r3, #0
	str	r0, [r4, #104]
	mov	r0, r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2051:
	ldr	r1, .L2057+40
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2057+44
	str	r0, [r4, #52]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	str	r0, [r4, #56]
	b	.L2012
.L2048:
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #255
	str	r0, [r4, #24]
	bne	.L2006
	mov	r1, #16
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #16
	str	r0, [r4, #28]
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r4, #32]
	b	.L2006
.L2050:
	mov	r1, #3
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #36]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L2010
	mov	r1, #8
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #40]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #8
	str	r0, [r4, #44]
	ldr	r0, [r5, #2308]
	bl	BsGet
	str	r0, [r4, #48]
	b	.L2010
.L2049:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #2]
	b	.L2008
.L2054:
	ldr	r3, [r6, #56]
	mov	r2, #1
	add	r1, r4, #108
	mov	r0, r5
	bl	HEVC_DecHrdParam
	cmp	r0, #0
	beq	.L2016
	ldr	r1, .L2057+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L2015
.L2053:
	ldr	r1, .L2057+52
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	str	r0, [r4, #84]
	b	.L2018
.L2056:
	ldr	r1, .L2057+56
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2019
.L2052:
	ldr	r1, .L2057+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L2015
.L2058:
	.align	2
.L2057:
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
	bls	.L2064
	mvn	r0, #-2147483648
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2064:
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
	ldr	r1, .L2077
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2077+4
	str	r0, [r9]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #1024
	str	r0, [r9, #4]
	bhi	.L2066
	cmp	r0, #0
	beq	.L2072
	add	r7, r9, #4096
	add	r8, r9, #12288
	add	r7, r7, #8
	add	r8, r8, #8
	add	r6, r9, #4
	mov	r4, #0
	b	.L2071
.L2070:
	ldr	r3, [r9, #4]
	add	r8, r8, #4
	cmp	r3, r4
	bls	.L2072
.L2071:
	mov	r1, #6
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #3
	str	r0, [r6, #4]!
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L2077+8
	str	r0, [r7], #4
	ldr	r3, [r6]
	sub	r3, r3, #19
	cmp	r3, #1
	bls	.L2069
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	str	r0, [r7, #4092]
.L2069:
	cmp	r4, #0
	add	r4, r4, #1
	beq	.L2070
	ldr	r1, .L2077+12
	add	r8, r8, #4
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	str	r0, [r8, #-4]
	ldr	r3, [r9, #4]
	cmp	r3, r4
	bhi	.L2071
.L2072:
	ldr	r0, [r5, #2308]
	bl	BsToNextByte
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2066:
	ldr	r1, .L2077+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2078:
	.align	2
.L2077:
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
	beq	.L2081
	ldr	r1, .L2082
	ldr	r0, [r0, #2308]
	bl	HEVC_se_v
	mov	r1, #1
	str	r0, [r6, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r6]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r6, #1]
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2081:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2083:
	.align	2
.L2082:
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
	beq	.L2099
	ldr	r1, .L2112
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	mov	r1, #1
	str	r0, [r8, #4]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #8]
	cmp	r0, #0
	beq	.L2086
.L2097:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2086:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #9]
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r8, #10]
	cmp	r1, #1
	beq	.L2110
.L2087:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	add	r9, r8, #18
	add	r10, r8, #19
	mov	r7, r8
	strb	r0, [r8, #15]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r7, #16]!
.L2089:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #0
	beq	.L2091
	mov	r6, r9
	mov	r5, #0
.L2088:
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2308]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2088
.L2091:
	cmp	r7, r10
	add	r9, r9, #66
	bne	.L2089
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r8, #416]
	cmp	r0, #1
	beq	.L2111
.L2092:
	add	r10, r8, #456
	add	r7, r8, #452
	add	r10, r10, #2
	add	r7, r7, #3
	mov	r9, r10
.L2096:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #1]!
	cmp	r0, #0
	beq	.L2098
	mov	r6, r9
	mov	r5, #0
.L2095:
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #16
	add	r5, r5, #1
	strh	r0, [r6, #2]!	@ movhi
	ldr	r0, [r4, #2308]
	bl	BsGet
	strh	r0, [r6, #198]	@ movhi
	ldrb	r3, [r7]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L2095
.L2098:
	cmp	r7, r10
	add	r9, r9, #66
	bne	.L2096
	b	.L2097
.L2099:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2111:
	mov	r1, #4
	ldr	r0, [r4, #2308]
	bl	BsGet
	add	r5, r8, #416
	add	r7, r8, #452
	strb	r0, [r8, #417]
.L2093:
	add	r6, r5, #12
.L2094:
	ldr	r1, .L2112+4
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	str	r0, [r5, #4]!
	cmp	r5, r6
	bne	.L2094
	cmp	r7, r5
	bne	.L2093
	b	.L2092
.L2110:
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #11]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #12]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	strb	r0, [r8, #13]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r8, #14]
	b	.L2087
.L2113:
	.align	2
.L2112:
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
	ldr	r1, [r0, #2332]
	mov	r4, r0
	ldr	r7, [fp, #4]
	ldr	r1, [r1, #16]
	cmp	r1, #39
	beq	.L2160
	cmp	r3, #5
	beq	.L2144
	cmp	r3, #132
	beq	.L2145
	cmp	r7, #0
	movne	r5, #0
	beq	.L2139
.L2147:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	cmp	r5, r7
	bne	.L2147
	b	.L2139
.L2144:
	add	r1, r6, #4096
	mov	r2, r7
	add	r1, r1, #52
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	bne	.L2141
.L2139:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_Sei_More_Data_In_Payload
	cmp	r0, #0
	bne	.L2161
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2161:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_Sei_Payload_Extension_Present
	cmp	r0, #0
	bne	.L2162
.L2148:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r6, #12]
	b	.L2149
.L2150:
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r6, #16]
.L2149:
	ldr	r0, [r4, #2308]
	bl	BsIsByteAligned
	mov	r1, #1
	cmp	r0, #0
	beq	.L2150
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2160:
	cmp	r3, #147
	ldrls	pc, [pc, r3, asl #2]
	b	.L2116
.L2118:
	.word	.L2117
	.word	.L2119
	.word	.L2116
	.word	.L2116
	.word	.L2120
	.word	.L2121
	.word	.L2122
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2123
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2124
	.word	.L2116
	.word	.L2125
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2126
	.word	.L2127
	.word	.L2128
	.word	.L2129
	.word	.L2116
	.word	.L2130
	.word	.L2131
	.word	.L2116
	.word	.L2116
	.word	.L2132
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2116
	.word	.L2133
	.word	.L2116
	.word	.L2134
	.word	.L2116
	.word	.L2116
	.word	.L2135
.L2145:
	add	r1, r6, #24576
	add	r1, r1, #152
	bl	HEVC_Sei_Decoded_Picture_Hash
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2162:
	ldr	r1, .L2163
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	str	r0, [r6, #8]
	b	.L2148
.L2135:
	add	r1, r6, #4352
	add	r1, r1, #34
	bl	HEVC_Sei_HLGHDR_Comapitibility_Info
	cmp	r0, #0
	beq	.L2139
.L2141:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2117:
	add	r2, r2, #2720
	add	r1, r6, #24
	add	r2, r2, #12
	bl	HEVC_Sei_Buf_Period
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2119:
	add	r2, r2, #2624
	add	r1, r6, #1088
	bl	HEVC_Sei_Pic_Timming
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2120:
	mov	r2, r7
	add	r1, r6, #3200
	bl	HEVC_Sei_User_Data_Registered_Itu_T_T35
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2121:
	add	r1, r6, #4096
	mov	r2, r7
	add	r1, r1, #52
	bl	HEVC_Sei_User_Data_Unregistered
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2122:
	add	r1, r6, #4224
	add	r1, r1, #40
	bl	HEVC_Sei_Recovery_Point
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2123:
	add	r1, r6, #4352
	add	r1, r1, #36
	bl	HEVC_Sei_Tone_Mapping_Info
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2124:
	add	r1, r6, #4224
	add	r1, r1, #48
	bl	HEVC_Sei_Frame_Packing_Arrangement
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2125:
	add	r1, r6, #4288
	add	r1, r1, #28
	bl	HEVC_Sei_Display_Orientation
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2126:
	add	r1, r6, #7488
	mov	r2, r7
	add	r1, r1, #60
	bl	HEVC_Sei_Structure_Of_Pictures_Info
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2127:
	add	r1, r6, #4160
	add	r1, r1, #12
	bl	HEVC_Sei_Active_Param_sets
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2128:
	add	r2, r2, #2720
	add	r1, r6, #4224
	add	r2, r2, #12
	add	r1, r1, #24
	bl	HEVC_Sei_Dec_Unit_Info
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2129:
	add	r1, r6, #4288
	add	r1, r1, #36
	bl	HEVC_Sei_Temporal_Sub_Layer_Zero_Index
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2130:
	mov	r3, r7
	mov	r1, r6
	bl	HEVC_Sei_Scalable_Nesting
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2131:
	add	r1, r6, #4288
	add	r1, r1, #44
	bl	HEVC_Sei_Region_Refresh_Info
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2132:
	add	r1, r6, #4288
	add	r1, r1, #48
	bl	HEVC_Sei_Mastering_Display_Colour_Volume
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2133:
	add	r1, r6, #3280
	add	r1, r1, #12
	bl	HEVC_Sei_Color_Remapping_Info
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2134:
	add	r1, r6, #4352
	add	r1, r1, #28
	bl	HEVC_Sei_Content_Light_Level_Information
	cmp	r0, #0
	beq	.L2139
	b	.L2141
.L2116:
	cmp	r7, #0
	movne	r5, #0
	beq	.L2139
.L2142:
	add	r5, r5, #1
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	cmp	r5, r7
	bne	.L2142
	b	.L2139
.L2164:
	.align	2
.L2163:
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
	ldr	r0, [r0, #2308]
	b	.L2166
.L2168:
	bl	BsSkip
	ldr	r0, [r4, #2308]
	add	r5, r5, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2
	bhi	.L2174
.L2166:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2308]
	beq	.L2168
	bl	BsGet
	mov	r8, #0
	mov	r9, r0
	str	r0, [r6]
	ldr	r0, [r4, #2308]
	b	.L2169
.L2170:
	bl	BsSkip
	ldr	r0, [r4, #2308]
	add	r8, r8, #255
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #16]
	add	r1, r3, #8
	cmp	r1, r2
	bhi	.L2175
.L2169:
	mov	r1, #8
	bl	BsShow
	mov	r1, #8
	cmp	r0, #255
	ldr	r0, [r4, #2308]
	beq	.L2170
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
	bne	.L2176
.L2167:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2174:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, #3056
	ldr	r1, .L2177
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2175:
	str	r2, [sp]
	mov	r0, #1
	movw	r2, #3078
	ldr	r1, .L2177
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2176:
	ldr	r1, .L2177+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2167
.L2178:
	.align	2
.L2177:
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
	add	r6, r0, #3440
	add	r5, r0, #28160
	mov	r4, r0
	add	r6, r6, #8
	add	r5, r5, #164
	b	.L2183
.L2180:
	ldr	r0, [r4, #2308]
	bl	BsIsByteAligned
	cmp	r0, #0
	mov	r0, r4
	beq	.L2188
	bl	HEVC_More_Rbsp_Data
	subs	r7, r0, #0
	beq	.L2189
.L2183:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	beq	.L2180
	ldr	r1, .L2190
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
.L2181:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2188:
	ldr	r1, .L2190+4
	mvn	r7, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2189:
	ldr	r0, [r4, #2308]
	mov	r1, #8
	bl	BsGet
	cmp	r0, #128
	beq	.L2181
	mov	r2, r0
	ldr	r1, .L2190+8
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2181
.L2191:
	.align	2
.L2190:
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
	ldr	r0, [r0, #2308]
	mov	r1, #1
	mov	r9, r2
	bl	BsGet
	add	r8, r7, #20480
	mov	r1, #1
	strb	r0, [r8, #3460]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	uxtb	r0, r0
	strb	r0, [r8, #3461]
	cmp	r0, #0
	ldr	r0, [r4, #2308]
	beq	.L2193
	bl	BsGet
	ldr	r1, .L2209
	strb	r0, [r8, #3462]
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #63
	str	r0, [r8, #3468]
	bhi	.L2206
	ldrb	r6, [r8, #3462]	@ zero_extendqisi2
	cmp	r0, r6
	addcs	r5, r6, #5952
	addcs	r5, r5, #35
	addcs	r5, r7, r5, lsl #2
	bcc	.L2199
.L2198:
	mov	r1, #3
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r1, .L2209+4
	add	r6, r6, #1
	str	r0, [r5, #4]!
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	str	r0, [r5, #256]
	ldr	r3, [r8, #3468]
	cmp	r3, r6
	bcs	.L2198
.L2199:
	ldr	r0, [r4, #2308]
	bl	BsToNextByte
	mov	r3, #0
	strb	r3, [r8, #3464]
	b	.L2197
.L2202:
	bl	HEVC_MoreRbspData
	cmp	r0, #0
	beq	.L2207
.L2197:
	mov	r2, r9
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SeiMessage
	cmp	r0, #0
	mov	r0, r4
	beq	.L2202
	ldr	r1, .L2209+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2193:
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r8, #3463]
	cmp	r5, #0
	bne	.L2199
	mov	r1, #3
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r1, .L2209+12
	str	r0, [r8, #3984]
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #63
	str	r0, [r8, #3988]
	addls	r6, r7, #24320
	addls	r6, r6, #148
	bhi	.L2208
.L2201:
	mov	r1, #6
	ldr	r0, [r4, #2308]
	bl	BsGet
	add	r5, r5, #1
	str	r0, [r6, #4]!
	ldr	r3, [r8, #3988]
	cmp	r3, r5
	bcs	.L2201
	b	.L2199
.L2207:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2206:
	mov	r2, #64
	ldr	r1, .L2209+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2208:
	ldr	r1, .L2209+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2210:
	.align	2
.L2209:
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
	ldr	r3, .L2248
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
	add	r3, r6, #2192
	str	r3, [fp, #-48]
	add	r3, r9, #24
	str	r3, [fp, #-68]
	add	r3, r9, #49
	str	r3, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-52]
.L2212:
	ldr	r2, [fp, #-48]
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	str	r2, [fp, #-48]
	beq	.L2231
	ldr	r3, [fp, #-76]
	ldr	r7, [fp, #-72]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-60]
.L2230:
	mov	r1, #1
	ldr	r0, [r6, #2308]
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
	beq	.L2213
	cmp	r0, #0
	add	r4, r6, #324
	beq	.L2244
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	bls	.L2237
	ldr	r1, .L2248+4
	ldr	r0, [r6, #2308]
	bl	HEVC_se_v
	add	r3, r0, #7
	str	r0, [r9, #1660]
	cmp	r3, #254
	bhi	.L2245
	ldr	r3, [fp, #-64]
	add	r8, r0, #8
	str	r8, [r3]
.L2224:
	cmp	r5, #0
	ble	.L2223
	sub	r4, r4, #4
	mov	r10, #0
	b	.L2228
.L2227:
	mov	r8, r8, lsr #24
	ldr	r2, [r4, #4]!
	add	r3, r3, r8
	cmp	r10, r5
	uxtb	r3, r3
	rsb	r8, r8, r3
	strb	r8, [r7, r2]
	beq	.L2223
.L2228:
	ldr	r1, .L2248+8
	add	r10, r10, #1
	ldr	r0, [r6, #2308]
	bl	HEVC_se_v
	add	r3, r8, r0
	add	r2, r0, #128
	add	r3, r3, #256
	cmp	r2, #255
	str	r0, [r9, #1664]
	mov	r8, r3, asr #31
	bls	.L2227
	ldr	r1, .L2248+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2242:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2232:
	ldr	r1, .L2248+16
	ldr	r0, [r6, #2308]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L2234
	ldr	r2, [fp, #-60]
	uxtb	r0, r0
	ldr	r3, [fp, #-56]
	rsb	r1, r0, r2
	strb	r0, [r3, #1560]
	uxtb	r1, r1
	strb	r1, [r3, #1584]
.L2218:
	ldr	r3, [fp, #-60]
	cmp	r1, r3
	beq	.L2246
	ldr	r2, [fp, #-52]
	mov	r3, r2, asl #3
	sub	r3, r3, r2, asl #1
	add	r1, r3, r1
	add	r1, r9, r1, lsl #6
	add	r1, r1, #49
.L2221:
	cmp	r1, #0
	beq	.L2247
	ldr	r3, .L2248
	mov	r2, r5
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
.L2223:
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
	bhi	.L2230
.L2231:
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
	bne	.L2212
	mov	r0, #0
	b	.L2242
.L2237:
	mov	r8, #8
	b	.L2224
.L2244:
	ldr	r1, .L2248+16
	ldr	r0, [r6, #2308]
	bl	HEVC_ue_v
	ldr	r3, [fp, #-60]
	cmp	r0, r3
	bhi	.L2234
	ldr	r3, [fp, #-52]
	uxtb	r0, r0
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-56]
	cmp	r3, #1
	rsb	r1, r0, ip
	strb	r0, [r2, #1560]
	uxtb	r1, r1
	strb	r1, [r2, #1584]
	bls	.L2218
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
	b	.L2218
.L2246:
	mov	r1, r3
	ldr	r0, [fp, #-52]
	bl	HEVC_GetScalingListDefaultAddress
	mov	r1, r0
	b	.L2221
.L2245:
	ldr	r1, .L2248+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2242
.L2247:
	ldr	r1, .L2248+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2242
.L2234:
	ldr	r1, .L2248+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2242
.L2213:
	cmp	r0, #0
	beq	.L2232
	ldr	r4, .L2248+32
	mov	r8, #8
	b	.L2224
.L2249:
	.align	2
.L2248:
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
	ldr	r1, .L2404
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	cmp	r0, #1
	mov	r8, r0
	str	r0, [r4, #64]
	beq	.L2251
	cmp	r0, #3
	bhi	.L2381
	mov	r2, r0
	ldr	r1, .L2404+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2253:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2381:
	ldr	r1, .L2404+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2251:
	ldr	r1, .L2404+12
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #8192
	str	r0, [r4, #72]
	bhi	.L2382
	ldr	r1, .L2404+16
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #4096
	str	r0, [r4, #76]
	bhi	.L2383
	ldr	r2, [r4, #760]
	ldr	r3, [r4, #72]
	cmp	r2, #120
	mul	r0, r3, r0
	beq	.L2257
	bgt	.L2258
	cmp	r2, #60
	beq	.L2259
	ble	.L2384
	cmp	r2, #90
	beq	.L2262
	cmp	r2, #93
	beq	.L2263
	cmp	r2, #63
	bne	.L2256
	mov	r2, #61440
	mov	r3, #245760
	b	.L2264
.L2258:
	cmp	r2, #156
	beq	.L2265
	bgt	.L2266
	cmp	r2, #150
	beq	.L2265
	cmp	r2, #153
	beq	.L2265
	cmp	r2, #123
	beq	.L2257
.L2256:
	ldr	r1, .L2404+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2266:
	cmp	r2, #183
	beq	.L2267
	cmp	r2, #186
	beq	.L2267
	cmp	r2, #180
	bne	.L2256
.L2267:
	mov	r2, #8912896
	mov	r3, #35651584
.L2264:
	cmp	r0, r2
	movls	r3, #16
	strls	r3, [r4, #236]
	bls	.L2269
	cmp	r0, r3, lsr #1
	movls	r3, #12
	strls	r3, [r4, #236]
	bls	.L2269
	add	r3, r3, r3, lsl #1
	cmp	r0, r3, lsr #2
	movls	r3, #8
	movhi	r3, #6
	str	r3, [r4, #236]
.L2269:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #80]
	beq	.L2272
	ldr	r1, .L2404+24
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r3, [r4, #64]
	ldr	r6, .L2404+28
	ldr	r1, .L2404+32
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #492]
	mul	r0, r3, r0
	str	r0, [r4, #84]
	ldr	r0, [r5, #2308]
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
	blt	.L2385
	ldr	r1, .L2404+36
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r3, [r4, #64]
	ldr	r1, .L2404+40
	add	r3, r6, r3, lsl #2
	ldr	r3, [r3, #508]
	mul	r0, r3, r0
	str	r0, [r4, #92]
	ldr	r0, [r5, #2308]
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
	blt	.L2386
.L2272:
	ldr	r1, .L2404+44
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r2, r0, #8
	str	r2, [r4, #100]
	bhi	.L2387
	ldr	r1, .L2404+48
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #6
	add	r2, r0, #8
	str	r2, [r4, #108]
	bhi	.L2388
	ldr	r3, [r4, #100]
	ldr	r1, .L2404+52
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
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #12
	bhi	.L2389
	add	r0, r0, #4
	mov	r1, #1
	str	r0, [r4, #128]
	mov	r6, r4
	str	r0, [r4, #132]
	mov	r7, #0
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #3]
	b	.L2283
.L2277:
	ldr	r3, [r4, #56]
	add	r7, r7, #1
	cmp	r7, r3
	bhi	.L2282
.L2283:
	ldr	r1, .L2404+56
	add	r6, r6, #4
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2404+60
	add	r0, r0, #1
	str	r0, [r6, #376]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r1, .L2404+64
	ldr	r9, [r6, #376]
	str	r0, [r6, #408]
	ldr	r0, [r5, #2308]
	ldr	r10, [r4, #380]
	bl	HEVC_ue_v
	str	r0, [r6, #440]
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2277
	ldr	r1, [r4, #56]
	add	r3, r7, #1
	cmp	r3, r1
	addls	r7, r7, #95
	addls	r7, r4, r7, lsl #2
	bhi	.L2282
.L2281:
	ldr	r2, [r4, #380]
	add	r3, r3, #1
	cmp	r3, r1
	str	r2, [r7, #4]!
	ldr	r2, [r4, #412]
	str	r2, [r7, #32]
	ldr	r2, [r4, #444]
	str	r2, [r7, #64]
	bls	.L2281
.L2282:
	ldr	r3, [r4, #236]
	cmp	r9, r10
	ldr	r1, .L2404+68
	movcc	r9, r10
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r4, #236]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #136]
	bhi	.L2390
	ldr	r1, .L2404+72
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #144]
	bhi	.L2391
	ldr	r3, [r4, #136]
	add	r3, r3, #3
	str	r3, [r4, #140]
	add	r6, r0, r3
	str	r6, [r4, #148]
	sub	r2, r6, #4
	cmp	r2, #2
	bhi	.L2392
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
	beq	.L2286
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2287:
	ldr	r7, [r4, #76]
	mov	r1, r6
	str	r0, [r4, #240]
	mov	r0, r7
	bl	__aeabi_uidivmod
	mov	r0, r7
	cmp	r1, #0
	mov	r1, r6
	beq	.L2288
	bl	__aeabi_uidiv
	add	r0, r0, #1
.L2289:
	str	r0, [r4, #244]
	ldr	r1, .L2404+76
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #168]
	bhi	.L2393
	ldr	r1, .L2404+80
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #176]
	bhi	.L2394
	ldr	r3, [r4, #168]
	ldr	r2, [r4, #140]
	add	r3, r3, #2
	str	r3, [r4, #172]
	cmp	r3, r2
	bcs	.L2395
	add	r0, r0, r3
	str	r0, [r4, #180]
	cmp	r0, #5
	bhi	.L2293
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L2293
	ldr	r1, .L2404+84
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #200]
	bhi	.L2396
	ldr	r1, .L2404+88
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	ldr	r3, [r4, #148]
	ldr	r2, [r4, #172]
	rsb	r3, r2, r3
	cmp	r0, r3
	str	r0, [r4, #208]
	bhi	.L2397
	ldr	r3, [r4, #200]
	add	r0, r0, #1
	mov	r1, #0
	str	r0, [r4, #212]
	add	r3, r3, #1
	str	r3, [r4, #204]
	str	r1, [r5, #228]
	mov	ip, #1
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #160]
	ldr	r2, [r4, #144]
	mov	r3, ip, asl r3
	cmp	r3, r0, lsr r2
	bcc	.L2298
	b	.L2398
.L2323:
	mov	r8, r0
.L2298:
	str	r8, [r5, #228]
	add	r0, r8, #1
	ldr	r3, [r4, #172]
	ldr	r1, [r4, #160]
	add	r3, r8, r3
	ldr	r2, [r4, #144]
	mov	r3, ip, asl r3
	cmp	r3, r1, lsr r2
	bcc	.L2323
.L2297:
	mov	r6, #1
	add	r8, r2, r8
	str	r6, [r4, #224]
	mov	r3, #0
	str	r8, [r4, #216]
	mov	r1, r6
	str	r3, [r4, #220]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	cmp	r0, #0
	beq	.L2299
	mov	r1, r6
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #6]
	cmp	r0, #0
	bne	.L2399
.L2299:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #8]
	cmp	r6, #0
	bne	.L2300
	ldr	r2, [r4, #76]
	cmp	r2, #64
	bls	.L2400
.L2300:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	cmp	r0, #0
	str	r0, [r4, #116]
	beq	.L2301
	mov	r1, #4
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #4
	add	r0, r0, #1
	str	r0, [r4, #120]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L2404+92
	add	r0, r0, #1
	str	r0, [r4, #124]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r4, #184]
	bhi	.L2401
.L2302:
	ldr	r1, .L2404+96
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r4, #192]
	bhi	.L2402
.L2303:
	ldr	r2, [r4, #184]
	add	r2, r2, #3
	str	r2, [r4, #188]
	add	r0, r0, r2
	str	r0, [r4, #196]
	cmp	r0, #5
	bhi	.L2304
	ldr	r3, [r4, #148]
	cmp	r0, r3
	bhi	.L2304
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #9]
.L2301:
	ldr	r1, .L2404+100
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #64
	str	r0, [r4, #228]
	bhi	.L2306
	cmp	r0, #0
	addne	r7, r4, #13056
	movne	r6, #0
	addne	r7, r7, #52
	bne	.L2311
	b	.L2312
.L2310:
	ldr	r3, [r4, #228]
	cmp	r6, r3
	bcs	.L2312
.L2311:
	mov	r3, r6
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	HEVC_DecShortTermRefPicSet
	add	r6, r6, #1
	add	r7, r7, #204
	cmp	r0, #0
	beq	.L2310
	ldr	r1, .L2404+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2263:
	mov	r2, #245760
	mov	r3, #983040
	b	.L2264
.L2288:
	bl	__aeabi_uidiv
	b	.L2289
.L2286:
	bl	__aeabi_uidiv
	b	.L2287
.L2312:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #10]
	cmp	r0, #0
	beq	.L2309
	ldr	r1, .L2404+108
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #32
	str	r0, [r4, #232]
	bhi	.L2315
	cmp	r0, #0
	addne	r8, r4, #244
	addne	r7, r4, #15
	movne	r6, #0
	beq	.L2309
.L2317:
	ldr	r1, [r4, #128]
	add	r6, r6, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #4]!
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r7, #1]!
	ldr	r3, [r4, #232]
	cmp	r6, r3
	bcc	.L2317
.L2309:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #13]
	cmp	r0, #0
	beq	.L2314
	mov	r2, r4
	add	r1, r4, #2624
	mov	r0, r5
	bl	HEVC_DecVuiParam
	cmp	r0, #0
	bne	.L2403
.L2314:
	ldr	ip, [r4, #76]
	ldr	r3, [r4, #72]
	ldr	r2, [r4, #2656]
	ldr	r1, [r4, #2652]
	ldr	r0, [r4, #2648]
	str	ip, [sp]
	bl	HEVCGetDar
	mov	r1, #1
	str	r0, [r4, #2644]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #14]
	cmp	r0, #0
	bne	.L2377
.L2320:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r4]
	b	.L2253
.L2319:
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #15]
.L2377:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2319
	b	.L2320
.L2384:
	cmp	r2, #0
	beq	.L2261
	cmp	r2, #30
	bne	.L2256
.L2261:
	mov	r2, #9216
	mov	r3, #36864
	b	.L2264
.L2400:
	ldr	r1, .L2404+112
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2404+116
	ldr	ip, [r3]
	cmp	ip, #0
	mvneq	r0, #0
	beq	.L2253
	ldr	r0, [r5, #244]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #102
	blx	ip
	mvn	r0, #0
	b	.L2253
.L2259:
	mov	r2, #30720
	mov	r3, #122880
	b	.L2264
.L2257:
	mov	r2, #557056
	mov	r3, #2228224
	b	.L2264
.L2265:
	mov	r2, #2228224
	mov	r3, #8912896
	b	.L2264
.L2262:
	mov	r2, #138240
	mov	r3, #552960
	b	.L2264
.L2399:
	add	r1, r4, #860
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	beq	.L2299
	mov	r0, r6
	ldr	r1, .L2404+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2293:
	ldr	r1, .L2404+124
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2402:
	mov	r2, r0
	ldr	r1, .L2404+128
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r0, [r4, #192]
	b	.L2303
.L2401:
	mov	r2, r0
	ldr	r1, .L2404+132
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2302
.L2398:
	mov	r8, r1
	b	.L2297
.L2382:
	mov	r0, r8
	ldr	r1, .L2404+136
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2389:
	ldr	r1, .L2404+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2390:
	ldr	r1, .L2404+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2393:
	ldr	r1, .L2404+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2304:
	ldr	r1, .L2404+152
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2396:
	ldr	r1, .L2404+156
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2383:
	mov	r0, r8
	ldr	r1, .L2404+160
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2392:
	ldr	r1, .L2404+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2391:
	ldr	r1, .L2404+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2387:
	ldr	r1, .L2404+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2388:
	ldr	r1, .L2404+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2395:
	ldr	r1, .L2404+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2394:
	ldr	r1, .L2404+184
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2397:
	ldr	r1, .L2404+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2306:
	mov	r2, #64
	ldr	r1, .L2404+192
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2385:
	ldr	r1, .L2404+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2386:
	ldr	r1, .L2404+200
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2315:
	ldr	r1, .L2404+204
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2403:
	ldr	r1, .L2404+208
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2253
.L2405:
	.align	2
.L2404:
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
	ldr	r5, .L2424
	mov	r4, r0
	movw	r2, #26164
	mov	r1, #0
	ldr	r0, .L2424+4
	ldr	r3, [r5, #48]
	blx	r3
	mov	r2, #384
	ldr	r3, [r5, #48]
	mov	r1, #0
	sub	r0, fp, #428
	ldr	r8, .L2424+8
	blx	r3
	ldr	r0, [r4, #2308]
	mov	r1, #4
	bl	BsGet
	ldr	r2, [r4, #148]
	cmp	r2, r0
	str	r0, [fp, #-440]
	bls	.L2417
	mov	r1, #3
	ldr	r0, [r4, #2308]
	bl	BsGet
	cmp	r0, #8
	mov	r7, r0
	bhi	.L2418
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r3, r7
	mov	r2, #1
	sub	r1, fp, #428
	mov	r9, r0
	mov	r0, r4
	bl	HEVC_DecPTL
	cmp	r0, #0
	bne	.L2419
	ldr	r1, .L2424+12
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	ldr	r2, [r4, #152]
	cmp	r0, r2
	mov	r10, r0
	bcs	.L2420
	movw	ip, #26164
	ldr	r2, [r4, #2316]
	mul	r6, ip, r0
	uxtb	r0, r9
	str	ip, [fp, #-444]
	ldr	r3, [fp, #-440]
	add	r2, r2, r6
	ldrb	r9, [r2, #1]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2421
	str	r3, [r2, #52]
	sub	r1, fp, #428
	ldr	lr, [r4, #2316]
	mov	r2, #384
	add	lr, lr, r6
	str	r7, [lr, #56]
	ldr	lr, [r4, #2316]
	add	lr, lr, r6
	strb	r0, [lr, #2]
	ldr	r0, [r4, #2316]
	ldr	r7, [r5, #52]
	add	r0, r0, r6
	add	r0, r0, #476
	blx	r7
	ldr	r2, [r4, #2316]
	mov	r0, r4
	add	r2, r2, r6
	str	r10, [r2, #60]
	ldr	r1, [r4, #2316]
	add	r1, r1, r6
	bl	HEVC_ProcessSPS
	ldr	ip, [fp, #-444]
	subs	r7, r0, #0
	bne	.L2422
	ldr	r3, [r4, #2316]
	mov	r1, #1
	add	r0, r4, #28160
	mov	r2, ip
	add	r0, r0, #164
	strb	r1, [r3, r6]
	ldr	r3, [r4, #2316]
	add	r3, r3, r6
	strb	r1, [r3, #1]
	ldr	r1, [r4, #2316]
	ldr	r3, [r5, #52]
	add	r1, r1, r6
	blx	r3
.L2408:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2421:
	str	r3, [r8, #-3412]
	sub	r1, fp, #428
	str	r7, [r8, #-3408]
	mov	r2, #384
	strb	r0, [r8, #-3462]
	ldr	r7, [r5, #52]
	ldr	r0, .L2424+16
	blx	r7
	ldr	r1, .L2424+4
	mov	r0, r4
	str	r10, [r8, #-3404]
	bl	HEVC_ProcessSPS
	ldr	ip, [fp, #-444]
	subs	r7, r0, #0
	bne	.L2423
	ldr	r0, [r4, #2316]
	mov	r3, #1
	mov	r2, ip
	strb	r3, [r8, #-3464]
	strb	r3, [r8, #-3463]
	add	r0, r0, r6
	ldr	r9, [r5, #56]
	ldr	r1, .L2424+4
	str	ip, [fp, #-440]
	blx	r9
	ldr	ip, [fp, #-440]
	add	r0, r4, #28160
	ldr	r1, [r4, #2316]
	add	r0, r0, #164
	ldr	r3, [r5, #52]
	mov	r2, ip
	add	r1, r1, r6
	blx	r3
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2420:
	ldr	r1, .L2424+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #152]
	cmp	r10, r2
	bcc	.L2416
	ldr	r1, .L2424+24
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L2416
	str	r2, [fp, #-432]
	mov	r3, #8
	str	r10, [fp, #-436]
	sub	r2, fp, #436
	ldr	r0, [r4, #244]
	mov	r1, #109
	blx	ip
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2416:
	mvn	r7, #0
	b	.L2408
.L2417:
	ldr	r1, .L2424+28
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2408
.L2418:
	mov	r2, #8
	ldr	r1, .L2424+32
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L2408
.L2419:
	ldr	r1, .L2424+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2408
.L2422:
	mov	r2, r10
	ldr	r1, .L2424+40
	mov	r0, #1
	mvn	r7, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2316]
	mov	r2, #1
	strb	r2, [r3, r6]
	ldr	r3, [r4, #2316]
	add	r6, r3, r6
	strb	r9, [r6, #1]
	b	.L2408
.L2423:
	ldr	r1, [r4, #2316]
	add	r0, r4, #28160
	mov	r2, ip
	ldr	r4, [r5, #52]
	add	r1, r1, r6
	add	r0, r0, #164
	blx	r4
	mov	r2, r10
	ldr	r1, .L2424+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2408
.L2425:
	.align	2
.L2424:
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
	ldr	r1, .L2554
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L2427
	ldr	r3, [r5, #152]
	cmp	r0, r3
	bge	.L2427
	ldr	r3, [r5, #2316]
	movw	r6, #26164
	mla	r6, r6, r0, r3
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2534
	mov	r1, r7
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #2]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #4]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, r7
	str	r0, [r4, #36]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #3]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L2554+4
	strb	r0, [r4, #5]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #40]
	cmp	r0, #15
	bhi	.L2535
	ldr	r1, .L2554+8
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r0, r0, #1
	str	r0, [r4, #44]
	cmp	r0, #15
	bhi	.L2536
	ldr	r1, .L2554+12
	ldr	r0, [r5, #2308]
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
	bne	.L2537
	mov	r1, r7
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #6]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, r7
	strb	r0, [r4, #7]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #8]
	cmp	r0, #0
	streq	r0, [r4, #52]
	bne	.L2538
.L2436:
	str	r0, [r4, #56]
	ldr	r1, .L2554+16
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #60]
	cmp	r3, #24
	bhi	.L2539
	ldr	r1, .L2554+20
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r4, #64]
	cmp	r3, #24
	bhi	.L2540
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #9]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #10]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #11]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #12]
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #13]
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #14]
	bne	.L2541
	ldr	r3, [r6, #240]
	strh	r3, [r4, #176]	@ movhi
	ldr	r3, [r6, #244]
	strh	r3, [r4, #216]	@ movhi
.L2475:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	ble	.L2480
.L2474:
	ldr	ip, [r6, #160]
	add	r1, r4, #174
	mov	r3, #0
.L2479:
	ldrsh	r2, [r1, #2]!
	add	r3, r3, #1
	mul	r2, ip, r2
	cmp	r2, #64
	bhi	.L2478
	ldr	lr, [r6, #72]
	cmp	lr, #64
	bhi	.L2542
.L2478:
	cmp	r3, r0
	blt	.L2479
.L2480:
	ldr	r1, [r4, #72]
	cmp	r1, #0
	ble	.L2477
	ldr	r0, [r6, #160]
	ldrsh	r2, [r4, #216]
	mul	r2, r0, r2
	cmp	r2, #63
	addhi	r1, r1, #107
	addhi	r3, r4, #216
	addhi	r1, r4, r1, lsl #1
	bhi	.L2483
	b	.L2481
.L2484:
	ldrsh	r2, [r3, #2]!
	mul	r2, r0, r2
	cmp	r2, #63
	bls	.L2481
.L2483:
	cmp	r3, r1
	bne	.L2484
.L2477:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #17]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #0
	bne	.L2543
.L2486:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #21]
	cmp	r0, #0
	beq	.L2489
	add	r1, r4, #260
	mov	r0, r5
	bl	HEVC_DecScalingListData
	cmp	r0, #0
	bne	.L2544
.L2489:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	ldr	r1, .L2554+24
	strb	r0, [r4, #22]
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r2, r0, #2
	str	r2, [r4, #84]
	cmp	r2, #1
	ble	.L2490
	ldr	r3, [r6, #148]
	cmp	r2, r3
	bhi	.L2490
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #24]
	cmp	r0, #0
	bne	.L2521
	b	.L2494
.L2493:
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #25]
.L2521:
	mov	r0, r5
	bl	HEVC_MoreRbspData
	mov	r1, #1
	cmp	r0, #0
	bne	.L2493
.L2494:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2538:
	ldr	r1, .L2554+28
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #3
	str	r0, [r4, #52]
	bls	.L2436
	mov	r0, r7
	ldr	r1, .L2554+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2541:
	ldr	r1, .L2554+36
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #19
	add	r2, r0, #1
	str	r2, [r4, #68]
	bhi	.L2545
	ldr	r1, .L2554+40
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #21
	add	r3, r0, #1
	str	r3, [r4, #72]
	bhi	.L2546
	ldr	r2, [r4, #68]
	cmp	r2, #10
	bgt	.L2547
	cmp	r3, #11
	ble	.L2444
	ldr	r1, .L2554+44
	mov	r2, #11
.L2531:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2554+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2526
.L2528:
	mov	r3, #0
	ldr	r0, [r5, #244]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	mvn	r0, #0
.L2522:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2481:
	ldr	r1, .L2554+52
.L2530:
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2554+48
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L2528
.L2526:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2542:
	ldr	r1, .L2554+56
	b	.L2530
.L2537:
	mov	r0, r7
	ldr	r1, .L2554+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2444:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #15]
	cmp	r0, #0
	bne	.L2458
	ldr	r3, [r4, #68]
	cmp	r3, #1
	addgt	r8, r4, #90
	movgt	r7, r0
	bgt	.L2456
	b	.L2548
.L2550:
	cmp	r3, r2
	bhi	.L2454
	ldr	r3, [r4, #68]
	add	r7, r7, #1
	sub	r3, r3, #1
	cmp	r3, r7
	ble	.L2549
.L2456:
	ldr	r1, .L2554+64
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r8, #2]!	@ movhi
	ldr	r2, [r6, #240]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2550
.L2454:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r7
	ldr	r1, .L2554+68
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2547:
	mov	r3, r2
	ldr	r1, .L2554+72
	mov	r2, #10
	b	.L2531
.L2543:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	ldr	r0, [r5, #2308]
	bl	BsGet
	uxtb	r7, r0
	strb	r7, [r4, #20]
	cmp	r7, #0
	bne	.L2486
	ldr	r1, .L2554+76
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #76]
	bhi	.L2551
.L2488:
	ldr	r1, .L2554+80
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r4, #80]
	bls	.L2486
	ldr	r1, .L2554+84
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #80]
	b	.L2486
.L2458:
	ldr	r7, [r4, #68]
	cmp	r7, #0
	addgt	r3, r4, #174
	movgt	r8, #0
	ble	.L2448
.L2466:
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
	bne	.L2466
.L2448:
	ldr	r10, [r4, #72]
	cmp	r10, #0
	addgt	r2, r4, #214
	movgt	r8, #0
	ble	.L2465
.L2467:
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
	bne	.L2467
.L2465:
	cmp	r7, #1
	bne	.L2473
	ldr	r0, [r4, #72]
	cmp	r0, #1
	beq	.L2474
.L2473:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	strb	r0, [r4, #16]
	b	.L2475
.L2427:
	mov	r2, r0
	ldr	r1, .L2554+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2534:
	mov	r2, r0
	ldr	r1, .L2554+92
	mov	r0, r7
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2535:
	mov	r0, r7
	ldr	r1, .L2554+96
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2536:
	mov	r0, r7
	ldr	r1, .L2554+100
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2539:
	ldr	r1, .L2554+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2540:
	ldr	r1, .L2554+108
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2490:
	ldr	r1, .L2554+112
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2526
.L2549:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	ble	.L2452
.L2451:
	add	r8, r4, #130
	mov	r7, #0
	b	.L2463
.L2552:
	cmp	r3, r2
	bhi	.L2461
	ldr	r3, [r4, #72]
	add	r7, r7, #1
	sub	r3, r3, #1
	cmp	r3, r7
	ble	.L2452
.L2463:
	ldr	r1, .L2554+116
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	add	r0, r0, #1
	uxth	r3, r0
	strh	r3, [r8, #2]!	@ movhi
	ldr	r2, [r6, #244]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L2552
.L2461:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r7
	ldr	r1, .L2554+120
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2545:
	mov	r3, #20
	ldr	r1, .L2554+124
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2551:
	ldr	r1, .L2554+128
	mov	r0, #1
	bl	dprint_vfmw
	str	r7, [r4, #76]
	b	.L2488
.L2452:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2458
.L2459:
	ldr	r7, [r4, #68]
	ldrh	r3, [r6, #240]
	sub	r2, r7, #1
	add	ip, r4, r7, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #174]	@ movhi
	ble	.L2468
	add	r8, r7, #44
	add	r1, r4, #90
	add	lr, r4, #174
	add	r8, r4, r8, lsl #1
.L2469:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #174]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #174]	@ movhi
	bne	.L2469
.L2468:
	sxth	r3, r3
	cmp	r3, #0
	ble	.L2553
	ldr	r1, [r4, #72]
	ldrh	r3, [r6, #244]
	sub	r2, r1, #1
	add	ip, r4, r1, lsl #1
	cmp	r2, #0
	strh	r3, [ip, #214]	@ movhi
	ble	.L2471
	add	r8, r1, #64
	add	lr, r4, #214
	add	r1, r4, #130
	add	r8, r4, r8, lsl #1
.L2472:
	ldrh	r0, [r1, #2]!
	cmp	r1, r8
	strh	r0, [lr, #2]!	@ movhi
	ldrh	r3, [ip, #214]
	rsb	r3, r0, r3
	uxth	r3, r3
	strh	r3, [ip, #214]	@ movhi
	bne	.L2472
.L2471:
	sxth	r3, r3
	cmp	r3, #0
	bgt	.L2465
	ldr	r1, .L2554+132
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2546:
	mov	r2, r3
	ldr	r1, .L2554+136
	mov	r3, #22
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2544:
	ldr	r1, .L2554+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2548:
	ldr	r3, [r4, #72]
	cmp	r3, #1
	bgt	.L2451
	b	.L2459
.L2553:
	ldr	r1, .L2554+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2522
.L2555:
	.align	2
.L2554:
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
	ldr	r1, .L2566
	mov	r4, r0
	ldr	r0, [r0, #2308]
	bl	HEVC_ue_v
	ldr	r3, [r4, #156]
	cmp	r0, r3
	mov	r6, r0
	bcs	.L2562
	movw	r7, #2024
	ldr	r3, [r4, #2320]
	mul	r5, r7, r0
	add	r2, r3, r5
	ldrb	r9, [r3, r5]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L2563
	str	r0, [r2, #28]
	mov	r0, r4
	ldr	r1, [r4, #2320]
	add	r1, r1, r5
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2564
	ldr	r3, [r4, #2320]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2320]
	strb	r2, [r3, r5]
.L2558:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2563:
	ldr	r9, .L2566+4
	mov	r0, r4
	ldr	r1, .L2566+8
	str	r6, [r9, #-3436]
	bl	HEVC_ProcessPPS
	subs	r8, r0, #0
	bne	.L2565
	ldr	ip, .L2566+12
	mov	r3, #1
	ldr	r0, [r4, #2320]
	mov	r2, r7
	ldr	r1, .L2566+8
	add	r0, r0, r5
	ldr	ip, [ip, #56]
	strb	r3, [r9, #-3463]
	strb	r3, [r9, #-3464]
	blx	ip
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2565:
	mov	r2, r6
	ldr	r1, .L2566+16
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2558
.L2562:
	mov	r2, r0
	ldr	r1, .L2566+20
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2558
.L2564:
	mov	r2, r6
	ldr	r1, .L2566+16
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2320]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #1]
	ldr	r3, [r4, #2320]
	strb	r9, [r3, r5]
	b	.L2558
.L2567:
	.align	2
.L2566:
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
	ldr	r3, [r0, #2320]
	mov	r5, r0
	ldr	r2, [r4, #2044]
	movw	r0, #2024
	ldr	r1, [r4, #2028]
	ldr	r6, [r5, #2316]
	mla	r3, r0, r2, r3
	cmp	r1, #1
	ldr	r7, [r3, #32]
	beq	.L2633
	cmp	r1, #0
	bne	.L2572
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2572
.L2570:
	ldr	r1, .L2644
	ldr	r0, [r5, #2308]
	bl	HEVC_ue_v
	cmp	r0, #7
	str	r0, [r4, #3560]
	bhi	.L2634
	movw	r3, #26164
	mla	r9, r3, r7, r6
	ldr	r3, [r9, #64]
	cmp	r3, #0
	ldreq	r3, [r4, #3564]
	bne	.L2635
.L2576:
	add	r0, r0, r3
	add	r3, r5, #57344
	cmp	r0, #7
	str	r3, [fp, #-52]
	str	r0, [r3, #496]
	bhi	.L2577
	ldr	r3, [r4, #2136]
	cmp	r3, #0
	addne	r6, r5, #56576
	addne	r6, r6, #236
	movne	r7, #0
	movne	r8, r6
	beq	.L2579
.L2580:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r2, [r4, #2136]
	cmp	r2, r7
	bhi	.L2580
	ldr	r3, [r9, #64]
	cmp	r3, #0
	beq	.L2581
	cmp	r2, #0
	addne	r8, r5, #56832
	movne	r7, #0
	addne	r8, r8, #44
	beq	.L2579
.L2585:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r2, [r4, #2136]
	cmp	r2, r7
	bhi	.L2585
.L2581:
	cmp	r2, #0
	beq	.L2579
	add	r7, r5, #56832
	mov	r8, #0
	add	r7, r7, #240
	mov	r3, r4
	str	r5, [fp, #-48]
	mov	r4, r8
	mov	r10, #1
	mov	r5, r7
	mov	r8, r3
	b	.L2596
.L2586:
	ldr	r1, [r8, #3560]
	str	r0, [r6, #192]
	mov	r1, r10, asl r1
	str	r1, [r6, #1028]
.L2588:
	ldr	r1, [r9, #64]
	cmp	r1, #0
	beq	.L2590
	ldr	r1, [r6, #64]
	cmp	r1, #0
	bne	.L2591
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #496]
	str	r1, [r5, #964]
	mov	r0, r10, asl r0
	str	r1, [r5, #968]
	str	r0, [r5, #836]
	str	r0, [r5, #840]
.L2590:
	ldr	r1, [r8, #2136]
	add	r4, r4, #1
	add	r5, r5, #8
	cmp	r1, r4
	bls	.L2636
.L2596:
	ldr	r0, [r6, #4]!
	cmp	r0, #0
	beq	.L2586
	ldr	r3, [fp, #-48]
	ldr	r1, .L2644+4
	ldr	r0, [r3, #2308]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r6, #128]
	cmp	r1, #255
	bhi	.L2637
	ldr	r3, [fp, #-48]
	ldr	lr, [r8, #3560]
	ldr	r1, .L2644+8
	add	r0, r0, r10, asl lr
	str	r0, [r6, #1028]
	ldr	r0, [r3, #2308]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r6, #192]
	cmp	r1, #255
	bls	.L2588
	mov	r2, r0
	ldr	r1, .L2644+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2633:
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2570
.L2572:
	mov	r0, #0
.L2571:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2591:
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
.L2594:
	ldr	r1, .L2644+16
	add	r7, r7, #1
	ldr	r0, [r9, #2308]
	bl	HEVC_se_v
	ldr	r1, .L2644+20
	add	r3, r0, #128
	str	r0, [r4]
	cmp	r3, #255
	bhi	.L2638
	ldr	r0, [r9, #2308]
	bl	HEVC_se_v
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L2639
	ldr	r3, [fp, #-52]
	cmp	r7, #2
	ldr	r2, [r4], #4
	ldr	r1, [r3, #496]
	add	r3, r2, r10, asl r1
	str	r3, [r5, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r6, #4]!
	bne	.L2594
	sub	r4, fp, #64
	ldr	r5, [fp, #-68]
	ldr	r8, [fp, #-72]
	ldmia	r4, {r4, r6, r9}
	b	.L2590
.L2636:
	ldr	r5, [fp, #-48]
	mov	r4, r8
.L2579:
	ldr	r6, [r4, #2028]
	cmp	r6, #0
	bne	.L2572
	ldr	r3, [r4, #2140]
	cmp	r3, #0
	beq	.L2572
	add	r7, r5, #57088
	add	r7, r7, #236
	mov	r8, r7
.L2597:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2140]
	cmp	r3, r6
	bhi	.L2597
	ldr	r2, [r9, #64]
	cmp	r2, #0
	bne	.L2640
.L2598:
	cmp	r3, #0
	beq	.L2572
	add	r8, r5, #57344
	mov	r10, #0
	add	r8, r8, #240
	mov	r3, r9
	str	r5, [fp, #-48]
	mov	r5, r4
	mov	r9, r8
	mov	r8, r10
	mov	r10, r3
	b	.L2612
.L2602:
	ldr	r1, [r5, #3560]
	mov	r3, #1
	str	r0, [r7, #192]
	mov	r1, r3, asl r1
	str	r1, [r7, #836]
.L2604:
	ldr	r1, [r10, #64]
	cmp	r1, #0
	beq	.L2606
	ldr	r1, [r7, #64]
	cmp	r1, #0
	bne	.L2607
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #496]
	mov	r3, #1
	str	r1, [r9, #772]
	mov	r0, r3, asl r0
	str	r1, [r9, #776]
	str	r0, [r9, #644]
	str	r0, [r9, #648]
.L2606:
	ldr	r1, [r5, #2140]
	add	r8, r8, #1
	add	r9, r9, #8
	cmp	r1, r8
	bls	.L2572
.L2612:
	ldr	r0, [r7, #4]!
	cmp	r0, #0
	beq	.L2602
	ldr	r3, [fp, #-48]
	ldr	r1, .L2644+24
	ldr	r0, [r3, #2308]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r7, #128]
	cmp	r1, #255
	bhi	.L2641
	ldr	lr, [r5, #3560]
	mov	r3, #1
	ldr	r1, .L2644+28
	add	r0, r0, r3, asl lr
	ldr	r3, [fp, #-48]
	str	r0, [r7, #836]
	ldr	r0, [r3, #2308]
	bl	HEVC_se_v
	add	r1, r0, #128
	str	r0, [r7, #192]
	cmp	r1, #255
	bls	.L2604
	ldr	r1, .L2644+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2607:
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
.L2610:
	ldr	r1, .L2644+36
	add	r6, r6, #1
	ldr	r0, [r9, #2308]
	bl	HEVC_se_v
	ldr	r1, .L2644+40
	add	r3, r0, #128
	str	r0, [r4]
	cmp	r3, #255
	bhi	.L2642
	ldr	r0, [r9, #2308]
	bl	HEVC_se_v
	add	r3, r0, #512
	str	r0, [r8], #4
	cmp	r3, #1024
	bcs	.L2643
	ldr	r3, [fp, #-52]
	cmp	r6, #2
	ldr	r2, [r4], #4
	ldr	r1, [r3, #496]
	mov	r3, #1
	add	r3, r2, r3, asl r1
	str	r3, [r7, #4]!
	mov	r3, r3, asl #7
	mov	r3, r3, asr r1
	rsb	r3, r3, #128
	add	r3, r0, r3
	ssat	r3, #8, r3
	str	r3, [r5, #4]!
	bne	.L2610
	sub	r5, fp, #68
	ldmia	r5, {r5, r7, r8, r9}
	b	.L2606
.L2635:
	ldr	r1, .L2644+44
	ldr	r0, [r5, #2308]
	bl	HEVC_se_v
	add	r3, r0, #7
	str	r0, [r4, #3564]
	cmp	r3, #14
	bhi	.L2575
	mov	r3, r0
	ldr	r0, [r4, #3560]
	b	.L2576
.L2638:
	ldr	r1, .L2644+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2639:
	ldr	r1, .L2644+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2640:
	cmp	r3, #0
	addne	r8, r5, #57344
	movne	r6, #0
	addne	r8, r8, #44
	beq	.L2572
.L2601:
	mov	r1, #1
	ldr	r0, [r5, #2308]
	bl	BsGet
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r4, #2140]
	cmp	r3, r6
	bhi	.L2601
	b	.L2598
.L2637:
	mov	r2, r0
	ldr	r1, .L2644+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2642:
	ldr	r1, .L2644+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2643:
	ldr	r1, .L2644+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2641:
	ldr	r1, .L2644+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2577:
	ldr	r1, .L2644+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2634:
	ldr	r1, .L2644+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2575:
	ldr	r1, .L2644+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2571
.L2645:
	.align	2
.L2644:
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
	ldr	r0, [r0, #2308]
	bl	BsGet
	add	r10, r4, #53248
	ldr	r7, [r10, #2040]
	sub	r3, r7, #16
	cmp	r3, #5
	movhi	r3, #0
	movls	r3, #1
	cmp	r3, #0
	str	r3, [fp, #-72]
	strb	r0, [r10, #1969]
	bne	.L2911
.L2647:
	ldr	r1, .L2954
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #0
	str	r0, [r10, #2044]
	ldr	r3, [r4, #156]
	blt	.L2649
	cmp	r0, r3
	bge	.L2649
	mov	r0, r4
	bl	HEVC_VpsSpsPpsCheck
	subs	r3, r0, #0
	str	r3, [fp, #-88]
	bne	.L2912
	ldr	r1, [r10, #2044]
	movw	r5, #2024
	ldr	r2, [r4, #2320]
	movw	r6, #26164
	ldr	r3, [r4, #2316]
	mla	r5, r5, r1, r2
	ldrb	r1, [r5, #2]	@ zero_extendqisi2
	ldr	r2, [r5, #32]
	cmp	r1, #0
	mla	r6, r6, r2, r3
	bne	.L2913
.L2655:
	mov	r3, #0
	strb	r3, [r10, #1971]
.L2656:
	ldr	r9, [r6, #160]
	ldr	r3, [r6, #164]
	cmp	r9, #0
	beq	.L2658
	cmp	r3, #0
	beq	.L2658
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
	ble	.L2660
.L2661:
	add	r1, r1, #1
	cmp	r8, r3, asl r1
	bgt	.L2661
.L2660:
	ldrb	r3, [r10, #1969]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r2, #0
	beq	.L2914
.L2662:
	mul	r9, r9, r8
	ldrb	r8, [r10, #1971]	@ zero_extendqisi2
	str	r2, [r10, #2120]
	cmp	r8, #0
	str	r9, [r10, #2124]
	ldr	r3, [r4, #188]
	str	r3, [r10, #2016]
	beq	.L2915
.L2665:
	ldr	r3, [r5, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #0
	streq	r3, [r10, #2108]
	bne	.L2916
.L2772:
	ldrb	r3, [r5, #23]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2777
.L2783:
	ldr	r3, [r10, #2120]
	cmp	r3, #0
	bne	.L2917
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2785
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	movne	r3, #1
	strneb	r3, [r4, #3]
	bne	.L2787
.L2788:
	mov	r3, #0
	strb	r3, [r4, #2]
.L2789:
	mov	r0, r4
	bl	HEVC_IsNewPic
	str	r0, [r10, #3556]
	mov	r0, r4
	bl	HEVC_ReadByteAlignment
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L2891:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2917:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2788
.L2787:
	ldr	r3, [r10, #2016]
	ldr	r2, [fp, #-72]
	cmp	r3, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	beq	.L2788
	ldr	r3, [r10, #2040]
	cmp	r3, #21
	moveq	r3, #1
	streqb	r3, [r4, #2]
	bne	.L2788
	b	.L2789
.L2913:
	ldrb	r3, [r10, #1969]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2655
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1971]
	b	.L2656
.L2915:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	beq	.L2670
.L2669:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r1, .L2954+4
	add	r8, r8, #1
	mov	r2, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r3, [r5, #36]
	cmp	r3, r8
	bhi	.L2669
.L2670:
	ldr	r1, .L2954+8
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #2
	str	r0, [r10, #2028]
	bhi	.L2918
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	streqb	r3, [r10, #1968]
	bne	.L2919
.L2672:
	sub	r7, r7, #19
	cmp	r7, #1
	bhi	.L2920
	mov	r3, #0
	str	r3, [r10, #2016]
	str	r3, [r4, #188]
	ldr	r3, [r10, #2036]
	cmp	r3, #0
	streq	r3, [r10, #2020]
	streq	r3, [r4, #184]
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2902
.L2791:
	mov	r3, #0
	strb	r3, [r10, #1975]
	str	r3, [fp, #-92]
.L2793:
	ldr	r3, [r10, #2028]
	cmp	r3, #2
	beq	.L2716
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #1976]
	cmp	r0, #0
	bne	.L2921
	ldr	r3, [r10, #2028]
	ldr	r2, [r5, #40]
	cmp	r3, #0
	str	r2, [r10, #2136]
	bne	.L2722
	ldr	r3, [r5, #44]
	str	r3, [r10, #2140]
.L2723:
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L2922
	ldr	r3, [fp, #-92]
	ldr	r2, [r3, #24]
	cmp	r2, #16
	bhi	.L2726
	cmp	r2, #0
	moveq	r3, r2
	beq	.L2728
	ldr	r3, [fp, #-92]
	add	r2, r2, #52
	add	r1, r3, #52
	add	r2, r3, r2
	mov	r3, #0
.L2730:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	addne	r3, r3, #1
	cmp	r1, r2
	bne	.L2730
	cmp	r3, #1
	movle	r2, #0
	movgt	r2, #1
.L2728:
	ldrb	r1, [r5, #22]	@ zero_extendqisi2
	cmp	r1, #0
	moveq	r2, #0
	andne	r2, r2, #1
	cmp	r2, #0
	beq	.L2923
	add	r2, r4, #58624
	add	r1, r4, #55040
	add	r2, r2, #64
	add	r1, r1, #176
	mov	r0, r4
	bl	HEVC_DecRefPicListsModification
	cmp	r0, #0
	bne	.L2924
.L2724:
	ldr	r3, [r10, #2028]
	cmp	r3, #0
	beq	.L2795
.L2731:
	cmp	r3, #2
	beq	.L2716
.L2796:
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2925
.L2732:
	ldrb	r3, [r10, #1975]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #2028]
	beq	.L2742
	cmp	r3, #0
	beq	.L2926
	cmp	r3, #2
	mov	r3, #1
	strb	r3, [r10, #1979]
	beq	.L2737
.L2740:
	ldr	r3, [r10, #2136]
	cmp	r3, #1
	bls	.L2899
.L2738:
	ldr	r1, .L2954+12
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	ldrb	r2, [r10, #1979]	@ zero_extendqisi2
	cmp	r2, #0
	str	r0, [r10, #2080]
	bne	.L2743
	ldr	r3, [r10, #2076]
	sub	r3, r3, #1
.L2745:
	cmp	r3, r0
	movcs	r1, #0
	movcc	r1, #1
	orrs	r1, r1, r0, lsr #31
	beq	.L2899
	str	r3, [sp]
	mov	r3, r0
	ldr	r1, .L2954+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2911:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1970]
	b	.L2647
.L2914:
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r10, #2048]
	cmp	r0, #0
	ldr	r2, [r6, #244]
	ldr	r3, [r6, #240]
	mul	r3, r3, r2
	blt	.L2664
	cmp	r3, r0
	bls	.L2664
	mul	r2, r9, r0
	b	.L2662
.L2916:
	ldr	r1, .L2954+20
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	str	r0, [r10, #2108]
	ldr	r3, [r5, #12]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	ldreq	r3, [r6, #244]
	subeq	r3, r3, #1
	beq	.L2768
	cmp	r3, #256
	ldreq	r2, [r5, #68]
	ldreq	r3, [r5, #72]
	ldrne	r3, [r6, #244]
	ldrne	r2, [r5, #68]
	mul	r3, r3, r2
	sub	r3, r3, #1
.L2768:
	cmp	r3, #255
	movcs	r3, #255
	cmp	r0, r3
	bhi	.L2927
	cmp	r0, #0
	beq	.L2772
	ldr	r1, .L2954+24
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #31
	add	r1, r0, #1
	str	r1, [r10, #2032]
	bhi	.L2928
	ldr	r3, [r10, #2108]
	cmp	r3, #0
	addne	r7, r4, #55296
	movne	r6, #0
	addne	r7, r7, #96
	bne	.L2776
	b	.L2772
.L2929:
	ldr	r1, [r10, #2032]
.L2776:
	ldr	r0, [r4, #2308]
	add	r6, r6, #1
	bl	BsGet
	str	r0, [r7, #4]!
	ldr	r3, [r10, #2108]
	cmp	r3, r6
	bhi	.L2929
	ldrb	r3, [r5, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2783
.L2777:
	ldr	r1, .L2954+28
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	cmp	r0, #256
	str	r0, [r10, #2112]
	bhi	.L2930
	ldr	r0, [r4, #2308]
	bl	BsResidBits
	ldr	r3, [r10, #2112]
	cmp	r0, r3
	bcc	.L2781
	cmp	r3, #0
	movne	r5, #0
	beq	.L2783
.L2784:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r3, [r10, #2112]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [r10, #2116]
	bhi	.L2784
	b	.L2783
.L2716:
	ldrb	r3, [r10, #1975]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2737
	mov	r3, #2
	mov	r2, #1
	strb	r2, [r10, #1979]
.L2742:
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2747
	cmp	r3, #1
	beq	.L2750
.L2747:
	ldrb	r2, [r5, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2736
	cmp	r3, #0
	bne	.L2736
.L2750:
	mov	r0, r4
	bl	HEVC_DecPredWeightTable
	cmp	r0, #0
	ldreq	r3, [r10, #2028]
	bne	.L2931
.L2736:
	cmp	r3, #2
	beq	.L2751
	ldr	r1, .L2954+32
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	rsb	r3, r0, #4
	rsb	r2, r0, #5
	cmp	r3, #4
	str	r2, [r10, #2084]
	bhi	.L2932
.L2751:
	ldr	r1, .L2954+36
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	str	r0, [r10, #2088]
	ldr	r2, [r5, #48]
	add	r2, r0, r2
	str	r2, [r10, #2024]
	ldr	r3, [r6, #104]
	cmp	r2, #51
	rsb	r0, r3, #0
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, r0
	orrlt	r1, r1, #1
	cmp	r1, #0
	bne	.L2933
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2934
.L2753:
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2900
	ldrb	r3, [r5, #19]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r10, #1980]
	bne	.L2935
.L2761:
	ldrb	r0, [r5, #20]	@ zero_extendqisi2
	strb	r0, [r10, #1981]
	ldr	r3, [r5, #76]
	str	r3, [r10, #2100]
	ldr	r3, [r5, #80]
	str	r3, [r10, #2104]
.L2758:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2764
	ldr	r2, [r10, #1972]
	bic	r3, r2, #-16777216
	bic	r3, r3, #255
	adds	r3, r3, #0
	movne	r3, #1
.L2764:
	ldrb	r2, [r5, #17]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2765
	cmp	r0, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L2936
.L2765:
	strb	r2, [r10, #1982]
	b	.L2665
.L2785:
	ldr	r2, [fp, #-72]
	cmp	r2, #0
	strneb	r3, [r4, #3]
	b	.L2788
.L2923:
	ldr	r3, [r10, #2028]
	cmp	r3, #0
	bne	.L2796
.L2795:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r3, [r10, #2028]
	strb	r0, [r10, #1977]
	b	.L2731
.L2900:
	ldrb	r0, [r10, #1981]	@ zero_extendqisi2
	b	.L2758
.L2920:
	ldr	r1, [r6, #132]
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r2, #1
	str	r0, [r10, #2056]
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
	bls	.L2674
	ldr	r0, [fp, #-104]
	ldr	r2, [fp, #-100]
	rsb	r2, r2, r1
	cmp	r2, r0, lsr #1
	movcs	r2, r0
	addcs	r3, r3, r2
	bcc	.L2674
.L2675:
	ldr	r2, [r10, #2040]
	sub	r2, r2, #16
	cmp	r2, #2
	ldr	r2, [fp, #-100]
	movls	r3, #0
	add	r3, r3, r2
	str	r3, [r10, #2016]
	ldr	r2, [r4, #212]
	cmp	r3, r2
	bge	.L2677
	ldrb	r0, [r10, #1969]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L2937
.L2677:
	str	r3, [r4, #188]
	ldr	r2, [r10, #2036]
	cmp	r2, #0
	bne	.L2678
	ldr	r2, [r10, #2040]
	cmp	r2, #15
	bls	.L2938
.L2679:
	sub	r1, r2, #16
	cmp	r1, #7
	movhi	r1, #0
	movls	r1, #1
.L2680:
	sub	r2, r2, #7
	bics	r2, r2, #2
	andne	r2, r1, #1
	moveq	r2, #0
	cmp	r2, #0
	strne	r3, [r10, #2020]
	strne	r3, [r4, #184]
.L2678:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #1972]
	cmp	r0, #0
	beq	.L2681
	ldr	r3, [r6, #228]
	cmp	r3, #1
	movhi	r1, #0
	movhi	r2, #1
	bls	.L2683
.L2685:
	add	r1, r1, #1
	cmp	r3, r2, asl r1
	bhi	.L2685
	cmp	r1, #0
	bne	.L2939
.L2683:
	mov	r1, #0
	str	r1, [r10, #2060]
.L2688:
	mov	r2, #204
	add	r0, r4, #58368
	mla	r1, r2, r1, r6
	add	r0, r0, #116
	str	r0, [fp, #-92]
	add	r1, r1, #13056
	add	r1, r1, #52
	bl	memcpy
.L2684:
	ldrb	r3, [r6, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2689
	add	r3, r4, #57344
	str	r3, [fp, #-84]
	mov	r1, r3
	ldr	r3, [r6, #232]
	ldr	r2, [r1, #1160]
	cmp	r3, #0
	ldr	r3, [r1, #1156]
	add	r3, r2, r3
	str	r3, [fp, #-108]
	bne	.L2690
.L2693:
	mov	r9, #0
.L2691:
	ldr	r1, .L2954+40
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	ldr	ip, [fp, #-84]
	ldr	r1, [r10, #2064]
	str	r0, [r10, #2068]
	add	r0, r0, r1
	ldr	r2, [ip, #1156]
	ldr	r3, [ip, #1160]
	str	r0, [ip, #1172]
	add	lr, r3, r2
	add	lr, lr, r0
	cmp	lr, #16
	bhi	.L2940
	ldr	r3, [fp, #-108]
	cmp	r0, #0
	sub	r7, r3, #1
	add	r7, r0, r7
	beq	.L2709
	add	r3, r7, #14144
	add	r7, r7, #58368
	add	r3, r3, #25
	add	r7, r7, #169
	add	r7, r4, r7
	str	r7, [fp, #-64]
	mov	r3, r3, asl #2
	add	lr, r4, #55040
	add	ip, r3, #64
	str	ip, [fp, #-56]
	ldr	r7, [fp, #-56]
	add	ip, r4, #56320
	str	ip, [fp, #-48]
	add	r0, r4, #56576
	add	r8, r4, r7
	add	r7, r4, r3
	ldr	r3, [fp, #-48]
	add	r0, r0, #32
	str	r0, [fp, #-60]
	add	r0, ip, #164
	add	ip, lr, #191
	add	lr, r3, #100
	add	r3, r3, #228
	add	r2, r4, #55040
	str	r7, [fp, #-96]
	add	r2, r2, #206
	str	lr, [fp, #-48]
	mov	lr, r3
	mov	r3, #0
	str	r5, [fp, #-112]
	str	r6, [fp, #-76]
	mov	r7, lr
	str	r9, [fp, #-80]
	mov	r9, r0
	ldr	r5, [fp, #-64]
	str	r4, [fp, #-52]
	mov	r4, r3
	str	r10, [fp, #-64]
	mov	r10, ip
	str	r2, [fp, #-116]
	str	r3, [fp, #-68]
	str	r2, [fp, #-56]
	ldr	r6, [fp, #-96]
	b	.L2708
.L2943:
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	ldreq	r0, [fp, #-80]
	bne	.L2941
.L2699:
	ldr	r2, [fp, #-76]
	add	r3, r2, r0
	add	r0, r0, #62
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	ldr	r3, [r2, r0, asl #2]
	strb	r1, [r5]
.L2702:
	ldr	r2, [fp, #-60]
	mov	r1, #1
	str	r3, [r2, #4]!
	ldr	r3, [fp, #-52]
	str	r2, [fp, #-60]
	ldr	r0, [r3, #2308]
	bl	BsGet
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-56]
	bne	.L2942
	cmp	r4, #0
	streq	r4, [fp, #-68]
	beq	.L2706
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-68]
	ldr	r3, [r3, #2064]
	cmp	r3, r4
	moveq	r2, #0
	str	r2, [fp, #-68]
.L2706:
	mov	r3, #0
	str	r3, [r8]
.L2705:
	ldr	r3, [fp, #-84]
	add	r4, r4, #1
	ldr	r2, [fp, #-48]
	sub	r6, r6, #4
	sub	r8, r8, #4
	sub	r5, r5, #1
	ldr	r3, [r3, #1172]
	add	r2, r2, #4
	add	r9, r9, #4
	add	r10, r10, #1
	cmp	r3, r4
	str	r2, [fp, #-48]
	add	r7, r7, #4
	bls	.L2707
	ldr	r3, [fp, #-64]
	ldr	r1, [r3, #2064]
.L2708:
	cmp	r1, r4
	bhi	.L2943
	ldr	r3, [fp, #-76]
	ldr	r1, [r3, #132]
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #2308]
	bl	BsGet
	ldr	r3, [fp, #-52]
	mov	r1, #1
	str	r0, [r9]
	str	r0, [fp, #-96]
	ldr	r0, [r3, #2308]
	bl	BsGet
	ldr	r3, [fp, #-96]
	uxtb	r0, r0
	strb	r0, [r10]
	strb	r0, [r5]
	b	.L2702
.L2674:
	ldr	r2, [fp, #-100]
	cmp	r1, r2
	bcs	.L2675
	rsb	r1, r1, r2
	ldr	r2, [fp, #-104]
	cmp	r1, r2, lsr #1
	rsbhi	r3, r2, r3
	b	.L2675
.L2919:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1968]
	b	.L2672
.L2934:
	ldr	r1, .L2954+44
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r10, #2092]
	cmp	r3, #24
	bhi	.L2944
	ldr	r3, [r5, #60]
	add	r2, r0, r3
	add	r2, r2, #12
	cmp	r2, #24
	bhi	.L2945
	ldr	r1, .L2954+48
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	add	r3, r0, #12
	str	r0, [r10, #2096]
	cmp	r3, #24
	bhi	.L2946
	ldr	r2, [r5, #64]
	add	r2, r0, r2
	add	r3, r2, #12
	cmp	r3, #24
	bls	.L2753
	ldr	r1, .L2954+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2649:
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L2954+56
	mov	r0, #1
	ldr	r1, .L2954+60
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2899:
	ldr	r3, [r10, #2028]
	b	.L2742
.L2689:
	ldrb	r3, [r6, #11]	@ zero_extendqisi2
	cmp	r3, #0
	streqb	r3, [r10, #1975]
	bne	.L2947
.L2714:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2793
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10, #1973]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1974]
	b	.L2793
.L2902:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #1
	strb	r0, [r10, #1973]
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1974]
	b	.L2791
.L2925:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1978]
	b	.L2732
.L2722:
	str	r0, [r10, #2140]
.L2721:
	cmp	r3, #2
	bne	.L2723
	b	.L2724
.L2921:
	ldr	r1, .L2954+64
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r10, #2072]
	cmp	r2, #16
	bhi	.L2948
	ldr	r3, [r10, #2028]
	str	r2, [r10, #2136]
	cmp	r3, #0
	movne	r2, #0
	strne	r2, [r10, #2076]
	strne	r2, [r10, #2140]
	bne	.L2721
	ldr	r1, .L2954+68
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	add	r2, r0, #1
	str	r2, [r10, #2076]
	cmp	r2, #16
	strls	r2, [r10, #2140]
	ldrls	r3, [r10, #2028]
	bls	.L2721
	mov	r3, #16
	ldr	r1, .L2954+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2926:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	ldr	r3, [r10, #2028]
	cmp	r3, #2
	uxtb	r0, r0
	strb	r0, [r10, #1979]
	beq	.L2751
	cmp	r0, #0
	bne	.L2740
	ldr	r2, [r10, #2140]
	cmp	r2, #1
	bhi	.L2738
	b	.L2742
.L2737:
	mov	r3, #2
	b	.L2747
.L2743:
	ldr	r3, [r10, #2072]
	sub	r3, r3, #1
	b	.L2745
.L2938:
	tst	r2, #1
	movne	r1, #1
	bne	.L2680
	b	.L2679
.L2690:
	ldr	r1, .L2954+76
	ldr	r0, [r4, #2308]
	bl	HEVC_ue_v
	str	r0, [r10, #2064]
	mov	r2, r0
	ldr	r3, [r6, #232]
	cmp	r0, r3
	bhi	.L2949
	cmp	r3, #1
	bls	.L2693
	mov	r9, #0
	mov	r2, #1
.L2694:
	add	r9, r9, #1
	cmp	r3, r2, asl r9
	bhi	.L2694
	str	r9, [fp, #-88]
	b	.L2691
.L2937:
	ldr	r1, .L2954+80
	bl	dprint_vfmw
	ldr	r3, [r10, #2016]
	b	.L2677
.L2781:
	mov	r2, r0
	ldr	r1, .L2954+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2942:
	ldr	r3, [fp, #-52]
	ldr	r1, .L2954+88
	ldr	r0, [r3, #2308]
	bl	HEVC_ue_v
	cmp	r4, #0
	str	r0, [r7]
	beq	.L2704
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #2064]
	cmp	r3, r4
	ldrne	r3, [fp, #-68]
	addne	r0, r0, r3
.L2704:
	str	r0, [r6]
	mov	r3, #1
	str	r0, [fp, #-68]
	str	r3, [r8]
	b	.L2705
.L2941:
	ldr	r3, [fp, #-52]
	ldr	r1, [fp, #-88]
	ldr	r0, [r3, #2308]
	bl	BsGet
	ldr	r3, [fp, #-48]
	cmp	r0, #0
	str	r0, [r3]
	blt	.L2950
	ldr	r3, [fp, #-76]
	ldr	r3, [r3, #232]
	sub	r3, r3, #1
	cmp	r3, r0
	bcs	.L2699
	mov	r7, r4
.L2701:
	str	r3, [sp]
	mov	r2, r7
	mov	r3, r0
	ldr	r1, .L2954+92
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2658:
	mov	r2, r9
	ldr	r1, .L2954+96
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2936:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1982]
	b	.L2665
.L2935:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #1980]
	cmp	r0, #0
	beq	.L2761
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r10, #1981]
	cmp	r0, #0
	bne	.L2758
	ldr	r1, .L2954+100
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r10, #2100]
	bhi	.L2951
.L2762:
	ldr	r1, .L2954+104
	ldr	r0, [r4, #2308]
	bl	HEVC_se_v
	add	r3, r0, #6
	mov	r2, r0
	cmp	r3, #12
	str	r0, [r10, #2104]
	bls	.L2900
	ldr	r1, .L2954+108
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #80]
	ldrb	r0, [r10, #1981]	@ zero_extendqisi2
	str	r3, [r10, #2104]
	b	.L2758
.L2707:
	ldr	r2, [fp, #-108]
	cmp	r3, #0
	ldr	r5, [fp, #-112]
	add	r2, r2, #14592
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-52]
	add	r2, r2, #63
	ldr	r10, [fp, #-64]
	beq	.L2709
	add	r2, r2, r3
	add	lr, r4, #56576
	add	lr, lr, #36
	mov	r7, #0
	add	r2, r4, r2, lsl #2
	ldr	r8, [fp, #-104]
	ldr	ip, [fp, #-116]
	ldr	r9, [fp, #-100]
	str	r4, [fp, #-48]
	b	.L2712
.L2953:
	ldr	r0, [r10, #2016]
	ldr	r4, [lr]
	rsb	r1, r9, r0
	add	r1, r1, r4
	ldr	r4, [r2, #-1948]
	mls	r1, r4, r8, r1
	rsb	r0, r0, r1
	str	r0, [r2, #-68]
	str	r1, [r2]
.L2711:
	add	r7, r7, #1
	add	lr, lr, #4
	cmp	r3, r7
	sub	r2, r2, #4
	bls	.L2952
.L2712:
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2953
	ldr	r1, [lr]
	str	r1, [r2]
	ldr	r0, [r10, #2016]
	rsb	r1, r0, r1
	str	r1, [r2, #-68]
	b	.L2711
.L2912:
	ldr	r3, [r4, #216]
	mov	r0, r4
	cmp	r3, #0
	ldrne	r3, [r4, #188]
	str	r3, [r10, #2016]
	bl	HEVC_IsNewPic
	ldr	r1, .L2954+112
	str	r0, [r10, #3556]
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2952:
	ldr	r4, [fp, #-48]
.L2697:
	ldr	r2, [fp, #-108]
	add	r2, r3, r2
	ldr	r3, [fp, #-84]
	cmp	r2, #16
	str	r2, [r3, #1164]
	bls	.L2689
	mov	r3, #16
	ldr	r1, .L2954+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2681:
	add	r7, r4, #58368
	ldr	r3, [r6, #228]
	add	r7, r7, #116
	mov	r1, r6
	mov	r0, r4
	mov	r2, r7
	bl	HEVC_DecShortTermRefPicSet
	cmp	r0, #0
	streq	r7, [fp, #-92]
	beq	.L2684
	ldr	r1, .L2954+120
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2947:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	bl	BsGet
	strb	r0, [r10, #1975]
	b	.L2714
.L2955:
	.align	2
.L2954:
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
.L2939:
	ldr	r0, [r4, #2308]
	bl	BsGet
	str	r0, [r10, #2060]
	cmp	r0, #0
	ldr	r3, [r6, #228]
	mov	r1, r0
	sub	r3, r3, #1
	blt	.L2687
	cmp	r3, r0
	bcs	.L2688
.L2687:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L2954+124
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2933:
	ldr	r1, .L2954+128
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2664:
	mov	r2, r0
	ldr	r1, .L2954+132
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2930:
	mov	r2, r0
	ldr	r1, .L2954+136
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2950:
	ldr	r6, [fp, #-76]
	mov	r7, r4
	ldr	r3, [r6, #232]
	sub	r3, r3, #1
	b	.L2701
.L2918:
	mov	r2, r0
	ldr	r1, .L2954+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2726:
	mov	r3, #16
	ldr	r1, .L2954+144
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2932:
	ldr	r1, .L2954+148
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2927:
	mov	r2, r0
	ldr	r1, .L2954+152
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2951:
	ldr	r1, .L2954+156
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #76]
	str	r3, [r10, #2100]
	b	.L2762
.L2945:
	mov	r2, r0
	ldr	r1, .L2954+160
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2709:
	mov	r3, #0
	b	.L2697
.L2931:
	ldr	r1, .L2954+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2946:
	mov	r2, r0
	ldr	r1, .L2954+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2944:
	mov	r2, r0
	ldr	r1, .L2954+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2940:
	str	r0, [sp]
	mov	ip, #16
	ldr	r1, .L2954+176
	mov	r0, #1
	str	ip, [sp, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2924:
	ldr	r1, .L2954+180
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2948:
	mov	r3, #16
	ldr	r1, .L2954+184
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2922:
	ldr	r1, .L2954+188
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2928:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L2954+192
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
.L2949:
	ldr	r1, .L2954+196
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2891
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
	ldr	r1, [r0, #2332]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2957
	ldr	r0, [r0, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L2957:
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
	ldr	r1, [r0, #2332]
	mov	r4, r0
	cmp	r1, #0
	beq	.L2963
	ldr	r0, [r0, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L2963:
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
	beq	.L2971
	mov	r4, #0
	add	r8, r0, #65536
	mov	r5, r4
	mov	r6, r4
.L2970:
	ldr	r3, [r8, #3644]
	add	r5, r5, #1
	add	r3, r3, r4
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L2969
	ldr	r0, [r7, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3644]
	add	r3, r3, r4
	str	r6, [r3, #24]
.L2969:
	ldr	r3, [r7, #160]
	add	r4, r4, #28
	cmp	r3, r5
	bhi	.L2970
.L2971:
	mov	r0, #0
	mov	r3, #2
	str	r0, [r7, #208]
	str	r0, [r7, #224]
	str	r0, [r7, #216]
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
	add	r9, r5, #2512
	mov	r4, r5
	add	r9, r9, #12
	mov	r6, #17
	mov	r7, #0
.L2982:
	ldr	r3, [r9, #4]!
	mov	r2, #1
	cmp	r3, #0
	beq	.L2978
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2978:
	ldr	r3, [r4, #2596]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2979
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2979:
	ldr	r3, [r4, #2664]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2980
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2980:
	ldr	r3, [r4, #2732]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2981
	ldr	r1, [r3, #32]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
.L2981:
	subs	r6, r6, #1
	str	r7, [r4, #2732]
	str	r7, [r4, #2664]
	add	r4, r4, #4
	str	r7, [r4, #2592]
	str	r7, [r4, #2524]
	bne	.L2982
	add	r4, r5, #24576
	mov	r7, #0
	mov	r1, r7
	mov	r2, #200
	ldr	r3, [r4, #3740]
	add	r0, r5, #2800
	ldr	r3, [r3, #236]
	str	r7, [r5, #2508]
	add	r3, r3, #1
	str	r7, [r5, #2520]
	cmp	r3, #17
	str	r7, [r5, #2524]
	str	r7, [r5, #2516]
	movhi	r3, #17
	str	r3, [r5, #2504]
	ldr	r3, .L3024
	str	r7, [r5, #2512]
	ldr	r3, [r3, #48]
	blx	r3
	add	r2, r5, #2320
	add	r2, r2, #12
	add	r3, r5, #2400
	mov	r0, r7
	mov	r1, #16
	str	r7, [r5, #2804]
	str	r1, [r5, #2800]
.L2985:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L2985
	add	r2, r5, #2464
	add	ip, r5, #53248
	add	r2, r2, #4
	mov	r0, r1
	str	r1, [ip, #2128]
.L2986:
	str	r0, [r3, #4]!
	cmp	r3, r2
	mov	r1, #0
	bne	.L2986
	cmp	r8, r1
	str	r1, [ip, #2132]
	bne	.L2987
	ldr	r3, [r5, #2324]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L2987
.L2988:
	ldr	r1, [r5, #180]
	cmp	r1, #0
	addne	r2, r5, #2112
	movne	r3, #0
	movne	r0, r3
	beq	.L2996
.L2995:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2995
.L2996:
	ldr	r3, [r5, #160]
	cmp	r3, #0
	addne	r8, r5, #65536
	movne	r4, #0
	movne	r7, r4
	beq	.L2994
.L2998:
	ldr	r3, [r8, #3644]
	add	r4, r4, #1
	add	r3, r3, r6
	ldr	r3, [r3, #24]
	cmp	r3, #0
	mov	r1, r3
	beq	.L2997
	ldr	r2, [r5, #2332]
	cmp	r3, r2
	beq	.L2997
	ldr	r0, [r5, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r8, #3644]
	add	r3, r3, r6
	str	r7, [r3, #24]
.L2997:
	ldr	r3, [r5, #160]
	add	r6, r6, #28
	cmp	r3, r4
	bhi	.L2998
.L2994:
	mov	r0, #0
.L2989:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2987:
	mov	r7, #20
	str	r7, [r5, #176]
	str	r7, [r5, #180]
	mov	r0, r5
	ldr	r1, [r4, #3740]
	ldr	r3, [r1, #240]
	ldr	ip, [r1, #244]
	ldr	r2, [r1, #148]
	str	r7, [sp, #8]
	mov	r1, r3, asl r2
	str	ip, [sp]
	mov	r2, ip, asl r2
	str	r7, [sp, #4]
	bl	HEVC_ArrangeVahbMem
	ldr	r3, [r5, #2324]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L2999
	cmp	r0, #1
	bne	.L3022
	ldr	r0, [r5, #244]
	bl	FSP_GetTotalValidFsNum
	cmp	r0, #20
	movgt	r0, r7
	ble	.L3023
.L2991:
	str	r0, [r5, #176]
	b	.L2988
.L3023:
	ldr	r0, [r5, #244]
	bl	FSP_GetTotalValidFsNum
	b	.L2991
.L3022:
	ldr	r2, .L3024+4
	mov	r0, #0
	ldr	r1, .L3024+8
	bl	dprint_vfmw
	mvn	r0, #4
	b	.L2989
.L2999:
	mvn	r0, #1
	b	.L2989
.L3025:
	.align	2
.L3024:
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
	beq	.L3030
	mov	r4, #0
	add	r7, r0, #65536
	mov	r5, r4
	b	.L3029
.L3028:
	ldr	r3, [r6, #160]
	add	r3, r3, #1
	cmp	r3, r5
	bls	.L3030
.L3029:
	ldr	r1, [r7, #2840]
	add	r5, r5, #1
	add	r1, r1, r4
	add	r4, r4, #100
	ldr	r3, [r1, #36]
	cmp	r3, #1
	bne	.L3028
	ldr	r0, [r6, #244]
	bl	HEVC_ReleaseNAL
	ldr	r3, [r6, #160]
	add	r3, r3, #1
	cmp	r3, r5
	bhi	.L3029
.L3030:
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
	ldr	r1, .L3046
	mov	r4, r0
	mov	r0, #22
	add	r5, r4, #68608
	bl	dprint_vfmw
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	bl	HEVC_ClearAllNal
	add	r0, r4, #62464
	add	r0, r0, #216
	ldr	r6, .L3046+4
	bl	ResetVoQueue
	mov	r8, #0
	add	r5, r5, #656
	mov	r9, #20
	mov	r7, r8
.L3034:
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
	bne	.L3034
	add	r3, r4, #2112
	add	r1, r4, #2192
	mov	r2, #0
.L3035:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L3035
	ldr	r3, [r4, #160]
	cmp	r3, #0
	addne	ip, r4, #65536
	movne	r3, #0
	movne	r0, r3
	movne	r1, r3
	beq	.L3039
.L3038:
	ldr	r2, [ip, #3644]
	add	r0, r0, #1
	str	r1, [r2, r3]
	ldr	r2, [ip, #3644]
	add	r2, r2, r3
	str	r1, [r2, #20]
	ldr	r2, [ip, #3644]
	add	r2, r2, r3
	add	r3, r3, #28
	str	r1, [r2, #24]
	ldr	r2, [r4, #160]
	cmp	r2, r0
	bhi	.L3038
.L3039:
	ldr	r3, [r6, #48]
	mov	r2, #200
	mov	r1, #0
	add	r0, r4, #2800
	blx	r3
	add	ip, r4, #2720
	add	r0, r4, #2656
	add	r1, r4, #2512
	add	ip, ip, #8
	add	r0, r0, #4
	add	r1, r1, #12
	add	lr, r4, #2592
	mov	r3, #16
	mov	r2, #17
	str	r3, [r4, #2800]
	mov	r3, #0
.L3037:
	subs	r2, r2, #1
	str	r3, [ip, #4]!
	str	r3, [r0, #4]!
	str	r3, [lr, #4]!
	str	r3, [r1, #4]!
	bne	.L3037
	add	r1, r4, #2320
	add	ip, r4, #2464
	add	r1, r1, #12
	add	ip, ip, #4
	add	r3, r4, #2400
	mov	r0, r2
	mov	lr, #17
	str	r2, [r4, #2508]
	str	r2, [r4, #2512]
	str	r2, [r4, #2516]
	str	r2, [r4, #2520]
	str	r2, [r4, #2524]
	str	lr, [r4, #2504]
.L3040:
	str	r0, [r3, #4]!
	cmp	r3, ip
	str	r0, [r1, #4]!
	mov	r5, #0
	bne	.L3040
	add	r0, r4, #55040
	mov	r9, #2
	mov	r1, r5
	ldr	r3, [r6, #48]
	str	r5, [r4, #2332]
	movw	r2, #3732
	str	r5, [r4, #208]
	add	r0, r0, #176
	str	r5, [r4, #224]
	add	r7, r4, #2464
	str	r5, [r4, #216]
	add	r7, r7, #8
	str	r9, [r4, #172]
	mov	r8, #32
	blx	r3
	add	r2, r4, #53248
	mov	r3, #1
	mov	lr, #20
	str	r9, [r2, #2028]
	mov	ip, #16
	str	r3, [r2, #3556]
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
	str	r9, [r4, #2208]
	mvn	r9, #-2147483648
	str	r5, [r4, #168]
	movw	r5, #1025
	str	r8, [r4, #320]
	mov	r8, #4
	str	lr, [r4, #176]
	str	lr, [r4, #180]
	mov	lr, #6
	str	r3, [r4, #192]
	str	r3, [r4, #196]
	str	r3, [r4, #312]
	mov	r3, #256
	ldr	r6, [r6, #48]
	str	r9, [r4, #200]
	str	ip, [r4, #292]
	str	ip, [r4, #316]
	str	r10, [r4, #296]
	str	r3, [r4, #300]
	str	r5, [r4, #304]
	str	r8, [r4, #308]
	str	lr, [r4, #2196]
	str	lr, [r4, #2200]
	str	lr, [r4, #2204]
	blx	r6
	str	r7, [r4, #2308]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3047:
	.align	2
.L3046:
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
	ldr	r7, .L3061
	movw	r2, #22184
	ldr	r5, [r8, #1584]
	mov	r4, r0
	mov	r9, r1
	movt	r2, 1
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	str	r5, [r8, #1584]
	mov	r3, #0
	str	r9, [r4, #2324]
	str	r3, [r4, #2328]
	ldr	r3, [r9, #28]
	cmp	r3, #25
	beq	.L3056
	mov	r3, #17
	mov	r1, #65
	str	r3, [r4, #148]
	mov	r2, #200
	str	r3, [r4, #152]
	mov	r3, #210
	str	r1, [r4, #156]
	str	r2, [r4, #144]
	str	r3, [r4, #160]
.L3050:
	ldr	r0, [r9, #584]
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L3057
	ldr	r3, [r4, #148]
	movw	r2, #23196
	ldr	r10, [r4, #2324]
	add	r6, r4, #65536
	ldr	r0, [r4, #152]
	mov	lr, #100
	mul	r3, r2, r3
	ldr	ip, [r10, #580]
	ldr	r2, [r4, #156]
	add	r1, r5, ip
	str	r1, [r4, #2312]
	add	ip, r3, ip
	str	r3, [fp, #-52]
	add	r3, r5, ip
	str	r3, [r4, #2316]
	movw	r3, #26164
	mla	ip, r3, r0, ip
	add	r3, r5, ip
	str	r3, [r4, #2320]
	movw	r3, #2024
	mla	ip, r3, r2, ip
	mov	r3, #1360
	add	r0, r5, ip
	str	r0, [r6, #2836]
	ldr	r2, [r4, #144]
	mul	r2, r3, r2
	add	ip, ip, r2
	add	r3, r5, ip
	str	r3, [r6, #2840]
	ldr	r3, [r4, #160]
	mla	lr, r3, lr, lr
	mov	r3, r3, asl #5
	str	lr, [fp, #-48]
	ldr	lr, [r4, #160]
	sub	r3, r3, lr, asl #2
	ldr	lr, [fp, #-48]
	add	ip, ip, lr
	add	r5, r5, ip
	str	r5, [r6, #3644]
	ldr	r5, [r10, #588]
	add	r3, ip, r3
	cmp	r3, r5
	bhi	.L3058
	ldr	r5, [r9, #608]
	cmp	r5, #0
	beq	.L3059
.L3054:
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	ldr	ip, [r4, #160]
	mov	r2, #100
	ldr	r3, [r7, #48]
	mov	r1, #0
	ldr	r0, [r6, #2840]
	mla	r2, ip, r2, r2
	blx	r3
	ldr	r3, [r4, #160]
	ldr	ip, [r7, #48]
	mov	r1, #0
	ldr	r0, [r6, #3644]
	mov	r5, #1
	mov	r2, r3, asl #5
	sub	r2, r2, r3, asl #2
	blx	ip
	ldr	lr, [r4, #148]
	movw	r3, #23196
	ldr	r6, [r4, #2312]
	add	ip, r4, #24576
	movw	r1, #2024
	mul	r3, r3, lr
	movw	r2, #26164
	mov	r0, r4
	sub	r3, r3, #23040
	sub	r3, r3, #156
	add	r6, r6, r3
	str	r6, [ip, #3736]
	ldr	r3, [r4, #156]
	ldr	r7, [r4, #2320]
	mul	r3, r1, r3
	sub	r3, r3, #2016
	sub	r3, r3, #8
	add	r3, r7, r3
	str	r3, [ip, #3744]
	ldr	r3, [r4, #152]
	ldr	r1, [r4, #2316]
	mul	r3, r2, r3
	sub	r3, r3, #26112
	sub	r3, r3, #52
	add	r3, r1, r3
	str	r3, [ip, #3740]
	str	lr, [r6, #8]
	ldr	r3, [ip, #3744]
	ldr	r2, [r4, #152]
	str	r2, [r3, #28]
	ldr	r3, [ip, #3740]
	ldr	r2, [r4, #156]
	str	r2, [r3, #60]
	bl	HEVC_InitScalingOrderTable
	add	r3, r4, #86016
	mov	r0, r4
	str	r5, [r3, #1684]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #244]
	beq	.L3060
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	bl	HEVC_InitDecPara
	mov	r0, #0
	str	r0, [r8, #1592]
	movw	r2, #9999
	ldr	r3, [r4, #156]
	strb	r5, [r4]
	str	r2, [r4, #252]
	str	r3, [r4, #288]
.L3052:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3059:
	ldr	r2, [fp, #-52]
	mov	r0, r1
	ldr	r3, [r7, #48]
	mov	r1, r5
	blx	r3
	ldr	r2, [r4, #152]
	movw	ip, #26164
	ldr	r3, [r7, #48]
	mov	r1, r5
	ldr	r0, [r4, #2316]
	mul	r2, ip, r2
	blx	r3
	ldr	r2, [r4, #156]
	movw	ip, #2024
	ldr	r3, [r7, #48]
	mov	r1, r5
	ldr	r0, [r4, #2320]
	mul	r2, ip, r2
	blx	r3
	ldr	r2, [r4, #144]
	mov	r3, #1360
	ldr	r0, [r6, #2836]
	mul	r2, r3, r2
	b	.L3054
.L3056:
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
	b	.L3050
.L3058:
	str	r5, [sp]
	mov	r0, #0
	ldr	r2, .L3061+4
	ldr	r1, .L3061+8
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3052
.L3060:
	ldr	r2, .L3061+4
	mov	r0, #0
	ldr	r1, .L3061+12
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3052
.L3057:
	ldr	r2, .L3061+4
	ldr	r1, .L3061+16
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L3052
.L3062:
	.align	2
.L3061:
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
	ldr	r3, [r4, #1300]
	cmp	r3, #0
	beq	.L3064
	ldr	r1, [r3, #32]
	mov	r2, #1
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #1300]
	mov	r3, #0
	str	r3, [r2, #4]
	str	r3, [r4, #1300]
.L3064:
	mov	r0, #0
	strb	r0, [r4, #1241]
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
	bne	.L3071
	add	r0, r4, #62464
	add	r0, r0, #216
	bl	ResetVoQueue
	ldr	r0, [r4, #244]
	bl	FSP_EmptyInstance
.L3070:
	mov	r0, r4
	bl	HEVC_InitDecPara
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3071:
	add	r1, r4, #62464
	ldr	r0, [r4, #244]
	add	r1, r1, #216
	bl	FSP_ClearNotInVoQueue
	b	.L3070
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
	ldr	r3, [r0, #256]
	mov	r4, r0
	add	r9, r0, #24576
	add	r5, r0, #53248
	str	r3, [fp, #-48]
	ldr	r3, [r4, #260]
	ldr	r2, [r9, #3740]
	ldr	r0, [r5, #2044]
	str	r3, [fp, #-52]
	ldr	r3, [r4, #264]
	cmp	r0, #0
	str	r3, [fp, #-56]
	ldr	r3, [r2, #100]
	str	r3, [fp, #-68]
	ldr	r3, [r2, #108]
	str	r3, [fp, #-72]
	ldr	r3, [r4, #268]
	str	r3, [fp, #-60]
	blt	.L3106
	ldr	r3, [r4, #156]
	cmp	r0, r3
	bge	.L3106
	ldr	lr, [r4, #2320]
	movw	r6, #2024
	movw	ip, #26164
	ldr	r3, [r4, #2316]
	ldr	r7, [r4, #2312]
	movw	r1, #23196
	mla	r6, r6, r0, lr
	ldr	r0, [r9, #3736]
	ldr	r0, [r0, #8]
	ldr	r10, [r6, #32]
	mul	r10, ip, r10
	add	r8, r3, r10
	ldr	ip, [r8, #52]
	mla	r1, r1, ip, r7
	ldr	ip, [r1, #8]
	cmp	r0, ip
	bne	.L3074
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3129
.L3074:
	mov	r2, #0
	strb	r2, [r1, #2]
	ldr	r0, [r4, #148]
	movw	r7, #23196
	ldr	ip, .L3135
	mov	r2, r7
	ldr	lr, [r4, #2312]
	mul	r0, r7, r0
	ldr	ip, [ip, #52]
	str	r3, [fp, #-64]
	sub	r0, r0, #23040
	sub	r0, r0, #156
	add	r0, lr, r0
	blx	ip
	ldr	r0, [r4, #148]
	ldr	r2, [r9, #3740]
	ldr	r3, [fp, #-64]
	mul	r7, r7, r0
	ldr	r1, [r4, #2312]
	sub	r7, r7, #23040
	sub	r7, r7, #156
	add	r7, r1, r7
	str	r7, [r9, #3736]
.L3075:
	ldr	r0, [r2, #60]
	ldr	r1, [r8, #60]
	cmp	r0, r1
	beq	.L3130
.L3076:
	mov	r2, #0
	strb	r2, [r3, r10]
	ldr	r0, [r4, #152]
	movw	r7, #26164
	ldr	ip, [r9, #3740]
	mov	r2, r7
	ldr	lr, [r8, #236]
	mov	r1, r8
	mul	r0, r7, r0
	ldr	ip, [ip, #236]
	ldr	r3, .L3135
	ldr	r10, [r4, #2316]
	subs	ip, lr, ip
	sub	r0, r0, #26112
	sub	r0, r0, #52
	ldr	r3, [r3, #52]
	add	r0, r10, r0
	movne	ip, #1
	str	ip, [fp, #-64]
	blx	r3
	ldr	r3, [r4, #152]
	ldr	r2, [r4, #2316]
	mul	r7, r7, r3
	sub	r7, r7, #26112
	sub	r7, r7, #52
	add	r2, r2, r7
	str	r2, [r9, #3740]
	ldr	r3, [r2, #60]
	str	r3, [r4, #256]
	ldr	r3, [r2, #72]
	str	r3, [r4, #260]
	ldr	r3, [r2, #76]
	str	r3, [r4, #264]
	ldr	r3, [r2, #148]
	str	r3, [r4, #268]
.L3077:
	ldr	r3, [r2, #108]
	ldr	r2, [r2, #100]
	ldr	r1, [r4, #2324]
	cmp	r3, r2
	movcc	r3, r2
	str	r3, [r1, #884]
	ldr	r2, [r9, #3744]
	ldr	r3, [r6, #28]
	ldr	r2, [r2, #28]
	cmp	r2, r3
	beq	.L3131
.L3078:
	ldrb	r3, [r6, #13]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r6, #1]
	cmp	r3, r7
	beq	.L3080
	ldrb	r3, [r6, #15]	@ zero_extendqisi2
	cmp	r3, r7
	beq	.L3081
	ldr	r10, [r6, #68]
	cmp	r10, r7
	ble	.L3086
	add	ip, r6, #174
	str	r4, [fp, #-80]
	str	r6, [fp, #-76]
	mov	r4, ip
	str	r5, [fp, #-84]
.L3085:
	ldr	r6, [r8, #240]
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
	bne	.L3085
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-80]
	ldr	r5, [fp, #-84]
.L3086:
	ldr	r10, [r6, #72]
	cmp	r10, #0
	ble	.L3087
	add	ip, r6, #214
	str	r4, [fp, #-80]
	mov	r7, #0
	str	r6, [fp, #-76]
	mov	r4, ip
	str	r5, [fp, #-84]
.L3088:
	ldr	r6, [r8, #244]
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
	bne	.L3088
	ldr	r6, [fp, #-76]
	ldr	r4, [fp, #-80]
	ldr	r5, [fp, #-84]
	b	.L3087
.L3106:
	mov	r0, #0
.L3128:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3080:
	ldr	r3, [r8, #240]
	strh	r3, [r6, #176]	@ movhi
	ldr	r3, [r8, #244]
	strh	r3, [r6, #216]	@ movhi
.L3087:
	ldr	r0, [r4, #156]
	movw	r7, #2024
	ldr	r3, .L3135
	mov	r2, r7
	ldr	ip, [r4, #2320]
	mov	r1, r6
	mul	r0, r7, r0
	ldr	r3, [r3, #52]
	sub	r0, r0, #2016
	sub	r0, r0, #8
	add	r0, ip, r0
	blx	r3
	ldr	r2, [r4, #156]
	ldr	r3, [r4, #2320]
	ldr	r1, [fp, #-48]
	mul	r7, r7, r2
	ldr	r2, [fp, #-64]
	sub	r7, r7, #2016
	sub	r7, r7, #8
	add	r7, r3, r7
	str	r7, [r9, #3744]
	ldr	r3, [r8, #60]
	cmp	r1, r3
	cmpeq	r2, #0
	bne	.L3094
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L3094
	ldr	r3, [r8, #72]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L3094
.L3104:
	ldr	r3, [r8, #76]
	ldr	r2, [fp, #-56]
	cmp	r2, r3
	bne	.L3094
	ldr	r3, [r4, #2324]
	ldr	r2, [r3, #872]
	cmp	r2, #1
	bne	.L3096
.L3095:
	ldr	r3, [r3, #888]
	cmp	r3, #1
	beq	.L3132
.L3099:
	add	r3, r4, #86016
	ldr	r3, [r3, #1684]
	cmp	r3, #1
	beq	.L3133
.L3100:
	mov	r1, #1
	mov	r0, r4
	bl	HEVC_InitDPB
	cmn	r0, #2
	beq	.L3128
	cmp	r0, #0
	bne	.L3101
	ldr	r3, [r4, #2324]
.L3098:
	mov	r2, #0
	str	r2, [r3, #888]
.L3096:
	mov	r0, r4
	bl	HEVC_AllocFrameStore
	subs	r6, r0, #0
	bne	.L3134
	ldr	r1, [r5, #2040]
	mov	r0, #1
	ldr	r2, [r5, #2016]
	mvn	r3, #0
	strb	r0, [r5, #1241]
	add	r7, r4, #55040
	str	r1, [r5, #1244]
	movw	lr, #55200
	str	r2, [r5, #1248]
	add	r0, r4, #54528
	str	r3, [r5, #1272]
	add	r0, r0, #24
	ldr	r1, [r9, #3740]
	ldr	r8, [r1, #72]
	str	r8, [r5, #1256]
	ldr	r8, [r1, #76]
	str	r8, [r5, #1260]
	ldr	r8, [r1, #240]
	ldr	r1, [r1, #244]
	str	r6, [r5, #1268]
	mul	r1, r1, r8
	str	r1, [r5, #1264]
	ldr	r1, [r4, #2324]
	ldrd	r2, [r1, #56]
	strd	r2, [r7, #152]
	ldrd	r2, [r1, #72]
	strd	r2, [r4, lr]
	ldrd	r2, [r1, #88]
	strd	r2, [r7, #168]
	mvn	r2, #0
	ldr	ip, [r1, #104]
	mvn	r3, #0
	str	ip, [r5, #1312]
	ldr	ip, [r1, #108]
	str	ip, [r5, #1316]
	ldr	ip, [r1, #112]
	str	ip, [r5, #1320]
	ldr	ip, [r1, #128]
	str	ip, [r5, #1324]
	strd	r2, [r1, #56]
	ldr	r3, [r9, #3740]
	ldr	r2, [r3, #72]
	str	r2, [r5, #1432]
	ldr	r1, [r3, #76]
	ldrb	r2, [r5, #1428]	@ zero_extendqisi2
	str	r1, [r5, #1436]
	ldr	r1, [r3, #64]
	ldr	ip, [r3, #2660]
	subs	r1, r1, #1
	bfi	r2, ip, #5, #3
	movne	r1, #1
	bfi	r2, r1, #2, #3
	strb	r2, [r5, #1428]
	ldr	r1, [r3, #2644]
	and	r1, r1, #7
	bl	SetAspectRatio
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #2016]
	str	r6, [r5, #1416]
	str	r2, [r3, #12]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1428]
	str	r2, [r3, #204]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1416]
	str	r2, [r3, #192]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1308]
	str	r2, [r3, #84]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1304]
	str	r2, [r3, #80]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1432]
	str	r2, [r3, #208]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1436]
	str	r2, [r3, #212]
	ldr	r3, [r5, #1300]
	ldr	r0, [r4, #244]
	ldr	r1, [r3, #32]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L3103
	ldr	r3, [r5, #1416]
	mov	r1, r6
	ldr	r2, [r0, #8]
	adds	r3, r3, #0
	ldr	r0, [r4, #244]
	movne	r3, #1
	bl	FSP_SetStoreType
.L3103:
	ldr	r3, [r9, #3740]
	mov	r4, #0
	ldr	lr, [r5, #1300]
	mov	r0, r4
	ldr	r2, [r3, #84]
	str	r2, [r5, #1644]
	ldr	r7, [r3, #88]
	str	r7, [r5, #1648]
	ldr	r1, [r3, #92]
	str	r1, [r5, #1652]
	ldr	r6, [r3, #96]
	str	r6, [r5, #1656]
	ldr	ip, [r3, #72]
	rsb	r2, r2, ip
	rsb	r2, r7, r2
	str	r2, [r5, #1440]
	ldr	ip, [r3, #76]
	rsb	r1, r1, ip
	rsb	r1, r6, r1
	str	r1, [r5, #1444]
	ldr	r1, [r3, #64]
	str	r1, [r5, #1500]
	ldr	r1, [r3, #100]
	str	r1, [r5, #1504]
	ldr	r3, [r3, #108]
	str	r3, [r5, #1508]
	ldr	r3, [lr, #224]
	str	r3, [r5, #1448]
	ldr	r3, [lr, #228]
	str	r3, [r5, #1452]
	str	r2, [lr, #216]
	ldr	r2, [r5, #1444]
	ldr	r3, [r5, #1300]
	str	r2, [r3, #220]
	ldr	r2, [r5, #1448]
	ldr	r3, [r5, #1300]
	str	r2, [r3, #224]
	ldr	r2, [r5, #1452]
	ldr	r3, [r5, #1300]
	str	r2, [r3, #228]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1504]
	str	r2, [r3, #280]
	ldr	r3, [r5, #1300]
	ldr	r2, [r5, #1508]
	str	r2, [r3, #284]
	str	r4, [r5, #1252]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3131:
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3078
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L3078
	ldr	r3, [r8, #72]
	ldr	r2, [fp, #-52]
	cmp	r2, r3
	bne	.L3078
	ldr	r3, [r8, #76]
	ldr	r2, [fp, #-56]
	cmp	r2, r3
	bne	.L3078
	ldr	r3, [r8, #148]
	ldr	r2, [fp, #-60]
	cmp	r2, r3
	bne	.L3078
	ldr	r3, [r8, #60]
	ldr	r2, [fp, #-64]
	ldr	r1, [fp, #-48]
	cmp	r1, r3
	cmpeq	r2, #0
	beq	.L3104
.L3094:
	ldr	r3, [fp, #-64]
	mov	r0, r4
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-52]
	str	r3, [sp]
	ldr	r3, [fp, #-60]
	bl	HEVC_GetReRangeFlag
	ldr	r3, [r4, #2324]
	cmp	r0, #0
	bne	.L3095
	ldr	r2, [r3, #872]
	cmp	r2, #1
	bne	.L3098
	b	.L3095
.L3081:
	ldr	lr, [r6, #68]
	ldr	r3, [r8, #240]
	cmp	lr, #1
	add	r0, r6, lr, lsl #1
	strh	r3, [r0, #174]	@ movhi
	ble	.L3092
	add	lr, lr, #44
	add	r1, r6, #90
	add	ip, r6, #174
	add	lr, r6, lr, lsl #1
.L3091:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #174]
	rsb	r3, r2, r3
	strh	r3, [r0, #174]	@ movhi
	bne	.L3091
.L3092:
	ldr	lr, [r6, #72]
	ldr	r3, [r8, #244]
	cmp	lr, #1
	add	r0, r6, lr, lsl #1
	strh	r3, [r0, #214]	@ movhi
	ble	.L3087
	add	lr, lr, #64
	add	r1, r6, #130
	add	ip, r6, #214
	add	lr, r6, lr, lsl #1
.L3093:
	ldrh	r2, [r1, #2]!
	cmp	r1, lr
	strh	r2, [ip, #2]!	@ movhi
	ldrh	r3, [r0, #214]
	rsb	r3, r2, r3
	strh	r3, [r0, #214]	@ movhi
	bne	.L3093
	b	.L3087
.L3129:
	ldr	r0, [r4, #168]
	cmp	r0, #0
	bne	.L3075
	b	.L3074
.L3134:
	ldr	r1, .L3135+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3130:
	ldrb	r1, [r3, r10]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3076
	ldr	r0, [r4, #168]
	cmp	r0, #0
	beq	.L3076
	ldr	r0, [r8, #72]
	ldr	ip, [fp, #-52]
	cmp	ip, r0
	bne	.L3076
	ldr	r0, [r8, #76]
	ldr	ip, [fp, #-56]
	cmp	ip, r0
	bne	.L3076
	ldr	r0, [r8, #148]
	ldr	ip, [fp, #-60]
	cmp	ip, r0
	streq	r1, [fp, #-64]
	bne	.L3076
	b	.L3077
.L3133:
	mov	r0, r4
	bl	HEVC_GetBackPicFromVOQueue
	b	.L3100
.L3132:
	ldr	ip, [r8, #108]
	mov	r0, #31
	ldr	r1, [fp, #-72]
	ldr	r3, [r8, #100]
	ldr	r2, [fp, #-68]
	str	r1, [sp]
	str	ip, [sp, #4]
	ldr	r1, .L3135+8
	bl	dprint_vfmw
	b	.L3099
.L3101:
	mov	r2, r0
	ldr	r1, .L3135+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3128
.L3136:
	.align	2
.L3135:
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
	beq	.L3145
	cmn	r6, #3
	moveq	r0, #0
	bne	.L3146
.L3140:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3145:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3147
	add	r3, r4, #62464
	ldr	r0, [r4, #244]
	add	r3, r3, #216
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #16
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3148
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	strcc	r6, [r7, #24]
	bcs	.L3149
.L3143:
	ldr	r2, [r4, #284]
	mov	r0, #0
	ldr	r3, [r4, #276]
	add	r2, r2, #1
	str	r2, [r4, #284]
	add	r3, r3, #1
	str	r3, [r4, #276]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3149:
	mov	r1, r7
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L3143
.L3146:
	mov	r3, r6
	movw	r2, #9699
	ldr	r1, .L3150
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #260]
	mov	r0, r4
	bl	HEVC_DECRecycleImage
	mvn	r0, #0
	b	.L3140
.L3148:
	mov	r2, r0
	ldr	r1, .L3150+4
	mov	r0, r6
	bl	dprint_vfmw
	mov	r2, r6
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mvn	r0, #0
	b	.L3140
.L3147:
	ldr	r2, .L3150+8
	ldr	r1, .L3150+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3140
.L3151:
	.align	2
.L3150:
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
	ldr	r4, [r6, #1300]
	add	r1, r6, #1296
	mov	r7, r0
	mov	r2, #664
	add	r0, r4, #80
	add	r1, r1, #8
	str	ip, [r4, #4]
	strb	r3, [r4, #2]
	strb	r5, [r4, #1]
	ldr	r3, [r6, #1252]
	str	r3, [r4, #16]
	ldr	r3, [r6, #1280]
	str	r3, [r4, #20]
	bl	memcpy
	str	r5, [r4, #48]
	ldr	r3, [r6, #1280]
	mov	r2, r5
	ldr	r1, [r4, #32]
	str	r3, [r4, #40]
	ldr	r0, [r7, #244]
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r7
	bl	HEVC_OutputFrmToVO
	ldr	r3, .L3153
	str	r5, [r4, #4]
	mov	r1, r5
	mov	r2, #728
	ldr	r3, [r3, #48]
	mov	r6, r0
	add	r0, r7, #54272
	add	r0, r0, #216
	blx	r3
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3154:
	.align	2
.L3153:
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
	ldr	r3, [r2, #1276]
	cmp	r3, r1
	addne	r3, r3, #528
	movne	ip, #0
	addne	r4, r4, r3, lsl #2
	strne	ip, [r4, #4]
	strne	r1, [r2, #1276]
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
	ldr	lr, [r0, #2508]
	mov	r4, r0
	cmp	lr, #0
	beq	.L3169
	add	r6, r0, #2512
	ldr	ip, [r0, #212]
	add	r6, r6, #12
	mov	r7, #0
	mov	r3, r7
	mov	r1, r6
.L3160:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3159
	ldr	r2, [r2, #12]
	cmp	r2, ip
	addgt	r7, r7, #1
.L3159:
	cmp	r3, lr
	bne	.L3160
	add	r9, r4, #53248
	add	r2, r4, #24576
	mov	r5, #0
	str	r5, [fp, #-48]
	ldr	r1, [r9, #2036]
	ldr	r3, [r2, #3740]
	add	r3, r3, r1, lsl #2
	ldr	r8, [r3, #412]
.L3168:
	ldr	r1, [r6, #4]!
	mov	r2, r5
	ldrb	r10, [r4, #2]	@ zero_extendqisi2
	mov	r0, #22
	ldr	lr, [r9, #2016]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	str	r8, [sp, #12]
	str	r7, [sp, #8]
	str	ip, [sp, #4]
	str	r10, [sp, #20]
	str	lr, [sp, #16]
	ldr	ip, [r1, #12]
	ldr	r1, .L3181
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r1, [r6]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3162
	cmp	r7, r8
	ldr	r0, [r1, #12]
	ldr	r3, [r4, #212]
	movls	ip, #0
	movhi	ip, #1
	cmp	r0, r3
	movle	ip, #0
	cmp	ip, #0
	beq	.L3163
	ldr	ip, [r9, #2016]
	cmp	r0, ip
	blt	.L3164
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L3164
.L3163:
	cmp	r3, #0
	bne	.L3165
	ldr	r0, [r1, #12]
	cmp	r0, #0
	bge	.L3165
	cmp	r2, #0
	beq	.L3180
.L3166:
	str	r0, [sp]
	mov	r0, #31
	ldr	r2, .L3181+4
	ldr	r1, .L3181+8
	bl	dprint_vfmw
.L3165:
	ldr	r3, [r4, #2508]
	add	r5, r5, #1
	cmp	r3, r5
	bls	.L3178
.L3167:
	ldr	ip, [r4, #212]
	b	.L3168
.L3164:
	mov	r3, #1
	mov	r0, r4
	strb	r3, [r1, #2]
	add	r5, r5, #1
	ldr	r1, [r6]
	sub	r7, r7, #1
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r6]
	ldr	r3, [r3, #12]
	str	r3, [r4, #212]
	ldr	r3, [r4, #2508]
	cmp	r3, r5
	str	r0, [fp, #-48]
	bhi	.L3167
.L3178:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3162:
	ldr	r3, [r4, #212]
	b	.L3163
.L3180:
	mov	r2, r3
	ldr	r0, [r4, #244]
	ldr	r1, [r1, #32]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	ldr	r3, [r4, #212]
	ldr	r0, [r2, #12]
	b	.L3166
.L3169:
	str	lr, [fp, #-48]
	b	.L3178
.L3182:
	.align	2
.L3181:
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
	ldr	r3, [r4, #2528]
	strb	r2, [r3, #2]
	ldr	r1, [r4, #2528]
	bl	HEVC_OutputFrmToVO
	ldr	r3, [r4, #2528]
	ldr	r2, [r3, #12]
	str	r2, [r5, #212]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L3184
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveApcStore
	mov	r1, r6
	mov	r0, r5
	bl	HEVC_RemoveFrameStoreOutDPB
.L3184:
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
	bne	.L3189
	mov	r0, r4
	ldr	r1, [fp, #-24]
	bl	HEVC_OutputOneFrmFromDPB
	cmp	r0, #0
	bne	.L3190
.L3187:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3189:
	ldr	r2, .L3191
	mov	r0, #1
	ldr	r1, .L3191+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3187
.L3190:
	ldr	r2, .L3191
	mov	r0, #1
	ldr	r1, .L3191+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3187
.L3192:
	.align	2
.L3191:
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
	beq	.L3202
	ldr	r3, [r4, #2508]
	cmp	r3, #0
	addne	r5, r4, #2512
	movne	r6, #0
	addne	r5, r5, #12
	movne	r8, #1
	bne	.L3200
	b	.L3201
.L3208:
	strb	r8, [r3, #2]
	ldr	r1, [r5]
	bl	HEVC_OutputFrmToVO
	cmn	r0, #1
	mov	r9, r0
	beq	.L3207
.L3198:
	ldr	r3, [r4, #2508]
	cmp	r3, r6
	bls	.L3201
.L3200:
	ldr	r3, [r5, #4]!
	mov	r2, #0
	ldr	r0, [r4, #244]
	add	r6, r6, #1
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldr	r3, [r5]
	mov	r0, r4
	ldrb	r7, [r3, #2]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3208
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L3198
	ldr	r3, [r5]
	ldr	r0, [r4, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #2508]
	cmp	r3, r6
	bhi	.L3200
.L3201:
	mov	r3, #-2147483647
	mov	r0, r4
	str	r3, [r4, #212]
	mov	r9, #0
	bl	Hevc_InitDecBuffers
.L3194:
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3207:
	mov	r0, r7
	ldr	r2, .L3209
	ldr	r1, .L3209+4
	bl	dprint_vfmw
	mov	r0, r9
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3202:
	mvn	r9, #0
	b	.L3194
.L3210:
	.align	2
.L3209:
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
	str	r3, [r5, #1664]
	ldr	r6, [r0, #2332]
	cmp	r6, r3
	beq	.L3239
	ldrb	r3, [r1]	@ zero_extendqisi2
	str	r3, [r6, #40]
	ldr	r3, [r0, #2324]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3240
.L3218:
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3220
	ldr	r3, [r4, #2332]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bls	.L3221
	ldr	r0, [r3, #40]
	cmp	r0, #1
	beq	.L3220
.L3221:
	ldr	r0, [r1, #12]
	cmp	r0, #0
	ble	.L3222
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L3222
	ldr	ip, [r1, #8]
	cmp	ip, #0
	bne	.L3241
.L3222:
	mov	r2, #1
	str	r2, [r3, #40]
	ldr	r1, [r1, #16]
	ldr	r0, [r4, #244]
	bl	SM_ReleaseStreamSeg
.L3217:
	ldr	r3, [r4, #2332]
	ldr	r0, [r3, #40]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
.L3215:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3241:
	mov	lr, r2, asl #5
	mov	ip, #0
	sub	r2, lr, r2, asl #2
	add	r3, r3, r2
	str	r0, [r3, #44]
	ldr	r3, [r4, #2332]
	ldr	lr, [r1, #12]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #48]
	ldr	r3, [r4, #2332]
	ldr	lr, [r1, #8]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #52]
	ldr	r3, [r4, #2332]
	ldr	lr, [r1, #16]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	lr, [r3, #68]
	ldr	r3, [r4, #2332]
	ldr	r0, [r3, #8]
	mov	r2, r0, asl #5
	sub	r2, r2, r0, asl #2
	add	r3, r3, r2
	str	ip, [r3, #60]
	ldr	r2, [r4, #2332]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	ldr	r3, [r4, #2324]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3223
	add	r3, r4, #53248
	ldr	r0, [r1, #12]
	ldr	r2, [r3, #1292]
	ldr	ip, [r3, #1296]
	add	r0, r0, r2
	str	r0, [r3, #1292]
	ldr	r2, [r1, #12]
	add	r2, r2, ip
	str	r2, [r3, #1296]
.L3223:
	mov	r0, r4
	bl	HEVC_CombinePacket
	mov	r3, #1
	str	r3, [r5, #1664]
	b	.L3217
.L3240:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	bne	.L3217
	b	.L3218
.L3239:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	ble	.L3213
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L3213
	ldr	r3, [r1, #8]
	str	r1, [fp, #-32]
	cmp	r3, #0
	beq	.L3213
	bl	HEVC_FindNaluArraySlot
	ldr	r1, [fp, #-32]
	cmn	r0, #1
	mov	r5, r0
	beq	.L3242
	add	r3, r4, #65536
	mov	r0, #100
	mov	r2, #1
	ldr	r3, [r3, #2840]
	mla	r0, r0, r5, r3
	str	r0, [r4, #2332]
	ldr	r3, [r1, #4]
	str	r3, [r0, #44]
	ldr	r3, [r4, #2332]
	ldr	r0, [r1, #12]
	str	r0, [r3, #48]
	ldr	r3, [r4, #2332]
	ldr	r0, [r1, #16]
	str	r0, [r3, #68]
	ldr	r3, [r4, #2332]
	ldr	r0, [r1, #8]
	str	r0, [r3, #52]
	ldr	r3, [r4, #2332]
	str	r6, [r3, #60]
	ldr	r3, [r4, #2332]
	str	r2, [r3, #8]
	ldr	r3, [r4, #2332]
	strb	r6, [r3, #1]
	ldr	r3, [r4, #2332]
	ldrb	r2, [r1]	@ zero_extendqisi2
	str	r2, [r3, #40]
	ldr	r3, [r4, #2324]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3217
	add	r3, r4, #53248
	ldr	r0, [r1, #12]
	ldr	r2, [r3, #1292]
	ldr	ip, [r3, #1296]
	add	r0, r0, r2
	str	r0, [r3, #1292]
	ldr	r2, [r1, #12]
	add	r2, r2, ip
	str	r2, [r3, #1296]
	b	.L3217
.L3220:
	ldr	r1, .L3243
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3215
.L3213:
	ldr	r1, .L3243+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3215
.L3242:
	ldr	r1, .L3243+8
	mov	r0, r6
	bl	dprint_vfmw
	mov	r1, r6
	mov	r0, r4
	bl	HEVC_ClearAll
	mov	r0, r5
	b	.L3215
.L3244:
	.align	2
.L3243:
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
	beq	.L3248
	add	r3, r0, #53248
	ldrb	r3, [r3, #1241]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3248
	add	r2, r0, #68608
	add	r0, r0, #83968
	add	r2, r2, #576
	add	r0, r0, #256
.L3254:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L3249
	cmp	r2, #0
	beq	.L3250
	ldr	lr, [r4, #2508]
	cmp	lr, #0
	beq	.L3250
	ldr	r1, [r4, #2528]
	cmp	r1, r2
	beq	.L3249
	add	r1, r4, #2528
	b	.L3251
.L3252:
	ldr	ip, [r1, #4]!
	cmp	ip, r2
	beq	.L3249
.L3251:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L3252
.L3250:
	ldr	r0, [r4, #244]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L3248
	cmn	r0, #1
	beq	.L3273
.L3272:
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3248:
	mov	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3249:
	add	r2, r2, #752
	cmp	r2, r0
	bne	.L3254
	add	r0, r4, #62464
	sub	r2, fp, #24
	sub	r1, fp, #28
	add	r0, r0, #216
	bl	GetQueueImgNum
	mov	r0, r4
	bl	HEVC_PrintFrameStoreState
	ldr	r1, .L3274
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r2, [r4, #176]
	ldr	r0, [r4, #2508]
	ldr	r3, [fp, #-28]
	sub	r2, r2, #2
	ldr	r1, [fp, #-24]
	rsb	r2, r0, r2
	add	r0, r3, r1
	cmp	r0, r2
	bge	.L3272
	str	r1, [sp]
	mov	r0, #0
	ldr	r2, .L3274+4
	ldr	r1, .L3274+8
	bl	dprint_vfmw
	mov	r0, r4
	mov	r1, #1
	bl	HEVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3273:
	add	r1, r4, #62464
	ldr	r0, [r4, #244]
	add	r1, r1, #216
	bl	FSP_ClearNotInVoQueue
	b	.L3272
.L3275:
	.align	2
.L3274:
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
	ldr	r3, [r0, #2508]
	mov	r4, r0
	cmp	r3, #0
	beq	.L3278
	add	r6, r0, #2512
	mov	r5, #0
	add	r6, r6, #12
	mov	r7, r5
	b	.L3280
.L3279:
	ldr	r3, [r4, #2508]
	cmp	r3, r5
	bls	.L3278
.L3280:
	ldr	r3, [r6, #4]!
	add	r5, r5, #1
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3279
	strb	r7, [r3, #1]
	mov	r2, #0
	ldr	r1, [r3, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetRef
	ldr	r3, [r4, #2508]
	cmp	r3, r5
	bhi	.L3280
.L3278:
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L3282
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L3278
	b	.L3282
.L3284:
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	HEVC_OutputOneFrmFromDPB
	cmn	r0, #1
	beq	.L3283
.L3282:
	ldr	r3, [r4, #2508]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L3284
	mov	r0, r3
.L3283:
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
	beq	.L3293
	ldr	r2, .L3297
	mov	r0, #0
	ldr	r1, .L3297+4
	bl	dprint_vfmw
.L3293:
	mov	r0, r4
	mov	r1, #0
	bl	HEVC_InitDPB
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3298:
	.align	2
.L3297:
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
	b	.L3300
.L3302:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_IncreaseDPBSize
	cmp	r0, #0
	bne	.L3308
.L3300:
	ldr	ip, [r4, #2508]
	mov	r0, #13
	ldr	lr, [r4, #2504]
	ldr	r2, .L3309
	cmp	ip, lr
	ldr	r1, .L3309+4
	mov	r3, ip
	bcs	.L3302
	b	.L3304
.L3305:
	str	lr, [sp]
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_OutputUnRefPicWithMinPoc
	cmp	r0, #0
	bne	.L3303
	ldr	ip, [r4, #2508]
	ldr	lr, [r4, #2504]
.L3304:
	cmp	ip, lr
	mov	r3, ip
	ldr	r2, .L3309
	mov	r0, #1
	ldr	r1, .L3309+8
	bcs	.L3305
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3308:
	ldr	r2, .L3309
	mov	r0, #1
	ldr	r1, .L3309+12
	bl	dprint_vfmw
	ldr	ip, [r4, #2508]
	ldr	lr, [r4, #2504]
	b	.L3304
.L3303:
	ldr	r2, .L3309
	mov	r0, #1
	ldr	r1, .L3309+16
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_PrintDPBState
	mov	r0, r4
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	HEVC_ClearDPB
.L3310:
	.align	2
.L3309:
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
	bhi	.L3315
	ldr	r3, [r2, #60]
	add	r5, r0, r1, lsl #2
	mov	r1, #1
	mov	r2, r1
	str	r3, [r5, #2528]
	str	r1, [r3, #4]
	ldr	r3, [r5, #2528]
	ldr	r0, [r0, #244]
	ldr	r1, [r3, #32]
	bl	FSP_SetRef
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r0, [r5, #2528]
	mov	r2, #664
	adds	r3, r3, #0
	add	r1, r4, #64
	movne	r3, #1
	strb	r3, [r0, #1]
	ldr	r3, [r5, #2528]
	ldr	r0, [r4, #36]
	str	r0, [r3, #24]
	ldr	r0, [r5, #2528]
	add	r0, r0, #80
	bl	memcpy
	ldr	ip, [r5, #2528]
	ldr	lr, [r4, #40]
	add	r1, r7, #1
	ldr	r3, .L3317
	mov	r2, #4
	add	r0, r6, #2528
	str	lr, [ip, #40]
	str	lr, [ip, #20]
	ldr	ip, [r5, #2528]
	ldr	lr, [r4, #60]
	str	lr, [ip, #72]
	ldr	ip, [r5, #2528]
	ldr	lr, [r4, #12]
	str	lr, [ip, #44]
	str	lr, [ip, #16]
	ldr	ip, [r5, #2528]
	ldr	lr, [r4, #8]
	str	lr, [ip, #12]
	ldr	ip, [r5, #2528]
	ldr	lr, [r4, #8]
	str	lr, [ip, #36]
	bl	qsort
	ldr	r3, [r6, #2508]
	mov	r0, r6
	add	r3, r3, #1
	str	r3, [r6, #2508]
	ldr	r1, [r4, #60]
	bl	HEVC_GetAPC
	subs	r3, r0, #0
	bne	.L3316
	mov	r0, r3
	strb	r3, [r4, #1]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3315:
	mov	r3, r1
	ldr	r2, .L3317+4
	ldr	r1, .L3317+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3316:
	ldr	r2, .L3317+4
	mov	r0, #0
	ldr	r1, .L3317+12
	bl	dprint_vfmw
	mov	r0, r6
	bl	HEVC_PrintDPBState
	mov	r0, r6
	bl	HEVC_ClearDPB
	mvn	r0, #6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3318:
	.align	2
.L3317:
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
	ldrb	r3, [r4, #1240]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3332
	ldr	r3, [r4, #1300]
	mov	r2, #2
	str	r2, [r3, #4]
.L3321:
	ldr	r3, [r4, #1300]
	mov	r2, #1
	mov	r0, r5
	strb	r2, [r3, #2]
	ldr	r1, [r4, #1300]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r4, r0
	beq	.L3333
	cmn	r0, #3
	beq	.L3325
	mov	r0, r5
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3334
.L3325:
	mov	r0, #0
.L3322:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3332:
	bl	HEVC_SimpleSlideDPB
	add	r2, r5, #54272
	add	r2, r2, #216
	ldr	r1, [r5, #2508]
	mov	r0, r5
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	beq	.L3321
	str	r0, [sp]
	movw	r3, #8812
	ldr	r2, .L3335
	mov	r0, #0
	ldr	r1, .L3335+4
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L3322
.L3334:
	ldr	r2, .L3335
	mov	r0, #0
	ldr	r1, .L3335+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3322
.L3333:
	ldr	r2, .L3335
	mov	r0, #0
	ldr	r1, .L3335+12
	bl	dprint_vfmw
	mov	r0, r4
	b	.L3322
.L3336:
	.align	2
.L3335:
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
	ldr	r1, [r0, #2508]
	mov	r4, r0
	ldr	r3, [r0, #2504]
	cmp	r1, r3
	bcs	.L3349
.L3338:
	add	r2, r4, #54272
	mov	r0, r4
	add	r2, r2, #216
	bl	HEVC_InsertFrmInDPB
	subs	r6, r0, #0
	bne	.L3350
	add	r3, r4, #53248
	mov	r0, r4
	ldr	r1, [r3, #1300]
	bl	HEVC_CheckFrameStore
	cmn	r0, #1
	mov	r5, r0
	beq	.L3351
	cmn	r0, #3
	beq	.L3344
	mov	r0, r4
	bl	HEVC_OutputCurrPic
	cmp	r0, #0
	bne	.L3352
.L3344:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3349:
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3348
	ldr	r2, .L3353
	mov	r0, #0
	ldr	r1, .L3353+4
	bl	dprint_vfmw
.L3348:
	ldr	r1, [r4, #2508]
	b	.L3338
.L3350:
	ldr	r2, .L3353
	mov	r0, #0
	ldr	r1, .L3353+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3352:
	mov	r0, r6
	ldr	r2, .L3353
	ldr	r1, .L3353+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3351:
	mov	r0, r6
	ldr	r2, .L3353
	ldr	r1, .L3353+16
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3354:
	.align	2
.L3353:
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
	ldr	r3, [r3, #1592]
	cmp	r3, #1
	beq	.L3356
	bl	HEVC_FirstFrameFastOut
	cmp	r0, #0
	bne	.L3373
.L3356:
	ldr	r1, [r4, #2508]
	ldr	r3, [r4, #2504]
	cmp	r1, r3
	bcs	.L3374
.L3358:
	add	r2, r4, #54272
	mov	r0, r4
	add	r2, r2, #216
	bl	HEVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L3375
	ldr	r3, [r4, #2508]
	cmp	r3, #0
	bne	.L3361
.L3362:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3361:
	mov	r0, r4
	bl	HEVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3362
	ldr	r2, .L3376
	mov	r0, #1
	ldr	r1, .L3376+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3374:
	mov	r0, r4
	bl	HEVC_RemoveUnusedApcStore
	mov	r0, r4
	bl	HEVC_RemoveUnUsedFrameStore
	cmp	r0, #1
	beq	.L3372
	ldr	r1, .L3376+8
	mov	r0, #0
	bl	dprint_vfmw
.L3372:
	ldr	r1, [r4, #2508]
	b	.L3358
.L3375:
	mov	r2, r0
	ldr	r1, .L3376+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3373:
	ldr	r2, .L3376
	mov	r0, #0
	ldr	r1, .L3376+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3377:
	.align	2
.L3376:
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
	ldr	r3, .L3421
	mov	r4, r0
	ldr	r2, [r0, #244]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L3412
.L3379:
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #596]
	cmp	r3, #1
	beq	.L3413
	add	r5, r4, #53248
	mov	r3, #0
	str	r3, [r5, #1400]
	str	r3, [r5, #1404]
.L3382:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	ldrb	r6, [r5, #1241]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L3414
	ldr	r3, [r4, #2324]
	ldr	r2, [r5, #1280]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L3415
	ldr	r3, [r4, #2328]
	ldr	r2, [r5, #1300]
	add	r3, r3, #4096
	ldr	r3, [r3, #1232]
	str	r3, [r2, #744]
	ldr	r3, [r4, #2328]
	ldr	r2, [r5, #1300]
	add	r3, r3, #4096
	ldr	r3, [r3, #1236]
	str	r3, [r2, #748]
	ldr	r3, [r4, #248]
	cmp	r3, #2
	beq	.L3416
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	beq	.L3417
	cmp	r3, #1
	beq	.L3418
	cmp	r3, #0
	beq	.L3396
.L3397:
	mov	r0, r4
	mvn	r6, #0
	bl	HEVC_ClearCurrPic
	ldr	r2, .L3421+4
	ldr	r1, .L3421+8
	mov	r0, #1
	bl	dprint_vfmw
.L3395:
	mov	r3, #0
	mov	r0, r6
	strb	r3, [r5, #1241]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3413:
	ldr	r2, .L3421+12
	add	r5, r4, #53248
	ldr	r2, [r2]
	add	r2, r2, #4096
	ldr	r0, [r2, #84]
	ldr	r1, [r2, #88]
	str	r3, [r5, #1400]
	cmp	r1, #0
	moveq	r1, #1
	bl	__aeabi_uidiv
	str	r0, [r5, #1404]
	b	.L3382
.L3412:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L3379
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L3379
	add	r3, r0, #24576
	ldrb	r3, [r3, #3728]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3379
	bl	HEVC_Sei_Get_Frame_Pts
	b	.L3379
.L3414:
	ldr	r2, .L3421+4
	mov	r0, #1
	ldr	r1, .L3421+16
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3417:
	mov	r0, r4
	bl	HEVC_SimpleDPBProcess
	subs	r6, r0, #0
	bne	.L3419
.L3391:
	movw	r3, #9141
	mov	r2, r6
	ldr	r1, .L3421+20
	mov	r0, #14
	bl	dprint_vfmw
.L3389:
	cmn	r6, #1
	bne	.L3395
	b	.L3397
.L3415:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r3, [r4, #2324]
	ldr	r2, [r5, #1280]
	mov	r0, #1
	ldr	r1, .L3421+24
	ldr	r3, [r3, #4]
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3418:
	mov	r0, r4
	bl	HEVC_DecOrderProcess
	subs	r6, r0, #0
	beq	.L3393
	ldr	r2, .L3421+4
	mov	r0, #0
	ldr	r1, .L3421+28
	bl	dprint_vfmw
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3389
.L3396:
	mov	r0, r4
	bl	HEVC_DispOrderProcess
	subs	r6, r0, #0
	bne	.L3394
.L3398:
	mov	r6, #0
	b	.L3395
.L3416:
	mov	r0, r4
	bl	HEVC_DirectOutput
	ldr	r3, [r5, #1276]
	ldr	r2, [r4, #180]
	cmp	r3, r2
	addne	r3, r3, #528
	movne	r1, #0
	addne	r3, r4, r3, lsl #2
	strne	r1, [r3, #4]
	mov	r6, r0
	strne	r2, [r5, #1276]
	cmp	r0, #0
	bne	.L3420
.L3388:
	movw	r3, #9126
	mov	r2, r6
	ldr	r1, .L3421+20
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3389
.L3393:
	ldr	r3, [r4, #2324]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L3398
	b	.L3396
.L3394:
	ldr	r2, .L3421+4
	mov	r0, #0
	ldr	r1, .L3421+32
	bl	dprint_vfmw
	b	.L3389
.L3420:
	ldr	r2, .L3421+4
	mov	r0, #0
	ldr	r1, .L3421+36
	bl	dprint_vfmw
	b	.L3388
.L3419:
	ldr	r2, .L3421+4
	mov	r0, #0
	ldr	r1, .L3421+40
	bl	dprint_vfmw
	b	.L3391
.L3422:
	.align	2
.L3421:
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
	add	r4, r4, #576
	mov	r5, r0
	mov	r6, r1
	mov	r7, #0
.L3428:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bne	.L3424
	cmp	r4, #0
	beq	.L3425
	ldr	r3, [r5, #2508]
	cmp	r3, #0
	beq	.L3425
	ldr	r1, [r5, #2528]
	cmp	r4, r1
	beq	.L3424
	add	ip, r5, #2528
	b	.L3426
.L3427:
	ldr	lr, [ip, #4]!
	cmp	lr, r4
	beq	.L3424
.L3426:
	add	r2, r2, #1
	cmp	r2, r3
	bne	.L3427
.L3425:
	mov	r8, #752
	mov	r2, #664
	mla	r8, r8, r7, r5
	sub	r0, fp, #700
	mov	r9, #1
	mov	r3, #101
	str	r6, [fp, #-756]
	add	r8, r8, #68608
	str	r3, [fp, #-724]
	add	r1, r8, #656
	strb	r9, [fp, #-763]
	strb	r9, [fp, #-764]
	bl	memcpy
	cmp	r7, #19
	strb	r9, [r8, #578]
	mov	r7, #0
	strb	r9, [r8, #576]
	str	r4, [fp, #-704]
	str	r7, [r8, #584]
	str	r7, [fp, #-516]
	bgt	.L3429
	ldr	r0, [r5, #2508]
	cmp	r0, #0
	beq	.L3431
	add	r1, r5, #2512
	mov	ip, r7
	add	r1, r1, #12
	mvn	r2, #-2147483648
	mov	r8, r1
.L3434:
	ldr	lr, [r8, #4]!
	add	ip, ip, #1
	ldr	r3, [lr, #12]
	rsb	r3, r6, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bge	.L3433
	ldrb	lr, [lr, #1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	r2, r3
	movne	r7, #1
.L3433:
	cmp	ip, r0
	bne	.L3434
	cmp	r7, #0
	beq	.L3431
	mov	r4, #0
	b	.L3435
.L3436:
	add	r4, r4, #1
	cmp	r4, r0
	beq	.L3437
.L3435:
	ldr	ip, [r1, #4]!
	ldr	r3, [ip, #12]
	rsb	r3, r6, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, r2
	bne	.L3436
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3436
	ldr	r1, [ip, #32]
	add	r4, r4, #632
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	ldr	r2, [r5, r4, asl #2]
	mov	r3, r6
	ldr	r1, .L3468
	ldr	r2, [r2, #12]
	mov	r7, r0
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r7, #0
	beq	.L3437
	ldr	r0, [r7, #680]
	cmp	r0, #0
	beq	.L3466
	mov	r1, #0
	ldr	r0, [r5, #244]
	bl	FSP_NewLogicFs
	mov	r8, r0
	mov	r1, r0
	ldr	r0, [r5, #244]
	bl	FSP_GetLogicFs
	mvn	r2, r8
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3440
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
	ldr	r1, [r5, #2508]
	str	r3, [fp, #-728]
	bl	HEVC_InsertFrmInDPB
	subs	r4, r0, #0
	bne	.L3467
	ldr	r0, [r5, #244]
	mov	r1, r8
	mov	r2, r4
	bl	FSP_SetDisplay
	ldr	r3, [r5, #200]
	mov	r0, r4
	cmn	r3, #-2147483647
	streq	r6, [r5, #200]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3424:
	add	r7, r7, #1
	add	r4, r4, #752
	cmp	r7, #20
	bne	.L3428
.L3429:
	ldr	r1, .L3468+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L3461:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3437:
	ldr	r1, .L3468+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3440:
	ldr	r3, [fp, #-704]
	mov	r0, r2
	ldr	r1, .L3468+12
	strb	r2, [r3]
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L3461
.L3467:
	ldr	r3, [fp, #-704]
	mov	r1, r8
	mov	r4, #0
	mov	r2, #1
	strb	r4, [r3]
	ldr	r0, [r5, #244]
	bl	FSP_ClearLogicFs
	mov	r0, r4
	ldr	r1, .L3468+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3461
.L3431:
	mov	r0, #0
	ldr	r1, .L3468+20
	strb	r0, [r4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3461
.L3466:
	ldr	r1, .L3468+24
	bl	dprint_vfmw
	mov	r0, r5
	bl	HEVC_ClearDPB
	mvn	r0, #3
	b	.L3461
.L3469:
	.align	2
.L3468:
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
	b	.L3471
.L3474:
	ldr	r2, [fp, #-24]
	bl	dprint_vfmw
	ldr	r3, [r4, #2324]
	mov	r0, r4
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L3472
	ldr	r1, [fp, #-24]
	bl	HEVC_CreateLostPicture
	cmp	r0, #0
	bne	.L3477
.L3471:
	sub	r1, fp, #24
	mov	r0, r4
	bl	HEVC_CheckThatAllRefPicsAreAvailable
	ldr	r1, .L3478
	cmp	r0, #0
	mov	r0, #1
	beq	.L3474
	mov	r0, r4
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	mov	r0, r4
	bl	HEVC_RecoverDPBProcess
	mov	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3472:
	ldr	ip, [fp, #-24]
	add	r4, r4, #53248
	ldr	r1, .L3478+4
	mov	r0, #1
	ldr	r3, [r4, #2016]
	str	ip, [sp]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3477:
	mov	r0, r4
	bl	HEVC_RemoveDummyFrame
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L3479:
	.align	2
.L3478:
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
	ldr	r3, [r0, #2332]
	add	r5, r0, #53248
	ldr	r2, .L3538
	mov	ip, #0
	mov	r4, r0
	ldr	r1, [r3, #16]
	str	r1, [r5, #2040]
	ldr	r1, [r3, #32]
	str	r1, [r5, #2036]
	ldr	r1, [r0, #244]
	strb	ip, [r0, #1]
	ldr	r2, [r2, r1, asl #2]
	ldrsb	r1, [r2, #44]
	cmp	r1, #1
	beq	.L3527
.L3481:
	ldr	r3, [r5, #3556]
	cmp	r3, #1
	beq	.L3528
.L3482:
	ldr	r2, [r4, #208]
	ldr	r3, [r4, #144]
	cmp	r2, r3
	bcs	.L3529
	ldrb	r3, [r5, #1241]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3530
	mov	r0, r4
	bl	HEVC_PicTypeStatistic
	mov	r0, r4
	bl	HEVC_CalcStreamBits
	ldr	r3, [r5, #3556]
	cmp	r3, #2
	beq	.L3495
	ldrb	r3, [r5, #1971]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3531
.L3496:
	mov	r0, r4
	bl	HEVC_WriteSliceMsg
	cmp	r0, #0
	bne	.L3532
.L3499:
	ldr	r2, [r5, #2044]
	add	r3, r4, #4096
	mov	r1, #1
	mov	r0, #0
	str	r2, [r4, #288]
	ldr	r2, [r5, #2016]
	str	r1, [r4, #168]
	str	r2, [r4, #252]
	ldr	r2, [r3, #444]
	str	r2, [r5, #1284]
	ldr	r3, [r3, #448]
	str	r3, [r5, #1288]
.L3485:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3531:
	mov	r0, r4
	bl	HEVC_DecList
	cmp	r0, #0
	bne	.L3533
	mov	r0, r4
	bl	HEVC_IsRefListWrong
	cmp	r0, #0
	beq	.L3496
	mov	r0, r4
	bl	HEVC_PrintDPBState
	ldr	r1, .L3538+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3528:
	ldr	r3, [r5, #2040]
	sub	r3, r3, #16
	cmp	r3, #4
	bls	.L3483
	mov	r0, r4
	bl	HEVC_IsPVRFlushPic
	cmp	r0, #0
	beq	.L3484
.L3483:
	mov	r0, r4
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L3534
.L3484:
	ldrb	r6, [r4, #2]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3535
.L3486:
	ldr	r3, [r4, #2324]
	ldr	r2, [r3, #8]
	cmp	r2, #2
	beq	.L3488
	ldr	r3, [r3, #12]
	mov	r0, r4
	cmp	r3, #2
	beq	.L3536
	bl	HEVC_RefPicProcess
	cmp	r0, #0
	bne	.L3501
.L3488:
	mov	r0, r4
	bl	HEVC_InitPic
	cmn	r0, #2
	beq	.L3485
	cmp	r0, #0
	bne	.L3537
	ldr	r3, [r4, #220]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r4, #220]
	bl	HEVC_SetScalingList
	mov	r0, r4
	bl	HEVC_WritePicMsg
	cmp	r0, #0
	beq	.L3482
	ldr	r1, .L3538+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3527:
	ldr	r1, [r2, #176]
	cmp	r1, ip
	bne	.L3481
	ldr	r2, [r2, #180]
	cmp	r2, #1
	bne	.L3481
	ldr	r1, [r3, #16]
	bl	HEVC_Get_Last_IDR_Frame_Info
	b	.L3481
.L3495:
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3499
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
	b	.L3499
.L3535:
	ldr	r3, [r4, #2508]
	cmp	r3, #0
	beq	.L3486
	mov	r0, r4
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L3486
	mov	r0, r6
	ldr	r2, .L3538+12
	ldr	r1, .L3538+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3536:
	bl	HEVC_UpdateReflist
	mov	r0, r4
	bl	HEVC_UpdateLTReflist
	b	.L3488
.L3530:
	ldr	r1, .L3538+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3529:
	ldr	r1, .L3538+24
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #208]
	ldr	r2, [r4, #144]
	cmp	r3, r2
	bcc	.L3493
	ldr	r1, .L3538+28
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L3493
	str	r3, [fp, #-36]
	mov	r1, #108
	str	r2, [fp, #-32]
	mov	r3, #8
	sub	r2, fp, #36
	ldr	r0, [r4, #244]
	blx	ip
.L3493:
	ldr	r1, .L3538+32
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3485
.L3533:
	mov	r2, r0
	ldr	r1, .L3538+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3532:
	ldr	r1, .L3538+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3537:
	ldr	r1, .L3538+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3501:
	mvn	r0, #0
	b	.L3485
.L3534:
	ldr	r2, .L3538+12
	mov	r0, #1
	ldr	r1, .L3538+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3485
.L3539:
	.align	2
.L3538:
	.word	s_pstVfmwChan
	.word	.LC479
	.word	.LC474
	.word	.LANCHOR1+864
	.word	.LC472
	.word	.LC477
	.word	.LC475
	.word	g_event_report
	.word	.LC476
	.word	.LC478
	.word	.LC480
	.word	.LC473
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
	ldr	r2, [fp, #4]
	add	ip, r0, #53248
	mov	r4, r0
	mov	r5, r3
	cmp	r2, #0
	str	r1, [ip, #1280]
	ldr	r2, [fp, #8]
	beq	.L3541
	mov	ip, r2, asl #6
	ldr	r3, .L3551
	sub	r2, ip, r2, asl #3
	add	r2, r2, r3
	ldr	r2, [r2, #4]
	cmp	r2, #3
	beq	.L3549
	cmp	r2, #1
	beq	.L3541
.L3544:
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_StorePicInDPB
	subs	r2, r0, #0
	bne	.L3550
	mov	r3, #1
	mov	r0, r2
	str	r3, [r4, #168]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3550:
	ldr	r1, .L3551+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3541:
	mov	r0, r4
	bl	HEVC_ClearAllSlice
	b	.L3544
.L3549:
	bl	HEVC_ClearAllSlice
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3552:
	.align	2
.L3551:
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
	bhi	.L3554
	bl	HEVC_ClearCurrPic
	ldr	r3, .L3622
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3555
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
.L3555:
	ldr	r3, [r4, #224]
	cmp	r3, #524288
	bhi	.L3616
	ldr	r1, .L3622+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
.L3612:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3554:
	ldr	r3, [r0, #280]
	add	r5, r0, #53248
	ldr	r2, [r0, #284]
	add	r3, r3, #1
	ldr	r1, [r0, #2324]
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r0, #280]
	rsb	r3, r2, r3
	str	r3, [r1, #576]
	bl	HEVC_IsRefForCurrPic
	strb	r0, [r5, #1240]
	ldr	r6, [r4, #232]
	ldr	r2, [r4, #248]
	ubfx	r6, r6, #16, #3
	cmp	r6, r2
	beq	.L3558
	sub	r1, r2, #2
	cmp	r1, #1
	movhi	r1, #0
	movls	r1, #1
	cmp	r6, #2
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3558
	cmp	r6, #4
	cmpne	r6, #1
	bls	.L3617
.L3558:
	cmp	r6, #2
	str	r6, [r4, #248]
	beq	.L3560
	cmp	r6, #3
	beq	.L3561
	cmp	r6, #1
	beq	.L3618
	ldr	r3, [r4, #216]
	cmp	r3, #0
	beq	.L3582
	cmp	r6, #4
	beq	.L3619
.L3567:
	ldr	r2, [r5, #1252]
.L3568:
	cmp	r2, #2
	beq	.L3620
	cmp	r2, #1
	streqb	r2, [r4, #4]
.L3573:
	ldr	r2, [r4, #220]
	mov	r0, #2
	ldr	r1, .L3622+8
	sub	r2, r2, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #208]
	cmp	r3, #0
	beq	.L3621
	ldr	r0, [r5, #1268]
	add	r2, r4, #61440
	add	ip, r4, #65536
	clz	r1, r0
	mov	r1, r1, lsr #5
	str	r1, [r2, #2928]
	ldr	r1, [r5, #1272]
	str	r1, [r2, #2920]
	str	r3, [ip, #112]
	ldr	r3, [r4, #2324]
	ldr	r1, [r3, #592]
	str	r1, [r2, #2912]
	ldr	r3, [r3, #632]
	str	r3, [r2, #2916]
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L3578
	add	r3, r4, #62976
	add	r0, r0, #1
	add	r3, r3, #60
	str	r3, [r4, #2328]
	ldr	r3, [r5, #1284]
	str	r3, [ip, #2828]
	ldr	r3, [r5, #1288]
	str	r3, [ip, #2832]
	ldr	r1, [r5, #1252]
	str	r0, [r5, #1268]
	cmp	r1, #0
	bne	.L3578
	ldr	r2, [ip, #116]
	cmp	r2, #0
	beq	.L3583
.L3581:
	ldr	r3, [r2]
	ldr	r0, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3581
.L3580:
	ldr	r3, .L3622
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3578
	sub	r2, fp, #28
	ldr	r0, [r4, #244]
	mov	r3, #4
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	ip
.L3578:
	ldr	ip, [r5, #1296]
	mov	r0, #0
	ldr	r1, [r5, #1300]
	ldr	r3, [r5, #1292]
	str	ip, [r5, #1292]
	ldr	r2, [r1, #440]
	rsb	r3, ip, r3
	add	r2, r2, r3
	str	r2, [r1, #440]
	ldr	r2, [r5, #1664]
	add	r3, r3, r2
	str	r3, [r5, #1664]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3616:
	ldr	r1, .L3622+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #7
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3618:
	ldr	r3, [r5, #1252]
	cmp	r0, #0
	cmpeq	r3, #2
	beq	.L3564
.L3563:
	ldr	r3, [r4, #216]
	cmp	r3, #0
	bne	.L3567
.L3582:
	ldr	r3, .L3622
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3564
	mov	r3, #0
	mov	r1, #127
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
	b	.L3564
.L3617:
	mov	r3, r6
	ldr	r1, .L3622+16
	mov	r0, #1
	bl	dprint_vfmw
	str	r6, [r4, #248]
.L3561:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mov	r0, r4
	bl	HEVC_ClearDPB
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3560:
	ldr	r3, [r5, #1252]
	cmp	r3, #0
	beq	.L3563
	b	.L3564
.L3620:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3573
	ldr	r3, [r4, #2324]
	ldr	r6, [r3, #12]
	cmp	r6, #0
	bne	.L3573
	ldr	r3, .L3622+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3573
	mov	r3, r0
	ldr	r2, [r5, #1248]
	ldr	r1, .L3622+24
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3622
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3564
	mov	r3, r6
	mov	r2, r6
	mov	r1, #127
	ldr	r0, [r4, #244]
	blx	ip
.L3564:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	b	.L3612
.L3619:
	ldr	r2, [r5, #1252]
	cmp	r2, #0
	moveq	r3, #2
	streqb	r3, [r4, #4]
	beq	.L3573
	b	.L3568
.L3621:
	ldr	r2, .L3622
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L3576
	mov	r2, r3
	mov	r1, #127
	ldr	r0, [r4, #244]
	blx	ip
.L3576:
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	ldr	r2, .L3622+28
	ldr	r1, .L3622+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3612
.L3583:
	mov	r1, r2
	b	.L3580
.L3623:
	.align	2
.L3622:
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
	ldr	r0, [r0, #2308]
	mov	r1, #16
	mov	r9, r2
	str	r3, [fp, #-56]
	mov	r7, #0
	str	r7, [fp, #-48]
	bl	BsGet
	mov	r1, #8
	add	r6, r4, #53248
	mov	r10, r0
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #24
	and	r8, r0, #31
	ldr	r0, [r4, #2308]
	bl	BsBack
	ldr	r2, [r6, #1568]
	cmp	r5, r7
	str	r7, [r6, #1556]
	str	r2, [fp, #-48]
	beq	.L3626
	cmp	r5, #1
	beq	.L3627
	mov	r2, r5
	ldr	r1, .L3781
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #1
.L3634:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3627:
	cmp	r9, #0
	bne	.L3647
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
	bne	.L3773
	movw	r1, #32257
	cmp	r10, r1
	beq	.L3774
	cmp	r10, r2
	bne	.L3775
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3646
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2332]
	mov	r0, r8
	b	.L3634
.L3626:
	cmp	r9, #0
	bne	.L3628
	movw	r1, #31745
	cmp	r8, #25
	cmpeq	r10, r1
	moveq	r5, #1
	movne	r5, #0
	bne	.L3629
	ldr	r8, .L3781+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3630
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r4, #244]
	blx	ip
.L3630:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2332]
	subs	r5, r0, #0
	bne	.L3776
	ldr	r3, [r1, #48]
	sub	r2, r3, #2
	sub	r3, r3, #6
	cmp	r2, #1024
	str	r3, [r6, #1556]
	bls	.L3635
	ldr	r1, .L3781+8
	movw	r3, #775
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3636
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2332]
.L3636:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3762
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3762:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3628:
	bic	r3, r10, #512
	movw	r2, #31745
	cmp	r3, r2
	beq	.L3777
.L3669:
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3647:
	movw	r1, #31745
	cmp	r8, #25
	cmpeq	r10, r1
	moveq	r8, #1
	movne	r8, #0
	bne	.L3655
	ldr	r8, .L3781+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3656
	mov	r3, r7
	mov	r2, r7
	mov	r1, #112
	ldr	r0, [r4, #244]
	blx	ip
.L3656:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2332]
	subs	r5, r0, #0
	bne	.L3770
	ldr	r3, [r1, #48]
	sub	r2, r3, #2
	sub	r3, r3, #6
	cmp	r2, #1024
	str	r3, [r6, #1556]
	bls	.L3659
	ldr	r1, .L3781+8
	mov	r3, #940
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3660
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2332]
.L3660:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3762
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L3634
.L3773:
	ldr	r8, .L3781+4
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3649
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r4, #244]
	blx	ip
.L3649:
	mov	r0, r4
	bl	HEVC_DecVDM
	ldr	r1, [r4, #2332]
	subs	r5, r0, #0
	beq	.L3765
.L3770:
	cmp	r1, #0
	beq	.L3660
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
	b	.L3660
.L3629:
	movw	r2, #32257
	cmp	r10, r2
	bne	.L3669
.L3644:
	ldr	r1, [r4, #2332]
.L3765:
	cmp	r1, #0
	beq	.L3646
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2332]
	mov	r0, r5
	b	.L3634
.L3655:
	movw	r2, #32257
	cmp	r10, r2
	movne	r0, r5
	bne	.L3634
	ldr	r1, .L3781+12
	movw	r3, #1007
	ldr	r2, .L3781+16
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3762
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r8, [r4, #2332]
	mvn	r0, #0
	b	.L3634
.L3777:
	ldr	r1, .L3781+20
	movw	r3, #862
	ldr	r2, .L3781+16
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3762
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2332]
	mvn	r0, #0
	b	.L3634
.L3646:
	mov	r0, #0
	b	.L3634
.L3776:
	cmp	r1, #0
	beq	.L3636
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
	b	.L3636
.L3775:
	mov	r1, #8
	ldr	r0, [r4, #2308]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	ldr	r0, [r4, #2308]
	ubfx	r5, r5, #1, #6
	bl	BsSkip
	cmp	r5, #49
	beq	.L3778
.L3654:
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3646
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2332]
	b	.L3634
.L3659:
	ldr	r0, [r1, #76]
	sub	r2, fp, #48
	ldr	r3, [r1, #48]
	ldr	r1, [r6, #1560]
	add	r3, r3, r0
	ldr	r0, [r4, #244]
	sub	r3, r3, #2
	bl	MetadataMapToSec
	subs	r7, r0, #0
	bne	.L3779
	ldr	r5, .L3781+24
	mov	r2, #4
	ldr	r1, .L3781+28
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2332]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #44]
	add	r0, r0, #4
	ldr	r2, [r6, #1556]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #1556]
	add	r3, r0, #4
	str	r3, [r6, #1556]
	ldr	r1, [r4, #2332]
	ldr	r2, [r1, #76]
	cmp	r2, #0
	beq	.L3662
	add	ip, r3, r2
	cmp	ip, #1024
	bls	.L3663
	add	r2, r0, #8
	ldr	r1, .L3781+8
	movw	r3, #965
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3664
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r7, [r4, #2332]
.L3664:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3665
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
.L3665:
	ldr	r0, [r4, #244]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movne	r3, #972
	beq	.L3762
.L3761:
	ldr	r2, .L3781+16
	mov	r0, #0
	ldr	r1, .L3781+32
	bl	dprint_vfmw
	b	.L3762
.L3635:
	ldr	r0, [r1, #76]
	sub	r2, fp, #48
	ldr	r3, [r1, #48]
	ldr	r1, [r6, #1560]
	add	r3, r3, r0
	ldr	r0, [r4, #244]
	sub	r3, r3, #2
	bl	MetadataMapToSec
	subs	r7, r0, #0
	bne	.L3780
	ldr	r5, .L3781+24
	mov	r2, #4
	ldr	r1, .L3781+28
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r2, [r4, #2332]
	ldr	r0, [fp, #-48]
	ldr	r3, [r5, #52]
	ldr	r1, [r2, #44]
	add	r0, r0, #4
	ldr	r2, [r6, #1556]
	add	r1, r1, #6
	blx	r3
	ldr	r0, [r6, #1556]
	add	r3, r0, #4
	str	r3, [r6, #1556]
	ldr	r1, [r4, #2332]
	ldr	r2, [r1, #76]
	cmp	r2, #0
	beq	.L3639
	add	ip, r3, r2
	cmp	ip, #1024
	bls	.L3640
	add	r2, r0, #8
	ldr	r1, .L3781+8
	mov	r3, #800
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3641
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r7, [r4, #2332]
.L3641:
	ldr	ip, [r8]
	cmp	ip, #0
	beq	.L3642
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
.L3642:
	ldr	r0, [r4, #244]
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	cmp	r0, #0
	movwne	r3, #807
	beq	.L3762
	b	.L3761
.L3640:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #72]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2332]
	ldr	r2, [r6, #1556]
	ldr	r3, [r3, #76]
	add	r3, r3, r2
	str	r3, [r6, #1556]
.L3639:
	ldr	r0, [r4, #244]
	ldr	r7, .L3781+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L3643
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #244]
	ldr	r1, [r6, #1556]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #244]
.L3643:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	beq	.L3644
	movw	r3, #835
	b	.L3761
.L3663:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #72]
	add	r0, r0, r3
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r4, #2332]
	ldr	r2, [r6, #1556]
	ldr	r3, [r3, #76]
	add	r3, r3, r2
	str	r3, [r6, #1556]
.L3662:
	ldr	r0, [r4, #244]
	ldr	r7, .L3781+36
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L3666
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r4, #244]
	ldr	r1, [r6, #1556]
	ldr	r3, [r5, #44]
	ldr	r2, [r7, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r4, #244]
.L3666:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r5, r0, #0
	movwne	r3, #995
	beq	.L3644
	b	.L3761
.L3774:
	ldr	r0, [r4, #2308]
	mov	r1, #16
	bl	BsSkip
	mov	r0, r5
	b	.L3634
.L3778:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	bne	.L3654
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsBack
	mov	r1, #32
	ldr	r0, [r4, #2308]
	bl	BsBack
	ldr	r0, [r4, #2308]
	mov	r1, #32
	bl	BsBack
	mov	r0, #2
	b	.L3634
.L3779:
	mov	r0, r5
	ldr	r2, .L3781+16
	ldr	r1, .L3781+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3634
.L3780:
	mov	r0, r5
	movw	r3, #787
	ldr	r2, .L3781+16
	ldr	r1, .L3781+44
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3634
.L3782:
	.align	2
.L3781:
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
	ldr	r0, [r0, #2332]
	ldr	r3, [r0, #8]
	cmp	r3, #0
	ldrne	r1, [r4, #224]
	movne	r2, r0
	movne	r3, #0
	beq	.L3788
.L3787:
	ldr	ip, [r2, #48]
	add	r3, r3, #1
	add	r2, r2, #28
	add	r1, r1, ip
	str	r1, [r4, #224]
	ldr	ip, [r0, #8]
	cmp	ip, r3
	bhi	.L3787
.L3788:
	mov	r3, #0
	strb	r3, [r0, #1]
	ldr	r3, [r4, #2332]
	ldr	r2, [r3, #16]
	sub	r2, r2, #36
	cmp	r2, #1
	bls	.L3930
.L3786:
	ldr	r2, [r3, #4]
	add	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r1, [r4, #2332]
	ldr	r2, [r1, #16]
	cmp	r2, #49
	ldrls	pc, [pc, r2, asl #2]
	b	.L3789
.L3791:
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3790
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3792
	.word	.L3793
	.word	.L3794
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3795
	.word	.L3795
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3789
	.word	.L3796
	.word	.L3797
.L3930:
	mov	r2, #1
	strb	r2, [r4, #1]
	b	.L3786
.L3797:
	mov	r0, r4
	bl	HEVC_IsEosNal
	cmp	r0, #1
	beq	.L3931
.L3813:
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3917
.L3919:
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2332]
.L3916:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3790:
	mov	r0, r4
	bl	HEVC_DecSlice
	cmn	r0, #2
	beq	.L3916
	cmp	r0, #0
	beq	.L3917
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3928
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3928:
	ldr	r3, .L3933
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3918
.L3920:
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3918:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3792:
	mov	r0, r4
	bl	HEVC_DecVPS
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3798
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3798:
	cmp	r5, #0
	bne	.L3932
.L3917:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3793:
	mov	r0, r4
	bl	HEVC_DecSPS
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3803
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3803:
	cmp	r5, #0
	beq	.L3917
	ldr	r6, .L3933
	mov	r0, #1
	ldr	r1, .L3933+4
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L3924
	b	.L3918
.L3794:
	mov	r0, r4
	bl	HEVC_DecPPS
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3805
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3805:
	cmp	r5, #0
	beq	.L3917
	ldr	r6, .L3933
	mov	r0, #1
	ldr	r1, .L3933+8
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3918
.L3924:
	sub	r2, fp, #28
	mvn	r5, #0
	mov	r3, #4
	mov	r1, #100
	str	r5, [r2, #-4]!
	ldr	r0, [r4, #244]
	blx	ip
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3918
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3795:
	mov	r0, r4
	bl	HEVC_DecSEI
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	mov	r5, r0
	beq	.L3806
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3806:
	cmp	r5, #0
	beq	.L3917
	ldr	r1, .L3933+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3928
.L3796:
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3811
	cmp	r1, #0
	beq	.L3810
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3810:
	add	r3, r4, #53248
	ldrb	r3, [r3, #1241]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3917
.L3811:
	add	r5, r4, #2464
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
	bne	.L3917
	ldr	r6, .L3933
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3812
	mov	r3, r7
	mov	r2, r7
	mov	r1, #112
	ldr	r0, [r4, #244]
	blx	ip
.L3812:
	add	r3, r4, #53248
	ldrb	r3, [r3, #1241]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3917
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3917
.L3816:
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L3920
	b	.L3918
.L3789:
	ldr	r1, .L3933+16
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	ldr	r3, [r1, #16]
	cmp	r3, #63
	bhi	.L3817
	cmp	r1, #0
	bne	.L3919
	b	.L3917
.L3817:
	ldr	r6, .L3933
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3818
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3819
.L3820:
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3819:
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3917
	mov	r3, #0
	ldr	r0, [r4, #244]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	b	.L3917
.L3818:
	cmp	r1, #0
	bne	.L3820
	b	.L3917
.L3932:
	ldr	r6, .L3933
	mov	r0, #1
	ldr	r1, .L3933+20
	bl	dprint_vfmw
	ldr	ip, [r6]
	cmp	ip, #0
	bne	.L3924
	b	.L3918
.L3931:
	ldr	r6, .L3933
	strb	r0, [r4, #7]
	ldr	ip, [r6]
	cmp	ip, #0
	beq	.L3814
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
.L3814:
	add	r3, r4, #53248
	ldrb	r5, [r3, #1241]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L3815
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3917
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	str	r5, [r4, #2332]
	mov	r0, r5
	b	.L3916
.L3815:
	mov	r0, r4
	bl	HEVC_DecVDM
	cmp	r0, #0
	beq	.L3813
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3816
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
	b	.L3816
.L3934:
	.align	2
.L3933:
	.word	g_event_report
	.word	.LC496
	.word	.LC497
	.word	.LC498
	.word	.LC499
	.word	.LC495
	UNWIND(.fnend)
	.size	HEVC_DecOneNal, .-HEVC_DecOneNal
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
	ldr	r0, [r0, #244]
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
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #12)
	sub	sp, sp, #12
	ldr	ip, .L3951
	mov	r4, r0
	mov	r3, #0
	mov	r6, r1
	add	r0, r0, #55040
	str	r3, [r2]
	mov	r1, r3
	str	r3, [r6]
	mov	r5, r2
	ldr	r3, [ip, #48]
	movw	r2, #3732
	add	r0, r0, #176
	add	r7, r4, #53248
	blx	r3
	ldr	r3, [r4, #2332]
	mov	r0, r4
	ldr	r2, [r3, #16]
	str	r2, [r7, #2040]
	ldr	r3, [r3, #32]
	str	r3, [r7, #2036]
	bl	HEVC_DecSliceSegmentHeader
	cmp	r0, #0
	bne	.L3948
	ldr	r0, [r7, #2044]
	movw	ip, #2024
	ldr	r2, [r4, #2320]
	movw	r8, #26164
	ldr	r3, [r7, #3556]
	add	lr, r4, #24576
	ldr	r1, [r4, #2316]
	mla	r2, ip, r0, r2
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	ldr	r2, [r2, #32]
	str	r3, [r6]
	ldr	ip, [lr, #3740]
	mla	r6, r8, r2, r1
	ldr	r7, [r4, #2324]
	ldr	r1, [ip, #236]
	ldr	r3, [ip, #72]
	ldr	r8, [ip, #76]
	ldr	r2, [r7, #832]
	ldr	ip, [r6, #236]
	ldr	r0, [r6, #72]
	subs	r1, ip, r1
	movne	r1, #1
	cmp	r2, #1
	ldr	r2, [r6, #76]
	beq	.L3949
.L3940:
	cmp	r0, r3
	moveq	r3, r1
	orrne	r3, r1, #1
	cmp	r2, r8
	moveq	r0, r3
	orrne	r0, r3, #1
	cmp	r0, #0
	movne	r0, #0
	movne	r3, #1
	strne	r3, [r5]
.L3938:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3948:
	ldr	r1, .L3951+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3951+8
	ldr	ip, [r3]
	cmp	ip, #0
	mvneq	r0, #0
	beq	.L3938
	sub	r2, fp, #36
	ldr	r0, [r4, #244]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	ip
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3949:
	ldr	ip, [r6, #108]
	ldr	r6, [r6, #100]
	cmp	ip, r6
	movcc	ip, r6
	str	ip, [r7, #884]
	ldr	lr, [lr, #3740]
	ldr	r6, [r4, #2324]
	ldr	ip, [lr, #108]
	ldr	lr, [lr, #100]
	ldr	r4, [r6, #884]
	cmp	ip, lr
	movcc	ip, lr
	cmp	ip, #8
	movls	lr, #0
	movhi	lr, #1
	cmp	r4, #8
	movne	lr, #0
	cmp	lr, #0
	beq	.L3950
.L3941:
	mov	ip, #1
	str	ip, [r6, #888]
	str	ip, [r5]
	b	.L3940
.L3950:
	sub	ip, ip, #8
	cmp	r4, #8
	clz	ip, ip
	mov	ip, ip, lsr #5
	movle	ip, #0
	cmp	ip, #0
	beq	.L3940
	b	.L3941
.L3952:
	.align	2
.L3951:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC500
	.word	g_event_report
	UNWIND(.fnend)
	.size	HEVC_InquireSliceProperty, .-HEVC_InquireSliceProperty
	.align	2
	.global	HEVCDEC_DecodePacket
	.type	HEVCDEC_DecodePacket, %function
HEVCDEC_DecodePacket:
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
	UNWIND(.pad #52)
	sub	sp, sp, #52
	cmp	r1, #0
	mov	ip, #0
	mov	r4, r0
	str	ip, [fp, #-64]
	str	ip, [fp, #-60]
	str	ip, [fp, #-56]
	beq	.L4027
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4028
	ldr	r2, [r0, #2324]
	ldrb	lr, [r0, #5]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	lr, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r0, #232]
	ldr	r3, [r2]
	str	r3, [r0, #236]
	ldr	r3, [r2, #4]
	str	r3, [r0, #240]
	beq	.L3957
	ldr	r3, [r2, #832]
	cmp	r3, #1
	addne	r6, r0, #86016
	beq	.L4029
.L3958:
	mov	r0, r4
	bl	HEVC_ReceivePacket
	ldr	r3, [r4, #2332]
	str	r3, [r6, #1668]
	mov	r5, r0
.L3959:
	cmp	r5, #0
	mov	r3, #0
	strb	r3, [r4, #5]
	beq	.L4030
.L3988:
	mov	r0, r3
.L4024:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4029:
	ldr	r3, [r2, #872]
	add	r6, r0, #86016
	cmp	r3, #1
	bne	.L3958
	ldr	r3, [r6, #1664]
	cmp	r3, #1
	bne	.L3958
	ldr	r3, [r6, #1668]
	mov	r0, ip
	str	r3, [r4, #2332]
	str	ip, [r6, #1664]
	strb	ip, [r4, #5]
	b	.L4024
.L4030:
	ldr	r3, [r4, #2332]
	ldr	r9, .L4038
	str	r5, [r3, #4]
	ldr	r3, [r4, #2332]
	ldr	r0, [r4, #2308]
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2308]
	bl	BsSkip
	ldr	r3, [r4, #244]
	ldr	r3, [r9, r3, asl #2]
	ldrsb	r8, [r3, #44]
	cmp	r8, #1
	movne	r6, #2
	movne	r7, r6
	beq	.L4031
.L3960:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	ldr	r8, [r4, #2332]
	bl	BsGet
	mov	r1, #6
	str	r0, [r8, #24]
	ldr	r0, [r4, #2308]
	ldr	r8, [r4, #2332]
	bl	BsGet
	mov	r1, #6
	str	r0, [r8, #16]
	ldr	r0, [r4, #2308]
	ldr	r8, [r4, #2332]
	bl	BsGet
	mov	r1, #3
	str	r0, [r8, #28]
	ldr	r0, [r4, #2308]
	ldr	r8, [r4, #2332]
	bl	BsGet
	str	r0, [r8, #32]
	ldr	r8, [r4, #2332]
	ldr	r3, [r8, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r8, #32]
	ldrne	r8, [r4, #2332]
	ldr	r0, [r8, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	mov	r10, r0
	beq	.L4032
.L3962:
	mov	r3, #0
	str	r3, [r8, #4]
	ldr	r3, [r4, #2332]
	add	r0, r4, #2464
	add	r0, r0, #8
	ldr	r1, [r3, #44]
	ldr	r2, [r3, #48]
	bl	BsInit
	mov	r1, #24
	ldr	r0, [r4, #2308]
	bl	BsSkip
	cmp	r6, #0
	cmpeq	r7, #1
	moveq	r6, #1
	movne	r6, #0
	cmp	r5, #1
	moveq	r5, #0
	andne	r5, r6, #1
	cmp	r5, #0
	beq	.L3978
	mov	r1, #16
	ldr	r0, [r4, #2308]
	bl	BsSkip
.L3978:
	mov	r1, #1
	ldr	r0, [r4, #2308]
	ldr	r5, [r4, #2332]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #24]
	ldr	r0, [r4, #2308]
	ldr	r5, [r4, #2332]
	bl	BsGet
	mov	r1, #6
	str	r0, [r5, #16]
	ldr	r0, [r4, #2308]
	ldr	r5, [r4, #2332]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #28]
	ldr	r0, [r4, #2308]
	ldr	r5, [r4, #2332]
	bl	BsGet
	sub	r0, r0, #1
	str	r0, [r5, #32]
.L3977:
	mov	r0, r4
	bl	HEVC_DecOneNal
	cmn	r0, #2
	mov	r3, r0
	beq	.L3988
	cmp	r0, #0
	addeq	r4, r4, #53248
	streq	r3, [r4, #1296]
	beq	.L4024
	ldr	r1, .L4038+4
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4024
.L3957:
	ldr	r3, [r0, #2332]
	cmp	r3, #0
	movne	r5, #0
	mvneq	r5, #0
	cmp	r3, #0
	bne	.L3959
	mov	r0, ip
	ldr	r1, .L4038+8
	bl	dprint_vfmw
	mov	r0, r5
	b	.L4024
.L4031:
	ldr	r7, [r3, #172]
	mov	r0, r4
	ldr	r6, [r3, #176]
	ldr	r3, [r3, #180]
	mov	r1, r7
	mov	r2, r6
	bl	HEVC_VES_Splitter
	cmp	r0, #2
	beq	.L3982
	cmp	r0, #1
	bne	.L4024
	b	.L3960
.L4032:
	sub	r2, fp, #48
	sub	r1, fp, #52
	mov	r0, r4
	bl	HEVC_InquireSliceProperty
	subs	r3, r0, #0
	bne	.L3963
	ldr	r8, [fp, #-52]
	cmp	r8, #1
	beq	.L4033
.L3964:
	ldr	r8, [fp, #-48]
	cmp	r8, #1
	beq	.L4034
.L3974:
	ldr	r8, [r4, #2332]
	ldr	r0, [r8, #16]
	bl	HEVC_IsSliceUnit
	cmp	r0, #1
	beq	.L3977
	b	.L3962
.L4028:
	mov	r0, ip
	ldr	r1, .L4038+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4024
.L3982:
	mov	r5, r8
	b	.L3960
.L3963:
	ldr	r1, .L4038+16
	mov	r0, r10
	bl	dprint_vfmw
	ldr	r1, [r4, #2332]
	cmp	r1, #0
	beq	.L3975
	ldr	r0, [r4, #244]
	bl	HEVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #2332]
.L3975:
	ldr	r3, .L4038+20
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3976
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
.L3976:
	ldr	r3, [r4, #244]
	ldr	r3, [r9, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	bne	.L3987
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L3987
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L3987
	add	r3, r4, #24576
	ldrb	r5, [r3, #3728]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L4035
.L3987:
	mvn	r0, #0
	b	.L4024
.L4033:
	ldr	r2, [r4, #208]
	cmp	r2, #0
	bne	.L3965
	add	r3, r4, #53248
	ldrb	r3, [r3, #1241]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3964
	ldr	r2, .L4038+24
	ldr	r1, .L4038+28
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	b	.L3964
.L4034:
	ldrb	r9, [r4, #2]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r9, #1
	beq	.L4036
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L4037
.L3970:
	ldr	r0, [r4, #244]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L3974
	sub	r3, fp, #56
	ldr	r0, [r4, #244]
	sub	r2, fp, #60
	sub	r1, fp, #64
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #2324]
	ldr	r0, [r3, #708]
	cmp	r0, #1
	bne	.L3974
	ldr	r10, [fp, #-56]
	cmp	r10, #0
	bgt	.L3972
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L3972
	ldr	r9, [r4, #2328]
	cmp	r9, #0
	bne	.L3972
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	str	r3, [fp, #-72]
	beq	.L3974
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L3974
	add	r3, r4, #24576
	str	r3, [fp, #-76]
	add	r8, r4, #86016
	ldr	r3, [r3, #3740]
	ldr	r1, [r8, #1688]
	ldr	lr, [r3, #76]
	cmp	lr, r1
	beq	.L3974
	ldr	ip, [r3, #72]
	ldr	r3, [r8, #1692]
	subs	r2, ip, r3
	movne	r2, #1
	cmp	r10, #0
	movne	r2, #0
	cmp	r2, #0
	beq	.L3974
	stmib	sp, {ip, lr}
	ldr	r2, [fp, #-72]
	str	r1, [sp]
	ldr	r1, .L4038+32
	bl	dprint_vfmw
	ldr	r3, [fp, #-76]
	str	r9, [r8, #1684]
	ldr	r1, .L4038+20
	ldr	r3, [r3, #3740]
	ldr	ip, [r1]
	ldr	r2, [r3, #76]
	cmp	ip, #0
	str	r2, [r8, #1688]
	ldr	r3, [r3, #72]
	str	r3, [r8, #1692]
	beq	.L3974
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #244]
	blx	ip
	b	.L3974
.L3965:
	ldr	ip, [r4, #2332]
	add	r0, r4, #2464
	mov	r2, #13
	add	r0, r0, #8
	ldr	r1, .L4038+36
	str	r3, [ip, #4]
	bl	BsInit
	mov	r1, #40
	ldr	r0, [r4, #2308]
	bl	BsSkip
	ldr	r3, [r4, #2332]
	mov	r2, #48
	mov	r0, r4
	str	r2, [r3, #16]
	strb	r8, [r4, #6]
	bl	HEVC_DecOneNal
	ldr	r3, [r4, #272]
	mvn	r0, #1
	strb	r8, [r4, #5]
	add	r3, r3, #1
	str	r3, [r4, #272]
	b	.L4024
.L4027:
	mov	r0, r1
	ldr	r1, .L4038+40
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4024
.L4035:
	ldr	r3, .L4038+44
	add	r0, r4, #28160
	mov	r2, #80
	add	r0, r0, #72
	mov	r1, r5
	mov	r6, #0
	ldr	r3, [r3, #48]
	mov	r7, #0
	blx	r3
	add	r3, r4, #4544
	add	r2, r3, #2096
	add	r4, r4, #4096
	add	r3, r3, #2080
	mvn	r0, #0
	strd	r6, [r2]
	strd	r6, [r3, #-8]
	strd	r6, [r3]
	strd	r6, [r2, #-8]
	str	r5, [r4, #428]
	str	r5, [r4, #432]
	str	r5, [r4, #420]
	str	r5, [r4, #424]
	b	.L4024
.L4036:
	bl	HEVC_EmptyFrmFromDPB
	cmp	r0, #0
	beq	.L3970
	mov	r0, r9
	ldr	r2, .L4038+48
	ldr	r1, .L4038+52
	bl	dprint_vfmw
	b	.L3970
.L4037:
	mov	r0, r8
	ldr	r2, .L4038+48
	ldr	r1, .L4038+56
	bl	dprint_vfmw
	b	.L3970
.L3972:
	add	r2, r4, #86016
	mov	r1, #0
	mov	r3, #1
	mvn	r0, #1
	str	r1, [r2, #1684]
	strb	r3, [r4, #5]
	b	.L4024
.L4039:
	.align	2
.L4038:
	.word	s_pstVfmwChan
	.word	.LC507
	.word	.LC503
	.word	.LC502
	.word	.LC506
	.word	g_event_report
	.word	.LANCHOR1+912
	.word	.LC504
	.word	.LC505
	.word	.LANCHOR1+956
	.word	.LC501
	.word	vfmw_Osal_Func_Ptr_S
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
	bne	.L4042
	add	r3, r4, #53248
	ldrb	r3, [r3, #1241]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4044
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4042:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4044:
	ldr	r2, .L4045
	ldr	r1, .L4045+4
	bl	dprint_vfmw
	mov	r0, r4
	bl	HEVC_ClearCurrPic
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L4046:
	.align	2
.L4045:
	.word	.LANCHOR1+912
	.word	.LC504
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
	ldr	r2, [r0, #116]
	cmp	r2, #0
	beq	.L4050
	mov	r0, #0
.L4049:
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #1356]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L4049
	ldmfd	sp, {fp, sp, pc}
.L4050:
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
	ldr	r3, [r0, #2508]
	mov	r4, r0
	cmp	r3, #0
	addne	r8, r0, #62464
	addne	r8, r8, #216
	mvnne	r6, #0
	movne	r7, #1
	bne	.L4063
	b	.L4064
.L4055:
	mov	r0, r4
	bl	HEVC_RemoveApcStore
	ldr	r1, [fp, #-52]
	mov	r0, r4
	bl	HEVC_RemoveFrameStoreOutDPB
	ldr	r2, [r4, #2508]
	cmp	r2, #0
	beq	.L4072
.L4063:
	sub	r1, fp, #48
	sub	r2, fp, #52
	mov	r0, r4
	bl	HEVC_GetMinPOC
	ldr	r1, [fp, #-52]
	add	r3, r1, #632
	ldr	r5, [r4, r3, asl #2]
	cmp	r5, #0
	beq	.L4055
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4055
	mov	r1, r5
	mov	r0, r4
	strb	r7, [r5, #2]
	bl	HEVC_GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	HEVC_CheckFrameStore
	subs	r6, r0, #0
	beq	.L4073
.L4062:
	ldr	r1, [fp, #-52]
	b	.L4055
.L4072:
	cmp	r6, #0
	bne	.L4064
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4073:
	mov	r2, #1
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L4074
	ldr	r3, [r4, #2508]
	mov	r2, r4
	mov	r1, #16
	cmp	r3, #1
	streq	r3, [r9, #212]
	mov	r3, r8
	ldr	r0, [r4, #244]
	str	r9, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	mov	r10, r0
	beq	.L4059
	mov	r3, r0
	ldr	r2, .L4076
	ldr	r1, .L4076+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r5, #32]
	ldr	r0, [r4, #244]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r1, #1
	mov	r0, r4
	mvn	r10, #0
	bl	HEVC_ClearAll
.L4059:
	ldr	r3, [r4, #2324]
	ldr	r2, [r3, #604]
	add	r2, r2, #2032
	add	r2, r2, #15
	cmp	r2, #4096
	movcc	r3, #0
	strcc	r3, [r9, #24]
	bcs	.L4075
.L4061:
	ldr	r1, [r4, #2508]
	ldr	r3, [r4, #284]
	ldr	r2, [r4, #276]
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #284]
	add	r2, r2, #1
	str	r2, [r4, #276]
	beq	.L4062
	mov	r6, r10
	ldr	r1, [fp, #-52]
	b	.L4055
.L4064:
	add	r0, r4, #62464
	add	r0, r0, #216
	bl	GetVoLastImageID
	mov	r6, r0
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4075:
	mov	r1, r9
	mov	r0, r4
	bl	HEVC_SetFrmRepeatCount.part.4
	b	.L4061
.L4074:
	ldr	r1, .L4076+8
	mvn	r6, #0
	ldr	r2, .L4076
	bl	dprint_vfmw
	ldr	r1, [fp, #-52]
	b	.L4055
.L4077:
	.align	2
.L4076:
	.word	.LANCHOR1+972
	.word	.LC509
	.word	.LC508
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
	ldr	r2, [r0, #3740]
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
	ldr	r2, [r0, #3740]
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
	.type	SarTable.14484, %object
	.size	SarTable.14484, 136
SarTable.14484:
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
	.type	__func__.14660, %object
	.size	__func__.14660, 18
__func__.14660:
	.ascii	"HEVC_CalcTileInfo\000"
	.space	2
	.type	__func__.15151, %object
	.size	__func__.15151, 27
__func__.15151:
	.ascii	"HEVC_GetUnRefPicWithMinPoc\000"
	.space	1
	.type	__func__.15160, %object
	.size	__func__.15160, 21
__func__.15160:
	.ascii	"HEVC_IncreaseDPBSize\000"
	.space	3
	.type	__func__.15391, %object
	.size	__func__.15391, 17
__func__.15391:
	.ascii	"HEVC_WritePicMsg\000"
	.space	3
	.type	__func__.15420, %object
	.size	__func__.15420, 16
__func__.15420:
	.ascii	"HEVC_CheckListX\000"
	.type	__func__.15545, %object
	.size	__func__.15545, 16
__func__.15545:
	.ascii	"HEVC_RepairList\000"
	.type	__func__.15915, %object
	.size	__func__.15915, 21
__func__.15915:
	.ascii	"HEVC_CheckFrameStore\000"
	.space	3
	.type	__func__.15761, %object
	.size	__func__.15761, 19
__func__.15761:
	.ascii	"HEVC_OutputCurrPic\000"
	.space	1
	.type	__func__.15766, %object
	.size	__func__.15766, 23
__func__.15766:
	.ascii	"HEVC_FirstFrameFastOut\000"
	.space	1
	.type	__func__.15983, %object
	.size	__func__.15983, 19
__func__.15983:
	.ascii	"HEVC_GetSLHDR1Info\000"
	.space	1
	.type	__func__.16109, %object
	.size	__func__.16109, 14
__func__.16109:
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
	.type	__func__.16390, %object
	.size	__func__.16390, 16
__func__.16390:
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
	.type	__func__.15242, %object
	.size	__func__.15242, 27
__func__.15242:
	.ascii	"HEVC_DecSliceSegmentHeader\000"
	.space	1
	.type	__func__.15624, %object
	.size	__func__.15624, 13
__func__.15624:
	.ascii	"HEVC_InitDPB\000"
	.space	3
	.type	__func__.16442, %object
	.size	__func__.16442, 13
__func__.16442:
	.ascii	"HEVCDEC_Init\000"
	.space	3
	.type	__func__.15907, %object
	.size	__func__.15907, 19
__func__.15907:
	.ascii	"HEVC_OutputFrmToVO\000"
	.space	1
	.type	__func__.15874, %object
	.size	__func__.15874, 22
__func__.15874:
	.ascii	"HEVC_OutputFrmFromDPB\000"
	.space	2
	.type	__func__.15166, %object
	.size	__func__.15166, 30
__func__.15166:
	.ascii	"HEVC_OutputUnRefPicWithMinPoc\000"
	.space	2
	.type	__func__.15887, %object
	.size	__func__.15887, 27
__func__.15887:
	.ascii	"HEVC_FlushOutputFrmFromDPB\000"
	.space	1
	.type	__func__.16430, %object
	.size	__func__.16430, 23
__func__.16430:
	.ascii	"HEVCDEC_GetImageBuffer\000"
	.space	1
	.type	__func__.16481, %object
	.size	__func__.16481, 14
__func__.16481:
	.ascii	"HEVC_ClearDPB\000"
	.space	2
	.type	__func__.15171, %object
	.size	__func__.15171, 23
__func__.15171:
	.ascii	"HEVC_RecoverDPBProcess\000"
	.space	1
	.type	__func__.15854, %object
	.size	__func__.15854, 20
__func__.15854:
	.ascii	"HEVC_InsertFrmInDPB\000"
	.type	__func__.15771, %object
	.size	__func__.15771, 22
__func__.15771:
	.ascii	"HEVC_SimpleDPBProcess\000"
	.space	2
	.type	__func__.15776, %object
	.size	__func__.15776, 21
__func__.15776:
	.ascii	"HEVC_DecOrderProcess\000"
	.space	3
	.type	__func__.15781, %object
	.size	__func__.15781, 22
__func__.15781:
	.ascii	"HEVC_DispOrderProcess\000"
	.space	2
	.type	__func__.15797, %object
	.size	__func__.15797, 19
__func__.15797:
	.ascii	"HEVC_StorePicInDPB\000"
	.space	1
	.type	__func__.15198, %object
	.size	__func__.15198, 14
__func__.15198:
	.ascii	"HEVC_DecSlice\000"
	.space	2
	.type	__func__.15498, %object
	.size	__func__.15498, 12
__func__.15498:
	.ascii	"HEVC_DecVDM\000"
	.type	__func__.14589, %object
	.size	__func__.14589, 18
__func__.14589:
	.ascii	"HEVC_VES_Splitter\000"
	.space	2
	.type	__func__.16543, %object
	.size	__func__.16543, 20
__func__.16543:
	.ascii	"HEVC_HaveSliceToDec\000"
	.type	__func__.14607, %object
	.size	__func__.14607, 21
__func__.14607:
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
	.type	__func__.16560, %object
	.size	__func__.16560, 21
__func__.16560:
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
	ASCII(.ascii	"HEVC_DecSliceSegmentHeader dec err\012\000" )
.LC501:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pPacket!\012\000" )
	.space	1
.LC502:
	ASCII(.ascii	"HevcCtx not init!\012\000" )
	.space	1
.LC503:
	ASCII(.ascii	"HEVCDEC_DecodePacket NULL == pHevcCtx->pCurrNal!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC504:
	ASCII(.ascii	"%s last frame fs unrelease, fix it!\012\000" )
	.space	3
.LC505:
	ASCII(.ascii	"IsSizeChanged = %d,old w/h = %d/%d,new w/h = %d/%d\012" )
	ASCII(.ascii	"\000" )
.LC506:
	ASCII(.ascii	"HEVC_InquireSliceProperty error.\012\000" )
	.space	2
.LC507:
	ASCII(.ascii	"HEVC_DecOneNal ERR\012\000" )
.LC508:
	ASCII(.ascii	"%s pstLogicFsImage is NULL!\012\000" )
	.space	3
.LC509:
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
