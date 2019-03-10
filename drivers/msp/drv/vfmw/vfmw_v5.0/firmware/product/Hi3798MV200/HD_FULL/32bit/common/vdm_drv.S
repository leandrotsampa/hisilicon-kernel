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
	.file	"vdm_drv.c"
	.text
	.align	2
	.type	VDMDRV_AdjustErrRatio, %function
VDMDRV_AdjustErrRatio:
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
	ldr	r4, .L19
	mov	r7, r0, asl #3
	mov	r5, r0, asl #6
	rsb	ip, r7, r5
	subs	r3, r1, #0
	add	ip, r4, ip
	mov	r6, r2
	add	r2, ip, #8
	ldr	r8, [ip, #8]
	beq	.L3
	cmp	r3, #2
	bls	.L15
	ldr	r1, [r2, #4]
	sub	r3, fp, #36
	ldr	r2, [ip, #48]
	str	r0, [r3, #-12]!
	mov	r0, r3
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	bl	PostPro_GetErrRatio
	ldr	r9, .L19+4
	cmp	r0, #0
	mov	ip, r0
	str	r0, [r6]
	bne	.L16
.L6:
	rsb	r5, r7, r5
	ldr	r3, [r9, r8, asl #2]
	add	r4, r4, r5
	add	r3, r3, #311296
	ldr	r1, [r4, #12]
	ldr	r2, [r3, #3508]
	sub	r0, r1, #8
	cmp	r1, #5
	cmpne	r0, #1
	add	r2, r2, #1
	str	r2, [r3, #3508]
	movls	r3, #0
	bhi	.L17
	str	r3, [r6]
.L18:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L15:
	mov	ip, #100
	mov	r2, r8
	str	ip, [r6]
	mov	r0, #1
	ldr	r1, .L19+8
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3:
	str	r3, [r6]
	mov	r2, r8
	ldr	r1, .L19+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L17:
	ldr	r3, [r6]
	cmp	r3, #100
	movge	r3, #100
	bic	r3, r3, r3, asr #31
	str	r3, [r6]
	b	.L18
.L16:
	ldr	r3, [r9, r8, asl #2]
	mov	r2, r8
	ldr	r1, .L19+16
	mov	r0, #1
	add	r3, r3, #311296
	ldr	r3, [r3, #3508]
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L6
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC1
	.word	.LC0
	.word	.LC2
	UNWIND(.fnend)
	.size	VDMDRV_AdjustErrRatio, .-VDMDRV_AdjustErrRatio
	.align	2
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
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
	ldr	r3, .L22
	mov	r6, r0, asl #6
	ldr	r4, .L22+4
	mov	r5, r0
	sub	r0, r6, r0, asl #3
	mov	r2, #56
	add	r0, r4, r0
	ldr	r3, [r3, #48]
	mov	r1, #0
	add	r4, r4, r5, lsl #2
	blx	r3
	ldr	r2, .L22+8
	mov	r3, #0
	str	r3, [r4, #56]
	add	r2, r2, r6
	str	r3, [r4, #60]
	str	r3, [r2, #16]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	g_VfmwGlobalStat
	UNWIND(.fnend)
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	2
	.global	VDMDRV_Reset
	.type	VDMDRV_Reset, %function
VDMDRV_Reset:
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
	ldr	r1, .L25
	mov	r3, r0, asl #6
	ldr	ip, .L25+4
	sub	r0, r3, r0, asl #3
	mov	r2, #56
	ldr	r3, [r1, #48]
	add	r0, ip, r0
	mov	r1, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L26:
	.align	2
.L25:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_Reset, .-VDMDRV_Reset
	.align	2
	.global	VDMDRV_SetPriority
	.type	VDMDRV_SetPriority, %function
VDMDRV_SetPriority:
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
	ldr	r5, .L39
	mov	r4, #0
	sub	r6, r0, #4
	mov	lr, r4
	mov	r7, r4
.L34:
	mov	ip, #0
	mov	r1, r6
	mov	r3, ip
.L29:
	ldr	r2, [r1, #4]!
	cmp	r2, ip
	movgt	lr, r3
	add	r3, r3, #1
	movgt	ip, r2
	cmp	r3, #32
	bne	.L29
	cmp	ip, #0
	ble	.L38
	add	r4, r4, #1
	str	lr, [r5, #4]!
	cmp	r4, #32
	str	r7, [r0, lr, asl #2]
	bne	.L34
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L38:
	cmp	r4, #31
	ldmgtfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, .L39+4
	mov	r2, r4, asl #2
	mvn	r1, #0
.L32:
	add	r4, r4, #1
	add	r3, r0, r2
	cmp	r4, #32
	add	r2, r2, #4
	str	r1, [r3, #196]
	bne	.L32
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	.LANCHOR0+192
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	2
	.global	VDMDRV_AdjustPriorityAfterDec
	.type	VDMDRV_AdjustPriorityAfterDec, %function
VDMDRV_AdjustPriorityAfterDec:
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
	ldr	r5, .L54
	add	ip, r5, #196
	ldr	r3, [r5, #196]
	cmp	r3, r0
	beq	.L50
	mov	r3, #1
	mov	r2, ip
	b	.L46
.L43:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L52
.L46:
	ldr	r1, [r2, #4]!
	cmp	r1, r0
	bne	.L43
	cmp	r3, #30
	bgt	.L53
.L42:
	add	r6, r3, #1
	mov	lr, r3
	mov	r6, r6, asl #2
.L47:
	ldr	r0, [ip, r6]
	add	r6, ip, r6
	cmp	r0, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r2, r3, #2
	mov	r2, r2, asl #2
	b	.L45
.L49:
	ldr	r0, [ip, r2]
	add	r2, r2, #4
	cmp	r0, #0
	ldmltfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L45:
	ldr	r4, [ip, lr, asl #2]
	add	r1, r5, r0, lsl #2
	add	r3, r3, #1
	ldr	r7, [r1, #68]
	add	r1, r5, r4, lsl #2
	ldr	r1, [r1, #68]
	cmp	r7, r1
	strge	r0, [ip, lr, asl #2]
	strge	r4, [r6]
	cmp	r3, #30
	add	r6, ip, r2
	mov	lr, r3
	ble	.L49
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	mov	r3, #0
	mov	r6, #4
	mov	lr, r3
	b	.L47
.L50:
	mov	r3, #0
	b	.L42
.L53:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	2
	.global	VDMDRV_PrepareSleep
	.type	VDMDRV_PrepareSleep, %function
VDMDRV_PrepareSleep:
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
	ldr	r1, .L60
	add	ip, r1, r0, lsl #2
	ldr	r3, [ip, #56]
	cmp	r3, #0
	bne	.L59
	mov	r2, r0, asl #6
	sub	r0, r2, r0, asl #3
	ldr	r0, [r1, r0]
	cmp	r0, #0
	moveq	r3, #2
	movne	r0, r3
	movne	r3, #1
	str	r3, [ip, #56]
	ldmfd	sp, {fp, sp, pc}
.L59:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	2
	.global	VDMDRV_GetSleepStage
	.type	VDMDRV_GetSleepStage, %function
VDMDRV_GetSleepStage:
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
	ldr	r3, .L63
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #56]
	ldmfd	sp, {fp, sp, pc}
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
	.align	2
	.global	VDMDRV_ForceSleep
	.type	VDMDRV_ForceSleep, %function
VDMDRV_ForceSleep:
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
	ldr	r3, .L70
	add	r4, r3, r0, lsl #2
	ldr	r2, [r4, #56]
	cmp	r2, #2
	beq	.L66
	ldr	ip, .L70+4
	mov	r2, r0, asl #6
	sub	r0, r2, r0, asl #3
	mov	r1, #0
	add	r0, r3, r0
	mov	r2, #56
	ldr	r3, [ip, #48]
	blx	r3
	mov	r3, #2
	str	r3, [r4, #56]
.L66:
	ldr	r1, .L70+8
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC3
	UNWIND(.fnend)
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	2
	.global	VDMDRV_ExitSleep
	.type	VDMDRV_ExitSleep, %function
VDMDRV_ExitSleep:
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
	ldr	r3, .L73
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #56]
	ldmfd	sp, {fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	2
	.global	VDMDRV_StartRepair
	.type	VDMDRV_StartRepair, %function
VDMDRV_StartRepair:
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
	mov	r0, #8
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_RecordPosTime
	ldr	r3, .L78
	ldr	r3, [r3, #120]
	cmp	r3, #0
	beq	.L76
	mov	r1, r6
	mov	r0, r4
	blx	r3
.L77:
	mov	r3, r4, asl #6
	ldr	r2, .L78+4
	sub	r1, r3, r4, asl #3
	str	r5, [r2, r1]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L76:
	mov	r0, r3
	mov	r2, #296
	ldr	r1, .L78+8
	bl	dprint_vfmw
	b	.L77
.L79:
	.align	2
.L78:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	2
	.global	VDMDRV_StartDec
	.type	VDMDRV_StartDec, %function
VDMDRV_StartDec:
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
	mov	r0, #8
	mov	r5, r1
	bl	VCTRL_RecordPosTime
	ldr	r3, .L83
	ldr	r3, [r3, #124]
	cmp	r3, #0
	beq	.L81
	mov	r1, r5
	mov	r0, r4
	blx	r3
.L82:
	mov	r3, r4, asl #6
	ldr	r2, .L83+4
	sub	r0, r3, r4, asl #3
	mov	r3, #1
	str	r3, [r2, r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L81:
	mov	r0, r3
	movw	r2, #305
	ldr	r1, .L83+8
	bl	dprint_vfmw
	b	.L82
.L84:
	.align	2
.L83:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	2
	.global	VDMDRV_IsChanDec
	.type	VDMDRV_IsChanDec, %function
VDMDRV_IsChanDec:
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
	ldr	r3, .L86
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #324]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	2
	.global	VDMDRV_SetChanIsDec
	.type	VDMDRV_SetChanIsDec, %function
VDMDRV_SetChanIsDec:
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
	ldr	r3, .L89
	add	r1, r1, #1
	add	r3, r3, r0, lsl #2
	str	r1, [r3, #324]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_AdjustPriorityAfterDec
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_SetChanIsDec, .-VDMDRV_SetChanIsDec
	.align	2
	.global	VDMDRV_ClearChanIsDec
	.type	VDMDRV_ClearChanIsDec, %function
VDMDRV_ClearChanIsDec:
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
	ldr	r3, .L92
	add	r0, r0, #64
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #68]
	ldmfd	sp, {fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	2
	.global	VDMDRV_ParamInit
	.type	VDMDRV_ParamInit, %function
VDMDRV_ParamInit:
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
	ldr	r3, .L101
	mov	r0, #1
	add	r1, r3, #128
.L96:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	strne	r0, [r2, #16]
	cmp	r3, r1
	bne	.L96
	ldmfd	sp, {fp, sp, pc}
.L102:
	.align	2
.L101:
	.word	s_pstVfmwChan-4
	UNWIND(.fnend)
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	2
	.global	VDMDRV_AddMatchMode
	.type	VDMDRV_AddMatchMode, %function
VDMDRV_AddMatchMode:
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
	.size	VDMDRV_AddMatchMode, .-VDMDRV_AddMatchMode
	.align	2
	.global	VDMDRV_CheckAttachMode
	.type	VDMDRV_CheckAttachMode, %function
VDMDRV_CheckAttachMode:
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
	cmp	r0, #31
	mov	r4, r0
	bgt	.L104
	ldr	r6, .L130
	ldr	r2, [r6, r0, asl #2]
	cmp	r2, #0
	beq	.L104
	add	r3, r2, #278528
	ldr	r5, .L130+4
	mov	r8, r0, asl #2
	ldr	r1, [r3, #2064]
	ldr	r3, [r3, #2060]
	cmp	r1, #2160
	cmpcs	r3, #3840
	movcs	r7, #1
	movcc	r7, #0
	bcs	.L129
	add	r3, r5, r8
	ldr	r3, [r3, #580]
.L112:
	cmp	r3, #10
	beq	.L114
.L113:
	ldr	r3, [r2, #16]
	cmp	r3, #0
	beq	.L115
.L114:
	ldr	r3, [r2, #1456]
	cmp	r3, #35
	ble	.L116
	cmp	r7, #0
	beq	.L115
	mov	r1, #1
	movw	r3, #581
	str	r1, [r2, #1444]
	mov	r0, #0
	str	r1, [sp, #4]
	ldr	r2, .L130+8
	str	r4, [sp]
	ldr	r1, .L130+12
	bl	dprint_vfmw
	ldr	r2, [r6, r4, asl #2]
.L115:
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r3, [r6, r4, asl #2]
	add	r5, r5, r8
	ldr	r3, [r3, #1456]
	str	r3, [r5, #452]
.L104:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L129:
	add	r3, r5, r8
	ldr	r2, [r2, #1456]
	mov	r0, #22
	ldr	r1, .L130+16
	ldr	r3, [r3, #452]
	str	r2, [sp]
	cmp	r2, r3
	rsbhi	r9, r3, r2
	rsbls	r9, r2, r3
	str	r3, [sp, #4]
	movw	r3, #553
	ldr	r2, .L130+8
	bl	dprint_vfmw
	cmp	r9, #2
	bgt	.L109
	add	r2, r5, r8
	ldr	r3, [r2, #580]
	add	r3, r3, #1
	str	r3, [r2, #580]
.L110:
	cmn	r3, #1
	beq	.L111
	ldr	r2, [r6, r4, asl #2]
	b	.L112
.L116:
	mov	r3, #0
	str	r3, [r2, #1444]
	ldr	r2, [r6, r4, asl #2]
	b	.L115
.L109:
	add	r9, r5, r8
	movw	r3, #562
	ldr	r2, .L130+8
	mov	r0, #22
	ldr	r1, .L130+20
	mov	ip, #0
	str	ip, [r9, #580]
	bl	dprint_vfmw
	ldr	r3, [r9, #580]
	b	.L110
.L111:
	add	r3, r5, r8
	mov	r1, #11
	ldr	r2, [r6, r4, asl #2]
	str	r1, [r3, #580]
	b	.L113
.L131:
	.align	2
.L130:
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC7
	.word	.LC5
	.word	.LC6
	UNWIND(.fnend)
	.size	VDMDRV_CheckAttachMode, .-VDMDRV_CheckAttachMode
	.align	2
	.global	VDMDRV_ChnDecReady
	.type	VDMDRV_ChnDecReady, %function
VDMDRV_ChnDecReady:
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
	mov	r0, r1
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L136
	ldr	r3, .L139
	add	r3, r3, r4, lsl #2
	ldr	r5, [r3, #324]
	cmp	r5, #0
	bne	.L137
	str	r5, [r6]
	mov	r0, r4
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	str	r0, [r6]
	beq	.L138
.L134:
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L136:
	mov	r3, r4
	ldr	r2, .L139+4
	ldr	r1, .L139+8
	mov	r5, #1
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L137:
	mov	r2, r4
	ldr	r1, .L139+12
	mov	r5, #1
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L138:
	mov	r2, r4
	ldr	r1, .L139+16
	mov	r0, #22
	mov	r5, #1
	bl	dprint_vfmw
	b	.L134
.L140:
	.align	2
.L139:
	.word	.LANCHOR0
	.word	.LANCHOR1+24
	.word	.LC8
	.word	.LC9
	.word	.LC10
	UNWIND(.fnend)
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	2
	.global	PostPro_CopyYuvByProtocol
	.type	PostPro_CopyYuvByProtocol, %function
PostPro_CopyYuvByProtocol:
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
	sub	r3, r3, #1
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L142
.L144:
	.word	.L143
	.word	.L145
	.word	.L142
	.word	.L142
	.word	.L142
	.word	.L142
	.word	.L142
	.word	.L142
	.word	.L142
	.word	.L146
	.word	.L146
	.word	.L146
.L146:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv_Vp6
.L145:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv
.L143:
	ldr	r0, [r0]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	PostPro_CopyYuv_Vc1
.L142:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	PostPro_CopyYuvByProtocol, .-PostPro_CopyYuvByProtocol
	.align	2
	.global	VDMDRV_GetMb0QpInCurrPic
	.type	VDMDRV_GetMb0QpInCurrPic, %function
VDMDRV_GetMb0QpInCurrPic:
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
	ldr	r2, .L148
	mov	r3, #180
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #716]
	and	r0, r0, #31
	ldmfd	sp, {fp, sp, pc}
.L149:
	.align	2
.L148:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetMb0QpInCurrPic, .-VDMDRV_GetMb0QpInCurrPic
	.align	2
	.global	VDMDRV_GetSwitchRounding
	.type	VDMDRV_GetSwitchRounding, %function
VDMDRV_GetSwitchRounding:
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
	ldr	r2, .L151
	mov	r3, #180
	mla	r0, r3, r0, r2
	ldr	r0, [r0, #720]
	and	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
.L152:
	.align	2
.L151:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
	.align	2
	.global	VDMDRV_MMUIntServeProc
	.type	VDMDRV_MMUIntServeProc, %function
VDMDRV_MMUIntServeProc:
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
	ldr	r6, .L174
	ldr	r4, .L174+4
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r6, #12]
	blx	r3
	ldr	r3, [r4, #108]
	cmp	r3, #0
	beq	.L157
	mov	r1, r5
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #108]
	cmp	r3, #0
	mov	r8, r0
	beq	.L171
	mov	r1, r5
	mov	r0, #6
	blx	r3
	ldr	ip, [r4, #108]
	and	r10, r8, #15
	cmp	ip, #0
	moveq	r7, ip
	mov	r9, r0
	beq	.L154
	mov	r1, r5
	mov	r0, #7
	blx	ip
	mov	r7, r0
.L154:
	cmp	r10, #0
	beq	.L157
	tst	r8, #4
	bne	.L172
	tst	r8, #8
	bne	.L173
.L157:
	ldr	r3, [r4, #96]
	cmp	r3, #0
	beq	.L160
	mov	r0, r5
	blx	r3
.L161:
	ldr	r3, [r6, #16]
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L160:
	mov	r0, r3
	mov	r2, #1536
	ldr	r1, .L174+8
	bl	dprint_vfmw
	b	.L161
.L173:
	mov	r3, r7
	mov	r2, r8
	ldr	r1, .L174+12
	mov	r0, #32
	bl	dprint_vfmw
	b	.L157
.L172:
	mov	r3, r9
	mov	r2, r8
	ldr	r1, .L174+16
	mov	r0, #32
	bl	dprint_vfmw
	tst	r8, #8
	beq	.L157
	b	.L173
.L171:
	mov	r9, r3
	and	r10, r0, #15
	mov	r7, r3
	b	.L154
.L175:
	.align	2
.L174:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	.word	.LC12
	.word	.LC11
	UNWIND(.fnend)
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	2
	.global	VDMDRV_IsVdmInISR
	.type	VDMDRV_IsVdmInISR, %function
VDMDRV_IsVdmInISR:
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
	.size	VDMDRV_IsVdmInISR, .-VDMDRV_IsVdmInISR
	.align	2
	.global	VDMDRV_SetStateIdle
	.type	VDMDRV_SetStateIdle, %function
VDMDRV_SetStateIdle:
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
	ldr	r2, .L178
	mov	r3, r0, asl #6
	sub	r0, r3, r0, asl #3
	mov	r1, #0
	str	r1, [r2, r0]
	ldmfd	sp, {fp, sp, pc}
.L179:
	.align	2
.L178:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	2
	.global	VDMDRV_IsVdmIdle
	.type	VDMDRV_IsVdmIdle, %function
VDMDRV_IsVdmIdle:
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
	ldr	r2, .L181
	mov	r3, r0, asl #6
	sub	r0, r3, r0, asl #3
	ldr	r0, [r2, r0]
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L182:
	.align	2
.L181:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_IsVdmIdle, .-VDMDRV_IsVdmIdle
	.align	2
	.global	VDMDRV_GetCurrChanID
	.type	VDMDRV_GetCurrChanID, %function
VDMDRV_GetCurrChanID:
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
	ldr	r3, .L184
	mov	r2, r0, asl #6
	sub	r0, r2, r0, asl #3
	add	r0, r3, r0
	ldr	r0, [r0, #8]
	ldmfd	sp, {fp, sp, pc}
.L185:
	.align	2
.L184:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_GetCurrChanID, .-VDMDRV_GetCurrChanID
	.align	2
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
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
	ldr	r6, .L195
	mov	r5, r0
	mov	r4, #0
	b	.L188
.L190:
	add	r4, r4, #1
	cmp	r4, #400
	beq	.L189
.L188:
	ldr	r3, [r6, #132]
	mov	r0, r5
	cmp	r3, #0
	beq	.L190
	blx	r3
	cmp	r0, #0
	beq	.L190
.L189:
	cmp	r4, #400
	movcc	r0, #0
	movcs	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L196:
	.align	2
.L195:
	.word	g_vdm_hal_fun_ptr
	UNWIND(.fnend)
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	2
	.global	VDMDRV_AvsFirstFldNeedRepair
	.type	VDMDRV_AvsFirstFldNeedRepair, %function
VDMDRV_AvsFirstFldNeedRepair:
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
	cmp	r0, #6
	beq	.L201
.L200:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L201:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L200
	ldr	r3, .L202
	movw	r1, #1752
	mla	r2, r1, r2, r3
	ldr	r3, [r2, #1728]
	cmp	r3, #0
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L203:
	.align	2
.L202:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_AvsFirstFldNeedRepair, .-VDMDRV_AvsFirstFldNeedRepair
	.align	2
	.global	VDMDRV_AvsSecondFldNeedRepair
	.type	VDMDRV_AvsSecondFldNeedRepair, %function
VDMDRV_AvsSecondFldNeedRepair:
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
	cmp	r0, #6
	beq	.L208
.L207:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L208:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L207
	ldr	r3, .L209
	movw	r1, #1752
	mla	r2, r1, r2, r3
	ldr	r3, [r2, #1716]
	cmp	r3, #0
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L210:
	.align	2
.L209:
	.word	.LANCHOR0+888
	UNWIND(.fnend)
	.size	VDMDRV_AvsSecondFldNeedRepair, .-VDMDRV_AvsSecondFldNeedRepair
	.align	2
	.global	VDMDRV_IsMpeg4NvopCopy
	.type	VDMDRV_IsMpeg4NvopCopy, %function
VDMDRV_IsMpeg4NvopCopy:
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
	beq	.L215
	cmp	r0, #2
	ldreqb	r0, [r4, #158]	@ zero_extendqisi2
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L215:
	ldr	r1, .L216
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L217:
	.align	2
.L216:
	.word	.LC13
	UNWIND(.fnend)
	.size	VDMDRV_IsMpeg4NvopCopy, .-VDMDRV_IsMpeg4NvopCopy
	.align	2
	.global	VDMDRV_IsVc1SkpicCopy
	.type	VDMDRV_IsVc1SkpicCopy, %function
VDMDRV_IsVc1SkpicCopy:
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
	beq	.L222
	cmp	r0, #1
	ldreqb	r0, [r4, #1]	@ zero_extendqisi2
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L222:
	ldr	r1, .L223
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L224:
	.align	2
.L223:
	.word	.LC14
	UNWIND(.fnend)
	.size	VDMDRV_IsVc1SkpicCopy, .-VDMDRV_IsVc1SkpicCopy
	.align	2
	.global	VDMDRV_IsVp6NvopCopy
	.type	VDMDRV_IsVp6NvopCopy, %function
VDMDRV_IsVp6NvopCopy:
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
	beq	.L229
	sub	r0, r0, #10
	cmp	r0, #2
	ldrlsb	r0, [r4, #1]	@ zero_extendqisi2
	subls	r0, r0, #1
	clzls	r0, r0
	movls	r0, r0, lsr #5
	movhi	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L229:
	ldr	r1, .L230
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L231:
	.align	2
.L230:
	.word	.LC15
	UNWIND(.fnend)
	.size	VDMDRV_IsVp6NvopCopy, .-VDMDRV_IsVp6NvopCopy
	.align	2
	.global	VDMDRV_IsVp9RptFrmCopy
	.type	VDMDRV_IsVp9RptFrmCopy, %function
VDMDRV_IsVp9RptFrmCopy:
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
	beq	.L236
	cmp	r0, #17
	addeq	r0, r4, #262144
	ldreqb	r0, [r0, #1028]	@ zero_extendqisi2
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L236:
	ldr	r1, .L237
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L238:
	.align	2
.L237:
	.word	.LC16
	UNWIND(.fnend)
	.size	VDMDRV_IsVp9RptFrmCopy, .-VDMDRV_IsVp9RptFrmCopy
	.align	2
	.global	VDMDRV_IsCopy
	.type	VDMDRV_IsCopy, %function
VDMDRV_IsCopy:
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
	beq	.L247
	sub	r0, r0, #1
	cmp	r0, #11
	ldrls	pc, [pc, r0, asl #2]
	b	.L246
.L243:
	.word	.L245
	.word	.L244
	.word	.L246
	.word	.L246
	.word	.L246
	.word	.L246
	.word	.L246
	.word	.L246
	.word	.L246
	.word	.L245
	.word	.L245
	.word	.L245
.L245:
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L244:
	ldrb	r0, [r4, #158]	@ zero_extendqisi2
	sub	r0, r0, #1
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L246:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L247:
	ldr	r1, .L248
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L249:
	.align	2
.L248:
	.word	.LC17
	UNWIND(.fnend)
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	2
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
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
	ldr	r3, .L269
	mov	r5, r0
	mov	r4, r1
	mov	r6, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [fp, #-252]
	beq	.L251
	ldr	r3, .L269+4
	sub	r0, fp, #232
	mov	r2, #188
	mov	r1, #0
	str	r0, [fp, #-252]
	ldr	r3, [r3, #48]
	blx	r3
.L251:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L266
	mov	r3, r5, asl #3
	mov	r0, r4
	str	r3, [fp, #-248]
	mov	r7, r5, asl #6
	mov	r8, r3
	bl	VCTRL_GetVidStd
	ldr	r3, .L269+8
	rsb	r8, r8, r7
	ldr	r9, .L269+12
	ldr	r3, [r3]
	add	r8, r9, r8
	add	r8, r8, #8
	cmp	r3, #0
	str	r0, [r8, #4]
	mov	r2, r0
	beq	.L254
	ldr	r1, [r6]
	sub	r0, fp, #244
	str	r4, [fp, #-244]
	str	r2, [fp, #-240]
	str	r1, [fp, #-236]
	blx	r3
	cmp	r0, #1
	mov	r10, r0
	beq	.L253
	ldr	r2, [r8, #4]
.L254:
	ldr	r3, [fp, #-248]
	mov	r0, r2
	ldr	r1, [r6]
	rsb	r8, r3, r7
	bl	VDMDRV_IsCopy
	add	r8, r9, r8
	add	r3, r8, #4
	str	r3, [fp, #-256]
	subs	r10, r0, #0
	bne	.L267
	ldr	r0, [r8, #12]
	ldr	r1, [r6]
	bl	VCTRL_IsSedOnlyMode
	cmp	r0, #0
	streq	r10, [r8, #52]
	movne	r3, #1
	strne	r3, [r8, #52]
	ldr	r3, .L269+16
	ldr	r8, [r3, #128]
	cmp	r8, #0
	beq	.L260
	ldr	r3, [fp, #-248]
	mov	r2, r5
	ldr	r1, [r6]
	rsb	r3, r3, r7
	add	r6, r9, r3
	ldr	r3, [fp, #-252]
	ldr	r0, [r6, #12]
	blx	r8
	subs	r8, r0, #0
	beq	.L268
.L260:
	ldr	r1, .L269+20
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r2, [fp, #-256]
	mov	r1, #2
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [fp, #-248]
	mov	r0, r4
	mov	r2, #0
	rsb	r7, r3, r7
	mov	r3, r5
	add	r7, r9, r7
	add	r4, r4, #64
	ldr	r1, [r7, #4]
	add	r9, r9, r4, lsl #2
	bl	VCTRL_VdmPostProc
	ldr	r3, .L269+4
	mov	r0, r7
	mov	r2, #56
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	mov	r3, #0
	str	r3, [r9, #68]
.L253:
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L267:
	mov	r0, r6
	ldr	r3, [r8, #12]
	ldr	r2, [fp, #-252]
	mov	r1, r5
	bl	PostPro_CopyYuvByProtocol
	subs	r10, r0, #0
	movne	r10, #0
	bne	.L253
	ldr	r2, [fp, #-256]
	mov	r1, r10
	mov	r0, r5
	bl	VDMDRV_AdjustErrRatio
	ldr	r2, [fp, #-252]
	mov	r1, r5
	mov	r0, #2
	bl	VDMDRV_StartRepair
	ldr	r3, .L269+4
	add	r5, r5, #1
	ldr	r3, [r3]
	blx	r3
	ldr	r3, .L269+24
	ldr	r1, .L269+12
	add	r7, r3, r7
	add	r1, r1, r4, lsl #2
	str	r5, [r1, #324]
	mov	r2, r0
	mov	r0, r4
	str	r2, [r8, #20]
	str	r2, [r7, #4]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldr	r3, .L269+12
	mov	r0, r4
	movw	lr, #757
	add	r2, r3, #2640
	mov	r1, #7
	add	r2, r2, r4, lsl #2
	ldr	r3, .L269+28
	str	lr, [sp]
	bl	RecordPOS
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L268:
	ldr	r1, [fp, #-252]
	mov	r0, r5
	bl	VDMDRV_StartDec
	ldr	r3, .L269+4
	add	r5, r5, #1
	mov	r10, r8
	ldr	r3, [r3]
	blx	r3
	ldr	r3, .L269+24
	ldr	r1, .L269+12
	add	r7, r3, r7
	add	r1, r1, r4, lsl #2
	str	r5, [r1, #324]
	mov	r2, r0
	mov	r0, r4
	str	r2, [r6, #20]
	str	r2, [r7, #4]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldr	r3, .L269+12
	mov	r0, r4
	mov	lr, #792
	add	r2, r3, #2640
	mov	r1, #5
	add	r2, r2, r4, lsl #2
	ldr	r3, .L269+28
	str	lr, [sp]
	bl	RecordPOS
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L266:
	mov	r2, r4
	ldr	r1, .L269+32
	mov	r0, #22
	mov	r10, #1
	bl	dprint_vfmw
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L270:
	.align	2
.L269:
	.word	g_HalDisable
	.word	vfmw_Osal_Func_Ptr_S
	.word	AcceleratorCharacter
	.word	.LANCHOR0
	.word	g_vdm_hal_fun_ptr
	.word	.LC19
	.word	g_VfmwGlobalStat
	.word	.LANCHOR1+44
	.word	.LC18
	UNWIND(.fnend)
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	2
	.global	VDMDRV_ActivateVDH
	.type	VDMDRV_ActivateVDH, %function
VDMDRV_ActivateVDH:
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
	ldr	r9, .L277
	mov	r5, r0, asl #6
	ldr	r6, .L277+4
	sub	r5, r5, r0, asl #3
	mov	r8, r0
	mov	r0, #5
	ldr	r3, [r9, #12]
	add	r7, r5, #48
	blx	r3
	ldr	r3, [r6, #196]
	add	r7, r6, r7
	cmp	r3, #0
	blt	.L272
	add	r5, r6, r5
	add	r4, r6, #196
	add	r6, r6, #320
	b	.L273
.L276:
	cmp	r4, r6
	beq	.L272
	ldr	r3, [r4, #4]!
	cmp	r3, #0
	blt	.L272
.L273:
	mov	r1, r3
	mov	r2, r7
	mov	r0, r8
	str	r3, [r5, #8]
	bl	VDMDRV_ChnDecReady
	cmp	r0, #0
	bne	.L276
	mov	r2, r7
	ldr	r1, [r5, #8]
	mov	r0, r8
	bl	VDMDRV_DoBeforeDec
	cmp	r0, #0
	bne	.L276
.L272:
	ldr	r3, [r9, #16]
	mov	r0, #5
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L278:
	.align	2
.L277:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	2
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 360
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #372)
	sub	sp, sp, #372
	ldr	r8, .L331
	str	r1, [fp, #-392]
	mov	r7, r0
	mov	r2, #148
	mov	r1, #0
	ldr	r3, [r8, #48]
	sub	r0, fp, #380
	blx	r3
	ldr	r3, .L331+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L280
	sub	r4, fp, #232
	ldr	r3, [r8, #48]
	mov	r2, #188
	mov	r1, #0
	mov	r0, r4
	blx	r3
	str	r4, [fp, #-240]
.L280:
	mov	r3, r7, asl #3
	ldr	r5, .L331+8
	mov	r6, r7, asl #6
	str	r3, [fp, #-396]
	rsb	r10, r3, r6
	mov	r2, #136
	add	r4, r5, r10
	ldr	r3, [r8, #48]
	mov	r1, #0
	sub	r0, fp, #376
	blx	r3
	ldr	r2, [r4, #8]
	add	ip, r4, #8
	str	ip, [fp, #-400]
	ldr	ip, .L331+12
	add	r9, r4, #24
	ldr	r1, [r4, #4]
	mov	r0, #2
	ldrb	lr, [fp, #-392]	@ zero_extendqisi2
	ldr	ip, [ip, r2, asl #2]
	ldr	r3, [r9, #4]
	ldr	r2, [r5, r10]
	ldr	ip, [ip, #1168]
	str	r1, [sp]
	ldr	r1, .L331+16
	strb	lr, [fp, #-236]
	str	ip, [fp, #-380]
	bl	dprint_vfmw
	ldr	r3, [r5, r10]
	ldr	r10, .L331
	cmp	r3, #2
	beq	.L282
	cmp	r3, #3
	beq	.L283
	cmp	r3, #1
	beq	.L321
	ldr	r1, [fp, #-392]
	mov	r0, #0
	ldr	r2, [r4, #8]
	str	r1, [sp]
	ldr	r1, .L331+20
	bl	dprint_vfmw
	ldr	r3, [r4, #8]
	mov	r2, #0
	add	r3, r3, #64
	add	r5, r5, r3, lsl #2
	str	r2, [r5, #68]
.L279:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L321:
	ldr	r3, [r9, #4]
	add	r10, r4, #4
	cmp	r3, #1
	beq	.L322
	mov	r2, r10
	mov	r1, #3
	mov	r0, r7
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L286
	ldr	r2, .L331+24
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L286
	sub	r2, fp, #44
	ldr	r0, [r4, #8]
	mov	r1, #114
	str	r3, [r2, #-340]!
	mov	r3, #4
	blx	ip
.L286:
	ldr	r3, [fp, #-380]
	cmp	r3, #1
	beq	.L323
.L287:
	ldr	r3, [fp, #-396]
	ldr	r2, .L331+12
	rsb	r4, r3, r6
	ldr	r3, .L331+8
	add	r4, r5, r4
	add	r9, r4, #8
	ldr	r0, [r4, #8]
	ldr	r2, [r2, r0, asl #2]
	add	r2, r2, #311296
	ldrb	r2, [r2, #3464]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r1, [r4, #4]
	bne	.L324
.L298:
	ldr	r3, [fp, #-380]
	cmp	r3, #1
	bne	.L290
	ldr	r3, [fp, #-396]
	ldr	r4, .L331+8
	rsb	r6, r3, r6
	add	r5, r5, r6
	ldr	r3, [r5, #44]
	cmp	r3, #2
	beq	.L325
	sub	r2, fp, #376
	mov	r3, r7
	bl	VCTRL_VdmPostProc
	ldr	r0, [r5, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r5, #8]
	mov	ip, #0
	ldr	r6, [r8, #48]
	add	r3, r3, #64
	mov	r0, r5
	mov	r1, ip
	mov	r2, #56
	add	r4, r4, r3, lsl #2
	str	ip, [r4, #68]
	blx	r6
	mov	r0, r7
	bl	VDMDRV_ActivateVDH
	b	.L279
.L283:
	sub	r2, fp, #376
	mov	r3, r7
	ldr	r1, [r4, #4]
	mov	r6, #0
	ldr	r0, [r4, #8]
	str	r6, [r9, #4]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	ldr	ip, [r10, #48]
	mov	r1, r6
	add	r3, r3, #64
	mov	r2, #56
	mov	r0, r4
	add	r5, r5, r3, lsl #2
	str	r6, [r5, #68]
	blx	ip
	mov	r0, r7
	bl	VDMDRV_ActivateVDH
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L282:
	ldr	r3, [fp, #-400]
	add	r10, r4, #4
	ldr	r1, [r4, #48]
	ldr	r0, [r3, #4]
	mov	r3, #0
	str	r3, [r9, #4]
	cmp	r0, #6
	beq	.L326
.L295:
	bl	VDMDRV_IsCopy
	subs	r4, r0, #0
	bne	.L327
	ldr	r3, [fp, #-396]
	sub	r2, fp, #376
	rsb	r6, r3, r6
	mov	r3, r7
	add	r6, r5, r6
	ldr	r1, [r6, #4]
	ldr	r0, [r6, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r6, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r6, #8]
	ldr	ip, [r8, #48]
	mov	r0, r6
	mov	r1, r4
	mov	r2, #56
	add	r5, r5, r3, lsl #2
	str	r4, [r5, #324]
	blx	ip
	mov	r0, r7
	bl	VDMDRV_ActivateVDH
	b	.L279
.L322:
	str	r3, [fp, #-392]
	mov	r2, r7
	ldr	r3, [fp, #-400]
	ldr	r1, [r4, #48]
	ldr	r0, [r3, #4]
	bl	PostPro_SetFullRepair
	ldr	r3, [fp, #-392]
	mov	r2, r10
	mov	r0, r7
	mov	r1, r3
	bl	VDMDRV_AdjustErrRatio
	mov	r3, #0
	mov	r0, r3
	ldrb	r2, [fp, #-236]	@ zero_extendqisi2
	ldr	r1, .L331+28
	str	r3, [r9, #4]
	bl	dprint_vfmw
	b	.L286
.L326:
	ldrb	r2, [r1, #17]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L295
	movw	r3, #1752
	mla	r3, r3, r7, r5
	ldr	r3, [r3, #2604]
	cmp	r3, #0
	ble	.L295
	ldr	r3, .L331+32
	ldr	ip, [r3, #140]
	cmp	ip, #0
	beq	.L297
	ldr	lr, [fp, #-240]
	mov	r3, r7
	str	lr, [sp]
	blx	ip
	cmp	r0, #0
	bne	.L297
	mov	r1, r7
	ldr	r2, [fp, #-240]
	mov	r0, #3
	bl	VDMDRV_StartRepair
	ldr	r2, .L331+36
	ldr	r0, [r4, #8]
	movw	ip, #995
	ldr	r3, .L331+40
	mov	r1, #7
	add	r2, r6, r2
	str	ip, [sp]
	bl	RecordPOS
	b	.L279
.L324:
	ldr	r1, [r4, #48]
	ldr	r0, [r9, #4]
	str	r3, [fp, #-392]
	bl	PostPro_GetRepairStratage
	ldr	r1, [r4, #4]
	ldr	r3, [fp, #-392]
	cmp	r1, #0
	cmpne	r0, #1
	moveq	r2, #1
	movne	r2, #0
	beq	.L328
	ldr	r0, [r9, #4]
	ldr	r1, [r4, #48]
	cmp	r0, #6
	beq	.L329
.L303:
	mov	r4, #2
.L293:
	ldr	r3, .L331+32
	ldr	ip, [r3, #140]
	cmp	ip, #0
	beq	.L297
	ldr	lr, [fp, #-240]
	mov	r3, r7
	str	lr, [sp]
	blx	ip
	cmp	r0, #0
	beq	.L330
.L297:
	ldr	r3, [fp, #-396]
	mov	r2, r10
	mov	r0, r7
	mov	r1, #2
	rsb	r6, r3, r6
	bl	VDMDRV_AdjustErrRatio
	add	r4, r5, r6
	mov	r3, r7
	sub	r2, fp, #376
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	VCTRL_VdmPostProc
	ldr	r0, [r4, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r4, #8]
	mov	r2, #0
	str	r2, [r5, r6]
	add	r3, r3, #64
	add	r5, r5, r3, lsl #2
	str	r2, [r5, #68]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L290:
	mov	r3, r7
	sub	r2, fp, #376
	bl	VCTRL_VdmPostProc
	ldr	r3, [fp, #-396]
	rsb	r6, r3, r6
	add	r6, r5, r6
.L319:
	ldr	r0, [r6, #8]
	bl	VCTRL_ClearDecparam
	ldr	r3, [r6, #8]
	mov	ip, #0
	mov	r2, #56
	add	r3, r3, #64
	mov	r1, ip
	ldr	r4, [r8, #48]
	mov	r0, r6
	add	r5, r5, r3, lsl #2
	str	ip, [r5, #68]
	blx	r4
	mov	r0, r7
	bl	VDMDRV_ActivateVDH
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L327:
	mov	r2, r10
	mov	r0, r7
	mov	r1, #0
	bl	VDMDRV_AdjustErrRatio
	ldr	r3, [fp, #-396]
	sub	r2, fp, #376
	rsb	r6, r3, r6
	mov	r3, r7
	add	r6, r5, r6
	ldr	r1, [r6, #4]
	ldr	r0, [r6, #8]
	bl	VCTRL_VdmPostProc
	b	.L319
.L323:
	mov	r2, r10
	mov	r1, #0
	mov	r0, r7
	bl	VDMDRV_AdjustErrRatio
	b	.L287
.L325:
	mov	r3, r7
	sub	r2, fp, #376
	bl	VCTRL_VdmPostProc
	b	.L279
.L329:
	ldrb	ip, [r1, #17]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L303
	movw	r2, #1752
	mla	r3, r2, r7, r3
	ldr	r3, [r3, #2604]
	cmp	r3, #0
	movgt	r2, #1
	movle	r2, #0
	movle	r4, #2
	movgt	r4, #3
	b	.L293
.L330:
	mov	r1, r7
	mov	r0, r4
	ldr	r2, [fp, #-240]
	bl	VDMDRV_StartRepair
	ldr	r3, [fp, #-396]
	ldr	r2, .L331+36
	mov	r1, #964
	rsb	r3, r3, r6
	add	r5, r5, r3
	add	r2, r6, r2
	ldr	r3, .L331+44
	ldr	r0, [r5, #8]
	str	r1, [sp]
	mov	r1, #7
	bl	RecordPOS
	b	.L279
.L328:
	ldr	r0, [r4, #8]
	b	.L298
.L332:
	.align	2
.L331:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HalDisable
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LC20
	.word	.LC22
	.word	g_event_report
	.word	.LC21
	.word	g_vdm_hal_fun_ptr
	.word	g_VfmwGlobalStat+4
	.word	.LANCHOR1+96
	.word	.LANCHOR1+64
	UNWIND(.fnend)
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	2
	.global	VDMDRV_CheckDevice
	.type	VDMDRV_CheckDevice, %function
VDMDRV_CheckDevice:
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
	ldr	r4, .L367
	mov	r7, r0, asl #3
	mov	r5, r0, asl #6
	mov	r6, r0
	rsb	r8, r7, r5
	add	r9, r4, r8
	ldr	r0, [r9, #8]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L363
.L334:
	rsb	r3, r7, r5
	add	r8, r4, r3
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L364
.L335:
	add	r4, r4, r6, lsl #2
	ldr	r0, [r4, #56]
	cmp	r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	cmp	r0, #1
	beq	.L365
.L340:
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L364:
	ldr	r3, .L367+4
	ldr	r3, [r3]
	blx	r3
	add	r2, r8, #16
	ldr	r3, [r2, #4]
	str	r0, [r8, #24]
	cmp	r0, r3
	bcc	.L338
	clz	r9, r3
	rsb	r3, r3, r0
	mov	r9, r9, lsr #5
	orrs	r9, r9, r3, lsr #31
	bne	.L338
	cmp	r3, #1000
	bls	.L340
	ldr	r2, [r8, #8]
	mov	r0, #1
	ldr	r1, .L367+8
	bl	dprint_vfmw
	ldr	r3, .L367+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L343
	ldr	r0, [r8, #8]
	mov	r3, r9
	mov	r2, r9
	mov	r1, #101
	blx	ip
.L343:
	ldr	r3, .L367+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L344
	mov	r1, r6
	mov	r0, #1
	bl	VDH_Reset_Module
.L345:
	rsb	r3, r7, r5
	mov	r5, #1
	add	r4, r4, r3
	ldr	r2, .L367
	add	lr, r4, #32
	add	ip, r4, #24
	ldr	r1, [r4, #36]
	str	r5, [r4, #28]
	cmp	r1, r5
	bne	.L347
	ldr	r4, [r4, #8]
	mov	r1, #0
	str	r1, [lr, #4]
	mov	r0, r1
	add	lr, r4, #64
	str	r1, [r2, r3]
	str	r1, [ip, #4]
	add	r2, r2, lr, lsl #2
	str	r1, [r2, #68]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L338:
	str	r0, [r2, #4]
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L365:
	mov	r3, #2
	str	r3, [r4, #56]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L363:
	ldr	r3, [r4, r8]
	cmp	r3, #0
	beq	.L335
	ldr	r2, .L367+20
	ldr	r2, [r2, #136]
	cmp	r2, #0
	beq	.L336
	mov	r0, r6
	blx	r2
	ldr	r3, [r4, r8]
	cmp	r0, #0
	bne	.L366
.L336:
	rsb	r10, r7, r5
	ldr	r1, .L367+24
	add	r9, r4, r10
	mov	r0, #1
	mov	r8, #0
	ldr	r2, [r9, #8]
	bl	dprint_vfmw
	ldr	r2, [r4, r10]
	movw	r1, #1133
	ldr	r0, .L367+28
	str	r8, [r9, #36]
	bl	DBG_AddTrace
	ldr	r3, .L367+4
	mov	r0, r9
	mov	r1, r8
	mov	r2, #56
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r9, #8]
	add	r3, r3, #64
	add	r3, r4, r3, lsl #2
	str	r8, [r3, #68]
	b	.L334
.L347:
	mov	r0, r6
	mov	r1, #0
	bl	VDMDRV_AfterDec
	mov	r0, r5
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L344:
	ldr	r3, .L367+20
	ldr	r3, [r3, #80]
	cmp	r3, #0
	beq	.L346
	mov	r0, r6
	blx	r3
	b	.L345
.L366:
	mov	r0, #1
	ldr	r2, [r9, #8]
	ldr	r1, .L367+32
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r9, #36]
	b	.L334
.L346:
	mov	r0, r3
	movw	r2, #1165
	ldr	r1, .L367+36
	bl	dprint_vfmw
	b	.L345
.L368:
	.align	2
.L367:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC25
	.word	g_event_report
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC24
	.word	.LANCHOR1+128
	.word	.LC23
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
	.align	2
	.global	VDMDRV_WakeUpVdm
	.type	VDMDRV_WakeUpVdm, %function
VDMDRV_WakeUpVdm:
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
	bl	VDMDRV_CheckDevice
	cmp	r0, #0
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMDRV_ActivateVDH
	UNWIND(.fnend)
	.size	VDMDRV_WakeUpVdm, .-VDMDRV_WakeUpVdm
	.global	__aeabi_uidiv
	.align	2
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
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
	subs	r4, r0, #0
	ble	.L372
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L452
	ldr	r1, .L452+4
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L372:
	ldr	r8, .L452+8
	mov	r0, #9
	bl	VCTRL_RecordPosTime
	mov	r5, r4, asl #3
	mov	r0, #0
	mov	r7, r4, asl #6
	ldr	r3, [r8, #12]
	ldr	r6, .L452+12
	blx	r3
	rsb	r3, r5, r7
	add	r3, r6, r3
	ldr	r0, [r3, #8]
	cmp	r0, #0
	blt	.L407
	ldr	r10, .L452+16
	ldr	r3, [r10, r0, asl #2]
	cmp	r3, #0
	beq	.L407
	ldr	r9, .L452+20
	ldr	r2, [r3, #1168]
	ldr	r3, [r9, #160]
	cmp	r3, #0
	beq	.L379
	mov	r1, r4
	mov	r0, #2
	str	r2, [fp, #-48]
	blx	r3
	ldr	r2, [fp, #-48]
	cmp	r0, #0
	bne	.L378
.L379:
	cmp	r2, #1
	beq	.L441
.L377:
	rsb	r3, r5, r7
	add	r3, r6, r3
	ldr	r0, [r3, #8]
.L407:
	rsb	r5, r5, r7
	mov	r3, #0
	str	r3, [r6, r5]
	bl	VCTRL_InformVdmFree
	ldr	r3, .L452+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L380
	mov	r1, r4
	mov	r0, #1
	bl	VDH_Notify_ModuleIdle
.L380:
	ldr	r3, [r8, #16]
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3
.L441:
	ldr	r3, [r9, #164]
	cmp	r3, #0
	beq	.L377
	mov	r1, r4
	mov	r0, #2
	blx	r3
	cmp	r0, #0
	beq	.L442
.L378:
	rsb	r3, r5, r7
	add	r3, r6, r3
	ldr	r3, [r3, #8]
	cmp	r3, #0
	blt	.L383
	ldr	r3, [r10, r3, asl #2]
	cmp	r3, #0
	beq	.L383
	ldr	r2, [r9, #164]
	ldr	r10, [r3, #1168]
	cmp	r2, #0
	beq	.L384
	mov	r1, r4
	mov	r0, #1
	blx	r2
	mov	r2, r0
.L384:
	ldr	r3, [r9, #160]
	cmp	r3, #0
	beq	.L385
	mov	r1, r4
	mov	r0, #1
	str	r2, [fp, #-48]
	blx	r3
	cmp	r10, #1
	ldr	r2, [fp, #-48]
	beq	.L443
.L383:
	mov	r3, #1
	str	r3, [fp, #-48]
.L382:
	ldr	r3, [r9, #148]
	cmp	r3, #0
	beq	.L389
	mov	r0, r4
	blx	r3
.L390:
	ldr	r3, [r9, #92]
	cmp	r3, #0
	beq	.L391
	mov	r0, r4
	blx	r3
.L392:
	rsb	r0, r5, r7
	ldr	r2, .L452+28
	add	r0, r6, r0
	movw	ip, #1463
	mov	r1, #6
	ldr	r3, .L452+32
	ldr	r0, [r0, #8]
	ldr	r10, .L452+36
	str	ip, [sp]
	add	r2, r2, r0, lsl #2
	bl	RecordPOS
	ldr	r3, [r8]
	blx	r3
	add	r1, r10, r7
	ldr	r3, [r1, #4]
	cmp	r3, #0
	beq	.L394
	ldr	r9, [r10, r4, asl #6]
	add	r2, r9, #499712
	add	r2, r2, #288
	cmp	r3, r2
	add	r2, r10, r7
	strhi	r3, [r10, r4, asl #6]
	ldrls	lr, [r1, #8]
	mov	r1, #180
	mla	r1, r1, r4, r6
	movhi	r9, r3
	rsb	r3, r3, r0
	movhi	lr, #0
	rsb	r9, r9, r0
	add	r3, r3, lr
	str	r3, [fp, #-52]
	cmp	r9, #1000
	str	r3, [r2, #8]
	ldr	r3, [r1, #732]
	mov	r1, #0
	ldr	ip, [r2, #28]
	ldr	r0, [r2, #32]
	add	ip, ip, #1
	str	r1, [r2, #4]
	add	r3, r0, r3, lsr #10
	str	ip, [r2, #28]
	ldr	r1, .L452+12
	str	r3, [r2, #32]
	bcc	.L394
	rsb	r0, r5, r7
	add	r1, r1, r0
	ldr	r1, [r1, #16]
	cmp	r1, #0
	ldreq	r0, [r2, #12]
	bne	.L444
.L399:
	str	r3, [fp, #-60]
	mov	r3, #1000
	mov	r1, r9
	str	ip, [fp, #-64]
	mul	r0, r3, r0
	bl	__aeabi_uidiv
	add	r2, r10, r7
	str	r2, [fp, #-56]
	mov	r3, #1000
	mov	r1, r9
	str	r0, [r2, #20]
	ldr	r2, [fp, #-52]
	mul	r0, r3, r2
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-64]
	mov	r3, #1000
	mov	r1, r9
	str	r2, [fp, #-52]
	str	r0, [r2, #16]
	mul	r0, r3, ip
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-60]
	str	r9, [r2, #40]
	str	r3, [r2, #36]
	mov	r3, #0
	str	r3, [r2, #32]
	str	r3, [r10, r4, asl #6]
	str	r3, [r2, #28]
	str	r0, [r2, #24]
.L394:
	rsb	r3, r5, r7
	ldr	r0, .L452+12
	add	r1, r6, r3
	add	r10, r1, #32
	ldr	r2, [r1, #36]
	ldr	r9, [r1, #8]
	cmp	r2, #1
	beq	.L445
	ldr	r2, [r1, #52]
	cmp	r2, #1
	beq	.L446
	ldr	r2, [r0, r3]
	cmp	r2, #0
	beq	.L403
	ldr	r10, [r1, #48]
	cmp	r10, #0
	beq	.L447
.L403:
	mov	r0, r9
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L448
	mov	r0, r9
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L449
	mov	r1, #1
	mov	r0, r4
	bl	VDMDRV_AfterDec
.L410:
	rsb	r5, r5, r7
	add	r5, r6, r5
	ldr	r0, [r5, #8]
	bl	VCTRL_InformVdmFree
	ldr	r3, [fp, #-48]
	cmp	r3, #1
	beq	.L450
.L406:
	ldr	r3, [r8, #16]
	mov	r0, #0
	blx	r3
	mov	r3, #180
	mla	r4, r3, r4, r6
	mov	r0, #1
	ldr	r1, [r4, #732]
	bl	VCTRL_RecordData
	mov	r0, #10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L448:
	mov	r3, r9
	movw	r2, #1412
	ldr	r1, .L452+40
	mov	r0, #0
	bl	dprint_vfmw
.L401:
	rsb	r3, r5, r7
	mov	r2, #0
	add	r1, r6, r3
	str	r2, [r6, r3]
	ldr	r3, [r1, #8]
	add	r3, r3, #64
	add	r3, r6, r3, lsl #2
	str	r2, [r3, #68]
	b	.L410
.L443:
	sub	r1, r0, #1
	sub	r3, r2, #1
	clz	r1, r1
	clz	r3, r3
	mov	r1, r1, lsr #5
	mov	r3, r3, lsr #5
	tst	r1, r3
	bne	.L388
	cmp	r0, #0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L408
	cmp	r2, #0
	movne	r2, #0
	andeq	r2, r1, #1
	cmp	r2, #0
	beq	.L383
	rsb	r3, r5, r7
	add	r3, r6, r3
	add	r3, r3, #40
	ldr	r2, [r3, #4]
	cmp	r2, #2
	beq	.L451
.L388:
	rsb	r3, r5, r7
	mov	r2, #1
	add	r3, r6, r3
	str	r2, [fp, #-48]
	str	r2, [r3, #44]
	b	.L382
.L385:
	cmp	r10, #1
	bne	.L383
	cmp	r2, #1
	bne	.L383
.L408:
	rsb	r3, r5, r7
	mov	r2, #2
	add	r3, r6, r3
	mov	r1, #0
	str	r1, [fp, #-48]
	str	r2, [r3, #44]
	b	.L382
.L444:
	mov	r0, r3
	str	r2, [fp, #-64]
	str	ip, [fp, #-60]
	str	r3, [fp, #-56]
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-64]
	ldr	ip, [fp, #-60]
	ldr	r3, [fp, #-56]
	str	r0, [r2, #12]
	b	.L399
.L391:
	mov	r0, r3
	movw	r2, #1461
	ldr	r1, .L452+44
	bl	dprint_vfmw
	b	.L392
.L389:
	mov	r0, r3
	movw	r2, #1459
	ldr	r1, .L452+44
	bl	dprint_vfmw
	b	.L390
.L450:
	ldr	r3, .L452+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L406
	ldr	r0, [fp, #-48]
	mov	r1, r4
	bl	VDH_Notify_ModuleIdle
	b	.L406
.L445:
	movw	r2, #1383
	ldr	r1, .L452+48
	mov	r0, #0
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r10, #4]
	b	.L401
.L446:
	mov	r0, r9
	mov	r1, r4
	bl	VCTRL_VdmProcSedOnly
	b	.L401
.L449:
	mov	r3, r9
	movw	r2, #1418
	ldr	r1, .L452+52
	bl	dprint_vfmw
	b	.L401
.L447:
	ldr	r1, .L452+56
	mov	r0, r10
	bl	dprint_vfmw
	mov	r0, r9
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L401
	mov	r2, r10
	mov	r0, r9
	mov	r3, r4
	mov	r1, #100
	bl	VCTRL_VdmPostProc
	b	.L401
.L451:
	mov	r2, #3
	str	r10, [fp, #-48]
	str	r2, [r3, #4]
	b	.L382
.L442:
	mov	r3, #56
	mla	r3, r3, r4, r6
	ldr	r0, [r3, #8]
	b	.L407
.L453:
	.align	2
.L452:
	.word	.LANCHOR1+148
	.word	.LC26
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	g_vdm_hal_fun_ptr
	.word	g_HalDisable
	.word	.LANCHOR0+2768
	.word	.LANCHOR1+168
	.word	g_VfmwGlobalStat
	.word	.LC29
	.word	.LC4
	.word	.LC27
	.word	.LC30
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	2
	.global	VDMDRV_ResetVDH
	.type	VDMDRV_ResetVDH, %function
VDMDRV_ResetVDH:
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
	ldr	r4, .L459
	ldr	r3, [r4, #8]
	cmp	r3, r0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L459+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L456
	mov	r1, #0
	mov	r0, #1
	bl	VDH_Reset_Module
.L457:
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L456:
	ldr	r3, .L459+8
	ldr	r3, [r3, #80]
	cmp	r3, #0
	beq	.L458
	mov	r0, #0
	blx	r3
	b	.L457
.L458:
	mov	r0, r3
	movw	r2, #1810
	ldr	r1, .L459+12
	bl	dprint_vfmw
	b	.L457
.L460:
	.align	2
.L459:
	.word	.LANCHOR0
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC4
	UNWIND(.fnend)
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	2
	.global	VDMDRV_MarkReloadDsp
	.type	VDMDRV_MarkReloadDsp, %function
VDMDRV_MarkReloadDsp:
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
	subs	lr, r0, #0
	mov	ip, r1
	bne	.L461
	add	r3, r1, #1
	cmp	r3, #32
	bhi	.L461
	ldr	r3, .L468
	cmn	r1, #1
	mov	r2, #1
	str	r2, [r3, #40]
	beq	.L461
	ldr	r4, .L468+4
	mvn	r5, #0
	mov	r3, #1840
	ldr	r2, .L468+8
	ldr	r1, .L468+12
	mov	r0, #22
	ldr	ip, [r4, ip, asl #2]
	str	r5, [ip, #28]
	ldr	ip, [r4]
	ldr	ip, [ip, #28]
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_vfmw
.L461:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L469:
	.align	2
.L468:
	.word	.LANCHOR0
	.word	s_pstVfmwChan
	.word	.LANCHOR1+188
	.word	.LC31
	UNWIND(.fnend)
	.size	VDMDRV_MarkReloadDsp, .-VDMDRV_MarkReloadDsp
	.align	2
	.global	VDMDRV_UpdateMatchMode
	.type	VDMDRV_UpdateMatchMode, %function
VDMDRV_UpdateMatchMode:
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
	cmp	r0, #0
	mov	ip, r1
	bne	.L470
	cmp	r1, #31
	bls	.L472
.L470:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L472:
	ldr	lr, .L473
	mov	r5, #1
	movw	r3, #1853
	ldr	r2, .L473+4
	ldr	r1, .L473+8
	mov	r0, #22
	ldr	r4, [lr, ip, asl #2]
	str	r5, [r4, #28]
	ldr	lr, [lr, ip, asl #2]
	str	ip, [sp, #4]
	ldr	ip, [lr, #28]
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L474:
	.align	2
.L473:
	.word	s_pstVfmwChan
	.word	.LANCHOR1+212
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMDRV_UpdateMatchMode, .-VDMDRV_UpdateMatchMode
	.global	g_VdmExtParam
	.global	g_DspDrvState
	.global	g_VdmDrvParam
	.global	USE_FF_APT_EN
	.global	g_ChanCtx
	.global	g_BackUp
	.global	g_DecReport
	.global	g_RepairParam
	.global	g_HwMem
	.global	g_UpMsg
	.global	CapItem
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.14526, %object
	.size	__func__.14526, 23
__func__.14526:
	.ascii	"VDMDRV_CheckAttachMode\000"
	.space	1
	.type	__func__.14532, %object
	.size	__func__.14532, 19
__func__.14532:
	.ascii	"VDMDRV_ChnDecReady\000"
	.space	1
	.type	__FUNCTION__.14573, %object
	.size	__FUNCTION__.14573, 19
__FUNCTION__.14573:
	.ascii	"VDMDRV_DoBeforeDec\000"
	.space	1
	.type	__FUNCTION__.14610, %object
	.size	__FUNCTION__.14610, 29
__FUNCTION__.14610:
	.ascii	"VDMDRV_AfterDecProcessNormal\000"
	.space	3
	.type	__FUNCTION__.14622, %object
	.size	__FUNCTION__.14622, 29
__FUNCTION__.14622:
	.ascii	"VDMDRV_AfterDecProcessRepair\000"
	.space	3
	.type	__FUNCTION__.14660, %object
	.size	__FUNCTION__.14660, 19
__FUNCTION__.14660:
	.ascii	"VDMDRV_CheckDevice\000"
	.space	1
	.type	__func__.14704, %object
	.size	__func__.14704, 18
__func__.14704:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__FUNCTION__.14705, %object
	.size	__FUNCTION__.14705, 18
__FUNCTION__.14705:
	.ascii	"VDMDRV_IsrProcess\000"
	.space	2
	.type	__func__.14794, %object
	.size	__func__.14794, 21
__func__.14794:
	.ascii	"VDMDRV_MarkReloadDsp\000"
	.space	3
	.type	__func__.14799, %object
	.size	__func__.14799, 23
__func__.14799:
	.ascii	"VDMDRV_UpdateMatchMode\000"
	.data
	.align	2
	.type	USE_FF_APT_EN, %object
	.size	USE_FF_APT_EN, 4
USE_FF_APT_EN:
	.word	1
	.type	CapItem, %object
	.size	CapItem, 924
CapItem:
	.word	176
	.word	144
	.word	4
	.word	10
	.word	11
	.word	12
	.word	524288
	.word	352
	.word	288
	.word	4
	.word	10
	.word	11
	.word	12
	.word	786432
	.word	720
	.word	576
	.word	4
	.word	10
	.word	11
	.word	12
	.word	1048576
	.word	1280
	.word	736
	.word	4
	.word	10
	.word	11
	.word	12
	.word	2097152
	.word	1920
	.word	1088
	.word	4
	.word	10
	.word	11
	.word	12
	.word	3145728
	.word	176
	.word	144
	.word	15
	.word	19
	.word	22
	.word	24
	.word	524288
	.word	352
	.word	288
	.word	15
	.word	19
	.word	22
	.word	24
	.word	786432
	.word	720
	.word	576
	.word	9
	.word	15
	.word	16
	.word	17
	.word	1048576
	.word	1280
	.word	736
	.word	6
	.word	13
	.word	13
	.word	14
	.word	2097152
	.word	1920
	.word	1088
	.word	6
	.word	13
	.word	13
	.word	13
	.word	2097152
	.word	5632
	.word	4224
	.word	1
	.word	3
	.word	3
	.word	3
	.word	16777216
	.word	1280
	.word	800
	.word	6
	.word	13
	.word	13
	.word	14
	.word	2097152
	.word	800
	.word	1280
	.word	6
	.word	13
	.word	13
	.word	14
	.word	2097152
	.word	1488
	.word	1280
	.word	6
	.word	13
	.word	13
	.word	14
	.word	3145728
	.word	1280
	.word	1488
	.word	6
	.word	13
	.word	13
	.word	14
	.word	3145728
	.word	2160
	.word	1280
	.word	6
	.word	13
	.word	13
	.word	13
	.word	3145728
	.word	1280
	.word	2176
	.word	6
	.word	13
	.word	13
	.word	13
	.word	3145728
	.word	2160
	.word	2176
	.word	4
	.word	11
	.word	11
	.word	11
	.word	4194304
	.word	4096
	.word	2304
	.word	2
	.word	9
	.word	9
	.word	9
	.word	5242880
	.word	2304
	.word	4096
	.word	2
	.word	9
	.word	9
	.word	9
	.word	5242880
	.word	4096
	.word	4096
	.word	2
	.word	9
	.word	9
	.word	9
	.word	8388608
	.word	8192
	.word	4096
	.word	2
	.word	9
	.word	9
	.word	9
	.word	10485760
	.word	4096
	.word	8192
	.word	2
	.word	9
	.word	9
	.word	9
	.word	10485760
	.word	8192
	.word	8192
	.word	1
	.word	3
	.word	3
	.word	3
	.word	20971520
	.word	1920
	.word	1088
	.word	1
	.word	3
	.word	3
	.word	3
	.word	2097152
	.word	1920
	.word	1088
	.word	1
	.word	3
	.word	3
	.word	3
	.word	2097152
	.word	1920
	.word	1088
	.word	17
	.word	26
	.word	26
	.word	26
	.word	2097152
	.word	192
	.word	192
	.word	15
	.word	19
	.word	22
	.word	24
	.word	524288
	.word	384
	.word	320
	.word	15
	.word	19
	.word	22
	.word	24
	.word	786432
	.word	768
	.word	576
	.word	9
	.word	15
	.word	16
	.word	17
	.word	1048576
	.word	1280
	.word	768
	.word	6
	.word	13
	.word	13
	.word	14
	.word	2097152
	.word	1920
	.word	1088
	.word	6
	.word	13
	.word	13
	.word	13
	.word	2097152
	.word	4096
	.word	2304
	.word	4
	.word	4
	.word	4
	.word	4
	.word	16777216
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Chan %d: Not repair ErrRatio = %d \012\000" )
.LC1:
	ASCII(.ascii	"Chan %d: CorrectType = %d ErrRatio = %d \012\000" )
	.space	2
.LC2:
	ASCII(.ascii	"Chan %d: Current frame:%d  ErrRatio = %d\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"====== forece VDM sleep! ======\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"%s,%d,  frameRate = %d,last = %d\012\000" )
	.space	2
.LC6:
	ASCII(.ascii	"%s,%d, the frameRate change!\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"%s,%d,chanid = %d,s32Is4k60fpsb = %d\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"The channel %d is decoding\012\000" )
.LC10:
	ASCII(.ascii	"The channel %d DEC PARAM is not ready\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"SMMU_READ_ERR  MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 read_err_addr  = 0x%x\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"SMMU_WRITE_ERR MODULE : VFMW \011 SMMU INT STATE: 0" )
	ASCII(.ascii	"x%x \011 write_err_addr = 0x%x\012\000" )
	.space	3
.LC13:
	ASCII(.ascii	"VDMHAL_V200_IsMpeg4NvopCopy point of picture para n" )
	ASCII(.ascii	"ull, wait forever!!!\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"VDMDRV_IsVc1SkpicCopy point of picture para null, w" )
	ASCII(.ascii	"ait forever!!!\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"VDMDRV_IsVp6NvopCopy point of picture para null, wa" )
	ASCII(.ascii	"it forever!!!\012\000" )
	.space	2
.LC16:
	ASCII(.ascii	"VDMDRV_IsVp9RptFrmCopy point of picture para null, " )
	ASCII(.ascii	"wait forever!!!\012\000" )
.LC17:
	ASCII(.ascii	"VDMDRV_IsProtocolCopy point of picture para null, w" )
	ASCII(.ascii	"ait forever!!!\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"The channel %d DEC PARAM is not ready(pDecParam == " )
	ASCII(.ascii	"NULL)\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"VDM Start Fail 2 !\012\000" )
.LC20:
	ASCII(.ascii	"isr begin: *pVdmStateMachine = %d, timeout = %d, Er" )
	ASCII(.ascii	"rRatio = %d\012\000" )
.LC21:
	ASCII(.ascii	"ISR process vdm timeout! FromInt = %d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC23:
	ASCII(.ascii	"Chan %d Mfde Running VdmStateMachine = %d, but DecP" )
	ASCII(.ascii	"aram = NULL!\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"Chan %d VdmStateMachine = %d, but DecParam = NULL, " )
	ASCII(.ascii	"Reset VDH MFDE!\012\000" )
.LC25:
	ASCII(.ascii	"Chan %d VDM Time Out(%d ms), Reset VDM!\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC27:
	ASCII(.ascii	"Line %d, ISR called, ChanResetFlag = 1!!\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"vdm state machine = %d, but DecParam is null!\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"line :%d ISR called but chan %d is not active!\012\000" )
.LC30:
	ASCII(.ascii	"line :%d ISR called chan %d is active! But Dec Para" )
	ASCII(.ascii	"m in CTX is NULL!!!\012\000" )
.LC31:
	ASCII(.ascii	"%s,%d, i = %d, MatchVdhIdPlus1 = %d\012\000" )
	.space	3
.LC32:
	ASCII(.ascii	"%s,%d, MatchVdhIdPlus1 = %d,chanId = %d\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 56
g_VdmDrvParam:
	.space	56
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.space	4
	.type	g_DspDrvState, %object
	.size	g_DspDrvState, 8
g_DspDrvState:
	.space	8
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 384
g_ChanCtx:
	.space	384
	.type	g_LastFPS.14523, %object
	.size	g_LastFPS.14523, 128
g_LastFPS.14523:
	.space	128
	.type	DiffFrameCnt.14522, %object
	.size	DiffFrameCnt.14522, 128
DiffFrameCnt.14522:
	.space	128
	.type	g_BackUp, %object
	.size	g_BackUp, 180
g_BackUp:
	.space	180
	.type	g_RepairParam, %object
	.size	g_RepairParam, 1752
g_RepairParam:
	.space	1752
	.type	last_rec_pos_time.14570, %object
	.size	last_rec_pos_time.14570, 128
last_rec_pos_time.14570:
	.space	128
	.type	LastRecPosTime.14702, %object
	.size	LastRecPosTime.14702, 128
LastRecPosTime.14702:
	.space	128
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 268
g_VdmExtParam:
	.space	268
	.type	g_DecReport, %object
	.size	g_DecReport, 816
g_DecReport:
	.space	816
	.type	g_HwMem, %object
	.size	g_HwMem, 1228
g_HwMem:
	.space	1228
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.space	3200
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
