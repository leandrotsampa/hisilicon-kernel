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
	.file	"scd_drv.c"
	.text
	.align	2
	.type	GetFreeSegBufSize.part.5, %function
GetFreeSegBufSize.part.5:
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
	add	r0, r0, #163840
	mov	r3, #0
	str	r3, [r1]
	ldr	r3, [r0, #36]
	ldr	r2, [r0, #32]
	cmp	r3, r2
	bls	.L2
	ldr	r0, [r0, #28]
	sub	r2, r2, #1
	add	r2, r2, r0
	rsb	r3, r3, r2
.L3:
	cmp	r3, r0
	strle	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L2:
	ldrcs	r0, [r0, #28]
	subcc	r2, r2, #1
	ldrcc	r0, [r0, #28]
	rsbcc	r3, r3, r2
	subcs	r3, r0, #1
	b	.L3
	UNWIND(.fnend)
	.size	GetFreeSegBufSize.part.5, .-GetFreeSegBufSize.part.5
	.align	2
	.global	SCDDRV_LoadDspCode
	.type	SCDDRV_LoadDspCode, %function
SCDDRV_LoadDspCode:
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
	subs	r4, r0, #0
	mov	r7, r1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r5, .L27
	ldr	r0, [r5]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L22
	cmp	r7, #1
	beq	.L23
	cmp	r7, #2
	beq	.L24
	mov	r0, r4
	ldr	r1, .L27+4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L24:
	ldr	r6, .L27+8
	mov	r2, #17920
	ldr	r1, .L27+12
	ldr	r3, [r6, #52]
	blx	r3
	mov	r1, r4
	ldr	r0, [r5, #4]
	bl	MEM_WritePhyWord
.L12:
	ldr	r0, [r5, #4]
	mov	r1, #4480
	mov	r4, #0
	add	r0, r0, #264
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	add	r0, r0, #268
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #4]
	mov	r1, r4
	add	r0, r0, #256
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #4]
	mov	r1, #5
	add	r0, r0, #256
	bl	MEM_WritePhyWord
	b	.L15
.L25:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L16
.L15:
	ldr	r3, [r6, #116]
	mov	r0, #30
	blx	r3
	ldr	r0, [r5, #4]
	add	r0, r0, #260
	bl	MEM_ReadPhyWord
	tst	r0, #1
	beq	.L25
	cmp	r4, #1000
	bcs	.L16
	ldr	r2, .L27+16
	mov	r0, #0
	ldr	r1, .L27+20
	bl	dprint_vfmw
.L18:
	cmp	r7, #1
	beq	.L26
	cmp	r7, #2
	ldreq	r3, .L27+24
	moveq	r2, #1
	streq	r2, [r3]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L16:
	ldr	r2, .L27+16
	mov	r0, #0
	ldr	r1, .L27+28
	bl	dprint_vfmw
	b	.L18
.L23:
	ldr	r6, .L27+8
	mov	r2, #17920
	ldr	r1, .L27+32
	ldr	r3, [r6, #52]
	blx	r3
	mov	r1, r7
	ldr	r0, [r5, #4]
	bl	MEM_WritePhyWord
	b	.L12
.L26:
	ldr	r3, .L27+24
	mov	r2, #2
	str	r2, [r3]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L22:
	ldr	r2, [r5]
	ldr	r1, .L27+36
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2+1552
	.word	.LANCHOR3
	.word	.LC5
	.word	g_DspDrvState
	.word	.LC4
	.word	.LANCHOR1
	.word	.LC2
	UNWIND(.fnend)
	.size	SCDDRV_LoadDspCode, .-SCDDRV_LoadDspCode
	.align	2
	.global	GetInstIDByRawArray
	.type	GetInstIDByRawArray, %function
GetInstIDByRawArray:
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
	ldr	ip, .L39
	mov	r3, #0
	b	.L32
.L30:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L38
.L32:
	ldr	r2, [ip, r3, asl #3]
	cmp	r2, #0
	add	r1, r2, #72
	beq	.L30
	cmp	r0, r1
	bne	.L30
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L38:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	.LANCHOR0+8
	UNWIND(.fnend)
	.size	GetInstIDByRawArray, .-GetInstIDByRawArray
	.align	2
	.global	SCDDRV_SetStateIdle
	.type	SCDDRV_SetStateIdle, %function
SCDDRV_SetStateIdle:
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
	ldr	r2, .L42
	mov	r3, r0, asl #6
	ldr	ip, .L42+4
	sub	r3, r3, r0, asl #2
	add	r3, r2, r3
	mov	r1, #0
	mov	r0, #1
	ldr	r2, [ip, #128]
	str	r1, [r3, #312]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r2
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SetStateIdle, .-SCDDRV_SetStateIdle
	.align	2
	.global	SCDDRV_SetStateWork
	.type	SCDDRV_SetStateWork, %function
SCDDRV_SetStateWork:
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
	ldr	r3, .L45
	mov	r2, r0, asl #6
	sub	r0, r2, r0, asl #2
	mov	r1, #1
	add	r0, r3, r0
	str	r1, [r0, #312]
	ldmfd	sp, {fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_SetStateWork, .-SCDDRV_SetStateWork
	.align	2
	.global	ResetSCD
	.type	ResetSCD, %function
ResetSCD:
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
	ldr	r5, .L68
	mov	r7, r0, asl #2
	mov	r4, r0
	mov	r1, #3
	add	r8, r5, r7
	ldr	r0, [r8, #4]
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	ldr	r0, [r8, #4]
	ldr	r8, .L68+4
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	cmp	r4, #0
	ldr	lr, [r8]
	mov	r9, r0
	bne	.L51
	ldr	r6, [lr, #120]
	ands	r2, r6, #1
	orrne	r6, r6, #32
	strne	r6, [lr, #120]
	beq	.L65
.L51:
	mov	r3, #0
	movw	r2, #10000
	b	.L53
.L56:
	add	r3, r3, #1
	cmp	r3, r2
	beq	.L66
.L53:
	cmp	r4, #0
	ldr	ip, [lr, #372]
	bne	.L56
	tst	ip, #2
	beq	.L56
	movw	r2, #9999
	cmp	r3, r2
	bhi	.L67
.L58:
	bfc	r6, #5, #1
	str	r6, [lr, #120]
.L57:
	add	r5, r5, r7
	and	r1, r9, #1
	ldr	r0, [r5, #4]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldr	r0, [r5, #4]
	mov	r1, #2
	add	r0, r0, #2176
	bl	MEM_WritePhyWord
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L66:
	mov	r2, r4
	ldr	r1, .L68+8
	mov	r0, #0
	bl	dprint_vfmw
	cmp	r4, #0
	bne	.L57
.L59:
	ldr	lr, [r8]
	b	.L58
.L65:
	ldr	r1, .L68+12
	mov	r0, #26
	bl	dprint_vfmw
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L67:
	mov	r2, r4
	mov	r0, r4
	ldr	r1, .L68+8
	bl	dprint_vfmw
	b	.L59
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	g_pstRegCrg
	.word	.LC7
	.word	.LC6
	UNWIND(.fnend)
	.size	ResetSCD, .-ResetSCD
	.align	2
	.global	SCDDRV_ResetSCD
	.type	SCDDRV_ResetSCD, %function
SCDDRV_ResetSCD:
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
	ldr	r4, .L74
	ldr	r3, [r4, #308]
	cmp	r3, r0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L74+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L72
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Reset_Module
.L73:
	ldr	r3, .L74+8
	mov	r2, #0
	mov	r0, #1
	str	r2, [r4, #312]
	ldr	r3, [r3, #128]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L72:
	mov	r0, #0
	bl	ResetSCD
	b	.L73
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
	.word	g_HalDisable
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_ResetSCD, .-SCDDRV_ResetSCD
	.align	2
	.global	SCDDRV_IsRawArrayFull
	.type	SCDDRV_IsRawArrayFull, %function
SCDDRV_IsRawArrayFull:
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
	add	r0, r0, #98304
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #8]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	rsb	r0, r0, r3
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawArrayFull, .-SCDDRV_IsRawArrayFull
	.align	2
	.global	SCDDRV_InsertRawPacket
	.type	SCDDRV_InsertRawPacket, %function
SCDDRV_InsertRawPacket:
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
	ldr	r3, .L81
	ldr	r5, [r1, #4]
	add	r0, r3, r0, lsl #3
	ldr	r2, [r0, #8]
	cmp	r2, #0
	cmpne	r5, #0
	moveq	r5, #1
	movne	r5, #0
	beq	.L79
	add	r4, r2, #98304
	ldr	r0, [r4, #76]
	ldr	lr, [r4, #80]
	add	r3, r0, #1
	mov	ip, r3, asr #31
	mov	ip, ip, lsr #22
	add	r3, r3, ip
	ubfx	r3, r3, #0, #10
	rsb	r3, ip, r3
	cmp	r3, lr
	beq	.L80
	ldr	ip, .L81+4
	mov	r3, r0, asl #7
	add	r2, r2, #72
	sub	r0, r3, r0, asl #5
	add	r0, r2, r0
	mov	r2, #96
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #76]
	mov	r0, r5
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r4, #76]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L80:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L79:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_InsertRawPacket, .-SCDDRV_InsertRawPacket
	.align	2
	.global	GetRawState
	.type	GetRawState, %function
GetRawState:
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
	bhi	.L86
	ldr	r3, .L88
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L86
	add	r2, r3, #98304
	ldr	r3, [r2, #76]
	ldr	r1, [r2, #80]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	cmp	r3, r1
	mvneq	r0, #3
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L86:
	mvn	r0, #3
	ldmfd	sp, {fp, sp, pc}
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	GetRawState, .-GetRawState
	.align	2
	.global	ShowRawPacket
	.type	ShowRawPacket, %function
ShowRawPacket:
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
	add	r4, r0, #98304
	mov	ip, r0
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	cmp	r3, r2
	beq	.L92
	ldr	lr, .L93
	mov	r2, r3, asl #7
	sub	r3, r2, r3, asl #5
	mov	r0, r1
	mov	r2, #96
	add	r1, ip, r3
	ldr	r3, [lr, #52]
	blx	r3
	ldr	r3, [r4, #16]
	mov	r0, #0
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r4, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L92:
	mvn	r0, #2
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L94:
	.align	2
.L93:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ShowRawPacket, .-ShowRawPacket
	.align	2
	.global	GetFirstRawPacket
	.type	GetFirstRawPacket, %function
GetFirstRawPacket:
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
	beq	.L103
	add	r5, r0, #98304
	ldr	r3, [r5]
	ldr	r2, [r5, #4]
	cmp	r3, r2
	beq	.L99
	ldr	r8, [r5, #12]
	str	r3, [r5, #16]
	mov	r7, r8, asr #31
	mov	r6, r8
	mov	r9, r8
.L98:
	ldr	ip, .L104
	mov	r1, r3, asl #7
	sub	r1, r1, r3, asl #5
	mov	r2, #96
	add	r1, r0, r1
	mov	r0, r4
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r5, #16]
	add	r3, r3, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r5, #16]
.L97:
	ldrd	r2, [r4, #40]
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #8]
	adds	r6, r6, r2
	add	r9, r0, r9
	adc	r7, r7, r3
	rsb	r8, r8, r1
	str	r9, [r4, #4]
	strd	r6, [r4, #40]
	str	r8, [r4, #8]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L99:
	mov	r9, #0
	str	r3, [r5, #16]
	mov	r8, r9
	mov	r6, #0
	mov	r7, #0
	b	.L97
.L103:
	mov	r5, #98304
	ldr	r3, [r5]
	ldr	r2, [r5, #4]
	cmp	r3, r2
	str	r3, [r5, #16]
	movne	r6, #0
	movne	r7, #0
	movne	r9, r0
	movne	r8, r0
	bne	.L98
	mov	r9, r0
	mov	r6, #0
	mov	r7, #0
	mov	r8, r0
	b	.L97
.L105:
	.align	2
.L104:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	GetFirstRawPacket, .-GetFirstRawPacket
	.align	2
	.global	SetFirstOffset
	.type	SetFirstOffset, %function
SetFirstOffset:
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
	cmp	r0, #0
	beq	.L110
	add	r3, r0, #98304
	ldmia	r3, {r2, ip}
	cmp	r2, ip
	beq	.L109
	mov	ip, r2, asl #7
	ldr	lr, [r3, #12]
	sub	r2, ip, r2, asl #5
	add	r0, r0, r2
	add	r1, r1, lr
	ldr	r2, [r0, #8]
	cmp	r1, r2
	bge	.L110
	str	r1, [r3, #12]
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L110:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L109:
	mvn	r0, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFirstOffset, .-SetFirstOffset
	.align	2
	.global	GetFirstOffset
	.type	GetFirstOffset, %function
GetFirstOffset:
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
	cmpne	r0, #0
	moveq	r2, #1
	movne	r2, #0
	beq	.L113
	add	r3, r0, #98304
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	cmp	ip, r0
	beq	.L114
	ldr	r3, [r3, #12]
	mov	r0, r2
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
.L113:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L114:
	mvn	r0, #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetFirstOffset, .-GetFirstOffset
	.align	2
	.global	DeleteRawPacket
	.type	DeleteRawPacket, %function
DeleteRawPacket:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r7, r0
	mov	r8, r1
	moveq	r2, #1
	movne	r2, #0
	beq	.L131
	ldr	r0, .L143
	b	.L120
.L117:
	add	r2, r2, #1
	cmp	r2, #32
	beq	.L118
.L120:
	ldr	r3, [r0, r2, asl #3]
	mov	r6, r2, asl #3
	cmp	r3, #0
	add	r1, r3, #72
	beq	.L117
	cmp	r7, r1
	bne	.L117
	cmp	r2, #0
	blt	.L118
	add	r3, r7, #98304
	str	r3, [fp, #-48]
	mov	r2, r3
	ldr	r3, [r3]
	ldr	r2, [r2, #4]
	cmp	r3, r2
	addgt	r2, r2, #1024
	rsb	r2, r3, r2
	cmp	r2, r8
	bcc	.L142
	cmp	r8, #0
	mov	r5, r3
	beq	.L124
	ldr	r9, .L143+4
	mov	r10, #0
.L125:
	mov	r4, r5, asl #7
	ldr	r2, .L143+8
	sub	r4, r4, r5, asl #5
	ldr	r1, .L143+12
	add	r4, r7, r4
	mov	r0, #26
	add	r10, r10, #1
	add	r5, r5, #1
	ldmib	r4, {r3, lr}
	ubfx	r5, r5, #0, #10
	str	lr, [sp]
	bl	dprint_vfmw
	add	r2, r9, r6
	ldr	r1, [r4, #8]
	cmp	r10, r8
	ldr	r2, [r2, #8]
	add	r2, r2, #98304
	ldr	r3, [r2, #92]
	rsb	r3, r1, r3
	bic	r3, r3, r3, asr #31
	str	r3, [r2, #92]
	bne	.L125
	ldr	r2, [fp, #-48]
	ldr	r3, [r2]
	add	ip, r10, r3
	str	ip, [r2]
	cmp	ip, #1024
	bge	.L129
.L130:
	ldr	r3, [fp, #-48]
	mov	r0, #0
	str	r0, [r3, #12]
.L138:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L129:
	ldr	r3, [fp, #-48]
	sub	ip, ip, #1024
	str	ip, [r3]
	b	.L130
.L124:
	ldr	r2, [fp, #-48]
	cmp	r3, #1024
	str	r3, [r2]
	ldrge	r2, [fp, #-48]
	subge	r3, r3, #1024
	strge	r3, [r2]
.L128:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L131:
	mvn	r0, #0
	b	.L138
.L142:
	mov	r3, r8
	ldr	r1, .L143+16
	mov	r0, #26
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L138
.L118:
	movw	r2, #539
	ldr	r1, .L143+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L138
.L144:
	.align	2
.L143:
	.word	.LANCHOR0+8
	.word	.LANCHOR0
	.word	.LANCHOR3+20
	.word	.LC10
	.word	.LC9
	.word	.LC8
	UNWIND(.fnend)
	.size	DeleteRawPacket, .-DeleteRawPacket
	.align	2
	.global	GetRawNumOffset
	.type	GetRawNumOffset, %function
GetRawNumOffset:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	clz	ip, r0
	mov	ip, ip, lsr #5
	orrs	r6, ip, r1, lsr #31
	bne	.L152
	add	r8, r0, #98304
	cmp	ip, #0
	ldr	r7, [r8]
	ldr	lr, [r8, #12]
	mov	ip, r7, asl #7
	sub	ip, ip, r7, asl #5
	add	ip, r0, ip
	ldr	r5, [ip, #8]
	rsb	r5, lr, r5
	bne	.L147
	ldr	r6, [r8, #4]
	subs	r6, r6, r7
	addmi	r6, r6, #1024
.L147:
	cmp	r1, r5
	add	r6, r7, r6
	mov	ip, r7
	movge	lr, #0
	movlt	lr, #1
	cmp	r6, r7
	orrls	lr, lr, #1
	cmp	lr, #0
	bne	.L148
	mov	r4, r7
.L149:
	add	r4, r4, #1
	mov	ip, r4, asr #31
	mov	lr, ip, lsr #22
	add	ip, r4, lr
	ubfx	ip, ip, #0, #10
	rsb	ip, lr, ip
	mov	lr, ip, asl #7
	sub	lr, lr, ip, asl #5
	add	lr, r0, lr
	ldr	r9, [lr, #8]
	add	r5, r5, r9
	cmp	r1, r5
	movge	lr, #0
	movlt	lr, #1
	cmp	r6, r4
	orrls	lr, lr, #1
	cmp	lr, #0
	beq	.L149
	cmp	r7, r4
	rsbne	r5, r9, r5
	rsbne	r5, r5, r1
	strne	r5, [r3]
	beq	.L148
.L151:
	ldr	r3, [fp, #4]
	mov	r0, #0
	str	ip, [r3]
	ldr	r3, [r8]
	rsb	r4, r3, r4
	str	r4, [r2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L148:
	str	r1, [r3]
	mov	r4, r7
	b	.L151
.L152:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawNumOffset, .-GetRawNumOffset
	.align	2
	.global	DeleteRawLen
	.type	DeleteRawLen, %function
DeleteRawLen:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	clz	r3, r0
	mov	r5, r0
	mov	r3, r3, lsr #5
	orrs	ip, r3, r1, lsr #31
	bne	.L159
	cmp	r3, #0
	str	ip, [fp, #-48]
	str	ip, [fp, #-44]
	bne	.L159
	add	r4, r0, #98304
	ldr	r3, [r4, #20]
	ldr	ip, [r4, #12]
	rsb	r3, ip, r3
	movs	r6, r3, asr #31
	bne	.L164
	cmp	r1, r3
	bgt	.L159
	sub	r2, fp, #40
	sub	r3, fp, #44
	str	r2, [sp]
	sub	r2, fp, #48
	bl	GetRawNumOffset
	ldr	lr, [r4]
	ldr	r7, [fp, #-48]
	mov	r2, #732
	ldr	r8, [fp, #-44]
	mov	r0, #26
	add	lr, r7, lr
	ldr	r1, .L168
	mov	r3, r7
	mov	ip, lr, asr #31
	mov	ip, ip, lsr #22
	add	lr, lr, ip
	ubfx	lr, lr, #0, #10
	rsb	ip, ip, lr
	str	ip, [fp, #-40]
	mov	lr, ip, asl #7
	sub	ip, lr, ip, asl #5
	add	ip, r5, ip
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	str	lr, [sp, #12]
	ldr	ip, [ip, #8]
	str	r7, [sp, #4]
	str	r8, [sp]
	str	ip, [sp, #8]
	bl	dprint_vfmw
	ldr	r2, [fp, #-40]
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #5
	add	r3, r5, r3
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L160
	ldr	r1, [fp, #-48]
.L161:
	mov	r0, r5
	bl	DeleteRawPacket
	ldmia	r4, {r2, r3}
	ldr	r1, [fp, #-44]
	cmp	r2, r3
	beq	.L167
	mov	r3, r2, asl #7
	ldr	r0, [r4, #12]
	sub	r3, r3, r2, asl #5
	add	r5, r5, r3
	add	r1, r1, r0
	ldr	r3, [r5, #8]
	cmp	r1, r3
	strlt	r1, [r4, #12]
	bge	.L159
.L164:
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L159:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L160:
	ldr	r1, [r3, #8]
	movw	r2, #737
	ldr	ip, [fp, #-44]
	mov	r0, #26
	ldr	r3, [fp, #-48]
	str	r1, [sp, #4]
	str	ip, [sp]
	ldr	r1, .L168+4
	bl	dprint_vfmw
	ldr	r1, [fp, #-48]
	str	r6, [fp, #-44]
	add	r1, r1, #1
	str	r1, [fp, #-48]
	b	.L161
.L167:
	mvn	r6, #2
	mov	r0, r6
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L169:
	.align	2
.L168:
	.word	.LC11
	.word	.LC12
	UNWIND(.fnend)
	.size	DeleteRawLen, .-DeleteRawLen
	.align	2
	.global	DeleteLastSendRaw
	.type	DeleteLastSendRaw, %function
DeleteLastSendRaw:
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
	cmp	r0, #31
	ldmhifd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L174
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #8]
	cmp	r0, #0
	beq	.L173
	add	r4, r0, #262144
	ldr	r1, [r4, #152]
	cmp	r1, #0
	ldmlefd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #72
	bl	DeleteRawPacket
	mov	r3, #0
	str	r3, [r4, #152]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L173:
	mov	r2, #764
	ldr	r1, .L174+4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L175:
	.align	2
.L174:
	.word	.LANCHOR0
	.word	.LC13
	UNWIND(.fnend)
	.size	DeleteLastSendRaw, .-DeleteLastSendRaw
	.align	2
	.global	GetRawStreamSize
	.type	GetRawStreamSize, %function
GetRawStreamSize:
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
	cmp	r0, #0
	addne	r0, r0, #98304
	ldrne	r3, [r0, #20]
	strne	r3, [r1]
	ldrne	r0, [r0, #12]
	rsbne	r0, r0, r3
	strne	r0, [r1]
	movne	r0, r0, asr #31
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawStreamSize, .-GetRawStreamSize
	.align	2
	.global	GetRawStreamNum
	.type	GetRawStreamNum, %function
GetRawStreamNum:
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
	cmp	r0, #0
	beq	.L182
	add	r0, r0, #98304
	ldmia	r0, {r2, r3}
	subs	r3, r3, r2
	strpl	r3, [r1]
	addmi	r3, r3, #1024
	strmi	r3, [r1]
	movpl	r0, #0
	movmi	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L182:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawStreamNum, .-GetRawStreamNum
	.align	2
	.global	ConfigStreamSegArray
	.type	ConfigStreamSegArray, %function
ConfigStreamSegArray:
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
	mov	r7, r2
	mov	r6, r3
	mov	r5, r1
	mov	r8, r0
	beq	.L186
	cmp	r3, #262144
	movcs	r4, #0
	movcc	r4, #1
	cmp	r2, #0
	orreq	r4, r4, #1
	cmp	r4, #0
	bne	.L186
	ldr	r3, .L187
	movw	r2, #32824
	movt	r2, 2
	mov	r1, r4
	ldr	r3, [r3, #48]
	blx	r3
	add	ip, r8, #163840
	mov	r0, r4
	str	r5, [ip, #24]
	str	r7, [r8]
	str	r5, [ip, #32]
	str	r5, [ip, #36]
	str	r6, [ip, #28]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L186:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L188:
	.align	2
.L187:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ConfigStreamSegArray, .-ConfigStreamSegArray
	.align	2
	.global	ResetStreamSegArray
	.type	ResetStreamSegArray, %function
ResetStreamSegArray:
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
	subs	r4, r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L194
	mov	r2, #163840
	mov	r1, #0
	add	r0, r4, #8
	ldr	r3, [r3, #48]
	blx	r3
	add	r0, r4, #163840
	mov	r3, #0
	ldr	r2, [r0, #24]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	str	r3, [r0, #16]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L195:
	.align	2
.L194:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ResetStreamSegArray, .-ResetStreamSegArray
	.align	2
	.global	GetSegBufFreeSize
	.type	GetSegBufFreeSize, %function
GetSegBufFreeSize:
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
	add	r0, r0, #163840
	ldr	r3, [r0, #36]
	ldr	r2, [r0, #32]
	cmp	r3, r2
	bhi	.L200
	ldrcs	r0, [r0, #28]
	subcc	r0, r2, #1
	rsbcc	r0, r3, r0
	subcs	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L200:
	ldr	r0, [r0, #28]
	sub	r2, r2, #1
	add	r0, r2, r0
	rsb	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegBufFreeSize, .-GetSegBufFreeSize
	.align	2
	.global	CheckData
	.type	CheckData, %function
CheckData:
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
	and	ip, r1, #31
	sub	r2, ip, #30
	sub	lr, ip, #1
	cmp	ip, #19
	cmpne	r2, #1
	movls	r3, #1
	movhi	r3, #0
	cmp	lr, #12
	orrls	r3, r3, #1
	cmp	r3, #0
	addne	r2, r0, #311296
	ldrne	r3, [r2, #3480]
	addne	r3, r3, #1
	strne	r3, [r2, #3480]
	add	r3, r1, #79
	sub	r2, r1, #1
	uxtb	r3, r3
	cmp	r3, #4
	uxtb	r2, r2
	movhi	r3, #0
	movls	r3, #1
	cmp	r2, #183
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L203
	add	r1, r1, #73
	uxtb	r1, r1
	cmp	r1, #3
	ldmhifd	sp, {fp, sp, pc}
.L203:
	add	r0, r0, #311296
	ldr	r3, [r0, #3484]
	add	r3, r3, #1
	str	r3, [r0, #3484]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckData, .-CheckData
	.align	2
	.global	CheckStartCodeCnt
	.type	CheckStartCodeCnt, %function
CheckStartCodeCnt:
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
	add	r0, r0, #311296
	ldr	r3, [r0, #3488]
	cmp	r3, #2
	ldmlefd	sp, {fp, sp, pc}
	tst	r1, #31
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #3500]
	ldr	r2, [r0, #3496]
	rsb	r1, r2, r3
	cmp	r1, #1
	beq	.L219
.L210:
	cmp	r3, r2
	ldmnefd	sp, {fp, sp, pc}
	ldr	r2, [r0, #3492]
	cmp	r3, r2
	ldmnefd	sp, {fp, sp, pc}
.L211:
	cmp	r3, #1
	cmpne	r3, #20
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, [r0, #3480]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #3480]
	ldr	r3, [r0, #3484]
	add	r3, r3, #1
	str	r3, [r0, #3484]
	ldmfd	sp, {fp, sp, pc}
.L219:
	ldr	r1, [r0, #3492]
	rsb	r1, r1, r2
	cmp	r1, #1
	bne	.L210
	b	.L211
	UNWIND(.fnend)
	.size	CheckStartCodeCnt, .-CheckStartCodeCnt
	.align	2
	.global	CheckStream
	.type	CheckStream, %function
CheckStream:
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
	ldr	r3, .L240
	mov	r6, r1
	ldr	r4, [r3, r1, asl #2]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #544]
	cmp	r3, #0
	cmpne	r3, #3
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r4, #311296
	ldr	r3, [r5, #3488]
	cmp	r3, #199
	ldmgtfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r2, [r0]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #0
	movne	r7, r2
	bne	.L224
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L238
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	cmp	r2, #1
	ldreqb	r7, [r0, #3]	@ zero_extendqisi2
	andeq	r2, r7, #31
	beq	.L224
	mov	r2, r1
.L238:
	mov	r7, r2
.L224:
	ldr	lr, [r5, #3496]
	add	r3, r3, #1
	ldr	ip, [r5, #3500]
	mov	r1, r7
	str	r3, [r5, #3488]
	mov	r0, r4
	str	lr, [r5, #3492]
	str	ip, [r5, #3496]
	str	r2, [r5, #3500]
	bl	CheckData
	mov	r1, r7
	mov	r0, r4
	bl	CheckStartCodeCnt
	ldr	r3, [r5, #3488]
	cmp	r3, #199
	ldmlefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r2, [r5, #3480]
	ldr	r3, [r5, #3484]
	rsb	r1, r3, r2
	cmp	r1, #49
	ble	.L225
	ldr	r1, [r4, #544]
	cmp	r1, #3
	beq	.L239
.L225:
	rsb	r3, r2, r3
	cmp	r3, #49
	ldmlefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r4, #544]
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r2, .L240+4
	ldr	ip, [r2]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, r6
	mov	r2, r3
	mov	r1, #124
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	ip
.L239:
	ldr	r3, .L240+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r3, #0
	mov	r1, #124
	mov	r2, r3
	mov	r0, r6
	blx	ip
	ldr	r3, [r5, #3484]
	ldr	r2, [r5, #3480]
	b	.L225
.L241:
	.align	2
.L240:
	.word	s_pstVfmwChan
	.word	g_event_report
	UNWIND(.fnend)
	.size	CheckStream, .-CheckStream
	.align	2
	.global	InsertStreamSeg
	.type	InsertStreamSeg, %function
InsertStreamSeg:
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
	beq	.L245
	add	r4, r0, #163840
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #8]
	add	r3, r3, #1
	mov	ip, r3, asr #31
	mov	ip, ip, lsr #21
	add	r3, r3, ip
	ubfx	r3, r3, #0, #11
	rsb	r3, ip, r3
	cmp	r3, r1
	beq	.L246
	mov	r1, r2
	ldr	r0, [r6]
	bl	CheckStream
	ldr	r7, [r4, #12]
	ldr	r0, .L250
	mov	r2, #80
	mov	r1, r6
	mov	r3, r7, asl #6
	add	r7, r3, r7, lsl #4
	ldr	r3, [r0, #52]
	add	r0, r7, #8
	add	r7, r5, r7
	add	r0, r5, r0
	blx	r3
	ldr	r1, [r4, #12]
	mov	ip, #1
	add	r3, r1, ip
	mov	r0, r1, asl #6
	mov	r2, r3, asr #31
	add	r0, r0, r1, lsl #4
	add	r5, r5, r0
	mov	r2, r2, lsr #21
	add	r3, r3, r2
	strb	ip, [r5, #12]
	ubfx	r3, r3, #0, #11
	str	r1, [r7, #28]
	rsb	r3, r2, r3
	str	r3, [r4, #12]
	ldrsb	r3, [r6, #5]
	cmp	r3, #2
	beq	.L244
	ldr	r1, [r6, #12]
	ldr	r3, [r6, #16]
	ldr	r2, [r4, #40]
	add	r3, r3, r1
	str	r3, [r4, #36]
	ldr	r1, [r6, #16]
	ldr	r3, [r4, #44]
	add	r2, r2, r1
	str	r2, [r4, #40]
	ldr	r2, [r6, #16]
	add	r3, r3, r2
	str	r3, [r4, #44]
.L244:
	ldr	r3, [r4, #48]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #48]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L246:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L245:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L251:
	.align	2
.L250:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	InsertStreamSeg, .-InsertStreamSeg
	.align	2
	.global	SCDDRV_GetStreamSeg
	.type	SCDDRV_GetStreamSeg, %function
SCDDRV_GetStreamSeg:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r5, r0
	mov	r0, r1
	beq	.L261
	add	r4, r5, #163840
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #12]
	cmp	r1, r3
	beq	.L263
	mov	r6, r3, asl #4
	mov	r7, r3, asl #6
	add	r2, r6, r7
	add	r2, r5, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	bne	.L256
	b	.L254
.L268:
	add	r2, r5, r2
	ldrsb	r2, [r2, #12]
	cmp	r2, #1
	beq	.L254
.L256:
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #21
	add	r2, r2, r3
	ubfx	r2, r2, #0, #11
	rsb	r3, r3, r2
	cmp	r1, r3
	mov	r6, r3, asl #4
	mov	r7, r3, asl #6
	add	r2, r6, r7
	bne	.L268
.L263:
	mvn	r0, #2
.L253:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L254:
	add	r8, r6, r7
	add	r1, r8, #8
	adds	r1, r5, r1
	beq	.L263
	ldr	r3, .L269
	mov	r2, #80
	add	r6, r6, r7
	add	r6, r5, r6
	ldr	r3, [r3, #52]
	blx	r3
	add	r3, r5, r8
	mov	r0, #2
	ldrsb	r1, [r3, #13]
	strb	r0, [r3, #12]
	cmp	r1, r0
	ldr	r3, [r3, #24]
	ldr	r1, [r4, #44]
	mov	r0, #26
	ldr	r2, [r4, #48]
	rsbne	r1, r3, r1
	sub	r2, r2, #1
	bic	r1, r1, r1, asr #31
	str	r1, [r4, #44]
	bic	r2, r2, r2, asr #31
	str	r2, [r4, #48]
	ldrb	ip, [r6, #14]	@ zero_extendqisi2
	ldr	r2, [r6, #20]
	ldr	r1, .L269+4
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L261:
	mvn	r0, #0
	b	.L253
.L270:
	.align	2
.L269:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC14
	UNWIND(.fnend)
	.size	SCDDRV_GetStreamSeg, .-SCDDRV_GetStreamSeg
	.align	2
	.global	ReleaseStreamSeg
	.type	ReleaseStreamSeg, %function
ReleaseStreamSeg:
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L294
	movw	r3, #63486
	sub	r2, r1, #2048
	movt	r3, 65535
	cmp	r2, r3
	bls	.L294
	cmn	r1, #1
	add	r6, r5, #163840
	beq	.L309
	ldr	r3, [r6, #8]
	ldr	r2, [r6, #12]
	cmp	r3, r2
	bne	.L305
	b	.L279
.L282:
	add	r3, r3, #1
	ubfx	r3, r3, #0, #11
	cmp	r3, r2
	beq	.L279
.L305:
	cmp	r4, r3
	bne	.L282
	mov	r2, r3, asl #6
	add	r3, r2, r3, lsl #4
	add	r2, r5, r3
	ldrsb	r2, [r2, #12]
	cmp	r2, #2
	addeq	r3, r3, #8
	addeq	r7, r5, r3
	beq	.L276
.L279:
	mvn	r0, #2
.L304:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L309:
	ldr	r9, [r6, #8]
	ldr	r3, [r6, #12]
	cmp	r9, r3
	beq	.L279
	mov	r3, r9, asl #6
	mov	r4, r9
	add	r9, r3, r9, lsl #4
	mov	r2, r4
	add	r7, r9, #8
	add	r9, r5, r9
	ldr	r1, .L311
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r9, #24]
	add	r7, r5, r7
	cmp	r3, #0
	movne	r8, #0
	beq	.L278
.L277:
	ldr	r3, [r9, #8]
	mov	r0, #0
	ldr	r1, .L311+4
	ldrb	r2, [r3, r8]	@ zero_extendqisi2
	add	r8, r8, #1
	bl	dprint_vfmw
	ldr	r3, [r9, #24]
	cmp	r3, r8
	movhi	r3, #1
	movls	r3, #0
	cmp	r8, #15
	movhi	r3, #0
	cmp	r3, #0
	bne	.L277
.L278:
	ldr	r1, .L311+8
	mov	r0, #0
	bl	dprint_vfmw
.L276:
	cmp	r7, #0
	beq	.L279
	ldr	r3, [r7, #16]
	mov	r2, #0
	strb	r2, [r7, #4]
	mov	r0, #26
	ldr	r2, [r7, #12]
	str	r4, [sp, #4]
	ldrb	ip, [r7, #6]	@ zero_extendqisi2
	ldr	r1, .L311+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #8]
	cmp	r3, r4
	beq	.L289
.L284:
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	beq	.L308
.L290:
	ldr	r2, [r7, #16]
	ldr	r3, [r6, #40]
	rsb	r3, r2, r3
.L288:
	bic	r3, r3, r3, asr #31
	mov	r0, #0
	str	r3, [r6, #40]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L285:
	ldr	r2, [r6, #12]
	cmp	r2, r4
	beq	.L291
	ldrsb	r2, [r3, #12]
	cmp	r2, #0
	bne	.L310
.L295:
	add	r4, r4, #1
	ubfx	r4, r4, #0, #11
.L289:
	mov	r3, r4, asl #6
	cmp	r4, #2048
	add	r3, r3, r4, lsl #4
	add	r3, r5, r3
	bcc	.L285
	ldr	r2, .L311+16
	mov	r0, #1
	ldr	r1, .L311+20
	bl	dprint_vfmw
	ldr	r2, [r6, #12]
	cmp	r2, r4
	bne	.L295
.L291:
	ldr	r3, [r6, #36]
	str	r2, [r6, #8]
	str	r3, [r6, #32]
	ldrsb	r3, [r7, #5]
	cmp	r3, #2
	bne	.L290
.L308:
	ldr	r3, [r6, #40]
	b	.L288
.L310:
	str	r4, [r6, #8]
	ldrsb	r2, [r7, #5]
	cmp	r2, #2
	ldrne	r3, [r3, #20]
	strne	r3, [r6, #32]
	bne	.L284
	b	.L308
.L294:
	mvn	r0, #0
	b	.L304
.L312:
	.align	2
.L311:
	.word	.LC15
	.word	.LC17
	.word	.LC16
	.word	.LC18
	.word	.LANCHOR3+36
	.word	.LC19
	UNWIND(.fnend)
	.size	ReleaseStreamSeg, .-ReleaseStreamSeg
	.align	2
	.global	GetSegStreamSize
	.type	GetSegStreamSize, %function
GetSegStreamSize:
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
	cmp	r0, #0
	addne	r3, r0, #163840
	movne	r0, #0
	mvneq	r0, #0
	ldrne	r3, [r3, #40]
	strne	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegStreamSize, .-GetSegStreamSize
	.align	2
	.global	GetSegStreamNum
	.type	GetSegStreamNum, %function
GetSegStreamNum:
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
	add	r0, r0, #163840
	ldr	r3, [r0, #12]
	ldr	r0, [r0, #8]
	rsb	r0, r0, r3
	ubfx	r0, r0, #0, #11
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegStreamNum, .-GetSegStreamNum
	.align	2
	.global	GetFreshSegStream
	.type	GetFreshSegStream, %function
GetFreshSegStream:
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
	cmp	r0, #0
	addne	r0, r0, #163840
	ldrne	r3, [r0, #48]
	strne	r3, [r1]
	ldrne	r3, [r0, #44]
	strne	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetFreshSegStream, .-GetFreshSegStream
	.align	2
	.global	SCDDRV_PrepareSleep
	.type	SCDDRV_PrepareSleep, %function
SCDDRV_PrepareSleep:
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
	ldr	r3, .L326
	mov	r2, r0, asl #2
	add	ip, r3, r2
	ldr	r1, [ip, #324]
	cmp	r1, #0
	bne	.L325
	rsb	r2, r2, r0, lsl #6
	add	r3, r3, r2
	ldr	r0, [r3, #312]
	cmp	r0, #0
	moveq	r3, #2
	movne	r3, #1
	movne	r0, r1
	str	r3, [ip, #324]
	ldmfd	sp, {fp, sp, pc}
.L325:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L327:
	.align	2
.L326:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_PrepareSleep, .-SCDDRV_PrepareSleep
	.align	2
	.global	SCDDRV_GetSleepStage
	.type	SCDDRV_GetSleepStage, %function
SCDDRV_GetSleepStage:
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
	ldr	r3, .L329
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #324]
	ldmfd	sp, {fp, sp, pc}
.L330:
	.align	2
.L329:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_GetSleepStage, .-SCDDRV_GetSleepStage
	.align	2
	.global	SCDDRV_ForceSleep
	.type	SCDDRV_ForceSleep, %function
SCDDRV_ForceSleep:
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
	ldr	r3, .L336
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #324]
	cmp	r3, #2
	movne	r3, #2
	strne	r3, [r0, #324]
	ldmfd	sp, {fp, sp, pc}
.L337:
	.align	2
.L336:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_ForceSleep, .-SCDDRV_ForceSleep
	.align	2
	.global	SCDDRV_ExitSleep
	.type	SCDDRV_ExitSleep, %function
SCDDRV_ExitSleep:
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
	ldr	r3, .L339
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #324]
	ldmfd	sp, {fp, sp, pc}
.L340:
	.align	2
.L339:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_ExitSleep, .-SCDDRV_ExitSleep
	.align	2
	.global	ResetLastUnfinishedSegInfo
	.type	ResetLastUnfinishedSegInfo, %function
ResetLastUnfinishedSegInfo:
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
	ldr	r2, .L342
	add	r3, r0, #262144
	add	r0, r3, #428
	add	r6, r3, #436
	mov	ip, #0
	mvn	lr, #0
	ldr	r4, [r2, #48]
	mov	r5, #1
	str	lr, [r3, #432]
	mov	r1, ip
	strh	lr, [r0]	@ movhi
	mov	r2, #80
	str	lr, [r3, #440]
	add	r0, r3, #472
	strh	lr, [r6]	@ movhi
	str	r5, [r3, #448]
	str	ip, [r3, #452]
	str	ip, [r3, #456]
	str	ip, [r3, #460]
	str	ip, [r3, #464]
	str	ip, [r3, #444]
	mov	r3, r4
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	bx	r3
.L343:
	.align	2
.L342:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ResetLastUnfinishedSegInfo, .-ResetLastUnfinishedSegInfo
	.align	2
	.global	SM_ClearInst
	.type	SM_ClearInst, %function
SM_ClearInst:
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
	bhi	.L346
	ldr	r5, .L347
	movw	r2, #16936
	ldr	r6, .L347+4
	mov	r1, #0
	add	r5, r5, r0, lsl #3
	movt	r2, 4
	mov	r4, r1
	ldr	r3, [r6, #48]
	ldr	r0, [r5, #8]
	blx	r3
	ldr	r3, [r5, #8]
	mvn	ip, #0
	mov	lr, #1
	add	r3, r3, #262144
	mov	r1, r4
	add	r2, r3, #428
	add	r7, r3, #436
	str	ip, [r3, #432]
	add	r0, r3, #472
	strh	ip, [r2]	@ movhi
	mov	r2, #80
	str	ip, [r3, #440]
	ldr	r6, [r6, #48]
	strh	ip, [r7]	@ movhi
	str	lr, [r3, #448]
	str	r4, [r3, #452]
	str	r4, [r3, #456]
	str	r4, [r3, #460]
	str	r4, [r3, #464]
	str	r4, [r3, #444]
	blx	r6
	ldr	r3, [r5, #8]
	mov	r0, r4
	mvn	r5, #0
	add	r3, r3, #262144
	mvn	r4, #0
	strd	r4, [r3, #240]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L346:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L348:
	.align	2
.L347:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_ClearInst, .-SM_ClearInst
	.align	2
	.global	SM_InstInit
	.type	SM_InstInit, %function
SM_InstInit:
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
	ldr	r4, .L352
	ldr	r6, .L352+4
	add	r5, r4, #256
.L350:
	mov	r2, #8
	mov	r0, r4
	ldr	r3, [r6, #48]
	add	r4, r4, r2
	mov	r1, #0
	blx	r3
	cmp	r4, r5
	bne	.L350
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L353:
	.align	2
.L352:
	.word	.LANCHOR0+8
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_InstInit, .-SM_InstInit
	.align	2
	.global	SM_OpenSCDDrv
	.type	SM_OpenSCDDrv, %function
SM_OpenSCDDrv:
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
	subs	r8, r2, #0
	mov	r5, r0
	mov	r7, r1
	beq	.L356
	cmp	r8, #1
	bne	.L368
	movw	r3, #1375
	ldr	r2, .L370
	ldr	r1, .L370+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L356:
	ldr	r4, .L370+8
	mov	r3, #49152
	movt	r3, 63683
	ldr	r2, [r4, #304]
	str	r3, [r4, #4]
	cmp	r2, #1
	beq	.L361
	ldr	r3, .L370+12
	mov	r1, r8
	mov	r2, #60
	add	r0, r4, #264
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r2, .L370+16
	add	r3, r5, #15
	str	r5, [r4, #264]
	bic	r3, r3, #15
	str	r8, [r4, #324]
	str	r8, [r2, #56]
	rsb	r6, r5, r3
	mov	r0, r3
	str	r3, [r4, #276]
	str	r7, [r4, #268]
	bl	MEM_Phy2Vir
	add	r3, r5, #12288
	mov	r2, #12288
	add	r3, r3, r6
	str	r2, [r4, #280]
	str	r3, [r4, #288]
	add	r5, r5, #28672
	add	r5, r5, #127
	add	r5, r5, r6
	bic	r5, r5, #127
	str	r0, [r4, #272]
	mov	r0, r3
	bl	MEM_Phy2Vir
	mov	r3, #16384
	str	r5, [r4]
	str	r3, [r4, #292]
	str	r0, [r4, #284]
	mov	r0, r5
	bl	MEM_Phy2Vir
	cmp	r0, #0
	str	r0, [r4, #328]
	beq	.L369
	add	r6, r6, #46592
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #336]
	cmp	r7, r6
	mov	r1, #17920
	str	r1, [r4, #332]
	str	r2, [r4, #296]
	str	r3, [r4, #300]
	blt	.L361
	ldr	r3, [r4, #272]
	cmp	r3, #0
	beq	.L361
	ldr	r3, [r4, #284]
	cmp	r3, #0
	beq	.L361
	mov	r3, #1
	mov	r0, r8
	str	r3, [r4, #304]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L368:
	ldr	r2, .L370
	mov	r0, #0
	ldr	r1, .L370+20
	bl	dprint_vfmw
	mvn	r0, #6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L361:
	mvn	r0, #6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L369:
	ldr	r2, .L370
	ldr	r1, .L370+24
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L371:
	.align	2
.L370:
	.word	.LANCHOR3+56
	.word	.LC21
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LC20
	.word	.LC22
	UNWIND(.fnend)
	.size	SM_OpenSCDDrv, .-SM_OpenSCDDrv
	.align	2
	.global	SM_CloseSCDDrv
	.type	SM_CloseSCDDrv, %function
SM_CloseSCDDrv:
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
	ldr	ip, .L382
	mov	r3, #0
	mov	lr, r3
.L374:
	ldr	r2, [ip, r3, asl #3]
	add	r3, r3, #1
	cmp	r2, #0
	add	r1, r2, #262144
	beq	.L373
	ldr	r2, [r1, #220]
	cmp	r2, #0
	beq	.L373
	ldr	r2, [r1, #208]
	cmp	r2, #0
	strle	lr, [r1, #220]
.L373:
	cmp	r3, #32
	bne	.L374
	ldr	r2, .L382+4
	mov	r1, r0, asl #6
	ldr	ip, .L382+8
	sub	r3, r1, r0, asl #2
	add	r1, r2, r1
	ldr	r0, .L382+12
	mov	r4, #0
	mov	r2, #60
	str	r4, [r1, #56]
	add	r0, r0, r3
	mov	r1, r4
	ldr	r3, [ip, #48]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L383:
	.align	2
.L382:
	.word	.LANCHOR0+8
	.word	g_VfmwGlobalStat
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+264
	UNWIND(.fnend)
	.size	SM_CloseSCDDrv, .-SM_CloseSCDDrv
	.align	2
	.global	SM_Config
	.type	SM_Config, %function
SM_Config:
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
	clz	r3, r1
	mov	r7, r0
	mov	r6, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L398
	ldr	r2, .L399
	add	r3, r2, r0, lsl #3
	ldr	ip, [r3, #8]
	cmn	r2, #264
	cmpne	ip, #0
	moveq	r8, #1
	movne	r8, #0
	beq	.L390
	ldr	r3, [r1, #44]
	add	r4, ip, #262144
	str	r3, [r4, #288]
	ldr	r3, [r1, #12]
	ldr	r1, [ip, #16]
	cmp	r1, r3
	addeq	r5, ip, #4
	ldreq	r9, .L399+4
	beq	.L389
	cmp	r3, #0
	beq	.L390
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L390
	ldr	r0, [r2, #288]
	mov	r3, #2048
	ldr	r1, [r2, #284]
	ldr	r9, [r2, #276]
	ldr	r5, [r2, #272]
	ldr	lr, [r2, #280]
	ldr	r2, [r2, #292]
	str	r1, [r4, #180]
	str	r9, [r4, #176]
	str	r2, [r4, #188]
	str	r5, [r4, #168]
	str	lr, [r4, #172]
	str	r0, [r4, #184]
	str	r3, [r4, #192]
	ldr	r3, [r6, #12]
	ldr	r0, [r6]
	add	r1, r3, #3
	bic	r1, r1, #3
	rsb	r3, r3, r1
	add	r1, r1, #131072
	add	r2, r3, #131072
	str	r1, [r4, #196]
	add	r2, r0, r2
	str	r2, [r4, #164]
	ldr	r0, [r6, #16]
	rsb	r3, r3, r0
	sub	r3, r3, #132096
	str	r3, [r4, #200]
	cmp	r3, #262144
	blt	.L390
	ldr	r9, .L399+4
	add	r0, ip, #98304
	add	r5, ip, #4
	add	r0, r0, #96
	bl	ConfigStreamSegArray
	mov	r2, #68
	mov	r0, r5
	ldr	r3, [r9, #52]
	mov	r1, r6
	blx	r3
	str	r8, [r4, #208]
.L389:
	ldr	r3, [r9, #52]
	mov	r0, r5
	mov	r2, #68
	mov	r1, r6
	blx	r3
	mov	r3, #2
	str	r3, [r4, #276]
	mov	r0, #0
	ldr	r3, [r6, #8]
	str	r7, [r4, #204]
	cmp	r3, #2
	moveq	r3, #3
	streq	r3, [r4, #276]
.L386:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L390:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L398:
	str	r1, [sp]
	mov	r3, r0
	movw	r2, #1468
	ldr	r1, .L399+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L386
.L400:
	.align	2
.L399:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC23
	UNWIND(.fnend)
	.size	SM_Config, .-SM_Config
	.align	2
	.global	SM_CfgBuf
	.type	SM_CfgBuf, %function
SM_CfgBuf:
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
	bhi	.L409
	cmp	r1, #0
	bne	.L410
	ldr	r2, .L411
	add	r0, r2, r0, lsl #3
	ldr	r3, [r0, #8]
	cmn	r2, #264
	cmpne	r3, #0
	moveq	r1, #1
	movne	r1, #0
	beq	.L405
	add	r3, r3, #262144
	ldr	r0, [r3, #208]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r7, [r2, #276]
	mov	ip, #2048
	ldr	r6, [r2, #272]
	mov	r0, r1
	ldr	r5, [r2, #280]
	ldr	r4, [r2, #288]
	ldr	lr, [r2, #284]
	ldr	r2, [r2, #292]
	str	r1, [r3, #208]
	str	r7, [r3, #176]
	str	r6, [r3, #168]
	str	r5, [r3, #172]
	str	r4, [r3, #184]
	str	lr, [r3, #180]
	str	r2, [r3, #188]
	str	ip, [r3, #192]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L405:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L409:
	mov	r3, r0
	movw	r2, #1548
	ldr	r1, .L411+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L410:
	mov	r3, r1
	movw	r2, #1555
	ldr	r1, .L411+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L412:
	.align	2
.L411:
	.word	.LANCHOR0
	.word	.LC24
	.word	.LC25
	UNWIND(.fnend)
	.size	SM_CfgBuf, .-SM_CfgBuf
	.align	2
	.global	SM_Start
	.type	SM_Start, %function
SM_Start:
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
	ldr	r3, .L418
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L417
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L417
	add	r3, r3, #262144
	ldr	r0, [r3, #220]
	cmp	r0, #0
	bne	.L417
	mov	r2, #1
	str	r2, [r3, #220]
	ldmfd	sp, {fp, sp, pc}
.L417:
	mvn	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L419:
	.align	2
.L418:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_Start, .-SM_Start
	.align	2
	.global	SM_Stop
	.type	SM_Stop, %function
SM_Stop:
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
	ldr	r3, .L427
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #8]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	add	r3, r0, #262144
	ldr	r0, [r3, #220]
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r2, [r3, #208]
	cmp	r2, #0
	movle	r0, #0
	strle	r0, [r3, #220]
	mvngt	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L428:
	.align	2
.L427:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_Stop, .-SM_Stop
	.align	2
	.global	SM_GetInfo
	.type	SM_GetInfo, %function
SM_GetInfo:
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
	bhi	.L436
	ldr	r3, .L444
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #8]
	cmp	r0, #0
	beq	.L443
	add	r2, r0, #262144
	cmn	r0, #72
	add	r0, r0, #98304
	ldr	r3, [r2, #220]
	strb	r3, [r1]
	ldr	r3, [r2, #268]
	str	r3, [r1, #20]
	beq	.L432
	ldr	r3, [r0, #76]
	ldr	ip, [r0, #72]
	subs	r3, r3, ip
	addmi	r3, r3, #1024
	strmi	r3, [r1, #4]
	strpl	r3, [r1, #4]
.L434:
	ldr	r3, [r0, #92]
	str	r3, [r1, #12]
	ldr	ip, [r0, #84]
	rsb	r3, ip, r3
	str	r3, [r1, #12]
.L432:
	ldr	r3, [r2, #108]
	adds	r0, r0, #96
	ldr	ip, [r2, #104]
	movne	r0, #0
	rsb	r3, ip, r3
	ubfx	r3, r3, #0, #11
	str	r3, [r1, #8]
	ldrne	r3, [r2, #136]
	strne	r3, [r1, #16]
	ldmfd	sp, {fp, sp, pc}
.L443:
	cmp	r1, #0
	beq	.L436
	strb	r0, [r1]
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L436:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L445:
	.align	2
.L444:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_GetInfo, .-SM_GetInfo
	.align	2
	.global	GetRawNumInFrame
	.type	GetRawNumInFrame, %function
GetRawNumInFrame:
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
	add	r6, r0, #98304
	mov	r4, #1
	ldr	r3, [r6]
	mov	ip, r3, asl #5
	mov	r5, r3, asl #7
	rsb	lr, ip, r5
	add	lr, r0, lr
	ldr	lr, [lr, #8]
	str	lr, [r2]
	str	r4, [r1]
	b	.L447
.L449:
	ldr	r4, [r1]
	add	r4, r4, #1
	str	r4, [r1]
	ldr	r4, [lr, #8]
	ldr	lr, [r2]
	add	lr, lr, r4
	str	lr, [r2]
	ldr	lr, [r6, #4]
	cmp	lr, r3
	beq	.L451
	ldr	lr, [r1]
	cmp	lr, #1024
	bhi	.L451
.L447:
	rsb	ip, ip, r5
	add	r3, r3, #1
	ubfx	r3, r3, #0, #10
	ldrb	r4, [r0, ip]	@ zero_extendqisi2
	mov	r5, r3, asl #7
	mov	ip, r3, asl #5
	cmp	r4, #0
	rsb	lr, ip, r5
	add	lr, r0, lr
	bne	.L449
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L451:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetRawNumInFrame, .-GetRawNumInFrame
	.align	2
	.global	AdjustRawPacketVP6A
	.type	AdjustRawPacketVP6A, %function
AdjustRawPacketVP6A:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r10, [r1]
	add	ip, r0, #98304
	cmp	r10, #0
	ldr	ip, [ip]
	beq	.L457
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	add	lr, r0, lr
	ldr	r4, [lr, #8]
	cmp	r4, #2
	bgt	.L458
	mov	lr, r4
	mov	r8, #3
	mov	r5, #0
	b	.L455
.L456:
	add	lr, r0, lr
	ldr	lr, [lr, #8]
	add	r4, r4, lr
	cmp	r4, #2
	bgt	.L460
.L455:
	add	ip, ip, #1
	add	r5, r5, #1
	ubfx	ip, ip, #0, #10
	cmp	r5, r10
	rsb	r8, lr, r8
	mov	r7, ip, asl #5
	mov	r6, ip, asl #7
	rsb	lr, r7, r6
	bne	.L456
.L457:
	mvn	r0, #3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L460:
	mov	r9, r8, asr #31
.L454:
	rsb	r6, r7, r6
	rsb	r5, r5, r10
	add	r6, r0, r6
	str	r5, [r1]
	sub	r4, r4, #3
	mov	r0, #0
	ldrd	r6, [r6, #40]
	adds	r8, r8, r6
	adc	r9, r9, r7
	strd	r8, [r2]
	str	r4, [r3]
	ldr	r3, [fp, #4]
	str	ip, [r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L458:
	mov	r8, #3
	mov	r9, #0
	mov	r5, #0
	b	.L454
	UNWIND(.fnend)
	.size	AdjustRawPacketVP6A, .-AdjustRawPacketVP6A
	.align	2
	.global	SM_CopyRawToSeg
	.type	SM_CopyRawToSeg, %function
SM_CopyRawToSeg:
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
	ldr	r3, .L500
	mov	r2, r0
	str	r0, [fp, #-84]
	add	r3, r3, r2, lsl #3
	mov	r2, #0
	mov	r5, r1
	mov	r0, #0
	ldr	r4, [r3, #8]
	mov	r1, #0
	str	r2, [fp, #-64]
	cmp	r4, r2
	strd	r0, [fp, #-52]
	beq	.L480
	cmn	r4, #72
	add	r8, r4, #98304
	add	r2, r8, #96
	str	r2, [fp, #-80]
	movne	r3, #0
	moveq	r3, #1
	cmn	r8, #96
	add	r2, r4, #72
	str	r2, [fp, #-76]
	movne	r9, #0
	moveq	r9, #1
	orr	r3, r9, r3
	cmp	r5, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	bne	.L480
	ldr	r10, [r8, #76]
	ldr	r3, [r8, #72]
	cmp	r10, r3
	beq	.L495
	mov	r2, r3, asl #5
	mov	r7, r3, asl #7
	str	r2, [fp, #-72]
	mov	r1, #1
	mov	lr, r2
	rsb	r2, r2, r7
	add	r2, r4, r2
	str	r1, [fp, #-56]
	mov	r0, r7
	ldr	r6, [r2, #80]
	b	.L464
.L466:
	add	r1, r1, #1
	ldr	ip, [ip, #80]
	cmp	r1, #1024
	add	r6, r6, ip
	movls	r2, #0
	movhi	r2, #1
	cmp	r3, r10
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L495
.L464:
	rsb	r2, lr, r0
	add	r3, r3, #1
	add	r2, r4, r2
	ubfx	r3, r3, #0, #10
	ldrb	r2, [r2, #72]	@ zero_extendqisi2
	mov	lr, r3, asl #5
	mov	r0, r3, asl #7
	cmp	r2, #0
	rsb	ip, lr, r0
	add	ip, r4, ip
	bne	.L466
	cmp	r9, #0
	str	r1, [fp, #-56]
	addne	r2, r4, #262144
	bne	.L477
	ldr	r10, .L500+4
	mov	r2, #163840
	mov	r1, r9
	add	r0, r8, #104
	ldr	r3, [r10, #48]
	blx	r3
	add	r2, r4, #262144
	ldr	r3, [r2, #120]
	str	r9, [r2, #104]
	str	r9, [r2, #108]
	str	r9, [r2, #112]
	str	r3, [r2, #128]
	str	r3, [r2, #132]
.L477:
	ldr	r3, [r2, #124]
	cmp	r3, r6
	blt	.L498
	ldr	r3, [fp, #-72]
	ldr	r0, [r4, #12]
	rsb	r3, r3, r7
	ldr	r9, [r2, #120]
	add	r3, r4, r3
	ldr	r2, [r8, #72]
	sub	r0, r0, #12
	ldr	r8, [r8, #96]
	ldr	r1, [r3, #80]
	clz	r0, r0
	str	r2, [fp, #-60]
	cmp	r1, #0
	mov	r0, r0, lsr #5
	ldrd	r2, [r3, #112]
	moveq	r0, #0
	cmp	r0, #0
	str	r1, [fp, #-64]
	strd	r2, [fp, #-52]
	bne	.L469
.L472:
	str	r9, [r5, #12]
	mov	r0, r9
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-72]
	mov	r1, #1
	ldr	ip, [fp, #-56]
	rsb	r7, r3, r7
	add	r7, r4, r7
	cmp	ip, #0
	str	r0, [r5]
	rsb	r3, r0, r8
	str	r3, [r5, #16]
	ldrd	r2, [r7, #136]
	strd	r2, [r5, #24]
	ldrd	r2, [r7, #136]
	strd	r2, [r5, #32]
	ldrd	r2, [r7, #120]
	strb	r1, [r5, #6]
	strd	r2, [r5, #40]
	ldrd	r2, [r7, #128]
	strd	r2, [r5, #48]
	ldr	r3, [r7, #92]
	str	r3, [r5, #56]
	ldr	r3, [r7, #96]
	str	r3, [r5, #60]
	ldr	r3, [r7, #100]
	str	r3, [r5, #64]
	ldr	r3, [r7, #104]
	str	r3, [r5, #68]
	beq	.L471
	cmp	r8, #0
	beq	.L495
	ldrd	r2, [fp, #-52]
	orrs	r3, r2, r3
	ldrne	r10, .L500+4
	movne	r7, #0
	bne	.L474
	b	.L495
.L475:
	cmp	r8, #0
	beq	.L495
	orrs	r3, r0, r1
	beq	.L495
.L474:
	mov	r0, #2
	add	r7, r7, #1
	bl	VCTRL_RecordPosTime
	ldr	r3, [r10, #52]
	ldr	r2, [fp, #-64]
	mov	r0, r8
	ldr	r1, [fp, #-52]
	blx	r3
	mov	r0, #3
	bl	VCTRL_RecordPosTime
	ldr	r1, [fp, #-64]
	mov	r0, #0
	bl	VCTRL_RecordData
	ldr	r2, [fp, #-60]
	ldr	r1, [fp, #-64]
	add	r0, r2, #1
	ldr	ip, [fp, #-56]
	mov	r3, r2, asl #7
	ubfx	r0, r0, #0, #10
	sub	r2, r3, r2, asl #5
	str	r0, [fp, #-60]
	add	r2, r4, r2
	mov	r3, r0, asl #7
	sub	r3, r3, r0, asl #5
	add	r8, r8, r1
	ldrb	r0, [r2, #73]	@ zero_extendqisi2
	add	r3, r4, r3
	ldr	r2, [r5, #16]
	cmp	ip, r7
	strb	r0, [r5, #7]
	add	r1, r2, r1
	str	r1, [r5, #16]
	ldrd	r0, [r3, #112]
	ldr	r3, [r3, #80]
	strd	r0, [fp, #-52]
	str	r3, [fp, #-64]
	bhi	.L475
	ldr	r0, [r5]
.L471:
	cmp	r0, #0
	beq	.L499
	ldr	r2, [fp, #-84]
	mov	r1, r5
	ldr	r0, [fp, #-80]
	bl	InsertStreamSeg
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L498:
	mov	r2, r6
	ldr	r1, .L500+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r1, r6
	ldr	r0, [fp, #-76]
	bl	DeleteRawLen
	cmp	r0, #0
	beq	.L495
	movw	r2, #1782
	ldr	r1, .L500+12
	mov	r0, #0
	bl	dprint_vfmw
.L495:
	mvn	r0, #3
.L492:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L469:
	sub	r2, fp, #60
	sub	r3, fp, #64
	str	r2, [sp]
	sub	r1, fp, #56
	sub	r2, fp, #52
	ldr	r0, [fp, #-76]
	bl	AdjustRawPacketVP6A
	cmp	r0, #0
	beq	.L472
	b	.L495
.L480:
	mvn	r0, #0
	b	.L492
.L499:
	movw	r3, #1843
	ldr	r2, .L500+16
	ldr	r1, .L500+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #3
	b	.L492
.L501:
	.align	2
.L500:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC26
	.word	.LC27
	.word	.LANCHOR3+72
	.word	.LC28
	UNWIND(.fnend)
	.size	SM_CopyRawToSeg, .-SM_CopyRawToSeg
	.align	2
	.global	SCDDRV_IsSCDByPass
	.type	SCDDRV_IsSCDByPass, %function
SCDDRV_IsSCDByPass:
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
	bics	r3, r0, #16
	beq	.L508
	sub	r3, r0, #2
	cmp	r3, #1
	bls	.L507
	cmp	r0, #18
	cmpne	r0, #6
	moveq	r3, #1
	movne	r3, #0
	beq	.L507
	cmp	r0, #1
	beq	.L509
.L504:
	subs	r0, r0, #15
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L507:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L509:
	ldr	r2, [r1]
	cmp	r2, #0
	beq	.L504
.L508:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsSCDByPass, .-SCDDRV_IsSCDByPass
	.align	2
	.global	SCDDRV_SaveStreamSeg
	.type	SCDDRV_SaveStreamSeg, %function
SCDDRV_SaveStreamSeg:
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
	ldr	r5, .L518
	mov	r6, r0
	mov	r4, r1
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrsb	r3, [r1, #5]
	cmp	r3, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r7, .L518+4
	mov	r0, #0
	ldr	r3, [r7, #16]
	blx	r3
	ldr	r3, [r7, #44]
	ldr	r2, [r5, r6, asl #2]
	ldr	r1, [r4, #16]
	ldr	r0, [r4]
	blx	r3
	ldr	r3, [r7, #12]
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3
.L519:
	.align	2
.L518:
	.word	vfmw_save_seg_file
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SaveStreamSeg, .-SCDDRV_SaveStreamSeg
	.align	2
	.global	SM_ReadSegStream
	.type	SM_ReadSegStream, %function
SM_ReadSegStream:
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
	ldr	r3, .L533
	mov	r7, r0
	mov	r6, r1
	add	r3, r3, r0, lsl #3
	ldr	r4, [r3, #8]
	cmp	r4, #0
	cmpne	r1, #0
	beq	.L524
	add	r1, r4, #28
	ldr	r0, [r4, #12]
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	bne	.L531
.L522:
	add	r0, r4, #98304
	mov	r1, r6
	add	r0, r0, #96
	add	r4, r4, #262144
	bl	SCDDRV_GetStreamSeg
	subs	r5, r0, #0
	beq	.L532
	ldr	r3, [r4, #268]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #268]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L531:
	mov	r1, r6
	mov	r0, r7
	bl	SM_CopyRawToSeg
	cmp	r0, #0
	beq	.L522
	add	r4, r4, #262144
	ldr	r1, .L533+4
	mov	r0, #26
	bl	dprint_vfmw
	ldr	r3, [r4, #268]
	mvn	r0, #6
	add	r3, r3, #1
	str	r3, [r4, #268]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L532:
	mov	r0, r7
	mov	r1, r6
	str	r5, [r4, #268]
	bl	SCDDRV_SaveStreamSeg
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L524:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L534:
	.align	2
.L533:
	.word	.LANCHOR0
	.word	.LC29
	UNWIND(.fnend)
	.size	SM_ReadSegStream, .-SM_ReadSegStream
	.align	2
	.global	SM_ReleaseStreamSeg
	.type	SM_ReleaseStreamSeg, %function
SM_ReleaseStreamSeg:
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
	ldr	r3, .L537
	add	r0, r3, r0, lsl #3
	ldr	r0, [r0, #8]
	cmp	r0, #0
	beq	.L536
	add	r0, r0, #98304
	add	r0, r0, #96
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseStreamSeg
.L536:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L538:
	.align	2
.L537:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_ReleaseStreamSeg, .-SM_ReleaseStreamSeg
	.align	2
	.global	SM_GiveThreadEvent
	.type	SM_GiveThreadEvent, %function
SM_GiveThreadEvent:
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
	ldr	r3, .L540
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L541:
	.align	2
.L540:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SM_GiveThreadEvent, .-SM_GiveThreadEvent
	.align	2
	.global	CalcInstBlockTime
	.type	CalcInstBlockTime, %function
CalcInstBlockTime:
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
	ldr	r3, .L547
	mov	r5, r1
	mov	r4, r0
	ldr	r3, [r3]
	blx	r3
	cmp	r5, #0
	add	r3, r4, #262144
	mov	r1, r0
	bne	.L546
	ldr	r2, [r3, #236]
	cmp	r0, r2
	strls	r5, [r3, #232]
	rsbhi	r0, r2, r0
	strls	r1, [r3, #236]
	strhi	r0, [r3, #232]
	movls	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L546:
	mov	r2, #0
	str	r1, [r3, #236]
	mov	r0, r2
	str	r2, [r3, #232]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L548:
	.align	2
.L547:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CalcInstBlockTime, .-CalcInstBlockTime
	.align	2
	.global	SCDDRV_IsChanDec
	.type	SCDDRV_IsChanDec, %function
SCDDRV_IsChanDec:
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
	ldr	r2, [r3, #312]
	cmp	r2, #1
	ldreq	r3, [r3, #308]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L553:
	.align	2
.L552:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_IsChanDec, .-SCDDRV_IsChanDec
	.align	2
	.global	SCDDRV_GetRawStreamStatus
	.type	SCDDRV_GetRawStreamStatus, %function
SCDDRV_GetRawStreamStatus:
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
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	add	r0, r0, #98304
	ldr	r3, [r0, #20]
	str	r3, [r1]
	ldr	ip, [r0, #12]
	rsb	r3, ip, r3
	str	r3, [r1]
	ldmia	r0, {r1, r3}
	subs	r3, r3, r1
	addmi	r3, r3, #1024
	str	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_GetRawStreamStatus, .-SCDDRV_GetRawStreamStatus
	.align	2
	.global	GetFreeSegBufSize
	.type	GetFreeSegBufSize, %function
GetFreeSegBufSize:
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
	cmpne	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetFreeSegBufSize.part.5
	UNWIND(.fnend)
	.size	GetFreeSegBufSize, .-GetFreeSegBufSize
	.align	2
	.global	SCDDRV_GetSegStreamStatus
	.type	SCDDRV_GetSegStreamStatus, %function
SCDDRV_GetSegStreamStatus:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r5, [fp, #4]
	cmp	r2, #0
	cmpne	r0, #0
	mov	r4, r3
	mov	r6, r1
	mov	r3, #0
	mov	r7, r2
	mov	r8, r0
	str	r3, [r5]
	bne	.L567
.L563:
	ldr	lr, [r7]
	add	r3, r6, #79
	add	r0, r8, #163840
	cmp	lr, r3
	movwcs	r3, #65457
	movcc	lr, #0
	movtcs	r3, 65535
	rsbcs	r3, r6, r3
	addcs	lr, r3, lr
	str	lr, [r7]
	ldr	ip, [r0, #28]
	rsb	ip, ip, ip, lsl #3
	add	r3, ip, #7
	cmp	ip, #0
	movlt	ip, r3
	cmp	r6, ip, asr #3
	addcs	lr, lr, r6
	strcs	lr, [r7]
	movcs	r3, #1
	strcs	r3, [r5]
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #8]
	rsb	r2, r3, r2
	ubfx	r2, r2, #0, #11
	rsb	r2, r2, #2048
	str	r2, [r4]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L567:
	mov	r1, r2
	bl	GetFreeSegBufSize.part.5
	b	.L563
	UNWIND(.fnend)
	.size	SCDDRV_GetSegStreamStatus, .-SCDDRV_GetSegStreamStatus
	.align	2
	.global	SCDDRV_IsRawStreamNotEnough
	.type	SCDDRV_IsRawStreamNotEnough, %function
SCDDRV_IsRawStreamNotEnough:
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
	cmpne	r0, #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsRawStreamNotEnough, .-SCDDRV_IsRawStreamNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegSlotNotEnough
	.type	SCDDRV_IsFreeSegSlotNotEnough, %function
SCDDRV_IsFreeSegSlotNotEnough:
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
	cmp	r0, #512
	movhi	r0, #0
	movls	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegSlotNotEnough, .-SCDDRV_IsFreeSegSlotNotEnough
	.align	2
	.global	SCDDRV_IsFreeSegBufNotEnough
	.type	SCDDRV_IsFreeSegBufNotEnough, %function
SCDDRV_IsFreeSegBufNotEnough:
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
	cmp	r0, r1, lsr #3
	movls	r0, #1
	movhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SCDDRV_IsFreeSegBufNotEnough, .-SCDDRV_IsFreeSegBufNotEnough
	.align	2
	.global	SCDDRV_CheckConditionOfStartSCD
	.type	SCDDRV_CheckConditionOfStartSCD, %function
SCDDRV_CheckConditionOfStartSCD:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 0
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
	mov	r4, r1
	beq	.L576
	add	lr, r0, #98304
	ldr	r0, [lr, #20]
	str	r0, [r3]
	ldr	r1, [lr, #12]
	rsb	r0, r1, r0
	str	r0, [r3]
	ldmia	lr, {r1, ip}
	rsb	ip, r1, ip
	cmp	ip, #0
	blt	.L573
	moveq	ip, #1
	movne	ip, #0
.L574:
	ldr	r3, [r3]
	cmp	r3, #3
	orrls	ip, ip, #1
	cmp	ip, #0
	bne	.L576
	ldr	r3, [fp, #12]
	mov	r1, r2
	mov	r0, r4
	str	r3, [sp]
	ldmib	fp, {r2, r3}
	bl	SCDDRV_GetSegStreamStatus
	ldr	r3, [fp, #8]
	ldr	r3, [r3]
	cmp	r3, #512
	bls	.L577
	add	r4, r4, #163840
	ldr	r3, [fp, #4]
	ldr	r2, [r4, #28]
	ldr	r3, [r3]
	cmp	r3, r2, lsr #3
	mvnls	r0, #5
	movhi	r0, #0
.L572:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L573:
	cmn	ip, #1024
	movne	ip, #0
	moveq	ip, #1
	b	.L574
.L576:
	mvn	r0, #4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L577:
	mvn	r0, #5
	b	.L572
	UNWIND(.fnend)
	.size	SCDDRV_CheckConditionOfStartSCD, .-SCDDRV_CheckConditionOfStartSCD
	.align	2
	.global	SCDDRV_SetCtrlReg
	.type	SCDDRV_SetCtrlReg, %function
SCDDRV_SetCtrlReg:
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
	ldr	r2, [r0, #12]
	cmp	r2, #18
	beq	.L585
	sub	lr, r2, #6
	cmp	r2, #1
	cmpne	r2, #15
	clz	lr, lr
	moveq	r5, #1
	movne	r5, #0
	mov	lr, lr, lsr #5
	mov	r4, lr
.L580:
	add	r3, r0, #262144
	mov	ip, #1
	strb	ip, [r1, #2]
	ldr	ip, [r3, #176]
	str	ip, [r1, #4]
	ldr	ip, [r3, #168]
	str	ip, [r1, #8]
	ldr	ip, [r3, #184]
	str	ip, [r1, #16]
	ldr	r6, [r3, #192]
	ldr	ip, [r3, #276]
	mul	ip, ip, r6
	str	ip, [r1, #20]
	ldr	ip, [r3, #120]
	str	ip, [r1, #24]
	ldr	ip, [r3, #124]
	ldr	r6, [r3, #120]
	add	ip, ip, r6
	str	ip, [r1, #28]
	ldr	ip, [r3, #448]
	cmp	ip, #1
	ldreq	r3, [r3, #132]
	ldrne	r3, [r3, #444]
	addeq	r3, r3, #3
	biceq	r3, r3, #3
	cmp	r5, #0
	str	r3, [r1, #32]
	mov	r3, #1
	strb	r3, [r1]
	ldr	r0, [r0, #40]
	str	r4, [r1, #56]
	str	r0, [r1, #44]
	bne	.L586
	sub	r0, r2, #2
	cmp	r0, r3
	orrls	lr, lr, #1
	cmp	lr, #0
	beq	.L583
.L590:
	strb	r3, [r1, #1]
	mov	r3, #1
	str	r2, [r1, #36]
	str	r3, [r1, #40]
	str	r3, [r1, #48]
	str	r3, [r1, #52]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L586:
	mov	r2, #0
.L583:
	mov	r3, #0
	b	.L590
.L585:
	mov	r4, #1
	mov	r5, #0
	mov	lr, r4
	mov	r2, #6
	b	.L580
	UNWIND(.fnend)
	.size	SCDDRV_SetCtrlReg, .-SCDDRV_SetCtrlReg
	.align	2
	.global	SCDDRV_RecordStartState
	.type	SCDDRV_RecordStartState, %function
SCDDRV_RecordStartState:
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
	add	r4, r0, #262144
	cmp	r1, r2
	str	r1, [r4, #248]
	movls	r3, #1
	str	r2, [r4, #252]
	movhi	r3, #0
	strb	r3, [r0, #2]
	mov	r1, #1
	ldr	r3, .L594
	mov	r2, #0
	str	r1, [r4, #212]
	strb	r2, [r0, #3]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r4, #272]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L595:
	.align	2
.L594:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_RecordStartState, .-SCDDRV_RecordStartState
	.align	2
	.global	SCD_ConfigReg
	.type	SCD_ConfigReg, %function
SCD_ConfigReg:
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
	ldr	ip, .L603
	mov	r5, r0
	mov	r0, r3
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L602
	cmp	r5, #4
	beq	.L601
	ldr	r6, .L603+4
	mov	r4, r2, asl #2
.L598:
	add	r2, r6, r4
	ldr	r0, [r2, #4]
	add	r0, r5, r0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MEM_WritePhyWord
.L602:
	mov	r3, r1
	mov	r2, r5
	mov	r1, #1
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Record_RegData
.L601:
	ldr	r6, .L603+4
	mov	r4, r2, asl #2
	cmp	r1, #0
	add	r3, r6, r4
	ldr	r0, [r3, #4]
	add	r0, r0, #4
	bne	.L599
	bl	MEM_ReadPhyWord
	uxth	r1, r0
	b	.L598
.L599:
	bl	MEM_ReadPhyWord
	orr	r1, r0, #65536
	b	.L598
.L604:
	.align	2
.L603:
	.word	g_HalDisable
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCD_ConfigReg, .-SCD_ConfigReg
	.align	2
	.global	WriteScdVtrlReg
	.type	WriteScdVtrlReg, %function
WriteScdVtrlReg:
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
	UNWIND(.pad #196)
	sub	sp, sp, #196
	ldr	r5, .L664
	mov	r9, r0
	mov	r4, r1
	mov	r7, r2
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L606
	ldr	r3, .L664+4
	sub	r0, fp, #232
	mov	r2, #188
	mov	r1, #0
	mov	r8, r0
	ldr	r3, [r3, #48]
	blx	r3
.L607:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #4]
	cmp	r2, #1
	bne	.L644
	ldr	r6, .L664+8
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #2048
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L609:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #16]
	cmp	r2, #1
	bne	.L645
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2048
	add	r0, r0, #8
	bl	MEM_WritePhyWord
.L611:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #20]
	cmp	r2, #1
	bne	.L646
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2048
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L613:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #24]
	cmp	r2, #1
	bne	.L647
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2064
	bl	MEM_WritePhyWord
.L615:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #28]
	cmp	r2, #1
	bne	.L648
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2064
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L617:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #32]
	cmp	r2, #1
	bne	.L649
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2064
	add	r0, r0, #8
	bl	MEM_WritePhyWord
.L619:
	mov	r10, r9, asl #3
	ldr	r3, .L664+8
	add	r2, r6, r10
	ldr	r2, [r2, #8]
	add	r2, r2, #262144
	ldr	r1, [r2, #448]
	cmp	r1, #1
	beq	.L650
	ldr	r1, [r2, #432]
	mov	r0, #3
	movt	r0, 768
	cmp	r1, r0
	beq	.L651
.L625:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L652
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L630:
	add	r10, r6, r10
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r2, .L664+8
	ldr	r3, [r10, #8]
	cmp	r1, #1
	add	r3, r3, #262144
	add	r3, r3, #428
	ldrh	r1, [r3]
	bne	.L653
	add	r2, r2, r7, lsl #2
	ldr	r0, [r2, #4]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
.L624:
	ldr	r1, [r4, #48]
	ldr	r2, [r4, #52]
	ldr	lr, [r4, #44]
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	mov	r1, r1, asl #13
	ldr	r3, [r4, #36]
	orr	r1, r1, r2, asl #9
	ldrb	ip, [r5]	@ zero_extendqisi2
	orr	r2, r1, lr, asl #8
	and	r3, r3, #15
	mov	r1, r0, asl #4
	cmp	ip, #1
	orr	r2, r2, r3
	and	r1, r1, #16
	orr	r1, r2, r1
	bne	.L654
	add	r3, r6, r7, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #2080
	bl	MEM_WritePhyWord
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L655
.L634:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L656
	add	r3, r6, r7, lsl #2
	mov	r1, #0
	ldr	r10, .L664
	ldr	r0, [r3, #4]
	add	r0, r0, #2064
	add	r0, r0, #12
	bl	MEM_WritePhyWord
	ldrb	r5, [r5]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L638
.L659:
	ldr	r2, [r4, #44]
	sub	r0, fp, #232
	mov	r3, #0
	str	r9, [fp, #-224]
	strb	r7, [fp, #-232]
	strb	r2, [fp, #-231]
	str	r3, [fp, #-228]
	bl	VDH_PostTask
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L651:
	add	r2, r2, #428
	ldrh	r2, [r2]
	cmp	r2, #0
	bne	.L625
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L657
	add	r3, r3, r7, lsl #2
	mov	r1, #3
	ldr	r0, [r3, #4]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L627:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L658
	add	r3, r6, r7, lsl #2
	mov	r1, #0
	ldr	r0, [r3, #4]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L624
.L652:
	mov	r3, r1
	movw	r2, #2108
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L630
.L656:
	mov	r3, #0
	movw	r2, #2076
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldrb	r5, [r5]	@ zero_extendqisi2
	ldr	r10, .L664
	cmp	r5, #1
	bne	.L659
.L638:
	add	r6, r6, r7, lsl #2
	mov	r1, #0
	ldr	r0, [r6, #4]
	add	r0, r0, #2048
	bl	MEM_WritePhyWord
	ldrb	r3, [r10]	@ zero_extendqisi2
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #1
	and	r1, r1, #1
	bne	.L660
	ldr	r0, [r6, #4]
	add	r0, r0, #2048
	bl	MEM_WritePhyWord
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L654:
	mov	r3, r1
	mov	r2, #2080
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L634
.L655:
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r1, [r4, #56]
	cmp	r2, #1
	bne	.L661
	add	r2, r6, r7, lsl #2
	ldr	r0, [r2, #4]
	bl	MEM_WritePhyWord
	b	.L634
.L649:
	mov	r3, r1
	movw	r2, #2072
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L619
.L648:
	mov	r3, r1
	movw	r2, #2068
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L617
.L647:
	mov	r3, r1
	mov	r2, #2064
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L615
.L646:
	mov	r3, r1
	movw	r2, #2060
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L613
.L645:
	mov	r3, r1
	movw	r2, #2056
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L611
.L644:
	mov	r3, r1
	movw	r2, #2052
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	ldr	r6, .L664+8
	b	.L609
.L653:
	mov	r3, r1
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L624
.L606:
	mov	r0, r2
	mov	r8, #0
	bl	ResetSCD
	b	.L607
.L661:
	mov	r3, r1
	mov	r2, #0
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L634
.L660:
	mov	r3, r1
	mov	r0, r8
	mov	r1, r5
	mov	r2, #2048
	bl	VDH_Record_RegData
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L650:
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L662
	add	r3, r3, r7, lsl #2
	mvn	r1, #0
	ldr	r0, [r3, #4]
	add	r0, r0, #2096
	add	r0, r0, #12
	bl	MEM_WritePhyWord
.L622:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L663
	add	r3, r6, r7, lsl #2
	mvn	r1, #0
	ldr	r0, [r3, #4]
	add	r0, r0, #2112
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	b	.L624
.L662:
	mvn	r3, #0
	movw	r2, #2108
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L622
.L663:
	mvn	r3, #0
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L624
.L657:
	mov	r3, #3
	movw	r2, #2108
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L627
.L658:
	mov	r3, #0
	movw	r2, #2116
	mov	r1, #1
	mov	r0, r8
	bl	VDH_Record_RegData
	b	.L624
.L665:
	.align	2
.L664:
	.word	g_HalDisable
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	WriteScdVtrlReg, .-WriteScdVtrlReg
	.align	2
	.global	WriteScdMsg
	.type	WriteScdMsg, %function
WriteScdMsg:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #148)
	sub	sp, sp, #148
	mov	r0, r0, asl #3
	mov	r9, r1
	str	r1, [fp, #-152]
	mov	r4, r0
	mov	r7, r2
	str	r2, [fp, #-164]
	mov	r1, #0
	str	r0, [fp, #-176]
	mov	r2, #96
	sub	r0, fp, #140
	mov	r6, r3
	str	r3, [fp, #-160]
	bl	memset
	ldr	r3, .L723
	mov	r2, #16384
	mov	r1, #0
	mov	r8, #0
	add	r3, r3, r4
	ldr	r3, [r3, #8]
	mov	r0, r3
	str	r3, [fp, #-180]
	ldr	r3, .L723+4
	add	r0, r0, #262144
	str	r0, [fp, #-184]
	mov	r5, r0
	add	r0, r0, #552
	ldr	r3, [r3, #48]
	add	r4, r5, #440
	str	r0, [fp, #-148]
	blx	r3
	mov	r0, r6
	sub	r1, fp, #140
	bl	GetFirstRawPacket
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #4]
	add	r5, r5, #436
	cmp	r3, r7
	mov	r0, r3
	str	r8, [r2]
	str	r8, [r2, #4]
	str	r8, [r2, #8]
	str	r8, [r9, #4]
	bgt	.L667
	add	r9, r6, #98304
	str	r4, [fp, #-172]
	mov	r10, r8
	mov	ip, r3
	mov	r4, r3
	str	r8, [fp, #-144]
	str	r5, [fp, #-168]
.L670:
	ldr	r3, [fp, #4]
	mov	r1, r10, asl #2
	ldr	lr, [fp, #-144]
	cmp	ip, #0
	add	r6, r3, r1
	ldr	r3, [fp, #8]
	add	r1, r1, #12
	mov	r5, r8, asl #4
	add	r1, r1, r3
	ldr	r3, [fp, #-148]
	add	lr, lr, #1
	mov	r2, #96
	sub	r0, fp, #140
	add	r3, r3, r5
	str	lr, [fp, #-144]
	ble	.L668
	ldr	r7, [fp, #-136]
	add	r8, r8, #1
	sub	lr, r7, #1
	str	lr, [fp, #-156]
	ldr	lr, [fp, #4]
	str	r7, [lr, r10, asl #2]
	add	r10, r10, #3
	ldr	lr, [fp, #-156]
	str	r1, [r6, #8]
	add	lr, lr, ip
	ldr	r1, [fp, #-148]
	str	lr, [r6, #4]
	ldrd	r6, [fp, #-100]
	strd	r6, [r1, r5]
	ldrd	r6, [fp, #-100]
	ldr	r1, [fp, #-132]
	subs	r6, r6, #1
	sbc	r7, r7, #0
	adds	r6, r6, r1
	adc	r7, r7, r1, asr #31
	strd	r6, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-132]
.L668:
	ldr	r3, [fp, #-152]
	str	r4, [r3, #4]
	ldr	r1, [r9, #16]
	ldr	ip, [r9, #4]
	mov	r3, r1, asl #7
	cmp	r1, ip
	sub	r1, r3, r1, asl #5
	ldr	r3, [fp, #-160]
	add	r1, r3, r1
	bne	.L720
.L669:
	ldr	r3, [fp, #12]
	mov	r0, r4
	ldr	r5, [fp, #-168]
	cmp	r3, #0
	ldr	r4, [fp, #-172]
	bne	.L671
	ldr	r2, [fp, #-132]
	cmp	r2, #0
	bne	.L688
.L671:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	beq	.L687
	ldr	r1, [fp, #-176]
	sub	r3, r10, #-1073741823
	ldr	r2, .L723
	mov	r7, #0
	add	r2, r2, r1
	ldr	r1, [fp, #4]
	str	r7, [r1, r3, asl #2]
	ldr	r3, [r2, #8]
	ldr	r2, [fp, #-152]
	add	r3, r3, #262144
	add	r0, r3, #436
	add	r1, r3, #428
	ldr	r2, [r2, #4]
	ldr	ip, [r3, #440]
	cmp	r2, #6
	str	ip, [r3, #432]
	movge	r2, #6
	ldrh	r3, [r0]
	cmp	r2, #5
	strh	r3, [r1]	@ movhi
	bls	.L721
.L690:
	mov	r7, #2
	mov	r2, #4
.L674:
	cmp	r8, #0
	ldrgt	r3, [fp, #-148]
	addgt	r9, r3, r8, lsl #4
	ble	.L683
.L686:
	ldr	r0, [r9, #-8]
	ldr	ip, [r9, #-16]
	add	r3, r0, #1
	rsb	ip, ip, r3
	cmp	ip, r2
	movcc	lr, ip
	movcs	lr, r2
	cmp	r2, #0
	beq	.L679
	cmp	lr, #0
	beq	.L682
	add	r6, r4, lr
.L681:
	ldrb	r1, [r3, #-1]!	@ zero_extendqisi2
	strb	r1, [r4], #1
	cmp	r4, r6
	bne	.L681
	subs	r2, r2, lr
	beq	.L679
.L682:
	subs	r8, r8, #1
	sub	r9, r9, #16
	bne	.L686
.L683:
	ldr	r2, [fp, #-152]
	mov	r0, #0
	ldr	r1, [fp, #-144]
	mov	r3, #1
	str	r3, [r2, #8]
	str	r1, [r2]
.L718:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L679:
	cmp	r7, #0
	beq	.L683
	rsb	ip, lr, ip
	rsb	r3, lr, r0
	cmp	ip, r7
	movcs	ip, r7
	cmp	ip, #0
	beq	.L684
	add	r3, r3, #1
	add	r1, r5, ip
.L685:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	strb	r2, [r5], #1
	cmp	r5, r1
	bne	.L685
	subs	r7, r7, ip
	beq	.L683
	mov	r2, #0
	b	.L682
.L720:
	ldr	r3, .L723+4
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r3, [r9, #16]
	ldr	ip, [fp, #-132]
	ldr	r1, [fp, #-164]
	add	r3, r3, #1
	add	r4, r4, ip
	ldr	r0, [fp, #-144]
	cmp	r1, r4
	mov	r2, r3, asr #31
	movge	r1, #1
	movlt	r1, #0
	cmp	r0, #1024
	mov	r2, r2, lsr #22
	add	r3, r3, r2
	movge	r1, #0
	cmp	r1, #0
	ubfx	r3, r3, #0, #10
	rsb	r3, r2, r3
	str	r3, [r9, #16]
	bne	.L670
	b	.L669
.L721:
	cmp	r2, #1
	beq	.L722
	rsbs	r0, r2, #6
	rsb	lr, r2, #5
	beq	.L690
	ldr	r3, [fp, #-180]
	movw	ip, #438
	add	lr, r4, lr
	movt	ip, 4
	add	ip, r3, ip
	mov	r3, #2
.L676:
	subs	r0, r0, #1
	rsb	r6, r3, #3
	sub	r7, r3, #1
	ldrb	r1, [lr], #-1	@ zero_extendqisi2
	movne	r3, #1
	moveq	r3, #0
	cmp	r6, #1
	movhi	r3, #0
	andls	r3, r3, #1
	cmp	r3, #0
	strb	r1, [ip, #-1]!
	mov	r3, r7
	bne	.L676
	cmp	r7, #0
	bne	.L719
	cmp	r0, #0
	rsb	r2, r2, #3
	beq	.L692
	ldr	r3, [fp, #-184]
	rsb	ip, r0, r2
	add	ip, r4, ip
	add	r1, r3, #444
	add	r3, r4, r2
.L677:
	ldrb	r2, [r3], #-1	@ zero_extendqisi2
	cmp	r3, ip
	strb	r2, [r1, #-1]!
	bne	.L677
	rsb	r2, r0, #4
	b	.L674
.L667:
	ldr	r3, [fp, #12]
	cmp	r3, #0
	bne	.L687
	cmp	r0, #0
	beq	.L687
	ldr	r8, [fp, #12]
	mov	r2, r0
	mov	r10, r8
	str	r8, [fp, #-144]
.L688:
	ldr	r3, [fp, #-152]
	ldr	r1, [fp, #-164]
	ldr	r3, [r3, #4]
	sub	r1, r1, #16
	cmp	r3, r1
	bge	.L671
	ldr	r1, [fp, #-164]
	ldr	ip, [fp, #-144]
	cmp	r1, r0
	cmplt	ip, #1024
	bge	.L671
	rsb	r3, r3, r1
	cmp	r2, r3
	blt	.L671
	ldr	r2, [fp, #-136]
	mov	r1, r10, asl #2
	ldr	r0, [fp, #4]
	add	ip, r1, #12
	ldr	lr, [fp, #4]
	add	r1, r0, r1
	ldr	r0, [fp, #8]
	str	r3, [fp, #-132]
	str	r2, [lr, r10, asl #2]
	sub	r2, r2, #1
	add	r3, r2, r3
	ldrd	r6, [fp, #-100]
	str	r3, [r1, #4]
	add	ip, ip, r0
	ldr	r3, [fp, #-148]
	mov	r0, r8, asl #4
	str	ip, [r1, #8]
	add	r10, r10, #3
	add	ip, r3, r0
	mov	r1, #0
	strd	r6, [r3, r0]
	add	r8, r8, #1
	ldr	r3, [fp, #-144]
	ldr	r0, [fp, #-132]
	add	r3, r3, #1
	str	r3, [fp, #-144]
	ldrd	r2, [fp, #-100]
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r2, r2, r0
	adc	r3, r3, r0, asr #31
	ldr	r0, [fp, #-152]
	strd	r2, [ip, #8]
	ldr	r2, [fp, #-132]
	ldr	r3, [r0, #4]
	str	r1, [fp, #-132]
	add	r3, r3, r2
	str	r3, [r0, #4]
	b	.L671
.L684:
	mov	r2, ip
	b	.L682
.L692:
.L719:
	mov	r2, #4
	b	.L674
.L722:
	ldr	r6, [fp, #-184]
	ldrb	ip, [r6, #436]	@ zero_extendqisi2
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	ldrb	lr, [r6, #442]	@ zero_extendqisi2
	ldrb	r1, [r6, #441]	@ zero_extendqisi2
	ldrb	r3, [r6, #440]	@ zero_extendqisi2
	strb	ip, [r6, #437]
	strb	r0, [r6, #436]
	strb	lr, [r6, #443]
	strb	r1, [r6, #442]
	strb	r3, [r6, #441]
	b	.L674
.L687:
	mvn	r0, #5
	b	.L718
.L724:
	.align	2
.L723:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	WriteScdMsg, .-WriteScdMsg
	.align	2
	.global	SCDDRV_StartSCD
	.type	SCDDRV_StartSCD, %function
SCDDRV_StartSCD:
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
	add	r4, r1, #262144
	str	r3, [fp, #-52]
	mov	r7, r0
	ldr	r3, [r4, #168]
	mov	r8, r2
	ldr	r0, [r4, #204]
	add	r5, r1, #72
	ldr	r9, [r4, #176]
	add	r6, r4, #152
	str	r3, [fp, #-48]
	bl	VCTRL_IfEsBufEnable
	cmp	r0, #0
	beq	.L729
	ldr	r10, .L730
	mov	r2, #12
	mov	r1, #0
	mov	r0, r6
	ldr	r3, [r10, #48]
	blx	r3
	ldr	lr, [r7, #44]
	ldr	r1, [fp, #-48]
	mov	r3, r5
	ldr	r0, [r4, #204]
	mov	r2, r8
	str	r9, [sp, #4]
	str	r1, [sp]
	mov	r1, r6
	str	lr, [sp, #8]
	bl	WriteScdMsg
	subs	r5, r0, #0
	movne	r0, r5
	bne	.L727
	ldr	r3, [r10]
	blx	r3
	ldr	ip, [fp, #-52]
	ldr	r3, .L730+4
	mov	r1, r7
	add	r10, r3, ip, lsl #6
	mov	r2, ip
	str	r0, [r10, #48]
	ldr	r0, [r4, #204]
	bl	WriteScdVtrlReg
	mov	r0, r5
.L727:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L729:
	ldr	r2, [r4, #204]
	mov	r0, #1
	ldr	r1, .L730+8
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L727
.L731:
	.align	2
.L730:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	.word	.LC30
	UNWIND(.fnend)
	.size	SCDDRV_StartSCD, .-SCDDRV_StartSCD
	.align	2
	.global	CutStreamWithSCD
	.type	CutStreamWithSCD, %function
CutStreamWithSCD:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	add	r4, r0, #262144
	mov	r7, r1
	add	r1, r0, #98304
	ldr	r2, [r4, #456]
	sub	ip, fp, #100
	sub	r3, fp, #108
	mov	r6, r0
	stmib	sp, {r3, ip}
	add	r1, r1, #96
	sub	ip, fp, #104
	add	r0, r0, #72
	str	ip, [sp]
	sub	r3, fp, #112
	mov	ip, #0
	str	ip, [fp, #-112]
	str	ip, [fp, #-108]
	str	ip, [fp, #-104]
	str	ip, [fp, #-100]
	bl	SCDDRV_CheckConditionOfStartSCD
	subs	r5, r0, #0
	bne	.L743
	ldr	r3, [fp, #-100]
	cmp	r3, #0
	bne	.L744
.L735:
	mov	r1, r7
	ldr	r0, [r4, #204]
	bl	SM_CfgBuf
	subs	r5, r0, #0
	bne	.L745
	ldr	r2, [fp, #-108]
	mov	r0, r6
	ldr	r3, [r4, #276]
	sub	r1, fp, #96
	str	r2, [r4, #192]
	mul	r2, r3, r2
	mov	r2, r2, asl #2
	str	r2, [r4, #188]
	bl	SCDDRV_SetCtrlReg
	mov	r3, r7
	sub	r0, fp, #96
	ldr	r2, [fp, #-104]
	mov	r1, r6
	bl	SCDDRV_StartSCD
	cmp	r0, #0
	movne	r5, r0
	bne	.L734
	ldr	r3, [fp, #-104]
	mov	r5, #0
	ldr	r2, [fp, #-112]
	cmp	r2, r3
	str	r3, [r4, #252]
	str	r2, [r4, #248]
	mov	r2, #1
	movls	r3, #1
	strlsb	r3, [r6, #2]
	ldr	r3, .L746
	strhib	r0, [r6, #2]
	str	r2, [r4, #212]
	strb	r5, [r6, #3]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r4, #272]
.L734:
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L745:
	mov	r2, r5
	ldr	r1, .L746+4
	mov	r0, #26
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L744:
	ldr	r0, .L746
	add	r2, r4, #428
	add	ip, r4, #436
	mvn	r3, #0
	mov	lr, #1
	str	r3, [r4, #432]
	ldr	r8, [r0, #48]
	mov	r1, r5
	strh	r3, [r2]	@ movhi
	add	r0, r4, #472
	str	r3, [r4, #440]
	mov	r2, #80
	strh	r3, [ip]	@ movhi
	str	r5, [r4, #452]
	str	r5, [r4, #456]
	str	r5, [r4, #460]
	str	r5, [r4, #464]
	str	r5, [r4, #444]
	str	lr, [r4, #448]
	blx	r8
	b	.L735
.L743:
	mov	r2, r5
	ldr	r1, .L746+8
	mov	r0, #26
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L747:
	.align	2
.L746:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC32
	.word	.LC31
	UNWIND(.fnend)
	.size	CutStreamWithSCD, .-CutStreamWithSCD
	.align	2
	.global	ReadScdStateReg
	.type	ReadScdStateReg, %function
ReadScdStateReg:
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
	ldr	r4, .L749
	mov	r5, r0
	movw	r6, #2124
	add	r4, r4, r1, lsl #2
	ldr	r0, [r4, #4]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	and	r0, r0, #1
	str	r0, [r5]
	ldr	r0, [r4, #4]
	add	r0, r6, r0
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #4]
	mov	r3, r0, lsr #22
	add	r0, r6, r2
	str	r3, [r5, #8]
	bl	MEM_ReadPhyWord
	ldr	r2, [r4, #4]
	ubfx	r3, r0, #0, #22
	add	r0, r2, #2128
	str	r3, [r5, #12]
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #4]
	str	r0, [r5, #16]
	add	r0, r3, #2128
	add	r0, r0, #4
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #4]
	str	r0, [r5, #20]
	add	r0, r3, #2048
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	ldr	r3, [r4, #4]
	str	r0, [r5, #24]
	add	r0, r3, #2128
	add	r0, r0, #12
	bl	MEM_ReadPhyWord
	str	r0, [r5, #28]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L750:
	.align	2
.L749:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	ReadScdStateReg, .-ReadScdStateReg
	.align	2
	.global	ParseMpeg4UniqueUpMsg
	.type	ParseMpeg4UniqueUpMsg, %function
ParseMpeg4UniqueUpMsg:
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
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r0, #1
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [r1]
	ldr	r3, [r2, #4]
	ldrb	r0, [r1]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r0, r3, #1, #1
	strb	r0, [r1]
	ldrh	r0, [r2, #10]
	ldrb	r3, [r1]	@ zero_extendqisi2
	bfi	r3, r0, #2, #1
	strb	r3, [r1]
	ldr	r3, [r2, #8]
	ldrb	r0, [r1]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #3
	bfi	r0, r3, #3, #4
	strb	r0, [r1]
	ldr	r3, [r2, #8]
	ldrh	r2, [r1]
	and	r3, r3, #7
	bfi	r2, r3, #7, #4
	strh	r2, [r1]	@ movhi
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ParseMpeg4UniqueUpMsg, .-ParseMpeg4UniqueUpMsg
	.align	2
	.global	ConvertByteOrder
	.type	ConvertByteOrder, %function
ConvertByteOrder:
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
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, r2, r3, asl #24
	orr	r3, r3, r1
	orr	r0, r3, r0, asl #8
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ConvertByteOrder, .-ConvertByteOrder
	.align	2
	.global	CheckSegValid
	.type	CheckSegValid, %function
CheckSegValid:
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
	cmp	r0, #0
	beq	.L760
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L762
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L762
	add	r1, r1, #163840
	ldr	r2, [r1, #36]
	ldr	r3, [r1, #32]
	cmp	r2, r3
	bhi	.L764
	ldrcs	r3, [r1, #28]
	subcc	r3, r3, #1
	rsbcc	r3, r2, r3
	subcs	r3, r3, #1
.L758:
	ldr	r2, [r0, #16]
	cmp	r2, r3
	mvnhi	r0, #6
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L764:
	ldr	r1, [r1, #28]
	sub	r3, r3, #1
	add	r3, r3, r1
	rsb	r3, r2, r3
	b	.L758
.L762:
	mvn	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L760:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckSegValid, .-CheckSegValid
	.align	2
	.global	GetSegPts
	.type	GetSegPts, %function
GetSegPts:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
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
	mov	r4, r3
	mov	r5, r2
	sub	r3, fp, #44
	sub	r2, fp, #40
	str	r2, [sp]
	sub	r2, fp, #48
	mov	ip, #0
	mov	r6, r0
	str	ip, [fp, #-48]
	str	ip, [fp, #-44]
	str	ip, [fp, #-40]
	bl	GetRawNumOffset
	ldr	r2, [fp, #-40]
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #5
	add	r0, r6, r3
	ldrd	r6, [r0, #64]
	strd	r6, [r4, #24]
	ldrd	r8, [r0, #48]
	strd	r8, [r4, #40]
	ldrd	r2, [r0, #64]
	strd	r2, [r4, #32]
	ldrd	r2, [r0, #56]
	strd	r2, [r4, #48]
	ldr	r3, [r0, #20]
	str	r3, [r4, #56]
	ldr	r3, [r0, #24]
	str	r3, [r4, #60]
	ldr	r3, [r0, #28]
	str	r3, [r4, #64]
	ldr	r3, [r0, #32]
	str	r3, [r4, #68]
	ldrd	r0, [r5]
	cmp	r7, r1
	cmpeq	r6, r0
	beq	.L768
	strd	r6, [r5]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L768:
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetSegPts, .-GetSegPts
	.align	2
	.global	IsVopHeader
	.type	IsVopHeader, %function
IsVopHeader:
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
	beq	.L774
	cmp	r0, #2
	movne	r0, #0
	beq	.L775
.L771:
	mov	r2, #0
	movt	r2, 65025
	cmp	r1, r2
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L774:
	mov	r3, #0
	movt	r3, 46593
	rsb	r0, r3, r1
	clz	r0, r0
	mov	r0, r0, lsr #5
	b	.L771
.L775:
	ubfx	r3, r1, #16, #8
	sub	r3, r3, #128
	cmp	r3, #3
	movhi	r0, #0
	movls	r0, #1
	b	.L771
	UNWIND(.fnend)
	.size	IsVopHeader, .-IsVopHeader
	.align	2
	.global	GetNextVop
	.type	GetNextVop, %function
GetNextVop:
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
	add	r10, r0, #262144
	sub	r3, r2, #1
	cmp	r3, #0
	add	r0, r0, #98304
	ldr	lr, [r10, #108]
	mov	ip, r3
	ldr	r8, [r10, #104]
	rsb	r8, r8, lr
	ubfx	r8, r8, #0, #11
	rsb	r8, r8, #2048
	blt	.L784
	ldr	r5, [r10, #276]
	mov	r4, #0
	mov	r9, r4
	ldr	r7, [r0, #96]
	ldr	r6, [r10, #120]
	movt	r4, 65025
	mov	r5, r5, asl #2
	ldr	lr, [r10, #224]
	movt	r9, 46593
	mla	r1, r5, r3, r1
	b	.L783
.L787:
	cmp	lr, #2
	beq	.L786
	cmp	r2, r4
	beq	.L781
.L782:
	sub	ip, ip, #1
	rsb	r1, r5, r1
	cmn	ip, #1
	mov	r2, r3
	beq	.L784
	sub	r3, r3, #1
.L783:
	ldr	r2, [r1]
	cmp	lr, #1
	rsb	r2, r6, r2
	ldr	r2, [r7, r2]
	rsbeq	r0, r9, r2
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	bne	.L787
.L779:
	cmp	r2, r4
	beq	.L781
	cmp	r0, #1
	bne	.L782
.L781:
	cmp	r8, r3
	mov	r2, r3
	bcs	.L784
	sub	r3, r3, #1
	b	.L782
.L786:
	ubfx	r0, r2, #16, #8
	sub	r0, r0, #128
	cmp	r0, #3
	movhi	r0, #0
	movls	r0, #1
	b	.L779
.L784:
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetNextVop, .-GetNextVop
	.align	2
	.global	CorrectRollPhyAddr
	.type	CorrectRollPhyAddr, %function
CorrectRollPhyAddr:
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
	cmp	r1, r2
	rsbcc	r1, r2, r1
	addcc	r0, r1, r0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectRollPhyAddr, .-CorrectRollPhyAddr
	.align	2
	.global	CorrectSegNextAddr
	.type	CorrectSegNextAddr, %function
CorrectSegNextAddr:
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
	movcc	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CorrectSegNextAddr, .-CorrectSegNextAddr
	.align	2
	.global	SetLastUnfinishedSegInfo
	.type	SetLastUnfinishedSegInfo, %function
SetLastUnfinishedSegInfo:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 88
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
	add	r4, r0, #262144
	mov	r5, r0
	mov	r9, r1
	ldr	r8, [r4, #276]
	mov	r7, r2
	mov	r1, #0
	mov	r2, #80
	sub	r0, fp, #124
	ldr	r6, [r4, #180]
	bl	memset
	mul	ip, r8, r9
	add	r10, r5, #98304
	add	r8, r4, #472
	add	r1, r10, #96
	str	r1, [fp, #-128]
	add	r2, r4, #240
	add	ip, ip, #1
	add	r0, r5, #72
	mov	r3, r8
	ldr	r1, [r6, ip, asl #2]
	mov	r9, ip, asl #2
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r3, .L805
	mov	r2, #80
	mov	r1, r8
	sub	r0, fp, #124
	ldr	r3, [r3, #52]
	blx	r3
	add	ip, r6, r9
	ldr	r2, [r4, #120]
	ldr	ip, [ip, #-4]
	str	ip, [r4, #452]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	movcs	r3, r2
	cmp	ip, r3
	str	r3, [r4, #444]
	bls	.L793
	mov	r1, #1
	str	r1, [r4, #460]
	ldr	r0, [r7, #28]
	rsb	r6, r2, r3
	ldr	r1, [r7, #16]
	cmp	r2, r0
	addhi	r1, r0, r1
	rsbhi	r1, r2, r1
	str	r1, [r4, #464]
	rsb	lr, ip, r1
	add	r1, lr, r6
	str	r1, [r4, #456]
	ldr	r5, [r5, #44]
	cmp	r5, #1
	beq	.L804
.L796:
	mov	r3, #0
	str	r3, [r4, #448]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L793:
	rsb	r3, ip, r3
	mov	r1, #0
	cmp	r3, #3
	str	r1, [r4, #460]
	str	r1, [r4, #464]
	str	r3, [r4, #456]
	movls	r1, #0
	ldr	r0, [r5, #44]
	movhi	r1, #1
	cmp	r0, #1
	movne	r1, #0
	cmp	r1, #0
	beq	.L796
	ldr	r5, [r10, #96]
	rsb	lr, r2, ip
	sub	r1, fp, #124
	ldr	r0, [fp, #-128]
	ldr	r2, [r4, #204]
	add	lr, r5, lr
	str	ip, [fp, #-112]
	mov	r5, #1
	mov	ip, #2
	str	lr, [fp, #-124]
	str	r3, [fp, #-108]
	strb	r5, [fp, #-118]
	strb	ip, [fp, #-119]
	bl	InsertStreamSeg
	b	.L796
.L804:
	ldr	r3, [r4, #108]
	ldr	r0, [r4, #104]
	rsb	r3, r0, r3
	ubfx	r3, r3, #0, #11
	rsb	r3, r3, #2048
	cmp	r1, #3
	cmphi	r3, #3
	bls	.L796
	ldr	r8, [fp, #-128]
	rsb	r7, r2, ip
	ldr	r3, [r10, #96]
	sub	r1, fp, #124
	ldr	r2, [r4, #204]
	mov	r0, r8
	add	r3, r3, r7
	str	ip, [fp, #-112]
	mov	r7, #2
	mov	ip, #0
	str	r3, [fp, #-124]
	strb	ip, [fp, #-118]
	str	lr, [fp, #-108]
	strb	r7, [fp, #-119]
	bl	InsertStreamSeg
	ldr	ip, [r10, #96]
	sub	r1, fp, #124
	ldr	r3, [r4, #120]
	mov	r0, r8
	ldr	r2, [r4, #204]
	strb	r7, [fp, #-119]
	str	ip, [fp, #-124]
	str	r6, [fp, #-108]
	strb	r5, [fp, #-118]
	str	r3, [fp, #-112]
	bl	InsertStreamSeg
	b	.L796
.L806:
	.align	2
.L805:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SetLastUnfinishedSegInfo, .-SetLastUnfinishedSegInfo
	.align	2
	.global	ProcessSegRoll
	.type	ProcessSegRoll, %function
ProcessSegRoll:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
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
	add	r5, r0, #262144
	mov	r4, r1
	add	r6, r0, #98304
	ldr	r1, [r5, #180]
	add	r9, r6, #96
	ldr	ip, [r5, #452]
	ldr	lr, [r5, #104]
	ldr	r7, [r1]
	rsb	r2, ip, r2
	ldr	r1, [r5, #108]
	ldr	r8, [r5, #120]
	str	ip, [r4, #12]
	rsb	r1, lr, r1
	ldr	r10, [r5, #120]
	rsb	r7, r8, r7
	ldr	lr, [r6, #96]
	add	r0, r2, r7
	rsb	ip, r10, ip
	cmp	r0, #3
	add	ip, lr, ip
	str	ip, [r4]
	ldrsb	ip, [fp, #4]
	ubfx	r1, r1, #0, #11
	rsb	r1, r1, #2048
	str	r0, [r4, #16]
	str	ip, [fp, #-56]
	bls	.L813
	cmp	r1, #2
	str	r3, [fp, #-52]
	str	r2, [fp, #-48]
	bls	.L812
	mov	r1, r9
	mov	r0, r4
	bl	CheckSegValid
	subs	r10, r0, #0
	bne	.L812
	ldr	r2, [fp, #-48]
	cmp	r7, #0
	ldr	r3, [fp, #-52]
	str	r2, [r4, #16]
	beq	.L814
	strb	r3, [r4, #5]
	mov	r1, r4
	strb	r10, [r4, #6]
	mov	r0, r9
	ldr	r2, [r5, #204]
	bl	InsertStreamSeg
	str	r8, [r4, #12]
	ldr	r1, [r5, #120]
	mov	r2, #1
	ldr	r3, [r6, #96]
	mov	r0, r9
	rsb	r8, r1, r8
	str	r7, [r4, #16]
	add	r8, r3, r8
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	str	r8, [r4]
	mov	r1, r4
	strb	r2, [r4, #6]
	strb	r3, [r4, #5]
	ldr	r2, [r5, #204]
	bl	InsertStreamSeg
.L809:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L814:
	strb	r3, [r4, #5]
	mov	r0, r9
	mov	r3, #1
	mov	r1, r4
	strb	r3, [r4, #6]
	ldr	r2, [r5, #204]
	bl	InsertStreamSeg
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L813:
	mov	r3, r0
	movw	r2, #2843
	ldr	r1, .L815
	mov	r0, #0
	bl	dprint_vfmw
	mov	r10, #0
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L812:
	mvn	r10, #3
	b	.L809
.L816:
	.align	2
.L815:
	.word	.LC33
	UNWIND(.fnend)
	.size	ProcessSegRoll, .-ProcessSegRoll
	.align	2
	.global	ProcessLastUnfinishedSeg
	.type	ProcessLastUnfinishedSeg, %function
ProcessLastUnfinishedSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	add	r4, r0, #262144
	mov	r6, r2
	mov	r8, r1
	mov	r5, r0
	mov	r2, #80
	sub	r0, fp, #116
	mov	r1, #0
	bl	memset
	ldr	r3, [r6, #28]
	ldr	r0, [r4, #120]
	ldr	r7, [r6, #16]
	cmp	r0, r3
	addhi	r3, r3, r7
	rsbhi	r7, r0, r3
	cmp	r8, #0
	bne	.L819
	ldr	r3, [r4, #248]
	ldr	r2, [r4, #252]
	cmp	r3, r2
	movle	r3, #0
	movgt	r3, #1
	strb	r3, [r5]
	ldr	r2, [r4, #452]
	cmp	r2, #0
	ldreq	r1, [r4, #156]
	beq	.L821
	ldr	ip, [r4, #460]
	ldr	r3, [r4, #456]
	ldr	r1, [r4, #156]
	cmp	ip, #0
	add	r3, r1, r3
	str	r3, [r4, #456]
	bne	.L822
	ldr	r3, [r6, #28]
	cmp	r2, r3
	strhi	r7, [r4, #464]
	movhi	r3, #1
	strhi	r3, [r4, #460]
.L822:
	mov	r3, #0
	str	r3, [r4, #448]
	ldr	r3, [r6, #28]
	cmp	r3, r0
	movcc	r3, r0
	str	r3, [r4, #444]
.L821:
	add	r0, r5, #72
	bl	DeleteRawLen
.L823:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L819:
	mov	r6, #0
	strb	r6, [r5]
	ldr	r0, [r4, #452]
	cmp	r0, r6
	beq	.L823
	ldr	r3, .L831
	add	r1, r4, #472
	mov	r2, #80
	sub	r0, fp, #116
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r1, [r4, #460]
	cmp	r1, #1
	beq	.L829
	ldr	r0, [r4, #180]
	ldr	r3, [r4, #452]
	ldr	r2, [r0]
	cmp	r2, r3
	bcc	.L825
	add	r5, r5, #98304
	ldr	r2, [r4, #120]
	str	r3, [fp, #-104]
	mov	ip, #1
	ldr	r1, [r5, #96]
	rsb	r2, r2, r3
	add	r2, r1, r2
	str	r2, [fp, #-116]
	ldr	r2, [r0]
	strb	ip, [fp, #-110]
	rsb	r3, r3, r2
	strb	ip, [fp, #-111]
	cmp	r3, #3
	str	r3, [fp, #-100]
	bls	.L830
	add	r5, r5, #96
	sub	r0, fp, #116
	mov	r1, r5
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L828
	ldr	r2, [r4, #204]
	sub	r1, fp, #116
	mov	r0, r5
	bl	InsertStreamSeg
	b	.L823
.L825:
	str	r6, [sp]
	mov	r2, r7
	sub	r1, fp, #116
	mov	r0, r5
	mov	r3, #1
	bl	ProcessSegRoll
	b	.L823
.L829:
	ldr	r2, [r4, #464]
	mov	r3, r1
	str	r1, [sp]
	mov	r0, r5
	sub	r1, fp, #116
	bl	ProcessSegRoll
	b	.L823
.L830:
	movw	r2, #2932
	ldr	r1, .L831+4
	mov	r0, r6
	bl	dprint_vfmw
	mov	r0, r6
	b	.L823
.L828:
	mvn	r0, #3
	b	.L823
.L832:
	.align	2
.L831:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	UNWIND(.fnend)
	.size	ProcessLastUnfinishedSeg, .-ProcessLastUnfinishedSeg
	.align	2
	.global	SetPushRawOverState
	.type	SetPushRawOverState, %function
SetPushRawOverState:
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
	ldr	r3, [r0, #8]
	str	r1, [r0, #8]
	cmp	r1, #2
	cmpeq	r3, #3
	moveq	r3, #1
	movne	r3, #0
	mvneq	r3, #6
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetPushRawOverState, .-SetPushRawOverState
	.align	2
	.global	ProcessExceptionalStartCodeNum
	.type	ProcessExceptionalStartCodeNum, %function
ProcessExceptionalStartCodeNum:
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
	movw	r2, #2971
	mov	r4, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L837
	bl	dprint_vfmw
	add	r0, r4, #72
	mov	r1, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DeleteRawPacket
.L838:
	.align	2
.L837:
	.word	.LC34
	UNWIND(.fnend)
	.size	ProcessExceptionalStartCodeNum, .-ProcessExceptionalStartCodeNum
	.global	__aeabi_uidiv
	.align	2
	.global	GetValidStartCodeNum
	.type	GetValidStartCodeNum, %function
GetValidStartCodeNum:
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
	ldr	r0, [r0, #24]
	bl	__aeabi_uidiv
	ldr	r3, [r4, #12]
	cmp	r0, r3
	movcs	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetValidStartCodeNum, .-GetValidStartCodeNum
	.align	2
	.global	ProcessNotMpeg4ScdUpMsg
	.type	ProcessNotMpeg4ScdUpMsg, %function
ProcessNotMpeg4ScdUpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 120
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
	add	r5, r0, #262144
	str	r1, [fp, #-136]
	mov	r4, r0
	ldr	r1, [r5, #276]
	add	r10, r0, #98304
	str	r2, [fp, #-152]
	ldr	r2, [r5, #180]
	str	r1, [fp, #-160]
	mov	r9, r1, asl #2
	mov	r1, #0
	str	r0, [fp, #-156]
	mov	ip, r2
	str	r2, [fp, #-164]
	mov	r3, ip
	mov	r8, r1
	sub	r0, fp, #124
	mov	r2, #80
	add	ip, ip, r9
	mov	r6, r3
	str	ip, [fp, #-140]
	add	r3, r10, #96
	mov	r7, r8
	str	r3, [fp, #-132]
	bl	memset
	add	r3, r4, #72
	str	r3, [fp, #-144]
	b	.L841
.L860:
	rsb	r3, r2, r4
	ldr	r0, [r5, #120]
	ldr	r1, [r10, #96]
	cmp	r3, #3
	rsb	r0, r0, r2
	str	r2, [fp, #-112]
	str	r3, [fp, #-108]
	add	r2, r1, r0
	mov	r1, #1
	str	r2, [fp, #-124]
	strb	r1, [fp, #-118]
	bls	.L859
	ldr	r1, [fp, #-132]
	sub	r0, fp, #124
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L848
	strb	r0, [fp, #-119]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	add	r2, r5, #240
	ldr	r0, [fp, #-144]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #124
	ldr	r0, [fp, #-132]
	bl	InsertStreamSeg
	cmp	r0, #0
	bne	.L848
.L844:
	ldr	r7, [fp, #-128]
	add	r6, r6, r9
	add	r8, r8, r9
.L841:
	ldr	r3, [fp, #-136]
	cmp	r7, r3
	beq	.L848
	add	r3, r7, #1
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-140]
	ldr	r2, [r6]
	ldr	r4, [r3, r8]
	cmp	r2, r4
	bls	.L860
	ldr	r3, [fp, #-152]
	ldr	r1, [r5, #120]
	ldr	r0, [r10, #96]
	ldr	r3, [r3, #16]
	rsb	r4, r1, r4
	rsb	r1, r1, r2
	str	r2, [fp, #-112]
	rsb	r3, r2, r3
	add	r1, r0, r1
	add	ip, r3, r4
	str	r1, [fp, #-124]
	cmp	ip, #3
	str	ip, [fp, #-108]
	ldr	r2, [r5, #108]
	ldr	r1, [r5, #104]
	bls	.L861
	rsb	r2, r1, r2
	str	r3, [fp, #-148]
	ubfx	r2, r2, #0, #11
	rsb	r2, r2, #2048
	cmp	r2, #2
	bls	.L848
	ldr	r1, [fp, #-132]
	sub	r0, fp, #124
	bl	CheckSegValid
	subs	ip, r0, #0
	bne	.L848
	ldr	r3, [fp, #-148]
	cmp	r4, #0
	str	r3, [fp, #-108]
	bne	.L850
	strb	r4, [fp, #-119]
	mov	r2, #1
	strb	r2, [fp, #-118]
	sub	r3, fp, #124
	ldr	r1, [r6, #4]
	add	r2, r5, #240
	ldr	r0, [fp, #-144]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #124
	ldr	r0, [fp, #-132]
	bl	InsertStreamSeg
	b	.L844
.L850:
	strb	ip, [fp, #-118]
	sub	r3, fp, #124
	strb	ip, [fp, #-119]
	add	r2, r5, #240
	ldr	r1, [r6, #4]
	ldr	r0, [fp, #-144]
	bic	r1, r1, #-1073741824
	str	ip, [fp, #-148]
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #124
	ldr	r0, [fp, #-132]
	bl	InsertStreamSeg
	ldr	lr, [r5, #120]
	ldr	r7, [r10, #96]
	sub	r1, fp, #124
	ldr	ip, [fp, #-148]
	mov	r3, #1
	ldr	r2, [r5, #204]
	ldr	r0, [fp, #-132]
	str	r4, [fp, #-108]
	strb	ip, [fp, #-119]
	str	lr, [fp, #-112]
	str	r7, [fp, #-124]
	strb	r3, [fp, #-118]
	bl	InsertStreamSeg
	b	.L844
.L861:
	mov	r3, ip
	movw	r2, #3045
	ldr	r1, .L865
	mov	r0, #0
	bl	dprint_vfmw
	b	.L844
.L859:
	movw	r2, #3013
	ldr	r1, .L865
	mov	r0, #0
	bl	dprint_vfmw
	b	.L844
.L848:
	cmp	r7, #0
	ble	.L862
	ldr	r3, [fp, #-152]
	ldr	r3, [r3, #12]
	sub	r1, r3, #1
	cmp	r1, r7
	bhi	.L863
.L852:
	cmp	r1, r7
	beq	.L864
.L854:
	ldr	r2, [fp, #-152]
	mov	r1, #0
	ldr	r0, [fp, #-156]
	bl	SetLastUnfinishedSegInfo
.L840:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L862:
	blt	.L854
	ldr	r3, [fp, #-152]
	ldr	r3, [r3, #12]
	sub	r1, r3, #1
	b	.L852
.L863:
	ldr	r3, [fp, #-160]
	add	r6, r5, #436
	ldr	r2, .L865+4
	mov	ip, #0
	mvn	lr, #0
	mov	r1, ip
	mul	r3, r3, r7
	ldr	r4, [r2, #48]
	ldr	r2, [fp, #-164]
	add	r7, r5, #428
	mov	r8, #1
	add	r0, r5, #472
	add	r3, r3, #1
	ldr	r9, [r2, r3, asl #2]
	mov	r2, #80
	str	lr, [r5, #432]
	bic	r9, r9, #-1073741824
	strh	lr, [r7]	@ movhi
	str	lr, [r5, #440]
	strh	lr, [r6]	@ movhi
	str	ip, [r5, #452]
	str	ip, [r5, #456]
	str	ip, [r5, #460]
	str	ip, [r5, #464]
	str	ip, [r5, #444]
	str	r8, [r5, #448]
	blx	r4
	mov	r1, r9
	ldr	r0, [fp, #-144]
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L864:
	ldr	r4, [r5, #156]
	ldr	r0, [fp, #-156]
	ldr	r2, [fp, #-152]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-144]
	bl	DeleteRawLen
	b	.L840
.L866:
	.align	2
.L865:
	.word	.LC33
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ProcessNotMpeg4ScdUpMsg, .-ProcessNotMpeg4ScdUpMsg
	.align	2
	.global	GetMeg4ModeFlag
	.type	GetMeg4ModeFlag, %function
GetMeg4ModeFlag:
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
	UNWIND(.pad #4)
	sub	sp, sp, #4
	add	r10, r0, #262144
	subs	r7, r1, #0
	ldr	r6, [r10, #276]
	ldr	r4, [r10, #180]
	ldmeqib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r9, .L888
	mov	r6, r6, asl #2
	mov	r5, #0
	movw	r8, #438
	b	.L877
.L873:
	add	r5, r5, #1
	add	r4, r4, r6
	cmp	r5, r7
	beq	.L886
.L877:
	ldr	r0, [r4]
	bl	MEM_Phy2Vir
	mov	ip, #1
	mov	r1, #0
	cmp	r0, #0
	beq	.L887
	ldrb	lr, [r0, #1]	@ zero_extendqisi2
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldrb	r2, [r0, #3]	@ zero_extendqisi2
	mov	lr, lr, asl #16
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	orr	r3, lr, r3, asl #24
	orr	r3, r3, r2
	orr	r3, r3, r0, asl #8
	bic	r2, r3, #1020
	cmp	r3, r8
	cmpne	r3, #288
	bic	r2, r2, #3
	streq	ip, [r10, #224]
	streq	r1, [r10, #228]
	cmp	r2, #32768
	bne	.L873
	ldr	r3, [r10, #224]
	cmp	r3, #1
	beq	.L874
.L876:
	add	r5, r5, #1
	mov	r3, #2
	cmp	r5, r7
	str	r3, [r10, #224]
	add	r4, r4, r6
	bne	.L877
.L886:
	ldmib	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L874:
	ldr	r3, [r10, #228]
	add	r3, r3, #1
	str	r3, [r10, #228]
	cmp	r3, #30
	bls	.L873
	ldr	ip, [r9]
	mov	r3, #0
	mov	r2, r3
	mov	r1, #102
	cmp	ip, r3
	beq	.L876
	ldr	r0, [r10, #204]
	blx	ip
	b	.L876
.L887:
	movw	r3, #3114
	ldr	r2, .L888+4
	ldr	r1, .L888+8
	mov	r0, ip
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L889:
	.align	2
.L888:
	.word	g_event_report
	.word	.LANCHOR3+88
	.word	.LC35
	UNWIND(.fnend)
	.size	GetMeg4ModeFlag, .-GetMeg4ModeFlag
	.align	2
	.global	ProcessMpeg4ScdUpMsg
	.type	ProcessMpeg4ScdUpMsg, %function
ProcessMpeg4ScdUpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
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
	add	r5, r0, #262144
	mov	r6, r0
	mov	r8, r1
	ldr	r3, [r5, #276]
	mov	r10, r2
	str	r0, [fp, #-248]
	sub	r0, fp, #204
	str	r1, [fp, #-236]
	mov	r1, #0
	mov	r9, r3
	str	r3, [fp, #-240]
	ldr	r3, [r5, #180]
	mov	r9, r9, asl #2
	str	r2, [fp, #-232]
	mov	r2, #80
	mov	r7, r3
	str	r3, [fp, #-244]
	bl	memset
	mov	r2, #80
	mov	r1, #0
	sub	r0, fp, #124
	bl	memset
	ldr	r0, [r5, #120]
	bl	MEM_Phy2Vir
	mov	r4, r0
	ldr	r0, [r10, #16]
	bl	MEM_Phy2Vir
	ldr	r3, .L933
	mov	r1, r4
	mov	r2, #4
	mov	r4, r7
	ldr	r3, [r3, #52]
	blx	r3
	mov	r1, r8
	mov	r0, r6
	bl	GetMeg4ModeFlag
	add	r3, r6, #98304
	mov	r2, r8
	mov	r1, r7
	mov	r0, r6
	mov	r7, r3
	str	r3, [fp, #-220]
	add	r3, r4, r9
	str	r3, [fp, #-216]
	bl	GetNextVop
	mov	r8, #0
	add	r3, r7, #96
	mov	r7, r8
	str	r3, [fp, #-208]
	add	r3, r6, #72
	str	r3, [fp, #-224]
	str	r0, [fp, #-212]
	b	.L891
.L926:
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L893
	ldr	r3, [fp, #-108]
	sub	r0, fp, #124
	ldr	r1, [fp, #-208]
	add	r6, r3, r6
	str	r6, [fp, #-108]
	bl	CheckSegValid
	subs	r6, r0, #0
	bne	.L897
	ldr	r2, [r5, #204]
	sub	r1, fp, #124
	ldr	r0, [fp, #-208]
	strb	r6, [fp, #-119]
	bl	InsertStreamSeg
	ldr	r3, .L933
	mov	r1, r6
	mov	r2, #80
	ldr	ip, [r3, #48]
	str	r0, [fp, #-228]
	sub	r0, fp, #124
	blx	ip
	ldr	r3, [fp, #-228]
	cmp	r3, #0
	bne	.L897
.L898:
	add	r4, r4, r9
	add	r8, r8, r9
	mov	r7, r10
.L891:
	ldr	r3, [fp, #-212]
	cmp	r7, r3
	beq	.L897
	ldr	r3, [fp, #-216]
	add	r10, r7, #1
	ldr	r2, [r4]
	ldr	r0, [r3, r8]
	rsb	r6, r2, r0
	cmp	r6, #3
	bgt	.L926
	sub	r3, r6, #1
	cmp	r3, #2
	bls	.L927
	ldr	r3, [fp, #-232]
	ldr	r1, [fp, #-220]
	str	r2, [fp, #-192]
	ldr	ip, [r3, #16]
	ldr	r3, [r5, #120]
	rsb	ip, r2, ip
	ldr	lr, [r1, #96]
	rsb	r6, r3, r0
	rsb	r1, r3, r2
	add	r3, ip, r6
	add	r1, lr, r1
	cmp	r3, #3
	str	r1, [fp, #-204]
	str	r3, [fp, #-188]
	ldr	r2, [r5, #108]
	ldr	r1, [r5, #104]
	bls	.L928
	rsb	r2, r1, r2
	str	ip, [fp, #-228]
	ubfx	r2, r2, #0, #11
	rsb	r2, r2, #2048
	cmp	r2, #2
	bls	.L897
	ldr	r1, [fp, #-208]
	sub	r0, fp, #204
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L897
	cmp	r6, #0
	ldr	r3, [r5, #224]
	ldr	ip, [fp, #-228]
	bne	.L908
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	mov	lr, #0
	mov	r2, #1
	bfieq	r3, r6, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	ldr	r3, [r4, #4]
	ldrb	r1, [fp, #-132]	@ zero_extendqisi2
	mov	r3, r3, lsr #30
	bfi	r1, r3, #1, #1
	strb	r1, [fp, #-132]
	ldrh	r0, [r4, #10]
	sub	r3, fp, #204
	uxtb	r1, r1
	bfi	r1, r0, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	r0, r1, #3, #4
	strb	r0, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrh	r0, [fp, #-132]
	and	r1, r1, #7
	strb	r2, [fp, #-198]
	str	ip, [fp, #-188]
	bfi	r0, r1, #7, #4
	strb	lr, [fp, #-199]
	add	r2, r5, #240
	strh	r0, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-224]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #204
	ldr	r0, [fp, #-208]
	bl	InsertStreamSeg
	b	.L898
.L893:
	ldr	r3, [r5, #120]
	sub	r0, fp, #204
	str	r2, [fp, #-192]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-220]
	ldr	r1, [fp, #-208]
	str	r6, [fp, #-188]
	ldr	r3, [r3, #96]
	add	r2, r3, r2
	mov	r3, #1
	str	r2, [fp, #-204]
	strb	r3, [fp, #-198]
	bl	CheckSegValid
	cmp	r0, #0
	bne	.L897
	ldr	r3, [r5, #224]
	add	r2, r5, #240
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r1, [r4, #4]
	ldrb	ip, [fp, #-132]	@ zero_extendqisi2
	ldr	r0, [fp, #-224]
	mov	r1, r1, lsr #30
	bfi	ip, r1, #1, #1
	strb	ip, [fp, #-132]
	uxtb	r1, ip
	ldrh	ip, [r4, #10]
	bfi	r1, ip, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	ip, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	ip, r1, #3, #4
	strb	ip, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrh	ip, [fp, #-132]
	and	r1, r1, #7
	bfi	ip, r1, #7, #4
	strh	ip, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #204
	ldr	r0, [fp, #-208]
	mov	r3, #0
	strb	r3, [fp, #-199]
	bl	InsertStreamSeg
	cmp	r0, #0
	beq	.L898
.L897:
	cmp	r7, #0
	ble	.L896
	ldr	r3, [fp, #-232]
	ldr	r3, [r3, #12]
	sub	r3, r3, #1
	cmp	r7, r3
	bcc	.L929
	beq	.L930
.L896:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-236]
	clz	r3, r3
	cmp	r2, #1024
	mov	r3, r3, lsr #5
	movls	r3, #0
	cmp	r3, #0
	bne	.L931
.L916:
	ldr	r1, .L933
	add	r2, r5, #428
	add	r6, r5, #436
	mov	r3, #0
	mvn	ip, #0
	mov	lr, #1
	str	ip, [r5, #432]
	add	r0, r5, #472
	strh	ip, [r2]	@ movhi
	mov	r2, #80
	ldr	r4, [r1, #48]
	mov	r1, r3
	str	ip, [r5, #440]
	strh	ip, [r6]	@ movhi
	str	r3, [r5, #452]
	str	r3, [r5, #456]
	str	r3, [r5, #460]
	str	r3, [r5, #464]
	str	r3, [r5, #444]
	str	lr, [r5, #448]
	blx	r4
.L890:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L927:
	str	r2, [fp, #-228]
	bl	MEM_Phy2Vir
	ldr	r2, [fp, #-228]
	subs	ip, r0, #0
	beq	.L932
	ldrb	r1, [ip, #1]	@ zero_extendqisi2
	ldrb	r0, [ip]	@ zero_extendqisi2
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	mov	r3, r1, asl #16
	orr	r3, r3, r0, asl #24
	orr	r3, r3, ip, asl #8
	cmp	r3, #256
	beq	.L898
	ldr	r3, [r5, #224]
	mov	r0, #1
	cmp	r3, #1
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	bfceq	r3, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-52]
	sub	r3, fp, #124
	ldr	r1, [r4, #4]
	ldrb	ip, [fp, #-52]	@ zero_extendqisi2
	mov	r1, r1, lsr #30
	bfi	ip, r1, #1, #1
	strb	ip, [fp, #-52]
	uxtb	r1, ip
	ldrh	ip, [r4, #10]
	bfi	r1, ip, #2, #1
	strb	r1, [fp, #-52]
	ldr	r1, [r4, #8]
	ldrb	ip, [fp, #-52]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	ip, r1, #3, #4
	strb	ip, [fp, #-52]
	ldr	r1, [r4, #8]
	ldrh	lr, [fp, #-52]
	and	r1, r1, #7
	ldr	ip, [r5, #120]
	bfi	lr, r1, #7, #4
	ldr	r1, [fp, #-220]
	rsb	ip, ip, r2
	str	r2, [fp, #-112]
	strb	r0, [fp, #-118]
	add	r2, r5, #240
	ldr	r1, [r1, #96]
	str	r6, [fp, #-108]
	add	ip, r1, ip
	strh	lr, [fp, #-52]	@ movhi
	str	ip, [fp, #-124]
	ldr	r1, [r4, #4]
	ldr	r0, [fp, #-224]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	b	.L898
.L908:
	cmp	r3, #1
	ldrb	r3, [fp, #-132]	@ zero_extendqisi2
	mov	r7, #0
	add	r2, r5, #240
	bfieq	r3, r0, #0, #1
	orrne	r3, r3, #1
	strb	r3, [fp, #-132]
	sub	r3, fp, #204
	ldr	r1, [r4, #4]
	ldrb	r0, [fp, #-132]	@ zero_extendqisi2
	mov	r1, r1, lsr #30
	bfi	r0, r1, #1, #1
	strb	r0, [fp, #-132]
	ldrh	lr, [r4, #10]
	uxtb	r1, r0
	ldr	r0, [fp, #-224]
	bfi	r1, lr, #2, #1
	strb	r1, [fp, #-132]
	ldr	r1, [r4, #8]
	ldrb	lr, [fp, #-132]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	bfi	lr, r1, #3, #4
	strb	lr, [fp, #-132]
	ldr	r1, [r4, #8]
	str	ip, [fp, #-188]
	ldrh	ip, [fp, #-132]
	and	r1, r1, #7
	strb	r7, [fp, #-198]
	bfi	ip, r1, #7, #4
	strb	r7, [fp, #-199]
	strh	ip, [fp, #-132]	@ movhi
	ldr	r1, [r4, #4]
	bic	r1, r1, #-1073741824
	bl	GetSegPts
	ldr	r2, [r5, #204]
	sub	r1, fp, #204
	ldr	r0, [fp, #-208]
	bl	InsertStreamSeg
	ldr	r3, [fp, #-220]
	ldr	ip, [r5, #120]
	sub	r1, fp, #204
	ldr	r2, [r5, #204]
	ldr	lr, [r3, #96]
	mov	r3, #1
	ldr	r0, [fp, #-208]
	strb	r7, [fp, #-199]
	str	r6, [fp, #-188]
	str	ip, [fp, #-192]
	str	lr, [fp, #-204]
	strb	r3, [fp, #-198]
	bl	InsertStreamSeg
	b	.L898
.L928:
	movw	r2, #3254
	ldr	r1, .L933+4
	mov	r0, #0
	bl	dprint_vfmw
	b	.L898
.L929:
	ldr	r3, [fp, #-240]
	add	lr, r5, #436
	ldr	r2, .L933
	add	r6, r5, #428
	mov	ip, #0
	mov	r8, #1
	mul	r3, r3, r7
	ldr	r4, [r2, #48]
	ldr	r2, [fp, #-244]
	mvn	r7, #0
	mov	r1, ip
	add	r0, r5, #472
	add	r3, r3, #1
	ldr	r9, [r2, r3, asl #2]
	mov	r2, #80
	str	r7, [r5, #432]
	bic	r9, r9, #-1073741824
	strh	r7, [r6]	@ movhi
	str	r7, [r5, #440]
	strh	r7, [lr]	@ movhi
	str	ip, [r5, #452]
	str	ip, [r5, #456]
	str	ip, [r5, #460]
	str	ip, [r5, #464]
	str	ip, [r5, #444]
	str	r8, [r5, #448]
	blx	r4
	mov	r1, r9
	ldr	r0, [fp, #-224]
	bl	DeleteRawLen
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L931:
	ldr	r1, .L933+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r0, [fp, #-224]
	mov	r1, #1
	bl	DeleteRawPacket
	b	.L916
.L930:
	ldr	r4, [r5, #156]
	mov	r1, r7
	ldr	r0, [fp, #-248]
	ldr	r2, [fp, #-232]
	bl	SetLastUnfinishedSegInfo
	mov	r1, r4
	ldr	r0, [fp, #-224]
	bl	DeleteRawLen
	b	.L890
.L932:
	movw	r2, #3224
	ldr	r1, .L933+12
	bl	dprint_vfmw
	b	.L890
.L934:
	.align	2
.L933:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC33
	.word	.LC37
	.word	.LC36
	UNWIND(.fnend)
	.size	ProcessMpeg4ScdUpMsg, .-ProcessMpeg4ScdUpMsg
	.align	2
	.global	ProcessScdReturn
	.type	ProcessScdReturn, %function
ProcessScdReturn:
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
	add	r4, r0, #262144
	mov	r5, r0
	ldr	r3, [r4, #160]
	cmp	r3, #3
	mov	r3, #2
	streq	r3, [r4, #160]
	mvneq	r0, #6
	beq	.L937
	str	r3, [r4, #160]
	sub	r0, fp, #60
	bl	ReadScdStateReg
	ldr	r6, [fp, #-48]
	movw	r3, #34464
	movt	r3, 1
	cmp	r6, r3
	bls	.L938
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L943
.L938:
	ldr	r1, [r4, #276]
	ldr	r0, [fp, #-36]
	bl	__aeabi_uidiv
	cmp	r0, r6
	movcc	r7, r0
	movcs	r7, r6
	cmp	r6, r7
	bhi	.L944
.L940:
	sub	r2, fp, #60
	mov	r1, r7
	mov	r0, r5
	bl	ProcessLastUnfinishedSeg
	clz	r3, r7
	mov	r3, r3, lsr #5
	cmp	r0, #0
	moveq	r4, r3
	orrne	r4, r3, #1
	cmp	r4, #0
	bne	.L937
	ldr	r3, [r5, #12]
	sub	r2, fp, #60
	sub	r1, r7, #1
	mov	r0, r5
	cmp	r3, #2
	beq	.L941
	bl	ProcessNotMpeg4ScdUpMsg
	mov	r0, r4
.L937:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L944:
	ldrsb	r3, [r5, #2]
	cmp	r3, #1
	moveq	r3, #0
	streqb	r3, [r5, #2]
	b	.L940
.L941:
	bl	ProcessMpeg4ScdUpMsg
	mov	r0, r4
	b	.L937
.L943:
	mov	r0, r5
	mov	r1, r6
	bl	ProcessExceptionalStartCodeNum
	mvn	r0, #6
	b	.L937
	UNWIND(.fnend)
	.size	ProcessScdReturn, .-ProcessScdReturn
	.align	2
	.global	SCDDRV_SaveRawStream
	.type	SCDDRV_SaveRawStream, %function
SCDDRV_SaveRawStream:
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
	ldr	r6, .L953
	mov	r7, r0
	mov	r8, r1
	mov	r5, r2
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r4, .L953+4
	mov	r0, #0
	ldr	r9, [r1, #12]
	ldr	r3, [r4, #16]
	blx	r3
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L947
	add	r1, r8, #28
	mov	r0, r9
	bl	SCDDRV_IsSCDByPass
	cmp	r0, #0
	bne	.L952
.L948:
	ldr	r2, [r6, r7, asl #2]
	ldr	r3, [r4, #44]
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #40]
	blx	r3
.L947:
	ldr	r3, [r4, #12]
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L952:
	ldr	r3, [r4, #44]
	mov	r1, #4
	ldr	r2, [r6, r7, asl #2]
	add	r0, r5, #8
	blx	r3
	b	.L948
.L954:
	.align	2
.L953:
	.word	vfmw_save_str_file
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SCDDRV_SaveRawStream, .-SCDDRV_SaveRawStream
	.align	2
	.global	NeedReadStream
	.type	NeedReadStream, %function
NeedReadStream:
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
	ldr	r3, [r1, #52]
	cmp	r3, #0
	beq	.L957
	add	r1, r1, #262144
	ldr	r3, [r1, #144]
	cmp	r3, #8
	bgt	.L958
	ldr	r2, .L959
	cmp	r3, #0
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r2, r0, asl #2]
	add	r2, r2, #311296
	ldr	r0, [r2, #3504]
	cmp	r0, #1
	moveq	r0, r3
	orrne	r0, r3, #1
	ldmfd	sp, {fp, sp, pc}
.L958:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L957:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L960:
	.align	2
.L959:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	NeedReadStream, .-NeedReadStream
	.align	2
	.global	FillEopRawStream
	.type	FillEopRawStream, %function
FillEopRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #112)
	sub	sp, sp, #112
	ldr	r3, .L976
	mov	r5, r1
	mov	r2, #100
	add	r3, r3, r0, lsl #3
	ldr	r1, .L976+4
	sub	r0, fp, #120
	ldr	r4, [r3, #8]
	bl	memcpy
	cmp	r5, #0
	beq	.L974
	ldr	r3, [r4, #12]
	cmp	r3, #18
	bhi	.L964
	mov	r2, #1
	movw	r4, #65406
	mov	r2, r2, asl r3
	movt	r4, 5
	and	r4, r4, r2
	cmp	r4, #0
	bne	.L965
	tst	r2, #1
	beq	.L964
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #80]
	add	r1, r3, #15
	cmp	r1, r2
	bhi	.L975
	ldr	ip, .L976+8
	sub	r1, fp, #120
	ldr	r0, [r5, #40]
	mov	r2, #15
	ldr	ip, [ip, #52]
	add	r0, r3, r0
	blx	ip
	ldr	r3, [r5, #8]
	mov	r0, r4
	add	r3, r3, #15
	str	r3, [r5, #8]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L965:
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #80]
	cmp	r3, r2
	bhi	.L970
	mov	r0, #0
.L971:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L964:
	ldr	r2, .L976+12
	mov	r0, #0
	ldr	r1, .L976+16
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L971
.L970:
	mov	r1, #0
.L967:
	stmia	sp, {r1, r2}
	mov	r0, #0
	ldr	r2, .L976+12
	ldr	r1, .L976+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L971
.L975:
	mov	r1, #15
	b	.L967
.L974:
	mov	r0, r5
	ldr	r2, .L976+12
	ldr	r1, .L976+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L971
.L977:
	.align	2
.L976:
	.word	.LANCHOR0
	.word	.LANCHOR3+104
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+204
	.word	.LC39
	.word	.LC40
	.word	.LC38
	UNWIND(.fnend)
	.size	FillEopRawStream, .-FillEopRawStream
	.align	2
	.global	FillEosRawStream
	.type	FillEosRawStream, %function
FillEosRawStream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #112)
	sub	sp, sp, #112
	ldr	r3, .L1000
	mov	r4, r1
	mov	r2, #100
	add	r3, r3, r0, lsl #3
	ldr	r1, .L1000+4
	sub	r0, fp, #120
	ldr	r5, [r3, #8]
	bl	memcpy
	cmp	r4, #0
	beq	.L998
	ldr	r3, [r5, #12]
	cmp	r3, #18
	ldrls	pc, [pc, r3, asl #2]
	b	.L981
.L983:
	.word	.L982
	.word	.L984
	.word	.L985
	.word	.L986
	.word	.L996
	.word	.L996
	.word	.L992
	.word	.L981
	.word	.L996
	.word	.L996
	.word	.L996
	.word	.L996
	.word	.L996
	.word	.L996
	.word	.L996
	.word	.L982
	.word	.L988
	.word	.L996
	.word	.L992
.L982:
	sub	r1, fp, #120
	mov	r5, #15
.L987:
	ldr	r3, [r4, #8]
	cmp	r5, r3
	bhi	.L999
	ldr	r3, .L1000+8
	mov	r2, r5
	ldr	r0, [r4, #40]
	ldr	r3, [r3, #52]
	blx	r3
	str	r5, [r4, #8]
.L996:
	mov	r0, #0
.L994:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L992:
	mov	r5, #15
	sub	r1, fp, #100
	b	.L987
.L984:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L996
	sub	r1, fp, #100
	mov	r5, #15
	b	.L987
.L985:
	mov	r5, #19
	sub	r1, fp, #80
	b	.L987
.L986:
	mov	r5, #16
	sub	r1, fp, #60
	b	.L987
.L988:
	mov	r5, #16
	sub	r1, fp, #40
	b	.L987
.L981:
	ldr	r2, .L1000+12
	mov	r0, #0
	ldr	r1, .L1000+16
	bl	dprint_vfmw
	mvn	r0, #6
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L999:
	str	r3, [sp]
	mov	r0, #0
	mov	r3, r5
	ldr	r2, .L1000+12
	ldr	r1, .L1000+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L994
.L998:
	mov	r0, r4
	ldr	r2, .L1000+12
	ldr	r1, .L1000+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L994
.L1001:
	.align	2
.L1000:
	.word	.LANCHOR0
	.word	.LANCHOR3+224
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+324
	.word	.LC39
	.word	.LC41
	.word	.LC38
	UNWIND(.fnend)
	.size	FillEosRawStream, .-FillEosRawStream
	.align	2
	.global	FillVC1ExtraData
	.type	FillVC1ExtraData, %function
FillVC1ExtraData:
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
	mov	r4, r1
	ldr	r1, [r0, #28]
	mov	r6, r0
	cmp	r1, #1
	beq	.L1012
	ldr	r3, [r4, #76]
	ands	r5, r3, #128
	bne	.L1013
	add	r7, r0, #262144
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #80]
	ldr	r0, [r7, #292]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L1014
	ldr	r6, .L1019
	ldr	r1, [r4, #40]
	ldr	r3, [r6, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r6, #52]
	ldr	r2, [r7, #292]
	add	r1, r7, #296
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r2, [r7, #292]
	ldr	r3, [r4, #8]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r4, #8]
.L1006:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1013:
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #80]
	cmp	r2, #116
	add	r3, r2, #12
	movle	r0, #0
	movgt	r0, #1
	cmp	r3, r1
	movls	r5, r0
	orrhi	r5, r0, #1
	cmp	r5, #0
	bne	.L1015
	ldr	r7, .L1019
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r7, #52]
	add	r1, r4, #84
	mov	r2, #4
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r7, #48]
	mov	r1, r5
	mov	r2, #4
	add	r0, r0, #12
	blx	r3
	add	r3, r6, #262144
	mov	r2, #16
	add	r0, r3, #296
	str	r2, [r4, #8]
	str	r2, [r3, #292]
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #40]
	blx	r3
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1012:
	ldr	r2, [r4, #76]
	ands	r5, r2, #128
	bne	.L1016
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1006
	add	r6, r6, #262144
	ldr	r2, [r4, #8]
	ldr	ip, [r4, #80]
	ldr	r0, [r6, #292]
	add	r3, r2, r0
	cmp	r3, ip
	bhi	.L1017
	ldr	r7, .L1019
	ldr	r1, [r4, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r6, #292]
	add	r1, r6, #296
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r2, [r6, #292]
	ldr	r3, [r4, #8]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r4, #8]
	b	.L1006
.L1016:
	ldr	r2, [r4, #8]
	cmp	r2, #128
	bgt	.L1018
	ldr	r1, .L1019
	add	r3, r0, #262144
	add	r0, r3, #296
	str	r2, [r3, #292]
	ldr	r3, [r1, #52]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #40]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1015:
	str	r1, [sp]
	mov	r0, #1
	mov	r1, #128
	ldr	r2, .L1019+4
	str	r1, [sp, #4]
	ldr	r1, .L1019+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1006
.L1014:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1019+4
	ldr	r1, .L1019+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1006
.L1018:
	mov	r3, r2
	mov	r0, r1
	ldr	r2, .L1019+4
	mov	r1, #128
	str	r1, [sp]
	ldr	r1, .L1019+16
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1006
.L1017:
	mov	r0, r1
	str	ip, [sp]
	ldr	r2, .L1019+4
	ldr	r1, .L1019+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1006
.L1020:
	.align	2
.L1019:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+344
	.word	.LC44
	.word	.LC43
	.word	.LC42
	UNWIND(.fnend)
	.size	FillVC1ExtraData, .-FillVC1ExtraData
	.align	2
	.global	FillDIVX3ExtraData
	.type	FillDIVX3ExtraData, %function
FillDIVX3ExtraData:
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
	ldr	r2, [r1, #8]
	mov	r4, r1
	ldr	r1, [r1, #80]
	add	r3, r2, #8
	cmp	r3, r1
	bhi	.L1024
	ldr	r5, .L1025
	ldr	r1, [r4, #40]
	ldr	r3, [r5, #56]
	add	r0, r1, #8
	blx	r3
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #84
	ldr	r0, [r4, #40]
	blx	r3
	ldr	r0, [r4, #40]
	ldr	r3, [r5, #52]
	mov	r2, #4
	add	r1, r4, #88
	add	r0, r0, r2
	blx	r3
	ldr	r3, [r4, #8]
	mov	r0, #0
	add	r3, r3, #8
	str	r3, [r4, #8]
.L1023:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1024:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1025+4
	ldr	r1, .L1025+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1023
.L1026:
	.align	2
.L1025:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+364
	.word	.LC45
	UNWIND(.fnend)
	.size	FillDIVX3ExtraData, .-FillDIVX3ExtraData
	.align	2
	.global	FillREAL8ExtraData
	.type	FillREAL8ExtraData, %function
FillREAL8ExtraData:
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
	ldr	r3, [r1, #76]
	mov	r6, r1
	ands	r5, r3, #128
	beq	.L1028
	ldr	r3, [r1, #8]
	cmp	r3, #128
	bgt	.L1032
	ldr	r2, .L1034
	add	r4, r0, #262144
	add	r0, r4, #296
	str	r3, [r4, #292]
	ldr	r3, [r2, #52]
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #40]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1028:
	add	r4, r0, #262144
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #80]
	ldr	r0, [r4, #292]
	add	r3, r2, r0
	cmp	r3, r1
	bhi	.L1033
	ldr	r7, .L1034
	ldr	r1, [r6, #40]
	ldr	r3, [r7, #56]
	add	r0, r1, r0
	blx	r3
	ldr	r3, [r7, #52]
	ldr	r2, [r4, #292]
	add	r1, r4, #296
	ldr	r0, [r6, #40]
	blx	r3
	ldr	r2, [r4, #292]
	ldr	r3, [r6, #8]
	mov	r0, r5
	add	r3, r3, r2
	str	r3, [r6, #8]
.L1030:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1033:
	str	r1, [sp]
	mov	r0, #1
	ldr	r2, .L1034+4
	ldr	r1, .L1034+8
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1030
.L1032:
	mov	r1, #128
	ldr	r2, .L1034+4
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L1034+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1030
.L1035:
	.align	2
.L1034:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+384
	.word	.LC46
	.word	.LC42
	UNWIND(.fnend)
	.size	FillREAL8ExtraData, .-FillREAL8ExtraData
	.align	2
	.global	FillExtraData
	.type	FillExtraData, %function
FillExtraData:
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
	clz	r3, r1
	mov	r3, r3, lsr #5
	cmp	r0, #31
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L1042
	ldr	r2, [r1, #8]
	cmp	r2, #0
	ble	.L1045
	ldr	r2, .L1047
	add	r0, r2, r0, lsl #3
	ldr	r0, [r0, #8]
	ldr	r2, [r0, #12]
	cmp	r2, #5
	beq	.L1039
	cmp	r2, #8
	beq	.L1040
	cmp	r2, #1
	beq	.L1046
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1040:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillREAL8ExtraData
.L1039:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillDIVX3ExtraData
.L1046:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FillVC1ExtraData
.L1042:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1045:
	mov	r3, r2
	ldr	r1, .L1047+4
	ldr	r2, .L1047+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1048:
	.align	2
.L1047:
	.word	.LANCHOR0
	.word	.LC47
	.word	.LANCHOR3+404
	UNWIND(.fnend)
	.size	FillExtraData, .-FillExtraData
	.align	2
	.global	ReleaseRawStreamData
	.type	ReleaseRawStreamData, %function
ReleaseRawStreamData:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #116)
	sub	sp, sp, #116
	mov	r6, r1
	mov	r7, r0
	bl	VCTRL_GetStreamInterface
	ldr	r5, .L1064
	mov	r2, #12
	mov	r1, #0
	ldr	r3, [r5, #48]
	mov	r4, r0
	sub	r0, fp, #144
	blx	r3
	cmp	r4, #0
	beq	.L1061
	mov	r1, r4
	ldr	r3, [r5, #52]
	mov	r2, #12
	sub	r0, fp, #144
	blx	r3
	mov	r1, r6
	ldr	r3, [r5, #52]
	sub	r0, fp, #132
	mov	r2, #96
	ldr	r6, .L1064+4
	blx	r3
	ldr	r3, [r4, #8]
	mov	r8, r7, asl #3
	cmp	r3, #0
	mvneq	r4, #6
	beq	.L1052
	add	r4, r6, r8
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #52]
	cmp	r3, #1
	beq	.L1062
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	ldr	r3, [r5, #24]
	mov	r1, r7
	mov	r0, #1
	blx	r3
	ldr	r3, [r4, #8]
	cmp	r3, #0
	mvneq	r4, #6
	beq	.L1055
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	mov	r4, r0
.L1055:
	ldr	r3, [r5, #28]
	mov	r0, #1
	mov	r1, r7
	blx	r3
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
.L1054:
	cmp	r4, #0
	mvnne	r4, #6
.L1052:
	add	r6, r6, r8
	ldr	r0, [r6, #8]
	cmp	r0, #0
	movne	r0, r4
	beq	.L1063
.L1051:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1062:
	sub	r1, fp, #132
	ldr	r3, [fp, #-136]
	ldr	r0, [fp, #-144]
	blx	r3
	mov	r4, r0
	b	.L1054
.L1061:
	mov	r2, r7
	mov	r0, r4
	ldr	r1, .L1064+8
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1051
.L1063:
	mov	r3, r7
	movw	r2, #4159
	ldr	r1, .L1064+12
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1051
.L1065:
	.align	2
.L1064:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC48
	.word	.LC49
	UNWIND(.fnend)
	.size	ReleaseRawStreamData, .-ReleaseRawStreamData
	.align	2
	.global	DeleteRawPacketInBuffer
	.type	DeleteRawPacketInBuffer, %function
DeleteRawPacketInBuffer:
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
	cmp	r0, #31
	mov	r8, r0
	bhi	.L1082
	ldr	r10, .L1086
	mov	r9, r0, asl #3
	add	r3, r10, r9
	ldr	r6, [r3, #8]
	cmp	r6, #0
	beq	.L1078
	cmp	r1, #0
	beq	.L1083
.L1069:
	adds	r3, r6, #72
	str	r3, [fp, #-52]
	beq	.L1078
	add	r3, r6, #98304
	str	r3, [fp, #-56]
	ldr	r7, [r3, #72]
	ldr	r4, [r3, #80]
	cmp	r7, r4
	addlt	r7, r7, #1024
	rsb	r3, r4, r7
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1078
	mov	r7, #0
	mov	r3, r9
	mov	r9, r7
	mov	r7, r3
	b	.L1073
.L1085:
	ldr	r3, [fp, #-48]
	cmp	r9, r3
	beq	.L1084
.L1073:
	mov	r5, r4, asl #7
	ldr	r2, .L1086+4
	sub	r5, r5, r4, asl #5
	ldr	r1, .L1086+8
	add	lr, r6, r5
	mov	r0, #26
	add	r4, r4, #1
	add	r9, r9, #1
	ldr	r3, [lr, #76]
	ubfx	r4, r4, #0, #10
	ldr	lr, [lr, #80]
	str	lr, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	mov	r0, r8
	add	r1, r3, r5
	bl	ReleaseRawStreamData
	add	r3, r10, r7
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L1085
	mvn	r0, #6
.L1068:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1083:
	add	r3, r6, #262144
	ldr	r3, [r3, #220]
	cmp	r3, #0
	bne	.L1069
.L1078:
	mvn	r0, #0
	b	.L1068
.L1084:
	ldr	r3, [fp, #-56]
	ldr	r4, [r3, #80]
	add	r4, r4, r9
	cmp	r4, #1024
	strlt	r4, [r3, #80]
	subge	r4, r4, #1024
	ldrge	r3, [fp, #-56]
	movlt	r0, #0
	movge	r0, #0
	strge	r4, [r3, #80]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1082:
	mov	r2, r0
	ldr	r1, .L1086+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1068
.L1087:
	.align	2
.L1086:
	.word	.LANCHOR0
	.word	.LANCHOR3+420
	.word	.LC10
	.word	.LC50
	UNWIND(.fnend)
	.size	DeleteRawPacketInBuffer, .-DeleteRawPacketInBuffer
	.align	2
	.global	SM_Reset
	.type	SM_Reset, %function
SM_Reset:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
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
	cmp	r0, #31
	mov	r10, r0
	bhi	.L1097
	ldr	r9, .L1108
	add	r9, r9, r0, lsl #3
	ldr	r5, [r9, #8]
	cmp	r5, #0
	beq	.L1105
	ldr	r6, .L1108+4
	add	r4, r5, #262144
	mov	r2, #68
	add	r1, r5, #4
	sub	r0, fp, #240
	add	r7, r4, #296
	ldr	r3, [r6, #52]
	blx	r3
	ldr	ip, [r4, #220]
	ldr	r3, [r6, #52]
	mov	r1, r7
	sub	r0, fp, #172
	mov	r2, #128
	str	ip, [fp, #-248]
	ldr	r8, [r4, #292]
	blx	r3
	ldr	r3, [r9, #8]
	cmp	r3, #0
	beq	.L1091
	add	r3, r3, #262144
	ldr	r2, [r3, #220]
	cmp	r2, #0
	bne	.L1106
.L1091:
	adds	r9, r5, #72
	beq	.L1092
.L1107:
	add	r2, r5, #98304
	ldr	r3, [r2, #76]
	ldr	r1, [r2, #72]
	subs	r1, r3, r1
	addmi	r1, r1, #1024
.L1096:
	mov	r0, r9
	mov	r9, #0
	bl	DeleteRawPacket
	mov	r1, #1
	mov	r0, r10
	bl	DeleteRawPacketInBuffer
	movw	r2, #16936
	mov	r0, r5
	movt	r2, 4
	ldr	ip, [r6, #48]
	mov	r1, r9
	ldrb	r5, [r4, #204]	@ zero_extendqisi2
	blx	ip
	add	lr, r4, #436
	add	r2, r4, #428
	mvn	r0, #0
	mov	r1, r9
	str	r0, [r4, #432]
	mov	ip, #1
	strh	r0, [r2]	@ movhi
	mov	r2, #80
	str	r0, [r4, #440]
	strh	r0, [lr]	@ movhi
	add	r0, r4, #472
	str	ip, [r4, #448]
	str	r9, [r4, #452]
	ldr	ip, [r6, #48]
	str	r9, [r4, #456]
	str	r9, [r4, #460]
	str	r9, [r4, #464]
	str	r9, [r4, #444]
	blx	ip
	sxtb	r3, r5
	mvn	r2, #0
	mov	ip, #2
	sub	r1, fp, #240
	str	r3, [r4, #204]
	str	ip, [r4, #276]
	mvn	r3, #0
	mov	r0, r10
	strd	r2, [r4, #240]
	bl	SM_Config
	ldr	r3, [fp, #-248]
	str	r8, [r4, #292]
	sub	r1, fp, #172
	sub	r5, r3, #1
	mov	r0, r7
	cmp	r5, #1
	ldr	r3, [r6, #52]
	mov	r2, #128
	movhi	r5, #0
	movls	r5, #1
	str	r5, [r4, #220]
	blx	r3
	mov	r0, r9
.L1104:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1106:
	ldr	r2, [r3, #208]
	cmp	r2, #0
	movle	r2, #0
	strle	r2, [r3, #220]
	adds	r9, r5, #72
	bne	.L1107
.L1092:
	ldr	r1, .L1108+8
	movw	r3, #1293
	ldr	r2, .L1108+12
	mov	r0, #22
	bl	dprint_vfmw
	mov	r1, r9
	b	.L1096
.L1097:
	mvn	r0, #0
	b	.L1104
.L1105:
	mov	r0, r5
	movw	r2, #1276
	ldr	r1, .L1108+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1104
.L1109:
	.align	2
.L1108:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC52
	.word	.LANCHOR3+444
	.word	.LC51
	UNWIND(.fnend)
	.size	SM_Reset, .-SM_Reset
	.align	2
	.global	ReadRawStreamData
	.type	ReadRawStreamData, %function
ReadRawStreamData:
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
	ldr	r8, .L1152
	mov	r10, r0, asl #3
	ldr	r6, .L1152+4
	add	r3, r8, r10
	mov	r5, r0
	mov	r9, r1
	mov	r2, #12
	ldr	r4, [r3, #8]
	sub	r0, fp, #56
	ldr	r3, [r6, #48]
	mov	r1, #0
	blx	r3
	cmp	r4, #0
	beq	.L1143
	mov	r0, r5
	bl	VCTRL_GetStreamInterface
	subs	r7, r0, #0
	beq	.L1145
	ldr	r3, [r6, #52]
	sub	r0, fp, #56
	mov	r2, #12
	mov	r1, r7
	blx	r3
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L1143
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L1146
	ldr	r3, .L1152+8
	mov	r0, #0
	ldr	r2, [r6, #16]
	ldr	r7, [r3, r5, asl #2]
	str	r3, [fp, #-64]
	cmp	r7, #0
	addne	r7, r7, #311296
	ldrne	r7, [r7, #3476]
	blx	r2
	ldr	r3, [fp, #-64]
	ldr	r2, .L1152+4
	ldr	r3, [r3, r5, asl #2]
	cmp	r3, #0
	beq	.L1118
	add	r3, r3, #311296
	ldr	r3, [r3, #3476]
	cmp	r3, r7
	bne	.L1147
.L1118:
	ldr	r3, [fp, #-52]
	mov	r1, r9
	ldr	r0, [fp, #-56]
	add	r8, r8, r10
	blx	r3
	ldr	r3, [r6, #12]
	mov	r7, r0
	mov	r0, #0
	blx	r3
	ldr	r0, [r8, #8]
	cmp	r0, #0
	beq	.L1148
.L1116:
	cmp	r7, #0
	bne	.L1143
	ldrb	r6, [r9, #1]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L1149
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L1150
.L1121:
	add	r4, r4, #98304
	ldr	r2, [r9, #8]
	mov	r0, #0
	ldr	r3, [r4, #92]
	add	r3, r3, r2
	str	r3, [r4, #92]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1150:
	mov	r1, r9
	mov	r0, r5
	bl	FillExtraData
	cmp	r0, #0
	beq	.L1123
	mov	r2, r5
	ldr	r1, .L1152+12
	mov	r0, r7
	bl	dprint_vfmw
	mov	r1, r9
	ldr	r0, [fp, #-56]
	bl	ReleaseRawStreamData
	cmp	r0, #0
	beq	.L1143
	mov	r0, r7
	ldr	r1, .L1152+16
	bl	dprint_vfmw
.L1143:
	mvn	r0, #6
.L1141:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1146:
	ldr	r3, [fp, #-52]
	mov	r1, r9
	ldr	r0, [fp, #-56]
	blx	r3
	mov	r7, r0
	b	.L1116
.L1149:
	mov	r1, r9
	mov	r0, r5
	bl	FillEosRawStream
	cmp	r0, #0
	bne	.L1151
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_SetLastFrameState
	b	.L1121
.L1123:
	add	r3, r4, #262144
	ldr	r3, [r3, #288]
	cmp	r3, #0
	beq	.L1121
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1121
	mov	r0, r5
	mov	r1, r9
	bl	FillEopRawStream
	b	.L1121
.L1147:
	ldr	r3, [r2, #12]
	mov	r0, #0
	blx	r3
	mvn	r0, #6
	b	.L1141
.L1145:
	mov	r2, r5
	ldr	r1, .L1152+20
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1141
.L1151:
	mov	r2, r5
	mov	r0, r7
	ldr	r1, .L1152+24
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1141
.L1148:
	mov	r3, r5
	movw	r2, #4063
	ldr	r1, .L1152+28
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1141
.L1153:
	.align	2
.L1152:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LC56
	.word	.LC57
	.word	.LC53
	.word	.LC55
	.word	.LC54
	UNWIND(.fnend)
	.size	ReadRawStreamData, .-ReadRawStreamData
	.align	2
	.global	FillRawData
	.type	FillRawData, %function
FillRawData:
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
	ldr	r8, .L1198
	mov	r9, r0, asl #3
	ldr	r6, .L1198+4
	add	r3, r8, r9
	mov	r4, r0
	mov	r2, #96
	mov	r1, #0
	ldr	r5, [r3, #8]
	sub	r0, fp, #140
	ldr	r3, [r6, #48]
	blx	r3
	cmp	r5, #0
	beq	.L1154
	ldr	r3, [r5, #12]
	cmp	r3, #20
	beq	.L1154
	ldr	r7, .L1198+8
	mov	r3, r4, asl #24
	str	r3, [fp, #-152]
.L1169:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L1156
	add	r3, r5, #262144
	ldr	r3, [r3, #144]
	cmp	r3, #8
	ble	.L1194
.L1154:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1194:
	ldr	r2, [r7, r4, asl #2]
	cmp	r3, #0
	add	r2, r2, #311296
	movgt	r3, #0
	movle	r3, #1
	ldr	r2, [r2, #3504]
	cmp	r2, #1
	orrne	r3, r3, #1
	cmp	r3, #0
	beq	.L1154
.L1156:
	cmp	r4, #31
	bhi	.L1160
	add	r3, r8, r9
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1160
	add	r2, r3, #98304
	ldr	r3, [r2, #76]
	ldr	r2, [r2, #80]
	add	r3, r3, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #22
	add	r3, r3, r1
	ubfx	r3, r3, #0, #10
	rsb	r3, r1, r3
	cmp	r3, r2
	beq	.L1160
	sub	r1, fp, #140
	mov	r0, r4
	bl	ReadRawStreamData
	subs	r3, r0, #0
	str	r3, [fp, #-144]
	bne	.L1154
	add	r10, r5, #262144
	ldr	r2, [fp, #-132]
	ldr	r1, [r6]
	ldr	r0, [r10, #256]
	ldr	ip, [r10, #280]
	add	r0, r0, r2
	str	r0, [r10, #256]
	ldr	r0, [r10, #284]
	add	r2, r2, ip
	str	r2, [r10, #280]
	add	r2, r0, #1
	str	r2, [r10, #284]
	blx	r1
	ldr	r1, [r10, #260]
	cmp	r1, #0
	streq	r0, [r10, #260]
	beq	.L1163
	rsb	r1, r1, r0
	cmp	r1, #2000
	bls	.L1163
	str	r0, [fp, #-148]
	ldr	r0, [r10, #256]
	mov	r0, r0, asl #3
	bl	__aeabi_uidiv
	mov	r1, #1000
	ldr	r3, [fp, #-144]
	ldr	r2, [fp, #-148]
	str	r3, [r10, #256]
	str	r2, [r10, #260]
	mul	r0, r1, r0
	mov	r0, r0, lsr #10
	str	r0, [r10, #264]
.L1163:
	ldrd	r2, [fp, #-76]
	mov	r0, #29
	ldr	r1, .L1198+12
	bl	dprint_vfmw
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #-136]
	mov	r0, #26
	ldr	r1, .L1198+16
	bl	dprint_vfmw
	ldrd	r2, [fp, #-76]
	mov	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1195
.L1164:
	sub	r1, fp, #140
	mov	r0, r4
	bl	SCDDRV_InsertRawPacket
	cmp	r0, #0
	bne	.L1196
	mov	r3, #1
	strb	r3, [r5, #3]
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1197
.L1167:
	sub	r2, fp, #140
	mov	r1, r5
	mov	r0, r4
	bl	SCDDRV_SaveRawStream
	ldr	r3, [r7, r4, asl #2]
	add	r3, r3, #311296
	ldr	r3, [r3, #3504]
	cmp	r3, #1
	bne	.L1169
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1160:
	mov	r2, r4
	ldr	r1, .L1198+20
	mov	r0, #23
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1197:
	ldr	r3, [r6]
	blx	r3
	add	ip, r8, r4, lsl #2
	ldr	r2, .L1198+24
	ldr	r3, [ip, #340]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	cmp	r3, r2
	bls	.L1167
	str	r0, [ip, #340]
	movw	r1, #3492
	ldr	r2, [fp, #-152]
	ldr	r0, .L1198+28
	bl	DBG_AddTrace
	b	.L1167
.L1195:
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [fp, #-76]
	b	.L1164
.L1196:
	ldr	r1, .L1198+32
	mov	r0, #0
	bl	dprint_vfmw
	b	.L1154
.L1199:
	.align	2
.L1198:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	.word	.LC58
	.word	.LC59
	.word	.LC61
	.word	g_TraceBsPeriod
	.word	.LANCHOR3+456
	.word	.LC60
	UNWIND(.fnend)
	.size	FillRawData, .-FillRawData
	.align	2
	.global	ReleaseSegArrayPackets
	.type	ReleaseSegArrayPackets, %function
ReleaseSegArrayPackets:
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
	cmp	r1, #2048
	mov	r4, r1
	mov	r7, r0
	mov	r5, r2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r1, r2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r8, r0, #163840
	mov	r6, #2
.L1203:
	mov	r3, r4, asl #6
	mov	r1, r4
	add	r3, r3, r4, lsl #4
	mov	r0, r7
	add	r3, r7, r3
	strb	r6, [r3, #12]
	ldr	ip, [r3, #24]
	ldr	r2, [r8, #44]
	ldr	r3, [r8, #48]
	rsb	r2, ip, r2
	sub	r3, r3, #1
	bic	r2, r2, r2, asr #31
	str	r2, [r8, #44]
	bic	r3, r3, r3, asr #31
	str	r3, [r8, #48]
	bl	ReleaseStreamSeg
	add	r3, r4, #1
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #21
	add	r3, r3, r4
	ubfx	r3, r3, #0, #11
	rsb	r4, r4, r3
	cmp	r5, r4
	bne	.L1203
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReleaseSegArrayPackets, .-ReleaseSegArrayPackets
	.align	2
	.global	SM_SeekPtsInSegArray
	.type	SM_SeekPtsInSegArray, %function
SM_SeekPtsInSegArray:
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
	ldrd	r2, [r1]
	add	r8, r0, #163840
	mov	r5, r0
	mov	r9, r1
	ldr	r4, [r8, #8]
	mov	r6, r2
	mov	r7, r3
	ldr	ip, [r8, #12]
	ldrd	r2, [r1, #8]
	str	r4, [r8, #16]
	strd	r2, [fp, #-52]
.L1206:
	mov	r3, r4, asl #6
	cmp	r4, ip
	add	r3, r3, r4, lsl #4
	mov	r1, r4
	add	r3, r5, r3
	mov	r0, r5
	add	r10, r3, #40
	beq	.L1217
	ldrsb	r2, [r3, #12]
	cmp	r2, #1
	bne	.L1209
	ldrd	r2, [r3, #40]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	addeq	r3, r4, #1
	beq	.L1216
	cmp	r7, r3
	add	r1, r4, #1
	cmpeq	r6, r2
	mov	r3, r1, asr #31
	bls	.L1212
	str	r4, [r8, #16]
	mov	r4, r3, lsr #21
	add	r1, r1, r4
	ubfx	r1, r1, #0, #11
	rsb	r4, r4, r1
	b	.L1206
.L1209:
	bl	ReleaseStreamSeg
	ldr	ip, [r8, #12]
	add	r3, r4, #1
.L1216:
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #21
	add	r3, r3, r4
	ubfx	r3, r3, #0, #11
	rsb	r4, r4, r3
	b	.L1206
.L1212:
	beq	.L1218
	bcs	.L1206
	ldr	ip, [r8, #16]
	mvn	r2, #0
	mov	r3, ip, asl #6
	add	r3, r3, ip, lsl #4
	add	r3, r5, r3
	ldrd	r0, [r3, #40]
	mvn	r3, #0
	cmp	r1, r3
	cmpeq	r0, r2
	streq	r4, [r8, #16]
	moveq	ip, r4
	beq	.L1215
	cmp	r7, r1
	cmpeq	r6, r0
	bls	.L1215
	subs	r6, r6, r0
	sbc	r7, r7, r1
	mov	r0, r6
	mov	r1, r7
	ldrd	r6, [fp, #-52]
	cmp	r7, r1
	cmpeq	r6, r0
	strcc	r4, [r8, #16]
	movcc	ip, r4
.L1215:
	mov	r2, ip
	mov	r0, r5
	ldr	r1, [r8, #8]
	bl	ReleaseSegArrayPackets
	ldr	r2, [r8, #16]
	mov	r0, #0
	mov	r3, r2, asl #6
	add	r3, r3, r2, lsl #4
	add	r5, r5, r3
	ldrd	r2, [r5, #40]
	strd	r2, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1217:
	mov	r2, r4
	ldr	r1, [r8, #8]
	bl	ReleaseSegArrayPackets
	mvn	r0, #1
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1218:
	mov	r2, r4
	mov	r0, r5
	ldr	r1, [r8, #8]
	bl	ReleaseSegArrayPackets
	ldrd	r2, [r10]
	mov	r0, #0
	strd	r2, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	SM_SeekPtsInSegArray, .-SM_SeekPtsInSegArray
	.align	2
	.global	SM_SeekPtsInRawArray
	.type	SM_SeekPtsInRawArray, %function
SM_SeekPtsInRawArray:
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
	ldr	ip, .L1255
	str	r2, [fp, #-64]
	mov	r8, r0
	add	ip, ip, r2, lsl #3
	str	r1, [fp, #-72]
	str	r3, [fp, #-76]
	ldr	r2, [ip, #8]
	cmp	r2, #0
	str	r2, [fp, #-68]
	beq	.L1238
	cmp	r3, #1
	mov	r3, r1
	ldrd	r2, [r3, #8]
	ldrd	r0, [r1]
	strd	r2, [fp, #-92]
	movne	r3, #0
	strd	r0, [fp, #-60]
	strne	r3, [fp, #-80]
	beq	.L1249
.L1221:
	add	r9, r8, #98304
	mvn	r6, #0
	mvn	r7, #0
	strd	r6, [fp, #-52]
	ldr	r10, [r9]
	ldr	r1, [r9, #4]
	mov	r3, r10
	str	r10, [r9, #8]
.L1222:
	mov	r0, r3, asl #5
	mov	lr, r3, asl #7
	add	r2, r3, #1
	cmp	r3, r1
	rsb	ip, r0, lr
	add	ip, r8, ip
	mov	r7, r2, asr #31
	beq	.L1250
	ldrd	r4, [ip, #64]
	mov	ip, r7, lsr #22
	ldrd	r6, [fp, #-52]
	add	r2, r2, ip
	ubfx	r2, r2, #0, #10
	cmp	r5, r7
	cmpeq	r4, r6
	beq	.L1251
	ldrd	r6, [fp, #-60]
	cmp	r7, r5
	cmpeq	r6, r4
	bls	.L1228
	str	r3, [r9, #8]
	rsb	r3, ip, r2
	b	.L1222
.L1251:
	add	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #22
	add	r2, r2, r3
	ubfx	r2, r2, #0, #10
	rsb	r3, r3, r2
	b	.L1222
.L1250:
	cmp	r10, r3
	str	r10, [r9, #8]
	addgt	r3, r3, #1024
	mov	r0, r8
	rsb	r1, r10, r3
	bl	DeleteRawPacket
	ldr	r0, [fp, #-64]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mvn	r0, #1
.L1220:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1228:
	beq	.L1252
	ldr	r2, [r9, #8]
	mvn	r5, #0
	mvn	r4, #0
	mov	r1, r2, asl #7
	sub	r1, r1, r2, asl #5
	add	r1, r8, r1
	ldrd	r0, [r1, #64]
	cmp	r1, r5
	cmpeq	r0, r4
	streq	r3, [r9, #8]
	moveq	r2, r3
	beq	.L1234
	ldrd	r4, [fp, #-60]
	cmp	r5, r1
	cmpeq	r4, r0
	bhi	.L1253
.L1234:
	cmp	r10, r2
	ldr	r3, [fp, #-76]
	addgt	r1, r2, #1024
	rsble	r1, r10, r2
	rsbgt	r1, r10, r1
	cmp	r3, #1
	beq	.L1254
.L1237:
	mov	r3, r2, asl #7
	mov	r0, r8
	sub	r2, r3, r2, asl #5
	add	r8, r8, r2
	ldrd	r2, [r8, #64]
.L1248:
	ldr	ip, [fp, #-72]
	strd	r2, [ip]
	ldr	r3, [r9]
	str	r3, [r9, #8]
	bl	DeleteRawPacket
	ldr	r0, [fp, #-64]
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1249:
	ldr	r3, [fp, #-68]
	add	r3, r3, #262144
	ldr	r2, [r3, #160]
	cmp	r2, #1
	str	r2, [fp, #-80]
	moveq	r2, #3
	streq	r2, [r3, #160]
	b	.L1221
.L1253:
	subs	r4, r4, r0
	sbc	r5, r5, r1
	mov	r0, r4
	mov	r1, r5
	ldrd	r4, [fp, #-92]
	cmp	r5, r1
	cmpeq	r4, r0
	strcc	r3, [r9, #8]
	movcc	r2, r3
	b	.L1234
.L1252:
	cmp	r10, r3
	addgt	r3, r3, #1024
	rsb	r1, r10, r3
	ldr	r3, [fp, #-76]
	cmp	r3, #1
	bne	.L1232
	ldr	r3, [fp, #-68]
	ldr	ip, [fp, #-80]
	add	r3, r3, #262144
	ldr	r2, [r3, #152]
	cmp	r1, r2
	cmple	ip, #1
	moveq	r2, ip
	streq	r2, [r3, #160]
.L1232:
	rsb	r0, r0, lr
	add	r3, r8, r0
	mov	r0, r8
	ldrd	r2, [r3, #64]
	b	.L1248
.L1254:
	ldr	r3, [fp, #-68]
	ldr	ip, [fp, #-80]
	add	r3, r3, #262144
	ldr	r0, [r3, #152]
	cmp	r1, r0
	cmple	ip, #1
	moveq	r2, ip
	streq	r2, [r3, #160]
	ldreq	r2, [r9, #8]
	b	.L1237
.L1238:
	mvn	r0, #0
	b	.L1220
.L1256:
	.align	2
.L1255:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SM_SeekPtsInRawArray, .-SM_SeekPtsInRawArray
	.align	2
	.global	SM_SeekPtsAfterFillNewRaw
	.type	SM_SeekPtsAfterFillNewRaw, %function
SM_SeekPtsAfterFillNewRaw:
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
	mov	r4, r2
	mov	r5, r0
	mov	r6, r1
	mov	r0, r2
	mov	r1, #0
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	FillRawData
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	mov	r3, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	SM_SeekPtsInRawArray
	UNWIND(.fnend)
	.size	SM_SeekPtsAfterFillNewRaw, .-SM_SeekPtsAfterFillNewRaw
	.align	2
	.global	SM_SeekPts
	.type	SM_SeekPts, %function
SM_SeekPts:
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
	ldr	r3, .L1280
	mov	r5, r0
	mov	r6, r1
	add	r3, r3, r0, lsl #3
	ldr	r4, [r3, #8]
	cmp	r4, #0
	beq	.L1270
	add	r7, r4, #98304
	add	r0, r7, #96
	bl	SM_SeekPtsInSegArray
	cmp	r0, #0
	bne	.L1260
.L1261:
	mov	r0, #0
.L1259:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1260:
	add	r8, r4, #72
	mov	r1, #0
	mov	r0, r5
	bl	DeleteRawPacketInBuffer
	mov	r0, r8
	mov	r3, #1
	mov	r2, r5
	mov	r1, r6
	bl	SM_SeekPtsInRawArray
	cmp	r0, #0
	beq	.L1261
	ldr	r2, [r7, #72]
	ldr	r0, [r7, #76]
	cmp	r2, r0
	addgt	r0, r0, #1024
	rsb	r0, r2, r0
	ldrd	r2, [r6, #16]
	mov	r1, r0, asr #31
	cmp	r1, r3
	cmpeq	r0, r2
	bcs	.L1279
	subs	r2, r2, r0
	movw	r0, #1023
	sbc	r3, r3, r1
	and	r0, r0, r2
	mov	r1, #0
	mov	r7, r2, lsr #10
	and	r1, r1, r3
	orr	r7, r7, r3, asl #22
	orrs	r1, r0, r1
	addne	r7, r7, #1
	cmp	r7, #0
	movge	r4, #0
	blt	.L1269
.L1268:
	mov	r2, r5
	mov	r1, r6
	mov	r0, r8
	add	r4, r4, #1
	bl	SM_SeekPtsAfterFillNewRaw
	cmp	r0, #0
	beq	.L1261
	cmp	r7, r4
	bge	.L1268
.L1269:
	mvn	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1270:
	mvn	r0, #0
	b	.L1259
.L1279:
	strd	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1280+4
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L1259
.L1281:
	.align	2
.L1280:
	.word	.LANCHOR0
	.word	.LC62
	UNWIND(.fnend)
	.size	SM_SeekPts, .-SM_SeekPts
	.align	2
	.global	SM_MoveRawData
	.type	SM_MoveRawData, %function
SM_MoveRawData:
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
	add	r7, r0, #98304
	mov	r5, r0
	ldr	r3, [r7, #76]
	subs	r6, r3, #1
	addmi	r6, r3, #1020
	addmi	r6, r6, #3
	subs	r8, r3, #2
	addmi	r8, r3, #1020
	addmi	r8, r8, #2
	mov	r1, r6, asl #7
	sub	r1, r1, r6, asl #5
	mov	r3, r8, asl #7
	add	r9, r0, r1
	sub	r8, r3, r8, asl #5
	add	r1, r1, #72
	add	r8, r0, r8
	ldr	r3, [r0, #60]
	add	r4, r0, r1
	ldr	r2, [r9, #80]
	ldr	r0, [r8, #80]
	add	r1, r0, r2
	cmp	r1, r3
	bgt	.L1285
	ldr	r3, .L1287
	add	r5, r5, #262144
	ldr	ip, [r8, #112]
	ldr	r1, [r9, #112]
	ldr	r3, [r3, #52]
	add	r0, r0, ip
	blx	r3
	ldr	r2, [r9, #80]
	ldr	r3, [r8, #80]
	mov	r1, r4
	add	r3, r3, r2
	str	r3, [r8, #80]
	ldr	r0, [r5, #204]
	bl	ReleaseRawStreamData
	mov	r0, #0
	str	r6, [r7, #76]
.L1286:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1285:
	str	r3, [sp]
	mov	r3, r2
	ldr	r1, .L1287+4
	mov	r2, r0
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #6
	b	.L1286
.L1288:
	.align	2
.L1287:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC63
	UNWIND(.fnend)
	.size	SM_MoveRawData, .-SM_MoveRawData
	.align	2
	.global	SCDDRV_ProcessSegFull
	.type	SCDDRV_ProcessSegFull, %function
SCDDRV_ProcessSegFull:
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
	add	r7, r0, #98304
	add	r6, r0, #262144
	add	r7, r7, #96
	ldrsb	r5, [r0, #1]
	cmp	r7, #0
	mov	r8, r0
	ldr	r4, [r6, #124]
	ldrne	r9, [r6, #144]
	moveq	r10, r7
	ldrne	r10, [r6, #140]
	moveq	r9, r7
	cmp	r5, #0
	bne	.L1291
	add	r4, r4, r4, lsr #31
	cmp	r10, r4, asr #1
	movlt	r3, #1
	movge	r3, #0
	cmp	r9, #127
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L1303
	mov	r2, #1
	strb	r2, [r0, #1]
	ldr	r3, [r3]
	blx	r3
	str	r5, [r6, #232]
	str	r0, [r6, #236]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1291:
	ldr	r3, .L1303
	ldr	r3, [r3]
	blx	r3
	ldr	r2, [r6, #236]
	cmp	r0, r2
	bls	.L1294
	rsb	r2, r2, r0
	str	r2, [r6, #232]
	cmp	r2, #1000
	ble	.L1302
	add	r3, r4, #3
	cmp	r4, #0
	movlt	r4, r3
	cmp	r10, r4, asr #2
	movlt	r3, #1
	movge	r3, #0
	cmp	r9, #63
	movgt	r3, #0
	andle	r3, r3, #1
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r1, .L1303+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r7
	mvn	r1, #0
	bl	ReleaseStreamSeg
	mov	r3, #0
	strb	r3, [r8, #1]
	strb	r3, [r8]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1294:
	mov	r3, #0
	str	r0, [r6, #236]
	str	r3, [r6, #232]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1302:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1304:
	.align	2
.L1303:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC64
	UNWIND(.fnend)
	.size	SCDDRV_ProcessSegFull, .-SCDDRV_ProcessSegFull
	.align	2
	.global	SCDDRV_CanNotSelectInst
	.type	SCDDRV_CanNotSelectInst, %function
SCDDRV_CanNotSelectInst:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	ldr	r3, .L1318
	add	r0, r3, r0, lsl #3
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L1308
	add	r2, r3, #262144
	ldr	r1, [r2, #220]
	cmp	r1, #0
	beq	.L1308
	ldr	r2, [r2, #212]
	cmp	r2, #1
	beq	.L1308
	add	r2, r3, #28
	ldr	ip, [r3, #12]
	sub	r3, fp, #24
	ldmia	r2, {r0, r1, r2}
	cmp	ip, #19
	stmia	r3, {r0, r1, r2}
	beq	.L1308
	mov	r1, r3
	mov	r0, ip
	bl	SCDDRV_IsSCDByPass
	adds	r0, r0, #0
	movne	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1308:
	mov	r0, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L1319:
	.align	2
.L1318:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	SCDDRV_CanNotSelectInst, .-SCDDRV_CanNotSelectInst
	.align	2
	.global	SM_DoNextInstance
	.type	SM_DoNextInstance, %function
SM_DoNextInstance:
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
	ldr	r8, .L1339
	mov	r3, r0, asl #2
	mov	r6, r0
	add	r2, r8, r3
	str	r1, [fp, #-52]
	ldr	r7, [r2, #324]
	cmp	r7, #0
	beq	.L1321
	cmp	r7, #1
	beq	.L1322
.L1331:
	mvn	r0, #2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1321:
	rsb	r3, r3, r0, lsl #6
	ldr	r9, .L1339+4
	add	r3, r8, r3
	str	r7, [fp, #-48]
	mov	r5, #32
	ldr	r4, [r3, #308]
	b	.L1330
.L1324:
	subs	r5, r5, #1
	beq	.L1331
.L1330:
	add	r3, r4, #1
	mov	r1, r6
	mov	r4, r3, asr #31
	mov	r4, r4, lsr #27
	add	r3, r3, r4
	and	r3, r3, #31
	rsb	r4, r4, r3
	mov	r0, r4
	bl	SCDDRV_CanNotSelectInst
	cmp	r0, #0
	bne	.L1324
	add	r3, r8, r4, lsl #3
	ldr	r2, [r9]
	ldr	r7, [r3, #8]
	blx	r2
	add	r10, r7, #262144
	ldr	r1, [r10, #272]
	subs	r1, r0, r1
	bmi	.L1336
	ldrsh	ip, [r7, #2]
	cmp	ip, #1
	beq	.L1337
.L1326:
	str	r0, [r10, #272]
	ldrsb	r1, [r7]
	cmp	r1, #1
	ldrneb	r3, [fp, #-48]	@ zero_extendqisi2
	strneb	r3, [r7, #1]
	beq	.L1338
.L1329:
	mov	r1, r6
	mov	r0, r7
	bl	CutStreamWithSCD
	cmn	r0, #6
	movne	r1, #0
	moveq	r1, #1
	cmp	r0, #0
	strb	r1, [r7]
	bne	.L1324
	ldr	r2, [fp, #-52]
	mov	r3, #1
	str	r0, [fp, #-48]
	mov	r1, r3
	ldr	r0, .L1339+8
	movw	lr, #4613
	str	r4, [r2]
	str	r3, [r10, #220]
	add	r2, r0, r4, lsl #2
	ldr	r3, .L1339+12
	mov	r0, r4
	str	lr, [sp]
	bl	RecordPOS
	ldr	ip, [fp, #-48]
	mov	r0, ip
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1337:
	cmp	r1, #500
	bcc	.L1324
	b	.L1326
.L1336:
	str	r0, [r10, #272]
	ldrsh	r1, [r7, #2]
	cmp	r1, #1
	bne	.L1326
	b	.L1324
.L1338:
	mov	r0, r7
	bl	SCDDRV_ProcessSegFull
	b	.L1329
.L1322:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r2, #324]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1340:
	.align	2
.L1339:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+468
	.word	.LANCHOR3+468
	UNWIND(.fnend)
	.size	SM_DoNextInstance, .-SM_DoNextInstance
	.align	2
	.type	SCDDRV_ActivateSCD.part.12, %function
SCDDRV_ActivateSCD.part.12:
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
	bl	SM_DoNextInstance
	cmp	r0, #0
	bne	.L1341
	mov	r0, r4, asl #6
	ldr	r3, .L1343
	sub	r0, r0, r4, asl #2
	ldr	r1, [fp, #-24]
	ldr	r2, .L1343+4
	add	r0, r3, r0
	mov	r3, #1
	add	r4, r0, #312
	str	r1, [r0, #308]
	str	r3, [r0, #312]
	ldr	r3, [r2]
	blx	r3
	movw	r3, #4891
	ldr	r2, .L1343+8
	ldr	r1, .L1343+12
	str	r0, [r4, #4]
	mov	r0, #26
	bl	dprint_vfmw
.L1341:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L1344:
	.align	2
.L1343:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3+488
	.word	.LC65
	UNWIND(.fnend)
	.size	SCDDRV_ActivateSCD.part.12, .-SCDDRV_ActivateSCD.part.12
	.align	2
	.global	SCDDRV_RecordGlobalState
	.type	SCDDRV_RecordGlobalState, %function
SCDDRV_RecordGlobalState:
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
	ldr	r3, .L1351
	mov	r4, r0
	mov	r4, r4, asl #6
	ldr	r3, [r3]
	blx	r3
	ldr	r3, .L1351+4
	add	ip, r3, r4
	mov	r2, r0
	ldr	r0, [ip, #48]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, [ip, #44]
	add	r4, r3, r4
	mov	r5, #0
	add	lr, r1, #49920
	str	r5, [r4, #48]
	add	lr, lr, #80
	cmp	r0, lr
	strhi	r0, [ip, #44]
	movhi	r1, r0
	rsb	r1, r1, r2
	ldrls	lr, [ip, #52]
	movhi	lr, #0
	cmp	r1, #1000
	rsb	r2, r0, r2
	add	r2, r2, lr
	str	r2, [r4, #52]
	ldmccfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, #1000
	mul	r0, r0, r2
	bl	__aeabi_uidiv
	str	r5, [r4, #44]
	str	r0, [r4, #56]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1352:
	.align	2
.L1351:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_VfmwGlobalStat
	UNWIND(.fnend)
	.size	SCDDRV_RecordGlobalState, .-SCDDRV_RecordGlobalState
	.align	2
	.global	SCDDRV_MoveRawByOmxPath
	.type	SCDDRV_MoveRawByOmxPath, %function
SCDDRV_MoveRawByOmxPath:
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
	ldr	r3, .L1363
	add	r0, r3, r0, lsl #3
	ldr	r4, [r0, #8]
	ldr	r0, [r4, #52]
	cmp	r0, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	adds	r5, r4, #72
	beq	.L1356
	add	r2, r4, #98304
	ldr	r3, [r2, #76]
	ldr	r2, [r2, #72]
	subs	r3, r3, r2
	addmi	r3, r3, #1024
.L1359:
	ldrsb	r5, [r4, #2]
	cmp	r5, #1
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, [r4, #56]
	cmp	r2, r3
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r4
	bl	SM_MoveRawData
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r5
	ldr	r1, .L1363+4
	bl	dprint_vfmw
	add	r4, r4, #262144
	ldr	r0, [r4, #204]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SM_Reset
.L1356:
	ldr	r1, .L1363+8
	bl	dprint_vfmw
	mov	r3, r5
	b	.L1359
.L1364:
	.align	2
.L1363:
	.word	.LANCHOR0
	.word	.LC66
	.word	.LC67
	UNWIND(.fnend)
	.size	SCDDRV_MoveRawByOmxPath, .-SCDDRV_MoveRawByOmxPath
	.align	2
	.global	SM_SCDIntServeProc
	.type	SM_SCDIntServeProc, %function
SM_SCDIntServeProc:
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
	ldr	r6, .L1382
	ldr	r4, .L1382+4
	mov	r7, r0, asl #2
	add	r8, r6, r7
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	ldr	r0, [r8, #4]
	add	r0, r0, #2112
	bl	MEM_ReadPhyWord
	tst	r0, #1
	bne	.L1378
.L1366:
	ldr	r3, .L1382+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1371
	mov	r1, r5
	mov	r0, #0
	bl	VDH_Notify_ModuleIdle
.L1371:
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1378:
	ldr	r0, [r8, #4]
	mov	r9, r5, asl #6
	rsb	r8, r7, r9
	mov	r1, #1
	add	r8, r6, r8
	add	r0, r0, #2080
	add	r0, r0, #4
	bl	MEM_WritePhyWord
	ldr	r10, [r8, #308]
	ldr	r3, [r8, #304]
	add	r2, r6, r10, lsl #3
	ldr	ip, [r2, #8]
	cmp	ip, #0
	cmpne	r3, #0
	beq	.L1379
	ldr	r3, .L1382+12
	movw	r2, #4771
	mov	r1, #2
	str	r2, [sp]
	mov	r0, r10
	add	r2, r6, #596
	str	ip, [fp, #-56]
	bl	RecordPOS
	mov	r0, r5
	bl	SCDDRV_RecordGlobalState
	ldr	r3, [r8, #312]
	ldr	ip, [fp, #-56]
	cmp	r3, #1
	beq	.L1380
.L1368:
	ldr	r3, [r4, #128]
	mov	r0, #1
	blx	r3
	ldr	r3, [r4, #128]
	mov	r0, #0
	blx	r3
	b	.L1366
.L1379:
	mov	r2, #0
	ldr	r3, [r4, #128]
	str	r2, [r8, #312]
	mov	r0, #1
	blx	r3
	b	.L1366
.L1380:
	add	r8, ip, #262144
	ldr	r3, [r8, #220]
	cmp	r3, #1
	beq	.L1381
.L1369:
	mov	r10, #0
	sub	r1, fp, #48
	str	r10, [r8, #212]
	mov	r0, r5
	bl	SM_DoNextInstance
	rsb	r7, r7, r9
	cmp	r0, r10
	bne	.L1370
	ldr	r1, [fp, #-48]
	add	r6, r6, r7
	mov	r2, #1
	ldr	r3, [r4]
	str	r2, [r6, #312]
	str	r1, [r6, #308]
	blx	r3
	str	r0, [r6, #316]
	b	.L1368
.L1370:
	add	r6, r6, r7
	ldr	r3, [r4, #128]
	mov	r0, #1
	str	r10, [r6, #312]
	blx	r3
	b	.L1368
.L1381:
	mov	r0, ip
	mov	r1, r5
	bl	ProcessScdReturn
	mov	r0, r10
	bl	SCDDRV_MoveRawByOmxPath
	b	.L1369
.L1383:
	.align	2
.L1382:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HalDisable
	.word	.LANCHOR3+508
	UNWIND(.fnend)
	.size	SM_SCDIntServeProc, .-SM_SCDIntServeProc
	.align	2
	.global	SCDDRV_CheckDevice
	.type	SCDDRV_CheckDevice, %function
SCDDRV_CheckDevice:
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
	subs	r6, r0, #0
	bne	.L1392
	ldr	r4, .L1397
	movw	r3, #4824
	str	r6, [sp]
	mov	r0, #26
	ldr	r2, .L1397+4
	ldr	ip, [r4, #312]
	ldr	r1, .L1397+8
	str	ip, [sp, #4]
	bl	dprint_vfmw
	ldr	r5, [r4, #312]
	cmp	r5, #0
	beq	.L1396
	ldr	r7, .L1397+12
	movw	r3, #4834
	ldr	r2, .L1397+4
	mov	r0, #26
	ldr	r1, .L1397+8
	str	r5, [sp, #4]
	str	r6, [sp]
	bl	dprint_vfmw
	ldr	r3, [r7]
	blx	r3
	ldr	r3, [r4, #316]
	cmp	r0, r3
	strcc	r0, [r4, #316]
	bcc	.L1388
	rsb	r0, r3, r0
	cmp	r0, #2000
	bls	.L1388
	ldr	r2, [r4, #308]
	mov	r3, r6
	str	r0, [sp]
	mov	r0, #1
	ldr	r1, .L1397+16
	bl	dprint_vfmw
	ldr	r3, .L1397+20
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1389
	mov	r1, r6
	mov	r0, r6
	bl	VDH_Reset_Module
.L1390:
	mov	r5, #0
	ldr	r3, [r7, #128]
	str	r5, [r4, #312]
	mov	r0, #1
	blx	r3
	ldr	r0, [r4, #308]
	add	r4, r4, r0, lsl #3
	ldr	r3, [r4, #8]
	cmp	r3, r5
	addne	r3, r3, #262144
	strne	r5, [r3, #212]
	mov	r5, #0
	bl	DeleteLastSendRaw
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1388:
	mov	r2, #0
	movw	r3, #4871
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1397+4
	mov	r5, #1
	ldr	r1, .L1397+24
	bl	dprint_vfmw
.L1385:
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1396:
	str	r5, [sp]
	movw	r3, #4828
	ldr	r2, .L1397+4
	mov	r0, #26
	ldr	r1, .L1397+28
	bl	dprint_vfmw
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1389:
	mov	r0, r6
	bl	ResetSCD
	b	.L1390
.L1392:
	mvn	r5, #0
	b	.L1385
.L1398:
	.align	2
.L1397:
	.word	.LANCHOR0
	.word	.LANCHOR3+528
	.word	.LC68
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC70
	.word	g_HalDisable
	.word	.LC71
	.word	.LC69
	UNWIND(.fnend)
	.size	SCDDRV_CheckDevice, .-SCDDRV_CheckDevice
	.align	2
	.global	SCDDRV_ActivateSCD
	.type	SCDDRV_ActivateSCD, %function
SCDDRV_ActivateSCD:
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
	cmp	r0, #0
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SCDDRV_ActivateSCD.part.12
	UNWIND(.fnend)
	.size	SCDDRV_ActivateSCD, .-SCDDRV_ActivateSCD
	.align	2
	.global	SM_Wakeup
	.type	SM_Wakeup, %function
SM_Wakeup:
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
	ldr	r5, .L1412
	mov	r4, #0
	b	.L1403
.L1402:
	add	r4, r4, #1
	cmp	r4, #32
	beq	.L1411
.L1403:
	ldr	r3, [r5, r4, asl #3]
	cmp	r3, #0
	add	r2, r3, #262144
	beq	.L1402
	ldr	r3, [r2, #220]
	cmp	r3, #1
	bne	.L1402
	mov	r0, r4
	add	r4, r4, #1
	bl	FillRawData
	cmp	r4, #32
	bne	.L1403
.L1411:
	mov	r2, #1
	mov	r3, #0
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1412+4
	ldr	r1, .L1412+8
	bl	dprint_vfmw
	mov	r0, #0
	bl	SCDDRV_CheckDevice
	subs	r4, r0, #0
	beq	.L1404
	mov	r2, #0
	movw	r3, #4951
	str	r2, [sp]
	mov	r0, #26
	ldr	r2, .L1412+4
	ldr	r1, .L1412+12
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1404:
	str	r4, [sp]
	movw	r3, #4946
	ldr	r2, .L1412+4
	mov	r0, #26
	ldr	r1, .L1412+16
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SCDDRV_ActivateSCD.part.12
.L1413:
	.align	2
.L1412:
	.word	.LANCHOR0+8
	.word	.LANCHOR3+548
	.word	.LC72
	.word	.LC73
	.word	.LC74
	UNWIND(.fnend)
	.size	SM_Wakeup, .-SM_Wakeup
	.global	g_pScdDrvParamBase
	.global	s_ScdRegResetOKPhyAddr
	.global	s_ScdRegResetPhyAddr
	.global	s_ScdRegPhyBaseAddr
	.global	g_ScdDrvParam
	.global	s_SmIIS
	.global	ForceRelease
	.global	g_hex_flag
	.global	g_hex_len
	.global	g_hex_base_addr
	.global	g_hex_base_vir_addr
	.section	.rodata
	.align	2
.LANCHOR3 = . + 0
	.type	__func__.52820, %object
	.size	__func__.52820, 19
__func__.52820:
	.ascii	"SCDDRV_LoadDspCode\000"
	.space	1
	.type	__func__.52892, %object
	.size	__func__.52892, 16
__func__.52892:
	.ascii	"DeleteRawPacket\000"
	.type	__FUNCTION__.53002, %object
	.size	__FUNCTION__.53002, 17
__FUNCTION__.53002:
	.ascii	"ReleaseStreamSeg\000"
	.space	3
	.type	__func__.53066, %object
	.size	__func__.53066, 14
__func__.53066:
	.ascii	"SM_OpenSCDDrv\000"
	.space	2
	.type	__func__.53150, %object
	.size	__func__.53150, 16
__func__.53150:
	.ascii	"SM_CopyRawToSeg\000"
	.type	__func__.53481, %object
	.size	__func__.53481, 16
__func__.53481:
	.ascii	"GetMeg4ModeFlag\000"
.LC0:
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-70
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-70
	.byte	0
	.byte	0
	.byte	0
	.byte	0
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
	.byte	0
	.byte	0
	.byte	1
	.byte	-1
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.53555, %object
	.size	__func__.53555, 17
__func__.53555:
	.ascii	"FillEopRawStream\000"
	.space	3
.LC1:
	.byte	0
	.byte	0
	.byte	1
	.byte	11
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-2
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	-73
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	98
	.byte	0
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	__func__.53583, %object
	.size	__func__.53583, 17
__func__.53583:
	.ascii	"FillEosRawStream\000"
	.space	3
	.type	__func__.53608, %object
	.size	__func__.53608, 17
__func__.53608:
	.ascii	"FillVC1ExtraData\000"
	.space	3
	.type	__func__.53613, %object
	.size	__func__.53613, 19
__func__.53613:
	.ascii	"FillDIVX3ExtraData\000"
	.space	1
	.type	__func__.53618, %object
	.size	__func__.53618, 19
__func__.53618:
	.ascii	"FillREAL8ExtraData\000"
	.space	1
	.type	__func__.53626, %object
	.size	__func__.53626, 14
__func__.53626:
	.ascii	"FillExtraData\000"
	.space	2
	.type	__func__.52906, %object
	.size	__func__.52906, 24
__func__.52906:
	.ascii	"DeleteRawPacketInBuffer\000"
	.type	__FUNCTION__.53043, %object
	.size	__FUNCTION__.53043, 9
__FUNCTION__.53043:
	.ascii	"SM_Reset\000"
	.space	3
	.type	__FUNCTION__.53545, %object
	.size	__FUNCTION__.53545, 12
__FUNCTION__.53545:
	.ascii	"FillRawData\000"
	.type	__FUNCTION__.53739, %object
	.size	__FUNCTION__.53739, 18
__FUNCTION__.53739:
	.ascii	"SM_DoNextInstance\000"
	.space	2
	.type	__func__.53776, %object
	.size	__func__.53776, 19
__func__.53776:
	.ascii	"SCDDRV_ActivateSCD\000"
	.space	1
	.type	__FUNCTION__.53763, %object
	.size	__FUNCTION__.53763, 19
__FUNCTION__.53763:
	.ascii	"SM_SCDIntServeProc\000"
	.space	1
	.type	__func__.53770, %object
	.size	__func__.53770, 19
__func__.53770:
	.ascii	"SCDDRV_CheckDevice\000"
	.space	1
	.type	__func__.53785, %object
	.size	__func__.53785, 10
__func__.53785:
	.ascii	"SM_Wakeup\000"
	.data
	.align	2
.LANCHOR1 = . + 0
.LANCHOR2 = . + 16368
	.type	g_avsp_firmware, %object
	.size	g_avsp_firmware, 17920
g_avsp_firmware:
	.word	0
	.word	16283648
	.word	16349954
	.word	9468936
	.word	-252085482
	.word	9468688
	.word	9468692
	.word	16284426
	.word	9468680
	.word	18807566
	.word	-258442240
	.word	10517258
	.word	18807566
	.word	-258442239
	.word	10517258
	.word	18807566
	.word	-258442238
	.word	10517258
	.word	18807566
	.word	-258442237
	.word	10517258
	.word	18807566
	.word	-258442236
	.word	10517258
	.word	18807566
	.word	-258442235
	.word	10517258
	.word	18807566
	.word	-258442234
	.word	10517258
	.word	18807566
	.word	-258442233
	.word	10517258
	.word	-251200754
	.word	10517258
	.word	17758990
	.word	33128448
	.word	24738824
	.word	-1879048192
	.word	16349954
	.word	0
	.word	18512896
	.word	33390592
	.word	24738817
	.word	-250447311
	.word	9468672
	.word	17988136
	.word	-795837688
	.word	12090128
	.word	18807566
	.word	24967950
	.word	-249398743
	.word	33259520
	.word	554859056
	.word	-258966784
	.word	19561007
	.word	-235307008
	.word	-1063027960
	.word	16349968
	.word	0
	.word	11041536
	.word	0
	.word	1073741824
	.word	33259520
	.word	554859057
	.word	9468672
	.word	0
	.word	-1342177280
	.word	0
	.word	33128448
	.word	-1592624595
	.word	-258966776
	.word	12090128
	.word	0
	.word	17988137
	.word	9468680
	.word	16349968
	.word	17988143
	.word	-258966784
	.word	0
	.word	33521664
	.word	-1879048192
	.word	0
	.word	-1610612736
	.word	-248874449
	.word	9468688
	.word	9468692
	.word	11041536
	.word	0
	.word	0
	.word	0
	.word	286948352
	.word	9467906
	.word	33128448
	.word	-1320519377
	.word	1630697896
	.word	33128448
	.word	-786269183
	.word	17988140
	.word	9468680
	.word	12090128
	.word	21953294
	.word	19400197
	.word	33128448
	.word	-1059883006
	.word	33062912
	.word	-1073741824
	.word	1358526466
	.word	-1342177280
	.word	-1879048192
	.word	17988009
	.word	1620081416
	.word	1354267408
	.word	21953294
	.word	19400216
	.word	33128448
	.word	-2133624830
	.word	33062912
	.word	-2147483648
	.word	-2131134462
	.word	19400222
	.word	33128448
	.word	0
	.word	19036462
	.word	33390592
	.word	33398784
	.word	1092253959
	.word	33128448
	.word	1362626056
	.word	17988013
	.word	9468680
	.word	12090128
	.word	21429006
	.word	1092253999
	.word	33128448
	.word	-250447444
	.word	9468680
	.word	12090128
	.word	24673282
	.word	-250447445
	.word	814775048
	.word	12090128
	.word	0
	.word	-785744896
	.word	556956675
	.word	33128448
	.word	-235298816
	.word	-235290624
	.word	25000964
	.word	-2147483648
	.word	33128448
	.word	-1050147328
	.word	18351619
	.word	18875907
	.word	554858927
	.word	33128448
	.word	-235290624
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	-1845493760
	.word	23594500
	.word	18875906
	.word	554858927
	.word	33128448
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	872415232
	.word	-2147483648
	.word	18351646
	.word	24926480
	.word	-2124785392
	.word	-2147483648
	.word	0
	.word	19028272
	.word	20601264
	.word	554858927
	.word	10517258
	.word	546339592
	.word	0
	.word	-268435456
	.word	-1592100601
	.word	12090128
	.word	33128448
	.word	1634207232
	.word	18351619
	.word	18875907
	.word	554859050
	.word	33128448
	.word	-235290624
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	17988139
	.word	9468680
	.word	0
	.word	-771751936
	.word	23594500
	.word	18875906
	.word	554859050
	.word	33128448
	.word	-1073741824
	.word	10517258
	.word	9468680
	.word	0
	.word	17988139
	.word	9468680
	.word	0
	.word	-1543503872
	.word	1073741824
	.word	18351646
	.word	24926480
	.word	1096440080
	.word	-2147483648
	.word	17988138
	.word	19028272
	.word	20601264
	.word	536870912
	.word	10517258
	.word	9468680
	.word	17988139
	.word	9468680
	.word	0
	.word	-1879048192
	.word	1366850566
	.word	33398784
	.word	17987886
	.word	33398784
	.word	33398784
	.word	-518882770
	.word	9468680
	.word	16349968
	.word	0
	.word	-536870912
	.word	1903720450
	.word	1092093440
	.word	17988010
	.word	9468680
	.word	12090128
	.word	18807566
	.word	33259520
	.word	293436421
	.word	25000967
	.word	-1055753810
	.word	9468680
	.word	12090128
	.word	0
	.word	33460224
	.word	33460224
	.word	33198080
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1011712
	.word	0
	.word	0
	.word	1013760
	.word	18687
	.word	0
	.word	0
	.word	18688
	.word	0
	.word	0
	.word	103084
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	0
	.word	102700
	.word	0
	.word	102700
	.word	0
	.word	18432
	.word	916608
	.word	0
	.word	1027074
	.word	0
	.word	1013760
	.word	18432
	.word	916620
	.word	908352
	.word	1027075
	.word	0
	.word	1013760
	.word	105964
	.word	0
	.word	1013760
	.word	0
	.word	1031171
	.word	916484
	.word	1031173
	.word	98348
	.word	1013760
	.word	904428
	.word	1027075
	.word	0
	.word	1013760
	.word	0
	.word	1013760
	.word	1027075
	.word	916484
	.word	1031173
	.word	0
	.word	1013760
	.word	1035269
	.word	1031168
	.word	916712
	.word	1031172
	.word	23807
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	98348
	.word	1013760
	.word	916484
	.word	1031170
	.word	1007616
	.word	1018885
	.word	18687
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	1018880
	.word	1007616
	.word	18432
	.word	20480
	.word	916688
	.word	1031175
	.word	23552
	.word	916696
	.word	1027078
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	108112
	.word	917096
	.word	1031174
	.word	917076
	.word	1027078
	.word	25600
	.word	1018887
	.word	23553
	.word	908752
	.word	19456
	.word	22528
	.word	1013760
	.word	108112
	.word	917096
	.word	1031175
	.word	917076
	.word	1027079
	.word	25601
	.word	108108
	.word	917076
	.word	222628
	.word	19456
	.word	917068
	.word	917072
	.word	1027086
	.word	917068
	.word	1027080
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	23552
	.word	917068
	.word	1027080
	.word	0
	.word	0
	.word	1013760
	.word	1027080
	.word	23552
	.word	0
	.word	1013760
	.word	19457
	.word	20480
	.word	916756
	.word	916908
	.word	916844
	.word	0
	.word	1027083
	.word	917068
	.word	1027082
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	916844
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	989193
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	989194
	.word	1018891
	.word	113316
	.word	112296
	.word	1031179
	.word	310092
	.word	113572
	.word	0
	.word	0
	.word	69916
	.word	0
	.word	23552
	.word	1013760
	.word	988170
	.word	23553
	.word	0
	.word	917068
	.word	1027085
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	916844
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	1013760
	.word	989195
	.word	105120
	.word	595340
	.word	105112
	.word	916816
	.word	185196
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	1013760
	.word	989196
	.word	1018894
	.word	113316
	.word	112296
	.word	1031182
	.word	310092
	.word	113572
	.word	0
	.word	0
	.word	69916
	.word	0
	.word	0
	.word	1013760
	.word	0
	.word	1013760
	.word	988173
	.word	19456
	.word	917068
	.word	19456
	.word	917068
	.word	917064
	.word	1027086
	.word	0
	.word	0
	.word	1013760
	.word	1018894
	.word	23552
	.word	1027087
	.word	0
	.word	0
	.word	0
	.word	1013760
	.word	916712
	.word	23556
	.word	0
	.word	1027087
	.word	0
	.word	0
	.word	1013760
	.word	999424
	.word	999424
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65537
	.word	1900544
	.word	513
	.word	1537
	.word	352782197
	.word	352782197
	.word	65536
	.word	131074
	.word	4
	.word	0
	.word	65537
	.word	131073
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	131074
	.word	2
	.word	327686
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	131072
	.word	1
	.word	131072
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65538
	.word	1
	.word	0
	.word	0
	.word	131072
	.word	131073
	.word	131073
	.word	1
	.word	131072
	.word	1
	.word	131072
	.word	131073
	.word	131073
	.word	1
	.word	0
	.word	0
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	524289
	.word	4196352
	.word	1048608
	.word	8396800
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65536
	.word	0
	.word	65536
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65536
	.word	65537
	.word	65537
	.word	1
	.word	65536
	.word	1
	.word	65536
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	131073
	.word	33554688
	.word	1073741828
	.word	132096
	.word	65540
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	g_h264_firmware, %object
	.size	g_h264_firmware, 17920
g_h264_firmware:
	.word	0
	.word	823064910
	.word	8419328
	.word	9239400
	.word	16349184
	.word	285670144
	.word	33128448
	.word	-1879048192
	.word	1342177280
	.word	0
	.word	8420384
	.word	8420386
	.word	8420387
	.word	8420388
	.word	8420389
	.word	8420390
	.word	8420391
	.word	8420393
	.word	8420394
	.word	8420395
	.word	8420392
	.word	8420396
	.word	8715424
	.word	8715428
	.word	8682668
	.word	8682542
	.word	8682671
	.word	268435456
	.word	8420385
	.word	-1342177280
	.word	24673452
	.word	-268435456
	.word	24673326
	.word	1610612736
	.word	17234198
	.word	0
	.word	-2130020076
	.word	33259520
	.word	1610612736
	.word	1091206148
	.word	33259520
	.word	1610612736
	.word	17234274
	.word	822770726
	.word	33259520
	.word	1610612736
	.word	33325056
	.word	1610612736
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-2147483648
	.word	268435456
	.word	16349184
	.word	277150492
	.word	9239324
	.word	805306368
	.word	8419328
	.word	0
	.word	805306368
	.word	8419328
	.word	17234796
	.word	17758530
	.word	0
	.word	-268435456
	.word	1342177280
	.word	-235044864
	.word	1628371250
	.word	0
	.word	17464358
	.word	0
	.word	-235044864
	.word	1610612736
	.word	0
	.word	536870912
	.word	1610612736
	.word	24673326
	.word	-536870912
	.word	17234200
	.word	0
	.word	-2130020076
	.word	33259520
	.word	1610612736
	.word	1091206148
	.word	33259520
	.word	1610612736
	.word	17234274
	.word	822770726
	.word	33259520
	.word	1610612736
	.word	33325056
	.word	1610612736
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	1879048192
	.word	0
	.word	16349184
	.word	277150492
	.word	9239324
	.word	805306368
	.word	8419328
	.word	0
	.word	805306368
	.word	8419328
	.word	17234796
	.word	17758530
	.word	0
	.word	-268435456
	.word	1342177280
	.word	-235044864
	.word	1628371250
	.word	0
	.word	17464358
	.word	0
	.word	-235044864
	.word	-536870912
	.word	268435456
	.word	536870912
	.word	1610612736
	.word	24673455
	.word	1610612736
	.word	24935457
	.word	1610612736
	.word	24706208
	.word	1610612736
	.word	0
	.word	536870912
	.word	16349184
	.word	17758488
	.word	8715034
	.word	9239322
	.word	0
	.word	17234228
	.word	17758984
	.word	17758980
	.word	268435456
	.word	0
	.word	-234913792
	.word	1342177280
	.word	21428994
	.word	23525654
	.word	21952790
	.word	20904718
	.word	17758520
	.word	0
	.word	17234288
	.word	18282794
	.word	18807142
	.word	-2147483648
	.word	19331382
	.word	17235072
	.word	18283652
	.word	0
	.word	8715418
	.word	0
	.word	9763996
	.word	33325056
	.word	-1610612736
	.word	18282774
	.word	824113430
	.word	9239710
	.word	17235098
	.word	1610612736
	.word	16349184
	.word	9239710
	.word	17235098
	.word	17758988
	.word	0
	.word	805306368
	.word	17235098
	.word	18283278
	.word	18807964
	.word	0
	.word	805306368
	.word	18283278
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33128448
	.word	-1879048192
	.word	33128448
	.word	-1861813906
	.word	33128448
	.word	822540652
	.word	33128448
	.word	-536870912
	.word	0
	.word	-1073741824
	.word	24673280
	.word	805306368
	.word	16349184
	.word	17234704
	.word	19037185
	.word	-2129725162
	.word	18282848
	.word	18807144
	.word	-2147483648
	.word	805306368
	.word	805306368
	.word	24673296
	.word	805306368
	.word	16349184
	.word	17234706
	.word	19037201
	.word	-2129725088
	.word	18282848
	.word	18807144
	.word	-2147483648
	.word	805306368
	.word	17235098
	.word	17759388
	.word	18283678
	.word	8715424
	.word	9239714
	.word	9764004
	.word	14711981
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	21952864
	.word	-2147483648
	.word	16349184
	.word	17234228
	.word	17758984
	.word	0
	.word	17758980
	.word	268435456
	.word	33062912
	.word	-2147483648
	.word	-235175936
	.word	0
	.word	-235110400
	.word	-2147483648
	.word	16349184
	.word	17234288
	.word	17758978
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	16349184
	.word	20904718
	.word	17758520
	.word	0
	.word	19331382
	.word	17235072
	.word	0
	.word	0
	.word	8715420
	.word	16349184
	.word	17235100
	.word	17758982
	.word	0
	.word	17758988
	.word	33259520
	.word	-805306368
	.word	17235100
	.word	17758982
	.word	805306368
	.word	18282774
	.word	18807062
	.word	1879048192
	.word	17235100
	.word	17758988
	.word	0
	.word	0
	.word	805306368
	.word	17235100
	.word	18283278
	.word	18807558
	.word	0
	.word	805306368
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33128448
	.word	1073741824
	.word	33128448
	.word	1073741824
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420524
	.word	24706208
	.word	-2147483648
	.word	17759396
	.word	33521664
	.word	-536870912
	.word	17235104
	.word	17759396
	.word	18282774
	.word	18807062
	.word	-1879048192
	.word	16349184
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	17235104
	.word	18283278
	.word	18807970
	.word	0
	.word	805306368
	.word	18283278
	.word	-1073741824
	.word	268435456
	.word	17988648
	.word	286194026
	.word	33390592
	.word	0
	.word	536870912
	.word	33390592
	.word	-2147483648
	.word	268435456
	.word	1879048192
	.word	268435456
	.word	268435456
	.word	8420524
	.word	0
	.word	0
	.word	8420398
	.word	0
	.word	16349184
	.word	17234708
	.word	8715430
	.word	17758498
	.word	0
	.word	8715432
	.word	17758488
	.word	18807562
	.word	1073741824
	.word	0
	.word	805306368
	.word	8419328
	.word	16940070
	.word	17758514
	.word	0
	.word	-250676968
	.word	-268435456
	.word	1342177280
	.word	17758488
	.word	-268435456
	.word	1610612736
	.word	0
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715104
	.word	268435456
	.word	-536870912
	.word	8715106
	.word	16349184
	.word	17234708
	.word	805306368
	.word	10516480
	.word	8715108
	.word	17235088
	.word	8715110
	.word	17234214
	.word	8715120
	.word	17234244
	.word	8715118
	.word	16940060
	.word	-268435456
	.word	-805306368
	.word	17464339
	.word	-268435456
	.word	-1073741824
	.word	17464340
	.word	-268435456
	.word	-1323894504
	.word	17464322
	.word	0
	.word	-268435456
	.word	-1610612736
	.word	17464324
	.word	-268435456
	.word	268435456
	.word	24673285
	.word	-2147483648
	.word	17758486
	.word	805306368
	.word	24673316
	.word	-512197595
	.word	-1055983330
	.word	805306368
	.word	17758488
	.word	805306368
	.word	24673286
	.word	286193958
	.word	805306368
	.word	17758486
	.word	805306368
	.word	-536870912
	.word	17464323
	.word	0
	.word	8715328
	.word	17235110
	.word	18282776
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	17234710
	.word	8715330
	.word	1090976934
	.word	0
	.word	286718232
	.word	18807144
	.word	-2147483648
	.word	17235112
	.word	8715332
	.word	1090976934
	.word	0
	.word	555153688
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	17234712
	.word	8715334
	.word	-2130248538
	.word	0
	.word	823589144
	.word	18807144
	.word	-2147483648
	.word	17235090
	.word	8715336
	.word	16940202
	.word	8715338
	.word	17235092
	.word	33259520
	.word	-1610612736
	.word	0
	.word	8715340
	.word	17235094
	.word	8715342
	.word	16940203
	.word	8715344
	.word	17235096
	.word	33259520
	.word	805306368
	.word	0
	.word	8715346
	.word	-1593672675
	.word	17464365
	.word	0
	.word	-268435456
	.word	-1342177280
	.word	822770723
	.word	0
	.word	-268435456
	.word	-1879048192
	.word	17464353
	.word	0
	.word	8715348
	.word	-251495381
	.word	0
	.word	-268435456
	.word	1628077098
	.word	0
	.word	-268435456
	.word	268435456
	.word	17464327
	.word	-536870912
	.word	17464354
	.word	18807064
	.word	33128448
	.word	0
	.word	33128448
	.word	536870912
	.word	1091500310
	.word	268435456
	.word	1073741824
	.word	536870912
	.word	1073741824
	.word	0
	.word	8715350
	.word	17235112
	.word	1092024672
	.word	18807144
	.word	-2147483648
	.word	16940070
	.word	17758514
	.word	0
	.word	-268435456
	.word	8715352
	.word	17235112
	.word	0
	.word	-1055459048
	.word	18807144
	.word	-2147483648
	.word	0
	.word	8715354
	.word	-1056506712
	.word	0
	.word	-787023592
	.word	18807144
	.word	-2147483648
	.word	0
	.word	554173952
	.word	17827336
	.word	1879048192
	.word	-251200684
	.word	0
	.word	8420526
	.word	822609408
	.word	17827352
	.word	1879048192
	.word	-1073741824
	.word	11566081
	.word	-250446847
	.word	33325056
	.word	-805306368
	.word	17988609
	.word	33325056
	.word	-805306368
	.word	20085934
	.word	554203411
	.word	33128448
	.word	0
	.word	33128448
	.word	0
	.word	-2130151150
	.word	33128448
	.word	0
	.word	33128448
	.word	0
	.word	-519538416
	.word	33128448
	.word	0
	.word	33128448
	.word	16808209
	.word	33128448
	.word	0
	.word	-805306368
	.word	1091074311
	.word	33128448
	.word	-1342177280
	.word	33128448
	.word	-1342177280
	.word	-1593280239
	.word	33128448
	.word	-1342177280
	.word	33128448
	.word	-1342177280
	.word	-805306368
	.word	-1073741824
	.word	11566082
	.word	17827329
	.word	0
	.word	0
	.word	33390592
	.word	-805306368
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-805306368
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	0
	.word	33390592
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	268435456
	.word	33390592
	.word	-268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1073741824
	.word	-2128083448
	.word	0
	.word	0
	.word	33128448
	.word	805306368
	.word	-805306368
	.word	18282786
	.word	0
	.word	17758564
	.word	0
	.word	0
	.word	33128448
	.word	1879048192
	.word	0
	.word	286193948
	.word	0
	.word	33062912
	.word	-1073741824
	.word	-1342177280
	.word	-234881024
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-2128083448
	.word	0
	.word	0
	.word	33128448
	.word	536870912
	.word	-805306368
	.word	18282786
	.word	0
	.word	17758564
	.word	0
	.word	0
	.word	33128448
	.word	1610612736
	.word	0
	.word	286193964
	.word	0
	.word	33062912
	.word	-1342177280
	.word	-1610612736
	.word	-536870912
	.word	-268435456
	.word	268435456
	.word	8420354
	.word	-1073741824
	.word	11566088
	.word	-1073741824
	.word	33259520
	.word	1342177280
	.word	-805306368
	.word	-1073741824
	.word	11566089
	.word	0
	.word	33128448
	.word	268435456
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	-805306368
	.word	-805306368
	.word	-1073741824
	.word	11566091
	.word	-1073741824
	.word	33521664
	.word	-805306368
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	17234772
	.word	8420362
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	1879048192
	.word	1879048192
	.word	-1073741824
	.word	11566254
	.word	-268435456
	.word	33259520
	.word	-805306368
	.word	0
	.word	33521664
	.word	-805306368
	.word	16940206
	.word	0
	.word	1879048192
	.word	-1342177280
	.word	-1073741824
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	-1073741824
	.word	11566083
	.word	286193960
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	-1073741824
	.word	11566084
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566085
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	0
	.word	33128448
	.word	1610612736
	.word	-2147483648
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566086
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	286193946
	.word	20085764
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	825392131
	.word	33325056
	.word	-805306368
	.word	0
	.word	0
	.word	8420358
	.word	286193956
	.word	20085764
	.word	33325056
	.word	-805306368
	.word	33062912
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566087
	.word	24673455
	.word	-805306368
	.word	822609409
	.word	17827329
	.word	1879048192
	.word	268435456
	.word	8420352
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420352
	.word	0
	.word	-1073741824
	.word	11566097
	.word	17827583
	.word	33325056
	.word	-1342177280
	.word	33259520
	.word	-1342177280
	.word	-1073741824
	.word	11566098
	.word	17827359
	.word	33325056
	.word	-1342177280
	.word	33259520
	.word	-1342177280
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-2147483648
	.word	268435456
	.word	16349184
	.word	17758992
	.word	19037202
	.word	-2130249450
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935424
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566099
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566101
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	-1073741824
	.word	0
	.word	33390592
	.word	-1342177280
	.word	-1073741824
	.word	11566103
	.word	-268435456
	.word	33259520
	.word	-1342177280
	.word	-1073741824
	.word	11566104
	.word	-268435456
	.word	33259520
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566106
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827330
	.word	1879048192
	.word	20380500
	.word	11566107
	.word	822609408
	.word	17827330
	.word	1879048192
	.word	805306368
	.word	33062912
	.word	-1342177280
	.word	-805306368
	.word	11566109
	.word	-805306368
	.word	-805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566105
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566100
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566102
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	17234198
	.word	8420380
	.word	822541470
	.word	17759062
	.word	0
	.word	33521664
	.word	805306368
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566108
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935452
	.word	805306368
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	33390592
	.word	268435456
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	17235102
	.word	17759062
	.word	33521664
	.word	-536870912
	.word	-268435456
	.word	0
	.word	8420380
	.word	805306368
	.word	268435456
	.word	8420380
	.word	24673455
	.word	-1342177280
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	268435456
	.word	8420368
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420368
	.word	0
	.word	-1073741824
	.word	11566113
	.word	17758528
	.word	33062912
	.word	268435456
	.word	-1073741824
	.word	536870912
	.word	33128448
	.word	1610612736
	.word	1073741824
	.word	33128448
	.word	1610612736
	.word	1879048192
	.word	33128448
	.word	1610612736
	.word	-1879048192
	.word	33128448
	.word	1610612736
	.word	0
	.word	33128448
	.word	-1879048192
	.word	805306368
	.word	33128448
	.word	-1879048192
	.word	1342177280
	.word	33128448
	.word	-1879048192
	.word	-2147483648
	.word	33128448
	.word	-1879048192
	.word	268435456
	.word	33128448
	.word	-1073741824
	.word	1610612736
	.word	33128448
	.word	-1073741824
	.word	268435456
	.word	536870912
	.word	8944674
	.word	-536870912
	.word	0
	.word	8944674
	.word	-536870912
	.word	268435456
	.word	8944674
	.word	-1073741824
	.word	11566112
	.word	-268435456
	.word	33259520
	.word	268435456
	.word	16349184
	.word	286194442
	.word	805306368
	.word	0
	.word	33128448
	.word	-1610612736
	.word	805306368
	.word	16349184
	.word	17758994
	.word	19037216
	.word	-2130249376
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935440
	.word	268435456
	.word	16349184
	.word	17758992
	.word	19037202
	.word	-2130249450
	.word	18282848
	.word	18807142
	.word	-2147483648
	.word	24935424
	.word	268435456
	.word	822609408
	.word	1092254728
	.word	0
	.word	1879048192
	.word	0
	.word	8420388
	.word	8420389
	.word	24673285
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566116
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673316
	.word	1879048192
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566117
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	16940035
	.word	17464324
	.word	-268435456
	.word	-268435456
	.word	-2147483648
	.word	8420390
	.word	24673285
	.word	-1610612736
	.word	24673316
	.word	-1610612736
	.word	554335270
	.word	-2147483648
	.word	8420390
	.word	554335236
	.word	-268435456
	.word	-2147483648
	.word	268435456
	.word	0
	.word	8420356
	.word	285375524
	.word	17464326
	.word	0
	.word	8420391
	.word	1359641640
	.word	33390592
	.word	1342177280
	.word	-1073741824
	.word	17758528
	.word	33259520
	.word	268435456
	.word	17464329
	.word	33390592
	.word	536870912
	.word	822609408
	.word	1092254731
	.word	0
	.word	1879048192
	.word	16940053
	.word	285899812
	.word	0
	.word	33521664
	.word	536870912
	.word	1879048192
	.word	16940041
	.word	285899786
	.word	0
	.word	33521664
	.word	-536870912
	.word	1879048192
	.word	16940053
	.word	285899812
	.word	0
	.word	33521664
	.word	-536870912
	.word	1879048192
	.word	24935446
	.word	1073741824
	.word	-1073741824
	.word	0
	.word	33259520
	.word	268435456
	.word	285899810
	.word	33390592
	.word	-536870912
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	17234772
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	16940055
	.word	17464344
	.word	8420394
	.word	8944683
	.word	554335266
	.word	33128448
	.word	1610612736
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566121
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935465
	.word	1610612736
	.word	-1073741824
	.word	11566122
	.word	285899810
	.word	33390592
	.word	1610612736
	.word	-1073741824
	.word	11566123
	.word	554335266
	.word	33390592
	.word	-1342177280
	.word	0
	.word	8420394
	.word	285899810
	.word	33128448
	.word	0
	.word	0
	.word	8420395
	.word	554335266
	.word	33390592
	.word	1073741824
	.word	1610612736
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935598
	.word	1610612736
	.word	0
	.word	554335274
	.word	0
	.word	-1073741824
	.word	805306368
	.word	33259520
	.word	268435456
	.word	805306368
	.word	33128448
	.word	1610612736
	.word	0
	.word	33128448
	.word	536870912
	.word	268435456
	.word	33128448
	.word	536870912
	.word	536870912
	.word	33128448
	.word	1073741824
	.word	1342177280
	.word	1879048192
	.word	1342177280
	.word	1879048192
	.word	268435456
	.word	285899810
	.word	33390592
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24935598
	.word	-1342177280
	.word	0
	.word	554335275
	.word	0
	.word	-1073741824
	.word	805306368
	.word	33259520
	.word	268435456
	.word	805306368
	.word	33128448
	.word	-1342177280
	.word	0
	.word	33128448
	.word	1879048192
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	-1879048192
	.word	-1610612736
	.word	1879048192
	.word	-1610612736
	.word	1879048192
	.word	1610612736
	.word	17464354
	.word	286948379
	.word	33390592
	.word	293108762
	.word	-2147483648
	.word	1879048192
	.word	17464354
	.word	33390592
	.word	1879048192
	.word	-235044864
	.word	1879048192
	.word	-2147483648
	.word	536870912
	.word	-1073741824
	.word	24673282
	.word	-1073741824
	.word	-1073741824
	.word	17464362
	.word	268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-805306368
	.word	-805306368
	.word	24673282
	.word	-1342177280
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-1342177280
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-268435456
	.word	285899810
	.word	17988635
	.word	33390592
	.word	536870912
	.word	-235044864
	.word	536870912
	.word	17464363
	.word	268435456
	.word	0
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	268435456
	.word	-805306368
	.word	-805306368
	.word	24673282
	.word	268435456
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	268435456
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	-805306368
	.word	1342177280
	.word	24673324
	.word	-536870912
	.word	1359641640
	.word	33390592
	.word	-1342177280
	.word	822609408
	.word	17827330
	.word	1879048192
	.word	-536870912
	.word	554173952
	.word	17827329
	.word	1879048192
	.word	20380500
	.word	11566254
	.word	822609408
	.word	17827329
	.word	1879048192
	.word	24673454
	.word	-536870912
	.word	-1073741824
	.word	11566254
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	536870912
	.word	33128448
	.word	1879048192
	.word	1073741824
	.word	33128448
	.word	1879048192
	.word	1610612736
	.word	33128448
	.word	1879048192
	.word	805306368
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	-1073741824
	.word	-1342177280
	.word	-1073741824
	.word	-1073741824
	.word	16940206
	.word	33259520
	.word	1342177280
	.word	24673299
	.word	-1073741824
	.word	16940066
	.word	33128448
	.word	1879048192
	.word	268435456
	.word	33128448
	.word	1879048192
	.word	-1073741824
	.word	-1073741824
	.word	11566115
	.word	805306368
	.word	33062912
	.word	268435456
	.word	-805306368
	.word	11566125
	.word	24935449
	.word	-1879048192
	.word	-1073741824
	.word	536870912
	.word	33259520
	.word	268435456
	.word	17827329
	.word	33128448
	.word	-1879048192
	.word	-805306368
	.word	-805306368
	.word	24673455
	.word	268435456
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	268435456
	.word	8420398
	.word	0
	.word	822609409
	.word	17827328
	.word	1879048192
	.word	0
	.word	8420398
	.word	0
	.word	1073741824
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	268435456
	.word	8420527
	.word	0
	.word	1073741824
	.word	11565056
	.word	19331386
	.word	20379926
	.word	33390592
	.word	-536870912
	.word	20379926
	.word	11336516
	.word	11860806
	.word	19855676
	.word	0
	.word	805306368
	.word	11336520
	.word	9239370
	.word	9763660
	.word	11860814
	.word	10287952
	.word	-536870912
	.word	20379926
	.word	11336516
	.word	0
	.word	0
	.word	11336518
	.word	19855676
	.word	0
	.word	805306368
	.word	11336520
	.word	9239370
	.word	11860812
	.word	19855676
	.word	0
	.word	805306368
	.word	11336526
	.word	10287952
	.word	268435456
	.word	8715074
	.word	0
	.word	1073741824
	.word	11565056
	.word	823064854
	.word	18282784
	.word	1879048192
	.word	554629398
	.word	18282848
	.word	1879048192
	.word	-251200684
	.word	17758502
	.word	1342177280
	.word	9468968
	.word	9993260
	.word	823064854
	.word	18282848
	.word	1879048192
	.word	0
	.word	0
	.word	33390592
	.word	-1342177280
	.word	16349184
	.word	-2129724670
	.word	18906285
	.word	-2130249360
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	17235074
	.word	17758488
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715394
	.word	16349184
	.word	-2130248958
	.word	18906285
	.word	-2129725072
	.word	18282782
	.word	18807144
	.word	-2147483648
	.word	1879048192
	.word	16349184
	.word	-2129724670
	.word	19331848
	.word	-268435456
	.word	-2130249360
	.word	18282782
	.word	18807142
	.word	-2147483648
	.word	16349184
	.word	17234694
	.word	17759362
	.word	0
	.word	9239686
	.word	17234694
	.word	17759360
	.word	18283276
	.word	33259520
	.word	-536870912
	.word	805306368
	.word	17235072
	.word	17758988
	.word	18283270
	.word	18283278
	.word	0
	.word	9239684
	.word	17235074
	.word	17758488
	.word	-268435456
	.word	-268435456
	.word	268435456
	.word	0
	.word	8715394
	.word	16349184
	.word	-2130248958
	.word	19331848
	.word	-268435456
	.word	-2129725072
	.word	18282794
	.word	18807144
	.word	-2147483648
	.word	16349184
	.word	287767304
	.word	0
	.word	8715016
	.word	0
	.word	536870912
	.word	10516480
	.word	8715042
	.word	277674784
	.word	546634532
	.word	33128448
	.word	1073741824
	.word	33128448
	.word	-2147483648
	.word	33128448
	.word	-1073741824
	.word	-268435456
	.word	268435456
	.word	8715046
	.word	0
	.word	-268435456
	.word	268435456
	.word	8715048
	.word	0
	.word	-268435456
	.word	268435456
	.word	8715050
	.word	0
	.word	0
	.word	1073741824
	.word	11565056
	.word	20380502
	.word	24935443
	.word	-1879048192
	.word	1898379590
	.word	0
	.word	0
	.word	0
	.word	16349184
	.word	0
	.word	33390592
	.word	-1879048192
	.word	17235104
	.word	17759394
	.word	33259520
	.word	1610612736
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	33259520
	.word	1610612736
	.word	9763988
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235104
	.word	19331386
	.word	0
	.word	19855676
	.word	0
	.word	0
	.word	825162046
	.word	0
	.word	0
	.word	805306368
	.word	11336850
	.word	19855662
	.word	0
	.word	11041962
	.word	0
	.word	10288278
	.word	19331388
	.word	18283278
	.word	0
	.word	805306368
	.word	9993387
	.word	17759394
	.word	0
	.word	805306368
	.word	10288280
	.word	1342177280
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235104
	.word	17758988
	.word	0
	.word	805306368
	.word	0
	.word	17234236
	.word	17758990
	.word	0
	.word	805306368
	.word	0
	.word	19855678
	.word	0
	.word	805306368
	.word	10288274
	.word	19855662
	.word	0
	.word	9993386
	.word	17234702
	.word	17759394
	.word	0
	.word	805306368
	.word	0
	.word	10288276
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	-1073741824
	.word	17235104
	.word	17759396
	.word	-1879048192
	.word	17235100
	.word	17758982
	.word	18283276
	.word	33259520
	.word	1342177280
	.word	17235100
	.word	17758988
	.word	0
	.word	805306368
	.word	33259520
	.word	805306368
	.word	9763988
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235100
	.word	19331386
	.word	0
	.word	19855676
	.word	0
	.word	0
	.word	825162046
	.word	0
	.word	0
	.word	805306368
	.word	11336850
	.word	19855662
	.word	0
	.word	11041962
	.word	0
	.word	10288278
	.word	19331388
	.word	18283278
	.word	0
	.word	805306368
	.word	9993387
	.word	17758982
	.word	823590036
	.word	0
	.word	10288280
	.word	1073741824
	.word	19331386
	.word	18283278
	.word	0
	.word	9763984
	.word	17235100
	.word	17758988
	.word	0
	.word	805306368
	.word	0
	.word	17234236
	.word	17758990
	.word	0
	.word	805306368
	.word	0
	.word	19855678
	.word	0
	.word	805306368
	.word	10288274
	.word	19855662
	.word	0
	.word	9993386
	.word	17234694
	.word	17759388
	.word	18283276
	.word	0
	.word	0
	.word	805306368
	.word	0
	.word	10288276
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	-1073741824
	.word	17235100
	.word	17758982
	.word	805306368
	.word	-1879048192
	.word	19331386
	.word	0
	.word	10288272
	.word	19331388
	.word	0
	.word	805306368
	.word	19331374
	.word	0
	.word	11041962
	.word	0
	.word	9239700
	.word	19331390
	.word	0
	.word	805306368
	.word	11336850
	.word	0
	.word	10288278
	.word	9993387
	.word	10288280
	.word	0
	.word	1090520577
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17758538
	.word	20380498
	.word	18807090
	.word	0
	.word	33128448
	.word	-1055983284
	.word	0
	.word	286194514
	.word	-268435456
	.word	-805306368
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	-1879048192
	.word	-1342177280
	.word	268435456
	.word	8420527
	.word	0
	.word	1090520576
	.word	9992192
	.word	-2147483648
	.word	-1610612736
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17234226
	.word	20380498
	.word	0
	.word	286194514
	.word	-268435456
	.word	-805306368
	.word	18282776
	.word	33128448
	.word	1073741824
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	1073741824
	.word	1610612736
	.word	268435456
	.word	8420527
	.word	0
	.word	18875904
	.word	0
	.word	1091044864
	.word	546863104
	.word	17827332
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17234772
	.word	0
	.word	17455440
	.word	16778756
	.word	33390592
	.word	-1342177280
	.word	1091044864
	.word	815298560
	.word	17827332
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	17303041
	.word	17827336
	.word	33325056
	.word	-1879048192
	.word	17303072
	.word	33062912
	.word	268435456
	.word	285738497
	.word	18351620
	.word	-2147483648
	.word	0
	.word	17827352
	.word	33062912
	.word	1073741824
	.word	17303064
	.word	0
	.word	1091044864
	.word	815298560
	.word	17827352
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	536870912
	.word	1091044864
	.word	815298560
	.word	0
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	-536870912
	.word	1091044864
	.word	815298560
	.word	-2147483648
	.word	0
	.word	-2147483648
	.word	-1610612736
	.word	-268435456
	.word	268435456
	.word	0
	.word	17827329
	.word	0
	.word	8715072
	.word	0
	.word	286194520
	.word	-268435456
	.word	-536870912
	.word	18282776
	.word	33128448
	.word	1342177280
	.word	1879048192
	.word	268435456
	.word	8420527
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1011712
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	916484
	.word	1031168
	.word	1018880
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035272
	.word	0
	.word	1031172
	.word	0
	.word	1027080
	.word	0
	.word	1035361
	.word	16391
	.word	916544
	.word	1031176
	.word	16388
	.word	916544
	.word	1031176
	.word	0
	.word	18432
	.word	916544
	.word	1031176
	.word	916552
	.word	1031176
	.word	1035284
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031171
	.word	1018883
	.word	16384
	.word	17408
	.word	0
	.word	16384
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	593924
	.word	103056
	.word	103056
	.word	905516
	.word	1031176
	.word	589828
	.word	0
	.word	902208
	.word	916588
	.word	1031176
	.word	16384
	.word	1035355
	.word	1018888
	.word	0
	.word	1027079
	.word	0
	.word	1035361
	.word	16391
	.word	916544
	.word	1031176
	.word	16388
	.word	916544
	.word	1031176
	.word	0
	.word	18432
	.word	916544
	.word	1031176
	.word	916552
	.word	1031176
	.word	1035284
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031174
	.word	1018886
	.word	16384
	.word	17408
	.word	0
	.word	16384
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	593924
	.word	103056
	.word	103056
	.word	905516
	.word	1031176
	.word	589828
	.word	0
	.word	902208
	.word	916588
	.word	1031175
	.word	16384
	.word	1035355
	.word	1018888
	.word	0
	.word	1031176
	.word	0
	.word	1027080
	.word	0
	.word	1027080
	.word	16384
	.word	1035355
	.word	0
	.word	16384
	.word	0
	.word	0
	.word	1007616
	.word	0
	.word	0
	.word	589828
	.word	99972
	.word	622596
	.word	901164
	.word	1031182
	.word	0
	.word	109184
	.word	0
	.word	0
	.word	0
	.word	597444
	.word	107044
	.word	100000
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	589840
	.word	98332
	.word	592016
	.word	100508
	.word	0
	.word	902272
	.word	1031178
	.word	0
	.word	67204
	.word	0
	.word	0
	.word	1018891
	.word	17408
	.word	0
	.word	0
	.word	0
	.word	902208
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904392
	.word	69260
	.word	0
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031181
	.word	916612
	.word	1031181
	.word	916608
	.word	1031180
	.word	916608
	.word	1031180
	.word	1018894
	.word	1035295
	.word	0
	.word	1027086
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	98324
	.word	0
	.word	1035359
	.word	1018894
	.word	1035312
	.word	0
	.word	1027086
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	98324
	.word	0
	.word	1035359
	.word	1018894
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	983049
	.word	0
	.word	0
	.word	0
	.word	589828
	.word	0
	.word	99972
	.word	916484
	.word	1031188
	.word	916524
	.word	1031184
	.word	916524
	.word	1031188
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	597444
	.word	0
	.word	0
	.word	589840
	.word	98332
	.word	0
	.word	0
	.word	0
	.word	0
	.word	98308
	.word	0
	.word	916484
	.word	1031184
	.word	0
	.word	0
	.word	67204
	.word	0
	.word	0
	.word	1018897
	.word	0
	.word	0
	.word	902208
	.word	103044
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904400
	.word	69260
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031188
	.word	916612
	.word	1031188
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	0
	.word	1027092
	.word	16384
	.word	916544
	.word	1031186
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1018899
	.word	0
	.word	0
	.word	0
	.word	902208
	.word	67204
	.word	0
	.word	0
	.word	0
	.word	904392
	.word	69260
	.word	0
	.word	1035351
	.word	1035354
	.word	0
	.word	16384
	.word	916608
	.word	1031188
	.word	1018900
	.word	916612
	.word	1031188
	.word	1035322
	.word	1018900
	.word	1035322
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	98308
	.word	0
	.word	0
	.word	0
	.word	102028
	.word	592972
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	589828
	.word	901164
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	69260
	.word	69260
	.word	69260
	.word	606220
	.word	0
	.word	16384
	.word	66176
	.word	0
	.word	0
	.word	0
	.word	20480
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	66176
	.word	66176
	.word	0
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	590920
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	67204
	.word	606212
	.word	1027096
	.word	0
	.word	1018905
	.word	0
	.word	1027096
	.word	1027096
	.word	1018905
	.word	0
	.word	1018905
	.word	0
	.word	1027097
	.word	1018905
	.word	0
	.word	1018905
	.word	67204
	.word	606212
	.word	606212
	.word	0
	.word	0
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	17409
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	17410
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	17414
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	901124
	.word	1031195
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	17408
	.word	901124
	.word	1031196
	.word	16384
	.word	0
	.word	17409
	.word	98308
	.word	98308
	.word	66176
	.word	66176
	.word	18432
	.word	590980
	.word	67204
	.word	67204
	.word	606212
	.word	606212
	.word	0
	.word	18433
	.word	589832
	.word	66176
	.word	66176
	.word	590920
	.word	67204
	.word	67204
	.word	606212
	.word	67204
	.word	606212
	.word	18432
	.word	916552
	.word	1031198
	.word	916556
	.word	1031198
	.word	1018910
	.word	17408
	.word	1018910
	.word	17408
	.word	1018910
	.word	606212
	.word	0
	.word	0
	.word	17410
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	589828
	.word	901164
	.word	0
	.word	17419
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	16384
	.word	0
	.word	17423
	.word	98308
	.word	17410
	.word	0
	.word	1035359
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	17423
	.word	589828
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	0
	.word	16385
	.word	916488
	.word	1031215
	.word	16384
	.word	916608
	.word	1031215
	.word	0
	.word	16388
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16389
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16390
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	916864
	.word	1031202
	.word	1031215
	.word	16390
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	16391
	.word	916864
	.word	1031202
	.word	916868
	.word	1031202
	.word	1018920
	.word	1035374
	.word	0
	.word	17408
	.word	902532
	.word	903560
	.word	605256
	.word	1031215
	.word	1035374
	.word	17408
	.word	902532
	.word	1031215
	.word	1035374
	.word	17408
	.word	902532
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	902532
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	902532
	.word	1031208
	.word	29696
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027110
	.word	20480
	.word	30720
	.word	16384
	.word	916800
	.word	1031206
	.word	1035372
	.word	0
	.word	104840
	.word	104848
	.word	595332
	.word	16384
	.word	906560
	.word	1031206
	.word	103060
	.word	16384
	.word	112696
	.word	917380
	.word	1031206
	.word	1018917
	.word	990244
	.word	29696
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027112
	.word	20480
	.word	30720
	.word	16384
	.word	916800
	.word	1031208
	.word	1035372
	.word	0
	.word	104840
	.word	104848
	.word	595332
	.word	16384
	.word	906560
	.word	1031208
	.word	103060
	.word	16384
	.word	112696
	.word	917380
	.word	1031208
	.word	1018919
	.word	990246
	.word	1018920
	.word	16384
	.word	0
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1027113
	.word	1018927
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031210
	.word	17408
	.word	916868
	.word	1031210
	.word	17408
	.word	916868
	.word	1031211
	.word	1018927
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031211
	.word	1018927
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035376
	.word	1035376
	.word	1035374
	.word	0
	.word	17423
	.word	916868
	.word	1031215
	.word	17408
	.word	916868
	.word	1031211
	.word	29696
	.word	110208
	.word	1035376
	.word	988203
	.word	1035374
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	0
	.word	16384
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	1035374
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	916868
	.word	1031213
	.word	1018926
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	16384
	.word	916864
	.word	1031215
	.word	1018927
	.word	16384
	.word	0
	.word	16384
	.word	0
	.word	916864
	.word	1031215
	.word	916868
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	0
	.word	1031215
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031225
	.word	916872
	.word	1031225
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031225
	.word	916872
	.word	1031225
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031217
	.word	1018929
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	1035374
	.word	17408
	.word	916868
	.word	1031225
	.word	1035374
	.word	0
	.word	17409
	.word	916868
	.word	1031225
	.word	1035374
	.word	0
	.word	17409
	.word	916868
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	17408
	.word	916868
	.word	1031225
	.word	1035372
	.word	0
	.word	1035372
	.word	1035372
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	18432
	.word	0
	.word	901124
	.word	901128
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031225
	.word	20480
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	916880
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	916484
	.word	1031224
	.word	1018935
	.word	16384
	.word	0
	.word	1018937
	.word	16384
	.word	0
	.word	0
	.word	1031225
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	1035374
	.word	0
	.word	0
	.word	916868
	.word	1031254
	.word	1035374
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	17408
	.word	916868
	.word	1031228
	.word	1018966
	.word	17408
	.word	0
	.word	1018940
	.word	17408
	.word	0
	.word	1018940
	.word	17408
	.word	0
	.word	1035374
	.word	0
	.word	17423
	.word	916868
	.word	1031254
	.word	0
	.word	16384
	.word	99972
	.word	590912
	.word	916544
	.word	1031229
	.word	1018941
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031254
	.word	0
	.word	0
	.word	21506
	.word	300368
	.word	99412
	.word	0
	.word	1035359
	.word	0
	.word	1031254
	.word	16384
	.word	18432
	.word	100492
	.word	1035350
	.word	16384
	.word	0
	.word	0
	.word	0
	.word	1031232
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027136
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	98348
	.word	99436
	.word	294916
	.word	0
	.word	0
	.word	1031233
	.word	0
	.word	1031233
	.word	16384
	.word	294916
	.word	0
	.word	16384
	.word	99436
	.word	294916
	.word	17408
	.word	901124
	.word	0
	.word	18432
	.word	49160
	.word	589828
	.word	0
	.word	16384
	.word	916544
	.word	1031234
	.word	1035374
	.word	0
	.word	916868
	.word	1031254
	.word	16384
	.word	916544
	.word	1031235
	.word	16384
	.word	18432
	.word	100492
	.word	1035350
	.word	0
	.word	18432
	.word	50248
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	18432
	.word	50308
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	18432
	.word	50308
	.word	605188
	.word	1031235
	.word	1035376
	.word	0
	.word	1031236
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	16384
	.word	916484
	.word	1031236
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16384
	.word	916544
	.word	1031238
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031238
	.word	1035374
	.word	0
	.word	16384
	.word	916484
	.word	1031238
	.word	1035374
	.word	0
	.word	16384
	.word	916484
	.word	1031238
	.word	16386
	.word	0
	.word	16384
	.word	916484
	.word	1031239
	.word	16386
	.word	0
	.word	16384
	.word	916484
	.word	1031239
	.word	1018953
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031241
	.word	28672
	.word	16384
	.word	108548
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	17408
	.word	916868
	.word	1031241
	.word	17408
	.word	916868
	.word	1031241
	.word	18432
	.word	916872
	.word	1031241
	.word	17408
	.word	916868
	.word	1031241
	.word	1018953
	.word	1035376
	.word	1018953
	.word	1035376
	.word	983112
	.word	16384
	.word	902148
	.word	1031243
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1031243
	.word	28672
	.word	16384
	.word	108548
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	17408
	.word	916868
	.word	1031243
	.word	17408
	.word	916868
	.word	1031243
	.word	18432
	.word	916872
	.word	1031243
	.word	17408
	.word	916868
	.word	1031243
	.word	1018955
	.word	1035376
	.word	1018955
	.word	1035376
	.word	983114
	.word	16384
	.word	18432
	.word	901124
	.word	1031244
	.word	1031244
	.word	1018956
	.word	0
	.word	916612
	.word	1031244
	.word	130284
	.word	1031244
	.word	1018956
	.word	1018961
	.word	1035374
	.word	0
	.word	1027148
	.word	1035374
	.word	28672
	.word	16384
	.word	108548
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027149
	.word	1035372
	.word	1035372
	.word	0
	.word	1027150
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027150
	.word	1035372
	.word	1035372
	.word	1035372
	.word	1035372
	.word	983116
	.word	16384
	.word	0
	.word	916484
	.word	1031249
	.word	916652
	.word	1031249
	.word	28672
	.word	16384
	.word	108548
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027152
	.word	1035372
	.word	1035372
	.word	0
	.word	1027153
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027153
	.word	1035372
	.word	1035372
	.word	1035372
	.word	1035372
	.word	983119
	.word	0
	.word	1027155
	.word	16384
	.word	916544
	.word	1031249
	.word	16384
	.word	0
	.word	1035350
	.word	1018963
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	0
	.word	1027155
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	17408
	.word	916868
	.word	1031251
	.word	1018963
	.word	1035374
	.word	1018963
	.word	1035374
	.word	1035374
	.word	17408
	.word	916484
	.word	1031250
	.word	0
	.word	1027156
	.word	17408
	.word	916484
	.word	1031252
	.word	18432
	.word	916488
	.word	1031252
	.word	1018964
	.word	1035374
	.word	0
	.word	17408
	.word	916868
	.word	1031254
	.word	1035372
	.word	0
	.word	0
	.word	1031253
	.word	1035374
	.word	17408
	.word	916868
	.word	1031254
	.word	0
	.word	916872
	.word	1031253
	.word	1035372
	.word	1035372
	.word	0
	.word	1031254
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	999424
	.word	19456
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031255
	.word	1018967
	.word	16384
	.word	0
	.word	999424
	.word	22528
	.word	0
	.word	0
	.word	0
	.word	916632
	.word	1031256
	.word	594960
	.word	0
	.word	0
	.word	0
	.word	594964
	.word	71316
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1018969
	.word	595088
	.word	0
	.word	593936
	.word	906516
	.word	0
	.word	0
	.word	594964
	.word	71316
	.word	0
	.word	0
	.word	0
	.word	0
	.word	595092
	.word	71316
	.word	0
	.word	0
	.word	16384
	.word	0
	.word	999424
	.word	22528
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	16384
	.word	0
	.word	1035350
	.word	17409
	.word	591876
	.word	98944
	.word	592900
	.word	0
	.word	16384
	.word	0
	.word	1035350
	.word	999424
	.word	17408
	.word	916484
	.word	1031260
	.word	0
	.word	21504
	.word	0
	.word	300368
	.word	99652
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	67204
	.word	67204
	.word	67204
	.word	606212
	.word	0
	.word	0
	.word	21504
	.word	0
	.word	300368
	.word	98624
	.word	0
	.word	1035359
	.word	1018975
	.word	0
	.word	21504
	.word	0
	.word	905516
	.word	300368
	.word	99652
	.word	0
	.word	1035359
	.word	0
	.word	0
	.word	0
	.word	99392
	.word	0
	.word	0
	.word	0
	.word	99392
	.word	916552
	.word	1031261
	.word	1018974
	.word	0
	.word	0
	.word	902208
	.word	902276
	.word	99460
	.word	0
	.word	0
	.word	0
	.word	67204
	.word	67204
	.word	67204
	.word	606212
	.word	0
	.word	0
	.word	21504
	.word	0
	.word	905516
	.word	300368
	.word	98624
	.word	0
	.word	1035359
	.word	0
	.word	16384
	.word	98560
	.word	0
	.word	999424
	.word	20480
	.word	0
	.word	20480
	.word	21504
	.word	22528
	.word	916688
	.word	1031264
	.word	916692
	.word	1031264
	.word	916696
	.word	1031264
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	1018976
	.word	16384
	.word	0
	.word	1013760
	.word	999424
	.word	22528
	.word	0
	.word	0
	.word	108184
	.word	1031265
	.word	19456
	.word	104664
	.word	596248
	.word	108184
	.word	0
	.word	17408
	.word	916484
	.word	1031270
	.word	0
	.word	0
	.word	916544
	.word	1031270
	.word	104088
	.word	0
	.word	903232
	.word	68232
	.word	903316
	.word	1027172
	.word	0
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	594176
	.word	905480
	.word	595264
	.word	102676
	.word	70288
	.word	102680
	.word	595220
	.word	104084
	.word	0
	.word	0
	.word	595220
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	593040
	.word	69260
	.word	0
	.word	0
	.word	904264
	.word	69260
	.word	0
	.word	1018982
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	903232
	.word	68232
	.word	903560
	.word	108168
	.word	0
	.word	589828
	.word	66176
	.word	100480
	.word	0
	.word	593044
	.word	102028
	.word	0
	.word	0
	.word	593044
	.word	0
	.word	0
	.word	0
	.word	904256
	.word	69260
	.word	904420
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	1018988
	.word	0
	.word	0
	.word	1018987
	.word	0
	.word	0
	.word	98308
	.word	916608
	.word	1031275
	.word	104088
	.word	0
	.word	903232
	.word	68232
	.word	903316
	.word	1027177
	.word	0
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	594176
	.word	905480
	.word	595264
	.word	102676
	.word	70288
	.word	102680
	.word	595220
	.word	104084
	.word	0
	.word	0
	.word	595220
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	593040
	.word	69260
	.word	0
	.word	0
	.word	67204
	.word	904264
	.word	0
	.word	1018987
	.word	0
	.word	0
	.word	592136
	.word	0
	.word	0
	.word	0
	.word	903232
	.word	68232
	.word	903560
	.word	108168
	.word	0
	.word	589828
	.word	66176
	.word	100480
	.word	0
	.word	593044
	.word	102028
	.word	0
	.word	0
	.word	593044
	.word	0
	.word	0
	.word	0
	.word	0
	.word	903300
	.word	904200
	.word	69260
	.word	904420
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	1018988
	.word	0
	.word	0
	.word	67204
	.word	1018987
	.word	0
	.word	592912
	.word	0
	.word	0
	.word	592912
	.word	69260
	.word	101592
	.word	595152
	.word	0
	.word	902244
	.word	0
	.word	0
	.word	595152
	.word	104084
	.word	0
	.word	19456
	.word	0
	.word	0
	.word	0
	.word	999424
	.word	19456
	.word	17408
	.word	66176
	.word	67204
	.word	606212
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	0
	.word	590936
	.word	596184
	.word	916544
	.word	1031277
	.word	612440
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031278
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031278
	.word	1018990
	.word	16384
	.word	0
	.word	999424
	.word	19456
	.word	17408
	.word	66176
	.word	67204
	.word	606212
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	0
	.word	595992
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031280
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031280
	.word	1018992
	.word	16384
	.word	0
	.word	999424
	.word	21504
	.word	22528
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	113280
	.word	0
	.word	102660
	.word	916544
	.word	1031282
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	0
	.word	104836
	.word	916872
	.word	1031280
	.word	104080
	.word	916804
	.word	1031285
	.word	70288
	.word	102660
	.word	295128
	.word	905472
	.word	104080
	.word	916628
	.word	1031284
	.word	0
	.word	905476
	.word	19456
	.word	16384
	.word	0
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	1018995
	.word	19456
	.word	16384
	.word	101008
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	1018997
	.word	19456
	.word	16384
	.word	299224
	.word	903504
	.word	66176
	.word	67204
	.word	68232
	.word	68232
	.word	606212
	.word	606216
	.word	606216
	.word	0
	.word	1013760
	.word	16384
	.word	99972
	.word	99972
	.word	589888
	.word	916608
	.word	1031286
	.word	1018998
	.word	16384
	.word	0
	.word	999424
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65537
	.word	7208960
	.word	513
	.word	1537
	.word	319365736
	.word	319365736
	.word	9437306
	.word	5046372
	.word	0
	.word	0
	.word	1
	.word	131
	.word	16
	.word	2
	.word	24
	.word	256
	.word	263
	.word	3
	.word	351
	.word	4
	.word	64
	.word	127
	.word	262143
	.word	1048575
	.word	4194303
	.word	2147483647
	.word	-2147483648
	.word	-16
	.word	15
	.word	-128
	.word	8192
	.word	1048576
	.word	96000
	.word	-8
	.word	-1
	.word	262144
	.word	-524288
	.word	65280000
	.word	196612
	.word	131074
	.word	65537
	.word	65537
	.word	0
	.word	0
	.word	0
	.word	0
	.word	8
	.word	8160
	.word	255
	.word	0
	.word	1
	.word	5
	.word	8
	.word	7
	.word	64
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	g_pScdDrvParamBase, %object
	.size	g_pScdDrvParamBase, 4
g_pScdDrvParamBase:
	.word	g_ScdDrvParam
	.type	g_hex_flag, %object
	.size	g_hex_flag, 4
g_hex_flag:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	ASCII(.ascii	"Fatal: get g_hex_base_addr(0x%x) vir addr failed!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC3:
	ASCII(.ascii	"Warn: eVidStd = %d have not DSP vfmw bin file!!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC4:
	ASCII(.ascii	"%s failed!\012\000" )
.LC5:
	ASCII(.ascii	"%s success!\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"Ignore the reset request when the SCD[%d] clock is " )
	ASCII(.ascii	"closed.\012\000" )
.LC7:
	ASCII(.ascii	"SCD[%d]   ResetSCD ERROR!!!\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"line: %d Get SmID fail!\000" )
.LC9:
	ASCII(.ascii	"DelRaw err PacketNum = %d, DelNum = %d\012\000" )
.LC10:
	ASCII(.ascii	"%s release RawPhyAddr = 0x%x, Len = %d\012\000" )
.LC11:
	ASCII(.ascii	"line: %d DelNum = %d,RawPacketOffSet = %d,DelNum = " )
	ASCII(.ascii	"%d,Next Length = %d,is_extern_eop_flag = %d\012\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC12:
	ASCII(.ascii	"line: %d DelNum = %d,RawPacketOffSet = %d,Next Leng" )
	ASCII(.ascii	"th = %d\012\012\000" )
	.space	3
.LC13:
	ASCII(.ascii	"line: %d pSmInstArray is NULL!\012\000" )
.LC14:
	ASCII(.ascii	"Read_seg SegPacket.PhyAddr=0x%x, LenByte=%d, IsLast" )
	ASCII(.ascii	"Seg=%d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"-------- forece release seg[%d] -----------\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"0x%02x,\000" )
.LC18:
	ASCII(.ascii	"Release SegPacket.PhyAddr=0x%x,LenByte=%d,IsLastSeg" )
	ASCII(.ascii	"=%d StreamID=%d\012\000" )
.LC19:
	ASCII(.ascii	"Array out of bound in function %s\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"ScdId is wrong! %s error\012\000" )
	.space	2
.LC21:
	ASCII(.ascii	"%s,line: %d\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"%s: g_hex_base_vir_addr = NULL\012\000" )
.LC23:
	ASCII(.ascii	"line: %d, SmID = %d, pSmCfg = %p is not expected!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC24:
	ASCII(.ascii	"line: %d, SmID = %d is not expected!\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"line: %d, SmID = %d, ScdId = %d is not expected!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC26:
	ASCII(.ascii	"Raw packet TOO BIG! Can't copy to seg! Len: 0x%x\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC27:
	ASCII(.ascii	"line: %d, delet raw failed!\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"[%s %d] VirAddr is null!!\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"copy raw to seg fail\012\000" )
	.space	2
.LC30:
	ASCII(.ascii	"InstID = %d EsRelease!\012\000" )
.LC31:
	ASCII(.ascii	"Cann't Start SCD, Ret = %d\012\000" )
.LC32:
	ASCII(.ascii	"SM_CfgBuf Err! ret =%d\012\000" )
.LC33:
	ASCII(.ascii	"Line: %d, The length of seg packet is invalid: %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC34:
	ASCII(.ascii	"Line: %d, start code num from scd state reg: %d, re" )
	ASCII(.ascii	"lease raw packet anyway!\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"[%s %d] pCurrentStartCodeVirAddr is null!!\012\000" )
.LC36:
	ASCII(.ascii	"Line: %d, pNextStartCodeVirAddr is null!\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"ValidSegNum = %d, FilteredSegNum = 0, release raw p" )
	ASCII(.ascii	"acket anyway!\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"%s: pRawPacket = NULL!\012\000" )
.LC39:
	ASCII(.ascii	"%s: unkown standard type = %d!\012\000" )
.LC40:
	ASCII(.ascii	"%s: Length(%d)+FlagLen(%d) > BufLen(%d)\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"%s: FlagLen(%d) > RawPacketLength(%d)\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, head" )
	ASCII(.ascii	"er_buf: %d)\012\000" )
.LC43:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act: %d, str_" )
	ASCII(.ascii	"buf: %d)\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf: %d, header_buf: %d)\012\000" )
.LC45:
	ASCII(.ascii	"Func: %s, buffer has no enough space, (act: %d, str" )
	ASCII(.ascii	"_buf: %d)\012\000" )
	.space	2
.LC46:
	ASCII(.ascii	"Func: %s, buffer has no enough space,(act:%d, str_b" )
	ASCII(.ascii	"uf:%d)\012\000" )
	.space	1
.LC47:
	ASCII(.ascii	"%s: RawPacket Length %d <= 0\012\000" )
	.space	2
.LC48:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReleaseRawStreamData pStreamIntf is NULL!\000" )
.LC49:
	ASCII(.ascii	"line: %d s_SmIIS[%d].pSmInstArray is NULL\012\000" )
	.space	1
.LC50:
	ASCII(.ascii	"SmID = %d is not expected!\012\000" )
.LC51:
	ASCII(.ascii	"line: %d, pScdInstance is NULL!\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"%s %d FMW_OK !=  GetRawStreamNum !!\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"Chan %d has been destroyed or the function pointer " )
	ASCII(.ascii	"-- ReadRawStreamData pStreamIntf is NULL!\000" )
	.space	3
.LC54:
	ASCII(.ascii	"line: %d s_SmIIS.pSmInstArray[%d] is NULL\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"Chan %d FillEosRawStream failed!\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"Chan %d FillExtraData failed!\012\000" )
	.space	1
.LC57:
	ASCII(.ascii	"Release this packet failed!\012\000" )
	.space	3
.LC58:
	ASCII(.ascii	"raw_pts: %lld\012\000" )
	.space	1
.LC59:
	ASCII(.ascii	"Get RawPhyAddr=0x%x,Len=%d\012\000" )
.LC60:
	ASCII(.ascii	"!!!push raw err!!!\012\000" )
.LC61:
	ASCII(.ascii	"Chan%d raw full\012\000" )
	.space	3
.LC62:
	ASCII(.ascii	"RawNum %lld <= RawNumInVfmw %lld\012\000" )
	.space	2
.LC63:
	ASCII(.ascii	"No space for raw move, total:%d+%d > max:%d!\012\000" )
	.space	2
.LC64:
	ASCII(.ascii	"(%d ms) not release stream seg, release anyway!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC65:
	ASCII(.ascii	"%s,%d, active scd Success!\012\000" )
.LC66:
	ASCII(.ascii	"Move raw data failed, force to reset scd.\012\000" )
	.space	1
.LC67:
	ASCII(.ascii	"SCD GetRawStreamNum Fail.\012\000" )
	.space	1
.LC68:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) SCDState = %d\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return Idle!\012\000" )
	.space	3
.LC70:
	ASCII(.ascii	"Chan %d SCD[%d] Time Out(%d ms), Reset it!\012\000" )
.LC71:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) really busy!\012\000" )
	.space	3
.LC72:
	ASCII(.ascii	"%s prepare to check SCD(%d)/(MAX_SCD_NUM = %d)\012\000" )
.LC73:
	ASCII(.ascii	"%s,%d,SCD(ID = %d) return BUSY!!\012\000" )
	.space	2
.LC74:
	ASCII(.ascii	"%s,%d,find idle SCD(ID = %d)\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_hex_base_addr, %object
	.size	g_hex_base_addr, 4
g_hex_base_addr:
	.space	4
	.type	s_ScdRegPhyBaseAddr, %object
	.size	s_ScdRegPhyBaseAddr, 4
s_ScdRegPhyBaseAddr:
	.space	4
	.type	s_SmIIS, %object
	.size	s_SmIIS, 256
s_SmIIS:
	.space	256
	.type	g_ScdDrvParam, %object
	.size	g_ScdDrvParam, 60
g_ScdDrvParam:
	.space	60
	.type	s_eScdDrvSleepStage, %object
	.size	s_eScdDrvSleepStage, 4
s_eScdDrvSleepStage:
	.space	4
	.type	g_hex_base_vir_addr, %object
	.size	g_hex_base_vir_addr, 4
g_hex_base_vir_addr:
	.space	4
	.type	g_hex_len, %object
	.size	g_hex_len, 4
g_hex_len:
	.space	4
	.type	s_ScdRegResetPhyAddr, %object
	.size	s_ScdRegResetPhyAddr, 4
s_ScdRegResetPhyAddr:
	.space	4
	.type	last_rec_pos_time.53540, %object
	.size	last_rec_pos_time.53540, 128
last_rec_pos_time.53540:
	.space	128
	.type	LastRecPosTime.53736, %object
	.size	LastRecPosTime.53736, 128
LastRecPosTime.53736:
	.space	128
	.type	last_rec_pos_time.53761, %object
	.size	last_rec_pos_time.53761, 128
last_rec_pos_time.53761:
	.space	128
	.type	s_ScdRegResetOKPhyAddr, %object
	.size	s_ScdRegResetOKPhyAddr, 4
s_ScdRegResetOKPhyAddr:
	.space	4
	.type	ForceRelease, %object
	.size	ForceRelease, 4
ForceRelease:
	.space	4
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
