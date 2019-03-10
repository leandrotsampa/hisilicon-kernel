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
	.file	"fsp.c"
	.text
	.align	2
	.type	FSP_IsSpecialFrm.part.2, %function
FSP_IsSpecialFrm.part.2:
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
	ldr	r3, .L12
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	r3, r1, #1
	cmn	r3, #3
	bhi	.L6
	add	r3, r0, #311296
	ldr	lr, [r3, #3456]
	cmp	lr, #0
	beq	.L6
	ldr	r3, [r3, #2948]
	cmp	r1, r3
	beq	.L9
	mov	r2, #0
	b	.L3
.L4:
	ldr	r3, [r0, r3]
	cmp	r1, r3
	beq	.L9
.L3:
	add	r2, r2, #1
	movw	r3, #52100
	cmp	r2, lr
	movt	r3, 4
	mov	ip, r2, asl #4
	add	r3, ip, r3
	bne	.L4
.L6:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L9:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_IsSpecialFrm.part.2, .-FSP_IsSpecialFrm.part.2
	.align	2
	.global	FSP_IsSpecialFrm
	.type	FSP_IsSpecialFrm, %function
FSP_IsSpecialFrm:
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
	cmp	r0, #31
	bgt	.L15
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_IsSpecialFrm.part.2
.L15:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsSpecialFrm, .-FSP_IsSpecialFrm
	.align	2
	.global	FSP_Init
	.type	FSP_Init, %function
FSP_Init:
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
	ldr	r4, .L19
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L19+4
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #8448
	mov	r1, #0
	ldr	r0, .L19+8
	blx	r3
	ldr	r3, .L19+8
	mvn	r1, #0
	add	r2, r3, #8448
.L17:
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #264
	cmp	r3, r2
	bne	.L17
	ldr	r3, .L19+12
	mov	ip, #0
	ldr	lr, [r4, #48]
	mov	r1, ip
	add	r0, r3, #396
	mov	r2, #16
	str	ip, [r3, #392]
	mov	r3, lr
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L20:
	.align	2
.L19:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR0+128
	.word	.LANCHOR1
	UNWIND(.fnend)
	.size	FSP_Init, .-FSP_Init
	.align	2
	.global	FSP_ConfigAttribute
	.type	FSP_ConfigAttribute, %function
FSP_ConfigAttribute:
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
	cmp	r0, #31
	bhi	.L25
	ldr	r3, .L27
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L26
	ldrb	r2, [r1]	@ zero_extendqisi2
	mov	r0, #0
	strb	r2, [r3, #1]
	ldmfd	sp, {fp, sp, pc}
.L26:
	ldr	r3, .L27+4
	mov	r2, #236
	ldr	r1, .L27+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L25:
	ldr	r3, .L27+12
	mov	r2, #235
	ldr	r1, .L27+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	.word	.LC0
	UNWIND(.fnend)
	.size	FSP_ConfigAttribute, .-FSP_ConfigAttribute
	.align	2
	.global	FSP_ClearContext
	.type	FSP_ClearContext, %function
FSP_ClearContext:
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
	subs	r5, r0, #0
	beq	.L32
	ldr	r6, .L33
	add	r3, r5, #28672
	mov	r4, #0
	mov	r2, #32
	strb	r4, [r5, #8]
	mov	r1, r4
	strb	r4, [r5, #9]
	add	r0, r5, #20
	strb	r4, [r5, #11]
	strb	r4, [r5, #12]
	strb	r4, [r5, #13]
	strb	r4, [r5, #10]
	strb	r4, [r5, #14]
	str	r4, [r5, #16]
	str	r4, [r3, #996]
	ldr	ip, [r6, #48]
	str	r4, [r3, #1260]
	str	r4, [r3, #1264]
	str	r4, [r3, #1268]
	str	r4, [r3, #1256]
	blx	ip
	add	r0, r5, #22528
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #100
	add	r0, r0, #56
	blx	r3
	add	r0, r5, #22528
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #3200
	add	r0, r0, #156
	blx	r3
	add	r0, r5, #25856
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #3200
	add	r0, r0, #28
	blx	r3
	add	r0, r5, #28928
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #200
	add	r0, r0, #156
	blx	r3
	add	r0, r5, #29184
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #384
	add	r0, r0, #100
	blx	r3
	add	r0, r5, #29440
	ldr	r3, [r6, #48]
	mov	r1, r4
	mov	r2, #256
	add	r0, r0, #232
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L32:
	ldr	r3, .L33+4
	mov	r2, #252
	ldr	r1, .L33+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_ClearContext, .-FSP_ClearContext
	.align	2
	.global	FSP_ClearContextAll
	.type	FSP_ClearContextAll, %function
FSP_ClearContextAll:
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
	subs	r4, r0, #0
	beq	.L38
	ldr	ip, .L39
	add	r5, r4, #28672
	ldrb	r3, [r4]	@ zero_extendqisi2
	movw	r2, #29944
	mov	r1, #0
	ldrb	r8, [r4, #10]	@ zero_extendqisi2
	ldr	ip, [ip, #48]
	ldr	r6, [r5, #1256]
	ldrb	r7, [r4, #13]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldrb	r10, [r4, #1]	@ zero_extendqisi2
	ldr	r9, [r4, #4]
	blx	ip
	ldr	r3, [fp, #-48]
	mov	r0, #0
	strb	r10, [r4, #1]
	str	r9, [r4, #4]
	strb	r3, [r4]
	strb	r8, [r4, #10]
	strb	r7, [r4, #13]
	str	r6, [r5, #1256]
.L37:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L38:
	ldr	r3, .L39+4
	mov	r2, #292
	ldr	r1, .L39+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L37
.L40:
	.align	2
.L39:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_ClearContextAll, .-FSP_ClearContextAll
	.align	2
	.global	FSP_EnableInstance
	.type	FSP_EnableInstance, %function
FSP_EnableInstance:
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
	cmp	r0, #31
	mov	r6, r0
	bhi	.L46
	ldr	r3, .L48
	ldr	r4, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L47
	ldr	r5, [r4, #4]
	cmp	r5, #0
	bne	.L45
	ldr	r3, .L48+4
	movw	r2, #29944
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
	add	r3, r4, #28672
	strb	r6, [r4]
	mov	r2, #1
	mov	r0, r5
	str	r2, [r4, #4]
	str	r5, [r3, #1256]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L45:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L46:
	ldr	r3, .L48+8
	mov	r2, #320
	ldr	r1, .L48+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L47:
	mov	r0, r4
	ldr	r3, .L48+16
	movw	r2, #321
	ldr	r1, .L48+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_EnableInstance, .-FSP_EnableInstance
	.align	2
	.global	FSP_DisableInstance
	.type	FSP_DisableInstance, %function
FSP_DisableInstance:
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
	cmp	r0, #31
	bhi	.L54
	ldr	r3, .L56
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L55
	ldr	r3, [r0, #4]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r0, #4]
	ldmfd	sp, {fp, sp, pc}
.L54:
	ldr	r3, .L56+4
	movw	r2, #343
	ldr	r1, .L56+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L55:
	ldr	r3, .L56+12
	mov	r2, #344
	ldr	r1, .L56+8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_DisableInstance, .-FSP_DisableInstance
	.align	2
	.global	FSP_Exit
	.type	FSP_Exit, %function
FSP_Exit:
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
	ldr	r5, .L69
	mov	r4, #0
	b	.L60
.L59:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L68
.L60:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L59
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L59
	mov	r0, r4
	add	r4, r4, #1
	bl	FSP_DisableInstance
	cmp	r4, #32
	bne	.L60
.L68:
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L70:
	.align	2
.L69:
	.word	.LANCHOR0-4
	UNWIND(.fnend)
	.size	FSP_Exit, .-FSP_Exit
	.align	2
	.global	FSP_ResetInstance
	.type	FSP_ResetInstance, %function
FSP_ResetInstance:
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
	cmp	r0, #31
	mov	r6, r0
	bhi	.L92
	ldr	r3, .L98
	ldr	r7, [r3, r0, asl #2]
	cmp	r7, #0
	beq	.L93
	ldr	r9, .L98+4
	add	r4, r7, #22528
	add	r5, r7, #25856
	add	r4, r4, #158
	add	r5, r5, #30
	mov	r8, r9
	b	.L81
.L78:
	ldrsb	r3, [r4]
	cmp	r3, #0
	bne	.L94
.L76:
	add	r4, r4, #100
	cmp	r4, r5
	beq	.L95
.L81:
	ldr	r1, [r4, #14]
	cmp	r1, #0
	beq	.L76
	ldr	r3, [r9, #392]
	cmp	r3, #0
	beq	.L76
	ldrsb	r3, [r4, #-2]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [r8, #408]
	cmp	r3, #0
	beq	.L96
	mov	r2, #0
	mov	r0, r6
	blx	r3
	ldrsb	r3, [r4]
	cmp	r3, #0
	beq	.L76
.L94:
	ldr	r3, [r9, #404]
	ldr	r1, [r4, #14]
	cmp	r3, #0
	beq	.L97
	mov	r0, r6
	add	r4, r4, #100
	blx	r3
	cmp	r4, r5
	bne	.L81
.L95:
	mov	r0, r7
	bl	FSP_ClearContext
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L92:
	ldr	r3, .L98+8
	mov	r2, #364
	ldr	r1, .L98+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L97:
	mov	r0, r3
	ldr	r1, .L98+16
	bl	dprint_vfmw
	b	.L76
.L96:
	mov	r0, r3
	ldr	r1, .L98+20
	bl	dprint_vfmw
	b	.L78
.L93:
	mov	r0, r7
	ldr	r3, .L98+24
	movw	r2, #365
	ldr	r1, .L98+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.word	.LC1
	.word	.LC6
	.word	.LC5
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_ResetInstance, .-FSP_ResetInstance
	.align	2
	.global	FSP_EmptyInstance
	.type	FSP_EmptyInstance, %function
FSP_EmptyInstance:
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
	cmp	r0, #31
	mov	r8, r0
	bhi	.L136
	ldr	r3, .L142
	ldr	r7, [r3, r0, asl #2]
	cmp	r7, #0
	beq	.L137
	ldr	r3, .L142+4
	mov	r2, #22528
	mov	r1, #0
	add	r0, r7, #56
	ldr	r3, [r3, #48]
	blx	r3
	ldrsb	r3, [r7, #10]
	cmp	r3, #0
	ble	.L114
	ldr	r10, .L142+8
	add	r4, r7, #22528
	mov	r6, #0
	add	r4, r4, #248
	mov	r5, r6
	mov	r9, r10
	b	.L113
.L111:
	strb	r5, [r4, #-90]
.L112:
	strb	r5, [r4, #-92]
	add	r6, r6, #1
	strb	r5, [r4]
	add	r4, r4, #100
	str	r5, [r4, #-104]
	ldrsb	r3, [r7, #10]
	cmp	r3, r6
	ble	.L114
.L113:
	ldr	r1, [r4, #-76]
	cmp	r1, #0
	beq	.L107
	ldr	r3, [r10, #392]
	cmp	r3, #0
	beq	.L107
	ldrsb	r3, [r4, #-92]
	cmp	r3, #0
	bne	.L138
.L108:
	ldrsb	r3, [r4, #-90]
	cmp	r3, #0
	bne	.L139
.L107:
	cmp	r8, #31
	bgt	.L111
	mov	r0, r8
	bl	FSP_IsSpecialFrm.part.2
	cmp	r0, #1
	bne	.L111
	mov	r3, #4
	strb	r3, [r4, #-90]
	b	.L112
.L114:
	ldrsb	r10, [r7, #11]
	cmp	r10, #0
	ble	.L106
	add	r4, r7, #25856
	mov	r6, #0
	add	r4, r4, #44
	mov	r5, r6
	mov	r9, #4
	b	.L119
.L117:
	strb	r5, [r4, #-14]
.L118:
	add	r6, r6, #1
	strb	r5, [r4, #-16]
	cmp	r6, r10
	strb	r5, [r4, #76]
	str	r5, [r4, #72]
	add	r4, r4, #100
	beq	.L106
.L119:
	cmp	r8, #31
	ldr	r1, [r4]
	bgt	.L117
	mov	r0, r8
	bl	FSP_IsSpecialFrm.part.2
	cmp	r0, #1
	bne	.L117
	strb	r9, [r4, #-14]
	b	.L118
.L106:
	ldrsb	r1, [r7, #13]
	cmp	r1, #0
	ble	.L116
	add	r3, r7, #29440
	mov	r2, #0
	add	r3, r3, #236
	mov	ip, r2
	mov	r0, #1
.L120:
	add	r2, r2, #1
	strb	r0, [r3]
	cmp	r1, r2
	strb	ip, [r3, #1]
	add	r3, r3, #8
	bne	.L120
.L116:
	mov	r0, #0
	str	r0, [r7, #16]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L139:
	ldr	r3, [r10, #404]
	cmp	r3, #0
	beq	.L140
	mov	r0, r8
	blx	r3
	ldr	r1, [r4, #-76]
	b	.L107
.L138:
	ldr	r3, [r9, #408]
	cmp	r3, #0
	beq	.L141
	mov	r2, #0
	mov	r0, r8
	blx	r3
	ldr	r1, [r4, #-76]
	b	.L108
.L136:
	ldr	r3, .L142+12
	movw	r2, #419
	ldr	r1, .L142+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L137:
	mov	r0, r7
	ldr	r3, .L142+20
	mov	r2, #420
	ldr	r1, .L142+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L141:
	ldr	r1, .L142+24
	mov	r0, r3
	bl	dprint_vfmw
	ldr	r1, [r4, #-76]
	b	.L108
.L140:
	ldr	r1, .L142+28
	mov	r0, r3
	bl	dprint_vfmw
	ldr	r1, [r4, #-76]
	b	.L107
.L143:
	.align	2
.L142:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	FSP_EmptyInstance, .-FSP_EmptyInstance
	.align	2
	.global	FSP_GetUsedBufferNum
	.type	FSP_GetUsedBufferNum, %function
FSP_GetUsedBufferNum:
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
	ldr	r3, .L150
	movw	r2, #2026
	ldr	r3, [r3, r0, asl #2]
	add	r1, r3, #278528
	ldrsb	ip, [r1, r2]
	cmp	ip, #0
	ble	.L148
	add	r3, r3, #303104
	mov	r0, #0
	add	r3, r3, #126
	mov	r2, r0
.L147:
	ldrsb	r1, [r3]
	add	r2, r2, #1
	add	r3, r3, #100
	cmp	r1, #3
	addeq	r0, r0, #1
	cmp	r2, ip
	bne	.L147
	ldmfd	sp, {fp, sp, pc}
.L148:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L151:
	.align	2
.L150:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_GetUsedBufferNum, .-FSP_GetUsedBufferNum
	.align	2
	.global	FSP_ConfigInstance
	.type	FSP_ConfigInstance, %function
FSP_ConfigInstance:
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
	cmp	r0, #31
	bhi	.L162
	cmp	r1, #0
	beq	.L163
	ldr	r3, .L165
	ldr	r4, [r3, r0, asl #2]
	cmp	r4, #0
	beq	.L156
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L156
	ldr	r3, .L165+4
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #307200
	ldr	r3, [r3, #3288]
	cmp	r3, #0
	beq	.L164
.L158:
	ldr	r3, .L165+8
	add	r0, r4, #20
	mov	r2, #32
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
.L154:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L164:
	mov	r0, r4
	str	r1, [fp, #-24]
	bl	FSP_ClearContext
	ldr	r1, [fp, #-24]
	b	.L158
.L156:
	ldr	r3, .L165+12
	movw	r2, #547
	ldr	r1, .L165+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L154
.L162:
	ldr	r3, .L165+20
	mov	r2, #544
	ldr	r1, .L165+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L154
.L163:
	mov	r0, r1
	ldr	r3, .L165+24
	movw	r2, #545
	ldr	r1, .L165+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L154
.L166:
	.align	2
.L165:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC8
	.word	.LC1
	.word	.LC0
	.word	.LC7
	UNWIND(.fnend)
	.size	FSP_ConfigInstance, .-FSP_ConfigInstance
	.align	2
	.global	FSP_CheckCapLevel
	.type	FSP_CheckCapLevel, %function
FSP_CheckCapLevel:
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
	ldr	r3, .L179
	ldr	r1, .L179+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r5, [r1, r0, asl #2]
	add	r3, r3, #311296
	ldr	r4, [r3, #3468]
	cmp	r4, #0
	beq	.L168
.L172:
	mov	r0, #0
.L176:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L168:
	bl	VCTRL_GetChanCapLevel
	cmp	r0, #32
	bhi	.L170
	ldr	r2, .L179+8
	mov	r3, r0, asl #5
	sub	r3, r3, r0, asl #2
	ldr	r1, [r5, #28]
	add	lr, r2, r3
	ldr	ip, [r5, #32]
	ldr	r3, [r2, r3]
	ldr	lr, [lr, #4]
	mul	r6, ip, r1
	mul	r2, lr, r3
	cmp	r0, #25
	cmpne	r6, r2
	ble	.L172
	ldrsb	r2, [r5, #22]
	cmp	r2, #1
	beq	.L172
	stmib	sp, {r1, ip}
	mov	r2, r0
	str	lr, [sp]
	mov	r0, r4
	ldr	r1, .L179+12
	bl	dprint_vfmw
	b	.L173
.L170:
	ldrsb	r3, [r5, #22]
	cmp	r3, #1
	beq	.L172
	mov	r2, r0
	ldr	r1, .L179+16
	mov	r0, r4
	bl	dprint_vfmw
.L173:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r5, #9]
	b	.L176
.L180:
	.align	2
.L179:
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	CapItem
	.word	.LC10
	.word	.LC9
	UNWIND(.fnend)
	.size	FSP_CheckCapLevel, .-FSP_CheckCapLevel
	.align	2
	.global	FSP_RecordSpecialFrame
	.type	FSP_RecordSpecialFrame, %function
FSP_RecordSpecialFrame:
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
	ldr	r2, .L190
	ldr	r3, .L190+4
	ldr	r4, [r2, r0, asl #2]
	ldr	r1, [r3, r0, asl #2]
	add	lr, r4, #311296
	ldr	r2, [lr, #3460]
	cmp	r2, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, [lr, #3456]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r3, r1, #28672
	mov	ip, #100
	mov	r5, #4
	ldr	r3, [r3, #1260]
	mla	ip, ip, r3, r1
	add	r3, ip, #22528
	add	ip, r3, #152
	ldr	r0, [r3, #172]
.L185:
	mov	r1, r2, asl #4
	movw	r3, #52100
	movt	r3, 4
	add	r3, r1, r3
	add	r2, r2, #1
	ldr	r3, [r4, r3]
	cmp	r0, r3
	streqb	r5, [ip, #6]
	ldr	r3, [lr, #3456]
	cmp	r3, r2
	bhi	.L185
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L191:
	.align	2
.L190:
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_RecordSpecialFrame, .-FSP_RecordSpecialFrame
	.align	2
	.global	FSP_ConfigFrameBuf
	.type	FSP_ConfigFrameBuf, %function
FSP_ConfigFrameBuf:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r7, r0
	ldr	r0, .L251
	mov	r9, r1
	mov	r10, r2
	mov	r1, #0
	movw	r2, #1368
	str	r3, [fp, #-56]
	ldr	ip, [r0, #48]
	ldr	r0, .L251+4
	blx	ip
	cmp	r7, #31
	bhi	.L244
	ldr	r3, .L251+8
	ldr	r5, [r3, r7, asl #2]
	cmp	r5, #0
	beq	.L245
	mov	r0, r7
	bl	FSP_CheckCapLevel
	subs	r3, r0, #0
	str	r3, [fp, #-52]
	bne	.L241
	ldr	r6, .L251+12
	ldr	ip, [r5, #28]
	ldr	lr, [r5, #32]
	ldr	r1, [r6, r7, asl #2]
	mul	r8, lr, ip
	ldr	r2, [r1, #164]
	ldr	r3, [r1, #168]
	mul	r4, r3, r2
	cmp	r8, r4
	bgt	.L246
	ldr	r3, [r1, #1384]
	ldrsb	r8, [r5, #23]
	cmp	r3, #1
	add	r3, r1, #307200
	beq	.L247
.L199:
	ldr	r2, [r3, #3296]
	ldr	r0, .L251+16
	cmp	r8, r2
	ldr	ip, [r0, #64]
	movne	r2, #1
	moveq	r2, #0
	str	r2, [r3, #3312]
	ldrsb	r2, [r5, #23]
	cmp	ip, #0
	str	r2, [r3, #3296]
	beq	.L203
	ldr	r4, .L251+20
	mov	r0, r9
	ldr	r3, [r5, #32]
	mov	r9, #32
	ldr	r2, [r5, #28]
	add	lr, r4, #412
	str	r7, [sp, #12]
	mov	r1, r10
	str	lr, [sp, #16]
	ldrsb	lr, [r5, #22]
	str	r9, [sp, #4]
	ldr	r9, .L251+12
	str	lr, [sp, #8]
	ldrsb	lr, [r5, #26]
	str	lr, [sp]
	blx	ip
	ldr	r3, [r6, r7, asl #2]
	add	r3, r3, #311296
	ldr	r3, [r3, #2872]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #13]
	cmp	r0, #2
	mov	r10, r0
	beq	.L248
	cmp	r0, #0
	bne	.L206
	ldr	r3, [r4, #1492]
	mov	r0, #31
	ldr	r1, .L251+24
	strb	r3, [r5, #9]
	ldr	r3, [r9, r7, asl #2]
	str	r10, [r3, #1424]
	strb	r10, [r3, #1452]
	bl	dprint_vfmw
	ldr	r3, [r4, #1492]
	cmp	r8, r3
	bgt	.L249
	ldrsb	r3, [r5, #1]
	strb	r10, [r5, #11]
	cmp	r3, #0
	strb	r10, [r5, #12]
	bne	.L250
.L209:
	ldr	r3, [r4, #1492]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #10]
.L210:
	ldr	r3, .L251
	mov	r0, #8
	add	r6, r5, #28672
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r3, [r4, #1760]
	cmp	r3, #0
	beq	.L215
	ldr	r8, .L251+4
	mov	r1, #0
	ldr	r0, [r6, #1260]
	mov	r9, r1
	add	r10, r8, #388
	str	r7, [fp, #-48]
	mov	r7, r6
	mov	r6, r10
	mov	r10, r8
	mov	r8, r1
.L214:
	mov	r3, #100
	ldr	r1, [r4, #412]
	mla	r3, r3, r0, r5
	add	r8, r8, #1
	add	r2, r3, #22528
	mov	ip, r2
	str	r0, [r2, #164]
	ldr	r2, [r10, #8]
	mov	r0, ip
	str	r2, [ip, #172]
	mov	r2, ip
	ldr	lr, [r10, #12]!
	str	lr, [ip, #176]
	ldr	lr, [r6, #4]!
	str	lr, [r0, #184]
	mov	r0, ip
	str	r1, [r2, #188]
	mov	lr, ip
	ldr	r1, [r4, #1464]
	str	r1, [ip, #204]
	ldr	r1, [r4, #1472]
	str	r1, [ip, #208]
	ldr	r1, [r4, #1476]
	str	r1, [r0, #212]
	ldr	r1, [r4, #1456]
	str	r1, [r0, #216]
	ldr	r1, [r4, #1460]
	str	r1, [r0, #220]
	ldr	r0, [r6, #512]
	ldr	r1, [r4, #1448]
	str	r0, [r2, #192]
	ldr	r2, [r4, #1444]
	str	r1, [ip, #200]
	ldr	r1, [r4, #1480]
	str	r2, [ip, #196]
	mov	r2, ip
	ldr	r0, [r5, #28]
	str	r0, [lr, #224]
	ldr	lr, [r5, #32]
	str	r1, [r2, #232]
	ldr	r0, [fp, #-48]
	str	lr, [r2, #228]
	ldr	r2, [r4, #1484]
	str	r2, [ip, #236]
	ldr	r2, [r4, #1488]
	strb	r9, [ip, #156]
	strb	r9, [ip, #157]
	str	r2, [ip, #240]
	strb	r9, [ip, #158]
	bl	FSP_RecordSpecialFrame
	ldr	r3, [r7, #1260]
	mov	r1, #100
	mov	r2, #1
	add	r0, r3, r2
	ldr	ip, [r4, #1760]
	mla	r3, r1, r3, r5
	cmp	ip, r8
	add	r3, r3, #22528
	str	r2, [r3, #252]
	str	r0, [r7, #1260]
	bhi	.L214
	mov	r6, r7
.L215:
	ldr	r0, [r4, #1768]
	cmp	r0, #0
	beq	.L213
	ldr	ip, [r6, #1268]
	mov	r1, #100
	ldr	r2, .L251+4
	mov	r3, #0
	mla	r1, r1, ip, r5
	add	r1, r1, #22528
	add	r1, r1, #180
.L218:
	ldr	lr, [r2, #520]
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, #12
	str	lr, [r1], #100
	bne	.L218
	add	r3, ip, r3
	str	r3, [r6, #1268]
.L213:
	mov	lr, #0
	mov	r7, #1
	strb	r7, [r5, #12]
	str	lr, [r6, #420]
	ldrsb	r3, [r5, #10]
	ldr	r2, [r4, #1464]
	cmp	r3, #31
	ldr	r1, [r4, #1476]
	ldr	r0, [r4, #1472]
	movge	r3, #31
	str	r2, [r6, #460]
	mov	r2, r3, asl #4
	str	r1, [r6, #468]
	sub	r3, r2, r3, asl #2
	ldr	r8, [r4, #412]
	add	r3, r4, r3
	str	r0, [r6, #464]
	ldr	r2, [r4, #1480]
	ldr	r1, [r3, #420]
	str	r8, [r6, #444]
	ldr	r3, [r4, #1756]
	str	r1, [r6, #428]
	ldr	r1, [r5, #28]
	cmp	r3, #32
	ldr	r0, [r4, #1488]
	movge	r3, #32
	mov	ip, r1
	str	r1, [fp, #-48]
	str	ip, [r6, #480]
	ldr	r1, [r4, #1484]
	ldr	r10, [r5, #32]
	strb	lr, [r6, #412]
	strb	lr, [r6, #413]
	str	r10, [r6, #484]
	strb	lr, [r6, #414]
	str	r7, [r6, #508]
	str	r2, [r6, #488]
	str	r1, [r6, #492]
	str	r0, [r6, #496]
	strb	r3, [r5, #13]
	ldr	r9, [r4, #1764]
	cmp	r9, lr
	beq	.L217
	ldr	r3, [r6, #1264]
	ldr	r0, .L251+4
	add	r2, r3, #3696
	add	r9, r3, r9
	add	r2, r2, #13
	add	r1, r5, r2, lsl #3
.L219:
	ldr	ip, [r0, #1084]
	add	r3, r3, #1
	cmp	r3, r9
	add	r0, r0, #8
	add	r1, r1, #8
	str	ip, [r1, #-8]
	add	ip, r5, r2, lsl #3
	add	r2, r3, #3696
	strb	lr, [ip, #5]
	add	r2, r2, #13
	strb	r7, [r1, #-4]
	bne	.L219
	str	r3, [r6, #1264]
.L217:
	ldr	r0, [r4, #1752]
	add	r5, r5, #20480
	ldr	ip, [r4, #1464]
	mov	r3, #0
	ldr	r1, [r4, #1472]
	mov	r2, #1
	str	r0, [r6, #996]
	mov	r0, #8
	str	r8, [r5, #2136]
	ldr	r8, [fp, #-48]
	ldr	r6, [r4, #1476]
	ldr	r7, [r4, #1480]
	ldr	r9, [r4, #1488]
	ldr	lr, [r5, #2220]
	str	r8, [r5, #2172]
	str	r3, [r5, #2112]
	ldr	r8, [r4, #1484]
	strb	r3, [r5, #2104]
	strb	r3, [r5, #2105]
	strb	r3, [r5, #2106]
	ldr	r4, [r4, #416]
	ldr	r3, [fp, #-56]
	str	r10, [r5, #2176]
	str	lr, [r5, #2120]
	str	ip, [r5, #2152]
	str	r1, [r5, #2156]
	str	r6, [r5, #2160]
	str	r7, [r5, #2180]
	str	r8, [r5, #2184]
	str	r9, [r5, #2188]
	str	r2, [r5, #2200]
	str	r4, [r3]
	ldr	r3, .L251
	ldr	r3, [r3, #16]
	blx	r3
	ldr	r0, [fp, #-52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L246:
	stmia	sp, {ip, lr}
	ldr	r1, .L251+28
	bl	dprint_vfmw
	ldr	r3, .L251+32
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L241
	ldr	r3, [fp, #-52]
	mov	r0, r7
	mov	r1, #102
	mov	r2, r3
	blx	ip
.L241:
	mvn	r3, #0
	str	r3, [fp, #-52]
.L224:
	ldr	r0, [fp, #-52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L248:
	ldr	r3, [r4, #1492]
	mov	r2, #1
	str	r0, [fp, #-52]
	ldr	r0, [fp, #-52]
	strb	r3, [r5, #9]
	ldr	r3, [r9, r7, asl #2]
	str	r2, [r3, #1424]
	strb	r2, [r3, #1452]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L247:
	ldr	r2, [r3, #3272]
	bics	r0, r2, #2
	beq	.L199
	cmp	r2, #1
	beq	.L224
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	mvn	r2, #0
	ldr	r1, .L251+36
	mov	r0, #31
	str	r2, [fp, #-52]
	strb	r3, [r5, #9]
	ldr	r3, [r6, r7, asl #2]
	add	r3, r3, #307200
	ldr	r2, [r3, #3272]
	bl	dprint_vfmw
	b	.L224
.L203:
	add	r1, r1, #311296
	mvn	r10, #0
	ldr	r3, [r1, #2872]
	cmp	r3, #32
	movge	r3, #32
	strb	r3, [r5, #13]
.L206:
	mov	r3, #0
	strb	r3, [r5, #9]
	ldr	ip, [r6, r7, asl #2]
	mov	r2, r10
	mov	r0, r3
	ldr	r1, .L251+40
	mvn	lr, #0
	str	lr, [fp, #-52]
	str	r3, [ip, #1424]
	strb	r3, [ip, #1452]
	bl	dprint_vfmw
	b	.L224
.L250:
	ldr	r3, [r9, r7, asl #2]
	ldr	r3, [r3, #1384]
	cmp	r3, #1
	beq	.L209
	ldrsb	r3, [r5, #23]
	ldr	r2, [r4, #1492]
	add	r3, r3, #7
	cmp	r3, r2
	movge	r3, r2
	strb	r3, [r5, #10]
	b	.L210
.L244:
	ldr	r3, .L251+44
	movw	r2, #661
	ldr	r1, .L251+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r3, #0
	str	r3, [fp, #-52]
	b	.L224
.L245:
	ldr	r3, .L251+52
	mov	r0, r5
	movw	r2, #662
	ldr	r1, .L251+48
	bl	dprint_vfmw
	mvn	r3, #0
	str	r3, [fp, #-52]
	b	.L224
.L249:
	str	r3, [sp]
	mov	r2, r10
	mov	r3, r8
	mov	r0, r10
	ldr	r1, .L251+56
	mvn	ip, #0
	str	ip, [fp, #-52]
	bl	dprint_vfmw
	ldr	r3, .L251
	mov	r0, #8
	ldr	r3, [r3, #16]
	blx	r3
	b	.L224
.L252:
	.align	2
.L251:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+412
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR1
	.word	.LC13
	.word	.LC11
	.word	g_event_report
	.word	.LC12
	.word	.LC14
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.word	.LC15
	UNWIND(.fnend)
	.size	FSP_ConfigFrameBuf, .-FSP_ConfigFrameBuf
	.align	2
	.global	FSP_GetDecodeFrameTable
	.type	FSP_GetDecodeFrameTable, %function
FSP_GetDecodeFrameTable:
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
	cmp	r0, #31
	bhi	.L264
	cmp	r1, #0
	moveq	r0, r1
	ldreq	r3, .L266
	movweq	r2, #891
	beq	.L263
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L266+4
	moveq	r2, #892
	beq	.L263
	ldr	r3, .L266+8
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L265
	ldrsb	r3, [r0, #10]
	str	r3, [r2]
	ldrsb	r3, [r0, #10]
	cmp	r3, #0
	ldmlefd	sp, {fp, sp, pc}
	add	r2, r0, #22528
	sub	r1, r1, #4
	add	r2, r2, #172
	mov	r3, #0
.L260:
	ldr	ip, [r2], #100
	add	r3, r3, #1
	str	ip, [r1, #4]!
	ldrsb	ip, [r0, #10]
	cmp	ip, r3
	bgt	.L260
	ldmfd	sp, {fp, sp, pc}
.L264:
	ldr	r3, .L266+12
	movw	r2, #890
	ldr	r1, .L266+16
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L265:
	ldr	r3, .L266+20
	movw	r2, #893
.L263:
	ldr	r1, .L266+16
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L267:
	.align	2
.L266:
	.word	.LC16
	.word	.LC17
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetDecodeFrameTable, .-FSP_GetDecodeFrameTable
	.align	2
	.global	FSP_GetDecodePmvTable
	.type	FSP_GetDecodePmvTable, %function
FSP_GetDecodePmvTable:
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
	cmp	r0, #31
	bhi	.L279
	cmp	r1, #0
	moveq	r0, r1
	ldreq	r3, .L281
	movweq	r2, #917
	beq	.L278
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L281+4
	movweq	r2, #918
	beq	.L278
	ldr	r3, .L281+8
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L280
	ldrsb	r3, [r0, #13]
	str	r3, [r2]
	ldrsb	r3, [r0, #13]
	cmp	r3, #0
	ldmlefd	sp, {fp, sp, pc}
	sub	r1, r1, #4
	mov	r2, #0
.L275:
	mov	r3, r2, asl #3
	add	r2, r2, #1
	add	r3, r3, #29440
	add	r3, r3, #232
	ldr	r3, [r0, r3]
	str	r3, [r1, #4]!
	ldrsb	r3, [r0, #13]
	cmp	r3, r2
	bgt	.L275
	ldmfd	sp, {fp, sp, pc}
.L279:
	ldr	r3, .L281+12
	mov	r2, #916
	ldr	r1, .L281+16
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L280:
	ldr	r3, .L281+20
	movw	r2, #919
.L278:
	ldr	r1, .L281+16
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L282:
	.align	2
.L281:
	.word	.LC16
	.word	.LC17
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetDecodePmvTable, .-FSP_GetDecodePmvTable
	.align	2
	.global	FSP_IsFsLeak
	.type	FSP_IsFsLeak, %function
FSP_IsFsLeak:
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
	ldr	r3, .L286
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L284
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L284:
	ldr	r1, .L286+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L287:
	.align	2
.L286:
	.word	.LANCHOR0
	.word	.LC18
	UNWIND(.fnend)
	.size	FSP_IsFsLeak, .-FSP_IsFsLeak
	.align	2
	.global	FSP_GetOccupiedNum
	.type	FSP_GetOccupiedNum, %function
FSP_GetOccupiedNum:
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
	cmp	r0, #1088
	bgt	.L290
	ldr	r3, .L292
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #311296
	ldr	r3, [r3, #3504]
	cmp	r3, #0
	movne	r0, #1
	moveq	r0, #4
	ldmfd	sp, {fp, sp, pc}
.L290:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L293:
	.align	2
.L292:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_GetOccupiedNum, .-FSP_GetOccupiedNum
	.align	2
	.global	FSP_IsDecFsAvailable
	.type	FSP_IsDecFsAvailable, %function
FSP_IsDecFsAvailable:
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
	ldr	r3, [r1, #96]
	cmp	r3, #1
	beq	.L299
.L297:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L299:
	ldr	r2, [r1]
	bic	r2, r2, #-16777216
	bic	r2, r2, #65280
	cmp	r2, #0
	bne	.L297
	cmp	r0, #31
	ldr	r1, [r1, #16]
	ble	.L300
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L300:
	bl	FSP_IsSpecialFrm.part.2
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsDecFsAvailable, .-FSP_IsDecFsAvailable
	.align	2
	.global	FSP_IsPmvAvailable
	.type	FSP_IsPmvAvailable, %function
FSP_IsPmvAvailable:
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
	ldrh	r0, [r0, #4]
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_IsPmvAvailable, .-FSP_IsPmvAvailable
	.align	2
	.global	FindLeastTickPhyFs
	.type	FindLeastTickPhyFs, %function
FindLeastTickPhyFs:
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
	mov	r2, r0
	mov	r0, #0
	ble	.L306
	mvn	lr, #0
	mov	r3, r0
.L305:
	ldr	ip, [r2, #88]
	add	r2, r2, #96
	cmp	ip, lr
	movcc	r0, r3
	add	r3, r3, #1
	movcc	lr, ip
	cmp	r3, r1
	bne	.L305
	ldmfd	sp, {fp, sp, pc}
.L306:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FindLeastTickPhyFs, .-FindLeastTickPhyFs
	.align	2
	.global	FSP_FindEmptyLogicFs
	.type	FSP_FindEmptyLogicFs, %function
FSP_FindEmptyLogicFs:
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
	mov	r2, #0
	mov	r3, r0
.L311:
	ldrsb	r1, [r3, #56]
	cmp	r1, #0
	bne	.L309
	ldrsb	r1, [r3, #57]
	cmp	r1, #0
	beq	.L313
.L309:
	add	r2, r2, #1
	add	r3, r3, #704
	cmp	r2, #32
	bne	.L311
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L313:
	mov	r3, #704
	mul	r3, r3, r2
	add	ip, r0, r3
	add	r3, r3, #56
	add	r0, r0, r3
	strb	r2, [ip, #59]
	strb	r1, [ip, #58]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FSP_FindEmptyLogicFs, .-FSP_FindEmptyLogicFs
	.align	2
	.global	FSP_FindEmptyDecodeFs
	.type	FSP_FindEmptyDecodeFs, %function
FSP_FindEmptyDecodeFs:
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
	ldr	r3, .L325
	mov	r6, r0
	mov	r7, r1
	ldr	r4, [r3, r0, asl #2]
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L315
	ldrsb	r8, [r4, #10]
	cmp	r8, #0
	ldmlefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r4, r4, #22528
	mov	r5, #0
	add	r4, r4, #156
	b	.L318
.L317:
	cmp	r5, r8
	add	r4, r4, #100
	beq	.L323
.L318:
	mov	r1, r4
	mov	r0, r6
	bl	FSP_IsDecFsAvailable
	add	r5, r5, #1
	cmp	r0, #1
	bne	.L317
	str	r4, [r7, #680]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L323:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L315:
	ldr	r3, .L325+4
	add	r5, r4, #22528
	add	r4, r4, #25856
	add	r5, r5, #156
	add	r4, r4, #28
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #610304
	ldr	r8, [r3, #2780]
	b	.L320
.L319:
	add	r5, r5, #100
	cmp	r5, r4
	beq	.L324
.L320:
	mov	r1, r5
	mov	r0, r6
	bl	FSP_IsDecFsAvailable
	cmp	r0, #1
	bne	.L319
	ldr	r3, [r5, #20]
	cmp	r3, r8
	bne	.L319
	str	r5, [r7, #680]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L324:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L326:
	.align	2
.L325:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_FindEmptyDecodeFs, .-FSP_FindEmptyDecodeFs
	.align	2
	.global	FSP_NewLogicFs
	.type	FSP_NewLogicFs, %function
FSP_NewLogicFs:
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
	cmp	r0, #31
	mov	r9, r0
	bhi	.L363
	ldr	r4, .L370
	ldr	r0, [r4, r0, asl #2]
	cmp	r0, #0
	beq	.L364
	ldr	r3, .L370+4
	mov	r0, #3
	str	r1, [fp, #-80]
	mov	r6, #0
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r5, [r4, r9, asl #2]
	ldr	r1, [fp, #-80]
	mov	r3, r5
.L333:
	ldrsb	r2, [r3, #56]
	cmp	r2, #0
	bne	.L331
	ldrsb	r7, [r3, #57]
	cmp	r7, #0
	beq	.L365
.L331:
	add	r6, r6, #1
	add	r3, r3, #704
	cmp	r6, #32
	bne	.L333
.L334:
	ldr	r1, .L370+8
	mov	r0, #0
	bl	dprint_vfmw
.L362:
	ldr	r3, .L370+4
	mov	r0, #3
	ldr	r3, [r3, #16]
	blx	r3
	mvn	r0, #0
.L360:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L365:
	mov	r4, #704
	mul	r4, r4, r6
	add	r10, r5, r4
	add	r4, r4, #56
	add	ip, r10, #56
	adds	r4, r5, r4
	strb	r6, [ip, #3]
	strb	r7, [ip, #2]
	beq	.L334
	add	r3, r10, #744
	cmp	r1, #0
	str	r7, [r10, #736]
	str	r7, [r10, #740]
	str	r7, [r10, #744]
	str	r7, [r3, #4]
	bne	.L335
	add	r1, r5, #28672
	add	r2, r5, #22528
	add	r2, r2, #56
	str	r2, [r10, #736]
	str	r2, [r10, #740]
	mov	r0, #1
	str	r2, [r10, #744]
	ldr	r2, [r1, #1000]
	str	r2, [r3, #4]
	ldrb	r3, [r5, #13]	@ zero_extendqisi2
	strb	r0, [ip, #2]
	sub	r3, r3, #1
	strb	r3, [ip, #4]
.L336:
	mov	r0, #704
	add	r3, r4, #576
	mul	r6, r0, r6
	str	r3, [fp, #-84]
	mov	lr, #1
	mov	r1, #0
	mov	r2, #664
	mov	r7, r1
	add	r3, r5, r6
	add	r0, r6, #64
	add	ip, r3, #56
	add	r0, r5, r0
	strb	lr, [ip, #1]
	add	r9, r4, #560
	ldr	r6, [r3, #740]
	mov	r8, ip
	add	r10, r4, #592
	strb	lr, [r6, #2]
	str	lr, [r3, #732]
	ldr	r6, [r3, #736]
	ldr	lr, [r5, #16]
	str	lr, [r3, #728]
	str	lr, [r6, #88]
	ldr	lr, [r3, #740]
	ldr	r6, [r3, #728]
	str	r6, [lr, #88]
	ldr	lr, [r5, #16]
	add	lr, lr, #1
	str	lr, [r5, #16]
	ldr	r5, [r3, #736]
	ldr	r6, [r3, #740]
	ldr	r3, [r3, #744]
	str	r3, [fp, #-88]
	ldr	r3, .L370+4
	ldr	ip, [r3, #48]
	blx	ip
	ldrsb	r2, [r8, #3]
	str	r8, [fp, #-80]
	str	r2, [r4, #188]
	ldr	r2, [r5, #68]
	str	r2, [r4, #136]
	ldr	r2, [r5, #72]
	str	r2, [r4, #140]
	ldr	r2, [r6, #32]
	str	r2, [r4, #172]
	ldr	r2, [r6, #60]
	str	r2, [r4, #176]
	ldr	r2, [r6, #64]
	str	r2, [r4, #180]
	ldr	r1, [r5, #16]
	str	r1, [r4, #52]
	mov	r0, r1
	ldr	r2, [r5, #76]
	add	r2, r2, r1
	str	r2, [r4, #56]
	bl	MEM_Phy2Vir
	str	r7, [r4, #556]
	str	r0, [r4, #552]
	ldr	r0, [r4, #56]
	bl	MEM_Phy2Vir
	str	r7, [r4, #564]
	str	r0, [r4, #560]
	ldr	r0, [r5, #24]
	str	r0, [r4, #264]
	bl	MEM_Phy2Vir
	str	r7, [r4, #276]
	str	r0, [r4, #272]
	ldr	r0, [r6, #16]
	str	r0, [r4, #36]
	ldr	r2, [r6, #76]
	add	r2, r0, r2
	str	r2, [r4, #40]
	ldr	r1, [r6, #32]
	add	r1, r1, r0
	str	r1, [r4, #44]
	ldr	r1, [r6, #32]
	add	r2, r2, r1
	str	r2, [r4, #48]
	ldr	r1, [r6, #16]
	str	r1, [r4, #68]
	mov	r0, r1
	ldr	r2, [r6, #76]
	add	r2, r2, r1
	str	r2, [r4, #72]
	bl	MEM_Phy2Vir
	ldr	r8, [fp, #-84]
	stmdb	r8, {r0, r7}
	ldr	r0, [r4, #72]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-88]
	add	ip, r4, #608
	str	r0, [r4, #576]
	str	r7, [r8, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r4, #52]
	str	r2, [r4, #60]
	ldr	r3, [r5, #76]
	add	r3, r3, r2
	str	r3, [r4, #64]
	ldr	r3, [r5, #48]
	str	r3, [r4, #184]
	ldr	r2, [r5, #52]
	add	r2, r2, r1
	str	r2, [r4, #76]
	ldr	r2, [r5, #52]
	ldr	r3, [r5, #56]
	add	r3, r2, r3
	add	r3, r3, r1
	str	r3, [r4, #80]
	ldrd	r0, [r9, #-8]
	ldr	lr, [r5, #52]
	adds	r2, r0, lr
	adc	r3, r1, lr, asr #31
	strd	r2, [r10]
	ldr	r2, [r5, #56]
	ldr	lr, [r5, #52]
	mov	r3, r2, asr #31
	adds	r8, r2, lr
	adc	r9, r3, lr, asr #31
	adds	r2, r8, r0
	adc	r3, r9, r1
	strd	r2, [ip, #-8]
	ldr	r3, [r5, #28]
	str	r3, [r4, #252]
	ldr	r0, [r5, #28]
	bl	MEM_Phy2Vir
	str	r7, [r4, #588]
	str	r0, [r4, #584]
	ldr	r3, [r6, #40]
	str	r3, [r4, #112]
	ldr	r3, [r6, #44]
	str	r3, [r4, #116]
	ldr	r3, [r5, #36]
	str	r3, [r4, #100]
	ldr	r0, [r5, #36]
	bl	MEM_Phy2Vir
	ldr	r3, .L370+4
	str	r7, [r4, #548]
	str	r7, [r4, #104]
	ldr	r3, [r3, #16]
	str	r7, [r4, #108]
	str	r0, [r4, #544]
	mov	r0, #3
	blx	r3
	ldr	ip, [fp, #-80]
	ldrsb	r0, [ip, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L335:
	mov	r0, r9
	mov	r1, r4
	str	r3, [fp, #-84]
	str	ip, [fp, #-80]
	bl	FSP_FindEmptyDecodeFs
	ldr	r0, [r10, #736]
	ldr	ip, [fp, #-80]
	cmp	r0, #0
	ldr	r3, [fp, #-84]
	beq	.L366
	add	r2, r5, #28928
	str	r3, [fp, #-84]
	add	r2, r2, #156
	str	r2, [r10, #744]
	ldrsb	r2, [r5, #13]
	str	ip, [fp, #-80]
	cmp	r2, #0
	ble	.L339
	mov	r0, r9
	bl	VCTRL_GetVidStd
	ldr	ip, [fp, #-80]
	ldr	r3, [fp, #-84]
	cmp	r0, #17
	beq	.L340
	ldrsb	r1, [r5, #13]
	add	r2, r5, #28672
	cmp	r1, #0
	ble	.L341
	add	r0, r2, #1004
	ldrh	r0, [r0]
	cmp	r0, #1
	bne	.L343
	b	.L342
.L346:
	add	r0, r5, r3, lsl #3
	ldrh	r0, [r0, #4]
	cmp	r0, #1
	beq	.L367
.L343:
	add	r7, r7, #1
	cmp	r7, r1
	add	r3, r7, #3696
	add	r3, r3, #13
	bne	.L346
.L341:
	cmp	r1, #0
	ldr	ip, [r2, #996]
	ble	.L348
.L344:
	mov	r0, #0
	mov	lr, r0
.L347:
	mov	r3, r0, asl #3
	add	r0, r0, #1
	add	r3, r3, #29440
	cmp	r0, r1
	add	r3, r3, #237
	strb	lr, [r5, r3]
	bne	.L347
.L348:
	mov	r3, #704
	mov	lr, #0
	mla	r3, r3, r6, r5
	mov	r0, lr
	ldr	r1, .L370+12
	strb	lr, [r3, #60]
	ldr	r2, [r2, #1000]
	str	ip, [r3, #752]
	str	r2, [r3, #748]
	bl	dprint_vfmw
.L339:
	mov	r7, #704
	ldr	r10, .L370+16
	mla	r7, r7, r6, r5
	ldr	r3, [r10, #392]
	cmp	r3, #0
	ldr	r3, [r7, #736]
	str	r3, [r7, #740]
	beq	.L336
	mov	r0, r9
	bl	VCTRL_GetImageWidth
	str	r0, [fp, #-80]
	mov	r0, r9
	bl	VCTRL_GetImageHeight
	ldr	ip, [r10, #400]
	ldr	r2, [fp, #-80]
	cmp	ip, #0
	mov	r3, r0
	beq	.L368
	mov	r0, r9
	sub	r1, fp, #72
	blx	ip
	cmp	r0, #0
	bne	.L350
	ldr	r9, [fp, #-68]
	cmp	r9, #0
	beq	.L369
	ldr	r3, [r7, #736]
	str	r9, [r3, #16]
	ldrsb	r3, [r7, #60]
	ldr	r2, [fp, #-52]
	add	r3, r3, #3696
	add	r3, r3, #13
	str	r2, [r7, #748]
	str	r2, [r5, r3, asl #3]
	b	.L336
.L367:
	mov	r0, #704
	cmp	r7, r1
	mla	r0, r0, r6, r5
	strb	r7, [r0, #60]
	ldr	r3, [r5, r3, asl #3]
	str	r3, [r0, #748]
	ldr	ip, [r2, #996]
	str	ip, [r0, #752]
	blt	.L339
	b	.L344
.L340:
	add	r2, r5, #28672
.L342:
	strb	r7, [ip, #4]
	ldr	r1, [r2, #1000]
	str	r1, [r3, #4]
	ldr	r3, [r2, #996]
	str	r3, [r10, #752]
	b	.L339
.L363:
	ldr	r3, .L370+20
	movw	r2, #1307
	ldr	r1, .L370+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L360
.L364:
	ldr	r3, .L370+28
	movw	r2, #1308
	ldr	r1, .L370+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L360
.L369:
	ldr	r3, .L370+4
	mov	r0, #3
	ldr	r3, [r3, #16]
	blx	r3
	mov	r0, r9
	ldr	r1, .L370+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L360
.L368:
	mov	r0, ip
	ldr	r1, .L370+36
	bl	dprint_vfmw
.L350:
	ldr	r3, .L370+4
	mov	r0, #3
	ldr	r3, [r3, #16]
	blx	r3
	ldr	r1, .L370+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L360
.L366:
	ldr	r2, .L370+44
	ldr	r1, .L370+48
	bl	dprint_vfmw
	b	.L362
.L371:
	.align	2
.L370:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC19
	.word	.LC21
	.word	.LANCHOR1
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.word	.LC23
	.word	.LC5
	.word	.LC22
	.word	.LANCHOR2
	.word	.LC20
	UNWIND(.fnend)
	.size	FSP_NewLogicFs, .-FSP_NewLogicFs
	.align	2
	.global	FSP_GetPhyFsNum
	.type	FSP_GetPhyFsNum, %function
FSP_GetPhyFsNum:
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
	ldr	r6, .L380
	mov	r7, r0
	mov	r0, #3
	mov	r4, r1
	mov	r5, #0
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r3, .L380+4
	ldr	ip, [r3, r7, asl #2]
	add	r3, ip, #22528
	add	ip, ip, #25856
	add	r3, r3, #252
	add	ip, ip, #124
	b	.L374
.L373:
	add	r3, r3, #100
	cmp	r3, ip
	beq	.L379
.L374:
	ldr	r2, [r3]
	cmp	r2, #1
	bne	.L373
	ldr	r2, [r3, #-76]
	add	r3, r3, #100
	cmp	r4, #0
	cmpne	r2, r4
	addeq	r5, r5, #1
	cmp	r3, ip
	bne	.L374
.L379:
	ldr	r3, [r6, #16]
	mov	r0, #3
	blx	r3
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L381:
	.align	2
.L380:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetPhyFsNum, .-FSP_GetPhyFsNum
	.align	2
	.global	FSP_RelsePMVRecod
	.type	FSP_RelsePMVRecod, %function
FSP_RelsePMVRecod:
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
	ldr	r5, .L384
	mov	r3, r1, asl #6
	add	r4, r3, r1, lsl #3
	mov	r6, r0
	ldr	r3, [r5, r0, asl #2]
	add	r3, r3, r4
	add	r2, r3, #307200
	ldr	r2, [r2, #3328]
	cmp	r2, #255
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	movw	r2, #48440
	movt	r2, 4
	ldr	r7, [r3, r2]
	mov	r0, r7
	bl	MEM_Phy2Vir
	ldr	r1, [r5, r6, asl #2]
	movw	r3, #48392
	add	r4, r1, r4
	movt	r3, 4
	add	r3, r4, r3
	ldr	r2, [r3, #4]
	mov	r1, r0
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_DelMemRecord
.L385:
	.align	2
.L384:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_RelsePMVRecod, .-FSP_RelsePMVRecod
	.align	2
	.global	FSP_RelsePhyFs
	.type	FSP_RelsePhyFs, %function
FSP_RelsePhyFs:
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
	ldr	r7, .L413
	mov	r6, r0
	mov	r0, #3
	mov	r8, r1
	mov	r4, #0
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r3, .L413+4
	ldr	r1, [r3, r6, asl #2]
	add	r3, r1, #22528
	add	r3, r3, #252
	b	.L390
.L387:
	add	r4, r4, #1
	add	r3, r3, #100
	cmp	r4, #32
	beq	.L410
.L390:
	ldr	r2, [r3]
	cmp	r2, #1
	bne	.L387
	ldrsb	r2, [r3, #-96]
	cmp	r2, #0
	bne	.L387
	ldrsb	r5, [r3, #-94]
	cmp	r5, #0
	bne	.L387
	ldr	r2, [r3, #-76]
	cmp	r2, r8
	beq	.L387
	mov	r3, #100
	mla	r10, r3, r4, r1
	add	r3, r10, #22528
	add	r3, r3, #168
	ldr	r8, [r3, #4]
	str	r3, [fp, #-64]
	mov	r0, r8
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-64]
	cmp	r4, #31
	ldr	r2, [r3, #8]
	mov	r9, r0
	bgt	.L410
	add	r3, r10, #22528
	mov	r1, r0
	mov	r0, r8
	str	r5, [r3, #252]
	bl	MEM_DelMemRecord
	mov	r1, r4
	mov	r0, r6
	bl	FSP_RelsePMVRecod
	ldr	r3, [r7, #16]
	mov	r0, #3
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #8
	blx	r3
	ldr	r1, .L413+8
	movw	r2, #50696
	mov	r3, r5
	movt	r2, 4
	ldr	r0, [r1, r6, asl #2]
	add	r2, r0, r2
	b	.L394
.L392:
	add	r3, r3, #1
	add	r2, r2, #12
	cmp	r3, #32
	beq	.L395
.L394:
	ldrb	r1, [r2]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L392
	ldr	r1, [r2, #-8]
	cmp	r8, r1
	bne	.L392
	cmp	r3, #31
	bgt	.L395
	mov	r1, r3, asl #4
	add	r2, r0, #311296
	sub	r3, r1, r3, asl #2
	mov	r1, #0
	add	r3, r2, r3
	strb	r1, [r3, #1544]
.L395:
	movw	r3, #48376
	mov	r4, #0
	movt	r3, 4
	add	r3, r0, r3
	b	.L398
.L396:
	add	r4, r4, #1
	add	r3, r3, #72
	cmp	r4, #32
	beq	.L399
.L398:
	ldr	r2, [r3]
	cmp	r2, #255
	beq	.L396
	ldr	r2, [r3, #32]
	cmp	r8, r2
	bne	.L396
	cmp	r4, #31
	bgt	.L399
	ldr	r1, .L413+12
	mov	r3, r4, asl #6
	add	r3, r3, r4, lsl #3
	movw	r2, #48376
	add	r0, r0, r3
	movt	r2, 4
	ldr	ip, [r1]
	mov	r3, #255
	str	r3, [r0, r2]
	cmp	ip, #0
	beq	.L399
	mov	r2, #0
	str	r8, [fp, #-60]
	str	r2, [fp, #-56]
	mov	r0, r6
	str	r2, [fp, #-48]
	mov	r3, #16
	str	r9, [fp, #-52]
	sub	r2, fp, #60
	mov	r1, #123
	blx	ip
.L399:
	ldr	r3, [r7, #16]
	mov	r0, #8
	blx	r3
	cmp	r4, #31
	movle	r0, #0
	mvngt	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L410:
	ldr	r3, [r7, #16]
	mov	r0, #3
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L414:
	.align	2
.L413:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_event_report
	UNWIND(.fnend)
	.size	FSP_RelsePhyFs, .-FSP_RelsePhyFs
	.align	2
	.global	FSP_RemovePmv
	.type	FSP_RemovePmv, %function
FSP_RemovePmv:
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
	cmp	r0, #31
	ldrhi	r3, .L424
	movwhi	r2, #1639
	bhi	.L421
	cmp	r1, #31
	bhi	.L422
	ldr	r3, .L424+4
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L423
	mov	r3, #704
	mla	r3, r3, r1, r0
	ldr	r2, [r3, #732]
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r3, #60]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L420
	sxtb	r3, r3
	mov	r2, #0
	add	r3, r3, #3696
	add	r3, r3, #13
	add	r3, r0, r3, lsl #3
	strb	r2, [r3, #5]
.L420:
	mov	r2, #704
	mov	r3, #0
	mla	r1, r2, r1, r0
	str	r3, [r1, #732]
	ldmfd	sp, {fp, sp, pc}
.L422:
	ldr	r3, .L424+8
	movw	r2, #1640
.L421:
	ldr	r1, .L424+12
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L423:
	ldr	r3, .L424+16
	movw	r2, #1641
	ldr	r1, .L424+12
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L425:
	.align	2
.L424:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC24
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_RemovePmv, .-FSP_RemovePmv
	.align	2
	.global	FSP_SetRef
	.type	FSP_SetRef, %function
FSP_SetRef:
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
	cmp	r0, #31
	mov	r3, r0
	mov	r6, r2
	mov	r4, r1
	ldrhi	r3, .L468
	movwhi	r2, #1669
	bhi	.L457
	cmp	r1, #31
	bhi	.L458
	ldr	r1, .L468+4
	ldr	r7, [r1, r3, asl #2]
	cmp	r7, #0
	beq	.L459
	mov	r5, #704
	uxtb	r8, r6
	mla	r5, r5, r4, r7
	ldrsb	r3, [r5, #58]
	strb	r8, [r5, #56]
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r5, #736]
	cmp	r3, #0
	beq	.L432
	ldr	ip, [r3, #88]
	ldr	r1, [r5, #728]
	cmp	ip, r1
	beq	.L460
.L432:
	mov	r2, #704
	mla	r2, r2, r4, r7
	ldrb	r3, [r2, #60]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L435
	cmp	r6, #1
	beq	.L461
	cmp	r6, #0
	bne	.L438
	ldr	r0, [r2, #732]
	cmp	r0, #2
	beq	.L462
.L444:
	mov	r3, #704
	mla	r3, r3, r4, r7
	ldr	r3, [r3, #740]
	cmp	r3, #0
	beq	.L449
	ldrsb	r2, [r3, #2]
	cmp	r2, #1
	moveq	r2, #0
	streqb	r2, [r3, #2]
.L449:
	mov	r3, #704
	mla	r4, r3, r4, r7
	str	r6, [r4, #736]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L458:
	ldr	r3, .L468+8
	movw	r2, #1670
.L457:
	ldr	r1, .L468+12
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L461:
	ldr	r1, [r2, #732]
	add	r2, r2, #728
	cmp	r1, #1
	beq	.L463
.L437:
	mov	r3, #704
	mla	r3, r3, r4, r7
	ldr	r2, [r3, #740]
	cmp	r2, #0
	beq	.L464
.L445:
	mov	r3, #704
	ldr	r0, [r2, #88]
	mla	r3, r3, r4, r7
	ldr	r1, [r3, #728]
	cmp	r6, #1
	cmpeq	r0, r1
	beq	.L465
.L441:
	cmp	r6, #0
	beq	.L449
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L435:
	sxtb	r3, r3
	movw	r2, #1722
	ldr	r1, .L468+16
	mov	r0, #0
	bl	dprint_vfmw
	cmp	r6, #0
	beq	.L444
	b	.L437
.L463:
	sxtb	r3, r3
	mov	r1, #2
	add	r3, r3, #3696
	add	r3, r3, #13
	add	r3, r7, r3, lsl #3
	strb	r6, [r3, #5]
	str	r1, [r2, #4]
.L438:
	mov	r3, #704
	mla	r3, r3, r4, r7
	ldr	r2, [r3, #740]
	cmp	r2, #0
	bne	.L445
	b	.L441
.L460:
	ldrsb	r1, [r3]
	cmp	r6, r1
	beq	.L433
	ldr	r1, .L468+20
	ldr	ip, [r1, #392]
	cmp	ip, #0
	bne	.L466
.L433:
	strb	r8, [r3]
	b	.L432
.L466:
	ldr	ip, [r1, #408]
	ldr	r1, [r3, #16]
	cmp	ip, #0
	beq	.L467
	blx	ip
	ldr	r3, [r5, #736]
	b	.L433
.L462:
	sxtb	r3, r3
	add	r3, r3, #3696
	add	r3, r3, #13
	add	r3, r7, r3, lsl #3
	strb	r6, [r3, #5]
	str	r6, [r2, #748]
	str	r6, [r2, #732]
	b	.L444
.L459:
	mov	r0, r7
	ldr	r3, .L468+24
	movw	r2, #1671
	ldr	r1, .L468+12
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L465:
	ldrsb	r1, [r2, #2]
	cmp	r1, #1
	moveq	r1, #2
	streqb	r1, [r2, #2]
	streqb	r1, [r3, #57]
	b	.L441
.L464:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L467:
	mov	r0, ip
	ldr	r1, .L468+28
	bl	dprint_vfmw
	ldr	r3, [r5, #736]
	b	.L433
.L469:
	.align	2
.L468:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC24
	.word	.LC1
	.word	.LC25
	.word	.LANCHOR1
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	FSP_SetRef, .-FSP_SetRef
	.align	2
	.global	FSP_GetRef
	.type	FSP_GetRef, %function
FSP_GetRef:
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
	cmp	r0, #31
	bhi	.L475
	cmp	r1, #31
	bhi	.L476
	ldr	r3, .L478
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L477
	mov	r0, #704
	mla	r1, r0, r1, r3
	ldrsb	r0, [r1, #56]
	ldmfd	sp, {fp, sp, pc}
.L475:
	ldr	r3, .L478+4
	movw	r2, #1761
	ldr	r1, .L478+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L476:
	ldr	r3, .L478+12
	movw	r2, #1762
	ldr	r1, .L478+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L477:
	mov	r0, r3
	movw	r2, #1763
	ldr	r3, .L478+16
	ldr	r1, .L478+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L479:
	.align	2
.L478:
	.word	.LANCHOR0
	.word	.LC26
	.word	.LC1
	.word	.LC27
	.word	.LC28
	UNWIND(.fnend)
	.size	FSP_GetRef, .-FSP_GetRef
	.align	2
	.global	FSP_SetDisplay
	.type	FSP_SetDisplay, %function
FSP_SetDisplay:
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
	cmp	r0, #31
	mov	r8, r2
	mov	r5, r0
	mov	r4, r1
	ldrhi	r3, .L529
	movwhi	r2, #1780
	bhi	.L521
	cmp	r1, #31
	bhi	.L522
	ldr	r9, .L529+4
	ldr	r0, [r9, r0, asl #2]
	cmp	r0, #0
	beq	.L523
	ldr	r7, .L529+8
	mov	r0, #3
	clz	r6, r8
	ldr	r3, [r7, #12]
	mov	r6, r6, lsr #5
	blx	r3
	ldr	r9, [r9, r5, asl #2]
	mov	r3, #704
	mla	r3, r3, r4, r9
	add	r2, r3, #56
	ldrsb	r1, [r3, #58]
	cmp	r1, #0
	cmpeq	r8, #0
	bne	.L484
	ldr	r3, [r3, #740]
	cmp	r3, #0
	beq	.L484
	ldrsb	r2, [r2, #1]
	cmp	r2, #0
	beq	.L484
	ldr	r2, .L529+12
	ldr	r1, [r2, #392]
	cmp	r1, #0
	bne	.L524
.L484:
	mov	r2, #704
	cmp	r6, #0
	mla	r2, r2, r4, r9
	movne	r3, #0
	moveq	r3, #3
	add	r1, r2, #56
	ldrsb	ip, [r1, #2]
	strb	r3, [r1, #1]
	cmp	ip, #0
	bne	.L495
	add	r8, r2, #736
	ldr	r3, [r8, #4]
	cmp	r3, #0
	beq	.L495
	ldr	r3, [r3, #88]
	ldr	r2, [r2, #728]
	cmp	r3, r2
	bne	.L525
	cmp	r6, #0
	beq	.L490
	strb	ip, [r1, #1]
	mov	r0, r5
	ldr	r3, [r8, #4]
	strb	ip, [r3, #2]
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L526
.L492:
	mov	r2, #704
	mov	r3, #0
	mla	r4, r2, r4, r9
	add	r4, r4, #736
	str	r3, [r4, #4]
.L495:
	ldr	r3, [r7, #16]
	mov	r0, #3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L522:
	ldr	r3, .L529+16
	movw	r2, #1781
.L521:
	ldr	r1, .L529+20
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L490:
	mov	r0, r5
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L527
.L494:
	mov	r3, #704
	mov	r2, #3
	mla	r4, r3, r4, r9
	ldr	r3, [r4, #740]
	strb	r2, [r4, #57]
	strb	r2, [r3, #2]
	b	.L495
.L525:
	mov	r0, ip
	ldr	r1, .L529+24
	bl	dprint_vfmw
	b	.L495
.L523:
	ldr	r3, .L529+28
	movw	r2, #1782
	ldr	r1, .L529+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L524:
	ldr	r2, [r2, #404]
	ldr	r1, [r3, #16]
	cmp	r2, #0
	beq	.L528
	mov	r0, r5
	blx	r2
	b	.L484
.L526:
	ldr	r3, [r8, #4]
	cmp	r3, #0
	beq	.L492
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L492
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r8, #4]
	ldr	r2, [r3, #4]
	cmp	r2, #0
	movne	r2, #3
	strneb	r2, [r3, #2]
	b	.L492
.L527:
	ldr	r3, [r8, #4]
	cmp	r3, #0
	ldrne	r2, [r3, #4]
	addne	r2, r2, #1
	strne	r2, [r3, #4]
	b	.L494
.L528:
	mov	r0, r2
	ldr	r1, .L529+32
	bl	dprint_vfmw
	b	.L484
.L530:
	.align	2
.L529:
	.word	.LC0
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC24
	.word	.LC1
	.word	.LC29
	.word	.LC4
	.word	.LC6
	UNWIND(.fnend)
	.size	FSP_SetDisplay, .-FSP_SetDisplay
	.align	2
	.global	FSP_ClearNotInVoQueue
	.type	FSP_ClearNotInVoQueue, %function
FSP_ClearNotInVoQueue:
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
	cmp	r0, #31
	mov	r5, r0
	mov	r7, r1
	bhi	.L542
	cmp	r1, #0
	beq	.L543
	ldr	r3, .L546
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r6, r0, #22528
	addne	r4, r0, #64
	addne	r6, r6, #64
	bne	.L537
	b	.L544
.L536:
	add	r4, r4, #704
	cmp	r4, r6
	beq	.L545
.L537:
	mov	r2, #0
	ldr	r1, [r4, #180]
	mov	r0, r5
	bl	FSP_SetRef
	mov	r1, r4
	mov	r0, r7
	bl	IsImageInVoQueue
	cmp	r0, #0
	beq	.L536
	ldr	r1, [r4, #180]
	mov	r2, #0
	mov	r0, r5
	add	r4, r4, #704
	bl	FSP_SetDisplay
	cmp	r4, r6
	bne	.L537
.L545:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L542:
	ldr	r3, .L546+4
	mov	r2, #516
	ldr	r1, .L546+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L544:
	ldr	r3, .L546+12
	movw	r2, #518
	ldr	r1, .L546+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L543:
	mov	r0, r1
	ldr	r3, .L546+16
	movw	r2, #517
	ldr	r1, .L546+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L547:
	.align	2
.L546:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.word	.LC30
	UNWIND(.fnend)
	.size	FSP_ClearNotInVoQueue, .-FSP_ClearNotInVoQueue
	.align	2
	.global	FSP_GetDisplay
	.type	FSP_GetDisplay, %function
FSP_GetDisplay:
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
	ldr	r3, .L552
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L551
	mov	r0, #704
	mla	r1, r0, r1, r3
	ldrsb	r0, [r1, #57]
	ldmfd	sp, {fp, sp, pc}
.L551:
	mov	r0, r3
	movw	r2, #1873
	ldr	r3, .L552+4
	ldr	r1, .L552+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L553:
	.align	2
.L552:
	.word	.LANCHOR0
	.word	.LC4
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_GetDisplay, .-FSP_GetDisplay
	.align	2
	.global	FSP_SetStoreType
	.type	FSP_SetStoreType, %function
FSP_SetStoreType:
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
	cmp	r0, #31
	bhi	.L562
	ldr	ip, .L565
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L563
	cmp	r1, #0
	bne	.L558
	ldrsb	r0, [ip, #10]
	cmp	r0, r2
	ble	.L561
	mov	lr, #100
	mov	r0, r1
	mla	r2, lr, r2, ip
	add	r2, r2, #22528
	str	r3, [r2, #168]
	ldmfd	sp, {fp, sp, pc}
.L558:
	cmp	r1, #1
	beq	.L564
.L561:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L564:
	ldrsb	r1, [ip, #11]
	cmp	r2, r1
	bge	.L561
	mov	r1, #100
	mov	r0, #0
	mla	r2, r1, r2, ip
	add	r2, r2, #25856
	str	r3, [r2, #40]
	ldmfd	sp, {fp, sp, pc}
.L562:
	ldr	r3, .L565+4
	movw	r2, #1889
	ldr	r1, .L565+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L563:
	mov	r0, ip
	ldr	r3, .L565+12
	movw	r2, #1890
	ldr	r1, .L565+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L566:
	.align	2
.L565:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_SetStoreType, .-FSP_SetStoreType
	.align	2
	.global	FSP_GetStoreType
	.type	FSP_GetStoreType, %function
FSP_GetStoreType:
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
	cmp	r0, #31
	bhi	.L575
	ldr	r3, .L578
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L576
	cmp	r1, #0
	bne	.L571
	ldrsb	r3, [r0, #10]
	cmp	r3, r2
	ble	.L574
	mov	r3, #100
	mla	r2, r3, r2, r0
	add	r2, r2, #22528
	ldr	r0, [r2, #168]
	ldmfd	sp, {fp, sp, pc}
.L571:
	cmp	r1, #1
	beq	.L577
.L574:
	mov	r0, #2
	ldmfd	sp, {fp, sp, pc}
.L575:
	ldr	r3, .L578+4
	movw	r2, #1922
	ldr	r1, .L578+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L576:
	ldr	r3, .L578+12
	movw	r2, #1923
	ldr	r1, .L578+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L577:
	ldrsb	r3, [r0, #11]
	cmp	r2, r3
	bge	.L574
	mov	r3, #100
	mla	r2, r3, r2, r0
	add	r2, r2, #25856
	ldr	r0, [r2, #40]
	ldmfd	sp, {fp, sp, pc}
.L579:
	.align	2
.L578:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetStoreType, .-FSP_GetStoreType
	.align	2
	.global	FSP_ClearLogicFs
	.type	FSP_ClearLogicFs, %function
FSP_ClearLogicFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	mov	r4, r0
	mov	r5, r1
	ldmhifd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r6, .L590
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r2, #0
	bl	FSP_SetRef
	ldr	r2, [r6, r4, asl #2]
	mov	r3, #704
	mla	r3, r3, r5, r2
	ldrsb	r3, [r3, #57]
	cmp	r3, #3
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r1, r5
	mov	r0, r4
	mov	r2, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	FSP_SetDisplay
.L591:
	.align	2
.L590:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_ClearLogicFs, .-FSP_ClearLogicFs
	.align	2
	.global	FSP_GetLogicFs
	.type	FSP_GetLogicFs, %function
FSP_GetLogicFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L594
	ldr	r3, .L596
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #704
	mlane	r1, r3, r1, r0
	addne	r0, r1, #56
	ldmfd	sp, {fp, sp, pc}
.L594:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L597:
	.align	2
.L596:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetLogicFs, .-FSP_GetLogicFs
	.align	2
	.global	FSP_GetFsImagePtr
	.type	FSP_GetFsImagePtr, %function
FSP_GetFsImagePtr:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L600
	ldr	r3, .L602
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #704
	mlane	r1, r3, r1, r0
	addne	r0, r1, #64
	ldmfd	sp, {fp, sp, pc}
.L600:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L603:
	.align	2
.L602:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetFsImagePtr, .-FSP_GetFsImagePtr
	.align	2
	.global	FSP_GetDecPhyFs
	.type	FSP_GetDecPhyFs, %function
FSP_GetDecPhyFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L606
	ldr	r3, .L608
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #704
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #736]
	ldmfd	sp, {fp, sp, pc}
.L606:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L609:
	.align	2
.L608:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetDecPhyFs, .-FSP_GetDecPhyFs
	.align	2
	.global	FSP_GetDispPhyFs
	.type	FSP_GetDispPhyFs, %function
FSP_GetDispPhyFs:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L612
	ldr	r3, .L614
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #704
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #740]
	ldmfd	sp, {fp, sp, pc}
.L612:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L615:
	.align	2
.L614:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetDispPhyFs, .-FSP_GetDispPhyFs
	.align	2
	.global	FSP_GetPmvAddr
	.type	FSP_GetPmvAddr, %function
FSP_GetPmvAddr:
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
	cmp	r0, #31
	cmpls	r1, #31
	movls	r3, #1
	movhi	r3, #0
	bhi	.L618
	ldr	r3, .L620
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, #704
	mlane	r0, r3, r1, r0
	ldrne	r0, [r0, #748]
	ldmfd	sp, {fp, sp, pc}
.L618:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L621:
	.align	2
.L620:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetPmvAddr, .-FSP_GetPmvAddr
	.align	2
	.global	FSP_GetDecFsAddrTab
	.type	FSP_GetDecFsAddrTab, %function
FSP_GetDecFsAddrTab:
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
	cmp	r0, #31
	bhi	.L633
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L635
	movweq	r2, #2070
	beq	.L632
	cmp	r1, #0
	moveq	r0, r1
	ldreq	r3, .L635+4
	movweq	r2, #2071
	beq	.L632
	ldr	ip, .L635+8
	ldr	lr, [ip, r0, asl #2]
	cmp	lr, #0
	beq	.L634
	mov	lr, #0
	str	lr, [r1]
	ldr	r4, [ip, r0, asl #2]
	ldrsb	r4, [r4, #10]
	cmp	r4, lr
	str	r4, [r1]
	ldr	ip, [ip, r0, asl #2]
	add	ip, ip, #22528
	add	ip, ip, #156
	ldmlefd	sp, {r4, fp, sp, pc}
	sub	r2, r2, #4
	sub	r3, r3, #4
.L629:
	ldr	r0, [ip, #16]
	add	lr, lr, #1
	add	ip, ip, #100
	str	r0, [r2, #4]!
	ldr	r0, [ip, #-72]
	str	r0, [r3, #4]!
	ldr	r4, [r1]
	cmp	r4, lr
	bgt	.L629
	ldmfd	sp, {r4, fp, sp, pc}
.L633:
	ldr	r3, .L635+12
	movw	r2, #2069
	ldr	r1, .L635+16
	mov	r0, #0
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L634:
	ldr	r3, .L635+20
	mov	r0, lr
	movw	r2, #2072
.L632:
	ldr	r1, .L635+16
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	dprint_vfmw
.L636:
	.align	2
.L635:
	.word	.LC31
	.word	.LC32
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetDecFsAddrTab, .-FSP_GetDecFsAddrTab
	.align	2
	.global	FSP_GetPmvAddrTab
	.type	FSP_GetPmvAddrTab, %function
FSP_GetPmvAddrTab:
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
	cmp	r0, #31
	bhi	.L648
	cmp	r2, #0
	moveq	r0, r2
	ldreq	r3, .L650
	movweq	r2, #2103
	beq	.L647
	cmp	r1, #0
	moveq	r0, r1
	ldreq	r3, .L650+4
	movweq	r2, #2104
	beq	.L647
	ldr	ip, .L650+8
	ldr	r3, [ip, r0, asl #2]
	cmp	r3, #0
	beq	.L649
	mov	r3, #0
	str	r3, [r1]
	ldr	ip, [ip, r0, asl #2]
	ldrsb	r0, [ip, #13]
	str	r0, [r1]
	ldrsb	r1, [ip, #13]
	cmp	r1, r3
	ldmlefd	sp, {fp, sp, pc}
	sub	r2, r2, #4
	mov	r1, r3
.L644:
	mov	r3, r1, asl #3
	add	r1, r1, #1
	add	r3, r3, #29440
	add	r3, r3, #232
	ldr	r3, [ip, r3]
	str	r3, [r2, #4]!
	ldrsb	r3, [ip, #13]
	cmp	r3, r1
	bgt	.L644
	ldmfd	sp, {fp, sp, pc}
.L648:
	ldr	r3, .L650+12
	movw	r2, #2102
	ldr	r1, .L650+16
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L649:
	mov	r0, r3
	ldr	r3, .L650+20
	movw	r2, #2105
.L647:
	ldr	r1, .L650+16
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L651:
	.align	2
.L650:
	.word	.LC33
	.word	.LC34
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetPmvAddrTab, .-FSP_GetPmvAddrTab
	.align	2
	.global	FSP_GetInstInfo
	.type	FSP_GetInstInfo, %function
FSP_GetInstInfo:
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
	ldr	r3, .L655
	mov	ip, r1
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L654
	ldrb	lr, [r3, #10]	@ zero_extendqisi2
	add	r4, r3, #20480
	mov	r0, r1
	ldr	r5, .L655+4
	add	r1, r3, #22528
	mov	r2, #3200
	strb	lr, [ip, #1]
	add	r1, r1, #156
	ldr	lr, [r4, #2320]
	ldr	r4, [r4, #2220]
	rsb	lr, r4, lr
	str	lr, [ip, #3208]
	ldrb	lr, [r3, #11]	@ zero_extendqisi2
	strb	lr, [ip, #2]
	ldrb	lr, [r3, #12]	@ zero_extendqisi2
	strb	lr, [ip, #3]
	ldrb	lr, [r3]	@ zero_extendqisi2
	strb	lr, [ip, #4]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	strb	r3, [r0], #8
	ldr	r3, [r5, #52]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L654:
	mov	r0, r3
	movw	r2, #2123
	ldr	r3, .L655+8
	ldr	r1, .L655+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L656:
	.align	2
.L655:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_GetInstInfo, .-FSP_GetInstInfo
	.align	2
	.global	FSP_GetLogicIdByPhyAddr
	.type	FSP_GetLogicIdByPhyAddr, %function
FSP_GetLogicIdByPhyAddr:
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
	cmp	r0, #31
	bhi	.L668
	ldr	r3, .L670
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	movne	r3, r0
	movne	r0, #0
	beq	.L669
.L662:
	ldr	r2, [r3, #736]
	add	r3, r3, #704
	cmp	r2, #0
	beq	.L661
	ldr	r2, [r2, #16]
	cmp	r2, r1
	ldmeqfd	sp, {fp, sp, pc}
.L661:
	add	r0, r0, #1
	cmp	r0, #32
	bne	.L662
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L668:
	ldr	r3, .L670+4
	movw	r2, #2146
	ldr	r1, .L670+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L669:
	ldr	r3, .L670+12
	movw	r2, #2147
	ldr	r1, .L670+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L671:
	.align	2
.L670:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetLogicIdByPhyAddr, .-FSP_GetLogicIdByPhyAddr
	.align	2
	.global	FSP_PrintContext
	.type	FSP_PrintContext, %function
FSP_PrintContext:
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
	cmp	r0, #31
	bhi	.L702
	ldr	r3, .L705
	ldr	r7, [r3, r0, asl #2]
	cmp	r7, #0
	beq	.L703
	ldr	r1, .L705+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r7, #4]
	ldr	r2, .L705+8
	mov	r0, #0
	ldr	r1, .L705+12
	mov	r5, r7
	bl	dprint_vfmw
	ldr	r3, [r7, #28]
	ldr	r2, .L705+16
	mov	r0, #0
	ldr	r1, .L705+12
	mov	r6, #1
	bl	dprint_vfmw
	mov	r0, #0
	mov	r4, r0
	ldr	r3, [r7, #32]
	ldr	r2, .L705+20
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldr	r3, [r7, #44]
	ldr	r2, .L705+24
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldr	r3, [r7, #48]
	ldr	r2, .L705+28
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #23]
	ldr	r2, .L705+32
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #25]
	ldr	r2, .L705+36
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #26]
	ldr	r2, .L705+40
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #10]
	ldr	r2, .L705+44
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #11]
	ldr	r2, .L705+48
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	ldrsb	r3, [r7, #13]
	ldr	r2, .L705+52
	mov	r0, r4
	ldr	r1, .L705+12
	bl	dprint_vfmw
	mov	r2, #32
	ldr	r1, .L705+56
	mov	r0, r4
	bl	dprint_vfmw
	b	.L675
.L677:
	ldrsb	r3, [r5, #57]
	mov	r0, #0
	ldrsb	r2, [r5, #56]
	ldr	r1, .L705+60
	bl	dprint_vfmw
	cmp	r6, #31
	bgt	.L704
.L678:
	add	r4, r4, #1
	add	r6, r6, #1
	add	r5, r5, #704
.L675:
	cmp	r4, #0
	beq	.L676
	ands	r0, r4, #7
	bne	.L677
	ldr	r1, .L705+64
	bl	dprint_vfmw
	b	.L677
.L704:
	ldrsb	r2, [r7, #10]
	mov	r0, #0
	ldr	r1, .L705+68
	bl	dprint_vfmw
	ldrsb	r3, [r7, #10]
	cmp	r3, #0
	addgt	r5, r7, #22528
	movgt	r4, #0
	addgt	r5, r5, #156
	ble	.L685
.L682:
	ldrsb	r3, [r5, #2]
	mov	r0, #0
	ldrsb	r2, [r5]
	add	r4, r4, #1
	ldr	r1, .L705+60
	add	r5, r5, #100
	bl	dprint_vfmw
	ldrsb	r3, [r7, #10]
	cmp	r3, r4
	ble	.L685
	cmp	r4, #0
	beq	.L682
	ands	r0, r4, #7
	bne	.L682
	ldr	r1, .L705+64
	bl	dprint_vfmw
	b	.L682
.L685:
	ldrsb	r2, [r7, #11]
	mov	r0, #0
	ldr	r1, .L705+72
	bl	dprint_vfmw
	ldrsb	r3, [r7, #11]
	cmp	r3, #0
	addgt	r5, r7, #25856
	movgt	r4, #0
	addgt	r5, r5, #28
	ble	.L681
.L688:
	ldrsb	r3, [r5, #2]
	mov	r0, #0
	ldrsb	r2, [r5]
	add	r4, r4, #1
	ldr	r1, .L705+60
	add	r5, r5, #100
	bl	dprint_vfmw
	ldrsb	r3, [r7, #11]
	cmp	r3, r4
	ble	.L681
	cmp	r4, #0
	beq	.L688
	ands	r0, r4, #7
	bne	.L688
	ldr	r1, .L705+64
	bl	dprint_vfmw
	b	.L688
.L681:
	ldrsb	r2, [r7, #13]
	mov	r0, #0
	ldr	r1, .L705+76
	bl	dprint_vfmw
	ldrsb	r3, [r7, #13]
	cmp	r3, #0
	ble	.L686
	mov	r4, #0
.L687:
	mov	r3, r4, asl #3
	ldr	r1, .L705+80
	add	r3, r3, #29440
	mov	r0, #0
	add	r3, r3, #237
	add	r4, r4, #1
	ldrb	r2, [r7, r3]	@ zero_extendqisi2
	bl	dprint_vfmw
	ldrsb	r3, [r7, #13]
	cmp	r3, r4
	ble	.L686
	cmp	r4, #0
	beq	.L687
	ands	r0, r4, #15
	bne	.L687
	ldr	r1, .L705+64
	bl	dprint_vfmw
	b	.L687
.L686:
	ldr	r1, .L705+84
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L702:
	ldr	r3, .L705+88
	movw	r2, #2178
	ldr	r1, .L705+92
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L703:
	mov	r0, r7
	ldr	r3, .L705+96
	movw	r2, #2179
	ldr	r1, .L705+92
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L676:
	ldrsb	r3, [r5, #57]
	mov	r0, r4
	ldrsb	r2, [r5, #56]
	ldr	r1, .L705+60
	bl	dprint_vfmw
	b	.L678
.L706:
	.align	2
.L705:
	.word	.LANCHOR0
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC50
	.word	.LC49
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC55
	.word	.LC54
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_PrintContext, .-FSP_PrintContext
	.align	2
	.global	FSP_IsRefLeak
	.type	FSP_IsRefLeak, %function
FSP_IsRefLeak:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r2, [r0, #28]
	mov	r3, #0
	mov	r5, r0
	cmp	r2, #1088
	mov	r7, r1
	str	r3, [fp, #-48]
	str	r3, [fp, #-44]
	movgt	r8, #1
	str	r3, [fp, #-40]
	bgt	.L708
	ldr	r3, .L725
	ldr	r3, [r3, r1, asl #2]
	add	r3, r3, #311296
	ldr	r3, [r3, #3504]
	cmp	r3, #0
	movne	r8, #1
	moveq	r8, #4
.L708:
	ldrsb	r1, [r5, #10]
	cmp	r1, #0
	ble	.L717
	mov	r6, #0
	add	r3, r5, #22528
	add	r3, r3, #252
	mov	r4, r6
	mov	r2, r6
	b	.L712
.L710:
	add	r2, r2, #1
	add	r3, r3, #100
	cmp	r2, r1
	beq	.L709
.L712:
	ldr	ip, [r3]
	cmp	ip, #1
	bne	.L710
	ldrb	r0, [r3, #-96]	@ zero_extendqisi2
	cmp	r0, #1
	addeq	r4, r4, #1
	beq	.L710
	ldrsb	ip, [r3, #-94]
	cmp	ip, #2
	bne	.L710
	cmp	r0, #0
	add	r2, r2, #1
	addeq	r6, r6, #1
	cmp	r2, r1
	add	r3, r3, #100
	bne	.L712
.L709:
	sub	r3, fp, #44
	sub	r2, fp, #40
	sub	r1, fp, #48
	mov	r0, r7
	bl	VCTRL_GetChanImgNum
	ldr	r3, [fp, #-48]
	ldrsb	r2, [r5, #10]
	add	r3, r8, r3
	cmp	r3, r2
	bcc	.L720
	add	r4, r4, r6
	add	r8, r4, r8
	cmp	r2, r8
	bhi	.L720
	ldr	r3, .L725
	ldr	r3, [r3, r7, asl #2]
	ldr	r3, [r3, #564]
	cmp	r3, #2
	beq	.L720
	mov	r0, r7
	bl	FSP_PrintContext
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L720:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L717:
	mov	r6, #0
	mov	r4, r6
	b	.L709
.L726:
	.align	2
.L725:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	FSP_IsRefLeak, .-FSP_IsRefLeak
	.align	2
	.global	FSP_IsNewFsAvalible
	.type	FSP_IsNewFsAvalible, %function
FSP_IsNewFsAvalible:
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
	cmp	r0, #31
	mov	r6, r0
	bhi	.L776
	ldr	r3, .L781
	ldr	r7, [r3, r0, asl #2]
	cmp	r7, #0
	beq	.L777
	ldr	r3, .L781+4
	ldr	r2, [r3, #392]
	cmp	r2, #0
	bne	.L731
.L735:
	ldrsb	r3, [r7, #10]
	cmp	r3, #0
	bne	.L778
.L732:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L778:
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L736
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #16
	beq	.L737
.L740:
	ldrsb	r8, [r7, #10]
	cmp	r8, #0
	addgt	r4, r7, #22528
	movgt	r5, #0
	addgt	r4, r4, #156
	bgt	.L742
	b	.L739
.L779:
	add	r5, r5, #1
	cmp	r5, r8
	beq	.L739
.L742:
	mov	r1, r4
	mov	r0, r6
	bl	FSP_IsDecFsAvailable
	add	r4, r4, #100
	cmp	r0, #1
	bne	.L779
	cmp	r5, r8
	bge	.L739
.L747:
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	beq	.L732
	ldrsb	r1, [r7, #13]
	cmp	r1, #0
	ble	.L748
	add	r3, r7, #29440
	add	r3, r3, #236
	ldrh	r3, [r3]
	cmp	r3, #1
	beq	.L732
	mov	r2, #0
	b	.L749
.L750:
	add	r3, r7, r3, lsl #3
	ldrh	r3, [r3, #4]
	cmp	r3, #1
	beq	.L732
.L749:
	add	r2, r2, #1
	cmp	r2, r1
	add	r3, r2, #3696
	add	r3, r3, #13
	bne	.L750
.L751:
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #0
	beq	.L732
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #16
	beq	.L732
	mov	r0, r6
	bl	VCTRL_GetVidStd
	cmp	r0, #15
	beq	.L732
.L739:
	mov	r0, r6
	bl	FSP_IsFsLeak
	cmp	r0, #1
	movne	r0, #0
	mvneq	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L731:
	ldr	r4, [r3, #396]
	cmp	r4, #0
	beq	.L780
	blx	r4
	cmp	r0, #0
	beq	.L735
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L736:
	ldr	r3, .L781+8
	add	r4, r7, #22528
	add	r4, r4, #156
	mov	r5, #0
	ldr	r3, [r3, r6, asl #2]
	add	r3, r3, #610304
	ldr	r8, [r3, #2780]
	b	.L746
.L744:
	add	r5, r5, #1
	add	r4, r4, #100
	cmp	r5, #32
	beq	.L739
.L746:
	mov	r1, r4
	mov	r0, r6
	bl	FSP_IsDecFsAvailable
	cmp	r0, #1
	bne	.L744
	ldr	r3, [r4, #20]
	cmp	r3, r8
	bne	.L744
	cmp	r5, #31
	ble	.L747
	b	.L739
.L737:
	mov	r1, r6
	mov	r0, r7
	bl	FSP_IsRefLeak
	cmp	r0, #0
	beq	.L740
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L776:
	ldr	r3, .L781+12
	movw	r2, #1094
	ldr	r1, .L781+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L748:
	bne	.L739
	b	.L751
.L777:
	mov	r0, r7
	ldr	r3, .L781+20
	movw	r2, #1095
	ldr	r1, .L781+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L780:
	ldr	r1, .L781+24
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L782:
	.align	2
.L781:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	s_pstVfmwChan
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	FSP_IsNewFsAvalible, .-FSP_IsNewFsAvalible
	.align	2
	.global	FSP_GetQueSwitchFlag
	.type	FSP_GetQueSwitchFlag, %function
FSP_GetQueSwitchFlag:
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
	cmp	r0, #31
	bhi	.L786
	mov	r2, r0, asl #8
	ldr	r3, .L787
	add	r0, r2, r0, lsl #3
	add	r0, r3, r0
	ldrb	r0, [r0, #128]	@ zero_extendqisi2
	ldmfd	sp, {fp, sp, pc}
.L786:
	ldr	r3, .L787+4
	movw	r2, #2267
	ldr	r1, .L787+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #255
	ldmfd	sp, {fp, sp, pc}
.L788:
	.align	2
.L787:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_GetQueSwitchFlag, .-FSP_GetQueSwitchFlag
	.align	2
	.global	FSP_SetQueSwitchFlag
	.type	FSP_SetQueSwitchFlag, %function
FSP_SetQueSwitchFlag:
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
	cmp	r0, #31
	bhi	.L791
	mov	r2, r0, asl #8
	ldr	r3, .L792
	add	r0, r2, r0, lsl #3
	mov	r2, #1
	add	r0, r3, r0
	strb	r2, [r0, #128]
	ldmfd	sp, {fp, sp, pc}
.L791:
	ldr	r3, .L792+4
	movw	r2, #2277
	ldr	r1, .L792+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L793:
	.align	2
.L792:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	FSP_SetQueSwitchFlag, .-FSP_SetQueSwitchFlag
	.align	2
	.global	FSP_IsFsInVO
	.type	FSP_IsFsInVO, %function
FSP_IsFsInVO:
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
	ldr	ip, .L808
	ldr	r2, [ip, r0, asl #2]
	cmp	r2, #0
	beq	.L803
	mov	r3, r0, asl #8
	add	r3, r3, r0, lsl #3
	add	r3, ip, r3
	add	r3, r3, #128
	ldrsh	lr, [r3, #2]
	cmn	lr, #1
	beq	.L803
	ldrh	r3, [r3, #4]
	cmp	r3, lr
	beq	.L803
	ldr	r2, [r2, #4]
	cmp	r2, #1
	beq	.L807
.L803:
	mov	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L807:
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L803
	mov	r4, r0, asl #6
	add	r0, r4, r0, lsl #1
	add	r4, r0, r3
	add	r4, ip, r4, lsl #2
	ldr	r4, [r4, #136]
	cmp	r4, r1
	bne	.L797
	b	.L805
.L798:
	ldr	r2, [r2, #136]
	cmp	r2, r1
	beq	.L805
.L797:
	add	r3, r3, #1
	and	r3, r3, #63
	add	r2, r0, r3
	cmp	lr, r3
	add	r2, ip, r2, lsl #2
	bne	.L798
	b	.L803
.L805:
	mov	r0, #1
	ldmfd	sp, {r4, fp, sp, pc}
.L809:
	.align	2
.L808:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_IsFsInVO, .-FSP_IsFsInVO
	.align	2
	.global	FSP_ProcFspQue
	.type	FSP_ProcFspQue, %function
FSP_ProcFspQue:
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
	beq	.L831
	cmp	r2, #1
	bhi	.L832
	beq	.L833
	mov	r3, r0, asl #8
	mov	r10, r0, asl #3
	ldr	r5, .L834
	add	r9, r10, r3
	str	r3, [fp, #-48]
	add	r9, r5, r9
	ldrh	r7, [r9, #132]
	ldrh	r8, [r9, #134]
	and	r3, r7, #63
	cmp	r8, r3
	beq	.L815
	mov	r6, r0, asl #6
	add	r6, r6, r0, lsl #1
.L820:
	add	r2, r6, r3
	ldr	r0, [r1, #28]
	add	r2, r5, r2, lsl #2
	ldr	r2, [r2, #136]
	cmp	r0, r2
	beq	.L821
	cmp	r2, #0
	movne	ip, r3
	bne	.L817
	mov	lr, #2
.L816:
	mov	ip, r7
.L819:
	cmp	r3, #0
	mov	r4, #63
	subne	r4, r3, #1
	add	r2, r6, r3
	add	r0, r6, r4
	cmp	r3, r7
	add	r2, r5, r2, lsl #2
	mov	r3, r4
	add	r0, r5, r0, lsl #2
	ldr	r0, [r0, #136]
	str	r0, [r2, #136]
	bne	.L819
	cmp	lr, #1
	add	r7, r7, #1
	and	r7, r7, #63
	strh	r7, [r9, #132]	@ movhi
	beq	.L815
.L817:
	add	r3, ip, #1
	and	r3, r3, #63
	cmp	r3, r8
	bne	.L820
.L815:
	ldr	r3, [fp, #-48]
	add	r10, r10, r3
	add	r5, r5, r10
	ldrsh	r2, [r5, #130]
	cmp	r7, r2
	moveq	r1, #0
	mvneq	r2, #0
	streqb	r1, [r5, #128]
	streqh	r2, [r5, #130]	@ movhi
.L810:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L821:
	mov	lr, #1
	b	.L816
.L832:
	ldr	r3, .L834+4
	movw	r2, #2338
	ldr	r1, .L834+8
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L833:
	ldr	ip, .L834
	mov	r3, r0, asl #8
	add	r3, r3, r0, lsl #3
	mov	r2, r0, asl #6
	add	r3, ip, r3
	add	r0, r2, r0, lsl #1
	ldr	lr, [r1, #28]
	ldrh	r2, [r3, #134]
	add	r1, r0, r2
	add	r2, r2, #1
	and	r2, r2, #63
	strh	r2, [r3, #134]	@ movhi
	add	r1, ip, r1, lsl #2
	str	lr, [r1, #136]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L831:
	mov	r0, r1
	ldr	r3, .L834+12
	movw	r2, #2337
	ldr	r1, .L834+8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L835:
	.align	2
.L834:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	.word	.LC56
	UNWIND(.fnend)
	.size	FSP_ProcFspQue, .-FSP_ProcFspQue
	.align	2
	.global	FSP_GetNullLogicFs
	.type	FSP_GetNullLogicFs, %function
FSP_GetNullLogicFs:
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
	ldr	r3, .L844
	ldr	ip, [r3, r0, asl #2]
	add	r3, ip, #21760
	ldrsb	r3, [r3, #121]
	cmp	r3, #0
	beq	.L841
	add	r2, ip, #20992
	mov	r3, #30
	add	r2, r2, #185
	b	.L840
.L838:
	subs	r3, r3, #1
	bcc	.L843
.L840:
	ldrsb	r1, [r2]
	sub	r2, r2, #704
	cmp	r1, #0
	bne	.L838
.L839:
	mov	r2, #704
	mov	r0, r3
	mla	r3, r2, r3, ip
	mov	r2, #0
	str	r2, [r3, #736]
	str	r2, [r3, #740]
	ldmfd	sp, {fp, sp, pc}
.L843:
	mov	r3, #0
	b	.L839
.L841:
	mov	r3, #31
	b	.L839
.L845:
	.align	2
.L844:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	FSP_GetNullLogicFs, .-FSP_GetNullLogicFs
	.align	2
	.global	FSP_GetFspType
	.type	FSP_GetFspType, %function
FSP_GetFspType:
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
	cmp	r0, #31
	bhi	.L850
	ldr	r3, .L852
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L851
	ldr	r0, [r0, #4]
	subs	r0, r0, #1
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L850:
	ldr	r3, .L852+4
	movw	r2, #2446
	ldr	r1, .L852+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L851:
	ldr	r3, .L852+12
	movw	r2, #2447
	ldr	r1, .L852+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L853:
	.align	2
.L852:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetFspType, .-FSP_GetFspType
	.align	2
	.global	FSP_GetTotalValidFsNum
	.type	FSP_GetTotalValidFsNum, %function
FSP_GetTotalValidFsNum:
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
	cmp	r0, #31
	bhi	.L858
	ldr	r3, .L860
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L859
	ldrsb	r0, [r0, #9]
	ldmfd	sp, {fp, sp, pc}
.L858:
	ldr	r3, .L860+4
	mov	r2, #2464
	ldr	r1, .L860+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L859:
	ldr	r3, .L860+12
	movw	r2, #2465
	ldr	r1, .L860+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L861:
	.align	2
.L860:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC4
	UNWIND(.fnend)
	.size	FSP_GetTotalValidFsNum, .-FSP_GetTotalValidFsNum
	.global	s_FspVoQue
	.global	s_pFspInst
	.section	.rodata
	.align	2
.LANCHOR2 = . + 0
	.type	__func__.14679, %object
	.size	__func__.14679, 15
__func__.14679:
	.ascii	"FSP_NewLogicFs\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"InstID out of range\000" )
.LC1:
	ASCII(.ascii	"fsp.c,L%d: %s\012\000" )
	.space	1
.LC2:
	ASCII(.ascii	"fsp instance not in used\000" )
	.space	3
.LC3:
	ASCII(.ascii	"pFspInst = NULL\000" )
.LC4:
	ASCII(.ascii	"fsp is not inited\000" )
	.space	2
.LC5:
	ASCII(.ascii	"%s : AllocFrame func null\012\000" )
	.space	1
.LC6:
	ASCII(.ascii	"%s : RleaseFrame func null\012\000" )
.LC7:
	ASCII(.ascii	"pstFspInstCfg = NULL\000" )
	.space	3
.LC8:
	ASCII(.ascii	"This inst is not active\000" )
.LC9:
	ASCII(.ascii	"eChanCapLevel = %d is not expected!\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"decode channel CapLevel is %d(w=%d,h=%d), this stre" )
	ASCII(.ascii	"am (w=%d,h=%d) can NOT be decoded!\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"user set decode channel max resolution is (w=%d,h=%" )
	ASCII(.ascii	"d), this stream (w=%d,h=%d) can NOT be decoded!\012" )
	ASCII(.ascii	"\000" )
.LC12:
	ASCII(.ascii	"DFS, Wrong Partition State. State: 0x%x\012\000" )
	.space	3
.LC13:
	ASCII(.ascii	"DFS, Mem Element Fill Successed! Ready to Decode!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC14:
	ASCII(.ascii	"Fsp arrange failed, return %d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"arrange ret %d, min = %d, actual = %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"PhyAddr is NULL\012\000" )
	.space	3
.LC17:
	ASCII(.ascii	"pFsNum is NULL\012\000" )
.LC18:
	ASCII(.ascii	"FSP_IsFsLeak: fsp is not inited \012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"no logic frame store!!!\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"%s no decode phy fs\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"no pmv memory\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"FSP_AllocFrame failed\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"invalid stFrameInfo PhyAddr\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"LogicFrameID out of range\000" )
	.space	2
.LC25:
	ASCII(.ascii	"fsp.c, line %d: pstLogicFs->PmvIdc out of range(=%d" )
	ASCII(.ascii	")\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"FSP_GetRef: InstID out of range\000" )
.LC27:
	ASCII(.ascii	"FSP_GetRef: LogicFrameID out of range\000" )
	.space	2
.LC28:
	ASCII(.ascii	"FSP_GetRef: Fsp is not inited\000" )
	.space	2
.LC29:
	ASCII(.ascii	"FSP_SetDisplay: LogicTick=%d, DispTick=%d!\012\000" )
.LC30:
	ASCII(.ascii	"pstVoQue is NULL\000" )
	.space	3
.LC31:
	ASCII(.ascii	"DecFsAddrTab is NULL\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"DecFsNum is NULL\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"PmvAddrTab is NULL\012\000" )
.LC34:
	ASCII(.ascii	"PmvNum is NULL\012\000" )
.LC35:
	ASCII(.ascii	"FSP CONTEXT:\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"FspInstState\000" )
	.space	3
.LC37:
	ASCII(.ascii	"%-35s :%d\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"DecFsWidth\000" )
	.space	1
.LC39:
	ASCII(.ascii	"DecFsHeight\000" )
.LC40:
	ASCII(.ascii	"DispFsWidth\000" )
.LC41:
	ASCII(.ascii	"DispFsHeight\000" )
	.space	3
.LC42:
	ASCII(.ascii	"ExpectedDecFsNum\000" )
	.space	3
.LC43:
	ASCII(.ascii	"ExpectedDispFsNum\000" )
	.space	2
.LC44:
	ASCII(.ascii	"ExpectedPmvNum\000" )
	.space	1
.LC45:
	ASCII(.ascii	"DecFsNum\000" )
	.space	3
.LC46:
	ASCII(.ascii	"DispFsNum\000" )
	.space	2
.LC47:
	ASCII(.ascii	"PmvNum\000" )
	.space	1
.LC48:
	ASCII(.ascii	"logic fs: %d\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC50:
	ASCII(.ascii	"%d%d \000" )
	.space	2
.LC51:
	ASCII(.ascii	"\012dec fs: %d\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"\012disp fs: %d\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	"\012pmv: %d\012\000" )
	.space	2
.LC54:
	ASCII(.ascii	"\012\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"%d \000" )
.LC56:
	ASCII(.ascii	"p_image NULL\000" )
	.space	3
.LC57:
	ASCII(.ascii	"Flag Invalid\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
.LANCHOR1 = . + 8184
	.type	s_pFspInst, %object
	.size	s_pFspInst, 128
s_pFspInst:
	.space	128
	.type	s_FspVoQue, %object
	.size	s_FspVoQue, 8448
s_FspVoQue:
	.space	8448
	.type	g_IsFrameIntfValid, %object
	.size	g_IsFrameIntfValid, 4
g_IsFrameIntfValid:
	.space	4
	.type	g_FspFrameIntf, %object
	.size	g_FspFrameIntf, 16
g_FspFrameIntf:
	.space	16
	.type	MemArrange.14551, %object
	.size	MemArrange.14551, 1368
MemArrange.14551:
	.space	1368
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
