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
	.file	"real9.c"
	.text
	.align	2
	.global	Real9_CB_GetBits
	.type	Real9_CB_GetBits, %function
Real9_CB_GetBits:
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
	.size	Real9_CB_GetBits, .-Real9_CB_GetBits
	.align	2
	.global	Real9_CB_Get1Bit
	.type	Real9_CB_Get1Bit, %function
Real9_CB_Get1Bit:
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
	.size	Real9_CB_Get1Bit, .-Real9_CB_Get1Bit
	.align	2
	.global	Real9_CB_GetVLCBits
	.type	Real9_CB_GetVLCBits, %function
Real9_CB_GetVLCBits:
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
	.size	Real9_CB_GetVLCBits, .-Real9_CB_GetVLCBits
	.align	2
	.global	Real9_GetImageBuffer
	.type	Real9_GetImageBuffer, %function
Real9_GetImageBuffer:
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
	ldr	r0, [r4, #3480]
	bl	FSP_NewLogicFs
	cmp	r0, #0
	str	r0, [r4, #3080]
	blt	.L17
	mov	r1, r0
	ldr	r0, [r4, #3480]
	bl	FSP_GetLogicFs
	subs	r5, r0, #0
	beq	.L18
	ldr	r2, [r4, #3080]
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
	ldr	r1, [r4, #3076]
	ldr	r0, [r4, #3480]
	mov	r2, #1
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r4, #3072]
	mov	r5, #0
	ldr	r0, [r4, #3480]
	bl	FSP_ClearLogicFs
	str	r5, [r4, #3072]
	str	r5, [r4, #3076]
	ldr	r0, [r4, #3480]
	bl	FSP_GetNullLogicFs
	add	r1, r6, #56320
	add	r1, r1, #56
	str	r0, [r4, #3076]
	str	r0, [r4, #3072]
	strb	r5, [r7, #3189]
	ldr	r0, [r4, #3480]
	bl	FSP_ClearNotInVoQueue
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L18:
	mov	r2, #512
	ldr	r1, .L19+12
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	b	.L12
.L20:
	.align	2
.L19:
	.word	.LC5
	.word	.LC6
	.word	.LC3
	.word	.LC4
	UNWIND(.fnend)
	.size	Real9_GetImageBuffer, .-Real9_GetImageBuffer
	.align	2
	.global	Real9_ArrangeVHBMem
	.type	Real9_ArrangeVHBMem, %function
Real9_ArrangeVHBMem:
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
	ldr	r2, [r2, #24]
	mov	r5, r1
	ldr	r3, [r4, #20]
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
	ldr	r9, [r4, #16]
	mov	r7, #5
	ldr	r10, [r4, #12]
	mov	r6, #2
	mov	r8, #4
.L33:
	ldr	r3, .L52
	mov	r2, #32
	mov	r1, #0
	sub	r0, fp, #76
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r0, [r4, #12]
	ldr	r1, [r5]
	mov	r3, #0
	ldr	r2, [r4, #16]
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
	ldr	r0, [r6, #3480]
	strb	r4, [fp, #-74]
	bl	FSP_ConfigInstance
	cmp	r0, r4
	bne	.L49
	ldr	r1, [r5]
	sub	r3, fp, #80
	ldr	r0, [r6, #3480]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L51
	cmp	r0, #0
	addeq	r5, r5, #8192
	moveq	r3, #1
	moveq	r0, r3
	streqb	r3, [r5, #3192]
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
	ldr	r2, [r4, #16]
	ldr	r0, [r1, #668]
	ldr	r3, [r4, #12]
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
	ldr	r2, [r4, #16]
	ldr	r9, [r1, #668]
	ldr	r3, [r4, #12]
	cmp	r2, r9
	ldr	r10, [r1, #672]
	bhi	.L29
	cmp	r3, r10
	bhi	.L29
	add	r3, r5, #8192
	ldrb	r0, [r3, #3192]	@ zero_extendqisi2
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
	add	r0, r0, #56
	bl	ResetVoQueue
	b	.L41
.L53:
	.align	2
.L52:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LC7
	.word	.LC8
	UNWIND(.fnend)
	.size	Real9_ArrangeVHBMem, .-Real9_ArrangeVHBMem
	.align	2
	.global	Real9_CB_GetCPFMT
	.type	Real9_CB_GetCPFMT, %function
Real9_CB_GetCPFMT:
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
	str	r4, [r6, #16]
	bl	Real9_CB_Get1Bit
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
	str	r7, [r6, #12]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_CB_GetCPFMT, .-Real9_CB_GetCPFMT
	.align	2
	.global	Real9_CB_SetDimensions
	.type	Real9_CB_SetDimensions, %function
Real9_CB_SetDimensions:
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
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #12]
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
	str	r3, [r0, #76]
	mul	r3, r3, r2
	str	r2, [r0, #72]
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
	str	r3, [r0, #80]
	ldmfd	sp, {fp, sp, pc}
.L79:
	cmp	r2, #1152
	bne	.L60
	mov	r2, #88
	mov	r3, #72
	str	r2, [r0, #76]
	str	r3, [r0, #72]
.L74:
	mov	r2, #4
	b	.L61
.L75:
	cmp	r2, #96
	bne	.L60
	mov	r2, #8
	mov	r3, #6
	str	r2, [r0, #76]
	mov	r2, #0
	str	r3, [r0, #72]
	b	.L61
.L76:
	cmp	r2, #144
	bne	.L60
	mov	r2, #11
	mov	r3, #9
	str	r2, [r0, #76]
	str	r3, [r0, #72]
.L70:
	mov	r2, #1
	b	.L61
.L77:
	cmp	r2, #288
	bne	.L60
	mov	r2, #22
	mov	r3, #18
	str	r2, [r0, #76]
	str	r3, [r0, #72]
.L71:
	mov	r2, #2
	b	.L61
.L78:
	cmp	r2, #576
	bne	.L60
	mov	r2, #44
	mov	r3, #36
	str	r2, [r0, #76]
	str	r3, [r0, #72]
.L72:
	mov	r2, #3
	b	.L61
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real9_CB_SetDimensions, .-Real9_CB_SetDimensions
	.align	2
	.global	Real9_CB_GetPicSize
	.type	Real9_CB_GetPicSize, %function
Real9_CB_GetPicSize:
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
	ldr	ip, [r9, #20]
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
	bl	Real9_CB_Get1Bit
	cmp	r0, #0
	beq	.L83
	ldr	r3, [r9, #52]
	str	r3, [r8]
	ldr	r3, [r9, #56]
	str	r3, [r7]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L97:
	mov	r0, r4
	mov	r9, r9, asl #1
	bl	Real9_CB_Get1Bit
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
	.size	Real9_CB_GetPicSize, .-Real9_CB_GetPicSize
	.align	2
	.global	Real9_CB_FindNextSliceStartCode
	.type	Real9_CB_FindNextSliceStartCode, %function
Real9_CB_FindNextSliceStartCode:
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
	movwgt	r7, #7184
	movgt	r4, #0
	movtgt	r7, 29
	bgt	.L103
	b	.L104
.L107:
	bl	BsSkip
	cmp	r4, r6
	beq	.L104
.L103:
	mov	r1, #24
	mov	r0, r5
	bl	BsShow
	add	r4, r4, #1
	mov	r1, #8
	cmp	r0, r7
	mov	r0, r5
	bne	.L107
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L104:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_CB_FindNextSliceStartCode, .-Real9_CB_FindNextSliceStartCode
	.align	2
	.global	Real9_CB_SearchBits_IgnoreOnly0
	.type	Real9_CB_SearchBits_IgnoreOnly0, %function
Real9_CB_SearchBits_IgnoreOnly0:
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
	beq	.L109
	ands	r5, r4, r6
	bne	.L109
	ldr	r3, .L115
	add	r10, r3, r10, lsl #2
	ldr	r10, [r10, #360]
	b	.L110
.L111:
	tst	r4, r6
	bne	.L109
.L110:
	mov	r0, r8
	and	r4, r10, r4, asl #1
	bl	Real9_CB_Get1Bit
	add	r5, r5, #1
	orr	r4, r0, r4
	cmp	r7, r4
	cmpne	r9, r5
	bhi	.L111
.L109:
	rsb	r0, r7, r4
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L116:
	.align	2
.L115:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	Real9_CB_SearchBits_IgnoreOnly0, .-Real9_CB_SearchBits_IgnoreOnly0
	.align	2
	.global	Real9_CB_GetSSC
	.type	Real9_CB_GetSSC, %function
Real9_CB_GetSSC:
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
	ldr	r3, [r1, #4]
	cmp	r3, #1
	beq	.L119
	bl	Real9_CB_FindNextSliceStartCode
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L119:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_CB_GetSSC, .-Real9_CB_GetSSC
	.align	2
	.global	Real9_CB_GetSliceHeader
	.type	Real9_CB_GetSliceHeader, %function
Real9_CB_GetSliceHeader:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 8
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
	ldr	r4, [fp, #8]
	mov	r5, r1
	mov	r7, r2
	mov	r8, r3
	mov	r9, r0
	ldr	r6, [r4, #4]
	cmp	r6, #1
	beq	.L156
	cmp	r1, #0
	beq	.L157
	mov	r2, #0
	str	r2, [r7]
	ldr	r2, [fp, #4]
	mov	r0, #1
	mvn	r3, #0
	str	r3, [r2]
.L145:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L156:
	cmp	r1, #0
	bne	.L122
	ldr	r3, [r4, #88]
	cmn	r3, #1
	beq	.L158
	bl	Real9_CB_Get1Bit
	cmp	r0, #0
	bne	.L135
	mov	r1, #2
	mov	r0, r9
	bl	BsShow
	mov	r1, #2
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	ldr	r3, [r4, #84]
	cmp	r3, r6
	beq	.L125
.L135:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L157:
	bl	Real9_CB_Get1Bit
	cmp	r0, #1
	bne	.L135
	ldr	r5, [r4, #80]
	mov	r0, r9
	mov	r1, r5
	bl	BsShow
	mov	r1, r5
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	str	r6, [r7]
	ldr	r3, [r4, #80]
	cmp	r3, #11
	bls	.L140
	mov	r0, r9
	bl	Real9_CB_Get1Bit
	cmp	r0, #1
	bne	.L135
.L140:
	mov	r1, #5
	mov	r0, r9
	bl	BsShow
	mov	r1, #5
	mov	r5, r0
	mov	r0, r9
	bl	BsSkip
	ldr	r3, [fp, #4]
	cmp	r5, #31
	str	r5, [r3]
	bgt	.L135
	mov	r1, #2
	mov	r0, r9
	bl	BsShow
	mov	r1, #2
	mov	r5, r0
	mov	r0, r9
	bl	BsSkip
	str	r5, [r4, #52]
	mov	r0, r9
	bl	Real9_CB_Get1Bit
	cmp	r0, #1
	mov	r4, r0
	bne	.L135
	mov	r1, #2
	mov	r0, r9
	bl	BsShow
	mov	r1, #2
	mov	r5, r0
	mov	r0, r9
	bl	BsSkip
	str	r5, [r8]
	mov	r0, r4
	b	.L145
.L158:
	bl	Real9_CB_Get1Bit
	cmp	r0, #0
	bne	.L135
	mov	r1, #2
	mov	r0, r9
	bl	BsShow
	mov	r5, r6
	mov	r1, #2
	mov	r10, r0
	mov	r0, r9
	bl	BsSkip
	str	r10, [r4, #84]
.L125:
	mov	r1, #5
	mov	r0, r9
	bl	BsShow
	mov	r1, #5
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	uxtb	r0, r6
	cmp	r0, #31
	strb	r0, [r4, #66]
	bhi	.L135
	mov	r0, r9
	bl	Real9_CB_Get1Bit
	cmp	r0, #0
	bne	.L135
	mov	r0, r9
	bl	Real9_CB_Get1Bit
	subs	r10, r0, #0
	bne	.L135
	mov	r1, #2
	mov	r0, r9
	bl	BsShow
	mov	r1, #2
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	str	r6, [r4, #52]
	mov	r1, #1
	mov	r0, r9
	bl	BsShow
	mov	r1, #1
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	adds	r6, r6, #0
	mov	r1, #13
	mov	r0, r9
	movne	r6, #1
	cmp	r5, #0
	strb	r6, [r4, #65]
	add	r5, r4, #64
	beq	.L128
	bl	BsShow
	mov	r1, #13
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	ldr	r3, [r4, #84]
	str	r6, [r4, #92]
	cmp	r3, #1
	bls	.L130
	cmp	r3, #2
	ldreq	r2, [r4, #108]
	ldreq	r3, [r4, #112]
	streq	r2, [r4, #116]
	streq	r3, [r4, #120]
.L146:
	mov	r1, r5
	sub	r3, fp, #48
	sub	r2, fp, #52
	mov	r0, r9
	bl	Real9_CB_GetPicSize
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	movw	r1, #8144
	sub	r0, r2, #48
	cmp	r0, r1
	str	r2, [r4, #108]
	str	r2, [r4, #16]
	str	r3, [r4, #112]
	str	r3, [r4, #12]
	bhi	.L135
	sub	r3, r3, #48
	cmp	r3, r1
	bhi	.L135
	mov	r0, r4
	bl	Real9_CB_SetDimensions
.L136:
	ldr	r5, [r4, #80]
	mov	r0, r9
	mov	r1, r5
	bl	BsShow
	mov	r1, r5
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	str	r6, [r4, #88]
.L122:
	ldr	r2, [r4, #88]
	mov	r3, #0
	ldr	r1, [fp, #4]
	mov	r0, #1
	str	r2, [r7]
	ldrb	r2, [r4, #66]	@ zero_extendqisi2
	str	r2, [r1]
	str	r3, [r8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L128:
	bl	BsShow
	mov	r1, #13
	mov	r6, r0
	mov	r0, r9
	bl	BsSkip
	ldr	r3, [r4, #92]
	cmp	r3, r6
	bne	.L135
	sub	r3, fp, #48
	sub	r2, fp, #52
	mov	r1, r5
	mov	r0, r9
	bl	Real9_CB_GetPicSize
	ldr	r2, [r4, #108]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L135
	ldr	r2, [r4, #112]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	bne	.L135
	b	.L136
.L130:
	str	r10, [r4, #116]
	str	r10, [r4, #120]
	b	.L146
	UNWIND(.fnend)
	.size	Real9_CB_GetSliceHeader, .-Real9_CB_GetSliceHeader
	.align	2
	.global	Real9_CB_GetPictureHeader
	.type	Real9_CB_GetPictureHeader, %function
Real9_CB_GetPictureHeader:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, [r1, #4]
	mov	r4, r1
	mov	r5, r0
	cmp	r3, #1
	beq	.L183
	ldr	r3, .L186
	mov	r2, #128
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	mov	r1, #16
	mov	r0, r5
	bl	BsShow
	mov	r1, #16
	mov	r6, r0
	mov	r0, r5
	bl	BsSkip
	movw	r3, #21845
	cmp	r6, r3
	bne	.L179
	mov	r1, #16
	mov	r0, r5
	bl	BsShow
	mov	r1, #16
	mov	r7, r0
	mov	r0, r5
	bl	BsSkip
	cmp	r7, r6
	bne	.L179
	mov	r0, r5
	sub	r1, fp, #32
	bl	Real9_CB_GetVLCBits
	cmp	r0, #30
	bls	.L179
	ldr	r3, [fp, #-32]
	ands	r2, r3, #1
	bne	.L179
	tst	r3, #2
	mov	r0, r5
	strne	r2, [r4, #16]
	moveq	r1, #176
	moveq	r2, #144
	streq	r1, [r4, #16]
	sub	r1, fp, #32
	str	r2, [r4, #12]
	ubfx	r2, r3, #2, #5
	ubfx	r3, r3, #7, #8
	str	r2, [r4, #48]
	str	r3, [r4, #36]
	bl	Real9_CB_GetVLCBits
	cmp	r0, #1
	streq	r0, [r4, #8]
	beq	.L173
	cmp	r0, #3
	beq	.L184
	cmp	r0, #5
	bne	.L179
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L179
	mov	r3, #2
	str	r3, [r4, #8]
.L173:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L185
.L175:
	sub	r3, r3, #48
	movw	r2, #8144
	cmp	r3, r2
	bhi	.L179
	ldr	r3, [r4, #12]
	sub	r3, r3, #48
	cmp	r3, r2
	bhi	.L179
	mov	r0, r4
	mov	r6, #1
	bl	Real9_CB_SetDimensions
	mov	r1, #2
	mov	r0, r5
	bl	BsShow
	mov	r1, #2
	mov	r7, r0
	mov	r0, r5
	bl	BsSkip
	str	r7, [r4, #52]
.L161:
	ldr	r3, [r4, #16]
	mov	r0, r6
	ldr	r2, [r4, #12]
	add	r3, r3, #15
	add	r2, r2, #15
	mov	r3, r3, lsr #4
	str	r3, [r4, #24]
	mov	r2, r2, lsr #4
	str	r2, [r4, #20]
	mul	r3, r3, r2
	str	r3, [r4, #28]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L184:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r4, #8]
	beq	.L173
.L179:
	mvn	r0, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L183:
	str	r1, [sp, #4]
	mvn	r2, #0
	sub	r3, fp, #32
	str	r2, [r1, #88]
	str	r3, [sp]
	sub	r2, fp, #36
	sub	r3, fp, #40
	mov	r1, #0
	bl	Real9_CB_GetSliceHeader
	cmp	r0, #1
	mvnne	r6, #1
	bne	.L161
	ldr	r3, [r4, #84]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L177
.L164:
	.word	.L163
	.word	.L165
	.word	.L166
	.word	.L167
.L185:
	mov	r1, r4
	mov	r0, r5
	bl	Real9_CB_GetCPFMT
	cmp	r0, #0
	beq	.L179
	ldr	r3, [r4, #16]
	b	.L175
.L167:
	mov	r6, #1
	mov	r3, #2
	str	r3, [r4, #8]
.L162:
	ldr	r3, [r4, #16]
	movw	r2, #8144
	ldrb	lr, [r4, #65]	@ zero_extendqisi2
	sub	r3, r3, #48
	ldrb	ip, [r4, #66]	@ zero_extendqisi2
	ldr	r0, [r4, #92]
	cmp	r3, r2
	ldr	r1, [r4, #96]
	ldr	r3, [r4, #100]
	str	lr, [r4, #44]
	str	ip, [r4, #48]
	str	r0, [r4, #36]
	str	r1, [r4, #56]
	str	r3, [r4, #60]
	bhi	.L179
	ldr	r3, [r4, #12]
	sub	r3, r3, #48
	cmp	r3, r2
	bhi	.L179
	mov	r0, r4
	bl	Real9_CB_SetDimensions
	b	.L161
.L166:
	mov	r0, #1
	str	r0, [r4, #8]
	mov	r6, r0
	b	.L162
.L165:
	mov	r3, #0
	mov	r6, #1
	str	r3, [r4, #8]
	str	r3, [r4, #68]
	b	.L162
.L163:
	mov	r0, #1
	mov	r3, #0
	str	r0, [r4, #68]
	mov	r6, r0
	str	r3, [r4, #8]
	b	.L162
.L177:
	mvn	r6, #1
	b	.L162
.L187:
	.align	2
.L186:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	Real9_CB_GetPictureHeader, .-Real9_CB_GetPictureHeader
	.align	2
	.global	Real9_SetImgFormat
	.type	Real9_SetImgFormat, %function
Real9_SetImgFormat:
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
	ldr	r1, [r5, #3080]
	ldr	r0, [r5, #3480]
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r7, [r5, #1736]
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
	ldr	r3, [r5, #1744]
	str	r3, [r4, #128]
	ldr	r3, [r5, #1740]
	str	r3, [r4, #132]
	bl	SetAspectRatio
	ldr	r3, [r6]
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L194
.L190:
	mov	r2, #9
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
.L194:
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
	b	.L190
	UNWIND(.fnend)
	.size	Real9_SetImgFormat, .-Real9_SetImgFormat
	.align	2
	.global	RV9_RecordVFMWState
	.type	RV9_RecordVFMWState, %function
RV9_RecordVFMWState:
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
	.size	RV9_RecordVFMWState, .-RV9_RecordVFMWState
	.align	2
	.global	Real9_WriteSliceMsg
	.type	Real9_WriteSliceMsg, %function
Real9_WriteSliceMsg:
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
	mov	r3, #44
	add	r2, r0, #53248
	mla	r3, r3, r1, r0
	ldr	ip, [r2, #1884]
	add	r1, r1, #1
	str	ip, [r3, #104]
	ldr	ip, [r2, #1876]
	str	ip, [r3, #112]
	ldr	ip, [r2, #1880]
	str	ip, [r3, #120]
	ldr	ip, [r2, #1896]
	str	ip, [r3, #108]
	ldr	ip, [r2, #1888]
	str	ip, [r3, #116]
	ldr	ip, [r2, #1892]
	str	ip, [r3, #124]
	ldr	ip, [r2, #1864]
	str	ip, [r3, #128]
	ldr	ip, [r2, #1860]
	str	ip, [r3, #132]
	ldr	ip, [r2, #1856]
	str	ip, [r3, #136]
	ldr	r2, [r2, #1868]
	str	r2, [r3, #140]
	str	r1, [r0, #40]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_WriteSliceMsg, .-Real9_WriteSliceMsg
	.align	2
	.global	Real9_WritePicMsg
	.type	Real9_WritePicMsg, %function
Real9_WritePicMsg:
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
	ldr	r2, [r3, #1736]
	cmp	r2, #2
	strb	r2, [r0, #9]
	ldr	r2, [r3, #1752]
	str	r2, [r0, #12]
	ldr	r2, [r3, #1748]
	str	r2, [r0, #16]
	ldr	r2, [r3, #2996]
	str	r2, [r0, #20]
	ldr	r2, [r3, #3000]
	str	r2, [r0, #24]
	ldr	r2, [r3, #1776]
	str	r2, [r0, #28]
	ldr	r1, [r3, #1900]
	str	r1, [r0, #32]
	ldr	r1, [r3, #1904]
	str	r1, [r0, #36]
	strne	r2, [r3, #1900]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_WritePicMsg, .-Real9_WritePicMsg
	.align	2
	.global	Real9_WriteReg
	.type	Real9_WriteReg, %function
Real9_WriteReg:
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
	str	r1, [r0, #44]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_WriteReg, .-Real9_WriteReg
	.align	2
	.global	Real9_ModifySliceMsg
	.type	Real9_ModifySliceMsg, %function
Real9_ModifySliceMsg:
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
	ldr	r2, [r0, #140]
	ldr	r3, [r0, #12]
	cmp	r2, #0
	ldr	ip, [r0, #16]
	bne	.L207
	mul	ip, r3, ip
	ldr	r5, [r0, #40]
	cmp	r5, #2
	sub	ip, ip, #1
	bls	.L206
	ldr	r3, [r0, #184]
	sub	lr, r5, #1
	cmp	r3, #0
	cmpgt	ip, r3
	ble	.L207
	mov	r2, r0
	mov	r3, #1
	b	.L208
.L209:
	ldr	r1, [r2, #228]
	add	r2, r2, #44
	cmp	ip, r1
	cmpgt	r1, #0
	ble	.L207
.L208:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L209
.L206:
	cmp	r5, #1
	bls	.L210
	sub	r4, r5, #1
	mov	r3, r0
	mov	r2, #0
	b	.L211
.L212:
	ldr	lr, [r3, #140]
	add	r3, r3, #44
	add	r2, r2, #1
	ldr	r1, [r3, #140]
	cmp	lr, r1
	bge	.L207
.L211:
	cmp	r2, r4
	bne	.L212
	mov	r3, #44
	mla	r2, r3, r2, r0
	ldr	r3, [r2, #140]
	cmp	ip, r3
	cmpge	r3, #0
	ble	.L207
.L210:
	cmp	r5, #0
	beq	.L213
	sub	r7, r5, #1
	mov	r6, r0
	mov	lr, r0
	mov	r4, #0
	b	.L216
.L231:
	cmp	r4, r5
	beq	.L230
.L216:
	cmp	r4, r7
	streq	ip, [lr, #144]
	add	r4, r4, #1
	add	lr, lr, #44
	ldrne	r3, [lr, #140]
	moveq	r1, ip
	subne	r1, r3, #1
	ldr	r3, [lr, #96]
	strne	r1, [lr, #100]
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
	beq	.L231
.L207:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L230:
	ldr	r2, [r0, #104]
	mov	r1, r2
	b	.L219
.L232:
	ldr	r1, [r6, #104]
.L219:
	cmp	r2, r1
	ldr	ip, [r6, #108]
	add	r3, r3, #1
	movcs	r2, r1
	cmp	ip, r2
	bcs	.L217
	ldr	r1, [r6, #124]
	cmp	r1, #0
	movne	r2, ip
.L217:
	cmp	r5, r3
	add	r6, r6, #44
	bne	.L232
	bic	r2, r2, #15
	ldr	lr, [r0, #40]
	str	r2, [r0, #48]
	mov	r3, r0
	mov	ip, #0
	b	.L223
.L233:
	ldr	r4, [r3, #112]
	rsb	r2, r2, r1
	and	r1, r4, #7
	add	r2, r2, r4, lsr #3
	and	r4, r2, #15
	bic	r2, r2, #15
	str	r2, [r3, #104]
	add	r2, r1, r4, lsl #3
	str	r2, [r3, #112]
.L221:
	add	ip, ip, #1
	add	r3, r3, #44
	cmp	lr, ip
	bls	.L222
	ldr	r2, [r0, #48]
.L223:
	ldr	r1, [r3, #108]
	cmp	r1, #0
	rsb	r4, r2, r1
	ldr	r1, [r3, #104]
	beq	.L233
	ldr	r5, [r3, #112]
	rsb	r2, r2, r1
	ldr	r7, [r3, #116]
	and	r6, r5, #7
	add	r2, r2, r5, lsr #3
	and	r5, r7, #7
	add	r1, r4, r7, lsr #3
	and	r4, r2, #15
	and	r7, r1, #15
	bic	r2, r2, #15
	add	r4, r6, r4, lsl #3
	str	r2, [r3, #104]
	bic	r1, r1, #15
	add	r2, r5, r7, lsl #3
	str	r4, [r3, #112]
	str	r2, [r3, #116]
	str	r1, [r3, #108]
	b	.L221
.L213:
	ldr	r3, [r0, #104]
	bic	r3, r3, #15
	str	r3, [r0, #48]
.L222:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	Real9_ModifySliceMsg, .-Real9_ModifySliceMsg
	.align	2
	.global	REAL9DEC_Init
	.type	REAL9DEC_Init, %function
REAL9DEC_Init:
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
	ldr	r3, .L238
	mov	r7, r1
	movw	r2, #56744
	mov	r1, #0
	add	r4, r0, #53248
	mov	r5, r0
	ldr	r3, [r3, #48]
	mov	r6, r1
	blx	r3
	add	r0, r5, #56320
	add	r0, r0, #56
	bl	ResetVoQueue
	str	r7, [r5]
	mov	r3, #15
	str	r3, [r4, #1900]
	str	r3, [r4, #1904]
	add	r2, r5, #8192
	ldr	ip, [r7, #8]
	mov	r3, #1
	strb	r6, [r2, #3192]
	mov	r1, #8192
	mov	r0, r5
	strb	ip, [r2, #3188]
	str	r1, [r4, #1760]
	str	r3, [r4, #1732]
	strb	r3, [r4, #1728]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #3480]
	mov	r0, r6
	beq	.L237
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L237:
	ldr	r1, .L238+4
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L239:
	.align	2
.L238:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC10
	UNWIND(.fnend)
	.size	REAL9DEC_Init, .-REAL9DEC_Init
	.align	2
	.global	REAL9DEC_Destroy
	.type	REAL9DEC_Destroy, %function
REAL9DEC_Destroy:
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
	ldr	r1, .L241
	mov	r0, #2
	ldr	r2, [r3, #2972]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L242:
	.align	2
.L241:
	.word	.LC11
	UNWIND(.fnend)
	.size	REAL9DEC_Destroy, .-REAL9DEC_Destroy
	.global	__aeabi_idiv
	.align	2
	.global	REAL9DEC_Decode
	.type	REAL9DEC_Decode, %function
REAL9DEC_Decode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #212)
	sub	sp, sp, #212
	add	r9, r0, #53248
	mov	r7, r0
	mov	r4, r1
	mov	r2, #128
	mov	r1, #0
	sub	r0, fp, #172
	add	r3, r7, #8
	str	r3, [fp, #-192]
	bl	memset
	ldr	r2, [r9, #1836]
	cmp	r4, #0
	ldr	r3, [r9, #1840]
	mov	r0, #1
	mov	r1, #8192
	str	r0, [r9, #1732]
	str	r2, [r9, #1844]
	str	r2, [fp, #-56]
	str	r2, [fp, #-64]
	str	r3, [r9, #1848]
	str	r3, [fp, #-52]
	str	r3, [fp, #-60]
	str	r0, [fp, #-168]
	str	r1, [r9, #1760]
	str	r1, [fp, #-140]
	beq	.L389
	ldr	r3, .L410
	movw	r2, #11360
	mov	r1, #0
	ldr	r0, [fp, #-192]
	mov	r8, r1
	add	r6, r7, #8192
	ldr	r3, [r3, #48]
	blx	r3
	str	r8, [r9, #2936]
	ldr	r3, [r4, #12]
	str	r3, [r9, #2956]
	ldr	r3, [r4, #8]
	str	r3, [r9, #2940]
	ldr	r3, [r4]
	str	r3, [r6, #3176]
	ldr	r2, [r4, #12]
	str	r2, [r9, #2944]
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	strb	r3, [r6, #3180]
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L246
	ldr	r3, [r4, #88]
	str	r3, [r9, #2948]
	ldr	r3, [r4, #80]
	str	r3, [r6, #3184]
	ldr	r3, [r4, #92]
	str	r3, [r9, #2952]
	ldrb	r3, [r4, #85]	@ zero_extendqisi2
	strb	r3, [r6, #3181]
	ldrb	r3, [r4, #85]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L390
.L247:
	movw	r3, #65525
	sub	r1, r2, #10
	movt	r3, 47
	cmp	r1, r3
	bhi	.L384
	ldr	r1, [r6, #3176]
	cmp	r1, #0
	beq	.L384
	add	r3, r7, #56320
	add	r3, r3, #24
	str	r3, [fp, #-196]
	mov	r4, r3
	mov	r0, r3
	bl	BsInit
	mov	r1, #8
	mov	r0, r4
	bl	BsShow
	mov	r1, #8
	mov	r5, r0
	mov	r0, r4
	bl	BsSkip
	cmp	r5, #255
	add	r0, r5, #1
	str	r0, [r9, #1908]
	bhi	.L384
	cmp	r0, #0
	beq	.L250
	add	r10, r7, #55040
	movw	r8, #65535
	add	r10, r10, #116
	str	r6, [fp, #-200]
	movt	r8, 47
	mov	r5, #0
	mov	r6, r10
	b	.L251
.L392:
	ldr	r0, [r9, #1908]
	cmp	r0, r5
	bls	.L391
.L251:
	mov	r1, #32
	mov	r0, r4
	bl	BsSkip
	mov	r1, #32
	mov	r0, r4
	add	r5, r5, #1
	bl	BsShow
	mov	r1, #32
	mov	r10, r0
	mov	r0, r4
	bl	BsSkip
	rev	r3, r10
	cmp	r3, r8
	str	r3, [r6, #4]!
	ble	.L392
.L384:
	mov	r8, #0
.L373:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L390:
	ldr	r1, [r4, #16]
	ldr	r0, [r9, #3480]
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #96]
	ldr	r0, [r9, #3480]
	bl	SM_ReleaseStreamSeg
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L246:
	str	r8, [r9, #2948]
	str	r8, [r6, #3184]
	str	r8, [r9, #2952]
	strb	r8, [r6, #3181]
	b	.L247
.L389:
	ldr	r2, [r9, #2972]
	mov	r8, r4
	ldr	r1, .L410+4
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L391:
	ldr	r6, [fp, #-200]
	str	r4, [fp, #-196]
.L250:
	add	r3, r7, #55040
	sub	r5, r0, #1
	add	r3, r3, #120
	mov	r2, #0
	ldr	r4, [fp, #-196]
	b	.L252
.L253:
	ldr	ip, [r3, #4]!
	ldr	r1, [r3, #-4]
	cmp	ip, r1
	ble	.L384
.L252:
	cmp	r2, r5
	add	r2, r2, #1
	bne	.L253
	ldr	r2, [r9, #1912]
	mov	r0, r0, asl #3
	add	r1, r0, #1
	movw	r3, #65534
	add	r0, r1, r2
	cmp	r1, #3145728
	sub	r5, r0, #1
	movt	r3, 47
	movlt	r2, #0
	movge	r2, #1
	cmp	r5, r3
	movls	r5, r2
	orrhi	r5, r2, #1
	str	r4, [fp, #-196]
	cmp	r5, #0
	str	r1, [fp, #-200]
	str	r0, [fp, #-204]
	bne	.L384
	ldr	r2, [r9, #2944]
	mov	r3, r0
	rsb	r2, r0, r2
	cmp	r2, #0
	ble	.L384
	ldr	r1, [r6, #3176]
	mov	r0, r4
	add	r1, r1, r3
	bl	BsInit
	sub	r1, fp, #172
	mov	r0, r4
	bl	Real9_CB_GetPictureHeader
	cmp	r0, #1
	mov	r8, r0
	bne	.L393
	ldrb	r3, [r6, #3192]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L255
	ldr	r2, [fp, #-148]
	ldr	r3, [r9, #1752]
	cmp	r2, r3
	beq	.L394
.L255:
	ldr	r3, .L410+8
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L257
	ldr	r0, [fp, #-148]
	mov	r3, #8
	ldr	r1, [r9, #1748]
	sub	r2, fp, #180
	ldr	lr, [r9, #1752]
	strh	r0, [fp, #-176]	@ movhi
	ldrh	r0, [fp, #-152]
	strh	r1, [fp, #-178]	@ movhi
	mov	r1, #2
	strh	lr, [fp, #-180]	@ movhi
	strh	r0, [fp, #-174]	@ movhi
	ldr	r0, [r9, #3480]
	blx	r5
.L257:
	ldr	r0, [r9, #3480]
	bl	FSP_GetFspType
	subs	lr, r0, #0
	bne	.L258
	sub	r3, fp, #44
	sub	r2, fp, #184
	sub	r1, fp, #188
	ldr	r0, [r9, #3480]
	str	lr, [r3, #-136]!
	str	lr, [fp, #-188]
	str	lr, [fp, #-184]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r7]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	beq	.L395
.L258:
	mov	r2, #1
	ldr	r1, [r9, #3076]
	ldr	r0, [r9, #3480]
	add	r5, r7, #56320
	bl	FSP_ClearLogicFs
	mov	r2, #1
	ldr	r1, [r9, #3072]
	add	r5, r5, #56
	ldr	r0, [r9, #3480]
	bl	FSP_ClearLogicFs
	mov	r3, #0
	ldr	r0, [r9, #3480]
	str	r3, [r9, #3072]
	str	r3, [r9, #3076]
	str	r3, [fp, #-208]
	bl	FSP_GetNullLogicFs
	ldr	r3, [fp, #-208]
	mov	r1, r5
	str	r0, [r9, #3076]
	str	r0, [r9, #3072]
	strb	r3, [r6, #3189]
	ldr	r0, [r9, #3480]
	bl	FSP_ClearNotInVoQueue
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #-152]
	cmp	r2, #512
	bhi	.L265
	cmp	r3, #512
	bhi	.L265
	ldr	r3, [r7]
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L267
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L396
.L267:
	ldr	r0, [r9, #3480]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L379
.L269:
	ldr	r3, [fp, #-152]
	mov	r0, #1
	ldr	r2, [fp, #-148]
	ldr	r1, .L410+12
	bl	dprint_vfmw
	sub	r2, fp, #172
	mov	r1, r7
	mov	r0, #6
	bl	Real9_ArrangeVHBMem
	subs	r3, r0, #0
	beq	.L397
.L256:
	add	r3, r7, #54784
	sub	r1, fp, #172
	mov	r2, r3
	ldr	r3, .L410
	add	r2, r2, #192
	str	r2, [fp, #-212]
	ldr	r3, [r3, #52]
	mov	r0, r2
	mov	r2, #128
	blx	r3
	ldr	r3, [r7]
	mov	r0, r7
	ldr	r3, [r3, #8]
	strb	r3, [r6, #3188]
	bl	Real9_GetImageBuffer
	subs	r3, r0, #0
	beq	.L398
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	bl	FSP_GetFsImagePtr
	subs	ip, r0, #0
	beq	.L272
	ldr	r0, [r7]
	add	r3, ip, #640
	add	r10, ip, #656
	mvn	r4, #0
	mov	lr, r3
	str	lr, [fp, #-208]
	ldrd	r2, [r0, #56]
	mvn	r5, #0
	ldr	r1, .L410+16
	mov	r0, #29
	strd	r2, [lr]
	ldr	lr, [r7]
	ldrd	r2, [lr, #72]
	strd	r2, [r10, #-8]
	ldr	lr, [r7]
	ldrd	r2, [lr, #88]
	strd	r2, [r10]
	ldr	lr, [r7]
	ldr	lr, [lr, #104]
	str	lr, [ip, #8]
	ldr	lr, [r7]
	ldr	lr, [lr, #108]
	str	lr, [ip, #12]
	ldr	lr, [r7]
	ldr	lr, [lr, #112]
	str	lr, [ip, #16]
	ldr	lr, [r7]
	ldr	lr, [lr, #128]
	str	lr, [ip, #20]
	ldr	r3, [r7]
	strd	r4, [r3, #56]
	ldrd	r2, [r10, #-8]
	mov	r5, r3
	ldr	r3, [fp, #-208]
	mov	r4, r2
	ldrd	r2, [r3]
	strd	r4, [sp]
	bl	dprint_vfmw
	ldr	r3, [r9, #1736]
	cmp	r3, #2
	beq	.L399
	cmp	r3, #1
	ldrb	r3, [r6, #3189]	@ zero_extendqisi2
	beq	.L400
	cmp	r3, #0
	movne	r3, #2
	moveq	r3, #1
.L276:
	strb	r3, [r6, #3189]
	ldr	r2, [r9, #3072]
	ldr	r3, [r9, #3076]
	cmp	r2, r3
	beq	.L277
	ldr	r1, .L410+20
	mov	r0, #13
	bl	dprint_vfmw
	mov	r2, #0
	ldr	r1, [r9, #3072]
	ldr	r0, [r9, #3480]
	bl	FSP_SetRef
.L277:
	ldr	r3, [r9, #3076]
	mov	r2, #1
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	str	r3, [r9, #3072]
	str	r1, [r9, #3076]
	bl	FSP_SetRef
	ldr	r1, [r9, #3072]
	ldr	r0, [r9, #3480]
	bl	FSP_RemovePmv
	ldr	r2, [r9, #3080]
	ldr	r1, .L410+24
	mov	r0, #13
	bl	dprint_vfmw
	ldrb	r3, [r6, #3188]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L279
	ldr	r3, [r9, #1736]
	cmp	r3, #0
	beq	.L380
	cmp	r3, #2
	beq	.L320
	cmp	r3, #1
	beq	.L380
.L279:
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	bl	FSP_GetLogicFs
	ldr	r1, [r9, #3072]
	mov	r5, r0
	ldr	r0, [r9, #3480]
	bl	FSP_GetLogicFs
	ldr	r1, [r9, #3076]
	mov	r10, r0
	ldr	r0, [r9, #3480]
	bl	FSP_GetLogicFs
	cmp	r5, #0
	cmpne	r10, #0
	moveq	r3, #1
	movne	r3, #0
	cmp	r0, #0
	orreq	r3, r3, #1
	str	r0, [fp, #-208]
	cmp	r3, #0
	bne	.L401
	ldr	r3, [r5, #680]
	cmp	r3, #0
	beq	.L285
	ldr	r2, [r5, #688]
	cmp	r2, #0
	beq	.L285
	ldr	r2, [r5, #684]
	cmp	r2, #0
	beq	.L285
	ldr	r2, [fp, #-208]
	mov	r0, #13
	ldr	r1, .L410+28
	ldr	r2, [r2, #680]
	cmp	r2, #0
	ldrne	lr, [r2, #16]
	ldreq	lr, [r3, #16]
	str	lr, [r7, #52]
	ldr	r3, [r10, #680]
	cmp	r3, #0
	ldreq	r3, [r5, #680]
	ldr	ip, [r3, #16]
	str	ip, [r7, #56]
	ldr	r3, [r5, #680]
	ldr	r2, [r3, #16]
	str	r2, [r7, #60]
	ldr	r3, [r5, #692]
	str	r3, [r7, #76]
	mov	r4, r3
	ldr	r3, [fp, #-208]
	ldr	r3, [r3, #692]
	str	r3, [r7, #80]
	str	r3, [fp, #-216]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #16]
	str	r4, [sp, #8]
	ldr	r4, [fp, #-216]
	str	r4, [sp, #12]
	str	r3, [r7, #64]
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #32]
	str	r3, [r7, #68]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #32]
	str	r3, [r9, #3044]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #76]
	str	r3, [r7, #92]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #60]
	str	r3, [r7, #96]
	ldr	r3, [r5, #684]
	ldr	r3, [r3, #64]
	str	r3, [r7, #100]
	ldr	r3, [r9, #1736]
	cmp	r3, #2
	beq	.L402
.L291:
	ldr	r3, [r9, #1764]
	ldr	r0, [fp, #-196]
	str	r3, [r5, #700]
	ldr	r3, [r9, #1736]
	ldr	r2, [r9, #1776]
	cmp	r3, #2
	strb	r3, [r7, #9]
	ldr	r3, [r9, #1752]
	str	r2, [fp, #-208]
	str	r3, [r7, #12]
	ldr	r3, [r9, #1748]
	str	r3, [r7, #16]
	ldr	r3, [r9, #2996]
	str	r3, [r7, #20]
	ldr	r3, [r9, #3000]
	str	r2, [r7, #28]
	str	r3, [r7, #24]
	ldr	r3, [r9, #1900]
	str	r3, [r7, #32]
	ldr	r3, [r9, #1904]
	str	r3, [r7, #36]
	strne	r2, [r9, #1900]
	bl	BsPos
	ldr	r1, [r9, #1908]
	cmp	r1, #1
	ldreq	r5, [r9, #1912]
	ldrne	r5, [r9, #1912]
	mov	r3, r0, asr #31
	mov	r2, r3, lsr #29
	add	r3, r0, r2
	ldreq	r0, [fp, #-196]
	and	r3, r3, #7
	ldrne	r0, [fp, #-196]
	rsb	r3, r2, r3
	ldreq	r2, [fp, #-200]
	str	r3, [r9, #1876]
	ldreq	r3, [r9, #2944]
	ldrne	r3, [r9, #1916]
	rsbeq	r3, r2, r3
	rsb	r5, r5, r3
	bl	BsPos
	ldr	r3, [fp, #-204]
	mov	r5, r5, asl #3
	rsb	r0, r0, r5
	ldr	r5, [r9, #2940]
	str	r0, [r9, #1880]
	ldr	r0, [fp, #-196]
	add	r5, r3, r5
	bl	BsPos
	ldr	r2, [r9, #1780]
	ldr	lr, [r9, #1772]
	mov	r1, #1
	ldr	ip, [fp, #-208]
	str	r2, [r9, #1860]
	str	lr, [r9, #1864]
	str	ip, [r9, #1856]
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	mov	r3, #0
	add	r0, r5, r0, asr #3
	str	r3, [r9, #1888]
	str	r0, [r9, #1884]
	str	r3, [r9, #1892]
	str	r3, [r9, #1896]
	str	r3, [r9, #1868]
	str	r0, [r7, #104]
	ldr	r0, [r9, #1876]
	str	r0, [r7, #112]
	ldr	r0, [r9, #1880]
	str	lr, [r7, #128]
	str	r3, [r7, #108]
	str	r0, [r7, #120]
	str	r3, [r7, #116]
	str	r3, [r7, #124]
	str	r2, [r7, #132]
	str	r3, [r7, #140]
	str	ip, [r7, #136]
	str	r1, [r7, #40]
	ldr	r2, [r9, #1908]
	cmp	r2, r1
	bls	.L316
	ldr	r10, [r9, #1916]
	movw	r0, #65535
	ldr	r2, [fp, #-200]
	movt	r0, 47
	add	r10, r2, r10
	cmp	r10, r0
	bgt	.L385
	cmp	r10, #0
	ble	.L385
	ldr	r2, [r9, #2944]
	rsb	r2, r10, r2
	cmp	r2, #0
	ble	.L385
	add	ip, r7, #55040
	mov	r5, r1
	add	r1, ip, #124
	str	r8, [fp, #-228]
	sub	ip, fp, #180
	mov	r8, r7
	str	ip, [fp, #-204]
	mov	r7, r6
	str	r3, [fp, #-224]
	mov	r6, r1
	str	r0, [fp, #-216]
	str	r5, [fp, #-220]
	ldr	r4, [fp, #-196]
	b	.L307
.L308:
	ldr	r3, [r9, #1908]
	add	r5, r5, #1
	cmp	r3, r5
	bls	.L403
	ldr	r3, [fp, #-200]
	ldr	ip, [r6, #4]!
	add	r10, r3, ip
	ldr	r3, [fp, #-216]
	cmp	r10, r3
	bgt	.L385
	cmp	r10, #0
	ble	.L385
	ldr	r2, [r9, #2944]
	rsb	r2, r10, r2
	cmp	r2, #0
	ble	.L385
.L307:
	ldr	r1, [r7, #3176]
	mov	r0, r4
	add	r1, r1, r10
	bl	BsInit
	ldr	r3, [fp, #-212]
	sub	r2, fp, #188
	mov	r1, #0
	mov	r0, r4
	str	r3, [sp, #4]
	ldr	r3, [fp, #-204]
	str	r3, [sp]
	sub	r3, fp, #184
	bl	Real9_CB_GetSliceHeader
	cmp	r0, #1
	bne	.L308
	ldr	r3, [r9, #1752]
	ldr	r2, [fp, #-188]
	cmp	r3, #0
	str	r2, [fp, #-196]
	beq	.L404
	ldr	r3, [fp, #-180]
	mov	r0, r4
	ldr	r2, [fp, #-208]
	cmp	r3, #0
	movge	r2, r3
	str	r2, [fp, #-208]
	bl	BsPos
	ldr	r2, [r9, #1908]
	sub	lr, r2, #1
	cmp	lr, r5
	mov	r3, r0, asr #31
	mov	r1, r3, lsr #29
	add	r3, r0, r1
	and	r3, r3, #7
	rsb	r3, r1, r3
	str	r3, [r9, #1876]
	beq	.L405
	cmp	r5, #254
	bhi	.L406
	ldr	r3, [r6, #4]
	mov	r0, r4
	ldr	r2, [r6]
.L383:
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	str	r3, [fp, #-232]
	bl	BsPos
	ldr	r3, [fp, #-232]
	rsb	r0, r0, r3
	ldr	r3, [r9, #2940]
	str	r0, [r9, #1880]
	mov	r0, r4
	add	r10, r10, r3
	bl	BsPos
	ldr	ip, [fp, #-224]
	mov	r3, #44
	ldr	lr, [fp, #-220]
	ldr	r1, [r9, #1772]
	str	ip, [r9, #1888]
	str	ip, [r9, #1892]
	str	ip, [r9, #1896]
	mla	r3, r3, lr, r8
	ldr	ip, [fp, #-208]
	str	r1, [r9, #1864]
	add	lr, lr, #1
	str	lr, [fp, #-220]
	str	ip, [r9, #1856]
	ldr	ip, [fp, #-196]
	str	ip, [r9, #1868]
	add	r2, r0, #7
	cmp	r0, #0
	movlt	r0, r2
	ldr	r2, [r9, #1780]
	add	r0, r10, r0, asr #3
	str	r0, [r9, #1884]
	cmp	lr, #131
	str	r2, [r9, #1860]
	str	r0, [r3, #104]
	ldr	r2, [r9, #1876]
	str	r2, [r3, #112]
	ldr	r2, [r9, #1880]
	str	r2, [r3, #120]
	ldr	r2, [r9, #1896]
	str	r2, [r3, #108]
	ldr	r2, [r9, #1888]
	str	r2, [r3, #116]
	ldr	r2, [r9, #1892]
	str	r2, [r3, #124]
	ldr	r2, [r9, #1864]
	str	r2, [r3, #128]
	ldr	r2, [r9, #1860]
	str	r2, [r3, #132]
	ldr	r2, [r9, #1856]
	str	r2, [r3, #136]
	ldr	r2, [r9, #1868]
	str	r2, [r3, #140]
	str	lr, [r8, #40]
	ble	.L308
	mov	r0, r8
	bl	Real9_ModifySliceMsg
	cmp	r0, #1
	bne	.L385
	ldr	r3, [fp, #-192]
	str	r3, [r8, #4]
	b	.L308
.L393:
	ldr	r1, .L410+32
	mov	r0, #1
	mov	r8, r5
	bl	dprint_vfmw
	b	.L373
.L265:
	ldr	r1, .L410+36
	mov	r0, #18
	bl	dprint_vfmw
	b	.L384
.L398:
	ldr	r2, [r9, #2972]
	mov	r8, r3
	ldr	r1, .L410+40
	bl	dprint_vfmw
	b	.L373
.L395:
	ldr	r3, [fp, #-180]
	cmp	r3, #0
	bgt	.L261
	ldr	r3, [fp, #-184]
	cmp	r3, #32
	bgt	.L261
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L261
	ldr	r3, [r9, #2968]
	cmp	r3, #0
	beq	.L258
	ldr	r5, [r9, #1752]
	cmp	r5, #0
	beq	.L258
	ldr	r0, [fp, #-152]
	ldr	r1, [r9, #3484]
	cmp	r0, r1
	beq	.L258
	ldr	r1, [fp, #-148]
	ldr	lr, [r9, #3488]
	cmp	r1, lr
	beq	.L258
	ldr	lr, [r9, #1748]
	str	r0, [sp, #12]
	mov	r0, r2
	str	r1, [sp, #8]
	stmia	sp, {r5, lr}
	ldr	r1, .L410+44
	bl	dprint_vfmw
	ldr	r3, .L410+8
	ldr	r2, [fp, #-152]
	ldr	r5, [r3]
	ldr	r3, [fp, #-148]
	cmp	r5, #0
	str	r2, [r9, #3484]
	str	r3, [r9, #3488]
	beq	.L258
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r9, #3480]
	blx	r5
	b	.L258
.L394:
	ldr	r2, [fp, #-152]
	ldr	r3, [r9, #1748]
	cmp	r2, r3
	bne	.L255
	b	.L256
.L396:
	ldrb	r3, [r6, #3192]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L269
.L379:
	mov	r0, r5
	bl	ResetVoQueue
	b	.L269
.L397:
	ldr	r1, .L410+48
	mov	r0, #1
	mov	r8, r3
	bl	dprint_vfmw
	b	.L373
.L385:
	mov	r2, #1
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	mov	r8, #0
	bl	FSP_ClearLogicFs
	b	.L373
.L399:
	ldrb	r3, [r6, #3189]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L385
	ldrb	r3, [r6, #3188]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L279
.L320:
	ldr	r3, [r9, #3088]
	cmp	r3, #0
	bne	.L279
	mov	r2, #1
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	mov	r8, r3
	bl	FSP_ClearLogicFs
	b	.L373
.L380:
	str	r3, [r9, #3088]
	b	.L279
.L405:
	add	r2, r2, #10944
	ldr	r3, [r9, #2944]
	add	r2, r2, #3
	ldr	r1, [fp, #-200]
	mov	r0, r4
	add	r2, r7, r2, lsl #2
	rsb	r3, r1, r3
	ldr	r2, [r2, #3176]
	b	.L383
.L261:
	mvn	r8, #1
	b	.L373
.L401:
	movw	r3, #2034
	ldr	r2, .L410+52
	ldr	r1, .L410+56
	mov	r0, #0
	bl	dprint_vfmw
	mov	r8, #0
	b	.L373
.L400:
	cmp	r3, #0
	movne	r3, #2
	bne	.L276
	b	.L384
.L403:
	mov	r7, r8
	ldr	r8, [fp, #-228]
.L316:
	ldr	r4, [r7, #4]
	mov	r5, #1
	str	r5, [r7, #44]
	cmp	r4, #0
	beq	.L407
	ldr	r3, [r7]
	ldr	r2, [r3, #864]
	cmp	r2, #1
	beq	.L321
.L318:
	cmp	r2, #2
	beq	.L408
.L319:
	ldr	r2, [r3, #592]
	str	r2, [r7, #84]
	ldr	r3, [r3, #632]
	str	r3, [r7, #88]
	b	.L373
.L402:
	ldr	r1, [fp, #-208]
	ldr	r2, [r10, #700]
	ldr	r3, [r9, #1764]
	ldr	r10, [r1, #700]
	subs	r3, r3, r2
	rsb	r10, r2, r10
	ldrmi	r2, [r9, #1760]
	addmi	r3, r3, r2
	cmp	r10, #0
	ldrlt	r2, [r9, #1760]
	addlt	r10, r10, r2
	cmp	r3, r10
	movgt	r3, #0
	cmp	r10, #0
	ble	.L323
	mov	r1, r10
	mov	r0, r3, asl #14
	str	r3, [fp, #-208]
	bl	__aeabi_idiv
	ldr	r3, [fp, #-208]
	mov	r1, r10
	str	r0, [fp, #-216]
	rsb	r0, r3, r10
	mov	r0, r0, asl #14
	bl	__aeabi_idiv
	ldr	r3, [fp, #-208]
	ldr	r2, [fp, #-216]
.L295:
	str	r3, [r9, #2988]
	str	r10, [r9, #2992]
	str	r2, [r9, #2996]
	str	r0, [r9, #3000]
	b	.L291
.L285:
	ldr	r1, [r9, #3080]
	mov	r2, #1
	ldr	r0, [r9, #3480]
	mov	r8, #0
	bl	FSP_ClearLogicFs
	ldr	r1, .L410+60
	mov	r0, r8
	bl	dprint_vfmw
	b	.L373
.L272:
	mov	r2, #1
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	mov	r8, ip
	bl	FSP_ClearLogicFs
	b	.L373
.L407:
	mov	r0, r7
	bl	Real9_ModifySliceMsg
	cmp	r0, #1
	bne	.L409
	ldr	r2, [fp, #-192]
	ldr	r3, [r7]
	str	r2, [r7, #4]
	ldr	r2, [r3, #864]
	cmp	r2, #1
	bne	.L318
	ldr	r2, [fp, #-192]
	cmp	r2, #0
	beq	.L319
	mov	r4, r2
.L321:
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L319
	mov	r2, #0
	str	r2, [r7, #4]
	ldr	r1, [r9, #3080]
	mov	r8, r2
	ldr	r0, [r9, #3480]
	bl	FSP_SetDisplay
	mov	r1, r7
	mov	r0, #9
	bl	ReleasePacket
	b	.L373
.L408:
	ldr	r2, [r3, #868]
	cmp	r2, #0
	ble	.L319
	ldr	r2, [r7, #4]
	cmp	r2, #0
	beq	.L319
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L319
	mov	r2, #0
	str	r2, [r7, #4]
	ldr	r1, [r9, #3080]
	mov	r8, r2
	ldr	r0, [r9, #3480]
	bl	FSP_SetDisplay
	ldr	r2, [r7]
	mov	r1, r7
	mov	r0, #9
	ldr	r3, [r2, #868]
	sub	r3, r3, #1
	str	r3, [r2, #868]
	bl	ReleasePacket
	b	.L373
.L406:
	movw	r2, #2266
	ldr	r1, .L410+64
	mov	r0, #22
	mov	r8, #0
	bl	dprint_vfmw
	b	.L373
.L323:
	mov	r0, #0
	mov	r2, r0
	b	.L295
.L404:
	mov	r2, r0
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	mov	r8, r3
	bl	FSP_ClearLogicFs
	b	.L373
.L409:
	mov	r2, r5
	ldr	r1, [r9, #3080]
	ldr	r0, [r9, #3480]
	mov	r8, r4
	bl	FSP_ClearLogicFs
	b	.L373
.L411:
	.align	2
.L410:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	g_event_report
	.word	.LC16
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC24
	.word	.LC13
	.word	.LC15
	.word	.LC18
	.word	.LC14
	.word	.LC17
	.word	.LANCHOR0+460
	.word	.LC22
	.word	.LC23
	.word	.LC25
	UNWIND(.fnend)
	.size	REAL9DEC_Decode, .-REAL9DEC_Decode
	.align	2
	.global	REAL9DEC_RecycleImage
	.type	REAL9DEC_RecycleImage, %function
REAL9DEC_RecycleImage:
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
	ldr	r0, [r4, #3480]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #3480]
	bl	FSP_GetFsImagePtr
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL9DEC_RecycleImage, .-REAL9DEC_RecycleImage
	.align	2
	.global	REAL9DEC_GetRemainImg
	.type	REAL9DEC_GetRemainImg, %function
REAL9DEC_GetRemainImg:
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
	ldr	r1, [r6, #3076]
	ldr	r0, [r6, #3480]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L430
	ldr	r1, [r6, #3076]
	ldr	r0, [r6, #3480]
	bl	FSP_GetDisplay
	cmp	r0, #2
	beq	.L429
.L430:
	add	r5, r4, #56320
	add	r5, r5, #56
.L420:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	GetVoLastImageID
.L429:
	mov	r0, r4
	add	r5, r4, #56320
	bl	Real9_SetImgFormat
	add	r5, r5, #56
	mov	r3, #1
	str	r3, [r7, #212]
	mov	r2, r3
	ldr	r1, [r6, #3076]
	ldr	r0, [r6, #3480]
	bl	FSP_SetDisplay
	ldr	r0, [r6, #3480]
	mov	r2, r4
	str	r7, [sp]
	mov	r3, r5
	mov	r1, #9
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L417
	mov	r2, #0
	ldr	r1, [r6, #3076]
	ldr	r0, [r6, #3480]
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
	.size	REAL9DEC_GetRemainImg, .-REAL9DEC_GetRemainImg
	.align	2
	.global	REAL9DEC_VDMPostProc
	.type	REAL9DEC_VDMPostProc, %function
REAL9DEC_VDMPostProc:
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
	mov	r0, #9
	add	r7, r5, #8192
	bl	ReleasePacket
	ldr	r1, [r4, #3080]
	ldr	r0, [r4, #3480]
	bl	FSP_GetFsImagePtr
	cmp	r0, #0
	beq	.L432
	ldr	r3, [r4, #1736]
	cmp	r3, #2
	andne	r8, r8, #31
	strb	r3, [r7, #3190]
	strne	r8, [r4, #1904]
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
	bl	Real9_SetImgFormat
	ldrb	r3, [r7, #3188]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L437
	ldr	r3, [r5]
	ldr	r3, [r3, #12]
	cmp	r3, #1
	beq	.L437
	ldr	r3, [r4, #1736]
	cmp	r3, #2
	beq	.L437
	ldrb	r3, [r7, #3189]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhi	r1, [r4, #3072]
	mvnls	r1, #0
	cmn	r1, #1
	str	r1, [r4, #3084]
	beq	.L439
.L459:
	ldr	r0, [r4, #3480]
	bl	FSP_GetFsImagePtr
	ldr	r6, [r4, #3084]
	mov	r1, r6
	mov	r7, r0
	ldr	r0, [r4, #3480]
	bl	FSP_GetRef
	mov	r2, r6
	ldr	r1, .L460+8
	mov	r3, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #1
	ldr	r1, [r4, #3084]
	ldr	r0, [r4, #3480]
	bl	FSP_SetDisplay
	add	r3, r5, #56320
	ldr	r0, [r4, #3480]
	add	r3, r3, #56
	str	r7, [sp]
	mov	r2, r5
	mov	r1, #9
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L458
.L439:
	ldr	r3, [r4, #2972]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r4, #2972]
.L432:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L437:
	ldr	r1, [r4, #3080]
	cmn	r1, #1
	str	r1, [r4, #3084]
	bne	.L459
	b	.L439
.L458:
	ldr	r0, [r4, #3480]
	mov	r2, #0
	ldr	r1, [r4, #3084]
	bl	FSP_SetDisplay
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L461:
	.align	2
.L460:
	.word	.LC26
	.word	.LC27
	.word	.LC28
	UNWIND(.fnend)
	.size	REAL9DEC_VDMPostProc, .-REAL9DEC_VDMPostProc
	.align	2
	.global	REAL9DEC_GetImageBuffer
	.type	REAL9DEC_GetImageBuffer, %function
REAL9DEC_GetImageBuffer:
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
	ldr	r0, [r4, #3480]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r0, [r4, #3480]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	beq	.L468
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L468:
	add	r1, r5, #56320
	ldr	r0, [r4, #3480]
	add	r1, r1, #56
	bl	FSP_ClearNotInVoQueue
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	REAL9DEC_GetImageBuffer, .-REAL9DEC_GetImageBuffer
	.align	2
	.global	REAL9DEC_Support
	.type	REAL9DEC_Support, %function
REAL9DEC_Support:
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
	.size	REAL9DEC_Support, .-REAL9DEC_Support
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
	.type	__FUNCTION__.14700, %object
	.size	__FUNCTION__.14700, 16
__FUNCTION__.14700:
	.ascii	"REAL9DEC_Decode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC3:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC7:
	ASCII(.ascii	"image size abnormal (%dx%d) in MB\012\000" )
	.space	1
.LC8:
	ASCII(.ascii	"real9 actual frame size(%dx%d) exeed max config(%dx" )
	ASCII(.ascii	"%d)\012\000" )
.LC9:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC11:
	ASCII(.ascii	"Decoding quits at frm %d\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"ERROR: frm %d, Invalid packet pointer!\012\000" )
.LC13:
	ASCII(.ascii	"Real9_CB_GetPictureHeader Error!\012\000" )
	.space	2
.LC14:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"pic width/height to large,MbWidth = %d, MbHeight = " )
	ASCII(.ascii	"%d\000" )
	.space	2
.LC16:
	ASCII(.ascii	"new seq size %d * %d\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"Real9_ArrangeVHBMem err\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"Fatal Error: frm%d, get image buffer failed\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"dec_pts: %lld Usertag = %lld\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"---------- unref %d\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"++++++++++ ref %d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"CurFsID abnormal!,%s %d (NULL == pCur) || (NULL == " )
	ASCII(.ascii	"pFwd) || (NULL == pBwd)!!\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"CurFsID abnormal!\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"dec addr: cur,cur2d,fwd,bwd,currpmv,colpmv = %p,%p," )
	ASCII(.ascii	"%p,%p,%p,%p\012\000" )
.LC25:
	ASCII(.ascii	"line:%d! i > (RV9_MAX_SLC_PARAM_NUM - 2)\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"ErrRatio = %d\012\000" )
	.space	1
.LC27:
	ASCII(.ascii	"DEBUG: DEC over\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"insert buf %d ref %d\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
