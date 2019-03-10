#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"ctrl_case.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	CASE_StopLowDelayCalc
	.type	CASE_StopLowDelayCalc, %function
CASE_StopLowDelayCalc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC1
	mov	x2, x20
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x2, .LC2
	mov	w0, 0
	ldr	x1, .LC3
	strb	wzr, [x2, w19, sxtw]
	str	wzr, [x1, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_StopLowDelayCalc, .-CASE_StopLowDelayCalc
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC2:
	.xword	g_LowDelayCalcStat
	.align	3
.LC3:
	.xword	g_LowDelayCalcHandle
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ResetChan
	.type	CASE_ResetChan, %function
CASE_ResetChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC4
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x19, .LC5
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_ResetChan
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ResetChan, .-CASE_ResetChan
	.align	3
.LC4:
	.xword	.LC0
	.align	3
.LC5:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_StartChan
	.type	CASE_StartChan, %function
CASE_StartChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC6
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x19, .LC7
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_EnableEsBuf
	mov	w0, w20
	bl	VCTRL_StartChan
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_StartChan, .-CASE_StartChan
	.align	3
.LC6:
	.xword	.LC0
	.align	3
.LC7:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_StopChan
	.type	CASE_StopChan, %function
CASE_StopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_StopChanWithCheck
	cmp	w0, wzr
	csetm	w0, ne
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_StopChan, .-CASE_StopChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanState
	.type	CASE_GetChanState, %function
CASE_GetChanState:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC8
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	x1, x21
	mov	w0, w20
	bl	VCTRL_GetChanState
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	CASE_GetChanState, .-CASE_GetChanState
	.align	3
.LC8:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ReleaseStream
	.type	CASE_ReleaseStream, %function
CASE_ReleaseStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC9
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x19, .LC10
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_ReleaseStream
	mov	w20, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cmp	w20, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ReleaseStream, .-CASE_ReleaseStream
	.align	3
.LC9:
	.xword	.LC0
	.align	3
.LC10:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ExtraWakupThread
	.type	CASE_ExtraWakupThread, %function
CASE_ExtraWakupThread:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC12
	mov	x3, x20
	mov	w2, w19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x19, .LC13
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	bl	VCTRL_ExtraWakeUpThread
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ExtraWakupThread, .-CASE_ExtraWakupThread
	.align	3
.LC12:
	.xword	.LC11
	.align	3
.LC13:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ReportDemuxRelease
	.type	CASE_ReportDemuxRelease, %function
CASE_ReportDemuxRelease:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC14
	mov	w0, 0
	ldr	x1, [x19, 24]
	blr	x1
	mov	w0, w20
	bl	VCTRL_IfEsBufEnable
	cbz	w0, .L9
	mov	w0, w20
	bl	VCTRL_DisableEsBuf
.L9:
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CASE_ReportDemuxRelease, .-CASE_ReportDemuxRelease
	.align	3
.LC14:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetFrameRate
	.type	CASE_SetFrameRate, %function
CASE_SetFrameRate:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L17
	ldr	x1, .LC18
	mov	w0, 0
	ldr	w2, [x19]
	ldr	x1, [x1, w20, sxtw 3]
	str	w2, [x1, 1560]
.L16:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L17:
	ldr	x2, .LC15
	mov	w3, 453
	ldr	x1, .LC17
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L16
	.size	CASE_SetFrameRate, .-CASE_SetFrameRate
	.align	3
.LC15:
	.xword	.LANCHOR0
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetFrameBufferNum
	.type	CASE_SetFrameBufferNum, %function
CASE_SetFrameBufferNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L22
	ldr	x0, .LC21
	ldr	x1, [x0, w20, sxtw 3]
	cbz	x1, .L21
	add	x2, x1, 323584
	ldr	w3, [x19]
	mov	w0, 0
	str	w3, [x2, 3956]
	ldr	w2, [x19]
	str	w2, [x1, 1496]
.L20:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L21:
	mov	w0, -1
	b	.L20
.L22:
	ldr	x2, .LC19
	mov	w3, 483
	ldr	x1, .LC20
	mov	w0, 0
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -1
	b	.L20
	.size	CASE_SetFrameBufferNum, .-CASE_SetFrameBufferNum
	.align	3
.LC19:
	.xword	.LANCHOR0
	.align	3
.LC20:
	.xword	.LC16
	.align	3
.LC21:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_StartLowDelayCalc
	.type	CASE_StartLowDelayCalc, %function
CASE_StartLowDelayCalc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L26
	ldr	x2, .LC24
	mov	w3, 1
	ldr	x1, .LC25
	mov	w0, 0
	strb	w3, [x2, w20, sxtw]
	ldr	w2, [x19]
	str	w2, [x1, w20, sxtw 2]
.L25:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L26:
	ldr	x2, .LC22
	mov	w3, 539
	ldr	x1, .LC23
	mov	w0, 0
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -1
	b	.L25
	.size	CASE_StartLowDelayCalc, .-CASE_StartLowDelayCalc
	.align	3
.LC22:
	.xword	.LANCHOR0
	.align	3
.LC23:
	.xword	.LC16
	.align	3
.LC24:
	.xword	g_LowDelayCalcStat
	.align	3
.LC25:
	.xword	g_LowDelayCalcHandle
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetCapability
	.type	CASE_GetCapability, %function
CASE_GetCapability:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC27
	mov	w2, w20
	mov	w0, 22
	bl	dprint_vfmw
	cbz	x19, .L30
	ldr	x20, .LC30
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x0, x19
	bl	PDT_GetVdecCapability
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, 0
.L29:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L30:
	ldr	x2, .LC28
	mov	w3, 62
	ldr	x1, .LC29
	mov	w0, 0
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
	b	.L29
	.size	CASE_GetCapability, .-CASE_GetCapability
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	.LANCHOR0
	.align	3
.LC29:
	.xword	.LC16
	.align	3
.LC30:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanMemSize
	.type	CASE_GetChanMemSize, %function
CASE_GetChanMemSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC31
	mov	w2, w20
	mov	w0, 22
	bl	dprint_vfmw
	cbz	x19, .L36
	ldr	x20, .LC34
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	w0, [x19]
	mov	w3, 1
	ldr	x1, [x19, 8]
	add	x2, x29, 32
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L34
	ldp	w1, w0, [x29, 32]
	stp	w1, w0, [x19]
	mov	w19, 0
.L35:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L33:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L34:
	ldr	x1, .LC36
	mov	w2, -1
	mov	w0, 1
	mov	w19, w2
	bl	dprint_vfmw
	b	.L35
.L36:
	ldr	x2, .LC32
	mov	w3, 85
	ldr	x1, .LC33
	mov	w0, 0
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L33
	.size	CASE_GetChanMemSize, .-CASE_GetChanMemSize
	.align	3
.LC31:
	.xword	.LC26
	.align	3
.LC32:
	.xword	.LANCHOR0
	.align	3
.LC33:
	.xword	.LC16
	.align	3
.LC34:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC36:
	.xword	.LC35
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_CreateChan
	.type	CASE_CreateChan, %function
CASE_CreateChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x1, .LC37
	mov	w2, w20
	mov	w0, 22
	bl	dprint_vfmw
	cbz	x19, .L40
	ldr	x1, [x19, 8]
	mov	w3, 0
	ldr	w0, [x19]
	mov	w2, 2
	bl	VCTRL_CreateChan
	mov	w1, w0
	asr	w0, w0, 31
	str	w1, [x19]
.L39:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L40:
	ldr	x2, .LC38
	mov	w3, 130
	ldr	x1, .LC39
	mov	w0, 0
	add	x2, x2, 120
	bl	dprint_vfmw
	mov	w0, -1
	b	.L39
	.size	CASE_CreateChan, .-CASE_CreateChan
	.align	3
.LC37:
	.xword	.LC26
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	.LC16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_DestroyChan
	.type	CASE_DestroyChan, %function
CASE_DestroyChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	mov	w19, 500
	bl	_mcount
	ldr	x1, .LC40
	mov	x2, x21
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x21, .LC41
	b	.L42
	.p2align 3
.L43:
	ldr	x1, [x21, 240]
	sub	w19, w19, #1
	blr	x1
.L42:
	mov	w1, 2
	mov	w0, w20
	bl	VCTRT_SetChanCtrlState
	mov	w1, w0
	cmp	w19, wzr
	mov	w0, 1
	ccmn	w1, #1, 0, ne
	beq	.L43
	cmp	w19, wzr
	ble	.L46
	mov	w0, w20
	bl	VCTRL_DestroyChan
	cmp	w0, wzr
	csetm	w0, ne
.L45:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L46:
	ldr	x1, .LC43
	mov	w2, -1
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L45
	.size	CASE_DestroyChan, .-CASE_DestroyChan
	.align	3
.LC40:
	.xword	.LC0
	.align	3
.LC41:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC43:
	.xword	.LC42
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ResetChanWithOption
	.type	CASE_ResetChanWithOption, %function
CASE_ResetChanWithOption:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L50
	ldr	x20, .LC46
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ResetChanWithOption
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L49:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L50:
	ldr	x2, .LC44
	mov	w3, 196
	ldr	x1, .LC45
	mov	w0, 0
	add	x2, x2, 136
	mov	w19, -1
	bl	dprint_vfmw
	b	.L49
	.size	CASE_ResetChanWithOption, .-CASE_ResetChanWithOption
	.align	3
.LC44:
	.xword	.LANCHOR0
	.align	3
.LC45:
	.xword	.LC16
	.align	3
.LC46:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanConfig
	.type	CASE_GetChanConfig, %function
CASE_GetChanConfig:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L54
	ldr	x20, .LC49
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetChanCfg
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L53:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L54:
	ldr	x2, .LC47
	mov	w3, 251
	ldr	x1, .LC48
	mov	w0, 0
	add	x2, x2, 168
	mov	w19, -1
	bl	dprint_vfmw
	b	.L53
	.size	CASE_GetChanConfig, .-CASE_GetChanConfig
	.align	3
.LC47:
	.xword	.LANCHOR0
	.align	3
.LC48:
	.xword	.LC16
	.align	3
.LC49:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ConfigChan
	.type	CASE_ConfigChan, %function
CASE_ConfigChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L59
	ldr	x20, .LC52
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigChan
	cbz	w0, .L60
.L58:
	ldr	x1, [x20, 32]
	cmp	w0, wzr
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L57:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L60:
	mov	w0, w21
	bl	VCTRL_LoadDspCode
	b	.L58
.L59:
	ldr	x2, .LC50
	mov	w3, 267
	ldr	x1, .LC51
	mov	w0, 0
	add	x2, x2, 192
	mov	w19, -1
	bl	dprint_vfmw
	b	.L57
	.size	CASE_ConfigChan, .-CASE_ConfigChan
	.align	3
.LC50:
	.xword	.LANCHOR0
	.align	3
.LC51:
	.xword	.LC16
	.align	3
.LC52:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetStreamIntf
	.type	CASE_SetStreamIntf, %function
CASE_SetStreamIntf:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L64
	ldr	x20, .LC55
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_SetStreamInterface
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L63:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L64:
	ldr	x2, .LC53
	mov	w3, 318
	ldr	x1, .LC54
	mov	w0, 0
	add	x2, x2, 208
	mov	w19, -1
	bl	dprint_vfmw
	b	.L63
	.size	CASE_SetStreamIntf, .-CASE_SetStreamIntf
	.align	3
.LC53:
	.xword	.LANCHOR0
	.align	3
.LC54:
	.xword	.LC16
	.align	3
.LC55:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetStreamSize
	.type	CASE_GetStreamSize, %function
CASE_GetStreamSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L68
	ldr	x20, .LC58
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetStreamSize
	mov	w19, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L67:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L68:
	ldr	x2, .LC56
	mov	w3, 334
	ldr	x1, .LC57
	mov	w0, 0
	add	x2, x2, 232
	bl	dprint_vfmw
	mov	w0, -1
	b	.L67
	.size	CASE_GetStreamSize, .-CASE_GetStreamSize
	.align	3
.LC56:
	.xword	.LANCHOR0
	.align	3
.LC57:
	.xword	.LC16
	.align	3
.LC58:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetChanIDByMem
	.type	CASE_GetChanIDByMem, %function
CASE_GetChanIDByMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L72
	ldr	x20, .LC61
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	ldr	w0, [x19]
	bl	VCTRL_GetChanIDByMemAddr
	str	w0, [x19]
	cmn	w0, #1
	mov	w0, 0
	ldr	x1, [x20, 32]
	csetm	w19, eq
	blr	x1
.L71:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L72:
	ldr	x2, .LC59
	mov	w3, 363
	ldr	x1, .LC60
	mov	w0, 0
	add	x2, x2, 256
	mov	w19, -1
	bl	dprint_vfmw
	b	.L71
	.size	CASE_GetChanIDByMem, .-CASE_GetChanIDByMem
	.align	3
.LC59:
	.xword	.LANCHOR0
	.align	3
.LC60:
	.xword	.LC16
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetDiscardPicParam
	.type	CASE_SetDiscardPicParam, %function
CASE_SetDiscardPicParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L76
	ldr	x20, .LC64
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_SetDiscardPicParam
	mov	w19, w0
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L75:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L76:
	ldr	x2, .LC62
	mov	w3, 380
	ldr	x1, .LC63
	mov	w0, 0
	add	x2, x2, 280
	bl	dprint_vfmw
	mov	w0, -1
	b	.L75
	.size	CASE_SetDiscardPicParam, .-CASE_SetDiscardPicParam
	.align	3
.LC62:
	.xword	.LANCHOR0
	.align	3
.LC63:
	.xword	.LC16
	.align	3
.LC64:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetPtsToSeek
	.type	CASE_SetPtsToSeek, %function
CASE_SetPtsToSeek:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x21, x1
	mov	x0, x30
	bl	_mcount
	cbz	x21, .L81
	ldr	x20, .LC67
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	str	wzr, [x29, 56]
	mov	w2, 1
	add	x1, x29, 48
	mov	w0, w22
	stp	w2, wzr, [x29, 48]
	bl	VCTRL_ResetChanWithOption
	cmp	w0, wzr
	csetm	w19, ne
	cbz	w19, .L82
.L80:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L79:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L82:
	mov	x1, x21
	mov	w0, w22
	bl	VCTRL_SeekPts
	cmp	w0, wzr
	csetm	w19, ne
	b	.L80
.L81:
	ldr	x2, .LC65
	mov	w3, 397
	ldr	x1, .LC66
	mov	w0, 0
	add	x2, x2, 304
	bl	dprint_vfmw
	mov	w0, -1
	b	.L79
	.size	CASE_SetPtsToSeek, .-CASE_SetPtsToSeek
	.align	3
.LC65:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	.LC16
	.align	3
.LC67:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetTrickMode
	.type	CASE_SetTrickMode, %function
CASE_SetTrickMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L86
	ldr	x20, .LC70
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigFFFBSpeed
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L85:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L86:
	ldr	x2, .LC68
	mov	w3, 423
	ldr	x1, .LC69
	mov	w0, 0
	add	x2, x2, 328
	mov	w19, -1
	bl	dprint_vfmw
	b	.L85
	.size	CASE_SetTrickMode, .-CASE_SetTrickMode
	.align	3
.LC68:
	.xword	.LANCHOR0
	.align	3
.LC69:
	.xword	.LC16
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetCtrlInfo
	.type	CASE_SetCtrlInfo, %function
CASE_SetCtrlInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L90
	ldr	x20, .LC73
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_ConfigPVRInfo
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L89:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L90:
	ldr	x2, .LC71
	mov	w3, 439
	ldr	x1, .LC72
	mov	w0, 0
	add	x2, x2, 352
	mov	w19, -1
	bl	dprint_vfmw
	b	.L89
	.size	CASE_SetCtrlInfo, .-CASE_SetCtrlInfo
	.align	3
.LC71:
	.xword	.LANCHOR0
	.align	3
.LC72:
	.xword	.LC16
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_AllocMemToDecoder
	.type	CASE_AllocMemToDecoder, %function
CASE_AllocMemToDecoder:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L98
	ldr	x20, .LC76
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_AllocMemToDecoder
	mov	w19, w0
	cbnz	w0, .L99
.L94:
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, w19
.L93:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L99:
	ldr	x1, .LC78
	mov	w0, 1
	bl	dprint_vfmw
	b	.L94
.L98:
	ldr	x2, .LC74
	mov	w3, 464
	ldr	x1, .LC75
	mov	w0, 0
	add	x2, x2, 376
	bl	dprint_vfmw
	mov	w0, -1
	b	.L93
	.size	CASE_AllocMemToDecoder, .-CASE_AllocMemToDecoder
	.align	3
.LC74:
	.xword	.LANCHOR0
	.align	3
.LC75:
	.xword	.LC16
	.align	3
.LC76:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC78:
	.xword	.LC77
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_GetUserDecFrame
	.type	CASE_GetUserDecFrame, %function
CASE_GetUserDecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L103
	ldr	x20, .LC81
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetUsrdecFrame
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L102:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L103:
	ldr	x2, .LC79
	mov	w3, 504
	ldr	x1, .LC80
	mov	w0, 0
	add	x2, x2, 400
	mov	w19, -1
	bl	dprint_vfmw
	b	.L102
	.size	CASE_GetUserDecFrame, .-CASE_GetUserDecFrame
	.align	3
.LC79:
	.xword	.LANCHOR0
	.align	3
.LC80:
	.xword	.LC16
	.align	3
.LC81:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_PutUserDecFrame
	.type	CASE_PutUserDecFrame, %function
CASE_PutUserDecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L107
	ldr	x20, .LC84
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_PutUsrdecFrame
	cmp	w0, wzr
	ldr	x1, [x20, 32]
	mov	w0, 0
	csetm	w19, ne
	blr	x1
.L106:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L107:
	ldr	x2, .LC82
	mov	w3, 520
	ldr	x1, .LC83
	mov	w0, 0
	add	x2, x2, 424
	mov	w19, -1
	bl	dprint_vfmw
	b	.L106
	.size	CASE_PutUserDecFrame, .-CASE_PutUserDecFrame
	.align	3
.LC82:
	.xword	.LANCHOR0
	.align	3
.LC83:
	.xword	.LC16
	.align	3
.LC84:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_ReportOccupiedFrame
	.type	CASE_ReportOccupiedFrame, %function
CASE_ReportOccupiedFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L115
	mov	x1, x19
	mov	w0, w20
	bl	VCTRL_ReportOccupiedFrame
	mov	w19, w0
	cbnz	w0, .L116
.L111:
	cmp	w19, wzr
	csetm	w0, ne
.L110:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L116:
	ldr	x1, .LC88
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	b	.L111
.L115:
	ldr	x2, .LC85
	mov	w3, 564
	ldr	x1, .LC86
	mov	w0, 0
	add	x2, x2, 448
	bl	dprint_vfmw
	mov	w0, -1
	b	.L110
	.size	CASE_ReportOccupiedFrame, .-CASE_ReportOccupiedFrame
	.align	3
.LC85:
	.xword	.LANCHOR0
	.align	3
.LC86:
	.xword	.LC16
	.align	3
.LC88:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_SetImageOutputInfo
	.type	CASE_SetImageOutputInfo, %function
CASE_SetImageOutputInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L124
	mov	x1, x19
	mov	w0, w20
	bl	VCTRL_ImageOutputEnable
	mov	w19, w0
	cbnz	w0, .L125
.L120:
	cmp	w19, wzr
	csetm	w0, ne
.L119:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L125:
	ldr	x1, .LC92
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	b	.L120
.L124:
	ldr	x2, .LC89
	mov	w3, 583
	ldr	x1, .LC90
	mov	w0, 0
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, -1
	b	.L119
	.size	CASE_SetImageOutputInfo, .-CASE_SetImageOutputInfo
	.align	3
.LC89:
	.xword	.LANCHOR0
	.align	3
.LC90:
	.xword	.LC16
	.align	3
.LC92:
	.xword	.LC91
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CASE_HandleEntry
	.type	CASE_HandleEntry, %function
CASE_HandleEntry:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 8
	beq	.L137
	ldr	x1, .LC94
	mov	w5, 1
	mov	w6, 33
	add	x1, x1, 504
	b	.L128
	.p2align 3
.L151:
	add	x0, x1, x0, lsl 3
	uxtw	x7, w5
	cmp	w20, w6
	lsl	x4, x7, 2
	sub	x4, x4, x7
	ldr	x6, [x0, 8]
	lsl	x4, x4, 3
	cbz	x6, .L129
	beq	.L130
	ldr	w6, [x1, x4]
.L128:
	uxtw	x4, w5
	cmp	w6, 45
	lsl	x0, x4, 2
	add	w5, w5, 1
	sub	x0, x0, x4
	bne	.L151
.L129:
	cmp	w20, 4
	mov	x6, 0
	ccmp	w20, 15, 4, ne
	ccmp	w20, 1, 4, ne
	cset	w0, ne
	cbz	w0, .L135
.L127:
	cmp	w21, 31
	bhi	.L134
	ldr	x0, .LC97
	ldr	x0, [x0, w21, sxtw 3]
	cbz	x0, .L134
	ldr	w0, [x0]
	cmp	w21, w0
	bne	.L134
	cbz	x6, .L135
.L136:
	mov	x1, x19
	mov	w0, w21
	blr	x6
.L152:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L130:
	cmp	w20, 4
	ccmp	w20, 15, 4, ne
	ccmp	w20, 1, 4, ne
	beq	.L136
	b	.L127
.L134:
	ldr	x1, .LC96
	mov	w3, w20
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L152
.L137:
	ldr	x6, .LC93
	b	.L127
.L135:
	ldr	x1, .LC99
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L152
	.size	CASE_HandleEntry, .-CASE_HandleEntry
	.align	3
.LC93:
	.xword	CASE_GetChanState
	.align	3
.LC94:
	.xword	.LANCHOR0
	.align	3
.LC96:
	.xword	.LC95
	.align	3
.LC97:
	.xword	s_pstVfmwChan
	.align	3
.LC99:
	.xword	.LC98
	.global	VDEC_CID_HandlerTable
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.11859, %object
	.size	__func__.11859, 18
__func__.11859:
	.string	"CASE_SetFrameRate"
	.zero	6
	.type	__func__.11871, %object
	.size	__func__.11871, 23
__func__.11871:
	.string	"CASE_SetFrameBufferNum"
	.zero	1
	.type	__func__.11890, %object
	.size	__func__.11890, 23
__func__.11890:
	.string	"CASE_StartLowDelayCalc"
	.zero	1
	.type	__func__.11737, %object
	.size	__func__.11737, 19
__func__.11737:
	.string	"CASE_GetCapability"
	.zero	5
	.type	__func__.11746, %object
	.size	__func__.11746, 20
__func__.11746:
	.string	"CASE_GetChanMemSize"
	.zero	4
	.type	__func__.11754, %object
	.size	__func__.11754, 16
__func__.11754:
	.string	"CASE_CreateChan"
	.type	__func__.11774, %object
	.size	__func__.11774, 25
__func__.11774:
	.string	"CASE_ResetChanWithOption"
	.zero	7
	.type	__func__.11790, %object
	.size	__func__.11790, 19
__func__.11790:
	.string	"CASE_GetChanConfig"
	.zero	5
	.type	__func__.11796, %object
	.size	__func__.11796, 16
__func__.11796:
	.string	"CASE_ConfigChan"
	.type	__func__.11811, %object
	.size	__func__.11811, 19
__func__.11811:
	.string	"CASE_SetStreamIntf"
	.zero	5
	.type	__func__.11817, %object
	.size	__func__.11817, 19
__func__.11817:
	.string	"CASE_GetStreamSize"
	.zero	5
	.type	__func__.11828, %object
	.size	__func__.11828, 20
__func__.11828:
	.string	"CASE_GetChanIDByMem"
	.zero	4
	.type	__func__.11834, %object
	.size	__func__.11834, 24
__func__.11834:
	.string	"CASE_SetDiscardPicParam"
	.type	__func__.11842, %object
	.size	__func__.11842, 18
__func__.11842:
	.string	"CASE_SetPtsToSeek"
	.zero	6
	.type	__func__.11848, %object
	.size	__func__.11848, 18
__func__.11848:
	.string	"CASE_SetTrickMode"
	.zero	6
	.type	__func__.11854, %object
	.size	__func__.11854, 17
__func__.11854:
	.string	"CASE_SetCtrlInfo"
	.zero	7
	.type	__func__.11865, %object
	.size	__func__.11865, 23
__func__.11865:
	.string	"CASE_AllocMemToDecoder"
	.zero	1
	.type	__func__.11877, %object
	.size	__func__.11877, 21
__func__.11877:
	.string	"CASE_GetUserDecFrame"
	.zero	3
	.type	__func__.11883, %object
	.size	__func__.11883, 21
__func__.11883:
	.string	"CASE_PutUserDecFrame"
	.zero	3
	.type	__func__.11901, %object
	.size	__func__.11901, 25
__func__.11901:
	.string	"CASE_ReportOccupiedFrame"
	.zero	7
	.type	__func__.11908, %object
	.size	__func__.11908, 24
__func__.11908:
	.string	"CASE_SetImageOutputInfo"
	.type	VDEC_CID_HandlerTable, %object
	.size	VDEC_CID_HandlerTable, 744
VDEC_CID_HandlerTable:
	.word	8
	.zero	4
	.xword	CASE_GetChanState
	.word	100
	.zero	4
	.word	33
	.zero	4
	.xword	CASE_SetFrameRate
	.word	4
	.zero	4
	.word	1
	.zero	4
	.xword	CASE_GetCapability
	.word	148
	.zero	4
	.word	15
	.zero	4
	.xword	CASE_GetChanMemSize
	.word	128
	.zero	4
	.word	4
	.zero	4
	.xword	CASE_CreateChan
	.word	128
	.zero	4
	.word	5
	.zero	4
	.xword	CASE_DestroyChan
	.word	0
	.zero	4
	.word	11
	.zero	4
	.xword	CASE_ResetChan
	.word	0
	.zero	4
	.word	19
	.zero	4
	.xword	CASE_ResetChanWithOption
	.word	12
	.zero	4
	.word	6
	.zero	4
	.xword	CASE_GetChanConfig
	.word	144
	.zero	4
	.word	9
	.zero	4
	.xword	CASE_StartChan
	.word	0
	.zero	4
	.word	10
	.zero	4
	.xword	CASE_StopChan
	.word	0
	.zero	4
	.word	7
	.zero	4
	.xword	CASE_ConfigChan
	.word	144
	.zero	4
	.word	18
	.zero	4
	.xword	CASE_ReleaseStream
	.word	0
	.zero	4
	.word	12
	.zero	4
	.xword	CASE_SetStreamIntf
	.word	24
	.zero	4
	.word	13
	.zero	4
	.xword	CASE_GetStreamSize
	.word	4
	.zero	4
	.word	17
	.zero	4
	.xword	CASE_GetChanIDByMem
	.word	4
	.zero	4
	.word	25
	.zero	4
	.xword	CASE_SetDiscardPicParam
	.word	8
	.zero	4
	.word	30
	.zero	4
	.xword	CASE_SetPtsToSeek
	.word	24
	.zero	4
	.word	31
	.zero	4
	.xword	CASE_SetTrickMode
	.word	4
	.zero	4
	.word	32
	.zero	4
	.xword	CASE_SetCtrlInfo
	.word	20
	.zero	4
	.word	37
	.zero	4
	.xword	CASE_AllocMemToDecoder
	.word	72
	.zero	4
	.word	38
	.zero	4
	.xword	CASE_SetFrameBufferNum
	.word	4
	.zero	4
	.word	40
	.zero	4
	.xword	CASE_ReportDemuxRelease
	.word	0
	.zero	4
	.word	22
	.zero	4
	.xword	CASE_GetUserDecFrame
	.word	72
	.zero	4
	.word	23
	.zero	4
	.xword	CASE_PutUserDecFrame
	.word	72
	.zero	4
	.word	34
	.zero	4
	.xword	CASE_StartLowDelayCalc
	.word	4
	.zero	4
	.word	35
	.zero	4
	.xword	CASE_StopLowDelayCalc
	.word	4
	.zero	4
	.word	44
	.zero	4
	.xword	CASE_ReportOccupiedFrame
	.word	520
	.zero	4
	.word	43
	.zero	4
	.xword	CASE_SetImageOutputInfo
	.word	4
	.zero	4
	.word	27
	.zero	4
	.xword	CASE_ExtraWakupThread
	.word	0
	.zero	4
	.word	45
	.zero	4
	.xword	0
	.zero	8
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"Not care param %p\n" )
	.zero	5
.LC11:
	ASCII(.string	"Not care param %d %p\n" )
	.zero	2
.LC16:
	ASCII(.string	"invalid condition: %s %d\n" )
	.zero	6
.LC26:
	ASCII(.string	"Not care param %d\n" )
	.zero	5
.LC35:
	ASCII(.string	"call VCTRL_GetChanMemSize failed ret:%d\n" )
	.zero	7
.LC42:
	ASCII(.string	"VCTRT_SetChanCtrlState ERR: %d\n" )
.LC77:
	ASCII(.string	"VCTRL_AllocMemToDecoder failed!\n " )
	.zero	6
.LC87:
	ASCII(.string	"VCTRL_ReportOccupiedFrame[Chan %d] failed!\n" )
	.zero	4
.LC91:
	ASCII(.string	"VCTRL_ImageOutputEnable[Chan %d] failed!\n" )
	.zero	6
.LC95:
	ASCII(.string	"Chan id:%d is invalid %d Cmd ID:%d\n" )
	.zero	4
.LC98:
	ASCII(.string	"Unsupport eCmdID %d\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
