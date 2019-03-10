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
	.file	"real8.c"
	.text
	.align	2
	.global	Real8_CB_GetBits
	.type	Real8_CB_GetBits, %function
Real8_CB_GetBits:
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
	mov	r6, r1
	bl	BsShow
	mov	r1, r6
	mov	r4, r0
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_CB_GetBits, .-Real8_CB_GetBits
	.align	2
	.global	Real8_CB_Get1Bit
	.type	Real8_CB_Get1Bit, %function
Real8_CB_Get1Bit:
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
	bl	BsShow
	mov	r1, #1
	mov	r4, r0
	mov	r0, r5
	bl	BsSkip
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_CB_Get1Bit, .-Real8_CB_Get1Bit
	.align	2
	.global	Real8_CB_GetVLCBits
	.type	Real8_CB_GetVLCBits, %function
Real8_CB_GetVLCBits:
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
	ldr	r7, .L8
	mov	r4, #0
	mov	r6, r0
	mov	r8, r1
	mov	r5, r4
.L4:
	mov	r1, #8
	mov	r0, r6
	bl	BsShow
	ldrb	r3, [r7, r0]	@ zero_extendqisi2
	mov	r0, r6
	and	r2, r3, #15
	mov	r1, r3, lsr #4
	mov	r3, r3, lsr #5
	add	r4, r4, r1
	orr	r5, r2, r5, asl r3
	bl	BsSkip
	tst	r4, #1
	beq	.L4
	str	r5, [r8]
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real8_CB_GetVLCBits, .-Real8_CB_GetVLCBits
	.align	2
	.global	Real8_GetImageBuffer
	.type	Real8_GetImageBuffer, %function
Real8_GetImageBuffer:
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
	add	r4, r0, #53248
	mov	r6, r0
	mov	r1, #1
	add	r7, r0, #8192
	ldr	r0, [r4, #3496]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #3100]
	blt	.L17
	mov	r1, r0
	ldr	r0, [r4, #3496]
	bl	FSP_GetLogicFs
	subs	r5, r0, #0
	beq	.L18
	ldr	r2, [r4, #3100]
	mov	r0, #18
	ldr	r1, .L19
	bl	dprint_vfmw
	ldr	r2, [r5, #680]
	cmp	r2, #0
	beq	.L16
	ldr	r3, [r5, #684]
	cmp	r3, #0
	beq	.L16
	ldr	r1, [r5, #688]
	cmp	r1, #0
	beq	.L16
	ldr	ip, [r1, #16]
	mov	r0, #18
	ldr	r3, [r3, #16]
	ldr	r2, [r2, #16]
	ldr	r1, .L19+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #1
.L12:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L16:
	mov	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L17:
	ldr	r1, .L19+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r4, #3096]
	ldr	r0, [r4, #3496]
	mov	r2, #1
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #3092]
	mov	r5, #0
	ldr	r0, [r4, #3496]
	bl	FSP_ClearLogicFs
	str	r5, [r4, #3092]
	str	r5, [r4, #3096]
	ldr	r0, [r4, #3496]
	bl	FSP_GetNullLogicFs
	add	r1, r6, #56320
	add	r1, r1, #72
	str	r0, [r4, #3096]
	str	r0, [r4, #3092]
	strb	r5, [r7, #3199]
	ldr	r0, [r4, #3496]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L18:
	movw	r2, #513
	ldr	r1, .L19+12
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	b	.L12
.L20:
	.align	2
.L19:
	.word	.LC6
	.word	.LC7
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	Real8_GetImageBuffer, .-Real8_GetImageBuffer
	.align	2
	.global	Real8_ArrangeVHBMem
	.type	Real8_ArrangeVHBMem, %function
Real8_ArrangeVHBMem:
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
	mov	r4, r2
	ldr	r2, [r2, #96]
	mov	r5, r1
	ldr	r3, [r4, #92]
	cmp	r2, #1
	bls	.L23
	sub	r0, r3, #2
	movw	r1, #510
	cmp	r2, #512
	cmpls	r0, r1
	bhi	.L23
	ldr	r1, [r5]
	ldr	r3, [r1, #708]
	cmp	r3, #0
	ldr	r3, [r1, #28]
	bne	.L26
	cmp	r3, #25
	beq	.L50
.L27:
	ldr	r9, [r4, #88]
	mov	r7, #5
	ldr	r10, [r4, #84]
	mov	r6, #2
	mov	r8, #4
.L33:
	ldr	r3, .L52
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #76
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r0, [r4, #84]
	ldr	r1, [r5]
	mov	r3, #0
	ldr	r2, [r4, #88]
	str	r0, [fp, #-48]
	ldr	r1, [r1, #28]
	str	r9, [fp, #-68]
	cmp	r1, #24
	str	r10, [fp, #-64]
	str	r2, [fp, #-52]
	strb	r3, [fp, #-75]
	beq	.L39
	uxtb	r3, r6
	strb	r8, [fp, #-73]
	strb	r7, [fp, #-71]
.L43:
	add	r6, r5, #53248
	sub	r1, fp, #76
	mov	r4, #0
	strb	r3, [fp, #-70]
	ldr	r0, [r6, #3496]
	strb	r4, [fp, #-74]
	bl	FSP_ConfigInstance
	cmp	r0, r4
	bne	.L49
	ldr	r1, [r5]
	sub	r3, fp, #80
	ldr	r0, [r6, #3496]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L51
	cmp	r0, #0
	addeq	r5, r5, #8192
	moveq	r3, #1
	moveq	r0, r3
	streqb	r3, [r5, #3196]
	beq	.L48
.L41:
	ldr	r1, .L52+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L48
.L23:
	ldr	r1, .L52+8
	mov	r0, #0
	bl	dprint_vfmw
.L49:
	mov	r0, #0
.L48:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L26:
	cmp	r3, #25
	bne	.L27
	ldr	r2, [r4, #88]
	ldr	r0, [r1, #668]
	ldr	r3, [r4, #84]
	cmp	r2, r0
	ldr	ip, [r1, #672]
	bhi	.L36
	cmp	r3, ip
	bhi	.L36
	ldr	r0, [r1, #696]
	mov	r9, r2
	ldr	r6, [r1, #692]
	mov	r10, r3
	cmp	r0, #0
	add	r8, r6, #2
	beq	.L46
	add	r3, r6, #1
	cmp	r3, #17
	movlt	r6, r3
	movge	r6, #17
.L38:
	ldrb	r7, [r1, #716]	@ zero_extendqisi2
	b	.L33
.L39:
	mov	r3, #1
	strb	r7, [fp, #-71]
	strb	r3, [fp, #-73]
	b	.L43
.L36:
	stmia	sp, {r0, ip}
	mov	r0, #0
	ldr	r1, .L52+12
	bl	dprint_vfmw
	mov	r0, #0
	b	.L48
.L50:
	ldr	r2, [r4, #88]
	ldr	r9, [r1, #668]
	ldr	r3, [r4, #84]
	cmp	r2, r9
	ldr	r10, [r1, #672]
	bhi	.L29
	cmp	r3, r10
	bhi	.L29
	add	r3, r5, #8192
	ldrb	r0, [r3, #3196]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L48
	ldr	r2, [r1, #696]
	ldr	r3, [r1, #692]
	cmp	r2, #0
	add	r8, r3, #2
	beq	.L46
	add	r3, r3, #1
	cmp	r3, #17
	movlt	r6, r3
	movge	r6, #17
	b	.L38
.L46:
	mov	r6, #1
	b	.L38
.L29:
	stmia	sp, {r9, r10}
	mov	r0, #0
	ldr	r1, .L52+12
	bl	dprint_vfmw
	mov	r0, #0
	b	.L48
.L51:
	add	r0, r5, #56320
	add	r0, r0, #72
	bl	ResetVoQueue
	b	.L41
.L53:
	.align	2
.L52:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	.word	.LC8
	.word	.LC9
	UNWIND(.fnend)
	.size	Real8_ArrangeVHBMem, .-Real8_ArrangeVHBMem
	.align	2
	.global	Real8_CB_GetCPFMT
	.type	Real8_CB_GetCPFMT, %function
Real8_CB_GetCPFMT:
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
	mov	r6, r1
	mov	r1, #4
	mov	r5, r0
	bl	BsShow
	mov	r1, #4
	mov	r4, r0
	mov	r0, r5
	bl	BsSkip
	strb	r4, [r6]
	mov	r1, #9
	mov	r0, r5
	bl	BsShow
	mov	r1, #9
	mov	r4, r0
	add	r4, r4, #1
	mov	r0, r5
	bl	BsSkip
	mov	r4, r4, asl #2
	mov	r0, r5
	str	r4, [r6, #88]
	bl	Real8_CB_Get1Bit
	cmp	r0, #1
	mov	r4, r0
	beq	.L57
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L57:
	mov	r1, #9
	mov	r0, r5
	bl	BsShow
	mov	r1, #9
	mov	r7, r0
	mov	r0, r5
	bl	BsSkip
	mov	r7, r7, asl #2
	mov	r0, r4
	str	r7, [r6, #84]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_CB_GetCPFMT, .-Real8_CB_GetCPFMT
	.align	2
	.global	Real8_CB_SetDimensions
	.type	Real8_CB_SetDimensions, %function
Real8_CB_SetDimensions:
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
	ldr	r3, [r0, #88]
	ldr	r2, [r0, #84]
	cmp	r3, #128
	beq	.L75
	cmp	r3, #176
	beq	.L76
	cmp	r3, #352
	beq	.L77
	cmp	r3, #704
	beq	.L78
	cmp	r3, #1408
	beq	.L79
.L60:
	add	r3, r3, #15
	add	r2, r2, #15
	mov	r3, r3, lsr #4
	mov	r2, r2, lsr #4
	str	r3, [r0, #28]
	mul	r3, r3, r2
	str	r2, [r0, #24]
	sub	r3, r3, #1
	cmp	r3, #47
	movls	r2, #0
	bls	.L61
	cmp	r3, #98
	bls	.L70
	cmp	r3, #396
	bcc	.L71
	cmp	r3, #1584
	bcc	.L72
	cmp	r3, #6336
	movcs	r2, #5
	bcc	.L74
.L61:
	ldr	r3, .L80
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #256]
	str	r3, [r0, #32]
	ldmfd	sp, {fp, sp, pc}
.L79:
	cmp	r2, #1152
	bne	.L60
	mov	r2, #88
	mov	r3, #72
	str	r2, [r0, #28]
	str	r3, [r0, #24]
.L74:
	mov	r2, #4
	b	.L61
.L75:
	cmp	r2, #96
	bne	.L60
	mov	r2, #8
	mov	r3, #6
	str	r2, [r0, #28]
	mov	r2, #0
	str	r3, [r0, #24]
	b	.L61
.L76:
	cmp	r2, #144
	bne	.L60
	mov	r2, #11
	mov	r3, #9
	str	r2, [r0, #28]
	str	r3, [r0, #24]
.L70:
	mov	r2, #1
	b	.L61
.L77:
	cmp	r2, #288
	bne	.L60
	mov	r2, #22
	mov	r3, #18
	str	r2, [r0, #28]
	str	r3, [r0, #24]
.L71:
	mov	r2, #2
	b	.L61
.L78:
	cmp	r2, #576
	bne	.L60
	mov	r2, #44
	mov	r3, #36
	str	r2, [r0, #28]
	str	r3, [r0, #24]
.L72:
	mov	r2, #3
	b	.L61
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real8_CB_SetDimensions, .-Real8_CB_SetDimensions
	.align	2
	.global	Real8_CB_GetPicSize
	.type	Real8_CB_GetPicSize, %function
Real8_CB_GetPicSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
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
	ldr	ip, .L98
	mov	r9, r1
	mov	r4, r0
	mov	r8, r2
	mov	r7, r3
	ldmia	ip!, {r0, r1, r2, r3}
	sub	r6, fp, #108
	sub	lr, fp, #76
	add	r5, ip, #16
	add	r10, ip, #48
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	stmia	r6, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2, r3}
	stmia	lr, {r0, r1, r2, r3}
	ldmia	r10, {r0, r1, r2, r3}
	ldr	ip, [r9, #32]
	sub	ip, ip, #2
	cmp	ip, #1
	sub	ip, fp, #124
	stmia	ip, {r0, r1, r2, r3}
	bls	.L96
.L83:
	mov	r1, #3
	mov	r0, r4
	bl	BsShow
	mov	r1, #3
	mov	r5, r0
	mov	r0, r4
	bl	BsSkip
	sub	r3, fp, #44
	add	r5, r3, r5, lsl #2
	ldr	r6, [r5, #-64]
	cmp	r6, #0
	beq	.L86
.L85:
	mov	r1, #3
	mov	r0, r4
	bl	BsShow
	mov	r1, #3
	mov	r9, r0
	mov	r0, r4
	bl	BsSkip
	sub	r3, fp, #44
	add	r3, r3, r9, lsl #2
	ldr	r5, [r3, #-32]
	cmp	r5, #0
	beq	.L97
.L87:
	str	r6, [r8]
	str	r5, [r7]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L86:
	mov	r1, #8
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	mov	r5, r0
	mov	r0, r4
	bl	BsSkip
	cmp	r5, #255
	add	r6, r6, r5, lsl #2
	beq	.L86
	b	.L85
.L96:
	mov	r0, r4
	bl	Real8_CB_Get1Bit
	cmp	r0, #0
	beq	.L83
	ldr	r3, [r9, #64]
	str	r3, [r8]
	ldr	r3, [r9, #68]
	str	r3, [r7]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L97:
	mov	r0, r4
	mov	r9, r9, asl #1
	bl	Real8_CB_Get1Bit
	sub	r2, fp, #44
	orr	r0, r0, r9
	and	r3, r0, #3
	add	r3, r2, r3, lsl #2
	ldr	r5, [r3, #-80]
	cmp	r5, #0
	bne	.L87
.L88:
	mov	r1, #8
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	mov	r9, r0
	mov	r0, r4
	bl	BsSkip
	cmp	r9, #255
	add	r5, r5, r9, lsl #2
	beq	.L88
	b	.L87
.L99:
	.align	2
.L98:
	.word	.LANCHOR0+280
	UNWIND(.fnend)
	.size	Real8_CB_GetPicSize, .-Real8_CB_GetPicSize
	.align	2
	.global	Real8_CB_FindNextSliceStartCode
	.type	Real8_CB_FindNextSliceStartCode, %function
Real8_CB_FindNextSliceStartCode:
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
	cmp	r6, #2
	subgt	r6, r6, #2
	movgt	r4, #0
	bgt	.L103
	b	.L104
.L109:
	bl	BsSkip
	cmp	r4, r6
	beq	.L104
.L103:
	mov	r1, #17
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r5
	bne	.L109
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L104:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_CB_FindNextSliceStartCode, .-Real8_CB_FindNextSliceStartCode
	.align	2
	.global	Real8_CB_SearchBits_IgnoreOnly0
	.type	Real8_CB_SearchBits_IgnoreOnly0, %function
Real8_CB_SearchBits_IgnoreOnly0:
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
	mov	r6, #1
	sub	ip, r1, #1
	mov	r7, r2
	mov	r9, r3
	mov	r10, r1
	mov	r8, r0
	mov	r6, r6, asl ip
	bl	BsShow
	mov	r1, r10
	mov	r4, r0
	mov	r0, r8
	bl	BsSkip
	cmp	r7, r4
	cmpne	r9, #0
	beq	.L111
	ands	r5, r4, r6
	bne	.L111
	ldr	r3, .L117
	add	r10, r3, r10, lsl #2
	ldr	r10, [r10, #360]
	b	.L112
.L113:
	tst	r4, r6
	bne	.L111
.L112:
	mov	r0, r8
	and	r4, r10, r4, asl #1
	bl	Real8_CB_Get1Bit
	add	r5, r5, #1
	orr	r4, r0, r4
	cmp	r7, r4
	cmpne	r9, r5
	bhi	.L113
.L111:
	rsb	r0, r7, r4
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real8_CB_SearchBits_IgnoreOnly0, .-Real8_CB_SearchBits_IgnoreOnly0
	.align	2
	.global	Real8_CB_SetRPRSizes
	.type	Real8_CB_SetRPRSizes, %function
Real8_CB_SetRPRSizes:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
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
	ldr	lr, .L120
	sub	r3, fp, #28
	mov	r4, r0
	mov	r5, r1
	mov	r7, r2
	add	r6, r3, r1, lsl #2
	sub	ip, fp, #64
	ldmia	lr!, {r0, r1, r2, r3}
	str	r5, [r4, #16]
	str	r7, [r4, #12]
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	ldr	lr, [lr]
	stmia	ip!, {r0, r1, r2, r3}
	str	lr, [ip]
	ldr	r3, [r6, #-36]
	str	r3, [r4, #8]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L121:
	.align	2
.L120:
	.word	.LANCHOR0+460
	UNWIND(.fnend)
	.size	Real8_CB_SetRPRSizes, .-Real8_CB_SetRPRSizes
	.align	2
	.global	Real8_CB_GetSSC
	.type	Real8_CB_GetSSC, %function
Real8_CB_GetSSC:
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
	ldr	r3, [r1, #76]
	cmp	r3, #1
	beq	.L124
	bl	Real8_CB_FindNextSliceStartCode
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L124:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_CB_GetSSC, .-Real8_CB_GetSSC
	.align	2
	.global	Real8_CB_GetSliceHeader
	.type	Real8_CB_GetSliceHeader, %function
Real8_CB_GetSliceHeader:
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
	ldr	r4, [fp, #8]
	mov	r5, r2
	mov	r7, r3
	mov	r6, r0
	ldr	ip, [r4, #76]
	cmp	ip, #1
	beq	.L159
	cmp	r1, #0
	beq	.L160
	mov	r2, #0
	str	r2, [r5]
	ldr	r2, [fp, #4]
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L159:
	cmp	r1, #0
	bne	.L128
	mov	r1, #3
	ldr	r9, [r4, #40]
	bl	BsShow
	mov	r1, #3
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	cmp	r8, #7
	bhi	.L131
	ldr	r3, .L163
	add	r8, r3, r8, lsl #2
	ldr	r3, [r8, #496]
	cmp	r3, #2
	bhi	.L131
	cmn	r9, #1
	mov	r1, #2
	mov	r0, r6
	movne	r9, #0
	moveq	r9, #1
	cmp	r9, #0
	bne	.L161
	bl	BsShow
	mov	r1, #2
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r3, [r4, #36]
	cmp	r3, r8
	bne	.L131
.L133:
	mov	r0, r6
	bl	Real8_CB_Get1Bit
	cmp	r0, #0
	bne	.L131
	mov	r1, #5
	mov	r0, r6
	bl	BsShow
	mov	r1, #5
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	uxtb	r0, r8
	cmp	r0, #31
	strb	r0, [r4, #6]
	bhi	.L131
	mov	r1, #1
	mov	r0, r6
	bl	BsShow
	mov	r1, #1
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	adds	r8, r8, #0
	mov	r1, #13
	mov	r0, r6
	movne	r8, #1
	cmp	r9, #0
	strb	r8, [r4, #5]
	beq	.L134
	bl	BsShow
	mov	r1, #13
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r8, [r4, #8]
	str	r9, [r4, #44]
	cmp	r8, #0
	beq	.L152
	mov	r1, r8
	mov	r0, r6
	bl	BsShow
	mov	r1, r8
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r3, [r4, #12]
	str	r9, [r4, #56]
	cmp	r3, #0
	beq	.L131
	add	r1, r3, r9, lsl #3
	ldr	r2, [r3, r9, asl #3]
	mov	r0, r4
	ldr	r3, [r1, #4]
	str	r2, [r4, #60]
	str	r2, [r4, #88]
	str	r3, [r4, #64]
	str	r3, [r4, #84]
	bl	Real8_CB_SetDimensions
.L152:
	ldr	r8, [r4, #32]
	mov	r0, r6
	mov	r1, r8
	bl	BsShow
	mov	r1, r8
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	mov	r1, #1
	str	r9, [r4, #40]
	mov	r0, r6
	bl	BsShow
	mov	r1, #1
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	strb	r8, [r4, #4]
.L128:
	ldr	r2, [r4, #40]
	mov	r3, #0
	ldr	r1, [fp, #4]
	mov	r0, #1
	str	r2, [r5]
	ldrb	r2, [r4, #6]	@ zero_extendqisi2
	str	r2, [r1]
	str	r3, [r7]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L160:
	bl	Real8_CB_Get1Bit
	cmp	r0, #1
	beq	.L162
.L131:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L162:
	ldr	r8, [r4, #32]
	mov	r0, r6
	mov	r1, r8
	bl	BsShow
	mov	r1, r8
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	str	r9, [r5]
	ldr	r3, [r4, #32]
	cmp	r3, #11
	bls	.L144
	mov	r0, r6
	bl	Real8_CB_Get1Bit
	cmp	r0, #1
	bne	.L131
.L144:
	mov	r1, #5
	mov	r0, r6
	bl	BsShow
	mov	r1, #5
	mov	r4, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r3, [fp, #4]
	cmp	r4, #31
	str	r4, [r3]
	bgt	.L131
	mov	r0, r6
	bl	Real8_CB_Get1Bit
	cmp	r0, #1
	mov	r4, r0
	bne	.L131
	mov	r1, #2
	mov	r0, r6
	bl	BsShow
	mov	r1, #2
	mov	r5, r0
	mov	r0, r6
	bl	BsSkip
	str	r5, [r7]
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L161:
	bl	BsShow
	mov	r1, #2
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	str	r8, [r4, #36]
	b	.L133
.L134:
	bl	BsShow
	mov	r1, #13
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r3, [r4, #44]
	cmp	r3, r8
	bne	.L131
	ldr	r8, [r4, #8]
	cmp	r8, #0
	beq	.L156
	mov	r1, r8
	mov	r0, r6
	bl	BsShow
	mov	r1, r8
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	ldr	r3, [r4, #56]
	cmp	r3, r9
	bne	.L131
.L156:
	ldr	r8, [r4, #32]
	mov	r0, r6
	mov	r1, r8
	bl	BsShow
	mov	r1, r8
	mov	r9, r0
	mov	r0, r6
	bl	BsSkip
	mov	r1, #1
	str	r9, [r4, #40]
	mov	r0, r6
	bl	BsShow
	mov	r1, #1
	mov	r8, r0
	mov	r0, r6
	bl	BsSkip
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r8
	bne	.L131
	b	.L128
.L164:
	.align	2
.L163:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real8_CB_GetSliceHeader, .-Real8_CB_GetSliceHeader
	.align	2
	.global	Real8_CB_GetPictureHeader
	.type	Real8_CB_GetPictureHeader, %function
Real8_CB_GetPictureHeader:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	ldr	r3, [r1, #76]
	mov	r4, r1
	mov	r5, r0
	cmp	r3, #1
	beq	.L191
	ldr	r3, .L194
	mov	r2, #140
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	mov	r1, #24
	mov	r6, r0
	mov	r0, r5
	bl	BsSkip
	cmp	r6, #1
	bne	.L184
	mov	r0, r5
	sub	r1, fp, #32
	bl	Real8_CB_GetVLCBits
	cmp	r0, #30
	bls	.L184
	ldr	r3, [fp, #-32]
	ands	r2, r3, #1
	bne	.L184
	tst	r3, #2
	mov	r0, r5
	strne	r2, [r4, #88]
	moveq	r1, #176
	moveq	r2, #144
	streq	r1, [r4, #88]
	sub	r1, fp, #32
	str	r2, [r4, #84]
	ubfx	r2, r3, #2, #5
	ubfx	r3, r3, #7, #8
	str	r2, [r4, #120]
	str	r3, [r4, #108]
	bl	Real8_CB_GetVLCBits
	cmp	r0, #1
	streq	r0, [r4, #80]
	beq	.L179
	cmp	r0, #3
	beq	.L192
	cmp	r0, #5
	bne	.L184
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L184
	mov	r3, #2
	str	r3, [r4, #80]
.L179:
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L193
.L181:
	sub	r3, r3, #48
	movw	r2, #8144
	cmp	r3, r2
	bhi	.L184
.L190:
	ldr	r3, [r4, #84]
	sub	r3, r3, #48
	cmp	r3, r2
	bhi	.L184
	mov	r0, r4
	bl	Real8_CB_SetDimensions
	mov	r0, #1
.L167:
	ldr	r3, [r4, #88]
	ldr	r2, [r4, #84]
	add	r3, r3, #15
	add	r2, r2, #15
	mov	r3, r3, lsr #4
	str	r3, [r4, #96]
	mov	r2, r2, lsr #4
	str	r2, [r4, #92]
	mul	r3, r3, r2
	str	r3, [r4, #100]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L192:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r4, #80]
	beq	.L179
.L184:
	mvn	r0, #1
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L191:
	str	r1, [sp, #4]
	mvn	r2, #0
	sub	r3, fp, #32
	str	r2, [r1, #40]
	str	r3, [sp]
	sub	r2, fp, #36
	sub	r3, fp, #40
	mov	r1, #0
	bl	Real8_CB_GetSliceHeader
	cmp	r0, #1
	mvnne	r0, #1
	bne	.L167
	ldr	r3, [r4, #36]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L168
.L170:
	.word	.L169
	.word	.L171
	.word	.L172
	.word	.L173
.L193:
	mov	r0, r5
	mov	r1, r4
	bl	Real8_CB_GetCPFMT
	cmp	r0, #0
	beq	.L184
	ldr	r3, [r4, #88]
	b	.L181
.L171:
	mov	r3, #0
	str	r3, [r4, #80]
	str	r3, [r4, #20]
.L168:
	ldr	r3, [r4, #88]
	add	r0, r4, #44
	movw	r2, #8144
	ldrb	r5, [r4, #4]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldrb	lr, [r4, #5]	@ zero_extendqisi2
	cmp	r3, r2
	ldrb	ip, [r4, #6]	@ zero_extendqisi2
	ldmia	r0, {r0, r1, r3}
	str	r5, [r4, #112]
	str	lr, [r4, #116]
	str	ip, [r4, #120]
	str	r0, [r4, #108]
	str	r1, [r4, #128]
	str	r3, [r4, #132]
	bls	.L190
	b	.L184
.L173:
	mov	r3, #2
	str	r3, [r4, #80]
	b	.L168
.L172:
	mov	r3, #1
	str	r3, [r4, #80]
	b	.L168
.L169:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r4, #80]
	str	r3, [r4, #20]
	b	.L168
.L195:
	.align	2
.L194:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Real8_CB_GetPictureHeader, .-Real8_CB_GetPictureHeader
	.align	2
	.global	Real8_SetImgFormat
	.type	Real8_SetImgFormat, %function
Real8_SetImgFormat:
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
	add	r5, r0, #53248
	mov	r6, r0
	ldr	r1, [r5, #3100]
	ldr	r0, [r5, #3496]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r2, [r5, #1816]
	mov	ip, #5
	ldrb	r1, [r4, #124]	@ zero_extendqisi2
	mov	r0, #1
	ldrb	r3, [r4, #125]	@ zero_extendqisi2
	bfi	r1, r2, #0, #2
	and	r3, r3, #252
	and	r1, r1, #227
	orr	r3, r3, #12
	bfi	r1, ip, #5, #3
	bfi	r3, r0, #4, #2
	strb	r1, [r4, #124]
	strb	r3, [r4, #125]
	ldr	r3, [r4, #124]
	bfc	r3, #14, #3
	str	r3, [r4, #124]
	ldr	r3, [r5, #1824]
	cmp	r3, #1920
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	orrls	r3, r3, #2
	bfchi	r3, #1, #1
	strb	r3, [r4, #126]
	ldr	r3, [r6]
	ldr	r3, [r3, #592]
	cmp	r3, #1
	beq	.L206
.L200:
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r4, #126]
.L201:
	and	r3, r2, #3
	mov	r10, #0
	str	r3, [r4, #116]
	mov	r1, r10
	str	r3, [r4, #120]
	mov	r0, r4
	str	r10, [r4, #112]
	ldr	r3, [r5, #1824]
	str	r3, [r4, #128]
	ldr	r3, [r5, #1820]
	str	r3, [r4, #132]
	bl	SetAspectRatio
	ldr	r3, [r6]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L207
.L202:
	mov	r3, #8
	mov	r2, #1
	mov	r1, #0
	str	r3, [r4, #412]
	str	r3, [r4, #416]
	str	r3, [r4, #424]
	str	r3, [r4, #420]
	strb	r1, [r4, #400]
	strb	r2, [r4, #407]
	strb	r2, [r4, #405]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L206:
	ldrb	r3, [r4, #126]	@ zero_extendqisi2
	tst	r3, #2
	orreq	r3, r3, #4
	streqb	r3, [r4, #126]
	beq	.L201
	b	.L200
.L207:
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
	b	.L202
	UNWIND(.fnend)
	.size	Real8_SetImgFormat, .-Real8_SetImgFormat
	.align	2
	.global	RV8_RecordVFMWState
	.type	RV8_RecordVFMWState, %function
RV8_RecordVFMWState:
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
	.size	RV8_RecordVFMWState, .-RV8_RecordVFMWState
	.align	2
	.global	Real8_WriteSliceMsg
	.type	Real8_WriteSliceMsg, %function
Real8_WriteSliceMsg:
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
	mov	r2, #44
	add	r3, r0, #53248
	mla	r2, r2, r1, r0
	ldr	r4, [r3, #1904]
	add	r1, r1, #1
	add	ip, r2, #128
	add	lr, r2, #136
	str	r4, [r2, #108]
	ldr	r4, [r3, #1896]
	str	r4, [r2, #116]
	ldr	r4, [r3, #1900]
	str	r4, [r2, #124]
	ldr	r4, [r3, #1916]
	str	r4, [r2, #112]
	ldr	r4, [r3, #1908]
	str	r4, [r2, #120]
	ldr	r4, [r3, #1912]
	str	r4, [r2, #128]
	ldr	r2, [r3, #1884]
	str	r2, [ip, #4]
	ldr	r2, [r3, #1880]
	str	r2, [ip, #8]
	ldr	r2, [r3, #1876]
	str	r2, [lr, #4]
	ldr	r3, [r3, #1888]
	str	r3, [lr, #8]
	str	r1, [r0, #44]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_WriteSliceMsg, .-Real8_WriteSliceMsg
	.align	2
	.global	Real8_WritePicMsg
	.type	Real8_WritePicMsg, %function
Real8_WritePicMsg:
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
	ldr	r2, [r3, #1816]
	cmp	r2, #2
	strb	r2, [r0, #20]
	ldr	r2, [r3, #1832]
	str	r2, [r0, #12]
	ldr	r2, [r3, #1828]
	str	r2, [r0, #16]
	ldr	r2, [r3, #3016]
	str	r2, [r0, #24]
	ldr	r2, [r3, #3020]
	str	r2, [r0, #28]
	ldr	r2, [r3, #1856]
	str	r2, [r0, #32]
	ldr	r1, [r3, #1920]
	str	r1, [r0, #36]
	ldr	r1, [r3, #1924]
	str	r1, [r0, #40]
	strne	r2, [r3, #1920]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_WritePicMsg, .-Real8_WritePicMsg
	.align	2
	.global	Real8_WriteReg
	.type	Real8_WriteReg, %function
Real8_WriteReg:
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
	str	r1, [r0, #48]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_WriteReg, .-Real8_WriteReg
	.align	2
	.global	Real8_ModifySliceMsg
	.type	Real8_ModifySliceMsg, %function
Real8_ModifySliceMsg:
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
	ldr	r2, [r0, #144]
	ldr	r3, [r0, #12]
	cmp	r2, #0
	ldr	ip, [r0, #16]
	bne	.L220
	mul	ip, r3, ip
	ldr	r5, [r0, #44]
	cmp	r5, #2
	sub	ip, ip, #1
	bls	.L219
	ldr	r3, [r0, #188]
	sub	lr, r5, #1
	cmp	r3, #0
	cmpgt	ip, r3
	ble	.L220
	mov	r2, r0
	mov	r3, #1
	b	.L221
.L222:
	ldr	r1, [r2, #232]
	add	r2, r2, #44
	cmp	ip, r1
	cmpgt	r1, #0
	ble	.L220
.L221:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L222
.L219:
	cmp	r5, #1
	bls	.L223
	sub	r4, r5, #1
	mov	r3, r0
	mov	r2, #0
	b	.L224
.L225:
	ldr	lr, [r3, #144]
	add	r3, r3, #44
	add	r2, r2, #1
	ldr	r1, [r3, #144]
	cmp	lr, r1
	bge	.L220
.L224:
	cmp	r2, r4
	bne	.L225
	mov	r3, #44
	mla	r2, r3, r2, r0
	ldr	r3, [r2, #144]
	cmp	ip, r3
	cmpge	r3, #0
	ble	.L220
.L223:
	cmp	r5, #0
	beq	.L226
	sub	r7, r5, #1
	mov	r6, r0
	mov	lr, r0
	mov	r4, #0
	b	.L229
.L244:
	cmp	r4, r5
	beq	.L243
.L229:
	cmp	r4, r7
	streq	ip, [lr, #148]
	add	r4, r4, #1
	add	lr, lr, #44
	ldrne	r3, [lr, #144]
	moveq	r1, ip
	subne	r1, r3, #1
	ldr	r3, [lr, #100]
	strne	r1, [lr, #104]
	mov	r2, r3, lsr #31
	cmp	ip, r3
	orrlt	r2, r2, #1
	cmp	r3, r1
	movle	r3, r2
	orrgt	r3, r2, #1
	orr	r3, r3, r1, lsr #31
	cmp	ip, r1
	orrlt	r3, r3, #1
	cmp	r3, #0
	beq	.L244
.L220:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L243:
	ldr	r2, [r0, #108]
	mov	r1, r2
	b	.L232
.L245:
	ldr	r1, [r6, #108]
.L232:
	cmp	r2, r1
	ldr	ip, [r6, #112]
	add	r3, r3, #1
	movcs	r2, r1
	cmp	ip, r2
	bcs	.L230
	ldr	r1, [r6, #128]
	cmp	r1, #0
	movne	r2, ip
.L230:
	cmp	r5, r3
	add	r6, r6, #44
	bne	.L245
	bic	r2, r2, #15
	ldr	lr, [r0, #44]
	str	r2, [r0, #52]
	mov	r3, r0
	mov	ip, #0
	b	.L236
.L246:
	ldr	r4, [r3, #116]
	rsb	r2, r2, r1
	and	r1, r4, #7
	add	r2, r2, r4, lsr #3
	and	r4, r2, #15
	bic	r2, r2, #15
	str	r2, [r3, #108]
	add	r2, r1, r4, lsl #3
	str	r2, [r3, #116]
.L234:
	add	ip, ip, #1
	add	r3, r3, #44
	cmp	lr, ip
	bls	.L235
	ldr	r2, [r0, #52]
.L236:
	ldr	r1, [r3, #112]
	cmp	r1, #0
	rsb	r4, r2, r1
	ldr	r1, [r3, #108]
	beq	.L246
	ldr	r5, [r3, #116]
	rsb	r2, r2, r1
	ldr	r7, [r3, #120]
	and	r6, r5, #7
	add	r2, r2, r5, lsr #3
	and	r5, r7, #7
	add	r1, r4, r7, lsr #3
	and	r4, r2, #15
	and	r7, r1, #15
	bic	r2, r2, #15
	add	r4, r6, r4, lsl #3
	str	r2, [r3, #108]
	bic	r1, r1, #15
	add	r2, r5, r7, lsl #3
	str	r4, [r3, #116]
	str	r2, [r3, #120]
	str	r1, [r3, #112]
	b	.L234
.L226:
	ldr	r3, [r0, #108]
	bic	r3, r3, #15
	str	r3, [r0, #52]
.L235:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real8_ModifySliceMsg, .-Real8_ModifySliceMsg
	.align	2
	.global	REAL8DEC_Init
	.type	REAL8DEC_Init, %function
REAL8DEC_Init:
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
	ldr	r3, .L251
	add	r4, r0, #53248
	mov	r7, r1
	movw	r2, #56760
	ldr	r8, [r4, #3488]
	mov	r1, #0
	ldr	r3, [r3, #48]
	mov	r5, r0
	mov	r6, r1
	blx	r3
	add	r0, r5, #56320
	str	r8, [r4, #3488]
	add	r0, r0, #72
	bl	ResetVoQueue
	str	r7, [r5]
	mov	r3, #15
	str	r3, [r4, #1920]
	str	r3, [r4, #1924]
	add	r2, r5, #8192
	ldr	ip, [r7, #8]
	mov	r3, #1
	strb	r6, [r2, #3196]
	mov	r1, #8192
	mov	r0, r5
	strb	ip, [r2, #3194]
	str	r1, [r4, #1840]
	str	r3, [r4, #1812]
	strb	r3, [r4, #1736]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #3496]
	mov	r0, r6
	beq	.L250
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L250:
	ldr	r1, .L251+4
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L252:
	.align	2
.L251:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC11
	UNWIND(.fnend)
	.size	REAL8DEC_Init, .-REAL8DEC_Init
	.align	2
	.global	REAL8DEC_Destroy
	.type	REAL8DEC_Destroy, %function
REAL8DEC_Destroy:
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
	ldr	r1, .L254
	mov	r0, #2
	ldr	r2, [r3, #2992]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L255:
	.align	2
.L254:
	.word	.LC12
	UNWIND(.fnend)
	.size	REAL8DEC_Destroy, .-REAL8DEC_Destroy
	.global	__aeabi_idiv
	.align	2
	.global	REAL8DEC_Decode
	.type	REAL8DEC_Decode, %function
REAL8DEC_Decode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #308)
	sub	sp, sp, #308
	mov	r2, #140
	mov	r6, r0
	mov	r4, r1
	add	r10, r6, #53248
	mov	r1, #0
	sub	r0, fp, #184
	bl	memset
	mov	r2, #64
	mov	r1, #0
	sub	r0, fp, #248
	bl	memset
	ldr	r2, [r10, #1796]
	ldr	r3, [r10, #1800]
	cmp	r4, #0
	mov	r0, #1
	mov	r1, #8192
	add	ip, r6, #8
	str	r2, [r10, #1804]
	str	ip, [fp, #-300]
	str	r2, [fp, #-116]
	str	r2, [fp, #-124]
	str	r3, [r10, #1808]
	str	r3, [fp, #-112]
	str	r3, [fp, #-120]
	str	r0, [r10, #1812]
	str	r0, [fp, #-108]
	str	r1, [r10, #1840]
	str	r1, [fp, #-80]
	beq	.L389
	ldr	r3, .L410
	movw	r2, #11364
	mov	r1, #0
	ldr	r0, [fp, #-300]
	mov	r9, r1
	add	r5, r6, #8192
	ldr	r3, [r3, #48]
	blx	r3
	str	r9, [r10, #2956]
	ldr	r3, [r4, #16]
	str	r3, [r10, #2976]
	ldr	r3, [r4, #12]
	str	r3, [r10, #2960]
	ldr	r3, [r4]
	str	r3, [r5, #3184]
	ldr	r2, [r4, #16]
	str	r2, [r10, #2964]
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	strb	r3, [r5, #3192]
	ldrb	r3, [r4, #6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L259
	ldr	r3, [r4, #92]
	str	r3, [r10, #2968]
	ldr	r3, [r4, #80]
	str	r3, [r5, #3188]
	ldr	r3, [r4, #96]
	str	r3, [r10, #2972]
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	strb	r3, [r5, #3193]
	ldrb	r3, [r4, #86]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L390
.L260:
	movw	r3, #65460
	sub	r1, r2, #75
	movt	r3, 47
	cmp	r1, r3
	bhi	.L385
	ldr	r1, [r5, #3184]
	cmp	r1, #0
	beq	.L385
	add	r4, r6, #56320
	add	r4, r4, #40
	mov	r0, r4
	bl	BsInit
	mov	r1, #8
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	mov	r7, r0
	str	r0, [fp, #-296]
	mov	r0, r4
	bl	BsSkip
	cmp	r7, #8
	bhi	.L385
	sub	r8, fp, #252
	sub	r7, fp, #188
.L263:
	mov	r1, #32
	mov	r0, r4
	bl	BsShow
	mov	r1, #32
	mov	r9, r0
	mov	r0, r4
	bl	BsSkip
	rev	r9, r9
	str	r9, [r8, #4]!
	cmp	r8, r7
	bne	.L263
	mov	r1, #8
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	mov	r7, r0
	mov	r0, r4
	bl	BsSkip
	cmp	r7, #255
	add	r0, r7, #1
	str	r0, [r10, #1928]
	bhi	.L385
	cmp	r0, #0
	beq	.L264
	add	r9, r6, #55040
	movw	r8, #65535
	add	r9, r9, #136
	str	r5, [fp, #-304]
	movt	r8, 47
	mov	r7, #0
	mov	r5, r9
	b	.L265
.L392:
	ldr	r0, [r10, #1928]
	cmp	r0, r7
	bls	.L391
.L265:
	mov	r1, #32
	mov	r0, r4
	bl	BsSkip
	mov	r1, #32
	mov	r0, r4
	add	r7, r7, #1
	bl	BsShow
	mov	r1, #32
	mov	r9, r0
	mov	r0, r4
	bl	BsSkip
	rev	r3, r9
	cmp	r3, r8
	str	r3, [r5, #4]!
	ble	.L392
.L385:
	mov	r3, #0
	str	r3, [fp, #-296]
.L374:
	ldr	r0, [fp, #-296]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L390:
	ldr	r1, [r4, #20]
	ldr	r0, [r10, #3496]
	str	r9, [fp, #-296]
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #100]
	ldr	r0, [r10, #3496]
	bl	SM_ReleaseStreamSeg
	ldr	r0, [fp, #-296]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L259:
	str	r9, [r10, #2968]
	str	r9, [r5, #3188]
	str	r9, [r10, #2972]
	strb	r9, [r5, #3193]
	b	.L260
.L389:
	ldr	r2, [r10, #2992]
	ldr	r1, .L410+4
	str	r4, [fp, #-296]
	bl	dprint_vfmw
	ldr	r0, [fp, #-296]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L391:
	ldr	r5, [fp, #-304]
.L264:
	add	r3, r6, #55040
	sub	r7, r0, #1
	add	r3, r3, #140
	mov	r2, #0
	b	.L266
.L267:
	ldr	ip, [r3, #4]!
	ldr	r1, [r3, #-4]
	cmp	ip, r1
	ble	.L385
.L266:
	cmp	r2, r7
	add	r2, r2, #1
	bne	.L267
	ldr	r2, [r10, #1932]
	mov	r0, r0, asl #3
	add	r1, r0, #66
	movw	r3, #65461
	add	r0, r1, r2
	cmp	r1, #3145728
	sub	r7, r0, #74
	movt	r3, 47
	movlt	r2, #0
	movge	r2, #1
	cmp	r7, r3
	movls	r7, r2
	orrhi	r7, r2, #1
	str	r1, [fp, #-304]
	cmp	r7, #0
	str	r0, [fp, #-308]
	bne	.L385
	ldr	r2, [r10, #2964]
	mov	r3, r0
	rsb	r2, r0, r2
	cmp	r2, #0
	ble	.L385
	ldr	r1, [r5, #3184]
	mov	r0, r4
	ldr	r9, .L410+8
	sub	r8, fp, #248
	add	r1, r1, r3
	bl	BsInit
	ldr	r3, [fp, #-296]
	sub	r2, fp, #44
	sub	lr, fp, #284
	str	r8, [fp, #-172]
	add	ip, r2, r3, lsl #2
	str	r3, [fp, #-168]
	ldmia	r9!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r9!, {r0, r1, r2, r3}
	ldr	r9, [r9]
	stmia	lr!, {r0, r1, r2, r3}
	sub	r1, fp, #184
	str	r9, [lr]
	mov	r0, r4
	ldr	r3, [ip, #-240]
	str	r3, [fp, #-176]
	bl	Real8_CB_GetPictureHeader
	cmp	r0, #1
	str	r0, [fp, #-296]
	bne	.L393
	ldrb	r3, [r5, #3196]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L269
	ldr	r8, .L410+12
	ldr	r7, [r8]
	cmp	r7, #0
	beq	.L270
	ldr	r1, [r10, #1828]
	sub	ip, fp, #280
	sub	ip, ip, #2
	ldr	r0, [fp, #-88]
	ldr	lr, [r10, #1832]
	sub	r2, fp, #284
	strh	r1, [ip]	@ movhi
	sub	ip, fp, #280
	mov	r3, #8
	mov	r1, #2
	strh	r0, [ip]	@ movhi
	sub	r0, fp, #276
	ldrh	ip, [fp, #-92]
	sub	r0, r0, #2
	strh	lr, [r2]	@ movhi
	strh	ip, [r0]	@ movhi
	ldr	r0, [r10, #3496]
	blx	r7
.L270:
	ldr	r0, [r10, #3496]
	bl	FSP_GetFspType
	subs	lr, r0, #0
	bne	.L271
	sub	r3, fp, #284
	sub	r2, fp, #288
	sub	r1, fp, #292
	ldr	r0, [r10, #3496]
	str	lr, [fp, #-292]
	str	lr, [fp, #-288]
	str	lr, [fp, #-284]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r6]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	beq	.L394
.L271:
	mov	r2, #1
	ldr	r1, [r10, #3096]
	ldr	r0, [r10, #3496]
	mov	r8, #0
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r10, #3092]
	add	r7, r6, #56320
	ldr	r0, [r10, #3496]
	add	r7, r7, #72
	bl	FSP_ClearLogicFs
	ldr	r0, [r10, #3496]
	str	r8, [r10, #3092]
	str	r8, [r10, #3096]
	bl	FSP_GetNullLogicFs
	mov	r1, r7
	str	r0, [r10, #3096]
	str	r0, [r10, #3092]
	strb	r8, [r5, #3199]
	ldr	r0, [r10, #3496]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-92]
	cmp	r2, #512
	bhi	.L278
	cmp	r3, #512
	bhi	.L278
	ldr	r3, [r6]
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L280
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L395
.L280:
	ldr	r0, [r10, #3496]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L380
.L282:
	ldr	r3, [fp, #-92]
	mov	r0, #1
	ldr	r2, [fp, #-88]
	ldr	r1, .L410+16
	bl	dprint_vfmw
	sub	r2, fp, #184
	mov	r1, r6
	mov	r0, #6
	bl	Real8_ArrangeVHBMem
	subs	r3, r0, #0
	beq	.L396
.L269:
	add	r3, r6, #54784
	sub	r1, fp, #184
	mov	r2, r3
	ldr	r3, .L410
	add	r2, r2, #200
	str	r2, [fp, #-316]
	ldr	r3, [r3, #52]
	mov	r0, r2
	mov	r2, #140
	blx	r3
	ldr	r3, [r6]
	mov	r0, r6
	ldr	r3, [r3, #8]
	strb	r3, [r5, #3194]
	bl	Real8_GetImageBuffer
	subs	r3, r0, #0
	beq	.L397
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L285
	ldr	r0, [r6]
	add	r7, ip, #640
	add	lr, ip, #656
	mvn	r9, #0
	ldr	r1, .L410+20
	ldrd	r2, [r0, #56]
	mov	r8, lr
	str	r8, [fp, #-312]
	mov	r0, #29
	strd	r2, [r7]
	ldr	lr, [r6]
	ldrd	r2, [lr, #72]
	strd	r2, [r8, #-8]
	ldr	lr, [r6]
	ldrd	r2, [lr, #88]
	strd	r2, [r8]
	mvn	r8, #0
	ldr	lr, [r6]
	ldr	lr, [lr, #104]
	str	lr, [ip, #8]
	ldr	lr, [r6]
	ldr	lr, [lr, #108]
	str	lr, [ip, #12]
	ldr	lr, [r6]
	ldr	lr, [lr, #112]
	str	lr, [ip, #16]
	ldr	lr, [r6]
	ldr	lr, [lr, #128]
	str	lr, [ip, #20]
	ldr	lr, [fp, #-312]
	ldr	r3, [r6]
	strd	r8, [r3, #56]
	ldrd	r2, [lr, #-8]
	mov	r8, r2
	mov	r9, r3
	ldrd	r2, [r7]
	strd	r8, [sp]
	bl	dprint_vfmw
	ldr	r3, [r10, #1816]
	cmp	r3, #2
	beq	.L398
	cmp	r3, #1
	ldrb	r3, [r5, #3199]	@ zero_extendqisi2
	beq	.L399
	cmp	r3, #0
	movne	r3, #2
	moveq	r3, #1
.L289:
	strb	r3, [r5, #3199]
	ldr	r2, [r10, #3092]
	ldr	r3, [r10, #3096]
	cmp	r2, r3
	beq	.L290
	ldr	r1, .L410+24
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r10, #3092]
	ldr	r0, [r10, #3496]
	bl	FSP_SetRef
.L290:
	ldr	r3, [r10, #3096]
	mov	r2, #1
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r3, [r10, #3092]
	str	r1, [r10, #3096]
	bl	FSP_SetRef
	ldr	r1, [r10, #3092]
	ldr	r0, [r10, #3496]
	bl	FSP_RemovePmv
	ldr	r2, [r10, #3100]
	ldr	r1, .L410+28
	mov	r0, #13
	bl	dprint_vfmw
	ldrb	r3, [r5, #3194]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L292
	ldr	r3, [r10, #1816]
	cmp	r3, #0
	bne	.L400
.L381:
	str	r3, [r10, #3108]
.L292:
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	bl	FSP_GetLogicFs
	ldr	r1, [r10, #3092]
	mov	r7, r0
	ldr	r0, [r10, #3496]
	bl	FSP_GetLogicFs
	ldr	r1, [r10, #3096]
	mov	r8, r0
	ldr	r0, [r10, #3496]
	bl	FSP_GetLogicFs
	cmp	r7, #0
	cmpne	r8, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	str	r0, [fp, #-312]
	cmp	r3, #0
	bne	.L401
	ldr	r3, [r7, #680]
	cmp	r3, #0
	beq	.L299
	ldr	r2, [r7, #688]
	cmp	r2, #0
	beq	.L299
	ldr	r2, [r7, #684]
	cmp	r2, #0
	beq	.L299
	ldr	r2, [fp, #-312]
	mov	r0, #13
	ldr	r1, .L410+32
	ldr	r2, [r2, #680]
	cmp	r2, #0
	ldrne	lr, [r2, #16]
	ldreq	lr, [r3, #16]
	str	lr, [r6, #56]
	ldr	r3, [r8, #680]
	cmp	r3, #0
	ldreq	r3, [r7, #680]
	ldr	ip, [r3, #16]
	str	ip, [r6, #60]
	ldr	r3, [r7, #680]
	ldr	r2, [r3, #16]
	str	r2, [r6, #64]
	ldr	r3, [r7, #692]
	str	r3, [r6, #80]
	mov	r9, r3
	ldr	r3, [fp, #-312]
	ldr	r3, [r3, #692]
	str	r3, [r6, #84]
	str	r3, [fp, #-320]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #16]
	str	r9, [sp, #8]
	ldr	r9, [fp, #-320]
	str	r9, [sp, #12]
	str	r3, [r6, #68]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #32]
	str	r3, [r6, #72]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #76]
	str	r3, [r6, #96]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #60]
	str	r3, [r6, #100]
	ldr	r3, [r7, #684]
	ldr	r3, [r3, #64]
	str	r3, [r6, #104]
	ldr	r3, [r10, #1816]
	cmp	r3, #2
	beq	.L402
.L305:
	ldr	r3, [r10, #1844]
	mov	r0, r4
	str	r3, [r7, #700]
	ldr	r3, [r10, #1816]
	ldr	r2, [r10, #1856]
	cmp	r3, #2
	strb	r3, [r6, #20]
	ldr	r3, [r10, #1832]
	str	r2, [fp, #-312]
	str	r3, [r6, #12]
	ldr	r3, [r10, #1828]
	str	r3, [r6, #16]
	ldr	r3, [r10, #3016]
	str	r3, [r6, #24]
	ldr	r3, [r10, #3020]
	str	r2, [r6, #32]
	str	r3, [r6, #28]
	ldr	r3, [r10, #1920]
	str	r3, [r6, #36]
	ldr	r3, [r10, #1924]
	str	r3, [r6, #40]
	strne	r2, [r10, #1920]
	bl	BsPos
	ldr	r3, [r10, #1928]
	ands	r0, r0, #-2147483641
	submi	r0, r0, #1
	mvnmi	r0, r0, asl #29
	mvnmi	r0, r0, lsr #29
	addmi	r0, r0, #1
	cmp	r3, #1
	str	r0, [r10, #1896]
	ldreq	r3, [r10, #2964]
	moveq	r0, r4
	ldreq	r2, [fp, #-304]
	movne	r0, r4
	ldrne	r3, [r10, #1936]
	ldreq	r7, [r10, #1932]
	rsbeq	r3, r2, r3
	ldrne	r7, [r10, #1932]
	rsb	r7, r7, r3
	bl	BsPos
	ldr	r3, [fp, #-308]
	mov	r7, r7, asl #3
	rsb	r0, r0, r7
	ldr	r7, [r10, #2960]
	str	r0, [r10, #1900]
	mov	r0, r4
	add	r7, r3, r7
	bl	BsPos
	ldr	r2, [r10, #1860]
	mov	r1, #1
	ldr	lr, [r10, #1852]
	ldr	ip, [fp, #-312]
	str	r2, [r10, #1880]
	str	lr, [r10, #1884]
	str	ip, [r10, #1876]
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	mov	r3, #0
	add	r0, r7, r0, asr #3
	str	r3, [r10, #1908]
	str	r0, [r10, #1904]
	str	r3, [r10, #1912]
	str	r3, [r10, #1916]
	str	r3, [r10, #1888]
	str	r0, [r6, #108]
	ldr	r0, [r10, #1896]
	str	r0, [r6, #116]
	ldr	r0, [r10, #1900]
	str	lr, [r6, #132]
	str	r3, [r6, #112]
	str	r0, [r6, #124]
	str	r3, [r6, #120]
	str	r3, [r6, #128]
	str	r2, [r6, #136]
	str	r3, [r6, #144]
	str	ip, [r6, #140]
	str	r1, [r6, #44]
	ldr	r2, [r10, #1928]
	cmp	r2, r1
	bls	.L333
	ldr	r8, [r10, #1936]
	movw	r0, #65535
	ldr	r2, [fp, #-304]
	movt	r0, 47
	add	r8, r2, r8
	cmp	r8, r0
	bgt	.L319
	cmp	r8, #73
	ble	.L319
	ldr	r2, [r10, #2964]
	rsb	r2, r8, r2
	cmp	r2, #0
	ble	.L319
	add	r7, r6, #55040
	mov	r9, r5
	add	r7, r7, #144
	str	r3, [fp, #-328]
	str	r0, [fp, #-320]
	mov	r5, r1
	str	r1, [fp, #-308]
	b	.L322
.L323:
	ldr	r3, [r10, #1928]
	add	r5, r5, #1
	cmp	r3, r5
	bls	.L333
	ldr	r3, [fp, #-304]
	ldr	r8, [r7, #4]!
	add	r8, r3, r8
	ldr	r3, [fp, #-320]
	cmp	r8, r3
	bgt	.L319
	cmp	r8, #73
	ble	.L319
	ldr	r2, [r10, #2964]
	rsb	r2, r8, r2
	cmp	r2, #0
	ble	.L319
.L322:
	ldr	r1, [r9, #3184]
	mov	r0, r4
	add	r1, r1, r8
	bl	BsInit
	ldr	r3, [fp, #-316]
	sub	r2, fp, #292
	mov	r1, #0
	mov	r0, r4
	str	r3, [sp, #4]
	sub	r3, fp, #284
	str	r3, [sp]
	sub	r3, fp, #288
	bl	Real8_CB_GetSliceHeader
	cmp	r0, #1
	bne	.L323
	ldr	r3, [r10, #1832]
	ldr	r2, [fp, #-292]
	cmp	r3, #0
	str	r2, [fp, #-324]
	beq	.L403
	ldr	r3, [fp, #-284]
	mov	r0, r4
	ldr	r2, [fp, #-312]
	cmp	r3, #0
	movge	r2, r3
	str	r2, [fp, #-312]
	bl	BsPos
	ldr	r3, [r10, #1928]
	sub	lr, r3, #1
	cmp	lr, r5
	mov	r2, r0, asr #31
	mov	r1, r2, lsr #29
	add	r2, r0, r1
	and	r2, r2, #7
	rsb	r2, r1, r2
	str	r2, [r10, #1896]
	beq	.L404
	cmp	r5, #254
	bhi	.L405
	ldr	r3, [r7, #4]
	mov	r0, r4
	ldr	r2, [r7]
	rsb	r3, r2, r3
.L384:
	mov	r3, r3, asl #3
	str	r3, [fp, #-332]
	bl	BsPos
	ldr	r3, [fp, #-332]
	ldr	r2, [r10, #2960]
	add	r8, r8, r2
	rsb	r0, r0, r3
	str	r0, [r10, #1900]
	mov	r0, r4
	bl	BsPos
	mov	r3, #44
	ldr	ip, [fp, #-328]
	ldr	r1, [r10, #1860]
	ldr	lr, [r10, #1852]
	str	ip, [r10, #1908]
	str	r1, [r10, #1880]
	str	ip, [r10, #1912]
	str	lr, [r10, #1884]
	add	r2, r0, #7
	cmp	r0, #0
	movlt	r0, r2
	ldr	r2, [fp, #-308]
	mla	r3, r3, r2, r6
	add	r2, r8, r0, asr #3
	ldr	r0, [fp, #-308]
	str	r2, [r10, #1904]
	add	r0, r0, #1
	str	r0, [fp, #-308]
	add	r1, r3, #136
	mov	r8, r0
	mov	r0, ip
	str	r0, [r10, #1916]
	cmp	r8, #131
	ldr	r0, [fp, #-312]
	mov	ip, r8
	mov	r8, #0
	str	r0, [r10, #1876]
	ldr	r0, [fp, #-324]
	str	r0, [r10, #1888]
	add	r0, r3, #128
	str	r2, [r3, #108]
	ldr	r2, [r10, #1896]
	str	r2, [r3, #116]
	ldr	r2, [r10, #1900]
	str	r2, [r3, #124]
	ldr	r2, [r10, #1916]
	str	r2, [r3, #112]
	ldr	r2, [r10, #1908]
	str	r2, [r3, #120]
	ldr	r2, [r10, #1912]
	str	r2, [r3, #128]
	ldr	r3, [r10, #1884]
	str	r3, [r0, #4]
	ldr	r3, [r10, #1880]
	str	r3, [r0, #8]
	ldr	r3, [r10, #1876]
	str	r3, [r1, #4]
	ldr	r3, [r10, #1888]
	str	r3, [r1, #8]
	str	ip, [r6, #44]
	ble	.L323
	mov	r0, r6
	bl	Real8_ModifySliceMsg
	cmp	r0, #1
	bne	.L406
	ldr	r3, [fp, #-300]
	cmp	r3, #0
	str	r3, [r6, #4]
	beq	.L407
	ldr	r3, [r6]
	ldr	r2, [r3, #864]
	cmp	r2, #1
	beq	.L408
	cmp	r2, #2
	bne	.L323
	ldr	r3, [r3, #868]
	cmp	r3, #0
	ble	.L323
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L323
	str	r8, [r6, #4]
	mov	r2, r8
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r8, [fp, #-296]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	mov	r1, r6
	mov	r0, #8
	ldr	r3, [r2, #868]
	sub	r3, r3, #1
	str	r3, [r2, #868]
	bl	ReleasePacket
	b	.L374
.L393:
	ldr	r1, .L410+36
	mov	r0, #1
	str	r7, [fp, #-296]
	bl	dprint_vfmw
	b	.L374
.L278:
	ldr	r1, .L410+40
	mov	r0, #18
	bl	dprint_vfmw
	b	.L385
.L397:
	ldr	r2, [r10, #2992]
	ldr	r1, .L410+44
	str	r3, [fp, #-296]
	bl	dprint_vfmw
	b	.L374
.L400:
	cmp	r3, #2
	beq	.L335
	cmp	r3, #1
	beq	.L381
	b	.L292
.L398:
	ldrb	r3, [r5, #3199]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L319
	ldrb	r3, [r5, #3194]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L292
.L335:
	ldr	r3, [r10, #3108]
	cmp	r3, #0
	bne	.L292
	mov	r2, #1
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r3, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L396:
	ldr	r1, .L410+48
	mov	r0, #1
	str	r3, [fp, #-296]
	bl	dprint_vfmw
	b	.L374
.L399:
	cmp	r3, #0
	movne	r3, #2
	bne	.L289
.L319:
	mov	r2, #1
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	mov	r3, #0
	str	r3, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L395:
	ldrb	r3, [r5, #3196]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L282
.L380:
	mov	r0, r7
	bl	ResetVoQueue
	b	.L282
.L299:
	ldr	r1, [r10, #3100]
	mov	r2, #1
	ldr	r0, [r10, #3496]
	mov	r3, #0
	str	r3, [fp, #-296]
	bl	FSP_ClearLogicFs
	ldr	r1, .L410+52
	mov	r0, #0
	bl	dprint_vfmw
	b	.L374
.L401:
	movw	r3, #2060
	ldr	r2, .L410+56
	ldr	r1, .L410+60
	mov	r0, #22
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [fp, #-296]
	b	.L374
.L402:
	ldr	r1, [fp, #-312]
	ldr	r3, [r8, #700]
	ldr	r2, [r10, #1844]
	ldr	r8, [r1, #700]
	subs	r2, r2, r3
	rsb	r8, r3, r8
	ldrmi	r3, [r10, #1840]
	addmi	r2, r2, r3
	cmp	r8, #0
	ldrlt	r3, [r10, #1840]
	addlt	r8, r8, r3
	cmp	r2, r8
	movgt	r2, #0
	cmp	r8, #0
	ble	.L338
	mov	r1, r8
	mov	r0, r2, asl #14
	str	r2, [fp, #-312]
	bl	__aeabi_idiv
	ldr	r2, [fp, #-312]
	mov	r1, r8
	str	r0, [fp, #-320]
	rsb	r0, r2, r8
	mov	r0, r0, asl #14
	bl	__aeabi_idiv
	ldr	r2, [fp, #-312]
	ldr	r3, [fp, #-320]
.L309:
	str	r2, [r10, #3008]
	str	r8, [r10, #3012]
	str	r3, [r10, #3016]
	str	r0, [r10, #3020]
	b	.L305
.L394:
	ldr	r3, [fp, #-284]
	cmp	r3, #0
	bgt	.L274
	ldr	r3, [fp, #-288]
	cmp	r3, #32
	bgt	.L274
	ldr	r3, [r6, #4]
	cmp	r3, #0
	bne	.L274
	ldr	r3, [r10, #2988]
	cmp	r3, #0
	beq	.L271
	ldr	r7, [r10, #1832]
	cmp	r7, #0
	beq	.L271
	ldr	r0, [fp, #-92]
	ldr	r1, [r10, #3500]
	cmp	r0, r1
	beq	.L271
	ldr	r1, [fp, #-88]
	ldr	lr, [r10, #3504]
	cmp	r1, lr
	beq	.L271
	ldr	lr, [r10, #1828]
	str	r0, [sp, #12]
	mov	r0, r2
	str	r1, [sp, #8]
	stmia	sp, {r7, lr}
	ldr	r1, .L410+64
	bl	dprint_vfmw
	ldr	r7, [r8]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-88]
	cmp	r7, #0
	str	r2, [r10, #3500]
	str	r3, [r10, #3504]
	beq	.L271
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r10, #3496]
	blx	r7
	b	.L271
.L404:
	add	r3, r3, #10944
	ldr	r2, [r10, #2964]
	add	r3, r3, #5
	ldr	r1, [fp, #-304]
	mov	r0, r4
	add	r3, r9, r3, lsl #2
	rsb	r2, r1, r2
	ldr	r3, [r3, #3188]
	rsb	r3, r3, r2
	b	.L384
.L338:
	mov	r0, #0
	mov	r3, r0
	b	.L309
.L285:
	mov	r2, #1
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	ip, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L333:
	ldr	r4, [r6, #4]
	mov	r5, #1
	str	r5, [r6, #48]
	cmp	r4, #0
	beq	.L409
.L316:
	ldr	r3, [r6]
	ldr	r2, [r3, #592]
	str	r2, [r6, #88]
	ldr	r3, [r3, #632]
	str	r3, [r6, #92]
	b	.L374
.L408:
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L323
	str	r8, [r6, #4]
	mov	r2, r8
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r8, [fp, #-296]
	bl	FSP_SetDisplay
	mov	r1, r6
	mov	r0, #8
	bl	ReleasePacket
	b	.L374
.L407:
	ldr	ip, [fp, #-300]
	movw	r3, #2260
	ldr	r2, .L410+56
	mov	r0, #22
	ldr	r1, .L410+68
	str	ip, [fp, #-296]
	bl	dprint_vfmw
	b	.L374
.L409:
	mov	r0, r6
	bl	Real8_ModifySliceMsg
	cmp	r0, #1
	ldreq	r3, [fp, #-300]
	streq	r3, [r6, #4]
	beq	.L316
	mov	r2, r5
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r4, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L406:
	mov	r2, #1
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r8, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L405:
	movw	r2, #2227
	ldr	r1, .L410+72
	mov	r0, #22
	mov	r3, #0
	str	r3, [fp, #-296]
	bl	dprint_vfmw
	b	.L374
.L403:
	mov	r2, r0
	ldr	r1, [r10, #3100]
	ldr	r0, [r10, #3496]
	str	r3, [fp, #-296]
	bl	FSP_ClearLogicFs
	b	.L374
.L274:
	mvn	r3, #1
	str	r3, [fp, #-296]
	b	.L374
.L411:
	.align	2
.L410:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC13
	.word	.LANCHOR0+460
	.word	g_event_report
	.word	.LC17
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC25
	.word	.LC14
	.word	.LC16
	.word	.LC19
	.word	.LC18
	.word	.LC24
	.word	.LANCHOR0+528
	.word	.LC23
	.word	.LC15
	.word	.LC27
	.word	.LC26
	UNWIND(.fnend)
	.size	REAL8DEC_Decode, .-REAL8DEC_Decode
	.align	2
	.global	REAL8DEC_RecycleImage
	.type	REAL8DEC_RecycleImage, %function
REAL8DEC_RecycleImage:
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
	add	r4, r0, #53248
	mov	r2, #0
	ldr	r0, [r4, #3496]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #3496]
	bl	FSP_GetFsImagePtr
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL8DEC_RecycleImage, .-REAL8DEC_RecycleImage
	.align	2
	.global	REAL8DEC_GetRemainImg
	.type	REAL8DEC_GetRemainImg, %function
REAL8DEC_GetRemainImg:
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
	ldr	r3, [r0]
	mov	r4, r0
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L430
	add	r6, r0, #53248
	ldr	r1, [r6, #3096]
	ldr	r0, [r6, #3496]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L430
	ldr	r1, [r6, #3096]
	ldr	r0, [r6, #3496]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L429
.L430:
	add	r5, r4, #56320
	add	r5, r5, #72
.L420:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	GetVoLastImageID
.L429:
	mov	r0, r4
	add	r5, r4, #56320
	bl	Real8_SetImgFormat
	add	r5, r5, #72
	mov	r3, #1
	str	r3, [r7, #212]
	mov	r2, r3
	ldr	r1, [r6, #3096]
	ldr	r0, [r6, #3496]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #3496]
	mov	r2, r4
	str	r7, [sp]
	mov	r3, r5
	mov	r1, #8
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L417
	mov	r2, #0
	ldr	r1, [r6, #3096]
	ldr	r0, [r6, #3496]
	bl	FSP_SetDisplay
	b	.L420
.L417:
	ldr	r3, [r7, #184]
	cmp	r3, #100
	bhi	.L420
	ldr	r3, [r7, #128]
	cmp	r3, #31
	bls	.L420
	ldr	r3, [r7, #132]
	cmp	r3, #31
	bls	.L420
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL8DEC_GetRemainImg, .-REAL8DEC_GetRemainImg
	.align	2
	.global	REAL8DEC_VDMPostProc
	.type	REAL8DEC_VDMPostProc, %function
REAL8DEC_VDMPostProc:
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
	mov	r6, r1
	mov	r5, r0
	ldr	r1, .L460
	add	r4, r5, #53248
	mov	r8, r2
	mov	r0, #22
	mov	r2, r6
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, #8
	add	r7, r5, #8192
	bl	ReleasePacket
	ldr	r1, [r4, #3100]
	ldr	r0, [r4, #3496]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L432
	ldr	r3, [r4, #1816]
	cmp	r3, #2
	andne	r8, r8, #31
	strb	r3, [r7, #3197]
	strne	r8, [r4, #1924]
	cmp	r6, #0
	movlt	r6, #0
	blt	.L434
	cmp	r6, #100
	movge	r6, #100
.L434:
	str	r6, [r0, #184]
	mov	r0, #22
	ldr	r1, .L460+4
	bl	dprint_vfmw
	mov	r0, r5
	bl	Real8_SetImgFormat
	ldrb	r3, [r7, #3194]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L437
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L437
	ldr	r3, [r4, #1816]
	cmp	r3, #2
	beq	.L437
	ldrb	r3, [r7, #3199]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhi	r1, [r4, #3092]
	mvnls	r1, #0
	cmn	r1, #1
	str	r1, [r4, #3104]
	beq	.L439
.L459:
	ldr	r0, [r4, #3496]
	bl	FSP_GetFsImagePtr
	ldr	r6, [r4, #3104]
	mov	r1, r6
	mov	r7, r0
	ldr	r0, [r4, #3496]
	bl	FSP_GetRef
	mov	r2, r6
	ldr	r1, .L460+8
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r4, #3104]
	ldr	r0, [r4, #3496]
	bl	FSP_SetDisplay
	add	r3, r5, #56320
	ldr	r0, [r4, #3496]
	add	r3, r3, #72
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #8
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L458
.L439:
	ldr	r3, [r4, #2992]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r4, #2992]
.L432:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L437:
	ldr	r1, [r4, #3100]
	cmn	r1, #1
	str	r1, [r4, #3104]
	bne	.L459
	b	.L439
.L458:
	ldr	r0, [r4, #3496]
	mov	r2, #0
	ldr	r1, [r4, #3104]
	bl	FSP_SetDisplay
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L461:
	.align	2
.L460:
	.word	.LC28
	.word	.LC29
	.word	.LC30
	UNWIND(.fnend)
	.size	REAL8DEC_VDMPostProc, .-REAL8DEC_VDMPostProc
	.align	2
	.global	REAL8DEC_GetImageBuffer
	.type	REAL8DEC_GetImageBuffer, %function
REAL8DEC_GetImageBuffer:
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
	ldr	r0, [r4, #3496]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #3496]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L468
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L468:
	add	r1, r5, #56320
	ldr	r0, [r4, #3496]
	add	r1, r1, #72
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL8DEC_GetImageBuffer, .-REAL8DEC_GetImageBuffer
	.align	2
	.global	REAL8DEC_Support
	.type	REAL8DEC_Support, %function
REAL8DEC_Support:
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
	mov	r3, #1
	str	r3, [r0]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL8DEC_Support, .-REAL8DEC_Support
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	gs_VLCDecodeTable, %object
	.size	gs_VLCDecodeTable, 256
gs_VLCDecodeTable:
	.byte	-128
	.byte	-127
	.byte	112
	.byte	112
	.byte	-126
	.byte	-125
	.byte	113
	.byte	113
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	80
	.byte	-124
	.byte	-123
	.byte	114
	.byte	114
	.byte	-122
	.byte	-121
	.byte	115
	.byte	115
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	81
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	-120
	.byte	-119
	.byte	116
	.byte	116
	.byte	-118
	.byte	-117
	.byte	117
	.byte	117
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	82
	.byte	-116
	.byte	-115
	.byte	118
	.byte	118
	.byte	-114
	.byte	-113
	.byte	119
	.byte	119
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
	.byte	49
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
	.type	MBA_FieldWidth, %object
	.size	MBA_FieldWidth, 24
MBA_FieldWidth:
	.word	6
	.word	7
	.word	9
	.word	11
	.word	13
	.word	14
.LC0:
	.word	160
	.word	176
	.word	240
	.word	320
	.word	352
	.word	640
	.word	704
	.word	0
.LC1:
	.word	120
	.word	132
	.word	144
	.word	240
	.word	288
	.word	480
	.word	0
	.word	0
.LC2:
	.word	180
	.word	360
	.word	576
	.word	0
	.type	GetBitsMask, %object
	.size	GetBitsMask, 100
GetBitsMask:
	.word	0
	.word	1
	.word	3
	.word	7
	.word	15
	.word	31
	.word	63
	.word	127
	.word	255
	.word	511
	.word	1023
	.word	2047
	.word	4095
	.word	8191
	.word	16383
	.word	32767
	.word	65535
	.word	131071
	.word	262143
	.word	524287
	.word	1048575
	.word	2097151
	.word	4194303
	.word	8388607
	.word	16777215
.LC3:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
	.word	3
	.type	s_RVVersionEncodingToMinorVersion, %object
	.size	s_RVVersionEncodingToMinorVersion, 32
s_RVVersionEncodingToMinorVersion:
	.word	2
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.word	9999
	.type	__FUNCTION__.14726, %object
	.size	__FUNCTION__.14726, 16
__FUNCTION__.14726:
	.ascii	"REAL8DEC_Decode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"image size abnormal (%dx%d) in MB\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"real8 actual frame size(%dx%d) exeed max config(%dx" )
	ASCII(.ascii	"%d)\012\000" )
.LC10:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC12:
	ASCII(.ascii	"Decoding quits at frm %d\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
.LC14:
	ASCII(.ascii	"Real8_CB_GetPictureHeader Error!\012\000" )
	.space	2
.LC15:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"pic width/height to large,MbWidth = %d, MbHeight = " )
	ASCII(.ascii	"%d\000" )
	.space	2
.LC17:
	ASCII(.ascii	"new seq size %d * %d\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"Real8_ArrangeVHBMem err\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"Fatal Error: frm%d, get image buffer failed\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"++++++++++ ref %d\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"%s %d unknow error!!\012\000" )
	.space	2
.LC24:
	ASCII(.ascii	"CurFsID abnormal!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"dec addr: cur,cur2d,fwd,bwd,currpmv,colpmv = %p,%p," )
	ASCII(.ascii	"%p,%p,%p,%p\012\000" )
.LC26:
	ASCII(.ascii	"line:%d! i > (RV8_MAX_SLC_PARAM_NUM - 2)\012\000" )
	.space	2
.LC27:
	ASCII(.ascii	"%s %d NULL == pCtx->pRv8DecParam!!\012\000" )
.LC28:
	ASCII(.ascii	"ErrRatio = %d\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"DEBUG: DEC over\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
