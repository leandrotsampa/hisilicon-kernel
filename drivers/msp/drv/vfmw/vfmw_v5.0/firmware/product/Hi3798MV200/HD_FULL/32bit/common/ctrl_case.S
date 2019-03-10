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
	.file	"ctrl_case.c"
	.text
	.align	2
	.global	CASE_StopLowDelayCalc
	.type	CASE_StopLowDelayCalc, %function
CASE_StopLowDelayCalc:
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
	mov	r2, r1
	mov	r0, #22
	ldr	r1, .L2
	bl	dprint_vfmw
	ldr	r1, .L2+4
	ldr	r2, .L2+8
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r1, r4]
	str	r3, [r2, r4, asl #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	g_LowDelayCalcStat
	.word	g_LowDelayCalcHandle
	UNWIND(.fnend)
	.size	CASE_StopLowDelayCalc, .-CASE_StopLowDelayCalc
	.align	2
	.global	CASE_ResetChan
	.type	CASE_ResetChan, %function
CASE_ResetChan:
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
	ldr	r5, .L5
	mov	r2, r1
	mov	r4, r0
	ldr	r1, .L5+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC0
	UNWIND(.fnend)
	.size	CASE_ResetChan, .-CASE_ResetChan
	.align	2
	.global	CASE_StartChan
	.type	CASE_StartChan, %function
CASE_StartChan:
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
	ldr	r5, .L8
	mov	r2, r1
	mov	r4, r0
	ldr	r1, .L8+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_EnableEsBuf
	mov	r0, r4
	bl	VCTRL_StartChan
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC0
	UNWIND(.fnend)
	.size	CASE_StartChan, .-CASE_StartChan
	.align	2
	.global	CASE_StopChan
	.type	CASE_StopChan, %function
CASE_StopChan:
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
	bl	VCTRL_StopChanWithCheck
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CASE_StopChan, .-CASE_StopChan
	.align	2
	.global	CASE_GetChanState
	.type	CASE_GetChanState, %function
CASE_GetChanState:
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
	ldr	r4, .L12
	mov	r5, r0
	mov	r6, r1
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_GetChanState
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_GetChanState, .-CASE_GetChanState
	.align	2
	.global	CASE_ReleaseStream
	.type	CASE_ReleaseStream, %function
CASE_ReleaseStream:
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
	ldr	r5, .L15
	mov	r2, r1
	mov	r4, r0
	ldr	r1, .L15+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	bl	VCTRL_ReleaseStream
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC0
	UNWIND(.fnend)
	.size	CASE_ReleaseStream, .-CASE_ReleaseStream
	.align	2
	.global	CASE_ExtraWakupThread
	.type	CASE_ExtraWakupThread, %function
CASE_ExtraWakupThread:
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
	ldr	r4, .L18
	mov	r2, r0
	mov	r3, r1
	mov	r0, #22
	ldr	r1, .L18+4
	bl	dprint_vfmw
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	bl	VCTRL_ExtraWakeUpThread
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC1
	UNWIND(.fnend)
	.size	CASE_ExtraWakupThread, .-CASE_ExtraWakupThread
	.align	2
	.global	CASE_ReportDemuxRelease
	.type	CASE_ReportDemuxRelease, %function
CASE_ReportDemuxRelease:
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
	ldr	r4, .L26
	mov	r5, r0
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r0, r5
	bl	VCTRL_IfEsBufEnable
	cmp	r0, #0
	beq	.L21
	mov	r0, r5
	bl	VCTRL_DisableEsBuf
.L21:
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CASE_ReportDemuxRelease, .-CASE_ReportDemuxRelease
	.align	2
	.global	CASE_SetFrameRate
	.type	CASE_SetFrameRate, %function
CASE_SetFrameRate:
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
	beq	.L31
	ldr	r2, .L32
	mov	r3, #0
	ldr	r1, [r1]
	ldr	r2, [r2, r0, asl #2]
	str	r1, [r2, #1456]
.L30:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L31:
	mov	r0, r1
	movw	r3, #453
	ldr	r2, .L32+4
	ldr	r1, .L32+8
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L30
.L33:
	.align	2
.L32:
	.word	s_pstVfmwChan
	.word	.LANCHOR0
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetFrameRate, .-CASE_SetFrameRate
	.align	2
	.global	CASE_SetFrameBufferNum
	.type	CASE_SetFrameBufferNum, %function
CASE_SetFrameBufferNum:
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
	beq	.L38
	ldr	r3, .L39
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	addne	r2, r3, #307200
	ldrne	ip, [r1]
	movne	r0, #0
	mvneq	r0, #0
	strne	ip, [r2, #3300]
	ldrne	r2, [r1]
	strne	r2, [r3, #1392]
	ldmfd	sp, {fp, sp, pc}
.L38:
	mov	r0, r1
	movw	r3, #483
	ldr	r2, .L39+4
	ldr	r1, .L39+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+20
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetFrameBufferNum, .-CASE_SetFrameBufferNum
	.align	2
	.global	CASE_StartLowDelayCalc
	.type	CASE_StartLowDelayCalc, %function
CASE_StartLowDelayCalc:
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
	mov	r3, r0
	beq	.L44
	ldr	ip, .L45
	mov	lr, #1
	ldr	r2, .L45+4
	mov	r0, #0
	strb	lr, [ip, r3]
	ldr	r1, [r1]
	str	r1, [r2, r3, asl #2]
	ldmfd	sp, {fp, sp, pc}
.L44:
	mov	r0, r1
	movw	r3, #539
	ldr	r2, .L45+8
	ldr	r1, .L45+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	g_LowDelayCalcStat
	.word	g_LowDelayCalcHandle
	.word	.LANCHOR0+44
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_StartLowDelayCalc, .-CASE_StartLowDelayCalc
	.align	2
	.global	CASE_GetCapability
	.type	CASE_GetCapability, %function
CASE_GetCapability:
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
	mov	r2, r0
	ldr	r1, .L51
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L50
	ldr	r5, .L51+4
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r0, r4
	bl	PDT_GetVdecCapability
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L50:
	mov	r0, r4
	mov	r3, #62
	ldr	r2, .L51+8
	ldr	r1, .L51+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+68
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetCapability, .-CASE_GetCapability
	.align	2
	.global	CASE_GetChanMemSize
	.type	CASE_GetChanMemSize, %function
CASE_GetChanMemSize:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	mov	r5, r1
	mov	r2, r0
	ldr	r1, .L59
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r5, #0
	beq	.L58
	ldr	r6, .L59+4
	mov	r0, #0
	ldr	r3, [r6, #12]
	blx	r3
	mov	r3, #1
	sub	r2, fp, #44
	ldr	r1, [r5, #8]
	ldr	r0, [r5]
	bl	VCTRL_GetChanMemSize
	cmp	r0, #0
	bne	.L56
	ldr	r2, [fp, #-44]
	mov	r4, r0
	ldr	r3, [fp, #-40]
	stmia	r5, {r2, r3}
.L57:
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L55:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L56:
	mvn	r2, #0
	ldr	r1, .L59+8
	mov	r0, #1
	mov	r4, r2
	bl	dprint_vfmw
	b	.L57
.L58:
	mov	r0, r5
	mov	r3, #85
	ldr	r2, .L59+12
	ldr	r1, .L59+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L55
.L60:
	.align	2
.L59:
	.word	.LC3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	.word	.LANCHOR0+88
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetChanMemSize, .-CASE_GetChanMemSize
	.align	2
	.global	CASE_CreateChan
	.type	CASE_CreateChan, %function
CASE_CreateChan:
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
	mov	r2, r0
	ldr	r1, .L65
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L64
	mov	r3, #0
	mov	r2, #2
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	bl	VCTRL_CreateChan
	mov	r3, r0
	mov	r0, r0, asr #31
	str	r3, [r4]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L64:
	mov	r0, r4
	mov	r3, #130
	ldr	r2, .L65+4
	ldr	r1, .L65+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	.LC3
	.word	.LANCHOR0+108
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_CreateChan, .-CASE_CreateChan
	.align	2
	.global	CASE_DestroyChan
	.type	CASE_DestroyChan, %function
CASE_DestroyChan:
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
	mov	r2, r1
	mov	r5, r0
	ldr	r1, .L73
	mov	r0, #22
	bl	dprint_vfmw
	mov	r4, #500
	ldr	r6, .L73+4
	b	.L68
.L69:
	ldr	r3, [r6, #120]
	sub	r4, r4, #1
	blx	r3
.L68:
	mov	r1, #2
	mov	r0, r5
	bl	VCTRT_SetChanCtrlState
	adds	r3, r4, #0
	movne	r3, #1
	cmn	r0, #1
	mov	r0, #1
	movne	r3, #0
	cmp	r3, #0
	bne	.L69
	cmp	r4, #0
	ble	.L72
	mov	r0, r5
	bl	VCTRL_DestroyChan
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L72:
	mov	r0, r3
	mvn	r2, #0
	ldr	r1, .L73+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	.LC0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC5
	UNWIND(.fnend)
	.size	CASE_DestroyChan, .-CASE_DestroyChan
	.align	2
	.global	CASE_ResetChanWithOption
	.type	CASE_ResetChanWithOption, %function
CASE_ResetChanWithOption:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L78
	ldr	r4, .L79
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ResetChanWithOption
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L77:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L78:
	mov	r0, r5
	mov	r3, #196
	ldr	r2, .L79+4
	mvn	r4, #0
	ldr	r1, .L79+8
	bl	dprint_vfmw
	b	.L77
.L80:
	.align	2
.L79:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+124
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_ResetChanWithOption, .-CASE_ResetChanWithOption
	.align	2
	.global	CASE_GetChanConfig
	.type	CASE_GetChanConfig, %function
CASE_GetChanConfig:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L84
	ldr	r4, .L85
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetChanCfg
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L83:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L84:
	mov	r0, r5
	mov	r3, #251
	ldr	r2, .L85+4
	mvn	r4, #0
	ldr	r1, .L85+8
	bl	dprint_vfmw
	b	.L83
.L86:
	.align	2
.L85:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+152
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetChanConfig, .-CASE_GetChanConfig
	.align	2
	.global	CASE_ConfigChan
	.type	CASE_ConfigChan, %function
CASE_ConfigChan:
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
	subs	r6, r1, #0
	mov	r5, r0
	beq	.L91
	ldr	r4, .L93
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VCTRL_ConfigChan
	cmp	r0, #0
	beq	.L92
.L90:
	adds	r3, r0, #0
	ldr	r2, [r4, #16]
	mov	r0, #0
	movne	r3, #1
	rsb	r4, r3, #0
	blx	r2
.L89:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L92:
	mov	r0, r5
	bl	VCTRL_LoadDspCode
	b	.L90
.L91:
	mov	r0, r6
	movw	r3, #267
	ldr	r2, .L93+4
	mvn	r4, #0
	ldr	r1, .L93+8
	bl	dprint_vfmw
	b	.L89
.L94:
	.align	2
.L93:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+172
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_ConfigChan, .-CASE_ConfigChan
	.align	2
	.global	CASE_SetStreamIntf
	.type	CASE_SetStreamIntf, %function
CASE_SetStreamIntf:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L98
	ldr	r4, .L99
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_SetStreamInterface
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L97:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L98:
	mov	r0, r5
	movw	r3, #318
	ldr	r2, .L99+4
	mvn	r4, #0
	ldr	r1, .L99+8
	bl	dprint_vfmw
	b	.L97
.L100:
	.align	2
.L99:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+188
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetStreamIntf, .-CASE_SetStreamIntf
	.align	2
	.global	CASE_GetStreamSize
	.type	CASE_GetStreamSize, %function
CASE_GetStreamSize:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L104
	ldr	r5, .L105
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_GetStreamSize
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L104:
	mov	r0, r4
	movw	r3, #334
	ldr	r2, .L105+4
	ldr	r1, .L105+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L106:
	.align	2
.L105:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+208
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetStreamSize, .-CASE_GetStreamSize
	.align	2
	.global	CASE_GetChanIDByMem
	.type	CASE_GetChanIDByMem, %function
CASE_GetChanIDByMem:
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
	beq	.L110
	ldr	r5, .L111
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	ldr	r0, [r4]
	bl	VCTRL_GetChanIDByMemAddr
	mov	r3, r0
	cmn	r3, #1
	str	r3, [r4]
	mov	r0, #0
	ldr	r2, [r5, #16]
	movne	r3, #0
	moveq	r3, #1
	rsb	r4, r3, #0
	blx	r2
.L109:
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L110:
	mov	r0, r4
	movw	r3, #363
	ldr	r2, .L111+4
	mvn	r4, #0
	ldr	r1, .L111+8
	bl	dprint_vfmw
	b	.L109
.L112:
	.align	2
.L111:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+228
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetChanIDByMem, .-CASE_GetChanIDByMem
	.align	2
	.global	CASE_SetDiscardPicParam
	.type	CASE_SetDiscardPicParam, %function
CASE_SetDiscardPicParam:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L116
	ldr	r5, .L117
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_SetDiscardPicParam
	ldr	r3, [r5, #16]
	mov	r4, r0
	mov	r0, #0
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L116:
	mov	r0, r4
	mov	r3, #380
	ldr	r2, .L117+4
	ldr	r1, .L117+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L118:
	.align	2
.L117:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+248
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetDiscardPicParam, .-CASE_SetDiscardPicParam
	.align	2
	.global	CASE_SetPtsToSeek
	.type	CASE_SetPtsToSeek, %function
CASE_SetPtsToSeek:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	subs	r7, r1, #0
	mov	r6, r0
	beq	.L123
	ldr	r5, .L125
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	sub	r1, fp, #40
	mov	r0, r6
	mov	r3, #0
	mov	r2, #1
	str	r3, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-32]
	bl	VCTRL_ResetChanWithOption
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r4, r0, #0
	cmp	r4, #0
	beq	.L124
.L122:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
.L121:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L124:
	mov	r1, r7
	mov	r0, r6
	bl	VCTRL_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r4, r0, #0
	b	.L122
.L123:
	mov	r0, r7
	movw	r3, #397
	ldr	r2, .L125+4
	ldr	r1, .L125+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L121
.L126:
	.align	2
.L125:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+272
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetPtsToSeek, .-CASE_SetPtsToSeek
	.align	2
	.global	CASE_SetTrickMode
	.type	CASE_SetTrickMode, %function
CASE_SetTrickMode:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L130
	ldr	r4, .L131
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ConfigFFFBSpeed
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L129:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L130:
	mov	r0, r5
	movw	r3, #423
	ldr	r2, .L131+4
	mvn	r4, #0
	ldr	r1, .L131+8
	bl	dprint_vfmw
	b	.L129
.L132:
	.align	2
.L131:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+292
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetTrickMode, .-CASE_SetTrickMode
	.align	2
	.global	CASE_SetCtrlInfo
	.type	CASE_SetCtrlInfo, %function
CASE_SetCtrlInfo:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L136
	ldr	r4, .L137
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_ConfigPVRInfo
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L135:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L136:
	mov	r0, r5
	movw	r3, #439
	ldr	r2, .L137+4
	mvn	r4, #0
	ldr	r1, .L137+8
	bl	dprint_vfmw
	b	.L135
.L138:
	.align	2
.L137:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+312
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetCtrlInfo, .-CASE_SetCtrlInfo
	.align	2
	.global	CASE_AllocMemToDecoder
	.type	CASE_AllocMemToDecoder, %function
CASE_AllocMemToDecoder:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L146
	ldr	r5, .L148
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	mov	r1, r4
	mov	r0, r6
	bl	VCTRL_AllocMemToDecoder
	subs	r4, r0, #0
	bne	.L147
.L142:
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L147:
	ldr	r1, .L148+4
	mov	r0, #1
	bl	dprint_vfmw
	b	.L142
.L146:
	mov	r0, r4
	mov	r3, #464
	ldr	r2, .L148+8
	ldr	r1, .L148+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L149:
	.align	2
.L148:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC6
	.word	.LANCHOR0+332
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_AllocMemToDecoder, .-CASE_AllocMemToDecoder
	.align	2
	.global	CASE_GetUserDecFrame
	.type	CASE_GetUserDecFrame, %function
CASE_GetUserDecFrame:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L153
	ldr	r4, .L154
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_GetUsrdecFrame
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L152:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L153:
	mov	r0, r5
	mov	r3, #504
	ldr	r2, .L154+4
	mvn	r4, #0
	ldr	r1, .L154+8
	bl	dprint_vfmw
	b	.L152
.L155:
	.align	2
.L154:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+356
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_GetUserDecFrame, .-CASE_GetUserDecFrame
	.align	2
	.global	CASE_PutUserDecFrame
	.type	CASE_PutUserDecFrame, %function
CASE_PutUserDecFrame:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L159
	ldr	r4, .L160
	mov	r0, #0
	ldr	r3, [r4, #12]
	blx	r3
	mov	r1, r5
	mov	r0, r6
	bl	VCTRL_PutUsrdecFrame
	ldr	r3, [r4, #16]
	adds	r4, r0, #0
	mov	r0, #0
	movne	r4, #1
	rsb	r4, r4, #0
	blx	r3
.L158:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L159:
	mov	r0, r5
	mov	r3, #520
	ldr	r2, .L160+4
	mvn	r4, #0
	ldr	r1, .L160+8
	bl	dprint_vfmw
	b	.L158
.L161:
	.align	2
.L160:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+380
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_PutUserDecFrame, .-CASE_PutUserDecFrame
	.align	2
	.global	CASE_ReportOccupiedFrame
	.type	CASE_ReportOccupiedFrame, %function
CASE_ReportOccupiedFrame:
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
	subs	r3, r1, #0
	mov	r5, r0
	beq	.L169
	bl	VCTRL_ReportOccupiedFrame
	subs	r4, r0, #0
	bne	.L170
.L165:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L170:
	mov	r2, r5
	ldr	r1, .L171
	mov	r0, #1
	bl	dprint_vfmw
	b	.L165
.L169:
	mov	r0, r3
	ldr	r2, .L171+4
	mov	r3, #564
	ldr	r1, .L171+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L172:
	.align	2
.L171:
	.word	.LC7
	.word	.LANCHOR0+404
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_ReportOccupiedFrame, .-CASE_ReportOccupiedFrame
	.align	2
	.global	CASE_SetImageOutputInfo
	.type	CASE_SetImageOutputInfo, %function
CASE_SetImageOutputInfo:
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
	subs	r3, r1, #0
	mov	r5, r0
	beq	.L180
	bl	VCTRL_ImageOutputEnable
	subs	r4, r0, #0
	bne	.L181
.L176:
	adds	r0, r4, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L181:
	mov	r2, r5
	ldr	r1, .L182
	mov	r0, #1
	bl	dprint_vfmw
	b	.L176
.L180:
	mov	r0, r3
	ldr	r2, .L182+4
	movw	r3, #583
	ldr	r1, .L182+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L183:
	.align	2
.L182:
	.word	.LC8
	.word	.LANCHOR0+432
	.word	.LC2
	UNWIND(.fnend)
	.size	CASE_SetImageOutputInfo, .-CASE_SetImageOutputInfo
	.align	2
	.global	CASE_HandleEntry
	.type	CASE_HandleEntry, %function
CASE_HandleEntry:
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
	cmp	r1, #8
	ldrne	ip, .L216
	bne	.L189
	b	.L215
.L211:
	ldr	r3, [ip, #16]
	add	ip, ip, #12
	cmp	r3, #0
	beq	.L185
	cmp	lr, r1
	beq	.L214
.L189:
	ldr	lr, [ip, #12]
	cmp	lr, #45
	bne	.L211
.L185:
	cmp	r1, #15
	cmpne	r1, #4
	movne	r3, #1
	moveq	r3, #0
	cmp	r1, #1
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	movne	r3, #0
	beq	.L194
.L186:
	cmp	r0, #31
	bhi	.L193
	ldr	ip, .L216+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L193
	ldr	ip, [ip]
	cmp	ip, r0
	bne	.L193
	cmp	r3, #0
	beq	.L194
.L195:
	mov	r1, r2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L214:
	cmp	r1, #15
	cmpne	r1, #4
	movne	ip, #1
	moveq	ip, #0
	cmp	r1, #1
	moveq	ip, #0
	andne	ip, ip, #1
	cmp	ip, #0
	bne	.L186
	b	.L195
.L194:
	mov	r2, r1
	mov	r0, #1
	ldr	r1, .L216+8
	bl	dprint_vfmw
.L212:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L193:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L216+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L212
.L215:
	ldr	r3, .L216+16
	b	.L186
.L217:
	.align	2
.L216:
	.word	.LANCHOR0+456
	.word	s_pstVfmwChan
	.word	.LC10
	.word	.LC9
	.word	CASE_GetChanState
	UNWIND(.fnend)
	.size	CASE_HandleEntry, .-CASE_HandleEntry
	.global	VDEC_CID_HandlerTable
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.14528, %object
	.size	__func__.14528, 18
__func__.14528:
	.ascii	"CASE_SetFrameRate\000"
	.space	2
	.type	__func__.14540, %object
	.size	__func__.14540, 23
__func__.14540:
	.ascii	"CASE_SetFrameBufferNum\000"
	.space	1
	.type	__func__.14559, %object
	.size	__func__.14559, 23
__func__.14559:
	.ascii	"CASE_StartLowDelayCalc\000"
	.space	1
	.type	__func__.14406, %object
	.size	__func__.14406, 19
__func__.14406:
	.ascii	"CASE_GetCapability\000"
	.space	1
	.type	__func__.14415, %object
	.size	__func__.14415, 20
__func__.14415:
	.ascii	"CASE_GetChanMemSize\000"
	.type	__func__.14423, %object
	.size	__func__.14423, 16
__func__.14423:
	.ascii	"CASE_CreateChan\000"
	.type	__func__.14443, %object
	.size	__func__.14443, 25
__func__.14443:
	.ascii	"CASE_ResetChanWithOption\000"
	.space	3
	.type	__func__.14459, %object
	.size	__func__.14459, 19
__func__.14459:
	.ascii	"CASE_GetChanConfig\000"
	.space	1
	.type	__func__.14465, %object
	.size	__func__.14465, 16
__func__.14465:
	.ascii	"CASE_ConfigChan\000"
	.type	__func__.14480, %object
	.size	__func__.14480, 19
__func__.14480:
	.ascii	"CASE_SetStreamIntf\000"
	.space	1
	.type	__func__.14486, %object
	.size	__func__.14486, 19
__func__.14486:
	.ascii	"CASE_GetStreamSize\000"
	.space	1
	.type	__func__.14497, %object
	.size	__func__.14497, 20
__func__.14497:
	.ascii	"CASE_GetChanIDByMem\000"
	.type	__func__.14503, %object
	.size	__func__.14503, 24
__func__.14503:
	.ascii	"CASE_SetDiscardPicParam\000"
	.type	__func__.14511, %object
	.size	__func__.14511, 18
__func__.14511:
	.ascii	"CASE_SetPtsToSeek\000"
	.space	2
	.type	__func__.14517, %object
	.size	__func__.14517, 18
__func__.14517:
	.ascii	"CASE_SetTrickMode\000"
	.space	2
	.type	__func__.14523, %object
	.size	__func__.14523, 17
__func__.14523:
	.ascii	"CASE_SetCtrlInfo\000"
	.space	3
	.type	__func__.14534, %object
	.size	__func__.14534, 23
__func__.14534:
	.ascii	"CASE_AllocMemToDecoder\000"
	.space	1
	.type	__func__.14546, %object
	.size	__func__.14546, 21
__func__.14546:
	.ascii	"CASE_GetUserDecFrame\000"
	.space	3
	.type	__func__.14552, %object
	.size	__func__.14552, 21
__func__.14552:
	.ascii	"CASE_PutUserDecFrame\000"
	.space	3
	.type	__func__.14570, %object
	.size	__func__.14570, 25
__func__.14570:
	.ascii	"CASE_ReportOccupiedFrame\000"
	.space	3
	.type	__func__.14577, %object
	.size	__func__.14577, 24
__func__.14577:
	.ascii	"CASE_SetImageOutputInfo\000"
	.type	VDEC_CID_HandlerTable, %object
	.size	VDEC_CID_HandlerTable, 372
VDEC_CID_HandlerTable:
	.word	8
	.word	CASE_GetChanState
	.word	100
	.word	33
	.word	CASE_SetFrameRate
	.word	4
	.word	1
	.word	CASE_GetCapability
	.word	148
	.word	15
	.word	CASE_GetChanMemSize
	.word	128
	.word	4
	.word	CASE_CreateChan
	.word	128
	.word	5
	.word	CASE_DestroyChan
	.word	0
	.word	11
	.word	CASE_ResetChan
	.word	0
	.word	19
	.word	CASE_ResetChanWithOption
	.word	12
	.word	6
	.word	CASE_GetChanConfig
	.word	144
	.word	9
	.word	CASE_StartChan
	.word	0
	.word	10
	.word	CASE_StopChan
	.word	0
	.word	7
	.word	CASE_ConfigChan
	.word	144
	.word	18
	.word	CASE_ReleaseStream
	.word	0
	.word	12
	.word	CASE_SetStreamIntf
	.word	12
	.word	13
	.word	CASE_GetStreamSize
	.word	4
	.word	17
	.word	CASE_GetChanIDByMem
	.word	4
	.word	25
	.word	CASE_SetDiscardPicParam
	.word	8
	.word	30
	.word	CASE_SetPtsToSeek
	.word	24
	.word	31
	.word	CASE_SetTrickMode
	.word	4
	.word	32
	.word	CASE_SetCtrlInfo
	.word	20
	.word	37
	.word	CASE_AllocMemToDecoder
	.word	72
	.word	38
	.word	CASE_SetFrameBufferNum
	.word	4
	.word	40
	.word	CASE_ReportDemuxRelease
	.word	0
	.word	22
	.word	CASE_GetUserDecFrame
	.word	72
	.word	23
	.word	CASE_PutUserDecFrame
	.word	72
	.word	34
	.word	CASE_StartLowDelayCalc
	.word	4
	.word	35
	.word	CASE_StopLowDelayCalc
	.word	4
	.word	44
	.word	CASE_ReportOccupiedFrame
	.word	520
	.word	43
	.word	CASE_SetImageOutputInfo
	.word	4
	.word	27
	.word	CASE_ExtraWakupThread
	.word	0
	.word	45
	.word	0
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Not care param %p\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"Not care param %d %p\012\000" )
	.space	2
.LC2:
	ASCII(.ascii	"invalid condition: %s %d\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"Not care param %d\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"call VCTRL_GetChanMemSize failed ret:%d\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"VCTRT_SetChanCtrlState ERR: %d\012\000" )
.LC6:
	ASCII(.ascii	"VCTRL_AllocMemToDecoder failed!\012 \000" )
	.space	2
.LC7:
	ASCII(.ascii	"VCTRL_ReportOccupiedFrame[Chan %d] failed!\012\000" )
.LC8:
	ASCII(.ascii	"VCTRL_ImageOutputEnable[Chan %d] failed!\012\000" )
	.space	2
.LC9:
	ASCII(.ascii	"Chan id:%d is invalid %d Cmd ID:%d\012\000" )
.LC10:
	ASCII(.ascii	"Unsupport eCmdID %d\012\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
