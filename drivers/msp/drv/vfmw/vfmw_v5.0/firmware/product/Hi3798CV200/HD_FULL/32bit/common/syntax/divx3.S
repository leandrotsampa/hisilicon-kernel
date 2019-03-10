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
	.file	"divx3.c"
	.text
	.align	2
	.global	Divx3_GetImageBuffer
	.type	Divx3_GetImageBuffer, %function
Divx3_GetImageBuffer:
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
	add	r4, r0, #40960
	mov	r5, r0
	mov	r1, #1
	ldr	r0, [r4, #3456]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #3060]
	blt	.L9
	mov	r1, r0
	ldr	r0, [r4, #3456]
	bl	FSP_GetLogicFs
	subs	r5, r0, #0
	beq	.L10
	ldr	r2, [r4, #3060]
	mov	r0, #18
	ldr	r1, .L11
	bl	dprint_vfmw
	ldr	r2, [r5, #680]
	cmp	r2, #0
	beq	.L7
	ldr	r3, [r5, #684]
	cmp	r3, #0
	beq	.L7
	ldr	r1, [r5, #688]
	cmp	r1, #0
	beq	.L7
	ldr	ip, [r1, #16]
	mov	r0, #18
	ldr	r3, [r3, #16]
	mov	r5, #1
	ldr	r2, [r2, #16]
	ldr	r1, .L11+4
	str	ip, [sp]
	bl	dprint_vfmw
.L3:
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L7:
	mov	r5, #1
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L9:
	ldr	r1, .L11+8
	mov	r0, #0
	bl	dprint_vfmw
	add	r1, r5, #44032
	add	r1, r1, #32
	ldr	r0, [r4, #3456]
	bl	FSP_ClearNotInVoQueue
	mov	r2, #1
	ldr	r1, [r4, #3056]
	mov	r5, #0
	ldr	r0, [r4, #3456]
	bl	FSP_ClearLogicFs
	str	r5, [r4, #3056]
	ldr	r0, [r4, #3456]
	bl	FSP_GetNullLogicFs
	str	r5, [r4, #2972]
	str	r0, [r4, #3056]
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L10:
	mov	r2, #75
	ldr	r1, .L11+12
	bl	dprint_vfmw
	b	.L3
.L12:
	.align	2
.L11:
	.word	.LC2
	.word	.LC3
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	Divx3_GetImageBuffer, .-Divx3_GetImageBuffer
	.align	2
	.global	Divx3_ArrangeVHBMem
	.type	Divx3_ArrangeVHBMem, %function
Divx3_ArrangeVHBMem:
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
	ldr	ip, [r2, #48]
	mov	r5, r1
	ldr	r3, [r2, #52]
	cmp	ip, #1
	bls	.L15
	sub	r0, r3, #2
	movw	r1, #510
	cmp	ip, #512
	cmpls	r0, r1
	bhi	.L15
	ldr	r1, [r5]
	ldr	r3, [r1, #708]
	cmp	r3, #0
	ldr	r3, [r1, #28]
	bne	.L18
	cmp	r3, #25
	beq	.L42
.L19:
	ldr	r6, [r2, #56]
	mov	r7, #5
	ldr	r9, [r2, #60]
	mov	r4, #2
	mov	r8, #4
.L25:
	ldr	r3, .L44
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #68
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5]
	mov	r2, #0
	str	r6, [fp, #-60]
	str	r9, [fp, #-56]
	ldr	r3, [r3, #28]
	strb	r2, [fp, #-67]
	cmp	r3, #24
	beq	.L31
	uxtb	r3, r4
	strb	r8, [fp, #-65]
	strb	r7, [fp, #-63]
.L35:
	add	r6, r5, #40960
	sub	r1, fp, #68
	mov	r4, #0
	strb	r3, [fp, #-62]
	ldr	r0, [r6, #3456]
	strb	r4, [fp, #-66]
	bl	FSP_ConfigInstance
	cmp	r0, r4
	bne	.L41
	ldr	r1, [r5]
	sub	r3, fp, #72
	ldr	r0, [r6, #3456]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L43
	cmp	r0, #0
	moveq	r0, #1
	streqb	r0, [r5, #186]
	beq	.L40
.L33:
	ldr	r1, .L44+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L40
.L15:
	mov	r2, ip
	ldr	r1, .L44+8
	mov	r0, #0
	bl	dprint_vfmw
.L41:
	mov	r0, #0
.L40:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L18:
	cmp	r3, #25
	bne	.L19
	ldr	r6, [r2, #56]
	ldr	r0, [r1, #668]
	ldr	r3, [r2, #60]
	cmp	r6, r0
	ldr	r2, [r1, #672]
	bhi	.L28
	cmp	r3, r2
	bhi	.L28
	ldr	r2, [r1, #696]
	mov	r9, r3
	ldr	r4, [r1, #692]
	cmp	r2, #0
	add	r8, r4, #2
	beq	.L38
	add	r3, r4, #1
	cmp	r3, #17
	movlt	r4, r3
	movge	r4, #17
.L30:
	ldrb	r7, [r1, #716]	@ zero_extendqisi2
	b	.L25
.L31:
	mov	r3, #1
	strb	r7, [fp, #-63]
	strb	r3, [fp, #-65]
	b	.L35
.L28:
	stmia	sp, {r0, r2}
	mov	r2, r6
	ldr	r1, .L44+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L40
.L42:
	ldr	r0, [r2, #56]
	ldr	r6, [r1, #668]
	ldr	r3, [r2, #60]
	cmp	r0, r6
	ldr	r9, [r1, #672]
	bhi	.L21
	cmp	r3, r9
	bhi	.L21
	ldrb	r0, [r5, #186]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L40
	ldr	r2, [r1, #696]
	ldr	r3, [r1, #692]
	cmp	r2, #0
	add	r8, r3, #2
	beq	.L38
	add	r3, r3, #1
	cmp	r3, #17
	movlt	r4, r3
	movge	r4, #17
	b	.L30
.L38:
	mov	r4, #1
	b	.L30
.L21:
	mov	r2, r0
	stmia	sp, {r6, r9}
	ldr	r1, .L44+12
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L40
.L43:
	add	r0, r5, #44032
	add	r0, r0, #32
	bl	ResetVoQueue
	b	.L33
.L45:
	.align	2
.L44:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	Divx3_ArrangeVHBMem, .-Divx3_ArrangeVHBMem
	.align	2
	.global	Divx3_SetImgFormat
	.type	Divx3_SetImgFormat, %function
Divx3_SetImgFormat:
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
	add	r5, r0, #40960
	mov	r6, r0
	ldr	r1, [r5, #3060]
	ldr	r0, [r5, #3456]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r7, [r5, #2848]
	mov	lr, #5
	ldrb	r2, [r4, #124]	@ zero_extendqisi2
	mov	r1, #1
	ldrb	r3, [r4, #125]	@ zero_extendqisi2
	and	ip, r7, #3
	bfi	r2, r7, #0, #2
	mov	r10, #0
	and	r3, r3, #252
	and	r2, r2, #227
	orr	r3, r3, #12
	bfi	r2, lr, #5, #3
	bfi	r3, r1, #4, #2
	strb	r2, [r4, #124]
	strb	r3, [r4, #125]
	mov	r1, r10
	ldr	r3, [r4, #124]
	bfc	r3, #14, #3
	str	r3, [r4, #124]
	mov	r3, r3, lsr #16
	bfc	r3, #1, #1
	strb	r3, [r4, #126]
	ldr	r3, [r6]
	ldrb	r2, [r4, #126]	@ zero_extendqisi2
	ldr	r3, [r3, #592]
	str	ip, [r4, #116]
	sub	r3, r3, #1
	str	ip, [r4, #120]
	clz	r3, r3
	str	r10, [r4, #112]
	mov	r3, r3, lsr #5
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #126]
	ldr	r3, [r5, #2896]
	mov	r3, r3, asl #4
	str	r3, [r4, #128]
	ldr	r3, [r5, #2900]
	mov	r3, r3, asl #4
	str	r3, [r4, #132]
	bl	SetAspectRatio
	ldr	r3, [r6]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L52
.L48:
	mov	r2, #5
	mov	r3, #0
	str	r2, [r4, #412]
	mov	r2, #1
	strb	r3, [r4, #400]
	mov	r3, #8
	strb	r2, [r4, #407]
	strb	r2, [r4, #405]
	str	r3, [r4, #416]
	str	r3, [r4, #424]
	str	r3, [r4, #420]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L52:
	ldr	r3, [r4, #132]
	add	r0, r4, #544
	ldr	r2, [r4, #164]
	add	lr, r4, #560
	add	r3, r3, #15
	ldr	r1, [r4, #44]
	mov	ip, r2, asl #4
	mov	r3, r3, lsr #4
	add	r5, r1, r2
	mul	r3, r3, ip
	add	ip, r3, r1
	str	ip, [r4, #48]
	ldrd	r8, [r0]
	add	r2, ip, r2
	mov	r0, ip
	adds	r6, r8, r3
	adc	r7, r9, r3, asr #31
	strd	r6, [lr, #-8]
	str	ip, [r4, #32]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	str	r5, [r4, #36]
	strd	r8, [lr]
	str	r1, [r4, #60]
	bl	MEM_Phy2Vir
	ldr	r3, [r4, #32]
	str	r10, [r4, #572]
	str	r3, [r4, #64]
	str	r0, [r4, #568]
	b	.L48
	UNWIND(.fnend)
	.size	Divx3_SetImgFormat, .-Divx3_SetImgFormat
	.align	2
	.global	Divx3_RecordVFMWState
	.type	Divx3_RecordVFMWState, %function
Divx3_RecordVFMWState:
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Divx3_RecordVFMWState, .-Divx3_RecordVFMWState
	.align	2
	.global	Divx3_WritePicMsg
	.type	Divx3_WritePicMsg, %function
Divx3_WritePicMsg:
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
	add	r3, r0, #40960
	ldr	r2, [r3, #2848]
	str	r2, [r0, #12]
	ldr	r2, [r3, #2896]
	str	r2, [r0, #16]
	ldr	r2, [r3, #2900]
	str	r2, [r0, #20]
	ldr	r2, [r3, #2852]
	str	r2, [r0, #24]
	ldr	r2, [r3, #2856]
	str	r2, [r0, #28]
	ldr	r2, [r3, #2864]
	str	r2, [r0, #32]
	ldr	r2, [r3, #2872]
	str	r2, [r0, #36]
	ldr	r2, [r3, #2876]
	str	r2, [r0, #40]
	ldr	r2, [r3, #2880]
	str	r2, [r0, #44]
	ldr	r2, [r3, #2884]
	str	r2, [r0, #48]
	ldr	r2, [r3, #2888]
	str	r2, [r0, #52]
	ldr	r3, [r3, #2892]
	str	r3, [r0, #56]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Divx3_WritePicMsg, .-Divx3_WritePicMsg
	.align	2
	.global	Divx3_WriteReg
	.type	Divx3_WriteReg, %function
Divx3_WriteReg:
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
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Divx3_WriteReg, .-Divx3_WriteReg
	.align	2
	.global	Divx3_DecodeDecide
	.type	Divx3_DecodeDecide, %function
Divx3_DecodeDecide:
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
	ldrb	r5, [r0, #186]	@ zero_extendqisi2
	add	r6, r0, #40960
	mov	r4, r0
	cmp	r5, #0
	ldr	r7, [r6, #2848]
	beq	.L85
	ldrb	r3, [r0, #187]	@ zero_extendqisi2
	sub	r3, r3, #2
	cmp	r3, #1
	ldr	r3, [r0]
	ldr	r2, [r3, #8]
	bls	.L86
.L60:
	uxtb	r3, r2
	strb	r3, [r4, #187]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L66
.L68:
	.word	.L64
	.word	.L64
	.word	.L61
	.word	.L63
	.word	.L64
.L87:
	mov	r2, r7
	ldr	r1, .L90
	mov	r0, #18
	bl	dprint_vfmw
.L63:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L86:
	cmp	r2, #4
	cmpne	r2, #1
	bhi	.L60
	ldr	r1, .L90+4
	mov	r0, #2
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r6, #3056]
	mov	r5, #0
	ldr	r0, [r6, #3456]
	bl	FSP_ClearLogicFs
	str	r5, [r6, #3056]
	ldr	r0, [r6, #3456]
	bl	FSP_GetNullLogicFs
	str	r5, [r6, #2972]
	str	r0, [r6, #3056]
	ldr	r3, [r4]
	ldr	r2, [r3, #8]
	b	.L60
.L85:
	ldr	r1, .L90+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L61:
	cmp	r7, #0
	bne	.L87
.L62:
	ldr	r1, [r6, #3056]
	ldr	r0, [r6, #3456]
	bl	FSP_GetFsImagePtr
.L83:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L64:
	cmp	r7, #0
	beq	.L62
	ldr	r3, [r6, #2972]
	cmp	r3, #0
	beq	.L88
	ldr	r1, [r6, #3056]
	ldr	r0, [r6, #3456]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L89
	ldr	r3, [r4]
	ldr	r2, [r5, #184]
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L83
	ldr	r1, .L90+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L66:
	ldr	r1, .L90+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L88:
	ldr	r2, .L90+20
	mov	r0, #18
	ldr	r1, .L90+24
	bl	dprint_vfmw
	b	.L63
.L89:
	movw	r3, #483
	ldr	r2, .L90+28
	ldr	r1, .L90+32
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L91:
	.align	2
.L90:
	.word	.LC9
	.word	.LC8
	.word	.LC7
	.word	.LC14
	.word	.LC12
	.word	.LC10
	.word	.LC11
	.word	.LANCHOR0
	.word	.LC13
	UNWIND(.fnend)
	.size	Divx3_DecodeDecide, .-Divx3_DecodeDecide
	.align	2
	.global	Divx3_GetPictureHeader
	.type	Divx3_GetPictureHeader, %function
Divx3_GetPictureHeader:
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
	mov	r1, #2
	mov	r6, r2
	mov	r5, r0
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4]
	bls	.L93
.L96:
	mov	r3, #0
.L94:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L93:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4]
	cmp	r3, #0
	str	r0, [r4, #4]
	beq	.L114
	cmp	r6, #0
	mov	r1, #1
	streq	r6, [r4, #8]
	mov	r0, r5
	ldrne	r3, [r4, #8]
	str	r6, [r4, #20]
	rsbne	r3, r3, #1
	strne	r3, [r4, #8]
	bl	BsGet
	mov	r1, #2
	str	r0, [r4, #16]
	mov	r0, r5
	bl	BsShow
	str	r0, [r4, #36]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L109
.L111:
	.word	.L110
	.word	.L110
	.word	.L113
	.word	.L113
.L113:
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
.L109:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	str	r0, [r4, #40]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	str	r0, [r4, #44]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L114:
	mov	r3, #1
	mov	r1, #5
	str	r3, [r4, #8]
	mov	r0, r5
	bl	BsGet
	sub	r3, r0, #23
	str	r0, [r4, #12]
	cmp	r0, #26
	cmpne	r3, #1
	bhi	.L96
	mov	r1, #2
	mov	r0, r5
	bl	BsShow
	str	r0, [r4, #24]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L97
.L99:
	.word	.L98
	.word	.L98
	.word	.L101
	.word	.L101
.L110:
	mov	r1, #1
	mov	r0, r5
	bl	BsSkip
	b	.L109
.L101:
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
.L97:
	mov	r1, #2
	mov	r0, r5
	bl	BsShow
	str	r0, [r4, #28]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L102
.L104:
	.word	.L103
	.word	.L103
	.word	.L106
	.word	.L106
.L106:
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
.L102:
	mov	r0, r5
	mov	r1, #1
	bl	BsGet
	mov	r3, #1
	str	r0, [r4, #32]
	b	.L94
.L98:
	mov	r1, #1
	mov	r0, r5
	bl	BsSkip
	b	.L97
.L103:
	mov	r1, #1
	mov	r0, r5
	bl	BsSkip
	b	.L102
	UNWIND(.fnend)
	.size	Divx3_GetPictureHeader, .-Divx3_GetPictureHeader
	.align	2
	.global	DIVX3DEC_Init
	.type	DIVX3DEC_Init, %function
DIVX3DEC_Init:
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
	ldr	r3, .L119
	add	r5, r0, #40960
	mov	r7, r1
	movw	r2, #44432
	ldr	r8, [r5, #3448]
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r4, r0
	mov	r6, r1
	blx	r3
	add	r0, r4, #44032
	str	r8, [r5, #3448]
	add	r0, r0, #32
	bl	ResetVoQueue
	str	r7, [r4]
	mov	r3, #1
	str	r3, [r5, #2944]
	ldr	r3, [r7, #8]
	mov	r0, r4
	strb	r6, [r4, #186]
	strb	r3, [r4, #187]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r5, #3456]
	mov	r0, r6
	beq	.L118
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L118:
	ldr	r1, .L119+4
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L120:
	.align	2
.L119:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC15
	UNWIND(.fnend)
	.size	DIVX3DEC_Init, .-DIVX3DEC_Init
	.align	2
	.global	DIVX3DEC_Destroy
	.type	DIVX3DEC_Destroy, %function
DIVX3DEC_Destroy:
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
	add	r3, r0, #40960
	ldr	r1, .L122
	mov	r0, #2
	ldr	r2, [r3, #2968]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L123:
	.align	2
.L122:
	.word	.LC16
	UNWIND(.fnend)
	.size	DIVX3DEC_Destroy, .-DIVX3DEC_Destroy
	.align	2
	.global	DIVX3DEC_Decode
	.type	DIVX3DEC_Decode, %function
DIVX3DEC_Decode:
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
	UNWIND(.pad #188)
	sub	sp, sp, #188
	mov	r2, #96
	mov	r5, r1
	mov	r9, r0
	mov	r1, #0
	sub	r0, fp, #140
	bl	memset
	cmp	r5, #0
	mov	r4, #0
	str	r4, [fp, #-180]
	str	r4, [fp, #-176]
	str	r4, [fp, #-172]
	str	r4, [fp, #-168]
	str	r4, [fp, #-164]
	str	r4, [fp, #-160]
	str	r4, [fp, #-156]
	str	r4, [fp, #-152]
	str	r4, [fp, #-148]
	str	r4, [fp, #-144]
	beq	.L210
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L211
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r5, #12]
	cmp	r3, #9
	ble	.L213
	ldr	r7, .L224
	add	r3, r9, #40960
	add	r10, r9, #8
	mov	r2, #172
	mov	r6, r3
	str	r3, [fp, #-200]
	mov	r1, r4
	ldr	r3, [r7, #48]
	mov	r0, r10
	blx	r3
	str	r4, [r9, #260]
	ldr	r3, [r5, #12]
	str	r3, [r6, #2952]
	ldr	r3, [r5, #8]
	str	r3, [r9, #264]
	ldr	r3, [r5]
	str	r3, [r9, #212]
	ldr	r2, [r5, #12]
	str	r2, [r9, #268]
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	str	r3, [r9, #272]
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L130
	ldr	r3, [r5, #88]
	str	r3, [r9, #276]
	ldr	r3, [r5, #80]
	str	r3, [r9, #216]
	ldr	r3, [r5, #92]
	str	r3, [r9, #280]
	ldrb	r3, [r5, #85]	@ zero_extendqisi2
	str	r3, [r9, #284]
	ldrb	r3, [r5, #85]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L214
.L131:
	movw	r3, #65525
	sub	r1, r2, #10
	movt	r3, 47
	cmp	r1, r3
	movhi	r4, #0
	bhi	.L126
	ldr	r1, [r9, #212]
	cmp	r1, #0
	moveq	r4, r1
	beq	.L126
	add	r8, r9, #44032
	mov	r0, r8
	bl	BsInit
	mov	r0, r8
	bl	BsResidBits
	mov	r1, #32
	str	r0, [fp, #-204]
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	rev	r4, r0
	mov	r0, r8
	add	r3, r4, #15
	str	r4, [fp, #-84]
	mov	r3, r3, lsr #4
	str	r3, [fp, #-92]
	bl	BsGet
	sub	r1, r4, #32
	rev	r3, r0
	str	r3, [fp, #-80]
	sub	r0, r3, #32
	add	r2, r3, #15
	cmp	r1, #1888
	cmpls	r0, #1056
	mov	r2, r2, lsr #4
	str	r2, [fp, #-88]
	movhi	ip, #1
	movls	ip, #0
	bhi	.L215
	ldr	r2, [fp, #-200]
	sub	r1, fp, #140
	mov	r0, r8
	str	ip, [fp, #-208]
	ldr	r3, [r2, #2856]
	ldr	r2, [r2, #2944]
	str	r3, [fp, #-132]
	bl	Divx3_GetPictureHeader
	ldr	ip, [fp, #-208]
	cmp	r0, #1
	mov	r4, r0
	bne	.L216
	ldr	r3, [fp, #-200]
	ldr	r3, [r3, #2972]
	cmp	r3, #0
	bne	.L134
	ldr	r2, [fp, #-140]
	cmp	r2, #0
	bne	.L217
.L134:
	ldr	r2, [fp, #-92]
	ldr	r1, [fp, #-88]
	ldrb	r0, [r9, #186]	@ zero_extendqisi2
	mul	r3, r2, r1
	cmp	r0, #0
	str	r3, [fp, #-76]
	beq	.L135
	ldr	r3, [fp, #-200]
	ldr	r3, [r3, #2896]
	cmp	r2, r3
	beq	.L218
.L135:
	ldr	r3, .L224+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L137
	ldr	r6, [fp, #-200]
	mov	r3, #8
	strh	r2, [fp, #-184]	@ movhi
	sub	r2, fp, #188
	strh	r1, [fp, #-182]	@ movhi
	mov	r1, #2
	ldr	r0, [r6, #2900]
	ldr	lr, [r6, #2896]
	strh	r0, [fp, #-186]	@ movhi
	strh	lr, [fp, #-188]	@ movhi
	ldr	r0, [r6, #3456]
	blx	ip
.L137:
	ldr	r3, [fp, #-200]
	ldr	r0, [r3, #3456]
	bl	FSP_GetFspType
	subs	lr, r0, #0
	bne	.L138
	ldr	r0, [fp, #-200]
	sub	r3, fp, #44
	sub	r2, fp, #192
	sub	r1, fp, #196
	str	lr, [r3, #-144]!
	ldr	r0, [r0, #3456]
	str	lr, [fp, #-196]
	str	lr, [fp, #-192]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r9]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	beq	.L219
.L138:
	ldr	r6, [fp, #-200]
	mov	r2, #1
	ldr	r1, [r6, #3056]
	ldr	r0, [r6, #3456]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r6, #3056]
	add	r3, r9, #44032
	ldr	r0, [r6, #3456]
	str	r6, [fp, #-200]
	mov	r6, r3
	bl	FSP_GetNullLogicFs
	ldr	ip, [fp, #-200]
	add	r3, r6, #32
	mov	r2, #0
	mov	r1, r3
	str	r2, [ip, #2972]
	mov	r6, r3
	str	r0, [ip, #3056]
	ldr	r0, [ip, #3456]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-88]
	cmp	r2, #512
	bhi	.L145
	cmp	r3, #512
	bhi	.L145
	ldr	r1, [r9]
	ldr	r0, [r1, #708]
	cmp	r0, #0
	bne	.L147
	ldr	r1, [r1, #28]
	cmp	r1, #25
	beq	.L220
.L147:
	ldr	r3, [fp, #-200]
	ldr	r0, [r3, #3456]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L149
.L209:
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-88]
.L148:
	ldr	r1, .L224+8
	mov	r0, #1
	bl	dprint_vfmw
	sub	r2, fp, #140
	mov	r1, r9
	mov	r0, #6
	bl	Divx3_ArrangeVHBMem
	cmp	r0, #1
	bne	.L221
.L136:
	ldr	r3, [fp, #-140]
	add	r0, r9, #43776
	mov	r2, #96
	sub	r1, fp, #140
	cmp	r3, #0
	add	r0, r0, #32
	ldrne	r3, [fp, #-200]
	moveq	r3, #23
	ldrne	r3, [r3, #2860]
	mov	r6, r3
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [fp, #-140]
	mov	r0, r9
	cmp	r3, #0
	ldrne	r2, [fp, #-200]
	movne	r3, r6
	strne	r3, [r2, #2860]
	bl	Divx3_DecodeDecide
	cmp	r0, #1
	mov	r7, r0
	beq	.L152
	ldr	r1, .L224+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #0
	b	.L126
.L213:
	ldr	r1, .L224+16
	mov	r0, #1
	bl	dprint_vfmw
.L126:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L214:
	ldr	r6, [fp, #-200]
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #3456]
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r5, #96]
	ldr	r0, [r6, #3456]
	bl	SM_ReleaseStreamSeg
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L211:
	ldr	r1, .L224+20
	mov	r0, #1
	mov	r4, r3
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L130:
	str	r4, [r9, #276]
	str	r4, [r9, #216]
	str	r4, [r9, #280]
	str	r4, [r9, #284]
	b	.L131
.L215:
	mov	r2, r4
	ldr	r1, .L224+24
	mov	r0, #1
	mov	r4, #0
	bl	dprint_vfmw
	b	.L126
.L216:
	ldr	r1, .L224+28
	mov	r0, #1
	mov	r4, ip
	bl	dprint_vfmw
	b	.L126
.L210:
	add	ip, r9, #40960
	ldr	r1, .L224+32
	mov	r0, #1
	mov	r4, r5
	ldr	r2, [ip, #2968]
	bl	dprint_vfmw
	b	.L126
.L212:
	ldr	r1, .L224+36
	mov	r0, #1
	mov	r4, r3
	bl	dprint_vfmw
	b	.L126
.L145:
	ldr	r1, .L224+40
	mov	r0, #18
	bl	dprint_vfmw
	mov	r4, #0
	b	.L126
.L221:
	ldr	r1, .L224+44
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #0
	b	.L126
.L218:
	ldr	r3, [fp, #-200]
	ldr	r3, [r3, #2900]
	cmp	r1, r3
	bne	.L135
	b	.L136
.L219:
	ldr	r3, [fp, #-188]
	cmp	r3, #0
	bgt	.L141
	ldr	r3, [fp, #-192]
	cmp	r3, #32
	bgt	.L141
	ldr	r3, [r9, #4]
	cmp	r3, #0
	bne	.L141
	ldr	r3, [fp, #-200]
	ldr	ip, [r3, #2964]
	cmp	ip, #0
	beq	.L138
	ldr	r3, [r3, #2896]
	cmp	r3, #0
	beq	.L138
	ldr	r6, [fp, #-200]
	ldr	r3, [fp, #-88]
	ldr	r0, [r6, #3460]
	cmp	r3, r0
	beq	.L138
	ldr	lr, [fp, #-92]
	ldr	r1, [r6, #3464]
	cmp	lr, r1
	beq	.L138
	str	r3, [sp, #12]
	mov	r3, ip
	stmib	sp, {r0, lr}
	mov	r0, r2
	str	r1, [sp]
	ldr	r1, .L224+48
	bl	dprint_vfmw
	ldr	r3, .L224+4
	ldr	r2, [fp, #-88]
	ldr	ip, [r3]
	ldr	r3, [fp, #-92]
	cmp	ip, #0
	str	r2, [r6, #3460]
	str	r3, [r6, #3464]
	beq	.L138
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r6, #3456]
	blx	ip
	b	.L138
.L220:
	ldrb	r1, [r9, #186]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L148
.L149:
	mov	r0, r6
	bl	ResetVoQueue
	b	.L209
.L217:
	ldr	r1, .L224+52
	mov	r4, r3
	bl	dprint_vfmw
	b	.L126
.L152:
	mov	r0, r9
	bl	Divx3_GetImageBuffer
	subs	r3, r0, #0
	beq	.L222
	ldr	r3, [fp, #-200]
	ldr	r1, [r3, #3060]
	ldr	r0, [r3, #3456]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L154
	ldr	r7, [r9]
	add	r2, r3, #640
	add	lr, r3, #656
	ldr	r1, .L224+56
	mov	r0, #29
	ldrd	r6, [r7, #56]
	strd	r6, [r2]
	ldr	r7, [r9]
	ldrd	r6, [r7, #72]
	strd	r6, [lr, #-8]
	ldr	r7, [r9]
	ldrd	r6, [r7, #88]
	strd	r6, [lr]
	mvn	r6, #0
	ldr	r7, [r9]
	ldr	r7, [r7, #104]
	str	r7, [r3, #8]
	ldr	r7, [r9]
	ldr	r7, [r7, #108]
	str	r7, [r3, #12]
	ldr	r7, [r9]
	ldr	r7, [r7, #112]
	str	r7, [r3, #16]
	ldr	r7, [r9]
	ldr	r7, [r7, #128]
	str	r7, [r3, #20]
	mvn	r7, #0
	ldr	r3, [r9]
	strd	r6, [r3, #56]
	ldrd	r6, [lr, #-8]
	ldrd	r2, [r2]
	strd	r6, [sp]
	bl	dprint_vfmw
	ldr	r6, [fp, #-200]
	ldr	r1, [r6, #3060]
	ldr	r0, [r6, #3456]
	bl	FSP_GetLogicFs
	ldr	r1, [r6, #3056]
	mov	r7, r0
	ldr	r0, [r6, #3456]
	bl	FSP_GetLogicFs
	cmp	r7, #0
	cmpne	r0, #0
	beq	.L155
	ldr	r3, [r7, #680]
	cmp	r3, #0
	beq	.L155
	ldr	r2, [r7, #688]
	cmp	r2, #0
	beq	.L155
	ldr	r2, [r7, #684]
	cmp	r2, #0
	beq	.L155
	ldr	r2, [r0, #680]
	mov	ip, #0
	str	ip, [fp, #-208]
	mov	r0, #13
	cmp	r2, #0
	ldrne	r1, [r2, #16]
	ldreq	r1, [r3, #16]
	ldr	r2, [r9, #168]
	str	r1, [r9, #132]
	ldr	r3, [r7, #680]
	mov	ip, r2
	ldr	r2, [r3, #16]
	str	r2, [r9, #136]
	ldr	lr, [r7, #692]
	str	lr, [r9, #164]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #16]
	stmia	sp, {r1, lr}
	ldr	r1, .L224+60
	str	r3, [r9, #140]
	str	ip, [sp, #8]
	bl	dprint_vfmw
	ldr	r3, [r7, #684]
	mov	r0, r8
	ldr	r3, [r3, #32]
	str	r3, [r9, #144]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #76]
	str	r3, [r9, #148]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #60]
	str	r3, [r9, #152]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #64]
	str	r3, [r9, #156]
	bl	BsResidBits
	ldr	r3, [r5, #8]
	ldr	r2, [fp, #-204]
	bic	r3, r3, #15
	str	r3, [r9, #104]
	ldr	r3, [r5, #8]
	and	r3, r3, #15
	add	r3, r2, r3, lsl #3
	rsb	r3, r0, r3
	mov	r0, r8
	and	r2, r3, #127
	str	r2, [r9, #116]
	mov	r3, r3, lsr #7
	mov	r3, r3, asl #4
	str	r3, [r9, #108]
	bl	BsResidBits
	ldr	ip, [fp, #-208]
	ldr	r3, [fp, #-200]
	str	ip, [r9, #112]
	str	ip, [r9, #120]
	str	ip, [r9, #128]
	str	r0, [r9, #124]
	ldr	r3, [r3, #2860]
	cmp	r3, #24
	beq	.L161
	cmp	r3, #26
	beq	.L162
	cmp	r3, #23
	beq	.L223
	ldr	r1, .L224+64
	mov	r0, #1
	mov	r4, ip
	bl	dprint_vfmw
	b	.L126
.L222:
	ldr	r2, [fp, #-200]
	mov	r4, r3
	ldr	r1, .L224+68
	ldr	r2, [r2, #2968]
	bl	dprint_vfmw
	b	.L126
.L141:
	mvn	r4, #1
	b	.L126
.L155:
	ldr	r3, [fp, #-200]
	mov	r2, #1
	mov	r4, #0
	ldr	r1, [r3, #3060]
	ldr	r0, [r3, #3456]
	bl	FSP_ClearLogicFs
	ldr	r1, .L224+72
	mov	r0, r4
	bl	dprint_vfmw
	b	.L126
.L154:
	mov	r0, r7
	ldr	r1, .L224+76
	mov	r4, r3
	bl	dprint_vfmw
	b	.L126
.L161:
	ldr	r3, [fp, #-200]
	str	ip, [fp, #-180]
	ldr	r2, [r3, #2900]
	ldr	r3, [r3, #2896]
	tst	r2, #1
	mov	r2, r2, lsr #1
	moveq	r5, #2
	mul	r3, r3, r2
	sub	r2, r3, #1
	str	r2, [fp, #-160]
	mov	r2, r3, asl #1
	str	r3, [fp, #-176]
	sub	r3, r2, #1
	str	r3, [fp, #-156]
	beq	.L164
	ldr	r3, [fp, #-200]
	mov	r5, #3
	str	r2, [fp, #-172]
	ldr	r3, [r3, #2912]
	sub	r3, r3, #1
	str	r3, [fp, #-152]
.L164:
	ldr	r2, [fp, #-200]
	cmp	r5, #0
	ldr	r3, [r2, #2848]
	str	r3, [r9, #12]
	ldr	r3, [r2, #2896]
	str	r3, [r9, #16]
	ldr	r3, [r2, #2900]
	str	r3, [r9, #20]
	ldr	r3, [r2, #2852]
	str	r3, [r9, #24]
	ldr	r3, [r2, #2856]
	str	r3, [r9, #28]
	ldr	r3, [r2, #2864]
	str	r3, [r9, #32]
	ldr	r3, [r2, #2872]
	str	r3, [r9, #36]
	ldr	r3, [r2, #2876]
	str	r3, [r9, #40]
	ldr	r3, [r2, #2880]
	str	r3, [r9, #44]
	ldr	r3, [r2, #2884]
	str	r3, [r9, #48]
	ldr	r3, [r2, #2888]
	str	r3, [r9, #52]
	ldr	r3, [r2, #2892]
	str	r5, [r9, #60]
	str	r3, [r9, #56]
	beq	.L167
	sub	lr, fp, #180
	add	r0, r9, #60
	sub	r1, fp, #160
	add	r2, r9, #80
	mov	r3, #0
.L166:
	add	r3, r3, #1
	ldr	r6, [lr], #4
	ldr	ip, [r1], #4
	cmp	r3, r5
	str	r6, [r0, #4]!
	str	ip, [r2, #4]!
	bne	.L166
.L167:
	ldr	r3, [r9]
	str	r10, [r9, #4]
	ldr	r2, [r3, #592]
	str	r2, [r9, #172]
	ldr	r3, [r3, #632]
	str	r3, [r9, #176]
	b	.L126
.L223:
	ldr	r3, [fp, #-200]
	mov	r5, #1
	str	ip, [fp, #-180]
	ldr	r3, [r3, #2912]
	sub	r3, r3, #1
	str	r3, [fp, #-160]
	b	.L164
.L162:
	ldr	r3, [fp, #-200]
	str	ip, [fp, #-180]
	ldr	r2, [r3, #2900]
	ldr	r3, [r3, #2896]
	tst	r2, #3
	mov	r2, r2, lsr #2
	moveq	r5, #4
	mul	r3, r3, r2
	sub	r2, r3, #1
	str	r2, [fp, #-160]
	mov	r2, r3, asl #1
	mov	r1, r3, asl #2
	add	r0, r2, r3
	str	r3, [fp, #-176]
	str	r2, [fp, #-172]
	sub	r3, r0, #1
	sub	r2, r2, #1
	str	r3, [fp, #-152]
	str	r0, [fp, #-168]
	sub	r3, r1, #1
	str	r2, [fp, #-156]
	str	r3, [fp, #-148]
	beq	.L164
	ldr	r3, [fp, #-200]
	mov	r5, #5
	str	r1, [fp, #-164]
	ldr	r3, [r3, #2912]
	sub	r3, r3, #1
	str	r3, [fp, #-144]
	b	.L164
.L225:
	.align	2
.L224:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LC26
	.word	.LC28
	.word	.LC20
	.word	.LC18
	.word	.LC21
	.word	.LC22
	.word	.LC17
	.word	.LC19
	.word	.LC25
	.word	.LC27
	.word	.LC24
	.word	.LC23
	.word	.LC30
	.word	.LC33
	.word	.LC34
	.word	.LC29
	.word	.LC32
	.word	.LC31
	UNWIND(.fnend)
	.size	DIVX3DEC_Decode, .-DIVX3DEC_Decode
	.align	2
	.global	DIVX3DEC_RecycleImage
	.type	DIVX3DEC_RecycleImage, %function
DIVX3DEC_RecycleImage:
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
	cmp	r0, #0
	mov	r5, r1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r4, r0, #40960
	mov	r2, #0
	ldr	r0, [r4, #3456]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #3456]
	bl	FSP_GetFsImagePtr
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	DIVX3DEC_RecycleImage, .-DIVX3DEC_RecycleImage
	.align	2
	.global	DIVX3DEC_GetRemainImg
	.type	DIVX3DEC_GetRemainImg, %function
DIVX3DEC_GetRemainImg:
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
	ldr	r3, [r0]
	mov	r4, r0
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L244
	add	r6, r0, #40960
	ldr	r1, [r6, #3060]
	ldr	r0, [r6, #3456]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L244
	ldr	r1, [r6, #3060]
	ldr	r0, [r6, #3456]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L243
.L244:
	add	r5, r4, #44032
	add	r5, r5, #32
.L234:
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	GetVoLastImageID
.L243:
	mov	r0, r4
	add	r5, r4, #44032
	bl	Divx3_SetImgFormat
	add	r5, r5, #32
	mov	r3, #1
	str	r3, [r7, #212]
	mov	r2, r3
	ldr	r1, [r6, #3060]
	ldr	r0, [r6, #3456]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #3456]
	mov	r2, r4
	str	r7, [sp]
	mov	r3, r5
	mov	r1, #5
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L231
	mov	r2, #0
	add	r4, r7, #608
	ldr	r1, [r6, #3060]
	mov	r8, #0
	ldr	r0, [r6, #3456]
	mov	r9, #0
	bl	FSP_SetDisplay
	ldr	r1, [r7, #600]
	ldr	r0, [r6, #3456]
	bl	FreeUsdByDec
	strd	r8, [r4, #-8]
	ldr	r1, [r7, #608]
	ldr	r0, [r6, #3456]
	bl	FreeUsdByDec
	strd	r8, [r4]
	b	.L234
.L231:
	ldr	r3, [r7, #184]
	cmp	r3, #100
	bhi	.L234
	ldr	r3, [r7, #128]
	cmp	r3, #31
	bls	.L234
	ldr	r3, [r7, #132]
	cmp	r3, #31
	bls	.L234
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	DIVX3DEC_GetRemainImg, .-DIVX3DEC_GetRemainImg
	.align	2
	.global	DIVX3DEC_VDMPostProc
	.type	DIVX3DEC_VDMPostProc, %function
DIVX3DEC_VDMPostProc:
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
	mov	r6, r1
	mov	r5, r0
	ldr	r1, .L275
	add	r4, r5, #40960
	mov	r7, r2
	mov	r0, #22
	mov	r2, r6
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, #5
	bl	ReleasePacket
	ldr	r1, [r4, #3060]
	ldr	r0, [r4, #3456]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L272
	ldr	r3, [r4, #2848]
	cmp	r3, #0
	andeq	r7, r7, #1
	streq	r7, [r4, #2944]
	cmp	r6, #0
	movlt	r6, #0
	blt	.L249
	cmp	r6, #100
	movge	r6, #100
.L249:
	str	r6, [r0, #184]
	mov	r0, #22
	ldr	r1, .L275+4
	bl	dprint_vfmw
	mov	r0, r5
	bl	Divx3_SetImgFormat
	ldrb	r3, [r5, #187]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L252
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L252
	ldr	r3, [r4, #2972]
	cmp	r3, #0
	ldrne	r1, [r4, #3056]
	mvneq	r1, #0
	str	r1, [r4, #3064]
.L251:
	cmn	r1, #1
	beq	.L254
	ldr	r0, [r4, #3456]
	bl	FSP_GetFsImagePtr
	ldr	r6, [r4, #3064]
	mov	r1, r6
	mov	r7, r0
	ldr	r0, [r4, #3456]
	bl	FSP_GetRef
	mov	r2, r6
	ldr	r1, .L275+8
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r4, #3064]
	ldr	r0, [r4, #3456]
	bl	FSP_SetDisplay
	add	r3, r5, #44032
	ldr	r0, [r4, #3456]
	add	r3, r3, #32
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #5
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L273
.L254:
	ldr	r2, [r4, #2848]
	ldr	r3, [r4, #2968]
	cmp	r2, #1
	add	r3, r3, #1
	str	r3, [r4, #2968]
	beq	.L274
.L255:
	ldr	r2, [r4, #3056]
	mov	r3, #1
	ldr	r1, [r4, #3060]
	str	r3, [r4, #2972]
	cmp	r2, r1
	beq	.L257
	ldr	r1, .L275+12
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r4, #3056]
	ldr	r0, [r4, #3456]
	bl	FSP_SetRef
	ldr	r1, [r4, #3056]
	ldr	r0, [r4, #3456]
	bl	FSP_RemovePmv
	ldr	r1, [r4, #3060]
.L257:
	str	r1, [r4, #3056]
	mov	r2, #1
	ldr	r0, [r4, #3456]
	bl	FSP_SetRef
	ldr	r2, [r4, #3060]
	ldr	r1, .L275+16
	mov	r0, #13
	bl	dprint_vfmw
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L252:
	ldr	r1, [r4, #3060]
	str	r1, [r4, #3064]
	b	.L251
.L273:
	mov	r2, #0
	ldr	r1, [r4, #3064]
	ldr	r0, [r4, #3456]
	bl	FSP_SetDisplay
.L272:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L274:
	ldr	r3, [r4, #2972]
	cmp	r3, #0
	bne	.L255
	b	.L272
.L276:
	.align	2
.L275:
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	UNWIND(.fnend)
	.size	DIVX3DEC_VDMPostProc, .-DIVX3DEC_VDMPostProc
	.align	2
	.global	DIVX3DEC_GetImageBuffer
	.type	DIVX3DEC_GetImageBuffer, %function
DIVX3DEC_GetImageBuffer:
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
	add	r4, r0, #40960
	mov	r5, r0
	ldr	r0, [r4, #3456]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #3456]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L283
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L283:
	add	r1, r5, #44032
	ldr	r0, [r4, #3456]
	add	r1, r1, #32
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	DIVX3DEC_GetImageBuffer, .-DIVX3DEC_GetImageBuffer
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__FUNCTION__.14465, %object
	.size	__FUNCTION__.14465, 19
__FUNCTION__.14465:
	.ascii	"Divx3_DecodeDecide\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"image size abnormal (%dx%d) in MB\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"divx3 actual frame size(%dx%d) exeed max config(%dx" )
	ASCII(.ascii	"%d)\012\000" )
.LC6:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"ERROR: No Img buffer is allocated\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"----------------- divx3 Imode -> %d ---------------" )
	ASCII(.ascii	"---\012\000" )
.LC9:
	ASCII(.ascii	"-----I_MODE, but FrameType is %d-----\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"P-frm\000" )
	.space	2
.LC11:
	ASCII(.ascii	"-----cur framtype is %s, but refnum=%d-----\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"error: DecMode illegal\012\000" )
.LC13:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC14:
	ASCII(.ascii	"dec P frame, fwd ref err(%d) > ref_thr(%d)\012\000" )
.LC15:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC16:
	ASCII(.ascii	"Decoding quits at frm %d\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
.LC18:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet PhyAddr!\012\000" )
.LC19:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet VirAddr!\012\000" )
.LC20:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet len!\012\000" )
.LC21:
	ASCII(.ascii	"ERROR: frm %d, Invalid WxH: %dx%d!\012\000" )
.LC22:
	ASCII(.ascii	"Divx3_GetPictureHeader Error!\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"Can't decode from P frame!\012\000" )
.LC24:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC25:
	ASCII(.ascii	"pic width/height to large,MbWidth = %d, MbHeight = " )
	ASCII(.ascii	"%d\000" )
	.space	2
.LC26:
	ASCII(.ascii	"new seq size %d * %d\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"Divx3_ArrangeVHBMem err\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"Divx3_DecodeDecide err\012\000" )
.LC29:
	ASCII(.ascii	"Fatal Error: frm%d, get image buffer failed\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"FSP_GetFsImagePtr Error!\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"CurFsID abnormal!\012\000" )
	.space	1
.LC33:
	ASCII(.ascii	"dec addr: cur,cur2d,fwd,currpmv,colpmv = %p,%p,%p,%" )
	ASCII(.ascii	"p,%p,%p\012\000" )
.LC34:
	ASCII(.ascii	"vol_mode Error!\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"ErrRatio = %d\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"DEBUG: DEC over\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC39:
	ASCII(.ascii	"++++++++++ ref %d\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
