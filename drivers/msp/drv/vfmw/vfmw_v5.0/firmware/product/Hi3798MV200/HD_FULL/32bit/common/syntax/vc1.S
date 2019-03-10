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
	.file	"vc1.c"
	.text
	.align	2
	.type	VC1_Vfmw_GenerateIntensityMap, %function
VC1_Vfmw_GenerateIntensityMap:
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
	cmp	r2, #31
	subgt	r2, r2, #64
	cmp	r1, #0
	addne	ip, r1, #32
	moveq	r2, r2, asl #7
	mvneq	ip, #63
	rsbeq	r2, r2, #16320
	movne	r2, r2, asl #6
	cmp	r3, #0
	bne	.L13
	add	r3, r2, #32
	sub	r2, r0, #1
	add	r0, r0, #255
.L5:
	usat	r1, #8, r3, asr #6
	strb	r1, [r2, #1]!
	cmp	r2, r0
	add	r3, r3, ip
	bne	.L5
	ldmfd	sp, {fp, sp, pc}
.L13:
	mov	r3, ip, asl #7
	sub	r2, r0, #1
	rsb	r3, r3, #8192
	add	r0, r0, #255
	add	r3, r3, #32
.L6:
	usat	r1, #8, r3, asr #6
	strb	r1, [r2, #1]!
	cmp	r2, r0
	add	r3, r3, ip
	bne	.L6
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_GenerateIntensityMap, .-VC1_Vfmw_GenerateIntensityMap
	.align	2
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5, %function
VC1_Vfmw_UpdataLastPicRNDCTRL.part.5:
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
	add	r2, r0, #8192
	ldrb	r3, [r2, #2415]	@ zero_extendqisi2
	tst	r3, #251
	moveq	r3, #1
	moveq	r1, r3
	beq	.L15
	cmp	r3, #1
	ldreqsb	r3, [r0, #10]
	ldrneb	r1, [r0, #10]	@ zero_extendqisi2
	clzeq	r3, r3
	moveq	r3, r3, lsr #5
	uxtbne	r3, r1
	uxtbeq	r1, r3
.L15:
	strb	r1, [r0, #10]
	strb	r3, [r2, #2434]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5, .-VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
	.align	2
	.global	emp_print
	.type	emp_print, %function
emp_print:
	UNWIND(.fnstart)
	@ args = 4, pretend = 12, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 1
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	UNWIND(.save {r1, r2, r3})
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-16)
	sub	fp, ip, #16
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	emp_print, .-emp_print
	.align	2
	.global	AbandonBitsLenthNoUse
	.type	AbandonBitsLenthNoUse, %function
AbandonBitsLenthNoUse:
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
	moveq	r2, r3
	bne	.L31
.L23:
	ldrb	r3, [r0, #-1]!	@ zero_extendqisi2
	add	r2, r2, #8
	cmp	r3, #0
	beq	.L23
	add	r0, r2, #1
.L24:
	tst	r3, #1
	bne	.L32
.L25:
	mov	r3, r3, lsr #1
	add	r2, r2, #1
	tst	r3, #1
	beq	.L25
	add	r0, r2, #1
	ldmfd	sp, {fp, sp, pc}
.L31:
	mov	r0, #1
	mov	r2, #0
	b	.L24
.L32:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	AbandonBitsLenthNoUse, .-AbandonBitsLenthNoUse
	.align	2
	.global	VC1DEC_Init
	.type	VC1DEC_Init, %function
VC1DEC_Init:
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
	ldr	r3, .L37
	add	r4, r0, #49152
	mov	r8, r1
	movw	r2, #49816
	ldr	r9, [r4, #648]
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r7, r0
	mov	r6, r1
	blx	r3
	add	r0, r7, #49408
	str	r9, [r4, #648]
	add	r0, r0, #48
	mov	r5, #1
	bl	ResetVoQueue
	add	r2, r7, #12288
	ldr	r3, [r8, #32]
	mov	r0, r7
	str	r8, [r7]
	strb	r5, [r2, #449]
	add	r3, r3, #255
	ldr	r1, [r8, #8]
	bic	r3, r3, #255
	add	ip, r3, #2048
	str	r3, [r4, #232]
	str	ip, [r4, #236]
	add	ip, r3, #4096
	str	r1, [r4, #260]
	add	r1, r3, #6144
	str	ip, [r4, #240]
	add	ip, r3, #8192
	str	r1, [r4, #244]
	add	r1, r3, #10240
	str	ip, [r4, #248]
	add	r3, r3, #12288
	str	r1, [r4, #252]
	str	r3, [r4, #256]
	strb	r5, [r2, #450]
	str	r6, [r4, #192]
	str	r6, [r4, #196]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #656]
	beq	.L36
	ldr	r1, .L37+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L36:
	mov	r0, r6
	ldr	r1, .L37+8
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC14
	.word	.LC13
	UNWIND(.fnend)
	.size	VC1DEC_Init, .-VC1DEC_Init
	.align	2
	.global	Vc1SMPSeqHdr
	.type	Vc1SMPSeqHdr, %function
Vc1SMPSeqHdr:
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
	mov	r4, r2
	mov	r2, r1, asl #3
	mov	r1, r0
	sub	r0, fp, #52
	bl	BsInit
	mov	r1, #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #24
	sub	r0, fp, #52
	str	r5, [r4, #8]
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #8
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #8
	add	r5, r5, r0, lsl #16
	sub	r0, fp, #52
	bl	BsGet
	ldr	r3, [r4, #8]
	cmp	r3, #8192
	add	r0, r5, r0, lsl #24
	str	r0, [r4, #12]
	bgt	.L43
	cmp	r0, #8192
	bgt	.L44
	cmp	r3, #31
	ble	.L43
	cmp	r0, #31
	ble	.L44
	mov	r1, #2
	sub	r0, fp, #52
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #16]
	cmp	r0, #1
	bhi	.L46
	mov	r1, #2
	sub	r0, fp, #52
	bl	BsGet
	cmp	r0, #0
	bne	.L46
	mov	r1, #3
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #17]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #18]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #19]
	sub	r0, fp, #52
	bl	BsGet
	cmp	r0, #0
	bne	.L46
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #20]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #21]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #22]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #23]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #24]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #25]
	sub	r0, fp, #52
	bl	BsGet
	subs	r5, r0, #0
	bne	.L46
	mov	r1, #1
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #26]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #27]
	sub	r0, fp, #52
	bl	BsGet
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	mov	r1, #3
	cmp	r3, #0
	strb	r0, [r4, #28]
	sub	r0, fp, #52
	streqb	r5, [r4, #28]
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #29]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #30]
	sub	r0, fp, #52
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #31]
	sub	r0, fp, #52
	bl	BsGet
	sub	r0, fp, #52
	mov	r1, #32
	bl	BsGet
	cmp	r0, #0
	bne	.L52
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L52:
	ldr	r1, .L53
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L46:
	ldr	r3, .L53+4
.L51:
	ldr	r2, .L53+8
	mov	r0, #0
	ldr	r1, .L53+12
	mvn	r5, #0
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L44:
	ldr	r3, .L53+16
	b	.L51
.L43:
	ldr	r3, .L53+20
	b	.L51
.L54:
	.align	2
.L53:
	.word	.LC19
	.word	.LC18
	.word	.LANCHOR0
	.word	.LC16
	.word	.LC17
	.word	.LC15
	UNWIND(.fnend)
	.size	Vc1SMPSeqHdr, .-Vc1SMPSeqHdr
	.align	2
	.global	VC1_SetImgFormat
	.type	VC1_SetImgFormat, %function
VC1_SetImgFormat:
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
	add	r5, r0, #36864
	add	r3, r0, #49152
	mov	r6, r0
	add	r7, r0, #12288
	ldr	r1, [r5, #132]
	ldr	r0, [r3, #656]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r8, #1
	str	r8, [r4, #412]
	ldrb	r3, [r7, #443]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L68
	ldr	ip, .L70
	mov	r3, #0
	mov	r1, r3
	strb	r3, [r4, #400]
	mov	r2, #4
	add	r0, r4, #124
	ldr	r3, [ip, #48]
	blx	r3
	ldrb	r3, [r4, #125]	@ zero_extendqisi2
	orr	r3, r3, #12
	bfi	r3, r8, #4, #2
	strb	r3, [r4, #125]
.L59:
	ldr	r3, [r5, #72]
	cmp	r3, #1920
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	orrls	r3, r3, #2
	bfchi	r3, #1, #1
	strb	r3, [r4, #126]
	ldr	r3, [r6]
	ldr	r3, [r3, #592]
	cmp	r3, #1
	beq	.L69
.L62:
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r4, #126]
.L63:
	ldr	r3, [r5, #76]
	mov	r1, #0
	mov	r0, r4
	str	r3, [r4, #132]
	ldr	r3, [r5, #72]
	str	r3, [r4, #128]
	bl	SetAspectRatio
	ldr	lr, [r7, #240]
	ldr	r3, [r4, #44]
	add	r0, r4, #544
	ldr	r2, [r4, #164]
	add	ip, r4, #560
	add	r1, r3, lr
	str	r1, [r4, #48]
	ldrd	r6, [r0]
	add	r10, r1, r2
	mov	r0, r1
	add	r2, r3, r2
	adds	r8, r6, lr
	adc	r9, r7, #0
	strd	r8, [ip, #-8]
	str	r1, [r4, #32]
	str	r3, [r4, #28]
	str	r2, [r4, #36]
	str	r10, [r4, #40]
	strd	r6, [ip]
	str	r3, [r4, #60]
	bl	MEM_Phy2Vir
	ldr	r3, [r4, #128]
	mov	r2, #0
	str	r2, [r4, #572]
	add	r3, r3, #508
	mov	r2, #8
	add	r3, r3, #3
	mov	r1, #1
	bic	r3, r3, #508
	bic	r3, r3, #3
	mov	r3, r3, lsr #5
	str	r0, [r4, #568]
	ldr	r0, [r4, #32]
	str	r0, [r4, #64]
	ldr	r0, [r5, #76]
	str	r0, [r4, #140]
	ldr	r0, [r5, #72]
	strb	r1, [r4, #407]
	str	r3, [r4, #168]
	str	r0, [r4, #136]
	strb	r1, [r4, #405]
	str	r2, [r4, #416]
	str	r2, [r4, #424]
	str	r2, [r4, #420]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L68:
	mov	r3, #4
	ldrb	r2, [r4, #125]	@ zero_extendqisi2
	strb	r3, [r4, #400]
	mov	r1, #1
	ldrb	r3, [r6, #16]	@ zero_extendqisi2
	ubfx	r2, r2, #2, #2
	add	r3, r3, r8
	orr	r3, r3, r2
	cmp	r3, #3
	andls	r2, r3, #3
	ldrb	r3, [r4, #125]	@ zero_extendqisi2
	movhi	r2, #0
	bfi	r3, r2, #2, #2
	bfi	r3, r1, #0, #2
	bfi	r3, r1, #4, #2
	strb	r3, [r4, #125]
	b	.L59
.L69:
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	tst	r3, #2
	orreq	r3, r3, #4
	streqb	r3, [r4, #126]
	beq	.L63
	b	.L62
.L71:
	.align	2
.L70:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.align	2
	.global	VC1DEC_Destroy
	.type	VC1DEC_Destroy, %function
VC1DEC_Destroy:
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
	.size	VC1DEC_Destroy, .-VC1DEC_Destroy
	.align	2
	.global	VC1DEC_RecycleImage
	.type	VC1DEC_RecycleImage, %function
VC1DEC_RecycleImage:
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
	mov	r5, r1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r4, r0, #49152
	mov	r2, #0
	ldr	r0, [r4, #656]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #656]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L76
	add	r5, r6, #608
	ldr	r0, [r4, #656]
	ldr	r1, [r6, #600]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	strd	r8, [r5, #-8]
	ldr	r0, [r4, #656]
	ldr	r1, [r6, #608]
	bl	FreeUsdByDec
	strd	r8, [r5]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L76:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.align	2
	.global	VC1DEC_GetRemainImg
	.type	VC1DEC_GetRemainImg, %function
VC1DEC_GetRemainImg:
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
	add	r5, r0, #36864
	mov	r4, r0
	add	r8, r0, #12288
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L84
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L95
	add	r6, r0, #49152
	ldr	r1, [r5, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L95
	ldr	r1, [r5, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L93
.L95:
	add	r5, r4, #49408
	add	r5, r5, #48
.L83:
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	GetVoLastImageID
.L93:
	mov	r0, r4
	add	r10, r7, #608
	bl	VC1_SetImgFormat
	mov	r3, #1
	mov	r2, r3
	str	r3, [r7, #212]
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r10, #-8]
	strd	r0, [r10]
	ldr	r0, [r6, #656]
	ldr	r1, [r7, #180]
	bl	FSP_SetDisplay
	ldr	r3, [r5, #44]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L96
.L80:
	add	r5, r4, #49408
	ldr	r0, [r6, #656]
	add	r5, r5, #48
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #1
	mov	r3, r5
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L81
	ldr	r1, [r7, #180]
	mov	r0, r4
	bl	VC1DEC_RecycleImage
	ldr	r1, [r10, #-8]
	ldr	r0, [r6, #656]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	strd	r8, [r10, #-8]
	ldr	r1, [r7, #608]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	strd	r8, [r10]
	b	.L83
.L81:
	ldr	r3, [r7, #184]
	cmp	r3, #100
	bhi	.L83
	ldr	r3, [r7, #128]
	cmp	r3, #31
	bls	.L83
	ldr	r3, [r7, #132]
	cmp	r3, #31
	movhi	r0, #0
	bls	.L83
.L94:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L96:
	strb	r2, [r3, #1]
	mov	r1, #0
	ldr	r2, [r5, #44]
	mov	r3, #3
	strb	r1, [r2]
	strb	r3, [r8, #441]
	b	.L80
.L84:
	mvn	r0, #0
	b	.L94
	UNWIND(.fnend)
	.size	VC1DEC_GetRemainImg, .-VC1DEC_GetRemainImg
	.align	2
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
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
	mov	r5, r1
	sub	r1, r1, #32
	movw	r3, #8160
	cmp	r1, r3
	mov	r7, r0
	mov	r6, r2
	bhi	.L98
	sub	r2, r2, #32
	cmp	r2, r3
	bhi	.L98
	add	ip, r0, #28160
	mov	lr, #0
	add	ip, ip, #224
	mov	r4, lr
.L101:
	str	lr, [ip, #-484]
	add	lr, lr, #1
	cmp	lr, #5
	strb	r4, [ip, #-1703]
	strb	r4, [ip, #-1704]
	add	ip, ip, #1696
	add	ip, ip, #8
	bne	.L101
	ldr	r3, [r7]
	ldr	r4, [r3, #708]
	ldr	r2, [r3, #28]
	cmp	r4, #0
	bne	.L102
	cmp	r2, #25
	beq	.L126
.L122:
	mov	r4, lr
	mov	r8, #3
	mov	r9, #2
.L103:
	ldr	r3, .L129
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #68
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, [r7]
	str	r6, [fp, #-40]
	mov	r3, #0
	str	r5, [fp, #-60]
	ldr	r2, [r2, #28]
	str	r6, [fp, #-56]
	cmp	r2, #24
	str	r5, [fp, #-44]
	strb	r3, [fp, #-68]
	strb	r3, [fp, #-67]
	beq	.L113
	uxtb	r3, r9
	strb	r8, [fp, #-65]
	strb	r4, [fp, #-63]
.L118:
	add	r6, r7, #49152
	sub	r1, fp, #68
	strb	r3, [fp, #-62]
	mov	r5, #0
	ldr	r0, [r6, #656]
	strb	r5, [fp, #-66]
	bl	FSP_ConfigInstance
	subs	r4, r0, #0
	bne	.L114
	ldr	r1, [r7]
	sub	r3, fp, #72
	ldr	r0, [r6, #656]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L127
	cmp	r0, #0
	bne	.L116
.L120:
	mov	r4, #1
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L98:
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L129+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r4, #0
.L125:
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L102:
	cmp	r2, #25
	bne	.L122
	ldr	r2, [r3, #668]
	ldr	r1, [r3, #672]
	cmp	r5, r2
	bhi	.L110
	cmp	r6, r1
	bhi	.L110
	ldr	r1, [r3, #696]
	ldr	r2, [r3, #692]
	cmp	r1, #0
	add	r8, r2, #2
	moveq	r9, #1
	bne	.L128
.L112:
	ldrb	r4, [r3, #716]	@ zero_extendqisi2
	b	.L103
.L114:
	ldr	r1, .L129+8
	mov	r0, r5
	bl	dprint_vfmw
	mov	r4, r5
	mov	r0, r4
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L126:
	ldr	r2, [r3, #668]
	cmp	r5, r2
	ldrhi	r0, [r3, #672]
	bhi	.L105
	ldr	r1, [r3, #672]
	cmp	r6, r1
	mov	r0, r1
	bhi	.L105
	add	r0, r7, #12288
	ldrb	r0, [r0, #440]	@ zero_extendqisi2
	tst	r0, #8
	bne	.L120
	ldr	ip, [r3, #696]
	ldr	r0, [r3, #692]
	cmp	ip, #0
	add	r8, r0, #2
	moveq	r9, #1
	beq	.L108
	add	r9, r0, #1
	cmp	r9, #17
	movcs	r9, #17
.L108:
	ldrb	r4, [r3, #716]	@ zero_extendqisi2
	mov	r6, r1
	mov	r5, r2
	b	.L103
.L113:
	mov	r3, #1
	strb	r4, [fp, #-63]
	strb	r3, [fp, #-65]
	b	.L118
.L110:
	str	r1, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	mov	r0, #0
	mov	r2, r5
	ldr	r1, .L129+12
	bl	dprint_vfmw
	mov	r4, #0
	b	.L125
.L127:
	add	r0, r7, #49408
	add	r0, r0, #48
	bl	ResetVoQueue
.L116:
	ldr	r1, .L129+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L125
.L128:
	add	r9, r2, #1
	cmp	r9, #17
	movcs	r9, #17
	b	.L112
.L105:
	str	r0, [sp, #4]
	mov	r3, r6
	str	r2, [sp]
	mov	r0, #0
	mov	r2, r5
	ldr	r1, .L129+12
	bl	dprint_vfmw
	b	.L125
.L130:
	.align	2
.L129:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	.LC23
	.word	.LC21
	.word	.LC22
	UNWIND(.fnend)
	.size	VC1_ArrangeVahbMem, .-VC1_ArrangeVahbMem
	.align	2
	.global	VC1_WritePicMsg
	.type	VC1_WritePicMsg, %function
VC1_WritePicMsg:
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
	add	r7, r0, #36864
	add	r5, r0, #49152
	mov	r6, r0
	mov	r4, r1
	add	r8, r0, #12288
	ldr	r1, [r7, #132]
	ldr	r0, [r5, #656]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L154
	add	r3, r8, #3536
	ldrsb	r2, [r3]
	add	r3, r6, #20480
	cmp	r2, #0
	bne	.L155
	strb	r2, [r4, #5]
	ldrb	r1, [r3, #2604]	@ zero_extendqisi2
	strb	r1, [r4, #4]
	ldrb	r1, [r3, #2855]	@ zero_extendqisi2
	cmp	r1, #4
	moveq	r1, #3
	strb	r1, [r4, #3]
	ldr	r1, [r5, #212]
	sub	r1, r1, #1
	strh	r1, [r4, #80]	@ movhi
	ldr	r1, [r5, #208]
	strb	r2, [r4, #8]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r1, [r3, #2607]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	strb	r1, [r4, #6]
	ldrb	r1, [r8, #448]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	strb	r2, [r4, #11]
	strb	r1, [r4, #7]
	ldrb	r1, [r3, #2610]	@ zero_extendqisi2
	strb	r1, [r4, #13]
	ldrb	r1, [r3, #2614]	@ zero_extendqisi2
	strb	r1, [r4, #14]
	ldrb	r1, [r3, #2874]	@ zero_extendqisi2
	strb	r1, [r4, #12]
	ldrb	r1, [r3, #2884]	@ zero_extendqisi2
	strb	r1, [r4, #18]
	ldrb	r1, [r3, #2859]	@ zero_extendqisi2
	strb	r1, [r4, #19]
	ldrb	r1, [r3, #2858]	@ zero_extendqisi2
	strb	r1, [r4, #17]
	ldr	r1, [r3, #2944]
	strb	r1, [r4, #16]
	ldrb	r1, [r3, #2618]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L146
	ldrb	r2, [r3, #2858]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L147:
	ldrb	r1, [r3, #2878]	@ zero_extendqisi2
	add	r2, r4, #12288
	strb	r1, [r4, #24]
	ldrb	r1, [r3, #2877]	@ zero_extendqisi2
	strb	r1, [r4, #23]
	ldrb	r1, [r3, #2612]	@ zero_extendqisi2
	strb	r1, [r4, #22]
	ldrb	r1, [r3, #2876]	@ zero_extendqisi2
	strb	r1, [r4, #25]
	ldr	r1, [r3, #2888]
	strb	r1, [r4, #26]
	ldrb	r1, [r3, #2879]	@ zero_extendqisi2
	strb	r1, [r4, #21]
	ldrb	r1, [r3, #2863]	@ zero_extendqisi2
	strb	r1, [r4, #27]
	ldrb	r1, [r3, #2864]	@ zero_extendqisi2
	strb	r1, [r4, #28]
	ldr	r1, [r7, #44]
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #30]
	ldr	r1, [r7, #40]
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #29]
	ldrb	r1, [r3, #2861]	@ zero_extendqisi2
	strb	r1, [r4, #31]
	ldrb	r1, [r3, #2983]	@ zero_extendqisi2
	strb	r1, [r4, #32]
	ldrb	r1, [r3, #2873]	@ zero_extendqisi2
	strb	r1, [r4, #35]
	ldrb	r1, [r3, #2613]	@ zero_extendqisi2
	strb	r1, [r4, #36]
	ldrb	r1, [r3, #2869]	@ zero_extendqisi2
	strb	r1, [r4, #37]
	ldrb	r1, [r3, #2871]	@ zero_extendqisi2
	strb	r1, [r4, #38]
	ldrb	r1, [r3, #2872]	@ zero_extendqisi2
	strb	r1, [r4, #39]
	ldrb	r1, [r3, #2870]	@ zero_extendqisi2
	strb	r1, [r4, #40]
	ldr	r1, [r3, #2936]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #42]
	ldr	r1, [r3, #2932]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #43]
	ldr	r1, [r3, #2940]
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #45]
	ldrb	r1, [r3, #2856]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	ldrb	r1, [r3, #2868]	@ zero_extendqisi2
	strb	r1, [r4, #49]
	ldrb	r1, [r3, #2867]	@ zero_extendqisi2
	strb	r1, [r4, #48]
	ldr	r1, [r3, #2948]
	str	r1, [r2, #84]
	ldrb	r1, [r3, #2616]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L156
	mov	r1, #0
	mov	ip, r1
	mov	r9, r1
	mov	lr, r1
.L150:
	strb	lr, [r4, #59]
	strb	r9, [r4, #60]
	strb	ip, [r4, #61]
	str	r1, [r0, #436]
	ldrb	r3, [r3, #2604]	@ zero_extendqisi2
	strb	r3, [r0, #414]
.L144:
	ldr	r3, [r7, #140]
	add	r6, r6, #12736
	ldr	r1, .L160
	add	r6, r6, #5
	strh	r3, [r4, #72]	@ movhi
	ldr	r3, [r7, #72]
	strh	r3, [r4, #74]	@ movhi
	ldr	r3, [r7, #76]
	strh	r3, [r4, #76]	@ movhi
	ldrb	r3, [r8, #451]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	ldrb	r3, [r8, #452]	@ zero_extendqisi2
	strb	r3, [r4, #62]
	ldr	r0, [r7, #56]
	adds	r3, r0, #127
	addmi	r3, r0, #254
	mov	r3, r3, asr #7
	mov	r3, r3, asl #4
	str	r3, [r2, #116]
	ldr	r3, [r5, #232]
	str	r3, [r2, #120]
	ldr	r3, [r5, #236]
	str	r3, [r2, #124]
	ldr	r3, [r5, #240]
	str	r3, [r2, #128]
	ldr	r3, [r5, #244]
	str	r3, [r2, #132]
	ldr	r3, [r5, #248]
	str	r3, [r2, #136]
	ldr	r3, [r5, #252]
	str	r3, [r2, #140]
	ldr	r3, [r5, #256]
	str	r3, [r2, #144]
	str	r6, [r4, #64]
	ldr	r2, [r5, #656]
	ldrh	r3, [r4, #78]
	ldr	r2, [r1, r2, asl #2]
	add	r3, r3, #1
	str	r3, [r2, #1428]
	ldr	r3, [r5, #656]
	ldr	r2, [r1, r3, asl #2]
	ldrh	r3, [r4, #80]
	add	r3, r3, #1
	str	r3, [r2, #1432]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L155:
	ldr	r2, [r3, #2996]
	movw	ip, #1704
	strb	r2, [r4, #5]
	ldrb	r2, [r3, #2620]	@ zero_extendqisi2
	strb	r2, [r4, #4]
	ldrb	r2, [r3, #2953]	@ zero_extendqisi2
	cmp	r2, #4
	moveq	r2, #3
	strb	r2, [r4, #3]
	ldr	r2, [r3, #2996]
	cmp	r2, #3
	ldr	r2, [r5, #212]
	addeq	r2, r2, #1
	addeq	r2, r2, r2, lsr #31
	moveq	r2, r2, asr #1
	sub	r2, r2, #1
	strh	r2, [r4, #80]	@ movhi
	ldr	r1, [r5, #208]
	sub	r1, r1, #1
	strh	r1, [r4, #78]	@ movhi
	ldrb	r2, [r3, #2993]	@ zero_extendqisi2
	strb	r2, [r4, #8]
	ldrb	r2, [r3, #2796]	@ zero_extendqisi2
	strb	r2, [r4, #6]
	ldrb	r2, [r3, #2984]	@ zero_extendqisi2
	strb	r2, [r4, #9]
	ldrb	r2, [r8, #448]	@ zero_extendqisi2
	strb	r2, [r4, #7]
	ldr	r1, [r7, #96]
	mla	r1, ip, r1, r8
	add	r1, r1, #15360
	ldrb	r2, [r1, #59]	@ zero_extendqisi2
	strb	r2, [r4, #10]
	ldr	r2, [r7, #112]
	mla	r2, ip, r2, r8
	add	r2, r2, #15360
	add	r2, r2, #56
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	strb	r2, [r4, #11]
	ldrb	r2, [r3, #2982]	@ zero_extendqisi2
	strb	r2, [r4, #15]
	ldrb	r2, [r3, #2797]	@ zero_extendqisi2
	strb	r2, [r4, #13]
	ldrb	r2, [r3, #2801]	@ zero_extendqisi2
	strb	r2, [r4, #14]
	ldrb	r2, [r3, #2952]	@ zero_extendqisi2
	strb	r2, [r4, #12]
	ldrb	r2, [r3, #3120]	@ zero_extendqisi2
	strb	r2, [r4, #18]
	ldrb	r2, [r3, #2955]	@ zero_extendqisi2
	strb	r2, [r4, #19]
	ldrb	r2, [r3, #2962]	@ zero_extendqisi2
	strb	r2, [r4, #17]
	ldr	r2, [r3, #3068]
	strb	r2, [r4, #16]
	ldrb	r2, [r3, #2802]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L137
	ldrb	r2, [r3, #2962]	@ zero_extendqisi2
	cmp	r2, #8
	movhi	r2, #0
	movls	r2, #1
	strb	r2, [r4, #20]
.L138:
	ldrb	r1, [r3, #3114]	@ zero_extendqisi2
	add	r2, r4, #12288
	strb	r1, [r4, #24]
	ldrb	r1, [r3, #3113]	@ zero_extendqisi2
	strb	r1, [r4, #23]
	ldrb	r1, [r3, #2799]	@ zero_extendqisi2
	strb	r1, [r4, #22]
	ldrb	r1, [r3, #3112]	@ zero_extendqisi2
	strb	r1, [r4, #25]
	ldr	r1, [r3, #3124]
	strb	r1, [r4, #26]
	ldrb	r1, [r3, #3115]	@ zero_extendqisi2
	strb	r1, [r4, #21]
	ldrb	r1, [r3, #2966]	@ zero_extendqisi2
	strb	r1, [r4, #27]
	ldrb	r1, [r3, #2967]	@ zero_extendqisi2
	strb	r1, [r4, #28]
	ldrb	r1, [r3, #2985]	@ zero_extendqisi2
	strb	r1, [r4, #34]
	ldrb	r1, [r3, #2977]	@ zero_extendqisi2
	strb	r1, [r4, #33]
	ldrb	ip, [r3, #2993]	@ zero_extendqisi2
	ldr	r1, [r7, #44]
	add	r1, r1, ip
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #30]
	ldr	r1, [r7, #40]
	ldrb	ip, [r3, #2993]	@ zero_extendqisi2
	add	r1, r1, ip
	ldrb	r1, [r1, #1029]	@ zero_extendqisi2
	strb	r1, [r4, #29]
	ldrb	r1, [r3, #2965]	@ zero_extendqisi2
	strb	r1, [r4, #31]
	ldrb	r1, [r3, #2983]	@ zero_extendqisi2
	strb	r1, [r4, #32]
	ldrb	r1, [r3, #2976]	@ zero_extendqisi2
	strb	r1, [r4, #35]
	ldrb	r1, [r3, #2800]	@ zero_extendqisi2
	strb	r1, [r4, #36]
	ldrb	r1, [r3, #2972]	@ zero_extendqisi2
	strb	r1, [r4, #37]
	ldrb	r1, [r3, #2974]	@ zero_extendqisi2
	strb	r1, [r4, #38]
	ldrb	r1, [r3, #2975]	@ zero_extendqisi2
	strb	r1, [r4, #39]
	ldrb	r1, [r3, #2973]	@ zero_extendqisi2
	strb	r1, [r4, #40]
	ldrb	r1, [r3, #2989]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #46]
	ldrb	r1, [r3, #2987]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #42]
	ldrb	r1, [r3, #2991]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #44]
	ldrb	r1, [r3, #2992]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #41]
	ldrb	r1, [r3, #2986]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #43]
	ldrb	r1, [r3, #2990]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #47]
	ldrb	r1, [r3, #2988]	@ zero_extendqisi2
	clz	r1, r1
	mov	r1, r1, lsr #5
	strb	r1, [r4, #45]
	ldrb	r1, [r3, #2954]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	ldrb	r1, [r3, #2971]	@ zero_extendqisi2
	strb	r1, [r4, #49]
	ldrb	r1, [r3, #2970]	@ zero_extendqisi2
	strb	r1, [r4, #48]
	ldrb	r1, [r3, #2981]	@ zero_extendqisi2
	strb	r1, [r4, #53]
	ldrb	r1, [r3, #2978]	@ zero_extendqisi2
	strb	r1, [r4, #54]
	ldrb	r1, [r3, #2979]	@ zero_extendqisi2
	strb	r1, [r4, #51]
	ldrb	r1, [r3, #2980]	@ zero_extendqisi2
	strb	r1, [r4, #52]
	ldr	r1, [r3, #3100]
	str	r1, [r2, #84]
	ldr	r1, [r5, #184]
	str	r1, [r2, #88]
	ldr	r1, [r5, #188]
	str	r1, [r2, #92]
	ldrb	r1, [r3, #2805]	@ zero_extendqisi2
	strb	r1, [r4, #55]
	ldrb	r1, [r3, #2806]	@ zero_extendqisi2
	strb	r1, [r4, #56]
	ldrb	r1, [r3, #2807]	@ zero_extendqisi2
	strb	r1, [r4, #57]
	ldrb	r1, [r3, #2808]	@ zero_extendqisi2
	strb	r1, [r4, #58]
	ldr	r1, [r3, #2996]
	cmp	r1, #3
	beq	.L157
	ldrb	r1, [r3, #2805]	@ zero_extendqisi2
	strb	r1, [r0, #409]
	ldrb	r1, [r3, #2806]	@ zero_extendqisi2
	strb	r1, [r0, #410]
	ldrb	r1, [r3, #2807]	@ zero_extendqisi2
	strb	r1, [r0, #411]
	ldrb	r1, [r3, #2808]	@ zero_extendqisi2
	strb	r1, [r0, #412]
.L143:
	ldrb	r3, [r3, #2620]	@ zero_extendqisi2
	strb	r3, [r0, #414]
	ldrb	r3, [r8, #451]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	b	.L144
.L146:
	cmp	r1, #1
	beq	.L158
	cmp	r1, #2
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L147
.L137:
	cmp	r2, #1
	beq	.L159
	cmp	r2, #2
	moveq	r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L138
.L159:
	ldrb	r2, [r3, #2963]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L138
.L158:
	ldrb	r2, [r3, #2860]	@ zero_extendqisi2
	adds	r2, r2, #0
	movne	r2, #1
	strb	r2, [r4, #20]
	b	.L147
.L157:
	ldrb	r1, [r3, #2993]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L142
	ldrb	r1, [r3, #2805]	@ zero_extendqisi2
	strb	r1, [r0, #409]
	ldrb	r1, [r3, #2806]	@ zero_extendqisi2
	strb	r1, [r0, #410]
	ldrb	r1, [r3, #2807]	@ zero_extendqisi2
	strb	r1, [r0, #411]
	ldrb	r1, [r3, #2808]	@ zero_extendqisi2
	strb	r1, [r0, #412]
	ldrb	r1, [r3, #2993]	@ zero_extendqisi2
.L142:
	cmp	r1, #1
	bne	.L143
	ldrb	r1, [r3, #2805]	@ zero_extendqisi2
	strb	r1, [r0, #404]
	ldrb	r1, [r3, #2806]	@ zero_extendqisi2
	strb	r1, [r0, #405]
	ldrb	r1, [r3, #2807]	@ zero_extendqisi2
	strb	r1, [r0, #406]
	ldrb	r1, [r3, #2808]	@ zero_extendqisi2
	strb	r1, [r0, #407]
	b	.L143
.L156:
	ldr	ip, [r7, #96]
	movw	r9, #1704
	ldr	r1, [r7, #112]
	ldrb	lr, [r3, #2855]	@ zero_extendqisi2
	mla	ip, r9, ip, r8
	sub	lr, lr, #2
	mla	r1, r9, r1, r8
	tst	lr, #253
	add	ip, ip, #14336
	ldrneb	lr, [r3, #2854]	@ zero_extendqisi2
	add	r1, r1, #14336
	ldrb	r9, [ip, #58]	@ zero_extendqisi2
	ldrb	ip, [r1, #58]	@ zero_extendqisi2
	movne	r1, lr
	moveq	r1, ip
	moveq	lr, ip
	b	.L150
.L154:
	movw	r2, #1129
	ldr	r1, .L160+4
	mov	r0, #22
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L161:
	.align	2
.L160:
	.word	s_pstVfmwChan
	.word	.LC24
	UNWIND(.fnend)
	.size	VC1_WritePicMsg, .-VC1_WritePicMsg
	.align	2
	.global	VC1_WriteSliceMsg
	.type	VC1_WriteSliceMsg, %function
VC1_WriteSliceMsg:
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
	add	r3, r0, #20480
	mov	r2, r1
	ldr	ip, .L163
	add	r1, r0, #24064
	ldr	lr, [r3, #3796]
	add	r0, r2, #84
	add	r1, r1, #216
	ldr	ip, [ip, #52]
	strb	lr, [r2, #70]
	ldr	r3, [r3, #3796]
	mov	r2, r3, asl #6
	sub	r2, r2, r3, asl #4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L164:
	.align	2
.L163:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_WriteSliceMsg, .-VC1_WriteSliceMsg
	.align	2
	.global	VC1_CfgVDH
	.type	VC1_CfgVDH, %function
VC1_CfgVDH:
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
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L166
	add	r3, r0, #8192
	ldr	r3, [r3, #2556]
	cmp	r3, #3
	beq	.L171
.L166:
	add	r3, r0, #32768
	add	r6, r1, #12288
	ldr	r3, [r3, #3872]
	sub	r3, r3, #1
	str	r3, [r6, #164]
.L167:
	add	r5, r0, #20480
	ldr	r3, [r6, #256]
	mov	ip, #0
	movw	r4, #1704
	ldr	r2, [r5, #3736]
	and	lr, r3, #1
	cmp	r2, ip
	add	r3, r2, #63
	movlt	r2, r3
	mov	r2, r2, asr #6
	mov	r2, r2, asl #4
	add	r3, r2, #536870913
	add	r3, r3, #81920
	orr	r3, r3, lr, asl #30
	str	r3, [r6, #168]
	ldr	lr, [r5, #3768]
	ldr	r3, [r5, #3752]
	ldr	r2, [r5, #3696]
	mla	lr, r4, lr, r0
	mla	r0, r4, r3, r0
	ldr	r2, [r2, #1152]
	add	r3, lr, #15104
	and	r2, r2, #3
	ldr	r3, [r3]
	add	r0, r0, #15104
	mov	r2, r2, asl #4
	ldr	r0, [r0]
	and	r3, r3, #3
	strb	ip, [r1, #69]
	orr	r3, r2, r3, asl #2
	and	r2, r0, #3
	orr	r3, r3, r2
	strb	r3, [r1, #68]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L171:
	add	r2, r0, #32768
	add	r6, r1, #12288
	ldr	r3, [r2, #3868]
	ldr	r2, [r2, #3864]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	mul	r3, r2, r3
	sub	r3, r3, #1
	str	r3, [r6, #164]
	b	.L167
	UNWIND(.fnend)
	.size	VC1_CfgVDH, .-VC1_CfgVDH
	.align	2
	.global	VC1_Vfmw_GenerateDecPara
	.type	VC1_Vfmw_GenerateDecPara, %function
VC1_Vfmw_GenerateDecPara:
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
	.size	VC1_Vfmw_GenerateDecPara, .-VC1_Vfmw_GenerateDecPara
	.align	2
	.global	VC1DEC_GetImageBuffer
	.type	VC1DEC_GetImageBuffer, %function
VC1DEC_GetImageBuffer:
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
	add	r3, r0, #12288
	mov	r4, r0
	ldrb	r2, [r3, #443]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L184
.L174:
	add	r5, r4, #49152
	ldr	r0, [r5, #656]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L176
	ldr	r0, [r5, #656]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L185
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L184:
	ldrb	r3, [r3, #449]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L174
.L176:
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L185:
	add	r1, r4, #49408
	ldr	r0, [r5, #656]
	add	r1, r1, #48
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1DEC_GetImageBuffer, .-VC1DEC_GetImageBuffer
	.align	2
	.global	VC1_Vfmw_GetImageBuffer
	.type	VC1_Vfmw_GetImageBuffer, %function
VC1_Vfmw_GetImageBuffer:
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
	add	r6, r0, #49152
	add	r4, r0, #36864
	mov	r5, r0
	mov	r1, #1
	ldr	r0, [r6, #656]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #132]
	blt	.L206
	add	r3, r5, #26624
	add	r2, r3, #56
	ldrh	r3, [r3, #56]
	cmp	r3, #0
	beq	.L190
	add	r3, r5, #28160
	add	lr, r5, #35072
	add	r3, r3, #224
	add	lr, lr, #128
.L193:
	ldrh	ip, [r3]
	mov	r2, r3
	add	r3, r3, #1696
	cmp	ip, #0
	add	r3, r3, #8
	beq	.L190
	cmp	r3, lr
	bne	.L193
	mov	r1, r0
	mov	r2, #1
	ldr	r0, [r6, #656]
	bl	FSP_ClearLogicFs
	ldr	r1, .L207
	mov	r0, #1
	bl	dprint_vfmw
	add	r3, r5, #26624
	add	r5, r5, #35072
	add	r3, r3, #57
	add	r5, r5, #129
	mov	r2, #0
.L195:
	strb	r2, [r3]
	add	r3, r3, #1696
	strb	r2, [r3, #-1697]
	add	r3, r3, #8
	cmp	r3, r5
	bne	.L195
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L190:
	mov	r3, #0
	str	r2, [r4, #40]
	mov	r1, #1
	strb	r1, [r2, #1]
.L192:
	ldr	r1, [r4, #40]
	uxtb	r2, r3
	add	r1, r1, r3
	strb	r2, [r1, #3]
	ldr	r1, [r4, #40]
	add	r1, r1, r3
	strb	r2, [r1, #259]
	ldr	r1, [r4, #40]
	add	r1, r1, r3
	strb	r2, [r1, #515]
	ldr	r1, [r4, #40]
	add	r1, r1, r3
	add	r3, r3, #1
	cmp	r3, #256
	strb	r2, [r1, #771]
	bne	.L192
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L206:
	ldr	r1, .L207+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r4, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L188
	ldr	r0, [r6, #656]
	add	r9, r7, #608
	ldr	r1, [r7, #600]
	add	r8, r7, #624
	bl	FreeUsdByDec
	ldr	r1, [r7, #608]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	ldr	r1, [r7, #616]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	ldr	r1, [r7, #624]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r9, #-8]
	strd	r0, [r9]
	strd	r0, [r8, #-8]
	strd	r0, [r8]
	ldr	r1, [r4, #128]
	ldr	r0, [r6, #656]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #124]
	ldr	r0, [r6, #656]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #124]
	str	r3, [r4, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #128]
	str	r0, [r4, #124]
.L188:
	add	r1, r5, #49408
	mov	r5, #0
	add	r1, r1, #48
	str	r5, [r4, #120]
	ldr	r0, [r6, #656]
	bl	FSP_ClearNotInVoQueue
	ldr	r1, .L207+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L208:
	.align	2
.L207:
	.word	.LC27
	.word	.LC25
	.word	.LC26
	UNWIND(.fnend)
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
	.align	2
	.global	VC1_Vfmw_MemMove
	.type	VC1_Vfmw_MemMove, %function
VC1_Vfmw_MemMove:
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
	add	r0, r0, #20480
	ldr	ip, .L210
	ldr	r3, [r0, #3716]
	ldr	r2, [r0, #3736]
	add	r3, r3, #1
	ldr	r1, [r0, #3700]
	ldr	r0, [r0, #3696]
	add	r3, r3, r3, lsr #31
	ldr	ip, [ip, #52]
	ldr	r1, [r1, #1584]
	mov	r3, r3, asr #1
	ldr	r0, [r0, #1584]
	mov	r3, r3, asl #5
	mul	r3, r2, r3
	add	r2, r3, r3, lsl #1
	mov	r2, r2, asr #1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L211:
	.align	2
.L210:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_MemMove, .-VC1_Vfmw_MemMove
	.align	2
	.global	VC1_Vfmw_BuildRefList
	.type	VC1_Vfmw_BuildRefList, %function
VC1_Vfmw_BuildRefList:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #540)
	sub	sp, sp, #540
	ldr	r6, .L287
	mov	r7, r0
	mov	r10, r1
	mov	r4, r2
	mov	r1, #0
	mov	r2, #256
	sub	r0, fp, #556
	mov	r5, r3
	bl	memset
	mov	r2, #256
	mov	r1, #0
	sub	r0, fp, #300
	bl	memset
	add	r0, r7, #24064
	ldr	r3, [r6, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, #160
	blx	r3
	add	r0, r7, #24064
	ldr	r3, [r6, #48]
	add	r0, r0, #176
	mov	r2, #16
	mov	r1, #0
	blx	r3
	ldrsb	r3, [r7, #4]
	bics	r3, r3, #2
	bne	.L213
	cmp	r10, #1
	beq	.L274
	cmp	r10, #2
	addne	ip, r7, #20480
	beq	.L275
.L222:
	mov	r0, #1
	mov	r3, #0
	str	r3, [ip, #3764]
	str	r3, [ip, #3748]
.L256:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L213:
	add	r6, r7, #8192
	ldrb	r3, [r6, #2516]	@ zero_extendqisi2
	cmp	r3, #1
	ldrb	r3, [r6, #2553]	@ zero_extendqisi2
	beq	.L276
	cmp	r3, #0
	beq	.L277
.L232:
	add	ip, r7, #20480
	ldr	r3, [ip, #3704]
	ldr	r9, [r3, #1220]
	mov	r8, r9
.L231:
	cmp	r10, #1
	beq	.L278
.L233:
	cmp	r10, #2
	bne	.L222
	cmp	r4, #0
	mov	r2, #0
	mov	r3, #1
	str	r10, [ip, #3764]
	str	r10, [ip, #3748]
	strb	r2, [ip, #3744]
	strb	r3, [ip, #3745]
	beq	.L245
	cmp	r5, r2
	beq	.L279
.L245:
	ldr	r3, [ip, #3704]
	ldr	lr, [ip, #3696]
	ldr	r2, [r3, #1220]
.L272:
	ldr	r0, [ip, #3700]
	mov	r1, #1
	str	r2, [ip, #3752]
	mov	r3, #0
	strb	r1, [ip, #3761]
	strb	r3, [ip, #3760]
	ldr	r1, [r0, #1220]
	str	r1, [ip, #3768]
	ldr	r0, [r0, #1220]
	str	r0, [ip, #3772]
	ldr	r0, [r6, #2640]
	ldr	r8, [lr, #1220]
	cmp	r0, #1
	bls	.L280
	bics	r0, r0, #2
	beq	.L251
.L250:
	movw	ip, #1704
	mov	r3, r7
	mul	r8, ip, r8
	mul	r0, ip, r2
	mov	r2, #0
	mul	r1, ip, r1
	str	r2, [fp, #-572]
	add	r2, r8, #13952
	str	r2, [fp, #-568]
	add	r2, r8, #14208
	str	r2, [fp, #-560]
	ldr	r2, [fp, #-568]
	add	r10, r0, #13952
	add	r9, r0, #14208
	add	r5, r1, #13952
	add	r2, r2, #2
	str	r2, [fp, #-568]
	ldr	r2, [fp, #-560]
	add	r4, r1, #14208
	add	lr, r1, #14464
	add	ip, r1, #14720
	add	r1, r8, #14464
	add	r9, r9, #2
	add	r2, r2, #2
	add	r1, r1, #2
	add	r10, r10, #2
	str	r1, [fp, #-576]
	add	ip, ip, #2
	add	r7, r7, r10
	add	r8, r8, #14720
	str	r7, [fp, #-560]
	add	r7, r3, r9
	add	r9, r3, r2
	ldr	r2, [fp, #-576]
	add	r6, r0, #14464
	add	r8, r8, #2
	add	r1, r3, ip
	str	r8, [fp, #-580]
	add	r0, r0, #14720
	ldr	ip, [fp, #-568]
	add	r6, r6, #2
	add	r0, r0, #2
	add	r5, r5, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	r8, r3, r2
	ldr	r2, [fp, #-580]
	add	r6, r3, r6
	add	r0, r3, r0
	add	r5, r3, r5
	add	r4, r3, r4
	add	lr, r3, lr
	add	ip, r3, ip
	str	r7, [fp, #-564]
	add	r7, r3, r2
	mov	r2, #0
	str	r1, [fp, #-568]
.L252:
	ldr	r1, [fp, #-560]
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-560]
	ldr	r1, [fp, #-564]
	strb	r10, [r3, #12]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #268]
	ldrb	r10, [r6, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-564]
	ldr	r1, [fp, #-568]
	strb	r10, [r3, #524]
	ldrb	r10, [r0, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #780]
	ldrb	r10, [r5, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1036]
	ldrb	r10, [r4, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1292]
	ldrb	r10, [lr, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1548]
	ldrb	r10, [r1, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #1804]
	ldrb	r10, [ip, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-568]
	strb	r10, [r3, #2060]
	ldrb	r10, [r9, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2316]
	ldrb	r10, [r8, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2572]
	ldrb	r10, [r7, #1]!	@ zero_extendqisi2
	strb	r10, [r3, #2828]
	bne	.L252
	mov	r0, #1
.L284:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L277:
	add	ip, r7, #20480
	cmp	r10, #1
	ldr	r2, [ip, #3704]
	ldr	r3, [ip, #3700]
	ldr	r9, [r2, #1220]
	ldr	r8, [r3, #1220]
	bne	.L233
.L278:
	ldrb	r3, [r6, #2544]	@ zero_extendqisi2
	cmp	r4, #0
	mov	r2, #0
	strb	r10, [ip, #3745]
	add	r3, r3, #1
	str	r2, [ip, #3764]
	str	r3, [ip, #3748]
	strb	r2, [ip, #3744]
	beq	.L234
	cmp	r5, r2
	beq	.L281
.L234:
	ldr	r3, [ip, #3704]
	ldr	r2, [ip, #3696]
	ldr	r5, [r3, #1220]
.L271:
	str	r5, [ip, #3752]
	ldr	r3, [r3, #1220]
	str	r3, [ip, #3756]
	ldr	r3, [r6, #2640]
	ldr	r4, [r2, #1220]
	cmp	r3, #1
	bls	.L282
.L238:
	bics	r2, r3, #2
	bne	.L239
	ldrb	r2, [r6, #2526]	@ zero_extendqisi2
	cmp	r2, #4
	beq	.L283
.L239:
	movw	r1, #1704
	mov	r3, r7
	mul	r0, r1, r5
	mov	r2, #0
	mul	r1, r1, r4
	add	r8, r0, #13952
	add	r6, r0, #14208
	add	r5, r0, #14464
	add	r0, r0, #14720
	add	r4, r1, #13952
	add	lr, r1, #14208
	add	ip, r1, #14464
	add	r1, r1, #14720
	add	r8, r8, #2
	add	r6, r6, #2
	add	r5, r5, #2
	add	r0, r0, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	ip, ip, #2
	add	r1, r1, #2
	add	r7, r7, r8
	add	r6, r3, r6
	add	r5, r3, r5
	add	r0, r3, r0
	add	r4, r3, r4
	add	lr, r3, lr
	add	ip, r3, ip
	add	r1, r3, r1
.L244:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #12]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #268]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #524]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #780]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2060]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2316]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2572]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #2828]
	bne	.L244
	mov	r0, #1
	b	.L284
.L274:
	add	r2, r7, #20480
	ldr	r1, [r2, #3704]
	str	r10, [r2, #3748]
	str	r3, [r2, #3764]
	strb	r3, [r2, #3744]
	ldr	r4, [r1, #1220]
	str	r4, [r2, #3752]
	ldrb	r3, [r7, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r7, #8192
	beq	.L215
	ldr	r2, [r3, #2556]
	ldrb	r5, [r3, #2528]	@ zero_extendqisi2
	cmp	r2, #2
	ldrb	r6, [r3, #2529]	@ zero_extendqisi2
	ldrb	r0, [r3, #2526]	@ zero_extendqisi2
	beq	.L285
.L216:
	cmp	r0, #4
	beq	.L217
.L218:
	movw	r3, #1704
	add	r6, r7, #12
	mul	r2, r3, r4
	add	r5, r7, #268
	add	r4, r7, #524
	add	lr, r7, #780
	mov	r3, #0
	add	ip, r2, #13952
	add	r0, r2, #14208
	add	r1, r2, #14464
	add	r2, r2, #14720
	add	ip, ip, #2
	add	r0, r0, #2
	add	r1, r1, #2
	add	r2, r2, #2
	add	ip, r7, ip
	add	r0, r7, r0
	add	r1, r7, r1
	add	r7, r7, r2
.L220:
	ldrb	r2, [ip, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r3, #256
	strb	r2, [r6, #1]!
	ldrb	r2, [r0, #1]!	@ zero_extendqisi2
	strb	r2, [r5, #1]!
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	strb	r2, [r4, #1]!
	ldrb	r2, [r7, #1]!	@ zero_extendqisi2
	strb	r2, [lr, #1]!
	bne	.L220
	mov	r0, #1
	b	.L284
.L276:
	cmp	r3, #0
	beq	.L232
	add	ip, r7, #20480
	ldr	r2, [ip, #3700]
	ldr	r3, [ip, #3704]
	ldr	r9, [r2, #1220]
	ldr	r8, [r3, #1220]
	b	.L231
.L275:
	add	r2, r7, #20480
	mov	r1, #1
	ldr	r0, [r2, #3704]
	str	r1, [r2, #3764]
	str	r1, [r2, #3748]
	strb	r3, [r2, #3744]
	ldr	r1, [r2, #3700]
	ldr	r5, [r0, #1220]
	strb	r3, [r2, #3760]
	str	r5, [r2, #3752]
	ldr	r4, [r1, #1220]
	str	r4, [r2, #3768]
	ldrb	r3, [r7, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r7, #8192
	ldrneb	r6, [r3, #2528]	@ zero_extendqisi2
	ldrneb	r8, [r3, #2529]	@ zero_extendqisi2
	ldreqb	r6, [r3, #2425]	@ zero_extendqisi2
	ldreqb	r8, [r3, #2426]	@ zero_extendqisi2
	ldrneb	r3, [r3, #2526]	@ zero_extendqisi2
	ldreqb	r3, [r3, #2423]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L286
.L225:
	movw	r0, #1704
	mov	r3, r7
	mul	r1, r0, r5
	mov	r2, #0
	mul	r0, r0, r4
	add	r8, r1, #13952
	add	r6, r1, #14208
	add	r5, r1, #14464
	add	r1, r1, #14720
	add	r4, r0, #13952
	add	lr, r0, #14208
	add	ip, r0, #14464
	add	r0, r0, #14720
	add	r8, r8, #2
	add	r6, r6, #2
	add	r5, r5, #2
	add	r1, r1, #2
	add	r4, r4, #2
	add	lr, lr, #2
	add	ip, ip, #2
	add	r0, r0, #2
	add	r7, r7, r8
	add	r6, r3, r6
	add	r5, r3, r5
	add	r1, r3, r1
	add	r4, r3, r4
	add	lr, r3, lr
	add	ip, r3, ip
	add	r0, r3, r0
.L227:
	ldrb	r8, [r7, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #256
	add	r3, r3, #1
	strb	r8, [r3, #12]
	ldrb	r8, [r6, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #268]
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #524]
	ldrb	r8, [r1, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #780]
	ldrb	r8, [r4, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1036]
	ldrb	r8, [lr, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1292]
	ldrb	r8, [ip, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1548]
	ldrb	r8, [r0, #1]!	@ zero_extendqisi2
	strb	r8, [r3, #1804]
	bne	.L227
	mov	r0, #1
	b	.L284
.L215:
	ldrb	r5, [r3, #2425]	@ zero_extendqisi2
	ldrb	r6, [r3, #2426]	@ zero_extendqisi2
	ldrb	r0, [r3, #2423]	@ zero_extendqisi2
	b	.L216
.L251:
	ldrb	r3, [r6, #2526]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L250
	b	.L256
.L281:
	ldr	r2, [ip, #3696]
	ldr	r3, [ip, #3704]
	ldr	r5, [r2, #1220]
	b	.L271
.L279:
	ldr	lr, [ip, #3696]
	ldr	r2, [lr, #1220]
	b	.L272
.L282:
	ldrb	r3, [r6, #2526]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L239
	ldrb	ip, [r6, #2529]	@ zero_extendqisi2
	mov	r3, #0
	ldrb	r10, [r6, #2528]	@ zero_extendqisi2
	sub	r0, fp, #556
	mov	r2, ip
	str	ip, [fp, #-560]
	mov	r1, r10
	bl	VC1_Vfmw_GenerateIntensityMap
	ldr	ip, [fp, #-560]
	mov	r1, r10
	sub	r0, fp, #300
	mov	r3, #1
	mov	r2, ip
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r2, #1704
	mul	r2, r2, r9
	mov	r0, #0
	add	r1, r2, #13952
	add	r2, r2, #14208
	add	r1, r1, #3
	add	r2, r2, #3
	add	r1, r7, r1
	add	r2, r7, r2
.L240:
	ldrb	r3, [r1]	@ zero_extendqisi2
	sub	ip, fp, #44
	add	r0, r0, #1
	add	r3, ip, r3
	cmp	r0, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, ip, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L240
	ldr	r3, [r6, #2640]
	b	.L238
.L280:
	ldrb	r0, [r6, #2526]	@ zero_extendqisi2
	cmp	r0, #4
	bne	.L250
	mov	r0, r3
	b	.L256
.L283:
	cmp	r3, #0
	sub	r0, fp, #556
	mov	r3, #0
	ldreqb	r9, [r6, #2644]	@ zero_extendqisi2
	ldrneb	r9, [r6, #2528]	@ zero_extendqisi2
	ldreqb	r6, [r6, #2648]	@ zero_extendqisi2
	ldrneb	r6, [r6, #2529]	@ zero_extendqisi2
	mov	r1, r9
	mov	r2, r6
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r6
	mov	r1, r9
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r3, #1704
	mul	r2, r3, r8
	mov	r0, #0
	add	r1, r2, #14464
	add	r2, r2, #14720
	add	r1, r1, #3
	add	r2, r2, #3
	add	r1, r7, r1
	add	r2, r7, r2
.L243:
	ldrb	r3, [r1]	@ zero_extendqisi2
	sub	ip, fp, #44
	add	r0, r0, #1
	add	r3, ip, r3
	cmp	r0, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, ip, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L243
	b	.L239
.L285:
	ldr	r3, [r3, #2632]
	cmp	r3, #1
	bne	.L216
.L217:
	sub	r0, fp, #556
	mov	r3, #0
	mov	r2, r6
	mov	r1, r5
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r6
	mov	r1, r5
	sub	r0, fp, #300
	mov	r3, #1
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r3, #1704
	mul	r3, r3, r4
	mov	lr, #0
	add	ip, r3, #13952
	add	r0, r3, #14208
	add	r1, r3, #14464
	add	r3, r3, #14720
	add	ip, ip, #3
	add	r0, r0, #3
	add	r1, r1, #3
	add	r3, r3, #3
	add	ip, r7, ip
	add	r0, r7, r0
	add	r1, r7, r1
	add	r2, r7, r3
.L219:
	ldrb	r3, [ip]	@ zero_extendqisi2
	sub	r5, fp, #44
	add	lr, lr, #1
	add	r3, r5, r3
	cmp	lr, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [ip], #1
	ldrb	r3, [r0]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r0], #1
	ldrb	r3, [r1]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L219
	b	.L218
.L286:
	mov	r2, r8
	mov	r1, r6
	sub	r0, fp, #556
	mov	r3, #0
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	r2, r8
	mov	r1, r6
	sub	r0, fp, #300
	mov	r3, #1
	mov	r10, #0
	bl	VC1_Vfmw_GenerateIntensityMap
	movw	r2, #1704
	mul	r1, r2, r5
	str	r4, [fp, #-560]
	mul	r2, r2, r4
	add	r9, r1, #13952
	add	r8, r1, #14208
	add	r6, r1, #14464
	add	r1, r1, #14720
	add	lr, r2, #13952
	add	ip, r2, #14208
	add	r0, r2, #14464
	add	r2, r2, #14720
	add	r9, r9, #3
	add	r8, r8, #3
	add	r6, r6, #3
	add	r1, r1, #3
	add	lr, lr, #3
	add	ip, ip, #3
	add	r0, r0, #3
	add	r2, r2, #3
	add	r9, r7, r9
	add	r8, r7, r8
	add	r6, r7, r6
	add	r1, r7, r1
	add	lr, r7, lr
	add	ip, r7, ip
	add	r0, r7, r0
	add	r2, r7, r2
.L226:
	ldrb	r3, [r9]	@ zero_extendqisi2
	sub	r4, fp, #44
	add	r10, r10, #1
	add	r3, r4, r3
	cmp	r10, #256
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r9], #1
	ldrb	r3, [r8]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r8], #1
	ldrb	r3, [r6]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r6], #1
	ldrb	r3, [r1]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r1], #1
	ldrb	r3, [lr]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [lr], #1
	ldrb	r3, [ip]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [ip], #1
	ldrb	r3, [r0]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-512]	@ zero_extendqisi2
	strb	r3, [r0], #1
	ldrb	r3, [r2]	@ zero_extendqisi2
	add	r3, r4, r3
	ldrb	r3, [r3, #-256]	@ zero_extendqisi2
	strb	r3, [r2], #1
	bne	.L226
	ldr	r4, [fp, #-560]
	b	.L225
.L288:
	.align	2
.L287:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	2
	.global	VC1_Vfmw_GetStreamInfo
	.type	VC1_Vfmw_GetStreamInfo, %function
VC1_Vfmw_GetStreamInfo:
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
	add	r5, r0, #12288
	add	r4, r0, #36864
	mov	r8, r0
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	ldr	r9, [r4, #56]
	cmp	r3, #0
	beq	.L290
	add	r3, r0, #20480
	add	r2, r5, #3776
	ldr	r3, [r3, #2996]
	cmp	r3, #3
	ldr	r3, [r4, #60]
	addeq	r3, r3, #1
	addeq	r3, r3, r3, lsr #31
	moveq	r3, r3, asr #1
	mul	r3, r3, r9
	str	r3, [fp, #-48]
	mov	r3, r2
	ldrh	r2, [r2, #2]
	ldrh	r3, [r3]
	adds	r1, r2, #15
	addmi	r1, r2, #30
	adds	r0, r3, #15
	addmi	r0, r3, #30
	mov	r1, r1, asr #4
	mov	r0, r0, asr #4
.L342:
	mov	r2, r0, asl #4
	movw	ip, #8160
	sub	r3, r2, #32
	cmp	r3, ip
	mov	r3, r1, asl #4
	bhi	.L293
	sub	lr, r3, #32
	cmp	lr, ip
	bhi	.L293
	ldr	r3, [r4, #68]
	cmp	r3, r1
	beq	.L377
.L296:
	ldr	r2, [r4, #60]
	mov	r3, r9, asl #4
	add	r3, r3, #63
	str	r9, [r4, #64]
	bic	r3, r3, #63
	str	r3, [r4, #80]
	str	r2, [r4, #68]
	ldrb	r3, [r5, #448]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L304
	mov	r3, #1
.L298:
	ldrb	r2, [r5, #443]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L378
.L301:
	ldrb	r2, [r5, #440]	@ zero_extendqisi2
	eor	r2, r2, #8
	ubfx	r2, r2, #3, #1
	orrs	r3, r3, r2
	bne	.L304
.L308:
	mov	r0, r8
	bl	VC1_Vfmw_GetImageBuffer
	subs	r6, r0, #0
	beq	.L379
	add	r10, r8, #49152
	ldr	r1, [r4, #132]
	ldr	r0, [r10, #656]
	bl	FSP_GetFsImagePtr
	subs	r3, r0, #0
	beq	.L310
	ldr	r0, [r8]
	add	ip, r3, #640
	add	r2, r3, #656
	ldr	r1, .L387
	ldrd	r6, [r0, #56]
	mov	r0, #29
	strd	r6, [ip]
	ldr	lr, [r8]
	ldrd	r6, [lr, #72]
	strd	r6, [r2, #-8]
	ldr	lr, [r8]
	ldrd	r6, [lr, #88]
	strd	r6, [r2]
	mvn	r6, #0
	ldr	lr, [r8]
	mvn	r7, #0
	ldr	lr, [lr, #104]
	str	lr, [r3, #8]
	ldr	lr, [r8]
	ldr	lr, [lr, #108]
	str	lr, [r3, #12]
	ldr	lr, [r8]
	ldr	lr, [lr, #112]
	str	lr, [r3, #16]
	ldr	lr, [r8]
	ldr	lr, [lr, #128]
	str	lr, [r3, #20]
	ldr	r3, [r8]
	strd	r6, [r3, #56]
	ldrd	r6, [r2, #-8]
	ldrd	r2, [ip]
	strd	r6, [sp]
	bl	dprint_vfmw
.L310:
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L311
	add	r3, r8, #20480
	ldr	r3, [r3, #2996]
	cmp	r3, #3
	beq	.L380
.L311:
	ldr	r3, [r4, #40]
	mov	r2, #0
	str	r2, [r3, #1152]
.L312:
	ldr	r3, [r4, #40]
	mov	r2, #0
	strb	r2, [r3, #2]
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L313
	add	r3, r8, #20480
	ldrb	r2, [r3, #2616]	@ zero_extendqisi2
	cmp	r2, #1
	ldreqb	r2, [r3, #2854]	@ zero_extendqisi2
	ldreq	r3, [r4, #40]
	streqb	r2, [r3, #2]
.L313:
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	ldr	r3, [r4, #120]
	movls	r7, #1
	movhi	r7, #0
	bhi	.L314
	cmp	r3, #0
	ldr	r2, [r4, #124]
	ldr	r3, [r4, #128]
	movne	r1, #2
	moveq	r1, #1
	cmp	r2, r3
	str	r1, [r4, #120]
	beq	.L316
	ldr	r1, .L387+4
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r4, #124]
	ldr	r0, [r10, #656]
	bl	FSP_SetRef
	ldr	r3, [r4, #128]
.L316:
	ldr	r1, [r4, #132]
	mov	r2, #1
	str	r3, [r4, #124]
	str	r1, [r4, #128]
	ldr	r0, [r10, #656]
	bl	FSP_SetRef
	ldr	r1, [r4, #124]
	ldr	r0, [r10, #656]
	bl	FSP_RemovePmv
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #5
	cmpne	r3, #1
	bhi	.L318
	ldr	r3, [r4, #48]
	mov	r1, #0
	mov	r2, #1
	strb	r1, [r3]
	ldr	r3, [r4, #40]
	strb	r2, [r3]
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #40]
	str	r2, [r4, #48]
	str	r3, [r4, #44]
.L318:
	ldr	r1, [r4, #132]
	ldr	r0, [r10, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #124]
	mov	r6, r0
	ldr	r0, [r10, #656]
	bl	FSP_GetLogicFs
	ldr	r1, [r4, #128]
	mov	r7, r0
	ldr	r0, [r10, #656]
	bl	FSP_GetLogicFs
	cmp	r6, #0
	cmpne	r7, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	mov	ip, r0
	cmp	r3, #0
	bne	.L381
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L382
.L324:
	mov	r3, #0
.L372:
	str	r3, [r6, #120]
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L383
.L326:
	ldr	r3, [r6, #680]
	cmp	r3, #0
	beq	.L327
	ldr	r2, [r6, #688]
	cmp	r2, #0
	beq	.L327
	ldr	r2, [r6, #684]
	cmp	r2, #0
	beq	.L327
	ldr	r2, [ip, #680]
	cmp	r2, #0
	ldrne	r3, [r2, #16]
	ldreq	r3, [r3, #16]
	str	r3, [r5, #112]
	ldr	r3, [r7, #680]
	mov	r7, #0
	cmp	r3, #0
	ldreq	r3, [r6, #680]
	ldr	r3, [r3, #16]
	str	r3, [r5, #108]
	ldr	r3, [r6, #680]
	ldr	r3, [r3, #16]
	str	r3, [r5, #232]
	ldr	r3, [r6, #692]
	str	r3, [r5, #116]
	ldr	r3, [ip, #692]
	str	r3, [r5, #120]
	ldr	r3, [r6, #684]
	ldr	r3, [r3, #16]
	str	r3, [r5, #104]
	ldr	r3, [r6, #684]
	ldr	r3, [r3, #32]
	str	r3, [r5, #184]
	ldr	r3, [r6, #684]
	ldr	r3, [r3, #76]
	str	r3, [r5, #188]
	ldr	r3, [r6, #684]
	ldr	r3, [r3, #60]
	str	r3, [r5, #192]
	ldr	r3, [r6, #684]
	ldr	r3, [r3, #64]
	str	r3, [r5, #196]
	ldr	r3, [r6, #680]
	ldr	r6, [r4, #40]
	ldr	r0, [r3, #16]
	bl	MEM_Phy2Vir
	str	r7, [r6, #1588]
	str	r0, [r6, #1584]
	ldr	r0, [r5, #108]
	ldr	r6, [r4, #48]
	bl	MEM_Phy2Vir
	str	r7, [r6, #1588]
	str	r0, [r6, #1584]
	ldr	r0, [r5, #112]
	ldr	r6, [r4, #44]
	bl	MEM_Phy2Vir
	str	r7, [r6, #1588]
	str	r0, [r6, #1584]
.L303:
	add	r3, r5, #3536
	ldrsb	r3, [r3]
	cmp	r3, #0
	beq	.L384
	add	ip, r8, #20480
	ldr	r3, [r4, #40]
	ldr	r2, [ip, #2996]
	strb	r2, [r3, #1027]
	ldr	r3, [r4, #40]
	ldrb	r2, [ip, #2953]	@ zero_extendqisi2
	strb	r2, [r3, #1028]
	ldrb	r2, [ip, #2966]	@ zero_extendqisi2
	ldr	r3, [r4, #40]
	sub	r0, r2, #2
	ldrb	r1, [ip, #2993]	@ zero_extendqisi2
	cmp	r0, #1
	movls	r2, #1
	bls	.L336
	cmp	r2, #4
	movne	r2, #0
	beq	.L385
.L336:
	add	r3, r3, r1
	strb	r2, [r3, #1029]
	ldr	r0, [r4, #140]
	cmp	r0, #0
	beq	.L337
	sub	r0, r0, #1
	cmp	r0, #0
	mov	lr, r0
	moveq	r1, r0
	beq	.L339
	add	r2, r8, #36864
	mov	r1, #0
	add	r2, r2, #152
.L340:
	ldr	r3, [r2, #64]
	add	r2, r2, #48
	strb	r1, [r2, #-48]
	add	r1, r1, #1
	cmp	r1, lr
	mul	r3, r3, r9
	sub	r3, r3, #1
	str	r3, [r2, #-32]
	bne	.L340
	uxtb	r1, r1
.L339:
	mov	r3, r0, asl #6
	movw	r2, #24744
	sub	r0, r3, r0, asl #4
	ldr	r3, [fp, #-48]
	add	r0, r5, r0
	movw	lr, #24728
	sub	r3, r3, #1
	strb	r1, [r0, lr]
	str	r3, [r0, r2]
	ldrb	r1, [r5, #442]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L335
	ldrb	r3, [ip, #2983]	@ zero_extendqisi2
	add	r0, r8, #49152
	ldr	r2, [ip, #3100]
	mul	r2, r2, r3
	mov	r2, r2, asr #8
	str	r2, [r0, #184]
	rsb	r3, r2, r3
	subs	r3, r3, #1
	movmi	r3, #0
	str	r3, [r0, #188]
	b	.L335
.L293:
	ldr	r1, .L387+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r6, #0
.L369:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L290:
	ldr	r1, [r4, #60]
	mov	r0, r9
	mul	r3, r1, r9
	str	r3, [fp, #-48]
	b	.L342
.L304:
	add	r10, r8, #49152
	add	r3, r8, #35072
	add	r3, r3, #128
	ldr	r1, [r4, #128]
	str	r3, [r4, #40]
	str	r3, [r4, #52]
	str	r3, [r4, #48]
	str	r3, [r4, #44]
	ldr	r0, [r10, #656]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L300
	ldr	r0, [r10, #656]
	add	r3, r6, #608
	ldr	r1, [r6, #600]
	add	r7, r6, #624
	str	r3, [fp, #-52]
	bl	FreeUsdByDec
	ldr	r1, [r6, #608]
	ldr	r0, [r10, #656]
	bl	FreeUsdByDec
	ldr	r1, [r6, #616]
	ldr	r0, [r10, #656]
	bl	FreeUsdByDec
	ldr	r1, [r6, #624]
	ldr	r0, [r10, #656]
	bl	FreeUsdByDec
	ldr	r3, [fp, #-52]
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r3, #-8]
	strd	r0, [r3]
	strd	r0, [r7, #-8]
	strd	r0, [r7]
	ldr	r1, [r4, #128]
	ldr	r0, [r10, #656]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #124]
	ldr	r0, [r10, #656]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r4, #124]
	str	r3, [r4, #128]
	ldr	r0, [r10, #656]
	bl	FSP_GetNullLogicFs
	str	r0, [r4, #128]
	str	r0, [r4, #124]
.L300:
	add	r3, r8, #26624
	add	r1, r8, #35072
	add	r3, r3, #57
	add	r1, r1, #129
	mov	r2, #0
	str	r2, [r4, #120]
.L306:
	strb	r2, [r3]
	add	r3, r3, #1696
	strb	r2, [r3, #-1697]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L306
	add	r7, r8, #49408
	ldr	r0, [r10, #656]
	add	r7, r7, #48
	mov	r1, r7
	bl	FSP_ClearNotInVoQueue
	ldrb	r6, [r5, #440]	@ zero_extendqisi2
	and	r6, r6, #8
	ands	r6, r6, #255
	bne	.L308
	mov	r0, r7
	bl	ResetVoQueue
	ldr	r1, [r8]
	mov	r3, #2
	mov	r0, r8
	ldr	r2, [r1, #668]
	ldr	ip, [r1, #672]
	adds	r1, r2, #15
	addmi	r1, r2, #30
	adds	r2, ip, #15
	addmi	r2, ip, #30
	mov	r1, r1, asr #4
	str	r1, [r5, #272]
	mov	r2, r2, asr #4
	str	r2, [r5, #276]
	add	r2, r2, #1
	mov	r1, r1, asl #4
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	mov	r2, r2, asl #5
	bl	VC1_ArrangeVahbMem
	cmp	r0, #1
	bne	.L307
	ldrb	r3, [r5, #440]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r5, #440]
	b	.L308
.L379:
	ldr	r1, .L387+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L369
.L377:
	ldr	r3, [r4, #64]
	cmp	r3, r0
	bne	.L296
	mov	r3, r9, asl #4
	add	r3, r3, #63
	bic	r3, r3, #63
	str	r3, [r4, #80]
	ldrb	r3, [r5, #448]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #0
	bne	.L298
	b	.L301
.L314:
	cmp	r3, #1
	bhi	.L318
	ldr	r0, [r10, #656]
	mov	r2, #1
	ldr	r1, [r4, #132]
	mov	r6, r7
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #40]
	ldr	r1, .L387+16
	mov	r0, #1
	strb	r7, [r3]
	ldr	r3, [r4, #40]
	strb	r7, [r3, #1]
	bl	dprint_vfmw
	b	.L369
.L381:
	ldr	r1, [r4, #132]
	mov	r2, #1
	str	r0, [fp, #-48]
	ldr	r0, [r10, #656]
	bl	FSP_ClearLogicFs
	ldr	r1, [r4, #40]
	mov	lr, #0
	ldr	ip, [fp, #-48]
	mov	r3, r6
	mov	r0, lr
	strb	lr, [r1]
	movw	r2, #2409
	ldr	r4, [r4, #40]
	ldr	r1, .L387+20
	strb	lr, [r4, #1]
	stmia	sp, {r7, ip}
	bl	dprint_vfmw
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L376
.L322:
	ldr	r1, .L387+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r6, #0
	b	.L369
.L384:
	ldr	r1, [r4, #40]
	add	r2, r8, #20480
	strb	r3, [r1, #1027]
	ldr	r1, [r4, #40]
	ldrb	r0, [r2, #2855]	@ zero_extendqisi2
	strb	r0, [r1, #1028]
	ldrb	r0, [r2, #2863]	@ zero_extendqisi2
	ldr	r1, [r4, #40]
	sub	ip, r0, #2
	cmp	ip, #1
	movls	r3, #1
	bls	.L334
	cmp	r0, #4
	beq	.L386
.L334:
	add	r6, r8, #49152
	strb	r3, [r1, #1030]
	strb	r3, [r1, #1029]
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #140]
	strb	r3, [r4, #152]
	ldr	r0, [r5, #3568]
	ldr	r7, [r6, #148]
	bl	BsPos
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	add	r0, r7, r0, asr #3
	str	r0, [r4, #144]
	ldr	r0, [r5, #3568]
	ldr	r7, [r6, #160]
	bl	BsPos
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	add	r0, r7, r0, asr #3
	str	r0, [r4, #156]
	ldr	r0, [r5, #3568]
	bl	BsPos
	and	r0, r0, #7
	str	r0, [r4, #160]
	ldr	r0, [r5, #3568]
	ldr	r7, [r6, #168]
	bl	BsPos
	mov	r7, r7, asl #3
	rsb	r0, r0, r7
	str	r0, [r4, #164]
	ldr	r2, [r6, #208]
	ldr	r3, [r6, #212]
	mul	r3, r3, r2
	sub	r3, r3, #1
	str	r3, [r4, #168]
	ldrb	r1, [r5, #442]	@ zero_extendqisi2
.L335:
	add	r0, r8, #12672
	mov	r3, #1
	add	r0, r0, #56
	mov	r2, #0
	bl	VC1_Vfmw_BuildRefList
	subs	r6, r0, #0
	movne	r6, #1
	bne	.L369
	add	r8, r8, #49152
	ldr	r1, [r4, #132]
	mov	r2, #1
	ldr	r0, [r8, #656]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #40]
	ldr	r1, .L387+28
	mov	r0, #1
	strb	r6, [r3]
	ldr	r3, [r4, #40]
	strb	r6, [r3, #1]
	bl	dprint_vfmw
	b	.L369
.L382:
	add	r3, r8, #20480
	ldr	r3, [r3, #2996]
	cmp	r3, #3
	bne	.L324
	ldr	r3, .L387+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L324
	b	.L372
.L327:
	mov	r2, #1
	ldr	r1, [r4, #132]
	ldr	r0, [r10, #656]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #40]
	mov	r3, #0
	ldr	r1, .L387+36
	mov	r0, r3
	strb	r3, [r2]
	ldr	r2, [r4, #40]
	strb	r3, [r2, #1]
	ldr	ip, [r6, #684]
	ldr	r3, [r4, #132]
	ldr	r2, [r4, #124]
	str	ip, [sp, #12]
	ldr	ip, [r6, #688]
	ldr	lr, [r4, #128]
	str	ip, [sp, #8]
	ldr	ip, [r6, #680]
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_vfmw
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L322
.L376:
	ldr	r3, [r10, #228]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r10, #228]
	b	.L322
.L378:
	ldrb	r2, [r5, #449]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L303
	b	.L301
.L383:
	ldr	r3, [r7, #120]
	str	r3, [r6, #120]
	ldr	r2, [r4, #48]
	ldr	r3, [r4, #40]
	ldr	r2, [r2, #1152]
	str	r2, [r3, #1152]
	ldr	r3, [r10, #228]
	add	r3, r3, #1
	str	r3, [r10, #228]
	b	.L326
.L337:
	mov	r3, #1
	mov	r1, r0
	str	r3, [r4, #140]
	b	.L339
.L380:
	ldr	r3, .L387+32
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r2, [r4, #40]
	streq	r3, [r2, #1152]
	bne	.L311
	b	.L312
.L307:
	ldr	r1, .L387+40
	mov	r0, #1
	bl	dprint_vfmw
	ldrb	r3, [r5, #440]	@ zero_extendqisi2
	bic	r3, r3, #8
	strb	r3, [r5, #440]
	b	.L369
.L385:
	ldrb	r2, [ip, #2967]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	b	.L336
.L386:
	ldrb	r3, [r2, #2864]	@ zero_extendqisi2
	sub	r3, r3, #2
	cmp	r3, #1
	movhi	r3, #0
	movls	r3, #1
	b	.L334
.L388:
	.align	2
.L387:
	.word	.LC30
	.word	.LC31
	.word	.LC20
	.word	.LC29
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC36
	.word	USE_FF_APT_EN
	.word	.LC35
	.word	.LC28
	UNWIND(.fnend)
	.size	VC1_Vfmw_GetStreamInfo, .-VC1_Vfmw_GetStreamInfo
	.align	2
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
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
	bl	VC1_Vfmw_GetStreamInfo
	subs	r4, r0, #0
	movne	r4, #1
	bne	.L390
	ldr	r1, .L392
	bl	dprint_vfmw
.L390:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L393:
	.align	2
.L392:
	.word	.LC37
	UNWIND(.fnend)
	.size	VC1_Vfmw_PrepareDecode, .-VC1_Vfmw_PrepareDecode
	.align	2
	.global	VC1_DecMvrange
	.type	VC1_DecMvrange, %function
VC1_DecMvrange:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	ldr	lr, .L395
	mov	r4, r0
	sub	ip, fp, #84
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r4
	mov	r1, #3
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-60]
	ldr	r4, [r3, #-64]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L396:
	.align	2
.L395:
	.word	.LANCHOR0+16
	UNWIND(.fnend)
	.size	VC1_DecMvrange, .-VC1_DecMvrange
	.align	2
	.global	VC1_DecTransacfrm
	.type	VC1_DecTransacfrm, %function
VC1_DecTransacfrm:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r2, #64
	mov	r4, r0
	mov	r1, #0
	sub	r0, fp, #84
	bl	memset
	mov	r3, #2
	mov	r1, r3
	mov	r0, r4
	mov	r2, #1
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r2, [fp, #-80]
	str	r2, [fp, #-72]
	str	r2, [fp, #-68]
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-60]
	ldr	r4, [r3, #-64]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_DecTransacfrm, .-VC1_DecTransacfrm
	.align	2
	.global	VC1_SetCurPicResolutionInfo
	.type	VC1_SetCurPicResolutionInfo, %function
VC1_SetCurPicResolutionInfo:
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
	add	r3, r0, #20480
	cmp	r1, #1
	add	r0, r0, #32768
	ldr	r2, [r3, #3712]
	beq	.L400
	cmp	r1, #2
	beq	.L406
	cmp	r1, #0
	beq	.L405
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
.L406:
	str	r2, [r0, #3864]
	ldr	r3, [r3, #3716]
	add	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [r0, #3868]
	b	.L403
.L400:
	add	r2, r2, #1
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
.L405:
	str	r2, [r0, #3864]
	ldr	r3, [r3, #3716]
	str	r3, [r0, #3868]
.L403:
	mul	r1, r3, r2
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	str	r2, [r0, #3856]
	str	r3, [r0, #3860]
	str	r1, [r0, #3872]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_SetCurPicResolutionInfo, .-VC1_SetCurPicResolutionInfo
	.align	2
	.global	VC1_DecMvmodeProgrP
	.type	VC1_DecMvmodeProgrP, %function
VC1_DecMvmodeProgrP:
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
	mov	r6, r1
	mov	r1, #4
	mov	r7, r0
	bl	BsShow
	ldr	ip, .L418
	sub	r4, fp, #76
	sub	lr, fp, #56
	mov	r5, r0
	cmp	r0, #1
	ldmia	ip!, {r0, r1, r2, r3}
	ldr	r8, [ip], #4
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	str	r8, [r4]
	ldr	ip, [ip]
	stmia	lr!, {r0, r1, r2, r3}
	str	ip, [lr]
	ble	.L416
	cmp	r5, #3
	movle	r1, #3
	movle	r4, #2
	bgt	.L417
.L409:
	mov	r0, r7
	bl	BsSkip
	sub	r3, fp, #36
	add	r4, r3, r4, lsl #2
	cmp	r6, #12
	ldrhi	r0, [r4, #-40]
	ldrls	r0, [r4, #-20]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L417:
	cmp	r5, #8
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
	b	.L409
.L416:
	cmp	r5, #0
	mov	r1, #4
	moveq	r4, #3
	movne	r4, r1
	b	.L409
.L419:
	.align	2
.L418:
	.word	.LANCHOR0+80
	UNWIND(.fnend)
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
	.align	2
	.global	VC1_DecMvmodeProgrB
	.type	VC1_DecMvmodeProgrB, %function
VC1_DecMvmodeProgrB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r1, #1
	bl	BsSkip
	ldr	r2, .L421
	sub	r3, fp, #12
	add	r3, r3, r0, lsl #2
	ldmia	r2, {r0, r1}
	sub	r2, fp, #12
	stmdb	r2, {r0, r1}
	ldr	r0, [r3, #-8]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L422:
	.align	2
.L421:
	.word	.LANCHOR0+120
	UNWIND(.fnend)
	.size	VC1_DecMvmodeProgrB, .-VC1_DecMvmodeProgrB
	.align	2
	.global	VC1_DecMvmodeInterB
	.type	VC1_DecMvmodeInterB, %function
VC1_DecMvmodeInterB:
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
	UNWIND(.pad #40)
	sub	sp, sp, #40
	mov	r5, r1
	mov	r1, #3
	mov	r6, r0
	bl	BsShow
	ldr	r3, .L431
	sub	lr, fp, #72
	mov	r8, #0
	mov	r9, #1
	mov	ip, #2
	mov	r4, #3
	str	r8, [fp, #-52]
	str	r8, [fp, #-40]
	str	r9, [fp, #-56]
	str	ip, [fp, #-48]
	str	r4, [fp, #-44]
	mov	r7, r0
	cmp	r0, #1
	ldmia	r3, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ble	.L430
	cmp	r7, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L425:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #36
	add	ip, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [ip, #-36]
	ldrls	r0, [ip, #-20]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L430:
	cmp	r7, r8
	mov	r1, r4
	movne	r4, ip
	b	.L425
.L432:
	.align	2
.L431:
	.word	.LANCHOR0+128
	UNWIND(.fnend)
	.size	VC1_DecMvmodeInterB, .-VC1_DecMvmodeInterB
	.align	2
	.global	VC1_DecMvmode2
	.type	VC1_DecMvmode2, %function
VC1_DecMvmode2:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	mov	r5, r1
	mov	r1, #3
	mov	r6, r0
	bl	BsShow
	ldr	r3, .L442
	sub	lr, fp, #60
	add	ip, r3, #16
	mov	r4, r0
	cmp	r0, #1
	ldmia	r3, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	sub	ip, fp, #28
	stmdb	ip, {r0, r1, r2, r3}
	ble	.L441
	cmp	r4, #4
	movlt	r1, #2
	movge	r1, #1
	movlt	r4, #1
	movge	r4, #0
.L435:
	mov	r0, r6
	bl	BsSkip
	sub	r3, fp, #28
	add	r4, r3, r4, lsl #2
	cmp	r5, #12
	ldrhi	r0, [r4, #-32]
	ldrls	r0, [r4, #-16]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L441:
	cmp	r4, #0
	mov	r1, #3
	moveq	r4, r1
	movne	r4, #2
	b	.L435
.L443:
	.align	2
.L442:
	.word	.LANCHOR0+128
	UNWIND(.fnend)
	.size	VC1_DecMvmode2, .-VC1_DecMvmode2
	.align	2
	.global	VC1_DecBfractionSMP
	.type	VC1_DecBfractionSMP, %function
VC1_DecBfractionSMP:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #220)
	sub	sp, sp, #220
	ldr	ip, .L450
	str	r0, [fp, #-248]
	sub	r10, fp, #244
	str	r1, [fp, #-252]
	sub	r8, fp, #216
	str	r2, [fp, #-256]
	sub	r5, fp, #156
	ldmia	ip!, {r0, r1, r2, r3}
	sub	lr, fp, #100
	sub	r7, fp, #188
	add	r9, ip, #12
	add	r6, ip, #40
	stmia	r10!, {r0, r1, r2, r3}
	add	r4, ip, #96
	ldmia	ip, {r0, r1, r2}
	add	ip, ip, #152
	stmia	r10, {r0, r1, r2}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1, r2}
	stmia	r8, {r0, r1, r2}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6, {r0, r1}
	stmia	r5, {r0, r1}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1}
	stmia	lr, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r7!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	stmia	r7, {r0, r1, r2, r3}
	mov	r1, #3
	ldr	r0, [fp, #-248]
	bl	BsShow
	mov	r4, r0
	cmp	r4, #6
	ldr	r0, [fp, #-248]
	bgt	.L445
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r3, r3, r4, lsl #2
	ldr	r1, [r3, #-200]
	ldr	r2, [r3, #-172]
.L446:
	sub	r3, fp, #44
	mov	r0, r4
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-148]
	ldr	r2, [fp, #-252]
	mul	r3, r3, r1
	str	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L445:
	mov	r1, #7
	bl	BsGet
	and	r4, r0, #15
	cmp	r4, #15
	beq	.L449
	sub	r0, r0, #112
	sub	r3, fp, #44
	add	r4, r4, #7
	add	r0, r3, r0, lsl #2
	ldr	r1, [r0, #-112]
	ldr	r2, [r0, #-56]
	b	.L446
.L449:
	ldr	r2, [fp, #-256]
	mov	r3, #4
	mov	r0, #22
	strb	r3, [r2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L451:
	.align	2
.L450:
	.word	.LANCHOR0+160
	UNWIND(.fnend)
	.size	VC1_DecBfractionSMP, .-VC1_DecBfractionSMP
	.align	2
	.global	VC1_DecBfraction
	.type	VC1_DecBfraction, %function
VC1_DecBfraction:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #228)
	sub	sp, sp, #228
	ldr	r6, .L460
	str	r0, [fp, #-248]
	sub	r10, fp, #244
	str	r1, [fp, #-256]
	sub	r8, fp, #216
	ldmia	r6!, {r0, r1, r2, r3}
	sub	lr, fp, #188
	str	lr, [fp, #-252]
	sub	r4, fp, #156
	sub	ip, fp, #100
	add	r9, r6, #12
	add	r5, r6, #40
	stmia	r10!, {r0, r1, r2, r3}
	add	lr, r6, #96
	ldmia	r6, {r0, r1, r2}
	add	r7, r6, #152
	stmia	r10, {r0, r1, r2}
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r9, {r0, r1, r2}
	stmia	r8, {r0, r1, r2}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1}
	stmia	r4, {r0, r1}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	ldr	lr, [fp, #-252]
	stmia	ip, {r0, r1}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r7, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	mov	r1, #3
	ldr	r0, [fp, #-248]
	bl	BsShow
	mov	r4, r0
	cmp	r4, #6
	ldr	r0, [fp, #-248]
	bgt	.L453
	mov	r1, #3
	bl	BsSkip
	sub	r3, fp, #44
	add	r2, r3, r4, lsl #2
	ldr	r1, [r2, #-200]
	ldr	r2, [r2, #-172]
	sub	r3, r2, #1
	cmp	r3, #7
	bhi	.L457
.L459:
	sub	r2, fp, #44
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #-144]
	mul	r3, r3, r1
.L458:
	ldr	r2, [fp, #-256]
	str	r3, [r2]
.L455:
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L453:
	mov	r1, #7
	bl	BsGet
	and	r4, r0, #15
	sub	r3, r4, #14
	add	r4, r4, #7
	cmp	r3, #1
	bls	.L455
	sub	r3, r0, #112
	cmp	r3, #13
	bhi	.L456
	sub	r2, fp, #44
	add	r2, r2, r3, lsl #2
	ldr	r1, [r2, #-112]
	ldr	r2, [r2, #-56]
	sub	r3, r2, #1
	cmp	r3, #7
	bls	.L459
.L457:
	str	r2, [sp]
	movw	r3, #3594
	ldr	r2, .L460+4
	mov	r0, #1
	ldr	r1, .L460+8
	bl	dprint_vfmw
	mov	r3, #0
	b	.L458
.L456:
	str	r0, [sp]
	add	r2, r6, #184
	mov	r3, #3584
	ldr	r1, .L460+12
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, #0
	b	.L457
.L461:
	.align	2
.L460:
	.word	.LANCHOR0+160
	.word	.LANCHOR0+360
	.word	.LC39
	.word	.LC38
	UNWIND(.fnend)
	.size	VC1_DecBfraction, .-VC1_DecBfraction
	.align	2
	.global	VC1_VopDQuant
	.type	VC1_VopDQuant, %function
VC1_VopDQuant:
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
	cmp	r1, #2
	mov	r6, r2
	mov	r4, r3
	mov	r7, r0
	beq	.L480
	mov	r1, #1
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4]
	cmp	r5, #1
	beq	.L481
.L466:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L480:
	mov	r3, #1
	mov	r1, #3
	strb	r3, [r4, #3]
	strb	r3, [r4]
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #7
	addne	r6, r6, #1
	addne	r3, r0, r6
	strneb	r3, [r4, #8]
	beq	.L482
.L465:
	mov	r3, #1
	mov	r0, #1
	str	r3, [r4, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L481:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #1]
	cmp	r1, #0
	streq	r5, [r4, #12]
	beq	.L469
	cmp	r1, #2
	beq	.L483
	cmp	r1, #1
	beq	.L484
	cmp	r1, #3
	movne	r3, #0
	strne	r3, [r4, #12]
	beq	.L485
.L469:
	ldr	r3, [r4]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #768
	beq	.L466
	mov	r3, #1
	mov	r1, #3
	strb	r3, [r4, #3]
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #7
	addne	r6, r6, #1
	addne	r6, r0, r6
	strneb	r6, [r4, #8]
	bne	.L466
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L466
.L485:
	mov	r1, r5
	mov	r0, r7
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #2]
	cmp	r0, #0
	movne	r3, #10
	moveq	r3, #11
	str	r3, [r4, #12]
	b	.L469
.L482:
	mov	r0, r7
	mov	r1, #5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #5]
	strb	r0, [r4, #8]
	b	.L465
.L483:
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #6]
	add	r3, r3, #6
	str	r3, [r4, #12]
	b	.L469
.L484:
	mov	r1, #2
	mov	r0, r7
	bl	BsGet
	uxtb	r3, r0
	strb	r0, [r4, #7]
	add	r3, r3, #2
	str	r3, [r4, #12]
	b	.L469
	UNWIND(.fnend)
	.size	VC1_VopDQuant, .-VC1_VopDQuant
	.align	2
	.global	VC1_DecNormDiff6Tile
	.type	VC1_DecNormDiff6Tile, %function
VC1_DecNormDiff6Tile:
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
	ldr	r9, [r1]
	mov	r8, r1
	mov	r5, r0
	mov	r6, #0
.L487:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	subs	r7, r0, #0
	mov	r0, r5
	bne	.L496
	bl	BsGet
	mov	r4, r0
	cmp	r4, #1
	mov	r1, r0
	mov	r0, r5
	bgt	.L506
	bne	.L490
	bl	BsGet
	cmp	r0, #0
	beq	.L491
	cmp	r6, #0
	mov	r6, r4
	beq	.L487
.L504:
	str	r9, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L496:
	mov	r0, #0
.L488:
	cmp	r6, #0
	mov	r7, #1
	eorne	r0, r0, #63
.L505:
	str	r0, [r8]
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L506:
	sub	r4, r4, #2
	mov	r0, #1
	mov	r0, r0, asl r4
	b	.L488
.L490:
	mov	r0, r5
	mov	r1, #4
	bl	BsGet
	cmp	r0, #255
	beq	.L504
	ldr	r3, .L507
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #508]
	b	.L488
.L491:
	mov	r0, r5
	mov	r1, #5
	bl	BsGet
	ldr	r3, .L507
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #380]
	cmp	r3, #2
	orreq	r0, r0, #32
	beq	.L488
	cmp	r3, #3
	bne	.L505
	b	.L488
.L508:
	.align	2
.L507:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VC1_DecNormDiff6Tile, .-VC1_DecNormDiff6Tile
	.align	2
	.global	VC1_Vfmw_ParseSMPIPicHdr
	.type	VC1_Vfmw_ParseSMPIPicHdr, %function
VC1_Vfmw_ParseSMPIPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #7
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #253]
	mov	r0, r6
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #254]
	cmp	r5, #0
	beq	.L510
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L525
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L522
.L513:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L523
.L515:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L524
.L517:
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	bne	.L518
.L520:
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L519:
	mov	r0, r8
	mov	r5, #1
	bl	VC1_SetCurPicResolutionInfo
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #267]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #268]
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #269]
.L510:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L518:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L520
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L519
.L522:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L513
.L523:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L515
.L524:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L517
.L526:
	.align	2
.L525:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPIPicHdr, .-VC1_Vfmw_ParseSMPIPicHdr
	.align	2
	.global	VC1_Vfmw_ParseSMPPPicHdr
	.type	VC1_Vfmw_ParseSMPPPicHdr, %function
VC1_Vfmw_ParseSMPPPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r7, r1
	mov	r1, #5
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #254]
	cmp	r6, #0
	beq	.L540
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L557
	sub	r0, fp, #164
	bl	memcpy
	cmp	r8, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L551
.L532:
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L552
.L534:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L553
.L536:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L537
	ldrb	r1, [r4, #258]	@ zero_extendqisi2
.L538:
	mov	r0, r7
	bl	VC1_SetCurPicResolutionInfo
	mov	r0, r5
	bl	BsPos
	ldr	r1, .L557+4
	mov	r2, r0
	mov	r0, #18
	bl	dprint_vfmw
	ldrb	r1, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #259]
	cmp	r0, #4
	beq	.L554
.L539:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L540
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #263]
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #264]
	bne	.L555
.L541:
	mov	r0, r5
	bl	BsPos
	ldr	r1, .L557+8
	mov	r2, r0
	mov	r0, #18
	bl	dprint_vfmw
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L556
.L543:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #267]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #269]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L540:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L551:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L532
.L555:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L541
.L553:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L536
.L537:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #258]
	b	.L538
.L552:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L534
.L554:
	ldrb	r1, [r4, #340]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmode2
	mov	r1, #6
	strb	r0, [r4, #260]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #261]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #262]
	b	.L539
.L556:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L543
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L543
.L558:
	.align	2
.L557:
	.word	.LANCHOR0+568
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPPPicHdr, .-VC1_Vfmw_ParseSMPPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseMPBPicHdr
	.type	VC1_Vfmw_ParseMPBPicHdr, %function
VC1_Vfmw_ParseMPBPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #254]
	cmp	r5, #0
	beq	.L570
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L587
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #340]
	movhi	r3, #0
	strhib	r3, [r4, #255]
	bls	.L582
.L564:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #256]
	beq	.L583
.L566:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #257]
	beq	.L584
.L568:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r3, #0
	mov	r1, r8
	mov	r2, r4
	cmp	r0, r3
	mov	r0, r6
	moveq	ip, #3
	movne	ip, #1
	strb	ip, [r4, #259]
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L570
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #263]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #264]
	bne	.L585
.L571:
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L586
.L573:
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #267]
	mov	r0, r6
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #269]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L570:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L582:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #14]	@ zero_extendqisi2
	strb	r0, [r4, #255]
	b	.L564
.L585:
	add	r3, r4, #272
	ldrb	r2, [r4, #340]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L571
.L583:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #256]
	b	.L566
.L584:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #257]
	b	.L568
.L586:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #265]
	cmp	r0, #1
	bne	.L573
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #266]
	b	.L573
.L588:
	.align	2
.L587:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseMPBPicHdr, .-VC1_Vfmw_ParseMPBPicHdr
	.align	2
	.global	VC1_Vfmw_ParseSMPPicHdr
	.type	VC1_Vfmw_ParseSMPPicHdr, %function
VC1_Vfmw_ParseSMPPicHdr:
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
	ldrb	r7, [r2, #258]	@ zero_extendqisi2
	mov	r5, r0
	mov	r6, r1
	mov	r0, r1
	mov	r4, r2
	mov	r1, r7
	bl	VC1_SetCurPicResolutionInfo
	ldr	r3, [r5, #16]
	cmp	r3, #1
	ble	.L627
	ldr	r9, .L632
	mov	r2, #100
	mov	r1, #0
	add	r0, r4, #248
	add	r8, r6, #32768
	ldr	r3, [r9, #48]
	blx	r3
	add	r0, r6, #24064
	ldr	r3, [r9, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #216
	strb	r7, [r4, #258]
	blx	r3
	ldr	r2, [r8, #3800]
	ldr	r1, .L632+4
	mov	r0, #18
	bl	dprint_vfmw
	mov	r0, r5
	bl	BsPos
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r4, #324]
	bne	.L592
	ldrb	r2, [r4, #248]	@ zero_extendqisi2
.L593:
	ldr	r1, .L632+8
	mov	r0, #18
	bl	dprint_vfmw
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #249]
	bne	.L628
.L594:
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	mov	r1, #1
	mov	r0, r5
	cmp	r3, #0
	bne	.L595
	bl	BsGet
	adds	r0, r0, #0
	movne	r0, #1
	strb	r0, [r4, #251]
.L596:
	mov	r3, #0
	strb	r0, [r6, #2]
	strb	r3, [r6, #4]
	ldrb	r3, [r4, #251]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L608
.L601:
	.word	.L600
	.word	.L602
	.word	.L603
	.word	.L608
	.word	.L604
.L604:
	ldrb	r7, [r6, #3112]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L629
.L608:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L627:
	mov	r3, #5
	mov	r0, #1
	strb	r3, [r4, #251]
	strb	r3, [r6, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L595:
	bl	BsGet
	cmp	r0, #1
	beq	.L625
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	beq	.L630
	mov	r2, r4
	mov	r3, #2
	add	r1, r4, #344
	strb	r3, [r2, #251]!
	mov	r0, r5
	bl	VC1_DecBfractionSMP
	uxtb	r0, r0
	strb	r0, [r4, #252]
	cmp	r0, #21
	ldrneb	r0, [r4, #251]	@ zero_extendqisi2
	bne	.L596
	b	.L608
.L592:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r2, r0
	strb	r2, [r4, #248]
	b	.L593
.L630:
	mov	r0, #0
.L625:
	strb	r0, [r4, #251]
	b	.L596
.L603:
	ldrb	r7, [r6, #3112]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L608
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	r0, #1
	mov	r6, r0
	beq	.L605
	mov	r0, r7
	ldr	r1, .L632+12
	bl	dprint_vfmw
	b	.L605
.L602:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	r6, r0
.L605:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #324]
	rsb	r0, r3, r0
	str	r0, [r4, #324]
	mov	r0, r5
	ldr	r4, [r8, #3824]
	bl	BsPos
	mov	r4, r4, asl #3
	rsb	r0, r0, r4
	cmp	r0, #0
	ble	.L631
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L600:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	r6, r0
	b	.L605
.L628:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #250]
	b	.L594
.L631:
	ldr	r1, .L632+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L629:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	r0, #1
	mov	r6, r0
	beq	.L605
	mov	r0, r7
	ldr	r1, .L632+20
	bl	dprint_vfmw
	b	.L605
.L633:
	.align	2
.L632:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC46
	.word	.LC45
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseSMPPicHdr, .-VC1_Vfmw_ParseSMPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvSeqHdr
	.type	VC1_Vfmw_ParseAdvSeqHdr, %function
VC1_Vfmw_ParseAdvSeqHdr:
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
	ldr	r3, .L651
	mov	r5, r0
	mov	r4, r2
	mov	r1, #0
	add	r0, r2, #16
	mov	r2, #172
	ldr	r3, [r3, #48]
	mov	r6, #2
	blx	r3
	mov	r0, r5
	bl	BsPos
	mov	r1, r6
	str	r0, [r4, #184]
	mov	r0, r5
	bl	BsGet
	strb	r6, [r4, #16]
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #17]
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #18]
	mov	r0, r5
	bl	BsGet
	mov	r1, #5
	strb	r0, [r4, #19]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #20]
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	strb	r0, [r4, #21]
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	uxth	r3, r0
	mov	r0, r5
	add	r3, r3, #1
	mov	r3, r3, asl #1
	strh	r3, [r4, #172]	@ movhi
	bl	BsGet
	mov	r1, #1
	uxth	r3, r0
	mov	r0, r5
	add	r3, r3, r1
	mov	r3, r3, asl r1
	strh	r3, [r4, #174]	@ movhi
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #22]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #23]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #24]
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #25]
	mov	r0, r5
	bl	BsSkip
	mov	r0, r5
	mov	r1, #1
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #26]
	cmp	r6, #1
	beq	.L648
	ldrh	r2, [r4, #172]
	ldrh	r3, [r4, #174]
	strh	r2, [r4, #176]	@ movhi
	strh	r3, [r4, #178]	@ movhi
.L641:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #39]
	cmp	r0, #1
	beq	.L642
.L644:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #184]
	mov	r2, #1
	rsb	r0, r3, r0
	str	r0, [r4, #184]
.L643:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L642:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #40]
	cmp	r0, #31
	movhi	r2, #0
	bhi	.L643
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	strb	r0, [r4, #41]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #42]
	ble	.L644
	add	r7, r4, #42
	mov	r6, #0
.L645:
	mov	r1, #16
	mov	r0, r5
	bl	BsGet
	mov	r1, #16
	add	r6, r6, #1
	strh	r0, [r7, #2]!	@ movhi
	mov	r0, r5
	bl	BsGet
	strh	r0, [r7, #64]	@ movhi
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, r6
	bgt	.L645
	b	.L644
.L648:
	mov	r1, #14
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	add	r3, r0, #1
	mov	r0, r5
	strh	r3, [r4, #176]	@ movhi
	bl	BsGet
	mov	r1, r6
	add	r3, r0, #1
	mov	r0, r5
	strh	r3, [r4, #178]	@ movhi
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #27]
	cmp	r0, #1
	beq	.L649
.L637:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r1, r0
	strb	r1, [r4, #31]
	cmp	r1, #1
	beq	.L650
.L639:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #35]
	cmp	r0, #1
	bne	.L641
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #36]
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #37]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #38]
	b	.L641
.L650:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #32]
	cmp	r0, #0
	bne	.L640
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #4
	strb	r0, [r4, #33]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #34]
	b	.L639
.L649:
	mov	r1, #4
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #28]
	cmp	r0, #15
	bne	.L637
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	mov	r1, #8
	strb	r0, [r4, #29]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #30]
	b	.L637
.L640:
	mov	r1, #16
	mov	r0, r5
	bl	BsGet
	strh	r0, [r4, #180]	@ movhi
	b	.L639
.L652:
	.align	2
.L651:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvSeqHdr, .-VC1_Vfmw_ParseAdvSeqHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvEntptHdr
	.type	VC1_Vfmw_ParseAdvEntptHdr, %function
VC1_Vfmw_ParseAdvEntptHdr:
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
	ldr	r3, .L678
	mov	r4, r2
	mov	r5, r0
	mov	r1, #0
	add	r0, r2, #188
	mov	r2, #60
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r5
	bl	BsPos
	mov	r1, #1
	str	r0, [r4, #244]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #188]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #189]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #190]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #191]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #192]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #193]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #194]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #195]
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #196]
	mov	r0, r5
	bl	BsGet
	mov	r1, #2
	strb	r0, [r4, #197]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #39]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #198]
	beq	.L654
.L657:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #199]
	cmp	r0, #1
	ldrneh	r2, [r4, #240]
	beq	.L674
.L659:
	ldrh	r1, [r4, #238]
	ldrh	r0, [r4, #172]
	cmp	r1, #15
	movhi	r3, #0
	movls	r3, #1
	cmp	r1, r0
	orrhi	r3, r3, #1
	ldrb	r1, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #0
	ldrh	r3, [r4, #174]
	strneh	r0, [r4, #238]	@ movhi
	cmp	r3, r2
	cmpcs	r2, #15
	strlsh	r3, [r4, #240]	@ movhi
	cmp	r1, #1
	beq	.L675
.L662:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #201]
	cmp	r0, #1
	beq	.L676
.L663:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #203]
	cmp	r0, #1
	beq	.L677
.L664:
	mov	r0, r5
	bl	BsPos
	ldr	r3, [r4, #244]
	rsb	r3, r3, r0
	mov	r0, #1
	str	r3, [r4, #244]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L654:
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, #0
	ble	.L657
	add	r7, r4, #204
	mov	r6, #0
.L658:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	add	r6, r6, #1
	strb	r0, [r7, #1]!
	ldrb	r3, [r4, #40]	@ zero_extendqisi2
	cmp	r3, r6
	bgt	.L658
	b	.L657
.L677:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #204]
	b	.L664
.L674:
	mov	r1, #12
	mov	r0, r5
	bl	BsGet
	mov	r1, #12
	add	r3, r0, #1
	mov	r0, r5
	mov	r3, r3, asl #1
	strh	r3, [r4, #238]	@ movhi
	bl	BsGet
	add	r0, r0, #1
	mov	r2, r0, asl #1
	uxth	r2, r2
	strh	r2, [r4, #240]	@ movhi
	b	.L659
.L675:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #200]
	b	.L662
.L676:
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #202]
	b	.L663
.L679:
	.align	2
.L678:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvEntptHdr, .-VC1_Vfmw_ParseAdvEntptHdr
	.align	2
	.global	VC1_DecFcm
	.type	VC1_DecFcm, %function
VC1_DecFcm:
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
	mov	r1, #2
	mov	r5, r0
	bl	BsShow
	mov	r4, r0
	cmp	r4, #1
	mov	r0, r5
	ble	.L683
	mov	r1, #2
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L683:
	mov	r1, #1
	mov	r4, #0
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_DecFcm, .-VC1_DecFcm
	.align	2
	.global	VC1_DecAdvPtype
	.type	VC1_DecAdvPtype, %function
VC1_DecAdvPtype:
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
	mov	r1, #4
	mov	r4, r0
	bl	BsShow
	cmp	r0, #7
	movle	r1, #1
	movle	r5, r1
	ble	.L685
	cmp	r0, #11
	movle	r1, #2
	movle	r5, r1
	bgt	.L690
.L685:
	mov	r0, r4
	bl	BsSkip
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L690:
	cmp	r0, #13
	movle	r1, #3
	movle	r5, #0
	ble	.L685
	cmp	r0, #14
	mov	r1, #4
	movne	r5, #5
	moveq	r5, r1
	b	.L685
	UNWIND(.fnend)
	.size	VC1_DecAdvPtype, .-VC1_DecAdvPtype
	.align	2
	.global	VC1_Vfmw_ParseAdvIPicHdr
	.type	VC1_Vfmw_ParseAdvIPicHdr, %function
VC1_Vfmw_ParseAdvIPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #1
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	ldrb	r1, [r4, #23]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r0, [r4, #348]
	beq	.L707
.L692:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	bne	.L693
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L708
.L693:
	mov	r1, #5
	mov	r0, r6
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L702
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L712
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L709
.L698:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L710
.L700:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L711
.L701:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L702
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #371]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #372]
	moveq	r0, #1
	beq	.L695
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L702:
	mov	r0, #0
.L695:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L709:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L698
.L708:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L693
.L707:
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #356]
	b	.L692
.L710:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L700
.L711:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L701
.L713:
	.align	2
.L712:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvIPicHdr, .-VC1_Vfmw_ParseAdvIPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPPicHdr
	.type	VC1_Vfmw_ParseAdvPPicHdr, %function
VC1_Vfmw_ParseAdvPPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #1
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #348]
	beq	.L715
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L715
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L752
.L717:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L732
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L765
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L753
.L722:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L754
.L724:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L755
.L725:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L756
.L726:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L757
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strneb	r3, [r4, #373]
	beq	.L758
.L730:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #374]
	mov	r0, r5
	bl	BsGet
	cmp	r0, #1
	str	r0, [r4, #468]
	beq	.L759
.L731:
	mov	r3, #0
	strb	r3, [r4, #382]
.L728:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L732
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L760
.L733:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldr	r6, [r4, #392]
	cmp	r6, #2
	uxtb	r0, r0
	strb	r0, [r4, #367]
	beq	.L761
.L736:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L762
.L738:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L763
.L740:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L732:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L715:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L717
.L752:
	ldr	r2, [r4, #392]
	cmp	r2, #0
	bne	.L717
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #357]
	b	.L717
.L757:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	bne	.L728
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmode2
	mov	r1, #6
	strb	r0, [r4, #363]
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #365]
	b	.L728
.L753:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L722
.L762:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L738
.L756:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L726
.L754:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L724
.L755:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L725
.L763:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L740
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L740
.L761:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #374]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #376]
	movne	r0, #0
	beq	.L764
.L737:
	strb	r0, [r4, #377]
	b	.L736
.L760:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L733
.L758:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L730
.L759:
	mov	r1, #6
	mov	r0, r5
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #365]
	b	.L731
.L764:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	b	.L737
.L766:
	.align	2
.L765:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPPicHdr, .-VC1_Vfmw_ParseAdvPPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvBPicHdr
	.type	VC1_Vfmw_ParseAdvBPicHdr, %function
VC1_Vfmw_ParseAdvBPicHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r7, r1
	mov	r1, #1
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #348]
	beq	.L768
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L768
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L810
.L770:
	cmp	r3, #0
	bne	.L774
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	uxtb	r0, r0
	strb	r0, [r4, #350]
	cmp	r0, #21
	beq	.L772
.L774:
	mov	r1, #5
	mov	r0, r5
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L772
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L822
	sub	r0, fp, #164
	bl	memcpy
	cmp	r8, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L811
	cmp	r8, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L812
.L780:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L813
.L781:
	ldr	r3, [r4, #392]
	cmp	r3, #2
	beq	.L814
.L782:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L815
.L783:
	ldr	r3, [r4, #392]
	cmp	r3, #0
	beq	.L816
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L817
.L787:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #468]
.L786:
	mov	r1, r7
	mov	r3, #0
	mov	r2, r4
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L772
	ldr	r1, [r4, #392]
	cmp	r1, #2
	beq	.L818
.L788:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldr	r6, [r4, #392]
	cmp	r6, #2
	uxtb	r0, r0
	strb	r0, [r4, #367]
	beq	.L819
.L791:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L820
.L792:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L821
.L794:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L772:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L768:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r1, [r4, #25]	@ zero_extendqisi2
	ldr	r3, [r4, #392]
	cmp	r1, #1
	strb	r0, [r4, #356]
	bne	.L770
.L810:
	cmp	r3, #0
	bne	.L774
	mov	r0, r5
	bl	BsGet
	ldr	r3, [r4, #392]
	strb	r0, [r4, #357]
	b	.L770
.L816:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	cmp	r0, #0
	moveq	r3, #3
	movne	r3, #1
	strb	r3, [r4, #362]
	b	.L786
.L811:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r8, [r4, #198]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	strb	r0, [r4, #351]
	strneb	r3, [r4, #359]
	bne	.L780
.L812:
	mov	r1, r8
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L780
.L814:
	add	r1, r4, #496
	mov	r0, r5
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L782
.L815:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L783
.L813:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L781
.L820:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L792
.L821:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L794
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L794
.L819:
	mov	r1, r6
	mov	r0, r5
	bl	BsGet
	mov	r1, r6
	strb	r0, [r4, #376]
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L791
.L818:
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #375]
	b	.L788
.L817:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L787
.L823:
	.align	2
.L822:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvBPicHdr, .-VC1_Vfmw_ParseAdvBPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvFramePicHdr
	.type	VC1_Vfmw_ParseAdvFramePicHdr, %function
VC1_Vfmw_ParseAdvFramePicHdr:
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
	mov	r6, r1
	mov	r1, #4
	mov	r4, r2
	mov	r5, r0
	bl	BsShow
	cmp	r0, #7
	movle	r7, #1
	movle	r1, r7
	ble	.L825
	cmp	r0, #11
	movle	r7, #2
	movle	r1, r7
	bgt	.L856
.L825:
	mov	r0, r5
	bl	BsSkip
	strb	r7, [r4, #349]
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L857
.L826:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	beq	.L827
	cmp	r3, #0
	beq	.L858
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #352]
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #353]
	beq	.L859
.L831:
	cmp	r3, #1
	bne	.L833
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #492]
	bne	.L842
.L834:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L842
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L842
	mov	r7, r4
	mov	r8, #0
.L843:
	mov	r1, #18
	mov	r0, r5
	bl	BsGet
	mov	r1, #18
	add	r8, r8, #1
	add	r7, r7, #4
	str	r0, [r7, #396]
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #412]
	mov	r0, r5
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #428]
	mov	r0, r5
	bl	BsGet
	str	r0, [r7, #444]
	ldr	r3, [r4, #492]
	cmp	r3, r8
	bgt	.L843
	b	.L842
.L827:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L830
.L833:
	mov	r3, #1
	str	r3, [r4, #492]
.L832:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L834
.L842:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L835
.L837:
	.word	.L840
	.word	.L838
	.word	.L839
	.word	.L835
	.word	.L840
	.word	.L848
.L840:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvIPicHdr
.L858:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L831
.L859:
	cmp	r3, #1
	beq	.L860
.L830:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L832
.L856:
	cmp	r0, #13
	movle	r7, #0
	movle	r1, #3
	ble	.L825
	cmp	r0, #14
	moveq	r7, #4
	movne	r7, #5
	movne	r1, #4
	moveq	r1, r7
	b	.L825
.L857:
	mov	r1, #8
	mov	r0, r5
	bl	BsGet
	str	r0, [r4, #396]
	b	.L826
.L848:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L838:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPPicHdr
.L839:
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvBPicHdr
.L835:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L860:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L832
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvFramePicHdr, .-VC1_Vfmw_ParseAdvFramePicHdr
	.align	2
	.global	VC1_DecRefdist
	.type	VC1_DecRefdist, %function
VC1_DecRefdist:
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
	mov	r1, #5
	mov	r5, r0
	bl	BsShow
	cmp	r0, #23
	bgt	.L862
	mov	r4, r0, asr #3
	mov	r1, #2
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L862:
	cmp	r0, #27
	movle	r4, #3
	bgt	.L868
.L864:
	mov	r0, r5
	mov	r1, r4
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L868:
	cmp	r0, #29
	movgt	r4, #5
	movle	r4, #4
	b	.L864
	UNWIND(.fnend)
	.size	VC1_DecRefdist, .-VC1_DecRefdist
	.align	2
	.global	VC1_DecIntCompField
	.type	VC1_DecIntCompField, %function
VC1_DecIntCompField:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	lr, .L870
	mov	r4, r0
	sub	ip, fp, #52
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r4
	mov	r1, #2
	bl	BsShow
	sub	r3, fp, #20
	add	r3, r3, r0, lsl #3
	mov	r0, r4
	ldr	r1, [r3, #-28]
	ldr	r4, [r3, #-32]
	bl	BsSkip
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L871:
	.align	2
.L870:
	.word	.LANCHOR0+696
	UNWIND(.fnend)
	.size	VC1_DecIntCompField, .-VC1_DecIntCompField
	.align	2
	.global	VC1_Vfmw_ParseAdvIFieldHdr
	.type	VC1_Vfmw_ParseAdvIFieldHdr, %function
VC1_Vfmw_ParseAdvIFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r8, r1
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L881
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L889
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #36
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L886
.L877:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L887
.L879:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L888
.L880:
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	mov	r0, r6
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L881
	mov	r0, r6
	bl	VC1_DecTransacfrm
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #371]
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #372]
	moveq	r0, #1
	beq	.L874
	mov	r0, r6
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	bl	VC1_VopDQuant
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L881:
	mov	r0, #0
.L874:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L886:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L877
.L887:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L879
.L888:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L880
.L890:
	.align	2
.L889:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvIFieldHdr, .-VC1_Vfmw_ParseAdvIFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPFieldHdr
	.type	VC1_Vfmw_ParseAdvPFieldHdr, %function
VC1_Vfmw_ParseAdvPFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #128)
	sub	sp, sp, #128
	mov	r1, #5
	mov	r4, r2
	mov	r6, r0
	bl	BsGet
	uxtb	r5, r0
	strb	r5, [r4, #358]
	cmp	r5, #0
	beq	.L892
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L929
	sub	r0, fp, #156
	bl	memcpy
	cmp	r7, #0
	mov	r3, r5
	subeq	r3, fp, #28
	addeq	r3, r3, r5, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r5, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L920
.L895:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L921
.L897:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L922
.L898:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #380]
	cmp	r0, #0
	beq	.L923
.L899:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L924
.L900:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L925
.L901:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_DecMvmodeProgrP
	uxtb	r0, r0
	strb	r0, [r4, #362]
	cmp	r0, #4
	beq	.L926
.L903:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #380]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r1, #2
	movne	r1, #3
	strb	r0, [r4, #375]
	mov	r0, r6
	bl	BsGet
	mov	r1, #3
	uxtb	r0, r0
	strb	r0, [r4, #366]
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #367]
	beq	.L907
	movw	r3, #362
	ldrh	r3, [r4, r3]
	cmp	r3, #4
	beq	.L907
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L927
.L909:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L928
.L911:
	mov	r0, r6
	mov	r5, #1
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #372]
.L892:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L907:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	strb	r0, [r4, #377]
	beq	.L909
.L927:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_VopDQuant
	b	.L909
.L923:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	clz	r0, r0
	mov	r0, r0, lsr #5
	strb	r0, [r4, #381]
	b	.L899
.L920:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L895
.L924:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L900
.L925:
	mov	r0, r6
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L901
.L921:
	mov	r1, r7
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L897
.L928:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L911
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L911
.L922:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L898
.L926:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r6
	bl	VC1_DecMvmode2
	strb	r0, [r4, #363]
	mov	r0, r6
	bl	VC1_DecIntCompField
	mov	r1, #6
	str	r0, [r4, #476]
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	strb	r0, [r4, #364]
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #476]
	cmp	r3, #0
	strb	r0, [r4, #365]
	bne	.L903
	mov	r1, #6
	mov	r0, r6
	bl	BsGet
	mov	r1, #6
	str	r0, [r4, #480]
	mov	r0, r6
	bl	BsGet
	str	r0, [r4, #484]
	b	.L903
.L930:
	.align	2
.L929:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPFieldHdr, .-VC1_Vfmw_ParseAdvPFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvBFieldHdr
	.type	VC1_Vfmw_ParseAdvBFieldHdr, %function
VC1_Vfmw_ParseAdvBFieldHdr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #132)
	sub	sp, sp, #132
	mov	r3, #1
	mov	r8, r1
	strb	r3, [r2, #380]
	mov	r1, #5
	mov	r4, r2
	mov	r5, r0
	bl	BsGet
	uxtb	r6, r0
	strb	r6, [r4, #358]
	cmp	r6, #0
	beq	.L942
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	mov	r2, #128
	ldr	r1, .L962
	sub	r0, fp, #164
	bl	memcpy
	cmp	r7, #0
	mov	r3, r6
	subeq	r3, fp, #36
	addeq	r3, r3, r6, lsl #2
	ldreq	r3, [r3, #-128]
	cmp	r6, #8
	str	r3, [r4, #464]
	movhi	r3, #0
	strhib	r3, [r4, #351]
	bls	.L954
.L936:
	cmp	r7, #1
	movne	r3, #0
	strneb	r3, [r4, #359]
	beq	.L955
.L938:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L956
.L939:
	ldrb	r3, [r4, #194]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L957
.L940:
	ldrb	r3, [r4, #200]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L958
.L941:
	ldrb	r1, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_DecMvmodeInterB
	mov	r1, r8
	mov	r3, #0
	mov	r2, r4
	strb	r0, [r4, #362]
	mov	r0, r5
	bl	BPD_Drv
	cmp	r0, #1
	beq	.L942
	mov	r1, #3
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #375]
	mov	r0, r5
	bl	BsGet
	mov	r1, #3
	strb	r0, [r4, #366]
	mov	r0, r5
	bl	BsGet
	ldrb	r3, [r4, #362]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #367]
	beq	.L959
.L943:
	ldrb	r1, [r4, #195]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L960
.L944:
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L961
.L946:
	mov	r0, r5
	bl	VC1_DecTransacfrm
	mov	r1, #1
	strb	r0, [r4, #370]
	mov	r0, r5
	bl	BsGet
	mov	r3, #1
	strb	r0, [r4, #372]
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L942:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L954:
	mov	r1, #1
	mov	r0, r5
	bl	BsGet
	ldrb	r7, [r4, #198]	@ zero_extendqisi2
	strb	r0, [r4, #351]
	b	.L936
.L960:
	add	r3, r4, #508
	ldrb	r2, [r4, #464]	@ zero_extendqisi2
	mov	r0, r5
	bl	VC1_VopDQuant
	b	.L944
.L959:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #377]
	b	.L943
.L956:
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #360]
	b	.L939
.L957:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #361]
	b	.L940
.L955:
	mov	r1, r7
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #359]
	b	.L938
.L958:
	mov	r0, r5
	bl	VC1_DecMvrange
	strb	r0, [r4, #373]
	b	.L941
.L961:
	mov	r0, r5
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #368]
	cmp	r0, #1
	bne	.L946
	mov	r1, #2
	mov	r0, r5
	bl	BsGet
	strb	r0, [r4, #369]
	b	.L946
.L963:
	.align	2
.L962:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvBFieldHdr, .-VC1_Vfmw_ParseAdvBFieldHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvFieldPicHdr
	.type	VC1_Vfmw_ParseAdvFieldPicHdr, %function
VC1_Vfmw_ParseAdvFieldPicHdr:
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
	ldrb	r3, [r1, #8]	@ zero_extendqisi2
	mov	r5, r1
	mov	r6, r0
	mov	r4, r2
	cmp	r3, #0
	beq	.L965
	add	r3, r1, #20480
	ldr	r3, [r3, #3796]
	cmp	r3, #0
	bne	.L965
	ldr	r3, [r2, #504]
	strb	r3, [r2, #349]
	ldrb	r3, [r1, #3513]	@ zero_extendqisi2
	strb	r3, [r1, #2]
.L983:
	ldrb	r3, [r4, #349]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L992
.L987:
	.word	.L986
	.word	.L988
	.word	.L989
	.word	.L992
	.word	.L986
.L965:
	mov	r1, #3
	mov	r0, r6
	bl	BsGet
	ldr	r3, .L1011
	str	r0, [r4, #472]
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #732]
	ldr	r2, [r0, #728]
	str	r3, [r4, #504]
	str	r2, [r4, #500]
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	cmp	r1, #0
	uxtbeq	r3, r2
	uxtbne	r3, r3
	strb	r3, [r4, #349]
	ldrb	r3, [r5, #3513]	@ zero_extendqisi2
	strb	r3, [r5, #2]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1004
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	bne	.L1005
.L970:
	mov	r2, #1
	cmp	r3, r2
	strb	r2, [r4, #352]
	beq	.L973
.L976:
	mov	r3, #1
	str	r3, [r4, #492]
.L975:
	ldrb	r1, [r4, #190]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L977
.L980:
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #348]
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #191]	@ zero_extendqisi2
	cmp	r3, #1
	strb	r0, [r4, #356]
	beq	.L1006
.L979:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	ble	.L983
.L984:
	add	r1, r4, #496
	mov	r0, r6
	bl	VC1_DecBfraction
	strb	r0, [r4, #350]
	b	.L983
.L1005:
	cmp	r3, #0
	beq	.L1007
	mov	r1, #1
	mov	r0, r6
	bl	BsGet
	mov	r1, #1
	strb	r0, [r4, #352]
	mov	r0, r6
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #353]
	beq	.L1008
.L974:
	cmp	r3, #1
	bne	.L976
	ldrb	r3, [r4, #354]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [r4, #492]
	b	.L975
.L989:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L985:
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	bne	.L1009
.L990:
	subs	r3, r3, #1
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L988:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	ldrb	r3, [r4, #352]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	beq	.L990
.L1009:
	adds	r3, r3, #0
	movne	r3, #1
	strb	r3, [r4, #389]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L986:
	mov	r0, r6
	mov	r2, r4
	mov	r1, r5
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L985
.L1004:
	mov	r1, #8
	mov	r0, r6
	bl	BsGet
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #23]	@ zero_extendqisi2
	str	r0, [r4, #396]
	beq	.L970
	b	.L1005
.L1007:
	mov	r1, #2
	mov	r0, r6
	bl	BsGet
	ldrb	r2, [r4, #23]	@ zero_extendqisi2
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r0, [r4, #354]
	bne	.L974
.L1008:
	cmp	r3, #1
	beq	.L1010
.L973:
	mov	r3, #2
	str	r3, [r4, #492]
	b	.L975
.L992:
	mov	r0, #0
	b	.L985
.L1006:
	ldr	r3, [r4, #472]
	cmp	r3, #3
	bgt	.L984
	mov	r0, r6
	bl	VC1_DecRefdist
	strb	r0, [r4, #379]
	b	.L979
.L977:
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #355]
	cmp	r0, #1
	bne	.L980
	ldr	r3, [r4, #492]
	cmp	r3, #0
	ble	.L980
	mov	r7, r4
	mov	r8, #0
.L981:
	mov	r1, #18
	mov	r0, r6
	bl	BsGet
	mov	r1, #18
	add	r8, r8, #1
	add	r7, r7, #4
	str	r0, [r7, #396]
	mov	r0, r6
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #412]
	mov	r0, r6
	bl	BsGet
	mov	r1, #14
	str	r0, [r7, #428]
	mov	r0, r6
	bl	BsGet
	str	r0, [r7, #444]
	ldr	r3, [r4, #492]
	cmp	r3, r8
	bgt	.L981
	b	.L980
.L1010:
	ldrb	r3, [r4, #353]	@ zero_extendqisi2
	add	r3, r3, #2
	str	r3, [r4, #492]
	b	.L975
.L1012:
	.align	2
.L1011:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvFieldPicHdr, .-VC1_Vfmw_ParseAdvFieldPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvPicHdr
	.type	VC1_Vfmw_ParseAdvPicHdr, %function
VC1_Vfmw_ParseAdvPicHdr:
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
	mov	r6, r0
	mov	r1, #0
	mov	r0, r4
	mov	r5, r2
	bl	VC1_SetCurPicResolutionInfo
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1014
	add	r3, r4, #20480
	ldr	r3, [r3, #3796]
	cmp	r3, #0
	beq	.L1023
.L1014:
	ldrb	r8, [r5, #23]	@ zero_extendqisi2
	cmp	r8, #1
	movne	r3, #0
	movne	r0, r3
	beq	.L1024
.L1016:
	str	r0, [r5, #392]
.L1015:
	cmp	r3, #0
	mov	r2, r5
	mov	r1, r4
	mov	r0, r6
	beq	.L1025
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFieldPicHdr
.L1023:
	ldr	r3, [r5, #392]
	bic	r3, r3, #2
	b	.L1015
.L1025:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvFramePicHdr
.L1024:
	mov	r1, #2
	mov	r0, r6
	bl	BsShow
	cmp	r0, #1
	mov	r7, r0
	ble	.L1026
	mov	r1, #2
	mov	r0, r6
	bl	BsSkip
	bic	r3, r7, #2
	mov	r0, r7
	b	.L1016
.L1026:
	mov	r1, r8
	mov	r0, r6
	bl	BsSkip
	mov	r3, #0
	mov	r0, r3
	b	.L1016
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvPicHdr, .-VC1_Vfmw_ParseAdvPicHdr
	.align	2
	.global	VC1_Vfmw_ParseAdvSlcHdr
	.type	VC1_Vfmw_ParseAdvSlcHdr, %function
VC1_Vfmw_ParseAdvSlcHdr:
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
	add	r3, r1, #20480
	mov	r7, r1
	mov	r1, #9
	mov	r5, r2
	ldr	r4, [r3, #3796]
	mov	r6, r0
	bl	BsGet
	mov	r1, #1
	mov	r3, r4, asl #4
	sub	r4, r3, r4, asl #2
	add	r4, r5, r4
	add	r4, r4, #520
	str	r0, [r4, #8]
	mov	r0, r6
	bl	BsGet
	uxtb	r0, r0
	strb	r0, [r4, #4]
	cmp	r0, #1
	beq	.L1029
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1029:
	add	lr, r5, #188
	add	ip, r7, #6912
	add	ip, ip, #36
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	r0, r7, #6720
	add	r1, r5, #16
	mov	r2, #172
	add	r0, r0, #56
	bl	memcpy
	add	r0, r7, #7104
	add	r1, r5, #348
	mov	r2, #176
	add	r0, r0, #4
	bl	memcpy
	add	r2, r7, #6720
	mov	r0, r6
	add	r2, r2, #40
	mov	r1, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvPicHdr
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvSlcHdr, .-VC1_Vfmw_ParseAdvSlcHdr
	.align	2
	.global	VC1_Vfmw_next_start_code
	.type	VC1_Vfmw_next_start_code, %function
VC1_Vfmw_next_start_code:
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
	mov	r5, r0
	bl	BsToNextByte
	mov	r0, r5
	bl	BsResidBits
	add	r6, r0, #7
	cmp	r0, #0
	movlt	r0, r6
	mov	r6, r0, asr #3
	cmp	r6, #3
	subgt	r6, r6, #3
	movgt	r4, #0
	bgt	.L1033
	b	.L1034
.L1039:
	bl	BsSkip
	cmp	r4, r6
	beq	.L1034
.L1033:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	bne	.L1039
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1034:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_next_start_code, .-VC1_Vfmw_next_start_code
	.align	2
	.global	VC1_Vfmw_UserData
	.type	VC1_Vfmw_UserData, %function
VC1_Vfmw_UserData:
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
	.size	VC1_Vfmw_UserData, .-VC1_Vfmw_UserData
	.align	2
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
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
	add	r9, r0, #20480
	ldr	r3, [r0, #3128]
	mov	r5, r0
	ldr	r6, [r9, #3796]
	movw	ip, #24288
	str	r1, [fp, #-48]
	movw	r0, #24280
	movw	lr, #24296
	mov	r8, r6, asl #4
	mov	r7, r6, asl #6
	rsb	r4, r8, r7
	add	r4, r5, r4
	add	r1, r4, #24064
	strb	r6, [r4, ip]
	add	ip, r1, #216
	str	ip, [fp, #-52]
	mov	r10, r1
	str	ip, [fp, #-56]
	ldr	ip, [r3, #24]
	add	r2, r2, ip, lsr #3
	str	r2, [r4, r0]
	ldr	r2, [r3, #24]
	and	r2, r2, #7
	str	r2, [r4, lr]
	ldr	r2, [r3, #16]
	ldr	r3, [r3, #24]
	rsb	r3, r3, r2, lsl #3
	str	r3, [r1, #236]
	ldr	r0, [r4, r0]
	bl	MEM_Vir2Phy
	add	r3, r5, #32768
	add	r2, r4, #24320
	str	r0, [r10, #228]
	ldr	r1, [r3, #3832]
	str	r1, [r2]
	ldr	r1, [r3, #3808]
	cmp	r1, #0
	beq	.L1042
	ldr	r0, [r3, #3820]
	ldr	ip, [fp, #-52]
	cmp	r0, #0
	bne	.L1061
.L1042:
	rsb	r3, r8, r7
	mov	r2, #0
	add	r3, r5, r3
	movw	ip, #24312
	add	lr, r3, #24064
	add	r4, r3, #24320
	str	r2, [lr, #220]
	mov	r0, lr
	add	lr, lr, #216
	str	r2, [r3, ip]
	str	r2, [r0, #252]
	str	r2, [r0, #244]
	str	r2, [r4, #4]
.L1043:
	ldr	r0, [r9, #3716]
	sub	r6, r8, r6, asl #2
	ldr	ip, [r9, #3712]
	ldrb	r4, [r5, #8]	@ zero_extendqisi2
	mul	ip, ip, r0
	cmp	r4, #0
	sub	r10, ip, #1
	beq	.L1044
	ldr	r2, [fp, #-48]
	add	r3, r0, #1
	rsb	r1, r8, r7
	movw	lr, #24304
	add	r6, r2, r6
	add	r3, r3, r3, lsr #31
	add	r1, r5, r1
	add	r6, r6, #520
	ldr	r2, [r6, #8]
	sub	r3, r2, r3, asr #1
	str	r3, [r1, lr]
	cmp	r10, r3
	movcs	ip, #0
	movcc	ip, #1
	cmp	r3, #0
	movle	ip, #0
	cmp	ip, #0
	bne	.L1062
.L1045:
	rsb	r7, r8, r7
	add	r5, r5, r7
	add	r3, r5, #24064
	add	r3, r3, #232
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L1047
	add	r3, r5, #24064
	add	r3, r3, #216
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1048
	add	r5, r5, #24064
	ldr	r3, [r5, #252]
	cmp	r3, #0
	ble	.L1047
.L1048:
	ldr	r3, [r9, #3796]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r9, #3796]
.L1046:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1044:
	ldr	r3, [fp, #-48]
	rsb	r2, r8, r7
	add	r2, r5, r2
	movw	r1, #24304
	add	r6, r3, r6
	add	r6, r6, #520
	ldr	r3, [r6, #8]
	cmp	r10, r3
	str	r3, [r2, r1]
	bcs	.L1045
	ldr	r2, [r6, #8]
	mov	r0, #1
	str	r10, [sp]
	ldr	r1, .L1063
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1061:
	movw	lr, #24312
	str	r1, [ip, #4]
	mov	ip, #0
	str	ip, [r4, lr]
	ldr	ip, [r3, #3828]
	add	r1, r4, #24064
	str	r0, [r1, #244]
	mov	ip, ip, asl #3
	str	ip, [r1, #252]
	ldr	r3, [r3, #3836]
	str	r3, [r2, #4]
	b	.L1043
.L1062:
	ldr	r2, [r6, #8]
	ldr	r1, .L1063+4
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1046
.L1047:
	ldr	r1, .L1063+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1064:
	.align	2
.L1063:
	.word	.LC48
	.word	.LC47
	.word	.LC49
	UNWIND(.fnend)
	.size	VC1_RecordSlcStream, .-VC1_RecordSlcStream
	.align	2
	.global	VC1_Vfmw_UpdateAdvSPS
	.type	VC1_Vfmw_UpdateAdvSPS, %function
VC1_Vfmw_UpdateAdvSPS:
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
	add	r5, r0, #8192
	movw	r3, #2402
	ldrh	r2, [r1, #238]
	mov	r4, r1
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	beq	.L1066
	adds	r3, r2, #15
	add	r0, r0, #20480
	addmi	r3, r2, #30
	movw	r1, #2404
	mov	r3, r3, asr #4
	str	r3, [r0, #3712]
	ldrh	r3, [r4, #238]
	str	r3, [r0, #3728]
	ldrh	r2, [r4, #240]
	ldrh	r3, [r5, r1]
	cmp	r3, r2
	beq	.L1067
.L1068:
	adds	r3, r2, #15
	addmi	r3, r2, #30
	mov	r3, r3, asr #4
	str	r3, [r0, #3716]
	ldrh	r3, [r4, #240]
	str	r3, [r0, #3732]
.L1067:
	add	r0, r5, #2176
	add	r1, r4, #16
	mov	r2, #172
	add	r0, r0, #4
	bl	memcpy
	add	lr, r4, #188
	add	ip, r5, #2352
	mov	r4, #1
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
.L1071:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1066:
	movw	r3, #2404
	ldrh	r2, [r1, #240]
	ldrh	r3, [r5, r3]
	cmp	r3, r2
	addne	r0, r0, #20480
	bne	.L1068
	mov	r4, #0
	b	.L1071
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdateAdvSPS, .-VC1_Vfmw_UpdateAdvSPS
	.align	2
	.global	VC1_Vfmw_UpdataLastPicRNDCTRL
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL, %function
VC1_Vfmw_UpdataLastPicRNDCTRL:
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
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1074
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
.L1074:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL, .-VC1_Vfmw_UpdataLastPicRNDCTRL
	.align	2
	.global	VC1_Vfmw_DecPQUANT
	.type	VC1_Vfmw_DecPQUANT, %function
VC1_Vfmw_DecPQUANT:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #128)
	sub	sp, sp, #128
	mov	r2, #128
	mov	r4, r1
	mov	r5, r0
	ldr	r1, .L1078
	sub	r0, fp, #148
	bl	memcpy
	cmp	r5, #0
	subeq	r3, fp, #20
	movne	r0, r4
	addeq	r4, r3, r4, lsl #2
	ldreq	r0, [r4, #-128]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1079:
	.align	2
.L1078:
	.word	.LANCHOR0+568
	UNWIND(.fnend)
	.size	VC1_Vfmw_DecPQUANT, .-VC1_Vfmw_DecPQUANT
	.align	2
	.global	VC1_ClearCurPacket
	.type	VC1_ClearCurPacket, %function
VC1_ClearCurPacket:
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
	ldr	r1, [r1, #28]
	mov	r5, r0
	bl	SM_ReleaseStreamSeg
	ldrsb	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1081
	mov	r0, r5
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
.L1081:
	ldr	r3, .L1085
	mov	r0, r4
	mov	r2, #36
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L1086:
	.align	2
.L1085:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_ClearCurPacket, .-VC1_ClearCurPacket
	.align	2
	.global	VC1_ClearCurPic
	.type	VC1_ClearCurPic, %function
VC1_ClearCurPic:
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
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	mov	r6, r1
	cmp	r3, #0
	beq	.L1088
	add	r7, r0, #20480
	ldr	r3, [r7, #3796]
	cmp	r3, #0
	beq	.L1102
	add	r4, r0, #24320
	mov	r5, #0
	b	.L1092
.L1091:
	ldr	r3, [r7, #3796]
	add	r4, r4, #48
	cmp	r5, r3
	bcs	.L1103
.L1092:
	ldr	r1, [r4]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #-36]
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L1091
	ldr	r3, [r4, #-12]
	cmp	r3, #0
	beq	.L1091
	ldr	r1, [r4, #4]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r7, #3796]
	add	r4, r4, #48
	cmp	r5, r3
	bcc	.L1092
.L1103:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1088:
	add	r1, r0, #36352
	mov	r0, r6
	add	r1, r1, #220
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1_ClearCurPacket
.L1102:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.align	2
	.global	VC1DEC_VDMPostProc
	.type	VC1DEC_VDMPostProc, %function
VC1DEC_VDMPostProc:
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
	add	r4, r0, #49152
	mov	r7, r0
	add	r0, r0, #12672
	add	r5, r7, #36864
	add	r0, r0, #56
	mov	r6, r1
	ldr	r1, [r4, #656]
	bl	VC1_ClearCurPic
	ldr	r1, [r5, #132]
	ldr	r0, [r4, #656]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r5, #128]
	mov	r8, r0
	ldr	r0, [r4, #656]
	bl	FSP_GetFsImagePtr
	ldr	r1, [r5, #124]
	mov	r9, r0
	ldr	r0, [r4, #656]
	bl	FSP_GetFsImagePtr
	cmp	r8, #0
	beq	.L1137
	cmp	r6, #0
	movlt	r3, #0
	blt	.L1107
	cmp	r6, #100
	movlt	r3, r6
	movge	r3, #100
.L1107:
	add	r6, r7, #12288
	str	r3, [r8, #184]
	mov	r0, r7
	bl	VC1_SetImgFormat
	ldrb	r3, [r6, #443]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L1138
.L1108:
	add	r3, r8, #608
	mov	r0, #0
	mov	r1, #0
	strd	r0, [r3, #-8]
	strd	r0, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L1109
	ldrb	r10, [r6, #442]	@ zero_extendqisi2
	sub	r10, r10, #2
	ands	r10, r10, #253
	beq	.L1110
	ldr	r10, [r5, #120]
	cmp	r10, #1
	ldrhi	r1, [r5, #124]
	mvnls	r1, #0
	cmp	r10, #1
	movls	r10, #0
	movhi	r10, #1
	str	r1, [r5, #136]
.L1112:
	ldr	r3, [r4, #144]
	cmn	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #144]
	beq	.L1113
	ldr	r0, [r4, #656]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L1139
	ldr	r2, [r8, #184]
	cmp	r2, #0
	beq	.L1115
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L1116
.L1115:
	ldr	r9, [r5, #136]
	ldr	r0, [r4, #656]
	mov	r1, r9
	bl	FSP_GetRef
	mov	r2, r9
	ldr	r1, .L1142
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r5, #136]
	ldr	r0, [r4, #656]
	bl	FSP_SetDisplay
	cmp	r10, #1
	ldreq	r3, [r5, #48]
	movne	r1, #1
	ldrne	r2, [r5, #40]
	movne	r3, #2
	strneb	r1, [r2, #1]
	mov	r2, r7
	streqb	r10, [r3, #1]
	mov	r1, #1
	strneb	r3, [r6, #441]
	add	r3, r7, #49408
	streqb	r10, [r6, #441]
	add	r3, r3, #48
	ldr	r0, [r4, #656]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L1119
	add	r9, r8, #608
	ldr	r0, [r4, #656]
	ldr	r1, [r8, #600]
	mov	r6, #0
	bl	FreeUsdByDec
	mov	r7, #0
	strd	r6, [r9, #-8]
	ldr	r1, [r8, #608]
	ldr	r0, [r4, #656]
	bl	FreeUsdByDec
	mov	r2, #0
	strd	r6, [r9]
	ldr	r0, [r4, #656]
	ldr	r1, [r5, #136]
	bl	FSP_SetDisplay
	cmp	r10, #1
	mov	r3, #0
	ldreq	r2, [r5, #48]
	mov	r0, r3
	ldrne	r2, [r5, #40]
	strb	r3, [r2, #1]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1110:
	ldr	r1, [r5, #132]
	cmp	r9, #0
	moveq	r10, r9
	str	r1, [r5, #136]
	beq	.L1112
	add	ip, r9, #640
	add	r0, r8, #640
	ldrd	r2, [ip]
	ldrd	r8, [r0]
	cmp	r2, r8
	sbcs	lr, r3, r9
	strltd	r2, [r0]
	strltd	r8, [ip]
	ldrlt	r1, [r5, #136]
	b	.L1112
.L1140:
	ldr	r2, [r5, #44]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r6, #441]
.L1113:
	mov	r0, #1
.L1106:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1138:
	ldrb	r3, [r6, #449]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1113
	b	.L1108
.L1109:
	ldr	r1, [r5, #132]
	mov	r10, #0
	str	r1, [r5, #136]
	b	.L1112
.L1119:
	ldrb	r3, [r6, #441]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #3
	beq	.L1140
	cmp	r3, #1
	beq	.L1141
	cmp	r3, #2
	bne	.L1113
	ldr	r2, [r5, #40]
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r6, #441]
	b	.L1106
.L1116:
	add	r9, r8, #608
	ldr	r1, .L1142+4
	mov	r0, #1
	mov	r6, #0
	bl	dprint_vfmw
	ldr	r1, [r8, #600]
	ldr	r0, [r4, #656]
	mov	r7, #0
	bl	FreeUsdByDec
	strd	r6, [r9, #-8]
	ldr	r1, [r8, #608]
	ldr	r0, [r4, #656]
	bl	FreeUsdByDec
	strd	r6, [r9]
	mov	r2, #0
	ldr	r0, [r4, #656]
	ldr	r1, [r5, #136]
	bl	FSP_SetDisplay
	cmp	r10, #1
	mov	r2, #0
	ldreq	r3, [r5, #48]
	moveq	r0, r10
	ldrne	r3, [r5, #40]
	movne	r0, #1
	strb	r2, [r3, #1]
	b	.L1106
.L1141:
	ldr	r2, [r5, #48]
	mov	r0, r3
	mov	r3, #0
	strb	r3, [r2, #1]
	strb	r3, [r6, #441]
	b	.L1106
.L1137:
	str	r0, [sp]
	mov	r3, r9
	mov	r2, r8
	ldr	r1, .L1142+8
	mov	r0, r8
	bl	dprint_vfmw
	mov	r0, r8
	b	.L1106
.L1139:
	mov	r2, #736
	ldr	r1, .L1142+12
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r8
	b	.L1106
.L1143:
	.align	2
.L1142:
	.word	.LC52
	.word	.LC53
	.word	.LC50
	.word	.LC51
	UNWIND(.fnend)
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	2
	.global	VC1_Vfmw_DecodeArbiter
	.type	VC1_Vfmw_DecodeArbiter, %function
VC1_Vfmw_DecodeArbiter:
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
	add	r5, r0, #12288
	mov	r4, r0
	ldrb	r3, [r5, #440]	@ zero_extendqisi2
	tst	r3, #16
	beq	.L1197
	add	r6, r0, #49152
	bic	r3, r3, #20
	strb	r3, [r5, #440]
	ldr	r3, [r6, #260]
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L1147
.L1149:
	ldr	r3, [r4]
	add	r7, r4, #36864
	ldr	r1, [r7, #120]
	ldr	r2, [r3, #8]
.L1148:
	sub	r3, r2, #1
	str	r2, [r6, #260]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1178
.L1159:
	.word	.L1153
	.word	.L1155
	.word	.L1177
	.word	.L1157
.L1176:
	mov	r1, #0
.L1157:
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r6, #192]
	moveq	r3, #1
	beq	.L1160
	cmp	r3, #2
	bne	.L1162
	ldr	r3, [r6, #192]
	adds	r3, r3, #0
	movne	r3, #1
	cmp	r1, #0
	bne	.L1164
.L1163:
	ldr	r1, .L1199
	mov	r0, #1
	bl	dprint_vfmw
.L1171:
	add	r0, r4, #12672
	ldr	r1, [r6, #656]
	add	r0, r0, #56
	bl	VC1_ClearCurPic
	ldr	r3, .L1199+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1197
	mov	r3, #0
	ldr	r0, [r6, #656]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L1197:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1147:
	ldr	r3, [r0]
	ldr	r2, [r3, #8]
	cmp	r2, #4
	cmpne	r2, #1
	bhi	.L1149
	add	r7, r0, #36864
	ldr	r1, .L1199+8
	mov	r0, #2
	bl	dprint_vfmw
	ldr	r1, [r7, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L1150
	ldr	r0, [r6, #656]
	add	r10, r8, #608
	ldr	r1, [r8, #600]
	add	r9, r8, #624
	bl	FreeUsdByDec
	ldr	r1, [r8, #608]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	ldr	r1, [r8, #616]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	ldr	r1, [r8, #624]
	ldr	r0, [r6, #656]
	bl	FreeUsdByDec
	mov	r0, #0
	mov	r1, #0
	mov	r2, #1
	strd	r0, [r10, #-8]
	strd	r0, [r10]
	strd	r0, [r9, #-8]
	strd	r0, [r9]
	ldr	r1, [r7, #128]
	ldr	r0, [r6, #656]
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r7, #124]
	ldr	r0, [r6, #656]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	str	r3, [r7, #124]
	str	r3, [r7, #128]
	ldr	r0, [r6, #656]
	bl	FSP_GetNullLogicFs
	str	r0, [r7, #128]
	str	r0, [r7, #124]
.L1150:
	ldr	r2, [r7, #44]
	mov	r3, #0
	str	r3, [r7, #120]
	cmp	r2, r3
	beq	.L1158
	ldr	r1, [r7, #48]
	cmp	r1, #0
	beq	.L1158
	strb	r3, [r2, #1]
	ldr	r2, [r7, #48]
	strb	r3, [r2, #1]
	ldr	r2, [r7, #44]
	strb	r3, [r2]
	ldr	r2, [r7, #48]
	strb	r3, [r2]
	ldr	r3, [r4]
	ldr	r1, [r7, #120]
	ldr	r2, [r3, #8]
	b	.L1148
.L1177:
	mov	r3, #0
.L1160:
	cmp	r1, #0
	beq	.L1156
.L1164:
	cmp	r1, #1
	bls	.L1198
.L1167:
	cmp	r3, #0
	beq	.L1171
	ldrb	r3, [r5, #3536]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1170
	add	r3, r5, #3600
	add	ip, r4, #23040
	add	r3, r3, #4
	add	ip, ip, #44
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	add	r1, r5, #3840
	add	r0, r4, #23296
	add	r1, r1, #12
	mov	r2, #100
	add	r0, r0, #36
	bl	memcpy
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1173:
	mov	r1, #0
.L1153:
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	movne	r3, #1
	moveq	r3, #0
	cmp	r1, #0
	bne	.L1164
.L1156:
	ldrb	r2, [r5, #442]	@ zero_extendqisi2
	sub	r0, r2, #4
	sub	r1, r2, #1
	cmp	r1, #1
	cmphi	r0, #1
	bls	.L1163
.L1165:
	sub	r2, r2, #2
	tst	r2, #253
	bne	.L1167
	ldr	r1, .L1199+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1171
.L1174:
	mov	r1, #0
.L1155:
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	b	.L1160
.L1170:
	add	r1, r5, #3616
	add	r0, r4, #23040
	add	r1, r1, #4
	mov	r2, #172
	add	r0, r0, #60
	bl	memcpy
	add	lr, r5, #3792
	add	ip, r4, #23040
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, #232
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	r0, r4, #23296
	add	r1, r5, #3952
	mov	r2, #176
	add	r0, r0, #136
	bl	memcpy
	ldr	r3, [r5, #3996]
	ldr	r2, .L1199+16
	add	r1, r4, #16384
	add	r0, r4, #23552
	add	r1, r1, #32
	strb	r3, [r5, #444]
	add	r0, r0, #56
	ldr	r3, [r7, #140]
	ldr	ip, [r2, #52]
	mov	r2, r3, asl #4
	sub	r2, r2, r3, asl #2
	blx	ip
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1172:
	mov	r1, #0
.L1178:
	mov	r3, #1
	b	.L1160
.L1162:
	and	r3, r3, #251
	cmp	r3, #1
	bne	.L1178
	str	r3, [r6, #192]
	b	.L1160
.L1158:
	ldr	r3, [r4]
	ldr	r2, [r3, #8]
	sub	r3, r2, #1
	str	r2, [r6, #260]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1172
.L1154:
	.word	.L1173
	.word	.L1174
	.word	.L1175
	.word	.L1176
.L1175:
	mov	r3, #0
	b	.L1156
.L1198:
	ldrb	r2, [r5, #442]	@ zero_extendqisi2
	b	.L1165
.L1200:
	.align	2
.L1199:
	.word	.LC55
	.word	g_event_report
	.word	.LC54
	.word	.LC56
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_DecodeArbiter, .-VC1_Vfmw_DecodeArbiter
	.align	2
	.global	VC1_Vfmw_StartDecode
	.type	VC1_Vfmw_StartDecode, %function
VC1_Vfmw_StartDecode:
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
	ldr	r3, [r0]
	add	r5, r0, #12288
	add	r6, r0, #12672
	mov	r4, r0
	ldrb	r1, [r5, #3536]	@ zero_extendqisi2
	add	r6, r6, #56
	ldr	r2, [r3, #592]
	add	r8, r0, #8
	cmp	r1, #0
	str	r2, [r5, #264]
	ldr	r3, [r3, #632]
	str	r3, [r5, #268]
	beq	.L1218
.L1202:
	add	r7, r4, #36864
	mov	r1, r8
	mov	r0, r4
	bl	VC1_WritePicMsg
	ldr	r3, [r7, #140]
	ldr	ip, .L1223
	add	r1, r6, #24064
	add	r1, r1, #216
	add	r0, r4, #92
	mov	r2, r3, asl #6
	strb	r3, [r4, #78]
	sub	r2, r2, r3, asl #4
	ldr	r3, [ip, #52]
	blx	r3
	mov	r1, r8
	mov	r0, r6
	bl	VC1_CfgVDH
	ldrb	r3, [r5, #442]	@ zero_extendqisi2
	cmp	r3, #1
	ldrlsb	r2, [r5, #444]	@ zero_extendqisi2
	strlsb	r2, [r5, #445]
	cmp	r3, #5
	beq	.L1219
	mov	r3, #0
	strb	r3, [r4, #9]
	ldrb	r3, [r5, #444]	@ zero_extendqisi2
	ldrb	r2, [r5, #448]	@ zero_extendqisi2
.L1205:
	ldrh	r1, [r4, #86]
	strb	r3, [r4, #8]
	cmp	r1, #120
	movle	r1, #1
	movgt	r1, #0
	strb	r1, [r4, #79]
	strb	r3, [r5, #443]
	strb	r2, [r5, #449]
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1220
	and	r2, r3, #251
	cmp	r2, #1
	addeq	r1, r4, #49152
	streq	r2, [r1, #192]
.L1209:
	ldr	r2, [r4]
	str	r8, [r4, #4]
	ldr	r0, [r2, #864]
	cmp	r0, #1
	beq	.L1221
	cmp	r0, #2
	beq	.L1222
.L1214:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1222:
	ldr	r2, [r2, #868]
	cmp	r8, #0
	cmpne	r2, #0
	ble	.L1214
	sub	r3, r3, #2
	ands	r5, r3, #253
	bne	.L1214
	ldr	r3, [r7, #40]
	add	r1, r4, #49152
	mov	r0, r6
	strb	r5, [r3, #1]
	ldr	r2, [r4]
	ldr	r3, [r2, #868]
	sub	r3, r3, #1
	str	r3, [r2, #868]
	ldr	r1, [r1, #656]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1220:
	add	r9, r4, #49152
	ldr	r5, [r9, #192]
	cmp	r5, #0
	bne	.L1209
	mov	r0, r6
	ldr	r1, [r9, #656]
	bl	VC1_ClearCurPic
	ldr	r3, [r7, #40]
	mov	r0, r5
	strb	r5, [r3]
	ldr	r3, [r9, #196]
	add	r3, r3, #1
	str	r3, [r9, #196]
	str	r5, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1219:
	mov	r2, #1
	strb	r2, [r4, #9]
	ldrb	r3, [r5, #445]	@ zero_extendqisi2
	add	r1, r4, #49152
	strb	r2, [r5, #448]
	strb	r3, [r5, #444]
	ldr	r1, [r1, #216]
	sub	r1, r1, #1
	str	r1, [r5, #172]
	b	.L1205
.L1221:
	cmp	r8, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	sub	r3, r3, #2
	ands	r5, r3, #253
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r2, [r7, #40]
	add	r3, r4, #49152
	mov	r0, r6
	strb	r5, [r2, #1]
	ldr	r1, [r3, #656]
	bl	VC1_ClearCurPic
	str	r5, [r4, #4]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1218:
	mov	r0, r6
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
	b	.L1202
.L1224:
	.align	2
.L1223:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	2
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r5, [r0, #3128]
	add	r8, r0, #32768
	mov	r4, r0
	str	r1, [fp, #-52]
	mov	r10, #0
	mov	r1, #32
	strb	r10, [r0, #6]
	mov	r0, r5
	str	r2, [fp, #-48]
	bl	BsGet
	ldr	r3, [r5, #24]
	ldr	r6, [r8, #3804]
	add	r7, r4, #36352
	ldr	r2, [r8, #3824]
	add	r7, r7, #220
	mov	r3, r3, lsr #3
	add	r6, r6, r3
	rsb	r2, r3, r2
	mov	r1, r6
	uxtb	r9, r0
	mov	r0, r5
	bl	BsInit
	sub	r2, r9, #10
	cmp	r2, #5
	bhi	.L1226
	cmp	r9, #11
	ldrb	r3, [r4]	@ zero_extendqisi2
	beq	.L1298
	and	r1, r3, #7
	cmp	r1, #7
	beq	.L1299
	add	r9, r4, #20480
	strb	r10, [r4, #8]
	str	r10, [r9, #3796]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L1258
.L1242:
	.word	.L1241
	.word	.L1258
	.word	.L1243
	.word	.L1260
	.word	.L1245
	.word	.L1246
.L1226:
	sub	r2, r9, #27
	cmp	r2, #4
	bls	.L1259
	cmp	r9, #254
	beq	.L1300
.L1258:
	ldr	r0, [fp, #-48]
	mov	r1, r7
	bl	VC1_ClearCurPacket
	mov	r0, #0
.L1231:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1300:
	mov	r1, #32
	mov	r0, r5
	bl	BsGet
	mov	r1, #32
	mov	r6, r0
	mov	r0, r5
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r6, r3
	bne	.L1258
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r2, #1
	strb	r2, [r4, #7]
	and	r2, r3, #7
	cmp	r2, #7
	bne	.L1259
	add	r2, r4, #20480
	ldr	r2, [r2, #3796]
	cmp	r2, #0
	orrne	r3, r3, #16
	strneb	r3, [r4]
.L1259:
	ldr	r0, [fp, #-48]
	mov	r1, r7
	bl	VC1_ClearCurPacket
	mov	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1298:
	and	r3, r3, #7
	cmp	r3, #7
	beq	.L1301
.L1256:
	ldr	r0, [fp, #-48]
	mov	r1, r7
	bl	VC1_ClearCurPacket
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1260:
	ldr	r10, .L1304
.L1291:
	ldr	r0, [fp, #-52]
	mov	r2, #176
	ldr	ip, [r10, #48]
	mov	r1, #0
	add	r0, r0, #348
	ldrb	r3, [r0, #31]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	blx	ip
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-56]
	strb	r3, [r2, #379]
.L1247:
	add	r0, r4, #24064
	ldr	r3, [r10, #48]
	mov	r2, #12288
	mov	r1, #0
	add	r0, r0, #216
	blx	r3
	mov	r0, r5
	bl	BsPos
	ldr	r3, [fp, #-52]
	mov	r1, r4
	mov	r2, r3
	str	r0, [r3, #488]
	mov	r0, r5
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	r0, #1
	mov	r10, r0
	beq	.L1302
	mov	r1, r7
	ldr	r0, [fp, #-48]
	bl	VC1_ClearCurPacket
	movw	r2, #6131
	ldr	r1, .L1304+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r10
	b	.L1231
.L1299:
	mov	r10, #1
	orr	r3, r3, #16
	strb	r10, [r4, #6]
	mov	r0, r10
	strb	r3, [r4]
	b	.L1231
.L1243:
	ldr	r10, .L1304
	mov	r3, #1
	strb	r3, [r4, #8]
	mov	r2, #16
	ldr	r3, [fp, #-52]
	mov	r1, #0
	add	r0, r3, #508
	ldr	r3, [r10, #48]
	blx	r3
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1247
	b	.L1291
.L1246:
	ldr	r2, [fp, #-52]
	mov	r0, r5
	mov	r1, r4
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	r0, #1
	mov	r10, r0
	ldreqb	r3, [r4]	@ zero_extendqisi2
	orreq	r3, r3, #1
	streqb	r3, [r4]
	b	.L1256
.L1245:
	mov	r0, r5
	ldr	r2, [fp, #-52]
	mov	r1, r4
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	r0, #1
	mov	r10, r0
	bne	.L1256
	ldr	r1, [fp, #-52]
	mov	r0, r4
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	r3, [r4]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r4]
	b	.L1256
.L1241:
	orr	r3, r3, #32
	ldr	r0, [fp, #-48]
	mov	r1, r7
	strb	r3, [r4]
	bl	VC1_ClearCurPacket
	mov	r0, #1
	b	.L1231
.L1301:
	mov	r0, r5
	ldr	r2, [fp, #-52]
	mov	r1, r4
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	r0, #1
	mov	r5, r0
	bne	.L1229
	add	r9, r4, #20480
	ldr	r7, [r9, #3796]
	cmp	r7, #255
	bhi	.L1303
	mov	r3, r7, asl #4
	mov	r2, r7, asl #6
	rsb	r5, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [r4, #3128]
	add	r5, r4, r5
	str	r2, [fp, #-56]
	movw	r2, #24288
	strb	r7, [r5, r2]
	movw	ip, #24280
	ldr	r1, [r3, #24]
	movw	r0, #24296
	add	r2, r5, #24064
	add	r1, r6, r1, lsr #3
	str	r1, [r5, ip]
	ldr	r1, [r3, #24]
	mov	r6, r2
	and	r1, r1, #7
	str	r1, [r5, r0]
	ldr	r1, [r3, #16]
	ldr	r0, [r3, #24]
	add	r3, r2, #216
	str	r3, [fp, #-60]
	rsb	r1, r0, r1, lsl #3
	str	r1, [r2, #236]
	ldr	r0, [r5, ip]
	str	r3, [fp, #-64]
	bl	MEM_Vir2Phy
	add	r2, r5, #24320
	str	r0, [r6, #228]
	ldr	r1, [r8, #3832]
	str	r1, [r2]
	ldr	r1, [r8, #3808]
	cmp	r1, #0
	beq	.L1232
	ldr	r0, [r8, #3820]
	ldr	r3, [fp, #-60]
	cmp	r0, #0
	beq	.L1232
	movw	ip, #24312
	str	r1, [r3, #4]
	str	r10, [r5, ip]
	add	r3, r5, #24064
	ldr	r1, [r8, #3828]
	str	r0, [r3, #244]
	mov	r1, r1, asl #3
	str	r1, [r3, #252]
	ldr	r3, [r8, #3836]
	str	r3, [r2, #4]
.L1233:
	ldr	r0, [r9, #3716]
	ldr	r1, [r9, #3712]
	ldrb	r10, [r4, #8]	@ zero_extendqisi2
	mul	r1, r1, r0
	cmp	r10, #0
	sub	r1, r1, #1
	beq	.L1234
	ldr	r2, [fp, #-48]
	add	r3, r0, #1
	ldr	lr, [fp, #-52]
	movw	r5, #24304
	sub	ip, r2, r7, asl #2
	add	r3, r3, r3, lsr #31
	add	ip, lr, ip
	ldr	lr, [fp, #-56]
	add	ip, ip, #520
	rsb	lr, r2, lr
	ldr	r2, [ip, #8]
	add	lr, r4, lr
	sub	r3, r2, r3, asr #1
	cmp	r1, r3
	str	r3, [lr, r5]
	movcs	r1, #0
	movcc	r1, #1
	cmp	r3, #0
	movle	r1, #0
	cmp	r1, #0
	bne	.L1292
.L1235:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-48]
	rsb	r3, r2, r3
	add	r4, r4, r3
.L1297:
	add	r3, r4, #24064
	add	r3, r3, #232
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L1238
	add	r3, r4, #24064
	add	r3, r3, #216
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1254
	add	r4, r4, #24064
	ldr	r3, [r4, #252]
	cmp	r3, #0
	ble	.L1238
.L1254:
	ldr	r3, [r9, #3796]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r9, #3796]
	b	.L1231
.L1302:
	mov	r0, r5
	bl	BsPos
	ldr	r2, [fp, #-52]
	ldr	r3, [r2, #488]
	rsb	r0, r3, r0
	str	r0, [r2, #488]
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r0, r5
	orr	r3, r3, #4
	strb	r3, [r4]
	bl	BsPos
	ldr	r3, [r8, #3824]
	add	r0, r0, #32
	cmp	r0, r3, asl #3
	bge	.L1249
	ldr	r7, [r9, #3796]
	movw	r3, #24288
	ldr	r2, [r4, #3128]
	movw	ip, #24296
	mov	r1, r7, asl #6
	mov	r10, r7, asl #4
	rsb	r5, r10, r1
	str	r1, [fp, #-48]
	add	r5, r4, r5
	add	r0, r5, #24064
	strb	r7, [r5, r3]
	add	r3, r0, #224
	ldr	r1, [r2, #24]
	str	r3, [fp, #-56]
	str	r3, [fp, #-60]
	movw	r3, #24280
	add	r1, r6, r1, lsr #3
	str	r1, [r5, r3]
	ldr	r1, [r2, #24]
	add	r6, r0, #216
	and	r1, r1, #7
	str	r1, [r5, ip]
	ldr	r1, [r2, #16]
	ldr	r2, [r2, #24]
	rsb	r2, r2, r1, lsl #3
	str	r2, [r0, #236]
	ldr	r0, [r5, r3]
	bl	MEM_Vir2Phy
	ldr	r3, [fp, #-56]
	add	r2, r5, #24320
	str	r0, [r3, #4]
	ldr	r3, [r8, #3832]
	str	r3, [r2]
	ldr	r3, [r8, #3808]
	cmp	r3, #0
	beq	.L1250
	ldr	r1, [r8, #3820]
	cmp	r1, #0
	beq	.L1250
	movw	r0, #24312
	str	r3, [r6, #4]
	mov	ip, #0
	str	ip, [r5, r0]
	ldr	r0, [r8, #3828]
	add	r3, r5, #24064
	str	r1, [r3, #244]
	mov	r0, r0, asl #3
	str	r0, [r3, #252]
	ldr	r3, [r8, #3836]
	str	r3, [r2, #4]
.L1251:
	ldr	r0, [r9, #3716]
	ldr	r1, [r9, #3712]
	ldrb	r5, [r4, #8]	@ zero_extendqisi2
	mul	r1, r1, r0
	cmp	r5, #0
	sub	r1, r1, #1
	beq	.L1252
	ldr	r2, [fp, #-52]
	sub	ip, r10, r7, asl #2
	add	r3, r0, #1
	movw	r5, #24304
	add	ip, r2, ip
	ldr	r2, [fp, #-48]
	add	r3, r3, r3, lsr #31
	add	ip, ip, #520
	rsb	lr, r10, r2
	ldr	r2, [ip, #8]
	add	lr, r4, lr
	sub	r3, r2, r3, asr #1
	cmp	r1, r3
	str	r3, [lr, r5]
	movcs	r1, #0
	movcc	r1, #1
	cmp	r3, #0
	movle	r1, #0
	cmp	r1, #0
	bne	.L1292
.L1253:
	ldr	r3, [fp, #-48]
	rsb	r7, r10, r3
	add	r4, r4, r7
	b	.L1297
.L1229:
	mov	r1, r7
	ldr	r0, [fp, #-48]
	bl	VC1_ClearCurPacket
	movw	r2, #6042
	ldr	r1, .L1304+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	b	.L1231
.L1249:
	mov	r1, r7
	ldr	r0, [fp, #-48]
	bl	VC1_ClearCurPacket
	movw	r2, #6125
	ldr	r1, .L1304+4
	mov	r0, r10
	bl	dprint_vfmw
	mov	r0, r10
	b	.L1231
.L1250:
	ldr	r3, [fp, #-48]
	movw	ip, #24312
	mov	r2, #0
	rsb	r3, r10, r3
	add	r3, r4, r3
	add	lr, r3, #24064
	add	r5, r3, #24320
	mov	r0, lr
	str	r2, [lr, #220]
	str	r2, [r3, ip]
	add	lr, lr, #216
	str	r2, [r0, #252]
	str	r2, [r0, #244]
	str	r2, [r5, #4]
	b	.L1251
.L1303:
	ldr	r1, [fp, #-48]
	mov	r0, r4
	bl	VC1_ClearCurPic
	ldr	r2, [r9, #3796]
	mov	r0, r5
	ldr	r1, .L1304+12
	bl	dprint_vfmw
	mov	r0, r10
	b	.L1231
.L1232:
	ldr	r2, [fp, #-48]
	movw	ip, #24312
	ldr	r3, [fp, #-56]
	rsb	r3, r2, r3
	mov	r2, #0
	add	r3, r4, r3
	add	lr, r3, #24064
	add	r5, r3, #24320
	mov	r0, lr
	str	r2, [lr, #220]
	str	r2, [r3, ip]
	add	lr, lr, #216
	str	r2, [r0, #252]
	str	r2, [r0, #244]
	str	r2, [r5, #4]
	b	.L1233
.L1252:
	ldr	r3, [fp, #-48]
	sub	r2, r10, r7, asl #2
	movw	ip, #24304
	rsb	r0, r10, r3
	ldr	r3, [fp, #-52]
	add	r0, r4, r0
	add	r2, r3, r2
	add	r2, r2, #520
	ldr	r3, [r2, #8]
	cmp	r1, r3
	str	r3, [r0, ip]
	bcs	.L1253
	ldr	r2, [r2, #8]
	mov	r0, #1
	str	r1, [sp]
	ldr	r1, .L1304+16
	bl	dprint_vfmw
	mov	r0, r5
	b	.L1231
.L1234:
	ldr	r3, [fp, #-48]
	movw	ip, #24304
	ldr	r0, [fp, #-56]
	sub	r2, r3, r7, asl #2
	rsb	r0, r3, r0
	ldr	r3, [fp, #-52]
	add	r0, r4, r0
	add	r2, r3, r2
	add	r2, r2, #520
	ldr	r3, [r2, #8]
	cmp	r1, r3
	str	r3, [r0, ip]
	bcs	.L1235
	ldr	r2, [r2, #8]
	mov	r0, #1
	str	r1, [sp]
	ldr	r1, .L1304+16
	bl	dprint_vfmw
	mov	r0, r10
	b	.L1231
.L1238:
	ldr	r1, .L1304+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1231
.L1292:
	ldr	r2, [ip, #8]
	ldr	r1, .L1304+24
	str	r0, [sp]
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	b	.L1231
.L1305:
	.align	2
.L1304:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC59
	.word	.LC58
	.word	.LC57
	.word	.LC48
	.word	.LC49
	.word	.LC47
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseAdvHdr, .-VC1_Vfmw_ParseAdvHdr
	.align	2
	.global	VC1_Vfmw_ParseHeader
	.type	VC1_Vfmw_ParseHeader, %function
VC1_Vfmw_ParseHeader:
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
	ldrb	r3, [r0, #3096]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r3, #0
	bne	.L1307
	ldrb	r3, [r0]	@ zero_extendqisi2
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [r0, #3128]
	orr	r3, r3, #3
	strb	r3, [r4]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	r0, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldrb	r3, [r4]	@ zero_extendqisi2
	orr	r3, r3, #20
	strb	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1307:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VC1_Vfmw_ParseAdvHdr
	UNWIND(.fnend)
	.size	VC1_Vfmw_ParseHeader, .-VC1_Vfmw_ParseHeader
	.align	2
	.global	VC1_SetCodeInfo
	.type	VC1_SetCodeInfo, %function
VC1_SetCodeInfo:
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
	add	r4, r0, #12288
	mov	r5, r0
	add	r0, r0, #15808
	ldrb	r3, [r4, #3538]	@ zero_extendqisi2
	add	r0, r0, #52
	str	r0, [r4, #3568]
	cmp	r3, #8
	strneb	r3, [r4, #451]
	moveq	r3, #6
	movne	r3, #0
	streqb	r3, [r4, #451]
	moveq	r2, #1
	strneb	r3, [r4, #452]
	ldrb	r3, [r4, #3536]	@ zero_extendqisi2
	streqb	r2, [r4, #452]
	cmp	r3, #0
	ldr	r2, [r1, #20]
	ldr	r1, [r1]
	beq	.L1315
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	BsInit
.L1315:
	bl	BsInit
	ldr	r0, [r4, #3544]
	add	r5, r5, #36864
	add	r2, r4, #3552
	adds	r3, r0, #15
	add	ip, r4, #3600
	addmi	r3, r0, #30
	add	ip, ip, #4
	mov	r3, r3, asr #4
	str	r3, [r5, #56]
	ldr	r1, [r4, #3548]
	str	r0, [r5, #72]
	adds	r3, r1, #15
	addmi	r3, r1, #30
	str	r1, [r5, #76]
	mov	r3, r3, asr #4
	str	r3, [r5, #60]
	ldmia	r2, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_SetCodeInfo, .-VC1_SetCodeInfo
	.align	2
	.global	VC1_ReceivePacket
	.type	VC1_ReceivePacket, %function
VC1_ReceivePacket:
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
	add	r1, r0, #49152
	add	r1, r1, #148
	beq	.L1324
	ldr	r2, [r4, #12]
	add	r3, r0, #49152
	str	r2, [r3, #160]
	ldr	r2, [r4]
	str	r2, [r3, #148]
	ldr	r2, [r4, #16]
	str	r2, [r3, #168]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	strb	r2, [r3, #156]
	ldr	r2, [r4, #20]
	str	r2, [r3, #176]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1319
	ldr	r2, [r4, #92]
	str	r2, [r3, #164]
	ldr	r2, [r4, #80]
	str	r2, [r3, #152]
	ldr	r2, [r4, #96]
	str	r2, [r3, #172]
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	strb	r2, [r3, #157]
	ldr	r2, [r4, #100]
	str	r2, [r3, #180]
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1325
.L1320:
	bl	VC1_SetCodeInfo
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1325:
	ldr	r0, [r3, #656]
	bl	VC1_ClearCurPacket
	ldrb	r2, [r4, #86]	@ zero_extendqisi2
	ldr	r1, .L1326
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1319:
	mov	r2, #0
	str	r2, [r3, #164]
	str	r2, [r3, #152]
	str	r2, [r3, #172]
	strb	r2, [r3, #157]
	str	r2, [r3, #180]
	b	.L1320
.L1324:
	ldr	r1, .L1326+4
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1327:
	.align	2
.L1326:
	.word	.LC61
	.word	.LC60
	UNWIND(.fnend)
	.size	VC1_ReceivePacket, .-VC1_ReceivePacket
	.align	2
	.global	VC1DEC_Decode
	.type	VC1DEC_Decode, %function
VC1DEC_Decode:
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
	ldr	r3, .L1357
	add	r5, r0, #12544
	add	r5, r5, #24
	mov	r4, r0
	mov	r2, #160
	ldr	r3, [r3, #52]
	mov	r0, r5
	blx	r3
	mov	r1, r5
	mov	r0, r4
	bl	VC1_ReceivePacket
	subs	r7, r0, #0
	beq	.L1352
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L1353
.L1331:
	add	r3, r4, #12288
	add	r6, r4, #49152
	ldrb	r3, [r3, #440]	@ zero_extendqisi2
	strb	r3, [r6, #264]
.L1332:
	add	r5, r4, #12672
	add	r1, r4, #15872
	add	r5, r5, #56
	add	r1, r1, #20
	ldr	r2, [r6, #656]
	mov	r0, r5
	bl	VC1_Vfmw_ParseHeader
	subs	r8, r0, #0
	beq	.L1354
	mov	r0, r4
	bl	VC1_Vfmw_DecodeArbiter
	cmp	r0, #0
	bne	.L1355
.L1335:
	mov	r7, #0
.L1330:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1354:
	add	r1, r4, #49152
	ldr	r0, [r6, #656]
	add	r1, r1, #148
	bl	VC1_ClearCurPacket
	ldr	r3, .L1357+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1335
	ldr	r0, [r6, #656]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	mov	r7, r8
	blx	ip
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1353:
	ldr	r3, [r3, #872]
	cmp	r3, #1
	bne	.L1331
	add	r6, r4, #49152
	add	r3, r4, #12288
	ldrb	r2, [r6, #264]	@ zero_extendqisi2
	strb	r2, [r3, #440]
	b	.L1332
.L1352:
	add	r4, r4, #49152
	ldr	r1, .L1357+8
	ldr	r2, [r4, #144]
	bl	dprint_vfmw
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1355:
	mov	r0, r4
	bl	VC1_Vfmw_PrepareDecode
	subs	r7, r0, #0
	bne	.L1336
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L1356
.L1337:
	mov	r0, r5
	ldr	r1, [r6, #656]
	bl	VC1_ClearCurPic
.L1338:
	ldr	r3, .L1357+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1335
	mov	r3, #0
	ldr	r0, [r6, #656]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	b	.L1330
.L1356:
	ldr	r3, [r3, #872]
	cmp	r3, #1
	bne	.L1337
	b	.L1338
.L1336:
	mov	r0, r4
	bl	VC1_Vfmw_StartDecode
	subs	r7, r0, #0
	movne	r7, r8
	bne	.L1330
	add	r4, r4, #36864
	mov	r2, #1
	ldr	r0, [r6, #656]
	ldr	r1, [r4, #132]
	bl	FSP_ClearLogicFs
	ldr	r2, [r4, #40]
	ldr	r3, .L1357+4
	strb	r7, [r2]
	ldr	r2, [r4, #40]
	strb	r7, [r2, #1]
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1335
	ldr	r0, [r6, #656]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #113
	blx	ip
	b	.L1330
.L1358:
	.align	2
.L1357:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	.word	.LC62
	UNWIND(.fnend)
	.size	VC1DEC_Decode, .-VC1DEC_Decode
	.align	2
	.global	VC1_GetPacketState
	.type	VC1_GetPacketState, %function
VC1_GetPacketState:
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
	add	r0, r0, #12672
	ldrsb	r3, [r0, #62]
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.14543, %object
	.size	__func__.14543, 13
__func__.14543:
	.ascii	"Vc1SMPSeqHdr\000"
	.space	3
.LC0:
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
.LC1:
	.word	3
	.word	1
	.word	2
	.word	0
	.word	4
.LC2:
	.word	1
	.word	0
	.word	2
	.word	3
	.word	4
.LC3:
	.word	3
	.word	1
.LC4:
	.word	3
	.word	1
	.word	2
	.word	0
.LC5:
	.word	1
	.word	0
	.word	2
	.word	3
.LC6:
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	1
	.word	2
.LC7:
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
.LC8:
	.word	3
	.word	4
	.word	1
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	3
	.word	5
	.word	7
.LC9:
	.word	5
	.word	5
	.word	6
	.word	6
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	8
	.word	8
	.word	8
	.word	8
.LC10:
	.word	256
	.word	128
	.word	85
	.word	64
	.word	51
	.word	43
	.word	37
	.word	32
	.type	__func__.14854, %object
	.size	__func__.14854, 17
__func__.14854:
	.ascii	"VC1_DecBfraction\000"
	.space	3
	.type	aCount, %object
	.size	aCount, 128
aCount:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	2
	.word	3
	.word	3
	.word	4
	.word	3
	.word	4
	.word	4
	.word	5
	.type	a2On4Off, %object
	.size	a2On4Off, 60
a2On4Off:
	.word	3
	.word	5
	.word	6
	.word	9
	.word	10
	.word	12
	.word	17
	.word	18
	.word	20
	.word	24
	.word	33
	.word	34
	.word	36
	.word	40
	.word	48
.LC12:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
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
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	27
	.word	29
	.word	31
.LC11:
	.word	1
	.word	2
	.word	2
	.word	2
	.word	0
	.word	1
	.word	0
	.word	1
	.type	FldPTypeTab, %object
	.size	FldPTypeTab, 64
FldPTypeTab:
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	4
	.word	4
	.word	2
	.word	4
	.word	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC13:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC14:
	ASCII(.ascii	"VC1 INIT!!!\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"picture width out of range\000" )
	.space	1
.LC16:
	ASCII(.ascii	"%s: %s\012\000" )
.LC17:
	ASCII(.ascii	"picture height out of range\000" )
.LC18:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\000" )
	.space	2
.LC19:
	ASCII(.ascii	"Vc1SMPSeqHdr Err, BS is wrong\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC21:
	ASCII(.ascii	"vc1 actual frame size(%dx%d) exeed max config(%dx%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC22:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC26:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all r" )
	ASCII(.ascii	"ef!\012\000" )
.LC27:
	ASCII(.ascii	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogic" )
	ASCII(.ascii	"Fs.\012\000" )
.LC28:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_ArrangeVahbMem err!\012\000" )
.LC29:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 " )
	ASCII(.ascii	"err!\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\012\000" )
	.space	1
.LC35:
	ASCII(.ascii	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC37:
	ASCII(.ascii	"VC1_Vfmw_GetStreamInfo error! Release all packets!\012" )
	ASCII(.ascii	"\000" )
.LC38:
	ASCII(.ascii	"%s:%d Code(%d) is invalid\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"%s:%d Denominator(%d) is invalid\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"Check Pos 2: %d\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"Check Pos 3: %d\012\000" )
	.space	3
.LC42:
	ASCII(.ascii	"\012======PicNum  :%6d=========\012\000" )
	.space	2
.LC43:
	ASCII(.ascii	"INTERPFRM  :%#x\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"VC1_Vfmw_ParseMPBPicHdr err!\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"VC1_Vfmw_ParseSMPIPicHdr err!\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\012\000" )
.LC47:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC49:
	ASCII(.ascii	"VC1_RecordSlcStream stream len <= 0\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"pImg is null, pCurImg %p pBwdImg %p pFwdImg %p\012\000" )
.LC51:
	ASCII(.ascii	"line: %d, pToQueImg is Null!\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"----------------- VC1 Imode -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC55:
	ASCII(.ascii	"NOTE: Drop non-I\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"NOTE: Drop B\012\000" )
	.space	2
.LC57:
	ASCII(.ascii	" pCodecInf->SlcNum = %d >= 256 \012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"line %d, Code = VC1_SCSLC failed!\012\000" )
	.space	1
.LC59:
	ASCII(.ascii	"line %d, Code = VC1_SCFRM failed!\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"bitsream para error -----\012\000" )
	.space	1
.LC61:
	ASCII(.ascii	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\012\000" )
.LC62:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
