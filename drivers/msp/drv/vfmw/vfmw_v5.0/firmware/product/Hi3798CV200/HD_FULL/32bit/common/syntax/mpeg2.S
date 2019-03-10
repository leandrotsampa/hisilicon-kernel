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
	.file	"mpeg2.c"
	.text
	.align	2
	.type	MP2_SearchStartCode.part.0, %function
MP2_SearchStartCode.part.0:
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
	add	r3, r0, #2
	add	ip, r0, r1
.L12:
	cmp	ip, r3
	bls	.L2
.L15:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bls	.L14
.L8:
	add	r3, r3, #3
	cmp	ip, r3
	bhi	.L15
.L2:
	sub	r0, r1, #3
	ldmfd	sp, {fp, sp, pc}
.L14:
	cmp	r2, #0
	bne	.L5
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #1
	beq	.L12
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #2
	addne	r3, r3, #4
	b	.L12
.L5:
	cmp	r2, #1
	bne	.L12
	ldrb	r2, [r3, #-2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L8
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L8
	rsb	r3, r0, r3
	sub	r0, r3, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SearchStartCode.part.0, .-MP2_SearchStartCode.part.0
	.align	2
	.global	MP2_VerifyMemPara
	.type	MP2_VerifyMemPara, %function
MP2_VerifyMemPara:
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
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_VerifyMemPara, .-MP2_VerifyMemPara
	.align	2
	.global	MP2_ArrangeVHBMem
	.type	MP2_ArrangeVHBMem, %function
MP2_ArrangeVHBMem:
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
	add	r6, r0, #90112
	mov	r5, r0
	ldr	r3, [r6, #152]
	ldr	r2, [r3, #48]
	ldr	r3, [r3, #52]
	cmp	r2, #31
	bls	.L19
	sub	r0, r3, #32
	movw	r1, #8160
	cmp	r2, #8192
	cmpls	r0, r1
	bhi	.L19
	ldr	r0, [r5]
	ldr	r1, [r0, #28]
	cmp	r1, #25
	beq	.L44
	mov	r7, r2
	mov	r8, r3
	mov	r10, #5
	mov	r4, #2
	mov	r9, #3
.L28:
	ldr	r3, .L47
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #76
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5]
	str	r8, [fp, #-48]
	mov	r2, #0
	str	r7, [fp, #-68]
	ldr	r1, [r3, #28]
	str	r8, [fp, #-64]
	cmp	r1, #24
	str	r7, [fp, #-52]
	strb	r2, [fp, #-75]
	beq	.L33
	uxtb	r1, r4
	strb	r9, [fp, #-73]
	strb	r10, [fp, #-71]
.L39:
	ldr	r2, [r3, #668]
	mov	r4, #0
	ldr	r3, [r3, #672]
	mul	r0, r8, r7
	strb	r1, [fp, #-70]
	mul	ip, r3, r2
	strb	r4, [fp, #-74]
	cmp	r0, ip
	ble	.L34
	stmia	sp, {r7, r8}
	mov	r0, r4
	ldr	r1, .L47+4
	bl	dprint_vfmw
	ldr	r3, .L47+8
	ldr	ip, [r3]
	cmp	ip, r4
	mvneq	r0, #0
	beq	.L43
	ldr	r0, [r6, #512]
	mov	r3, r4
	mov	r2, r4
	mov	r1, #102
	blx	ip
	mvn	r0, #0
	b	.L43
.L19:
	ldr	r1, .L47+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
.L43:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L34:
	sub	r1, fp, #76
	ldr	r0, [r6, #512]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L35
	ldr	r1, [r5]
	sub	r3, fp, #80
	ldr	r0, [r6, #512]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L45
	cmp	r0, #0
	moveq	r0, #1
	beq	.L43
.L37:
	ldr	r1, .L47+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L43
.L44:
	ldr	r1, [r0, #708]
	cmp	r1, #0
	beq	.L46
	ldr	r1, [r0, #668]
	ldr	ip, [r0, #672]
	cmp	r2, r1
	bhi	.L30
	cmp	r3, ip
	bhi	.L30
	ldr	r1, [r0, #696]
	mov	r7, r2
	ldr	r2, [r0, #692]
	mov	r8, r3
	cmp	r1, #0
	add	r9, r2, #2
	beq	.L41
	add	r1, r2, #1
	cmp	r1, #17
	movlt	r4, r1
	movge	r4, #17
.L32:
	ldrb	r10, [r0, #716]	@ zero_extendqisi2
	b	.L28
.L35:
	ldr	r1, .L47+20
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L43
.L46:
	ldr	r7, [r0, #668]
	ldr	r8, [r0, #672]
	cmp	r2, r7
	bhi	.L25
	cmp	r3, r8
	bhi	.L25
	ldr	r2, [r0, #696]
	ldr	r3, [r0, #692]
	cmp	r2, #0
	add	r9, r3, #2
	beq	.L41
	add	r1, r3, #1
	cmp	r1, #17
	movlt	r4, r1
	movge	r4, #17
	b	.L32
.L33:
	mov	r1, #1
	strb	r10, [fp, #-71]
	strb	r1, [fp, #-73]
	b	.L39
.L30:
	stmia	sp, {r1, ip}
	mov	r0, #0
	ldr	r1, .L47+24
	bl	dprint_vfmw
	mov	r0, #0
	b	.L43
.L41:
	mov	r4, #1
	b	.L32
.L25:
	stmia	sp, {r7, r8}
	mov	r0, #0
	ldr	r1, .L47+24
	bl	dprint_vfmw
	mov	r0, #0
	b	.L43
.L45:
	add	r0, r6, #160
	bl	ResetVoQueue
	b	.L37
.L48:
	.align	2
.L47:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	g_event_report
	.word	.LC1
	.word	.LC4
	.word	.LC5
	.word	.LC2
	UNWIND(.fnend)
	.size	MP2_ArrangeVHBMem, .-MP2_ArrangeVHBMem
	.align	2
	.global	MP2_DecodingDecide
	.type	MP2_DecodingDecide, %function
MP2_DecodingDecide:
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
	add	r4, r0, #86016
	add	r6, r0, #90112
	mov	r5, r0
	ldr	r3, [r4, #2924]
	ldr	r8, [r6, #152]
	tst	r3, #8388608
	mvneq	r7, #0
	bne	.L126
.L50:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L126:
	ldrb	r2, [r8, #9]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L51
	ldr	r2, [r4, #2936]
	cmp	r2, #1
	beq	.L51
	ands	r7, r3, #255
	beq	.L53
.L129:
	ldr	r2, .L145
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L54
	mov	r3, #0
	ldr	r0, [r6, #512]
	mov	r2, r3
	mov	r1, #103
	blx	ip
	ldr	r3, [r4, #2924]
.L54:
	ldr	r2, [r4, #2932]
	mov	r0, #22
	ldr	r1, .L145+4
	mov	r7, #0
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L53:
	ldr	r3, [r4, #2972]
	cmp	r3, #0
	beq	.L127
	ldr	r3, [r4, #2912]
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r5]
	ldr	r2, [r3, #8]
	bls	.L128
.L57:
	sub	r3, r2, #1
	str	r2, [r4, #2912]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L122
.L64:
	.word	.L63
	.word	.L65
	.word	.L66
	.word	.L67
.L51:
	ldr	r2, [r6, #516]
	ands	r7, r3, #255
	add	r2, r2, #1
	str	r2, [r6, #516]
	beq	.L53
	b	.L129
.L67:
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L130
	cmp	r3, #3
	beq	.L131
.L73:
	cmp	r3, #2
	beq	.L77
.L122:
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	mov	r2, #1
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	str	r2, [fp, #-56]
.L68:
	ldr	r2, [r4, #2932]
	add	r0, r5, #89088
	ldr	ip, [r4, #2872]
	add	r0, r0, #96
	ldr	r9, [r4, #2976]
	str	r3, [fp, #-52]
	add	r9, r9, ip
	str	r2, [fp, #-48]
	bl	BsPos
	ldr	r3, [fp, #-52]
	str	r10, [sp]
	ldr	r2, [fp, #-48]
	ldr	r1, .L145+8
	add	r9, r9, r0, lsr #3
	mov	r0, #18
	str	r9, [sp, #4]
	bl	dprint_vfmw
	ldr	r3, [r4, #2924]
	bic	r3, r3, #14155776
	str	r3, [r4, #2924]
	ldr	r3, [r5]
	ldr	r0, [r3, #612]
	ldr	r3, [r4, #2964]
	cmp	r0, #1
	beq	.L132
	cmp	r3, #0
	bne	.L81
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	sub	r1, r2, #2
	cmp	r1, #1
	bls	.L133
.L82:
	cmp	r2, #3
	beq	.L134
.L79:
	ldr	r1, [r4, #3000]
	ldr	r0, [r6, #512]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r4, #3004]
	mov	r9, r0
	ldr	r0, [r6, #512]
	bl	FSP_GetFsImagePtr
	clz	r3, r9
	mov	r3, r3, lsr #5
	clz	r1, r0
	mov	r1, r1, lsr #5
	orrs	r2, r1, r3
	bne	.L135
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L136
	cmp	r2, #3
	beq	.L137
.L87:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	movne	r7, #1
	bne	.L50
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L93
	ldr	r3, [r4, #2936]
	cmp	r3, #0
	bne	.L50
.L93:
	ldrb	r3, [r8, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L138
	ldrb	r3, [r8, #18]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L139
	ldr	r3, [r4, #3088]
	add	r3, r3, #1
	str	r3, [r4, #3088]
	mov	r3, r3, asl #1
	str	r3, [r4, #3084]
.L95:
	ldr	r2, [r4, #3080]
	ldr	r3, [r4, #2932]
	add	r2, r2, #1
	str	r2, [r4, #3080]
	add	r3, r3, #1
	str	r3, [r4, #2932]
	b	.L50
.L63:
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L140
.L124:
	mov	r2, #1
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	str	r2, [fp, #-56]
	b	.L68
.L66:
	mov	r2, #0
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	str	r2, [fp, #-56]
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	b	.L68
.L65:
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	sub	r2, r3, #2
	cmp	r2, #1
	bhi	.L124
	cmp	r3, #2
	beq	.L141
.L71:
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	cmp	r10, #3
	beq	.L142
.L74:
	ldr	r3, [r4, #2936]
	mov	r2, #0
	str	r2, [fp, #-56]
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r4, #2936]
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	b	.L68
.L81:
	cmp	r3, #1
	bhi	.L79
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	b	.L82
.L132:
	cmp	r3, #0
	bne	.L79
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L143
	cmp	r2, #2
	bne	.L79
	ldr	r1, .L145+12
	bl	dprint_vfmw
	b	.L79
.L128:
	cmp	r2, #4
	cmpne	r2, #1
	bhi	.L57
	ldr	r1, .L145+16
	mov	r0, #2
	bl	dprint_vfmw
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L121
	ldr	r3, [r4, #2924]
	ldr	r1, [r4, #3004]
	orr	r3, r3, #128
	str	r3, [r4, #2924]
	ldr	r0, [r6, #512]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L60
	add	r10, r9, #624
	ldr	r0, [r6, #512]
	ldr	r1, [r9, #600]
	add	r3, r9, #608
	str	r3, [fp, #-48]
	bl	FreeUsdByDec
	ldr	r1, [r9, #608]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	ldr	r1, [r10, #-8]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	ldr	r1, [r9, #624]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-48]
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r3, #-8]
	strd	r0, [r3]
	strd	r0, [r10, #-8]
	strd	r0, [r10]
	ldr	r1, [r4, #3004]
	ldr	r0, [r6, #512]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #3000]
	ldr	r0, [r6, #512]
	bl	FSP_ClearLogicFs
	str	r7, [r4, #3000]
	str	r7, [r4, #3004]
	ldr	r0, [r6, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L144
.L60:
	mov	r3, #0
	str	r3, [r4, #2964]
.L121:
	ldr	r3, [r5]
	ldr	r2, [r3, #8]
	b	.L57
.L127:
	ldr	r2, [r4, #2932]
	mov	r0, #1
	ldr	r1, .L145+20
	bl	dprint_vfmw
	b	.L50
.L136:
	cmp	r3, #0
	bne	.L85
	ldr	r3, [r5]
	ldr	r2, [r9, #184]
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L87
	ldr	r1, .L145+24
	mov	r0, #1
	bl	dprint_vfmw
	b	.L50
.L135:
	movw	r3, #885
	ldr	r2, .L145+28
	ldr	r1, .L145+32
	mov	r0, #1
	bl	dprint_vfmw
	b	.L50
.L137:
	cmp	r3, #0
	ldr	r3, [r5]
	ldr	r2, [r9, #184]
	ldr	r3, [r3]
	bne	.L89
	cmp	r2, r3
	bhi	.L89
	cmp	r1, #0
	ldr	r2, [r0, #184]
	bne	.L92
	cmp	r3, r2
	bcs	.L87
.L92:
	ldr	r1, .L145+36
	mov	r0, #1
	bl	dprint_vfmw
	b	.L50
.L138:
	ldrb	r2, [r8, #16]	@ zero_extendqisi2
	ldrb	r3, [r8, #10]	@ zero_extendqisi2
	ldr	r1, [r4, #3088]
	add	r3, r2, r3
	add	r3, r3, #1
	add	r3, r3, r1
	str	r3, [r4, #3088]
	mov	r3, r3, asl #1
	str	r3, [r4, #3084]
	b	.L95
.L89:
	ldr	r1, .L145+40
	mov	r0, #1
	bl	dprint_vfmw
	b	.L50
.L131:
	ldr	r2, [r6, #524]
	cmp	r2, #0
	bne	.L124
.L76:
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	cmp	r10, #3
	bne	.L74
	mov	r2, #0
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	str	r2, [fp, #-56]
	b	.L68
.L130:
	mov	r3, #0
	str	r3, [r6, #524]
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L73
	b	.L76
.L140:
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L74
	mov	r2, #0
	mov	r10, r3
	str	r2, [fp, #-56]
	b	.L68
.L139:
	ldr	r2, [r4, #3088]
	ldr	r3, [r4, #3084]
	add	r2, r2, #1
	str	r2, [r4, #3088]
	ldrb	r2, [r8, #16]	@ zero_extendqisi2
	add	r2, r2, #2
	add	r3, r3, r2
	str	r3, [r4, #3084]
	b	.L95
.L77:
	mov	r10, #1
	str	r10, [r6, #524]
	str	r10, [fp, #-56]
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	ldrb	r10, [r8, #9]	@ zero_extendqisi2
	b	.L68
.L133:
	ldr	r1, .L145+44
	mov	r0, #1
	str	r3, [fp, #-56]
	bl	dprint_vfmw
	b	.L79
.L134:
	ldr	r1, .L145+48
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L79
.L85:
	movw	r3, #895
	ldr	r2, .L145+28
	ldr	r1, .L145+52
	mov	r0, #1
	bl	dprint_vfmw
	b	.L50
.L143:
	ldr	r1, .L145+56
	str	r3, [fp, #-56]
	bl	dprint_vfmw
	b	.L79
.L141:
	add	r2, r5, #45056
	ldrb	r1, [r2, #305]	@ zero_extendqisi2
	cmp	r1, #3
	beq	.L71
	ldrb	r10, [r2, #304]	@ zero_extendqisi2
	cmp	r10, #1
	streq	r10, [fp, #-56]
	ldreqb	r10, [r8, #9]	@ zero_extendqisi2
	bne	.L71
	b	.L68
.L142:
	mov	r2, #0
	str	r2, [fp, #-56]
	b	.L68
.L144:
	ldr	r0, [r6, #512]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #3000]
	str	r0, [r4, #3004]
	b	.L60
.L146:
	.align	2
.L145:
	.word	g_event_report
	.word	.LC6
	.word	.LC9
	.word	.LC11
	.word	.LC8
	.word	.LC7
	.word	.LC16
	.word	.LANCHOR0
	.word	.LC14
	.word	.LC18
	.word	.LC17
	.word	.LC12
	.word	.LC13
	.word	.LC15
	.word	.LC10
	UNWIND(.fnend)
	.size	MP2_DecodingDecide, .-MP2_DecodingDecide
	.align	2
	.global	MP2_EstimatePicQp
	.type	MP2_EstimatePicQp, %function
MP2_EstimatePicQp:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r2, #128
	mov	r4, r0
	ldr	r1, .L153
	sub	r0, fp, #148
	bl	memcpy
	add	r3, r4, #86016
	ldr	r0, [r4, #320]
	ldr	r3, [r3, #2960]
	cmp	r3, #1
	beq	.L148
	add	r4, r4, #90112
	ldr	r3, [r4, #152]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	cmp	r3, #0
	subne	r3, fp, #20
	moveq	r0, r0, asl #1
	addne	r0, r3, r0, lsl #2
	ldrne	r0, [r0, #-128]
.L148:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L154:
	.align	2
.L153:
	.word	.LANCHOR0+20
	UNWIND(.fnend)
	.size	MP2_EstimatePicQp, .-MP2_EstimatePicQp
	.align	2
	.global	MP2_GetSequenceInfo
	.type	MP2_GetSequenceInfo, %function
MP2_GetSequenceInfo:
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
	add	r4, r0, #86016
	add	r5, r0, #90112
	mov	r3, #0
	ldr	r2, [r4, #2960]
	mov	r7, r0
	ldr	r6, [r5, #152]
	cmp	r2, #1
	ldr	r8, [r5, #156]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	beq	.L157
	cmp	r2, #2
	bne	.L223
	ldr	r3, [r4, #2924]
	and	r3, r3, #1769472
	cmp	r3, #589824
	beq	.L160
.L159:
	ldr	r1, .L233
	mov	r0, #17
	bl	dprint_vfmw
	ldr	r3, [r4, #2960]
	cmp	r3, #1
	beq	.L224
.L162:
	ldr	r3, [r6, #48]
	add	r3, r3, #15
	mov	r3, r3, lsr #4
	str	r3, [r6, #56]
	ldr	r2, [r4, #2960]
	cmp	r2, #2
	beq	.L225
.L163:
	ldr	r2, [r6, #52]
	add	r2, r2, #15
	mov	r2, r2, lsr #4
.L164:
	mov	r1, #0
	str	r2, [r6, #60]
	str	r1, [r6, #64]
	ldr	r1, [r4, #2960]
	cmp	r1, #2
	beq	.L226
.L165:
	ldr	r1, [r4, #2972]
	cmp	r1, #0
	beq	.L166
	ldr	r0, [r8, #56]
	cmp	r3, r0
	beq	.L227
.L166:
	ldr	r1, [r4, #3004]
	ldr	r0, [r5, #512]
	bl	FSP_GetFsImagePtr
	subs	r9, r0, #0
	beq	.L169
	ldr	r0, [r5, #512]
	add	r3, r9, #608
	ldr	r1, [r9, #600]
	add	r10, r9, #624
	str	r3, [fp, #-72]
	bl	FreeUsdByDec
	ldr	r1, [r9, #608]
	ldr	r0, [r5, #512]
	bl	FreeUsdByDec
	ldr	r1, [r9, #616]
	ldr	r0, [r5, #512]
	bl	FreeUsdByDec
	ldr	r1, [r9, #624]
	ldr	r0, [r5, #512]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-72]
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r3, #-8]
	strd	r0, [r3]
	strd	r0, [r10, #-8]
	strd	r0, [r10]
	ldr	r1, [r4, #3004]
	ldr	r0, [r5, #512]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #3000]
	ldr	r0, [r5, #512]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #3000]
	str	r3, [r4, #3004]
	ldr	r0, [r5, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L228
.L169:
	mov	r3, #0
	add	r1, r5, #160
	str	r3, [r4, #2964]
	ldr	r0, [r5, #512]
	bl	FSP_ClearNotInVoQueue
	ldr	r3, [r7]
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L171
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L229
.L171:
	ldr	r3, [r4, #2972]
	cmp	r3, #0
	beq	.L173
	ldr	r3, [r8, #56]
	cmp	r3, #0
	beq	.L173
	ldr	r3, [r8, #60]
	cmp	r3, #0
	bne	.L230
.L173:
	ldr	r0, [r5, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	ldrne	r9, .L233+4
	bne	.L174
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	ldr	r0, [r5, #512]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r7]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	beq	.L231
.L220:
	ldr	r9, .L233+4
.L176:
	mov	r3, #0
	strb	r3, [r5, #529]
.L174:
	mov	r3, #0
	mov	r0, r7
	mov	r1, r3
	str	r3, [r4, #2972]
	str	r3, [r4, #2988]
	bl	MP2_ArrangeVHBMem
	ldr	r1, .L233+8
	str	r0, [r4, #2972]
	mov	r0, #1
	ldr	r3, [r6, #60]
	ldr	r2, [r6, #56]
	mov	r3, r3, asl #4
	mov	r2, r2, asl #4
	bl	dprint_vfmw
.L172:
	ldr	ip, [r9]
	cmp	ip, #0
	beq	.L221
	ldr	r9, [r8, #56]
	mov	r3, #8
	ldr	r8, [r8, #60]
	sub	r2, fp, #52
	ldr	r7, [r6, #56]
	mov	r1, #2
	ldr	lr, [r6, #60]
	ldr	r0, [r5, #512]
	strh	r9, [fp, #-52]	@ movhi
	strh	r8, [fp, #-50]	@ movhi
	strh	r7, [fp, #-48]	@ movhi
	strh	lr, [fp, #-46]	@ movhi
	blx	ip
.L221:
	ldr	r1, [r4, #2972]
.L167:
	str	r1, [r4, #2920]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L223:
	ldr	r3, [r4, #2924]
	tst	r3, #3538944
	beq	.L160
	tst	r3, #131072
	mov	r2, #2
	orreq	r3, r3, r2
	streq	r3, [r4, #2924]
	tst	r3, #1048576
	str	r2, [r4, #2960]
	orreq	r3, r3, #16
	streq	r3, [r4, #2924]
	moveq	r2, #2
	movne	r2, #2
	b	.L159
.L160:
	mov	r2, #1
	str	r2, [r4, #2960]
	b	.L159
.L157:
	ldr	r3, [r4, #2924]
	mov	r1, #18
	bfi	r1, r1, #16, #16
	and	r3, r3, r1
	cmp	r3, #1179648
	moveq	r2, #2
	streq	r2, [r4, #2960]
	b	.L159
.L226:
	ldrb	r1, [r6, #27]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L165
	ldr	r1, [r6, #52]
	add	r0, r1, #31
	add	r1, r1, #15
	mov	r0, r0, lsr #5
	mov	r1, r1, lsr #4
	rsb	r1, r1, r0, lsl #1
	str	r1, [r6, #64]
	b	.L165
.L225:
	ldrb	r2, [r6, #27]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L163
	ldr	r2, [r6, #52]
	add	r2, r2, #31
	mov	r2, r2, lsr #5
	mov	r2, r2, asl #1
	b	.L164
.L224:
	mov	r2, #0
	mov	r0, #3
	mov	r1, #5
	strb	r3, [r6, #27]
	strb	r3, [r6, #18]
	strb	r3, [r6, #11]
	strb	r3, [r6, #28]
	strb	r0, [r6, #9]
	str	r1, [r6, #144]
	strb	r2, [r6, #12]
	strb	r2, [r6, #13]
	strb	r2, [r6, #14]
	strb	r2, [r6, #15]
	strb	r2, [r6, #8]
	b	.L162
.L230:
	mov	r3, #0
	ldr	r1, .L233+12
	str	r3, [r4, #2972]
	mov	r0, #1
	bl	dprint_vfmw
	b	.L173
.L227:
	ldr	r3, [r8, #60]
	cmp	r2, r3
	bne	.L166
	b	.L167
.L228:
	ldr	r0, [r5, #512]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #3000]
	str	r0, [r4, #3004]
	b	.L169
.L229:
	ldr	r10, [r4, #2972]
	cmp	r10, #0
	beq	.L213
	ldr	r9, .L233+4
	b	.L172
.L231:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ble	.L232
.L177:
	mov	r3, #1
	strb	r3, [r5, #529]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L232:
	ldr	r3, [fp, #-60]
	cmp	r3, #32
	bgt	.L177
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L177
	ldr	r3, [r5, #516]
	cmp	r3, #0
	beq	.L220
	ldr	r1, [r6, #56]
	cmp	r1, #0
	beq	.L220
	ldr	lr, [r6, #60]
	ldr	r0, [r5, #536]
	cmp	lr, r0
	beq	.L220
	ldr	ip, [r5, #532]
	cmp	r1, ip
	beq	.L220
	stmib	sp, {r0, r1, lr}
	mov	r0, r2
	str	ip, [sp]
	ldr	r1, .L233+16
	ldr	r9, .L233+4
	bl	dprint_vfmw
	ldr	r3, [r6, #60]
	ldr	ip, [r9]
	str	r3, [r5, #536]
	ldr	r3, [r6, #56]
	cmp	ip, #0
	str	r3, [r5, #532]
	beq	.L176
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r5, #512]
	blx	ip
	b	.L176
.L213:
	mov	r0, r7
	mov	r1, r10
	bl	MP2_ArrangeVHBMem
	ldr	r9, .L233+4
	str	r10, [r4, #2988]
	str	r0, [r4, #2972]
	b	.L172
.L234:
	.align	2
.L233:
	.word	.LC19
	.word	g_event_report
	.word	.LC22
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	MP2_GetSequenceInfo, .-MP2_GetSequenceInfo
	.global	__aeabi_idiv
	.align	2
	.global	MP2_CalcRealEncFrameRate
	.type	MP2_CalcRealEncFrameRate, %function
MP2_CalcRealEncFrameRate:
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
	add	r3, r0, #90112
	add	r4, r0, #86016
	ldr	r3, [r3, #152]
	ldr	r5, [r4, #3064]
	ldr	lr, [r4, #3076]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	ldr	ip, [r3, #72]
	cmp	r2, #1
	ldr	r1, [r4, #3072]
	ldr	r2, [r4, #3060]
	ldr	r6, [r4, #3056]
	ldr	r0, [r4, #3068]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	cmp	ip, #0
	add	r0, r6, r0
	add	r1, r2, r1
	movgt	r2, #1
	movle	r2, #0
	cmp	r0, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r1, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r2, #0
	streq	r2, [r4, #3092]
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r0, r0, asl #1
	addeq	r1, r5, lr
	mul	r0, ip, r0
	bl	__aeabi_idiv
	movw	r2, #26215
	movt	r2, 26214
	mov	r3, r0, asr #31
	smull	r0, r1, r0, r2
	rsb	r3, r3, r1, asr #2
	str	r3, [r4, #3092]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_CalcRealEncFrameRate, .-MP2_CalcRealEncFrameRate
	.align	2
	.global	MP2_CalcDar
	.type	MP2_CalcDar, %function
MP2_CalcDar:
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
	add	r0, r0, #90112
	ldr	r3, [r0, #152]
	ldr	r3, [r3, #84]
	sub	r3, r3, #1
	cmp	r3, #2
	ldrls	r2, .L243
	addls	r3, r2, r3, lsl #2
	ldrls	r0, [r3, #148]
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L244:
	.align	2
.L243:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MP2_CalcDar, .-MP2_CalcDar
	.align	2
	.global	MP2_SetImgFormat
	.type	MP2_SetImgFormat, %function
MP2_SetImgFormat:
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
	add	r3, r0, #86016
	add	r8, r0, #90112
	str	r0, [fp, #-48]
	ldr	r1, [r3, #3008]
	ldr	r0, [r8, #512]
	str	r3, [fp, #-52]
	ldr	r5, [r8, #152]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L245
	ldrb	r3, [r5, #22]	@ zero_extendqisi2
	ldrb	r2, [r5, #27]	@ zero_extendqisi2
	cmp	r3, #4
	ldrb	lr, [r4, #125]	@ zero_extendqisi2
	subne	r3, r3, #1
	ldr	r9, [r5, #128]
	andne	r3, r3, #3
	moveq	r3, #0
	moveq	r10, r3
	ubfx	lr, lr, #2, #2
	uxtbne	r10, r3
	cmp	r2, #0
	ldrb	r2, [r5, #9]	@ zero_extendqisi2
	moveq	r0, #1
	movne	r0, #0
	orr	lr, r2, lr
	movne	r2, #1
	movne	r6, r2
	beq	.L263
.L248:
	ldr	r2, [r8, #152]
	ldrb	ip, [r4, #124]	@ zero_extendqisi2
	ldr	r2, [r2, #84]
	bfi	ip, r10, #0, #2
	and	ip, ip, #227
	sub	r2, r2, #1
	bfi	ip, r9, #5, #3
	cmp	r2, #2
	strb	ip, [r4, #124]
	ldrls	r1, .L266
	movhi	r1, #0
	movhi	r8, r1
	addls	r2, r1, r2, lsl #2
	ldrls	r1, [r2, #148]
	ldrb	r2, [r4, #125]	@ zero_extendqisi2
	andls	r8, r1, #7
	bfi	r2, r0, #0, #2
	mov	r0, r4
	bfi	r2, lr, #2, #2
	bfi	r2, r6, #4, #2
	strb	r2, [r4, #125]
	ldr	r2, [r4, #124]
	bfi	r2, r8, #14, #3
	str	r2, [r4, #124]
	mov	r2, r2, lsr #16
	bfc	r2, #1, #1
	strb	r2, [r4, #126]
	ldr	r6, [fp, #-48]
	ldrb	ip, [r4, #126]	@ zero_extendqisi2
	ldr	r2, [r6]
	ldr	r2, [r2, #592]
	str	r3, [r4, #116]
	sub	r2, r2, #1
	str	r3, [r4, #120]
	clz	r2, r2
	mov	r2, r2, lsr #5
	bfi	ip, r2, #2, #1
	strb	ip, [r4, #126]
	bl	SetAspectRatio
	mov	r3, #3
	str	r3, [r4, #412]
	mov	r2, #1
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	strb	r2, [r4, #407]
	cmp	r3, #3
	moveq	r3, #0
	movne	r3, #4
	strb	r3, [r4, #400]
	ldr	r3, [r6, #4]
	cmp	r3, #0
	streqb	r3, [r4, #407]
	ldrneb	r3, [r3, #144]	@ zero_extendqisi2
	moveq	r2, #32
	moveq	r3, r2
	streq	r2, [r4, #416]
	mov	r2, #1
	strb	r2, [r4, #405]
	strne	r3, [r4, #416]
	str	r3, [r4, #424]
	str	r3, [r4, #420]
	ldr	r3, [r5, #72]
	ldr	r2, [fp, #-48]
	str	r3, [r4, #160]
	ldr	r3, [r5, #48]
	str	r3, [r4, #128]
	ldr	r1, [r5, #52]
	str	r1, [r4, #132]
	ldr	r2, [r2]
	ldr	r2, [r2, #28]
	cmp	r2, #25
	beq	.L264
.L255:
	mov	r0, r3, lsr #1
	mov	r2, r1, lsr #1
	str	r0, [r4, #144]
	str	r2, [r4, #148]
	ldr	r2, [r5, #148]
	ldr	r0, [fp, #-48]
	str	r2, [r4, #152]
	ldr	r2, [r5, #152]
	str	r3, [r4, #136]
	str	r1, [r4, #140]
	str	r2, [r4, #156]
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	str	r3, [r4, #512]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	str	r3, [r4, #516]
	ldr	r3, [r5, #144]
	str	r3, [r4, #524]
	bl	MP2_CalcRealEncFrameRate
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #3092]
	str	r3, [r4, #520]
.L245:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L263:
	cmp	r2, #3
	beq	.L265
	ldr	r1, [fp, #-52]
	ldr	r1, [r1, #2936]
	cmp	r1, #0
	bne	.L250
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	mov	r6, r2
	b	.L248
.L250:
	subs	r2, r2, #1
	movne	r2, #1
	mov	r6, r2
	b	.L248
.L265:
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	and	r2, r2, #1
	mov	r6, r2
	b	.L248
.L264:
	ldr	ip, [r4, #164]
	add	r1, r1, #15
	ldr	lr, [r4, #44]
	add	r3, r4, #544
	mov	r1, r1, lsr #4
	add	r9, r4, #560
	mov	r2, ip, asl #4
	add	r10, lr, ip
	mul	r1, r1, r2
	add	r8, r1, lr
	str	r8, [r4, #48]
	ldrd	r2, [r3]
	add	ip, r8, ip
	mov	r0, r8
	adds	r6, r2, r1
	adc	r7, r3, r1, asr #31
	strd	r6, [r9, #-8]
	str	r8, [r4, #32]
	str	lr, [r4, #28]
	str	ip, [r4, #40]
	str	r10, [r4, #36]
	strd	r2, [r9]
	str	lr, [r4, #60]
	bl	MEM_Phy2Vir
	mov	r2, #0
	str	r2, [r4, #572]
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #128]
	ldr	r1, [r4, #132]
	str	r2, [r4, #64]
	str	r0, [r4, #568]
	b	.L255
.L267:
	.align	2
.L266:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	MP2_SetImgFormat, .-MP2_SetImgFormat
	.align	2
	.global	MP2_SearchStartCode
	.type	MP2_SearchStartCode, %function
MP2_SearchStartCode:
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
	cmp	r1, #4
	ble	.L269
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_SearchStartCode.part.0
.L269:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SearchStartCode, .-MP2_SearchStartCode
	.align	2
	.global	MP2_ProtocolPPSCheck
	.type	MP2_ProtocolPPSCheck, %function
MP2_ProtocolPPSCheck:
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
	add	r5, r0, #86016
	add	r4, r0, #90112
	ldr	r3, [r5, #2960]
	ldr	r1, [r4, #152]
	cmp	r3, #1
	beq	.L272
	cmp	r3, #2
	beq	.L273
	ldr	r3, [r5, #2924]
	orr	r3, r3, #63
	str	r3, [r5, #2924]
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
.L279:
	tst	r3, #24
	beq	.L281
.L297:
	cmp	r2, #3
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L282:
	orr	r3, r3, #64
	ldr	r1, [r5, #3004]
	str	r3, [r5, #2924]
	ldr	r0, [r4, #512]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L285
	ldr	r0, [r4, #512]
	add	r8, r6, #608
	ldr	r1, [r6, #600]
	add	r7, r6, #624
	bl	FreeUsdByDec
	ldr	r1, [r6, #608]
	ldr	r0, [r4, #512]
	bl	FreeUsdByDec
	ldr	r1, [r6, #616]
	ldr	r0, [r4, #512]
	bl	FreeUsdByDec
	ldr	r1, [r6, #624]
	ldr	r0, [r4, #512]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r8, #-8]
	strd	r0, [r8]
	strd	r0, [r7, #-8]
	strd	r0, [r7]
	ldr	r1, [r5, #3004]
	ldr	r0, [r4, #512]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r5, #3000]
	ldr	r0, [r4, #512]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r5, #3000]
	str	r3, [r5, #3004]
	ldr	r0, [r4, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L296
.L285:
	mov	r3, #0
	str	r3, [r5, #2964]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L273:
	ldr	r3, [r5, #2924]
	tst	r3, #1048576
	orreq	r3, r3, #16
	streq	r3, [r5, #2924]
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	sub	r0, r2, #1
	cmp	r0, #2
	bls	.L279
.L294:
	orr	r3, r3, #8
	str	r3, [r5, #2924]
	tst	r3, #24
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	bne	.L297
.L281:
	cmp	r2, #1
	biceq	r3, r3, #192
	streq	r3, [r5, #2924]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L272:
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	sub	r3, r2, #1
	cmp	r3, #3
	ldr	r3, [r5, #2924]
	orrhi	r3, r3, #8
	strhi	r3, [r5, #2924]
	ldrhib	r2, [r1, #22]	@ zero_extendqisi2
	sub	r0, r2, #2
	cmp	r0, #1
	bls	.L298
.L276:
	cmp	r2, #3
	beq	.L299
	tst	r3, #24
	bne	.L282
	b	.L281
.L296:
	ldr	r0, [r4, #512]
	bl	FSP_GetNullLogicFs
	str	r0, [r5, #3000]
	str	r0, [r5, #3004]
	b	.L285
.L299:
	ldrb	r2, [r1, #26]	@ zero_extendqisi2
	cmp	r2, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	b	.L294
.L298:
	ldrb	r0, [r1, #24]	@ zero_extendqisi2
	cmp	r0, #0
	orreq	r3, r3, #8
	streq	r3, [r5, #2924]
	ldreqb	r2, [r1, #22]	@ zero_extendqisi2
	b	.L276
	UNWIND(.fnend)
	.size	MP2_ProtocolPPSCheck, .-MP2_ProtocolPPSCheck
	.align	2
	.global	MP2_GetImageBuffer
	.type	MP2_GetImageBuffer, %function
MP2_GetImageBuffer:
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
	add	r6, r0, #90112
	add	r4, r0, #86016
	mov	r1, #1
	ldr	r0, [r6, #512]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #3008]
	blt	.L313
	mov	r1, r0
	ldr	r0, [r6, #512]
	bl	FSP_GetLogicFs
	subs	r5, r0, #0
	beq	.L314
	ldr	r2, [r4, #3008]
	mov	r0, #18
	ldr	r1, .L316
	bl	dprint_vfmw
	ldr	r2, [r5, #680]
	cmp	r2, #0
	beq	.L309
	ldr	r3, [r5, #684]
	cmp	r3, #0
	beq	.L309
	ldr	r1, [r5, #688]
	cmp	r1, #0
	beq	.L309
	ldr	ip, [r1, #16]
	mov	r0, #18
	ldr	r3, [r3, #16]
	ldr	r2, [r2, #16]
	ldr	r1, .L316+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #1
.L305:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L309:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L313:
	ldr	r1, .L316+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r4, #3004]
	ldr	r0, [r6, #512]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L303
	ldr	r0, [r6, #512]
	add	r8, r5, #608
	ldr	r1, [r5, #600]
	add	r7, r5, #624
	bl	FreeUsdByDec
	ldr	r1, [r5, #608]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	ldr	r1, [r5, #616]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	ldr	r1, [r5, #624]
	ldr	r0, [r6, #512]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r8, #-8]
	strd	r0, [r8]
	strd	r0, [r7, #-8]
	strd	r0, [r7]
	ldr	r1, [r4, #3004]
	ldr	r0, [r6, #512]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #3000]
	ldr	r0, [r6, #512]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #3000]
	str	r3, [r4, #3004]
	ldr	r0, [r6, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L315
.L303:
	mov	r5, #0
	add	r1, r6, #160
	str	r5, [r4, #2964]
	ldr	r0, [r6, #512]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L315:
	ldr	r0, [r6, #512]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #3000]
	str	r0, [r4, #3004]
	b	.L303
.L314:
	movw	r2, #1950
	ldr	r1, .L316+12
	bl	dprint_vfmw
	mov	r0, r5
	b	.L305
.L317:
	.align	2
.L316:
	.word	.LC25
	.word	.LC26
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	MP2_GetImageBuffer, .-MP2_GetImageBuffer
	.align	2
	.global	MP2_GetPictureInfo
	.type	MP2_GetPictureInfo, %function
MP2_GetPictureInfo:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r9, r0, #86016
	add	r8, r0, #90112
	mov	r4, r0
	ldr	r3, [r9, #2960]
	ldr	r5, [r8, #152]
	cmp	r3, #1
	ldr	r6, [r8, #156]
	beq	.L377
.L319:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L320
	ldr	r2, [r9, #2936]
	ldr	r1, [r9, #2968]
	clz	r3, r2
	mov	r3, r3, lsr #5
	str	r3, [r9, #2936]
	ldr	r2, [r5, #156]
	cmp	r2, r1
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	bne	.L378
.L373:
	add	r10, r4, #45056
.L322:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	strb	r3, [r10, #305]
	ldr	r3, [r5, #156]
	str	r3, [r9, #2968]
	ldr	r3, [r5, #56]
	strh	r3, [r4, #160]	@ movhi
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	ldr	r3, [r5, #60]
	ldreq	r2, [r5, #64]
	movne	r3, r3, lsr #1
	rsbeq	r3, r2, r3
	strh	r3, [r4, #156]	@ movhi
	ldr	r3, [r5, #60]
	strh	r3, [r4, #158]	@ movhi
	ldrb	r3, [r5, #11]	@ zero_extendqisi2
	strb	r3, [r4, #13]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	strb	r3, [r4, #11]
	ldr	r2, [r9, #2936]
	strb	r2, [r4, #12]
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	strb	r3, [r4, #15]
	ldrb	r3, [r5, #22]	@ zero_extendqisi2
	strb	r3, [r4, #8]
	ldr	r3, [r9, #2960]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r4, #188]
	cmp	r3, #0
	ldrneb	r3, [r5, #25]	@ zero_extendqisi2
	strneb	r3, [r4, #9]
	ldrneb	r3, [r5, #23]	@ zero_extendqisi2
	strneb	r3, [r4, #10]
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	strb	r3, [r4, #20]
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	strb	r3, [r4, #21]
	ldrb	r3, [r5, #6]	@ zero_extendqisi2
	strb	r3, [r4, #22]
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	strb	r3, [r4, #23]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	strb	r3, [r4, #14]
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	strb	r3, [r4, #19]
	ldrb	r3, [r5, #13]	@ zero_extendqisi2
	strb	r3, [r4, #18]
	ldrb	r3, [r5, #14]	@ zero_extendqisi2
	strb	r3, [r4, #17]
	ldrb	r3, [r5, #15]	@ zero_extendqisi2
	strb	r3, [r4, #16]
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r2, #0
	cmpne	r3, #3
	bne	.L331
	mov	r1, #0
	mov	r0, r4
	bl	MP2_GetImageBuffer
	subs	r7, r0, #0
	beq	.L379
	ldr	r1, [r9, #3008]
	ldr	r0, [r8, #512]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L334
	ldr	r7, [r4]
	add	lr, ip, #640
	add	r6, ip, #656
	ldr	r1, .L382
	mov	r0, #29
	str	ip, [fp, #-48]
	ldrd	r2, [r7, #56]
	strd	r2, [lr]
	ldr	r7, [r4]
	ldrd	r2, [r7, #72]
	strd	r2, [r6, #-8]
	ldr	r7, [r4]
	ldrd	r2, [r7, #88]
	strd	r2, [r6]
	mvn	r2, #0
	ldr	r7, [r4]
	mvn	r3, #0
	ldr	r7, [r7, #104]
	str	r7, [ip, #8]
	ldr	r7, [r4]
	ldr	r7, [r7, #108]
	str	r7, [ip, #12]
	ldr	r7, [r4]
	ldr	r7, [r7, #112]
	str	r7, [ip, #16]
	ldr	r7, [r4]
	ldr	r7, [r7, #128]
	str	r7, [ip, #20]
	ldr	r7, [r4]
	strd	r2, [r7, #56]
	ldrd	r6, [r6, #-8]
	ldrd	r2, [lr]
	strd	r6, [sp]
	bl	dprint_vfmw
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	ldr	ip, [fp, #-48]
	subs	r3, r3, #3
	movne	r3, #1
	str	r3, [ip, #112]
.L334:
	ldrb	r3, [r5, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L331
	ldr	r3, [r9, #2964]
	ldr	r2, [r9, #3000]
	cmp	r3, #0
	ldr	r3, [r9, #3004]
	movne	r1, #2
	moveq	r1, #1
	cmp	r2, r3
	str	r1, [r9, #2964]
	beq	.L337
	ldr	r1, .L382+4
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r9, #3000]
	ldr	r0, [r8, #512]
	bl	FSP_SetRef
	ldr	r3, [r9, #3004]
.L337:
	ldr	r1, [r9, #3008]
	mov	r2, #1
	str	r3, [r9, #3000]
	str	r1, [r9, #3004]
	ldr	r0, [r8, #512]
	bl	FSP_SetRef
	ldr	r1, [r9, #3000]
	ldr	r0, [r8, #512]
	bl	FSP_RemovePmv
	ldr	r2, [r9, #3008]
	ldr	r1, .L382+8
	mov	r0, #13
	bl	dprint_vfmw
.L331:
	ldr	r1, [r9, #3008]
	ldr	r0, [r8, #512]
	bl	FSP_GetLogicFs
	ldr	r1, [r9, #3000]
	mov	r5, r0
	ldr	r0, [r8, #512]
	bl	FSP_GetLogicFs
	ldr	r1, [r9, #3004]
	mov	r6, r0
	ldr	r0, [r8, #512]
	bl	FSP_GetLogicFs
	cmp	r5, #0
	cmpne	r6, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	ip, r0
	cmp	r3, #0
	bne	.L380
	ldr	r2, [r5, #680]
	cmp	r2, #0
	beq	.L339
	ldr	r3, [r5, #688]
	cmp	r3, #0
	beq	.L339
	ldr	r3, [r5, #684]
	cmp	r3, #0
	beq	.L339
	ldr	r3, [r0, #680]
	ldr	r1, .L382+12
	cmp	r3, #0
	ldrne	r7, [r3, #16]
	ldreq	r7, [r2, #16]
	str	r7, [r4, #200]
	ldr	r3, [r6, #680]
	cmp	r3, #0
	ldreq	r3, [r5, #680]
	ldr	lr, [r3, #16]
	str	lr, [r4, #204]
	ldr	r3, [r5, #680]
	ldr	r2, [r3, #16]
	str	r2, [r4, #208]
	ldr	r8, [r5, #692]
	str	r8, [r4, #268]
	ldr	r3, [r5, #680]
	ldr	r3, [r3, #36]
	str	r3, [r4, #240]
	ldr	r3, [r5, #680]
	ldr	r3, [r3, #40]
	str	r3, [r4, #244]
	ldr	r3, [r0, #688]
	mov	r0, #13
	cmp	r3, #0
	ldreq	r3, [r5, #688]
	ldr	r3, [r3, #16]
	str	r3, [r4, #220]
	ldr	r3, [r6, #688]
	cmp	r3, #0
	ldreq	r3, [r5, #688]
	ldr	r3, [r3, #16]
	str	r3, [r4, #224]
	ldr	r3, [r5, #688]
	ldr	r3, [r3, #16]
	str	r3, [r4, #228]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #16]
	str	r3, [r4, #232]
	ldr	ip, [ip, #120]
	str	ip, [r4, #212]
	ldr	ip, [r6, #120]
	str	ip, [r4, #216]
	ldr	ip, [r5, #688]
	ldr	ip, [ip, #16]
	stmib	sp, {r7, r8}
	str	ip, [r10, #284]
	str	lr, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5, #684]
	add	r1, r4, #89088
	add	lr, r4, #87
	add	r0, r1, #124
	add	ip, r4, #23
	ldr	r3, [r3, #32]
	add	r1, r1, #380
	mov	r2, #0
	str	r3, [r4, #248]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #76]
	str	r3, [r4, #252]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #60]
	str	r3, [r4, #256]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #64]
	str	r3, [r4, #260]
.L349:
	ldr	r3, [r0, #4]!
	add	r2, r2, #1
	cmp	r2, #64
	strb	r3, [lr, #1]!
	ldr	r3, [r1, #4]!
	strb	r3, [ip, #1]!
	bne	.L349
	mov	r0, r4
	mov	r7, #1
	bl	MP2_EstimatePicQp
	strb	r0, [r4, #152]
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L379:
	ldr	r2, [r9, #2932]
	ldr	r1, .L382+16
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L320:
	add	r10, r4, #45056
	ldrb	r1, [r10, #305]	@ zero_extendqisi2
	cmp	r1, #3
	beq	.L325
	ldr	r3, [r9, #2936]
	cmp	r3, #0
	beq	.L381
.L325:
	mov	r3, #1
	str	r3, [r9, #2936]
	b	.L322
.L377:
	ldrb	r2, [r5, #26]	@ zero_extendqisi2
	ldrb	r3, [r5, #24]	@ zero_extendqisi2
	strb	r2, [r5, #7]
	strb	r2, [r5, #6]
	strb	r3, [r5, #5]
	strb	r3, [r5, #4]
	b	.L319
.L380:
	str	r0, [fp, #-48]
	mov	r2, #1
	ldr	r1, [r9, #3008]
	mov	r7, #0
	ldr	r0, [r8, #512]
	bl	FSP_ClearLogicFs
	ldr	ip, [fp, #-48]
	mov	r3, r5
	movw	r2, #1186
	ldr	r1, .L382+20
	mov	r0, r7
	stmia	sp, {r6, ip}
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L381:
	ldr	r2, [r9, #2932]
	mov	r0, #1
	str	r1, [sp]
	ldr	r1, .L382+24
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r9, #3008]
	ldr	r0, [r8, #512]
	bl	FSP_ClearLogicFs
	ldrb	r3, [r6, #22]	@ zero_extendqisi2
	cmp	r3, #3
	ldrne	r3, [r9, #2924]
	orrne	r3, r3, #192
	strne	r3, [r9, #2924]
	b	.L325
.L339:
	ldr	r0, [r8, #512]
	mov	r2, #1
	ldr	r1, [r9, #3008]
	mov	r7, #0
	bl	FSP_ClearLogicFs
	ldr	r1, [r5, #684]
	ldr	r3, [r9, #3008]
	mov	r0, r7
	ldr	r2, [r9, #3000]
	str	r1, [sp, #12]
	ldr	ip, [r5, #688]
	ldr	lr, [r9, #3004]
	ldr	r1, .L382+28
	str	ip, [sp, #8]
	ldr	ip, [r5, #680]
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L378:
	ldr	r2, [r9, #2932]
	mov	r0, #1
	ldr	r1, .L382+32
	bl	dprint_vfmw
	mov	r3, #0
	mov	r2, #1
	str	r3, [r9, #2936]
	ldr	r1, [r9, #3008]
	ldr	r0, [r8, #512]
	bl	FSP_ClearLogicFs
	ldrb	r3, [r6, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L373
	ldr	r3, [r9, #2924]
	add	r10, r4, #45056
	orr	r3, r3, #192
	str	r3, [r9, #2924]
	b	.L322
.L383:
	.align	2
.L382:
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC35
	.word	.LC29
	.word	.LC33
	.word	.LC28
	.word	.LC34
	.word	.LC27
	UNWIND(.fnend)
	.size	MP2_GetPictureInfo, .-MP2_GetPictureInfo
	.align	2
	.global	MP2_SetVDMInf
	.type	MP2_SetVDMInf, %function
MP2_SetVDMInf:
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
	add	r5, r0, #86016
	mov	r4, r0
	add	r0, r0, #89088
	ldrb	r3, [r5, #2876]	@ zero_extendqisi2
	add	r0, r0, #96
	ldr	r2, [r5, #2880]
	cmp	r3, #1
	ldr	r3, [r5, #3192]
	beq	.L387
	ldr	ip, [r5, #2872]
	mov	r1, r3, lsr #3
	add	r3, r3, r2, lsl #3
	add	r2, r1, r2
	ldr	r6, [r5, #2884]
	and	r3, r3, #31
	bic	r2, r2, #3
	add	r1, r1, ip
	str	r1, [r5, #2872]
	bic	r6, r6, #3
	str	r3, [r4, #172]
	str	r2, [r4, #164]
	bl	BsResidBits
	str	r6, [r4, #168]
	str	r0, [r4, #180]
	ldr	r3, [r5, #2884]
	and	r3, r3, #3
	mov	r3, r3, asl #3
	str	r3, [r4, #176]
	ldr	r3, [r5, #2892]
	mov	r3, r3, asl #3
	str	r3, [r4, #184]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L387:
	ldr	r1, [r5, #2872]
	mov	ip, r3, lsr #3
	add	r3, r3, r2, lsl #3
	add	r2, ip, r2
	and	r3, r3, #31
	bic	r2, r2, #3
	add	r1, r1, ip
	str	r1, [r5, #2872]
	str	r3, [r4, #172]
	str	r2, [r4, #164]
	bl	BsResidBits
	mov	r3, #0
	str	r3, [r4, #168]
	str	r3, [r4, #176]
	str	r3, [r4, #184]
	str	r0, [r4, #180]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_SetVDMInf, .-MP2_SetVDMInf
	.align	2
	.global	MP2_DecNewPic
	.type	MP2_DecNewPic, %function
MP2_DecNewPic:
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
	mov	r4, r0
	bl	MP2_SetVDMInf
	ldr	r3, [r4]
	add	r2, r4, #45056
	add	r1, r4, #90112
	ldr	r0, [r3, #592]
	str	r0, [r2, #288]
	ldr	r0, [r3, #632]
	str	r0, [r2, #292]
	ldr	r0, [r3, #596]
	str	r0, [r2, #296]
	ldr	r2, [r1, #152]
	ldrb	r0, [r2, #22]	@ zero_extendqisi2
	cmp	r0, #3
	beq	.L406
	cmp	r0, #2
	moveq	r0, #1
	streq	r0, [r1, #524]
.L390:
	add	ip, r4, #8
	str	ip, [r4, #4]
	ldr	r0, [r3, #864]
	cmp	r0, #1
	beq	.L407
	cmp	r0, #2
	beq	.L408
.L393:
	add	r0, r4, #86016
	ldr	r3, [r0, #2924]
	bic	r3, r3, #16252928
	str	r3, [r0, #2924]
	ldrb	r5, [r2, #22]	@ zero_extendqisi2
	cmp	r5, #1
	movne	r0, #1
	beq	.L409
.L391:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L409:
	ldr	r3, .L410
	ldr	r6, [r3]
	cmp	r6, #0
	moveq	r0, r5
	beq	.L391
	ldr	lr, [r4, #184]
	sub	r2, fp, #28
	ldr	ip, [r4, #180]
	mov	r3, #4
	ldr	r0, [r1, #512]
	mov	r1, #20
	add	ip, ip, lr
	add	lr, ip, #7
	cmp	ip, #0
	movlt	ip, lr
	mov	ip, ip, asr #3
	str	ip, [r2, #-4]!
	blx	r6
	mov	r0, r5
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L406:
	ldr	r0, [r1, #524]
	cmp	r0, #0
	bne	.L390
	add	ip, r4, #86016
	ldr	lr, [ip, #2964]
	cmp	lr, #2
	beq	.L390
	ldrb	r3, [r2, #9]	@ zero_extendqisi2
	cmp	r3, #3
	ldrne	r3, [ip, #2936]
	clzne	r3, r3
	movne	r3, r3, lsr #5
	strne	r3, [ip, #2936]
	b	.L391
.L407:
	cmp	ip, #0
	beq	.L393
	ldrb	r3, [r2, #22]	@ zero_extendqisi2
	cmp	r3, #3
	moveq	r0, #0
	streq	r0, [r4, #4]
	bne	.L393
	b	.L391
.L408:
	ldr	r0, [r3, #868]
	cmp	ip, #0
	cmpne	r0, #0
	ble	.L393
	ldrb	r0, [r2, #22]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L393
	mov	r0, #0
	str	r0, [r4, #4]
	ldr	r2, [r3, #868]
	sub	r2, r2, #1
	str	r2, [r3, #868]
	b	.L391
.L411:
	.align	2
.L410:
	.word	g_event_report
	UNWIND(.fnend)
	.size	MP2_DecNewPic, .-MP2_DecNewPic
	.align	2
	.global	MP2_RecordVFMWState
	.type	MP2_RecordVFMWState, %function
MP2_RecordVFMWState:
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
	add	r2, r0, #90112
	ldr	r1, [r0]
	ldr	r3, [r2, #152]
	ldr	ip, [r3, #40]
	str	ip, [r1, #568]
	ldr	r1, [r3, #44]
	ldr	r3, [r0]
	str	r1, [r3, #572]
	ldr	r3, [r2, #516]
	ldr	r2, [r2, #520]
	ldr	r1, [r0]
	cmp	r3, r2
	rsbge	r3, r2, r3
	movlt	r3, #0
	str	r3, [r1, #576]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_RecordVFMWState, .-MP2_RecordVFMWState
	.align	2
	.global	MP2_GetUsrData
	.type	MP2_GetUsrData, %function
MP2_GetUsrData:
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
	add	r4, r0, #89088
	add	r4, r4, #96
	mov	r8, r0
	mov	r0, r4
	bl	BsToNextByte
	mov	r0, r4
	bl	BsResidBits
	add	r7, r0, #7
	cmp	r0, #0
	movlt	r0, r7
	mov	r7, r0, asr #3
	cmp	r7, #0
	ble	.L435
	mov	r6, #0
	ldr	r9, .L454
	mov	r5, r6
	b	.L420
.L452:
	bl	BsGet
	add	r5, r5, #1
	cmp	r5, r7
	strb	r0, [r9, r6]
	add	r6, r6, #1
	beq	.L416
.L420:
	mov	r1, #24
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	bic	r3, r0, #-16777216
	mov	r0, r4
	cmp	r3, #1
	beq	.L417
	cmp	r6, #1024
	blt	.L452
	mov	r1, #8
	mov	r0, r4
	add	r5, r5, #1
	bl	BsGet
	cmp	r5, r7
	bne	.L420
.L416:
	add	r7, r8, #86016
	movw	r3, #2876
	ldrsb	r9, [r7, r3]
	cmp	r9, #0
	beq	.L432
.L450:
	mov	r3, #0
	str	r3, [fp, #-48]
.L421:
	ldr	r4, [r7, #2956]
	cmp	r4, #3
	ble	.L451
.L433:
	add	r4, r8, #88064
	add	r9, r8, #90112
	add	r5, r4, #888
	add	r4, r4, #904
	mov	r10, #0
.L425:
	ldr	r1, [r5, #4]!
	ldr	r0, [r9, #512]
	bl	FreeUsdByDec
	cmp	r5, r4
	str	r10, [r5]
	mov	r2, #0
	bne	.L425
	mov	r4, r2
	str	r2, [r7, #2956]
.L434:
	ldr	r0, [r9, #512]
	add	r4, r8, r4, lsl #2
	bl	GetUsd
	add	r4, r4, #86016
	str	r0, [r4, #2940]
	ldr	r2, [r7, #2956]
	add	r3, r8, r2, lsl #2
	add	r3, r3, #88064
	add	r3, r3, #584
	ldr	r3, [r3, #308]
	cmp	r3, #0
	beq	.L426
	ldr	r3, [r8]
	add	r0, r0, #1056
	ldr	r1, .L454
	ldrd	r2, [r3, #56]
	strd	r2, [r0]
	ldr	r3, [r4, #2940]
	ldr	r2, [r7, #2928]
	str	r2, [r3, #1044]
	ldr	r3, [r4, #2940]
	str	r6, [r3, #1052]
	ldr	r2, [r9, #152]
	ldr	r3, [r4, #2940]
	ldrb	r2, [r2, #22]	@ zero_extendqisi2
	strb	r2, [r3, #1024]
	ldr	r3, [r4, #2940]
	ldr	r2, [r9, #516]
	str	r2, [r3, #1032]
	ldr	r2, [r9, #152]
	ldr	r3, [r4, #2940]
	ldrb	r2, [r2, #10]	@ zero_extendqisi2
	strb	r2, [r3, #1025]
	ldr	r3, [r7, #2924]
	tst	r3, #524288
	ldr	r3, [r4, #2940]
	movne	r2, #3
	moveq	r2, #1
	str	r2, [r3, #1040]
	ldr	r0, [r4, #2940]
	ldr	r2, [r0, #1052]
	cmp	r2, #1024
	movgt	r3, #1024
	strgt	r3, [r0, #1052]
	ldr	r3, .L454+4
	ldrgt	r0, [r4, #2940]
	ldr	r3, [r3, #52]
	ldrgt	r2, [r0, #1052]
	blx	r3
	ldr	r3, .L454+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L430
	ldr	r2, [r4, #2940]
	movw	r3, #1064
	ldr	r0, [r9, #512]
	mov	r1, #6
	blx	ip
.L430:
	ldr	r3, [r7, #2956]
	add	r3, r3, #1
	str	r3, [r7, #2956]
.L449:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L432:
	movw	r3, #2877
	ldrsb	r3, [r7, r3]
	cmp	r3, #0
	beq	.L438
	ldr	r3, [r7, #2892]
	cmp	r3, #0
	str	r3, [fp, #-48]
	beq	.L421
	ldr	r1, .L454+12
	mov	r0, r9
	bl	dprint_vfmw
	ldr	ip, .L454+4
	ldr	r3, [r7, #2888]
	mov	r2, #3
	ldr	r1, [r7, #2904]
	mov	r5, #1
	ldr	r0, [r7, #2908]
	sub	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, [ip, #52]
	sub	r0, r0, #3
	blx	r3
	ldr	r3, [r7, #2908]
	ldr	ip, [r7, #2884]
	mov	r0, r4
	ldr	r2, [r7, #2892]
	sub	r3, r3, #3
	strb	r9, [r7, #2877]
	add	r2, r2, #3
	mov	r1, r3
	str	r2, [r7, #2888]
	str	r3, [r7, #2904]
	sub	r3, ip, #3
	str	r9, [r7, #2892]
	str	r3, [r7, #2880]
	str	r9, [r7, #2908]
	str	r9, [r7, #2884]
	strb	r5, [r7, #2876]
	bl	BsInit
	strb	r5, [r7, #2877]
	strb	r9, [r7, #2876]
	mov	r0, r4
	bl	BsToNextByte
	mov	r0, r4
	bl	BsResidBits
	add	r10, r0, #7
	cmp	r0, #0
	movlt	r0, r10
	mov	r10, r0, asr #3
	cmp	r10, #3
	ble	.L437
	ldr	r5, .L454
	sub	r10, r10, #3
	b	.L424
.L453:
	bl	BsGet
	strb	r0, [r5, r6]
	add	r6, r6, #1
.L423:
	add	r9, r9, #1
	cmp	r9, r10
	beq	.L450
.L424:
	mov	r1, #24
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	bic	r3, r0, #-16777216
	mov	r0, r4
	cmp	r3, #1
	beq	.L438
	cmp	r6, #1024
	blt	.L453
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	b	.L423
.L417:
	add	r7, r8, #86016
	str	r3, [fp, #-48]
	ldr	r4, [r7, #2956]
	cmp	r4, #3
	bgt	.L433
.L451:
	add	r9, r8, #90112
	b	.L434
.L438:
	str	r3, [fp, #-48]
	b	.L421
.L426:
	mov	r0, r3
	ldr	r1, .L454+16
	bl	dprint_vfmw
	b	.L449
.L435:
	mov	r6, #0
	b	.L416
.L437:
	str	r9, [fp, #-48]
	b	.L421
.L455:
	.align	2
.L454:
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	MP2_GetUsrData, .-MP2_GetUsrData
	.align	2
	.global	next_start_code
	.type	next_start_code, %function
next_start_code:
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
	add	r5, r0, #89088
	mov	r7, r0
	add	r5, r5, #96
	mov	r0, r5
	bl	BsToNextByte
	mov	r0, r5
	bl	BsGetNextBytePtr
	mov	r4, r0
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	add	r3, r0, #7
	movge	r1, r0
	movlt	r1, r3
	mov	r1, r1, asr #3
	cmp	r1, #4
	movle	r1, #0
	bgt	.L481
.L457:
	mov	r0, r5
	bl	BsLongSkip
	mov	r0, r5
	bl	BsResidBits
	mov	r6, r0
	add	r0, r0, #7
	cmp	r6, #0
	movlt	r6, r0
	mov	r6, r6, asr #3
	cmp	r6, #3
	subgt	r6, r6, #3
	movgt	r4, #0
	bgt	.L463
	b	.L464
.L461:
	bl	BsSkip
	cmp	r4, r6
	beq	.L464
.L463:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	cmp	r0, #1
	mov	r0, r5
	bne	.L461
.L466:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L464:
	add	r7, r7, #86016
	movw	r3, #2876
	ldrsb	r4, [r7, r3]
	cmp	r4, #0
	bne	.L460
	ldrb	r3, [r7, #2877]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L460
	ldr	r3, [r7, #2892]
	cmp	r3, #0
	beq	.L460
	ldr	r1, .L484
	mov	r0, #7
	bl	dprint_vfmw
	ldr	ip, .L484+4
	ldr	r3, [r7, #2888]
	mov	r2, #3
	ldr	r1, [r7, #2904]
	mov	r6, #1
	ldr	r0, [r7, #2908]
	sub	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, [ip, #52]
	sub	r0, r0, #3
	blx	r3
	ldr	r3, [r7, #2908]
	ldr	ip, [r7, #2884]
	mov	r0, r5
	ldr	r2, [r7, #2892]
	sub	r3, r3, #3
	strb	r6, [r7, #2876]
	mov	r1, r3
	add	r2, r2, #3
	str	r3, [r7, #2904]
	sub	r3, ip, #3
	str	r2, [r7, #2888]
	str	r3, [r7, #2880]
	strb	r4, [r7, #2877]
	str	r4, [r7, #2892]
	str	r4, [r7, #2908]
	str	r4, [r7, #2884]
	bl	BsInit
	strb	r6, [r7, #2877]
	strb	r4, [r7, #2876]
	mov	r0, r5
	bl	BsToNextByte
	mov	r0, r5
	bl	BsGetNextBytePtr
	mov	r6, r0
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	add	r1, r0, #7
	movge	r3, r0
	movlt	r3, r1
	mov	r1, r3, asr #3
	cmp	r1, #4
	movle	r1, r4
	bgt	.L482
.L465:
	mov	r0, r5
	bl	BsLongSkip
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	ble	.L460
	sub	r6, r6, #3
	mov	r4, #0
	b	.L467
.L483:
	bl	BsSkip
	cmp	r4, r6
	beq	.L460
.L467:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	cmp	r0, #1
	mov	r0, r5
	bne	.L483
	b	.L466
.L460:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L481:
	mov	r0, r4
	bl	MP2_SearchStartCode.part.0
	mov	r1, r0, asl #3
	b	.L457
.L482:
	mov	r0, r6
	bl	MP2_SearchStartCode.part.0
	mov	r1, r0, asl #3
	b	.L465
.L485:
	.align	2
.L484:
	.word	.LC36
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	next_start_code, .-next_start_code
	.align	2
	.global	GetSliceHdr
	.type	GetSliceHdr, %function
GetSliceHdr:
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
	add	r5, r0, #89088
	mov	r6, r0
	add	r5, r5, #96
	add	r7, r0, #86016
	b	.L487
.L494:
	bl	BsShow
	mov	r4, r0
	mov	r0, r5
	bl	BsPos
	sub	r3, r4, #256
	sub	r3, r3, #1
	mov	r1, #32
	cmp	r3, #174
	str	r0, [r7, #2984]
	mov	r0, r5
	bls	.L500
	bl	BsSkip
.L487:
	mov	r0, r6
	bl	next_start_code
	mov	r1, #32
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	beq	.L494
	cmn	r3, #1
	beq	.L489
.L495:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L489:
	ldr	r3, .L501
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L496
	add	r6, r6, #90112
	mov	r3, #0
	mov	r2, r3
	mov	r1, #113
	ldr	r0, [r6, #512]
	blx	ip
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L500:
	bl	BsResidBits
	cmp	r0, #40
	ble	.L489
	ldr	r3, [r7, #2920]
	mov	r2, #0
	str	r2, [r7, #2980]
	cmp	r3, r2
	bne	.L493
	mov	r0, r6
	bl	MP2_GetSequenceInfo
	ldr	r3, [r7, #2972]
	cmp	r3, #0
	beq	.L495
.L493:
	mov	r0, r6
	bl	MP2_ProtocolPPSCheck
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L496:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L502:
	.align	2
.L501:
	.word	g_event_report
	UNWIND(.fnend)
	.size	GetSliceHdr, .-GetSliceHdr
	.align	2
	.global	sequence_header
	.type	sequence_header, %function
sequence_header:
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
	add	r7, r0, #89088
	add	r3, r0, #90112
	add	r5, r7, #96
	add	r4, r0, #86016
	ldr	r8, [r3, #152]
	mov	r2, #65536
	mov	r3, #0
	str	r2, [r4, #2924]
	str	r3, [r4, #2920]
	mov	r1, #12
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	str	r0, [r8, #48]
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #52]
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	str	r0, [r8, #84]
	mov	r0, r5
	bl	BsGet
	mov	r1, #18
	str	r0, [r8, #88]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #92]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	ldreq	r3, [r4, #2924]
	orreq	r3, r3, #1
	streq	r3, [r4, #2924]
.L504:
	mov	r1, #10
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r8, #96]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r8, #1]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r8, #76]
	beq	.L511
	ldr	r2, .L518
	add	r3, r7, #124
	add	r0, r7, #380
.L507:
	ldrb	r1, [r2, #1]!	@ zero_extendqisi2
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L507
.L506:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r8, #80]
	beq	.L512
	add	r3, r7, #380
	add	r7, r7, #636
	mov	r2, #16
.L509:
	str	r2, [r3, #4]!
	cmp	r3, r7
	bne	.L509
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L511:
	ldr	r10, .L518+4
	add	r9, r10, #64
.L505:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r10, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #22272
	cmp	r10, r9
	add	r3, r3, #32
	str	r0, [r6, r3, asl #2]
	bne	.L505
	b	.L506
.L512:
	ldr	r7, .L518+4
	add	r8, r7, #64
.L508:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r7, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #22272
	cmp	r7, r8
	add	r3, r3, #96
	str	r0, [r6, r3, asl #2]
	bne	.L508
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L519:
	.align	2
.L518:
	.word	.LANCHOR2-1
	.word	.LANCHOR2+63
	UNWIND(.fnend)
	.size	sequence_header, .-sequence_header
	.align	2
	.global	group_of_pictures_header
	.type	group_of_pictures_header, %function
group_of_pictures_header:
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
	add	r5, r0, #89088
	add	r3, r0, #90112
	add	r5, r5, #96
	mov	r4, r0
	mov	r1, #1
	ldr	r6, [r3, #152]
	mov	r0, r5
	mov	r7, #0
	bl	BsGet
	mov	r1, #5
	strb	r0, [r6, #2]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #100]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #104]
	mov	r0, r5
	bl	BsSkip
	mov	r0, r5
	mov	r1, #6
	bl	BsGet
	mov	r1, #6
	str	r0, [r6, #108]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #112]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r6, #116]
	mov	r0, r5
	bl	BsGet
	add	r3, r4, #86016
	add	lr, r3, #3056
	add	r5, r3, #3040
	add	ip, lr, #12
	add	r5, r5, #4
	add	r4, r4, #89088
	add	r4, r4, #8
	str	r0, [r6, #120]
	ldmia	lr, {r0, r1, r2}
	stmia	r5, {r0, r1, r2}
	ldmia	ip, {r0, r1, r2}
	stmia	lr, {r0, r1, r2}
	ldmia	r4, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	str	r7, [r3, #3080]
	str	r7, [r3, #3088]
	str	r7, [r3, #3084]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	group_of_pictures_header, .-group_of_pictures_header
	.align	2
	.global	sequence_extension
	.type	sequence_extension, %function
sequence_extension:
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
	add	r10, r0, #86016
	add	r4, r0, #89088
	add	r6, r0, #90112
	add	r4, r4, #96
	ldr	r2, [r10, #2924]
	ldr	r5, [r6, #152]
	mov	r1, #0
	orr	r2, r2, #131072
	str	r1, [r10, #2920]
	str	r2, [r10, #2924]
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #124]
	mov	r0, r4
	bl	BsGet
	mov	r1, #2
	strb	r0, [r5, #27]
	mov	r0, r4
	bl	BsGet
	mov	r1, #2
	strb	r0, [r5, #28]
	mov	r0, r4
	bl	BsGet
	mov	r1, #2
	mov	r9, r0
	mov	r0, r4
	bl	BsGet
	mov	r1, #12
	mov	r8, r0
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	cmp	r0, #0
	bne	.L522
	ldr	r2, [r10, #2924]
	orr	r2, r2, #2
	str	r2, [r10, #2924]
.L521:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L522:
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [fp, #-48]
	mov	r0, r4
	bl	BsGet
	mov	r1, #2
	strb	r0, [r5, #29]
	mov	r0, r4
	bl	BsGet
	mov	r1, #5
	strb	r0, [r5, #30]
	mov	r0, r4
	bl	BsGet
	ldrb	r2, [r5, #30]	@ zero_extendqisi2
	uxtb	r1, r0
	strb	r0, [r5, #31]
	add	r1, r1, #1
	add	r0, r2, #1
	bl	__aeabi_idiv
	ldr	ip, [r5, #88]
	ldr	r1, .L546
	ldr	r2, [r5, #124]
	add	r1, r1, ip, lsl #2
	tst	r2, #128
	ldr	r1, [r1, #160]
	mul	r0, r1, r0
	str	r0, [r5, #72]
	bne	.L545
	ubfx	r1, r2, #4, #3
	and	r2, r2, #15
	str	r1, [r5, #40]
	str	r2, [r5, #44]
.L525:
	ldr	r2, [r5, #48]
	ldr	r1, [r5, #52]
	ubfx	r2, r2, #0, #12
	ubfx	r1, r1, #0, #12
	orr	r9, r2, r9, asl #12
	orr	r8, r1, r8, asl #12
	str	r9, [r5, #48]
	cmp	r8, #0
	cmpne	r9, #0
	str	r8, [r5, #52]
	ldreq	r2, [r10, #2924]
	orreq	r2, r2, #1
	streq	r2, [r10, #2924]
	ldreq	r9, [r5, #48]
	cmp	r9, #8192
	bhi	.L527
	ldr	r2, [r5, #52]
	cmp	r2, #8192
	bls	.L528
.L527:
	ldr	r1, .L546+4
	ldr	r2, [r10, #2924]
	ldr	ip, [r1]
	orr	r2, r2, #1
	str	r2, [r10, #2924]
	cmp	ip, #0
	beq	.L528
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r6, #512]
	blx	ip
.L528:
	ldr	r3, [r5, #92]
	mov	r1, #400
	ldr	r2, [r5, #40]
	add	r7, r3, r7, lsl #18
	str	r7, [r5, #92]
	sub	r0, r2, #4
	ldr	r3, [r5, #96]
	mul	r7, r1, r7
	ldr	r1, [fp, #-48]
	cmp	r0, #1
	add	r10, r3, r1, lsl #10
	str	r10, [r5, #96]
	str	r7, [r5, #68]
	bls	.L530
	ldr	r3, .L546+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L531
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r6, #512]
	blx	ip
	ldr	r2, [r5, #40]
.L531:
	ldr	r1, .L546+8
	mov	r0, #1
	bl	dprint_vfmw
.L530:
	ldr	r2, [r5, #44]
	sub	r3, r2, #4
	cmp	r3, #6
	bls	.L521
	ldr	r3, .L546+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L532
	mov	r3, #0
	ldr	r0, [r6, #512]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	ldr	r2, [r5, #44]
.L532:
	ldr	r1, .L546+12
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L545:
	and	r2, r2, #15
	cmp	r2, #5
	moveq	r1, #133
	moveq	r2, #8
	streq	r1, [r5, #40]
	streq	r2, [r5, #44]
	b	.L525
.L547:
	.align	2
.L546:
	.word	.LANCHOR0
	.word	g_event_report
	.word	.LC38
	.word	.LC39
	UNWIND(.fnend)
	.size	sequence_extension, .-sequence_extension
	.align	2
	.global	sequence_display_extension
	.type	sequence_display_extension, %function
sequence_display_extension:
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
	add	r3, r0, #90112
	add	r6, r0, #86016
	add	r4, r0, #89088
	mov	r1, #3
	ldr	r5, [r3, #152]
	add	r4, r4, #96
	mov	r3, #0
	mov	r0, r4
	str	r3, [r5, #148]
	str	r3, [r5, #152]
	ldr	r3, [r6, #2924]
	orr	r3, r3, #262144
	str	r3, [r6, #2924]
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #128]
	mov	r0, r4
	bl	BsGet
	cmp	r0, #0
	str	r0, [r5, #132]
	bne	.L555
.L549:
	mov	r1, #14
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #148]
	mov	r0, r4
	bl	BsGet
	cmp	r0, #0
	bne	.L550
	ldr	r3, [r6, #2924]
	orr	r3, r3, #4
	str	r3, [r6, #2924]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L550:
	mov	r0, r4
	mov	r1, #14
	bl	BsGet
	str	r0, [r5, #152]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L555:
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #136]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	str	r0, [r5, #140]
	mov	r0, r4
	bl	BsGet
	str	r0, [r5, #144]
	b	.L549
	UNWIND(.fnend)
	.size	sequence_display_extension, .-sequence_display_extension
	.align	2
	.global	quant_matrix_extension
	.type	quant_matrix_extension, %function
quant_matrix_extension:
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
	add	r5, r0, #89088
	add	r3, r0, #90112
	add	r5, r5, #96
	mov	r7, r0
	mov	r1, #1
	ldr	r9, [r3, #152]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r9, #76]
	beq	.L581
.L557:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r9, #80]
	ldreq	r6, .L583
	addeq	r8, r6, #64
	beq	.L559
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	beq	.L561
.L567:
	mov	r4, #64
.L562:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	subs	r4, r4, #1
	bne	.L562
.L561:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	beq	.L582
.L563:
	mov	r4, #64
.L564:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	subs	r4, r4, #1
	bne	.L564
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L559:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r6, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #22272
	cmp	r6, r8
	add	r3, r3, #96
	str	r0, [r7, r3, asl #2]
	bne	.L559
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L567
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	bne	.L563
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L582:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L581:
	ldr	r6, .L583
	add	r8, r6, #64
.L558:
	mov	r1, #8
	mov	r0, r5
	ldrb	r4, [r6, #1]!	@ zero_extendqisi2
	bl	BsGet
	add	r3, r4, #22272
	cmp	r6, r8
	add	r3, r3, #32
	str	r0, [r7, r3, asl #2]
	bne	.L558
	b	.L557
.L584:
	.align	2
.L583:
	.word	.LANCHOR2+63
	UNWIND(.fnend)
	.size	quant_matrix_extension, .-quant_matrix_extension
	.align	2
	.global	sequence_scalable_extension
	.type	sequence_scalable_extension, %function
sequence_scalable_extension:
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
	add	r0, r0, #89088
	mov	r1, #32
	add	r0, r0, #96
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	sequence_scalable_extension, .-sequence_scalable_extension
	.align	2
	.global	picture_display_extension
	.type	picture_display_extension, %function
picture_display_extension:
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
	add	r3, r0, #90112
	add	r8, r0, #86016
	add	r4, r0, #89088
	ldr	r5, [r3, #152]
	add	r4, r4, #96
	ldr	r3, [r8, #2924]
	orr	r3, r3, #2097152
	str	r3, [r8, #2924]
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L587
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L599
.L595:
	mov	r7, #1
.L588:
	add	r5, r5, #160
	mov	r6, #0
	b	.L592
.L601:
	bl	BsGet
	mov	r1, #1
	str	r0, [r5, #12]
	mov	r0, r4
	bl	BsGet
	cmp	r0, #0
	beq	.L598
	cmp	r6, r7
	bge	.L600
.L592:
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	add	r6, r6, r1
	str	r0, [r5, #4]!
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	cmp	r0, #0
	mov	r0, r4
	bne	.L601
.L598:
	ldr	r3, [r8, #2924]
	orr	r3, r3, #32
	str	r3, [r8, #2924]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L587:
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L595
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #2
	movne	r7, #3
	b	.L588
.L599:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #2
	movne	r7, #3
	b	.L588
.L600:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	picture_display_extension, .-picture_display_extension
	.align	2
	.global	picture_coding_extension
	.type	picture_coding_extension, %function
picture_coding_extension:
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
	add	r2, r0, #90112
	add	r10, r0, #86016
	add	r4, r0, #89088
	ldr	r7, [r2, #152]
	add	r4, r4, #96
	ldr	r3, [r10, #2924]
	add	r8, r7, #4
	add	r9, r7, #8
	orr	r3, r3, #1048576
	str	r3, [r10, #2924]
.L603:
	mov	r6, r8
	mov	r5, #0
.L605:
	mov	r1, #4
	mov	r0, r4
	bl	BsGet
	add	r5, r5, #1
	uxtb	r0, r0
	strb	r0, [r6], #1
	sub	r3, r0, #10
	cmp	r0, #0
	cmpne	r3, #4
	ldrls	r3, [r10, #2924]
	orrls	r3, r3, #16
	strls	r3, [r10, #2924]
	cmp	r5, #2
	bne	.L605
	add	r8, r8, #2
	cmp	r8, r9
	bne	.L603
	mov	r1, r5
	mov	r0, r4
	bl	BsGet
	mov	r1, r5
	strb	r0, [r7, #8]
	mov	r0, r4
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #9]
	cmp	r0, #0
	bne	.L607
	ldr	r3, [r10, #2924]
	orr	r3, r3, #16
	str	r3, [r10, #2924]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L607:
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #10]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #11]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #12]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #13]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #14]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #15]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #16]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #17]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #18]
	mov	r0, r4
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r7, #3]
	cmp	r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, #3
	strb	r0, [r7, #19]
	mov	r0, r4
	bl	BsGet
	mov	r1, #1
	strb	r0, [r7, #20]
	mov	r0, r4
	bl	BsGet
	mov	r1, #7
	strb	r0, [r7, #21]
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	str	r0, [r7, #32]
	mov	r0, r4
	bl	BsGet
	str	r0, [r7, #36]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	picture_coding_extension, .-picture_coding_extension
	.align	2
	.global	picture_spatial_scalable_extension
	.type	picture_spatial_scalable_extension, %function
picture_spatial_scalable_extension:
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
	add	r0, r0, #89088
	mov	r1, #32
	add	r0, r0, #96
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	picture_spatial_scalable_extension, .-picture_spatial_scalable_extension
	.align	2
	.global	picture_temporal_scalable_extension
	.type	picture_temporal_scalable_extension, %function
picture_temporal_scalable_extension:
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
	add	r0, r0, #89088
	mov	r1, #32
	add	r0, r0, #96
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	picture_temporal_scalable_extension, .-picture_temporal_scalable_extension
	.align	2
	.global	extra_bit_information
	.type	extra_bit_information, %function
extra_bit_information:
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
	add	r4, r0, #89088
	mov	r5, #0
	add	r4, r4, #96
	b	.L619
.L621:
	bl	BsSkip
	mov	r0, r4
	bl	BsResidBits
	add	r5, r5, #1
	cmp	r0, #8
	ble	.L620
.L619:
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	cmp	r0, #0
	mov	r0, r4
	bne	.L621
.L620:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	extra_bit_information, .-extra_bit_information
	.align	2
	.global	picture_header
	.type	picture_header, %function
picture_header:
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
	add	r2, r0, #86016
	add	r4, r0, #89088
	add	r1, r0, #90112
	add	r4, r4, #96
	ldr	r3, [r2, #2924]
	mov	r6, r0
	ldr	r5, [r1, #152]
	mov	r0, r4
	bic	r3, r3, #3145728
	mov	r1, #10
	bic	r3, r3, #56
	orr	r3, r3, #524288
	str	r3, [r2, #2924]
	bl	BsGet
	mov	r1, #3
	str	r0, [r5, #156]
	mov	r0, r4
	bl	BsGet
	mov	r1, #16
	strb	r0, [r5, #22]
	mov	r0, r4
	bl	BsGet
	ldrb	r7, [r5, #22]	@ zero_extendqisi2
	sub	r3, r7, #2
	cmp	r3, #1
	str	r0, [r5, #160]
	bls	.L625
.L623:
	cmp	r7, #3
	beq	.L626
.L624:
	mov	r0, r6
	bl	extra_bit_information
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L626:
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, r7
	strb	r0, [r5, #25]
	mov	r0, r4
	bl	BsGet
	strb	r0, [r5, #26]
	b	.L624
.L625:
	mov	r1, #1
	mov	r0, r4
	bl	BsGet
	mov	r1, #3
	strb	r0, [r5, #23]
	mov	r0, r4
	bl	BsGet
	ldrb	r7, [r5, #22]	@ zero_extendqisi2
	strb	r0, [r5, #24]
	b	.L623
	UNWIND(.fnend)
	.size	picture_header, .-picture_header
	.align	2
	.global	copyright_extension
	.type	copyright_extension, %function
copyright_extension:
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
	add	r0, r0, #89088
	mov	r1, #32
	add	r0, r0, #96
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	BsSkip
	UNWIND(.fnend)
	.size	copyright_extension, .-copyright_extension
	.align	2
	.global	extension
	.type	extension, %function
extension:
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
	add	r3, r0, #90112
	add	r4, r0, #89088
	add	r4, r4, #96
	mov	r2, #0
	ldr	r3, [r3, #152]
	mov	r5, r0
	mov	r1, #4
	mov	r0, r4
	str	r2, [r3, #128]
	str	r2, [r3, #132]
	str	r2, [r3, #136]
	str	r2, [r3, #140]
	str	r2, [r3, #144]
	bl	BsGet
	sub	r0, r0, #1
	cmp	r0, #9
	ldrls	pc, [pc, r0, asl #2]
	b	.L629
.L631:
	.word	.L630
	.word	.L632
	.word	.L633
	.word	.L634
	.word	.L634
	.word	.L629
	.word	.L636
	.word	.L637
	.word	.L634
	.word	.L634
.L636:
	mov	r0, r5
	bl	picture_display_extension
.L629:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L634:
	mov	r0, r4
	mov	r1, #32
	bl	BsSkip
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L633:
	mov	r0, r5
	bl	quant_matrix_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L637:
	mov	r0, r5
	bl	picture_coding_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L630:
	mov	r0, r5
	bl	sequence_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L632:
	mov	r0, r5
	bl	sequence_display_extension
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	extension, .-extension
	.align	2
	.global	MPEG2DEC_Init
	.type	MPEG2DEC_Init, %function
MPEG2DEC_Init:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 904
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #908)
	sub	sp, sp, #908
	ldr	r3, [r1, #608]
	mov	r7, r1
	mov	r5, r0
	cmp	r3, #1
	ldr	r3, .L649
	beq	.L646
	add	r6, r0, #86016
	add	r8, r0, #89088
	add	r4, r0, #90112
	mov	r9, #0
	str	r9, [fp, #-944]
	str	r9, [fp, #-940]
.L641:
	ldr	r10, [r4, #504]
	movw	r2, #25120
	ldr	r3, [r3, #48]
	movt	r2, 1
	mov	r1, #0
	mov	r0, r5
	blx	r3
	str	r10, [r4, #504]
	add	r0, r4, #160
	mov	r10, #0
	bl	ResetVoQueue
	add	r1, r5, #45056
	str	r7, [r5]
	mov	r3, #1
	str	r10, [r4, #524]
	add	r0, r8, #800
	add	r2, r8, #988
	str	r0, [r4, #156]
	str	r2, [r4, #152]
	mov	ip, #3
	str	r3, [r6, #2936]
	mov	r0, r5
	strb	ip, [r1, #305]
	str	r10, [r6, #2980]
	ldr	r1, [r7, #8]
	str	r10, [r6, #2972]
	str	r3, [fp, #-936]
	str	r1, [r6, #2912]
	bl	VCTRL_GetChanIDByCtx
	ldr	r5, .L649
	ldr	r3, [fp, #-936]
	cmn	r0, #1
	str	r0, [r4, #512]
	beq	.L647
	ldr	r7, [r7, #608]
	cmp	r7, #1
	movne	r7, r3
	beq	.L648
.L643:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L648:
	ldr	r1, [fp, #-940]
	mov	r2, #256
	ldr	r0, [fp, #-944]
	ldr	r3, [r6, #2924]
	str	r1, [r6, #2960]
	sub	r1, fp, #556
	str	r0, [r6, #2972]
	orr	r3, r3, #65536
	str	r9, [r6, #2920]
	add	r0, r8, #128
	str	r3, [r6, #2924]
	ldr	r3, [r5, #52]
	blx	r3
	ldr	r3, [r5, #52]
	sub	r1, fp, #300
	add	r0, r8, #384
	mov	r2, #256
	blx	r3
	ldr	r3, [r5, #52]
	sub	r1, fp, #932
	mov	r2, #188
	ldr	r0, [r4, #152]
	blx	r3
	ldr	r3, [r5, #52]
	ldr	r0, [r4, #156]
	mov	r2, #188
	sub	r1, fp, #744
	blx	r3
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L646:
	add	r6, r0, #86016
	ldr	ip, [r3, #52]
	str	r3, [fp, #-936]
	add	r8, r0, #89088
	ldr	r3, [r6, #2960]
	mov	r2, #256
	add	r1, r8, #128
	sub	r0, fp, #556
	ldr	r9, [r6, #2920]
	add	r4, r5, #90112
	str	r3, [fp, #-940]
	ldr	r3, [r6, #2972]
	str	r3, [fp, #-944]
	blx	ip
	ldr	r3, [fp, #-936]
	add	r1, r8, #384
	mov	r2, #256
	sub	r0, fp, #300
	ldr	ip, [r3, #52]
	blx	ip
	ldr	r3, [fp, #-936]
	ldr	r1, [r4, #152]
	mov	r2, #188
	sub	r0, fp, #932
	ldr	ip, [r3, #52]
	blx	ip
	ldr	r3, [fp, #-936]
	ldr	r1, [r4, #156]
	mov	r2, #188
	sub	r0, fp, #744
	ldr	ip, [r3, #52]
	blx	ip
	ldr	r3, [fp, #-936]
	b	.L641
.L647:
	mov	r0, r10
	ldr	r1, .L649+4
	bl	dprint_vfmw
	mvn	r7, #19
	b	.L643
.L650:
	.align	2
.L649:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC40
	UNWIND(.fnend)
	.size	MPEG2DEC_Init, .-MPEG2DEC_Init
	.align	2
	.global	MPEG2DEC_Destroy
	.type	MPEG2DEC_Destroy, %function
MPEG2DEC_Destroy:
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
	add	r3, r0, #86016
	ldr	r1, .L652
	mov	r0, #2
	ldr	r2, [r3, #2932]
	bl	dprint_vfmw
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L653:
	.align	2
.L652:
	.word	.LC41
	UNWIND(.fnend)
	.size	MPEG2DEC_Destroy, .-MPEG2DEC_Destroy
	.align	2
	.global	MPEG2DEC_RecycleImage
	.type	MPEG2DEC_RecycleImage, %function
MPEG2DEC_RecycleImage:
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
	cmp	r0, #0
	mov	r4, r1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r0, #90112
	mov	r2, #0
	ldr	r0, [r5, #512]
	bl	FSP_SetDisplay
	mov	r1, r4
	ldr	r0, [r5, #512]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	addne	r4, r0, #592
	addne	r6, r0, #624
	movne	r8, #0
	movne	r9, #0
	beq	.L658
.L657:
	ldr	r1, [r4, #8]!
	ldr	r0, [r5, #512]
	bl	FreeUsdByDec
	cmp	r4, r6
	strd	r8, [r4]
	bne	.L657
.L658:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG2DEC_RecycleImage, .-MPEG2DEC_RecycleImage
	.align	2
	.global	MPEG2DEC_GetRemainImg
	.type	MPEG2DEC_GetRemainImg, %function
MPEG2DEC_GetRemainImg:
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
	ldr	r3, [r0]
	mov	r4, r0
	ldr	r3, [r3, #12]
	cmp	r3, #1
	addeq	r5, r0, #90112
	beq	.L662
	add	r6, r0, #86016
	add	r5, r0, #90112
	ldr	r1, [r6, #3004]
	ldr	r0, [r5, #512]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L662
	ldr	r1, [r6, #3004]
	ldr	r0, [r5, #512]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L680
.L662:
	add	r6, r5, #160
.L668:
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	GetVoLastImageID
.L680:
	mov	r0, r4
	bl	MP2_SetImgFormat
	add	ip, r4, #88064
	add	r3, ip, #888
	add	r2, r8, #600
	add	ip, ip, #904
	mov	r0, #0
.L664:
	ldr	r1, [r3, #4]!
	mov	r7, #0
	add	r2, r2, #8
	cmp	r1, r7
	strne	r0, [r2, #-4]
	strne	r1, [r2, #-8]
	cmp	r3, ip
	str	r0, [r3]
	bne	.L664
	str	r7, [r6, #2956]
	mov	r3, #1
	add	r6, r5, #160
	mov	r2, r3
	str	r3, [r8, #212]
	ldr	r1, [r8, #180]
	ldr	r0, [r5, #512]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #512]
	mov	r3, r6
	str	r8, [sp]
	mov	r2, r4
	mov	r1, #3
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L665
	ldr	r1, [r8, #180]
	mov	r0, r4
	bl	MPEG2DEC_RecycleImage
	b	.L668
.L665:
	ldr	r3, [r8, #184]
	cmp	r3, #100
	bhi	.L662
	ldr	r3, [r8, #128]
	cmp	r3, #31
	bls	.L662
	ldr	r3, [r8, #132]
	cmp	r3, #31
	bls	.L668
	mov	r0, r7
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG2DEC_GetRemainImg, .-MPEG2DEC_GetRemainImg
	.align	2
	.global	MPEG2DEC_GetImageBuffer
	.type	MPEG2DEC_GetImageBuffer, %function
MPEG2DEC_GetImageBuffer:
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
	add	r3, r0, #45056
	ldrb	r3, [r3, #305]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L682
	add	r3, r0, #86016
	ldr	r3, [r3, #2936]
	cmp	r3, #0
	beq	.L684
.L682:
	add	r4, r0, #90112
	ldr	r0, [r4, #512]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L684
	ldr	r0, [r4, #512]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L692
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L684:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L692:
	add	r1, r4, #160
	ldr	r0, [r4, #512]
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MPEG2DEC_GetImageBuffer, .-MPEG2DEC_GetImageBuffer
	.align	2
	.global	MP2_ClearCurPacket
	.type	MP2_ClearCurPacket, %function
MP2_ClearCurPacket:
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
	ldr	r1, [r1, #20]
	mov	r5, r0
	bl	SM_ReleaseStreamSeg
	ldrsb	r3, [r4]
	cmp	r3, #1
	beq	.L694
	mov	r0, r5
	ldr	r1, [r4, #24]
	bl	SM_ReleaseStreamSeg
.L694:
	ldr	r3, .L698
	mov	r0, r4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L699:
	.align	2
.L698:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MP2_ClearCurPacket, .-MP2_ClearCurPacket
	.align	2
	.global	MP2_ReceivePacket
	.type	MP2_ReceivePacket, %function
MP2_ReceivePacket:
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
	subs	r4, r1, #0
	add	r3, r0, #40960
	beq	.L705
	mov	r5, #0
	str	r5, [r3, #2568]
	ldr	r1, [r4, #12]
	str	r1, [r3, #2612]
	ldr	r1, [r4, #8]
	str	r1, [r3, #2576]
	ldr	r1, [r4]
	str	r1, [r3, #2600]
	ldr	r1, [r4, #12]
	str	r1, [r3, #2584]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #2572]
	ldr	r1, [r4, #16]
	str	r1, [r3, #2592]
	ldrb	ip, [r4, #5]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L703
	ldr	r1, [r4, #88]
	str	r1, [r3, #2580]
	ldr	r1, [r4, #80]
	str	r1, [r3, #2604]
	ldr	r1, [r4, #92]
	str	r1, [r3, #2588]
	ldrb	r1, [r4, #85]	@ zero_extendqisi2
	strb	r1, [r3, #2573]
	ldr	r1, [r4, #96]
	str	r1, [r3, #2596]
	ldrb	ip, [r4, #85]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L704
	add	r1, r0, #43520
	mov	r0, r2
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	ldrb	r2, [r4, #85]	@ zero_extendqisi2
	ldr	r1, .L706
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L704:
	mov	r0, ip
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L703:
	str	r5, [r3, #2580]
	mov	r0, ip
	str	r5, [r3, #2604]
	str	r5, [r3, #2588]
	strb	r5, [r3, #2573]
	str	r5, [r3, #2596]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L705:
	ldr	r1, .L706+4
	mov	r0, #1
	ldr	r2, [r3, #2628]
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L707:
	.align	2
.L706:
	.word	.LC43
	.word	.LC42
	UNWIND(.fnend)
	.size	MP2_ReceivePacket, .-MP2_ReceivePacket
	.align	2
	.global	MP2_ClearCurPic
	.type	MP2_ClearCurPic, %function
MP2_ClearCurPic:
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
	add	r6, r0, #45056
	ldr	r3, [r6, #280]
	cmp	r3, #0
	movne	r4, r0
	movne	r5, #0
	addne	r7, r4, #90112
	bne	.L711
	b	.L712
.L710:
	ldr	r3, [r6, #280]
	add	r4, r4, #44
	cmp	r5, r3
	bcs	.L712
.L711:
	ldr	r1, [r4, #304]
	add	r5, r5, #1
	ldr	r0, [r7, #512]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #284]
	cmp	r3, #0
	beq	.L710
	ldr	r3, [r4, #292]
	cmp	r3, #0
	beq	.L710
	ldr	r1, [r4, #308]
	add	r4, r4, #44
	ldr	r0, [r7, #512]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r6, #280]
	cmp	r5, r3
	bcc	.L711
.L712:
	mov	r3, #0
	str	r3, [r6, #280]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_ClearCurPic, .-MP2_ClearCurPic
	.global	__aeabi_uidiv
	.align	2
	.global	MPEG2DEC_VDMPostProc
	.type	MPEG2DEC_VDMPostProc, %function
MPEG2DEC_VDMPostProc:
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
	mov	r5, r0
	add	r7, r0, #90112
	ldrb	r0, [r0, #152]	@ zero_extendqisi2
	add	r6, r5, #86016
	mov	r2, r1
	ldr	r8, [r7, #152]
	mov	r10, r1
	strb	r0, [r6, #3104]
	mov	r0, #22
	ldr	r1, .L793
	add	r4, r5, #8
	bl	dprint_vfmw
	ldr	r2, [r7, #152]
	ldr	r1, [r5]
	add	r9, r5, #45056
	ldr	r0, [r2, #40]
	str	r0, [r1, #568]
	ldr	r1, [r2, #44]
	ldr	r2, [r5]
	str	r1, [r2, #572]
	ldr	r2, [r7, #516]
	ldr	r1, [r7, #520]
	ldr	r0, [r5]
	cmp	r2, r1
	rsbge	r2, r1, r2
	movlt	r2, #0
	str	r2, [r0, #576]
	mov	r0, r5
	bl	MP2_ClearCurPic
	ldr	ip, .L793+4
	movw	r2, #45348
	mov	r0, r4
	mov	r1, #0
	ldr	ip, [ip, #48]
	blx	ip
	ldr	r1, [r6, #3008]
	ldr	r0, [r7, #512]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r6, #3004]
	mov	r4, r0
	ldr	r0, [r7, #512]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r6, #3000]
	str	r0, [fp, #-48]
	ldr	r0, [r7, #512]
	bl	FSP_GetFsImagePtr
	cmp	r4, #0
	beq	.L787
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r10, #0
	strb	r2, [r9, #304]
	str	r10, [r4, #184]
	blt	.L725
	cmp	r10, #100
	movlt	r3, r10
	movge	r3, #100
	str	r3, [r4, #184]
	ldrb	r2, [r8, #22]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L726
	ldr	r2, [r5]
	ldr	r2, [r2]
	cmp	r3, r2
	bhi	.L788
.L726:
	ldr	r1, .L793+8
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	MP2_SetImgFormat
	ldr	r3, [r5]
	ldr	r3, [r3, #596]
	cmp	r3, #1
	movne	r3, #0
	strne	r3, [r4, #96]
	strne	r3, [r4, #100]
	beq	.L789
.L732:
	ldrb	r3, [r8, #9]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L735
	ldr	r3, [r6, #2936]
	cmp	r3, #1
	movne	r0, #1
	beq	.L735
.L782:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L735:
	add	r1, r5, #88064
	add	r4, r4, #600
	add	r3, r1, #888
	add	r1, r1, #904
	mov	r0, #0
.L734:
	ldr	r2, [r3, #4]!
	mov	ip, #0
	add	r4, r4, #8
	cmp	r2, ip
	strne	r0, [r4, #-4]
	strne	r2, [r4, #-8]
	cmp	r3, r1
	str	r0, [r3]
	bne	.L734
	str	ip, [r6, #2956]
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L737
	ldrb	r3, [r8, #22]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L737
	ldr	r1, [r6, #3000]
	str	r1, [r6, #3012]
.L738:
	cmn	r1, #1
	beq	.L740
	ldr	r0, [r7, #512]
	bl	FSP_GetDisplay
	cmp	r0, #1
	beq	.L744
	ldr	r1, [r6, #3012]
	ldr	r0, [r7, #512]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L744
.L740:
	ldrb	r3, [r8, #27]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L790
	ldrb	r3, [r8, #18]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r6, #3088]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r6, #3088]
	ldreqb	r3, [r8, #16]	@ zero_extendqisi2
	ldreq	r2, [r6, #3084]
	addeq	r3, r3, #2
	strne	r3, [r6, #3088]
	addeq	r3, r2, r3
	movne	r3, r3, asl #1
	str	r3, [r6, #3084]
.L751:
	ldr	r2, [r6, #3080]
	mov	r0, #1
	ldr	r3, [r6, #2932]
	add	r2, r2, r0
	str	r2, [r6, #3080]
	add	r3, r3, r0
	str	r3, [r6, #2932]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L725:
	mov	r3, #0
	str	r3, [r4, #184]
	b	.L726
.L788:
	mov	r2, #1
	ldr	r1, [r6, #3008]
	ldr	r0, [r7, #512]
	bl	FSP_ClearLogicFs
	ldr	r1, [r6, #3004]
	ldr	r0, [r7, #512]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L728
	ldr	r0, [r7, #512]
	add	r8, r4, #608
	ldr	r1, [r4, #600]
	add	r5, r4, #624
	bl	FreeUsdByDec
	ldr	r1, [r4, #608]
	ldr	r0, [r7, #512]
	bl	FreeUsdByDec
	ldr	r1, [r4, #616]
	ldr	r0, [r7, #512]
	bl	FreeUsdByDec
	ldr	r1, [r4, #624]
	ldr	r0, [r7, #512]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r8, #-8]
	strd	r0, [r8]
	strd	r0, [r5, #-8]
	strd	r0, [r5]
	ldr	r1, [r6, #3004]
	ldr	r0, [r7, #512]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r6, #3000]
	ldr	r0, [r7, #512]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r6, #3000]
	str	r3, [r6, #3004]
	ldr	r0, [r7, #512]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L728
	ldr	r0, [r7, #512]
	bl	FSP_GetNullLogicFs
	str	r0, [r6, #3000]
	str	r0, [r6, #3004]
.L728:
	mov	r3, #0
	mov	r0, #1
	str	r3, [r6, #2964]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L789:
	ldr	r2, .L793+12
	ldr	r2, [r2]
	add	r2, r2, #4096
	ldr	r0, [r2, #84]
	ldr	r1, [r2, #88]
	str	r3, [r4, #96]
	cmp	r1, #0
	moveq	r1, #1
	bl	__aeabi_uidiv
	str	r0, [r4, #100]
	b	.L732
.L744:
	ldr	r1, [r6, #3012]
	ldr	r0, [r7, #512]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L791
	ldr	r2, [r4, #184]
	cmp	r2, #0
	beq	.L746
	ldr	r3, [r5]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L792
.L746:
	ldr	r9, [r6, #3012]
	ldr	r0, [r7, #512]
	mov	r1, r9
	bl	FSP_GetRef
	mov	r2, r9
	ldr	r1, .L793+16
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r6, #3012]
	ldr	r0, [r7, #512]
	bl	FSP_SetDisplay
	ldr	r0, [r7, #512]
	mov	r2, r5
	str	r4, [sp]
	add	r3, r7, #160
	mov	r1, #3
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L753
	add	r5, r4, #592
	add	r4, r4, #624
	mov	r8, #0
	mov	r9, #0
.L748:
	ldr	r1, [r5, #8]!
	ldr	r0, [r7, #512]
	bl	FreeUsdByDec
	cmp	r5, r4
	strd	r8, [r5]
	bne	.L748
	ldr	r0, [r7, #512]
	mov	r2, #0
	ldr	r1, [r6, #3012]
	bl	FSP_SetDisplay
	mov	r0, #0
	b	.L782
.L737:
	ldr	r1, [r6, #3008]
	str	r1, [r6, #3012]
	b	.L738
.L790:
	ldrb	r2, [r8, #16]	@ zero_extendqisi2
	ldrb	r3, [r8, #10]	@ zero_extendqisi2
	ldr	r1, [r6, #3088]
	add	r3, r2, r3
	add	r3, r3, #1
	add	r3, r3, r1
	str	r3, [r6, #3088]
	mov	r3, r3, asl #1
	str	r3, [r6, #3084]
	b	.L751
.L792:
	ldr	r1, .L793+20
	mov	r0, #1
	bl	dprint_vfmw
	add	r9, r4, #592
	add	r10, r4, #624
	mov	r5, #0
	mov	r4, #0
.L749:
	ldr	r1, [r9, #8]!
	ldr	r0, [r7, #512]
	bl	FreeUsdByDec
	cmp	r9, r10
	strd	r4, [r9]
	bne	.L749
	ldr	r0, [r7, #512]
	mov	r2, #0
	ldr	r1, [r6, #3012]
	bl	FSP_SetDisplay
	b	.L740
.L787:
	str	r0, [sp]
	mov	r2, r4
	ldr	r3, [fp, #-48]
	mov	r0, r4
	ldr	r1, .L793+24
	bl	dprint_vfmw
	mov	r0, r4
	b	.L782
.L753:
	ldr	r3, [r7, #520]
	add	r3, r3, #1
	str	r3, [r7, #520]
	b	.L740
.L791:
	movw	r2, #3609
	ldr	r1, .L793+28
	bl	dprint_vfmw
	mov	r0, r4
	b	.L782
.L794:
	.align	2
.L793:
	.word	.LC44
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC46
	.word	g_HwMem
	.word	.LC48
	.word	.LC47
	.word	.LC45
	.word	.LC24
	UNWIND(.fnend)
	.size	MPEG2DEC_VDMPostProc, .-MPEG2DEC_VDMPostProc
	.align	2
	.global	MP2_u_v
	.type	MP2_u_v, %function
MP2_u_v:
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
	mov	r5, r2
	mov	r6, r0
	mov	r7, r1
	bl	BsShow
	mov	r1, r7
	mov	r4, r0
	mov	r0, r6
	bl	BsSkip
	mov	r3, r4
	mov	r2, r5
	ldr	r1, .L796
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L797:
	.align	2
.L796:
	.word	.LC49
	UNWIND(.fnend)
	.size	MP2_u_v, .-MP2_u_v
	.align	2
	.global	MP2_DecSliceHeader
	.type	MP2_DecSliceHeader, %function
MP2_DecSliceHeader:
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
	ldr	r2, [r0, #4]
	mov	r1, #1
	mov	r3, #0
	mov	r5, r0
	cmp	r2, #175
	str	r1, [r0, #16]
	ldr	r4, [r0, #52]
	str	r3, [r0, #24]
	bls	.L799
	ldr	r2, [r0]
	cmp	r2, r3
	beq	.L811
.L799:
	ldr	r2, [r5, #20]
	mov	r0, r4
	ldr	r1, [r5, #8]
	sub	r2, r2, #1
	add	r3, r2, r3
	ldr	r2, .L814
	mul	r3, r1, r3
	mov	r1, #5
	cmp	r3, #0
	subne	r3, r3, #1
	str	r3, [r5, #28]
	bl	MP2_u_v
	mov	r3, #0
	mov	r1, #1
	str	r3, [r5, #32]
	str	r0, [r5, #44]
	mov	r0, r4
	bl	BsShow
	cmp	r0, #0
	bne	.L812
.L803:
	mov	r0, r4
	ldr	r2, .L814+4
	mov	r1, #1
	bl	MP2_u_v
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L812:
	ldr	r2, .L814+8
	mov	r1, #1
	mov	r0, r4
	bl	MP2_u_v
	ldr	r2, .L814+12
	mov	r1, #1
	mov	r0, r4
	bl	MP2_u_v
	ldr	r2, .L814+16
	mov	r1, #7
	str	r0, [r5, #32]
	mov	r0, r4
	bl	MP2_u_v
	b	.L802
.L813:
	bl	BsShow
	ldr	r2, .L814+4
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	beq	.L803
	bl	MP2_u_v
	ldr	r2, .L814+20
	mov	r1, #8
	mov	r0, r4
	bl	MP2_u_v
.L802:
	mov	r0, r4
	bl	BsResidBits
	mov	r1, #1
	cmp	r0, #0
	mov	r0, r4
	bgt	.L813
	b	.L803
.L811:
	ldr	r2, .L814+24
	mov	r1, #3
	mov	r0, r4
	bl	MP2_u_v
	mov	r3, r0, asl #7
	str	r0, [r5, #24]
	b	.L799
.L815:
	.align	2
.L814:
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC50
	UNWIND(.fnend)
	.size	MP2_DecSliceHeader, .-MP2_DecSliceHeader
	.align	2
	.global	MP2_ExitMb
	.type	MP2_ExitMb, %function
MP2_ExitMb:
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
	str	r3, [r0, #16]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_ExitMb, .-MP2_ExitMb
	.align	2
	.global	MP2_WriteSliceInfo
	.type	MP2_WriteSliceInfo, %function
MP2_WriteSliceInfo:
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
	add	r7, r0, #45056
	mov	r4, #44
	add	r5, r0, #86016
	mov	r6, r0
	ldr	r2, [r7, #280]
	ldr	r3, [r5, #3144]
	cmp	r2, #1024
	mla	r4, r4, r2, r0
	str	r3, [r4, #316]
	ldr	r3, [r5, #3156]
	str	r3, [r4, #320]
	ldr	r3, [r5, #3152]
	str	r3, [r4, #312]
	bcs	.L823
	ldr	r2, [r5, #3192]
	add	r0, r0, #89088
	ldr	r3, [r5, #2880]
	add	r0, r0, #96
	and	r1, r2, #7
	str	r1, [r4, #296]
	add	r3, r3, r2, lsr #3
	str	r3, [r4, #280]
	ldr	r3, [r5, #2896]
	str	r3, [r4, #304]
	bl	BsResidBits
	movw	r2, #2876
	str	r0, [r4, #288]
	ldrsh	r3, [r5, r2]
	cmp	r3, #1
	beq	.L824
	cmp	r3, #256
	bne	.L822
	ldr	r3, [r5, #2884]
	mov	r2, #0
	str	r2, [r4, #300]
	str	r3, [r4, #284]
	ldr	r3, [r5, #2900]
	str	r3, [r4, #308]
	ldr	r3, [r5, #2892]
	mov	r3, r3, asl #3
	str	r3, [r4, #292]
.L821:
	ldr	r3, [r7, #280]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r7, #280]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L823:
	mov	r3, #1024
	ldr	r1, .L825
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r6
	bl	MP2_ClearCurPic
	ldr	r3, [r5, #2924]
	mov	r0, #0
	str	r0, [r5, #2980]
	bic	r3, r3, #5767168
	str	r3, [r5, #2924]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L824:
	mov	r3, #0
	str	r3, [r4, #284]
	str	r3, [r4, #300]
	str	r3, [r4, #308]
	str	r3, [r4, #292]
	b	.L821
.L822:
	movw	r3, #2877
	ldrsb	r2, [r5, r2]
	ldrsb	r3, [r5, r3]
	mov	r0, #1
	ldr	r1, .L825+4
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L826:
	.align	2
.L825:
	.word	.LC57
	.word	.LC58
	UNWIND(.fnend)
	.size	MP2_WriteSliceInfo, .-MP2_WriteSliceInfo
	.align	2
	.global	MP2_MbAddrInc
	.type	MP2_MbAddrInc, %function
MP2_MbAddrInc:
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
	mov	r1, #4
	mov	r6, r0
	bl	BsShow
	ldr	r5, .L833
	add	r0, r5, r0, lsl #3
	ldr	r4, [r0, #224]
	ldr	r1, [r0, #228]
	cmp	r4, #6
	bls	.L831
	cmp	r4, #9
	beq	.L832
	mov	r1, #11
	mov	r0, r6
	bl	BsShow
	ldr	r2, .L833+4
	and	r3, r0, #127
	mov	r0, r6
	sub	r3, r3, #24
	add	r5, r5, r3, lsl #3
	ldr	r4, [r5, #352]
	ldr	r1, [r5, #356]
	bl	MP2_u_v
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L831:
	mov	r0, r6
	ldr	r2, .L833+4
	bl	MP2_u_v
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L832:
	mov	r0, r6
	ldr	r2, .L833+4
	bl	MP2_u_v
	rsb	r0, r0, #9
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L834:
	.align	2
.L833:
	.word	.LANCHOR0
	.word	.LC59
	UNWIND(.fnend)
	.size	MP2_MbAddrInc, .-MP2_MbAddrInc
	.align	2
	.global	MP2_InitMb
	.type	MP2_InitMb, %function
MP2_InitMb:
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
	mov	r5, #0
	mov	r6, r0
	ldr	r4, [r0, #52]
	b	.L836
.L840:
	cmp	r0, #15
	beq	.L837
	cmp	r0, #8
	add	r5, r5, #33
	bne	.L848
.L837:
	ldr	r2, .L850
	mov	r1, #11
	mov	r0, r4
	bl	MP2_u_v
.L836:
	mov	r1, #11
	mov	r0, r4
	bl	BsShow
	cmp	r0, #23
	bls	.L840
	mov	r0, r4
	bl	MP2_MbAddrInc
	ldr	r4, [r6, #16]
	cmp	r4, #0
	beq	.L841
	ldr	r3, [r6, #28]
	add	r5, r5, r0
	cmp	r3, #0
	addne	r2, r5, r3
	ldr	r3, [r6, #12]
	subeq	r2, r5, #1
	str	r2, [r6, #40]
	sub	r3, r3, #1
	cmp	r2, r3
	bhi	.L849
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L848:
	ldr	r1, .L850+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L841:
	mov	r2, r4
	ldr	r1, .L850+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L849:
	ldr	r1, .L850+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L851:
	.align	2
.L850:
	.word	.LC61
	.word	.LC60
	.word	.LC63
	.word	.LC62
	UNWIND(.fnend)
	.size	MP2_InitMb, .-MP2_InitMb
	.align	2
	.global	MP2_GetFirstMbInSlice
	.type	MP2_GetFirstMbInSlice, %function
MP2_GetFirstMbInSlice:
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
	bl	MP2_DecSliceHeader
	mov	r0, r4
	bl	MP2_InitMb
	mov	r3, #0
	str	r3, [r4, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_GetFirstMbInSlice, .-MP2_GetFirstMbInSlice
	.align	2
	.global	MP2_DecSlice
	.type	MP2_DecSlice, %function
MP2_DecSlice:
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
	add	r4, r0, #86016
	add	r6, r0, #90112
	uxtb	lr, r1
	add	r2, r0, #89088
	ldr	r3, [r4, #2960]
	add	r8, r2, #40
	ldr	ip, [r6, #152]
	add	r2, r2, #96
	ldr	r5, [r4, #2904]
	sub	r3, r3, #1
	ldr	r1, [r4, #2888]
	clz	r3, r3
	mov	r7, r0
	mov	r0, r8
	str	r5, [r4, #3160]
	mov	r3, r3, lsr #5
	str	r1, [r4, #3148]
	mov	r5, #0
	str	r3, [r4, #3112]
	ldr	r3, [ip, #60]
	str	r3, [r4, #3116]
	ldr	r3, [ip, #56]
	str	r3, [r4, #3120]
	ldr	r3, [ip, #52]
	ldr	r1, [ip, #48]
	add	r3, r3, #15
	str	lr, [r4, #3132]
	add	r1, r1, #15
	str	r2, [r4, #3164]
	mov	r3, r3, lsr #4
	mov	r1, r1, lsr #4
	mul	r1, r1, r3
	str	r1, [r4, #3124]
	bl	MP2_DecSliceHeader
	mov	r0, r8
	bl	MP2_InitMb
	str	r5, [r4, #3128]
	cmp	r0, #1
	mov	r8, r0
	beq	.L854
	ldr	r1, .L865
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L865+4
	ldr	ip, [r3]
	cmp	ip, r5
	beq	.L857
.L864:
	ldr	r0, [r6, #512]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #127
	blx	ip
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L854:
	mov	r0, r7
	bl	MP2_WriteSliceInfo
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r0, r8
	ldr	r1, .L865+8
	bl	dprint_vfmw
	ldr	r3, .L865+4
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L864
.L857:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L866:
	.align	2
.L865:
	.word	.LC64
	.word	g_event_report
	.word	.LC65
	UNWIND(.fnend)
	.size	MP2_DecSlice, .-MP2_DecSlice
	.align	2
	.global	MP2_GetHDR
	.type	MP2_GetHDR, %function
MP2_GetHDR:
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
	add	r9, r0, #90112
	add	r5, r0, #89088
	mov	r1, #32
	add	r5, r5, #96
	ldr	r3, [r9, #152]
	mov	r7, r0
	mov	r8, #0
	mov	r0, r5
	strb	r8, [r9, #528]
	str	r3, [fp, #-80]
	add	r6, r7, #86016
	ldr	r10, [r9, #156]
	bl	BsShow
	ldr	r3, [r6, #2924]
	str	r3, [fp, #-84]
	mov	r4, r0
	mov	r0, r5
	bl	BsPos
	mov	r1, #32
	str	r0, [r6, #2984]
	mov	r0, r5
	bl	BsSkip
	movw	r3, #439
	cmp	r4, r3
	beq	.L935
	movw	r3, #435
	cmp	r4, r3
	cmpne	r4, #440
	bne	.L874
.L870:
	ldr	r3, [r6, #2980]
	cmp	r3, #1
	beq	.L936
.L871:
	movw	r3, #435
	cmp	r4, r3
	beq	.L876
.L939:
	cmp	r4, #436
	bcc	.L937
	movw	r3, #437
	cmp	r4, r3
	beq	.L880
	cmp	r4, #436
	bls	.L931
	movw	r3, #439
	cmp	r4, r3
	beq	.L931
	cmp	r4, #440
	bne	.L875
	ldr	r3, [r6, #2976]
	mov	r0, r5
	ldr	r4, [r6, #2872]
	add	r4, r3, r4
	bl	BsPos
	ldr	r1, .L943
	add	r2, r4, r0, lsr #3
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r7
	bl	group_of_pictures_header
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	blt	.L938
.L931:
	mov	r5, #0
.L873:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L874:
	cmp	r4, #256
	beq	.L870
	movw	r3, #435
	cmp	r4, r3
	bne	.L939
.L876:
	ldr	r3, [r6, #2976]
	mov	r0, r5
	ldr	r4, [r6, #2872]
	add	r4, r3, r4
	bl	BsPos
	ldr	r1, .L943+4
	add	r2, r4, r0, lsr #3
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r7
	bl	sequence_header
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	blt	.L940
	ldr	r5, [r6, #2924]
	ands	r5, r5, #7
	bne	.L885
	ldr	r2, [fp, #-80]
	mov	r3, #1
	mov	r0, r10
	strb	r3, [r2]
	mov	r1, r2
	mov	r2, #188
	bl	memcpy
	ldr	r3, [r6, #2928]
	add	r3, r3, #1
	str	r3, [r6, #2928]
	b	.L873
.L937:
	cmp	r4, #256
	beq	.L878
	bcc	.L875
	cmp	r4, #432
	bls	.L875
	ldr	r3, [r6, #2976]
	mov	r0, r5
	ldr	r4, [r6, #2872]
	add	r4, r3, r4
	bl	BsPos
	ldr	r1, .L943+8
	add	r2, r4, r0, lsr #3
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r7
	bl	MP2_GetUsrData
	subs	r5, r0, #0
	bne	.L891
	add	r1, r7, #88064
	ldr	r0, [r9, #512]
	add	r1, r1, #828
	bl	MP2_ClearCurPacket
	ldr	r3, .L943+12
	ldr	r4, [r3]
	cmp	r4, #0
	mvneq	r5, #0
	beq	.L873
	mov	r3, r5
	mov	r2, r5
	ldr	r0, [r9, #512]
	mov	r1, #113
	blx	r4
	mvn	r5, #0
	b	.L873
.L878:
	ldr	r3, [r6, #2976]
	mov	r0, r5
	ldr	r4, [r6, #2872]
	add	r4, r3, r4
	bl	BsPos
	ldr	r1, .L943+16
	add	r2, r4, r0, lsr #3
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r7
	bl	picture_header
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	bge	.L931
	ldr	r3, .L943+12
	ldr	r2, [fp, #-84]
	ldr	r4, [r3]
	str	r2, [r6, #2924]
	cmp	r4, #0
	beq	.L890
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r9, #512]
	blx	r4
.L890:
	add	r1, r7, #88064
	ldr	r0, [r9, #512]
	add	r1, r1, #828
	mvn	r5, #0
	bl	MP2_ClearCurPacket
	mov	r2, #256
	ldr	r1, .L943+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L873
.L936:
	ldr	r2, [r6, #2924]
	tst	r2, #4194304
	beq	.L871
	strb	r3, [r9, #528]
	orr	r2, r2, #8388608
	mov	r0, r7
	str	r2, [r6, #2924]
	mov	r2, #0
	str	r2, [r6, #2980]
	mov	r5, r3
	bl	MP2_ProtocolPPSCheck
	b	.L873
.L935:
	ldr	r3, .L943+24
	mov	r2, #32
	mov	r1, r5
	sub	r0, fp, #76
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, #32
	sub	r0, fp, #76
	bl	BsGet
	mov	r1, #32
	str	r0, [fp, #-88]
	sub	r0, fp, #76
	bl	BsGet
	ldr	r3, [fp, #-88]
	movw	r1, #20036
	movw	r2, #20553
	movt	r1, 17221
	movt	r2, 18515
	cmp	r0, r1
	cmpeq	r3, r2
	bne	.L870
	ldr	r5, [r6, #2980]
	cmp	r5, #1
	beq	.L941
.L872:
	mov	r3, #1
	mov	r5, #0
	strb	r3, [r9, #530]
	b	.L873
.L875:
	sub	r3, r4, #256
	sub	r3, r3, #1
	cmp	r3, #174
	bhi	.L893
	ldr	r8, [r6, #2920]
	cmp	r8, #0
	beq	.L894
.L896:
	ldr	r3, [r6, #2924]
	tst	r3, #589824
	beq	.L931
	orr	r3, r3, #4194304
	mov	r0, r7
	str	r3, [r6, #2924]
	mov	r7, #1
	mov	r1, r4
	str	r7, [r6, #2980]
	bl	MP2_DecSlice
	cmp	r0, r7
	mov	r5, r0
	beq	.L873
	mov	r2, r4
	mov	r0, r7
	ldr	r1, .L943+28
	mov	r5, #0
	bl	dprint_vfmw
	b	.L873
.L880:
	ldr	r3, [r6, #2976]
	mov	r0, r5
	ldr	r4, [r6, #2872]
	add	r4, r3, r4
	bl	BsPos
	ldr	r1, .L943+32
	add	r2, r4, r0, lsr #3
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r7
	bl	extension
	mov	r0, r5
	bl	BsResidBits
	cmp	r0, #0
	bge	.L931
	ldr	r3, .L943+12
	ldr	r2, [fp, #-84]
	ldr	r4, [r3]
	str	r2, [r6, #2924]
	cmp	r4, #0
	beq	.L892
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r9, #512]
	blx	r4
.L892:
	add	r1, r7, #88064
	ldr	r0, [r9, #512]
	add	r1, r1, #828
	mvn	r5, #0
	bl	MP2_ClearCurPacket
	b	.L873
.L885:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L942
.L893:
	ldr	r3, .L943+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L931
.L930:
	mov	r3, #0
	ldr	r0, [r9, #512]
	mov	r2, r3
	mov	r1, #113
	blx	r4
	b	.L931
.L891:
	ldr	r1, .L943+36
	mov	r0, #1
	bl	dprint_vfmw
	b	.L873
.L941:
	ldr	r3, [r6, #2924]
	tst	r3, #4194304
	beq	.L872
	strb	r5, [r9, #530]
	orr	r3, r3, #8388608
	strb	r5, [r9, #528]
	mov	r0, r7
	str	r3, [r6, #2924]
	str	r8, [r6, #2980]
	bl	MP2_ProtocolPPSCheck
	b	.L873
.L894:
	mov	r0, r7
	bl	MP2_GetSequenceInfo
	ldr	r5, [r6, #2972]
	cmp	r5, #0
	beq	.L873
	ldrb	r3, [r9, #529]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r5, r8
	beq	.L873
	ldr	r5, [r6, #2920]
	cmp	r5, #0
	bne	.L896
	b	.L873
.L942:
	mov	r2, #188
	mov	r1, r10
	ldr	r0, [fp, #-80]
	bl	memcpy
	ldr	r2, .L943+12
	ldr	r3, [r6, #2924]
	ldr	r4, [r2]
	bic	r3, r3, #7
	str	r3, [r6, #2924]
	cmp	r4, #0
	bne	.L930
	b	.L931
.L938:
	ldr	r3, .L943+12
	ldr	r2, [fp, #-84]
	ldr	r4, [r3]
	str	r2, [r6, #2924]
	cmp	r4, #0
	beq	.L889
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r9, #512]
	blx	r4
.L889:
	add	r1, r7, #88064
	ldr	r0, [r9, #512]
	add	r1, r1, #828
	mvn	r5, #0
	bl	MP2_ClearCurPacket
	mov	r2, #440
	ldr	r1, .L943+40
	mov	r0, #1
	bl	dprint_vfmw
	b	.L873
.L940:
	ldr	r3, .L943+12
	ldr	r2, [fp, #-84]
	ldr	r4, [r3]
	str	r2, [r6, #2924]
	cmp	r4, #0
	beq	.L884
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r9, #512]
	blx	r4
.L884:
	add	r1, r7, #88064
	ldr	r0, [r9, #512]
	add	r1, r1, #828
	mvn	r5, #0
	bl	MP2_ClearCurPacket
	movw	r2, #435
	ldr	r1, .L943+44
	mov	r0, #1
	bl	dprint_vfmw
	b	.L873
.L944:
	.align	2
.L943:
	.word	.LC68
	.word	.LC66
	.word	.LC72
	.word	g_event_report
	.word	.LC70
	.word	.LC71
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC75
	.word	.LC74
	.word	.LC73
	.word	.LC69
	.word	.LC67
	UNWIND(.fnend)
	.size	MP2_GetHDR, .-MP2_GetHDR
	.align	2
	.global	MPEG2DEC_Decode
	.type	MPEG2DEC_Decode, %function
MPEG2DEC_Decode:
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
	ldr	r3, .L983
	add	r8, r0, #89088
	add	r5, r0, #45312
	add	r6, r8, #640
	add	r7, r0, #90112
	add	r5, r5, #48
	ldr	r3, [r3, #52]
	mov	r2, #160
	mov	r4, r0
	mov	r0, r6
	blx	r3
	mov	r1, r6
	mov	r0, r5
	ldr	r2, [r7, #512]
	bl	MP2_ReceivePacket
	cmp	r0, #1
	beq	.L946
	ldr	r1, .L983+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r6, #0
.L947:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L946:
	add	r9, r4, #86016
	add	r0, r8, #96
	ldr	r2, [r9, #2888]
	ldr	r1, [r9, #2904]
	bl	BsInit
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L978
.L948:
	ldr	r3, [r9, #2924]
	str	r3, [r9, #3108]
.L949:
	mov	r0, r4
	bl	MP2_GetHDR
	add	r0, r0, #1
	cmp	r0, #1
	bls	.L979
	mov	r0, r4
	bl	MP2_DecodingDecide
	subs	r6, r0, #0
	beq	.L980
	cmn	r6, #1
	beq	.L977
	mov	r0, r4
	bl	MP2_GetPictureInfo
	subs	r6, r0, #0
	bne	.L955
	add	r1, r5, #43520
	ldr	r0, [r7, #512]
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L983+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L956
	ldr	r0, [r7, #512]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	ip
.L956:
	ldr	r1, .L983+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r6, #0
	b	.L947
.L979:
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L981
.L951:
	ldrb	r3, [r7, #529]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L977
	add	r1, r5, #43520
	ldr	r0, [r7, #512]
	add	r1, r1, #12
	mov	r6, #0
	bl	MP2_ClearCurPacket
	b	.L947
.L980:
	add	r1, r5, #43520
	ldr	r0, [r7, #512]
	add	r1, r1, #12
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L983+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L954
	ldr	r0, [r7, #512]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	ip
.L954:
	ldr	r1, .L983+16
	mov	r0, #22
	bl	dprint_vfmw
.L977:
	mov	r6, #0
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L978:
	ldr	r3, [r3, #872]
	cmp	r3, #1
	ldreq	r3, [r9, #3108]
	streq	r3, [r9, #2924]
	bne	.L948
	b	.L949
.L981:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	beq	.L951
	b	.L977
.L955:
	mov	r0, r4
	bl	MP2_DecNewPic
	subs	r6, r0, #0
	beq	.L982
	ldr	r6, [r9, #2872]
	ldr	r3, [r9, #2976]
	ldr	r2, [r9, #2888]
	mov	r6, r6, asl #3
	add	r3, r3, r2
	str	r3, [r9, #2976]
	b	.L947
.L982:
	mov	r2, #1
	ldr	r1, [r9, #3008]
	ldr	r0, [r7, #512]
	bl	FSP_ClearLogicFs
	add	r1, r5, #43520
	add	r1, r1, #12
	ldr	r0, [r7, #512]
	bl	MP2_ClearCurPacket
	mov	r0, r4
	bl	MP2_ClearCurPic
	ldr	r3, .L983+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L958
	ldr	r0, [r7, #512]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	ip
.L958:
	ldr	r1, .L983+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L947
.L984:
	.align	2
.L983:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC76
	.word	g_event_report
	.word	.LC78
	.word	.LC77
	.word	.LC79
	UNWIND(.fnend)
	.size	MPEG2DEC_Decode, .-MPEG2DEC_Decode
	.align	2
	.global	MP2_GetPacketState
	.type	MP2_GetPacketState, %function
MP2_GetPacketState:
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
	add	r0, r0, #90112
	ldrb	r3, [r0, #528]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MP2_GetPacketState, .-MP2_GetPacketState
	.global	g_tmpusd
	.global	zigzag
	.global	default_intra_quantizer_matrix
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__FUNCTION__.14568, %object
	.size	__FUNCTION__.14568, 19
__FUNCTION__.14568:
	.ascii	"MP2_DecodingDecide\000"
	.space	1
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
	.type	CSWTCH.47, %object
	.size	CSWTCH.47, 12
CSWTCH.47:
	.word	5
	.word	1
	.word	2
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
	.align	2
.LANCHOR2 = . + 0
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC2:
	ASCII(.ascii	"mp2 actual frame size(%dx%d) exeed max config(%dx%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"user set decode channel max resolution is (w=%d,h=%" )
	ASCII(.ascii	"d), this stream (w=%d,h=%d) can NOT be decoded!\012" )
	ASCII(.ascii	"\000" )
.LC4:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"ERROR: frm %d, integrality: %#x\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"ERROR: frm %d, No Img buffer is allocated\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"----------------- mp2 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"frm %d pic type %d struct is %d total pos %#x\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"NOTE: Drop non-I, cur is B\012\000" )
.LC11:
	ASCII(.ascii	"NOTE: Drop non-I, cur is P\012\000" )
.LC12:
	ASCII(.ascii	"NOTE: Drop non-I\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"NOTE: Drop B\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"%s %d pFwdImg = NULL,  pBwdImg = NULL!!\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"fuction return value is null,%s %d !!\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"dec P frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC17:
	ASCII(.ascii	"dec B frame, bwd ref err(%d) > ref_thr(%d)\012\000" )
.LC18:
	ASCII(.ascii	"dec B frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC19:
	ASCII(.ascii	"Protocol %d\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"seq size change, call vpss to release all frames.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC21:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"new seq size %dx%d\012\000" )
.LC23:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"ERROR: frm %d, lost one field\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"ERROR: frm %d, lost one field flg = %d, last_struct" )
	ASCII(.ascii	" = %d\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"Fatal Error: frm%d, get image buffer failed\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"dec_pts: %lld Usertag: %lld\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"++++++++++ ref %d\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"line: %d(pCur, pFwd, pBwd)(%p, %p, %p)\012\000" )
.LC34:
	ASCII(.ascii	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"dec addr: cur,cur2d,fwd,bwd,pmv = %p,%p,%p,%p,%p\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC36:
	ASCII(.ascii	"\012mpeg2 copy last 3 bytes of the first packet!\012" )
	ASCII(.ascii	"\012\000" )
.LC37:
	ASCII(.ascii	"pMp2CodecInfo->pUsrDatArray[%d] is null\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"ERROR: unsupported profile %d\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"ERROR: unsupported level %d\012\000" )
	.space	3
.LC40:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC41:
	ASCII(.ascii	"Decoding quits at frm %d\012\000" )
	.space	2
.LC42:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
.LC43:
	ASCII(.ascii	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\012\000" )
.LC44:
	ASCII(.ascii	"ErrRatio = %d\012\000" )
	.space	1
.LC45:
	ASCII(.ascii	"pImg is null, pCurImg %#x pBwdImg %#x pFwdImg %#x\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC46:
	ASCII(.ascii	"DEBUG: DEC over\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"%-40s%20d\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"slice_vertical_position\000" )
.LC51:
	ASCII(.ascii	"quantiser_scale_code\000" )
	.space	3
.LC52:
	ASCII(.ascii	"extra_bit_slice\000" )
.LC53:
	ASCII(.ascii	"intra_slice_flag\000" )
	.space	3
.LC54:
	ASCII(.ascii	"intra_slice\000" )
.LC55:
	ASCII(.ascii	"reserved_bits\000" )
	.space	2
.LC56:
	ASCII(.ascii	"extra_infrmation_slice\000" )
	.space	1
.LC57:
	ASCII(.ascii	"Slice num = %d >= %d\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"seg info is wrong! IsLastSeg[0] = %d, IsLastSeg[1] " )
	ASCII(.ascii	"= %d\012\000" )
	.space	3
.LC59:
	ASCII(.ascii	"macroblock_address_increment\000" )
	.space	3
.LC60:
	ASCII(.ascii	"macroblock_escape ERROR\012\000" )
	.space	3
.LC61:
	ASCII(.ascii	"macroblock_escape\000" )
	.space	2
.LC62:
	ASCII(.ascii	"SlcStartMbNum = %d > PicEndMum = %d\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"FirstMbInSliceFlag = %d\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"MP2_GetFirstMbInSlice Failed!\012\000" )
	.space	1
.LC65:
	ASCII(.ascii	"MP2_WriteSliceInfo Failed!\012\000" )
.LC66:
	ASCII(.ascii	"found sh %#x\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"SEQUENCE_HEADER_CODE Bitstream is not enough!\012\000" )
	.space	1
.LC68:
	ASCII(.ascii	"found gh %#x\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"GROUP_START_CODE Bitstream is not enough!\012\000" )
	.space	1
.LC70:
	ASCII(.ascii	"found ph %#x\012\000" )
	.space	2
.LC71:
	ASCII(.ascii	"PICTURE_START_CODE Bitstream is not enough!\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"found ud %#x\012\000" )
	.space	2
.LC73:
	ASCII(.ascii	"cann't get ud pointer\012\000" )
	.space	1
.LC74:
	ASCII(.ascii	"found ext %#x\012\000" )
	.space	1
.LC75:
	ASCII(.ascii	"MP2_DecSlice is wrong!\012\000" )
.LC76:
	ASCII(.ascii	"line %d, MP2_ReceivePacket receive packet failed!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC77:
	ASCII(.ascii	"MP2 Decode Decide is wrong!\012\000" )
	.space	3
.LC78:
	ASCII(.ascii	"MP2 get picture info is wrong!\012\000" )
.LC79:
	ASCII(.ascii	"MP2 dec new pic failed!\012\000" )
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	g_tmpusd, %object
	.size	g_tmpusd, 1024
g_tmpusd:
	.space	1024
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
